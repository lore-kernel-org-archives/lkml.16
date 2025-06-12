Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9D543AA4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735023; cv=fail; b=tnFfh6kPoVB6vRfodbsHIQ5P06LnVUEo9k9RXXdTjVBayx8k6T0hSGVHdHMRSqVAFlDZtAMu2k8jVa8YNfZnRgprMnSLd3TrJRk0xjyuo+VuxFuuDAIc8F8BLk9mw7JXHewJzAGXtnwBVcy/lbEYMtk7LTcEQPdr1B0phSyt7D0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735023; c=relaxed/simple;
	bh=CHHB/7j8eYYwOPDZmRoZJmi5a/D9NIiEbeN4psl8uRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BGAcr5iJoovcXK1DIRKT7zPDjOjsPBhagJqfmfNlxrljWiHs4nlP0796WV3F/jeyM716+2tF9rAdIysx8YoQ1Cyfd/RbUeLdCWOTbsz+SJlIgftgIDc2op7p0Kj2AUeG0eturH1TCgptfdoR2zlmaaOnrV2uhKjqseI1wfPia+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e1WVUzhN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RCVtK8rH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e1WVUzhN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RCVtK8rH"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7fgQA022523;
	Thu, 12 Jun 2025 13:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=uxe8XozIoX/Dup3mgw
	+ZCqFOZN0vj3c5KlgBFw/+fQ0=; b=e1WVUzhNmojc2Aq/OZUS3IA0vbCezWpozO
	5cDcKxVM7QTQ60Jpi7UH6KcPb4KiGdLHjFNlrgmYE/Zh6DThhnfCbnTFpQH7UaQv
	Cfcg+W1BLCVJFYd034jKo+QFBXiYGXxFkAaGazBXXF2maUbu2m5iu6Yl0Gv687+f
	NeKu6aotmybmxNIgyyA4ZB5iovGegf5Z/EuqccoLllrFUZMV2iHbktwkOq+Egm7n
	OANVrgrAY4yWdWmwYZafjmBUG6kMYUJh/T3N1gum8pDbrME8Z21JI4WPFSGKPINg
	oMTzEw5NgVANFHzg61sNXfs2JQFP+7fimy5Lgl6vPJdKe8+k+/ig==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474dad9kc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 13:30:02 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55CDTJaG037761;
	Thu, 12 Jun 2025 13:30:01 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvhu1nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 13:30:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwnxPm5iCXV4rO2It9f2YkJpr9LankpEfzmZn9KdWMsXK7KWIQ2YF5NJgMDG27RTM3sJwucgLNBDG2eXRaCs4ShUJ4ty9VEnu+4Uo2SxBBzzLF3cwE8T42QuJc3IE6EkVt6TkNJArUQo26LpY2zjXUxHlg5WdKXGimJanwVjFxyjKLX21CYVc3eQwyCA2yK7Nw0V3Z9lOMdquKs65ZzdFyhYg+xq9mPx5FZVQjgT9o4ttKP5iLrPRm1cUKl6/8xcVoehVqyxSpemkUEhP2sdHlD6TLA3uVXtOFKRIaJapZb9zOjU6FwrgVxUQ5PiSSDv1VtIwmzmjq6kcSvjQrXSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxe8XozIoX/Dup3mgw+ZCqFOZN0vj3c5KlgBFw/+fQ0=;
 b=rmsoopwk3OtA6KwFxY6PntKOFw3bhE2qInuE6L4+DR40l9dcqHv28zK1tJ/NPFLl6joADWhUjakIS8RRAH4ng5k0gNY3Lu0I4uz+DPGtu2yDmO8BbWbksFYKbaUUa9530x3mX4btQ1qsQQbDbD9QUlTYJpeHXqhjlr4mxwYPZ0o7MFzqLVSgnZ/aCPPAYIiG+hrmQQw+DrofD+Kxwr5RbOjZ7kLbjuH9rCZwXe6pA3fSgGTCUDQEMuiMviSkSoklcarO27+zwWe9VAcpqoCGLcqTa38as486tAHYcDo7tb7ZUhXP46CAHZWncY9XAadRRX/d7R5kRLvbpcDZ1kH/pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxe8XozIoX/Dup3mgw+ZCqFOZN0vj3c5KlgBFw/+fQ0=;
 b=RCVtK8rHjh5xeEYpmk7mHWIcCz7PE4lGwOhyzmMIVm0iofRZy9nftpJt4SRi7M/FzForjCBJ+rhwx9dtFhVCSxb1uwKxxErsEVfTo5swAghe6redLEn8cuHZREw+4TaguhrbHPi9kdxFZQOjKfG2qjNOgE/zbIlWJZYhcq/zX6k=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MN6PR10MB8072.namprd10.prod.outlook.com (2603:10b6:208:4ff::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 13:29:59 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 13:29:59 +0000
Date: Thu, 12 Jun 2025 14:29:57 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
        hughd@google.com, Liam.Howlett@oracle.com, npache@redhat.com,
        ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Message-ID: <201a1cc4-93fc-48e3-aeab-759ba8c8a47c@lucifer.local>
References: <cover.1749109709.git.baolin.wang@linux.alibaba.com>
 <8eefb0809c598fadaa4a022634fba5689a4f3257.1749109709.git.baolin.wang@linux.alibaba.com>
 <1ec368c4-c4d8-41ea-b8a3-7d1fdb3ec358@redhat.com>
 <2ff65f37-efa9-4e96-9cdf-534d63ff154e@linux.alibaba.com>
 <953596b2-8749-493d-97eb-a5d8995d9ef8@redhat.com>
 <97a67b74-d473-455e-a05e-c85fe45da008@linux.alibaba.com>
 <b8fe659e-8a84-4328-b6d6-6116c616cb3d@redhat.com>
 <ce58b08c-0ac1-4ec2-8ff6-cf8e651709b0@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce58b08c-0ac1-4ec2-8ff6-cf8e651709b0@lucifer.local>
X-ClientProxiedBy: LO4P265CA0284.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MN6PR10MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 937b992d-eb0a-4db3-8517-08dda9b53ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ie3YQGsAzOZa0bbh2wuyF4IT8EbBg8wxH+rqF3wfVbarE2/jfbKoBdt78RIb?=
 =?us-ascii?Q?q0quNMg27EZZUtf9CaWhiZRS+wDUDEtE8eRbaH1VJrLduc/XQl46rMuuuZhq?=
 =?us-ascii?Q?gd/5SyaBslKQ4RzP6LPiDWs7PwZa8cCsLNhC9tnkfiXA8gkCCirXnLJ6y+lH?=
 =?us-ascii?Q?xjvkG5euYlFb2OMRP1uVZ2+GCnmXjASYR+11ny7wjocc1AHzKjSnl4KOM8Ql?=
 =?us-ascii?Q?a59xSZheVm21fk50KQsmNr/rWYjfNFbq8D5cOgLf0aNybiWjtj/ARElWYATD?=
 =?us-ascii?Q?a92J3hygMEbfH+VoYeQmQcWuSCQe44jUflHZ6iJz0p+HtdiD4Ac+Y7IJhNdt?=
 =?us-ascii?Q?gDtEp+GPR3GtafaUM/QGudohjpXjkFdcDNTiTxFgg0XevXBbfuqJ6D5O3t1c?=
 =?us-ascii?Q?yDcBgeFrOFvdq9y2CIHTRk/fzM90bkbVNe+lZuoVgUWsy5tSbIvqs3U4YCs4?=
 =?us-ascii?Q?KZ1lL25C3ElSfHYyPMUo3k/GPlWC9cMWEmWaG/ipBA8ogez5u/z7/dLawwXj?=
 =?us-ascii?Q?Rp1vdwW8BWvuo/76GgK+cHf1nvsFsvrgWuCIAexbuy58JaINVpF+86kknW1a?=
 =?us-ascii?Q?QlVvkmjBVp1xZmd/gGhoC8aEGqiGO1wxpQtkQWgplCv1U2piukb52IYrqhPB?=
 =?us-ascii?Q?pnnal2/yX4HvdqUo/KRJeQAUREFMmlX6e6EXjzwYQrIKU18EhMgIflSYEZX5?=
 =?us-ascii?Q?QAFjKTzNUfJNb4Zj9Q+MDAcdMec9zS09yur24sUBpAcz1ppLB/pEk5gHNURp?=
 =?us-ascii?Q?1A1yMCzNr76FCbJllX5dzN8B4cMnOiaJANEI9tVRDSeFozqhn8SU+z30LTIc?=
 =?us-ascii?Q?c1a7Aza18Y1iag+ZbFrOvVV+BEZ2ONBO+FPXREI/NEmh1FIaRABWeEiqibmw?=
 =?us-ascii?Q?ZD5szl6wDbRypvKfBNz0VBu2gfadk5v7GEs2em9nMkea2WZGDGCxKEPnk1JJ?=
 =?us-ascii?Q?TL5bV/KfN+FRi8mjI6O6KlPkaAn/+V2u1ZxHaSRgvE09LYn5AsWIlFUd8br+?=
 =?us-ascii?Q?mwi0G+7QjRZe2w/0RbUZCzvDAuvgyCyLW4qvwHW4mddQshwXIAPR+Vr1/Yhu?=
 =?us-ascii?Q?km120KvuTQe9lHcQ1NoRALlpcxfZ0mSka8pgYHmp2OwINlsGnFciZb8Gp+gZ?=
 =?us-ascii?Q?zsbICKujTCjSMVw+0dnuXGU+YxkOO4mWzj7nD2Vh4KChL/S34O90RdrqtYJx?=
 =?us-ascii?Q?OI2EkGUMMl+SeO5dTQxhacGzUgpAOUSGHJzK6tMql7rVHgbCdibV4twmFRbp?=
 =?us-ascii?Q?Tzn4a4FYxaqxq3X3DygBWC9+EiqpKoVVqpctwWLD1EvQCh+eWxBvIha7fDl2?=
 =?us-ascii?Q?1ifGceyR1ReGnZiT8NenZxjIPvwohfo8PRZP7uRONgkOGyCmHQBIRKdTwH14?=
 =?us-ascii?Q?58tQIMBF8opOsSxKYcPjWCZX/KaaYbKzIfDzHAYRiq8BF4+biOCluHMUqXLB?=
 =?us-ascii?Q?vOJs3UwrXu0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Wk+QjtcaWmb3MnZ40MS3nNGJGQT8d2vIjBvkSchIUz3i5MfKqw9OUoYZeSE+?=
 =?us-ascii?Q?a+AYR1+DnTETpPCj5hBYe+5VEfcpHrHAk/GkvJHTF8sgxx/Ffse1tzjrtqfG?=
 =?us-ascii?Q?NBMq9nNJKQtJCY22yEt8BumnL+nDZLyg1EW35gZ8M5MrJ2IYDcoyEaIywRCK?=
 =?us-ascii?Q?yc4cHBFqsXgeD+bDkDVuUa4bivu55rIhnxWsP6iClm9J/boeAFXYJ8F9Xgsl?=
 =?us-ascii?Q?ailJzcn7UYFPWLa5BV9xNExlHhyYxBOnhaW+5udnF952+tkF8+a0TgjNI3Wl?=
 =?us-ascii?Q?Xvtzh3mWFwl49KbVes+djY+0RAZrjN8vVCNfB4gp5aW1UrJUe0DmlSpGbNWE?=
 =?us-ascii?Q?H9eBoBpygyN8JlTRiFXXRxtnoWS4njsfnZMbtPAahkctr3eYhPvJ7/1TpFXz?=
 =?us-ascii?Q?MPSFqJuKPxNF8cWsVYE/E/SP7P+9tHPmuA3zTQQYZaT2FKmWQ+JhxDjTzgHX?=
 =?us-ascii?Q?6OEGvz7d3YJ1I/h0exknBc1A8s2ehRQuyjgI/uGUVIZHuqR5Zzki7W5+fvve?=
 =?us-ascii?Q?MM9l+YAWNdyxrasKkYyWDLSUVHGD8Zm7b22UZ26hhxO7UGHpBq/TGzGOwP+C?=
 =?us-ascii?Q?ZO4+cF+aTLJcqmz1uqEFI1bpmFUf1wOjuVnI7o4Ece8vXrNUgGVf0Sdk2eK9?=
 =?us-ascii?Q?qIeBvRdFWSNACA3kencuWDoSmt4ggJu7JgVt0zBM8c7na3Z8TgUccdRYGLPf?=
 =?us-ascii?Q?cR2Hqmo4h2qwBz2EKWRN20+efQZTPl2s42gq9VvUCi+/4aj8az07fBi5tj80?=
 =?us-ascii?Q?J8BIiJYfvgua+FGD9gQD6FBBUPjzFCyjaPBOCtHyG2qKE/zfQtDh/0NDX9x0?=
 =?us-ascii?Q?JwfOM9r5meujTyxCySUA+FhSanUrym4jLxn3hY2CvV7ma1o6nZYdphxviL25?=
 =?us-ascii?Q?874MaFFL4dF1aAMuZKkOdS8rQ98+rhJQW0NTt64V+JiOQnTUkE0wpmTmIybl?=
 =?us-ascii?Q?U71Yaa8kkRMHGRO7LObZrdlXMsYzmi1ewQcdCyqr7I6ScdRZZQPTSU8vf7CO?=
 =?us-ascii?Q?spdewhu91pPKeRgODV2yxqkVlaLV2Pv9A80B9AFJgVPAK45L1q1jIL0oIgTY?=
 =?us-ascii?Q?hOsZiQToDUog+uIes1SrcHLUz371Nxz1ZjD7uJPNMOqhrZIfhykQ/r6elXmf?=
 =?us-ascii?Q?v43HAUR8cYBwWR5ZppNwjMSnqjNmVSxBbN2W3X1D/wDPvQoU4T3vLR4K+8V2?=
 =?us-ascii?Q?HVPZONoLVnfqwxwDC77/MMj2fYltzifcRdJS/I8T2cqPxEjel0i8c5GvNlkQ?=
 =?us-ascii?Q?vVlqJBn/COz1EqnZuUQ+9Om2EP2Ibrhy+0vPJ51sEdUW957lHaP8l4fZpeFi?=
 =?us-ascii?Q?czo44ZNGYdIUbFUuMezj3pZt0i5BQ4uSkNyVVGS6WkcdYhMTzvkItrqrtG0H?=
 =?us-ascii?Q?l3LMkWT7kY9vf5Yn8dUZ3/9iGb59NA+phVOSo3FJAHIElUK6Amsmctz6Q4sf?=
 =?us-ascii?Q?AlchtUYEh/KNDXPnFV4BQFtOHTWC9IYc250Kr6PHt5p4lij57QIUetIWwZ1f?=
 =?us-ascii?Q?w3/hXR++4iy+mBDvap1xSm9JV/sCEmbY5JOFPX6I8QpJ1+phlZD0MV2nHkAg?=
 =?us-ascii?Q?wH98puF+bR7KxoeTsodBy+peoPq0v5gVhDEj5KFPFs6iGRalG//KHX2BLJ6D?=
 =?us-ascii?Q?DA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3jnID55gcoIcJGpfnPbNyWeVl0oh9S+Qb6WTziU7mqbqltOQxEZpvny6BV7i951Pqdm4HO4S+lQXmxuzaqGu4dQCmav3K2rwlN/z1Ff7ealFlHi3+p5G5Sj6iVqX/xuJOypRJedkR5GG2YBNqwNuk4yAQbkYBA7CSIXcrHylv/2esp3buWJtkITY4PGNi2usojq9YNCQ7NCjtGsDUEnrKDRUJQfPgkux/FDVxBWDUa5cuqcCxkN+JpkRtRHZFlkD2qFsiVxDAqy1EqzXFvBQJ80/mfcAPtDNrE9NnRcM7CWuD3hK2ygwiKzfGY84hmXd/X0gPUuvY1D+olCToIz79Z2+ZsdOKrp7ZVmH5wCJmfF3jrYoPohZywCJWEvMUP9pqrCJgxyGpkJnfRmkowd3K9FBVh5ECFHHMJ/R8oHExAMysc8sZKCVR1zZvlIemYIjAl5PTxkShj0u5t5wxn4EiyKA3cuWyKYXEH8rW1qIb+xEBZ7xyJdMrWUu/Mhmm/HcApkt3gxt0Udi6UATYuNQ1DLX1gdgMpeVPw4sSvNOLcSB32+cX1m3A9eUpkmE6SaAfQffxmh7CZU6CDenrIn/tzlRuVA1kZl8K9kHXCGrF10=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 937b992d-eb0a-4db3-8517-08dda9b53ac4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:29:59.7354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFmjn7O7Wg2JkzPuDsB7e8oTuBPGPdwGrr6EYwSslffiSCIjDZ3H8yF/GBW1O3nzqua8eIGH2Y4GRR22eRYhKmKLutU7EF1g6QLhEt1Mntc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8072
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_08,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=916
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506120104
X-Proofpoint-ORIG-GUID: _X3dc00y7kybgEBMN93caDaFPtg2Kiiq
X-Authority-Analysis: v=2.4 cv=EJwG00ZC c=1 sm=1 tr=0 ts=684ad65b b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=N95KgXO4NnPL3IzlU_IA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEwNCBTYWx0ZWRfX8mHUDgJ8A7hf ujp67maNM7ImXmO2YkTBSjX/dUHANNLTDQqLfENVVIy8wrxLmjrwflQdY9+cmISimlxkJOpwrdd 5MvKE6kZuC3n/fYLfi4irxMDtQW83PxtmjpgZ0afO9ZTwLh4PI3y8CPpVd+OPubDcB/NGfkLIch
 oOgIDuYRx5T0t1G5YHqlY1ON2nUVAaG03KW/R48DATKV0C5N6u47dNtFxU22K+f8Dua+WfGbJQS mh1vGMggiQvRs2YgZpf6i6+KLwVTIRl/POBOafxFYGbwXCq5sMpRYXNj3/JyuRNod/mJ8zt9BOh tBv0uHilwHks81AHsqwMOGn/snAzbGzOUJ7K57mItK26JKipBguzlfeRBggkCzXpJuzFg8CAwa3
 wYVYFlQqZnM43PlhzXUgGy9Yl88ra9H/1y2S8A1ajj6m5np9kthEW0HL1HyRlXUQ63o46joz
X-Proofpoint-GUID: _X3dc00y7kybgEBMN93caDaFPtg2Kiiq

On Thu, Jun 12, 2025 at 02:27:06PM +0100, Lorenzo Stoakes wrote:
[snip]

> I propose a compromise as I rather like your 'exclude never' negation bit.
>
> So:
>
> /* Strictly mask requested anonymous orders according to sysfs settings. */
> static inline unsigned long __thp_mask_anon_orders(unsigned long vm_flags,
>                 unsigned long tva_flags, unsigned long orders)
> {
>         const unsigned long always = READ_ONCE(huge_anon_orders_always);
>         const unsigned long madvise = READ_ONCE(huge_anon_orders_madvise);
>         const unsigned long inherit = READ_ONCE(huge_anon_orders_inherit);;
> 	const unsigned long never = ~(always | madvise | inherit);
>         const bool inherit_enabled = hugepage_global_enabled();
>
> 	/* Disallow orders that are set to NEVER directly ... */
> 	orders &= ~never;
>
> 	/* ... or through inheritance (global == NEVER). */
> 	if (!inherit_enabled)
> 		orders &= ~inherit;
>
> 	/*
> 	 * Otherwise, we only enforce sysfs settings if asked. In addition,
> 	 * if the user sets a sysfs mode of madvise and if TVA_ENFORCE_SYSFS
> 	 * is not set, we don't bother checking whether the VMA has VM_HUGEPAGE
> 	 * set.
> 	 */
> 	if (!(tva_flags & TVA_ENFORCE_SYSFS))
> 		return orders;
>
> 	if (hugepage_global_always())
> 		return orders & (always | inherit);
>
> 	/* We already excluded never inherit above. */
> 	if (vm_flags & VM_HUGEPAGE)
> 		return orders & (always | madvise | inherit);

Of course... I immediately made a mistake... swap these two statements around. I
thought it'd be 'neater' to do the first one first, but of course it means
madvise (rather than inherit) orders don't get selected.

This WHOLE THING needs refactoring.

>
> 	return orders & always;
> }
>
> What do you think?
>
>
> > +       return orders;
> > +}
> > +
> >  /**
> >   * thp_vma_allowable_orders - determine hugepage orders that are allowed for vma
> >   * @vma:  the vm area to check
> > @@ -287,16 +323,8 @@ unsigned long thp_vma_allowable_orders(struct vm_area_struct *vma,
> >                                        unsigned long orders)
> >  {
> >         /* Optimization to check if required orders are enabled early. */
> > -       if ((tva_flags & TVA_ENFORCE_SYSFS) && vma_is_anonymous(vma)) {
> > -               unsigned long mask = READ_ONCE(huge_anon_orders_always);
> > -
> > -               if (vm_flags & VM_HUGEPAGE)
> > -                       mask |= READ_ONCE(huge_anon_orders_madvise);
> > -               if (hugepage_global_always() ||
> > -                   ((vm_flags & VM_HUGEPAGE) && hugepage_global_enabled()))
> > -                       mask |= READ_ONCE(huge_anon_orders_inherit);
> > -
> > -               orders &= mask;
> > +       if (vma_is_anonymous(vma)) {
> > +               orders = __thp_mask_anon_orders(vm_flags, tva_flags, orders);
> >                 if (!orders)
> >                         return 0;
>
> I pointed out to Baolin that __thp_vma_allowable_orders() handles the orders ==
> 0 case almost immediately so there's no need to do this, it just makes the code
> noisier.
>
> I mean we _could_ keep it but I think it's better not to for cleanliness, what
> do you think?
>
> >         }
> >
> >
> > --
> > Cheers,
> >
> > David / dhildenb
> >
>
