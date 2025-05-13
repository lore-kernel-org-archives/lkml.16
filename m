Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640781A23BA
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152137; cv=fail; b=Ah3M6e2W8D1thWx4807/91kKnjmo10+g3ZtPJuLf9za7lXhuigyf2cp+KyWGn+Am1Eh0YxQnN4qNVBrzKpim03yZUkEQzvrh0P7BI8EOnpf+OQ1esf+xU1u/Lfz+401KtQexEr6i5vUI2JINL6PQbtgfhJ1b3mvquwZwUj+pMUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152137; c=relaxed/simple;
	bh=XY4QAUeUDf/APUUfGYmvafDobae65cJH54wMJ8loeOI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XgFGGstDBAfjlvr6E0KtrBgCJoJBmnxZUssB3LB7ZnLYwwI3kNpRAXXZrVc71QF8Ij5TeOI/4ec6ARJW9rToLBZhndQSdUZE4YjltFGUDImm9zpNIAZ79pKKZXnxD7IfUm52JoTcFejvRoDS5IUdj5WROpvlzYhyYKc1XICRHKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=AdrP/iDa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sL4rmDsL; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="AdrP/iDa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sL4rmDsL"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DCHK3M030357;
	Tue, 13 May 2025 16:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=3B0EUGRVDg1MiUuX
	mA1ZjCbLtlHyPMi2IwKYkFEWVWc=; b=AdrP/iDa8tqU0F6tTZBGlX7++gK9qGqy
	/DZSDUqBq3+ACy8MvRkHBqJDtJ1X8kIMDcZ0i8oW/ga/oBPXwdiG+TjEk0okQ9CN
	vcVZj74VMzw1sVIaR47bc6Ta5wSKCW9OS5boyIVLzvPOb5JQJ5O+gREemMTvFWD8
	kBWMDO59F6eef3v/dreyudJxm3BItTeJIetvU6YP/AieaTzoeuFrNCfoUSdxoNCr
	NWcfpetzjTsqyzyhkJGlcn3uRM6/k0v33Hj7ntIotKj1m5i9jRqRgxNu+L1ddFet
	oo9LMJOBBxC0cWF5bP75PE3S2f5HAJ0NrZgZSl19Lm0rOKc8Nzk9kQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j1d2d452-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 16:02:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DEwgdr004711;
	Tue, 13 May 2025 16:02:01 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazlp17011027.outbound.protection.outlook.com [40.93.6.27])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46m8an339r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 16:02:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dEQ7HTp8wTG9pgK5d4ikXNDBB+Ma5KZ4Wd/WVXEXQh1aERP2KLHkC4WDNx4j4yb2d6JPW0Y9zQm+1NwTF9cLOgzROmoXW3wPS7ezjlfOMIigWhhZZKfzBFYUiVx+Z5Ofhf4uSDdjUNocHibPEsyK/l5J5nmOZdE4bry3lEjOctix5UxSJVu7tachAvjU6jET9FuFXM7OlWYMXKeM2X6W0VjRyBrjupjG5ThxWu9vYoYSbbSD39ExSWdeTDblGsCm+SMc090FKuTW3vL/RpU7qEn43r8C3tdO3vh27x/wIz6YajZPTHT4Oa9oyH872MwC604HRi0VbJ/ybzw9xvx2og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3B0EUGRVDg1MiUuXmA1ZjCbLtlHyPMi2IwKYkFEWVWc=;
 b=J8Tz/FBhTTOMNJ1NNdc+yefGfpCHcySjbzv8yZMMxs29dFBfu/UM1jZpjsmRZ120FK2F38W3YK0Ie/bJRgehmP8RYeifY+Cd6X+RfXgwqLCzxQei5Ey8z86veczt9+FvcWIN+NN1ByUDrbU91FjaGMnPsFVbY3t7WijUAv1KG1NSJtBAeZtohgQurC3vC8E+1AL5QWfgJohaOMS7Bq2wI3DId8yZ9DfEBdiqXcWKrhFaVnUv/EZJdcsMKnsX7Z2KNPr/NQfx+C+qH5i5mychKH6WOXs16b0i5RRDJdDIXTSuCUmbegEjyAmWjTHGtLuH3jWl4ZE0ag+UOzWKTPrsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3B0EUGRVDg1MiUuXmA1ZjCbLtlHyPMi2IwKYkFEWVWc=;
 b=sL4rmDsLmzAmMKu3nu6kPlSBacxCOngZDbgpWLgQlSL1xaqhOGZDSp77f5iV/1GU0WxLaw6tJUVFWSFdg5NmFg7umCuNZY6FGWBIryBpzKdm7HJXWGPj2eO22TvJhNW78IFPrJM6xdR81SrSUl8jPhs/8HD/U7fgWnLhhnCV2zk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7332.namprd10.prod.outlook.com (2603:10b6:610:130::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 16:01:47 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Tue, 13 May 2025
 16:01:47 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Alistair Popple <apopple@nvidia.com>,
        Matthew Brost <matthew.brost@intel.com>,
        Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] MAINTAINERS: add mm memory policy section
