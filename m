Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13DD20D519
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750172714; cv=fail; b=Y8kpF/KozpAkg7mK/ZzwyxAzeexZAciOyTnZLteKLtvjWajxlYI2gsWbN5b6CNxPDHwxZbE6WZQ8GlfvBOjsjzK8j5urTCcWN1pi0Vm+TcHq+qf+5kKb2coMleZbLd2AYfsWGPIoDEcdjURS7VOYnKFGHoJVMrGr74Y5nJfsa6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750172714; c=relaxed/simple;
	bh=eWSl82Rdz3SEduo444+SLV8pmDkGo1tGTFVnz3Tfujw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kvUld2nCR1rfzn9gnoUVVshqOoN4CMrs/g643BplERgSBb/Ve7WiKhAQrQNrLZBhabQmj595JRnsaA0GZMPEFT7Wx6L5Qryc0evU6otWO3EoFykekYvK6vqBGv/tJ+ITwdup1icrDdcBl2qd+Uy4LU6rAQlF0xXGoMl7nLIZZLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N4NP2Dq+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q8jX9hVQ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N4NP2Dq+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q8jX9hVQ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEX1rv010319;
	Tue, 17 Jun 2025 15:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=plRPIclAduRZWs1O9e
	O6DkaLNQ2LOnGaZMFbh/bx2PU=; b=N4NP2Dq+KcX9QmcT0QTAWxykuKTRwTKNb8
	LgRZ08XkaqoU/Hd9Kvjo1PoAA1pUz1xKrF3NIkuBRnpwlszgugwOi0Sj5j3TqTfR
	dMRU25Plq26+VrP13JD0F25GgK6oCYBPggvmF3A9Mp8H28pI41ZeGFyK+yQSTPTd
	W1SCio/b/v63+kKoSmVk0JCSQXeZO8rS/jLho1u2d/9wtITOxcLAu7rzoLFuxJr5
	PoSCyxyvORhxEPt2j9UQdxVIY7yqCuFGXdbIKUICw700qRjfJMHeaOzB+yMrv4cO
	HKzA2T6X01X8ttGWfmvMqo6qV7lkRtYzdn3fq2+mLil+CTSTSNzg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914enfr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 15:04:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEdFdW001536;
	Tue, 17 Jun 2025 15:04:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yh9by16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 15:04:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6kuBM2wdmjzD2WRogBv2a7YKn7Cz4jiKq90O+vdBWuZNpyiG8MQPgMaoiGOHUTmyqGxwVecpZ01Py/LiGr6fXkimGr5hOECP0X+1YVbXLDckfV0LPQu/oSnnAJ6izw0CP+UsDzuyXii6msbDiDtFOKZ4p6lf0rkfPRiLR5FYNP/BMNxH4AcgxtRzlmDun1yqk0t2z/bE8lz8Xhj9ZMyQAwpxHwYbcQdEJYIUslmq1Pn/UPRerz5ooxMu73FnFgz3vc20GeWvDnv6vjrCQSbjanQHUXHK0UGxkmy6SKhVeP9NJteRww0xOa54d8ULW+TU0lzsuORNkYhOyz1ErUSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plRPIclAduRZWs1O9eO6DkaLNQ2LOnGaZMFbh/bx2PU=;
 b=gnHNdMijliZtrXSB9kuwLdseGvZWUUdYjp030nvkmcYMzAEWJtcQPPWuGZhKWVdQfJv3NzCnIE2psAHwNd7rZKcWTXj2AR2IsseEXXHfGtaGlGayBNP7fDKd85BaC+rrhg/X3X35zU96mCbBKB+kygVmrrjz+x16XnmZgqQkbfNTcbQSdv4LSA4m4x8+vReB2nYgfOn78HT2AvPpMnxWt1GDiGOqB/0P3PJR2pEiGfBbwB3KFzpgWfZbHbKQv4JVt/BR25bAsO6Vn8BmPLZS2kjzUngcvzdFPQebbjEHlaGpX6LZgucKdoGEff/C2E0XcRv3XMzOpqsf1EzFQh6YcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plRPIclAduRZWs1O9eO6DkaLNQ2LOnGaZMFbh/bx2PU=;
 b=q8jX9hVQjrpxrGQ0PdWff2XzGSXp85XWoGz3v6fdhCXtdVZ4qfxCDqwmZmP7VzGfn1KpGQVWHaowRa/4/mzxUEwXW5z2ytcFLsik373lQNwsi5LSjBjCBkKExM8BT41w1CusEnR2aYQHThayoBElNkoUA8MKBh0a0B9Pg2COdHE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB5562.namprd10.prod.outlook.com (2603:10b6:510:f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 15:04:37 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 15:04:36 +0000
Date: Tue, 17 Jun 2025 16:04:34 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add further core files to mm core
 section
Message-ID: <bb03abf2-e3d9-4dd3-85b1-707bf9aa5a25@lucifer.local>
References: <20250616203844.566056-1-lorenzo.stoakes@oracle.com>
 <727b5e89-89d7-4abf-a93c-8d6f2cb2c438@redhat.com>
 <aFDm0YrbSAvXc5Wp@kernel.org>
 <4b0036ae-5b92-49b5-8396-412c7026b105@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b0036ae-5b92-49b5-8396-412c7026b105@redhat.com>
X-ClientProxiedBy: LNXP123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB5562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9585b428-0dfe-4022-f8a3-08ddadb046b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AccKWEqb06/ADAV2Oqs9Z4x9f9dsPYQBUcMZRnC43e5lgB1cz45YQjoc4YE+?=
 =?us-ascii?Q?gHBDJJ5cFR1J/7saO/paD4O60oRsHxHX69ewPADgPvP7nIsFor5ctN1tmVOI?=
 =?us-ascii?Q?184BIU6wVPoxogQNj+2nPoqeDgWbmRkHMwFVXy/mwlVQMW6l1NDowNufZ8ZD?=
 =?us-ascii?Q?SIjbTV32VwVYomrDIyI+omFkshRhSLyJKcfiQXwHznxr3XSIx2Z0RwJ9nzmx?=
 =?us-ascii?Q?qRjHOqnvabkCcuzcczXrSCOhw0+QjOBpPZ1wxApzcAvl1y82b4UGvbfkpdf7?=
 =?us-ascii?Q?yAACah8Te2aJPi/Gu3ItQ9ZOuRIS7vHKSfysY+oH9TkW1FHow+fuwVGNQdv8?=
 =?us-ascii?Q?h7VsJSCXTnk9xWb0aLpYNcZLG9H/Nzbc7cDsFmD85cFFc2NthV62wMxoGoa+?=
 =?us-ascii?Q?cCbGrGPpvxtRH28ejdqL5Drdfa2aRug+dF5ef4ejeMmZPONXI0MHYFWYJibE?=
 =?us-ascii?Q?bnmCRDKBQy7hswbYpPyzoeiZ3K2q5JohvMEWzkrc0MUt4mlShtRvO5nCwBOL?=
 =?us-ascii?Q?nsgHdf8t86k8rj0g6QC7SJjkcjCBVYHMqTQv1NbDSDgiH4Cnt4zNh9CrGIxj?=
 =?us-ascii?Q?aKAUw9hg/KSiWGE377tEkClm66+WU2fdWmRTa9e52o8/GIqBR2vGppCc0OdM?=
 =?us-ascii?Q?CdQzXwZe/zuJN5p/rEzdVhYvh2IdHicTKucwFKNHF8G+ruRp8dyXAOvxPfVO?=
 =?us-ascii?Q?pamciZskYEL7rtSJx4bdYuMeceiYmvVc9T7IHh0D4m90pHNcha00lrpPC3/V?=
 =?us-ascii?Q?4P8l7F+1Dgttd8lJb2/4bem3+pklC/UGW1skMzIqihCe2HmJxbaZi++oULN1?=
 =?us-ascii?Q?wNkVDub7nrIETbtQREiccX/NK6or+woT/lKtLmOXzEtGBkT4pDEtj7itk6PP?=
 =?us-ascii?Q?oJrgW2mLRPd6AjaerSciIh6esdn6EbSpN2UrB9QUUtDM86oByuBiF3r+nS4R?=
 =?us-ascii?Q?qKKk1MoMyE2zjVBu6P5vOfKbho7c5xtTs4JB80BxfvJUIIR6hMfm7Z4G47XL?=
 =?us-ascii?Q?JBVPf/p5HSeofN3zP0MExoqFoAGNpnWSY53OmbdgIK9H/0xXbJA0GcsmveoE?=
 =?us-ascii?Q?dgYAFsSYTNTUPMLAlN26b6h7DlWgei2bTL/CEe14MasoYQt4XmmGm7ElPqaX?=
 =?us-ascii?Q?njUeS3IAPnj7Bg5ceUa4CIfS5K9WUf47EJay7bIzOLpHtc/fPkIt/90ko9Z7?=
 =?us-ascii?Q?hJhGdRt6FCEOfpE7smF20fFw6mX/chOq2zSJR3faf8ZdW2WkHS97mQm3Rj8W?=
 =?us-ascii?Q?ivJyyFQt4HsFODpnGnMVNcF6smNDvJOSx7Dyu9M3YpY9DbAusvewgi+XD8Dt?=
 =?us-ascii?Q?oGHsHqzMyCo5hlfZ6Psf7g17D0U744yD54Cs2N3MDpmPEORsFWyDoA15nVzo?=
 =?us-ascii?Q?euEySaQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DQrfustQRwnBa1dv7V7j7FQJWilU4iK38jOpvhKvQoea0aXhpJWlXtM0lA7N?=
 =?us-ascii?Q?T6H/smnmJ7sTdyGjThVXC3POzsgK6VbQtaUAce+DJzH0rVdxbnvqI1Omahyd?=
 =?us-ascii?Q?FS1YFqIzUIV11DVLBwaUwGGSochjTxytvNqc9H9YB/ZhoWXMhqtz3B75SuX3?=
 =?us-ascii?Q?bFjninnin6bS/+E0id6/OAhE7fQH2B1ouEDHjfmAr0/bksFTVOrAcdMTS85m?=
 =?us-ascii?Q?UN0ovYdOJWRFniKCzw1NOdGGjNTmWFw0Cqx420v3YpGWQD2yGtn3bffn+sDC?=
 =?us-ascii?Q?n7sl89dZoiN5pfOL7kcX5NMHuQez2dma7T08o16RbN92z31G7UNxoaPwtRL8?=
 =?us-ascii?Q?HCY5fBpg0hCUXZ6FEx3/kVmxMGQWIObrvzNm+jFgKpSUBX8da/Aj/ov5SJiM?=
 =?us-ascii?Q?sDIavPuIO8MrzCodj1nSDKZdZtW7dVtfpbBOfFZdvPHQujRbR2wvVn07cnb0?=
 =?us-ascii?Q?c3Uxwry6rOITA/90I9h6upA9M3uCThKr0VmGDi1AsQ8qGT8++GSNk2FUUArU?=
 =?us-ascii?Q?S24pz6CCdybu9eUIUeQ3rtqIwd3VSwP5fRneVz5zVAqCqYOOLRbQyR8Nr0yz?=
 =?us-ascii?Q?9GFeNZS+WfXGkt2Z0zwMgSTm0ZMgexta16cMmJLSTDhz6DWBjQMMcnhiWcou?=
 =?us-ascii?Q?6IOL2oDB+8IEamjKr5NHs8xCIheOngtQrBsFakiI6J53CrUv0fXo9LyR5ThQ?=
 =?us-ascii?Q?8Y9vFMbRXQEH8oru0tc3GL8YbONeArSTajLPahxY7fqE7FFP/7crRZEHFj7g?=
 =?us-ascii?Q?XaO459QhnzMlY36Z2xhjlHzFMEtGaf5KNPvCE+2UZcfVT2BEE8Z3sav5ta9C?=
 =?us-ascii?Q?J53pSQRjQDjLKX0DYoawV2UJfXjmUuFKBpln0lWBXm3y8LSlNYXkSPxUTtm/?=
 =?us-ascii?Q?i+PzRrZwU+M7O3PH9NHk/IujZIqTvfuKWy+WdnXhGebtAkMx+Gl09vMPac4v?=
 =?us-ascii?Q?40isyBGKxEv3H+xjIFeqaTNNJL3Anp7BikDfLjpYG2TTS5bBeFRbOvIzV1dS?=
 =?us-ascii?Q?VHzNztnadd98TONo3c9erbclW/yV3eoa4RjvyNWY4LhpiJJp2puYha7mkclL?=
 =?us-ascii?Q?UqjPOfbuu4ZnxY+eEYroUIgA2DSFT69dbHJ2TCf6a/J3RlqxcTlP/Jek29I0?=
 =?us-ascii?Q?kFWfu/nH6zj27/bshrjvQi1DJZwaz4qswljgbv2/XTi4FTlRH4PcjhO3Ukrd?=
 =?us-ascii?Q?zryed2rhWrDLIzWRK3k5Ucb9NeOA2CWemHDsgdiAM78PHOxQwHchlH+kfJl8?=
 =?us-ascii?Q?nbBzngnDpoy4LxO4LWLd6NmdWLso6c+/6a6iHm3AZy2lrSHPcZJ+7pRnHd2o?=
 =?us-ascii?Q?pDzzesH9uC+ntkKX+oTeOj/pmcwrk6ZqsxKhJpV3oVGP/d2XopXbRqWhoE+D?=
 =?us-ascii?Q?vImRnI9p0WJtYQQCJbIP2z5vvMPO/ILjFrwHq7IIePXBMudEw8Qy7mikD6uX?=
 =?us-ascii?Q?lC6hYIric++Qg7TgMU1qaCdgS7OZbi4bhTw1Vlp5EjWGuOy2qUwDxg1Lh8iu?=
 =?us-ascii?Q?Zk3e7DTw8kTwX+CZMs+nZbB6XkngvzTADIdvEfCeMvxLA7ZMZWK0o6gIaqOC?=
 =?us-ascii?Q?nT3In3JX5srWZDBvjF8PkaFhgIvC8ZP7nmQvijaj3CI1sSOK2etEYHkNuiyX?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EzqtRY+ehYvDRmeCvDbFNqgevUYSF9lyO3jS9b6q6i9WZAoCQI54O9xDkjBx0zKA7PgfVe6Oo+uUGp7gtvK2sfyNBF0uGjtcvFVFwQVls6nd37N3Oz6Q/jJXTR3Xy2HK04W1Bp8CdRVHLJsrpJwEHZzP7lx8tIugSiDXR7RmURw/s7rL/LmhwEp9TcDnXi6dM8cfYo2Qnt5JXFtgaQTuPYsnMKmw4SaGuuI9PYni8+ZGcL1bYRZY3re6d34qRkMDOXuTq/KxyEWCcUADt9KUb9jtsXSA8T80r3jyIT4+PDguKzLJMLnLKA3RWRd1tlhXn+9Uhe7lZDewTDl/FqDkDaYr6jsBaJ+SObSTkU2N3kNELnadzV2btMZfAzrImaG74/rXHceZVk22luuQW/pe+vA+TEZiH4AEpKr4ijnM8S0yHhrPUpc8/dYq8pFxJ7nBDyhOcyvDoQDNg78xP3fDQ9yZDx8VBK+yYbFhijlyqruUMcCwUxvJxrQPMUWGCQCcoRhExjrXHgT8sUhJtWU11SJVC0g5F9TPjUtmgJVmVsdLotX6/5cVpMy2/BeFKHtWVtj4ICJa+temWE/7OJxIzG1R7Rw0G/wLwOIOku1MEFE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9585b428-0dfe-4022-f8a3-08ddadb046b0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 15:04:36.9325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JHJj+mK4x5KTiBhPQ5MuSTCXNnZQJCo8j4aOc442Qen6H24mEpmLolTvLW9AmBHDpcoQ/SI05SfqIQb4NxPTioExdsNn9VnbaynJsiUlRpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5562
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170117
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDExOCBTYWx0ZWRfX2dI9Wq9EufBA O/iAgq0Va6SpfBvYg77tzLwTlyCKlFbNylGaJFwEbFCI6gofAK4RCmSaMhQqeARIWk2a4W2E06D WgX4Z6qzbu+GFRNzrSeOAWMzD4n+6Qnsncl2q8L8NygnZkG2pHibnOc+XUhganmaDUPBEMDkmRX
 U9IfYvQBNarufcmMpeUX9u9PEy2clwdXNBVQSQn4HQ6P9r8XWlCjR/Bunh/LxSGxT4gRMQUqPs9 9nawmBJ1+ghW18KSZMVfhz62MvB5JSRg6+NiMUWILNROxNsaDCkOYN5pcEF+zfUvsxBn1fBx1i1 KuWJW+DYqCM+t2K3FjXgAGome6szGtHc6llrugwi32nNEvkRm2PLKBPs5AvLvPOclPJW0rDwU5i
 MCIuhzM+VmBSeG0GUTee8gVQovlGgbb3hQNkxJZtJOi6ky9SP5AcCTPKbPHznvsTPBDtvUyg
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=68518408 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=E9gVAhlnz57NRJvBYzAA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 cc=ntf awl=host:13206
X-Proofpoint-GUID: 68AKZ7-0pIyQMUDz3n3qiAaBcS8-DPp5
X-Proofpoint-ORIG-GUID: 68AKZ7-0pIyQMUDz3n3qiAaBcS8-DPp5

On Tue, Jun 17, 2025 at 09:59:01AM +0200, David Hildenbrand wrote:
> On 17.06.25 05:53, Mike Rapoport wrote:
> > On Mon, Jun 16, 2025 at 11:10:41PM +0200, David Hildenbrand wrote:
> > > On 16.06.25 22:38, Lorenzo Stoakes wrote:
> > > > There are a number of files which don't quite belong anywhere else, so
> > > > place them in the core section. If we determine in future they belong
> > > > elsewhere we can update incrementally but it is preferable that we assign
> > > > each file to a section as best we can.
> > > >
> > > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > ---
> > > > REVIEWERS - let me know if these seem appropriate, I'm eyeballing
> > > > this. even if they are not quite best placed a 'best effort' is still
> > > > worthwhile so we establish a place to put all mm files, we can always
> > > > incrementally update these later.
> > > >
> > > >    MAINTAINERS | 28 ++++++++++++++++++++++++----
> > > >    1 file changed, 24 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 4523a6409186..a61d56bd7aa4 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -15740,10 +15740,6 @@ F:	include/linux/memory_hotplug.h
> > > >    F:	include/linux/memory-tiers.h
> > > >    F:	include/linux/mempolicy.h
> > > >    F:	include/linux/mempool.h
> > > > -F:	include/linux/memremap.h
> > > > -F:	include/linux/mmzone.h
> > > > -F:	include/linux/mmu_notifier.h
> > > > -F:	include/linux/pagewalk.h
> > > >    F:	include/trace/events/ksm.h
> > > >    F:	mm/
> > > >    F:	tools/mm/
> > >
> > > Probably better to have some section than none ... was just briefly
> > > wondering if "CORE" is the right section for some of that. Some of that
> > > might be better of in a "MM MISC" section, maybe.
> >
> > Maybe rather than add files to MM CORE we should move mm/ there and add the
> > MM MISC section for files we explicitly want to exclude from MM CORE?
>
> Also an option, yes,

These suggestions seem to be roughly the same no? :)

