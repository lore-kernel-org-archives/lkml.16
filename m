Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC842F1FF6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750914219; cv=fail; b=ARHSmw2Qz/2qwSL2XREV7CbVnWh2ezdXtnYrjo2lMeTgIjdZ+fkA10Ov3lTfyZP6wdhzTyue6e4pWo9kS08fwIY/HaHnPOnkmO161vpgNHGm9XshUSYKvrQkjXav41Qv9ARJSRJVYO32cHeB/aDJe2m6Rxgpa62BXJ3vyMG9XxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750914219; c=relaxed/simple;
	bh=H8tIzFhZ3khNmF6Hs9ey/oVXbsiQSdYxEgI6ty/tfjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JbkxMTifW8m3lkhn3d0kaxhhUP7MPLIeCHKkVfH5KQFxmL8ZbShQY51LddBSaRq0+tajw0StyWlEtNDb7YjwVX5cLSofM0YVp2VJijOhwqPi8EabUpEIOXyVKQKCR+XyXAwNpHJ7aok2fwLJ7Zx7Y3jIjc1k5BnwaAzVw2S56T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=C+qcqdTh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QqTjwgOF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="C+qcqdTh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QqTjwgOF"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PLBYPQ017950;
	Thu, 26 Jun 2025 05:02:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=H8tIzFhZ3khNmF6Hs9
	ey/oVXbsiQSdYxEgI6ty/tfjU=; b=C+qcqdThreqyAhmvYhCwvRgTz4fjC1kk77
	pfzcDiJruMjWdUyQ7DUPUujv8pUbB3dckKTnm0lPwHtwIp2gnCj6HcIopGhXBJ5s
	jHx+su8BBQYmKcnKh33wJPlekFnmlGljVOJaTbZJpYYq84Rra8dDfoMJuYDseNXX
	txzFsmDbuUxCsoBAiWNCIVB/jQllcva0wi/0ki+uEvxzxyKKEol1AL1VCi38ZdwU
	zMTX1nds7fDY+4T9Y2+kGICyFguj59g76doQHBBo5N4W2Hn6YXCzbtALB3aDukM0
	pjZKnYck+p3MeIzWclyajZT33r1RbQGolfPOOgl0mcFgNkaAiWgQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumqye1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 05:02:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q22Uqb013378;
	Thu, 26 Jun 2025 05:02:31 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvyg1aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 05:02:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVpO2houy4waaIYz2nt2nA0CkFN6KbEYuhVKutNvTZJvyATp6hcjQ2gqM5XENqg/B3IMP4foMjXhYHNMffJq0QRn/3fjDFmp8RSKVFuhheJHH7oGhkhrpeJIJKgGnN/X6YHCr7M3uchZQVivJBhPnCFgvyibnPXK8FqmUr97WE6WBR5tcAfqzFJuzr+HQtQjpJonnseuHTi38sTdDV2v52SQSJ1xoS+bCHrbc9aiETySJZmPTktnUK4A/WmqwlGd4mFn2N0yRAVR1C90X1/0cGyAyHQW8U9sH3zfZUL7v8X5bRSetXt3j8k3rkyEIITKkPVzcnl0u1Kz+UBj2UZtNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8tIzFhZ3khNmF6Hs9ey/oVXbsiQSdYxEgI6ty/tfjU=;
 b=xN++Xvbcd2w3o9iwRBNfVvgioNU7dq7i2H5TewPQRzNPZI4rmDowTBIUEsJoWJW3IYgx1uocJlK0mEzF791teuNuNAYpQR2rUajr/EYQGceaq83XoZK5EhJvJNMXtfdKd4L+l2aUqie0FRndKRa2BO0o/P85NJaiS3eBsTqzEAm8G1vkZk7u/jyihOscSZvRglBJ9H9eGVeSIflDfCVRsLa5R7cvuIszXQzHbAz5eD4MeJUBvZLsWNgRJ1ZliZl5nLOpru8mJHz7VmAHV68yccgVjnwL0BmRK2jby4eltTwUaOiruHRFfCA6nDm2lDz6JZx8D95NU6wM3A8bPvzw+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8tIzFhZ3khNmF6Hs9ey/oVXbsiQSdYxEgI6ty/tfjU=;
 b=QqTjwgOFAAoNl+hiVcJ6GNuneHHkMfvU8npzb3tkhnb8TqS9lohcnHnRQIAZA2EB5izKdMT9NCKk0nafcZ/dujqx8uilEn3OnaVFv2K0Ej0Ub2wa2WgHZqxJ4eamZwEaay+yDK03oPvfsEDQPTjK/V2D9gCbCJtwjrUy3lPoLi8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4512.namprd10.prod.outlook.com (2603:10b6:a03:2dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 05:02:27 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 05:02:27 +0000
Date: Thu, 26 Jun 2025 06:02:25 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] khugepaged: Reduce race probability between
 migration and khugepaged
