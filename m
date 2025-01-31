Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E1E4A24
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738339825; cv=fail; b=Uzj1kFUQwe9sfYaMaCiI7RX6V2uF47iP34bROdvGtKtuQ1tuFZHPHFEKdNcoGSTZltPfZ4q02mJ5uGDe5MzrUmjH0x7CXUuOXf7PblaCcY5mvX/iuPN/Xq8nlPjE4OPilGsH2ACJBkKFKtjHpBMsPQZ5wD1jSxWeGRcUvTTi7CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738339825; c=relaxed/simple;
	bh=rQtlGKKq5ZEbUM5RowmJs3hErF+LlyJms4gjdSGOxxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cTot6V8PHnNL5ZaIB82gzQGoZqdI8lWUdRYxXYT9RgrD1kbevFInqZoxi87iIedddAUY0xxoYj0bTa4HJ2u+ejJzfbkhxqHauA8DVu2uVAJjenxFAQTruWDoBPUSIL5PxFWT+2Z1xmEhBG2Z9Kfzn2edJ4ymUa4277snzpONPdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gUzQHZk2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XKRsKk+w; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gUzQHZk2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XKRsKk+w"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VFtjhF027222;
	Fri, 31 Jan 2025 16:10:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=nOIlhDfz96bICZ4F9Q
	WsZMjddCCRLwDmlL6/8TSG0nM=; b=gUzQHZk2PCxIcw4E8AUezxo9ISjp6xvrVq
	aeDTrLbUpwFVwmDp1XgbNhejZieN2P+2CVMAt5zIyCQ4st0CLDfh7tDI1HBmfwZy
	YLPlQg8cATPmUB6e/4EQmjcLp81xDBHZYGQcKx9sgnPPkZoYQ80LcSmWuDMsKNfC
	p3zSUgi+fR1hQn7ZUmLRKtfkFFHuKOkXSHD4BoP+Nwn9OaZu9l1v07WB92BC+QLq
	E3L0WjuTGftVEO9FgIZYuOqIW+ZaPa+Ex35Z5qPDUPvyx9q4Uyn4gZVmjTfo8FJ9
	/r6CKgGGj6qtNiCKZ+3yihf2vTiEODxdSjHceoyhFb5H+81RqRaA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h184g2rn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 16:10:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VFHOwC016687;
	Fri, 31 Jan 2025 16:10:04 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44ggvkfsca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 16:10:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYI8U/ZA/FyPiA3zVVv9gYhVcJ18Gcb0PVkl149KAs45+VpIGayN2vKvuQM0i9yCDilyFZ1CxtY2mNQzf9h1S8Zgzbe+N5h3FtFng9fqspddFPw4TjMfri7jB5tY5RUPIIZHBra7OlwHFQXf0enjnvmkuSlPM19BY4JM/dPubXpp0/9h45rGZLO4qtOrQb9QxYI7TAnISgsE4LQrzhqiXAJpZmZNeUdUg8eXQ2+5dViwj9Y1FvSgcboTYZ+DoHjm/YZhm937aWOzcn+hWPt0HThG9w/qDUmKnxa7ivTC7lBj+VT0SRTZa3FuIMqmjOdUzt6W4VchKdACF/TnarG0Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOIlhDfz96bICZ4F9QWsZMjddCCRLwDmlL6/8TSG0nM=;
 b=PIQnKMBOZ55CVDaVcteHrjYmuZPCEyviR+SbmJEA0odzHLHFuTRw1elAY58pQGqgNQkQGaSCINlD0Ul5zzzLtETcyHIzov4QvizkO31pg1C8pAtN4rPBvbV5hFEYv++R1wWarXmCdfOEP18JMOELw/d82fFQDSIi5UQUmCUJFQT4SIzKu0O3uuEZRR6bzG58L64daSvYjbADdwajYVr7Gl/AeVOP+kPxCfsmi4HULa1Mink64nNKNvDNYkyi8eSjpj15PneMZ7IujZY/7dgHF+T+Qjo23Md2FdTaw1mH63W0KQXuAXdMkyUXI6qYYcOKOoRiB0N6KHVAODVUk32q2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOIlhDfz96bICZ4F9QWsZMjddCCRLwDmlL6/8TSG0nM=;
 b=XKRsKk+w5GPzvIpFskFpjchTgL3m7CExech3W5uALks8YS8yXWfC6xByACcbaAQv2QD4on0UyW3ydWk7fB8mE09e09L4Xohr6iprI/b/8+Wbe/9DfaN2K9aSyB/0efLSU0o9EFNJR5F224ardvRRcfxdwdplDf+eZoIJycrTgLo=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS7PR10MB7177.namprd10.prod.outlook.com (2603:10b6:8:e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:10:03 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 16:10:03 +0000
Date: Fri, 31 Jan 2025 16:10:00 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 3/4] mm/madvise: split out madvise() behavior
 execution
