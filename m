Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91724DCED
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449119; cv=fail; b=ZUeduXdKU+E4T5eRSQ/ZgFncms/EwjIY1SGy43pKDuAJPrwpDRUxghnN2Cc2w0nMv/jJoJJ59FJuZODNoyjD8aP2qhqiOYAQ6jQsiGPF59UNIv/ZEG/0AbxPBk7vTjbJh0FTLkIbODLiQzdVAPKECm0JWuh3OexASbQnpm5AYso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449119; c=relaxed/simple;
	bh=Ln8jPvjyr+gbmqEBnaEqpW7J75XtBhttHHXA7PwXZ4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m4jcIW6V8HvUJ+BCGUTLP2CjhFyPARyr2TZCRUajZgKSQWTSrXQ2WYeEfL70aUhRxyYnKKbl1HOP2sa7hfEixFlYNkwj92EnMtoI7I7gwzjao1qonRqaO7w3QHQb3j0E4pttA40yqhYk2iuRAw0CNBDRnnadup30kJuiNe2jEHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F1b2QZO7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I2Y32SR/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F1b2QZO7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I2Y32SR/"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5627MfTP023052;
	Wed, 2 Jul 2025 09:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=BLCWHivGE8dm5nTePN
	u0CYnapvZ6ZQyWayVtoJvmqDI=; b=F1b2QZO7ggbGibx2+HULOtGRRE+QlvwJE7
	+NxU8I5ND41bD4t6DefrprlBa4CdjpALnq4AmchjFJOj5lr8qQXnHLMad/J6qSoL
	gvdsJZIzLHQcqUycS7NAQt6q8MbZEpMY2Dy7uwoQwWlIHwt2c6DgvX5oliIjcp4V
	eihXi22ybMaYchWU8P7y0Q2xspZAmIkFS+ZbASiiCUTejIF8TYJulizeMDAUNQaW
	tFeq8K9KmiIBQu7L+1MvWs83eRPNMP/KDMIe6d6HwWALknuK1AcbtHz1NiQs1YUt
	bQRANHhleLjF2+ilBL/sfaBJDqlhZn9CwdH+06CzliJ6eQdNLD3Q==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w6gx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 09:38:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5628G95T019367;
	Wed, 2 Jul 2025 09:37:59 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47jy1fr82d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 09:37:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0vVn7UBmk5iMZfDlTwCUjsoQbn2vm+a0zth9bFDMh9NX7diKc/U1Igu/JGh1rPiAzZ4WMJMwW+gy0+dXeFPWXtMyK2cicRzDp7pOZgttNRgm79HlpZykoQmZtiTfhPP316MChqQ4EkV0WgA+tYEWtihc1umG62pa9LxYTvj+9jqpOn8DCOSu45f5JnyPKfg/dKM8QIRHpcVjlpyEN1LAOsBchJTZQ3NyAO2FsB7EDDa0wtVbs5xKg9zz7LJ18DFCqZZP/mc31zZbMb/QKZ+TaQqkWmFKM3oa7PfxyIj1geF77Oy76LOJfApKSdiF3tl6hkG3YUqCczN42wPA7gNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLCWHivGE8dm5nTePNu0CYnapvZ6ZQyWayVtoJvmqDI=;
 b=itP+JsUgw/5/Qp2joNFyeRUu++di5nZyLkPBeqshln9lG+eUea/8814/A97ByK1Q+N0mHE947IwAumS1HzJY53x4/fyxmCjd4MNKK50WfMv9NoXE7w+3TWxaRP4LOnbo9W5AMrYTEjxA63+bei8S0mRT4yl/VdvGiDkRyEb4dpl1cWgfmU59IC2gcRTpbL7Dk7Pkrng1LXzFFIhHhIM40AX6ev6SpU0FYaxqUtHtCHIwjVAcj7EvztSK7nQqcxDwTXMzNimPxtDWHVrRk4cxo1WpKtFK89LIxsOm+LjFv67UTfxG7LHukk7dx3ColDKH1nEgc0BePU7XWezt/fdu0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLCWHivGE8dm5nTePNu0CYnapvZ6ZQyWayVtoJvmqDI=;
 b=I2Y32SR/IzFhzhjyC5ilREnVE23zj6z942yWgafp4GwyeVu++XDz5UnODTV+8nQgof8Ci4p05FonEDGS7Wh0YRYkh0+vLF0s/LGpr0g10WWbM/ku4YOQdIwRY7p4+G3wwHHKR7Hq8lJZlFgXlvY4/gR/XMgL/lynnSt22FGNKlM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB5772.namprd10.prod.outlook.com (2603:10b6:510:130::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 2 Jul
 2025 09:37:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 09:37:55 +0000
Date: Wed, 2 Jul 2025 10:37:53 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 1/4] mm: Optimize mprotect() for MM_CP_PROT_NUMA by
 batch-skipping PTEs
