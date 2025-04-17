Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEF8218584
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744880668; cv=fail; b=pfimEVMwGTUxnwfkG54qIKUP63tormfeodDJv4y6qfpD0ANFzUsS1hYPFvA68qkBlskjnkrjQh9GCGemwvo21+kRVaug0LZ5Pt3wQHyqx53f1OFvIucWIRUU0fxZMDskUI7AMY75LdXY8lsosHTq/B5l7jiQPib2A0rRXKt8fM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744880668; c=relaxed/simple;
	bh=95EAz2MctfVmmJKrJspgzm5BSVlSwUN+wf5giFhuJF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rc6SB/tNp1oSQOBaRlQ5DMnoB57g46Ms/EWIOie3pW+oGNfY1fnpeRGlAQSsTy1Ej08g2ZDZTy5fl7/iSlRWeL/T86gFaaNcPiE4P1hfFub7ZW4i8VI5KJdfoEkQAGOUgO1xbx3L3vvJFmf0AkU5NT1dXR51z5d6STbJZVTeL8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Zf23trlp; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jqlajcYu; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Zf23trlp";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jqlajcYu"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H8BwE2015272;
	Thu, 17 Apr 2025 09:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=HbmnuDxDMuZ5LA84sm
	kNnrKKYLlcMgFZFJ547gYJHAw=; b=Zf23trlpqAjn1C+fdzk1bxUOQOOiKLBsVS
	tWdpbv5QKQlkM4096EGjUtOeJ9ttr+DGGjkEIEG8d5+UF2kDdhqTVc3yemrGQYB+
	BV3XqCNIaJyVFL1SCPgVYEz7pWB4YGYD8EB5uLeZktrB+M0Nwn3WPoISzFzCs7BZ
	rWM36KcC+qwqKeBz5JYcB+2jXT8gpyBfllZMSGtFkeJ2txAseOyBmHYXYHk0SEJ4
	RAdXOeKxppx8TQsm5OMKlE/S45ucKy0epWFaXCHngRIKJExG6SopX5jI+SbMg+x7
	LpJ/CjdvfU+B9G7SwndvCOu8h2sVpF0UT6FSX4FxaSt4Bjm9pI3g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4617jue2jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 09:03:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53H8cnQW008610;
	Thu, 17 Apr 2025 09:03:55 GMT
Received: from sj2pr03cu002.outbound.protection.outlook.com (mail-westusazlp17013077.outbound.protection.outlook.com [40.93.1.77])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d2t06y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 17 Apr 2025 09:03:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpF0umSwepMJkFAXPYW5RtTefpFd6CWMGQqs+zv83HjNXCeL/SXpJAKFeZqVatHkLA1lgYHd9w82ktELBERQC0CbnyNsh7X37kmiCaZi+wKnXtu0ioxCICBA6QhnKr4rfVDFJZ1lbjoWYKjZvcsetDOi8Yxiz6gCervSGOcTc7LOhchRw+JMwreWJM0+E4y/sl9bqQS4NnW8DMb+OPOX1MIf7rIsMQ+Aj7COSut3Fw5LKiTS626ZPX38C3IlWMbqx9IP/TcwphxWqdAhw1t/OKQ6i5wu4MZb+GMQo9g8rnLZHSRjRUh2daV/t4nTOR94bAHDaaIfvLNzt1rj/Ck0VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbmnuDxDMuZ5LA84smkNnrKKYLlcMgFZFJ547gYJHAw=;
 b=OlwpfJFdubhPhjKwF1h1TiO7DcS+pNPt5NviMNA05iHSWmbc89L/7EwkdNGryUK9uagSAhNlAxOCAxbTF2EHQakymZBoQqd5FAVVcVQxfvbUHGQ7TQBoAtVfz4y6ghnZaveN6UA560r9vxEW4Ezcrr8YkbW42isYchg4OGSRjR7e6MOVZnAOE8fs+0CnCQ/EZA8F2vj3vrQO2hh/kTqQWoGpYMsS/SRHo8EZLqAY+tmtpISaEsbYiF2dEwqFgevFOczG5+G8Y1bFyjVa3eUYS9Tc0yfV7W1pNHnjIbKezxE1dumJH5KGnCgpwlLFDowqdc6WPcW7jLSFAN1OwGmjIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbmnuDxDMuZ5LA84smkNnrKKYLlcMgFZFJ547gYJHAw=;
 b=jqlajcYuyi69ajMXMrcBEeLy7zU71TaYNl/dXc6VAWwEZafYQt6XUTm9jEyDZPrkMFD+5nJ6YkVMSbFltBDVdwfutJPxyKXgXadeVMfLRPAlg1yrVgexnLfeFA1dWYy1qhVWW6rM3FNmwPiWsAsNcutL7ciCrmGOfCHo+d/jLrE=
