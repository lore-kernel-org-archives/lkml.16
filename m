Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706B91FC7C5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751452397; cv=fail; b=e+Qf3/W8HBOUZVOubC4LyiSlbrs3uDl90C31RrMuZ7lba7/BY6jfiOy9y//tbIlfTQrdif9pqTVXyUC76+ctC4ye2Hhc9Fi7uZlXz98H0Uy91OOnh+FCtgEMRLH5fvqzshbXUv55zNkLOwtP7tYdhG04U1x0HcPrNFYpuFTj4fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751452397; c=relaxed/simple;
	bh=sBxpu7gyITgf843fHbHD6tCKusYJ50othVp2DCMDbsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dQ27fkGj4lBwEYgQ4NhUjwsMo/IArcm5Fa1XCfLUQWg06b2OIWj87U36UzaFXGv7jlCmLGyh1wfMmhXFGEYVz6F0ftIA4lab2Qs25fdLEPMjwUC7qkHiMWXc62u8U+KHR7CEIbAmCsezMN6Ay0t3QM8JBXFTlecZ23x1WCEcIN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=DQ81YEig; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=dNyEwPuI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="DQ81YEig";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dNyEwPuI"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5627MY43025688;
	Wed, 2 Jul 2025 10:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=sBxpu7gyITgf843fHb
	HD6tCKusYJ50othVp2DCMDbsQ=; b=DQ81YEigfYkcCeTzbMxkAO605mMeL9pS/8
	9Vbuon+aHjzg45qJQGzhKdDiodUTwW94eUBkKIZe6dfAiad/Gr8q1IzF/phIR0Ql
	iTuL4OTndsQGFOxW2BRCRVYcs9bk1s67XRn9WbeVLz0+IZcpMYpjlOeNV6znANOg
	HIn0ojBQhbEGu/n4vbcCMNPEjfu6kHYgbY5HJ/01ACyQILJ3pVByUsSv4/IyCHNl
	SpKozIj/DRUaBn7gJI9AxIfw0Uq3CXhqMHmbmwYFGJZ+qMY7nRFUp2vaC3U0gU02
	2KVXw9vADvowmbiOqlkDIBUIr9vLtapKGeE6CMlntBXy6DaxwbZA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j766epj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 10:32:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5629lhY8030141;
	Wed, 2 Jul 2025 10:32:42 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ub2sq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 10:32:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/ulfQKIshFaYKrxDSraSjvKvtHX0i7/gizPSEaqjocrKZQ1Lp2FsLryHwb+Ar1zQBMd65w3G/r16F2CTgDUSiof0rTRHnWnq3aDNI350eLgs2vAymKkvXuaOH7Hy2zTvvwMNGdQEEXHTlaCqwaytBO12fQvhYDqC1tko8bJBXIdmVSy9mWnk5VaW6UdV5HKlETVnjqIOeduDNlq5bkkQY4wyxDGfvhR7WxhMXf42GxLdnNvUuUERswF6cs6vUEyWQM1HNwfwXGGNX1a4bZ+hozvhAcfmf5Lk4TFxN59hBaujvW93/p1u+nPD5GSZdpk3p8eO6EG3gt7MpbSKri/+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBxpu7gyITgf843fHbHD6tCKusYJ50othVp2DCMDbsQ=;
 b=J6/CIAXCurwDlShu07QoithyBhKQ9M9DKQpIVdFD2GYCX9SXt+scbc3/f6VFuaaWjBZlssOfe1IzJk6mUTemkIZZRu8uQPPNpYOZMA1kxRv27DF0Z4kQkD4wRQ9rcfu3MHh6orSdvmnVOZvkP7SWaLIlFCCZQd79GDqokMSEDWq2qithObJrhL1PXPE3/3FV0AIcmyhfm4IeickjX6ydekJKrp7mU1Buw2QpszavBwLIlIZrE38zwzCjvZGQMZrqM7Pb6MUh35LIyTdk3CUdwpyYfsDQCTJS7bUaMO9E2IUoxSrGLfTbrwktzKlIUGsljH9y8O8rA5Sc7qJlR3VABg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBxpu7gyITgf843fHbHD6tCKusYJ50othVp2DCMDbsQ=;
 b=dNyEwPuI0W5CvVOcYohGG3ptFjuQwAB3inO3a8tvXrH4rKH1DU/xly0Bp1SAjEsgVTl2iaymBvdU9nQuBtPWylN44JfioTYBYxJEzbcMA4pWCtHhG4onT3pfSsNohKaPeJX2geC3KDoQpB4VDz70En0SZ8fMgozAR5tkptjY5do=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8417.namprd10.prod.outlook.com (2603:10b6:208:573::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 2 Jul
 2025 10:32:39 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8880.027; Wed, 2 Jul 2025
 10:32:39 +0000
Date: Wed, 2 Jul 2025 11:32:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 3/4] mm: Optimize mprotect() by PTE-batching
Message-ID: <3ce333ae-dae2-4341-83c5-39877b6f2bd4@lucifer.local>
References: <20250628113435.46678-4-dev.jain@arm.com>
 <0315c016-d707-42b9-8038-7a2d5e4387f6@lucifer.local>
 <ec2c3f60-43e9-47d9-9058-49d608845200@arm.com>
 <5900e978-6349-4a3d-a384-758889b678a0@lucifer.local>
 <3776ac82-4cd5-41e7-9b96-137a1ae6f473@arm.com>
 <64c2ec85-87ed-4793-b0e9-a68eac1a8020@lucifer.local>
 <a2165422-0d78-4549-bc34-a8bbcdb6513f@arm.com>
 <61f50191-8bd0-4f25-b3b7-86605af8c0c6@lucifer.local>
 <aed58edc-88c3-47bf-8cc3-bb8d80c4e221@arm.com>
 <d54cf100-3c74-450c-a7d1-8fedbc97bdb8@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d54cf100-3c74-450c-a7d1-8fedbc97bdb8@lucifer.local>
