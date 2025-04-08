Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728861EA65
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119030; cv=fail; b=WIOdw0spOWuMd0ZPQHOfbcnN7C6nJgSiFAJAjy5G+bdLH4EDjCXaB3d6bD5jHpiAkLmOBxu7hKh/wbVOTLs1kdVmmxavIrA1Iw/Yh0ZzEQfHt9oKHyDZsamnhft1nPp+jKrLVli90GlvgN/d2pjGCULmC52N6GH+SQ0YAQXO6MQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119030; c=relaxed/simple;
	bh=+BzptA5Cxj3L4M2PxFLY2D7BzIa34dOqSo4Vp8CMgtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Uxk67ygQx7Gx521y9zPRiDT8UgQNEji03XRKDU1ErBUMexBihi9r07J09VsvMtXN1BENyoBndS6l5slha+G7owoaA4EXRf2RS/PF++lzQybvDF6Lbuu6QdvZvbLn2GRn8D90n+5RBKNJ+EHN/Rs+4fekbSasJYuHblvhAMZJ6ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ECtld3nW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SncWPqrm; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ECtld3nW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SncWPqrm"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538C6kBp028641;
	Tue, 8 Apr 2025 13:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=czpx3DFduEdsCVcmkO
	FjOrfn9C3lUw62ibmG/j4mCCY=; b=ECtld3nW9PMfhH1og37uVTPjFIeXsrcu9y
	Eixtmv/CXBCtxztdV+DX1uAq9ztVQngZ0+KmUgIqrdjKJ2KuP+b/7EkAOvQNcZBn
	eCTk35vNkR/yetUWUTHpp27JCfMTJ40Gx1XCLY5+WbIuK4NhfJP1yzz7B1npplGX
	KR1IDB00auANfwedTidWVVf5bR1+wNq7Ww3tNPT3YJgxsHtMJm73CQ7GvVmQPgRb
	gM1ln/hOFOXWiNw+uAENHefmydrah23G9efSA3EETRHOQKJZwBdRVLY8Wcl5OYJV
	4VTxyZp5/++cMJSNjKxy6Or/wPzLoFgLi/cB7pBRJnBdhh2VxSfA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tw2tmrvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 13:29:49 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 538D3gpx013776;
	Tue, 8 Apr 2025 13:29:47 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012039.outbound.protection.outlook.com [40.93.1.39])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyfjurf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 13:29:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hrVXd3TlpN+sIx3XAybb9Cz0I5fGTWtbuXJAuvkfPFRh2Ryzv9TFsIuOk0W8mobSwB5anN85UvwfkCs6h1ups3qpjNPatonGAdve5GJPSSlaDPaf9k8VijvFs4AOBYFR58IUpnRp5tjBweQ1uarNZxnRI42PqiAr/GLGrjq16pCnBzhknHbvL33X9X4R1UNX7Jb/dL36z+K34MSzhfJpkaquOy1CA98zQJlH3DuYcWZE9RJqj07npOg4AMe7WVAU4b8dOBPICOgAQSCWM7FlDINuYf4bba2IC7Zn3bzCGQY1YMlxME4g5frfzRfgJL6yvs/juo2f/+E3ucypxPx9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czpx3DFduEdsCVcmkOFjOrfn9C3lUw62ibmG/j4mCCY=;
 b=bxcuKKXL57L7u/+dQq9bH7So0lYPFQhwOXM/ulhoDug4bGaATzLmC9lWFAgoMhoGANupQssns9QoB3DL06dOzd9ODG3MwN1p8z3zrv8VWAeDMrzdx9MephvZp7KK10pk9jyBwon/sjZLssXXmVJKLrWV4vfEcrQri/EbIhXi9UGv3luErsz/6LCvMrday8wpsqG7gxDW3WLJ8FA4VKorMuT6I+0CKnbCcma8XatbUalAxbb54leresDyuWTWGJLFhCz+9XCq1tjMzJElUqyAE1R4jTUy8LkfEekrYCe4wwmEkSac21H4aM6To9Yd9mIGb209hVfiy9lmrOR4ChX5Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czpx3DFduEdsCVcmkOFjOrfn9C3lUw62ibmG/j4mCCY=;
 b=SncWPqrmQq94s4C1hXKMi9l3LqFrGnqd+MhQWJ1ou7dFUCPkjXdHsmj/LndttqNhorjHQ/A/E1UJkyDlZ3AVhWMOB1kexdYJkmPFFQQtd0/B+i/DcG5zHOqPF+bMl37bLXIPJ58NCRn4pZXj4NVN1X+evKYVcUeo0WCkHieymxA=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by IA3PR10MB8019.namprd10.prod.outlook.com (2603:10b6:208:513::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 13:29:44 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 13:29:44 +0000
Date: Tue, 8 Apr 2025 14:29:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R.Howlett" <howlett@gmail.com>,
        David Hildenbrand <david@redhat.com>, Rik van Riel <riel@surriel.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, kernel-team@meta.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 3/4] mm/memory: split non-tlb flushing part from
 zap_page_range_single()
