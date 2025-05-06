Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726B328137A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540868; cv=fail; b=t+KXfg0DsdLqhiswKBx4eVqAMuwe4iPT0udENjxI3GmxwU0bgYQB9J1cGhkk2vRXBkzpr9pKVmE20hYmYinC6mW/qlC4CZ6/ph3X3ZUZK1jEOdte6/biFZvjQz0fsj5ArObJEwSn841uvehq7a1ePyue57bi8h5VIayRlkSVdEI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540868; c=relaxed/simple;
	bh=3b2jBNPhH4POOuSxNFydVhXD60Q/YPZcrj364wWIO9s=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p/hP8n7V3H4wsV+HvwtyPqewFeynlw6xv1DubLESngAO6tT5i6F1/poT3GOvefZs+Ey3STjUQKmirxQJQ/4W9pr/Tq45EA1vSqPJRh3YmmR4e+sXuw08vJmnYuko/opcEjfGvDYONHDp3xklh+S14CrVVVxrCE6MUBEDiC5CH7g=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ccGABQcb; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ccGABQcb; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ccGABQcb";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ccGABQcb"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=U5pBuQNArz7IcnEzf71TBWxNvDmql0Qoo4AYmF1oC+ARoEiaVUv4yrU0SMx6M0ht7zyGWoRPdtWrjoj9cWr8sTUDAXVOKtU9UzW86l6Sud9Y8wh67tYmNUgLt3FFgK8hpJw4wDJd8xgFFLG6zW2KYx/aiKZn82DwbjVNJblQBtOT709ZYqxSBMYM6R8U0GMuFniMD9eB5kpFd0xtHMRwAAAdpty3fk2bdBfNju2haRmqWGOlvd7hMXRNfpJOk0J6+jkixnyABuNHYs8oYW27YRgkAkICGiMpvH3N5oQkfsMCztTXK17TlAnvZx5SLU9WdwHgR5AxTbXLvQCPPBpN6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utQWdcshthkCVmNdjkQLerB9CwzLjHuCq4W86ArNOxg=;
 b=sgl1g285R8SGPYESFDEoMd8sIr7gGrqzq6YyX+2TMhlTyYmu41sc4Ri1wga2JrEr5PXVSKdjowxr0X+5ehCKHa1oaOIpZmsqkG8HiZtzP0LTKdifggJuusK5uI8PRTT5JXdM0NaBbxB9EgcWUnUZInLOImeh5+6MN9HKn54snIAJPcRirP1pf0Rjw3ACvtK/XIkRmDvGP7I5wABH2hjcZtJNYwocW/PYXZ8K4Kk4/Jy6ZJSCf082YM4eOmjlqNJuUx82N+8EMnxLyV/5cID3j83f5xnugFecorGwEba56w/DUJOXUfglP6BMPm0vnPtuifjB4kiMMmdlDcldxfHhUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utQWdcshthkCVmNdjkQLerB9CwzLjHuCq4W86ArNOxg=;
 b=ccGABQcbDRCt9G8rgNcaGFtqTk7/1paQ1SyH9ff89rNgeErcO+qT7OHU3a/43FnnRCUjZNKra6q0GsF1/eZYPJdQtowvx7lpKxan5tp/fRtc+1206o3Y/yAzeQwo1bH3Ua4V2sPwnvNEj+e7pgezw0kr6fBKIzRxbTfSoB+h5ss=
