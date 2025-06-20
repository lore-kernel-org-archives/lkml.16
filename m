Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EF81EB5F8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440837; cv=fail; b=IoRrgsXtNUFwNVVKqkrzV2hR8fe+63Y1woz0MjNIvdnE8cfOx7uZ615jsIo2nU8PRoYqbW6Akg6RCGRCHM5H2VfQHO7FvcRTnUZhPcxNITV1X/VqcUr3J/dvs0FWamkH9wbaLH5ObzbUB+E/vcBMs4UaraZun4pg9mHEUdkSjZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440837; c=relaxed/simple;
	bh=eAgZHNambtu/ufPfnS/rESG3bmsVLg450YylR6mL1pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EznCVspUriOfZEPguPrpz1sUrV5UsKwlk/vwoaL7SRnT9qx4IsuhyFTO+5+zBAymR1AtgYTE7vMHb4pOX+1O41AxDxpaILP24tUX8YJuCO3rW0ozxnUAwJsOnAbNYjOdU/Mb+QGHdufTWMaON9vqMPXdjRpi7SOdNPcMX5EczyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=r0beop7+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jMadqRpK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="r0beop7+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jMadqRpK"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KEBq5a019366;
	Fri, 20 Jun 2025 17:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=hk8LkeFfylOMoBSgTR
	iT4ziAKPW9lQGQjzSNfLkYPqU=; b=r0beop7+pAYVy0s4e0EdxxzbWhrj3E5vGO
	FithT/AQR/ehRy93PcibIAiN11oYDnyWRfZjusyk3+VSWYB5kx7wxMLnh/BjUx9q
	4GWP+bZuFrxqonR2m4tj4N/IWDaVRAPmngn1WwyuMhss44DKAw9NEHkAJD9kf3q1
	6IvuK9yKjhB+KLQCvDjnHM98eS6J30lKHjSeAktbxzpHQjoYg/NZQEbI5YP9Aogc
	TDaaMcLJtwpOHVVwWzxpK7K2VQXCMtC9scCRRFux3AIp6dgpKJ3hHLr1kKYQ/pQs
	b7oaeZeBPef4M+UVa9xrv2EKaSsLrM9QE+RRRS212iphPJv7CyKQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8rb4ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 17:33:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGlurj037473;
	Fri, 20 Jun 2025 17:33:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhcx5g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 17:33:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1p+w5zlJYBjZzMd1OK1JjCRuAhLRnLxq8v2g1a+OZiKDz8BdvGliDYa4GJJ+41nFRb4Zmf4AyMMGdQQk0HJmx8cIGcQS5htERApC5EHbN9nP42fzyNB+pTVFET5QdzKvciSsyadnRm4OJcKgVVIMlpY6omkFm4y44lzkYLNwK1b7yXJCvkrheaxPf+i2zEki3/Ki/hT5YUWyGUSVSK8tbyqlUB+QNdgD+fxM48aOwmvBWq/GHkHKMUhYGByQLMNuCXIOkB5c3yL7JhVSkcEK5NRdfwelyJKmv/zpP4CJMZujxj/LgAyET+ZGgdiTmgN1NWoYpsf7bZ7x0QOzpMG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hk8LkeFfylOMoBSgTRiT4ziAKPW9lQGQjzSNfLkYPqU=;
 b=XSKYtAyF32ky5gD6v+pKGXZwFRYP9E2/FBVzEpnLgs1PbJDQOjoLcxORJrwbnuiHG75q+AloRkdX/eVTlQLCmCDB9cLqJdbrsCu+Utvd6lFurMxRK556etg2lD2YH8poG86R88cHpQ7B3/DEUjyPoPekBawDskUBYsGvfXzQayb06Ru9EN+8bQagsPc0C22PabrGNbobcaKXhTFS1CB8j8Cb9mpjgfX1kT6FlfcWkDHv40kfBbuLdPd5kJ56zGSHA3mMXrZAdgyPpYRCDWUryXaCNaU+wyqSIiLVfVklWOeRzFjuPY9G4BRDiIcE3oRPw4diZ3rZPdJFwo3Y4yqHYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hk8LkeFfylOMoBSgTRiT4ziAKPW9lQGQjzSNfLkYPqU=;
 b=jMadqRpKwJkFh8RamtfAI+98UwfG5j1Qp28ljP2NcXF3D3Jbq/kKXEGc/PTh1D5c3dLHr2dSTDGzctmYDZ90SlH+QcnX73suLQdDswSTxPHj35PGaRpffC2RWBBYNQ1/gFUUlPOG1T+1f2QrTMr8pnhQpzq6sz7d6IU/2UsnWbQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7631.namprd10.prod.outlook.com (2603:10b6:610:180::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Fri, 20 Jun
 2025 17:33:29 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 17:33:29 +0000
Date: Fri, 20 Jun 2025 18:33:26 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>,
        Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 0/5] madvise cleanup
