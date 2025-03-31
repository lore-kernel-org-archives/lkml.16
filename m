Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4C73FFD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743421764; cv=fail; b=k69nLTWQvKmV49txW0a4Heo03lPUpf959gii1DnaUvyeGUdnwRGCko0alRgMlCL2cperOVE4uXIm5rjpR/EOu46SYUFiXCiAt1ehGUQH1y1+1FzvH/4icraYkT6uIaThBLNse+nHZ0ikQ+kHYAXYaK+Vsm2OK7D+ZJXPM2pg6jM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743421764; c=relaxed/simple;
	bh=Ne8GCwDLYG0KxnF4wlY31Pf0VvpIbocJxM82jSPEo/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DCQkJYcywiU39+DlW4LJ1+bkP5Hk4lSSfA/ySIH2fC5UjxVo350oN+PDn7g2NTD3eZ3uoSfiY6+JG22KNHdCerUWU5ct2arLSrNMlZiAJ5926LP/mFQ8HVj8Li4aM+Ra2NtJNVKfFGcntBD0f16xEt92QcHvDznDv5ig3KeYylg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IJYWMwp7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=upl2l+Qy; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IJYWMwp7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="upl2l+Qy"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52ULUG7s012777;
	Mon, 31 Mar 2025 11:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=cRSv4qAD95TcLgTyeU
	cggl9O/ZQ/30sy8DtowHyxV5U=; b=IJYWMwp7CGhhxEgkgLd2U17e0HE+uFhOeJ
	a+EWXvLaz4z8bdf7YBHyN90KZx3EDghck5qfb3Bi3tX8ADLGXXcPODMyLGRbVQ2K
	EOY4Yb3EB8K7ylnKU6bdArXeRPOGYNaipzaspiIi7Z/OBkdakmBnRjc6+hxFjyNR
	YmuV2XNGmepYmjxFW8BR+Mj+XPARcks6g8FpLStbcTKOkPAnwWAeYTPrhW8B/gCZ
	GkIUkLh/IXKGJG/Sw7Iw1AIWWBWtjGD+r6QmS4K+OV7VAJVo81WYVK5lBsIltiWJ
	BKOlH7FoBs5kIkFZGBRzg2HQh8hhKoLk3YPCUMscJ4pOC0ly2v7w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7n2328j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 11:49:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52V9KvFk004483;
	Mon, 31 Mar 2025 11:49:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a7twkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 11:49:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKfBDlW4HRPACJCQ5+J2D/k6hwRl6t+mM9IJe/BkZxbNpzx+HOI8zhEetu/50mGxlT2veAOVb9JzGj+u52kLF9c5s6W2DtgADwEqDizvHauBymxmrBBq5cEmeNiGTa4WzfjK7q7rs7O/jgu4dGCsxOoezp65GV1CO8ipDw/Aaig51w39GZqNyEMe5/pqs7Vf2on8/YqSwAHQDqSHAB61K4JuApHGHzkVvIMCG6yWXM80vC54sM8MioldcfoFqCQyjFmVZTXl3c73NxUX6fLjuSUB6uPSu6v1gElzZBZITARTv8l2AXR05dwbDoo9dafRPnNrPDgkNyJOdCn2LNJcNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRSv4qAD95TcLgTyeUcggl9O/ZQ/30sy8DtowHyxV5U=;
 b=a8QdlyUVGjrcm5i3pVq9g4IvRJK7MqUt2aC2vxAi4Ghu8Ioui1AZEwT++ELeAbAOECPinVxIyI8GBSYTSznJQP1Ogwh0YqstJGAHBIW/tpbLVF8JYQxgsBrz2PEnjIrS3AD/+X5E9PMQJqzPP9uQC51YWsW3L5Q7SdSlBBjmXwkG4Z6MszGyso/7QpGuFz7Puvp6k26MzOLd6pGRXaWCyKFMOv244JML4myvm1oPy1VsUdP1v4tR8Cqg3x9bn5GXXSV0hoby58txgXU/TiP3ph4oNfQl0I7sTMD8dx/vc7f+2BGyvvMqtu4DsKyAqllAvjSAm75TH+/B2bWrVqPhwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRSv4qAD95TcLgTyeUcggl9O/ZQ/30sy8DtowHyxV5U=;
 b=upl2l+QyC/3Rz3QDfmyBH8sYSYITDL/XQHf2lY2uZtbFSJqIHO/bSbPhrWZwzd2pdOzH/NToejqXh1QfJZAraDZ/Rrczlj4ESadGLsDAHwQ0hxwb1kTHTCvkRIvEXrFkQMVR+0+9A3hPDFHN3xaQ7gmEluV15e/WQ4J6cX0p3a8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA0PR10MB6425.namprd10.prod.outlook.com (2603:10b6:806:2c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 11:48:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 11:48:58 +0000
Date: Mon, 31 Mar 2025 12:48:54 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ignacio Encinas <ignacio@iencinas.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
        linux-kernel@vger.kernel.org,
        syzbot+419c4b42acc36c420ad3@syzkaller.appspotmail.com
Subject: Re: [PATCH] mm: mark mm_struct.hiwater_rss as data racy
Message-ID: <2c15f7bf-7852-4aa5-98f1-c8604fe8fc00@lucifer.local>
References: <20250330-mm-maxrss-data-race-v1-1-2fe0ba6b8482@iencinas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330-mm-maxrss-data-race-v1-1-2fe0ba6b8482@iencinas.com>
X-ClientProxiedBy: LO6P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA0PR10MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: d88738f1-7362-4a45-a201-08dd704a05bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FbEyKXvutrkk9jYsitLujRjLf6R0TASUIFLuW+fyXABA5fWSlIcRaSCq6lL/?=
 =?us-ascii?Q?wM7RpIBmtvz4v9WqeViiXz5w7pjASZJppEsJ3Qnc7FoCYCvXHFJWXR7VPm0L?=
 =?us-ascii?Q?DInRwcn52PppZmw5MJUlcVFkG5wWsQXUQgEhyEXxpBJgKnoCEwnQLSrO9a3k?=
 =?us-ascii?Q?CrqgXKGxH/V8Ihnd5xumlpYAgNE/qG8vRILKXPPvP1/LCzTQU9QS+xHv3UVw?=
 =?us-ascii?Q?g0XgqXzoJ3d9nKKc1YOD90IHOiOkL/sfzYZdzOniXJVeOdYmqDsqm3sIftNZ?=
 =?us-ascii?Q?A7RRyB0M9nPpL+KTt+btbrUIYCagCpsqCaIZk5qEM0A//2uzszCdpXM9/hda?=
 =?us-ascii?Q?863ul1vO/dVyCnXr7jrsUSc5Gb995sPxhMjdvht/xmzhWALxUulH0x5wlqCS?=
 =?us-ascii?Q?dZ63hWPciowjUgieeex8DJ5xhk5D7wQsp7E8dCJltD3N5sg0JFzcRZ/8SzDm?=
 =?us-ascii?Q?tx/OERBT2gzfGdARFHFEFu5hKbWQh1TARLB2Gz73LmLEQKnMOHQvRmj9Pkoo?=
 =?us-ascii?Q?zz3eSh1rDlAzv5MODLVjbfYwwd4d/19fK62ZuQTsOde2nm2Y0ZAvEGXQQ0KP?=
 =?us-ascii?Q?//1jOUURqysF4TuVrGcSI0pEiMy8+2RtOZT6aUYQEa2Z+zUVYAaq06sE64IZ?=
 =?us-ascii?Q?2K6soHpFP76i4RipoG5Eh3kXzLz05rOBJmpBuehRChYhgwTwzm6l3+7VoavQ?=
 =?us-ascii?Q?xKZxpRx6VNNxaiR21B7prmj11C+757d4JmCGyHCNV4IpddVMs8R4QSpRZ8lJ?=
 =?us-ascii?Q?/cci2Ur2qlWDpDnUXNBG1pniBjEMU8wLrgXSOx1dBQRpW3+ieXnUMmZ1XXdM?=
 =?us-ascii?Q?VQ7xjF4NT23jVex+rjs8lIi9Jj2yhWMxmNCSqhFFJYri/aoxoeZpw/GnzKUj?=
 =?us-ascii?Q?AGaP1SBnlL8P8aJCDkmyCU68+EMWr3nXj388euNfSoeGJ2jmEp/sVmiq3jwP?=
 =?us-ascii?Q?ftYTrDFh3eZML6lu+XwgwnEuFDtUfhuY6A8SnLYkl1B4Yu3J/PAGmTDpvZNK?=
 =?us-ascii?Q?ouUAJPH0Ng2zGjLjP57kN0FlK8uRkit5PRgmvr1bUdlJRysCT1YO8ECD7KXf?=
 =?us-ascii?Q?T02CTfUfQdLHWLpDU2+OoFoTONeMGLvnwlwQ38HgJtGhYppE60SjIYZQlTcw?=
 =?us-ascii?Q?SYHXVDfImxEWVYwODT+g1ME+SvNic6PlCOY7SihfBG5dS6DUX4qWUkPPuvRS?=
 =?us-ascii?Q?tJckl1YfMK7l3lO9hCtBx1xeVk66O3sicOJ2+RtR7VFjNetRgTNjMfl/E3/r?=
 =?us-ascii?Q?LyQcItSfYeHEka0/n1BAeofDZ4XiMSy9b57tivpnQqED2B1wJIrVgXQuClr/?=
 =?us-ascii?Q?EGjNIUXNsrInK0JGjaYPJRDz8k/Nho80y6aVddq4XjYUQQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y5+WP7x5rYubaLrAkfZ/9wwTY7Avb1X5+AaOcTrNYMADIl2tgCGOrOBZb3b/?=
 =?us-ascii?Q?yRwXaJlPYb7beRo77Rb7C7mcV44BJ4As0IA5ozDxFaGHz2T4QbbtMsQJxyUy?=
 =?us-ascii?Q?OKzNAPnzfNdlVuC9IWgcD+8fmTbrVbGwl01sJo/bsFviFUQZenAt8YnGozdX?=
 =?us-ascii?Q?Ak241BQuQswW22AZHuIHssgJgYpqws7SMeC+IftbyIR3EvYTxW5tomR/nlhp?=
 =?us-ascii?Q?c7kHNZ+ECCfAXTgyiE2ltxceI1mv0E1mGXZfwIptCEOLg7CkN2AYdiZAHNm+?=
 =?us-ascii?Q?6atb9N0rPRVW/nO9fSUoy3kaxGJMZuMxYePwwrEKAMnXJkeAZVB0j/ixYQHE?=
 =?us-ascii?Q?/3W1JkcslvwHid5i8s1hP2PIYAuI9jbKzGLoyU4qrLvYJXoQWFD67eaSNEbp?=
 =?us-ascii?Q?eAsQ2W3w47rbdLmwrnSB+BZmYff7VfybJ1Z6oKSevBcMjWYulWRPtk8tFdW9?=
 =?us-ascii?Q?uHlO6rASclaM3YxiNbpzFjXWgnGVa+M0Ha2up4zTb8s3Jhpue1i2FWLcl+LS?=
 =?us-ascii?Q?R3c1XqTw1CP6i4J7XnjLHj3npxRXpOa9YdLntOjd7/nu/UqINbSsc7mo6K00?=
 =?us-ascii?Q?1VqotJGOKN1geLLgPIkcZC1PsTszLdxi+Ma7/BJfcvRyADi+nkmuA1bwZ+Lp?=
 =?us-ascii?Q?u1anhjCbWsAmzLipZZuuO30JaC1XFz8jiEbcD3zKxvq3AZ55IyvNW31lmGtZ?=
 =?us-ascii?Q?gnqcRn99SMptDnSRQ1HYaRF0hDTp7PPO90a/EJZvquX5qJ7r1n5lN/G/I0qi?=
 =?us-ascii?Q?ojcD4JbDXBth/F1xu2UDA1RLTJhOidt02/NPPuANBkpVwEwxSW79vGLDtXaA?=
 =?us-ascii?Q?5gYhvyb/ZEu080WR2DSqA12y7j6YGWe+FKdzAGu4NGuObtuhdrSTSveWodN+?=
 =?us-ascii?Q?qhWeqbt3kXXnHlam+mvSUTcYnt9Td1UsKRvuqrYZzFNGIi88F2brPGfZVtYj?=
 =?us-ascii?Q?gDRx9jFuibBDNjp9Rqa/Z4RoYbn/T/IjrqsFD/q4dcDCIldlIqealwNdok9t?=
 =?us-ascii?Q?WskxBqn/L2wryiLDEF8Q4rKuLKPrVH9rrILisPxNuKKKgn/LYl0WeY7SyWvF?=
 =?us-ascii?Q?Ibc9kvd58cXm9S1S5K7U1B4uQowj2NLhdAGzkudPOkrxa1M7+jlYH+5lX1La?=
 =?us-ascii?Q?J108TW+PoW92B4gEwm+o51ayrL/NO2Ld6uuQIMM/Iv7ZCNyvnoY4euTodSLR?=
 =?us-ascii?Q?3Zh1z9Y1MwpFJBcyFU8xDjLECrNGk6EZkQQLLOBA6do1QDpTXAg7kTlxRUiw?=
 =?us-ascii?Q?QFs0eTWfTJ7vU3XVVZvBtmWwGV6gFeZJTSmr8peZwyqh2CkwaBFkgVlpWjWG?=
 =?us-ascii?Q?+roCdct8sQDrR5RdScOZXJ9EA12TXrxbDVSngdBpHsJTNukwGVrewTV44KO/?=
 =?us-ascii?Q?Z26v+vDxcYRaRNIrPgu3q3Hj/xWTHFOnLHrJN0AQGFIw8yomgBFfiwuUWdGI?=
 =?us-ascii?Q?JaDFrGo/tkisC2n9GrDcramGbwRT+Be8Ae28BKg/wXV4KGQLwJCty9AfRcFA?=
 =?us-ascii?Q?XlOQempxNwjPZ/dfKH6UWXNJeK4RF5sdkzfZVfcnU/7XmzBc9cIR9SYBqeEF?=
 =?us-ascii?Q?BFYeCHlScKz78QxuEjua7TMdU3hEWfSDk+N9LorS9EVrCCBirFkHmER82Thl?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YeocLs3UzBc7og9qCkhZT36uD+WvUvjGk6ae496ZmOeta/KzSqMqtz7pNNjFgJU4CsA/gVeasWwyPFdbveJmLkhNCgPXBO0Nv8Rv0a6uZiCh1oJh3hu1LBIdL2hubsbeA2SZZTPd19VDtLZ1Zi20Io4pkPdOWqUnbBbp3Fg24EzKqsqeNcCm4LHOikIto5sC6AnBSpKRTcBlcFvr5/0iaFKeQ+5eo+un2mitAlGlQW3e87P/EMtO0qNt9wNDyW73JFe6EUBEtkbEKpMzuE7rYOt/c5Q+FKuTG260w25QAfhW85OE0axn+z0woGbum819DTB60yezYSZMmkHe4cvmeXyBOl91Kcrs96g0sulVjRDl86WpjailHRspNF99+EmeIoX3NQ8n7gG/tmLSmpXd18AmiMuD5dyTuHGbTY3olwa0B69gP74HbzIdD9Cql9tYKMjCKEFDOJwgkAPLTDPU+OZU7R+2wLxqgne9WYhjz8z22Pu6/hvMsXMBvCHAsqnJOYahqkQLJwgydZ9HztfHav1ZhS7b1B9J+uWdF515La9mjrfJzRfuy35gTcarnMbsXoJGqem8r2840GcvJ0T8o7QqVcYMB5KM8ryHnET68w0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d88738f1-7362-4a45-a201-08dd704a05bb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 11:48:58.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuMXogPBEtrhfPZ2ZsdV8TSGlmqCr4KJezRGhl02RXQoPXQhgi2Sx9W9Q5+xbMmNPWafsYxxZxJaGKigOhJonh1xHVSgZf2V6GWfsN5jmio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR10MB6425
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503310084
X-Proofpoint-ORIG-GUID: 7mNI_7Wek6QI1sYUcG2vety_guWcrkjm
X-Proofpoint-GUID: 7mNI_7Wek6QI1sYUcG2vety_guWcrkjm

On Sun, Mar 30, 2025 at 02:02:04PM +0200, Ignacio Encinas wrote:
> mm_struct.hiwater_rss can be accessed concurrently without proper
> synchronization as reported by KCSAN.
>
> Given that this just provides accounting information and that the extra
> accuracy isn't worth the potential slowdown, let's annotate is
> __data_racy to make KCSAN happy.
>
> Reported-by: syzbot+419c4b42acc36c420ad3@syzkaller.appspotmail.com

You'll want a:
Closes: https://lore.kernel.org/all/67e3390c.050a0220.1ec46.0001.GAE@google.com/

Here too.

> Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>

Thanks for this, but I don't think this patch works, see below for a
suggested alternative approach.

> ---
> Similar issues have been solved in the past [1]. An actual analysis of
> the data race can be found in [2] and [3].
>
> Lorenzo, I added the Suggested-by as your proposal seems roughly
> equivalent to what I propose.

Sure no problem!

>
> [1] https://lore.kernel.org/all/20210913105550.1569419-1-liupeng256@huawei.com/T/#u
> [2] https://lore.kernel.org/all/900c5035-865d-40b7-8d55-0cbbbc059294@lucifer.local/
> [3] https://lore.kernel.org/linux-mm/iwtvhos74gwrk5v5szlosnkusxqp6ubqy6ytkclkucbjwdw4zr@bwxyrwcnybbz/
> ---
>  include/linux/mm_types.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 0234f14f2aa6bea42a8a62ccb915c94f556cd3cc..84c86951a978aad07ab4ecefbfff77e7418d8402 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -19,6 +19,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/seqlock.h>
>  #include <linux/percpu_counter.h>
> +#include <linux/compiler_types.h>
>
>  #include <asm/mmu.h>
>
> @@ -939,7 +940,7 @@ struct mm_struct {
>  #endif
>
>
> -		unsigned long hiwater_rss; /* High-watermark of RSS usage */
> +		unsigned long __data_racy hiwater_rss; /* High-watermark of RSS usage */

This translates to volatile if KCSAN is enabled, and I really don't want to
apply that unnecessarily given the impliciations/any weirdness we might
observe as a result that might be confounding.

I also don't want to _across the board_ say 'hey we don't care about races
for this'.

I think use of data_race() would make more sense.

Probably we're fine doing this in update_hiwater_rss(), so something like:

static inline void update_hiwater_rss(struct mm_struct *mm)
{
	unsigned long _rss = get_mm_rss(mm);

	if (data_race(mm->hiwater_rss) < _rss)
		mm->hiwater_rss = _rss;
}

This labels it as 'we don't care', is a no-op if KCSAN is disabled and
abstracts the decision to this specific point.

Cheers, Lorenzo


>  		unsigned long hiwater_vm;  /* High-water virtual memory usage */
>
>  		unsigned long total_vm;	   /* Total pages mapped */
>
> ---
> base-commit: 3571e8b091f4270d869dda7a6cc43616c6ad6897
> change-id: 20250315-mm-maxrss-data-race-6ce86b0deb14
>
> Best regards,
> --
> Ignacio Encinas <ignacio@iencinas.com>
>
