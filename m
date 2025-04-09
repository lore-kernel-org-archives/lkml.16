Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2360158DAC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744176064; cv=fail; b=qEc4Np3mAiLCv56RuyGgojmjmePSpUNUtVU8xmcqk4EpQcVaKhib54XIAULq2zGME/JUhOLl/wea/6EB1vjhCIrQVlOXTavfDtYg0wevsojS0x5TrvxVzDkVm5/wQJaAqokJrjiLwFDczkTvwsF0xRPeOptj6NGDwciU8TzMvk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744176064; c=relaxed/simple;
	bh=p9L6pb5a0VmBr3tLrS3jXLwLUFO4B14pSdsNgxWh8TQ=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q6hWmM2JKOWsNsBmzy0nZS4zMgASRUfQc/iapRAdJWSoRUWonyk1KAiVXMc4Y8fpVU0qr/1kTakShMSXT6xM6y4IA+ZK7rwS2ottgNPel7xLkWU5T8E6P5KXWfjGBdmCoFB5kZiBENR8diWdv5Erp30iMwdS7mOQBwyBWeRjZ6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kvSFb21L; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OnxXRU6y; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kvSFb21L";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OnxXRU6y"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538L9pM9018886;
	Wed, 9 Apr 2025 05:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=t9dyOUsYKUAVjxrU7t
	U6Jso5uSqMxbCMCntkL9XYu5E=; b=kvSFb21LY/XazduXZ/SLbBNpTIEBF5zCYi
	7kVMCEjFYyyN98asNi7aV99RJl3cpgK4chpoDZV/vwJHu30qx3Y+FXQwSaQIWKqg
	cT0oH4yrHPBkmlaYO3svaDd5KZ8DkVQht4aLPLgihLmAhRfcpJ4QWRFUq3nylzJD
	XBtITtXt9qexWnD1hMmvgVvYdZqm3hgCUnkvcDMUdXgWrH7DrPjAjn5aK8rBKAqL
	k/jmzQmA56iG3tKArVRR/od0ou3thc+N49Ea+uR3crLn/iHUaGFbMzYZv/3SXUGs
	kmESZs6jOwATE6A9lUKLEX/ywm7jtKz7pIj4xLE39pDcBLnN+iFQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tvd9x74q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 05:20:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5394gHmj021069;
	Wed, 9 Apr 2025 05:20:47 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013076.outbound.protection.outlook.com [40.93.6.76])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttygm1rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Apr 2025 05:20:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNUhdQLe3IntVLtWIOwzL2liet6381pgRq/kuIeRkhuaIJuC3QEvveaw1azbXnloq3dUeH6ajjSGfHxuF1/74INfeDe+JZDGVNAMmhthcbHo3T5kObRl5jLC2NQ+FsxlHPmXsRLhpYD6+mSX/FWAvSVYhZP2cJ/t6s2OxF7Q/OWt4HicvS+lMSCEOw5r1QCf3g2saV/NoVnzKyMKFQA8dnMV5r8mXrXKIpRRyaLg7scQO+W9wWi8iv/x+Isr3SIVA12fvOM1rZwq7XQSo+8f43M0EuwCR1V8nssGV+ZjVs224fQXH4LIj55SwffpvXBuqqos0fN0L4H6FAjZzfh5cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9dyOUsYKUAVjxrU7tU6Jso5uSqMxbCMCntkL9XYu5E=;
 b=o19cIo92KEsyDOro57XCRfeMTwA2cbiwW2Uuf0DPH3kblr/27fyex/tYy6hicdrU5AXRZBC6cVdj45JSXLEVd/9Dn7lwdjF816pZGZw78E9RKdXLarZFLwd+95Fz4bXvgLrKQwdTsMhyO+FckD396s+nqX5yWyjU58SgRQLqyzrD6x4MRXTANiko1u15Tf5QPsnTivI4rCI6r3Lbug/F9Ggfz5uRsaQKvodiUDQrY539cmes2DtHmq4b7fYSoNx3pDYli2HVzyUKfDbX2stfJhH97xSYKhJ0zCExDyDCFLiOPt2lfLWLI1fnoJwt7k2GwMNcQnOOj5utfueJcFJoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9dyOUsYKUAVjxrU7tU6Jso5uSqMxbCMCntkL9XYu5E=;
 b=OnxXRU6ytrDmUBU2SHlUBqm6dA+q6CkEG6GTOFpBlUzdMnChKvr52JHr5J1w/+HlAvxotsIVFFt0Wt1kHhtUczK6Mx0wwTSyKfaQ/d288mOzDCXaufU6/Bz4Q0SHG2js6ojdRiQkKys/fP2azOFGDF+IwEOX65rUti16ACc6i2M=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ5PPFC322FD87E.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 05:20:45 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%4]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 05:20:45 +0000
