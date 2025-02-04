Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520042139D1;
	Tue,  4 Feb 2025 14:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680998; cv=fail; b=rPeVNbc7aBzOHJEty23/2C8QcQaKO6pXtnk/Ez+ze/Va5CdTPaVZaZYY2v7zJKSnTM4Uv7r88vvuNb7JystpMo5uX7psk6BqfofbIgn90WLwM4IQvVDK3CIc/aqjcWK5upyet+sahxJekpMMpN48jWc7Ms2MTWpMSg9Dpm+4lu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680998; c=relaxed/simple;
	bh=rfib1wtvHwjdNxC00sbb+CSQSMYQedEiaBNK7ag3u5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uitbjcgZjBqqERNOZ6raGvvI5t6L+K+F3X1qTv59FT1y8lCHzBuMcFdw+8MoezVFE5F/ijh2A4ZPVrPNOlBYm4d15glTvNvtAXsgH60p63CT8RiiJKrbwwaZkkC9iThP9gW1MBFExViLY2HqGcDP3/2JiLwNnQK8duHiaIsHe/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mkboeK2U; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XHnUfkHN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mkboeK2U";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XHnUfkHN"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514DRjFM004142;
	Tue, 4 Feb 2025 14:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=e83uhI6I2ovVzHnmf/g+MAnn5ACbAV8ekE/xuVSfdUc=; b=
	mkboeK2UDarGsSsSixUJn23CRhlfMX0EKFmdwiSkGpLR0ftnOP19X28KikcGEjor
	xohqehuHKvRwhajXbzEHzYdcNnXDg/6qKALIBByNZf5I1phejeDrYKs7Ip3vCW9c
	OJFvzoYl+m29JTu/TLUpP+FdF7BBZbla7tAs2B4JF3BsVrdFk7RdNRggdFtFJ1At
	Q3TTuhxD8EjXCPXD0iVMHzJj+SPNKW74/r5QuoXjYZ0PhwstNhwJQjrMA9bGYr4l
	XQ4CqohI12hIegG9aAFdKDpd7ge9ph8q23d8ySHSkwTl9E08htHDC8bdtw+/Q4Km
	ouqYfUg0YP2izUCbwpbbzQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hfy84w3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 14:55:48 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 514EonYn004913;
	Tue, 4 Feb 2025 14:55:47 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8fp3ag4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 14:55:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuRqsV1uAQtVU4fpq6V+0GpBDiOFJCLggovpXJZqiQ8GQ1JLd0O5aqf2e8p93tHkh1v47Bi8LE5raVQPx/au5XmvbeISrFyjTWpJj4RXvJPqOgia4tRvvEDmh49XQvllxQQiAujb0YqmBU+kaAYq0s8+1kGSxNZJirawu68pnuoqnjwFuwSY4L8N/WnxS/5kRVZ6O3GofgfPygiQSXoqrsbEA3wHFFFUGlOfgGmLctyqJN2a5ZzYOBKzNmubrsuDbc2093ZeApdqqNAAomtE+y3H1aRbsmUBZLN48uj1DbriGL0KSVQgt7kXBDIk1aw3zI1TlUJO4JXePwT/zj6wfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e83uhI6I2ovVzHnmf/g+MAnn5ACbAV8ekE/xuVSfdUc=;
 b=wP2ACyxWeeKFcDApBarw9L7k6b8HFBQKCuVjDE6v42Mls0f2Dxdt28ujGMby6ZUsT21BAIFMqbKsbcw0W/q3A6/9YAoskMdfxDqn7dAUN1o67/YyVguLnQOwzYDbpQ3k3mXaHWja4PjftjGvUwlWMJv0CzfdiszCJJUmt8NHjSxgrwRuVxzB7R/9ueaV7+a0x9Ce87mU2NQIY9o9CY/NQzh80In2GquQPydftvutOJK7UuplShAcJGGaLj06rNohI3SN8QyFmy181aM+6H1czjSQcSfKxuHkqcbx1o30Jg4erdtBohBsFEZIMppiykQyq/ZiHlO3JNgFIgp197u5iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e83uhI6I2ovVzHnmf/g+MAnn5ACbAV8ekE/xuVSfdUc=;
 b=XHnUfkHNs7rDH3ntKktfnEWDp7SHiCGLraybD27wPfHqcb+bdJOsOEMZr0J5UFK79/BWWo2okIgMqHHIB6pCRfdui5iNhk3n8hGqOps3JqEXMQ3S1GBTV4ywj0Hw6gFfmmaNbySpAtDMz/pKgdzYTKx9zTECA4fWHiFIecMhjmw=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by SA1PR10MB5865.namprd10.prod.outlook.com (2603:10b6:806:231::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Tue, 4 Feb
 2025 14:55:43 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 14:55:43 +0000
Date: Tue, 4 Feb 2025 09:55:39 -0500
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
Message-ID: <ymjkf2l2otosunrs3e3mmsj2wr3tvrfmgl4aav5dcpm3gtdulh@dzz4njdwkspc>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAH5fLgj00hRAEBvNc8RR8iBwKQ2okDqmWWQ+kqmNkr9mOjfU0w@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0213.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::8) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|SA1PR10MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc2c4d8-aca4-4ad5-40c2-08dd452bff75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3pqUkZtVkdzNFBhdGwrRUxoQWRkNURxaUpIRnlvMU9yb0lZZlA1Rllrb2pu?=
 =?utf-8?B?bnBROXM3Wk5vMksvTUY4d0VkOG1DTzc2bUFENG5PZ2xYbHVrZXRGWlVkbTBT?=
 =?utf-8?B?NXFVaVhvT0pxS3VsQ29UdTZLZGFlNTBqUGhpOTY5SWxCN1FUNEZmcnlQbDM5?=
 =?utf-8?B?TW1mYmsyMmhnNnFhYWdDOENHMWpQeVpTVmI0WW11ZWxLS2ZZWW43R0FnQ25S?=
 =?utf-8?B?RUFOeW90NkN3ekRPMGNoVEx3OHllWGh1am9QakJnTEw3QTdxZ2FOV3YyMFpS?=
 =?utf-8?B?R1BRbGFPYmVnbDNBMGZGSEwwVzJER0wyMys0T2NYWWNRUXY3bEd0V3FaMjBW?=
 =?utf-8?B?VDEzSXJSenFFTi9uZy9tbFFaaWU5ZWtoSTVYVlNzdDJ0RStIbysvUmsyTjNh?=
 =?utf-8?B?c2R4WXhBTmltTzFoTFBETVBtbHpjTnAvbDRNRk1vNEdybU84Y1E2RXU1Rkpm?=
 =?utf-8?B?OEE3VmRsVmVoa1NOOUxsVjhnQ1oyTkZETlNGS09sTDVhb0REb1VhaXNRTW5C?=
 =?utf-8?B?UHhLMTBzT1VvSWN1OUdBWEpjSGhBenBwbzRMSWw5SitKRjFxekFPQ3c3NHUx?=
 =?utf-8?B?L3MrYVlJN3lpcXF1S3FGVkR4cjhuRFU2YXBxeFczVlNuQVJLWWZhWkxxSVpZ?=
 =?utf-8?B?c2RMdTR2TEtKb1Y1dmZZVUZFelVmN0JrOFZLaWhrY2lYbi9sOFhxUWFVamRs?=
 =?utf-8?B?SW1uTkNnZm55eVBXUDBhN3hVdytOdmpsa25IaUJTVUFtTXBQK1llaWZ3WWND?=
 =?utf-8?B?WU9GVjV1Y0FDV254SEpvaC9vRjBwT0YwNWw3RFREalA5WS9ybmlwNm9MWS91?=
 =?utf-8?B?U1M0WGJMS215YTFKY3NjOXdrSlJ4dmQwaWNiczBUS0dVR0YxV3BEcTYxejVC?=
 =?utf-8?B?bXdpNnZpcHpNV2dFUVJ6dUM1TUM1M2t2NXFzUGk3TU1tODZhVTZSR0pRYjFh?=
 =?utf-8?B?elJkTXFNRnM3Q3VvdzBYWHN2TlQ0bzFTcGFQVzlDMlVTOUtySWw0dzNEN2RK?=
 =?utf-8?B?VjRpaDJCazhDYjVOODZvakc4cnlGeVhiV3BMM3BucCtHNW8xbkgvelFUVWNU?=
 =?utf-8?B?eEpKZWh2bTMzNXM5MXhXWmY4YmE2YllqUzRHQmh4VWVpODA5SW1nZmVETUFR?=
 =?utf-8?B?dWNMUU9OeEtIUitUUGVSMTAxaFM5NExlTDVTTDlCUlpueXZxUUt4cVJac2tV?=
 =?utf-8?B?ZUhBQm9vR0oxVURvbVlITTF5OStrSHpPZnVVRERQMTZKUFpHcEpqd3V1T0Qx?=
 =?utf-8?B?M3hPNy9SeXpTU3c2VFJCaTJPOHNybDFMOG1TZHc1cXFYY2xIcStxUHNDN3JQ?=
 =?utf-8?B?Z1BsQzRBOU9vT3pvdUtUWSs2dHBQV2FiMnV3MnBPNHpmWVg1OGpjNmtYLzdF?=
 =?utf-8?B?ckhsTk1TOExTbDlLZDJNaXdDZHAzWUIvVGNXN3NJMitxL1hnUUN1SkVveWdz?=
 =?utf-8?B?djlRQXFPbXkyTUQrZnBxSlR6M0kzcnN0Q2k3dzh4bHV5WGVCZy9qb3pWdVRZ?=
 =?utf-8?B?N0h6M1NqT1FhNGtLbVVmK3BnTEdwN01GNTQyNU8rZkw5QnNRaTFHRkhMWktr?=
 =?utf-8?B?amZPOG45RGdFYkdxcEtrZ0J6bGYyKzFGYjlpYUgzYzM0eUhRblpIREJURVpX?=
 =?utf-8?B?VlZLV0J3VGdBTldxUzlsM2Qvd1Q4RnBNM0NoNThZTXRsUWJpKzdYMG14NEkx?=
 =?utf-8?B?LzVKUWtSWmlwbzB1L1piOWFLM0Q0dzBuckRaTWNubG9UUVc3bjlKdVJrK0VB?=
 =?utf-8?B?b2JhSHhETTBnMXZ0dHRWVjAxb1VORzZMQWZPRTJKVlRUSTF5MWs1U2kyd1VP?=
 =?utf-8?B?NS85U2pkMVNvZ2h6OFU5WHc1T3RyT3ZqTGRuQmxQM25ydnlaN05mNGZRZWtZ?=
 =?utf-8?Q?UAlG4acCIXE7E?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkFpRnZSMGZKR3Y3MTlhU2dlSmFZS3ppYks4RWV5THNZam1OYVgyYzdiK2c0?=
 =?utf-8?B?MTVVWHBCbG1OSEpzSzY5d09ncVh3L1M0cDBYcnhFUG1GRTFHYXZQUDZ6VVRC?=
 =?utf-8?B?Rk1MQ25YMGdNenVYa2FSMDFxU2k0dkVMVk42MTRvWUtKVlNSUDh3MzgwRUc0?=
 =?utf-8?B?ekMycFBTVVQrUU5PUFIvd3pTNTA0RTJJTGo2UlFiVkQrcmlUREx5Z2t2cWRB?=
 =?utf-8?B?cHZGb2hrSWZXU0diTHdrU3FlUmQ0WUE0dVZjQ3FlTFB2bG9Xck9WSUtpL01t?=
 =?utf-8?B?RTF3T1REV1J5YlJyMlk5OFVVQVJuT3FiT1ZEZmMrc2hwdDNmTkROSFZkY3Fm?=
 =?utf-8?B?MDNPSWx1S2x0K0dVK0Via3FMVEdrMXF5elpoK2M4bFdPdW5pRlJnQ0xrZFBs?=
 =?utf-8?B?YnBaVEp3Z3lZcU9TRTN5Z1dFMitacXU2ZUdWRjQzUW1leGN1c29PMVo4OGF0?=
 =?utf-8?B?WmsyWDdWaW5WQ2pyaDRaSldRQjZDK1FYME5TVjN6dDBWRXhuaVQyQitYc1pz?=
 =?utf-8?B?V0J4ZnJWaHIrRWVYUDJkM01pQ3orb0h6dXBSeE44eFFKa21Kdm5JaXhoL1Yv?=
 =?utf-8?B?TG9pTnRGakFiL3RmbDlFSWlUQWs0Q29QeGZuV09ESmovYWhpdzViNFc5d1hz?=
 =?utf-8?B?R2I5QmMzSndZQkdvQ0FTN2RwR09kbjJmRUlKaWNSTHc1MUkxL0dUM1BCVHpN?=
 =?utf-8?B?NjRGQ3ZiUFY2ZXlXVXJlcUpzNXk4M3E1d0xMRTdBTUM3Y3BDUHdvZnNqSWN6?=
 =?utf-8?B?UENzQ01MdFZ5dWVPSHJ0Q29jbzdrNklLblFKaEcwUFIxNjZPZm5xb0J4SUpa?=
 =?utf-8?B?RXQxNEZnYkczREtscDBTMG1qbjBQMmJtT3V5M2ViK2EyQ25ORVpPUUlBQm04?=
 =?utf-8?B?QThuNldCV0ovd21JNkJOcFE2T2Qyd1d5TmhpQldRVnBOZTZUNm1wM1pIdVVG?=
 =?utf-8?B?L244WlkvV2JUVGs5LytJOUw0RDd4V2dVN3dBQTIzbWZRT3BETGJuZFZreUVH?=
 =?utf-8?B?ZHZaN1RudktOWWhIak9QMUI1SEhIWVBvdm5lWVJ4YXBzQWxyWEhuTWQxaDRx?=
 =?utf-8?B?YlJKU1F2NjFiZ3k1YUJYa3NROWRMMUp1ZDc0SlJqNGVqcnNTUllpUE53R2NV?=
 =?utf-8?B?OEVmRHdQWkpSL2hMWUtXT0l0OWFpakdjdENWZVFuaTJGa05sOEJTSVpxZ3FZ?=
 =?utf-8?B?WHczd25yNEhicVZQVXg0SnB4cnJmbnZoRmRMb0s3ZG9PN2NXUlpTNzVHRTNr?=
 =?utf-8?B?NUdLRUFPdWNORjc1eTcwcTJOVFRqU3poVE1BWldCM1dBYTdlRkJiS0Q3NmRu?=
 =?utf-8?B?bHZCdFFRdlQzUG1BRitWMEgrb2dHRW1aRDlxUG9Mc2Q3UUhKSHJ0NEhWck4x?=
 =?utf-8?B?L3JYZXZWV3JjcE9BL3Q0VnlpS3FSYUdhMzJmSmdlT0xYYkViU0FUa3JOeG51?=
 =?utf-8?B?SnU3cmtWdnFXRXJabTlKTmovVVJyckZ4YnJocXE4SkxLZkxidzkrd1RKYitC?=
 =?utf-8?B?MSt1ekM2cEZCaTRMSEZpbzNyNDVqL2FVcWx0R0prMzZtSmpzQ3luZWtZWlM2?=
 =?utf-8?B?K2pQdXIrVHN4V2dNSEw5QXlESjRnMEV0NDZHTWk2WmJsaFhKRDkyUkQ5bFdS?=
 =?utf-8?B?TUlBUDV1T09hNkR5Q3ZTWmxDVHNILzVLY29HMXVFbktnUlZLUld1TXgybFlV?=
 =?utf-8?B?YjZtVUVmU2FWRU1tbGdySUJGM3NlYjlDb1c3b3NHYVREak90RDRncnlaZTdU?=
 =?utf-8?B?M3k0aXZWVFcyOHQ1Q1hzWithQU9MeTdZV3lTejFjVHUrcTB6MEJKVE0zckRL?=
 =?utf-8?B?VW1pYndLMjJHN3hNNFlpYlpVUlZINndYWlcxcENOMFp5dW1sVEY1N1NFTits?=
 =?utf-8?B?STcxTE9yTmJlMmdHaHBLZTZQMjZmbEhhNForVWFKVEhmeGI1aksxSlFPQmlC?=
 =?utf-8?B?OE90NVU2ZzFxRjRqcUpaalpKRWJpaDlZRHFiUWdwMUV6NHhSNXRpNWpOdjdU?=
 =?utf-8?B?T2tTUEVqMGNsUmN1WithRUZPWG55M1JWa1JCQXdlcjhlWUFxOVU5MjFnZDQ3?=
 =?utf-8?B?ck95dFJZNTJDYmFZTy9QTnRVcGxpSWpnSFNsSUNHRWlidkM4ZER5aG5tMExt?=
 =?utf-8?Q?ukc5J765Kl+oCBBlTn7X9b4SU?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o1SXiv0/DsCe6UWVB52esYVtcB6Ko7lwP+7nln4566hfAYBzUTusyasuX+JSRdn6WBVCEVomRQt+H2ns3EF5n8BRe/UUcSK4joHDz7/FH8jpgk/xhccnIuqGo/b0O675yK0sqxt8GHj3SvjaSfJzDsS4F2NCt8MZXzaTc4LU8pd2JpBEostTKn8dT9RhVvKwTNy+JcqCS2eUh7Dp8zxCHdn6vzqT3gG3yiuxZ+5UiNboAL2eoQ/B/WcnpYDeT5bNV2cgPsk3XOqxu2OK/YWBH0Z5z4+O146FoAN8RIbPs8T62Gil+OKCFXjM+4pHfxcSU4iGoXB/Sga2fUWw7Yt+DBfsoXwIgT+DQIdsjpxtkuR7iHqBjNYy1Mv0HgvwWBrazveuxNoCvouElL+30KwRIZ0Plb2zYqjWeIRKJyAX8v3aMNU29C++LgTGtxmqf3mvvhYHXdHN0lh9/wGmwFyRrb5gVczm+t5HCUPqEXa73UUTDod59pQkrLOf9OderSjtPlawhQ2Qa62Pyqa5JxxgKTuSvbGHCCLqdYUQkG+eTbV+TlPL92Bi2GpT3Veyfs7pq4CCAATrvDz9fXZpVluyZ293NLxhzdD/aCAC17A0BGg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc2c4d8-aca4-4ad5-40c2-08dd452bff75
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 14:55:43.0547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IlA3Ub+exSjW/8QxH8j9rNz7E4tniwOsMNZlihCnrujpiI1LGfoaT/TudtrMKcWYGMSM1L79/romsaPn8XY/4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5865
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_07,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502040116
X-Proofpoint-GUID: FVPFN_A2fBpSFoxyfFFjjG01KmHCa-iM
X-Proofpoint-ORIG-GUID: FVPFN_A2fBpSFoxyfFFjjG01KmHCa-iM