Message-ID: <a380ee77-bbbe-4b3b-b623-21fdfa4e8d28@lucifer.local>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
 <20250620172108.95944-1-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620172108.95944-1-sj@kernel.org>
X-ClientProxiedBy: LO4P265CA0237.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: a2224401-0f32-4cb7-eea5-08ddb0209239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zW6rFVw2HVnsw4kgbTh6WwQ9CiA6V6cK5vjv6td0fKu9Myubek3WhxzGyW1P?=
 =?us-ascii?Q?6cNG9so0zMEvg1mBKqrcc5O5Jrrrqyra4ozcmW5rd2bp20LfpsENXo+m7X1y?=
 =?us-ascii?Q?sL87p4ga+c3gjRQDmp/gg5FdEeTS0t6rXHUbuB3zBhosp4zcx668fk3w6wgQ?=
 =?us-ascii?Q?2ws7uxk6W/eC4FkYGMVStkPh2Ntgwjd7SE6u0QHQoVPWDowkMmmc4DYHnMcw?=
 =?us-ascii?Q?QRWE8K+bC8tdDYvGJtlDnbEpcbNekVK3NnYvPee4NxuImSilwShygohmsQ71?=
 =?us-ascii?Q?uYPw5t3SP+OslzgaPbkTlOspLDM155thID2peMDUWezmKOZs48DzcXZHVJuk?=
 =?us-ascii?Q?6fDS1dObhEUrkSxnUAYniJg58Zz3RJ5+rh5eJ4VjEr0X9qlWW55Q3tIEZLoi?=
 =?us-ascii?Q?C11b8Zuk+iQXtSW0rfTM0zrGsF8Z/UUnTBPhJD7NSdSOPILJlyWXJzpcw6KG?=
 =?us-ascii?Q?8/9V3rBFACIbu+vIzth+YQgxEVPJPkojO8ffQwLuRkUc51yZu/hVmwMqD3aD?=
 =?us-ascii?Q?iA1l0JpDCglE/0KGMX6qHy4+IY8JhcrFhsfErj0GfLvKpcRLQBchqndsBawH?=
 =?us-ascii?Q?AIwVP72B55DgRsdh1jZLNiBW2pF0Z7H074HnERcBepBsAUub0MZ9btJgzabI?=
 =?us-ascii?Q?jPV5Xw+XvsW6zMnWoUc9cL33bV8SniWcq4j/OBHTZmtDN0ZButOr/cMWKlh/?=
 =?us-ascii?Q?Gp1jL1UiNcd0E90nIl4sg5qqj3ZjfBhDajT6rr5JpqZcFl8qa1XEl/Iqxk18?=
 =?us-ascii?Q?kEUl0nEO2YfP5SCXpccpNuUeO5iIfjqNAqW4Or4QPIuoiBUYrZFAdzN6S13Q?=
 =?us-ascii?Q?m2pNeLQSWdeIl6A37mz6ARJJVrCpvX/ipPIqSPDG2/UlsUqbufkDHrPWg3+C?=
 =?us-ascii?Q?JGzjgB50F0IOWELXjojEHkH5ngpb5/yxxzn1daoMqYkVhnrsoIsU7ozt6pV4?=
 =?us-ascii?Q?+XB5CUkm0OWju9OMlwBOp3xR+HTslZ2QlePclEPzeith91mRBLdEEDXVbrVT?=
 =?us-ascii?Q?iUhwCeHMwrllLE5uVZEW8poMlbLDlDgtSjbxjQp1bxWDWR7axBfTwoMeNxlG?=
 =?us-ascii?Q?DZ8ZuFkleiUpsTKon570aJzgukkfENwWBj1QQa9gOPgbizWrrLjaD0BT6mjl?=
 =?us-ascii?Q?N601vnl1AJKiNNxxON6Rw8L+QOIzDEu+6mPkE6GNolz3jNhRuB61qULBCx0H?=
 =?us-ascii?Q?B/OIvvtkQLOkUiOoW+ZDWNvoJVPCPXzxReUJ5PXkcsDyxAoqOpPC5j7eO2dw?=
 =?us-ascii?Q?W9ulNjunscI0m/zGZU+6pQZ5GFn507UBmy79EaiMt4yk4T10WJC2q1iQxL3F?=
 =?us-ascii?Q?fW//tcv10MZNCgFEL84QJ16COV8aFFOM25ExTlnox4x+qQywFzj3CCy8kwLz?=
 =?us-ascii?Q?/euxuICTXqDlCj4rIF5PjYIG8v8e4wm5kK8PIx83Skn77HpkfkC4ckrrOhUb?=
 =?us-ascii?Q?vOflwgUNTDo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BmsBVSGzvfyx0Add2ZHpSPV84/uExLYqtOxfP27M6dUwCujmhmJUM0b6qZaU?=
 =?us-ascii?Q?Pn35EjYEybY2hZvmk1we7ADhJnkw+eCq7jFSTHi+Aal6jmWCkUXfyGaMSkOH?=
 =?us-ascii?Q?5ThvMCxWpqSKfUkd/D9+FlgYHiv+wZjl7BKVzXHNOnUpHhkexMjYuICKLyb6?=
 =?us-ascii?Q?0/9hoLYiAFo+PkvVFUOs53+6eLHjIWmZqUpk/r80PEm7mLEGxUEhGH1/uYwK?=
 =?us-ascii?Q?NeBcCCRCSiMznyPh1/E24kG4gslLI0jyBjFEKfT8tFx5V7t/WG568achv6st?=
 =?us-ascii?Q?nDulE3lR4/iuCF6agBQQ7w3WVT83CZy3YCVx/tDYu3vmsywMUDlrPpLSk0Rk?=
 =?us-ascii?Q?aQ7CnvBhMq3lt4+BIebyA6zjuxg7T6MnbNrpVInItjAFZikXpEkhs3j8vzGN?=
 =?us-ascii?Q?fwW3JBvaEj4Fap+Ieo2BSoMSNOx4dphK/n0lVnVkTgziYXGEVsiZNXUOyOJF?=
 =?us-ascii?Q?KQZiSXLEqIi/W0u8YjYiLsUcbMNsZGaExBzFfb8d0kCO7umjQGc9uzbKIWF/?=
 =?us-ascii?Q?XmI4QDEDYT4HnhVMaG48V24xWQkbtAao3hhLctPYT2pboLQeBVzuZwWweKAk?=
 =?us-ascii?Q?PpxHVUA6IMsIsXhhxMkxioe3HJjwlxdL90Uhd9AYMKa3BDenXpFht+KF1gCn?=
 =?us-ascii?Q?DmkNvNe8xWa5XBSGG2yTjPy6zl36PCPSYiNty87/ZW44U1QMNVguOSG09bYp?=
 =?us-ascii?Q?ErVpqgDythaVbbi1BTJo/TREpc0fn9czaDjcsFOoOhqTr4oe5Bp4nwpoP7YK?=
 =?us-ascii?Q?fLSIy4nN7PiG9l7RE4UnLIU0emiGD2ZMS8xOCET0c7xDtxFTQ8Xe/Y3LEvZK?=
 =?us-ascii?Q?YnP2QTTf/JBPQ7JwgbTwZEP8FBdYYfUO8Ylx2LDByXarjjkePOHYndFvmyqe?=
 =?us-ascii?Q?Tjbu3ygHm7I4f1krTYXg98t0fvRtSPcHL2iFimdB6McZPpVTajcYWM4MXacI?=
 =?us-ascii?Q?D8LCzSTjoKe55TWT45/appHNpzDl3Wg5xCCQfLTRsu+RiMq8aZfkWvo6iH6z?=
 =?us-ascii?Q?srvP8zeJzX8HCCvMybs9UXGqBL+IuGmnBazQvUmRSh+5+DuG33/rIT+409vr?=
 =?us-ascii?Q?Dhj2/P6Lopp90c5K2Qund94unsgoqte2h30LVDYrh2kqtn/KUvE6eCLJxmTm?=
 =?us-ascii?Q?2nooTg+CLQaMRcLHf7NtYiaDp2AkdEi/L5xLnJDPO8drP+4rhuX+CHQmpsh3?=
 =?us-ascii?Q?geg+OJ9eErxYO3WGQObpM8UrGRrxytp+2c18hAJdNn5FKEuEqMzCBB0ilf1+?=
 =?us-ascii?Q?nmwVm3xXwAPt7UvtTe5k5LACq5s4MxfgnutphKj6e7bV9/ulTXIyp+8qUh2V?=
 =?us-ascii?Q?DmUuAppwAXetMcdQ06Ae/CBsBq1qbO82EZqVisU1AA0OKCp2tRv4sY8Eg4FE?=
 =?us-ascii?Q?fEstQ31ZJuObhJqXpMBVp40KAmkdbGl+nMxEQ3e2kbEXEv8G1fJZrFHTNisF?=
 =?us-ascii?Q?wOOCuNMxB8IEwHeSbL653w5DNt49uPAwx6xY19JPEN0nXthILt3kW+Go83Fh?=
 =?us-ascii?Q?XMY6VbgjvhRfg1BQqqctRVd6CSlx1GxtE0p6khAT47AYXpiABGTEUMKkarQf?=
 =?us-ascii?Q?4bJJgInaLaG9lY5sGv+DUJ52zK6nfhgKxMrTnb8XQhU1pO27hwCIA0ObWf8j?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zQy4PE4QE0JA2Q7ankomCKNHfc/gSuBGmJ8YwgKGlvSOCTYPGvoqt2pJULXOC8q7xyCpBdFXcdsV+JqMp7IifLtrfzgE/TL7+Rt0/p4MFshnyYjo6cBAxZSFRC474oOBqCDPM8Lvm+mcvRmlUiW+b+wA4zda/vv0ZYQtJcg7sD65RYnuisdot+pMDWJQVpzMf8mEHFSzuW4gEVwGTyuB/CVfWRSX4dcCwI+ZMxf+UXofzyhuvyuha2sa+LteY4Pu/7ecXpfauA+2NUq1bgh3sisCziE7hrdHSMircz30OtKzmKoLH9Sm4fqLJsryljqPQ0s3zpRQJBePRrv8x6L4PsSi2ANQVKKnVnoHS6sUzpDloj4I1ixFEX6ZRamEkh1Fn6nUEoWOLy2onDryrsNoW0OupBRGWSj3XCnimtS+Yc4s4Ol+80TFN1adiZxeoUY9xqMr42GQ9xflKMn1WzjRHpbBCvztvr47trbhBvuhIWQadwSfW4n2RJJP3HfHhakqZXIXUi2yQP0/JT7euzKak+5E77kC8zd4N0fv9QJpovqb0DBdiINxuiFm4GLE6QEM/fW1Xdo9h/g72vCgLwg2CRaKjumbmb7OzjzEBqWahFM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2224401-0f32-4cb7-eea5-08ddb0209239
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 17:33:29.6055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOqkHQMAf2/s0D3jzKpifG50mUQI92+g54xo9GDLXc7UkYkgGYg8e2LdA2ZAZOwt4mHaArtFFOcMypu5AUCnhEnZXk3jwsQgc/NfZ1V/veU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7631
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506200123
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyMyBTYWx0ZWRfX7piyUsHYUNBT n6BOPZo286EwhevXw25YqMVqv36zl1raNwj6tijEoc/KXWi+I2ThSebTXcMKEl1CmBqSfe98UiT 8VpIopAvrqIhHLy9w7PVeBiom7yDM6EOWOmwx2gd6MPF72fc2MaPaNCh5yPdBfzyiidlXwExxS6
 JPFDmPXz4Tplmj2pfYRknR+p4OzF0nIO/Dsh0zZ5j5WUWKf6JXyYA7gWeRwpToi+u/ZGQWABkKP PR52TRsSiPl7dCjdl8nT32SCqYX0L8nhB3mZufgrr63v42zN/QyounzR6CDUiwZfc/HF3BNCDPT TW23A2Rn17WEH9DmF7EQuXSP25ZeXJTgopnpRq4RA34r+tX/yeTB7ij1afov51f5gKtW2nCBOtS
 nXBdEKFeG4FMtIOXxgGsT1jDY78K3+fnttA63pQHpP4mNjMq+XuICwU74/SR7gHTMdf7gTmQ
