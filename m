Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F414425FA04
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104620; cv=fail; b=c1psBeD2/JufYDRYgnrB0Q96u2bsZHVzvl4orswjpRNU3Pih9atSDoZmAC77lL+6FmACObSfrxCECUsWIS+nnkTHIWWbmmKefUvOSneFpKGJ2V3CLi/2LOicdjIo/hDHfql+2tA1T5jgMbyWQmTuxcQ1o7hCZdjGAGdEo7qLTXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104620; c=relaxed/simple;
	bh=4ImneCKdNmGYhtY0AJAhfBYzRMQOuSFKuHx45rR5SpI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uwlyHm7qtFf4rFDZ7CjfMzipi7lTLt8gLOH2meYH5cS7L7Y/YimdsPcb0Qd9mINZMQRYMykZfatUNqP292InRPldrEFyzQlYwoaMDogbhufRNiaZMLquYEBeD6g7v2O2kxsVtjNyZTGd7Q0a3dWNu/ra0kuVZbEtLhpLVtj1NWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QQSK8aj/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FF+hJJpW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QQSK8aj/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FF+hJJpW"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5381u7eG001181;
	Tue, 8 Apr 2025 09:29:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=CiBvbAjS0ifNtyem
	zlrwAGEuTOFkr/cJSa4k2suNAMA=; b=QQSK8aj/ifCODLC05cXmvTd+ZDEUd1ok
	eikDdhapbom7NOkFFo046MbYOF0V3xqUFz1dvwxbpLCBznRXB0ngUpEsmCsowj53
	Vv+ppgt93Vy2M6eZdL+dJWdffVIJRkf7deMd9h6LBMvbUynhbjeUsPTGlTTX01Mt
	zgkz4P9ejlx0trjp+OevnemzPGI7VGs91+0ratx+X9BtdWv/Lbj33XWu8TYnqwm8
	duJXZ5XQ0aHp5M/LOMdgk3WhV+b2tD/F6J0clZd0LLpCImFRMXDikkZZ0cBmXohH
	H6IMQOlAFq6AAwNLweh6uwpGl4DSxjeiEefC4F6TpWfi3hZhLV40Pw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tuebmd12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 09:29:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5388ULdq001741;
	Tue, 8 Apr 2025 09:29:40 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010004.outbound.protection.outlook.com [40.93.6.4])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45tty915e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 09:29:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyDpruQqV6t6y0Ng2NIJzievLMQWZ9XvkbbfFKUdL2t3jHXkozbV84WLeEakx7aJlPanzyoVFxhmwbn/LjHzqWT3HbtkYWjlJc1mQKZZThskTYkDGeNscFGSobxyz2hmdWKiAWjZhl7w0C/uBQdh/5i175DA0qMjy1qhWtvrIXWC51h96D0+OWmEeZBBdWGu6dYnBdYMnuMh5D+6KkU0mOLNTsrhSOvSUwog8Z7Pgz/4NVULDfr1nh2Jo91Zgj6pj95arll8To8iqRoVfIPQHdHW5/a2WLoaYjhfpD1DAE+IdFofw5PDeWCqHFsyElescGQjUu5UjfWrHBzWJhAJbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiBvbAjS0ifNtyemzlrwAGEuTOFkr/cJSa4k2suNAMA=;
 b=U1oBXIa04atyO7+hJVqZLnDOVGbWT3VfSR33ykc8jQ0EbIPfVolo3dZencUlqZRzNAH5t6HA6FDeKdTHQ/7Bfwklo4BbQ1dCrjLC1ZxaZJEdualampH9vUEvzuhVJMvGTSOnWupWI7aov3KeTfjeO4DM1JSNGekTeR1PWk3Fj9Bd2LzGFxaqIJw7QTOGK45lIzhlGyWwzgvUP8hwLfzcVM65T0vFUGG7bwcW3PHZpL4BFWeayUGzAAfJlxXI0EDyrb0G+UKUrm2iH/qkun43aDNf45PztdRLjh34ryXWYd6UIM0r65+2wbK5s+/1fvuTR7sZGJdjwEnMQUE8oZS2QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiBvbAjS0ifNtyemzlrwAGEuTOFkr/cJSa4k2suNAMA=;
 b=FF+hJJpWd3JCfZdSRXGY7RtCG8qtH6Sfsy4Sfp5tUqSvNFtgvRPwWzguvcM50Lp/JBHqoWUJigWSbilvAV3oROZ39DrIi72G5ImQM1GzSUbc+RyVmmNiyevKMSlp+DaQ8HChKy8VWlx9lRaciGLMtn0/2uaIuGXpTy9N32yM++I=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB7244.namprd10.prod.outlook.com (2603:10b6:930:6c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 09:29:38 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 09:29:38 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] fix incorrectly disallowed anonymous VMA merges
