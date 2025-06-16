Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA0E288C0E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750105488; cv=fail; b=oZwABfgk9DAxuz8LCdZYXTSCeVb327FJe+ySbS3gwxfw+8Jz6zTBgAFq1siDTAWFsQMTSg90osDOrAOc4TfnHntHdbNn1e+w5C0Xeb9b8JOYArDbfLAeGsqAAh7qytNQQTg4A42R2QTgNMRnJcMl10HNPdschjp078l21MORb2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750105488; c=relaxed/simple;
	bh=ZiudLMl3PJPaB/oYvuDy/q0P/NRTc+FyFYGetcYBsQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sImeKvUE1jckskCSrVYsDiuoj205PIc53NRzXXZlIA3Rv5O7ndxH1VeHDmY7GfIqMPmTgYbTHjCcYnFuPz0fJ5zmka1QrkXWvXXyYoBBFtYi3frwYwsz3tTatEUQm1+Yibg7+rt0iRL6g1psQxw9P+CIJlSMXxS80bSy1L/Yb1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lKnGrLAJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZY8TvFsk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lKnGrLAJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZY8TvFsk"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuTda030542;
	Mon, 16 Jun 2025 20:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=xJPE363ZhvUG9q2q
	eByvj9PhorKXfvPWBM1P8DW/UO0=; b=lKnGrLAJy3VfwuLB0VhubCKqYNMCz71S
	/7zSYYn1/QhsNG1IfDkal1qfSHq0JSF72je4XRC5KRoFPH1BvXaDYnWWC6ptInVH
	arbz3eIpORg3f4EmZJYCCCC1iI4nYsOQp0X6GrI0j9EeOALmEiqFHDDpS/VOWWje
	JPS8eAMNfn9BVqbqO/oOybWWt1Iz8jStaNmYbZfTXvxcr/uSZI2VctyfTTcjWTjP
	JytU9aLxT0LbE9s1kPDEnqApaWBPL8GjZ41Zomru2zmnRFrlh4+T1mKlO+xbIDWw
	yrfvWiq6USyWqdVWLEOdeoNamoG26YkVrAdIcS8XXrRqeu4jD9Ep5A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r2wwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 20:24:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GJmTQB031621;
	Mon, 16 Jun 2025 20:24:34 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh856ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 20:24:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XsPneLFe6TKv1q21oSioFa9jJdlDOsWvdyJoBiW2KrqYnZdKTUGtqNIptCubNt1TH4+k1FtVO846sc2Mdb4O97wyG7ObBwUJFRhOjj9C4soQ36p39dddYxxWdl9+mT5pcEMgJ2EBXYJomxCEzH0jvaNQYBF/zRbxoLG0OQ3GxM91aqp+IlhM9LOmJ3CJATgTbmlYo2HjbfhPfkbTMCKhEWLIxUTQ4xSF7LB/ZRMqD89Al1nazT7vTXpbQgg5j7b7eiVkIvYHkb9Sos4gclBVpcYbBc1WQOuxoFusk2b0gsslowpMDAFn7cb/MZofAAGfy1J+fDYHV2HCXQk7YIaeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJPE363ZhvUG9q2qeByvj9PhorKXfvPWBM1P8DW/UO0=;
 b=ons418fDNd0GluIT0Kfxv6cwU5/oMesErpOyp01fbrGOr4eTqBwrikvvfVnaz/FB+jL/STxvyQAWP+Ql+SzkLVxTMyDfb/8rcmgcaBXc/gCvslh5E90hEmCGEhlvPcM5229jwvfR8KBVEMMvPqyT0R6Bb+dG0ZF7UnEUHKeGvASM1LIVel0QfyLI9g10mbc8l25769Tdixr2POmhGjXq0t1tIPo609kzBjUf7jTOiMCnoavvVQNXk07VH40aDxmwtAuMISV/eS98dQJWeYTBs+Z54pErblFqFGojoGMa5ZT/ypqz9eufJgZBV2O+MeikRlUd3hG9CXUIlspRHe8PVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJPE363ZhvUG9q2qeByvj9PhorKXfvPWBM1P8DW/UO0=;
 b=ZY8TvFskI6YG8Q1ozZc/2PcB3FmiiY/nmEJHE/ZpM5VkIZ+4z5LzGjbkgaKQXfR8ooVkE9RlmanSyuCcsBl4KwxnJ3fwmkk7RCBz1rA6mrVW901Mrd7UvmRoAMLbRLfteQ3PPvdR/bTIYHpxwXnzRii5xrsg8ZBW46n1JphsdMk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB5772.namprd10.prod.outlook.com (2603:10b6:510:130::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Mon, 16 Jun
 2025 20:24:29 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 20:24:29 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Zi Yan <ziy@nvidia.com>, Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Brendan Jackman <jackmanb@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH] MAINTAINERS: add missing files to mm page alloc section
