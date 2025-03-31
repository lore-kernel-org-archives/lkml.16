Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580D9219A81
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432679; cv=fail; b=sLH6kU5IXsfqPM5adiKkSy/mO+NaVRK9Xs1sbATSCfW6aRfLidyRd1espPijYrO8Pwjm2dbW9DtnfKU7GimsdvidY1+G7DhB42OCJ8bH4oJ8EodIpCBPKDM9btNk5XR5bVzo2BKmUC+fXEqijSSO4L9C0cT/LdVYnwJ23fn4Uek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432679; c=relaxed/simple;
	bh=UE8Tjs3GADDgxEG3qMxIyQVhPg5Lj5xtic/5i1Za7qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=M2DDgTdyI7jUY/7ciz2/JPQGbdmghLwCRjrjj5xh+n4wKgtxHFybDch6AO3gW2aijpWUDNrvNXZQwoju9G3vLS4GTt9glH0uR0siUZww/cb1llDLcs8S42/UUhhlpk7AFAVIbZtwRW1Riyx7sAlOXOk7hD13pcTLfrIMKzmHGMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bwyRX191; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WSoB7gfC; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bwyRX191";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WSoB7gfC"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VEC3JO001576;
	Mon, 31 Mar 2025 14:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=2lintiCpJnpsGzjoPB
	aotUWNDNUrL0vvOCRG1F0yps4=; b=bwyRX191Vd0D9xRhHUty7mwIRHjb/txlaQ
	+U81ZvrDROJd2tgPc4ClQ3y3EzsYYaEL4o5eju/NLu69Gatd2hkIgOQhmFViE/2h
	/BqCW5BorsEx0ljNXFpmSisfuhlJSrGag1g/xfIbEW6Jek5MWmR94DmUBoY9jkMY
	exUhTxdSGCwyFDios2vSFS/fIzaRHSMrlNKErobR+b9mXKHN74NNtrOLyObvFUNn
	eBQYQ6/Wdzm42jXFlP8a3Pr0YVWNLtG3vipskSYQPe7rhK2r5qrNuChMUr05JOm5
	09FTM1cko9V6dDBjbkFgzw5H6y0jziPHYF2gTKU0H3kqGfRw/z/w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8r9bbfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 14:51:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52VE20eo003381;
	Mon, 31 Mar 2025 14:51:04 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7a7rgbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 14:51:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmOFqLFIjE++pJYla2tQnjbJcJhuZcTGGb6zcYnAgPCKGx+nZk5pX7+lQWE4PfOJJAyI+duvPgyCc0mW8/AbGDIi0UL9/AqPAshbxNgQLRIsRNzjtBIbhQRTY7/MJAF5hgHLNfuaX+IEwMCsdtAdZUAG2Q4sQn1PyMuI/JyYpnaxHNpEHkufdSPXVymNG0q8VZOGvO4nxwAOcj/40wyNGr8lxkbh4Y0+GDjrylZ0S3avmlt2eqlJ4JOlGM/FIvAJGCT6nNGQdS5WhfTay/rjolAIWZD105SRfIsTL8ermVzYSZXaZbB3JHTFZOe0krQL+3lJNq11hBsP43d/viAmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lintiCpJnpsGzjoPBaotUWNDNUrL0vvOCRG1F0yps4=;
 b=jiprKTaikVieaXUtqrGF5CIT1JwgRXitmNb3mCjN4Cg6Z3Ll8c8depdPlF4fF+IquX4RxOgMItG9U2s4aF3NGkCAdWbJOgf4YJ/d4pZ+q95Ml7tALJ7SUO4h23xJp9NFRrz++Tw3hMY8cz94ZG443eDGbwzGdv62H7JsQwlaWkKk5LxovUgr2sX7vr6F5feXsfbRSBK+RO+CHAjBuHXwkZtR/fLdmMIGZChLUDE9IPdEq3Mtg02sDbEYQbQ4TfoArIORTxe9RYAIwJUa2qxljvw3bxez4Zv5P7JRZaB0AQKgq738NkcICykerRzEUsQq5aAJrrBb9JoiEgh1CxMs+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lintiCpJnpsGzjoPBaotUWNDNUrL0vvOCRG1F0yps4=;
 b=WSoB7gfCaiKDl590mXYR3PdQm9yXV7eiTPJSGmpjD9sbk3KLbehIoPq8B8tqRGhINiQ/WtUTDqCziFm9ib1BL39kaanPuF1KmcBjKgV1/bq+mlLmQzN7giVSbGD7N8hrY5qSZafaLvlNTQ0iE9OTCrkvSJfHaC//Naq1DzfhWO0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA3PR10MB7041.namprd10.prod.outlook.com (2603:10b6:806:320::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 14:51:01 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.038; Mon, 31 Mar 2025
 14:51:01 +0000
