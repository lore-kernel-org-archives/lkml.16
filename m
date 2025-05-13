Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C879151991
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747163385; cv=fail; b=NNGMP6M/AgFIVarviA9kGBsDsfjl4W4slaW9yj88CyouLusJQ89iXx0pEAxJNmWkV4mfWGV7U8nQ4/4aJymNiEhYzh1jc1tIia3gXn1nqAqUNEWNHBc3L78uFrwFm0AJkHm3ilH5bv0nt+zFvfE+FYda6OTxbQu6askPF8IpMbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747163385; c=relaxed/simple;
	bh=t3i2wBtrJN4IQQ/ahW/iHPq+N7483yK2QfIGekRusE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ktkx8lW7mZT399/twYG5wBfiCVIbRyFbbXDERN4cwNRg3X6MG/Yo8jaiXn5P/D8+eZ60uLsVGRlbBrHuxRxAQdMIptKZATXDc80QxQ6zlJbv2wt49onfE664KH2sh4nN1ApA2AQtGkibyLnp+5WYgimq/4B16qMY34X5pXiaXVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d/dG1jfi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qHhR5JtN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d/dG1jfi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qHhR5JtN"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DISbLg023579;
	Tue, 13 May 2025 19:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=kRd0QtNWdNml3Rmt87
	CQwu/WOuPwF8LUGb/Ii/4uQWQ=; b=d/dG1jfizjXyuqZF47D/NDbd/sJZHli11G
	RLaWUXHLUQoDgdmWr6QPzy1IfVZVDRfoZREFrdpwoGnt59bDYh3yONiH3zrVhtgc
	yhQ/K6PoK2UwEFVyisLs/iWda6H9uUtgDGhxG1HMBMXnp3H+I6eKFkkYGeqFvBWG
	dFAVYCHSCCqLW1lozz18quY6QLFxk1yj++oXUly3CsB8+6UEz/mG8MabcWXuuQVb
	//6/tcdTM28khSQZsgCeKlLf9t/RaZq7L5GVOwbumKXJO7wnAJcGLC4HTDD6juNS
	Xue8LcfqNKszIT3F88pE0Gnhje0CggNB08wIg+fwZ2jQ0ra2YAVQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcrg24n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 19:09:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DHUxQg004460;
	Tue, 13 May 2025 19:09:32 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazlp17010007.outbound.protection.outlook.com [40.93.13.7])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46m9d3ycy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 19:09:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RcBPY4TbZ3tdV7dhrTfSxt9gg2r6Y9eObMSc517ecFfagzlUpXcD2cfjiDsAtpX4ge5HreF5FxA3137I//dL/PIXKU0/QCwBoczJyIJ181MJVrxAGvtuHS5+P+kilkHZL6lriCrzrC56E+eFnUMbctV9DGbVValD0sDF+eZ+w+pf8aWif2EatDZCdac1vjhrbi40+t2mLvCNMXI+j5dJsOAsxQCesA/7NzxrPG+u84Tj8BNlXg+NiCPPWy9+rGesw3x6qpmA3w4T+XMrA0D4VxuZSzVK+8jellxd64+tCMT1w+LI9TvRLUmhiwctGiye25crWT1hih1wL+vhDofmkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRd0QtNWdNml3Rmt87CQwu/WOuPwF8LUGb/Ii/4uQWQ=;
 b=pfAYJvfC9YQLw0bGg/CChrCfTI8k2aPR1n57gIQHsMsf1zUUcxUACIbKUUcQWdSQ8fwj7kzbM52QzbhXVJlTwS+kKZ8jg6ynmpYN+4iOY94GzZ/mRB3JigDqse+XNkaX+CM7H+RvzBgY/S66vnpLQuVRBT3TZ+k2WjpLw0r2e3gNWTDZeDaeP/LyhF4Y8eRGDtReT7ZrxOdjD0Yyu8xPCdvRA4L/VgLYomrA+2MUBA1J/nkeEU27bSVyc+uykK5u4ewErTKJV7h5uzZZb88uDhbBcb1b/HDb0jISSetI8dMOyz0BoxRNTjBPqPlPtomHeJL3NM60uta4IEPdaQdI0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRd0QtNWdNml3Rmt87CQwu/WOuPwF8LUGb/Ii/4uQWQ=;
 b=qHhR5JtNmrfYbyXZLkxzfgKecQnz2Z+HDYmryN0f2201aHvtR0rsKntu5dhGO19DT7d8BAbc3fc3eFV9tNSqGRMIcamPNLpVAcztf3fA8uS51lWouYd5U9/UOKvO3Zlra6KqnBIEN2MfGK60K8M7nb76b5XehCXhWLJfzOW0QvM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA4PR10MB8729.namprd10.prod.outlook.com (2603:10b6:208:56b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Tue, 13 May
 2025 19:09:29 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8699.022; Tue, 13 May 2025
 19:09:29 +0000
Date: Tue, 13 May 2025 20:09:24 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, xu xin <xu.xin16@zte.com.cn>,
        Chengming Zhou <chengming.zhou@linux.dev>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm ksm section
Message-ID: <561581d5-4f29-4e23-b543-09960118da9c@lucifer.local>
References: <20250513161758.136402-1-lorenzo.stoakes@oracle.com>
 <dd10e199-e5de-4c4c-a524-68091973de7d@redhat.com>
 <783a848c-f9f0-4f2c-8d6f-46d2765d80f7@lucifer.local>
 <ae22b0df-f4ab-4567-b3b4-35c1c6b5233a@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae22b0df-f4ab-4567-b3b4-35c1c6b5233a@redhat.com>
X-ClientProxiedBy: LO4P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA4PR10MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: 514d46f2-49c2-4437-2e29-08dd9251afd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rFApc7YwJyo+F/iQiaolYU3uMFNBXvyovvCB77nWsE1W6UrJdC1AVvgOoT5J?=
 =?us-ascii?Q?rfmrbXuvfHbiVxuSzzGFyIPGN06dJxnbS60I5FfBnEV6j4FAp1YpDAFwvOqd?=
 =?us-ascii?Q?Jjjc4ReSgBldr29J7Mn8J3E4z+NxNLNN2zBbyogpYFgDMs+E0+es+ehWY1Zz?=
 =?us-ascii?Q?hvt6v88ucB2/c5KOhjBlVbI6IgJGUGOsG4ajxuzjMHosZu8qZ//NmEXotbDx?=
 =?us-ascii?Q?ohgQ9jC2I9KZLR7x3WGPCpUnLFyJsHp17nyPXK3DU3O5jOGp/ndI5IaIGUFV?=
 =?us-ascii?Q?JeN4DDeF85koaC1Xel1u4QfHJLuF2fW2a/+aygdIL7ZR8m8rxNi83+gsjQWu?=
 =?us-ascii?Q?FXe0JbJSqyRKeSjjN9tsJDei2/qux/JxKPX6FflhNXFIkA6Y9KpzZgfURBvZ?=
 =?us-ascii?Q?jPmC2mZTgphCZGFSIC1XT6/R1KPvJw9Aq2mj3ry3emQwbc7xtfGm4MPX/IKC?=
 =?us-ascii?Q?CDXUAC+E1DCSGibdAZU1R+uNDzzl4HQ92B7PXa2zBJgd0JaaFiugJ2zsbAqo?=
 =?us-ascii?Q?qIlX99FE5dzSxq3m7n99/dl5+ew+f/XozFBzY3mcgijy+4iw47t4oqXSPjtn?=
 =?us-ascii?Q?giBSWFBq1DXQEVc50INoPLuI5+3KmqN8mj2iCwcDY2TJZNZOaywK80jtniIr?=
 =?us-ascii?Q?6lxiPqpoNVLnJQr7sKyEU1oOrN9+hvOcv6C355kLE9AKPqKujtaMpsNemsfQ?=
 =?us-ascii?Q?IfGEcDH63qMFlYPRGyOoY3SldpttgfVTDn705M1nx5KOEvkDKmlhs2aYcY+O?=
 =?us-ascii?Q?xeHjcytvLPTr2B85j44kshqtWdapJSk0xYEmiD8RHVwQteyuq+a/aTzVFbe+?=
 =?us-ascii?Q?oEAloHK7mMVTIijQR32moK3aUYfYW/UsEroffJWXvAGPuZldtvC4XLH30L5E?=
 =?us-ascii?Q?TzAclTB8x59S6uEF7Aif3JZZQj3FdjpALGgkdmhPabonUUCZRWKI7kWKsXMX?=
 =?us-ascii?Q?06GL7WRwHrgrMIYpX1PajRGdzQY/U0ASpJBZzWQsauWXYPPvMWs2XtE2zQrT?=
 =?us-ascii?Q?SQCwqTPKo/CvoXqpP7FPqnMMoOw4WxU8Av45mwHnu8DqYy8WFZ4NwCUG3cJs?=
 =?us-ascii?Q?EGcL6T19qHHEZhGt6BV4UeDpxaKOBzKpSgBiYS9uQy8iPzGLfcxygSkMXZcV?=
 =?us-ascii?Q?bE4/69w6CDJSszI+gCH0GOXMDHSpd6X6iSIh7klndTJy3bGT/81Hku6HJTfF?=
 =?us-ascii?Q?ATbovRIbCIL4I/QB85UK41gt+yEUzi9MXX/N42BySuzHfYBw4dBoXTHVXMEy?=
 =?us-ascii?Q?nTbOcA2lfxfUm2hsIeHJmxP240oiIvzvtatewnwyfxgrUFiKOwiGHrRb2LtN?=
 =?us-ascii?Q?VuGr3o23YfVunK4R4LTJ4FNOlD/fdGQbYmmU8lmJd9mtMYDJOp0UKAnQ5wDw?=
 =?us-ascii?Q?ijitHnM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cm8R0KEA3F+xIyiBIkM470ONZ+t78XCkxtELpZMG3F8gBfkSK11bZbarzMhy?=
 =?us-ascii?Q?UBoRDRD4XjS7Hkm5oRtgwkZ18mosR6K/Y9/7UaKExo1bjk69/nDAKj8zmh/f?=
 =?us-ascii?Q?xbOd7UlsPF8B8DivwjgV6q247pKINSIBFmAhV/2uphCW0idLhAtCPTofKiG9?=
 =?us-ascii?Q?jaTrp7ey4IPelYasyfZnqPp4eqvZ0dX3HDxC9/FJrbcS4EKWrFSPUFcqO/sj?=
 =?us-ascii?Q?86mTao2b/zNs4yhBeKwQarfdr6BAeLzlXUhNSlpbAYtV7VgKPskvXzNF0KPQ?=
 =?us-ascii?Q?IntLtl1OOHLPCrF2iWncUPc7TbFoA8hjCN5K3BnMNsvjJsK0DIzwwUkKG0TQ?=
 =?us-ascii?Q?EF59BrP0FVQnxhNeixPqwq7jxyG9t79N2EvjwqkcX4ncIz10/QtzwMBQoGgv?=
 =?us-ascii?Q?/4Llxzd5LRMk3Q3Mm70vKoHby/Bcz9RfoW3ZXcD4lVhQ8vP/v5pH2RmDv4zA?=
 =?us-ascii?Q?aqBM6DwJV+AySNQoIRkxVUmNmOnbPjLeHMN8F1GjjdJND4++++Ti1u554lKU?=
 =?us-ascii?Q?UfbhdAMhJtIPPBa3+0n9/p7uO/q6xI3oxbjrw25MgkXVLAnrF4AMZEmsJ1OS?=
 =?us-ascii?Q?2klSshDC+hxrKanGpjxbsKsfWgFj60gfSwJm/k9YPUP18ybxkoKmaMCbkt7I?=
 =?us-ascii?Q?XstpQozmddF+pusSAerz+tjtpeDqZw1yGUIToBNHipfH461AkszEcjT/9804?=
 =?us-ascii?Q?cBvgnL2kysW1V6ujqwpMVmIbJgPRWm+/SKTOTYOYnAh5+ZpLRtxF2GztkDvV?=
 =?us-ascii?Q?4byHx8xNY9xXyDcxPBsDWnfNeMrAMTX129CB0TjrxTnOY4slW8oESyqChimg?=
 =?us-ascii?Q?WtS21/mICHFV5vzL1NMR/wa+L4m7cl7XudbLrKKaSqDD/H9xuoqnFnLgnbDp?=
 =?us-ascii?Q?cz7ddjFWm37aqZLFJzap0Lw5xQHVMmpa8pN6v0xbAyFyACQi6/MnPdilJKXz?=
 =?us-ascii?Q?m/Dn7ik7drGvyLpsu+eYNoD96yYFM29q+Iil+Ipp8xBslPcMlY2iiAdIO8fx?=
 =?us-ascii?Q?j1Hp09hmszsG6db/fLF8IPxqt3NS20QAk/lOLTUtAA58B6xcMpUf0aKmMfEc?=
 =?us-ascii?Q?bZGv0cF2lqUMCh2aPi4A+muXPMlpnC0YhuYpzOuBe8qi5QS0sf5EaToK1fPc?=
 =?us-ascii?Q?goVzmCWfjYS/6rUU7l/UpLt3dDeiCJioHkLF81RG53kbuwKC+Cmo20HPogTD?=
 =?us-ascii?Q?dbKz2nHTysjcGF9y3KPOxEBVQ5NNRbdF5IsXv8fL91SOz/1pG5yQ+GrlPd7+?=
 =?us-ascii?Q?V4e49Yikxg8AntIkS5oBPlnOmGfNTtjr6QJGzfGpDB59tr8g+gWgrOY4H2j1?=
 =?us-ascii?Q?QJus2tdtzkj4S4bBCugGW3020m+DGcV3fKBwfUr2gHsbpoi2HaNyqYm1RoDx?=
 =?us-ascii?Q?6JLxhsk7ozXN9zWS03hkzm2uaaQ0vqAKWeBzLIHGu4YaMy34y3xix+Y1itfY?=
 =?us-ascii?Q?PRj77bfwlou2JjclxTULHfSwCftegnx9Hw31IoORo+ecZwOHBGLcmojqBpIU?=
 =?us-ascii?Q?aPV5ZScNhxW0kTapBbp0QUo7fWv3XQNac7fC4mgHAiJkrNSFMqfZtGd4sLMl?=
 =?us-ascii?Q?benldyP9umFkpGaHWI8l+YtbkEGLzbrynRRhwqGW/kyKEbIrSgxE6RSUor8J?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EfK8oR2erE9F1y5WsJ5g/jq9Fy7MKhw8VhEKEfBnprZixx37LIY9+Atc5mxfW2z2Ofx/Fv30i7q32zCOrxK16tUC3XO3qQOduX1BkygiCeETlUNUx6SC0hr7IYh7a7A1Kh/gA/n7OACBeMMf7dFKdKd3WonFrZLbem4e3vaJ+pupSFkHrg0cV+hn47dxDJ/Isu4NqfAVseYvibQNofdJEdOsVTwiekvpXpjV3bhXm1GfTTkrmTj9pPfC3/tZCnNdTYop6b7nRG9zlIIdVldbsgYu33/wD/Pdicaur0XoPCx9gRoa3WQtdZdvguq2XZMnhi2MDr6bJdo0LK5Lr3E5J90cSsnbSbfXIjAwAhq62l6e5vfNDEV8sG+2tV8jvgJzoL5OxpxQlb+e3mXq2/YtlapndCfv30UY6vk+bLef2ztTz8JRHx5f6+0F2A1onD8d8JFTgL6ym1S/ou9+AlKlU8nQ/FEaf6mdk9nPBbLAZ8DD7PWyKF7PcOswR/+3fM/kBAVU3B8tkYFYstqDwtqycFJIQm1yA8Q04VXHpQlzOEVRsDqbXzeYW4PwEy1qZq31va3LicDcg3OVYOpUIVTITFEGxwrh4950ibSyS9MBOEA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 514d46f2-49c2-4437-2e29-08dd9251afd2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 19:09:29.7240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wv/L2DG0lEVRjE83zImva8vBkvdfD+umK01gKDbPoJOBmnDyB6vr2OGPE6581Ie05+Wm0CCMGu6zd5v55LOBtqFyRO2dNa+q7KirD9KFMTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8729
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505130182
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE4MiBTYWx0ZWRfX3Qi6T7EHA0C7 ohFVh02qQs8LUSR/9jIW6CEX/qaPd2QMA9XH+Huf5kaOEPGABRfRE4iACRnm3qum030A0jiY3CZ tR25nMJlY8hl1UWZVMFHh8GczuNetxIhwLSlTZtdoADPs+z72g7xPPa5pp3yZhVNa+s/CK3QDFU
 KWY2z3viGbuK7QaDjpUs5msVWKQF3foFC0KoXpuBqjvte7McEGIQoBShSdQFMhabZ1pBqX9VOlL Thr3SZRK/9nB8M0oRTxk5xhW7uFn2eEd/2F1kS1X/sJrsXuq5E/1aMZVbmrzYyLjXPlgPJZFksr IneX0fMaUXMAbBkImrn0gxX8f0rQCkXUqXXBOIOt6uVKed0IZPjZfn/SrRaNWlYk3ScB2Qn7oNr
 3x0U5xhMPCpjdyHW//OCUAx7X256AfwRi6xnEKBIosIZJfNnuyzbRBQ3uH6px59X8OkWgcDl
X-Proofpoint-GUID: iIoRdCJHPYX5U7XFu1B8MmRNGcDnwVk7
X-Proofpoint-ORIG-GUID: iIoRdCJHPYX5U7XFu1B8MmRNGcDnwVk7
X-Authority-Analysis: v=2.4 cv=cuWbk04i c=1 sm=1 tr=0 ts=682398ed b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=1RTuLK3dAAAA:8 a=eNW2tBgjimq8FiR8Q7YA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22
 a=HkZW87K1Qel5hWWM3VKY:22 a=kRpfLKi8w9umh8uBmg1i:22 cc=ntf awl=host:13186

On Tue, May 13, 2025 at 09:05:15PM +0200, David Hildenbrand wrote:
> On 13.05.25 20:17, Lorenzo Stoakes wrote:
> > On Tue, May 13, 2025 at 06:52:27PM +0200, David Hildenbrand wrote:
> > > On 13.05.25 18:17, Lorenzo Stoakes wrote:
> > > > As part of the ongoing efforts to sub-divide memory management
> > > > maintainership and reviewership, establish a section for Kernel Samepage
> > > > Merging (KSM) and add appropriate maintainers and reviewers.
> > > >
> > > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > > ---
> > > >
> > > > REVIEWERS NOTES:
> > > >
> > > > I took a look through git blame, past commits, etc. and came up with what
> > > > seems to be a reasonable list of people here, if you don't feel you ought
> > > > to be here, or if you feel anybody is missing (including yourself!) let me
> > > > know :)
> > > >
> > > > David has kindly already agreed to be co-maintainer for this section.
> > > >
> > > >    MAINTAINERS | 15 +++++++++++++++
> > > >    1 file changed, 15 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 80aa09f2e735..5ea2020acf84 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -15567,6 +15567,21 @@ W:	http://www.linux-mm.org
> > > >    T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > > >    F:	mm/gup.c
> > > >
> > > > +MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
> > > > +M:	Andrew Morton <akpm@linux-foundation.org>
> > > > +M:	David Hildenbrand <david@redhat.com>
> > > > +R:	xu xin <xu.xin16@zte.com.cn>
> > > > +R:	Chengming Zhou <chengming.zhou@linux.dev>
> > >
> > > I don't see a single RB from Chengming Zhou, and a single one from xu xin
> > > ... :)
> >
> > Yeah sorry this is fuzzy but git blame mm/ksm.c for 2025 gives you _very little_
> > activity in general, a series fro Xu and a series from yourself :) Xu's series
> > was... acked by you :P
>
> Yes, 2025 so far had little activity (fortunately).

Deprecate? ;) (kidding haha)

>
> >
> > Equally with Chengming based on other files listed here, I went and checked to
> > see if there were substantive series as a sort of 'fuzzy matcher' which might
> > imply a review interest here, and see there did seem to be some.
> >
> > But obviously if anybody feels any entry here is inappropriate, or on the other
> > hand anybody was missed off, more than happy to rectify on the un-RFC!
>
> I guess my point is, as a submitter you expect that people that are listed
> under R: that you are supposed to CC would actually ... review? :D
>

Yeah of course, kinda makes sense right?

> In that case, I would prefer to have actual reviewers there. If there are
> none, then there should be none listed.
>
> Of course, If Xu and Chengming do *want* to actively review KSM code
> changes, I would be more than happy to list them.

Sure, so I think best thing is to ask:

Xu, Chengming - do you WANT to be reviewers here? :) if not, happy to drop.

I could add myself as a reviewer as a backup option in case you need review
also guys, though KSM is really not my area but I can approach from first
principles at least.

Cheers, Lorenzo

>
> --
> Cheers,
>
> David / dhildenb
>
>
