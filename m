Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EE5136988
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 19:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750447783; cv=fail; b=lavpcATv4iZUL+eEtDpkTbtMt5y7aWSnRm/5IjVt/IeNFczPNixTjQv3s/5m3gEMS69aWLtLot3ksFrQH5gylD0FM3JJ+0BA8XF+HijnOiW1/VFZycrQWHpxiJIUnfNk0titEN1UGZ50GR0d5C39iuMzImBjwMsf8zkKTlp1KJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750447783; c=relaxed/simple;
	bh=6dyE0orcp29Em/MGjLW7Zzh21MD0GGtGT6/xaCKrxcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W2aK1IFNE/jCcm9sfIUyJAQR8LDLP5Cqc2ilI5ADKx/KUTGFMPjAIgMlR7fHad5CS6C94jjRtDDey+fuY5twG8QBzNgfZSqI8Vgt5tUWm5c1ATpSRwoutp8su3bMYFfZrIiVqZzlqEez7UUqpcNbsLMDiVLLzcaTal9ciRR4qs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qDEK3Vwn; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=njXgzFNu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qDEK3Vwn";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="njXgzFNu"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBlS4019184;
	Fri, 20 Jun 2025 19:28:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=6dyE0orcp29Em/MGjL
	W7Zzh21MD0GGtGT6/xaCKrxcM=; b=qDEK3VwnfeNXxx2+RNCAjdUds2wH1FCvJ4
	+SKaIbkzSpkPmTeKND3pyVjQfrp/i1Z7VbxVV7WWnj2fczXJzrhvowBZfyeVoHYM
	Z7939tfgoj5weyDN/3gi7DpdxCFWPG3w71kb41Qfu+egdFundql/lW5wRE0RpLf2
	CSLovxsJ5kVeEbG4kbHBc+nYM7XqIipzGREEYymRphHP+UIACB8szxQM37oP6lKx
	EBloYcQMm6mUt46Y05E5uS5tlWrmZFpT2N6Rt+3wevLYVhCLddt5G2MyD6FGIl6r
	6Zx5nv0IdbvGu1ueTVSFWorg2EiP+pe19Pr3m+n2WDxJBwRQlRIg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8rb9sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 19:28:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KJNVPs021558;
	Fri, 20 Jun 2025 19:28:44 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2055.outbound.protection.outlook.com [40.107.212.55])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhd1cer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 19:28:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAqwj+rTcbeZgaWyQcFiaeP3j5v4HSv8CK3dfi+x1/O2w6ojQaGhYlTU6LWccnH7l7bGGeigvaQc7kzkEbvxKMX7Sz24Yb/qlkfhbbhyIvPfFVWJdl53FHip7CgnxyGh3kkl5yu8Rtx1NwR9cevwR57KxBW40nRS6BWWOtYaOWp30uYEMm2xff0grzNictfFrXHC8Ty0Ea5SkTg0fyfvbcsJ7hNV5JRU/Hz5xmrRoBhJgMiAr3p3VD9TDD/Dp4Q0Pmz87Ap0TUogyuxMLnbXRUhnZgdE/0ZZMxBzZcnCCFrV+XBci7q+T1luGd2YbWyw3uYdLkt0jjEpXyMYQlGFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dyE0orcp29Em/MGjLW7Zzh21MD0GGtGT6/xaCKrxcM=;
 b=JPY59VoCBS2/zcpjl2rvBh5Ik0B0JidjFVn+RWLJLlLX9r6Sp/SKJasWPnUeD2v9lzuTBSQLUCIfL8Hq2G5x8J6nsbt19MF7zWq1iKQUiPPHEvx7fgx+cxU0r+O0And2ssPfAjaYLsc5OL5Qu8vTtKbwWfYmnLHxwtMJ/IELv/fkSo0VOakkL+cirkwAFVSltczn2hKQuJSu/bBXobesxfhzF4VOKt/D/Sfo3+uzhK6/kUHctqzSP/U0pPV2DVP4E0yVihnvqRG2aLaxAsjCF11EFtvRq4ryMxIzButFCJVm9hDamy14xc8nDYxrajprToBhyp1tXnthA7cANSvl0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dyE0orcp29Em/MGjLW7Zzh21MD0GGtGT6/xaCKrxcM=;
 b=njXgzFNux1hkLSSuqew0sWPuG0CBYx5kKpOMigeYytp3ur49+ErE2iA4pyZ8tpT2ot6DF4UcWwHGN2V2nn8GqI/aVTUwXIyKoALKE7ntfIt6Mo/IYIKDMS6aA3hTYRuW8f3M1mIueCSPxXxmUGb+LJtpl6weZ2DKhVA1hEdanDA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH3PPFAA02B7A0B.namprd10.prod.outlook.com (2603:10b6:518:1::7bc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.38; Fri, 20 Jun
 2025 19:28:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 19:28:41 +0000
Date: Fri, 20 Jun 2025 20:28:39 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        Harry Yoo <harry.yoo@oracle.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <c1586ce3-e354-4b8d-aaa4-5f9899faae88@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
 <b65dd020-5e02-4863-8994-def576e3d3dd@redhat.com>
 <76zi626uk53dtfzmezzt6cfz45ansam2gpcumddqxnipnw5jkh@qwfzoxgi255b>
 <68d8c7ad-aea0-4556-be63-9b67d70e4386@redhat.com>
 <58560256-58da-4fa6-a953-d2c4695ffba8@lucifer.local>
 <tc466z77itm7qps5exnelcp57dabnvn2gtd2tigutaivulmowh@4n74ymr5yxtg>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tc466z77itm7qps5exnelcp57dabnvn2gtd2tigutaivulmowh@4n74ymr5yxtg>
X-ClientProxiedBy: LO4P123CA0107.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH3PPFAA02B7A0B:EE_
X-MS-Office365-Filtering-Correlation-Id: d4450dd9-438e-4386-2b59-08ddb030aa3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wRO9X0dvCCCRD/bXNz6m5G0/lt4oTT296Fnx5ziH6xPmrmOY6V4mwET/BsOg?=
 =?us-ascii?Q?gBtyexx2jdGxgCqpviBBMhWenzjMjYGBiOUH8Rn0qhlxBKDYZIYO6NMkH+lC?=
 =?us-ascii?Q?IMmu1i8AuVqaKA4n98s2ipYWDdxy9kWEjM2iPFPtgZ9ajNhqNuaERVdE6wm3?=
 =?us-ascii?Q?DmQ//1dtcKw0SPWZuNnuPh5MA3Wjjn1uMp/w+l50wUqpPKYDVjyeRHmbeM+B?=
 =?us-ascii?Q?UcMkMi8NbN0rnGXmTVh5m9tHxTMjCY3Pa/xxk3VpGtqA1s/4qNfIIOoiQlww?=
 =?us-ascii?Q?7BMnbVWb9ibfeJK04AF5nB1PqovkNdBgx50+CBBD5eA7KHHU7AzMx7zFUplR?=
 =?us-ascii?Q?YGXh9+QX9dXvRDJQug9oqM6UvyvZY+w4yiQXXq+mHCM+A2FlP5spDzcVJawh?=
 =?us-ascii?Q?VEsggcEyVX2vpxZk4LvvBuVYu4PYPArKVSGt4UHYWEojNNKOsfCe0aj+yucX?=
 =?us-ascii?Q?+QaOp50mphnEY+6A4LT9AFYvZuGyAzntVBlz5vrihtPjc4a46k17gyoG/h3I?=
 =?us-ascii?Q?v5IQS6NgzUaVrihAVj+pJBFeAi+Dc5RYgjVsKtPzj2cETjr3eeQjxCdUBjcv?=
 =?us-ascii?Q?yoELBx4W8MGIw/ty32CvUaJrfieMyJAMcSbOMBvKMHrvL6iefkdPXIc3PF+d?=
 =?us-ascii?Q?r1VvCQCvi59ZbvJ1fgCCE4aZENwJa930Jep4Q5QdcykGdlz164Gtk1oH6FFM?=
 =?us-ascii?Q?JuhNsnCfayEVIWSKcKNBu4iR59ZRQQhDQvHL9omx87KPls3TwzpQ21pkadPJ?=
 =?us-ascii?Q?AhRhaSzdaKmCMQjqXMASvqdaIowwlp2561jNxkjuPqO4LLhwbnZL3miOJey1?=
 =?us-ascii?Q?AKfBXwdtpC4+71K4vtGXHZhx+8pfEodOBA5y8hKaeHibFOLFZapZR4S0fBQ3?=
 =?us-ascii?Q?v7wl6qfZOWTi6vNm8CbESR3kQRC8dECU2uzO9B/Hn95uK+DIOa95TMfAVxOq?=
 =?us-ascii?Q?Df1XAYqfjeVESSRBhi1tuzM+TqVhmfiTVI/ggcap13JI2hNJrYtFaK5VoLHv?=
 =?us-ascii?Q?sOYRUcwYZc3WnivGSVyEd/uI4YX2Ogdw8f+cLZUSZN5Mw9OJ6KHKLyWlyU8W?=
 =?us-ascii?Q?md0KzQBt8aBHSbjoMRZzUD+CREBaEOmm5bih8U14mZh1TWX9vV49TJQkHQKV?=
 =?us-ascii?Q?am8NQjag41xJkmR/yXoKCJy5fD5VstgepSX2ho0KuL9M9x8Y1JBz24tOc9K8?=
 =?us-ascii?Q?SmzIn/wy4v2w/7gBh2Q+EkGDrshjcOcyrpgWLnP35bit0v3aH9M0kR8FKxOW?=
 =?us-ascii?Q?6rksvccAik78J7cZVVwepqdKRlAu1gEi3ou5iizwOBw+zDn7tJX+HBMQTpke?=
 =?us-ascii?Q?YBM28Kxzl9HJBzUWbParQXZVpLJLpTGdqUFSqaDk7SWwQuzK6AplO0u4ggMo?=
 =?us-ascii?Q?lyoXVMM8aEUL5zIO1wzGQCb9c7Hc0CjO0p7y2q6nfqk6tz3AA3vB579eXesN?=
 =?us-ascii?Q?AqJY0h4B+XE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ugPIC8gQPP84emLR4syl/n0pJQVxn9VSX+3kWgWhz9v6q6tf9iSYSspFxUN8?=
 =?us-ascii?Q?hvEAvX1UgG+o0s2DSecXC76lGUZrf1TQOcp/6UoaFmEBKxu12gTfwPF3l/uA?=
 =?us-ascii?Q?LQeeEl+pipUia3Z86/tQIUCuoY9B8W2ukTJpHNmvdcSMwZr5lt7JW0OGO1gL?=
 =?us-ascii?Q?oxxAW4wXYLzGaKWXfB9Mv/yfLBSdWMg9OQixPMe4FBOr1nvKF78WaQWjKIq7?=
 =?us-ascii?Q?sEHRZgIHrOi6tMMA3pIiEb3f58AL3Bt8X9CXptBmo7olpBxjBHLzmOu8Ig0Y?=
 =?us-ascii?Q?ad8bkIAoM/n7J+6Bch3vmLZqkZhZ94mOQisbvHI0506AEYVyDwfWtt6gaevj?=
 =?us-ascii?Q?4NF92lyyu+VaLfa+YDbT0SArm+dsXvF+CW0kHUELu0/i/mhNB0eBKY4ve0uL?=
 =?us-ascii?Q?HT7oaCxcQvrazaMxgpqCWe3zCiVxE95WISX63Su1dXTCgbPB9LpshjFktNql?=
 =?us-ascii?Q?Q6JhQ1n0bmXenpx1MoFhzMb8/DQmn30bJy+oK1YUjZIMyos3jTbM4dSJph9J?=
 =?us-ascii?Q?oaLzhuspRrNEeFnxxPz1rdHSHVyeRwLR7JJiHJA+xzS4s07NI4eLwt2g8A/Z?=
 =?us-ascii?Q?DbiRpaj+a01cb/Z6VUoi6CC8W95YX9HlS7S4Un0cUDfQLjUoQLAl8vnSt9Lu?=
 =?us-ascii?Q?oeURq/n7vo3fgqQHcuVgl2A6QMncBN1lSiEh9TXL6BYmkcdLScZOIOZ2idwg?=
 =?us-ascii?Q?obg3dbEht2AunMI8Lmg97rS/eLCiWVzVqnxyS1VW239jrq5IM1ukE3k6UQrf?=
 =?us-ascii?Q?1So233IlxazuOrd7Axe9Jgy8qK9rRpPDsSr6TdYUH1Hx2sz8cQX2fcjoL7c+?=
 =?us-ascii?Q?/VxCuappn2RyLqQEFLropL3uTT7DMPOuX/Cl5cKADUZTmtbkSNaJm3lwwy1M?=
 =?us-ascii?Q?1LfEtkDyX5Xc69a034XAOuun5L09oD5/dNzFDq5jIpI34vNaxkw0xR9/DF+b?=
 =?us-ascii?Q?DAYty/H1DAffBk1M9w50bFqwhQLtX7N8I3TtugVWvB1Newxzzrh5qylHJYSk?=
 =?us-ascii?Q?jk/Hk48vfmAR2PEBgQlUGf0ZXyo7/eJodCkc8D7I/DP4JldQ+C9Bi5Kh8NPr?=
 =?us-ascii?Q?KA012zsE7glvz98RMqquiZ8H3/aIAozkU6lvpZvqa+tYY6ODxWdnulAcnsel?=
 =?us-ascii?Q?3LlC23TA8ioz236jma6s20OvPu+9QvMqagGpsNAKrFwd4tte33+WBFKFBBQ3?=
 =?us-ascii?Q?fRoo/Fil2+txevxrCwXIx7+Hn70FRkp4A1czoPWqjhf+4h8Sq/pD5BQNlGMB?=
 =?us-ascii?Q?T7Ux/7c6pkqfFyw9Wa4fsMO56iyhrYx8YNGTI7/8xrhM5U9jQEHQZ9FokwGE?=
 =?us-ascii?Q?ITbzUM0mJRvC01zwx7neIRfpZKDSOMyzR5DmbeKzuHk1E0CR6aZsn33yzu7+?=
 =?us-ascii?Q?koRm86b8J5Tcx/9y8pDfKbbbnE2zCyJKK9aeovpXjvTgi0jzPGBXXl/lp8eo?=
 =?us-ascii?Q?piOVX3mjEApIYpOog8g9Y5eyk8cMI6OUcGcwa325hgrvFsg8nNlj75P74QvW?=
 =?us-ascii?Q?KYbyFxc47+GfRDi3KjTa3aXH4P8/3ARWXb65mJmAVTE9Yv3VQCQYLrwBBmkv?=
 =?us-ascii?Q?dy27E43yFdwtOIt4GwWzd7cQ8REGyRsJDBiWYPdJ1YCBQ9HwtE7WSL0tk4WB?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6j1VidaZkzOXhgrUPFDhWOIkUb9IjeJkfEKxHK22y585V++6J9tRL+nidQQXGoLvzfgq8gW7vEHX1lJhDwWViafvifE23k+qKrxr9VI3NWfH2+JvDmifugOBiR6l9e7Crp44p6GAkbliTa5zBTabSkoZAjclJO5dKSpNrGwW2T8IOLHLHeAZODtXrj2mDNFp8A1dE3x+yvZnXJarli7ecserJ01wAmL+MsUs9M0Rc77lMTiq53G+dzH2xqDfduze3UFLwfyId1x8YfL330IiMNLxiYsmZIGUKxzIp2YxbNIjfHhr2i+xpkBzZFGcKfYAlLcSguE9lMTc/YsAYmmpImVZy98sGdhcjsgPIzpo7sYWb+yWTkh9153av1NJrmU6TR+IpfrZS4jTm64m4GNCofn6ElHiFceWhPIRXlVcF+YMVTRd1qv5KmSrF/MaBYkUIpyigJR46ZMJCMhMYp79L/JRbVgQypTdRdGBWYHrzB0s6rWfcxFyzqn5TbpfFPFWpCqSppY6M6JkxkBPZJSuC0tqqp26mLpAUuU2Cy+eg/0DXekEsH83XVWcsGoXsxY5gBypg57P7OaLvjrN8MiL7IoAfF2L/V8CYfjPhMoxAFU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4450dd9-438e-4386-2b59-08ddb030aa3e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 19:28:41.8520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xn3nOwFnVd9GGciVoP/ADvXBAD9V/VM1wnCUaGVWQGLlIOV0WfJJKbVB+WuFSrwC72Ko8ghVBtk/wqwN0t4MfEbmdGneSH/H7HRQsdD6Lmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFAA02B7A0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_08,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200135
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzNSBTYWx0ZWRfX9o9L5C7hZCnu 9JWho1IlCFx6OECiwcFkD1CoM6dbY1nNcubeIiXa67re/+LPqja3NUYUd3+4OltM8gV4r6+Xpa9 84SRP7oHnU+GzFw4+uVIqL8q29hEqVK44/wnpULKJEVWhj/5kL0YZWuVk9hKmTph6g2n7Ejiun6
 9zaofXRHPhAVGmr9Z5krJSTj1BzH/xkdK6atP6Qpsf+cGwqAg+8zoDQJ3TfIoDqMNuSuepF8faK DFin54ZVEtq6Ea26WmrzeCbLhmRi4A3P6gBjSLdtFqMWMYDo9ZMcbG/xUcY29dPWPLrwU93VMjq 2IgkcSIXrY2ytP4Y7Tll3heyRz4tFb+rlEtlrU+hLe0eu4TfK8to5E3Bie8PqO0s93TspEBZrUi
 p4F1bbg1N++9ghJBec01ms4CIlGS2tGmIC+w2HRs8mw89YmOb9qnGUtbH8frc3CROFg1e3K/
X-Proofpoint-GUID: DjkjTDfOZE-_nVUvc3qvqoXk6TfEDUdq
X-Proofpoint-ORIG-GUID: DjkjTDfOZE-_nVUvc3qvqoXk6TfEDUdq
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=6855b66d cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=3HF7SayomimsGcIfxE8A:9 a=CjuIK1q_8ugA:10

On Fri, Jun 20, 2025 at 07:59:17PM +0100, Pedro Falcato wrote:
> On Tue, Jun 17, 2025 at 11:57:11AM +0100, Lorenzo Stoakes wrote:
> > On Tue, Jun 17, 2025 at 10:45:53AM +0200, David Hildenbrand wrote:
> > > mremap() is already an expensive operation ... so I think we need a pretty
> > > convincing case to make this configurable by the user at all for each
> > > individual mremap() invocation.
> >
> > My measurements suggest, unless you hit a very unfortunate case of -huge
> > faulted in range all mapped PTE- that the work involved is not all that
> > much more substantial in terms of order of magnitude than a normal mremap()
> > operation.
> >
>
> Could you share your measurements and/or post them on the cover letter for the
> next version?

Yeah am going to experiment nad gather some data for the next respin and see
what might be possible.

I will present this kind of data then.

>
> If indeed it makes no practical difference, maybe we could try to enable it by
> default and see what happens...

Well it makes a difference, but the question is how much it matters (we have to
traverse every single PTE for faulted-in memory vs. if we move page tables we
can potentially move at PMD granularity saving 512 traversals, but if the folios
are large then we're not really slower...).

I have some ideas... :)

>
> Or: separate but maybe awful idea, but if the problem is the number of VMAs
> maybe we could try harder based on the map count? i.e if
> map_count > (max_map_count / 2), try to relocate anon.

Interesting, though that'd make some things randomly merge and other stuff not,
and you really have to consistently do this stuff to make things mergeable.

Potentially deciding whether to do it based on heuristics isn't out of the realm
of possiblity though.

Generally speaking I'm going to experiment and come back with something...

>
> --
> Pedro
