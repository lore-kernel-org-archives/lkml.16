Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C751F4285
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751347763; cv=fail; b=sNBTHLcPlJLJXsbdK12Xv7Ap5Wcu3lzGi0327A/B48a7iC4z/iObGdNp6USilQPYHTtwXYEqFjb0LDGJvZeOdtnz6147lym5scO7sQVzcpVzL6h3J3yij+4jL43BfoUcBpi5yJPGIAOIE8MxwP6XGubuBiypIo+OfArkhP106+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751347763; c=relaxed/simple;
	bh=uuVzNaER31l1BqxN19wNPWHJZ9LmMaTyXzdj+VnRRSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R5fZERa4Tpg4OgIXu0s+e8rLuoDsRE8E2Rkc73CC4LGqpBKfyuTQAgtXbVUON9cezQnkRSKBgARNLaXMg4KDSenQiNBVYoVDfWQdc4kH6nHhjQu8YOa3Ra7aED0mid728k/Yap8kzr2QI4Shlm6gVS23Ww0iAvW1GZxMZgCYzT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PcJJzqZf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wjhnJMyh; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PcJJzqZf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wjhnJMyh"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5611OWa0007061;
	Tue, 1 Jul 2025 05:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=uuVzNaER31l1BqxN19
	wNPWHJZ9LmMaTyXzdj+VnRRSo=; b=PcJJzqZfH4IvmyUWj2+QccFmfVDDahG/A/
	NLj2QiuDEXKWgT2PRyEUEfyrAPyI9FhplTu2vDTrZuYGnEWv+hUh4hbhHOP2fiV1
	LLWn7M4UoKsakt9kLHsdZbzaA5zNyv5vnwX84zsfhj4jWkci/x1DrcZEA0IXOdQc
	JjcwJTPoTs9WjKWaB/BlCciRR0S2xZqomsMu2VMOejPwD6l16YWEzhWY1WnnkR6l
	2ILcDIu14RmvYlMld+E1r+IZIykgsBQcSfK3kDnWjp67GpsUw5sjiJrZd7Ftx8V+
	LdaABSgn350qLLx51cWmKpFPof2Jk74isQBF9Tx1OBPXZ7YkapCg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j7af3v3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 05:29:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5615Ji7F009206;
	Tue, 1 Jul 2025 05:29:03 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u99kmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 05:29:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=my7L5GcfElsMRt1GBW9/EDbLf3i32HwEDPnl49foB05VzSrcfrVTPPfAXs5/HsIPnWSAqXZVYasAPVXqVNiQa25XCm2xJolsjT3gBVWHmznNdOmZVsMHBWmd90aOL3gQaTM12Th9exUWyTbt0IBnYAJSZA260CK4Aupw11OvYzFrSzxZfAgJTE4fj8NpJbyaF140NluBY6bDGyqYpcK3NQp17a4O7J9v+5XSR+HwJtzZV0hDWbLXjIvHRY0pJBLmHU4V3pmww9+R7HruhAKsRQ7fuf5OA+Mq7g4o78VguHZRs1EAfHkZpTx+wdW+Rc1IFr18SkIcKRuKjE0Itb+WXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuVzNaER31l1BqxN19wNPWHJZ9LmMaTyXzdj+VnRRSo=;
 b=LjM9HXlU3ERZmAgEFvt2PJL6BUh0Qud88703a9qyYVLlfaYFsnLmwqKgv1Flx2M5s3Dgvn/rIeborSa0P0CQPGp3IfCyi7DSX9VHHkHcE+ZefZAY4+lb9J8EelIYB+uiVnPalOUjtWdphMzf0khOlCWOJn1egIcEj655uwodvY1KPqqdB6Am8/isFp+WJ0Tx5lR9TIfkfl3c61LsahI+J9eUyHvtuVSKB94CKM1NgkjbvbSu+zHhQyRpzgrWYEjlNcU24GqjTfNZNg9zJfv4J1wnZHqKAoK8Qfb5PwNc0u3qmkJqxublAmfFWLE2qZf2RvH9FaH6SSASxtaZCh6n6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuVzNaER31l1BqxN19wNPWHJZ9LmMaTyXzdj+VnRRSo=;
 b=wjhnJMyhtNJbyvJ3F3BxRYdURcusvinahgGNwt3LK5k4kBTIbhSxPWjP+n+JKusJzMEJNni9vnF4UH0+kn2MIZCklmsrHzpNZRyhTdzO8XKYMmtt2EfC3UzxrtqsQR5RuZ3A1H8X+v4wGkX1S/k98WfZA/4YVf1Cb4wZpev/0YA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 1 Jul
 2025 05:29:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 05:29:00 +0000
