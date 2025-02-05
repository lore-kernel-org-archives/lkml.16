Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40CE19884C;
	Wed,  5 Feb 2025 19:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782635; cv=fail; b=G2gOGu35/JJFXsKVVViY0UW/HNOzt3KqHiEVJKAX7vdEdEHKLA3TJkNGzIzelKNdwvETLLNx4s1+U7Gm43Cm5n5EbUlhHeXgGgaevBGlDIim462wni8zBG0u7Kb+yCOJ40cwEBl1CruSkxWH4dxVk5fLSU4ZbeklrERAdY0KnX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782635; c=relaxed/simple;
	bh=UFKlLRfkuJjN+XSfhfrkh5l1LQVJdBlYVH3G/nb+GpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Io79jMzLKoIcNVJ8YNiJASSykREEg9UdFiiCegM8TauzpfUv5Rp82cYDQyqKdnUGeci5ExWSPkivIXQ21AUKYsNf3Yfrn4nN0T9+BQYVrrKyb0eCNa6yuBg8BpK65PtD+jTUEYBWQfbtcFtDUzqjBGNr3rwOhqJDrMT1w9ojMKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OkJ8xXh8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PF6STErt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OkJ8xXh8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PF6STErt"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515Gfme4005740;
	Wed, 5 Feb 2025 19:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=MIEE+kfFKXgAveuP2WVcV337terwbgqrGIPQQHseBcE=; b=
	OkJ8xXh8fwLALypdoGfdsGK+eLhfBIgRCJe4MulWFR6wFiRew+JTwknID4Bq0ccz
	9t+uumpezYmOzTW+Npao/hUKxjMRIrT0DLzBmpMPnxZCu24i5/4Gtoe5i9aYeOoc
	eTd0uvOifkZ7gkl/bBEJkuJMeok3vfP3hHpqXBFHavDQQQZRgMn8dZjJlxlKyX++
	EPdfKH/7zNxJLKfl22AS0i/Nx7rolZozDaniTfh0MAzgs4WW6yhHxKcI2aoLq0xI
	nzwhaZgBWDbXCy5UXU2CnWSGEF5031osKPzyTEoTeWE7OJUJP0xyAaNQRGKKtNtw
	1j2Pak3TK0ByAYH5rGoqQA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44m58ch714-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 19:09:59 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515I9aeq023600;
	Wed, 5 Feb 2025 19:09:58 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8gjr5sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 19:09:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRd3c/KSwiJMC6QEEOXzGdH0O14TfQxqkdKzXz8cBjJTfgvbKqoswWMour7CT/otYgC51SH4Y7ScvQfmoEWe9vYOceIJqoz5TSseyuGiIxppNMMEYdvIEq6NOyugMLz0JNI1RCyk9t1MDNghtqSHC1XKTsYHIEuJelAJUv+4ycx+rfo/7c8XnlO61QzSLekldnGHSx0auWPFCi431CCveFmktMsXp9I457pmQHDclXDB/1IAupGuqynFGDDzevmxVox+U7I4viM7G/kUL4gni73Dhw0lLbGNwHm5Appvk6/UZIu/8y08VqoeVJ7w2nP1Ib+ezhq9DjsGUUix0kEjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIEE+kfFKXgAveuP2WVcV337terwbgqrGIPQQHseBcE=;
 b=io0FCGwFihdHGTDDxHI7V2wSWEKfmlVXTC7kaBViTB7phQGe/A8srkbtMSwTlMya+Xha/AMkoXPfefhVOzZQD4Ez5Q1VhIqn/IJPWVivFqGCtzaq1+yApySmT+9ujzQ/QmH/9Zn7PlfenF4WHnUKXpMNWFCabFAh1RJLXdRICj1o7QL2lAJHikMoe6xvjOuRTptNNaYphAtKQrcYymSjMjrqZOk1gYlpsVBZDep6w5gOXEEQjQyFcoEWkzhvd+qHe1oOVFNo5ZRlcYvfa+VgOMHRr2a8lsjw5s7fCgv9Oy33nkbGuChNQvHf5H/dzPEAnHwgr5oBV3814nyaO8c/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIEE+kfFKXgAveuP2WVcV337terwbgqrGIPQQHseBcE=;
 b=PF6STErtloBs4wmS/T7mhrca/JUczYD+Z0omG4rROoy8Xyo28uhmnQwuhYUNrFA8kR9jt5JMpNH0r2MgYmK28l9Zlp1rIH01UkP5Gc1b0UOGx3/f3waDPb4qOJbEifGGnGFkH6DIgQRld19Eugxo9CFMQ7fhUW++Z9lcqBfJnJE=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by BL3PR10MB6019.namprd10.prod.outlook.com (2603:10b6:208:3b2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 19:09:56 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 19:09:55 +0000
Date: Wed, 5 Feb 2025 14:09:52 -0500
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
Message-ID: <cpntwmq7ctikl7hh2p7bqzj4mikcletjob57ynx4jhzo3anxmp@mdp74mdbrsph>
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
 <ndell4l7fo2pkixo6q5xgdaryuj6wrmnyzthhe42wtumpacak5@oxlrwuwa5e5g>
 <CAH5fLggzX2fZe7zdPXibosYAn3752XeoxXhcbSrAYpw99sdj9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAH5fLggzX2fZe7zdPXibosYAn3752XeoxXhcbSrAYpw99sdj9w@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::12) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|BL3PR10MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d177a95-4fa0-4b15-7811-08dd4618ad50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHdScSt2VVdFK003RVBMdExBSUNGbGM2UnNBY1hJeEN2L1JpbGxlaGFBRmhT?=
 =?utf-8?B?SDVaNyt0c3BkRFZFY2FXZUwvRm1MSmpneTNtcENrV1poc2lOZ3NGTmwzTGFq?=
 =?utf-8?B?a2paZmZEMXpTUVRab0pkOFNhcytVZ1JzMVJZUFJGRGx6dlRyL1BFRWV5bXFm?=
 =?utf-8?B?aVBuM2JpOWEvZm5zM3BBOVY0WUpVOEN1OEhkQlhpZ0FZMUhGTWhIb0VJUHZY?=
 =?utf-8?B?QlhwWVFMYUdwV29BdHZjQ0N6bGNkUTV3M1hqRVdtODZtYlY5YThLTzJNNGJW?=
 =?utf-8?B?NzFrT3cvK01IOXpiY1YyMnpPR2F1bXZUblpNY3pMMnVWVDlpc0pYYXI3ejhN?=
 =?utf-8?B?Q3NGbU9LZWdobUFHbkFHb2ZYc0dmcmY0SVRIMHRyY010UjFRU2dZcm96cGV2?=
 =?utf-8?B?ZElvZUR2aUEvd0duN1ZMMmtYWXRtZ09GT05VMlhwa3VlWnk3anptQy8wVWZz?=
 =?utf-8?B?QUVpZDNZYzV0Q1hyOVRiSVMxYWwzMFBxNkl5YVQvdTJHTktoYVk3cjg2WDhX?=
 =?utf-8?B?VTRXZjk5ZlAvNDRWT29wMktXL0grY0x6eWNKT1RtN2JWM1VmYVMyTjJ3YllD?=
 =?utf-8?B?bUZDdXFyVXA0cEZ4cHJKS3E0WldUaHl1a1dqK2kyckRSVzY4dlkvbkc4dFR2?=
 =?utf-8?B?UGorUnN3Nmh1TzBId3BNRG52ODhGREVTRnFYMWNZaHB6TWZsQmlWRFI4T1gy?=
 =?utf-8?B?bEJQd0hpL0c5UFdtZitpWkhsMXU3S05PdGJuUllaTFNiL04xL0o1eVozL0Nj?=
 =?utf-8?B?b3FBa0ZvNStQczR2TUdHdUVBZVhRVkc0QUI4ckorQkQxbWtkWkplbDFpcGxX?=
 =?utf-8?B?MlN6SHE1YmQzU1E3WTZXamQ1cklaQnFpUUF4NEZNUGlkT0xLYk43K0R4TitI?=
 =?utf-8?B?NnU5M1F1RG1TTmV0WG01YlpHdmtleTR4SUVqZU81clIvVnhNWlJITUtkQkRj?=
 =?utf-8?B?ZTF5MkVFVlgzQ0V5SXZkemhlZzFablZzRWtNM1BqdldQQk1mS0luZU1vOWlK?=
 =?utf-8?B?NE93MkpFRGtzdnV0ZWl6d2tyaWFjQ2MwMG5aWjUrV05uMGtKS1lzWmFUd1l3?=
 =?utf-8?B?OVFlcDYvM0NYQk9rTG12M0FGTUZyMUxPR3J2Q3dZTExtUjBlaFVtRUdYRER2?=
 =?utf-8?B?RXpvMEx6bTUrWjZGRlFuVE1rVU1md2M1L2p5UFc2YzhiMmN0UTFOQTBSWjN2?=
 =?utf-8?B?MWdXL3JRcU1XVGRMcGlma2dUZENlbmhDOXRZdWlTa3dOZXRjbGJ5Mk1kNmhI?=
 =?utf-8?B?aWtkQStQL2tXODNKTDl0em1FZkdoNHg4NU5nT0JJb1Q0UVEvbWNBemhhVTFC?=
 =?utf-8?B?cXdmNWtYd0JnbDV5cFlIZjYvMEZiRWRhc2dmNnRGUU5zVi9UK0FJdnlTY0Q3?=
 =?utf-8?B?Q1pqdUxtTWFGVmgya1JHWFM0VVV0aFRXcXFLOE81R1pjR25CaVdkUzdadHlL?=
 =?utf-8?B?S2wrbGxBdmlrakRjRGxNRzYrQ0ZFMGFYV2cvc3owVXhvWWJZZUpQalJJY2kw?=
 =?utf-8?B?anRDVjZqazJqSXlONlVFTHhLZlhhdmpXWnN4YkwvSXpGdzN0VnZsamsvVUMr?=
 =?utf-8?B?VFBKR2RudEFEbVVIVjFaVFNqWlp1Z0NkZThVK3hnZ1B1WGhuWXQ0U2FES0Zh?=
 =?utf-8?B?T0FoaVkvRzRNYmsxT283c05TeE1TbmxuY0NST2pUZFhhWmhFUXBBSnNiRmtx?=
 =?utf-8?B?SjBLRUFnU1gvS0Jwc2k4L0RxSHQ5dzJuTHJ6WTR6Sk9kUUJKSWRWN3hvdlMv?=
 =?utf-8?B?TlJpVURzWmRGczZjSlVQTEM2cTZGcnF0cWZEdlFZT3BNb3RkYUFwTE5uRHVQ?=
 =?utf-8?B?T2ZmWkUyR1pFWFlxUWpJTUJRY0JraXpvKytmaEZQdUxuaGZXdUMvRzR2eWRy?=
 =?utf-8?Q?wvnXTmPIDM1Qm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEtkazY4b0F2WWZXckROaTBma05uazJkMjIrT2MvZ3lvUEczblZrMXdSeUE0?=
 =?utf-8?B?TTByQTNLajVVNlhzKzAzYm5oL0FvUkhKdVJyVGNmM3JQTnFBS29YWEJHbFQ2?=
 =?utf-8?B?OXA2NzRRcFRJRUNRMzdlOHh4NGVORGxobmh1MkJKcjVqd0tycTNCbDRUNEdZ?=
 =?utf-8?B?UkVRK0R5c3F3Z1JoZkVuV2c5MU9TZWlidDdaSGpsVVh1NFYwenNtTkRCMjRo?=
 =?utf-8?B?bDAzYzRlK1hqZlBmbzYyN0xVelQ2V2JrekpwUjVjV0tDMDd6Y0IwQWhyMVBt?=
 =?utf-8?B?eldCTHhFdEpsQUVkbElISFBId1VSYVk4OEJwQWZEZzN5ZWlUZmgwMTRZdmY0?=
 =?utf-8?B?MWxqZ1ZEWWpuQXpld2duYXNZcGdaVklSRnRXVEl1V3R0blFpenFmNUo0RjEr?=
 =?utf-8?B?b1AxS2t2aTN0c1ljTnJnTmUzRVZQVmtSdDl6QVNhV3U2M2Myc1J5N3NpZzNr?=
 =?utf-8?B?a3JyUlZqYkw3bWw0eUxtNWFOclIzWi91U3lXaUNGT0srVUhSL3orZjVjYWl2?=
 =?utf-8?B?S0E5VlorSlBIZmhHaFhDbWtEOTY5cEJKenZKRFNSQ1pvUURxV3FsR3hxVXJH?=
 =?utf-8?B?bWVRWUNrQXl2bnorclgreWt6b1pDOFZIc3l5RXdBVHRNWEVvVUJTcXV5ZDFh?=
 =?utf-8?B?Mi9xcittOWZuamE5TE9iaUpSeE5SZGVneDk4Rm43Um1jNnllbDJ4YUUvclVC?=
 =?utf-8?B?OW93NStIeEdxSTQ0TjdPNXhXTTMvZmF2b3FIUUNQOGdOWWdOSVlweXRpNFll?=
 =?utf-8?B?YkdVejhsTjBTdUszblI4RkNZUnVCc1FRSDVicFBnQkdqOFN4cUl4Um5IT1VE?=
 =?utf-8?B?VExoN0xkRmgvd2F5MGdGYjlnNE9qSnE3SkMvaS8vQ2xuUHJoNDJxejRRa25C?=
 =?utf-8?B?d1pjNTBOSm9uencvMkxTdUlrRUdDQXk1MjVSSlduc1RvY2xpZEdWT3pwSXZ3?=
 =?utf-8?B?MlcrSXpPWVNTNzY0Qi8ybWtMNzhVcjdCNWp1OG1kOVlybVNTQWxoU1dZRi90?=
 =?utf-8?B?Q3dMWFRNcWFOVTB3dWZWbjdkRy84QmNvRWpXZW9DYnVTVmo3dHptdzZDVFFi?=
 =?utf-8?B?ZXMraGNMWjkrSE9nMklBNlBJb0VzdTVHcHFKTlE4VjVtTmJSRFlGNkE5ZWY3?=
 =?utf-8?B?amdpUUZucVN4NHpBaWZMSS9NdEZsMjhWZ2lJWGNyRWNQSUhjSG9IaWdSU1ZE?=
 =?utf-8?B?VWw3VklJUkxyK24yWnpBNUZvd2xlbG01SERzY0VNTGxBbDY4SFlITm94d1Fm?=
 =?utf-8?B?Rnh0SldGY0lKVVJIQnZiL3dnWWJIaWtEdFI2YWJmUTBjckw2Sy9odVNXQ2Zl?=
 =?utf-8?B?NURLYlBzQ3lvbVEzckkvR2xrUjl1V0NNTEc2TUd2K1BFdlZ3enR4VEVRZFJq?=
 =?utf-8?B?YWJMOGxFSEw4THpWcGh3S1VieS9YRldtRHJXSWRaWURyZ0xrTXZoL2R1NkYx?=
 =?utf-8?B?azN5ZUlCNk95WWU1cjYrb1FmOCsyRHAwbFFlc2I0dFFicGc4d0g0MUhHRThM?=
 =?utf-8?B?dkdJTHZXNEplcXBBOEIzZGw1dWZaNXUxQkpKUVRoOTBJcms2b09yU2VWUjVv?=
 =?utf-8?B?RmxDZTRZTU9Fci83U2FLaU9zSStyY3AwbGpRZXRnZnlKNU5Va0F0WkdxaDUv?=
 =?utf-8?B?amg3amZlM0duVndLd3N4NC83TlY1bi9sNXRXWmRtTHZjMDJ1UU43eFVub01O?=
 =?utf-8?B?WkhrUDJVOFAwMktpNUZhTHJXeTZZWDJWaE1rYnFKdkdSdUlGZmJjcGsrYWow?=
 =?utf-8?B?MTJtWnlUeFBFUGhGQU5lVk5jMU5sSGNQeTNYeWlBcjhOSWlCUkFhZVdPZllE?=
 =?utf-8?B?eXNReFQ0OWNxdnpFR2FtcWxGdE1JODc5NzNlTy9yZENOWWh4NUJvSjFQMTJ5?=
 =?utf-8?B?VXExalppWE4wQ05wdXdqdDZGdVVHSEFZY0Q4bXNJQU9mR205ajhuVkVLRXJa?=
 =?utf-8?B?eXFhcE9RQTZhRUNZYW16OUU3UWR6SkY1MFdBaktXczQzcUR6emdHZkNhdDVk?=
 =?utf-8?B?WGxwcktLY09UemxIMnZqbFR2Yk1KUm4rY1R6a1FvRWhJRDlnNnF1T01sNy82?=
 =?utf-8?B?bVoybG9qMHZha1JJUUxLUktqQS92REFpdlBFd0h1cnNuc1JCNlc4QXFQS3Nn?=
 =?utf-8?Q?RR6LJzpdfd7F1SAg4tfdcgtuC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9VI3MPjW5Uz08a3v8aiGEevtk1SA0yoHRfcyR1lvbCqcqA34GTTy4gq2fuWQho0++y8MseRcxZpbR4LoOQyPgZR45mBl3IB2zi+GWtoquqaXb2hHracWWsqNoLMz+3tc+9R3mLJzcKDYCpazkEVNxGrkj/LX9Tq4werpjrBZlgxkUnAN273JO2vB5jUofQTUIxS555Y1ZftB6/dB4bR+o3PEldoNi8TVK7h4UEB2hgc/OI8ErT6G1R7mS9zG6Nv941MPWOVQCKR877pM3D+/l3GC71JW7mHPYSl+qF64O6P7iDTlZLrMx9IY7AGMbpzk+2oCYtAFz8xZghKB2o1PPiPKuqueyD+hL+gMxqbnC9/TanLh4jcUn+5YAgjGxQ8J7byJePBPpQqsuE821R8sxPV6cr98uoEqOXoGBcgZsZMRHa+BaVL/UdqPXXQ2x05nLaBEBq01r1OfQCDDG9RHG+GtT6jjYUOJiXnewO2xK+/3CNbDSezU6LFWfT627BlWG0/gmpUVTQnuj+iyWOavkXUIASJPRHoPrFfl8e8JZv5IcBNtqJtoOUTBN48Ew1OXIFAO5Z/BApXE1oLm8FfouYLPLbAbuLpZMXTf8ZgZ+RI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d177a95-4fa0-4b15-7811-08dd4618ad50
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 19:09:55.8499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /A7JvayCxptSCX72mZKXI6dU8P4R6NU6dACCRq0LMCQr8KeLg++TpEZ5GkRpePrs4bImmhNp58yABHXpKQS/1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6019
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=938 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502050145
X-Proofpoint-ORIG-GUID: tBUeACVRMQlsJy7sLVTk-4ERVpF3pu9e
X-Proofpoint-GUID: tBUeACVRMQlsJy7sLVTk-4ERVpF3pu9e

