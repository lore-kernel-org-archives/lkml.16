Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B4A367
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.24
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831559; cv=fail; b=raFcyH6sBaOeIxMQMXGWfI/A0f8YScUhXcWWf+lieZX/l57lKkI68tC6lZ9oLkzJYPyI1ergiAvYPRG1bbyPvfGdpsTzgi767XhM+fsAxQCVfbbDSy7PAdNDPtEY+3qORG5pY1P7meBxXBzeKSyc9btVWFplpnYZSHaUmFhWge0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831559; c=relaxed/simple;
	bh=6xiY21B/n/9WpzmzMmIeDzeN2Y3hkg8U1yAUjT7sb1A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h53GApMpon+bL69xGKB47nzJm77VRl9HgJiponndUJAkFWXXi1b8+uRAX/1M0eAliAhYrqOeBXBMBcKFPCAqpvCWKJOk6XJmdMer8LXoKseFtLNFz8uVcp9uYWXLa6hD9EJkEaUDhLfJQeTdkRQ+DuySDb0s5XU8p+oO74nCqs4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ofeM6nMs; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ofeM6nMs; arc=fail smtp.client-ip=52.101.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ofeM6nMs";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ofeM6nMs"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vFaLeamZSWv5fMD+Rewj2JprzXfzVujlaOyf5nw0fqYdxM8opV1Hmvt8SR/Gc3DktzqwqoXkA0Tlj5IqzS3a7lWIcq4C2WRpe9Ka3nSjS7tgbzflLY8VK+5oEvwDgIDMNNhF2AlsyrUg6cIlCZOPiLIeEKnCvgFXS/VUvbpd0dSH/uMJjdoLjR/DJDu054ecH6vTjjCOjmkYvxb8RD2NqI1BcEZgQS36QA6e3UTzsfG7QlJr9jAaIg2MGh9H2sXIvBI8GEy9QBjVV0gMNZxpHNREtA3c20x9FkO+RRC1dhBXirISRXQRk62YmNEp6qLin7ZCMWSFZjqgD2O2TzNdog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPBMbC0oSRdI56ie9FeogRMMsTws8hQLyYP7wDeeQ8o=;
 b=UlV/4y0SOgQijlCTkbydIPdD5xcYl9wpoFBD04qvOk+Oa8PV3qFnQWx/IVGgaO4EpcTB1P4SM/uw26g70f9QKGtMSIyLmq39Rq1JkRemXt2/00zb0P87A4C4Zs5FLi3Xhi9VED0N21ETJ0Ntc6LlejGIxsnWTceuzSWbX8+cl0HDa5HZkFTfRgkbKCB2qYhAeeMUgy5hpzalDMNcqK1Lt29b0YqD8h42ed0au3j1+QbRksWd66hbaAAy5D8Q+GyKdIrxTsixaODEia1RLmyEUPzu2nSc8UZR2CeB1KfL70I+UeC2eyLwyBhVPTWkagvYbrjfFl7K1cH//HWzJnHudg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=google.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPBMbC0oSRdI56ie9FeogRMMsTws8hQLyYP7wDeeQ8o=;
 b=ofeM6nMsj0VYmmqnjC2zNjmv12g6pggEOSRgodZThAS32cQcmaya4wuk1bijCvWyJBcehFXTpleTMKzodiggbFiiidUd+6dFxfodDes+HElwbzI1Dc2g8V7czSfayxFpvtCcA6HnzExgxyl+ccZprKkq02/tSB+HxkhWWeoS1Fs=
