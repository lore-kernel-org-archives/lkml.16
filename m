Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC0728C020
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750364861; cv=fail; b=anBh5ZzYrHS3QOdVDGKt0qKxny+AGXPXNxH1RQ2M0GapCwkY2s/5r3bnemmaACq4Hel+58SkWTu3AMTWJGs3lFGSG8HDWc3lIlDJanKP+lB+KSBWpo7hoEOOWWzZ9+2WpbpXlpJitu7CPe2Sh5Tc+XbBL0oGKxLefH9Yclcfrm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750364861; c=relaxed/simple;
	bh=qt6SC03XVMrHDelV+VGEdVST+NwA2m+1JVHLicIJ7OE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IzBX47zTS0Sf7KP/Xu35/N1LFPkmGWJqmOadeJbFIuamcN/HQ7yuvKSL+hE+weSxerUZsI7v7TByqVeLuLxmY0ysPDxhv6NDRRhLQhUMC9A5ekxkHZdru+tzm87zyn9V7rGQ4jEWih0VEh5xVvm48TFxP582gONA1mk83+dMmXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MuR5t5Nb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wPUvp9EZ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MuR5t5Nb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wPUvp9EZ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIfcdD024029;
	Thu, 19 Jun 2025 20:27:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BLNjzKfOtqQbmhieFH2UfsuRD7cBNC89f2+1XhpaX7A=; b=
	MuR5t5NbLxT2Y4Gs8LsuVCDNGtVyY3RMiGRqfQBjlsq2PEo3KV4+OfUGZLMjN2tS
	pAzT0OgAARTv4w+pB1DQ7c+TGTeoVWVws0h1mvWi+iUV1muA7+njyTi70Ep044kq
	Dcj9NJaL1Y/TGzS392EPh7qAMuL5kGE4gbhHPexJdgdTXdzUFONEv4Z38mdBtyUy
	M2SNZvTIlvkKzV/oor7O0KOH3Eiw8Vf7jvtZXt31f5WaeJ+7EGzbKD5S0wv4yFF5
	AwRzfSrcKYcsCJxwt01QQzqqDqPrMHQua5rsOBHNCQ4225sa2T8VoGLiRjkmVj81
	6ICHBCK0mtLe+h+KaAy//Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790ydag25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 20:27:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIO74J018273;
	Thu, 19 Jun 2025 20:27:16 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011065.outbound.protection.outlook.com [52.101.57.65])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yhc7p3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 20:27:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2IUSfLUqa20rtxTvwpxid0CEfFXoWOxSfoiJFti/hbC4duChjudVLVU3BzIDOJ+AoKvI1hw3vsoomrp8YjUEc8OhkdL/90H1RzEDai6nnoo2WDacSCBGL8NyuN9hFJSJeBH1jHni3z6Mu7e1a79qXA8F25Bh8QS2WwQAXzIh+0JhhFOPXihCNOcG5r4DZgbPOVZNRRWuwvC22nmk1nJPDGrnJ/BcOE+P+91XFjlidhNx8UokICDRxzEl7un8oM/CBEa9dvR9vJhE6m4PY+aW6yZXx3cdu3Ep8HZFpSAtXD9CseBTIj4hgJC56Vk+HCltZs2fugfca3u1mjACMkQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLNjzKfOtqQbmhieFH2UfsuRD7cBNC89f2+1XhpaX7A=;
 b=x+LJK8KXYyt+oXJvXT2mG4m+nzcrrpxMnfVy/kvCSJ7HLtp+MMz3ekbb2rADXCGLOYPj4lUKCs0d6aMsu9cwVtimviVGJH3akTu3k9+2FSDz0GLlet8TPE+tUhoHYdNfxuu7na7hvHxW6yEHfrGLu7+UoKHkvwYJM6CHA2iS7LExlRF2Irfssu+OLwZJ6ycIQeSoS6AryZSDbjjoHB7LSGS7Sxa+lK23gKMnsrFW+eYq/h/FwO6/dg00q37C9TbE/Q+rG6L1bgglUq1aeKGQ8pWnxHrEJzS4sX3u5Dh4wt+kJZW+r/w8tvaMF4nCByo8nCSlGkcp0HkBdta9gr2DQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLNjzKfOtqQbmhieFH2UfsuRD7cBNC89f2+1XhpaX7A=;
 b=wPUvp9EZUAEb+pYA6KQZeFR8evbE2XBBYCx9qrUITeTHyrLRi18naLRSEw6lPjsrOexSAs2Rbk30O6OycnFe8BMJGYx2NRfC6/t92twLGWxffWQJxsEGs1eIkZfivJn2xXbv9LOM2s/qIGjC3I+04yASYzDlujHUWmR0dc+EjHk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO6PR10MB5791.namprd10.prod.outlook.com (2603:10b6:303:14c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Thu, 19 Jun
 2025 20:27:07 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 20:27:07 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Lance Yang <ioworker0@gmail.com>, SeongJae Park <sj@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH 4/5] mm/madvise: thread all madvise state through madv_behavior
