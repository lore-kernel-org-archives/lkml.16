Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD5F1B87FB
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738326737; cv=fail; b=VTpalDR9vYOVT37jJ0aaKY6mHIBNWZyKsT/scU/NJwFO67KNeIWbkINJTALj5YFHquMqcqzeUikUqPCYlKvxhJPR4Lv42vp4P9Q1Srn4eW2TprWZX0VS1XZqxzOP78odi3r2YRROK1quN6Qvr5mDaPuQ4VWff49aQMhM4y6bYps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738326737; c=relaxed/simple;
	bh=gZdQF0GLmZS8HpRkcztsKnV5Bz5FZWab1n37eSRyU6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=udW3jPufYhVYuyLrC7uglwDEwV64FlbcbTAHkaBUCzhJireffuGAfL7Wa0k0P+bssCwaSRJ4BONVkIpqaI/NnBU7OEzfSk568866cN5rM2Moc28MtMBH+8q9UQRDyUoDmCKL6cuQe6wTFqhS5xQG2Gmr8Am9qKas9tdBi5q+474=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EkIutl2X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GurES7oR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EkIutl2X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GurES7oR"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VBQrbb003991;
	Fri, 31 Jan 2025 12:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=DilCm9XBnp8XWMupCy+6NTrWjbHp0vBZ4/BrXG1qvEo=; b=
	EkIutl2XDrvFU+zwmheWg/VLK428esqWLhiRStskmIHUgcfxMgCD3YYFwWsscrBn
	Tcx/T3krvQswxzEyqspeJmsMuq1iTbj/fK0k5UWkgeDcGottLY2Pdj3kkGWluxAS
	7kqx6mflxgO6Jj2eJIIZH3JI+FLJmSYKxB5YH64UA72Vi1L+agewlBHXyvY46DbD
	wby9rlPPkKSPQHYCPJR+TxxhhgEk2f8RgfKXxkCpnDO4UBhh8Kqn1LY0hYETusmR
	hfxhdV8ztFEuo3sN8k+VWM18wZ03SUOT5v9QyoI+YzdZ4oPfwPfBJ47usAXuvDZQ
	jDiRoGImaM+JahWZKTq6fw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gwn8r2x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:32:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VAXwDJ032234;
	Fri, 31 Jan 2025 12:32:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44gf93vak2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:32:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/NAwZ+PQ8CVoBqdmF9Ew9QKAqMdeKmdEdgYIpPBQH6geUNkWeDE6nqITVR3jfdXbI2ffEB09riJ7Qm2j1fGkb4ZoLmgz956nASdwxgkzhCtxPyNwGvb/b+OSJLQu0CeR4jys/P/RUtEWB8APqITNEGM+rEYfmUCJFaWlIxui/l3Dq1ANL/L2uPntyKo8UATfNyky0LtkACAOfxaaGgWBq4F+VDwMJLWZJM6UHymKuxPdfLyhadeSlt1cRf9ZLi58Ye9pxdl0TEVVL/XeKjkzPOZVcgyVrXpAk5ESzf4VC3vhcFnwVQTUItD4odDn9kyZP5Oiuj1pbBHu9vdwnPlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DilCm9XBnp8XWMupCy+6NTrWjbHp0vBZ4/BrXG1qvEo=;
 b=gTVLqo5mMsS9jdyMkVBXTvRhoYfPIt63e7fqpS3XWu+X6jbchQ7zq2CxYHADW1ePp6eHXgvox9uVCh5IbFghf9VM3gNhm2BA5z0qOOxL/xHrKhVkiZchU/zSwXMSOjhrPg/l/AUXTPbdVLeeyyrdotq0SNWrfAe+zCf6s0Kf0QxOKLgE8OuCQXax6mG8/iFcxiesn3bXIx4oIiGVCu6r/feICEBGgP8sd2BZxCVjjVyXcviTWnhGifDqGn8UIsiJw6ffGPvgpcA1U56TucgjN9xQ4NgSM0eRpJl7sUjKE+4gz3fWNb0F6fqO2Au4AimSTlJKuTA+Ofx+3D8dJvtXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DilCm9XBnp8XWMupCy+6NTrWjbHp0vBZ4/BrXG1qvEo=;
 b=GurES7oRjENTSAnxXdejqMR8+KXxh9gt6ljTAo02Bq2qZ/mEh0moH/hC21tr4qc63rynOXXNEcBhTe+gv080Vq6m0GnQL/NT7ly7H20rMTw8/JQ+ff3S+98EmISbe7qdB3t2qr4wtkBh0NCXi7YKhLR1PRXKfs/wsLY2KZgOP3g=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH3PR10MB7741.namprd10.prod.outlook.com (2603:10b6:610:1bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 12:32:04 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 12:32:03 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] mm: simplify vma merge structure and expand comments
