Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A448A1F2BB8
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750889346; cv=fail; b=WQhBoBApEVgs326+FZLpXB2kLqRqUp3UJQFJW+rKGpSm9Cra+E/2A3aJ6fiZTvUrUchu8/dhfdCRQNAwQLGW6U4w5EBghuliJba6CqgvhccIIYspADdPbcFtWtgCpd02/SZIC+rib7o5dyo1ILRVYIUkMnB2kYPPRZ4a93zo0jE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750889346; c=relaxed/simple;
	bh=rNj4G3pAVumwsVK5R/5dnoA//wMNtesP8dlq6bmM7rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KEzlgoCfE1MlDCvbiYm7umXAIwwz23RE3eP2fhQoLkZ7TwIwle64iXpiM/HX6ecMPQVhjF/uegvCHWbRgIJyN6bQ5/ZOPdecxLVU5rBu30ULK7xXITp+SzL0D8+0PvvpWg7bcar/wy+QxJZrdncHaActGWVW/wJAbHixBVQxCG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B3vtlCu2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=snjCUNOl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B3vtlCu2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="snjCUNOl"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PLBbAx025881;
	Wed, 25 Jun 2025 22:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=XEk/ovM+4XaRumPLHw
	cCr0KyAGbTPJCdqjC1kH62wKE=; b=B3vtlCu2qTsbiEEQXuXP/lEhP93wv42siH
	hkhQmYb/ussRelIU0yrXpKuGRZNrI0UbVLymKievpF0HRSc0iYMuAvlaMvtwGL65
	2lgAxxVSYKoFES26XvvSHtfZElVcPkdLFOPpgaHW016MItPz6U+UFXa3DmcShfpc
	4OPak3EK+8ZFQQQP09OG6Zw/LwS3bOc1QlmmPhh7/zomvywVYvDDAyi2LIgy8eX8
	rOo+Lak11CddSRinovma0rYIy9O+Ypcgt0bbXGjEada1ugohHaAm0wRS6PvVIgyy
	xx14IRd3KjyFhZvXuoXxPCWz+TzGywv8XYUKHw3OkMjr3I1xvENA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y8n7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 22:07:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55PLjWvC037735;
	Wed, 25 Jun 2025 22:07:34 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2062.outbound.protection.outlook.com [40.107.101.62])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq5pey9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 22:07:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXTE349xA7f1RtFjYsR5xRixouE8VmuBkMo/MDzH3EjNl9t7MWEs9vnIzxwfPCAUqEXibPOqd9QHMK08Sd8/o2eY477AEYVzioY0V313xxyW5HP44L4ZkTFE39jFdyRWp2NMwWCGiT2I3M11p+EUWP1Et3XLidIu+xSm+403CwO8JPzWV69wwUu1tQNPMMBsUg8WqM8FfF1KIAhB5lOFm59LwBdxA8hLZPkBc//bvmVnKoaWOPTbyRRs+wFiBJhUwV470MU7CbUWHIk8MoH67cusAkPdKkfj3yGn3nKti0cHCdFmv0ApB8rrOyAJ3yfUuORczr/nrr65uzMZknusUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEk/ovM+4XaRumPLHwcCr0KyAGbTPJCdqjC1kH62wKE=;
 b=GQiXFEJKRnwV88HfGrSWWhoof0LADMjJi2WrTR/j66DE1zwOkg3LQar8LJMj8LakBZcfUlXrg9e8eOnozAdk489pwYeqVWtys06npvOqqu6eDplmagt9nvk/cvQrUnOiqKNmIf9lysMTf75EqwACcKMt3WWlORfFmYV4IUJ6FlRuxUK914sz9ICJgCwhmAevyTbij4TsVOcQuUcAJoQuF2fZ+NrAcwpHfSi1IoBJ1m0Ry5NnMI36ws/vUGelTonD1nLh6nxDgKGcJUH/YByw/VI+ubZCLVxP5cJjY5Y2Q2Qq1j0cR6lFFe8xqI/S1638PXn5cGoZ4YFLHtkCd/DWdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEk/ovM+4XaRumPLHwcCr0KyAGbTPJCdqjC1kH62wKE=;
 b=snjCUNOlROcPOXuA0tIcgtOqCM74S0tdqfIFnRb0OZoZRTdqB3ZH1kARFuLSTPPU0/5uowr6TvHssUQqj3mPbwDG1WQP3Ewfa0TXPD1wKJ/ynT3JjzWj2oD+TntjXoBBMcG362wqJElRyMpgiubfBXCMueArsyukQDucccwoVy0=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by PH0PR10MB4725.namprd10.prod.outlook.com (2603:10b6:510:3e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 22:07:31 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%6]) with mapi id 15.20.8857.025; Wed, 25 Jun 2025
 22:07:31 +0000
