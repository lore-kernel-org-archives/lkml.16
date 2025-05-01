Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3116420E03C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 09:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746091694; cv=fail; b=s7A/Y8tuRCV+AQqJoI1TkEbBIhHyJKIoVtGUnpp4sERNg50brLG2OmkIMMjfCD+8jnNTBmnWhN7OThioMm/5qKdcvAxvfGvyC2Uwps/nGaCJRD697mpTxwClKaYoY2yE1iUoHOejHaukLyIBv+apJJGYXM2JUwEzwjMh/kWjnoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746091694; c=relaxed/simple;
	bh=ZmA8BVGc6iUvVM3yDhcpTrt6QyINNfHNEptDo08z9SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RYD9wlGQL574ZQ60wQeTnEaeOvBMUDd59GLmaNSTt3NsVpEDCLfLpbrSCYyNtIP8if+zYLeudKJlFDxrXfPKSkwqPB4PcGaYdB9znNq36mgkL2++9p4Qib8e5UVQb0hMjV9goobQHvmVf6hJAngb62mzHmzhPca6ntCFXvIHOPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VhmmI58D; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JcUO81fP; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VhmmI58D";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JcUO81fP"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5418fxIG016708;
	Thu, 1 May 2025 09:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=1LErg1qU9drPbe/gWI
	ev1oC0ICQPxZ8xxAaB40Fff6I=; b=VhmmI58DTFTGDWy9YS/kpeq+x2r2ylckyA
	NoqM2eTnEP24OjdEIbsS6QXI4PEq/sov02d4urdxrv19i/HvHd3Q4mn6fFQJBK+4
	O/IoOptkdNJNQUGN3d66j5nGDEdeLI9MkK4vBXgigpOHEvk835+gicHxqEFAMeUo
	FlNT2diWEwI9ELLpEOVsauwpFIs1audImXcHwROA8zrHQfEzvMCIxFM5D/2kz2Cf
	Wb/3rfbJWt0Db7XohTyC6AZEsbU7JjELkdf2Bbr2mQMHhi4zepFlsr+xBJaIZzss
	6dcs/+RGi5TkGppJXooi5/Ekamg8oCL+hc4C2v2xgJ9Wt7yI037w==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6usjstn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 May 2025 09:27:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5416fxnm023734;
	Thu, 1 May 2025 09:27:53 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013079.outbound.protection.outlook.com [40.93.6.79])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxjm2q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 May 2025 09:27:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKckP7iWzkVqp3ahF7Dw6vo2qWqKQnNx/TkNT078KV9iySh0ZOfqbaTclNkswNTwYX4unUXtqhJ4gwqlwZfJMUDjIYVqjcb528QkDLpSZzdhhN0zb+U1q4HqyAj/Q6up0LyuUnds1Mjt8fuv+5EJVRdT/6Iq2if/I6xW+5a14IDfakGqGjVLfZ1ipM/5k6eJQIbbJQMAb8oGL/ZR6+OjTovf7lik5tH2W/ViJI5+k7lOx16pS+T0s4vSK0DR8q02gWXVn/GJQNKZ3CkZ/iNmduLxDH97uc4jwzzRxvQz3jfh5gAXxjxEy3zgUtVH4uvN2W/eRs+EcWjJMKV6W7IpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LErg1qU9drPbe/gWIev1oC0ICQPxZ8xxAaB40Fff6I=;
 b=s/0GnWAwOtqIpA+Pw3KPArRXLhf+d30yhAajTL0dFdQFcgpHCmUaYfRy6bBsS6433EdZT4xEGMltek4UPianCZVqJsmuI/+qT32/phpdOev5Pa1wOrPwI79Jgntepn4AI7RASd3+cCj4pdlsw3YuHJzK+KVlFNAZcG7KMbMRaVCSpt1bzSs9HxjvjMrUZFDKovWp5W3g0dUdZq5YotFVzJrwuNZKxQxEXNJNe29+0vrGhNcQywudsAZWLzKY7V16dZ8GlYFVOlsagMR9KaaJM2p39P1P/EoYBszVja81797/Dn981UQSJItjfYjuFgK8ltBwOorDdKoaKigTaO5zOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1LErg1qU9drPbe/gWIev1oC0ICQPxZ8xxAaB40Fff6I=;
 b=JcUO81fP1tSj9ZdWHlcbdMol5TaUaEDiuZAmGxd8shzFECMvvDi5emIuVBJKRHh9+NAKo/aldXMUL4JByMKctpz8zB1UAzCZ31sL6PESZhyCr/ZF26QZproO3/KDeCa5N6hHIv88LiIhsLa70J4IEO3hTWZX7uFwuOBaM1YFLnQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DS7PR10MB5214.namprd10.prod.outlook.com (2603:10b6:5:3a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 09:27:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 09:27:50 +0000
Date: Thu, 1 May 2025 10:27:47 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/10] mm/mremap: introduce more mergeable mremap
 via MREMAP_RELOCATE_ANON
