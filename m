Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4CB1991B6
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 21:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746307187; cv=fail; b=h05+o4l6rW1oC9JTnL+8D0EHAdlVoL9YwNct1JnsMLyfCOX5KoXoWDiMbvDiZ52sAOejyoulV0Q8G9G6nBpcD5ky7k85oxNPO549WgmijdRTBxSUGKAnPw9w0UZrkpcd3TRIyha52hYP/VcZvAsd4ai9QVjMxzKuxZqpGIKr/y4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746307187; c=relaxed/simple;
	bh=Wa2teae9la0jj3Husfjg2vd/LdfhSYSQ0U+GUSWPDDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gDZa+ZErFKWTSgJtsz9s3fBsRDIVHkQlCn2pSiTDZUgfePJEyO4/tW7/AuxMoOjJY0VRjMN8evplcD1MeqAuzyWHKpl8xltBBKg9Rwov3i6+xeU1Z2NufPZ+1otyn8qNo9cugIRgRY5CFULZo/B3+8J7sgdgtq8h+Dpe9Cbg2L0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JswhwKzU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gvo28zrS; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JswhwKzU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gvo28zrS"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543K54Fb012194;
	Sat, 3 May 2025 21:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=r1DKRf/xvB45NQsXWqQvdJTqvAOPSwcBvqRSoBzOBg0=; b=
	JswhwKzU96QjXJWmrbkGcMRzK7KflROyFQYxZH0fkcZVgjM1wMiQBZvnlvKaoBAg
	K9dz1e+F9c4mbNY9K/UNOtImdnlvm4YSs4ZKLdiDxNhTP1DDHWJ6UQpMx6NiX0Ox
	z+hayp6ROIK18NHHhclGlP/K6bpojG62rKwz/VfKVqtuPLlEcq51SK08c/YHU6IZ
	NKT9eFVeUNeaKPNxXl8lyQ5Ol2N9/EEvF50S6B+se1/549GiC6kqWui69UlwJ4Do
	b3i/RGBHj5toqghtzyKr1YThlaT7Z9J/RXnbbvo6Rcf1KpBmSwuZvx02vNIkwIxW
	iFudEDZyLhTFXalvIPa8Yw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46dstt00wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:18:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 543Ia7ix011165;
	Sat, 3 May 2025 21:13:05 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013079.outbound.protection.outlook.com [40.93.1.79])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kcq2jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 03 May 2025 21:13:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmN/k9aslAvrvfD6lJBhR7Sn5Y+HOIioFOwQTRPVP2Ybb/XIRqftdzlPeY8wBD7MCA9BY7Nxeqmfbf+4GJ7e1xG6EnBng11u5hGbcPFKeQaVr5AjWixtiohPEtNuYD8dJ0Y68EOPwjOU+mpo+4joGsodbVRgr0UjQW3778QCi95ePsUJp6Y6Q/mrpICrvkQRvZ7UmK9HIRx2lkl/k+Et0pStSvbvq9Uld85UaxO+M9J6vh8CkBATlnD1+oJVYQw1UpIHwrs61U7uNYa+uE+YejsjZGSkA6SP9A/1JIwXpORPueMXoSqfv8MoJUW8JwufNeSw3UW6Fv4MNQQMEfCTZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1DKRf/xvB45NQsXWqQvdJTqvAOPSwcBvqRSoBzOBg0=;
 b=LyV7fN7fvMQOAy8x9xTCI72nWss1gUsf0KpruTlI5TXG7keupIDKYzoydHEqQpFvS15ZFzMbVNa/JtuOVGOyAtebjcsJOflKUMSynIdkYd0U3qsYuDOTefk5M4FABIDgVDkE+cjn5pojT+pzuUlXtGDueisg0jeU6YVI0a4DgC+s+9IBO0WR3ShlcNvfd5PJoQwpNo+OG4PhEzHJzXoA+voLSsrIVhvnDWn8yoVdNgRDmnlTWa04h+ealzMxD+JsWwVDx25KsBuLDdn8oXGlcLLQTzWYGJqaDk8pJ0FXxc4pH0HBBLrdnDe1EsAKS7Uw/NvTYujB3we2MYGwS1N8PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1DKRf/xvB45NQsXWqQvdJTqvAOPSwcBvqRSoBzOBg0=;
 b=gvo28zrSH9ufez6Z+ttoqRVvNy34ILyhrnsoTJ6tExtfVVKtBTSynXh70oc46qOCHJj72Rgra1k77UyHXl612k2vQXwlqqoQ+mDeJVTrmZRCTV1F1Y4t2pTILNY+4Y2HEitoerRbpZgIP5U4GBJ1bXI+lkO9P+Ow0gzESL9hJcI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4373.namprd10.prod.outlook.com (2603:10b6:610:a9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 3 May
 2025 21:13:02 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 21:13:02 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 07/11] tools/testing/selftests: add MREMAP_RELOCATE_ANON merge test cases
