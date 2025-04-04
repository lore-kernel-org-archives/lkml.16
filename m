Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545E11B041E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760957; cv=fail; b=secLdL95sZZnE8MuNnxkmIdECTbzBIGau7zR9l2MzUihkIuvx8yd6ECVUAN4lFSHa8cUjz74UbCh+1corjuGygG2z/KzzNk9QjwCeJNDbHfPpvM66N/p+p0vviBv32kMquFavmFVLYW6WfaKx8THwWsiof4vQEonbVig1y9xuQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760957; c=relaxed/simple;
	bh=0gzY9dgtly6sCJpO/6rh9HLyEDpzdgsW+/Nzz3Heb3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KVEwlD8esELF2ysdMYlHNF9IHuYLJBGoPdkFNpkO76NJ/7Deu4Vui+knjzJJ1SWksD0aTDP8LT7ffP4KdmxtW444Wwykk26NTeXrqvxQt4QB+2h9MHlqV18x1EsqbJ1ufBmIiPpSHQhCHgiGPwcp3kRkwdQdLWTD4p6n6pVqyM4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=axC2/AbX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UMBOc2bv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="axC2/AbX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UMBOc2bv"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5348N4EY006945;
	Fri, 4 Apr 2025 10:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=j4r9DEt2qTFpR1qo18
	DUkYwnEvZW1icQfy95f3sJVD8=; b=axC2/AbXR2HGpUpz1t0S1WdC+kutfUTof2
	tK5EqgRzjufRdh5ohqnatItg8EREB5s91GRHDpSi2p2/yrwLt26wZyFXvHzakJRL
	Gu09fem9ZTO4XNLb3Dp49abh9MW5RtZexKMle4c0h3WzdwPzDq+68XHD35QP1FTS
	euK1JdqG43y3MzPT8GbtIQkLb6dVDcpojdM3NoCHmihf7OfJJb+H0ldvKimjjLf9
	LyX+9Q8FQ6SkusK5bzjsK1UWGQpGiqjW6+q7sP+088w68GnR0Mg8aM3fgS6U8dyR
	oPQk42yKHQRcGuPnvT6eCUVIPbXgYf/h/noSeJBcstsY1mtl8icQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8wcq841-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Apr 2025 10:02:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53484JSC017418;
	Fri, 4 Apr 2025 10:02:14 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45t2pt3tg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Apr 2025 10:02:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4ToN+4YghP3Py4o8jTelGVggb2oFVhAziQrCa6Mb5qvCG3RSqG0xUDWHf3W5GeMM8ChT4BO39t2dPdRUH948UcoazmmRKziurBJ3x9EtckX0sl1kyolVR9tSFwz7CQJJM5E0uKhphYqJgJJyNJ+459RL4HRifLpO0b+ZKjdagVAQYzDNKAVs9NHLrMeeRU5lXx1VmLY9+alkaBFrs+rjzuWQXFDXO7n4f3Vo3lYSgb/luVKX/XFQC9xRw6zr1+ny/Nzl7DSYxoSaVsaG/ptdKg+Q4UmFEeDgG4hoj6N8Yg0zHdjLe6IiSKX4BSy4L77LjcBXOo7iC7wT7WoW2v7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4r9DEt2qTFpR1qo18DUkYwnEvZW1icQfy95f3sJVD8=;
 b=TAqmEvGravhtQtEhdqnaj3uDGLG1qQG3/shramuLjaF7XWtYT9dyazwELhNNfHSyUezXnaf3wNU5qFWnBlI4AO9JB3DP9zEirk1JzGcZUfhEllo/AimDz60wb4Yc5H2TOuS4XKtAo7VoV6DEkZowUevHGC9d/Tl83qmNE/VQppF9R/GfY1SMl5AgxNVAmkzd3p1KPrSISagFLFDqHrviCGv4LniuMpDY4b4tXWP6memre/iId7+1CIKmvrVCHM9VHMzPnGSIP2rw5ADJzvzHy+0YK5re1SD4BoarGs6ggP4AwEm+N+sbKJ8uM/kOQTC6y5ZrWMdSzGI4y8rh+6lSQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4r9DEt2qTFpR1qo18DUkYwnEvZW1icQfy95f3sJVD8=;
 b=UMBOc2bvzE2q40jkH+iOpVTumNkXirLYEVCl0aDEGzZkfAcVLUF8aJpRPffZ++D/AuWfVxqMn+hzURUgcid8fP3eq5Av2+eWorJia5V+Tu/HNi7EU0SQLgp1kLmc1Z+IPAt0LWPdt8n7p7yz/xtx+z1e16JtuYycaWF/HfxU/bw=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CYXPR10MB7975.namprd10.prod.outlook.com (2603:10b6:930:d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 10:02:12 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8583.038; Fri, 4 Apr 2025
 10:02:12 +0000
Date: Fri, 4 Apr 2025 19:02:06 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
        mkoutny@suse.com, Dan Williams <dan.j.williams@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 0/2] Implement numa node notifier
