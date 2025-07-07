Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E41C2FB;
	Mon,  7 Jul 2025 05:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751866760; cv=fail; b=jijqYP/vbh+eIfeltCUPGt+6YsE5wUYWBplox7bzvBzw0+rDBQzzqdpgK9aouUd1Zo4ERepciSxpWeR+vy+8cRh2oNsn8TiUyQCgYeYc4vLIyaUDVRQqTUXf5oSWTb759KqeCyXEFjYnk9vdJZas5uhbYvOeWoCj+hgM+3xZ3zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751866760; c=relaxed/simple;
	bh=6JLyrI0Lit9/yy0tokYnjvBCBB5vMACCqrmCOxP4W1w=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=YQzsiEBujLq6lA9F/8HioLFCoCkC6xJFsZqNncAQo6rKMBHWCcDqNIbM30N4OGlJDHcdn8Y/FlxH9GPQ8W3bSlHHq8tTaFdF/M6re1v0ht0NPPG674vNGaieQSJk2PkDaVo1/Dovg6hxkQcUshJA6Ep65+ZlTdLNemZCUWgz9k4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=auq6G3Ta; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="auq6G3Ta"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CqpgDCzKiOTmXLNt05SmowkbVBiZitpAIuEeZBJHrgf0Tn+I3qDA1OoTwPe4NoS0IMPUPFw0vVXjlEMNKBpe7XrSpGcYMPJflImtJ8CoUCa4I1vNjlVViXX7UVGlpRcXltosmU0SIWVchSsnpRU6xLVp+BS47H42X0wPdI9eytRhttC2nLZCM1RSNq3jlrm3p8N4HOl1C+2ceYwnOsBqXQ8TE+jvl4dPHpPIF3yfHKXqZvWw39sIaSxQggMd2CPa5l4U5QKh0X+PMQbIWvdAhKq2NIq9imv8ZOIyzHMIkcJZu412JfdTEWWmAQEWv3xFREJGMNymJPUtonU52syOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EExsrqjwNfhh538GUa2ZfTqMHYb+exBCH5v4a+fDZVs=;
 b=qvDXva2vi6drdJUj318wNC6dkP3qEsqttCdpFjUvVWwqTAzpjmm8QdoFsTTe4sZXPSmCnAjbheYwWPPdw+mAJwM0L4QGzYua7yXBL7Rs3OUybV3KyLRZAgTHNg+rxU7kBygOKXYUdQ4XajuiZnX83m9iZI/B4p0/FqoWJjpw6N8SZ4eaYl4saWEAWIqR+X9G0UyL4jbNX4onS1UFU55D/kKNw8qVwfZy+dHcpwAPm7QtWGakMbdmWTiGLdr41aKlZOgcDPzlkDroSqBa/dAtwug+zJNqeGIaSSAAM5eE6kruwTWjuwncrZ3nY24sRVVfMuWEfV/j8HoYsfdplnN6KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EExsrqjwNfhh538GUa2ZfTqMHYb+exBCH5v4a+fDZVs=;
 b=auq6G3Ta8MUeGU/fYPfW9vZegIFsJodVy6aVjkUPVbeDLHH3wMGZP1sRv0PXMrFNefnqhSfgp2xnt4nj3IjUxrv8p5sYj4xWqWOyMLiIPyo54127SWAJm8OFESWtBZJZyC0LnB/LG7En8cglTXwVtJmcCpnqxbLmqqZ13aqgECgD4h7XbUJBnCTW1dLGRMlqC+wcZ6HBkdXlF4T36TE4er6/EwwwCYa+rrOkW1ZxDqYIakA/TXVdhajzkxf3b6HGaAOEcP/ngLpZizelzElCV7yXfUl/jpG9lxvVJBSW96ussdCLPaL4B0PtrBRzEVajkPSYl2TlIHTwUEu9Y4CegA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPFE91247D15.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Mon, 7 Jul
 2025 05:39:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 05:39:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 14:39:12 +0900
