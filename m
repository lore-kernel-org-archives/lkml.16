Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654712CA9
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746698736; cv=fail; b=G8QaaOtzPPLrjs9aL1yrMoJeLLdCo9SySrHVIt+k8M8E+MJXIBw8dxmb+wsl8Wy31cBcZcLEytwYOlSRJvOh7RHWb1un1XKskPl4TZ/5N1dDa5XPIick9j3Rlqjv7AKQBy7QL3Uyh+0tODW8R7emjadx11n/vVfvtIfszacS+nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746698736; c=relaxed/simple;
	bh=KSsTJQvisymqpyq7FTm0BrHWjkCtkF8F+H7MSZz4+Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dWMxcb4hP0vtf1c2f10pj9XGqoUK4sC9nsm43WvCyx2Nn/EMaixIjXrQVpmq6a8owIJTDfZQqAZScxMsLRJAqaP6F2nXrlPzRfYFkVee/HNyOgtBGFlqig9xJdCCGd7uNykSE0oXq0Lfk3axlhnC7XPfXqHyNGS0bM1LtmNyXkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ppqb3lTC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SM0iKz/s; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ppqb3lTC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SM0iKz/s"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5489IvX4012827;
	Thu, 8 May 2025 10:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=HQyZZQln/RZntm8RYS
	NAwoaI/jlulUjrJlgLNF3ojXk=; b=Ppqb3lTC/Tqk47AS1gUrvjl4dm74Frx6T3
	8yOOJWHMDValkwyqQhotf9gQy9Jd6Ofef9QIKiuYDtNOcd0c0a6nuLzoQZFmEvvr
	/VubTutvxPk1eeKEUhykG0YkWtwU+08LE2caOhV7Y+mWGzZRycc6MGMjMwavKleT
	6vYPaDgiM//j5zgJzBm41CXU1G+vBDWlw/ugPUH69vr9CLnH+Bx7MlhXIgjV/yQ3
	v3vdq1qLCrEBMF7/fbWhSVOLn+z+aYtCmbfSGZy8gUvYy6Cgyf+0boo1kkMwtI43
	xR9II7L3a2VoZRtP4ssF+SyfxSWu80e8N/5zNE7u0fHPEBUtDYvQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46gsvd027a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 10:04:45 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5489j7so007302;
	Thu, 8 May 2025 10:04:44 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azlp17010006.outbound.protection.outlook.com [40.93.10.6])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46fmsa3wnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 10:04:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7AiQTClId9T55RiDegOsIftHxuWoMp3GrHh/9daiHqXxWNkvEIsWMNuQ0RcdAWh0xab+IA+Uc7hE4yhJ8buY1cxLVX73SmyBiv4xgIy3qdCpxkWnr7H2hc1sfYiEf4n7+hP4wDTAoqZi6EQOCpP79iAoQIwMfh3vHbtBCxmUbs6KSuXYZgz4KaFOPtjYOuLpWQTgQrKMAQkPbY8NQ6w3SbAJnYLtLtMGBV1WvyGRjwz6vfm0lLaq3EnLtePcutE9WLFPGKln5dCWIYAZ54y6HZddj4DFYika4paHdAuADlD6WavLIf63/MNCQe5fzK+W6fNLwmh7OCPqpuiLFDyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQyZZQln/RZntm8RYSNAwoaI/jlulUjrJlgLNF3ojXk=;
 b=ViWNWxii+oveYec/Iyjv4VYnk6SDCTT8YBaA4MqvmUAKLTSF0grzzyfN4RC6A2Mo9fSug7K0+pRQg6AZWBe8F81PaRiOIIyJaJiMyLZkYZJ6gPSDFvhLEGnJSKyyeBsM9PP51Zd/7CuNMainiQDfyw4lSlZHOt/ADngMi6zt781m25IEHAOurJpglW45jdTBBMY8F3d27iwh/KgL9VhwMSaKgirJcSQrmQIg2x+kY7t/1/AJkme5nwxHKu0xHxSC/QAT+F9TPzIE+QBhR/HpEpA9VOftRcm0pPfw+XBP85BTbxKVfuHZ9XX0YA5Kfxpv2uvLruwoxw/4bh4If01JcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQyZZQln/RZntm8RYSNAwoaI/jlulUjrJlgLNF3ojXk=;
 b=SM0iKz/sxImKaJoEuapq2ijNrQ2DDcPfAHItHO/afPOu9qA6Dj2DhYgOjJ5ABqGx8EcJ/R6qYJLVHBBFyy/pwe8HEM/Xj5jriB12Zu3FNP1E9fsGQSok4EIYoPGRpSsUBQLT5IOphSD5BINLK2caH6m0Lg9liI7CVAeAm/5KgEE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB7587.namprd10.prod.outlook.com (2603:10b6:806:376::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Thu, 8 May
 2025 10:04:32 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 10:04:32 +0000
Date: Thu, 8 May 2025 11:04:29 +0100
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
Subject: Re: [PATCH v2 2/2] mm: Optimize mremap() by PTE batching
Message-ID: <fdb76016-396a-4ee4-9c9d-beb18c86cfdb@lucifer.local>
References: <20250507060256.78278-1-dev.jain@arm.com>
 <20250507060256.78278-3-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507060256.78278-3-dev.jain@arm.com>
X-ClientProxiedBy: LO4P123CA0315.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 716cdbe2-1a7b-4ad7-1323-08dd8e17baac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JlBD1v94wwdWzOYGkeGnB7TWI9pSAmukn/FubLl9Btbnaclm9IKQ78/gz5J6?=
 =?us-ascii?Q?IzKYsyjXZq6FEGqFJRDpL7KITNGF/hnSnbMPaH7C+4WLx7Xif5jfZr3El2qh?=
 =?us-ascii?Q?mMFHYp5fMgdN6tYRkx6no/bIUMGehFd9sEzslmYTJafNExLCwuGvkZXdBfe7?=
 =?us-ascii?Q?oLSf6p6/vOO8eYnm8rvPSm5h0qzBAQZcDAVBd2EFLsCAvnUJYaddfmknPKJq?=
 =?us-ascii?Q?0VvRuhgaykbfE9Bj765q4dhOy92AH+k/cE4qSlGL6i+F7dP9GQGO3ycXZSZR?=
 =?us-ascii?Q?iD7w5VHVy11sDTy/3S5BKhMZ284g63X0HHTaoZ8+IswJtdNDM5f0zftu8Ymg?=
 =?us-ascii?Q?MuN5UIQBUY/NUhT92THh8NTOeS3kLTx7u36vs+3EKcdZDcybn/tu/95zposh?=
 =?us-ascii?Q?+Ds/YpUo0RnmrJDAgr9rO6niLOuKandmwL6XNuB86OcROc8D/DcQtIoUWwTn?=
 =?us-ascii?Q?QcXhDYZeVvTMuM4savZsmjFIEihGGXZrDZXTk4Dci/ykcfsG5IlMkTeRuAQf?=
 =?us-ascii?Q?jWJx/Le386PiPoOmGyOKsEb7F0OJw1+3aXicUMvsdN1TnGMSAosEBwvNpPnh?=
 =?us-ascii?Q?nn447GzyAXn6w/67xHyP9Zmh9JKiJaSXXYpZxMvm7UaLIYuxOzuuWdT3o9Hr?=
 =?us-ascii?Q?JZwE7lYfWlJENjLaLhXVEx2aeej0E9H9iAhyFM613TiM7YJgLqCGP+1S7SRC?=
 =?us-ascii?Q?+bvewghcDTV3UH0CxpPtfQGtOy+NMESQuLpYy8DXgwfzUI6Ebx+werU0n4ku?=
 =?us-ascii?Q?5cd0slDhXeHQMORgcWbwYfzgFkk7WT9lGhW+u2YRwqGLzGT876T4FjtQWMwx?=
 =?us-ascii?Q?4lokqAuflIimRAH3rkLohbrw2pPovAbYwxpL3Hr35TfIADO6zyKRLkn0zH8L?=
 =?us-ascii?Q?WIVO3GzC+Oh3yx/GjuAZsnCihELtjnrrd0Mb3A73NhJFx9xKGxopNcRttrXD?=
 =?us-ascii?Q?MHPWDxYS5zzSYfcPJuWT06jyR1muTWT4okA3VMoPO5md7wM7GSJqEMQj8eaH?=
 =?us-ascii?Q?pnywYodbB1qPebclx26xDUwpZqRFju5phnpr9FXGRO9hhSRUeuPg24WXMg/J?=
 =?us-ascii?Q?YVOmb2rwSIK9E/ZPfRCxCILafAUK1Sr6y6Kh0KYyPlrVkwsK/RNRbbwzezCE?=
 =?us-ascii?Q?iKJqIzdHfmLSLFRqOow/8k7StcRpn6kkjLuD0OlL6Obwk+32D+Pm6ElrUc09?=
 =?us-ascii?Q?VTP8H2O59XJpeXz55Ptay58F6W/nujn/PNepwKfUsfaOwehKibc/Jivb+/JQ?=
 =?us-ascii?Q?rNZLMaevFoY4ccnXp7/y4JNjISfw9I89Q2AM117VK3ezwCBapGaouX+Nroxm?=
 =?us-ascii?Q?LZBMdR00dQi7oCSZLq9tZzawRh+TTO2RIRDv+lJQKhSIOna6weGio7MbBt6Y?=
 =?us-ascii?Q?vuPS/oD1RWe8NCGCU/nYU5uttd9KjzPKMl3qtsK0gwBAmHown/mbZbSbBaGG?=
 =?us-ascii?Q?fLzCbiI69pc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z/YZ6jwdK2OZy/82XAI93fzJx0Zpqusu2Or7S1nTktqBNe+mxtV1NrejTNnJ?=
 =?us-ascii?Q?K6K2Sv065a/tfqCERHUPvhKRL6HdCvAkr1V7N0gVk+ebStZRzKDf2Ha4Z8Uj?=
 =?us-ascii?Q?qIHm2xqiEqq9eO35gcoZLLy4nm0Iy5LGOUTcaZp95A1/v7pH5lw4M52Vwt0z?=
 =?us-ascii?Q?js+Xmnk2HmYDgYaH/UOAWIhIqx2F/lg6TPo7xEsfa2cMixLeZGKw8n+2KDAd?=
 =?us-ascii?Q?FZRL6BP2L8uMHcAUNf/7gY8jGvbByeBzlfwgfG0zEzA9n/TqmKnHM8NBQgvj?=
 =?us-ascii?Q?u2x5Wu57z5NRCeApp09NnEY5D5haG0zzafrZST1PKZY+sqKNb/S9Zdr0O5hl?=
 =?us-ascii?Q?3uEAlcQ41pL8TsyGhiJOP29R1cv09q9OmlSg2P8RvyIQRobMs+JFN+EIh6xL?=
 =?us-ascii?Q?fMH+xRZyOdN9vygUekzOwG++rm7xzrWvGLGl8GQN0o43diayNRdm4juuSzwV?=
 =?us-ascii?Q?SWzKzGiotfO42oH6KLogc7BAzt6v3/TV30CUoKogMUVq1/tD6dgm+88avrok?=
 =?us-ascii?Q?HFAd6HJU1DEQN9FCPfATcUn8XBIXXruP7ihIAo1vUcjDCc+LszyYRGaWSZRx?=
 =?us-ascii?Q?em9RJYt1pzS2qJdI8MxRwNY4o3sbtQ6SuovtAZsdMO6kgEHWFqLiMJJiahZi?=
 =?us-ascii?Q?aWkZXZ3LCS1xKv5HU6WHzBOgaIqQnzr6PAMtNVG2A21p12M5Dut+7rpUTEu4?=
 =?us-ascii?Q?CdBYzE6etenqOAfylBujJvyFppdGOm5hyDDDKqBbWMpzzNeIef69fZXt/bv3?=
 =?us-ascii?Q?WEZLZ9QKrLo1/D57Pfm6jfVvgDblVFKOkeKDc+5EwMqZGqpedltqxQmxYrqI?=
 =?us-ascii?Q?X/t1FIhkqXizavLJju/kclbVrVPxTN5k+yE8hu595vXNBHLkhgW6zQvYx2fp?=
 =?us-ascii?Q?iRkdgrMBhIH92b5eNGIBxaYXs74nxQd/yl1H7D7Tj2QFHf0bCLrVav7U0kk5?=
 =?us-ascii?Q?jVRRpidD6Vzaj1D3qq9jwmeONT46ZTJ7oV2at0yC69CGLqPNofPSf6SPBydk?=
 =?us-ascii?Q?cNuI/xRUkto2PMC3HQvd0F4aa1YuHgASYyU5T48PJLAql0k0LQLqp2PYm9W5?=
 =?us-ascii?Q?fMZewdGrsV1VTJW+w2DNJBrTENBY6qwNpKiJAXanOEJqPDLpu9zgPQ3cpIU5?=
 =?us-ascii?Q?Q4m8qkfuiWnO63yxSM6XULDXn6yTZtzw4wQjGbZ2R7N9KAUUnbJqLgNrkRdn?=
 =?us-ascii?Q?uEUvR3E8Gtf5vTjzC3cyIORkyY2kv7LZ0BJ2DF2OngXBMc5GfUtrffy2CxGc?=
 =?us-ascii?Q?JohaWYyXy2n63J8k78LHwDH3JY21MTc5xGa9727kB2FOF+jBF2YZG1jFmFMh?=
 =?us-ascii?Q?YWXq2sjyWuXFyEsQ2LNopGdmxPxT+ND8DW31nTDUJ76OEXjQw2SsFMw0MxCr?=
 =?us-ascii?Q?MYJtm2LCsXZogQs8Oq6574FD43eDYmrvQFkZJ4R1Icijwqk0IAjvleef7gjc?=
 =?us-ascii?Q?FAMvm5qO0h5kyNsfdt7XQoLoGjipxKXdGE3tIrBRS4WaovGbxQuW7tF3X7Er?=
 =?us-ascii?Q?3M2G/8xDD43XZqp1mqd07cPdIRcNbG2kQAKZkgJjV71h/fY7GFLENL46IZ2E?=
 =?us-ascii?Q?DHYIyrqDrP2vmk6rX4AILQGeFu5EmyLzO6bAGFldLnjhGHhBPiuUOS7ztLGB?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4QiOghxH4wSkZMifUzoEUTeuki7BO6LmnDd7dq8wo69AEMQn2R3LyazswE9GXj+yGba3fNoneK6SO0ihf3SbpDQbC5A4hsL17hzPI/30tmRWOJQTYvMAJHkUwRmpvE3mShS1Gy/kVbNIVsLazuXaYV1WCuUJzVnQial9zUaOnWRcsS8WQld1JkQm4BH1xhHYRcfO0dUF/zM8Q2+Fm3eRuHEtBwQ2utBCF/RhR2LYZVlZMCNiIIv7aaWJ+RF/jrPcoOrtQvchHJB0tcgObQP6jxKDqalGsd+A3u6YtGVc5ZsKmXSO/DRhSfhuqqD+wYcjRpmotAxbeSjLI5qemTvm/dQVDq1r20I+DDC3CFyR49ztaujghLm7EZ1OZsaq1SgiTiFVNeqiTuF30UgVI4sF40pVj+9XIi0QwmKKZb+4nNFJEy9WXWNyzy4N97tchD2M4DYzAyakyx7kSDp9j1yFebBHsPWP68WbDzzqDtUMKbzfu2di4cjqZhMe75jWAcqnzjVoxUJnxhOFFNwS0Ch8vzlZHZ2S3F4ih7kTvcwee+RaIFvrntDovsQCYMc+rieYA/izjqqRYN+3rj7kVKEYoe/98rHUWhU5/a7+BLaiHqQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 716cdbe2-1a7b-4ad7-1323-08dd8e17baac
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 10:04:32.6975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/Z5sQj06nEe+a1yyXFyeX5XN8YZQPAi0uMmoU1pJzuLhxXcbCLt5HsQPtJaAzyVmz51G7m++97ccSVUT6zuP/dC7vqY1Qu4GebO86aQboA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505080090
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA5MCBTYWx0ZWRfX6Uq9Hud/mirb w6xxRn6fT4nUXf2HUeqVjtEy9z4C2aaxWXWZZZLJ4Gb5lp5tDgWOWEUXEGVFaZItVzI8N8dA9IY tRhkhhMRS0ssrPo9WzVBC8Wo2A+zj6aE0EMrZk7YG9AEdVu2lUvqerOKLNBHUz6GNApQ80o7+sQ
 AoGD0WestvYVn8exdS6h5uiHMm/E26z+CUEtGXEEw5y9lycQ3YIlivxYaTPXgYSiFwoDMuH8RHU 7evr4yKLwMKwIq9xuKSd7cosBOLPGexNe7SFtnnjd+fK/xahjy0/EpZUW+kBSz9td50lCEAfTtr rLpTiC9NfjGttUlRxC7LbwNrR3WUpUslHkSv5NlxxIbofWRCd02iHLccWaYbDDh0JZB6fps6XiH
 t2jHr+hG/TDt6Ibvq9qy+WpH7clahrigSGBpZc3pol7+pgmnQHbNSk0PMiFk92Pl0LqzNvPh
X-Proofpoint-GUID: yaZA7i5x94NZMqAhaWwK3e5y4pFHmpc5
X-Proofpoint-ORIG-GUID: yaZA7i5x94NZMqAhaWwK3e5y4pFHmpc5
X-Authority-Analysis: v=2.4 cv=R68DGcRX c=1 sm=1 tr=0 ts=681c81bd b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=7CQSdrXTAAAA:8 a=ibfd0kon3zwyWQJt6nkA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:14694

Before getting into the review, just to say thanks for refactoring as per
my (and of course other's) comments, much appreciated and big improvement!
:)

We're getting there...

On Wed, May 07, 2025 at 11:32:56AM +0530, Dev Jain wrote:
> To use PTE batching, we want to determine whether the folio mapped by
> the PTE is large, thus requiring the use of vm_normal_folio(). We want
> to avoid the cost of vm_normal_folio() if the code path doesn't already
> require the folio. For arm64, pte_batch_hint() does the job. To generalize
> this hint, add a helper which will determine whether two consecutive PTEs
> point to consecutive PFNs, in which case there is a high probability that
> the underlying folio is large.
> Next, use folio_pte_batch() to optimize move_ptes(). On arm64, if the ptes
> are painted with the contig bit, then ptep_get() will iterate through all 16
> entries to collect a/d bits. Hence this optimization will result in a 16x
> reduction in the number of ptep_get() calls. Next, ptep_get_and_clear()
> will eventually call contpte_try_unfold() on every contig block, thus
> flushing the TLB for the complete large folio range. Instead, use
> get_and_clear_full_ptes() so as to elide TLBIs on each contig block, and only
> do them on the starting and ending contig block.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
>  mm/mremap.c             | 37 ++++++++++++++++++++++++++++++-------
>  2 files changed, 59 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b50447ef1c92..38dab1f562ed 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -369,6 +369,35 @@ static inline pgd_t pgdp_get(pgd_t *pgdp)
>  }
>  #endif
>
> +/**
> + * maybe_contiguous_pte_pfns - Hint whether the page mapped by the pte belongs
> + * to a large folio.
> + * @ptep: Pointer to the page table entry.
> + * @pte: The page table entry.
> + *
> + * This helper is invoked when the caller wants to batch over a set of ptes
> + * mapping a large folio, but the concerned code path does not already have
> + * the folio. We want to avoid the cost of vm_normal_folio() only to find that
> + * the underlying folio was small; i.e keep the small folio case as fast as
> + * possible.
> + *
> + * The caller must ensure that ptep + 1 exists.
> + */
> +static inline bool maybe_contiguous_pte_pfns(pte_t *ptep, pte_t pte)
> +{
> +	pte_t *next_ptep, next_pte;
> +
> +	if (pte_batch_hint(ptep, pte) != 1)
> +		return true;
> +
> +	next_ptep = ptep + 1;
> +	next_pte = ptep_get(next_ptep);
> +	if (!pte_present(next_pte))
> +		return false;
> +
> +	return unlikely(pte_pfn(next_pte) - pte_pfn(pte) == 1);

Let's not do unlikely()'s unless we have data for them... it shouldn't mean
'what the programmer believes' :)