Received: from DU6P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::24)
 by PAXPR08MB6640.eurprd08.prod.outlook.com (2603:10a6:102:dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 06:05:52 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::b0) by DU6P191CA0013.outlook.office365.com
 (2603:10a6:10:540::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Wed,
 25 Jun 2025 06:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Wed, 25 Jun 2025 06:05:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A112Jg6iFhQleGhjd4fUlHOFcZ0r8fbuL1Bao74+cqJ1XFdSkkA6+llGxmlbtX5wUjaQ+Vb6wXcKaOToq6R2M8EWVZYnTidCXEgax2EIBg0UJwa1pDtiy5LWtEdbPMlM0Er2RPYE9ZEFs8OddFZ/e94vkDxfzkaX2Wp0UlSPFw4AKu/+FaZ73fnz/QsyL0Qb04vU1Q3SjhybJp94HnJlV/EK71r0H1dS5YinC0lWWjgHrQKg1AQLLkViv/kgCRyD6zDjR4jYfMB0h29wyKPfBBz6BsLBUtFSXnCOSOuLqn0105Wvt00avtbWEs5M+xn9w5KVdarJeftU/IrYnm6WBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPBMbC0oSRdI56ie9FeogRMMsTws8hQLyYP7wDeeQ8o=;
 b=vZPZM/DEPPRJsxzRwZj6gkn0vtubUVc6ugX4YqrkAevTF2pKxCqlxT5e73MzgeoBhL0E/NOUfDuv6gBV/lt96/PXLmG5iPJ4e+CFi7O3Zq0ian2KS0yCioxIDmUOZ5jzIRKw/UDM2ntpegReMqWeSYM4UTEkWuBT0tBiSd8Ke5DvRQeMeW3XzYYi9XZgnoRAlEbWJt6mUMoxgB1mfBxuKD45aqZys7gi3FHNYTiHMYXQfl5ZcxYDTEUG2HK3br0VO2bmMZTYMz/+cU8s8CyD2h4xVbi2Nw1H1g4bRFhiqDEjhk8UkvBXX9QkHbZF9EJ6G08mDLIYMdOpeXFoA25XXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPBMbC0oSRdI56ie9FeogRMMsTws8hQLyYP7wDeeQ8o=;
 b=ofeM6nMsj0VYmmqnjC2zNjmv12g6pggEOSRgodZThAS32cQcmaya4wuk1bijCvWyJBcehFXTpleTMKzodiggbFiiidUd+6dFxfodDes+HElwbzI1Dc2g8V7czSfayxFpvtCcA6HnzExgxyl+ccZprKkq02/tSB+HxkhWWeoS1Fs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GV2PR08MB9158.eurprd08.prod.outlook.com (2603:10a6:150:d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 06:05:14 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 06:05:14 +0000
Message-ID: <8981f5a6-670d-4d01-8eca-d18fd285add8@arm.com>
Date: Wed, 25 Jun 2025 11:35:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
To: Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, zokeefe@google.com,
 shy828301@gmail.com, usamaarif642@gmail.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::34) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GV2PR08MB9158:EE_|DB5PEPF00014B93:EE_|PAXPR08MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: 539e7a3b-f2c2-4a2f-5823-08ddb3ae5625
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WjIyWlJGd0RWTUt5YW02OHJSaFN3d2diWFBoWmpHYjEyamZackR2UlRGanlH?=
 =?utf-8?B?bXQ3YWpHakU2cHRQNGdpVTdMTEdleEJhS2RPcTBiQWVaTDRROExmL3NxdkVU?=
 =?utf-8?B?aW84YjdNQ1JNZE5CSWtKcWtIRk45alErbXVoOU81b3pxUmNHc1NMdVlLVDQv?=
 =?utf-8?B?OFpINlY3dU8xU0hBWGgyWm1qcWhlZWUvNk9GZ1dYSS9KL2xzRk9JTGg3cmFr?=
 =?utf-8?B?Y3JBcnVxR3A0aGJhd0F3bnFLNVREK2dPSFRYd1hTb3BlclNQcnExTXNzeVVG?=
 =?utf-8?B?cHZnNGVKTEZ0bWd1U1ZTOGZuN09kVi9tSXJCNXMxZHRqU3dsREhMK3NIeEFH?=
 =?utf-8?B?dWpIRDBCL3FQbXNCSm1XUjFxZU0zeUNZUFh4ZkVPOWhBLyt3YkpNdktNcVhF?=
 =?utf-8?B?WDArWi9Pa01qVTFXTFFoaytOT2VXNW9JN0dxajFFNGZmTkViQ0xObUZFMG0w?=
 =?utf-8?B?bnhxTmpESVJkWUVCNDhWaklXbXlVNUhGSmNsZlZoVDVGdnlXUnhPRUNUL1hW?=
 =?utf-8?B?UktWMWJhWHBxQ051YkFpVmVZSitzZTYwNmpEODJYWHRvNXNXR2N3ZTh2TmVt?=
 =?utf-8?B?NUI2MUV0SDAyblYrVXQ4WUphTnIwVmJIbXM3Y3lyc0hTV1VZNnNPYlFKRjZx?=
 =?utf-8?B?Wk9wL2JxMENieUY4RDRIc2FZd0RNN1MvdENIZTl3VEZwK0YxUVdPNFpQWFhU?=
 =?utf-8?B?SUdpVGpLeW93Ly93Nm1YWFNYZDltNGNLVTBPeEJHN3JWZEs3UHE5b1RBZlFo?=
 =?utf-8?B?Y0pJbjBkZElpL1VGUnZLajhBZUh6TkU0OEsrTldtcTArTkdEcWJTeVNwWVN1?=
 =?utf-8?B?eVJjcUdINEl1QnJaOGl3S21oMjIwNWFDVzlOcE5QdWhObU84TWdYR044aWJ6?=
 =?utf-8?B?UVplQ255Uk1HQkFzYUJKQWdubVZFTEo5YnR0cGFPZzc2K1BZV21PY1NUazRW?=
 =?utf-8?B?Z1BCSjBURmtUOCs5NHlEdytHWGVpSWxTb2FOSUtzM3NMelRWNUJGOEhMWmlv?=
 =?utf-8?B?NThzeWxUOUJ3eVZ6NnFJN21kRkUxN1J0alRtRzZ3T2Q0WmpkN2ZKaXJ2N3kw?=
 =?utf-8?B?MFZTSGI5V3VGT3dwNENWL2RMM1c0NHFnU3FHSU1QdlB5MHZZcTJZcW03SDNS?=
 =?utf-8?B?azlUVVB4a3JwcUJJd3dFeVNPZmdhL05oOTFsSkhBcG9pZXhXYXMxL2RmempO?=
 =?utf-8?B?dGo4TnJWdUpnTWtPQUlBT1NUR0JPbER6bFJFRXRzeWRyZkZKT0ppY0lnWlQ5?=
 =?utf-8?B?RS9HTWRscEhvZytibVBqUzB2QXZycklCdDFDc0FQSDgwWmY5Y0x4ZkpVUnFY?=
 =?utf-8?B?Q0R3OGRWMjJVVVp1VWJ3UHpPRHlNNWRtZ0FXZGlsNWtvMEpIaHV6cWQzLzE0?=
 =?utf-8?B?TGZiYzRTSnRoY3h2Qm9xS1hLdW0wVlRsVG05VVlmSm1NYVB2KzNTUTRTRlBN?=
 =?utf-8?B?SS9WODc1bmF3ZGh0aGl2TmQrajJVRU5VckU2Y2RPbmtkcFZsWTE4MkJtbzda?=
 =?utf-8?B?ZFlXZ3BMQ0NiaDFZNU1peHIxbnNqeEpUNXpSamw3N1l6TkNYOGdrNTlSWDk1?=
 =?utf-8?B?M2pBN0xjN0tXUDFYRURUenJXQjE5aHNJNlprYVRYWDdEK2tVRVJLWmh6V3Uy?=
 =?utf-8?B?RkVGLzd6NW95cW9pVExIR0RBWjU2ODBrdnhXeUc1S00wQzVIYjhvcThyRHRR?=
 =?utf-8?B?ZVl3eWNsMFNsd2JyNnBtTlRoWUlGSUFJTnlOcEFObnBJUUdQNFVSU2d1a3Ja?=
 =?utf-8?B?Uk9lUUp1SnBjOFBUMER3c1ZMYXBMVjJtazVRZG4zMnJWS1hobUhrVDVGbDBW?=
 =?utf-8?B?U3NkTm84YndTc05lck55cmlHdmZsNnUyUnFvNlR4MC9ON0dmcldrSCszVnNX?=
 =?utf-8?B?cnRYM3FmK1BrM1ZuR0dNZm9IdkFiYlpOdkkzNmpOQTlyNmVSVkhRMnZVM2Z0?=
 =?utf-8?Q?qBwQ3XGjff4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9158
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f5f28cd-280e-437e-2988-08ddb3ae4026
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|35042699022|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWkrS0NrN2dCcjlDYmpxc3Zic0taWDV6N05TT3JPY0ZQVnlQQUVXRGJ5WFJS?=
 =?utf-8?B?czZOVnFvUTN6dG5jNUw4d0tpcUtVQVYxUmRQazB4YVVmMFZvMFF6Yjhtb2ZU?=
 =?utf-8?B?b0ZLMXZ1b3BoK29VY3AyNDdWS0VuSWZGUnlZQytuMjJJQmV4cGgrRnhqVlFj?=
 =?utf-8?B?QXR4Z09CK0M5SkR0L1FLL0paRUd5bDRDT3BINUlaTVFhV3ZyV2c4djhPdDFZ?=
 =?utf-8?B?UVNlOTNBU3lyM09GbUIxRnk0ZjR5YnJ0NVlFRHJtWUVYZWlZSmZmdzVNNU5s?=
 =?utf-8?B?R29hY0x6V3dRN1IwMm9hMnQ4MFc0R1dIQTBubzFDYnB6bUtGSUtSU0tabkxa?=
 =?utf-8?B?V01TbEZUTGJsSmRCUjQ2VTdRR0ZabHp0MVhNbVNBdjJGWUoxYUxYWnJBcXpu?=
 =?utf-8?B?alV5TzExRDYzSXo5clc2dk5BeHRTTEJKYWprZ1RwV01tVXlyY0Z3SkpRMy80?=
 =?utf-8?B?eWtZQjllb0xBVnByMXFTWnFpUTFMaFd0T2JXdU9qdzlWb1I3TlBoT3VFSzkv?=
 =?utf-8?B?M29SRTdEN3RjRzg4cE1ka1lPelUxbEhYY0xqcDlnMklGc3RFQzhEQXZ4TDhk?=
 =?utf-8?B?Q3lCS3VVWVRjMzlnU2ltaTNhTlYxY3YxNnI0dmpITDFMS1ZnK2tQTU1uYTRM?=
 =?utf-8?B?RFdHNG9sUHFhYVBRRUFHREw0K3ZMNTljVW1GVXFEdWZMWW9tQk1tM2ZnNldv?=
 =?utf-8?B?Y0pZSlZDTFAwNDZ0Y04rZ3V2dFhTSmdSY3I2RnFvQzRLbTV1RFdQanZ4NFRr?=
 =?utf-8?B?anRhM2FTOFZOckNiQTIxRUpwQ0g2VnkrdXpQRWZoTkFjSVJoS0ZoVE1BVzdy?=
 =?utf-8?B?cGhMSms4QnV2M2gwOUQ1STlQdmxuNkZLeHlJY0V6dDFIaHdyckZrRCtUV1hG?=
 =?utf-8?B?ZTNzK2hGdmtNTkJpRlVTNzFNUnllNGVjOE9WbnBERjlxa2lCZ2xjUU5IQ0JC?=
 =?utf-8?B?T1BKVEwxcWlQaG9kR29TWFBGY1pHek00OWFWNDQ3ODY0N0RtQUhia0tMUk9B?=
 =?utf-8?B?VjlwNE5FcHlCYVdwS2NKK0VVQ2RiZGhDTjNQQWtCRyt2U0tRREFidjBjdE1Y?=
 =?utf-8?B?eVIzOU95cHBHZVg0WUdYcHhCTDREdGpZVUFtZWVtNy90R3hIMnBiTjYzaE4r?=
 =?utf-8?B?M25UQTNma0VxZ1pOeGVoY2gxZ3JRd3JGaFYwNU1hYUJ5dERFNWFxYTNLQ003?=
 =?utf-8?B?NjF1dnIrSVBIWHZYU29XRUpoVnc4YUNneFJ3R3U5b0pFcm5HQy8zVUwzaGJx?=
 =?utf-8?B?S08vSEdXeUNBcEZIdFVrUTMwaXRPaXQ3aWFudE4vKytOM3oxUG1LYUE2b0N3?=
 =?utf-8?B?emFiSmd1SFl1MDNlQktaSnJWcDVldXdQVTM3NTNGcHZtQjdzNGpVdmlkYWFY?=
 =?utf-8?B?elJpWjVFWGNhUlV2VWkzLzRhd01HUm8yaVY1T2NSYTd3RE9MQSt3OG1Mb2cv?=
 =?utf-8?B?MVBzWkNKdk9iWUlLL2lKM2lZeUxUeiswdFkwVHFYUlNVVGlhZTYyaHZFV3ox?=
 =?utf-8?B?YTlBTEZucVNUWHN6MC9CL0FKQTYzdHBlNWZFNXphblVGSVlpcnNiNWN5UlFw?=
 =?utf-8?B?NGNpdCt4WUYraEZHYThHRXkyMDlxSFdmaExEZm5vUG5SRlFJS0pGb2l6Witt?=
 =?utf-8?B?QVUyMjVvK1pPOTdDeE1CNE1XbmZHWWQ3RDZPODAzdHlvaGtHSk11bnFyeGNR?=
 =?utf-8?B?RHJlSWVaTjRzK3dkSGtpbDRsRVNic3V4M3RsL1hsRXpMT1Z0b2JCb2FaMjNF?=
 =?utf-8?B?dHE0aENFcWxKWUMrOTUzMWI5UFNySFRKSXRyWVlQM2lKT2lzZVpWOG9TWVJ3?=
 =?utf-8?B?OU02QkhIbjB1NHNENnl6N1FyV2N1NzNZaUNWSnk0N0hNTG9OMUtVQlFtSTBn?=
 =?utf-8?B?R25NNVZ2SStpb3Y5N3dZZjhLdEZOcmNMMlNFOEpxNiswbzF1dWw5aDdscmRo?=
 =?utf-8?B?SXlsaGNxcnU1OHdMb0drVHoyc2ZrMlppTFR6Y1VwNUxjNURqdzh5Q3YxeWRK?=
 =?utf-8?B?R2NSL255Y1FQL1ROTXBKQjFmTDlnbW9uQ1VIOTgzNWk3YXZiRExWMm9rb3Vt?=
 =?utf-8?B?TFZkSnlKcSszTm5VaDl2cEZXNnBVNEtKVXo3UT09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(35042699022)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:05:50.6370
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 539e7a3b-f2c2-4a2f-5823-08ddb3ae5625
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6640


On 25/06/25 11:23 am, Hugh Dickins wrote:
> On Wed, 25 Jun 2025, Baolin Wang wrote:
>
>> When invoking thp_vma_allowable_orders(), if the TVA_ENFORCE_SYSFS flag is not
>> specified, we will ignore the THP sysfs settings. Whilst it makes sense for the
>> callers who do not specify this flag, it creates a odd and surprising situation
>> where a sysadmin specifying 'never' for all THP sizes still observing THP pages
>> being allocated and used on the system. And the MADV_COLLAPSE is an example of
>> such a case, that means it will not set TVA_ENFORCE_SYSFS when calling
>> thp_vma_allowable_orders().
>>
>> As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
>> the system-wide anon/shmem THP sysfs settings, which means that even though
>> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
>> attempt to collapse into a anon/shmem THP. This violates the rule we have
>> agreed upon: never means never.
>>
>> For example, system administrators who disabled THP everywhere must indeed very
>> much not want THP to be used for whatever reason - having individual programs
>> being able to quietly override this is very surprising and likely to cause headaches
>> for those who desire this not to happen on their systems.
>>
>> This patch set will address the MADV_COLLAPSE issue.
>>
>> Test
>> ====
>> 1. Tested the mm selftests and found no regressions.
>> 2. With toggling different Anon mTHP settings, the allocation and madvise collapse for
>> anonymous pages work well.
>> 3. With toggling different shmem mTHP settings, the allocation and madvise collapse for
>> shmem work well.
>> 4. Tested the large order allocation for tmpfs, and works as expected.
>>
>> [1] https://lore.kernel.org/all/1f00fdc3-a3a3-464b-8565-4c1b23d34f8d@linux.alibaba.com/
>>
>> Changes from v3:
>>   - Collect reviewed tags. Thanks.
>>   - Update the commit message, per David.
>>
>> Changes from v2:
>>   - Update the commit message and cover letter, per Lorenzo. Thanks.
>>   - Simplify the logic in thp_vma_allowable_orders(), per Lorenzo and David. Thanks.
>>
>> Changes from v1:
>>   - Update the commit message, per Zi.
>>   - Add Zi's reviewed tag. Thanks.
>>   - Update the shmem logic.
>>
>> Baolin Wang (2):
>>    mm: huge_memory: disallow hugepages if the system-wide THP sysfs
>>      settings are disabled
>>    mm: shmem: disallow hugepages if the system-wide shmem THP sysfs
>>      settings are disabled
>>
>>   include/linux/huge_mm.h                 | 51 ++++++++++++++++++-------
>>   mm/shmem.c                              |  6 +--
>>   tools/testing/selftests/mm/khugepaged.c |  8 +---
>>   3 files changed, 43 insertions(+), 22 deletions(-)
>>
>> -- 
>> 2.43.5
> Sorry for chiming in so late, after so much effort: but I beg you,
> please drop these.
>
> I did not want to get into a fight, and had been hoping a voice of
> reason would come from others, before I got around to responding.
>
> And indeed Ryan understood correctly at the start; and he, Usama
> and Barry, perhaps others I've missed, have raised appropriate
> concerns but not prevailed.
>
> If we're sloganeering, I much prefer "never break userspace" to
> "never means never", attractive though that over-simplification is.

FWIW I had the same thought of "never break userspace" when I first
saw the patch but then this point did not shine out in the discussion
so I became nervous to mention it again :)

>
> Seldom has a feature been so thorougly documented as MADV_COLLAPSE,
> in its 6.1 commits and in the "man 2 madvise" page: which are
> explicit about MADV_COLLAPSE providing a way to get THPs where the
> sysfs setting governing automatic behaviour does not insert them.
>
> We would all prefer a less messy world of THP tunables.  I certainly
> find plenty to dislike there too; and wish that a less assertive name
> than "never" had been chosen originally for the default off position.
>
> But please don't break the accepted and documented behaviour of
> MADV_COLLAPSE now.
>
> If you want to exclude all possibility of THPs, then please use the
> prctl(PR_SET_THP_DISABLE); or shmem_enabled=deny (I think it was me
> who insisted that be respected by MADV_COLLAPSE back then).
>
> Add a "deny" option to /sys/kernel/mm/transparent_hugepage/enabled
> if you like.  (But in these days of filesystem large folios, adding
> new protections against them seems a few years late.)
>
> If Andrew decides that these patches should go in, then I'll have to
> scrutinize them more carefully than I've done so far: but currently
> I'm hoping to avoid that.
>
> Hugh
