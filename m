Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC331E377F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051409; cv=fail; b=u55Ugea2ZTCajaTbI5hwruyUEacx5TT1e0ykfTk8w7bjwEi7Bt1qpeKzMSbqYawGgYdtxYRa3868hYElMIxmRT1DvdfB5NgeChidor/EBRk1IBtKL5x+Y47d+OEeWjhpgw/lTMfS7LuBNoUwqyySJCAHJrXAKfOvXt2pRFppzAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051409; c=relaxed/simple;
	bh=2CiaDtc9B7N6zxVYzSQpULP4iQqaVwPuWmshrVlc0SA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y5v0UcwPQC6KsSNl6YTnzEnU5+AhY63aC51CsNCr0Efx4iXyX+FilU0s3OYB82gbLjUpzk1bdx6PZot0Lfywg0quI6DLh5kQNrZXE+OV0vnBCsoe2rYIRbxXzWRuKLb541NVlBZ5cmsUpvMVu0T67idgS9idInn38+m4NaTPveQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dk65cd3g; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WCYP4LuC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dk65cd3g";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WCYP4LuC"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNdKS9029927;
	Mon, 16 Jun 2025 05:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=RncGlNWdlbZfJrWswtRHsjYN0ENoNlzSJRetE/z9cJY=; b=
	dk65cd3g5hH6dHPDht5Lak5AJImoL9+ijbFVJrnyr52OQylpnlDc+k9gt8LoFNYv
	R1jnmyN3/I5uHZY0TU0PsmYEi/cHmvo8lKy5VFa9XGoaB7D9JwPD7f7O3bR6gMxq
	pArpy3E9F787bhkbHiO5WSkaGaz7m9ZHEPCNzl+ZIookZtOddQeN8cFiwAeu57ys
	zyohBWbtOVHt9Ekb4Z8HwWlVGILDfyvAs1PPus3Ty5RssRVuSktNk4a5vS5N5wem
	b8+sXo9Pmr+YIXhE66dXsgfPAa4iMqU+0e93uXV11iYtJkDFcJ3xUcHsp8wUar6N
	MhlE0PkTjBb6Mv1goPTIrg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4hqs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:23:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G4Mqxs032103;
	Mon, 16 Jun 2025 05:22:55 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011045.outbound.protection.outlook.com [52.101.62.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh7f1ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjCIZIs9m/igNuTq1HrhgUihpbdTZ1AI4wFocf6SHqFtuKPpZgRWdm6q48T+ZfarkSxrPI4loGZ97VH67+9jGHheUDpWoynPrLAH434A+O1ffnqhsvkhgvE3w4+qm/hBI6neSPfWYYEg4OGrCUI7VjgMUDjT5VfBerCZXBEqoBSfOyAzI8XJP/DDfuRBMD6Hd6lQMlVVTZJHe9pn0qtBFzULINsacigrgUos0k7luNi8LLCPGI1F45D4c7Ud3qA++ztQV/0CXlpitBV6s1D0iGzn8+T/l1zq/LIMQeS1ciXe/s7/T0wDu7OXxsYjWewGDqVTF2PNslNwn1PJpcKYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RncGlNWdlbZfJrWswtRHsjYN0ENoNlzSJRetE/z9cJY=;
 b=xruFexCHWN/HWNkBnQbLA2QVq5OGdbQmO0uR3waUhe0mFSl3XPAp4kbUUODNRIZwKNGZaYJJmrWym7EZALg3g0XhP3tYQEybNmMaU1AKnQATR7DiC7oHboXHkG6qYBcYDNAl6icert8l0JI70rGuQ+6Nr6AvqrVSwiQYziG7FTJQ4CrLOb8xFqWg5O+yu8GgzJ5WUJMo6tsG4INd1UZE4O05hFH+8G3fGmAOaDBM94Q0SUidQNRw6WdNk+dnVr8lSki7mPNiosU1ll+pZvl3WNvQnPodsCGTcTNH2wEIWVlb2cneko67zMnQWO2aFWqdGKqUsw/5BgQ0/UgpvbC3zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RncGlNWdlbZfJrWswtRHsjYN0ENoNlzSJRetE/z9cJY=;
 b=WCYP4LuCpsm99sWxGi3EkzgY7xR+VZOVScy228Eop7GzLaAdkLIngy5Kt2vj+9Ec7U+qS88EwaCXm3NpZtMBgegZqLWDJIUnEcpj4b++qaalR6S9FgRkbDz5NfWAibATvWvKwgPduIqZRzIYX3u9jBbOz+2QJGfft0mxZlromBg=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by BN0PR10MB4903.namprd10.prod.outlook.com (2603:10b6:408:122::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:53 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:53 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 12/13] mm: memory: allow arch override for folio_zero_user()
Date: Sun, 15 Jun 2025 22:22:22 -0700
Message-Id: <20250616052223.723982-13-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0040.namprd08.prod.outlook.com
 (2603:10b6:a03:117::17) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|BN0PR10MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: 9624e383-45f7-4692-847a-08ddac95d7ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?syimI113InVxZ5w/dMXbgoE/nePh62nEB7LjP+i1ycTFq3E3mMlN6dzf4Qgu?=
 =?us-ascii?Q?uqnueoyHQfgkXMTjDRk3xtIDTaePeMfuVIi+/l0CLB1y4WO0A5p2Kun6F9NV?=
 =?us-ascii?Q?ZaOqiJG/yofbMkGCfDVPjJj60So28z1OqGq8Cr/WndwRO2t3pFlhdagHsIzF?=
 =?us-ascii?Q?KXB4ygEL8hiYe0mRN5EkI9FAdLQwNALgl9fxwyefITGrGMZ19QibFRT95sEh?=
 =?us-ascii?Q?LxvlRNxFA0nIqmSNjw/6vjpqbnhLbtjg0iPB5VmtxPjqf9DQ4+4+u4xzecYZ?=
 =?us-ascii?Q?GRrPmQaTg2Mhp//2pGLa3v0BNe+liVJFTLZ4w73BmTw0T3tga6x4q1vJaDeK?=
 =?us-ascii?Q?ooSOR5XOsFcFUbQlmwN5pVaRLywSjNfver9nOiz4AUQYlVzmoGMvIYpRvEUh?=
 =?us-ascii?Q?vpPC2Vn49XRZN9rdRd4HWGLluRl3dwifmMNW0QMctQDWxspp/JHFok3zm/2s?=
 =?us-ascii?Q?e5jncScLKG+SyeJvgQ9k68flr7p4A24nj6ObRsAHvKHkS3fZdtJEPMdneIK4?=
 =?us-ascii?Q?NO7mHtc8qcTzN39FR4m3eVP9BkbChAsSYtCsUOjhwE7ExufzP8xtBrzwHnLl?=
 =?us-ascii?Q?39W9pwAH2zSXR4oShmAn71/LT/qjYQS5KU/k1WsWTDFXlKSLXEyVPIT8kFoq?=
 =?us-ascii?Q?HbRYjsQkAEvFUSsGJk0DTzX241r8qc4TJkA5JneTE5VqnF8PhkU9XSh8rBea?=
 =?us-ascii?Q?83l0lPV2djD3e5RsNoDT6PoVAXjl5zClpM9FCzaKsKElS6u6M3swbDuFcfZd?=
 =?us-ascii?Q?433NS7dxJBIMENNLTJyFA10wcAnnODw5mbw0d8fyr9RquTiuqmS2WX2D1xrf?=
 =?us-ascii?Q?4AM3TBJoXwQPXkpT5F+ZUP5Kqizp93KxyOSu6YslE+cEmlnOjKKAIXobq/c7?=
 =?us-ascii?Q?LYvntQRq5Lodt04BfM5jo1kIgS2IF0mfFIC1lk72XSqzkhiMmbgQZLVAgy3j?=
 =?us-ascii?Q?/gjv40IYVxS3puQU841pZoX0tqwo35Uc5IikWrQOaFgo4xN6nevboxKgclY0?=
 =?us-ascii?Q?fBVZstiR7NPkmtdV93vYVLQAlMuWqLxOg0HicllCrU+iJNF6Ey3At+4Ky1ru?=
 =?us-ascii?Q?7+TQE4v7FD9HMEdqjq9mHfJJuZ2Ygl3u8q1k33Eql1tDZPpdAfm5kBw6SsIG?=
 =?us-ascii?Q?4RniqRr+srver+ahRpoLXYVi647VB3lCk4rcapfInkE28rewf13s17YSUirr?=
 =?us-ascii?Q?1dn6duHlCnxZxIuMV/RSEwhHvPyeKb2z5k+APZvkZoHqu44zMJNp8Rk1nmb9?=
 =?us-ascii?Q?PKFFqrVJturQpy3iSyd4jfa6G/IeTODGtkPPn7dIn6zcMTAK/MRSNDn20A4w?=
 =?us-ascii?Q?7lfCgl1qd/CblUEKzsgXW3/d5Qf7e4CRZ/dljJSzreZf8ij26P4cyV8x1P3K?=
 =?us-ascii?Q?M94gvgRuUClRWzU7Fvbx0vUvbWdKIWhBhv3slbomWuRXYWS/NhhsAH9ngQGy?=
 =?us-ascii?Q?b+L/y/pB28M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?05j/YaArdwk5JjDq8qrRKVkch/nBfWtFbQcvd5DdBEIG51Dro8CQrP8joyaM?=
 =?us-ascii?Q?G1wkJlw5ZV1zcu5D1gWj3nm/gvoLysgRkrJcMzIDoiVDMXhFj4+DP+9NUCEe?=
 =?us-ascii?Q?jmK9Cb6q4llNHbavWppjzPKmaUqba95jGrK1RVYnoQlmXRQW7xNi2W4HvcHQ?=
 =?us-ascii?Q?sCMCquWHu8qutxL9s/341EsSQuVt5Hxv1I3bOqkSlYjYwaxhC6i2dFGTlT0c?=
 =?us-ascii?Q?fHcBdYDeFBtt++0L4esk7whRzGKr7oXl40BCPjz7hrjvk/CVzKAybhmar5lF?=
 =?us-ascii?Q?7byfNJJH8RY2dfxuD0Sw4YeJ84XOdaaKlj6gV9pTa0FAoyNFNey9eZYougzn?=
 =?us-ascii?Q?sfd0DJmoRq4X6QmQljKw7iGkBbIP7RSLQ2uAuLmrGiNQawchQQTvZO7tpPIA?=
 =?us-ascii?Q?ICmJ+lNhNfLuKEkWNDzdNexDjIS3u3fp42opClpdb6g9oxcuPvafa9z5EXr1?=
 =?us-ascii?Q?Q5Ci+yB/VJgrAVwUyh526dDIAUsrHyJIj4yW91EtpLbORovn/glZnSsXRxBr?=
 =?us-ascii?Q?2flW9I0OdnyU6Vsp8k1f4eHooNY1u4vm4BuDgUMwklvHBSFQuo54ZGGlmUdc?=
 =?us-ascii?Q?MLgHsZmEcBYcTQApgPFyoMfo6TJnyGhFgAxOAM1cLLkVNXxOkK/hTg7MlHvY?=
 =?us-ascii?Q?MtU1Mu+dvDheq41PNzFHJsEgSzFxIgrPyZPHCNPq9Q9CIC3GfmTyLPwSwD4x?=
 =?us-ascii?Q?1hInD36Bl2ZGa3n2WUPovorngxkD6qFnnxEZSOqiYfiKe82nqJiqnuT0TdOQ?=
 =?us-ascii?Q?JyJXHKlyNck8z6cBbevZzMmeDU0vcFDaE21gGouyhTziFsNJdRdmM/UF3V3C?=
 =?us-ascii?Q?Du9V0TzDHZQ59Asdp0HDduzuLFt+axQ7XvSKvrsfV1rMndMw5j0u7Q55EC1g?=
 =?us-ascii?Q?iJi+n8gbrnR1z19fs0uSlO74uDqMtGV82BeS+PweRU0sj8y/AA6MhavGAn34?=
 =?us-ascii?Q?QtCvJekFgGXrJVSM5px7cXAfrA1UHn8dbH2W5PA7m1VrTK5mqCQqnngTvby+?=
 =?us-ascii?Q?szaoImN3VCSEtF1kU9sve9g25/cIe4eYsnL9HH2fz+iP6S4bgn00WxCZ1Kou?=
 =?us-ascii?Q?l8FiR9RQVmihEyNMQaYJsct6cLS3zcDM92u7b5uiJWjoRkIzeE7qUX4VQ94j?=
 =?us-ascii?Q?5+lXB8kgXsLMTyDQKdAERR0kq/0iLU6f6gmLBNCJ79x+lm23Mw/YMABAG8IP?=
 =?us-ascii?Q?HBFxbIxyDuwKw64aj/S+WOXKX3NQR3qgJLhASImU69LvZoIKuIatKaoRqu+M?=
 =?us-ascii?Q?oB4wRJInT3rS0zohZQ7qkYlDYnQTfk8XNMkxkqV90hWSzFMzEu090LFuUnU4?=
 =?us-ascii?Q?Df+y9J6fv9xg8fiXBMnMXCC2dJfQt5l1ZzHeBNEch4wghoRDP9S9pCeKAEtE?=
 =?us-ascii?Q?jDOjyYYDPRHO15Oh083xVkE3nYux0+/TQCVcRNwnhIflOgnkcHzx6AX+ZrCm?=
 =?us-ascii?Q?C8lfz3nU7yLONko6xVzOEpOIAM2FN4Vd/SjYC/yLz47VeXnu0aWcRkLl7Nqv?=
 =?us-ascii?Q?PpEP+MDKuEO0gg0MlOoMu5Hi4saSAZZztxlkrodwDQNAJc+NSJVXhbRvXvyI?=
 =?us-ascii?Q?TzVYKa/GdclNt9PdcYZrCbdz9peWF1p0X4D4gbMyztb9x0Y4BALwjFnOEKEk?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OTPWs2QBcbfvrh2ZEhJAXufe9KV0oOz+7cF5KObRC8/lI5HFx8lllbApfruanhdKQ0TpBDxLb85o8OyHF5F1XEYl723+bN6t3WM2cG6lLez9XvuZYsTeD7jDxsymim/3LetMkK7YPnFpKxKsmLpcYzNrZ2TXR+A6fBH+5gy/q5jDGmoTZAxj3qDf8NKCb7KH0DDSIZzdJfZ/1ZeJTqTc+wsXsOwUe4oP4aRO1hsztJp/lJ/XXgPNO/zmUU22lO2p7QVr4/U8UQcPFfoB/jzXMmCfcDetJn0m1ZYFJksEhtcQDVqBsKQojndg+kms6s67QPqEUPOnGIEZKHEy/AK4D4l3vNP1gKv4BfVzks9391t0a865zO3ynhFlitgFXLl7IbPxCuCea7C9ffmVXAnBWQZU0xO20EXwmHOTK0UHX/vnbG2gVEgaq+X3QigKVd+Qu7gs0sXy3tBilwhSmMOBPGXe/roCQpA0wDxBcjkNmuk2Ym0lkkajylmMJ7E4UhR3oOfl9NU38KzU8CPqTobwpw0uqXYKzuNIHt7qTEugvCfKtsWshRjdPzZvLFk7xyX4ytYTnz3Yp5sTvg+4RrWc3PP+MqC7InYupYx4rvJDnro=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9624e383-45f7-4692-847a-08ddac95d7ed
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:53.0196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUP7p59lmpQca6JMqUsctEkcCdDVeppGKs6nsIBGX94MUBGIsSXzNVZ5FF+qgOTacSt+EBvQnhDsrkcG9+fU7Ly5EpYkuk4BYKHPmCgNv9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4903
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzNCBTYWx0ZWRfX7mGzujdQ1UGv 2ZVjP9M8EguTuYRZ96cVvLKWTBNWk/2ZhObD9Fr90npXwlW+CR3CrioY/5L8NcxlfkjFp10p50N FyWZg8Mw6bIxhVtoATv3sV9IpxZo/Aq7Nl+US4dWjpraob4FQNZLpM3ZzDrBb5T5rpXtdvxBbLv
 vYqADhK4dJPzwokw3rggmdYCPQKdfAQdaj83DgrKEuY8M85cu8I8DsJzfwOHUFdEIZYFPyRadCQ 63ZKFkIjC2PdiPNaCQS5NeLKfMe0LT2rIvkWlCUNBvRbquN7/kgNusSeg1zZ1MOxswfH0ksECYX THMKV5BrINJmPn/LhZV5exVaJtjkWPKzWkc6VH4iX9R8QQ8i5/TJ7u4HTAdx7RbXSSEoicZW/tB
 Tj3ASMjb4Bz1BSPKj/4fJogps7C4a1uTcQtKIa6l7HMS+t0KXNy4GDwxTNQwmWJymje7pb/8
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=684faa3f b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=Z4Rwk6OoAAAA:8 a=yPCof4ZbAAAA:8 a=K1Mc2H1nIcWELMlv1fYA:9 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-GUID: fYUKF9KbnO8keewGwxstnkbGfwvK2Lxs
X-Proofpoint-ORIG-GUID: fYUKF9KbnO8keewGwxstnkbGfwvK2Lxs

folio_zero_user() is constrained to operate in a page-at-a-time
fashion because it handles CONFIG_HIGHMEM which means that the
pages in a folio might be mapped to a discontiguous kernel address
range.

In addition, cooperative preemption models (none, voluntary) force
zeroing of successive chunks to be interspersed with invocations
invocations of cond_resched().

Allow an architecture specific override.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 mm/memory.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 8eba595056fe..e769480b712a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -7079,8 +7079,11 @@ static int clear_subpage(unsigned long addr, int idx, void *arg)
  * folio_zero_user - Zero a folio which will be mapped to userspace.
  * @folio: The folio to zero.
  * @addr_hint: The address will be accessed or the base address if uncelar.
+ *
+ * folio_zero_user() does page-at-a-time zeroing because it needs to handle
+ * CONFIG_HIGHMEM. Allow architecture override.
  */
-void folio_zero_user(struct folio *folio, unsigned long addr_hint)
+void __weak folio_zero_user(struct folio *folio, unsigned long addr_hint)
 {
 	unsigned int nr_pages = folio_nr_pages(folio);
 
-- 
2.31.1

