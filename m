Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011031.outbound.protection.outlook.com [52.103.43.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECDB19F11B
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747984071; cv=fail; b=R5ueE2e5Ext1Bv4X7GQOqulzNV5p5iVUKP/Nrp6VU8LTEsG2bH9fFVU0s+6D87mwt/lCAYspmaf3AtcdbLmcgbYSoypIDCB1TsDeFNi0LSdDtWDk+6YpoeEkEm7+Qnsi48u4O4BcQUcPzn9orynclWcLqZ1tRkhdENbsPv2MfOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747984071; c=relaxed/simple;
	bh=YBeyXefmqsmS3I4ocSH9IzVWeWYoSwqPzP8SOjcHnoQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qPRjOB8Wzi2xWT7pc7iEyBYzPQGW9MtkgTITMwsO+rzxDbCpEmygxdJKG9CbGaEqWok0LzFyIbUTl1P9u907JNeItGLpQbM6U7pxUoC+9PT2BI2CiD+thBpZd/feztEYrDMz1pWQySoUPvXojK1jwkP35HG1OjG4acd1DljIBkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=b5FVns+P; arc=fail smtp.client-ip=52.103.43.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="b5FVns+P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wl1A/4xHw9QZ5+Xdf9SbTyhwB0T0JhF872kEQ0e1rZon1bGC1pZzk1sBmGtrd8duPPTYf7BVSBdbj9RR+ouZmwiZP9Sp5fdF0GQfRh+ppSb96u2LQlkt1AgwwZuK1yj7ruK2F8B2X3KeJiDAIDzvoBEP+kBMdl71cb5oQsG1Jhb+qV+eQ7RXBa+wieupLGPCV0L2fFEKZfpK8Hr7GAT2BLK38W4fmZH87+TdSpkt7YRTtJ0k8H5VerSpeR2FF3wxu0zlJklrI71vBRi+FphQ1OBgQm6yzILQGaHqLHQ6YFv8aGa9k5CbQTHVd2VuPqiEXLNUmfis/Ae+cDzaW39kPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oDSxSOVcZKKggE3U0VP3TJx21UY7/dfAajWl1txdbw=;
 b=PQMR6oM3irvtNTBg8G0vXEYEqOqM/surNdzyp0ja2Fk58AMoVnTrg2PqpvoyZ+NlL+HKeHuTK9zkOTA9ZzMBWuTX5XSh8xxJCPRzwbXSIGL3cZpzAb/zFU4ir6L8H2Qem/X4+noytiq1ae4W5rNmSuSkm9hwWA4vVPIz8GrgJMEeKhonmZ3uClkM3cRTB7YolpJtEXhQBp1wSMNkiSfiYidCyBw3t5u8AZG96peKw/Hu76Ny8bgGX7cVxRjjXRsH55eDRRpLhinTVBflCv6+YDkYkT/ugD7fLNZRIiiWpTupzuuc6U9aHQwC8IOPzjNd/DPj+pTMLHseRM/9hOr5tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oDSxSOVcZKKggE3U0VP3TJx21UY7/dfAajWl1txdbw=;
 b=b5FVns+Pg7uMXunVr5iJ3QJyT5b/YhulutjMrVaNw6fqFHlo93BH9S0p1yfnN4GL+6x7sV9UbgSJHKtdnoPf02jKP//39EY+XvFxB6c0amqXTHioT0MBVJ4iFyLS5lJ9wIKjk8QSq0A5j7wF0/8ocjWdifmzV5mK/lok+e0wN5foLUcUBGnZPchlk33DdAyf4AH+XZ3R70i9aIL7vZeVu9O/tgND5EGbB7a5PV43ArSyEph8p5+YoWe7cGdOMuXcs7YdVNFae1jroA3N6Uai8VqElnW/ynJi2BhAIF8hhFWbqWagGyoyoBIcIp8mlnY7X1mpp4OmkSNFslkZsL9j+A==
Received: from TY2PR01MB4681.jpnprd01.prod.outlook.com (2603:1096:404:11a::16)
 by TY1PR01MB10801.jpnprd01.prod.outlook.com (2603:1096:400:327::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 23 May
 2025 07:07:45 +0000
Received: from TY2PR01MB4681.jpnprd01.prod.outlook.com
 ([fe80::76cf:fe36:8692:a97e]) by TY2PR01MB4681.jpnprd01.prod.outlook.com
 ([fe80::76cf:fe36:8692:a97e%4]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 07:07:45 +0000
From: fengtian guo <fengtian_guo@hotmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH RT] Possible spinlock deadlock in kernel/sched/rt.c under
 high load
Thread-Topic: [PATCH RT] Possible spinlock deadlock in kernel/sched/rt.c under
 high load
Thread-Index: AQHbyWTxAVqe9dqvO0+SRErNLaK9CbPc5SLtgAA3T4CAAq2Yfg==
Date: Fri, 23 May 2025 07:07:45 +0000
Message-ID:
 <TY2PR01MB46816118EEA6A938320A3421F598A@TY2PR01MB4681.jpnprd01.prod.outlook.com>
References:
 <OSAPR01MB4675AD3FE11ED9C21055DE5AF59FA@OSAPR01MB4675.jpnprd01.prod.outlook.com>
	<OSAPR01MB4675D865C73A00D744FC4AA7F59EA@OSAPR01MB4675.jpnprd01.prod.outlook.com>
 <20250521095239.0b254e36@gandalf.local.home>
In-Reply-To: <20250521095239.0b254e36@gandalf.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR01MB4681:EE_|TY1PR01MB10801:EE_
x-ms-office365-filtering-correlation-id: b8e2e192-e948-437c-2f19-08dd99c88475
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8062599006|7092599006|15080799009|8060799009|6092099012|19110799006|15030799003|20055399003|4302099013|3412199025|440099028|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?big5?B?MUFWbjk5Y2Y0OU9BUmNrMUF1TURlNE1Gb3ZtTlRtdXVyR2VEMkI2Rml5ZGVDa0FT?=
 =?big5?B?NlNkYXJjVUUxV1BVVjNrVERRdUk4TS93M3pNOUlhT2xZcmlySHFNZXBDS1JmYVlq?=
 =?big5?B?UDFZeFltUndkcWpuaFg5cEtLRi82WlBvNGJWaWgrZnhaM2QxV0RQbGxQbDdkUngx?=
 =?big5?B?Zm5rMFJUMWszTHlOUGh1cU9zekVFREVsQkxTeGV4K2FpWmRhb3ZHcXF4OUc1TVZt?=
 =?big5?B?NmRLcmVTdkFrcTU4UCszSlByam1iNkwvZVJDcENzVlYrbi9EMHd0akYzNjFuWHZE?=
 =?big5?B?WGdsUE9MUjVWREpZeXdyV0UrNkNlbWxPYXlRODZVaXB1NHQ2QnB2OFRnTXVQT3ls?=
 =?big5?B?bEgxYTlESmdIOWEweU1leWloZ21sYVhyRDVrb1V3UzhhcEYrSHQxWDZuV3Y1R05y?=
 =?big5?B?ZWoxcEJnTVZkWkEzdy92M3NxbG1lMGREUFpsNEE5V25qNEk4R3dSK09uMFZlRWM1?=
 =?big5?B?bVFOdUlEYW1aaU9GaFhkNTFXN0NENkVXa1l4Q213N1lDUy9jWnRsekMwTTdGclll?=
 =?big5?B?YWdNSjFKRU9KbWE4OTJlblMrWFpDaVl2dUNJbUQ5WWc3blBwM29PbXZEZUliODMr?=
 =?big5?B?QWZJRTVFQjhDNkRudFo0NjQ0WFNMWnZYbjFxMnV3WS8rR01TcGlBWFNCem5vbEVr?=
 =?big5?B?Ym5rMVRkd3VheEJYRXo0TldzYUVEQXZhcGZkeFg4S1ZaVFN3azFQTkpwQ0ZhckJa?=
 =?big5?B?V0JEVVdPVHBDVFRCVVlBNDJsVWRDNk5pV0FVWlJqNnFmeWFGQjRMYjJHUmlENjVi?=
 =?big5?B?RkgyMytBSXZvQnd5c2JWZ2tvZXI1TjJVZ3Zkc2cvZU8vQ3hPN1Z5M2ovajBDQUpr?=
 =?big5?B?OE1tSEdYY2JtcGo3YWI1REg4YnRwa2tFd2h0S2w3Znc2MzFlS3g0SHJGVXUzdDh0?=
 =?big5?B?akdoUm1uR1FsaFppeVJKUnRuOS9nY3R1UEcxSXB4Um1ZVDZrRTUrRWZjYVZoeDY5?=
 =?big5?B?NlAvUnVGdnZoamJjTDYxNXgyUWRrT3J6SCtjVXRXaFBhZlZvZlVzS0F4YXJxbU5s?=
 =?big5?B?UC9Jakk4dm5GbFdXc211Z1kvTU01bHAxd3FiSkpicFZjWllLeG91b0ZyYllBTzFG?=
 =?big5?B?cHBxcExmem9iNjU4NHFBTTFCMVBnUnE4cC9mU0pRdXNyQTgrOHN3NDVoZ3FtOU82?=
 =?big5?B?cTVibGw2Wjk5Sk55K1dkMTlIU3BTOW83RUszZWFNSlNJa0kzaHZudXFUNWZvQ3Nh?=
 =?big5?B?aXlsbVpDMWRsMkJuMzZIQzBXSDEwWHpScy9aK1JSMkUrYWxtWDBpVFJnMkpseDQ1?=
 =?big5?B?RS9xZURJeGU2NzBndXNwOWU3Yk83WHdtRE1XQkFYdFVpVDdJV3ZHK2dyRkZKVUlM?=
 =?big5?B?V3NqelRmWkg1Q2pJKytEZ3U3eDJiMjhjZ2FnTGNKRUdaa0ROdWdsbmN5dTFtRWRv?=
 =?big5?B?Zi95MEZvb1B3TXZXaUZMajlZMFVYOGQ5MVNyZWJDSUpob2todXY1QjNOZmZheDNs?=
 =?big5?B?c21reFdhQk0rY2RocHdjZ1BZRUxZTFY1d3pNc2psdEh5Mm5hWkVsUmpQYlZOYndz?=
 =?big5?B?c3NEdHczUHdNUmFSWU05UHNva3l1VTA0bnRYQ2M5bE5IWXFET2JTYWhlYzI5Zm5S?=
 =?big5?B?WEo3bDBYcTV3UFBrS0g1bzRxTS9wOTA1b1o2YUs5Q1pjdWo1bW51QUtrbHlkSDFS?=
 =?big5?Q?FTLIe7ERcWdQpLo4PW4tL+QkcsQ=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?ZDJHd2tpNHZQcTdUeDNrQ1kzSzN6dnY4Q1VXQ0l3ZXJOTmFBR0JPZW5PUGMxTWdy?=
 =?big5?B?U3RJRFBJVEZvMHZ3NnhSYmZNbDlxRE44MkVscjJ0bnp3elBZWGZtemZqekxiQ3dU?=
 =?big5?B?cWdCNjZqSVF5S2RwMVhoakNKUjBGK3YzWHlXMHZTOFFKWVNSR1VsUi8xNUxEa3Y0?=
 =?big5?B?OThzQVpRcHl2eEh4TU1hMThpVExRYjJXQ1FEYW1paGdDQTZvZngxSkNGNUplNmRt?=
 =?big5?B?MFo2ejFEa2xWTUhGdWFUSmZ3eUU5V3dSazFmK1VJNzZxYjdnaUVzNndPdDdTckZH?=
 =?big5?B?L0UwZjhPS1VuOHlUNndzS0dDdkhRcFVQN21YdHM3ak1CamRSZEFFSkM2UTcvcVpD?=
 =?big5?B?SnhBMTMwZDdRZkZUZS8rQVk4WFp0QXM5UHJJbllPdDR6cGE3cVFua1h4RGRCbkd6?=
 =?big5?B?MDhLZDF2bHZEL1h1YWtWbWQrMGQ5ZndVV3VCQ2tTTS9XcVhudjBUSG5NOFVzT1c3?=
 =?big5?B?UG1wWVl6RWtRMlk0MElzYWVESm85c2NJQ29HZ3U4Q2VLMmUyK0RSdjQ1YkdwdFQ4?=
 =?big5?B?RWFoSnVMTGRuQUFYSjYwcnV2WHh5bXludlhJSy9RMnZHTzR3ZTVZN1dwMkg0MU9Y?=
 =?big5?B?b2RXOXdHMGw3RWJnYTYwUzBQY1hKOVg2RWYvNUVNenFYdkdDMk5SdTZwNlk3STY2?=
 =?big5?B?Z2JyNXlNdFhIYjJtL0tiSWlKbWpaNHlLdko0ZzI0d0JLK2xYa1VyOHNHZHBIQmN6?=
 =?big5?B?MHROdG8ycU5tVEtpTVV0OEI2andoM0JEaGNhRnNWZDRoVmtRV2RYQ1JrZTZvWGpQ?=
 =?big5?B?S3N4TTYyUkZvVUtFUXV6dEVDQlB5OVR5SGtvb2ljbVlrWHY4ZDVlRDg1Z0dPMEtF?=
 =?big5?B?emxPeTBYYmh3YldqaXcrQk5UN1BGOThTQUxzZ2lhcktDWXhuZW5VRy85aEJ5S0VW?=
 =?big5?B?Ni80Vk00NkQwVlcyZ2Iza3dQQmNsVSt6bHFHQVYrQjE2STJGLzAwMEtSdGJ6blFl?=
 =?big5?B?aHBRV29LTGs4OS9FRkJ1WGVsTHMwTVQ3T3d6dHB4S2pack1CVkhWUFRIY0ludlRL?=
 =?big5?B?dWZsdVArUHF1VC9VcnRZUXg1TGhjMG5Da3FCN1NOUGpWTUZhYWExQWw1TTB4VWlP?=
 =?big5?B?YVYwckcvMkQvSmF6OTJpcnJ5cXM3T21hSm9vb2pLNndHcVFCQ1R6MzFCeSs3cHY2?=
 =?big5?B?ejVlRGE1VVpaRzEwTVdSZ1A3cU9qdCtjN1dtRkxYYnNMUHFwNUlQTzNnbG9KUHB0?=
 =?big5?B?ME9rRWt1UFpFS1Q5QWM5WHQvZUNzYThoaGVyTFYrSGk4dHpsbTYrMEF6WjZPeWlx?=
 =?big5?B?WUw2Q3ZpOUZGTk4wOWNIYnpEbFFaYjhZb3hvVzRZUFJ2Zkc0cm5ZS21wQ0FMWk5M?=
 =?big5?B?eVFJNzU4TTNVN3BUSVNUTU9oNXVIaWpkZDA3OTZrQjFaaFVJbTVYcjVGdU9GbE9h?=
 =?big5?B?U1NFek5lbm5JU29sZ0V1T2tDSFl5eEkwVXUvZDhPMi9RNVNxTWdkWlhQTnM3bE9z?=
 =?big5?B?MEppK1VCUlNoVWwyclRzKzdiVis5WEIvb29IQkc0SkI2WlNOU1h1OEhNdkQzUy95?=
 =?big5?B?YzludHBibG5lclBWZWYvbHUvT09FL1dmMCtVbk1FdytMNGZYQ2F4LzZCMElpNUN1?=
 =?big5?Q?ETdsxtRgzI8=3D?=
Content-Type: multipart/mixed;
	boundary="_004_TY2PR01MB46816118EEA6A938320A3421F598ATY2PR01MB4681jpnp_"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-9a502.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB4681.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e2e192-e948-437c-2f19-08dd99c88475
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 07:07:45.0886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10801

--_004_TY2PR01MB46816118EEA6A938320A3421F598ATY2PR01MB4681jpnp_
Content-Type: multipart/alternative;
	boundary="_000_TY2PR01MB46816118EEA6A938320A3421F598ATY2PR01MB4681jpnp_"

--_000_TY2PR01MB46816118EEA6A938320A3421F598ATY2PR01MB4681jpnp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

DQpIaSBTdGV2ZSB5b3UgY29tbWVudCBpcyByaWdodCBhbmQgVGhhbmtzIHZlcnkgbXVjaA0KDQox
oV41LjEwIGtlcm5lbCBub3QgaW5pdCB3aXRoIElSUV9XT1JLX0lOSVRfSEFSRCBhbmQgdGhpcyBm
aXggb24gNi42DQpTbyB0aGUgYnVnIGV4aXN0IGZyb20gNS4xMCB0byA2LnggPyBzb21lIHZlcnNp
b24gb2Yga2VybmVsDQoNCmRpZmYgLS1naXQgYS9rZXJuZWwvc2NoZWQvdG9wb2xvZ3kuYyBiL2tl
cm5lbC9zY2hlZC90b3BvbG9neS5jDQppbmRleCAxMGIzODYxNjQuLmEzMDE0MzUzZiAxMDA2NDQN
Ci0tLSBhL2tlcm5lbC9zY2hlZC90b3BvbG9neS5jDQorKysgYi9rZXJuZWwvc2NoZWQvdG9wb2xv
Z3kuYw0KQEAgLTUxMyw3ICs1MTMsNyBAQCBzdGF0aWMgaW50IGluaXRfcm9vdGRvbWFpbihzdHJ1
Y3Qgcm9vdF9kb21haW4gKnJkKQ0KICNpZmRlZiBIQVZFX1JUX1BVU0hfSVBJDQogICAgICAgIHJk
LT5ydG9fY3B1ID0gLTE7DQogICAgICAgIHJhd19zcGluX2xvY2tfaW5pdCgmcmQtPnJ0b19sb2Nr
KTsNCi0gICAgICAgaW5pdF9pcnFfd29yaygmcmQtPnJ0b19wdXNoX3dvcmssIHJ0b19wdXNoX2ly
cV93b3JrX2Z1bmMpOw0KKyAgICAgICByZC0+cnRvX3B1c2hfd29yayA9IElSUV9XT1JLX0lOSVRf
SEFSRChydG9fcHVzaF9pcnFfd29ya19mdW5jKTsNCiAgICAgICAgYXRvbWljX29yKElSUV9XT1JL
X0hBUkRfSVJRLCAmcmQtPnJ0b19wdXNoX3dvcmsuZmxhZ3MpOw0KICNlbmRpZg0KDQoxoV5XaXRo
b3V0IGZpeCBhbmQgdGhlIGNhbGxzdGFjayBpcyBmb2xsb3dpbmcgYW5kIHJ0b19wdXNoX2lycV93
b3JrX2Z1bmMgcnVuIG9uIGlycV93b3JrIHRocmVhZCBjb250ZXh0IGFuZCBpcnEgaXMgbm90IGRp
c2FibGVkDQoNCiAgICBbODcxLjEwMTUxN11bIEMxMl0gcnRvX3B1c2hfaXJxX3dvcmtfZnVuYysw
eDE4MC8weDFlYw0KICAgIFs4NzEuMTAxNTE5XVsgQzEyXSBpcnFfd29ya19zaW5nbGUrMHgzOC8w
eGI0DQogICAgWzg3MS4xMDE1MjJdWyBDMTJdIGlycV93b3JrX3J1bl9saXN0KzB4NDgvMHg2MA0K
ICAgIFs4NzEuMTAxNTI1XVsgQzEyXSBydW5faXJxX3dvcmtkKzB4MzAvMHg0MA0KICAgIFs4NzEu
MTAxNTI3XVsgQzEyXSBzbXBib290X3RocmVhZF9mbisweDI3OC8weDMwMA0KICAgIFs4NzEuMTAx
NTMwXVsgQzEyXSBrdGhyZWFkKzB4MTcwLzB4MTljDQogICAgWzg3MS4xMDE1MzJdWyBDMTJdIHJl
dF9mcm9tX2ZvcmsrMHgxMC8weDE4DQoNCjIpICBhZnRlciB0aGUgcGF0Y2ggdGhlIGNhbGwgc3Rh
Y2sgcnRvX3B1c2hfaXJxX3dvcmtfZnVuYyAgcnVuIG9uIGlwaSBpbnRlcnJ1cHQgY29udGV4dCAu
DQpUaGUgaXJxX3dvcmsgaXMgcXVldWVkIHRvIHJhaXNlZCBsaXN0IGFuZCBub3RpZnkgdGhlIHRh
cmdldCBjcHUgd2l0aCBpcGkgaW50ZXJydXB0IGFuZCB0aGUgdGFyZ2V0IGNwdSBwcm9jZXNzIHRo
ZSBpcnFfd29yayBldmVudA0KDQpbVGh1IEphbiAxIDA4OjUyOjU1IDE5NzBdIHJ0b19wdXNoX2ly
cV93b3JrX2Z1bmMrMHgyM2MvMHgyNDANCltUaHUgSmFuIDEgMDg6NTI6NTUgMTk3MF0gaXJxX3dv
cmtfc2luZ2xlKzB4MzgvMHhiNA0KW1RodSBKYW4gMSAwODo1Mjo1NSAxOTcwXSBmbHVzaF9zbXBf
Y2FsbF9mdW5jdGlvbl9xdWV1ZSsweDE0Yy8weDI1Yw0KW1RodSBKYW4gMSAwODo1Mjo1NSAxOTcw
XSBnZW5lcmljX3NtcF9jYWxsX2Z1bmN0aW9uX3NpbmdsZV9pbnRlcnJ1cHQrMHgxYy8weDMwDQpb
VGh1IEphbiAxIDA4OjUyOjU1IDE5NzBdIGRvX2hhbmRsZV9JUEkrMHg3NC8weDM2Yw0KW1RodSBK
YW4gMSAwODo1Mjo1NSAxOTcwXSBpcGlfaGFuZGxlcisweDI0LzB4MzQNCltUaHUgSmFuIDEgMDg6
NTI6NTUgMTk3MF0gaGFuZGxlX3BlcmNwdV9kZXZpZF9mYXN0ZW9pX2lwaSsweGE4LzB4MjA0DQpb
VGh1IEphbiAxIDA4OjUyOjU1IDE5NzBdIF9faGFuZGxlX2RvbWFpbl9pcnErMHhiOC8weDEzYw0K
W1RodSBKYW4gMSAwODo1Mjo1NSAxOTcwXSBnaWNfaGFuZGxlX2lycSsweDc4LzB4MmQwDQpbVGh1
IEphbiAxIDA4OjUyOjU1IDE5NzBdIGVsMV9pcnErMHhiOC8weDE4MA0KDQozKSB0aGUgYXR0YWNo
bWVudCBpcyBwYXRjaA0KDQpmYW5nY2h1bmd1b0B1YnVudHU6fi9mZW5ndGlhbi9saW51eF9naXQk
IGdpdCBzaG93IGRhNmZmMDk5NDM0OTENCmNvbW1pdCBkYTZmZjA5OTQzNDkxODE5ZTA3N2I5NGMy
ODRiZjBhNmI3NTFjOWI4DQpBdXRob3I6IFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vh
c3lAbGludXRyb25peC5kZT4NCkRhdGU6ICAgV2VkIE9jdCA2IDEzOjE4OjQ5IDIwMjEgKzAyMDAN
Cg0KICAgIHNjaGVkL3J0OiBBbm5vdGF0ZSB0aGUgUlQgYmFsYW5jaW5nIGxvZ2ljIGlycXdvcmsg
YXMgSVJRX1dPUktfSEFSRF9JUlENCg0KICAgIFRoZSBwdXNoLUlQSSBsb2dpYyBmb3IgUlQgdGFz
a3MgZXhwZWN0cyB0byBiZSBpbnZva2VkIGZyb20gaGFyZGlycQ0KICAgIGNvbnRleHQuIE9uZSBy
ZWFzb24gaXMgdGhhdCBhIFJUIHRhc2sgb24gdGhlIHJlbW90ZSBDUFUgd291bGQgYmxvY2sgdGhl
DQogICAgc29mdGlycSBwcm9jZXNzaW5nIG9uIFBSRUVNUFRfUlQgYW5kIHNvIGF2b2lkIHB1bGxp
bmcgLyBiYWxhbmNpbmcgdGhlIFJUDQogICAgdGFza3MgYXMgaW50ZW5kZWQuDQoNCiAgICBBbm5v
dGF0ZSByb290X2RvbWFpbjo6cnRvX3B1c2hfd29yayBhcyBJUlFfV09SS19IQVJEX0lSUS4NCg0K
ICAgIFNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vhc3lAbGlu
dXRyb25peC5kZT4NCiAgICBTaWduZWQtb2ZmLWJ5OiBQZXRlciBaaWpsc3RyYSAoSW50ZWwpIDxw
ZXRlcnpAaW5mcmFkZWFkLm9yZz4NCiAgICBMaW5rOiBodHRwczovL2xrbWwua2VybmVsLm9yZy9y
LzIwMjExMDA2MTExODUyLjE1MTQzNTktMi1iaWdlYXN5QGxpbnV0cm9uaXguZGUNCg0KZGlmZiAt
LWdpdCBhL2tlcm5lbC9zY2hlZC90b3BvbG9neS5jIGIva2VybmVsL3NjaGVkL3RvcG9sb2d5LmMN
CmluZGV4IGMxNzI5ZjlhNzE1Zi4uZTgxMjQ2Nzg3NTYwIDEwMDY0NA0KLS0tIGEva2VybmVsL3Nj
aGVkL3RvcG9sb2d5LmMNCisrKyBiL2tlcm5lbC9zY2hlZC90b3BvbG9neS5jDQpAQCAtNTI2LDcg
KzUyNiw3IEBAIHN0YXRpYyBpbnQgaW5pdF9yb290ZG9tYWluKHN0cnVjdCByb290X2RvbWFpbiAq
cmQpDQogI2lmZGVmIEhBVkVfUlRfUFVTSF9JUEkNCiAgICAgICAgcmQtPnJ0b19jcHUgPSAtMTsN
CiAgICAgICAgcmF3X3NwaW5fbG9ja19pbml0KCZyZC0+cnRvX2xvY2spOw0KLSAgICAgICBpbml0
X2lycV93b3JrKCZyZC0+cnRvX3B1c2hfd29yaywgcnRvX3B1c2hfaXJxX3dvcmtfZnVuYyk7DQor
ICAgICAgIHJkLT5ydG9fcHVzaF93b3JrID0gSVJRX1dPUktfSU5JVF9IQVJEKHJ0b19wdXNoX2ly
cV93b3JrX2Z1bmMpOw0KICNlbmRpZg0KDQogICAgICAgIHJkLT52aXNpdF9nZW4gPSAwOw0KDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBTdGV2ZW4gUm9zdGVkdCA8
cm9zdGVkdEBnb29kbWlzLm9yZz4NClNlbnQ6IFdlZG5lc2RheSwgTWF5IDIxLCAyMDI1IDk6NTIg
UE0NClRvOiBmZW5ndGlhbiBndW8gPGZlbmd0aWFuX2d1b0Bob3RtYWlsLmNvbT4NCkNjOiBJbmdv
IE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT47IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFk
ZWFkLm9yZz47IEp1cmkgTGVsbGkgPGp1cmkubGVsbGlAcmVkaGF0LmNvbT47IFZpbmNlbnQgR3Vp
dHRvdCA8dmluY2VudC5ndWl0dG90QGxpbmFyby5vcmc+OyBEaWV0bWFyIEVnZ2VtYW5uIDxkaWV0
bWFyLmVnZ2VtYW5uQGFybS5jb20+OyBCZW4gU2VnYWxsIDxic2VnYWxsQGdvb2dsZS5jb20+OyBN
ZWwgR29ybWFuIDxtZ29ybWFuQHN1c2UuZGU+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
IDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsgU2ViYXN0aWFuIEFuZHJ6ZWogU2lld2lv
ciA8YmlnZWFzeUBsaW51dHJvbml4LmRlPg0KU3ViamVjdDogUmU6IFtQQVRDSCBSVF0gUG9zc2li
bGUgc3BpbmxvY2sgZGVhZGxvY2sgaW4ga2VybmVsL3NjaGVkL3J0LmMgdW5kZXIgaGlnaCBsb2Fk
DQoNCk9uIFdlZCwgMjEgTWF5IDIwMjUgMTA6MzU6NTMgKzAwMDANCmZlbmd0aWFuIGd1byA8ZmVu
Z3RpYW5fZ3VvQGhvdG1haWwuY29tPiB3cm90ZToNCg0KPiBoYXJkd2FyZDogT24gYXJtNjQgd2l0
aCAzMiBjb3Jlcw0KPg0KPiBGaXJzdCBEZWFkbG9jayBSb290IENhdXNlIEFuYWx5c2lzDQo+IFRo
ZSBpbml0aWFsIGRlYWRsb2NrIG9jY3VycyBkdWUgdG8NCj4gdW5wcm90ZWN0ZWQgc3BpbmxvY2sg
YWNjZXNzIGJldHdlZW4NCj4gYW4gSVJRIHdvcmsgdGhyZWFkIGFuZCBhIGhhcmR3YXJlIGludGVy
cnVwdCBvbiB0aGUgc2FtZSBDUFUNCj4gSGVyZSBpcyB0aGUgY3JpdGljYWwgcGF0aDoNCj4gRGVh
ZGxvY2sgU2VxdWVuY2UNCj4gSVJRIFdvcmsgVGhyZWFkIENvbnRleHQgKFJUIHByaW9yaXR5KToN
Cj4NCj4gaXJxX3dvcmsgofcgcnRvX3B1c2hfaXJxX3dvcmtfZnVuYyCh9yByYXdfc3Bpbl9sb2Nr
KCZycS0+bG9jaykgofcgcHVzaF9ydF90YXNrDQo+IFRoZSBydG9fcHVzaF9pcnFfd29ya19mdW5j
IHRocmVhZCBhY3F1aXJlcyBycS0+bG9jayB3aXRob3V0IGRpc2FibGluZyBpbnRlcnJ1cHRzDQoN
CnJ0b19wdXNoX2lycV93b3JrX2Z1bmMoKSBtdXN0IGJlIGNhbGxlZCB3aXRoIGludGVycnVwdHMg
ZGlzYWJsZWQuIElmIGl0IGlzDQpub3QsIHRoZW4gdGhhdCdzIGEgYnVnIGluIHRoZSBpbXBsZW1l
bnRhdGlvbiBvZiBpcnFfd29yayENCg0KPg0KPiBIYXJkd2FyZSBJbnRlcnJ1cHQgQ29udGV4dCAo
Q2xvY2sgdGltZXIpOg0KPiBocnRpbWVyX2ludGVycnVwdCCh9yBfX2hydGltZXJfcnVuX3F1ZXVl
cyCh9yBfcnVuX2hydGltZXIgofcgaHJ0aW1lcl93YWtldXAgofcNCj4gdHJ5X3RvX3dha2VfdXAg
ofcgdHR3dV9xdWV1ZSCh9yByYXdfc3Bpbl9sb2NrKCZycS0+bG9jaykNCj4NCj4gVGhlIGNsb2Nr
IGludGVycnVwdCBwcmVlbXB0cyB0aGUgSVJRIHdvcmsgdGhyZWFkIHdoaWxlIGl0IGhvbGRzIHJx
LT5sb2NrLg0KPiBUaGUgaW50ZXJydXB0IGhhbmRsZXIgYXR0ZW1wdHMgdG8gYWNxdWlyZSB0aGUg
c2FtZSBycS0+bG9jayB2aWEgdHR3dV9xdWV1ZQ0KPiAsIGNhdXNpbmcgYSBkb3VibGUtbG9jayBk
ZWFkbG9jay4NCg0KDQoNCj4gU2lnbmVkLW9mZi1ieTogRmVuZ3RpYW4gR3VvIDxmZW5ndGlhbl9n
dW9AaG90bWFpbC5jb20+DQo+IC0tLQ0KPiAga2VybmVsL3NjaGVkL3J0LmMgfCA1ICsrKy0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBk
aWZmIC0tZ2l0IGEva2VybmVsL3NjaGVkL3J0LmMgYi9rZXJuZWwvc2NoZWQvcnQuYw0KPiBpbmRl
eCA1ZGMxZWU4ZGMuLjUyYTJlN2JjZSAxMDA2NDQNCj4gLS0tIGEva2VybmVsL3NjaGVkL3J0LmMN
Cj4gKysrIGIva2VybmVsL3NjaGVkL3J0LmMNCj4gQEAgLTIxMzEsNiArMjEzMSw3IEBAIHZvaWQg
cnRvX3B1c2hfaXJxX3dvcmtfZnVuYyhzdHJ1Y3QgaXJxX3dvcmsgKndvcmspDQo+ICAgICAgICAg
ICAgICAgICBjb250YWluZXJfb2Yod29yaywgc3RydWN0IHJvb3RfZG9tYWluLCBydG9fcHVzaF93
b3JrKTsNCj4gICAgICAgICBzdHJ1Y3QgcnEgKnJxOw0KPiAgICAgICAgIGludCBjcHU7DQo+ICsg
ICAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4NCj4gICAgICAgICBycSA9IHRoaXNfcnEoKTsN
Cj4NCj4gQEAgLTIxMzksMTAgKzIxNDAsMTAgQEAgdm9pZCBydG9fcHVzaF9pcnFfd29ya19mdW5j
KHN0cnVjdCBpcnFfd29yayAqd29yaykNCj4gICAgICAgICAgKiBXaGVuIGl0IGdldHMgdXBkYXRl
ZCwgYSBjaGVjayBpcyBtYWRlIGlmIGEgcHVzaCBpcyBwb3NzaWJsZS4NCj4gICAgICAgICAgKi8N
Cj4gICAgICAgICBpZiAoaGFzX3B1c2hhYmxlX3Rhc2tzKHJxKSkgew0KPiAtICAgICAgICAgICAg
ICAgcmF3X3NwaW5fbG9jaygmcnEtPmxvY2spOw0KPiArICAgICAgICAgICAgICAgcmF3X3NwaW5f
bG9ja19pcnFzYXZlKCZycS0+bG9jaywgZmxhZ3MpOw0KPiAgICAgICAgICAgICAgICAgd2hpbGUg
KHB1c2hfcnRfdGFzayhycSwgdHJ1ZSkpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgIDsNCj4g
LSAgICAgICAgICAgICAgIHJhd19zcGluX3VubG9jaygmcnEtPmxvY2spOw0KPiArICAgICAgICAg
ICAgICAgcmF3X3NwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnJxLT5sb2NrLCBmbGFncyk7DQoNCmlu
dGVycnVwdHMgc2hvdWxkICpORVZFUiogYmUgZW5hYmxlZCBoZXJlIQ0KDQo+ICAgICAgICAgfQ0K
Pg0KPiAgICAgICAgIHJhd19zcGluX2xvY2soJnJkLT5ydG9fbG9jayk7DQo+IC0tDQoNCkluIGtl
cm5lbC9zY2hlZC90b3BvbG9neS5jIHdlIGhhdmU6DQoNCiAgICAgICAgcmQtPnJ0b19wdXNoX3dv
cmsgPSBJUlFfV09SS19JTklUX0hBUkQocnRvX3B1c2hfaXJxX3dvcmtfZnVuYyk7DQoNClRoYXQg
SVJRX1dPUktfSU5JVF9IQVJEKCkgbWVhbnMgdGhhdCB0aGlzIGZ1bmN0aW9uIG11c3QgYWx3YXlz
IGJlIGNhbGxlZA0KZnJvbSBoYXJkIGludGVycnVwdCBjb250ZXh0IChvciBpbnRlcnJ1cHRzIGRp
c2FibGVkKS4gRXZlbiB3aGVuIFBSRUVNUFRfUlQNCmlzIGVuYWJsZWQuDQoNCklmIHRoZSBpcnFf
d29yayBpcyBiZWluZyBjYWxsZWQgd2l0aG91dCBpbnRlcnJ1cHRzIGRpc2FibGVkLCB0aGVyZSdz
IGEgYnVnDQpzb21ld2hlcmUgZWxzZS4NCg0KTkFDSyBvbiB0aGlzIHBhdGNoLCBiZWNhdXNlIGl0
cyBmaXhpbmcgYSBzeW1wdG9tIG9mIHRoZSBidWcgYW5kIG5vdCB0aGUgYnVnDQppdHNlbGYuDQoN
ClRoZSBxdWVzdGlvbiBpcywgaG93IGRpZCB0aGlzIGdldCBjYWxsZWQgYXMgYSBub3JtYWwgaXJx
X3dvcmsgYW5kIG5vdCBvbmUNCnRoYXQgd2FzIG1hcmtlZCBhcyAiSEFSRCI/DQoNCi0tIFN0ZXZl
DQo=

--_000_TY2PR01MB46816118EEA6A938320A3421F598ATY2PR01MB4681jpnp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Steve you comment is right and Thanks very much</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
1=A1^5.10 kernel not init with IRQ_WORK_INIT_HARD and this fix on 6.6&nbsp;=
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
So the bug exist from 5.10 to 6.x ? some version of kernel&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
index 10b386164..a3014353f 100644</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
--- a/kernel/sched/topology.c</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+++ b/kernel/sched/topology.c</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
@@ -513,7 +513,7 @@ static int init_rootdomain(struct root_domain *rd)</div=
>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;#ifdef HAVE_RT_PUSH_IPI</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; rd-&gt;rto_cpu =3D -1;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; raw_spin_lock_init(&amp;rd-&gt;rto_lock);</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
- &nbsp; &nbsp; &nbsp; init_irq_work(&amp;rd-&gt;rto_push_work, rto_push_ir=
q_work_func);</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; rd-&gt;rto_push_work =3D IRQ_WORK_INIT_HARD(rto_push=
_irq_work_func);</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; atomic_or(IRQ_WORK_HARD_IRQ, &amp;rd-&gt;rto_pu=
sh_work.flags);</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;#endif</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
1=A1^Without fix and the callstack is following and rto_push_irq_work_func =
run on irq_work thread context and irq is not disabled</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; [871.101517][ C12] rto_push_irq_work_func+0x180/0x1ec</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; [871.101519][ C12] irq_work_single+0x38/0xb4</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; [871.101522][ C12] irq_work_run_list+0x48/0x60</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; [871.101525][ C12] run_irq_workd+0x30/0x40</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; [871.101527][ C12] smpboot_thread_fn+0x278/0x300</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; [871.101530][ C12] kthread+0x170/0x19c</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; [871.101532][ C12] ret_from_fork+0x10/0x18</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
2)&nbsp; after the patch the call stack rto_push_irq_work_func&nbsp; run on=
 ipi interrupt context .&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
The irq_work is queued to raised list and notify the target cpu with ipi in=
terrupt and the target cpu process the irq_work event&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"line-height: 100%; margin-top: 0pt; =
margin-bottom: 0pt; font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
[Thu Jan 1 08:52:55 1970] rto_push_irq_work_func+0x23c/0x240</div>
<div style=3D"line-height: 100%; margin-top: 0pt; margin-bottom: 0pt; font-=
family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0=
);">
[Thu Jan 1 08:52:55 1970] irq_work_single+0x38/0xb4</div>
<div style=3D"line-height: 100%; margin-top: 0pt; margin-bottom: 0pt; font-=
family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0=
);">
[Thu Jan 1 08:52:55 1970] flush_smp_call_function_queue+0x14c/0x25c</div>
<div style=3D"line-height: 100%; margin-top: 0pt; margin-bottom: 0pt; font-=
family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0=
);">
[Thu Jan 1 08:52:55 1970] generic_smp_call_function_single_interrupt+0x1c/0=
x30</div>
<div style=3D"line-height: 100%; margin-top: 0pt; margin-bottom: 0pt; font-=
family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0=
);">
[Thu Jan 1 08:52:55 1970] do_handle_IPI+0x74/0x36c</div>
<div style=3D"line-height: 100%; margin-top: 0pt; margin-bottom: 0pt; font-=
family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0=
);">
[Thu Jan 1 08:52:55 1970] ipi_handler+0x24/0x34</div>
<div style=3D"line-height: 100%; margin-top: 0pt; margin-bottom: 0pt; font-=
family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0=
);">
[Thu Jan 1 08:52:55 1970] handle_percpu_devid_fasteoi_ipi+0xa8/0x204</div>
<div style=3D"line-height: 100%; margin-top: 0pt; margin-bottom: 0pt; font-=
family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0=
);">
[Thu Jan 1 08:52:55 1970] __handle_domain_irq+0xb8/0x13c</div>
<div style=3D"line-height: 100%; margin-top: 0pt; margin-bottom: 0pt; font-=
family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0=
);">
[Thu Jan 1 08:52:55 1970] gic_handle_irq+0x78/0x2d0</div>
<div class=3D"elementToProof" style=3D"line-height: 100%; margin-top: 0pt; =
margin-bottom: 0pt; font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
[Thu Jan 1 08:52:55 1970] el1_irq+0xb8/0x180</div>
<div class=3D"elementToProof" style=3D"line-height: 100%; margin-top: 0pt; =
margin-bottom: 0pt; font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"line-height: 100%; margin-top: 0pt; =
margin-bottom: 0pt; font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
3) the attachment is patch</div>
<div class=3D"elementToProof" style=3D"line-height: 100%; margin-top: 0pt; =
margin-bottom: 0pt; font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"line-height: 100%; margin-top: 0pt; =
margin-bottom: 0pt; font-family: Calibri, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
fangchunguo@ubuntu:~/fengtian/linux_git$ git show da6ff09943491</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
commit da6ff09943491819e077b94c284bf0a6b751c9b8</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Author: Sebastian Andrzej Siewior &lt;bigeasy@linutronix.de&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Date: &nbsp; Wed Oct 6 13:18:49 2021 +0200</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; sched/rt: Annotate the RT balancing logic irqwork as IRQ_WORK=
_HARD_IRQ</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; The push-IPI logic for RT tasks expects to be invoked from ha=
rdirq</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; context. One reason is that a RT task on the remote CPU would=
 block the</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; softirq processing on PREEMPT_RT and so avoid pulling / balan=