Message-Id: <DB5KXNL9KKJ4.AAINEGNOD5JK@nvidia.com>
Subject: Re: [PATCH v7 1/2] rust: regulator: add a bare minimum regulator
 abstraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Boris Brezillon" <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Benno Lossin" <lossin@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250704-topics-tyr-regulator-v7-0-77bfca2e22dc@collabora.com>
 <20250704-topics-tyr-regulator-v7-1-77bfca2e22dc@collabora.com>
In-Reply-To: <20250704-topics-tyr-regulator-v7-1-77bfca2e22dc@collabora.com>
X-ClientProxiedBy: TYCP301CA0088.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPFE91247D15:EE_
X-MS-Office365-Filtering-Correlation-Id: 422edfa9-33b3-4ea1-5934-08ddbd189bfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q3A0cmRUbmd4TnBQN3FuUkJwa0taSndqQWNRbW9OWXN0RThVN2lzS0I3d0o0?=
 =?utf-8?B?VkdrYTc5Yk1FTTdFR2ZpZjVkcThiWDZFL2JzYklYejZpMXhqT2g0T0tza2lQ?=
 =?utf-8?B?MTNrSjRPQjljSDR1aWVmOWMvck55ZDg5dDR2ZGY0bDN3ZUNXWEY0OEpMZWdJ?=
 =?utf-8?B?Ri9uZktwc0UxUnBadWlIdThoeDJUa1Bna1U4K3JhS0tVNm1GK0RZQ1pwenBj?=
 =?utf-8?B?OFU4eG4zRyt2ekc1WENqdUdON2FHZVZuVy9EYmpFajNXRnAreHlRTlhVem1M?=
 =?utf-8?B?RnJnNDZHckJ3Q01aTmhSeTQxYnJycEhHSDZoRXFSeDdiRzBLN2JNQ01WYTgy?=
 =?utf-8?B?eEVYdEZscEdVeXA1cGNMalNENExVTmNhbkEvbklSNXpERUhoekk3b2lpTlpv?=
 =?utf-8?B?eUl2Z1VMWDBjNHZISS95eXNReTJmVVRHa3U3R2RZOVpMem5DTkZQZCtERFov?=
 =?utf-8?B?bkVvNjJpZXFBamNKblBNaGlWNysvUUh1cms4bHArZE0rOFI4ZDRYejUvSjRt?=
 =?utf-8?B?NjN3TlI1UEkzcGtTK2FCcDZMQ2w0bHd5ME1RNlI2cnp0T080TnBxOGJpMy9t?=
 =?utf-8?B?cEtia1hrU2tESHhmcy8yWTRuNXJxU3UrcVlzNWNIYy8yaDRuRXVWamJCUmpN?=
 =?utf-8?B?SHlmNmdDNktLSmNJSVhXV3BHZnZLc29zZzZKbmJpcWxsUGdXWnFNbkJoUlB6?=
 =?utf-8?B?UHV4NlNJa0J5dDNxaE1ZOTNvVTExOEhsRWRjZnh3aEFVbHNNNFY0VE5vRjk4?=
 =?utf-8?B?T01JejY0R1hqKys3endMKyt2WDIzUmNtWXFMc1lhVm83c3c1bVJrckNzSlAz?=
 =?utf-8?B?WGpWUlgzUGJSK0xoOWJpNTZ5VGxnNnlOQVFicm9JWTdBLzlFZFpDS3dQWXpY?=
 =?utf-8?B?MldDOERrTFNuYmExMzlDNzN0QUlON3JDV29TUHF3enBxaUxHQXYxeDZvRi9R?=
 =?utf-8?B?Q1ZqdlBxUFg2VXp6VEhYVWlLbm15bm13VVZKSFRsZ0JJZHFtK2JRekZuaWwy?=
 =?utf-8?B?eWk3dExuREY0MHNMWStBb0xMaUhqNGZqamFyYUh0V2l2QTl3UVA2N1RnQklK?=
 =?utf-8?B?bWVvM1RLaUFYMXdZcUg5MVRxREdqdEc3TTdQSkFnNWVWY3hLd3ZNRTNPT1pZ?=
 =?utf-8?B?YW80K0JkT1liQkY3eURIMUFLRUpCQWwxVTZ6VjgwREcydVczaWtsS0NFTGlD?=
 =?utf-8?B?QUppWFhqQ3VDVVZlcDBiQzkrbkRwUGJKV2VROVhjZWpZaEhUbXJaVGpRK0Fk?=
 =?utf-8?B?Q2dNdzNualhGaml2Q0F5TFpqbjBQT1BCVjllZzl6ZUc3S1oyUHVINk5ULzVq?=
 =?utf-8?B?OG0rOElUREF1MzJqNG1jRFFCelU2OTUxcUErYTBSV3BtR2hmMUZiQUs4MEVi?=
 =?utf-8?B?NmlrQit4TnR0TW45RlU1cTBoU01OSXZ5RWRmSHZWa0FWWjlmS2x6Tm5UY2lF?=
 =?utf-8?B?NFRHU3JLTFVkU1oxUWpkcWFydVo4MUl2c1M4SDZsSTNXcWM5VW4wNnpQMWNH?=
 =?utf-8?B?L1JVa1VMR0RkMUdyUExZZ0crZHhPa05TOFZNbFZaNFBRenFRK1I1Vm9rS3E0?=
 =?utf-8?B?UzVRbVNrVjJSVVk3ZGM1YjdJWkNkZnExRDJaZ0tYcHEyMmVpbE1ZR2R4V3hi?=
 =?utf-8?B?S1VJQTAvakFiK2R1S1ZTOUxhUCtoNklpcmNOR2FGNXI1ZzhLVFJTeFhPRHVi?=
 =?utf-8?B?eHo2WjJFZGNxbnFGQmhtdTlaRnhqelUvMkRncjkvSUFWMmlNMVI5amdlV3p6?=
 =?utf-8?B?TjZ0MEtmUCtPeGxMTkVuTkNZYnhvRk5Ka0RjYUE3ODlVUmNkcDZUcnh4eTJ0?=
 =?utf-8?B?b2dFaEVJcm1QYkdrUVBsL1hpZmszQ2REN1JIL0E2M2RpbVFCVENuMk9XVGNr?=
 =?utf-8?B?R3FOMDEvTGw2RUo5eGVSaUlWdWR2dGl1OU1aZEMweDMvNlk0V3owa1YxQ21V?=
 =?utf-8?B?Z05KL0Vyc3lrMXVVRDdndjUxRjV0ZmZBZmJPYlc5a2orQ1pyOE13WGhtbXJu?=
 =?utf-8?B?Z2t0a1ZTYUpBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFh6bWl3eWlralMyUWtnSmVieVI2TDFsM3Bpcmh5azFoSTI2MWFtS1d2eEZN?=
 =?utf-8?B?bitsTTkwRS9MSzUyMHpTQ0o0ZmFGa0lZbDNqUFllcXc2eFBXN2RHTFh0emFU?=
 =?utf-8?B?dlRycUczRnFrWFBvckcwSFpLM1lPVmMxazdENjNDV1o5M2dXM1FwZ3JBc3Ry?=
 =?utf-8?B?U0s1VEMya0ppaUhZU3BDdlc3cGRtL29JVW5TaFg1SUphdlZnU3hTTkZJVGQ1?=
 =?utf-8?B?QzdpREJiU0psQ1U0YitFTC9zN2krRFNpUHJONnFmQ3FQZzk3K1E0M3FiNFFW?=
 =?utf-8?B?Mjh5dmVXVExyaEVid1VrZG1xYUdWa2NzVkg0d2VoSmF5bEJyVGhGeW1WSXdG?=
 =?utf-8?B?VXdyN0RlVHhZMkk0Z2haSkVzNmlRcXA2djk0Q1ppL3BWM2xhbEsxOHRsZzFS?=
 =?utf-8?B?SW8xaWpRTjYzZXUzS1haTWtEVTFUckZVUjlCS2F1SWhmbFhyV0poWHUzNXF6?=
 =?utf-8?B?WXZodnNKR1dXU0ZyMFBZNUdLMW5nbXBlTDR6VWdLN2x4M0ZqZlgvYkt1VnVt?=
 =?utf-8?B?U3YxZTJKR0dQaDZNald0eG15WXZEQmhETnVkTS9hc1JYN2NQN3hVVk9uT0tQ?=
 =?utf-8?B?V2lTVmZ4QUxKUGJXdzBIbHBzT1Z3NThIQjBDYis0SVBUR3lWNW9zZ2NMVlg0?=
 =?utf-8?B?SGN2eUthSWplVmRKMlZLOXpJTlhHeERJbmU4Q1Fhd2Raek4reVJxK3RLeURa?=
 =?utf-8?B?bFF3S0N1TmZzODN3RlBaU2xKc1lxaVJEdWNpcHd0WGdHdG8wMExpcHZTYk8y?=
 =?utf-8?B?RVBtdlR6cWt3ZGtnQWErSitIMkkvd3VQUktmNFJnQXB3VHd1KzlPaE9vT090?=
 =?utf-8?B?ZlROK1VCNHpReUh0SUYwNHN4ZFVZYzlrYnhtTlJFdkVTbFRCR1k5QzN4NTlQ?=
 =?utf-8?B?WExqL0l4MHE5a1dHVWF4SWFaWCtpcUh6am1FY3ZwSFNQeHF1c2xNOXNBK1RU?=
 =?utf-8?B?aE9VZEhzVHZxR0doTjU1L01icklzcFV2RFdScjVmS1JSSHFUOUt0U0FOT2p5?=
 =?utf-8?B?TGgxRkdKd2V5V3VuNWhLWlEvdnlHblpSS2V5aWR4dkJ3ZTN1ZTBiNjVIbEZX?=
 =?utf-8?B?dFh6KzFpMDFmUjB1b0poc0tLOXBxTDNLdjFZdXgxUkNKTUN3SnRaNU1qN3BO?=
 =?utf-8?B?WHl1RUJITXQra0FlcjIvVlBobkxYQ2FxUEtWdk9RQW9xN0V2QTZ1T1ZWRVAr?=
 =?utf-8?B?aU1kWGwrc21haVMyMVBQZEtaYjFrcXNNcTNnSC9RSExvcEZVdE1XT3RaT0pV?=
 =?utf-8?B?UEVYb1NlYjB1U1M2d1FYTkZmZjdyWVpDaUhSQkhuOUg0WS9vSVdlTTMwN1ZP?=
 =?utf-8?B?eHFxTnpCSkFjR3A0dXR2V3Y1dm9wTlREUXRVMGRhVTJBd3gzNkw3ZUxWYXJs?=
 =?utf-8?B?R0l1all3ZHJCdEZ3ck1ITGNRRnc5WkZReHlTVjkyWlFGZ1NZb0FocXhUalo3?=
 =?utf-8?B?d2d3d0lkL2RYam4xZXBXSDlRWDVEbFRsL0lOT2JzeEsvS0ptYVFiTTYzL29E?=
 =?utf-8?B?K0crSzRleW9MRlpPcEhsS1IvUW8yUkZBMWt5UjhVaUhlcGtmU0ttQUFQQmNP?=
 =?utf-8?B?M1NucXQ1eE1Gb2o4dkRtaUtEM1JZY1VZUi85V3lQS2FhZUJMWFJPVXdpY2I0?=
 =?utf-8?B?YUE0ZWh4YURhdk5ZSElYQ01CbG10ZEpJU1Y0d1RNQlBJUHJJVFZqa3B4S3Fs?=
 =?utf-8?B?aXZOQ093MWpDQmxNdDU4a2ZLMDVmYzF3cGNmQXZlemZXZUc5Z2RyYUNqbVNa?=
 =?utf-8?B?KzM5bldUSWNnT2dZa1hnQ09QbUtDVEs4MUlUbVRiUWsycDh3aHJ1VHB5UHVi?=
 =?utf-8?B?SzVFenRIMG44STM5Z0VVT0g2YWJpUHdYTGllQmRWbXNFOHRHbmxIMWtBbncy?=
 =?utf-8?B?aFdDYUhpdkZaU3BXMTJmYVRRajJwMUppSHNqVG1nb0pCbFBOUG8vZjZlNnZV?=
 =?utf-8?B?V2NJMzRINk95Q3pWOW1xQ1k5TUVNenYwQ0h2RVAvckNNUUl4TC9JVFJ6R0J6?=
 =?utf-8?B?bUk3QjBzc3NKT29TcUZDMnVHRElkWmFLZWE4eGFFMlN3S2lORHZvekZQSkRY?=
 =?utf-8?B?WUZGcnhYSmdJYVZPZkxaWWJlM05IbnBxT2tTZ0thamtldGtDdjVnRHZpcFUy?=
 =?utf-8?B?WjNHMW5qdXc1Z0JITFBhZHN2dzlxVm5QL2pHTnlBTWo2N0k0bHlVWi9BRkhB?=
 =?utf-8?Q?FvpEutTPO5ON9S0s29XAA+zDnxkFPA5VicMGGY39waCM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422edfa9-33b3-4ea1-5934-08ddbd189bfb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 05:39:15.2395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9Wa77h9WRfAyosqe7lliqls23egCiZsL+dEadvU4d5YqUsUHvOXgM500hGcnvMegcWcWIFasRoOH0hAhE4jTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE91247D15

