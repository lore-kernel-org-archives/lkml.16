Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9C7FC0E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814580; cv=fail; b=J85tiDOc1SqpCxY70kaYVhlgGaoQfAgpPltTVQ+pbWeF4SR/fOy//Pa9MgE8jtR+it3F/Y7N7Jbns7nT+TIaK22EUQjiqNfrH+Whw9Oswy2S0AKbAeQti8Lhr8noEaTkINGCDl5KU64hDU0vU2LHHr05m9EgkFShPz7K2Kkbyas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814580; c=relaxed/simple;
	bh=Mr64Pn7c+x182Yw/ik+6ddGzt6x4Wzd1RRaH6Qn7k64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LoZMnuvzddK7mzGUFyS/xRHdsescmoU4/mmFKbK7rCOByJsIc1Ad1K/xkzxw2GfRV/Lp/YFCgMrco/bFhuolFNLGmbLgRwvCtvorSk6+6/S2sbDeNZxQX9eLAbUE6rX6J4bTVccw+m5Pv7Mp6ml1LgASFOK37AY74IjgyXqCR1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bS5chSii; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lhEAKF8D; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bS5chSii";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lhEAKF8D"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GDMwOr007816;
	Wed, 16 Apr 2025 14:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=K/YUAglxG1hS6ER8yP
	3t1QroxvFz22VLMYbBhu1XOvY=; b=bS5chSiitVERafULYrWRsHyZyNjvTT0mKU
	WigJSMW/QrMZpFW3kNC3nSlCpBXn1WPJ7qQOD35u9uvkHYu+5eFNYpPnqVwdBFQq
	rJCWvecJJfXgsC+IZdxFp7dgUkRZ3FQ66HpP4i9AzrGDJNj2sLSDCIN1Fw63p7RZ
	GsS7K+GwgyhA1joRxN9NnzRbMqfu3emZhkZ9VlvGjmEXE/y8F//OMQSaH9ilhgXz
	yafhTEIk+Cwc0INntUc0bRNUREDcstkqNk1hkUVoXopRzKfl0XJe/Cn06d2XmuJC
	dm9JoTu1P8mszPjpF/xffftNCisI/l3pOFFgZ62C3jRa5mmbb6yw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46180wcbg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 14:42:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53GDuPoI024737;
	Wed, 16 Apr 2025 14:42:40 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazlp17012036.outbound.protection.outlook.com [40.93.6.36])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d51xw78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 14:42:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiAVG5PDRe5tKJQTt7xTBUpCEFrOExuHXzAPTGglLHrgxlq/GGEmHAt/SRn3HhjxS5HN3tV0lSIkG0Z9gv2OAyOHjUvMFlu49iXcLM84vNVBoNXSOJv27MOIM6//eFCHMtbH9v3VDi6xL1Ij4O8+RDrGnLp/BX1VzN0R1VGldZyAXq9rFGjLclMQ15SNhz52uruiseUDxvtv1kniy6pDusbAjJ1EBHPLtpD2u0x0xaOy8Afq83jbgYq8w2w0e/XaAjqKpFguwVBpTwKwD0bnXFKOy98f88KOSRCsm3Cdij5OPhfvCw2zZ+OBGRKGOmLnRvFA7I9ihwVOuO6MjWFWoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/YUAglxG1hS6ER8yP3t1QroxvFz22VLMYbBhu1XOvY=;
 b=X5EAKomrqS1Rv09cZt1BTjWcvXu/ynh4RxJEGyMEdjDd0N9Ke2zDo1zMTx83nETXKRxaYXoyu70s/5jlqRONdI7WdK4HVgIl9JehbdVST74piF1Rx6RVwVRkc7j4NXELubkuLPkDCd/aJQCohrGkBFZsSvmB0H2dqO2nO/oiqRC8DHCHrGNC07+xPcRU9XK8pdaKsp7aKRQJXTCIrhMTuWnSNyFUO5UwZd9ZvebujSv4e8UvYiP+ahm57MVXbDJDv9cRVwyx3o0fQvVVB3T9agUAZ5Mw2OWlMopbN4V9oEKxeMcJq6tg00eCw2eGNKpUGQ3Ma86Z2pdyoipY9qpOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/YUAglxG1hS6ER8yP3t1QroxvFz22VLMYbBhu1XOvY=;
 b=lhEAKF8DUhWNsXMYWIvp5/z2U5cI3LuZsLqMdt6+njUp3Lmdx0eUQFWFMKo41fRGvdNXre+GZaLSxfiTDBJgE6lmSzg6g+0AEpNe9ZPKhmeSJYvASHYn6DAdggRgRZFIw8TbcMKgpabXvASh1axDRK6OGdAhvEQp86fFsqbFPnY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM4PR10MB7403.namprd10.prod.outlook.com (2603:10b6:8:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 14:42:38 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 14:42:38 +0000
Date: Wed, 16 Apr 2025 15:42:35 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Suren Baghdasaryan <surenb@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, Shakeel Butt <shakeel.butt@linux.dev>,
        David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v2 1/2] mm: move mmap/vma locking logic into specific
 files