Date: Thu, 19 Jun 2025 21:26:29 +0100
Message-ID: <ce41fab11efac21ba28b89328276076b9e389093.1750363557.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
References: <cover.1750363557.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0018.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::30) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO6PR10MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c064e48-36ac-4d54-9a9e-08ddaf6fa974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?of0ufQP2eOymHnoGP0xiGnCpqf8eX61ifLlcPU+FazvpxtrtxXFRpRMbfgoK?=
 =?us-ascii?Q?q13G1OGm1f59WPZuCtPgrvn+vQIxs6xPSAVpMnO0/BbykJkU0MdMtmXo6FyS?=
 =?us-ascii?Q?zB0i7KUlN27lgkufoix0eTQqpTMC6+RvEJvikms8xGg95I1A5Ba/Wb0ivEwH?=
 =?us-ascii?Q?+0qFqRVs9uV2jBA7KxzBAQld9yW82nHOQlDJDy/0Okd/lwLLV8EFFLA0MkVq?=
 =?us-ascii?Q?FQAFCuCy/5nE32n9VWdv43FQPR4KyWM/bvUIpKgJAlfSk5jX5t/QbcgBmL3m?=
 =?us-ascii?Q?1J6tGwoYnG3MafvHhYMC7lt/Bk71kr6urMS348Gym5I9fDp7CK1wAKCj/uf8?=
 =?us-ascii?Q?0w9aCrG+ICfkdjaWyR3iZdWj3Rn41dVUl1yex6nqY4rj+fZompkNJYiHu7v3?=
 =?us-ascii?Q?rxl75D+YZekp2HaP7NBCUKARSQ+E2AXLWgaG/R2AwmjfI2OEJYgSW8Mfm3G5?=
 =?us-ascii?Q?d+2njqJexVKzd302aRV5MP1q2rmzeDa8tvG5KXTa72siRYYRsZ7sv1ZI1hKu?=
 =?us-ascii?Q?0uEGszMew1jsnQBazTmtSqr5HEpCl/h8QdbvIDbuVSc2JzjN4wRTCSUjstuO?=
 =?us-ascii?Q?9WknAFTMQuBAqBD7lC8XEQTKG59Vi/Ypx/Lb/VmQpvUgWXTxn4ZPn1/j/aTS?=
 =?us-ascii?Q?mdSnBZg4GCbtf92Kcmdh5XxtYkPh8rCBVLpBYfHGVNfn+FV8RzVbfqUpPa0k?=
 =?us-ascii?Q?crfnupDXwKJ4XPfkr7wpdGIvv8uL7eDXKWsTpq2Rm809P9kU7n8khsjqpBcs?=
 =?us-ascii?Q?JMYS4GqfSsg9ZQdSZqDxDwEhzrfOI9YPoJD76bMCgBHfBLtpwmPxtOBMWRNH?=
 =?us-ascii?Q?bEqrCz9RNcnbRYC74zM3qBfXBvIdLAQY22zFibiUwok9dGtVLnNityaZ6DYn?=
 =?us-ascii?Q?+Zax7GsPpwcD1PstVy4jd9LUf/gZFCZakUXWf8yGhaiqLiM8Ja5J5atv3VQa?=
 =?us-ascii?Q?et2xoU7sSQItD13SAiKLm1yPniLGrv2Tbn1d3UICsgfOViUXWjDTZ9D/HYHo?=
 =?us-ascii?Q?wW9hETcP9jvU/n70stkuFk+iTcapu9COTqBAh/a1v3Z8dm88yKYm6P29Y1xq?=
 =?us-ascii?Q?OM8OgD8uFy7nF0Vlja8BjESI5WhA6yfZNqu5TnHJ8GYSsg9UNI6jUqyISTAG?=
 =?us-ascii?Q?xaeTozEq1tooXpfNSkAwPHtLONQkv22sPHAdJ1nZP0qbP94AV4ufsfEw8GIu?=
 =?us-ascii?Q?M8wNXiUrkjcQwSju1UJ82zA62HK6C6FfnYCRm6MGEoTgmhNuFRV1JJaw8ufE?=
 =?us-ascii?Q?mTyslBXblnz2dEdLEgBSO8zhq5WcmEkgtLPj/cx/fW0/lGz6ACA1ZMDXF6bK?=
 =?us-ascii?Q?Q/B0PJ5Wjox6PFShaDhiIL5E+757JFDH4xcnA4vYxt7OuB/xQhlBrHaRsdPH?=
 =?us-ascii?Q?mn5OGab0ilNDfa7YumilMi0N/fkn1nXb+sppIsyQVQ8VRTu8vepu52iQ9L6l?=
 =?us-ascii?Q?S/I7UTcI8gU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bcd/LPASQ/0A5gBOn48irEhz/NSYE0/DvtnhtZkEpHuTOD2ZmxYlKHYMa4mU?=
 =?us-ascii?Q?E52YcaU5iBoP7f8qJSKiRpyUmasS4g8e2ypywEi+Cp7M26nOjOS1NBLi7zOP?=
 =?us-ascii?Q?D8bXvRq8kP+B2vRYNHvec22oDqRUjRUrJv6dwGgFlBqgmu3wVBvPiGR8Uw9S?=
 =?us-ascii?Q?2w5tseK4iHt586euA8fw2z2bioLTkVEiml4d+vrNkH6Qf1BZgAyRtYpsSX5b?=
 =?us-ascii?Q?BgCQO+M3PH5hVJ5WZs+It6TqJYJRpginJkJzsarXe1aOs/JjosNgr+erJqTm?=
 =?us-ascii?Q?wRx/JmFaXHSeIoWTdkYVYBaFeSxM4RYL2HiaJ74IHyJeNZaraqAFfBzcOvyp?=
 =?us-ascii?Q?mC7sOc/uWBVbNred7LNX/PVgLVNPBmEwf9KUEK99OHK71vSvrFWV3Zb/bwBy?=
 =?us-ascii?Q?7hWpoHTuBrKyM2g/Ls4DalyYPW9Fw6HCttuDzXcd0Jvr50I9kRRtm/SwYaVn?=
 =?us-ascii?Q?t4IyFIaYxTLUS4MXC4Fe+KNh3NUAeGJ+TK2YXw+5Y9gjblsgwQZoHCmwb635?=
 =?us-ascii?Q?oxFHwzl19orkx/q3rs+0QoF2nFaGU1bA4TvIBuz7Nb2Wsx+e7UjMYwBT2pK6?=
 =?us-ascii?Q?H/sONOAVxQ35Db9M1LdTVmPsGd6L9OQfG1JrA70a71CWEmq3X6E2aqfzcftj?=
 =?us-ascii?Q?5tYmS8VpeNUCFvQx7rfs1qRwMHiamaOkcBH4d+iNdfcDpgyFBWL/WhF4P0w6?=
 =?us-ascii?Q?PNgABuQ7bFtLbbaQ526A/v72wY+iIszDrioPklDrnXsUez4bHD8ahlowBvw3?=
 =?us-ascii?Q?1trxe3uGM7ZUMYo+Yhl0bkelJVqVDYnUWdVrkR6HbemwEU+UJ/SE9bYtNnUf?=
 =?us-ascii?Q?o8UhiQ6VeF5jUnoI7iQtP+ThAxccJXOnhFADdrMmtjv4AQ4v3Mxb0AKO8rYy?=
 =?us-ascii?Q?Lr7FoyUeptocw/mejoNUzisB/790ftknw48eeyCDpxPYZNjmgpif5L4fKoNt?=
 =?us-ascii?Q?Hd5rtof6bGlDMJq9XK3svf63ivP0sP0qjABiPSrIq9MvhigwOgem3dV+OTn9?=
 =?us-ascii?Q?MFPTDI84yNP5QC3/bFn7GHVqdYM8S8nLbU3UxLjuJt+hLcF58F8F09fNBJJI?=
 =?us-ascii?Q?BMey4aLWXMlnlfwYsbR6jFAsohg7ebgxQg3sS007nKpr6OzedNTaTQdafq23?=
 =?us-ascii?Q?ESFaXwBFYSXElloCSCwsDBrWr+QFh959cI+J3h+/64JOQdU80YJEXSbef3nn?=
 =?us-ascii?Q?g+cKtxd+6rspZTXvsgK6jlC+NZKzbEKxKqUFcLq1G0RLAM4L0+YnCbHh+zKg?=
 =?us-ascii?Q?cWsF/pEVsOhivHRBqpoUmk+9x0wOmNSPmtuvPUn11A0qG64iAu3xU8+KBM6J?=
 =?us-ascii?Q?KG61d15t6aaL2pyxP0h4Yl0XRNO+lXKPtnwRFcC4XYJh0w5hDHIAXo/FpIRJ?=
 =?us-ascii?Q?SmTv6ToTY6OjAOW2R31YhxDiERzib5HBf85Dtjm7hVySCVfARK3UPzfVjFJj?=
 =?us-ascii?Q?1LObzvHWT0pgmZvLDBB2O7iCQWyGyUAF7/iQJweroHHhjWZXxB1HwsohR898?=
 =?us-ascii?Q?rcIh6QlC0YLZVac81KEisW4DXe0MIK6PUWUQesrhT9WiZ48EqduuvMYdj0D8?=
 =?us-ascii?Q?7O7hCeee3gUECzU8Y5WFCsUn5NMrj6Nt8fttbZr44QiTUA4zdnyBcXBx8lVL?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mYB3J+YGEDa9n4Jhni7p4SZ+NcuUAE7g4qWPwrHQ7rRX4WIunifrQ5JQYn28qE6hoTwSV7ce1pRrlZpHk1/6CuMcA93qtpq/VbdODpqwdqNrwL4Gip+vgVXscjb7BvXAOUqRl7lzIcjlBsKjU0tUopmiyeuQeSkJzFKFm8m9qq3qUYCfBetPW3jEocZMafaea3gMcZ48BrYHGkIb9aSp8TTK/yS4r+lQhtZBvvnNTjQIEYpcMQRYsDrNH685xKC0Z//t1KQpJGwv5DngynechM6pZ6hEGreV6tWvHgZ6aP8+5SchwrEdI0p+SgO2pMFzDJaMiqgfpK+N7qCufvqAnGXCvT9NOK+c9g8ZuObha6iFJk32iFEmDUn81wWcqyHiDD5ZKz96POma2jqy4eJsb0M/ny/5vjK7yvScH8cqIKcX7n6RQmrpy4tCnMwKAL1crZueWJBjTfSb1KdbRAejJvVU8A1F86QIti7Pm59fEz8Jmhx3PjWMz+G0KobWWFbtsqmvxsDy2SSplHj53uE5BkJjqqD1PeIEFbxthqeSwTbD9oBvrb+Knlsk9JIjNFpDvbMNEAqpYGWtrWQ5GI/H1VAgkFel0nOZtshzLkM3FVQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c064e48-36ac-4d54-9a9e-08ddaf6fa974
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 20:27:07.7701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9yVMUEPdTadvLaF8XJQKXDzWkeXTSZqvl75g/7JNm3tpj5kuAVK5dkCqaOLrOYz3n0zhFwsJPiSjFGZpw6v1yfgWxy6tsWgO9bOx79LqKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5791
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_07,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506190167
X-Proofpoint-GUID: fJ_F_ZAohhAas9Ez0sOlYHQz4PblKm8k
X-Proofpoint-ORIG-GUID: fJ_F_ZAohhAas9Ez0sOlYHQz4PblKm8k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDE2OCBTYWx0ZWRfX19dp+nCk0wcc OOp3bx5lR07Cu4Owyv7RTo3ZS4FVtJ9CZguclcyjNq4H1AKTUQC56rhzGicdMQ4G+tVjvccZsNg 7PnOh3RXYTXxUmTn+CUvLhSF50/0/c3CW+wU5vl7QRwOB4n9Ff6j7ew+dKkhRJN0u6AoHlAy5x1
 xuxb5Dgf6l4DoRlI5x5aU/GNrfNbllm04VCqIrCs1MT+jI9ENCe2lz9KfF+U0A9rFedqCZLOTws 2sgrfhh7kJdMsktG73cZJ8QcNodhf/2Bjsopv39EEo3divo8i+oI1MtZbkD6iwstXe59sncf3Ov OxXhHs87iRsZ/5W79sAd7lXOzZ34TD1D0MRQOciWyaWBdzjXX2iC57s+cmFbs+eS2CCzgKJhjJp
 DuLTy1o/K1qXai82mIjf8XaASwVCaVSPxmZPxlGdIfsAazunyx/iMI+36F1C8/MTpnGerAD4
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=685472a5 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=CkUed0vcNEhkOZWgjIkA:9

