Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A559130E85F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412874; cv=fail; b=uryFmj9g2qilvpaQFALKaafN2x6id9a7HpLI6jozKMG3LeyP7ygQjqgolefqCInjP+IsoFBijjyYPWKmWsVIxgDQZ79H0s2vwIvhSWDeI0a3Sd1FyKd9blFxiFbaymNah4vLZOqhoPkVQdTqTxiOJDdaJ+8Hg3fOICwpzdUZmqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412874; c=relaxed/simple;
	bh=SpLpW/DbQ5cL+o2ckBlRenNVC9Cq6CF5F+jjDdx4tSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DXrQBtBvH0ik9ayGxLQJeU/Hvx1g3YwLHB8D8wa3QHtF4nCAIvwKnsatjc3OTu8ELrCCQYb1jfg7ThymodfjG5ttp01TwVtQxH35CKs507lyogpexSdo4TtGEo33I6/qlmVJydnt2x33akLKCFFxPouyLLyN7lKMRH01hxZ/9Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=COOkrrNY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HcR9jIL3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="COOkrrNY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HcR9jIL3"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K7feb4001296;
	Fri, 20 Jun 2025 09:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=sVExcIz5oeMuNaXH86
	WMcWkPfWlSQKbuzFXprUGAtkI=; b=COOkrrNYH7YEYUXdyay+MuEk3mor/rQxzC
	WMj/whGsqgJibNQmeTMCTRI9tPCenQ+6GomEInsHOJEFCAjJ/wTVvSa/0JqXHzlZ
	ZAkoCVzI8gy4lLT2T9x10BedDXOlTzlGzL6WVxRjbx0hlTOozziVy5+yCgLmep55
	dStvYybOeeF0LW6+z/hszLHynIcvde8en1L/kDuEDlZkpzG4nTC+0ouXoZkc4/nt
	jjk7iiQskVtl9+fxiIBqJwEEol/Zyljn0HZv4JXkI2Hwa71aNqNLHcAdpNGUUXHi
	PY7oJh7Q3C4anj5RHg17nADNTP6RH8UVMe/873OSbHoua3Fef19Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8raax2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 09:47:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55K9S5UE038549;
	Fri, 20 Jun 2025 09:47:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhcrh5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jun 2025 09:47:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDBD4W3or2yqupchQ6s0+9qobdP9kf69JScxyKhNEe3UFb9xIl6REz9VZvRrmDHqpmyqwQP+oA1o6SBOTSY6W1zPrzu39kEnULNUE9/25H24FYwMSrAj4z6U8q4JuoH+qrN/14tEo5vv1I9p8OwpKGFZv0uRLSZdaID4YJJcBfhUuXCsekBsso/HFmSDkDhc2TjwbbZhPc2cNFbw7RMyIcO/X7CzjGrmBVZ9LQYwEVPCLTTslXBWTLxKslrlmtorG+OQ3Bfvrgg7tsRYpTb2SmOu7u2sCrS7OHUiNU1UQKA4rPLrslQBHnsSzayAhShhCfrHIcEPKI87QO7tPxWmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVExcIz5oeMuNaXH86WMcWkPfWlSQKbuzFXprUGAtkI=;
 b=AxLBjrUYhyJIEbgfYGV/ZaKf3NG2RMeUGU4PyLzJnPFCNbB85gRS0rzrCulBNy3FSN4R9RP0amvPD8Z2WN2TcSS8Mw+HyiC97n23e2DgyF2yA425NXA3G5W3XBfnancc5lWBQm3EJGodHidCcdQLhJGA05/fzwg/ZaDAxyhIXLjofsNsjqFr+4kmb+4uERlXDExiQUS0uO0frvX5LloOiJs2t8yJ4ktcnUnmZJdxp4jgi3nQjTkPs7f7JXQ40N4ENTiZYWwt9i5jyY/GerZr9bmrAzgglwGRt69oWn2npVfjst7IvQ+ygNcwyVdKrQItPef19MTFzgJ4k+wacgEoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVExcIz5oeMuNaXH86WMcWkPfWlSQKbuzFXprUGAtkI=;
 b=HcR9jIL3oqbUU1OSKFL4eIwhc+ctHYM4+y8jIrTBGS4oznWl/IDo1DViW5+k/sgvsP+yMCPrxA1RB1nXYizDOGTTLdQ9meZ3Y798wJhkjVAz/fP2fjzgjGVLYuS0/fpBCwBR04HB/A4QcFuG2J2ea5Z0a6kVx09GJA4oYkfiU8Q=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ2PR10MB7111.namprd10.prod.outlook.com (2603:10b6:a03:4c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Fri, 20 Jun
 2025 09:47:37 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 09:47:37 +0000
Date: Fri, 20 Jun 2025 10:47:34 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: syzbot <syzbot+d400c4dc8b94eed678bc@syzkaller.appspotmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, jannh@google.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org, pfalcato@suse.de,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] WARNING: bad unlock balance in move_page_tables
Message-ID: <5ec25a42-88a4-418b-9c6e-3cad971105d9@lucifer.local>
References: <68552c8d.a00a0220.137b3.0040.GAE@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68552c8d.a00a0220.137b3.0040.GAE@google.com>
X-ClientProxiedBy: LO4P123CA0677.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ2PR10MB7111:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bedfd59-fd97-4ced-4852-08ddafdf7d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sbbiI69m5QJoTBaEeXmVY3qUjcdeZg+CNDl488bgQuSSgMxaR8r8BnU1Ts5D?=
 =?us-ascii?Q?kryNscb16IcHdIYfSPyemI7qCKezkARQYj7o9ICuo4j2/zZ3aonDSicY/eGU?=
 =?us-ascii?Q?DiEap12llgIlzNm+IjJoJSO/8EYlzuqj0pGRrBucFdum5gjBWj7P7yBcLHO/?=
 =?us-ascii?Q?cbxodLLjTieZ5oRhpLOEJODCUWxR9OFcswwKrV2r66Jxxm9v9FarDV3voecd?=
 =?us-ascii?Q?25aap2tNf1V3KOp28Nq6vPpx84z+iUz/8aBTMyStAaOMOebch1yGbzCTcTNd?=
 =?us-ascii?Q?oPdLbsxDMwsJDaIF1PKtNrErBVtRFz3pEP0ACRAuu0yKjYp1WVU5NkTXqR6u?=
 =?us-ascii?Q?Mnkop8L6r2Y6egCrOu6xI7pIWbQY+6FKvbxwTSdAS/OPP57se/nUzQm7wCx7?=
 =?us-ascii?Q?MEmCJ3FDROmR83YMZBYwBFl7Jf2B/H1A9OCg3xLGsb9U0gAl6VRj9vmy8h7K?=
 =?us-ascii?Q?CUmSEqRwlo/8ezGYohLhCsQIe7gcpQ8vj37LChvPGxh54UetQyJsDlUMMoLa?=
 =?us-ascii?Q?A3eF6fCf2a+pgnmQKd2YeMLESttUUhveMzpvAtp65L0+SKotwYKMQxHaRr1Y?=
 =?us-ascii?Q?YY32UVE6CbHJ72buXS4YS40hkqIqJ2xnCGp42HVr6ZdNq0NIuwDJU9jmDv77?=
 =?us-ascii?Q?NaQ/crgzT6wdrHIfXNtfIJ7Phqx2LLUPpkLoeRsezj8MtnOzB19FOp4m97E5?=
 =?us-ascii?Q?eDH2DuZB/ES0QX5TBqSQgcWL9rOC/uJmkA2/tJRb7xzCcgkgftfQqB3Lj3pQ?=
 =?us-ascii?Q?MqVbOg+EwbyLEzaHX8P1Rnqyo8vYi79Sntm6/PgcfGbqI92r9ZvmSdKjPC6C?=
 =?us-ascii?Q?n0rUc2yaPtTS9uD2XJyaCLMJJDSQQqDmxOAKFyejjFvMhtLJT7SgrHYoTV0L?=
 =?us-ascii?Q?Ekfir43qLjh7GiT8Dkn0M9yEdsM2TLd5OXT/yJrYkpQ0TMf7qySgmws7XfNh?=
 =?us-ascii?Q?w24Q1RCFLwWf+IgLNJHYpaKR+kRNil5Y4gO0zXek9qdklXUjH1PHBjALjCAQ?=
 =?us-ascii?Q?rIkGPPsW8d3OVsFzTrH8pQnlUiJe4lHpJ2NkEtxNvKPYkIBrJsPn5WD6LhdU?=
 =?us-ascii?Q?VKtB4u3h6Qm8bqcsV+jIyOTRXWigb1pJMf0EPIaGt3PtuCcuy1XYKHC5BToU?=
 =?us-ascii?Q?xMaookqUjmoXyAbybT7ng30jttkDIrLJpl925ROzimA7tYpub0qYanFaQOLU?=
 =?us-ascii?Q?H+JTjk6SH5x4KJZz+NWyzKEnV15kqMTSyD8pej5GADSTGrBZF+IH9zgmooXR?=
 =?us-ascii?Q?7+SFgt4TY4c4Sbgh2IJgUrrHfJd0yTXZlvctVBP2M4u4Y0VE3JjbYga0iNM4?=
 =?us-ascii?Q?XLGsnBHy501PV/GhAb/5TAx1C5SUfT/nrIx9LVERAqo86uDSSBPMQ42dEti5?=
 =?us-ascii?Q?+XW6Lu8BSDBuuiQ3KkYS5rwK8LHi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TJKXHrLBuufuLYmimMQxjuEL3oQHjYjSCgjaC82U2n8j3jvvdJbGlzkFyX5m?=
 =?us-ascii?Q?NXp81Gga2UQI0fF/KUmTVfR4U6f0AqeUJqKyy5Ev4yhY5iG6MsuCGeY5C1Ju?=
 =?us-ascii?Q?Fs2Ge+JBgoaZa8+YG0Ni3b3aTggrKkwt5EUn0djUH7DOeUuHaJ+pQQ6Kk6Nn?=
 =?us-ascii?Q?BVIFqC4UlCHWTKWk6t8nLGJLZKNGmpGtGB4BJXJDz4SW45AbZw7Akb7U/UrT?=
 =?us-ascii?Q?ExIGYNQ4gZB3ebgxnKY0sIJasxAwCIF0GeOXHa08dwUA7xUfvjKNGRBXbHG7?=
 =?us-ascii?Q?q/zst2zuafUMPBoDZ5h8a3qBFsur+huXa+8CA218EHagIiQloQp3IHD7YYGC?=
 =?us-ascii?Q?MKS5zel3qIEL1AOs+A4KTlsOzd0mvdNxVz3jNhUWfqKdbSbfSN/R6T8DCjGL?=
 =?us-ascii?Q?YZSCDo79AswCyQoupLAb21z36JeLvcxPa/G2wD10GCn4/sZGw/h7tmiSXq/Q?=
 =?us-ascii?Q?wSMnVprsf9uCQ4v44f1a7UzIUOBBJosO0GpXBQiCSbbFV/hIGstzMiknxa1q?=
 =?us-ascii?Q?TvQE8PsCwy47B2tC58ryTeKzoiU30rCuyiWxH2X7fJJfZtmmdGP4/vQmPQnV?=
 =?us-ascii?Q?aZ3P0wRro3VeyOOcTHXblxnoHsLSyM6O6AHGVJ8750XDkmd6Nwwg0JDCfPFs?=
 =?us-ascii?Q?QXeL4nOltg3aFF8VMhZ27Ln06R/5Snpr2cSM6ydMphlkJpK7QBXeLE2IvKj2?=
 =?us-ascii?Q?93FZrYpf3wIIL8rV+g/ahx2xgYqVqA1QyWRup3mrrGAtaU+/dlo0Fmcv/UGw?=
 =?us-ascii?Q?B2+PwbyEg/907jDTEOl2AS0WZH6w5qa2Wt1HtYoVVS0GdO4a/bfHDBikXdT2?=
 =?us-ascii?Q?TF72Z+nvfoFib8Qu033LJohuJeXKiL3i1J2+oZGExoia7CV5bTso3p3pAcmi?=
 =?us-ascii?Q?q0HLIqUB7A8Axu7PXAG1veq3Xl1ZpAAam1CDe91p3kLj6M4Hp+qXVbsIY5t9?=
 =?us-ascii?Q?moW1/kM+NvwjZ4AH1E4iPFYPD53CCy2L9yK2vIv2xTzOb5SOUYCOeAwGadsA?=
 =?us-ascii?Q?Vikw6KO3GU2mRt2oAPC1E+7NI8BVO7qmof5++CGcoTyBhIT2MubiVfo2JDDt?=
 =?us-ascii?Q?JzYvvL3sJU1NPKSJsnej8O0BP30QKiz8JhphTTSJ76LWOhbbqROX/ZW7Gq1b?=
 =?us-ascii?Q?DKg4ag/NzDuBCny3m6gWLPuF74LjX9AXH1UbTyx+IIPJamHGKT4T64i7xosh?=
 =?us-ascii?Q?Km95JeG0aKUCF+oysr8uLRHeHaPH4Mo2m+hzVM2F7h3GERQ9A0frwDswzEDp?=
 =?us-ascii?Q?kCcewxpT+awW3zblIJXyDu5kFlDQUUZDSTvbJfMYwG/FfZ/tHsxLtdnw+KL5?=
 =?us-ascii?Q?E13K0DLjr9ElephUvCu+REJRZ1Q4zOcpYX1AA41DWxFtt1pHvGP3PMOZ4ui8?=
 =?us-ascii?Q?9CUHwwVly373QmmrzZsp4A4zLQKefsHmISC6et2TuNu9Mvm9Z3h4X1ezBoj0?=
 =?us-ascii?Q?fKpJkv9EaInougCDnyBQ9NQbMxJDRYw9E3q8TB1t4fAcX1/fHN5nHF50QHPT?=
 =?us-ascii?Q?DLf5DHwqksvIT1mTxExNqsRnt98p3gTnUKJlxGzM3v5xtsWAP7aSWA3DTwFk?=
 =?us-ascii?Q?h9HLY2bL+n2TaYdLczPckZc6RoIjjun2ECfvLYt6zObQl/EVkB0FYZ8l7CxG?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fuOjCb2uQqve712q5Ss9aLMJ5EDoB9Q0Gjt32KW2bCKCHrb76iBTjqPNQueEtXes8g2q/U6etv6weovimvWUuTmGq3uK28v0Z3xXmsZfpL7GvuVHT6UEpqb7cp2zILlelNHbUf+fUuQfx8BvRkZdW6z9j1K79lQExKIPxhZfbFC2Nrz2QvPl/sqkm9J72FsaHBVyh4IEl0cKK3PV3xHey5zdNkdSeJCqQdVHVnDMZcGoamlKD4NsIQC4EWAUpNYFmRGYV+3HPJKLkxOJuiEsABnoAy10xPdL9EXTBxyf5MrJanWlXij/zhGc48nMEd6vud8HOzPdImTTfUMt5Hya5UaholOVyZ5ry3s62SoKTEC5Skg7zdotjHm8I8nd0rjbV2jDIDYnBrMjBeHp/PWA82yBmxxdYOBFNRO+lKVCm15aDI8CF9F+IrnA6n5H0s9fI0LyVh7+aAOekVFOkUnd6DyTt5wSl8N0hlFVZ3XXcobhI+xkXM6AzP6cC4gRXRYogMgKPAaX1JTZsueWYOhX/ctPiuevjBfpMYTY4kXhnzwc32Q/mxRlzPKwmTb+ZETF+X1woEZlnBLZlQC3zP+qvoBbFNJbzzObgfx8j0v9Oag=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bedfd59-fd97-4ced-4852-08ddafdf7d4a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 09:47:37.1887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElpsNYdw9LPhzSFK1PPQtGpEbBuqf0QiL3pJExMZ5qzqBWz4kl8LQr4ytliB/xDc4YMlUcMcYJngvZVJSqFGxKoVs33thkJz8z9VKAzCygk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200071
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA3MCBTYWx0ZWRfX1qFd8nHIGGkf zFtbm3QLq2qvV89UcQ1AA0Hw5WESg5LrN4Ll0PkMnzKuPp0yAHBBwyiXehI5JkVGSXwcl+7n5dp 1Q87dAlg0AVpHeCF2w6GEEB+/sslVAgh+l9DGUfGyCk9yQ3kHco0lbGnjTw6XSbT4xJAUI9OWl/
 p2G+7cSmU+UBnb/nPZO1XdLuA4U7g5ryuqTtXh1lsA5S+puHSnwiZXg3rmfEZJs6bxnBv0T9SqD lIPLI/cO1JiOiXVg3X/3Uezv1KnW1h2kSsUEXSTisqsIuTdBMllFRXEX9TdAx8L5zHE/4wPTlFC AKSz+R52uIV9D2snxocgvW9CN9f3wsJIObFWdtahG0xPrgrcxm+/rGpmgwuUEbm+AG3O0DUiUEF
 jRLdN6sTGTXEmQo43/bJN5wfUxcxfAmSO/T8fE7l7Z9SVX3W+iIvVXlkLPKL3vmrb8N+1hDN
