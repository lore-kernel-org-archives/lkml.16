Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FB41DCB09
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771903; cv=fail; b=HaFLnqcootdcPZ3zEDpXfi8qA0bf56y9KAga9bmnX+K7h3HZlhcjErmYW9QQWKj8gK3At3Yt/HkXFXXnUyPUcZ/1DMWTqibjd+uJuh3QlTBv6rgeS2himbnlhismrjrffCCwGXcep0Sz1iIFxFB/MXDw1AZnsRzp/2O+uaQAkw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771903; c=relaxed/simple;
	bh=Yw8eO9ZjhW3JsYIuOROYBvSBv3fpP8cnQBfOftCDtCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pgqZLM2XQp0vukMF60TOBEu/ghEu9kvREStf6QpRhhijqy5BTz02acqFB36Pa1XSENzY3ceAZN3/3+i9e+5Gdi9n1B8/I8i7GPBiqfy8fgtJCRqoZnFRRwlHF2nbL2ttthy/R9po9n6QiBJYbAHNNe0ao+GXLrhiLe6bOqce51E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oltsESeU; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=REbH4jzR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oltsESeU";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="REbH4jzR"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534Cg6e3005586;
	Fri, 4 Apr 2025 13:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=donaI6Du5P4olU8PqK
	1Bc7mq36axe45eE6KH+Zlx2RM=; b=oltsESeUW44h/v7ADtYF1SFCxfPbNwn4PD
	VhfswwhFJcxDBS0bypoAj7aItUe4bjMMewALodj7uU/AC8xa4qzvBILQarK0oRKt
	HRZzxvRJs80k7Zd3C9EPkA7XRWx68A85h/6ihemNA45U/ZyuA4/6sMyiO0mHX3B8
	DC0XdSZNIG1E7VVmBMVLsRw8JdxW/2n4U2kpayI4+hTEFAEJPydEeHkLiVghpP3C
	JSiMt2g/zA+oTzQ9/ayVuHXr65pQdem5OnMoDyQZxA2gZfjKWptf1Cbcb5p88Ano
	3uyQNUilmTXGYmZIEtwPyu0Wgj68Qg0kbILp61NaZTAVHhlhkn1w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7saxyqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Apr 2025 13:04:15 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 534BYTBt024190;
	Fri, 4 Apr 2025 13:04:15 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45t339qta1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Apr 2025 13:04:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQ6K/az284s5MVmgV0cAeZFktKIujkLHq3VZXjva0xF0sSjRc66pXe/DfJtb7RPH0YdB/t6MiYzQstvBKuwQHZkN+96E247rbzYAufjoHjCfWneQVQSAcOfbvuKEwrZ9Ig7uVNenURyJS4YVS+SD9FIoKj9dbQeoCfZJuZGVXvg5OYwzsGiPftp0eT3HMs/ZUxpzV1UB++O2fE58B1sJtJKCwbLac1/y2kG3/mnlbvLGg8va7fbkEnEDrE4tnFCCNtY8KaUw/N2pAfgHKgNv0J6JAP+YDwXlx/MAwovl9b6zTzQZ0PbEN/e1rTxyuhTcopLqQL9G0AuxzFyFC0YcpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=donaI6Du5P4olU8PqK1Bc7mq36axe45eE6KH+Zlx2RM=;
 b=JTkvgu6luD2sqOFXDeithOxYeUhUIb71Ky8UL7lLzd+AaUrvaO4mKfSl/0p7/VHSg/vwCbDstjhQG56JAvE1B4yWHhl63sGmoxEGFTZ18hlwOxPhhOwavsakTi1umf933L5iKtYTVlZBAMoE7Ew+b3Q8gmjpXBLongMqhve9V+kpW6ASj1Oc09tl7BHUQEsAgkPc+FiGkeZ8WkaNZtNxJqkc+HLjH6F39npO8m6j1RXpuQ1RBM3UWjAbquLbYRiUWRcQ92pPbshYtcfRXbEEN/sRgpLzMADh1NZxzc1kHNHEGN2iqklWufl7qUqDckk6HP1eqd8zcNBuspKounkFyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=donaI6Du5P4olU8PqK1Bc7mq36axe45eE6KH+Zlx2RM=;
 b=REbH4jzREoezu5vupUA/Xn39uM0XaZSOw2ArZ5tdkXEOh72+uuEjd9aLTjQNbMlDPy08zt3FYdX6uXL3Om+lcxayPODxiHoENqasSO71Jkh1KGiHCOEdNWuX3fAF77DH2vSt9t4NRGkvjGDCboxtFcsypN2TTtAThS/lHqlY6pM=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by DS0PR10MB7512.namprd10.prod.outlook.com (2603:10b6:8:165::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 13:04:12 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 13:04:12 +0000
Date: Fri, 4 Apr 2025 14:04:10 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mm/vma: fix incorrectly disallowed anonymous VMA
 merges
Message-ID: <2fcd2760-0116-491e-add2-c3277d5bb19b@lucifer.local>
References: <cover.1742245056.git.lorenzo.stoakes@oracle.com>
 <ab86a655c18cf9feb031a9b08b74812dcb432221.1742245056.git.lorenzo.stoakes@oracle.com>
 <20250404125315.5bou5ays7u7sv4rb@master>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404125315.5bou5ays7u7sv4rb@master>
X-ClientProxiedBy: LO4P123CA0365.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::10) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|DS0PR10MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f688018-a86f-4f34-7334-08dd737931c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?onPHNn3dqpKLHzNm3PPC+9lBwHhk1d03BIRtpCsenrXsOQsXP3pZHaq+9fxz?=
 =?us-ascii?Q?DckoqrwhOIdcT6c07qnaMl5j+asZgx2ZCFpn1tdpQYWfCOzAtxGsUKCXvMiA?=
 =?us-ascii?Q?aWr8N3iOv4588Ah4uopyijg1bxTEg0whd62+8Bgtwcfi/MYXSWGHwF1fNn4x?=
 =?us-ascii?Q?2K4fyxL9E00f2QSaszJJDhFWSYZLeFxm8PsrAHqrLGa0AOYVYnhPW5uGcPzF?=
 =?us-ascii?Q?BWroci0TpSztJrBCFBSLj+pVYVLzsN9RepdQbKkmjc8E3cmOpBj5eUGBSix/?=
 =?us-ascii?Q?20pD+jDRxfDifP0yathi2Ugp64omP833VdranwPp/YukxtcM/zaSpD5LXHG0?=
 =?us-ascii?Q?LAffHgw/qkSJhQa2QJyP54/yHvrMM6FMa3lU0bdUy8lCaiRA8mQXy6L221VI?=
 =?us-ascii?Q?fxEdwib2V/dwJx2i91dZlDHxyl4YVzmw4R5mptxw0neJHZbmwi1hJpuxQUtC?=
 =?us-ascii?Q?9S6iHTq9ybJ8QpCK8k/RHA30hGEIAcvP+VffkmphNwzBOxEClzi0LyQKjPjV?=
 =?us-ascii?Q?MMfGMMUUg0m/XtV9R7CYsTGr/+VEVYjH/s9avFbab6ki/JBgw5q1xzaA9FtD?=
 =?us-ascii?Q?QO3281ZYFg//31gdo/6orCjqTf0dTXmk5vBfTGeh5tBziAcJeML+BAiffVgu?=
 =?us-ascii?Q?x3v2/o3udijAVKgyAmbl7rjKkzqKOy5RR+DAxpwOvNXWL/wTf6pzLQgUqY7U?=
 =?us-ascii?Q?wx7WmS0yw6nBMSlVzpb8kQm+m23KW+2Rt1OkNd/OxO1fpraSyulx6GHorC6o?=
 =?us-ascii?Q?1Fv4Rh3gXdSrojEZYYCdU/sN0WowW5AYljFtAKxzFTizKa8BcUXaR8kyJrBF?=
 =?us-ascii?Q?U3rXB7UyGNBRKPYEA3V9y/STICSdheKAxCYEqptbDA53Gy4F3kNH/C5RUmSn?=
 =?us-ascii?Q?MVgefbW4P4e3naos+9mElecHmr/lVk2LIP5dtJzfBXoFgXvUmWKVWKB7i4xv?=
 =?us-ascii?Q?Shrf6EkkdcHF99KX/BKSkf/08GtapaeHeumSArLAIgsxpFkDjQhwQngyJDc3?=
 =?us-ascii?Q?iTo1K5Y01rniKywbhzivt6xYoJqsAQ8icDtpilGqjsDxqt3UCkszArDnLQEZ?=
 =?us-ascii?Q?UYz2xbn862qzpDrE/GtGD+Q+mVsadnLoHziyyaXexKgqY4noTzd96p/yymFb?=
 =?us-ascii?Q?vXlstuffTNoHW57slv7g0nXt/ga0TvM26JYblPE+mU5O1GsHacOjC4KKi2ZK?=
 =?us-ascii?Q?u/YGipKDJaFrB8tzo3gxeDs+cFrDeoKwALhbjBZZzuER0A5n8cLAzoMeBBGl?=
 =?us-ascii?Q?OcO8g+7n4Yr6dMcA6jAwCZP+NH8F3KDiSf9Kro0zT44ua40Iy0nPtgIdeq7v?=
 =?us-ascii?Q?iH08bRLuyVhuiqrELo1FIqX+jKamWVPjspMMthQCHToQ0P8jX1dKHzXB0Umq?=
 =?us-ascii?Q?PMF9PyIbLtPSmWUZLkFjxjcHDVy7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CqRreIuY0F35/HzOiO7zOlTyxkJ8D20wECCsnkQL5osmpL5qG2vW+T1noimQ?=
 =?us-ascii?Q?+U16BTJUgHCIt+d7diLlNQnLQv9Cgw5VjwnqF3PiewF1yw95JfRPGyp9YtRc?=
 =?us-ascii?Q?EdYkHsw6XNx2fiZuocVFySE5JF/eezfx4926u0CNtx5hnC3cLLSJ1wyTkQO/?=
 =?us-ascii?Q?wfoQTJdTipuXHe0GP0qVgG7tcQySKay/8gzrDb3kqpv0noFxLsHp1QETq9YB?=
 =?us-ascii?Q?zEnCqe+1/tBRGg70eOxZrW0KleN1bwfUlqwRhYR2FnARDwxWjp/nS4FO3SSg?=
 =?us-ascii?Q?Nkl/68hyemFyrW7pk0xIQanYFCBD11dfPLPzcjRfqUseyJJUx4F29b1a9v7/?=
 =?us-ascii?Q?M95a0sS31oxdkumw0BEXGi2M6huRrxTv1GBBT3j/DTv/o+GGLhxXbKsQ/f0J?=
 =?us-ascii?Q?lnVZC538lh8dKuwDHcux+GgaF06DBNf/GFU3eLFlyhXUdaI9V+jJB9N0VEND?=
 =?us-ascii?Q?dHjg3Guf9ypTRhkX279xIbdadEszIMrZFWT3NVKkyS1eajZO2cc1S0jGQxBU?=
 =?us-ascii?Q?ypFVRw9/ANkKwqO2ojot147HCcm8Ti9ih1jwHTMXqJaFs/LOrdT/nOB6cKMj?=
 =?us-ascii?Q?3ewxDOGf+0syQoNoP6kdy/XS2PPok18gBgXg7sLfVmXJnEsXGJATjjuESssf?=
 =?us-ascii?Q?LJXctNgqYE3YpQCGCXj0uy7sssAMTYPVz+9B//7QxmF3qgtekbiYu6eiWWeL?=
 =?us-ascii?Q?26n0/ZBJ3enIdD3/pCmGHhS6u+OAZ67JMAb9xs/66BdTfH4C86xEAwTsABxh?=
 =?us-ascii?Q?qW6JL9BJSDWtX4D9Za8wt6BcP5K7mhxxsRuO5YAce6CtJO5fr/Kz8k67VwZO?=
 =?us-ascii?Q?rbhFOupym50dON77Qz8lWDeur5VQetO7VtsKYItDJ6FPkjAj4VNBEsRSw2oT?=
 =?us-ascii?Q?URv2tvOwoerv7yjiF/ksxanlbwKszf9Kc912+X0PPHB6mw7qgcmjRG2UK7He?=
 =?us-ascii?Q?jqwFEavQUrmqdqvE00zsN7A7Ns14Qt/5k60ZgCNeE1J8A2eFFN/iojdIKvcS?=
 =?us-ascii?Q?goCl2/gxCc/y4nLwsdMgiuRP4J/JuvjI0M02Ih8r9w3URlyEzSV2rZ8rdVnW?=
 =?us-ascii?Q?VoyCB7F0j20AJu2i8nU5aVLl5/1n8pHC4nQdUsgze49qBJ4u9eFtuFINB44/?=
 =?us-ascii?Q?yYb07C9jlSQH6nIRw1rl90mJdH/7rC5JoCqRlr+d3FPr1QjHbXvR62JiBF1e?=
 =?us-ascii?Q?5q69Rv7AJlV1MchsXbeDCaor1KlaafoPIKSlstEFx221VxWvwmfzthO+6TKy?=
 =?us-ascii?Q?K2jcVKq51syY8Y+X4ASfccahT0bhdXW51K3viJTiwF/YQeyFu+k1AXpZVrvx?=
 =?us-ascii?Q?LwfwiWdqX23LIA6uc2AkP3J9FW1ivpTIRw2QOcHWPnQ8QK6r4uOEu0Oba/V4?=
 =?us-ascii?Q?a2u6ZQn/Lg+pPs4llwoBboAGz4ALel9l7yykm7b8chViLCOWcCxlgZD+cjXW?=
 =?us-ascii?Q?OXgoTJuJKiKRCzD1oNWUFJlgo3fgNWck0MMGDo/jfE6unZJAP10WCXE6Urgt?=
 =?us-ascii?Q?q0fgRJ9WP86KysTeNTYsQu2umJC3LFNbYbUMd1vf05l5U9goY5M44rGA/mvR?=
 =?us-ascii?Q?FGaoQtpL5nbo059ubZRA1F9TZB655ozDRUknz94aIDpbXgV2fCYolbDLrOAJ?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zs7rYv0FUS58dCI4LBDEkXktw2KWcaS79UQC4SJs3OYL5T/8HHhDW6WsEjH2mDKWGe4d9Zh7z3w25oqHftKxZeExDxsl0HVTxd0S08euuHfYSr5+G5hitNgn8tA/JqnPbZI2Tl9wNzydgibTy4IafYrcr0bNVoW+VKnnHJfapdPXluFXlnBkWnEUuHzWmmwgKU9fRjtLKY31kFWVKecWJb8YLQC+Rp68GDY91YpWb1+GWbeqF6o2adu8xpHCA1/XCwi+ZZj5YD5rX7jbHyaGJrRXuDpcHi8IGkWVb0qvnIlCrXYomaNy4F4BR4ut06/qxoC+np8FQ3RQnauFnZFZ/KnRbciagvvZdpB9iuSLY8mCjPLsA0g3B6FRh4p8Jz+w8uBiSimUzY7kq/7YRB3l5rH081+LP1TDg5Ztvh2Awp8SmXPySpz7Lt9FdQeD7PsPQZwyQ5NL5+nHqr2d3+ZHt3RSMqFc72YcuZYDwqPezfe4pXGlBWZXqUQBHxlooElrjoELoLIfOZVKyGn8nuPFFe0DTMotrME3igONC8QnsBWp0X6dfmiSGnJXkc184Y1tr9KsCxiUQbCfuGAFHf+l6LHyQiJlbXLN2ouGHC2Xj4Y=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f688018-a86f-4f34-7334-08dd737931c1
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 13:04:12.0920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tm6DGmOFaZdp4ppBLygHeRO2qWkOO36FpAqZEjJo7NTKuKlV1Xct4v/eUW9gf/Jm5uv9HAVlIXrSez6q3ZAhK5pBPRg2N6scxa9KvGcl5eU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7512
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_05,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504040091
X-Proofpoint-GUID: 4r2K5BVwiN5i_Dp7kV15xGLPxmoFa7ZA
X-Proofpoint-ORIG-GUID: 4r2K5BVwiN5i_Dp7kV15xGLPxmoFa7ZA