Date: Wed, 9 Apr 2025 06:20:43 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add memory advice section
Message-ID: <cf8f9cab-fc5e-4fea-8ce4-b4eefbfb7f17@lucifer.local>
References: <20250408161105.156350-1-lorenzo.stoakes@oracle.com>
 <acwykb6o3cqda46aq6li6jzjq2rovjlsuf25didyln7mfcguws@z3c2p5n6aand>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acwykb6o3cqda46aq6li6jzjq2rovjlsuf25didyln7mfcguws@z3c2p5n6aand>
X-ClientProxiedBy: LO4P123CA0293.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ5PPFC322FD87E:EE_
X-MS-Office365-Filtering-Correlation-Id: 19aa17d8-f771-4d89-2d85-08dd772647b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8pZjUanaQzxyNKBDrUmSkzSFODY3byU8r57FF8KyvcS8aLygM0bAoqG100m7?=
 =?us-ascii?Q?yu6a4l8hEFG0SeD+8Ni9S0ksE27bEjHUQhRS83JIqMG9gynRD1rR8XHTnVH1?=
 =?us-ascii?Q?H0inIZwyEEALwJ5YFBI5IpnHym4FJOAKHDQNQ4fBXaztarE8UZRSROyRzLLD?=
 =?us-ascii?Q?XgaQl9VFJ/bV94M2iBfvkqNdy/e04C2ZPASgeyTwqC/0t7GEXvvbHQnWWVEg?=
 =?us-ascii?Q?FEMnRaxT7cH4GLlhuXwvmxlKWDGQN193Y8BheCWOavRdnFATTt8ARABZhxHU?=
 =?us-ascii?Q?9o9t1riGQVPAlDLrqQQkrv/yac+wXbKXteY+S82wfHvQktiIOyS+kE1GXSYi?=
 =?us-ascii?Q?BGpoN8I83uQMwRuP6j3kz8Dr6wVSviUD++7uUNN3+GTJGpStC651DNwnBqM6?=
 =?us-ascii?Q?UvZlpb0/sf23+Acnng3HeJbV2FO0qFCZPUNjelJ+91nx8fybAYicMJuEzLIU?=
 =?us-ascii?Q?SJztkI4tJs9m4i0OUc2H+1hnCkRRP4Fp4r+YEiS8iji+bn5OZ7Fz8rdn4qYb?=
 =?us-ascii?Q?tj5hMVR/IaOVsy1cpwGURI0NieXE/lsN+B7bQIJYFfLDUf1/ItJLfG0SJmft?=
 =?us-ascii?Q?ET5ZGYU6fvdreARQHVvgxQ5odSgbPN6iPaSdHvM/p6kAj675t3uZ7LWWlWWb?=
 =?us-ascii?Q?oxftAL+WTD81sVi/m+RhHDri0SKU3gCd5rXysamNbQd0NiiFNjKtf5PBQK37?=
 =?us-ascii?Q?TPuUAiUUVWrRJlYuYDNMxiOePCB4lLPpToDIGHp1db8bKa1QxdgeFhg3VZML?=
 =?us-ascii?Q?f8wZSXkX5fcmPYutJk/f3q+kOeWbGrZBZFiIAjEia4NbfM1Oiy7+DfdEvE/6?=
 =?us-ascii?Q?XUSdXV0tPrr8jCVB4wsHtgGp6JxmHMOv7BiljazF9+N5eu/Ib+C/m36Kk0Xp?=
 =?us-ascii?Q?2e8qE1lrRXbKY+tovx6wMsMabanTGtxwcluzTt7k7f0o1+sBfEvzMy6OmTgR?=
 =?us-ascii?Q?smDgWDZp2er8gUJ5Fr/DSzBbEbb+lnmGp5dLkZD8MM3fMZD3JKvNbAqUmC8I?=
 =?us-ascii?Q?DT9dj5yEv+IjbkYKAcBdP6v1q9pQsTWvG8pAFUHnv/uWH/7YjTfHqBbxACZ5?=
 =?us-ascii?Q?UrMzUsYBbk2bvGf8bKpH9yXcTykeKBv90IWRYEiAh7OpFZLVnEFm1EuuS+Tg?=
 =?us-ascii?Q?j0mmrjFizyfaSU3ePmOAprp53zubh0GJr88cJawGzXfsd+vxyjZsYRDQXR+x?=
 =?us-ascii?Q?Sv5qZ3124sZyYWLh4AEY/q/gjtW7tebehgrPGF8fKljRTcHqZ5A9UBsWjBWv?=
 =?us-ascii?Q?DQcirf3JqSt8/Kax7CJyvRnG2dhzgEeRQQL3Vsl6UrjsLlzTzA0aerjNKrBY?=
 =?us-ascii?Q?MllpJxP54oRCtamxHehZYSzmtUQiBJAJYBs2cXX0F2lT1/xZok+fVUYTkfc2?=
 =?us-ascii?Q?Lrh7RzA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2OuN5t3mnFK3N8C8NQ20UhRZ2HJGyw7f9HwxoaEae+kdFhqj3kqt2w74qmOF?=
 =?us-ascii?Q?odZKrhFsPM+atNQxj8GYZ82RMN7dY6M7kZEx0ie00m0VG218febB9VsQsCWF?=
 =?us-ascii?Q?1gRIeBU7LXNgOG7WJNiA1j8eKWovycc9zkezndqlR0kZweRYSdpxM998sZ1t?=
 =?us-ascii?Q?TxMXb+KTXZu2UN6Ocv5fb4kSdxgxy+gWAenRNi1Wo6axrrTbZxHLZfEu1CPU?=
 =?us-ascii?Q?o+OLBkQQY/tMSr3zcwhrltowaZ4LoJsIMhazIbt+Yc0XsYPHRqTHW5ySAyKF?=
 =?us-ascii?Q?FYllzW2N7p9kLtPfZGEjn3waOEbcilpXB56AXCyAO10im4Km6Hd3LIRttWuU?=
 =?us-ascii?Q?OeBAWR2AgjTphS/1+ofgcl97a0yNrwWAzS0ZYo6kKbSLdDbLmkdh2H9FoyTd?=
 =?us-ascii?Q?xrnHAzA5rOjr8M6637yOlt8dEKn3XV37HZZlEWGoLH6swO4C/NsagdBCG2V1?=
 =?us-ascii?Q?NotIOGX51JzS2AhS1A7TN3UNg4Pj+pNqKe/gPzwj5jxwCwctIuseXm9jH6Bx?=
 =?us-ascii?Q?4+Nja3bgDZ8TZ487dSr8nmR02ATXUBKZSIdBibqbXVeh/CFz4xvLKDqo/CQX?=
 =?us-ascii?Q?dKq1/adnxTR5Vg/aRpWiCDJ2ehVtjfCihG8Tu+oYFgf+M6BysrZk5nyCSpoi?=
 =?us-ascii?Q?D/w/Nw5N8y6bLz9evOpQuLDBsdmr1Eki1FpSgFx2XX02MCZQ/HBCWE6q72wJ?=
 =?us-ascii?Q?CNSVbusZPkAKUorpV4o04IAZF8anK5R7mUcqDjr7oocboh5jz+qiErlH1fo8?=
 =?us-ascii?Q?6Nv7oFDvOsMBNlR3Bp2aeQ9K5W3CxtTsPgoxLwo04jNYMF69knOxXfpShRgf?=
 =?us-ascii?Q?odn26I5ywBYO6aGuGoK3hjFWM1UNb8zMvRnhtloaq3TPGHurh3tfh9jyeEy7?=
 =?us-ascii?Q?Dh0luyNsQdTykdQIGigDJTuI3xDQH6frQUpi00chPC/9nubVl6/8JPh1OPhi?=
 =?us-ascii?Q?WtFm2S1FGdnBzLm03IxMnT5fvs4lfgE/o5YWxq25HDcn90PUQNfSb/plYQ0z?=
 =?us-ascii?Q?CVwKApRZ+lAQTYmDKCJETATiBASFAfVc7XRv5qcltwuFvHkl4SI4p24A0bnd?=
 =?us-ascii?Q?2B+OlYPXoQ4WQch9yfxLDcmnMQez3LNTfMIJqVN03A5kc1Fz1OqLTEpMvzXy?=
 =?us-ascii?Q?DzovjzzrKkSiKgnCuCTYwssjCx6pJxgsd4pUJXYyxUsW5HOR14sVYWZQqv7e?=
 =?us-ascii?Q?oXgBczUITEXAbolqhP2DlPpIbXbiN7IFDsaT9sMq/3cuglVGVFdK5uWISstI?=
 =?us-ascii?Q?mob+4G2bnasDzliEZuWq0nIF6v0QeZH/Pe/21Vdou9LhgtU8AhZHpN1ZzQ60?=
 =?us-ascii?Q?ENYyM3+bK8hTx4DVo/+E0FRRmoRDbeOckNWYbvorPE8DeJJYEgA2qT1pI36l?=
 =?us-ascii?Q?jvl3U5DY9WdJWpCMkY9jSDXMczBMLOcmQMwK8gJks6QR4WuXsPbMBUYlFIS2?=
 =?us-ascii?Q?PO+lLhinD3QkTQlFrSp0N+EAXM9+YjvEaNeDkXgik6uM5opiZrvMedhv6xIM?=
 =?us-ascii?Q?OAu54sUVD9umfPUn2mZnNFBWIA0RyxI/BU6YDYeHtbFHwXsCQ+/Un8ORQzqo?=
 =?us-ascii?Q?dT88JTdKTmmQLkg1fozhV/1hsVZvLUINpCPE4SxAU+6wEmNhXhLIiKvZKaTV?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	E7PD+r0cCO8QSl16TiEi0rb78jB+AswqJuXxpdhnkIZg8tuu7eU2zLFSDA1Hc9CVQ56LIcrxYzigTOSGno/UaPQrYvSZmesBnDmYmxZgLXQiN/FW2OqyB6UqxnlEeTsnvd5JeQUK/ShuybX2H8rXm9EfrpvpkQN4pRM+CsIWclzt4m2migdnyMWgItYL6u7wddII7GMTBBTfcQzRzH7ViZAImAaTRnAmj0ZkTLT2UPLxLJ+cRUSHb8uX0eHvvvEr+4YmtrVj12h+b/V4fwIUGhr2ggSFiNLcbuGzenMlTq1LB79F309apdxx6QJhBZgIvsHX8YRy13LgPuK0DU3446cXZnzJmZmSzWuWCcP+CP6JCB4gq3nPEYOlbdSXn2C0kcUf1qEFQneghXI4Sr+HW6lBAaRZo/PQ2mS5tdhohYDLL3bXN0j00ymoaqs6Qg6vMzO439F8IYYI7SrTWm2WzHlgVhtcmiuIb4+I/R6SWxpasEOKK5KfOKg7/UIXGMd31mGG8IcjL24aJ69f7Xk5dcRMVGQco+EdYs+W6dmZXvRV7Tr3avUFzk4BjaNBSYxr88yr8DOzAhSdbpXLzz6MYEay/KZaoWXqOCB0ZrdUtwQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19aa17d8-f771-4d89-2d85-08dd772647b1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 05:20:45.3525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLi8xMI2+ulwarB3YPAqrmVufx2RTaOYPbXHzKLVkYFtChKEoLwwE9cplsUo+ofvAW6n3mWNVs4rPTFOi+9fHZccJ+PdpMdvn7u+4eBvFxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC322FD87E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504090019