Message-ID: <8e79ba42-a229-4a55-ae26-cd049bf85144@lucifer.local>
References: <20250404210700.2156-1-sj@kernel.org>
 <20250404210700.2156-4-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404210700.2156-4-sj@kernel.org>
X-ClientProxiedBy: LO6P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::18) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|IA3PR10MB8019:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f57e38f-1244-44c5-ffad-08dd76a16ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ly17GPtq3CgREGq4pfmEK33dk67AJTN2FLtFH/aqVVpOfEI2MU3GT6js52eu?=
 =?us-ascii?Q?/ZDe8jSogMEWkdwT61mj4asootpY0tV79epedGbCWFpUkaxYlIFz/rdHVWK/?=
 =?us-ascii?Q?lagfE5NInfuoasTTfN0B/K8D/B/EaXnLvOvkska0WsXFVPH9Mq9MbyMAKtMf?=
 =?us-ascii?Q?Be64BcRjtUL3ywCeLPbMwSRRAMDfn7LcBOwVQHQBrmnbE624FZmW0Xipmttn?=
 =?us-ascii?Q?kWJg5cXVSMImZilKSIgGzXDvRiu7lW9XTg79pZH6GwA9UyIGsY6VYbF2Maqq?=
 =?us-ascii?Q?2wbAGOjOPrYEHWTfdh2M4HioIgq38Viakn4Oq6zp6SZ7O3P3qhUrU1pbUDFD?=
 =?us-ascii?Q?lIYdqginhtIpAp5SRAk6POp0OO3rwpmN77Ip+0aEHTQCCUkiqNGfCBvAeE6n?=
 =?us-ascii?Q?MivWRMrOp5kEKWXeXn0Oov7fwyUF2ADn9wqVgAdPr4rqgoKER8PJ6A1o0FnL?=
 =?us-ascii?Q?Rx1TYgUsNjvBTfUfRsum5m746M4Xa85YvrfgF4i3LEWIDocC4IxKaOlZ/ikd?=
 =?us-ascii?Q?Jphi0UYeq8CxqGXxOVYDgazfn6aiZJp+pk5CwCPZlSOybOHz+jEQHKley9eM?=
 =?us-ascii?Q?rzeSdFoaW6mrvv8tz8R8CY2r9H2s6NGEyu36QHCx2VHOAlbNyLXdEOuO44A8?=
 =?us-ascii?Q?cfPf12g5FcCdp//k5eIeo8qc4BOhMmQCpVyoRIlctboTAr+GFVZCG0f+xZo2?=
 =?us-ascii?Q?4iMdBBA9PiJZ3MR66snXXcdOSHwTuzVcnm4aiP/l7lSM1RSTx4IoyO6PGE3k?=
 =?us-ascii?Q?GoE1nFf0aOKlcytFlYI0dHXz5cX3UurdcsXQimuCVYd9Y3KSvi2O2C2x43AM?=
 =?us-ascii?Q?2vJox/tzP/9DidHLJgqImrA1G43QAeZ4oXK+1TRPHEcdJ4m9V48ZTSJ6DOcm?=
 =?us-ascii?Q?6c1y26JmpkEwgYl3u01ZNj3LjZuBlzDARSuWLTfhU4k9kbuGF8eF/MEHtPL1?=
 =?us-ascii?Q?+1Jw3SeYcbkPb6WZVaixfcsnF+5NXB71615LxQnhL5eS+xS3QKeS6oBKABMY?=
 =?us-ascii?Q?332bRLI+7EJZwUnJqsuLTQXp22XZTOTkrHZnrCLdBXFtNDP+xXq8nRuoPMY1?=
 =?us-ascii?Q?V7JcS7XrLNI9r6x6ayPRpBCvPdoHrqaJgM+josFDbop/EmgcEqFy7wUY53Sl?=
 =?us-ascii?Q?OMgQVDhauwXqKeg1xPHleubjNkP+2ZOdzJTE0lpKANospWwHWlFtNQk1kB6H?=
 =?us-ascii?Q?zWAajTClx//TfHxkrrTQOwIoKQL4IozR6HMPe7RpK/hBhsw8rVANA5MjWIOy?=
 =?us-ascii?Q?yCJ4OYL62Sn/OIhEOK/Bw0R1KSLJDUFoRF3LWd0KIHlh4toY/lYWt7KEfUF+?=
 =?us-ascii?Q?vPuj+ap5CE9fI28w/SdUW1skVqfUygVK2hv2vvRwvMZRYOz1aYI6jaS19GJP?=
 =?us-ascii?Q?rRDbjCjYUorvB3e4kju49ECJ88d7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V3CeTtXm/7l1/weS9iGsrOJap0ZhKKbPBJdds0KKY1Ap4aLBuhBucqLAU8ed?=
 =?us-ascii?Q?V2mF2WetbL07U3vq+sAxKwYPGIeAD97JYKTbUkhaAvEISvButHCAaWGXst1S?=
 =?us-ascii?Q?hOUbJkWpKIAbWiczpSZqsxe698fjsr6fQXjbMnpSQVGaP6xit1y6j2vdQy/J?=
 =?us-ascii?Q?l3B8YJxFKFKfzA+VJ3aXK+8m06WIOjtA6zKv66L/6TwU8Gah70o8zX3y4yft?=
 =?us-ascii?Q?2oqTQMsI0hmYLyPOzOuc3hDdt4f86m8N5Etn499wa4tQ3OLXLrc7sEkWBphE?=
 =?us-ascii?Q?JchiFOYGWqh6Gu4sTozE8ipP8w047W/GUkdbb9Eb3co86j3/GnlqG/Ih4Osn?=
 =?us-ascii?Q?hgH4paK6th2vQTkx+ewQ3h7fH/31XQyhyq5qNVlVsdTA3EUTvPZW0QcDfBQP?=
 =?us-ascii?Q?yy/B2wfQnd21unvtQSFoLLoMXPzekTaoUaAcx7aoRkIXK7SYf7oAaq3Q5zUu?=
 =?us-ascii?Q?/M5pOx7n9P6sS0QFfnqCt+0IgosnLFkuDPdqmZE0OX3tfj69nrY+bV2mnbU9?=
 =?us-ascii?Q?FjI6X90mFZI0uEqcZJx3u9fFoDM1GKNdn/FjqHXTYddys5EGyinGoWoj6UU1?=
 =?us-ascii?Q?W86XCNV06lCyYBFQe/NQHshPBAjhKKTbq7mjy90hqXSlGp9SEuVTYeBuknwm?=
 =?us-ascii?Q?mGgLvXe4IDKUyV/v9fK44QrggqGgfibrT11kY+o/d8pDiJOZYV6xuWfon7Mz?=
 =?us-ascii?Q?4Aa8S3LuSnhdVTFc0tKsavQynlqz7GtbmBpFjp665zbYgbEOPNkuX4l5simJ?=
 =?us-ascii?Q?11wltjqhD66xH0L4AV3BTqs+jS6g5pCzq1XtNiQYdaGfPbN4LGrjC7emKIKG?=
 =?us-ascii?Q?PgaKsTICVduUP0Zgad/S+Q79yAPEW8OQrpmm0E9kUAoqaVSUUuqemSGo0c5y?=
 =?us-ascii?Q?1xowQj5bBomIDvQAV0XNRJSwuMLLLWCvoRv3a4s2Nu+QFP9hO8t53n7T/YaZ?=
 =?us-ascii?Q?6+jB4aCh1coGHOmByHmwKCjjkydh72SleZCLYadrl2ubVYvXvJV/vs+5Frhf?=
 =?us-ascii?Q?rGujzA5n40YCoOMrsTtGjBv5YZ6wFXNzEEpaHXdadsAvlEDL+sMjLvNkWCU6?=
 =?us-ascii?Q?KTOnoP1IpyIAq4SSpyL/+Hy9+J8YE9603Lj4p3NSVBYWHC6vlb2dkvMmmLPj?=
 =?us-ascii?Q?1qAjTPqE4FTRuwPAGaYbnWfJ/aLJeKUaFDu10seKqWaPrdgZjIRWF8OYgxc6?=
 =?us-ascii?Q?Wb/xp5/W6dlxcY0Y5EL+jtcIukrA5UcXcP77ACz6SAb4saG/0ddHZAW9N4bh?=
 =?us-ascii?Q?IBtO+eoDVCfnK+RHIkR41EaMvAreu2/mY+QcN6iCj2bwgxzYLNwiDKcNM+OR?=
 =?us-ascii?Q?ev6bGIxtw1kY7JnwuEzHVV3oMq6HmJlfgjVEk0PPUiIMj5ko5Z2tWjvEEb7S?=
 =?us-ascii?Q?6f6V4AoqscQ9LyGsihnNmdog2e+GAJ9axzfDkuJxNkfE2pPgxhHMh0GiPGCq?=
 =?us-ascii?Q?Ay/juxOm5OMtHlGAMjjjEs+guhGFZLYAhhdCVLWab4dZf6WRqw70a148SNC2?=
 =?us-ascii?Q?lqVbH4vpn5GaFjRRMv4QkGvDHaxBHi9/VvbLzhXj5kInb+GQ67HSuxoi1TRr?=
 =?us-ascii?Q?DrKRJXiS7puDVWU1xhMqcXFuVBbolQag2RUbap4Bpdpd0BFHrVafT6gXcR0Y?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IatnjT/8SuGRv5OsZS9VH6ag4ndAu78b5fXTUFi5i1e34r/XOSXF5bIKTUSOK6+eaTELUfHaQmR/LriNCEN4OMGlwTEq2gnrRag/GIX5JDrm5zLLqrEcPYZgPCc8QUcg2DbbJ67nCX2hUw4BLJM1XeaOmXzi32cZgBL6/5808rqzs+2r50wyHO2jD6R4em/S4U9ZN6avljClORd0D1VEGfOQht/uktsdo3g3o/ie8cwRRvfT1e11vhO5jpCFADa4zIhjtEFc59Jbo9FO0Pd5cHyJMVXkXOL2lYRrUlMYVPzwoJURvj3n23VX+p9/EC9xgaltFKu9fMzt1on1fEpz2c/4Rat6iZzxnJbPJcKo0BdJONhXZI2qzYGSXPdne66/HKZ37lIEBDgxu8Igcjj/ZpjE7hKVe3GM6t5N4COzIBTEc8/ZQzc6qJiqLcU4BQZ3ThyrhpC8q9NpIzCjubU8V5obuUruPkXlt+95NjksbETUWENOhAcXZlAm3PlyVqo+s0VCjFfdwLLzLlHsOFKG2ugWeC8I66929HxnCtDMoCuuJG9+SluxwMeClORncY799BUlvuXR7GrAa7L7Vglr5Ed7ZRo9dGPQzPbY8nLDO9w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f57e38f-1244-44c5-ffad-08dd76a16ced
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:29:44.7811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjWo2jzvooLFVq2cTzDL1MfZbrD3MhRrr9IK9HUcxGi+lCJKRvrIlhVVYjHVYBxk2+WhqRb0KENzTNblJq1VoYl+WrcsDPYoySn99qZkYys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8019
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=888 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504080095
X-Proofpoint-ORIG-GUID: IdqN0vec9dN5sIPZCIWRM9Cv9RzzBWLS
X-Proofpoint-GUID: IdqN0vec9dN5sIPZCIWRM9Cv9RzzBWLS