Date: Mon, 16 Jun 2025 21:24:25 +0100
Message-ID: <20250616202425.563581-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0047.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c254f70-8f26-4009-0d20-08ddad13cba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PRFoWln2ZTgsFR3bXwcUd+/fECNhACHsykdV7mqZ0FCpZPj1E4Zmk7d50QC/?=
 =?us-ascii?Q?h8eAQjI2EvPWO4wAafEWBKcPBqyc9q7AZQhG5fe+ZLwWr6FKetL6cPwZAOv5?=
 =?us-ascii?Q?Rb6k/ZvPwjG4uyWR4PGIYkdvA1wXOxOOi4ecXo/V93HjrQxtNodE3Sqcm/0L?=
 =?us-ascii?Q?e8ebfaq+Dp8JOyxbaz8hK5CVCX0qGoypuW3ocsILy6s3b68aLDzjFK6nxSAi?=
 =?us-ascii?Q?Qddz/6Op67f5NoiGRWxKdMa7Mcu3nmLUWYdRyhnhGYme0Vq0f+kRVgN3IKmC?=
 =?us-ascii?Q?aX/qaMA2X5B9OcgjTKh7G0Ooj/ji9dgKiNck4sYpuJskWfkugT70qFpLipP/?=
 =?us-ascii?Q?mCHIaqQNJgOdS9Ug0buk8il9YMv8MhQamITTTMpsr6z5IMdH4DHDf5ZfFuth?=
 =?us-ascii?Q?ZLWM6OoEffDtj1PeaAH25hFpT1E+y2WxI2gTuce/tsj78XbxG3yDqlefcWvu?=
 =?us-ascii?Q?ts/8j1nE8++qixRBj0CbdbzDtFUk5fk7eIsglJwkeL1kAtYzGAcJJ0uCJOJj?=
 =?us-ascii?Q?HE5nrrg7cmeiGKGUUTsfjKJrvvsl811Kjs1RjI78AozysbyeWOBHD8TFYxto?=
 =?us-ascii?Q?ph32qzJPWDc+LCj2lz1utGVFiPOXRuadU11nhB47x8qorSh2+ymI4YoroTm8?=
 =?us-ascii?Q?ARt6gjt0udagu7s9zSyiwMc9tHxkkqYlGs8nzGBMQQRJA0PcL2OPyP/5Vdvk?=
 =?us-ascii?Q?CFkI/9eiwRXZdIAXVb+hQ8xgNKQYsB1I/FCpxdqI5YJn5Gh0Qn0LDNP3qKka?=
 =?us-ascii?Q?wts/nJ4w+fJJqK1aTpBMUEbUZt/txpNvi7GPSlv+Esw1v1LjKwuT6gpBQxzD?=
 =?us-ascii?Q?/YWdZN0LnHho1v50PdQfVcBt+VX6+lAfz6r1dGhXAsCt1uZiLBKzisxyEvEo?=
 =?us-ascii?Q?Wch8dSCJ9ZML50LmGsEIFuQpxhXHATFeYSYKEaCUVq/WGsZr0EZFSrnbE8V+?=
 =?us-ascii?Q?zIjFHwXM3XxrB74yrS6yShjyaoHnPU+bnU3SHlKyoLKV1xyrnfWhroMPERC2?=
 =?us-ascii?Q?vbcIDK3AO7h0wdZhcayHMHUPiH21B1hA+f0vSHHU6yVE5aW+QcW6KCcx3t28?=
 =?us-ascii?Q?94ADesJZvlxd9cRk2EGvk9vcNpwZTtWHRbYECY56aWpsi/9A8LPOYMG/eM0+?=
 =?us-ascii?Q?niW1JSw6Tbpvi6GVr9OUagDeZZDqQi8mPEKqNFLSVlb8+VfNMq0xCumrN/ET?=
 =?us-ascii?Q?GMdAS9Ejmo3dyKxGeo/re2TwTGzS8xZrAFJdAExI1HtK8gyss7tBfIHbc6cB?=
 =?us-ascii?Q?0eC4W/0JTzvxtxlE4dQOsn5L/aOmfmW7gmUSRDAdx4tqMHZWpEyYiLeAdhWW?=
 =?us-ascii?Q?hbdHGo++vslbOiy2JSbBLKPn7vqo+ejVhqhqTHUb/hARU1EFuqQaMvtb2rSr?=
 =?us-ascii?Q?UxbjI5Hi7AEWhBvbFsShdjOXtkf9AfSyOUcvlyTVEBHO6IYqcELZODuHX1ld?=
 =?us-ascii?Q?mYItneM0VcU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9LnEUxI70odOVmtWhU0pdDVAPMF/BqKrSdzJmegl96VeLqFHQ8+1MSS6dwKR?=
 =?us-ascii?Q?ZlsnfDuxsRJzCnJNf3EnF1WapRdKx/QF9ODGxK7J4rhdQtkidnLeKPvJpZN/?=
 =?us-ascii?Q?GgZSoZHB0NSGuumLY1NaTdo8LS8vPazVBP5FnZuqpxKF5PSibBOYCv015Tjz?=
 =?us-ascii?Q?EYBhOA/RzItseSBQJBP/oLh7KFyXiZ2eMEA9ix3Lxnbk/+G5wKfm5aU/Lxew?=
 =?us-ascii?Q?ujvTaQt+ufnWQunfe4sCnZaSvd2OmMiXGADgon4utwHMRwPrjfnMxdCasN5d?=
 =?us-ascii?Q?7Jm4WW7z1WLbjqF8dWYKBBb0CgG5PdpwVmLLUYpH+hxR93z9dqkarjRJ6ym9?=
 =?us-ascii?Q?sqDfGD9FcxvLiYjxlEUhzXCT94gd56FmtRfID2bWjqnJDrYrPpYzI1hsFAwy?=
 =?us-ascii?Q?Sawq+8LN2mm+8UWvocvSMxTqMooDyYpaPl1CZljLn6+EHxIJ2ttwnA6b/JI9?=
 =?us-ascii?Q?QHf1ULiuBiJkxC7HhhS0eqntdjWIQcZ5/mYjFkuLWLIOFx5XETw9nXYLRKfj?=
 =?us-ascii?Q?q4CFrvDPMhrUhbThwSFHSBJZQwDxNXq9R7q92PaNzoJyhETij6OAglhdPdsO?=
 =?us-ascii?Q?smRcfkCV66HdNKWv7GdKPC/LPQEIQFrka3KrBpm10dW+anoyFTBVCEUAUbdz?=
 =?us-ascii?Q?VKvcI636tHGjMaxFjSqVbeh1AuDxbiiqNIm5rDVGVZLlfNUjS9OBdh8NJAxE?=
 =?us-ascii?Q?WgYs732r6z5rYUPt6v0ipvW8/F9KfMC5uyQDZBiV6Z/Swovd3r/aOgYc8eKE?=
 =?us-ascii?Q?fbP1Q/Ugtgg5rQvcjPUpBXUwN7sv6zQcp/1Ai4aIukNuzmmtcd2L5BVhiYGa?=
 =?us-ascii?Q?essFmx8SjqMpR87TC/n1vzGSLyy+/9vZ4AvI9XTCqppkFMXwQi1lnFVstE5P?=
 =?us-ascii?Q?Q+A/Y1777rOVSv9MfiK1RUGnmpPPspi7Q1/VVs9f438tGhYyhG5hRDisroD3?=
 =?us-ascii?Q?Cb+73QUhxyNwUW6Fj4XLPbZ0knPW6Fny4+lsCc3BYChLSiTnF3b5gez3Yh57?=
 =?us-ascii?Q?TVSOd7AFgvhyta+TXyHVgg8gsFGuQRl8SYurJAnWkURqZQIkfwws5dAkZbXl?=
 =?us-ascii?Q?VBgluzbPQFe7Mqxm4KJU4gq62MeY5CkGvJLP4O6wjqfKETIm6X1yXVLhiqAo?=
 =?us-ascii?Q?wI8oebusbUspMrZmYz5K5N5tWAUnjd05ryrNE5H6LAaI5kMI+3n/tn0QwEKG?=
 =?us-ascii?Q?aUfLS2xD7nxSATBqFnQYW3Rwi4IVYIlr+l0HqS8sNubPTk9gqJr2MkTOwMC/?=
 =?us-ascii?Q?jVu/GdSrsSXx/qJKJSgybgltw7K0NTmNPIMjvYgMPbmGFFyjgNDA7olR/qxi?=
 =?us-ascii?Q?Ic4G56C3+/z8FpGw+3RY5sXsRnyAzZzJNbMM8jUXcp/OhgnaV0wlyilTNX4R?=
 =?us-ascii?Q?2Sbx7IXbiznDBUUCKXITmIwsmLpnE1w80LH/ElAs847oi8BMTUQuyXmm4pSP?=
 =?us-ascii?Q?xRkx/914+pL28BU3kzKzYYpTejtKNLniJ5IDxsnTY5fh4Va9VJWecO5sLJVi?=
 =?us-ascii?Q?gkAd8iqv9tyrpdTcVHKtQNahsDu5rui7W7f/WPku8fE/0sTzzg73zi1JVN8j?=
 =?us-ascii?Q?UgKGf5n5e8IJ3/6DeHnZU4t4yA6WwS+wO4ul5+tv6tPTZoh3YJ+8EtVWOdpI?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2wPW2kUQaQ8p++7m16mx5H2u2PaU72u+uaoBEXnc5vK1IVz+bONdWCghZqBjRpknHgsre1trgKhzBonlaR2Txy6AElNrwSUqN+E1XkyQ3pTNsdLWMT4xp01dPDxpNj/W5KzWtvHocyH5aug1Sy3G8HACFYUlooCaDhURMYaH0utC4u9LIyvagIvnxoTNlIcbHSv9Fsd+8JrO2CT88E+JoMWFXLtO0Ze3vrjaxtuLJo9ak0nLHPfajIrs0h2EzYZxfzuCm+SniVgpjMK7TT/LSUNBYVOb6jLiKO64leKLCft23RdB2dfuiXiNgvC49FI6Apd60thae39ZTyzi55pDJfhTSYV8nQHf58LLjoakpw5blpQu9nSnhCNQM3sN589cWXMQ3RaX4eIr6D9fiaHjy2qc8WdGgCOSBDKj0geOTzYF3w2/tSaHwA84183lKeoYHojSiQoyxYjIUD9X4rWoMJhDGASyStcRSeWs3OdP0yPftkrECDvmVdJH7NP/ieKr+5YNkDC5KD16aiLsMbXu7ZbV9KpXtyduZ00j11iyl/+t0nObpFFGP9uXKbIDqd2rd4JZ58PEW5PYVo6auk/9Ro8m6K/787CsT2U9nJpR42E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c254f70-8f26-4009-0d20-08ddad13cba5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 20:24:28.9752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OR8T3JaDtCYbRDOvmARZvNHvmwN/IIxqLO17EWhXwzjVWEvFmL/+JPneidCJUum2HqeWwN1K9F7oy62aRtEqBH+MyFCRg75xfgML4jP0GRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5772
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160141
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDE0MSBTYWx0ZWRfX0k3z56jPOs99 nxVyfX64GO+Yx/vE/BT+0MgFI1k5QcsaYkQHM4mLXWHCNzEdk38RXSH7dz+ohFahQNbWd+WLZQm NIEIIopeHMWwicN5W3VWkTLoqKPWUb9HnrrpTFfvY2tAyvD+E1H/lHQoXRSiYzPT807DzlhkB1+
 Pw3nghkvOg4+KknRUM6gdNLQ/Yb/2YZa4gEd4/Xp4Dt3OxOhVvDMjUWQZe8tD7y6WPGn1cHFomX QYzfrPbxgXdELFqQt9RDSbrGWYIEdeVuJufwfS4DGRIruBbWPhQeu9ROfbCQo5q686mKEr3Wyri d2XJoTyH97ntCwTH9gQa8PX9ZFuDlyvHnsX7q4IHFgW3+WQGy0kyJ4GeQZHweFK3CKOQF0fWPm6
 4FJC2HfdRT+Zd93aYrWPYVtSz1Ixtjkl3BRodmpWzcpHfUh3rdaIwLR8PwktKcSoKPlf1v1q
