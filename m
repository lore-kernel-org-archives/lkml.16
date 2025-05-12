Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A9443151
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050635; cv=fail; b=q2lZr+PIC6NI53WTyoNTB3Gd+7X0Nhc1iHSx1vmWpVL/NGTC7m/FIlNXxIbA/feEGZGdrF0BFlC0VVreuLOi7MJsIF/ea+vvqetxuiHTJsrxuqN1Rw9h/qI7/eVSEFziWi7t6RtLGI2Esh+/5LIJqX2y3tWZpzMeI7Y7XhEcoSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050635; c=relaxed/simple;
	bh=WKHKH9Eqjn+0+M3e1l9yaoyRhioj/5wmB/jC1rzSruo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EQ3B/N3UZnXLd71e8v7Dk48902DbL5ckaAg5+AUZFq+lnJEcMm5jjTnIlrzmswFiELEEHUtKAZe9CU+2kcAvMKoECydAwTivnZUtvuVGiGTTRdsDxgzUHFUFQLsKUyjUAU8TNM7EYB3OWYMshT55PS4XzPQTlVC+m6IEUsZIP/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Eiws2gcH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yoVxHpqC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Eiws2gcH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yoVxHpqC"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C7ftMK028392;
	Mon, 12 May 2025 11:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=l0FaPSc62vkDdoPrH/
	z6CHToVDKLpZ0beEJ1We7t+pM=; b=Eiws2gcHTHm92rfFehFjJ1xGV5ZLZBLvkg
	oPWM6oShcc5Lt2YsL5fm6bl9r7Jk7/zL88XFxZ35pJm9zndlcAM93uTkg4iwecBk
	YMywRorz+M6G+nxLm9sdIeaE/d95SOZD2uAAi+GiEHs77xKVe/AGm/RB5p/jRSNZ
	iPXJxJ6xqlIg+HL0rrirtgb6RvtEAxRjlGFRNkhNCgwVVyJmM+cqlvKcKt+3pWwt
	IBJ3S7mfNyCAvXtO4kAKIyEJMZ356n9s2qDliKPdCTHXOt3tN7pcuKiAF8b4kaB+
	vtCDv5pBoV0rgm6D4HtXMQem4y7y4DtUMZb+cZeuCCPo3EEyHhYA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0epj95w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 11:49:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54CALm2w002469;
	Mon, 12 May 2025 11:49:58 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46jwx2x41q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 11:49:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4dbJplcg3LzWt3SZ/bSUtWE2+6fKYvissvLaLwZE+2r12cGBwt/CAlDUeDvFCmdsXnIhobniyXwRV6/+ONV5N/yt9Ku7ryI75CxIMrQYFhDk6H9QVfgxKU9oTu0szxW70nWBo0BtHVEohUweJpFWFyybT4WV2D7f9yT5Ifm+/m5eD6wiSvNOsFFHlEwQetqJ3fWBjwiz/IO4846MQsAIhorU7KlWgC2Z0rUlMU3vKiadAk9UTsUSzGyVqceBOeqFGru+pFcQL19ycwzD+JaBRZYyEDga7Wufe4xR+Mi8LvxACDKJlUyk55/BB7PmnNGP+Mm4RoWKhcMRqkatvuFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0FaPSc62vkDdoPrH/z6CHToVDKLpZ0beEJ1We7t+pM=;
 b=d+dG3TRIjh/TY6dqjyoQ/4z8K94XRwr6uONcAK9KxjoCykRe3qabIiLDcKrykh2bLTAJ76Om2Q/YmqBr3lcFl/7QsQgJJ884+kHsWWiDp/dPShynjuHaE9Bl+suj06bXsZGkGFHfaUwmRdyWIUlmQleVuC4Y11VECHYxHWG7YxQ2gQs8ditCw7IVSaECSNDmf2xIDqSGIc51VSsbJPqhsCJvp3HTiGgngppU/VNFknf1aHgjnvM5OhZuTOA5fHl1MsWt8afKrxLAehe9rttkw1l4GlvOYsaK+rHXgsjx2zGrCKAGrvp8B5c20enANrh6n4E7zmURAZKNt1G/Cj4isg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0FaPSc62vkDdoPrH/z6CHToVDKLpZ0beEJ1We7t+pM=;
 b=yoVxHpqCa7o3f20EkVBoRbxLRK8fb6e2KKOzkKjK6cbFHays2rwkavwz90TXhFn+kKWLj0+4ADb8QQb0tBIGHe35/z6kAx6MdV91WZGra1DDDuQl9bnewM1eA41ubKgUybfWInSSdgAgoZkHGCNGuwxeshV4lPIQ5i1v+Qs2ogA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO1PR10MB4689.namprd10.prod.outlook.com (2603:10b6:303:98::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 12 May
 2025 11:49:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Mon, 12 May 2025
 11:49:55 +0000
Date: Mon, 12 May 2025 12:49:52 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@redhat.com>,
        Michal Hocko <mhocko@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [RFC PATCH] MAINTAINERS: add mm reclaim section
Message-ID: <1e9fb6b2-234f-4163-8f81-839539d78aa4@lucifer.local>
References: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
 <6135bd8b-7198-4186-b020-358cdd1fb9a0@bytedance.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6135bd8b-7198-4186-b020-358cdd1fb9a0@bytedance.com>
X-ClientProxiedBy: LO4P123CA0482.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO1PR10MB4689:EE_
X-MS-Office365-Filtering-Correlation-Id: bc9a106c-33e3-417d-c545-08dd914b1cf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?26jvZgnFzeJr3tqAlYp/vHqVlD2JzKaluFRarMghRGpr9nkTmvdtEvv6/SJe?=
 =?us-ascii?Q?Us0pMvEA4q4CFylN82T4Nxnh/sRYTeQdgpvXGAbqYZu5yJyMLF0ozsV8fUIL?=
 =?us-ascii?Q?v93p3hnGZD1FbWdX+E1R2Vt9sq6cz68MzJoX8CkdpJ7Ko/HRXiMJOBniphSw?=
 =?us-ascii?Q?SPW0y7+keLXYpfC/ipAZ6mcwEkUDxKj6co++j7KZaN9I7vqqJK5478glZ/Bn?=
 =?us-ascii?Q?gHbmG8Ggq+8945OOg/SXMOGW51uoHb5E90p4ae4njmorAM1kr7eNCDlWotDT?=
 =?us-ascii?Q?NEvHonwf0GSOEKAHkgShWek7GdUuzTBse56qvYAjRJKVXi86z8jD4FRH5oLk?=
 =?us-ascii?Q?uV+A1dEofC/vinbpSMH7uByMziHOx66M2wdUUYj1L8H/x8eeGkP7iAX4cpMN?=
 =?us-ascii?Q?ygOvYZ9t+783+//Sp23x5gb3kOh2fb9HJAClvN3zJInzd4Wklwcx3zPJGj94?=
 =?us-ascii?Q?bVjEF20quD+xWEXDSQivPiZu7hYwHb9iglhzUwkUDWd+JC5kfQN7Jpv0jhPi?=
 =?us-ascii?Q?eAPSRv+w1+Yi4OIFNFElrJzwQnU/zdEODuMvPJjt+tH2vYJcuitKr1FDHEgT?=
 =?us-ascii?Q?zyxbQYrKHng8XZGzaO2vLkxFaMcehS41ub3H6W9HZ321CFlMFpf+jXgYBpa6?=
 =?us-ascii?Q?Vv79A/zVNsVjIrXFFdSq3lzdK6iJ7nhqK6iQprGu0CCF7rzzqibMDVvYiOfg?=
 =?us-ascii?Q?LsjJ7CnaXpIHeAGazGPRY3ueAC2P9R2EZ+X9+Io9BGEyqGw1aBiuYsBDfa7p?=
 =?us-ascii?Q?PhYD1SBq2fwKIjaipnA1BA7D1pYY5NWZzrZorNyoSj56uQWnv9iMA3GgIQmi?=
 =?us-ascii?Q?dMcDTWUcA10Cnp3uD05eh0S8LMwxQY18pNcecBYrA9R2MiBzHbcOm3WzLovl?=
 =?us-ascii?Q?Oo71canGIFGFfIabMxyPEjmXmeXAj6cll7FaRjGbsD4KXpcwVUDOiRvA8mXq?=
 =?us-ascii?Q?YgNqPF8kGtVHY6jwkE+JJ7t8hs36im2VvMLpWgMbREim6rFR+jhijCKcDrMj?=
 =?us-ascii?Q?5XSRnbF7gq1ecXv4Mx+I1mpBhmcFDljZ6gUxDGr9Nrx40TmaGKv+MndCvBHz?=
 =?us-ascii?Q?JmgavjOFEtWO6saXlhD960BkB0RqXaf1MTdzk4VdbWz2LTGEz6G2IciVGR6r?=
 =?us-ascii?Q?mUcjZHrr2MrzLIuuu214XsLD9aIwNK3UmoBg2YCRo/HioyyzcMNcQ1KwM0Yp?=
 =?us-ascii?Q?lIlQb6wfs0qf9sCLDb/4i8x4DpY+WVPJ0glKV2IAyCqJ1kUwztI1tpqBmn/G?=
 =?us-ascii?Q?QbJMyhHql6nxrVJHpv9mjmn79HNXzLotD/ade8OywafPxiebardIslXa0jSw?=
 =?us-ascii?Q?XTRexP7pkECaw/cliiJIphxjsnXUn6hAeRMtHPOxR1dua+kZtjSoQ7A3iuvl?=
 =?us-ascii?Q?itVVXn6C0lpau71cSUNJJuRqlHzbKd6tA6UgaKAV1VlqyuhhA1toabW5RHEP?=
 =?us-ascii?Q?BybWwboNjqg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JE5AMNn1428rTTukgPu7/E4tYj5261rolfW9V2pOZXJfEurRWowcMXVCywH1?=
 =?us-ascii?Q?iBtnKlR9xNW3bTH6JIAT8yuTnJoOazkBmSFzxTJk7jaS2qoEyCXSuJr/cTKi?=
 =?us-ascii?Q?9j04luR+49pEpgdVqRT3Rj4iEombXufwUjeciyMt4/Gl6pMB2u5MIDQ4fNhd?=
 =?us-ascii?Q?LyBhnXduLKPj3okRn/rIPrHlNnlCxx16SKzZrE72+cvQxFNOxvvf9lTP+6MD?=
 =?us-ascii?Q?3MdtiHOnuia5JsBLmMLKk3hVSIc7dQMFF+2R5omKLKh2A31eX4PCm7wJh5d2?=
 =?us-ascii?Q?RHhuspC/VFoTXLiiWwDLnM8dn1+tjhI9vgcjOW6dyCT2GQLP6P9TmRB3d3v1?=
 =?us-ascii?Q?ISwhSyCToOyhT36UxmObNx+LxhTvDGjAGzxaj/ckzLwLUBGSPGDWjqsRgAo6?=
 =?us-ascii?Q?9L0VGtEHsPoprpFUdDk2Zi0WjvMxrEfAkcOefKmmlBXdF9lx3/WGShuREYNs?=
 =?us-ascii?Q?gLU83KTlEnX6re16aMEbrl9OFj0e8y1106tPFHcRUBI8CmPaFhTsKSbHQ9s0?=
 =?us-ascii?Q?lp71jW2JZoQ7X3wMsAYASInd8r6tVOyMQi4UNqTBoPgnYWAGb8Qb39qrsETT?=
 =?us-ascii?Q?pcCTb/HoWsYo3c/JOmMSY2fXqMJzXhMgYR2Br5raGNZjEOEBbDWkHxAB4QPT?=
 =?us-ascii?Q?+qS7/aCUQo81Lee6oAtQ+/OV7lIu8oGWb/on1bYMwFgyChCwW4Hmi/oRNWZ2?=
 =?us-ascii?Q?FGnfkNikVaAgxuzTsuhwTE9ealuHbJxszdJhHJEqlVaB7a7iNHMq2brAf3BH?=
 =?us-ascii?Q?V+ofBUV6oAjhA/WjUM24nfj7leMT/H7aTYOQtp5FOA8SwEh1aMzK5PzTuYq5?=
 =?us-ascii?Q?hhcJO8/DbSOsa0KUQbSqX1KfRnfIeIaDdxF/+Do3WmpxM8DACZv6HGxN7XzJ?=
 =?us-ascii?Q?75Je5m1JxGacIvG46KBrhf2njdvVj4uzP1KFWCzbyv1Q7ikidlURJsQktgz7?=
 =?us-ascii?Q?Fu4pmOmCRHFsA7K94XRPAFXVrPKJ3nBByI+Wv18HJ+piPGn/EhZRAaWfVe0U?=
 =?us-ascii?Q?w3MnCi20bnH/gst6kyXTJ3nYBT4VL00HGNAr5JXC6/NhnW4e0E255aIdVnxS?=
 =?us-ascii?Q?610wDMTKTMlbxtu1L5ptL4z5XhYtQ3BTKzhzLKyEDzO4x1+kU+iE+N8+0ezT?=
 =?us-ascii?Q?u7uNOaPpP/+GfSA9kOiV9u4obpBEcizopbzKoQkgbpZu9G+jc5CtEOG4xqZX?=
 =?us-ascii?Q?jcB3TzXoFPDzym7v9iNsHixLKZ8SAMT3gf8S3uzJVL9vOBv3sqXb271uyYm8?=
 =?us-ascii?Q?SRhNj0uvGfzQ1Bvg6A6ofbsbRHzkYbjAC11e+WUZ3uwicNM7k+KRz4Aa0mMA?=
 =?us-ascii?Q?HI4/GiscxLk6rj6MA+bL5BO1U9f+MsidgamKKRU0pPtk3sjyKQLpIOrCY0CB?=
 =?us-ascii?Q?2Y+4SgCfuow4RTwYSajlOiakGVxJiorWXhAEEHBn2g6krYHffXUqWZBAI0J/?=
 =?us-ascii?Q?hmcdIoKimF3TB2ie8GaAMwKn4kNBdNVpr/TtsyehL0gS5aAjd5Osw6mImE3Y?=
 =?us-ascii?Q?Bv60Lj7fTAoQmS24baRWbB6QYSmE19BpQMp7DerXcHOdN6LrO/v2KzLoEucc?=
 =?us-ascii?Q?bvz65e33zQfEN3/4JOLyIcK5Rco1S1d8wfglQ5oavaHzNVyEd/lxn+za1vrK?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+kMVJO1G4OR7v1QcuMWeqYTtjq31NWyOKAfh/uDZgvPCYCoLrtFbFVOYk8MKjLlIRabAfmOHLgQFQpONNDyw8ZXUxLYQFzevxiDfGotZ+NDOtnJhuLFukhQuUC68c6vNyXhiOz1xZlht1xHJngryERZRV0LcK2mTYL16qLlQl/y/nyTFuSB39xCyw6vvPhAnyTJZkvwtuQxkdGsAO34nx7T7lEuAhit3aUwkyLax+TVIJEO1AjJKf2gUwWs3Bs5M5aY7VQZzcoJxBnTji2rDyPlp4BfHHBbNj+JvMJcwfsuAbrpIvipULI0Q0CP29ma8Q/lNLR74Z+X9wWRHqklSeSb6Il7hlV9HwQJWD6GfbnKKMnsJfkzskzRqAtPF6bTiY6H/3PpB9Jpl6tkJ68TGvG/rvcvdsxPfJD8RPynq7x1o2z7gRQ+zZAjbmRZ3Vi5G8pohBYBHxpeJN5Et24qiGzgRCVASJURpanw4t1ZRzcWx5pDcz0YrQ9nvCnq927SB/3Nt/djoDwQg3N9ozhn12ljI34ooXLpbRAXQyVbjQCVx42HVq0ripBVCe2fUnmBfHgYjCb5q2nZ8HnWoW2GdftFBv4n3j4w1+Btsqw8iW7I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc9a106c-33e3-417d-c545-08dd914b1cf6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 11:49:55.1777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdkU4hL1ZQzA2HzV0w4gfNyJVc1PEQ2ed1722WAkoQT680CPyQuUUv4qM1NUeyc0M4vcecqJvzL/93RBY3UrVjXtKS/gGFaQcC+/jNVXjY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4689
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505120124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEyNCBTYWx0ZWRfX1dYd8LfnlOVf 0Es/akgxtaTlMEmbr/c5+gYH6/a6iAoGdzb8g45llRmZtfU0YkZ5vD9LgYkdp5w2hM7N/ikoojG PSCbC0IqUOTPgJmbC/Rp4UgPYlu+S+vh32ugh15FmCClHJkgQ1nTxSzg7Haj8mmEOrY38PcV3Vg
 wCYUinuErAkQZLKhO/Zm1uNx2baWJ+v/LVb2CU9sWjhKSjz7/snwpbFbA+wqewWnR3wCsAh74AC rNkGDHcESK9U9fUK/9TbIuNwEEtPxki6iWn3SOA1yOVprX5B077qzC46Br0IhOSpvHDN9mJzSxu qnPAOzaE0CWo8w9Z8iy2iw64Up5xXA62s+LPYxXGmceClBOXvtbj+oXmMsQFvd82ZijuL7xK1jN
 fASAwp5Y9xgUEHGCf0Az+elhMrg7Bda/QIw90o1v7t+HyKdaVTs8Bsd93zYqX8dY9aJl2UoE
X-Authority-Analysis: v=2.4 cv=DO6P4zNb c=1 sm=1 tr=0 ts=6821e066 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Z4Rwk6OoAAAA:8 a=ufHFDILaAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=968KyxNXAAAA:8 a=37rDS-QxAAAA:8 a=Dwyl8npW-pOSRM1N7XAA:9 a=CjuIK1q_8ugA:10
 a=HkZW87K1Qel5hWWM3VKY:22 a=ZmIg1sZ3JBWsdXgziEIF:22 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-ORIG-GUID: 3TprYb3IpPwVFIYdzSZVWVW1s_4NjMan
X-Proofpoint-GUID: 3TprYb3IpPwVFIYdzSZVWVW1s_4NjMan

On Fri, May 09, 2025 at 10:58:11AM +0800, Qi Zheng wrote:
> Hi Lorenzo,
>
> On 5/9/25 1:37 AM, Lorenzo Stoakes wrote:
> > In furtherance of ongoing efforts to ensure people are aware of who
> > de-facto maintains/has an interest in specific parts of mm, as well trying
> > to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> > files - establish a reclaim memory management section and add relevant
> > maintainers/reviewers.
> >
> > This is a key part of memory management so sensibly deserves its own
> > section.
> >
> > This encompasses both 'classical' reclaim and MGLRU and thus reflects this
> > in the reviewers from both, as well as those who have contributed
> > specifically on the memcg side of things.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> > REVIEWERS NOTE: If anybody feels they ought not to be here, or if I missed
> > anyone, let me know!
> >
> >   MAINTAINERS | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ccc45b0ba843..a755b9dbf6cf 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15577,6 +15577,20 @@ F:	mm/page_alloc.c
> >   F:	include/linux/gfp.h
> >   F:	include/linux/compaction.h
> >
> > +MEMORY MANAGEMENT - RECLAIM
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +R:	Johannes Weiner <hannes@cmpxchg.org>
> > +R:	David Hildenbrand <david@redhat.com>
> > +R:	Michal Hocko <mhocko@kernel.org>
> > +R:	Yu Zhao <yuzhao@google.com>
> > +R:	Qi Zheng <zhengqi.arch@bytedance.com>
> > +R:	Shakeel Butt <shakeel.butt@linux.dev>
> > +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > +L:	linux-mm@kvack.org
> > +S:	Maintained
> > +F:	mm/pt_reclaim.c
>
> Do we have plan to add mm PGTABLE section (at least should
> contain mm/pgtable-generic.c, include/linux/pgtable.h, etc)?
>
> I'm not sure which section, RECLAIM or PGTABLE, is more
> appropriate for mm/pt_reclaim.c to be included in, but either of
> them is fine for me.

Sorry I thought I had already replied to this! :P

I think for now better to keep it in reclaim as we have a bunch of page
table code distributed over the place, which we probably need to address
separately!

>
> Acked-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks! :)

>
> Thanks!
>
> > +F:	mm/vmscan.c
> > +
> >   MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
> >   M:	Andrew Morton <akpm@linux-foundation.org>
> >   M:	David Hildenbrand <david@redhat.com>
> > --
> > 2.49.0
>

Cheers, Lorenzo
