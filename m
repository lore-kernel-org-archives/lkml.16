Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E027155747;
	Wed,  5 Feb 2025 14:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738766343; cv=fail; b=P0Tks6fI7ZjzLUqSjQDPitCIiIY1Rq3kXcqHSBFqDhHDEIR1hfkKcCyH20HEX19B1USPoet3BAtCj27Ab7MzEVpgxFfnrpHrg/KvPz7b9WWYtM8jh02VEPfcOhujbo4tncFByg0W3HAPty93uzz/KSXohfIhzC6reOc9K4/WfE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738766343; c=relaxed/simple;
	bh=ILVvxnj64HGc7qFPUGvD9VbY0Wa0GvkdPCjlXqjlLWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QlXs+HsY1Km0/ou+qBPtdp4kHTtjPKqxhnGe7ao8xUAbDFhcRm/AWzkh4M7+ckRATTlNL6zxjxD19tkOMs/ZkEGaMLQ24yOQOFbT0xnV0ruxK8f9e5DpgpuUDMSOHrXP84g3A9Am/fRnkCNVrHcnmh4m5EuDbasew2IC3xq7SG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oNQao9qx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KYBnuScU; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oNQao9qx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KYBnuScU"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515DRVp2009923;
	Wed, 5 Feb 2025 14:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=6eCLctPfXbcvAw21jr5HvOYM25ReMVQ+szvsiXgAPx4=; b=
	oNQao9qxKrXwq8YjBI924EFyty+tWGm4OZzXyiK2OwdxPfYnLg1+F67B2OC8RoCw
	aeKQVd28UX/zw+DjPrKZKn7v3QoMbVzV17teSCKfs7m5KMaXrdrCqR2x1IxjqSwu
	9HNMwRPgddbASyFeAm/kJ9Uu3UFMrjnYkrnss7MBpfNOjGhWCI/Fng5FhIy106EY
	pspoAPEK0P06o9yzTlkmgN/rP2lM/+PrCjjRY/qzQSvyF0qUJxwbZBcRWk6RI41j
	LWV+bZJxvlRNQl0oootf/UgNAj9SR2ic0kGxCbU5VyBrXOqNk5PNVodV/Kl9YJwk
	Pgduhb6aXsWY+vAgERjFJA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hhjty7p5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 14:38:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515Crp3b027068;
	Wed, 5 Feb 2025 14:38:22 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fnnfq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 14:38:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lvs/PiPEElc1XObKc+ol20yLkq3j5oCu87vwzzHl79Qh1KseebJaCH5u4Kikfi+rffTzBb4a9N3a9ytcoA/zdMKdHYmiP1CC0xZ1f+uhERBHN20KOuGuqsil89w42Kq1QwmYFHPUd95+Uu25wgajK4O3SrsmaLzTN9iq+NJN1jwYMFj96WpDwf2/gzWMYQa1eTiMlqAq0Gq4edQsRSYV/AgVeGxxWqCIKGCizZiVGceHXQOO7apzuqXRvLoBpTWyYlLVn/J0lCNIu227O7K6hM0eoTO0Ec4aKTNP70mjgH+cw9qj6k+WT/Lf2cnVWEPX9/e329CgLY7CHBbwlT2NgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eCLctPfXbcvAw21jr5HvOYM25ReMVQ+szvsiXgAPx4=;
 b=ja77w/JYM6AA7GxmhN8CPuVA8Te4USMXk8X763BG4LKA4dcXmkKJjJxgd6nxuk1cklPsB++pUwmgOeKuxS6c4Ps01xMekCNqwYUjZVACVpJ7oWYfI9GETSkkQe25kut68ST1HNHmo4yruQMPO2fFeW2RofTciquUrIItlYebOsyEK7KAwGokXHiHvTo35Xsr3dUeYhaZ3J+bLC8yoVs4vqZFICcjLe7SmmBu5XWbIhvxnF44m3hM8B+hCICh2nh9YbbIhohWmceyQrYLHa5rAsSrGF2C9P+svXktyxFvby7VDbyhMP1EUpf0BRYbI5xJ1AGPVytGaxtYaGIXGP0mdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eCLctPfXbcvAw21jr5HvOYM25ReMVQ+szvsiXgAPx4=;
 b=KYBnuScUiKOQXhOupZtjrlPU9fBYQTF8kuB1+3LytPRcVRNI/XQ7cp97dIgrpQp/yYYP5cBsCYcVimEj/kddPax1URXT190t6RM56xawzkE+0bOJoR8oazYDA6kuTXcUt8dMSdVNDyXGEhTbkqiczJYk3FRt79OXBaNeSQvkqHo=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by PH0PR10MB5794.namprd10.prod.outlook.com (2603:10b6:510:f4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 14:37:55 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 14:37:55 +0000
Date: Wed, 5 Feb 2025 09:37:51 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas Hindborg <a.hindborg@kernel.org>,
        Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v13 2/8] mm: rust: add vm_area_struct methods that
 require read access
