Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EB5249F9
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 19:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747510160; cv=fail; b=HFloBMF6YHf0AjqzoE3vSjeE/dwRLgBCmhcJSU0k2EcAjrPk7+8caUKC7ZcGNS483nB0cqKbuVobRo2qkB4bIF/4yjLMbOd4vKt+Z54cksVIgrdSt1Uz04y0wM/fXuL9l5HggVSYgV7AApvl0dfjgcQbn4zZw1MJA4H0iyTQt38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747510160; c=relaxed/simple;
	bh=kpGFWVYYd6ABSEf9aNlacXUDNaI5A77Zk/dBgUtzLsw=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=krJrKT4gVn93DjqvsTx2G173jD+7x4O67Roh7H3GOQ031CUWAG08xlwm8vKu+44XVqIZ5aI4rK2fsVw2zlyg6VnbRQIM/bGwL5Vjhu7FdqpqTd2aEV09zgZwCmXYLDl5QnEKp2UziRlULUBB7ZBOJ9FRxPE+3BzHVunyZnt5DKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hQNT4pGc; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wM4fJUpH; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hQNT4pGc";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wM4fJUpH"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54HF5b4f003913;
	Sat, 17 May 2025 19:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=FcvGMD1lpoZEjyiALZ
	K84albI/IvyQBc3eCgcxjGIvQ=; b=hQNT4pGcCiUyM2WY/1Z5EXgISUz9cMHu3F
	sqaSB67fDRLMN2Ai3/np621MvmETLes0gHWveKJaiQj/IhF5azNNtd8JPfSSF6/L
	g87W2ZbCpOvKwAIFmUymKWYncfFrOrr6el+uidE00UtBDXzZ85K+JzufGPXe2ki8
	dC5N+FNdZDcmGqc1ERlDOKw9Z/jvFAY2zKYPyxdd+DCGKp+tcFm2DBvOTOGYFz09
	6dCYsWnNcYDS/2tDBldSbFDdxz0fdMAteaXy5iSh/cwRfihRWGnO5TUikjawePg9
	u3lX5xRTNKNW3x3dvTsrslPV0SA6PslG1V2F0xK4iab1Wo57l20A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ph84gjyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 May 2025 19:28:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54HI0IRp010840;
	Sat, 17 May 2025 19:28:54 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw5dsqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 May 2025 19:28:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUv+6m43qxUdrklrGMA2KoCJG7mY0Gqhdl0bFkrhUIsQKgIgP78m/3xvBGpkLYi/ld9509zlSnphA8+Bh5Q9RaCmTVIF4MgRkF6g/oDj0MqzDyRj3J6dy9ixSn1xfEkjnXKfuBbuUEx/5L3mXQaRbeCZpbtKY3gvc8T73tKMguddEsuKkevNql5puT90fxz/pAOE2iLgj2Q6l9lNQSnO3lW9hlvax8Kd1dDsk7XKf91vdQncxfF8UMEJsOhbKEISRzgR4Ly9+Cqn7sy+ATJf/VmcVYq4m+Zha/cBCMuPEEdMxacLIhcds1iNbKujmN9Rtr8nzQDbyWQzFdYXvn1rmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcvGMD1lpoZEjyiALZK84albI/IvyQBc3eCgcxjGIvQ=;
 b=RSxEbMyqf31z04F8dV9b4YLtPeEQdQdUpLPFxo3JZRGNfRvogy8Vy/PwV+0DzgOOJk43BJVH58AvPNtdg4Fx1U8m88kj901nNReMvWPb0Mh4WDpiIysRnRgtO1RugxHNyQ2CfvZyvJ5SufsCCEWqZ2Ilz6I+SCM1RDtghrUdStVsu5BjyWzkwzGpscDIdumYJho1sBBEKdUBDoUC3Ax6ScxVIViVG6WLb/mY+D7zNPU8+9WWmjanrDRzlVw5S7k4NPU4h53sbQZ0g5J/V5brscqb0WhKpeaU3OQZRd+U2Uvsip0EBifjZucTw/Oitxmz2aCMkQaixuaezYZ6eCWsNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcvGMD1lpoZEjyiALZK84albI/IvyQBc3eCgcxjGIvQ=;
 b=wM4fJUpH16G3MsZm88tJi1dbhYQrmHmRapIPlwojGho+1ZcYRz4bzqpDiSXDr3cbNTirEJXACWsJvFvW/0AZ2DbmAs7KntcC+l8439OgdnsKiXuAPqiU94rrKIy4E6TULuifQy1p4pWqN7x1zFjzB9zP64HYWkbyX5MHK03MqgI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH2PR10MB4215.namprd10.prod.outlook.com (2603:10b6:610:7e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 19:28:51 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Sat, 17 May 2025
 19:28:51 +0000
Date: Sat, 17 May 2025 20:28:49 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Davidlohr Bueso <dave@stgolabs.net>, SeongJae Park <sj@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/4] mm/madvise: remove redundant mmap_lock
 operations from process_madvise()