X-Proofpoint-ORIG-GUID: YI2rd1KppP3aEJybxje42P0eCcGtdPPT
X-Proofpoint-GUID: YI2rd1KppP3aEJybxje42P0eCcGtdPPT

On Tue, Apr 08, 2025 at 01:00:41PM -0400, Liam R. Howlett wrote:
> * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250408 12:11]:
> > The madvise code straddles both VMA and page table manipulation. As a
> > result, separate it out into its own section and add maintainers/reviewers
> > as appropriate.
> >
> > We additionally include the mman-common.h file as this contains the shared
> > madvise flags and it is important we maintain this alongside madvise.c.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>

Thanks!

>
> > ---
> >  MAINTAINERS | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index de97cd54ff24..325424a53acf 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15552,6 +15552,19 @@ F:	mm/vma.h
> >  F:	mm/vma_internal.h
> >  F:	tools/testing/vma/
> >
> > +MEMORY MAPPING - MEMORY ADVICE
>
> Advice or advise?

I mean we give advice on memory right? ;)

I think Andrew's suggestion of madvise (memory advice) should cover
everything off. I adjust felt icky at the grammar of saying madvise here
but that idea fixes that.

>
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +M:	Liam R. Howlett <Liam.Howlett@oracle.com>
> > +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > +M:	David Hildenbrand <david@redhat.com>
> > +R:	Vlastimil Babka <vbabka@suse.cz>
> > +R:	Jann Horn <jannh@google.com>
> > +S:	Maintained
> > +W:	http://www.linux-mm.org
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > +F:	include/uapi/asm-generic/mman-common.h
> > +F:	mm/madvise.c
> > +
> >  MEMORY TECHNOLOGY DEVICES (MTD)
> >  M:	Miquel Raynal <miquel.raynal@bootlin.com>
> >  M:	Richard Weinberger <richard@nod.at>
> > --
> > 2.49.0
> >
