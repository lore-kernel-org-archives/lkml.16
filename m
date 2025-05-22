Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BFD80B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747873015; cv=fail; b=svQCszSFwdRwKg/aRxTWHhWiNbA4Gv3b37lEJwU++fwretu9AvUb+BjReI+PBRrPevhTKFJ6EH0LM8odpBFumZQT1nfKEoN0LrEMkcSyrFyhXRA14VdyT4dgUksOe56aYj2hfu6yxpiJahCSTDgWj79pVv7L2uZ0/9V4roxt0rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747873015; c=relaxed/simple;
	bh=a9FOv10I0dLZZGu7dSRK36YiWuDOZbw3p/wEHPZkX24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EkfXKg4nMl+VBZcA4zMEhVvc1zmRqxNqtekbwxnhHCWKbLzjw65hu+2LpoFosNxyucFgHzPvtF4704ilIF80F1a2uqJSKwJQSI5mpRf0iG0h2/dcqxj8MSnVNe6WZfy2dHJFl2M8mnLcJXHS1YxpFww9Wx24Fhr3YPqBjjbR8W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C2bENc98; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mB77k/KJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C2bENc98";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mB77k/KJ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LNvrto025827;
	Thu, 22 May 2025 00:16:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=/3DDwTvOb0zwD+6cj2
	CbB1+U+ojMmVSOj5pcQrqX9MY=; b=C2bENc98u1pyUBLKJvzw2pEkwT7Ts4QPr0
	7lLtHm73xnxF7zW4MH0QbQQMxHguS9K2aq4KYXJZQAemyLacTUBo6sj/NCvQ/3t8
	+PqcLW75NgB8do9wwHYEVKRal5SxeF/QiKKIzEqSCOrM8clcZn+wRYnWKZpy+WoG
	JEoxvB9NvnwU49LjwGGixG/itrosQZ3rnXAmeKWWv6mRCExjRo9bqlLtITlOe8aL
	MfQhxv3D7XRxlCqf8aeKfp/D94tHfbry2JHZtDr20sWlSDugjjekYFfPDRC3bQGZ
	+xvVGeKYFtbZ3e68bPBEw2JDkKZniyMjfxAxmXO8dpZWBoJcFJkA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46srxwg0r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 00:16:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54M013EJ033508;
	Thu, 22 May 2025 00:16:32 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46rwep0kbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 May 2025 00:16:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dm/wNH5XiI08bQN7XDs7RAG7R6qQkJDlyQJKTq5xnv45Qk9sWqKl1zBfhxnJmMU3lIax+roB3RWXkcfGJt6KIGVWdRF7bUM0xGvigmeVSgivbUYDonH824Gulo9tBhKCn8GFS95/HtBl22ZygDi38VIX2NlHghcpCs12Jci0w05tdG7blV/PdUiIdNzvAL/a+aya/KaC6zWKjnrOQMHpccgZvxSqIM+z7Wp0N/rk+PQO15Sbn+ZSIvqyG4xvhmgC7kZ+sliq+sJRLa+LF9iAWVz+GMZH4iQoWM5yBXtNkpMeQnNj9r+zXOF/5j9GRhki/lqPcittwjWZTswLV1F8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3DDwTvOb0zwD+6cj2CbB1+U+ojMmVSOj5pcQrqX9MY=;
 b=Dg4UtBI2tVMGzHtEPbv2V8oJ9rXoolyemSmBFVv77im2zIpyB5h9NPB7EUv/Jn7htEskcygjATOYqYANnEvxQ+YAjQSqwnEI3ORwoUBJZ3P20GurxVC3sY10rJ3PwviSIGBpJIlCTZXCOW5EhBmVSAGgzkjVTpi4Ef0eUqITVYGkrNUKn8Vh4Yq0+KHy736wyCmM0aB83Q9X6ubwcMCypKONJ1+cpfFB/NLyaCQkQQB/DtRqXIQgLBAmmkLpf0PMlQ4VJD8Sh3EXueYbSyY1LXhl2qA2UbLJd6PSYo7H9JYbhYIfvCakzhY0mRxcmQmY73HuAyM8BwpdD/D/fTFloA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3DDwTvOb0zwD+6cj2CbB1+U+ojMmVSOj5pcQrqX9MY=;
 b=mB77k/KJ35dWjIrp0U/JtPUAfzA6/nRGpiRt1sg8TLxp58B/lzn4kmFgm/KnoNLjZlMNvjDkdUi6BEqDJto6FLnqclUAZggBvkY29StQsX61nBjBMLHLRDvE9EKSBUHCGgTkjuNJbnFQUAH2zpvRveeEAFh4FQ7Njgb66/lUODs=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by MW4PR10MB6420.namprd10.prod.outlook.com (2603:10b6:303:20e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 00:16:29 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 00:16:29 +0000
Date: Thu, 22 May 2025 09:16:16 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, surenb@google.com,
        Andrew Morton <akpm@linux-foundation.org>, hannes@cmpxchg.org,
        vlad.wing@gmail.com, linux-mm@kvack.org, kent.overstreet@linux.dev,
        linux-kernel@vger.kernel.org, kernel-team@meta.com, vbabka@suse.cz,
        cl@gentwo.org, rientjes@google.com, roman.gushchin@linux.dev
Subject: Re: [PATCH 2/2] mm: slub: only warn once when allocating slab obj
 extensions fails
Message-ID: <aC5s0CQMHeud3LDa@hyeyoo>
References: <20250520122547.1317050-1-usamaarif642@gmail.com>
 <20250520122547.1317050-2-usamaarif642@gmail.com>
 <aCyEyxHEXQ7DU9I1@harry>
 <cf17cfde-cd1a-4217-a09a-1aa86347f830@gmail.com>
 <h7mwe4tr4r233zewdqaoehmmoktaljslgcxvr2qybon2vnxhrz@pbwpt253olkd>
 <64b19c8f-e02e-490b-b987-9a996f36be21@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64b19c8f-e02e-490b-b987-9a996f36be21@gmail.com>
X-ClientProxiedBy: SEWP216CA0024.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::6) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|MW4PR10MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d6f6f9-6cd0-465e-9971-08dd98c5e603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PlIUXs4Cp0mP92dFeRthJxvAdfdWqJv+zJQQ+8d8ogjcmO1nEi47tvEHPMmI?=
 =?us-ascii?Q?aOCGGh2+8xnzCrXyf69WSoeAc/WDbfGCLIM+UtjvDR2/IwHFzjb1ocl4OH1Z?=
 =?us-ascii?Q?2MjU0VSGfo6zLE0ewelPKwuXyt9Q3nIzRiytCkrn+XRH3c/YS58gAqSUNlSA?=
 =?us-ascii?Q?1fSEZupa2gDfy5V+S8FKdhpbZ78Hb7SUe2dUpWFTDA4Ell6EQIT/vliKY90P?=
 =?us-ascii?Q?/Bn3bz8mgDAVvjggO+tCzQxTRrz0t0Y1k28gRjr1tOIHLvAsD/ez/BsAIJTp?=
 =?us-ascii?Q?bqtW+XqIJYzV7z8XVVuuNAUedigjmH4riG/X3Cq8SuWNOuRfJIdymteFuM/q?=
 =?us-ascii?Q?zSYwiVwSNGTZvo/yJzMvqwOf/w0vHmqDPG+XFyaULoUbBFI+tvfGrRcM4ua2?=
 =?us-ascii?Q?HT+0X0cIPNmrL5zYN65WsibH638BfrBnNl+vCESBhDK2VndVlfMHxwRZD25i?=
 =?us-ascii?Q?6DwwFRa9xRlSRW1RsE+61ujggYIKSKVLcbAHuy+lxHzu8Qa0J1L8g/ndPtwl?=
 =?us-ascii?Q?1O7VQ98g/kzIFdPCLiSiWITD/OMzPm1CDnQZWwLhfLYJkEnFIBV6y//mRpjD?=
 =?us-ascii?Q?vcv8FMemO5UsDnx2YCxZlz5YcN/Ac57kussJbMmagMEosRJdEhVqVsH0zEOm?=
 =?us-ascii?Q?KDgmrQOLvvAqTOyuF4aUmS+oSUb87RCxUJ6c6RRvlyh8WkH9fTP2TA4GHBcO?=
 =?us-ascii?Q?tlzBuSoLM9Spp+8Xo3eE+cRg0Bh28mcdrIfkwSPY8nVT0qPRLIFZaHCCpru6?=
 =?us-ascii?Q?0cSb66/UThGiKUX36R4edZKolCS9Qs6UAx4uolNO6mWIoeST+rQAO9fMvWDv?=
 =?us-ascii?Q?esPwaV8tkvZTifCLzzLGfrT47GlRCODjXGkQYX4AIgnXEPyjksddIn83shP9?=
 =?us-ascii?Q?2e1EgVwjZadHs/58TPStm7I4iNRyxrf+95nuEJWnJaHfXKjIJ5X59P/DjOwd?=
 =?us-ascii?Q?RjFbDEdsLwBaCYqJ3N8pZxCtzj0soEw6uXbbmGC2rrbSJUXiYndLnqdoVG6I?=
 =?us-ascii?Q?DJi3hu9nykdZ/iFId3RvFbI7YCtZY0B6DR2D6caDAkFMv4EmOcDsgLc/fi/j?=
 =?us-ascii?Q?95n4AxSqHMU8APoS0q08fXS6UXbYeWZTw6OYD1v9bZWYSUhxxNHiYE6cEIyi?=
 =?us-ascii?Q?/7MnM4+0idj8KZa+DQS+fo0RwxSrpU9wMZK1FUKkF/ug2rTerWDiQiFR0YVA?=
 =?us-ascii?Q?JWgrYXsc4z4gt1SS4Lyw4bUA2cVKkJGBqXffMBqqlDx+RMrrEauRW5PcVTKv?=
 =?us-ascii?Q?nSSQ5YA+NbnaayEfGOgRbYRixRl3fvSyn4bObRicWDF96AqNycCmChlfbAcs?=
 =?us-ascii?Q?9FEyCY9gTXoS65yIjVM6vMGa4t7Rl0ByU+WI45yppW9yX48NADG8vWEWqn1r?=
 =?us-ascii?Q?gkwmJtI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1lqfLagYOVJiHIiK1KdPXP/MfPeQ132OV7csGMqEJO3X3B3pCqLyLuFtRads?=
 =?us-ascii?Q?y/d3Gxt6agnoIaEFFKdW6O6lHzPeZmFPzXqrugT2PZOyX9ttWd3fP8oQ+A9L?=
 =?us-ascii?Q?9yhrhx52/aXGfpXsaQa1WDYe+jWNCfnagVo+0IxgMwOXIjUKFJeVNdNzZiL7?=
 =?us-ascii?Q?/9ld4k2cFybR8jLkKRSGLZKB9Uf++y7IzqGYnXj3N63YDYM6POG307U0nBUy?=
 =?us-ascii?Q?gyrmF/QSqxMhVN9RzOo3ZIR9DeCgnmE0NOfUk5NULiT614wuN2oNZeFgf3Nm?=
 =?us-ascii?Q?AAgrQdbRftsIFWVgy++UVQ9im+LcNdjoCrE27KmyTpUlmYACznWyiQrCfQlW?=
 =?us-ascii?Q?Hs+v1ouHlGs/FxXYmje8VlKKPRd5JkojG0paWpL79G/WY3vn8GPTYxQNrKm1?=
 =?us-ascii?Q?/S0XWCmrjO3gpt4Mfkkfr5hcGvu2PKiqA/S0G5U8b8mJwX66atSMR5YUm0hq?=
 =?us-ascii?Q?iuF2MObjm8TXDZhtqraicIGBcOZoY540O3rGY3fQToFB02TL2XtmjeXVZx1O?=
 =?us-ascii?Q?JgFhLaONiLBbgt3/0Hsbx7dqNuuhgNtgvSmD47Vbs5AvCGwaa2phRvdoZa96?=
 =?us-ascii?Q?dmPU8KjquiZqiEZ9N242FNrp2COmecojk2j0Fk+/Gn7RuE0W3kbmoCDV5hRF?=
 =?us-ascii?Q?aMxh67SjgBta9yhtcotAja09NSRz23ZOyFG9xOefdfn9zsyJJi02QOkMdEw3?=
 =?us-ascii?Q?SyJPOijQYJTYMWhCjzbqCHAIBBxDNH182PkJwRglULRDASAxQJOUubPOpmKT?=
 =?us-ascii?Q?nDjRDmjUBtCrQDsFYu+tGW7gMUOCFnsElTtOH9GfEUC98NjBhJR/dBC93F1O?=
 =?us-ascii?Q?AoXf2qHKykpdFtdIoT2LVWMzpRW7hdPr7Exa7xYFqT2AhYN7gFdXD4nP7Uuq?=
 =?us-ascii?Q?tdZpyw3eV3zEK1bR5wZKsc7MntJOKx6LSmpMAhOAzFFPBQdlLRSdv/gcI+RC?=
 =?us-ascii?Q?+/B4uUbk05fpUj/vd7fSlaYMMqJlX32LOl02fveEskjy2xTbJs1FAsLmSQdP?=
 =?us-ascii?Q?vZSv7nRa6VpkCQP+MA7vyOddbrE10bzBblMeJ8sfjBMkeX3CfVoKze00oN4L?=
 =?us-ascii?Q?FG1llP86zxKI30QUd4xTC4oCjWyEpWM4zWb1iBGXArd56fwG7lFOow6Y+JKT?=
 =?us-ascii?Q?cg+RCWO8G0dDRtYAqBH9Y4czKZ860hU9T1jzYqxCuBj2szmve8VbvwoRpjz9?=
 =?us-ascii?Q?b1o+Fvkk6Tm9HfgbeqhCkciu09Mrq+V3mq2xsyU06+oShcRkoivgZ5SIU6k0?=
 =?us-ascii?Q?bYKB62HnFzuNmzuTo4YYIEF/PRhUohtx4jZ9a7SspSJb9cRzmimP8Kkcjl8Z?=
 =?us-ascii?Q?7lz1AxVPEy+2WgPGdEaFcu8BzV7UyBeIC+EzARPwD8kWAsmygj9UuYCqzf8C?=
 =?us-ascii?Q?95UiwVZMULHj78KGMb98PIz9ISknO0de4QHRV/0u8MHKzahfVlj1DrGx9Cju?=
 =?us-ascii?Q?9q4C4EpHO30XcLlNgQ6/8ywrW/b2sRhvHVLET5wleUGp541c1LXOsqv0G7CK?=
 =?us-ascii?Q?Hqn2Z2FG+nKNEKFp0bKApqoYNrfkydjBRvVwlVdN2L04IdyCpc6zjZKuVX+T?=
 =?us-ascii?Q?DYlbcqtcUAFFj3ckUByplxEosPYUR6D8XATsDO1/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J4alIVFt+ZlQd2UA8Rv6kWCPE8HKCbKYnUT/s0Z/pCwy8L5T9ZNN8Ti0EKiT65sDZyEU7ok1Voy6qdZbHLBUu7lEzrEaM/sQgNPoVIytpGrJDOVgDxsbza8lD3ww6tn3geeVEKOMJxZJI80nSjcxZDvN5jCxDpLBD48vES57minCW7BcRZW2FBxg5VLIq0QnOy1F3ag4Dq83ykaKtEqMvGmFJ1wFLMRimwdUur+envguZhS4iaKr8wPRZHiqbIRq0aL4tIh0/RZGlfu/pDFLLpB3uXr62yCc9IXen1LbFg0WtklV0puNGAj5SNwQkseKJzjtMA2/zdl/Smt04gizOXNUVdtvUfsQ9LM78I7fRjRzNnHW4H5U4IB5Hrx/XTEUMpsTjZIfPAFLGLUWGtqAMOfzuMKa2mukwOrq5p8tz3uw3ew2dOoj4OGKuQYk6sE3YhH5/HbsXeYSWKwQQ5Bgruez+t3lZ/ieUDMbSXm9GDxtt3vpQKPXdOIYf5iSWOP8jiGP5Rn2G513PpIm6XSHhV/XGzKgIH28UKjVFaPZ8WsGuBHsZmxcjUambhXacziTwHsWhO8V0HNQMi4L+SeK1T0kPs4TuOgGd13TvRFFU4U=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d6f6f9-6cd0-465e-9971-08dd98c5e603
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 00:16:29.3130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plBWI2yNaEIoIuNcySQ4pNOmr6bns51gzqbliBGwl0/rfLPrmxoPI0r9au+8yhQvz9pETbAuOFqX5aV8zW73Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6420
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505220000
X-Proofpoint-GUID: BLYK0N_ZzMNgSTtkoGBBT3dRmgnZsRUI
X-Authority-Analysis: v=2.4 cv=J7Oq7BnS c=1 sm=1 tr=0 ts=682e6ce1 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=XQlw0bG4LyJ22NpWWAEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: BLYK0N_ZzMNgSTtkoGBBT3dRmgnZsRUI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAwMSBTYWx0ZWRfX6O0DM+/oZTFc lG6RD4JB4p9tzpqeIM2rPSUIWFo7MdFtAv8Lyzqqy6ckDzpFCeI/R6UODePlDLEhEEfShBDZWyo xu2gbYT1LUQI3cyou1/34jqNO5QaHKqH3Vxhz2jyoDq20FXiGax25L7xKz/tsdZZIcIydATL/sX
 c3ultBlbafaVLK88XWrh+kUQGdXsF+xf09SzQeN3KcVzRl+3/v73SOI5tOzdRKu+K0cUZ70JnNe eBS6i2btWnnA+1l9q2wnOPPWyzWNVpLwIIrRm3COBjyE86r0iAnqFi/QxQNgRq/lTW+luXuNRZ/ Tak00B0BGxbycngiTlIYhiyQVrUKLboSnXwT5SdCuMtv/gjKAL4M4SYygsZf5qw6hmYXIa+JfLs
 QS5AfM20ivrZ+gid/gQCh/xNUZygP4d3B9giFy1KyI5oPF1zBn/GvTTnn5uGxcQlqekI9wat

