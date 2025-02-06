Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104F8188CB1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738873774; cv=fail; b=iGlXexF1AzfPUqIWcEtTETE9H2wqKI/tstLcWVsO2DfkEUeA0Uf8PFj/7HBYbUGRKWROMQH5A2gohxc2qv+MFin3ETcpsHycS/tRFBE6sFirgU2FV3nYIKc81BO7ZPPTE4U2O7+RLeAm+WKykTCauJn3k6x9Qz3Wi0rXpdmZcdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738873774; c=relaxed/simple;
	bh=n/JSlZ4N3Vx/uG3glz8Yhr1VOHkkM7NIgAutdpNT4o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rDk4+ckNgOdqpaI1d6/NI2j0zECQfqCU3mtbXac4JQ/iVEclOMn22gL9EDTODIqolS/zRv8FCrPEKTT6C77gdckAG9enFxE7/sl4cSPkle2A+ft1Ubs6wtUbxxwEoW0hLWvGHUA+nVHsguiul1fumXaCZs1vfqnGjD0LBWTKm3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eJCAwRSo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nP6K8z/2; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eJCAwRSo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nP6K8z/2"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516JfqHY028541;
	Thu, 6 Feb 2025 20:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=Axr8nOTKP9FQfLd/uB
	E1e5510R4oX4PtPJfe30EhmTE=; b=eJCAwRSody2gFMQw8iykN5nNjv8rwltGyX
	rOhMgG/QQd2V6nDAzLoKi6TkIW9cTal4DzCgMmy4fOFY2TGzUwvbEHxHu4OzuFbq
	DZn6bNwtg4OUCYer/LuPydRgk5dMjDLyf/Y4BbQlRhw+KL0GfIlqOKy7wBzCUeAa
	SvUZ6VXgG78NHul/T6Dmok7PH7ek7uiWw4GDwWPSgSupBDLiIiIFznFAdDLBVeWw
	OwFP9/bvuNT7tAX52+KLn7OoinjJi6nnZYSJAs1Xi3+TDfEDVkCSMnn9JgcdMmdI
	Q3Vm1X/B/kCZ8SKUTAIjeHu2z8aKeeF7/qVrct77gF4eoU4REoNg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44n0nb0fv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Feb 2025 20:29:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 516Jv07B027915;
	Thu, 6 Feb 2025 20:29:11 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8dqn6ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Feb 2025 20:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7yMzsNejfnoJ2I5SqexumyK4ih3asBf4w9fCl3zrWOIgoxXILh4YWABsdiVXHCfbQIDdcGvsl38M/ZLVQwhn3TCJJMyTiRkXy8esgvcbkh/WTVGBjzpeuQdOTsc7oWJooZ9gxx9ob+6PWiFF9zoIGKL/c69vJdCdkBgy6zxiC6CkzwRpRzLBtXxT86LMGUnsM2wVkUQXEW2Z3X9edLl/VTkSKJ7JX8xTIsoRUEL1asl8lgd4DCjm5YOcQUgpoDGZ3+0ElvVeQBmto84UnNg6zdilfdJde8+jI9xVgr8RduhVPxWGx1sQKuEGHBnAJswY7YG63J87yKhXj/P59P5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Axr8nOTKP9FQfLd/uBE1e5510R4oX4PtPJfe30EhmTE=;
 b=f1J4Va5hgM6aplz/C7WQVfDn8OMMv9fSU5KFPBXnXX7IZOoBkomqxanFYE1Sl+g+4tFFEoxJSvL5HVEwfs31vAiam7yVXi3cxO9bMFLngyckZJVmWxJIIVrSSfwVnbCMCQaUOmWq7D/yNqB/bZqt3o7nvro+WraJ3MyIyMSxZfQZZIf2aeP8FeDSPToG0uhE1L4FxoYIk4Y5ByuzTm4yp2Io3wn2PrACvSh1NAe+0bgCNyi+EYYX/cjwscqqh72AK+ITXYK2RidTTp9PaoF8OV4HH4CbtF03bpE+fySEiw4e9ngdt+G527fmBy6/6jvyXjsdRF26/83tXyPX2+jhtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Axr8nOTKP9FQfLd/uBE1e5510R4oX4PtPJfe30EhmTE=;
 b=nP6K8z/29HE1YBQG+kmmoT8dxl7IbPkWm7w8VrYZbsfEUe2JgCCIXkTOqtrlFrcUzQYetO0b+kBn5itD5MPllsGJMMwoluRCUV83OD/XYz34/xatGTyaulL2TxYnqaLbPvjY6PNf3fz0iT5+Afcon86q2a0EJhL5MkH6lORA8IY=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CYYPR10MB7674.namprd10.prod.outlook.com (2603:10b6:930:c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 20:29:09 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8422.011; Thu, 6 Feb 2025
 20:29:09 +0000
Date: Thu, 6 Feb 2025 15:29:06 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 2/4] mm/madvise: split out madvise input validity check
Message-ID: <oucdbedlr4hniwxcsel7xfv2d6gy7uqw5rs5syfgchhllz5i36@lumnjpc5nmkt>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	SeongJae Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250206061517.2958-1-sj@kernel.org>
 <20250206061517.2958-3-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206061517.2958-3-sj@kernel.org>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0167.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ac::23) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CYYPR10MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 51679ecd-b353-4eed-7d6b-08dd46ece8e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pk2uHC6ZhEygGrUEVA7Uh3gI+xyR70xhtCSgrmbkPJE1d7d8sv3bteFOILhA?=
 =?us-ascii?Q?hwGXNKaysNbuDcY78QZdYWA4bijYarUkWusI/dIkunaxEBh5CYur7oFvkNA0?=
 =?us-ascii?Q?azeYAw/1DbrGDUH79QSbDws3BSm9cvaNECFYRCnOA2kQZ9oFIxFEW+KwqkXQ?=
 =?us-ascii?Q?XcU2zXx9N4QCVrcea+YZF1bnEFvrXICcRj1a7JrgqGjjSC6oOCXzgiwMF+zO?=
 =?us-ascii?Q?2jYzQXQNTZtLyKd9a9vkZFKS6Csev1QxjfOdRaFGAAc3Ni8/efKIrTDc6o0M?=
 =?us-ascii?Q?Igw/sEg+awo0Cum0Jd5/MUQEr+UziMoIa+nbHuOFKO+4LfWt+PIUtWhsl7u1?=
 =?us-ascii?Q?a2xgz713kvap2zEL/SRIivj6JS18XANEJW6eCqEuqQ5hsoJXzL0vckXGpKVa?=
 =?us-ascii?Q?FbcVlTAyyCJKbmLBNHydMWAmMUGwHcp5RUBpO9XgG/Y8xUuv6QUuD6r4WY5R?=
 =?us-ascii?Q?2JAkT23egRXMiDVSG5bCquHgEmMj4BLM0Bvu9bwukHZnP7w5MArtJgwJyrWz?=
 =?us-ascii?Q?PPMqU7kd1C7LmG74pDFQTaS+aCx+pjzyBKZlyWBDeesbt2dtzipgs8Zq/2fe?=
 =?us-ascii?Q?6P28rRlC44hzGu8QP9Yv9Qpb1ImyIgox6Jpq1EbQzWS382Wc0r66hM3zHfwI?=
 =?us-ascii?Q?1N13JW2GcjXla9QeY2/OYDGqGQ2sNDX77V2cb6HZ0JmtQ566J+B9Vb9v0ak5?=
 =?us-ascii?Q?xe/uE8zupjRWA4LKDRDZF28eK3o4Uh7VfMjAc2Ahn0TYXTEU3hhhO/j19Tpn?=
 =?us-ascii?Q?zl8R9VhCIbjTv00qU+DywVzjwkE6lwgEi3b+iCMPWLnHdWiM/MdZEfr3kjln?=
 =?us-ascii?Q?sKEcJfcPfc88isKOdNhPN1ZgUxqP5PVYthq7Sneg5CsR4nrBbUMd0yiy7vvU?=
 =?us-ascii?Q?96TU2sX+L9O5iOYk0D16qPbO158hmSKMdaRwNMngUQPWjLctH2OFcseOqYud?=
 =?us-ascii?Q?nfaoI9AD3UykBdMSN9VXUe4uhjOKm0UZM0FKDpmJSnSKU8a7+BAyJ61hzW4O?=
 =?us-ascii?Q?nIcnQqW+Un19AHoaViFNuE5R9vl+5thee7ZkiM/5zlPncV0wYK+OZshFQaAD?=
 =?us-ascii?Q?vF+8noePr8q/uK5J87sNODV6vj74ck4L+OBntCU/K3yeWuSv1tox0YOj+fm2?=
 =?us-ascii?Q?LbrNat5XPicap6AtL5mWyedc3EmqctRBwQgdbkfr+hm6Jx4JyHcmMqnoRjYU?=
 =?us-ascii?Q?BOfNowXYLcLQod3ywfKa+Ty3bHoCvC7R0rnmKZBGzpBHeuimedq8FdTHNnXq?=
 =?us-ascii?Q?r0YXRUvzpLKdPJn1shr7ve0zgtAgPh9Tp4rqaFkzv3SY3ece4cZX2bLy8wPO?=
 =?us-ascii?Q?ECHWQ9YGw9XHqQmKrlW7k/MF8sUv+VD2yRmrXWWAbhHjCXiFmMNAjKKqEsm0?=
 =?us-ascii?Q?syTphwxlbGotGcFrxDV3hIKmJmZu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xA1SCo4JJzW80gBbvIo42xVeHmvQg4wi9lK6E1Ofs+yw0UHLCawVXQcq+qGT?=
 =?us-ascii?Q?NnkPvfvb2i4i3XNLAWD56UZ2uqdoiuQjdQdGs5ZCpuyWzVWQ88WZWTz0Y0+T?=
 =?us-ascii?Q?RhswMF232myJb8lV8p4U+FBedAdaw9OyBuOOWxpA3CCG4wEj95viWkwSxtb+?=
 =?us-ascii?Q?ggXTLgzkljoSG3v/CMFYQOUYCJSeSd1CwQ8vG1t/ygzWv0LqQGppp4bANhbJ?=
 =?us-ascii?Q?8WkVGoC8S5ARiUyeF9w3GTc48CFZgxfCpdbrYeiYyAf8H1Mcydd5FHY2ZnGv?=
 =?us-ascii?Q?ctz1cqejbh+3mHSl8PHe0y2/2uj8Od+G2pIBkGhhZ601ky6k+xKMZWoZGMXG?=
 =?us-ascii?Q?J7UvQYx2rlROY2LXz/keCDjadl6s4Uas0JhBs0eHWrV/3ZCfvNltH0lgRB2A?=
 =?us-ascii?Q?RF8PKHBCZnlhTU0rlySvinaHtgmPsLUMqo1fePCf7tFbhfvky+Np2XuneuHn?=
 =?us-ascii?Q?cMeNgL5FArUDIWJjZyOlmtfbNpFzKWdt5MHOg7r9ftw6wE3JPgcYJWoQmcnw?=
 =?us-ascii?Q?iSgneiooZ63g4SRlwPQuHncsqVKlRFXYin/xartRwgTDbOG2vE5BBXQGgZXL?=
 =?us-ascii?Q?JjIagdqUrvUFD7BcRiI7zSjBrgoD8tgD/zUQ2Nh60GlulK0/AxC04AoMC2bI?=
 =?us-ascii?Q?MxaJMgMh3yjmguvXQaC9mJ24rPZ584SL/QaeB4bfJexPrNyzd2Myphjzn8oR?=
 =?us-ascii?Q?IOnl3Ww5SkLGPoIdUslNAn5iIHN2W/6eyy3tCJH7+nq0pqMGd5JFOo/YVRZU?=
 =?us-ascii?Q?Yq8s+5oEa+oUOEwfJm92X9VActqibMXkBlc6plh1yCdVg1JjN4fn3DXmsUz9?=
 =?us-ascii?Q?bf0DGFeeTfHY4tnaOzKwzYtUc/Qdv/BwM4JswcbOl6BO/Js7nWP/AfyKN2Pg?=
 =?us-ascii?Q?JHs/x1b4Hn4BCSRtIQIoTH+OMgBeUfTS3/NH98cybkE63wTCDn5CPG4Cdvx+?=
 =?us-ascii?Q?TDUV1JIU+X4XdOxORp8Zh1vq5pY+nMruvQrZHkE9naxYu7nd8+tAdoALV4Vt?=
 =?us-ascii?Q?Uql4rbzSED7e0IE9SGMOMvAwnhwnpldkOlDBrU6n078AFO8LmnYsD1xYXU2p?=
 =?us-ascii?Q?9z8nCvp9OvSLjcyeMFlxYlXrZ4IByjrx3XZKo3RiH2uc8ZHsXHqLwJ7hX2hF?=
 =?us-ascii?Q?IXSaYd1TP1qDmfIHGIcyjG4yjq81nk05nh6X4ssgSnPUc56Q/rrFJ3Qsx1z+?=
 =?us-ascii?Q?zxHaY+UZnY1tAgRHh3nzBTywKd5cMzICm5zSB7mFOg7Dz/U3dzSZStsZMKdC?=
 =?us-ascii?Q?zJvEM3M25ii6Dyr1GQhXFuW9C2ou4+6MURvmV9H8Q0IuBPVCFFz7JJjUdHQb?=
 =?us-ascii?Q?jt9yBivNSvdLj0vY+AcvqJnSKaNsXlwR0Y/is4tHBvvRkm+OvZa9slB7XbN/?=
 =?us-ascii?Q?bUj6yocNobUAiye8zTA3o0MU5B7EEH4oV6E9qcdtWeDZpuomkf6qAjDSr+48?=
 =?us-ascii?Q?+kAwqPgCfwOt4vcjWJYN+zaKtQ9inEE5ivKq19MM3vgqeZPnR9wgyglxx/I5?=
 =?us-ascii?Q?RIoQVCUq9YAQpHkJT+hADeVqyExcdqeAv8JtHcJDzLofuKNIWZX4TAWuGIZF?=
 =?us-ascii?Q?xNH+6HRl95nE33d9pBLE6JV2LiqclaB/nleCcPtp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C1fV25zG6AuSnmJPordnVbRrGks4n91DdLI9SvNJu+p92f+c10Ju5+RE0u1J1Y3ZHj7ITKVZGBdpY3zWFzgebQfB+mWN34iYGwpyQxphIP5eW+uLhW87PHR0XbdPRoBle4eGO2kt/oDvpEOGukhfxgcJ0mLoPp3XAZz5gl/43JMg+WebfFs7zSwdPqYsBodwtu1DjDh1kSRQgFy6Aeu25OsZHqyut1TZHKGG1vzKYpTvCz3V8FIorJP9JWP3eYHeAK5s4C5jmN1ki2R6Lvcx3CIHJHUU2s8lip/7bhAMZf/2eID0G7tmsaEut7rCxcmzy0p3NoU9+RiTsOpsMasrwqJ1VuTwNPz+SXRhK/FOKuWxsNuSrw76KzYA/RMIPPNwZZGoKfC7XLxQ+5C163ApXdk8QBLdxEpLhEI4VKyDSMLl3uBm03J6Z0IEAwunskvFNmqORRg8gDkFw/PDIq+HJ9SaY4GqJJXLfEfjkOylbc21E83KGgafOCbGB7JgwJnhPfTk/LcxuND/SweNv/OVWOReTPMdMIHmtkWummVsODcLU4wgoyvw/37A1XIMmceVLhzA36vYZOoB3aRa7zleFewEf+lMYcse6EyLBYWDBSg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51679ecd-b353-4eed-7d6b-08dd46ece8e6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 20:29:09.1184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azVdPLPPShr/jy3Lj/0GAZpvq1NSG3HCECd0wu8zjsDGlNQydMXdVcPwgjgES0Nr922XptsjDKIF5H6CswCPQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7674
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502060162
X-Proofpoint-ORIG-GUID: 64DMqxRo0W4C2mldoFLcnfgcxU8mL7XT
X-Proofpoint-GUID: 64DMqxRo0W4C2mldoFLcnfgcxU8mL7XT