* Alice Ryhl <aliceryhl@google.com> [250204 07:45]:
> On Mon, Feb 3, 2025 at 4:44=E2=80=AFPM Liam R. Howlett <Liam.Howlett@orac=
le.com> wrote:
> >
...

> > >
> > > +impl<'a> MmapReadGuard<'a> {
> > > +    /// Look up a vma at the given address.
> > > +    #[inline]
> > > +    pub fn vma_lookup(&self, vma_addr: usize) -> Option<&virt::VmAre=
aRef> {
> > > +        // SAFETY: We hold a reference to the mm, so the pointer mus=
t be valid. Any value is okay
> > > +        // for `vma_addr`.
> >
> > Is this true?  In C we hold a reference to the mm and the vma can still
> > go away.  We get safety from the locking on the C side.
>=20
> Notice that this function is in the `impl MmapReadGuard` block. This
> implies that you *must* hold the mmap read guard to call this
> function.
>=20
> The safety comment should probably be updated to mention that we hold the=
 guard.

Thanks.

Does it imply you must hold the lock or does it enforce that the lock is
held?


>=20
> > > +        let vma =3D unsafe { bindings::vma_lookup(self.mm.as_raw(), =
vma_addr) };
> > > +
> > > +        if vma.is_null() {
> > > +            None
> > > +        } else {
> > > +            // SAFETY: We just checked that a vma was found, so the =
pointer is valid. Furthermore,
> > > +            // the returned area will borrow from this read lock gua=
rd, so it can only be used
> > > +            // while the mmap read lock is still held.
> >
> > So We have complicated the locking of the vmas with rcu and per-vma
> > locking recently.  We are now able to look up and use a vma under the
> > rcu read lock.  Does this translate to rust model?
> >
> > I believe this is true in recent version of binder as well?
>=20
> Yes. The safety requirements of VmAreaRef is that you must hold the
> mmap read lock *or* the vma read lock while you have a VmAreaRef
> reference. This particular method achieves that requirement by holding
> the mmap read lock. But there is also a Rust lock_vma_under_rcu(), see
> patch 4 for that.

Right, okay.  Thanks.  You can get the reference by only holding the rcu
read lock, but you should hold the vma lock to ensure that the vma
itself (and not just the pointer) is safe to use.

...

>=20
> > > +        // SAFETY: The caller ensures that the invariants are satisf=
ied for the duration of 'a.
> > > +        unsafe { &*vma.cast() }
> > > +    }
> > > +
> > > +    /// Returns a raw pointer to this area.
> > > +    #[inline]
> > > +    pub fn as_ptr(&self) -> *mut bindings::vm_area_struct {
> > > +        self.vma.get()
> > > +    }
> > > +
> > > +    /// Access the underlying `mm_struct`.
> > > +    #[inline]
> > > +    pub fn mm(&self) -> &MmWithUser {
> > > +        // SAFETY: By the type invariants, this `vm_area_struct` is =
valid and we hold the mmap/vma
> > > +        // read lock or stronger. This implies that the underlying m=
m has a non-zero value of
> > > +        // `mm_users`.
> >
> > Again, I'm not sure this statement still holds as it once did?
>=20
> If it's possible to hold the mmap/vma read lock for a vma that is part
> of an mm whose mm_users count has dropped to zero, then it is
> incorrect for us to have this method.

The non-zero statement is fine.  After re-reading it, I think this is
accurate.

Thanks for taking the time to explain things.
Liam