Date: Thu, 26 Jun 2025 07:07:12 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Raghavendra K T <raghavendra.kt@amd.com>
Cc: AneeshKumar.KizhakeVeetil@arm.com, Hasan.Maruf@amd.com,
        Michael.Day@amd.com, akpm@linux-foundation.org, bharata@amd.com,
        dave.hansen@intel.com, david@redhat.com, dongjoo.linux.dev@gmail.com,
        feng.tang@intel.com, gourry@gourry.net, hannes@cmpxchg.org,
        honggyu.kim@sk.com, hughd@google.com, jhubbard@nvidia.com,
        jon.grimm@amd.com, k.shutemov@gmail.com, kbusch@meta.com,
        kmanaouil.dev@gmail.com, leesuyeon0506@gmail.com, leillc@google.com,
        liam.howlett@oracle.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, mgorman@techsingularity.net, mingo@redhat.com,
        nadav.amit@gmail.com, nphamcs@gmail.com, peterz@infradead.org,
        riel@surriel.com, rientjes@google.com, rppt@kernel.org,
        santosh.shukla@amd.com, shivankg@amd.com, shy828301@gmail.com,
        sj@kernel.org, vbabka@suse.cz, weixugc@google.com, willy@infradead.org,
        ying.huang@linux.alibaba.com, ziy@nvidia.com,
        Jonathan.Cameron@huawei.com, dave@stgolabs.net, yuanchu@google.com,
        kinseyho@google.com, hdanton@sina.com
Subject: Re: [RFC PATCH V2 03/13] mm: Scan the mm and create a migration list
Message-ID: <aFxzEFhTDOyL4y0e@hyeyoo>
References: <20250624055617.1291159-1-raghavendra.kt@amd.com>
 <20250624055617.1291159-4-raghavendra.kt@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624055617.1291159-4-raghavendra.kt@amd.com>
