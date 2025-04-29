Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EBF1519AD
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933042; cv=fail; b=KuCL9/c/urAeMr42MR/CUkh2ekWThQpoIS7AanIqiB5Pi5cunbXpKGmPmtfcdt6ef8DvGeTscohKrn3CEHU8yGK8RQa1K7lSiqjDZVzXVZO2Kae/NbH+OGT1eylIN+oYOUDY535Rkb5VRKODldrgecx6Tyw8I8xP6otuM791aEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933042; c=relaxed/simple;
	bh=lR1YY2GG8W+gX4gulu5XZGzQvhbMGDQ7ytKedxh7hjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dlitqb7Wg64QERfoReK+2eVMQRcljaDmy5PfckIkDpJa877LtVMa0DzKUbZN2fCmgK26+E+rTbRhY/RsZhl6E+UunTgDTJ4CSuBNf+sWOfXIb7PenqlrxZzLUjlUB3szcZ0j2EWpijjBioyNb7wuf2LUMkohZTsxrYg4ul7uLgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kCbdZz9k; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EIGYtRk5; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kCbdZz9k";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EIGYtRk5"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TDLgm1015199;
	Tue, 29 Apr 2025 13:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=qv2zJ6KwOIXz/KC+DQ
	BudN++GR3ZxRd2dctPkQyIO80=; b=kCbdZz9k2wS9G1vICO/h/gkMP0l/moLM0w
	xxFhfMbjIZPGsBHKH91odncfEr1FjkxrxM4+1KlxTugHft9dGQbO/eNhWEsRG88h
	i0FRCLmSQRCZaF/lLXcU50CZ00gdBlbplSqVW1MByoXU+Rmt4LstlvS3HQV2sQfx
	yJo9OYk3PpPpqvYx+LY7YFsq+dhORtmx+Y+lszMXI1JiQ/j2SvGdvRkIupoPdnlV
	jdZwjUjvPF57s6pf7IaxWJfCvmKBd8NY7LFhGts8+NHyHsA8f0WSM+zH7cLIa48R
	V6WDjqg7lcioFziYoIEudVvQ94QC+bt4lWPIosL7y750fzh07R4w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46axmwr3xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 13:23:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53TCbZ6b023747;
	Tue, 29 Apr 2025 13:23:28 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxg3csr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 13:23:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD8ni9xo7AZmmFLziRCs24fZcmcXTq+MOAt8SBreczLx8Zl2DLYsd3HMNfuM0Zxqo8LIRgKL+Bj2d6Lyi3CfVfSL5bXy0k5EgV2nGTFp8Nl6CUfxE7RvpywmBPHIa6eGacEqYk/9FGB3IYlOyaWeacBQUlPN+dTSdn8mCdixtrM4lMM3voPiVqnTFiCBr27K6dZeg89NEypOwVGwVz3XEEVKHMCQEExWGQ+PfJNbxF2/FNG9AWVVM7SGTKt9ZhWhjBT5mXVYzEi16xnJ1fEeIsfnHCqLswttbl6CVMZ4QHFkXozs/PeVUHaOiVFNiX3BNr8zz29YzHdLC6wFFbeqcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qv2zJ6KwOIXz/KC+DQBudN++GR3ZxRd2dctPkQyIO80=;
 b=L2CsTK4dcNpZFECkh3t1BjrcYmdeaR7+WV3urR3KMISH0Qbwc44jacdio9A74CjSCYOBKrJWlvyS+4RnCnzzkB2pphtjMDY7Woi+Ab1a9LEv2+WW4os84bWTiQNYohJetCAygY/iWrpE+N3FiYX4plIGQ+XCGFwf1+JindUltnp2zAdzQq68DvzIs+BLAgGK34HhWsNhxAy4quK5UZcydt7jp5PC7l78Yt1TVRcPm/aIY5jbMc/f9zNKPFCH0dLqKoa8cidfrBHD4Ub0gvWLVdY26wCpt0jeq+fGTl43JSeiXrcxw5PPwSxQ2P4omyjd7xARSasNNR7G/B15kR0QwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qv2zJ6KwOIXz/KC+DQBudN++GR3ZxRd2dctPkQyIO80=;
 b=EIGYtRk5zc2c5Brdl+Os7PdAmlXDCvlXP8qecNzh+sQ1q5ZzSu/PqL60s/xd9QKh4noQvqBB0YxrApgq8ohmegYjRN57xmm61A4BvghS+TU4x7EgX8mf0ZXLlyQeMEomRD11OaEYGWkew/x8bZMpIOFbn3+lIM0+rd/cVX2/G4c=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA1PR10MB5946.namprd10.prod.outlook.com (2603:10b6:208:3d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 13:23:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 13:23:13 +0000
Date: Tue, 29 Apr 2025 14:23:11 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-um@lists.infradead.org, ricarkol@google.com, Liam.Howlett@oracle.com,
        richard@nod.at, anton.ivanov@cambridgegreys.com,
        johannes@sipsolutions.net, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 00/13] nommu UML