X-Proofpoint-GUID: 2RZ5SyNkgCcM3h_ZiLcfwhovXsrdvLrt
X-Proofpoint-ORIG-GUID: 2RZ5SyNkgCcM3h_ZiLcfwhovXsrdvLrt
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=68552e3c b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=edf1wS77AAAA:8 a=3g80flMcAAAA:8 a=oHvirCaBAAAA:8 a=hSkVLCK3AAAA:8 a=4RBUngkUAAAA:8 a=z_eI-7IpzQhbFHQK6yQA:9
 a=BhMdqm2Wqc4Q2JL7t0yJfBCtM/Y=:19 a=CjuIK1q_8ugA:10 a=vVHabExCe68A:10 a=slFVYn995OdndYK6izCD:22 a=DcSpbTIhAlouE1Uv7lRv:22 a=3urWGuTZa-U-TZ_dHwj2:22 a=cQPPKAXgyycSBL8etih5:22 a=_sbA2Q-Kp09kWB8D3iXc:22 cc=ntf awl=host:13206

Hi this has already been fixed.

#syz dup: [syzbot] [mm?] WARNING: bad unlock balance in move_pgt_entry

Original report in
https://lore.kernel.org/all/68512333.a70a0220.395abc.0205.GAE@google.com/ fix
sent as fix-patch in https://lore.kernel.org/all/46f4db0a-4b84-45b9-8b23-bb81493f776d@lucifer.local

