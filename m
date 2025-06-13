Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8703C22FE17;
	Fri, 13 Jun 2025 13:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822392; cv=fail; b=TueCkf34AjUxS1p3p/M80MJW8btqMl9GE/PGyIetwBjE9Ljiiz9jvhYJZmOCHQzQZb53bNgTjaN7FX7I0is647We9YipCKC5hkXFsmTXv0f8aETTtix8i6/JmcLzciV/Bttk/fvadyLCbC6xOiv+80rQYl4mpY8A7QervaqnN0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822392; c=relaxed/simple;
	bh=OXrrbPEX9HVy5mlE9RiA3rGbQkwIEv0jpUB68B8G1Fg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dqtNSoeVhWVLxqgXVxqeZcAb2e1kWfXdgOjOtspxvOwv942WVmM+myiZ4gTp3I615iwAT2CeQ8N9MukoQDYkYRJkJwbrYWAPUnaHdrzS3uf9YIbZmnnF+KXoKJNs1TD0hyrOoPsuqqqByjXcDsklPEO6mpkJzswkoFGJd12++HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FxjNJc2W; arc=fail smtp.client-ip=40.107.223.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FxjNJc2W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2VYuUctCa1T+fPDG1F2tDFeB305859pHWl9Zdf7V30KQMnl6Ul3n59pKYZn7+XBegpjo9WGADFjAlZrCTonSYyhmiBN7eyx7Vi4BHIzsbTdEqLX+BZ+xvvNaM7QOs3idUY4GfKtzkzIyuHwomva1qfSaMJS0f/jt0ujGDZnUMjwPUEREnhe7bdYpt3SGDm3ykLt/YvNmBskrFJd70Zrmo27IUImBrx6NZB+gj7R0bmu5X8GLD6dWa5XjZ0ZgDOQyJkxND02mYU5/urGxkSMWbWwdzuQLH3L5o2PetfPNeoUXS7VUHOGRTwujYQqVLwTZaGThRrXRgF/svMMOXnXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cozEW4Sdu8jWuvtjvqr2nqF+i2+Vm4FuHVL+ALZ9Z+Q=;
 b=W76KGiTaR6M/9ueDcQUJIfz6CBmQNB36FSDI2cCUzwWiIMoOugrqm2ZS57nDYDDba1tjasXqXFlyzBnywKrGIm70Yz3Zo0B+l8P4tTJukCC3IrU1XpIdXjRfgGxJNy14SM6msuo+4wBQTGFBq96W54aa/XkfxanfRsr1OAyzbPZ581tCdEAqVjLV13vdc6jj+cXvD60wOpWsTxrxPIvfX/lhMRGtJvURaJQfWQyJZmo3rdcWvnQ6m6B9qxzWRtFwaVamepm2muXsbYCeEkpNFCWPusFDpAAxast5OSoXrVDFQme8uKMjPYAKXNkzJWnf48BKFnrW5csWDI/J7sr35g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cozEW4Sdu8jWuvtjvqr2nqF+i2+Vm4FuHVL+ALZ9Z+Q=;
 b=FxjNJc2Wpn5oM2pDXgmP5KEoLJ5s/OmOIT66+G5a3R89Reg565uA40732g6Vb+Q/6NACJfW80LulIoybpuBcI+JyP126yUG1nTwwPG/Ep+QnS84m68/x2aVFnGuueWj0s2kerLuP4mfkEnyHHMa0r2w1MsRxMgvt0SIH3jmHkHrny64pTPO4WkSmsGYcPKMSg2D0hO3S4dvrIWBUi/y7KDcnb7MvKVdM7no0jxBbd0hpC8lKfar36ynMBIG8dhtfr+x9J3cfOvQdYI8mfuMFy5xV039Gh6CM2g943VizaWnOzoDW3/ICoD/aUbiQJ2aiGe7xigJ32JFpqlamiT6B7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7892.namprd12.prod.outlook.com (2603:10b6:510:27e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.37; Fri, 13 Jun
 2025 13:46:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 13:46:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 13 Jun 2025 22:46:09 +0900
Subject: [PATCH v2 2/4] rust: sync: implement `Borrow` and `BorrowMut` for
 `Arc` types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-borrow_impls-v2-2-6120e1958199@nvidia.com>
References: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
In-Reply-To: <20250613-borrow_impls-v2-0-6120e1958199@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP301CA0028.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 91345ced-bfb3-41ca-d00d-08ddaa80b234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzZMVkdTT1VXSmhJbFZ2d2o1UFI0Y29NSGl5RldvTlc3QjRVQ0ZRSkhzNFJC?=
 =?utf-8?B?K3Q5N09wM1NXTm1VN1dYaEFEVTBMZlpMVUZxVEVwb0FGbEN1T090MHBmRGN5?=
 =?utf-8?B?MUFyeU9yQlJTQzQzODA0UUhjbjdNaytTRlJhb1p3eDF2RVVKd0E3eVJqdndi?=
 =?utf-8?B?VWRMSFFiWm16RkNCdzkwZnJtR1NGMGtJbk9rM3QycTNVcklKdS9saHhORWNB?=
 =?utf-8?B?bU5wWnZZeFI5US9JQjBQcFJpelAzbWh6eFdGeUJhekpJUy9MbkNYdXVLek9T?=
 =?utf-8?B?cm1hNk5mY0xlcGZIeW9vVDJqSWtyTy8xTVJIYkc4UjBKVzdVT09rZnBaL0JE?=
 =?utf-8?B?d3BsQmRnbGdmQlhSV2VhWmpDVEpBcmdmUTFsS2xRYVZXUU9TbiszMy92M2Yv?=
 =?utf-8?B?SlMvYllTaVU1eXhWSXA4ZEY3M0JuUWhlUFozbllUQmsyTXBZNUl1NUtWVFl4?=
 =?utf-8?B?SlQ0UVVyRzNUcmRLakx3MnRiT0FkcHB5elNGWVJPdEhUWS9nWkkyc2JGVjJB?=
 =?utf-8?B?Ty81a3dtU0VlT3lvUE9OODhVRlp0NTJPSW5jVlc3bjZORGFVU0dLNk82K2s0?=
 =?utf-8?B?MG94Y2tVYkg1NmhyTS9RUTJBR2V5NE1hZDlrQk42bHdCQm9UTXNzZEt0amVE?=
 =?utf-8?B?TmJPUEs5UERUY1IyTmt5RTlzNm1iSzU4SjdJNUlzS0QvUEJaQUhrQUYxeUxQ?=
 =?utf-8?B?VFgrZ2dVODVTbVNEQ0dZWVlCa1J0YkZ6TFg3Z21zMHIxcWhBTFVUeThKamNs?=
 =?utf-8?B?OXAvTDVyU1VIUUYyTGhlVjdSQzEwOHljTFBpcHA5eGNCbXd6VVUrMFRubG9X?=
 =?utf-8?B?czlBZFhSVkpaNTlmbWNwZk9xSTNzczRrZ1VkZ3ZUeHhBV1ZRS1E4TTZYdEFR?=
 =?utf-8?B?aEg2cTVicm1vQnZBa1EvY2RaUTJwT0NlWDJOUFpLbDFCelVZUHlHNGtxOTB6?=
 =?utf-8?B?eWkvdzY5b1BBdlNZWG1MYWZwM2ZpOGdYS2tZNkM1N05adEphOEdYeFlqb2E3?=
 =?utf-8?B?ZW1TeHEzQzRvVXVLRmoySHRaVGtyRVNRVUpPR1BlNXV1WWNOclRhcXk5bU95?=
 =?utf-8?B?azJoN0UraGhJVXdnbXg2RXpGT0F5ekRhSjV4ZFp0eFpFRVJQRzJxd3NmZUo2?=
 =?utf-8?B?SFFSU1ZRbEpVejd4aDFUeHhVQWhQNEViaW1wRDBHYWdiQXBzYjB6alU3aDhC?=
 =?utf-8?B?cjZoV1hWdXpEZTVjTVJ4U3Z3Z2lQUWtZK25oS0F5WTg0M1dLajUxOHBUVzk2?=
 =?utf-8?B?V2tjdkw5VWgwMStHeWIwdzNlenJyTWhVNXVVN1Vlb2Q0aythNDJlcnlMa0Nk?=
 =?utf-8?B?T2pYWUpzb3lIa2UyQmhZSkU3dUJ6eDdHMjdBS0t6OTRVdlRXY3l4ZnRkeUI5?=
 =?utf-8?B?bDZHMEw0Ynlqdnp3eVBZcEgzUlF2M1FKd3V5NmRjeXYybG0rbmVZMUlFeFAr?=
 =?utf-8?B?N2RzOTdFeUtCOUpCeE5HOUZRV3lRUDhRZDE2WjZnUXVaRWVUQ0QyZlN2ZFcx?=
 =?utf-8?B?d2FxU0FkUTRRcjM0b2tHNTNPM2lDYVlkOHc1N1BjdG9yMHdmaGROV2JCRUJh?=
 =?utf-8?B?WnZBbm9JQkV6UTEzaTNSWGVQM3M2S3haS0ozNjBzT3pDdGlHTTBXdTNnZzBk?=
 =?utf-8?B?TisxYm9WTmEvbTJITFJaOEd2d3o4NnBLN0FxMmtnRlU4YjMvUmc0VVNoQ0gx?=
 =?utf-8?B?SWFDdkl1VG1aeWVteGVKL3VCeXFqVDdiVnRJSi9FL0RUQTFHWEQyRnpSVzMz?=
 =?utf-8?B?WFFxV0dvcmk3ZExTcXJmSHlOV283RStpZG1wRk0vL045OFBrdFB5a214NHRE?=
 =?utf-8?B?Q3FFVkdTcDFWT1oza3ZwMmV5SjU4eElTa1dIbDZEMFpsRWZ3MlczSzJIbkxs?=
 =?utf-8?B?Zi9PVVVhY2w4a3J0MlNneDZsdm9CbDFXMGdFbGhUUk82L3MrQlcwUGRvbEVs?=
 =?utf-8?B?bkVSZWdmaDg4ZVQ2aWNhQUNYSXRLVTZpT3RUdDQraUREQklzVE1aOGJxTWU5?=
 =?utf-8?B?cnhkNWlmUlZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1dRVG5Odk80S1pmNldhM0s4bzA1ai9IOG9xK2RSSWNXb1ZnbzlhUnJsZVhx?=
 =?utf-8?B?Zi95R3hqSjUxZWg1QVRkRXp4UUc0cEFSYXk4d2I5ZGRLQmZDYVkzcmxDWmxi?=
 =?utf-8?B?TnB5UldtUHdqaTRXc0VXNW8wK2s0cXFjYXdVUzVWQVo0OGpZQWViMTN4N1dL?=
 =?utf-8?B?ZXphc1BTMUFsT2hkVldxZ25TNER2NWhBZGxlRmFoMFNGL2tFOVY4WkNManFn?=
 =?utf-8?B?UUNNdjdFQjN2MENLb2FTRGd5WEVWaVNtdWpubHdncEExaERqQzE0aDZNdE9r?=
 =?utf-8?B?V3BmNDFQdEl0d2loYmlCTE4yaHhkMTJsTVFwNU44bFNMV25tSHJmWnBveWtG?=
 =?utf-8?B?aktuMDdCemQ4bE5PUm1FVjlPeVNJRzB0dk5WRWwxb09EOFJ4T3AxVTU5VWZD?=
 =?utf-8?B?VlVlMFNyWDFYQmkrV0dsMFlwY1pJUjNIMGdjajNQR29DUE1QS3FYdHhlSmNT?=
 =?utf-8?B?bnpxQlptMjJoWnYyblZFeUY5MzFvcFBBb1ZzZHRyNHRaS3BQN25FU0h4SlBr?=
 =?utf-8?B?a255SXZhMWJ0M2JNSkkxUmJMVjN6ak1CQzN2Znp3NHFabDMvU1MvZWMvS3N6?=
 =?utf-8?B?b1JkMmRKRDZkRTUrTGt2cXNKWWx3dC9JbTN6VTRCWVNHcVFxUERicnRmelBG?=
 =?utf-8?B?Z1dMWjVmYUtnNG1qejhzZGFtdlgxYkJxclNzQlBSSk5UUWI1cGErR0oxR050?=
 =?utf-8?B?ZFRSMU5OS1FWR0NjeWtWNmhnekxidDZ3dEx1ZVNqUk16Z1NNZ2Nwb2p3MERJ?=
 =?utf-8?B?QWZibVRRcHMyTlVCSFh1R042SUJHY2xCZW5Ra0ZRMGt3L0UwaU5FbGQ5b2hS?=
 =?utf-8?B?bzNWaW16c3pDS1RKQTNGQTloaUlhTlN3SmI1MW9UVjlzT0R3dlhkbnBHUWtT?=
 =?utf-8?B?a2c3bkl2NW0rdkh0SnhqNHBiV1VYNnB2cnZqYW9tWk81cmlhOUlaZU1BUjV4?=
 =?utf-8?B?YmhrVkR4aE1ZM0xSeHlxRTN4VXRZTFBhd2MyV0FscnBLL3FSQkF3QXg4aHpU?=
 =?utf-8?B?RVQyVmZLeXpVSXNiV0ZhSGpkN0szemRTenI5Q3NVejAvT2YydHdZWk82aFhD?=
 =?utf-8?B?dWZsNnB2YWlZdk43VkU4R2xpNEM5dGROUm16VGZyZlBsS0hCWlZ0Sndmd3N6?=
 =?utf-8?B?enpITzhmcVhCbEJabTBZNlZ2ZXkxdmZnSkR4bzJZMVUxRHZvRm5oZ3pZZUpY?=
 =?utf-8?B?bVRyQWhVcG1hdTh5Sml2aVg1ZEpmb3J0VGVmNmQzS29ncDVIUEYvT0xwQ2hC?=
 =?utf-8?B?WG8vR2xpR0NkL3VKU0Z6QXE1b1lRWDdsc2FrdmR6RlJBUFBDeFF5N25hK0g0?=
 =?utf-8?B?R3IrRkVOS2RnMlgzQWlQMlVCZHJQY1NlRUVmc2xjdkxENEFvYlU0eXFwR1pP?=
 =?utf-8?B?QXIyRGthZktHK3pIN05QOGFIa0tNeDhzb0ozY1o1Yk4vci9IL1Z6MWU1ejd6?=
 =?utf-8?B?MzFDZy9vRFVqL2h0TmhCRHVOUVM2WFFYeGt6Z0dVTVArd2c1Y1VOdzFkL1Aw?=
 =?utf-8?B?Qm95K2FRT1Z2ZTJ1cHBERU9BQUN3WTVZWERNMlRlRzNMQ1FlcG5YTnhmMi9j?=
 =?utf-8?B?SnZUTFM0MEZpUDRicWtKeWhLR0ZONjNYWC9XbEw2WU40Zmt4UXlkZlMwL3Jo?=
 =?utf-8?B?cEZyTTQ3ZC9PdUtQMkhyMnFSejI5MEhsWXcxTHFTS2hkczRnOUxEbTAvblQ4?=
 =?utf-8?B?d2xLU3NjU2FHdUJRQmZUOE5FZkV4S0lLRVR3d0xZNkc4YXpadXBlOHFrTWxW?=
 =?utf-8?B?TGZLaU5GTzBGWjkwVG4xSkNQTTVIYUFDQlkrNFVQUWFwdUlaMkRjd2NDV25m?=
 =?utf-8?B?a3dqZk5DWTFtbXN5ZFNSdnQ0eU5Nck5lM2FEV1oyLzc4RWg0YTBabk4yY1ht?=
 =?utf-8?B?bEpYZ3liclJQWDJhVHlHc3NZUjJUSERqWktucmYwc0ZKN0JzMjd2TERJdkZE?=
 =?utf-8?B?YTEyZ1c0UmlINnBaenJ6UFYrdEdKMlJSdjNlN01qRno5akUvcmxicWYraGh0?=
 =?utf-8?B?elBMVVczWW0zVUdQeGZiT3YwWnBsTE83MlpHclI3WmREWmhEMFdEOXFZTzNv?=
 =?utf-8?B?d1ZvUHVhcFhBaEFiR0djanZZVFRtUWFyRmlONjcyTVFvN2RqdFRrbk9qeFM0?=
 =?utf-8?B?ZnAxVGN6eFRTRm96b01CRENhK1c3QnNIQVNmbkR1cHM4MDk5b3prRUJrL2dJ?=
 =?utf-8?Q?+z7iHY3sPztgMRrTGZWI6uGchOWqGxuJnqPLucakpMcG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91345ced-bfb3-41ca-d00d-08ddaa80b234
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 13:46:27.9937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zxHaZtDDx6Aw68yK8QxSzaP6zgsJNYwnNJgLm37xyU4Z4gMIEkjhW9zJzENB9Xys89EnEhEcDDG1Us/NoGOeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7892

Implement `Borrow<T>` and `BorrowMut<T>` for `UniqueArc<T>`, and
`Borrow<T>` for `Arc<T>`. This allows these containers to be used in
generic APIs asking for types implementing those traits. `T` and `&mut
T` also implement those traits allowing users to use either owned,
shared or borrowed values.

`ForeignOwnable` makes a call to its own `borrow` method which must be
disambiguated.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/sync/arc.rs | 84 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index c7af0aa48a0a049bfeeba3a81080355f4d381738..c7832e18b6f129ea00f57fb8e38da68ebc209626 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -25,6 +25,7 @@
 };
 use core::{
     alloc::Layout,
+    borrow::{Borrow, BorrowMut},
     fmt,
     marker::PhantomData,
     mem::{ManuallyDrop, MaybeUninit},
@@ -406,7 +407,7 @@ unsafe fn borrow<'a>(ptr: *mut Self::PointedTo) -> ArcBorrow<'a, T> {
     unsafe fn borrow_mut<'a>(ptr: *mut Self::PointedTo) -> ArcBorrow<'a, T> {
         // SAFETY: The safety requirements for `borrow_mut` are a superset of the safety
         // requirements for `borrow`.
-        unsafe { Self::borrow(ptr) }
+        unsafe { <Self as ForeignOwnable>::borrow(ptr) }
     }
 }
 
@@ -426,6 +427,33 @@ fn as_ref(&self) -> &T {
     }
 }
 
