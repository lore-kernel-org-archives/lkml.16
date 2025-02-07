Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2074.outbound.protection.outlook.com [40.92.41.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906CC23C8AF
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.41.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943912; cv=fail; b=Gfx0m2t1mvBekGFtydXUzTqN6vu8P08G/jIRdguuJIVqXu40DpMyQT2AjemvHcYVmLvRnXdw0+9GOMX4NpPksjf69ASgq/ZRs79U1gQKtRtsX2VW5MUhhqgbNL47N9Qw2/LFvNbHlXmCHZF6x67zY24vVwyVjZbiOeXkeBQbOls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943912; c=relaxed/simple;
	bh=/PPoasir26s6uK4utDNxsonlIJntx9EehF6nNmD4/L4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XEZVyNQJeFQY8M0cIO7ZqBLAerZqAUmIwwYBxtUltHmme9A6iyKt+q8g/A7ztgrF+KOKF/vQvECwrhSdNLtWQy9iFQhRu2WQpyihXWvLCQQIDGg4sc40UeOeXOy2NhOxjLh8JZVKY+hnEBKfQM4s3ZXefWHQmocRIthJMzIFWfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=bOMznd5A; arc=fail smtp.client-ip=40.92.41.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="bOMznd5A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mG3drdxlxnzXYDr8LPYlxKHZNEBqacTz/QChTpqQnrSbom4Dol39MbRg9ljd6FZJbmeeinrxDFB7w97lZAr5BrvBn4B8vBKpXbl17Y3ZOle4nPfS6p5xdVBWozUgxCpzwKGapV+GjY20I578Rcldwa6E9igX9v84bZOGwjPrOSAK5sKcn3W3Nc5bEV3LI+VnwGJSHfNxUeUw4e+0ksHmWAayCwPVAOhCn34FeUhCkj9SdAbx7VMK4zU/NKCJGQlUCQQa8TZSKhgO9J/PhsX3nehxILU5VOH6hy6J4SkJiRxGqywF/DrZBPJb6qpuncBCHcgRCuGQyx/o7JO2hlr5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PPoasir26s6uK4utDNxsonlIJntx9EehF6nNmD4/L4=;
 b=YNi08z27to2wiQC7ibmEqgOYy770ubj9IvYZWxd4mYXmDz+xw/1xoj29R/qaG8GUq3Zjzmu/inaIt7OQp8ZIcNCXSNMIhwScTdrrrkt4Kjg9SviKrugG2+ngX9vWQWm3wIKxCozmIfPbwVPSeBJuhz3DBs6SiR+WFD09/rma7ckvt68O2U7quqelItk/XMjbp2cbn8UslXpdoZmrqe+qm+eFS7F4CJGOLAPaARyx1MF5cYyfMCQXEiW9P94tg6V8W5qD6MD5tmBH2bHPoby2WVtJhNL55VnsFTDu7EutxjvmvFCBvktMABI6PPzWKlTyUO+4Fv7oVGd8pBdWQtqt7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PPoasir26s6uK4utDNxsonlIJntx9EehF6nNmD4/L4=;
 b=bOMznd5Ajz5TjGLzs95bwR1owzTFEVuJvxpMdNjcZokp3zjj+tFb5GMupRBzrWtQp2hplBtYkxiRMGLYz+iwzE9L+vDgG2knk8KV0Ay6zbgsyvAqoQLBS78aWnmDxxNpx3zHqeldQrM2pqjaQIOcOXWvQDcSrsdicag59+AO4JMS7oK9HX5OxfgnVYLqM25mT0cQPioJV2rAhHEna26dXmJYsR6RnC0cvPBpZtYZqvV22kTSz3nyspmvIE3rfjD1F/BB70ufND11mv0fz9EW11ycjc8ZrC7WiZONxpnWPo9J9l8K+c9SdRd58Qhw/76xf9Z9Mw4doQqfh0KvSLe5sA==
Received: from BYAPR12MB3205.namprd12.prod.outlook.com (2603:10b6:a03:134::32)
 by MN6PR12MB8515.namprd12.prod.outlook.com (2603:10b6:208:470::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 15:58:28 +0000
Received: from BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::489:5515:fcf2:b991]) by BYAPR12MB3205.namprd12.prod.outlook.com
 ([fe80::489:5515:fcf2:b991%5]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 15:58:28 +0000
From: Stephen Eta Zhou <stephen.eta.zhou@outlook.com>
To: Mike Rapoport <rppt@kernel.org>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIG1tOiBvcHRpbWl6ZSBtZW1ibG9ja19hZGRfcmFu?=
 =?utf-8?Q?ge()_for_improved_performance?=
Thread-Topic: [PATCH] mm: optimize memblock_add_range() for improved
 performance
Thread-Index: AQHbd5I+MclXFgUVVk6Vm36iiqWOEbM78nGAgAAPzuo=
Date: Fri, 7 Feb 2025 15:58:27 +0000
Message-ID:
 <BYAPR12MB32056738A6225C6B5D61A01AD5F12@BYAPR12MB3205.namprd12.prod.outlook.com>
References:
 <BYAPR12MB32059CFEB36A5FC7D859B69FD5F72@BYAPR12MB3205.namprd12.prod.outlook.com>
 <Z6YfqcOx5FACtvae@kernel.org>
In-Reply-To: <Z6YfqcOx5FACtvae@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3205:EE_|MN6PR12MB8515:EE_
x-ms-office365-filtering-correlation-id: b6049d68-cc80-44a2-f40b-08dd479042dd
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|8060799006|15030799003|15080799006|461199028|5012599010|12121999004|8062599003|440099028|3412199025|41001999003|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?VnFOYWJJNDJhT3k1NEVDRHNQSFB6NkJ3M25MeXdRVGdxZVl4dTd1STNTMkk0?=
 =?utf-8?B?SlMzcjdkY3hGTEVEZVlXWmpBTjYrMEk3Q2hlQk9XYVZLK1lLZHk3c2dMRmdD?=
 =?utf-8?B?bGVpSVdxNS8waVZMMHorV1pzQTFhbHVJRGtyZDhnMW1TdWlvWjQzVTdMOTBZ?=
 =?utf-8?B?U1dvZXJHdUpSQ0lFNVM2ZjNsdEtjWTNJcWJpaGxqN1ZnckR5T25xOWgraG1V?=
 =?utf-8?B?MTVqbHBXSzk4VUx5ajUyaGI0enVpc0RMREc0ZURIU2FnRDFQWWpHM3Z4amQ5?=
 =?utf-8?B?OFhEUCt6YmhoNCtmUmVHRkJDTnNVWUlLNVVsWkQ4OWZqUTZXZ012Z1F0YWdw?=
 =?utf-8?B?b0xNS3Z0RDNIZVJJU3VOeDZUcThJZTVxQ1I5RkFocWpHNHdEZWpwa292VHB4?=
 =?utf-8?B?UzJ3UkhLNTA5My9zWGx0MnpZUm5haWFQeHZxOFk4TVVQMVRCenRkTG4rUUZR?=
 =?utf-8?B?U0ZtUHg0ZjlhQ0Y2aStwQXp5MUFyL0ZBVXBBaUMyaWN2dnM4bUNtMGo4MGo1?=
 =?utf-8?B?SHlOaEd4UUUrS3NSWjlLczVMK0tLVWkwdWJRQ0JkckR0UU50Rkx4NjYzTHFG?=
 =?utf-8?B?YUNiREFiZTVwOEVlbFNFTDQrci9rVXBYVlBqeE9HaEtVbGwvdjVRVm9jK1Bm?=
 =?utf-8?B?SjBhYjJBOElRTnM1WmJhaXg2SnE0WnBlT0o5Q0tzZlNjOFFaQjN1cEFaWlJn?=
 =?utf-8?B?cW40cjBvYW13L04vTVQwbG56TWszRC85WGF4YUtHKzZNdjRCL1pucUhkQ0w1?=
 =?utf-8?B?V01pc1hPTXYvR1g5TEwvQzlpM1ROZG5JaXJVRXlDV1NDMGJtMEUyMm5hN0g4?=
 =?utf-8?B?SDdCNVdETHNzNldhREw3NGhNUHZ2OHZ1UTRWS2V0b2IvQjJWRENFQWlpby92?=
 =?utf-8?B?R1RiNlZUQmNDdVlndmNnSXcxYWRqallLN1ZtOThSRmgxVm44L1JsK25FL0dP?=
 =?utf-8?B?bEpUR2pXMVJFMFRjSHlCU0NNZUtCb25uc2htL1RkWWQ1MmlkaDl2b1MrdUgw?=
 =?utf-8?B?MUNjdzZEVFRST2NwaGphVU1JemJqQ3dON0c2UnJDbEpWUVVkWjYzVlB3NXZ1?=
 =?utf-8?B?RTFqTm9FVDVKLzdaR2hqRDkxRTllbk9va1U5N2FPSm9YR3l3elpGZmc4TUl0?=
 =?utf-8?B?UVB1L281KzlKWFZ4K1ZCNjF6Y2dOaUp2TnQvTE03V1Vxa1VLYkM5am9nWVRN?=
 =?utf-8?B?ZUdIdTFDRHQvZ2hoWVVjRW9CaXpidzlVRXFPcWxYVEczOERUVFlNYXhMQXJD?=
 =?utf-8?B?ZzRIOUdRWXFPRDZGYmw0R0Z0ZWR1Nm5IQWNBbkFzRXJJQnJNQ1dXa3NickRo?=
 =?utf-8?B?a0ZvTFVsaFdjaURDVEJxUTFVVDdRRk8rZUlFb1YzUnV0RkpySjZKbEd2a0Ey?=
 =?utf-8?B?dmZycnF1S3U3MmU5dHM0bUVBekpnYTdrSmlERVNHU1JPTzk4TG9zZDhYNjQr?=
 =?utf-8?B?WmU4SVhNTW16blVCY29BSHMzdFF3T2dlaDYrcllNZytFZWVSVHFoR3p3VVF1?=
 =?utf-8?B?bVp3RzNpZ2dYRkxHZXBFYVJXN2FHamEzTy9YbVRubitiek1hSnVLWi9Gc3lr?=
 =?utf-8?Q?ciM7ift+G+gb16Nnka8u8Tx+I=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MEtVZ0hlRUdTSTUwWXdmbGdsYUM3VUErSVlqWHVNRnp3YjdXSXhmVkJMQ2Jr?=
 =?utf-8?B?UHNJNnBZZlhsNEJvb2JIVFRFOGFzcnVwYWNEVlhWSHpaYWFEQWdXa3BPdU92?=
 =?utf-8?B?VnJEeHhpb2dScnZhSTQzSWNBclNsNTlBdWVHWFRIOENtZ21NSC9jbi82elll?=
 =?utf-8?B?R3JPbjNxb3o3Vk9EMHNyUjRIUHNEZ3ZYUkVIczZNVEF3czVkN3R6VFVKRGNB?=
 =?utf-8?B?aEpZL01pZjNSQ0k5YWZGQkdRNDRyQnlMZk1vSjF6ZXpTY1phQ0hIaFZaNXY3?=
 =?utf-8?B?bnArOTEvS3IybWhKOEE5djV5Q3VXN2h0VEx6QnZ6WjVFYmtVODZzYUFnSWlW?=
 =?utf-8?B?VXdyZGZvVUQ1a0E1cXlCVEVhREI2NGxmMFQyNS9zcXJoVGc3dytLb1Eyck1z?=
 =?utf-8?B?MWdMdGRGYkFFWkNkVUZiQjI4dktmMHNFbmY2aUZmdktjZy84d0cxOU5xVlJG?=
 =?utf-8?B?OXF2cGlMaCtBNmdwWGkycEkxY1JPck80SkdTVFBuVDkySk8xZFZEK2w3VlFn?=
 =?utf-8?B?RjN6T0dtb2ZsNGJVa2RzcGc4eWw1Wmx3NER2Y0hTWWpHMlNtcFFyZWpJSGlB?=
 =?utf-8?B?UGJvVHd2MUs1UXo3UWl6aTR2OWpnOGRnNUo2K3dXcjBMYThEcVl2VFFjdUNn?=
 =?utf-8?B?YU5CTWxtSXhuN3NqN0VkQVJ5RzBLTTVvSDhSS0FDSXYrcWJsNXFhT2NEVFdy?=
 =?utf-8?B?Q2VTS2xibWZCci92MWdQMDBOK2l4V1FDZkwwdXBMLzRGUHlEYWhSdmRHS3N2?=
 =?utf-8?B?RlRzQ1Ewc29BS3pSQkRkVHMwOWdmSkg3dzRXQmVtMDAwaUZLNnFLZmVlLzFL?=
 =?utf-8?B?bXpzMjIrd1ZDWkxMbWl5VGM1WDA3Y2g0R296L21mZmlHUjFUYUEvRjUxU2Qz?=
 =?utf-8?B?RTQ4NmEzbG5mTjA4ZHRhK2M2WlB6UGovSUJkOXZuaHBWT0tKVFRmaHFLT3Q5?=
 =?utf-8?B?U2x3aGw5K2c5V3RZTDhnRkU1UWZ6YWk5c1FNRDhFWjF2MmN2NnMvREE5RHFo?=
 =?utf-8?B?bW15clp3bDZsSVVyUUFzSnluRmxLdEpRcEp0aDFVaUtGWHBCQlZTeFJ6QVlw?=
 =?utf-8?B?N2NsMmJKOVFxUXcrZlBpYkhyTjJCMVRxaHkxbkxVTUdkdnlnUkp2VUJTaU9G?=
 =?utf-8?B?QStQUjFYT3M1d29lZlc2VjQ5aEVETStIUndTKzVVNVBoc0lXZ3ptMWU4S3pN?=
 =?utf-8?B?MFNMSmR2T1R4Q1F3dUt5MFFRYWFCUEZLV1BZdFJkejYvUzJJQzJNYXRLVGV4?=
 =?utf-8?B?d0tKb3NPOU5Hb2VXVEJHcy9naU5KK01sd3hja0tPYlN6TVZqYXNUMS9KZ3I0?=
 =?utf-8?B?OGlsOG0wblJMN0tBN3lMNFJTZlpEdmEyblZrQzJwd1EwUXgyQmkvRnQ5Njht?=
 =?utf-8?B?bXc5VFNMdEdpUDRpNFJmeEVOU0pNaWVncEJRK3JxbkMySzdocE9VM1lrWkxt?=
 =?utf-8?B?M0VvS2YyY3F6L1NCL1hoR1NJWTdnaEZYUUJraHhMcEt6eGZMU21rQ1l1RkZM?=
 =?utf-8?B?aVd0TUVnQ242SGlNZVFkMFIyWkFZUW5Va1p4Y0xYcWlsdFFnV2tXcTdBR2Rr?=
 =?utf-8?B?dis4MzNPT2VwU3p0SElOVC9BWXBDeTNRc3dSRTNNNzhYKy9Pdk9KZlZNNVpH?=
 =?utf-8?Q?Xm2JSqyWwMmNazmzPepGaPqRKxo4r6xf7PtS6l0rJ1sY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3205.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b6049d68-cc80-44a2-f40b-08dd479042dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 15:58:27.8505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8515

SGkgTWlrZSwKClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjayBhbmQgaW5zaWdodHMuIEkgZnVs
bHkgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm5zIHJlZ2FyZGluZyB0aGUgZnJhZ2lsaXR5IG9mIHRo
ZSBjb2RlIGluIGBtZW1ibG9ja19hZGRfcmFuZ2UoKWAgYW5kIHRoZSBjaGFsbGVuZ2VzIGluIGhh
bmRsaW5nIGVkZ2UgY2FzZXMuIEkgYWxzbyBhY2tub3dsZWRnZSB5b3VyIHBvaW50IHRoYXQgd2hp
bGUgdGhlIENQVSBjeWNsZSByZWR1Y3Rpb25zIGFyZSBtZWFzdXJhYmxlLCB0aGV5IG1heSBub3Qg
ZnVsbHkgY2FwdHVyZSB0aGUgbW9zdCBpbXBvcnRhbnQgZmFjdG9yIOKAlCB0aGUgYm9vdCB0aW1l
IHNwZWVkdXAuCgpSZWdhcmRpbmcgdGhlIHBlcmZvcm1hbmNlIG1ldHJpY3MsIEkgd2FudCB0byBj
bGFyaWZ5IHRoYXQgdGhlIG1haW4gZ29hbCBvZiBteSBvcHRpbWl6YXRpb24gd2FzIHRvIGltcHJv
dmUgdGhlIGJvb3QgdGltZSBkdXJpbmcgdGhlIGVhcmx5IHN0YWdlcyBvZiBrZXJuZWwgaW5pdGlh
bGl6YXRpb24uIFdoaWxlIHJlZHVjaW5nIHRoZSBDUFUgY3ljbGVzIGZvciBgbWVtYmxvY2tfYWRk
X3JhbmdlKClgIGlzIGEgcG9zaXRpdmUgb3V0Y29tZSwgdGhlIHJlYWwgYmVuZWZpdCBpcyBpbiBy
ZWR1Y2luZyBrZXJuZWwgaW5pdGlhbGl6YXRpb24gdGltZSwgcGFydGljdWxhcmx5IGJlZm9yZSB0
aGUgYnVkZHkgc3lzdGVtIHRha2VzIG92ZXIuIEkgdW5kZXJzdGFuZCB0aGF0IHRoZSBDUFUgY3lj
bGUgcmVkdWN0aW9uIGFsb25lIGRvZXNuJ3QgYWRkcmVzcyB0aGUgY3JpdGljYWwgcXVlc3Rpb24g
b2YgYm9vdCB0aW1lIHNwZWVkdXAsIGFuZCBJIHdpbGwgd29yayBvbiBtZWFzdXJpbmcgdGhpcyBt
b3JlIGRpcmVjdGx5LgoKVG8gYWRkcmVzcyB0aGUgY29uY2VybiBhYm91dCByZWFsIGhhcmR3YXJl
IGFuZCBjb3JuZXIgY2FzZXMsIEkgcGxhbiB0byBjb25kdWN0IGZ1cnRoZXIgdGVzdGluZyBvbiBh
Y3R1YWwgaGFyZHdhcmUgd2l0aCBkaWZmZXJlbnQgbWVtb3J5IGNvbmZpZ3VyYXRpb25zIHRvIGVu
c3VyZSB0aGUgcm9idXN0bmVzcyBvZiB0aGUgcGF0Y2guIFRoaXMgd2lsbCBoZWxwIGVuc3VyZSB0
aGUgc3RhYmlsaXR5IGFuZCBwZXJmb3JtYW5jZSBiZW5lZml0cyBhcmUgY29uc2lzdGVudCBhY3Jv
c3MgdmFyaW91cyBzZXR1cHMuCgpJIGFsc28gcGxhbiB0byBpbmNyZWFzZSB0aGUgdGVzdGluZyBj
b3ZlcmFnZSBmb3IgZWRnZSBjYXNlcyBhbmQgaW5jbHVkZSBtb3JlIHJvYnVzdCBmYWxsYmFjayBt
ZWNoYW5pc21zIHRvIGFkZHJlc3MgdGhlIHBvdGVudGlhbCBmcmFnaWxpdHkgbWVudGlvbmVkLiBJ
IHdhbnQgdG8gbWFrZSBzdXJlIHRoZSBjaGFuZ2VzIGhhbmRsZSBhbGwgcG9zc2libGUgc2NlbmFy
aW9zIGdyYWNlZnVsbHkuCgpJbiBhZGRpdGlvbiwgSSB3aWxsIGZvY3VzIG9uIG1lYXN1cmluZyBi
b290IHRpbWUgbW9yZSBkaXJlY3RseSB1c2luZyB0b29scyBsaWtlIGBib290Y2hhcnRgIGFuZCBz
aGFyZSB0aGUgcmVzdWx0cywgY29tcGFyaW5nIHRoZSBib290IHRpbWVzIGJlZm9yZSBhbmQgYWZ0
ZXIgdGhlIG9wdGltaXphdGlvbiB0byBkZW1vbnN0cmF0ZSB0aGUgYWN0dWFsIGltcGFjdCBvbiBz
dGFydHVwIHBlcmZvcm1hbmNlLgoKR2l2ZW4gdGhlIGNvbmNlcm5zIHJhaXNlZCwgSSB3b3VsZCBn
cmVhdGx5IGFwcHJlY2lhdGUgeW91ciBndWlkYW5jZSBvbiB3aGV0aGVyIHlvdSB0aGluayBpdCdz
IHdvcnRod2hpbGUgZm9yIG1lIHRvIGNvbnRpbnVlIHdpdGggdGhpcyBhcHByb2FjaC4gU2hvdWxk
IEkgcHJvY2VlZCB3aXRoIGZ1cnRoZXIgcmVmaW5lbWVudHMgYW5kIHRlc3RpbmcsIG9yIHdvdWxk
IHlvdSByZWNvbW1lbmQgYSBkaWZmZXJlbnQgZGlyZWN0aW9uIGZvciBvcHRpbWl6YXRpb24/IFlv
dXIgaW5wdXQgd2lsbCBiZSBpbnZhbHVhYmxlIGluIGVuc3VyaW5nIHRoaXMgcGF0Y2ggbWVldHMg
Ym90aCBwZXJmb3JtYW5jZSBhbmQgc3RhYmlsaXR5IGdvYWxzLgoKVGhhbmsgeW91IGFnYWluIGZv
ciB5b3VyIGNhcmVmdWwgcmV2aWV3LCBhbmQgSSBsb29rIGZvcndhcmQgdG8geW91ciB0aG91Z2h0
cy4KCkJlc3QgcmVnYXJkcywgwqAKU3RlcGhlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwrlj5Hku7bkuro6wqBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+
CuWPkemAgeaXtumXtDrCoDIwMjXlubQy5pyIN+aXpSAyMjo1OArmlLbku7bkuro6wqBTdGVwaGVu
IEV0YSBaaG91IDxzdGVwaGVuLmV0YS56aG91QG91dGxvb2suY29tPgrmioTpgIE6wqBha3BtQGxp
bnV4LWZvdW5kYXRpb24ub3JnIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPjsgbGludXgtbW1A
a3ZhY2sub3JnIDxsaW51eC1tbUBrdmFjay5vcmc+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgrkuLvpopg6wqBSZTogW1BBVENIXSBt
bTogb3B0aW1pemUgbWVtYmxvY2tfYWRkX3JhbmdlKCkgZm9yIGltcHJvdmVkIHBlcmZvcm1hbmNl
CsKgCkhpIFN0ZXBoZW4sCgpPbiBXZWQsIEZlYiAwNSwgMjAyNSBhdCAwNTo1NTo1MEFNICswMDAw
LCBTdGVwaGVuIEV0YSBaaG91IHdyb3RlOgo+IEhpIE1pa2UgUmFwb3BvcnTjgIFBbmRyZXcgTW9y
dG9uCgo+IEkgaGF2ZSByZWNlbnRseSBiZWVuIHJlc2VhcmNoaW5nIHRoZSBtbSBzdWJzeXN0ZW0g
b2YgdGhlIExpbnV4IGtlcm5lbCwKPiBhbmQgSSBjYW1lIGFjcm9zcyB0aGUgbWVtYmxvY2tfYWRk
X3JhbmdlIGZ1bmN0aW9uLCB3aGljaCBwaXF1ZWQgbXkKPiBpbnRlcmVzdC4gSSBmb3VuZCB0aGUg
aW1wbGVtZW50YXRpb24gYXBwcm9hY2ggcXVpdGUgaW50ZXJlc3RpbmcsIHNvIEkKPiBhbmFseXpl
ZCBpdCBhbmQgaWRlbnRpZmllZCBzb21lIGFyZWFzIGZvciBvcHRpbWl6YXRpb24uIFN0YXJ0aW5n
IHdpdGgKPiB0aGlzIHBhcnQgb2YgdGhlIGNvZGU6Cj4KPiBpZiAodHlwZS0+Y250ICogMiArIDEg
PD0gdHlwZS0+bWF4KQo+IMKgIMKgIMKg4oCCaW5zZXJ0ID0gdHJ1ZTsKPiBUaGUgaWRlYSBoZXJl
IGlzIGdvb2QsIGJ1dCBpdCBoYXMgYSBjZXJ0YWluIGZsYXcuIFRoZSBjb25kaXRpb24gaXMgcmF0
aGVyCj4gcmVzdHJpY3RpdmUsIGFuZCBpdCBjYW5ub3QgYmUgZXhlY3V0ZWQgaW5pdGlhbGx5LiBN
b3Jlb3ZlciwgaXQgaXMgb25seQo+IHZhbGlkIHdoZW4gdGhlIHJlbWFpbmluZyBzcGFjZSBpcyAo
Mi8xKSArIDEuIElmIHRoZXJlIGlzIGVub3VnaCBtZW1vcnksCj4gYnV0IGl0IGRvZXMgbm90IHNh
dGlzZnkgKDIvMSkgKyAxLCB0aGUgaW5zZXJ0aW9uIG9wZXJhdGlvbiBzdGlsbCBuZWVkcyB0bwo+
IGJlIHBlcmZvcm1lZCB0d2ljZS4KClRoZSBjb2RlIGluIG1lbWJsb2NrX2FkZF9yYW5nZSgpIGlz
IHZlcnkgZnJhZ2lsZSwgYW5kIG1hbnkgYXR0ZW1wdHMgdG8KcmVtb3ZlIHRoZSBzZWNvbmQgcGFz
cyB0aGF0IGxvb2tlZCBjb3JyZWN0IGF0IHRoZSBmaXJzdCBnbGFuY2UgZmFpbGVkIGZvcgpzb21l
IGNvcm5lciBjYXNlLgoKVW5mb3J0dW5hdGVseSwgaXQncyBpbXBvc3NpYmxlIHRvIGNhcHR1cmUg
YWxsIHBvc3NpYmxlIG1lbW9yeQpjb25maWd1cmF0aW9ucyBhbmQgcmVzZXJ2YXRpb25zIGluIHRo
ZSBtZW1ibG9jayB0ZXN0IHN1aXRlLCBzbyBldmVuIGl0IGl0CnBhc3NlcywgdGhlcmUgaXMgYSBj
aGFuY2UgdGhlIGtlcm5lbCB3aWxsIGZhaWwgdG8gYm9vdCBvbiBhbiBhY3R1YWwgSFcuCsKgCj4g
LSBCZWZvcmUgdGhlIHBhdGNoOgo+IMKgIC0gQXZlcmFnZTogMS4yMiUKPiDCoCAtIE1heDogMS42
MyUsIE1pbjogMC45MyUKPgo+IC0gQWZ0ZXIgdGhlIHBhdGNoOgo+IMKgIC0gQXZlcmFnZTogMC42
OSUKPiDCoCAtIE1heDogMC45NCUsIE1pbjogMC41MCUKPgoKVGhlc2UgbnVtYmVycyBkbyBub3Qg
cmVwcmVzZW50IHdoYXQncyBhY3R1YWxseSBpbnRlcmVzdGluZzogdGhlIGJvb3QgdGltZQpzcGVl
ZHVwLgoKLS0KU2luY2VyZWx5IHlvdXJzLApNaWtlLg==