Thanks!


On Fri, Jun 20, 2025 at 02:40:29AM -0700, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    050f8ad7b58d Add linux-next specific files for 20250616
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=1032490c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d2efc7740224b93a
> dashboard link: https://syzkaller.appspot.com/bug?extid=d400c4dc8b94eed678bc
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
>
> Unfortunately, I don't have any reproducer for this issue yet.
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/49faa18d2f53/disk-050f8ad7.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/7c6f9cd7fe5d/vmlinux-050f8ad7.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/84a08d6403ee/bzImage-050f8ad7.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+d400c4dc8b94eed678bc@syzkaller.appspotmail.com
>
> =====================================
> WARNING: bad unlock balance detected!
> 6.16.0-rc2-next-20250616-syzkaller #0 Not tainted
> -------------------------------------
> syz.9.959/9941 is trying to release lock (&mapping->i_mmap_rwsem) at:
> [<ffffffff821011d1>] i_mmap_unlock_write include/linux/fs.h:557 [inline]
> [<ffffffff821011d1>] maybe_drop_rmap_locks mm/mremap.c:197 [inline]
> [<ffffffff821011d1>] move_pgt_entry mm/mremap.c:686 [inline]
> [<ffffffff821011d1>] move_page_tables+0xf51/0x2940 mm/mremap.c:1358
> but there are no more locks to release!
>
> other info that might help us debug this:
> 1 lock held by syz.9.959/9941:
>  #0: ffff88807cafc260 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:374 [inline]
>  #0: ffff88807cafc260 (&mm->mmap_lock){++++}-{4:4}, at: do_mremap mm/mremap.c:2371 [inline]
>  #0: ffff88807cafc260 (&mm->mmap_lock){++++}-{4:4}, at: __do_sys_mremap mm/mremap.c:2453 [inline]
>  #0: ffff88807cafc260 (&mm->mmap_lock){++++}-{4:4}, at: __se_sys_mremap+0x3c0/0xc60 mm/mremap.c:2421
>
> stack backtrace:
> CPU: 1 UID: 0 PID: 9941 Comm: syz.9.959 Not tainted 6.16.0-rc2-next-20250616-syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  print_unlock_imbalance_bug+0xdc/0xf0 kernel/locking/lockdep.c:5301
>  __lock_release kernel/locking/lockdep.c:5540 [inline]
>  lock_release+0x269/0x3e0 kernel/locking/lockdep.c:5892
>  up_write+0x2d/0x420 kernel/locking/rwsem.c:1629
>  i_mmap_unlock_write include/linux/fs.h:557 [inline]
>  maybe_drop_rmap_locks mm/mremap.c:197 [inline]
>  move_pgt_entry mm/mremap.c:686 [inline]
>  move_page_tables+0xf51/0x2940 mm/mremap.c:1358
>  copy_vma_and_data mm/mremap.c:1807 [inline]
>  move_vma+0xd5e/0x2010 mm/mremap.c:1913
>  mremap_to+0x7e7/0x8b0 mm/mremap.c:2106
>  do_mremap mm/mremap.c:2396 [inline]
>  __do_sys_mremap mm/mremap.c:2453 [inline]
>  __se_sys_mremap+0x8f5/0xc60 mm/mremap.c:2421
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f4030f8e929
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f4031dde038 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> RAX: ffffffffffffffda RBX: 00007f40311b6240 RCX: 00007f4030f8e929
> RDX: 0000000000200000 RSI: 0000000000600600 RDI: 0000200000000000
> RBP: 00007f4031010b39 R08: 0000200000a00000 R09: 0000000000000000
> R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f40311b6240 R15: 00007ffc335a19c8
>  </TASK>
> ------------[ cut here ]------------
> DEBUG_RWSEMS_WARN_ON((rwsem_owner(sem) != current) && !rwsem_test_oflags(sem, RWSEM_NONSPINNABLE)): count = 0x0, magic = 0xffff88807b05b2e0, owner = 0x0, curr 0xffff88802cc51e00, list empty
> WARNING: kernel/locking/rwsem.c:1368 at __up_write kernel/locking/rwsem.c:1367 [inline], CPU#1: syz.9.959/9941
> WARNING: kernel/locking/rwsem.c:1368 at up_write+0x3a2/0x420 kernel/locking/rwsem.c:1630, CPU#1: syz.9.959/9941
> Modules linked in:
> CPU: 1 UID: 0 PID: 9941 Comm: syz.9.959 Not tainted 6.16.0-rc2-next-20250616-syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
> RIP: 0010:__up_write kernel/locking/rwsem.c:1367 [inline]
> RIP: 0010:up_write+0x3a2/0x420 kernel/locking/rwsem.c:1630
> Code: d0 48 c7 c7 60 ee 8a 8b 48 c7 c6 80 f0 8a 8b 48 8b 14 24 4c 89 f1 4d 89 e0 4c 8b 4c 24 08 41 52 e8 23 3b e6 ff 48 83 c4 08 90 <0f> 0b 90 90 e9 6d fd ff ff 48 c7 c1 34 81 a1 8f 80 e1 07 80 c1 03
> RSP: 0018:ffffc90013b0f530 EFLAGS: 00010296
> RAX: 3396a5242025d900 RBX: ffff88807b05b2e0 RCX: 0000000000080000
> RDX: ffffc9000e491000 RSI: 0000000000031dc6 RDI: 0000000000031dc7
> RBP: dffffc0000000000 R08: 0000000000000003 R09: 0000000000000004
> R10: dffffc0000000000 R11: fffffbfff1bfaa14 R12: 0000000000000000
> R13: ffff88807b05b338 R14: ffff88807b05b2e0 R15: 1ffff1100f60b65d
> FS:  00007f4031dde6c0(0000) GS:ffff888125d40000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f4031dddf98 CR3: 0000000057f30000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  i_mmap_unlock_write include/linux/fs.h:557 [inline]
>  maybe_drop_rmap_locks mm/mremap.c:197 [inline]
>  move_pgt_entry mm/mremap.c:686 [inline]
>  move_page_tables+0xf51/0x2940 mm/mremap.c:1358
>  copy_vma_and_data mm/mremap.c:1807 [inline]
>  move_vma+0xd5e/0x2010 mm/mremap.c:1913
>  mremap_to+0x7e7/0x8b0 mm/mremap.c:2106
>  do_mremap mm/mremap.c:2396 [inline]
>  __do_sys_mremap mm/mremap.c:2453 [inline]
>  __se_sys_mremap+0x8f5/0xc60 mm/mremap.c:2421
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f4030f8e929
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f4031dde038 EFLAGS: 00000246 ORIG_RAX: 0000000000000019
> RAX: ffffffffffffffda RBX: 00007f40311b6240 RCX: 00007f4030f8e929
> RDX: 0000000000200000 RSI: 0000000000600600 RDI: 0000200000000000
> RBP: 00007f4031010b39 R08: 0000200000a00000 R09: 0000000000000000
> R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f40311b6240 R15: 00007ffc335a19c8
>  </TASK>
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
