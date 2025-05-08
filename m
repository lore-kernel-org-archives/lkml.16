Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1668279908
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746718447; cv=fail; b=rd07sCk74T6o3Cq245vGg3cOlbXKTtm5lKV5PgPpTMRpKEahLhMcbewRF69Fhf8L7JL+qz0FxS004/sFVDDjfurglbsFzRYsKvoUoVIJaKI5UW70/Z95kPIVvTcqxPcKX809cqVSAUS0lYBQtyXFtzxB4YOEFGO62KeiVBXVE20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746718447; c=relaxed/simple;
	bh=gfOZCBLS/GzNq8QDziMUsxoM9USX8HBdGYx7CsAyfVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LW6YdOPqOZI30kISWuhEVJ/j13vYQEXISfSmoKcJu+90dKu0McwJvDthoCbFICZtQVvjkeT2JbZqKSYzZz5/QUWaGl8LyHPjLUgnSgI0W7orPsxsZx5h0I5Tap+thOmFeQNVCo9QUauhd66F4cC6dFf22VBJL4h59vGXBmGNMvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=r3K3ImQK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=tZAPPbSz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="r3K3ImQK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tZAPPbSz"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548EuoRc017471;
	Thu, 8 May 2025 15:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=lDtjeIMIAn1I1LyhYz
	Pnlf1QwHWDGHTpWjn4wIpYU8o=; b=r3K3ImQKUoyUeG1ezuoQzY+2LRqbyMOSJP
	mwuaniBvB+yHxP6AM0b4S0rxzjTSwaOM0yBj8MSRLFJe1EJdPuozQiPVP0VI1xWL
	Sy1QfaSbL37RtXuJ4KHriRKJ0h8EczuBztVTKLXftLspR4OXHLqmlpq/3KFIUe/G
	mY0EnZcjTnmkbMfHdyBFbnr8aeB2ALx7xakzDp33CIzRBM4dOS+nb4FuQuvug7zp
	UcVj7VwNyVafK90TCQr4xP2LmUBPZhobFeWPl6LTxmKQy/+28UGbwRuTIBvdWyCM
	5K+ahsuFBWWfbx6uV/94GhLQR47VLH2jBFPb1h0DDfIK780Mcozw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46gwvag9pb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 15:33:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 548EM72b007376;
	Thu, 8 May 2025 15:33:42 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010003.outbound.protection.outlook.com [40.93.10.3])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46fmsaefs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 15:33:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhjgJMLqoh34oaNh8VrMVi5u9vVMLJgAIIVkp9Tj+ePftesFuFmNCvEMTpNd8PVS3yStjg8Lp2nwOT120SxI8tML1CNV/X1KgcGxatrM9/8O8hJm1aOt2SLdUBYINTuQUod1twSUHIi5di2sbYNhRkLnSTVv4K8URP9O4cQFGfhVBRAEkY/Efd5Sjora2cRISM0rAkfhvSDTUFUh5XJ9P+Ih8TsN34UTw7JB137wQdTButGJCpe1fQbSk+GkSENtOE3OvVeQ2BhP+v2/mTYtHOlQrSe5cKfLs/CqdWT4AQ11apBFF5FnG1haEH7iV7HPWWEIlEhh+xRzUGkd7gURFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDtjeIMIAn1I1LyhYzPnlf1QwHWDGHTpWjn4wIpYU8o=;
 b=Ezpjd0AY6XDd2CBuBITDaPWadMqs9LKusj8LV0WwlsI4Ti9s1jKiTXZ0S2XYR13f+ufT+tnd+hFbboIGWrsGn4T9s6mHEkM6akhWWGLsMVgTX5RTIDAukG+MOhXM1uRiFgfsHXCaNwSreRTR9eXiOq0YrTn02QOBSime72nb3iXblfcktQl4olV7cS2O3Evi9ViFVDlRDC+pfGEJjwZYThgHwDlhrZVMzi+v1af82kOIiWKVNcmsrB2dRLQxgYGeWsmw9QPr5IuRgGEt1hf4+JyEF6XXQDYn1M9d05XlhDifRGc7J0qtzbhlbQxrvkrEsY1OV/yyNPWdSBYiC7vHAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDtjeIMIAn1I1LyhYzPnlf1QwHWDGHTpWjn4wIpYU8o=;
 b=tZAPPbSzU3tKlkfiuyEZFZu0VUzLchgz5zOkTsRq9asD9Bs2WC+z3HOtmafWqk8KPjqHwQM04PSLjA/tqHwQ/Pnmgm9or5rxewpEbjo1nL6C0jGtZ2+tooJuKf3I4qzpTtYQ9B162/4IFQLhHyLgSeCKf35pm2rx1Q5eFdF/7fE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 15:33:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 15:33:35 +0000