X-ClientProxiedBy: SEWP216CA0099.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bb::10) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|PH0PR10MB4725:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cd87acf-bd5b-4b44-8b4c-08ddb434ae45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KArO8AsCG5UrcObX4tI/YKD+0kYde3OWJF8W5XZ7iC/DDnmFHmZ8QZyAVazT?=
 =?us-ascii?Q?xmItSdXgl1tkHJFXDdIpkiwcfbHvlxeG3ideZHFsRb5ztxtLJTnRlHpic25N?=
 =?us-ascii?Q?OAhWWQsjpUOvDJb4m1np5DauJXkHZ+63QVnUC02hjiVCo1cRWgNJ4Mv11liU?=
 =?us-ascii?Q?RTpy6qwX+us+Q6EqISO5MTQGZQl4HgdZWm2EFZM6ZfVS03h4ATWDZABDn+py?=
 =?us-ascii?Q?fCi9xLFJMMu/EJj7i+9oBPU2zZ6bUIA6jGLzBXMYe0T82xUoYAoK8gMTI9k7?=
 =?us-ascii?Q?L1+/7jsiSh5O72vUW0wckMwElDrlwc1SA+NtsQmPt4po/8+SDoCMLlMwycdR?=
 =?us-ascii?Q?+irShseWsm2eaa8XG061BOz9zOscOMc2kSXZ58Z3ssEmzhtrCd6U0CNgezYd?=
 =?us-ascii?Q?NqTNHdxGSCoH/j+37iWVD33tgfVf7fcVTa3IBI6x1MTWraNQZX4pMoIs3A5h?=
 =?us-ascii?Q?vGM92l4AR9PqNqp3UT9eotTNmCbZ3DVwQTNDPll5ZY5t8L1zxR8iM33aqtYG?=
 =?us-ascii?Q?Pm1QMu678Iw5rbKtMX0kRr1aDASPFC27vhBqXfPC4vR+Ae09jGz5k1mb45FO?=
 =?us-ascii?Q?cKhsaUKXEfHlkyIoXdETeqH0CBX3tsG87+Mh60hp4fc6VYwSlpZc6jXjrYaw?=
 =?us-ascii?Q?glwCvVIo0S9XAe2tsfzw5XZwJARywYqGfCalOaoqHwF6Mig8QNwL2FeZvixk?=
 =?us-ascii?Q?B6+n3JI88t2j/6EaIuYIJd2GjfB6Ec25LTDi/VdUm/3kVmh4ziHDYOEaBMJQ?=
 =?us-ascii?Q?Yitw3MCzF0Ei4MqQyF527yLvvLQBWlll1U/aiC0GL3GbeLOhD4zgDN5KgAse?=
 =?us-ascii?Q?aG+2fnK1fq/greg77dqdtNP5l4V5K+NFTbhtlZ7w5PMgghbM7OYMfFDS6G8P?=
 =?us-ascii?Q?Xs0tRFcrR8J9wffNPIqc8tRGvjlQl9SsSt69MCxfm/F4KWUB8jmT3aOm8hme?=
 =?us-ascii?Q?966d2QHWn/ZFM5es8lzGOBavhEn5sUw3Lf3pKougce0XBp+9vfm7aygufA4E?=
 =?us-ascii?Q?nqiyTrw/bFoRa43nhDvx6AbbPWDvqru5Y7ts9WZCe8xA4wXGm8WPwkeasIpO?=
 =?us-ascii?Q?Kgvy6ck4xZbLpNn4wdqeFcQgay/NEnBl/zLnh1p564wEirAkr3oh4VrCS3pT?=
 =?us-ascii?Q?bS9EX6ARP9dGHcv/+w0V95HTusmFJ/j2AuPqkmKXtIZxp1Ro6Ga5R9eBbBpZ?=
 =?us-ascii?Q?vgWZSWzxdrgSAiYdHdTru2jSRpKb7Av1LPUnE0INmJ6uLWQMDLn/fwOJL/et?=
 =?us-ascii?Q?UQnPX6DD+FYqqeeprA999M4qSkBOmhVAIynw4Pqw57H3kp2P3fNj1iHdZTEr?=
 =?us-ascii?Q?tdblOLUUxMO0pyTDmtbpwAPtybTUIrfD9FT0C5m8jFEJdryZYWEpC8s1BP+y?=
 =?us-ascii?Q?02edT56Q106+y8mrGLzgW0AjFIRR2LEsxNElZ5n/SBdZxgK8qJdYi10+4OsY?=
 =?us-ascii?Q?EGC17VUisDo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aK16wczEImSrfYXpwmy6k6SclZ9ce7wsXDteQ6Vucf9FD1yYzsxuKm+6BrV6?=
 =?us-ascii?Q?zH5v5hpzCQ71jY6pbnJvDv3WQaVpjmljtBhWk7vH3Zm0Xg4QejxMyHyZjO9/?=
 =?us-ascii?Q?Mq+rYuIvnYUc4EbzQjEzylb84O5T6KXFhfSUoSo1XDZyiNNHBVNmnZWkbDL/?=
 =?us-ascii?Q?xUpHiP/8RKO2Pm43++0TOOMHa94ZOAlP1I3weGH1eUeTnGW22Kh3kq6b5g3G?=
 =?us-ascii?Q?jniilW4dJXtDA5Ai0cL20UxDAFwhNKwV50Zvs9jaZwWKrXpphOZmTR00V+Mr?=
 =?us-ascii?Q?MFn6i3WytY+Yg1wstvYSFsCkO0HTl+7SwPASI3O14YbJOeH5XfRFEesGYh9A?=
 =?us-ascii?Q?KkjgnA5C+8v2B/fwNlvcNgj6gyO3pdwH7JwTzvufPksZBJH7pfcOcqOnbiQK?=
 =?us-ascii?Q?19whrEZyRltqAN2Qs0GM5kEMGzBfofjXoIjGtRAcglVf56gFlJBznc6XheRN?=
 =?us-ascii?Q?hEouBIdNBC7YL0e65+ztAnagOBFi/mqlz/8TgmqdDrnKSDRGyMHGG9Bwwqwz?=
 =?us-ascii?Q?JB4U0SMohD9nVU+HS97HgxfEdF0FAkWZGkx8zBlGdUbG3fwga9rAJGSODyAw?=
 =?us-ascii?Q?zGYKI5jRp2zcGw4LhhuxkX34sMBhalAKvUAZy31VGgMVllvX9OwdwzJN7CNg?=
 =?us-ascii?Q?oBLJUFKiGEYtnGa244xIVFgE+B5JofJUPzjpwbIvNjFVxxLpLVZacI+XcOIt?=
 =?us-ascii?Q?Yz2E1Q1Yz7kro/1CDkSzUE0KtF4wVs/SeknCIxuz1FogSp6/9L5Z9A89D3Yy?=
 =?us-ascii?Q?hhG5ZlqsPieUoEkYkc16g1l91RthhEkosndrV/OZemvC8zUNcF8hyjxh73tJ?=
 =?us-ascii?Q?xbQlZcssMlYocdKYiqFI3YDOzc2+stit7bCzEvR1452u6mwN21wFLSQVV6vc?=
 =?us-ascii?Q?o5hclWPlEuMbfrdzcPeOLgQLAv4Sps0wFwnghfSFvYcoCJMJ8bm1V9SfBaru?=
 =?us-ascii?Q?lIgv89Ot9zY+OT7Dajv25KIPDYP4AjHscpAz0Nu+C0Da9+1YrBOs7pEf/mdt?=
 =?us-ascii?Q?JDnm8pPUknZ1pO0vgov1bw40KOL9ZIsWAJfkjmAIe6wsrZgAylhi4WhVOV2z?=
 =?us-ascii?Q?JqbAvl6AueysFJ5Lexqo11EOnOg7goE8juZNy82uXcN5XtbbMuM8ZL14daBI?=
 =?us-ascii?Q?0OeaMed1bYWPvkK+KTPPeWqt2wWpXX+H/bZBeJnNqlyGuOrK5HM15KfLP7Sy?=
 =?us-ascii?Q?GDH2I12O2aTY1upizckO9NFXVgDYLsXNNYFZGMFGHQsyYytC0RxuDYycdlSB?=
 =?us-ascii?Q?G5eDhS3tDHCQMri1HK2jC6qPSrnAFy58H2gz1LnwZsVqDAYvCysEqLVP7z5k?=
 =?us-ascii?Q?u0HRzhBnSZ6AIu3OaFq69LWYSyDDsZJLbdeTANK2f15WLi42xI7xdXUGUlgK?=
 =?us-ascii?Q?N7jAAgVYNzpfN162GZuAlyyCJxOehl+JhJIeRJo/z06ZTVBbAuwDRaD8mnVP?=
 =?us-ascii?Q?gbl2pXIeRSe8EzvOa8ZRcwvhm1ICY2sNne3X962z/btNUk7DgPtG7tLSZYjz?=
 =?us-ascii?Q?dLNdzWWWj5JzwTYjQJtNHcvOnteortIB8F7epAYne/+1D9WvGl8qID429ALh?=
 =?us-ascii?Q?SL0El7eKqhjip2bH/jXLIuR10J2M1UfS28ueB9Ch?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	cWYf/jABuEZLugIy9m5qSp1udCc6XsvKnKg45n8nK3TLkZz6aYiynfxT2DH5oAEmMNnFTLLVXG479vDyPD+0NIJwsZ6OSJzEh4mgPqotjT+R8HHKbef85JAw7rEnJY1Qvbg17H55yvwx1CjDD3107Ngxwqd80Y1bPUPeJjAlgnVt5FhR3DQsCAJRzaqEUV/b79UFshDQyFBjfQAuwqYupPBSnfEWa5vcYa63wawNT7XgVP/YOjcmx8KB9UzKklfpSz8qgSANddF5s8YX/kf7tcVokHM2Lc3nH71ESboV+MI9qglLIy5VcUjyQKanghrk7f+fSBNcqgoQPiCnhTx5PosY4/GDQ4uH9R32xWcW85vsaW+qsXtrxhwjlIN8YztY2tljOoWyXT9YD3xvCI/+kuM2oR2260uAF1p2xCQ5SF1jG6sX43sZCU9eBoGYUXwsSuRbGVerkSufrh9ErVodXEQNZQzBApjmZMDOiz7OvNkxh6npPz9Yuwxwb84rBi1/pvtItzZNW4E4TeUYLwTlp/LgXWozXRRExcaDKwuY13GpH55UGbOqeA0CH3a5WjLo0eI3IjmR3ozOnLGr282hgob2Y2QhNAQ8NPTXKbdEu3w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd87acf-bd5b-4b44-8b4c-08ddb434ae45
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 22:07:31.3348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QAActg52l7XbnYVzoZLrIcf29kDfiF+IyCiN7BvSo0VxSrqfrGKcSPPEw/1cFIiyt516bXnMTZpNZT6nTvG1/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4725
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_07,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250171
X-Proofpoint-ORIG-GUID: OHy5YRC8vc-MM_GHegOxxHs-Zh8rjw9A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE3MiBTYWx0ZWRfXwW2YtMGkVsUa EBb0kruwfc1Z/3vy+fCtWJLt+U1EEhgWdtOd8Imr+dq3VRC5VugYzMeEG+FuZ06VLaky+I+dGrZ J9ftpt2beCtqY+A/CTIVGtnd3nNdEAV93CmkDh5/nPEJAd2fj58zIzYvkt/n9qTVLQbIm7kVuc0
 oAC0qm3ebbyiofJVMaLO8alLSZdrBD7NYhRbLRLpS16mKzuDR8QHOk224Y4TRRUa98DBBXnJTvn rqrwwcmVGPcpfZaMXGE+EEdaSV5B1BUANIKLrAov83sxv2vMCAgYoav4iBpAIrXql11FXl3CIee FYYUJ8wYCB43lAssGxcklJKnYzxMQE+LvrC1ingVDTXWtIOdtpaiWI1CX3aqRPXE2fOEUj4oon7
 NS74fhnp3jwYfjj9yDyAdHvqcDC78VhUve9LBvzZrJiQyC5u5o4FAomMrNgk3o20pz+UkbjD