On Fri, Apr 04, 2025 at 02:06:59PM -0700, SeongJae Park wrote:
> Some of zap_page_range_single() callers such as [process_]madvise() with
> MADV_DONTNEED[_LOCKED] cannot batch tlb flushes because
> zap_page_range_single() flushes tlb for each invocation.  Split out the
> body of zap_page_range_single() except mmu_gather object initialization
> and gathered tlb entries flushing for such batched tlb flushing usage.
>
> To avoid hugetlb pages allocation failures from concurrent page faults,
> the tlb flush should be done before hugetlb faults unlocking, though.
> Do the flush and the unlock inside the split out function in the order
> for hugetlb vma case.  Refer to commit 2820b0f09be9 ("hugetlbfs: close
> race between MADV_DONTNEED and page fault") for more details about the
> concurrent faults' page allocation failure problem.

Good lord, I really hate how we do hugetlb.

>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  mm/memory.c | 49 +++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 39 insertions(+), 10 deletions(-)
>
> diff --git a/mm/memory.c b/mm/memory.c
> index 8669b2c981a5..8c9bbb1a008c 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1989,36 +1989,65 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
>  	mmu_notifier_invalidate_range_end(&range);
>  }
>
> -/**
> - * zap_page_range_single - remove user pages in a given range
> +/*
> + * notify_unmap_single_vma - remove user pages in a given range
> + * @tlb: pointer to the caller's struct mmu_gather
>   * @vma: vm_area_struct holding the applicable pages
> - * @address: starting address of pages to zap
> - * @size: number of bytes to zap
> + * @address: starting address of pages to remove
> + * @size: number of bytes to remove
>   * @details: details of shared cache invalidation
>   *
> - * The range must fit into one VMA.
> + * @tlb shouldn't be NULL.  The range must fit into one VMA.  If @vma is for
> + * hugetlb, @tlb is flushed and re-initialized by this function.
>   */
> -void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> +static void notify_unmap_single_vma(struct mmu_gather *tlb,
> +		struct vm_area_struct *vma, unsigned long address,
>  		unsigned long size, struct zap_details *details)