Date: Fri, 31 Jan 2025 12:31:49 +0000
Message-ID: <4dfe60f1419d55e5d0516f56349695d73a57184c.1738326519.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738326519.git.lorenzo.stoakes@oracle.com>
References: <cover.1738326519.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0162.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::30) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH3PR10MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: a98daeb2-6312-486a-2fe2-08dd41f34461
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QxV04QCbiaEz+iDG4WmCAXnzjpmDWRT0gZWIiGCJS1wTjRJ/9mi0J5NEa9n1?=
 =?us-ascii?Q?VQflteJI7EzJjVlD0+Djzou0vwkl7CeQHKLYPqjh/mqpt86qw1xLYjf5qXr3?=
 =?us-ascii?Q?LVc+IyqYXPwaMf50r4+jNnZrR7KGtKZ8etE0MDjVuuL55Zw+YCgViHHo3Sr9?=
 =?us-ascii?Q?IxqNVb+pnuP3lVQqdM2hv9mNXCYZ7Alt4ULpb5FuSif04F+GaBRHZye2T6tu?=
 =?us-ascii?Q?LMyEuq5M3r6NVCkYWY20PIZp8lGSQm0FDqoYMlSoZf1ws8Bm2n8pFxY9BDWi?=
 =?us-ascii?Q?cuNgaXLEVr2NmhALKyVrsOF3h1QudI7Ng04MDmAicZxk1FEV104jtLuPhqJ7?=
 =?us-ascii?Q?s/YS7Y1nDu7cG+CG03VrLU1bM+IZPbpZq2nIBjVIGyrmRCInOeWMDK/Q70Zi?=
 =?us-ascii?Q?CrYw/pyUUVyflnC/SqqTErx2AAxlj/YczFs+sCZPm4Nw7y4v/g08QN9EwqBs?=
 =?us-ascii?Q?dUU3QjYGRPvpLcPodugHYbB2XL58kaFXY5XjbJisZdhiYW4J/AdiP07JopwR?=
 =?us-ascii?Q?U40Jzxh7T66P5NgJ1CHAk5Ma49QUAruOWvwT12JXdRMeALCWjOMs32inuyQL?=
 =?us-ascii?Q?Me4QfgOLqBDdVJsMRQszC9Ai+jLFXN67W2L0yyTU7nw8zUxKiETALN0j2bId?=
 =?us-ascii?Q?ngjmbKF1v+0e5fWp0ug6/QD1+NrbVsLUalaufKy1mqDiWJ/4R/XxEDSkSU0h?=
 =?us-ascii?Q?mOAllWHPtEebgB6Qg/YTYesu8VMMttlLS+3L0Am5yOrj/XRppsP1fTc7ILF9?=
 =?us-ascii?Q?xdx8SeWMgMj6t16HKdYpoACoxqAAxtgsIrlrXxsqSe+3/pl4cTyZT3J22N86?=
 =?us-ascii?Q?J8sxmPuzfUFJ9di9VGKiRxgseCQsD/ugcXuj515IatKn4zyE6XCNw2u3eomf?=
 =?us-ascii?Q?owqbZwIGFtvFTR8Xezp/fuW1d/DmzCrCIMb07PIRZ/B6ueJnAR6xGNLoSCuL?=
 =?us-ascii?Q?LVIxfHAofFBaf+wJwFT300CsRp2rL4+AKXfbhWK95X9VhfBBzfQeE2fod47f?=
 =?us-ascii?Q?QqdheTkxoyHWbne2DiI5Bd581EaqosqmLyzKsc2/xvG/VzDf9JcGS1jnGy6e?=
 =?us-ascii?Q?o97AhWWFE1s/K6e2DGsiw8RZ6VWM6fClfu6sJgZcNw9cQ7j7I4IqPfGRlKKe?=
 =?us-ascii?Q?3WHUbCoRSrBgxg2IgCHh1TZUCcXul7t8458D/qt+wRf98TK30RPGQQ43/qGJ?=
 =?us-ascii?Q?oMOeS0BhkPVhxuWkCSDUzGTGfeohSEQQQSy/70RoqKV10eG2UjE8MtyRurfb?=
 =?us-ascii?Q?+VDV4khUuGxJiizOzNPRD4N29KgaajMwVreSPEcAYcXkuhme4R3pOI4FUqAD?=
 =?us-ascii?Q?KRd4mzScD23yVm2qEorFxPe0bMRO3xQtl919l2E699Sk1XsBxWYsxVdesbhJ?=
 =?us-ascii?Q?jFb0PplUxhuj/zSwD9l+2suwOZrm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?geOHrmLFEKb+oc2Z2ixvHUm9HbB4ovGE+fCA9lJynvyMLorXfP8IPWqeBJfm?=
 =?us-ascii?Q?5yXvKrquxAaqfGWUTbkXMP7SHLzME/j942mY0pMEAbWxVOTPvk5dgZ7sABEG?=
 =?us-ascii?Q?i09liW6tMelrB3dcVTLEwf3f/b3O3Xh+pglL/3n3c2HL4eZj8gJbVrn22kSZ?=
 =?us-ascii?Q?UfxChRYpaq6yMV2Ta/qBi33Z8+HQa1rCnY5JAKJHvPiy6ZVphnIAwoOMoVlx?=
 =?us-ascii?Q?+rUoe3hmcs3xrzvXKQRipP9+0oS4ZN5uG6nqCJ0NPd9T6K6hgBwBzc93uecD?=
 =?us-ascii?Q?DPH0bPOIJuqgxJNjDA49qIKre/Q8QCkhB22mrXhTGeG3H60XXyz/YUiZ6VFj?=
 =?us-ascii?Q?MTfeFbrB6Hx6s24eDKoAJ8Ez0lQepIwBhD51zpV5AAgIEidhwWUEACcNA+U3?=
 =?us-ascii?Q?PsSbvlvc8WFy3fFXe7sjZqlxHY6s4Zc/MMZxFwAjXJzq2zDRFgNrBj3OW35P?=
 =?us-ascii?Q?abc/MoDF/5lAGQWbEka9/RRp5lLjErgc4yCvJuORLYEQgRejKqIBaLOuFQbo?=
 =?us-ascii?Q?iqLPHUNx/MxkqFUdmLtsbdzZvf1vSyeq1kKatycRaJkAw4LWmLOJax+DOFqJ?=
 =?us-ascii?Q?85LPY8GSbL5wEmH1QdaYyHSPmIojAwgYg1Qa1Oeb2elnUmtCf7fWkaeIBdWK?=
 =?us-ascii?Q?0ifuekH7a631HKLUBU021qgpBjlSjt65s4nJTLrTDIOd3el34l8JdHbWW88b?=
 =?us-ascii?Q?mUotkM1tNSTXdPXuhGxNLBUrlb1ts5yrf/gAH+ADPtmnyBKTh6ncx5eyfMLg?=
 =?us-ascii?Q?AyR5OS5xpueRokPNnr6rzOc2Skj65JRsdlzSCnWvNPWmYFp3ukwR9Y+OvPIv?=
 =?us-ascii?Q?SbNgPtZPyFn8MplOjpj+2Y57bal54fMicHbDURFp3oU0LQpcGB+711tUfCcp?=
 =?us-ascii?Q?ES0xRRVMfRTlq09PS4zIQ07Fw8TlRWmWzR2/i0G6NzTR3oreshYlSv8zxqdk?=
 =?us-ascii?Q?NPTWugf46wl6QP85PXBHH+aPM7z26WL/zOEZ7tCUcZSpEX2BL5Wmal/K9Osg?=
 =?us-ascii?Q?qQZa5ys01IbEzbiRvi1BqruC8AJxTexNWZwe4YYVolIPiS8f2k13GSlCU3Ch?=
 =?us-ascii?Q?lgn+VwT9KbGLj+0Urpv4xB/xSAE4e0GyPdNgVOXTwP/Ycf7p9eEpY2p+2gqD?=
 =?us-ascii?Q?WUmZKQ/T2a1b2i/XkeIhkHH2sO2O35YopQfiW/wHEBL+uvkdTFa7apUrBL9Z?=
 =?us-ascii?Q?EU56I/1ilpiHgP8CFSS3M/II/y5T6G8D/ZkcpzB6iF/29RJ5RnCCbRZTyy9p?=
 =?us-ascii?Q?6V4rwbrj/P2S5/HrgAVzRc/VVPrvgyzo4kIPPhpAtrQ4CamCk2JOpBhBtHs9?=
 =?us-ascii?Q?hZATytUS9ogiJ7EtI0P0f4AWrkgu28x9L1zosupCsrLX1SoitDVP6PcMxyXj?=
 =?us-ascii?Q?s2LmiNprqAJQR9Wkbu2z1AqZi3K+qmprsFjJIgrqSZSifZXm6offSPge9BKl?=
 =?us-ascii?Q?7XlQefIaqyYwI8vR4Lga43v4gK193nYQZm1eAqAGX2Ovin13hrZu0lkQyEop?=
 =?us-ascii?Q?ImVqrk5mzWVlIKh+/I5e4weMEmaSt51zEPEN1j0QkYOewgDLlk2D5q3I8xbt?=
 =?us-ascii?Q?2aHsPNFehL5lNg3FWVmVpOHZ8MgLxZjDKLxHLP+DeFrNmsG9ND3n+Zr8hxkT?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9oXlt/8IZnHGBPV/S13hc5PmqhYZv+CY3D8WTTyoe6gsJehd4GbCfNj+Uo8lFqvCNDFwueeyD1TrhTVWzoX9fHzkaGSQDj6GXOygGztn13BzSiXhiO93h5AXKueC7gj+7YeF1utSLn7/Zw6qOO0OmLa9pXUC7YtVuRpj2w1v8PnbDSTrAdt9rKZOvdRdla9h/CUuKayvzm7l6DesdJ1LbOvphLU+fQGhnrmQELjA2zpobUy7f8PmTOq2+kxKb97fWNCUeHMRluMGZcLvnoJqOAzQuv5IhKnOJAqnGpcbDhxBK/zpPmcTJT9IZMFHarwe1PmvIdTQFPBia67IkdeKWBHRbe0JVCEUOS1amtU3X9Iuepa84DJaDLthp9pPlEUZVKeDWqmm0Rc4bK+KGRje66vBrAOO8XZT3ZyQStycGWYNc+lLHVdKm3umuN8r+VB2/DqTjQFSr1GSCrhkvr72AVVcTTfbMfX/7o+KB+Wd4xtg33qbxqbOn0Qv+mytZbiIkiPjGWIj2SSTAPk4UickPea2FuiSozPqkgwRtnpgls7zvYsfbQz88SeymB1/+21NInH9ObpWPx2A0zFfOFc03/Jv/9gD9niPeNncnbcQdpI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98daeb2-6312-486a-2fe2-08dd41f34461
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 12:32:03.9105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KMmTVvRfCmdPGo0QzghNBpBJY3dBIOiWNpdIg78m91Cl4RUxwVnXFaAEGKcO8f44xb/vZZWEqyXDMKsaA099ve7deHROPvXpQmu52+PbDdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7741
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310095
X-Proofpoint-ORIG-GUID: -yQI3j6Th6V0p6AnlsaaGOE67YH4UWA_
X-Proofpoint-GUID: -yQI3j6Th6V0p6AnlsaaGOE67YH4UWA_