On Fri, Apr 04, 2025 at 12:53:15PM +0000, Wei Yang wrote:
> On Mon, Mar 17, 2025 at 09:15:03PM +0000, Lorenzo Stoakes wrote:
> [...]
> >However, we have a problem here - typically the vma passed here is the
> >destination VMA.
> >
> >For instance in vma_merge_existing_range() we invoke:
> >
> >can_vma_merge_left()
> >-> [ check that there is an immediately adjacent prior VMA ]
> >-> can_vma_merge_after()
> >  -> is_mergeable_vma() for general attribute check
> >-> is_mergeable_anon_vma([ proposed anon_vma ], prev->anon_vma, prev)
> >
> >So if we were considering a target unfaulted 'prev':
> >
> >	  unfaulted    faulted
> >	|-----------|-----------|
> >	|    prev   |    vma    |
> >	|-----------|-----------|
> >
> >This would call is_mergeable_anon_vma(NULL, vma->anon_vma, prev).
> >
> >The list_is_singular() check for vma->anon_vma_chain, an empty list on
> >fault, would cause this merge to _fail_ even though all else indicates a
> >merge.
> >
>
> Great spot. It is hiding there for 15 years.

Thanks!

>
> >Equally a simple merge into a next VMA would hit the same problem:
> >
> >	   faulted    unfaulted
> >	|-----------|-----------|
> >	|    vma    |    next   |
> >	|-----------|-----------|
> >
> [...]
> >---
> > mm/vma.c                |  81 +++++++++++++++++++++++---------
> > tools/testing/vma/vma.c | 100 +++++++++++++++++++++-------------------
> > 2 files changed, 111 insertions(+), 70 deletions(-)
> >
> >diff --git a/mm/vma.c b/mm/vma.c
> >index 5cdc5612bfc1..5418eef3a852 100644
> >--- a/mm/vma.c
> >+++ b/mm/vma.c
> >@@ -57,6 +57,22 @@ struct mmap_state {
> > 		.state = VMA_MERGE_START,				\
> > 	}
> >
> >+/*
> >+ * If, at any point, the VMA had unCoW'd mappings from parents, it will maintain
> >+ * more than one anon_vma_chain connecting it to more than one anon_vma. A merge
> >+ * would mean a wider range of folios sharing the root anon_vma lock, and thus
> >+ * potential lock contention, we do not wish to encourage merging such that this
> >+ * scales to a problem.
> >+ */
>
> I don't follow here. Take a look into do_wp_page(), where CoW happens. But I
> don't find where it will unlink parent anon_vma from vma->anon_vma_chain.

