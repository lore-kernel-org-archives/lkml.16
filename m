Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010009.outbound.protection.outlook.com [52.103.68.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612BB23E337
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026306; cv=fail; b=mAmh0LvQIE1AIE05+gjQ0slgseORjtN+JoD1oHapu/7KIzHd0Bk3wDqrwvAo/7xwX8P5lVnUnRMDu0k1jFPO4UxyRnG5Z6FZQo7sf9Kq6SyoxorU3PW+zn/69kwSx1L+KCvO6EVYxvLafvaqCJ7ce3YflKUZhiqYUJJ50ZWut+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026306; c=relaxed/simple;
	bh=dCVN/lvMTHwCWomchIfVnCnFwpbXaw/FSxRvYrSYJoo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qJYazJ/Ung/tO+CvX8tTR8AihanrRbRKy9lksaqZ0iNx/YkMrkfnUsX+Xf+1dJuSM4afWF7PVsuFWUKCvwjVTO039cAlUfcl2Np7iXEdzrVjYeVM7WtiHGipm2m3gWBTWZzYipz1PfhKV26qOrPoT7m5oa3JSNH7efgI5sf2EXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=K9scPMaH; arc=fail smtp.client-ip=52.103.68.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="K9scPMaH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PecLTaZlJIp1G4cjy179lVb7rrTcnWEprT8I3LDa+El62e0oMh1xPk0ciDfHSBJ6czpB/W4nO6+ADX/A4yLr6MaLM6eL/5kb/u4pA3k0FJw36RwahHB39zPJVgBENXtz5FhF747Ar2jin2FGkKut2X4s1exRwsIzyC7dLgcC1Fm9wjllFCXzPdPKwQ35YuuGOlB1jSp2jGgIvWInuqEgCVnZB9esaoAkGxJ/iVWw9C0Mahnl8/E0tuNwR6KFZQl08Ggu3XoRJKGJm3wrN0Yt9tthIh4rCxkKcTUz/Emy0XRqrQU1I78KYY2upZLYo6RnS78jLvBwwSqIhkQOqci0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lu7w33FrexnacfROTtxLtzlCCaEuJsajCM2NkpMcRtQ=;
 b=d9AAXblbvRm4rKcnhG3WB/JG/KxqIyYmLKg7ccUz1shMi2JySo49MT+u56UBj8XgKzHhUYbkwz1T7TunGFTb4iK5rKg3AYYehzACoZ5k1YvWj7mSUM9tNCW7F9GZEYBbTWjl0lnCsUwittUF/QJKDJZxLqrILJ7s7sM/ZCdDOJ8FN9izjI7/qqzCQit9w4JJQGCj92FBUk97ZFoSft7WdBxrnwnfHvVaQjVPQJ46p80k7NvckJoqjdCxavJdEwH7rLHci1ZsZC2kBVgwOsqEXTM+ak8zlMWvhzWOQckAzpga4xTFLbXms2NyB5fjKsf4rJo4uGF6+rgJd//kNTQHmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lu7w33FrexnacfROTtxLtzlCCaEuJsajCM2NkpMcRtQ=;
 b=K9scPMaHEsitSbdo04UWPvzGDZqil3RsRJ+TMvoljMIDI8I2q+fIcmdqG7HSk06NCUmCm8VC8t/RU/aqS91IMe3grb/FdVxMCznvy5WnPzf/YaQNkwJaaAcLUMZkQlfftzFjWu8m3OcDj9yE4kBtLqFaaMnKYxC/VbvR+x2f9/Do1f2xjf2A6rUAOU28W5A3sjbjfbGPKlY8xqNJdmv98GS4U2Bm8Ut6Pbim9agIqsIlfmAVfNUZCWFpSa4Mq9BdQKroMJhbcqKno3Xs/0LN2Jdj9qWuHt4mfkFVa1/LftHY27cgmtD3arYYR9ujO6dbSfQJ8jMF788HrdjtzmtrUA==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN2PPF1C1161043.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::109) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 11:44:49 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%4]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 11:44:49 +0000
Message-ID:
 <MA0P287MB22627252785BD5C0A52FC674FEAA2@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Mon, 7 Apr 2025 19:44:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irq: sg2042-msi: add missed chip flags