* Alice Ryhl <aliceryhl@google.com> [250205 10:24]:
> On Wed, Feb 5, 2025 at 3:38=E2=80=AFPM Liam R. Howlett <Liam.Howlett@orac=
le.com> wrote:
> >
> > * Alice Ryhl <aliceryhl@google.com> [250205 07:10]:
> > > On Tue, Feb 4, 2025 at 4:46=E2=80=AFPM Liam R. Howlett <Liam.Howlett@=
oracle.com> wrote:
> > > > > > > > > +        let vma =3D unsafe { bindings::vma_lookup(self.m=
m.as_raw(), vma_addr) };
> > > > > > > > > +
> > > > > > > > > +        if vma.is_null() {
> > > > > > > > > +            None
> > > > > > > > > +        } else {
> > > > > > > > > +            // SAFETY: We just checked that a vma was fo=
und, so the pointer is valid. Furthermore,
> > > > > > > > > +            // the returned area will borrow from this r=
ead lock guard, so it can only be used
> > > > > > > > > +            // while the mmap read lock is still held.
> > > > > > > >
> > > > > > > > So We have complicated the locking of the vmas with rcu and=
 per-vma
> > > > > > > > locking recently.  We are now able to look up and use a vma=
 under the
> > > > > > > > rcu read lock.  Does this translate to rust model?
> > > > > > > >
> > > > > > > > I believe this is true in recent version of binder as well?
> > > > > > >
> > > > > > > Yes. The safety requirements of VmAreaRef is that you must ho=
ld the
> > > > > > > mmap read lock *or* the vma read lock while you have a VmArea=
Ref
> > > > > > > reference. This particular method achieves that requirement b=
y holding
> > > > > > > the mmap read lock. But there is also a Rust lock_vma_under_r=
cu(), see
> > > > > > > patch 4 for that.
> > > > > >
> > > > > > Right, okay.  Thanks.  You can get the reference by only holdin=
g the rcu
> > > > > > read lock, but you should hold the vma lock to ensure that the =
vma
> > > > > > itself (and not just the pointer) is safe to use.
> > > > >
> > > > > Hmm... To modify the vma, you must hold the mmap *and* vma write =
lock,
> > > > > so holding the mmap read lock prevents mutations?
> > > >
> > > > Sorry, I think I confused things with my answer.  Your code is fine=
.
> > > > The phrasing of the "only be used while the mmap read lock is still
> > > > held" made me wonder about further clarification on the locking her=
e
> > > > (because the locking is confusing).
> > > >
> > > > Yes, mmap read lock means there are no writers that can modify the =
vma.
> > > > Essentially, you are using the lock to ensure the entire vma space =
isn't
> > > > changed during your operation - which is heavier than just locking =
one
> > > > vma.
> > >
> > > I could extend the safety comment like this:
> > >
> > > SAFETY: We just checked that a vma was found, so the pointer is valid=
.
> > > Furthermore, the returned area will borrow from this read lock guard,
> > > so it can only be used while the mmap read lock is still held. This
> > > ensures that there are no writers because writers must hold both the
> > > mmap and vma write lock.
> >
> > How about just changing the last part to:
> >
> > Furthermore, the returned vma is still under the protection of the read
> > lock guard and can be used while the mmap read lock is still held.
>=20
> Well, the important part here is that you can't do this:
>=20
> let guard =3D mm.mmap_read_lock();
> let vma =3D guard.vma_lookup(...)?;
> drop(guard);
> vma.foo();
>=20
> since that would use the vma after the lock has been released. The
> reason that the above is prevented is because `vma` borrows from
> `guard`, so you can only use `vma` while `guard` is still valid.
>=20

But it implies that this isn't valid:

 let guard =3D mm.mmap_read_lock();
 let vma =3D guard.vma_lookup(...)?;

 vma_lock(vma);

 drop(guard);
 vma.foo();

 vma_unlock(vma);

See mm/userfaultfd.c:uffd_lock_vma(), which falls back to mmap read lock
to do this if rcu lock + lock_vma_under_rcu() is unable to lock the vma.

Thanks,
Liam