Date: Thu, 8 May 2025 16:33:33 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Christian Brauner <christian@brauner.io>
Subject: Re: [RFC PATCH] MAINTAINERS: add kernel/fork.c to relevant sections
Message-ID: <f0bdf898-42bd-48ae-89a2-8f93b49d071f@lucifer.local>
References: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0174.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4615:EE_
X-MS-Office365-Filtering-Correlation-Id: ae7d753d-c89f-4b99-d3d7-08dd8e45b262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EfX5lIO54+KyxFgaNNTF3Z6Oe0h8Fyyn9zdV/bHd1TlHHaW32rpgRGYJ7sne?=
 =?us-ascii?Q?7gGtJbdk857hVGcFbqIKuy636iksdfd1/lGJ4C4+NiVTFg2GNCWcHWYBNMZw?=
 =?us-ascii?Q?81FrweNi1qJIjAEozgNVyD1fcU+bMcV9Wzl3EaF2CHAjGfnyw62/H9kD/6sx?=
 =?us-ascii?Q?wW+Sx4/cUpkkZnoOVp0KyyzNiIhipTFT2vJVwBQkqRaJ/fSPln5W24s8VJ8u?=
 =?us-ascii?Q?i3Mu69nFNLyLPs8SfPXoAYQJc4ZrIK21LjXi1XpjdHqMDUx/UQu/DGxUR2wv?=
 =?us-ascii?Q?10nAVFWVnZvN7vq5ugV11WpgNAHRJniBf3rqG/hwhZWyBKQS807WcV0JALv2?=
 =?us-ascii?Q?E5CTKeVK/LukkZFNzvYLXfPa3ne92ZwTuzESMvxIB+4hFwSW9a0PGtYtUz9I?=
 =?us-ascii?Q?0ItPMyc70qjF/yr6za/mVMi+GZSPvVtSYmFdbnuj3eEHAp0lxtcD+n4rv+DT?=
 =?us-ascii?Q?inBDxlQTbLJV87Lc1DcqaeYo1qbNFtzFAxgIaFb42tc1PsraCX40U0pWSC5d?=
 =?us-ascii?Q?j00WJADcbCuh+njTq/GWfFiiegInEed5wIoN6nLqVTv/i7UkMyLWA7DvPQf5?=
 =?us-ascii?Q?hdV1Z21wfEzWwI/Nspfrs+x8b34vE/+HolWTG28Xqe7gbJog6BR3WFbk5qU/?=
 =?us-ascii?Q?TpTS2pKxoDZSHYuYnzsDYS+8EFYa35XlKr3rHUhJAIwV6UdODRDrKYKlJPVV?=
 =?us-ascii?Q?dIlWPHcQt/6S63EWY/dOKPp8/SZHiyZbyQ1e5uLmV4PDKYQJM2WcknClOZHX?=
 =?us-ascii?Q?7QZHPnSqKqB5uwEMs8LyRwGFvQ/Vpr4AilMl7yl8JRCQOHkFfvGhyOOgslNd?=
 =?us-ascii?Q?n97zGhhLU1WXyVOvRDMitZ2EaiqBr5sZE45UoON2xmhQp6kPLeBfi24mFJl4?=
 =?us-ascii?Q?QmQ62xMN6yKgDSBo+rOzxCP312PpF5evQ+O91QNJ7S1zIlh/O0lnfh/ZkMMu?=
 =?us-ascii?Q?daZ5j30hOSnJBiqO/6lZp2k/l+uvJ7EZ8ir9/pSPkdJEmjfZzkJmvDIWHcND?=
 =?us-ascii?Q?yqgtRCgmLTzUFQTQHeQFP35lmyySsoK5uagBTa+3xX2Bq8mpfT81fZz5ykRY?=
 =?us-ascii?Q?rZkCgawfB0TtSrp1A027RWYOuogLUdK3L23w0/aiSbeqLX2YV3EBx3LeIh5v?=
 =?us-ascii?Q?e8Vy+iLQyux6ku432Uz3bHVDfHBqjC+zrE1a4LeZnOaSx1+lD0VG692lD7HG?=
 =?us-ascii?Q?ahLhlhrom7dzTyc7m+OmLcECZ1+KsOg4sO+0LHtdhXXZOeDoFCw0oks4RSaM?=
 =?us-ascii?Q?2LiXKNatyUrdtiBvMuD7IkmcMd/ykJ0o4vX2+yohO9Wtksyn1RPEXjUR+LTS?=
 =?us-ascii?Q?FVfWIrQsRBmB7uvE/j6iofXXL72sMsPh/KLMkYAcxDZNBGnb2frbcN+T6YwE?=
 =?us-ascii?Q?fqfOoO3MpcL54fhHwr3F8sFEQ3HBq9zS8+1cg1sICtlCty/Y5TCcOKUG2MU8?=
 =?us-ascii?Q?GuPRTc7byyg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ThfMknAz0yX1EXSnmiMZ8Man1vd0NHTn6JvACS5XylzP0Q/uKjR/zIElOE+?=
 =?us-ascii?Q?0rEOp/UDw8arR+k1rZRuLyltyOcgFr916iSSvwPqX1P6zFycEtoxWvD9MjDT?=
 =?us-ascii?Q?tM/dmC+E0I0eqvpl1uV++PVB3GJ+tG0udhiLqZy+/WNHWIlha+Krx6z3+1Pn?=
 =?us-ascii?Q?5nqR2ryMzfM6LbC0G60TtcCgL4yV7RaYIRCzgU7QCPCLis0K3fbH7VgEJ1NZ?=
 =?us-ascii?Q?hxbQgiux86Veegs6kY7buGZCcg+u1ll2A5WJf/Y1LoHVW6VRddZHljdNM/5w?=
 =?us-ascii?Q?XBLk94En/0trsw9aSa1XUE0QSnW3HGZf07mnHak4Ee7qbkYQIlnR9z4H8Upa?=
 =?us-ascii?Q?M0/PPVN0pK4jtJU9vCshuhSF/6uQAI88YHQiwLBf1vw4D87VCyz1NB3V9C6h?=
 =?us-ascii?Q?pEXIG+Y98qfOCyH3BN50WLOEX/3HHHNiWxC76BYLajy9Cew1rmGDdti39tfl?=
 =?us-ascii?Q?t27pSF3hJih5i/9FWfW3NKZfb9KoHXsWG1jUVazNexiEStfdFnameUroUPjQ?=
 =?us-ascii?Q?qi0o2AXYH6MavzlmUQNZKBXC0Hh2pw3fm+CLGThiwsk5z8WnDWVQuwE0RJ+c?=
 =?us-ascii?Q?VBZqeGSSBeBC2j6QndaQ+wQu7D7TyydGVj2f7YG/unLrVXW//i0kPAPpcpRN?=
 =?us-ascii?Q?y9ckWYweowNYEcG5ILT23Je/B/sXw6ZeDJFEI4p6ncLv950ug83oO6OB4yIO?=
 =?us-ascii?Q?cl5Zz0qxrf165Aal1cODGVMgPTXco953yizPW0h5miL8+pRsbJ/bbO0u9br0?=
 =?us-ascii?Q?B1FzvXeMV9fAnQ4KnRhTus6g6BwqPdwqb799rU96chOPqgdtrH6NrkKwXmD6?=
 =?us-ascii?Q?WJGSZXTWLBUUODfHxWcpvNW4XpY2gDRZGro19voOlHcDV3THPgcfuPtRmGNN?=
 =?us-ascii?Q?RpyMHfvvryd6Z1DNfTLzSmrgcYuA6q2jdY4YyZ04AiAunh+dDNUq9SELt4JU?=
 =?us-ascii?Q?f3ZD/3nUk0oYj6z6s4KLo8vpjzHUO811Rm3Iil6vjfQ7EfPAhGDzAG6EEoSb?=
 =?us-ascii?Q?UXqzwwKOx0kEF9Pk8R1tZIVxnRuah7I/8MqCihcwf2E1/TeJbVhnfnjSRU5o?=
 =?us-ascii?Q?u1Uh+HJhQZNLfAlNzZFyp/LDn4XQ+xHk/7a9ZWLU29OxSWqtCPZcRZNB0JFI?=
 =?us-ascii?Q?zgOFIraOsD4Qd+lRD4BdCrQA/ZS5NIA5A7xkWru5KYkc1sSpi27PmjwXawUQ?=
 =?us-ascii?Q?vPHVtU5DBwunWb7oldDRTVvXckBGUyZQR8erlBff2xKt6c79Fx42YlTc0pye?=
 =?us-ascii?Q?85lTUIy7B0HWNaOWqG9E6bZmVcOyfl1gNMAAZHC7lnUwW3yDP4G7XvjxABOe?=
 =?us-ascii?Q?fE63skhAI4bXAdqXE9q+qBQJMynsqoOqAMSVP3bq3F4Whuocfba43O40JaZn?=
 =?us-ascii?Q?ycpnOZHGEbuupA8KNQLwBqrA0jzxNh7z9qft7F9wlh3cUiso41h/N/sAzKFz?=
 =?us-ascii?Q?MJsnYLkv4If9oxL0gyxxmgFNygtB3HlS1kMWkK+vhFpg6bn/eYJmBSEBC62h?=
 =?us-ascii?Q?8x2EUw6kF5LztAwVhr1w1eWOQoThoLJrW/Dhiz28JIGWeujSmia2D91XbTkp?=
 =?us-ascii?Q?p7vEI2kicw0NOI3feCZdCbvBoWh6vND0quWFBPYn9s3aqKvLXmWM6nmy7i7B?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xwpKeL997uPR9Cv+Skmv8JJD4CMbo/U6V/7w1wUGhqIuEoX5C15gP5oBVSVgs3hI/g4Hc9BiF7/1WT8S6FsNgB1SHeWcpT44BHNHWvmxHK/ruaLG8RK1lC1sMRYJRxA98zJa4SXYu+ZU13DZUTiymP+bQU+R7wbqUHy9m1M61AQNEmC+0U4rS2HeAfFvUrFJJsQXCWaOXp0+MQV+hHATKGMP3IcFJdCMHMiJksXSoAq+XipCinim3Dcojd7UCFSiEcOfxWNpYRT5P24HE9LyO+lpT59twmycDPyxZO9dWueDf0K7csUryJw2reI9Xs6EQ+t8TLC5Z7sLd+8W7bgZGmMSmcFjURthAr3OWJWWFORuEPW3evUE9EXt3GqE8xcUTs4XwHMdaArDCRMeuVd3FzzfCt5zz2YGFV6Us60426T0RlXFZ5GrWswUNixGBMO4lGd0lCKsqWTZJHbtj5EZSLsqNi4Ari42gkEKqVHS/QA322gSna5q1V1tKR/h+UbYL/XRQIOXiH3pnbatdTgw7Z8LrbTWH2lLnE1p4ZnPoEshRV0ewdXMhLVqy6nIFanC01ND5vP8qrTjK54wbxDbT1zsSpg4NUwfttC1HqIxUz4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7d753d-c89f-4b99-d3d7-08dd8e45b262
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 15:33:35.3935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLUY5UpdkxTzjuWGYjqYa02Y8rue/BUwDZPlrY6FTSh/K2uEY7E951gc3DYLeBhS+f5m2VhH8JggN3+m8WjtlCAoQwk3bVD+CPfr0bkOEcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4615
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505080135
X-Proofpoint-ORIG-GUID: HkAueNNTIguhlfCueWg5qixRujqGHhKj
X-Authority-Analysis: v=2.4 cv=Atvu3P9P c=1 sm=1 tr=0 ts=681cced6 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=nmUjCzs-Egu_ILmcxksA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14694
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEzNSBTYWx0ZWRfXx/T2Rp7Zve63 EJonfGwrt5po5Wuvt+u1A9WavLMHbQRkF3pSfkLq2okZbYjSSa/71agrI6EEcOfpiQ54cAMnLLk SuKxQf10fOf18wxegqnohAYYh56UhuNbdOigGlJPLItJAG78AJRTg9Ni2yDbOfRku/VZrKWYYvv
 I3DdKoKWqw43nbYZEWTRITXt2tF/YB9cslnf4Y0fTr3/94OEy9zObIVVjMVHj59CInSf8qVfMRK +EjmL8bc3TXisS/HkZC0q/Y5UsTfHIVGaYJ50C4IThUKD3m893edqDzdNuEzutfvkF13ULGbLQq csHZZgqmkfz8izxpfVAKH7qH4KSjRp/p7eaVfhyEnjqQiWBfmP+BJGov9f5ewgnFqZFKpJkTpSg
 krkj909T84WAKuQeYXOcEbyPanHUEGi5JQf2e2aZqiSAr+WLhC5DNhUlT3nxBBiabHHJLF6Y
