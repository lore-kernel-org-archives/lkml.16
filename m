Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414872405E8;
	Tue, 24 Jun 2025 20:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750798212; cv=fail; b=BZV3vwV4Ug6/UqIj2kwlWbiAECyC7oy1XP5gI0XVNc1vl7M53oKnEg/UVovRYuseLJ85/+S5yZC72cWYzys6Cd6pV5Pr7l3LjuOnTiM04lF/xrHJC7qcaK/3WZNRFEhphIh0UKSsf5L9OhJing4TY7Yw+qbz2SAVbf2DMxNl7lw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750798212; c=relaxed/simple;
	bh=Uy+CqJf/T7zKhk8291qplgs6nW0V1dPQSHo6QvZOa08=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sQ4MP3sc5EwIRJobVYK3znO0YwK4mw8nkLcWQrIhyTLafYldmc+57Sa/lR1fNsDkIsa9ngC8Dk3gav7FhXCoAV/grhPZHdbQpnTK9rF5ztTbHhv9zrtMWN/Qs1uJGxX67U7S59O4+ssfzgUrUQPRR3gVNvLieoBIzfeBy6EzlWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nMh7KLs1; arc=fail smtp.client-ip=40.107.223.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nMh7KLs1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=obOvWTN9ByjadNahSWEYFt+VMYv0RGunV5/R177OgWEl4ZdYL5AWTBZAUUgFLeLoPNi66oOMajWq4DjiEJ3n6lsZklq43kVOjLF1U/ES5YOQqkwXWdY2B8F3fMLAntWjb3SY1hGoQAty2iZuhQlroE4JmoM/1fK3wdl3qDl2cbkW4R8/nE7fnDrssnL9e3UVbN4eHOTKS+Fz5i73SCc4lQqc1MwDIIda+9RW8pHPEPwhEbfRRvgzfrdEm6qj3RZu38ygHMVivFvalnplk2zDu9cyiMdreiTA3dgFUcm3kMfUn2QM2HD+k03dbFb1eoeyLeJ7g/+VTKVXdK7p8gCkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uy+CqJf/T7zKhk8291qplgs6nW0V1dPQSHo6QvZOa08=;
 b=Pm3HrXNo0c67LUrKaNYBMu1xYSpeg7IBGeRy0g7kk0bTFbaE3doNypkd6q92RGbwe97eKeQ78172oAknDL2ABuHjU4EZvu0nbogLJdIxOBXqvroNUy2tbetVz0F41Mx8XfvZPv7TueLa4NycSifb3r0df9/zPEqD2uXuTes3hrt85u4hTZy6yOLRJXxZqIOSWNpLF1OwB6V/+nU+ol32fWMNLhlrrlvTJNW859NMWiuNUhZunax4R9GdHMJ4FSMp3ah807wtDxJd9rLTqWHWQJIstt6pu/Eo/xUpTmyyeVq66MoqJw0VpNc3l/5wMzr9awm+jOghA2oW31TmgFmd1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uy+CqJf/T7zKhk8291qplgs6nW0V1dPQSHo6QvZOa08=;
 b=nMh7KLs1tGuPJYLoS53G9h/y4kn7CuvxhxJ+3CLg41ewl3Zn7626A65HQlHFHhPLa3wyEaWdDcK4+0oivDEB29A8orxrtcdHBlk85ih9vDF1iZV3WzF2OL9LOuR2dmTCrH1cDbCTz7VtJGKBANTkmdeCWrku52t014fbQZ4I0cuxG/oTxS15PJ9WWQTtuc/gOmuvUcDJ1eapjFFQxoShR3e3PYdgYtXbvhHGIp9Nfzvgm4nBOiqK2e77kPiRryGdxl2WTNSXE//bnlyNZO0E5cWKrwHZ5dLLLvrSNSdZnG65JJLQu7jTbYCO1fFFVc685epQjGshiH7qFPTNi9U3ow==
Received: from PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 by DS0PR12MB6654.namprd12.prod.outlook.com (2603:10b6:8:d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 20:50:07 +0000
Received: from PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6]) by PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 20:50:07 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>, "hansg@kernel.org"
	<hansg@kernel.org>, "ilpo.jarvinen@linux.intel.com"
	<ilpo.jarvinen@linux.intel.com>, David Thompson <davthompson@nvidia.com>,
	Michael Shych <michaelsh@nvidia.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] platform/mellanox: Fix spelling and comment clarity
 in Mellanox drivers