Message-ID: <ndell4l7fo2pkixo6q5xgdaryuj6wrmnyzthhe42wtumpacak5@oxlrwuwa5e5g>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
References: <20250203-vma-v13-0-2b998268a396@google.com>
 <20250203-vma-v13-2-2b998268a396@google.com>
 <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
 <CAH5fLgj00hRAEBvNc8RR8iBwKQ2okDqmWWQ+kqmNkr9mOjfU0w@mail.gmail.com>
 <ymjkf2l2otosunrs3e3mmsj2wr3tvrfmgl4aav5dcpm3gtdulh@dzz4njdwkspc>
 <CAH5fLggd75BvB6VXPjR=_jxn1u7kOfix2rynvMHU4CeUUDHnVA@mail.gmail.com>
 <ebwiebbxomsjamv2uk6gnpg2uzjpqw25llvcz7njadklfi66nk@ab5uyq4bvwlb>
 <CAH5fLgh2Y0rG5ntpdiK-ycn9eBvrSXekxPsjDaYWuHBDUYNppw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAH5fLgh2Y0rG5ntpdiK-ycn9eBvrSXekxPsjDaYWuHBDUYNppw@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1P288CA0004.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::17)
 To PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|PH0PR10MB5794:EE_
X-MS-Office365-Filtering-Correlation-Id: bf472ec5-e208-485d-9ddc-08dd45f2adcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFhVREMyNHBTd25FRm9kUm5XSDh2dGd6dlRZTXhJRGJsYWdCeHA0ZXJINlVP?=
 =?utf-8?B?RElNYnN1czJmZGJCU2JTSHZVazVQeFF6TGUrRUlubUdUeko0UTBnRTZZb1NV?=
 =?utf-8?B?V09UQWN1NGRFVUZOZTBuTTdQVXQ1a1d6QTdCTEQyUGgrOUlRNXI2RzdnekF0?=
 =?utf-8?B?Y214Z0NkM1pqdXpuQk84ZHFvekZydkZVbVhJNVU2Nm5tUGhnNG5mRWcyVnI4?=
 =?utf-8?B?WkZJVi9xZzR0bkRXbmtzVFNyaDFOZUZ2NWJDbGpvSTlOWVVWSTZTd2QveG5D?=
 =?utf-8?B?Y1NuWFYzUW5ZRmFsNkFVaUVaSmlqRnRkSzJFU0VjM01uUnRxS3RxRDVKVmtw?=
 =?utf-8?B?Mlh6RGQvWjFjOG9OQnZBZWJ1V1BSWDd6YzlwWldjbkNGRmo2aGRlK29JL3dl?=
 =?utf-8?B?NVN0MVNJOWRhUU1jY2JTTEt6a2tmNVVDNmgvdWNwb1ZuaFhyUUtPK1B0cll0?=
 =?utf-8?B?d3RiYkF1UVlHV3A0OFRyOE1vdUYyUzdseHFPYTgyK0UwZzJkNFJ3RkVRSTZP?=
 =?utf-8?B?ckcvRlNkTlM0elRxNE9MNlkwelBzRHBBMzRtQVBZNHloUDluK0FEL0UrTEQw?=
 =?utf-8?B?dTk5Nm5RaXRRL1dxUkdiVGJ1TkFQbkJkOFVCTDlZQ1dSdGhUeEFIS3BFL1Y2?=
 =?utf-8?B?bjJ5SjgrN0taeHpEeldyRGQwaFBRcWJZQU5uaW5Ec3JQTGZzSno5d0tweGxl?=
 =?utf-8?B?NndESnQrbTYwTFd6bWh6bkxFaHZhQ255S2lJTlkzVklUSnRpQUF1ejVMQ21T?=
 =?utf-8?B?OHdjeEJtOGVSMWJvSVgycFFINHYrU0tkTitZa2JDT2QvbGhIVDcyZ0pxWmZz?=
 =?utf-8?B?Uy83ZmtuRTlUemVxUmE3Y3lxVHJYTnZuUEdocVNlTGpJdmtmT3pJVzNRSWZ4?=
 =?utf-8?B?TmlmTGJRcUFBalB0T1JlOHZPenpGbFlZczhIeU9ITEdKL2psQ3NKYW53K1ds?=
 =?utf-8?B?bzZBSmJEMHpDemIzZXhqZDcxM0JkOUo0VnNIVFNGTnlDb0xaUmpFdHZwOUtx?=
 =?utf-8?B?MTU4OFU4MG1oclJOUkpBdmFDaDlDY1JiVkFYVVpyaW1nMDFsYXZzOHg1QjIy?=
 =?utf-8?B?Q096cXl6Wkl6ZTd0RXhBYlFhWEhpbTNmaG80UFJkMTFERGFHdG9Uc0hMTVBL?=
 =?utf-8?B?TENQTG1DREFReFNrUHZ3ak5GTUFTMWdiNzRRUXQ3Z2Q3MU5sT3JMUVRTRGpw?=
 =?utf-8?B?L2lqS014VDB3eEM5RTNhRDU2YWo1d29rbWU5eWYvTWh3eWtnMFo4aDU0UjB3?=
 =?utf-8?B?c2NvekpJdFVCUGtIVy9TN0dUQVlLbXhUSDQ1c05kblJiMEdIOFhFaTUyY0l2?=
 =?utf-8?B?ZVFLSUJsT20vNUd2T3FNRHpvQTM4MGJrRjZGUHA4K1dIais3eWFQRUxuUXpB?=
 =?utf-8?B?bzBTZGZyT1BGV0hOUlN2ajhYSGhndGNhcFFnN3ZBM0tDSzdvN3czczNlc0ZJ?=
 =?utf-8?B?TjNlemFzREY2MWVxU1ZOYTVOSWJjNzY2WlE2YTI3N0Z6K2h6c2w1STd6c3hx?=
 =?utf-8?B?S05nL2luRUI4N3RXUlFubW4wemtUZWdyRnJPNVY4MGk0d1h6OG9sQUxEeksx?=
 =?utf-8?B?alVVYVNtNWcxTHBvSDRrNWNEUzA2UVhHeFRPa1BuREE5NE0xZHhYYXBCcmZ6?=
 =?utf-8?B?UEZZdTZYWTk5eDloUEtBcWNYdlRmc2F3U2FLSnNwRVhib0NRTHc2aGNlcGlC?=
 =?utf-8?B?dW9oUGNxcEtCRlNIMzJhaFBzbytpWTF0UHBCcDcwYThXcEZJVzUxeEpybXpn?=
 =?utf-8?B?VHFOenE4Y25MbUtzNmN0cko5ZlNSNEM0YW1FZk1qWS91UzhEK0o4N1dUUjMx?=
 =?utf-8?B?YlZFdFF4MThYRmtxZFZNYzQwaUwzOGxmN2FVVzZ1Z0F6Qk9keTRFTG42dDd2?=
 =?utf-8?Q?kTTv9fusDN2ja?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3lHRjlHMnlpZjZGUGM3U3k2VHcvWWV0T1NJWm54OUFxZE1rY0NEbVM3ekJl?=
 =?utf-8?B?WFBpL2h0MXJpYmZ3azhvdi9Cc21NbDcxNkJOM3gwRVhNeVloQTIzbUMwcnNI?=
 =?utf-8?B?N05BMVFWU1BtMTRDUkhtWnJmdzJoNzlVSWVDQXlEcEpON3lJUHpqNUErb29K?=
 =?utf-8?B?cVErdDdldjIrMngyTzdMeWJHMEdKMkJnVGU3R0srNkpUeWdsZjFGMkEzelVU?=
 =?utf-8?B?a3k0UmZuK1p3RytFWitMSDczdjV3NGFBSVdFRDJQdi9sb1gwNmo2Ny9pZHBl?=
 =?utf-8?B?ZUxiNW5HTHd0OE5rZTQzTktZYUd1a0xnN2tRdSs1TGtPaEJOdzJ3STRGRWdP?=
 =?utf-8?B?MmgrVDBxeFF0K0FnNkt1YWoreTY1V2VNMEFqYlAxV25idU5nUCtNOWxCRFlF?=
 =?utf-8?B?RzZJa3VWay9pYUlpYzQvWGREQXBoZW1tYlpkTVpkNTJPa1k5TmE2N2ZmUmVk?=
 =?utf-8?B?alJxb1FrWDZRUVBHVlNpZm9wZnA1ZlliU3A5Mm9MRDlEVWZJYmg0Z1VzQStx?=
 =?utf-8?B?bnBVOFA0TWxxUWVnMStrZlkzdzFoWlVXMURETGpQOUtzR2N6bW1LSEJQc3hx?=
 =?utf-8?B?WVVTdjZlM0hEUVRzbHBhRmt0M3VkVDFLcGw4c21kNjNrK1ZSbU9OTW9XUkF5?=
 =?utf-8?B?QnhBME5pWmNYcGo5OEZaZ0JuSjJhTjJTT3p1STBsVGpQSlFtQXlOangrMnFR?=
 =?utf-8?B?Z3BwdTVzcDQwTERlUGVpQzRrR3RWZHhmcWdldFlRMUU2d1FYM2VqOHJRTkQ4?=
 =?utf-8?B?eEhXeWVCMHJJbUc4NnRZSlhaaTZ2MVdZNFA0b3RqWWVUbWJZL2J2ajBENm42?=
 =?utf-8?B?d25FZUNNMkRZVC9abDhLRFFZMWFFL284cUNablpocUY4NThvQ1B0d2ovTEVm?=
 =?utf-8?B?aCtiVWJtTUhobkxlNmJJNWdnZ0VhVy9QZ3M1dlRRaHVWVzh2azlUaDBFZlFr?=
 =?utf-8?B?bUN4L2dPNkN3WWxKVkdKWTZHbk5uV250Z0JnTUJGZTFkM0UycmtOVFdQOHlZ?=
 =?utf-8?B?cVR0aE5LSml3RWxzaEZGZ2tnYWMrMHVFbXlmV0hBLzRWZExTaFNLZ3FWTU5I?=
 =?utf-8?B?ZXI4K3UxdmdnRnRzUDRCdjJuWG9RY3B6R2ZJWGtRWHozeWVKeWZlNGFZRTJX?=
 =?utf-8?B?NUtGTHpuSkZZWVJOK2VTUjYzSlU1VndTMzNGeDRGNXJNWXlWSmdJbDhQbUky?=
 =?utf-8?B?aVRnYUdkbFlzMUZaZHZKaWlGN0xyc0x2aEwrb0wvNk9MWGg5K1lSQ20zTmMw?=
 =?utf-8?B?TlAxc0Vqd0dlTU8ybGNpalVySSszWis3ZzE1RFY4NG9XOXg1dGFTMEg5UDJi?=
 =?utf-8?B?TjdmWGFRTkwzNjhHUjNIdUdBaEpBeThoRW5jZGp3bFlYNml3Ny9wNG94NWE3?=
 =?utf-8?B?WHpEZE05WDlZUzhZNTNNNzRteDZrUmUvRTJUNkpRUVM2VGZKT2dKdnJwR3RB?=
 =?utf-8?B?TjdxNHMyWkpobEY3dk90eFNQeWlVNFFRa0JnNlhXaFJKSVNVTFV5Mzc1OEMz?=
 =?utf-8?B?b3B0cE9RZ2Q3R3RWV0lKaGtKYlBxTEllQi9qM2ZXWkJhWDNuS2E0Y1VZdVVR?=
 =?utf-8?B?Zlp2UlpwLzZhOUx3ZytFblcrQXYxOXFkVHg2dmZYcjZjb1Y0eUZTcm12ejd1?=
 =?utf-8?B?VmNpVTFBQkpnV0Q3bSs4QjN3aDBEa3JrRlBwbTBpemR4a0Z3S1k0b21yU2c4?=
 =?utf-8?B?dklYRmhCZFdxbGw2a1RscGZ4U1ZEYWc4NE1xb25FL25mTWJ1RWxyQlNraDJy?=
 =?utf-8?B?bllxRzN6eHlHWDEvejhlTk44WjdDYkJSMWhId0FKQW9QMnYrYThMdjd5SjR0?=
 =?utf-8?B?WmxUVFNnMCtjZzh0ckNPRjgvRUFSQjlpTkVLVlozb1pRYnhNc1VNSU11eGRi?=
 =?utf-8?B?aTEvMnZiaXE1c2lUdldKVkJjR0thblNRZlhMVzdNVFdEMzB3eFBnMXEzOWdV?=
 =?utf-8?B?NlpLZThTRkloOWxZSTYrWUtXWGhqejQzOGFqWTNET003SGhmRWlBRE5YT1A4?=
 =?utf-8?B?U0dFUGZzaTJ4azlKMFdKbVFFWFRZMkRxWGc2bmlhbTEwVlJYUCtPSlk5K2J0?=
 =?utf-8?B?bWo0Skd0dFY2RktGZVZBY2NTS21RTlgyZTNsSWo0ZkxSZHp6N29PTWRlYlYv?=
 =?utf-8?Q?ROvq3Ps1W2TxGXP4xPFPPAgSq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Ja6nNMb4DP4+E0o6fgTiUjyWOK3DwqeBMLQ0Wmw75y4+t6CJFJQmKEvAPnSH9M4zCLaW08kq7s2ZoZ9cS3osiQR7sArJsJPhmD1JTPlwbtSev2U9Uab36/eH3a4crvh/djVV/BaF9tglydbCHD8/M5zJT3yHiDHV3x2F9xDV3p/HMY8o+Em6jthCSSS8WsIjvKEsigf8mFRPsmJfmNpntESwALPM/vaJY5plcy/8Q+Nt5e6gXFuvzbAY5XABIkjBc6Xjfyze2D6n9bBXIfyKd1978pxtrSiIiG/AE8paI8WrAUiYJF1wPhFxYeZYnz3PlLvfb4yhvz63vTZ4IWheeLNjouNTHDWGo1BYPCLDVdxMITE9hkDlS5bgzQaSe6Qn9ivX7th0OvYWL2YeeP9vvEeYRzhxjOn7MmM+ljk10mi47i02i458XuGo74MEc4BZy1Bp2qNOPd1DcUcHi06Sxn6ndy3/dBnjRkE3m9I3UfHXfLpaQgczYY0rxvhpqzH0dM6sKD41iqwO6jf7ZW+YBVzy7L1G12QRlik0s54jLYhcBz/JB/PKx+EMmoZMjGl/UMIz+x9ZBvlzh6AGoffDz5J0Dbs8TpM9kHCrMPhplds=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf472ec5-e208-485d-9ddc-08dd45f2adcb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 14:37:55.8556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLAA+PaU+la3zSb98RWJRvDwksgtrOEA6RmWH7nMqaFJDlsOB4Up4PhNod4CWPb1sP49GTsAZMsypI3xu1OyQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5794
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=776 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502050115
X-Proofpoint-GUID: kXlqn8CgchrsalP9K7D3shV_1Xp0pIVf
X-Proofpoint-ORIG-GUID: kXlqn8CgchrsalP9K7D3shV_1Xp0pIVf

