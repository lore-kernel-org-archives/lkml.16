Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE00B2EA487
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750173784; cv=fail; b=jRt8HZoZWwC//wWWP5JfSdo5jL8cUAV6eKSAl9H0gj04g/MwWTSbsf2hqKyc/q0QN2X2DHuXKM6PtF6jCI3KWmo7KwJxAzV2iDrrjB+YW7wYM4/7pJL1Y1xyXNg7CbNSx+YjfHwXdHy7OqXQnwJ9b3UAgEbBsWzXa/1f0KSQnFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750173784; c=relaxed/simple;
	bh=K8G2mRQTuVFgPo/aNNwZtwiNCli67dmd5Wf6LD7pSTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qo1o1QFVeNq3MRR0dBycFHiU1Ixv600JUkU94pspHTMfR0H0swjt31LgupOnYH2SuKi2H0fDSfsrPe2U1r0XQ6B12WJVvAzoL8ZbyTer1pJORLWBEZZKGjJODaU7e1B5R7QS2QG2Hqzr1UjG9we4Ry1u49mniyZpWbRT6usQ3jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TMNPn/wo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TEGIrnWb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TMNPn/wo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TEGIrnWb"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEWvHk026851;
	Tue, 17 Jun 2025 15:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=UNaCikJMw5Ppnkd7gt
	hHyQAiBfoV+QsamEAKlNTbtDg=; b=TMNPn/woKLIOXWVjy2a9JnaEWMvXmPPvm3
	2rCSLBw/cdlyjm3HeUUzWn4IOuEvjLDbQozufuFnEinKfbqWBALdZukdotU+SiAk
	Vp0/d8kgXnKVpeksxfutAvPTJVmknaslunV3bkoNG8m0y6wJTnWitHAJ9zYP/se2
	tFmEz0w6WlKseEuTCqQ+f9uzwfthnWtijHuiE8KSNTwvkK7rwJ+qrUzXG44/9C0U
	SQSL+U6dxhJ/FpYT9gSS7IwHuYHyX9cZkXGJxqD10P4vPI0+OyPTYRS4AvCv1l4/
	Ce0lG5/GelwvoaN/AVGKwI2iQzf5ba2WS4uJzn5wRdG7o3qOzjFQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479hvn4xdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 15:22:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HFHFjs000906;
	Tue, 17 Jun 2025 15:22:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yh9cr7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 15:22:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdlyHQTlx1FHtE27d7s9SxVAx2sg22b4j9RkwfjP23c3f2wz12/Ekn3D1cIxiFrFrabOWY1iPWzRPHtsPZ3envIpT2ps8O61KKkDEQiN4/CfdnW8DPo/zMCZAV8pdQCtsqKkFJGS93yQ+fqehuv4e4WzctA6t4NwsQG8kcUg+WIrPzw3k2x4CuYyErvyhmUwP1UQI4pbzJTgYIuhPavJ9eEqJVan+BuKszg5CiGICXAMOBiScLdSueWJ7HWNZ92vvuhK5ENEwoJZ49zwuZng7VS8RO/7hbaN3wDZeNe9ZU/aL6w4Jc1j13wXo+tCxPtaBZUB65vq29WNtMK+jj9A8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNaCikJMw5Ppnkd7gthHyQAiBfoV+QsamEAKlNTbtDg=;
 b=eyLcQDJ4Fft2kjwyhYrv5EHU4qcstub8mGzjxgAm7+SspqZ+rBgrimALp2Kd6F3kTx7L/1U0oiWixZtZy4TRkGyC+z8Sn7/c5xnyCu1ZR8z7vmfJ5mh5GBRx62Ew9eK61IKJECo8b1CqAx/79mB0H+fnKxlbserNioLukeF3mFIPBCOALjvlrpY/Hw315Ca+NlW5MNG7srMLh8QpWkK4e6MHsehyEyYfVwa2QL20rBsjS8k+5R7gRVALsz5eu07vV1yfJyXZsAgyIXZbs5qzViU3T7qDXXFjLnBlFE+mwL/aPYy52Vllh81qVgyMxaezNaxpCNf0A+XNGrSegYhojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNaCikJMw5Ppnkd7gthHyQAiBfoV+QsamEAKlNTbtDg=;
 b=TEGIrnWbJqvPCERJsad/y95EKNb06caPxioEOjhjWHpP5Ke4VdwF9mGvUgK6b8o3xJtYeOsYm/6Yw8wVlYrU623FnNYgDZ7FPV7KLyiBsjDfgfEGuAbZyA50jJz9JhujXwMwCfW0F86vxJ3Vi0jNg8IDL4TUHYCErVMuq7t8vao=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA1PR10MB6663.namprd10.prod.outlook.com (2603:10b6:806:2ba::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 17 Jun
 2025 15:22:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 15:22:35 +0000
Date: Tue, 17 Jun 2025 16:22:33 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add further core files to mm core
 section
Message-ID: <c8d6c655-282c-41a7-9cae-a18e0cc5e15d@lucifer.local>
References: <20250616203844.566056-1-lorenzo.stoakes@oracle.com>
 <727b5e89-89d7-4abf-a93c-8d6f2cb2c438@redhat.com>
 <35kubwcjkvyu34k7ejp2ykydtrbcl2gptcurs7rhqzi3cy3l5h@gcxndb7dfdgq>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35kubwcjkvyu34k7ejp2ykydtrbcl2gptcurs7rhqzi3cy3l5h@gcxndb7dfdgq>
X-ClientProxiedBy: LO4P302CA0033.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA1PR10MB6663:EE_
X-MS-Office365-Filtering-Correlation-Id: 856523eb-01bd-41ca-7289-08ddadb2c97b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NVGNlG57EGecjrEXnMtsW3Pt/9O2R4o6Y4w6scRCs7hFoBb1pYKWT9yZjti3?=
 =?us-ascii?Q?SfPBL2M5XF1qQOUBi8kMNpVX+dcIXg9e6Nxy5em7ANKNXJnwYR67hv2yyMVX?=
 =?us-ascii?Q?RkfcPd639zownzWw1AKGQ5WX04sPhyaIUyQGQ0L++kKZeTNMBaU0avju0c3c?=
 =?us-ascii?Q?+z9Bk8Mn4/eVSwcCiY04o9gQX0l/VAWOpuyidB0opIKXcSsRhtj56zUGXvX5?=
 =?us-ascii?Q?is+dGzQI0uFIssow6L0bbDN3eNcttDy2mU3wGh3C1eP+w8coVe+nesE+1PBR?=
 =?us-ascii?Q?i9CEukQV8yUSSflnJ4KnWxH8Hd+HvYFLvm9dY+KUn2pGDGcIdBMMH5vuMaba?=
 =?us-ascii?Q?Qrn3fJfUczVip481SSkjfqbCGPKKUDkCiCJ45lNEgk2YN6xJ7C7jOBbF1l3T?=
 =?us-ascii?Q?rEsTv7Om2+JOYUqgj9RyNp9nvF/z7mHYuOBqB1Sa9E6y8ywjGP3uzP97pHDz?=
 =?us-ascii?Q?JERpqh2gq1ra+2w54Vt72ThTa8weRYbNJhDnqJCRkOEM+fXKYjqF4mRS3XPR?=
 =?us-ascii?Q?2U+zKcc2w0/LTjzW7JViQWNrFY1AnNXT2KM4KeIT01aj0V2PJqIZihullupy?=
 =?us-ascii?Q?NVjiqePprIwRqyAPF7dNVvEWlXrzXvUkK7f8BPgDlv/FiCIzUzVx4SWpOsv8?=
 =?us-ascii?Q?kVQHMXHY6bNnlXNguGDKrg+NCsB1kJin4l3LdN4RmPQABuq6zDTFGp8rmY0W?=
 =?us-ascii?Q?uIjkLmXCCgpnBbjEX9XHx5AfQMlbM20982bQFG25MTmMRNtPPqpiZQTvfq7p?=
 =?us-ascii?Q?xlZNOVl9kF10JiGYDnrc74IvwpvoQtn8kM7D2oqI0ra+dhGEpAuXD9AZgNz1?=
 =?us-ascii?Q?+HSBhMXBjcr/WfcxWBY5HUQ8hUGxzvLwq2Ex54jLyjW3rg7FcYfcZvDdmg5m?=
 =?us-ascii?Q?KdLtIYsTTo4LdCAUUq+O+5H0zU6o5vZuJHuT3eKrJMgxE+Mb65rgzxcdemkT?=
 =?us-ascii?Q?uvreRxp/ptg/rpi0/qS5G3Ft7iJYnPPquaU5a4R6PUg/loMbhrhD5sMqmvCQ?=
 =?us-ascii?Q?ctcC5bG+H2kmT/4oXi8bJUbElFkTX/BXjelw9daBgXxoXd2ubbQaz8Il05c6?=
 =?us-ascii?Q?WjvwbsVA5uEELmQmaCrUyktdoqlQotqIkmMX0UsekWnPtxSulHzzztP4OuEW?=
 =?us-ascii?Q?qHlU3Rzq/uGkIh8YcOtAZjM1ZKPCNN3Tx/yPVyssPNuOpMfUGMX5M13y12le?=
 =?us-ascii?Q?MXzDmGJxhnTVkYQ+BFH/Tab162y71pvn51c7AvKg7pzdq99abB6qipKoqh3n?=
 =?us-ascii?Q?/HhucgsyZCpmbxUdKtZSdbshKrMTWZIHKnyW/sQWyBdqaO4kXOK9ZKONV7T7?=
 =?us-ascii?Q?7BfYKksr+X4F0i/BFpR+s7+I0c6DiU4jAJ0L2gPQy0cEhdcKrUv99deRG8Pa?=
 =?us-ascii?Q?sdKMVOA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?stEiYH5cWWhSIndXORx48AoOe9Z96qg7N1Sbf635wiG1Ox7+86H9lr6EDnh+?=
 =?us-ascii?Q?uYFvqabzsrYvRJ36yqCTFMqL2pA6hYAnzwGigWJxgiptc9uyf8UFi53pWHJH?=
 =?us-ascii?Q?B5v8OXqVeQmeGn+RESPrILB2FIG9hgaTfN6fQFfL1QIj8GwyXF7aAGjQwdtV?=
 =?us-ascii?Q?b+2oz7N7JlMIz4djGI3hurMagtKlPJp6Yvri3lY4eGZG4Y061fvwSqTaGlpm?=
 =?us-ascii?Q?4ne2Zkh21QC0CmcnwkaEkVUu+85Wryh1ea8dSi/RI4BvGSUTB6TEXJPoPLs2?=
 =?us-ascii?Q?n2wZDPrjFy+xJWQ/SqG3GfFWXOnE6+rzXlocNBaNSPYA44ezTHohku7gDUt+?=
 =?us-ascii?Q?9XIIhqITz7IlWCXxRct0wTN+CG33DH2sIzPnZ3R4zUgsfBirbGE9otG5b4od?=
 =?us-ascii?Q?dASy2AkcAhyRbOPIErXMhFzJ5Cv+33goP5nBRy/LsaYrEATS0IS5Bo7OxiHx?=
 =?us-ascii?Q?Jw4yvvCon8J6OHTttYK47KbvBZYK3pPSqsTc9ffQ5PG2oqHWZwHVv8sHpyFr?=
 =?us-ascii?Q?h5hFOZsxKOLpFD+1BlpMklC/9jnjW3KKcTbe+FHY1u8Qc2au+yZkH6wkiWIH?=
 =?us-ascii?Q?skgcunOChvCO8/L7fnCgF6tD4+0pU9YlDAwLLWYRr7k+InsquHdGm4h5TWzO?=
 =?us-ascii?Q?B7+lplY9gLsUL8+diX/ylwuHVlMsXrklFp5kTZ8lSLrdDPbngeQ8+M98Ctv3?=
 =?us-ascii?Q?TB2TqEyiHtnDJXEwt4vNu6WR2QSM0hZ2qNqLCb9THJ+jL3WWZ/e9O2m/za4/?=
 =?us-ascii?Q?FnQ65NOFebi1IUYJEKyh24Z2nxr9BKkk7j60FG+DRKcxS36Di87iGxZztLet?=
 =?us-ascii?Q?lVr//zwZxentYo1ZsRmP5c7Z5iHgmlhEd/HqqU89wK9RUVR6vo8wmb58lm7T?=
 =?us-ascii?Q?fR8Mw70q7LyRlQcuJ1mhIJBhE6bt5z6xbXP1CkSSFpBsjFG/Gqxc/BfEjyIC?=
 =?us-ascii?Q?5zGDnY1UDuejAtyDUvvZSzSaYB+SvuyLLE7W8E3kTs/vcP9kU9naoRnmMfan?=
 =?us-ascii?Q?j4OWUbkmonIiTw2HojX5GaGh1sI3XCXxGIDTw7a+TEuDEbkzA/eyGGlBWYp7?=
 =?us-ascii?Q?muFKY4kmXMTaZQXP962paCXO6k20c9nhD8AUYs/Ih036+JI22l8acx6JxTX2?=
 =?us-ascii?Q?VBL81gIk+MuJLVK1IOkjiHBN/1n8otnnJ79PjRmbX+bDjRtG5Biqs0mM5Fxz?=
 =?us-ascii?Q?PgEkUcUuHfbsizV6fF4Y37UK7kjM7yv9zNB5QqOCW4MaWTiirJK6z4mq8nGp?=
 =?us-ascii?Q?CchK76khvxzx5vaNFWu83RTJPNs4PUCYKzWYPT7125USJsBq/2jLwLS01//F?=
 =?us-ascii?Q?LpnDN6OBXVstlIxbRk8z50P1YpIFr7ptNP3vSi/A/99B9mkM3s1yy0+1k87s?=
 =?us-ascii?Q?TDzGL86r05NJfx5NYTJzetSxw50p7A30UVVknKrLrS01D/8oaWevF4KGHTxe?=
 =?us-ascii?Q?keACmZN4K3SaL3SwDwriT6Cg0y59pV+2DMKQo1D8g6TQFwUc8PA+VHd8XG25?=
 =?us-ascii?Q?8NBESWQj5OVsFIasw0xxszuvf7oVfyfuSN7X/kJnb9hDUB9UkvdUVz6g64gz?=
 =?us-ascii?Q?5RssHDCO1ZhUyOpDPjgWRqHwYAC6G/1Y9+dRlG7j9wv0oxJFQh1060kfsep5?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Q/rM7z7W6t47PmKYIaPcBAFp+0DAMCEyBfE/6EE0XPq5PUQF7cFCTOuk9nF31+SfK3aKdMCwyQLSIYSMu925rq60xGFTt6Bw1ghaVvIyLoGglCtj1H/sN2XLkQ4U0Dycj8fGrIpdT+v4ucyOLAISg81wsLM5xDTQQnZf98GP28tm+rAgnJKBhckBbOEQ7Ahru0yCFrt3nxWbT43HV+0o9DF0jD35mZIAktOu5LQeYcJ3fElstZkLZNbJj9edcmVDA9BOF3GNZmPCJSm3Wx7OPihkJKIutDlLfVAsrVGGGmaXqHoAh7qu7gFjg2C5leOtQ7D5jJ635/Vh8D1RzNIb1y9kKsVKSn6p0VRNRwsbJ/FhSXDEov7oWNjNr0umzs5s3sHM09WegiB8NwkZc9RoGUz0vfAfPZ/DGvK5Top9RJsm5ajHuPjIVHXNGWB0Oex1tq2Psfcfo6AVSVBoc3AeTxZvZdEhPaJVkBh15q+HwnpwvVAnUmEm3OxU6v4ONiCX5gpts1p/zsUBHqi9JtWhcqEXlyA4epnWurYC89f1wz30GVfoowe73rMp31BKNOmY3f1ktqqs1Td4fyUdtS3BFf2JOH8NTcgXGI32W9mgBBs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856523eb-01bd-41ca-7289-08ddadb2c97b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 15:22:35.3513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxWXwprLQoc6GgBP2c50ilxz6LOz/8CbEf1u+y1pbCsvFy8vnX6Dvk8sHRvhwB/8sMc/xN0Vee5T8SqY1XruDMfhW0Ah/n8t/88J+IDu7HQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6663
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170120
X-Authority-Analysis: v=2.4 cv=XeSJzJ55 c=1 sm=1 tr=0 ts=6851883f b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=nK9Ruh0dioh3n-ZvmwQA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: Vy71sS20KXkv2pVYFrZiVXxgm9UDaUkK
X-Proofpoint-GUID: Vy71sS20KXkv2pVYFrZiVXxgm9UDaUkK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDExOSBTYWx0ZWRfXzZ1TW7IKFS3l 9+stcHurA+hD8jRvGxXq86Hd5STwfYjrOhPEfUeRqsvC48H1jHzTzl4UEX+2/S7ejarY+ZT3duY 8VuBu0M50+ep7dmY68CQEsfv6pS5tLFxvxkYLDzeEjap6CFVBREzymCbZbBE1tMyKljexTG8D0C
 dPmeB8Fhu18ZxP4BLwCBwJUE67ELpLGCami6efcaZMlLGm2xBHPuOM4RueK+BF3VOxgApth9C6C gEEMB0LEJ7PKgNNUZY5xfJe231H0bh3lQIq43oKe5M+flB25PwlKimHzJ3yQacAFxtH1izz/J4I Y8KiJNwt0VHTeAMeFqHbjs3ztiRnmJibMSzGLXytHeRIWDdUw8a5nwwWUoN9QTmliZ1AFTelQNI
 QpUyKRTiRpqqAbJjTeaEf5HQs04zqGB5YmiRWEvy0HI16Na7Uf7fQesky7coLdpv/mLJMxfD

On Mon, Jun 16, 2025 at 03:56:02PM -0700, Shakeel Butt wrote:
> On Mon, Jun 16, 2025 at 11:10:41PM +0200, David Hildenbrand wrote:
> > On 16.06.25 22:38, Lorenzo Stoakes wrote:
> > > There are a number of files which don't quite belong anywhere else, so
> > > place them in the core section. If we determine in future they belong
> > > elsewhere we can update incrementally but it is preferable that we assign
> > > each file to a section as best we can.
> > >
> > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > > ---
> > > REVIEWERS - let me know if these seem appropriate, I'm eyeballing
> > > this. even if they are not quite best placed a 'best effort' is still
> > > worthwhile so we establish a place to put all mm files, we can always
> > > incrementally update these later.
> > >
> > >   MAINTAINERS | 28 ++++++++++++++++++++++++----
> > >   1 file changed, 24 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 4523a6409186..a61d56bd7aa4 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15740,10 +15740,6 @@ F:	include/linux/memory_hotplug.h
> > >   F:	include/linux/memory-tiers.h
> > >   F:	include/linux/mempolicy.h
> > >   F:	include/linux/mempool.h
> > > -F:	include/linux/memremap.h
> > > -F:	include/linux/mmzone.h
> > > -F:	include/linux/mmu_notifier.h
> > > -F:	include/linux/pagewalk.h
> > >   F:	include/trace/events/ksm.h
> > >   F:	mm/
> > >   F:	tools/mm/
> >
> > Probably better to have some section than none ... was just briefly
> > wondering if "CORE" is the right section for some of that. Some of that
> > might be better of in a "MM MISC" section, maybe.
> >
> > > @@ -15764,16 +15760,40 @@ S:	Maintained
> > >   W:	http://www.linux-mm.org
> > >   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > >   F:	include/linux/memory.h
> > > +F:	include/linux/memremap.h
> > >   F:	include/linux/mm.h
> > >   F:	include/linux/mm_*.h
> > >   F:	include/linux/mmdebug.h
> > > +F:	include/linux/mmu_notifier.h
> > > +F:	include/linux/mmzone.h
> > >   F:	include/linux/pagewalk.h
> > >   F:	kernel/fork.c
> > >   F:	mm/Kconfig
> > >   F:	mm/debug.c
> > > +F:	mm/debug_page_ref.c
> > > +F:	mm/debug_vm_pgtable.c
> >
> > Wondering if there should be a MM DEBUG section. But then, no idea who in
> > their right mind would be willing to maintain that ;)
> >
> > > +F:	mm/folio-compat.c
> > > +F:	mm/highmem.c
> > >   F:	mm/init-mm.c
> > > +F:	mm/internal.h
> > > +F:	mm/interval_tree.c
> > > +F:	mm/io-mapping.c> +F:	mm/ioremap.c
> > > +F:	mm/list_lru.c
> >
> > Smells like reclaim/memcg.
>
> Shrinker might be more appropriate (along with the list_lru.h)

Yeah I struggled with this one. It's a weird one, it's like a generic LRU
algorithm:

zswap_lru_add()
binder_lru_freelist_add()
-> list_lru_add()

Also called internally by list_lru_add_obj() which is used for dentry LRUs by a
number of filesystems

But also by the working set code in workingset_update_node() :)

So it's a bit all over the place.

I wonder whether best for mm misc as a result?

>
> >
> > > +F:	mm/maccess.c
> > > +F:	mm/mapping_dirty_helpers.c
> > >   F:	mm/memory.c> +F:	mm/memremap.c
> >
> > memory hotplug related. Well, one could argue that it's just a memory
> > hotplug user. It's mostly ZONE_DEVICE handling. Wonder if that would be
> > worth a separate section ...
> >
> > > +F:	mm/mmu_notifier.c
> > > +F:	mm/mmzone.c
> > > +F:	mm/oom_kill.c
> >
> > This contains quite some meat. I wonder if a OOM section would be
> > appropriate (Michal, I'm looking at you :) )
> >
>
> I think Michal already has a patch on OOM section which I expect he will
> send out soon.
>

Yes saw that and acked that thanks :)
