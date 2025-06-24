Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727781946DF
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792749; cv=fail; b=fX4JoV83Uv1hJ/SD33G8eJ9BUZP8HELtoVG5WQmeK92ovtFYkOmhlsoWLmzzuA5slrsqnIaXyp+rJfaEDdaSJ86fDefuaCU9qwz8p3gwN65VylzdQt+5M/9iObHM6wDfanyCGtSP5sPrJ2BrNJ4BEFa6w/nW7HvF74I/Zo+HcbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792749; c=relaxed/simple;
	bh=YOrMoo/u05MCVPbdtxrBXMM2uzmOY1Ye9qh+vGyvoLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iL9/TJfQDtYS+VQMAdKbJZBueVET9fNwMAUQVWJhIjwp9B5JMlWzZdE25sZoNZCfdbzvF5e+lDF9pgyRsGOzFMpYgabLNdCCi1WitHj+D9OOMSEm1JmRwnyLvlmoFshu/W2GVWTIzo1C76qSeBRJFdP8kl8dYMXkl/74Zi+MOvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JzQqiMgf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bKp6OMSb; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JzQqiMgf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bKp6OMSb"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OHBeMB019216;
	Tue, 24 Jun 2025 19:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=/aiGO+Tg0Q9TxXLpNoWEhJpvt7FA3Bb0l4dWExXD5PQ=; b=
	JzQqiMgfucUNJk0FCmGkx4q4Q0cdw0PuQ2qsMfiX8TuwTOg9Ts9ob82Ox1tpuadg
	KEX/+wQqDgcIOYokbn9dabxZ7z0wYJAQkSOR9asYMJpQiJ6TKG0ACVTQLM+JP+XA
	+9mYH+ZKMDeinZw9o/w3viJBdpI7wUDZjkI+tcHXreDzXeyGcf9qSXs12pc0aM9n
	RtrhQXUpUT7aYZxHLUPcq7QnmxEUFI8CagQjyPpDL9LAeUwC2TwSi70aAI0v7wo1
	0Y2yOtNzxtuDhxB16+yXQHrve65GcNHAvb/gqmFbK4qJQxoZ0u3Kfv00IZt/n3FO
	p+BOTm5sRIGdvPg15/xC6g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uwxu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 19:18:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OHpBFB005015;
	Tue, 24 Jun 2025 19:18:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq42tve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 19:18:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBt8RiNGoGrYvwrwzaG2DaSrmE4SeCdSqy/2NGIwa2YQ8H9f/zW/M1BQ4ksY8OILExlbJiCChkAaDAGP95aEzNwZWHzU1NGG0bTuegV3rmh7LP6TtCOLSnEk26umPUeDmym6jK7hXMCNkdPjSLTSBLf5KAKdXh92x0q6GowKs8Se7tvV/zk031GcAoL2hLVfKyr0kKeJxWcwYNX2UjKPb4lxbxj/HIm1mCt46IP8C+c1pYlRxm8BuPwl6AwYXDb91HJuTBB0riw4nKBek0JrSzvwD7zmqIbrV/64JnCfP7xJY3s50QQB6lxsPI7XwzmpZelPCgozVmX6rdfitPRBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aiGO+Tg0Q9TxXLpNoWEhJpvt7FA3Bb0l4dWExXD5PQ=;
 b=rdP7/0cB+w1AM+NpjerUU4HzuwRidNWo2RHfgg+uGfAA/q+dDeMlkIBF4d/7gA54VkKrgPkE/Okbcu4HAwkx8fvNep2jqFMVNqUiLcvUFNP+xdfxmUBkzH9b8K5BydDAbJHN9lAvaAyBU4xAbsLROlKpPYQd1gChZSJEV1Pp6YleF44rhGVXpwqCRp4gyaq165PFBWiHKbDmNFfpCTI6v7V5xovOntvP902g8zVVN6jBGRjD3YSsYv5jhXEpFA+GbN0LqP0UWhMS+tQw6KgkXdnTXrkQE7Nq4Ng0exroRYNqS+K2Y6gnh+ZCtk+voVnBuLuKANbVDEkLG7Bob6zNCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aiGO+Tg0Q9TxXLpNoWEhJpvt7FA3Bb0l4dWExXD5PQ=;
 b=bKp6OMSbvSVnxIS0fpSutKZVoSCFzeHtRexpcXG0N+hRVmHXi8t/sounX+AmOvFmqIaCzHXrkVTtsw7EFvp6/gZWRgWW46OZKn3JHmaYp43ij+qXaBsvlnqrxtb+xQKsEEx/gtOcoEfQLfFGQ67FiWnwUbskA5oylvTz8us59aw=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CY8PR10MB6905.namprd10.prod.outlook.com (2603:10b6:930:84::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 19:18:48 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 19:18:48 +0000
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: maple-tree@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
        "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH 2/2] maple_tree: assert retrieving new value on a tree containing just a leaf node
Date: Tue, 24 Jun 2025 15:18:41 -0400
Message-ID: <20250624191841.64682-2-Liam.Howlett@oracle.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250624191841.64682-1-Liam.Howlett@oracle.com>
References: <20250624191841.64682-1-Liam.Howlett@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CY8PR10MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: a89f90f7-c52d-4bd5-dfca-08ddb353f244
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BWsRJ8NcZnRh30XJFJnIOT+IN3e/LAlf5F+i8xnvOqsp7sLHIIGaRshmK9SI?=
 =?us-ascii?Q?KPQ6NQIqoIBmjUPqizdlsFjgXcNY00FS06T2eGsvnFaVcC5pd5HquCjERJ5G?=
 =?us-ascii?Q?6WJTDOWmoSVY35xo6kWP2E6oI+PuDwrOimxRhun27DwAgHsyXSNFmj09tM8S?=
 =?us-ascii?Q?5oLM+oEmFvtsoY7jY5DylYAIbEkQTI9PF/bqtkK0vLoguYQjwHjzx+VtI/uq?=
 =?us-ascii?Q?9b7RVtBxbm+E9fyy9pOj05KIMiJo41iA0KCwg/2xyPuCozUGMNaHjpwLS8bz?=
 =?us-ascii?Q?PH/mgdAued5MzHmnwxZ4x+ej+VXSNUwul7DzTjfY0aKSRPWRBlkYvWAZPPUs?=
 =?us-ascii?Q?77yPvp2sCKqQFUJ0WY+OYdtXjZO4ygBkebQSfLce5HTwfHm3Z4jqHP1TWXWp?=
 =?us-ascii?Q?g6x0bf1S4e1kqOnk7bryX2Fv4YV+NH/Z/v0v9XuQTHzP2uubTz25PZ6FeQlf?=
 =?us-ascii?Q?ppixwY6cY/iMWvWR1qRxECA+64hYM7J2aT/tvmbz6jgWE3mwHqY9U1BJ2AQA?=
 =?us-ascii?Q?dA5YtdfoBwGIku+booi9htaIXOip7A4LOFF2PG8Xg7hVlDWpTY4885u0qvX1?=
 =?us-ascii?Q?4uu5gX+aZyVkBgn3axU44JcKIWy1J7rRTsM1XacjSgEDgxzdHOXoMZu7Sr8V?=
 =?us-ascii?Q?hwowLPxhiD44+QWWNqqj6W1yJRrLy6sjz1XD2YI947IxFh+Js4nK3h3iI1sB?=
 =?us-ascii?Q?lmLOnmamNUB67MlG+uAYI2c2aKH+eCtAMW8xNPPLbppGsF5stahkmSY/lrql?=
 =?us-ascii?Q?JcyBExGvPEiClMG+rRWt+ZWvewfxIoJlZg7q8E24YQ24hFpB4o9tn4ri4Yps?=
 =?us-ascii?Q?3beboAt2HIXqP+UWghQfI3ShgZ0/mh4r4oeG3DZxRs+KZr4fwAR7gn9nGDke?=
 =?us-ascii?Q?h2WpvUI0Cm+awVTydiw4l0mpgSHIxKu1ooym0zhD2zof8dSSvTFro6kEW+6Q?=
 =?us-ascii?Q?OSGZRoY7joHAtzc+SQIa63p8zqqxZtIv4uQqigxIIybuyv95UgXi/uqilc3X?=
 =?us-ascii?Q?X2E/0wjGCPc9ijv/fgIyoOcDJQXifH/iedn1HNprCNILY64fANKHXwjcIyf2?=
 =?us-ascii?Q?pIYoPFHGtBeOQ9cuL7APeqQSVe31Cl8PdUQjoTkFT6cYoPm3vJSCGLU0FsVT?=
 =?us-ascii?Q?v8GBRURAyA7QaO+S8jBPwEe+qP6Ec/hqVzRul2DB4MTfPsAAOmehEeCPbQNC?=
 =?us-ascii?Q?GimIFZM4/jv0fNhmsB9112AODkZAWH2kRvcLtx0yFRVxAm2OtdMqNwWqxVGS?=
 =?us-ascii?Q?lYVIBrHtanHmywhnk3b4YaVhg3+2UyMQzvAVYMcGgMk5ofOxSAvow2r2jJOU?=
 =?us-ascii?Q?XwQslUN14U3JYiHjghe+bWB2fXhsyOeKuuCKZaaUeBejnykMneQzsUI7D8+H?=
 =?us-ascii?Q?HifIQ0Zpv+e0TiUuYhXns73Y4Zkch7VhRJS+AWJHWOh0aykBzAB57opuig37?=
 =?us-ascii?Q?Cdv0sMELEp8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QADgE/076n6549V6A+y2UgHmW+7crwRM6nmbdNr3qNshE4Q+VQS9HTQIIyhL?=
 =?us-ascii?Q?9vbBcvT4FDjksBh114UKGDXVA9cQSD3TMUe+1e8n3iJnHu/WgU1V6xzI9Tx0?=
 =?us-ascii?Q?zCyX4oONPsJaXxQwkosw5B2dXspEcpaEAYmFQN21iRGQ+DLeOqYG7TvKmIxy?=
 =?us-ascii?Q?fdyKPufQ8qGQ7oWrZYOC/f5KplgwxEpVV8WEp4YF2urnZhtKGcyuGLqN5ur0?=
 =?us-ascii?Q?qBv6W+kN6/c2Vwk7ulOJYB1lzZZ8VDyXVjwC1bMmUk7H2XxrfQcbkad6bPRC?=
 =?us-ascii?Q?yvQ3tE20xonkye5CVmgSRCG4KnPO7ZF6Uwf7JxBZAUsTB67AX9yCnFcg43gz?=
 =?us-ascii?Q?tp2OgxCxCX4q+BaiPss4vrmlbeG1jnSGKKAjle8vf8pWFmh/bCExYXRVWClf?=
 =?us-ascii?Q?n5mPgramPOeD0n6p9rhn4ZKziZDlhLrq+I420+4RCM5++tUmBECow95Rx0ut?=
 =?us-ascii?Q?9Smk4MyjUwFZ9a4v8kqrN2H6aWyH641mRQ1STnGMxAYgenZ0S3R8ZeH/ouMY?=
 =?us-ascii?Q?HQ6P/i9zqHsqC8ghjKt6LmBwrqH7UgleIB7Ket5eMMjWuJlGW6T+KaeZq0AK?=
 =?us-ascii?Q?uRCMGMWFcI+u42Q28dC8vN4l2RvxrFNyKqL07NQJxqhS02PG0YYb/UpYElcG?=
 =?us-ascii?Q?3K8VI5ChgK1drcW26qSmn07tkKCDM1fyUqav2q7ymM86lE01pdmIz7Q317T/?=
 =?us-ascii?Q?OrJNiRIWz0TEjSggOU6GUamLNwSUrIdqV8vHgM88czLHAZdj6ZBK1/IFSOzQ?=
 =?us-ascii?Q?HVeJSzS1bpi9ef/QnoeuSq/q7fFMuEbpjJl220BDgdJGNopIydDWbV97iqYR?=
 =?us-ascii?Q?08BGU3gG9Oku+Pz2ju16Ofv0/+yZa8AGMpFM7XTE20KQW0XNPs33rkzOuJ/z?=
 =?us-ascii?Q?igPU+64WQZW/IaMeBpMH7NC+PJro9Y3nej0jNz7sCFvhNv66h2F8at29kfVk?=
 =?us-ascii?Q?NSnKl4NZU4SM4fYIFjNBCruAzuzVM9V2DRMfTD7pygc+lElvauAPz3c7S8PF?=
 =?us-ascii?Q?olBUI/jQemh07sypfspk4KGY6/o3PPsByxMhqaHSChm3GdU0UrbXJN2fpUQG?=
 =?us-ascii?Q?JOYy7ME0+azU3970lPx+fehR+zWn+Pm4Id0+ZCZMFTh4IW3f8EDAm/AW/AMa?=
 =?us-ascii?Q?PaV7k49X5zBJxaYWSxxahNFSzVCzEhZ6iQthJ+TVsMeVAA59paKP0WyJxTcF?=
 =?us-ascii?Q?aAClkUDgjMeIr3SnYSVANbyiJlmQBdaewNmCk5Y3ZbSC51OpDe5gDDB+TWDy?=
 =?us-ascii?Q?l3jhtB5cccClRQUQuHTgNNlsFj1GFm97xgGbJVFctDzn6w9ZZq43K6FV5BAe?=
 =?us-ascii?Q?L/9OWVCLeymkH5BTqVBV40xADvl8m9V52XLJcAqt1vVow0SACydOil0EEvqF?=
 =?us-ascii?Q?u+D7XL+W1IpRIHM0JsrqIn4TIZ+fR7Z+9TRF1aw5ujhaV8cd9bKYxfoWzzWA?=
 =?us-ascii?Q?rQvOSrB9CbSwlOs4DntNdGoZezG/NxCqJxXt6FlVYrQCmjGccPhRq5brE0zV?=
 =?us-ascii?Q?KPmFUoVHJQhJ0REJIXJ/Ct3Jri7nixPpH33cJHFYpKGl6H7XHKNWLKuSchtn?=
 =?us-ascii?Q?id76szUrqok5TSxWONO/Lg/PFaLVlmxXk/WXE8QaImxYgD4tSQgptFSsj5bM?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EYHc4pWV0jdw3jQmEEE2EpdDB4Huhfx4nMXxJTp327Bd/BUvjNFnGaZrx5Qwn/Xju93X1YPU03ar7CdJuWiM2tertfa9TNf13xqO2csrivb5VvgPwSTB3DVikyPpNFym8aI5oQnJhxvc3tgdPNLtho9EIY2Dl0V/LglnIdJC4CvFSAsg5Jx0ec05Ic3gEuh8SualxC2+xN1Wtcqvmm9jWlRh3eAipsbsZfJpaBpLTdwwAo8B74wI3mHLQ9JrfqHUT5vfZQTrjchoysle0YaK9mbqrOpMNksPJKX1MIhzNFBwhAOUTAwf1Wile6ch+uT20GkEa3wefwg5uAaRfZgyGflclNMrM8g0S0eoKlKWdrpQTxyAadARu5aYmINwk5zEBcICixlhU+QcU4L65NjEbgPlTnEDU7uxmrrWNmmULVHfD3hTO2OdBmJzvoQd7bacpVrosNdivJsHutJsa2/90h14bt13KzOCmi6m3dwHzPVbY+y+PTvuRS3DxKbCLWRXBh5YLO9IATM/9WQiNGD/rK27kPgqPXbCq5UQjettfsenTx5xjpHIwi3nXRlH66dp6BqD1q4CtT42hI23Jm2QK9AMxDkjVWCnD8YHCgxrfZc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89f90f7-c52d-4bd5-dfca-08ddb353f244
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 19:18:48.6078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvSslzPYPgwuWnB8joYw08ZJclp97aUJUJzfoolWLMJbUI+Vtu9BzDeHXFAZzR0nodIkEv6lQeXKB/dekXW0xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6905
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506240158
X-Proofpoint-GUID: DJHH4CPhI9ji87a6UyjVL8Aj-rhpZ7mu
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685afa1b cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=BHM9oF4XyBVNoSNr9EoA:9
X-Proofpoint-ORIG-GUID: DJHH4CPhI9ji87a6UyjVL8Aj-rhpZ7mu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE1OCBTYWx0ZWRfX9N2RowtDHj6t h9HN9tuvIc+ncmzHFOWx25Lr7QP9WUKYGLGR3eBhRU05fPyX4EnMaioysJsQgblN4VBVvXHDx60 cK1I+Xuq4Waugf1ZpO7SX/eS8p252pMGNXuoaACxzQ/wQjBo9jqnZu8jWUFescteFsP2jXGF6zc
 f6wKvBvmJnuSDfHF9W4uRJttBCtP7AYqE8i6moLvcOFOl1CYtU4qmHGj6pBPpTH2hdV75eHsojb ttalvOm+IyjHk9Bg6vR6rxidOLH8LTxzrOTPtjWdaDSvl5MhKcl+RsFsGnDCrtbSWYYn5dv533E kqv39y1lQTDX3YUssyB0IJd3O7LQRjDnA3/tNxXXfPAVxFB9SsF2vla5HF9C4ZmIp4jBtvo8PoC
 /UliI4GKOH76zRz9ncepEqJnMhyIsMkJIPZ8/4NZR3ncv+Ano6cU24fo9W0tJFvLJGfvjZcd

From: Wei Yang <richard.weiyang@gmail.com>

Original code may not get the new value after overwriting the whole
range on a maple tree containing just a leaf node. The reason is we didn't
set the only root node dead during destroy.

Add a test case to ensure the new value is returned when overwriting a
tree containing just a leaf node.

Link: https://lore.kernel.org/all/20250407231354.11771-1-richard.weiyang@gmail.com/
Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
CC: Liam R. Howlett <Liam.Howlett@Oracle.com>
[Liam.Howlett@oracle.com: Use mtree_destroy, mas_set, and set val]
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
---
 tools/testing/radix-tree/maple.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
index 172700fb7784d..2f6dcdc7a38f6 100644
--- a/tools/testing/radix-tree/maple.c
+++ b/tools/testing/radix-tree/maple.c
@@ -35257,6 +35257,32 @@ static noinline void __init check_rcu_simulated(struct maple_tree *mt)
 	MT_BUG_ON(mt, mas_prev(&mas_reader, 0) != xa_mk_value(val));
 	rcu_read_unlock();
 
+	/* Clear out tree & create one with only root node */
+	mtree_destroy(mt);
+	mt_init_flags(&tree, MT_FLAGS_ALLOC_RANGE | MT_FLAGS_USE_RCU);
+	mas_pause(&mas_writer);
+	mas_lock(&mas_writer);
+	for (i = 0; i <= 5; i++) {
+		mas_writer.index = i * 10;
+		mas_writer.last = i * 10 + 5;
+		mas_store_gfp(&mas_writer, xa_mk_value(i), GFP_KERNEL);
+	}
+	mas_unlock(&mas_writer);
+	target = 10;
+	val = 20;
+	mas_set(&mas_reader, target);
+	rcu_read_lock();
+	MT_BUG_ON(mt, mas_walk(&mas_reader) != xa_mk_value(target/10));
+	MT_BUG_ON(mt, mte_is_leaf(mas_reader.node) != true);
+
+	/* Overwrite the whole range */
+	mas_lock(&mas_writer);
+	mas_set_range(&mas_writer, 0, ULONG_MAX);
+	mas_store_gfp(&mas_writer, xa_mk_value(val), GFP_KERNEL);
+	mas_unlock(&mas_writer);
+	MT_BUG_ON(mt, mas_walk(&mas_reader) != xa_mk_value(val));
+	rcu_read_unlock();
+
 	rcu_unregister_thread();
 }
 
-- 
2.47.2