Date: Tue, 1 Jul 2025 06:28:55 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: siddhartha@kenip.in, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        mgorman@suse.de, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm: limit THP alignment =?utf-8?Q?=E2=80=93_performan?=
 =?utf-8?Q?ce?= gain observed in AI inference workloads
Message-ID: <ee92d6a9-529a-4ac5-b3d0-0ff4e9085786@lucifer.local>
References: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
 <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
 <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
 <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
 <ba2c89bd-88de-48f8-abd0-b62d8b1d50b3@lucifer.local>
 <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5816677a-705e-4a8f-b598-d74ff6198a02@arm.com>
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: ad615646-dfe8-452c-d058-08ddb8602f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/youcb5eeG/DiARIMB94dh8CDna/UOuF16ifIhXZl4p8lsoGlqOQ8Odis9V6?=
 =?us-ascii?Q?COSRRUoj6HMnEnhQBSAAfp76u5gS+efMei6oAbsAdiF1tcq2jnSXSWT04T9Z?=
 =?us-ascii?Q?fAAbTwMf238+VXqDLTePs7iqZqHXVsb8Yq9Cd6UrWZJRHneaDEx3ncD6GQDo?=
 =?us-ascii?Q?hQKcm9KlHSvkdA31wVhBVyaUdlg0fgpMQOUDWO/6cK+dWBdLGnNdmRs39ont?=
 =?us-ascii?Q?IU3jirJh9CXEjIu82/MJgmpFjZubm35juJxnVb3SKtmA1nLaDoNg2U1CegHv?=
 =?us-ascii?Q?aKPYE3QvlRpqrx2RxdKr30/YO45CmbOAl594t4iAtSVpo2jESiESIlmbJUeQ?=
 =?us-ascii?Q?Zt2ozMUPKEd5XfWvdPgBkXw0GC5UHsBfufCkdTrQktgMfT7Xdv5rl4j1nv4F?=
 =?us-ascii?Q?S7XbrozF8YF5gD4Y1UCt58wnW/33XQV4RY9wlPUXebjPxi39TbZf779Ic6wt?=
 =?us-ascii?Q?sB8DOKLocjtjWNfPOx27IE2NVyFHjQMILNx3lwVrj7ZzqeQ+n0CRHEG2Edc7?=
 =?us-ascii?Q?cawJPUHhwag5fAobYlWWsN/NASJyYAetHv7jm4uvA/+OSFLCfnxccsgVDvQ6?=
 =?us-ascii?Q?FPN1jf7Sz8jhWBtNcAKtbZeT6DGOAW/WoFxzNG/67ltehnd4bg3TFa0ul/yU?=
 =?us-ascii?Q?KnRVVc/i/WwuRjKYGlI6PKsMP4sEdOF0ZrajI+k9l15CC0Bjp7U73pxNQ715?=
 =?us-ascii?Q?ybrCfJMTEV7wcjOAfWX6B3uMU/GKw0/1e1rjwani4FwmPmvpcZTIxPlt48PL?=
 =?us-ascii?Q?y1+GEc53iUEB22KDFBHB8OPp7Up9kfJf9tzGesNNGKkdGNxLKGs2tA4zM3t6?=
 =?us-ascii?Q?h38jZLVE8+n2SWLXe7Qg4XUDy8laMEVbUDva8sAuGWI3GqBFVBVhCXVvbq3S?=
 =?us-ascii?Q?WL/tfItEmPmbN31UAAdU7t33liEz5b5LDyaBnM9uJE6fgkHkiJqqQk0x6k4F?=
 =?us-ascii?Q?m8RgYuYTMVo01NPGZvWzFesh+zHswcTei9xhEtv4AuVqpQlIzObXR9lapkwi?=
 =?us-ascii?Q?8BlWSH0FoheIR3haZ1R2mpngLMuns6VXAUSDGsouUx/RA7qw6o9JMsQNPeT0?=
 =?us-ascii?Q?wuHUzopej3jAD3UzFxsfRxzTEVZGLXsUnjATvOCObg0CQz1gfYj2EJobd49S?=
 =?us-ascii?Q?fqmUkuwCmwdXQoqja1wSHQffZ9vFIFhYMd/sZwUnifMK/tHYTx2TpEfoFBbw?=
 =?us-ascii?Q?LxKSDOgPP7tjaPnT6zp0EbpSuCh8R0pzfNIbps0roEKPKA+O75v1dGZSQUR+?=
 =?us-ascii?Q?Ic8R7k0I/gG6eN5EENk+L8/z97tx1Vt82DbkiCOWzs+bCAoFzyCvXCNTpW+B?=
 =?us-ascii?Q?W3OuvnJRf4mTCnw7MKTv/GYPQGR7ns4B6lwnPyrX4DH2RKz9s78/PkmJZJF+?=
 =?us-ascii?Q?syEpAVyTT40cy+89WeQaW67EsEsW4p0kwNkcNVR+o3n4WyctmEO4sxPR217F?=
 =?us-ascii?Q?eQlNZE2t+f8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q3u2YtJjtt8rISb6kj+b4pJIGAcrfaBZ6z8x5g506C7HEa95fA6b2TUiskxM?=
 =?us-ascii?Q?Y3o3BM60aLPi8fnr+d6bMpDoWgkFAu5HtI8XYLdI8tWjAP/E9aWZ9qDNvTXC?=
 =?us-ascii?Q?7iiA46ywlkB+7p+wgOgFX6Y6FIetuMC6SRqaqW/Lf1Lnx0iBMNt9D/PE4i3A?=
 =?us-ascii?Q?CPmjQH977jRoqTpe4q/P8A5/qbKqj5QUceUeXZh6gm9MRIjnl6GtoSLXEtce?=
 =?us-ascii?Q?YKE44OMB1KN6pdacIhbb0nwwRBXRY3zS3iEHRy31BICDUUpRrtl/Q/EZdrLI?=
 =?us-ascii?Q?kZlJsmkUuE2xQIZsqyTXxlPaO8VnC+xuZCK6MI/aF9hdmV6Wy45XnpnYlojE?=
 =?us-ascii?Q?IHUaCwvFCRWsryraiZsZc4h1Io9E4bjrid2koVgRmczJ1xnF9I3tfQb8J4em?=
 =?us-ascii?Q?Pd+5c4q3GZy/4+MW3gmmKfx1rhleolJFxYNGtB2Us9mrlSy7VOEQjidYVcPl?=
 =?us-ascii?Q?uSiCGqu0FEe9ErfNTBfF44JHj/h9aXtVWozo8XIQlMXeDYzXYTbngz0rZMRK?=
 =?us-ascii?Q?kYK0u62HC6jaQGZE0SkkhBSU0HjjxyGg8KU8jnl5p2vQ6N2xFrXdkCkBex/V?=
 =?us-ascii?Q?TBUxEqtCjNgdfXo0rZvGal3SLIT/DXDAmHxXxIz/m+7Ra2pG2GNmTd3jLH13?=
 =?us-ascii?Q?VDA3w0HxsQJ2n8HWNaIaZF9zHCmqlKGMHnLKp5CNQidYfWCYgoJ8A44N65Q7?=
 =?us-ascii?Q?h602qRUSaOAt0VttzM4ifK9ApWoT5AmRve3SrPwzlS0saAcoOpCjJW5TDtRP?=
 =?us-ascii?Q?nAnDHJ2jONUqXqv9szZ7/6p7arcw5cySHzJxY8wCMBjnmzESI8CsFqmS5zNq?=
 =?us-ascii?Q?zuDJCzV9wmAwp2OwCzlmEgbuEyEkaq24KnQApa4HBAuhoUw7yzwpuLWeX9oq?=
 =?us-ascii?Q?1lFqWOo8/0pLr4dnCR2DYtyaGX0PtPzMRpHlabcasMF+G/VUvNiNx3JkEFoc?=
 =?us-ascii?Q?Y+wClN8yiae7ZXW9DPoWg1D0Nlio5/DWOHkJ+eKFGMAJFiZwnT6DxoeHPFi0?=
 =?us-ascii?Q?ZWg/ji4OJsawZOsyiXTPjwPg7hxWRHtTTHkAgyh4YbbsHcKSy9WT236c5r8U?=
 =?us-ascii?Q?Boj6MuWnmPQzZHNpPwYXVf5bJSxMZaW7k1SX4RBAaqgVScDdGF1CpYv7kU0w?=
 =?us-ascii?Q?RL05cPgZ2AdiboKyGartxNtwmXLuDvmVwwVUyNg9JWlHe/xlYgvrz/t3nlUK?=
 =?us-ascii?Q?Dy2V75uhYI8VUSOd/nanKBjtLjM68FuTmqF0A8M/ScTIPS/CQgW9m+jPKw8K?=
 =?us-ascii?Q?zUU6G9Oy3F+HPr/TO6KqUd5OWBgLNGMAWIuczU81QsElKtZjSlf6wjwRe1S8?=
 =?us-ascii?Q?KUr8t2wpEC0A91kLUKdO6Ez/FnX4rgqu5gaY60BRq6waIjZDJhPzHPVKngyI?=
 =?us-ascii?Q?80/6G4qtPpI36Wpz1um9JIxJOeeCGGkQydZl70T1u37OZ7eCI1WNc4PZN2rF?=
 =?us-ascii?Q?Vh0XgCeVBxMb73Bn8RFZGglTcg50MFoV0hXnGRf8Lq9ZwUWeb479vTi5ACcc?=
 =?us-ascii?Q?QQIbLteNYo5F3wkM3TlVznl7u2SIgvb6632W0YdUYpvmImpWCOOPNYPQcLp/?=
 =?us-ascii?Q?z9orEEgL/svnKHBRViJDkFbHjT4ZnDttXbL0yyD/4565jHY/7JlXeezJFiwG?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pvy+LNjcp6xU+QsSKy111ta2zBaebFHZ5y8htaEHao/uM56smLjRmvZx99YJzpyc/mXVUr7wad1F7EQxenZEXagcwauBF9N1REtlFjN4WVawcSDlGzn0muvKZeW3iJYz+QLBtErewCcs2qtlMHIU8ZIj87udVd1BqPi3I57jvjwHXd1KVMouP5UGdhGk6N1NSfElr3Rk5WXhwdsXn9SmDirY262+z3qzA7XuATuKzFC9XKsxZGhywqs/tBpsbdx7kg/3dCkrin+xfjGsqcfi6w7dX/TyKXQBiNIVLzUkLlW7ZuoVs8UMWH1sH1f37aLrbXDg4FhIuNy1gcOz5zcQDZI0TrJ3/Q3bL/0rGtj2Xyw8JWzuZnUX6N62nympGk5/oBk66w0N+XmlvTtTkAqAOHfipj+YCLgVfnkvoqDGGcpnRC2mlUwV03Ueoghp8TlINUqaqx7CWd0TM5J2UTkjObrF4xZjW0Az9Hg1iKWE7uIYcbpSvJbAh95h8NpC4kMIYkE7QwOHgdNXXJmGbhSrgSa4IFvFkn4wNT0Q8w1bt7E4wjNKm29B4uE+FzEABWqIVYAfXdirW+uPFH881eEmsRI5QsmQgEg6KDN88xRYCp8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad615646-dfe8-452c-d058-08ddb8602f26
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 05:29:00.4791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0HekksavAJwSC55af0Yzi3bt31GLJrtZ5j7ixjq1uVaqbBm5mVsExH4Vbd3Ye2WmLYNAIfsDYOhGtUc8C8IYPtRrnpZ/Z0iyqkLfKsaPFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6608
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=460 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010027
X-Proofpoint-ORIG-GUID: apJ4rYbYr8qFxBNVq9NyrSIsUeqZRaa7
X-Proofpoint-GUID: apJ4rYbYr8qFxBNVq9NyrSIsUeqZRaa7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAyNyBTYWx0ZWRfXx7oQf+QcyqO2 lyM1FhkORXe9TN+53Jx8eX/bxyExRoWIbh/e807rlpHm8baEvb/qC4k7BALYQruMGSQ+7KG3Jhj VwFP04jVUKNCr4B03OOphOKd4GwuiijX9IjMHEi7fJP4DO3eWr5sgke4LrBgL6OI4jz01tfNGzx
 7pBS0rbOjufQxcsHFDANCkpxcp3kn2JtCfXNCcBwoTItWYPxagDa/o8ELRsOXdIaSiNZDWo9JUC rBm+sSjmuCFxUd1EUKDNo8vxv7HxceQoF1PPBKa3moSwyo84nVWecFiN4Si5sjp0PJi9qAlNIOp mVCy6KWC42zYWgnvWjuVVxuM2laRHFKOET1jBi8nWDj/BMYt8OQtK1f2zw8ssAJJA9prHtzyswT
 KqReST76ZG7K1vg9aPRH8nOSl/Bk5GQemkmgRTE8GBXhxDsS9jlPJHR+xYUNV9VOMY4pHRPE