Date: Sat,  3 May 2025 22:12:29 +0100
Message-ID: <95d5435f0695121656b5a131def669cedcd28174.1746305604.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
References: <cover.1746305604.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: 53de2bb5-5b8b-4e07-2de1-08dd8a874a3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8eCb4yqS4Lmi7ET/YhtfsmaMr2cRn1iiSONzjCI8/TE0giungmsiKgGahe1F?=
 =?us-ascii?Q?579YWwF7gA/ff95WjbfruRJnEdGVtGHYiSynwlrYiis6CCY3q1VP7d/8V+2L?=
 =?us-ascii?Q?7SX1bIUdirablbBaRjUVkfSr0CqZJYVq2r6ooYHqLaP5woDdfAfyf1cV8Epz?=
 =?us-ascii?Q?P+jD0AEAYEBVX5HA+UiSyL1uDjITGk138Wdv+krBgAzdNw3Gho7tOdSzEjcH?=
 =?us-ascii?Q?/lY3+iEArW7M5w39NwrfJzZgr22ofCQtpjyQt5VTyznCvFMEHT8KJAF9IVMD?=
 =?us-ascii?Q?QVVHCXDgrwqOCpgygxpoDpPiXLEvts/1FTAPJCWMuwZKNDOQB6+IZO0auc++?=
 =?us-ascii?Q?RlfYrpqNEwD/dVeK3VpGBKy5IvjRDuuG12ahqGb1j6OxmCmEnAA9DhV8l+XG?=
 =?us-ascii?Q?6YpW3mNi1VhBM6fu8PPfZUZuM6SSWS2HurGijnSiiXoUEPeI1yjZ5Yq4LnhR?=
 =?us-ascii?Q?G1EGan55C3DBOw+86QuInOujkuEeEl9d7pSzXA0lE4YlYOv/5Kvey6R13696?=
 =?us-ascii?Q?Kn5jcg/Qogb3sSb9UL4xIJlVV1+L1ZWYpEsJW9IZjqEbcNwISNIxb+eqtIFD?=
 =?us-ascii?Q?HrEg117u4fkiADQ5O/Bg821LB4mvu6PI7YsTgbzE8SO8iFAf6EP6PIhWqdni?=
 =?us-ascii?Q?aCzhUCDZoZy356qiSZiTZvEbZSWaYvdrx4wB642aJqMhmdBqwsCj3DJiSoAt?=
 =?us-ascii?Q?1euBK8KNKqrFIYpwBIvUg8cQx1GnSrWTkN7iYXIZLh/ptT4WLlkpLMUdiEiP?=
 =?us-ascii?Q?NPXVV6vj+/VRc8+8UsXWD0qzhATIAzVt1+NJcLTxwf59I6JGlHZhlB9t0BwP?=
 =?us-ascii?Q?U9U5wFiCw7otKhzsYJgnVLwra2xVQNmClMP92WhTtOiO3vDHXcu3a8k2qnCn?=
 =?us-ascii?Q?7KTPvN2EA1+Tm4v3XOngcFW8IF2Fdk+uPXZ43YBYjvay8tMHiNpgQUVvU/z9?=
 =?us-ascii?Q?D/lJREv/QwJKKUcPbTAO7BMu6jvYz80QWMf2YDA2qwXgJJyDJ/UQW+dk1+2+?=
 =?us-ascii?Q?RjqD9GSP+l1zYS49YvwbJzMpystFXRM7jmNrQjdrUYU7KsjgmcvOWmEHjzh2?=
 =?us-ascii?Q?zO6stAfG4S23AcPOghdQjWICxrrHIz8DbISwzHYmC6Rz3Y8BFI0pQKsCBAxP?=
 =?us-ascii?Q?QULrrL94PvsAdJbjstuVipjQPa4R1aKOkGKiaS9sfVGGCy1CR8LhVfDk9HOd?=
 =?us-ascii?Q?IlntSX7di96dTlfzbC07RvIdZyIT9JV9GAO8gajjF9zZDsAix0uTCuHUgwSP?=
 =?us-ascii?Q?rwKgHqh38er+jHxSsmAoFtEr9MDoaegPQiL3cuQKUOWJuMjatCGOpqfeqC5L?=
 =?us-ascii?Q?ngwglD2sP5j3sSgevd1LlF69CrjWwbZMHja3yL4ubpAIY5fhtZt87X3ak6j8?=
 =?us-ascii?Q?iK6ksncOrQ6m+HNBiyuUmp3aLRgAUQyLYMLVnpXImZMapZ5hO6gKF5AM0fZg?=
 =?us-ascii?Q?1K181rDNR3Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oWIemOuP+ciLQr8kRqGF/rRGr3S11dPvqmHTDSen6qpxGJTBcWK/6QCiAQXT?=
 =?us-ascii?Q?x706UM2EweDllLDZ1OkMsYE0BkpoIZ2GRLsiWji9Xq8aEXYN1vzVLyt/OD8j?=
 =?us-ascii?Q?lEHCq3HvWlDXh81j1Iy9EeASi0WS0NjIIqKNEzyjIbqwHWp9lA1N0Y8W6leu?=
 =?us-ascii?Q?Gfq43nfLdGs4UFDzc0LBAqscuOT0k2r1XW55lhMBgTP5qGINjUcLip6Lm912?=
 =?us-ascii?Q?zZMzk9slJH9MpSJ0A18FoDIkGKX9AXDAsmBR6QTL/dsu0uRw2Fk72deqFQUT?=
 =?us-ascii?Q?vZoc0HVp7TCVh2e8h9lA04YM/HylO5SCbaF1HlyB7K3nQUNGsNjgb19+AUmk?=
 =?us-ascii?Q?U+hk4449ewNX+hckbJ544jYBydB3AnF83doJdZ0jlkBFzPhjC9z2+U0siv7U?=
 =?us-ascii?Q?Ggy2Gm2gM4lHewtWH8gTo9NzCPejvR1emsQ3sRVMQqZUm8F9JKTunhiOAJYu?=
 =?us-ascii?Q?Akd0W9MLlraZhuoO3BVUOltP4n+LoxVc+/5OnkTju73pq+lqS7kkSQbWTMi+?=
 =?us-ascii?Q?vrIGmYX/iroXH+rKwWxo04R7dhCl+ZXkv2qEwUcwapNl4lOvFbnYVSFmiJFi?=
 =?us-ascii?Q?0JcXcsvcrMLF0WOebN8olM5ArOnNWB5D9Wy+aeb0gGTzPXHuGcRvvf//ceNP?=
 =?us-ascii?Q?d3ynqHtIz0DHwPBi6o4qhPKyfjqluARbML2qm0cCDeZlGiYV2ndX3zMIfXK9?=
 =?us-ascii?Q?4EPNmW4VaV0nn9MwC1zLQ5mA0m7OHOtHSgfVwyABwrieWsI4n37TDjxq74/2?=
 =?us-ascii?Q?fXKid6V3uYaunGNQgIZSbGss97dDNc9HN5+YKrc8GWdmLQnaMzNCYfCJIyWM?=
 =?us-ascii?Q?irBb1C/H1FjA9B5nKW8Zah9pyROx5TtfwNX1iJbXnwBTJa0uMk9vdg+xmYmh?=
 =?us-ascii?Q?Xobc+n1XAYmvm6qQ4qFP3aAMQlM29OPVEBwo+7fbyIBhQ18iBzHQxLbnwGBi?=
 =?us-ascii?Q?SAYerfByZdoV/+aoR1jl72HFROd5fCWaeGu2VmHkCgJtpnSpsFykiOJsb3nu?=
 =?us-ascii?Q?RhJh7X6W3uPFJ0k8379qc0GwdDkYSc325/iMTTnXVM3x1jbvQGAUyAyeCL2j?=
 =?us-ascii?Q?xwqcQhtA2w5tnYU1OYAigqk4fdkQGpRQmq2QBcjZ0foheufUiDB13evOjpqk?=
 =?us-ascii?Q?THiB2WopCieDOrLF7u4HX5y4aQX0ueBKm1IFrWbSsjpCuHddcB4X4L1h6Tu5?=
 =?us-ascii?Q?bxah25SeZkRLSo+I/QnPEV65e1ARxW0Ni2EuTAgZkEctQriIzigCKm9IIXJH?=
 =?us-ascii?Q?eoJBWgpU5fDAMJ6OXprKmz0WsHJBp7dRLpDVsUOYLgOvhzA/U5GVIILXyPZT?=
 =?us-ascii?Q?Nfnfy87pqPYXaiSsUMAItrRuQvabDccONT/fd/M7xLPaEpoTqt1CfXl5EtYG?=
 =?us-ascii?Q?H502OnPE1a5Bbc/J8dJ0ZzEXe8MauVISRnU1MDGi7ehkixZTKQ4xlc1hmUVg?=
 =?us-ascii?Q?4Pi4Tu36+w14sFZlRW5rYLrzVrAX/sb9sdtreHfAP8AqRij2THV4hpYjejND?=
 =?us-ascii?Q?ecEv/X+Sb3yr7eQN4utV+7yQL2j6DLuhKOIkTwKAQJVmQM2HQLjEZwa7PTmQ?=
 =?us-ascii?Q?k8in5Yz2CYk39NWFFJHo6JbLHIWLkWWfUn6KCeqAkabN8VgMBsl6AruVLSlo?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	CHADge1ouIfCjoG6J9svazq/rkR+FPuu2beO39giBdqytA7Vxe8XC3PXr8NqLvczmEnUeo8poPe2vvLqfC4p3pKA3jZH3hEn7Vb9Zwje7ZRc8Yr93Dpq2fS1vNNsR1R4CkZrFazHb1y7coEeAD6LR975RCa+/fZAJUWYx5WD1Zxfybxv4/Xm6IsgMglQ98NVoRFVlac3ivwIKcXjyDfa58BHiZkrMRsCTyOnWoI68hwDHHSiQlkvyh4WonMn2xmT53WJctXLN0HgVZ9UtjeZMlHLiA5cSDfeXOu1SYos8S68sQc1PxSd/AZpvUYgjnLGzKveVyqJ4ckB5dcb39ZVqvlZ0Ktc1EizFX3qo7ncSrPU+IVanVUxH2J6Wk8mVhT6aoW5WfRg6KV3b9FC3Kr0mRxLIw9MtUpNZ0LLjMe6F3v0MasHFso4Q1Zkk1gdN8B42CJOthlTSvNV6mofrwa1ugOmxpugrDYGlaCrWiH2S2mMZnZS39lyVHfFKOwx7a5Vh8h4Cs5untrUe0bHH3UXAXc3Ep/K3c3U2rZFnD/ccJWe9lM8Hm0Z4GqvSM2XXawz7BnWiH+OCTEpQym48xcwebFJ8+7VShT4T63loHlYWxQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53de2bb5-5b8b-4e07-2de1-08dd8a874a3c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 21:13:02.9186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RJr0v1dgGkGrabohILxzft4wuOohFfWNK1LsceOfX5NTuKPh6LLBKCH8HgmGormm2IqpPQaa46FIA0EZBul3jQoCvlYnxbcFA1um8FeZ9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4373
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505030196
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDE5OCBTYWx0ZWRfXwSP+Ryh3aNVl EYH1r+mIVOJSPoL5TP59twkBKaytLJW3gWvHOOiNpDfgyJE9PosfWqH0As78Eo0/Eil0bvkkJhe ae3ufbzAzPuu/fnl4mkanR95F5s2PDKV5zQBjvZVwbU69C/i76DPkgaTwEqTUk2CaEZgpLAlLZY
 URRDC1eaigsyWc12uB9TT1ILfPjeyafhmpt1ADKq0UY2Nq2ukF1VgKWn0Y/sXL6SuYi+FvuMYjh GIxAKGq2oWKvOOXfw9Og6ch3wLDelbzSBclcTlNgwh3QBtYPduWpdQq0iZZo6H69G3gfxS1q27F y4VxFNKRbJ8s6DtT6klKbAjVJxDvZNG5oE9VnHI5hUdBacOA8LAl4tz+nKHPnoFPyv6VUdn2EPu
 DauIgso9Z/ptke9wxLMQJC/V1f/SQvJPwXi5cQy81yP84kIqvmuTVzs+aBC3AQVFiBqqLAhR
