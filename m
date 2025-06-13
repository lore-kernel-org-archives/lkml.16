Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AD51A3155
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825756; cv=fail; b=SX6joHONKc9ppyi42kJcMeFZP2R33K8Oog68n6IkWkXGQCpQZybYeFKQTqFGN1+KKeQRpninfyxOkyRIrkgpklujC43RdFglqpvLPnMW3EMSmGPscJYJpax+WLA1q8now7bSLuNLdCDqt2Wx0NrbunYwHs2UNb2y0cKlDjfNT50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825756; c=relaxed/simple;
	bh=Q7zqhtHN9jtfy38WQdf/LOUTLeghiq/c3ncr88yI19U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Pg23CsewO7M4VgCUxoveuwO75o1mn/+X6XPtGFVYd9kYZFN1i6i7FfYbZSh/o54A/0/htXwEbrTjIV7upe+UrHiMIlsxqSUzPcOlsohpXF/39yJH8VT5ovumSluuRS59hWGKB1QD07w68+t/2wVhOm2f0LrIDPq+ufe/sGq5kGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jEhUFQDB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Cus+UPdH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jEhUFQDB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Cus+UPdH"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DCtctC007761;
	Fri, 13 Jun 2025 14:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=FdfIRg3mL8yoPlHw9G
	iYiPP7BcKscqNf2b2vpFzTNBQ=; b=jEhUFQDBmm7X58HJ3M2MZGaDD22m/SF2EA
	w4k02Gm8gI9F22OVXNNWcO25tuiMenQiXlnmIgGKdkB4JLTztLssVDgBBNihYSFd
	gqJjLytRuQ11qOSlX9q41S3CrqYoAMwWzsn+euCct2lgZqF8nx/kmFrXCSwIma29
	ZdxWHpjoHPGLbdIg+CumrFbCfcLJncO+vxtgOFd2FMq1N2Gc8w4U/5LidEsJZKu+
	AQbFsifOzHNHm9xpvJIKPGBCQ5YWng0HLZFfIj3pMruuraQqredZEMkngy5OgFDO
	bX+AaYFS6+hJqaGAXLy0IqefTS0jDDHpapBx3YAxsOqaqqeqdS6Q==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dyx3t0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 14:42:13 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55DEbP4g040640;
	Fri, 13 Jun 2025 14:42:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bve00j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 14:42:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDv2hZU03+i9w+nIksm2rvu3oS17a2wE7Mwk9h2AG8iuxz+2Fdq0uwQciDo0sCLdrI1Ojwxa3MWEgMFUXBqPlIVy+Unyr5H7tSF7X0o2cpJaUj6OJrQk5+E19+1xoLbCaxCcSuuzaQcFbrkVBAdU6VpnJ9QJjO1NUOLSMrVRKKOweGyz/zXXrqFHei+5F5vJnkzvSGhpzhsHCCPgbR8ymFs7pxFkQuMd8CzLByK9g399IQZl7ExppEidDP83EoiC6ey/GgSGgufJl/IzrQGzxqBI6xs1yvR7aEw4rVIbKNILAkQI01ullgjSC5xGgxRl6ctp/+P4y12nwiE6xpZGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdfIRg3mL8yoPlHw9GiYiPP7BcKscqNf2b2vpFzTNBQ=;
 b=f1idV3AKz5zkretyISVaS1vzu5GzeNWbGXOKrzUzs6ojKmCgAaewPn03y4GpExrmg+QsfAPAxVvD3oDokg7E8JFL9LzzAjotDfzSUHJzGpM1sHdF7y0O4f4gWMrDPhOq7Yy1Zx3uBNEAlpqnvD0xgmXhrc3VmH7XLDAtWUIbxtWtVX/YHYintCwkLmJc3vmWD+yDRHSr1L+oUR7NEX0ZFfGOazZDm2Yi5A15g33hW+2DcBaZJZv17kt1gBfWrbnSRABFGvTRscByWyT4IgwWoFxf2oMHCOmbnOZ/vXevgFIKYn5l5kyPSACYiNHxuDzqfMaRVnADSZO1YSIV4Mnjgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdfIRg3mL8yoPlHw9GiYiPP7BcKscqNf2b2vpFzTNBQ=;
 b=Cus+UPdHZSWKGITEtbIk9N5P2u6GPYxSOjQITDHsz9bhRIXIGp2cgD/JAV6fitg/yN60iCFBNBRlJMaAs5po6LwSM+KG7Yoi5zfLq1dwLhskarBKZnJRqusAaydA7QT11Lxg+gu5mGK8lXFi5pA7MoMDPhjyK5pxurwaDCiPacE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BN0PR10MB5191.namprd10.prod.outlook.com (2603:10b6:408:116::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 13 Jun
 2025 14:42:09 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 14:42:09 +0000
Date: Fri, 13 Jun 2025 15:42:06 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        hughd@google.com, david@redhat.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        ziy@nvidia.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
Message-ID: <bb496158-5915-40a2-ab7c-0039a28600af@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <cb6d3f39-e0a2-4618-b36d-fff8724bf619@gmail.com>
 <6d0e65f8-b12d-4ce1-a996-ebb053b9b0c5@lucifer.local>
 <657181dc-09b3-4f1e-b9aa-ed1d77826e8f@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <657181dc-09b3-4f1e-b9aa-ed1d77826e8f@gmail.com>
X-ClientProxiedBy: LO4P123CA0657.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BN0PR10MB5191:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f66800-3a26-430a-5475-08ddaa887a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8YDs91F96IMQsEjDZoLoiVHFzC95tzzYwf9ItSs3qkK82lkqaNTOEYpmSpxO?=
 =?us-ascii?Q?TxfiqdbqEpnrFYFnWH+M3pumxYXYNN7AdWjfhJU9Dy/CACiT6UfgI5RqbZqd?=
 =?us-ascii?Q?RoMD8wYNxR2tdVfJ3A6alw3hVX7zXaD5JvlTB4mnMv0VSS1EG94MMTJNH9dN?=
 =?us-ascii?Q?wj7JjT+G6CDLLBtVOgNTG9RREVLt9yn1iqwk/hn47NgDLlj4RjZQQuwzwDrE?=
 =?us-ascii?Q?4w2BGeUX4zh3qPlUMXiYsvBreBkCKDk1QxIb/QsA1zYz/wKOQXZa9ayGv+se?=
 =?us-ascii?Q?8l7wdcbAU3mH7Ge+OxCSobdwzDEmDTCV3kTYlIEwpWy2VwtnlHUgKVJhZl3p?=
 =?us-ascii?Q?o2mA/O2GmflO/+KJ0MaaJYvgoOErDvDxb/c1Tu8FVl4L0a2XBpUSabCJyezH?=
 =?us-ascii?Q?aiYxCdlam30pUnqUB5KVjgnqob/q/uAPlC+CuHM+8YW658tfLg2UuCw0CQ+N?=
 =?us-ascii?Q?XxpivZbfmOLTLAzHpn0tb/K0aERTWuTFSWki+KL/RtTY7ocyz5Uml7BIYDMN?=
 =?us-ascii?Q?vUadEUx1+8OtnTlKiuCodNkgC822bdXFilhVHGY+8YrIY6YmUKN1LZoFuBGq?=
 =?us-ascii?Q?jGqSxaYnUdCZRaXcHgLrn90NTqi0bF/dTsagh9fEBY4DYNkDD0CVNiM/+Dgk?=
 =?us-ascii?Q?LTY13yGsMDODwl/dgowcEIki0OfpB98T4Cwm0sZNRJW3v7Vfbe7g5qcufX9L?=
 =?us-ascii?Q?x/lFEaeDfw5b0A6DM5MVx6FaoTmblwGui2IqWHvIBfaKdBysP8WGKi8IRABz?=
 =?us-ascii?Q?WSCzOjxfjmOlhuqiG2bjCdMQay73Wvy/6iCSdeTnz2qVi8rHtmwZbVvmZxmq?=
 =?us-ascii?Q?09sfhCHj0RFMlH2/pmpGdJfLYcWyGxDftyuyZ6jQHuKhhwmlDwF0bPiMU1w2?=
 =?us-ascii?Q?f/nb34FVESmRqopeWcFx38fIOxNQLChmfiAkXmZ1mRVKs9WD0rXpfAP1b6eT?=
 =?us-ascii?Q?VJzYA6WyUUWcDC8w6/F8TVl9npWemH/aNTvkB5+RjoimEhAeIV77aeZeB1JJ?=
 =?us-ascii?Q?WQVbtniKfuq3qm2QgO42uhyNNWAX+LiooKRZIKm8nnWci4NnctZakZC4Bo2D?=
 =?us-ascii?Q?fiYMMJlvySwjUYdewDFto6LRaBmw3rdcbK6UpnyFTKcNFoRcEI5XxuywTiRI?=
 =?us-ascii?Q?euj1f/eUZsSrN/ZPWB4/lBHz94PEOhYBQQ85J5RLJW6rjsGTVHWm+ipri3Qe?=
 =?us-ascii?Q?Lv6P+8i8XVDYDsn5QswGTPJt9OMNCgiwGNgHfCBzEzCachTj69/wg2x82aRa?=
 =?us-ascii?Q?kOGLy6YO92sBJ9FTZrIApkOYYUectDNT1zjlDlH1VLvqrJM/ucDelOenc9/G?=
 =?us-ascii?Q?SovGqvuuMQLn592aSBtlTDOl5uz9QZLFyTerGFYplvxDX0IA1QV9Q3v2lHMZ?=
 =?us-ascii?Q?mLRCZRY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xPeeILPR92X1s0iC3gryAAGG0nq1L/xA7FBu0AIBeb+qsZ9rZQJ8h7smwBF+?=
 =?us-ascii?Q?mNQHRsS4h8gEbGRc6VSECztIuTnaaEqVW01eUnGiwLO9rzBRujPjWihZTrJ3?=
 =?us-ascii?Q?qvw0i8/H/aLWejxy9w1sAF/BMzjt5adAMebb7N2KEvC351El0f5u26IWi4bF?=
 =?us-ascii?Q?CNoRAzUWwFuu6nAkAPa709u1LSYp2VCq/0AYvoyFv7pFiGhvCOZWTIUyqyXh?=
 =?us-ascii?Q?Qk1+nkjNn3gvdxZ8zuUOqi782HL2rF4BDY+pCHXaeUHXpIRL94bjvuK5pFaR?=
 =?us-ascii?Q?ieJJ8IZJ+Sk5eDWgMamB+TbQ4SeTBj8auYMyVf6WdyrjvVmQNUhw6IrkxyHN?=
 =?us-ascii?Q?goh5GeUVBJJDs7yhlVgzkps1azQal86Hm5l+25wFj9bR1r9Fuei2l/4sSJLv?=
 =?us-ascii?Q?PCKBOrK7TVHCqHZWATZEn3brydVGUsl8TxSJZcMg1yrpUJoxr5SamfjOdZyz?=
 =?us-ascii?Q?6MCmC4YhwvOIKih0SPjpw9xgtN6JNpz1lGvjmKH9fDMmLZ1MJ5eegb889LQ4?=
 =?us-ascii?Q?xzvNBv4q+ugfvW3Qtb/MQ5EJzi+UZ7haHdnHh4Sq2qhDec9p0PA3S3LV9a86?=
 =?us-ascii?Q?z3E9VP2dhpygjmyDHXX3TfYyHjhAmZA6pP84TAD69dvfvRn1OV/egkDQ2kWt?=
 =?us-ascii?Q?L6yDroXLWXLVswbUDhu3msC+F7ddjLWSAvhBCqn4w5JaCtwFhX3KAzSZiflE?=
 =?us-ascii?Q?aF5qQalrrPG9ODFfiKNH1Bsw/Gajb6to2KnzGYoudCTEA2/kL8p8VGU5c0j0?=
 =?us-ascii?Q?Pyc9cbp2OZVETZ9jpgNJPE+V7KM0pvPdNa3kvWfok7iSgz3EEorRHgpeO0ae?=
 =?us-ascii?Q?2x2ev3G1vpJ99DDy+Qx/sLe9D00zvhxMjB8uXKjGueUTtkUxAsBZnT5hFzA3?=
 =?us-ascii?Q?NFNnKPl3Pxw7HkKquD6j5wgAIT7HsnBE277DUs03MaYMNS78sqWCYUaGgZcE?=
 =?us-ascii?Q?yZwk6IixZUgkXXY9sjxu7KjMgbZ2gisdqTi28CgmpBoIcd4KUDAFf3rUeHs0?=
 =?us-ascii?Q?es66GQYTLYhJcWYJvCGkJEUbGp4H9Dm6BeUL1w/K++hIrxTPc+XSTcp3InJ4?=
 =?us-ascii?Q?mO9FvhNti8QKiL2Oslo1OncZos6XIyWoM9o1BNTuVPEWtdbw8l8poFq/idxC?=
 =?us-ascii?Q?6ao2lbT0wfJ+6NmQZ/ubGSbdtHsCSCtm1lpw6IHPByhAXgPpzHZm2xiSnjiU?=
 =?us-ascii?Q?/UMVj9SoidJJo2ZTAlw4m644AXqH8mHsA9x9/vPlLHrQzNOvWxAXknoLH706?=
 =?us-ascii?Q?B6LXWHulHYA7bNT3mMWDUSd5IFS7CEDO8ydIJKeUh7f1jzosoVdL+8c48zwZ?=
 =?us-ascii?Q?WezU9JAc7hvvBV/46q9tFie3yTKdQb0zMBkw/MnzKuhhXsSjgPF8HJZ0aAIo?=
 =?us-ascii?Q?stCTOAHxOQqoaMNpT0tp+Nel5lWr9snD0vtRHPh0DDadcV8lXicHv+Mtb9af?=
 =?us-ascii?Q?w+F9Tr+QCZmcZhRaYiYFnY+NPJ4pDZK/sMHcHNQK5Ap/0qjoUW1LUAQaatW8?=
 =?us-ascii?Q?yQ35gBPdWRN70gD+CH6H5SAH6wPKj5bunM7NTIWcGTPJ+a7WAgnrHjWoHzII?=
 =?us-ascii?Q?y7PwZrarYPyo/yTp7pcURJ+LY4U+Cr965W/7GCCbmOnXPX4MXCyvupvLtdnx?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5hYnx3e/IbOO5SVzNz4gkKhnaZepK0a2nmVj5jd7ekXN5B6UBZpwYeXbw0r6+RNacDO2/kEdHQ9+uCLR/JU8rq/tBt/mLqOatuZxrFKOo5HJVbUcYCMcf3brtH0SzxBFpewh43WC58dYULF2+aj4LjjrzPfKqyacV0i9UmXk54fmhHlmuJDmnOOnZvkLxn5PgNgo6O9CPV8MxM94LBzx9v5AW/gtBV5hJI+o68xmCu5vL0oqoCRgBkm17kiMMRyWrIbVVP4gLm/6lBRHrUixp8Oi4cd70/I/XzE4+sh+ibNkRoLfhuGHS06bBgBd/Pk+yKyJtESVumVDjKJYq8vEgtPMeT9QN+6d6p5lAXT4MX2S07w1QmR5VTladQJgepvXIi4Dtd4xzkAPyLUXp2dE9EQceNUZu8ikDRafSIKN967f7U4mHFPYrX6I6cwh+GSBCL28VuRVawq2MJlJ/GISSp6UvOZ4sgaey2U9x9o23fCVwozu/nqsoCYcmGoDiYQNfA3bg3BZroMhwSvrPvQyI945RxSre61Su/gKgfEAnPo4rIZiO6WyCueni+cUf7i8H0K1nZG2V0VQm8axkXFlZcOaM60eXSDVq5yd3pHMgc4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f66800-3a26-430a-5475-08ddaa887a18
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:42:09.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pB4r9xYm7Ka+Fz6U7Vh9irhCgZBEBm6DA+sLUf6Jpp7+lsB9avFa5eihmEYue84kd7MJr1H7BwrBKyozIDeD1/8JbBqWUWxAgj/3QcLaMDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5191
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506130106
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=684c38c5 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=FGfU_D0__21vgaEBRDkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: UvVj21KiK4mZrLe4zxUZHPEUFfv3qk6b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwNiBTYWx0ZWRfX+GMmxdMZZa24 bEzKRkzOsZRnp2+dB4JP2mtJadl2T3kSL1TKWprsL8CT4vPA6I3DdQxirXlemJJ35wEh+/tA2y2 4Y3V/WsTjN2pv5uDhCLKV5cz+1leevNfzNFPwVlJ220ace92yjVWoxx8EsLq1dbAOW7srP4JVS1
 LyTDE+U6iMaeBfWV3/uHosLUJ1Ly9Fhda+t9DQ9gpfVhQBP7d0OK6L0kLZa70OwYACkmsjC8UOW rsRqX5SIGWacEDBCJjbDhmQ1rYCMEAm/Xrhaj2HQ3VAjIifTtgS9Ke07QzNDb/UCqzJ9peBFqMM QCh0/HuHlzMuwwO8hUBQIKGAQ5ZQdBz8R9NJx05t1w1G4M3tzKBReAmWYzWddKG8Me6V1tC4KSh
 zyDo0U0FecolX3NblCHQEalDK/ewdPV219MBqTC9SSEAHQa3h5gAbgnVFOk665+KxsDT/lPw
X-Proofpoint-GUID: UvVj21KiK4mZrLe4zxUZHPEUFfv3qk6b

On Fri, Jun 13, 2025 at 03:39:33PM +0100, Usama Arif wrote:
>
>
> On 13/06/2025 15:29, Lorenzo Stoakes wrote:
> > On Fri, Jun 13, 2025 at 03:23:19PM +0100, Usama Arif wrote:
> >>
> >>
> >> On 05/06/2025 09:00, Baolin Wang wrote:
> >>> As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
> >>> the system-wide anon/shmem THP sysfs settings, which means that even though
> >>> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
> >>> attempt to collapse into a anon/shmem THP. This violates the rule we have
> >>> agreed upon: never means never. This patch set will address this issue.
> >>
> >> Hi Baolin,
> >>
> >> I know never means never, but I also thought that the per-size toggles had
> >> priority over the system ones. This was discussed in [1] as well.
> >>
> >> My understanding with these patches is that if we have:
> >>
> >> [root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/enabled
> >> always madvise [never]
> >> [root@vm4 vmuser]# cat /sys/kernel/mm/transparent_hugepage/hugepages-2048kB/enabled
> >> always inherit [madvise] never
> >>
> >> Than without these patches we get a hugepage when we do MADV_HUGEPAGE, but with
> >> these we won't get a hugepage anymore eventhough hugepages-2048kB/enabled is set
> >> to madvise?
> >
> > This isn't correct, madvise at a specific pagesize will still be permitted for
> > MADV_COLLAPSE.
> >
> > In current contender for this patch:
> >
> > /* Strictly mask requested anonymous orders according to sysfs settings. */
> > static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
> >                 unsigned long tva_flags, unsigned long orders)
> > {
> >         const unsigned long always = READ_ONCE(huge_anon_orders_always);
> >         const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
> >         const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
> >         const unsigned long never = ~(always | madvise | inherit);
> >
> > Note that madvise is considered here.
> >
>
> Ah ok, Thanks for clearing that! I was reviewing the original patch in [1] but I
> see this version in the replies.
>
> I wish this function was simpler :) or maybe its me that takes so much time
> to figure out if the order will be set or not by the end of the function.

Couldn't agree more... this whole thing needs major work, it's massively confusing

>
> [1] https://lore.kernel.org/all/8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com/
>
> Thanks!
> Usama
>
