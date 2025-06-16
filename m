Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B6F1C1F2F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051403; cv=fail; b=HHwenI8Q/YqTf6OsAMo4yEn82Gx+5TzGB6Wx3c79rspmhpaoyT59slDgZgAW0OqM+LvjyHcQXMr8UDw+F1man9tMNiuENw9u+Xi/aNLJO/keZ8fyBfQUqrZ6YsJS1wGPHpwTf42G5uvsW3cr8JjV4WH4lB/AE0uHhMC47K7XDKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051403; c=relaxed/simple;
	bh=NqqYGfMJMAYm9SnENqg6t2b3xunBMZ6Ys2pzTc5QHCk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pDzWrAA004fnRzZBRXlaOcCvQlLQxfCc6EIrs7Fdc3oiyKC8JvcuieIijglZuVvV1UOz8RfxieW5e6HPXCsxmLULtwmktyeIxwQ+r9g52aPMF9yNJuLs81rjYRVrNHZGBuwAiIYZjzLanzNsiXm8aOzwreY4sFPNSWKI9uzmjM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PbAGG67y; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TurtwCKH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PbAGG67y";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TurtwCKH"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNP2jk014888;
	Mon, 16 Jun 2025 05:22:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BLtj2DEAlnxGKa8Y6OktlMYpnu8htJq/wvAHLDvC6s0=; b=
	PbAGG67y/tzzoxTPvun8O/JDOyeshLih/kk4+u2GLM9gWtPpmNOEaxciw86+F2vf
	1CczR6awAmWAa9JWrTirMJLmAH04YwCTKwVLjvvZMtVs6AuEe5C/KlatDfbkQoAw
	YK5uUFUBDmOhgMK285lTjiX0Llyc19fL5v1/wm5zV0A64O4wMEWgRDfuxljrGnHI
	CgcTUukzr8mVKCR2a+6bvyPsUeK6EM3Ju+RZegZZg+3d1hR9/36dq+ZEsM5FV1LE
	r6ECHobIRX5x1ERXURRkzY+JUL2cHmlQmSG5G+DomVTe4/4H2xuUklP2Lg/xEkrU
	7THnJMfV+pNbTSbJnf4DIw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd1p5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G451Xc036267;
	Mon, 16 Jun 2025 05:22:34 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012023.outbound.protection.outlook.com [40.107.200.23])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhdxw9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RulXiNAgLWd4Q6Oqd/5zRZ/lzKdyX9rKXqDaKrxr+9unmvseZE8Xd9sq4j4Gzb+7wWxD8e47C6mTJ2Q/nTNXR05WXPHVyxLaC9JezpB9zz9QSkYO0M3kmyx8AqVTz/vgDPB/Vo90V5YJmEqZt30yYPnDH6nPHzW9gaEVqKS3hpGtC+5+K2JYyE2bWYrixyCghEnAz6yZxve2Vbf7AiPq2649LaqXWwB1CkTmAI5dQFKz6q/MYaloN46IftLKrtwPDolTwfMVfaCIhmWvwIVhEyCSzdYOE1FNHE/hs4kM9ov8FpTiGNHm+zqcakVtGfKyW8Y3FfVAYxeONvjh/IHcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLtj2DEAlnxGKa8Y6OktlMYpnu8htJq/wvAHLDvC6s0=;
 b=jmAIUDQfP90O4hyqk27Bq1M1tx7ZsJtrB4eOPWUCur32OG+exqiJjd4fyXV+sFeK1Ku23z3uCatkpdovF1Z53PB3wqdNuHuo0f4vrGgzuE5lvmEwrPn5NWyxPhnXYkAhz8uBuegwzW2Sn3kIQd5T1gTSHs86IMmnFI/3Ftu/1+Hyxr86eI50/qtrhBYHNYyB5cCyOJQMIxFjjJ7iSh5dB09G+9wg0MvaWyQP4YNxTvfgxGdAy98oh1yhAmz8IsrVRhb9vG3BS3DLlFaG1EVAp1oDAyHvRupp7F6H9eeX3ojTqPpDmA+aNEgdLscV97I7l/9oRPHcp0b9MeiioUVZnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLtj2DEAlnxGKa8Y6OktlMYpnu8htJq/wvAHLDvC6s0=;
 b=TurtwCKHptL8knZUqJ8a63QehPoP9miwCoSlXRjTnsKRU4rImfS4zNJCxKvi4p0stV4CdHJowaK/Qbo/FYWb32tZ8kA+knPyL2C8+PZsDL0l6/nwWeo/uHGQbbSmWbOFDR6itLjVcAExIC7QuNfSX0YjMxIzhX8oixTvXUQMK4g=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SA1PR10MB6389.namprd10.prod.outlook.com (2603:10b6:806:255::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:32 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:32 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 03/13] perf bench mem: Move mem op parameters into a structure