Message-ID: <7271fdc2-5f3f-459d-ad64-b0275265fe2a@lucifer.local>
References: <cover.1737348399.git.thehajime@gmail.com>
 <f4242067-0113-432e-b8d1-d26ff5e4a355@lucifer.local>
 <m21pte6z73.wl-thehajime@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m21pte6z73.wl-thehajime@gmail.com>
X-ClientProxiedBy: LO4P123CA0360.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA1PR10MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: ae600a3c-b55e-4432-660c-08dd8720fe81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jsYRDrEgzn9b3ito8yiC198NLZtaCxXMxYVAIQK5DONXm4IOgvfI7+45He4m?=
 =?us-ascii?Q?zb/1eW5xpe2yglmE6qu/tZ7ghWfgus8HC2oY2qb0//KYjAgfHfZ0X5uYxaC+?=
 =?us-ascii?Q?+qDeNvqsHi6bMOQI7c5zF6SJkYFrK07n+7HsDOrJXDYN7ueL9QL8TfDyqpyn?=
 =?us-ascii?Q?fqo48mLFwOQrBWQy+GQ0lt32cSIEU5bdendZvCoDmzGwvHTLr3tyH1yKXf0S?=
 =?us-ascii?Q?n3mMx4GsF7pprVD1Ekd5onaLhL9V7vsVsuQFZtRevMJA8DkO09xTntzfMuHf?=
 =?us-ascii?Q?YvVXt5vn/6JuNiOOtYiaBryWAKDucZa6HjbhNu47gSp4tOTSuRzlw0jCldz9?=
 =?us-ascii?Q?l4couMNfJx0UTZr6YjW1YTSHk9NBcjK96qeCJYK2Az7pzt45FWlLxFsyxaMn?=
 =?us-ascii?Q?wmBX5mpw63sVlYDVCbHgWQSG12RlwpgJaj4GkwOJcj65QnLKTC5iHAgtGTsI?=
 =?us-ascii?Q?KCPXnpuGM+lgSn3u/Bfgm6rIfk730GtRb4sk1YZsfaoc1FDc32Wg8wLHEfGo?=
 =?us-ascii?Q?vKPXwPHDCfp+4WiWpUow4GQdjwhxq5ftKPv7DJVUFEFzRAUcy4T2Cw+b1L6L?=
 =?us-ascii?Q?Jlj//yRxiIa/nYPAlMEvMIjmWQsKYJvpHcFW4liMaE4s5O5vgKAmmDOnEYCs?=
 =?us-ascii?Q?qLp1TWyCyeeaA2K3VUjOqb4s/CyCykyBUJYFPDd9Uu3ViyUMClxtjlAvwj5C?=
 =?us-ascii?Q?z9o9brHeo3lbMnqIcOLUsczkqkAKJdHZeq/pQ2FrTOEzD37noLrU5rfp8dTR?=
 =?us-ascii?Q?DyMBefmw3F0b4C0uuV63hL8pNecfckPkPL42gImtxX9HGkq1jW59dMJ0P8t4?=
 =?us-ascii?Q?6JfMlAibNMubXWHCDHoST/fdDgdWWkmnTFSdfQcvl+8lF0zV0lyLqEiLSNPb?=
 =?us-ascii?Q?Rgr0DJ272L8NeINbbxIIc1zXCQikwEl8AZZ5Iz5VsU4ueOuRD5DBp0IXeFO/?=
 =?us-ascii?Q?0hKaA9mXJkXkNETqxaJn12tSEGL1QIi95+vp8fbFDC3nKCztXKLq6HG2Zt18?=
 =?us-ascii?Q?xPoq/w+Cwy9d5TvenCX5Mh6E9I3LP7edIRG0eROruX5fK1h6lO/I3yPwhUsV?=
 =?us-ascii?Q?K8BCNFtSjkBEbr1h8dtB9UVJIQjFOSqNtrcibDb8rKIUYVbXGBsCJYGrf5H2?=
 =?us-ascii?Q?nm2SCzLsSEYQtDx+inIiNIUR4o9UljyjBiknGhhmU74xXIxh/KM/w3JCKuZu?=
 =?us-ascii?Q?a2/3VcGyzOlUG6LHCXQWaIgJCJygnnz5Rpi+QSKriQincihM1NRYoD3FLS/z?=
 =?us-ascii?Q?kvjXjQ5wPF4aKo+0qH5ebsKf+mtPy895jdcWGAoD0Hrc7iy80tLt5immE9Nz?=
 =?us-ascii?Q?bh4W//nGc34GykhAsNAz80+nVKlGY0qRdzlYrfAIGeuKrRPply+KkkUmTQyp?=
 =?us-ascii?Q?Soh0khGj8ozFGVm9v66NPbYargj/DrsUJY+2h6WgQRUBX5O2JQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wp5TBxf1oKQSzQkgX8J5oA11FvE5wXHdKHicuIyX0zV810xyCizacUL0zULF?=
 =?us-ascii?Q?IQqCqDNQVIl7qRgbNMcASjDcyLq7olGJcYtgelLLRzmpqAT/uW6IsSYnhoyn?=
 =?us-ascii?Q?xz2BIG/ZcAZq9naN4I2aW0YLAIPKnhFtrFibHW0aaoMm5KZ9pRoHcSo67Gzp?=
 =?us-ascii?Q?hCBYbOrJHVHv8ElyvOPFIQnXpG2/MQJHHsVpy1ohwXfOPVofTPCXEa4N3QYF?=
 =?us-ascii?Q?kBFtAFmM4k9y/JehKtYTzlypnPo9vmpVJyAX0Y1KYkLewhG9+rN5iVzwomUt?=
 =?us-ascii?Q?DEg4KYedfk+f7LkyNr8iDjHwontGemLsikqo50OGAsr2/ERvamG2xVQTuirr?=
 =?us-ascii?Q?87lvf6pjPNg2IJVu4M8c39ApudV6+FDwBPj94ee6uDDmxTGzFhx6FVDfiU2a?=
 =?us-ascii?Q?0LEWObGwQTcfJ9ReWH0TtAvBoTVtD3S4I2Y2LoS7nMR8zhe0VdrDmtBUVVfZ?=
 =?us-ascii?Q?oCmLjX/W0txtvUfRNmEgPhyJI0P78Is3drnVqoikvM/TOBON7NL9cad8WVkA?=
 =?us-ascii?Q?5tQ14CLbnEJhUEskaxhtF0TjsXrgNgcN3Qa11VeSoFJYAYF5kDqbo1huPVTy?=
 =?us-ascii?Q?JY61jep/5MWUOELD3bevUSVBWM8E8FDp3uqKvapSHDySHLIzsy4xknsiWxFT?=
 =?us-ascii?Q?xcbNqyp7GCaX9pjvbagkSNy1i5Ja6ckPNT/IkE1fq3on0TgpPU6VAfBto/MU?=
 =?us-ascii?Q?5Cqm/AME82Cn26Yig6cabaZT0Bs0rw3FDg5vsDA5LyPrR+RLQjhlg7zhDl8D?=
 =?us-ascii?Q?JSygfB7DaQOzGPG1ygyFJzsv6HZq1HRQgBSI9WSWtVERrcOO6UBoIX/XSYsM?=
 =?us-ascii?Q?bQZ45hMwUoj8Bm24UX+EyE1dN8kfJTFnADrJqzEMV6sf9dhpJEVmLy2lB+jv?=
 =?us-ascii?Q?D+Zpkld2RLP2Cwnj9/SvNH+sYppYMfhI+BE76dQq6QApalZmIve4TZrBC1Pe?=
 =?us-ascii?Q?z+hCWpsNkFAaGoVDGXiD6Nc+MR9koc/enuB7mwVVjSDBmjLwqUuyMrrzJ3aL?=
 =?us-ascii?Q?2Fq7+xKeIcNSb/8MmR42/OofOQeADwHICewmWxpfZo9T6ffDWinl/VkJPCPr?=
 =?us-ascii?Q?O3fcvswdjL933j+5YDUWvda1WmbOti+gB8HSNhN22IV4dTPe7/HGMhA+Njb6?=
 =?us-ascii?Q?sLtzAzjAvfc6MP7oGxZaoDSlMY3ryDEsuitUh4rGqRp2gM48aCz+oJXwDjHC?=
 =?us-ascii?Q?b+g5qrb7j4K1lYDzGWOHoxH7JePNcluYjWrxdorE/W04cfU96mK6gboxWMie?=
 =?us-ascii?Q?l+6+YzhS9eTq4supmuonIIWiysc13paRkIFbR98Nvhp1CMgm3rczhZz5g1fY?=
 =?us-ascii?Q?2rdkfd5u7gjv/qApJPRjk2Jvmhts14T6E8y2jJTBgxrQBRJK9e0hqWdY+f/J?=
 =?us-ascii?Q?nyuIrqcsrOhFKz7kT5+GeLhEn01qPMAmWnCFXfcduOlLyBpb7xjCTEXE9B7M?=
 =?us-ascii?Q?+ghKrpeCWFmbgRH2zeHtMACGW9nlwcVL1TDZYnpw2zjqGmSrJ8AnDGarH07u?=
 =?us-ascii?Q?4I0WMk/iCenjry6cTO2uHUAWeDVMbPftZ4RpkJFBEKVv+eSUjTTFFoA+nNJ9?=
 =?us-ascii?Q?Ao76XCzffK6IczZsOZ3VoN27VQdrk4LFSp9c+z7+nxijX3pN5pXKRjdg+j4k?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bcRagDAgZ++rh8ZH6VuLzcTGb8GcYmLAt5UhV+QSAIJCT3KZl51G8yoF8PKsp6Nu9nQ+nqlRAxaaBmZdXW3Wj/DS1dNitvT97vW6T0dx9pE9+7YUvfNxleE4woUdk7IjAQdbTtISgVwVQkvGp8o8RapqXWhFsT20WG2OT13WMGHfqlzCfLTX+dTjeZqChlB7xXfOGrk/PkwkS06V8Dw1mM6lcyHcJzgqPxuW7Rzngw/uqFN0/Uvv1mt/jGBKZsO1E5PT1z8qtK6QwhPA5YBGH2bFdDfxPs2xdImfheD6UIIQK8SSbDgpUvijXVo/ZrIXvR6EH5XCxYyhmBTZid3Pn2mdKp285KWFR6evIZPkHnsqvP+8buBsp2OMKmAB/tGLmvStzDyqgDaLamkYpnftTjY9QAZrcojremddVAqCnFoFXfUv2gh7O/lph01VgfGKJLwOdeklGDUHtcKOne7M54ukSy3janS8AP1raWxKKcprmNQ1uQ28b6eSf0zIU4jpgE39Hqu9nrhUeyAILwFybi7ncZY6Y7FuXQS5FpUf/mQObK29YzVkyOOS0kXgPPLDUayJ42SuG9VHnjbC4kJfNuA9POe9GHGSUkApWmd6nRs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae600a3c-b55e-4432-660c-08dd8720fe81
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 13:23:13.6930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtjJZL46oCNV/ilS5nmszy4UbJvK3YeFZUkrUNFazpBMd56YRk009694x8iCfkjEuV7G4m3QLStTMLZuRW4TgW1LwmVvj5xz2g/3CLCEWis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5946
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=912 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504290100
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwMCBTYWx0ZWRfXygI3YSOpoMtj E9Dv8AUhw9bCcl8WNC6t2kgaZVK4c4VBQC54eAhPt6hxCkOWbxfmd81Fa9krewTDkEl936f4DFy YQdevxGi8em4EYdLcPdNckNRm5elSDVCbTd/Dh2q5YkDCCY0HDecvn48nu7c7kA/E9C0mM0k3GJ
 dOliROQGYzH9tunSjDB4O8T8KLTWtHUlrEgMXUXCH/zVdA2KvofxGzLFHQe+dH3Z5AukacOEtvg jXQmJCyKkEl+L0c+OewmzwAukFX0BzSlc3Pwf0M8ADx872Bp8pi59LYX+WGwDVaixuncamtrjcB xKPAH5bD83dHpf2TVR81YkbXNm7LdhWs71VYSUNbBRJ0z93bA8rhS//3J1CU5Mvux5g4mFpMkPb ZDyelS6G
