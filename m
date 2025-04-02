Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5D8F9C1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 02:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743562449; cv=fail; b=A6becW26FeDp2NFDq1g6ikOAM8YoBhqanYOBouObXGZHTS79G1sGe9j2Patc+1B/IkXVoxXhJime33JHcdAjQo1iZzAhPs8T10iVoI0lD5doO/9wXMWMtpEHgk/UMztIuhiTK7zJM4J8cq0VJjK0gZQ1WkLLsZ/B17hZee8GOIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743562449; c=relaxed/simple;
	bh=P5SD/lBX87+tNT0ZOaLAIq3YzltYRMekgbUxmRyfVC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hac0WxjVtWX5wQ0OtgcFrGKaYc98wHpiM6T5bwMQEcZ7zV7Ut6/02uxqSY0kH6b/M6UTAQM3SOzMP3WVpQAFz81FIvl0uLy2tR3Ox2yH7WFpBW3TwFs/k+JhnWmlpNYYGFELmM3rM/LrDHuXle71ugJrPtwExv0gSZR2IhWrWQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QdZjWNi9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=s2bStXeu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QdZjWNi9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="s2bStXeu"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531L2517006058;
	Wed, 2 Apr 2025 02:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=dg0JDTTth2T00WQTPI
	BAl0E70LhSR1viKDW1jrpPWbo=; b=QdZjWNi9UevtJcLKaYlbhPk1gIYXCygET/
	oiJa2bC+9YcpSn2LNhaIFA70V/sQmGUH1ubYX9a1WLEVn2Ns2GL4ZzqpWrlDP9+Z
	Rfog3Sraq/3z/BGnXVONsC+mf2FqHhijXCHd7c10puLgF6bhSiXPg8JNoy0O7OAY
	AKAteAgAHgZtmpISuD4nAOu9fXRlSJYeGtlA1JcLzu7MF1lU6KAjyip1ZLMGiZQ9
	u90exSkInkn8XQuObz09yNSTymzBP8w0KGhK0cJu0mOJNyV6oI1IO1Sv5JzEiWu3
	DTFaOQemIMt1D8xD8LQJ0bGaBLmqH8Kmu/BsJ3bKNYnxE/VNkM5g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8wchxva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 02:53:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5320b93n010771;
	Wed, 2 Apr 2025 02:53:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2041.outbound.protection.outlook.com [104.47.58.41])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7ag949x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 02:53:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMI0IF+ojkchjxz+Y0Ce3guPByAm32wjw08FigA75Twf4k9FIYJnzheAPcishxcdbWzMCdWtFodlW/aMLohpMBRpWD8SNcK1xn6FJBihSM/0ZH2UEv9/mprqTA2ElFXfin9XaOnTxb0JgGf/sYtcS00IDxP/cqzwFZkO+BJzbsppne9+ty7eSegX0cQSMVvZAaRzRwJ3iChHG6ViQ/zJN9incYxbGiQIOUD+vTR15q4J4G+4lDEG7YKcsJV4nS5l03zLOSnKoJORJt6rVXaEyh/3Roqf77jipGo09gFlu3HkE+J6BhMVd44lKUFGQBw2gn6gog3iIUQglTh4t9Efrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg0JDTTth2T00WQTPIBAl0E70LhSR1viKDW1jrpPWbo=;
 b=dTPhTS7wL2YjJFhzR3q33UC0D1J9Q3lh1yj5fidaOLAzLN3/bkJoXh8lGZ9uwFj4RThKS0xJvCWvcrhwaSA0FKfRhF5RPgt0vxOqU48cjfL19X5qvVklIm7un9UcKF9QljprPTVcr7S5Rx+UZM/Le8l8ZX/xhtXhoqyLPJz/Fpsm75W86f0ur2onvBoxcmVF4yjIyoAtzTvxUuRTzX1fJX0tJ8D29uMMlTi9zZy4EwZnRob3Uejcf3FIHXRxCLJ1baTCqcP/zrKs9AjIwh+GBJ6QOSFckrgcgsTrcyLiO0ORfuTPeVHQF8ac23KmEUAjlF491T5p0or1iaN6+yNK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dg0JDTTth2T00WQTPIBAl0E70LhSR1viKDW1jrpPWbo=;
 b=s2bStXeuAu02jc7cH2npaFODCzZcIhsv6DCMsoNroNtRhqMpuyLMBg0jpDRpO10zgHRFUPKvZgfn4x9581dkVqnrRxAY8dztBHm0RbK5QFvr8duCD652V3S1DVrFVhpEw0Kvu8XR4/PG8E9R4fpHCGUTHinS/WZnBlZF9/ydITk=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by MW5PR10MB5714.namprd10.prod.outlook.com (2603:10b6:303:19b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 02:53:44 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%7]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 02:53:44 +0000