X-Authority-Analysis: v=2.4 cv=eJMTjGp1 c=1 sm=1 tr=0 ts=6816880e b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=7Hmlt5ibIiRAvCtG0RYA:9 cc=ntf awl=host:14638
X-Proofpoint-ORIG-GUID: GxEB6-5JHpU18SFIOPM4-fe4TdP_RiAH
X-Proofpoint-GUID: GxEB6-5JHpU18SFIOPM4-fe4TdP_RiAH

Add test cases to the mm self test asserting that the merge cases which the
newly introduced MREMAP[_MUST]_RELOCATE_ANON results in merges occurring as
expected, which otherwise without it would not succeed.

This extends the newly introduced VMA merge self tests for these cases and
exhaustively attempts each merge case, asserting expected behaviour.

We use the MREMAP_MUST_RELOCATE_ANON variant to ensure that, should the
anon relocate fail, we observe an error, as quietly demoting the move to
non-relocate anon would cause unusual test failures.

We carefully document each case to make clear what we are testing.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/merge.c | 730 +++++++++++++++++++++++++++++
 1 file changed, 730 insertions(+)

diff --git a/tools/testing/selftests/mm/merge.c b/tools/testing/selftests/mm/merge.c
index 746eacd0fe70..8d70c24b4303 100644
--- a/tools/testing/selftests/mm/merge.c
+++ b/tools/testing/selftests/mm/merge.c
@@ -1047,4 +1047,734 @@ TEST_F(merge, mremap_correct_placed_faulted)
 	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
 }
 
