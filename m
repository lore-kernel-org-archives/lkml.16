Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D83276030
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697279; cv=fail; b=obSTlpciaGzymH/z695u3snQdaTDhRzXOl1t/7eImAzWxO6QaB6QIwgUFHH+lB/d0PjLb26eqQDZO+ERVdh9Q/26WdBPfgUZwvkmW+VM5GLeBsQC0Wcs6gPRrof2POHqg0enFdMc65I92IJ7YgynTxijvSOqv6Qv0ijRVXgj+H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697279; c=relaxed/simple;
	bh=Nbre+e3zwW8uxMKiiahda5Pv9HP4Aw7HNKiW+UIIiIA=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fnowHfhLX3nX1cx5u7WKY5LaVJH1Aco5lWs9rddFM/xEGlWG5+zCGVfcdyAyfxR8oisbaqCM/pZHkPrs59B0ru13sNdQU2yb7/xK8GVmJ+9F98RHWbjJ6dE6lllBPfQ5mHDMFT+eyVKAOJ0HDIdzQAuldxJ9PANFB2ZfGY0gKJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TdNyIxnu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=exHkgKQk; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TdNyIxnu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="exHkgKQk"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NGXmsP001456;
	Mon, 23 Jun 2025 16:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Nbre+e3zwW8uxMKiiahda5Pv9HP4Aw7HNKiW+UIIiIA=; b=
	TdNyIxnu8LYEQn/VY47V2GEehHNqLvewvzq907z5vO1ihIz/2jsFmU5VIt+VeOJK
	s3UzHLyNjo+pDqTkfBSoEmuDFLfLsgua3N6bwWs3JpX4E2JW7pM8/sCP6h4PwRXv
	/mg8e87XN6G6zrFj210NSzfpod/HvN3DJJFAooPlcmdnI2CkquwOHKZfEL23b6I1
	zByU+nZaia66X+2rzY3woRE+5Ss2eJ+0nssignKwJ+AoAAPyF2xpw/230xvgPjQ/
	1iEeD0O7hQ1JijrINNhWiWTOdx4hL4SwpOEN5wgFU6/eR7w7ixv16IzOpQtQPBW6
	42bLZGzZ6aLdeLLZ9ZpD7w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uu6ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 16:47:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55NFKwLc039600;
	Mon, 23 Jun 2025 16:47:41 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011020.outbound.protection.outlook.com [40.93.199.20])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr3jy9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 16:47:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nY43yhSkTqJRnxvgImYxuQQRODvmZLAGH/DqggKAaYvuG6hqyTTBwNBkCK9PI1B8BzT8axWtuPhZmtRhxuTsps6zKiUs0wnl0Ox0hjmBQhVPngNDIB/ddtytL4uMxUP68tCB88L+9+zC0Za+UhGPsdUhBW0nlWtHME1YkzuUnuQ188G2tewN7pYifDHcCFqjqs+UNlI35gFQFgQ+CLn+qj4tB53Af6nmgPm/yMhTS5M69Gu36pY4MLUy55OUASjhjKOC1DHErMn2ImBenYPeFrijJM8feGpG6kDVbFAC/BTj/dSlbPSHXlNDyhOKf0Vc5UWvJLijq4KhcZUnC+HDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nbre+e3zwW8uxMKiiahda5Pv9HP4Aw7HNKiW+UIIiIA=;
 b=nrMjBnsxAkwTB/0BZw6UHkkpmGV3f4xLHed1u1WUe4xAliceJKkUt/UY4/jvw/mXzNEX1qMtH9kxcB5N6bp2PgQdkPEibyM4Pb8PML/xIIJ31eRZFP/NXmfhKfmhiHXjEkr3YKENnag5SZLxcIVd3YnTgMZ85UNnLAtlhvwfhYy7z6FSCbn2k273+S8OtqskTofFnUWQZpR+TrwRZx+p8hDjYo3sIzv/nwOVqjOi1smtKzsu1DSATke4W1LGXEe2+dOMt7LIvB2uR9ISfi2Ewwy6Lyv15YJ+4L2KA7/RrTEfVMKVytD89/Ipkt78Boc0Xyq3HhORKTq3LsgsIWL6Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nbre+e3zwW8uxMKiiahda5Pv9HP4Aw7HNKiW+UIIiIA=;
 b=exHkgKQkwOkmn6V3MePr3P9sG4fw3nvdNsvx1+my95KtPx7W3uteuP6Gt60TQMrKbkY6K/B9BBGwuJB0lGRNL0/V6rUGxYkYUbUKrRMPKlay1YSI+TipnLd3n9CQvMTfUZk9jtadipRE+1dzmvLe3hTqGubaFWItPClBimGZgy0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS4PPFDB583D803.namprd10.prod.outlook.com (2603:10b6:f:fc00::d50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 23 Jun
 2025 16:47:38 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 16:47:38 +0000
Date: Mon, 23 Jun 2025 17:47:35 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>, Jann Horn <jannh@google.com>,
        Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>,
        Colin Cross <ccross@google.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] mm, madvise: simplify anon_name handling