Message-ID: <371ec2c6-01d9-4deb-a234-aacad94680c5@lucifer.local>
References: <20250117013058.1843-1-sj@kernel.org>
 <20250117013058.1843-5-sj@kernel.org>
 <aeeac6f3-f828-4bee-966f-c8df41df30bc@lucifer.local>
 <20250131173132.uqjwrzj7e5vx2sbv@offworld>
 <7k2gs6xmx2q7la6kle5xpn2p2f6bccbiv5lrdowp5hnecxpijx@rzwxdhcl6mc2>
 <5fc4e100-70d3-44c1-99f7-f8a5a6a0ba65@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fc4e100-70d3-44c1-99f7-f8a5a6a0ba65@lucifer.local>
X-ClientProxiedBy: LO4P265CA0179.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH2PR10MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: 96160026-b884-4107-67ed-08dd95790e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Bvxy0OV8LrONpusbYnhXwMs8OS/49DMPTKfwtNSHapQsDYAjodKX+BRqBis?=
 =?us-ascii?Q?82UzBp2JGMbDKdbUWZRSP/8HCWlFfYkdq2ZMgQ8pT6onrH/ZFYiYuVVpIYVc?=
 =?us-ascii?Q?XCR5pV1EarkpNRx6DvudU0wBePVlbjd+xcywZE1I0Rtgv8A9Z5iX0jBS8U/t?=
 =?us-ascii?Q?Dp+plivm2kvGBWWDYPTKxzF0pMA1x0Rs8wGtPDoE+A5IZedGoxIdxPi0P6AF?=
 =?us-ascii?Q?RP4qxbTxpynvNL2JzJbEnXTCop5AFgkIBRR7G2QKBAUY+igkVcZ0fFKPA8sk?=
 =?us-ascii?Q?T0f1HArXCOEsIrpKmZz5IffcSf+h+0TIjqcKaVYGewX6YpGT44GETFxnH0qU?=
 =?us-ascii?Q?3qpaLnwbkDyWbYuQecM2k8Q406iIzYvEviGHSA0s+SDHm5j8KzRDS5qkqB7g?=
 =?us-ascii?Q?JZUFyeUlGccoR4aF1hX4TcSw20ke+YxOEwcz5ZrX+oW6+J5QgeNuLRkpO+So?=
 =?us-ascii?Q?eKh8s3wV8Yn6Zvyrq/+wfbPhOTVrkPbbJXerKxVxilUaFqhCpRd5VHLUsyx6?=
 =?us-ascii?Q?soiBmqQoQJfhg2HMdMF9GDiwutiUBn0peJl60RglFLFGz9/GohtE/HUvTXI6?=
 =?us-ascii?Q?KO7YTTUHEvgSbH8r973BWKWmeDcE5DRN3+bZJGYlFk4F+A0COHijaca45jIx?=
 =?us-ascii?Q?KJorllYrERveM8YmGMg9WpbU0UU2czNfuEEmjHp6flzIQts2ITYURZUiW3vh?=
 =?us-ascii?Q?DdcCMKNpkvH9cmNttQAB0FIR4RVCMo9OffDiNhfZrWUWufOk1UzNvCQfIKQz?=
 =?us-ascii?Q?A1pMkU/TSirI0/mUphKHjHBDRDiaq/3CqOSOx8aIp3rkSKDziSkmlLYFkMuN?=
 =?us-ascii?Q?XvkX6xpMejnGsj8BkcTLB6MTTAVVQrkZXC/JC3UVEwT8F5zoMpArzIBW9Jhp?=
 =?us-ascii?Q?HiW5z+P4xPF8t0BUNXseveZhgLoYCz5tQdAjEeZnB6lqMbVbg8NE8o3i0+15?=
 =?us-ascii?Q?VlUkbEVMVIHLVggEC7T89ztjNVYV//gtgayVD9sTqExczjNDDzguBNFOMxc6?=
 =?us-ascii?Q?YHQYGTbqGJc6B6OaxnHEuUoTDBqx9n0xZC7lS2+bDp/84JQpXIeMt2ZdXQFR?=
 =?us-ascii?Q?qZQp7f8XAqde+y9fhENXxijIdHiaQ7sAEnK2LaLZCOmkwXfChcyPu3fNr9SO?=
 =?us-ascii?Q?kBOO/Egrt52WpQ5yF64nFNJ66OLvLc5EqtKayT2wwUHOBQvEiRViwPQ5hwUm?=
 =?us-ascii?Q?74W7oRg3CU92be328eJCSEdmXP6yPChQS5vLtxFciACK3A1lKhc7zTcRt/tC?=
 =?us-ascii?Q?P+fRAO1o3PgN8qw+5gpOvwef5NrFWRmkrGkm3NnTDHRIeWHbMfWM15ylB2Sq?=
 =?us-ascii?Q?OOaw3l+LMBbCRibHuOOFKNP/NSTjUNLJMRRuZrIV02NVj1FdzQ7K9sfSl7gS?=
 =?us-ascii?Q?fbqlm3nf6wY8G2WmWVU+PZTWuwlOcU9D/zhPA9SupvRMoeAVpUn0VaeSYUUD?=
 =?us-ascii?Q?tofLmgZB9XE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/qpGRSigF6o0gXNaUaaveecsHULzVZ9J3SShwhSbBQ+m/xI9vF3eoN8CWZDk?=
 =?us-ascii?Q?aoPfO6BGePtNiI8vggbk2k6ybPwZq2OnnDVbjrzezJc3uTrDTa2m1akuY9yJ?=
 =?us-ascii?Q?IMgCBrmItPI8BlHeOK5BUzrfKxnfmlhMJ0D7YKGM7XHv5IgKxG8D+KlewhLb?=
 =?us-ascii?Q?/Kj67IeDa6RDPgaM3g+CBQCK2EtHwM5qGZ0ajUa5W+kGX/LWyTuZ++9Uk668?=
 =?us-ascii?Q?R0XNjTjqk/BR5ho8Eg0epkuiq9O9B0d9odPB6JP5ObCZ0sXx9UdbrwJNJLRB?=
 =?us-ascii?Q?VY+gB3WITYV2VPrHRGPKRkudVBNwhtwn73h2KkTW/yZu7hI6Z5WXePaocBZg?=
 =?us-ascii?Q?UIARdg3oiWolSaOKLNdfJd4K56JrB2cjCyVlRJQtET5o7RoJcE9/ZLIAtSd5?=
 =?us-ascii?Q?DxzBvtRR52jkkklq/dkdlEK5LaE+9i6XNTWstHQ6O3WaQG3L9fcwC26khfs1?=
 =?us-ascii?Q?9xCiqRzjXcgyTfiPmubea2pre03lDxFd10CLVQ5C0Hy4WqSJvdEKv7C16J1A?=
 =?us-ascii?Q?+klcBu5WCoJHqJC+T3u/p/nIFP4P//A8mf6xFCmgikvLQZ7sVpIDNdicvVgf?=
 =?us-ascii?Q?zgAW9zTjh43UVL24n3F9ajTD2Ou56MnweqkxKvc92saPmbbgEuvpcoxZSEaY?=
 =?us-ascii?Q?d/pC6DzGQI0mvsdQv6MdgbgpNuKz0tZtH9bXF0dqf7Dy+7SPTDo3dOBkE1v5?=
 =?us-ascii?Q?S6SsxIDAXabdQFeguh/0szMYolkjrYPO6MH0HnnNRKSxKgg+N5Ou7Z7XmPxP?=
 =?us-ascii?Q?V7iT/QQ8GaNGXrkeBV6ipDYTFOduBfBfZe2nXLTcZnYydtH0OW7rA6T3+MwU?=
 =?us-ascii?Q?rIZel1k7yj4yWDDmwDvoRCwiT5bDg1OacBJClwilzvlLmC5O33UXke2tsxGW?=
 =?us-ascii?Q?/fxC9kZga2/jqolxflgaRy3nv2slP0F67J0emiM9DaHC9zYTL2zxQ6vhCs9H?=
 =?us-ascii?Q?3zl136/6lClHhD3YWk7+FdJQn2jfV8IDr+rcsNRQSIWli+u6qSaSp8TXhcP5?=
 =?us-ascii?Q?X/8CLOe9pvuuZrSp+7R+XyCRdZuuSkcqrljaWt6aqQ1kCi/Rm7pCnO/ZgKxB?=
 =?us-ascii?Q?yc9dSMDx/KTgp6qC+N3R9ovSf673vpEOShBGPgu2TYeCafeHW//tX6yegXNy?=
 =?us-ascii?Q?tcuFHgP6z6NAN0qF2MzcxCkb/9z1sGt3m4Pck4wM9sEzqfNz9Gaj6IfBWPKB?=
 =?us-ascii?Q?2XraHzGxGw93d4iytd3LL8FD0eYYVl3MQpo/BVw0B7tJyMyyub6ospNbB5SZ?=
 =?us-ascii?Q?n9WZDtHpuD71LIGgrgiHwIUZh/Je/fu7L2AD3eUYiutRv310r5RwcKrE+zBu?=
 =?us-ascii?Q?iQ14e1vKGuP5QH1p583WLiURQCRL3g+70dHoXRjLtqUCDri0ZYIBr2HJBMpH?=
 =?us-ascii?Q?vHB6JIRUk7mIuIXegMNbEjQWALJMHBOLle+GqXRBpTkJJV9LmKLi0rHwhDtK?=
 =?us-ascii?Q?YS7CagYMkLrGjCpckGA+8/4L/jIOKf23HTrZeCNC6yKGle313ynMuGJMt1In?=
 =?us-ascii?Q?Dvu6YOVqlgPX5ysuIzyVGrWOVb1/YGpESCbpGZ7Tlg2jRCP3+Kb5c7wta7JG?=
 =?us-ascii?Q?dG1mNdlRj+e8AgQjALZG3fNIrSIB7FRfPuZbJmasELKoFRG/ynCvxdUk6lJ7?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/SiMlWVpzBbIB4C+ID9hPKoD4F0y/D96dAVRQ3QNvoShQN4dO7N29HZrmxs++csUJ+sen1WHMGg965kM6suEk6CW+I6zDChe1YRCcXh80McJxM00kOu8mrRkCSAEMbqUfNpS17OkGg7uBINUeUXoj3h3gUtgOTRBsivszpEDGRinQcB3M0z50rU4OER38b0n2Ac0v+Uw9HK24wskFEzZfTnplR5/pO9kqa8UZHCY4AfsXBb/DT1Oft1B+xKzFtJRZZ0knG8MAsr0q8bTTNKJuMIolGBDd7no6caeZ6HZFSs4fOOfcR7Cu52MDVAK25KNlXMiMFCROn6TsZDS8De3Px33l+f6vKHTpWlz2W375eDBBDo5F6VytBi5xopa7UTJ9FT+f9QOicvNM+e1jggHrUNubiRnktge8aJtVhRUTZeSz3+MyDIZ4UNzfNs1wlGds5qvCvkJsQYI7HYqevvCQScfXb/XXcn8KEoB+ZzdKI45JSEs+wpWd4lJIlVrzDdtljqqglOXPbdQ1DVknz6EofOhBJU3wCEGRxff0iHCB/VvMptmV9OqpMKVPpQ55To5gpN86oKvUnDtjJmJoa9l3Wolz4r9vdzAg8JQowEGWOw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96160026-b884-4107-67ed-08dd95790e00
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 19:28:51.5985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64X1Ha77LO1rg599YMo4Sc7/Hhl/c/PkIp7X4KXOyIiLHdwxgn6O6A+Kw40PP+QmcQQnzg5O0F7vwIwv5CXLbZ4KXYHyfE1osJ4SBLvKyw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4215
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_09,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505170193
X-Proofpoint-GUID: Eyv3jLvBcIuVsJeS8kt1PZNj9NmxOc5w
X-Authority-Analysis: v=2.4 cv=YPSfyQGx c=1 sm=1 tr=0 ts=6828e377 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=R4ayLD03AAAA:8 a=vFUq353A2xUveRRD8ZoA:9 a=CjuIK1q_8ugA:10 a=qJlm0-shE6CLU_iKUWNr:22 cc=ntf awl=host:14694
X-Proofpoint-ORIG-GUID: Eyv3jLvBcIuVsJeS8kt1PZNj9NmxOc5w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDE5MyBTYWx0ZWRfX3IH9/LksxrAp KeCwTxMEXDfWvHumYmOK/7De1o0egc8XmkO2wWTF+RqbmOez4rrlMS46k46ioLL+LOH7JLJ0gqs zFMrZija7ymI69eytbT5nostOQbAR0f1KVBV0nesm0qFq8JYgxBRbJluQJHPNA6n7wZuehUvF8c
 F9Jt7U5qGnoV1Wmw4GnVsqjcEfCjLAg/1/cW5w3GCIaMv4zAVoKOHtPnvwDS1O5Nk+cqm1HmNmj koWtdW8+xEIAQaiw3h6Y8bqhfLMGLZscXb4ZzcgTAHEKnqM1exGmj0vVgY0eOM0Cl4muoZu/omB rx6sUScMZOSKIebAnGPY8r+bWsJyMWL5bunRpFJjeKkUf453Vjjy0ziRJeka2p+GrXFgw9DF6QS
 6z8WsV/sygdihB9yS6UH1O3LtzSF1W+QCK0vSGKDv1G2Q/IwArLyY9pyI9JWdt0Np4GnRTFn

