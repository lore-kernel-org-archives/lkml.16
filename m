Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC90A1AF0B6
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739007906; cv=fail; b=oWYBjX77lvtef5f9mWifNpBzSrmIpisN07BWKK64l2PIAfR567lmVwsgxZPrDzF0zlk1Cq6uHqF2JviEd52oaeuyJBCR4U/HijUmPeifIpuO97z3qF30z8W4BQM71hxBxj6BK2l53OAVKMNzH+coeXfnXu6SfxtgxN3c9WUi01k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739007906; c=relaxed/simple;
	bh=Zy65KPVvu5ZtqNbAaD1/oBxQrKq5HwWytXuozSuozdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bXkTeWfqsjf7iOrqiVScvCfqthLCFujVsq56KN1OP8VC6dRin7IzkOauBpZUmhR89kORzbURBCkjeocythNqwOD3xAsfvDGZXwpF3n0bfBFE59zHbocp/RiX1ezqt/w2tN4llScE70CiEwJaIlOI4SayziEbCPMjVWG8xEG82s0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=l4juUh2O; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Gs3+4S8Q; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="l4juUh2O";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Gs3+4S8Q"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5185qwRK031141;
	Sat, 8 Feb 2025 09:44:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=rYhiqe6uU5+YpUUqK2
	EZMJKGJINY9dqY5NCWo1NfDOI=; b=l4juUh2OoBYYD7G+qh3+g5JrQmF4Ft7LzP
	RBAMvvq4gbAUGtKB1E2vQfJG/vJ7BqLii5bQw2SejkVtX5Ac0PLk1OLN6cdxLeIq
	/BDP/tErIPzvM4m4O/tZAFzoEamQoYwQiJrYroLvIg3rpzvx9QNEzOaosRLj9EHE
	7uOkvKKUQ7nSybgvhRTM45FYaVCsEug8KME0xSSIu/A3n2ko4Ya3qZCxgvmdtomv
	j3yeH55uH6W/SPbo2SsnKUPYhAaio20H6enTCKDijK7JJ+9AUIeVpasjwyf+BMTU
	uXStGsLrym8SDOcySlLxJ12K+vub93ef3U53UqVxjHPxClDLkd5w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0s3r66n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 08 Feb 2025 09:44:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5189f6bJ002808;
	Sat, 8 Feb 2025 09:44:54 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44nwq5r2bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 08 Feb 2025 09:44:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K224phxuHXyyNKQxGnB3HVDaxFTD4oDoUMNGL0OHyVsmVENHHq/7kqZeIwpxbeuHvOZIERRXhPmaV9XUg8UVbf+SZd24Gc3EQl3fSft/6PplwkHIpZnNqIivkLcKJ9FeRcy1UDj8E0etvXb6Ufht9eImx09v/3PUnsYj2/FvslIBaF2t4JE06jZyBZ6njimwNLF9YTztk0DRazMjo47m3+cY++bRkkOCpvQGNgfHxABqRIZT3eZ7ItfAxHvbPURhtIeNKCZMNh/Y+jx+q54t4a2vCgjmrF7MHMwzZuA9unY4cB9H4E9qIi8wh/A7VihFDETARLrYxwgrvw9ZTUrNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYhiqe6uU5+YpUUqK2EZMJKGJINY9dqY5NCWo1NfDOI=;
 b=PJU/TE1gbcKZFyncc9QzjCAyNTyLH+tCVlFoa/FeteW0worgqizOmvt68YPwaGfOr6ftrrySQku0RzQaa1Nk9EQqnRYHwAOahLPRS2cUPWNv0vTZuI4+/aemxd7V6lUejaY9Y3M3gxFBbejL8nwRFtapcBw/nzpb5c+4tyZW+wyXTmad4zUhaF8Sc1MqQyEzJGYTo2o+XS862CE/vF/iiQvjSSqdLbFUbTslFSEZ/9wGtONrO4zXJ2WmEuw7jNN8818ejPDnGrfqV4U7uVBcV5GpHSl07t0LwvwS2wvgGvD6qdQmCYLzxrYpVgfu0/1HsSq+fqv9tnk/+PBD2oXHaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYhiqe6uU5+YpUUqK2EZMJKGJINY9dqY5NCWo1NfDOI=;
 b=Gs3+4S8Q16BXwTIofXwCJQpm7F6ZALApSkingNf4Z/hds6tu9MkBuNVFwiNywjce3jNMR/qtW7UWRZblWxtTlFhQ1DgiBdtjC1KFwcUFT/GqWHY8lOhR/rX8teZ6xK3mHqr0Ybk8aeLl70k/Fyth0Ik6TndNxciM5q3gyjeZToA=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MW5PR10MB5825.namprd10.prod.outlook.com (2603:10b6:303:19a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Sat, 8 Feb
 2025 09:44:52 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Sat, 8 Feb 2025
 09:44:51 +0000
Date: Sat, 8 Feb 2025 09:44:48 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: use READ/WRITE_ONCE() for vma->vm_flags on migrate,
 mprotect
Message-ID: <1144a028-c48e-4e31-89ba-874ede56f186@lucifer.local>
References: <20250207172442.78836-1-lorenzo.stoakes@oracle.com>
 <20250207185014.c5d9f8f3e7065c11a4825125@linux-foundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207185014.c5d9f8f3e7065c11a4825125@linux-foundation.org>
X-ClientProxiedBy: LNXP265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::21) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MW5PR10MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1a164f-28cd-4ffd-94b4-08dd48253c2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2X0dVf3TqPFe3iJxejF5Dn1IGFilaVEoThr2gN000pitVNEZkyT3/rryUF24?=
 =?us-ascii?Q?X1xnzf6206TzzWxB3jcZFw4kiHNYfaPkOyMVPPamrPFlAoA4Fc663xYbL+1P?=
 =?us-ascii?Q?GYax836/W2Eju1hRzlG+ftl0YnlrW/MsbjZ/clS4ZQ7EriQ8tpqIr6X+k7l+?=
 =?us-ascii?Q?4CeUjZu7Cs5s+Uqpj/lFKScMsHjd3WiN8V4tGDxAZmYaAf2e7CHSgNs//njd?=
 =?us-ascii?Q?ouVgyLxlN5Y/WuUnxK+yQ0dVAGt+FdCT6Ih5Z53H7MDPsUa//1dQyNE5YXyy?=
 =?us-ascii?Q?E2RceK5neLLnCyIGM6hjd5qKMmOBAB5OSxHoRVMwkr9OP0lY+VAu7VJVfDwa?=
 =?us-ascii?Q?ZUfBkz/rSRb2Knbyi4AzGGUYmp8N+P3mqMUIpd/F4fSh+lAmd/nPhEroC/QN?=
 =?us-ascii?Q?cQVrgPF+M5oFJSnG1Eae2YjTE9KeanaKdb+Y/kef2tYZFg5lIlwOdAHObqLD?=
 =?us-ascii?Q?/sPsIco1NgLkOE5KRF/evtlogZzrnRF+P4MIjOkOcfFZOyyFI5WI0P56pG1V?=
 =?us-ascii?Q?OSJjm6NiyGwEITlswX+4b8GaI8iz/E1SkfR4crj+ELzsa26YoazGKZYGf6ge?=
 =?us-ascii?Q?f/vxHTd38EIf+TEReuigDB2GmC6NEI77EbrgloCOwz/LtnzZ3pk1Z71LmjU8?=
 =?us-ascii?Q?tBe8EoqUhyYxXi31od7qFinxXYVg9PCDecXjjDneImk3WIMR3SV4usxudVWL?=
 =?us-ascii?Q?D7UHiIXwoTIq+Gz3zNwjDTyM8Q56pJDPiS1MaQagvqpe0VQdDlnNKG3Kd7Gh?=
 =?us-ascii?Q?jtI6zs4CPQ/Mr6TNW6ynWEQYv4lq895RctO3JoOlFMy56oCpWpi26c7IpH29?=
 =?us-ascii?Q?Y/m3FfRUxL6WhIg0/4mhPSDDbFVMEarL2/mEVfZ7asSx54cYcSFQ7czaBI5b?=
 =?us-ascii?Q?ndozupxjkPsDWAwrZ+VI6DoWk5Xc6LFbrNrEPYtjHldumI4bMOKeuDFDBVyb?=
 =?us-ascii?Q?zc4oJ3bDl0IPysZ5qkUPgxypgs3mnwRU/DlM5r/poIn3uFnaoeoB0ZgF+Ow5?=
 =?us-ascii?Q?bPwSUCAQbqm+OAaLvDk/kciHHMgdVjJalEh2FL/rT+ak/II9selrn64VCjUf?=
 =?us-ascii?Q?UTYHUaFwgU842321n2Hs23yNYPKj6DxnjSmO7olTIdcqrOHU2091RZ1oN4Ik?=
 =?us-ascii?Q?GqAbcyXjq+t1E0DDkwXJYhxSPbo78Rqd6CB0rNnTaylFvzgS8koGhoYH9SJ+?=
 =?us-ascii?Q?zMslsF+VN+AuFy3dDyOz5J2QUZ1QP0nve0eCwDU4hfmYZ3/1e09iHL/czCsN?=
 =?us-ascii?Q?r21ElrUDOLPWrq59S/JmXr6ZuLl9UP3dp6oquMAn3Wq2zDsJoJ6xFTzCvO0x?=
 =?us-ascii?Q?8oY6jsn2VHR4TIF3MzqEoEFf+/SbNFwL4CJg5WOibGqH1R4ZMR+oIkwbBm0C?=
 =?us-ascii?Q?aueLKZlzyi4NUCgQAqY0iHlXdUUv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ROl8gSqqqKv3GKFKrMOnLKR74/8238yvNDe4RBIONQdFu7SmEx1xf/JUFObg?=
 =?us-ascii?Q?yqRVImCEEPORaCJgisgkObBs0zG9JBhObKncmgxYttePczp4Dj2u45xkGSc/?=
 =?us-ascii?Q?+t+Yf4hC5/Xd+cavh8tLVPwDi08aGbBVLJTi1Mr7+gjQgtYHvEcKjw1crpkv?=
 =?us-ascii?Q?vQF8qm5KLOhylU1i3UA/q0lCjM4qtx6kKbJRnnekmBjFRKNzfkmAmLEqySmZ?=
 =?us-ascii?Q?VLdkBGfiK2YJWc/5dbUplXXaAQa/Zgna1G/RDrh9d4n5x2SHIqjDhgdgODtW?=
 =?us-ascii?Q?OH9IZCOQT+gKHNy2iSFeFr/GbctZ/T6zkiGKQ2aabB8mRv6lTQuXumPelWRQ?=
 =?us-ascii?Q?7b4KSKkHdUwD6SWbYGfzjfM3uuLHCgJno899I4Zwyiz66rsKMy1jKZQldY5b?=
 =?us-ascii?Q?ePF2Fgio7vfPfNl1tYxIxLmIY61nnPgcJ1m1Gc+bE9SZawyTsvN4mATZU1bm?=
 =?us-ascii?Q?sBsrNeXxABuADvAzkr7NFNvEjhclTrnXW+5yw0FfR41V9B1ZIFbFKXIzdZqX?=
 =?us-ascii?Q?7K8XOqeQFZUyXvovzJ0GjvH02ujHohxOGionyGu1+luib56luQmuvAT+Wm0i?=
 =?us-ascii?Q?YlBNQfGL4Y82+kloDA6Ht7geQKQyOghzrpIm7HcYz/fTFArzNDxPLKpC7q9q?=
 =?us-ascii?Q?TGVZv5x+hzBV1dDwpqMay9O6oge0ZhfMqQhLyfENHiJ9QmY+g5rcbXM5S6ps?=
 =?us-ascii?Q?KwEjNDxwrtbWsScQ3+Ote6lI8JHsWMIWfJAiePNTptZQlp5XwEkadgLhzPCh?=
 =?us-ascii?Q?2Pd8mkHXfcEmVPtxLajCTGywiz9kJ1xtbEk5VWtr4ZT4haUK03ETNMpE02xO?=
 =?us-ascii?Q?WRi99L++SfhTnvHZ7pHUQg6oH5UPtDVWZziGWqCTNNWDyKVtcGwrJsetEWKJ?=
 =?us-ascii?Q?wEPPk0kPAVdgNtP+ct26PevgDyeozset42ZXpImMS2dHkx/6PPpfMhsojO3M?=
 =?us-ascii?Q?np3zBSz1tpoLF5+GT9ZMfmOqF+zELb6ZA6lcHyCOKFqx2zreIok24PblaX80?=
 =?us-ascii?Q?2rDMXuZRNvav+Y/Nn7EofBMthv9CI3Lg7nohlsCOl3nSzbogGvSoaC/v80TJ?=
 =?us-ascii?Q?dIuNsGhAC+0iJyyOcQT/f94Huuh2cXiPV85kGxY8I05zVomnRWmkk7enDuMm?=
 =?us-ascii?Q?2f/g8SzGd8C8jVZoHuxi0Y75fzv0psAGQvrq1vqnYX89/6aoAHbr7F8iNNzS?=
 =?us-ascii?Q?eCqZVcZgTqw3fcI2SFt+V3cJdQ50lBNPa94DdYsbw4A/kzsHZFHN9QENjeM6?=
 =?us-ascii?Q?kc//az90fBs2u9UgRmaK1mLZ6FbTnrDikshKp05q+2Pmyv78Wk0ZEvMQ4dpQ?=
 =?us-ascii?Q?j0Kf7HVC9wXQASihAOsemktVX1+kMNZM7pb1LYqG2byzg9IhfwMPVGMcIuO5?=
 =?us-ascii?Q?ngLM4U60ihiq4BLY/IZSr5+zwlQyDhdGy8DpURs/0VEeSWNEx5GUKqXBaaYy?=
 =?us-ascii?Q?ee+nURZ3Q4wuP2s0aEyF+hrJ7TFuijMKDR2fdYkBzDD7j6q2YLbfMWUfw2pt?=
 =?us-ascii?Q?uGhh3QDRCege/6qylDgRn18vGHmBDca6gneUmFfOisb0I5zLgfboi2MCPtdV?=
 =?us-ascii?Q?6cccMcgPyOqerI/xx/Nx/dbcCAhQwUZAwPCg/ldXD12cZwEBVYgxVbriQjzB?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wEQ3I8yVPuaDM+CM7NdCwTVgkjZo5U10BjFs7pvPrs8Hbv5jfJmaJ0Ran/kbiE/czmx1U0UlCsDjQGKJO4v8V8G0XseEqd84N/mAGvykK9uyX4LgOH0bpwyHUlmORY4jEmQpGNxo2xIsNAlwAlwxeqwtc28hcxzvMfqYkNOUYW1KlaCYVRg+7nZu/WoRyF3OKKTP3AejqB5V/8k6No87/zyqxEXqKeVvC2t9UPCvCohCIgJAWVcf7TfL7D+wY/w40DKm8UDB6wKG3moL0n9t7gDDKLMDaByKw7w4dEAO3GcVSLnSmyhcU/p6vL6QJtIzCV8sz24/zQo4g0Ptw4LTUBzgANi8VQeFUj5EWW+7Ogo/tUQJRCPsjcxwjDhoNJMnyu7lAtA2TRNjeANa8fPRHnz3pck16K+xQRBbdg1EL9YTaKh8x2vY9PP04bQFE/lKZ+pb/oL0zxnkup/RrR+dCcCQkDoSEtE2/fBNnyzoKnCGBIornPGqK2gmDcKZMqFND4aJ3904L1KnnOWH78tKKshtexUxeQY7AhKWh1+NRdEpFHRDFkyGqV3WBe1H1iMuBSP2oTXhPsYuqziyl4fGkDVha17gVAO0Ruox7nzaa/0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1a164f-28cd-4ffd-94b4-08dd48253c2e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 09:44:51.8103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVXe4tz+Zol9l7jOzcp2eZjFGqDUQ4vRfZHLsBDDg2vqrXzZmhwiBryKVUWrmq0q8PWqJUUwVAtryB/9eqiMCWjANZfsM1wQJsUDuEhf1P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5825
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_04,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080079
X-Proofpoint-GUID: NuRi8DstnCc0SB80jXfWB7XfDqPsSO06
X-Proofpoint-ORIG-GUID: NuRi8DstnCc0SB80jXfWB7XfDqPsSO06