Message-ID: <1b52ea23-0101-47cd-b49c-01a27316a54a@lucifer.local>
References: <cover.1744799282.git.lorenzo.stoakes@oracle.com>
 <bec6c8e29fa8de9267a811a10b1bdae355d67ed4.1744799282.git.lorenzo.stoakes@oracle.com>
 <4782b071-6008-4fd1-b762-65a575dc333a@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4782b071-6008-4fd1-b762-65a575dc333a@suse.cz>
X-ClientProxiedBy: LO3P123CA0004.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM4PR10MB7403:EE_
X-MS-Office365-Filtering-Correlation-Id: 71976812-8624-4b88-e9b2-08dd7cf4ef49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EGlDOhqqnoA4I5ruZsY8MNbt3+FFXMfOpqtEJ0ZhVcmWlXa/+kTS9RElkAFb?=
 =?us-ascii?Q?s3OoJcQdQ6sdAzkFxlFA6Xf4/SZJzg4SDD02arGDFFtTp2RgpVizaBeJiJka?=
 =?us-ascii?Q?GBK6z0pz+9++3IhCD9GWE+5e7A1Z1f+niY4vfdyX4KuxED8MQYImZ6L+Dz4I?=
 =?us-ascii?Q?mq9gQCNkwAsO48ck8rojiiVuhYhF1fcZnV6neYPW3xHSxTCDQ+eo9sjtdFZc?=
 =?us-ascii?Q?bDwcpEuMXaRl+n9adLqTmDxiOb4TslXOczrqlIdJ4Qo6+Cq6CWKiJ75QX34H?=
 =?us-ascii?Q?R/60ilso35jnhp8dqeaRUZy4ZoiqJ477woKmaQ5QMqRApGEHmh7aQFD4Tadu?=
 =?us-ascii?Q?H8MQn+QnjoKi4/p/GLGnzIDcx4ALht7jmLhVWsBEK5jsPO+xop7VcITf5Lsd?=
 =?us-ascii?Q?5+khm5rhURIHodlB1L3ehwwh5hJZYWngY4lfRWiuEOiFLCqwreDDhrXhRn+w?=
 =?us-ascii?Q?leo4VanOQK+vepfQjV1qGRM19hqORYNaxgTt2sr8c4g+Gkzy/FKL2AIcyAWw?=
 =?us-ascii?Q?EHl6wxghlPp+xFn5wj+2T44XczKJFA1hZrTa9KZegKOmkIhFg73T7A+nvRhA?=
 =?us-ascii?Q?p3GCOIorL4DKhank4kRL7H5lH96Lzg/iNk1VKYEKd7jhfHoYVe3SH5CZh/NB?=
 =?us-ascii?Q?Ywh93CEPRBTkWYqAYW2U29eTW6NdYjD7yfozHF5lFMLNe61dqwvjZuXb/nl8?=
 =?us-ascii?Q?R3y+jzeYqMphnHdZbbImtYbiXAs3fzv6K6f9pWvmAgse9tw8tQl+nCyiUWC6?=
 =?us-ascii?Q?sNw/RUs20X7c6Qe17HbAWjtLVCovfIfxrktb9zFBrok6+H6Y+4uGx4BBp0zz?=
 =?us-ascii?Q?DvXA9akYC05XAUl9IKNTcDfEaUexiuuUsTnu4fQU8cnXvX0ka1Zd6Wy6Gvy8?=
 =?us-ascii?Q?UX7IN1fztg6j0Lt9o9SP21JqMHyeXhLVpnFvcERvhEftajBAcJY0c2cctZ7b?=
 =?us-ascii?Q?U89e9mE4Kc/JIvISxCGI+WpgOULSt9mwusr9sPzT7/lIYxPWQD9/q7M1s7NW?=
 =?us-ascii?Q?Nxd/pc7YgqjjfmNAOvtqK4cZWC/Lmz73uIt8crlatpNldcA9XVmEnEgRTKsl?=
 =?us-ascii?Q?Z0gMCesCY8ZFH/NHC4YS0uqTlcecRsfWBHSfKSSNSF3O2n6mudIIKn5OWu/J?=
 =?us-ascii?Q?r4HidQZ8l16xJQsdjTTdPxcektPnP+Vim629n/CeepTjIDXDgtojjOVVQaUc?=
 =?us-ascii?Q?yM2fNLinoIhDHVGLMuqq1lL8ppUwik0wx7ausmqjH0LOFb89BgJQT2sMp/xT?=
 =?us-ascii?Q?Yj4sNZMwS2mlHAKEtc9f3m2kdHnwFOBrkbotEv2A/nNqsTK4pUz1aLlblTjm?=
 =?us-ascii?Q?hUP54ldpsEyxe4rp1ZpJqZ8sJ+eYhPiO1OfuBnj9aQRFz9J8FqaCjABrGyHn?=
 =?us-ascii?Q?NSENjGwpNZbiXXR/n7My3/CAYSX2XdpqDyUQCn6JIjCHr6N0boGK+0WXGjYv?=
 =?us-ascii?Q?DgSOc6vRDQY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r/6tXwwkUbo1wEF9sJ6NTl+/gKD7hJye987cUvlCMM3+oKU2IQ+1YJPFEi8H?=
 =?us-ascii?Q?N/62ATAJMYKSahGcpYqUZHEZiCgHVUbAJ5cUijVC85GdVZj5E1Ezih/6ehhk?=
 =?us-ascii?Q?f0gOr33vSbPwPgiUHZ+SfoJoO15VKopsaSFLrSikaqn3efRlbSsrV8EYDjqv?=
 =?us-ascii?Q?1jdJG9BvLDnqQRcrzYgdp77ZXHsGeQDf1K3DG6aGoN49bjWszo4QAFuT37ik?=
 =?us-ascii?Q?wmGH8IIflfyHQVgDmeZUUjJ7u5BSmKUGn0vgphsojFDglWfImtGl2UgmxdDb?=
 =?us-ascii?Q?4ts2mpCfwSnNbJr6GnNttRBVRVdxpz6gIJLUMeemB6WYO7iR2m25/QnKFIzZ?=
 =?us-ascii?Q?H5T7GjjqgK9BP9LZNw1XRCyq3QtQPTajS7ul3W0vhWf8CHyjJ3jxVKE8b5cR?=
 =?us-ascii?Q?EU3qYBXnHQ1Vq5K8bbN8y7mvaC+rbBXEqyuVPrMkd04c+Zi1ha8mYqUhULu0?=
 =?us-ascii?Q?LmfLjuT24d+Cfh5hxuBcr6DbaJsXT+g3iEY619ISl6bn029da5dnP67p2xf2?=
 =?us-ascii?Q?2zl2fSjFZ2ijJ4E01kVSFhTGHyh1S3gAE0ZkbLiHQmycFlrUJR7M1pnOahxG?=
 =?us-ascii?Q?5sR41X5VwR1SASfWFclJk/veUSIXYlw/4iwTunX4Qc5tkfGZ6OOa6/l8+J/h?=
 =?us-ascii?Q?bLolKwSnKONSmHEHR3LWDiTpskvLG8dnrDMDza+sczBs7Pf/d/oHyMNksDRO?=
 =?us-ascii?Q?uLJrfmG7m8Ep8pkoKYY8WTw+qRoUNT/Ke6FEU1z7JLno7eIWZjIh2fS41fi9?=
 =?us-ascii?Q?GB4avyEJs56L9yuBLg/LEs+yAx3Q1RlrHJ5Khj7KjdQ/drTm/puSpqmUfNkX?=
 =?us-ascii?Q?OAV/uIKRiqEZxoTpVzZN6bfcpqH+23jZGNhcWHA3mh3OB1a7siTXRIRkC+i+?=
 =?us-ascii?Q?ftI+5eGvDLS8zFZca6r5Et4vPxVuBTzt9xxWrTkKRmrYzqI4w+TlfQO7Ag6K?=
 =?us-ascii?Q?MQA6hRpp7e7rBSMaKMPmxDY0ssfss0LU9EzcqtxONpGz+gALEOw5fXlLNuoF?=
 =?us-ascii?Q?Qnqj1ddW/+HjWdfpL0j4bj3DsCZowLR1iaGcOHoJ2n6JuHB6IRuuIuM7Ny++?=
 =?us-ascii?Q?3dGPKNRQlsTAvwBkc8nzPlwv2MICdOhmSrXUAuhiWuCV8nvzWKWfW//uxtP1?=
 =?us-ascii?Q?ZdtTqJXI8/gwfNSqcoEdiGns5uZgnEMzVFzxvVuvZP9TA0dDgsrHMyoEDicF?=
 =?us-ascii?Q?2UBCeL+iylZkhZat/pIxQJHU5Aut0C/q2M9sgbpbBz9sUbuVKInb7V3AI2lM?=
 =?us-ascii?Q?ByE4AgMozsvSn1rqUNXJ7yxQPXO3VnOETyRXGohGUG9vfx/8gFj8rKYzN4S1?=
 =?us-ascii?Q?OflubLdDZfix1aUolBcbBm1/EbQ+dfDtUnqaN4htulXgN/86hV8up7G14K/u?=
 =?us-ascii?Q?DcR7UhIK8kQ9NxmWbWKgQnqfdEkYlEA6pABlPAWCAgN82usm4E+okw8Vr3QC?=
 =?us-ascii?Q?U4vYewZM60ZrAUBrEnMIzuGsGJMlFbfv6QR3zipgSTc9PuJBprXh3InVSt9M?=
 =?us-ascii?Q?rITwofqOEwTIAmEpOny3oHgztEQWrTNjw1KAuemOwp5D8q6eCmOnGK/+j00j?=
 =?us-ascii?Q?j+rY1VO9dURM8tcxhF0S1oLMhlMOPUV8AUiB1kdXz9i9VSLm9Uz9s9Rwppbj?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wTXrnK6ekQX0BBp0R9oW1GsICHRToqEtOGuMZHNeAMxofBnfb5aAmSAn1GSwOlgQJr4tVxbDp9IbUseO1tBiIDt6AIpoJnc/kJ3DnCrc40qu/uGC5DuD1y0F+jMAt6YUetrR0u29tJI+xihXZlCXVmIk9yKgBnx2341nhE/bF2AgUEvl3XVrpf2uMmS0sOQx/YYzCp14Xnz0ueWQvMF2uOT3zd+pX7JmysHKee3FRHNkr5xQxI25mmKJEJVH75/p7QDrLpNzO71sN13T9g/ZYdvKDZK/razEIcOXXD3vu4wCxE/IRTVVZ19IorJeXy1A6M8C5hrW1dvjGK+B/ciqinzBQu/RNs4A06S1MV6tF7AHYWsRfS7dE/cd+tkKiILsQaGHB2AcLaANLQ1ax9ap+44PUdIqQpJ1W3nSfTGkG5UcNO9v32xn9qSL2umxhFBcBZUJ5rBV/Oa9QfMFZF+CxU+EYHzzubfMyJQqTBQeKw2VCXjruI4RQiZubThI029FXQeszQq9v0qYvYfH8yrmT56eAfvvMZn9yY/MYY27pOSWGrZ4fd8NVZHpKviIn6L1xzVL/HjtPodI12nTQ1TKTM65omGQj1I9J7NdJoHm4pE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71976812-8624-4b88-e9b2-08dd7cf4ef49
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:42:38.6602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRESnI5Y8NecnYfGOeeyZxHG+ROTuqjZSTlU3PdRvZzMGp+AdBDXCKOy0HRMJ86SlH5j7+Ia+PUROmsjnx3Nzu4D/vCT5TSbd+5HZHCSscA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7403
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504160120
X-Proofpoint-ORIG-GUID: 4C6-LkIVSZu1BGCcFC05B3ubIUxpQL0l
X-Proofpoint-GUID: 4C6-LkIVSZu1BGCcFC05B3ubIUxpQL0l