Message-ID: <d6d5a67e-efcf-4e23-90c4-4f6e370bde32@lucifer.local>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
 <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
 <20250430004703.63rumj4znewlbc2h@master>
 <8c052822-5365-4178-8e06-ecd4f917cf8a@lucifer.local>
 <20250430154119.a5ljf5t5tutqzim5@master>
 <ae3717ca-42e7-49a6-99f9-73a4c0be70f9@lucifer.local>
 <20250501011845.ktbfgymor4oz5sok@master>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501011845.ktbfgymor4oz5sok@master>
X-ClientProxiedBy: LO4P123CA0185.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DS7PR10MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f856714-741c-435c-7c04-08dd8892716e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cHcOL8YJvI9DQ+O38L9RpAtf09FnWMQ06fz4Kl2+VA0vU1minxAI5NzmLmyB?=
 =?us-ascii?Q?AJMo6Jd+9s22/IDa5wKAgiAgP0ttUlkcFkeeJOs1oq+24/+LyOlHqJRcYusm?=
 =?us-ascii?Q?CU/JTEv+ffQnDZ7dhob0ARGOzPpJuqV42rd8pGVnL3TfalFb834bodCOV+Z8?=
 =?us-ascii?Q?Hb1ytjiOWzq2JlfQOt7Uj68xrISjqt0xojpSNJ5FsvqgfmDgbc+lRPt0DpXc?=
 =?us-ascii?Q?EoaqzZDUPAFgkUVk9iEKMMd/czbRqjUaN8No8UbUxu8LNl0ojlmqz107gtTl?=
 =?us-ascii?Q?MnXm+UP4VbjsnwLg/z6MxnXSRANzeh8Okoi1va3DUALOlL22whwz2vZwSJiz?=
 =?us-ascii?Q?gA7LpopoxgYF9L5SjAg2RVXg6D/ojka/yYObtAfF9zgydj+VE1Ni3TbCQyD1?=
 =?us-ascii?Q?jWaBo7nPVAtPDqDlv6a6FP+uQtGwcC63hewzAqAnmY03UEb1onOUtg1r8dOy?=
 =?us-ascii?Q?pishW4j7SaVmDuXhYDpQzaEc9ut3tXDQ1RimJ6/D+fwZfAyJlvNcTBRqCrzd?=
 =?us-ascii?Q?4Ey0gI25GCwUoiIncdBKntPoQD+J79HQPinpJDue49QCQWh3ugzb3V0KYqe6?=
 =?us-ascii?Q?ZrcRYxP6Jt3G5M/rBnuiymKKVMu5da6FOZNG0uSuCv7raO1y+oKiRTArbbOT?=
 =?us-ascii?Q?1+YvB5Fqg2DG/Fyb1VoUUPmhysbqPmBQy9iNsIpLHZJMGSIBDKsv6J2MMGN+?=
 =?us-ascii?Q?NvwFBByzcfH9tfg5It578pYx151LRFPrIda5MwxqJn9Sk3BmXb0BtDwpTqMq?=
 =?us-ascii?Q?440tVEc087TP8rV729LrhFRMRRh4QI5mKaDzgBIf4zRA8mpQ+zDZ6kA1xqTI?=
 =?us-ascii?Q?cYgkI6besD0qS9ZXijGWbpluPfJxtzYDiQtV7aSoPN+k+Qh4hvut9bgxITwc?=
 =?us-ascii?Q?cmeyLGu8clSQ3zq842MvJaETIkbZepYNiZ4K0j0DtZ6TIuA+6WDtlOLXRwmI?=
 =?us-ascii?Q?WnwAY5+gm37xEuhSodcL8eQ1SY5NKOFWVan4sVKotk5iID3CW0y63FHM5hrF?=
 =?us-ascii?Q?s8QnH69OR/hQLLIB8rDt1EI7gATe8IFvC1X4rIKXa0NXtRDX1B/NLxOnr67O?=
 =?us-ascii?Q?3tuKnqGlItcvOGh/NtkPdeU1EfNAipbvhDTrEpcAQt/rYVkeV6BYpeSgwGJS?=
 =?us-ascii?Q?mOCrV3F/3jRmMpLy/50KwcPbOq5JVhYoesB03bt/Jh7gBmsyadhjlHesf/J4?=
 =?us-ascii?Q?rpxybQn0VhhMXtStl86MyAxOEFeKkIpiQ4q5FKOyh3sRv1cs8IdwncA4YdMQ?=
 =?us-ascii?Q?hR3uX2U6s90s1udtDfrsOScm7Vj9lVOTDTfIxMrXQfaxZy8LD3nMNLFOh5cz?=
 =?us-ascii?Q?pOmgx7BZN9QIVtU1glupOF2pNuXFe20JzAple/8/A9CSxNemPZu3fNhKNzdI?=
 =?us-ascii?Q?5XC2KMtvrjXlxrP5Q57P6nnY92ODiSVPFMdDsw8PzqaaqV7t2twECjK2T4u4?=
 =?us-ascii?Q?MHJuvpPTloU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o6tPgg3rwAY/In7CjT2j6SB3Ye9a/qOu/8+wp3SrHztzFgadjwji73o3AfeQ?=
 =?us-ascii?Q?R4xS7kSIKA/SY81J0CbefaZfSxUG3dZuLrNZoxS2gUGihlsc4oDTZzEY8L4c?=
 =?us-ascii?Q?j1oHQXFZPehaEyz4Jqp+T8wdpd+HPgz32txgBWnNs5Ndi1LDr+F2aWzkWvkA?=
 =?us-ascii?Q?/t9yPSnVGQ0JUoyDtksTtjRhMbNpsqy1s4wrEAJ9mDz2FUF+HMbzXkr5FLWx?=
 =?us-ascii?Q?CI1R1vs7GeWYLKVSaazDXrbajPuEepZyYsXNcstPBhvrLeNlXyOlmf+7mLd4?=
 =?us-ascii?Q?3T65NcUi+iW5fFltt/wZf8Gs3XWBzCsDg4t+vEHHOrww4MkOHz8UZBJLwdND?=
 =?us-ascii?Q?I8aI2IgCsYlkKNYTn8BKGGRgvVrq3LAGL/ykgRChqnVFL1dK5n+L3ShtCvDN?=
 =?us-ascii?Q?TZaDXDFYoAhAQ0rIXr+GQhVBDhHtf2uBpWTJrarewWIbW+YWnsocLdGomJze?=
 =?us-ascii?Q?Kqh0+8wXhovtW+c15VUaOjQk/+BYOPyheWG2w5qJ29o7Xx33T2VKSmUUpdyt?=
 =?us-ascii?Q?s6ZS0Eo/qLFpC15T/NnWRwzHWD/G54Xw27SdkR4S8iDu09ZNSBt8PwRQezjM?=
 =?us-ascii?Q?/Cl7ROeE/Rzi8vhyLkkLe2KpUF4rMNRC86ItfMdijQhk2aYWIPxyqtzMCk7K?=
 =?us-ascii?Q?EanRCWtujjT+MiMoyveLkvrEAiwOFTtMb3BRERRjQq2Zqw0Xb7S6BLUojPec?=
 =?us-ascii?Q?Jc7Je+ZpBbYVYe8CKgxGQwMzVovRbTQZaqG52o9kmOB9N/EjbZaHiPtxlQ4t?=
 =?us-ascii?Q?4WPuRmpyQMvg/VE8p6m9dtAEZPnpf+/X6IJcG/s3gHBJhCQdfVC8x/C0om8n?=
 =?us-ascii?Q?NtT56I+j8/gwgEHkttPw/2rvoL1/b2z6SmMlbx19wi2R0HjVVvdg5PEjRFR+?=
 =?us-ascii?Q?loo6iSbeWNbr7ubxITa4/HmoqAIkEb1dZuyIK26hc057DboHauMZX1fVjx1A?=
 =?us-ascii?Q?KfCdXzAgdTL+nJV8UXtRt41/39ko05SPU67LsE/WDSKQKzsrnSj9cqgp5Q40?=
 =?us-ascii?Q?cVPntMN2DUGn7CoHgECavaDRoISn+tc4jy9iTCvpq+WAsqgWuQ15xDP7gX9J?=
 =?us-ascii?Q?HG6AR/JjQI9+LrkpegDrJlmQfAFDi50xLywPghyH1ciQA2B886gitc3sQLmd?=
 =?us-ascii?Q?nnj3tXjz50v2V0fZ+7/rrnUfyDH+mHMQ+eAqtPwNcpdK+sY36Yz6WHhWc5tE?=
 =?us-ascii?Q?iW6NROnlsaSssB3LuAfvWU+B+Fzb+Pgg4HBOalzeSzHBxk76EgHgIrFrla0/?=
 =?us-ascii?Q?Ei62zmxu3VOspoz1cQDnLbvZfEMao++tb3dxtU5DFhXjhR6CxmFvrzGDFoLo?=
 =?us-ascii?Q?sSNNnTB1Bp1Yl6oyZbbDT1TA67ne09mUsfb43i7BIbljB0g2UORfb7mybBNx?=
 =?us-ascii?Q?Ju1WNgtcg8jyal1UjD+AdhE3ts9mIZx9TNQVpNWKvjyLuiYSYMh5Y2u97Hs5?=
 =?us-ascii?Q?c/9ZS4+jfL1dI0p1BJY1MS2wrcrwX2pU6w6+ysp8dgRhUel1rO2EM3uFlTcl?=
 =?us-ascii?Q?8BrWgPxq3G/mtYp9xvxpMFns0inf0T6asndZP6CqfeZly6CfSTC9j2rGQUYr?=
 =?us-ascii?Q?7sfta+xrjlJOiCMPNrhgJwi+40y0QawkBRK/3ISPbImULerC3tTDxkiECg1X?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6E4SdV9hsSY/X9A/PbbD4JUelwxmSdqbbU9xLmFwIQ93CTnNqzvIz7agOhX413A65Cwlyk5ZmLLunJQ6AY/W3NnRotWisH2dA97gl7v5GJApt6mXJPfi0yPyo2TilQB+kPYqxB4FuS9hl8Z61Y8t5XsK1ycKhb13DsnRf/OLJ3b6E63AdJotzmFo0wz926pJALSQXOl9O5LLy1ElAguEmOg44vEBZ6/CGYa+KrJtivBhN10eQAfBkSKoNpx+Y7dMBTBE45fa3+g3jWXIEkBfvvvANPN7e7m0B5FVsC4bZP9jguD7Fgj0iQ+hUdhnqYpuilSIqsTngovT2h0BhAEv/EgwXflMh/Jdx2HJvLAll/kKU9ZGoRuottutIOEpB6fmGqViaraciF4Gqw3LZDBNLe+oFsBRFX+ttIHLxKfywoc3GThfEGQLE/G9tObJ6GJQfdjt1xat9qc5SkyNjRE46OAVp2t2kMmpPAfse3EMq4c++BFcCVflgK4seMuhPg2glg3RYaMuRv1qZWIpUFmJNGyc+7drMmGmj48S12rGQuASFd3OWiYYk1g65SQPariz5F1f5okJGtxNheBTlpWexgsTsdsDfaOHzhOMfbc3tA0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f856714-741c-435c-7c04-08dd8892716e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 09:27:50.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xol853SWEZZqAnPloyEfntn78/lX5Q5IQlwcW4uezdB7bACfjTo7RYqVEsAX0zLTH1hiVVF6Tdt3XzXkGmqyhkAbRBePHgejwQuuqbfR8Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5214
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505010071
X-Proofpoint-ORIG-GUID: 6dQHLfogRiYSGq74OMWOHRO2qJ9xzjBI
X-Proofpoint-GUID: 6dQHLfogRiYSGq74OMWOHRO2qJ9xzjBI
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=68133e9a b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=DBAdGPRS0jdDmOU32pAA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13130
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA3MCBTYWx0ZWRfX3006Qa2fhVuX DnwAII73YhUfNJ11Odt8n9ed6Tx8r+zD+7mnLYTskt8UDtkv3jroJzt7L/K0D9Srhr/tW23SZOT hbHntzfruaYogSdh6dq36q+35U06l6Jss3B6VGzclNBSln4B30KQNLXqLu32tJ+X4toKqsxRhV1
 PjWqKD6+q779Na1uevIoLwfOltyoas3X3tRMANChScyCof/McH4SYTVDTMp96Qi9pVSYtITvgNz vUVTVfEjDqHuAHAdkKHhVh4UyHF7+nH89S6FxnRt74xG8B4K0/hgJzCcdDbus2E+8OCVLjEV0Hm nnJvtDDloXxBOK22/Bvzh6TkcqzyMxrPwtY3v4egHvnPPOC7gZFaAwApQ70DNxtijKQn1zWMyoI
 MB1MkRo6J64Q7SiQvY4GGfPQuNlfXwmrU3RbseeW4UWKU10Et1SYBSQlMp32b3zHBu0oJRnl