Message-ID: <f3b2ae95-cc0e-42a5-858e-a614578553a6@lucifer.local>
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-4-dev.jain@arm.com>
 <e94c3460-144d-4243-98a3-fbced10feefe@lucifer.local>
 <6989406d-dfdf-4be5-b467-bb3b0d32d384@arm.com>
 <1ce8408d-32b0-469d-a560-2e0050cb91d2@lucifer.local>
 <561b17cd-ad82-45ca-aba2-78515873ebb8@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <561b17cd-ad82-45ca-aba2-78515873ebb8@arm.com>
X-ClientProxiedBy: LO4P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4512:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8f9457-e2ea-4bb4-75cc-08ddb46ea5bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mSilvEyI1TKcEJSj/jGXe8fKrW9PQrdoj0gEWSVER9Rvtk1LIAN7p7ZNPeJI?=
 =?us-ascii?Q?eid7rdYZKp89+mLu0SPrT48UGKbe+xSWpJM+k0SM6UP80ygBd5b0oed27jdA?=
 =?us-ascii?Q?3LbBnajadWG/sRkVgGlX9gUwOKnEStaJVhn54njcy2sEvHUtmV6aincNm+l1?=
 =?us-ascii?Q?aC3qQ5C7i8kgxvg9ShkOwNtdj0FEImRPOVwaKoMMBvS3CDyVNDLnNA+cFpVo?=
 =?us-ascii?Q?bSI//G7fWra+FeNNpubS7/ILe0VZZQsvyMVLycKlYdC9blIM3+eCjdCOVAbm?=
 =?us-ascii?Q?2BxqV6PU/GDpS7D7h+azYftlUWGtqGL9VdtggNqgmw7pJ4qhyafGhBECslQ/?=
 =?us-ascii?Q?Da310KFn259PcpH/sBDvMQ3ecpPHBpbeMUAj6NJ9+7x9b10SqohnQg/4/ZeT?=
 =?us-ascii?Q?9G7PCK+wjpf0wsquevEGJBi7phCafl8FMXNlaHVDCHzeGCfiiNlUSI+vf565?=
 =?us-ascii?Q?xIzdC0m5J7SX9r6nTk2esDg1UMkUvjf6vBmg7fEkUQD+QogYo6E9JnBeP7nN?=
 =?us-ascii?Q?u6bYR1tFlkKjl8dN2H1S25Of61JyW852Yk1+m/QhCvNTju8PSRw3EVJbGQ95?=
 =?us-ascii?Q?u5gpCdgsDr7redYV8QBoy/WGY8yMumwKahT0SWyS5ZZDzFlLNu6vsaPWcVgk?=
 =?us-ascii?Q?i0SWh1JASFpAqfJ2GEckR/YdrF3dQ81CSsRy6SJd1hVTs1BcLkkLDm2mmYx1?=
 =?us-ascii?Q?F+rVK+hVBwdfcdGyIkMC+haaL25uj+MjLaDiCYeNL1hKCzXHIQgY554F526D?=
 =?us-ascii?Q?uw6489NzIC8QjKhUIXF/TaLCmKQd46gNbdKuaJMjVORQiYEA5Yw+EU9tOY9+?=
 =?us-ascii?Q?FzIXdheZ85pKV+tN7vu/Z+fX0X5xk4C9uiOzNRJkKG4tf9VjUlMFnR8lSey4?=
 =?us-ascii?Q?91ByOTkMLDB7WIcj35ZBRDL+l031wI3QgslaDnjqCyIUUAe1v02fiKI6y8eL?=
 =?us-ascii?Q?qNPg/0MTqJgAFdcXdw8fn//Py5j0CcD0OIIp5cVRbJlRNS6e5U//Q3+mrUUU?=
 =?us-ascii?Q?7ogcHTyrR1mGwbMm5y7Ei96GnzsbBLQrjVmb+HEJ65OwXj+dehebQTiwiFWC?=
 =?us-ascii?Q?Le30k/tyDUGRkjj+7D0UbivRYD+YvHzKsth3VZ9ksCbq4bDBakN/qyNQ5RFU?=
 =?us-ascii?Q?AgQGjWH+U18pF8LpIGB+huqIFU2KkkYMYc43ul48Vu6yKL3+N4O0UELz4Ua4?=
 =?us-ascii?Q?boTG4TmJgamDgtsd8IqAF58HDtwN0qBGvpBLOo16CmfEytnGTFprPMZBp/dH?=
 =?us-ascii?Q?mlcT6exymMonVUu6L/gB33HUM5LhLD0cyBt7h/YXnitTrIKuUhPaotNIbId/?=
 =?us-ascii?Q?Fee+ZuB9W/5X09I0XvfEIlalRpdvX27JaiQpPrzUWJ1UD4MOCliFHWXiwZjF?=
 =?us-ascii?Q?98yQtXTq8IGYTvbjSbmP4pu96E9DPFVZqP2Kw0LJhL84aQhQJfnpYtAHnLi1?=
 =?us-ascii?Q?AvkHAI+oiKo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GDYSWCs+fydc50VqY9Rv/igFM4Y1b7RhXxryArckhXckLHHeNpNNxLkcro6e?=
 =?us-ascii?Q?AZHNOW/FOglDexA326GE49sV3Yg+T+IFTaI4KhFRxMKyqHiJNDn6+cqbC7WN?=
 =?us-ascii?Q?RVcSfekr2ppNPvX0kFRpOedNIQMtYnGtZDZ80iUiquYWJL5oq6lBddtjEvvu?=
 =?us-ascii?Q?PKDb6m6PacGtTTqnoxXFvJYSY6g8GI154iFLfbBelSS3/bhKyO+gBksz4cHv?=
 =?us-ascii?Q?IzhR/7jEXzD00yLeCIe2/o/8L+e6a2cew+Nhinjg5m7Sa2JvXqiVlnV9JyxX?=
 =?us-ascii?Q?WlTeM81OBbRqRObDbPEmffpRY3DkftLKY4il1q4ZmoRhj5uaeXMc9iv46E4W?=
 =?us-ascii?Q?h0r4GhFN8mANEOkRSAe3yKoUPfSQMZwbimu186KKXOZFfetS6WvMwkM8BjBt?=
 =?us-ascii?Q?mWXTFaFlvykSTyDEfBfC9aDJXsCOkkCwkkzzsYc4d3jIlQv1RRHtq01Kxi/s?=
 =?us-ascii?Q?50pq/mDglVhyUqwUStd/E8LYIDDg6L1xkudV2n9b7XVsy28jv1zwkD5/IhL0?=
 =?us-ascii?Q?h07JIonbM2ZDoF1XpBlxsQnhURGKoxXKQqsdeFu1ZRkxFGljkZOQLP4BPs7e?=
 =?us-ascii?Q?iFqY2ZNAmORqA73YOELJaejk+yK3LfHybUXeoRRFrsKSzVedrJHBDxh9xBAZ?=
 =?us-ascii?Q?gGYUceAOCDI9SGXrEVubgmNqPtnQnopAxBiV3foE0ESVDdx6VW34YweAmHJQ?=
 =?us-ascii?Q?Zs0nfvEeTXnKzjEbQcI0H+ecjk4VPN7HuI3SAs9HpMKoW0TTF2n8vMTR6e+s?=
 =?us-ascii?Q?Sb+/c3Vk3qAewLyjLT/wnx+f7J8tTdztmRAAagj3wKOTWJvsOOLltS0is5K2?=
 =?us-ascii?Q?k0XJ0Aat8aH0rBfoH7DLsfeikEncUPSkUm0iGXHq9nu6wUpvwi3HmcR71Wwi?=
 =?us-ascii?Q?1hvVINFhUJChbFElhF6LkVoIzufq09L+WoT8t3itytmWgUHLqEn0P54mBBMG?=
 =?us-ascii?Q?KO1dZwNTFsLDpYffNJA9WNNHPMHen6H4ToaazNfYEO3Ne6bgkSLzEo2PXr6k?=
 =?us-ascii?Q?lvKeqDzkNhAQnIL4tJyX1Y7y/IffZgr5xtcGx/Smc+B1//L9oBW61ThlC7b8?=
 =?us-ascii?Q?aZNu+i5oMvU8RZxoZ5G3W1pTWK5qooOzsqry+AB/cj1piyIYTVeZM2us5JFc?=
 =?us-ascii?Q?Q6LCspzBg97YBxUyzk4nEfL61RRtkSs5D+2u0wN731s/jTTIq1hfVt0NLqGh?=
 =?us-ascii?Q?IMG5AAzuAcftoN0LPjYpudQik1dCg+rm5FVaIjEMa+6fAnXSYFEzueIqaImX?=
 =?us-ascii?Q?njaCc+jbw746LLDVkzJIIVTofKoLBzqLDmQaOHfPlL0Xbcv2BmQQEDhGsz+2?=
 =?us-ascii?Q?4vQwnpyuSKyrgRxLNgME4du61E7vwZ0vBVPgaJ6s2paarT0r8bcF20W2pZBe?=
 =?us-ascii?Q?0pM1hYMqfe4DJby2YNrRHS1Gr2spHY2W/mLyhMi65nAGYWE8+Cp1Ug4u3Acy?=
 =?us-ascii?Q?/+Qv45jjAY/e5YbVpuqet+qNFdroTxFTzJ3u9slMjZjGOKEmKvdAX0rfPk5y?=
 =?us-ascii?Q?vnQKpYRtqHEUnLUWVelOqQ7XHFyHORLT+GmVtewerJ8i3Ka5SzFu6h175zFc?=
 =?us-ascii?Q?zKaSoyy1tMzOVZU9q5oeUUtvnyti9t0CwyR0KdHHNh/R5yrUAv7TYl0J/L+s?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0Quax7fWBZ2abMhn0WlbjPbN0cZfYzZ4u/FWPl/f7X5xPUi2PUakGdjeOADyD9Z3Y/p2sHM86Ew4p+ClRp68TJfJs9P+F2icGoFVI094N/T41cH6IPZbWcb8iXiXycn5FF8b2aRttQ9TkFJe9uAWToxLugrOIHOlhbxLBIm25T8HTc/EyLLmCoXbJ2Q26Nuenlhm90v31xeMkmZpOHqPQzgWGBYQT/GBl9DWPbYh+Irv5j+1B1GBJCW3oPE9/HsYogL59nfEoGj4jrIYncefS+7odniRWZDT8DDnx2MetRl1iUhy6RVCRaQ9OyhflkNmKNmXsirQBOgZlH4lzyvcam7SDXXolVON4ZeG8li++xL+3qawo8fCp1SVOi7trYoJ4bL3Um17X81aORsdoiGnzNdeTUqjafAtKDZ/qgPoXwZOJH8SQQal/RN7bYNXiy4hLCVqgfeJ+ieEES8R8kSySh/S6UiRqDBUfpakzlIY/gldL24k71t2HaNa2H9Qn8jeqmp6RU4nrKqBpWLN6zpq6qUMW/kWeGA8sjLr9JyItAw4DwcOVzQOrS9UYxnmyIWEwZIoV4p67Xuxto8w/q8fdalAJovcJqEVVlDQXEJmbMo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8f9457-e2ea-4bb4-75cc-08ddb46ea5bf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 05:02:27.7423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UX0Y2lvZyDeKIU8U0mMil+5tlKp6fIKnttJB0sWP4Alag1GR3jpCho6rxDDEeAZeYoFgZIYrWsEoXoYpLgiLvcteFcQ1EVDTcLSMcYCzHjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4512
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_02,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=811
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506260037
X-Proofpoint-ORIG-GUID: wj6NNo4Gi5uO456DtrPsXdscH4-NKQ5W
X-Proofpoint-GUID: wj6NNo4Gi5uO456DtrPsXdscH4-NKQ5W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDAzOCBTYWx0ZWRfX+hnYw8mfNCEF BPrFVA6FRal278Ar4LFHC4XcvZ6sLCfb4TwMhxhkeqyaJBi4l7/0PDcvVh3xxv6d8xFfht6W9mO KIWQ2EFzi0zJqkXEN0Dx0GrP336yObkk49R/OQZOuzMtYl6igYPNmgd+C6oRV5ZUjUYiHc5iWJF
 tmXyCKjQcOpHNFw/rc9BrKDoPMhirNUg6oXIH05FYDi6qKdpUdQCRnV6WOlUyPN6pcRFFZxHPAV Zr0SVCTA7FY1RVLMb23iCd81OAbc7+M4l88MJwv4CP1P0hrBskXhaC3896wGWbOy5UTqzqY13FM gjySOIlX39F9/au+q6kGOMsvlZNXI55gXKGOEmrRH60eEF9EtpuSKpuyE03aj5CGktxI10ALeep
 yNwR7oZwVw/fQavfeIFuWO20sSXf+BTWDs+Wq0vP9Rvc4w4Jff+d05uJz+DmeZfT7iC0tFGT
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685cd467 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=XAXrTimTKJgg8hbwr6YA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14723