On Fri, Feb 07, 2025 at 06:50:14PM -0800, Andrew Morton wrote:
> On Fri,  7 Feb 2025 17:24:42 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> > According to the syzbot report referenced here, it is possible to encounter
> > a race between mprotect() writing to the vma->vm_flags field and migration
> > checking whether the VMA is locked.
> >
> > There is no real problem with timing here per se, only that torn
> > reads/writes may occur. Therefore, as a proximate fix, ensure both
> > operations READ_ONCE() and WRITE_ONCE() to avoid this.
> >
> > This race is possible due to the ability to look up VMAs via the rmap,
> > which migration does in this case, which takes no mmap or VMA lock and
> > therefore does not preclude an operation to modify a VMA.
> >
> > When the final update of VMA flags is performed by mprotect, this will
> > cause the rmap lock to be taken while the VMA is inserted on split/merge.
> >
> > However the means by which we perform splits/merges in the kernel is that
> > we perform the split/merge operation on the VMA, acquiring/releasing locks
> > as needed, and only then, after having done so, modifying fields.
> >
> > We should carefully examine and determine whether we can combine the two
> > operations so as to avoid such races, and whether it might be possible to
> > otherwise annotate these rmap field accesses.
>
> Thanks.
>
> If some poor person reads this code and wonders "why is it using
> READ_ONCE", what's our answer?  I guess it's "poke around with
> git-blame".
>
> And I guess we can live with that - it doesn't seem practical to paste
> changelog text into every READ_ONCE() site.
>
> Probably most people won't bother and READ_ONCEs of ->vm_flags will get
> pasted into other places where unneeded.
>
> I do wonder if we can do better.
>

Indeed, I was thinking the same, and we were discussing more broadly on the
thread (and separately too) - ideally we'd have a way of expressing these things
more concretely and explicitly making it clear that 'hey rmap might allow access
here'.

It's one I'm going to have to sit down to think about somewhat, as we also need
to audit accesses like this. It's on my list and on the whiteboard which means I
will get to it eventually... :)
