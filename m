Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551D216380;
	Tue,  4 Feb 2025 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681165; cv=fail; b=Y+QQDRH0FnlWcjHMqQPCMif3EwgMI6VSFUmBqf6s9lGuNVrPCOYZpVmKnCGF19CP9j3QQ95prADL+TZuOZ2BLqr+ef8NTUBhig1oHSkItxQRzAc/tKYObT+XGWSEh1fZr14A1eG4BA1rfWXBLcEXY7onRSe94zmhw44aYrkYj+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681165; c=relaxed/simple;
	bh=ECe4Rsqop5ZAYxjyXYHN9/C28a4gwqJWj7TqhvQIQ0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c+aGAUv2UIUVwBSuBI4zAnXyFQgBzhj5541uFH1CHy3WPGHNbcPv6edBsG6NmP4in2yFq7dL77BRGXHqpN3r0CjU0PENbIvIkmt6oIz2X6C6uzDChhmZJVbXHUryWG4Wt316tjKy8lfR+p0Jx3bThAd8ON3gQ5u+lq3I/3yVuo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BFqdP74P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iOrpLOHo; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BFqdP74P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iOrpLOHo"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514DTu1b022337;
	Tue, 4 Feb 2025 14:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=UjR8ydTxzwFTv57dXidLhlE6/G7NlIqPwfZ7XaBPULY=; b=
	BFqdP74PpCaGJJ3rui6UreP08OGlLZiB2oFt1EQnSsAUR/8CTftPv9a32TikQXSa
	k0M0TVwpaM32pzqVRev7mnb11UhnBpprDNdueg3SC8QdtzLxJc72F4Ibkc7LrKem
	1RIGNhlkZizq9ut9vIgpS1RdEz79Prqi/fdjL2Q2QfYjlsNpLDpBJUkempltHPSu
	6jMZaoSZNaJgAAoJJKl3XEFxhC5b4Jf6+cKgMt3g0iFhy2wHm2DsxcA7S/OwG+av
	biNSO0GVwgpAvAgHySipO5T3mAy9bZ4shOcZFnlaDaN1Jxx8VSsFY8gzTND227SH
	sxuCptfr6xIomyOosdH8zQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44kku4r671-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 14:58:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 514EX90C030691;
	Tue, 4 Feb 2025 14:58:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8dmbja4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 14:58:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWEINGdfRM2VtDud/TMwN/Oi8VTvwKmNgq8a+9xWgGX7Ul1XfMYVsmUSrJiFRVb/hg6DhRjY+RxU/n60rKORa1r3l9cI/b6BvfytctPoDBl7tiWw7HW6BBT9v0KShdDr2phWF7tDTdncpa3Wt3Eq95ZjtKJxQv9fx+I5TlzUNR25dDb7YPn8FCZauJSqFgL3JAjmJ2HfFKix5/OcUZnkppcftLejRdAH9f6iWKiy6c70aDgYmfgwyq9xtFj9sha1EohRDAY98PO4NEbRRSQC8ejMjubMVcLpA58c4/wIHbjH7YxUHVZbVJ3nccp8/YXLMXC+1yiSUwhLxu+Yzox6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UjR8ydTxzwFTv57dXidLhlE6/G7NlIqPwfZ7XaBPULY=;
 b=hXvP3gXB143Dyo7m7JkKUNrt5pbmZpLTFUptrvdlXvPiCa+fHUkLqB05LYQbNSV4gaqeJZJc69dcvHHlFJxjoC5QYHDYmaqwg5kFGvtz6b0cgVJVg+6l6Y2aI38TIoFqro7Cog0mIfDmmznfFuO/4x0nO4e8D+glQ725W0ud8Zj94/121Xwe96NQ+3W30FCbNzXbTSSP8q3yb4mrrPjAfuTTHOAZiXS58KUCP0n3lDWCiQtW7B3thpzKuTUCEwQdQL7xQaRZ0ce5B7VgVfAVQRqOxyP6ySSrtXmYZ7N8l8Yz3t3/EaeMnyImgk1VU9lWkQxORJu7B7pdqPYB7KRJ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UjR8ydTxzwFTv57dXidLhlE6/G7NlIqPwfZ7XaBPULY=;
 b=iOrpLOHorOK7w6NCiVgHuZkLXptThKkaiOBpe9uJ/EJAg/tHTpKFk+nhGlw+EG252gNa1IM40QDKNx2ckcgk8CKLiyYN8S59VQX5sKU9hjlkO8H3z/zCTpR7p88ggIpivmLT5hXtApd7imYew73cbak/oofFO92JGHdireGvE+Y=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA1PR10MB5865.namprd10.prod.outlook.com (2603:10b6:806:231::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Tue, 4 Feb
 2025 14:58:39 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 14:58:39 +0000
Date: Tue, 4 Feb 2025 09:58:35 -0500
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
Message-ID: <gugvzktfdeuafnn3mqd64mds2vydes7ta5ma3bunnhwbqazzp5@szoe7ys5zl2h>
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
 <CAH5fLggtO3rRvTouoRmZzqJFMEjxaZGy+bcK23OPUr3TN6d8xA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAH5fLggtO3rRvTouoRmZzqJFMEjxaZGy+bcK23OPUr3TN6d8xA@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1P288CA0015.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::28)
 To PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA1PR10MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: afd58806-a389-4635-6b75-08dd452c68cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2pHcFQrQVNHRFFacDNWSUZTUXlHOTMxaGFhN3VsckZpUzJPTGkvdENRZHpt?=
 =?utf-8?B?ZllTampTSnRrUVZCRWRPT2ltMm13UUw1L3dQNmxuSXhKenljWXJiVFE5elM3?=
 =?utf-8?B?ekZIbEZtVkRRZ2RqK1Y1Z3FUVHdXUGdnZlUrSnZIMm5IQytUT0JTN2lXcjdB?=
 =?utf-8?B?ckZMQWh2ODNhWFVRQWNvVzNNMDFYUFdZbGlVRjYzRWVwRWtpbU4xeHlTZGZo?=
 =?utf-8?B?MzNqMmxhb3I2UEJaN1dNbERrV1NEV2RYMk1PWEYycE40ZVVrZ0NtTnNsSUdY?=
 =?utf-8?B?NUxnalczRlpoV2dFQXAxaGNKdW9zR0pLSFM0ZmRtcElCL2lOM2doYlR2cjNL?=
 =?utf-8?B?bEU0UHFoNGZrcUR6NHF3TkUvbURsWUs2eUZmMFJrVkkyQXhKM3BoTVZyaTkv?=
 =?utf-8?B?S0xwTElxR1gxNlRNbkdHRHJkcmRkOEpwN2s3eUVBS3U5cmRRUnRlZVlXcHhQ?=
 =?utf-8?B?SVNhLzY2dEFqTExJTjFMNHRPRzE2b0hoekdUa0hSM1ZtaFU3TG1iK08wZytD?=
 =?utf-8?B?Q3c3SDBLVlVZYWdMZEt5NUIxNld6b2lmTWx2TzM5UzgvRkpqbHN0VVFJQXF0?=
 =?utf-8?B?dS9JczJtcXpiTVlqTFZyZHAxZnp3R1dobWJ0dnEyZzdPMzVGUjJybjZpY3RP?=
 =?utf-8?B?SnNhellRc0ViSE1RQWprdEdadEgxaW5GblpDUjNaTktnemUya0ZKTUhTVVh5?=
 =?utf-8?B?dG9LL0FGTFpkelFIeXdSdkJoLzV3V2dUOXBPM3kxaWVHZWViREZDWkJpaHcz?=
 =?utf-8?B?N1BrcjMzL3V6a2xwL2hIT1BCQVphNHduazBQSG4vYnV6ZXZFV2l6MVpua3hU?=
 =?utf-8?B?VktNLzFjNXZEdnJFM1djbVZZOXVoUjBxNEdSMEwwbWlyaVBiYTFPelRub01B?=
 =?utf-8?B?Q3U2RTRsVjE2VkRHL0RtbUhCbmRLVWVhNWFmTXVnbnZIOE5jVjRJL040Qmov?=
 =?utf-8?B?UExyUENXUERoLy9RNWdDd0N4N2xhbFFoVDdJYzBDdE9nMUtqb09EYzk4TmZ2?=
 =?utf-8?B?UXZ2RjE3WE9xNzR3V1RFSGo0WGMxNmxqR1RvdmJ0dEJWR2ora2RHcnM4cnhR?=
 =?utf-8?B?clRDejBEQytJTmk1YzBoMG5JQXkySXZEbTNabXdrcWxlL2poakw3SXh5d1Z1?=
 =?utf-8?B?elA5Q2hVQzNuTDZXWFBMdlQvTGlUMjlTWHJkUWxDNnAreUlyeEJpVUtXNXVX?=
 =?utf-8?B?dS82N1J0MWlJOGQxWEQ2dkxEWVp1UFJBb0x2bUU5blNFeEZ6YysvYTRaanBM?=
 =?utf-8?B?aUt2S3hPV3F4ZnBUcUoxaTVYc2xQNTJKdFhUUm5vUzZpZUxlVW9oYmZrNHRK?=
 =?utf-8?B?N29xNktEeUVIdUM3VkUyZmFBRGtBbG93YVBmSGpPeEt2aGlTL2hJL3c1NHQy?=
 =?utf-8?B?M2dIaUJLYlN4aytqbldRZTBtajdCN3VsRGxybWxKTlN4Zll2UklFT2g1TWJN?=
 =?utf-8?B?anNJbHc2c0NtNldjbHc5MjFLZ1J5bDZWYk00VXpXN2hYRHdBSGNuaUlwV1ll?=
 =?utf-8?B?KzRNRHN6MXV6ZlJiZTFJenhmUitKcERhNG96MUhGMk1hVTFRZnFuT2JqZDhy?=
 =?utf-8?B?a3cxM3U1TDZ2OEU0OGJ4WTJXTEVuVjBZSzh3WnB2RzdmSkFsNm5odG5pUUQ5?=
 =?utf-8?B?VDN3NFM0cTRQSGNKYnlhbnJYZjlTL3J5a0FDZHh3OXU3V3ZBTXVvRTVFVWFn?=
 =?utf-8?B?NVV0ZlEzWFJwMkZXNndSZDZvSWZUaTBqdlQ4UkNIdjBYZFlHRDgzaHJCMDdq?=
 =?utf-8?B?SHFyQkRVVm9jMnYyeWxVYko5cHhUQVlwRStTeXh3aG0wUGwxRm0yVXBCNEJy?=
 =?utf-8?B?Ym1jUnQvUWhzNmZ5cXRrQjBRNVVRN1JuQmM0MEo2UmRLaFN1OU51Q2N1dHBC?=
 =?utf-8?Q?oKpON4sLkHiL8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFdmVzh4Yy9kbHdsZkpTeXVRc2RHclhlY25ZNmd5YnNtSngwNkJMSm5GUXll?=
 =?utf-8?B?QjJHbFRmbk5XQllVVkpUY0Nrc3ovQzduUEZyeUV6bDVxMVAyamRjS2ZkQk5N?=
 =?utf-8?B?KzByOE5pY204andjMCtYQmx5dk44dkcvUnpLUVREeW82eGdLQTdocXZZd2VJ?=
 =?utf-8?B?Y2RiaXdmZzVlMFNLUkJzenNjSG9yOUFTa1Yvb01SeWxFeU1zdVROMWRWc2ZO?=
 =?utf-8?B?UjRKdlFUL1VJS3czYWZXdjBDYmtnVXN4Z2UyUFV5ZkxHQmltaVJsbmxOcjN1?=
 =?utf-8?B?NG1vMy9qckRmUmlMalFOSGdFbmpxaTRLejF5UWRsY0hyditvK0dYQjJuZmVC?=
 =?utf-8?B?a0JrSWE1bkF0aGdnTnp3MUFIMEYrWkw5VTBaa0V3WWlvUGxTdm9mQUxueG9i?=
 =?utf-8?B?RnZ2ek1BZ0lMNW9QNE5FUTl4VkJ3V3Qvc05TcHdNaTh4NzJETVdSQTBjYm5s?=
 =?utf-8?B?M1dLT1J2NzZDRXhNWlZEOHNuMG9HV3ZJN3VvVkhMY1lJcW0zVW9wdzJIL21G?=
 =?utf-8?B?ZWorN0l3QXdLdU1mUXVzL0dQQit6MXBPMG9VZCtuRjZBUko3RC9IanNqVklI?=
 =?utf-8?B?YTJoUG11cHlMNjg3ZzJNK0JIOEZyV1V1NEZ5VzlQT0JZSGtiNVExWVlnUDRx?=
 =?utf-8?B?WVZwc3U5c2RwLzgxK05RV21YQTgzREo2SlFhRVJaTExpK2FManpyNUhkbVQx?=
 =?utf-8?B?Y0FuaTU5Z0RrU1N1TVRRTjdNb01RVFFMNXF0VkNSOW1UeTVVS1BJZzh3em1o?=
 =?utf-8?B?SnB6c1lnUEdZeSt6NXllaU5EQTdXN00zcStsa05JNUJ4TW9vTVZ0eXoxN0lV?=
 =?utf-8?B?UUp5SDhHaUhIZk1kbXZhRmg0T2VKaE1QRU5zSHAwcE95Z0VsUTN3RXZZbGZM?=
 =?utf-8?B?QnBLL1c3cXBrNzNTcGV3Ny9tL1NGbGlTdjFER0htL0QrcjdsVUwwd3dZME40?=
 =?utf-8?B?bTdaYTdmYlBNREtRQlNtUU1mdzZNTFFGSUUva1Ixcmtxb1g0SnhjRFhPSWZN?=
 =?utf-8?B?TmFMZkZmbmpudUFIZ0xQeHVhRW5GODBiSzh5WkY4V01TN1lVMS9Qb2c0QlJJ?=
 =?utf-8?B?V09YRVdBc1E3TmVzenBVNnlyQi81WUxaNzEzaDIyM1VWaExSTU44cFVSTHBR?=
 =?utf-8?B?NWdTbFJzcFc2WXFLcEl6eXVjOENqWkYrY3NnL3JZZyt4bEZFTHVZVk5HYVVI?=
 =?utf-8?B?czFrVnhnSU5ZVkE4NmFmVHFiUXdhY2VVdnNuS3pzdmFvWjYwT090STQyWXQ3?=
 =?utf-8?B?cjJ5aGI1ZExFUEJSR1Vjc2w3em9yc0pweDRYRnFhMEF3RXpNaE9PUHFLL2E0?=
 =?utf-8?B?VzVVaHFxV3dpMWY3TEp2YmUzZWNtc1I2ajJneDEyWDFIcTFIZTJBQXRLcEV2?=
 =?utf-8?B?SXJaczIyTUhRNkd3djhENUQ3c0Jsa0VzVFFmRVNpbkh5NjMzaDJJb1l2SDFE?=
 =?utf-8?B?MVdUdjdCdVBJWVB3aG0zS1pvajNKOEhGVlM0a1V5L05qTkhyaXlIY2NRenJi?=
 =?utf-8?B?V2pzamx1RGRIdzQyNmtRdFNNZUdzdFYveU1TWFROdmtKZWVEdGNXWVNWS1Np?=
 =?utf-8?B?ZnlRVVNIMzdzdzJvUXF4dEN0MnhhZUlXUDQyelBjYk5CM1pjSlVSZUYzM2J5?=
 =?utf-8?B?OVpPY3U1ZTNpM2RSTlljN1ZxMVVaaXBDWUoyWmltai9iWUEyNmVuTVZZaHVE?=
 =?utf-8?B?cTg0RTAvUUZFSTh1SjgwbmU3U3hYM2lRSm9nOG11dUZTWnlPd2xXaStvUmth?=
 =?utf-8?B?cFpOTFc3dUE3SHhCRENqVlhqNGdYZjZtZnk3bGE4RkFxN0M4NzNGeXdNNC83?=
 =?utf-8?B?cFNWaE9HZmRMVGF6aUExNDJsWmNHdVRUeHBJS2tYYkE0UG51V0U5VzRTeC90?=
 =?utf-8?B?TjNqM2VoV3hrMTlCdWN3c0l3eC9IM3lTdldnOXpuRFJDMlZxdlRiLzNmWVJQ?=
 =?utf-8?B?dFM5UFEzNW5KMi9xVnVPU3NkQmxGN1BuUEVXVCtLQXA1R2lrcWtTZGdHeTIx?=
 =?utf-8?B?UndUNEY2WTdkUDY2VTJwTUlHUjJtcnVlSWRPOEE2SGlYdnVnZE9pVTV4TDhq?=
 =?utf-8?B?b0pMQkdnKzVtVDJMOXlhR2c5TDdxR3NwR0lreFRUZCtweFNUdUdsNGpSV3hT?=
 =?utf-8?Q?EeCZw6XHVbuBkko6rJAb1jqvj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZbJK4t4JAwTb2uflaiDWw+9gclRop1I4VI3jNsPFlG71GZnhXqs98ZXyyCqZFqBgFlQWTu8TyuChcXNWc98C8Af3ywj7PpDM/BjyN1i21JT7+wHTby5W2i3x3EXa5atd69a1aSpU3auVDeDzKLiBlsRURjiWnU26YyPfjy1UmEs+bVp/2TTRYqgD+5AYzzAsDLOp0iKfMQce+F/MGoo44do94cQ2H/iQvnnxqLXKTt5aNVoKiX91I5twRmT9kWB+K9mNI1fYCEQuYJz+DGZuQ14qFJxp9D1RSMw5LZMBUs1XZKeHAK2E/QJiPyL8RRemrv0Lbaxo0Wz55LF0kSWFK+P8j0TVsZ/Uy/3/iE8yqo4Qiy5N35s66TfQzGmh8+8PCJvG3qQ/Uq22qg4l1ZlXj9d2WyYMvW4tGXa0k9WmMOu6OA5aj7WLnyxcy8dlfD8QT0XTl9b1yPYDprWm+gixcko8+cI/05vK9ckdCn2tyGJK1sC4flFvgIopXxpx7Z3s/S6xLnI8J+w6mM8Fnba6H8rDD4Mj9P2JF/krX0HaQ68GXmBF998TMuytWz3huVEy2Ka9DragFR92p2zoQwJR6DslaMjKSIsuaknCaPFlrNk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd58806-a389-4635-6b75-08dd452c68cd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 14:58:39.6992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9n3RvbwK3XMumVMF7Dp8ydG6wHTHpbbWmCvScPKuKPyqCUQ6PEPzalrJViKC05eUwv8ME9fjiI5NnF6z00olw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5865
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_07,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502040117
X-Proofpoint-GUID: zmiWr1bQjeX7opWtXbesNeXOSB5tMBaG
X-Proofpoint-ORIG-GUID: zmiWr1bQjeX7opWtXbesNeXOSB5tMBaG

* Alice Ryhl <aliceryhl@google.com> [250204 07:46]:
> On Mon, Feb 3, 2025 at 4:44=E2=80=AFPM Liam R. Howlett <Liam.Howlett@orac=
le.com> wrote:
> >
> > * Alice Ryhl <aliceryhl@google.com> [250203 07:15]:
> >
> > Hi Alice,
> >
> > These comments are probably for my education.  I'm holding back my
> > training on naming and trying to reconcile the snake-case and upper cas=
e
> > camel of the rust language.
> >
> > > This adds a type called VmAreaRef which is used when referencing a vm=
a
> >
> > How did you land on VmAreaRef?  Why not VmaRef?  We mostly use vma for
> > vmas today, not vm_area.  Is it because the header declares it
> > vm_area_struct?  I'd be happier with VmaRef, but I'm guessing this is a
> > direct translation from vm_area_struct?
>=20
> Sorry missed this on my first pass.
>=20
> Yes, it follows the C name. Happy to rename to VmaRef.

I don't want to cause churn on a v13 patch set and I've lived with the
verbose vm_area_struct..

It does cause function declarations to split lines frequently.

It's up to you, I'll accept it whatever way you decide.

Thanks,
Liam
