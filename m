Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E229552E
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747055820; cv=fail; b=rdZ/pvOdoQZ+ztsk1ag3MuujiYCKLi8vSjBcCZ0iJhSNurPGMcDmbX1Cqd0H8FQGmGsotL2msNhf65+5LRyP8rG/CJEhtVqvvjA7kgfndrQwZYoAZgUUJAyRVmhEdWJTiBSEUE3lKUuMtSQ5C+Grtd7Um1h3RWQfogYfeinGxfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747055820; c=relaxed/simple;
	bh=oaOQ1F6LuvlWfI5b6tkNLpntll4w2YIky25ldB563W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MaN/FS1A5tfUhWvT6ZXD2Qr0airZNIbA2JpTFDRu+bOA9WEdJpIH7T/TQ2fSP8cuGgYcz9/kyth4lcekhuBrtxrgSZ7Ktq20LWto81fAhHmY2iZBOwYLN3gBUhBNU2DNrskxKVLtwNQn5t9LarVskq79GQFgQEaZTJRxd+B5TK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NVX4+6b9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Sk4xy3OM; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NVX4+6b9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Sk4xy3OM"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CC9h6R003887;
	Mon, 12 May 2025 13:16:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=yGP1WJWjH9O6Vtw+3E
	0ozCH0D+XtGXaw4XuHDpLh2S0=; b=NVX4+6b9aiWZRDXUK+SPqjEr1MNehKaO1t
	zyWEfZtDOK++hJHOCDbNsQMFbcnKQ1W71g+oRnow5+xzjnRTugLkRFRBL5QcaoVp
	msF+XKA+J/6YXYsLUd/m9uRnH8MHQK6Uc3/98bbXACO0ZBgSCc63h/s92YXj6PIN
	KsbmmMlz6XaBmiZI5YaNO1Ju7CxxD/TRO1+Puft9DN65xCzlZ2vw47zuzc0qJB7i
	feWnla7QtQXrBHZiUdfBZ9P8GrvizofcAl31dTJI2CuP2EO0TkzOZ9wdZBWWM7jf
	JVf01cLXCei24C40FeIDxIkZaGdZByKq/RwtLWn1QNEMW5sGHWKQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46j0epjenv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 13:16:27 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54CCOd2R002436;
	Mon, 12 May 2025 13:16:27 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012012.outbound.protection.outlook.com [40.93.14.12])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46jwx3149k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 13:16:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voi4TckOtwXFoAnXp9oJKujkH4naXZtrXAbvsSztAUQq8PrKYwmQNR98QZQBR2aeE18KMzBJE0H5AzvHNLpvCl2B0fJnaMa4bE0xwQ9Oqm8VMmzx1y+kS9VpYm2HD8Be+6I3tcn1mn5nYi++aC7j5/xJDOH2PsMdG8f6CPhdY4mx+a0rslUN+K958fbhHrcyja6MwHu4EissKeD5oLzEujRV5wjOfP+pBC7TFyGLsNUcJB4wB4lpnZoa9vc42ErkcZhO6eP/fuTFj108Rn/vOArtszXL7VXDgUo4x7jAvg2IwPJDNH67zofec+Y/ig6PN2yZ+oJrMePIj0lqYs4lUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGP1WJWjH9O6Vtw+3E0ozCH0D+XtGXaw4XuHDpLh2S0=;
 b=rttYZ5dOP8C4Ef2YanwROoFbD2cmeckmBR+uwNY/VF8bQ9pMPvZGMfvGeEFKB6ZJQEA0lSCUh+6Kouq2aeaSlimeoyRGy9fe1MBUnDe2IHuLJs4x08zIsjvLeOJUlDD3I7cRhm2/ybL+5sjKfYgKfk3cyeFHcGh/wlsq2mDa3Bz2GY2OD61ExWGn0aHLwWGnYyd4d6RpSCK0CDIXSzAPJFOCZ2ox7H8wNsRQ/YEdgStTZbiNd8aWWcPEKu4umDSaiPlJDOaDoZsV7mjItdzQWIsNcEDMbIUiGKS9GIxytJgUkaajA5yopY8w+xsDVXRmNJUV02GB3+KG5aGr4CgRCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGP1WJWjH9O6Vtw+3E0ozCH0D+XtGXaw4XuHDpLh2S0=;
 b=Sk4xy3OMr10kGgqtRF3GBE1J7QOJjZQve89xNepxf2sx/OwZZCExXaWQbljDxejyY/fCkg6tWj4IfoUJENo7LrZX2AQF9ydWvgnIxqZQMeSZxh7GFo4iB/2aCGi/bGb95DEPfWjirkpbVy6BlpZ8F4ZDU3hAuDmLnIWMkytvxNs=
