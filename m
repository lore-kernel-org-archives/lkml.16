Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FCF1E7C23
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 19:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746043178; cv=fail; b=rLv2keFLhunAwH6e7koEPualBfba270uD4IdsBlXGxpwfSHiWB0wrnwe6tPmGLzzehwfYSZnieAR4lcGheBH00avniIEJ9MWkDZCGIgKYuOPPml0A6aZidSF5BaUMmq9lGtSUQZTkqifguwwmW2GG2Qn2ZiJTChUNmgygk/D0LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746043178; c=relaxed/simple;
	bh=70gGnTNzgjqNSJNMGMhw/kC0BZskIohGehbvYlxpnNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LWph2U5/AyGYhgtDLzH557QlV2d41aIx1JPSqNMxYLJ1q8bRqxfi871D8QPdW25r3Nbwp2SCz8HtKxDf2pzLkN6jy4UDJmjsspsK1LriPhlqcTvO1QnsJ1VwL/wtIvY75+Qg1qx0kI82m2FLFfzAXTtkTdSghfBRqrx4+iRwbgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mXfs3bIq; arc=fail smtp.client-ip=40.107.92.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mXfs3bIq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKxzzG/h0OtMSZ8sO0lz6WsT4h60pu8zDYeuJigwUpAGtdzsQwRPaE+yGccOnz5UTRAUGU6W92k0CaZi1UdU8xgzLXzgn3zJq0A4fm3I36Wjh/g37BcDRjsBodN/mq6IoYAFbZN1cSKOq3Xd0J653QLVMzfmiCycUsxR45/KSImhI3QZMPL7OlgIUyG1LXa+HHP0MpSJmzku9iPTnBo1tM4Nb0jeJ0oyhBT9ffc58WpNJntzzxW5+wIL95mVut/JawchAitsbyLhv7kig31pe8ULHa58YaGQIDmRdaAMP/6VqIgFeGT6N1o16ZEc3CsA5+V1YjdvV86cfKR6mvNmSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgHY4feLlgA1nZSdRHe/FQ4UVH1X+lmCGSH3hvCcPck=;
 b=rCKbG3/BrMK9o/yYQg75mkGgjgLxR3ehLQS6e0wXE4uv4Pg4FFTMPteDYRNolXgT61drddcWBupj6NUpzfiHwLJ0b2OAq60FK6kdVa4RuSygRQDAXYW/2xD/DUnjOKEYXEqz2m9vV1zUhoBT5iSRdCifV/SRnRO0iFek/axjjwopIhbVOCTMIlh+ichXKqsORSDLKPbhxSnUlXSFCSE8jKHTNAlT1SXJ6Vg3DP1GSRzPEgVn8Cjr885oXPn+bTIQtnNaLAg1eJExh26IbCcK8rZT0Z8NCgtylJ5338W1gWkikgnYebVDyd0iOFjoOlH92F56mKQxysPnz1H9ug2Gkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgHY4feLlgA1nZSdRHe/FQ4UVH1X+lmCGSH3hvCcPck=;
 b=mXfs3bIqOEnQmywLfE1QQNL7sEBdBHH1gEMP6fZ7M3gi+UOmSVSGnhb25GCjV+Z0kHCGtduYf/BxlPCiYcFqcq1a6wmj3RL2eZt5FV9Pk9tNn+G9Au8H/lGKspguWHUTQrP0+By9Wi9MRr6slVce1VUxcg+ZNSPyk5MeI457eXWzHIog/pqav78K5DTkaH4d485iXt9AfCtZgdAM/CX4PlcnLeLWezQoFAx9RiRnNTkxJuO+kqRAJ8PVG54htslV5Sra9yyF5yok/pB1g+PtLpSQwoXkIPya3weUzCe1SkgjjOUpKkustK/G3am8eKDlj/fXeQkFLyeQ/PRhIX7olw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 19:59:33 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 19:59:33 +0000