On Wed, Apr 16, 2025 at 04:39:50PM +0200, Vlastimil Babka wrote:
> On 4/16/25 12:38, Lorenzo Stoakes wrote:
> > Currently the VMA and mmap locking logic is entangled in two of the most
> > overwrought files in mm - include/linux/mm.h and mm/memory.c. Separate this
> > logic out so we can more easily make changes and create an appropriate
> > MAINTAINERS entry that spans only the logic relating to locking.
> >
> > This should have no functional change. Care is taken to avoid dependency
> > loops, we must regrettably keep release_fault_lock() and
> > assert_fault_locked() in mm.h as a result due to the dependence on the
> > vm_fault type.
> >
> > Additionally we must declare rcuwait_wake_up() manually to avoid a
> > dependency cycle on linux/rcuwait.h.
> >
> > Additionally move the nommu implementatino of lock_mm_and_find_vma() to
> > mmap_lock.c so everything lock-related is in one place.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Reviewed-by: Suren Baghdasaryan <surenb@google.com>
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

Thanks!

>
> > diff --git a/mm/mmap_lock.c b/mm/mmap_lock.c
> > index e7dbaf96aa17..5f725cc67334 100644
> > --- a/mm/mmap_lock.c
> > +++ b/mm/mmap_lock.c
> > @@ -42,3 +42,276 @@ void __mmap_lock_do_trace_released(struct mm_struct *mm, bool write)
> >  }
> >  EXPORT_SYMBOL(__mmap_lock_do_trace_released);
> >  #endif /* CONFIG_TRACING */
> > +
> > +#ifdef CONFIG_MMU
> > +#ifdef CONFIG_PER_VMA_LOCK
>
> CONFIG_MMU is implied by CONFIG_PER_VMA_LOCK so you could move the first
> #ifdef later to make only #ifdef CONFIG_LOCK_MM_AND_FIND_VMA nested in it.
> But doesn't matter that much.
>

Yeah, as I said to Suren, I really like to be super-explicit about this,
nommu is such a painful and horrible thing that I like to really clearly
mark when we are doing a workaround for it rather than have it implicit.

Obviously I take the point, and we often do things implicitly, but I feel
overall it's better to spell it out super clearly here!