Message-ID: <8aa656f1-72bf-41d6-a79a-a37d56bea08b@lucifer.local>
References: <20250623-anon_name_cleanup-v1-0-04c94384046f@suse.cz>
 <20250623-anon_name_cleanup-v1-1-04c94384046f@suse.cz>
 <CAJuCfpG_ORN2+pifB4H16eASTAQFY+Fa_5FRROkffLKuNJpD3Q@mail.gmail.com>
 <rhjfvvndg23mhvuddtrn35fmbcteafhjusqcj6uug3blvrykld@voxejacky3cb>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rhjfvvndg23mhvuddtrn35fmbcteafhjusqcj6uug3blvrykld@voxejacky3cb>
X-ClientProxiedBy: LO3P123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS4PPFDB583D803:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f915cf-7a71-46e7-b768-08ddb275a99b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wk0vYXhCNllCN0FYUUdOdy9TZzJySDlaODZmLzJkWWF6VUJTMDhNUTFDajdO?=
 =?utf-8?B?RXJBK25QZm01RmFqMUNkQVJtTTAzK1FsdjlzQ0RMaDZ0dSt0ZEgwdFo4UHB6?=
 =?utf-8?B?TmFLY25LWHpGeWg4cjg5ckJFNVNTWFkvOSs1ZjJralBPcDJaaDliUFNlOFdp?=
 =?utf-8?B?RFMxOEpMNGdHay9CUW1ZZlQxVjVaYURtUU9qUHk0Z1BmV2MyUnEvcXhJZkQx?=
 =?utf-8?B?VTQwdGZRZ0w1TTlKci9lTWVWdnJSeDZwclhMSHY4eE9zK3NCcGxRc3VnWFdR?=
 =?utf-8?B?eWs0a3UrRVp6bmluV0RVc3RPMm9PdEhRdTA5S1ZoRWdadXBIaTJuQ3ArN09U?=
 =?utf-8?B?bFJXVU1Qb2QxamRzMkx1dEw0V2xwN2cyTFk5RTg1b3FMYmxkNVNlVFFQYkln?=
 =?utf-8?B?aW5Id1N4dnpMbkJJOTZIb01lbXBuMFBsYTg2WXp0M3RqaE1UQ284WnJPYkRS?=
 =?utf-8?B?TmVyWGQwQWN5cFc3ckl4dkdLZVV5N2s1RjJkYzRDSG9PQk5vM01XdCsyVFlQ?=
 =?utf-8?B?K3k2aCtRdFU3TlViZnEyV3dvWEdJVlNyNFhhK21mUmlKNGZ5cFBkNmpXcFND?=
 =?utf-8?B?L0gvMzNVRVFpVEpSNUg1N2ZVRVNld0k4QWlnSU04MWJMNEFDUUdGUXdRVGR6?=
 =?utf-8?B?b2Z0RllxSllwNzRSblZSRS8rNURYcEFqMllyd3NueVB2WEdocDZPQzZIalZO?=
 =?utf-8?B?cTdoNUFvSzg2cERlaDI3ckhhbi8xbCthdHFUQjZ6anZETmtJWi9RdEtET2tr?=
 =?utf-8?B?Ri92b0xJbkpaa21HR0o4OStGbnpHaU84TWtVS1pRVnNUbi9qV2JUZnBaSTRF?=
 =?utf-8?B?NWlEKzRGUW5DMEFMbGlWS1g1T1ZBYXFSL1FqRFY3OVNUOEhrWklSMWVjam5m?=
 =?utf-8?B?V3pBblJRMVpWMVlOZmFjc1pyMEdYNE9UWGVUaFBJZEVMSlpMM2tWdkhPcTls?=
 =?utf-8?B?SitMd1RmbmUraTlkRU45U1M2R25TNVR5OXZCejFnL3A4YVZ6WlJ6QnpNbG96?=
 =?utf-8?B?Z2pzQyt6K1ZCU0NId0lrUXZwT1E1UjFiQnFld3hXR2d3SmJUUG05SGI0ZlRu?=
 =?utf-8?B?NHdPcmRYKzFxL2NYazlQeXJMdlM2Z3FIMFJTQW8vN1RGRGZDZ0owYlFQNHlC?=
 =?utf-8?B?LzlLb3pGMXEveldTbVdZbG5UOGM5TE1DY3lEOUl4aXRoaGRQaFRDOUpuMlhQ?=
 =?utf-8?B?bG1VZmlWSmJud1RZemxHWFVxS01ZaTRzWVZkelZ4ZnNPRWR4eEpKQ2ZHbFli?=
 =?utf-8?B?dG5jeXppL0c5Q1ROemkraUR2S0hjL3I0eXhHVnNDQzJJM1FsRHAwMzJvREpH?=
 =?utf-8?B?eld0QlVid0puQ0R2NkxyU2oxUnF6WjJ2dVJycFRsRFlEbjJSWUtXOUo0N09U?=
 =?utf-8?B?UlA5Zko0b2dLejByQzJScUN0czBqdHAxQVpLQ3haMUh1bUljRUx1bzdFVDNm?=
 =?utf-8?B?WTlZYWVBcksveU0yQWxlaC9HLzdLMm9aaTVybHJyWm5QaTJOZ0FYV0hmNzBy?=
 =?utf-8?B?YnJwaGMwSDdKSUFqOFY4Mi9WdTNsUnJzVFF4SW5kYVhqYzFkQzRkKzFGanFX?=
 =?utf-8?B?aHB6ejRqdHRHYURkRFR3bFhaczM0a2VaNlR2MkNDbzRvR2N3NWwwVHpRcmRy?=
 =?utf-8?B?SG5iNlhsY2k5TFVreHBYc1VwMk1XZDIzR3JwVVl2aFJ2dkJKb282Szd3WFIx?=
 =?utf-8?B?aHZaRWJTcm8vVmNPYzRaWVROOGZ1eW9vVnNiSGdUNWRRdkRTM3d0NUVWakQz?=
 =?utf-8?B?UkxoUS9TYldlY0FORmc4bTBBcEM2KzVlcEFPQTlWVFNJUkt2MVF1ZTc4UTVW?=
 =?utf-8?B?d1BDd0dEenorMzJxa1k0d2lUUUZnWVFvOTFNeW9mTFZvY2NwQjIwWGtYd01p?=
 =?utf-8?B?MnFpb0IzZ1JyUE9EVlJSalEwZldqZDZ1dk9nQmF0QW9XbUMyTk1CS0EzTUFO?=
 =?utf-8?B?akdxaVFDTythQWo1UURURldVeHVTN3Z6bi9uUVdpRU1ScXhqS1ZuSXVvRUx0?=
 =?utf-8?B?am44NkxLNDV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NklleEdYcjNKRjZXS1hOdEFCNkdHZVp5a21wVEY2TWVndXJiLzg0eWM4TGhk?=
 =?utf-8?B?c05pTFdOTW9NZUptZnE4ak5HaWI2TENGSUkxdGROaEVMcGZackwrR1B3Skht?=
 =?utf-8?B?emRiRlJGZVgzYjBZOElQcmNienBjN21TOFNveUZHOHBuRzF4TDRjcWRLVXg3?=
 =?utf-8?B?VzJaa2JTVmNVOGRQR1lOdi9zcnRxa0RGWXJqNlJFTGl3Sk1JU0xHTXdZank4?=
 =?utf-8?B?Y01ObVlPeTZUMm10Mno1Z2VBVEJTK09TWW5DRUNxNU9aWlJkUThqTmpwdGNB?=
 =?utf-8?B?MXlYcWxCckp5K3BCVU5aWU1VQUxycEtiRGI0cUczVFRNRmhWYXpUc2kzZkIy?=
 =?utf-8?B?eE5Wblh1M2RXa2dtdzM0M2ZtUzU0UU1DYXBBRjJzNnVidDRUOTJiRXB3R1Ju?=
 =?utf-8?B?OFhkbWJVZi93YVBMS0NhYWFPbGl3Uks4SVNmMVlOK2hPVEhsVEhiQXhPUlZT?=
 =?utf-8?B?amtpWmYxbHZjTnozYXAwKysyNW5HVWtGNmxsQXpxZ0JQajV5bmg4MkQ5Y3gz?=
 =?utf-8?B?a2tFMUd0MmNvekNCWERNRjRTeGY0bHd5UHM3QXFzTU1OaEl2ZVloVmVPNUJP?=
 =?utf-8?B?UGFyTHVVMzMzQkpUY1EzRjZjYktTSVczaysyb1BUa3BpOFdLeEZUVDdOQkdp?=
 =?utf-8?B?YkN4N0s3S2JXaUNWTnNlSVFOdDgxSlg3NER5bDd2d1hxR2FwZUFYcFo0ZHU5?=
 =?utf-8?B?bWFhUDFHQXJGekZyRmQwOGJUak1JaHVneHZxK1RrcHZYZ0pueG1tcExrVnlU?=
 =?utf-8?B?RjJUdmNWV0I0eHJ2SkZlcHpnM2p5cWVQQ1o2eHNacFZsOXpHeXNRVklwZFRP?=
 =?utf-8?B?dXhjVUtoTWpMUE5RVVVzSFdJaklPNGNwbzdZeFAzV04yVHVOM3BDSk5GMTJi?=
 =?utf-8?B?YUgzZVRSQUlqaEtZZjVNeFh6NVhyaUlMdUhQK09PTzVUbVdRRzFBeXNUcndK?=
 =?utf-8?B?WVN0MmwzTW55VmpZYmNZOVZTSlJZZTJIMFErRGxTNk1KT3VZM1lFaWFsQmRk?=
 =?utf-8?B?cmsrdGVHV1k0MTl1MTREcFpiQ2JwWW9SK2tocHFzWWovd2cxbGRIQnV4QWk1?=
 =?utf-8?B?b1dualRXUExTeVc5L1lBdGpKdjQ3NFA4cjExYzc5Vi9lTFRzS2kvM2tEdHdW?=
 =?utf-8?B?RVdNZ3R1QWttcC9nb29aSUNDWmJjT2t4YU9aWVdNTWJnWWxlZnFsWm9aWThs?=
 =?utf-8?B?bVFYeC9NYldNalV6ejNIZ0FXYVV2cVJ4TUE0Z25iWDBOZHNKRlBtZnhtWCtG?=
 =?utf-8?B?OU55RDJuN0dxNUVkSVpsNURnbUlwY2k0T2VpV1pvcDFNMW4rS3lwMnFkQnQ3?=
 =?utf-8?B?UnkyTlNVS2YvVlpqMENmL0haR1I2TGlhNXl3eHJhc1JLZkhhZFlSK2xBQ0Vt?=
 =?utf-8?B?S3JkUDQ1clNFUFpkeDhtRm1ZT1hZek16QzVjSkVQSC9namgyaDRqMGY3RXVJ?=
 =?utf-8?B?eHBJNU0vNnFOeFdDVXF6alFqekk4SXVhYU5WeGNWZTVKWHRiT2Qxc2pJQWF2?=
 =?utf-8?B?TjVEc1JmL3d5amg4TjdFaDdYeDRJdkd3dXpXbER4TUl1QTBXNnQ0ekxlN094?=
 =?utf-8?B?b2grWmRUTWlSVGx1YjJhUHBFa2hXeXcvZkpma3QvbWgvNjJrdlFXa0ZjZlRH?=
 =?utf-8?B?L1E4QWxlNng0cTlTK0E2U0hRMWcvRlNlandyY2NTemV2QUtuS282TFJ0U1pB?=
 =?utf-8?B?MHpsS0NudUYrUzlRQ0VDMWdnNVdWNCsyMjQ5Tk5pSnB4OUNCSGZ6ZkF2WnJr?=
 =?utf-8?B?NlVrcmdjaXhENGRjbGFjM0xtRi91VUVicWdGUTBVS3hVaDRKMVdOLzdRMkl4?=
 =?utf-8?B?UTczSjZvd2FOb2txRGZkbzdwL1gra0JkbThqM2pYRFlNbHFndi8zV241UjM4?=
 =?utf-8?B?Vm5PUDd3MTNKdEJhcmlLWjRZZmZMV1lkc2pnUTFudCt4c3ZLcGJWSFVBdHlE?=
 =?utf-8?B?TS9VQ0l1WTVSUmo1aDl2ZDJKaUtIdHBrSGxMKzNuL2pGQ2R3ZW85cXRWaHdh?=
 =?utf-8?B?dnppMzJYODk0M0V5ZWozUTJvTXp4YldGSGh5UzhIQXFFUU5kTlVOUEIvS2ph?=
 =?utf-8?B?VzE1b0NTQnFuY05EdTA4NGxhdFpIckRoYlFHK2JDTHZHeXFlVUs4dGlSUGxs?=
 =?utf-8?B?VGpDY0pvcDdqOThXVUJsdzJJZFNkUHJ1cHFHcGFHcG9kSnptUnF2dHZTNVB3?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	23bFaGQSIloQPxhQ9N2IFP2Rjl3btqCT/0pKVJnIwAAyuY+993CnSzC0HbMdz5/b3TJq4w3V9JF0DRKo3QhGYS6PGu54RwT5aQs1hqm3ml4dq6/XGxcnhwb+qGkJDjbVkVdciMRXp8gZoq4UvigG4bJ9XsmWqdriHyRFUbSds4jXIBfii8jBzPLIEp9kFx/vBcoeKid0nU8tXh0/MrkYFzFnOYq+eL7R+eAM+FxwOMPQ9rBAvBODr+fvvgRwiDjDdbQacQBoy095mS2iS4/q1yJnN2pPdYTmHgvv/tvvFQhgi5wLwhyRWYnS/saKuEMWErvMNCVj3RcoCcRzNzXLA6kCnj3U6EzqLLlC4r7JWCekQC5ebG1zpjrd7ECAnt1Me+joPIZaLpSklvhkVeF/fY1hrLHxEizXiJKn3Gelf3hxvEA1RqtzADVraZN2ldnB8na7DRV6A+Obr14AWqFO0cKrrOV7WTzIQPCx3HUnLDkPtKPd5M8j7czmZ6w2vDSxwTubF1/zrMkO8smVn6xFpeqcsQjSFcukON1IZHLhgUGNVcY2xv+DObApOLYy3dt94vO9Vf8QowlcxntLDziGKL3vBweFLMfdTcX3kWHUmSc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f915cf-7a71-46e7-b768-08ddb275a99b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:47:38.3959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfsrmYCqwfOfFuP64GFFcsyblLr5FpgNPRkxyq4viZdZgxMyVfehn2Hi7qYiN1pG6YLjISOL6HE7hCXx3hR1lFC1uII2p1tukdNRruuajDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB583D803
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506230101
X-Proofpoint-GUID: Vqsog8BYiF-pRAIkcQxAW2_HSHn1Kj7t
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=6859852e b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1XWaLZrsAAAA:8 a=jHuYhmeODrkdDJfulLEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206
X-Proofpoint-ORIG-GUID: Vqsog8BYiF-pRAIkcQxAW2_HSHn1Kj7t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDEwMiBTYWx0ZWRfX4Mg+/4bD7Vp5 SREUv3ulSss47j5n2tCxJMNPdmYU/9pg81W0fGPrpd54QQwmLY9VBm4yNcRxQi3bJk1I+yuI5a6 rugxYveY18X+Bu4DPyaPIu3f9aph1JlA0IAvwyVgArU0ljb6Ud5vOZ1L3pUjBlK4zW/EDItU4hv
 IntPPIBmvkNjPxR5Dz+ycuu/Bt/pVM1MUhZP5wjk1vil0LlxC8LvxrqbzAr36Otho8rXzydzpXX vSGkxhGWeeA89V03lulVrXJ3gsGIPjILUz+xqzP7ODfd8hab0kzcEYMiYn/lSGn4UbLIbYv7Cy9 mOKR+2EtTwolfJD5KK2AZPuTFyYLfJTDETJlgGYeA0SJPeBYIXPvG7VCF1sk4GYOoVGcl6fJ+7D
 uX/1Q+XsuwDY1s6Hk+THzpSBUKNIP1VQZXPBXyyB6CC5sV/kxl4O4hvUxnowvMy56ERU0Iz6