Received: from AM9P193CA0030.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::35)
 by GV2PR08MB7932.eurprd08.prod.outlook.com (2603:10a6:150:7f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 6 May
 2025 14:14:20 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::ef) by AM9P193CA0030.outlook.office365.com
 (2603:10a6:20b:21e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 14:14:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 14:14:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ssPZzur1xDiFIlgW1aImZEjuacHn/phidcgibr6+Wd0yuTUCc28GXQlc0za++Cx2KMkp6AOe1b8vHeiM8qVVSyu9dVkdO2u7Vu2K+uScc8VPBdgahn4RFIaSF5mwTTuNJ8Ve3qri06mZMV39RRzatf1aOac3MdqAD9J+UDUUi9O+VN0GX52ALgO0RPKx6YllyhxgclUr35d4aw4UHW/0Jvg23uY2h+tw00us076XjpDzuKo1dPx2xC8SwpR8hc7e48lYRPBNMK9LF2QowdqMwrMHGEDyQXwxTpGuDLu03wUA1vzgSObx9eIQL2yaRq9K282mF3LoGcLVD7L+/cBi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utQWdcshthkCVmNdjkQLerB9CwzLjHuCq4W86ArNOxg=;
 b=xCEB5TiDJVeBbWYFyQpu8qdoQsixuw4y6joIYZ1/Wz2cSFQAsH9CYkIH5+fpeM2z/JufKhTCM4Ax7tttecKk8qIbn0ergo1zXgSJgDkqK2tV2fwHP4IU0XSBQKRwhaQdWfboHuDfOJDkfWvry5Kqwvyv7BLJR7PPj0ku5oJ19nvB27wKTycKeLEXrFuiMqXtvgPvnOjU1jR1SdLG6fe+3iK9lLEW8fEYhwBBVTER9iNR9YENVYDNHexI01/sKO2g3KXhj/RTCclZMZiJ3soJDNBcPG2vfRtKomlWODCHqkpu+/+1Tw9TdrCPysE+2GfUdrRIF97uCeodtLvYGE6BXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utQWdcshthkCVmNdjkQLerB9CwzLjHuCq4W86ArNOxg=;
 b=ccGABQcbDRCt9G8rgNcaGFtqTk7/1paQ1SyH9ff89rNgeErcO+qT7OHU3a/43FnnRCUjZNKra6q0GsF1/eZYPJdQtowvx7lpKxan5tp/fRtc+1206o3Y/yAzeQwo1bH3Ua4V2sPwnvNEj+e7pgezw0kr6fBKIzRxbTfSoB+h5ss=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com (2603:10a6:102:8e::21)
 by AS8PR08MB5992.eurprd08.prod.outlook.com (2603:10a6:20b:292::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 14:13:45 +0000
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d]) by PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d%3]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 14:13:44 +0000
Message-ID: <1214790d-5f2a-4bc0-bf9a-ac1688174f21@arm.com>
Date: Tue, 6 May 2025 15:13:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/events: Improving scheduler debugging/testing
 tracing interfaces
