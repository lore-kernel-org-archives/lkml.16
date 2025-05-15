Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD861548C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 19:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747336499; cv=fail; b=ZHywD76q8O7JlUABrapwo2cmsRNYrhd6jp7m8KHSGg8MbO5m+MZqdGwKRQb0KYvk9Dj5xo3smgj+I8ZlgJJk1G6jfQwxUMJIZ1Pkd9TVZd77imUd4Gw/MK24LLIqWGY3fBpN/40aJPfJwJH7VTxz5LEafmGJUJaDrBUy3hzXeE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747336499; c=relaxed/simple;
	bh=k222gyGUhKGssHvvmavj7d9hUXUNSLOwe9h1g6rp1Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HZc70yLn6JoV2cvdlQQFCfZFSkTkpuu5G1wSpjwCP95ditTSQL2JHKhsbzCdLvzou6w1eyjweNH2liDbiGP+PBVu5wVuiTKiRy+Nx9StBdfDvLo6DtDVkWrYFGAffP9BFsnnSxTyblX0R85f19N9BEiIP9Z+LtxdjMh5qYeDnaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d031W1BD; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Syu+Itsa; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d031W1BD";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Syu+Itsa"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FF1urF006365;
	Thu, 15 May 2025 19:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=6lfk+mmUWkZ9ykOs
	z686gSPa7BQOjKpfijnjhhW0a5c=; b=d031W1BDqSgXtJsuZ4v5Jol14vXjZTmS
	voxhGcn3YTvGMIVOcSe9KOcQGr6s+EnzrCieoCIoEN4V/NzdwC7+3y0Y9QKZDsHp
	vbGIIfXxIzFkLK4pEPX87mvoROiKnnrAcMVlNvbhBzEFxnT12gCsG6zfpwGCSxk1
	uGGnFmwpB7ngOfxgZlfrvoOgmez+2C9878CUSp+oif6JYzwCfG5Egma+HslrOjcd
	Rzes8S9dUekLMeCLN9Vi5rfYethhK+F2H227WpX7yu2ST/4iAJ6rd59k17e7iw10
	wQxIZFmTJt/FcYkzLWGhR6eU5sHnpDndrqBi5RiHCD9j0PrAgu3LdA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcgvyp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 19:14:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54FHqvl4033210;
	Thu, 15 May 2025 19:14:41 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbsb0m0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 May 2025 19:14:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KS2CReLVlOphzrkZ0CiibzBoXqG88WyH4XJ/yIuoTw4NuK2K6/GuQdNq2Ph/boCZgjoXJhObfwXZV1tIxvTw1Pmc+daM1MIJn8ZXKjJh2tmu0UTr5tEzrpMKL/DSqnOo17nVCG6vBpFKlzKBMDg6WVCpiubLQcS8fh3VVzwTflPNTKWnSxEclaFa7w1hrXFFYnlSJwjFWXRZmW/2SFMY1nB56Ybvj/uB9kPmdT74Np0BsqauezF6dPw+g1c4pQI3cvGLJ+J2PCMLdz69ARDqbK3LzkEz6ujOVlh7pmsTbSABTLOF9vsXgd8qZJQTrrOgkaDPFV9axuL01RVe4buLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lfk+mmUWkZ9ykOsz686gSPa7BQOjKpfijnjhhW0a5c=;
 b=Xa56zGw57Uw76Fl5GPpn0d3Be5XOX1OBLdmVYzrBxlNdnR67oIc/iGAnigxQrcifFB+pG/mIeV0ohJCdTBvGHvzFisZtIPYPf2vtG/5IOd76OnsY7vj1tDZsWLVeqAdCUBl3E7PKpOM5lCT82QTUisphqGE+uxPYb2jtffstM67VFFI1S1mWbdysLCjUYlUm7zRKIieaIhbrm3iYDswyeT0gogxfOK6ylldM/C6OWCKvKfZAnsev4Oo1MELlG+nSqDP2VE8vv52edNisr51hQLxN+D0O9im75iT/djOlgSNz5bOwvwMojxUGdXkxKGmKzia3gGeSntShudBIP7Vwlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lfk+mmUWkZ9ykOsz686gSPa7BQOjKpfijnjhhW0a5c=;
 b=Syu+Itsag8NWSDyZgV/e+ieK8Bx82aGIyRSwDEjTyZ1nAnwoqDraxZHY6cnp3PXtTTBqtJ/s5VCYw0UWOVLVmTRMwJ2St2ehx6JbS2toIHSd68iN83sJ4yANEoobnSxdOcJBdYm/pd+RwyKWX0rb08CNlE4/tE/b2djbfH/Mjms=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6618.namprd10.prod.outlook.com (2603:10b6:806:2ad::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 15 May
 2025 19:14:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Thu, 15 May 2025
 19:14:39 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Alistair Popple <apopple@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>
Subject: [PATCH] MAINTAINERS: add mm memory policy section
Date: Thu, 15 May 2025 20:13:58 +0100
Message-ID: <20250515191358.205684-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P265CA0014.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 61b6543b-078f-419a-edd9-08dd93e4bd5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rpzhn385kUHabLa1SC5IGLYkcPEvc44LW8RYwvUnTALUZFADGc22VgZxD6s5?=
 =?us-ascii?Q?honub3WHZs9g34pdFCSGlXEK8AkPpeajkEv2lBY0A/PzjDeZBp1MeI266v8T?=
 =?us-ascii?Q?d4aWZZRbnnYdtkoSfDmhAcglt+/ZbXaRNH5CEUDY+Oh56LUA+0X1+g/NAPEy?=
 =?us-ascii?Q?8KM+qVUMCQf77druCASp0Fsy92T74K4X94bkS/KXuhXRnz/6iJNN44TM/7RA?=
 =?us-ascii?Q?SbuSuddbTvBpWFlD+H+MDNU3VZhwn12ezQdwkl0m6MxpQjqc0qfcNNOkVWcg?=
 =?us-ascii?Q?an/QWhDl5FThijR5uwKoRocyDpmr8KlYPpQrpEjojwT92+Pa62/7n/HTMGDA?=
 =?us-ascii?Q?uEdvBFo8k8MQFC+9Z+hlDdk2JciFeDtMfBf9ohQidTk80NR576fUMo87XXFV?=
 =?us-ascii?Q?oq38+FwCCjYUXH38NEOu8snY9cntUW64mcP1SoNAGp65lyn00dXP1xN/matZ?=
 =?us-ascii?Q?ljYJnWptpX51nh4W9gJdNFGqBf5a1TGw1ROaSI8XpRkz0txGmtoHuW2vSuYU?=
 =?us-ascii?Q?5D5ktmNcz6IhYdq4xuiXhn1KwlYUZ1hFd1XcBmNqKLqkkVpgns2BidEWECAz?=
 =?us-ascii?Q?VDVYPtFmGUc2y+R0CfZXZ5wq7ufavrwDK55jta4l1zcuxpY9rajJtW4RyG7w?=
 =?us-ascii?Q?LGF7D++y+rkjrrTf+7ZeCKzouoC5vO+c4mWEfH1Sg6IlNMNAbvwx6wN3xAy7?=
 =?us-ascii?Q?G1vnnSCKLaf49vyyLN5tmV8kKXHO8IH/8BauDie9D+qyJQs1P+H0voQb4LcD?=
 =?us-ascii?Q?LjxuvS9J8DMM27265eqbE8lwrN4roIeQ57Dp9m1yQnszpqXp/l2YUt2Zz/+b?=
 =?us-ascii?Q?wKYwCGU5spBhcYzq1D7Y0EFcoYwef6nN9qvsfIKUiK9PPpxQnNHXETanKSZa?=
 =?us-ascii?Q?PPWfeW/BAuapdZyvLcjHwa3gpG1Knj0GGuXHBY6mjyaXFbx8Tt43i7ILII+M?=
 =?us-ascii?Q?6f4XgPKC7LKDBfL1alab74v4ehr3NSr3RSh3BhD5U2+nF0HSoH5e5EkNxSEU?=
 =?us-ascii?Q?RjBVdwGTDY9ufI/7YMX3yL7sB7NRFpKa/j1/KdtAX9KBBWTVptrrc5T6PBR6?=
 =?us-ascii?Q?r6Qx9hQxy9RV1wmqOQeIEj0rwwcG8D/JC9motgYBOyIesC5OUPumiZeewiRq?=
 =?us-ascii?Q?26lCJrPPpEWh3NNIuXGwBxKwTEfkrstAFYOfCx9viQpK8Wvkr15VSQL0kkup?=
 =?us-ascii?Q?7y9ufpEcCAXySSx8bu5BnmTyF0ybhkR63ABG5jXG/AASkI+1A4+HfvFlEpl1?=
 =?us-ascii?Q?Knz487jK1ppviPgy5sLWKOVgWDyxwmLLa6sBkA1aAQ/kCeOpPQ7JzAMmC6ZV?=
 =?us-ascii?Q?pcwplUXzjTf/qgoWY+iTT4dGn0jNsP48e1w/edouL52QKKxJ8wk2tgkR0GxC?=
 =?us-ascii?Q?NQ2bIkcEr0j7cfICOUVwqo1asLJL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z3dv8TZkgESpEH2CedmFUgYBo9a3DDcFCOczboes/FdipBodKtUAkcTVeS5G?=
 =?us-ascii?Q?jq4vW3AtMZ03ZbdRPg8Km9zFyzCxYV+wZ04O9VSWPtz2OGk3UewQDbqjZvkn?=
 =?us-ascii?Q?UP7YZTtg3HfgUGdzCKmrmzbnITifpnO8Qvlin+CAAPIdxpXa+71mdDCQmkss?=
 =?us-ascii?Q?J7vuva09oT9bpJOUjWS7LinDLxKv8z+2dLPgE9qTNuFPwHzj65hEPahwO8Js?=
 =?us-ascii?Q?acg1EPWZl6XuldjEkamfXDxmjwm7qtBC404cSFuaU3ko2lTczt2qZtFaL2rC?=
 =?us-ascii?Q?2MdYIxbKIMjvIpOwh1YyTfKo/mcZOPqs3pLzExzT59nmIw223sJ3FdrOo6dZ?=
 =?us-ascii?Q?qjNKDhSzUsMrVeaIcHN4XTgAnzzruTs3RhdCqQ9QLB/Han9O4yjpo+G441+c?=
 =?us-ascii?Q?jgy34XzEy/OkxknIjDRzQR2fZt84Dx6l0hhgpg+eKbTlFvcEPfGaroZ0l5D2?=
 =?us-ascii?Q?z3VbdOiAZmituU6/MMENBYRMpOffJ8Uk9uBMmLNXnnZfIzax2rCZ1TRZb0Gb?=
 =?us-ascii?Q?01JAa4xqv+1dLfA3YeEvDxn7zqg/x8MSLTiwnPPhGTTRTO6pxXIBgRHkrfiq?=
 =?us-ascii?Q?Cc/buQlRk74Aq1CnLfW2lBTYb/+7yLjFyx4DKRV01gTMcwlsI0HSiDiN2cQX?=
 =?us-ascii?Q?0GOV6craLSj5DqPFRibWXyJD6GGlYJsgzCfZqh0ox1v029SuEMvgPAM4dA1W?=
 =?us-ascii?Q?mmDlxF/qKFcNhZm1ACMNaw1XPhc3c2ZNYeYq0A2Ls7fGp/rpyjedMVOGvZvq?=
 =?us-ascii?Q?Ez5qCRVfpeD6xneGJWahXa9IlW5dx6DQLnzGfh86uMcNJ/mY7pxrruDiYG5I?=
 =?us-ascii?Q?AkFoqIYQBp3XtzU0Rf2+ldjxUKdS++mQTEcE9BnRFqhCutFtKH9k5cm/i/te?=
 =?us-ascii?Q?HL069SHP+AVLipqdDNH6JpEuD/B+V2/m98kIssP7PK6Ad5UChywWc+PzxD+U?=
 =?us-ascii?Q?3FSunC/7gLWuqGw/z2g0qtb056zi1P3D6j4ZWRDbOlxDD5cVK/2TEBjy4pNQ?=
 =?us-ascii?Q?CnrlCxo//uH8b8msT0IqZC71+ZXUmCfSYtQYhcGcxuRxOaw7MUJpXiBoMrdp?=
 =?us-ascii?Q?WN7OdfPKw11bRBwazqYSd2tywv/ZCoLmAE/XKQQ23/oOubUJHWGl8OWMNXoq?=
 =?us-ascii?Q?0073dHHTiKZ1k+81yACIWK54tweK/5ysRebcVrqx1oEZyZWEc6kDk/mrDySv?=
 =?us-ascii?Q?H0QFK8qpwy6cwCT3T0Luz6iVLt/eSvgZ9UNUFgw1YDTtEX7s4Ebn4A3soIkX?=
 =?us-ascii?Q?xePbsLk2CmP/q8vO1+DWkKDWfaoZjYKVdAOr7I8+VosXZNsQDxymD/NPPYqL?=
 =?us-ascii?Q?JeTDYLc3upfxEIvsVNnFAj5owxEpaYI7mFAPq6YvaVmADiqH8QVTGsUApr+Z?=
 =?us-ascii?Q?Zcvn0UrWdkCcBCVw/2bbJKsJQOM7tZXuZ2swstZuCOQ03Ocxch+qhQnkaxKj?=
 =?us-ascii?Q?cbmP1z4bjNxmnvKykyyHBHOY8V1ytCPGp5kKW32JRk15j6NUVJbsYRF8Rkbq?=
 =?us-ascii?Q?QHJd/rW6H4z0gppyVAxNjBZQe4Gaab4Uo4SvSmTTyLsErU+eRLpTzGkJdLtV?=
 =?us-ascii?Q?Ur2D4EeTbFwqgb+Cnr+726FCMg+DKZncUX2+GH6weWTIXOpZk4Ogw43smTmO?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/EzlpoRSmQebyS/vfU7OvfsMieCpx/wV9reyPTH4ZEB4iTRAyzG97QwBHmJTrGQUZoDOeQvKNJ2oQM/HQ3d3c/ftTUzEGjanL4nSrHVm41XGO6dvuHtWSOG0JIY/hyMPcFi88sDcdjHdzcQl9nsuFBsdl2ZdGMWeWVQ/lpAtx8Rw4Sp+qNfRK+5os7Kp06xSsAz+6JXbEdp4wFQuW1Zt4U1dv/MpU8h0TvHM3IrVPAF03tJtnDHCbSQ0knhFtHym27RdQKCTFIRAsVsRiND01LTWeU2nSdgUFSRU+nSWXn3qWO2rVuXPwdUyFryxvazKWQEDVUUbLlO3hU48qrU6b5CGuuNZPIpFc1natpkcurisdt76/8KaWLX3a38H+jAJCM44ML2srYVqmz+XDekEfvo+xzswybBBU4igRLCUX1PcUhvRhe9xTG+WY04mHagK0+TYCoXWKBfvWcYnOvXxVd6Ix+6NvH/xcTbTW9ByseuBnUdqjWCDZl4tvk9SFUfWKCI7Kc+1JheZ872WLbhglW9a/gJQ01GA8hp9Pg0UPXXeCcMJriyjV85k5YaoVAFZ5Lvo8D9jSdNKsOAA2Dx8NVmuMbHUO7XUUoF+CczTYbI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61b6543b-078f-419a-edd9-08dd93e4bd5f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 19:14:39.6219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtwpiTOG/b2G7AW2OwzytdAo6Q5o6X6ZSCZLbSIUpxAICqMHj90WYUnK3PT2IIPlKa4nqoXs4F9IDt4NUhQWtgMrMmpTnfcxxO8PgMkAsng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6618
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505150190
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE5MCBTYWx0ZWRfXwb+79L5KysDs /hl2hmRbMGVb/FRmUT7FSducGcNW0Klxk6nRM2jhAAePid1eOzYM3kloUt6vnCfSeAvNMhU4qzI BBYChvetJXnrma2DTOAfOD8LFvHayYma1OUIaH/FJ0GCKX2xefqEq1eCYZFry5tS3bzA338+4Uv
 qqGceN2ijhV4WU3xsKMe++mDlIbPUloDQr7j+DxSf89VoQtFPg+0p8n6kW7x2H+71fD4X6ZL7iR HMVMIAh4K7MjWQKiNE3HQNnvFxk6Zzl30xPXPb55vO8/crifrkQckJFuPoknFxAmpEkUJUyj+rs 19A2BG9h7dlRSi515o+5CWvqnj1JQdBrJb4Z3x0+1FJffVg4c9ns9Rg4XtobCI3OSicg7DHSg72
 64WwPHA19NmBGzCUJjl/wZwe/Wd27N9cPAmPEz7M43n7YWseLErVWpHUbKqaoPrrfqEYokAe
X-Proofpoint-GUID: -m4WH1ZlCIkV2F9NBBrxGiRuTg9Ce5PZ
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=68263d22 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=1-S1nHsFAAAA:8 a=ph6IYJdgAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=Z4Rwk6OoAAAA:8 a=tHa68p0SAAAA:8 a=37rDS-QxAAAA:8
 a=LXhyJE38vmnIkUTECpQA:9 a=gK44uIRsrOYWoX5St5dO:22 a=ty6LBwuTSqq6QlXLCppH:22 a=HkZW87K1Qel5hWWM3VKY:22 a=ufIsyHvWW7FwcMbVRpPq:22 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:13185
X-Proofpoint-ORIG-GUID: -m4WH1ZlCIkV2F9NBBrxGiRuTg9Ce5PZ

As part of the ongoing efforts to sub-divide memory management
maintainership and reviewership, establish a section for memory policy and
migration and add appropriate maintainers and reviewers.

Reviewed-by: Rakie Kim <rakie.kim@sk.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
v1:
* un-RFC'd as there seems to be consensus.
* Added Gregory and Byungchui who kindly offered to be reviewers also!
* Removed Alistair as he hasn't been active on-list lately. Alistair - hope
  you don't mind, We can very easily add you later, just don't want put you
  here without your positive consent :)

RFC:
https://lore.kernel.org/all/20250513160007.132378-1-lorenzo.stoakes@oracle.com/

 MAINTAINERS | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 314007e2befd..17403329d76f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15577,6 +15577,25 @@ W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	mm/gup.c

+MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@redhat.com>
+R:	Zi Yan <ziy@nvidia.com>
+R:	Matthew Brost <matthew.brost@intel.com>
+R:	Joshua Hahn <joshua.hahnjy@gmail.com>
+R:	Rakie Kim <rakie.kim@sk.com>
+R:	Byungchul Park <byungchul@sk.com>
+R:	Gregory Price <gourry@gourry.net>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	include/linux/mempolicy.h
+F:	include/linux/migrate.h
+F:	mm/mempolicy.c
+F:	mm/migrate.c
+F:	mm/migrate_device.c
+
 MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Mike Rapoport <rppt@kernel.org>
--
2.49.0
