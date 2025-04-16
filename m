Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3D23537A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744799955; cv=fail; b=rrgTpkNxRvoQCtfYkQ2bXM8VXL9oYGt8w/hpyidqpO75J95KCk7GdmjDiwPwtH2yFdPQNHazJ6gZjQcRBou2uavZw4YFNyzK2ajdl+L4XXcPk9DsbizyqRYvRoMY4KsBC77N6lg9zD0i/QuYiIAzFDMYhf5icX9uCN/WofFSt+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744799955; c=relaxed/simple;
	bh=hRT5QTq30KB9UIg82DDLlTTjyzLJ/GQLNEaUaDo2Vbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XUeMoMtapRrjXqxM1/4vMPuqmRIdgiQ73aa+Gkm/XM0PTcAs26O3HuIgR9cOsQljSt3aTL4b4VHokp3F4zE2VpWNIc/1KIabb1n5K+fHjEp++i9woICIP7Lm4YUvYyMgMa+A+mzT/oWK6EL1b/2McLOPnmYgf3ii28r+3rBC2gQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Js3IBAqx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TQc2OpcP; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Js3IBAqx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TQc2OpcP"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9N1QV016690;
	Wed, 16 Apr 2025 10:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=nhFsUZ/l4K5outNHYvPGoBQnM3PKaNYMXgf5kYSMCyQ=; b=
	Js3IBAqxnOxB/w5YIEeEkd7mXeQryt7C73tHqTBP1z4zSKzE6nVG/fHEPZBPBajq
	RlTOqM2QD/UOxxEupOelBpQb3zCXOqD0LsWYlBbFZu4FNMaJbfWKpb1Urb+IguU4
	0VwkQXF9QXk/iFBGjp7V3h+1EhTBNv/5dkVudzYhswKYwqXtlDsDXiyV2GUutDk8
	0AMGjqpeMtjO4PNiwJ6dIGwaGkRrznQHbegtifcQBfyO8qOzQ2RtuyIeay2/vPsW
	96QXPk5Y4xEClb+LoutFmPn3xjPnJ6m90tle3wLZ430P67O56jENiAoi3glkScjL
	HHFWyGwz7qH1Yu2XX1OrWg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46185muqgr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 10:38:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53G8g0Ni024673;
	Wed, 16 Apr 2025 10:38:58 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d51nre2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 10:38:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYQXAHjrYPRRZLaU2zUSg9NKOqhLgLkTd5kyZJCa15jvGgeyLukPnFCyqot3fgSXMJlP41NESCf4D1XX/4Ai3xYyogOGjjwWGMSeoDJgv7UY0G9wbcdMweOHLtdMceK+PcKaBAN8BJFvdPZKBB2YbwkMhsAakNu4K1pxiA/rqaEK733rmP9Xf/pazxleg1Kvz7TISpGZaxzdzW3U2wY8H3F7ah+QXd48LuC8g3bIpgvLpbLx/xPiPY5fWdiMHXlw+G8s4VONc0fC72IsJYrHtsJQSneBLtrXVR8HJ8TiZyq0CIea6eAchOR/tYTXPY/G51MXRc2VvfXa52NSxJVugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhFsUZ/l4K5outNHYvPGoBQnM3PKaNYMXgf5kYSMCyQ=;
 b=tzStjzMlWLWEy0NLR45X1addr2pvpBwy9pF5Xzh+cBPLPnskKBJeym7o07L/GXfu5uJ9vFjo5C1RBI1rajwz9nLRM8Zd9Q8zRl33L+u66zzkVPp8lQ4YyVdLb0UGMG+bhWZnyeUlEZFliLZZo+qKzguaM2PdOc+iUuVl4WSXAy/WmIugGN98US78o6onm2bY2HMAAIvc9W90DPTMWkhX/vCvH0Zt1tiZrXBrLljrawnm6PkTEw4I/nQGK3niApeYMYaDE2sMMyvyMtTivJQjPgovpMJbVBwyjwbBMqNwfu5JtVE3r1cnm5mZeoxIUwmr44yyAUGtBQTHu2j+Xo3lMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhFsUZ/l4K5outNHYvPGoBQnM3PKaNYMXgf5kYSMCyQ=;
 b=TQc2OpcPQ/oRzWkduMJ3gTuX9B9gMoL8X6iAChUDVe8V5n0wEsT070DfA6QUe+Q6Xh0RLR1u1ZjsO7QNaM0SW/l4lgEQAmlLZC9+lb0O5/JW8dRNhG2GyoS3oZJ3V8YsT1t3Yvx3cM8m1Pfw/ode0BEie9CpRxDpJ1dY8NMoTSc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY5PR10MB5916.namprd10.prod.outlook.com (2603:10b6:930:2c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 10:38:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 10:38:55 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
        David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH v2 2/2] MAINTAINERS: add section for locking of mm's and VMAs
