Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E51413AA2A;
	Wed, 14 May 2025 22:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747262414; cv=fail; b=heU7C9nlJuxUXrC+FnnYONGZBfDGif/iyn3Av6fLvlAG7Pv0hh3qil/6ypWfmsOiOSPcmc6GnubCMwkwhQQzo6OsHVsMa4vPrt2vzHhLEdPdlL+mJBX1xibwEk756G1Ti6ytA+Lb3/fnv6+5eJjAcLY8TqtZICp7p/P2KsGR3zQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747262414; c=relaxed/simple;
	bh=3eShwHmXJSa7U5eu9nkzZLB1q2sjO6zCr9QbGZOdTPw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uiGmKQY+9RbmRJO0aow4rs8seylrYZ3Gbm0AwCLB3CfOBgn7DgAFD4/O+yLrtjVXB6OHEccMTLT7VBvgr72a2pZiVmWYRlRH8Zd0EYNol5jsFQ8kCkB8vYCfFTQw2fKoxVVGZcamZc/xXkiKEBflHsG3R5RtRiS2KJeJXkP9ihs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NYKmaIsm; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NYKmaIsm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGi341eI14UeJm8pBjCg9iv9bE3tATM6QxK6Hs4tBdMW5VOdmNWRiiGAFgLhkb131mzMO3GdZhj1YELgTwnDG3kAjzjTvjXnMxnYEed4ppCdE6RKcU/+6ge4DqfGgEjW/ayBFI2N8E4RgTtkiQpGjuHzP8IDskpCKCT2/KfNYPZWuQOCL6It5wwMJeA92Z0oYgtUciEjnBS8J8o0DoeaNkmh4S8DVFzkqh6IuSrDJgtxezRjiuK0VyeAXadRhU9ZptRsdk5j6s5GtHcffmVR1q/Q8z8aSEHaa4vwOzS4/uUqtCArnR7gtiS3Sanr7zBD3J1nTCygFGQnAy3FMLgMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3eShwHmXJSa7U5eu9nkzZLB1q2sjO6zCr9QbGZOdTPw=;
 b=svywyG+M/UY/nDcF9ha8k95BtgeueevWKbN493wUTEtSxcwWlTICBWvZOkvdQyXgC+US8gFoiHlbIh4oA2s/0dpg+laSHK809Q+h50FRn+TzgD+kUIL4JU3cbKxXUBmGxYctgZHyoA5GjQZGg3mjGXaZuQ17/UJQxdj78QBk0D+bgnMawHbeLL3zrRd6iQslFkbcY8rTla4NfMAIf5ZYYiUwpBi01oAfvpk1IGngQZ6Q32FZVLF9oC+p0JS9ORUkEyqshlLCaGr/7tbl4XtMWvjbZ2/QL2aeSeA+lPuIjsCrdQm3zxw42CIJFpLbDXMNeB8tqhX993CYtNCFASA1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3eShwHmXJSa7U5eu9nkzZLB1q2sjO6zCr9QbGZOdTPw=;
 b=NYKmaIsmukuwewufmB9FrqnE9is/xfccEsA5heyIvzMrXSAIORB97/vlJDq1mstctkIFVMAFnj73H5A3EJ4irm8BHSxnA1LtBKlOox1l17ReeYgZg70IHcosdJbFxE1/rX/AItbItM9jKQtw/fEJzN0n+G3WaaA4lzwnc9aDi4vtJi6dLEX3bzP8QtEtYruprhRcM1Qyk4BVqSuAvCjimew5p3oFO7ygGt/FRYh6fiCrqqeesV6cT51AIHao8BP/6C5BZ4h/yxfVpmWo+azPM5yLpNy5IlfUEHQi1hEhMpaJ980e6oJFCX93N6PMd9HX7645fPAEyFv793zkdnikmg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS0PR12MB7656.namprd12.prod.outlook.com (2603:10b6:8:11f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 14 May
 2025 22:40:09 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 22:40:09 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, "mmaurer@google.com"
	<mmaurer@google.com>
CC: "tmgross@umich.edu" <tmgross@umich.edu>, "benno.lossin@proton.me"
	<benno.lossin@proton.me>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "gary@garyguo.net" <gary@garyguo.net>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, "lossin@kernel.org"
	<lossin@kernel.org>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"aliceryhl@google.com" <aliceryhl@google.com>, "ojeda@kernel.org"
	<ojeda@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "samitolvanen@google.com"
	<samitolvanen@google.com>, "rust-for-linux@vger.kernel.org"
	<rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
Thread-Topic: [PATCH v5 4/4] rust: samples: Add debugfs sample
Thread-Index:
 AQHbvhiqMNeyew5UtkaK13bmqI7ZnbPRxT2AgAAdqwCAAA1QgIAAzP+AgAABqICAAAJ/gIAAAocAgAACMwA=
Date: Wed, 14 May 2025 22:40:09 +0000
Message-ID: <d61e11e2d99659cf13d0e20f56afe319720d03b7.camel@nvidia.com>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
	 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com>
	 <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org> <aCRdNJ2oq-REBotd@pollux>
	 <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org>
	 <CAGSQo00Pj0qF90712K7xACNEvr2e0q=98b8-0VUcXLD5V+oDhg@mail.gmail.com>
	 <aCUVuXO_jORqlxwr@pollux>
	 <CAGSQo02nP8MT8q-_gQwjUGFNSyiW2AKOQ3V4yy9jofDzjc0SpA@mail.gmail.com>
	 <CAGSQo017FgGmStYxLX7JeqV+AcMUMjmnxF6KBesFhc31BieBbw@mail.gmail.com>
In-Reply-To:
 <CAGSQo017FgGmStYxLX7JeqV+AcMUMjmnxF6KBesFhc31BieBbw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS0PR12MB7656:EE_
x-ms-office365-filtering-correlation-id: 24e625b3-ae86-4c8a-e76e-08dd93384815
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SnlHZUNjbHEyUnFYckt6WHFvZmY1WnhYeElOOE9KVENaRm1PWXJvdFZhQ1Rs?=
 =?utf-8?B?MldFWWRDM2g1QVpGbFI4MDhlY0ZzYXR5Z3J3ODE2dmNSaVZIbTNLS09XZ1N0?=
 =?utf-8?B?bU1WckNHN3IrVFQycFNqckRlbndTaXdkOWxNU2duVzZOdlFTNWswWFVSOHpk?=
 =?utf-8?B?ZytHZ0JHdFVxLy8vTVoyOUhGSVNpV2RJZWkzdkxieE9ucFRaWjNkekNMTENi?=
 =?utf-8?B?azMrbVJDZCt5R0lxY1cvbWg5VnB6b3ZicFhranIwWXpmTXR6dVRqdGxmOVF5?=
 =?utf-8?B?V0J3eEw5OFMrMmhyVnM4Zkt5czd3azgvTDFhSUh2TXRzdG93OHpudnh5YmdW?=
 =?utf-8?B?R0Y4LzFYOGxxOXd6azBIamNGa2t1a29lZ3VUV1h6OCt3VDhkR3lQajRjQTlj?=
 =?utf-8?B?V2M4UjliMlVsbXpVUjNuUEpJYW1OWDJXMEdFYmJBNDIxYytmZGZWTys2TmR2?=
 =?utf-8?B?M3l4ZXNJNWIzM2Y4bFJEZFQ1NGhLZmZGOHlOdGE2VjkxUVBHdEgrcjA2aTJq?=
 =?utf-8?B?MEhscndzNTArUmtXb1FaWW1QUGM1cXk4T0RESFVSZnFjaDd5Vk1IWXZER0hh?=
 =?utf-8?B?T2J0QUdPbXpkL1hqNWtWUUxzbHRTMlZCVTR1b1pERlcwSmVkbjVFTHM3UXlR?=
 =?utf-8?B?NEhNNWF0S2pXb09JSFp0NUU5azh3VUExaFYyUXptNDR0UWpObi9US1pjbm8x?=
 =?utf-8?B?dFpoOHNyTUU2dFhCS0VYVHlKNUM5VDJiaXI5R2RGOWdSSDQ0Uk10ZkVxTmdx?=
 =?utf-8?B?WFpqdG10VXhHbWRzeERTR3Z0cTU3WjhmNFhYNmV4enREaW9RWWFNdnYyRWEr?=
 =?utf-8?B?TldVUFhWc3V5S1F6NUVnb1Joc1ovZjBrVTBVczRKL3l5b1R2cTY2SzhPdnIv?=
 =?utf-8?B?VGRSd3lGbVpGdENNMERhUDlEckhKZ2dJMk83UTIyOU9ua2hycGpIdEJMOUU4?=
 =?utf-8?B?TldOUy9QMlR3TXVHUUdLQTAyN3NIRWRWLzZud0Vwbmo4YVNLTTZQYmgyUHlY?=
 =?utf-8?B?M2ZTWUZRR2h3cVM0RzFQSllEeXVVUGExaEdZS2JJak94ZGgwZW8zS2M3S2Ew?=
 =?utf-8?B?QVJjNm43RGt3KzNGaVNrdFNVN1Q5Y2xhOHZ5N2ZNN1Y3VFREVXg0alJCa2NJ?=
 =?utf-8?B?TWFTV2lwTm9YaHg4eExCS1lCWVVMVndlc0w5STNBZXBqYkdoRlkvOTlZNVRz?=
 =?utf-8?B?OUhCbDZTaTJWb05MS1owSytva241L25MZE5oOW9LTzJWdTRHMEpwMDdNTVhI?=
 =?utf-8?B?OTduUW1EeUcvd0JPMTUyV1NIUVR2bnh5NGJoakpCVEdjSmI0NlVrR2gxMEkw?=
 =?utf-8?B?dTBGamRzTm9zUlk5K0ZLc05KL3hUNHVyVTcvVzhmdE9aTUhFbCtJMi8wZThx?=
 =?utf-8?B?NGRGTTV4TGp6dzlCUHVYOE1lRTFsekN5YVg5blFrZ0xwWFBMVnpYUnNFekhk?=
 =?utf-8?B?a1VUOXNhRmJDSDVPam1mQUFUYzE1NndPdmtpVVZsalVLVTl1eVNPVnhsN1V6?=
 =?utf-8?B?MFhCQXJ0S3BFTGxhbUdtM0w0REtnWWNVVDBzZnpkWTlqV3VEdjYvZnpvOEVP?=
 =?utf-8?B?TXU3Vk53TUZETW02ekp2aHNRcDhVSmF6NDZjNHNmRnlOcDM0YkRJb1BLMWpU?=
 =?utf-8?B?YkZEMStaYWp4cWtjbTdmVEJwcXcvWm5sLzQ3K3E1QllFSmJhTlRrenRsMndP?=
 =?utf-8?B?ZnJMNk5VbjBHMlk1RGVGdVk0aHJQVkM3R2xXU0FvSGRXeWR3aEtSRTVBZWlQ?=
 =?utf-8?B?d0pQRUlvcmtQdjBiSWJXV2M0Mlp0V2NUL0h4OWdxU0dGWlplRUxuZXM0Wm9C?=
 =?utf-8?B?eTA2SHlhN3BwL0NTeWR6KzFDaHZJamFjVUh2b0dTNTVWUHlDVWZ4QWxvSWVF?=
 =?utf-8?B?QTlTMHFYVW9ENDQydGI5WDE3UENSQTF5ZjFKOXpDV3k5YStHV1N4TWN0ajRP?=
 =?utf-8?B?bTZaTkRTb1lSYno2Z0doR3J1MnJGcHlJN3NsVjY0eGh0U0krSjJRa2NURkFP?=
 =?utf-8?Q?PPhgQK4HvXBWhSNPNdMEQYkJFl9evg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6526.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L25GS3RmMWhCWWFySnRIdmVkOGoxcHRUaGFFY3M2WXBaZEpRcDBZYzdpa2JF?=
 =?utf-8?B?cjhJYkJvUmxOZlYrc1p4djdONTBZS1ZVNHNWdWRGUlYxdUg5Szc3dzJLbHRX?=
 =?utf-8?B?TEQvK1BTWjNLYngyQ0V6MEJVUmRzcjR0REZtVktqMmpMVFZPS1RuMUhpT3hi?=
 =?utf-8?B?WVc1VTQwYWJUbFFmMDZ2QXNpdzNFYTRreURORlZ4YkJXejNZaGs4eUEwczJa?=
 =?utf-8?B?M1N5Wjh1S3BTRTJqdkMzeWdMYS9zQ2dyV1NHWlVOcjdPTzJNc3dnazhmc0cz?=
 =?utf-8?B?WTZiNllMY0RoOGxRVHI2THU1TEZjRDJ2QlcrRE56NEUvc1AvOGFIQjNSay85?=
 =?utf-8?B?Y2NZYnNYWGJ2VnBDRUtZV1RtNnNJSjZwTUZWN0RSWVMyaEkwU2V3cXFBSGNn?=
 =?utf-8?B?RzZacFJTRyt3OFd2U2syWUxnK3YweWhQNkxYUjVtclJUMWdGZ3RBVG9vY0d4?=
 =?utf-8?B?RkFmQW5QVTVEZ2NUWUo4YmVzMFE0WU53TEJrbGZja3ZrdUUxYlVVL1N5WWhX?=
 =?utf-8?B?YzlteSs4bHFaTTIvYXJ2bFFBMWhHU1pJTWcxR1JvTjIzb3lWUEJWdjdleWlk?=
 =?utf-8?B?d0MyM3lvMjZ0ZGxUSW5BS1kwWWtsWW44WklreFNHNUhyZHUzd1ovcFBrNzRn?=
 =?utf-8?B?aU0rZ0hna1FOMXZTWlp6SlFEK09vQi9rSURwZGxsNThFOTBjQmUzL0lZQVF4?=
 =?utf-8?B?dS95cGJFRWU0SEFieldocDJZWFB3S21RYzJOamwxTzJFa25QcTFvUEVVUDlM?=
 =?utf-8?B?RTN6Zk9UdnZUMG1YRHNvbk5ITmxZZzNmbnpTZzNsUExWOTY4TDhKV240MWhK?=
 =?utf-8?B?b0JSUUkvSkdNcnBqZWtrTnlyendGa0xscC84S2FmSllZcG43SFh4d0FqeVBL?=
 =?utf-8?B?SlNrQ1JNdTJ0U3hodmx6TG5jcytJY3o4S0VhUWFabDVOR25UdFlFZFgyVGQv?=
 =?utf-8?B?NmtaY00rOTFGWWozeEc3eWZrSDRDcGtqbkdhUTdWRU5KRVUzaDhxeGdkVkFi?=
 =?utf-8?B?SkdGWUlxQXFUci9YU2tXRThJdmE4d1hQVXAzSXZISjhLbUR3RDBUQ0lWZ2FB?=
 =?utf-8?B?eGdzWjlwbEFJZTRJZTdNQ1lvUUF2Q0x5eUYweFlFZG14VFJmVlh5Y2xWQlNh?=
 =?utf-8?B?d1diVFEydzlyWVF1SG5SN3VBS2FJSzZnSmFmVDdDL1JnS01Ib1BSN25HU3ox?=
 =?utf-8?B?OGFvdk5yU2dPUW81UnhlRjU4ZThxZ3I0NGE3SmV4ejV4d3BkNVQ0aGpmSXM0?=
 =?utf-8?B?LytQZFNLczRuNTlvci9CRDJvOVZ2SHVJMmFyWlAxclRSdlFGaGd6dGZSYUlU?=
 =?utf-8?B?U0RwWGs3R3lXUkpjbitJRDZDYVhwSmhud1FLNnU5TVN6QlA4NnJySVJ3NjZC?=
 =?utf-8?B?bDhYZGRFQWtVSW1FNDVZYTZmaW9abHJiZU56c3BLWm1kb0xCdVFwUHhRZVdI?=
 =?utf-8?B?MjFXS2dhZG1aVEcya1RleDVPbWJGeW0ySXB4L2JGbHIzVkJTb202ZXFqTDd0?=
 =?utf-8?B?N3ZLTXpUMUh6QUdJT0ZQWEF3VG10UWI1UHMrODkrRllVN1hXUVpOZ2hmSzdh?=
 =?utf-8?B?bmdaN2xRbjZ2SFFkOTNOZTZ0Vk5yemVWVFFoYWdWSk5Zd2VmZmNqeUkvbWZB?=
 =?utf-8?B?MEQ5VUNYYkdPTXZ4QjZMbXlHK3YybG5Ea2I4OFREUTM1WTB3cVBpQXVqMEVN?=
 =?utf-8?B?NXBZa3cxbU9IaVFyRVJqZ1VWMktneDdMMkhXWXlXcWpKWEcvVnhBczlnMnF6?=
 =?utf-8?B?TXZMajFmZFRiRkpYYzdTWTN3WGpBOUFvWnA2UHlEZ3hZT2tEdWczVlgvM29E?=
 =?utf-8?B?cVJxV2ltMHVVeDVQNmpEcXdqbkI4SzRTTmVEencvLyszMmY1M1Y0eGFTc0tq?=
 =?utf-8?B?ZDN4UWViWFRVb2EvNjRtMU1ZMWlYMXV3ODFHeG1nckFkOXZNajgycDNKUk5Q?=
 =?utf-8?B?RnBMdHJyQkdUK1oyRWxPZk1hWU9sU003K29FQXNQZEZtakFWVjkyOVpJZ1Bo?=
 =?utf-8?B?bU9QbUlwdHcycWNjVmhsdngzc2d5eldleVpiMzdYU1VoNnJwbi9lQmpQb2pC?=
 =?utf-8?B?VzQrR2hqVmo2OVdRR0lZa0NURWNicnRsZWhqSlE5THZXUmk3SWRydXFSbEhk?=
 =?utf-8?Q?NQWJ7UhUIYpy6C5W7WtHk0Qgu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C42F0A9DA6817B438353A41AF2BD8DD7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e625b3-ae86-4c8a-e76e-08dd93384815
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 22:40:09.2790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rD3eXG1Q/z9NsITSXX4f80o6LaYs9EoPXZi0ESzzNPMZ+YCCaF8iVesJRCeHjQmzVnRkZTKdndQcJQApGkSPTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7656

T24gV2VkLCAyMDI1LTA1LTE0IGF0IDE1OjMyIC0wNzAwLCBNYXR0aGV3IE1hdXJlciB3cm90ZToN
Cj4gT25lIGZ1cnRoZXIgcG9zc2liaWxpdHkgaGVyZSwgd2hpY2ggd2UnZCBuZWVkIEdyZWcgdG8g
d2VpZ2ggaW4gb24gLSB3ZQ0KPiBjb3VsZCBhZGQgYSBtZXRob2QgdG8gdGhlIGRlYnVnZnMgQVBJ
IGludGVuZGVkIGZvciBSdXN0IHVzYWdlIHdoaWNoDQo+IHNwZWNpZmljYWxseSByZWxlYXNlcyBh
IGRpcmVjdG9yeSBvciBmaWxlICp3aXRob3V0KiByZWxlYXNpbmcgYW55DQo+IG5lc3RlZCBlbGVt
ZW50cy4gVGhpcyB3b3VsZCBtZWFuIHdlIGNvdWxkIGdldCByaWQgb2YgYWxsIHRoZSBsaWZldGlt
ZXMNCj4gb24gZGlyZWN0b3J5IGFuZCBmaWxlIGhhbmRsZXMuIA0KDQpJIGhhZCBhIGNvbnZlcnNh
dGlvbiB3aXRoIEdyZWcgYWJvdXQgdGhpcyB0b3BpYyBqdXN0IHRoZSBvdGhlciB3ZWVrLg0KDQpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1kb2MvMjAyNTA0MjkxNzM5NTguMzk3Mzk1OC0x
LXR0YWJpQG52aWRpYS5jb20vDQoNClRoZXJlIGFyZSB0d28gdmVyc2lvbnMgb2YgZGVidWdmc19y
ZW1vdmU6DQoNCnZvaWQgZGVidWdmc19yZW1vdmUoc3RydWN0IGRlbnRyeSAqZGVudHJ5KTsNCiNk
ZWZpbmUgZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlIGRlYnVnZnNfcmVtb3ZlDQoNClVuZm9ydHVu
YXRlbHksIHRoZSBkaXJlY3Rpb24gdGhhdCB3ZSd2ZSBiZWVuIGdvaW5nIGlzIHRvIGdldCByaWQg
b2YgZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKCkgYW5kDQpoYXZlIGRyaXZlcnMgb25seSBjYWxs
IGRlYnVnZnNfcmVtb3ZlKCkuICANCg0KV2hhdCB3b3VsZCBzb2x2ZSB5b3VyIHByb2JsZW0gaXMg
ZG9pbmcgdGhlIG9wcG9zaXRlOiBtYWtpbmcgZGVidWdmc19yZW1vdmUoKSBiZSBub24tcmVjdXJz
aXZlIGFuZA0KcmVxdWlyZSBkcml2ZXJzIHRvIGNhbGwgZGVidWdmc19yZW1vdmVfcmVjdXJzaXZl
KCkgaWYgdGhhdCdzIHdoYXQgdGhleSByZWFsbHkgd2FudC4NCg0KTWF5YmUgd2UgbmVlZCBkZWJ1
Z2ZzX3JlbW92ZV9zaW5nbGUoKT8NCg0K