Message-ID: <f7f12499-7b73-4209-a92e-91e04ffb0fdb@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-2-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628113435.46678-2-dev.jain@arm.com>
X-ClientProxiedBy: LO2P265CA0217.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: a946fff8-fdd3-4110-7c1f-08ddb94c1fba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AKAY5gWvC/SkkuVaKbfbktMGZhR1hvr6NG5lGSR6gO6a+Wp4OvEzEraD/5yo?=
 =?us-ascii?Q?HK7sdwES4O2y9nZt+MRE15gOAWigRLcgaMnu2IDU4ydmtu6S6jn1tLTjW5XT?=
 =?us-ascii?Q?FLoWwlDCzuNsOkR9Cib5ofLOHLbC2p9c99yQ3rqWLFmf4TEnjVUYSIe7PaMe?=
 =?us-ascii?Q?thrKDBpIvd8OfaJTK8t8Wk5uqOsxCuQUwRlghyBp/ne+pu56ebvAb5lFxY9V?=
 =?us-ascii?Q?fhZsejGzdYiINTViAFIg3efBC1yYmE1flJl4vmj29Wr/GIJ+xvU5n/7uA/an?=
 =?us-ascii?Q?zm5Am2wAPofRhUsQuuxySx6/tIiGycaXQdeK0wqKY6acpJY9jamtumoe8AZS?=
 =?us-ascii?Q?dhCQfcTaA5V3NcyLyaJTzWlYKtHPphlSrtZVlNeYa5KKo3u2r7nCv0pFhI/W?=
 =?us-ascii?Q?FUoDr8sb9ViZmXiqdCTIZkOGdD0fjrBffsNU+Q0rYDtoOIW2ezMPzzCB4vEq?=
 =?us-ascii?Q?GTZe7+xlu7scZdyY8Fa9HloLoLrluuZUIGr9UXwnfBz6qWqJlyYiU6KpNZ76?=
 =?us-ascii?Q?Kpz2wuTgJAJWQ5DpQEsRdyBNL5zJzk/qAPPf7/YrYRnE3jYhkH6FmduAFLN8?=
 =?us-ascii?Q?f529OLJUAN7xhT6Tv1rUkLPyLxDe6xhvmccUVY8nPbD1qYdmRrbUzHdpU/EL?=
 =?us-ascii?Q?sUUI7z7rjXFDmBBNG++rkJC0ba51s2/3sQkogF4aGqmZCo7WSqW9Hk5MKO8L?=
 =?us-ascii?Q?GybQ3e2Uv43Rv4dGIyrW/XDEEhkROfAti0fmeSO/SFTRHbhechw4DAhuXFHK?=
 =?us-ascii?Q?cMCKfjUPuvtVS84zCw9S3+zuQrwROmULIcIuH3ddvgQx0c+lNF1WBwNA8hQ+?=
 =?us-ascii?Q?VqtCtYpaeXgTu31TV6NaA+2PQ2J+hOgcSTkfw+NkfCErtZ3Uw24Zfvpq0rd3?=
 =?us-ascii?Q?rr1Z1y6J/z2NN2VhRxiIhYRNzDd9WqjNbfU7QVogaVnIqlXh24aTRaSC/6h2?=
 =?us-ascii?Q?sihHYzSIqZ1SoSQJpmQtCeOhqEULz9Sjz1wsLzTMLfs3v06M/SW2opFUqcEM?=
 =?us-ascii?Q?I0KDmIDLWb48UHJcTHOorzN0mc0NKllTTpQ9q1AeXmK9zcRzJsjLCGdjcA/5?=
 =?us-ascii?Q?HAXfFEr7JgzLvNIY/xPlOW44nyNrgwWaQP4RyD+/scCC4SxBY/yMbFfWGGcK?=
 =?us-ascii?Q?mEQSNpJ/Fnl8E7FqjWh6Iex4B+XJ+eysK8zS3AtIv+HLui678JMpX7W+hCQD?=
 =?us-ascii?Q?0y0+ZxVlVrRXF72r++DN45dB7fpyZtVm/XNIRasgs4Pb5NpVFvWeDjbJC5tw?=
 =?us-ascii?Q?FyuUvxaQCqIFogAeLtg7DEHja0LhK35ItAhrsOlZCcSoHFprT95CKQG7nI2j?=
 =?us-ascii?Q?6+h35oFKVvm6A7gNn+sepGoqygO7nBMbXl3N+SD3SAYmlK0vvCeMjS51uiSj?=
 =?us-ascii?Q?thBs+A5ur32z077MEGN/F8hlhhq9Io3XaHKhVkxDG6iWkamUAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x5tfrPCgvEiEyQdGLigGvPtt6mAMQyNW2drzKy/uK0Tf23TKnYK7V+FBYe9G?=
 =?us-ascii?Q?f7YvpdLheynX9COcUwj8KTeQYEYl+QtUK4rtV/v928d1n9FS1Y01dFoDPRmE?=
 =?us-ascii?Q?uzU0vXcyaKIaq8mwat3BtT0ut8oMelDpnowgoKBSpm2o0jqB1kppokx8HjMd?=
 =?us-ascii?Q?tgGsM0keCpvKs9W8CeA21DJ5tpPw/Nv9PYnH5C2+ewFUQ27QJRQIbNCOKRtc?=
 =?us-ascii?Q?J8uaOFlVYfRyAt9jJzPE1ImSCCjnEcAGRaKDLU2Bx7zPZpwrLx5nkZeixFHM?=
 =?us-ascii?Q?qqmTfO9J+85T+R1cl909eWq9FsvDCpaOQoJJXnzaMXmELrjbx1rmtZjZ2UM0?=
 =?us-ascii?Q?/mV4vA/7UbUPnqtTK6NCz4mbPs2z85bFBsSfA2jjEWynudDq2F20tiv6mUq1?=
 =?us-ascii?Q?+CwFtqquJKaHVoyW4xuGiRtjPPUDFU5mfrOyAylEu0fSaRjcQL140GDA0wph?=
 =?us-ascii?Q?c7F8qLDoouYH/ZivJcy413hCRC0rSb50YzJm8rrQUj2GVILD37fTL1zJohMw?=
 =?us-ascii?Q?F9Ugt38BNTx5txJAYEZpVWaG2H2a+ar765aNNRSEoZCw63ftvdGG4GJKQrkC?=
 =?us-ascii?Q?9G5SF1nu4/OODINl6/tjVZBCbQtGm1wMYk76fLY06LglIv1473i3ehyhNjYY?=
 =?us-ascii?Q?i839hQAjTvWX33l6/dY8qkm/jcSieQJ6L5bf8GXlDT6idvQ4vYuCqokMyVed?=
 =?us-ascii?Q?7nvdNeoNemjSY0JGYxBP6RfuRnALI5SSxyjq6Ac6w3tthz4BgQTQz2CSwzmI?=
 =?us-ascii?Q?MqcilHDSgCbY8+1mWY5AzdSk+xBvnH8OXK9d3qJ2fQJWxtfyCk5Rq7iQEDRo?=
 =?us-ascii?Q?rpGowCVYLKwjjAzWCfybcDHYGzjo4+ZRmR3DguabYXZfOWhS6jydIyMhTcn0?=
 =?us-ascii?Q?9y8EemE30Yo2OUT3Zjb2nHvyh4z+G+PXSaPiB1mgtpCqx/i+nMN/7FX6VNkY?=
 =?us-ascii?Q?sZJnkxI7pfaiX3sC/6rCpjPrnEig1wztnyW9kUftR0t30yAOiYR4yjgFxgkz?=
 =?us-ascii?Q?/93yKcGrhQIWWqGsFMFCZ8i2BOCMx0pePWaqsGq9LhgDrAhzzpP3B3kdozPp?=
 =?us-ascii?Q?5rspC4bMFFY7iq1mwqfhNgQxv10zKG7gWHA5WnXgbETmFU4BdnL/lshPZfNB?=
 =?us-ascii?Q?EWaz9NUSVT1mT6zgftu18WmSlIEbIzmwZLhZfDjZJEKHzFQ6fGCD4GE8jxMO?=
 =?us-ascii?Q?MihQtYgQCM71nyYFuZMBbgPyhUwEAT7eD37BTxGYODpyt7c4Mu0h3Z2vGzI1?=
 =?us-ascii?Q?KesD86J5fObhxXbKGVnHsIS5b29e431hKG5shRmvvP/DDVf2klo2nr/a32Gv?=
 =?us-ascii?Q?/JRWwWCUg9c0wKL18tebQnMgogcLOeqHb+mydYBAzN5bBv0GHE0fejPk/KMt?=
 =?us-ascii?Q?18II3a4+gfxgLMGTTS8TnBb4MC+1HAxuZxnobxK0NnfQuXn+RLt5k9X9YnBz?=
 =?us-ascii?Q?rsWfpLxL5gb5UKq5dzEvAgtAT47XmBuPatMmymP2YWSzN11QO1dwiAf16a6k?=
 =?us-ascii?Q?3sDNaDZr/zBZafrmCx0m202SdRkYHoa77iJR52nlSAoYFiUq4L65Lk4S3FoG?=
 =?us-ascii?Q?cc8/PaUzdp7PvsZYCeYPQcAa4fArDszsqIp15sZ7TVJnbaVEhnyZulrLuwcY?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KP9rLI3Zt+gqs4TiGW+tga9QqpbUOZznu9HEFjwrKNUGDHn6cgPOd0dsmCa4AgxMbURGiWUBv77I0516PZaTuyS0a/x4mDF+ALbZGnbwjoxlKWsDs2BoicRbDYPvGXeKLJHqb5GoZJKQR7S33Unre4Myrb4iq2FcXttv4Wg/JO/y4Bt0llTEMGL25BoHg4X1STpd0K45IEF9E4UksPKPasg50hUDFBDojINRrGWpDd/dBI49srqC7QX9ERHbhsiXJnqENcABNvPBcUl6biCjcoAmiCDziyth5wA8BPsO+21LuwtXeD5CCPKsoXO/uzemptN7/rHDaYrKZ1Sf2nN1DN47hUWzyuuEPCtYbgaEkAKXPJvk/sICYiFTcQe8ayR5KV37iih7/hwkFXiwZD2yeLbpKhX0f3yiVo4PTNfrPmI27cfuYUfGjn4wWsjfbA5q/eNOu3Rpk1d+YtPmmLrA4K7dDrsgyu5fsoiQvVFYqMktoPFsbgraMudnOrJoiclzk6V6md9vo3hm570UtEjZr4Dxz6vREVu35Q9wb80NQSOeOvChr2I6pRXQtw4Q94gncD4dnw7QF5Zru0NKvEU95NDoVl/rQrC3zFezBCnxg7I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a946fff8-fdd3-4110-7c1f-08ddb94c1fba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 09:37:55.8230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7q1r051c6UO7pRbMmDxxKKgOuA7Piaggma9Iunm+hhHlU36k3XqFW1uoEuNnEH0PCdkUp3szQmIJHLbL2NiWnoYwQSAnY3apjuKBY0ZyCY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5772
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507020077
X-Proofpoint-GUID: sIJqXrjijQfCTLFz7TAQXqmeO2Ar_cLQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3NyBTYWx0ZWRfX8Mp1C4u28dbH m6PQY+ZO+HCEywCDNdudblSQ12RwFOeB+46x2BbaF3/lHOQGNm6cG9k6husmKG7oSTxd/dX+VkL v83syHpzBMxAfvqcQ0PYSLKPn36JdrCudadFcakmcY9yi32/wvHJD1g/84brsALw2lHRgVJ26a1
 QpMpd4vVeivw8Ecrpgl1V6XtjxqiuPspnTUPggCS688ITgWc2RrxinCDmCtDxPnY06E/UI2+UNl f9WxwAfYo//MPMvN1r8g+TrHZ73lG2TQ9yCXC2Sixvg85XH/eeKaCQfBZu8Udf4nxEQwZcIOYTV 3cCOdP7kDFstF/laUxaSXPkzp28v5S0ex0lErrQUPccYSV/vxFwMnXt2nTNvK6590hNtuxFYcHU
 uP8O8k8zUkdGhOzujJ4ItxFVvP2nGzTAc8Rd/y0Gs+7Bmb5L1BeBkEpKNrZtRj/X8jPi/xGM
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=6864fdf8 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=kQmB-e16dhMsmKQ_q7wA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13216
X-Proofpoint-ORIG-GUID: sIJqXrjijQfCTLFz7TAQXqmeO2Ar_cLQ

On Sat, Jun 28, 2025 at 05:04:32PM +0530, Dev Jain wrote:
> In case of prot_numa, there are various cases in which we can skip to the
> next iteration. Since the skip condition is based on the folio and not
> the PTEs, we can skip a PTE batch. Additionally refactor all of this
> into a new function to clean up the existing code.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/mprotect.c | 134 ++++++++++++++++++++++++++++++++------------------
>  1 file changed, 87 insertions(+), 47 deletions(-)
>
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 88709c01177b..af10a7fbe6b8 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -83,6 +83,83 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>  	return pte_dirty(pte);
>  }
>
> +static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
> +		pte_t *ptep, pte_t pte, int max_nr_ptes)
> +{
> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +
> +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
> +		return 1;
> +
> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
> +			       NULL, NULL, NULL);
> +}
> +
> +static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma,
> +		unsigned long addr, pte_t oldpte, pte_t *pte, int target_node,
> +		int max_nr_ptes)
> +{

While it's nice to separate this out, it's not so nice to pass folio as a
pointer to a pointer like this and maybe or maybe not set it.

Just get the folio before you call this... you'll need it either way.

I'll wait until you separate it all out before reviewing next revision as a bit
tricky as-is.

Thanks!
