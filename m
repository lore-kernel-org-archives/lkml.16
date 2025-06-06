Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E71285417
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749211973; cv=fail; b=fJPZlVIDbEGcH9bbLUD9CdjeIkS6wvYiSHAtru87hev+1SIuSJiQqd1Az9MHyiOGr+n+lETSxcW46VT9GITHFyLpp36zf21g2X5VvH9oyTe1LQDW5ugv8fsu5jOO0KwfJs9sOetlqjucp4DswACNnNGBE1sqsinigMrbFYikes0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749211973; c=relaxed/simple;
	bh=hZ5AoJFa3pvgg3gNmGn4+bBN1xZUQgmp4Fk4JH2IoDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b5hWuT8OvKpSkWGz/Ys0A+v2h0P2LjDlw8qFh5mwzU52UvPxDsrVOj/05E7I+Wgo04Dl6HmZEA79NgAlt34K2XCdJma0YrlMahECM0Ro9AAL04MxwgG+GYlf5vVKnkmSRc3tqt3NaB7VeGZI37OoDPl2cIvhKtZhCXkpA2lJ/hE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LrnB7+Iu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vqijzerb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LrnB7+Iu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vqijzerb"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565MY6D002138;
	Fri, 6 Jun 2025 12:12:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=hZ5AoJFa3pvgg3gNmG
	n4+bBN1xZUQgmp4Fk4JH2IoDA=; b=LrnB7+IuXEodwodjlFWV3nql9QdGqKqNZV
	wWenhT7U30jOI5uVyVtX1xHhjXz0nhMPLQgHC0kgWX7+SA+XQI52rYnCwyed7bWc
	c8V9/fw3KzuJpCTFF7bovr9D4Qazm2QWfLf+rjBL8lsse0x2m9oIz5U4nZwuDdim
	6JkPTzhVGvPGY006S2sTBE+/ffxuMDH0IasSpNVO5ZspUk+h/63uoenDP/fY8Z6d
	VE8iEjHg1HfmluANYC4dqostrrgP06NGSYRyt49UK+T/JwsoF8r2QThAwXXDra3k
	SllLFtUyFq6881aBIKMfYtmsft6kt5Xfr4yLOxU08BKdHJcnJBbQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahfyuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 12:12:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 556ABguX034829;
	Fri, 6 Jun 2025 12:12:35 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013032.outbound.protection.outlook.com [40.107.201.32])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7dff8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 12:12:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvuKXYpuiTU3B218DjRXTTOVtwbF6xg1kWM3+XQ3QtB1o7PAW/vC6p8dPCdF+xbQKEByQHmA1fmUeDJu27s9rEk3SJeBAlxEaOAYdZRz0s/4eoGrREXP6ARg1h5g4ZZ691fRDPMyIf2rjN6yfjHgXohjhMbVW3K69kySfWcBWzfz9Ld0H7jwXv5Fzo8HG/HMLqmNHZGCT/yh++Pqd1fk2KFj7qgcLkimYy6KT7gIpV9BSisN+/Q97lq0GBNO++KVe8mhLB7yXWqUKwWadAdnQaJY8yMJJlhiymFtP798iKfZ+ovTTPHSy40tFgEU4+IjxMgridxah0LVNbr+NMAVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZ5AoJFa3pvgg3gNmGn4+bBN1xZUQgmp4Fk4JH2IoDA=;
 b=I8DxszfdcXPAFVesXDBOzjWhOstwnaQFv1Sxg5EJO1rsG0sEDuZwnHgCmVhXYpUqJZ+Yc3j37PNGK6LzAmxk/VxghgV3zlwDMdhyOCDTs5sYi7zGpE916zeT9hVl6A/xCihHsWPf/SHu2cnQQ6ehuRnmYGqvpnp+GLvCZrfDwYJBY+Y1lOOs4O7XgP6UK3sX3PLA0HhttToQnUccgtPJbQUPjbuJ0QiZCdPbCeSnBNZa0RkvzATspFTp82UzReDhHKmpfEkNZOzAdkEyMNrzHnb8THGlCseyPolZob1yi2cSsO9LV6kbK+xmtfVUDwg0NENvpuqM6tFSPMKP3GztyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZ5AoJFa3pvgg3gNmGn4+bBN1xZUQgmp4Fk4JH2IoDA=;
 b=vqijzerbSTLs56oebwJTiQm93uj53x8n3gQbmDq0kigSgiqq5URjGwOfX0PCYXzItSNePqbEn3gziuxzD0XSmoaL5nKDOsWXtIwrDvGriX7BoYMEmwFyMNLq2wnzFaaV+T1q5sx20e232gy+a+Ogiy5IxVxV2/WSXJWf+QwWqVg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6545.namprd10.prod.outlook.com (2603:10b6:806:2a8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 6 Jun
 2025 12:12:32 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 12:12:32 +0000
Date: Fri, 6 Jun 2025 13:12:30 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <b00f0914-c06e-4d7c-b856-93a6610b0459@lucifer.local>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <fe31e754-159d-49fd-aac7-64af5e313884@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe31e754-159d-49fd-aac7-64af5e313884@redhat.com>
X-ClientProxiedBy: LO4P123CA0142.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 380792f7-cbaa-4c27-70a2-08dda4f36a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TZqY0KYyeRUSgraMd0spolwC/sEsRjuCWLGWC9XA+pe3CZYC0EYA3UdcmiMj?=
 =?us-ascii?Q?LdC+/e47Cs4bTbL7MYL6PwchCS34sVhtTwRXzfK8j7xgNWL+DjVapTAj1dO+?=
 =?us-ascii?Q?c4sVkluOGqoorXxoDyOba6zjyAO3nNWmkax0BrCY1RjwFVfRvJBG7k9z9T+S?=
 =?us-ascii?Q?cYSdAfTZbnDs/DINSuPL82Fj21437FSG9T6RRgnCEMOv9szQIh/U6MWp0Bae?=
 =?us-ascii?Q?bHL5RZ6zBtdFFFevalTjqgfo1NznCwNgGIUCx8egEnng5WtluAyh8vNeZJMb?=
 =?us-ascii?Q?bEwwzYFew+4QZk/WSeEwT6MWTOnJDC7e4a35ZOZ+yX6qy4lKB1qCrDyYLI04?=
 =?us-ascii?Q?mDU6yGbwnBaYIyZ/DAr4dAXX47h/zHBVCbhUtyNZ8z74yi60AksqR5yvyzYn?=
 =?us-ascii?Q?PJPSr9qL8ClCK8MpJsCRIcpdfgVc+uUmSQS1HZohhhS6W29c+uoHEKCSU5i0?=
 =?us-ascii?Q?UXpjBi6abhyVTngm4iAUV6l6zppqhW7NUUQDTtv8F8m6GAEVsF4I3W94So5z?=
 =?us-ascii?Q?fRGsFvHE/gAGUixtFWMPIVl4cxHevf5ef1QcZilI50lf/BdxKcguX5XEGtVE?=
 =?us-ascii?Q?feRvwvFo+BDMt/9LJXYtQhfyLnrYd/8t43gK9Nwv4LX93LS4kbvZNFvsay6Y?=
 =?us-ascii?Q?FDMNBmJURyqQeaOv7DzKNSs1FdqiCrusXUsPy0NIL5juXS0i06VtCxra+oPY?=
 =?us-ascii?Q?dxAqx1gxbywLS9yW5rUt73M1RK7L3WRbxX10Km0yHnvCj4+1b2SsdrdZTpRZ?=
 =?us-ascii?Q?+B7FzHWe5xNGgeQaijSsvfcRs3Hib6CTHmbiV4X80Q1rMK32E5N+4NpcbsAd?=
 =?us-ascii?Q?m+OWCiF552l6KARCj0c6rTMnnUFBKKbjoErQCfhMrBOFWf0lZQGk8n0rofbF?=
 =?us-ascii?Q?0egqcIQHO1g0qWNzku5Tj94gok74TpLLI8DD90+bpcBDeUVhfOhiyvu9WwNA?=
 =?us-ascii?Q?zFA8Rr7bipg+B+7mOElf3wEMUKfSStLBfAlxRj7Hf/xsz1jQ2dDSv3PEEvRO?=
 =?us-ascii?Q?vOoJHuYpPblAiC8Nua/YypgNXnYi84JedmnyRFzigDIsxoTZ5wWMO3qMRq0F?=
 =?us-ascii?Q?HKmp7MUUCttH1t4awDqK8ilJFlrn8h1SAZK6pXKuqZIYo+XfDQMYbTuR/X+W?=
 =?us-ascii?Q?2esSzDvUw6wOOL07Q18D6aey5vIWynqc57ItjVzHSQ+3YyvvDwm1zXg5+7sg?=
 =?us-ascii?Q?HazK3X8aCUJo/aeVoY89WAtLrcesDegpPCYmem63Z+H1ZjsPENXkF/qa2wtI?=
 =?us-ascii?Q?kQxvDXBf0gA3+hfVSIPwc3x/9spZPKbehHlZ32anOAd9rAEaggj9dY4/zh1a?=
 =?us-ascii?Q?h9eaAr955BJdXpIJjgxEQqgy1SMHM9NtYoJCOhYA0pMTHqzKOlDvFRcilbFk?=
 =?us-ascii?Q?RRkrklRG5k+dxuVvmQbJMasqfvjfEJp5yLRzDsR67XT5QUzL3QkGGk/BgNDB?=
 =?us-ascii?Q?D5NtVCG1FBs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jHmSgXDbmSYr6KSqLDoUo59tLWOOXJ1T9kAh8QYGgiL/+FwRtLuI+DbODQsm?=
 =?us-ascii?Q?eS77na7ZTju80Pc4Gi2uBSGtGmiZnse3mTajIicOaHb09A1+iEtjc0iy5B9j?=
 =?us-ascii?Q?H19C8S7+mrJEesIsWzeY63qMC1GeXogMecBNjEctKtNZ4EXmrAT/TIfob0PV?=
 =?us-ascii?Q?TjlJJp4cAGG2XT1Gp1p3ejHCiThivoHnN/oJXifTDl3F6/ojOeFvyEk0fQjx?=
 =?us-ascii?Q?1RBvriQ80XNG0lwoQmwEdJwH48Xk47VBwfSPTnjsjfQYk73MmECBdcANNkR6?=
 =?us-ascii?Q?mi0Sr2772vdDDtnJpqjSUkctXPMBv7r7pwJ07zDmYIteE8KqyDC/MNskoctx?=
 =?us-ascii?Q?vaDPdjRpyy4qrE42qNdaizmFOSSFdGWVq7uLoV1GPTeJH4sYRGnAp+HY/qnT?=
 =?us-ascii?Q?hTZBWy9lTnL8vg2+Ba00yWCvW6tBv28O7gksrOi+HxLBEH9779Zqiy57UHyt?=
 =?us-ascii?Q?Ob3xqod+Mr7jKKGUndeBfIf/d+kzvlHSVV9Wfz9Xqh+7kHEIKXEiZmo64Slc?=
 =?us-ascii?Q?/m/HPEEGGs/JYDdCUYXJEGORBhPKQe5ZOK8YM/rN1s3Lpg2XrqB1cz+por13?=
 =?us-ascii?Q?4RYrSGGlxvY2FW+R1034By8OJEJQDObznRpJA8dxI7Axvs4a6DrFae82j40Q?=
 =?us-ascii?Q?mb4LzdMucuJzRKvLlTsvPvS6yAN0RSjRY4YV1c2j/eo3VrilCXmbH+3RNr13?=
 =?us-ascii?Q?O95GpDrqK+JjOPrS4bW9c3nSzUazfHLgOdiddBblKcIm3YWsbcZ3Hy6wSD+O?=
 =?us-ascii?Q?18sEVRMh+eZKQOIFAsBHbg9PC3sNcGINLcY7QObk3TDdazyrUZOhicGLOEVQ?=
 =?us-ascii?Q?LV8JdbtT15g9j3q/NgXwtKWaodHpnTZOktC5R80VwUe5hunH1StNeu4P7lL6?=
 =?us-ascii?Q?0BbsFi/VOX9+91QKWLRCnvLuhXWyfY5GSKUpqy7NO3KqfosMw9RzV+zDqM5a?=
 =?us-ascii?Q?538ZaN9iBZ8JI7F1kaBnsOkJIYYpsU4ad2iHRzV5M1+ZedujifWlTbMsKyCh?=
 =?us-ascii?Q?0UHoBWLwNFxCvxD5gPBvIjAgc4j2KwvtiATA6Rbx1+Cf9GjpVyeMX+bnXJmh?=
 =?us-ascii?Q?4GTrhJ41OICvCN4yy1deKBamx2NfLPnBdVSHud7K+bcHiT4rmP2zZW4/uVYo?=
 =?us-ascii?Q?cG7xtmBYD4da7O4jBxuOIh8e2XODlL1zx4hobrlGUeDH/QuNdYdJkcemxN96?=
 =?us-ascii?Q?ydT/PO+3HQ3NjxoeeZvNwd4QELMEBBo/2kLj4drD2zejlGAsyRtUzv0N16rg?=
 =?us-ascii?Q?RdOKvpkw1YIj0MZ1QexYevuC5Q9+Mh2r54c1rSZhRiB3mxAmGIJADnjNqU0m?=
 =?us-ascii?Q?sVm3UWB4G85XRC3vGFD+j1Lc7qMKGzMYiqXsygYKrp2NY6gNxZeNdeJGW8JM?=
 =?us-ascii?Q?GFD7YuSyYY7kK6+lgegVHAjfUDqpYX9/U2423NhHDBrs0exYEWGgXwsz8nIR?=
 =?us-ascii?Q?R+2PCfaNa6DW42yaEvrh9TgQH/dghhyRePYfE8YNfj7iJjtHnYPoMnYEygGb?=
 =?us-ascii?Q?ZG8eqSz6fKWq/eD7Itz5eX85mPutKOiNzNBR3jnGvdYItnRJIyPJ2rVyzyrJ?=
 =?us-ascii?Q?krxZym30D0auQ8kyzvjxaKhdtK1u2k9Yg8DhlbAky2loCss4a/544WubPv/i?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DFAKwQRjjuH34vR4QSh4Gpst9P6udctCS6Fw9+qTIocKbIW+1FFDFfDbW1iS59T24xrhdv3XhhbeY0Uu6+tXo+IZAFLTFhTFClh2mK7+EjqH66CKtOI87orXIUjv1RTykKWzlBPObEz4dI/zktbRAyaI2LwG4ztuLZdqcXTBgK2l4RnNLHDIHH6a4VNUE+d2FLdgqo5DFTz2v6TD6btAgEDkxInPdcAjr2oWmUW7MHUoemgntrK435+RKDvniIgT60Ldi0gbs38EffXWf8jtDUMH2YaOd6GfdQoitdHIDg9NTyJ6rOuz+X9YMmJrisql6bqdmM1raVP2LYAICn7EjsD4KhAoZGpWMRgdvbqWAceP34+XBjUWXnAkx4T0oh6URxFzrvV5sG44xSqKGey0kLiXM4p1omR1o6CjXIXgjAbRFwII09D/vpZsIOmUyaREOgVbpTwn66RPd7kuGUByOcluenjx7S32wY8DnYcMo/wKQIYf9LWc4MagQdH7oNyQMturJ0mgdtbPqOKxjMzKNAHjY3Z1+QsI+F4eyrIfHCf4nbSKkltUecqqXCMJ3bhVnWEsMLu4/ki26A6F51GswmrsZeDisJU0E4ZnYURIGek=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 380792f7-cbaa-4c27-70a2-08dda4f36a1d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 12:12:32.1575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAUSHOg9eaXUgsYPxSM/6rBG+v0HEyy+Y1YxMaYcGuHLdon5Cwq0t/0iJcereYeZZ3+bmpu2Y5rE/S7rLV6X2HVRdnwxSBYavhEut9dAXow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6545
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=985
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506060110
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=6842db34 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=incDtCff1XPBpDD-vqYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: ICKyuTJtUVHojeeiMIfGms3yeYqXvD2Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDExMCBTYWx0ZWRfX8dIgxDRpQpRg pcKr26m30RC8WsCa4sJA0Ky3kC/4I4s0sCCzmWiC/AX8jJHAQ0BZBmuNV389FQhxbYu4iuioGnq t5x6XYG2LDySS4AE7Vl6NMLBb2NkXk5ybxuzn+Giai9OsYxopsQu+jSg3iSslHXXfBtfoqoD0dJ
 COwWKDV2+K/sX4GOyx20o/+3+TXLd+y8+9zbOrqgK+zMy8E0hWRu168ukCYZDSDGQxCbC0wxccs iMJfL9ssz/fLkzul9Z4yS/D0P5uSRHddsIPZbwIyUkyQvbYOCtqzHP4mlzjlX3ixh91AeHBOiFH q5ewJOtn5fYmSgRbiqyuJs6MSmWxSUCkFm9ZgWMO/UjdvyLO4lRCuFINHH6GpMRfSGLouZBw2/5
 ejSNoeGBU1HTkBKcc4pzvFyRDvfwBsb7dBqZCqRGMk5Tkzq1mqNm9qR25WzO8ihwDBCQEMKA
X-Proofpoint-ORIG-GUID: ICKyuTJtUVHojeeiMIfGms3yeYqXvD2Z

On Fri, Jun 06, 2025 at 01:44:12PM +0200, David Hildenbrand wrote:
[snip]
> I assume with "this patch" you mean "a patch that gets rid of VM_BUG_ON
> completely", because I want this patch here (that started the discussion) to
> go in first.

Yes, and sure.

I can wait until this is merged upstream and take a look afterwards?

>
> Fascinating how you are always looking for work :P

I mean I have an insane amount of work to do this cycle anyway... but the Call
of Churnthulu is loud to me ;)

>
> Thanks!
>
> --
> Cheers,
>
> David / dhildenb
>
