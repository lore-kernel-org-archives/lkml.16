Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EFC17E4
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749207911; cv=fail; b=Mc7e7Hr5z+NaLwXdsnsDiPdHK4i8tL6oCa3QolCXQRNLF1Dodw/bhj8E2U+QVXbxDcuGIkd3RpDidAv9gdVTOeJ3oWpffQ+U38bOtfS6fPgWn7Ikq/jJ1HLiNddAQgoLWokradqOsgUs+bBVv0loAeJY6Qcfe+iSlrjJBYX2CUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749207911; c=relaxed/simple;
	bh=eVGQ6sjCTkwi91ChrYELA4ArxJkBdwdilbDAaTJ7Q7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t4mH8QS7IlIpBNIea11epCtDizjYWN4hn4dmzvPuIbffTqnypNlqJ+qDm3qNlB5QH3xoB7/UMDsuO6/WWKYWUsqmuWpygLUbqRRql5sGGVkXNPr8imMQ/doodUKq743YnG60X1tyBDjDYp0YrWoT7FPEUOsBi6jPoZW/nvZdCtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rBWUJdTO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FlQzq94u; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rBWUJdTO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FlQzq94u"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565OMxu000307;
	Fri, 6 Jun 2025 11:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=eVGQ6sjCTkwi91ChrY
	ELA4ArxJkBdwdilbDAaTJ7Q7o=; b=rBWUJdTOPLRF+/irW2PCI9vX6OppsSA3OT
	oeS3gnX+mz63RuejRaTRqERGrgrgl3JxiEQ+66u8Pv223Wlm1SvqO/jIrLgOCPI3
	eUvUjHS05d755lYDW18m0l+VvkaXbyVddCQIFIO89xuuiKWwED1hbqbY/j1JkVI5
	acZvs//iS7FJlhrII+lntO6yozWj/pioRjJTm8EG9Bzn6RKH3Mnx5rICmzsSCrsS
	+0KAHWt4b00IcrA/Hgh1iURfPzaqt8+yzHJc3PyILn2/2p1dtmK+Txlwe2/S9p1j
	VJ4GIuvuxZFLiNLdZMnB9/W1yxzrWc7WKcjTUAXB0uNBySx9siNQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8dytxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 11:04:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5569vhPP034987;
	Fri, 6 Jun 2025 11:04:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7ddr29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 06 Jun 2025 11:04:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loiEqeMzNrr+ClHtLZ5PlGd/DMuehG5JLc9xtTbvOkQRppKxTVvpF/u2duRHbb6YgjOduRZRJMSlMXr50+wIarY5Kywvp+INKLLnmN55J1d7JGuIsB61vdpGVBpkw9Jp+fVd1TYRF5EdFp+NrdWXB4lnpJ1v//0eN6xBQm0MyKdNWTY8x3Py5kXJLbYyDkfftSz/qna5zoBZzb+pJkQK71CeOoKqe8Klt+FPly/I+5fNgNjH+qo6azie877oiE924EFlCoVW7RaOGNFEcUQMGPwf6pWmcZlN77xQ/FmIIF24m+esFKV7/eY6E38Z6v+0sCIpqwVisMgKgyptEy35pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVGQ6sjCTkwi91ChrYELA4ArxJkBdwdilbDAaTJ7Q7o=;
 b=bnPT5+2dvfEbLB9MzF3o0Ss8BsySR/lMtA8urzVK6HQtvt6z1uDrapeozbWoN7ofAEn0n6gpji6NtpzAmbRf+fQt92xXK8p4c7I4cADdPJ8GwsbimDxjp3opPUj6YJHe05iyU0n6smVaKXzA2SnOEt14bF4UKbfXRUbO65o/05ccuEyg5CtFyvhYblvvmgrlo2NXW3ocqE4Ysf3pAlH+fv95pjnr08rlOd6OxXQM96LFWRGvI9/y9iE88LUWEGGm5Zjh07rdeYB2xn/1sZyd7yHiAcCa9kyT2to52RwIOEQaqdNqvP55Z0uvdIgHFqO4refK4Wr5ST1m4BQEHIQTWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVGQ6sjCTkwi91ChrYELA4ArxJkBdwdilbDAaTJ7Q7o=;
 b=FlQzq94uIyKHXi1ErDYW/YtMF2JP8oydWJSQItHqgGA+BS19ipHreNDVLw+I424zIGHDH7HSXfxF+9/yjXY17XvQuIbuhU6+ratGqUBqtWAUtWfsOSvQzptlHAMxixJiAK7Ydzn8BimbDthPh4CzF0CG1AlHAixMsRHSEe9mU1U=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CYYPR10MB7570.namprd10.prod.outlook.com (2603:10b6:930:c0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.41; Fri, 6 Jun
 2025 11:04:52 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Fri, 6 Jun 2025
 11:04:52 +0000
Date: Fri, 6 Jun 2025 12:04:50 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
X-ClientProxiedBy: LO4P265CA0226.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CYYPR10MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f99689-6ced-4110-453f-08dda4e9f684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M8F2rOtg9pRWyW0jJaidMARQLfYhi+dGAuiRtNjT8KHlcJAjrLRoeth8c+I+?=
 =?us-ascii?Q?+92NaOZOmvXdnpQHaUB7rRxJ6fwnkaPKOJR4041G0fVlr4aOfLqHM34BY76/?=
 =?us-ascii?Q?8v3YjM3b1TF1Wx4c2tjw9+52o2B7GVczK42MVn+xeXpJj/KROOfEER93w+49?=
 =?us-ascii?Q?tKU1NY0+TO9M6PAdH6ctkjI2zce6vIlJGYWIC2q0hEU4HEsKWCU1vW+e+Bov?=
 =?us-ascii?Q?nRiJtCuqsrlcvAZ0kSZZrfR/fmWttZpSccMEpy7klEYANWAgOaGQPSRnEOHR?=
 =?us-ascii?Q?kCYKWIdB4e/uY9tgYzdqP/GkpC9uurWv1UyA5fX21DzfqvQK+RthOgK97x67?=
 =?us-ascii?Q?nn9kvEEl+n53/FFlSTwxAoUWZ0P/NAa8kPnAJa9mFgrIG33fFckJugtqBStB?=
 =?us-ascii?Q?bPPsJhDieh51kYPs5Jfb/cfqu0mhQNio+eqqZZSBnT8mMmVanHm+qmeDQNf+?=
 =?us-ascii?Q?3HI55YdWIRWr8ffxt1cjd7Vwi02K0kcd1LeTOA+a9qoeD6dcWs4NQvV0rDIt?=
 =?us-ascii?Q?UZlCEUrQVa2SFTr+6IuKsZqVW8fvHwaSZKmL5f/838PFkbf8BLNKSgWCd47T?=
 =?us-ascii?Q?06CkI4rvzPSswkOaU4OfNX9AzRkQsfR3pZPWkPwiTY4VNrdyowBxZlGWy6fJ?=
 =?us-ascii?Q?VrVc2iuCi6qePRTuK72VW++Ew2ziLSg4qENhGEm/vSzBGG1BxaGsqi9tSMf5?=
 =?us-ascii?Q?lC9fN0fZRPaUGTjg4qAqYdM8avGY3Ikzif5NKucTWGctJl5gzdB4NwpBBQeo?=
 =?us-ascii?Q?lWR3NiD/9c9PndPxpVdAEbNx5WsJftHdyNxkw+xlbBHon7KmDQQbtOVqduzM?=
 =?us-ascii?Q?2kwcl+txbwBDmjXZ4KtAAf4U+WaHp2mq1sQAfrKkdnacZT7iO+3MCUTlakNV?=
 =?us-ascii?Q?edBe7ZoKPFXJYasvxMxdVi/nMXChb2qn68ygGF5YdBoo1AZKO6qDWgoohTgB?=
 =?us-ascii?Q?nXPIt0r9koqxXO9uQSkDpnqIrQWXS8nuEMb3mACevgfGvrORITsNsxg+3tO1?=
 =?us-ascii?Q?42tbs/HiumrEOTRCVfhGIPa1qe9D2ik7//xaYeN8z1quJGmEIpa6xog6TqLt?=
 =?us-ascii?Q?HNe1DKYpY7vBjdmvX+q7y6Lyl73KARFFFsYFcpLaMFwH+ulWjTlZ89iTaLWm?=
 =?us-ascii?Q?FxKTbe860Zs87Ei0t3zJzgOOtYMUi5Zd8X0dVUkQs2psmCE2DI1vwl2SqO8M?=
 =?us-ascii?Q?Q60jHepffhc2uuEgBjRya/iXdlCiWVRjGly47jx7PnN0Jm62vL5yGTlqJ5OC?=
 =?us-ascii?Q?zpMvTAB8TIVBJhW2zX483+KJSQ3bwM+fWUMf36EAbqKINmhnDVtrUGB9e8kw?=
 =?us-ascii?Q?fxd/i4dGKHFLvKpX6hh+/okx9H449TYNfA7ty9XEkSP8vM2oS480nLWc02+G?=
 =?us-ascii?Q?z/v3HaDQxPVHAWqS4vY3vjQLlIDzMS/dgP57fSNIcmSpxo7WDR142CvE0goL?=
 =?us-ascii?Q?rxZzX8QswhE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jCUvrmT32v+1XYoC0jB61FAQbLdvlRThQ6Jx+dmXDJUERWi5cgAFPKXDcxzU?=
 =?us-ascii?Q?SJx1Mkz3V560ezc4bqpJkCusYuMB98v56og6g6j38qE67V7NpB+dcfaV1x+X?=
 =?us-ascii?Q?CVJyWk8JoIolVosPvEtmqR2w3f9uX+Rkl8Nthx0QFxjFytIOVuwzUcQox00R?=
 =?us-ascii?Q?XBXMe2YVbgNYottCHQj0Xm8y2JEMq0QxwPVdjzb537b0dZTgY5xVSQTPJjFL?=
 =?us-ascii?Q?LnzOj1MOZMvHFiUeb+mNSu5gtOqlE80F0jmEaExZhQGvwf/DhWkhFuVHWc3Y?=
 =?us-ascii?Q?fc3ASuG0V1t2TMt1SzT86JPlWVKFTQl5KprUojgBkYv8N2ZdQmv3d4SfjudA?=
 =?us-ascii?Q?ijnxmq4R4yR3zuDWqotj2U6ibYcGh6bSOHODnF7+4VCjmcucWQFwKOcq8EUj?=
 =?us-ascii?Q?OJiuGqXRSZ5dJx0TB/FyO4ThqCZsAjTy2tlA836pPVaPkGvz3BkIDVDDHpIA?=
 =?us-ascii?Q?5nwBRP3DEMsICD4EWPzEr7FEjSBlt60dKu/iKyBbnQo9kBEjIyNTKGIQFS51?=
 =?us-ascii?Q?FilUWRjgMOovC0A8t0FnRGo3ECOEKJyp17klCtgSCR1h6hNPgc1fUP9V9ZUS?=
 =?us-ascii?Q?ugHRhqlYWEkkh3IhrnLkO9h4gZvLCjbYBHQrgibJ9A5poqnUv3zGH9CrfbSH?=
 =?us-ascii?Q?tJSmJ2lK/OgOc489Oko2We+2rGkHeejIjNVJFhTUEmlo6wLRWhytA/reIBb7?=
 =?us-ascii?Q?nsm8ShjKnLOpq5jjQQ4ZkRLu3gKB0H8erZ5g6um/wrAGAcjKOeQ0J2MDBwaa?=
 =?us-ascii?Q?QZ1GLoX9cpfD0mh4E8BHDb7J21IM8jg3RF+AMirPMJ1oYBhwr1XkJwBa1sKt?=
 =?us-ascii?Q?AvginRS9yxiY9NCU99Uh2O/UCp4mwrpBMlVvAVZ2c2nvrUK5/bKFzLl8BT1P?=
 =?us-ascii?Q?4C735yjEPL7iI8myrBm91GGDS6DvjXVkymvXbj5cyTKFPAEWNmHcKXk/tQyQ?=
 =?us-ascii?Q?XMGKqEjnsNMLoLE5YbDfDkZG73TDOTsNp+opqq43ZkzGXYfH8kEH5r1ex38u?=
 =?us-ascii?Q?Tit0cCVGwcK6mxaTe5GeDd/1/6xZWL3HxqWIT7/R4vDAC95jqtMIKLVNwO2H?=
 =?us-ascii?Q?cqNxhAckJw2xI7E4+3RYF/eLmX/yeInNZpMqIzBiQEHmfJHUNpTdF5Jtf4d/?=
 =?us-ascii?Q?eBSNshOZ2+4IGD08J2M7Aov4kq+adggUpMH+SGA5pAEotgpPSjITvb0KksRn?=
 =?us-ascii?Q?6RPQpjjoYEFCWFXhQXwtMgD+PBxLzNCcCD1IJSrKxaIsAiWakmkhNIMnqPKe?=
 =?us-ascii?Q?oKLzkrTYen47nEt47zw2g2WxwEQhH2FCJaroc3/9jBZOFWYC+8Q0SPKu7NTC?=
 =?us-ascii?Q?SuQq0Z5UxSogKeugrXy3L8Fm5OhcTTQS8jHKnuFBcMHVpKHy165pyO1klvCW?=
 =?us-ascii?Q?Zr+lDyt+0oyEJBt9C6/gW/CsP72+k805dxptBBwkHLNdB2PUgW2gYPvGLOYP?=
 =?us-ascii?Q?5Ra8WxxxqwzL8fyDcmRcQ27R3V9hVyIP5h1RtC8ZBFBkLAQC0MEhdWTasA8P?=
 =?us-ascii?Q?bcvjDOOEUSvvIIsqfyouCe112gqJuXN8NuRm60qQiOuHSBJ/bI7FqCPUdvrS?=
 =?us-ascii?Q?FtvGwpYrXrptgOxybdZSmYKOGsy2UbFkOi81ULfZK1zLulgzlVB0KkxDhgie?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o06h8QpBoaT5HCWIjUClsEK4szdTrUXASl34VmDml0rs/mzpNVVHR9Vns9QvGwFpP/0TBvGJsMP0hSPvLC54yHtw3a+pwy7TYFOgvVMjaUvKoioEEa4c6uCgqaCm0uB+sOhzCM5G0pUJIjQ8ipWogjgHAtwW1oBWXYOAPqkzOWZPqJ7RM67rVfGO+/HxYGwyCdc6rAi4Z3npt5HmmEC/raqN0fY7EmHAbYS84jtxYHGnWrDwNqReybkmg8fPrJs1rdB63BDJGWJXsmhrQ7toMjwT23QimGd1gJDnveJPL1sODVpbvzIF3GB0P2a8EyC2mtE0flF6HVliMn372qguNtzyuu4MK+TgPB+G0kl1hnJTxI3P4dLU2jrsj9UsesN1lOrxHC8h4cB9IEUjdvao/LDalaGKzbKXOLPyxWrOHz/jqafolf0eqB/vposuSpDnX3D1kdt9LLtvyY2g5opLbURxU1phbxP1prEH0bBOc/YHrTY8gOGP8bHs1Wx3IhVr6+TMiNQEwbM4yqfDp4Rmo0YqPD+6OqgwxXvaGsw2DkfPfrSXNtekEqqnrp6CWrZ1h9xBg8ZbmmKfhLVk7UVYfYma4CFpTilGAHs1rFiUiHA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f99689-6ced-4110-453f-08dda4e9f684
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 11:04:52.7650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTeTkF6l9EdHWtYB0/2bSEZ9z/oRw/K9KXIfAs88YG4/75shvI7HmCnyWOOmkv3hva6BStzs1T++n+dkSQ3T6YEfrSB03bh2249kahjFsh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7570
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=569
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506060100
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=6842cb58 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=MSJSkyAJlKp7O0UAvdIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEwMCBTYWx0ZWRfXzMRJefRxxyfh N/blydEhIXH4vKvHqIHpU/kxcg8RDrn5g6uqDjoO50wii2OPfJep4v9y9SGQmDsvlcAGFimDQBN syvYq2mziMcl2LLRzixWKpnoCQDjpeNKJiyOlU4X2GGWtp/H7OL9pL1venUquhHuBacxmJgpyxj
 2bzsnr0uzl2KjsEU+gMl+Wagvbw7brZdF/EL/yj/Lw/i+j7q63FJ3PKqz0ilxagRT3MoqRCn9tA 7ya1Co9iPpSAL9N1SxiOTWAM4ityc2tQoth+Zfb3HfGtrF3VaDARMEz6BcH2U9dh8BvPnZ2If99 7UUA9rjieHSGaK4fW7rT6z19pBK7h4RAakOAl/6qoWrTdqeYc6zx7LX1TDlZWjYggRlF03Jwn9/
 4Z/C9t4A0acDI/XZ+Ygu0528f4N+MJtKmRHq5ILSgxaql3fntp15ZzMSxnf8bShYE4s6eTmo
X-Proofpoint-ORIG-GUID: gSpujZKzEcmNoKXCcflr2yJFmXE-0oS9
X-Proofpoint-GUID: gSpujZKzEcmNoKXCcflr2yJFmXE-0oS9

On Fri, Jun 06, 2025 at 12:28:28PM +0200, David Hildenbrand wrote:
> On 06.06.25 12:19, Lorenzo Stoakes wrote:
> > On Fri, Jun 06, 2025 at 12:13:27PM +0200, Michal Hocko wrote:
> > > On Fri 06-06-25 11:01:18, David Hildenbrand wrote:
> > > > On 06.06.25 10:31, Michal Hocko wrote:
> > > [...]
> > > > > Turning them into VM_WARN_ON
> > > > > should be reasonably safe as they are not enabled in production
> > > > > environment anyway so we cannot really rely on those. Having them in
> > > > > WARN form would be still useful for debugging and those that really need
> > > > > a crash dump while debugging can achieve the same result.
> > > >
> > > > One question is if we should be VM_WARN_ON vs. VM_WARN_ON_ONCE ...
> > >
> > > *WARN_ONCE ha a very limited use from code paths which are generally
> > > shared by many callers. You just see one and then nothing. Some time ago
> > > we have discussed an option to have _ONCE per call trace but I haven't
> > > see any follow up.
> > >
> > > Anyway starting without _ONCE seems like safer option because we are not
> > > losing potentially useful debugging information. Afterall this is
> > > debugging only thing. But no strong position on my side.
> > >
> > > > VM_BUG_ON is essentially a "once" thing so far, but then, we don't continue
> > > > ... so probably most should be _ONCE.
> > > >
> > > > >
> > > > > So while I agree that many of them could be dropped or made more clear
> > > > > those could be dealt with after a mass move. An advantage of this would
> > > > > be that we can drop VM_BUG_ON* and stop new instances from being added.
> > > >
> > > > As a first step we could probably just #define them to go to the
> > > > VM_WARN_ON_* variants and see what happens.
> > >
> > > You meand VM_BUG_ON expand to VM_WARN_ON by default?
> >
> > Sorry to interject in the conversation, but to boldly throw my two English pence
> > into the mix:
> >
> > As the "king of churn" (TM) you'll not be surprised to hear that I'm in favour
> > of us just doing a big patch and convert all VM_BUG_ON() -> VM_WARN_ON_ONCE()
> > and remove VM_BUG_ON*().
> >
> > Pull the band-aid off... I think better than a #define if this indeed what you
> > meant David.
> >
> > But of course, you'd expect me to have this opinion ;)
>
> See my reply to Michal regarding keeping VM_BUG_ON() until we actually
> decided what the right cleanup is.

Sure, but to me the concept of VM_BUG_ON() is surely fundamentally broken - if
BUG_ON() means 'stop everything we're going to corrupt' then it makes no sense
to add a '...but only if CONFIG_DEBUG_VM is set' in there.

So to me the only assessment needed is 'do we want to warn on this or not?'.

And as you say, really WARN_ON_ONCE() seems appropriate, because nearly always
we will get flooded with useless information.

I think this being debug code gives us a lot of leeway here.

After the big change, we can always revisit individual cases and see if the
warning is valid at all.

>
> I don't have a very strong opinion on any of this ... as long as VM_BUG_ON()
> goes away one way or the other.

Am happy to come up with the churn-meister version of this patch and take the
heat :P

>
> --
> Cheers,
>
> David / dhildenb
>

Cheers, Lorenzo
