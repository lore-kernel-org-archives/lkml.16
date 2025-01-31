Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5C11DFF0
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738346042; cv=fail; b=LLrwqKDg0bynlTBQPWy+ADYsSUgrzvrCxdewJc52rEO6IsnpfpsSdzDLpMHMKqVimDsSdNkdN6KKY+jmpX5DmblopdOGv3P1qp7FAUiL0k+1zcdSvke7eONWMpjIn5PPOauHjYNT8KZDPoGKHfnfaxwZuPpqmZrF8km6NjEcemk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738346042; c=relaxed/simple;
	bh=jgTbjMe7otDtvrXgGNLSqEN67bRekHgv94CEFxuoe5M=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RLNks+lWsD+Fw/RPzxBKfyQTxfMwPtwtegq4a2zPl6tC9lWnitAIpSuyJACFwXEAAtZqNTTr2Z0XZESnoSY3ZRjXgtS/g6HAR6gSn9tLPufBBTGiTtRa3wnudqHnU5+FHsR8U5P9Bw35igeityrzFwPKoLuGjqPM530W8tchFO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BmYVeUvR; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cBl41fhi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BmYVeUvR";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cBl41fhi"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VHqR0X020069;
	Fri, 31 Jan 2025 17:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=cGfrRkBD8kjyem0jJe
	GxvRNOcHxEAN0WcnFeT30TWkE=; b=BmYVeUvRbup/evvj9isHBIhOjIhTC2kHuf
	uimxUnWsaZka3Gd5qIZorvf8h1FvogLMK2BlrVLo6tOWRrOjcQ9mELrzSxeuZFN1
	I82oNkaZ/sR/C3K207DnxqcgOWR4xhqrEM7gEv93jlH6ysqWkBLL55WbE31nCxWU
	25mHvoq2nGK9kYEICwZ1vmZmnDRkqkpUwOZM1HC5VxwPPrPYHH+ErvI9iuXlz+oM
	2x9tlKe6j6IXssKVFacAYeZ4yhbl8OZLj6dTcGFPdZr1xMsoSvGIAbf961N9gU9i
	QQeglxD2dGmUx02nwCcQifR3ll7ZmjL0Wsy+gfZ9nK2YEbY73ccg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h1yj874v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 17:53:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VGQsad032210;
	Fri, 31 Jan 2025 17:53:47 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44gf947bre-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 17:53:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1TqE2uaqjhpUK02pPY99GYmXmHiVOj01p42Ll/KifHR9vV1lVsAYT7VwtF+TWdADUKwVrXzN7xyuT6jacLhvZceK2jpuwStx68M1yQZMk7ytot2iSatWicj9HrB92Yl1pAUcWAcg+XhHCt7k/eCKLzo843sVIAIL9QnAw/rD+NriqxYwJ6Rg2gZ9VUJ+HffbSR89hOMK3amcaRA19cX74Me8kgW1rH8JYQ6y1Ake7kMkx3iuL4vw5knXHTYTeOBB0R7EubwGgj/oo1zG4pyxHZlJ52BESrxWty8kgPbaM86Il/MnxhA/pv6UIq3CKfWwQSWV+MXV3kvtL8UpKppDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGfrRkBD8kjyem0jJeGxvRNOcHxEAN0WcnFeT30TWkE=;
 b=VxhaOH4an+mizj3CiHsigOG5NU01cZ0rKTwuWrDq9xWDKUdeCf4VSfO+8cou4kKlx7N484IaQaF4Mp0OmCN28a/pfAEFVHb5lQqhnUOiHsH5rLGqP1/BkEoGA/r+5xNeQ/uh9BdJcTW8bU7BvGCK3s+7n3wGQnDIZkmyPoAOa41W0zq2VMhUnnVkh5OZN9REclBX+VJki987YbjAMizdWHxHijCGxuFnWaMpV9sxX8oTPV+7C4LLGJ8gf3aO3EG8yI/oRibYXW/qY9zhA8G3XaB0tcVvn5dcSL69ErbEjxATYXnRVJYOy2mzHTCf2v2x0fEH1D+DVOOXl6qh2lPCXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGfrRkBD8kjyem0jJeGxvRNOcHxEAN0WcnFeT30TWkE=;
 b=cBl41fhiaTt1hJ4nbRXxXRmaba/DVNRDdertlDuMMAK1toVNMskQ85k5kio2nkly9aEukHRMa/Itj7oJ+FqxHhRGXEj4/CSIonCmqiyXG2roJiT6np8Ti6eL3/pScDgnXPmZm8STxn/YXrlAhKpb/2Pk4ZUXmw8CKgTGSShjDbo=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MN2PR10MB4335.namprd10.prod.outlook.com (2603:10b6:208:19a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 17:53:20 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 17:53:19 +0000
Date: Fri, 31 Jan 2025 17:53:17 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, SeongJae Park <sj@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 0/4] mm/madvise: remove redundant mmap_lock
 operations from process_madvise()