Date: Mon, 31 Mar 2025 15:50:59 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/7] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <f718ccd0-7b67-4c82-87e7-720d905c3595@lucifer.local>
References: <cover.1742478846.git.lorenzo.stoakes@oracle.com>
 <d10037699391c42a4943f578c2a0bca890640f30.1742478846.git.lorenzo.stoakes@oracle.com>
 <CAG48ez3CiRTUv4Qwy_UQzQuEDtUoPVVXnuPyiWoAhWVqkF3VTA@mail.gmail.com>
 <182bf1ce-1b67-4243-854b-4d0c26aae563@redhat.com>
 <2bdf7ac4-b359-420f-94fe-466ae98c4a49@lucifer.local>
 <335b3432-af06-420f-b575-7a1d92148f6b@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <335b3432-af06-420f-b575-7a1d92148f6b@redhat.com>
X-ClientProxiedBy: LO2P265CA0250.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::22) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA3PR10MB7041:EE_
X-MS-Office365-Filtering-Correlation-Id: f32af4b8-c637-4348-8ad7-08dd70637470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DoWmztgh1mLjlx8ebb5Wp+uXyHbY5RiFOePUV0Iiwz79JW9eLvwpgVYKbF25?=
 =?us-ascii?Q?chjO+6owRVBJauYVJb/j6IYRzt580oe8qYf+f0g7Z4XZPEAfoM2VxCjK10wI?=
 =?us-ascii?Q?DZ82q2zc9E6J5PCcomdWfhmoqDz+F1DTp5k9Z9abdqVfFdvXkPyg0nRO+/RA?=
 =?us-ascii?Q?q+x8F8V5icK4Kp64JofKoGIKfeW4ON7RaoGzNyAkrqd8xVUWJBIYvosHoQP0?=
 =?us-ascii?Q?TEf8b+Ma1bTPXGhqvf8jyj/gCgmEwrL1FzxO1ftJCq0qn/9MdPUwqNiNZBkV?=
 =?us-ascii?Q?gnAvRpog2nW8FiJTsu3wqI6tdcMXVnqvSe4YreI/yMsVzuRNqrwzMOW6l5Jj?=
 =?us-ascii?Q?3cfZibsrP+WLs8Cyr3MUI+xpKesDXOohQJkd9TQCjVZb1NylOK0v46Hnfrcb?=
 =?us-ascii?Q?iTNGcBXTrpry1Z7f2cS067ftgJFhuvILmlqEQUBkbLUOSXxcf6Pxl+T7ocRV?=
 =?us-ascii?Q?HLwEeW1jWAazSFEM9+y28TTmo/Os/MXkO5ZnmP9BtVClF9UpSeavW5CQqq4A?=
 =?us-ascii?Q?OqoD19z2yFw7vcz8IF1V3+cBx17f2VLGPXjh6TlFCVB2nv+X5Z6ZVyvcy5M2?=
 =?us-ascii?Q?NF/3pz1IMAZkAwO2BKAjA8q3US5As2Z46bmDeLCL/vqTiun6Dn/HR4KsH1eB?=
 =?us-ascii?Q?cnJsYbWGABz6sTcI1K+QAjnIPFN6G2wUWs5+qnKG94MTsHGxUiaZNOiPInS1?=
 =?us-ascii?Q?O9rEmlAgUahvhZdrASYtPc/zCRMwFhwjqdp0jO/bu4rfsPqUFPljGPn6iIz6?=
 =?us-ascii?Q?r9TyMcWJOC4/ig9EKgnR+A9ty10nOaXwPAFSB2P3HC1uFlNs5gd5FjsVh+at?=
 =?us-ascii?Q?8rhJYOtC3IJC5gTWvN2y2D+myn8D6gZIadx8bEI4c3Cjaosrn3xnKOmSnX9S?=
 =?us-ascii?Q?Z99sSlg24OwjIqQkDEdCZHuFJ43O98bu87XMSpk1HbE5yAl6+Agfsi4xg9Z7?=
 =?us-ascii?Q?AEXaK9AnP3d1OhlnAEpYTP6EtPmWRGd3buUN0eb3iHLKi7lO61styzX39t9d?=
 =?us-ascii?Q?NV+hcPKyzQl4KWXofxMXGpSSpfTYPsYWXmdoF9ezlBDaxNWOMQ2DJki+Fqxi?=
 =?us-ascii?Q?eTazl901cYPf3SbtmfZBPSU6frkH1oRwwYhECODtTLNS82sh90khc+i35mjj?=
 =?us-ascii?Q?ZVmvs9XAzCe0CXQtwUaVPOHHk3Y4UwYLDrgq+/FCXTSAyinVcG2yuyGM/UA/?=
 =?us-ascii?Q?1GLsq4QA9Xq6TBF9pw2S8bBltNrAC5IdUJs9PxiKLheXlA5Fq+BnoBE20deJ?=
 =?us-ascii?Q?mPOyU7Pl7mGDPAsScMV4KxXPKO+jvndDgHJTcy58y2dQ2nPBrr4/Zt+pNoOo?=
 =?us-ascii?Q?+TxiRBITUEyhJC4rlTTJXive8J0EzqdEyF/u/FcvZY1rNSnImE+cCPuADQde?=
 =?us-ascii?Q?YgYV2qt+X8IVBNrTDjNFt9mJojIW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ELngBUlOK4rGA3y8G9Ho+WmVKDAFYMtvTqAnUuMovPNzdOS3nqHIutNlTrRV?=
 =?us-ascii?Q?708f7s/9xsR9o5mN6aejhzNrvZudh5G3NfjXXqsxOajdQjmfRUvzQfO2pprZ?=
 =?us-ascii?Q?nlao8XwjQrIHpXoh8IgaOJNLWbuBCbqJcZaqnkXPvAtnYzQprJgNtto5nuuG?=
 =?us-ascii?Q?lOEKoOK5Ii99ZdXQUAOsfFYbi9oE6v9YqmkzHGt3taZ35mVufmsgKd9WJvcP?=
 =?us-ascii?Q?To5XwSko5Sliy6HAKnkOWg1w6/QR0B6TRP7uRRsp1Q+Ym71IQ2lExd99fpLG?=
 =?us-ascii?Q?/BjrdqbkVVyvf/+VgWVOYKVGDYTtF1zh1rqlGw3/Bhu5Zyqg9qzsj3p8QSv9?=
 =?us-ascii?Q?TsZg/wapjdmsWkiepKmYjqTe93moKY7+Jrj6WuiJF0YzE6OQE07lx0o1EaRN?=
 =?us-ascii?Q?J2yeSXs+6g5VtogOl2ax5lg5jQ9IAZmdjLr7ukFUi37kuwzpP/xnEf6LYwQd?=
 =?us-ascii?Q?60OIhOgwb0hIVnhy1nBWGSdKg3zMqqAt4D1HRiBJZuI1nRYHzNFTu3dnAgEc?=
 =?us-ascii?Q?9AUAFx2ar/lJSQr5wCbEfiBwM1FRXWKLZJXbZZV/X0oZ+0kIHUzNcqMsYT2Q?=
 =?us-ascii?Q?fj8Sz/lZN06CXGQ0Awq0+5qxLtuKXHkS5nVekF/HhAkbMgFOp65442J3x6pp?=
 =?us-ascii?Q?6y9FWl+XHe9ymYsblEV4ahWjmdvcQ5MdQVpYrD8zwNVDCRJKe90/Sdq/r7Zf?=
 =?us-ascii?Q?THprfss0yX4YByOdYXnJ8GljiNUSSKqWFK+9QzTovMRikk3M9U9rDSqO3YOu?=
 =?us-ascii?Q?6paDyUyZKoehKNf7qHYge9TfG0eDL/3osjX2UnlLY+EgdDL4V4pRyEb3mZXN?=
 =?us-ascii?Q?dRfkviHIcVuKZ4GdMFmpPYfvVcwwGuu7xE7j/KKaZ1t1+VLpT62BkSQw9vVx?=
 =?us-ascii?Q?ELqqz97NYHh/lq8ZywzfQy6dt6YJlx7AX8g3I8klOxVVxhAV3x7w9+O6W90K?=
 =?us-ascii?Q?U/Gb3kvlsrM/c8u0mQk7cQwq8DqPqso7dYgt4l9yrHUwkRnBshRjupetatc9?=
 =?us-ascii?Q?GmlVxmgX+2YUle0RDBZgvFvqDIgSSVUrl8y20i5fQh58detJOGHh1oO2I7MV?=
 =?us-ascii?Q?CUAdItVP+XipE1Sm0J/VoWKNechqhn1CqdManopajWFxT21BwXY74j+gppn9?=
 =?us-ascii?Q?AjwJujq7nGZKwneoC4av3HXuvxDWEDaa1sJijKo86Iy15WiM2voQEiFhGr4i?=
 =?us-ascii?Q?ql+TFl3YEcAOeLLp5xPo0ilBcUoMNSVu0w9+eC5VOgWJ0atVF3NM368PrDzv?=
 =?us-ascii?Q?cz3/VDZICljl/wp21t6kbzG/2HgynZIQ7+8zVadGM5pd6NeMPcYraradCv7p?=
 =?us-ascii?Q?J9kWR1aRUJNQDftTKlrmBkUJnceP0O7ELdsDvxjIpUF41SVjj9b6qdh9sz1r?=
 =?us-ascii?Q?R1f9ilkI1xi1aKc2XZQ3FxEBOQIXYYHZ/3bNcH9T8PHSic6YimCNe3VsVQz9?=
 =?us-ascii?Q?sSkzb8/5yuJNB/yjww8z9afAmrmoHgv/uLZEyw/wu7lDSZKWyeUJUAPwIxBj?=
 =?us-ascii?Q?fOt0tGJJCE0jZUKr3kmkSZY4okTuKA2H7td6CqZp2o3flFDKFd8Vg75kRbby?=
 =?us-ascii?Q?fLeee/fZBOZfh8pdvjvBDgZpR3LuUWKeLBeMYE5ZUxcAeCNUKvFL8OxVp8PK?=
 =?us-ascii?Q?yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V9wdoODe8gsW7tGEfpsoMM3xlKKaoyu8sfsaNnSMMMVvkg9f+KvBFIC+8RVAVtNYa4wu9o1aTXSA38+lcCLQcQFzReQfCjX/2hKAcJhCsuqHfK2jS80EqMuGPBObJqtxmTy2MCor0ceSK0NITTA/JDlItTaIEICp1D9Cc3JzstIuvNPIy8GFWMHy0kr80iR11zXjGAA1hKArQPfHo3XLiGWDeLN0P7KtEMN1ZIQMXHJXzAALiFHPc20ey/q7/53sJRTFi8Rf03KdPh4wLKiBr5AfM1jrWczmw8H9+HIN40RtshYn4xFZXaoGmkN/OWU+KQA9zE9FJh0kJYq/e8uc9pNVsjSSijA6Soujj4aoM5i4rOMSU5oIZFR3AmJo8BNitOaPPGQBLT8kHLMl2D2GCso2jgjPlTwm4pNyrxvJ7wX+c5fklxzneT5N7e6OTjIc8I4BjoTC/7HGzDx3HP8XgG/kDzScvQr9day05Gr8LXIF4JPu9Ngpud8+OTt+t5IByu7Lcv8tPGdhjsRV4Resp+Ir6Bd6vpGpuB5+Z/+OnVb+52yFEw3eaPqegNUScf4hKG2ttd1tz3lgtvedDUsYTPI9ZtpVWcCKLRheIsSFJkY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32af4b8-c637-4348-8ad7-08dd70637470
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 14:51:01.6086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4F7eX8HZKHdStQruse+LSiKlC51ClVF+Qbsp8g+5TGTaRSEXOxcON8VG7wbnrmcBC/Go5w9HAF9PWreyTfyaNasiWl7MeQW8KcrfBAOrVU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB7041
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_06,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503310105
X-Proofpoint-GUID: DHzubQruodFJH2N-yHMYs9duQrgseNyW
X-Proofpoint-ORIG-GUID: DHzubQruodFJH2N-yHMYs9duQrgseNyW