On Mon, Jun 23, 2025 at 12:22:26PM -0400, Liam R. Howlett wrote:
> * Suren Baghdasaryan <surenb@google.com> [250623 11:39]:
> > On Mon, Jun 23, 2025 at 8:00 AM Vlastimil Babka <vbabka@suse.cz> wrote:
> > >
> > > Since the introduction in 9a10064f5625 ("mm: add a field to store names
> > > for private anonymous memory") the code to set anon_name on a vma has
> > > been using madvise_update_vma() to call replace_vma_anon_name(). Since
> >
> > s/replace_vma_anon_name()/replace_anon_vma_name()
> >
> > > the former is called also by a number of other madvise behaviours that
> > > do not set a new anon_name, they have been passing the existing
> > > anon_name of the vma to make replace_vma_anon_name() a no-op.
> > >
> > > This is rather wasteful as it needs anon_vma_name_eq() to determine the
> > > no-op situations, and checks for when replace_vma_anon_name() is allowed
> > > (the vma is anon/shmem) duplicate the checks already done earlier in
> > > madvise_vma_behavior(). It has also lead to commit 942341dcc574 ("mm:
> > > fix use-after-free when anon vma name is used after vma is freed")
> > > adding anon_name refcount get/put operations exactly to the cases that
> > > actually do not change anon_name - just so the replace_vma_anon_name()
> > > can keep safely determining it has nothing to do.
> > >
> > > The recent madvise cleanups made this suboptimal handling very obvious,
> > > but happily also allow for an easy fix. madvise_update_vma() now has the
> > > complete information whether it's been called to set a new anon_name, so
> > > stop passing it the existing vma's name and doing the refcount get/put
> > > in its only caller madvise_vma_behavior().
> > >
> > > In madvise_update_vma() itself, limit calling of replace_anon_vma_name()
> > > only to cases where we are setting a new name, otherwise we know it's a
> > > no-op. We can rely solely on the __MADV_SET_ANON_VMA_NAME behaviour and
> > > can remove the duplicate checks for vma being anon/shmem that were done
> > > already in madvise_vma_behavior().
> > >
> > > The remaining reason to obtain the vma's existing anon_name is to pass
> > > it to vma_modify_flags_name() for the splitting and merging to work
> > > properly. In case of merging, the vma might be freed along with the
> > > anon_name, but madvise_update_vma() will not access it afterwards
> >
> > This is quite subtle. Can we add a comment in the code that anon_name
> > might be freed as a result of vma merge after vma_modify_flags_name()
> > gets called and anon_name should not be accessed afterwards?
>
> Surely that's not the common pattern since the anon vma name is ref
> counted?
>
> And it's probably the case for more than just the anon name?

This is all quite tricky.

I think the key thing is that madvise_set_anon_name() is invoked by
prctl_set_vma() (yuck) which allocates a brand new anon_vma_name.

When we merge, we don't actually set that anon_vma_name to anything, but we
might put (and thereby maybe free) an anon_vma_name that is identical in
terms of the string as part of the merge.

But that'll be the vma->anon_vma_name that gets killed, not anon_vma_name
in madvise_update_vma(), as that hasn't been set yet :)

The problem was when doing so and referencing vma->anon_vma_name, and then
afterwards invoking replace_anon_vma_name().

The VMA being changed might have got deleted as part of a merge, and so
this could then be a dangling pointer.

But the irony is, in that case, there's really no need to call
replace_anon_vma_name() the one thing that actually uses anon_vma_name
after the merge... because trivially anon_vma_name_eq() effectively
comparing vma->anon_vma_name to itself will always be true and thus the
operation will always be a no-op.

Except it'll be a no-op referencing a dangling pointer...

The previous cleanups made this whole thing clearer (see, this all sounds
very claer right? :P) meaning the get/put are just totally unnecessary.

TL;DR - vma->anon_vma_name is _not being used after the merge_ here in any
case.

>
> ...
>
> Thanks,
> Liam