> +}

Yeah I'm with Andrew and Anshuman, I mean this is kind of a nasty interface
(I mean _perhaps_ unavoidably) and we've done the relevant check in
mremap_folio_pte_batch(), so let's just move it there with comments, as this

> +
>  #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
>  static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
>  					    unsigned long address,
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 0163e02e5aa8..9c88a276bec4 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -170,6 +170,23 @@ static pte_t move_soft_dirty_pte(pte_t pte)
>  	return pte;
>  }
>
> +/* mremap a batch of PTEs mapping the same large folio */
> +static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
> +		pte_t *ptep, pte_t pte, int max_nr)
> +{
> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
> +	struct folio *folio;
> +	int nr = 1;
> +
> +	if ((max_nr != 1) && maybe_contiguous_pte_pfns(ptep, pte)) {
> +		folio = vm_normal_folio(vma, addr, pte);
> +		if (folio && folio_test_large(folio))
> +			nr = folio_pte_batch(folio, addr, ptep, pte, max_nr,
> +					     flags, NULL, NULL, NULL);
> +	}

This needs some refactoring, avoid nesting at all costs :)

We'll want to move the maybe_contiguous_pte_pfns() function over here, so
that'll change things, but in general let's use a guard clause.

So an if block like:

if (foo) {
	... bunch of logic ...
}