X-Proofpoint-GUID: fEn-k1y7--hOO8AbEXXzWJ8_76jm-LQI
X-Proofpoint-ORIG-GUID: fEn-k1y7--hOO8AbEXXzWJ8_76jm-LQI
X-Authority-Analysis: v=2.4 cv=E8LNpbdl c=1 sm=1 tr=0 ts=6810d2d1 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=GoEa3M9JfhUA:10 a=9lUX4Ar2f5gLm7v4NT8A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13130

On Sun, Apr 27, 2025 at 12:49:36PM +0900, Hajime Tazaki wrote:
>
> Hello Lorenzo,
>
> On Fri, 25 Apr 2025 22:49:31 +0900,
> Lorenzo Stoakes wrote:
>
> > It seemed this series died, which is a pity, i'd be very useful to have
> > this functionality to aid in easily testing nommu in mm code.
> >
> > I know that I pushed back a little (or rather - wondering about the status
> > of nommu in general) back in v2, however with it confirmed that nommu is
> > required, this series becomes really quite important.
> >
> > This would need rebasing of course for a v8, but I wonder if there is any
> > appetite for it or why this didn't go anywhere?
> >
> > In any case, if you are still interested in this Hajime (thanks so much for
> > all your hard work on it!), just saying there are definitely users out
> > there.
>
> I've been waiting for opinions from the um maintainers to the v7
> patchset, and am ready to send v8 series with rebasing the current
> uml/next branch.
>
> I believe the v7 series is still in the patchwork queue so, I hope
> it'll be reviewed soon.
>
> # thanks for the information that this feature is useful to test mm
>   code.

Thanks, appreciate the response. I would say send a v8 that's rebased to
make life easier for maintainers :) if you already have it ready to go that
is!

I think at this stage that makes more sense, as gives the maintainers a
chance to run locally + account for any recent changes etc.

Thank you again for all your hard work on this! This could be super useful
for us over in mm :)

>
> -- Hajime

Cheers, Lorenzo
