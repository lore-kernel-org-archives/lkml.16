Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5691EA7CC
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748407851; cv=fail; b=So9PmtdZsPWSqk94RH8wlrZjqWSxfMm7lJ7QL9aNvsRZw7dSNYh45VDv8jRw7BiK979F/L8NGfRkkfO/mjszDtlRDSG1GWhAcXD0O86dgfVrfVDwB5kvn0libgn6Kqj2/+Q8W2Dp0HO9CfDoIvz91V+C4liJ2F+mE/GfS6G4hy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748407851; c=relaxed/simple;
	bh=wZEGu2yUjo2dpMw3V4CRv3x4AH345MJJrP0pOXYTdEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FcXdDbavjmkQZxFtOm87AeETqgQqIN5jdpTTR9k4IDA33cqmdP3sAOTOmWYgiSZ/iIFupI7+nqnoRILBIU2SycqKvCZ5JQDzjyPklV9lwjw5/3O+V5Hn23hsCTKSe4TlDOxZQ693KslXmVM1LVz2E7+dNZQOoCz6PYitKt9bPIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g51ZFaLc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sVGbw6iT; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g51ZFaLc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sVGbw6iT"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1gdLZ028427;
	Wed, 28 May 2025 04:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=wZEGu2yUjo2dpMw3V4
	CRv3x4AH345MJJrP0pOXYTdEE=; b=g51ZFaLcNEXZVyGL5Phv0cgdqXVj0JMW2n
	Pn7E+1qotKOujNJPgdEgbVSr7x1d0GcV0LTaNAVBwaUMR3AwRcNbktCJmEQWaFdg
	lG3oPcZfKk0WgAFXaahPzL1tNtz6ftItJLHAmKa4cxV8lMHQOXkEJCU2AmCeeqqT
	U6lxprX/GRzaGjU6jdhT1XwGUO9RBIboFkB9tz4MqrHPAL1JB1FrmVJUGQOjR5ZF
	OkvbMPCBMy7LNiimsGTRDA44G5VjhqRoLcMdb175LdPGO4e9Qi3nnf/pDksmOElF
	RyKPU09iIzDgWZi+HHat5THvNTrmnBAjHqYyv+AvlBGkAdZFgGWQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v33mw0ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 04:50:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54S2s2jO021137;
	Wed, 28 May 2025 04:49:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jge5ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 04:49:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uc6M3KpEoJhhW9qhbGZZ2ZFgnwNVfsdGRAQTx5UZyWWjThtXUc2u+lETjxST3Qf43266omDfBzKk9mTM0VWJfs+nLKLfsklF/uZ45mQMOXddTRy7r2+frU704y0fHTXlr7ykG8Q7yClNUNCAMVcdbIugeVkvU+0ns8ru91+JGLooYa9MEfV9ByLpneO+F1+Ih5aeR9RZ8vn+Pok0mnHnonajp6ITzh+lymR9B/vc+ihBJg0vmlaha7pVNffRHbatPb+xqHoMWWyn/8loTyVxp34y8AcjWg6Qnuto8E8h+Q2DBc1MCGmTR85TukbmvQuyNLQF5fZX/AefNBlSfNE/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wZEGu2yUjo2dpMw3V4CRv3x4AH345MJJrP0pOXYTdEE=;
 b=lPcDvgBIbIOxKFtrLjgIutVyWQco0NRnXI/mbBkA2P1dlz+bkHUmCKCfOKiE2fFvj4FoQgbOI8i8AnmklKkUfDRBdIZjJf8fw8LgiS47Hstf9Tph40mAn3T1AtTkavLsqijdkvfgtcL4wfut6m7vGbBkewtF9/+LXhocNMhF+XFF696AJQKsqqPUpGMJ/HI609OD0X0Sv7f/D8HnqSilpuUkcZl8CIps/F/kCZjVN15tKu1szX2XSE5egInoIFvpH1EMOzhpKJ8oL+tNsZgRUDEgo/+rF4pqs2yzJaZiZsx5FhgafILH00xxZ+0zCrsLFCmStKINhj3WpVwODtoUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZEGu2yUjo2dpMw3V4CRv3x4AH345MJJrP0pOXYTdEE=;
 b=sVGbw6iTQt3Ei6ItinJQTz086uTov8cwC5XoL6xbFBxAOB45mp4ghlf3KMy8rUdftKM3s+22XXXg1tsHvNPx5l++QDi+5DDFuw9LIMJzYr/kdIKNZurT/NcROcYFiwyf0zYtcoLkZ+Afs5xSrasLLJWbtEM4nOjawJ55x7SpQCI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB4966.namprd10.prod.outlook.com (2603:10b6:408:128::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Wed, 28 May
 2025 04:49:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 04:49:55 +0000
Date: Wed, 28 May 2025 05:49:50 +0100
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
Subject: Re: [PATCH v3 2/2] mm: Optimize mremap() by PTE batching
Message-ID: <53a39d5f-6ea2-403f-8837-fb00d7f8d6b8@lucifer.local>
References: <20250527075049.60215-1-dev.jain@arm.com>
 <20250527075049.60215-3-dev.jain@arm.com>
 <3d5d5813-7764-4667-937f-cec52f8b03c9@lucifer.local>
 <422a63ea-9211-4e4b-a37c-8d4c5e964b53@arm.com>
 <888a8314-b200-40b7-ab52-f30f0af93374@lucifer.local>
 <8ef715e7-76a2-4004-ac10-3cc10912c67d@arm.com>
 <67cf2131-da6b-4a1d-828e-52f0ff7fd0fb@lucifer.local>
 <170036fa-727c-4d2b-8ed4-0a1b6e4cf8d3@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170036fa-727c-4d2b-8ed4-0a1b6e4cf8d3@arm.com>
X-ClientProxiedBy: LO2P265CA0449.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::29) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e283220-502a-4992-24aa-08dd9da3177b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vMQG+VVIwXq4tcSt9dz/l/nigMxsyb12rtneLQ/CS5d1m2MQG0br/gl3Wsvo?=
 =?us-ascii?Q?xINPJPU0z2ZS5UQoYeQ2eUnu3SHskRMqRQV7tI+U1+8DoAZgGJjEa7A/xPBZ?=
 =?us-ascii?Q?bgZqSwuLMU7xxl5p1zdsv2zcWMi7KKnR6Xp3MV5q6ghW2C0By5HL+e3UP+eB?=
 =?us-ascii?Q?Vn/p4IawLw9IfVHqZEMvUfDiDl8pAnlw+CoRyNpTNEqNLikUlwdqceAvWXA7?=
 =?us-ascii?Q?0P6NOd33tbFBijGaP24FVHvErJ4mYqH8mZLXyDBcDwnnAk1lSMTWhuRVjbQx?=
 =?us-ascii?Q?hAi59ci2TUpFJj4YJmhLxBmSx4x7zy+YoiF0xzKov9A+FwzvhjHAokT1ztSj?=
 =?us-ascii?Q?3DX3R8nqg0LlajzkZMHYhlFy3Jr4YXdXFzFBQV/eFgc2qJxuxZjcbez07bR6?=
 =?us-ascii?Q?GovsRNalu9fWt8Xk1O/Tvx4g/YbniDftha/06M6m0kTn73T7jxJTCkHNIj+S?=
 =?us-ascii?Q?voCihSIb56cXUI6eRt52VvmZzMDtSfjfMfq7w5kil25gMPosUMTsSsrwcrhs?=
 =?us-ascii?Q?zC1skuQ/2BCjD55jgdSj+htx9OOeBHhrkrIvl99Fxpg64OtB5Vh9ILieC05g?=
 =?us-ascii?Q?4LaF9fKqvcOnXOolOUqpQ4hXj4hcFJ/ZJIYPkeD9A9+hf+omqP7xRuqf/emy?=
 =?us-ascii?Q?+fXON5t/AQtrvS2DbYdwzxHQsA6WU25bDNCmIrf/JI5mYmU4OKChJ2I2yYKH?=
 =?us-ascii?Q?5yMJIHW2Kv0p+beD1br+7lP9Tum3waMM3mIDwd3wYl2Emevfwrb0yU6G41N+?=
 =?us-ascii?Q?vGkJ9u6u2M3DGPfgWgeSIVsXeKs2wixN1F+leaZttVg9AheYzcszIoYNxplF?=
 =?us-ascii?Q?sx5e/53tJH+anpm6BjogCSyT6Gyr1J4ipcUC+uWOcE1u5y45INLT7VYdAzS8?=
 =?us-ascii?Q?+PazOlKAPwQ3WTLpeK+6MrvrlN2B5r4xbVGWB5zyF3hznWoXr4amlPwpUtoV?=
 =?us-ascii?Q?Uz4HuOjbanN3mtdVEhBGOcVw1AZQ8EyG+of8AnmuIxo48ZBpKsQjDRVHw/91?=
 =?us-ascii?Q?3j2C1E2cYsX/oCCZIw+KivYyUaePZv5vCIywGW9UDISeF42sFF8w2WWkyxaC?=
 =?us-ascii?Q?UOW6NuIIjje2sdnbjtlOII7WBopVvzXtBtTXwsYfPSZAEEYODTkBAvnJ6ApR?=
 =?us-ascii?Q?3Y7fD+v59Pf2TFJMqgAgMI9IwhEoc2+MOQdQlhWndtQYLSGu6CM4r3w6TuJz?=
 =?us-ascii?Q?e1MmP9vxGnZXRg57bU16DcU1D8cgSkMjnqDkofbRuEt9CvzRQKtck3zy7q2O?=
 =?us-ascii?Q?hRmGJKs0oZiDBu27GRA5mZuv9OenonoDIE3chDhb7B3tBkgs9cnoUbgeeOOR?=
 =?us-ascii?Q?pn7k9IoaGxZHwn6wtcR4EVifm3JWPRk88sBXo0yWaQm2m6LG6Q8OezaRa2LB?=
 =?us-ascii?Q?pKOtPfDZeQVNRKlU/Fmv7fbiCwWysfD6/RdGNzvPD3Net3hewWSmYeSgvjm9?=
 =?us-ascii?Q?M7KIb12ZhQA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OoFbzmZF7yTI0sZ12oR3GXafl2xH/pGBOOFB48NBoEC0Y1+1BbjTefjLqQui?=
 =?us-ascii?Q?aS+JvrWROM5qtTX5LqvjsLM7/waY8BWZ5C92D7SOUvtq0pYqcOZjZFzU9gHv?=
 =?us-ascii?Q?zNpXghwXG68+kmOBJtHP+mNMdTar5e/hkJH8A8bGZrOzfdgdqIddaOyVnz01?=
 =?us-ascii?Q?XA59kBk4qutIO4kPcmOuQzJRKDDQHylreFMeq/NzRwF3x1lrSONfGef2zNwT?=
 =?us-ascii?Q?WGPZaroKz/2MtQSHeHBC5rwMJCYSQ3tneZa5V1DFSQlvfSG2WiVnvxpGgzkx?=
 =?us-ascii?Q?YZJ9X54hvQ26JSal9FshVX06sychfHdZwTsvN0owlosnETFythnOqOHrxUIS?=
 =?us-ascii?Q?Odh8QSHftuABWam5j0tt9E0wRyKlFhoC9HOVaDfjVGpc+mheng1NT0Tl49n/?=
 =?us-ascii?Q?OqzrWb2XJ67L1gLablMlopWbgKVm/GQYTA65Rrz/mQabC7QUv5xhHcfUxgFD?=
 =?us-ascii?Q?sGpAMIZsAL7Ut2cWpgsbKHB0yzjxVSFVDUYItOY+bffDyhaCSRL3Nn209Nb8?=
 =?us-ascii?Q?NIbGB6t3kmjinFF0E+Rc5dgz4caSudzNZ+La31OkQk9+gIdAoZXIAQmXqsME?=
 =?us-ascii?Q?fseXPhou4mcomTjJX7KdcnPvGGrFx8tX3nR8OFIlrOYAyWCvtIaZvlf/hFVc?=
 =?us-ascii?Q?MVvnSFMg0p6iEx2JgQqNvtxKs8p05g9kEaazFdKg43EUPOG1W/ZVALotVDAM?=
 =?us-ascii?Q?cFpxzABtWsN3Yb1XMrhO5Mf3oeztdPaVrLVxQmgjOFS/avBVsBY6o4DXBP9Z?=
 =?us-ascii?Q?zyWvMahsqQlvR9vsYZo2WVQTd3Y55IYh6G0k1J06hzvv9XHrmcCRCQsRjC8J?=
 =?us-ascii?Q?fId6+BYfrLmYzGKD05nY3c0LoiuYNuY1AV3yLAgoCFrRkXYRjucVaXWL5J4S?=
 =?us-ascii?Q?gLJ3eV88e6AuBWJhrQjK0LmtxBKUZLodT2zZpjzXrwri092ItZF8lWNBSLUn?=
 =?us-ascii?Q?h6KzMt7iFBjhaS6t/Ezg9VrpphnQgBJFPh3BcX4OktQs/cb6QEm88tCZhCEX?=
 =?us-ascii?Q?X45joUs+9d2yoKHsh5RA6YkosTvfrs9WARa4a16mZjy94IM10LrvCvWzBccT?=
 =?us-ascii?Q?8MOrYGvOO7tsvRb8nwnoLwlm4yV91r3RZwL8xbnmDEnk/S8Q9Em4QklFnoGF?=
 =?us-ascii?Q?gdvB47ZUzYvCkWCtW1Calbm35CwQtszaolQwFsJmkfaxDr6vH8FejYQbgwva?=
 =?us-ascii?Q?AZ9VXHXu1mlIzvPXwLEAhUb7DMDIqNbEG1p4hoAr3qiE8s1n6ZKYZ0B6Td+o?=
 =?us-ascii?Q?eYxEQ3dRCVKEAs0MMdCKqN8nnYpnbiSI6S75rCAAt7w6pKbtIGWPWHunR/d3?=
 =?us-ascii?Q?cr5VIbREAAf7I+Ax1ElkxW7HR1xY4pbXhC+MbmYTWa8qC3+xFF3ebPStbXt/?=
 =?us-ascii?Q?zmVUNaa4B+5IUEeRJ2fwBYC8xPG6vSOVzc8vE/LsTCTRNNTomZi6KVPblhdK?=
 =?us-ascii?Q?hXo2HrkDB8nHSTUOtYvVV0rAMJtAKlfByLwgvk8ANSq9TLrhMIpQ2qp4eg4n?=
 =?us-ascii?Q?cMqMKjz0mYDp/sCxUEjkjQDQTPf7YFlQUZ0fOY/SU1P3MRwOZ5E4yG02OSrd?=
 =?us-ascii?Q?FvUNsOKzZqkpKwrgAelqTCj8IZrEfduvc4dOcT6txkTgC7cRBwejZx2lD1gn?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4TUdJsyfoPHoY6GQqOJTZlEGT166fCj2PwJDTWDbwcj5coxQSMJTdkO0JOJWDEPMV23ywEh9pQf7JyzaLj6c4PJcKMhpbBGMU7DxhS39sn7UVfNw/G+4by3yzobbVz0FIAv20iZuibW7pa1hYswjHLj/0zJhCKYZF2NUsXE3DD3EmsRiTnsJeq0992Yrv98vp92E2RAUg4Hl0KdTKfAsg6TAe7u0N44VOXgTUb+sWOZXd2LPoQhjtcoPOQk+EgiqgPOetBw2pojoraONnnJN/Z5b8SFHCwoCz70wroD2jEDa6TVFJgw1qf5DVqlMYZ1+wUfziiypccmBZXOWMedpEUfJfGAYLS1EXlrHHp64y39GSTOLszt9/s9msO35bis3zJTvrjw1H7K0lV86K5cNpYjMQ66MfAWHjMkiRnonJgdSNrRl/F5uhCxoqPJ4FUDCgaNsWdwhN3Z6vyBnKxZrdkgahhZju+de/6FpJfhsO28++aKlfYoY1xEywfMT7j6Pddugs25sozHpEZkUwfKcq4RDDeBgztTYPfFCte5i84PJa4DwU0fXpVU6KMiHD1AZ0xT7cigQ7EguowKMsmXLagDYw6lbUOmOyMkD8FsLCG4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e283220-502a-4992-24aa-08dd9da3177b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 04:49:55.6614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FSrmXrNxY8M5gGrHcU1llJ8islRNoFdXsrspuNfWDtRi+K262QB/LqjwhguL1n4gmb5TfL10hsbz2OvKR0Ip4+TzDnB6AuMZnRpMW1AsXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4966
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_02,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=839 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505280040
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA0MCBTYWx0ZWRfX9dMwykqZK55V ZKtPwW31FIbJTs+XcYu93HdVp5+Sa3Zr4bSkSZgQpESDzZK2SHZXOpjc0Wz9pzTc2vzttZdzyDB /2Jqsv53y02A14nU6GI8cIgNnvaCv96N1wFALyAMAJwAi+Ed/2WZLFFXP/a/0D2j0D0COS3UkBi
 gX7AVl8kL3BAc3SJBzZ9NJmETw5UI1wdxqImaP4hEu+MsM1Pn5ZmXHMpvJfu1t16DGIwHuzPafY tzUKQ1BpFIZg9ysSjynzvW+zpgoJJXrMzfnXIcVIF/U8KFLqcY3cJWMGix95gC+1CQKT0cx/06t eDNy+KtH+EJq4A9U3pxXWQMtlXkDpe8Z5YL0HQZpztpKpAfRnck14ijUjfk5e0+MM2OrMXMSD8g
 fvBR4aHrWUi2p6dDuaBxx5DtAuqi7mBnfM4AwYlUFaUm9jjCYWr+TMO9xFU8j0zSnxHNf+b+