Is better replaced with a guard clause so you have:

if (!foo)
	return ...;

... bunch of logic ...

Here we could really expand things out to make things SUPER clear like:

static int mremap_folio_pte_batch(struct vm_area_struct *vma, unsigned long addr,
		pte_t *ptep, pte_t pte, int max_nr)
{
	const fpb_t flags;
	struct folio *folio;

	if (max_nr == 1)
		return 1;
	if (!maybe_contiguous_pte_pfns(ptep, pte)) // obviously replace with open code...
		return 1;

	folio = vm_normal_folio(vma, addr, pte);
	if (!folio)
		return 1;
	if (!folio_test_large(folio))
		return 1;

	flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
	return folio_pte_batch(folio, addr, ptep, pte, max_nr,
		flags, NULL, NULL, NULL);
}

I mean you could argue assign nr would be neater here, but you get the point!

David mentioned a point about this code over in v1 discussion (see
[0]). Trying to bring converastion here to avoid it being split across
old/new series. There he said:

David H:
> (2) Do we really need "must be part of the same folio", or could be just batch over present
> ptes that map consecutive PFNs? In that case, a helper that avoids folio_pte_batch() completely
> might be better.

Hm, if we didn't do the batch test, can we batch a split large folio here ok?
I'm guessing we can in which case this check is actually limiting...

