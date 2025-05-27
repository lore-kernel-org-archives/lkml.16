Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A718A6AE
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359821; cv=fail; b=lkZDB5YUNiXnwN9KWelkJsUqDtGBjMgcUllcVZVuxcdhzM7u9i+/TRe5m+pwYRTVaRaqSrQhCWYyxMo/SR1AEuvXPG8+HsJ/G4mp5Ghtf/8ZFaUjpIYuxvYW0M8XyieaJCBrylWy+zoYzYp94dWEc46tS+McbitwbOtyTl243Qg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359821; c=relaxed/simple;
	bh=OERespz8qWojhtVT1M88aBAw2K1VMOlEbsEgUEWXZpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BBY4UNVN+HzsbRb/VLe2WffrSqLyHbEnF8cegpN8/mnBmAnma/vaq9wjJfka4Pa8ShHLegv1lICA9IAezw6Rg6pLKN1/XLl+nWqW+1ypmOXSeRj+dLM8N1+65OhJGCLOqNADZEsUuD7RcQWnCdf6xYesracB5u5k4R4fV2NgmSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XcSxQQiI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=vISY5cQ1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XcSxQQiI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="vISY5cQ1"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCjfBP031152;
	Tue, 27 May 2025 15:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=lnXWwVKWXPohN1YrAd
	27fphcdQ5kwR0e8vrn1zEOUuw=; b=XcSxQQiI07NpKnJtr51/cONXqr0/xAgb1R
	Dj5PBBvCwHJAEV3noovBHntcNEwjH16nIlaQAiH/g8NZymDiw/fMjAcdswBGhaD6
	SGjXlM8BOqPycRXqWRtENTZLXKWM3vehnkSyW7R9x0Vy3vohc4S0unek7M5UvcKI
	WPmYyr61pDc1QMPYSF0z+eLwM0f1xaT73Z1OdJkIqZQCZIC2UzjtP7LAj8Xx427P
	UhT8stEwQM/DYuu/7RWrN6IIX+8mpxb9g3umQIRgm9Jl0JOi+KweHbyAc5BAdqkm
	Ts34DQ9Rcwqu3sno/VOxuvnJGFRI+dwyXoCsk+TxgUCpqINoE73Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v0ykujfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 15:29:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54REwnlR035622;
	Tue, 27 May 2025 15:29:46 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2079.outbound.protection.outlook.com [40.107.95.79])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4ja1e0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 15:29:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjF0dbGVMWaz7/DEA9r4xnCWrb4nLCOrLu/JQBr0e/ea4Y/3EhiimCSgjSjEbEWj2BoareHZypNqAiiy5RlvAEJZIAodP0tqV2yRIRwc1BPpyy0KlsVHLjS8fWPueBpzqq2/dndOQjkLWVQMkwbZI22B3Rm4gN1zExQIJ1GA9PxQQzFUEkk53eNbfUFzLu/St8w2OFd89C2xFTxST0S8axm10VHJwZ75Ec4suSpysIDGJ1NHlrQH1pQY26WxqTUrpwDEdnvIZ1onmGixOmA4xZMqBsbJQcZMIbvhXUTxNtIIU1ClLZQVnjZBj+TmsxPnYgujT9BItKLEus7fEKFYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnXWwVKWXPohN1YrAd27fphcdQ5kwR0e8vrn1zEOUuw=;
 b=fOxfTm0/Zzw5AkV3vBZTyASt5V5SJ2VI0ix5DsZlPR8vrqe7YenNw3qasG+0DiXZCDwvGy24rBi1jYhCp4fcHcgGvxuzLD8EiIIqty7Pete1i2at73KaodKyknJoQIsgqesNnKi3toql2GctgTGu7uaPZUrCxC3kP0QGXWChd/pCt8Go9V1Jr6O7wXliQW70a7iTOFF3QCO9aqDhoJZMktTsDUeMlKTW83HBE0nOjw2HZk5aYEVCOtOFX0XbFnSzQ9iWwm51fW+Fc100V4PJ3dCnZDS7ln3kO72VJgeHIlILTaRzNpN/PiCvkbn96ifWvy56liS/nyCPEtmTi63K/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnXWwVKWXPohN1YrAd27fphcdQ5kwR0e8vrn1zEOUuw=;
 b=vISY5cQ1+ihsLzYyYSzyollbY/aD0bMPdMrsxwvRKZjlUz8zc1BEzPCNokuKpTioAPYBqB6zCuVcwwdGHq9Dc3J5tZ5tQvnItQ/WIVwB+Gezv9DfXIGWOhczvH2wXiEm9Ri/A3emlV1zwUBW5xPFtvy55ByRcmCm9Q7XO315WbU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB7804.namprd10.prod.outlook.com (2603:10b6:510:2fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 27 May
 2025 15:29:42 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 15:29:42 +0000
Date: Tue, 27 May 2025 16:29:38 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
        akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, pulehui@huawei.com
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be
 overwritten when expanding vma during mremap
Message-ID: <5c4064d4-f63d-435c-ad04-7bcc93211175@lucifer.local>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <cd02ea34-0675-4324-aa84-2696e834d922@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd02ea34-0675-4324-aa84-2696e834d922@lucifer.local>
X-ClientProxiedBy: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: 52618f1e-6ded-42c2-582c-08dd9d334d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hUPQPjmWsqp823Wzk0Amn8Jgfu/D6groTPxm7WYfRc5/hezNEkc2xWyYNegr?=
 =?us-ascii?Q?DxSzWR0NpvtriC9vg69MmPX8NWBpUns572J26zwfj1HTTWRCXSIaMzipc94f?=
 =?us-ascii?Q?Qejt3FdkL4jMIPiIhpqkJSYKDNvHlt46vAPQnWvg+6kzYPRhwBHwViw6bfZ8?=
 =?us-ascii?Q?z5njWbzafxVwtEJ5igQ4repanj7C+FBQ9prG18S8Z+bAS3ewU+qhYnb/sG8d?=
 =?us-ascii?Q?KjlGSMePvtqZKJ5SCgQlsu83cXGi/WgDiAezQhNUHK+10mTRReRSjP9q4vUj?=
 =?us-ascii?Q?i8mJFoW6vA2UcqaWDsRoAWGXEt3unB01dl1AEk2tQZD+fnlnY2LAqZH/wFQ8?=
 =?us-ascii?Q?2rnhRraTJQaUX2bYsYNCAECNI9IEyVZEzvmzluGhg48+3g8V6SE5AKooSVeu?=
 =?us-ascii?Q?mN0A+uuILdXt089S1w/lHoGme0lhuTRRf2vmvCFibIrPjWhCnwt0jUsSJ5se?=
 =?us-ascii?Q?FXeroOvCnp9Wb9iJGzYz0dRFgjSQ+rJdavtZeLpG8GU+LZtk2GksV5ja+TGx?=
 =?us-ascii?Q?GJcaMzFQaFaaVzxbYBRBD/Ki0c03t9WojcKV0Yt4j/BYZAr+QLIImO7SlNdD?=
 =?us-ascii?Q?6wYu/gQpfWsRMagoDxKV+xzt6gD5a289sy8VqUTpSXU0lqFUEDIEVmABNidy?=
 =?us-ascii?Q?oH2IdLAQcgQVL1FkfMp6E+xxw0ejTox26ZAMwIBiwjWJvEQ2tHMnYFJnzCLu?=
 =?us-ascii?Q?jt14qLzwMpy+eUMdkq2sI4pvkaoQZyI/ChWJfsLWZLdEyx0G/jvGzHPMExJt?=
 =?us-ascii?Q?4Pqc3QkkASVjFGmzK/Yvhw6Uvq4T6jCnoxEnpJuB3mhw3lyupmcsKx6edg5X?=
 =?us-ascii?Q?DeWRfLEZuSdhLDvXHK3QxQNb7JWlf2ad30NRH6THckW8i66y1HFmYxqpja+j?=
 =?us-ascii?Q?txHreHUtjbbDP1chrpyMyjFRV7j8T4GX7ip/xGICD0LWQaIKKjf192n1zAV8?=
 =?us-ascii?Q?oZKPMBO0fzrTzVDnQJt6ix3So8p21641fdpdvDGW+5qrXYb/a8fgk/N6OHBI?=
 =?us-ascii?Q?4JWkUSe9wEwxJSSD5f2SUeNymg0s/NFkE3u+ewx0/y8RLuHkh6vsCX1/eHki?=
 =?us-ascii?Q?lUBSX1TaTtfOPkdo2mIkS99EvpOpacKGLO6VdE6P5Mbc7X22QdDcw65fmiok?=
 =?us-ascii?Q?2sn2D/WQe8fFJQLxS9j4tXNDCoPaeRxvI4NZYvT4Egd3OrmKNkKtDY/gtuNs?=
 =?us-ascii?Q?D2S0RskoFg1N/CX0ok3jsu65MamE5w6Pl9RZmLYwsjEukrx6T1w1TPKQoiS4?=
 =?us-ascii?Q?wGCH72XriqZkfM0FjNrlYBixS+Xe/2LyWZjXUGFtkEsSaPJSMQFovT2OSaK0?=
 =?us-ascii?Q?QwhQz4i7iAcy4ZgxeEmQVBidK8cSxEOC3qYSwwIxXH9076J3z12VgB8Dtgrc?=
 =?us-ascii?Q?+U3pKm0ImgJ3mEx8M2dAA9uzAeOL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NfDziAEvqEjCnBMF8PhYs64Mj3i/smFHj+XCrGYYVdwb5YuOLh2zvblXs06p?=
 =?us-ascii?Q?4mQlo6JKUGKuMaIQu8Qbx1/dBF3yVvNHA1tp49SPG40qVVx6oKypvWyz2qft?=
 =?us-ascii?Q?k8cim/eCw40BZ/A91X8SxOqWKw4p5wi7a0WLYWWCfrhlgv9nV/K9haqIrefE?=
 =?us-ascii?Q?sQRYlRh9uvR2QrvDGYmo5PsFnm/xxqNAML7X5mwzhq7e0WytZCqtkApcdoh5?=
 =?us-ascii?Q?y0KcKFB7NyzK+w/6p0MvhTWitTmxXFI9FBcLchR2Ag5S5sdSQBnjk7Fmu0hD?=
 =?us-ascii?Q?UNLZIl1aXderj+z4ih5rhQWo1sgyqOcNzGWfMt2QFflcrPGn1FIBQ5OxWijn?=
 =?us-ascii?Q?IgKAeBeFRHQkHMsbUZmJ+mqIdBXsIlSPW58IZohZGV90tokphYejJ1CFMcdu?=
 =?us-ascii?Q?Sfx450KcNTLJVXobbqtjvt6hY+A2SOPHWV7SNEC0BVIK8jJ1W4/aVwgpcFS9?=
 =?us-ascii?Q?iavSeu8v0uUOueAZolqPkTCmd1Zlxz72pLujrB5VrI7dQEdphU88XWKxb505?=
 =?us-ascii?Q?20fH6Y+jwzvtBMsZo9h6nBMmWSB5qFQ8erQdQ6LoOzrPCeAtHyfAe2KLKAM3?=
 =?us-ascii?Q?5/EPVCVF9q6hGmp70VhUO2ZAHw2q1lOl0wQAsf8x8iBaf6tJxqab3Oa3hZUp?=
 =?us-ascii?Q?zG9dXj6NVQih4VoXUvxHaubxjZbMQDzDasC0djqH3m/ktSfVDxeO6g4Sc9bx?=
 =?us-ascii?Q?Hf7EWG1dxanCEjLFWGkFTJ6WyLGtaG66MQ4xV+yQ2XAKR8tjtyhhvFdNZbPC?=
 =?us-ascii?Q?k0WFFPXfzlNNPpVG9YgfWIfKaPFyJBflkr8M7pUL586hKfiZOeGaAwHOTuaL?=
 =?us-ascii?Q?p7B8XxPV3lNMWWSurE9fQcYov8yxY5EHkdP1YIms82/lW9QKzQTxBZg3oYd0?=
 =?us-ascii?Q?vUpHuOxi3C183GygqdigHj/FTaM7ALaCDfcPOkpD/kEzbW10p05Of5p412A6?=
 =?us-ascii?Q?j5WVStGu6hIlntsnmlxydAEbAQeBj+AB00OjI5lz1PQ8c+asYzxsjsA9zDCz?=
 =?us-ascii?Q?4kqntIqYj2z4aZTH1eL6a+22iXCME9Kxa0o2hfx7lHpCoWNj+Gx3lInBO+Ug?=
 =?us-ascii?Q?shKbSAkHZbXU9O2zHa3B6SSQ0pBb3UgdiUrtVT9wT3d+7ZTOwBZjXavJnScu?=
 =?us-ascii?Q?GBPpteBd9MlQFYIY1HSRfBy/Gojv7KGkD5Jv4CTVZ0FZ2pU/C17uxx3o5vOx?=
 =?us-ascii?Q?elEFHK+27E+HIsS+95Wwgu+eX4tCBaMQKaE01xCcsZsU5QX+s5Q+QWMLpeEw?=
 =?us-ascii?Q?SWrPfgzj2clMwgoDfV3/3edq+mTBD5SdYwXDGgL+7JxqfpcSB9uV78pMduqE?=
 =?us-ascii?Q?SOcrkxWtKxc8Cd/V01U7ot69uAi6hS+/GV9FZdidcyCYG8QgbyClsCJzQNE0?=
 =?us-ascii?Q?wpv4c987Ro+KpJi4x4IsYHTYZTZxvGPr2On/u+7RPW5G9UlJLGAzbiTITh12?=
 =?us-ascii?Q?w/Yuh09DBMDEK/cT9qzsit6I6fHb2dsZgx/l0FzXeipEHmLr6AIYCU1UmhMW?=
 =?us-ascii?Q?AFyxel4y7bVH9GzDk6Pj3zP1Zv7WKVJTpUkVrEmqEvOhi8+KLZA8rOjTHq6c?=
 =?us-ascii?Q?jza/mk67W6HIPLAYW6TuUygMOekduQcvLXD8uQcOVSMh9HnxOZ+9RzvNh4ms?=
 =?us-ascii?Q?Tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LqZO54ythD9onEflrdNPLoiZ0p324P0vfkQd4q5qcoLAxGzeaC1SVritbEGh06ekxFKKpNFhD4EyxTFIPzBpY9/uFO7b10Ucn30rSUH/+77nFHyNaQ94P6MN8sgDVsREmeYRfBxIU4zcP0risRapWVod781cQou1GC1SvfdORBxSTkL1cQU7Vhf2h3BHeC2XktDqtP4mew7OIGbt71lf1s3By39bR82F4k2Vu3kgTBROpPn36iPSxtJMi0TO+9Tn81YRhZ5eaa0NxNJYxHFb/q/bstlSB7bSo2MC+TqqzRtq8RlH1t7dl1tjYkqiOsiwv1VRlAPhWO78FeXdmmoIzedJW0YiCgpxez+mTw2XoQSSjr12Bbw7KcDtYWCj1YnSJK7aZ1/1QqaJeKwZJ35KzA7Em/rBBoykCQIsl4FcebM8ELWMOA0lECkdsBzsWsbuvbw7UGIFxjr58JrNheczJW2+paF+e1Ajwt/jmNSSL8HzwiBf/ESO9PQrTzYIA8PLXuA+BVsiF7wyF+BbjmtRU1wiuBaZkPV2H1pXuexEkGeJADBYmosRJB8RBokVCMiS6gJHPyqy3QpO6hs2K2kDm3ReaI0KmhVpGekaCnJ31yA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52618f1e-6ded-42c2-582c-08dd9d334d5e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 15:29:42.4340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFcthpQ5xg3r8g9cCjZYfrOzmJN+Ig6sCdMWFc+h30rJOM6Psxtd/R7LjuPevSlkF0jEoykmkz9QmHqXegC3/0A0SwcRgUmRM0KCPercY/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7804
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505270128
X-Proofpoint-GUID: VGt315RMABwh-A0OaQO-cLvzqszlozR4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEyOCBTYWx0ZWRfX93znHyIA9Zfn +ElcRMre5pqK+sTZGF5ZkjVEwwjNP/eGqkumEPJoMUxgC7z9xVnya1Il2oFPUsT6IvCWOUsfen+ qhs2TRqQLhQJvINfPV2LHIS7mS3Huv4ztVMSNWKts1hNFpGI5a5/hAUPJtF+pGbYA+qE+8lFebX
 42AocngKB8D/EWKRh+yZVoXqF1uBO19EdfG98enD+SyNBSo1yfZ0eVM+/tg4UkedKPQDwFtXgDi 7vjBaoZd+TRGuEA+8KrPY8PsD4mxrIti64d1HT0yZvbTp97TQz5kKoLWJ1K5gXLQxUg5RBguC7V f4tVm3PRT+9fTeJmP5hnpiYRTrktgXHG6P9KmidCvByp3r/NVwQLzSW4+0GRCR+ZVkRx/c0Rgh0
 jZlEQmHHbTo+A3O8KoZRhERdWbuIgw8n0/+QcHPIReaUACa9g0w96GASGcjrvFQgOVd6yoSk
X-Proofpoint-ORIG-GUID: VGt315RMABwh-A0OaQO-cLvzqszlozR4
X-Authority-Analysis: v=2.4 cv=N7MpF39B c=1 sm=1 tr=0 ts=6835da6b cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=i0EeH86SAAAA:8 a=yPCof4ZbAAAA:8 a=cPPE6EBkpRFIkoYlI_EA:9 a=CjuIK1q_8ugA:10

See below for corrections coming out of the converastion with Oleg (see [0]).

The approach I suggest should still work fine as far as I can tell with the
mentioned correction.

Thanks!

[0]: https://lore.kernel.org/linux-mm/f2bb8d6a-d131-4c12-871e-0bca5dbab253@lucifer.local/

On Tue, May 27, 2025 at 02:34:41PM +0100, Lorenzo Stoakes wrote:
> Hi Pu,
>
> Just as you were sending this I was about to send you my suggestion :) That
> is hilarious haha. Maybe some cosmic connection? :P
>
> Anyway I don't know whether your approach is _quite_ correct here, you are
> generally disabling the uprobe behaviour on all VMA expansion (that is -
> new VMA merge, relocate_vma_down() (unlikely to be relevant ;), it seems
> sensible to only do so in the circumstances we know to be problematic.
>
> I really do not want mremap-specific stuff in general merge code, it's the
> move page tables bit that makes this broken.
>
> So... :P let me attach my suggestion as a fix-patch below.
>
> TO BE CLEAR - I present this in this form purely to make it easy for you to
> grab, PLEASE take this patch and rework it (if it makes sense), I don't
> need any attribution other than a Suggested-by, maybe.
>
> They are rather close other than where this flag is set :)
>
> I am by the way assuming that uprobes work by installing a special PTE at
> page offset 0 and only in the case where there is something installed here
> do we need to worry.
>
> Please correct me if I'm misunderstanding here, I am not an expert on
> uprobes.