X-ClientProxiedBy: LO4P302CA0041.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f37af1-ee67-4b10-168d-08ddb953c511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zxUPiQ3iFwbL/kIgSnnjiSYbMDY4ElRjjorwDwf5TQMgVUSGzkW63GvRTvqZ?=
 =?us-ascii?Q?J8z/sSFqP6zfFmQ7LvCA8qyXFpa+iujSZYixdGb3rlJQ+Donkc51HnQCzQ0b?=
 =?us-ascii?Q?kv42s+jGWYM7kLX9jGuTD9r2j4/LjJkmaSsoPL0L1sCCVRV2+/+rrFs6GyeL?=
 =?us-ascii?Q?T2U8LOnYrrGekOHC1REDxOsvQJiuqx4ItLMLcNIJwhqZm6WDnCr1oy1zhbs8?=
 =?us-ascii?Q?MP4d8q9cgK7/bBr1zLCJjoAD/PNZ+oNq+oddAusM4/j82h/nCSL36BFFpvAi?=
 =?us-ascii?Q?83z6lSZiGEzgF/Rt9df8TOn3cCp8aE8+qiJQSPuVsPYBj1iVXs47++nRfCLv?=
 =?us-ascii?Q?6ucp6et+MJtraQLgq3jqBvXfB5ZIhSdT/iyUZ5p3Lg4pQYdNmOWnDhjDXsHn?=
 =?us-ascii?Q?8lGjo440J1a2grplhZEnOGCHvlJvjetPUrfiB9mtw2Rep+FQTDxdOK9H8FtQ?=
 =?us-ascii?Q?4TnnyKONqnYLlg7Gld25822gRAWinFfW7YtMJZKEdRWnvdPNmLVo/+DVbhZG?=
 =?us-ascii?Q?UwiL/ycMQEwJX15fjMeEEZsBceqo4LGJ2D+25Px1qPbq/aweY7315w7i1fP3?=
 =?us-ascii?Q?WfIqV1AJsbkUXe3HZ8agBtY6RRELthot30xEAxJAL0pM8kHYRlU408X1aqQn?=
 =?us-ascii?Q?r4YyKXe9zWo1N62D7cxK5o1YPJcdIk11KXSs51ZsQGvzfjqsERw8tXvBLTuF?=
 =?us-ascii?Q?Ll6IXE5U0ovp4ZSjlP6SkhEf/vnSI2s6woRW1o/6xIAIAlzfJ5IFzEa16sr6?=
 =?us-ascii?Q?sjczGSmeONakwPeQtJwYUgdPw0A5v4caYbo9zZhBgASe5UVd5eUPgxW1klnd?=
 =?us-ascii?Q?y8A9SbB7kifsnf4X3740yRzVjN+lTsUFNTKOwssfhJq8bF5Cd/VkWOMcA0Tq?=
 =?us-ascii?Q?i4FltRYTW2Ff5gEtp7qURNhdEn3X1vUua4c+qxG2BYempCKLT2frDg8QLwDX?=
 =?us-ascii?Q?VKw+X4wzpNYwJyC9oaXQVA2Uh57McX/RaVhVkwbNeg4CGf7GE9ZKF9zCfIOo?=
 =?us-ascii?Q?8tjD7B/GCsduKrsVcyK9mgqNr4hyHCdhla3TQVpOWIwuLvpqqoaE5yldHfCD?=
 =?us-ascii?Q?SbDnLtsSw87/rrxmddbbVHN1WOpxuCQPGmghsCu+zX04kiJY3A/M+uupOJ69?=
 =?us-ascii?Q?M2LdT/2Uw2EstJ4piK5FGp9YrzA26TN6T1Hng6PlDpiIi97rMeszRln3Mk3O?=
 =?us-ascii?Q?MZy6WaVvjL1juaBmkk63n8rgC6DIi9FtVw6JyYwuCABwPvO+LnM1m4kGvVqO?=
 =?us-ascii?Q?gDyCUcmHjNfdmH28soLovL1YC+hScQY/wKYmoeXd29aEYLOjxyTbavymWUS6?=
 =?us-ascii?Q?s3Br2fclqxOSyffPSGQm2FlG277I56QrrYNBqCnFefWd38t0thDASF4TZaHF?=
 =?us-ascii?Q?53LR5BPWl68z2LPtJx62c5x5UZwibfy0Xy+0C4uV9m+74DGPI6qd6waFqmSu?=
 =?us-ascii?Q?+GhS24qS1Eg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zIwBR4Sx18RducB+Xy9Z54z5zkkieCoeeKXLELuRnEAMnyzaGjBZZXczvorj?=
 =?us-ascii?Q?kQX8uIYWHPVv3i2pwiND8Wpi+H+GLJapIn37lUHtNUlvayTgj46rfxIyrzaZ?=
 =?us-ascii?Q?sNT0kSMzc120/pCJiteNwE3R8yP7u0VBz7QhbJScU/AkuQNQmBnbWA/3S+UY?=
 =?us-ascii?Q?PEMBZD3yn7MZsOq75oMcWakXBZ1HnvfKp4azwAwoD5VtJ6aR851vIsQ0lOlS?=
 =?us-ascii?Q?LnnU4gDePbCS2wRuPncnVYYR214fV+jYW6mtZGzVOddH6YNbLBVZG5vtTzzI?=
 =?us-ascii?Q?1pQ9+vPqlFOrEUlb2eR5KUgu8U2WqwqzGuxhacovL5YwblTpx+Jbfb5brazG?=
 =?us-ascii?Q?Gcms45EW20+XSwbbt3V/sGb8mhF/gfTOPy1w4nvrxR5yWiGIsfhG1sySih6e?=
 =?us-ascii?Q?hOKy1wLKXpyGZrfCF8cMGLNKVDhacX2/cRGTP9uSzGNiUwITjnyoVvwgLiOI?=
 =?us-ascii?Q?/DfuesUyNdBfcZX0eNIU9jaMcnwyHmI7MOImaACXWr2zMKoO4uB7/TWDt8rL?=
 =?us-ascii?Q?TEpTbMdHFblCWSTFpnVeMjDTSIYtgZL2lfaVM2vbv6WKADmgZsnuVBVWLwss?=
 =?us-ascii?Q?5vU5KrTy3gxEwZZawsMeAmCaepm8K1+9zOK9K5vqIOHLMiPL9DmUlXl2uLMY?=
 =?us-ascii?Q?BAx7xpFTOyplgftfXZet3rnFJtGxuhBrjK8EyIjTAEI2gxEPzWGe/gPxifF2?=
 =?us-ascii?Q?xsfXLIIfS77fQvp9sm8xx47k7ITFPqw2pBSO5IrRoB9WBnyM57HMTrztPLbv?=
 =?us-ascii?Q?R+l/dmxrqFhbpM7geZeoZKiJk84EbbO230mtloWg3jvp6Zsq9gF0FpLAr4u5?=
 =?us-ascii?Q?EoItN1Ro4pk//disbvhjasouoIgDLtfxOcdwsLN1H/CHK4Hb1wApBCl6sWsp?=
 =?us-ascii?Q?5WMX0vgkEl8NQY2wxGjmelcLnQ2yA6bzKeON4YTpIR0ePkY6G9PmyrGYBeL/?=
 =?us-ascii?Q?7nauuhRAZVcOlyp+AOrmPmOaTXLDs707hUbazM0rghKKHZPGVfrbrDtwi/iN?=
 =?us-ascii?Q?BuRe8fKD4d1WkSWAEnyoFOEPNzsMh2bEesWTIeOr8kTkb6E10595YmhZAy/0?=
 =?us-ascii?Q?p6TZQebSiPFyopL6pvrdr9ZysdrZG/qkGrkmsBmNGiwJ5MrvXb+qAGXVAMmE?=
 =?us-ascii?Q?hZYFR/uJu9mFlo4GYbSW12oEhVhQubh7wKgSIcKm/LA9obEhuxhdM3ngdZpY?=
 =?us-ascii?Q?gTWnpIWs8XRBs4NOf85YMRQyMCrTqU6Dkww0IlMv4VCYhS+HcyeDreKYahFX?=
 =?us-ascii?Q?QwA/n191lYxCSGRz1x17ypuje5Z6TI5dvA8xqZJRuYwJ2ChFESZ+wYEzz3QD?=
 =?us-ascii?Q?TTSEzHI9gtBHVtc4YX8m9EnUJebBXfkSzX0bsWL5775JkTQCGsyq2nTgKqMY?=
 =?us-ascii?Q?NhcAbf0HSN0Su3TVCxdisu2ZSWPEEYm+5zDF3f/MroVRCu+1pA2pRoHSww6G?=
 =?us-ascii?Q?qyW7Rr+TEcjxvI+pdUyVuqCwgT7Ou0Y7azehaAATkji/1lRznx6G7MSkrkw+?=
 =?us-ascii?Q?cTlvzYFOTb9rm9vCsuMLoemMghN/sJRAuSkcr38pVG0ShuHqYaQkVMzwtFsi?=
 =?us-ascii?Q?uXPFzrBaYOHjj0kPirUNBdrrMBZYjyL8V662SMyi7sOfnkq67Az2Jpuz8nDH?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	87UNenBLI29A2LyllBFUpM+ZHaD0ue6IHbpf8iPMKdGzaqkfmFFcWhBySaMmrfcItlVrsgA4wGxwkwtsCE9mIMnME9MYW3XbX0kRJN/nx2ky81IWrUz9/fDtruDvndNnVqp+QJll1G2c28du/P0zScCKx2JenwYKypNB3wpsB7ak7J+t7wUnOe2wjDd8j+vkgjTnziEAA7vX7vuVx/ENGymaOUFu37M2+qoBaQ1BFQ/DIXtIP67ipzX4oSEP9/jwCZsRmePILBmuGc6BHOMx1YAE3RTKhuTYrUxHR4S1Bej+73Xekzf9AM1ioSx36/doYaTGE3NQiEjKRD5gE0S7L3bdcU2jtf5soK1IV+EPG2ZVx1Ecbfh1wgaM4dkm8dwd4kfS4m6QavkTa1wlfYphckFy7RbCMjegAhWVWJevIjMugufcYjyTVAW6ErQJkWMwxewUWZtuRb1XXNbe/H6RuSW5tglmRppneJBAmfVOfLFkujtfSJP8eSwrT5XS54Ss8iUUIduEdmbBd6SAStgeJcLHoNZ7PQkjDu9gR42lpc2Hyn1pwhGIIdXip+wTowv76sdv2s3zjpkfonnUeegTV/cwshJYjJNVrIoYU1gf7Fk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f37af1-ee67-4b10-168d-08ddb953c511
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 10:32:39.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +efWKlcas2F7Pp63pKgJZQiJg/6gHZomSqu+6tjVs+hNvbAQEPEjMjCiVNwhKxU4TCkZC0e2NBhrQW8FeQYN8IZyJ+Ye0g9wWGXyi/yBAyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8417
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=946 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507020085
X-Proofpoint-GUID: MbqPPvZDZa9eAo4da3LJPbAH1obXf4_6
X-Proofpoint-ORIG-GUID: MbqPPvZDZa9eAo4da3LJPbAH1obXf4_6
X-Authority-Analysis: v=2.4 cv=b82y4sGx c=1 sm=1 tr=0 ts=68650acb b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=UGjIexrLDdwWRe8ZFiAA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14723
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4NSBTYWx0ZWRfXzZwn537SnNoU oeYI2YsTZT/jb8diVYcKxKoE9dVaLUG3aHZZu7zS6mvi2MsB2G4+4x+vFppI3QviAV2Cl927eZN YExbeynHzR+uGN3SkFun3yN2FBhbgjS89xrhI+bhxMqFM2tzYKDhhMrWp7U5OE6xjP5Fxspv+Ts
 WoBbBdNNbBtjCa0mfYE4hHo5WW8M/kPypVMYXIUexNTH4lbhxQXrPX4SLTE3gSewB8G66BOfGjt 41pFQrDzUM+gy7LEyg0yH0MpN4AFlrYl/B+4R9OPY79rvKQWVequSVTsVyEoPo90RUZcoBIP/YO z/bpbB7xZWtEVuKPBDcPEApZorm8lV9jcvuw7IW4/iop5/zoJeg42u+uTSldDT25RZgyuD72JUR
 0Ln9JlTbMa4Qw6D3I8bD+E4xBnTNYHxc8pppjW6ZBaXSaeMqH1lYayM+7tkja0AavdjhowVo

On Tue, Jul 01, 2025 at 02:40:14PM +0100, Lorenzo Stoakes wrote:
> Let me fiddle with this code and see if I can suggest something sensible.

OK this is _even more fiddly_ than I thought.

Dev - feel free to do a respin (once David's stuff's landed in mm-new, which I
think maybe it has now?), and we can maybe discuss a v6 with everything else in
place if this is still problematic.

Ryan mentioned an iterator solution, which actually now seems sensible here, if
fiddly. Please do try to attack that in v5 to see if something's workable there.

Why are computers so complicated...
