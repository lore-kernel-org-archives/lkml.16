Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152CC27A441
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729444; cv=fail; b=gSuEBhPj7JXzeBcT8WTdYwjLPs9CxWiEIjF/sMfdk/JXHWE7xIlKS8LXKSqQzjTIfWVcUT3f6IRIsiR+VR7rk5VyICknqAXKJ7035GlZk6aQCGDdYQkceiP6Gb009HLzRrPYPdKvQs+DtvQFC54pqPUMeceaGdjYiVLDJYbWQgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729444; c=relaxed/simple;
	bh=A+yBepyxIugIbhmHGKsxu3Crktmu/WiBt+zLr9nTtCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KId5W9PIVddouxBLpbJhzQjQf8k4xmV9iz7jD0fjtAOgziqEHCQe47IW+fhkWta/RyZXUFCwvbMHMcR752tZqL+zgnMBIohyHhf264h6QTHzPJYnkCBhQzP9qiW2tbsuZw6qEdb+ET5pzdJ3SGT/9qoAtpM91Gg6hXhn1kRwUAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YQ8rReGj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=opN1bDOx; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YQ8rReGj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="opN1bDOx"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548IMMLj031525;
	Thu, 8 May 2025 18:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Kf4eA/I4W8ZUBoLKGX
	fGCQs5+SsvZ6ktKPLOKE8r9c8=; b=YQ8rReGjxL6eR6vWQqoiIi2A9scu39ket1
	R2yEOsFQpqCvhMppiXbc6no1kPP9oJrWwVUkADVbuQRQm6bPpi7WAubtBbpBT9Hj
	h5vtmM3EjyoyXXUJle8AHmIPNeO5aWMvCCfKlGjaga+IVBy8mDwSsifQ9DPy6tF2
	CE67C4W/wFjUMfPYOReYhWy7CAunuR39IyXhRh59qbIxLsruCLlQ07z5KOHc4oNV
	V2vdcEPdAjmButSytzU6dkf4x8lsXPMsXYLGRwQTLd/FtRMoRoriZD7Di/W3AgOa
	glT+JPHnzuErDzZaMocmbTw5q10svQL2enE6w5PvsTzTFYq/+l+g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46h1tyr1hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 18:36:37 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 548IKGeX036255;
	Thu, 8 May 2025 18:36:20 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazlp17011027.outbound.protection.outlook.com [40.93.14.27])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kcsxtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 08 May 2025 18:36:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyoAl36v3AAuWHRpVq0UyVljvg/eCa+t7Fo9Ff9WuiA1MoSUspdngucYzKlmC7tS6To9wo9SF7yL7IA0D7dp23OSkuCkfGuYd6CfZJxHoxcnmykzZ/eXo3hsoeuKx/NmUleBLbkWmnrCbhLA7mn8kO91tg8t8Z9SNpbUcvpdrVLWZz5oYdiY4aA/Z6SXN/lCj1sSjxRYFC8cmrZfuOreEybH+hQqAawOh1zjrlsLByw+SsmGvf41VBsThyDYmMjoxtgWqhCxzaTlwuMGRfuFPSlsdEfXmjqUGcS09VU8snOQ+PgHoG6XzTwasw2P38nQeUP0RoTKe2SyJRGPYvZYGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kf4eA/I4W8ZUBoLKGXfGCQs5+SsvZ6ktKPLOKE8r9c8=;
 b=UtQtvMLc9utqE/zm+4JkrhCsEidRjErNqIanGG2xrqdSI637N7yTdEyPIV1RshF+AEadhEXDPrhTci92cpXEWw20iBzLc9a/+hylHn1ZSohe/GddBJ4klOaXOr6rJPhCq26RqWy07aZPM/6YKKocyeD2WCNAr9GazrCHpPjKmRJdN1DBFjqEuOR2FH90p1bLXgiMIRqqMH21pOmc7Jc2gCb8xFFVZguJtOevCJq1wsFJAZvPCiJTm3lBuDMoSOHFBz1XsiV4w6nJ08ZPOZIJL36CKwId0E/EOBpaU9XvfVH/p8MnxKUaQovoYR3ZTPbDCFsX33ZuVb2gizlgeNtPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kf4eA/I4W8ZUBoLKGXfGCQs5+SsvZ6ktKPLOKE8r9c8=;
 b=opN1bDOxSCCFKxEVaTuOGK7/XoRiKVppls3g8U293SDfYA6H/4yg7fvL0M+t/MtPYmekWYhZsrkplqR1ZIpPArzjj4vIfkUzOrbj0zwkZ4zcmZFvnfpRBjsuGDgMqwh958OV2nSty1CTduH/blcTS9Yks83yTGI6rNTKiCl3hLA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6130.namprd10.prod.outlook.com (2603:10b6:510:1f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 18:35:55 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 18:35:55 +0000
Date: Thu, 8 May 2025 19:35:52 +0100
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
Subject: Re: [PATCH v2 0/2] Optimize mremap() for large folios
Message-ID: <3fe90c96-da4d-4240-bd58-0bed5fe7cf5f@lucifer.local>
References: <20250507060256.78278-1-dev.jain@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507060256.78278-1-dev.jain@arm.com>
X-ClientProxiedBy: LO4P265CA0288.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: c3adb27f-6c87-4a56-5725-08dd8e5f2b17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eki0tcb+bWD6+zFjx9xQjZg9nnSB7SzSngGdZpyo9JYLFgnIgYqKO7uc12UD?=
 =?us-ascii?Q?lku86O9YrxvS8OFZ5iF0zd5Fv6VrScKYLs+N/fDGEas+bQM7tiwDq9uQmJL2?=
 =?us-ascii?Q?ouBsV8qESHvaUt4iVQ8TyumDbbMNwG7LVhscEdJ47sA8aFKwtWz+ZU1NXJn/?=
 =?us-ascii?Q?aBaQoQRjfUR5LAqpd0T3k1Ewv7q4JMnq76oT/GaQQycMa1CLm2FUh94l43QO?=
 =?us-ascii?Q?LqyP4Sh5B06ddxqbsfLhT2slANh+mKFs+qUz9XB7G5ByRS9KOayOrC4zTv2B?=
 =?us-ascii?Q?7GfA34xo+SI6I7wCCk5v8JYce9NVpU3GADDNi7QubZaCKo2HG0Him2G6ViSJ?=
 =?us-ascii?Q?gitfHPfQiMdY8Riduf3GHBPEdr4s1/RlRhIOHeBa6xSCUEBaDXEZazcsFP7u?=
 =?us-ascii?Q?i9QV3RFc0rhwvWY8DLd0fl4i5xJFTCaD3hNStbrpoilrhK3zc4pRS5cgrUlR?=
 =?us-ascii?Q?P3Wk1veQmV9PDiABqD/7u7aDU4T+CqV8qXLAqKAk8tRxQ/0mzYzIhxTuJzzc?=
 =?us-ascii?Q?4nulSxjWj+0ziZf22wXoxIXE/p40gf4JAZctdeWn4iQk/TvL/7GAAbIBJYpj?=
 =?us-ascii?Q?k9wXNBrbhMHssR6/Heb53zR66pCVwkXwGx+b5uZiIh3WPCM6RfTu4jeyzx1P?=
 =?us-ascii?Q?ToaNK976yaGp+P2p+dQH2mqPqjs9YTgqvSdqxip+5aGPlEsTI0UTWqzQzTus?=
 =?us-ascii?Q?NYuEuibEsrlmCxzn0JJIGvx27dx6V8LMWbHrfnbMFEKNRaEzBUmfB8bPR4sP?=
 =?us-ascii?Q?b7/YlxnF768+69jHhh6G+CWaHqFbRMpiNHB1dldX96nUh2GYHqINTOCT/IpN?=
 =?us-ascii?Q?gFUThUvZ9Z89OmzjOQwj7o3NPS3krSeK+Rr9xOI9/IFsfAk9IfJOhRhlXLjZ?=
 =?us-ascii?Q?442o2G8z897t/NDD8qVmdzsPtweR/zUXAcNdNnKQw+wKjH3HeYYRyZZMezSl?=
 =?us-ascii?Q?ESIsU3xva/nv1CpH+Q6fAlKxbiFdDNyJZXOxp6rGTHlxsPFva96bchaq5brX?=
 =?us-ascii?Q?/7evejeYdFDsv8fZ1/j/Krpu1h72vwi2xP+xPqW+7kNU/Ei3LpjFuBblY6y1?=
 =?us-ascii?Q?5/1+kFsuobmB9c9xFaa0y9E6Ay4QGykMYVUkrr3nFo+4VrtybcbKjVSOwB82?=
 =?us-ascii?Q?ZdNfVXcNLRqpbYB+ylfM1TvJ0Hi/RraPvifMSi3d3XQWEBg2v6Bb1R9Rkbz6?=
 =?us-ascii?Q?9lNu+XxScaXS1+T5Lxj11ckD5+fRbtyAFxkE29kzj+OQCVxC4O1JH58Gm3co?=
 =?us-ascii?Q?vAgnxEHEiII3nERlr1MgrqX8CpGcgctW+XUPSr0gl/z/F+7Vz0nbgKLFm5LC?=
 =?us-ascii?Q?+Nu4dMI9TSK+G4dNYDKmWiApCiWFIE/mFZACFMGoMPBHPzJ0G3zWLlhpzPDb?=
 =?us-ascii?Q?Q5UYog1hXmLxyEGU32YdNAOzfa10sUzfcOvPwHI66TXe0clKsvUZMAyDXxnC?=
 =?us-ascii?Q?xhRvLHZQe/o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u3Glo2omT/pKdKR0zMwRixtgRB/nDhm6wdyniqhpV2BhEdNMEE3/yaUNQ13i?=
 =?us-ascii?Q?zBUczj2ue21vzGwr4XAVWznPzSVKED1sH+jWWP3gcTVYgS6FwJiHsV8zPo2e?=
 =?us-ascii?Q?NSx3HB+IrC8LFr7nnWggPxvKS/+aysg+NODhmL66cNOl/v0KrmCHmWMTnobr?=
 =?us-ascii?Q?OXVIDn0hA59EDY36WxtvlTBb2Az1E1uO25a5p1FGoovbUi6yzEogs8WiltDQ?=
 =?us-ascii?Q?sOXWm2eqOnjB8ge1hFDedeJMtm616nHO5vVi9izTTn5WcCys3+u1odyvm6kj?=
 =?us-ascii?Q?CGjNuNAmvzAQNh1NCscf1yTXzmIXDLrGn5QnTeK+rCtEfj+D8pgmPqH9gVmY?=
 =?us-ascii?Q?qy/CcQGt5AaZ9WPAPAbA4j0ho9ilw3BPr+sEs5jNpDkF4ExB45edbLE0YfH6?=
 =?us-ascii?Q?tNxEIwnOdG+Z5ZmYwkQ/hfwRcWWvA737L2WBPYlGNzJ6WFrUtTKWRozj554r?=
 =?us-ascii?Q?eg8SX0P0RiLCfLcW9zx3cVT1UZnyhUoEsRoWDPn9dufEE5+psostChkrylpT?=
 =?us-ascii?Q?sJfKPO+Gt+w4v6RpWoarCNyf0peL4xNUei2fx641B/0MRIKwCviTcmBFY4/W?=
 =?us-ascii?Q?ZtTLXPosjUmCswlUc7QDCTdXLOBuxMfYF0VOr4bfr1F10G8w11VET5vs2fhJ?=
 =?us-ascii?Q?KudpwzlFqs243lBhcFN6E5grruiVNF/p9bYMq9Y91Bv3M5RFh2Ca0TsErkpI?=
 =?us-ascii?Q?g/mR9/te0wGch2gGdAXCz0PRCYjS6iAneFHhCoBFRBLZF+SMhUTSSRwJ6XK9?=
 =?us-ascii?Q?+RB7jGUYnxTE+tl5XPUPQmZYnFT0vv3X7vt4xcQ13a1pHXhBL4O/c3Tny6tw?=
 =?us-ascii?Q?1XwFQaos1SQRpTi8UlDr+MvYDvCfhy5VsIAg6KAYenxZKFZwo6jkh1YaTWES?=
 =?us-ascii?Q?T2Ono9Ee3Efx6xZd5qvIWZ8Dcxn8njug4Mgf/gYPn0bnD3c7R2ysSbhQPFn3?=
 =?us-ascii?Q?5zmD8xLmo4jPzsapBKhHs09hFYk9QSeL8japeQQ7DaLjJ6QdFwkKZqZEnQCy?=
 =?us-ascii?Q?xijKcxjzbUdlGYPxnYQoYR8tp7VIgEHPtsSguBbNfFE4cm6T4X08dSNXCGvy?=
 =?us-ascii?Q?Gj50+gbJB+qJ++fNm2ABTVmDSvGGRIEG/zeg6FvrurB4t1hcRnEFwA8KwLBf?=
 =?us-ascii?Q?ZYnsDjMixMbGB+MD3RQd5xlRNccP89iTaS4agHu9IQMqmpJ0/1foD6Q/uDUh?=
 =?us-ascii?Q?8Uh/ZYfdAnzMa7CoWFpX9enyWbqjPM4atQynS/41X0uTCAzhHbNgYUFdbSCg?=
 =?us-ascii?Q?JpVx4+zW1gi+9rv6OGe6eNMMZSvO9/RTkzkM6tATl9/fu90kMWyQOFTbbdKs?=
 =?us-ascii?Q?DBUvtIv/uyiL1l7EWl8JoZ+qjBU3p9SG4GmhHGMMWl4Zujr8PSjkV0Ls9rAE?=
 =?us-ascii?Q?dudZ9ZD5APPABNRgoJ0/2sxgWDky7tvbRGmledYMTPkTZjqtIK/mExwPyv25?=
 =?us-ascii?Q?3U5+zbd216b2ntfUp6V2VLsUZsPdX9bHMTLADdcS/u5NDBb9QsIspwlmSOSf?=
 =?us-ascii?Q?oZ7CIw9CkBp5/tuCmJiCbWfIi2k/oq4GUfFtvQxzk04fnd6XFP8QIQCWrmeQ?=
 =?us-ascii?Q?wobp2Czq2PdGIetI7DCn18QVBjU80qmqkbMLOiqxlf+oUD3v4MVNkiHSNTHX?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	WT5CKHcUSOsoBykcwlTaRR3UDSUodBAY1aFykgdFB2a332bB+SOt7SPleMFJn8JAD93h3cxH/8CFfneR+dTHmzUpnaWibV//+KlW1FJUSLOP/b4PnTvzUKRzwK0xTq/YgbQUQf7FubmKdaazY+oB2DFpjpkxFr42BXl+hG7Jo5780CzzvVIWSVLk1HBeBKnsjiW/rAsF9cUeXlYFyNdB9iXfmJ3mGGGBiEppuXZtbgSjGrgdT7I68q7cBOK0eIzEli6BY8tSGbUELdTrWaX9D+mic9RURd6JcySSHr4ltvOJ4uXBCyil+NZYpgyEZAMP2r8qDSYsbaVAyhjzy/3qq4oFumuIcnXFEb1qSECKuhIYN/4Y0xcMqOzWDhSnJK2t8FReqhsbbZvXzy+yABNt5sszCO5IDQQ9jVvMiowxzCXHnTDeOC8uJlE6cIGNnNrWt1jCRdqJ8awsKdd1iRLVE23upSgIhrmf6SC/bkP5pfTEC+hlkF/HFHsqsd09nsTBqm7eg3iAxa3afRGqrSsqHkaAUDzVHqWvX99+OJSH0JsvFfovwC79DxtpDJu566fn5VvJ7xVAGi4YBx1xwjGqzzYJdfnHaFke1lzkWvjK2q0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3adb27f-6c87-4a56-5725-08dd8e5f2b17
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 18:35:55.3456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cklB0SzVprGLokG92JmdIbiFmFT2O+nvVX1ArCZJ2DSHcK8gIHS+5j0vIRqwrKtfjT3hT/+fT/RgG4QPeVIx5SIoSfMf1zfXPShssej+BSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6130
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-08_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=977
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505080165
X-Authority-Analysis: v=2.4 cv=Vef3PEp9 c=1 sm=1 tr=0 ts=681cf9b5 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=mDU0jbi3GvGrqPe9vKIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: RVLhpknI0GIm-ko1TgAQgAL54-9oAX17
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDE2NiBTYWx0ZWRfX5DsHyFRGMayG vXer3qedlelFU5YCVW+7eTL9nsltZ4uqsrpeDp220kxLscead0WlNl9OMZmZ9o7O3Nl7vbzgv2c a1IUvHFmKCUAoM03wcISnSzOSDjqeMTYs4XmR53pFcYtYbl1PjucXuLPTNNDvw+QtitD2EYYWCe
 5uQqmvcughSREzQd4B500ToGN6B4YHTSwsNKib5k7M5gP16df+H79e2bdqDy8lOd6q3k7vw+aK1 1sWnssFtkXXXTt1IcU2uyhrFor/MHC8oz8gllji8d5lvGgcXmT+ebqWYdiLZdrFpQ1/6Ir6S/lu DzncsAH+3L4BusV4I+2C9GjgYN9XYZ4A+lRcGzmApKQ5CCnaaHM8l3kVy8Om7tKbX9Imah+Y8ex
 pGcp9BVVtgRALydObleVJQ/DR+13A0DaFeqlOgKzSH2G2EYP8fOktQhUl3wRpkWUYmCJTwb4
X-Proofpoint-ORIG-GUID: RVLhpknI0GIm-ko1TgAQgAL54-9oAX17

Dev - a general comment here - but let's slow things down a little please
:)

