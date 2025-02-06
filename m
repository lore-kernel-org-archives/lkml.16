Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6BC155757
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874017; cv=fail; b=kBDXrHU1o9adj8EFZWbm2qXA4sOJ4qS6duuGkzgi94Mw5KOESZbCpNwniGILsyGQucFFPNK0ERTSgk5nfLFsdGSaMtLs0zGgmDK0kJhMRerKPgJhdihEfsMRurpf5gSP58F5qUIy219NE6kCi7NoZlmA8RvnHawPVP0bOZSnVyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874017; c=relaxed/simple;
	bh=ACUYqFBdbOOlDmtUVaK3tI3ncHbxxQ+BebFko0sKjpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SYarOGZsetIOfLLwvAUfiSUI6O0J5saal2eeOWe2Owjf4+bz0X1lLLSMfFM1cC6qmymASPmHlVg4K6gzJ7TNshnMKRAyUvgiT60Qg5nmrtmPs/ABPYBe2A9d5aNx9SxEeydsD3Hr6QL3WECSTRNvq/MW5Erz2hpxjT3v7eB/PJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iTCi2DEh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=gKuKSmTH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iTCi2DEh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="gKuKSmTH"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516Jfqp4028515;
	Thu, 6 Feb 2025 20:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=v3iNufgG+UqqmMM++H
	k5gFdmLzHvfmTGswkRb675lzY=; b=iTCi2DEhvRyda93aE8k/b+yTwpIXYs6Pov
	hfxyti1gdbNbucap7yxKa7jXI224YfB8vv47t96vibsGNQ+m7c65Iyjn6p+2Aqb5
	MgT5jg/WDgoDbeoESJEpe4Wt1K7tqZ/xBX8vyjUQJ9VBruJrYN+IJQxm17jSQ7mW
	eSURkaiDaIeGju1USF+3pWTK0kQqrGRxk3+mUgT+/5hzP2sZFcjWNXnxgSHabj7K
	kXXN6QyDGq7iXYptoYbkZZNDc8+V6N8u1MhuDbfrHEtnqh2wqcDMGOqXofTMb4sk
	xd6Sr/lCeBz9Xa+kFjt10gto1UF2eA+VQG0kj6/sGyqiqKBUJ1OA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44n0nb0g3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Feb 2025 20:33:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 516IrpPP023504;
	Thu, 6 Feb 2025 20:33:21 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8gm9b7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Feb 2025 20:33:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slb1W1gO2wB/rVFfrn6amYAQCVL8ByWPHNFQndsG8S3QeVgqLkqGQjLvHnPMPYj3JxWzg3bte2jcGMcgPVYYjbRby2pJ/0ZvdF1vLwU9X4qJIhk/FF4eXylnXd5VoaD1d+oXihr6UuMWuQAUcIjcA0tIWbYfF1dwgUi2qNiBadYh5WS3rnOhg3h9eUMsnFnS5adMbRQB21l5b3Ik4rSbY3GTDMXmjcmiD/0OqQtn6dblRGunP2Q+f3zX4ejobmok898Mxi/4R0y4UvMhXrSwE+hdqJoRE3Jg3XM7q9t1l5FMXKFgOWeVOIABVYnNEcbCs2L5tcQ5KtYrLXHgLBVSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3iNufgG+UqqmMM++Hk5gFdmLzHvfmTGswkRb675lzY=;
 b=q4T4gt16F33/IFuBYqUhzBP/9FiLALdmK1m6wOI6Cm+j4IrmnQMUNyH0QVb2xwLghAXu29OKEffsOpTTJk8zNi02ZI+4pQAzVN7hmgtO2v5EJPC+qO0DmgbBHPtI5UrqNiDLQVSitxeXMV7+WmFN7xpgea6YFFY0YIvc++3OBPETdhavexTocmk9zelK2WlaVMRWfzoeimZ4yhwYJdJVwcGmrV425TAlHpVHFXKzYUM1KMq3pTDQPlu8V68EpcwqRZRrGvV+Oe53h2lOL5JJfiN1y2O4MdwPmm8urIlLZqVoG90BoQjTgQMKF6fKY4NTfjlCvQBQVWcZ4TY/gG697A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3iNufgG+UqqmMM++Hk5gFdmLzHvfmTGswkRb675lzY=;
 b=gKuKSmTHBw7geUIHDmyBNpeOiyn9Q71DOLPO8CiHpPHnZed3AjLlWWs/fZQPmkyi3wNOkJZ/8Z1zrwK4IJEyEKHcRSfxCtAvx4pNrSKRPmRyN+CGaFTJJ72rrJEfLUvjlLOVrsFz0JHAqgiV8ZJU3M5I9UEdQDE+xbVG7eHtAvE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CO1PR10MB4401.namprd10.prod.outlook.com (2603:10b6:303:94::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 20:33:01 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 20:33:01 +0000
Date: Thu, 6 Feb 2025 15:32:58 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 4/4] mm/madvise: remove redundant mmap_lock operations
 from process_madvise()