On Thu, Jun 26, 2025 at 10:29:22AM +0530, Dev Jain wrote:
>
> On 26/06/25 10:27 am, Lorenzo Stoakes wrote:
> > On Thu, Jun 26, 2025 at 09:22:28AM +0530, Dev Jain wrote:
> > > On 25/06/25 6:58 pm, Lorenzo Stoakes wrote:
> > > > On Wed, Jun 25, 2025 at 11:28:06AM +0530, Dev Jain wrote:
> > > > > Suppose a folio is under migration, and khugepaged is also trying to
> > > > > collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
> > > > > page cache via filemap_lock_folio(), thus taking a reference on the folio
> > > > > and sleeping on the folio lock, since the lock is held by the migration
> > > > > path. Migration will then fail in
> > > > > __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
> > > > > such a race happening (leading to migration failure) by bailing out
> > > > > if we detect a PMD is marked with a migration entry.
> > > > >
> > > > > This fixes the migration-shared-anon-thp testcase failure on Apple M3.
> > > > Hm is this related to the series at all? Seems somewhat unrelated?
> > > Not related.
> > >
> > > > Is there a Fixes, Closes, etc.? Do we need something in stable?
> > > We don't need anything. This is an "expected race" in the sense that
> > > both migration and khugepaged collapse are best effort algorithms.
> > > I am just seeing a test failure on my system because my system hits
> > > the race more often. So this patch reduces the window for the race.
> > Does it rely on previous patches? If not probably best to send this one
> > separately :)
>
> To prevent rebasing headaches for others (if any) I thought to send all together.
> I'll send it separately if still that is the preference.
>
>

Oh actually would it be a pain to rebase given the previous 2 patches? Maybe
leave it then. And I can actually finally review it... :)
