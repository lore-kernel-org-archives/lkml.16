Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BDD20299E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839162; cv=fail; b=uYTjcbWfI3kfmDSzFoypbejWJKzTUOORDgRgw3olNQnfCBTLdJwuVfrLB723xYkrrCQGDBK/nvWJ+l0OMj5f+LmZQmmasI0fMQmItCQ7roAXHJdxOCuA9qVMLh0B8SNRej2mvcHK5D1xdWBhuQfg/YPH+Wy0lFDLzk1uC2YdN/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839162; c=relaxed/simple;
	bh=rFZWcI6qAXp/RHpuAR1n47aQE3JW7DyMCx1W8H31MUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H7sjqVNBq+1GinJCAae6EzZb4ivwuwaY6nKaRmFHs1+Z6lW5ZTJPBg33JRiSRvLVJuWBbHKfnezQqcrLgeizZEbD0aINvwgALw+AFLM1bx6CZqbSjAXU8qxk/m3YNUBlM0EpitKdmFsNrG0VZ/EkegsV7uTYuQbrDl6eYdnvvMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=P6hsTb5r; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HYGFSMbF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="P6hsTb5r";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HYGFSMbF"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P7fr8c012733;
	Wed, 25 Jun 2025 08:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1qSTSqzwW39Cv4Fyce
	n/5wJKrpAscI9EHWIZ/1LqN/w=; b=P6hsTb5r6RlUGn2BdruMoJB5Bawb+pO+hN
	ka6UaXDGWAzPTzJL3PBoXm1rEf1Zn7yOUz4eNg7qCQmSGa7uJDWhVHIjYlNaFyqb
	K2iEC85AXbuIwWNkgLqzJ7JJU0sR/etfBdOJM/REfi3FnoWj25WPKMdT5I3G0bgD
	IgZqh7u4Ppqr6bVXq/vmNYVyMFslS+npYuABBq+GSO5namNRfqGzzXngKg3t3Ufp
	spykKdDpF6mr2S7x35oSzQIWOuWasFcC6IKWoIhMWUH1l2eW3ylxTZpnn3aE82rF
	C9RmxB68Vy5uKUQ5E9tvsOdy+8fXOmMC/3JySaxHhX51DRiA7xjw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7dqda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 08:12:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P79ue3038973;
	Wed, 25 Jun 2025 08:12:20 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2066.outbound.protection.outlook.com [40.107.102.66])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr5rdb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 08:12:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSWSNI1b8wwLmc+nttQqDERo6vt8Xi9q+6WVMIx3r5uoX/8QFvFKEHHCm6qDdCbuFij6j2LmvD7lNDGk7sWReIjBWz15f94vc+UAH0PxxSDE2QmXCOu2TO9Mgq41gLXfGCMwXF6GrsUBURr8og8mDqsmCrGTcrkWMeWno1lo1QtN3+XdRa19CQMaOuxSNHAt0V1/Vp8ebcJWwJRtKtv+J56kLulT+gpLpNwer7jvrywhVslfeTiVnZFaHaE7JO3dxx2tI8aZgByQri7dDWTuCBYy8nFnY8d0LC/MjWHyGf0r6/Fy2YlP+IgAxfg7OwEwqcDaAuDjBHbsIYdxR31RIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qSTSqzwW39Cv4Fycen/5wJKrpAscI9EHWIZ/1LqN/w=;
 b=d0ZI1b7utpmK1GtdtW0W+QodTvEA5Pds+EtgDfim5jenwWfNsPdblvZiY/0pD/CahuBJd6LBK/Olq7XLXbaUDYAe8fhlcdLiHed1/2SSnWsYAeGRPOwVoMHF5tJDif35ZpoSokIM4+1qDEnl675+LHIiHVC/x5DSBIrFBm8EbTuEhhl6tsJEGRc7tTaFqYncQbfxQsbEOl33GoxjN5ViX1sMwzpOc/MZYmIllMyeAWo+QgxP7iOU6Pq+XuiC3fB4QqYxViFidf4Buntx0RIfMD7Evh64xP793hhtuCymFHZ+MAR7ks0zV0sbixC3AoFKPhUtKb66AHJAPtSdJ2cChg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qSTSqzwW39Cv4Fycen/5wJKrpAscI9EHWIZ/1LqN/w=;
 b=HYGFSMbF4fj/zaJr9IKFctIsMYnnDkF3UK9McL7Fla+7d6gtok0gZtiioCRdQsFYL+n6LFv+ol1cTBJK5P9iYlVglAeBSJAHSyxPbjAmC10hmEoCwri5yKcPuMD8AFO8lfQ9dpHRhe4k6AlfrVPpsBKcbL48+4++MdQLZaGy0ZY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB4891.namprd10.prod.outlook.com (2603:10b6:610:c1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 08:12:17 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 08:12:17 +0000
Date: Wed, 25 Jun 2025 09:12:14 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Hugh Dickins <hughd@google.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
        zokeefe@google.com, shy828301@gmail.com, usamaarif642@gmail.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
Message-ID: <a16071e5-ae97-4e1a-9df8-f353f6b319c7@lucifer.local>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
 <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
 <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local>
 <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com>
 <01d679f2-fd64-472c-b9dc-ebe87268ce82@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01d679f2-fd64-472c-b9dc-ebe87268ce82@lucifer.local>
X-ClientProxiedBy: LO4P123CA0196.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB4891:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d207032-0eb6-47e4-857d-08ddb3c0005c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XIVAiEldKrkWmnUMM8TRm3e2EPdJmciic63uHVwzOnIjARF3aOqDwIJJ20Gh?=
 =?us-ascii?Q?oJTD5JVqvYHNPZyi1raozTjeXwkEgoCTzOCQdyW7nv9TQLZDND9IPwPDRL0R?=
 =?us-ascii?Q?pnBQjaB/snZBolUNxwmg5QqWaNPqTTZrzHbjHGm4e1CxjOcTOPTGbsfF3+cO?=
 =?us-ascii?Q?m+ypShNKQMZrFZ2aqFfWEnmwfJr10pP5n3Jvyl5x/lwHdJDuBlqkouPr1+IY?=
 =?us-ascii?Q?qdgvDRDFrxi4huE6oKCFG21DiPN8a14Kw3VsruKIRMBhNblhTF5PFTkedsxz?=
 =?us-ascii?Q?JSJftT3427BR/ZC4iBh0m5b6FFoSs1MLf/MZhAC3Tcz2QFbWLenyvyIXmnnv?=
 =?us-ascii?Q?kLXq3ZBDzvv95fx1uVrcWlaferp7uUP+nCb6Q4qEoVW7Qm3FE/wKTpH29z/D?=
 =?us-ascii?Q?OdILwJ5fqvyXi1nUXge/NVOn/1HyE8sBHyx+GF3ZWvZLarEeSc364sAG1QaR?=
 =?us-ascii?Q?xI8o2naN6x2IM2eIdpnL4A/zeUBmsZFfqogk7w14PazjcazhbPtANss3cMjA?=
 =?us-ascii?Q?1E0xjTi3Y+XtnbsuQH928hMtz++UXKG/nWHRV/QrkDMNYVsPjv7UTmBxyyCc?=
 =?us-ascii?Q?4+rBKYGbCOwlYuPbX7d4tlXBTdNbRei3Hg57qUVIOZXxgFI8EiEBBZLYMWvl?=
 =?us-ascii?Q?QubWvQOi28214CI2KUSkuebm+v4sd/Ees9JCE6D4snXYVy9doID3YraovD3Z?=
 =?us-ascii?Q?H2f5/0ZtF94WFRbhcHngMxJprFkalCVucnzVmi2AepfNRM6UqY6A+2d5ZTnk?=
 =?us-ascii?Q?CJ7s15EUdBzh4seCXiI5voS6DUCagNazvK07ixKLCHvo2TJMNpcIifVWuTGw?=
 =?us-ascii?Q?Bma5JNz5W7KGqdzlijB+0X0KuV9AUQxG8dobuM0uwtKaI++dyV8BdAXF4oJb?=
 =?us-ascii?Q?z083l4m8fls+fSs30C1lcTxr0oNako6u8T0iDFCJAjsvUOkfQCrldKs4TLn1?=
 =?us-ascii?Q?qDX13Ak49bBeDC3LHKZ5i0Fx6ogiLYsHaB8xgFYY+jcgxBcchJfw5BFsRely?=
 =?us-ascii?Q?Atsl5IF4DV/bodBfm3my9WSD1F7XSPoodiUjsioQ1BDjzNoQ7cjW+RxW+nyv?=
 =?us-ascii?Q?Kfw1BxMGfyT9Yxs/R13uyFUKKYeNOw4jwal33p5dD1ajGZZGbta8AUKlaBVp?=
 =?us-ascii?Q?GKahEdHYVeHD7espss+1EiEOWpOx8LDdrF4k6WiC2m0JQk1RaRj3d9jixGm2?=
 =?us-ascii?Q?0hn95arjlwrI21ocOm8s4h7n5gugeVPVSn6sElM+Mo5g5V+HNeUKOrRhew33?=
 =?us-ascii?Q?/btNXjpJeA84dxCFbo6SYMGMYwvUHiHiIXA+DsJUQtbGuA7Oqdrh5Vqz8yHW?=
 =?us-ascii?Q?oNanmRLy8jsX72HAk1a/ab1XtXwBvmMJmI76nGcBur4g8XZ8Qzop4vX9aKqG?=
 =?us-ascii?Q?kbHOrMWgkwDoCgmjfqnGCwcv82zXbzYFYlj6DWvwkliouPAzVA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6pI9vwPYhlII8psQsEGhdKZI/vcNXKvGQCkClv7aFk3KuyaHhpvG8rPzuT83?=
 =?us-ascii?Q?xnsc7pNsBrZ7EdMWdZ+zBxcIdp9koEQWt5RWnG8wssiXg9tcXtEIvRhizQ7B?=
 =?us-ascii?Q?J0f+ve5vWlmeUfjyF+ABZm2nx2mku3u9qG+OCXGd9/Ma1x94qdAlg1y9oPKj?=
 =?us-ascii?Q?k8/PZYvl/mAlcb0c4dTQ3fQZuQ1pY/UuUrh/Kop/XJUYVEmEHlMmenlSFxpY?=
 =?us-ascii?Q?amESPIxoQNNg2NXDmBWnGUlbyA5ZtAVWAxwts8tF87MSC7FSBAKDfoPtSYHM?=
 =?us-ascii?Q?UadfGLLpldWrq162qFl+LQZeOk/HkHgagOLcyhF1XyGdG960Q09t03eZq5Ug?=
 =?us-ascii?Q?OE7KEcgrrvH0kBugOvsY/SEuTiAoGeo563tUaVGZFqvdPt4+QYgBQ3Qbj9jN?=
 =?us-ascii?Q?yINscCkofNV4R3UtK3dip+1Eiuseon0vlCI2q4PSUrRS998Y4a/FitjxD8eo?=
 =?us-ascii?Q?oNz+WyaBm51qb0V87bhuN0obvegeHtm5TLOsGxp79TLo8u2b/Qc5j3qPtDs1?=
 =?us-ascii?Q?tGY3D5HI9zYSaRFT7/mEkNtY+l/n/9qPkKo8XEY7KjANwbd2TA3ogIbFLNwH?=
 =?us-ascii?Q?e58Kls1ghTkJlFwH+D2WhzGaLlBds807mE6zeCB41EICu5MdXrktvpyylsBD?=
 =?us-ascii?Q?5v1IH8WjYgcN7MevhW8X2DdmY72Tt1JnegnJ8OwVQA+gaf9aDInOHblZRH0D?=
 =?us-ascii?Q?4QkO/W3WVnY7eV/b9t3/P7u5BLLMJafF55X3MnX1V0YEd14mmjhbAyEEswkx?=
 =?us-ascii?Q?pAPCXbXL2mSWMbb9TTUTLu8c2LYyHi8grR/ICJsug3BGhlEoNuFj/CeCCIOQ?=
 =?us-ascii?Q?JPgr04KLoYGJCFuiA1o75sfzczlraGm0afQVJqvFkdY06Y/dIFoSjOykCURR?=
 =?us-ascii?Q?eDxRIwaWpePZ640YkWe7VUOHcfXg0KhMgYe4/fVsjUahS7i93Sai/Qs3Ps3t?=
 =?us-ascii?Q?ICSNcxSeZPUORKed9sec1X39ypiAnl57CQxKkUW7BpUZmomxa0zzgi7BXLhx?=
 =?us-ascii?Q?uZuYDOYaY2Fsjto2/Up8UCjTZxFpEntU1rHVTzWKCe4/HowCJa/SrxqbFhnR?=
 =?us-ascii?Q?W69GJaFdmyhJizi14sCH9+98ortmKJ9UQ9qbljfXLd4/+fO61l9RNhvozANX?=
 =?us-ascii?Q?SRMBiHIp6GBLy/pvLtTIRPxWnBV26bo8BxsRRcVGOnJDnU/qA5P7hZIuEFam?=
 =?us-ascii?Q?q9MyDnK/cJl85SE6i9GkQHL31WfE/+xOUOtSfc5Wj3NAZLvqZSEfMsj/Lh32?=
 =?us-ascii?Q?6drJyJTr7RicSGs6neAK2h/9XvaDDYHOEMf9AAHC8A2Us+NcBaEi6cnnv+TZ?=
 =?us-ascii?Q?VqzFdZAUZsVVoupnuP2W8yYW4bHpcL5CGe0QXC2o4d9RFCyl2T4jDHp1XRi4?=
 =?us-ascii?Q?L2gLUQ90zYg8OS5+U0W8RXVHpgpLdh+6+chy+PuBNsuX6kDMv1WHscQmivjy?=
 =?us-ascii?Q?N8iayxMy2W5l7k7hJPv8NB4XoG6OP8k5lMwNBwJyIoMf7wonrdudB0oxKAcT?=
 =?us-ascii?Q?y64ZI6CYOx45RIlq46cBtaUBwalwSWp7tBL/Be4/3onVhtbMY+xvX/w22K/9?=
 =?us-ascii?Q?sGfETe5Zr7yZ5Ahd6H2j5GO/I9hlTRBAq4BsHohzLWmhqMvTrKx18658qf9O?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/Vnz1cGpYqMOxAqTSA3+Sc6acwGgMLc+a7ddJgPrBY3MXdCf0B0BgI3aO7ks2vPK4sTPictmWyPq/MavEpS7Scca5WFM0uO+xyuO5Fyz2IJEkS1PWbFbX7VLnZZEIh1cpF0VRnJ3IG47cokpNg0KbK+yw/bshGkqsvMz1ZCaQlvS/RPB86Ne+Ntr1LbyeXwOm3+UDIEsg11CvpmtOR6DxNE1SO0+RPKQwKn6yP/xq2bwn406pe6HHkRp1DQVpX2HDTlrKSgIln/ylRBnPRaI4LLqUO6Skhmc1KyJWkjknB1hF3tyYFcdE//ufp8pFkQhIHROUmu4Ap8XizMdh5fPxzGCAL/CMJ74dgADvo9riCIFJvRRhpVxHZPsepPt3dRd0uK75gdDYVJ7iEH1LR+CaLOMXPQLEW7HQKSAHc0HVL/ykmaw8rsa6wBPxDzwZFQ7/hwEHkYsMP3FWTol8RxhSnm+vEEc6gRcdfhFR9jcDwqrjPjNHZf2ELLZuG0lH7KDUv7Fx8J3VvKFCRMs3bHaeoUKksjy351OskUhT4B7PUbgGEy6RV93qUorHI6BwGbgIzebj1PKT8Fji82sc/FDLM2QT7B2xXReqM/OX9kQhEk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d207032-0eb6-47e4-857d-08ddb3c0005c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 08:12:17.8508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RIKre+6KOXr8+59+494O+SXqTdq5WVypFgqjCPAw2bwBzTo2wdI0Eu+XByUF541sTYdz47rYYwZ2GUcuYQE7dfDiRRiUVdO3KK5mbPlqLzc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4891
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=750 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250059
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2MCBTYWx0ZWRfX/kfoUjlS/wuW KtZ2hg54l1bVW4d7hdu76LOK1sBiurjudo2VYSw/HYy9A1Ppw4CWiE3i2fnFclO7c/7Vij5gDKF jk6aP2k6IJrYewspO5EIfL34ix4N2yGz37O9oq1VAh3NKfIpDzAQAdZjzxzkaS3SWFlpEsEhE59
 dEgsST338dzMR7ILP70RxcXDRlsqjvGzRuTI0It5dupsThnMRz8U0Vt1kiQaz41Q6nKu+HcAxbx kXDsFPOLWnyJNEhvo6NbL/ib2lwQny3Xbt3QZ80++xwWYlUAJeBIJFSJNL6SQ6DmyGFv3LVKNRI iFCkicawGsVrHMH6hwGxJdz2XvQli77tDM55YF0adsfQf/tV+H+w31er1zXqSv00NqhbGspGIDR
 XpmKPYFtSN2Ds0dwBGqtaPja4gORFXJh7ErunOGPIln5PW69K1QkNQf6XdaA2RLMdLmS44ch
X-Proofpoint-GUID: 8x_upMn--AnKYCoh8lGWKLaYtzF4tEzv
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685baf65 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=I7fhwhowtrCIODwwFRsA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: 8x_upMn--AnKYCoh8lGWKLaYtzF4tEzv

On Wed, Jun 25, 2025 at 08:55:28AM +0100, Lorenzo Stoakes wrote:
> I suppose the least awful way of addressing Baolin's concerns re: mTHP
> while simultaneosly keeping existing semantics is:
>
> 1. Introduce deny to mean what never should have meant.

To fix Baolin's issue btw we'd have to add 'deny' to both 'global' settings
_and_ each page size setting.

Because otherwise we'd end up in a weird case where say:

global 'deny'

 2 MiB 'never'
64 KiB 'inherit'

And err... get 2 MiB THP pages from MADV_COLLAPSE :)

Or:

global 'deny'

 2 MiB 'never'
64 KiB 'always'

Or:

global 'never'

 2 MiB 'never'
64 KiB 'always'

Or:

global 'never'

 2 MiB 'madvise'
64 KiB 'always'

All doing the same. Not very clear is it?

We have sowed the seeds of something terrible here, truly.

Even with this change we'd end up with:

global 'always'

  2 MiB 'deny'
256 KiB 'never'
 64 KiB 'never'

Means 256 KiB...

I wonder whether doing this just adds even more of a mess?

> 2. Use something like the logic here to enforce it.
> 3. Heavily document it (I can do this).
>
> But I still find this yucky based on the fact that nobody will expect any
> of this.
>
> But maybe the THP toggles are such a mess that we're past that anyway?...