* Alice Ryhl <aliceryhl@google.com> [250205 07:10]:
> On Tue, Feb 4, 2025 at 4:46=E2=80=AFPM Liam R. Howlett <Liam.Howlett@orac=
le.com> wrote:
> > > > > > > +        let vma =3D unsafe { bindings::vma_lookup(self.mm.as=
_raw(), vma_addr) };
> > > > > > > +
> > > > > > > +        if vma.is_null() {
> > > > > > > +            None
> > > > > > > +        } else {
> > > > > > > +            // SAFETY: We just checked that a vma was found,=
 so the pointer is valid. Furthermore,
> > > > > > > +            // the returned area will borrow from this read =
lock guard, so it can only be used
> > > > > > > +            // while the mmap read lock is still held.
> > > > > >
> > > > > > So We have complicated the locking of the vmas with rcu and per=
-vma
> > > > > > locking recently.  We are now able to look up and use a vma und=
er the
> > > > > > rcu read lock.  Does this translate to rust model?
> > > > > >
> > > > > > I believe this is true in recent version of binder as well?
> > > > >
> > > > > Yes. The safety requirements of VmAreaRef is that you must hold t=
he
> > > > > mmap read lock *or* the vma read lock while you have a VmAreaRef
> > > > > reference. This particular method achieves that requirement by ho=
lding
> > > > > the mmap read lock. But there is also a Rust lock_vma_under_rcu()=
, see
> > > > > patch 4 for that.
> > > >
> > > > Right, okay.  Thanks.  You can get the reference by only holding th=
e rcu
> > > > read lock, but you should hold the vma lock to ensure that the vma
> > > > itself (and not just the pointer) is safe to use.
> > >
> > > Hmm... To modify the vma, you must hold the mmap *and* vma write lock=
,
> > > so holding the mmap read lock prevents mutations?
> >
> > Sorry, I think I confused things with my answer.  Your code is fine.
> > The phrasing of the "only be used while the mmap read lock is still
> > held" made me wonder about further clarification on the locking here
> > (because the locking is confusing).
> >
> > Yes, mmap read lock means there are no writers that can modify the vma.
> > Essentially, you are using the lock to ensure the entire vma space isn'=
t
> > changed during your operation - which is heavier than just locking one
> > vma.
>=20
> I could extend the safety comment like this:
>=20
> SAFETY: We just checked that a vma was found, so the pointer is valid.
> Furthermore, the returned area will borrow from this read lock guard,
> so it can only be used while the mmap read lock is still held. This
> ensures that there are no writers because writers must hold both the
> mmap and vma write lock.

How about just changing the last part to:

Furthermore, the returned vma is still under the protection of the read
lock guard and can be used while the mmap read lock is still held.

Thanks,
Liam