Message-ID: <bd6d0bf1-c79e-46bd-a810-9791efb9ad73@lucifer.local>
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-4-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117013058.1843-4-sj@kernel.org>
X-ClientProxiedBy: LO2P265CA0224.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::20) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS7PR10MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: eeae0668-5575-4654-4f6d-08dd4211b83e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VDbmVWHByp2yiEPfkj++Hx47O5xv+vkwzjLApBxG3c5zTopv1RRnv+Cbhj6B?=
 =?us-ascii?Q?cWI5aRvWCWwmN1ItZP9REGwOLlyaHSETdzC8pWt9Tqj+kNKHhVjCBYc1LMBI?=
 =?us-ascii?Q?5HibaQmsRqYAhfWi8CUYpyfrNJ7A91nsnDQBHH2TPPYhy1MzmzQBf1DAG/6k?=
 =?us-ascii?Q?+PfO5bgKwahOM2akjKGK3KlhRM8QVf2yrqw4roQZfz5WQfYoudWsF3pVttD7?=
 =?us-ascii?Q?ncOaoFlsqqdLUXzaPhv9eo8ZnnXim2t4JX26Cmqw2oEsdh/5iQmOYtQoSAJI?=
 =?us-ascii?Q?UDnCZSNlEh4svrowfNujRtK76dCgo3J+7daTnTcr5q+bCl6jnuCUUOT809H8?=
 =?us-ascii?Q?0pCjTc4MBaXK4A2lmoelipKhrpL1+0Jpb0v5F1jTTXceYdXtiHmts1Vf/rJM?=
 =?us-ascii?Q?wE9X5cFNLaED3+N4wedSKSp7sJps2PjXM1xCTFcRecRKZd0h9VZgIsxZ0i0/?=
 =?us-ascii?Q?JOP+unkpcUGI1N6NX9w/x+E+4AqdSliXp/ztevjYw6J5OmqJML0fdWFB3/7y?=
 =?us-ascii?Q?DM6pUPf+nddNYdp95ESqgMTYA4VPwvQ6SKETD548+Qk/VsnXZ9wyUg+FK1Tw?=
 =?us-ascii?Q?ep5nddqX2wHf1DQuLwVj5ThoUcSHx1sVeSUq6Rolb9SKWGM6/O0INFRek6Ah?=
 =?us-ascii?Q?tzFOu5m2pzCegbgyij27bHZ2EeszpPzeQrrcmMZ1nahyGAH3YH6TC3SHtS50?=
 =?us-ascii?Q?T8FiydF9Kp0z/3ypfraG6VAKc1ltebfWxWBJqMnbPUTNiFl/icF/ZzRHMmQN?=
 =?us-ascii?Q?PEOmqmA38OkrKwYa1+AIyKZO7mLejowFdBF4ENd2iAh22H1fgAea2Y/3KvRl?=
 =?us-ascii?Q?1gX0uLtkE6nFVVfDcoukAPZT8yF+uZJS31TxDvJ3JYrb07iS1uL/qfv9ZRuw?=
 =?us-ascii?Q?IUKyvb8Lln+Cm1uzRBPoSirIjLT9jyMOghcNofuAk1F6zaBohZ3Dv/ZYiC/9?=
 =?us-ascii?Q?YznuokQ/8dN61yKo9PxMMZ/l1GA7hOEpWtLKpeBOlX6L/na45BL2/4LjcAhI?=
 =?us-ascii?Q?RwQzTF1e1jfS/bWyLzjVfgJmIJhksyDLAac7M7wpP0IZn26hVRE2PNrY6tXK?=
 =?us-ascii?Q?90/xfgMbcRQUoHbPCP6BwUX74UpTw0oJ0x2W0yciM8C39J6q9M1A1tfmZdMa?=
 =?us-ascii?Q?Dirl38qLWoChf0GylTef9ne5K3tCzn8Ppg6GqdwqSz42qE5qTxzl+wmyNz/6?=
 =?us-ascii?Q?7UEZQKKYrJcHRIXdORNkv02QCgbBzt+rStt/iDG8tNKCLQuCuBNj01XMjqQN?=
 =?us-ascii?Q?ZhIay0Evt/2KFiX2iyusQ6+oQZ2tUMJLvyC4FEc0cYYNZRYqvN4wz9e16fvO?=
 =?us-ascii?Q?PzXMFNqHaPZRWONTsoR5InZtcNHUwHPfKBks4Po9ticoezaAHI1Q9Sywuh0V?=
 =?us-ascii?Q?PHidOVeHgcsGU+6MTTz5AAglbrDX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dvqt+1WAfmFmZ6LazJbB1+oDMhTvKPkMx8plsmA3mczQFFMpkoAWZQM/Sax9?=
 =?us-ascii?Q?xpCcsaeZgXvNd+yD4vcPYnTEf2+Xn8HGwSw9e9sJeczwqzOsr4iUKrKgUSzY?=
 =?us-ascii?Q?xbkken555XEoeYg/Zwj2V0YY10j9fvA3Ww+Mk/7L9SdmUgWCs3elNiU1gE5O?=
 =?us-ascii?Q?GvKQwCLrnkSjzbIc+VnGpRASAM1fv+V4fcY3eQFK5uVMEJmerHWbNn60ZKa/?=
 =?us-ascii?Q?VmDUQFeeJhXtbdyv6UWop/Idij5v/6EyslumRMHs0Po0uN3XPOeViYCOBDi3?=
 =?us-ascii?Q?fQjsrBcV7ckO0SXof+rRyBI5iB5GavJwp5AZVWMthjQdWTMcP/Gkv5XYefhS?=
 =?us-ascii?Q?PyLUkvu2fizwMr4IgRk6bYW2ULp6N3fq4kuZSG1XRQjWjdqB/U3KGPbAJISO?=
 =?us-ascii?Q?TVUu7lRAK6HXtrdRJ5Agl3LOY5rg/aJvxZ+NayYwqlvrpI4KT0envEwGKir5?=
 =?us-ascii?Q?P3D8nLVMDmydGZyPblB7QPnGlNh3d9jYJzQkJBwd9BOSoAhZI9LikocKn4Lm?=
 =?us-ascii?Q?V6dSEk47fhVjfbNQA54jsypxqbR98l0dlornyM1fGpEUZQO6/De/ft+dFzm1?=
 =?us-ascii?Q?NLOirTXpZBXYW8T8Zb+Auj/5gRWFDmUGqR+x11ZpC8GgGfc8eLlWwJiFeoFs?=
 =?us-ascii?Q?W6RPHLh/sWbXoqb046CectdLTtdFM7+jPmE6ce7n0pu6xO+J4WDLuTLFjkaO?=
 =?us-ascii?Q?EGsUp5BCcxJHGM43AE2AwhzFJ8emKiDBkqiWoDVMwEjI/UkgeHbo/OcosE0B?=
 =?us-ascii?Q?L5q+dZC8FHHuq4wSGZwTBUHz3Xyqa9iKpWv4eYSaIM7e0e9Y0Hfo7+qgFxcf?=
 =?us-ascii?Q?D2CqMhlFfG3OH8UNlv0Fb5FT7s8Ei6irJqFHOKYk5j4is1Yjq8t+fwkQfgfD?=
 =?us-ascii?Q?kd5U5b5J92OW0+rfM9vWq1NKRFENw81ls4rEIWb+hEXOposMbiCdn7zJ3J5s?=
 =?us-ascii?Q?UGHXNsYM/gZnojnb1o8Njl4N5I5Cnqscxss+pvoKOhue68jEm719FD0OLEdU?=
 =?us-ascii?Q?KnnJllQQ+jN9n7V88ctoJdBoE+IQhrPExUqLzKiKdG7khKB9vU+BvBFcoAmI?=
 =?us-ascii?Q?Xl3zUeMPKyFiAfIc3GY+oweFRWHN4BLlWuTFX+3PZR9H0ue8M8YW23ST5qaJ?=
 =?us-ascii?Q?GM12PAHSJG88l0OHsH8TQC0sAaykgT4tC/hiQSTdsrM66VnGJuj3i6zrvCEK?=
 =?us-ascii?Q?HmtAbH/YFedYKUjyuQfAAm7pJW9Cpso+Qcr64LvzToHly4584yr+uIXI3ZLi?=
 =?us-ascii?Q?Etzjcr2oHHvcDcVBpKVBVCEkjjKel9PYvFqRkA4W9+IDPkC4i8tk/KMGza6h?=
 =?us-ascii?Q?MBmEUlI8gUGgJWl5lsRf3ut8h4b69sIdCbfZN0QJ1edrc7cqM83kpwbwR5EX?=
 =?us-ascii?Q?n501GRCwpJnf6wmAnK5GrsnDoI7WdA3l3LfFF4JSysRuGVO0pPqSCR+b5j9I?=
 =?us-ascii?Q?Y+GX6ovKrX72S6v63mqicU3U149dxgrTJtPnJy0payptx2eN5O1V0R2bdhmv?=
 =?us-ascii?Q?1QC0uihgX+G9VG7UgtlwfecDVgU3GFzzsglIinNe7JdmI5nT/lnp4Ha0EkYj?=
 =?us-ascii?Q?Kt7EQ1Lh2LtTRfzM8CQhM4e9qcMBWiU9XG70PRxlRTPcyw7fVW/TFBSRhJxw?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Kx4eEscoGCsbcaexM12XcgOldRbHzrjHpenjbFEmpYrmk3i4HLr91OCS7jv78w09nfag7Ecrd4UDgfN8ftd0QkGtkUOa1pnWQkJUGWTOkl39ecEHIDiwkUwMOyZ6F93csQUo5/EKgrIfkWlDu5nXwX33v20+LOI/V6huN1FFNCUrrYpBoE8ZQqBxT8Ae4FODJJPz63q5QjnBArGGB7sxlBJncOsASBtcqGNs0rcI9IBmwLpdMdAJoh0TTuhz0vTIiel8XwSpQ+ADO0jm6zCYd6ZW4CczLV0P8Acp9p4KG1V/ZAU+f90+vFgxl3CY1WpQ29M6vWbhh5Ahg89e7NqY3loGTH5LRJZWyjjeajrRwS5GByW5/zgHySfDVOjtUtDxF+v8AtzNfbP/HstvkDWuTYUcKLwfcFZDPz48IqAIwW+TrY1X6zWUnPiT7fhRdimHPMQCJ50aVizIAjL/MTi17Vx9xDAeqoTUIEYguHgRNySaAyuuoCA+MEGdp3Cv2t+1c8ORWjstMxvwVUBStGAc+sPRIU6SY4A+ZUskTbRyITCZdg22xoAgqpcTKjqnRzXOrl/8/sAb8M5OmQoP0tAOoXrzd4orS2oD5iABmZd8zzQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeae0668-5575-4654-4f6d-08dd4211b83e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:10:03.0811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L0IdbhXV7BWzHBOwcT7WFHBmibFsCyINYURtikz/Ym108oLEBndxwAjR1hemS5JkRU/OGfLgA/kV5smT8FxKk986HWm90OjZms0qNmrc3AA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7177
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310124
X-Proofpoint-GUID: Nbv3DRrN0Q2UtZz7kMxjgSZldFiPiGIK
X-Proofpoint-ORIG-GUID: Nbv3DRrN0Q2UtZz7kMxjgSZldFiPiGIK

