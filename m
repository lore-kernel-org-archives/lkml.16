Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2071E2602
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 17:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750181662; cv=fail; b=GGr4d3Rm6b0noJ4ckUdsSTLt/Uajda1y+4uwcTlSG0nsu/xNVN29S2FtqJYV56kLCApbMDQslNN3yURbKLNnUZJnqX7N4Dj961Ni+l8XuAeDDcjhqm3NNid0+wYh5PF4ERjWwKEkm3a3yplLBCJl3TqOBbsZPCXwKT/zkXwBl/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750181662; c=relaxed/simple;
	bh=rfAMbUGZyXISEP71A2Y+K+alrZ6gkjuWjyjALOXD+QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iKCkjzFSWns7dKVpPMlSupOl2M4s2ttVeKWxa9wmD6BT1JbS2YZnPN+QOIJqz+55802K5Gcfe5zrxHDKvTzasTqlimur1R0iCzZrTOGlHyj5H2qzLhpu0Vn/IMCxEX/w7kxKvpahYZk9ltDcsHaodLBj0KI77QF+UrD5IKql/uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Wbw/L6Ps; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=re2enncZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Wbw/L6Ps";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="re2enncZ"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEXD7m012811;
	Tue, 17 Jun 2025 17:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=gXUWC8p/aW1GdpYgot
	1MvwRleTwnn7uljebuERvKIK4=; b=Wbw/L6Pssp28id86KdDXucYim7kn8+3wLm
	l0Cx/LVh4ZKZ33BYkh7oZ1AiSpU9GemRyIbi+cjJrIGxruJ9FNKnoJXUiipTVsQq
	EtQML/MZxZ4IGfgoP2leKvEETvYfF18QhsliDToaT/Z9Y4IIRu8+/2dmfxRdrbpi
	cwPunQ1MDnAy6z7r2UeLv2sG4eT3XW3WRS9xCo6gjLFmILWJqZL8IVq/81VxPuUG
	oXNJYIheEDQ2Djq9wPXNMtay+b65myIBz7bx/0E7E8FcZDwEaJ1Rks5j0rSR9PAp
	SidU2p7iPOrVs4O04YDQEfUvTcrXmHOp3Ch1WJJUK/4xRhwYjocg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47b23xscrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 17:34:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HHKOL2034462;
	Tue, 17 Jun 2025 17:34:07 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011039.outbound.protection.outlook.com [52.101.57.39])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh9aa60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 17:34:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTSuDSEUbg80iqB0+/ZfJYx9YDlKpVGY00m5zVCwaWpNuDbPSqcUo0XKaMAgbkmXuBxcLtmk9G6E3ZtSMETvVzBsZPKeGSY5/XaLfftPVFxpZqiCjA94VSuQT5loghCshA3jAbSfRWIGAshey85PAtpT0b09vRNM6h22DDHTGZhv3wmVOCsGYiG909+8yipK6Rq0zSCqWfeTx+WgFeerShOv5tg/0Qm+0nN2Zw1NmIl7H3/N2FJy5NZDay97joG5nofFvK75x7TAudfNEq2Sji++4aGQL7UknUu1c+CuDiLVnjaNvhvOfaRPSe5GHubhaBx8sQsOaoXsLMerAWjQHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXUWC8p/aW1GdpYgot1MvwRleTwnn7uljebuERvKIK4=;
 b=dxiGSmzBXu9UzukcVttQgVXT5IgezYfC+kj0kPj+D9zKavD5eCb7VJBfAXBX2q6WUOwWHfMz6xI3kHOli3bcL6QyY7GMJsTe13zBnbDhjBpUhBdxR8SWmk8WIpNqKrHx3Ab+zb6/JpY245jyLJg17ebhVsFbkASVWCYXaNAVb2aPLmP1y+ot1+FUAep700XC5oCskWgLOfxl+O+SO619vOfUA8w3tU5KDKcFs5iqeeCjaXrnTOOtKAjiiPjnrhTufHjE/VA+/5BWfM6sNWW3vesqcaJmGvTJkyhKhbmH8X1JeVWsrnmPf4NsXJ1/GXh3Uwq/fNg4foVMzWuaGdAUYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gXUWC8p/aW1GdpYgot1MvwRleTwnn7uljebuERvKIK4=;
 b=re2enncZ5mfuzapzKYvyyiq1b8OBdrzAAUEe4eJjyg+0ngIJiQ/Hts1u50OfhqGGOMrtOxOiaANIpWcIPfG/8OYYWmfgPiVZZV3+43hIXRaYsYNlelKYfB9LRChxFVcSgNuNorTUaA7uYJCOvrTLhi/NDHxXa38RDjyEH++CN38=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 17:34:04 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 17:34:04 +0000
