Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401C94430
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748578691; cv=fail; b=OUM4vyS1USmCjDOJrWe2Q+spydATtfk5qvauYn7utwyZ38+4d/vAQq+FWRDLWiehaKk0h4jL8/ndssRdrs+Km8eRR7Y0qJGB/Q1SUzusfJ9O5YukiIyHMXElPUGW4hNG4WlMqXbL4yGyl87dSva/5KIVIf+e9K4SSb3xaUskEeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748578691; c=relaxed/simple;
	bh=CyqvDOfYD+6KsUIKWyLKp3wU3OgDFJ9hUqrb3lmTkBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oILsUa176LwxuYv1kLIqn1H8IaaGJv1JTJYlwh43TwXOPDM2vDpClG4nfF+Q1nKvTYVUIPD5prQ8oYTyGO0PtUrrv/CwjGCcyLWwq80lvTvlmUtOSqUhmK9niu4+BorAt55nhxJ03/O5C7n5f1aOpwCEIdgCsQjIUNDP9BEG8ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i156GanQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=faSAM7vB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i156GanQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="faSAM7vB"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0vvUn009659;
	Fri, 30 May 2025 04:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Ht2gwDdQ5+Vs/sziIi
	1Ht+n6htAdn1izU7BvaYHERDI=; b=i156GanQlQYDuk08GSPdhOTRhORJJHlpD/
	H3ZQf50ExJeInG6nxbJdqnAV1UvmtSoWcPKxAS+14p7jDiEmlImaIMPtpl6/Kovr
	DABm+oso4V9lNXisL72GvGF0nxf/a2prie8mHc6e6FJxtDuWRUlnk59INCmf8dzJ
	AtJTiZeRkvaX+QF6bFEuW0IIx6BGYmIL1thYQx++w3lUhwdVMejKNErosvCc4Yn7
	zfJ3VFdL/WuP8QDDZpmVOknQ4xSLu/LOYZ8eclFBZIz9gLt0TLrffoSAj+RyFV0Z
	P0xDfznJkdC5Q8cPSZZPpvbG3rfeidcIgVgNbrqqSXkpfFzdu5Nw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v2pf16ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 04:17:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54U3F4Ni025644;
	Fri, 30 May 2025 04:17:50 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jk1v84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 May 2025 04:17:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJSJDYU66hz4nVeIrm6iH1GoDQmjrLnl0FKWOKkSonRA0lZGL6wS/K145cvJB+kljEq90f5RruO0tpeRhNyT2Qz7zSkdMmnDIToCXF9U3IZh2G4HO6jgghcRCUHoJXmFPmzvgILie+cIT76iGTrDC6JGa3ipdpqjDbbGJPmh9yn7qZ0THjgghHet4A3QD2dry7gRHAfN71K6rPBuNR8+EsjLEmPjn4ycwkz3rroAyuhPTgDyUs2wk6Jip8OWFRPsU+OY6FvGYmlG8WM1wt+TieBjtzqW94cS2EGkn3P32mik4leCtMZ+4hGIa/ldUU3mvRRYPAoTs6Ixswn+AmlNBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ht2gwDdQ5+Vs/sziIi1Ht+n6htAdn1izU7BvaYHERDI=;
 b=FOI/uxCZW7bEfKX1sVdm74BnBoZhONdfXKiyjxGqXlEh1rhD4OlzFAHUFyGzVWwft8PAV++BY6/r/NtrYsADeEa+RyU+35fN47YRy+5CiaYFUNxY2JGuMIr91Suj0ArzIj+IQB0CoyPqVTxBhHvf8w1B3AMHIhVplIxYNEiFarcdTpVIck3fQfeCt+bhpk04ZZqSrRkeLlJhP8BfPIbt0Ik8NSKymOLcqPXg/d24NJ74pEspCe5p/s5PC/SyRn4slGEGYDijftcu07XclyHRGDz/Bw7HMQblVZR1U1U9aOkxApNrfjs0f/g8qXJ3vz+IeN6tL4x2C+kVhd2PQ4ODyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ht2gwDdQ5+Vs/sziIi1Ht+n6htAdn1izU7BvaYHERDI=;
 b=faSAM7vBvOkUXB+gqnJ7M2ylIKzehC4fQSpBeuGNQreBJXgG+2a3oQfaXO2xaYmFXAVVJp+jJ7ic+VkWHPuTFlexInfvMcBnnqrr/faDZ5ZgiVGV4YA6iWPP03WaEk7l/SgOg/yznm6BArGkey4ITUQHnH7cGMJSdC3H8kgFALM=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CH3PR10MB7501.namprd10.prod.outlook.com (2603:10b6:610:15d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Fri, 30 May
 2025 04:17:48 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::f238:6143:104c:da23%4]) with mapi id 15.20.8746.035; Fri, 30 May 2025
 04:17:48 +0000