Date: Wed, 2 Apr 2025 11:53:35 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
        Hyeonggon Yoo <42.hyeyoo@gmail.com>, mkoutny@suse.com,
        Dan Williams <dan.j.williams@intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 2/2] mm,memory_hotplug: Replace status_change_nid
 parameter in memory_notify
Message-ID: <Z-ymrxkuw59rl1FW@harry>
References: <20250401092716.537512-1-osalvador@suse.de>
 <20250401092716.537512-3-osalvador@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401092716.537512-3-osalvador@suse.de>
X-ClientProxiedBy: SEWP216CA0075.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::14) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|MW5PR10MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: a669725a-1bd8-4a90-a8e5-08dd719194e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l7JTchg3UMwXuH67yUv+ihR2aCBnFj56B1vyDv0VQUu7JxVZceY4ON5AApvm?=
 =?us-ascii?Q?ewHFeC3FE78vWbwhIuTjpEC58RyfW5DbMr3t7BkhStF2WAvgQMrc89bsVGg+?=
 =?us-ascii?Q?AetFQwfOOYpRWhQTRPmJ4oPfopaA7nInIkbpiEuZvHC9e1UUvRwoZ+tWQrlc?=
 =?us-ascii?Q?5ttR4GZlQv3KVlcjhJAx3RvO7Mz75L4XLJbm2PGHQrc7cf+jZGNRNIwio8E/?=
 =?us-ascii?Q?5SQlsRRQcsYXataZbV0ljhomIFTacejVVJk8HfRYPNVfqO7BhUi3RlqzvQgX?=
 =?us-ascii?Q?wpg0bdYZAglICGG0SFq6z+qLwlLvaJC+HTSVDp1eAZk+8nKo3u8WCzMDqcJX?=
 =?us-ascii?Q?vZjUPdoVs4UifSgL8RSCx3Evi9pqmubeq0jVALBpCt1fSlykt3TNAXLsN2im?=
 =?us-ascii?Q?gB9c9izYiZCyCQ04mnDWLK+eN45KZLe/8nzCtHTy4PthhqvLZSDk5S352+eu?=
 =?us-ascii?Q?b8mY5InoEatcuPbZIGRF8gjQCg7qBJ6LOa4Mt/IMjoX0fXaSxDb5d3uTtX4x?=
 =?us-ascii?Q?2ZDpxZZkEE3eh+/WuzA7DOoRgoizdfgsLTy6KNAuWOpTeG9JQueS6HcWMewU?=
 =?us-ascii?Q?CPwzl7QR0F2K38dye+2aJ22hbOsGkctxxbocSqJfhGKemRd4UxcvwxK/s53y?=
 =?us-ascii?Q?XzstLAgUnjeTHozCJjDLYw6mYdTJWIVaF3/EwPyEWHFrbhKqdFea53U8QJv9?=
 =?us-ascii?Q?+iYMH6kjh2jCNLoRNqzjR7+ZRtsJUTcVTQYl8zvGEF+rdkZXphBgmhVXiHsa?=
 =?us-ascii?Q?FqVFrp4iNVBMgluK00u6Y3iw8bh0vHYk/pzZSlzmqzJTpIi4x4u5bXUWAihk?=
 =?us-ascii?Q?b5T1G5sy52kCfzf6t4Os5nRhs5rYDh8/MyEfxDi8muCeVS2TVPntZWgnFhAS?=
 =?us-ascii?Q?Jo1rtTZ92k9Ljnb8DgwFnskoHA2A1/tXWFWWntYKB4uDCoL+AGZtgr2LWI5r?=
 =?us-ascii?Q?57c4CVrwiQRfH8cca0YDENVdH4cUOjQjZQg+MeQ4tcin7Prp1vpPth+8S8Us?=
 =?us-ascii?Q?HynXY1mZuS6xudeTJalLc0Eue73OWtKHv3FBe8OGLsHr3gWyW9OicMtrWegZ?=
 =?us-ascii?Q?uviDk95QNAxVuoWUH9exNNfucSQ6tLSQc79D+ciSbeVEeARzNp76oNM/txxd?=
 =?us-ascii?Q?4BwhERBA6w1rXWmF7FwG0DZXzIJ9iskYmBBfQsr0CSQf/Ftc77JxP6v8qPRB?=
 =?us-ascii?Q?1+rTfzVAw3RuRLVwbwueHtgyvlRXLLfAf8FNkkuc8uoDwHLLu+hnpuOLWmK5?=
 =?us-ascii?Q?vD8L+44vIDbroHKpaQtls814rw34Hue/20e0SMPvX7uGaKhLKOHMlVGuXZRg?=
 =?us-ascii?Q?v0yYpQvvSuHs+qyHsjWXRaHo/DG5GxuwXD7dGu5F8h8J0A2tQP0I8QXX9HHO?=
 =?us-ascii?Q?e0GyLBTrJpUc+UBOoWRAWZ6GKS1c?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?furYLddTZKlE+jMTuty3kV++oRzV6PzoA1Wf35/ohRfqMxoKVsCISwwPzzFK?=
 =?us-ascii?Q?vug3I0MFHD1LzMIWp6taxusmW2w1G2Zgzz1Ftpiig2KOZXWUx0G7x0yYhXvN?=
 =?us-ascii?Q?EShc0BBR2lxxc+XuU4f30o+AfQzYPgwDynkBoNj8Hirx1gDYEYRAx2NP8Tw7?=
 =?us-ascii?Q?PBTmesim99PSmLnnB0c24NvjUivqIFJojihrMjHmhoOt2QmTQcjW4/5c7Tbe?=
 =?us-ascii?Q?bVLj5YDPTTA2BxAx6tepOfrbyBbOK1W7I9/K6TkzI/OaxdlGPPzgJQuRmN9L?=
 =?us-ascii?Q?4kGrR2PdYZyccwq+gWm1+honaBbIj6Not+qamI4cdEaFbXY9/xmEnl4NKuI0?=
 =?us-ascii?Q?+Q52SBS1H6uFrw+UMNEP23F0ZscGUCCQyT60yNibWKNeMdyaM4pUa1clFt1l?=
 =?us-ascii?Q?DoNKTz6mmnu7dMcgpAoyC3IIfIb5mkh75+fnSMnOPjS8+74e07FgTi7GxtSa?=
 =?us-ascii?Q?5Qfwd/Na5j2jOCF8pWwR+jUuQu2/vYdfZLzcfIPVXKtW8Yo3N+m7VV5K12Wu?=
 =?us-ascii?Q?gKgaO4j3Y7jBEe4HNQ3xc8696hCyua/GuS/SR63oKOUieF8FX1ixAHKzycjX?=
 =?us-ascii?Q?R0zFgSKx9xGi68XhRYTOyKyIuCQb76ffWHHpMXbOE9XArxny7SG4stsG6TF7?=
 =?us-ascii?Q?h0B3f/a3T5zTT049V/FpEh4cGmrayPW4WtrPLCh6QklEn0wspNLBcJVYgsIS?=
 =?us-ascii?Q?8CwcZwLwq/OvLHM10h7Hwd4p61PYZlHsH2Sc+WIn53qB8GCkCbJjYfigaVTo?=
 =?us-ascii?Q?ypNE5F4o+r5uCG7L2hfy2XmghMGGQPWM5XqKYyxNErbVvm4zC9CkjM+PtfiB?=
 =?us-ascii?Q?Sw2mGMhqRJY2TTbDjFUQoGcAQPyzasNnisZ7W6uQt7+Z5nyXjQq576umbZYl?=
 =?us-ascii?Q?CRfgVzebN/vOLKACDYzEF5KomaLKsUeEMZP6zAUz52wyukQUm8n/vNrOI1AZ?=
 =?us-ascii?Q?zl12glIP4u1w77wF/QIGaOPeSszE6pf1RoCEP8/0djGXH0LRjbuhly5u7v3l?=
 =?us-ascii?Q?SrWY4zroD590S2mLU3U6II/FyyUVSMLqf2mlOtJsl7kCGK7x3sAuzlHWMJEm?=
 =?us-ascii?Q?VJUnJeam3heETCuh7IMqylL3UjxGj4UAfE4eDK6vSUbuLsFWjage0UEWwCTh?=
 =?us-ascii?Q?q45Uz7cT9Eo9xl5Kq0xTr8TiQTKihOyemAWYrzjsHA4vwolzSV+mES6+3XiF?=
 =?us-ascii?Q?TM8F/9vYioygtqVoLqSPH7Ptm+ARflceS+t9cj9d+eTlv7gpi9uj4QaHj+NQ?=
 =?us-ascii?Q?6DBd4SPH9y13d2vFrj2beecHiTQ/pvQ2HGurVOJe66w8e1eYJBVUOWExg2DQ?=
 =?us-ascii?Q?jDUyd06YDLkQY0wmtYttrMXs4q0EFGvX9U14xU/H/jYhsNNKAd3wsysFdzQl?=
 =?us-ascii?Q?S9c732k47z+X6JS4ILSN8eBHmYrwPhZM2DjJMHpDdEgeLz9grntyUUobcySm?=
 =?us-ascii?Q?+vto389ajBzPnxrMKM/WGSbW6RlIMp41RBCRUtDBTb+67k0tFxF3kZO/kF70?=
 =?us-ascii?Q?RhVBb0LHN8h9bk/uLARNHDjH3Ex6ybNdN1TuYJcXaTnMp/9fKwD4MeHpXxsy?=
 =?us-ascii?Q?bICYBli8PkZcPJY0VyY+4U1vOEP+Way16XWOXzmS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KQa1kNT94OLmmn5M2pkuZomh6ocL1DBjEaoMDewT8fndPpRhRxaw9xQ+oMU9q2rzTp7dKMeW5EV/qL0kPvtKPFvPAwTrIygLtTc+gKHsQr+1UQmMAAe6BFoFzgDIPht/v1yzx/fUxbxkESH1BgZCk0voI5zbyGq5qIa9SqvMyz5BXY305pp2JYT23IdCnmhmQaK3tzPUrpSQtRgJxE1C8a90h371wf09RamVjnAwPYCaGTKGdBsqsvDAwl1LyvCBm09PoN5xf49rWTyFUALsAjkWHaNLL6FAzNoC/YpG7os12SXlGWT1uIjApIFrnwIz5C/TWEx4br2ZlhsB2SCrZA+fiKqCXg/SLrcr3xojnj5djTra/R18UPReTWYJfnmM5/sHMrAcxczLNh5Rx9ofGE02yG4HMVSvi47mJn8lIKi6EHTpDq+V+zYBXpoyCEmDxkVVa0D68sqQnSQQ9liDr7NI+Oq2Mzoiry7Mi/sxAyqhdUG0FNbzb6uBko10JHMaddECRgoZKtXeWbSpt0AAQw3eWYBmfxVPvgn4GGL7BqJFClJyFuW6l00wKe1T8iu6FocWwgKoTrBOEtthyn6Be0HZ35xYywpHpu3XGglryP4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a669725a-1bd8-4a90-a8e5-08dd719194e9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 02:53:44.3789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d6rE2fyQGmnklcNEUrTsbh05j3w+pv5cfj7JLfbi4b4bsMCCf5YrBDZGLoLBtl4zIaVUhOYV6IopuG+gRghElA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5714
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_01,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020018
X-Proofpoint-GUID: RmXe-g76RJMZdSZ8tNPyliFGCoQci4bs
X-Proofpoint-ORIG-GUID: RmXe-g76RJMZdSZ8tNPyliFGCoQci4bs