Message-ID: <Z--uHnqP_GRnt1TK@harry>
References: <20250401092716.537512-1-osalvador@suse.de>
 <78c976ba-1eaf-47b7-a310-b8a99a3882e2@suse.cz>
 <Z-1tzl2NqqRUYyU-@localhost.localdomain>
 <e1ebfafa-f063-4340-b577-d1b6b2fb5d11@redhat.com>
 <Z-8GY8X9uAE8LsDz@harry>
 <e316916e-178a-41f2-ab6c-00ca644101b6@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e316916e-178a-41f2-ab6c-00ca644101b6@suse.cz>
X-ClientProxiedBy: SEWP216CA0066.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::14) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CYXPR10MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd71ddc-8508-47d5-dc06-08dd735fc4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xnnq0LpI8JUoVHBE/mTIzZsgZgsvNGt541D2tfQNSTJOO4DG+WQ19LWsKmTP?=
 =?us-ascii?Q?z+kGxv0rw54a4RZodft4lZ0prCXamh0X/6IUnX65YOdXrRl2R+pshzSQy+0m?=
 =?us-ascii?Q?7g0YdfPCP+9kB3JaoPEb70EizONWv3YcR6REaZ2XdCOE8rsJeRDxroEsglK1?=
 =?us-ascii?Q?rT08RaHJrkBARecGTU6Kf4b6wcQ6jjHZ8IPMJcS72bA/02CSbh7VX5qHPaqY?=
 =?us-ascii?Q?8T5Rnt0ANRZ0wEjwofawA9aee8094Cvd/61++8oociQxgsbDK2GAk4K5G0tZ?=
 =?us-ascii?Q?tQOXCxC57LCJnhUPh5MVNJ010B41YRWcy+4BK7My9XFSWnMNLqsyXCUyFgQ7?=
 =?us-ascii?Q?fr82MTOPrqMi3NAT/Urp3fg4JHqkXeCRTZqneE4MaGLoUs5VqdmHr2C9+R6k?=
 =?us-ascii?Q?ckY2SLfmTUYxx5Wtez4DZdZgVfwH7Q6Gh1MK3LDxe1eYQpOEcrRyc0Y0U0rn?=
 =?us-ascii?Q?HA65mi0JWFa9L5sbKF+XK223eyHdIbY9X8AmEyt9guKGTB7ksHp2vu8E8EPj?=
 =?us-ascii?Q?m6GfWsgybgr7bC2/7VDGvxuR3Ng48AYxkAVvxFeKZxXwkJdjCDb4AMPKi7RA?=
 =?us-ascii?Q?9JhBMnmsMG4LpuUwFU+h8ahrtCL0w++AhYKEdiGk/x7M+JuOZLtYhQJK29T2?=
 =?us-ascii?Q?PfWUuDNgx0MPSWgdF5+nbKq+EJcHcGcHUgiD9+uav3/ngmBF9H4cRA8i1Lgg?=
 =?us-ascii?Q?qsGfgxO2sK9s/hxnvCF5x46+NEh/X8nBNaHAimcrR2lRsC5K/esS1asHfOIL?=
 =?us-ascii?Q?7ny8ECfTNv0NLEH+FTeJpd042GrQ38WqKUWZwGW2EkUOxprPZyFCiHaAopog?=
 =?us-ascii?Q?Q1mFGMdP08slLvCktyQ4K48RzARCGQxeuhKsBPqImXbGUttim/gaYoZkrkMY?=
 =?us-ascii?Q?WANZPUMplUm4phNP9YlGI1D3AI0z6uLe7M9egKCotcUhMTLjCV+MTawkCb6L?=
 =?us-ascii?Q?n6fYAfU84BodyYq94nn9iwMCBSRskIdJQUiFVmd+zVJJm23UvDqJ5DR6gtqh?=
 =?us-ascii?Q?DDYUjnwI6qBAQQULVtrfENF+doBB6VSxAgirwqYjE/oWBuvQ2yWF+dbP1QAS?=
 =?us-ascii?Q?eKW/zjwbYEjYNnnw/mv6c4nxaO8dr3ja0PA5scxpeLg3ZVl1K6+Z13s7DmRs?=
 =?us-ascii?Q?W7eGsWH6CRyA54FoiMSp65llu8t5V0iW2G2CbFPW4A5x1MH44l4QMFXt6DzQ?=
 =?us-ascii?Q?atb02LNxbOQ/N75JkRPwO6qDFxvTXZu1stySo4EY4Bd+3afau4aSIYPJlCna?=
 =?us-ascii?Q?qLKy3b5lW8sRMDeYGE9pmj2jRf7JpCwiDzvconxNqsCZodG4sTaweQPEx0d+?=
 =?us-ascii?Q?ATfZXxWRmGByVnAH6XPCwhDXj9Eixihly1dx4bfVwZtQ67EeNpWWNC9OMbsP?=
 =?us-ascii?Q?gybYnCDEQwVFTnkm6PTpWNm1zmz4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3srxdP6La5Dg0VOWo6Y4E2ssBoQ2medI4qrwCPujMt0LcRwwugE+ruVK8XSs?=
 =?us-ascii?Q?fuFlbAOXzDSB0GBwF+Xmuu6NxBVYJ7F1DfCmGDo84NXN4be3hrKnWmI1YNmE?=
 =?us-ascii?Q?0MW4RAJYa/6LpXC0vUWuVpEUMiAKVyAbB24mDwGp/cWsQ69pXobTVjhkVdYs?=
 =?us-ascii?Q?oGm7nvXzSFmBg4SNvSPBuSgNoBulYHV+F/3EGZEflPIJAPCHj1VicKX1BeqF?=
 =?us-ascii?Q?9RLH+iGPh+AVPiUNIo1ZmETa0BbrtVjkPIrw/vm4+bzPf0rEElbTteMTQBZf?=
 =?us-ascii?Q?V3wIKwPnT5dn4KC2ga16r6caBGBX3/XRV42Kfh9nuHH1I9u9kV0iLS0XoTMx?=
 =?us-ascii?Q?lf1q5n3CJ+GLJfVwsBikOEekXvW2Zf2tU9dIDQTp9zxLCO1cHcVcaZZX4WbD?=
 =?us-ascii?Q?2ObdnJH5+LwN+PRRvK7yIVA1HCmBaI5R83PPH+nMP7ba0i7VtAdPxxYEtGcp?=
 =?us-ascii?Q?MUXqyXJWTZZ7U4h+RTmpz1M1YyeeSkzObAxv5/SOFIbDb9VPgrjytjqTXhQ3?=
 =?us-ascii?Q?GujgKHFAy8QVZivlS8CmKH7vmY2MjP5x7m0/M88gjARLnuGh/Y3zvZC1mNjk?=
 =?us-ascii?Q?h3RRrmQazV55IIjaPXygtgQbfPBmeGLMdv/MFQoU8MjqE0W7m+z7TMRm9cAg?=
 =?us-ascii?Q?NBRtCJeIHnB2m3iHINEITO4x7DNrmKSIhChQL6hUyQ1iBS9b/j+n/sdp4wVJ?=
 =?us-ascii?Q?BIDq36YyQjiXqIi/WaYdAG87Vp+xBLZ0WADWbU5aQ2YVZLT4gFnvoISkgkev?=
 =?us-ascii?Q?6q6B5KBog+pkhQQQ+StF6nNKPruFANeb+YelRyEy1H7CcvdYxG4oynSlLahF?=
 =?us-ascii?Q?lL2IKXKnEGakGAKNTpuWqBefj75YTLTBHEJs6/f6b6OEndz7aNsMuApa+fr9?=
 =?us-ascii?Q?juSy11lzIsQwv1LhWWzd1CbjqrtkgJ1qcMxep9VyPqTG+OLHlRWY4ux5jtSb?=
 =?us-ascii?Q?6FUo2qblEZau1bSqvNXywIsgtqmit7zuON1GDmGCyR9dpmBF6k17AqGxWHDW?=
 =?us-ascii?Q?11yaRM8JfWscZEQlIfEoze5wBTo9Q/8NV0fpxEYNEhwEbrkNpg7Wq4UW/rR9?=
 =?us-ascii?Q?IODCPwS7RlCPjzFZ7o7nGHiUW+xk+hM375VBr+f26ZoCcBJs//TGnOLRp/oD?=
 =?us-ascii?Q?83/+XL1hrhg4suATbasv5SG5MLRBs9R5G/MYLiFtqbgoImZ5xWbcjHhPVRxv?=
 =?us-ascii?Q?lCf+cBgbDP9/shWM1IJ267WjwVddlg+/9LNavw/psOty9N50s3NqJ73xcZRG?=
 =?us-ascii?Q?QoEjL2lGjoEqcz035DqoNlBB3cs5CneiupRYtg6rgwd8IMcxeBuqmNgbHgQx?=
 =?us-ascii?Q?cHh2ur2b0oSqQTWWSW/t6O2ysToqtobB36w/vLrf4dkW7KhboDz1/VNL7P5X?=
 =?us-ascii?Q?GLFgpKmqhWSODvu5MQ9YfJCNV0193tcBQB7EDMGii9n+n7azg6hbs2StfVGN?=
 =?us-ascii?Q?Y4qoAGi0ZOd9nSNblBwkU3wz86o+AnKSeeIn4mac2UA9jRxIUtq0ngdm2WRM?=
 =?us-ascii?Q?BWKUKu4AFBhDP79t1jybALqu7Tb+8FiEsx0PM3lzWfHzNE4pqqxlZ2MVzXtg?=
 =?us-ascii?Q?xexpf+3DakndlrRKQD9zP1qpRmWHt1n3/Id2HEBn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eu7YE4gzwqAWLffKc2VsI6rQ0iXFrNU+n4i9y270F+R3GoPjENzkieG5gilRykqdo9LuRX1e0EP/CUftQ6RzucxJMHRdu+8c+S/dpQ6f54hQ7xhRsDxHgOvwAFMJ0u4w8b6gdvQ60wwwSC1koH4bbsNlEmnil5g1t5ahP39Pfrt4B4K9IrATEDDddQHFVyLGpgyydb3DSWg2eQsmshwTk64bH5zG5e6az5seovlaP4AEnQHhSgbRiuOQLUb8gdh3TdIOyxl2TUvj+ryAsiHfUvgd0V/1IEqI7X2oQcpWzeOlwfVP3KTcdQ2RWe6RXlSQx/KH+cBihrL69CnYbwI7YhLfsIEmEtOqUIA6DR7noz45XzUoTpp0Hxi3HNsuoqaMR2bVh7tIWUtkC3KMWt16KvCnREF4jtuSjJFlJds8oNcOlesDy/sBtWIOeh8qlkmtXjCIrfyUk2QoJKOYsTLZXJwEV5W5SXo6iCIkRbgItznm7yWNgILYhvRqxSZMTWbEIUJSnWg57PGTxZVJKGZDqLntA/ncfqmXMMneLiutUv1SyzEmPNb8O3kXYuwKH6P7kiN48nOKL2g4o7eMZq61pkPe5UBrZzhhNAwETmpU2TE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd71ddc-8508-47d5-dc06-08dd735fc4f2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:02:12.3170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zfq7X7AZHYOAqFs0LKKqUVn5iUwqpxwQXXlTfMLepAuFOnVkBCg6Vg7HF2875JnQwan4iVGtMqsmYNCXlwypjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7975
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=990 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504040067
X-Proofpoint-GUID: Qo4Avel0qta6LamZF65pyp05GywAJKVL
X-Proofpoint-ORIG-GUID: Qo4Avel0qta6LamZF65pyp05GywAJKVL