Don't love this name. It seems to imply that the primary thing here is the MMU
notification bit.

This is like unmap_vmas() but for a single VMA, that is - contains the
logic unmap_vmas() does for mmu notifier stuff and hugetlb stuff (vom in
mouth), deferring heavy lifting to unmap_single_vma().

I think it might be better to just go with the brainless
'__zap_page_range_single()' here honestly. Then we at least reduce the mess
of confusion in this function naming here.

Of course you intend to un-static this shortly... so maybe that's not so
great.

zap_page_range_single_batched()?

>  {
>  	const unsigned long end = address + size;
>  	struct mmu_notifier_range range;
> -	struct mmu_gather tlb;
> +
> +	VM_WARN_ON_ONCE(!tlb);

Maybe pedantic, but we probably want to ensure not only that tlb is set but
also has had tlb_gatehr_mmu() performed upon it. Then again probably a bit
much given this is a static function called only from
zap_page_range_single().

Hm actually you intend to un-static this shortly right? So I guess in that
case we do want some kind of check like this, perhaps absracting this bit
of tlb_flush_mmu_tlbonly():

	if (!(tlb->freed_tables || tlb->cleared_ptes || tlb->cleared_pmds ||
	      tlb->cleared_puds || tlb->cleared_p4ds))
		return;

Into a separate is_tlb_flushable() helper function or something. Then this
warning can become:

/* tlb should be initialised for a new gather operation. */
VM_WARN_ON_ONCE(!tlb || is_tlb_flushable(tlb));

>
>  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
>  				address, end);
>  	hugetlb_zap_begin(vma, &range.start, &range.end);