X-Authority-Analysis: v=2.4 cv=b5Cy4sGx c=1 sm=1 tr=0 ts=68637221 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=5KLPUuaC_9wA:10 a=GoEa3M9JfhUA:10 a=1EJw2LrLuJAhQPaMYD0A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14723

On Tue, Jul 01, 2025 at 10:53:09AM +0530, Dev Jain wrote:
>
> On 30/06/25 4:24 pm, Lorenzo Stoakes wrote:
> > +cc Vlastimil, please keep him cc'd on discussions here as the author of this
> > fix in the conversation.
> >
> > On Mon, Jun 30, 2025 at 10:55:52AM +0530, Dev Jain wrote:
> > >
> > > For this workload, do you enable mTHPs on your system? My plan is to make a
> > > similar patch for
> > >
> > > the mTHP case and I'd be grateful if you can get me some results : )
> > I'd urge caution here.
> >
> > The reason there was a big perf improvement is that, for certain workloads, the
> > original patch by Rik caused issues with VMA fragmentation. So rather than
> > getting adjacent VMAs that might later be khugepage'd, you'd get a bunch of VMAs
> > that were auto-aligned and thus fragmented from one another.
>
> How does getting two different adjacent VMAs allow them to be khugepage'd if
> both are less than PMD size? khugepaged operates per vma, I'm missing something.

(future) VMA merge

Consider allocations that are >PMD but < 2*PMD for instance. Now you get
fragmentation. For some workloads you would have previously eventually got PMD
leaf mapping, PMD leaf mapping, PMD leaf mapping, etc. contiguouosly, with this
arragenement you get PMD mapping, <bunch of PTE mappings>, PMD mapping, etc.
