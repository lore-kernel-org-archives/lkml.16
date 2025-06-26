Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AFE1A5BB7
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 04:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750913860; cv=fail; b=Mi6AHLgdjGSwIv4oY0JOKzF2d59QnuNVQZGpXdTmifQdsTqdC3sXNuuNpVInjDI2qJIGxd1V9VT2QwtVlYvz41bHkzeDJlh31QK2Qwe8S4Zw+YxoMd4GLxFpQIlYNYNdV1Q/OB4lVXHgk3J6BXqZXy/6rV64O3VWyQWPjSZIG8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750913860; c=relaxed/simple;
	bh=pg3NDX884OKSWv5zjEvAel/VHGSQCjTYl8CyApsj77s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=deirpASZ5i10n62JkjDR748p4FEEyI7S51uM5zfbFpC2HtL/QEmR6+th1g5g43C20iatzplnUndravFjyhaL4v/Ws0WergBnTEehxRwl0OdkDzxNAk5F/IesU+CK83JmubZr9RePOJsUwvMVxj1/b4GRYEPimKnf9CHwzNtMa+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gqaWhsoN; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QaEdfLqi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gqaWhsoN";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QaEdfLqi"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PLBaws021571;
	Thu, 26 Jun 2025 04:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=pg3NDX884OKSWv5zjE
	vAel/VHGSQCjTYl8CyApsj77s=; b=gqaWhsoN7bfcNsfGzlrGlfGCjrOENfi8G5
	tqf1nagKEZJLAt/DojAU+IYjm4lXE7V00Mv1r8Bqla7FgQNeVpmLnQI0A1kigCyt
	w2ftuyIVO8tPvF+DDYK4dXF3NKw2tzYc47Id23kcoRlJox/kgtB3/lLdHa3ie82X
	UtOEdyX9X/7L8oSP4tHqO1i07ng1l2cXwfkbZWSLhmvrfP3Nq6EfZmLzbmfDYBA8
	q7chp1J8ZFCjTBf8hrfvVdjG0zaqKtQoGoqaYLG1cW70soKX6q7MRsmOxLO3Y65k
	AiLcGL9Og/BFybt5s7XzBK59Q7qayuMCOYiT2EKAa2FzfQkzFXyw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt7fts4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 04:57:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q2I1gl012978;
	Thu, 26 Jun 2025 04:57:18 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehvyfufs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 04:57:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOsmSOMkALUlvpj//6t4NVQJzQZi7WTU3ilDSxGZWq90ePXxabhAvgQlL2Q5kzbWRXErBT7PJZIOtjyOQMo3asND8Ej7ZDwrriWs9rvTNucdQeqC2smndmDSwjGUZTFjvnVVQPdwCvVfNCCydPYx7auLV6rUHl1E5L7q56fbtkdkqBF/XALsTH2XLWCUitcvrgFlJqhFL2jCPBpPdKcQyfK1y/TZMBXR2CxVG4v48dYMfUI/ISIPq2PXH4VD9Ji2rf777tGKALfjXehOfoRqnb/gMbE88Aurkd4NytqylAW05sB1o6day+PDso2unkEqmIeMM4dM0zzt4b3fu0FN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pg3NDX884OKSWv5zjEvAel/VHGSQCjTYl8CyApsj77s=;
 b=fGUhOrNQULdVB1dz0OOay+b9Aa1IxCVHYHql6C5MANo+Umljds0sTGpbNTgTDbb0XzJpaFkxUv9gR8okqcYlX7FGhwX8vfl/BFjW8FlTQ7pwVUE65BryfZ22y06ikPDA++nl7abwlvYIx0l8dBcQSSac0XuuOHCbrUIIpiD7ebtGGu1aJ8K9iqn4JgTAHffVF3hbkAf0iiBMGDQpPhrr+CA+TsgDyphZ5bhnUFJHFSpdJM1Day/k1GXnWnPR4ZN2qZB1fTGcKmwJLPDjJOEkdUnUYpH+y4/IRyPax+E+5CfJLDS36/qmA3+GxauARUy3KCVdGTMaNLC1JjuHyQeb9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pg3NDX884OKSWv5zjEvAel/VHGSQCjTYl8CyApsj77s=;
 b=QaEdfLqi+eStYOUm05uhR0PxfjIFqcmE/QmyxWrj6Nr/GX4ilOQeizK4ZFjSsWsc607Md5QpKfFGzdP5Ouo/j9TL9drP+rWoliAF0Ck/XOOiPJDqTu5JHSwx6YV0sWE8wrjjquHytY6C7UKORDB27jG/jIvW+wD0bBIVQPqA78I=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SJ0PR10MB4512.namprd10.prod.outlook.com (2603:10b6:a03:2dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 04:57:16 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 04:57:16 +0000
Date: Thu, 26 Jun 2025 05:57:12 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, baohua@kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] khugepaged: Reduce race probability between
 migration and khugepaged