Hi Daniel,

On Sat Jul 5, 2025 at 3:43 AM JST, Daniel Almeida wrote:
> Add a bare minimum regulator abstraction to be used by Rust drivers.
> This abstraction adds a small subset of the regulator API, which is
> thought to be sufficient for the drivers we have now.
>
> Regulators provide the power needed by many hardware blocks and thus are
> likely to be needed by a lot of drivers.
>
> It was tested on rk3588, where it was used to power up the "mali"
> regulator in order to power up the GPU.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

I think this looks great.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

A few comments inline.

> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/lib.rs              |   1 +
>  rust/kernel/regulator.rs        | 403 ++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 405 insertions(+)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 8cbb660e2ec218021d16e6e0144acf6f4d7cca13..2d51f9d056091e34120b4ade9=
ff7cc4a7f53e111 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -65,6 +65,7 @@
>  #include <linux/poll.h>
>  #include <linux/property.h>
>  #include <linux/refcount.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/sched.h>
>  #include <linux/security.h>
>  #include <linux/slab.h>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6b4774b2b1c37f4da1866e993be6230bc6715841..5e4cd8c5e6ff1c4af52a5b1be=
4c4c32b5104e233 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -100,6 +100,7 @@
>  pub mod prelude;
>  pub mod print;
>  pub mod rbtree;
> +pub mod regulator;
>  pub mod revocable;
>  pub mod security;
>  pub mod seq_file;
> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..56f3a91469549551f54c7b4c7=
ec67aa941acd572
> --- /dev/null
> +++ b/rust/kernel/regulator.rs
> @@ -0,0 +1,403 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Regulator abstractions, providing a standard kernel interface to con=
trol
> +//! voltage and current regulators.
> +//!
> +//! The intention is to allow systems to dynamically control regulator p=
ower
> +//! output in order to save power and prolong battery life. This applies=
 to both