Look at anon_vma_clone() in fork case. It's not the point of CoW that's the
issue, it's propagation of AVC's upon fork.

>
> Per my understanding, the unlink behavior happens in unlink_anon_vma() which
> unlink all anon_vma on vma->anon_vma_chain. And the normal caller of
> unlink_anon_vma() is free_pgtables(). Other callers are on error path to
> release prepared data. From this perspective, I don't see the chance to unlink
> parent anon_vma from vma->anon_vma_chain either.
>
> But maybe I missed something. If it is not too bother, would you mind giving
> me a hint?

What you're saying is 'we never go back and fix this up once unCoW'd' which is
true, but I don't want to write several page-length essays in comments, and this
is a sensible way of looking at things for the purposes of this check.

In future, we may want to actually do something like this, if it makes sense.

>
> >+static bool vma_had_uncowed_parents(struct vm_area_struct *vma)
> >+{
> >+	/*
> >+	 * The list_is_singular() test is to avoid merging VMA cloned from
> >+	 * parents. This can improve scalability caused by anon_vma lock.
> >+	 */
> >+	return vma && vma->anon_vma && !list_is_singular(&vma->anon_vma_chain);
> >+}
> >+
> > static inline bool is_mergeable_vma(struct vma_merge_struct *vmg, bool merge_next)
> > {
> > 	struct vm_area_struct *vma = merge_next ? vmg->next : vmg->prev;
> >@@ -82,24 +98,28 @@ static inline bool is_mergeable_vma(struct vma_merge_struct *vmg, bool merge_nex
> > 	return true;
> > }
> >
> >-static inline bool is_mergeable_anon_vma(struct anon_vma *anon_vma1,
> >-		 struct anon_vma *anon_vma2, struct vm_area_struct *vma)
> >+static bool is_mergeable_anon_vma(struct vma_merge_struct *vmg, bool merge_next)
> > {
> >+	struct vm_area_struct *tgt = merge_next ? vmg->next : vmg->prev;
> >+	struct vm_area_struct *src = vmg->middle; /* exisitng merge case. */
>                                                      ^^^
>
> A trivial typo here.

Thanks, if I have to respin I'll fix it.

>
> >+	struct anon_vma *tgt_anon = tgt->anon_vma;
> >+	struct anon_vma *src_anon = vmg->anon_vma;
> >+
> > 	/*
> >-	 * The list_is_singular() test is to avoid merging VMA cloned from
> >-	 * parents. This can improve scalability caused by anon_vma lock.
> >+	 * We _can_ have !src, vmg->anon_vma via copy_vma(). In this instance we
> >+	 * will remove the existing VMA's anon_vma's so there's no scalability
> >+	 * concerns.
> > 	 */
> >-	if ((!anon_vma1 || !anon_vma2) && (!vma ||
> >-		list_is_singular(&vma->anon_vma_chain)))
> >-		return true;
> >-	return anon_vma1 == anon_vma2;
> >-}
> >+	VM_WARN_ON(src && src_anon != src->anon_vma);
> >
> >-/* Are the anon_vma's belonging to each VMA compatible with one another? */
> >-static inline bool are_anon_vmas_compatible(struct vm_area_struct *vma1,
> >-					    struct vm_area_struct *vma2)
> >-{
> >-	return is_mergeable_anon_vma(vma1->anon_vma, vma2->anon_vma, NULL);
> >+	/* Case 1 - we will dup_anon_vma() from src into tgt. */
> >+	if (!tgt_anon && src_anon)
> >+		return !vma_had_uncowed_parents(src);
> >+	/* Case 2 - we will simply use tgt's anon_vma. */
> >+	if (tgt_anon && !src_anon)
> >+		return !vma_had_uncowed_parents(tgt);
> >+	/* Case 3 - the anon_vma's are already shared. */
> >+	return src_anon == tgt_anon;
> > }
> >
> > /*
> >@@ -164,7 +184,7 @@ static bool can_vma_merge_before(struct vma_merge_struct *vmg)
> > 	pgoff_t pglen = PHYS_PFN(vmg->end - vmg->start);
> >
> > 	if (is_mergeable_vma(vmg, /* merge_next = */ true) &&
> >-	    is_mergeable_anon_vma(vmg->anon_vma, vmg->next->anon_vma, vmg->next)) {
> >+	    is_mergeable_anon_vma(vmg, /* merge_next = */ true)) {
> > 		if (vmg->next->vm_pgoff == vmg->pgoff + pglen)
> > 			return true;
> > 	}
> >@@ -184,7 +204,7 @@ static bool can_vma_merge_before(struct vma_merge_struct *vmg)
> > static bool can_vma_merge_after(struct vma_merge_struct *vmg)
> > {
> > 	if (is_mergeable_vma(vmg, /* merge_next = */ false) &&
> >-	    is_mergeable_anon_vma(vmg->anon_vma, vmg->prev->anon_vma, vmg->prev)) {
> >+	    is_mergeable_anon_vma(vmg, /* merge_next = */ false)) {
> > 		if (vmg->prev->vm_pgoff + vma_pages(vmg->prev) == vmg->pgoff)
> > 			return true;
> > 	}
>
> We have two sets API to check vma's mergeability:
>
>   * can_vma_merge_before/after
>   * can_vma_merge_left/right
>
> And xxx_merge_right() calls xxx_merge_before(), which is a little confusing.
>
> Now can_vma_merge_before/after looks almost same. Do you think it would be
> easier for reading to consolidate to one function?

Yeah it's a bit of a mess, some of it is 'maintaining the previous
structure' since people were at least familiar with it.

But this is something I do plan to address in future. Right now I think
with the heavy commenting and improvements on merge logic in general there
should really not be _too_ much confusion.

So a sensible fixup would be as part of a larger refactor. There is nothing
to do here at the moment, in my view.

>
> --
> Wei Yang
> Help you, Help me