Date: Sun, 15 Jun 2025 22:22:13 -0700
Message-Id: <20250616052223.723982-4-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::28) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SA1PR10MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: cb407d0f-af5a-478e-1ab7-08ddac95cb88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZIfg65dZ+c8PoxgkD4YaKLN9FGGq71UL71QMHN9knbDdsJvRqyUc7bC7get5?=
 =?us-ascii?Q?gjVTYpeNRMmWVABjwjc8jRzrqtCJd/gZPE2XN9INeKI/+ThBAEygTSycAn/b?=
 =?us-ascii?Q?BoHpexhoh+REfQbmB47zY+4RGJM2s7BaJLpAcqSDqGnaoA9oGLlwQuhoGJFu?=
 =?us-ascii?Q?cyNz8QjSSyWE+QtKxeXstktgDvWCNSUXeriFtN8CCJjeA5+/mjJDTPQxs0q/?=
 =?us-ascii?Q?daciYZroh79ZzKRCKYWjlZx6g9OZgtYoqwdMpB41lR2CCunBM4kuxaWo0zZk?=
 =?us-ascii?Q?HtLkj3xqpjsB65+ricuYY+BPBkAs681E7xbA4getZL6YH+x4t+RIjtBbLEpe?=
 =?us-ascii?Q?AoVjUe+LSi0mrwHfk2eGgbQSq7DARAOarVHCFIrp6Cb8WRfxvrcJ8nn1z6nN?=
 =?us-ascii?Q?UdWbxfYxuTy2cmFke0k0oe9k0fJsU6MWnXAG0F3TTf+me6T06CZnWHXfQIxH?=
 =?us-ascii?Q?cPx41CXADkZMwNOV21RG+IOK4ScJEau3wNofG49gc1xU9RT7b6GO20ZFsb+Y?=
 =?us-ascii?Q?knuIq0zooWi/94WhcgEB/ZASpv6Y2+4R4Vl4JPUdwCoAG3dkl+tD3BIPSsuH?=
 =?us-ascii?Q?9sGyf0Zad2BoI0IVresAhHMh4vu4nRqMmQ0lij/nDkHExZ0sdZxT2BosdBzI?=
 =?us-ascii?Q?+8PFRqzP8ikK1E/kXgj4A40BohV1XtZjzXUfh6Uo+VHi+ZxPleUFQxcCtoci?=
 =?us-ascii?Q?jJU64PO+LKcfd1VndoJBu10xw9TKPYdd6b5iN0bt/6icafDewy0rJFo6B+Zd?=
 =?us-ascii?Q?UxaY5+mDEeHBoTKItlJgk+If2GX2ve4jodBSh/NaRuwpTKbBqKBRil6lUXmB?=
 =?us-ascii?Q?oBlpUCZHaFmt4Tn7KAEiVzfB6HyhvydF4oj8nKtoqxCp6pul5XexEOyVUaYB?=
 =?us-ascii?Q?18RjcwDbQUkepYSN2bZ0bhTa4L/+S13rgWhK/blv8U+erhpzdZqo1yXtk4Cn?=
 =?us-ascii?Q?0Aom4YAf8aZVsUO1TcuCZnDiFTwj0Pur67Z0ylpSVebm0argy4DbgLyB0n1d?=
 =?us-ascii?Q?m2Xn0dEDD/wIrjTJ7R30v6QpItcVOKWK2EZpXzg+5xm9n3jEWQl52C68b47W?=
 =?us-ascii?Q?EvwMhPBcsQug2m8XyFq7exXo1RnroeMs5Ir+vtnX9uASCFO0c0I59WA8qfac?=
 =?us-ascii?Q?G0pSoFihYXMaAetLG3zzyiZBE8QcG3W3iFejMov2a7AlJKF/lPKsGmckvTer?=
 =?us-ascii?Q?pT9erVTkjyPWoppICHWgSl+btQrmJ8a7wmBVAqH7ugfZS737WDoeaNYn92V1?=
 =?us-ascii?Q?b+qNeKQFf3S7iqliJsuT/ifdSauDXnaXhH6dXwfbi2NqZiLZLzFTu+Mrcm6V?=
 =?us-ascii?Q?IQm3LYTLrXUK0ODtFxVL3C0rEZbEgM2ughUg9nhpOlkOc+kyS1eo8ga202//?=
 =?us-ascii?Q?qYJTR9EWYnxGclDOLguRP+dAN2J3Tbdml+4SpDkVaDFlVf6+PQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M7QMvC6f0xd4jVT2usS37al14nU5pyXd+mQ7s5odCs3264meV7htHQmtVhhI?=
 =?us-ascii?Q?WHf/lM1AB4PNMOVQ8lZ3NlMniD8qzI7/IywDWEuJ5YLLxM+OwEP2SWbpq5o2?=
 =?us-ascii?Q?UPdwu1WW7SaKB3WHdqJ+SoX9bUM66deZEYGLAHbJo2UpfoYbXaG0C+nAJBv5?=
 =?us-ascii?Q?r8EYoMeMOzsScEZ+riLT8FdHjaNBZQ0TuudtLZsfiiU6PvcFJbkzbr4t7+6U?=
 =?us-ascii?Q?0M3XgGgx3XUNV8BoURWhYYfH3jpIZPc4OPZwKVZQB/Ug3zx1X+Bb1yitK0ZL?=
 =?us-ascii?Q?kQd2LAh91Ba54EvUAFS1rjVH6523tSLeeqkcgsZuMfzFGMkhI70ci+JX2wJi?=
 =?us-ascii?Q?j8/pNFxM446iDQuu9OaD5NIms2WI/GtYtlFW3n0iZQD8yYUBlIcijwUcO3CN?=
 =?us-ascii?Q?8EZc1YYHn0A34XehltJHWqDqO/xgkkgD0pdnsCwh9pxeTmJ+gVeLrGYAVW+9?=
 =?us-ascii?Q?jsL70iOWJWlaZqKX/nFwoAOZEcbVmNcwyOIYYqlfJ6Tg4lvxKVIPPExIz7qv?=
 =?us-ascii?Q?spj2kkcwTTuYucKchVKkewNSq2XxzrkW2rxXTD6o6ad3l6xZrPYQ0FAfRkuL?=
 =?us-ascii?Q?qBKML3R2HwUYXTBOzPig6ppN5vW4HZPkZAppU+Fm8XwF+Do6ZbYrBeaqJe1X?=
 =?us-ascii?Q?nhd1sZH5KiZoYQVrjOHAvGexcABqHl4WoDPLryK3p4H+qTznEbM6ixsHqsgL?=
 =?us-ascii?Q?PAbGvzGthDYslbb1Jf7mI0C201+J2tpUceol5PrIevWixGQU5XlQ+zn5BNNT?=
 =?us-ascii?Q?nCixGkaxyhyyrQtjDqvqTA16xacVLCL/hRe87JJHBC0UwaVnRQEsaJDBbtuQ?=
 =?us-ascii?Q?bHrQDMPWBPjeNMXH09R/Z4rsNesN9e0jw9LJMh+kHST0Tt1wUaOlRV5zRI8i?=
 =?us-ascii?Q?iKNmMv75LDhpjT048quLxPMFWgukj+6uLQ97RZx+rjtqB4gj0IXPKLmgU/t6?=
 =?us-ascii?Q?hnoirrQuibQDAXlEJN3WPQugNsw+9k2IjtAlxjM45WYrfiQOJRtzxOYx+YBe?=
 =?us-ascii?Q?isTak1xTqKabpG+1wwR2WDRmPYKMeZgZuYaTCjEuTKhUSpoQHjkzJmHhrvrZ?=
 =?us-ascii?Q?UIlxu/t9XETpzwFsW05e1pRU3YtzuC7YkzYMnidAELPbMGusalwuoXa52NUy?=
 =?us-ascii?Q?sj7srLm7Sm8hkGa1oIPMi2AFFZwUnwQ/Cot0sd3zUU+/0OZzVWr7nzMngLTL?=
 =?us-ascii?Q?Aw4gKoWHIGgY5MzS2+wRnq5ZFHqx7UCrQASMpIcRVxaodXH7BjoypJIj3B7E?=
 =?us-ascii?Q?WmXeREyL4/sh78aAgTTJfWXfXw0Q6QltbhutFCtFfmf5XTwiWVDYmawQ64hW?=
 =?us-ascii?Q?9ltYGlQmWTuC41SVmV/CEIOgt2djg//ybrXP4rE1vgcQy+aQoOMnDkPt6Ppx?=
 =?us-ascii?Q?N2I8gbrHfbIimP1HtpzmjmvHt7A85U7YalYMX/OdmsKF8OZevB3KeztoRlei?=
 =?us-ascii?Q?UaBfyxcvsBj+C6jk/FmnYbLKBdmeaysmTmQhZMmTFAHjXyT26tOJ0BsZ/okS?=
 =?us-ascii?Q?YIRfC+x4mPNgCeksxIkDWna/XPmU/n/27UR6v7HO9po3nWRNXorXieA96DVp?=
 =?us-ascii?Q?IZYFYdvs1uJ3h2FPM4V8Y24n6ANiG/dRlVO0ytD2V/Jh9HNaIOdi1nHlBMtC?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eq1oRmxRlUvFCZ4pB+7dVcAF2HbqjhUZOqUvB6BMuCIkQy6/qMRcX9bZw42LYqB3APbTXSB3ErXu1qgGtJW22S488s23jsPrL5O02pDOp8J6eFNX8VO0aP/wqknpDGaMDNnTacgU7K/rZDhHSG63HzYetyLE0NVPBwaeH3PQ1OzPH6xfkRjcZupzYPPEhCreSvpwysO2SZT+VV3fPYRGovnMqUy9EzjZKaDiHJAcLPJ2TnYcRsHmKgl2JJctZYp98w17aEFYm+wTAown9kHv1cBF4WpqlM88IezWqbUBF060T+gFf+2fvsOb+LSx2IkmG2TR7Tos4T01Q32GDtuaakJG8zO/ejt7Q0hcli2BM12EXEQ/U6c3RXDiFx1AzHTmn0JyG55L7bCmsxyI2dAn6fbTdDp0OvBjDUoJ4A1aqWSAuXGP/hDycBMzGH+FU6A2TUpR+rciouUrLWvS6Hj7zru+qxkuBd42ANm2hmy/QUVgC6NL5MCmD+2P+YJCOVfoQnpNrim7jJk1nzC1mqyPpbyld6p49RVEHnD7TCDZvYNNn7tCQYXOduc418DgmLp9xR/dKuvuUuHgzvqtIDCRmFmNajLqdySeNdN9BS4KsCY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb407d0f-af5a-478e-1ab7-08ddac95cb88
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:32.2478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tYwZTL37cEkWNC/1tyrEiOlnpXv6kUXLBGPnxMMLG9YV0DERkTYQUh2rb6YgWG9p0d+/2yH2klLlEBjBDH4juciF2MeGALkLGUKGUkZYi9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6389
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160033
X-Proofpoint-GUID: X4dbj25eNj_01FzTyNVb06tiArLG-ugI
X-Proofpoint-ORIG-GUID: X4dbj25eNj_01FzTyNVb06tiArLG-ugI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfX0Azg5dVS+miv I+kj80Grvr7xQlqdS10izIN3hgE/hF92yni+NvcnUc30oeDopdlHq7WwW8zjPVtzJ8h7mm1VbuH 3SzEweaUVBNz7sz8sZXNGUtyBRtgf1vmDM6CfyYpp2sf1w32UqMZr9G+K+Eprj9FpgSrYsH2JE1
 MphFGKWzVc2Vcrg6q22PLza5GxmDGR5kjNjigyVd7FawNeyhc4mKGYJQD6MP36kcN/Aec68BJlc rsTV/T+cBbve9/Mo5LCfG+Kl7yECcxIKwnpyPI5PIQ8e/D/1P8DcaLFg5aaQsUqVB0XW3OsjVoa fkPctzAFFMV9cFI3w/yFfGfP4BHhfkDu962UJSjnQR3Y0qY19XmuUBqFXeLqtopa5QsrCr0EQPB
 2nukHPtVfOrolaO76G6xxeoQ7thtbMyjF1yu1rx5k5ax1EekSg+kXfIc9k7zspJNoyKRE8ax
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=684faa1b b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=_WLpKjk4XQ775Vi3V00A:9 cc=ntf awl=host:14714