cing the RT</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; tasks as intended.</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; Annotate root_domain::rto_push_work as IRQ_WORK_HARD_IRQ.</di=
v>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; Signed-off-by: Sebastian Andrzej Siewior &lt;bigeasy@linutron=
ix.de&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; Signed-off-by: Peter Zijlstra (Intel) &lt;peterz@infradead.or=
g&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; Link: https://lkml.kernel.org/r/20211006111852.1514359-2-bige=
asy@linutronix.de</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
index c1729f9a715f..e81246787560 100644</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
--- a/kernel/sched/topology.c</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+++ b/kernel/sched/topology.c</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
@@ -526,7 +526,7 @@ static int init_rootdomain(struct root_domain *rd)</div=
>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;#ifdef HAVE_RT_PUSH_IPI</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; rd-&gt;rto_cpu =3D -1;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; raw_spin_lock_init(&amp;rd-&gt;rto_lock);</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
- &nbsp; &nbsp; &nbsp; init_irq_work(&amp;rd-&gt;rto_push_work, rto_push_ir=
q_work_func);</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
+ &nbsp; &nbsp; &nbsp; rd-&gt;rto_push_work =3D IRQ_WORK_INIT_HARD(rto_push=
_irq_work_func);</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp;#endif</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp; rd-&gt;visit_gen =3D 0;</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div dir=3D"ltr" id=3D"divRplyFwdMsg"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Steven=
 Rostedt &lt;rostedt@goodmis.org&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, May 21, 2025 9:52 PM<br>
