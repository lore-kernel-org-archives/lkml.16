Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EE317C220;
	Fri, 16 May 2025 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747393137; cv=fail; b=OSrn2IRm84oyTE6VFatD4QdRc7SKaXOoBbsjFvKrLAuDNpRjH8yr9p2sSqKDHnIGla6Pdetkc+JEDDpiZZd1toKm3sQbYDqkqt/iw/cR/0KGbsGtHyQWX84oo/B3RhrlweLj1eXWCym/YlLkWLj4+8J0IC1bCjdzEd5iF0gAI2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747393137; c=relaxed/simple;
	bh=whRJ60l6iofT4KjnNu9wlWfJd0PrUZb2xeasttzLipQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EEEf+GqzPe0RY/FHkzqBNGhcDfETy96pd4vZ1tpV9GILPbzyu0vuC7xDoAzwnvZ3fh8UONZQNraPCJ1OMHnup7L6sBhJlc9D0cIHWxwA8gxuFlSS0fR+Wm/vIYV2mQ+frPrWPnYKVfBGYnkg/6Mwvv4hUy+ieVojkgpSUCXRuWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cpbfMO1N; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TDZnE+Yj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cpbfMO1N";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TDZnE+Yj"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GAfqJm012690;
	Fri, 16 May 2025 10:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=CW7XtJZUyxym7YNeNE
	XVB5kps5+YxAhNgc5K3uxjlyE=; b=cpbfMO1NARa2a60WUaNDrQExLb2dNf6tEe
	A0g9lyGd9rmbspIQ3NsqEA8J/3roVlFBwL5Z2XYIrUBIeSAfOGsQ5lEfPQ38//o8
	UMLnJJqeWm/I9bcOBc9hvAmpoNiuSq9k0MIZKgOZx+Wfqf3daSHmdNGZfAKG4Kbf
	uDitcwC5tOjZAlM6VVLCMG6s3JPKvnChGBJCPuB0TL/JVzvEPYzs3vrZR9Fn2l5D
	tu08nGLTYIM7jU1Ji4XRSVlKie4Dk9VFZXcofzE4Qm8DMxRG4UJf3jgB42B7E5IT
	ms68/nIRCSThpqFCIMUkX/XiAuUcVis8lJaLEVVxjHMYJdl+unww==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46nrbes4m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 10:57:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54GAT6ZZ027134;
	Fri, 16 May 2025 10:57:54 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46mbtafeqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 May 2025 10:57:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRghEnt933vQFMvZMnv+aew0UwOABJgoGGh5D1fhRxSrdBPCf/O+aItpSvqWk5+LL7cK9r1ivcPE7Z0sfB2aDfZe++5GysYr4LpSdSWwwyr52lPynKGMq7zL+le930FWIn1efWkrZCxzKzEEMba9z/JkuQpHvB1Vf+8A4jzHzoFNpJr3i3DDlzgGV8xoBhF3PNwOhp20ehwbncgYeZ3IU735vHGNdJWhXZzmj0g7VmuzgsR7ZPkNcd858Q6KIMtQlbAIsZfTS24azW2m0Y2uVb+r1x4iYIpZsRMNUfy44qjNI8GgoPXiLb2ZsBjyCcMLqUSxlogPGDMaYtjycMQIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CW7XtJZUyxym7YNeNEXVB5kps5+YxAhNgc5K3uxjlyE=;
 b=sNGiGRe9h9sSgNgW3hlv/0jWxzuW1hD/7tanzm+MlVD377WAXzm3VY+3IsM7mfzOi/BQYXOBFnO2d8Re292v633hf/Joz/r+vzaQU40uKiVOGGbEZQRCcbtt0Y6txoPL3lBPa28yflV2T056po/BOcEm64Cj0feug9Nt5dLiFZOfF1ec4wcm1M5UwJnxZPe7MDJn129KNqkociHoVqR5P5CZE/t5GQtf3wlrMofuXQer5u8KIgF1uBYejBS4RPzYrAnIm0+ZbijNeyU6qjEmiI4JpKJKdL9D+OA2alxH3FH5AQ/hWk8rO00L2V98/ievuDu3rCyoWmdk123V5Lf2SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CW7XtJZUyxym7YNeNEXVB5kps5+YxAhNgc5K3uxjlyE=;
 b=TDZnE+YjoGzqex9tdVR9rx44XdmtyKmSkeyAOe5LnlEA2MT59FQzyQr/YwNv8AYYPADePa813JruR0RCYFJnlgH4sjF5JJHDFj5hfIzwDQthWdF30JOvmcFPawd+0Z9EiYbfwdA4WrJpzs0OCpKMdLj6gMO0vKLrnZ8sdDWHSAY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8640.namprd10.prod.outlook.com (2603:10b6:208:583::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 10:57:53 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Fri, 16 May 2025
 10:57:52 +0000
Date: Fri, 16 May 2025 11:57:46 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Usama Arif <usamaarif642@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@meta.com
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
Message-ID: <1a175a2c-8afa-4995-9dec-e3e7cf1efc72@lucifer.local>
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
 <ddc0dd46-8541-4d4a-ac59-287e11e1d3ff@gmail.com>
 <02ead03b-339b-45c8-b252-d31a66501c39@lucifer.local>
 <3a2a329d-2592-4e31-a763-d87dcd925966@redhat.com>
 <8ea288f2-5196-41f9-bd65-e29f22bb29e8@lucifer.local>
 <5f77366d-e100-46bb-ac85-aa4b216eb2cf@redhat.com>
 <cbc95f9b-1c13-45ec-8d34-38544d3f2dd3@lucifer.local>
 <8f0a22c2-3176-4942-994d-58d940901ecf@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f0a22c2-3176-4942-994d-58d940901ecf@redhat.com>
X-ClientProxiedBy: LO3P265CA0026.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: 642991ad-5f62-4095-6f51-08dd94688170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ACvIQdb+aVdNOP2Gw5GwODIpKW7wCz4BGfzFcuS/TRc7oWvGTw1/LDEFib0J?=
 =?us-ascii?Q?Ja+0biICdIF6izda429Ip0P3ceOLPDsdiV77AwPWFh2iC89Kjp9bncHeQm1O?=
 =?us-ascii?Q?ydFrnLTcr7HrMEOUTnlWY0xl3p9SUUiC6uBPwnOJnpVvTEG3KECJBl8xEoY/?=
 =?us-ascii?Q?v4uZ0/lrl8Ugj6ILNysiRVBPrdi1xPihwgQ5ThuYLsd7AnzT7r8iRaWilbqv?=
 =?us-ascii?Q?WrABHEZINDEdI1ANc3IFfLIDXHwYgw/OexfAl8fdg17eLN3JRJrJqfxZo2x/?=
 =?us-ascii?Q?CbOZpwIW23ktgdxFTnBrUwDgKO6Ia7j1xc8T9ftmbTznQv8+HSkilUMHxg77?=
 =?us-ascii?Q?QSl0Kqe0VK5NFLvg1Adg6BdARWgU2L9JLkPUujKb5HUoogCwZDZU2PVr1/ys?=
 =?us-ascii?Q?fZ8mLo2tbmj1BWFnLSvUYJ9cev78CqYZNaXuIq/CFWqaIDRXah3AGWBZy+zw?=
 =?us-ascii?Q?knKC0YI/FH7RTADRirJLj+8nabgHb6fdlRwkrIM54JhFK1Pyf67nfl42nKml?=
 =?us-ascii?Q?7zvTWdhLnMPnFGiVnUtg6Z09+Gi1THHGrg4KqFSyX1mtPNBNHV4fdJ2hioZI?=
 =?us-ascii?Q?I6AfxUCKWRdzj6jmG4Mobc+Ot0HRqwg5xkcmbs/hvKvZ4N7GVR0WNPHfVAIT?=
 =?us-ascii?Q?qC2C0UI/DFJPnQBFlku6HkYpxFDFXHROd22Bin8+aIdOaVzF9sYI/aQePYL3?=
 =?us-ascii?Q?Eb7ahr06OJp0w46O/ZsHHkUwOS/c04G5LLeBcDCvJwY3v63DzeCCOePlXNpU?=
 =?us-ascii?Q?KB0w/7hc1bQ23dcK9VgUYzhCOh2YdGl818q+zclRZMlt8kGZUry2fRpIzURs?=
 =?us-ascii?Q?S+4NthZKs3IZka5FBXP7AmJ2g30SX84GdZR6ms6NsFiI8RxJLSHmNidb2og/?=
 =?us-ascii?Q?cMhrmu04pmXV+zv9cqv6XYcjXJzptzznh+YG/4Bd/qibyuZeNyf0tXM1MLPT?=
 =?us-ascii?Q?ybZAxFVXrCiBZQiOd3+zNLck5d1GUCpy6FTIDu6exzhzB98LsQOUxK+OtEAB?=
 =?us-ascii?Q?3Jxt0FbNTtWbocymqvBPayV9YFpOOAeCnvU9voY4L6pkfNXGaprpx0bErX18?=
 =?us-ascii?Q?ok01dXdOUDcB1jEzlhr/HtSRolFabvzZKLYwFGkygzdL91ZMbLgbziAGsKrv?=
 =?us-ascii?Q?+kkn8W0P8SWZYki7O5TBQ4dfLd/QBW9CTLhrEmPCKymyf6k3LKweNnkl2y5/?=
 =?us-ascii?Q?FqiT7+NkVuOiqksR3S12g5cho/nkJdEOAzJdD6zdcBPgyOFalqtP5Hlncml/?=
 =?us-ascii?Q?7cXS8H2td9AJ0LlzSsqryRPR7X2w9+HbyxU9yq/2dOPJWE6xA301YMhtPZBl?=
 =?us-ascii?Q?gWv8DbRNydS43TAbaYir3rK/e13bnmDFKcJFOWSWOmq7Bi7IqRAn7KI+xvhR?=
 =?us-ascii?Q?CAEgidQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gPcWIvywl7nT08cH6avkN8iK5pwSWwxmF0Apa6GfxZ1ZjQ/e5zru6n7eag0E?=
 =?us-ascii?Q?1oQdi4MM/PFrex5/DhQJAL4Cn6AldSez1A5+HJyz2WOBOjxNqlyy0E8w+J++?=
 =?us-ascii?Q?6yfGJCOUYJe7H7VT5PCQ7k6iZj+F5vWApVc3/UhFsYCGz2mWuFimdRVcd8VB?=
 =?us-ascii?Q?4MHeVoMa4ycRXFDJExI4+P9r4aL+y3pD6l4tiTP2dih/R7e3aVodzO/FHkmk?=
 =?us-ascii?Q?LuePmVTTC99Zg5k5NirudU2qrqGvzinffE++DnaWYKReNZ1epfVDfrDNwuct?=
 =?us-ascii?Q?KVARb+u4aqihQpVBaYvcf138xbTw6uXxIcXol8kFyo5EMMy9D9RolvsH6py7?=
 =?us-ascii?Q?KF43TQM0Y4/WJ/BjJ2uhRZbeE/mAzjgKpzhDd4TyQ7YY9uotNNZXM3WsFo0J?=
 =?us-ascii?Q?KTf3PH9rdG45MvJkdkmSjPKAx0fcwR2L+/cLrbAbejGM4RDmyova4LFn1iE2?=
 =?us-ascii?Q?cu2vR1eZWGjPX2yApGHfNhPD3dh87NnDjzKBX4bLGCV9svmTXaFVdHXVetea?=
 =?us-ascii?Q?0lvA2dla3wVzZb7FLLVHue3miomWn9E2KmXNu/QtxBOBsfm10l9GMz+0v3Im?=
 =?us-ascii?Q?Yq92/VCfqy18eQqbk8NworNoI4brM2VKMGCMCi5p6HMR3ytmpOc68I2sVJd+?=
 =?us-ascii?Q?tO4bPJFGjiDNYnIu9067ELWvEAzxq1XclpcMHG41rYVgnqvVs5qy5lEZMq/p?=
 =?us-ascii?Q?0d5KpBdF/flo9TcyKDtAH9CtuHM6GPtJR6rfrSLR4iPB0uUc73XsNegyhT4Q?=
 =?us-ascii?Q?reoKdYS1VpzI4erz89Yp+6tVmE/xWgSUy6Szv0CdxDOfd8HX46a07b4pYgSm?=
 =?us-ascii?Q?Wd3e3HcP2T4NBUhQM95LsxCR/QOeyQRNP7/6pTW/zGtsfGQQLABlujfgT02J?=
 =?us-ascii?Q?iPrW2qoWNw4GPKEtFe5IZU++Twa2bQVPs91qj6a1fc3awOzBdGcOVAFQ/gMn?=
 =?us-ascii?Q?LJZPrYQS2RaAtdquB67wZ/P46JPRVMAsxvbBEqyBByzIb5cCSon03+4tiC5N?=
 =?us-ascii?Q?oPZ3tdy5Lwgnl0YAzXdGzj9eF+wTXptshnVMQYtbHYe7d6C+49NMErxh4UdZ?=
 =?us-ascii?Q?9aNSQwG1ip4xFE0kMwwRaztF/rHQdlDGazynp6QO3Vw2b8rQ71M1V3kH4U37?=
 =?us-ascii?Q?29V8gdE7xYu8K7ums6SXZlA4N7c+8z+SEXamQt3TvaQZ0vLDoD9+h7AA6upw?=
 =?us-ascii?Q?GUM8HB2JcBNPIZzf7jZXOCF/Hd9dYkiZGfzGp4sfpgxjr7GQZrWuZQ2g6T+y?=
 =?us-ascii?Q?cVOmf5zFoKv+466xlOXz2vX4TLktbaIP3AsAFYqo4A15AhnscmdeKMkWPpJx?=
 =?us-ascii?Q?VjzvLyrzHzOFIZi+6fUJVyZ/bt4f4j/wQ+d7Kxe04yi1DtqSEaQnJsIGwj+5?=
 =?us-ascii?Q?t1YDe1cEQ7K+pRXGIamv6cXKj0n87aESSUGfjmEMex2j8p/NvXWHFADQplEG?=
 =?us-ascii?Q?vou/3xcK6rIkY0SLqF/kjgqt78vmolWN/8xH1QdClfrqi6PkMKNKhlGN900Z?=
 =?us-ascii?Q?dg0YUwbiPvubMQugO9YzskxRED8+fwfO57zryrs5hV6pNwlv8TrUorqGDWNd?=
 =?us-ascii?Q?G01roykaMhp/LLPzldoMFKqKU+UnaYIxZEkCJS2v+h2BZnfEg7gtxAUJsCzy?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hoHFOw1Lcozfx0XYvr9Lx17uF+T1WwJT+UKoCzqYV1iisbzn+wftUwLCPkqIxGyoRCwgflduyvv9qlGNj18HVVFhcjuE2QGoFY5POfEx6fDCKi2uUBkBV/9n/ilhHMS4nRxRrvAlaRMBbrTCPioVvj0KoKLAGDd5yr3rj9nhtMNILIxTRLO95KXthYmfID6ALVh8ctORTVxTobUaRKAZAnAg1oeRPxv/jsp52QxsiaEollzq7yg7kpIQ/EGSEG1cxQStvv5YTs3EJfKqGKcyIerhFffxSAxJY0cK9n0LauGjfkw6RoyF8CU8+nfmmt3VDuGcuzSBGDo6zgBMUudPplQXNPZeWKDxh6Dt4e0wf7067QlpxwSXKhv+FSnoK+G3ZhVhyjeraWkCfh2azyU6hXJ22No0rBB1gG7UTF0xB0Ih3QbK41aqreLb1bO4Nxw9RXtCw4O9erOYnnep8zslhP/gyQF7mPtR5POHkQf1+abH52wVBi1wS4rmcLjQBnkKbcE11gAaraTJly9VHY/Lqh28dLDKganBd31REHYXPEZi49B6rqF72C16QVpEXg4Yny0xg2URluGApLpFDHJTPhIltCEmdq4Y2+BnITdIdos=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642991ad-5f62-4095-6f51-08dd94688170
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 10:57:52.7541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fFmoMUYsQlTIgOWt0G/IKa1y4bwTn7oxFw6LQc3ZQVglYukGNIGTSmmww2Wi6cJ5Q9IeTuazK86O4P3ohnkLWGqOkc+VIjw4B3YEEL+KUEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8640
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505070000 definitions=main-2505160103
X-Proofpoint-ORIG-GUID: U_C6e3cKyDW8XhMRb6q2C-lit5i1_LeD
X-Authority-Analysis: v=2.4 cv=R8YDGcRX c=1 sm=1 tr=0 ts=68271a33 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=GcyzOjIWAAAA:8 a=20KFwNOVAAAA:8 a=fTS9dbWWaBYbUYzJkG8A:9 a=CjuIK1q_8ugA:10 a=pckeWPcl4qcA:10 a=hQL3dl6oAZ8NdCsdz28n:22 cc=ntf awl=host:14694
X-Proofpoint-GUID: U_C6e3cKyDW8XhMRb6q2C-lit5i1_LeD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDEwMyBTYWx0ZWRfX/+QJSSE4vSZw MCzhvi4lCOS0NbP1GVd260roCjvy7uGaw1oRPlaUd6WmV13fW9t0rYOrZR+NP6EZ3KPYtUjT3dr MHDwlSxzbzQrGeiKoS40daSsie0cEiM2XJG45uHgjtY11v2JJgZ3nU6dVyCCldrUyCi87THOWFD
 3k9Wt6/BV2X1S6ffYZzOsvlrEKclGKNc16rpL6hUOdaml2dkHwyNSxRXRWdxY4r0YLPpTFyQeaS a/UdLCPvIpW1RDr4X6xCQGtBudOfGHAIjoAwYFws4MAo+dGwGpFfV21mVDbEELDJqsS9Qrvx2eI h0he7uCfB3U0JmxNIcghJLcLAnh0wvCvnD9Uhu2UPWzhuipwnBrXBKGoYdv2Yrho9+C4HbPOCuw
 WBCu/K6f8ddd8/BEqDK5vbuiQTwuNe5XFhUfHgJJIGnYJs/PZtn5DVRGObg/zM9DGkbBWMVt

On Fri, May 16, 2025 at 09:45:17AM +0200, David Hildenbrand wrote:
> On 15.05.25 22:35, Lorenzo Stoakes wrote:
> > On Thu, May 15, 2025 at 09:12:13PM +0200, David Hildenbrand wrote:
> > > On 15.05.25 20:08, Lorenzo Stoakes wrote:
> > > > On Thu, May 15, 2025 at 06:11:55PM +0200, David Hildenbrand wrote:
> > > > > > > > So if you're not overriding VM_NOHUGEPAGE, the whole point of this exercise
> > > > > > > > is to override global 'never'?
> > > > > > > >
> > > > > > >
> > > > > > > Again, I am not overriding never.
> > > > > > >
> > > > > > > hugepage_global_always and hugepage_global_enabled will evaluate to false
> > > > > > > and you will not get a hugepage.
> > > > > >
> > > > > > Yeah, again ack, but I kind of hate that we set VM_HUGEPAGE everywhere even
> > > > > > if the policy is never.
> > > > >
> > > > > I think it should behave just as if someone does manually an madvise(). So
> > > > > whatever we do here during an madvise, we should try to do the same thing
> > > > > here.
> > > >
> > > > Ack I agree with this.
> > > >
> > > > It actually simplifies things a LOT to view it this way - we're saying 'by
> > > > default apply madvise(...) to new VMAs'.
> > > >
> > > > Hm I wonder if we could have a more generic version of this...
> > > >
> > > > Note though that we're not _quite_ doing this.
> > > >
> > > > So in hugepage_madvise():
> > > >
> > > > int hugepage_madvise(struct vm_area_struct *vma,
> > > > 		     unsigned long *vm_flags, int advice)
> > > > {
> > > > 	...
> > > >
> > > > 	switch (advice) {
> > > > 	case MADV_HUGEPAGE:
> > > > 		*vm_flags &= ~VM_NOHUGEPAGE;
> > > > 		*vm_flags |= VM_HUGEPAGE;
> > > >
> > > > 		...
> > > >
> > > > 		break;
> > > >
> > > > 		...
> > > > 	}
> > > >
> > > > 	...
> > > > }
> > > >
> > > > So here we're actually clearing VM_NOHUGEPAGE and overriding it, but in the
> > > > proposed code we're not.
> > >
> > > Yeah, I think I suggested that, but probably we should just do exactly what
> > > madvise() does.
> >
> > Yes, agreed.
> >
> > Usama - do you have any issue with us switching to how madvise() does it?
> >
> > >
> > > >
> > > > So we're back into confusing territory again :)
> > > >
> > > > I wonder if we could...
> > > >
> > > > 1. Add an MADV_xxx that mimics the desired behaviour here.
> > > >
> > > > 2. Add a generic 'madvise() by default' thing at a process level?
> > > >
> > > > Is this crazy?
> > >
> > > I think that's what I had in mind, just a bit twisted.
> > >
> > > What could work is
> > >
> > > 1) prctl to set the default
> > >
> > > 2) madvise() to adjust all existing VMAs
> > >
> > >
> > > We might have to teach 2) to ignore non-compatible VMAs / holes. Maybe not,
> > > worth an investigation.
> >
> > Yeah, I think it'd _probably_ be ok except on s390 (which can fail, and so
> > we'd have to be able to say - skip on error, carry on).
> >
> > We'll just get an -ENOMEM at the end for the gaps (god how I hate
> > that). Otherwise I don't think MADV_HUGEPAGE actually is really that
> > restrictive.
> >
> > That would simplify :)
> >
> > But I still so hate using prctl()... this might be one of those cases where
> > we simply figure out we have no other choice.
> > > But when you put it as simply as this maybe it's not so bad. With the
> > flags2 gone by fixing this stupid 32-bit limit it's less awful.
> >
> > Perhaps worth seeing what an improved RFC of this series looks like with
> > all the various bits fixed to give an idea.
>
> Yes.
>
> >
> > But you do then wonder if we could make this _generic_ for _any_ madvise(),
> > and how _that_ would look.
> >
> > But perhaps that's insane because many VMAs would simply not be suited to
> > having certain madvise flags set hmm.
>
> Same thinking. I think this is rather special.
>
> In a perfect world not even the madvise(*HUGEPAGE) would exist.
>
> But here we are ... 14 years (wow!) after