Date: Wed, 30 Apr 2025 21:59:23 +0200
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>
Cc: David Vernet <void@manifault.com>, Changwoo Min <changwoo@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH sched_ext/for-6.16] sched_ext: Add RCU protection to
 scx_root in DSQ iterator
Message-ID: <aBKBG96ufOqOHqEa@gpd3>
References: <20250430090930.355732-1-arighi@nvidia.com>
 <aBJy-hdrkauDW6X_@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBJy-hdrkauDW6X_@slm.duckdns.org>
X-ClientProxiedBy: MI1P293CA0019.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::16) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|DS0PR12MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: c46b2b82-f975-4a1e-0959-08dd882186ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IChPAkvOluMTHAyvoZzVGQdDGqUSkgKaybY9noZ7QVe+xObWXKaxnvdCAOl4?=
 =?us-ascii?Q?AHQWVJtXWwIoZ5Qdk/aYZtgUNom/IsGolcfbye8cm4MNp25T3jjgdg3NdnEv?=
 =?us-ascii?Q?Nx3IXbjkyIZGwUjsbsfN6NY1eeEf8ZechlafmKzP/bCW2S7sbcEflitpKusr?=
 =?us-ascii?Q?61uuSHoGUEeZ5D2O9iX0hVI9ltxUb3FCT5gqj3ixPOgDXjW7lUQuiTWiqMI2?=
 =?us-ascii?Q?+2tGa5biY8SczVkRehNtSNKvb9lDkAaxSXn5w3SOCnXjkzbsG78HHspXy4ZR?=
 =?us-ascii?Q?tva8QcOYmnKrq7tB2wOsR5DAwcG4sc1s3lIHFsDgfJOywGNi1Z6JN+Ehyn7A?=
 =?us-ascii?Q?odjYyatOUJF8MYQvqvhrp0jrx+8ajkKoMJLSLXVZdatpG78OLvdY8gIrGu9w?=
 =?us-ascii?Q?C8y0UfFBHiYKt1ltNh57uz9p7pWUlJjQIoGRY9//MrlakbRag+46A2wns6uA?=
 =?us-ascii?Q?AcIZGqrmnAkfEvqs3aHiVRWvT3MABYrz49N1AKE/Z4kkzEHgEjv5TBeb2BRf?=
 =?us-ascii?Q?4ZfgIhnQJmG7sOearG8Yb8mkLNcy1cIG/W5eVD2pQDkh5AJlGMvGjKr97jLr?=
 =?us-ascii?Q?6BTtOuHbaNkfYtzIFJMXVxM+CBllzvjTVnKejDn4Jb/OF2YB0vaH0d7hw3Pt?=
 =?us-ascii?Q?zXVxiq1MV4MudLF1zog2RUlayZBkTAleVpzwoBsiJH8CzJAKp94KKMS9oCzt?=
 =?us-ascii?Q?ko9jru0jry4shtPD3aHH2kI0rZ3UQGOESlWcRCy35ofcuAHHefO2ybIajPOf?=
 =?us-ascii?Q?Zg9VcE+XcnWXoSYsNadq8oWGc6tps85Yy2VhH5/Z79FpUzvV0glNvMLltb2D?=
 =?us-ascii?Q?c55OAqaDAlkWJ8qTqjOsGyodaaIudoD6xh0iMiNN7Mhc7dkrL4/z66HqEY7j?=
 =?us-ascii?Q?zM1YRatclG6M93VyqxHdXegavJOHD1gTHob6Lw025u7rEM/EULuDv4PDuRNQ?=
 =?us-ascii?Q?L9RfmjPNFrozubOEBgV8AqxQb3aeDwP1jUTnoah6KJbmY65FoC3E4/32NIpE?=
 =?us-ascii?Q?Lox5kn+HSz6kfdxZGATo0NtWxKQfdjsF/3BGq8cMaYZDg2uGMY42Jy98s+rJ?=
 =?us-ascii?Q?D17jBNBgXKstswq5sLhDeHRbu4TN1EddcP7BXPiizFekD0JX4UapCb1orki3?=
 =?us-ascii?Q?UVhh62WZdetESfgotvjoPrs7QpiHh8MPOBuKE/JvdX0qA+laD5GoR3+45N5G?=
 =?us-ascii?Q?2r0JKoBny9CE7t+C9hOYfHNoPZi0Wighd+SoAj9iwAEnljB8mYekCwjpqx1m?=
 =?us-ascii?Q?CQ7M5QEo8CIq85s3Jbiv8m96XXUvhJpdxjFjxyB65tCMwrIjDcd82GG+rWLG?=
 =?us-ascii?Q?GtgQmSReyeGi/z5uQDQz1R0bVbTk3qqTjDJ30Up7nclQso2S/9qQxsTDL9Ov?=
 =?us-ascii?Q?T1fDpi8fwFNGiQHmPjD5zTp2vxTXNaAb/f+FFoGrSgtImw30Nlhcr05cX/G7?=
 =?us-ascii?Q?uFjGn8XUc2c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wS/1/wlcgjp/q8YnaYdBXYq+zMbKTpzDbz/+Qa/TAfAP2EtyoQqBa9PkGsdR?=
 =?us-ascii?Q?22qYa+6Wc/CUD/oYg1WduD+e9NHliZodPOT7DbuMCiMc8S7jdBH9jBfkMnCu?=
 =?us-ascii?Q?M8+EdB9JCd7v1P8V7IRd9FeP8VC+aoiy0PYovkhIig6IQq8f0APwOyopc1RX?=
 =?us-ascii?Q?06gsy3U1kWsZytY0nhTQKqjfZl0avdkVDMBu7kvtbVrdOZ/8sYmAPKwFHb0X?=
 =?us-ascii?Q?gK0MMN66tSvNZt7SWD/Ndoql+ETRfXK64c50y4jfUyJtsGkko3ILl8ONd8y8?=
 =?us-ascii?Q?Swy6WBu019dAnv0/8k0nUh54+LENc2Y2H0gw9sKou3pN9qh7QJuYhkGOITXI?=
 =?us-ascii?Q?u6Ev7IMNn9MpDmcj64vmQ2ray9rhFX8QWR6lgZtfFbk6H9HKN7O3oMYn2zG5?=
 =?us-ascii?Q?Pqfm7o4ubddjmcEUZPwV8SqyTErzpmOnzmJccgK/g27zO0GQbypxfybKTmqf?=
 =?us-ascii?Q?O38viSH2RAg7TTzv7Ew/A5XgkgF0rxoPLRlcMZBeuBR6ijQmEnV7gk9+EM2+?=
 =?us-ascii?Q?FsO8EUcMXN1sTqu387e0fXth6ep5z/q1Uv+idnq7se84CUXGmcD5znjMKXT1?=
 =?us-ascii?Q?6u8kGFtztGQ3qMM7yiv75Ub4qnbAbYIelNmb/NU5GYvyPBLv0Ryvr+JaRUVV?=
 =?us-ascii?Q?MP/Xd2KHWNVe/hBHV/ocKJ0fHQOm4l7jAq9VTrwmhBIu+tgXZ0g3OcvhEqhL?=
 =?us-ascii?Q?EMk9p8kgvigHWAAVbD7TOd+9KGxjZAN0KVSdHSH20U8eCVxQPiAmepSQaQeZ?=
 =?us-ascii?Q?tspvrSAmdJAkMq7gOuhsO1J6NrzC4oVa/kqjYqAcj3Rpln29f4kUnGoKOFFT?=
 =?us-ascii?Q?uZ0KNLotxr590eOfOn0HLLZiTTjzGnzOQBMyHUznafTvimo4gzgWOZnokIIZ?=
 =?us-ascii?Q?IAxOdaR2Pj8d5hWpL14UYVsyLSqupugDifIEA+vAz9ZMp+WyaEuMkc0PkAok?=
 =?us-ascii?Q?zhzCVtJ5kzktHx6rtKhrcRoS3FHngm2uNx9rUv/YqeaaYyf6p3D9Sx/Y/TIQ?=
 =?us-ascii?Q?fjhpa9wTs+/5AWmvLZg5tDWPVdjbwXS156nb2sDaYZaWe/OeCcgIuNmAYU+w?=
 =?us-ascii?Q?Z7MMHib60iFefVICGWU7hG19CQIgaKhd8xiMx2ldeJeN01WlbEeAtWDeRhDw?=
 =?us-ascii?Q?8HhPn2FL8fFtCEsKRSk9t0+cZJQEzXkF4pa0SZMqtaM5ft1/LoPBep8V+/h+?=
 =?us-ascii?Q?xRcMyr6jc9R7XuKvPJA0jBvlGpImDOVBXHnz3w1FXRrJn0VfeFTxYnw9Zx8X?=
 =?us-ascii?Q?OpdJZlnyB1YeE99jIjr2z6eLD/veMBlwWZSodI1swO7Mg2XwDWuG4VBoaJL8?=
 =?us-ascii?Q?BWp0lgRWS9LxUiO5mwSuvq/YNX4Okx5GpwmoWFrI+MfKJPdmrqWlfC5MVPvK?=
 =?us-ascii?Q?TItIIkRo0JLiXql7jo3MXY0pIwhL7r1/NZYQEDeyyvrqUaYQakq6V4r8TY58?=
 =?us-ascii?Q?Qtm3fifD97pATP+PIEKf6FI0GdAkZEuzLtcj/XWZ5PbXpzzZi2AY3/RKlJdo?=
 =?us-ascii?Q?vvargkbhtwRYFKC/GYLPVlI6IwzRZu1zfSm10iHhDLFWbysZ7gq/eeIh8Kr6?=
 =?us-ascii?Q?qgg2KA/DZBwF5rIub/I2M/NNPhXcMTYzWoYDkHTL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c46b2b82-f975-4a1e-0959-08dd882186ae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 19:59:33.2813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dyukdUgoeS76Fh3FoeGbdSbVXpyA/mpSZbOgGp03o0CTW39z4eBLp8RX6EKRXt1pK3Kt+0S32P5H2lv/179zGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6413