Message-ID: <1ce8408d-32b0-469d-a560-2e0050cb91d2@lucifer.local>
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-4-dev.jain@arm.com>
 <e94c3460-144d-4243-98a3-fbced10feefe@lucifer.local>
 <6989406d-dfdf-4be5-b467-bb3b0d32d384@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6989406d-dfdf-4be5-b467-bb3b0d32d384@arm.com>
X-ClientProxiedBy: LO2P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SJ0PR10MB4512:EE_
X-MS-Office365-Filtering-Correlation-Id: d5680991-a55f-474d-eee4-08ddb46dec17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y7NK3QYLPdAyTmonnpvlV3Thq+w5WN3vJ9jVaxc9KRxEPqI2S+Ij49d1Cz9K?=
 =?us-ascii?Q?TdivNno3Gpxm4DY7rj9LKnhI8P+BaOEu+qI8s9ApU9eEKgkLHNQsjvi2PVgZ?=
 =?us-ascii?Q?eBX8gO+XatFz2yfRB7OKlmoApnLALhDngx3XR3P+6/aiZBRSOt1knVFedClw?=
 =?us-ascii?Q?ASgQd94iv24UwKCiR5SYXc7F2FnNnAGbbGTi++UaJ69/eXzPZWa7APKqrA/W?=
 =?us-ascii?Q?hx1aIGfrYnKe5W4baoBqCtTn6sI3++hmj7VCeJUKXzV69d/TF4b0blnLYBVk?=
 =?us-ascii?Q?H786JUv2WurBCY0RPuia1KUvLWJfOWCjZSzow682x5A2A2uTRPyXReQCxbvQ?=
 =?us-ascii?Q?b9Q54OM1OVpBw8y8Kocyn7OAKXUca9BJjpBv+N66y6jPHAPmaTG8yXKaZVGI?=
 =?us-ascii?Q?6VltBpUpdkX0OcQpv2DHonmnhekD8GraFyK8su0rWv7sO9SiMWjxpDk1/eo4?=
 =?us-ascii?Q?NbrfnObtniETBjDtKtocCYL1+7Oa+xGl5whcNhz3F7pImZWVbnKLe27nqxxe?=
 =?us-ascii?Q?ndq80bnH0aBFpa+5ubrcx6BGndhsAUmuo6qhO9jRKGyasMEYtWfB7sxnvqBs?=
 =?us-ascii?Q?K3E7qDqUE2xp31v/AbyZHXvorONmN4VNrZdiWh7WKgcJvUNzghfWRnhiSGYS?=
 =?us-ascii?Q?aUZvVxcMcNL96hOZf9huhsNcO1TPv5K+T+JI+ow9z0QkweqbhWGLoxLA85Rj?=
 =?us-ascii?Q?uL3le+WuWykno8MseZVabr/hgd/TuzyRtLbrdQY6PnpJ3dADS1EJ3jzcxja/?=
 =?us-ascii?Q?aWRHzIi/FErlYlTSmzTCI/cMpkLF9Z1Npk/G7mMiqbE6PL3rTkYtbp2eU/CD?=
 =?us-ascii?Q?Wj/Q5QV77hv7HteW9c6Qo8By827csTfFl+VRjJTLbXZYT6ndTumIwCyir26A?=
 =?us-ascii?Q?XK/UcQeQlUAPxOFYNA9hp3nwJ65V9wnOgEkwod4MrS01e/Vj6TCsc0Kz0PxJ?=
 =?us-ascii?Q?vssGA6hTid6Kw1ChfN6fzvinn9kd2FZhtqbS5bxwDr6DgSXnqBXxC/0O8bQv?=
 =?us-ascii?Q?DXQRbmtCeW7pGUebpOvBx3KSxomDRYchTKF8SmuZCqa1MTo+VrTjZZRZpC2s?=
 =?us-ascii?Q?0WCiMkZcOTJ8XU+ArmT5CqztajU7pXnVgwWe1iL2ffT2ME6ldZsL2xAkclqL?=
 =?us-ascii?Q?FZU34fT48xErPdiDmcZ4qk8Btu98iHQaWE3xA3S6J/A9R3pQ0/JFOUq5g6GY?=
 =?us-ascii?Q?wWz/RXNJF+3XeOWxIJSQm1sadMMU2qATTkfVXwjRbdpi8KW52aCYq1sIHXzb?=
 =?us-ascii?Q?CnwzRnAWQZV9P1AipLbAVHx/6a7MXbU6u/Du6aI+xRkrsYdUHtNlfyiKWqyK?=
 =?us-ascii?Q?IRMBMYNuPmG7+i+m9t331Fbe3obExaCpy25aLsvHxMTGy6YzQOJKSu2tnCcK?=
 =?us-ascii?Q?jQgACb4z6ppa9JSkJAXJJJkvPCj0Rj6RLltYqOzdHrd5c6Z/o6uF0ML3LXZ6?=
 =?us-ascii?Q?rLWrS35g6F0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GgOI4i4cqb9Wvn9H7FgpHUjsLcbX5qbFH5YyK5J7Wvh8Gi5nKPRvtgwGY6gX?=
 =?us-ascii?Q?qEsdRolFAubFAAZNR2yQF35IO/4a0crfZUPkpHKbC4m1YqmQS6pZ7OGl2AFs?=
 =?us-ascii?Q?l7wD0iTgkdDbjSTWfhEEVUb0HGCZfnA/Xy9bWDnuQu4uwyvG8OxFcY2IIW7y?=
 =?us-ascii?Q?jUkwR57gZEgwS3yhjtvEbHR1o5I+fVc6kMAf+h3HACO+gDSZq9f1WhAh+s27?=
 =?us-ascii?Q?E2WTlFkOQy1Kkz3fWqbxLfzyMPu5JJ2fRspDHh0dbeVXyt3hdIimtIYgva5U?=
 =?us-ascii?Q?RKZZwVMkjQ4c7/lbTdv3soMLvtEMxeEHDHPRtC4GgHO5zTpDPK9qCCMJXiGs?=
 =?us-ascii?Q?co8XiBzXFATIw6egP1q0trpEFQENekaDjDH5kmBSVMM/6dU2b6n6HdGNnFzY?=
 =?us-ascii?Q?o4Pdwl2rPDILYewf+TtXyMa8A06KLGpf2RYg05lN4xKLYcZfMKMKCMko6GfP?=
 =?us-ascii?Q?ShwUJQP2TfDNomfmuuyfrUbKeD4qUaUozdPIoK0m/5mgXpHzz69WV78vJDNd?=
 =?us-ascii?Q?nezetFO1DqAPTrRR80jFTZ6TYzeIKbc4hHfppO06hqw2a+KzFoBDLWghZaFi?=
 =?us-ascii?Q?Wrd3Jq8h3tIXRkuQ10MHmcmTjSH8LDAvQjxiG2/eEYppmYuD3+VVIeDrpqBf?=
 =?us-ascii?Q?pyMDkZwS/3RWp4xNON0uQxWbT+ycKgMO4ilgl2hjk4DLCCy4R0z1LPegVq7F?=
 =?us-ascii?Q?TfzAD0hToBV6H2EkEP3LKawfZAvLi+5+KlCZ02UwHuvSK5xA2tKQovfeoF5t?=
 =?us-ascii?Q?dFmyWLxG9V9DSU+76oomPC5O3wadgHbEhbPH+9WOHXf/a1WaIfGJOXwNb2yl?=
 =?us-ascii?Q?0cCkxUqhX96w6ya8n40oAP9HysZdmewk8y5RwtGXQ7jaM2jspcqMcC9Lim7g?=
 =?us-ascii?Q?gZyzzjDmt8dKt0PB0r6zsALmW1Bp6MpRcE9urFnXepIv6ti7mbKdTebgvgW2?=
 =?us-ascii?Q?/s9Mc/HpvD4Jx6npaWe5SXn1TNj7BM/Fm85jmnl+2n+NLX3OAzuLe0VhlkyO?=
 =?us-ascii?Q?KYeW+CafvMeKkAuUcYlQM+kJOGubHMuJSgejEQr1vvPbQ+KfG5dSwwe60GLi?=
 =?us-ascii?Q?MF8SPch4oeL350ylbNUwQMzrLDHGyGxvBM08ag8CKhLShx0d5llF1q0Z1xW/?=
 =?us-ascii?Q?7RrlAOkGSyoxIPGoejYDOjPen+xs5mS6F3wXYdnJur+SNRXOtHQHjjLiQyQ2?=
 =?us-ascii?Q?rI/N4cWuh6XImwVjwS6bbh7ktFnisjcke0VdEh+ce+v5SMrKez+em8h5aMxf?=
 =?us-ascii?Q?k9DdU/D97/YcWg89R+wfwU1iZCu3BujWGbPxTWZCpOMeRG2E3yqzTG0+Kj4r?=
 =?us-ascii?Q?aP3V4003rO8MHsbMhD1RGy7O6267zpCzFBpSK3wq4bXrFhpqPDqsH8kLvNvi?=
 =?us-ascii?Q?lcN0bNy4ka8kBqJYrR+i6uURJEksstfn3CQi1PwRe9ak1lzji1SkA5JBHdne?=
 =?us-ascii?Q?3jLFBJWtsU7UvbW3VBAtVCDP/YdDe0FrZD7XXJ/RDWoKYfPfanLyIGbMbWtY?=
 =?us-ascii?Q?2dqBTSc02Lcd1CMzyca+RVACzr8rKkJWt54KOFCoR9VfzBw1xRge8GgGozA2?=
 =?us-ascii?Q?70BhlZAp454v6K0hkbcGe86mcPSfOcXGplS4aJyFh9uwYLz2m0k2Ik4R97MK?=
 =?us-ascii?Q?xw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	opjZU/EF0fIfTIeIHnDYo0c5cZ0wa2hpgfIHOIWyeiFpUtfvVw17JX9FxLokGXnQsFN1BEZrjn+K5IoPZbhQ8aWxHDE9jTIz0iINAI2u1F1/ikuSn/+THjbpyQc+S1+2U3HGJUPDsMwqrhr8Z9tQNMWImTPMxsibYv/hhoIQwrxEpBGJdjvmI2kvE2b8XB/UO4RO+mZZp7+PDtpZ0WMgRXdWWhkKff/vbRnc0/a3Ns2Xk6npABN0Y2TTDVnMkQfpSCTlvCCjAeoNcbNMB0dEGDjsZ0q9M1Ws6g7hcPR/42b5/FdBeYangg0KEJsIv2819ePamRDTi1h78N24PqRaTKVwlSQys8oQuFmCFLFHwK8GuuGd3Ou6G8uPvnQ6sxqA9qseGuA54a4Q91MNNP/obv8WjW5M4UJI2EadkmeSNCHXk9dsmAzsQEpSGCsmowiv6/tN9CeSW9cXSlqvaIhqIlosDTs2d1BsVDwKBT2rOYrxO1TWNUByLKwLH+WQ9JbGnECjK/3kE+zEGX7nh2tJuueqCU7Jshu/hjgqOMeOefOqYMv0FU+38hiKbgY5I6q9TkKxlngreLiEbL1D5hrSQP/GHhtyp3eC5LLwkDWnOdk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5680991-a55f-474d-eee4-08ddb46dec17
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 04:57:16.2602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzQALYI6wfetNG/tHTDcATgonrq5c2Ae4dpPxF3H7vcWvKQPCffq+vdSHUV1hadf8RD282kH/Pa2R2uHoUBpcHrU0zyXwDgAA8XNe7PB6pI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4512
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_02,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=941
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506260036
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDAzNyBTYWx0ZWRfXxdARCoDxrl+w 0xtvyhaG3AbJ2mP/X1FgfSYkqrSMQQW1VwyP7J8ECGGuzH4wZOpJl1rppiFEB1IngQgq6C5PrHD 22mGLK+lr56IEG2dXXqgHpdRzU5KLtMNvcuOOqie5U3XLHgWA+k5Vj0Vz/53acm6AxxXNlzZUC5
 FummI2HG5SE84/nx37vbTxBWP5ZktcuanKL1B6DY0PqJSKjE+/YVvPFfCDzc95mT9g1A8FLisfk T6FBg3fW/UqCSgY4GGwdnEk8ty3Fh5iF4j4ok8fIsEBUOFydDPSdQ3MDLmajc/G5Y8su9fBHIEn vcBpgeXR0DsAiXykFERSX6kQQRJv8YKwYSju9Jm2NyAu9rEq3b/4nwdC1n0UPvpG3PYepoCiBif
 +q6bQH/vKFrMpZ9b9D3Uit0rpYZX7hs/4Ro3WrslRVe2qusEJiXF2R3q9SwpIKX3vSU1codM