X-Proofpoint-GUID: OHy5YRC8vc-MM_GHegOxxHs-Zh8rjw9A
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685c7328 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=zd2uoN0lAAAA:8 a=eRuU7Cc2dihuHY62QHcA:9 a=CjuIK1q_8ugA:10

On Tue, Jun 24, 2025 at 05:56:07AM +0000, Raghavendra K T wrote:
> Since we already have the list of mm_struct in the system, add a module to
> scan each mm that walks VMAs of each mm_struct and scan all the pages
> associated with that.
> 
>  In the scan path: Check for the recently acccessed pages (folios) belonging
> to slowtier nodes. Add all those folios to a list.
> 
> Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
> ---

Hi, just taking a quick look...

>  mm/kscand.c | 319 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 318 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/kscand.c b/mm/kscand.c
> index d5b0d3041b0f..0edec1b7730d 100644
> --- a/mm/kscand.c
> +++ b/mm/kscand.c
> @@ -42,6 +55,8 @@ static struct kmem_cache *kscand_slot_cache __read_mostly;
> @@ -84,11 +122,275 @@ static void kscand_wait_work(void)
>  			scan_sleep_jiffies);
>  }
>  
> +static inline bool is_valid_folio(struct folio *folio)
> +{
> +	if (!folio || folio_test_unevictable(folio) || !folio_mapped(folio) ||
> +		folio_is_zone_device(folio) || folio_maybe_mapped_shared(folio))
> +		return false;
> +
> +	return true;
> +}

