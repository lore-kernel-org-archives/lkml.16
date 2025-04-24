Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3046A1E22FC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745493431; cv=fail; b=Nq9GkQO2FVcjJB4XB91QT9q3CyZmm8ruMF0cH+kMfwEgYl1GuhxV7esiLtGG0ruoM3dqoJccRPz0gsC4XbMIcvJ58TQesbPDGtuJVM34Q0bODChSop0fIUSeFgCglHy2v49REmp4phVcidTar8Ttkt3WZx5HC9yGpqo4bsjVst4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745493431; c=relaxed/simple;
	bh=U1Y2rt4paEQNGOiUy83EEh0xaF2XwGryn7WmAmq3bc0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=T4/CTozZpHPNK7jm3ozYoFCAMHfB5AgxdGI60J7HWnR+N8DYHpkyRkQLTiILlZJl1XC100JLGIyQfAU0jYoHAQc3l0IG5sUeYBTQcLa8OwPRxzOjLTpnrc18SguPDWgMDvTb0gXu7Mx7XtYf90ijxhtDIacWdAsxBuYtMdqlYMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ef/H7s/h; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ncJfVIw6; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ef/H7s/h";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ncJfVIw6"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAwRKb006056;
	Thu, 24 Apr 2025 11:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=f9TqhlVux26tUTyp
	/v9utCK3flOOF4ut+5M6qTr8/pg=; b=Ef/H7s/h5D4Sh7ncJKYh+2H7C4DCHInC
	QIMBjDyibnurM7X0QG694QxzRd1YfgetDErY73mHSAn348H+hRkuZgaKJyvi+hRM
	/N/sOgYEsTMNpWTqbx02CQGj0AFX0MV449SmX0x3qG3O3jybmL4xFGLXqNXAVLCA
	LhlScT4FcqYChG8p18cZcEH6C0wY5S3rSW9LehiYvvb4RlrC7rDL4erdPKUl0srm
	w52DF3nkV8rfd+TMlYcQY4TQZWq0L2qlIwtpN9JgP3VAYP9LjHxLDUQaK4XGiBm0
	0hssfOxPrvM7DKahI5IuaummSsqsc7/GvKm1/a7Y26zHkupPr/w1bw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467m0b80xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 11:16:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53OB95Ts031677;
	Thu, 24 Apr 2025 11:16:51 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2049.outbound.protection.outlook.com [104.47.51.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 467gfr7nwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 11:16:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=naaBAovI/h9QLyVS65FqaSAhN1he5MELJC2BfNdjJTE+U+jNJzTg5PhGik7ZqzKcmWb+YnjTiM2XxOBroyWqFCLpHOiNf2RuhrizPW+wLoVYvZt1vKwgG+5hke3D3LaULgBgKn/WUKu8W+c+0pmu8jrJtEekQ868Dh/i9pjn0x4RN7bT88SYsiGE/5D6dy/z7rESDsk2RRwrE0dIKPBYPSH9hNO8TZZA5/6VH4H5yJNthQhReWegWIlOKt1eHxZPh9fhHR3yRL6smVucwebUQx/+WtXzXOI9QbGzXIbXuxDp+0Ue4t+5b8z9sL/vA7i6Bs5VjH1kyAlKaITKUphUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9TqhlVux26tUTyp/v9utCK3flOOF4ut+5M6qTr8/pg=;
 b=ZrrpXZ4Du3v5TiU2nKfWSkj3NJk/L6TLW3+TuygD+27121xRrH4p81GkpCpuEz5H4qSCafyZEdL55n7BAJD6kkB9Guer0erj24s417Ndu/FEGtQ5/imGh4p2DHun0esoZEB0+vNh4Q59JBMklxjLmkBepZBTxFdb9VbAYdEeyzqL4IUhkzZXwShmTV+yGr/SS5/qksUFgt4neqrNyKZ9aoIseg/+ibZhBZE7vX6y0z2dm8S0JWrnKLmxcWcGxNN4xm5tDSH1J3gbbb+PX0bJ35JM/fx3IBAJD5OOqaEjmofJ5gd0Bzyi1siDfeqQv1juFHrXOdfa82yP6PfJ34zTig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9TqhlVux26tUTyp/v9utCK3flOOF4ut+5M6qTr8/pg=;
 b=ncJfVIw66cqKiasQ0FIvrrNJ2cZV41vwrxTsT5qT/Lvs2wUGV4jMKp5tPZMd7dQRmopvBHFIdH2H2/FPrpl+HHvfj+leExT7KV/RebDLVUWrT7nWpdaEO7g3f9RRVreXxQxlEVMJcmrYn9PK5qAh88VjK+ODM3I/kJ3xCPQsyBc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPF88E71D08C.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.45; Thu, 24 Apr
 2025 11:16:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Thu, 24 Apr 2025
 11:16:44 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: add mm THP section
Date: Thu, 24 Apr 2025 12:16:32 +0100
Message-ID: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0625.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPF88E71D08C:EE_
X-MS-Office365-Filtering-Correlation-Id: eb67b22c-2185-4198-9be2-08dd83217e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BojcFFQGJEB434WOkLc0q9tpJCsNnR3bAnFcRYY68Z3v0eH0fWNbCi14I09k?=
 =?us-ascii?Q?mJlIWF1u+QJVhlVLDzKWQ20D7CO2v+9Af0/QpIDMgRwZaGpt50wPrDzLQA1u?=
 =?us-ascii?Q?fB3gYI8qvMp/kg5kiL8hqAKTYghz4Ow4yYdeoq5s+QUxRE0OqlGKRtA4bEq1?=
 =?us-ascii?Q?L7c2JWV+kMTqqThwAhxfSmLUQ2Apk6M2nPxhvyyI608D5AkZaieNAqFYruZ9?=
 =?us-ascii?Q?ix5+wOzqY2mxkymzaCxXb2H0muBOVmlbJVgYeWLfgtVEc+U9ql8gml5E2BHO?=
 =?us-ascii?Q?u2BAAcMgc86db294QoO7QzmUF/YdFjy+Wjmke2CZg23mk/UVeEypVw5PCES/?=
 =?us-ascii?Q?XEsGI6VeD/icQlXP3hqRpvWF/LM2Js1byJwumkKKep9CdkRFsb5pJQnuK2wa?=
 =?us-ascii?Q?+z0th/8winD0jU9YJ4CL8EZxDmnsK4T3q1fJBJXYoRCHh3F001VuRWOthDVD?=
 =?us-ascii?Q?XIWdpSNlY5DBy5pferQmwQQ3J2o86fv9K2kmlKQeqAhxAEeaTHrx0/LXWRvh?=
 =?us-ascii?Q?axsbiodkv1i0uQ8vQVxOxt9Cu8GBQuyXjs1Q6kMjib7E2mJjTjASZcybxW5y?=
 =?us-ascii?Q?lKPh0sZqe1fQKXkVhpPYHlwudWyGsNTBjoeuASDPXdW5XGPKXJxlWSOhBJpj?=
 =?us-ascii?Q?rOGLBvzlrnQmaG5CZCy3bKZRTW2PYxUlpc6c9UwB9dMQgQpYBEDCw3xfTRL1?=
 =?us-ascii?Q?JZ9MhxDF2xW5kNI8cHndr/mHqtYY8owMaZ5xejgt3WuhA+O6SKQtv0trnd33?=
 =?us-ascii?Q?51mC+wKA7EBXdVo4mOYLLEKp8F3FDHEF+6C3wDmKlK7mfs8+cD7rMNSqnYBY?=
 =?us-ascii?Q?iY7CURqgW1651xqqH/fAoywNe2R//oCmVmmsmPcf6aDaOjeh+slKzhGrIPM5?=
 =?us-ascii?Q?LazKVPHujj6LBw8ufYn4X2FgFjHu1GiyEkhWiuQ+XN2ki9Bf7gno4bvhzmn+?=
 =?us-ascii?Q?eWJiAIJ+oU/a3VpUTz/tzfZizMlxNgejgepnodKkVGkkBKzYmx7R2aL6XxP9?=
 =?us-ascii?Q?zmUOD5oH4VyUYqPCAdLUMyP6LIN1gJO9GXSsklSiu9XRFggseXrf2Niz6Zoi?=
 =?us-ascii?Q?Mx45/Rm7PXXnjJUEXkykXLLBCqfRYeK2gGn16qPGfCVcvbP6Ah3esKSjo6CW?=
 =?us-ascii?Q?E5zZYi+631UBOYi80BDisqrMRoIi2uBeuXbu3n68De5lKtazLQrSEsqRb+u1?=
 =?us-ascii?Q?zgoe+maVlPSbxppufYC5lrr3snkLE2ZpJBbG9fOisNnsMpgmjaT4N8OKyLGR?=
 =?us-ascii?Q?W/mkRw4oml6FoeJXQJQc37WYWUtD6lJZdPPcZd52w0anQBHCaVl29RF4j02C?=
 =?us-ascii?Q?hgivr8Vt0X0u6OOqCGcjiNqCDn5QRocvyOo9SbVdFeQ6nGxrO9ZWWXwIIZa9?=
 =?us-ascii?Q?SvoxnNA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qGGAPidnmV9SBfXQp7sTC8A5E/VwgH3wsalU8qykQZchkGbnRXLD36hoo4rL?=
 =?us-ascii?Q?ta77IRenW8B79W+t94jfwgVBH/UC0UTSesvUedZThXxWxFmnAlRYfxg+ppjp?=
 =?us-ascii?Q?ZGi1tq47pkpyrK8MBlaY8baO3vbAB+yRV2SWOR3jqxnS+s5YOrxzvPRwmAAe?=
 =?us-ascii?Q?ArfNsQs4i+5+ClxSw34Ak9iXbciettov35gK6X0x/TOnX1CDue14ObEl6v/I?=
 =?us-ascii?Q?Rs0fLxfkDTHG4Og5ojMBRr4zni9iXKy75uKtZzMFEc5a5Vo//waiCqpzyjmv?=
 =?us-ascii?Q?qZjBweOSGp+hoIk2xUEE40NRQkXLhF9h6f9qsaut0jLnJWs72Tv9o3g6UE/o?=
 =?us-ascii?Q?un30qk2oMF8f81V0fc3860I/MdkaazX8FDZP9PTpLdbHBcvGKE3Nuc3NYhYf?=
 =?us-ascii?Q?0xwqLG+giZn73sInX/rDP40gPZ+4mdjaROBBkZOjHuoERV2Sx85wYEydtc7d?=
 =?us-ascii?Q?3QSDSKO6vt0GF8nvUF6ixC7/S5zdkzoJy5pGiRV9RCpT94nJfAhg4xlO1mk6?=
 =?us-ascii?Q?XNePEi66P8EOPPCzRVsYrjj7JvmP4UZMzCoSTLXwbf7OKUkbzqQlKjg0qpf9?=
 =?us-ascii?Q?rRQdwkY+fhPGDx7xhG/z0cQvEC8lwGuEYTigoS1oqZuEM20n7bMXU2mH9jPo?=
 =?us-ascii?Q?s0R9L+2wZyB4zPLHmHgPbY9o3Td0dauHnnFpvaIRguv7bt8D++loCndNYNik?=
 =?us-ascii?Q?p5hIjXIS57Bm4JksyGfGgII+yxwTFPWK6wX2KD94ECUVIzLjr7WL8/WNE7Xh?=
 =?us-ascii?Q?khtImojrN4BA2OxI6q5D8W4Ju2BUixWTDqSvMEkE0FK5mIOuyz1iU5IwRlyU?=
 =?us-ascii?Q?iDl8OMhcezbCjif9rtaS6SClHSHeBsrVkYjW4dXWve1F8m6QFlOI15NGG9NL?=
 =?us-ascii?Q?tbwjjNq1FOGAX5YPFLguFEnjcFoESewygolBjJzvxJfyamYpA7p8V3vCMKlv?=
 =?us-ascii?Q?FqkeW0/3wPQ8tO5K3nxKF2OYVCnjEAO6JUIWezwSwZ6dmVhhEo5asEfcwI//?=
 =?us-ascii?Q?DLIpjVqtGP/Bw4e5Xja/CmeHmza/PCL9tfKkdqX4n9Y7tSCYOBMBQAwvElYm?=
 =?us-ascii?Q?hUTcnyz8S0JrniptaN/rbMgcMBSOkHpTiJKqReFDNqffNl8GcmupvFRULSQd?=
 =?us-ascii?Q?Nts6nnSRSSP6Pvzx+sm4pFCRVf9JB7ic3efZ8yIOT+/i/3XHhE8WkkSVyOVM?=
 =?us-ascii?Q?oXWM1q4pvGlWgaksKPUfCDr4pN+AJr3UjIsvrGww1fSI62/Z6w8L+M66bzWS?=
 =?us-ascii?Q?2yWGHplTiQ5UUzfJtcbLrliZwUx6gu9hgoVsZ+0qGYmzDsFMF8u56cyyzBwv?=
 =?us-ascii?Q?me/U6r5g1PY295WugiO4PR8l7w4aZBNhBO7Ta3uqLVUzT6PJk6VrekWwvbpj?=
 =?us-ascii?Q?2BHX4a2rlO/lE1LBpSAKOfbl9jTiTxXsjr/O02PxCiOjMmJMMkPMQTE3ZRie?=
 =?us-ascii?Q?Y2Czi7EB1HludyaU5YNw3aKZpX87YrShQLRd0GPU+AxslmvK8PKEjrYV6zjv?=
 =?us-ascii?Q?qTqi1xwaNjLFPcgMFEyOekPgEY41jZwsH0kpQ2XD0+I0FuYOt7vbQSDU8dqe?=
 =?us-ascii?Q?VgbRxeo+VWKu65PLRZS0Bwh0m431BarqhVvfDU9qB6NcPUK9VM5KVqsgKLh+?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3voDLULjPpEnlzf2xJ/3VWXm1L051rgDrvKztzogm5gtlYEuyHuJd92MqtzNOwApGzJ75SwurLByB91xLgfe10nTzPYIDtD6fZZb9FXRebEncxEf/RvBUIlEF7/++k13qG5T5V2avVk9GyyoE2m2RxCBJezfN2PL1X3wJA4d9I1ndAxyp7RZiLKZd+UHAMXQOLEN86DksWzbB5Kcir/7xmJyUKj2MSeLS8gPHCsP3Ss6Ao/KpWnMuAyNlkyBdF7FlnrvJZT2jIqRAoVWSvLKX4WTHYW9P4HMfkvE4etYwAbMrdcsBXq+SxCfaZTXAtYAE6D9/rlZ3T3iCzRLlrACazXloxFvUM4ugPOrQwD2Vhca2u1wTmT0CkJ8NwIlG5Myhz5EDkeennNHvDQISBS4SfEO6ZccQsE1XNAViVTqiICs2YkCny1466h5F7yn7Vj+oQBhtDqiiAKEGNhwSPURey4yr8ubzyb/241yJLX0Z2ME6lHgPeleHqZkL+WOrP0MTZ0cAf8fWwQacGiuWZpFzUvTyBgDCzB1+fTPxURwm1zf4Tqrmve3YEHGecc+c1woiqcOSMHFsKAvE6noMiq+98jDYLCR9dYgRNPJHjKwCLM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb67b22c-2185-4198-9be2-08dd83217e9e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 11:16:43.9159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgRCT7vHrxDCk+BFHXTUzNOJS23UMark5q5sDBjGZrZYyts+pNzGpcJ/UxuwmE6j5Bu0AZ35k/fLBB4tqR4aZNbhM2ljeg8N9WRn5n6P96g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF88E71D08C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504240075
X-Proofpoint-GUID: WhNYtAj0_3XYEJf53z8tDTb_1_OhrwbP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3NSBTYWx0ZWRfX0As6uPyY8mEo vfv9PJZAMXJXA1U8DTIQmeYeOePDIgOZrhP5ij0x2RZ9VXu3rCJDMFDkyokBsaeoKDtj6VTzuZB Sf+df5W9mSoYvIxGl3U0XJwKtJhLbmi3Llb4KyZUmIjTUH6+jUVYQXp40SgsO+ADz9lA9QRN7uO
 rmC3sIHVr6mb2XmQPsRp9viTMR5IA9HUIkL3t0b80eeA1k+OqMzmPvgMTGnS9azUhCbaPa71vfl YZNDpuHlS87FFF677tK0hzzbMy5pWhg66YkHhN3E/vvxvb4lNvszPqJVxnaMOIuXI1fcSq5V303 qE5wCcWNh8KxTnUhDjHSdurjvtxVQY4R4zdGl1aN4Hwgpy8Fc3KeRmftlFqfYFGDamMEn74gCm1 vkk3d8EC
X-Proofpoint-ORIG-GUID: WhNYtAj0_3XYEJf53z8tDTb_1_OhrwbP

As part of the ongoing efforts to sub-divide memory management
maintainership and reviewership, establish a section for Transparent Huge
Page support and add appropriate maintainers and reviewers.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 MAINTAINERS | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4015227645cc..85cd47a28a0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15563,6 +15563,29 @@ S:	Maintained
 F:	include/linux/secretmem.h
 F:	mm/secretmem.c
 
+MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	David Hildenbrand <david@redhat.com>
+R:	Zi Yan <ziy@nvidia.com>
+R:	Baolin Wang <baolin.wang@linux.alibaba.com>
+R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
+R:	Liam R. Howlett <Liam.Howlett@oracle.com>
+R:	Nico Pache <npache@redhat.com>
+R:	Ryan Roberts <ryan.roberts@arm.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+W:	http://www.linux-mm.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
+F:	Documentation/admin-guide/mm/transhuge.rst
+F:	include/linux/huge_mm.h
+F:	include/linux/khugepaged.h
+F:	include/trace/events/huge_memory.h
+F:	mm/huge_memory.c
+F:	mm/khugepaged.c
+F:	tools/testing/selftests/mm/khugepaged.c
+F:	tools/testing/selftests/mm/split_huge_page_test.c
+F:	tools/testing/selftests/mm/transhuge-stress.c
+
 MEMORY MANAGEMENT - USERFAULTFD
 M:	Andrew Morton <akpm@linux-foundation.org>
 R:	Peter Xu <peterx@redhat.com>
-- 
2.49.0