Maybe the MM section itself should just contain mm/ and we move everything else
+ stragglers to misc?

Now who, whose's first name begins with 'D' and surname begins with 'H' should
we put as M there... :P well...

>
> > > > @@ -15764,16 +15760,40 @@ S:	Maintained
> > > >    W:	http://www.linux-mm.org
> > > >    T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > > >    F:	include/linux/memory.h
> > > > +F:	include/linux/memremap.h
> > > >    F:	include/linux/mm.h
> > > >    F:	include/linux/mm_*.h
> > > >    F:	include/linux/mmdebug.h
> > > > +F:	include/linux/mmu_notifier.h
> > > > +F:	include/linux/mmzone.h
> > > >    F:	include/linux/pagewalk.h
> > > >    F:	kernel/fork.c
> > > >    F:	mm/Kconfig
> > > >    F:	mm/debug.c
> > > > +F:	mm/debug_page_ref.c
> > > > +F:	mm/debug_vm_pgtable.c
> > >
> > > Wondering if there should be a MM DEBUG section. But then, no idea who in
> > > their right mind would be willing to maintain that ;)
> >
> > The same people that maintain MM CORE? ;-)
>
> Heh :P

...hmm yes easier to just copy/paste these good idea ;)

>
> > > > +F:	mm/folio-compat.c
> > > > +F:	mm/highmem.c
> > > >    F:	mm/init-mm.c
> > > > +F:	mm/internal.h
> > > > +F:	mm/interval_tree.c
> >
> > Looks like VMA to me.
>
> It's more about anon_vma I guess, so rmap ... maybe.

Ack.

>
> --
> Cheers,
>
> David / dhildenb
>
