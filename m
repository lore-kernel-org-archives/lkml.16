Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D0623C8BE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780335; cv=fail; b=M6zVYvEJTX/5GTtvhfYyehU1n6jZbTLZxBbZBpHMjxmh2LgDvF2ZomzhBFQr3C9q/3NhbAU5OGuVRIC7zVVj8HAolA3u4lSTMSvVq1d0gND/KexbLi+0ixxaROHxEkfTSF9v3dvEaXoioIB9K0IL/KVmQ9ApunjCJrKG7kX6n+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780335; c=relaxed/simple;
	bh=Q4JS9tZtYvTzwwkYL5YHkwabgJLz5K+kAbnlxp1+9Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BB30VY9a5HWx3IcKiiuMeKS5f+QNZ8mFSsLKBw2q7NFxzAFK6FBXM9Dp9ow8vy2tEfQ24g6LCAFnY6ql1wjsi4bP48EOZVnvZSWqqt5x0aSo+E6soNddn2wEfbLjfogTs8sF7ZvYooOpmLIlQXf3OJmj2UEdR0mM5Uvpo6LlGiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aKGU5NIg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RXjClwBV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aKGU5NIg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RXjClwBV"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5498M8Da005480;
	Fri, 9 May 2025 08:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=8u/Z64f24sjVmTCLMd
	bg0AUOmY1Qm26eejSjR5whmNw=; b=aKGU5NIgSUaLBx9IxBfTFBCcCVu4RTSPpA
	B98n5NNojh7vg2cnh+fn6lGMUp+yG+0zZ+3kZDHicQa0eN6uzfJeoQNB40+09l/I
	SKp+mBDJZsL55ANMz+avgBABLLIwE+U3qHAt3rC1v25HhcKcjW2dQ/wCSOfIjaDM
	e2DDt6Z+TN0jFITmt/dhYtkIK50BVbc9inJdPxuctgDCKBlx2poty8+/sWoQ0XS9
	RaM9T9/inMAZCaozkHdvObNAW1gdvcwUPFTodVfs2NZoOwex79W5GyBOB6C9HY+X
	hiDGwMxIsxAwGhPSRQFScuuI2y1ippZW3xllhLBkoEfJTfAVL/AQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46he4qg25k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 May 2025 08:44:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5497UQZ9024464;
	Fri, 9 May 2025 08:44:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kjyusn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 09 May 2025 08:44:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWC2/FGdCzQ6vVIXlzCW9g2W7f3q12SR+MbTgnxy2LuUPIPy77MuetIZL3BvM6IXcySwI4FpUWZcNMPvCcM2LayyykgAOy/oD+K0lTMDwUOBQxsgQp5VuT7L4VBjfKmPMbcUyZmQL41xNnQ2sfi2UhojaBqj5PN5F0c0fm40uBXPuNLFQ602FQoevk7dUyS7gT7eZmQ2tnqnlZi7lUwwcQLUk3w8bV68tnSRyKVd0ppdHDK64Z+Jp/Oa2qfpqKZcm8h2Zt1NbnP7IEJfyVrO9M1TrGSe49Wi6Z7A30MkKGkKO4HSxidE3YW6hRlo8F3RJZ6SsCX2/8RuprMkRBJrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8u/Z64f24sjVmTCLMdbg0AUOmY1Qm26eejSjR5whmNw=;
 b=T9lxAv3Bq09VgrzDDvSLFrg1UmO0Dr1ICJXr95pqtAGhF1omCXL2ps1lRXkmWtWYOzrAO2xaxTemcCDxIj+meAftszPnlTugvFezZJmYm4Iqx7Q4R8F+oO6LX4pgk44ROsmWrDhSQXHTYu1bmPy3gOfYCBz5toV0Ac/VtN5pGUOkzmqZDIBXha1RUQv+I2/tplrKLROSAbFh3caHb3XNaVmtyf60ZATbnUbx1/dUFHaFhGr2s7a6Sx5tTX9JQkfQtDMjIYLX07M5OyeLcMIyO8ydCXviOgqdaUWUgZuDo8Lfx+qpGXxYkxSngDfjksmvyvx78xHLQjB78qq+UF80VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8u/Z64f24sjVmTCLMdbg0AUOmY1Qm26eejSjR5whmNw=;
 b=RXjClwBVOyKIBdutZDaafHlS8UbDqlCwkeU+opNd3U8SLmLDnr5DsRLld4X4dK95KhBdpWrl1P/btHgA5euG5EYgY8gNMGnQ5YF/TS57sPVOLHsKPgipQYxOOasItq83BAMHxJh8vA56mgmp7kJbJHa72EXH3X6j0ONsgb6fbHE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BL3PR10MB6091.namprd10.prod.outlook.com (2603:10b6:208:3b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 08:44:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Fri, 9 May 2025
 08:44:39 +0000
Date: Fri, 9 May 2025 09:44:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com,
        ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v2 0/2] Optimize mremap() for large folios