Message-ID: <62651652-0f51-420e-a203-80711424eb20@lucifer.local>
References: <20250117013058.1843-1-sj@kernel.org>
 <yp26taqjxput2k5w6jekhnexbp2isqdksckrv2jjxomxswjh6g@f57mxzd62fyt>
 <a89c68fc-23e0-4cef-b7db-4d118b365e92@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a89c68fc-23e0-4cef-b7db-4d118b365e92@lucifer.local>
X-ClientProxiedBy: LO2P265CA0469.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::25) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MN2PR10MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 82dc223d-482f-46b6-ff79-08dd422025e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZxmByM7IA/VjG34gi6dCCA8q7V2X7JWUSqbJinIV236H1z41j+/VlHN+KLfm?=
 =?us-ascii?Q?EoAWYgl5sM1NBe3rpnpZgocX/sshUXeBN4QpgOuw0/Z9vANg1jsGbwCdCcs+?=
 =?us-ascii?Q?0Q4yLZGtUqEvlmwDKaK8YGuVzKXViYLt6aJPegc0tPCqi5SA2XIJN/VS4RqR?=
 =?us-ascii?Q?NkK+1YTd91nLwXGbmuaPsyYzyeMAgNc1jIh92eaFi3KhpliPilZbRdxJZnyM?=
 =?us-ascii?Q?0AyqbLjKbTyRFIAj7GFJdqjFv8BSU93a+kv5rglG3smJaGqXo4Egcd6ELPwG?=
 =?us-ascii?Q?61xF+Y7/6dcMjuBfScCJsMoxbyCJAgkhl1H3Fqd3mPXjRfBwOhfxAd8ssBEp?=
 =?us-ascii?Q?9iS10TThLmNZaoMDfmC5WGPsDjR56rwa+FmDIR9qFu8dIid9+xpoagASi+aV?=
 =?us-ascii?Q?oo56e+HGVWS20QpdBq1xjre2am4c2mV4i9eBCwRA0YAmsbY+n10mmCqGT9Aq?=
 =?us-ascii?Q?6y0FAmcocPnGFzEgATT/WF4/tFDZ8M6XHbwkllACf8HP3jGuz/f7E8sD+Mvz?=
 =?us-ascii?Q?yvPXd9QKEn226Ywxg+6BMCkUTPkLvi4NfwQyVZYBpZm4yU6+SAhwMCNdhOaA?=
 =?us-ascii?Q?8HyOHhsfSf/lEiyeMvY4Ort+R1yb/eDkLOEHgM8isL/YzIAW7eZMmrjP6ET0?=
 =?us-ascii?Q?sZMtmV4XSSVV9C678lXURMZHSFzat9UaAt01iQeWeawPqOesbWWugB9e0xck?=
 =?us-ascii?Q?fF6RhQfSLXTb5cW25xBx1lAO1r6IoX66Svcxe8h2TC1mMNHuvDRL817LAbwK?=
 =?us-ascii?Q?Asb+fd4uz5mt2d22VXh3qCTpISNQVpmILSnTFuF7t37RJ9Kl4l1B+N++Yz68?=
 =?us-ascii?Q?SmqRMfq73v4z8E0clgOniLzB4Xwh4POKXBxz27jOPxDfXtKGnCcNNQxCQHan?=
 =?us-ascii?Q?+pDmxlKKhIhzVtFkV8mNL0rzRPWJMU2PXhjkPAUMWgk+eC6NtryyCYWDujJt?=
 =?us-ascii?Q?oJzfbP3sUA/Nf1NXKHjYjhu1w0z0AYjJYztyGtZlSasLso2nfFd50D0/WNyG?=
 =?us-ascii?Q?mRnnD1lWlndJa6nnIHI12M78hFdNpY6NUiPBUTDcCqVnG0trzfIu4dQhbHL/?=
 =?us-ascii?Q?j/FMm/e7RUrgTYqznpv0moE3E62ryX6hvB/n5ec+kJgcAk4koZ5eYwiviKGU?=
 =?us-ascii?Q?EGovQ6bJugFcDPdjJ+pbABAaLiRCb4EaZG+cQHwwSnU0/wNKkOoIfbYCfMvn?=
 =?us-ascii?Q?mi8itzrL8Ky8vVRY0oenpWMz6SAe4WlpDTxYzRrrzwhLrXCoMlEdRpY4yI4w?=
 =?us-ascii?Q?/YWc3rEPXlR+JyDlWxa8qoDEFN/V8+7qQFgTpZdyGl1CYup2sIux5vJRVjOU?=
 =?us-ascii?Q?rKtN/6U0kx8YbqzXvU/Fm1YVcGxUWQhibFveebGfmo2YVxlMoBZBJOWKPB9c?=
 =?us-ascii?Q?WS4Y1/KPl1MvNtwv4NWXh2/xO4LK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DPQAE3AjxHvtYaDdOEqMpBnj3HEgychGvCPtTrEQVciiiHAelVIV3b6XY7QV?=
 =?us-ascii?Q?hIKilFwRhJlaTaRMFKZsIdfDNLemKbi859oksGfRjV0RsPu2sZFZXIBZkUqN?=
 =?us-ascii?Q?6DhFcwe69yWrHsI0ZsH1caYl+ErENJfzKzKB4DLugp3eLRUCTz2FPqeAqEAj?=
 =?us-ascii?Q?qXrpwUHA9E278NZVIC+E44tLygeLhLZCaXJ87B+MmNDYhMcSLgy1KCal51qM?=
 =?us-ascii?Q?wrSBk/9NjbCr5ju4+EBHrhmsYD0Rrgl1SVsrTQ31qEK13e9xfvQ8v2/kqRlh?=
 =?us-ascii?Q?1kJz4nR2qazHqv8cLVYe+Yj+tSZbAsUUge2xUHGvucAyMEGtpsnQ/W+IzkuN?=
 =?us-ascii?Q?R+XFPVbRK1VzkKRXAbzs711r6bySD9PToO1Wrc4bTKo6hmgD/wgDZMt0LRj7?=
 =?us-ascii?Q?ce5SSrVBG+ShPodMjVUDKXCKJMK43H5Su5crwvuWusbG358QoK6M176loaWR?=
 =?us-ascii?Q?lbwyTh+tVnsWePMY69UYnHEKf9uLQ2FhAF1Izpj4e3tn4QPv5WR8O8gPrsl+?=
 =?us-ascii?Q?5mlp9VMa9R+gZP5htb74ARdruRdgGn3WDFnaMzwJso8BPNuOFtwpp8uKtEuS?=
 =?us-ascii?Q?jXhSDkVxpyFppmizNuK9VGM0k6T1W3RcLK6x3wHmhQBI+3P4e9CFaW+odoAy?=
 =?us-ascii?Q?SOUXrwgJHwK/eK9u7lkgc12oSo87SjQx4hBzjb+mk2LTzZOHHH6pDW7RF9sq?=
 =?us-ascii?Q?PEz6io8r8eak3rJny2spaRgnwICEYTLnWwLrHid2wSLhoIFy0+EhowaDx09j?=
 =?us-ascii?Q?qBfiHWajkuIZnqG3p2Vwx2U9VrQ8aoDBac9NxfzNdIly0INmGXp/iSQ0sGIE?=
 =?us-ascii?Q?ic0AqMeDP83GAAgEI8qIodtt1YF4R1IEvg3/8sWfkMzUJkAb7QLANXWVUX9n?=
 =?us-ascii?Q?N52rWXbaBMs1KzCnsAgHWi3EkYL8NGR5StyMn+K9SrAMEZdpTHgNHVV04Qkn?=
 =?us-ascii?Q?crxdrJp4O7ucEDqDiSEC2YEBQuLbyp0BXA32TkEUmLTIZenvGd6VkYDQ15/r?=
 =?us-ascii?Q?1ZTSKJGfpD/EQiXZww9/MzwRiZDxKrD0ukpYAIFUrr8Ol53CZCTmF2BF2Jrn?=
 =?us-ascii?Q?EbC8wIH06cN+0QFE5QF+3reoV2Is42CgCDfNhJvlxoeEoXpFnmD8KcwWSCbJ?=
 =?us-ascii?Q?SmyS+pmZtwXB1OsY8c3/JpIy9dDHJ6PNRB5JIIBcbBoW29TQ9CSEmXyWhiV7?=
 =?us-ascii?Q?ANid1XL07eUtNyUUs2Vx8NxeC1wrfCFqmPeqioi7lNj6krXY/kImX6lBaHvV?=
 =?us-ascii?Q?X6utJGFRBSG6TIagZFLXIleEv4jHg8M2kBUVdrO6m6R9igUIp5OIQzbBtiCa?=
 =?us-ascii?Q?suOEeifYDbzRXcN90WxjeAJT7boKlSnamSn/T3o+SD8jmAqeAMubPlNl11yI?=
 =?us-ascii?Q?Wt2mO90ex/a+3DxvO242kAIPW8vbaxlwzw67TB+29w1lL71nen7A26N3ZMxl?=
 =?us-ascii?Q?5BIjc5QW0+KvKLnh8BziTlrOSb4AWyVLu6YhAGLgnaQPTItUcyWVU2vwiwN7?=
 =?us-ascii?Q?2mvhPdudptL7INmhbStUGTkmSI6j1wHV/pVZ/CO000j8D5AICniX7bpD6JUx?=
 =?us-ascii?Q?yNkwliRUTdRJqn/jYoYHtbOtppfja3QE4JzOAjXliF16o0nd7l76TwiFvN4g?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/2PDuMiKPVNCrFRuP5Rs9753SEiHKObUYX08cHlHigfvtAQXjuKh9dGvRdfcMfW9lhM2xPi7F8m/GLSpGS7Njf/ditGUWuCIY9HxFQM7iaQy1OZD/qJuZHN4G46fX/hl9IAh6G6co01GbjOvYAci/zbn/KUIT7HiuLaxmwALJn6pp+Q9lnoJCM6yjFGAEp4QsDi4U//wKE+tcsFu5I8/qbe38gVSwvcTUieE0T2m3iLpwmYLxwYd5OxGLHd1cOlsyQ6JVuoPP//TH9MzaaANkzcDuDUN1I0RkWzJfa7zkDaEObI+ESCLgoEUqe5SxhTaLsHBHoXSf4hyaglgMeuFAVhsH6l801Iaj2rVIUciTb+nxjx/uYjcLGl62ZKioPXKW5BhAigP7NohTCQfHn3cY06GJzHsuxU+V0vGNCf/STehtJEVblvx0B8ubrPAOGQIT5kUQQOraLsWSSV0LEv7+OXWP+OJeYrdjWjGeDV66JwR807aOeAQh8zYdtyTxZrxYRH7zDu3v9b7Gvr+y2lzQAbZOFEoSmAvY+aIAR6tr/rqV6MF16rbIelQFkeWfcFt3tQEMyhcVXMblq6QLGQzGmjg76TG1WOIH4KyV1KxIxU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82dc223d-482f-46b6-ff79-08dd422025e0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 17:53:19.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jrhkeqV5sgIuuLTPHLFmF2lymhRcQzwSZV5FWX9QwbbQuctiB4g38D26yBggY1kXCcRQKLiME7gb2GCPJ+NDtS898UODqnoYhrYmiiZmle4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4335
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=949 adultscore=0 mlxscore=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310136
X-Proofpoint-ORIG-GUID: QtGlLoVzUvnXibb5Q0bTdW6jMvt0I8S1
X-Proofpoint-GUID: QtGlLoVzUvnXibb5Q0bTdW6jMvt0I8S1