What makes it undesirable to migrate shared folios?

> +static bool folio_idle_clear_pte_refs_one(struct folio *folio,
> +					 struct vm_area_struct *vma,
> +					 unsigned long addr,
> +					 pte_t *ptep)
> +{
> +	bool referenced = false;
> +	struct mm_struct *mm = vma->vm_mm;
> +	pmd_t *pmd = pmd_off(mm, addr);
> +
> +	if (ptep) {
> +		if (ptep_clear_young_notify(vma, addr, ptep))
> +			referenced = true;
> +	} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
> +		if (!pmd_present(*pmd))
> +			WARN_ON_ONCE(1);
> +		if (pmdp_clear_young_notify(vma, addr, pmd))
> +			referenced = true;
> +	} else {
> +		WARN_ON_ONCE(1);
> +	}

This does not look good.

I think pmd entry handling should be handled in
mm_walk_ops.pmd_entry callback?

> +
> +	if (referenced) {
> +		folio_clear_idle(folio);
> +		folio_set_young(folio);
> +	}
> +
> +	return true;
> +}
> +
> +static void page_idle_clear_pte_refs(struct page *page, pte_t *pte, struct mm_walk *walk)
> +{
> +	bool need_lock;
> +	struct folio *folio =  page_folio(page);
> +	unsigned long address;
> +
> +	if (!folio_mapped(folio) || !folio_raw_mapping(folio))
> +		return;
> +
> +	need_lock = !folio_test_anon(folio) || folio_test_ksm(folio);
> +	if (need_lock && !folio_trylock(folio))
> +		return;

Why acquire folio lock here?

And I'm not even sure if it's safe to acquire it?
The locking order is folio_lock -> pte_lock

page walk should have already acquired pte_lock before calling
->pte_entry() callback.

> +	address = vma_address(walk->vma, page_pgoff(folio, page), compound_nr(page));
> +	VM_BUG_ON_VMA(address == -EFAULT, walk->vma);
> +	folio_idle_clear_pte_refs_one(folio, walk->vma, address, pte);
> +
> +	if (need_lock)
> +		folio_unlock(folio);
> +}
> +
> +static const struct mm_walk_ops hot_vma_set_idle_ops = {
> +	.pte_entry = hot_vma_idle_pte_entry,
> +	.walk_lock = PGWALK_RDLOCK,
> +};
> +
> +static void kscand_walk_page_vma(struct vm_area_struct *vma, struct kscand_scanctrl *scanctrl)
> +{
> +	if (!vma_migratable(vma) || !vma_policy_mof(vma) ||
> +	    is_vm_hugetlb_page(vma) || (vma->vm_flags & VM_MIXEDMAP)) {
> +		return;
> +	}
> +	if (!vma->vm_mm ||
> +	    (vma->vm_file && (vma->vm_flags & (VM_READ|VM_WRITE)) == (VM_READ)))
> +		return;

Why not walk writable file VMAs?

> +	if (!vma_is_accessible(vma))
> +		return;
> +
> +	walk_page_vma(vma, &hot_vma_set_idle_ops, scanctrl);
> +}

-- 
Cheers,
Harry / Hyeonggon