Date: Fri, 30 May 2025 13:17:36 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Christoph Lameter <cl@linux.com>, David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm, slab: use frozen pages for large kmalloc
Message-ID: <aDkxYOmMlpOl6xat@hyeyoo>
References: <20250529-frozen-pages-for-large-kmalloc-v1-0-b3aa52a8fa17@suse.cz>
 <20250529-frozen-pages-for-large-kmalloc-v1-1-b3aa52a8fa17@suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529-frozen-pages-for-large-kmalloc-v1-1-b3aa52a8fa17@suse.cz>
X-ClientProxiedBy: SL2P216CA0161.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::20) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CH3PR10MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ee1914-79f6-42de-f3b9-08dd9f30efb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mJVSlrukcqbSieiXcOvkTAI9LBE29wARHF4woSHMExkQlCPTNjl7ulcSkdEw?=
 =?us-ascii?Q?y0y8OA4MwdEo+jOVNBRR7HuNFbYPnj5enpZGqGkkde62mO9fYQxgDoq5W+JJ?=
 =?us-ascii?Q?ojmhlQCYVFDvruTWdA2wGWTjPQB21d5fS1Cr0Vgt42Ui0fcAU7uT7F4ytgEN?=
 =?us-ascii?Q?7waM72Hnovxd27c97KCjJlPfZVm/5dvwGRyvHR6+ZKJFrqbvis+VqKqQnObg?=
 =?us-ascii?Q?JCHyiSSg0XuGtC15EuiYxjZUPr2d8iqzyDCwR12twx+Ql5R9d/7JdX63p7zG?=
 =?us-ascii?Q?2w9/BHjGiiVAUfrkCLeG9+h9Gv1Lro6XZtDaeGl1E1gDwWC961zCjFYf3gsW?=
 =?us-ascii?Q?URT7mMKOMSM0wcxQQDkIxt8nEGBgcqVYB++23zKMmlpqfQsUWYZ7QyJ4900D?=
 =?us-ascii?Q?Nc581EsSqUmqfvbH3jsRDWLrld8bTsV69XAbAd/5qWLvxAThY9fBmhnLS6NK?=
 =?us-ascii?Q?ANiIHlRGiK8QtpOBq6Z6urmS+hLjFfxy8tWREAhpaOziuowRkWT3rzLcKxaI?=
 =?us-ascii?Q?B7ANgnr+ErBQ+bevmt23kFDOpDs4aR7bYFe2r539ueLFAfm6qlgderMbNOWi?=
 =?us-ascii?Q?PPGkD6c2/gItQ0+VaVHYiV94WiCBb6JBzVmPFlwIyRNFQmQU8ivCPA1Vj5Bw?=
 =?us-ascii?Q?AbfoiOLzVZxOBBCzM2rUnxTKfTqWp7w+rXoxZ5t5bbJkd+7R0svIACuxclPz?=
 =?us-ascii?Q?fA11yNXTC1b9NDHxpRxXvkOppJxaLY6rQ1e5OpWeHq04QlwtdUFF+iTz4+Mi?=
 =?us-ascii?Q?Tp7RaIVal8laWsacTHcdIVxdBcj7BF/JGCTqt9p4HECDjs0RIsqUae22iEtD?=
 =?us-ascii?Q?ZHdH1gqQDxyw+7N2JF2S23yYt9dDVJ3nYg7+0r48QzNI6R4WRYbNnAB3tVGB?=
 =?us-ascii?Q?VeQfWkPcTRapHpT5kn8qqC5m82W80HRYmDC2gr01wyi5TQ/8fZpGd/EWzQnz?=
 =?us-ascii?Q?02hlQsIMTBNGAxrOLiSqiqpqAWFTuIBX4ZZKBHEoSmqpWXzMZ215FUq2u5zC?=
 =?us-ascii?Q?+hFIR2mMzLl4ObgKkaTaoQHn6XIInnuHtJixouLL5zTOITmenQ5kZMtSNVr0?=
 =?us-ascii?Q?AZiQObi3vpDPmESe6onD51LsVaSZc6drYQlmgOjSn7Tge4Ew37CZhhyIBGAT?=
 =?us-ascii?Q?efqRWnCjtn1uNdJqpHyshx1wO0FuNwc8p8ejaBrof24gJSrsid4c9iYlOPrZ?=
 =?us-ascii?Q?jxrGwzglnLG7CH1n4nMfm2PenDTEWCjpIuHpBs/CipbknVaIQ3quxhXW33Ww?=
 =?us-ascii?Q?fjhsTy7npTf5lcQIfCTSsjP+JB5fcssQqt88vfoRUNDRGvmkwg8aOqni5TaL?=
 =?us-ascii?Q?XpB00JHJLSJm3eX10oO1FBmIQs6butbrxyTeZFc8I7E+SF8Izr9CxByNLVrS?=
 =?us-ascii?Q?ATzDAcqfqKtYtPH9rpqtR8sy2JZBDU4VgTUTDp1mwitE38c1PvCVFvFC3eEV?=
 =?us-ascii?Q?f3kM1Y0AXTo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9eNEAk927j0bfIQtedLMsZY7eK+yetlDuQGTCWlM+SLfp6rbEszfvDkksNJV?=
 =?us-ascii?Q?TTG0H73JHJYYccjni7SIhhMJK38tRV/OiFjZ9UcXhhCyzYMV+Tznxd6owif9?=
 =?us-ascii?Q?2OrbDEvSb/jR9ky8a1j9/ubq9cmvv/Z+nXoWCS9KgQpYbvmYibKbUmDdtFV7?=
 =?us-ascii?Q?7jX3mh7ct8WBF7vOD/wGvTfzAC+upiT/AwQefazZWQzU1OB2X6wineBhreNb?=
 =?us-ascii?Q?V1zzlC+FcNpVpn/X+AOPsNqXw+ojNqBCtf1+XxMSbvoXqMjeIc7GiQSEhJH/?=
 =?us-ascii?Q?YynWMnRbshpD0QLDGM7WhoLI0UlGhz4tjieXRLXOSiKv0aInrVNzqAbtRaYL?=
 =?us-ascii?Q?avBNeMCG8BWUGI5f3JkE1BjYpeCRXPgj2dH2VYTrxGrtUof8MmvCgnQ5wUa9?=
 =?us-ascii?Q?3WbtsCVk0pO7t6DBIh0e8xTJknOxZ+PS+hEeuoP92uUTjOCBUKyZ+/Ck2Nqu?=
 =?us-ascii?Q?HM0sE+79HbWi/zyXpTADV8rNl1DDPxPDDLaz5yv/KAPvbY+evEUoRV0bsKlY?=
 =?us-ascii?Q?rz9WO8Dpdvb2zMdOQvmis30KcApBNYGFIfc143r34qHTfpO9cQy5PXkg1Aez?=
 =?us-ascii?Q?SFfIFx8I3/H/x7K1nV1iw+esDQ/KG/DnDbTxeOh3v1V+GLiwx8wLnq8XHjZT?=
 =?us-ascii?Q?89ZdBHaJligDUfQjZ8M0r1KhPEcaB/tB3RfdE2ofAw7saFtQ3dnO0oepRV5k?=
 =?us-ascii?Q?ieyQlEUxCrxZCwD7Kz9SgVl0dDyFR/jTqtyLYmJfLEyprgf/8IVQMd6nHOOm?=
 =?us-ascii?Q?wHg4YsgZ0IT5Qdr6BSSkqpqjz4rV8Lgmbw0RO8nRa/C+C5E90neEvD3bIrJ9?=
 =?us-ascii?Q?cicWLyNEwn+cG+uobPFTXhdrlEcZlGQcjWYe7k75gqXdu4LCFC11ZoShdY6g?=
 =?us-ascii?Q?B/lkOMtOT/WFajBRVQFtBnVuARJqdK2+lOnF9SwOwWELweKpwrFFLM3bNQKb?=
 =?us-ascii?Q?iO9zyOeJx51L/MsAmmIz6GN0pJMfJlZYfRfBsnvN+af8CivL1Sk2ulGWVYOy?=
 =?us-ascii?Q?dEpmNGwn+0QsloT8rVTmsiSBkAaFqU9Yloak0TTSxvGbCwcuv1YXCNLZ/bn5?=
 =?us-ascii?Q?BCUpGflJ6Ibxjlrbm+NbmpNuQ6Q+SrT7dM+wPd1XCnJgctSgogKV7bkOTMc7?=
 =?us-ascii?Q?e2mfSjgATbzIWqauMpIDPWQ0eIX5qZAtQHcFJeBL/MSKIsgWzlxCjs4fw/uv?=
 =?us-ascii?Q?b9Bwz0dJPwkxlFo4Vyn9wFXCjCF8VDcbv24Pqs9/bdSJrFeK4Ir/DAFonX3e?=
 =?us-ascii?Q?blX8y+ke8JHgUDi2HNzvahvd6lvHNc9/OacPTw1sANaw/fk7PFaTKJnPa+WQ?=
 =?us-ascii?Q?Y1RpVXAEUZITbLUM3jS7VjbS18K0HzDmMjevX/cIgxwvsNK+BgDI6EXlajl0?=
 =?us-ascii?Q?f4L9ewU3RhisCsJoTSGq6YGsllhbfiYr8RSjQXZ3S4Efx/4X4IL87KEY9qZ/?=
 =?us-ascii?Q?z9FkT4dZaJTQh43kOSpclZ/ogzswHIH9G0+YOakzSRZHJtjjOkirSeTSANj4?=
 =?us-ascii?Q?6VMA/pjgnxf8ljgZ0ECZG3xJMbEkhL/++b+WDv+b/FJ4RT2w1BBAQijLCWA9?=
 =?us-ascii?Q?BFZIbvCTNpevBblVXfwrBslCv7kqUe8gqkigCJ7c?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	z57D5srC/0wyII8xBAO1hE6nd5CBrhpZWRjMnR/TGHoSOywZRmchc6blocWZsK9uNtGTmrM8SFH8FvPvtF+n63MMiL5UqlSuhqxV6Fuvqk94PicRweF/WQZwketRv71S+9XWhbmncuefMtOAJeRZn7NdfIpzJqukLDjLu5nPZyJLkiPLF5cMb+Orb6LMmQ51PaEGNM5fZJFd0tx0SpovsOGiwppci/6/fTW/JlHVEky3HDeHSKoqSneaMrsyTJQTrjXk1TFjkevHIq/6xzr4itUBTJg4AdI9/ApD+XSHdfb4bRk96eCzHogP9D5DUA6pE167pR+Wylo122OHvBI8iIWfVuaAwGp+CIqFpAjjd//nKZ/CMYHV/nQfZ2AZrMJ35u4dYVQdJygYXnAxC5wMxpKaozZoeEXfCSCKuOU2tNbiTTb/cQ0id3scz3ue19BIFCkJ7AjlJXozYECBOeLrf4txMgJEN8gQAzoSCFO5XRYdocQdnVjnOR5Wvwduu6d1W2oRb5xlZDFFErKFkGAgONwBbbXjPniXCaNDQAKd8sErmd2bL6fNfcGL5Zg6ML4NljxhQ/xey9OgTBMjjKB2FMIqcKWRf4S2bSE/9KUSbzo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ee1914-79f6-42de-f3b9-08dd9f30efb3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 04:17:48.7337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icVeFMLW09T02A4vvAUCUS20e87URmnfTdZ+Qj2BqxkfqjjeJm/LtNDzqxzlHFEc2ht97c3RZaIVkvSOMdTRVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7501
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505300032
X-Proofpoint-ORIG-GUID: FAUfOej0a7kKvq540BmTVmTnticNiDf-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAzMyBTYWx0ZWRfX5zQfzf5GJyhd DQS4T9c+T1vflWW/hbYQYwDcPifGC4Imax4dPwvzofw3SQhP1LTTVDXAmiON0r7z7MVveNDQTDw PpUVOFxJTMGZ/Dv1qttfWv9huakV1mKnnLwoJazRghebgX0gkDZjzeKS3PceLcCgKFTFCvPqfQD
 lOVASt7+iuV/+u/LhnCaDfvZRLmWhK5pJ+r4/Sd45heCmajFYV4yjl4XrgndkMaj5pg63LURkKn sQeKw6rC4ghTf9sI/725p3ajp5fH7VLCKIMKqaQQtYO6bKIvfzkn6hgRxkpPVEdy0Tw/r8KeAQH Q5ZJua7iNPsQ0sgDYRjDKFmpDkFKteHlBPhogsPn3bkuLI3/+bn2MFDVEDLPJMyOajq+aJgSRuz
 XmH3++LZk/MBHDaXDw2UNO6YAsswNjv9hci5frUr5Ynsoju0aH479rMOv/yr63kdi6qNwncN