Message-ID: <ljhw26mirh5nexcrefdsip56obfxfuktgcz6mo34jv24k7cypz@57leiyilvqtj>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250206061517.2958-1-sj@kernel.org>
 <20250206061517.2958-5-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206061517.2958-5-sj@kernel.org>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0189.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::7) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CO1PR10MB4401:EE_
X-MS-Office365-Filtering-Correlation-Id: 798ff822-6102-4ad9-6f01-08dd46ed734e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iB+ezfrU1PTfjfpVAYxGljsYVZ2qA6PDuBiC096ggv9PZymhFSvHj5VX28lL?=
 =?us-ascii?Q?cgmjRnBWPH0qWo5UOFAbFBePGItbTdtyiAd1qNEn+gI+FgQmSKt/Q84M+zzf?=
 =?us-ascii?Q?BirsSZ3B/l5emgvohN86Fg0nLnr3s0/Xhuadh4tm6zDZyNDnL3Qg0JFV74BD?=
 =?us-ascii?Q?ainnh6u/7lh3APMwx8Ppew0b8ltxpUDRIIweglOWOgiIepsC3KN7N/vnfvek?=
 =?us-ascii?Q?bVU0ldZXXVjshEQQrYQofY4cx+42yRXtxCiT1ouPgDWzpcY7Z0pgnDV7MBqt?=
 =?us-ascii?Q?QhEhNZWeRHACv5TYU3RuVUwUQeouVRY0qTETJLR1ynvp/Ch1T5/9h6mrrx4v?=
 =?us-ascii?Q?0CW1dsitAANpbx5hXfLn49uM2K43YISa+cn5IHLA232Aiht7bEW/n5FztcEQ?=
 =?us-ascii?Q?XSt/ZMyLUIWo69gg90isuiqChbuRFUdtddoWfC05/iAXpe3OcftBMdPPoEYN?=
 =?us-ascii?Q?KbxGEhsKgNFmjdV7q7dYxRwZn7XWRfdppLEmR7M//SR6Sqvs9FijlBkQqLO0?=
 =?us-ascii?Q?lj+KwYkEkaS9GFXzTv/m8iGIhTQb3pnc2I9iQ5ipsoB/2j++nkiP9Adcmm7c?=
 =?us-ascii?Q?kgUedxoW7k2gpDykXfoh8WcqmJoIYmTpo1j/xug4qENcTp15tVXh6fKybR81?=
 =?us-ascii?Q?3xRWGnZg237nl9gmoo2TQs7O3YX7Q55WcgVAflfFJyGUD4dd1VfwaDTCI3uq?=
 =?us-ascii?Q?OC9x8iVmw/FyMQWH3eZLl5giC7xaw9tF7s8C2jeUjBdobsKEohoRE3LRPszQ?=
 =?us-ascii?Q?KJ17VF0ZuithHFKpQwCRuXeSkf1zxDS7wu8YbmGi0CJFdQWOSEGg9q6w0oNT?=
 =?us-ascii?Q?wm3ndOEfGaNzR4rDgCLTMB4LhhEKMPeNk7jqq6esP/yrEQK7WovwmrzWYewA?=
 =?us-ascii?Q?TrVE8Gy1ewFktr30YAAhWcRCUB8U4Bvy0gzGWrM8ET7Z7mmhPsURaXuIYbbs?=
 =?us-ascii?Q?GKbilejG9DaTtVKHgZHZBuyCxts3nLdgXOZpEiqwwouG31PAz6ViFwKdiEHS?=
 =?us-ascii?Q?iNhyFWWd5EdIfn2XH/F0+f3y1Z1kd3RzKXSxgP5dltyBZF3gUKEyNKsXWZTc?=
 =?us-ascii?Q?7PNkz+fpJLnJAF+y0GQj9HlN9SN8cc6LkWqcJ6r31ZVTYzNCfE06/DcgVUod?=
 =?us-ascii?Q?1dx/MG6Z1TihSShvEjSfF3KT8yMDB9YxgRz/rCLOjKNqHywgK5vUZvacTHg9?=
 =?us-ascii?Q?aCWabbQ90TlD27pbBUYuHGz8duKhPdtpjnHkjKiHjIP7ZCZPT/khDSf1EBor?=
 =?us-ascii?Q?d+iqyNgWcM4yL2rwIsTbie/S7+3gwMqxFpyX+CTTC0RY/cFEQpV/skkGoYYp?=
 =?us-ascii?Q?rCaRXluB/UzdQVHnVcfMd3D0vc0jtPYyzvrFmicFFd7hZhdSdhdhO/ifAeEs?=
 =?us-ascii?Q?dnESFPdXq3eyb49g+gEpuFSg3b6W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ryt8cgarBd3XSDTMpO8ReOoXoLh18hsc71rA9Zq66idY71VEMX4zNmtnMzl/?=
 =?us-ascii?Q?VHogC58baCCdlqoXNlhmagLBHHpwjQWNMq8IxgtAcaWfql0xWTscmjn48Ut8?=
 =?us-ascii?Q?EyX+M1LHLNqKdYN5uKlW8UatEjREW2kFl2INFEv1V+8owM2zyEhryxXFWeQj?=
 =?us-ascii?Q?zMSo/XsNNa/tm9CJ74JL9V+gx3OqqXRsPqLllERkpGaNBF9yOlYcDCaQG7ip?=
 =?us-ascii?Q?utoY1UXkt1Gx/NpRV/4YCYhg2BF4t96cmN/Fb0BPiRpXnj0pTEFcilWkpAjO?=
 =?us-ascii?Q?NphrhD0/74jotXs1vTAhdLjQvjtJG0dKQ5/kdkJ52Td8rCB9bZxXa1YtgKaG?=
 =?us-ascii?Q?MR37F3nzmNuRR11Gwln6R+aXPnnjAPGZdHwZEsvCkeWOs8IkhKzBOYVn+BD+?=
 =?us-ascii?Q?zgrDKBQWScwb27Fe1Bj8Au8melz8ozMnCICnX0EMB1NaT1hAV9dn4VqQRVtv?=
 =?us-ascii?Q?6OwSX8p9BcT+WfQrq8hL1i19rbPUmuJCpGGDj4qsnHVGa5RJTuD1Ab47n9sR?=
 =?us-ascii?Q?KazzUU0JgXUNCUMlImETLG5gtlHbmgWJZcl2qpT1eS2B7Fb8eMJiOCfuH7Ak?=
 =?us-ascii?Q?zHtWRYqbCCx4jTPONoM278IMmbYlQsMiW3KUgBtC9FXYZOnCoKQv1c1ZI5/L?=
 =?us-ascii?Q?X7kc5lMNWmnja4gW/5YzDv4Q7vRxcvePJUqMSYqTb00OuNGo0JUdplJkGfv6?=
 =?us-ascii?Q?Na32VludpstSX1kMR3r0xBj3prJW9vCCkbJdIQ7rvhTpf7amVEVuHPMOzKsi?=
 =?us-ascii?Q?wKtKzDdj3ZE+am98HphHEbV2dJhqSj8RPqUz5tWiHzxxmwZgDdANq0ejeinh?=
 =?us-ascii?Q?U922T7LOQvHmjbmf1YM24k529jYI+IgmKn0bGYnc3H/5KdGXcCojxoIm2xAH?=
 =?us-ascii?Q?+9ALvGJmqLaYKyc7W60J238iNMhNnn8Ey1MUGlCnaHlPvw+jjZcDnw3FpX9w?=
 =?us-ascii?Q?z/u5+sD0l48yYCVw1ruvWr/cEZQH426cn3zjwANwnt219J3SnsElDIH4ziop?=
 =?us-ascii?Q?/Yc7Z22hiQ3Jn9U9/8aGCxnEJmEB9sdCctL5JdHiW+0fR7o6WVBQ7RssPKCW?=
 =?us-ascii?Q?qCOhqz7oy/IHc0ierMxmKSCveiE+kab6a9qtEW+Vqu9Kt0r77Ykdvk8+md0c?=
 =?us-ascii?Q?0+Pjw5z0Ou5EVP+vtWDkuZbxzw6tOS/DlK65S6xyMDgMBGQxRjqfN5lsatvs?=
 =?us-ascii?Q?DBzq3dE3IsIFvtzhJmeCBcGQaIsgAdZ6DhBLShraQvx2GHQL53V8SS/i/tS5?=
 =?us-ascii?Q?3T7D9XIIOoiOWP8IEZC6RjPWeSNgfoQPPHRx43qLSgnVkCxNvmo4RFx1SJkN?=
 =?us-ascii?Q?IVH/8Ag3Ck4naxkU5ygzbu06vNC8UnblOg2R+esqW08tPMCzaE5c02GzllxR?=
 =?us-ascii?Q?oNkkhUxD/HMZPpJYruETg8yxuPg29cbDKpRaaXcSIXBAIxIDRmQIHh0G9UAh?=
 =?us-ascii?Q?dJGj+na6Y3jrWHgwWvn1XFl2Fl7cyP1eJeROZA0iIkTOfJwcxujmiAop5xMX?=
 =?us-ascii?Q?TWBrDo9skmBBoUwxwmGwOqXF8SR/HBQxFSUNvnnQQc3F6X3RfJjWD+lXxHz5?=
 =?us-ascii?Q?CBROHDayAxy7cLG3LkmI/eIE0oEPiyrM5TdEwnSb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Wjj1HaQ+AfSuidQt6ND8vyCf+VMJo6Z2PSrSs53X+RRyvF0S5RVMX22MCXWqh3yk1JiMMb9C7or7UMoGV6B0+FcbhUZtWr8OQoK9hOfYaGGnkCaeLvLbunxb2Ps3fxZm+ye5yjanO2XsBxuOHXMSb1JdfgpWmPdkOsvZmzH677B7KDLgWmJ5XKxTKOY5Cyg26ye0KCc88upfexnt0wrbjakBlON7mBxrb+CSDAjXMN0alsp/brlCyC8XrjRRpD3hNxaQTP+89H6k8ocfjNX0k0cXH2uJF/Zru+2jxjBnvevqPPOUSAZhswpRKUFxhU2qHwLpZNp7KGmltGAZUQuKHAMvlLpZRtt589YNOaNzcIDxSNvf5ZiNV2awp5hmIuikyJAY/wPmsx/gmta3/FdGPoTrdzProgpFpgvEH7tSTclQpsCOiFWVk2U3Vf9w1TjAAfaQx3vjl9tEVhxvvqVa6AuwOLD/YBFa0Ngwaf/SQ9lUQFI7Ivu7h6d2n3g2nQ6FaF2UoAMU+x38MXSk2yaT9fzAIR7QyIOTTd9bNQwNK71vOEFJPkN9vXZsRD6aAZWTVcMIZ6OCBaYharv15LV9S+Yq+1hrTfcRogRZ2Lrd9/w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798ff822-6102-4ad9-6f01-08dd46ed734e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 20:33:01.3337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KNRgEal0XVKwUEJ1s4HwR8xMJ0IJTaQdiPVINr9tghlZz5s6iwCJ4omps4/e1RoS2aIXsvczwVlRtXc71rw/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4401
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502060163
X-Proofpoint-ORIG-GUID: -jH7VQd4NFjsTajmv3DtkK6mOLrPuqFK
X-Proofpoint-GUID: -jH7VQd4NFjsTajmv3DtkK6mOLrPuqFK