Received: from CH3PR10MB8215.namprd10.prod.outlook.com (2603:10b6:610:1f5::7)
 by DS0PR10MB6869.namprd10.prod.outlook.com (2603:10b6:8:136::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 09:03:44 +0000
Received: from CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90]) by CH3PR10MB8215.namprd10.prod.outlook.com
 ([fe80::e4f5:cb34:9b58:be90%6]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 09:03:44 +0000
Date: Thu, 17 Apr 2025 10:03:42 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH] MAINTAINERS: add reverse mapping section
Message-ID: <7abfa35f-96e3-4942-abcb-48cb726f7aef@lucifer.local>
References: <20250417084904.16806-1-lorenzo.stoakes@oracle.com>
 <eb71267a-80ce-49f9-a475-5260df607458@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb71267a-80ce-49f9-a475-5260df607458@redhat.com>
X-ClientProxiedBy: LNXP265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::35) To CH3PR10MB8215.namprd10.prod.outlook.com
 (2603:10b6:610:1f5::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB8215:EE_|DS0PR10MB6869:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d3a433-8d0d-458e-6499-08dd7d8ec16b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I9TJPP36Igj4Y5nKQo6eJAtA9l5ZFeaxFx9UF4H1+ZFFcECdu+aqSa2vLJ3S?=
 =?us-ascii?Q?lM9yqjLxImlBcIUwxKu3jW1qEx+UjmTBhA1jDViHbBkj/UADrc8t7q/cpA86?=
 =?us-ascii?Q?BcCwaQ3D8ecvDt2F57sVqpIQxNTl6so9UmuimOKeMGJTmqCUhs1VPHtU3fK0?=
 =?us-ascii?Q?HryV7BnMasV87W3vc2B4zfxIvAhrujuNccGypOSQhyRmmdbFWwkajGHAEYJl?=
 =?us-ascii?Q?+vpZg343k77W+l7TNn2vjLSyDUSHdBuwgeb61CASzg2aRZjFeSDrmQk9F+Hd?=
 =?us-ascii?Q?F6aZe+X/YVw6g3hvxR4gKNRLBIoWSYgvamgP6/pjK45A0yzegByTG+oi87cw?=
 =?us-ascii?Q?Q0H+y+yQS+V3odCAB3MYhSEHt6XFoxrUiVAHxKNFFx1/jFgme3A9F4+zD2eO?=
 =?us-ascii?Q?BajTZzp+AFxdQZvGBIh4Tk+DeAkiL7Fq8IFc5z38AN2qxcWZgmMRYjllbrs4?=
 =?us-ascii?Q?D5D+dDbYMKp1HmUOCa/KTUgBXhR1Inb1J4CnAdhq1X6mrFgbqujmkNwVGkOp?=
 =?us-ascii?Q?Q923ZDDegcQiHJuAqe5MFANo143WxkE3tWaNX5hDANrwe+kTZoSwIOpMYMLx?=
 =?us-ascii?Q?ZWLFUq/xAlWi9C2JxAMmgkbxWfxmwE/hCL7L7rU66A2Urxq2HHivdyvjsEem?=
 =?us-ascii?Q?GbuKzBOFNZGuLZHovvEKdTQO5ILjNWR+tZXxfYea87oP6nM6KsMivYHQkMw4?=
 =?us-ascii?Q?87jj0hQK6ghjHKNSXz4HONqTOAE6lrBR+kniHBq2i+bubOLW6JO+5VKMcaRw?=
 =?us-ascii?Q?HPiVXzziCldoLl72gi+ZkWehD64dtx9AXvQSIai3OFyU6cojJUD00sf86bOH?=
 =?us-ascii?Q?nYGILpEF5EkhodGffoMMnfXoA4QJhclgONd9haTaxC++udHShs/o5deL1g2g?=
 =?us-ascii?Q?paW0vEkV/WIxEJjD4gfySl7BI6UTgvNaswmaqL5hHd36XqL01VBh0JdlE3Aq?=
 =?us-ascii?Q?SqZL8VFOgzMfJcrOiVRLzkGQsuO8JXzPdjvbuaothmkhNV7Yw7mSGt+EwmOO?=
 =?us-ascii?Q?oN+Ptm/CCOdnbdNtmn3IUiZ2BUK+fa+42miggj5waEJcd2D8i97WIoyodFFg?=
 =?us-ascii?Q?5MSqlI1nEC1F6WN+YOHyVqvinc4iu+pkcUJHIlbImSiPgUcAva4EmKv0+Oiy?=
 =?us-ascii?Q?XJRRUMusUh8h5zPb+xYeyq3rq/LkY4Gc6z8E3GDIjb9TcXbm+96CSXaupgkQ?=
 =?us-ascii?Q?X3beOZBqazmb2i/bppWFP02CZpXWymrX9wCmioR0YhDIUmtViwn1lesaT+CN?=
 =?us-ascii?Q?NvKTmkx7bHFJhkIcKOF6T2mJuahyvPoCqNwfGm4aCHgf1DA37Nmb8DY+dYFm?=
 =?us-ascii?Q?Bp8cUJ9bfiU8LVrzbnAmZ1ZU3HqapuYk7MAW+5zvqPiFLYq36MvCVRV7+CJp?=
 =?us-ascii?Q?utZIa0IOJgniq/gNEDeCTphlSCOx4SHVxMj+Zo+SeCeUQqAkKXqnGIWjESN3?=
 =?us-ascii?Q?URDBxVmfNFE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB8215.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AccTk+peaIZtHzj7Xdos+7TwOImoO5bCLAjQ2pV7oigNxdIA1Fzt+l5PBUvD?=
 =?us-ascii?Q?KYsM8V1DK3JmaiuCRa8cdpyMJqzXVX8+4eQhxgI1RK5zwBdR0QSHXQ2doVm6?=
 =?us-ascii?Q?hhRJtyMQaC4x+GK8zy5ozTgCmvrBCFL9qPuon4VoafZs/S7gO4q/5W5Ol0MF?=
 =?us-ascii?Q?X+rkZcrNthkAsCkFOEqYCkhaU/iT85b4G6qoEHv+0cHzJXfNKx7a/nPG+VC6?=
 =?us-ascii?Q?4/AnwGUT5+plwDQPsP3z/fOv7thoyaAr46W8ZUZuLawadID6tmsa3ZBqSi/Q?=
 =?us-ascii?Q?IOcU/rAOT6Esg9+M+7CrVRxrFKJqgfnp+UMmyqbkbZSnqRn/8YXSsXPLiyMH?=
 =?us-ascii?Q?bAegDUxie5Nc9dRfF+acn+ziMaA5elhu5cGs8HPr4HfAAvJQ/nRk4pNaEomm?=
 =?us-ascii?Q?Q5SoEj5Qp+B+DB92bTCSUSYcKwR9ecAG4GpLqbmV/eobbAZXgg2s8RVt7tv1?=
 =?us-ascii?Q?4BaTyEPBJeMtz8N2kOK0g/xp8gq60CU1u33RG1d1P/KO7xbp8a9EFSMbWK1D?=
 =?us-ascii?Q?ZV7eZhjpo6/lVeE5EtbCeJfhkRZgjclTCsMlhjlkqyPhR0xs1U0DrUI9wn5C?=
 =?us-ascii?Q?0WWU2+fYds+PyzDRbNrmCwEfKhXRZC/vtyd0KdVZwjGIiIQCm7IU/M9ZOB6R?=
 =?us-ascii?Q?i+6PRcyqB6dPHkK0quWQpnKmNpzNaVltdF71T1+CS0u/YCQ1mdDu83kS9DkY?=
 =?us-ascii?Q?XikNSlfE5TCbI14MJNFsdGnCWfTzSo5As+4WDwjcUYIA3bT6g+u0rE/WQSn7?=
 =?us-ascii?Q?U+80ek9nritHjqAr+gEwcfJX5g4VA8Ca2Ko1PusnAOe/wZVj23ISF3uo/pxQ?=
 =?us-ascii?Q?fmPwrvx7cpEvs5T7G8/+oqABzn7B7p9zBifBOaN7EfMKpc78dEdI7NRUKawG?=
 =?us-ascii?Q?+5Ul9+Bp6bds9zz7ZenSJxJoJqCErv2Oy98aqtZjLOwO6+rH5xGYEccbffKB?=
 =?us-ascii?Q?2y7Dyfr7rKt7HKJMu6/kyVt2vNVEj9RTA0THw0qbQsQ+b8D5eejEpQ4RCfnZ?=
 =?us-ascii?Q?O8pKdm81f82Vt/asxMKrIVD6s0azWWs6YTmcbJDiO50vwOaRVN8AqF8YrN56?=
 =?us-ascii?Q?1cKWFnsEC5OQD/PkJ6B5ixa/HoTCIYRXkMlS/EAgCa7UgA12s3wu9GzdY9zg?=
 =?us-ascii?Q?0H0084SU2oujzaKLJKvM2ThIVm7OEytU8afJ2ig/RhwHPipKaimRYQgcNRpD?=
 =?us-ascii?Q?EbdSlivTqe6Ge0Zw5ykfv96Nfw4YIVG+rVL3gjbsjgoJ3LfIbAbOXxXoOSMF?=
 =?us-ascii?Q?p33IkeOVbM5EgrKy/RWPduo61etXYhOocM1lsjnRJAPuImR6GwOoEkxQC/CT?=
 =?us-ascii?Q?sIpY6ArnaaWwSWtGE/PXtYAL95gHnwunIEoksPy4jxgJzAAHNfgl0NY8QQg+?=
 =?us-ascii?Q?kPhLcLx+5Mmpa5xW3xG4PAMBvS+gJuXCYlLT3Yh5vxMzr0G0aZPsfGRwEOpR?=
 =?us-ascii?Q?jXlfC6PZkRp2c/ODwyOILurq4DsFgk0E/yMUVwCO1klHoY13wAfwMfSiTJQI?=
 =?us-ascii?Q?4Jc8uWwsQGQ8bCXCR8Z83eG5IIH2AO6yfxgYAVcA6XWHyUdp2Key/SGNptc2?=
 =?us-ascii?Q?OfXjC2KH6Zf7By4Bx91ygrjEffH/H/vdvqQhfhoFUoQDrLHRQjHO+tDzx6RA?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	w/truV5pvS/qzTQwX96dGxeXozenLthreurfzyG7IQYil/oLutAUDzEcJ1Y/5Hm94QtmaXX2pE871py8q86ukbLwAaZun8dLJXxj8hq4oqtppXB4pFhF+kmVLUjVz1ilWPRE78RNEjeeGb0UGz9Z+r8vIHepg5u4fqeveoQjz8IlqXTLuIH9T3HJmedzTha4gMo3DdmliEtFAXmEO2a5dK0NJM9RGfWQar/Fe34EZDnirpiCvEcHrRzwLIZsc4+rInIxbSH0koabyIBEM6VYKc8oOEdf5xBV9TToCE6nnpc+WWg+gRtQxIzgh2gGYSP1MljikKmtEIVwQQxoEVp5shYF/as4ckABV/55a0MbV+4Bs5GI1O4Df6nYP+mbaAkumxX6rf0+C6p5eX6ZVvf3MH6Ry+cG4qvFyZ3eRuRzHm5EkrwFjk5kwrF43zcqFulLOOqgjEOt8wAfINf146mOFo/G2z/T06IZmkFYnyCSMQPrk/zp7RZSNE/AwXQz8HJL7yNJuLOOWpOcVW38aYVxn+CEWLVOYCMQwxycwmscnX7i+q7cdna4Wo4u3kK42OLwIaQEJaZ31h5pM0+9hhw7L1EWXSpSpkcQM+xbXlaqi4A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d3a433-8d0d-458e-6499-08dd7d8ec16b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB8215.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:03:44.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jz9wds9VxqMaTCNeGTNZxoy6scgmA2HPmPavuLAaurN8Y46Na48uUrT6DZwupLMhqAC7uXom/zpWysQuxSAmRcF8JoNypzUO9vuK+YoPYyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6869
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504170070
X-Proofpoint-GUID: 51QkjbANcvXAVZeSg39-_Nfb5Xt23kgw
X-Proofpoint-ORIG-GUID: 51QkjbANcvXAVZeSg39-_Nfb5Xt23kgw

On Thu, Apr 17, 2025 at 10:53:33AM +0200, David Hildenbrand wrote:
> On 17.04.25 10:49, Lorenzo Stoakes wrote:
> > Separate out the reverse mapping part of memory management and assign
> > appropriate maintainers and reviewers.
> >
> > David has long been invovled in work with the reverse mapping and continues
> > to do so, so is well suited to maintain this area of the kernel.
> >
> > I have a lot of experience working with the anonymous reverse mapping and
> > continue to work in this area, and also have good knowledge of the walking
> > code and code related to VMAs.
> >
> > This helps people identify who to ask for help, and also additionally makes
> > life easier in review.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >   MAINTAINERS | 13 ++++++++++++-
> >   1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 8d834514a047..4f6d09c3fd9d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15499,7 +15499,6 @@ F:	include/linux/mm_*.h
> >   F:	include/linux/mmzone.h
> >   F:	include/linux/mmu_notifier.h
> >   F:	include/linux/pagewalk.h
> > -F:	include/linux/rmap.h
> >   F:	include/trace/events/ksm.h
> >   F:	mm/
> >   F:	tools/mm/
> > @@ -15539,6 +15538,18 @@ F:	mm/page_alloc.c
> >   F:	include/linux/gfp.h
> >   F:	include/linux/compaction.h
> >
> > +MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
> > +M:	Andrew Morton <akpm@linux-foundation.org>
> > +M:	David Hildenbrand <david@redhat.com>
> > +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> > +R:	Vlastimil Babka <vbabka@suse.cz>
> > +R:	Harry Yoo <harry.yoo@oracle.com>
> > +L:	linux-mm@kvack.org
> > +S:	Maintained
> > +F:	include/linux/rmap.h
> > +F:	mm/rmap.c
> > +
> >   MEMORY MANAGEMENT - SECRETMEM
> >   M:	Andrew Morton <akpm@linux-foundation.org>
> >   M:	Mike Rapoport <rppt@kernel.org>
> > --
> > 2.49.0
> >
>
> Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

>
> Let me CC Rik and Hugh, if they also have interest + capacity.

Absolutely, apologies I am sort of fuzzy matching cc's here based on
assuming that you guys might not be so interested these days :) obviously
more than happy to add entries if you guys have an interest! :)

>
> --
> Cheers,
>
> David / dhildenb
>

Cheers, Lorenzo