The merge code, while much improved, still has a number of points of
confusion. As part of a broader series cleaning this up to make this more
maintainable, we start by addressing some confusion around vma_merge_struct
fields.

So far, the caller either provides no vmg->vma (a new VMA) or supplies the
existing VMA which is being altered, setting vmg->start,end,pgoff to the
proposed VMA dimensions.

vmg->vma is then updated, as are vmg->start,end,pgoff as the merge process
proceeds and the appropriate merge strategy is determined.

This is rather confusing, as vmg->vma starts off as the 'middle' VMA
between vmg->prev,next, but becomes the 'target' VMA, except in one
specific edge case (merge next, shrink middle).

Int his patch we introduce vmg->middle to describe the VMA that is between
vmg->prev and vmg->next, and does NOT change during the merge operation.

We replace vmg->vma with vmg->target, and use this only during the merge
operation itself.

Aside from the merge right, shrink middle case, this becomes the VMA that
forms the basis of the VMA that is returned. This edge case can be
addressed in a future commit.

We also add a number of comments to explain what is going on.

Finally, we adjust the ASCII diagrams showing each merge case in
vma_merge_existing_range() to be clearer - the arrow range previously
showed the vmg->start, end spanned area, but it is clearer to change this
to show the final merged VMA.

This patch has no change in functional behaviour.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/debug.c              |  18 ++---
 mm/mmap.c               |   2 +-
 mm/vma.c                | 166 +++++++++++++++++++++-------------------
 mm/vma.h                |  42 ++++++++--
 tools/testing/vma/vma.c |  52 ++++++-------
 5 files changed, 159 insertions(+), 121 deletions(-)