<b>To:</b>&nbsp;fengtian guo &lt;fengtian_guo@hotmail.com&gt;<br>
<b>Cc:</b>&nbsp;Ingo Molnar &lt;mingo@redhat.com&gt;; Peter Zijlstra &lt;pe=
terz@infradead.org&gt;; Juri Lelli &lt;juri.lelli@redhat.com&gt;; Vincent G=
uittot &lt;vincent.guittot@linaro.org&gt;; Dietmar Eggemann &lt;dietmar.egg=
emann@arm.com&gt;; Ben Segall &lt;bsegall@google.com&gt;; Mel Gorman &lt;mg=
orman@suse.de&gt;;
 linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; Sebasti=
an Andrzej Siewior &lt;bigeasy@linutronix.de&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH RT] Possible spinlock deadlock in kernel/sc=
hed/rt.c under high load</span>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">On Wed, 21 May 202=
5 10:35:53 +0000<br>
fengtian guo &lt;fengtian_guo@hotmail.com&gt; wrote:<br>
<br>
&gt; hardward: On arm64 with 32 cores<br>
&gt;<br>
&gt; First Deadlock Root Cause Analysis<br>
&gt; The initial deadlock occurs due to<br>
&gt; unprotected spinlock access between<br>
&gt; an IRQ work thread and a hardware interrupt on the same CPU<br>
&gt; Here is the critical path:<br>
&gt; Deadlock Sequence<br>
&gt; IRQ Work Thread Context (RT priority):<br>
&gt;<br>
&gt; irq_work =A1=F7 rto_push_irq_work_func =A1=F7 raw_spin_lock(&amp;rq-&g=
t;lock) =A1=F7 push_rt_task<br>
&gt; The rto_push_irq_work_func thread acquires rq-&gt;lock without disabli=
ng interrupts<br>
<br>
rto_push_irq_work_func() must be called with interrupts disabled. If it is<=
br>
not, then that's a bug in the implementation of irq_work!<br>
<br>
&gt;<br>
&gt; Hardware Interrupt Context (Clock timer):<br>
&gt; hrtimer_interrupt =A1=F7 __hrtimer_run_queues =A1=F7 _run_hrtimer =A1=
=F7 hrtimer_wakeup =A1=F7<br>
&gt; try_to_wake_up =A1=F7 ttwu_queue =A1=F7 raw_spin_lock(&amp;rq-&gt;lock=
)<br>
&gt;<br>
&gt; The clock interrupt preempts the IRQ work thread while it holds rq-&gt=
;lock.<br>
&gt; The interrupt handler attempts to acquire the same rq-&gt;lock via ttw=
u_queue<br>
&gt; , causing a double-lock deadlock.<br>
<br>
<br>
<br>
&gt; Signed-off-by: Fengtian Guo &lt;fengtian_guo@hotmail.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; kernel/sched/rt.c | 5 +++--<br>
&gt;&nbsp; 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c<br>
&gt; index 5dc1ee8dc..52a2e7bce 100644<br>
&gt; --- a/kernel/sched/rt.c<br>
&gt; +++ b/kernel/sched/rt.c<br>
&gt; @@ -2131,6 +2131,7 @@ void rto_push_irq_work_func(struct irq_work *wor=
k)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; container_of(work, struct root_domain, rto_push_w=
ork);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct rq *rq;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int cpu;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rq =3D this_rq();<br>
&gt;<br>
&gt; @@ -2139,10 +2140,10 @@ void rto_push_irq_work_func(struct irq_work *w=
ork)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * When it gets u=
pdated, a check is made if a push is possible.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (has_pushable_tasks=
(rq)) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; raw_spin_lock(&amp;rq-&gt;lock);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; raw_spin_lock_irqsave(&amp;rq-&gt;lock, flags);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; while (push_rt_task(rq, true))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;=
<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; raw_spin_unlock(&amp;rq-&gt;lock);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; raw_spin_unlock_irqrestore(&amp;rq-&gt;lock, flags);<br>
<br>
interrupts should *NEVER* be enabled here!<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; raw_spin_lock(&amp;rd-=
&gt;rto_lock);<br>
&gt; --<br>
<br>
In kernel/sched/topology.c we have:<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rd-&gt;rto_push_work =3D IRQ_WOR=
K_INIT_HARD(rto_push_irq_work_func);<br>
<br>
That IRQ_WORK_INIT_HARD() means that this function must always be called<br=
>
from hard interrupt context (or interrupts disabled). Even when PREEMPT_RT<=
br>
is enabled.<br>
<br>
If the irq_work is being called without interrupts disabled, there's a bug<=
br>
somewhere else.<br>
<br>
NACK on this patch, because its fixing a symptom of the bug and not the bug=
<br>
itself.<br>
<br>
The question is, how did this get called as a normal irq_work and not one<b=
r>
that was marked as &quot;HARD&quot;?<br>
<br>
-- Steve</div>
</body>
</html>