X-Proofpoint-GUID: HkAueNNTIguhlfCueWg5qixRujqGHhKj

+cc Christian

And Murphy's law dictates that I forget to add the pidfd bit. Fix-patch
included...

Adding pidfd as there's a fair chunk of pidfd code that lives in
kernel/fork.c. Obviously let me know Christian if you feel this makes
sense.

Thanks! And apologies for noise...

On Thu, May 08, 2025 at 04:28:25PM +0100, Lorenzo Stoakes wrote:
> Currently kernel/fork.c both contains absolutely key logic relating to a
> number of kernel subsystems and also has absolutely no assignment in
> MAINTAINERS.
>
> Correct this by placing this file in relevant sections - mm core, exec,
> scheduler and pidfd so people know who to contact when making changes here.
>
> scripts/get_maintainers.pl can perfectly well handle a file being in
> multiple sections, so this functions correctly.
>
> Intent is that we keep putting changes to kernel/fork.c through Andrew's
> tree.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccc45b0ba843..55332d5bc499 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8830,6 +8830,7 @@ F:	include/linux/elf.h
>  F:	include/uapi/linux/auxvec.h
>  F:	include/uapi/linux/binfmts.h
>  F:	include/uapi/linux/elf.h
> +F:	kernel/fork.c
>  F:	mm/vma_exec.c
>  F:	tools/testing/selftests/exec/
>  N:	asm/elf.h
> @@ -15525,6 +15526,7 @@ F:	include/linux/mm.h
>  F:	include/linux/mm_*.h
>  F:	include/linux/mmdebug.h
>  F:	include/linux/pagewalk.h
> +F:	kernel/fork.c
>  F:	mm/Kconfig
>  F:	mm/debug.c
>  F:	mm/init-mm.c
> @@ -21742,6 +21744,7 @@ F:	include/linux/preempt.h
>  F:	include/linux/sched.h
>  F:	include/linux/wait.h
>  F:	include/uapi/linux/sched.h
> +F:	kernel/fork.c
>  F:	kernel/sched/
>
>  SCHEDULER - SCHED_EXT
> --
> 2.49.0
>

----8<----
From 6ab14cfd38a34fc097207dd6b898004a87b9cfa2 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Thu, 8 May 2025 16:30:58 +0100
Subject: [PATCH] add missing pidfd entry

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55332d5bc499..af1ab3ddc699 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19135,6 +19135,7 @@ M:	Christian Brauner <christian@brauner.io>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git
+F:	kernel/fork.c
 F:	samples/pidfd/
 F:	tools/testing/selftests/clone3/
 F:	tools/testing/selftests/pid_namespace/
--
2.49.0