+TEST_F(merge, mremap_relocate_anon_faulted_after_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away. Note we don't have to use
+	 * MREMAP_RELOCATE_ANON yet.
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault ptr2 in:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * | unfaulted |  \  |  faulted  |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 after ptr, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|
+	 * | unfaulted |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr         ptr2
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_before_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[6 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[12 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away. Note we don't have to use
+	 * MREMAP_RELOCATE_ANON yet.
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault ptr2 in:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * | unfaulted |  \  |  faulted  |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 before ptr, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|
+	 * |  faulted  | unfaulted |
+	 * |-----------|-----------|
+	 *      ptr2        ptr
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &carveout[page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away, and move ptr3 into position:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Fault in ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 between ptr, ptr3, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * | unfaulted |  faulted  | unfaulted |
+	 * |-----------|-----------|-----------|
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_after_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away. Note we don't have to use
+	 * MREMAP_RELOCATE_ANON yet.
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault ptr and ptr2 in:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * |  faulted  |  \  |  faulted  |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 after ptr, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|
+	 * |  faulted  |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr         ptr2
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_before_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[6 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[12 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away. Note we don't have to use
+	 * MREMAP_RELOCATE_ANON yet.
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault ptr, ptr2 in:
+	 *                \
+	 * |-----------|  /  |-----------|
+	 * |  faulted  |  \  |  faulted  |
+	 * |-----------|  /  |-----------|
+	 *      ptr       \       ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 before ptr, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|
+	 * |  faulted  |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr2        ptr
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &carveout[page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_faulted_unfaulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away, and move ptr3 into position:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Fault in ptr, ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           | unfaulted |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+
+	/*
+	 * Move ptr2 between ptr, ptr3, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  | unfaulted |
+	 * |-----------|-----------|-----------|
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_unfaulted_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away, and move ptr3 into position:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Fault in ptr2, ptr3:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           |  faulted  |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2[0] = 'x';
+	ptr3[0] = 'x';
+
+	/*
+	 * Move ptr2 between ptr, ptr3, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * | unfaulted |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2, *ptr3;
+
+	/*
+	 * Map three distinct areas:
+	 *
+	 * |-----------|  |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|  |-----------|
+	 *      ptr            ptr2           ptr3
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[7 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = mmap(&carveout[14 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Offset ptr2 further away, and move ptr3 into position:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * | unfaulted |           | unfaulted |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr2 + page_size * 1000);
+	ASSERT_NE(ptr2, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, ptr3 + page_size * 2000);
+	ASSERT_NE(ptr3, MAP_FAILED);
+	ptr3 = sys_mremap(ptr3, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED, &ptr[10 * page_size]);
+	ASSERT_NE(ptr3, MAP_FAILED);
+
+	/*
+	 * Fault in ptr, ptr2, ptr3:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                    ptr3       \      ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+	ptr3[0] = 'x';
+
+	/*
+	 * Move ptr2 between ptr, ptr3, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *
+	 * It should merge, but only the latter two VMAs:
+	 *
+	 * |-----------|-----------------------|
+	 * |  faulted  |        faulted        |
+	 * |-----------|-----------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr2));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr2);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr2 + 10 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_faulted_between_correctly_placed_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+	/*
+	 * Map one larger area:
+	 *
+	 * |-----------------------------------|
+	 * |            unfaulted              |
+	 * |-----------------------------------|
+	 */
+	ptr = mmap(&carveout[page_size], 15 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+
+	/*
+	 * Fault in ptr:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr[0] = 'x';
+
+	/*
+	 * Unmap middle:
+	 *
+	 * |-----------|           |-----------|
+	 * |  faulted  |           |  faulted  |
+	 * |-----------|           |-----------|
+	 *
+	 * Now the faulted areas are compatible with each other (anon_vma the
+	 * same, vma->vm_pgoff equal to virtual page offset).
+	 */
+	ASSERT_EQ(munmap(&ptr[5 * page_size], 5 * page_size), 0);
+
+	/*
+	 * Map a new area, ptr2:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  | unfaulted |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                               \       ptr2
+	 */
+	ptr2 = mmap(&carveout[20 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault it in:
+	 *                                        \
+	 * |-----------|           |-----------|  /  |-----------|
+	 * |  faulted  |           |  faulted  |  \  |  faulted  |
+	 * |-----------|           |-----------|  /  |-----------|
+	 *      ptr                               \       ptr2
+	 */
+	ptr2[0] = 'x';
+
+	/*
+	 * Finally, move ptr2 into place, using MREMAP_MUST_RELOCATE_ANON:
+	 *
+	 * |-----------|-----------|-----------|
+	 * |  faulted  |  faulted  |  faulted  |
+	 * |-----------|-----------|-----------|
+	 *      ptr        ptr2         ptr3
+	 *
+	 * It should merge:
+	 *
+	 * |-----------------------------------|
+	 * |              faulted              |
+	 * |-----------------------------------|
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 15 * page_size);
+}
+
+TEST_F(merge, mremap_relocate_anon_mprotect_faulted_faulted)
+{
+	unsigned int page_size = self->page_size;
+	char *carveout = self->carveout;
+	struct procmap_fd *procmap = &self->procmap;
+	char *ptr, *ptr2;
+
+
+	/*
+	 * Map two distinct areas:
+	 *
+	 * |-----------|  |-----------|
+	 * | unfaulted |  | unfaulted |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr = mmap(&carveout[page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr, MAP_FAILED);
+	ptr2 = mmap(&carveout[12 * page_size], 5 * page_size, PROT_READ | PROT_WRITE,
+		    MAP_ANON | MAP_PRIVATE | MAP_FIXED, -1, 0);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/*
+	 * Fault in ptr, ptr2, mprotect() ptr2 read-only:
+	 *
+	 *      RW              RO
+	 * |-----------|  |-----------|
+	 * |  faulted  |  |  faulted  |
+	 * |-----------|  |-----------|
+	 *      ptr            ptr2
+	 */
+	ptr[0] = 'x';
+	ptr2[0] = 'x';
+	ASSERT_EQ(mprotect(ptr2, 5 * page_size, PROT_READ), 0);
+
+	/*
+	 * Move ptr2 next to ptr:
+	 *
+	 *      RW          RO
+	 * |-----------|-----------|
+	 * |  faulted  |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr        ptr2
+	 */
+	ptr2 = sys_mremap(ptr2, 5 * page_size, 5 * page_size,
+			  MREMAP_MAYMOVE | MREMAP_FIXED | MREMAP_MUST_RELOCATE_ANON,
+			  &ptr[5 * page_size]);
+	ASSERT_NE(ptr2, MAP_FAILED);
+
+	/* No merge should happen. */
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 5 * page_size);
+
+	/*
+	 * Now mremap ptr2 RW:
+	 *
+	 *      RW          RW
+	 * |-----------|-----------|
+	 * |  faulted  |  faulted  |
+	 * |-----------|-----------|
+	 *      ptr        ptr2
+	 *
+	 * This should result in a merge:
+	 *
+	 *            RW
+	 * |-----------------------|
+	 * |        faulted        |
+	 * |-----------------------|
+	 *            ptr
+	 */
+	ASSERT_EQ(mprotect(ptr2, 5 * page_size, PROT_READ | PROT_WRITE), 0);
+
+	ASSERT_TRUE(find_vma_procmap(procmap, ptr));
+	ASSERT_EQ(procmap->query.vma_start, (unsigned long)ptr);
+	ASSERT_EQ(procmap->query.vma_end, (unsigned long)ptr + 10 * page_size);
+}
+
 TEST_HARNESS_MAIN
-- 
2.49.0

