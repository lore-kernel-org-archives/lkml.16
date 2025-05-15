Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBB11A23A0;
	Thu, 15 May 2025 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747327138; cv=fail; b=hwNWBcbxr+glYBMq+w6peUCj2gtXBRiHUEoWpzhNmjeZrHhax3nTI3GV4SCMwUaoIl8MWY1z9blTJBuUIgqfhBMIuiorQNcBJtmWs7Tbf1jZKUYQC46loCkVW5ec0VHrKa0MGD+mOrH+nCIMNITBNnTGb9CfC573gkMZs9LP9M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747327138; c=relaxed/simple;
	bh=EMI0gyhmPnANXDXdvKJSFy6wYQ+lghV/icTDzJ47DX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tMLuBXec/aSIoydok6085dZNhzFTSW+kZouNsrNK7JwazjCPWR6K/xVb5SA1wMSDgqaBrXTQgu4PRUmtpYsfiViA1qHOXE1VgekowHPyjPmbpd3bON29E1Th/PmfYrpc85EO5jMAndVkGQaMcPkRgHc4yk6flDIOF2j5+w+Ut+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LU5MIXdS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=YOuDsz8+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LU5MIXdS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="YOuDsz8+"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1n6L007267;
	Thu, 15 May 2025 16:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=nXJj0wtB0QiywvHkLt
	W7/xhksGnNhu1jzBCRs3uhomQ=; b=LU5MIXdSPhEtBY6uikAJKGq5gL0gk1kFQH
	lLaq9M2d6YZf4wVdpciGM663QG9QXfDll2h3qdaXaxW0VlOHIAmyiBcEVHGknmT4
	bWanjzQlzj0Y7RG1SEk2pxlMPVn72FS/o0B0DkNo55HlJytA4ZU7XtoQgcmHfkwA
	+aV5zPmUlL3Ks4G7tw+FYG272sZPCEAkTs0pzzmgqLtKWQsA1hIRKZxfu073x8ad
	xikD8D73MupevAJF59s+XzWTHFl1pEYHiZSZJzZVaIidmXAoAZr85Tb+YmK83e8v
	bJ+20EyqMWY6jd9O1SoAn8k2MrANG81w9icO+xxJxdWz9xKDaiuw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ms7bueax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 16:38:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGL1xT026707;
	Thu, 15 May 2025 16:38:11 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010003.outbound.protection.outlook.com [40.93.13.3])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbt9k2xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 16:38:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g39g5SeoUMZihFaxQeCLra4NyHaSM090YYGL953JbkxbSl0N6oO339stYqkrkYgyRN4UVnlsbYEbSN2qeHWY+et/y/THQ+tU+mQBSMweFmtb4/wNkFqBRJgvl/BL9JSvWPS6zkdjG91G7hinssyMBx30U8qmfF5sdNAilPhYyKdsnVCEuFUpQ2Ig63oA5BytyL8Uag5tIvRIL7fbl0H1V9mo+Ak/2jXsZJtxIVOrtmB1vijb4YCFrpHg2oGqV6Jgpy7Kjup4+9FxfXLOpizIVgi+QDIsZD1E0lxvfDjTLv6tIyDXdlnemkYc+tBH/729chE+/9KZ6GMpWuC5Cg6vMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXJj0wtB0QiywvHkLtW7/xhksGnNhu1jzBCRs3uhomQ=;
 b=ZhI7USrH1ZiDXtaYpGyihp3ctWK/PRr6MhTxjNnYfAqpJtAbKhuWFS89udnz4lzreD7Ql0fw0njBIsIG4i5BNAhZNZH7rEkAX8C5GNbIRe9BJ1rCeF8e8n+c1mTCbPzNF6KRHDcrqN0YgWeKR9Q4YzR4UPDrXm/0Bs0aaumAhBdqP5Bsz0hI6nT7B7F6MpQpEEf+nCOeA+2Cu7U0tN1jW4uXjgviXIe7tgC4AYqvhokdRUoc/cNTHj9tvD9N0G298LPihbP7rmaLaetrOM257M3W/H49p8RANh3ah6xWRrOeqXBgO0+lJcsxWoJQloxvJq3mnq//CBXh2jn2fu8UDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXJj0wtB0QiywvHkLtW7/xhksGnNhu1jzBCRs3uhomQ=;
 b=YOuDsz8+xiqLU8y6SjTEWOK77mO4TfQTq1DHii1cwqckfM6HOJrq9h5X1twitt+oMeb/a2h+9sHIkZOKZNYshmAHpl8Gt8ISpoTDOEw6V0F1KOyHhAl6xmx3eRSpju5s8S5Tq4DT/et1aYL+11Oq8h7nv1JK36+EzZGuxUbVmpg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB4934.namprd10.prod.outlook.com (2603:10b6:408:120::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 16:38:08 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 16:38:08 +0000
Date: Thu, 15 May 2025 17:38:06 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        npache@redhat.com, ryan.roberts@arm.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <7a255984-7c9b-46f1-b73b-f85b5b571a92@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
 <kuxzxh4r6fapb5tjbhvm7fsw7p2g6vlasdv46j2ggedmbbsec2@zgt445q4oob2>
 <360bac52-2cda-41fd-a674-89b113fef918@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <360bac52-2cda-41fd-a674-89b113fef918@redhat.com>
X-ClientProxiedBy: LO4P123CA0337.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB4934:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c0242a-55a5-4457-a518-08dd93cedfb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZZJYO7hhx3cFpkXWcd2yhYoEPje/A3Ropta+3Ei7qTOpgegBYedOP/NC15VY?=
 =?us-ascii?Q?7VkxVIfv8ZGfjBa9YveDT//JABpuBLfOMrytd4oNacn1RE3pnoNUAxCyt1/W?=
 =?us-ascii?Q?cGGZacxDJ9SGEB6zmV5RiFaR7K5mt5dg6mHXeM5JUv7bP0aCamugFUt8rJip?=
 =?us-ascii?Q?xwk2Bxv9/fe/U9x+0ngpXp8FyJRdkZdWozxiywTvXM2lFU/uwXIvfAaOSq27?=
 =?us-ascii?Q?vYc0+3Wp++XYA2qe58Gwnz3RhLfLIYFupzGSzUt1pwHB+AiN2OSukxjzDsE+?=
 =?us-ascii?Q?Pw/5cWvcJ3BfKckSz6n+V+qJWNixUmbvFbA7JL1lTzksiuwDSpFYxc3uJBih?=
 =?us-ascii?Q?DqJARrAypjULobkrnimvozVZllE2nvJdrhAY7zgF6swPsrKImyzRIJd4/0QF?=
 =?us-ascii?Q?R5xas29DBmrQxk476odIyXvPNI4/6fROg24Tk8jB62E2qmMChGJtFZGuRcUX?=
 =?us-ascii?Q?YJ6qgJ2RS3b07wSwSGqo69RivHkcO+kHiFbKwd9NbubX/SinZijKx+jkRts8?=
 =?us-ascii?Q?8Ph57Cf+IAAbpR/8qbbE2CwVaefDDUyz0mQ9BSCm2B9yFXRZHCxewpLcil8B?=
 =?us-ascii?Q?Tftx8SfADNZPlM8/uuxNLOcUMkHa/q03Ns53TGFZjrtkv+SE0xm5Dj4VDPN6?=
 =?us-ascii?Q?asGNB5FIAHHwb9JmRdNQdC1emYevAzrIMAA4gBEUeQ0Af5pM8NGsAO5Aq9oJ?=
 =?us-ascii?Q?Od1NlrMA/ZoLV7rzXH19v4vtsRA0Tq0jy5gd2l1Y7l51eWjI4i/fPbtkgzJV?=
 =?us-ascii?Q?KkTPVBmBvraObWS0HQn/ZZqt5Z7zQBMufMlqnasfjYSRL8KonMk83fG7Dw0x?=
 =?us-ascii?Q?l4L+cMHrPIPud1IK5RqPgyRgMDfyQCZ8jZLoR4yq9ljKlRQheGmLiZREhk31?=
 =?us-ascii?Q?0s8K9VHYb/jlCyDGXiF7NE+MLTRBPrlZh0JE5spAV/WYEqATWl5yKIQDlKbi?=
 =?us-ascii?Q?1ex9UjDk0KW5xJ5A8GARtBZ2qAApfJ7TOfiyNEhFoVioraQJWr6JeGvruKYc?=
 =?us-ascii?Q?wM4QEY40KLuxjqwwbQjdv+S69/fur8inxAz7ikMuSLQyUx5Jq8lDpCbtvjxQ?=
 =?us-ascii?Q?yIu+sqJcr2FRJdxS4B+P0AxapEi77FucO98sTpgcauN+W2GVLnDQT/02COuM?=
 =?us-ascii?Q?mgPu65R3KPOMK7JXGn5YmWctFMgZe2SwsmIEhdu5F7DHR8UKkofYs2HhRaok?=
 =?us-ascii?Q?YHiU8TvW/dFl1hgPE9jKQarEBigEvxL2q2YMpdOUkDSmWIwsvQT4KlTjHKfh?=
 =?us-ascii?Q?JB2EHwVi0GHcb8J2/loVydm2nVRLmwnPqIF3KA6RVeztLIOOi9eF5RALzqT9?=
 =?us-ascii?Q?b1KECIJZltMAQCL9CAfLJQL6m+QpJRmFLzQrtapgha+MNNXIgfkszCEMgEu8?=
 =?us-ascii?Q?7bJveo5vd5IZ2vwZxEGGz8zQ1Z0TKALkZ8gPnO77ycn+gD/zcyb4WBG8d5XJ?=
 =?us-ascii?Q?ZI4RAC58rrU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HjGko5l+X/8sTFTRVltar3FAkOIMP3lYUnIQjhcyYRZwpdxFs919dClldG0B?=
 =?us-ascii?Q?HmXpLAVPKOkPTpEAMiAC4zlvJZfSWv4Wo2q16NN5lFo3KZ6p4SI0P8hxNaps?=
 =?us-ascii?Q?custvm/d6asLaboSeAXpwzr8ksPCxaq8AJ1qF+QLnBEszbDkvzM/R3j5hbCZ?=
 =?us-ascii?Q?vGaE4YBvANI/HnXfv+kPvP/NYeiAAFQ0a1BWxbZ2YUdX4WLhbgYjFFg1BaYy?=
 =?us-ascii?Q?ViDlME1Zp6MSBwGidfmAzDmwvdvFzifukmuO71AWMC8v6PK9dEZjirzdd9RP?=
 =?us-ascii?Q?s5mWy0PDXdOgi6YNt71Q7dz/F+WXuX37kyex00GbFUK+oHraVLNFsClHZ/Xw?=
 =?us-ascii?Q?E3igAcJW/+Gr6rJwnlFhJLdHDX7P7V4Q7VV50QLOhY66WioUCxW8G3XZPKQR?=
 =?us-ascii?Q?02r40cXkL1GVFnctaQ7EEYnF/ZkcmCDstHq/5jgYOswWzTi95p2Ih5bQu5ZY?=
 =?us-ascii?Q?vAvYBjyYmkVZh/BOzE4QAvTy/gkT6lm7Ayd1pEvX3Em4Bl8H5amaktSkG+KF?=
 =?us-ascii?Q?zf1Nqg+nxr9iaJQy3tit6EV1aQGRHWjFOjTeJpuFvOVr88wnBAxnSMTKuOdJ?=
 =?us-ascii?Q?FgJZloVmRr/C1EVP4Fui4yij7WZq2+qGnG2uAWwIKy6HnW61gMpzjh3l2K1O?=
 =?us-ascii?Q?rwySSvsEBaBhsAoC3IYNyStfdXPLIdJ97shIj+TWyxl1pyF+CMrH2FGqkJYj?=
 =?us-ascii?Q?0b+kaJQ9FuXEiXF9NucKCYjGJ7OkCJHrgantnpocwOeDue8kJOvsRgfLTQUO?=
 =?us-ascii?Q?dX3XjbV27zK61S4sR33eALtqSZSvPU8CbleRhn/nAp+05keaLSDv5qb0rpN7?=
 =?us-ascii?Q?lXjLVlohE0Aub43+nF/XcVtOaYU7aoXLuSJEwDPkJUdO4amLLAP3SIQrWGGi?=
 =?us-ascii?Q?QHUQ818qcheMacIVrxJPARoXgx59KrpjEMPBfQplsrvTVA/XWtbxPkUjcszu?=
 =?us-ascii?Q?HzOLhyXFPNNJnX9BEvHaBKQho+oW9xhClrkl6+ZXkwdDukHx4/ASz4jQVHrU?=
 =?us-ascii?Q?RG2T8ycyU/mwqGyWBboPzZaN/fqgo0iIZzbn0YRMlxxqI4BPljZBkjzymzQk?=
 =?us-ascii?Q?/8sNXfSEw6gFEf3fQ/cwjxOICwdOfXow4Vtoh/IpJ8+iiyiBl2xAItcrd7sg?=
 =?us-ascii?Q?fRic5gA/wCqHNTbvOiIq+8x/ZblShMp1G8G9zPEXTviUp4KCriGVqjOWLK0N?=
 =?us-ascii?Q?+G6NLVzZ4jYHD31Ig3BMLoEJNhLGknRMCgdlKW9LKlh089HIYnZ91/cMBxIA?=
 =?us-ascii?Q?vsTcdZwOxjsKBSUeakGX9GDN8sSSMm0oLeUfsUuC1Fx08qrm87Rcf9FNiUa0?=
 =?us-ascii?Q?3oLamJMnwM7zhynTugy44mhCDa7FNjXoRuTxxdrHRsrjymEI239Osg0PaT3r?=
 =?us-ascii?Q?lznbh0Dtcwe7N4J9UYyvGLPIJKQReQ0OtQ9/6uC9fEQLYkN5QFXIdnhvoeoO?=
 =?us-ascii?Q?B3U+Lp7WcgpclSRd+WvMGD6jSnkcw6XkU1D1qxX4p+JDJxn0p5NhYLd8jNDw?=
 =?us-ascii?Q?6XXuPtVjQq7QM+C0utrGdFWSGdnthOenC1ygF0L3n8vpEuqnCP7flNu9mezg?=
 =?us-ascii?Q?9vozo/q3DNU/JCur2gemw35LAolpW4XJiNsXaWIkOea9FGwPJyxzq50UX1Mn?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aJBCfPf2AA8H/ia7izkg/oKR7FgyRtSDFgGDBSqM5/bDSx4doAMoHawDXnpq/l09i4uUUrS5CsbL80Q58+z8/dCrfI0Jn0KGFjdRzPsy9XT1wq/V183f58Rod2IC2RGxY6T1ZV2IJAF01EuNNIy4VDZtc6nyN6oTVRyO7vmi1ZZM3/QtI0+c4dGA6tCJvYcX9ITEYaITwbOVR+gLg3J3P6mhiVLOdS8qEXaSi/XluxWdjgc28MJwiCeLzv8cwm4pKbOFdHadFTxFvRwylR/TJLpMLGrY12hhzMkrRInodKX/+FJG9H2vijySsGZEYi9HQd0s/UuCsozGC/5TXGCkSWaN5h5vVZxHqP6kAvEs9shiJDDZGTcPr7tb7WKpD0l0H/VkR0bZmwQ+ASeSju7C8lBWlUU8l7/QcB0cya4uOGpUhXzZHayeZvxtixdsIonXX+Hab83m3Gr7z3WIyTqy5XD+M0/M9cPiDOr5QWOnf1E+P5Gzj4cAZDr9JdA58g2vX9srEu8ucNORs6X0bTIiY4hkvwvLFLWB/5vmLvbbEcCjihxCaojN0xIw41SabwXT04JRqkp+uB81yKhAfmo+M00eGbk5k61IhwE+RfdNwec=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c0242a-55a5-4457-a518-08dd93cedfb8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 16:38:08.3602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMETmhCiDxCNRtpPMzHEHRsQabV8ulBUQJC4dB5l/CLaFjdHOiWDD9i3E9Vwh9b53KXJN7Uk35L4aBoBHApynozwh5aLGu57Acxxsna8tlY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4934
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505150164
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2NSBTYWx0ZWRfX6DcF9oU5SZL+ t3behv8P72Dbs5kxRYX9dPDQmJdrI9ueR1o++uETvOhIb/ocXWPEOUh4K2Tj56tUOvIgNmC9nwt eBEB9KO5ZniIrULX+5RorLRhdbAse9OcDclghdZwzN9QRIHQjUAaB8efB1BsellA5TMQC8zj37I
 L03X/Z3aoN6LnIEw/Vyk00XXH5JxugfC4nSQeLAF6A6ELDcGee3EkbzqkvuhrZx0Od9j/Nfc35e G9GGYjtclqbhIoSG1ZASxNCAaTy3rD7LqyOdpWnzIJpRzLTCoLKJHWQl/BIxTVloQo9f/1jsmYm zFYtubOrnV6SSlo5nDooByuNL1PB5RErvRMsDKPihM/0MJUcOmHdyDItc720uImj2W40+I3NdpC
 KOUpZYRuMp4n7RlBEL1j87us/vDBMawmiYas1iM+CCliooY9u1sCxA+XkA4WFZWnIBqur/ZZ
X-Proofpoint-ORIG-GUID: gnDh5MFCVTVHtcPb9vKToXuVSo3oNz21
X-Proofpoint-GUID: gnDh5MFCVTVHtcPb9vKToXuVSo3oNz21
X-Authority-Analysis: v=2.4 cv=P846hjAu c=1 sm=1 tr=0 ts=68261874 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=20KFwNOVAAAA:8 a=iiLIqXwB35L7QQa8r1gA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14694

On Thu, May 15, 2025 at 05:57:57PM +0200, David Hildenbrand wrote:
> On 15.05.25 17:45, Liam R. Howlett wrote:
> > * David Hildenbrand <david@redhat.com> [250515 10:44]:
> > > On 15.05.25 16:40, Lorenzo Stoakes wrote:
> > > > Overall I feel this series should _DEFINITELY_ be an RFC. This is pretty
> > > > outlandish stuff and needs discussion.
> > > >
> > > > You're basically making it so /sys/kernel/mm/transparent_hugepage/enabled =
> > > > never is completely ignored and overridden.
> > >
> > > I thought I made it very clear during earlier discussions that never means
> > > never.
> >
> > I also thought so, but the comments later made here [1] seem to
> > contradict that?
>
> It's ... complicated.
>
> >
> > It seems "never" means "default_no" and not actually "never"?
>
> We should consider these system toggles a single set of toggles that define a
> state, and not individual toggles that overwrite each other.
>
> If you say
> 	/sys/kernel/mm/transparent_hugepage/enabled = never
> and
> 	/sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled = always
>
> instead of the *default*
>
> 	/sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled = inherit
>
> the admin explicitly stats "I want the system behavior for 2048kB not to be configured using
> /sys/kernel/mm/transparent_hugepage/enabled". That's an admin decision, not a
> per-process overwrite or whatever.
>
>
> >
> > Maybe the global/system toggles need to affect the state of each other?
> > That is, if /sys/kernel/mm/transparent_hugepage/enabled is never and you
> > set /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled to
> > madvise, it should not leave /sys/kernel/mm/transparent_hugepage/enabled
> > as never.
>
> I recall we discussed that, but there was also a catch to that. :(
>
> --
> Cheers,
>
> David / dhildenb
>

Did we document all this? :)

It'd be good to be super explicit about these sorts of 'dependency chains'.
