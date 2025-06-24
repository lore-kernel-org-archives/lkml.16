Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA76A280035
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760466; cv=fail; b=k71Y4oJOWkIGPUbjzfD9nX+bOr09t/4xYb3VU3RNLzyY1ah0KLcvO2NWdzg+Fw6HQryQPHDFhJUtf4g12fLj0c35Ao+XsXqHGLDh8wcxKzA8rns7A59PyFEPWN8Qz+ND1KgqCLjlJ1TuyGoLWt3aP50j6JroeM09/0kF2QsJMVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760466; c=relaxed/simple;
	bh=H2JAnx9pJGD4Qc+07C35pyRTvTHHuAsvrcKitgDP1x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R6bORIQuhfs6V3PPWWn6vKpvHkYzUqBk9kglkuZxcHMlDv+aYbIiABcvnWxdtz1tiVM+2JtWwWae0PL0LOG+RINGBZiJXBJrvyPzETs1KLTgss5Bs452q0U342+ulFBoLBbk+A6swPlyODFPqr1IitFtIziB71fZ0n+9+1w/8uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZmE601Va; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=R8sQIujF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZmE601Va";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="R8sQIujF"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8iWYQ012019;
	Tue, 24 Jun 2025 10:20:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=H2JAnx9pJGD4Qc+07C
	35pyRTvTHHuAsvrcKitgDP1x8=; b=ZmE601VafEiVDE3YDud3674thZS7Ev2OQV
	CB8rbHNVSi3pSjqQGeCCdhkjD569S4xwO3Qw10mpZ8ix3Whw6aSbIHnFFaxUM3Ue
	aHG2Z3t+0oks0uFUiHORHPwvU+GYgskauHC1f32IIlGax21tbnR0QxMJbasxnpXi
	QZ0+ScbDvNlU6CWB6ktK3ukcMXgoYq3876aX4qiXzw/yfciQ3EJ4cLq4EfjiCxOm
	JDlPrCNypncoIttZrElJZmL7/yXXITu8919nxvBEkXvUf+faCPA2MoEY3eG3ZItX
	jSRu8vHO2BAmVjmUUgblztu2nx0yx4UfKkxZyOt2RK1E1L8Hdk9w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egumkr8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 10:20:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55OAJcW8025930;
	Tue, 24 Jun 2025 10:20:08 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2056.outbound.protection.outlook.com [40.107.102.56])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvvy7yx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jun 2025 10:20:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CxAc9gftroamtmN7SLeJgM1k9ohF1Ai/5GWfoQhlEgFW6uA1GrcaXK3/44pwrOA1qYx7F2sDyEu31cVH0re0umDopSBzhkv41Ym0hFQq9fZQAsEKhJZv4UrmwI+Q+p3nAlhEHuHzz+mPndsc0Xsyfq6LWdNdfi9CxcTEuFOaiVhG7klTxKEOVVKpGNC1oyWBCkH6Tk/PxDwCc+QHf7ES9XpgBwJR/O/B7XWD++dd2C22AB16bo7fiAFVeEzuGIeiUIQwJ2TJ5mMTO9wjELg5sj/wniDawPgmfE3La+Di2wzh1LbbYj8C03TD3LpQc4r8hH7qHlSwvLLo/e7kBJqahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2JAnx9pJGD4Qc+07C35pyRTvTHHuAsvrcKitgDP1x8=;
 b=cihayVOrEtQy5tvALGTkYO0HFzT24B7v0ajhzSVOf4QFl5yfaDGr9wp1c5rmlDoXBAFGsLUsBcGG78luo/2Cxm9mTtGYueKIZTB4zyI1UFasXBu0emH9LNQu+SE8MtyQcMtI6EvCYPozXoikujlfbmptrFUCmip5VEqsYh4A21fYRHZbU9vG+2T2wyqz6d44GJlaeVc9+YL4hSzimr84lUlDLuTNwLNUpjfSuDLTMdkgn1hrjLKXCbPDxU3hcxVfvEgh5CVxTpLx+gWYG90Va7YNTy9YMddnpvQoO8U3AkZieex5Jp8TXZlZQ+H08lZiTqCZvEig3tl7l6TS9cp6Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2JAnx9pJGD4Qc+07C35pyRTvTHHuAsvrcKitgDP1x8=;
 b=R8sQIujFOewNtLYb076LQffFMNnOn7dzojyX35Wsysy2DfUAOPFVXrWeUner17Tk+ToVg38Immn1ZBlqNCj55BKMAWj5f6TZhTTDPD+Vch+WXpI08qtQRjj7lVd44yaN8K8mzxneW55Fz0p1pc3WoCO2DfuOlyKXAOk3cwdP3Tg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7493.namprd10.prod.outlook.com (2603:10b6:610:15d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 10:20:01 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:20:01 +0000
Date: Tue, 24 Jun 2025 11:19:58 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Pedro Falcato <pfalcato@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        Harry Yoo <harry.yoo@oracle.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <7ae2e19c-10f6-4121-bc15-dd07c11b197a@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
 <b65dd020-5e02-4863-8994-def576e3d3dd@redhat.com>
 <76zi626uk53dtfzmezzt6cfz45ansam2gpcumddqxnipnw5jkh@qwfzoxgi255b>
 <68d8c7ad-aea0-4556-be63-9b67d70e4386@redhat.com>
 <58560256-58da-4fa6-a953-d2c4695ffba8@lucifer.local>
 <tc466z77itm7qps5exnelcp57dabnvn2gtd2tigutaivulmowh@4n74ymr5yxtg>
 <c1586ce3-e354-4b8d-aaa4-5f9899faae88@lucifer.local>
 <5ff81ef9-e755-4a75-bcce-92c4a4d1da6e@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ff81ef9-e755-4a75-bcce-92c4a4d1da6e@redhat.com>
X-ClientProxiedBy: LO2P265CA0347.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::23) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7493:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d822f2a-8d66-4c1f-5ccb-08ddb308ad8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2vJFIOdOisgrKfmd/fgZHAy+aA8oKUiQHnKExL31NMwb4uRKm9f2dCb52D0p?=
 =?us-ascii?Q?lkrg8eii0zGVEQlA6SBUyb38YzCgcCfWDX8If2Rrv681NLDwxx7HGEnnkW4j?=
 =?us-ascii?Q?4b3MzHGPjHQLsvuwEXo2wvyodITfgLzGmBpfSpFHhTLiVgbezbaxwpG9Vh81?=
 =?us-ascii?Q?cu5+l7RgMKCNZbHDzNa0/rmVqL9PXaBQuw1KLx4wklrm0LrXMpntjK2V9hMZ?=
 =?us-ascii?Q?bEScHdggCM/ujGSSXduuj4DIrIQ0JncMN2dUbf3580hHA5vM33SqB5IpJhxn?=
 =?us-ascii?Q?RuJYLVoeskcrglk2lEQ7xYWi1YHQ6j7vVktACUUAU5Kyql1t7RMOiknIamxO?=
 =?us-ascii?Q?lrlHlBjG1yH2fsV8QLruZt/NkpjHdHOfOWUjPOy8+q92RUI8qzcORIjXLfYZ?=
 =?us-ascii?Q?GHF9KxptQFZ2uLH0p7FoNZjTaQ2vXCnDXd8gFilQwRbdfZqan2dhEL/XXp5v?=
 =?us-ascii?Q?oYpLd/Ol5tWsBMkUZZyLuqzir2wl+r1jzfAuiaq7t0ZsAUbQv2ECk+rQILdL?=
 =?us-ascii?Q?IG/5FOD+/OdNZllKpFMe+HOEw9vinbJOKpLSGJEH5WN5F4ZvHGpqo2bBFIdG?=
 =?us-ascii?Q?QwiSMUVZ4U3yyagDnmmu/cQzK++CXZce1rFY5xYNTWk8Mx1TjgVcMrnfMGC0?=
 =?us-ascii?Q?dusyQ97V1Co7XQfTv4nulkeHgKsMVyo8VOGud53JuWQyaLOG0fWQhAGcf8ZY?=
 =?us-ascii?Q?63GG/HLvZxSUsroJKhXO4kmrUL9zDomrz89mtbPLpsAUCfhtvmilbKr09ETP?=
 =?us-ascii?Q?LaONhlNuakr0Jpz/HQlSMBgR2JLm9hyOAd2I3xr2K6Qc5Dykf8HpdCq7ZlYj?=
 =?us-ascii?Q?sm44OHjjiB4a3Mo7QRhJjusbKiw3yf0PSt/vW0YCP62s/tYZFJ5VqkRkbesv?=
 =?us-ascii?Q?0bYXN6q+F4mAx50lzWuLKLC1vTWf0CoGomZ4XBeeWi2JcYv9prBV1A4XMnBG?=
 =?us-ascii?Q?fDI6fod8V+fSAgEGhBo7vXxc5gHE1fNKIZ7VAX4jygBd7MlPnjFjVr8z10pZ?=
 =?us-ascii?Q?xmvd67+24ZYvxgcl05WqFYzHHZPJuQWFog5n1nGgc1twcbqolEgrqDadUYd6?=
 =?us-ascii?Q?iskzTY/etOdlInNf+hAhYlvsdLdLdWcrfxOjz2Q7IOPS8BN/0V9Wo9/5ce7V?=
 =?us-ascii?Q?Ad7Ln5U9aFIqo+0lJsWm0WX7Ya8vRDEy04BEvCE57FncPeENEcwn+1ey+UM4?=
 =?us-ascii?Q?g9aeYiE+biWkPlY0d5aOR/2HBPtQh6gyoCjLO2mUmmMv2XxYhnpZFPvlqOiu?=
 =?us-ascii?Q?lJhRezTlUdk/wu4xUME+2s6RwIHcmmBYnWYqdlYm4v+T8+CNX9zSaklOQfMv?=
 =?us-ascii?Q?4i0FDiHEfFcum7+vYRJI3lojMtX8Y+sK1uHJaIKY0fiJ7pTGALRi4r5M7e6h?=
 =?us-ascii?Q?98eWUhsh3/xTKszs1ZvFTPO2fPbaKoeS8yrqT2RIPJ1OIaQ7mXMFVHSGhK3Y?=
 =?us-ascii?Q?C1fFgZaq0fo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dYpQT7nkgG6gzinKxWbSoD2LgaSI+brr08veCWYWKnd43eLvRI096Rwv45IV?=
 =?us-ascii?Q?SFE5MV2S/AvMObWV7cDBz15lPQXr5z6Mc2608W3HVE5mgLDzoONuXXSmbesg?=
 =?us-ascii?Q?mzv99vgXglKheBfoCdco9QO4isU5lXvUPV9wGxQy+Hs4Tny6rZuhPz/p2y1M?=
 =?us-ascii?Q?THvYlxJPsJBTLeCmW8B5J/TMzjVJop3K9b8Lm6GVWvn08ZAXjN1tcbWIF0y+?=
 =?us-ascii?Q?64AdNQk17kbDKa8T8y6bfvZAjgqo2Z/Mx1GG3Xle7b3SJzTDuuSFKJLxqygt?=
 =?us-ascii?Q?DuEODQfypDnBxH5bm7Hb6pCeMGV2ScbkqyjeSgjcTLx1wRc/2JWho1h2ykmd?=
 =?us-ascii?Q?3vZ1EVF1PctsrMXtOam+ZmnFYEu6p5dQHJyJ7yUjKPthmFQpKT/KZQBfw8nv?=
 =?us-ascii?Q?V9gnOR3cJPV55iiZUdrQwgQiy1+teW+9fh/f9FFy6bvYUCRWQMMsjdiy6ua6?=
 =?us-ascii?Q?mGS6jZVQO4pR8wmuBnaTSDe24nVMvb75oi4slrCua/Fg8MUSCJMIQSzxFs+c?=
 =?us-ascii?Q?7eHBbP0PuDcgjLH6p4NbuHd6gEcNTQy8N7ALAHCJnRkoAEhQa4B1kJ3RdVUw?=
 =?us-ascii?Q?jLuhlwxO1iJNdyZ2FR6cUwOvHDCkmMEfogP/J04zfUi+o0+mbUEaV2iBf6Nv?=
 =?us-ascii?Q?fBJIxYJQZgSXRNZCgoFgQvIH/bt6u8nsDVVN/VUNq2LqhxObRHa/ZAIjnZbh?=
 =?us-ascii?Q?ypSKonHS/YFUAjLCUeE1edkqodujcBgeOIAF8Nq/lqfEAkV89kZZWbu7Raua?=
 =?us-ascii?Q?Hw80Jdj9640hiqMePtk+uXv8JpG3VR8uai8fsCg9zV3hSCt5FMoyx9XAb7fc?=
 =?us-ascii?Q?XFOymdfONoph/4A2ohtkXCO+BjT2aB3GZmiPkTdR1lxIlHlHpox4soCG/VZS?=
 =?us-ascii?Q?DvA8D6NVHaF+oERv0YGWahvzy9ZHq7mzQsWBlj4jde+aWQG297wvxytdkvIC?=
 =?us-ascii?Q?UKRwd55dhEHuwwVI6u9uDSfdoIjmJwn8/gfdCBOrEZXMP//bVgyJGg5lN9Yc?=
 =?us-ascii?Q?K9heZxnNGl7RomZPBsfcma3SiximFVG4VwzODsG0X4gkRyRscSgRtRH2NX6K?=
 =?us-ascii?Q?VB6Hu30sqaK4VUx03UTsw6FRCQUuBMs0lhHDhxO3GcdSo2E6DnaWRvPUo6dY?=
 =?us-ascii?Q?g4GbxMKKy89PDcbnX5mtJ3JOP8j/egJmuHPpye45y1BHY0bhT58yS9QeIvYs?=
 =?us-ascii?Q?S8bHQGk5Mf93SQWl5ayemkLxEhilTtld0t/Iz4u4LRZtfSfYHkPeMY1/2v1j?=
 =?us-ascii?Q?SXoO88msEQr0n9XDxoG4pjp0aX2OQH+pG9p5o7SnSJE+qpiIi+e9+XVdw6w4?=
 =?us-ascii?Q?VESKjh+0UD6c4HPg81aPuvNjY821gaLYEDtkabofjA00nHa4qQDPyQc7Rc5J?=
 =?us-ascii?Q?ZMkKJBRiOGUmRn9RcGIrZ2tr/5ZN+sIb9C15/lMZXBgtunB/9n6wchW5mj2s?=
 =?us-ascii?Q?zdNGyg2XMesjA6DxV0N1U2DU0r2DLe36uuf80w0Hb7/Om2bfC0megmLAvp6r?=
 =?us-ascii?Q?7499k3F/ZnaqPD/CWJSST6j8NJXQDVKWpfQVnMvKGxvqcnhBuUtetfu8UNZT?=
 =?us-ascii?Q?tcx3EoOoAYgYUYMBpNll+FuFX2YiCm1gPRKP0XaG+2Jt/678OcRm3pZHpAvn?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	h42PyDrWSiaUQS4C2KUxKFLNQpIbsRaGa/xZMhbD3zK3NTfhTmNLDRkmxwm1fMO71ZyynDI/jfRGy7X3IcV9aO+GpX0MAYQnYO9Fg3XuCoABM+E92y/u/0wmkTqxrZGjQcGUalLDFNwC7gUpzggi/YKX5JA2RL1vWpEh2GeHcOrPLPJvqfeS5IoUxO37UrwQepEIUslfSNfxHk6d/YMcXBZ6cEYh5h9xmdZE45iB3dkdbNBbApB+IDMBAwTmCPMRas8zSO10fw5k7pjfNuOuhqY0276s7DCKG/q1UUiSg+EBZYFnpK8Yff1Ny4u1EpsWzCg9akzGOb845TkqIccE6A1ZHtTpjKcL4UP7hU+XpBnpqwxwv2j85RbMp87filk00IXNmdAdBjZWtE4tL4BccOHU9SzaKr+uSJPLySb7lNuFztPPqqF9I4K5zCqDZHVX8YAUTt0d1gZcgREyng8T5jImqiGJtnyIWLbtLiLUiFGUQ8XhsfCs3LdbVg+moZf/AjTu/W6lZ7cwhQgj3yqtC12CMwQOlYYwGLVWxNPBeyct8R85tptUAjsnAZDcGPbA/pdPfY12KZLAFHZbn1O53xwFUsNSs4wwGbZKFfft/Sg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d822f2a-8d66-4c1f-5ccb-08ddb308ad8e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:20:01.0372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfllwdD/g/DCiHlUUHqW0lP8/w74L8Etco2z6gdrGCJIeaA+w8juVs/YGALD5h0ZVfAS5t2iLSZleb6G8OHOUtxvTrl3xso/yai5ydWsPmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7493
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506240087
X-Proofpoint-ORIG-GUID: cFwDfjNvGkvEFIcJMdsHdFHgSpSqFV3g
X-Proofpoint-GUID: cFwDfjNvGkvEFIcJMdsHdFHgSpSqFV3g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4NyBTYWx0ZWRfXyJpWiD4iOcZL ZS1+1Uv1CRJPLZUq4+5f86g+8mgL+oXyEknPH1GkcpnhSp29nkGmyaGaVrcMexYHDT3dkQAESuD QbZudhDY8zi+Q89y91SZXHIasP8qYiTTWdcRFEmnjIz3LRkrXyBJCclqGe7pFkHA6KA2zXvG7hT
 rKrB3y6T5qQic/v9LqUAXz8nrvmcnn6q/bX/YajSXacNjDJEMvIHpmK9/B4UEFcKJnDs3u6gj8U wCttXS91fn0AVpHyyvMv1K2796LMb3SBH4j4yudtq20o0ADBFpsf/nvRqw92EvXvBgzh6+giYuA 4xo9CPb8Iz6URToTd+JU6V5Clh9tS0IUad0L48coCwbx6X30uqmpFgRxXSClvug9mRqk/cmR6ZN
 UDEFHnYIbGnb674t0JopOCnOeUw9XfW41NNMyqgTeWMKAXt7JqLQEAycTmTSWYEm9Wp2VjyB