Move benchmark function parameters inside struct bench_params.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 tools/perf/bench/mem-functions.c | 63 +++++++++++++++++---------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/tools/perf/bench/mem-functions.c b/tools/perf/bench/mem-functions.c
index b8f020379197..fb17d36a6f6c 100644
--- a/tools/perf/bench/mem-functions.c
+++ b/tools/perf/bench/mem-functions.c
@@ -30,7 +30,7 @@
 
 static const char	*size_str	= "1MB";
 static const char	*function_str	= "all";
-static int		nr_loops	= 1;
+static unsigned int	nr_loops	= 1;
 static bool		use_cycles;
 static int		cycles_fd;
 
@@ -42,7 +42,7 @@ static const struct option options[] = {
 	OPT_STRING('f', "function", &function_str, "all",
 		    "Specify the function to run, \"all\" runs all available functions, \"help\" lists them"),
 
-	OPT_INTEGER('l', "nr_loops", &nr_loops,
+	OPT_UINTEGER('l', "nr_loops", &nr_loops,
 		    "Specify the number of loops to run. (default: 1)"),
 
 	OPT_BOOLEAN('c', "cycles", &use_cycles,
@@ -56,6 +56,12 @@ union bench_clock {
 	struct timeval	tv;
 };
 
+struct bench_params {
+	size_t		size;
+	size_t		size_total;
+	unsigned int	nr_loops;
+};
+
 typedef void *(*memcpy_t)(void *, const void *, size_t);
 typedef void *(*memset_t)(void *, int, size_t);
 
@@ -134,17 +140,19 @@ static double timeval2double(struct timeval *ts)
 
 struct bench_mem_info {
 	const struct function *functions;
-	union bench_clock (*do_op)(const struct function *r, size_t size, void *src, void *dst);
+	union bench_clock (*do_op)(const struct function *r, struct bench_params *p,
+				   void *src, void *dst);
 	const char *const *usage;
 	bool alloc_src;
 };
 
-static void __bench_mem_function(struct bench_mem_info *info, int r_idx, size_t size, size_t size_total)
+static void __bench_mem_function(struct bench_mem_info *info, struct bench_params *p,
+				 int r_idx)
 {
 	const struct function *r = &info->functions[r_idx];
 	double result_bps = 0.0;
 	union bench_clock rt = { 0 };
-	void *src = NULL, *dst = zalloc(size);
+	void *src = NULL, *dst = zalloc(p->size);
 
 	printf("# function '%s' (%s)\n", r->name, r->desc);
 
@@ -152,7 +160,7 @@ static void __bench_mem_function(struct bench_mem_info *info, int r_idx, size_t
 		goto out_alloc_failed;
 
 	if (info->alloc_src) {
-		src = zalloc(size);
+		src = zalloc(p->size);
 		if (src == NULL)
 			goto out_alloc_failed;
 	}
@@ -160,23 +168,23 @@ static void __bench_mem_function(struct bench_mem_info *info, int r_idx, size_t
 	if (bench_format == BENCH_FORMAT_DEFAULT)
 		printf("# Copying %s bytes ...\n\n", size_str);
 
-	rt = info->do_op(r, size, src, dst);
+	rt = info->do_op(r, p, src, dst);
 
 	switch (bench_format) {
 	case BENCH_FORMAT_DEFAULT:
 		if (use_cycles) {
-			printf(" %14lf cycles/byte\n", (double)rt.cycles/(double)size_total);
+			printf(" %14lf cycles/byte\n", (double)rt.cycles/(double)p->size_total);
 		} else {
-			result_bps = (double)size_total/timeval2double(&rt.tv);
+			result_bps = (double)p->size_total/timeval2double(&rt.tv);
 			print_bps(result_bps);
 		}
 		break;
 
 	case BENCH_FORMAT_SIMPLE:
 		if (use_cycles) {
-			printf("%lf\n", (double)rt.cycles/(double)size_total);
+			printf("%lf\n", (double)rt.cycles/(double)p->size_total);
 		} else {
-			result_bps = (double)size_total/timeval2double(&rt.tv);
+			result_bps = (double)p->size_total/timeval2double(&rt.tv);
 			printf("%lf\n", result_bps);
 		}
 		break;
@@ -198,8 +206,7 @@ static void __bench_mem_function(struct bench_mem_info *info, int r_idx, size_t
 static int bench_mem_common(int argc, const char **argv, struct bench_mem_info *info)
 {
 	int i;
-	size_t size;
-	size_t size_total;
+	struct bench_params p = { 0 };
 
 	argc = parse_options(argc, argv, options, info->usage, 0);
 
@@ -211,17 +218,17 @@ static int bench_mem_common(int argc, const char **argv, struct bench_mem_info *
 		}
 	}
 
-	size = (size_t)perf_atoll((char *)size_str);
-	size_total = (size_t)size * nr_loops;
-
-	if ((s64)size <= 0) {
+	p.nr_loops = nr_loops;
+	p.size = (size_t)perf_atoll((char *)size_str);
+	if ((s64)p.size <= 0) {
 		fprintf(stderr, "Invalid size:%s\n", size_str);
 		return 1;
 	}
+	p.size_total = (size_t)p.size * p.nr_loops;
 
 	if (!strncmp(function_str, "all", 3)) {
 		for (i = 0; info->functions[i].name; i++)
-			__bench_mem_function(info, i, size, size_total);
+			__bench_mem_function(info, &p, i);
 		return 0;
 	}
 
@@ -240,7 +247,7 @@ static int bench_mem_common(int argc, const char **argv, struct bench_mem_info *
 		return 1;
 	}
 
-	__bench_mem_function(info, i, size, size_total);
+	__bench_mem_function(info, &p, i);
 
 	return 0;
 }
@@ -257,18 +264,17 @@ static void memcpy_prefault(memcpy_t fn, size_t size, void *src, void *dst)
 	fn(dst, src, size);
 }
 
-static union bench_clock do_memcpy(const struct function *r, size_t size,
+static union bench_clock do_memcpy(const struct function *r, struct bench_params *p,
 				   void *src, void *dst)
 {
 	union bench_clock start, end;
 	memcpy_t fn = r->fn.memcpy;
-	int i;
 
-	memcpy_prefault(fn, size, src, dst);
+	memcpy_prefault(fn, p->size, src, dst);
 
 	clock_get(&start);
-	for (i = 0; i < nr_loops; ++i)
-		fn(dst, src, size);
+	for (unsigned int i = 0; i < p->nr_loops; ++i)
+		fn(dst, src, p->size);
 	clock_get(&end);
 
 	return clock_diff(&start, &end);
@@ -305,22 +311,21 @@ int bench_mem_memcpy(int argc, const char **argv)
 	return bench_mem_common(argc, argv, &info);
 }
 
-static union bench_clock do_memset(const struct function *r, size_t size,
+static union bench_clock do_memset(const struct function *r, struct bench_params *p,
 				   void *src __maybe_unused, void *dst)
 {
 	union bench_clock start, end;
 	memset_t fn = r->fn.memset;
-	int i;
 
 	/*
 	 * We prefault the freshly allocated memory range here,
 	 * to not measure page fault overhead:
 	 */
-	fn(dst, -1, size);
+	fn(dst, -1, p->size);
 
 	clock_get(&start);
-	for (i = 0; i < nr_loops; ++i)
-		fn(dst, i, size);
+	for (unsigned int i = 0; i < p->nr_loops; ++i)
+		fn(dst, i, p->size);
 	clock_get(&end);
 
 	return clock_diff(&start, &end);
-- 
2.31.1

