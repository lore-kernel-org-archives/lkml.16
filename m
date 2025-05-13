Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CC21991CA
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747159999; cv=fail; b=UOvFD6ID3CDTLpJ+WpSNgp1Hm2JM6XdbdqFCnj7+0lm9IkRbdgmEgrJ61uGIPtS6yI+UZlat1+rjeIso4QzFBMxwYjAgsItLS5lUj8T8WPrggbbgOUTCmAQMiYWtWcG/FpGAG709kcuOhHerChmvxlzh2/aISg05QdpwVcGtGa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747159999; c=relaxed/simple;
	bh=uHy2Po00aJwu6XERCJhIH4dYPInhZ3dxw1vF2SiNeSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ORGJMwxRbu6+gfekGI/WoFwAoArbSpubO+W74yXolzSe+wO0pXgCwfc3rAaUNRpoep5ddGAAFErKVNGgrtohcMk6CQ11HdRdIkITyvsiKCCyiEJ07vo6FWNqMwqpeyZzSJ/3k2PoFX3gWs7Zkd4gyc5t+Tv6MYSAwRA2F05BHb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TYqGjd1r; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MAZa/rz2; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TYqGjd1r";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MAZa/rz2"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHNra026640;
	Tue, 13 May 2025 18:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=TycOKZTYriR3dYLnpV
	qopASGel0O+TtwOcKLFgXoOvU=; b=TYqGjd1rZXhVJLqL0dHlSsQkikmzPEQL5s
	LA2U12VK9ekWntdgRMNaD0xuMQGmqr101ghNwDV6S1G9DFXhrFTwtdwBt54MgxjH
	IQgH7rv6Od217lgpJrRfQXB8KD1Ozr57c1IscHq+PUxFb2rfpYUYQtQirmciSZGl
	1NWKJLV4rQdkmdCmO7QAjFQ07M3dnPaOsHS64RK645IkSAwNzzRJq52gqYVSBWV9
	xePkMBCyHOhF0ocXaUz3Ca8Zk8qzYywbqkx2m4AKbhB17H4dP1px6EHVN/p8KYv8
	efqJBukDuYZl/W2BXHoy1UYo89p+k68h0cGrbp5AT1W7ZkxlHPJw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j1665jgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 18:13:03 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DGqXDf022316;
	Tue, 13 May 2025 18:13:03 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazlp17010007.outbound.protection.outlook.com [40.93.1.7])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46hw8a2wjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 18:13:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxWjoQILBBeeHJDaB4FiE134aqB8E093l72iu0el/DqfAO3j7mQU8ofEQXYf/T0pShE0ijD9g9LiqRqOwjI/96kgKoexBKo11uvIADitoTQiDLHwoQ8coe5BSeym/4y7tbSWlA5MjXaeELRKdQzx4IDJUDLxn0L8NTifn1O38vte5ahWIP/NEkRFpoYsUCzBtOfVUoQIVuvMa+CgrRrSGdY1Mc8foj6KuvEXGg8GN3428bqUuHQThK2HHzVx0zKQCpyxhv8xdM3MXX9yXk1E/mpLx+bGxIVatxQrhdV4vlds+3k/lWiZ6diMon73OoPTXpDDMFXSW0HuqKuAP26syg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TycOKZTYriR3dYLnpVqopASGel0O+TtwOcKLFgXoOvU=;
 b=jdzaTQqTU6rlXfhwRY+drK70wNRx7t/5u8tsDOqDNE/lIX1WgpsEv+Gsmpa0xL77jhbeZN7AhWbtwxoqJJ8SPDuT49UtvpRVAwhGkZPJC3D67iV1rN9Acjhnea9uo1iAnf+PndHcAR2ZsJBc4kYJ2tz5oJ4HxbzsS0Bjlo7QkCfqOFoyxsrGBhDw+ySdigd4sQh2sPnd3Gd415fbrJvMqH9EsQ3agXpgD/S+xVPwxXMSokypv0RxvUV08wcyM2+rrMizQFbZJTXAz0BKxV6tNuPInCmw58EEKoBy4jnTvz/pWTIS1yaShMMNi2PoguH5HEnCIs0FrE3b1TrNUjmJ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TycOKZTYriR3dYLnpVqopASGel0O+TtwOcKLFgXoOvU=;
 b=MAZa/rz2ch5ecmWyy8czxo9PUPMFR3zd1tSzaEwxBA0vsNTzA8DFiEaOnSzUvlCYMnRALd5VS0e81H4iNiFI0j69JoIIonCh6hJ8g6hhBn/Z6ZLm8NL7/Y9nxolZ0pKUKUS9Nl8kb9gIq8ns68bMx3pvNLJmbrtnItS+vPVDdj8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB7555.namprd10.prod.outlook.com (2603:10b6:806:378::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 18:13:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Tue, 13 May 2025
 18:13:00 +0000
Date: Tue, 13 May 2025 19:12:54 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Gregory Price <gourry@gourry.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Alistair Popple <apopple@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
Message-ID: <9d1f0f54-c97a-4b32-a164-7527783916be@lucifer.local>
References: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
 <aCNxfgSjeWUgpOus@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCNxfgSjeWUgpOus@gourry-fedora-PF4VCD3F>
X-ClientProxiedBy: LO2P265CA0221.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d887379-aad6-42cb-df85-08dd9249cbaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3vuvY5IwNemrp5sQ5hydEM0RtTkGenmbRfi+6WloSp2P3qgC8rfs5HSVX2HE?=
 =?us-ascii?Q?p/SPTD3BLF9k9W8NlGQ9qYPSb15ydYNn9SxGypBChRLI/cl7HXOcxJ7FaoLJ?=
 =?us-ascii?Q?x2uoIs5WxHaAwe/XFiA954x21KoBdbNPR3AIjAiSvDcwR5zRAFaUTUMST9kP?=
 =?us-ascii?Q?QoWTJjYqtPWMKvSAVcPVwloF6dhgNYxLfK6QYzpicYbR6eJLeYoobibE1Fkg?=
 =?us-ascii?Q?oLGs+bfl7zO8JC6vQDuO+H8gXW8vvPxk/OGlDAgMGUokLEYBrrwJKtV3AHqu?=
 =?us-ascii?Q?GindPLb0ZE1nOE+VjlA/7JE3ZqvaszXs02+60N74ITegPpYDKXH6sunbef23?=
 =?us-ascii?Q?nyydcZK+w2Gr7hZUSQCmDAeuZV72zI2WQ66qbcWssAjSBHuYMKZPUqFWzi0d?=
 =?us-ascii?Q?F0UyJL/Cai0f90zvnXszsMRP0a/TzR/HfPfXLCWo8arPoYvQ4MCzXLFFWshD?=
 =?us-ascii?Q?4schtAWA+x1itEvBB+C6+r9cJm843+OSyc1hGyVgIouuMRA/77LEJwnsyfQP?=
 =?us-ascii?Q?QEsh1nO65Wge9QVmhwPoxdIc74WclOrVyP5bYXnA3c93nKX0ugni8pJgXE8N?=
 =?us-ascii?Q?JGSOiMUOJQYqozuT9+uWcIZ7letWgEjVctAbDqnuthZILgzBPzYvw5lu5Tmc?=
 =?us-ascii?Q?Qgb5O+uhfd7AGV1qYHqGOMKs483qz/66id80/Kfp/ZDhpGIz8SdB0AAvF1Pa?=
 =?us-ascii?Q?wdd41cb1Bv7/+LxaiSZSuOKQU1SP2hQXC8LDxDD3vxeBo2UoY5Mke89HcxGO?=
 =?us-ascii?Q?7vQy4+pFrIf3tXwWDE2KQEnxF+tiNnbfuorzMUKfUADaAD0KgDd5rQCs2e0s?=
 =?us-ascii?Q?ACV2bW5QUoPMbzNgICm/p8qU4ggU+Lp6ca+XXA9N7UVxVPOE51YTxS/BdIGz?=
 =?us-ascii?Q?srIoAZcDXtWn6kK4FojDXGITf9hHgMybTN3qmkwkHFsdjNzWo4hVfBjKwJXZ?=
 =?us-ascii?Q?3uHJV+tlwGZPYGMALya+kOKO6wG5AuEFUtzW/0EA38dZC9N9joEidMpfB9ai?=
 =?us-ascii?Q?IvnZY36lgeqtwftL1bf6giKjnffcB1bl8rGYFzYfiqe8oL30Jdu42Qq+tAtK?=
 =?us-ascii?Q?G0+87QpQwzXlZCWJfKa00ghJ1/Z+WxCbm9ze//ROYD2BohQdrmr277OZfYhU?=
 =?us-ascii?Q?TvyFDiVbP8ataL9hSnxQwlPEIf+PlfIlVtBtfRYnwW3svR7pAibE6ywGOemT?=
 =?us-ascii?Q?UZwBYh/ARdgEECIX/wTmOSWNo178rRyvyUbYJxDZmSfZaLgPkOqnHmbLMtr/?=
 =?us-ascii?Q?hOIugo5Jj+j8n8/T+rl/C5R7YUlF12aFpJkxlSK4w94+xaCVxMTnt2+aULQk?=
 =?us-ascii?Q?UHQxPQ86mJJJvJTorqD8WwIRziMmzWH0JYtKJ9MZxS2Tnlo9jSKVeoNLNR64?=
 =?us-ascii?Q?Lb3/tBo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7fe7Gi/3aZxUYU+n2o0vNQ41awXZq4mxP/JcRnod9E6dL6q5SrAW3xPYILtL?=
 =?us-ascii?Q?ddW7TgrhTH0hZsnxUOxTc2lB3k5o3bqAz9s4FW5pCXldpQ84aGSxWzqFgCl6?=
 =?us-ascii?Q?2dMLLFn0t1h+x9CdIBTCCEKsl32st5Eommqin2SS6wNk3504BIRe0XQsfsUR?=
 =?us-ascii?Q?doHRXx2SuRTE9bllcNrZ4oEz1qdrj1lmStDC+90+3c7W2Kb79InnWMEAnlxT?=
 =?us-ascii?Q?FmCiaA9ciLjfT92bcHqC8sbysh7Psj8mfD5R24CiC8inseSwbEeL/Prawb0p?=
 =?us-ascii?Q?qvbo73wxo9oxw4uzC9Gb9Bvzn3nBLAcReRPwEvuZIQCNRr/3TSwLLhfbmVgn?=
 =?us-ascii?Q?dVkbYdlVUHta/VQQX0QnjnUp9s/S4z3YNLKHvI0DSQ+pOoYu0tfKpAPZGeI3?=
 =?us-ascii?Q?JECOIFqLxU5HX7OCuaZfM6vhKw0aiWNDV46uYFBg03Hpr5eJB5/Bf4DO5x6z?=
 =?us-ascii?Q?861vW7Ge51KwKZ2LXLVZ34OtXgazeKVIl4WxIQ/ZYG9ZBfWF3tIzLzDec9lS?=
 =?us-ascii?Q?0MtjGox9/2jV1Vy6vjMrW2E+/8Eu2tgn/fJYuK4L6xwu5UF4Edk3ghqA+l5u?=
 =?us-ascii?Q?1SAh+ONvukgPwPq7mXq7uKI+wLlpkfkpV3+pqAx+NuBLoHff1iFVoTZery1U?=
 =?us-ascii?Q?8ygkiZJiE9SyIdHRZ5D9SP2ksErjANjB4n9PSa7Os2+pgecmS7R9LPhY3ruQ?=
 =?us-ascii?Q?n932bRX+nGRHmPnKeh8Ilh/Y5iin2O+yGjrkIXSU8c2mRmOdfmnR36SfpHue?=
 =?us-ascii?Q?BRD/gKlzbAGuw9hDJflEm2WJGnxRNldsX1GOy99cEkK9dxAYL2DRJPl1cDro?=
 =?us-ascii?Q?KsAeskxwgUh1fouUcpvk3WM09SKHNov7qG/SSreyuS4rgpVDlCDdhO2p8yL/?=
 =?us-ascii?Q?Fonvw8qZFnUQrP51SUUcBOElcaA5Usvl9jSVJ71Y5CH3EVDb0LsUpmPWl2S/?=
 =?us-ascii?Q?HCGS3RA6p9wdsBxDznNiqBEpXEF+mGKv+TuHy6sKmTHQMV0a0Q6QgMva+cNz?=
 =?us-ascii?Q?1ZLTFpN9eTVCaAghrfs32nxBTYbQyITFXoH7uZNxBvTftcA+UKANXiB1/nCX?=
 =?us-ascii?Q?U0HnvhhbLWVsNPpXFHFzoD48S7oFd8dWM11XzUHJXf1cndpv62VDprzApa+O?=
 =?us-ascii?Q?wP23DX+jvZBgwxqmqfvwJSp5sYrn+AQqNLnK3tyrvVuyjwmZiLRg4tkxe/sg?=
 =?us-ascii?Q?3u/w5TbHFT1h21EIBFGs2iKpOBshaD/snBm3ljv3cJUA1fUYNOvimeenDfty?=
 =?us-ascii?Q?LHmPeaXTrb+DmBBTePBqijbgj2/HryWHMAQgRNBmLvvpSNXitYIPfaRu1g9M?=
 =?us-ascii?Q?MjGndXRvFGaq4yADOWqR8M+XdM9YQE18QYRH5qzDkXzoPgzB1XERnl8t1tBs?=
 =?us-ascii?Q?GlKGFGdciUz2bkzSaKcj+iVGRQMcVoDFKcUwA7JY0neNyHVIggkEQXOQCte9?=
 =?us-ascii?Q?llESI7FD5IoizOfOa8sdefkRlnji0LVmNWbAOvZq5TKtMBwOTeQdaq0OWhkS?=
 =?us-ascii?Q?Dtaa6cb9bv2+GUu6oJuLb1AMqdLy5pcafkD3LmcW8kNzhtKzwDCjBmYZr1L6?=
 =?us-ascii?Q?FxCb3PoRWcWNYI7ZVdm+91EXTLJb9TK5QFNCFHqq81aTXBrheIhNnfjzqmUJ?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7cz5s/qdlxIYfTCatSMMOqLP9dm7nilLaSTYD890PUS+0kaNtqfmwFqntcVvkxE9H936l5InQoFxS/aCG3/v4+716PwKG1ve4AZIweZtpQ635t2u6q999Ha7gaN4nbIk40HKeigoXLV8ljG74dyO/uEBYUyozQexMZapOy10hYB4GHgDghda+gBosJc8yPy7o4rVLN9t2EUTx0PmAYD52L1UmgrMQetkAeKprVAOBoVvDSqY/zOOAgyRhCxrebK1DPI3goyNsa8QBc1iNeiKkmKQpfQygqNXCH9jlWsfFRQFitZfARMs+C/GRr2+mEVMTAnmAfcv6AfKJEJ0uPBZx4XkSk+cRwxw+MRVgjmTwc8Y3f503eegHAMU/DZ54u1qE16g4AG++vuVnUZswkVk8jgNEUAxKGORhD/DLRInbrpQsJaFTUGjm1zNqEqRbV39KeStmw9pGC+rhIGHnDjZ1TwoD9Hs5OnRz/V7d7rLKtQqKTMTcx+Ssp9W2EB5VdoQCWhiaX6qxp664mZdJ8sHbjBVuwv/wlVKz1LkCHDta8/Rr7e4TSlkUplGhrrFNLRTHJ894OwqKbL0vP5iXBEYHvUb0sZh34snXYuI+P+mIVg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d887379-aad6-42cb-df85-08dd9249cbaf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 18:13:00.4955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+kRatmuGcO4+HyafcvdU1DZSgUOtt4eY3/+bLzwP/Q8CHqYTytXcrppCMbd1m76n6u76U11QvHYpq+ddjD7pvpDSxr160S6M/7C3aOi1OE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7555
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505130173
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE3MyBTYWx0ZWRfX1gdYuzMnq/XD FE524K1od7EgyAnfnoiYEUM5K0YQ46Zc+VLVrXKGFbB28Uch7eXdXERH6vmnfQiv6L3mOEDJCLb ItpkwCyG4t/CnvvdP9N10yu/GKIocuvEXStjzaICD3CBOfUxgBHTU9q4A66dLoRWsP7lrfd0h9R
 tm3htjMW5zzJmfajcSNXeuAvK0aLIStn6n0ieFBs5/CBRPIeqoJniNVpaiJLFQaU3Nh57y/8H09 IJKvAj8uGjCAwBge/imVeG92sLCnD+gg+3J2x0wKXL5I2OwNZC9NCV2L48xD3H0X+bXdrxn8+vR u7+aJxnw2keKU6+q8vxdGBeYQFYYtKUCLZ9NgLxrMCAwfIt3ng6/lrWjcl8oWt22xGiOQ1cG5lj
 1Bun+WmNHGfT4I/BKnkh5msBnePZYxBpciQJV0YHf3QltZZFmZFKGy/YQNFjli3mcc6pI5u4
X-Authority-Analysis: v=2.4 cv=VMDdn8PX c=1 sm=1 tr=0 ts=68238baf cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=tHa68p0SAAAA:8 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=ph6IYJdgAAAA:8 a=37rDS-QxAAAA:8
 a=nOxXOvtx0BQsksFG-DYA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 a=ufIsyHvWW7FwcMbVRpPq:22 a=HkZW87K1Qel5hWWM3VKY:22 a=ty6LBwuTSqq6QlXLCppH:22 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-ORIG-GUID: S-5-EZHVhBHToFQERxUYvvu4npImpn2-
X-Proofpoint-GUID: S-5-EZHVhBHToFQERxUYvvu4npImpn2-

On Tue, May 13, 2025 at 12:21:18PM -0400, Gregory Price wrote:
> On Tue, May 13, 2025 at 05:00:07PM +0100, Lorenzo Stoakes wrote:
> > As part of the ongoing efforts to sub-divide memory management
> > maintainership and reviewership, establish a section for memory policy and
> > migration and add appropriate maintainers and reviewers.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >
> > REVIEWERS NOTES:
> >
> > I took a look through git blame, past commits, etc. and came up with what
> > seems to be a reasonable list of people here, if you don't feel you ought
> > to be here, or if you feel anybody is missing (including yourself!) let me
> > know :)
> >
> > David has kindly already agreed to be co-maintainer for this section.
> >
>
> Thanks for taking the initiative on this <3
> You can feel free to add me as well since i added weighted interleave
>
> R:	Gregory Price <gourry@gourry.net>

Sure will do so when I un-RFC! Apologies for missing you off, this is very
fuzzy :)

>
> >  MAINTAINERS | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 80aa09f2e735..29d73593038c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> >  F:	mm/gup.c
> >
> > +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +M:	David Hildenbrand <david@redhat.com>
> > +R:	Zi Yan <ziy@nvidia.com>
> > +R:	Alistair Popple <apopple@nvidia.com>
> > +R:	Matthew Brost <matthew.brost@intel.com>
> > +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> > +R:	Rakie Kim <rakie.kim@sk.com>
> > +L:	linux-mm@kvack.org
> > +S:	Maintained
> > +W:	http://www.linux-mm.org
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > +F:	include/linux/mempolicy.h
> > +F:	include/linux/migrate.h
> > +F:	mm/mempolicy.c
> > +F:	mm/migrate.c
> > +F:	mm/migrate_device.c
> > +
> >  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
> >  M:	Andrew Morton <akpm@linux-foundation.org>
> >  M:	Mike Rapoport <rppt@kernel.org>
> > --
> > 2.49.0