On Wed, Apr 30, 2025 at 08:59:06AM -1000, Tejun Heo wrote:
> On Wed, Apr 30, 2025 at 11:09:30AM +0200, Andrea Righi wrote:
> > @@ -6907,28 +6907,39 @@ __bpf_kfunc int bpf_iter_scx_dsq_new(struct bpf_iter_scx_dsq *it, u64 dsq_id,
> >  {
> >  	struct bpf_iter_scx_dsq_kern *kit = (void *)it;
> >  	struct scx_sched *sch;
> > +	int ret = 0;
> >  
> >  	BUILD_BUG_ON(sizeof(struct bpf_iter_scx_dsq_kern) >
> >  		     sizeof(struct bpf_iter_scx_dsq));
> >  	BUILD_BUG_ON(__alignof__(struct bpf_iter_scx_dsq_kern) !=
> >  		     __alignof__(struct bpf_iter_scx_dsq));
> >  
> > +	rcu_read_lock();
> >  	sch = rcu_dereference(scx_root);
> 
> Can you instead try changing rcu_derefernece(scx_root) to
> rcu_derefernece_check(scx_root, rcu_read_lock_bh_held())? The warning is
> because this can be called both from rcu-locked and bh contexts and while
> grabbing rcu_read_lock() once works, telling rcu that the dereference can be
> in both contexts is more accurate here.

Yeah, that seems better, also considering that bpf_iter_scx_dsq_next() is
marked with KF_RCU_PROTECTED, so checking for rcu_read_lock_bh_held()
should cover all the possible cases.

Will test that and send a v2.

Thanks!
-Andrea