+/// Allows `Arc<T>` to be used as a `Borrow<T>`.
+///
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// # use kernel::sync::Arc;
+/// struct Foo<B: Borrow<u32>>(B);
+///
+/// // Owned instance.
+/// let foo_owned = Foo(1);
+///
+/// // Shared instance.
+/// let arc = Arc::new(1, GFP_KERNEL)?;
+/// let foo_shared = Foo(arc.clone());
+///
+/// let i = 1;
+/// // Borrowed from `i`.
+/// let foo_borrowed = Foo(&i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T: ?Sized> Borrow<T> for Arc<T> {
+    fn borrow(&self) -> &T {
+        self.deref()
+    }
+}
+
 impl<T: ?Sized> Clone for Arc<T> {
     fn clone(&self) -> Self {
         // SAFETY: By the type invariant, there is necessarily a reference to the object, so it is
@@ -834,6 +862,60 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
+/// Allows `UniqueArc<T>` to be used as a `Borrow<T>`.
+///
+/// # Examples
+///
+/// ```
+/// # use core::borrow::Borrow;
+/// # use kernel::sync::UniqueArc;
+/// struct Foo<B: Borrow<u32>>(B);
+///
+/// // Owned instance.
+/// let foo_owned = Foo(1);
+///
+/// // Owned instance using `UniqueArc`.
+/// let arc = UniqueArc::new(1, GFP_KERNEL)?;
+/// let foo_shared = Foo(arc);
+///
+/// let i = 1;
+/// // Borrowed from `i`.
+/// let foo_borrowed = Foo(&i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T: ?Sized> Borrow<T> for UniqueArc<T> {
+    fn borrow(&self) -> &T {
+        self.deref()
+    }
+}
+
+/// Allows `UniqueArc<T>` to be used as a `BorrowMut<T>`.
+///
+/// # Examples
+///
+/// ```
+/// # use core::borrow::BorrowMut;
+/// # use kernel::sync::UniqueArc;
+/// struct Foo<B: BorrowMut<u32>>(B);
+///
+/// // Owned instance.
+/// let foo_owned = Foo(1);
+///
+/// // Owned instance using `UniqueArc`.
+/// let arc = UniqueArc::new(1, GFP_KERNEL)?;
+/// let foo_shared = Foo(arc);
+///
+/// let mut i = 1;
+/// // Borrowed from `i`.
+/// let foo_borrowed = Foo(&mut i);
+/// # Ok::<(), Error>(())
+/// ```
+impl<T: ?Sized> BorrowMut<T> for UniqueArc<T> {
+    fn borrow_mut(&mut self) -> &mut T {
+        self.deref_mut()
+    }
+}
+
 impl<T: fmt::Display + ?Sized> fmt::Display for UniqueArc<T> {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         fmt::Display::fmt(self.deref(), f)

-- 
2.49.0