X-Proofpoint-GUID: T5F4kaHQwPiZUFUUffgVF1AvMDnAKVyH
X-Authority-Analysis: v=2.4 cv=aO/wqa9m c=1 sm=1 tr=0 ts=683695f9 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=nNE7-98fUM3dEvZ1SeEA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: T5F4kaHQwPiZUFUUffgVF1AvMDnAKVyH

On Wed, May 28, 2025 at 09:02:26AM +0530, Dev Jain wrote:
>
> On 27/05/25 10:16 pm, Lorenzo Stoakes wrote:
> > On Tue, May 27, 2025 at 10:08:59PM +0530, Dev Jain wrote:
> > > On 27/05/25 9:59 pm, Lorenzo Stoakes wrote:
> > [snip]
> > > > If I invoke split_huge_pmd(), I end up with a bunch of PTEs mapping the same
> > > > large folio. The folio itself is not split, so nr_ptes surely will be equal to
> > > > something >1 here right?
> > >
> > > Thanks for elaborating.
> > >
> > > So,
> > >
> > > Case 1: folio splitting => nr_ptes = 1 => the question of a/d bit smearing
> > > disappears.
> > >
> > > Case 2: page table splitting => consec PTEs point to the same large folio
> > > => nr_ptes > 1 => get_and_clear_full_ptes() will smear a/d bits on the
> > > new ptes, which is correct because we are still pointing to the same large
> > > folio.
> > >
> > OK awesome, I thought as much, just wanted to make sure :) we are good then.
> >
> > The accessed/dirty bits really matter at a folio granularity (and especially
> > with respect to reclaim/writeback which both operate at folio level) so the
> > smearing as you say is fine.
> >
> > This patch therefore looks fine, only the trivial comment fixup.
> >
> > I ran the series on my x86-64 setup (fwiw) with no build/mm selftest errors.
>
> Thanks!
>
>
> >
> > Sorry to be a pain but could you respin with the commit message for this patch
> > updated to explicitly mention that the logic applies for the non-contPTE split
> > PTE case (and therefore also helps performance there)? That and the trivial
> > thing of dropping that comment.
>
> What do you mean by the non-contpte case? In that case the PTEs do not point
> to the same folio or are misaligned, and there will be no optimization. This

Split page table large folio.

> patch is optimizing two things: 1) ptep_get() READ_ONCE accesses 2) reduction
> in number of TLBIs for contig blocks, both of which happen in the contpte case.
>

But it impacts split huge pages. Your code changes this behaviour. We need to
make this clear :)

> In general, the patch should have a minor improvement on other arches because
> we are detecting a batch and processing it together, thus saving on a few
> function calls, but the main benefit is for arm64.

Ack, but you are changing this behaviour. The commit message doesn't make this
clear and seems to imply this only impacts contPTE cases. Or at least isn't
clear enough

A simple additional paragraph like:

'Transparent huge pages which have been split into PTEs will also be impacted,
however the performance gain in this case is expected to be modest'

Will sort this out.

Thanks!

>
> >
> > Then we should be good for a tag unless somebody else spots something
> > egregious :)
> >
> > Thanks for this! Good improvement.
> >
> > [snip]
> >
> > Cheers, Lorenzo