To: Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250405055625.1530180-1-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250405055625.1530180-1-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <91a940c1-b832-453a-a180-611768f8409f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN2PPF1C1161043:EE_
X-MS-Office365-Filtering-Correlation-Id: e00e9844-895a-4e5a-37a5-08dd75c99a09
X-MS-Exchange-SLBlob-MailProps:
	vuaKsetfIZkOVoj0UqpnLtxcZHTVbEDr99jEKJcF0QL4yWkLKtePEq0F9tNi+RwN5k+5DWZI6lHke9YnVAz+Q/lyfoRBqffb4z+YRNt+yBcrbVFR3X+tW2Bp/CRsNFyhE5Ab3DH1OGUYbKW4b2ZOFjeUjNullFpGE5ephwrqZD4Iwz6xmj7CTeOpQC/k09Qr5Tacmyh18X43aMI0VF1VdKYF4cYJz9dpERIgnZ6yDSXc3ajh8XuOeCJ9agkeCqZ5whZAqPdu3Zs61fQ7RrKCIcpphL3SN/iJA39b6GSXpeDXJthPIZhYKPPc0rIHq42tvUcwQO02n7H04qmcBtuxh7GhakzHJNdXgRhrzvOvtcd7DbBMkiHFS812aLfSRwo1dRg9wcTGhALPsKgvsjn5bZ0RPGikE5dpU8SosXW8mx1iXg+sbXHogf4arojvrGse5V07p8IduLaGYGj+y6q2KacHsUYH31jhLhnCnTs8xbOLq5EmDV94jikyqv0YvHBFVTMWLxMq9qvqSWkGNc6xXzRLqL1US4huchmix9RXGxPKpGRrEpQi8W+G5HbEprsBkYzW94VMfRm9DcNOhSU7LLajbwTu3CQIc5mQVeB9eH73hWMXjCuDhvMcgAVvVtwLx55Q+NzSdESC1zi/nqT0rYZvlZls0N/6yAQOsDmZWYjUBoojq7qcSFAZKWtkA+tbQzx9WN/KirH0xRAgongU0XXmTwrOO50nMHFRYNqlqP1/FrXCDnvtUm2K9HfkCXoTSGyJQ1w5hWmHJmkdGT1UpXsVEGbWI6PnAwIf8lp+P7vG7ookm2FLY4WAVxDfPr3S
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|7092599003|8060799006|5072599009|19110799003|6090799003|461199028|1602099012|440099028|3412199025|4302099013|10035399004|19111999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGVmTDdaWFd0K2ZnNHBpQkFGVDBvSzROT1hNQkR5cTBoQzhiY1dEelIxNXNs?=
 =?utf-8?B?SE5McXA4eU1US016azF2akE1Q1NIUHZOVjlHcHdWcGd1aXhVSnlCVVBQaDFp?=
 =?utf-8?B?TWJvOUtiZ2tJcHpLOWpMeDJ5WUdiM0N6YzNOSU5PWmc2TzVYSVp6aDYxQXA3?=
 =?utf-8?B?REpoVmdoeHAwa25odGdnbFFuNEppQXhvTXNLSHdiQ0NzNHAwZG1pVkNmZnEy?=
 =?utf-8?B?bStlSlFCa3JIUzY4SUVzSDE0R1huUm1JczRUdGxxNmxCa1p1ZCsxUktzMjlL?=
 =?utf-8?B?OG5MeEROMGxtamVxQmdMaTVmZE9hemZXTGNCOHk1KzNzZTlnMUhSZzdaZU5V?=
 =?utf-8?B?M2RCUURIYlVNUFNUUHlVbVAzeExTb0ZyaDF4OFV2cUZYZXlrcjZ5aUZIRSs4?=
 =?utf-8?B?ckxQYnlaODBuOGNwek9yam9JT3crdldUOWkvSkhEWGZhZjRDMjdESUJyZ3cy?=
 =?utf-8?B?amQ1KzBnOWpwMmZGRTlaY0hpalZCVzEvaTdtZGdjUU9CY1UzbVUrNGExeXNF?=
 =?utf-8?B?djdrbEJzd1I2UlFZVEZnUnNnd0lXRUVTQ2FOOGR3WVlSd0JhMXkyKzNuOVRX?=
 =?utf-8?B?WFFHL0hCdlhhMEprckJGRWx6UGxQL0NFVjBSei9qakh2M1p6RUFjalN5SFZj?=
 =?utf-8?B?M2I1aHZOSTE4ampBS1VYOXh1NXBOMGFhN0pVeEF4TDZOWVlHbHQ2MUs3ZEtw?=
 =?utf-8?B?NW92M3p3KzlVSkVDTzNyTEt4M2hJbFV4S3A0aUszMUlVZWlLNHFqUVo5KzM1?=
 =?utf-8?B?ZlhyK0hCdVVORG5OeFFxWkc2RGcvRlhqTTBzTXdlV2dyYUc5U0g5a080REww?=
 =?utf-8?B?Tk1NTmdNM1NxSmY0U05RejVxOFNqRjNLbjlYemRKb3E5eHgzZEZSM1BMSkpC?=
 =?utf-8?B?L2h0ZTJLd1BVRUZYOG4vSjgvSkp2MnRlMGMwTEUrUFlnMGN1Um1wOFRhNXVi?=
 =?utf-8?B?bERLWVJrS0JIajQ1dExjd1lxMTFpTTcxNVlaVmxFYkM0OGMvV2Z5U09IeUJS?=
 =?utf-8?B?UWNBdlIxVjlpVTJNcTVTT2xWTTYrMlJreFRIb09YK2VxV0RrbFVsL3o4blFI?=
 =?utf-8?B?bVJSZGdweXJmeUwwWnZReXRaU1U5QnJJVGRMdTJCVWJYNWNRWmlnanVmMmw0?=
 =?utf-8?B?djNyTjVYcXdBaFJqakF2WGJpeGhUVGsxZ21TVDBPNDZCMWhabm81QXgxTXlo?=
 =?utf-8?B?SE5NM1hqNlpEeUxpbDltdHZaUlc3NG1OMlNTKy9NSnlMcVBDaWxBYW9HWVlK?=
 =?utf-8?B?OEF6aHNsYURPdWliOXpqVlQ4N0hOZHJsZXB6SXFwYWFuNE1IQzRtdHpLeXVE?=
 =?utf-8?B?NEdRV2xxWDIxdFlHTEcxK2hUKzllWUlNdUh2QkZLeThoa3Z4TkFCdTlLeFNB?=
 =?utf-8?B?cjFkMExWTjM5aEtwRytrNmZnRUUyVGkzOUM2VWNKZmRvR0EwRUZIZW9nQWMz?=
 =?utf-8?B?NXVSOVVIYk1VNHZRaENQRTF5QVVGRmFtZGFZQUY5eUl4czh4clpoc1dXdVo4?=
 =?utf-8?B?UVdXdTFLUkdFT2RMUy9iQkxQbjBTZW9ISzQ5cjd6UHc4NGN3UGs2d1M1d3Zw?=
 =?utf-8?B?WjRBZ2lOWlF1MGpaL1NYRzNzU3MzZzEwWGtybU9YM0xDU2hqZlZ2U2lqYnQ2?=
 =?utf-8?B?UXFyUnNRUEFNa29RUTRBOUptWnVWVXFHVXVUK0ErY0VWK2pXeFJkcHQ0dXlN?=
 =?utf-8?B?ZEFoN091K1hmOFlzRU1scXZYdTN3TmhLSW1rdVJHV1k4eVF0QUlrVjRsaDhu?=
 =?utf-8?B?T1VhbEY1dncxNVJpMXRMKzJZdi91YzdwVzF4VjljY01kTDBxYk5qdGN5QjZR?=
 =?utf-8?B?UVU4U1JEcFNCNzhHVTBXQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXNmVWZaQktPdEUrcHJhVG5MYWNETUtXZXovZkY2RXg2Zkh6b1Fpb21ySWo4?=
 =?utf-8?B?V0w4NC9hS1diM0F0SCtHSTlRcWFoMjJYUjRlU2UxazFJcTIyUGs4M2o1N2Nh?=
 =?utf-8?B?WWZnQmVoSEVUYlVIYjNsT0R3ckJPQjkwYkM0bS9CcllyYi9PQ2IrODhyZDVm?=
 =?utf-8?B?ajEyM0cxYWVIRDdpUE1oeUpIYm5Vd0h2UnRFNU03c3ZUQW5DKzV2NmdqM3M2?=
 =?utf-8?B?dko1NktzeCswa2J6b0I4SW1ya1pnQ096VHRnYVNJMndtcXBDUk1KeVdhSWN1?=
 =?utf-8?B?MmhrTlRTZktpd0taNDZ1dGs1RlpFUXBvRzBpbnFDckh6blgrR3lCakkzb0F6?=
 =?utf-8?B?dGJ4ZHFRMWhOT1BDU0pSQlYxTW9qK25zVU5lR3VCaVlBWEJ1N3BSdFVraXdH?=
 =?utf-8?B?U0tQNUs5dGNIdExReFZIay8zR3Z4Z2I1UldCVWQxTzNEdTN4WDlXRUFIVkxk?=
 =?utf-8?B?ajUrLzRPSG9LVnB2SEdXOXcyWDZ4SmFhQmdwbzN3UFFiYytiaytCWVp4R3J0?=
 =?utf-8?B?eEZVUWVqRCt4ell1VkY2TGtOTUdaRkhRU2tja1FscVhaY09DbXpIRHRpMk0v?=
 =?utf-8?B?dWZNSnV1MDgxRllVakl3OHlFZnhtTERhS2R1MzRyWE1JT1ZtNnIxNG9EMCtW?=
 =?utf-8?B?TEU5aDl4SGkyL0w0M0ZtbWNVUFNmTGRpaXVpMjYwUTFKMjducldXKzdKRkYw?=
 =?utf-8?B?SzhHcGFRQ1lxWm1EbU9EWmZLSzZLY1pSVmRzcGZSMUhlMXZGbFBLYUdBckdO?=
 =?utf-8?B?blhZT2kyMTJ1T2Q0R0cxcUEwbXJzWVhpZklTemovdk51NHV5SXdpd0h4WXJ3?=
 =?utf-8?B?RkVTcmU3b1oxRW5nVS84VkNyN2tUYXZDUERVMldGVGc4U2JialE0NGthcnJz?=
 =?utf-8?B?UE0rN0sxLzNzR2RaNGxqTUJMUzNhUnY2Y040RThaVEtyaXZQV0V4SC9nbWw4?=
 =?utf-8?B?aTZZNDl4eDY5eVA1OVh3bEpBdVpBbTJUMzZWVSs3dzRna2U3a3MvZVdCd2Z5?=
 =?utf-8?B?WjJPMVk0Qk5INEM4L281U3BDdi96dWhUR09lUDRzTjZoMy9BQmt1T2V5LzQ3?=
 =?utf-8?B?c0owMWlCbjVGZlJFOEpTVENianBpS2hNbkVleWhhbGMrOUU0aGpzcmdPemFL?=
 =?utf-8?B?SXlxRnBJamt0Q1dsOWJraFkwVGtSVjUyVVBzcGdSSWNoYnRCV2VHNmt4SWh0?=
 =?utf-8?B?QkRZdndyVTQvY0JwTDhUUllXdEpLMnYxeGIxeUFaZFBKMlBFWEFvWC82VjlM?=
 =?utf-8?B?RjJZckRsdGFaR2N3RW5NSUl6emJlN25XQm5mSUgzb3VidkdTTitCeGtoMG5S?=
 =?utf-8?B?czJ6RjN6elkrbERmRVFWTnkrYi9ZZnVWS1dFZmRJZTNQeVlmYXptSVhyREdP?=
 =?utf-8?B?RTZ2WStmQnhSQ1o5Zk1XTGVNSis2TUpZNk4yQjIxZW9xMnZSTjVTczc2UldF?=
 =?utf-8?B?TGkwd3A4NXljNHM2RXRVU1o3T2RHL0tUZ1ZVTzJOdWFDQ1BvbEloU1A3UGlq?=
 =?utf-8?B?T2poRUdpR09UdmgxT3JEVktMSG5yeThIN1Irci9SL2RtRHRRVHdHMTYvQVM0?=
 =?utf-8?B?K01DdVZ4ZEI1bkwwU0xCU3pzNGFvcFJHdWoxV1N4MVEvclBQMkEyVksrOVFh?=
 =?utf-8?B?ZkFBc3VaNGRnUkk2MU40RHFXQnpZRnJTdmN4TTc2R1orRDBmOW1mdkJXR2l1?=
 =?utf-8?B?THBaRTRzNXBvWE43RW0vMDkzb05NQU1pKzQrN3VsMzBmalFCM3YzVkRUbU8w?=
 =?utf-8?Q?awrcoEkpz87eWmQrsQ3iRNJHU/VsjH53TxT6wJW?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e00e9844-895a-4e5a-37a5-08dd75c99a09
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 11:44:49.4286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF1C1161043


