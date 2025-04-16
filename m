Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020089.outbound.protection.outlook.com [52.101.69.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8FA230BD8;
	Wed, 16 Apr 2025 08:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793416; cv=fail; b=QdlHuGky8OK9bOQowvuNDUCCr1hqi5w6vcKouVlPhlKw1Qbz7EfaMlHgeOCfmy9mVUnwGsPfw4sZ9K5auj9GdbhQndc6RJts36w69q1/x3L+Clan6WSkpbg3xoUI7JC+6NTAZzv6pVeLdXpOzyTuHUdfWiaaaLQl56d8FwLwi2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793416; c=relaxed/simple;
	bh=BzOvbsZ/3OFqIkAkkH4F/+pMqJl08OP3yYDHDAdIdg8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ABRH9vKIknXjDQQHFAcu/UdD4iB2TzOaARLM5RmpHQX2TFQ7lGuIugZC0UJ+ybHnO+vZZLPRiqeeByn78IDOCyvo210cJq6SKlAyTcaUiidKmZ+hSvvH/hU/Vi96nY5OqVlCSI60s65mm00/DILGbRjnsIhYVamFPxWH+OVOenM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=XujlOzgS; arc=fail smtp.client-ip=52.101.69.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="XujlOzgS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9mxWBEPjYdBvkBm/PvBic1pXhtwyNyRFAQH0hn7tGGdQAbVOVSJblNGrayPrJr7Eu0Mr6CVoeInM3S7TFILP1lsuZT6Np0ymqJcJimQYLVEuWj2SU6EU4xDVErIgULmRFMUF0pusMdTPgMCgUGPQY8N/vZCgCJ/nRlsWMIOfABUi/2vlIHee4jiamnhs1txXCtKoDggwuAv4Q6X9Gx46pFXl2GRCKE2gvDz08J+CKTzQoNUOr5HSMSGeyFEau2WPBehmJCfYEqPzVxZ+kSiNZ5Mrd6+qw99zpMj9LtQjqkM5Ld26OEQLzWz9NIsEFkFoGHJ+hIkT0NYsKvCkDEoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzOvbsZ/3OFqIkAkkH4F/+pMqJl08OP3yYDHDAdIdg8=;
 b=VBa51NbgufX5fSGcrfcGQH2fbEvii/WqgwyxIcS82QiIBOUrzlbYVN+Onli6laYV501rgvIcCnNDT9DhUa/UeUzVJ1iYczeXTXnCzeRgGM2WHgZBN0XWR0Ok5STVku539NjBSr31hHtpRMtpQspdFha1VB7qEtgFLFruot4OakS4IgvblJvgtftPV32tMvf+EKuUpedyU+4mg3Xu1a/S8cicqcjxWFrhD7479TD7mwDQVY9lruN//PpwgaF50XnnyN82aAOLzsYetpH9rCdNWHMK/BigNcg8a7O9mOtw0Hx4na5bCEzsSLtFeQOJfQ5A+xl49LAxm9RbeNtlNulo5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzOvbsZ/3OFqIkAkkH4F/+pMqJl08OP3yYDHDAdIdg8=;
 b=XujlOzgSi0TiNXNsqXaRnPVylFPplR0opeLcW2dnoqhOBQLwPD7Sq4akL9W0h1j290mng6aSkMbuYmdoKzv3P7QQrwKJxF7fX/7DHpK4ikf6EFKz7teqHCzUWmY7+m+P/hkr0Ob5n71fz4ZUZ3afFxY7yxDHgIse1U4h78nTCkWbvuW7+P3j2V3YkALH91DO3EQSGzaurwTE/XY3IP2DzO1UcDcn/5VrmLQPWyauaCqqYDsj6GiTwpeduLDRJ2xK/MEI+caMwMx8/Z8Lx4enejgfs7MtpPjiFQ4AZ3aIfstwINJW3KKATb/uzQJCee4CF7s5eZ6ViL28XvufTAQKig==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by DUZPR04MB9845.eurprd04.prod.outlook.com (2603:10a6:10:4d8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 08:50:09 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 08:50:08 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 5/8] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COM
Thread-Topic: [PATCH v5 5/8] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COM
Thread-Index: AQHbrdM+FV0CbTqjFkik+EL7ythPibOlE5KAgAAA4QCAAPsLgA==
Date: Wed, 16 Apr 2025 08:50:08 +0000
Message-ID: <efbec141-d2f1-4408-9916-ad60d15a479b@gocontroll.com>
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
 <20250415-initial_display-v5-5-f309f8d71499@gocontroll.com>
 <Z/6rDW3vw4C8jhy3@lizhi-Precision-Tower-5810>
 <CAOMZO5BdFm-Yj+ZCApND+A7n3m5QQ7F1q2eS-eUrdGXgkTZRpA@mail.gmail.com>
In-Reply-To:
 <CAOMZO5BdFm-Yj+ZCApND+A7n3m5QQ7F1q2eS-eUrdGXgkTZRpA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-imapappendstamp: PA4PR04MB7630.eurprd04.prod.outlook.com
 (15.20.8632.030)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|DUZPR04MB9845:EE_
x-ms-office365-filtering-correlation-id: 678daa18-bb6f-4bc8-dba2-08dd7cc3b114
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RTA4L2FQTTFmdXUxN3FTb1RLRlZlWXo5RFU2bDFMbmU0MFZpTjF5RTNZeUF1?=
 =?utf-8?B?dXNRVUtFM1VjSzA5Zkd0SXhib1M5TkcvU3ZaYkpmNDF2MTVSb2RqenRvYTIy?=
 =?utf-8?B?bjBDWWRidkdIK3YzYk95L0FneW1jNjJPM3dOUUpDTTI0RiswS3k2VUlndGZk?=
 =?utf-8?B?a2tFTGZaaEpSdVo1SXUwcmFFNm1nTGcwcDB6cERHNWVOb0xnWU10aTRHdXkw?=
 =?utf-8?B?aEU0S3RtNlM1Ym43Qk5sVlhOV1dEREpIQkFHSXFaWHlYODBIcitMMWo0aDZ5?=
 =?utf-8?B?RVdWMmRpekZoSGJSVVdhVDdKS3ZSNHpmRUpCZ3BqV2xzcGhRZko0VXJ1di9z?=
 =?utf-8?B?bjFiZFFLUC91dUNDcDNReDV5cHBFWENQRFduUnI5b0FYUUg0dFRHUURSRU4w?=
 =?utf-8?B?YVVmSVRlWHNzSzdkeStzNWhhM1FyU3hBYmNVUFNVWEl1M2c0MUpJeUVUSVNS?=
 =?utf-8?B?SHg5RUw0dWVYaFZ6Q1ZzWHBHZGN4MG9sWVQwcERoZ0pvRXgrcVdranVOanYv?=
 =?utf-8?B?SzNLU2hkY3I2a3g5L21YNjMrb0ZVRFhMVXNSZ3YreWFaZlpoT0owU3lPQTM5?=
 =?utf-8?B?TmY5MGdBdWUyMzdXeTNDc3N3Q2JDTUxQRlJOR1hseFd3OCt0TVJuTC9WQkhR?=
 =?utf-8?B?dUhxRmdwMHlHRkRFQUt4OU5GNmVWZFd3ZDg2Z0JjeTRZeEJ5OVQ0dmF6aklz?=
 =?utf-8?B?MVNkTjlWbzRJamk5R1VUSWlRUlB0bzN2K3F1Q0cvUU9NUmtmN3E4R2FQeUFC?=
 =?utf-8?B?ZUw4dFVZbW9Talg0SEdvZUVNRGtmQWJkT3BpQU5UWmJobjFmbVhkN0w3ZjRV?=
 =?utf-8?B?QTF3dEFyVkpVcVVuQ0M5aHhSb1IzQmsvZGlUR0NXODluU1JnZVpUNFJzS3Iv?=
 =?utf-8?B?WGZmdXh4LzFTT2doWU5QcmRsMEFNVWw1QTUwUWpYTkFlZjg2NDFxS1JLbDdG?=
 =?utf-8?B?ampOSFJJMmVtTFVUeDR5K1RBSE13NjFaanJJT1Y4UW12dlhaSmU5UENHVzlF?=
 =?utf-8?B?S29SWEoyRDZsRnhoSC9Wdjh2QlBhaVplQ0IyMFRrOTZibThsTlVPYW9OY0w4?=
 =?utf-8?B?d2oxNFlxVE5zMVd2U0hyWjY5aHdZTE8velQwemNTL0FCcFBVVGlqTDlrQnpH?=
 =?utf-8?B?RDlodzNXLzBNUVh6VnFDM3lNUWZnSHQzcXhkSjRsVFFTNTN5Y0U0Y1Z5c1cx?=
 =?utf-8?B?TEttVm13Sjg1bFFERHVTTUFkcmo4N0FxQ2JkK0kxM3dsVWVKMTFDV2NvVGNU?=
 =?utf-8?B?ODBUUE1uS09JODF3dlhGTnJTeU5EQjVEU3JZSWtDSUhrSkpGK1BvaDBWZFRF?=
 =?utf-8?B?YktqRFdrbm1RdnpIaDZvWExTQ1RSYU54SkhIdDZhZURtOXRGaFVtRlBPT1Q1?=
 =?utf-8?B?M0JCclZZZzU0cnFWTjUveWx5K1VNeDhqQUhJajNoZWxBRmNBWDhPaFpGeDdM?=
 =?utf-8?B?VERSTnd6OWNSZFVxNzRFMjFiWHdJUXpYcGhUY3FiNXY2a1gxYStOYjgrNEdM?=
 =?utf-8?B?bXJ0WGJOWVBwSDFCWmg0eHZERUxFSlBid0p3RmVsalJFR0pnU2VFNDgxU0lh?=
 =?utf-8?B?UkNMWXAxTTFGWFlMM3JlR1BSNUZoaGl4UWpKWGxvaGpNSERYcXB1c1VhcEJI?=
 =?utf-8?B?cjBTTHF5eU9HbS9zRm03aFE1NmV1NnYzTktRZENOamVRanZraFkySkhqM2Ux?=
 =?utf-8?B?eXMxbUVhampFSzAwS2xhZkt6ajBDeXJ4b0hvQ1hNSVZsYnl2c0h6VVpOZ3N0?=
 =?utf-8?B?bzZ2Z3RKcXl4bm1xVnF0UFVhMEdzdkQyYUo1eUdheXVzUDNMdHgzd2tKVDhT?=
 =?utf-8?B?M1dOMW5mTjBlNWF5dW9qUWwzZTBnNGJaVGZ5dnQyaGdJbEN3aWtsWkNLVG9Q?=
 =?utf-8?B?VGFSYjI5ajhaTm1ZN0czUXN1SzFiNmVXMHMvcWJ0ckVmVzZMLytjNkVaYlkx?=
 =?utf-8?B?eDlvYjJBYTh0cm1GY1NaT1U0RUxiVVpDRTNwcDNkZDVZUU9XT0d2ZFA4N2ht?=
 =?utf-8?B?MGtDekhWbVd3PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?K1g4RDEwc01KWXpVbWk4R0pvRWxsT09XaXBBa2tXeGdRRDBOYkkwTnFGL3Fy?=
 =?utf-8?B?SlJ6VGNsenVOMXhKMzM3VUEvamd1RkFqN3VJK1hEU0dnYWJyNWpKdWlCTFFJ?=
 =?utf-8?B?VWprVWhLdWdveDlSVjM0NjlmWE1TZUhnY0dGeTdGQ2J2Ukd2VVVqWVBiVkxL?=
 =?utf-8?B?cjRNVytzS0l5MVkxcWIraVh0VkVpdSsyMXpNV3U4MTlLVEZTWkY0QXlnWTN0?=
 =?utf-8?B?azNnY1g2R1g2aTUyOXo5cEtmOGd4L0ZwRW1rQVpOTmx5UHZnWmIwall5SmFy?=
 =?utf-8?B?WmVFZWtuL0xSVHZRaTh5d2xmVVNuWUp1SWlSSmV6bStZQWpnUUhwcnVWM25x?=
 =?utf-8?B?cXhIeURzVXovSkZPZXhqNmx2V0ZyZzBIUEc0WlE1QWt2NCtEVUlXMUVZREZs?=
 =?utf-8?B?cXhQd2RRSzlTUHNYdlJNYk9mMGtjS0x5Ymg4cy8zS2xjUVl4UEduZk9tOGRR?=
 =?utf-8?B?SmN5SnJMOENPSE1HYWI0bHRrUHJFUnV5a1Y0U1J4RUVrOEtQQjlxZkhMbnRO?=
 =?utf-8?B?N1VqSnNSSzEyZlgyMndxcllDVXhidDFoQjRpZkdCcUM2a1lINWhIVW55c2Er?=
 =?utf-8?B?SXVVbTVLQS9DVmRkWnpJMHNoT0x6OFdBSW5GeURDNTc3TlFLZFQ3RjZNTGRM?=
 =?utf-8?B?YkxkbWhPOVdxOWVWaG5GektYRStiN1ZyNGV3TXdaTlBIbFNNS1A0UEtmNzB5?=
 =?utf-8?B?SUVjRFMwb0ZONUIwMlR2WHg5ZjFHVlhXNkltUmk5cU5DWUJZZlR4L0pPWEY3?=
 =?utf-8?B?TE9BQ04zSVYrWEdlQkp0MjVkcEJaZkUzcHg3Q1l6dldUaTNwbWJqdGJ6MVBM?=
 =?utf-8?B?WlNLaVZ0eFVuQWY4dUtaZE1JaFhnN0VvSXFTZ05nWW1TZSttbEs3TUx4WFlk?=
 =?utf-8?B?cDl0SW9SaFZoYjAyKzRSUXZhZk1sb0tpSzZRN0I2NmEwenlLRWYzSmtlUm1y?=
 =?utf-8?B?SWNCaXZHazdidTJXMjc5dVMwNVJMUXA3ajVvTVBzUjNoeWRWQ2Q2SG9uQTdo?=
 =?utf-8?B?c3ZIS1h2d2FJNnNwNU5JVkRWZ05jMnpvaks3dER1K0ZEZVh6bWg1bWNUV2Qy?=
 =?utf-8?B?eHNJZUJTeDg4dlhPQlRORUV6SCsyQ2F5Z0tZZzl1MEJkRHNUV2d4VEs5QWNF?=
 =?utf-8?B?T2pScXlyeVlnbEdwbElBZCtRUVJSQTBhTDQ1bVREVVcvNFFlQThDSkpreW1m?=
 =?utf-8?B?T21ieHR4TVMyYXRxM21uUDQxSEVudzQyMDQyMXNjRm0wQ1JUWkVaMzI3dnVk?=
 =?utf-8?B?YVRGSktoMXk0OGtVTWxnbzBVaThhRTRVWEVJeFpmMkJmV3hWd0pkaWg5Slc3?=
 =?utf-8?B?VTkvd2JHMkFmNkMrNmlJSG5ubFR1Q2dCUXJJSUhqQTVUR1RlUVZZcE9nc0Uy?=
 =?utf-8?B?Tm1DdkdUeWRMYmRxeGZaRnpITGtOb3BxVE44aklOMDVoa0cwMVhPd00vald5?=
 =?utf-8?B?bC85Z2ZvTDZGcy83MzhlYkZ0VHA1SUtlYmxlbG95azZRMEp6TUJGR2Qxb1l0?=
 =?utf-8?B?bE1lNUZOZEdRbDdQSTI2cVBMN1FVSmR5Um5QSjNwWnorcmh1bGxPUnAxc2FB?=
 =?utf-8?B?cCtTcitEK0UwOFRvaDVLbGZjLzJ4Y0JORldXWnhuQ1F2Y1VCRHdLRWVaNVNz?=
 =?utf-8?B?N1VucWlwRzE5eDllUGp6Y1l4VjMyWVRhN3pwQS9hb2FuWVNMdXZOTFZlOHFr?=
 =?utf-8?B?L3BxcXpOY2s4QiswUjZQU3JMblpTUUxPdHBnVHRrQW5HcG5DTzlLY0JVUEpp?=
 =?utf-8?B?Nml4V3FaZWJYZzJBTU5zTFdoMnUwTDIwa1BoZFN3aW1KWWNlNWh3N0NkR2JN?=
 =?utf-8?B?eXJCZU9uNEFkTkFmK0s5WUxnc2JhSHVsYXJlMGdwTmMxNDVjSlBGaVA3Y2Yw?=
 =?utf-8?B?dlNXZG51UWQ2V2hQVDhBUC9uNmw5MUxaSjVmR0JIbjJqa2ZBQ3RJaHhYc2JX?=
 =?utf-8?B?QlRlNWVuWHVuZXYzdVhocUJVbFoxVXFxcHdHL0d4clBDa2lBdTFYSUw0R21s?=
 =?utf-8?B?TlpJYmEvTFdTcXJ6dXBwVlJzS1lGeXJVUFBxWlpxNVhyQW5JZ1U0N0lkaFJT?=
 =?utf-8?B?TnRqSnA5cUhFVXJGdk9tR1dFaDN2YXNtZkg1cGdsdHYwM1M3WjFSdjVCaVMr?=
 =?utf-8?B?N0pnTlRHRzdqQVZna1VNTTB1OHVWYUcvNDE2YlNiaHE0dDRtTi82OUZ5OGMw?=
 =?utf-8?B?VEJKSlJ0UWRubDVCczI5R2o1YmYzVG1ZS3lvY0ljSmFoY3Q0RC9KZGcwZmIr?=
 =?utf-8?B?ay8wUmFkOXpURW5VY2thdGJBWlN3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8B33D7EE1D70D6469CE7ED360C4A65C0@gocontroll.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678daa18-bb6f-4bc8-dba2-08dd7cc3b114
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 08:50:08.7771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZQSoh1E6b52/wTt+kDdSE8YQ2ZbGlUBmmFUJMsPGGKXDltoRQLtX6NT933dLJZf1pH71FXbVbxakO4V337lHtkDpsNgsyd57AUXxa2CZ7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9845

T24gNC8xNS8yNSAyMDo1NiwgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPiBPbiBUdWUsIEFwciAxNSwg
MjAyNSBhdCAzOjUz4oCvUE0gRnJhbmsgTGkgPEZyYW5rLmxpQG54cC5jb20+IHdyb3RlOgo+Pgo+
PiBPbiBUdWUsIEFwciAxNSwgMjAyNSBhdCAwODo1NDoyOEFNICswMjAwLCBNYXVkIFNwaWVyaW5n
cyB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4+PiBGcm9tOiBNYXVkIFNwaWVyaW5ncyA8bWF1ZHNwaWVy
aW5nc0Bnb2NvbnRyb2xsLmNvbT4KPj4+Cj4+PiBUaGUgS2EtUm8gRWxlY3Ryb25pY3MgdHg4cC1t
bDgxIGlzIGEgQ09NIGJhc2VkIG9uIHRoZSBpbXg4bXAgU09DLiBJdCBoYXMKPj4+IDIgR0Igb3Ig
cmFtIGFuZCA4IEdCIG9mIGVNTUMgc3RvcmFnZSBvbiBib2FyZC4KPj4KPj4gIm9yIiByYW0/ICBJ
IHRoaW5rIGl0IHNob3VsZCBiZSAiMkdCIHJhbSIKPiAKPiBQbGVhc2UgdHJpbSB5b3VyIHJlcGxp
ZXMuCj4gCj4gSSB0aGluayBoZSBtZWFudCAiMkdCIG9mIFJBTSIuCgoqU2hlLCBidXQgamVhaCBJ
IHRoaW5rIHRoYXQgaXMgd2hhdCBJIG1lYW50IGFzIGl0IG1pcnJvcnMgdGhhdCB3aGF0IEkgCnNh
aWQgYWJvdXQgdGhlIGVNTUMuIFdpbGwgZml4IGl0IQoKLS0gCk1ldCB2cmllbmRlbGlqa2UgZ3Jv
ZXRlbi93aXRoIGtpbmQgcmVnYXJkcywKTWF1ZCBTcGllcmluZ3MKCg==