On Fri, Apr 04, 2025 at 10:50:49AM +0200, Vlastimil Babka wrote:
> On 4/4/25 00:06, Harry Yoo wrote:
> > On Thu, Apr 03, 2025 at 03:02:25PM +0200, David Hildenbrand wrote:
> >> On 02.04.25 19:03, Oscar Salvador wrote:
> >> > On Wed, Apr 02, 2025 at 06:06:51PM +0200, Vlastimil Babka wrote:
> >> > > What if we had two chains:
> >> > > 
> >> > > register_node_notifier()
> >> > > register_node_normal_notifier()
> >> > > 
> >> > > I think they could have shared the state #defines and struct node_notify
> >> > > would have just one nid and be always >= 0.
> >> > > 
> >> > > Or would it add too much extra boilerplate and only slab cares?
> >> > 
> >> > We could indeed go on that direction to try to decouple
> >> > status_change_nid from status_change_nid_normal.
> >> > 
> >> > Although as you said, slub is the only user of status_change_nid_normal
> >> > for the time beign, so I am not sure of adding a second chain for only
> >> > one user.
> >> > 
> >> > Might look cleaner though, and the advantatge is that slub would not get
> >> > notified for nodes adquiring only ZONE_MOVABLE.
> >> > 
> >> > Let us see what David thinks about it.
> >> 
> >> I'd hope we'd be able to get rid of the _normal stuff completely, it's seems
> >> way to specialized.
> > 
> > Hmm, perhaps we can remove it with as part of this patch series?
> > 
> > status_change_nid_normal has been used to indicate both 'There is a
> > status change' AND 'The node id when the NUMA node has normal memory'.
> > 
> > But since NUMA node notifier triggers only when there is a state change,
> > it can simply pass nid, like patch 2 does. SLUB can then check whether the
> > node has normal memory.
> 
> Well the state change could be adding movable memory, SLUB checks that
> there's no normal memory and thus does nothing. Then normal memory is added
> to the node, but there's no new notification and SLUB is left without
> supporting the node forever.