Doing so means we can get rid of all the weird struct vm_area_struct **prev
stuff, everything becomes consistent and in future if we want to make
change to behaviour there's a single place where all relevant state is
stored.

This also allows us to update try_vma_read_lock() to be a little more
succinct and set up state for us, as well as cleaning up
madvise_update_vma().

We also update the debug assertion prior to madvise_update_vma() to assert
that this is a write operation as correctly pointed out by Barry in the
relevant thread.

We can't reasonably update the madvise functions that live outside of
mm/madvise.c so we leave those as-is.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/madvise.c | 283 ++++++++++++++++++++++++++-------------------------
 1 file changed, 146 insertions(+), 137 deletions(-)

diff --git a/mm/madvise.c b/mm/madvise.c
index 6faa38b92111..86fe04aa7c88 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -74,6 +74,8 @@ struct madvise_behavior {
 	 * traversing multiple VMAs, this is updated for each.
 	 */
 	struct madvise_behavior_range range;
+	/* The VMA and VMA preceding it (if applicable) currently targeted. */
+	struct vm_area_struct *prev, *vma;
 };
 
 #ifdef CONFIG_ANON_VMA_NAME
@@ -194,26 +196,27 @@ static bool is_anon_vma_name(int behavior)
  * Caller should ensure anon_name stability by raising its refcount even when
  * anon_name belongs to a valid vma because this function might free that vma.
  */