diff --git a/mm/debug.c b/mm/debug.c
index 8d2acf432385..c9e07651677b 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -261,7 +261,7 @@ void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
 
 	pr_warn("vmg %px state: mm %px pgoff %lx\n"
 		"vmi %px [%lx,%lx)\n"
-		"prev %px next %px vma %px\n"
+		"prev %px middle %px next %px target %px\n"
 		"start %lx end %lx flags %lx\n"
 		"file %px anon_vma %px policy %px\n"
 		"uffd_ctx %px\n"
@@ -270,7 +270,7 @@ void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
 		vmg, vmg->mm, vmg->pgoff,
 		vmg->vmi, vmg->vmi ? vma_iter_addr(vmg->vmi) : 0,
 		vmg->vmi ? vma_iter_end(vmg->vmi) : 0,
-		vmg->prev, vmg->next, vmg->vma,
+		vmg->prev, vmg->middle, vmg->next, vmg->target,
 		vmg->start, vmg->end, vmg->flags,
 		vmg->file, vmg->anon_vma, vmg->policy,
 #ifdef CONFIG_USERFAULTFD
@@ -288,13 +288,6 @@ void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
 		pr_warn("vmg %px mm: (NULL)\n", vmg);
 	}
 
-	if (vmg->vma) {
-		pr_warn("vmg %px vma:\n", vmg);
-		dump_vma(vmg->vma);
-	} else {
-		pr_warn("vmg %px vma: (NULL)\n", vmg);
-	}
-
 	if (vmg->prev) {
 		pr_warn("vmg %px prev:\n", vmg);
 		dump_vma(vmg->prev);
@@ -302,6 +295,13 @@ void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
 		pr_warn("vmg %px prev: (NULL)\n", vmg);
 	}
 