On Fri, Jan 31, 2025 at 04:55:05PM +0000, Lorenzo Stoakes wrote:
> On Fri, Jan 31, 2025 at 11:04:51AM -0500, Liam R. Howlett wrote:
> > * SeongJae Park <sj@kernel.org> [250116 20:31]:
> > > process_madvise() calls do_madvise() for each address range.  Then, each
> > > do_madvise() invocation holds and releases same mmap_lock.  Optimize the
> > > redundant lock operations by splitting do_madvise() internal logics
> > > including the mmap_lock operations, and calling the small logics
> > > directly from process_madvise() in a sequence that removes the redundant
> > > locking.
> > >
> > > Changes from RFC v1 (20250111004618.1566-1-sj@kernel.org)
> > > - Split out do_madvise() and use those from vector_madvise(), instead of
> > >   adding a flag to do_madvise() (Liam R. Howlett)
> >
> > I was waiting for a non-RFC to re-examine the series.  It looks like a
> > good clean up.
> >
> > Do you think you'll send out a non-RFC version soon?
>
> This is definitely a great cleanup, there's a problem with patch 3/3, but
> SJ - feel free to un-RFC with the fix I suggested - and then happy to give
> R-b and T-b tags!

Liam's pedantry brought me here ;)

Obviously by 3/3 I mean 4/4 here.

Maybe not obviously. But anyway.

>
> Thanks for doing this!
>
> Cheers, Lorenzo
>
> >
> > >
> > > SeongJae Park (4):
> > >   mm/madvise: split out mmap locking operations for madvise()
> > >   mm/madvise: split out madvise input validity check
> > >   mm/madvise: split out madvise() behavior execution
> > >   mm/madvise: remove redundant mmap_lock operations from
> > >     process_madvise()
> > >
> > >  mm/madvise.c | 150 +++++++++++++++++++++++++++++++++++----------------
> > >  1 file changed, 103 insertions(+), 47 deletions(-)
> > >
> > >
> > > base-commit: b43ba6938d01ad4487028592109d4116a28b7afa
> > > --
> > > 2.39.5