Received: from CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7)
 by DS4PPF085C55EC8.namprd10.prod.outlook.com (2603:10b6:f:fc00::d06) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Mon, 12 May
 2025 13:16:24 +0000
Received: from CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90]) by CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90%4]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 13:16:24 +0000
Date: Mon, 12 May 2025 14:16:22 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH] MAINTAINERS: add kernel/fork.c to relevant sections
Message-ID: <0e4a6c75-a5f0-42e1-a01c-2df1fc4f142d@lucifer.local>
References: <20250508152825.151889-1-lorenzo.stoakes@oracle.com>
 <20250512130433.GA25763@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512130433.GA25763@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: LO4P123CA0238.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::9) To CH3PR10MB8215.namprd10.prod.outlook.com
 (2603:10b6:610:1f5::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB8215:EE_|DS4PPF085C55EC8:EE_
X-MS-Office365-Filtering-Correlation-Id: 4940ada9-59f9-4d82-543d-08dd915731e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8x9nHnXK5toYjJ9zsVroT6e6fl5q0O7TQQcldb+LuqLjBLPtlrHFN6XPzigT?=
 =?us-ascii?Q?CAT+tRPE5j/pMuTIkmFSvTjnzzZdVANKuFEYEg2xhbFGxXL+wH67EF8HEwAU?=
 =?us-ascii?Q?urMsaauTa5aFnHoPMpDyugYJmgwG99V+4RMphKm5IRlXaTpg0mRWLA5K5yg/?=
 =?us-ascii?Q?8c4I83vM+UJGRLvn/touotaqJnchXHpHR+3cl5o2CPE7jDFg4w5EP+ogkmvs?=
 =?us-ascii?Q?YqsT21e1cvIJKKt4BessU0KQIA2/62Ti+gtEEQ82aT89JP80qxIONItZwCSk?=
 =?us-ascii?Q?e2LeJ64vbhFAleonGLYcey/wY7VjzETBZ1Em9VmUvil8Tkfmd2mkmXNwxW8/?=
 =?us-ascii?Q?Mo0BkGR5zzr7FwJYXZEfmYZp2KurU2BFVOaj5SqSXFo/CIfKq9HeKfKLVc20?=
 =?us-ascii?Q?T1qwQZumiTCcKhUKZq5MgPQ4HcG51EsedEWhlOK+RNa4NVArWwiZjyRGj24k?=
 =?us-ascii?Q?MQ1MuoRvl46AJN/Rw5F1pgGADwJTd/fNaHBk9LoEEbYLqU0K+NnDLFEaHreU?=
 =?us-ascii?Q?khn8JVWq3kWNsA/5vTmvvtVc8g/PUvUneuGkFdVhvUDpcoPeOckcYoK9VmtF?=
 =?us-ascii?Q?wlzJftVSxckkAJFyzVqAtoB5V3zBRY8mqMffoZYwCTPCI2SZNGcF5HUXhvnq?=
 =?us-ascii?Q?7Nz74m/KepJCuBAq675UXpDlArRH8RmHOqAnRZI2/6jlUdslZIlz3rDdF/k2?=
 =?us-ascii?Q?yY2WTSR3z4pbMjl/9EVz3aVDK2YOcoKKtmjbaoPmS0oXh07YZTGolz494p9U?=
 =?us-ascii?Q?4gFYpCVrSFCBwZfO+idFw3IWDKpyemEhO5vROsSnDr3fRkqidbS1bLOoY1Os?=
 =?us-ascii?Q?Tppv5A8HB5opZaFgvZDCoicQRGuByVgRuTJPIWunChTnpH696hu4KIxI0iRU?=
 =?us-ascii?Q?FU69Ya+Im7+BHfHs2X20lzOrzK3IVAlxzr7ytroZXDpAdaYO3OZbsGiKH4CI?=
 =?us-ascii?Q?7vCfDT1TsJQgFiVCnZy9mTwCX/g+JKEzoCQvF4OHMk1ltDycGArtSdiJWjTw?=
 =?us-ascii?Q?twheOtY8VYF2ZmIgnkti/dmiFviHq9lL887Crr8MqSlU2Mt7cpuSvcUZIC1r?=
 =?us-ascii?Q?c48bV4xKQBoxaGX2cXFaBXZcpcEyVdWrcQc/Z+xYydLWLFrkGCxdEU9OGXNJ?=
 =?us-ascii?Q?tRY5/rEb/0gxVAk5Anp8C+4o47cAAM4uVKNMavFvlQZDG7597KUPZN6L1Cb0?=
 =?us-ascii?Q?NBsJGKmBTDuEpxc2RB01CTAqbDre9zNB0EpGYTb7yR10zZL4dnymffyeb+Ku?=
 =?us-ascii?Q?k0x3UYhpnth1vfKaAXRzdii/QYNVjYfOm2niKo0B4IcIygQxXQos7wiVuEV1?=
 =?us-ascii?Q?YkJnnV3r9N+HRGZphv/ww/fVj3ecZzl7NInOS+YjEFDDZVCLttx+w7KEnwnw?=
 =?us-ascii?Q?bb+H1AI434lZ/2lLV0vptS3rBwwJvzA3NEJtpWyr3Bp/cuFX0hdxtFs1/J2e?=
 =?us-ascii?Q?7aN9XsgAnTI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB8215.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CRnWreL51ynn924LDAxioP8xeDUuMESrNlKVP9BgjDbM3LdTk5D/IUI1N7jF?=
 =?us-ascii?Q?whVJ5A8c/RT3LQ2hE8b9PJkgmAlZ5VILCLQrx2IaNKAgesco7DskzuWB00Rk?=
 =?us-ascii?Q?Z3qH/ZQHBDUD1F31Dkjd3Fn5oGV1nICV1x5LuyuAz0HvZQX1KEwx6emK6Z9b?=
 =?us-ascii?Q?g24tkA/0qGo99L12pcJlDA2UMGeqWiTLMCsWVlR8wNQIPUdxGQHbIK4f9mqZ?=
 =?us-ascii?Q?z3Qw+lrg0pp82vLBeTEsIKeZ7abfg085STBYFf5f2gtxsL+FQ/CoP3XuuGXf?=
 =?us-ascii?Q?cfy7ctwTUc6gpC2RNGBQeHVbjKXX34TpWOVCta0pdXyRHZ8T6dDWxS1CKr3l?=
 =?us-ascii?Q?WFvDdQ45ZgLOlzVCb94U12I2xChfMiGMFWr/O4xxIqA6O9ZkFc7hD2PcXJ6o?=
 =?us-ascii?Q?FF91ZaNEyJS40VRLQjFHn3tggqY8gnYp8eranhvzU/QxQnSd//n8gk6v/zeY?=
 =?us-ascii?Q?OIrQ31rctVjLMjg/mqfQ1TrB04JrPpKwpjBSBhAb3esvZ5CNTGAZ82onkD+T?=
 =?us-ascii?Q?eDJ/qWjC2SPpqHM9JRTMdLb5s8zpgTs1SCt4chaGoKb4WBaN/+X3lNa+LSQa?=
 =?us-ascii?Q?tEhJDX1pn82/aMTrRmjDe/iPwcqkvn+c9VOnrMb4Txepi2rW7UPvUsPuajZW?=
 =?us-ascii?Q?H34a1ITVlUQRu/juXdWEk8RMAhzm4Wz8tO70IHwXUOyjQAnes5I2EsZBwl+1?=
 =?us-ascii?Q?xyprs8gs1+xboFsPitrcvfGDhS3S1/mVz0bGh4DIKH6tsW6IJGYKO4MlWGMk?=
 =?us-ascii?Q?wt/wo4JbcMIVX2iEtbBm2r12D3K8euiXED8KVb90x7TRIOH9om7F/9xiqOdv?=
 =?us-ascii?Q?S97bP6/VxqsrLmMIeAvMLmJ636ajhjDUhErvHDyo+w4FFA61yLVdLx8HiS+t?=
 =?us-ascii?Q?cmBdiXVCtxYvAgq+h/YftoI/LNwfplUbmh3Ok8GpoOXC3rigPoypNEAgMWH7?=
 =?us-ascii?Q?Mr1iB4HFQ0FfU304fhvRpTiiYG7OtNYJ40PsIWlpQ2VfmtKTHeysD1g1/JWS?=
 =?us-ascii?Q?mtusU0G6WYaX2wipidJi0jQlYheKA89nulIyQ/A0YN5YfSEMMLizcdK376Pc?=
 =?us-ascii?Q?ZskNkj8+JEYBf1Asz4GXjitFSPVwdcUuJh2e/xN4pxYXjKMRRuL1NBxzzaw2?=
 =?us-ascii?Q?r75DX7bnrtPLaS4M9OPatCZId5wkXjNL4jYOBEW3vqRijO8DFXxE9vw+vc4s?=
 =?us-ascii?Q?pZ21swv7PHIhrkCVuof1RbZjI3FUULcbwvLWXwFlh0bWsD7YcimWIZAWsVQ6?=
 =?us-ascii?Q?oY43CjsS8Air78D9LYt7nD0U7ZY4FpR6FKWwsiUDsANTYbWSWyxcoHsv4nHX?=
 =?us-ascii?Q?N5W8t4w0UvSDaZ5h35vSfjZrzAO/BiJXPZ2y+Cw45rL+uGF6pX2MdhV5JZUA?=
 =?us-ascii?Q?D9tpi3Y7MvU7Ye1VuDUO2ShOBr29jHR8ZNaj8Y+zQV5vSEMAeQdkyWflFSFx?=
 =?us-ascii?Q?51ScPJlrGhGUBqnqOKL/ViPLOq9f62QDVCORLk1BY75TJiyIgkLKZZp/mK5H?=
 =?us-ascii?Q?rjddu64SkUd/BVbxy7uIMjw3gZAmbRHSVNZzXNM8ZyfwwfKwl8HuB9kXTo3B?=
 =?us-ascii?Q?3GoF+cCRA4apVzpVmbP8gFClq9ifzloxI1wTMu8E1L22v22jW56/aurNR8B9?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	iScjOQvwNtuZIEM7RLY2/bDHbClVAScCmDCw2nsejpUoK4Qj+MLFLuIDwQESYAjfcuUDhpRK/4tHpZXt53gbD4XaG7d+v+CxQc03J+rVJHyOa6bCQ25nBN+NogH6YppchuuAqNuCBxSchv2Tp0Voo7twPBbu4IoF703Tc43bLSGvgAuVuR/fI/yDDoF6I9lvj6K7rV4fhU71kmxseah36GrgbA4B0xyU5vMdT8Obup8GqklYJbfRMAEv8Jke9tX6B3PDlHi3f5d6ZouXzuiZqa7fmZj8i/wzeYSAKjLK7jgATAzgi6xTkNbPAM0HnVI5vUyGxkUzZx5Y39unVtcme5cGhRoiaWUIHglXuKI4swk6BcyMVj2CON4PRYQwlBVti6nj2ypn6y1IOmr3xVCtOiPeEByx756dT8tMBfoV8hI2LvI5QsrUh4vfWRITpdSoy+D+2T290b5cdyLKqQRxqFGzs+a6uOphOe7EEQFc9MmD58nUN+wn5l6P/73VLTYRkcaaQvcQUAlqr+6INNeZ2M77DsjJ8UAtyfbAltR8KKHezZ/Mmh1UdsJcOLOqG9Tu68oB2WPl9c9AgV9B2aeGl1FrUxUaKB8R3Wg+XQzFgF0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4940ada9-59f9-4d82-543d-08dd915731e4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB8215.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 13:16:24.2679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1qiIzmgy6ozb+jvsg2qFyafco0TvOesH46fO9ufdo9eeKKKTGGqQctmfDrsFVrMcQboeKQInbsfTnbIBO/hY5ZFMUH010Z2IrYwcZLrVrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF085C55EC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 spamscore=0
 bulkscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505120138
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDEzOCBTYWx0ZWRfX1aqPX6I7bneb zukgtLY57YFZ+PzJoeONd0tYYl+Z7fqHWMmnPWZYDRAgU28gqc/eeFDw+C7njkrBz65ejg0X1KM 6kFF2u0xQGkJ4cEwTa9k5DpJNhuQwiL26UAcp2YRCGHLy9RJ31iJ5NawriWEWgp1sK/LZsPqQdm
 Ud11n3Fw77PuwKyrgTyhVkIDD5UmXh5KDlOLeVSMybWTuGHRX+XB/1avbu0zNM/i4wqkzHNuXHH htxTxeQGnP5azqoljKSNkst2hV+S4sTypGV1TItNOf1yGlfTF9VjGesx9gf/eNR3gnl0+zkEErP oYfJygnVx96wkcLrSy9dmNCQoIsev/KCmi4VRf2fHys9Zj7Ul+Qu7F5xyu4gYmzrnGnw0LhPA8+
 6nZgOoU7kDAJVahgchTN0mInM2aHLiwUVWIkEE7juSsdVAjubPybgH+n8u+jOkFz/4s3PNt0
X-Authority-Analysis: v=2.4 cv=DO6P4zNb c=1 sm=1 tr=0 ts=6821f4ab b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=JfrnYn6hAAAA:8 a=Z664auZXsam9FOX1zlEA:9 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: DjuH-HB25pbWFdwyQJto9iJTTeLLPKzJ
X-Proofpoint-GUID: DjuH-HB25pbWFdwyQJto9iJTTeLLPKzJ

On Mon, May 12, 2025 at 03:04:33PM +0200, Peter Zijlstra wrote:
> On Thu, May 08, 2025 at 04:28:25PM +0100, Lorenzo Stoakes wrote:
> > Currently kernel/fork.c both contains absolutely key logic relating to a
> > number of kernel subsystems and also has absolutely no assignment in
> > MAINTAINERS.
> >
> > Correct this by placing this file in relevant sections - mm core, exec,
> > scheduler and pidfd so people know who to contact when making changes here.
> >
> > scripts/get_maintainers.pl can perfectly well handle a file being in
> > multiple sections, so this functions correctly.
> >
> > Intent is that we keep putting changes to kernel/fork.c through Andrew's
> > tree.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Thanks!

Non-RFC'd version will be going out soon.

>
> > ---
> >  MAINTAINERS | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ccc45b0ba843..55332d5bc499 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8830,6 +8830,7 @@ F:	include/linux/elf.h
> >  F:	include/uapi/linux/auxvec.h
> >  F:	include/uapi/linux/binfmts.h
> >  F:	include/uapi/linux/elf.h
> > +F:	kernel/fork.c
> >  F:	mm/vma_exec.c
> >  F:	tools/testing/selftests/exec/
> >  N:	asm/elf.h
> > @@ -15525,6 +15526,7 @@ F:	include/linux/mm.h
> >  F:	include/linux/mm_*.h
> >  F:	include/linux/mmdebug.h
> >  F:	include/linux/pagewalk.h
> > +F:	kernel/fork.c
> >  F:	mm/Kconfig
> >  F:	mm/debug.c
> >  F:	mm/init-mm.c
> > @@ -21742,6 +21744,7 @@ F:	include/linux/preempt.h
> >  F:	include/linux/sched.h
> >  F:	include/linux/wait.h
> >  F:	include/uapi/linux/sched.h
> > +F:	kernel/fork.c
> >  F:	kernel/sched/
> >
> >  SCHEDULER - SCHED_EXT
> > --
> > 2.49.0
> >