The mprotect() version of this is still outstanding fixes and likely will
need quite a bit of checking before we can ensure it's stabilised.

And now we have this mremap() series as well which also has had quite a few
quite significant issues that have needed addressing.

So can we try to focus on one at a time, and really try to nail down the
series before moving on to the next?

We also have outstanding review on the v1, which has now been split, which
does happen sometimes but perhaps suggests that it'd work better if you
waited a couple days or such to ensure things are settled before sending a
new version when there's quite a bit of feedback?

This isn't a criticism really, sorry I don't mean to sound negative or such
- but this is more a process thing so we reviewers can keep up with things,
keep things rolling, and ensure you get your changes merged asap :)

Thanks, Lorenzo

On Wed, May 07, 2025 at 11:32:54AM +0530, Dev Jain wrote:
> Currently move_ptes() iterates through ptes one by one. If the underlying
> folio mapped by the ptes is large, we can process those ptes in a batch
> using folio_pte_batch(), thus clearing and setting the PTEs in one go.
> For arm64 specifically, this results in a 16x reduction in the number of
> ptep_get() calls (since on a contig block, ptep_get() on arm64 will iterate
> through all 16 entries to collect a/d bits), and we also elide extra TLBIs
> through get_and_clear_full_ptes, replacing ptep_get_and_clear.
>
> Mapping 512K of memory, memsetting it, remapping it to src + 512K, and
> munmapping it 10,000 times, the average execution time reduces from 1.9 to
> 1.2 seconds, giving a 37% performance optimization, on Apple M3 (arm64).
>
> Test program for reference:
>
> #define _GNU_SOURCE
> #include <stdio.h>
> #include <stdlib.h>
> #include <unistd.h>
> #include <sys/mman.h>
> #include <string.h>
> #include <errno.h>
>
> #define SIZE (1UL << 20) // 512 KB
>
> int main(void) {
>     void *new_addr, *addr;
>
>     for (int i = 0; i < 10000; ++i) {
>         addr = mmap((void *)(1UL << 30), SIZE, PROT_READ | PROT_WRITE,
>                     MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>         if (addr == MAP_FAILED) {
>                 perror("mmap");
>                 return 1;
>         }
>         memset(addr, 0xAA, SIZE);
>
>         new_addr = mremap(addr, SIZE, SIZE, MREMAP_MAYMOVE | MREMAP_FIXED, addr + SIZE);
>         if (new_addr != (addr + SIZE)) {
>                 perror("mremap");
>                 return 1;
>         }
>         munmap(new_addr, SIZE);
>     }
>
> }
>
> v1->v2:
>  - Expand patch descriptions, move pte declarations to a new line,
>    reduce indentation in patch 2 by introducing mremap_folio_pte_batch(),
>    fix loop iteration (Lorenzo)
>  - Merge patch 2 and 3 (Anshuman, Lorenzo)
>  - Fix maybe_contiguous_pte_pfns (Willy)
>
> Dev Jain (2):
>   mm: Call pointers to ptes as ptep
>   mm: Optimize mremap() by PTE batching
>
>  include/linux/pgtable.h | 29 ++++++++++++++++++++++
>  mm/mremap.c             | 54 +++++++++++++++++++++++++++++------------
>  2 files changed, 68 insertions(+), 15 deletions(-)
>
> --
> 2.30.2
>