Date: Wed, 16 Apr 2025 11:38:37 +0100
Message-ID: <e6ed679a184ca444b20dfa77af96913fd8b5efa0.1744799282.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744799282.git.lorenzo.stoakes@oracle.com>
References: <cover.1744799282.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0354.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY5PR10MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 7256aca4-70f4-4d30-8de1-08dd7cd2e32b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yvEPKUJS18qTayKiEpJXFhdgjXXoSBcwE7NDrkinDDk0keaGJLTEjTPFiYeJ?=
 =?us-ascii?Q?Ht46lqUMIxg+ahazpO/UG7Vf0jN2eSpc3VjIZiJquGU2WjEp40mUYUrrvOov?=
 =?us-ascii?Q?5RNid5Hfrvwe6AP/Ymq1j4EsWikcbNYiKV2VW1gQqvRe13Rr3vzaWRZm+I83?=
 =?us-ascii?Q?pF4B75wPGtdiMnkYq4YPS6s4Dvbyq3cWlknfvsd497Bbfg0rrEzusVgXAzFu?=
 =?us-ascii?Q?2tsQfE1iPamgJNIlD5e3DWHTif/bn1yDgoV632t8J3EW7laWY6YTaIl0+01I?=
 =?us-ascii?Q?+02iLlrHMrjV7bEYlr3GZa8QtEXM28wTMTCzMbfsKeITZ8OxTPEv5bMtIkSi?=
 =?us-ascii?Q?h5wGFQjUlQxzbKonpQLplrTdNK3/xU2ImjOzsrPnZfbbd6YglV+vIbkos7wN?=
 =?us-ascii?Q?/Adve8oERwqzaP0B6nptc+jDzhXYM/FQZvsDeJ7KrvBejm2tWTk1ZX/swhPv?=
 =?us-ascii?Q?UFH9KflblCbC0p0/01sDmhuudPFnpD5e0V498F2zyE/v4KslxXGXzkc1J6ZR?=
 =?us-ascii?Q?V8U6MkTefPz0JpnEyJCsiYwi77xzvOZLaSKEIIEUuzAG9fjGstZSlufWIn4W?=
 =?us-ascii?Q?wy4GXhPu+p/PWzpDrIM6ki0cksCDN/6wywZtynoCDc3d4akiROD7yGfLRk0J?=
 =?us-ascii?Q?M3qZ4+leFvfEwJSkeygnirsZPLKoGrW5LfpkvenqjChgzT6yKrRGRMsvbgNp?=
 =?us-ascii?Q?k/94TmIN/uY3S0XGXL8LZsILbY5jNqpG+pq7NgTg98kEmzHQ3uUPR6o3P9Tq?=
 =?us-ascii?Q?twRz6k+fmvEappvEnONMK3ThLD5kttgDUp5UvsCuiFPabv7rIV1TEbQtfkec?=
 =?us-ascii?Q?husp919XQS85ih9W7NQ62+ROD4HYujUhe/2ArC0lWs4vBXfj1tv30Vzzwetu?=
 =?us-ascii?Q?mB+f4gRk15RfkatoO2JMVNPjzdhtZk0G+x8jgkMJ2TykhocmL/vChnlz+Ikk?=
 =?us-ascii?Q?aP7h6mNaOnhxVGNLC4CTsaF/ZH/wA7sguj1LYHw/pVgPlOCwDiBI/QAtL1NP?=
 =?us-ascii?Q?XsGJVGKRJhNKFscTKftxkIGhxo4T35yoF5/i0ZIpM1Nu+PcR0mbC/U8foAZT?=
 =?us-ascii?Q?GRWKg1De825fcoNKQr1MlL/nZDCCumkpdlW5HKE7mSOJTX6Cch9U0HAhh4Gc?=
 =?us-ascii?Q?tkqEZ7/Yw6luLuuWuIcCuR8wKDBrLxursUt7a4dOLGe4nmNEYz7pFRCN/NK1?=
 =?us-ascii?Q?llv06SLyPMaRTnR7mjVofCMWIxFVHUczNqNZFtk0NUsVPoALbxZaLHi5WlAI?=
 =?us-ascii?Q?gCkOXPHzpnGrx3uLm7pTOwhQ91s3uWqBaoBka/tLre8O8tEL4has4FWYSEF2?=
 =?us-ascii?Q?SbOZKxdlFB+Sd2Q5WwipEXeWApIoubRpUmZ0uKaOb+TKPKVERVO2pIp1cLSb?=
 =?us-ascii?Q?Mu0k87o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iSnCncwBtcn2aDWP1ZFrtG+JVUhmeGu/LWNbCiEXAjgoGQvDYUubJiT+D26n?=
 =?us-ascii?Q?yAxeIntMLJKAw/352WxWwYIO4HAAfVxtNdzMbAjYmbfLjkllRIcSb9ClE/G2?=
 =?us-ascii?Q?knhULQ4FJf764l7t0zI9z6lJThBKj0EArzj1ld/AtD8v7EJy9yKQgZdhGXT9?=
 =?us-ascii?Q?/iZJGvQccDat0d9YpBGVQGLTOud2eTkcAShR6Qgh1BDK5d29eBWh2C1ssbg6?=
 =?us-ascii?Q?mzQcpUk1xuSjgmveq7GTo7fnNzQigb4x01BOAISFWjH9H/lNn4KhV+zF8zvT?=
 =?us-ascii?Q?QCPMvFI+k7mStvNUpWdIjY//LhA8umYpdqL2Mt0LEDcr8mE+f5IGnTb6oynA?=
 =?us-ascii?Q?SNBC+y6afz5gNyomqbeaVyLMpaR1qh8nsrH8Uz2l5poxjFVKyzHexplGJ9UC?=
 =?us-ascii?Q?Twk+NkwGVLOTp3sn/PHDopbtDNn6MbeZwSWR8JjOJUdP5/f65QYdZBxNLGmW?=
 =?us-ascii?Q?HFLWJNokiw0yYvere7WedauEy8i3ZdoXoXvPO1Zu5M+OvV97mEKPhg4hs1Qc?=
 =?us-ascii?Q?zZnon0MrdvKTXOhhAO+1vyH727NZRBw5yGAx+H+7zV2E956TNDZ6lBU2iCb7?=
 =?us-ascii?Q?kbEpp6Ce/FM0Ge95dnKU4/sPosGlOu+qqL9JZGWUjXMNoHfYznlX5WukEDrQ?=
 =?us-ascii?Q?d/C5hZ3UBPyFHw9vY37YeNM+WMxDL9uW9lGVJlxVeD/zjPEyA2phvw7gN4FW?=
 =?us-ascii?Q?pandW5ysElOhMfWVcPeghrRRjwY+QiEjcmnEdu6Rmc+RBeZZcUPO7UFHuJtw?=
 =?us-ascii?Q?szHp7oXM3CeiWzEmzeJ4CnY0Hp81IGyAFQBmd1lAiZ1soeGsRQL7AKQ/8FJ/?=
 =?us-ascii?Q?xFyszNpWBx/SRxOlABI9UOR67oPRnyLfkHiCm5Y5OwLlud0aN+zoFiNiY0Ay?=
 =?us-ascii?Q?4V8MfB6VD0mF0lYNjGQ8+z3c8lzWxD9d95GFGJD72VheVHUjC4Y7hpbE5WTl?=
 =?us-ascii?Q?YAGCj9BkseEE3N7YLR7fJpYyAkBaxCisyyyLIHDa+4YAbtIRevJU5w6oTphc?=
 =?us-ascii?Q?Z+8Lc441V9s4i5+R+u3uYrTw8r76ZzEJB694+PhgLxQmf2YDY6egEEdC322N?=
 =?us-ascii?Q?Jw+asZkAWzTgnVSR6inzlryPWu9pOWpVddTVz8ht6mH7ATr5q8qqf4IRnuIF?=
 =?us-ascii?Q?H9Sp1QcW8kxGDSn30slGzCDdn9CuIsCeQBuCiwU6x1M1EtGA6+vmsd8tBTIR?=
 =?us-ascii?Q?D2ABTzCdglycT+eSBVoZlTB/rgF8JqfRECTI6ef3AVOqnrxzMDKUSo+tO9jw?=
 =?us-ascii?Q?qt8BKBgyx9Bb1psHfYQgB5h6A/VlBeJwKobJC4UIqIl3BToQuJ1ZrRBUAZQa?=
 =?us-ascii?Q?KrSJPQhSlFMByJF0J9fywPt0Sp7WH/gT1ke2FFBfLRHxMi8EtG6zgMX8Dozf?=
 =?us-ascii?Q?KeWWE8tJus9b/K/gfiwPuCXapiq3anD/H7y0N2ddQfdmhUFoM77XADGENVMC?=
 =?us-ascii?Q?CeaAGjYLlMWEzUUE+rKxUcXJgAmTXIiWW0svjCGAxC4FdtUExa9JrppDU0F6?=
 =?us-ascii?Q?DWfzMHmsnUqx0DP2FGNHKHbYJFBPmpt9wt2v7s6g3Csi3AMvvU/zgh1kgelk?=
 =?us-ascii?Q?iR5adZit+pujKZ05FKgW/dIMXcOglPrqFzmrHNrzhiKWbAeZ7dPTq2rumASy?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6PJJJpwembcCmXCI3wtzo3w8rXir23Wnf1wUBojiYnCBCPC7jMnGPUiSfM5MyWPJFRKMSCkciYw+zv8I/hh8nCBv3pnBt9zlb/32QEyW2T8FLOHLvguvQVbCRuumdl729RUFy8QYLRpaUlwNQ1j2UGwiAvSGzHeswKQfstj6O2bISbNQsPZ3oX1+HOC3yP+uFyDTmwcSLZhmpeMHJANel15vfM02Jx2P/34LrVx3rXGWhVPK7XV4n3DGVFSVr04Jd8c9oLD6NElXheatCTsvOhYjbleCmMlNwGxq5NX1Qs+t25FSgJBTV4NWE2JBtDM66T+mc4bUSxHJNOyxo7Ayp+atwNiq3OXSjMCVsG5u2g+2fBKYrTpgtZGXV4rQUDegyylgr6v99lK219E9yw8xq9FAxa7tKMmMycT2mO8ocdp3xsysQsJatcoKubW4S6BzgGI5kbbUePOcA53tXH3FJ/1ZwnILrgPtDOUU4QEfcPavutrIdW4V23fLfnrBRo9qYmAVkXEYaEOvgcvQCOZ9RibWr+SGjv8RXHcmTv33paSAtDYxnyUfRngd3qdLMdoU37KVWarbg3lCUjVYKO135FJBmyEueU84Kqbu9Q2b+24=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7256aca4-70f4-4d30-8de1-08dd7cd2e32b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 10:38:55.3559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r+Ysudv/Cw/qg4oUhZA4umw0Uyf2sfUbeUblkRiQkuu8rIqaz3D6eYRsUjD6ORo0zLChkEtSWStMOmbjQIjt9ny3x30v5WyxeXTVLrZw/2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5916
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504160087
X-Proofpoint-ORIG-GUID: rFVY46f3Ab8GRZztBqcrk_1L5gtrKX8z
X-Proofpoint-GUID: rFVY46f3Ab8GRZztBqcrk_1L5gtrKX8z