On Fri, Jan 31, 2025 at 05:51:45PM +0000, Lorenzo Stoakes wrote:
> On Fri, Jan 31, 2025 at 12:47:24PM -0500, Liam R. Howlett wrote:
> > * Davidlohr Bueso <dave@stgolabs.net> [250131 12:31]:
> > > On Fri, 31 Jan 2025, Lorenzo Stoakes wrote:
> > >
> > > > On Thu, Jan 16, 2025 at 05:30:58PM -0800, SeongJae Park wrote:
> > > > > Optimize redundant mmap lock operations from process_madvise() by
> > > > > directly doing the mmap locking first, and then the remaining works for
> > > > > all ranges in the loop.
> > > > >
> > > > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > > >
> > > > I wonder if this might increase lock contention because now all of the
> > > > vector operations will hold the relevant mm lock without releasing after
> > > > each operation?
> > >
> > > That was exactly my concern. While afaict the numbers presented in v1
> > > are quite nice, this is ultimately a micro-benchmark, where no other
> > > unrelated threads are impacted by these new hold times.
> >
> > Indeed, I was also concerned about this scenario.
> >
> > But this method does have the added advantage of keeping the vma space
> > in the same state as it was expected during the initial call - although
> > the race does still exist on looking vs acting on the data.  This would
> > just remove the intermediate changes.
> >
> > >
> > > > Probably it's ok given limited size of iov, but maybe in future we'd want
> > > > to set a limit on the ranges before we drop/reacquire lock?
> > >
> > > imo, this should best be done in the same patch/series. Maybe extend
> > > the benchmark to use IOV_MAX and find a sweet spot?
> >
> > Are you worried this is over-engineering for a problem that may never be
> > an issue, or is there a particular usecase you have in mind?
> >
> > It is probably worth investigating, and maybe a potential usecase would
> > help with the targeted sweet spot?
> >
>
> Keep in mind process_madvise() is not limited by IOV_MAX, which can be rather
> high, but rather UIO_FASTIOV, which is limited to 8 entries.
>
> (Some have been surprised by this limitation...!)

Surprised, perhaps because I was wrong about this :) Apologies for that.

SJ raised this in [0] and the non-RFC version of this series is over at [1].

[0]: https://lore.kernel.org/all/20250517162048.36347-1-sj@kernel.org/
[1]: https://lore.kernel.org/all/20250206061517.2958-1-sj@kernel.org/

We should revisit this and determine whether the drop/reacquire lock is
required, perhaps doing some experiments around heavy operations using
UIO_MAXIOV entries?

SJ - could you take a look at this please?

>
> So I think at this point scaling isn't a huge issue, I raise it because in
> future we may want to increase this limit, at which point we should think about
> it, which is why I sort of hand-waved it away a bit.

Again as I said here, I suspect _probably_ this won't be too much of an
issue - but it is absolutely one we need to address.

>
> > Thanks,
> > Liam
> >

Cheers, Lorenzo
