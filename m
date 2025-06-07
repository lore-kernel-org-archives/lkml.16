Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88C1218AC3
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749299361; cv=fail; b=nMOlW+q1/3xEGBeiaQToBLofMGlXovzk4gbFGpV+DUk5TP5PHZQuvC0DoewhudYCKHZCJNJ0I6VAJxo/+ZpmciwlbL6oKJBY2oJmMSU0CU6qZfg3WlEotNghoEO6stNZshtoZC7+glowc7BVlnX0Wt1KrPEpGMkShUoX0EG8m7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749299361; c=relaxed/simple;
	bh=lb3Fsk3zK3eRngxHkGFGvTw7CYGKidbpTZtVzzwpTT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nDVZx+TLe2qaXV0cB7qSmQqAM06r4eU1UQP3oDc/WQ+CV0Wnrcd/D1j6kl54aiFleFDzUbepOjmGcsv4awY4n/7DBDXCGFDW78xhAoZLcchF0+OYQldcYf1F0aVlfM8NgRgAg4zVUN/c4MML0xXiM1lDWMgwL+jx0YKa/N9rCN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OhzyX3m4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OTkE5s3t; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OhzyX3m4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OTkE5s3t"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557AU5oR005918;
	Sat, 7 Jun 2025 12:29:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=EBc9d0IdqKrQ2wHegI
	XLBwYKKA1s+nUrEDRGKspT56c=; b=OhzyX3m4W75k53Xkqsx8HPEr/x1erkBMY2
	tMtH31cbK47hjV7LXCwOKBWRUv1225ENlCvi18SLbW3HMbpdyvGJc5B40duhkqcY
	vYBQ8/lxAjTPEsJgd136Nb8cykMlrze1tjCfUuKIMOMNvxLCt2+W/IAihaYqcywY
	PQICR+KX3AVJwLixBFYwjpV1DO8a9LPm3StN22+wLPA+HcfK9ImxmrKYfxPUm0Y8
	mjnaPzc9lb8qJ6ht4fHNDVwH93FW/qpxz7dh54DoPQoRyCcavoPkIJkERmIYGGKI
	JZSGEVPApM4r6CEQamlXXIuZzYQFVuhwQIyJyjeF9cWFcy3Od3vA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14890q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 12:29:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 557CE3Qe020668;
	Sat, 7 Jun 2025 12:29:01 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv6ru1h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 12:29:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DgS1XbkqItyhL4ml+dfoYUgN8CWfseFCqJc019aju1tvJU4lTtds6ETKCf2I13zKxRRziDVOsPQwCZ4kxHdbh3h7ET6Mf2y78Si/FY1Xk5ywmHezPG1wBlnCM+cDjwmwqEKW2Rz1/QlUq/mT9szzwNucmHc5QW/r5hWbAplnKNAcOgJRAWSSSE1LCg5dqd25Bbvdqp9P0XBARc1nilUy1J2NGH6eBDFGvf93Lw0AevmEbEU2lbx1U7YIfR95i3Mg0bUyPK2unvNMpKobwboGtSdnOazCXOGYJQnvh9Sxvi6/9fPEZAmrNe3YsHbWTcamvHkCYhxfgEu06Snxa2YbYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBc9d0IdqKrQ2wHegIXLBwYKKA1s+nUrEDRGKspT56c=;
 b=yEzBeuFGH0tCe5qWT7RVClOcHJf4aD7OxObSXVz1iuFEyAoCUxpMZ+A0H2upDwZPNPYhqUV7QhAwe7mLBKX5knOPSKQ3iQCGMDGev81uxUmlGkkf7ZxsGW9g2/dt8qdbARA7DQr+dJM4xIr5g41eowMf6ZbxYbEw7NUeNYpEEaMsI+zQDsP1TcDfb1obc6ovgliqH3g2bSE9mv+6Nadsj/sG2W60QdMI3bHUVxjjFSCMiIeBxeo/WnMD3P/yqoaKDBJByqrj5fgsEbQeACnOybCKG3yF20Mbzo2MLnFALtXO5JvDYxcZc2XgiRk/Oyj1qUBPcbhFxHcwu5UHV4rkfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBc9d0IdqKrQ2wHegIXLBwYKKA1s+nUrEDRGKspT56c=;
 b=OTkE5s3tUpMiii/00/zDrN3J4Gl6hWYTfgZ1WsA5XJGQQcqrrmh/nJN54j4TkIIJyvS4Bxj+/nYHqVfG5+sKa2AoTNdM9sATXv7kGUa/jCJXRL46Ph5dFo9WA092oRb7uLQffTOIy6jZW8jE0x2dtopERAauk0PLhhG19U44ySc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB5600.namprd10.prod.outlook.com (2603:10b6:a03:3dc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Sat, 7 Jun
 2025 12:28:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Sat, 7 Jun 2025
 12:28:58 +0000
Date: Sat, 7 Jun 2025 13:28:56 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, ziy@nvidia.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
Message-ID: <2e30bffd-bda5-4f83-b88d-c51940651a49@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
X-ClientProxiedBy: LO2P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7369b5-615d-4360-b50f-08dda5bee03c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VLDnMrH+T+l80Pdf9OE/RtiJQKvCnaie8a/utkk/8xtrAd19DcJYvr3r9sBy?=
 =?us-ascii?Q?m/kzpPDxO75HOkSI4wNPUb8xU2wToxfKsmGIVHgDNQ4K2Mhfd07xN8fHfzxh?=
 =?us-ascii?Q?oC4r0MFDsuA7YbOR/SnfebiFZRs7tL5A6BS/oenafguFGF1t9Xc5DuDb3mk3?=
 =?us-ascii?Q?AhaIwkBzlbT8msyTKS96D2ewffmgR9CZ2gAOF4boDmCvSc4oAPvszfnKzygw?=
 =?us-ascii?Q?7+rgPDnHNasMktRHFL30oaLqE5/BnTbQxhqbc2jvnX7oKsiNN4TYfBYeNnHa?=
 =?us-ascii?Q?IU2A/dOyKAGQWTHQY+t2OJ/fmqqMFK9lE4n2xsDR+c/6+lHnUyWC3jG1Ro5l?=
 =?us-ascii?Q?ohWUBr8gW4863aSN2yMfmxJwpQbKVBc0UVYMymzgjHAPGCXZOV59CPHyPcCd?=
 =?us-ascii?Q?HTyjEb4XCbAW8a1MzHfhSB12jU6pSZRMK8fx2NH+Kt84EebGZtSXirpnA124?=
 =?us-ascii?Q?MUnl+hRAfgCEI9zXRNfVfYhY4EedHMYoQAz7KOLLZKwoBwaUXJ4Kc9xCq+21?=
 =?us-ascii?Q?fLWX8NN2mEvmauPFihLBLSmbFTBm4jJGXvhYHYVbGZvFVqUEVvChfKuX4xP5?=
 =?us-ascii?Q?xCMhAGOCmvEi7AsCYxGT+ypUWgNtLGcRY9SqiVgx83K1/SzsK0sN/3oY3giK?=
 =?us-ascii?Q?g5InOFg9jKazPR829kqYXvbDnNS/KpS/vXTtmaXSF++JEOG7HltwiVczLYwz?=
 =?us-ascii?Q?yLJ5XYDaeZey5Q3gEGAjEW1DncrRBAWvjYCx4/ho1uhkpCAfRZ1BY+D2hke6?=
 =?us-ascii?Q?79g9st+YeIcBBE5sCe+8IIsjIU1IR5cQRCfefFhYi4MK1PK6GBv1H9zDxpPS?=
 =?us-ascii?Q?gDKMByv3XOQrJAuDTJw9OJfniJFzYrT2OwTVbBI1ww4DH7qhirs042RVey6c?=
 =?us-ascii?Q?LVdy7gfSzZzFM7hTvER40sK0o5X9YEGvRRwdDo9kUlOZSRip/PxxOgks6MjQ?=
 =?us-ascii?Q?ObM8lduqEFKWBPz70x7Bq6tVhCd/QY9Iezrdp8oSVTp+mRFdR2V/AsiFZp6F?=
 =?us-ascii?Q?cw/3F6Q8Mp2g3UgoSgJAFccSsfdguJbVNjsVWXtVadaTTUAqZ/ELq6zq7/Sk?=
 =?us-ascii?Q?WVRMP/Af56ahVbAIsmXZEIEVAVr1ET5kvFKemabWjlsHKYHzVezsvKp56JvU?=
 =?us-ascii?Q?o60ofhjwq/xsDVRA72rGRC1o2SgwI6nlO1c6eqaMLJfRlnVUCe8et8aIiv8J?=
 =?us-ascii?Q?DMx48ocO3DXguUQxlXl2gy/Yz0cpV3FNunMoEew0MhXjcJ8UMHF/HvEDJbMf?=
 =?us-ascii?Q?kkHyq4Kvlxjtb5g9lVsnSRvFZLSgP56PGdBrcvHHeQvubXTdKvqffe91C9L2?=
 =?us-ascii?Q?BPdV6zpGS4XAt5Gvb5cimTUvYrLD9BlAR986PosDWBvE/YIGdaLDlh1fBhzs?=
 =?us-ascii?Q?6JnbMiqqMXpiITbUmOL+NNhvBF8Mm0Slt/HhekLOHZDDQVgFqcVfhkio+c6f?=
 =?us-ascii?Q?GfdiBvTImOA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fdYpfjwFpyH3R2bReF/L0F3aWJYI1zBF7NNVEt0YJKSLDNDFQr2tcx0kd9GN?=
 =?us-ascii?Q?277H9d9OOSU5KWZG8CZaI8NhteGdqbOJqNBEHQT2QY7/D1Q39U4AOVr79YnE?=
 =?us-ascii?Q?L/4F9CSwJQDmC0WWSPE1nqX5tYx6wlBByvT+6rknZBMOOXIV3JgIMbnehKWO?=
 =?us-ascii?Q?eGo6RgL9ctSgs+wCY7f9tVZhH6ZI3TJ5uhq+iCdSCY6D7gGstIuv4eLJ5kG3?=
 =?us-ascii?Q?JPXJ3IM2T3sb79ar78WDniRbbHWPfrHlQBsaLDNv1Pvu1DikH6vnrHIRCZux?=
 =?us-ascii?Q?zygCPFHZ8AL9obN6naItaPki7AQqj1aeP6iaGR2azLNYGQPe2pvP0kk+x8s7?=
 =?us-ascii?Q?sezkUfEDayi1bUVuhPhPkuyGA6xfFz9T/66eV6hPp1UlotoFw2hl6MTxvT3X?=
 =?us-ascii?Q?YMfo4WL6QbJq6ltxoglGI5bGrQa2mXcR3rWr8OOX2af2Ber7OCBMx5PNEzW3?=
 =?us-ascii?Q?BHi43G7+oZI5V82DHyvkWqe+Zj2LTho+0vk+5RHdTtmE3n9jXL+LKiU38FSO?=
 =?us-ascii?Q?P1qCcwtfATyuR+QhLDE5b99jMQF1/yDSj9X0ecs03BZ71Gyko/qPtmkRdXr7?=
 =?us-ascii?Q?7VpgyKZ2t2NsylbAl6sIZ5szSqZKbLgicr5WpkMaqWyv39kdRfrdJR+N/+Mz?=
 =?us-ascii?Q?zeZkQyl4aK0DmiLNJv1ePh8zlaQjyzcyVKx91CM1dn8EiS9Y77wl13EcMyAU?=
 =?us-ascii?Q?2dxar55sEpQoYtfRosrH+Re0cfAJ2X0U98ZFTCOhZS55myV+nQieBTfAXwIo?=
 =?us-ascii?Q?+DndO5IaCd90Q32Y2T2wuHewLrsOBf5MovI7RrWYusZQsO8Iicii/T498mGa?=
 =?us-ascii?Q?NGd4D7R3pGcqmEWblqZ7O064A7+D5qcGwXqgWxBvp+VX76PpjJp27A8B8omQ?=
 =?us-ascii?Q?OVnr0rYDadTHRq5zkouGCRH6ZKLVhCRqwGZ4HGtucEJjhfN6PaEPyAcoNiEJ?=
 =?us-ascii?Q?r3pfX1vxf+pkbW8jwNbRw/F2e5wUoFkQZvnUmsHz+XFOnbm+93NFLMvTOPtH?=
 =?us-ascii?Q?lwoc1yL4QZJyVGJ8W54aJLAVV94NAxszaS2UC5SNpI5j7BmgKcyvz69d4OO8?=
 =?us-ascii?Q?+LijU24UGp3g9b7ooihA2360YRviKnVwdvmKaFQ3rdkt8OaIpIaofJ6o0gfR?=
 =?us-ascii?Q?pEqml//j7p2nw9CHzROsVS4T+5WzlSYpMciZlIK69C85Kgi/ahBqV+FFerue?=
 =?us-ascii?Q?6Fq68t+eM9jRPHLyhy7/nEV1M5BjOSAJX5RLQ70cuqZsGBgmHOOxE21ln06N?=
 =?us-ascii?Q?6k+xFMgpUPIk4eZQ4uUHaiUexsZMOdUQ61WyVXTU4fQhWUs2PlOCE8Q4QuIN?=
 =?us-ascii?Q?DGbrU5PAY1DqKo+xkqmJPGCGIG/upbQCwbb8jLhT0/SwliDuIRW/RPoGre4Y?=
 =?us-ascii?Q?bNKDzkFpFzoXSofiQmFbeX8qkdNb1UK3xW1OMQCz5GCAiYgMWL/oc7fSA0WX?=
 =?us-ascii?Q?QA88bDsGoS9Ws3ll+mhJnYyNg6yC53TEo9sllC0Ume0bEB2W06/QeS9RYBMz?=
 =?us-ascii?Q?mfBAvMUjI4gWv/wQX+SrVtcHOxoLKuStRhP7cyWQ53s/u97kax6Xj4OUNjrc?=
 =?us-ascii?Q?+yVB6H/q8ctzlex4eon+q5L0P4xEc3/rdKKf645hYT4UWO4y9C+5Z+F/5x2I?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6nQ9SzWJOcO5usTd24PFPYNzWjEQzWI5jtmJawGo3UYJJU0ZwsiuyUtt3IgZoCSFyn81yR9lysLSaA2xdMD6IHd3DS3w9m4kVG72Dxz7soRCYfOBlivBbJI48eBwwi6NefTg3zA9tRBXdI1uLlv77aAh0Q96HoASJwOfZ1RYHDEYlnT6f+FimLqViqksEReWpXwP20op3kSb/J+y9CNY9znSSNsF9dHB9leMvVcQVFG6tBUa1yytipIkA5pWIn82y9qyu+tQlHhENBbece7LXOeDQL9tiAbkHcy5usNHdNEhBt+qvHgQDo+5n/6rb/Yt2763mL4/08jvK1fWuW8MKsZung8Iu/cdjXr7C1k4VfzAb/dbQYdB0/PYdIsY2c5bAe10BDf0lKrMuSJWsO8g9BCOZ82AwgQKLL/sryQGyoPPWr/nMw8B8ZmYtO/3tYXTHiQuo2+MSTAuOLHKYLainR3HIJbliryzK+iG+EuZKhAB/LCwCMHNTDhpSCryvrqKyZyFsb3LLxgACQe6U5nkHKjHPpM9JrmLuNrTQUEIUWGWKzgHX2/80a8jqTuDbze0Og8D0l9vD2BCoYgTW0HgxE4n6Y8hKmdlZqi9PC+oefA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7369b5-615d-4360-b50f-08dda5bee03c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 12:28:58.2001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBxmhDM5mUhbCurztCyG2994ejSIUiSh5v8hXHpf57oOZy5uYgCaoQd/vZ2Fy2V6UObWOukPcYig9g5u9t++b8RdQKBNYKPD62sBfft0+Qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5600
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070089
X-Proofpoint-GUID: 6B7JEeqqjpjzhCHe2r-6ECk4cix2Zkrk
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=6844308e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=tCvvFVPAsNhtnAX8jeoA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA4OSBTYWx0ZWRfX4bKAHLMjmS9d A7imL4nrHXaHMInK1WOCEDuyjMN9CJLkUP0ol+mTG+oDWVApW6a0wgpiyRkX6B7A8ZFOef3TnE0 J5HmgDl7SaVBc9S9BvxfahNElQn+Ahe5q8uaCUls1T0pTjDmtysI8OKnBbm5m+S9LkkNqiSSzPy
 fUBAkmkn0xVXEDC2Cvz804BrfkRAWt9WnmqieTnbYpk+f0RrwxeEMOzpx77USq4HqOfsmBbtxj8 dKxc+xTTpISglOpxKsa9G1CfYwvBw92WHzw7UodXlrKARH/t1bkR0C1b9BLWVIV0mTTu3u3VUQe 5lK65ctAq6bSwcShY7tzQlLJb0ZJCxBvuiQmwIsz33ndblWcE54parBp1ArggYbSgrVYi2VMwBD
 2hd8DIa3Fipy3+1tYorY8uAh7Nvj/PyFbRhjTy+mNRdSsTMmo0H96Xq120CiSsDyngYEXB7e
X-Proofpoint-ORIG-GUID: 6B7JEeqqjpjzhCHe2r-6ECk4cix2Zkrk

Before I get into technical criticism, to be clear - thank you very much
for doing this :) I'm just getting into details as to the implementation,
but am a fan of this change and consider it important.