+	if (vmg->middle) {
+		pr_warn("vmg %px middle:\n", vmg);
+		dump_vma(vmg->middle);
+	} else {
+		pr_warn("vmg %px middle: (NULL)\n", vmg);
+	}
+
 	if (vmg->next) {
 		pr_warn("vmg %px next:\n", vmg);
 		dump_vma(vmg->next);
diff --git a/mm/mmap.c b/mm/mmap.c
index cda01071c7b1..6401a1d73f4a 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1707,7 +1707,7 @@ int relocate_vma_down(struct vm_area_struct *vma, unsigned long shift)
 	/*
 	 * cover the whole range: [new_start, old_end)
 	 */
-	vmg.vma = vma;
+	vmg.middle = vma;
 	if (vma_expand(&vmg))
 		return -ENOMEM;
 
diff --git a/mm/vma.c b/mm/vma.c
index af1d549b179c..68a301a76297 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -52,7 +52,7 @@ struct mmap_state {
 		.pgoff = (map_)->pgoff,					\
 		.file = (map_)->file,					\
 		.prev = (map_)->prev,					\
-		.vma = vma_,						\
+		.middle = vma_,						\
 		.next = (vma_) ? NULL : (map_)->next,			\
 		.state = VMA_MERGE_START,				\
 		.merge_flags = VMG_FLAG_DEFAULT,			\
@@ -639,7 +639,7 @@ static int commit_merge(struct vma_merge_struct *vmg,
 {
 	struct vma_prepare vp;
 
-	init_multi_vma_prep(&vp, vmg->vma, adjust, remove, remove2);
+	init_multi_vma_prep(&vp, vmg->target, adjust, remove, remove2);
 
 	VM_WARN_ON(vp.anon_vma && adjust && adjust->anon_vma &&
 		   vp.anon_vma != adjust->anon_vma);
@@ -652,15 +652,15 @@ static int commit_merge(struct vma_merge_struct *vmg,
 				adjust->vm_end);
 	}
 
-	if (vma_iter_prealloc(vmg->vmi, vmg->vma))
+	if (vma_iter_prealloc(vmg->vmi, vmg->target))
 		return -ENOMEM;
 
 	vma_prepare(&vp);
-	vma_adjust_trans_huge(vmg->vma, vmg->start, vmg->end, adj_start);
-	vma_set_range(vmg->vma, vmg->start, vmg->end, vmg->pgoff);
+	vma_adjust_trans_huge(vmg->target, vmg->start, vmg->end, adj_start);
+	vma_set_range(vmg->target, vmg->start, vmg->end, vmg->pgoff);
 
 	if (expanded)
-		vma_iter_store(vmg->vmi, vmg->vma);
+		vma_iter_store(vmg->vmi, vmg->target);
 
 	if (adj_start) {
 		adjust->vm_start += adj_start;
@@ -671,7 +671,7 @@ static int commit_merge(struct vma_merge_struct *vmg,
 		}
 	}
 
-	vma_complete(&vp, vmg->vmi, vmg->vma->vm_mm);
+	vma_complete(&vp, vmg->vmi, vmg->target->vm_mm);
 
 	return 0;
 }
@@ -694,8 +694,9 @@ static bool can_merge_remove_vma(struct vm_area_struct *vma)
  * identical properties.
  *
  * This function checks for the existence of any such mergeable VMAs and updates
- * the maple tree describing the @vmg->vma->vm_mm address space to account for
- * this, as well as any VMAs shrunk/expanded/deleted as a result of this merge.
+ * the maple tree describing the @vmg->middle->vm_mm address space to account
+ * for this, as well as any VMAs shrunk/expanded/deleted as a result of this
+ * merge.
  *
  * As part of this operation, if a merge occurs, the @vmg object will have its
  * vma, start, end, and pgoff fields modified to execute the merge. Subsequent
@@ -704,45 +705,47 @@ static bool can_merge_remove_vma(struct vm_area_struct *vma)
  * Returns: The merged VMA if merge succeeds, or NULL otherwise.
  *
  * ASSUMPTIONS:
- * - The caller must assign the VMA to be modifed to @vmg->vma.
+ * - The caller must assign the VMA to be modifed to @vmg->middle.
  * - The caller must have set @vmg->prev to the previous VMA, if there is one.
  * - The caller must not set @vmg->next, as we determine this.
  * - The caller must hold a WRITE lock on the mm_struct->mmap_lock.
- * - vmi must be positioned within [@vmg->vma->vm_start, @vmg->vma->vm_end).
+ * - vmi must be positioned within [@vmg->middle->vm_start, @vmg->middle->vm_end).
  */
 static __must_check struct vm_area_struct *vma_merge_existing_range(
 		struct vma_merge_struct *vmg)
 {
-	struct vm_area_struct *vma = vmg->vma;
+	struct vm_area_struct *middle = vmg->middle;
 	struct vm_area_struct *prev = vmg->prev;
 	struct vm_area_struct *next, *res;
 	struct vm_area_struct *anon_dup = NULL;
 	struct vm_area_struct *adjust = NULL;
 	unsigned long start = vmg->start;
 	unsigned long end = vmg->end;
-	bool left_side = vma && start == vma->vm_start;
-	bool right_side = vma && end == vma->vm_end;
+	bool left_side = middle && start == middle->vm_start;
+	bool right_side = middle && end == middle->vm_end;
 	int err = 0;
 	long adj_start = 0;
-	bool merge_will_delete_vma, merge_will_delete_next;
+	bool merge_will_delete_middle, merge_will_delete_next;
 	bool merge_left, merge_right, merge_both;
 	bool expanded;
 
 	mmap_assert_write_locked(vmg->mm);
-	VM_WARN_ON_VMG(!vma, vmg); /* We are modifying a VMA, so caller must specify. */
+	VM_WARN_ON_VMG(!middle, vmg); /* We are modifying a VMA, so caller must specify. */
 	VM_WARN_ON_VMG(vmg->next, vmg); /* We set this. */
 	VM_WARN_ON_VMG(prev && start <= prev->vm_start, vmg);
 	VM_WARN_ON_VMG(start >= end, vmg);
 
 	/*
-	 * If vma == prev, then we are offset into a VMA. Otherwise, if we are
+	 * If middle == prev, then we are offset into a VMA. Otherwise, if we are
 	 * not, we must span a portion of the VMA.
 	 */
-	VM_WARN_ON_VMG(vma && ((vma != prev && vmg->start != vma->vm_start) ||
-			       vmg->end > vma->vm_end), vmg);
-	/* The vmi must be positioned within vmg->vma. */
-	VM_WARN_ON_VMG(vma && !(vma_iter_addr(vmg->vmi) >= vma->vm_start &&
-				vma_iter_addr(vmg->vmi) < vma->vm_end), vmg);
+	VM_WARN_ON_VMG(middle &&
+		       ((middle != prev && vmg->start != middle->vm_start) ||
+			vmg->end > middle->vm_end), vmg);
+	/* The vmi must be positioned within vmg->middle. */
+	VM_WARN_ON_VMG(middle &&
+		       !(vma_iter_addr(vmg->vmi) >= middle->vm_start &&
+			 vma_iter_addr(vmg->vmi) < middle->vm_end), vmg);
 
 	vmg->state = VMA_MERGE_NOMERGE;
 
@@ -776,13 +779,13 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 
 	merge_both = merge_left && merge_right;
 	/* If we span the entire VMA, a merge implies it will be deleted. */
-	merge_will_delete_vma = left_side && right_side;
+	merge_will_delete_middle = left_side && right_side;
 
 	/*
-	 * If we need to remove vma in its entirety but are unable to do so,
+	 * If we need to remove middle in its entirety but are unable to do so,
 	 * we have no sensible recourse but to abort the merge.
 	 */
-	if (merge_will_delete_vma && !can_merge_remove_vma(vma))
+	if (merge_will_delete_middle && !can_merge_remove_vma(middle))
 		return NULL;
 
 	/*
@@ -793,7 +796,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 
 	/*
 	 * If we cannot delete next, then we can reduce the operation to merging
-	 * prev and vma (thereby deleting vma).
+	 * prev and middle (thereby deleting middle).
 	 */
 	if (merge_will_delete_next && !can_merge_remove_vma(next)) {
 		merge_will_delete_next = false;
@@ -801,8 +804,8 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		merge_both = false;
 	}
 
-	/* No matter what happens, we will be adjusting vma. */
-	vma_start_write(vma);
+	/* No matter what happens, we will be adjusting middle. */
+	vma_start_write(middle);
 
 	if (merge_left)
 		vma_start_write(prev);
@@ -812,13 +815,13 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 
 	if (merge_both) {
 		/*
-		 *         |<----->|
-		 * |-------*********-------|
-		 *   prev     vma     next
-		 *  extend   delete  delete
+		 * |<-------------------->|
+		 * |-------********-------|
+		 *   prev   middle   next
+		 *  extend  delete  delete
 		 */
 
-		vmg->vma = prev;
+		vmg->target = prev;
 		vmg->start = prev->vm_start;
 		vmg->end = next->vm_end;
 		vmg->pgoff = prev->vm_pgoff;
@@ -826,78 +829,79 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		/*
 		 * We already ensured anon_vma compatibility above, so now it's
 		 * simply a case of, if prev has no anon_vma object, which of
-		 * next or vma contains the anon_vma we must duplicate.
+		 * next or middle contains the anon_vma we must duplicate.
 		 */
-		err = dup_anon_vma(prev, next->anon_vma ? next : vma, &anon_dup);
+		err = dup_anon_vma(prev, next->anon_vma ? next : middle,
+				   &anon_dup);
 	} else if (merge_left) {
 		/*
-		 *         |<----->| OR
-		 *         |<--------->|
+		 * |<------------>|      OR
+		 * |<----------------->|
 		 * |-------*************
-		 *   prev       vma
+		 *   prev     middle
 		 *  extend shrink/delete
 		 */
 
-		vmg->vma = prev;
+		vmg->target = prev;
 		vmg->start = prev->vm_start;
 		vmg->pgoff = prev->vm_pgoff;
 
-		if (!merge_will_delete_vma) {
-			adjust = vma;
-			adj_start = vmg->end - vma->vm_start;
+		if (!merge_will_delete_middle) {
+			adjust = middle;
+			adj_start = vmg->end - middle->vm_start;
 		}
 
-		err = dup_anon_vma(prev, vma, &anon_dup);
+		err = dup_anon_vma(prev, middle, &anon_dup);
 	} else { /* merge_right */
 		/*
-		 *     |<----->| OR
-		 * |<--------->|
+		 *     |<------------->| OR
+		 * |<----------------->|
 		 * *************-------|
-		 *      vma       next
+		 *    middle     next
 		 * shrink/delete extend
 		 */
 
 		pgoff_t pglen = PHYS_PFN(vmg->end - vmg->start);
 
 		VM_WARN_ON_VMG(!merge_right, vmg);
-		/* If we are offset into a VMA, then prev must be vma. */
-		VM_WARN_ON_VMG(vmg->start > vma->vm_start && prev && vma != prev, vmg);
+		/* If we are offset into a VMA, then prev must be middle. */
+		VM_WARN_ON_VMG(vmg->start > middle->vm_start && prev && middle != prev, vmg);
 
-		if (merge_will_delete_vma) {
-			vmg->vma = next;
+		if (merge_will_delete_middle) {
+			vmg->target = next;
 			vmg->end = next->vm_end;
 			vmg->pgoff = next->vm_pgoff - pglen;
 		} else {
 			/*
-			 * We shrink vma and expand next.
+			 * We shrink middle and expand next.
 			 *
 			 * IMPORTANT: This is the ONLY case where the final
-			 * merged VMA is NOT vmg->vma, but rather vmg->next.
+			 * merged VMA is NOT vmg->target, but rather vmg->next.
 			 */
-
-			vmg->start = vma->vm_start;
+			vmg->target = middle;
+			vmg->start = middle->vm_start;
 			vmg->end = start;
-			vmg->pgoff = vma->vm_pgoff;
+			vmg->pgoff = middle->vm_pgoff;
 
 			adjust = next;
-			adj_start = -(vma->vm_end - start);
+			adj_start = -(middle->vm_end - start);
 		}
 
-		err = dup_anon_vma(next, vma, &anon_dup);
+		err = dup_anon_vma(next, middle, &anon_dup);
 	}
 
 	if (err)
 		goto abort;
 
 	/*
-	 * In nearly all cases, we expand vmg->vma. There is one exception -
+	 * In nearly all cases, we expand vmg->middle. There is one exception -
 	 * merge_right where we partially span the VMA. In this case we shrink
-	 * the end of vmg->vma and adjust the start of vmg->next accordingly.
+	 * the end of vmg->middle and adjust the start of vmg->next accordingly.
 	 */
-	expanded = !merge_right || merge_will_delete_vma;
+	expanded = !merge_right || merge_will_delete_middle;
 
 	if (commit_merge(vmg, adjust,
-			 merge_will_delete_vma ? vma : NULL,
+			 merge_will_delete_middle ? middle : NULL,
 			 merge_will_delete_next ? next : NULL,
 			 adj_start, expanded)) {
 		if (anon_dup)
@@ -973,7 +977,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 	bool just_expand = vmg->merge_flags & VMG_FLAG_JUST_EXPAND;
 
 	mmap_assert_write_locked(vmg->mm);
-	VM_WARN_ON_VMG(vmg->vma, vmg);
+	VM_WARN_ON_VMG(vmg->middle, vmg);
 	/* vmi must point at or before the gap. */
 	VM_WARN_ON_VMG(vma_iter_addr(vmg->vmi) > end, vmg);
 
@@ -989,13 +993,13 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 	/* If we can merge with the next VMA, adjust vmg accordingly. */
 	if (can_merge_right) {
 		vmg->end = next->vm_end;
-		vmg->vma = next;
+		vmg->middle = next;
 	}
 
 	/* If we can merge with the previous VMA, adjust vmg accordingly. */
 	if (can_merge_left) {
 		vmg->start = prev->vm_start;
-		vmg->vma = prev;
+		vmg->middle = prev;
 		vmg->pgoff = prev->vm_pgoff;
 
 		/*
@@ -1017,10 +1021,10 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 	 * Now try to expand adjacent VMA(s). This takes care of removing the
 	 * following VMA if we have VMAs on both sides.
 	 */
-	if (vmg->vma && !vma_expand(vmg)) {
-		khugepaged_enter_vma(vmg->vma, vmg->flags);
+	if (vmg->middle && !vma_expand(vmg)) {
+		khugepaged_enter_vma(vmg->middle, vmg->flags);
 		vmg->state = VMA_MERGE_SUCCESS;
-		return vmg->vma;
+		return vmg->middle;
 	}
 
 	return NULL;
@@ -1032,44 +1036,46 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
  * @vmg: Describes a VMA expansion operation.
  *
  * Expand @vma to vmg->start and vmg->end.  Can expand off the start and end.
- * Will expand over vmg->next if it's different from vmg->vma and vmg->end ==
- * vmg->next->vm_end.  Checking if the vmg->vma can expand and merge with
+ * Will expand over vmg->next if it's different from vmg->middle and vmg->end ==
+ * vmg->next->vm_end.  Checking if the vmg->middle can expand and merge with
  * vmg->next needs to be handled by the caller.
  *
  * Returns: 0 on success.
  *
  * ASSUMPTIONS:
- * - The caller must hold a WRITE lock on vmg->vma->mm->mmap_lock.
- * - The caller must have set @vmg->vma and @vmg->next.
+ * - The caller must hold a WRITE lock on vmg->middle->mm->mmap_lock.
+ * - The caller must have set @vmg->middle and @vmg->next.
  */
 int vma_expand(struct vma_merge_struct *vmg)
 {
 	struct vm_area_struct *anon_dup = NULL;
 	bool remove_next = false;
-	struct vm_area_struct *vma = vmg->vma;
+	struct vm_area_struct *middle = vmg->middle;
 	struct vm_area_struct *next = vmg->next;
 
 	mmap_assert_write_locked(vmg->mm);
 
-	vma_start_write(vma);
-	if (next && (vma != next) && (vmg->end == next->vm_end)) {
+	vma_start_write(middle);
+	if (next && (middle != next) && (vmg->end == next->vm_end)) {
 		int ret;
 
 		remove_next = true;
 		/* This should already have been checked by this point. */
 		VM_WARN_ON_VMG(!can_merge_remove_vma(next), vmg);
 		vma_start_write(next);
-		ret = dup_anon_vma(vma, next, &anon_dup);
+		ret = dup_anon_vma(middle, next, &anon_dup);
 		if (ret)
 			return ret;
 	}
 
 	/* Not merging but overwriting any part of next is not handled. */
 	VM_WARN_ON_VMG(next && !remove_next &&
-		       next != vma && vmg->end > next->vm_start, vmg);
+		       next != middle && vmg->end > next->vm_start, vmg);
 	/* Only handles expanding */
-	VM_WARN_ON_VMG(vma->vm_start < vmg->start || vma->vm_end > vmg->end, vmg);
+	VM_WARN_ON_VMG(middle->vm_start < vmg->start ||
+		       middle->vm_end > vmg->end, vmg);
 
+	vmg->target = middle;
 	if (commit_merge(vmg, NULL, remove_next ? next : NULL, NULL, 0, true))
 		goto nomem;
 
@@ -1508,7 +1514,7 @@ int do_vmi_munmap(struct vma_iterator *vmi, struct mm_struct *mm,
  */
 static struct vm_area_struct *vma_modify(struct vma_merge_struct *vmg)
 {
-	struct vm_area_struct *vma = vmg->vma;
+	struct vm_area_struct *vma = vmg->middle;
 	struct vm_area_struct *merged;
 
 	/* First, try to merge. */
@@ -1605,7 +1611,7 @@ struct vm_area_struct *vma_merge_extend(struct vma_iterator *vmi,
 	VMG_VMA_STATE(vmg, vmi, vma, vma, vma->vm_end, vma->vm_end + delta);
 
 	vmg.next = vma_iter_next_rewind(vmi, NULL);
-	vmg.vma = NULL; /* We use the VMA to populate VMG fields only. */
+	vmg.middle = NULL; /* We use the VMA to populate VMG fields only. */
 
 	return vma_merge_new_range(&vmg);
 }
@@ -1726,7 +1732,7 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
 	if (new_vma && new_vma->vm_start < addr + len)
 		return NULL;	/* should never get here */
 
-	vmg.vma = NULL; /* New VMA range. */
+	vmg.middle = NULL; /* New VMA range. */
 	vmg.pgoff = pgoff;
 	vmg.next = vma_iter_next_rewind(&vmi, NULL);
 	new_vma = vma_merge_new_range(&vmg);
diff --git a/mm/vma.h b/mm/vma.h
index a2e8710b8c47..5b5dd07e478c 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -69,16 +69,48 @@ enum vma_merge_flags {
 	VMG_FLAG_JUST_EXPAND = 1 << 0,
 };
 
-/* Represents a VMA merge operation. */
+/*
+ * Describes a VMA merge operation and is threaded throughout it.
+ *
+ * Any of the fields may be mutated by the merge operation, so no guarantees are
+ * made to the contents of this structure after a merge operation has completed.
+ */
 struct vma_merge_struct {
 	struct mm_struct *mm;
 	struct vma_iterator *vmi;
-	pgoff_t pgoff;
+	/*
+	 * Adjacent VMAs, any of which may be NULL if not present:
+	 *
+	 * |------|--------|------|
+	 * | prev | middle | next |
+	 * |------|--------|------|
+	 *
+	 * middle may not yet exist in the case of a proposed new VMA being
+	 * merged, or it may be an existing VMA.
+	 *
+	 * next may be assigned by the caller.
+	 */
 	struct vm_area_struct *prev;
-	struct vm_area_struct *next; /* Modified by vma_merge(). */
-	struct vm_area_struct *vma; /* Either a new VMA or the one being modified. */
+	struct vm_area_struct *middle;
+	struct vm_area_struct *next;
+	/*
+	 * This is the VMA we ultimately target to become the merged VMA, except
+	 * for the one exception of merge right, shrink next (for details of
+	 * this scenario see vma_merge_existing_range()).
+	 */
+	struct vm_area_struct *target;
+	/*
+	 * Initially, the start, end, pgoff fields are provided by the caller
+	 * and describe the proposed new VMA range, whether modifying an
+	 * existing VMA (which will be 'middle'), or adding a new one.
+	 *
+	 * During the merge process these fields are updated to describe the new
+	 * range _including those VMAs which will be merged_.
+	 */
 	unsigned long start;
 	unsigned long end;
+	pgoff_t pgoff;
+
 	unsigned long flags;
 	struct file *file;
 	struct anon_vma *anon_vma;
@@ -118,8 +150,8 @@ static inline pgoff_t vma_pgoff_offset(struct vm_area_struct *vma,
 		.mm = vma_->vm_mm,				\
 		.vmi = vmi_,					\
 		.prev = prev_,					\
+		.middle = vma_,					\
 		.next = NULL,					\
-		.vma = vma_,					\
 		.start = start_,				\
 		.end = end_,					\
 		.flags = vma_->vm_flags,			\
diff --git a/tools/testing/vma/vma.c b/tools/testing/vma/vma.c
index 04ab45e27fb8..3c0572120e94 100644
--- a/tools/testing/vma/vma.c
+++ b/tools/testing/vma/vma.c
@@ -147,8 +147,8 @@ static void vmg_set_range(struct vma_merge_struct *vmg, unsigned long start,
 	vma_iter_set(vmg->vmi, start);
 
 	vmg->prev = NULL;
+	vmg->middle = NULL;
 	vmg->next = NULL;
-	vmg->vma = NULL;
 
 	vmg->start = start;
 	vmg->end = end;
@@ -338,7 +338,7 @@ static bool test_simple_expand(void)
 	VMA_ITERATOR(vmi, &mm, 0);
 	struct vma_merge_struct vmg = {
 		.vmi = &vmi,
-		.vma = vma,
+		.middle = vma,
 		.start = 0,
 		.end = 0x3000,
 		.pgoff = 0,
@@ -631,7 +631,7 @@ static bool test_vma_merge_special_flags(void)
 	 */
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x4000, 3, flags);
 	ASSERT_NE(vma, NULL);
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	for (i = 0; i < ARRAY_SIZE(special_flags); i++) {
 		vm_flags_t special_flag = special_flags[i];
@@ -760,7 +760,7 @@ static bool test_vma_merge_with_close(void)
 
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	/*
 	 * The VMA being modified in a way that would otherwise merge should
@@ -787,7 +787,7 @@ static bool test_vma_merge_with_close(void)
 	vma->vm_ops = &vm_ops;
 
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	/*
 	 * Initially this is misapprehended as an out of memory report, as the
@@ -817,7 +817,7 @@ static bool test_vma_merge_with_close(void)
 
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
@@ -843,7 +843,7 @@ static bool test_vma_merge_with_close(void)
 
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -940,7 +940,7 @@ static bool test_merge_existing(void)
 	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x9000, 6, flags);
 	vma_next->vm_ops = &vm_ops; /* This should have no impact. */
 	vmg_set_range(&vmg, 0x3000, 0x6000, 3, flags);
-	vmg.vma = vma;
+	vmg.middle = vma;
 	vmg.prev = vma;
 	vma->anon_vma = &dummy_anon_vma;
 	ASSERT_EQ(merge_existing(&vmg), vma_next);
@@ -973,7 +973,7 @@ static bool test_merge_existing(void)
 	vma_next = alloc_and_link_vma(&mm, 0x6000, 0x9000, 6, flags);
 	vma_next->vm_ops = &vm_ops; /* This should have no impact. */
 	vmg_set_range(&vmg, 0x2000, 0x6000, 2, flags);
-	vmg.vma = vma;
+	vmg.middle = vma;
 	vma->anon_vma = &dummy_anon_vma;
 	ASSERT_EQ(merge_existing(&vmg), vma_next);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1003,7 +1003,7 @@ static bool test_merge_existing(void)
 	vma->vm_ops = &vm_ops; /* This should have no impact. */
 	vmg_set_range(&vmg, 0x3000, 0x6000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	vma->anon_vma = &dummy_anon_vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
@@ -1037,7 +1037,7 @@ static bool test_merge_existing(void)
 	vma = alloc_and_link_vma(&mm, 0x3000, 0x7000, 3, flags);
 	vmg_set_range(&vmg, 0x3000, 0x7000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	vma->anon_vma = &dummy_anon_vma;
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1067,7 +1067,7 @@ static bool test_merge_existing(void)
 	vma_next = alloc_and_link_vma(&mm, 0x7000, 0x9000, 7, flags);
 	vmg_set_range(&vmg, 0x3000, 0x7000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	vma->anon_vma = &dummy_anon_vma;
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1102,37 +1102,37 @@ static bool test_merge_existing(void)
 
 	vmg_set_range(&vmg, 0x4000, 0x5000, 4, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
 	vmg_set_range(&vmg, 0x5000, 0x6000, 5, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
 	vmg_set_range(&vmg, 0x6000, 0x7000, 6, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
 	vmg_set_range(&vmg, 0x4000, 0x7000, 4, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
 	vmg_set_range(&vmg, 0x4000, 0x6000, 4, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
 	vmg_set_range(&vmg, 0x5000, 0x6000, 5, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 	ASSERT_EQ(merge_existing(&vmg), NULL);
 	ASSERT_EQ(vmg.state, VMA_MERGE_NOMERGE);
 
@@ -1197,7 +1197,7 @@ static bool test_anon_vma_non_mergeable(void)
 
 	vmg_set_range(&vmg, 0x3000, 0x7000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1277,7 +1277,7 @@ static bool test_dup_anon_vma(void)
 	vma_next->anon_vma = &dummy_anon_vma;
 
 	vmg_set_range(&vmg, 0, 0x5000, 0, flags);
-	vmg.vma = vma_prev;
+	vmg.middle = vma_prev;
 	vmg.next = vma_next;
 
 	ASSERT_EQ(expand_existing(&vmg), 0);
@@ -1309,7 +1309,7 @@ static bool test_dup_anon_vma(void)
 	vma_next->anon_vma = &dummy_anon_vma;
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1338,7 +1338,7 @@ static bool test_dup_anon_vma(void)
 	vma->anon_vma = &dummy_anon_vma;
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1366,7 +1366,7 @@ static bool test_dup_anon_vma(void)
 	vma->anon_vma = &dummy_anon_vma;
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_prev);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1394,7 +1394,7 @@ static bool test_dup_anon_vma(void)
 	vma->anon_vma = &dummy_anon_vma;
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	ASSERT_EQ(merge_existing(&vmg), vma_next);
 	ASSERT_EQ(vmg.state, VMA_MERGE_SUCCESS);
@@ -1432,7 +1432,7 @@ static bool test_vmi_prealloc_fail(void)
 
 	vmg_set_range(&vmg, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.vma = vma;
+	vmg.middle = vma;
 
 	fail_prealloc = true;
 
@@ -1458,7 +1458,7 @@ static bool test_vmi_prealloc_fail(void)
 	vma->anon_vma = &dummy_anon_vma;
 
 	vmg_set_range(&vmg, 0, 0x5000, 3, flags);
-	vmg.vma = vma_prev;
+	vmg.middle = vma_prev;
 	vmg.next = vma;
 
 	fail_prealloc = true;
-- 
2.48.1