On 2025/4/5 13:56, Inochi Amaoto wrote:
> sg2042-msi driver used fallback set by msi_lib_init_dev_msi_info()
> As commit 1c000dcaad2b ("irqchip/irq-msi-lib: Optionally set default
> irq_eoi()/irq_ack()") changes the behavior of the default fallback,
> which break the driver and causes NULL pointer dereference.
>
> Add necessary chip flags of msi_parent_ops in this driver to fix it.
>
> Fixes: c66741549424 ("irqchip: Add the Sophgo SG2042 MSI interrupt controller")
> Link: https://lore.kernel.org/all/20250217085657.789309-3-apatel@ventanamicro.com
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Reviewed-by: Chen Wang <wangchen20@iscas.ac.cn>

Tested-by: Chen Wang <wangchen20@iscas.ac.cn>

Thanks,

Chen

> ---
>   drivers/irqchip/irq-sg2042-msi.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
> index ee682e87eb8b..375b55aa0acd 100644
> --- a/drivers/irqchip/irq-sg2042-msi.c
> +++ b/drivers/irqchip/irq-sg2042-msi.c
> @@ -151,6 +151,7 @@ static const struct irq_domain_ops sg2042_msi_middle_domain_ops = {
>   static const struct msi_parent_ops sg2042_msi_parent_ops = {
>   	.required_flags		= SG2042_MSI_FLAGS_REQUIRED,
>   	.supported_flags	= SG2042_MSI_FLAGS_SUPPORTED,
> +	.chip_flags		= MSI_CHIP_FLAG_SET_ACK,
>   	.bus_select_mask	= MATCH_PCI_MSI,
>   	.bus_select_token	= DOMAIN_BUS_NEXUS,
>   	.prefix			= "SG2042-",