On Thu, May 01, 2025 at 01:18:45AM +0000, Wei Yang wrote:
> On Wed, Apr 30, 2025 at 05:07:40PM +0100, Lorenzo Stoakes wrote:
> >On Wed, Apr 30, 2025 at 03:41:19PM +0000, Wei Yang wrote:
> >> On Wed, Apr 30, 2025 at 02:15:24PM +0100, Lorenzo Stoakes wrote:
> >> >On Wed, Apr 30, 2025 at 12:47:03AM +0000, Wei Yang wrote:
> >> >> On Tue, Apr 22, 2025 at 09:09:20AM +0100, Lorenzo Stoakes wrote:
> >> >> [...]
> >> >> >+bool vma_had_uncowed_children(struct vm_area_struct *vma)
> >> >> >+{
> >> >> >+	struct anon_vma *anon_vma = vma ? vma->anon_vma : NULL;
> >> >> >+	bool ret;
> >> >> >+
> >> >> >+	if (!anon_vma)
> >> >> >+		return false;
> >> >> >+
> >> >> >+	/*
> >> >> >+	 * If we're mmap locked then there's no way for this count to change, as
> >> >> >+	 * any such change would require this lock not be held.
> >> >> >+	 */
> >> >> >+	if (rwsem_is_locked(&vma->vm_mm->mmap_lock))
> >> >> >+		return anon_vma->num_children > 1;
> >> >>
> >> >> Hi, Lorenzo
> >> >>
> >> >> May I have a question here?
> >> >
> >> >Just ask the question.
> >> >
> >>
> >> Thanks.
> >>
> >> My question is the function is expected to return true, if we have forked a
> >> vma from this one, right?
> >>
> >> IMO there are cases when it has one forked child and anon_vma->num_children == 1,
> >> which means folios are not exclusively mapped. But the function would return
> >> false.
> >>
> >> Or maybe I misunderstand the logic here.
> >
> >I mean, it'd be helpful if you delineated which cases these were?
> >
>
> Sorry, I should be more specific.
>
> >Presumably you're thiking of something like:
> >
> >1. Process 1: VMA A is established. num_children == 1 (self-reference is counted).
> >2. Process 2: Process 1 forks, VMA B references A, a->num_children++
> >3. Process 3: Process 2 forks, VMA C is established (maybe you think b->num_children++?)
>
> Maybe this is the key point. Will explain below at ***.
>
> >4. Unmap vma B, oops, a->num_children == 1 but it still has C!
> >
> >But that won't happen, as VMA C will be referencing a->anon_vma, so in reality
> >a->anon_vma->num_children == 3, then after unmap == 2.
> >
>
> The case here could be handled well, I am thinking a little different one.
>
> Here is the case I am thinking about. If my understanding is wrong, please
> correct me.
>
> 	a                  VMA A
> 	+-----------+      +-----------+
> 	|           | ---> |         av| == a
> 	+-----------+      +-----------+
> 	             \
> 	              \
> 	              |\   VMA B
> 	              | \  +-----------+
> 	              |  > |         av| == b
> 	              |    +-----------+
> 	              \
> 	               \   VMA C
> 	                \  +-----------+
> 	                 > |         av| == c
> 	                   +-----------+
>
> 1. Process 1: VMA A is established, num_children == 1
> 2. Process 2: Process 1 forks, a->num_children++ and b->num_children == 0
> 3. Process 3: Process 2 forks, b->num_children++ => b->number_children == 1
>
> If vma_had_uncowed_children(VMA B), we would check b->number_children and
> return false since it is not greater than 1. But we do have a child process 3.
>
> ***
>
> Come back the b->num_children. After re-read your example, I guess this is the
> key point. In anon_vma_fork(), we do anon_vma->parent->num_children++. So when
> fork VMA C, we increase b->num_children instead of a->num_children.
>
> To verify this, I did a quick test in my test cases in
> test_fork_grand_child[1]. I see b->num_children is increased to 1 after C is
> forked. Will reply in that thread and hope that would be helpful to
> communicate the case.
>
> Well, if I am not correct, feel free to correct me :-)

OK so you've expressed this in a very confusing way and the diagram is
wrong but I think I see the point.

Because of anon_vma reuse logic in anon_vma_clone() we might end up in the
situation where num_children (which strictly reports number of anon_vma
objects whose parent pointer points at that anon_vma) does not actually
correctly reflect the fact that there are multiple mappings of a folio.

I think correct approach is to also look at num_active_vmas which accounts
for this, but I think overall we should move these checks to being a 'best
guess' and remove the WARN_ON() around the multiply-mapped folio
logic. It's fine to just back out if we guesstimated wrong.

I'll also add a bunch of tests to assert specific fork scenarios.

>
> [1]: http://lkml.kernel.org/r/20250429090639.784-3-richard.weiyang@gmail.com
>
> >References to the originally faulted-in anon_vma is propagated through the
> >forks.
> >
> >anon_vma logic is tricky, one of many reasons I want to (significantly) rework
> >it.
> >
> >Though sadly there is a lot of _essential_ complexity, I do think we can do
> >better.
> >
>
> --
> Wei Yang
> Help you, Help me