Date: Tue,  8 Apr 2025 10:29:30 +0100
Message-ID: <cover.1744104124.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0139.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f535580-f7b7-4da9-a69f-08dd767fe1da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HQkLggXjgaZAeG1yP/ozwQrs2EOCDwlqeA2x+IVhw8ULlo4bqSDrLYD8E3rD?=
 =?us-ascii?Q?GIUgd6J8gr3i/9dlJ7IhrqNh5nfajkc1Os8lt2fzZ29XLJo3Zg3DKL6UNNMp?=
 =?us-ascii?Q?DKgtVr8UT9W2yF3CdyD8NvZyr50rPBkeNCbrRpid1QPWsNL4BLDo96flZA+p?=
 =?us-ascii?Q?R51u2f5wx9EpxOENRspPoBxpAn4n39rpamygXcBDZuZ6viK07i1Uy7RVPVOB?=
 =?us-ascii?Q?WaCjTN4lTEKyFCkzSPrc67JX9sTqXGxdrxD/ixqzMXsNJ8/QgSuo/F2EpvQs?=
 =?us-ascii?Q?YcHt9c5QdHs6HNeVLcqgUhf5XOhcWGMlkUzl6QlzgMkzZ8coQa9nTWTjTiGW?=
 =?us-ascii?Q?g+vq/Qt7jxmh9uZdfj3YpK/FUN4md+PIys6jJf7pFMkn0bCjBy540xAaAzcw?=
 =?us-ascii?Q?8I/6TDSuhi4C3x0AvwzCfDiPwEdi4ABN73bmM/X69WvHvSiDT3+1JrXhb11c?=
 =?us-ascii?Q?Ouu3J1SlziENznD9QZLQQJLznZArSNlXwZz0e9XbZIX9VywxXjYF2c4aTeSh?=
 =?us-ascii?Q?H1955V5tlgO7Me5qJn1+vadxc8lmm2DGetv/H8zXeXwpFshNTdEGbjS2IiQl?=
 =?us-ascii?Q?0UKSFfirkye/L9WPMQKenLjD2fiAJCXc2TnZYwUrLLEHRuy9pXUgbJWSR8E6?=
 =?us-ascii?Q?8D80G3sl2ymcx9gf2RnTNK2a/cqi9FO9UbZ7ELw2dYYSC+p4u+TSvw+2wDsK?=
 =?us-ascii?Q?VhJioUQJVAmmyryLNNVfkveVKzUV8EHO7PuqECPUF5IQV9TKleyy+tuDb7BR?=
 =?us-ascii?Q?/Mpp4d7B1FEsZgiWcOTcsx1gb06+fSbhsPwZd+aNfsknCwwvrX3Noh5Y85Md?=
 =?us-ascii?Q?vePhlC/V/YJssa0aFAq2WERHz1QtXKjPyDO4nbDhfdO8Q/OJoV434zhhcaPp?=
 =?us-ascii?Q?XSF/+X/HWCTPBat692cD8vs4jzQEXD52p+in35qWITyuPJcrgnu1zIDZHBx1?=
 =?us-ascii?Q?NwZhgnRnQSPVNAbdJ1uUfAd3cvSsxDatJozafxB27eUJsa5MYO8fy0MFRiNq?=
 =?us-ascii?Q?UAA4mkI7TBg26VdKD7G8qi+SHjy4kQXzgGZdokFg54LKJVOtNeo1tFmY27yF?=
 =?us-ascii?Q?grEB2X+ELiySkubnb2wYaqGBf+cX8s6wN2wecwlfF1f+Mb3LpwSd4bEg/rEX?=
 =?us-ascii?Q?6teAO6VhfiTW7GdVMYYMLmuqzDKSTou9jSAjheYjdfmZp3doI1oJGdnGAY05?=
 =?us-ascii?Q?dkr+aCo2AJMeBPCjFNK0c1ZiXcK6uck3Z+QZ5Xf53ntZ0TW1Whw8kJW0O2Il?=
 =?us-ascii?Q?HWkXtm+NOMAWEbDiHa0GtfFIL79BxgHQufAv+04Qxs2j/mV6tYiHBIkJmTpk?=
 =?us-ascii?Q?ESa++5HXs0d0dw6mU+M7RGZswpFFojVZcr+jj/Jnt0hQw5UxMufIMyeW68PZ?=
 =?us-ascii?Q?APF3detS47yvw7qq3+uOxCtSpHUz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RkBb/uRhxrQL6QOik0K3L8eBMyavoiHX/DI3HiBnxeob9g1LQeNWkxXEjm95?=
 =?us-ascii?Q?bIXt4Jlr/rGLWvuhh11UNpIfNhwDWJjUCzCbrnWhAi5x7eBi6T0W16SCYn54?=
 =?us-ascii?Q?6Ovc02ja/XrXMYtOkOlv/AJJkPYMHWPe7Tnsy7TL4Zl8Ts1iEhRYpyaST9+V?=
 =?us-ascii?Q?vf1r9WU3JPUxeuyYfTis2Cf95xX16P4wa+2pNe9CL2XmILVduKWc6otQIGhs?=
 =?us-ascii?Q?v3RUfPnVjtsRQqPbZ3Duu8ifUHrSlD202yXNl5/ybZ5hFWqxjiEHkamOT36+?=
 =?us-ascii?Q?Dv9qo5DaB+LVOlAxzTVnVUb61eMFIJiUYL/cTDnDq7ywDG+4sjLAYFhFfSYp?=
 =?us-ascii?Q?6ru/Ys2MIij9sj56L/ePpHVEFUYKj+jdwM/cGD+3QC4OFE4Eh8wAPCOYg08A?=
 =?us-ascii?Q?+9e11GXCoAtz74rLinPBHaitf2QTqmDXUxbRPlQZ4aAaN+bS8dUpsdITiAJ3?=
 =?us-ascii?Q?smuQWUAa9Izru0S1HMcK3jwz62jvEz3JlrXhbRH/lqZGZ7M18B0MPVYTpsAH?=
 =?us-ascii?Q?EZoyrgGiajrhsqKNpCXXTyxaDaxdmMoMpkJoy0d00mCfRH64SHnnwzs4M8iW?=
 =?us-ascii?Q?9yGz0m6pYziXBfyIeoQDAiSO3H6qATfI243QTqSJpcKGssLMuLLtEXcA61g6?=
 =?us-ascii?Q?7wmeK/zlPc3vMJzXl5EgQJK6zcVp1gC9jxGoJG9OBy068vSvcyKPWtrA3k1C?=
 =?us-ascii?Q?4SyEZiDbQGldkpbQaCYSIgTv7CX5yTgzfxI7PDRM2XBZFnRd1M4PHcDew1y9?=
 =?us-ascii?Q?tLKZTxfQQQCDBIHU98/OTkki832tOlpM/Vo75/Rqaw0xcsUucQIgSWCe96ZO?=
 =?us-ascii?Q?sBRtJwrlywADHDmqOtgkkZqlkuSlmSkbmubsyRhAn15p2Pd9jb+eZMtAABZN?=
 =?us-ascii?Q?tRycToPDItW8A/wh8kutB1Rl9AKOOpqJr4oGqHGwflADNt2ddid9v5QAlPB1?=
 =?us-ascii?Q?BmgN6BS/RMSRGtgWEfLPvrxHh1DRRpRkGh2sofgTf0L4pXXZvRzu5/3E/RRu?=
 =?us-ascii?Q?WSjRMRx0fWMuGakGeSANGeClwvzONVDRt16wrjwEvpAaSSJQjAtENYaw87Gf?=
 =?us-ascii?Q?p0JNl09Oyw7NwJYV063S3cBA0eDLIqJ9sY76RTCiT3JWTfyL+wHGnjWrC3hy?=
 =?us-ascii?Q?P53ty8Ibh0lKqSegIMOBdkWjcd4zWKnliq3a4gElySWupt8NtPLfUnbZfUcn?=
 =?us-ascii?Q?WQXp6KvX2m/rjSXgYpZupd0SCZkGOTxbwRxyDnS4nSN3uGR8LaeH9eS7/g2k?=
 =?us-ascii?Q?pTMv1x5edKmyd01yptE24fQmplRIPaH/nL2PEws/d7xnIcaftLng8H2ubsZe?=
 =?us-ascii?Q?6OJfXeBCW78yUIQD3RoIXLKi8/xDAvStG2UxFhg8q54EH2D+9NPmE4qjRrQt?=
 =?us-ascii?Q?LizaZ0IRGrN10WqgFVlnMN86aFd6INomeebJwTEKdnz5g2S92xNnI9Ou1QTV?=
 =?us-ascii?Q?v9xOCTymglSYTdBLS1I5Vm4TdmR+56utC7P6VcGhRdhYX/vtNfGR8+/D3pGF?=
 =?us-ascii?Q?IG/MZSN2sSVGdjwfI0gNw6SRK2Q6M0cTsEQ6aNjbmKxit7d60mVPXeWj7tux?=
 =?us-ascii?Q?uHG8tSwYmtsQysrk4zdmz8KtTyqUJnLGJiWqPYq4lNI/5McztR2/TrGcSgX+?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8STGqpn9kfKGSX0Vric7PnlwprkPewNe1iJZOBj41jmz4Fi7U8w2mQd6/zcZW3jFLBIrqNhUNUn3KTv4I7wnFAOhlw2OcP0NxBp+tKHiGYqG2gUs31szLGaArZrYLoyd/1oAR4qc+2ETAeiHfqGYEYcw39C0Tsm2X0ZEqfDJAg9y1ZA+oZxfXO4RFLysT7W1FCUGP0ouvl0QN9QnrGQsWEOmcaxJmL3NTqqPNS3ktuYiq4bocHVU6rTZlOD7xxrFIIR0ClbwMfRjYZppIOIFwgaX5xvin62x4vkIjblIqpMPzfZDBwfkcI07qobaHHMtBPu5EmQ6u/S798442V0gu1MCWdav8zQyBMjbo5EU7nMJWv35C29xVvv+kogWyG/40jJngDRggWYHx1uND3SIMJqo7p25gFYIPnFDitmmaswgFFqs7IiDzvnyIECz/l2kagDRQUktkFMoR90e4zslM/1AfKVnDKGfKF03iMSKYdL7IjYk4zFaklk4YU7om3/hYhJlLi0d8WNiNVMOP9eCoScsLEzChVtvBO6uq5Ruy+0CHYf+dRQF+aegSCnnojNwB/DFL9RbnbwwKwxshMy9uWR/Zgubf+/FsS2REyJC95A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f535580-f7b7-4da9-a69f-08dd767fe1da
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 09:29:38.0535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eOTbxHHoexaC5u5oNNhw4r41AS4klOuGPQsLq3JPJnP3FM9oGZn3JmSkG5TsCJtn1rrvK4sBSxEDDGWeoNzbKdMF4YnQz6r2Y+dFcXlgAfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7244
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504080067
X-Proofpoint-GUID: i3KlSgmy5PZwy-J2qBF1q1SNjjJ5lpXY
X-Proofpoint-ORIG-GUID: i3KlSgmy5PZwy-J2qBF1q1SNjjJ5lpXY