Message-ID: <89f33688-00dc-4073-90f4-657b6527cec4@lucifer.local>
References: <20250507060256.78278-1-dev.jain@arm.com>
 <3fe90c96-da4d-4240-bd58-0bed5fe7cf5f@lucifer.local>
 <e258ac09-2338-49cd-a9d7-8e3be8045d8a@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e258ac09-2338-49cd-a9d7-8e3be8045d8a@arm.com>
X-ClientProxiedBy: LO4P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::12) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BL3PR10MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b162572-08e7-43d2-f0da-08dd8ed5bc0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P/4iOmM99q/Ae8X+dlDYBAcRLOxmUBKOf+pR3iXl/2sUwsI/KQzmJ1sMnghv?=
 =?us-ascii?Q?OKTe1b2YKTWO676UEt6nl6KQh9+LfYGn0f/9HbVturFjkUGjHGJXL+SheJpN?=
 =?us-ascii?Q?RI5SBWEv0SEcq4aDFdFrAemg1j7TSK4tMgX8Zhah28ofW0vvMK/Liie3OWFu?=
 =?us-ascii?Q?eCP5SV/2b4M9P4rBjRpsnltDTZKfaiehSeH9I7l8P6KhyOvTGmN5mRGW8aUH?=
 =?us-ascii?Q?akFOwnR0nc7fl0M9/xkD1MhGkwaBVphCR01+V0NFunMEEOcRBB9lbgqaGX3J?=
 =?us-ascii?Q?ddmMPvRo6UmXnLYn5RhqByAZ0LtLXn/6WCM4x3gCZYS6rgnbDzdkUdnvOHI+?=
 =?us-ascii?Q?5G8I3K2Nqf7qRqPF3qF0gACoZZccW2bPqiaykAdDx0fGK3o0TbXTLmYxqIro?=
 =?us-ascii?Q?aloTBOU3ozOzzPPLzXZz2RCS20OCClH7unMGTJf5pnAEeya5/se2sbLWMhJN?=
 =?us-ascii?Q?CfLZEoGHZO8nSXxghwd/bcl9bAv++cmXjJsKXCbjhO9JD6df+q0s4JkROEYQ?=
 =?us-ascii?Q?phS9pkaBmHHQLbT9sBPJb31DfcvwDydTVmFgqapOqd3MOLzO6E2CX7xOXTi0?=
 =?us-ascii?Q?Q+3o7UVfSoyMFiX4NClk3Ed3InEMKLLPi0yINJeKCTOF8C36y/K6wymah4rt?=
 =?us-ascii?Q?vMga0J6o9NkQNlMFB2gCwiOu/bKcqIQxcXBKlqXDUNC2iN5+NcoIX0w9q7xp?=
 =?us-ascii?Q?WzMWBr64OCZCvp0fgt6jh2s4D7/wc7wadmyR4e0Cefqor3SVr1jZhTCXLDIl?=
 =?us-ascii?Q?PuN7as1wteNJqgwTj8MVvkz8+iSroSoPSBIWgydC51odVaOEfw4sW1W0xhSE?=
 =?us-ascii?Q?mWehkncYJZLCNgxZmt3dkmotKCs9+tPhdCNsf+jN0hUlgL7XoqW4R7dAQE8F?=
 =?us-ascii?Q?gPAXKSCkwbtv9LZPP2Q0iP527xyUrzGu0tKOTn9tUmGt67mISEC9Gv8Rchja?=
 =?us-ascii?Q?DPAZ+wLNgDDKuzyBFcD9A+6q9ul2h+E8q00qjiKHhH9O9A/YgirMXKZxQCYP?=
 =?us-ascii?Q?YkrYJxbTDJZJ2ltzdAHSIEIIHdJgem10SACVly9MFxq8UPP3oWZqt/sPUM1F?=
 =?us-ascii?Q?rmbAXXmG+u5VsEXOdB4i552S/kZAbzSKUqF0ylDz1iYXjQo8Nr+ecympIMSt?=
 =?us-ascii?Q?SgIX08rw5SCbuAuFaZ0RdZbE0L6mBYyBHuuPEEWV52Gb4Q5a1CjXMrMztkHQ?=
 =?us-ascii?Q?9fttRDSKifSe8Txl+xI5ZdREhqdZVWqaCm5KV+a6OA/7bnyjyDUCxLRKHv4d?=
 =?us-ascii?Q?Ibn3aggVOvYtLGCpkmCUxhtXU3U7M9jOtTx9HsKM994pOuFut0ZiGM14MI3V?=
 =?us-ascii?Q?xlHbE5DeJ5Mflh9ASjZ4zjoWUryT+x2w+B9ae9xf7y4Z9ybrGGjB1jOuXJI0?=
 =?us-ascii?Q?fv1jMCr8hJ5lEi9iJAqvYBrmUjmSE3jq6NYwmV+LYBCSp4MciiFdAGo3C+q4?=
 =?us-ascii?Q?FHPVxTij4RA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tsoy0GlsL7Ku7jl4jX5puL5SWMOmsOXPldBuJg5VxcBqglmvPi/cvCTJruNp?=
 =?us-ascii?Q?UFemQzHCqZHqKFVXGecJqPgycoxbZyGSGhF+wB4GvRsbIW486mZcIuRbxnmP?=
 =?us-ascii?Q?01aajEPMgpE/qugaJVkIA6YXZjJjrzsx0wJu0YU7/dUUl/S6t2B14w+Jgv2i?=
 =?us-ascii?Q?oZ1qHVWbG7m4gXvxpaPxHxcBRlii3H5n6DSbx/31wQM5yk6gN4p/Q3GJUTFi?=
 =?us-ascii?Q?s/M806FE42gmgf4bYDnNuB7kJgB562ufeeYzA/IfkmJzU47J//3QtYAm3uA6?=
 =?us-ascii?Q?h9qXsGgCkgRZWBMpTZNqDR9vVzanFfIwVJgBRvWWk7y8E5LoTxmy8R/Ff6y3?=
 =?us-ascii?Q?tjPtQ2G/YFRwx0qTiYIJbSTYGEkP0gaRMHgVUZCdLhJQim1/ERkFt8bYCGJR?=
 =?us-ascii?Q?FUda6TrE8YPDgpJov1GAGBmZ2DuzB/ey36mg0BIcwAyt0/6WYijf2+kDkk+Z?=
 =?us-ascii?Q?ugYV/aHFi/oG+hzcxwcsbiy3x/cM6gKkblGm9tqNAaFjiImfKK2Y2olnZM6b?=
 =?us-ascii?Q?5WBPf4Olp5oSpTe4o6t565N/Ba7wd9FDAPjvZcc+QwGntG0qHRD8KEqAS4Nu?=
 =?us-ascii?Q?oSWwl9xddAFVXAh4s983ySoDHSFSA+V1nQQ8hPHTWGe+lFaKzscBAWNw1J0N?=
 =?us-ascii?Q?ttQ/O101I3bxqP1Z5gJ8tum3R1cH9cbcwctoukHd33MUlii8N2UTgrBM4EMl?=
 =?us-ascii?Q?L8ls5SoxkHl0vB/KkWamvP7fGeM9RpBi5cu5f6W8W/9mQ2COLhsN0hV3Csic?=
 =?us-ascii?Q?sH4UCYgWtZWRFH343FZ7G/X8R2OHrd8AvEkk+JfAY4ldJ6rzBbxFutyoWnJ8?=
 =?us-ascii?Q?wCvO6fRBD/J6NL8aP2z8mj2E1B1+6PYOthppsK8ePgZkHM6MKZwoTRjJAmoD?=
 =?us-ascii?Q?iEYPHSPkj+9wuChVBeO52oH1EfZk6Cq6mpuTo6kuNMn0cMS8Uklh0AYGyV8z?=
 =?us-ascii?Q?hMtjfiGDDcDLTB8RBbS3uKVWMrIXvDoxLIRJfK/JSBxlshWAVIrxLJUFWGUX?=
 =?us-ascii?Q?W9IXvVTazqRDpc4TGuwoaQLJemFFGqgsKm0z8SdqCA1jmUv0f8FHFWHKT+Eb?=
 =?us-ascii?Q?AySmqiJ8Jl8A5F9ClKaM5SNSUXA4iHRKGtBaO54v4ZZoCny+s3Wx5h+U2Nc+?=
 =?us-ascii?Q?udFmcNpo+srkGDSgemgFqkQqhHDVYWycUXv+0tay0fxLJyOd4/zn9XB9uKz0?=
 =?us-ascii?Q?9KJAsRQCoHroLIqCBvNCjCkYpzBP1LkGWmrJuByEQiOPcKEXoOVaZh1dzg9l?=
 =?us-ascii?Q?1lgXwCDoQWEijkiTF03iHuiQ7ZtdYwk3cJ+bRC5AL5Gthyf6y2N8PVqKNWtk?=
 =?us-ascii?Q?EFpzMz8Ky2Q/x120PXV//X7qDiMcQuugYHa0A70ND6dcGECzqmPgJ9OvbKAr?=
 =?us-ascii?Q?1TJO71QbUZpRsgZT/s0u04m7Y5q3xzziNKrYHNEVu9ABNmQjoH3XwN8GNE+J?=
 =?us-ascii?Q?mgRCkEhh3wn2lEn4LK4ZmywZrjcPFA5RZU9lKs/yk8JK3fEhNnxxSdU16D7I?=
 =?us-ascii?Q?06gxsGac7F4CckbztGSXjq2NQ8MWiCZkYO9fL4DFqctxayPf4BWAx54J3qVr?=
 =?us-ascii?Q?pruwmL9AwF+WFEJWzqCtLzlgOXnUYD/kPvC0CcD+87sBa6dExTmQlxMwNAkA?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nION6oIRXIIywi1hAf0H167bIlNqHIBoOlkfjqPlY8i4t+BZ2+Y7QKQ5RJlVNrY/kiRPefozjZMtMdoHEkmeUwryMIUImlpWQjGfPwMeyUzfTZTJqhfcw4KXY4faGubpYhwmjVrp9dfLb7p9n1TTrpTEfZ37GlZBnSO4aEIaLB2aRhvDLM+KtX4fh/FUTl8UGiM1OXgV9MDvGueHsEs59tX378ZOVZR+tRtnBXyyp5Lew+7qqhEqQcl0oWvGS2/36TsnYd+81EYdu1puKqZhyw4UdekSN8wD9G0jT2Eo2yqCz5+5R8ryRT7qPUnYA1pC3keTxIBo9JbQTIaOIrnzdfL9eOzXBeXysqw7sv+ffluwnhhY0A7wKlFQAUr3E+MPpq04GgT4re+orqgqVuym5ERuEpb/6zBRKVyexCYJR5mszqtOi+ywStVdLJZYnBU5wwklTAsMq66e6YlYvGJEiPrYtovKoNw/ePUF9RgvXVamYtXjnlitQrSDIEIly1fC4rzFlJhUs8NVdtCjNsRp+YReTvQENKRIB93w8fZ9jqy/LdLRqdP9MjZB/dL8X4LEdh6EpFMuaHD4vrvpj+7AeqAMHQmymZKM/tquxYHTEao=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b162572-08e7-43d2-f0da-08dd8ed5bc0a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 08:44:39.1480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D6MB3pdCDncTZNHlilHqXtxSXaeMokF9hyQcETNnkXwir77tc82oX8y5hlpN2FQA6HDNBA7rFxTwWAVs7KAAiINxF1cca7LuxIuZMhJJVtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6091
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505090084
X-Proofpoint-GUID: v2fduJ7LfnE4-9khSsgKq5E8U0Ym-_oj
X-Authority-Analysis: v=2.4 cv=FbM3xI+6 c=1 sm=1 tr=0 ts=681dc07a b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=iKiCR8IWUQVVF8YnhkwA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13185
X-Proofpoint-ORIG-GUID: v2fduJ7LfnE4-9khSsgKq5E8U0Ym-_oj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4NCBTYWx0ZWRfXwSq1R+xhP04S A1KrDWwZGxA9KohCLInraxbkbF6ZMVpRp6rHuL6ufLRgr0T/VLKLDA+yeZ6zBq+w0S0hfdq99QU lf26Q+EVL/BEtpBWX2IH9mpsgFjimM6WgaF+4wCzW4LuXRgRz5EqgU+xRqiDDdbmmSFluPzNQXA
 CxWqRKRe/CCmF85y2+Nh7COmNFY+JLoPTupcM4GDdeIW8JUrke7jb+rs1QR2PabTqO5DYwawAtC peVNeX9LJLJdFSqBOp/hglLaOmiqxSu3ApsZyBWxOdRvi/Uw8FsQ0R938Ljnd5Qa8iq/a3IbyaE MM/VmBpeqNIgSNsBbsVxQfLeAhXC8LBxs6HfN1mBqQw30lVYAt3fspJDYMZUUwVwsb/E+eyBkba
 +On6v40tmC1nEHcUBUA0ZJh+ceP76BKaqnPL42dqzXodjlRUHc7b/WvWOzg+LwBJGSU364vY