From: Luis Machado <luis.machado@arm.com>
To: linux-kernel@vger.kernel.org, peterz@infradead.org,
 dietmar.eggemann@arm.com
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com
References: <20250409151338.1046335-1-luis.machado@arm.com>
Content-Language: en-US
In-Reply-To: <20250409151338.1046335-1-luis.machado@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0093.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::8) To PR3PR08MB5852.eurprd08.prod.outlook.com
 (2603:10a6:102:8e::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PR3PR08MB5852:EE_|AS8PR08MB5992:EE_|AMS0EPF0000019E:EE_|GV2PR08MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: c5628abf-f36e-4b8b-7725-08dd8ca84a3e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MjArVVNxakdDay9vMk1nSy80U1loMUVDQ3NFNDE3bVlFa2FrVDhENWZWMUFs?=
 =?utf-8?B?dXhiTlE2VVdxZmVpR2RpbVI4eGptOWFQWEhIZDhKS2ZIQVJDZmNqSVpXUFR3?=
 =?utf-8?B?TXVsRGNTSGZ6Y2JFOURpTHMzM25FNTRaVzRmM2ZYaU5JVHVwdU1pRDJhc0wx?=
 =?utf-8?B?U3NnNjRqVzhWbzRHUWZ0NG4wUjdlRGlqbDdOVjdzWDZGU0ZtYStkZWduYXo4?=
 =?utf-8?B?dG1lSzlsaVNVblE4UHMxSmJqNWEwdk1rTEl0MG1YSklYR3hBN3pHMzZBQUR0?=
 =?utf-8?B?d3hHZWdDano0TUZKdmFLNDNVc0RnZWJxbG9nNFFPQkhkc2FpS2pDYXBpV0pV?=
 =?utf-8?B?aVdHVkIwNmZ4S0krMjhkSkxqRGkvK3RjQzhKUk8xamtNbnpjM01QTlZJL1Yw?=
 =?utf-8?B?NDgveUg5bENQSEdJaVRGNkplQ1dzWEV0WHpudTUvS1o5L1pnaWZ5WU16R0hI?=
 =?utf-8?B?OFBoUWVsS2VJMXh5MFBQMFAxUjA1U3dhUm0rdDRvbVdUaHdUdThXbk1DRnhx?=
 =?utf-8?B?TnJFaldaOVF6OElkTlN3WEVWSnlMd0ZYajk0N3llbytEVi9LcnJsODA3U2Yv?=
 =?utf-8?B?WjZmRjlwUVpkMk45T0J0b2ZVUUpuQzVCVUd4UmMvak0zaFZIMi9vUllkRU1N?=
 =?utf-8?B?eHNTRE5tZzB5ZW93WHdIZjRxQWdyZWdrSGpZeHkwajR1YkZBdUNQeVdidnM4?=
 =?utf-8?B?WERvcEwxR1RKQlpWVFo5WmFpZTVVWEtwSDN3RFkzUTkrMzVUY1ZxM1FuWUVh?=
 =?utf-8?B?UnZyR3ZtWERsVUwvNlZOTXZoMjdFcE9sMTdkcFdXRE1UU0tIdGNYYVJOd2FP?=
 =?utf-8?B?Y3VRMzN5SndkM2NEd1RvVE12KzBnZGdBbDA5V0Eyd3dXQjY0NStOOEVmTkxQ?=
 =?utf-8?B?Qkt5dkRYdFdocXUvSEc0VHVkN09DWk9OdDNJQUI4WXh1aGxYOHQwajlhUnl6?=
 =?utf-8?B?ZXF5ZjUzeVBjWkpJTFB3UitraEhKNDdRalBBZlEzQXdXYWRQNW1GQmRuMGxF?=
 =?utf-8?B?dGFKejBiSW9BOFBKYU5TRHBDSGJBdStpT00wK1RuUFhMSkI0NVdrVWVMU1Zz?=
 =?utf-8?B?TWh0Z2M3eS9ZOUhaOEpXd3pWRGErblVMeVIyY3RkQVNEeGtVUTlLOWZFenFJ?=
 =?utf-8?B?VXl2aDYvaWk1aGNhZFZTMDkwZTJ3d3FyaFlCR0VweGw5Rmg5S2Y4TnFrU25L?=
 =?utf-8?B?Q1Z6cHRnNFpxL1FXNGZ2WEZyN0NDeTh1Qm1jQmlnSEZlUjBGWEZXVlJGbHZE?=
 =?utf-8?B?eDRmandoZFp4cFRDZy9xWVgxRTNkYm1XaG1ucC8wYzE0UmF5ZXhZMXAxVXhM?=
 =?utf-8?B?cVQvM1JrdXBzeS9TVllLMFVvM0UvVGd3UWNUNWdhV3paTFVpQ05raGYvZXB1?=
 =?utf-8?B?Z2o2czRRS2hldmlCc2NRVW03enY3REloSDYvQVlzQ1AvUzZRWXA5S2FJV0pC?=
 =?utf-8?B?cU1ScU9MQzlPcmYyYWk1T1c4c2pKeDAyUm5WaFBqWmp1bTVXVnlrS29HTVBx?=
 =?utf-8?B?VXM3d2lGMmd3WEhFRk0wSG5nZ0F3a0srY0VrWlhsYUpmWGdSa2NjQ29iYzcy?=
 =?utf-8?B?OWliVHdvWnpTNVd5L3RKQkc0UXREQnl0azVhMjBsTWtzbEpyS1RFcEZiYU1a?=
 =?utf-8?B?VklXWW9zL2UvL2kyZnNUSGRTOEt2V2J1ZDRLNVN4YkdCaDNLOFpRNzRTVVZ0?=
 =?utf-8?B?MUNOUU5qbTZ5aUlkVjN3bXJHZW5wVEwwZXI1THZUQUVxTGF4dzNHNzgrTDJI?=
 =?utf-8?B?WjcyT3RlZVo3c2JhbEkzdSs0QyttcHAzQkRFZlZsVmZBR2grUEg0STgybHRX?=
 =?utf-8?B?NUxuOStILzJoakxBcGUyQWh2ejFOdlpQcklrSVNVenIxcGhCK0lGeUtjRGww?=
 =?utf-8?B?ZW5FN1NFNXBpT2dsSW5mRTBsZUJ2U2RKQ3A1b0tzUnppeGdOSlJYeEV3UnNE?=
 =?utf-8?Q?AMl0xpn3kf8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5852.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5992
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fb67daac-84fe-48c3-32ff-08dd8ca83604
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|1800799024|82310400026|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VU9DUExNSmhKV1NibDJpYUR5TDlTTmp5UHNGaFhKUFh6cmprUmVGMHZnSTU3?=
 =?utf-8?B?alFYOUVJSC9iSUI4MzRMMTFmOWlTMmJqVmVmMDhsRktDZjJVbmV3TU82eDlw?=
 =?utf-8?B?bGZFYk1Qd0FYLzlhMDExS292TWRrbllXZVBHeUp0ZmVTMG1yVG5BbHQzS1Zv?=
 =?utf-8?B?VGdPTnJ2U1FaM0xQOHE2TEMrZHR5L3hjT01FL1Uxb1R1V3FabkJrMEExZEgz?=
 =?utf-8?B?ZU9sdDNkand3cXNLNEFBVURTb3lFOEZjWVdUMkpxL1lzcm5VSFJEVU0xNVo5?=
 =?utf-8?B?OURLNjcxSXNVYmZlbUdVbUJNTDZySFE1QTN0R0o0elh1Z04xbi83SjYrNTRm?=
 =?utf-8?B?ZWRjYisraVN4cmIyWHhhSjNJR1RiSWJORWZ1M0VmZi9hMnk3bm5BNjB5WG05?=
 =?utf-8?B?eDZFdG5mdDVybWNSZFZoQ2V5cUhCdDlWV0dPQWpGNWpWRWtVMkdIVDZxR3hP?=
 =?utf-8?B?OGVRNWVCMlEyT0FjdHVtWFRvcFJXUVl5TmVkNG1Ld0pYaDZIWUs2cDE5ZG9s?=
 =?utf-8?B?RzAzSDRHS1RqYXQxVlY2QUV3RUtzNUJ0OWxvWmlPZXg4VmplOVo0RWJIeitG?=
 =?utf-8?B?dGdkemd5b3Vrem5PVUJINTJaNFBFcTZkbUVCRVY1KzhCOGNVcTg0Wlc0czB6?=
 =?utf-8?B?aWNtMXl6VVYrWGtBSWlCZ09STEdydVFGVWZhVDlLaEdLdEhxemVDYlI1TjJO?=
 =?utf-8?B?OWZwZC8zTmlUby9YUW0rc25nS1VPMGZLQ2RiU3o3K2Q0KzBuRWpRbzR5aHNa?=
 =?utf-8?B?U2I5Z0c4cWtINGxRRjZDMmtycFVmd2YwTWNvL05KVnFFNlpWeVVmNTZ3c1dq?=
 =?utf-8?B?b1BEYmp6VTVYSnh6TEpIR0JxcXgvOXYxMlRydjNubTNpczNJZk9RRXBsOHlN?=
 =?utf-8?B?RDhDN2hjQW9DZTRpOVRhRHlsVnZ4NDg2SXFGSWN6akpsejM2cFVRZDZ1ekpi?=
 =?utf-8?B?K1l5LzJTb1pmajliNlRwT0c5d3BNV1BQSlpvNGUydTcxcnNNY2t4V2Z1NWlT?=
 =?utf-8?B?T0xDaWtXMlhzVGRkbjZ3WGhsWlNvZFhJZ280VEF1M1pjY0ZQekpYcUhyVEhD?=
 =?utf-8?B?RDExaTlVV1FudDYzeWphY1BiZHB4WWx2QWRDWWYxT3FRQUFwcVVzZjZjeStY?=
 =?utf-8?B?c2s5Nzh2UHovMGY1SmNPN0lLN0NHYUVuY1FGUG9lNElUWkpYK2g2SFNOTUVv?=
 =?utf-8?B?WmczdnczRkFGS042dlZSbGp6ejFjME0rQkJxRWFlMFkvVUJOclBXRVozUGE2?=
 =?utf-8?B?UGxrcDZWOTZjcFNYRmVIbHJIOE9lamlyS3JvZzJMUkVxOWcwaWNMYVFDVUs3?=
 =?utf-8?B?TVoxY1NiMVNLWnVmdnZUaHhYbjZQZU5WVytzY2xtU2NuSTBKS2toVnBneEhK?=
 =?utf-8?B?UlVxdHFRd2pqNzE0MVJkM1JHdk91Z1ptRmhnTEdVd2YzdEFJd2VWL3dwTU1n?=
 =?utf-8?B?MzhTZXRveFB3Qm9Ka1lrQ3F6WjZhMjRCUUxvSll1MXljNUhCSktXeTg4SW40?=
 =?utf-8?B?QmNKcXdDOHd1Y2ZXTFJiOVhTUTJPTm0rV2VXb1hUT2x6QnVHS3JHQmVGVC92?=
 =?utf-8?B?cWkzQ2dYNGFraks0NGpIWjBCdzZ0TVpmNkw4dlVzZG9XMWtDcGZaWGlwZUFM?=
 =?utf-8?B?OFpSRjBJQ1dZYXI5alEyejRidWVPQ1dsbWxUUng4SnBxOVg4aEhoeXZkdTll?=
 =?utf-8?B?bGNPTVgrb0I0OHJmUlN3Q2dQSWh3cUUxaDhBRnhEcjRPRWMrU1J2R01Kd0ov?=
 =?utf-8?B?Smsxd0x5L3RLVnd2NEtMdFJtd1gxNEF2eE1SN2FzZStFWmp6SzlCaXhpTjc0?=
 =?utf-8?B?Y0RFVUNFWCtRVXh1a0FpNXV2aGtvQlpqT0VsZEtnbW1MQmM0c2RrQnhaS0gv?=
 =?utf-8?B?U1Jzak9xZHlYcW94cEZHRW1hR0Z2dHRiYUFzZUsvRlZjOGFJM05GdSs4UFlv?=
 =?utf-8?B?TjFwbnhONVB6dm0rQmJyVnAxMzA5YkwrR29xRlMwWjI2QzBqUnNRV3dVTTJT?=
 =?utf-8?B?dUE2Wmx0RWsvQllQOVZrK2o5ZGsyT3Y3MVJteTBlcjNNNmJQY0wvTmpCYTBw?=
 =?utf-8?B?a3FEcFZRT3ZiM0ZPc1o4cWhmZTlyRDZwWWJhUT09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(82310400026)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 14:14:18.3461
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5628abf-f36e-4b8b-7725-08dd8ca84a3e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7932

Ping?

On 4/9/25 16:13, Luis Machado wrote:
> This patch is primarily a proposal aimed at improving the observability of the
> scheduler, especially in the context of energy-aware scheduling, without
> introducing long-term maintenance burdens such as a stable userspace ABI. I’m
> seeking feedback from the community on whether this approach seems viable, or
> if there are suggestions for making it more robust or maintainable.
> 
> Today, validating that a set of scheduler changes behaves sanely and doesn’t
> regress performance or energy metrics can be time-consuming. On the
> energy-aware side in particular, this often requires significant manual
> intervention to collect, post-process, and analyze data.
> 
> Another challenge is the limited availability of platforms that can run a
> mainline kernel while still exposing the detailed data we need. While we do
> have some options, most devices running upstream kernels don’t provide as
> much — or as precise — information as we’d like. The most data-rich devices
> tend to be phones or Android-based systems, which typically run slightly
> older or patched kernels, adding yet another layer of complexity.
> 
> As a result, going from reviewing a patch series on LKML to having a concrete
> good/bad/neutral result often involves several intermediate steps and tooling
> hurdles.
> 
> Our current data collection relies heavily on existing kernel tracepoints and
> trace events. However, adding new trace events is increasingly discouraged,
> since these are often treated as part of a de facto userspace ABI — something
> we want to avoid maintaining long-term. So extending the trace events set isn’t
> a viable option.
> 
> To work around this, we use a kernel module (LISA) that defines its own trace
> events based on existing scheduler tracepoints. This approach gives us
> flexibility in creating events without modifying the kernel’s core trace
> infrastructure or establishing any new userspace ABI.
> 
> For the past few years, tracepoint definitions for the scheduler have been
> exposed in include/trace/events/sched.h. These definitions are not always
> made available via tracefs, and are documented as being for testing and
> debugging purposes — which aligns well with our use case.
> 
> However, this approach has limitations. One issue is the visibility of
> tracepoint argument types. If a tracepoint uses a public type defined in a
> public header, we can dereference members directly to extract data. But if
> the type is internal or opaque — such as struct rq — we can’t access its
> contents, which prevents us from retrieving useful values like the CPU number.
> 
> One workaround is to duplicate the kernel’s internal struct definitions in
> the module, but this is not good: it’s error-prone due to alignment issues and
> requires constant tracking of kernel changes to avoid mismatches.
> 
> A better approach, which we currently use, is to rely on BTF (BPF Type
> Format) to reconstruct type information. BTF allows us to access internal
> kernel types without having to maintain duplicate struct definitions. As long
> as BTF info is available, we can introspect data structures even if they’re
> not publicly defined.
> 
> Using this, our module can define trace events and dereference internal types
> to extract data — but it’s not without friction:
> 
> Struct members are often nested deeply within BTF type trees, which can make
> it awkward to navigate and extract data.
> 
> BTF describes data types, but not semantics. For example, sched_avg.util_est
> appears to be a numeric value, but in reality it encodes a flag alongside the
> actual utilization value. The kernel uses the following helper to extract the
> actual data:
> 
> static inline unsigned long _task_util_est(struct task_struct *p)
> {
>     return READ_ONCE(p->se.avg.util_est) & ~UTIL_AVG_UNCHANGED;
> }
> 
> There is no way to infer from BTF alone that this masking is needed. And even
> when such helpers exist in the kernel, they’re often inlined or unavailable
> to modules, so we’d have to reimplement them — again reintroducing
> maintenance overhead.
> 
> To address these challenges and reduce duplication, we propose adding an
> extra argument to certain scheduler tracepoints: a pointer to a struct of
> function pointers (callbacks). These callbacks would act as "getters" that
> the module could use to fetch internal data in a safe, forward-compatible
> way.
> 
> For example, to extract the CPU capacity from a struct rq (which is opaque to
> the module), the module could call a getter function via the callback struct.
> These functions would reside inside the kernel, and could leverage internal
> knowledge, including inlined helpers and static data.
> 
> Here's an example of the proposed callback structure:
> 
> struct sched_tp_callbacks {
>     /* Fetches the util_est from a cfs_rq. */
>     unsigned int (*cfs_rq_util_est)(struct cfs_rq *cfs_rq);
> 
>     /* Fetches the util_est from a sched_entity. */
>     unsigned int (*se_util_est)(struct sched_entity *se);
> 
>     /* Fetches the current CPU capacity from an rq. */
>     unsigned long (*rq_cpu_current_capacity)(struct rq *rq);
> };
> 
> The idea is simple: given a base type (e.g. rq, cfs_rq, sched_entity), the
> module calls a getter function that returns the data it needs. These getters
> encapsulate internal kernel logic and remove the need for the module to
> replicate or guess how to access scheduler internals.
> 
> Since these additions would be part of tracepoints used for
> testing/debugging, they are not considered stable ABI and can evolve as the
> kernel changes. It would be up to the module to adapt to changes in available
> hooks, types, or fields — something we already do today using BTF for
> disappearing types (e.g. struct util_est becoming a raw integer).
> 
> While this approach would require some extra code in the kernel to define the
> callback struct and register the functions, we believe it would significantly
> improve testability and maintainability of tooling like LISA. It could even
> be extended to support non-energy-aware scheduler debugging scenarios as
> well.
> 
> Our current testing pipeline already makes heavy use of LISA [1], which
> automates test execution and data analysis. It also integrates with rt-app
> [2] to generate configurable workloads.
> 
> The attached proof-of-concept patch adds three such callback functions as a
> demonstration. We’ve tested this against a modified version of our module
> that uses the callbacks to fetch scheduler internals.
> 
> We’d appreciate any feedback on whether this general direction makes sense
> and how it might be refined.
> 
> [1] https://tooling.sites.arm.com/lisa/latest/
> [2] https://github.com/scheduler-tools/rt-app
> 
> Signed-off-by: Luis Machado <luis.machado@arm.com>
> 
> ---
> 
> v2:
> 
> - Fix build failures related to unavailable cfs_rq avg field and lack
>   of arch-specific capacity and frequency variables.
> 
> ---
>  include/trace/events/sched.h | 27 +++++++++++++++++----------
>  kernel/sched/core.c          | 30 ++++++++++++++++++++++++++++++
>  kernel/sched/fair.c          | 16 ++++++++--------
>  kernel/sched/pelt.c          |  6 +++---
>  kernel/sched/sched.h         | 13 +++++++++++++
>  5 files changed, 71 insertions(+), 21 deletions(-)
> 
> diff --git a/include/trace/events/sched.h b/include/trace/events/sched.h
> index 3bec9fb73a3..ac45fb9b1f5 100644
> --- a/include/trace/events/sched.h
> +++ b/include/trace/events/sched.h
> @@ -793,6 +793,13 @@ TRACE_EVENT(sched_wake_idle_without_ipi,
>  	TP_printk("cpu=%d", __entry->cpu)
>  );
>  
> +/* This struct is declared here so the tracepoints below can pass
> + * these types as parameter.
> + * This is only used for testing and debugging, so tracepoint probes can
> + * use the callbacks to fetch the data they need.
> + */
> +struct sched_tp_callbacks;
> +
>  /*
>   * Following tracepoints are not exported in tracefs and provide hooking
>   * mechanisms only for testing and debugging purposes.
> @@ -800,8 +807,8 @@ TRACE_EVENT(sched_wake_idle_without_ipi,
>   * Postfixed with _tp to make them easily identifiable in the code.
>   */
>  DECLARE_TRACE(pelt_cfs_tp,
> -	TP_PROTO(struct cfs_rq *cfs_rq),
> -	TP_ARGS(cfs_rq));
> +	TP_PROTO(struct cfs_rq *cfs_rq, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(cfs_rq, sched_tp_callbacks));
>  
>  DECLARE_TRACE(pelt_rt_tp,
>  	TP_PROTO(struct rq *rq),
> @@ -820,24 +827,24 @@ DECLARE_TRACE(pelt_irq_tp,
>  	TP_ARGS(rq));
>  
>  DECLARE_TRACE(pelt_se_tp,
> -	TP_PROTO(struct sched_entity *se),
> -	TP_ARGS(se));
> +	TP_PROTO(struct sched_entity *se, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(se, sched_tp_callbacks));
>  
>  DECLARE_TRACE(sched_cpu_capacity_tp,
> -	TP_PROTO(struct rq *rq),
> -	TP_ARGS(rq));
> +	TP_PROTO(struct rq *rq, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(rq, sched_tp_callbacks));
>  
>  DECLARE_TRACE(sched_overutilized_tp,
>  	TP_PROTO(struct root_domain *rd, bool overutilized),
>  	TP_ARGS(rd, overutilized));
>  
>  DECLARE_TRACE(sched_util_est_cfs_tp,
> -	TP_PROTO(struct cfs_rq *cfs_rq),
> -	TP_ARGS(cfs_rq));
> +	TP_PROTO(struct cfs_rq *cfs_rq, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(cfs_rq, sched_tp_callbacks));
>  
>  DECLARE_TRACE(sched_util_est_se_tp,
> -	TP_PROTO(struct sched_entity *se),
> -	TP_ARGS(se));
> +	TP_PROTO(struct sched_entity *se, struct sched_tp_callbacks *sched_tp_callbacks),
> +	TP_ARGS(se, sched_tp_callbacks));
>  
>  DECLARE_TRACE(sched_update_nr_running_tp,
>  	TP_PROTO(struct rq *rq, int change),
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 79692f85643..d4b4646f984 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -99,6 +99,28 @@
>  EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpu);
>  EXPORT_TRACEPOINT_SYMBOL_GPL(ipi_send_cpumask);
>  
> +#ifdef CONFIG_SMP
> +static unsigned int cfs_rq_util_est(struct cfs_rq *cfs_rq)
> +{
> +	return cfs_rq ? cfs_rq->avg.util_est: 0;
> +}
> +
> +static unsigned int se_util_est(struct sched_entity *se)
> +{
> +	return se ? se->avg.util_est & ~UTIL_AVG_UNCHANGED : 0;
> +}
> +#endif /* CONFIG_SMP */
> +
> +static unsigned long rq_cpu_current_capacity(struct rq *rq)
> +{
> +	if (rq == NULL)
> +		return 0;
> +
> +        unsigned long capacity_orig = arch_scale_cpu_capacity(cpu_of(rq));
> +	unsigned long scale_freq = arch_scale_freq_capacity(cpu_of(rq));
> +	return cap_scale(capacity_orig, scale_freq);
> +}
> +
>  /*
>   * Export tracepoints that act as a bare tracehook (ie: have no trace event
>   * associated with them) to allow external modules to probe them.
> @@ -8526,11 +8548,19 @@ LIST_HEAD(task_groups);
>  static struct kmem_cache *task_group_cache __ro_after_init;
>  #endif
>  
> +struct sched_tp_callbacks sched_tp_callbacks;
> +
>  void __init sched_init(void)
>  {
>  	unsigned long ptr = 0;
>  	int i;
>  
> +#ifdef CONFIG_SMP
> +	sched_tp_callbacks.cfs_rq_util_est = cfs_rq_util_est;
> +	sched_tp_callbacks.se_util_est = se_util_est;
> +#endif /* CONFIG_SMP */
> +	sched_tp_callbacks.rq_cpu_current_capacity = rq_cpu_current_capacity;
> +
>  	/* Make sure the linker didn't screw up */
>  #ifdef CONFIG_SMP
>  	BUG_ON(!sched_class_above(&stop_sched_class, &dl_sched_class));
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 0c19459c804..e0ccc763ef9 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4433,8 +4433,8 @@ static inline int propagate_entity_load_avg(struct sched_entity *se)
>  	update_tg_cfs_runnable(cfs_rq, se, gcfs_rq);
>  	update_tg_cfs_load(cfs_rq, se, gcfs_rq);
>  
> -	trace_pelt_cfs_tp(cfs_rq);
> -	trace_pelt_se_tp(se);
> +	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
> +	trace_pelt_se_tp(se, &sched_tp_callbacks);
>  
>  	return 1;
>  }
> @@ -4698,7 +4698,7 @@ static void attach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
>  
>  	cfs_rq_util_change(cfs_rq, 0);
>  
> -	trace_pelt_cfs_tp(cfs_rq);
> +	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  }
>  
>  /**
> @@ -4728,7 +4728,7 @@ static void detach_entity_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *s
>  
>  	cfs_rq_util_change(cfs_rq, 0);
>  
> -	trace_pelt_cfs_tp(cfs_rq);
> +	trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  }
>  
>  /*
> @@ -4865,7 +4865,7 @@ static inline void util_est_enqueue(struct cfs_rq *cfs_rq,
>  	enqueued += _task_util_est(p);
>  	WRITE_ONCE(cfs_rq->avg.util_est, enqueued);
>  
> -	trace_sched_util_est_cfs_tp(cfs_rq);
> +	trace_sched_util_est_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  }
>  
>  static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
> @@ -4881,7 +4881,7 @@ static inline void util_est_dequeue(struct cfs_rq *cfs_rq,
>  	enqueued -= min_t(unsigned int, enqueued, _task_util_est(p));
>  	WRITE_ONCE(cfs_rq->avg.util_est, enqueued);
>  
> -	trace_sched_util_est_cfs_tp(cfs_rq);
> +	trace_sched_util_est_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  }
>  
>  #define UTIL_EST_MARGIN (SCHED_CAPACITY_SCALE / 100)
> @@ -4963,7 +4963,7 @@ static inline void util_est_update(struct cfs_rq *cfs_rq,
>  	ewma |= UTIL_AVG_UNCHANGED;
>  	WRITE_ONCE(p->se.avg.util_est, ewma);
>  
> -	trace_sched_util_est_se_tp(&p->se);
> +	trace_sched_util_est_se_tp(&p->se, &sched_tp_callbacks);
>  }
>  
>  static inline unsigned long get_actual_cpu_capacity(int cpu)
> @@ -10002,7 +10002,7 @@ static void update_cpu_capacity(struct sched_domain *sd, int cpu)
>  		capacity = 1;
>  
>  	cpu_rq(cpu)->cpu_capacity = capacity;
> -	trace_sched_cpu_capacity_tp(cpu_rq(cpu));
> +	trace_sched_cpu_capacity_tp(cpu_rq(cpu), &sched_tp_callbacks);
>  
>  	sdg->sgc->capacity = capacity;
>  	sdg->sgc->min_capacity = capacity;
> diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
> index 7a8534a2def..7ca37abf46b 100644
> --- a/kernel/sched/pelt.c
> +++ b/kernel/sched/pelt.c
> @@ -296,7 +296,7 @@ int __update_load_avg_blocked_se(u64 now, struct sched_entity *se)
>  {
>  	if (___update_load_sum(now, &se->avg, 0, 0, 0)) {
>  		___update_load_avg(&se->avg, se_weight(se));
> -		trace_pelt_se_tp(se);
> +		trace_pelt_se_tp(se, &sched_tp_callbacks);
>  		return 1;
>  	}
>  
> @@ -310,7 +310,7 @@ int __update_load_avg_se(u64 now, struct cfs_rq *cfs_rq, struct sched_entity *se
>  
>  		___update_load_avg(&se->avg, se_weight(se));
>  		cfs_se_util_change(&se->avg);
> -		trace_pelt_se_tp(se);
> +		trace_pelt_se_tp(se, &sched_tp_callbacks);
>  		return 1;
>  	}
>  
> @@ -325,7 +325,7 @@ int __update_load_avg_cfs_rq(u64 now, struct cfs_rq *cfs_rq)
>  				cfs_rq->curr != NULL)) {
>  
>  		___update_load_avg(&cfs_rq->avg, 1);
> -		trace_pelt_cfs_tp(cfs_rq);
> +		trace_pelt_cfs_tp(cfs_rq, &sched_tp_callbacks);
>  		return 1;
>  	}
>  
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index c5a6a503eb6..2519da0c920 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -182,6 +182,19 @@ extern struct list_head asym_cap_list;
>   */
>  #define RUNTIME_INF		((u64)~0ULL)
>  
> +struct sched_tp_callbacks {
> +#ifdef CONFIG_SMP
> +	/* Fetches the util_est from a cfs_rq. */
> +	unsigned int (*cfs_rq_util_est)(struct cfs_rq *cfs_rq);
> +	/* Fetches the util_est from a sched_entity. */
> +	unsigned int (*se_util_est)(struct sched_entity *se);
> +#endif /* CONFIG_SMP */
> +	/* Fetches the current cpu capacity out of a rq. */
> +	unsigned long (*rq_cpu_current_capacity)(struct rq *rq);
> +};
> +
> +extern struct sched_tp_callbacks sched_tp_callbacks;
> +
>  static inline int idle_policy(int policy)
>  {
>  	return policy == SCHED_IDLE;