* SeongJae Park <sj@kernel.org> [250206 01:15]:
> Optimize redundant mmap lock operations from process_madvise() by
> directly doing the mmap locking first, and then the remaining works for
> all ranges in the loop.
> 
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> Signed-off-by: SeongJae Park <sj@kernel.org>

It might be worth calling out the drop/reacquire in the change log as
well as the comment like Lorenzo said.

Reviewed-by: Liam R. Howlett <howlett@gmail.com>

> ---
>  mm/madvise.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 31e5df75b926..5a0a1fc99d27 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1754,9 +1754,26 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  
>  	total_len = iov_iter_count(iter);
>  
> +	ret = madvise_lock(mm, behavior);
> +	if (ret)
> +		return ret;
> +
>  	while (iov_iter_count(iter)) {
> -		ret = do_madvise(mm, (unsigned long)iter_iov_addr(iter),
> -				 iter_iov_len(iter), behavior);
> +		unsigned long start = (unsigned long)iter_iov_addr(iter);
> +		size_t len_in = iter_iov_len(iter);
> +		size_t len;
> +
> +		if (!is_valid_madvise(start, len_in, behavior)) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		len = PAGE_ALIGN(len_in);
> +		if (start + len == start)
> +			ret = 0;
> +		else
> +			ret = madvise_do_behavior(mm, start, len_in, len,
> +					behavior);
>  		/*
>  		 * An madvise operation is attempting to restart the syscall,
>  		 * but we cannot proceed as it would not be correct to repeat
> @@ -1772,12 +1789,17 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  				ret = -EINTR;
>  				break;
>  			}
> +
> +			/* Drop and reacquire lock to unwind race. */
> +			madvise_unlock(mm, behavior);
> +			madvise_lock(mm, behavior);
>  			continue;
>  		}
>  		if (ret < 0)
>  			break;
>  		iov_iter_advance(iter, iter_iov_len(iter));
>  	}
> +	madvise_unlock(mm, behavior);
>  
>  	ret = (total_len - iov_iter_count(iter)) ? : ret;
>  
> -- 
> 2.39.5