X-Proofpoint-GUID: P3MkW_AqSaewz_qj5sSUj6kh02OvlIMn
X-Proofpoint-ORIG-GUID: P3MkW_AqSaewz_qj5sSUj6kh02OvlIMn
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=68559b6d cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=4tMG-JeiwRylQMRMi7cA:9 a=CjuIK1q_8ugA:10

On Fri, Jun 20, 2025 at 10:21:08AM -0700, SeongJae Park wrote:
> On Fri, 20 Jun 2025 16:33:00 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> > This is a series of patches that helps address a number of historic
> > problems in the madvise() implementation:
> >
> > * Eliminate the visitor pattern and having the code which is implemented
> >   for both the anon_vma_name implementation and ordinary madvise()
> >   operations use the same madvise_vma_behavior() implementation.
> >
> > * Thread state through the madvise_behavior state object - this object,
> >   very usefully introduced by SJ, is already used to transmit state through
> >   operations. This series extends this by having all madvise() operations
> >   use this, including anon_vma_name.
> >
> > * Thread range, VMA state through madvise_behavior - This helps avoid a lot
> >   of the confusing code around range and VMA state and again keeps things
> >   consistent and with a single 'source of truth'.
> >
> > * Addressing the very strange behaviour around the passed around struct
> >   vm_area_struct **prev pointer - all read-only users do absolutely nothing
> >   with the prev pointer. The only function that uses it is
> >   madvise_update_vma(), and in all cases prev is always reset to
> >   VMA.
> >
> >   Fix this by no longer having aything but madvise_update_vma() reference
> >   prev, and having madvise_walk_vmas() update prev in each
> >   instance. Additionally make it clear that the meaningful change in vma
> >   state is when madvise_update_vma() potentially merges a VMA, so
> >   explicitly retrieve the VMA in this case.
> >
> > * Update and clarify the madvise_walk_vmas() function - this is a source of
> >   a great deal of confusion, so simplify, stop using prev = NULL to signify
> >   that the mmap lock has been dropped (!) and make that explicit, and add
> >   some comments to explain what's going on.
> >
> > v2:
> > * Propagated tags (thanks everyone!)
> > * Don't separate out __MADV_SET_ANON_VMA_NAME and __MADV_SET_CLEAR_VMA_NAME,
>
> FWIW.  If this cover letter is added to the first patch, like Andrew usually
> does, as-is, checkpatch.pl may warn like below.
>
>    WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
>
> Obviously no real problem and I don't really care.  I just found this since my
> tool (hkml) runs checkpatch.pl after adding the cover letter to the first
> patch, and hence this is just FWIW.

Yeah, sorry, this is because I didn't 'compress' the v2 revision log, which
won't be reproduced in patches anyway so should be ok :>)

>
>
> Thanks,
> SJ
>
> [...]