This feels like the tale of the kernel :)

>
> commit 0af4e98b6b095c74588af04872f83d333c958c32
> Author: Andrea Arcangeli <aarcange@redhat.com>
> Date:   Thu Jan 13 15:46:55 2011 -0800
>
>     thp: madvise(MADV_HUGEPAGE)
>
>
>
> (I'm surprised you don't complain about madvise(). IMHO, prctl() is even a
> better interface than catch-all madvise(); a syscall where an advise might
> not be an advise. I saw some funny rants about MADV_DONTNEED on reddit at
> some point ... :) mctrl() would have been clearer, at least for me :D )

No I prefer madvise() massively, I mean yes in a way it's hacky, but prctl() is
the ultimate hack.

So as an interface it's actually kinda fine like 'virtual range X-Y, advise ZZZ
about it'.

(as for naming haha maybe you have a point actually, the 'advice' bit
has always been strange... :)

But.

The actual set of advice is bloody hideous and confusing and I've seen
first hand userspace people get very, very confused about what each thing
does. The naming is horrible, overloaded, overwrought.

And the weird behaviour with gaps is also horrible...

So there's lots to moan about there, but saying prctl() is somehow superior
to the true evil of prctl() is far too far :P

I mean take a look at https://man7.org/linux/man-pages/man2/prctl.2.html

Things like:

	PR_SET_MM
	PR_SET_VMA

Are super worrying...

>
> --
> Cheers,
>
> David / dhildenb
>

I wonder if we just need a new syscall overall... *puts thinking cap on*.

A galaxy brained idea may be coming to me good sir :P

Watch this space...