On Sun, Mar 23, 2025 at 01:49:07PM +0100, David Hildenbrand wrote:
> > >
> > > c)  In -next, there is now be the option to use folio lock +
> > > folio_maybe_mapped_shared() == false. But it doesn't tell you into how many
> > > VMAs a large folio is mapped into.
> > >
> > > In the following case:
> > >
> > > [       folio     ]
> > > [ VMA#1 ] [ VMA#2 ]
> > >
> > > c) would not tell you if you are fine modifying the folio when moving VMA#2.
> >
> > Right, I feel like prior checks made should assert this is not the case,
> > however?  But mapcount check should be a last ditch assurance?
>
> Something nice might be hiding in c) that might be able to handle a single
> folio being covered by multiple vmas.
>
> I was thinking about the following:
>
> [       folio0     ]
> [       VMA#0      ]
>
> Then we do a partial (old-school) mremap()
>
> [ folio0 ]               [ folio0 ]
> [ VMA#1  ]               [ VMA#2  ]
>
> To then extend VMA#1 and fault in pages
>
> [ folio0 ][ folio1 ]         [ folio0 ]
> [      VMA#1       ]         [ VMA#2  ]
>
> If that is possible (did not try!, maybe something prevents us from
> extending VMA#1) mremap(MREMAP_RELOCATE_ANON) of VMA#1  / VMA#2 cannot work.
>
> We'd have to detect that scenario (partial mremap). You might be doing that
> with the anon-vma magic, something different might be: Assume we flag large
> folios if they were partially mremapped in any process.

Do we have spare folio flags? :)) I always lose track of the situation with this
and Matthew's levels of tolerance for it :P

>
> Then (with folio lock only)
>
> 1) folio_maybe_mapped_shared() == false: mapped into single process
> 2) folio_maybe_partially_mremaped() == false: not scattered in virtual
>    address space
>
> It would be sufficient to check if the folio fully falls into the memap()
> range to decide if we can adjust the folio index etc.
>
> We *might* be able to use that in the COW-reuse path for large folios to
> perform a folio_move_anon_rmap(), which we currently only perform for small
> folios / PMD-mapped folios (single mapping). Not sure yet if actually
> multiple VMAs are involved.

Interesting... this is the wp_can_reuse_anon_folio() stuff? I'll have a look
into that!

I'm concerned about partial cases moreso though, e.g.:

     mremap this
    <----------->
[       folio0     ]
[       VMA#0      ]

I mean, I'm leaning more towards just breaking up the folio, especialy if we
consider a case like a biiig range:

                       mremap this
    <--------------------------------------------------->
[ folio0 ][ folio1 ][ folio2 ][ folio3 ][ folio4 ][ folio5 ] (say order-9 each)
[                           VMA#0                          ]

Then at this point, refusing to do the whole thing seems maybe a bad idea, at
which point splitting the folios for folio0, 5 might be sensible.

I guess a user is saying 'please, I really care about merging' so might well be
willing to tolerate losing some of the huge page benefits, at least at the edges
here.

>
>
>
> Just throwing it out there ...
> >
> > (actually at least one of the 'prior checks' for large folios are added in a
> > later commit but still :P)
>
>
> Yeah, I'm looking at the bigger picture; small folios are easy :P

Yeah, back when life was simpler... :P

>
>
> --
> Cheers,
>
> David / dhildenb
>

Cheers, Lorenzo