On Thu, Jan 16, 2025 at 05:30:57PM -0800, SeongJae Park wrote:
> Split out the madvise behavior applying logic from do_madvise() to make
> it easier to reuse from the following change.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>

Thanks, once again this is a nice cleanup, and you're doing stuff I thought of
doing but never got round to :P so inevitably:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/madvise.c | 53 +++++++++++++++++++++++++++++-----------------------
>  1 file changed, 30 insertions(+), 23 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 9cc31efe875a..913936a5c353 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1613,6 +1613,35 @@ static bool is_valid_madvise(unsigned long start, size_t len_in, int behavior)
>  	return true;
>  }
>
> +static int madvise_do_behavior(struct mm_struct *mm,
> +		unsigned long start, size_t len_in, size_t len, int behavior)
> +{
> +	struct blk_plug plug;
> +	unsigned long end;
> +	int error;
> +
> +#ifdef CONFIG_MEMORY_FAILURE
> +	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
> +		return madvise_inject_error(behavior, start, start + len_in);
> +#endif
> +	start = untagged_addr_remote(mm, start);
> +	end = start + len;
> +
> +	blk_start_plug(&plug);
> +	switch (behavior) {

I kind of hate this, I'd like somebody (maybe me maybe you maybe somebody else)
to go further and refactor this thing with fire and fumigation, because having
multiple layers of how we do stuff is just ugh.

Not your fault.

Not even related to your series.

But a moan I shall commit to list nonetheless! ;)

> +	case MADV_POPULATE_READ:
> +	case MADV_POPULATE_WRITE:
> +		error = madvise_populate(mm, start, end, behavior);
> +		break;
> +	default:
> +		error = madvise_walk_vmas(mm, start, end, behavior,
> +					  madvise_vma_behavior);
> +		break;
> +	}
> +	blk_finish_plug(&plug);
> +	return error;
> +}
> +
>  /*
>   * The madvise(2) system call.
>   *
> @@ -1690,7 +1719,6 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  	unsigned long end;
>  	int error;
>  	size_t len;
> -	struct blk_plug plug;
>
>  	if (!is_valid_madvise(start, len_in, behavior))
>  		return -EINVAL;
> @@ -1704,28 +1732,7 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  	error = madvise_lock(mm, behavior);
>  	if (error)
>  		return error;
> -
> -#ifdef CONFIG_MEMORY_FAILURE
> -	if (behavior == MADV_HWPOISON || behavior == MADV_SOFT_OFFLINE)
> -		return madvise_inject_error(behavior, start, start + len_in);
> -#endif
> -
> -	start = untagged_addr_remote(mm, start);
> -	end = start + len;
> -
> -	blk_start_plug(&plug);
> -	switch (behavior) {
> -	case MADV_POPULATE_READ:
> -	case MADV_POPULATE_WRITE:
> -		error = madvise_populate(mm, start, end, behavior);
> -		break;
> -	default:
> -		error = madvise_walk_vmas(mm, start, end, behavior,
> -					  madvise_vma_behavior);
> -		break;
> -	}
> -	blk_finish_plug(&plug);
> -
> +	error = madvise_do_behavior(mm, start, len_in, len, behavior);
>  	madvise_unlock(mm, behavior);
>
>  	return error;
> --
> 2.39.5