It appears that we have been incorrectly rejecting merge cases for 15
years, apparently by mistake.

Imagine a range of anonymous mapped momemory divided into two VMAs like
this, with incompatible protection bits:

              RW         RWX
	  unfaulted    faulted
	|-----------|-----------|
	|    prev   |    vma    |
	|-----------|-----------|
	             mprotect(RW)

Now imagine mprotect()'ing vma so it is RW. This appears as if it should
merge, it does not.

Neither does this case, again mprotect()'ing vma RW:

              RWX        RW
	   faulted    unfaulted
	|-----------|-----------|
	|    vma    |   next    |
	|-----------|-----------|
	 mprotect(RW)

Nor:

              RW         RWX          RW
	  unfaulted    faulted    unfaulted
	|-----------|-----------|-----------|
	|    prev   |    vma    |    next   |
	|-----------|-----------|-----------|
	             mprotect(RW)

What's going on here?

In commit 5beb49305251 ("mm: change anon_vma linking to fix multi-process
server scalability issue"), from 2010, Rik von Riel took careful care to
account for these cases - commenting that '[this is] easily overlooked:
when mprotect shifts the boundary, make sure the expanding vma has anon_vma
set if the shrinking vma had, to cover any anon pages imported.'

However, commit 965f55dea0e3 ("mmap: avoid merging cloned VMAs") introduced
a little over a year later, appears to have accidentally disallowed this.

By adjusting the is_mergeable_anon_vma() function to avoid lock contention
across large trees of forked anon_vma's, this commit wrongly assumed the
VMA being checked (the ostensible merge 'target') should be faulted, that
is, have an anon_vma, and thus an anon_vma_chain list established, but only
of length 1.

This appears to have been unintentional, as disallowing empty target VMAs
like this across the board makes no sense.

We already have logic that accounts for this case, the same logic Rik
introduced in 2010, now via dup_anon_vma() (and ultimately
anon_vma_clone()), so there is no problem permitting this.

This series fixes this mistake and also ensures that scalability concerns
remain addressed by explicitly checking that whatever VMA is being merged
has not been forked.

A full set of self tests which reproduce the issue are provided, as well as
updating userland VMA tests to assert this behaviour.

The self tests additionally assert scalability concerns are addressed.

v2:
* Added tags (thanks!)
* Folded small fix-patch to patch 2, returning -errno rather than errno in
  vm_util.c.
* Merge conflict fixup in vm_util.c.
* Some comment fixups in the merge tests as per Wei.
* Added vma_merge to run_vmtests.sh usage() function as per Wei.
* Added the new test file to memory mapping section in MAINTAINERS, as
  specifically memory mapping-related.

v1:
https://lore.kernel.org/all/cover.1742245056.git.lorenzo.stoakes@oracle.com/

Lorenzo Stoakes (3):
  mm/vma: fix incorrectly disallowed anonymous VMA merges
  tools/testing: add PROCMAP_QUERY helper functions in mm self tests
  tools/testing/selftests: assert that anon merge cases behave as
    expected

 MAINTAINERS                               |   1 +
 mm/vma.c                                  |  81 ++--
 tools/testing/selftests/mm/.gitignore     |   1 +
 tools/testing/selftests/mm/Makefile       |   1 +
 tools/testing/selftests/mm/merge.c        | 455 ++++++++++++++++++++++
 tools/testing/selftests/mm/run_vmtests.sh |   4 +
 tools/testing/selftests/mm/vm_util.c      |  62 +++
 tools/testing/selftests/mm/vm_util.h      |  21 +
 tools/testing/vma/vma.c                   | 100 ++---
 9 files changed, 656 insertions(+), 70 deletions(-)
 create mode 100644 tools/testing/selftests/mm/merge.c

--
2.49.0