X-Authority-Analysis: v=2.4 cv=S5rZwJsP c=1 sm=1 tr=0 ts=685a7bd9 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=c4GCzaXD0glvrNVKSOgA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714

On Tue, Jun 24, 2025 at 11:38:59AM +0200, David Hildenbrand wrote:
> On 20.06.25 21:28, Lorenzo Stoakes wrote:
> > I have some ideas... :)

Note that I've been working hard on a respin, figuring out ways to
basically make it so we can't fail to set up folios (afaict) so we get
predictable undo.

Of course we make life very very hard for ourselves in mm :)

>
> As a first step, we could have some global way to enable/disable the
> optimization system-wide. We could then learn if there is really any
> workload that notices the change, while still having a way to revert to the
> old behavior on affected systems easily.

Yeah I was wondering if we could do something like this... I mean we could
hide it in /sys/kernel/mm worst case.

>
> Just a thought, I still hope we can avoid all that. Again, mremap() is not
> really known for being a very efficient operation.

Agreed, and I don't think we should microbenchmark it so much. I think as long
as it's roughly the same order of magnitude time taken then it should be fine?

>
> >
> > >
> > > Or: separate but maybe awful idea, but if the problem is the number of VMAs
> > > maybe we could try harder based on the map count? i.e if
> > > map_count > (max_map_count / 2), try to relocate anon.
> >
> > Interesting, though that'd make some things randomly merge and other stuff not,
> > and you really have to consistently do this stuff to make things mergeable.
>
> Yes, I'd prefer if we can make it more predictable.
>
> (Of course, the VMA region size could also be used as an input to a policy.
> e.g., small move -> much fragmentation -> merge, large move -> less
> fragmentation -> don't care. Knowing about the use cases that use mremap()
> of anon memory and how they might be affected could be very valuable. Maybe
> it's mostly moving a handful of pages where we most care about this
> optimization?).

I think fundamentally there are two problems:

1. Unexpected VMA fragmentation leading to later mremap() failure.
2. Unnecessary VMA proliferation.

So we could fix 1 with a 'allow multiple VMAs to be moved if no resize'
patch. And of course the relocate anon stuff is about 2.

In theory we could combine it, but things could become complicated as then
it's mulitple VMA/anon_vma merges.

>
>
> --
> Cheers,
>
> David / dhildenb
>

Anyway, let me polish up the respin and we can see how that goes :)
stress-ng is helping...