X-Proofpoint-GUID: FAUfOej0a7kKvq540BmTVmTnticNiDf-
X-Authority-Analysis: v=2.4 cv=TdeWtQQh c=1 sm=1 tr=0 ts=6839316f b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=_U7KzHemsITJhucaCBEA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207

On Thu, May 29, 2025 at 10:56:26AM +0200, Vlastimil Babka wrote:
> Since slab pages are now frozen, it makes sense to have large kmalloc()
> objects behave same as small kmalloc(), as the choice between the two is
> an implementation detail depending on allocation size.
> 
> Notably, increasing refcount on a slab page containing kmalloc() object
> is not possible anymore, so it should be consistent for large kmalloc
> pages.
> 
> Therefore, change large kmalloc to use the frozen pages API.
> 
> Because of some unexpected fallout in the slab pages case (see commit
> b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page"),
> implement the same kind of checks and warnings as part of this change.
> 
> Notably, networking code using sendpage_ok() to determine whether the
> page refcount can be manipulated in the network stack should continue
> behaving correctly. Before this change, the function returns true for
> large kmalloc pages and page refcount can be manipulated. After this
> change, the function will return false.
> 
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> ---

Acked-by: Harry Yoo <harry.yoo@oracle.com>

-- 
Cheers,
Harry / Hyeonggon

>  include/linux/mm.h | 4 +++-
>  mm/slub.c          | 7 +++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index bf55206935c467f7508e863332063bb15f904a24..d3eb6adf9fa949fbd611470182a03c743b16aac7 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1549,6 +1549,8 @@ static inline void get_page(struct page *page)
>  	struct folio *folio = page_folio(page);
>  	if (WARN_ON_ONCE(folio_test_slab(folio)))
>  		return;
> +	if (WARN_ON_ONCE(folio_test_large_kmalloc(folio)))
> +		return;
>  	folio_get(folio);
>  }
>  
> @@ -1643,7 +1645,7 @@ static inline void put_page(struct page *page)
>  {
>  	struct folio *folio = page_folio(page);
>  
> -	if (folio_test_slab(folio))
> +	if (folio_test_slab(folio) || folio_test_large_kmalloc(folio))
>  		return;
>  
>  	folio_put(folio);
> diff --git a/mm/slub.c b/mm/slub.c
> index dc9e729e1d269b5d362cb5bc44f824640ffd00f3..d7a62063a1676a327e13536bf724f0160f1fc8dc 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -4281,8 +4281,11 @@ static void *___kmalloc_large_node(size_t size, gfp_t flags, int node)
>  	if (unlikely(flags & GFP_SLAB_BUG_MASK))
>  		flags = kmalloc_fix_flags(flags);
>  
> +	if (node == NUMA_NO_NODE)
> +		node = numa_mem_id();
> +
>  	flags |= __GFP_COMP;
> -	folio = (struct folio *)alloc_pages_node_noprof(node, flags, order);
> +	folio = (struct folio *)__alloc_frozen_pages_noprof(flags, order, node, NULL);
>  	if (folio) {
>  		ptr = folio_address(folio);
>  		lruvec_stat_mod_folio(folio, NR_SLAB_UNRECLAIMABLE_B,
> @@ -4778,7 +4781,7 @@ static void free_large_kmalloc(struct folio *folio, void *object)
>  	lruvec_stat_mod_folio(folio, NR_SLAB_UNRECLAIMABLE_B,
>  			      -(PAGE_SIZE << order));
>  	__folio_clear_large_kmalloc(folio);
> -	folio_put(folio);
> +	free_frozen_pages(&folio->page, order);
>  }
>  
>  /*
> 
> -- 
> 2.49.0
> 
