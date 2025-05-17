Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD08C2C190;
	Sat, 17 May 2025 00:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747443104; cv=fail; b=VLtgrH7XvlaU71M/oaAQhu0JFhn7YaCWTjljcI1O/VsMI9EScQXeXrGZTyWBdTbmAObYIVcCEahtnA1h/+8lyG1f66emPXntKuX8nCuvx/x/Ts653VnPm+8/bq+I6KOwPb7cQfZKI62p+hrP16egca+Qk1zpS9cyT5P1F5YovhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747443104; c=relaxed/simple;
	bh=GC91vy/x+I06a0WeG7VghBzdnuFKFTwv+JUhzTDS7EA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=ok1DT+jtugk2hFHBzvoJFDOT9jFweyisVcJ9VIPi9FULhNocEZhBfax+WvrL4SqVeRL9t2lVYFGOJj9np8mJQogBx0jTYLOZfd62m/I9QFatrCgaTJo1atCUxnj1y8Bjo7kqoavViOOvG2RoIXLnwYQ/PPq/rz7Wnckq/NMNkUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RvFMCAfu; arc=fail smtp.client-ip=40.107.236.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RvFMCAfu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8L5g+hZA0y7rIMwhtjVVuo8JfFq0qbpz6YkSVxkUtworGLcHhWtk6f3G6El9ugeu4uHaFQQOUNp+2hFu+CfNXppkq3bRmM7QeomJHx+R80w1ywfKk5ZJRQAvIgyfx6F2qrjVsWw/bn99VFdu2retcqBhFtlZJzNs5l4XQiPjG/XHB9iNULcQxCb0Ys2UgvBHhtnxrhU0ysd3JrDWgEH661/xCJblljtMwqRfRdqwSvt0wj8Cdu5p0hauiD6yFx3hVHjAy+Ok7IO0y0wcBSYXZnjjrAozEvkNgavN48TWS/9f+FIv1WyNwdmxpcBG8oTn/CDe5pOnp7OfzSOqVYsbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4EV7pYJPJEL6Syc4gBoFHlFVDHPWojf18QfjtWYGtM=;
 b=AFsSJc78+J3hqZbNONz7TwH5/UNSbgVz572oEb+V3GVk6jGW7gC5Pmv1Sz4AaAdVLMBrbFtZ+YZeHIc5BS2+UwK7+Df0vnPphdTegAa4GgAY/rmcjZi3n+QXlungitVKRoO7rsfvWWHMsGMJUf8Cvj/cjcEp5ZNIZZdKk5xhoQi+GQPbI9EoswGi3ISIxsGi3ym2GWmRecTobgTOTW0FG44HxK+xmYlYHSoOCfKP8O4H8i3HlqGXdEl0uWO9ykmmC6fSbart2VEyTaM+SqEo7EMv2RF3iRCCRrV7BZfAVKHy/Ica712tM2F9TLE2TozOZFnFAOL7vWgkHFt2d4kIpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o4EV7pYJPJEL6Syc4gBoFHlFVDHPWojf18QfjtWYGtM=;
 b=RvFMCAfueeH94me5WNfWR0Z2WRFZTzW90PzxxUtV6281ULH2U7ZCFqzaV9CCyBUlK78P2NcCJSjOaWHNwbSW+CEPO92AmgTqswaPXqtWrpTpFOBo1YTVWp2LpOMa2aQ6sIpF0G9iHZMkyJS8NBh5dci4ZuTXsybhg7lR0WpUaLQawcvVibz3U3qRAMRB0UQZ1p4rDx6x2YzIV0PqAu8mDBI2LTQ9cpqoweN5Pz+eYYYY92kTcCTtbtwOolbkUUsiRLdyHFwbZ3POVUrvaqJEUIDnVaaQLxMhjMJUSZk953nvuoeLSxKXrOef/GGVX41TyjnCN/tTAZG0jhHLwgPSBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB3986.namprd12.prod.outlook.com (2603:10b6:a03:195::27)
 by DS0PR12MB9275.namprd12.prod.outlook.com (2603:10b6:8:1be::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Sat, 17 May
 2025 00:51:35 +0000
Received: from BY5PR12MB3986.namprd12.prod.outlook.com
 ([fe80::fd50:53a1:f2f1:811f]) by BY5PR12MB3986.namprd12.prod.outlook.com
 ([fe80::fd50:53a1:f2f1:811f%4]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 00:51:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 May 2025 09:51:26 +0900
Message-Id: <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <timur@kernel.org>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Greg KH"
 <gregkh@linuxfoundation.org>, "John Hubbard" <jhubbard@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: add basic ELF sections parser
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250515-elf-v1-1-4b53745453c0@nvidia.com>
 <2025051543-override-rockiness-3ead@gregkh>
 <D9WLFTPRB9FJ.OL6I760HKALZ@nvidia.com>
 <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com> <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
 <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
In-Reply-To: <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0098.jpnprd01.prod.outlook.com
 (2603:1096:405:4::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB3986:EE_|DS0PR12MB9275:EE_
X-MS-Office365-Filtering-Correlation-Id: b2793c13-03d8-4baf-e2f3-08dd94dcf601
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzRRRG41WENoMmJRS1pTMDQyYVUwK1BHYWRqdnJUYkc4RlJXY09Fa21UYklz?=
 =?utf-8?B?NkswMXRrZUtwNEFhNG5WVDVOY2gxNG8wb3AxRENzZGdkanlmdlF1OGQ1UWpB?=
 =?utf-8?B?bnpkZXgwRG5OT1ZGZkVvTzN1M3JaWkRlOWVPb203Y203aVBvVHZ0ck92QjBD?=
 =?utf-8?B?UWJodlFpeU5BbnVwME1UVFQvd3JqVVVNT0RWSjNRdmZGUHlvVW5icDFZNmNw?=
 =?utf-8?B?dEY4UGlnWlIxTzVOVUVpZnpMZU9rblViZzZOL1FnUEFwNTBTMFkweUVOdkxv?=
 =?utf-8?B?NkZ4MGlBZWdYa0VmMHFZbG5rdzhIbkd5VGxoUEhRaEljN3hGcmQycG5VQk9T?=
 =?utf-8?B?L21pUTVaQUQzOUVQZmZVRUdJdVNOZ0plMVk4WGhWMVBGR0V4ZXVyb1pnZTVI?=
 =?utf-8?B?a3NVZnFRYUVnMkNmRVA3UkxXVFFSMnIrbW1ITVhHZ1dnVHRzS2dVYUVtUWtS?=
 =?utf-8?B?ekZsdm9pMzZKZ1lzZmw4YjVKQU02U0ozRWdvdWJTeC9PT3hUcmhkVlNDRkp2?=
 =?utf-8?B?RjgvbFVtUUZwckVxSUovbXRsdEc0eHc4R01iRWp2MFdyTktzdCsyK0VpV0dH?=
 =?utf-8?B?WC9RZ2dWVytZZ2ZSQjlHeWljTHlxVG94SS83YlRXQnIzUk5ZaUVhYUZIRXZF?=
 =?utf-8?B?dytTN3JTZ1dPRWl2WG10ajVHdUpGaS92aUVLQ1ZUOWxIUzVYR2J6eEpuajVX?=
 =?utf-8?B?T0l6R1pHSUhud1l1c0MyMExOVHg4cnAvK3lOZ1FVT2I4SXBObDJjMzlGSncz?=
 =?utf-8?B?ZVU2T2hNVE5SOGJFc0hJRHhpQ1VTRGlyd1BCSGZTUWZUdnFBdkVQNGt3ZXM2?=
 =?utf-8?B?aWtZOVFzTSswZ0UxVll4RlFPMjlGM2hCR0tzUkFJMjRpTWNHT0RKclc1a0ds?=
 =?utf-8?B?T0hKcDEwMDJ4NXo4eDlZRDZvM0VRbS9zbHFha1U4UC9NUWxiNS83WGxML1B5?=
 =?utf-8?B?ZW5yRWxtS203RWNWU2pRMzlSUWtQalFQMndNaXJyOGIxUTlDZTJRQjdyYzBp?=
 =?utf-8?B?dENnNUdTUXVIUkxMdkFaSmVzQ2pocFk2UGF0NGZObUl2R2ZMUGc5RCtFZGZX?=
 =?utf-8?B?ZnZlTHQ2Ynl2L3FGc3FnSjlNNk1XSW5wcndhSlVlVjVuTElvaC9QSENVemFH?=
 =?utf-8?B?dWhGVmZqR2JXektJTkFDT3BKMTVYNFZ5SkdCSWMyVEZrSUVLd3BJaVdZQ3lB?=
 =?utf-8?B?eGQ2STVZQ0dHcUZ6cHBhV0xhYTNCWmtRR1J4SHBwSi9POWFTNnpUM2xma0Mr?=
 =?utf-8?B?VE9qVllRNjJvNElWaVErL2tncDl4UnhwWkJlME9oc3VCTk9jVXBTUUF6enhY?=
 =?utf-8?B?TWxDTDVlMlBxbEtoYUU4dy9YeE9MRGZKQ0FhbFZCUExvNjRPT082aXU5dkt5?=
 =?utf-8?B?MFBTdGZsenF4REJyTWt5bUEyV093MkhicGF2ck90QzMxMjlwanozTkNFZE9j?=
 =?utf-8?B?ZXJ5SDFxbWxFL2RFcjdHNVVoeWZqU243d2pNclpuU202VUZWVjhmUTd1R2c4?=
 =?utf-8?B?NVl4blp3U3BuamtEbEpKN3Bqak5NYXp1TEI4NWRXWWJhcnlTR3NOZVpNNkhT?=
 =?utf-8?B?Z0t1ZUZKR2V6UVZmbE5OV2hrdGZIcllicHl5VHlQM0FxQmlBdHMrMjJvRFpE?=
 =?utf-8?B?M0paYmlIc0ZIZWFNbktNQlBONFdmL0MwajR6MmFBaVpsUFc1cjZRSXZsSWZw?=
 =?utf-8?B?alQ1SUJIdHJhRTJnWndUd09SdmVlTTIxeUlHanloRUpDTVhEWnBYSTFzZ0xR?=
 =?utf-8?B?eVBiQXZScEh1czR2aDd4cVBlVFFiLzNJTng4Sm42SThsRW1zZFZUbUtSRmpT?=
 =?utf-8?B?Z056K0xvOHJuMExYdnVEV0JKQXNDTlNhb3IvUGlrdzcrYll5bVBiZFl5bVdS?=
 =?utf-8?B?b1U5YTduSGRJcTBrZzRaaFpHM21UZmVycnd1MElVb1dKL1l5RmRETkM3UTUv?=
 =?utf-8?Q?f6MveTH+ywM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3986.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bW80WWZjUEZVWUk1cDlCaUd4MjNxRTY0M2VHY01tU1BTalQvcXhQeEI4SWRP?=
 =?utf-8?B?KzlQRlBzTDZHdzJwZGcwbUR1LzdxSTdueXlkT1gzOEpWQWRCWEY2eWROWDJM?=
 =?utf-8?B?RENsbWliRGtGVlo1NUlwY09vdVdBUXE3ZTFWUmhKVG9uTDJIdmdOUzJCdEU0?=
 =?utf-8?B?Y0JKSWVqR3RGdGFLNVRVQkZVV3cvelc4eGxGMzN1eXBVektnQnEyYXE0WXA1?=
 =?utf-8?B?bW82NVlWOFN0TG5SNnlKaGt5WmFIZmtrbjQ5OElPTkNCMGFKb3Q3ZzJkY3Iv?=
 =?utf-8?B?dWFqQWhNY3lxU3JvMlBUczRRTWc5Y0xQOTdSS3JmME1aSml3THVoTEd4VnI4?=
 =?utf-8?B?bVZOdUZJbURodXd3WWlWMVpZeEJQSHVGUEhvSFFrZEVWd3BjQXM3dW82Y1BD?=
 =?utf-8?B?OWNSMDZxRDc5MWQyK2dCMGFIZ0p2L1l3dzJGV0xVZWZOc3Zqc091VUErNVlU?=
 =?utf-8?B?azRUZ2FvdUdhSWREb051Uy9aTjhqUHV1MTJOd3RURmlpZHREamJabmFXajVK?=
 =?utf-8?B?b2YwS1lHNWVEcnlWcjc1L1g5NElZQzN1TmhXcHBmNVBibThmTDZGS1VSY3g1?=
 =?utf-8?B?bmkvRFFENG9ycXNFVDdvVEJqYVZmV0h5MXhab2xLangyQjBHMEVReUZ4VGFh?=
 =?utf-8?B?NmJJV0JzSkRrVVg4NTBVeU5IcXlnYmJSVHVNK3B4V3BwaUpNck1kM0J0N0Qv?=
 =?utf-8?B?M0NNVmxaVE1sZHVQV0ZMRDNXVUhrYVhJVHo2RW92MU5GYzV0QXhHbWY5bjNW?=
 =?utf-8?B?VEs2UitPbUhTNHFTRkF5dm9Ca05EMWtSNlp0ZFcrb2xvQmdZZktCeE5GOXJS?=
 =?utf-8?B?Sjk3cDBibmI3T2NTcHNYU3pnL1V5eHVtRGh6SUtVSUQzRXpVRGtMVVdGYWVu?=
 =?utf-8?B?RSttdVY3NkpZWmNwZkxCOGJ1R09EdkkvSmFZKzZSWm5LQmpQMysvL01wenJq?=
 =?utf-8?B?VlRQQlVNMVpwVjBNQWVveHQzMWpoTjUzMXNXcXZRbEIvK2hkam1EZ3FmR29x?=
 =?utf-8?B?a2FiVWVjRFhuazFiYTVMTDVUNis0Y2gvZ0JleVhGU251WmZsWDY3SjF1cUdr?=
 =?utf-8?B?Zk5MMk5yYmhYTlovd01IekpMV21Sb2E0RGcveEQ2VU5nMWc0V01zRldDQ3Vq?=
 =?utf-8?B?ZHc2NkRncmpuTjN3dG13aFJPYXMvTWVKaFFCMGZNTEdlQ0x1OEk4SEM4Ni9Z?=
 =?utf-8?B?Mm9FU0pDbkRXQ1B3TFB3NmFVVmxINWhYamk2MXFkdU5mQzM2dkNpZEwycWp4?=
 =?utf-8?B?dVhkMmdnV3R6MWttR1hEYWJ6YVloT0hnSVI3Q05EQUJKcWhNR2h0UTRCNmhv?=
 =?utf-8?B?NVlBSGxmUlVVWEhmckdFYk95K3g3RHpqQkdpaldJNUYxTG1VSTVtbG1XNmdr?=
 =?utf-8?B?eEhsd1locCtkck9PbTZ2UDZwbkFGakx4bEczMy9vd2NFMXppOU5IS2xkZ3B5?=
 =?utf-8?B?TTJHREdHZURJY0RqQmcxTDNYbXZ4d1NTVUcvRHVBejFSemR1VWxzcFZ2UnZ3?=
 =?utf-8?B?dStTZDNxSTZDQzJORHJLZk1yWGZaWWtERm9VYlhiRGt6R2JXeEJNL28wWXBN?=
 =?utf-8?B?bnRkUVd3K0NXTklmRGtmTEZtZGZ5UU45Tnp5ZjdvL3JMdzdJNWhCZUJMVDFT?=
 =?utf-8?B?Wlh2SE9VOUkrcmJGWlA3Y1NmSVhaeTNlTXpUdE9JZFBvUVUweklwb0pPQUZU?=
 =?utf-8?B?bkNINlFjS2NGZlpQNE5SdG13cUI0WDdTNVAydzJoa05zbDVwWm10WndwR2FI?=
 =?utf-8?B?TVIxRkR5d3dMRC9jZzczUWtzR2hXZVJ4UUhoT2FQT3JXdlJSOENLVDlzdG4x?=
 =?utf-8?B?WUMvSDNueGVJdEloeTg5ZzlJdmtRNjVNV0FYelpSZ1JqNHF0YjArSmNLaUN6?=
 =?utf-8?B?cEFKSDI4Vkx2RTg3MGVVbzl1VVlNQTg1eUNJL0JhUEpJME8xbENOZ09LTlJ1?=
 =?utf-8?B?bzVUblA5S3dKdld1Q1lITU8zT2o3aTM2R1UxSkJiV0lBa29FNjZMQU8xTGt1?=
 =?utf-8?B?V1ZxZE9TZm4vQVlxZFZsbnhWSlNOMmRDRFMxd01mTmNldC9Gc0JLVFdXOVM0?=
 =?utf-8?B?ZElMWVQzZnl5N0NFdWMxbGNkMXZFbEJaSG8wais3SDI0VWxPVHV1cGlFdyt6?=
 =?utf-8?B?ZkNtWTBBSnpkS0V2dEhJWHdlVVEwQWxaRWU1SHNEQ2Y2d1BaSWpML3lKUXJZ?=
 =?utf-8?Q?MyzrW1s7W6E+oOJSL7RjZc7gmjYc/XVt9Y+NrICOa0K4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2793c13-03d8-4baf-e2f3-08dd94dcf601
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:51:34.3294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4YaW6cr7YpebOkxZXo3/KITYZwQO5JgrYgvwi/d00SxxsNJhXNuJXdCZYA6a73gql60WK8eoLRN9QKtVgEh72w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9275

On Sat May 17, 2025 at 1:28 AM JST, Timur Tabi wrote:
> On Fri, May 16, 2025 at 9:35=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> We use ELF as a container format to associate binary blobs with named
>> sections. Can we extract these sections into individual files that we
>> load using request_firmware()? Why yes, we could.
>
> Actually, I don't think we can.  This is the actual GSP-RM ELF image
> you're talking about.  This comes packaged as one binary blob and it's
> intended to be mostly opaque.  We can't just disassemble the ELF
> sections and then re-assemble them in the driver.
>
> Unfortunately, for pre-Hopper booting, we need to do a little
> pre-processing on the image, referencing the ELF sections, and based
> on data from fuses that cannot be read in user-space.

I'd like to reinforce Timur's point a bit because it is crucial to
understanding why we need an ELF parser here.

On post-Hopper, the GSP ELF binary is passed as-is to the booter
firmware and it is the latter that performs the blob extraction from the
ELF sections. So for these chips no ELF parsing takes place in the
kernel which actually acts as a dumb pipe.

However, pre-Hopper does not work like that, and for these the same GSP
image (coming from the same ELF file) needs to be extracted by the
kernel and handed out to booter. It's for these that we need to do the
light parsing introduced by this patch.

So while I believe this provides a strong justification for having the
parser, I also understand Greg's reluctance to make this available to
everyone when nova-core is the only user in sight and the general
guideline is to avoid processing in the kernel.

OTOH, it is quite short and trivial, and if some drivers need a
packaging format then it might as well be ELF. The imagination DRM
driver for instance appears to load firmware parts from an ELF binary
obtained using request_firmware (lookup `process_elf_command_stream`) -
very similar to what we are doing here.

`drivers/remoteproc` also has what appears to be a complete ELF parser
and loader, which it uses on firmware obtained using `request_firmware`
(check `remoteproc_elf_loader.c` and how the arguments to the functions
defined there are `struct firmware *`). Admittedly, it's probably easier
to justify here, but the core principle is the same and we are just
doing a much simpler version of that.

And there are likely more examples, so there might be a case for a
shared ELF parser. For nova-core purposes, either way would work.