X-Proofpoint-GUID: cwF7Kfjv25xuwPo9cblcNPb_D5SbjF45
X-Proofpoint-ORIG-GUID: cwF7Kfjv25xuwPo9cblcNPb_D5SbjF45
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=68507d83 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Z4Rwk6OoAAAA:8 a=s2hSWIIl5NW7w4-vmdMA:9 a=HkZW87K1Qel5hWWM3VKY:22

There are a number of files within memory management which appear to be
most suitably placed within the page allocation section of MAINTAINERS and
are otherwise unassigned, so place these there.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
REVIEWERS - let me know if these seem appropriate, I'm eyeballing
this. even if they are not quite best placed a 'best effort' is still
worthwhile so we establish a place to put all mm files, we can always
incrementally update these later.

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4523a6409186..58136a57b7a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15856,8 +15856,17 @@ F:	include/linux/compaction.h
 F:	include/linux/gfp.h
 F:	include/linux/page-isolation.h
 F:	mm/compaction.c
+F:	mm/debug_page_alloc.c
+F:	mm/fail_page_alloc.c
 F:	mm/page_alloc.c
+F:	mm/page_ext.c
+F:	mm/page_frag_cache.c
 F:	mm/page_isolation.c
+F:	mm/page_owner.c
+F:	mm/page_poison.c
+F:	mm/page_reporting.c
+F:	mm/show_mem.c
+F:	mm/shuffle.c

 MEMORY MANAGEMENT - RECLAIM
 M:	Andrew Morton <akpm@linux-foundation.org>
--
2.49.0