On Tue, Apr 01, 2025 at 11:27:16AM +0200, Oscar Salvador wrote:
> memory notify consumers are only interested in which node the memory we
> are adding belongs to, so replace current status_change_nid{_normal} fields
> with only one that specifies the node.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---

Looks good to me,
Reviewed-by: Harry Yoo <harry.yoo@oracle.com>

>  include/linux/memory.h |  3 +--
>  mm/memory_hotplug.c    |  6 ++----
>  mm/page_ext.c          | 12 +-----------
>  3 files changed, 4 insertions(+), 17 deletions(-)
> 
> diff --git a/mm/page_ext.c b/mm/page_ext.c
> index c351fdfe9e9a..477e6f24b7ab 100644
> --- a/mm/page_ext.c
> +++ b/mm/page_ext.c
> @@ -378,16 +378,6 @@ static int __meminit online_page_ext(unsigned long start_pfn,
>  	start = SECTION_ALIGN_DOWN(start_pfn);
>  	end = SECTION_ALIGN_UP(start_pfn + nr_pages);
>  
> -	if (nid == NUMA_NO_NODE) {
> -		/*
> -		 * In this case, "nid" already exists and contains valid memory.
> -		 * "start_pfn" passed to us is a pfn which is an arg for
> -		 * online__pages(), and start_pfn should exist.
> -		 */
> -		nid = pfn_to_nid(start_pfn);
> -		VM_BUG_ON(!node_online(nid));
> -	}

Ok, now that users who care 'status change' are using node notifier,
mem_arg.nid is the NUMA node the pfn range belongs to,
and always not NUMA_NO_NODE.

>  	for (pfn = start; !fail && pfn < end; pfn += PAGES_PER_SECTION)
>  		fail = init_section_page_ext(pfn, nid);
>  	if (!fail)

-- 
Cheers,
Harry (formerly known as Hyeonggon)