* SeongJae Park <sj@kernel.org> [250206 01:15]:
> Split out the madvise parameters validation logic from do_madvise(), for
> easy reuse of the logic from a future change.
> 
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> Signed-off-by: SeongJae Park <sj@kernel.org>

Reviewed-by: Liam R. Howlett <howlett@gmail.com>

> ---
>  mm/madvise.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index df5a87a1846a..efab2878be7c 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1594,6 +1594,27 @@ static void madvise_unlock(struct mm_struct *mm, int behavior)
>  		mmap_read_unlock(mm);
>  }
>  
> +static bool is_valid_madvise(unsigned long start, size_t len_in, int behavior)
> +{
> +	size_t len;
> +
> +	if (!madvise_behavior_valid(behavior))
> +		return false;
> +
> +	if (!PAGE_ALIGNED(start))
> +		return false;
> +	len = PAGE_ALIGN(len_in);
> +
> +	/* Check to see whether len was rounded up from small -ve to zero */
> +	if (len_in && !len)
> +		return false;
> +
> +	if (start + len < start)
> +		return false;
> +
> +	return true;
> +}
> +
>  /*
>   * The madvise(2) system call.
>   *
> @@ -1673,20 +1694,11 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  	size_t len;
>  	struct blk_plug plug;
>  
> -	if (!madvise_behavior_valid(behavior))
> +	if (!is_valid_madvise(start, len_in, behavior))
>  		return -EINVAL;
>  
> -	if (!PAGE_ALIGNED(start))
> -		return -EINVAL;
>  	len = PAGE_ALIGN(len_in);
> -
> -	/* Check to see whether len was rounded up from small -ve to zero */
> -	if (len_in && !len)
> -		return -EINVAL;
> -
>  	end = start + len;
> -	if (end < start)
> -		return -EINVAL;
>  
>  	if (end == start)
>  		return 0;
> -- 
> 2.39.5