-static int madvise_update_vma(struct vm_area_struct *vma,
-			      struct vm_area_struct **prev, unsigned long start,
-			      unsigned long end, vm_flags_t new_flags,
-			      struct anon_vma_name *anon_name)
+static int madvise_update_vma(vm_flags_t new_flags,
+		struct madvise_behavior *madv_behavior)
 {
-	struct mm_struct *mm = vma->vm_mm;
 	int error;
-	VMA_ITERATOR(vmi, mm, start);
+	struct vm_area_struct *vma = madv_behavior->vma;
+	struct madvise_behavior_range *range = &madv_behavior->range;
+	struct anon_vma_name *anon_name = madv_behavior->anon_name;
+	VMA_ITERATOR(vmi, madv_behavior->mm, range->start);
 
 	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name)) {
-		*prev = vma;
+		madv_behavior->prev = vma;
 		return 0;
 	}
 
-	vma = vma_modify_flags_name(&vmi, *prev, vma, start, end, new_flags,
-				    anon_name);
+	vma = vma_modify_flags_name(&vmi, madv_behavior->prev, vma,
+			range->start, range->end, new_flags, anon_name);
 	if (IS_ERR(vma))
 		return PTR_ERR(vma);
 
-	*prev = vma;
+	madv_behavior->vma = vma;
+	madv_behavior->prev = vma;
 
 	/* vm_flags is protected by the mmap_lock held in write mode. */
 	vma_start_write(vma);