^ This is incorrect, but removing this condition should make everything work
fine.

>
> Thanks! This is a great find overall.
>
> I'd also quite like us to make your repro a self test if possible? Not sure
> where we'd put it... could be in tools/testing/selftests/mm/merge.c
> actually, new one I created explicitly for VMA merge scenarios.
>
> Cheers, Lorenzo
>
> On Tue, May 27, 2025 at 01:23:50PM +0000, Pu Lehui wrote:
> > From: Pu Lehui <pulehui@huawei.com>
> >
> > We encountered a BUG alert triggered by Syzkaller as follows:
> >    BUG: Bad rss-counter state mm:00000000b4a60fca type:MM_ANONPAGES val:1
> >
> > And we can reproduce it with the following steps:
> > 1. register uprobe on file at zero offset
> > 2. mmap the file at zero offset:
> >    addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
> > 3. mremap part of vma1 to new vma2:
> >    addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
> > 4. mremap back to orig addr1:
> >    mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);
> >
> > In the step 3, the vma1 range [addr1, addr1 + 4096] will be remap to new
> > vma2 with range [addr2, addr2 + 8192], and remap uprobe anon page from
> > the vma1 to vma2, then unmap the vma1 range [addr1, addr1 + 4096].
> > In tht step 4, the vma2 range [addr2, addr2 + 4096] will be remap back
> > to the addr range [addr1, addr1 + 4096]. Since the addr range [addr1 +
> > 4096, addr1 + 8192] still maps the file, it will take
> > vma_merge_new_range to merge these two addr ranges, and then do
> > uprobe_mmap in vma_complete. Since the merged vma pgoff is also zero
> > offset, it will install uprobe anon page to the merged vma. However, the
> > upcomming move_page_tables step, which use set_pte_at to remap the vma2
> > uprobe anon page to the merged vma, will over map the old uprobe anon
> > page in the merged vma, and lead the old uprobe anon page to be orphan.
> >
> > Since the uprobe anon page will be remapped to the merged vma, we can
> > remove the unnecessary uprobe_mmap on merged vma, that is, do not
> > perform uprobe_mmap on expanded vma.
> >
> > This problem was first find in linux-6.6.y and also exists in the
> > community syzkaller:
> > https://lore.kernel.org/all/000000000000ada39605a5e71711@google.com/T/
> >
> > The complete Syzkaller C reproduction program is as follows:
> >
> > #define _GNU_SOURCE
> > #include <fcntl.h>
> > #include <unistd.h>
> > #include <syscall.h>
> > #include <sys/mman.h>
> > #include <linux/perf_event.h>
> >
> > int main(int argc, char *argv[])
> > {
> >     int fd = open(FNAME, O_RDWR|O_CREAT, 0600);
> >     struct perf_event_attr attr = {
> >         .type = 9,
> >         .uprobe_path = (long) FNAME,
> >         .probe_offset = 0x0,
> >     };
> >     void *addr1, *addr2;
> >
> >     write(fd, "x", 1);
> >     mmap(NULL, 4096, PROT_EXEC, MAP_PRIVATE, fd, 0);
> >
> >     syscall(__NR_perf_event_open, &attr, 0, 0, -1, 0);
> >     addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
> >     addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
> >     mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);
> >
> >     return 0;
> > }
> >
> > Fixes: 78a320542e6c ("uprobes: Change valid_vma() to demand VM_MAYEXEC rather than VM_EXEC")
>
> Nit, but we'll want to cc: stable once we agree on a solution too.
>
> > Signed-off-by: Pu Lehui <pulehui@huawei.com>
> > ---
> >  mm/vma.c | 7 ++++++-
> >  mm/vma.h | 7 +++++++
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/vma.c b/mm/vma.c
> > index 1c6595f282e5..6445f515c7f2 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -358,7 +358,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
> >
> >  	if (vp->file) {
> >  		i_mmap_unlock_write(vp->mapping);
> > -		uprobe_mmap(vp->vma);
> > +		if (!vp->skip_vma_uprobe)
> > +			uprobe_mmap(vp->vma);
> >
> >  		if (vp->adj_next)
> >  			uprobe_mmap(vp->adj_next);
>
> I think we need to cover off the adj_next case too, strictly. See the
> attached patch :P
>
> To be honest the adj_next case won't be relevant, as this is not set for a
> new VMA, but it'd be odd to have a 'skip' or 'no' uprobe option and to not
> obey it in both cases.
>
> > @@ -737,6 +738,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
> >  	if (vma_iter_prealloc(vmg->vmi, vma))
> >  		return -ENOMEM;
> >
> > +	vp.skip_vma_uprobe = vmg->skip_vma_uprobe;
> >  	vma_prepare(&vp);
> >  	/*
> >  	 * THP pages may need to do additional splits if we increase
> > @@ -1151,6 +1153,9 @@ int vma_expand(struct vma_merge_struct *vmg)
> >  	if (remove_next)
> >  		vmg->__remove_next = true;
> >
> > +	/* skip uprobe_mmap on expanded vma */
> > +	vmg->skip_vma_uprobe = true;
> > +
>
> Yeah this doesn't feel right, this will make this happen for all
> vma_expand() cases (including new VMA merge) and that's surely not correct
> for non-mremap cases?
>
> Again see the attached patch :P
>
> >  	if (commit_merge(vmg))
> >  		goto nomem;
> >
> > diff --git a/mm/vma.h b/mm/vma.h
> > index 9a8af9be29a8..56cc0364d239 100644
> > --- a/mm/vma.h
> > +++ b/mm/vma.h
> > @@ -19,6 +19,8 @@ struct vma_prepare {
> >  	struct vm_area_struct *insert;
> >  	struct vm_area_struct *remove;
> >  	struct vm_area_struct *remove2;
> > +	/* Whether to skip uprobe_mmap on vma */
> > +	bool skip_vma_uprobe;
> >  };
> >
> >  struct unlink_vma_file_batch {
> > @@ -120,6 +122,11 @@ struct vma_merge_struct {
> >  	 */
> >  	bool give_up_on_oom :1;
> >
> > +	/*
> > +	 * Whether to skip uprobe_mmap on merged vma.
> > +	 */
> > +	bool skip_vma_uprobe :1;
> > +
> >  	/* Internal flags set during merge process: */
> >
> >  	/*
> > --
> > 2.34.1
> >
>
> ----8<----
> From 30e39d0f223ae4ab5669584593071f5f7266beeb Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Tue, 27 May 2025 14:11:26 +0100
> Subject: [PATCH] mm: avoid orphaned uprobe
>
> If, on mremap, me move a file-backed VMA mapped at offset 0 that possess a
> uprobe and it merges with an adjacent VMA, we will then invoke
> uprobe_mmap() once again to install a uprobe into this newly established
> VMA.

As per the converastion with Oleg, this bit of the commit message is mistaken,
drop the bit about the offset obviously... :)

>
> This is problematic, as when we then move the page tables back into place,
> we overwrite the uprobe entry and thus orphan the merge-established uprobe.
>
> Avoid this by threading state to explicitly disallow the establishment of a
> new uprobe upon merge under these circumstances.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/vma.c | 21 ++++++++++++++++++---
>  mm/vma.h |  5 +++++
>  2 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/mm/vma.c b/mm/vma.c
> index 1c6595f282e5..cc18d1dcdc57 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -169,6 +169,9 @@ static void init_multi_vma_prep(struct vma_prepare *vp,
>  	vp->file = vma->vm_file;
>  	if (vp->file)
>  		vp->mapping = vma->vm_file->f_mapping;
> +
> +	if (vmg && vmg->no_uprobe)
> +		vp->no_uprobe = true;
>  }
>
>  /*
> @@ -358,10 +361,13 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
>
>  	if (vp->file) {
>  		i_mmap_unlock_write(vp->mapping);
> -		uprobe_mmap(vp->vma);
>
> -		if (vp->adj_next)
> -			uprobe_mmap(vp->adj_next);
> +		if (!vp->no_uprobe) {
> +			uprobe_mmap(vp->vma);
> +
> +			if (vp->adj_next)
> +				uprobe_mmap(vp->adj_next);
> +		}
>  	}
>
>  	if (vp->remove) {
> @@ -1830,6 +1836,15 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
>  	vmg.middle = NULL; /* New VMA range. */
>  	vmg.pgoff = pgoff;
>  	vmg.next = vma_iter_next_rewind(&vmi, NULL);
> +
> +	/*
> +	 * If the VMA we are copying might contain a uprobe PTE, ensure that we
> +	 * do not establish one upon merge. otherwise, when mremap() moves page
> +	 * tables into place, we'll orphan the one just created.
> +	 */
> +	if (vma->vm_file && vma->vm_pgoff == 0)

As per the conversation with Oleg, please drop the 'vma->vm_pgoff == 0'
condition here, this is not correct.

> +		vmg.no_uprobe = true;
> +
>  	new_vma = vma_merge_new_range(&vmg);
>
>  	if (new_vma) {
> diff --git a/mm/vma.h b/mm/vma.h
> index 9a8af9be29a8..4c35c5ab1aa2 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -19,6 +19,8 @@ struct vma_prepare {
>  	struct vm_area_struct *insert;
>  	struct vm_area_struct *remove;
>  	struct vm_area_struct *remove2;
> +
> +	bool no_uprobe :1;
>  };
>
>  struct unlink_vma_file_batch {
> @@ -120,6 +122,9 @@ struct vma_merge_struct {
>  	 */
>  	bool give_up_on_oom :1;
>
> +	/* If set, do not install a uprobe upon merge. */
> +	bool no_uprobe :1;
> +
>  	/* Internal flags set during merge process: */
>
>  	/*
> --
> 2.49.0