On Fri, May 09, 2025 at 10:57:05AM +0530, Dev Jain wrote:
>
>
> On 09/05/25 12:05 am, Lorenzo Stoakes wrote:
> > Dev - a general comment here - but let's slow things down a little please
> > :)
> >
> > The mprotect() version of this is still outstanding fixes and likely will
> > need quite a bit of checking before we can ensure it's stabilised.
> >
> > And now we have this mremap() series as well which also has had quite a few
> > quite significant issues that have needed addressing.
> >
> > So can we try to focus on one at a time, and really try to nail down the
> > series before moving on to the next?
> >
> > We also have outstanding review on the v1, which has now been split, which
> > does happen sometimes but perhaps suggests that it'd work better if you
> > waited a couple days or such to ensure things are settled before sending a
> > new version when there's quite a bit of feedback?
>
> Sure, I should have waited my bad, I usually do, this time I was in a haste
> with both series for no reason :( thanks for your detailed replies btw!

No problem, I've done this in the past myself haha (sometimes even faster
than you did :P), just a case of tweaking things to fit the mm process :)

Cheers, Lorenzo

>
> >
> > This isn't a criticism really, sorry I don't mean to sound negative or such
> > - but this is more a process thing so we reviewers can keep up with things,
> > keep things rolling, and ensure you get your changes merged asap :)
> >
> > Thanks, Lorenzo
> >
> > On Wed, May 07, 2025 at 11:32:54AM +0530, Dev Jain wrote:
> > > Currently move_ptes() iterates through ptes one by one. If the underlying
> > > folio mapped by the ptes is large, we can process those ptes in a batch
> > > using folio_pte_batch(), thus clearing and setting the PTEs in one go.
> > > For arm64 specifically, this results in a 16x reduction in the number of
> > > ptep_get() calls (since on a contig block, ptep_get() on arm64 will iterate
> > > through all 16 entries to collect a/d bits), and we also elide extra TLBIs
> > > through get_and_clear_full_ptes, replacing ptep_get_and_clear.
> > >
> > > Mapping 512K of memory, memsetting it, remapping it to src + 512K, and
> > > munmapping it 10,000 times, the average execution time reduces from 1.9 to
> > > 1.2 seconds, giving a 37% performance optimization, on Apple M3 (arm64).
> > >
> > > Test program for reference:
> > >
> > > #define _GNU_SOURCE
> > > #include <stdio.h>
> > > #include <stdlib.h>
> > > #include <unistd.h>
> > > #include <sys/mman.h>
> > > #include <string.h>
> > > #include <errno.h>
> > >
> > > #define SIZE (1UL << 20) // 512 KB
> > >
> > > int main(void) {
> > >      void *new_addr, *addr;
> > >
> > >      for (int i = 0; i < 10000; ++i) {
> > >          addr = mmap((void *)(1UL << 30), SIZE, PROT_READ | PROT_WRITE,
> > >                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> > >          if (addr == MAP_FAILED) {
> > >                  perror("mmap");
> > >                  return 1;
> > >          }
> > >          memset(addr, 0xAA, SIZE);
> > >
> > >          new_addr = mremap(addr, SIZE, SIZE, MREMAP_MAYMOVE | MREMAP_FIXED, addr + SIZE);
> > >          if (new_addr != (addr + SIZE)) {
> > >                  perror("mremap");
> > >                  return 1;
> > >          }
> > >          munmap(new_addr, SIZE);
> > >      }
> > >
> > > }
> > >
> > > v1->v2:
> > >   - Expand patch descriptions, move pte declarations to a new line,
> > >     reduce indentation in patch 2 by introducing mremap_folio_pte_batch(),
> > >     fix loop iteration (Lorenzo)
> > >   - Merge patch 2 and 3 (Anshuman, Lorenzo)
> > >   - Fix maybe_contiguous_pte_pfns (Willy)
> > >
> > > Dev Jain (2):
> > >    mm: Call pointers to ptes as ptep
> > >    mm: Optimize mremap() by PTE batching
> > >
> > >   include/linux/pgtable.h | 29 ++++++++++++++++++++++
> > >   mm/mremap.c             | 54 +++++++++++++++++++++++++++++------------
> > >   2 files changed, 68 insertions(+), 15 deletions(-)
> > >
> > > --
> > > 2.30.2
> > >
>