Date: Tue, 13 May 2025 17:00:07 +0100
Message-ID: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0280.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d04f26e-d23d-4623-b5eb-08dd9237771e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fu2/6jJRZjY3/JerdaStjfoWSq/NNUfATyCt2cAcs9RXKH1hdKZW1L3PF+r2?=
 =?us-ascii?Q?2N7KyB2GANZod7NnrdJC/o3tHqpOxwVsshss8xJvC0PupQCV2mrjjEcW3dfM?=
 =?us-ascii?Q?7eAWP//TQ+QMQ3jcJdUFsDiqEmldSF9mN/A57rca4xDh+++KKvfN2pzdCG/1?=
 =?us-ascii?Q?qh2hjq7jXVmep8cNJzzP39w1d5jjNexVF97oSLmLxppVrVJ3ytYNHAndyr5V?=
 =?us-ascii?Q?8cF4ehKSlE9SsZxHhnPjPGPuAJ9kzm2fMRBcV+pl8YhFcdM+rwK+Jewz0Idd?=
 =?us-ascii?Q?ddQvmjY2UG2gEzvhucGQxVofqcyMt0ORkmIL12q8i2WNW33iWemXwGPwtYG9?=
 =?us-ascii?Q?U++45ph5PlI5CW4V1649Fb25Oy+G1kRQRPhqo9KJRjkzKV6IV1WDwPq/yKmt?=
 =?us-ascii?Q?3f7IrpdcKWsXCpHUIeSyWv1rK2nqG6emjWnAzyB9WWn3FJYqtE3fC0wOijBr?=
 =?us-ascii?Q?ffCMb6oZn78ty3TccpdPbr2JwES6slGrl5G2TaInDR0QSm4pj6rKYSWwaM97?=
 =?us-ascii?Q?768BPp1Ner8Hy0bnyw9TIOpajLZ8Ya6HNv/T8ZQD0OJ2P7pfjJfZjKoSz+ht?=
 =?us-ascii?Q?gcxVB83VZAWaSXLCUTnxCT0aWk76gjdc4X9p8NEv2zcwnaBLRs257s3izsk9?=
 =?us-ascii?Q?yDnT0Mn76tOjBWfSt2Qr1BNzXbD8H0ukFPwRDSVIIkJ3D0ygQcwT2fejHrcV?=
 =?us-ascii?Q?1XQQIesYUf1A8LG0HLuv4CPzXMFe8fVU7VUR55BwoKPeRKqeBWhv679d73Gx?=
 =?us-ascii?Q?s5j+WfKRF1QANLcm0/aYd3M6HYIkIZ9vM+WGo2bhnISDZO8xP+ewY07gUkNo?=
 =?us-ascii?Q?aIC4lqmCNQF0xfJEau9YFn4etWm4xqp9UxASzWH6xqkzbXae/fcUY0eYfEgf?=
 =?us-ascii?Q?YNx2OYPR/IGuBjEQreNNDMze1PK8E5feSwBxfEhj1BQEUkYtLxwUhmP2tmIx?=
 =?us-ascii?Q?avk7wf3ylwKGuHsDL/LyW7Kgu54J7BEVzUrwU5j1s7/c0k/hE/JzSsQI8AyX?=
 =?us-ascii?Q?qEhp+PA4lJHF0Yn4SvrhsKGraZlrA03f+HiJ2LqKw/KC6v1vmeUO068Pnq1X?=
 =?us-ascii?Q?tcEJnCSkunpqyWHykDwzePq/XAVhoN392qrmiJ56dbjP0AvoNYGZ10drUH8B?=
 =?us-ascii?Q?5R50Q2eSc7Z/A5Q2/DoHmRzrjr0mZWnOAdg0lwgJTIgEvgkwMLgzwZkI56AA?=
 =?us-ascii?Q?R9Je58JmvAJIx2fTJBnByUekL69VxOIIyUgxjpJB2oMtXZpkqd9K36kAV/d+?=
 =?us-ascii?Q?hMAvHdqmujudRoiNuKJAu6+ZVwmhTt5M2xVGorK/VeQ+/stWe4c2A8Q3Bfw9?=
 =?us-ascii?Q?qmfxuf1pIuSh5s0DCReNfuZnRrtmsV8NTfcKRs6T2fILesKPJ7NXuXe8hS23?=
 =?us-ascii?Q?iCo16BQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?F3H3oiGpjjGJIKBjNx+fzDWvJskc7SS5VYAczJOAcBUnw9umU/3ZwlcXRVuP?=
 =?us-ascii?Q?aN11ILfhMsrUD6jQOUr2TAynPWkbRq9CmJr9ghRh6Riyhaqz7k1xVFtblv25?=
 =?us-ascii?Q?7+hAs+rmVzZbAe8pPQQgAP2ao7BmoxZy0ptR061OTmhqt1X/0p09Z2b5IWB7?=
 =?us-ascii?Q?yT91CbKZO5D+IlPjVPGPINnhk6Dj8hsQEX2qKAFSGDNqjY4XCWp8fOhxKKHZ?=
 =?us-ascii?Q?DwjVn2dvAfa0dSkA3hbEKi+CUmXi2rL0gu92bWDitYd+ws4cjIkD9UKrIjop?=
 =?us-ascii?Q?w+usGSyjUkDrKms0IgxGjKw4FqXqT+AGuqW/un8j2MCo8E93HEPQ2APIHR1d?=
 =?us-ascii?Q?FjBkF0RN826GKOxrqgLrGnSPylIZP2Grn7ivhX/nqytCAoeOFHml6sxnDTcs?=
 =?us-ascii?Q?g77Zjsa6n3AiLXdpKUOb/CiS5b4scPzYhHqzpIpF6jhcOtrcGuUqiw/fqSpX?=
 =?us-ascii?Q?0+dEZXJWXFTqxntO2VXO+8AxrC6tqqOwn+M+/mvYTWA+nvkEW1uQEks/DfOj?=
 =?us-ascii?Q?qiOL5fJ8b8jgeH7HyrmBffNzdFdX3NWIB4Azv5nsU9pwCIb51JfMXCDs4+YZ?=
 =?us-ascii?Q?EDzZ4AnjA9iM22Gx1lC3xyQFR+mOBtSiQDB5sQcKMl25YxISYDidcvTnigeK?=
 =?us-ascii?Q?lCXoYSFebWI/mZlQvwRCEghqn1UstOVcjLOjGxgS/XPE1c7ipP/GxcGCvnqz?=
 =?us-ascii?Q?MShdY62B5fBD5rmdX29L7Jvg+h/I63J6NbuNPDeFIOZMvJXJ+yAQ0q0crofi?=
 =?us-ascii?Q?o7n18l+/fuvSc4NYluMg7AM49NFXKIrbPmoXhUCps06KKcgSbzG3IjlQF7z2?=
 =?us-ascii?Q?DslA6/BS8TmEOBKnz8zBiqo85k9dBTPsm4yngXkxnRtyOWJloXShyXU4z9Wo?=
 =?us-ascii?Q?dX75335VV68No+E+YLSFjdOWc3pUILgh/kswH0ZMlGBuFOb/PQlXdQ9AmZGP?=
 =?us-ascii?Q?kSrPbCadj2E3hPwpf/LYp0DUPO7wXMqQXb7tH6fGIqV/oSZRWC3BitLOpk46?=
 =?us-ascii?Q?dGBnuGXtbLMTXsV0LLhcWvx+34IA83MiIRuuocKoD0VtHAamcRO38tDzwd2k?=
 =?us-ascii?Q?j2UJ8V/Oht/T5vOgiUtZCaKnmBomPW/QEuz7x8ULv94btHnYpf+bWp/M3gt9?=
 =?us-ascii?Q?Y+TAtvGXqFRTXpwe4RMRxCpoYGlTqWV2a2i3x27Ma01G95tnJvsmtA/J8LH2?=
 =?us-ascii?Q?u0dUMl9KkrwBmTSSuTnadjNq2sZ/7CVX1qgLV3+7Kv/2rDQiSRk84X3ptzow?=
 =?us-ascii?Q?NdLipQwsEhkDc9YpX/uZunQK4Y7y2glSz+n2sFbF/xwt/iHf2YGTSzmxEd0p?=
 =?us-ascii?Q?nKWWkPADLK+IGlD/NYjs62y7dc9zxNCQ3jFNUYj85rs3UgSBPwl2p8G6vByb?=
 =?us-ascii?Q?EzBlgpsLK/aGfOK2Zft+PoEECsCcID9tj7k+QN9Wtft2bImIyBMFWwZeEZKD?=
 =?us-ascii?Q?ZnYyV+O1SS4pG+qpF83XPKKd2vWcbIir3gaYvk7o2xlGlQ194YRsa0WStOGS?=
 =?us-ascii?Q?8NYwKtx6Fl9u+A3CGKml6hoBi5NZ/DW2kaLp4KU3Ncrmn6B6rHpNpqrZfmiN?=
 =?us-ascii?Q?Ov1lKAtoQWa/fnF0GVtLQjFsl4bXbFkKYkyzd2zjHnfxFc1nHQERAG7dd1JV?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UeSaguOK631ebFsU5LHIpQAEBW982X4k64ALNQMEmysP3xjYa/DltI98sMtgEcSH622nAE6KrTXfhxRV0L3Tg+fjIelY/3er1jczdYsesEGMGksAPSO59ezxbZ2gLHqMJGJ1JMZ3y987G3uwtcuAyRvWblnrbyiUBRFYpn2n1xurpvfWODqY8h0vdZpq01S95xhYCy3aiFQcfs5+Av/zT1XAzvBh+aMJQFn8DAiqiUVqIpbYQaYMFUS49Vl97DaCJajCYdOEytjywfW01M1/NDkUZvD4vWMPPdfxtZjIjwMTiQzDP0yp6f9od00W62rEnOYVPA6Zprr0S57QNaXnXaQqXvBwXuZP2xELECrWm6jD0wO/N1ancBzbBQk97irCq6po6XyTV3EjitRT1WI0nIw8e2gl/wjFHw7IA8epFqParq8Xz0StEYGGtETvE4OuzztixNtwxpqv4Q2sY7P2Lvphr8OmXx1ddbU4GB7FyJBlJXM1wUHQnJa2yY0Z0B6y/ifUD3PDjNaRYIK1KTAHPFs+ryasyIBw+s4dsNKh5DumuGioknBrGrG6tpT5vJPv7VT/oiSfrNVH+5eM2EIjIrU4gtqimZk8DAWdQkKXALA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d04f26e-d23d-4623-b5eb-08dd9237771e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:01:47.6753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WocgwCZOpUcY+hiMZbPHgdZPJBwSlHW6d+8QFN0MhmkRRBucx+JweVlQmwWrF1qorfbjHB4W9psFnnCv1WSnABwsC+a8uXeklOPgZPS0kGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7332
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505130152
X-Proofpoint-ORIG-GUID: 0FrczWi3c9u8SZ4o8b5ZDnsvrLZMqL3M
X-Proofpoint-GUID: 0FrczWi3c9u8SZ4o8b5ZDnsvrLZMqL3M
X-Authority-Analysis: v=2.4 cv=XNcwSRhE c=1 sm=1 tr=0 ts=68236cfa b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=ph6IYJdgAAAA:8 a=37rDS-QxAAAA:8 a=k5B3tY0lOcjbKfblq_UA:9
 a=gK44uIRsrOYWoX5St5dO:22 a=HkZW87K1Qel5hWWM3VKY:22 a=ty6LBwuTSqq6QlXLCppH:22 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:14694
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE1MiBTYWx0ZWRfX+6mI8FejCX5N OM9Rf+jgFQLXYFK7GeUZJ2/OZlfSlOu2E4ISpZZWSOtJsSIqRiVttk7fPPS2f184jeRCU/lD814 gx0PUsMCZmT2eze+guJXmRXfIM59enxiQwKewoJjJ/NaCTbv5oxwKLhQCzJUCdyAavHPYb4TgT4
 yFAI8GR572LVEYoq8HPHFoNCzT32xN78sxdxLBLxJNovpM922WeITKjnTeuliPR/3gD5UoceCO5 wBIumfTzWSUZm63g/bRdmdxrTqjqGXrMva2xuC3/kn16wDPejuarngYl03ASlEiEkIrYH8Lmu0s Xz7pwkdCGSUZ2wJDSZIdQAruUEjpQd1Vnwd3LMVWp1KYViFqzZydWkW+FpK8KNI2A4ObpjaYLMc
 roQM/kY9px4vj4BPoR1aWM6uj4ecx/UZos5jnqeiazJVbl0rTQZPcoTvP21Ws+nRWC50PDM6

As part of the ongoing efforts to sub-divide memory management
maintainership and reviewership, establish a section for memory policy and
migration and add appropriate maintainers and reviewers.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---

REVIEWERS NOTES:

I took a look through git blame, past commits, etc. and came up with what
seems to be a reasonable list of people here, if you don't feel you ought
to be here, or if you feel anybody is missing (including yourself!) let me
know :)

David has kindly already agreed to be co-maintainer for this section.

 MAINTAINERS | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 80aa09f2e735..29d73593038c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
 F:	mm/gup.c

+MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@redhat.com>
+R:	Zi Yan <ziy@nvidia.com>
+R:	Alistair Popple <apopple@nvidia.com>
+R:	Matthew Brost <matthew.brost@intel.com>
+R:	Joshua Hahn <joshua.hahnjy@gmail.com>
+R:	Rakie Kim <rakie.kim@sk.com>
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
