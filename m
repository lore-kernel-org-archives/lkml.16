Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022085.outbound.protection.outlook.com [52.101.126.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EE2294A11;
	Fri, 27 Jun 2025 09:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015691; cv=fail; b=iM4YWOC448DC9uvxo+bvWunKkZWGzuBWq2WMUMMXWpZZ5M18qzagOUkTzOF+Hi0jtnOwfz2OuEkZUvZt/ic/Q/9KN7WOyyiSqmWLZHZVC0Z50ej2FlDhbRBXmHxbSXoDwRYZNUIfkMU3Cs//V8htPLeXhufQzgzMD3S8mmq2+iY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015691; c=relaxed/simple;
	bh=L/Eod2p+rOWVzb/h53epRkeSO9cNx1uJTCfDsTt/r0g=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=k5a6QdWya4uY07E5q9sxjBGX95Ao4BWMrUql3DNKdiFF2Hobzt74AHkuWt1zhW440qZFvYXWj8v5eTk7NKPRy3+9vzp1cKLnXDCHlK0sGtb0Pzyi5cd016Q0lrZDskNF4MDUjIYuSi6PhLcmd8TdvmFnKRWqjRHMpPLl81JNJVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=Sk0x/yET; arc=fail smtp.client-ip=52.101.126.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="Sk0x/yET"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzSNzUB2pThc1Z8xADPEu8YiHZS9SZWyn1+cWKOZ7ei1WKCRphNum8y7XGPxteZOx6i76ZmPlHXZUusy/k+asooZEsinbHM1Tys7swAwj98l+sfkca4/5YvpPzR9fA6/wk0mWLy5xvQC2O44E/CN6lWxa5WFSEpLgpFRJQLSnW95XLV3VHhjiBr6MhhDz+/8dmR2KZ6LmqoHczs0ifUt/2b+LEW4gMvrCCwfBIEQtUTVRmYTXFfG2qrr+84jFKlXhh6yK3r4Nz/sxRtgqIdKQGnPIXxcryFsjn/hc2VuLe0S0Ff0ncX8+8K47AyfBOuLrRdpknRJQ3aSDK3VMkgEWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3+E2+znP7ScB2rCRuRsZlSWUayIExNs2Vx4QCzB4wU=;
 b=fjgjvvXfnUi9wv2IuMB4h6i+tDC0OSlXzlIysG0+5G3EVcxcaCiqQAjKdTa5x+/z9/pqj1Um6AmNeE0fQ9RZiVw75h5HYlMGMJQGBEqn9LGUh1xgfOfVpFj8yW1snMGA8lqG8icrrlZ30C0CPnv9vEx06YBv8KrGpJD0IGCn7BIRdU/zO63bwTowFrE5ttfj4/8xW1s2wT5TxeAQc4nGAgurLTlMP0sf20+HB4QsaWsv9dLkOOaOjuzXt/XBn14n6fdHvVRpXEFGvHptn+PIvzMsZGVa6DiihQFJRnoLDKdLAswJ0//yzWRKL6IuyWKO9DG9BRUW3pMROAhkSdw8dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3+E2+znP7ScB2rCRuRsZlSWUayIExNs2Vx4QCzB4wU=;
 b=Sk0x/yET8RenqAZvBRpCt0g4aXVKQ4o/8bW3UVkBjJArjbh8E6XvtoPueN97jQRPLFMhT0Q8e7ycgYX+ZOuCYyewjQShc78mOSEgwkJGI18yCWyu+G1kkwM0iH2lcN3WHn/MGUkyx2ngJkKCoOMKQt00cQz44tdkBuSJXYV9tpvmshrer4vI+O9tzMjybKySlvFcUl5WoBMwqDKoyWDtFtDseuD4O7LDF1iK+lqf6GecfjXy0OmFtbzYWvOTtHkSwRZ49sWjP4eM0xWQ/192PXvChblrXT82OnBbYY/u4qgoc0Lmp6VEIxOIRKXl2U1qORatoVwRvJhe3sPBf4f+Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by SEZPR06MB5898.apcprd06.prod.outlook.com (2603:1096:101:e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Fri, 27 Jun
 2025 09:14:45 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%6]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 09:14:45 +0000
Message-ID: <885c90f6-3669-4c7b-85fe-c1999121e66f@portwell.com.tw>
Date: Fri, 27 Jun 2025 17:14:43 +0800
User-Agent: Mozilla Thunderbird
From: jesse huang <jesse.huang@portwell.com.tw>
Subject: [PATCH 1/2] platform/x86: portwell-ec: Add suspend/resume support for
 watchdog
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0024.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::13) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|SEZPR06MB5898:EE_
X-MS-Office365-Filtering-Correlation-Id: aee2d547-10bd-4d49-e62b-08ddb55b0f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y1BnbG9VY1YvYzRyeEcrbVZvV05zcktUNmpKQzQrYjNoTHBKWHNQUE43elVN?=
 =?utf-8?B?RjVDaTFRNlRjVGQxbXczc1kyVFlRTEhKczI5N3lIemVJVkF0YkQ4cGFNZitU?=
 =?utf-8?B?TWdtVjJ4U3FweHJmRWt4c1lmb2J5blRNNExjbkV3eGpxWnB0OC9IY3ZtWUt1?=
 =?utf-8?B?M3V6UUJLc25Fd2g4cUx3eUYwWEJ5OHh0ekhHQkdBR0xsZSt4TjNuRkppRlhR?=
 =?utf-8?B?NEdORTVETk1mR3Qza1RzckJwaE5XcWd6UkFXQXREQk5CczlUQ1dudld2dHFI?=
 =?utf-8?B?aExzYmRWTmswVUcwbUZ5OVJCT29xMno3ZTBnWUJ4MUhZZ3JnRGNNR0U4eXJh?=
 =?utf-8?B?cTNqTjU5dVFWQ3kyZSsrMHp1ZkI3R0VwOVpmOWZxckZ3NWRFME5VUHNhZUJU?=
 =?utf-8?B?RVhZTGhCM29ZWEpMRE4xZFVyV0x0bnZiZExXc3UyV0RYRkZHVHBRZVQ3dmE2?=
 =?utf-8?B?NjJNREluSnNmWUZTc3JQcyt5bXJzei9nS0FmRko4U2R1UzQyVG5zWEoyU3JB?=
 =?utf-8?B?bWU5K2N1WHgxK1JlL1h4UEswejVUeHU5YTN1aTZDT2NkNG9mY29HZVgrV3lI?=
 =?utf-8?B?QWJPUys0VzdKVHYxWWxGRnR2OUNUSFc1WWhpNkhLc0V5Uy9Xc1duNWZ5dVNB?=
 =?utf-8?B?L0o3VFhYLzRkSE0wbkxwbWpDamx0azdnSVpIK25YU1lCMnBucXM5MlRFT1JU?=
 =?utf-8?B?TEU0blhKbHZCWEU1czF5eFNXSjlnc2dsM0FhNTM2c0x3eUdTVWlQU1NMcHkw?=
 =?utf-8?B?TlV2OTBxNEhuOVYxQTFpMTd6QnRZVUY2d2F0bktuby92azdPdUcrU1pBT3hN?=
 =?utf-8?B?bWpXWW0zWUxCN0ZVSFJsOEVYY25DL01LUERSNTlncllJQUYvT1JQSVhNb3dT?=
 =?utf-8?B?d3FVUzZlR3JMZDJnM3VsTEgzdUJjRHAxZW1jNGVWc2RzQnBHNDlvWnpaY2pz?=
 =?utf-8?B?aVlqNHVSYWZuQkpRWnVMMEFoWEY5VGpuTHJJUGdKWTN3VTA0KzJaMjlic3Zw?=
 =?utf-8?B?NkxsZXBpMThWQmxPNnNZaERpVnpPcERXb2x5OVdRNjVxcmllRXl5ZGw2c2Z5?=
 =?utf-8?B?TVZ4M29ySU16eUlIQkI4QXA3YzM3b2JLVFlrY25udC9hbnlhRWRTY1JhaFBx?=
 =?utf-8?B?U3lZTG9TMGgxUXZsQzA2TEFQb2tIakRTZWl4OHNPWUN2V1FRN3RzZVhCb09o?=
 =?utf-8?B?enNwZnRNT1FPbTAyVWQxcGRPTm8wMzY4S3grUFpWTU55THU0eHNUclpJYkU5?=
 =?utf-8?B?bzFyZ0puN1hyNlkySHh3eHhjZG9tNmt6TG1aay9tUTlRU1FoZVdIeSs5N3NJ?=
 =?utf-8?B?MExHVDVJMklzeDFKWkJiN21sVEhtT0llR0l3bmpMbFN1NCsrOElGc05ZN3pa?=
 =?utf-8?B?YVdvK1NmUjNUWk4ybFVWb0hUTkduTDY0aGtwZ3B1U3FnTVFub29XNW9udTFl?=
 =?utf-8?B?WUgwUjBUbU9EVXFwT1ROTzlEbHMvdEFDSGxneCsxclVOQmVINnZjQWY0b2pw?=
 =?utf-8?B?dEJKeXVqTTlXb3lkMks4UndhNk1FdnVjTS8rdEVsRHRLb2NZRDFtbjBZNG9S?=
 =?utf-8?B?Nmo2QlNsclNxNmx0bDJ2SjhYS0ZMejI3cUFOUzgwSWtuV0xDd2k2MmE5eVdY?=
 =?utf-8?B?eEdSQ2RXYzltRlBTRFBacit2MlJZRWR3b1IyTzBMZVB0SGw2eTBWMW1pd0ZG?=
 =?utf-8?B?eElMMFIxSXdybzc3cnBrRkJ2QTNrb1U4SllEdWx6d0FqQjB2bktEY09ZVFRQ?=
 =?utf-8?B?WWdrVU0yeFROQ0x4Z2F2ak5jRkRWYnh5M01uY0NzMTJ2Yk9ZeTFPSjFMYytF?=
 =?utf-8?B?VjdXZ3llb2ZyZFJodjRJY1ExQXk3ZHBvWDFQRm1VUnpKa0RnWE5GYzFrYjEx?=
 =?utf-8?B?TkUxamtwa1BCWExIY3pRbEdWeU1MQ2JlcTNzcE9uY01sQVNvaW94TEtUMSt5?=
 =?utf-8?Q?gWdoziTZEMk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1lYRHJUTGpnN3EvQ0VlNXQ5QTd2ZXgyNFZuSjBpdVIrRVpEMTNOTFppeFh1?=
 =?utf-8?B?ampFekpsVkpyQnp1RDVuVU9qN0lJUjgvemZOU2lsOG51ZlFKenBVYjhFUVNO?=
 =?utf-8?B?alJ4R29MVjArYTc5cUpGMDl6eGZkczk0d2drNnRnSWVIc0lKVkZ1aTh1V1N4?=
 =?utf-8?B?bWhmNGFxbHRUTG9qbWh0SW91QjlQNnJZeFBUc0JjRUlRM2p5cWdPTTVpTGF1?=
 =?utf-8?B?ZEExWk5pZDdjbElxSzNNaE5oT052d1g3S1k3QUZHSkx2bDBEeU81VXV3K0dr?=
 =?utf-8?B?Y1pDL21TZDBYMjhSUjZBL1BHWDFVSzZSb2lmOGp6S0UySk84SnhjS2RXdnI0?=
 =?utf-8?B?U2dzNmRLZzY1NFdYemg4a1poM1NqcC9aQXNlSWFnVnV4OTJBS3N6QXhPeUpx?=
 =?utf-8?B?SURVd1dYZ2RZMmVnOE5IM1ByY1M1S2R2a1doMlVBY0tBdXl5R2U1ai9Rd01J?=
 =?utf-8?B?MGEzK2hEcUVFT094c1JKTFJsdFhIYWpvTUpLbFJYSERjM012WXowcURwL3Jq?=
 =?utf-8?B?RjA2VVBJQzdrWi9YQkl3YnVJcjdTZEM2WHdVY3lHM05jOGZKWlduQVhjRTdY?=
 =?utf-8?B?L0JKc2xZQnBsSVRVa2hpRXhwcHA3dCttWlhwVWxRSlIzbXlxN2RKbzF4NEhI?=
 =?utf-8?B?eG43cVp4MTFHRHgvK04yZlp1V3pkWU5rVVJYcEdxOUh3M2RWdkhtNmx0VXlU?=
 =?utf-8?B?VXZza3d4am8ySzVHNWFIMWFLYURYb3QyNTcraUJtQW9XNWQwelVyalk3eEwy?=
 =?utf-8?B?MmlxTTNyWVJUZlp0Q2lLV1UwTlNUREN1ekc5SjB0MGNNeWdma0RxbGVFcTdt?=
 =?utf-8?B?c1RQazdhUUozVmVqMTJ6dnpiZVBPejNiamhRNFlpNldWOTA3YjNUSjZHMkFt?=
 =?utf-8?B?OHlGdTVXVGg2S0I5ckFKWHJ3d0swNmliVmZhdUU5enpGVGJhSWd1Z1E1emty?=
 =?utf-8?B?NG9Bdm9yTXZraHZWa3cxNHhJVnIreFc2WXg0ZE40cjhrTmNSUnI1YkYvYWJy?=
 =?utf-8?B?enJaUXRwQlNRSWQvaGlyZVRCYUJXZVNUL2U0OTZGdk5YaU92WG55QVNhR1hY?=
 =?utf-8?B?LzZ6TmVoZ1JlWlRlQVBRMUlxUjgxc1FzMkVxMmJtVThsRGh0UVhGUk9ldlgv?=
 =?utf-8?B?RC9qQUMyVG5ZQXJxaHFFM2J5VjhzOUpUR0c4c3ZDTU9pWmdUeWNJZURoNWFT?=
 =?utf-8?B?ZVNwZkR4cGdyaG1rWHN0NDh6NS9mQU05MXl1Nzd6TzlQWWM3eVR4VTQ4cjJl?=
 =?utf-8?B?bFRXbEVtYk90QWZNZURkWUg4TEJxeC9nYXNGL0YrOWRORjNWQmlQbXZJazdn?=
 =?utf-8?B?YXhtMGV5TlhuaHcwRittS0hKUjRRV3pqTjV0VzF6Y2FzalRxbm5XUmoxSWNn?=
 =?utf-8?B?UmtHNHpyaTlYenRLalE3NHljVDhLaXZZTXQ3Qmo5T2YwemVRdWZteFpIbWFW?=
 =?utf-8?B?dzhpUlYvVEszVWcwT21lREovM1l1NFVtZisyTTNxL1F6N1RsVkIvUkJibVZl?=
 =?utf-8?B?dlVrL25ocHZRMjNzTmlVNU14dHYrVGNLRklGRTJOdUNsSVFNdVMzd1RzOUtL?=
 =?utf-8?B?TVdDdjM1NldXazVsTmV5ODJVcXYrUERwbTJNTkMrUU9zKzI3MzlPUGt6b3Mx?=
 =?utf-8?B?cjVqR3VYZ3B2WlpXZVVFRFB3TUlTYXdielNwWTVnbStRR0ZDRlovckloN2Y2?=
 =?utf-8?B?aXBIWUxHdTVEbWM4WUhYY3kwWTFCMmFmOHRvbkpyVkREUHFTcjlXWjQzQTd1?=
 =?utf-8?B?NHV3YTIwSUg4enRHUGs2MW9YWmNpYUVEOTdnMEJQYkQ5YlNDL01WMDJad2dY?=
 =?utf-8?B?bEVydE9EekVJRkkvVVNCQmNTMVY2Z1p4TXNYbmYyVUtEQ1pNUHJ1eEhheUlx?=
 =?utf-8?B?UVlxMUhMdVRKNG5iVnV3VkozcHlHQmZLaWVpOHlJcEdsV3FyaUEyLzFPSUNE?=
 =?utf-8?B?RmVobGlUZ2VSZ0N4cXg1ZWgxK1JYb0xBaERiRm8rQ3BGQVRRVU1PSVB2bDF3?=
 =?utf-8?B?MThmbmtqKytkT044UndlQ2x0b2NnN3ZLQTIxNWtLdnJKVGxEcjlnLzEyb0Ri?=
 =?utf-8?B?K1VjVzlrY2cra1NtM1lMQ2pDbTVvUEZaelZ3YjJ0S0t3TUFpckxpTnFoaVor?=
 =?utf-8?B?eURZbHVCeFlxdEIzMkdXT2ZrRmlpL2dHbnp4M2pIQW9YeUg4ZlFJWGdEcTRo?=
 =?utf-8?B?UGc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: aee2d547-10bd-4d49-e62b-08ddb55b0f02
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 09:14:45.6543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrIeWl4LTh7jcH7TgIa4z01AqChU3LpzS4bAfpQozqCk+EdYPz0awZ4+sWumBEzG16hCDNigANGohM1YWs5fhtW3KnNmY6HanwvXYC8emcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5898