Thread-Topic: [PATCH 1/2] platform/mellanox: Fix spelling and comment clarity
 in Mellanox drivers
Thread-Index: AQHb40d3bMtNkddwcEyM5RXkI5JkXLQSzGOA
Date: Tue, 24 Jun 2025 20:50:07 +0000
Message-ID:
 <PH7PR12MB66686B87D8572B5812A1402EAF78A@PH7PR12MB6668.namprd12.prod.outlook.com>
References: <20250622072921.4111552-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250622072921.4111552-1-alok.a.tiwari@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6668:EE_|DS0PR12MB6654:EE_
x-ms-office365-filtering-correlation-id: 3fbc3262-7e5e-4a8f-0a30-08ddb360b3d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aWtNcGR5Y0lBQXBwOWNkZ204RkZEdCtCQXB4aHBYN1Z5UXpUWUM5OENwNlp0?=
 =?utf-8?B?dmh4eE92RnpQVFdmbnlQUVpVYURNMVg0VnNpR3dqVVVsUi9YM0F1cURaYXFk?=
 =?utf-8?B?aDh5dTJ2VGxETWVzS3dnNERLUmJwS1YzMGVUQjZPYlRtZDVScVJvbC9DajZ1?=
 =?utf-8?B?aGVXbjlRekV1azhNN1FVY2FpOVp2VkZpMlEzTm9tODlsS0VScG1waE5sMnhE?=
 =?utf-8?B?THV4RTRycEV2MEphVzdydXpYNDU0VE9VZldERDRwVi8xdmVHQnFpKzgyU0FJ?=
 =?utf-8?B?YkZIcFpYWHFmWWFLaFFsRTBzNEFpWmdKcG9RL2U3ZHVhaittanZYUEdCdFRH?=
 =?utf-8?B?blZkbFRIT3F6empROVV1cFFoczd5dG1Gb0xzMEtpcWdBaXA1ZlVDVk14eVNE?=
 =?utf-8?B?cFprZGp1VGxaanR1ZEo1OW9aSzY2ZU1xR3lxSW9yKy96Q3AySXNabFp3eVBQ?=
 =?utf-8?B?WUh6MXM3dDltTXlPQmlENTBsdUVSNHozNC9oSkJxdlYyRDlCVW5GSHQ3ckZ3?=
 =?utf-8?B?SDU1Y1FnVU52M2NZbjNuOE1HTGpoTVM3VkV0UmdDb1Q1b3NnczV3a3RkZ2gx?=
 =?utf-8?B?UEgzc0txN1FPMWFKVFo4OENRNU1BOGFBMThSSEk4QXE4bHZ5ODZCVXNTZXBW?=
 =?utf-8?B?L0xyVXVXQ3c0M3VsYzVyaGFjUTNJNmc1RVgrbng0SENqTnljZkVTTzVHN0Mr?=
 =?utf-8?B?NXZTcURWaDd6NzZ5VmVJdERIcUVPVUY5N1JMbFdDOUJnWER0Y1NSbVZKRk9Q?=
 =?utf-8?B?ZjJvWkNDcXVMNE9Ia3RVYjlGUnZmYTV5dzl0OFl6dndlQjNRbTVTMDJIVklN?=
 =?utf-8?B?RzRTNUJja1ZtUThQd0pRYVJ1V2lGVjZTdTFncFJOVzhaZkg1cjJpaXgrbVJX?=
 =?utf-8?B?SFlYNDZrRnVYZGY0UkdKenRUeUxlNUx6ZjVYRVBwOG5qQnFJcXJXVTlVRitD?=
 =?utf-8?B?ZnV2cnMvREpkMjdCNnFHQkc5eElZTTIrRkhEaGVHS0N6SHlhZUlKSWxJTGJO?=
 =?utf-8?B?N3dsMlRhVk51VkxudXpVT1NBcUNsSG41aWkyNG5zOEVQNy9vY0lPWDNDdml3?=
 =?utf-8?B?dVNETjlsWGluRUdjam42b1IwQytDMUlkb1JhUnVuZ2x0SWJjVURtKzJyUXZl?=
 =?utf-8?B?eWN1N3VsbWJCdGR6Zy82WUFXZkxoSjVCRFMxTlJlSWpJYk4vOWg1UmJYYlRr?=
 =?utf-8?B?VDU5aWtYM2k5OHBIOHg3cjVzWnhYRm1GYzFDKzJwbVdzTytMdXczUE1ROUps?=
 =?utf-8?B?M0wvU3d3c3EvVE9vNlFSaWlCYXVpWlB5ZS94VkNpTk94SmtTN25uanh0MHFt?=
 =?utf-8?B?ZTRub0o5Q3JGenN0TlRnc1MzYU05ODhkMlBOVW1aeldZeHV5NERTRW5uNFMx?=
 =?utf-8?B?dmtoVGNWMXB5NHgzazU3eDdLbUtTWWJtaW9xK3VscGdldkc2VjlXaTNTMzJG?=
 =?utf-8?B?TEt3bzB6TVFpNFp3YlhOTFZyTWw4UmNLOGdLVy9Qci9odGVhT2YycWcvai9y?=
 =?utf-8?B?dkxvY0JaQ1QwMnBsdlI5TGJRcGpDV2RXU0F4TmpsejFjMXhvM3hZRDVRY0hV?=
 =?utf-8?B?ZEZ0SEhHWjFmSTF4dG9GaGF0Rm9tNFRsU2N0d0EydU9hOUpISENIMWZoL2t5?=
 =?utf-8?B?OEkvUnB3Y0xxa3BoNmw5Z05WT3d2ZGpsVE9RbW1udTZnZFJiNmlZcEZZckM3?=
 =?utf-8?B?eitZaVMzSXlDVStDRHp3MGxUMG4zMkdIV2lnUytQMFhwY0hXK0JyQitHdHNQ?=
 =?utf-8?B?d09wTlJaUlBmSTUveWRVNXFObzNrRjZsTk1zcS80WXAzSWRsNnpkMnBYeXg2?=
 =?utf-8?B?bUhNTnlHb2FEMFVjZ2llYXNnR1RwTTA0V0lOYzFxeEZSa3ovKys5b3o2RzZK?=
 =?utf-8?B?akpkRnVYNXdsV0J4M3dwTFVTZStycDZhK0VPMUdTSVRCaXV4MUdjd2JFY0ll?=
 =?utf-8?B?RDVLNWxHbGFRT3dCYm5BWGxlc3dYeXhDTWE0N0VPcW03Njh5ZStRQlRoaHJn?=
 =?utf-8?Q?LBT6JxVJ6KRoJpqjK0tjrFubmbIzGE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cWVOVjY3QjJjZWlmUmg3T3NZdFR3SHhJSEgySFdVTGY0dG94clJqSkdVcUIx?=
 =?utf-8?B?dmFoRHc1Y29MY2hJN0kyc0pBQjRGeWpvSkk4cVJvTzRreSs5NWZTTXRJQnkw?=
 =?utf-8?B?eDk3M29uWDc0TGpQRTJaaHZsMmtJd3VrMFl6Um1lYXhob0FtaGpoZjNSYzU4?=
 =?utf-8?B?UENhSWMxK28zMGt2TFhKN05kcGhGc0N1WmJRVmVpalpnZFlUV251UzdNZm5J?=
 =?utf-8?B?NkdJNlFZRVN2eitRUmw4cGZsV2R0S3BvY2JLd2I3bUk5dE9BYUY3UXN2Zlc3?=
 =?utf-8?B?cEF5TWJmYTN2OHh4UHNzTDRvU3FscklLZEtWWWhFR29BVW5TbFVZTUhreC81?=
 =?utf-8?B?T1N0UklmVERHVy9mbWpwRUlNK0pZbDE0YWUxSi9sWTllaFM0NnZZREZEamla?=
 =?utf-8?B?STgvd2V3V1NST2FJYnc1QUpZQlZSMm1MVkZGZEQyNFlxblMzaGhaN0VpZW1s?=
 =?utf-8?B?UGNzSU5ZTXZKUUd6dDNPYWExOVplS1JDUXZkVSttTHZwdlNQSzJScG1ZNmVr?=
 =?utf-8?B?ZDRweWd6SDVqOWx2OHp5KzVWSmtEaEZ6SnlaenpqQzVLOWp1Nk4rQzJzRUFt?=
 =?utf-8?B?ZnlkaVU2MlYveWozaVE0clY2WDZZQStzdGZXKzlHVjVLWVJXRVRqdDlCQnRy?=
 =?utf-8?B?cDNPQnYxQkNBQ1VOTDJYNlVIbk16U2ttb1hTZWZBSm52cjlJdUUxMCtqM0ZP?=
 =?utf-8?B?NEpGbjNUVlFTYjdkYkMyeXFIekhCbWltQWF1MWZ2SEdrUGZvdDRNTzVUd2VS?=
 =?utf-8?B?ZmpRMUFKS0JQRUZQVlRlbDQwTVZ3UHNHKy9acUVQeXBjN2Q0eS9NTm5jdGwz?=
 =?utf-8?B?SlczYU9wVXJ6KzRkUWNRMEI0aHBkMmU3NjV3dWpGelYyOFJaRU4rVXhwa01y?=
 =?utf-8?B?TjNjS05CRVYzcW5ndUtNcFJVN3c2cEFNaHhPdmpMTlJzZjBpN1dRTkJOZUs4?=
 =?utf-8?B?S2Z3bW1HT0JSanNPc0xLQVAvUmk2a0o5aUlSVXU0MGNaTXdwLzB2N2U2d3M0?=
 =?utf-8?B?Ym5HTjVjRUVaMHJQdjYxWWZFQ05kbEFleHhHS3B6YjV0MnExRjRWWmVlbCt2?=
 =?utf-8?B?VmpOdWtzaGgzOEtMcGtpQk9vQ3h6U1VtTXdrMUxLT2podGR2ek4xcUZvTHpV?=
 =?utf-8?B?RDY2THpZV1ZxT24xbUFvQ0pDUjVvOXhFcjNnaVQzTzZUaTRWM2ZTWVpuWFdt?=
 =?utf-8?B?TjZ3dFV2ZkxvYUdqU2wrL2tIQ242QzFaQTVadUNzUSt1MFVJSWQreC91SFFM?=
 =?utf-8?B?WmZ0NDh5VUZZbFpjUGFwL0pkMmZUVW4xaFNCVkVaWVYyaWVYdHhRMVJqM0FN?=
 =?utf-8?B?aTFHZTUyYnpUU0VpMEEwaElsbmZPYVBzS21uUzc1N25rVjVBVzc1Vzk5Qm5v?=
 =?utf-8?B?MHhNT0xkSElqYlJqbHVDSExza1NsZ0duQklSaHBiQ2VmOXRxRXNOMHBkZDE5?=
 =?utf-8?B?SnVhbExmYmJxTjVDa3FSZEFJNlBZeEVuVlFuL2F5Vks3eGt1aU0xMmVRQUF2?=
 =?utf-8?B?VU43QU5JTmwrNE8rbUFLK3pSRjl1R2ZvMWw1aDZMRWVqMTdEMnFBT3JaMmV4?=
 =?utf-8?B?bVIxSXl4MWFhZnRVSnV3eURsbk9BRno0ZGh3alhEdXB1dTFCTFhkVzlkdTdQ?=
 =?utf-8?B?cnV0Qnk5b2VXS2hsdk5vYmhtKzlNT0VEVENhTTkxdFIxSmo5RGNySTRncFYz?=
 =?utf-8?B?djJDZ3pXK2ZWYTBsTlU1ZUtYYlViTzd6N1RBczJ5Wk1IR0ZrMkoxVDRFMjRv?=
 =?utf-8?B?RnVCeHVwSEo5RzRBN3ZucUUvV0FjbkhHTFpBODE3bmVrV21XUjN5OVg1Tksx?=
 =?utf-8?B?anVrZ2NNRGUwYTZ0dFNaOE5Lb0Y3d1B4L1B3emMrTlNRY2N2Y3JzTTBtb2lN?=
 =?utf-8?B?Z2ZoVzFLQXQyRWZQeHRWanh2OHhjOFpvWkRTQmxtTSs3REQ2RkU3NmtoZU1X?=
 =?utf-8?B?ODdhVWZreURrdVByRHRrZEJvV2sreDBoUmNCRzB5cWxsOWZhU01UUGZzSW5X?=
 =?utf-8?B?aW9jVkE4SUpiQ1M0RlpCVGNHVDZsWUgvcDVRSXQ0M3hzV1krL2hHblpyanJ2?=
 =?utf-8?B?Y3BnNFBIU0tCRW5KNmp5VC9rUC9xNkhXeElkam1UdlllWXVlZlZrUmRON0Nx?=
 =?utf-8?Q?sdQI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6668.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fbc3262-7e5e-4a8f-0a30-08ddb360b3d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 20:50:07.1545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2/lmdNXw+08AjgalOTISKyfxz394m1k02a7ylOoxfJ4KyF3z98ScMtnHdPgHRCvewGzeI8tdH3PTqipKwLUjAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6654

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxvayBUaXdhcmkgPGFs
b2suYS50aXdhcmlAb3JhY2xlLmNvbT4NCj4gU2VudDogU3VuZGF5LCAyMiBKdW5lIDIwMjUgMTA6
MjkNCj4gVG86IGhhbnNnQGtlcm5lbC5vcmc7IGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29t
OyBEYXZpZCBUaG9tcHNvbg0KPiA8ZGF2dGhvbXBzb25AbnZpZGlhLmNvbT47IE1pY2hhZWwgU2h5
Y2ggPG1pY2hhZWxzaEBudmlkaWEuY29tPjsNCj4gVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbnZp
ZGlhLmNvbT47IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnDQo+IENjOiBhbG9r
LmEudGl3YXJpQG9yYWNsZS5jb207IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3Vi
amVjdDogW1BBVENIIDEvMl0gcGxhdGZvcm0vbWVsbGFub3g6IEZpeCBzcGVsbGluZyBhbmQgY29t
bWVudCBjbGFyaXR5IGluDQo+IE1lbGxhbm94IGRyaXZlcnMNCj4gDQo+IFRoaXMgY29tbWl0IGNv
cnJlY3RzIHNldmVyYWwgbWlub3IgdHlwb2dyYXBoaWNhbCBlcnJvcnMgaW4gY29tbWVudHMgYW5k
DQo+IGVycm9yIG1lc3NhZ2VzIGFjcm9zcyBtdWx0aXBsZSBNZWxsYW5veCBwbGF0Zm9ybSBkcml2
ZXIuDQo+IEZpeGVkIHNwZWxsaW5nIG9mICJ0aHJlc2hvbGRzIiwgInJlZ2lvbiIsICJwbGF0Zm9y
bSIsICJkZWZhdWx0IiwgYW5kIHJlbW92ZWQNCj4gcmVkdW5kYW50IHNwYWNlcyBpbiBjb21tZW50
IHN0cmluZ3MgYW5kIGVycm9yIGxvZ3MuDQo+IA0KPiBUaGVzZSBjaGFuZ2VzIGFyZSBjb3NtZXRp
YyBhbmQgZG8gbm90IGFmZmVjdCBydW50aW1lIGJlaGF2aW9yLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQWxvayBUaXdhcmkgPGFsb2suYS50aXdhcmlAb3JhY2xlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6
IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG52aWRpYS5jb20+DQoNCj4gLS0tDQo+ICBkcml2ZXJz
L3BsYXRmb3JtL21lbGxhbm94L21seGJmLXRtZmlmby5jIHwgIDIgKy0NCj4gIGRyaXZlcnMvcGxh
dGZvcm0vbWVsbGFub3gvbWx4cmVnLWRwdS5jICAgfCAgMiArLQ0KPiAgZHJpdmVycy9wbGF0Zm9y
bS9tZWxsYW5veC9tbHhyZWctbGMuYyAgICB8IDEwICsrKysrLS0tLS0NCj4gIDMgZmlsZXMgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4YmYtdG1maWZvLmMNCj4gYi9kcml2ZXJzL3Bs
YXRmb3JtL21lbGxhbm94L21seGJmLXRtZmlmby5jDQo+IGluZGV4IGFhZTk5YWRiMjllYjAuLjYy
NjQzNzlkOTY5MDcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4
YmYtdG1maWZvLmMNCj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhiZi10bWZp
Zm8uYw0KPiBAQCAtMTI4Nyw3ICsxMjg3LDcgQEAgc3RhdGljIHZvaWQgbWx4YmZfdG1maWZvX2dl
dF9jZmdfbWFjKHU4ICptYWMpDQo+ICAJCWV0aGVyX2FkZHJfY29weShtYWMsIG1seGJmX3RtZmlm
b19uZXRfZGVmYXVsdF9tYWMpOyAgfQ0KPiANCj4gLS8qIFNldCBUbUZpZm8gdGhyZXNvbGRzIHdo
aWNoIGlzIHVzZWQgdG8gdHJpZ2dlciBpbnRlcnJ1cHRzLiAqLw0KPiArLyogU2V0IFRtRmlmbyB0
aHJlc2hvbGRzIHdoaWNoIGlzIHVzZWQgdG8gdHJpZ2dlciBpbnRlcnJ1cHRzLiAqLw0KPiAgc3Rh
dGljIHZvaWQgbWx4YmZfdG1maWZvX3NldF90aHJlc2hvbGQoc3RydWN0IG1seGJmX3RtZmlmbyAq
ZmlmbykgIHsNCj4gIAl1NjQgY3RsOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS9t
ZWxsYW5veC9tbHhyZWctZHB1LmMNCj4gYi9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seHJl
Zy1kcHUuYw0KPiBpbmRleCA1MjI2MDEwNmE5ZjE2Li4zOWY4OWM0NzE0NGEyIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seHJlZy1kcHUuYw0KPiArKysgYi9kcml2
ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seHJlZy1kcHUuYw0KPiBAQCAtNDgzLDcgKzQ4Myw3IEBA
IHN0YXRpYyBpbnQgbWx4cmVnX2RwdV9jb25maWdfaW5pdChzdHJ1Y3QgbWx4cmVnX2RwdQ0KPiAq
bWx4cmVnX2RwdSwgdm9pZCAqcmVnbWFwLA0KPiAgCQkJCQkJCSAgbWx4cmVnX2RwdS0NCj4gPmlv
X2RhdGEsDQo+ICAJCQkJCQkJICBzaXplb2YoKm1seHJlZ19kcHUtDQo+ID5pb19kYXRhKSk7DQo+
ICAJCWlmIChJU19FUlIobWx4cmVnX2RwdS0+aW9fcmVncykpIHsNCj4gLQkJCWRldl9lcnIoZGV2
LCAiRmFpbGVkIHRvIGNyZWF0ZSByZWdpbyBmb3IgY2xpZW50ICVzIGF0IGJ1cw0KPiAlZCBhdCBh
ZGRyIDB4JTAyeFxuIiwNCj4gKwkJCWRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGNyZWF0ZSByZWdp
b24gZm9yIGNsaWVudCAlcyBhdA0KPiBidXMgJWQgYXQNCj4gK2FkZHIgMHglMDJ4XG4iLA0KPiAg
CQkJCWRhdGEtPmhwZGV2LmJyZGluZm8tPnR5cGUsIGRhdGEtPmhwZGV2Lm5yLA0KPiAgCQkJCWRh
dGEtPmhwZGV2LmJyZGluZm8tPmFkZHIpOw0KPiAgCQkJcmV0dXJuIFBUUl9FUlIobWx4cmVnX2Rw
dS0+aW9fcmVncyk7IGRpZmYgLS1naXQNCj4gYS9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21s
eHJlZy1sYy5jIGIvZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhyZWctDQo+IGxjLmMNCj4g
aW5kZXggYWVlMzk1YmI0OGFlNC4uOGVlZjNkOTkwZDFhZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhyZWctbGMuYw0KPiArKysgYi9kcml2ZXJzL3BsYXRmb3Jt
L21lbGxhbm94L21seHJlZy1sYy5jDQo+IEBAIC01Nyw5ICs1Nyw5IEBAIGVudW0gbWx4cmVnX2xj
X3N0YXRlIHsNCj4gICAqIEBkZXY6IHBsYXRmb3JtIGRldmljZTsNCj4gICAqIEBsb2NrOiBsaW5l
IGNhcmQgbG9jazsNCj4gICAqIEBwYXJfcmVnbWFwOiBwYXJlbnQgZGV2aWNlIHJlZ21hcCBoYW5k
bGU7DQo+IC0gKiBAZGF0YTogcGx0YWZvcm0gY29yZSBkYXRhOw0KPiArICogQGRhdGE6IHBsYXRm
b3JtIGNvcmUgZGF0YTsNCj4gICAqIEBpb19kYXRhOiByZWdpc3RlciBhY2Nlc3MgcGxhdGZvcm0g
ZGF0YTsNCj4gLSAqIEBsZWRfZGF0YTogTEVEIHBsYXRmb3JtIGRhdGEgOw0KPiArICogQGxlZF9k
YXRhOiBMRUQgcGxhdGZvcm0gZGF0YTsNCj4gICAqIEBtdXhfZGF0YTogTVVYIHBsYXRmb3JtIGRh
dGE7DQo+ICAgKiBAbGVkOiBMRUQgZGV2aWNlOw0KPiAgICogQGlvX3JlZ3M6IHJlZ2lzdGVyIGFj
Y2VzcyBkZXZpY2U7DQo+IEBAIC0xNzEsNyArMTcxLDcgQEAgc3RhdGljIGludCBtbHhyZWdfbGNf
Y2hhbltdID0gew0KPiAgCTB4NGUsIDB4NGYNCj4gIH07DQo+IA0KPiAtLyogRGVmYXVsIG11eCBj
b25maWd1cmF0aW9uLiAqLw0KPiArLyogRGVmYXVsdCBtdXggY29uZmlndXJhdGlvbi4gKi8NCj4g
IHN0YXRpYyBzdHJ1Y3QgbWx4Y3BsZF9tdXhfcGxhdF9kYXRhIG1seHJlZ19sY19tdXhfZGF0YVtd
ID0gew0KPiAgCXsNCj4gIAkJLmNoYW5faWRzID0gbWx4cmVnX2xjX2NoYW4sDQo+IEBAIC0xODEs
NyArMTgxLDcgQEAgc3RhdGljIHN0cnVjdCBtbHhjcGxkX211eF9wbGF0X2RhdGENCj4gbWx4cmVn
X2xjX211eF9kYXRhW10gPSB7DQo+ICAJfSwNCj4gIH07DQo+IA0KPiAtLyogRGVmYXVsIG11eCBi
b2FyZCBpbmZvLiAqLw0KPiArLyogRGVmYXVsdCBtdXggYm9hcmQgaW5mby4gKi8NCj4gIHN0YXRp
YyBzdHJ1Y3QgaTJjX2JvYXJkX2luZm8gbWx4cmVnX2xjX211eF9icmRpbmZvID0gew0KPiAgCUky
Q19CT0FSRF9JTkZPKCJpMmMtbXV4LW1seGNwbGQiLCAweDMyKSwgIH07IEBAIC03NTgsNyArNzU4
LDcNCj4gQEAgbWx4cmVnX2xjX2NvbmZpZ19pbml0KHN0cnVjdCBtbHhyZWdfbGMgKm1seHJlZ19s
Yywgdm9pZCAqcmVnbWFwLA0KPiAgCQlwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfcmVzbmRhdGEo
ZGV2LCAibWx4cmVnLWlvIiwgZGF0YS0NCj4gPmhwZGV2Lm5yLCBOVUxMLCAwLA0KPiAgCQkJCQkJ
ICBtbHhyZWdfbGMtPmlvX2RhdGEsDQo+IHNpemVvZigqbWx4cmVnX2xjLT5pb19kYXRhKSk7DQo+
ICAJCWlmIChJU19FUlIobWx4cmVnX2xjLT5pb19yZWdzKSkgew0KPiAtCQkJZGV2X2VycihkZXYs
ICJGYWlsZWQgdG8gY3JlYXRlIHJlZ2lvIGZvciBjbGllbnQgJXMgYXQgYnVzDQo+ICVkIGF0IGFk
ZHIgMHglMDJ4XG4iLA0KPiArCQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gY3JlYXRlIHJlZ2lv
biBmb3IgY2xpZW50ICVzIGF0DQo+IGJ1cyAlZCBhdA0KPiArYWRkciAweCUwMnhcbiIsDQo+ICAJ
CQkJZGF0YS0+aHBkZXYuYnJkaW5mby0+dHlwZSwgZGF0YS0+aHBkZXYubnIsDQo+ICAJCQkJZGF0
YS0+aHBkZXYuYnJkaW5mby0+YWRkcik7DQo+ICAJCQllcnIgPSBQVFJfRVJSKG1seHJlZ19sYy0+
aW9fcmVncyk7DQo+IC0tDQo+IDIuNDYuMA0KDQo=