You're right. I thought it still notifies state changes from
N_NORMAL_MEMORY || N_MEMORY, but if you don't even want to notify state
change from N_NORMAL_MEMORY... yes. It won't work.

> But with David's suggestion we avoid that problem.

David's suggestion looks good to me too!

> > Or am I missing something?
> > 
> >> We added that in
> >> 
> >> commit b9d5ab2562eceeada5e4837a621b6260574dd11d
> >> Author: Lai Jiangshan <laijs@cn.fujitsu.com>
> >> Date:   Tue Dec 11 16:01:05 2012 -0800
> >> 
> >>     slub, hotplug: ignore unrelated node's hot-adding and hot-removing
> >>     SLUB only focuses on the nodes which have normal memory and it ignores the
> >>     other node's hot-adding and hot-removing.
> >>     Aka: if some memory of a node which has no onlined memory is online, but
> >>     this new memory onlined is not normal memory (for example, highmem), we
> >>     should not allocate kmem_cache_node for SLUB.
> >>     And if the last normal memory is offlined, but the node still has memory,
> >>     we should remove kmem_cache_node for that node.  (The current code delays
> >>     it when all of the memory is offlined)
> >>     So we only do something when marg->status_change_nid_normal > 0.
> >>     marg->status_change_nid is not suitable here.
> >>     The same problem doesn't exist in SLAB, because SLAB allocates kmem_list3
> >>     for every node even the node don't have normal memory, SLAB tolerates
> >>     kmem_list3 on alien nodes.  SLUB only focuses on the nodes which have
> >>     normal memory, it don't tolerate alien kmem_cache_node.  The patch makes
> >>     SLUB become self-compatible and avoids WARNs and BUGs in rare conditions.
> >> 
> >> 
> >> How "bad" would it be if we do the slab_mem_going_online_callback() etc even
> >> for completely-movable nodes? I assume one kmem_cache_alloc() per slab_caches.
> >>
> >> slab_mem_going_offline_callback() only does shrinking, #dontcare
> >> 
> >> Looking at slab_mem_offline_callback(), we never even free the caches either
> >> way when offlining. So the implication would be that we would have movable-only nodes
> >> set in slab_nodes.
> >> 
> >> 
> >> We don't expect many such nodes, so ... do we care?
> >> 
> >> -- 
> >> Cheers,
> >> 
> >> David / dhildenb
> >> 
> >> 
> > 
> 

-- 
Cheers,
Harry (formerly known as Hyeonggon)