--_000_TY2PR01MB46816118EEA6A938320A3421F598ATY2PR01MB4681jpnp_--

--_004_TY2PR01MB46816118EEA6A938320A3421F598ATY2PR01MB4681jpnp_
Content-Type: application/octet-stream;
	name="0001-PATCH-RT-Possible-spinlock-deadlock-in-kernel-sched-.patch"
Content-Description:
 0001-PATCH-RT-Possible-spinlock-deadlock-in-kernel-sched-.patch
Content-Disposition: attachment;
	filename="0001-PATCH-RT-Possible-spinlock-deadlock-in-kernel-sched-.patch";
	size=7768; creation-date="Fri, 23 May 2025 06:50:30 GMT";
	modification-date="Fri, 23 May 2025 06:50:59 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlYTkzOGYxYjk1YTUzNzY1YTQxNzUzZjEyMmQ4NmM5YzNiOTdmMDI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGZW5ndGlhbiBHdW8gPGZlbmd0aWFuX2d1b0Bob3RtYWlsLmNv
bT4KRGF0ZTogV2VkLCAyMSBNYXkgMjAyNSAwMTo1NDoyNCAtMDcwMApTdWJqZWN0OiBbUEFUQ0hd
IFtQQVRDSCBSVF0gUG9zc2libGUgc3BpbmxvY2sgZGVhZGxvY2sgaW4ga2VybmVsL3NjaGVkL3J0
LmMKIHVuZGVyIGhpZ2ggbG9hZApNSU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQv
cGxhaW47IGNoYXJzZXQ9VVRGLTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKRmly
c3QgRGVhZGxvY2sgUm9vdCBDYXVzZSBBbmFseXNpcwpUaGUgaW5pdGlhbCBkZWFkbG9jayBvY2N1
cnMgZHVlIHRvCnVucHJvdGVjdGVkIHNwaW5sb2NrIGFjY2VzcyBiZXR3ZWVuCmFuIElSUSB3b3Jr
IHRocmVhZCBhbmQgYSBoYXJkd2FyZSBpbnRlcnJ1cHQgb24gdGhlIHNhbWUgQ1BVCkhlcmUgaXMg
dGhlIGNyaXRpY2FsIHBhdGg6CkRlYWRsb2NrIFNlcXVlbmNlCklSUSBXb3JrIFRocmVhZCBDb250
ZXh0IChSVCBwcmlvcml0eSk6CgppcnFfd29yayDihpIgcnRvX3B1c2hfaXJxX3dvcmtfZnVuYyDi
hpIgcmF3X3NwaW5fbG9jaygmcnEtPmxvY2spIOKGkiBwdXNoX3J0X3Rhc2sKVGhlIHJ0b19wdXNo
X2lycV93b3JrX2Z1bmMgdGhyZWFkIGFjcXVpcmVzIHJxLT5sb2NrIHdpdGhvdXQgZGlzYWJsaW5n
IGludGVycnVwdHMKCkhhcmR3YXJlIEludGVycnVwdCBDb250ZXh0IChDbG9jayB0aW1lcik6Cmhy
dGltZXJfaW50ZXJydXB0IOKGkiBfX2hydGltZXJfcnVuX3F1ZXVlcyDihpIgX3J1bl9ocnRpbWVy
IOKGkiBocnRpbWVyX3dha2V1cCDihpIKdHJ5X3RvX3dha2VfdXAg4oaSIHR0d3VfcXVldWUg4oaS
IHJhd19zcGluX2xvY2soJnJxLT5sb2NrKQpUaGUgY2xvY2sgaW50ZXJydXB0IHByZWVtcHRzIHRo
ZSBJUlEgd29yayB0aHJlYWQgd2hpbGUgaXQgaG9sZHMgcnEtPmxvY2suClRoZSBpbnRlcnJ1cHQg
aGFuZGxlciBhdHRlbXB0cyB0byBhY3F1aXJlIHRoZSBzYW1lIHJxLT5sb2NrIHZpYSB0dHd1X3F1
ZXVlCiwgY2F1c2luZyBhIGRvdWJsZS1sb2NrIGRlYWRsb2NrLgoKZW52aXJvbWVudDogT24gYXJt
NjQgd2l0aCAzMiBjb3JlcywgY3ljbGljdGVzdCAtaSAxCgpJcyB0aGlzIGEgbmV3IFJULXNwZWNp
ZmljIGlzc3VlID8gb3IgYmV0dGVyIHBhdGNoIGZvciBmaXggPwoKVGhlIGNhbGwgdHJhY2U6Cls4
NzEuMTAxMzAxXVsgQzZdIE5NSSB3YXRjaGRvZzogV2F0Y2hkb2cgZGV0ZWN0ZWQgaGFyZCBMT0NL
VVAgb24gY3B1IDYKWzg3MS4xMDEzMDJdWyBDMTJdIE5NSSB3YXRjaGRvZzogV2F0Y2hkb2cgZGV0
ZWN0ZWQgaGFyZCBMT0NLVVAgb24gY3B1IDEyCls4NzEuMTAzMjc0XVsgQzMxXSBOTUkgd2F0Y2hk
b2c6IFdhdGNoZG9nIGRldGVjdGVkIGhhcmQgTE9DS1VQIG9uIGNwdSAzMQpbODcxLjEwMTMwMl1b
IEMxMl0gTk1JIHdhdGNoZG9nOiBXYXRjaGRvZyBkZXRlY3RlZCBoYXJkIExPQ0tVUCBvbiBjcHUg
MTIKWzg3MS4xMDE0MTRdWyBDMTJdIHBzdGF0ZTogMDA0MDAwODkgKG56Y3YgZGFJZiArUEFOIC1V
QU8gLVRDTyBCVFlQRT0tLS0pCls4NzEuMTAxNDI2XVsgQzEyXSBzcCA6IGZmZmY4MDAwMTAwNjNj
ZjAKWzg3MS4xMDE0MDhdWyBDMTJdIENQVTogMTIgUElEOiA5NyBDb21tOiBpcnFfd29yay8xMiBL
ZHVtcDogbG9hZGVkIFRhaW50ZWQ6IEcKWzg3MS4xMDE0MTZdWyBDMTJdIHBjIDogbmF0aXZlX3F1
ZXVlZF9zcGluX2xvY2tfc2xvd3BhdGgrMHgxODgvMHgzNTQKWzg3MS4xMDE0MjJdWyBDMTJdIGxy
IDogX3Jhd19zcGluX2xvY2srMHg3Yy8weDhjCls4NzEuMTAxNDc2XVsgQzEyXSBDYWxsIHRyYWNl
OgpbODcxLjEwMTQ3N11bIEMxMl0gbmF0aXZlX3F1ZXVlZF9zcGluX2xvY2tfc2xvd3BhdGgrMHgx
ODgvMHgzNTQKWzg3MS4xMDE0NzldWyBDMTJdIF9yYXdfc3Bpbl9sb2NrKzB4N2MvMHg4YwpbODcx
LjEwMTQ4Ml1bIEMxMl0gdHR3dV9xdWV1ZSsweDU4LzB4MTU0Cls4NzEuMTAxNDg1XVsgQzEyXSB0
cnlfdG9fd2FrZV91cCsweDFlNC8weDRlMApbODcxLjEwMTQ4OF1bIEMxMl0gd2FrZV91cF9wcm9j
ZXNzKzB4MjAvMHgzMApbODcxLjEwMTQ5MF1bIEMxMl0gaHJ0aW1lcl93YWtldXArMHgyOC8weDQw
Cls4NzEuMTAxNDkzXVsgQzEyXSBfcnVuX2hydGltZXIrMHg4NC8weDMwNApbODcxLjEwMTQ5NV1b
IEMxMl0gX2hydGltZXJfcnVuX3F1ZXVlcysweGZiOC8weDE1YwpbODcxLjEwMTQ5N11bIEMxMl0g
aHJ0aW1lcl9pbnRlcnJ1cHQrMHhmYy8weDJkMApbODcxLjEwMTUwMF1bIEMxMl0gYXJjaF90aW1l
cl9oYW5kbGVyX3BoeXMrMHgzYy8weDUwCls4NzEuMTAxNTA0XVsgQzEyXSBoYW5kbGVfcGVyY3B1
X2RldmlkX2lycSsweGFjLzB4MmIwCls4NzEuMTAxNTA4XVsgQzEyXSBfaGFuZGxlX2RvbWFpbl9p
cnErMHhiOC8weDEzYwpbODcxLjEwMTUxMV1bIEMxMl0gZ2ljX2hhbmRsZV9pcnErMHg3OC8weDJk
MApbODcxLjEwMTUxM11bIEMxMl0gZWwxX2lycSsweGI4LzB4MTgwCls4NzEuMTAxNTE1XVsgQzEy
XSBmaW5kX2xvd2VzdF9ycSsweDAvMHgyNmMKWzg3MS4xMDE1MTddWyBDMTJdIHJ0b19wdXNoX2ly
cV93b3JrX2Z1bmMrMHgxODAvMHgxZWMKWzg3MS4xMDE1MTldWyBDMTJdIGlycV93b3JrX3Npbmds
ZSsweDM4LzB4YjQKWzg3MS4xMDE1MjJdWyBDMTJdIGlycV93b3JrX3J1bl9saXN0KzB4NDgvMHg2
MApbODcxLjEwMTUyNV1bIEMxMl0gcnVuX2lycV93b3JrZCsweDMwLzB4NDAKWzg3MS4xMDE1Mjdd
WyBDMTJdIHNtcGJvb3RfdGhyZWFkX2ZuKzB4Mjc4LzB4MzAwCls4NzEuMTAxNTMwXVsgQzEyXSBr
dGhyZWFkKzB4MTcwLzB4MTljCls4NzEuMTAxNTMyXVsgQzEyXSByZXRfZnJvbV9mb3JrKzB4MTAv
MHgxOApbODcxLjEwMzI3NF1bIEMzMV0gTk1JIHdhdGNoZG9nOiBXYXRjaGRvZyBkZXRlY3RlZCBo
YXJkIExPQ0tVUCBvbiBjcHUgMzEKWzg3MS4xMDMzMjZdWyBDMzFdIENQVTogMzEgUElEOiA4ODk3
IENvbW06IHN0cmVzcy1uZy1jcHUgS2R1bXA6IGxvYWRlZCBUYWludGVkOiBHCls4NzEuMTAzMzMw
XVsgQzMxXSBwc3RhdGU6IDAwNDAwMDg5IChuemN2IGRhSWYgK1BBTiAtVUFPIC1UQ08gQlRZUEU9
LS0tKQpbODcxLjEwMzMzMl1bIEMzMV0gcGMgOiBuYXRpdmVfcXVldWVkX3NwaW5fbG9ja19zbG93
cGF0aCsweDI1NC8weDM1NApbODcxLjEwMzMzNl1bIEMzMV0gbHIgOiBuYXRpdmVfcXVldWVkX3Nw
aW5fbG9ja19zbG93cGF0aCsweGM0LzB4MzU0Cls4NzEuMTAzMzM4XVsgQzMxXSBzcCA6IGZmZmY4
MDAwMTAwZmJkMDAKWzg3MS4xMDMzMzldWyBDMzFdIHgyOTogZmZmZjgwMDAxMDBmYmQwMCB4Mjg6
IGZmZmY3NDhmYjdkYmI2YzAKWzg3MS4xMDMzNDFdWyBDMzFdIHgyNzogMDAwMDAwMDAwMDAwMDAw
MCB4MjY6IGZmZmZiZmMwYzRlZWVlMzAKWzg3MS4xMDMzNDNdWyBDMzFdIHgyNTogZmZmZmJmYzBj
NGVmNmUzOCB4MjQ6IGZmZmZiZmMwYzRlZjc4MDAKWzg3MS4xMDMzNDVdWyBDMzFdIHgyMzogZmZm
ZmJmYzBjNGVlZWUzMCB4MjI6IDAwMDAwMDAwMDgwMDAwMApbODcxLjEwMzM0N11bIEMzMV0geDIx
OiBmZmZmYmZjMGM0YmRlMmMwIHgyMDogZmZmZjc0OGZiN2ZmNjJjMApbODcxLjEwMzM0OV1bIEMz
MV0geDE5OiBmZmZmNzQ4ZmI3ZGJiNDgwIHgxODogMDAwMDAwMDAwMDAwMDAwMApbODcxLjEwMzM1
MF1bIEMzMV0geDE3OiAwMDAwMDAwMDAwMDAwMDAwIHgxNjogMDAwMDAwMDAwMDAwMDAwMApbODcx
LjEwMzM1Ml1bIEMzMV0geDE1OiAwMDAwMDAwMDAwMDAwMDAwIHgxNDogMDAwMDAwMDAwMDAwMDAw
MApbODcxLjEwMzM1NF1bIEMzMV0geDEzOiAwMDAwMDAwMDAwMDAwMDAwIHgxMjogMDAwMDAwMDAw
MDAwMDQwCls4NzEuMTAzMzU1XVsgQzMxXSB4MTE6IDAwMDAwMDJkMDNhYTIzMmMgeDEwOiAwMDAw
MDAwMDAwMTFhZjIKWzg3MS4xMDMzNTddWyBDMzFdIHg5IDogZmZmZmJmYzBjNDVkMGRlMCB4OCA6
IDAwMDAwMDAwMDAwMDAyZgpbODcxLjEwMzM1OV1bIEMzMV0geDcgOiAwMDAwMDAwMDAwMDAwMDAw
IHg2IDogMDAwMDAwMDAwMDAwMDAwMApbODcxLjEwMzM2MV1bIEMzMV0geDUgOiAwMDAwMDAwMDAw
MDAwMDAwIHg0IDogZmZmZjc0OGZiN2ZmNjJjMApbODcxLjEwMzM2Ml1bIEMzMV0geDMgOiAwMDAw
MDAwMDAxYzAxMDEgeDIgOiBmZmZmYmZjMGM0ZTEwMDAxCls4NzEuMTAzMzY0XVsgQzMxXSB4MSA6
IDAwMDAwMDAwMDAwMDAwMDAgeDAgOiAwMDAwMDAwMDAwMDAwMDAwCls4NzEuMTAzMzY2XVsgQzMx
XSBDYWxsIHRyYWNlOgpbODcxLjEwMzM2N11bIEMzMV0gbmF0aXZlX3F1ZXVlZF9zcGluX2xvY2tf
c2xvd3BhdGgrMHgyNTQvMHgzNTQKWzg3MS4xMDMzNjldWyBDMzFdIF9yYXdfc3Bpbl9sb2NrKzB4
N2MvMHg4YwpbODcxLjEwMzM3Ml1bIEMzMV0gZG9fc2NoZWRfcnRfcGVyaW9kX3RpbWVyKzB4MTE4
LzB4M2EwCls4NzEuMTAzMzc0XVsgQzMxXSBzY2hlZF9ydF9wZXJpb2RfdGltZXIrMHg2Yy8weDE1
MApbODcxLjEwMzM3Nl1bIEMzMV0gX3J1bl9ocnRpbWVyKzB4ODQvMHgzMDQKWzg3MS4xMDMzNzhd
WyBDMzFdIF9ocnRpbWVyX3J1bl9xdWV1ZXMrMHhmYjgvMHgxNWMKWzg3MS4xMDMzODBdWyBDMzFd
IGhydGltZXJfaW50ZXJydXB0KzB4ZmMvMHgyZDAKWzg3MS4xMDMzODJdWyBDMzFdIGFyY2hfdGlt
ZXJfaGFuZGxlcl9waHlzKzB4M2MvMHg1MApbODcxLjEwMzM4NV1bIEMzMV0gaGFuZGxlX3BlcmNw
dV9kZXZpZF9pcnErMHhhYy8weDJiMApbODcxLjEwMzM4OF1bIEMzMV0gX2hhbmRsZV9kb21haW5f
aXJxKzB4YjgvMHgxM2MKWzg3MS4xMDMzOTBdWyBDMzFdIGdpY19oYW5kbGVfaXJxKzB4NzgvMHgy
ZDAKWzg3MS4xMDMzOTJdWyBDMzFdIGVsMF9pcnFfbmFrZWQrMHg1MC8weDU4Cls4NzEuMTAxMzAx
XVsgQzZdIE5NSSB3YXRjaGRvZzogV2F0Y2hkb2cgZGV0ZWN0ZWQgaGFyZCBMT0NLVVAgb24gY3B1
IDYKWzg3MS4xMDE0MTRdWyBDNl0gcHN0YXRlOiA4MDQwMDA4OSAoTnpjdiBkYUlmICtQQU4gLVVB
TyAtVENPIEJUWVBFPS0tLSkKWzg3MS4xMDE0MjRdWyBDNl0gc3AgOiBmZmZmODAwMDFjZmJiYmYw
Cls4NzEuMTAxNDc0XVsgQzZdCls4NzEuMTAxNDE2XVsgQzZdIHBjIDogbmF0aXZlX3F1ZXVlZF9z
cGluX2xvY2tfc2xvd3BhdGgrMHgyMjAvMHgzNTQKWzg3MS4xMDE0MjJdWyBDNl0gbHIgOiBuYXRp
dmVfcXVldWVkX3NwaW5fbG9ja19zbG93cGF0aCsweGM0LzB4MzU0Cls4NzEuMTAxNDA4XVsgQzZd
IENQVTogNiBQSUQ6IDMxNzAgQ29tbTogZG1fc2NoZWRfdGhkIEtkdW1wOiBsb2FkZWQgVGFpbnRl
ZDogRwpbODcxLjEwMTQ3NV1bIEM2XSBDYWxsIHRyYWNlOgpbODcxLjEwMTQ3Nl1bIEM2XSBuYXRp
dmVfcXVldWVkX3NwaW5fbG9ja19zbG93cGF0aCsweDIyMC8weDM1NApbODcxLjEwMTQ3OV1bIEM2
XSBfcmF3X3NwaW5fbG9jaysweDdjLzB4OGMKWzg3MS4xMDE0ODNdWyBDNl0gdHR3dV9xdWV1ZSsw
eDU4LzB4MTU0Cls4NzEuMTAxNDg2XVsgQzZdIHRyeV90b193YWtlX3VwKzB4MWU0LzB4NGUwCls4
NzEuMTAxNDg4XVsgQzZdIF93YWtlX3VwX3ErMHhiOC8weGYwCls4NzEuMTAxNDkxXVsgQzZdIGZ1
dGV4X3dha2UrMHgxNzgvMHgxYmMKWzg3MS4xMDE0OTNdWyBDNl0gZG9fZnV0ZXgrMHgxNDgvMHgx
Y2MKWzg3MS4xMDE0OTZdWyBDNl0gX2FybTY0X3N5c19mdXRleCsweDEyMC8weDFhMApbODcxLjEw
MTQ5OF1bIEM2XSBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3AuMCsweDdjLzB4MWI0Cls4NzEuMTAx
NTAxXVsgQzZdIGRvX2VsMF9zdmMrMHgyYy8weDljCls4NzEuMTAxNTA0XVsgQzZdIGVsMF9zdmMr
MHgyMC8weDMwCls4NzEuMTAxNTA2XVsgQzZdIGVsMF9zeW5jX2hhbmRsZXIrMHhiMC8weGI0Cls4
NzEuMTAxNTA4XVsgQzZdIGVsMF9zeW5jKzB4MTYwLzB4MTgwCls4NzEuMTAxNTEwXVsgQzZdIEtl
cm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOgpbODcxLjEwMTUxMV1bIEM2XSBIYXJkIExPQ0tVUApb
ODcxLjEwMTUxMl1bIEM2XSBDUFU6IDYgUElEOiAzMTcwIENvbW06IGRtX3NjaGVkX3RoZCBLZHVt
cDogbG9hZGVkIFRhaW50ZWQ6IEcKMTAuMC02MC4xOC4wLnJ0NjIuNTAua2wuYWFyY2g2NCAjMQpb
ODcxLjEwMTUxNV1bIEM2XSBDYWxsIHRyYWNlOgpbODcxLjEwMTUxNl1bIEM2XSBkdW1wX2JhY2t0
cmFjZSsweDAvMHgxZTQKWzg3MS4xMDE1MThdWyBDNl0gc2hvd19zdGFjaysweDIwLzB4MmMKWzg3
MS4xMDE1MTldWyBDNl0gZHVtcF9zdGFjaysweGQwLzB4MTM0Cls4NzEuMTAxNTIyXVsgQzZdIHBh
bmljKzB4ZDQvMHgzYzQKWzg3MS4xMDE1MjVdWyBDNl0gYWRkX3RhaW50KzB4MC8weGJjCls4NzEu
MTAxNTI4XVsgQzZdIHdhdGNoZG9nX2hhcmRsb2NrdXBfY2hlY2srMHgxMDgvMHgxYTAKWzg3MS4x
MDE1MzFdWyBDNl0gc2RlaV93YXRjaGRvZ19jYWxsYmFjaysweDk0LzB4ZDAKWzg3MS4xMDE1MzRd
WyBDNl0gc2RlaV9ldmVudF9oYW5kbGVyKzB4MjgvMHg4NApbODcxLjEwMTUzOF1bIEM2XSBfc2Rl
aV9oYW5kbGVyKzB4ODgvMHgxNTAKWzg3MS4xMDE1MzRdWyBDNl0gc2RlaV9ldmVudF9oYW5kbGVy
KzB4MjgvMHg4NApbODcxLjEwMTUzOF1bIEM2XSBfc2RlaV9oYW5kbGVyKzB4ODgvMHgxNTAKWzg3
MS4xMDE1MzldWyBDNl0gX3NkZWlfaGFuZGxlcisweDMwLzB4NjAKWzg3MS4xMDE1NDFdWyBDNl0g
X3NkZWlfYXNtX2hhbmRsZXIrMHhiYy8weDE2YwpbODcxLjEwMTU0MV1bIEM2XSBuYXRpdmVfcXVl
dWVkX3NwaW5fbG9ja19zbG93cGF0aCsweDIyMC8weDM1NApbODcxLjEwMTU0NF1bIEM2XSBfcmF3
X3NwaW5fbG9jaysweDdjLzB4OGMKWzg3MS4xMDE1NDddWyBDNl0gdHR3dV9xdWV1ZSsweDU4LzB4
MTU0Cls4NzEuMTAxNTQ5XVsgQzZdIHRyeV90b193YWtlX3VwKzB4MWU0LzB4NGUwCls4NzEuMTAx
NTUxXVsgQzZdIF93YWtlX3VwX3ErMHhiOC8weGYwCls4NzEuMTAxNTUzXVsgQzZdIGZ1dGV4X3dh
a2UrMHgxNzgvMHgxYmMKWzg3MS4xMDE1NTVdWyBDNl0gZG9fZnV0ZXgrMHgxNDgvMHgxY2MKWzg3
MS4xMDE1NTZdWyBDNl0gX2FybTY0X3N5c19mdXRleCsweDEyMC8weDFhMApbODcxLjEwMTU1OF1b
IEM2XSBlbDBfc3ZjX2NvbW1vbi5jb25zdHByb3AuMCsweDdjLzB4MWI0CgpTaWduZWQtb2ZmLWJ5
OiBGZW5ndGlhbiBHdW8gPGZlbmd0aWFuX2d1b0Bob3RtYWlsLmNvbT4KLS0tCiBrZXJuZWwvc2No
ZWQvdG9wb2xvZ3kuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2tlcm5lbC9zY2hlZC90b3BvbG9neS5jIGIva2VybmVs
L3NjaGVkL3RvcG9sb2d5LmMKaW5kZXggMTBiMzg2MTY0Li5hMzAxNDM1M2YgMTAwNjQ0Ci0tLSBh
L2tlcm5lbC9zY2hlZC90b3BvbG9neS5jCisrKyBiL2tlcm5lbC9zY2hlZC90b3BvbG9neS5jCkBA
IC01MTMsNyArNTEzLDcgQEAgc3RhdGljIGludCBpbml0X3Jvb3Rkb21haW4oc3RydWN0IHJvb3Rf
ZG9tYWluICpyZCkKICNpZmRlZiBIQVZFX1JUX1BVU0hfSVBJCiAJcmQtPnJ0b19jcHUgPSAtMTsK
IAlyYXdfc3Bpbl9sb2NrX2luaXQoJnJkLT5ydG9fbG9jayk7Ci0JaW5pdF9pcnFfd29yaygmcmQt
PnJ0b19wdXNoX3dvcmssIHJ0b19wdXNoX2lycV93b3JrX2Z1bmMpOworCXJkLT5ydG9fcHVzaF93
b3JrID0gSVJRX1dPUktfSU5JVF9IQVJEKHJ0b19wdXNoX2lycV93b3JrX2Z1bmMpOwogCWF0b21p
Y19vcihJUlFfV09SS19IQVJEX0lSUSwgJnJkLT5ydG9fcHVzaF93b3JrLmZsYWdzKTsKICNlbmRp
ZgogCi0tIAoyLjI1LjEKCg==

--_004_TY2PR01MB46816118EEA6A938320A3421F598ATY2PR01MB4681jpnp_--