Are we _explicitly_ only considering the cont pte case and ignoring the
split THP case?

[0]: https://lore.kernel.org/all/887fb371-409e-4dad-b4ff-38b85bfddf95@redhat.com/

And in what circumstances will the hint be set, with a present subsequent
PTE but !folio_test_large()?

I guess the hint might not be taken? But then isn't the valid check just
folio_test_large() and we don't need this batched check at all?

Is it only to avoid the split THP case?

We definitely need some clarity here, and a comment in the code explaining
what's going on as this is subtle stuff.

> +	return nr;
> +}
> +
>  static int move_ptes(struct pagetable_move_control *pmc,
>  		unsigned long extent, pmd_t *old_pmd, pmd_t *new_pmd)
>  {
> @@ -177,7 +194,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	bool need_clear_uffd_wp = vma_has_uffd_without_event_remap(vma);
>  	struct mm_struct *mm = vma->vm_mm;
>  	pte_t *old_ptep, *new_ptep;
> -	pte_t pte;
> +	pte_t old_pte, pte;
>  	pmd_t dummy_pmdval;
>  	spinlock_t *old_ptl, *new_ptl;
>  	bool force_flush = false;
> @@ -186,6 +203,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	unsigned long old_end = old_addr + extent;
>  	unsigned long len = old_end - old_addr;
>  	int err = 0;
> +	int max_nr;
>
>  	/*
>  	 * When need_rmap_locks is true, we take the i_mmap_rwsem and anon_vma
> @@ -236,12 +254,13 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	flush_tlb_batched_pending(vma->vm_mm);
>  	arch_enter_lazy_mmu_mode();
>
> -	for (; old_addr < old_end; old_ptep++, old_addr += PAGE_SIZE,
> -				   new_ptep++, new_addr += PAGE_SIZE) {
> -		if (pte_none(ptep_get(old_ptep)))
> +	for (int nr = 1; old_addr < old_end; old_ptep += nr, old_addr += nr * PAGE_SIZE,
> +				   new_ptep += nr, new_addr += nr * PAGE_SIZE) {

Really nitty thing here but the indentation is all messed up here, I mean
nothing is going to be nice but maybe indent by two tabs below 'for'.

I'm not a fan of this declaration of nr, typically in a for loop a declaration
here would be the counter, so this is just confusing.

In the old implementation, declaring nr in the for loop would make sense,
but in the newly refactored one you should just declare it at the top.

Also as per Anshuman review, I think nr_ptes, max_nr_ptes would be better.

I don't think 'nr' needs to be initialised either, since the conditional is
'old_addr < old_end' and you _should_ only perform the

> +		max_nr = (old_end - old_addr) >> PAGE_SHIFT;
> +		old_pte = ptep_get(old_ptep);
> +		if (pte_none(old_pte))

This seems broken.

You're missing a nr assignment here, so you'll happen to offset by the
number of pages of the last folio you encountered?

Should be:

	if (pte_none(old_pte)) {
		nr_ptes = 1;
		continue;
	}

Or, alternatively, you can reset nr_ptes to 1 at the start of each loop.


>  			continue;
>
> -		pte = ptep_get_and_clear(mm, old_addr, old_ptep);

>  		/*
>  		 * If we are remapping a valid PTE, make sure
>  		 * to flush TLB before we drop the PTL for the
> @@ -253,8 +272,12 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		 * the TLB entry for the old mapping has been
>  		 * flushed.
>  		 */
> -		if (pte_present(pte))
> +		if (pte_present(old_pte)) {
> +			nr = mremap_folio_pte_batch(vma, old_addr, old_ptep,
> +						    old_pte, max_nr);
>  			force_flush = true;
> +		}

Thanks this is much clearer compared to v1

> +		pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, 0);

Nit but...

Can we have a comment indicating what the last parameter refers to? I think
David maybe doens't like this so obviously if he prefers not that fine, but
I'm thinking something like:

pte = get_and_clear_full_ptes(mm, old_addr, old_ptep, nr, /*full=*/false);

I think we are good to just use 'false' here right? As it's only an int for
historical purposes...

>  		pte = move_pte(pte, old_addr, new_addr);
>  		pte = move_soft_dirty_pte(pte);
>
> @@ -267,7 +290,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  				else if (is_swap_pte(pte))
>  					pte = pte_swp_clear_uffd_wp(pte);
>  			}
> -			set_pte_at(mm, new_addr, new_ptep, pte);
> +			set_ptes(mm, new_addr, new_ptep, pte, nr);
>  		}
>  	}
>
> --
> 2.30.2
>
