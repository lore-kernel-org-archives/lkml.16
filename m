Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0C1278E5E;
	Fri, 11 Apr 2025 12:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372870; cv=fail; b=uJ77wXsrTj49vhw+wFvs6OjMGSY9p0duC8Q28M6ZMarUKM0aBeMiixowEDOyIRv4NFIth26lA+esClQqy8HBBBl88Y+fTTPC8Nthbn8XHaCghEcQeXLKzDurR3M7pkLW/9B3v51nFHe5F1FedM60cTrkAanNQGnJ0ikFWKCgL3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372870; c=relaxed/simple;
	bh=COGeni00jhuqSv3+RX5GrYvMBUWUaLLyvv/clyYh75g=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=GjRivUDHCXXWPjFjEXztx+DfBOOLRFrY5E5yCQatAyv5j8hkKOj/UhLZKm3G1zV+PZ/wlFSzL2xZdDBsvprS730BDQNrcmepHgk6MTJWpgR8K1bEd9oY4SjC2a2IdWmTyNTGah1XORzV0Q8BQQs6+/Mmy36WvTA+dIwAdiYBFlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W7R5tdEb; arc=fail smtp.client-ip=40.107.212.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W7R5tdEb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHH0hrt091KsE/MUinnxG762hdaBTIf9sIxPOnXUokwP7Yh25SjZbgCuJtQppYkkEJKFAPLZIHT7NCDlHFguM30mkUWvoiBUrwCnEhaIUcuz9+YuOfTN2c9ASnI/r5qZcCZq/0yxUeXhOyFNc2YbFuRlbrEfU8xVzDs6X16wsglBDv4zfiB6tf0HVgz+PLVMh0JYHbnNe6/6lqg9lhDBJ1xNLOkMn4lcKtzZDbi25ie/s97lOLnVoYiKRa9BRQyaSBEofrY/gy6VFbe3ojNOTbKbBT9jPzLpbBrLydXlmmef42EF5qJXN4mI7aI/3jpqZfIFhXB1z+Xev+AD5fH66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/794+LX6/NLQYL7CJyfREG6NiVQph0Tg8kfH4Nqg3ZI=;
 b=XnxAu12HzPYLTgc+3aiVIaHg23jwK4qJn9Z/kHt1taX7rTSuVipgk3byegZOHbERRxeNIz45ZT0ogkBw9++84VuP7t92KLPGZwYgPQSNXH5r2diAgRt2jV6HCBVZSDOtzCQ3hqdVeh0FsxPTT9mwNxZu4vRMAPglJHr4mwYXprdomHbPFXTLt/dQKBPpoIQA/jRodOztnr2gU1hVQ2uGmDnH1I/d0DEKQW6lLCEnnn8+63bAMN0g6vCOTMAXqDtqbPlOmD2Qn/WjPQeE6Y5kTeKqLxfjDZmd/PuYbctugHQ1jmIuFkeWZoI7NdxI5h4M49rG77SyeTQCqeAWb/m+OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/794+LX6/NLQYL7CJyfREG6NiVQph0Tg8kfH4Nqg3ZI=;
 b=W7R5tdEbs5o2tOiepkTBFY9qm7h1F2PJOJLSV6EdnupQ4WwvptyVbtdheobqWPxwi/9W0dHLkzgQjyfRx5IKgWnt/vkwt722PQwoaj5dRk+m6/R9X/h1TkDqc/VopIRLnMOlnf78gt2/ZEeAzgsL/SXvjsLZGzqR4IwmJPbcltRN/fn6SCUCNJ1RRGjljSkma8zZjsQT/nuJctumjgQyynrG6iZ9cQa6SIynAEBkdWmWbJJk18HFMszHd2em/pCFinGgyAH1ynJ6lQ0IxP2sMHt64WuTxJ1uZrTEvW0APYwpJirQIrbh1yiBTu2/fj9KdVyNzUohQcNEusPQChXWIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7877.namprd12.prod.outlook.com (2603:10b6:806:31b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.22; Fri, 11 Apr
 2025 12:01:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 12:01:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 21:01:00 +0900
Message-Id: <D93SKL66QJ1Q.282HRTXO8Q726@nvidia.com>
Cc: "Benno Lossin" <benno.lossin@proton.me>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: alloc: allow coercion from `Box<T>` to `Box<dyn
 U>` if T implements U
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250408-box_trait_objs-v1-1-58d8e78b0fb2@nvidia.com>
 <D916LG7Z9Q31.5RVNMYM38E2D@proton.me>
 <CANiq72k9Lo-M5v338iWWSiwrnU+JwP+aEZeLiR291xc2c+ESOg@mail.gmail.com>
 <D91ACTUAWQTF.2AZ98BUA5ZKJ6@nvidia.com>
 <CANiq72=f+0KBT3iOQnWyJ_Va==j5iEYpNE7WLU=0aALbQ8-beg@mail.gmail.com>
In-Reply-To: <CANiq72=f+0KBT3iOQnWyJ_Va==j5iEYpNE7WLU=0aALbQ8-beg@mail.gmail.com>
X-ClientProxiedBy: TYWP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: 3834cb62-5c71-43c0-c2d9-08dd78f08820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWRzcVRPMi9VanZjV0NFUU1UV3Z3YU9IanJmYk9oOE1HSFhrMHU0SjN0TEc2?=
 =?utf-8?B?WDZxSDJLOHo3R09iSURJdUZONXdYS2VWNURKajgyNjFqOE9VcFd2aUljNEo2?=
 =?utf-8?B?Vzd4aWJiWWdlT2s0SGFpa1JoVDlORS9IN1ZQdTJFU2trc0w3VFBKelNLQlNz?=
 =?utf-8?B?bzdNMHowRzZreDBPMjcya0JwSzNDdGs1MmRPMFBLS3FPVUM3TDNtdllqVjRU?=
 =?utf-8?B?UkEvajVyVTRyT3lMNkVMMDVjN2xZUkFZYU9XeVFCWDh5bG9SVG91ZUMrYXVy?=
 =?utf-8?B?MlkvVitpb0szYko3bE5xS2toN1lOZDNraStjQ1hxd3p6WkVrNHdjRGdmaHY2?=
 =?utf-8?B?U1JvUkRVSjBVRlhLckRNUG5wd0twSUFacjBQaHRiYWNuUlRHcXdJZkg4VzB0?=
 =?utf-8?B?Y21NS0tGaU1ITWxBRnZIdklDZko5N3pvVnlsa1JZMkdWYjluWE95WEVXdVQz?=
 =?utf-8?B?ZWFOeFRMQkJHY3pCNHRiQlE4NXpyZE4zWGZ2VFFWTUtLT2VKQnJJajQvUm9x?=
 =?utf-8?B?c1YvOFNIeTgvN0MwNmIxTzU0NWllRStBUks1emVjclNKdUQvZXBqQTB2bzBl?=
 =?utf-8?B?NzFPVFJrVW1TcGFZaW81V3BBa0UwRFVwMHRaOCtFcG1udnRqVmtGYUd4SXlZ?=
 =?utf-8?B?cFh0RGNpUHhTa0VLbVFtS2xBQlJIWkNMc2FCRUE0TU1OZ2U4SU05Q3JlSXBN?=
 =?utf-8?B?QmRoM2xxQlUvL0tTdDJTR1dDV2NQTUExSUZDbHhiS21sSDV0QUk4RTJQekQ1?=
 =?utf-8?B?cDdJMThnNDN5UGhGZDAzYk9PUW81aTU2ZkVhdjFaUVhCYWRrQ0d1eGV2akNR?=
 =?utf-8?B?cFV4MUNjVmd4WkZ6RlFFNk1sSVNlL1owNDhydklLUlBJNU5XTHBjL1h0TWpx?=
 =?utf-8?B?RWlnZGladkw4d3hncXppOUVSZUYvY2swdFBiVWpmRXhKbTlxNDZXa2J0RjJQ?=
 =?utf-8?B?MVBBRlV4T3BUUjhwbElvMHM0eExiUVFYNlgzamQ0RWJvME9lM0d6Y3B6c3ZM?=
 =?utf-8?B?aVhldm5ZdkRWZUhaaXNoMDkwY0pCWmZxdzV4WkFlREtrR3RRek1Ddk1FOVRS?=
 =?utf-8?B?dE8wc3JjejlheEFNN1dDaE1qUXZtbXpBT2tLMkp6Q2hRVGxMbGVaMFpzbW1z?=
 =?utf-8?B?bE5TWGxGdkdzdUFTbmFyV05wZVdpcHMzcGpmZ2hUdmtHTU8zVFdZM0h2a3NY?=
 =?utf-8?B?a1BNUmw3dVFUYUdUS3JFY2NIcW80d0MyY2U3cy9rTHFRM25UVGpwUGNxQ0VL?=
 =?utf-8?B?VWl1WEltOXB2NThlQ1IzaSt3THJGbnQxdkY5SDRXcVdFUkJSYWRvdGRkUTlB?=
 =?utf-8?B?bUdBM2RqZjNrRkRTT0JPaUNNdkhLQWdkakthR2w3NktuY1V5OGlSVFMvbk8z?=
 =?utf-8?B?cTN0bUJ5YzJNMk9JVk0ybklzVnBOejlickNxSjRmU0ZnbjFsd1dIS1h4aHdB?=
 =?utf-8?B?WmRwM1d4UlhkREF1eFI3K21DOW9abEpZL3pTMm1JUU1BMWE3SXdNQVRUbDhx?=
 =?utf-8?B?THlYR0h0YmFleCtvcElNeEJHTWY2eTBqanNqWUY2OVBQejlCSnF6Tm9LWU1Z?=
 =?utf-8?B?Q1BJUEdSRndwQkZOZ1lvWVpzeXhYeFEzOFJ2NjJaV0pxcGJ4NGR0WUFZVDNJ?=
 =?utf-8?B?aitNbm8ralp6MEZhWnVyc1lnZEI3TTRWRGF5ZHV3Y01YL0lwYlJhbHIwVFpJ?=
 =?utf-8?B?ZTIzamdkQm1TOTc4eVhPUkY0Y3l4ZVhPb2lmbkR0ZzRRNjZjR2doWCt5RjJk?=
 =?utf-8?B?dFZnQUxJVmdaNTB5ZytFZmVDU01KK09YbCttd2FuMVhPaXEvNFlVQTBmU3Ay?=
 =?utf-8?B?OE5CM0pvbkVwWFNhRmxEZWlVcDNhcGQrUXYvc1RnQm1YUUlwOFB2dVY4NTZS?=
 =?utf-8?B?S0R2MWpuUnZWc1VzTFhIM21kdzcwWjBXbE01bjVyN3N1ck5PT00wYTR1MUNX?=
 =?utf-8?Q?dKJH3G1i8cQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHpjS2ZXQW1pWURZQXQ4V08vU05TMEIwY0NBaUNHZWtRWFppZThsRk5UMmJp?=
 =?utf-8?B?WDdqRzNGQ1ZQcHpsMlh0NFRDWHJ3YWNJWkZlSmRsdG5abk4yUFhjQW9IQldY?=
 =?utf-8?B?UGNGUmNhUjZaUjVSa2FPc0x4K2JZSmdJNEFQcDREaHo5TmhMNENKY21tQ2E5?=
 =?utf-8?B?QkkrRGphK1VrWHNzaEtGdEtmemZRNXVZcWxrQy9paTFiVExJbm1uaWQ2aFds?=
 =?utf-8?B?OEpkOUZFWk9hL2lnRDNvYlBpMitHd2RvS3hBZWVPV0laOGdWLzNXNFFIMEZ0?=
 =?utf-8?B?YW5rbWFQR21DRjRBMjQyRDB5c0VmL0pxV2wrMjVJdnFMVEUwY2UrK3ZIazh0?=
 =?utf-8?B?NXM5WVNjT1hlVFovMk05TDNhNkRuTTNkcFhGeXJUMDVQSVZ2eHF1a1hpeGZN?=
 =?utf-8?B?blZNbTFXMUh3ODcrU1JiVW81eUJDVXlOdE5FOUlRMmNMUytlWDlKTDhqbDEr?=
 =?utf-8?B?SEp1L29pdmtwTHNnZ2FaK2pHMHF6NHl2QloxZURXaTdwcnNKUkRJaEVGM1dL?=
 =?utf-8?B?VTBWOUYranB0SDN1OWRSd3RBL0FKdjgvckhmS2hNUXZ4a3RuaVJyZVhsbGli?=
 =?utf-8?B?Ui8wMzZsL29FejVJZTdqckgxR1ZyMFNLMllRTTlOVHI1WE5BaUNyelhicFll?=
 =?utf-8?B?d0hWSk5qV2VrVDVHM3Q0cjhRZEZUUXE3QkREQ2FBSkExNk1rdDNlUnVsYi96?=
 =?utf-8?B?eExiUnpqSGpNdjdWZUF6ZkZJWEpqMmN1ZDJ5bUN0ajhsb3E3d3crTVZzVWhU?=
 =?utf-8?B?TktiU25rU1Q4Mld4eHB1UTRIbjlNNnJNMWI3N3VkblFJaGQ1S1E0WmZ5dDhl?=
 =?utf-8?B?QkhIOHFFUHJjYkszWWZ0WkQwaXJzNGRRenNlY09xL1VXYjhRQVhyc0xScW9m?=
 =?utf-8?B?VmFmV25rbWFXVDFZVkRIZk5KUksrT0FWVFphVjZhTmRxWVE4SnJXeFVuVlM4?=
 =?utf-8?B?YlFQbU05TW1hdHkwZEJYMGdNT2hRSk42QmpzVVM1YS9jazBRMzJENzhGMWlZ?=
 =?utf-8?B?SHRyRFpJN3VFL2FmN3ErOFpObWdzVHBWcTJmeHVORHFmNUlVMzU1VmlBalds?=
 =?utf-8?B?eW5adDJTK1R6MmZ0MlRQZ010bVZXLzFsR1pySmhvK0dyU0dSOVNxK1BzQysx?=
 =?utf-8?B?cHlHcmJLMTVzb2M1cE4xZ1FLbVQzNTlaNmlqVmlXL2RGbG5IV284U3psSDJR?=
 =?utf-8?B?Y2ZRRTFpNVpZWEtSRWd3SnkyZEhJR3dVOWlMdEFwdVBrcWgySEtON0d3cW5y?=
 =?utf-8?B?MWFQaG9QZmxlakVydnh5bGRMeFlpL3dpZ3RZcmlNOTdITTdmYVJKU0poWkVj?=
 =?utf-8?B?dGVNZk9PZkNZSGZ6aUhYSUxvcGFWdW9MZUI4VDlieGtRZHlQcUNaZk5SUVdi?=
 =?utf-8?B?eTU4akd6MURlNFdlN05VVzlEb1lkVnUzUFJuNWJkWEJZVHkrWlRSSmYxdWJR?=
 =?utf-8?B?eGdobHpOOXozKzh1andPTkNnZFhOUkR0dWpRVlEzcE5FN3NsZFp1SWJRWmY2?=
 =?utf-8?B?YlpNelRVTCsybVJCUmRNNTVZbTUxU0NpdkJoWFovbExBOVBWU1dQMjkzNnJD?=
 =?utf-8?B?cnJqUzUxVjlMR01PVkE4MS9BSDhwQ2o1TXFrcEJ3Z1FtbTcxU3JSV0xtcXla?=
 =?utf-8?B?ZVB0R2hxNXkzb2NLS20rQ2FNaWxvWUVodTdTdmYxWlR0aVRVaEV0RXJmQ1NO?=
 =?utf-8?B?VmsxczBiTjQwKzFZcjJXWER2WW1KZHNyeWdvRTErVFRSUkZBeEk2UnAzKytr?=
 =?utf-8?B?VjRGMDhjRjBFY0tWZXNsRFdXL2thZzVkelJMQWlVaGhkcVh3SG8zZFZzTkRN?=
 =?utf-8?B?RlNKd0E5c2dkYmJxdnkrdG1laCtHNEVWNEdkcDlMZEZjbStnamFMZCtDeHRr?=
 =?utf-8?B?SkxMUlJ0NkVVNUZOQk1BMGdudWdoL1cwcHVxOEFMbWMrMGJ5YlBIS3VPekd5?=
 =?utf-8?B?YmY5d2Zqc1pqWGVrbDI2Um1DSGNxMzE0Q05FUGVZd2dIWlFEclBYaVRFZkx5?=
 =?utf-8?B?M3QvbUc5TElML0IwbHJKd2FUWnNiNmdsemNiTEdnamVlaVBsYURnOGt2anJ3?=
 =?utf-8?B?eUJ2d0VkN2VTYllMbmFNYmgzTVBmT084UnpkN2F3MUVEajR5cy9uZkZWNU5C?=
 =?utf-8?B?UVFVZmNYMld6THdqTEsvWitrT0IzYXoxdlhxNFRDTDBXcFFBVlQzWnlncEhQ?=
 =?utf-8?Q?kfcCGWNdVrotUzJj2V/cdRVUjNVg6DJ8BMbIfT+r7HVa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3834cb62-5c71-43c0-c2d9-08dd78f08820
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 12:01:03.9294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OmppNzmfCXXe8F1lbhx/LPFCpUplWcqH6Jh1wNgVI4ItbTMa2QvnGFfDsFizJtYgMbqxWqpGco2+B6/Nm3xeew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7877

On Tue Apr 8, 2025 at 10:58 PM JST, Miguel Ojeda wrote:
> On Tue, Apr 8, 2025 at 3:19=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> Apologies for that, I had no idea how to build using a specific
>> toolchain and did the wrong thing, which is sending without proper
>> testing.
>
> No worries at all! It is completely normal :)
>
>> I had some trouble finding how to 1) find out the minimum supported Rust
>> version, and 2) how to build using a specific toolchain.
>
> For 1), the minimum versions for tools the Linux kernel uses is documente=
d at:
>
>     https://docs.kernel.org/process/changes.html#current-minimal-requirem=
ents
>
> `min-tool-version.sh` is also fine, of course.
>
> For 2), similarly, it works like for other tools: either you override
> your binary in the `$PATH` (that is easy with Rust with the command
> you mention or simply with `rustup default X`), or you provide other
> binaries via e.g. `make RUSTC=3D...` like you would do with `make
> CC=3D...`.
>
>> I can send a patch against the Coding Guidelines adding a section to
>> encourage testing against the minimum version and explain how to force a
>> specific Rust version if you can confirm this would be helpful (and that
>> min-tool-version.sh is the correct way to check the minimum supported
>> Rust version).
>
> So that sort of thing is supposed to be documented in the "Submit
> Checklist Addendum" section of the "Maintainer Entry Profile" document
> (`P:` field in `MAINTAINERS`) of a given subsystem, and in particular
> for Rust is at:
>
>     https://rust-for-linux.com/contributing#submit-checklist-addendum
>
> I agree that linking from the Coding Guidelines or perhaps the root of
> the Rust docs would probably help others to find it, since different
> people go to different places when starting, so please feel free to
> send a patch!

Mmm upon reading this section again I agree it contains the needed
information (even mentions `min-tool-version.sh`!) and can be found at
the expected place, so I indeed don't see what more could be added to
it. Thanks for the pointer and sorry again for overlooking!