> +//! voltage regulators (where voltage output is controllable) and curren=
t sinks
> +//! (where current limit is controllable).
> +//!
> +//! C header: [`include/linux/regulator/consumer.h`](srctree/include/lin=
ux/regulator/consumer.h)
> +//!
> +//! Regulators are modeled in Rust with a collection of states. Each sta=
te may
> +//! enforce a given invariant, and they may convert between each other w=
here applicable.
> +//!
> +//! See [Voltage and current regulator API](https://docs.kernel.org/driv=
er-api/regulator.html)
> +//! for more information.
> +
> +use crate::{
> +    bindings,
> +    device::Device,
> +    error::{from_err_ptr, to_result, Result},
> +    prelude::*,
> +};
> +
> +use core::{marker::PhantomData, mem::ManuallyDrop, ptr::NonNull};
> +
> +mod private {
> +    pub trait Sealed {}
> +
> +    impl Sealed for super::Enabled {}
> +    impl Sealed for super::Disabled {}
> +    impl Sealed for super::Dynamic {}
> +}
> +
> +/// A trait representing the different states a [`Regulator`] can be in.
> +pub trait RegulatorState: private::Sealed + 'static {
> +    /// Whether the regulator should be disabled when dropped.
> +    const DISABLE_ON_DROP: bool;
> +}
> +
> +/// A state where the [`Regulator`] is known to be enabled.

