Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323E527A926
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364449; cv=fail; b=e0BSMD3ucImkwzyPqRhwG2SNq0mZYnaF4P31M4Gr6AuQwg+KJfdynkqyMxzD/wkoFv+5XfQOECfIKIXls9qPgeZvSfIhkKbH1ZrucV/AT/GkEigldpAWdD+zhGpSCz9GYNYMJneNRwMYvPCc0TCCVWciCpKLObhCUpX4Tgx6krM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364449; c=relaxed/simple;
	bh=4S7RpZaTa3yzwIfOyTAidQ8UutdxkILpHYIMQ91pzbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GlDOdALOjROP29QETS69/iiEWtLdM3cT/heodq6RdfjoWIC5l6DqnAuGRGn6YUD3acrrAiJD5+0+fq4yJtAV7kwMlI5r4kKLv/WdEWsmf/lK0JpXZToDJGgPoqC58kTwS7J4qKzIYVDWBfd4qIj5N6etuuYne8Uy7izcwoU0wAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YxL866JI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JuzpFYS6; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YxL866JI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JuzpFYS6"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RFuBan028348;
	Tue, 27 May 2025 16:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=4S7RpZaTa3yzwIfOyT
	AidQ8UutdxkILpHYIMQ91pzbI=; b=YxL866JIaj8NLDqI/49aGy5CVZRHoF0Icy
	+IUW473SBE0LFkNLjS2afM6qc951/2FtsPt6NvUiTZgYF8syBpvB85Li0RpXeJd3
	Kjtqq7Rc6Xd5iomaCg47Luj+6eXlhfe1Rlw06XZ07E3fFbC0DeCsGS6tqmqQ6BAI
	SEmQJHG4Vxqmz7GHdhIy+9AoCO9Os4QWAPuSDS5iO0fAOWGiGd+M/72jlzrBVNe6
	5wZqY6V3A8Fooybqf95C/jW0NAsKa/a890XqP3z3QJNi8FYITb3JygOy6qle14Tr
	rL36w2xmcP8jtqpyVXPjkafJBOZ1D43dOg2bAhtxUxwl247roShw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v2peunsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 16:46:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54RFMERJ021151;
	Tue, 27 May 2025 16:46:46 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jfmv2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 16:46:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFyXWwQLIxw1xGQTvQZaIdp9/1/Iiyutr+77B80O3Bhq//Lb7/NbCjZ6WL4MSsPdVVhsJHjKkuHA2PRJR6FN/PLlXxfPR4lejoNdd3YdFguut9B1sH4pv+AJWR9+HxDMSea4RETB1U6EOBkersCCzlX7nKpvEzPcP44JCADk2wTU+JcKqqHpIOtYBwcIdlAxF3ZYnLkGT4nvuxiuYzU6lOXhb2WsX3LLX4/A281+VAMKOybLYDxRlbpQLg/weQkTHeu64fU5TyLPUtKmhoQ15A5/WeLOQvwEtaUZnkag1Ldvgn/tbeGRaEBrroSQTp3r/OILQhpMY3tsAELrKFl8Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4S7RpZaTa3yzwIfOyTAidQ8UutdxkILpHYIMQ91pzbI=;
 b=DM/b/BkE0Sy5ttc37UO+scsGVt/NMX9b5drekkt43ZfbDN12Jx7Oc5mucsRMfDOa+FstKIvRb/1cxnBPhHbyh+m0C+rXloCWUs92bU0yUBw7NdKuo6J6jW7pi8iCnH6aKRZP1Lngl4S7M97feywSdAEd+fvT8E1R0E08/eM03UVgcjzaKFjmJS8/GfOIvCEQvCeqiQDeUwbFaARpB4/UIzIIeQ+H5PNJAnrIzwjiGoDguBpSGo5+CJBRPLnZQ1P5p6PoEYP3118yufhdOogAh/pz2kblqg3Lj8LEvacAk1YnjLLHf0NZvG1Thw+T+tVmbMJZiuuPElrL/GUkJ2aqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4S7RpZaTa3yzwIfOyTAidQ8UutdxkILpHYIMQ91pzbI=;
 b=JuzpFYS6xlB1Up8oRE1zS0PXZs7OUCGFiDB9gyg5ipyNroHtYqzUr5u7t6I29WELfOUaCkuaNFiA3AEYm7paYkq5Mkid6BcORs0Lhti4jAkWuhz5Vgpv7KxxVhrcaYOKfPASBoLZ/JQXuOaSZ4G13D6dOPqJXRDUj6viVYjFikQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB5215.namprd10.prod.outlook.com (2603:10b6:5:3a3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.34; Tue, 27 May
 2025 16:46:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 16:46:44 +0000
Date: Tue, 27 May 2025 17:46:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, vbabka@suse.cz,
        jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@redhat.com, peterx@redhat.com,
        ryan.roberts@arm.com, mingo@kernel.org, libang.li@antgroup.com,
        maobibo@loongson.cn, zhengqi.arch@bytedance.com, baohua@kernel.org,
        anshuman.khandual@arm.com, willy@infradead.org, ioworker0@gmail.com,
        yang@os.amperecomputing.com, baolin.wang@linux.alibaba.com,
        ziy@nvidia.com, hughd@google.com
Subject: Re: [PATCH v3 2/2] mm: Optimize mremap() by PTE batching
Message-ID: <67cf2131-da6b-4a1d-828e-52f0ff7fd0fb@lucifer.local>
References: <20250527075049.60215-1-dev.jain@arm.com>
 <20250527075049.60215-3-dev.jain@arm.com>
 <3d5d5813-7764-4667-937f-cec52f8b03c9@lucifer.local>
 <422a63ea-9211-4e4b-a37c-8d4c5e964b53@arm.com>
 <888a8314-b200-40b7-ab52-f30f0af93374@lucifer.local>
 <8ef715e7-76a2-4004-ac10-3cc10912c67d@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ef715e7-76a2-4004-ac10-3cc10912c67d@arm.com>
X-ClientProxiedBy: LO2P265CA0511.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1827ed-0e6f-4f91-430a-08dd9d3e1020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q/sxqfpTLQK27Qds74ELseZBQZ8roeU3ZPzj8qUo8Ts7sG0IjGSpz+7MarMs?=
 =?us-ascii?Q?UWBWYbP7uwIRxpr226mORqyc3oet2MTvkSaglQv5Szxz+Qs1rmp3jqAek0wj?=
 =?us-ascii?Q?ID8CVGe9LDmypOtvifCKOC9uBmz6bbkNU8P0DyZoyRy52Vu2aKBL8eyVQ14/?=
 =?us-ascii?Q?wPrlJKQHYg3/073VGFhhO7i6wBz0EFaR5yx8SrvFK0EYDfNTeADt20+R6MWc?=
 =?us-ascii?Q?408moXLCBv28i57RtgAqEKQao1Ogy0yaRZC7/90ztzMsLMKxRxkurhTKZJMH?=
 =?us-ascii?Q?5nddjQAGty3hpXrj5u/f5QZO+eUK9X1/YcVzYWteAxRulnMdIxf/Tp8nC+h1?=
 =?us-ascii?Q?14uz7WbiRvJz3niWVg7eCOoIBdX8mQ+rqIfPIy0bocrNjA+kOzFa9DWQs4GK?=
 =?us-ascii?Q?K8RVMldazPx9l1q777ZkMtdBUa8MuRkJHX3r9fSRXrk5efKAoKRfdo8zF6ni?=
 =?us-ascii?Q?chpwwB/mGju5bt1oATonye0PEs1NkBG23iXE37De4+2N+VYALmKDtcLI/CPm?=
 =?us-ascii?Q?MeSpEtS8wSF2kWMyY1qThushXWaBbMpvua/RwILLKZ/VtYwlYfz1V5jBe5CB?=
 =?us-ascii?Q?/8Gj3KRZ9qZPcM61CYTVn0IfWDrBJtcFSocEduEVEdmWQJJjxNsYZjP2tzLi?=
 =?us-ascii?Q?phefrH0c+uPCvskj57SZUnbFf5GiS+iHy/UKNvr0ojt7ot/sSgja4OVvW0ML?=
 =?us-ascii?Q?Xlna5jGHCdbvBMi7DtvJaI8+4hUOZPg6vLnuFrP4wBwm+B6VMdSTh82/vuBc?=
 =?us-ascii?Q?/ScuSLLuB8+ojsZuPSsC1X6/bAh3niEeZ/1NkXsgMVlXPVs/BYq3XZx5RI4G?=
 =?us-ascii?Q?SK3gSM0G08G0eIsroTGeTBAZ/Fx3Tbjcv+z8sAyWwnu6Q2aet+G5OGJewtvR?=
 =?us-ascii?Q?3TK3DfjUsGZEO14+cJVmlAUAe2DXgOVsVSqVw0TWdiRZDlmJk8AWKp9KmJEC?=
 =?us-ascii?Q?b0/NMAjnXdUUkj1x+IuQfADlOR8BT0F5m5Lfq7BzYgYpialcT2TxAUV8dp4j?=
 =?us-ascii?Q?CM7aJUXdpkn1yf819MXybuKoaZmOy7YRmOYQxQyf/YDze7FPOmeZNv1JpTT2?=
 =?us-ascii?Q?VwhIkDOi9vy5WgBz/flq1Zytcp4w+gkdxlf+AuhoXNYQsT3TaUFCOwGsh90Z?=
 =?us-ascii?Q?wQ4TtFzec1RMGRnvJQQUzlueq93JB615PYUMdumBtB6s8W4LnbhFDCOICYcW?=
 =?us-ascii?Q?SqJCKO4t9d5XmPkcWlRkGloJvHM/6o3Wp3cEScI9QpNq86iWq0zps0xZG5t+?=
 =?us-ascii?Q?e7sQf2iTWwYV8oZARC8DrSqTdAwsqVpopz2syPOmSOT79CYaKyPC8G40aImJ?=
 =?us-ascii?Q?ugmrim8+cplsd2jcPTnMKLjP8jY929e2i9WIdFYaYZyhBzNqfq70w/IJ6Ewa?=
 =?us-ascii?Q?z9nMB+NsuCVbF3fqzb61eZ+uQ/t9tEvYwYWcZNZI83aCQO/S+SOHHxyc0a25?=
 =?us-ascii?Q?taW6z8twpok=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NJpm9KFORyclS8bJSz6t9mJALSKvyctARV3Rzq28DqgBTv5qgP6CfB5PWlwC?=
 =?us-ascii?Q?43gBQA4xmjKwA6aQov2+W1Oz98rddeXbJBL2H5rrSTvNz06ObAh5VZeRp03c?=
 =?us-ascii?Q?DcoKPLMrfkhuxrFkHioF+vqQHool4KcPoOlCNVNha2Pjz5gR764cPzUO9B/q?=
 =?us-ascii?Q?v2UdYsSqPpfgqpoUbc1eVbg0JX8kv9W/mNcLbxfeo+ToTC1q5ixmblGmb07a?=
 =?us-ascii?Q?Vi2jAbRt0W99+g+QXm1sKv9zrC+PLGx4SXtImH9YtENC1DcGLh3DlN47WIVM?=
 =?us-ascii?Q?+7sGv+ahZNvZqc05t7+/T+sOotRkbCmTAh3SYZP78Q1HwQ05UC02CAadj+1h?=
 =?us-ascii?Q?wVqPpYFAseHbTSSffdj/AWmpmTAnXdzWvdE5AFh9Q46dMPILQU61Ll88RFFL?=
 =?us-ascii?Q?LBYuNfSgRA28FfL9EcusxwG2jdxOE5/51i7SsRaU12j9xTuYpGvggkbyAXU1?=
 =?us-ascii?Q?h6gZbQL+Q3uSDtD7mjTySO6Vwc1M9M/kvlPjqa5gghgSqtt9KOHr5UC1mgEB?=
 =?us-ascii?Q?mtXKkotukecMTRdlCcbc3RHugX+oka4sbDaG7VxhjSVkjVdTHfbElHgsl7JJ?=
 =?us-ascii?Q?Y4hehuGzt+00VNSGd8wwEqBMswh1Uzadfghwk8rYMi3XFhTq3A57MhxayfeB?=
 =?us-ascii?Q?mLovrpq32X3c+s2DIDOPOprBRj8WTPjn158HHUljfhKbXFA9nCZQk3/zZyZo?=
 =?us-ascii?Q?k2iapEUMOic2QRBq8+pkqsOTW58fdsPJy3+xO/qUIkQgzGXtQcjRf0UQgYj8?=
 =?us-ascii?Q?xWHi6adxtsm0oBzLJMSuUAcCskDwHERJNvaloBYdntAtQjDztW0V25qkOcoo?=
 =?us-ascii?Q?t2IbBciSGR+mvch654kCxUkm3uip0uxZm6VkYR52IEH4/dSFf/9amklgE3Cv?=
 =?us-ascii?Q?khoNmcvrLozAI48vgVCA5vvPBXkigl51sjY0hhGVJ1+cM+fsQm1qi5PVVDeq?=
 =?us-ascii?Q?/ila2myb+KPCA0qUoNIAUH8KGNlaFHOIVGzecyOMOk4Snbq5RqGQhwKB3Gye?=
 =?us-ascii?Q?qclZfEfEaIWq+jGgT1zjU7XXkz9CrGXPysHtCcYtFrRa9SSb/6VjPNTc8ILo?=
 =?us-ascii?Q?aGNRZ3biPuR0Eoq0C4JCaOiHlSdKdQHnPHLOIc6xhvl21AKYNtB9nCffqHml?=
 =?us-ascii?Q?jQUfGqFWjEXMyk71/zHro+RzfGFVybSE5ZKjBPoQaEsAMpeAZK5jSp5j19t7?=
 =?us-ascii?Q?cNQpdZhLoyLAZ7W4cAdn7U4JlEqX6K4unR3MYlflrS9XlDUOXJlHisDrOhK2?=
 =?us-ascii?Q?B9LgkkzB9dOoACgYn2UAND8gEkL1hHPH02ZVRTSSWbQZnsQVP3DFA54fnX7Y?=
 =?us-ascii?Q?1sAIIRJqsHuLd+AUmLq9JzhT0iDIYosWEMwun6TjwxnVQ8HgG+pvz4lqzk2d?=
 =?us-ascii?Q?Tl/XDu7rloiRpvuYjFDRg0ArL94DhqTcCrciMRJln6A/PpmEtikoS8KmFLZG?=
 =?us-ascii?Q?Lqv0lg3Ymt8ZHcTmkpbA52LK5upPmFC58St/75ai+8qRyBSAdhHCAXN1CE4X?=
 =?us-ascii?Q?2XL9l7sjaT7pUViScEk4snHNGyXY95OwQE4Cj2T61y1OzU9uWaXnZVtLwet7?=
 =?us-ascii?Q?9jaSmcK2b9obrg/77tbO+/33etRGubTIslRZK1tdLPknO9lU8PSVgZntJnO8?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vkV7yo9SUCSindLyYf5/f0m8QjzNbuLFP4vEfI/+WESQk7+ptZyTMzpEebZnSqlA2lbon0Y2Gsjw048Rpmm8d6eh8glvRswyFWahW+2sf2qJ3GwXLwt2VGaRfTnzse+s2Ch9+XerLe4EHxXnsp5YwkzjUnlRdC3/StsVdjrF2YV05wDXcWTRZkl09EKtq8LseoSik79OH7aLgICreukoLuCvG3JJbqBxibfRlql09bnnx7sUw+1GUiC6ivesZbgf339oJQLozfXx0B/WgYR8uLoS88QaNqXALqdLs/cF1Vgg2hNQTREwNEvzd9UpW0y7hkP0x+ysgUDS95qi746oX4JqVD1hG4Dv0cqQT9lcJk8AtyPlbpbF4egu4bxX0kA+P0UGpUp3PCG935GtTpyEweH7PuLecHjfEPYUUyFUid98eOk8hRr3q8wKe4Hb8m4NoFozd8BXVNCuMjDMw7yc98UtmNDc1yYHpZm0uXeefXcjNjxmWnbUP4mgI0Y4Bhddsa3SlVAhDypB4dMEu4BqnQjLg5H9NGH4EuIysmeMGcDw4KRa1QRXI/Lj93YnTk1eq55qoMuCOvRSamqcsOXsni25/PQed7Shml3W85hYVh4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1827ed-0e6f-4f91-430a-08dd9d3e1020
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:46:44.1457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEQEoBfROWB48wAXyKyjbixAbEK68QI6pB6VQyKG6Q3IPaOY5ABeTidljRDdF7j1sP+XAGuQdkHWKZanH0v7K8sU6GdAJYjscuiR6CGkXHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5215
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=767 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270137
X-Proofpoint-ORIG-GUID: Suhy6Sg_Y71I2U8iZ3rd8dkAsc67C8gT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEzOCBTYWx0ZWRfXxg3TNT27kxVT h75Tk6UgeME6dZtnzpEK1ksPgyr4kuaiv1ymFv2g7LlN1Jww9w2lKzySFpJPUaGovtdw70fgQiL 1kI5Jyb/b1Of0HUQhjGmNTkMlau6w7FAApKVMopkN+5LPyl0JilNLjklX5X2udNdXjRCHiDxASJ
 /5PajAAXcOJRhQklxn6dUKgDfrAZ6fdVb5XpZSJ/2mEOQTwn9hGHkewI9K5j1Ta6f0gFk9/8fH8 slNMc1EDzc6ixiJuY9I8kyTeVRRAhzhHjUsXjwe2zjrA97DgRbraDs1HyLLkRpI68hbxUl6May0 jGeENiUTnzfUQP3sGST2FI5fGTXW49DEeZVzrdygQ42nQagwZf4QkKVxlGZ3hNj8zzqtKpkvQ6B
 MnZrSOWTSvJkO1MVqO+sbAkSD1l4WtS36ldW4Qs/3jwrz1h0iiIh/TY/TI+LbXpf05sSMnGA
X-Proofpoint-GUID: Suhy6Sg_Y71I2U8iZ3rd8dkAsc67C8gT
X-Authority-Analysis: v=2.4 cv=TdeWtQQh c=1 sm=1 tr=0 ts=6835ec77 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=MUUqlan8bQsh0USBFP0A:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207

On Tue, May 27, 2025 at 10:08:59PM +0530, Dev Jain wrote:
>
> On 27/05/25 9:59 pm, Lorenzo Stoakes wrote:
[snip]
> > If I invoke split_huge_pmd(), I end up with a bunch of PTEs mapping the same
> > large folio. The folio itself is not split, so nr_ptes surely will be equal to
> > something >1 here right?
>
>
> Thanks for elaborating.
>
> So,
>
> Case 1: folio splitting => nr_ptes = 1 => the question of a/d bit smearing
> disappears.
>
> Case 2: page table splitting => consec PTEs point to the same large folio
> => nr_ptes > 1 => get_and_clear_full_ptes() will smear a/d bits on the
> new ptes, which is correct because we are still pointing to the same large
> folio.
>

OK awesome, I thought as much, just wanted to make sure :) we are good then.

The accessed/dirty bits really matter at a folio granularity (and especially
with respect to reclaim/writeback which both operate at folio level) so the
smearing as you say is fine.

This patch therefore looks fine, only the trivial comment fixup.

I ran the series on my x86-64 setup (fwiw) with no build/mm selftest errors.

Sorry to be a pain but could you respin with the commit message for this patch
updated to explicitly mention that the logic applies for the non-contPTE split
PTE case (and therefore also helps performance there)? That and the trivial
thing of dropping that comment.

Then we should be good for a tag unless somebody else spots something
egregious :)

Thanks for this! Good improvement.

[snip]

Cheers, Lorenzo
