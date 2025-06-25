Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134312BDC38
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846073; cv=fail; b=pfJ+j6+mt6FAdZeDgwXUpawr6QKiUtjSSksS8hpt0A2dah35vSsvioBjWIWy/E+WLCBY2s+p2/evI2S1ZnyJ1DFYTC7xcxyH8E8cxyFFelT33aLKbb1oBdoM+jKOHLbFRO6AQrwY/jIT2qPcSrhxdOWPqMi2qrvlpFcrf2oCcx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846073; c=relaxed/simple;
	bh=QDM2CKAi81ffKmo+YhgI+iB9EJ7sHZoFDMek4ptIUC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UWiH42T7M5Mv3bO+FZlw4QB7d7c4K6op7LIbFwReUM93baGE40FmQv2CLqneV0f+lOLYEyM27yS5YMJlNLGj5zT7VT4sayzABUafN3oRh9elLM6YfrnWtKzUgIpyjpU/npUHhLgXY4PwQcneZFkkz5xbLW6wI911k7OUGR0oO/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B+HQEOc5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oj5URoIR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B+HQEOc5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oj5URoIR"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7fkSg000715;
	Wed, 25 Jun 2025 10:07:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=QDM2CKAi81ffKmo+Yh
	gI+iB9EJ7sHZoFDMek4ptIUC0=; b=B+HQEOc5qwEUkCQrYK8uQmynkRmsxoVsng
	6AqcX+8CLGw8S0E6QPs2P5/jXiPedSHzOixYu8S46IvUgtyHHEiya5kWDWHei4fZ
	FoPXkx9xG8NuhyQi4B9stHBmRXwQuHD7Y8zdGI9jwN2W/33KjpkWIBaDNJGCM4ge
	AiIPOH+GxpLU3BfjChEG2q9FeYq6xklKiR40Ue0Zyb7XFOR7Zde8nvf2ZPNHrg38
	5sAEw/IF7jYhFGZqhMQ6bvJ8mF3DrLhiy32CyABLi0yGwX+qosw+rgO/jUNP4Gy2
	+3Jmql2/Vp98vwNbSlpgSwlE9mIUcQaXb4kuSn5hgWr0NewgcydA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uy6b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 10:07:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P90tqT025280;
	Wed, 25 Jun 2025 10:07:30 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvxcav8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 10:07:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMJEVhfMlDp8NplZeUlM1KeUdSqmo7XXFhvfLeJiLul3SEGLJkaWhojyk2CkbEFyLfPB3gnhILZ5HMfgAd1AV6BIB7uFHsiDpngiecLtNGsygxffmf6dUEr/4SByne74Om/5kg7vrGU99K5yW62zUkhotOFCminFmO9Fw2/SmNe1cTCdZi7RvN4FmPFDMQwN/hvxuenzFWaNA0T50LLk+NRHQ5OJPtXLEJ2ViGJUqx6ghKdV6VSZaaoa5CFe+R6QBmoTjl/If5pA9C6K1bo3RlSH2FjILjX0cayqcsq3FXMX3Mrmwf3h8PyDmk1ucr/DziTzarnjmGAtrKhypFE5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDM2CKAi81ffKmo+YhgI+iB9EJ7sHZoFDMek4ptIUC0=;
 b=s5OCjnqHgFEHsQy48QKCBqcQ46+/CzEzeaBbq9gxm9MDff6cqD1f8mJUJXxzRh5tKHTgyXAb7kJtdEsn04K8DWHZ00aDfikX+uFxWxDVI7HvwH5j6IwjhVxfJ5XdM44wlTSIuVp+xfu+eia9gJChmTpry5T3P5K/z+RO2v9FAGi3JpDoNct6OnsIKgUV5TZraIC8G4HyPyMRrxp4yiOLYOZUDukf1iWQk0kc8/oiolNoY/6fAqrrmesuxbFswuwipgqc3MG8Yv1f+/TLyf/sH2d7xL3r+dcnDK1rsZGPYWFTs8bG0u1EHApAdpsQ+pwUcyNIQG5xIeXcKTbRBQI0OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDM2CKAi81ffKmo+YhgI+iB9EJ7sHZoFDMek4ptIUC0=;
 b=oj5URoIRbTucjzv5pd5uu0yAeaBuvwiDxJnEUeHDHoop6L7xNkgvdUsJnQ9Muu3PC1S6GLhIFHMDRnUF0QXlDo7p6M7AToyLJEPho/xinT9mUdO75iF8+1LAX/RccNiKzG9HJ5H2slSOsZ2hjHafm2krlMU8G9JySQuYWYXLAsM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4669.namprd10.prod.outlook.com (2603:10b6:a03:2ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Wed, 25 Jun
 2025 10:07:27 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 10:07:26 +0000
Date: Wed, 25 Jun 2025 11:07:24 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add myself as THP co-maintainer
Message-ID: <951a5e3f-e550-45b6-9b06-c45d686a7cae@lucifer.local>
References: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
 <dba5a7c2-1a7a-4b40-8a05-1dbba467065e@linux.alibaba.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dba5a7c2-1a7a-4b40-8a05-1dbba467065e@linux.alibaba.com>
X-ClientProxiedBy: LO0P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: c07d9ce9-a295-4f64-9093-08ddb3d01672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pE3zcE7yNNTEntx0YewRgSTX9xWJvOWEZKg6KNAbBmhAIfhD1vmxTktsgB7Y?=
 =?us-ascii?Q?4dj49asiVHBmKG0aDblFi3QDOmnV+q6qYTU4EMJOSmUjCwToxqBFtPGvRYoC?=
 =?us-ascii?Q?qG0bTdGYBbdP87v7V+0jAmXHPuofkRdBkqTpg3ONQ0+r+vWFirba1NJ8NtKY?=
 =?us-ascii?Q?eBtmcYBWjh8xKxTWzoQTT0QtoDwq+4bnGlkeVETsDVinKI4W14+m1fBaLV5y?=
 =?us-ascii?Q?Zcc1kEAcRVl0QMlVd5O7WL5PJZ8sozBOIe5I8kLYgephKzNNNg48dTrSBJAE?=
 =?us-ascii?Q?eDAlhKLK3lgR7gf6Gb6wwGSyqBAeo+rX3v/p8wQK5xFYUPyJBVFbdju6V61g?=
 =?us-ascii?Q?NLG//milUaBFmHt3w1gfBUCdybuL7N2/OA4L4UtgOEoTUXk97+AthUSY4Wwp?=
 =?us-ascii?Q?KQSpMLYqXi/7zZFykUWMQXpZtjdRjgt09AZAf+TA5NY4QULbWwcwYZbXwjBt?=
 =?us-ascii?Q?wEuH49MRqgJOuzPeqyTs90GIycOpPutwxVrGLxOWg7ysIzPnF8THuNbZPH7z?=
 =?us-ascii?Q?CFCNwuj0e2EM/+abLona0V6xRh4bRDg6w23uhoQ7Seu8Q2RZ+Y66QWqA6uvr?=
 =?us-ascii?Q?CfGIqG3swQwZHC/D8Eh/+edQwqECCA7Bc5wKsbng1o32VEDrLmJ9OrqraA0E?=
 =?us-ascii?Q?aKScpWaj6W1wbsdqP0G5zTHsOCF+JO0SOs/MC2ifH60nXwTZtXZy2DxnRlGA?=
 =?us-ascii?Q?J1oBXCrIWZWIdTIc6vkLsMnPKgSJEh9k0JqiJVYm2VlnHNcNF6ALsBGCkkYc?=
 =?us-ascii?Q?2H8MTDsljJzCQ8dB2yPbp93Ec5zYSJb/+Tx1fhRzx6eXxt3LqsQXWRTfS18Y?=
 =?us-ascii?Q?HkG7BtCzb2W+Jzg+Z+i6gO8ui3JHpaxsZO9lP9yBJvznVh+uNSKnd9rlY3le?=
 =?us-ascii?Q?sZ4bq9Qr/NYTyP4yKP8Cbbow32h9rLjW7ETE19b1InfzRo2nT8KXJ4a+FTuf?=
 =?us-ascii?Q?cv+84LX2xgH43duht+qszezXFqE3IPwgbY+uI/4t+7Vjd4n1N+wpT2wdafYs?=
 =?us-ascii?Q?bLDuUYgnWGMpbgkCisK7tH1QIc4Ez0mXI2Px27PdSDy/2awKgTv2g7lyl+tX?=
 =?us-ascii?Q?4SpV1LOPHVadkBTMJMM18ahZ6AYfEP6s9xsgQOfANLEOme86nS+/NZrqFe6l?=
 =?us-ascii?Q?jbb2tJP3lMOdYQhRC+K53xyQ/oxoOSQxnS2zo07d7deBidqAltXTh7Jealoh?=
 =?us-ascii?Q?eohxvrTSbTr5L9JKZN0NGN27qE8ihAL7q84OA5FUo4kqISfQQlqhYU7fqR8o?=
 =?us-ascii?Q?TLSw9brO0ayP1eyhmVCiRx9LoWosYP98ZIGDSY01gY+JNJ2g3YUeZdgqOX+v?=
 =?us-ascii?Q?kdPlhv696W7mAP0ld6JSZoZPfOO0r+ghpg15etITCAr4ylQFPdI7Llgx0HVE?=
 =?us-ascii?Q?MxJipiVYyFPUt5KD6B4a99GcTSMSfirq/B4+yiIoCsEOSB8VSUy+Mxb7hlXP?=
 =?us-ascii?Q?uUws7ExAADo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vkTwMNf83YCftJYokji4DtfqsDFVT3e1Yv0aA3ow5mgUYgKJCZ9ldHgIEVid?=
 =?us-ascii?Q?VfY7qUso4kWnyX/I309juRI3VzTRavpdXhINb0B5+pkYC7lv5ZDiffh658K9?=
 =?us-ascii?Q?8Zmr6UNqr4hIbFMhQfqbvZL9nNU1FZU7d9QULnwFgQ3AZLunpzCewzZ+q4yr?=
 =?us-ascii?Q?emGPH/uipkX6rHA8UGX/u0AdTqzZTRzWNUWmTFwKw9tmH9oX9PqMi2TIxYtv?=
 =?us-ascii?Q?MfdRKh9sc4SvGiKltI1twz2mLU0iYUgl88D6XALO5qkzaJ9xVWlYKqf1P3OJ?=
 =?us-ascii?Q?raa041AifTQwBiN+Q047+NyqQ4S/y0G/cZHlTWgrM4I4g8xE58/e82ZBfULQ?=
 =?us-ascii?Q?3Oql4oKuxgwgwFQq1ioYiPR73FQjqUBvpyed2Snf5tKQq7l3oxWCBGoaOCcD?=
 =?us-ascii?Q?vSufMKD6X2L+udb0aoUVz89E/E6dL1HLtLj2A21QnVG2defPZg8qgwX/1NSj?=
 =?us-ascii?Q?Uyuloj6W4bI/AD9dtgB/N9NrKvPIFY+E+wMNpT75wccza3cooTuHZ7GjtUys?=
 =?us-ascii?Q?/pRnSAGcVg+lHln3RWlLS4gMwxGgwZtBBVs4qkCY/uZZe14BSCz1WjN2MGxd?=
 =?us-ascii?Q?15+xPDqxq8XVnq9pMpPIWUMKyH67NPH74yGQodWzc2QoFDIE2iw+U3R4Kdrr?=
 =?us-ascii?Q?zFbwZD7/OAedauxwh866qH2At06i/3K0BQa7ShiAHX9C7TR1cPzKPhOCdLYr?=
 =?us-ascii?Q?NNGuKvTHcs5WNawVsG+dMl6OttZmFxtWyF5Mcm48Kzv8SqrujVQZAtL3/WZv?=
 =?us-ascii?Q?fnbJKwklE3GYkwcjPOdEsSb/XBbIdhCAyc+biCdkKi0FIECQsseYI8O1msUw?=
 =?us-ascii?Q?ZjV4AMBaiaciiEoW5AAmQzyvah0QveS/JE16oPprK16Pq1vbbv/VQp/BMtDH?=
 =?us-ascii?Q?JiayTyCRpmgo434nki+MigGCSswJKlgiJaUQXPpTvkhP5/kgLvogdRsq4o59?=
 =?us-ascii?Q?ManQUqfBHDL78x+OMmUDxYmK64o7XyisCccZCcbiXfQCwwutGeD4cttdWbqf?=
 =?us-ascii?Q?lpgDXo7M6wW/5PSDZb+EmKuS4GaRi1ObOvhqqF9hBne+A/oFhpqQ26W3nCVk?=
 =?us-ascii?Q?FbQ+QC1BcpwZDAMMeSPQGwh88xkfjUUvUpZEjEg0Iu8xXrDELIKVxhB2uP5+?=
 =?us-ascii?Q?Iq9VdYMBjDguOy1n6hsTveC213FBF8827cYZI5MdzD7CPM/AqfFebQ+f/tLh?=
 =?us-ascii?Q?58lCvvClrAOuR+e2x5GWsC0oV3a2f2XjyRKWU88ErLM0QDixYu4BDjc9uqBa?=
 =?us-ascii?Q?CZPhyMacnCwjkkSEZYLIj7AH+ssFUUCZifxC6/qTFKauR+sRrkol9RL37YRR?=
 =?us-ascii?Q?GmNGPQ/WYfZi7bIYfgTNs0ZgaYGsMpOACg1B5cVOOcPbku0YrPxP16MSdU/n?=
 =?us-ascii?Q?2Lt/uA/KWnk5PsxwvfjBPQaSRdaNzmgBvAdyr4F8mwHSlPySXB/lJCSeV9IT?=
 =?us-ascii?Q?y8pKtTV59KA+GAY1/ZZfMiCiDoSlThemxJmZN3R7kR1Jfjx1m9o5r5j+PVZQ?=
 =?us-ascii?Q?L6lySS/1C11eEo1XpQukrIZY4X0E6se8LykO5egFMPHkANPPRuz5eKnyw+BO?=
 =?us-ascii?Q?Q6AjJFbFT8hVBfPU0+itItsgcUYyiJHViRstfNoVQhfyANdDLTXbSoNueQm0?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vj1CoTD9w8vk1+MbzFG1HNZuOZ+gq1zHKvYueGPZQFxZijqoHL4uZlFpZV7IhkTdUnHsV9uhBWABHJBdWGaWqZKm+RbjeewNXSts9cSaRLr7vgCBL/rwqfJZaaDoISUhhkPYf2my6mOJMIZqGD/WETmgkpEoeKokdy9IKOQ/znMfoLvOPO7PF/4t6Bn7wYhvu2MlCw0s4Iwt1s+D0DSRUIaRjBre0JsWNsZVeIZF+RK8CBlLbklqUSTmwwcjKQ7w1bCGbDMHf22q4pnEOMBSbETj7s2hJ0vmk0AJ0QqKPly40NgOqhuUQdxbw7Oln71ZLaKctPf7rDal+HgYCqtsqFfYRjkG2j4wuaVuri5zC8vZbH/MlhlJSRm7Ha9oGb+9blpsd8IM37iKSP4ILPIsxjjg7Jv+VhMWDpeegkoQsu59YFHqac/7qb26FN97azsmCJ2f32vKDunHqkAtG+c3cSwkbfZCm3H/Su51RPLmcYmXbYARNkFwAV9DkbrTakXrogOo+zlIY3ag0LIXGztH69QelDj597enLcxwT37846/+kTbNLu/lnKB0Pwel+OW5+eeGO+hUTAO+NQaNzuEnTESMMziA1v7EpxOxWsxxxTQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c07d9ce9-a295-4f64-9093-08ddb3d01672
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 10:07:26.8239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZ58IwHo2MhwqfVxmHdFB4X1r9MLqdvaG5lTbGTrnR7mFpSsML5L6bkknagD046IdA1jHPO4JxPAzx8EnPyyPZZ/W3Nwy7Jz5VsEqxKv6mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4669
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=939
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250075
X-Proofpoint-GUID: NufEkoo0BWwn5SudE6asL1bl0PvOofzc
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685bca64 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=SRrdq9N9AAAA:8 a=j1QKggzsqijBK8MXlsQA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: NufEkoo0BWwn5SudE6asL1bl0PvOofzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA3NCBTYWx0ZWRfXwdabdcd0YmPD Ev2iVRbQ893NQv/Jc1162VWuLlGuJFtHtV0rHnFtHyNWoUmR1kvO7yCfxc6vvMhJdMMt/8hIzeM mVvEc4jeBkDoCwVlgpzqa5rQemUK112TKEXvMs2z+nOPG4jQE3PLSKj+seWR3DEhkAaF8w7rlVN
 EgU4qVHfaRLnlaOktEZIUr23PkGRd3BsdpmAQFfbvu342D0UTTWDB9rk5uzvMXEnDgEzR+8bNU5 oov7+RVKnS/PdfkieRAm0jZIKRlgVCwoxD7w6BhhuJELt1xB/weC6VbnPmTp4AsUugfw6pqjoUD N7EY9int015KsXg7g2quZbKfPsW82ZQersaraLaMe84L+wWR/z2vvfwtul8k8nN3a9f6Y2e0gjm
 AaMcM97TxHUWlu1f54TD+/hHtukSIoCmcoqbAqiDG9R5uQ8E0Fv3oR3fdRH2OloDmI2PF7kX

On Wed, Jun 25, 2025 at 06:05:32PM +0800, Baolin Wang wrote:
> I appreciate your help and great work.
>
> Acked-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Thank you Baolin that's very kind and humbling of you to say :) I hope I
can be helpful moving forward!