Is it a problem that we invoke this function now _after_ tlb_gather_mmu()
has begun?

> -	tlb_gather_mmu(&tlb, vma->vm_mm);
>  	update_hiwater_rss(vma->vm_mm);
>  	mmu_notifier_invalidate_range_start(&range);
>  	/*
>  	 * unmap 'address-end' not 'range.start-range.end' as range
>  	 * could have been expanded for hugetlb pmd sharing.
>  	 */

Oh GOD I HATE THAT WE HANDLE HUGETLB THIS WAY!!!

Anything where you have to open-code concerns about how a specific use case
uses something like this is just asking to be broken.

Obviously this is nothing to do with your series and is just a grumble to
the sky, but still! *shakes fist at cloud*

> -	unmap_single_vma(&tlb, vma, address, end, details, false);
> +	unmap_single_vma(tlb, vma, address, end, details, false);
>  	mmu_notifier_invalidate_range_end(&range);
> +	if (is_vm_hugetlb_page(vma)) {
> +		/*
> +		 * flush tlb and free resources before hugetlb_zap_end(), to
> +		 * avoid concurrent page faults' allocation failure

Nit: add a full stop (or for those residing in North America 'period' :>)
at the end of this sentence. This is very bikesheddy I know, and can only
apologise.

> +		 */
> +		tlb_finish_mmu(tlb);
> +		hugetlb_zap_end(vma, details);
> +		tlb_gather_mmu(tlb, vma->vm_mm);
> +	}

OK, so as far as I can tell, after this change, we are still ensuring that
the tlb is flushed _prior_ to the invocation of hugetlb_zap_end(), only we,
in order to later export this function, need do it here instead... I mean
this is horrid, but it's sort of unavoidable really.

So I guess this just undoes the optimisation in the case of hugetlb, which
probably doesn't really matter all that much at huge page size
anyway... and plus it's hugetlb so.

Yeah fine, just kind of horrid.

> +}
> +
> +/**
> + * zap_page_range_single - remove user pages in a given range
> + * @vma: vm_area_struct holding the applicable pages
> + * @address: starting address of pages to zap
> + * @size: number of bytes to zap
> + * @details: details of shared cache invalidation
> + *
> + * The range must fit into one VMA.
> + */
> +void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> +		unsigned long size, struct zap_details *details)
> +{
> +	struct mmu_gather tlb;
> +
> +	tlb_gather_mmu(&tlb, vma->vm_mm);
> +	notify_unmap_single_vma(&tlb, vma, address, size, details);
>  	tlb_finish_mmu(&tlb);
> -	hugetlb_zap_end(vma, details);
>  }
>
>  /**
> --
> 2.39.5