On Thu, Jun 05, 2025 at 04:00:57PM +0800, Baolin Wang wrote:
> As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
> the system-wide anon/shmem THP sysfs settings, which means that even though
> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
> attempt to collapse into a anon/shmem THP. This violates the rule we have
> agreed upon: never means never. This patch set will address this issue.

Hm this cover letter could be expanded upon quite a bit - you are doing a
lot here and it's not only MADV_COLLAPSE, more a general change.

I'd mention that, even when TVA_ENFORCE_SYSFS is not set, callers checking
THP order validity will not be able to specify THP orders that are either
specifically marked as 'never' or set to 'inherit' and the global hugepage
mode is 'never'.

Then say something like 'importantly, this changes alters the madvise(...,
MADV_COLLAPSE) call, which previously would collapse ranges into huge pages
even if THP was set to never. This corrects this behaviour'.

I suspect you are unable to write sensible tests here given the need to
manipulate sysfs (though perhaps worth quickly looking at
tools/testing/selftests/mm/khugepaged.c, transhuge-stress.c, run_vmtests.sh
to see), but it'd be at least useful for you to give details here of how
you have tested this and ensured it functions correctly.

It might also be worth giving a quick justification, i.e. 'system
administrators who disabled THP everywhere must indeed very much not want
THP to be used for whatever reason - having individual programs being able
to quietly override this is very surprising and likely to cause headaches
for those who desire this not to happen on their systems'.

>
> [1] https://lore.kernel.org/all/1f00fdc3-a3a3-464b-8565-4c1b23d34f8d@linux.alibaba.com/
>
> Changes from v1:
>  - Update the commit message, per Zi.
>  - Add Zi's reviewed tag. Thanks.
>  - Update the shmem logic.
>
> Baolin Wang (2):
>   mm: huge_memory: disallow hugepages if the system-wide THP sysfs
>     settings are disabled
>   mm: shmem: disallow hugepages if the system-wide shmem THP sysfs
>     settings are disabled
>
>  include/linux/huge_mm.h | 23 +++++++++++++++++++----
>  mm/huge_memory.c        |  2 +-
>  mm/shmem.c              |  6 +++---
>  3 files changed, 23 insertions(+), 8 deletions(-)
>
> --
> 2.43.5
>

Thanks, Lorenzo