For safety, let's maybe explicitly state that the enable reference held
by this state is released when it is dropped. The example below mentions
it, so I think we should do it here as well.

<snip>
> +/// A `struct regulator` abstraction.
> +///
> +/// # Examples
> +///
> +/// ## Enabling a regulator
> +///
> +/// This example uses [`Regulator<Enabled>`], which is suitable for driv=
ers that
> +/// enable a regulator at probe time and leave them on until the device =
is
> +/// removed or otherwise shutdown.
> +///
> +/// These users can store [`Regulator<Enabled>`] directly in their drive=
r's
> +/// private data struct.
> +///
> +/// ```
> +/// # use kernel::prelude::*;
> +/// # use kernel::c_str;
> +/// # use kernel::device::Device;
> +/// # use kernel::regulator::{Microvolt, Regulator, Disabled, Enabled};
> +/// fn enable(dev: &Device, min_uv: Microvolt, max_uv: Microvolt) -> Res=
ult {
> +///     // Obtain a reference to a (fictitious) regulator.
> +///     let regulator: Regulator<Disabled> =3D Regulator::<Disabled>::ge=
t(dev, c_str!("vcc"))?;
> +///
> +///     // The voltage can be set before enabling the regulator if neede=
d, e.g.:
> +///     regulator.set_voltage(min_uv, max_uv)?;
> +///
> +///     // The same applies for `get_voltage()`, i.e.:
> +///     let voltage: Microvolt =3D regulator.get_voltage()?;
> +///
> +///     // Enables the regulator, consuming the previous value.
> +///     //
> +///     // From now on, the regulator is known to be enabled because of =
the type
> +///     // `Enabled`.
> +///     //
> +///     // If this operation fails, the `Error` will contain the regulat=
or
> +///     // reference, so that the operation may be retried.
> +///     let regulator: Regulator<Enabled> =3D
> +///         regulator.try_into_enabled().map_err(|error| error.error)?;
> +///
> +///     // The voltage can also be set after enabling the regulator, e.g=
.:
> +///     regulator.set_voltage(min_uv, max_uv)?;
> +///
> +///     // The same applies for `get_voltage()`, i.e.:
> +///     let voltage: Microvolt =3D regulator.get_voltage()?;
> +///
> +///     // Dropping an enabled regulator will disable it. The refcount w=
ill be
> +///     // decremented.
> +///     drop(regulator);
> +///
> +///     // ...
> +///
> +///     Ok(())
> +/// }
> +/// ```
> +///
> +/// A more concise shortcut is available for enabling a regulator. This =
is
> +/// equivalent to `regulator_get_enable()`:
> +///
> +/// ```
> +/// # use kernel::prelude::*;
> +/// # use kernel::c_str;
> +/// # use kernel::device::Device;
> +/// # use kernel::regulator::{Microvolt, Regulator, Enabled};
> +/// fn enable(dev: &Device, min_uv: Microvolt, max_uv: Microvolt) -> Res=
ult {
> +///     // Obtain a reference to a (fictitious) regulator and enable it.
> +///     let regulator: Regulator<Enabled> =3D Regulator::<Enabled>::get(=
dev, c_str!("vcc"))?;
> +///
> +///     // Dropping an enabled regulator will disable it. The refcount w=
ill be
> +///     // decremented.
> +///     drop(regulator);
> +///
> +///     // ...
> +///
> +///     Ok(())
> +/// }
> +/// ```
> +///
> +/// ## Disabling a regulator
> +///
> +/// ```
> +/// # use kernel::prelude::*;
> +/// # use kernel::device::Device;
> +/// # use kernel::regulator::{Regulator, Enabled, Disabled};
> +/// fn disable(dev: &Device, regulator: Regulator<Enabled>) -> Result {
> +///     // We can also disable an enabled regulator without reliquinshin=
g our
> +///     // refcount:
> +///     //
> +///     // If this operation fails, the `Error` will contain the regulat=
or
> +///     // reference, so that the operation may be retried.
> +///     let regulator: Regulator<Disabled> =3D
> +///         regulator.try_into_disabled().map_err(|error| error.error)?;
> +///
> +///     // The refcount will be decremented when `regulator` is dropped.
> +///     drop(regulator);
> +///
> +///     // ...
> +///
> +///     Ok(())
> +/// }
> +/// ```
> +///
> +/// ## Using [`Regulator<Dynamic>`]
> +///
> +/// This example mimics the behavior of the C API, where the user is in
> +/// control of the enabled reference count. This is useful for drivers t=
hat
> +/// might call enable and disable to manage the `enable` reference count=
 at
> +/// runtime, perhaps as a result of `open()` and `close()` calls or what=
ever
> +/// other driver-specific or subsystem-specific hooks.
> +///
> +/// ```
> +/// # use kernel::prelude::*;
> +/// # use kernel::c_str;
> +/// # use kernel::device::Device;
> +/// # use kernel::regulator::{Regulator, Dynamic};
> +/// struct PrivateData {
> +///     regulator: Regulator<Dynamic>,
> +/// }
> +///
> +/// // A fictictious probe function that obtains a regulator and sets it=
 up.
> +/// fn probe(dev: &Device) -> Result<PrivateData> {
> +///     // Obtain a reference to a (fictitious) regulator.
> +///     let mut regulator =3D Regulator::<Dynamic>::get(dev, c_str!("vcc=
"))?;
> +///
> +///     // Enable the regulator. The type is still `Regulator<Dynamic>`.
> +///     regulator.enable()?;

If we enable the regulator at probe-time, then it is guaranteed to be
enabled for the time the device is bound - in that case, doesn't it turn
the `enable()` and `disable()` calls in `open` and `close` into no-ops?
I would remove this line as the `enable()` method is demonstrated in
`open()` anyway.

> +///
> +///     Ok(PrivateData { regulator })
> +/// }
> +///
> +/// // A fictictious function that indicates that the device is going to=
 be used.
> +/// fn open(dev: &Device, data: &mut PrivateData) -> Result {
> +///     // Increase the `enabled` reference count.
> +///     data.regulator.enable()?;
> +///
> +///     Ok(())
> +/// }
> +///
> +/// fn close(dev: &Device, data: &mut PrivateData) -> Result {
> +///     // Decrease the `enabled` reference count.
> +///     data.regulator.disable()?;
> +///
> +///     Ok(())
> +/// }
> +///
> +/// fn remove(dev: &Device, data: PrivateData) -> Result {
> +///     // `PrivateData` is dropped here, which will drop the
> +///     // `Regulator<Dynamic>` in turn.
> +///     //
> +///     // The reference that was obtained by `regulator_get()` will be
> +///     // released, but it is up to the user to make sure that the numb=
er of calls
> +///     // to `enable()` and `disabled()` are balanced before this point=
.

Ironically the `enable()` line in `probe()` is not balanced here. :)

> +///     Ok(())
> +/// }
> +/// ```

These examples are great!

<snip>
> +/// A voltage in microvolts.
> +///
> +/// The explicit type is used to avoid confusion with other multiples of=
 the
> +/// volt, which can be disastrous.
> +#[repr(transparent)]
> +#[derive(Copy, Clone, PartialEq, Eq)]
> +pub struct Microvolt(pub i32);

I still think a `Voltage` type is preferable and more idiomatic here as
the unit would be made explicit by the methods anyway, but your call.