X-Proofpoint-GUID: 84PPABd0CUpz_IeFHzXyPvi4AQQdm2KR
X-Authority-Analysis: v=2.4 cv=QNpoRhLL c=1 sm=1 tr=0 ts=685cd32f b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=7snS_DFzl5C2-7KzdyIA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:14723
X-Proofpoint-ORIG-GUID: 84PPABd0CUpz_IeFHzXyPvi4AQQdm2KR

On Thu, Jun 26, 2025 at 09:22:28AM +0530, Dev Jain wrote:
>
> On 25/06/25 6:58 pm, Lorenzo Stoakes wrote:
> > On Wed, Jun 25, 2025 at 11:28:06AM +0530, Dev Jain wrote:
> > > Suppose a folio is under migration, and khugepaged is also trying to
> > > collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
> > > page cache via filemap_lock_folio(), thus taking a reference on the folio
> > > and sleeping on the folio lock, since the lock is held by the migration
> > > path. Migration will then fail in
> > > __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
> > > such a race happening (leading to migration failure) by bailing out
> > > if we detect a PMD is marked with a migration entry.
> > >
> > > This fixes the migration-shared-anon-thp testcase failure on Apple M3.
> > Hm is this related to the series at all? Seems somewhat unrelated?
>
> Not related.
>
> >
> > Is there a Fixes, Closes, etc.? Do we need something in stable?
>
> We don't need anything. This is an "expected race" in the sense that
> both migration and khugepaged collapse are best effort algorithms.
> I am just seeing a test failure on my system because my system hits
> the race more often. So this patch reduces the window for the race.

Does it rely on previous patches? If not probably best to send this one
separately :)