Date: Tue, 17 Jun 2025 13:34:00 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2] MAINTAINERS: add additional mmap-related files to
 mmap section
Message-ID: <dmfsatiespmh4orlgzkqj6piuowohxuizrvml32peibrixkfi6@74lxkj3gakxf>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@redhat.com>
References: <20250617144130.147847-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617144130.147847-1-lorenzo.stoakes@oracle.com>
User-Agent: NeoMutt/20250404
X-ClientProxiedBy: YQBP288CA0022.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::6) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|BN0PR10MB5206:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbf8afa-a30d-4e75-6ede-08ddadc5279f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MTMCjdBsLWNWsZw+O8la4ivGzay9vmMTQ5p0haKDU8XSu7khgnGFafsuJspo?=
 =?us-ascii?Q?0lvLzGfeMqiBq3UOs2oFAYZVfgy0uoy/8qVT62PEVQhwcHkZw/oRyUIPiPqf?=
 =?us-ascii?Q?tCTNVuNye4Y+IPHwh0lEuKZq7iWkrUVQwhE5yTcYv2sv8ooGhFOwTRjAcf8h?=
 =?us-ascii?Q?rjBuCaUkrlj0g2P4U7ybgD7gVHD0kv9eCDGUdGVWLj2KMEBakINdsNc3N1K3?=
 =?us-ascii?Q?GWhfJc8/dBM5FidXcksi47f+cL3dYvbhI7i8a0VWNQZOzxNPemo8GmTnnsly?=
 =?us-ascii?Q?XVHZTfw3QqgBgXaBWr5AMCdlTwjrKTnyXABDLLDKdi+peLcBluWJFssKy07z?=
 =?us-ascii?Q?lYKRtDCgjYaeHHSod+0IhW28GsI5MA8FTnJC78SMILP5fixTtL2+Ov8wWxyD?=
 =?us-ascii?Q?0apkLPiSvLm6u11uUnpvnTVx1PWTpb05dTgINzeWgWwShso2xbRi9Y9Elk21?=
 =?us-ascii?Q?v/UB6DkUaM7W7H4wFypa4iLSH2Me3RpUuiEZRTQL6j0umWEm9XZSvfmje4Us?=
 =?us-ascii?Q?ryyfwWOytTlPgyBt6J6c0UwSQzd748zeRRttzQh81EIoied8JSs3kn86c7lq?=
 =?us-ascii?Q?wZVJ+7FTXC6vgPwzWCAGqXAfZlMnIruVqSgORudF6jo1O3kqTi3timb1iVmF?=
 =?us-ascii?Q?i7323N/i0TKMt/9EQ7RIOb/Ngn+TqyFKAPuYdOB1gACx4w8QhhPbGdk0zcHM?=
 =?us-ascii?Q?Kxg355hz2/tdoeRGhmzke9QcwqcaM/W9q1gTsfR8kPE1KUiRaICPBAO4Uu/S?=
 =?us-ascii?Q?gTo1vf6gC3W1C05vMocT6PvuHny4DMc47k3GNpnwnhSv9S+WROFiFCZvZA2x?=
 =?us-ascii?Q?KFII8oNiOJbxtGkaVOg6lZqG9kgGq/xqVU9xjTOyNmazCxjxh9nbPSK+IhW2?=
 =?us-ascii?Q?29L0D75ZqhNNjfBW2prJ6Vyj5NlxSTSc8ZIZWuKka/3gMtKObJMF5aHXwfQl?=
 =?us-ascii?Q?kVgFk6IvyAYr9zTWdB6MUESi8lnF7Jjtg5MHK9R8gUED7amlNeEAt90Pv9Z/?=
 =?us-ascii?Q?lk4Hkf8U42X/hce+/NHZ1aSEQ1K7O1S/aRiOe1h2ddSIZCdByiGK5Sv2B51E?=
 =?us-ascii?Q?Rg2HSme1vhCczLbtFY1RETRCUCzyULWXguwm4As25nQB/QaJj2LZkF9Bpi3O?=
 =?us-ascii?Q?3Gse8eyYKVZ7d3UOgRNqAralW39jnaTAsG0QOnwpm+TIuZGpdYM4fY6XOX/s?=
 =?us-ascii?Q?3ieHowEtESDhJOUlqfCIWhTmfnAbFgbzznwZvZlhvLzaGTvgEaZV3EXBBfTn?=
 =?us-ascii?Q?sSrFHwLgqtABINnnOP5AkHmUb+IDG3xfXW/5SZSxBvTeRpPTkA+wRNAHASBj?=
 =?us-ascii?Q?qd/dCPdmVCVKNe0cDwNoSDn5a0MTLBkKoTWNLA3gGXn1QPoo5Ddr72Sfe98T?=
 =?us-ascii?Q?DXr93PJDjbXQT1ZtGcVXVK8B2c22?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CUug1OnFbNs/xg3MQOkcy5gQF90v3LcyeAGl68XP4LWjD61b7NSpQ5DrV89C?=
 =?us-ascii?Q?pY8mAB1oqYw6t+s3KsokEeFsMd7A252OciKa7qsRx1NmP5FVMjdy1KKjPaVK?=
 =?us-ascii?Q?MfHgC0kCPj9En8FuMGuH52GFExZr8JClu0kjm6ztj20iaCH5uGbqk+Cmjwmi?=
 =?us-ascii?Q?mBcku1IoLVteEW+dOgN/eCOFBbf1mI082ZvCEo35zRrewsKVNL/ZPYhPztJ6?=
 =?us-ascii?Q?bwwakKuzT+XkiRw8Xz9o8pdAHWGl9jr+SMd3wyudPZ0sWpqjVtnjayVEpt0T?=
 =?us-ascii?Q?YgSq2+EGJF/wwenG0hlgQ0cunz6Bb5+KO6xeUor0Zc+Ln++HSv9c6mFVJshK?=
 =?us-ascii?Q?zkhRmnMBtxfOcnRJn7LfQxoERZOeZ+YmicvkzBKJTQ2sTCxmHDlwVAD/GrOq?=
 =?us-ascii?Q?IIuY9fFx0VaHEowSjxsJtDaQRiHx+u5Gg934TGRmkhMRcMwYMEAngz69fUCc?=
 =?us-ascii?Q?ifkZ1TAEOxc56zq9Ha326Y/NndI0boItmXickBh+g1hvVvzNtolvkggol3lK?=
 =?us-ascii?Q?ax39EeCPxWvQW2veaAGHtn5DnIGH7E/7RBq38LYDIuWKFjqkl+IwzuDbL1XF?=
 =?us-ascii?Q?Vsu8e8by+Z5lVaZ9uvueT9/2gAX4R+DGs+kUV6Iq/LfKJ5JTPtf8nJ73XKbp?=
 =?us-ascii?Q?WlbkhSBFWZrogHs0ftzZWVO8DJzMJtcmr2ehHxkWX0k5g2VwSSiRuca3MnJT?=
 =?us-ascii?Q?nGB1+3y2bDFrFl2si1hXDDitfehwIm9w93IrNMg/ATPl8/HErL87fRZwDkU3?=
 =?us-ascii?Q?gGsGox3rJc3rwsPO/ZU2YYEkeufk/5uIguOlme6GcuXktvTInXFIEyJsYb1I?=
 =?us-ascii?Q?mIgHj6zH5DvI5WgbP9GoMit5PeY9kaOW++ZupwC5NoQpjBhn7bXnXNWLcbvi?=
 =?us-ascii?Q?Maa8jSJy0Z5ldfGtGyQoJ735shj27bFxbWVNpu5EgZ3CHiet+nkdrGl2JQeS?=
 =?us-ascii?Q?2DPxsa/hUWpLxRC92w+53xrogVU7vCsxVyLSFR9DfX1MRM8ildGnGNlMb4J1?=
 =?us-ascii?Q?/1TxinKDuJBxysVpK3lRc/+zwTKdke2Yq3XMP5B0P1hhdwguM/jdHRtV9/6Q?=
 =?us-ascii?Q?xEMrcfBrF4yMFMIoh4QDOzF+x3ouOjz2VTCDDBMphYjM/IE1sB3WIB440bc5?=
 =?us-ascii?Q?ZZMBCPPpR0IEGrO7fX8oSEdc8VlT2VeXBYBQn7J1o9ekkeeaxLdxNLsnUXj3?=
 =?us-ascii?Q?LD07BSLKxveAd86yrDZoufiswcCApISF+uN8f+3hzoe311n1vxcc9I7IcF20?=
 =?us-ascii?Q?ToP8XRKrfKzkOrlhwREDrDHChCrnSEg5ZWtGhpf8FaIhuJYc48SkCaPCoH+1?=
 =?us-ascii?Q?xPq1TP9x76hG8AxvtdDXxTHsbu5Mg1Y7LI0XV1oqYxNcPNIpnssQjYGzNWbJ?=
 =?us-ascii?Q?OvaWr8zLv0oHXxmAN1zjw0moutFyn68auG5zwc8v1d0xo8E5RCnBLkLTGzij?=
 =?us-ascii?Q?TY43lyqFEL33rCXOtiOFwhxe5loJN7aLQfRhbp1NEjQwC5Q+VgBUH4cyb+uz?=
 =?us-ascii?Q?UpM01KbFNuAHsLDWlTqHwCulgWelA9lSw0e1HabsilhzUQe229aPE5zWmX+G?=
 =?us-ascii?Q?CZPcDZAJyfP0nA1pZ3b8fnVypIJpguRYmgA0gwUa/1A8/jWccQmtM2DsgRpm?=
 =?us-ascii?Q?rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Xbr3/KB2ZClbl8j7t4Jwzh7bqFrnLgNjIuK7lr1u9Afw1+b4lM0QnPsg1vGxHxT93+95X+d1Gv9zBVsBaGyvr9bZ6zUDqQvy3rLnE3WG1nxxhDbjgT9AGXCvbe3WD4IpgmrGBubwECFPJkhjMAn46HYEDyr6/fZi4QPtJVi5qCqqjYbwDnDixxeYrKEUg4WYBzp/LHbo6X47u8GnALBUl0aqmEtEsxoj8F5upnpiQpEAYi2MJP5RxZqAqtcxv6VFEHNxJAZ63D1nYs8WUmjZfQcA4vUELjg45+NTmkl2L4ZrrbE5HeIkFttEg7zhie+PcfFxIG4csEnsKPfvaYy9dvpwMsii+XLDsO6KixS68aUgjdNeGKqDEuufbXc1qIYhKoHUdbfejKH+XvmHMdPPtWc869QyUJ+AM5K8xlvH4eunyRHrtPRnTROPxiKoq0XVC4H5OXUOfS/QSbkW79LRUE8Nwp9kooJVFbpzM0O07r/7WE5kd5QhmdYbwH9c9zWpbvVeV9CqHO/DHTAbz44xDyNFYDi5PQ+fhUvradM6eBB/Jf+SWrQM/151BYY4oD0/u5M+WayPc0Qx2Wk2dFCsEGFdRJ+iU+zqqMP/eTaVAIM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbf8afa-a30d-4e75-6ede-08ddadc5279f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:34:04.3447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3q6z7q3hS6K442/U1JbxWMZHDwB7BzNhYbSaKIls5AvI9pkftNuz3arEC0J5kqtqLN7GZsWbwU4ifyYVBtVHrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170140
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEzOCBTYWx0ZWRfX7khJ7Pu3KYZa HTcq6XFQbfVGwWC+UAReoLE28sKPXAiY8V9F6DnN2i46j9beRwvS9rGefn6jvGWgmNSMuZm1bJn 5FAVsubhvZlq+OQvy8cvie4ncctJyyY+KZ2avukVEpT9+GbVAI8L/BB51Zh1U28BQe+QjX6UfMD
 vUWB64VsDPt4lSf5/MjcdIb1HpI707d+VHOkC8vm8Z004+ax4YLpBstN9gNO94Y5+vqFb++PNhd bJA575QjEO63+EdyIO0yPYPoEIx9+QT+etiW7gg/HKWabvvZWWGV3ALNNE0OVMSAJCM/VD0eoqi Rq8CvLkzE47lS895XerpQPuaTKGMyaC3zCZwKft/Sgg3EVszPbH93AKlf4IPRrEtzJ27s4BoLY7
 gWDsGvRdvA3c8jms1iR5IfwBT5TgMbFOZnpMn43ltaDwAS6OAIZlyAtZjrdYfO/f02bGrUPk