We place this under memory mapping as related to memory mapping
abstractions in the form of mm_struct and vm_area_struct (VMA). Now we have
separated out mmap/vma locking logic into the mmap_lock.c and mmap_lock.h
files, so this should encapsulate the majority of the mm locking logic in
the kernel.

Suren is best placed to maintain this logic as the core architect of VMA
locking as a whole.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
Acked-by: David Hildenbrand <david@redhat.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d834514a047..03bbc41138c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15595,6 +15595,22 @@ F:	mm/vma_internal.h
 F:	tools/testing/selftests/mm/merge.c
 F:	tools/testing/vma/
 
+MEMORY MAPPING - LOCKING
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	Suren Baghdasaryan <surenb@google.com>
+M:	Liam R. Howlett <Liam.Howlett@oracle.com>
+M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
+R:	Vlastimil Babka <vbabka@suse.cz>
+R:	Shakeel Butt <shakeel.butt@linux.dev>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	Documentation/mm/process_addrs.rst
+F:	include/linux/mmap_lock.h
+F:	include/trace/events/mmap_lock.h
+F:	mm/mmap_lock.c
+
 MEMORY MAPPING - MADVISE (MEMORY ADVICE)
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Liam R. Howlett <Liam.Howlett@oracle.com>
-- 
2.49.0

