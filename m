Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94290266588
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539391; cv=fail; b=No2COmCirYxSkBhsUREIiTbAunjDLzZNm61emvQTEVrXpDpbG2szsZnlJZgJgjj4BQV/pqYtwdgdI4hKvLVL5YLRRkhu4fz6Vt81/qM23UbN5jegXCxGI3u94NPgAB8HqBzwKRSM34bKIOmEXdpA6gWmF3E39obOBr5Dmk89ue0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539391; c=relaxed/simple;
	bh=LeV+UA4dmyYXPO7B3tM/3qhFS8stOLDEFr66j03S4UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hLb7/RjzHYbyxIKShaPn5/8nOlrdcLGXt7KTkjCfH7c2mOvn7xWXvf18ZOVy7NnOpRDVC+6a3N5eUu93fzXDNpcFUMPcjhdbdHFDr/L36VvS9oIUkRP6UcArZNGijkU9SN41/4MGm8uvp+aOYbJytrQnbPjvNZpyGTjvXeeD3Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RQX2wRiH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=C5e/KMvR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RQX2wRiH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="C5e/KMvR"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546DlDPU006466;
	Tue, 6 May 2025 13:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=OVR/jGuHHsBOsTsm50
	zKQeWpcjikLQd15aEbd4ZedhA=; b=RQX2wRiH8BAwr2Lx57QkQlgV2AHcjZzQrj
	b/kurEagJV1GIpr76J7MQKfkjj3uCDwgMM2wQNSgqh67VTZoeEnLDI5ohBzjJUJe
	BUKc4SuRgSuLjcFBD3WHTqMZLwTNhGyqVH3sMp7VpiwBhvZ7AYzO+7YZFoSxtnuM
	4fh/pIg3OnXYGY8q9XkfTPkMTx8GHtCc5V742c1N/yaOLCd39BB5ORRkMCGZMyI7
	TGOXAMul71VvIWC2oD+KUlcdLPFonTfROdbUn0hOkpkP1Y3bI47ziKQ2JV+OBMIM
	x6cGQdHrWk2gvXBiG+uCOCdNpb9gKbIu9dNWx3bK6zT9zWxkwlKA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fkky804r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 13:49:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 546DbLZ3036077;
	Tue, 6 May 2025 13:49:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2046.outbound.protection.outlook.com [104.47.58.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9k9semw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 May 2025 13:49:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3/G8trkL6gSRicQ//PpOmclM/X6uwg4H0er786AV6kt63Cd8wjyQHdpR/I7861UphHBjbLPNFZQceBKaOggc/DYYcNSzCmEUzBSg7aWcbbgE/nv6etUxokpCB6tn5H5BePvYyRo1nVrj0YvfmSQKzyWdGYsitVboT4xEsP7ZVJnaWcibFQxHgfu44HMReIQ/919arrPMHN5ZumTSoqe+Tkm7tRYZgPEMhUDmT33YDgAZqmUOubIfPQeswSxPn3Ka/is8OqNAictiulAppmq9dLiHLprmjolCwlWauzSratV/sVE46zFHB0Ugb6yd2rzkWbdtVhmcqig695eThS4Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVR/jGuHHsBOsTsm50zKQeWpcjikLQd15aEbd4ZedhA=;
 b=b1EHHpRfBXLkV5z6AZSYR0vCyGYMOGtT6wAoaDH132T0abguikBZW2vu5tV9I1Mi2kafJAF/Io2dnAE4HtQ8z8/HWyQocLYtHDo1WOV2siRk685qVnkQO4Xtkjt2zssEodBQnifKj34ArWZ0Wfu8nn9pGETfm5EBmMnP3wcaAegK/A6llC7/es847lBEKC7lYMhO229+CEGnNUQY0vBQ0z5aQZSq40s9BEtYtQHFZh6xqpUYpzgbq3FXLEU/vAca9HyQnBafGfuQDiuLDqsL3uRbolzrD31TfjE3Yz2ForB5L4B9lKCLDAQifgalaNIyr7Z/O5ERQkz9ae0Lw/32kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVR/jGuHHsBOsTsm50zKQeWpcjikLQd15aEbd4ZedhA=;
 b=C5e/KMvRgXzQsaRVbsok3oRVrBzEUm4u5mAo11K+2VdIafrGbsC2R+blL+EcL0FmtFHi+na6QU5WTpmPRB3LU6bVVuMvskniERH1EW08YhVZZ3cyQ93auThOah2Q419k9Q6b5BLqV9lBGNS+1zYM9SVzCGJ0080mpFEc9iXzYBU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB5946.namprd10.prod.outlook.com (2603:10b6:208:3d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 6 May
 2025 13:49:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 13:49:06 +0000
Date: Tue, 6 May 2025 14:49:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com
Subject: Re: [PATCH 3/3] mm: Optimize mremap() by PTE batching
Message-ID: <7c6e61fa-2437-4c99-b1d3-97af5e2b37a3@lucifer.local>
References: <20250506050056.59250-1-dev.jain@arm.com>
 <20250506050056.59250-4-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506050056.59250-4-dev.jain@arm.com>
X-ClientProxiedBy: LO2P265CA0230.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::26) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: f02ae4ac-cbd7-4763-3db0-08dd8ca4c53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YJ57aw/GFRb2aQfPlH8XIybSebCsF49uZp2GTaFtS0aN1j4bKXG69QvfatW0?=
 =?us-ascii?Q?LyAeEoqXnsgnh43jPbvi2geTU6c3fVDVzrCOr8BtzXnpilwn25y+57C12Vrk?=
 =?us-ascii?Q?TEeMQKl2J20eoIp7HIx7WgVoQnrpIh5jydaeNzbZ4Lslntkgk02csE6/xyHo?=
 =?us-ascii?Q?ycQfJ5sKXr5aAWi/+dV8l3j0EBU0uioMnFsfvNi61waXUwpPNK8ZgTIWWsAl?=
 =?us-ascii?Q?ZT+h7pzPIn3wzeuMS8zMZJmnwcDdy/xyb/mcKccbPasX23GewapOXV7G0sQb?=
 =?us-ascii?Q?TDaijB5lez86hs+OyGH8X0YK2IiHsaRPoeIsYINIiMHklXdLqOEh4a4ErQnq?=
 =?us-ascii?Q?YETBOT89rsqkqKg3J8bN26w6JFYvPeQbHl2LWuGdxiFBHX4kHgZo8OH9iKth?=
 =?us-ascii?Q?+avajiYcc2VOapl9oyozDl575p66F5geW9eQKREPTP+bVX3mAC72HV8KJ/xF?=
 =?us-ascii?Q?yb48fXHbjMYJcApzBvunqIXS8Pe4OLk1rEEceqAZz9jwn44H9u8jyUFUOFcm?=
 =?us-ascii?Q?o1n+/YHfOK//DcBUVAtaV/9+BKfpZAY0GHDKhezWMWaHayUUQfOuSCRSUtZN?=
 =?us-ascii?Q?ZuPK1RrJianPqOLhF1GCdayLFXMJCDbdlozvblNTgBRnMINmQnSM6Yykje5E?=
 =?us-ascii?Q?ZIwX810ckj9Js3Qo0RY/BHflxestwTBty+6dS79MQN5lC6DPCDyf8ReFZMKd?=
 =?us-ascii?Q?ziB4sYagsN14cycTzrM9Sl6ZCKIN/kuSSLnp1Woc0ImNNRFk2n7ynB605y0O?=
 =?us-ascii?Q?tM2WGMBhTNSWBN/sJSNaBgt/ChiReyjQ6/cBIb3X8O96FxvDXVRGo9PC25vR?=
 =?us-ascii?Q?BZEDrdJDEiUeW2ddk3GEs0RNn1eLDLHXiOJ06I1uWwFNsEoXfycR7ceqLbn6?=
 =?us-ascii?Q?q1tM+BfjNYASTeOQFZFhhUmlSaVOGCy/Sqfj8UIWZBMFbdP+Cm7fhG4LFVmR?=
 =?us-ascii?Q?FD4tcYAosJUlx9pA4FxgFiLPwaSrsRv9Nd6CV27iMjiOpQVHVWA4ed/2bweS?=
 =?us-ascii?Q?WG4N3RoQrOcjdU64DwG01FdvUnE8Ina0PPBPbM85OIKTtH08/iqkfIsMAswP?=
 =?us-ascii?Q?qv9Tezn9lYwH/45jMruSSiG5DM8hDXgOxCOocVeNVJCcYc1oFlZAYXcruY2c?=
 =?us-ascii?Q?V8knUs7mIG/Fd+ZuZsFfXLWsLCcWsEU0W5qAAyZSswJDgsVpeu6DUv/Jad/s?=
 =?us-ascii?Q?mFPhJWfAiYDb9Ax6L72PrtEDrlhjkkvXiPNf3LVKJdeOIvGNX4UNQ0TQUUyJ?=
 =?us-ascii?Q?DCdl5ecSuG5ColvzXzGMiahwGecBluraFWIXhc1u3NyhuvODAdJcT0Cf5KND?=
 =?us-ascii?Q?3tSa0D3RS+uNN9chf0/dEUp1k91XtLFgkAu9FyAMm0RtHqoMzbXvzvAyE2zQ?=
 =?us-ascii?Q?IF28WsoY6UpiluLhtZoNXktZEkGOrq+QRJuOVfKMWrBYQnro1w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ym/dwquUyo08ZRhwfWqnmrdIg5zdZoX5MVdrpy0ZBJbO2P3+6e7VJgmQF/g8?=
 =?us-ascii?Q?d6qKH5yfGu4o063OQV84/2ABrnOvphOlrsTXrZ2gDjTPa7BD81hchsupMfjq?=
 =?us-ascii?Q?bLr+FVMkBKxNS27fYTbvbBrFhwErJRjLo/Hd0EnGT029zT7c/GJOkzpOrbhH?=
 =?us-ascii?Q?33Ar3daVD9myc8GydIaWN1zyfdjlrXZH5N4abNHj7jtY/46kY6nXfDxjnjRm?=
 =?us-ascii?Q?/UUr8AoZB+d3vQXUapKWFs6lVMxuTWocxPmeCXsxKnsHLBxWkRTL9ZXM/RT6?=
 =?us-ascii?Q?Ct3c2EVnN2AjsQx4tZ5qwmQ3uW3dZbbZ9QWggi1D1Apgcvhl0G1wuKhBwfKQ?=
 =?us-ascii?Q?KNWxNCrawEE0dTaVq+LaFzRLM1TuToyt/70nTmsBKT/8/uBN8u6s6QJvYTdw?=
 =?us-ascii?Q?XzPGdTPGmVGSmra2vJnE7WFOp0ivU+784mvmQq/GSpcHw5fd6UbRam1JRcGV?=
 =?us-ascii?Q?+h736ICT3CKPcF1erSQHKZbpusjOWppqjHu1kWj1BLCLjrF/jX/VQjR3jnMS?=
 =?us-ascii?Q?jHdCKoeWzqQpIDok/AMqjhRYsDMgnNWvaX/j3SPWZ2WtShdBJLQL4MbM2L5M?=
 =?us-ascii?Q?dgEjI25D914euB/+SGHLgu0XXssKq3LLQahZLP8diaYpF63N388cbG86kZCR?=
 =?us-ascii?Q?AAWA/eitTKCUEP4q0CPfFYzohrrU3H9sRH2Hy0bhufdqkva2qsg85UW3uZ9d?=
 =?us-ascii?Q?pzgXqQq50hHNsBQ8KyLv6AAalVkV2unH83o2OIdoOixCIctmXesOlZuTTpxK?=
 =?us-ascii?Q?q/it38pxQLLNwtereqgIfARzSKrh1d+jZuLzRkLZuoovDUim9pqkwENANtlw?=
 =?us-ascii?Q?vknSw1+P5bW2XUSeKThf3VJNArMXgi4s381B97tonblxnC9ot3eYzvh93Ne0?=
 =?us-ascii?Q?cTOK+wEwGzd7uramlaGRabC3GcRNMe39KKXevKDOvSNpn4XB38LAPnoCegNx?=
 =?us-ascii?Q?Cp75HPEXd8puGESUmDILqHAgRYovloPx/gvN7m78+gtD6Sl9nGR9XLox2vXn?=
 =?us-ascii?Q?+NnNDoIF+zfjqmnSRDN8RL9QnQTYzacQ9Knan0kyYyP6Ti/TgPKJ8lcEW4+Q?=
 =?us-ascii?Q?4qBTDHixQAzWa9gPNx3x2ygsHuxPOisnp6GRpQksUyNXH/t75ZvESFpfHKPX?=
 =?us-ascii?Q?+nBJ4jwx8rhpRkaa8xDjtSSUz5keZY3IiJYK1gPbJc4YVo4rtw4vyLLSl2cu?=
 =?us-ascii?Q?VXVBV8VZjLKTnmWV8YFlRGcOywrr7evDOl4XhjtQjjF/v6a7XxTGM/36xGke?=
 =?us-ascii?Q?yd9SLUJw25I/3W5OaEBiXQWe7gjkiZeyIFnyDbGf8+MleyxVTQmu5RBwt6qS?=
 =?us-ascii?Q?g363YdYwS7x8dcWdnJI3vSDu4OANr+uRYHPB69mRf7kQhS/mvSNLrOSkXeG1?=
 =?us-ascii?Q?dzFKTfStPVeWsDguO1alXTZb73/GodD26Xsre+Q8OlZElO/BNVDNsu5TOF6k?=
 =?us-ascii?Q?6y+u3cPJAMfqZHp55ZiemRpfE7eHpB6NX2u68BFp0CjlNBUPH5viN8DrcEF/?=
 =?us-ascii?Q?s2LE+Bai2Vhl5vq9fomZavCOzVQCgzV098IigP+gpVnqmCDxjn7hWw8dR4Ks?=
 =?us-ascii?Q?/jPlLFd1adWXRnM3Pac9B/wdJsqBAvjhVchimUDuwEZiov/nF8bNoAtIFCdF?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B5hvwvOW2fvPbqyLcv+6FMD6IrrefZUR667+u8cWu/Na009FkgmDiz0j0qXpv7AS0rOLnoePjR72TP1X1HF85q1UxX6Qh4sehbn4nzUwQ+547X7RpV9RtiUM9pqKbNfMT+tyL5dIvqKD3/1vqFyWcH53cQSh8vEyHbGBB70EtNVsB76xgy9EaJr7dl5L019UO7KyaaqDDAImd0SYO7cFjGp2mzyKNPJT0FTdZxOl5H2ZTqFxBQ7GmXWBMHNHzLgEeLJXghveBW2i2YCE7f0mjbolWTZO4KI7i/0Gdp2t8bT8D160O/b53xVRft/sCmNPF1FmG0SjR23Nj10UhIvorPt1IWpjUWNN3yLPAemnKAKQHekhDwNCnVVHCmROKwuopSC/15wiH82SZLYOKeafpHxB5PZVQf90yscLVjocz55jTvuIv5S5SA73+jCdAt0EFeiN6cgQuiYPHpiMONiTbO5tteL75XYShXZyI1YsZmJw4fmphxTfBgcL0oJz69NWailfbpQ6mc9AynN7V7t6rlKQ1WaP4+Atm0N9EFsz3lL8/c/Bp62EpzfI17zxyTE+g9GPL9ZodarfpX6EeC5O41mZbrBZn+n5FD19CXYTPkY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f02ae4ac-cbd7-4763-3db0-08dd8ca4c53c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:49:06.8979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuIDshUdpFjPlwHfW7+GVMZmfRScLRyrQcQVTrV8ATh4mQ/yHNDVNCpCsXvbwe/gaD77S3iMk/nKgtJasX/Lw0rXIN4U8JsNOYBXISo0Nr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5946
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=957
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505060133
X-Proofpoint-GUID: auWsQJfEo8UoWqn8_7MEpx4UPWP9dbEm
X-Proofpoint-ORIG-GUID: auWsQJfEo8UoWqn8_7MEpx4UPWP9dbEm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDEzMyBTYWx0ZWRfX0u/4WPlpTXJ/ opbRzf19fewOlkKEOxNzEHO9Ve8XEGnzxVTnaQfPr890STHDcHixE3LZ8UdSFFqdG+uAx2K9u7h 5zIfr6gaxpFlIeiHhNcRms5sm3OTDIXEoktTZFOGjxnLPbq9Cj1XIivOjB6viY4dJTNPAHRW5PH
 FWn+VnleyztJCo0OmdEXZPOSRjIsr2f6+I56RKaAYcBTdMiPQiRGCr3Wtj3tmiBwsN7M/CFlM8n hgnyK9NmmqQN82lDefucNFwber1gOnSxheIecK6g8S2PfV9XsaKxpYJ3YKYNipACu9kXmIgoql1 CJKidGAYRc6DjAbA8JohrgJZeGfiXyUBKhQIPzRGsIRbcoo8tSdMfzVNy2Dw0ysjZd0qD3SbRzc
 pMj/Akq+RiIX4zLBjJRWWM38yFSWw8TaMQYpm26GKoqNP2Rh1fn7B9RYdbu9p8OtWKpVd/zD
X-Authority-Analysis: v=2.4 cv=Eq3SrTcA c=1 sm=1 tr=0 ts=681a1357 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=noYWoIMm-Fg390mqgfQA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22

On Tue, May 06, 2025 at 10:30:56AM +0530, Dev Jain wrote:
> Use folio_pte_batch() to optimize move_ptes(). Use get_and_clear_full_ptes()
> so as to elide TLBIs on each contig block, which was previously done by
> ptep_get_and_clear().

No mention of large folios

>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/mremap.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 1a08a7c3b92f..3621c07d8eea 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -176,7 +176,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	struct vm_area_struct *vma = pmc->old;
>  	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>  	struct mm_struct *mm = vma->vm_mm;
> -	pte_t *old_ptep, *new_ptep, pte;
> +	pte_t *old_ptep, *new_ptep, old_pte, pte;

Obviously given previous comment you know what I'm going to say here :) let's
put old_pte, pte in a new decl.

>  	pmd_t dummy_pmdval;
>  	spinlock_t *old_ptl, *new_ptl;
>  	bool force_flush = false;
> @@ -185,6 +185,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	unsigned long old_end = old_addr + extent;
>  	unsigned long len = old_end - old_addr;
>  	int err = 0;
> +	int nr;
>
>  	/*
>  	 * When need_rmap_locks is true, we take the i_mmap_rwsem and anon_vma
> @@ -237,10 +238,14 @@ static int move_ptes(struct pagetable_move_control *pmc,
>
>  	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
>  				   new_ptep++, new_addr += PAGE_SIZE) {

Hm this just seems wrong, even if we're dealing with a large folio we're still
offsetting by PAGE_SIZE each time and iterating through further sub-pages?

Shouldn't we be doing something like += nr and += PAGE_SIZE * nr?

Then it'd make sense to initialise nr to 1.

Honestly I'd prefer us though to refactor move_ptes() to something like:

	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
				   new_ptep++, new_addr += PAGE_SIZE) {
		pte_t old_pte = ptep_get(old_ptep);

		if (pte_none(old_pte))
			continue;

		move_pte(pmc, vma, old_ptep, old_pte);
	}

Declaring this new move_pte() where you can put the rest of the stuff.

I'd much rather we do this than add to the mess as-is.



> -		if (pte_none(ptep_get(old_ptep)))
> +		const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +		int max_nr = (old_end - old_addr) >> PAGE_SHIFT;
> +
> +		nr = 1;
> +		old_pte = ptep_get(old_ptep);

You can declare this in the for loop, no need for us to contaminate whole
function scope with it.

Same with 'nr' in this implementation (though I'd rather you changed it up, see
above).

> +		if (pte_none(old_pte))
>  			continue;
>
> -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);
>  		/*
>  		 * If we are remapping a valid PTE, make sure
>  		 * to flush TLB before we drop the PTL for the
> @@ -252,8 +257,17 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		 * the TLB entry for the old mapping has been
>  		 * flushed.
>  		 */
> -		if (pte_present(pte))
> +		if (pte_present(old_pte)) {
> +			if ((max_nr != 1) && maybe_contiguous_pte_pfns(old_ptep, old_pte)) {
> +				struct folio *folio = vm_normal_folio(vma, old_addr, old_pte);
> +
> +				if (folio && folio_test_large(folio))
> +					nr = folio_pte_batch(folio, old_addr, old_ptep,
> +					old_pte, max_nr, fpb_flags, NULL, NULL, NULL);

Indentation seems completely broken here? I also hate that we're nesting to this
degree? Can we please find a way not to?

This function is already a bit of a clogged mess, I'd rather we clean up then
add to it.

(See above again :)


> +			}
>  			force_flush = true;
> +		}
> +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, 0);
>  		pte = move_pte(pte, old_addr, new_addr);
>  		pte = move_soft_dirty_pte(pte);
>
> @@ -266,7 +280,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  				else if (is_swap_pte(pte))
>  					pte = pte_swp_clear_uffd_wp(pte);
>  			}
> -			set_pte_at(mm, new_addr, new_ptep, pte);
> +			set_ptes(mm, new_addr, new_ptep, pte, nr);
>  		}
>  	}
>
> --
> 2.30.2
>

Cheers, Lorenzo
