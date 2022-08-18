import * as dotenv from 'dotenv';
import createError from 'http-errors';
import express from 'express';
import path from 'path';
import cookieParser from 'cookie-parser';
import logger from 'morgan';
import { startUnleash } from 'unleash-client';

dotenv.config();
const app = express();

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.get('/', async (req, res) => {
	const unleash = await startUnleash({
		appName: 'my-app',
		url: process.env.UNLEASH_URL,
		customHeaders: {
			Authorization: `${process.env.UNLEASH_TOKEN}`,
		},
	});

	const isMangopayEnabled = unleash.isEnabled('EnableMangopay');

	res.send(
		[
			'Hello',
			isMangopayEnabled ? 'Mangopay user' : 'other payment provider user',
		].join(', ')
	);
});

app.listen(process.env.PORT);