Portwell EC does not disable the watchdog during suspend. To avoid unwanted
resets, this patch adds suspend and resume callbacks (pwec_suspend() and
pwec_resume()) to the driver.

The watchdog is stopped in pwec_suspend() and restarted in pwec_resume() if
it was active before suspend.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---
 drivers/platform/x86/portwell-ec.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
index 8b788822237b..a68522aaa3fa 100644
--- a/drivers/platform/x86/portwell-ec.c
+++ b/drivers/platform/x86/portwell-ec.c
@@ -245,11 +245,29 @@ static int pwec_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int pwec_suspend(struct platform_device *pdev, pm_message_t message)
+{
+	if (watchdog_active(&ec_wdt_dev))
+		return pwec_wdt_stop(&ec_wdt_dev);
+
+	return 0;
+}
+
+static int pwec_resume(struct platform_device *pdev)
+{
+	if (watchdog_active(&ec_wdt_dev))
+		return pwec_wdt_start(&ec_wdt_dev);
+
+	return 0;
+}
+
 static struct platform_driver pwec_driver = {
 	.driver = {
 		.name = "portwell-ec",
 	},
 	.probe = pwec_probe,
+	.suspend = pm_ptr(pwec_suspend),
+	.resume = pm_ptr(pwec_resume),
 };
 
 static struct platform_device *pwec_dev;
-- 
2.34.1