@@ -318,15 +321,16 @@ static void shmem_swapin_range(struct vm_area_struct *vma,
 /*
  * Schedule all required I/O operations.  Do not wait for completion.
  */
-static long madvise_willneed(struct vm_area_struct *vma,
-			     struct vm_area_struct **prev,
-			     unsigned long start, unsigned long end)
+static long madvise_willneed(struct madvise_behavior *madv_behavior)
 {
-	struct mm_struct *mm = vma->vm_mm;
+	struct vm_area_struct *vma = madv_behavior->vma;
+	struct mm_struct *mm = madv_behavior->mm;
 	struct file *file = vma->vm_file;
+	unsigned long start = madv_behavior->range.start;
+	unsigned long end = madv_behavior->range.end;
 	loff_t offset;
 
-	*prev = vma;
+	madv_behavior->prev = vma;
 #ifdef CONFIG_SWAP
 	if (!file) {
 		walk_page_range_vma(vma, start, end, &swapin_walk_ops, vma);
@@ -355,7 +359,7 @@ static long madvise_willneed(struct vm_area_struct *vma,
 	 * vma's reference to the file) can go away as soon as we drop
 	 * mmap_lock.
 	 */
-	*prev = NULL;	/* tell sys_madvise we drop mmap_lock */
+	madv_behavior->prev = NULL;	/* tell sys_madvise we drop mmap_lock */
 	get_file(file);
 	offset = (loff_t)(start - vma->vm_start)
 			+ ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
@@ -620,16 +624,19 @@ static const struct mm_walk_ops cold_walk_ops = {
 };
 
 static void madvise_cold_page_range(struct mmu_gather *tlb,
-			     struct vm_area_struct *vma,
-			     unsigned long addr, unsigned long end)
+		struct madvise_behavior *madv_behavior)
+
 {
+	struct vm_area_struct *vma = madv_behavior->vma;
+	struct madvise_behavior_range *range = &madv_behavior->range;
 	struct madvise_walk_private walk_private = {
 		.pageout = false,
 		.tlb = tlb,
 	};
 
 	tlb_start_vma(tlb, vma);
-	walk_page_range_vma(vma, addr, end, &cold_walk_ops, &walk_private);
+	walk_page_range_vma(vma, range->start, range->end, &cold_walk_ops,
+			&walk_private);
 	tlb_end_vma(tlb, vma);
 }
 
@@ -638,28 +645,26 @@ static inline bool can_madv_lru_vma(struct vm_area_struct *vma)
 	return !(vma->vm_flags & (VM_LOCKED|VM_PFNMAP|VM_HUGETLB));
 }
 
-static long madvise_cold(struct vm_area_struct *vma,
-			struct vm_area_struct **prev,
-			unsigned long start_addr, unsigned long end_addr)
+static long madvise_cold(struct madvise_behavior *madv_behavior)
 {
-	struct mm_struct *mm = vma->vm_mm;
+	struct vm_area_struct *vma = madv_behavior->vma;
 	struct mmu_gather tlb;
 
-	*prev = vma;
+	madv_behavior->prev = vma;
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
 	lru_add_drain();
-	tlb_gather_mmu(&tlb, mm);
-	madvise_cold_page_range(&tlb, vma, start_addr, end_addr);
+	tlb_gather_mmu(&tlb, madv_behavior->mm);
+	madvise_cold_page_range(&tlb, madv_behavior);
 	tlb_finish_mmu(&tlb);
 
 	return 0;
 }
 
 static void madvise_pageout_page_range(struct mmu_gather *tlb,
-			     struct vm_area_struct *vma,
-			     unsigned long addr, unsigned long end)
+		struct vm_area_struct *vma,
+		struct madvise_behavior_range *range)
 {
 	struct madvise_walk_private walk_private = {
 		.pageout = true,
@@ -667,18 +672,17 @@ static void madvise_pageout_page_range(struct mmu_gather *tlb,
 	};
 
 	tlb_start_vma(tlb, vma);
-	walk_page_range_vma(vma, addr, end, &cold_walk_ops, &walk_private);
+	walk_page_range_vma(vma, range->start, range->end, &cold_walk_ops,
+			    &walk_private);
 	tlb_end_vma(tlb, vma);
 }
 
-static long madvise_pageout(struct vm_area_struct *vma,
-			struct vm_area_struct **prev,
-			unsigned long start_addr, unsigned long end_addr)
+static long madvise_pageout(struct madvise_behavior *madv_behavior)
 {
-	struct mm_struct *mm = vma->vm_mm;
 	struct mmu_gather tlb;
+	struct vm_area_struct *vma = madv_behavior->vma;
 
-	*prev = vma;
+	madv_behavior->prev = vma;
 	if (!can_madv_lru_vma(vma))
 		return -EINVAL;
 
@@ -693,8 +697,8 @@ static long madvise_pageout(struct vm_area_struct *vma,
 		return 0;
 
 	lru_add_drain();
-	tlb_gather_mmu(&tlb, mm);
-	madvise_pageout_page_range(&tlb, vma, start_addr, end_addr);
+	tlb_gather_mmu(&tlb, madv_behavior->mm);
+	madvise_pageout_page_range(&tlb, vma, &madv_behavior->range);
 	tlb_finish_mmu(&tlb);
 
 	return 0;
@@ -857,11 +861,12 @@ static inline enum page_walk_lock get_walk_lock(enum madvise_lock_mode mode)
 	}
 }
 
-static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
-			struct vm_area_struct *vma,
-			unsigned long start_addr, unsigned long end_addr)
+static int madvise_free_single_vma(struct madvise_behavior *madv_behavior)
 {
-	struct mm_struct *mm = vma->vm_mm;
+	struct mm_struct *mm = madv_behavior->mm;
+	struct vm_area_struct *vma = madv_behavior->vma;
+	unsigned long start_addr = madv_behavior->range.start;
+	unsigned long end_addr = madv_behavior->range.end;
 	struct mmu_notifier_range range;
 	struct mmu_gather *tlb = madv_behavior->tlb;
 	struct mm_walk_ops walk_ops = {
@@ -913,25 +918,28 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
  * An interface that causes the system to free clean pages and flush
  * dirty pages is already available as msync(MS_INVALIDATE).
  */
-static long madvise_dontneed_single_vma(struct madvise_behavior *madv_behavior,
-					struct vm_area_struct *vma,
-					unsigned long start, unsigned long end)
+static long madvise_dontneed_single_vma(struct madvise_behavior *madv_behavior)
+
 {
+	struct madvise_behavior_range *range = &madv_behavior->range;
 	struct zap_details details = {
 		.reclaim_pt = true,
 		.even_cows = true,
 	};
 
 	zap_page_range_single_batched(
-			madv_behavior->tlb, vma, start, end - start, &details);
+			madv_behavior->tlb, madv_behavior->vma, range->start,
+			range->end - range->start, &details);
 	return 0;
 }
 
-static bool madvise_dontneed_free_valid_vma(struct vm_area_struct *vma,
-					    unsigned long start,
-					    unsigned long *end,
-					    int behavior)
+static
+bool madvise_dontneed_free_valid_vma(struct madvise_behavior *madv_behavior)
 {
+	struct vm_area_struct *vma = madv_behavior->vma;
+	int behavior = madv_behavior->behavior;
+	struct madvise_behavior_range *range = &madv_behavior->range;
+
 	if (!is_vm_hugetlb_page(vma)) {
 		unsigned int forbidden = VM_PFNMAP;
 
@@ -943,7 +951,7 @@ static bool madvise_dontneed_free_valid_vma(struct vm_area_struct *vma,
 
 	if (behavior != MADV_DONTNEED && behavior != MADV_DONTNEED_LOCKED)
 		return false;
-	if (start & ~huge_page_mask(hstate_vma(vma)))
+	if (range->start & ~huge_page_mask(hstate_vma(vma)))
 		return false;
 
 	/*
@@ -952,41 +960,40 @@ static bool madvise_dontneed_free_valid_vma(struct vm_area_struct *vma,
 	 * Avoid unexpected data loss by rounding down the number of
 	 * huge pages freed.
 	 */
-	*end = ALIGN_DOWN(*end, huge_page_size(hstate_vma(vma)));
+	range->end = ALIGN_DOWN(range->end, huge_page_size(hstate_vma(vma)));
 
 	return true;
 }
 
-static long madvise_dontneed_free(struct vm_area_struct *vma,
-				  struct vm_area_struct **prev,
-				  unsigned long start, unsigned long end,
-				  struct madvise_behavior *madv_behavior)
+static long madvise_dontneed_free(struct madvise_behavior *madv_behavior)
 {
+	struct mm_struct *mm = madv_behavior->mm;
+	struct madvise_behavior_range *range = &madv_behavior->range;
 	int behavior = madv_behavior->behavior;
-	struct mm_struct *mm = vma->vm_mm;
 
-	*prev = vma;
-	if (!madvise_dontneed_free_valid_vma(vma, start, &end, behavior))
+	madv_behavior->prev = madv_behavior->vma;
+	if (!madvise_dontneed_free_valid_vma(madv_behavior))
 		return -EINVAL;
 
-	if (start == end)
+	if (range->start == range->end)
 		return 0;
 
-	if (!userfaultfd_remove(vma, start, end)) {
-		*prev = NULL; /* mmap_lock has been dropped, prev is stale */
+	if (!userfaultfd_remove(madv_behavior->vma, range->start, range->end)) {
+		struct vm_area_struct *vma;
+
+		madv_behavior->prev = NULL; /* mmap_lock has been dropped, prev is stale */
 
 		mmap_read_lock(mm);
-		vma = vma_lookup(mm, start);
+		madv_behavior->vma = vma = vma_lookup(mm, range->start);
 		if (!vma)
 			return -ENOMEM;
 		/*
 		 * Potential end adjustment for hugetlb vma is OK as
 		 * the check below keeps end within vma.
 		 */
-		if (!madvise_dontneed_free_valid_vma(vma, start, &end,
-						     behavior))
+		if (!madvise_dontneed_free_valid_vma(madv_behavior))
 			return -EINVAL;
-		if (end > vma->vm_end) {
+		if (range->end > vma->vm_end) {
 			/*
 			 * Don't fail if end > vma->vm_end. If the old
 			 * vma was split while the mmap_lock was
@@ -999,7 +1006,7 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
 			 * end-vma->vm_end range, but the manager can
 			 * handle a repetition fine.
 			 */
-			end = vma->vm_end;
+			range->end = vma->vm_end;
 		}
 		/*
 		 * If the memory region between start and end was
@@ -1008,16 +1015,15 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
 		 * the adjustment for hugetlb vma above may have rounded
 		 * end down to the start address.
 		 */
-		if (start == end)
+		if (range->start == range->end)
 			return 0;
-		VM_WARN_ON(start > end);
+		VM_WARN_ON(range->start > range->end);
 	}
 
 	if (behavior == MADV_DONTNEED || behavior == MADV_DONTNEED_LOCKED)
-		return madvise_dontneed_single_vma(
-				madv_behavior, vma, start, end);
+		return madvise_dontneed_single_vma(madv_behavior);
 	else if (behavior == MADV_FREE)
-		return madvise_free_single_vma(madv_behavior, vma, start, end);
+		return madvise_free_single_vma(madv_behavior);
 	else
 		return -EINVAL;
 }
@@ -1065,16 +1071,17 @@ static long madvise_populate(struct madvise_behavior *madv_behavior)
  * Application wants to free up the pages and associated backing store.
  * This is effectively punching a hole into the middle of a file.
  */
-static long madvise_remove(struct vm_area_struct *vma,
-				struct vm_area_struct **prev,
-				unsigned long start, unsigned long end)
+static long madvise_remove(struct madvise_behavior *madv_behavior)
 {
 	loff_t offset;
 	int error;
 	struct file *f;
-	struct mm_struct *mm = vma->vm_mm;
+	struct mm_struct *mm = madv_behavior->mm;
+	struct vm_area_struct *vma = madv_behavior->vma;
+	unsigned long start = madv_behavior->range.start;
+	unsigned long end = madv_behavior->range.end;
 
-	*prev = NULL;	/* tell sys_madvise we drop mmap_lock */
+	madv_behavior->prev = NULL; /* tell sys_madvise we drop mmap_lock */
 
 	if (vma->vm_flags & VM_LOCKED)
 		return -EINVAL;
@@ -1186,14 +1193,14 @@ static const struct mm_walk_ops guard_install_walk_ops = {
 	.walk_lock		= PGWALK_RDLOCK,
 };
 
-static long madvise_guard_install(struct vm_area_struct *vma,
-				 struct vm_area_struct **prev,
-				 unsigned long start, unsigned long end)
+static long madvise_guard_install(struct madvise_behavior *madv_behavior)
 {
+	struct vm_area_struct *vma = madv_behavior->vma;
+	struct madvise_behavior_range *range = &madv_behavior->range;
 	long err;
 	int i;
 
-	*prev = vma;
+	madv_behavior->prev = vma;
 	if (!is_valid_guard_vma(vma, /* allow_locked = */false))
 		return -EINVAL;
 
@@ -1224,13 +1231,14 @@ static long madvise_guard_install(struct vm_area_struct *vma,
 		unsigned long nr_pages = 0;
 
 		/* Returns < 0 on error, == 0 if success, > 0 if zap needed. */
-		err = walk_page_range_mm(vma->vm_mm, start, end,
+		err = walk_page_range_mm(vma->vm_mm, range->start, range->end,
 					 &guard_install_walk_ops, &nr_pages);
 		if (err < 0)
 			return err;
 
 		if (err == 0) {
-			unsigned long nr_expected_pages = PHYS_PFN(end - start);
+			unsigned long nr_expected_pages =
+				PHYS_PFN(range->end - range->start);
 
 			VM_WARN_ON(nr_pages != nr_expected_pages);
 			return 0;
@@ -1240,7 +1248,8 @@ static long madvise_guard_install(struct vm_area_struct *vma,
 		 * OK some of the range have non-guard pages mapped, zap
 		 * them. This leaves existing guard pages in place.
 		 */
-		zap_page_range_single(vma, start, end - start, NULL);
+		zap_page_range_single(vma, range->start,
+				range->end - range->start, NULL);
 	}
 
 	/*
@@ -1296,11 +1305,12 @@ static const struct mm_walk_ops guard_remove_walk_ops = {
 	.walk_lock		= PGWALK_RDLOCK,
 };
 
-static long madvise_guard_remove(struct vm_area_struct *vma,
-				 struct vm_area_struct **prev,
-				 unsigned long start, unsigned long end)
+static long madvise_guard_remove(struct madvise_behavior *madv_behavior)
 {
-	*prev = vma;
+	struct vm_area_struct *vma = madv_behavior->vma;
+	struct madvise_behavior_range *range = &madv_behavior->range;
+
+	madv_behavior->prev = vma;
 	/*
 	 * We're ok with removing guards in mlock()'d ranges, as this is a
 	 * non-destructive action.
@@ -1308,7 +1318,7 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
 	if (!is_valid_guard_vma(vma, /* allow_locked = */true))
 		return -EINVAL;
 
-	return walk_page_range_vma(vma, start, end,
+	return walk_page_range_vma(vma, range->start, range->end,
 			       &guard_remove_walk_ops, NULL);
 }
 
@@ -1317,40 +1327,37 @@ static long madvise_guard_remove(struct vm_area_struct *vma,
  * will handle splitting a vm area into separate areas, each area with its own
  * behavior.
  */
-static int madvise_vma_behavior(struct vm_area_struct *vma,
-				struct vm_area_struct **prev,
-				struct madvise_behavior *madv_behavior)
+static int madvise_vma_behavior(struct madvise_behavior *madv_behavior)
 {
 	int behavior = madv_behavior->behavior;
-	struct anon_vma_name *anon_name = madv_behavior->anon_name;
+	struct vm_area_struct *vma = madv_behavior->vma;
 	vm_flags_t new_flags = vma->vm_flags;
-	unsigned long start = madv_behavior->range.start;
-	unsigned long end = madv_behavior->range.end;
+	struct madvise_behavior_range *range = &madv_behavior->range;
 	int error;
 
-	if (unlikely(!can_modify_vma_madv(vma, behavior)))
+	if (unlikely(!can_modify_vma_madv(madv_behavior->vma, behavior)))
 		return -EPERM;
 
 	switch (behavior) {
 	case MADV_REMOVE:
-		return madvise_remove(vma, prev, start, end);
+		return madvise_remove(madv_behavior);
 	case MADV_WILLNEED:
-		return madvise_willneed(vma, prev, start, end);
+		return madvise_willneed(madv_behavior);
 	case MADV_COLD:
-		return madvise_cold(vma, prev, start, end);
+		return madvise_cold(madv_behavior);
 	case MADV_PAGEOUT:
-		return madvise_pageout(vma, prev, start, end);
+		return madvise_pageout(madv_behavior);
 	case MADV_FREE:
 	case MADV_DONTNEED:
 	case MADV_DONTNEED_LOCKED:
-		return madvise_dontneed_free(vma, prev, start, end,
-					     madv_behavior);
+		return madvise_dontneed_free(madv_behavior);
 	case MADV_COLLAPSE:
-		return madvise_collapse(vma, prev, start, end);
+		return madvise_collapse(vma, &madv_behavior->prev,
+					range->start, range->end);
 	case MADV_GUARD_INSTALL:
-		return madvise_guard_install(vma, prev, start, end);
+		return madvise_guard_install(madv_behavior);
 	case MADV_GUARD_REMOVE:
-		return madvise_guard_remove(vma, prev, start, end);
+		return madvise_guard_remove(madv_behavior);
 
 	/* The below behaviours update VMAs via madvise_update_vma(). */
 
@@ -1367,18 +1374,18 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 		new_flags |= VM_DONTCOPY;
 		break;
 	case MADV_DOFORK:
-		if (vma->vm_flags & VM_IO)
+		if (new_flags & VM_IO)
 			return -EINVAL;
 		new_flags &= ~VM_DONTCOPY;
 		break;
 	case MADV_WIPEONFORK:
 		/* MADV_WIPEONFORK is only supported on anonymous memory. */
-		if (vma->vm_file || vma->vm_flags & VM_SHARED)
+		if (vma->vm_file || new_flags & VM_SHARED)
 			return -EINVAL;
 		new_flags |= VM_WIPEONFORK;
 		break;
 	case MADV_KEEPONFORK:
-		if (vma->vm_flags & VM_DROPPABLE)
+		if (new_flags & VM_DROPPABLE)
 			return -EINVAL;
 		new_flags &= ~VM_WIPEONFORK;
 		break;
@@ -1386,14 +1393,15 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 		new_flags |= VM_DONTDUMP;
 		break;
 	case MADV_DODUMP:
-		if ((!is_vm_hugetlb_page(vma) && new_flags & VM_SPECIAL) ||
-		    (vma->vm_flags & VM_DROPPABLE))
+		if ((!is_vm_hugetlb_page(vma) && (new_flags & VM_SPECIAL)) ||
+		    (new_flags & VM_DROPPABLE))
 			return -EINVAL;
 		new_flags &= ~VM_DONTDUMP;
 		break;
 	case MADV_MERGEABLE:
 	case MADV_UNMERGEABLE:
-		error = ksm_madvise(vma, start, end, behavior, &new_flags);
+		error = ksm_madvise(vma, range->start, range->end,
+				behavior, &new_flags);
 		if (error)
 			goto out;
 		break;
@@ -1411,18 +1419,16 @@ static int madvise_vma_behavior(struct vm_area_struct *vma,
 		break;
 	}
 
-	/* We cannot provide prev in this lock mode. */
-	VM_WARN_ON_ONCE(madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK);
+	/* This is a write operation.*/
+	VM_WARN_ON_ONCE(madv_behavior->lock_mode != MADVISE_MMAP_WRITE_LOCK);
 
 	if (!is_anon_vma_name(behavior)) {
-		anon_name = anon_vma_name(vma);
-		anon_vma_name_get(anon_name);
+		madv_behavior->anon_name = anon_vma_name(vma);
+		anon_vma_name_get(madv_behavior->anon_name);
 	}
-	error = madvise_update_vma(vma, prev, start, end, new_flags,
-				   anon_name);
+	error = madvise_update_vma(new_flags, madv_behavior);
 	if (!is_anon_vma_name(behavior))
-		anon_vma_name_put(anon_name);
-
+		anon_vma_name_put(madv_behavior->anon_name);
 out:
 	/*
 	 * madvise() returns EAGAIN if kernel resources, such as
@@ -1572,13 +1578,13 @@ static bool process_madvise_remote_valid(int behavior)
  * span either partially or fully.
  *
  * This function always returns with an appropriate lock held. If a VMA read
- * lock could be acquired, we return the locked VMA.
+ * lock could be acquired, we return true and set madv_behavior state
+ * accordingly.
  *
- * If a VMA read lock could not be acquired, we return NULL and expect caller to
+ * If a VMA read lock could not be acquired, we return false and expect caller to
  * fallback to mmap lock behaviour.
  */
-static
-struct vm_area_struct *try_vma_read_lock(struct madvise_behavior *madv_behavior)
+static bool try_vma_read_lock(struct madvise_behavior *madv_behavior)
 {
 	struct mm_struct *mm = madv_behavior->mm;
 	struct vm_area_struct *vma;
@@ -1595,12 +1601,14 @@ struct vm_area_struct *try_vma_read_lock(struct madvise_behavior *madv_behavior)
 		vma_end_read(vma);
 		goto take_mmap_read_lock;
 	}
-	return vma;
+	madv_behavior->prev = vma; /* Not currently required. */
+	madv_behavior->vma = vma;
+	return true;
 
 take_mmap_read_lock:
 	mmap_read_lock(mm);
 	madv_behavior->lock_mode = MADVISE_MMAP_READ_LOCK;
-	return NULL;
+	return false;
 }
 
 /*
@@ -1617,23 +1625,19 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 	struct mm_struct *mm = madv_behavior->mm;
 	struct madvise_behavior_range *range = &madv_behavior->range;
 	unsigned long end = range->end;
-	struct vm_area_struct *vma;
-	struct vm_area_struct *prev;
 	int unmapped_error = 0;
 	int error;
+	struct vm_area_struct *vma;
 
 	/*
 	 * If VMA read lock is supported, apply madvise to a single VMA
 	 * tentatively, avoiding walking VMAs.
 	 */
-	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
-		vma = try_vma_read_lock(madv_behavior);
-		if (vma) {
-			prev = vma;
-			error = madvise_vma_behavior(vma, &prev, madv_behavior);
-			vma_end_read(vma);
-			return error;
-		}
+	if (madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK &&
+	    try_vma_read_lock(madv_behavior)) {
+		error = madvise_vma_behavior(madv_behavior);
+		vma_end_read(madv_behavior->vma);
+		return error;
 	}
 
 	/*
@@ -1641,11 +1645,13 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 	 * ranges, just ignore them, but return -ENOMEM at the end.
 	 * - different from the way of handling in mlock etc.
 	 */
-	vma = find_vma_prev(mm, range->start, &prev);
+	vma = find_vma_prev(mm, range->start, &madv_behavior->prev);
 	if (vma && range->start > vma->vm_start)
-		prev = vma;
+		madv_behavior->prev = vma;
 
 	for (;;) {
+		struct vm_area_struct *prev;
+
 		/* Still start < end. */
 		if (!vma)
 			return -ENOMEM;
@@ -1662,13 +1668,16 @@ int madvise_walk_vmas(struct madvise_behavior *madv_behavior)
 		range->end = min(vma->vm_end, end);
 
 		/* Here vma->vm_start <= range->start < range->end <= (end|vma->vm_end). */
-		error = madvise_vma_behavior(vma, &prev, madv_behavior);
+		madv_behavior->vma = vma;
+		error = madvise_vma_behavior(madv_behavior);
 		if (error)
 			return error;
+		prev = madv_behavior->prev;
+
 		range->start = range->end;
 		if (prev && range->start < prev->vm_end)
 			range->start = prev->vm_end;
-		if (range->start >= range->end)
+		if (range->start >= end)
 			break;
 		if (prev)
 			vma = find_vma(mm, prev->vm_end);
-- 
2.49.0