On Tue, May 20, 2025 at 04:22:16PM +0100, Usama Arif wrote:
> 
> 
> On 20/05/2025 15:18, Shakeel Butt wrote:
> > On Tue, May 20, 2025 at 02:42:09PM +0100, Usama Arif wrote:
> >>
> >>
> >> On 20/05/2025 14:34, Harry Yoo wrote:
> >>> On Tue, May 20, 2025 at 01:25:47PM +0100, Usama Arif wrote:
> >>>> In memory bound systems, a large number of warnings for failing this
> >>>> allocation repeatedly may mask any real issues in the system
> >>>> during memory pressure being reported in dmesg. Change this to
> >>>> WARN_ONCE.
> >>>>
> >>>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >>>> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> >>>> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@gmail.com/
> >>>> ---
> >>>
> >>> Hi,
> >>>
> >>> Please Cc SLAB ALLOCATOR folks in MAINTAINERS on patches that touch
> >>> slab code ;)
> >>>
> >>
> >> Thanks for adding them to CC! I was just thinking of this as a memory
> >> allocation profiling issue and added the maintainers for it,
> >> but should have added slab maintainers as well.
> >>
> >>
> >>>>  mm/slub.c | 2 +-
> >>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/mm/slub.c b/mm/slub.c
> >>>> index bf43c403ead2..97cb3d9e8d00 100644
> >>>> --- a/mm/slub.c
> >>>> +++ b/mm/slub.c
> >>>> @@ -2102,7 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
> >>>>  
> >>>>  	slab = virt_to_slab(p);
> >>>>  	if (!slab_obj_exts(slab) &&
> >>>> -	    WARN(alloc_slab_obj_exts(slab, s, flags, false),
> >>>> +	    WARN_ONCE(alloc_slab_obj_exts(slab, s, flags, false),
> >>>>  		 "%s, %s: Failed to create slab extension vector!\n",
> >>>>  		 __func__, s->name))
> >>>
> >>> I think this should be pr_warn_once()?
> >>> I'm not sure why this was WARN() in the first place.
> >>>
> >>
> >> Isn't WARN_ONCE the same as pr_warn_once but with needing the condition
> >> of the first arg to be true? We only want to warn if alloc_slab_obj_exts
> >> returns non-zero. So WARN_ONCE should be ok?
> >>
> > 
> > The difference is the impact on panic_on_warn users which are mostly
> > testing bots. This warning is not actionable, so I agree with Harry to
> > covert this to pr_warn_once().
> > 
> 
> Sounds good! Will change it to below for the next revision.
> Will wait for the kvmalloc conversation to conclude before sending
> the next revision.
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index 08804d2f2ead..ab0b7ee87159 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2101,11 +2101,13 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gfp_t flags, void *p)
>                 return NULL;
>  
>         slab = virt_to_slab(p);
> -       if (!slab_obj_exts(slab) &&
> -           WARN(alloc_slab_obj_exts(slab, s, flags, false),
> -                "%s, %s: Failed to create slab extension vector!\n",
> -                __func__, s->name))
> -               return NULL;
> +       if (!slab_obj_exts(slab)) {
> +               if(alloc_slab_obj_exts(slab, s, flags, false))
> +                       pr_warn_once("%s, %s: Failed to create slab extension vector!\n",
> +                               __func__, s->name);
> +               else
> +                       return NULL;

Returning NULL when alloc_slab_obj_exts() succeeds doesn't make sense.
I think you meant something like this?

if (!slab_obj_exts(slab) &&
    alloc_slab_obj_exts(slab, s, flags, false)) {
	pr_warn_once("%s, %s: Failed to create slab extension vector!\n",
		__func__, s->name);
	return NULL;
}

> +       }
>  
>         return slab_obj_exts(slab) + obj_to_index(s, slab, p);
>  }
> 

-- 
Cheers,
Harry / Hyeonggon