X-Authority-Analysis: v=2.4 cv=DM2P4zNb c=1 sm=1 tr=0 ts=6851a70f cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=1-S1nHsFAAAA:8 a=qktOLZtUvbWfBIfdlnMA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22
X-Proofpoint-GUID: oHW-6ooLx0S5XMjP8PEUfQrbiKBA6MxF
X-Proofpoint-ORIG-GUID: oHW-6ooLx0S5XMjP8PEUfQrbiKBA6MxF

* Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250617 10:41]:
> msync and nommu are directly related to memory mapping, mincore is less so
> but all are roughly speaking operating on virtual memory mappings from the
> point of view of the user so this seems the most appropriate place for
> them.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>


> ---
> v2:
> * Drop memfd files as suggested by Pedro and David.
> 
> v1:
> https://lore.kernel.org/all/20250616203503.565448-1-lorenzo.stoakes@oracle.com/
> 
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08045f9efadd..2df3e05bf8a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15980,11 +15980,14 @@ S:	Maintained
>  W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	include/trace/events/mmap.h
> +F:	mm/mincore.c
>  F:	mm/mlock.c
>  F:	mm/mmap.c
>  F:	mm/mprotect.c
>  F:	mm/mremap.c
>  F:	mm/mseal.c
> +F:	mm/msync.c
> +F:	mm/nommu.c
>  F:	mm/vma.c
>  F:	mm/vma.h
>  F:	mm/vma_exec.c
> --
> 2.49.0
