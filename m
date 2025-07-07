Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EC3262FED
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 11:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751886916; cv=fail; b=WCsDNwAwO6JntTts9P76ClfAw9NlAGMjMKiMX4bqGPJkQRGqA6Ph+N6pNZhFZVuqiwfQhULFT1OZo3f7S+nQDUHQNROIeJnhgAZA5CKZ5jHxnv581zhJ3hrCwHWtKcUgix+KBg2E4OyCDLMrL8fdbGx6I48bZ37g4U+wkcQ6YlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751886916; c=relaxed/simple;
	bh=01KRZ/Uwkwi7USwbRDfGrxTLr7SxEtK0COrBl9UcZTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RrlHRzUsElUjLruwPiTw2Ld61eCRtFf3kUK5cvJ4WOClsrzyU6SPVwhem63/LMfV2NRedwuJEi0Rtf4V4avJeWSmD9vBAhJAUAKpN0AQQ6taSfJMDV75UL8FWYH0DF/u67QgbSnel2pshdqMqBkptSeKyMzE+D5MU///a8/ekQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Iz+ta10u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sNMrOLK4; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Iz+ta10u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sNMrOLK4"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567BC56P024669;
	Mon, 7 Jul 2025 11:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=IjXL6qCinClAzyY0w5
	2+kgDKiX7EMr1qHRq5zY7o2nk=; b=Iz+ta10ulketVJScLbv7Z5BxlGfDiqckxc
	w8xf3QJ76HyQ21jPA5N0vUEXovHHw0bkWbPsbmNDcS6xIzk68Z0JcfFbLCwDAvIu
	/SDhIIc0lVKZYOmRhem4sh7zm/ZiB3lyIyHmox9JUKOW4ioEusMKaVE2iUXkPI4l
	3kbnAATUTRAGGl3o9kTBDDKZfyqZUEiujU0FfX6a+Y7x4GOsiw+O28cPbcCRDTJS
	G59C0fGKG8M8ebu7epRyAsYlozbFeRFo1kTNN5o43ED+28F3gNjvUidDuuq5xBUZ
	Jzy0qKRNDGeGzs0UCUbdFUhy2OO+3QhajZbgOAn1GHWth7plHDjg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47rd58005g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jul 2025 11:14:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 567AodSG027491;
	Mon, 7 Jul 2025 11:14:53 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2054.outbound.protection.outlook.com [40.107.212.54])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg83evh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 07 Jul 2025 11:14:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXfybknPQXtILs1XKevIR2upUl/6QoZ7s0PKrXfRdPg4pQgY2S+bgR/X0veSg6JKMjJS4tTaUVXSEF0BXtIAFhPb/WX67unQIX/iKqJ0ck8DehTOZDekTSkHGJyjHOb27GT2oigsh643+Ea7PXhwrRqLaf7Tq6doYR4VCc+W1mi9R5ZEqxgWPl9W5wtEy99GG2yAIPQ300oTzaw8G9jsLzbNWaEYeDP/K+E9bBfLLg+iWOG9+Gmkl+SKNy5+ux8JU79TFD64XEHW1qigKNrc5ZOlow4rJkb4B+ob4QGTlHLXtAuo8uhxZZT6GLe8XvGDHQ+SbuCVa4kpprbf5cIDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjXL6qCinClAzyY0w52+kgDKiX7EMr1qHRq5zY7o2nk=;
 b=PUitHGR94pqIDuXkfryRfuGoFk17VZOThstHTYdLOQ33eYSEMvBPF8OJrACtNmLva+hUGI7mz/aQvFdGNyiDz8x+R2Sh35c+MZCeUcJsKb++ZRiRckZiocTrH5qRXBQmmCsvuoqNKeHL7kVaLRA+siWonwJ2fgrjlJ65DLDeK5hCK/zOk+07GUOntzdGSYkeVyH23k2M+ZQ5YmPb2PDHWCY3qjt22Uc4n+Ye4VwGAfbjfsDVf7CsvBJrPqvl833c4KexeahSK68r2UrVnZO1HSwDyAbSPvjNsSmogbyzekQBCvNx6ooyy/+RsYcbcgPKuRMETZpw9mImYIQgsiLb8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjXL6qCinClAzyY0w52+kgDKiX7EMr1qHRq5zY7o2nk=;
 b=sNMrOLK4tMY2e3OsroV9NpZASO9UbdJhRHfNQcRvAMEJJMx37Z+lURNEwk073nNpgb14zKtJjKzv+zUsNjMziDM5HsVD7p3v36YvnJkf3iy94AICF153IFYgFfXsesQ/svmu5IiFYP6MPKdVFZah1eL27fU4pnsqXCMjfZZTqBM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB5208.namprd10.prod.outlook.com (2603:10b6:408:125::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 11:14:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 11:14:50 +0000
Date: Mon, 7 Jul 2025 12:14:48 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Yuntao Liu <liuyuntao12@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com,
        surenb@google.com, rppt@kernel.org, vbabka@suse.cz,
        Liam.Howlett@oracle.com, david@redhat.com, akpm@linux-foundation.org
Subject: Re: [PATCH -next] mm/memory: fix null pointer dereference in
 fault_dirty_shared_page
Message-ID: <2b716e2f-0642-49df-a955-abfe0525cefd@lucifer.local>
References: <20250707105118.413056-1-liuyuntao12@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707105118.413056-1-liuyuntao12@huawei.com>
X-ClientProxiedBy: LO4P123CA0658.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB5208:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff0b30b-cb2c-4b65-d35c-08ddbd477d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TYhRfcBFbb+wyCEp7nGsVWke7lESQEK+4aIWMl467sVvLkeyzHqtZ9NWKppc?=
 =?us-ascii?Q?WNpgUXmmcHLzcZWjGynqV3xU4jMyQeYtK8MI0RFcc9tqj4Bje8rC02zU4kzO?=
 =?us-ascii?Q?h4km6NmnuQkbGusEdrvsY1M4CF2zRwgZKg0ThastRBbiunVvFrmRIGdyYnFW?=
 =?us-ascii?Q?IRQF0zUIKPcVhAXtkfAylRSJ3x1Sw3SeGSKsfyRFedhJBzfEh4S/vXYCggTD?=
 =?us-ascii?Q?MG+UeyhhdQbICQKZiJuPpCXkz3jnoJx16gct4dZf74vq/87dA5gOdKq6Q9HR?=
 =?us-ascii?Q?rIonXSDosWFTcQmdnqgkPIefg5cxceu1EQVZ3sJzwzToTyj8m+7G9KKnDIty?=
 =?us-ascii?Q?88waAE9xLmDTJ/Fz7ZRDhp6fevRq/bFxvzIuxdu7iqRsVXMowL8rVqj6zVMm?=
 =?us-ascii?Q?8CWZ2KGDDS18II5zAWUJ+ujoOaXYh2OhFhrpOIzjLFAQJoBsWpLN7hI9TXDQ?=
 =?us-ascii?Q?zu/4lPadpBgNho2fmyPKbHr+TszSvmux6nlfoZ00Ld/XjiBTiQZbRyoQGkjh?=
 =?us-ascii?Q?XVRsBnkojERC40KxUnnRKUanS+rimtftntxqmlrIDxultUs9G42j6OmC9q90?=
 =?us-ascii?Q?NgBNm2uictSfu8CbiIY5YRMotUh3dLjqQ8ZlA0PSMI+ZF4GF1fnxXk+CvPeP?=
 =?us-ascii?Q?8FouO+nIpNdSkCr6XVsIDg4R2boun8s184eNKI6wQXxG1kLR1IOLaQcEr20Y?=
 =?us-ascii?Q?JV+CT5ZHMhfhNYhgGlr8kW2FTrptwl2JTaoGmSGwUrGD4uvrwjpXpmzaL43b?=
 =?us-ascii?Q?ZTcI0qhebkiKQAFsKArtjjNg2wOo87/6U/wOInZr7r/jV84wAOGCacco04hc?=
 =?us-ascii?Q?bEik4hFcIDz5Hv9IIbFkJCkslzhiAhi15t3GXso7Zta4dwkJrjkgucn6Kg9l?=
 =?us-ascii?Q?47vaKWlzznnvLXZTa1nDwroAlmOqki3R5uIfgbSivGh5symk1BjQvlhX4VA4?=
 =?us-ascii?Q?Pr5W/+2AYyq9yn8xnQPLMy7HYxLy9jiomRHQNmuCaUlOwmj+z4q6mArDYRnJ?=
 =?us-ascii?Q?5WtpjynEhdNvN8kxtCcE/r5P2cRnTsbk/fBnoFp0DUN87PwPm/nSOQm6TlMl?=
 =?us-ascii?Q?myZEhNnIURILqsQv0xLhBRy7yuxDGlgdIb31SsqPrsGuBXilYxVkZMaZnqVN?=
 =?us-ascii?Q?pXbWkwfMjZYsZuX66tuJLzsQJMa66+Z3k8IRU4XkMQPaGkW0XRczNtsfGSXO?=
 =?us-ascii?Q?p7jl5eT2yeTd4t9su71bR1Z7NB0GKunKrTprG3+WKu6BVugmWr0ey1JJ4+vL?=
 =?us-ascii?Q?Lf0ibJOQeHdCa1vjGJRWQcI1XFVMsZlVqwBwLR8TX+tSo9ogiVPMqQFV5emJ?=
 =?us-ascii?Q?P/JcAR26pVcQuAQj6M6w7by/jnHUOgCmsmuLU0+gEtrP0r/rWzdM+2mG5gIF?=
 =?us-ascii?Q?a23jpp/t0XueTejPDsVr9EmBIPj4LzVqTGeHYgZ1D7oHv9lVHQSkITxMkE4X?=
 =?us-ascii?Q?8DTTpMKLjVY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IR61U28durBZvG6CxmUxJhOsYanIijo638iv1Dc7PvB1fwFeMai/5j4gKq6B?=
 =?us-ascii?Q?w6ZkmD6yD793gPL1sDFA97AsyXxHmbemMeZxUCTI6Pl7k20XFBCKLTEfGCYJ?=
 =?us-ascii?Q?F9VS6zIrNKgXkRMRx7wm4KV9iSv8u05C1nA9EncenB1NjRLA7FC4LBWuJ5js?=
 =?us-ascii?Q?n2d+wu6FRBK7kY2UTj5NLuCXHTGLRpROLZXuTm0sBN8WqzQYy4P0E9Jk9DOS?=
 =?us-ascii?Q?1nd5j9acJ7VDlxy6Adwmzi7KGGlTcREeZ2cP2dSKWqEzvAZ/IDBD6B8zc8r/?=
 =?us-ascii?Q?FEHnf/FFBu8jzqABU6A6tPb7Q988fKAuAnXJLv5ECa6yum9hL38mkYFk1IH9?=
 =?us-ascii?Q?+NWRDr3zYT2QhxPxKEp9fGtbyasj1z9a7wuRCLjv2g3/bExzHiv3XqNyFn1+?=
 =?us-ascii?Q?xEcbenxVnZjYlR+A98pVGD4ZOwj2BdcBziGDOhLi/A4gyDAhATJR1SCYI9QY?=
 =?us-ascii?Q?cUvU75T8cYaNdBQsHxAIwvLbdsWXn4GQSThEM5WiU2VfYgcxv8DqWh2LNvw/?=
 =?us-ascii?Q?5bgN1mG4FjIi05SBVYVSow14MfQ3mC+y7woEYzzQYx4xYRgwKSA5/V4zzCf1?=
 =?us-ascii?Q?H//FYoksj95sqLpfZZxpek9lalG7CLAfvzAYsA2yu5eBDgyfj5GBA34S81Md?=
 =?us-ascii?Q?b7GJMnFWd69TDD/6irZ1NuhfL0WXzKToJeVFrr5QRMzQ0KyuPFceA3YpfTbS?=
 =?us-ascii?Q?yEGfHmbvSpVZ8SxWw92D+ONcYqdnVmaptpb+kVqkonHZCYYFNdcJJngvptNb?=
 =?us-ascii?Q?itMV/q8HIdSCCfZq83xOEAk6vjXjZ5YyGyZbvXQb9Kw6qEyIrIgFF8DS1n2m?=
 =?us-ascii?Q?t5OVzuxHhTQ94+HaN3h7I//Vm17iAvb4Zj3I857o57IomQ5mI4W2Ab7BwHmc?=
 =?us-ascii?Q?RAy/5dtfd+JRsUI22kuZW+qJpumdEJZVABkVl3WPN2DiiW2f7Ob+9jVqMxvv?=
 =?us-ascii?Q?+KPPtk6aqM/IiIqQGpchFkVulV1vU1IMtH3lZU+j2lycYor3/A8zwM1xn+Um?=
 =?us-ascii?Q?xi0Hn3bmuhK75On2U72RPFmPPXrM+XcNIAcCqqhSfIOV5hyGj5tgyyow/8ow?=
 =?us-ascii?Q?rGIGeTWiSzZedLmjGLayGwW1AmHrA62P4d9Fm/6CKuWFTtRiVKy2UcUj3i8J?=
 =?us-ascii?Q?9c8KV8vRZN7xeYnqd5/6XxW2twZ8V9KotFpkVc9Tsc3sIya0TH5VI8hbvxXV?=
 =?us-ascii?Q?fFIE53fPMjct6eWA6Bv4p3btZEfeWyu9PXnPnVq+/pqU41qvXucCcdtNyCrL?=
 =?us-ascii?Q?ouLvrNfZRWN0bj25eWqJD3Gw8hposTcntmVHhDw6b9bVUq6PMGYOcgm0JxUS?=
 =?us-ascii?Q?pVdhASgwg8MuIj+SyfJhSXWe/H2Vd9B1FD7fO0liofW3ZtiNv5gHQqRo6daB?=
 =?us-ascii?Q?70k2psCENjidjCTisi/loUf02UzuRjyzizIyfKbJ6sbjcaffhNO51IF1jj97?=
 =?us-ascii?Q?7LuE+31fs41GloUuzBw7gtnL5uqOxtfW4j5/6Kno94ImPFzuRj2Zaqb1kwY8?=
 =?us-ascii?Q?Ws7vHfuIalRJq7dC+/Xh9uVWJ/NyR6w8XWOqOy1eHzG4ZYKtuT3bH6md3/PG?=
 =?us-ascii?Q?MjYSOfdzdEIWR07CCCVH9uRwK8oK5ZAQXjkqlWequph52FY/KnwHERljdwIu?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	43AGrBpMsbK8Pa6LKirjCKhPkJW5sxOBUJaq+8HGsG9y0QndG5Vab50oyaeg44s5qsN7rxRaFc69X4B35qoyF6a8DQZ+Ig3MdFxWEwsXCraMk5EDM3eQmSiA6GIcaqDWlADWXMqg6WvWkSLHY1wheDbq92i7TPyHRD4ZXQt5JPQWK5AudmGncJ0g3U4ArrTwD5e75lH1E+hBq3XA3iIqRBUV29bBivhikMFw2v3nGfLYuNJk51tCvoiWyCa5V2/CnBUVdKkFAdsFAyBFrT9B6NunH4hNEM7n+fqb8bvsMHrFQm/Kb/Y9KELkygaxBTw8IS8qMDubWHlIqCYFEqcOwLXrbPQUVZ91HCznVv+afnQAIsMbcqb/O8i9KxQijmEu8dT9POt4DQW0zQgCMOb6f33YB5Dd5STzRf9CorlauFqgwLkAhSl4jDJQT6SGMx4xjSulrwTZvi5hgubOP3mPrVIoGzy+rhzyS16pzGZAqGJW2gtZ1QTUTKA+eVO7LhxfBo2E2663tUo0zdaiXh6dvkpFKdVCAMk9LFBMl1bNUfoXcOiYqZVbrTfKgSS8eAYT49TnYGNTkorVAIi3Gi+A2y0g97KajAOq+dTh0o2h90A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff0b30b-cb2c-4b65-d35c-08ddbd477d93
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 11:14:50.5206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Qo+pMQB+rlos/Cd20d9jXwasDpL9VMchVlGxD+TgDvwAF9W8StCA8a3eqpewYPCptnoje/zJCDaFM2j/tDy9PGab8maKgl/kYtlVvuJizo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5208
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507070065
X-Proofpoint-ORIG-GUID: j2kWgODHk1z6EOAfzcdZAzWthj9QFO4K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2NSBTYWx0ZWRfXwr7QZidB4yNh VS1gmWvHIQ+joAJ1wtm9la41WDAjTUcWFtoFb9DlsS6Y1h/rksTOtcQcQyWIAml1Gp1Lc1/SSTt ork9PHZnwrpTutm+4h2dTIY9ZrofC+uAXXVYPBNw43P3j6ED5fYCe/LUZH7XK8lLrt5r1N67mrt
 WEXo7x0HaYVsnVvwhMVp8LBFn5UzspQ+rKQokyVq8jaHJvGba4KLvYq62DTxTyt697KYVEFqcD5 s49qp8ZZ3c3uqjw2tTFLm6Kgzd6REQIVwD3NJd7TESjsh1er1s+kYNDvoyGBnWrAZaj4Hx9INIL JL9qM5o84RnCg2q8v+gV3/0Tojd8dn7LqlYv5t2qzlpT8XjVe0LuTpH6VSU8kVsMDS+N2L5InSP
 I0oM6nxtUfdap9PM7fQQ/pkBY1wwaxjbIUuZTC/dHHWDUITzPc5gUMXuVL0nMPXUl9UXjwDm
X-Proofpoint-GUID: j2kWgODHk1z6EOAfzcdZAzWthj9QFO4K
X-Authority-Analysis: v=2.4 cv=U/eSDfru c=1 sm=1 tr=0 ts=686bac2e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=i0EeH86SAAAA:8 a=VsdtpbP8TymSFjIpuEIA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12057

On Mon, Jul 07, 2025 at 10:51:18AM +0000, Yuntao Liu wrote:
> Page mapping with "VM_READ|VM_WRITE|VM_MAYREAD|VM_MAYWRITE|VM_SHARED",
> the first time accessing this address through a write operation will
> trigger a do_shared_fault, if mapping is anonymous, it can lead to a
> null pointer dereference.

How can it be anonymous with VM_SHARED set? This would be a far, far bigger
bug.

>
> [   23.232336][  T195] Call trace:
> [   23.232542][  T195]  file_update_time+0x2c/0xd8
> [   23.232801][  T195]  fault_dirty_shared_page+0x1a0/0x220
> [   23.233099][  T195]  do_shared_fault+0xe8/0x240
> [   23.233374][  T195]  do_fault+0x78/0x240
> [   23.233629][  T195]  handle_pte_fault+0x1f0/0x3f0
> [   23.233905][  T195]  __handle_mm_fault+0x2b0/0x548
> [   23.234186][  T195]  handle_mm_fault+0xd4/0x2f8
> [   23.234462][  T195]  do_page_fault+0x2f0/0x5f8
> [   23.234727][  T195]  do_translation_fault+0x8c/0xc8
> [   23.235021][  T195]  do_mem_abort+0x68/0x100
> [   23.235283][  T195]  el0_da+0x4c/0x1a8
> [   23.235551][  T195]  el0t_64_sync_handler+0xe4/0x158
> [   23.235861][  T195]  el0t_64_sync+0x37c/0x380

How have you obtained this? Are you somehow injecting invalid state here?

>
> Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> ---
>  mm/memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index eaf98d518289..8106ef8a5036 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3412,7 +3412,7 @@ static vm_fault_t fault_dirty_shared_page(struct vm_fault *vmf)
>  	mapping = folio_raw_mapping(folio);
>  	folio_unlock(folio);
>
> -	if (!page_mkwrite)
> +	if (!page_mkwrite && vma->vm_file)

The function is ltierally fault_dirty_shared_page(), how are we arriving
here with !vma->vm_file?

>  		file_update_time(vma->vm_file);
>
>  	/*
> --
> 2.34.1
>
