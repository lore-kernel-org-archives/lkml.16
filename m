Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1899438F82;
	Wed,  5 Feb 2025 19:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738783398; cv=fail; b=swdbKuM18E/OijXR/uTlvtO8+hFj/5ZDdRa0iWqksnDOYBp3ZE6GaJCMCt28I2bViiTCvVu+cjyjWAdNIOgZT+HXRChVDroWH8k7RspUybUngxtKwqTlbUp+juGJVxjujrJntY1IZDO5RFmnotJosqxDin1YCcqlXybv0CjWukA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738783398; c=relaxed/simple;
	bh=vTlpxrFGt3+dS7KGCZeYwxzpq83MTl+ql22dT6cEv9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mgF7CSAKA6V8G2GNcamzkSNveJoD4XP96hohCaZVE3gVUTsddljBZYa2UOvA6NrYjSv/r+CisjH6y340Vm/rpiEKWfLASa9QdtqKA0WW951ml3G2tI4qU2CYQv/uhEelXEpVLMQwz2tNwHRWmbvvVLr/4k9hLX9FvgQCXn1XOjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TGQ6mKl/; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kyfaTKN+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TGQ6mKl/";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kyfaTKN+"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515Gfi55009607;
	Wed, 5 Feb 2025 19:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=KKDb7WOmO4Hqzsy/UsVo5FHN7mdN34nqMpO77Upbqik=; b=
	TGQ6mKl/gHDa/REmDQXFL7uvXcw0JuZzzzyfJ70dWoX8DFRa2aS6U8WMOGMNwQ2Z
	okKJym5coLqXn/WGolHKu4Q0Am8wxH7UiuIb3PGNucwBQLVDmZgl7/6z2oSu6xJ5
	0M4ZyYrKMut5kgytewTqi86BtgrJ0oKztvvS8y06GnVb4nc+zTHYPJBKfS+IHhCp
	rCIuj/rTutsRDOj5iqMalgAk/lmvlR8FKJvtmPT+7VCQrNXEr6X2QtVNWd456YBr
	Xmx9UdPKGWAZjZ7SMQz0ub5C6dNyzJuQElDtKQcQnVtUUjgbzgNnRZoIXN5STqi5
	9qgp2MO/6K6y5zg/Sqhaag==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44kku4u3f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 19:22:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515I62SC022731;
	Wed, 5 Feb 2025 19:22:46 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44j8e9gmvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 19:22:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7p5dEJtTDW9hTguiC12pPI6AdyqhHRh/PTHZw29+6krEosXxbPub1FKoReYX0nLDJOFSB5p8jMpZzb2FesY6ibI5AdDLVGq/yGHiCMfPUbvKkyBMHjtuSZyrVvXb0Ua37jY3yNGwzm5jgnormJuEzljmnDtb4QvpSYGqsNtwyvdbsrVsqu6PHiJMiBDYCWcR2XyPPzJ77ApyZmyaqtMKxJPGuDw5kVrl4dTK2Y3K66ZAZiNKPUlCGuCjaXKWI+rPlZozx/j74TLh/Eo47wBBRTMiMfvh+qZkLlicvvqK0r99hFb1LI3T/WVcQVMlW2s4GtzUK1UQ44LIkNVhFSzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKDb7WOmO4Hqzsy/UsVo5FHN7mdN34nqMpO77Upbqik=;
 b=Hk6pp08ahiw5K9awD8t736n/4zWNGGIzkWsaEIH5YybKqRxMcMxqPIIeu4Zoamp5i8xaVqlgflANubcLAOSZnxK/V/qUIZg1j3yvtlQpLmrEOYzzFOKXtbYAsfNcNvm+qbclMnj2VNbEWcrLXQHp70EidxcSTm2o6CefwlyibradIQHp1rAPSFE5vxqXX8wL36idwlAho4NNLBwSQKgxQ+HvruXj43Wlnrt6aOTxPyY3rR7VnUJPjbxvku82ZrR4Yjs6sKisQ0Paa48S93hYnjsoAVw2Wdmp5taoWNWGsFseoNLcBV7J6MSyMhirnfaUhifNJFT1dZJqXVsiBkIe/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKDb7WOmO4Hqzsy/UsVo5FHN7mdN34nqMpO77Upbqik=;
 b=kyfaTKN+UaeYiYg+zNURpgtrIfu/LizlnuYgD/y8EBnjY40OKaL8pthbareNYdM++YVMfascy8LCbcywPOy0f8ADDR50iambO8biw0w6g0+o4nSmTR01r4hDyO5CGT1BaCEAgUE5LoiCR6zprKCAB6SSPjQd0jM5Y2zVSNUu4dw=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CO1PR10MB4756.namprd10.prod.outlook.com (2603:10b6:303:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 19:22:43 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 19:22:43 +0000
Date: Wed, 5 Feb 2025 14:22:39 -0500
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
Message-ID: <gj7gumsc4firifafsmh5lujdc2rtvift6zmlzlf2zs6vldtxoq@a3erpxzryuyj>
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
References: <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
 <CAH5fLgj00hRAEBvNc8RR8iBwKQ2okDqmWWQ+kqmNkr9mOjfU0w@mail.gmail.com>
 <ymjkf2l2otosunrs3e3mmsj2wr3tvrfmgl4aav5dcpm3gtdulh@dzz4njdwkspc>
 <CAH5fLggd75BvB6VXPjR=_jxn1u7kOfix2rynvMHU4CeUUDHnVA@mail.gmail.com>
 <ebwiebbxomsjamv2uk6gnpg2uzjpqw25llvcz7njadklfi66nk@ab5uyq4bvwlb>
 <CAH5fLgh2Y0rG5ntpdiK-ycn9eBvrSXekxPsjDaYWuHBDUYNppw@mail.gmail.com>
 <ndell4l7fo2pkixo6q5xgdaryuj6wrmnyzthhe42wtumpacak5@oxlrwuwa5e5g>
 <CAH5fLggzX2fZe7zdPXibosYAn3752XeoxXhcbSrAYpw99sdj9w@mail.gmail.com>
 <cpntwmq7ctikl7hh2p7bqzj4mikcletjob57ynx4jhzo3anxmp@mdp74mdbrsph>
 <CAH5fLgiubF6iamehogfOzY0ukx3W8XstK7tCCcYYx=QDu1uEcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAH5fLgiubF6iamehogfOzY0ukx3W8XstK7tCCcYYx=QDu1uEcw@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT1P288CA0002.CANP288.PROD.OUTLOOK.COM (2603:10b6:b01::15)
 To PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CO1PR10MB4756:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d0d6dd-07af-4845-de2b-08dd461a76b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHdVUTgvZ0VTaGR5ck5na2FmbUVURDFyN05BeVE5TUJlbHBRWk9ubmlqMDlX?=
 =?utf-8?B?Q00yYjMyMHVJWCt5TDBiQnAxSWEyRFNaVTZISk1KeVlGN09hdTI0YWpkby8y?=
 =?utf-8?B?MExYdDZ1dGZFSHVXV3BaSGpBdkZ4Rjlpdlk3WW82M2h4V05MYUZUS2JYTjZX?=
 =?utf-8?B?dWkzZXBmMEppM2ZwZU1ESzNnb0RxZ1RhdW9WR3hER1l0VjNlWDRRcTk3RC9s?=
 =?utf-8?B?UFZhM0RjWWU3UXljNEtJWVNoUkxNRFRnQmcyT1pGRG5HbUU1Y3lEc2ErUmwx?=
 =?utf-8?B?dVRRUksrbDcyaHlXemY3eFBOOVRwK0xpaTNMaFpXU1pCTS9sT2Y5ZENXY0sw?=
 =?utf-8?B?YlpGblJad05hSTkrQk9YZm5VRytlbXBqdGZIYmV4WHI3YnlwWlR1d2h3UFdr?=
 =?utf-8?B?UGVvaXZWWGlEQ1p0eVNXc2VSR3huSk9XdGQ1Q1JGbWl4V0xKV0NkRGo0U0JQ?=
 =?utf-8?B?bFZxUFVaODdGTlJwbFlnWGVOenhRS2V3eTZzS3JNTFh3aDhJNUY5Yjk5T0JC?=
 =?utf-8?B?MENxV25TdFFTYUl6OWlQRjluVCt0dDhRYU1JUVVxQjRMdTE3RFJpbGJtMS9o?=
 =?utf-8?B?bm1GSWR3MmRmanM5MU5GY3lBU1UyZ0d3TElscnVWU2FkQThlWWhWZmVIbkpu?=
 =?utf-8?B?V1FWWnNlTFRhaVFHYzFLeWJpSHZWa1Z3Zi9Md0ZxMk9rRWxUVXR2QlhPU1Rx?=
 =?utf-8?B?OXhDSWFFZ3B4eG9GOTBFU3FhbVNMUE15cFl1R3R3enRiMi9ENnhudHFwenZE?=
 =?utf-8?B?UHZicG9ZcEtWc3Q4Q29seXZTL1pjYyt5VVhnaDJYNkhNeTRyQVo4eXk0Z0ZZ?=
 =?utf-8?B?SHRLZDkzSmxBdjRBVFJEVlZLNW5URWlWL09sME42bStjdmVwbUNRQVhra3Zo?=
 =?utf-8?B?Sjd0R3ZuSXNZR0xOY2xadUdSdW0vN1E4MUxwZVFaQU5tOUs1TXdBbkJOYzZD?=
 =?utf-8?B?Wk1pV2pjLzUzYnE4L21FcFpPMjlIeHRtdzBROHNzd3dmekdtaHVHVmlOQ2RO?=
 =?utf-8?B?VXJZWGoycExLckE0RFpwWjQ4MDBCVDdJQmFqTmpyUHdJZ2pvaHJHTy9Yelpz?=
 =?utf-8?B?ZEVlT1ZXWFcwU0xPOTFUMTFHbEo2aEdTSEV6TEZmdkFaOG4rUVJQc3NibS9a?=
 =?utf-8?B?NGFBMTVGR0pEWk02OU9pM1c5TkNCczd6eW1iMHJqSUJpRkIrWmlFVVo0MzJQ?=
 =?utf-8?B?SzlXaW10Q3FHM2tFem9XcDJPN3JTU3dxMGNEc1kxeUUwNjZDeEo5VEZBb0JH?=
 =?utf-8?B?VWZNdDJ4eTlYM1o3L0cvUVo0RlJNeWJDTHNRS2dwTEs5SHdiTnc0Rk45TVR6?=
 =?utf-8?B?NFpVb3FTYzdpN3UxM1B2clRnelhLTHRQaTQ4U2RDM3ZJYUpSb2xCNWtLWTQr?=
 =?utf-8?B?KzhQV2lZY0lRVkVHWGNDWWFzQkFGMVE0M3lzSi9sR281QkJRVVJqcUxtVkpK?=
 =?utf-8?B?TkJXVWxhZ2lBSWtQb1c5V2FtWmNzVTZ3VkM1eE8yWnB1WUkzY0NBSDBydWZL?=
 =?utf-8?B?M1JtQmdObUFSVTdpMktraDA2WEdESHJxU0JxY0kyWFROZHErc2pkYWNHVmIx?=
 =?utf-8?B?S3RhNy9qN0g4NWZGOTlxWE40bmxqN2t6bU5GV3pkWGx5QlNtWUFxbDNCdzFt?=
 =?utf-8?B?S1BYMTFiL0ZnZXE2eG55bEVPczg1eHltOXJyYnBncGk0WmVGOTM3eUp5cTdL?=
 =?utf-8?B?UFJhS0tDeWRYQnJ5THFpWmd3Q1RvMXMwSzZNVUtwaEl5Z1lZTE5RczhtMC9s?=
 =?utf-8?B?ZEdSaTNHN2VGSzZFTEpFeTQ5ZlNMc1M4dnNpY3pGYWVPVUZNRC9ZdEZPS082?=
 =?utf-8?B?RHM2ZXFhVmoxYitZNU9xT3E0L1BCR0NvbGE2RlduUzdLeVd0cy9DNTN6S1No?=
 =?utf-8?Q?tcfbjSF8XfWCC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K254Mk0wWCtuYnVMNnMySG40TnJkOHBXUWRsTkFWN1NjdVpnSWtCSlpsZGhS?=
 =?utf-8?B?VHYrVlFWekFtcDNiZyswRlpxNmxackpjK0xxRHErTkp5WUYrZXl2MFpBMmtL?=
 =?utf-8?B?MVRtV2wyTndMSWpRL25aUnlJR0xySDdYYVJyVXEzd1dRMXFOMUZITmNsM2pL?=
 =?utf-8?B?U3NoSGp0T1M2cHdjcDhEcVZLQ04zaVhDUDZ6b2ZWQjlnOUg5dnpzeFJKL3I1?=
 =?utf-8?B?My9lTUVuYm5lNENLVDAvaDU5RHUrV09kb1NTN1NJWHE2ajVDYWVMcE1YREl1?=
 =?utf-8?B?QXR5WHYyV2hCODd2OG1BV1FJWEdkYWdZOVRWa2ZBMmhIREhtalNWRU1QWGN4?=
 =?utf-8?B?Wjc2dW9EZ2JpN05vbWJ6c1hIS0FUaC9SMnZVa3VYY3ZiYlgwKzRsK1lqYWhy?=
 =?utf-8?B?eHRIRjkyaGtEK3RsQ2xLTzhiTWI2SU9YbEw2QVJtWGk2UTY1MnhIWS9raW1G?=
 =?utf-8?B?dkhOVjVtQ0sySWhQQURubnBBT29MUitjQllQNUE1Qm4vdmJZMDlyMFNKT2pw?=
 =?utf-8?B?R0ZteDl1eks3ZkZBeGVVdThPUWU3eUo0SmZVejd4MldoTXJDVDlDS1JVWXdQ?=
 =?utf-8?B?RkxJNXN5QnpDMm5RWGVOMzVuR1dWWUdFaEtqK2FBS0ZaZ2Jka1hBbWFnbTlE?=
 =?utf-8?B?MFlNREMzamtnRy82RkdtWTVlT1FvbHB4SlB4WE5wVTZJSkZsRWl1WTAvTi9h?=
 =?utf-8?B?MldKRGpqaUxlS2tyN0V2eUZBaXJiczduaVI2Ym53MDVlV0RrSytlZUNyemlh?=
 =?utf-8?B?TVRYbkJ4TTQvaStzTy81WEV3VmR4NHZsUzFqQUdCdmNZUGZDZkg3cmdTMTJR?=
 =?utf-8?B?bVVad2xjNlZqODhBSnR4MkVPSEdPNkpZSkRzZVB3eU9lRmFlbC9yeVR2ekpN?=
 =?utf-8?B?RW1CYWttem5PZGJsdW0wanh6Mm4ySU9lWVNqT2JCOTdrQ2pyZ3VadXN0TnV5?=
 =?utf-8?B?bkNJcXF6N21tc29JRlhmaU5nUnRFTGpHbHU5TDg4QkhMbi9meGhYSEpHeTlV?=
 =?utf-8?B?a0JMZVBGbzN0WXdUaUlISDg1SEUvUEtFTzdvQk8rUURoRXJDUkZjMTAzVHM5?=
 =?utf-8?B?UnhUK1J4a1R2OEJLY21PRGtRWXJnTW42bEZwZnN3dDNTOEVTMDA2UVJsK1FG?=
 =?utf-8?B?a09rdnJPWnJhT2lRMjdyWTJwajZkNlFTY1ljakZya0M0bnIzR2xCYUdxSnAy?=
 =?utf-8?B?bnVBWFJCQS9VNzRPQ0l4UUt3c0hGSnowNFpPTXhxMm1WclJ5K1Jncjhub2hw?=
 =?utf-8?B?RHJHcWszcmtWY0VmL3J2UUU0U28zWU1mK0VtR2ltdU1hek03K1hIdEtLY2Jh?=
 =?utf-8?B?VjBmaVJuTkdPWW54ZE9FNjN6bGNMU0MrVXZ6WFc3Ukx6LzY1U1VQcGkxeUVr?=
 =?utf-8?B?QWp4cnVVNDQwQTVkTkVXVFhOdll6S2x0djh0eEVQa3ZmaVRXd1UyL2NZeTZt?=
 =?utf-8?B?MWh5cnpiVmRLOEN0dzBHYmNpL01HU0dPdTRhbWxJM3lZY0RtSlRNdmtrb2VL?=
 =?utf-8?B?T0J6aXhXalkzMi9TakZnaGUzSGRlNGlLTVJSRUNzUzNSTlY3ZWM3bTkzb2Yx?=
 =?utf-8?B?QXVialpaMjBkYTFNeDQzSVRFdGFhMTNyVzlKRzhtaHdrYXZFZ2xqK2pMM3NN?=
 =?utf-8?B?bkR3NFpEU3RVc0NWSGhFZld2SVIwSno2THM5QnVTTjFwdmlrOGJCSElNZUZl?=
 =?utf-8?B?TWhSNFN0S3ZzWENRc0VLV1lydDFDaTdMTFNrNmIzWE9KaEVGNERSSmpENHJq?=
 =?utf-8?B?Wjc1M0RHOUN6S0RuSTRYK2dhUTdwK1NnQnlNR0JMcE90bDlqQVNiVEJlYjJw?=
 =?utf-8?B?aGlSUFcxVjdaU0pQZFJUa1pPTE1yemYwdU15STM0Nkc3WnZnT2VQd1I2MFZ0?=
 =?utf-8?B?cDhudlA1SnEzdFh2aFdaUGl1Z2sxOXE5WUs3MWRwSEFxVmpKSXNkdjNKYWs3?=
 =?utf-8?B?cDNmOWFqOXNtSDREd2p5N2JxcGRQaWZZU0RFV3N1TkNwVFFtbUtjc0ltcDBQ?=
 =?utf-8?B?L3JyMU1mbWkzcVAraUhRNjNTL3VqK3I0VWJxVUw4cWdZNGpnUlk3cnp4UTNr?=
 =?utf-8?B?MFp3QTlGTHAxVzVqaDZVY3hTa1ZPK2J5eWxYblFFKzN0SVRhOTBoV1RLakt3?=
 =?utf-8?Q?3aWAx6jcwi3mtFtiNNHSaGg9n?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UGGUqtPsux7dHia+fq2le46bB+NJWdbhs120FRx8/Uaccshm0J2yCMpLo5eofblv8cpeCSBX4hhcaMRf6ZFMiAriSQmCHW0jhBaPjrA/6GF26jzaFWsUcOvE9iPwbyzi223jYKnVXVitmbyjTmwbVLyuWcDezA8cuhe8+sNM0UyQ1wbRCqAxXlrKzbl1eAstCUkcRPORTbeNWczDUdvK8iPTQNM5cPaMjWQnZe2mggWN1zSuIuMvg7YpCUARBQcAnZtf2WLfpYXkehdiVHTqlUsyEhvXtsq3dfSkakFti06TiQe5v/k6ceItofaQrUwIOqJDpkGGiJg9nGWFYONx8IVzR3lJROCqoWx4Sp0Fs21GrmpwqTkwPfxsFA24Cq8rfjC+47s2OI8lRCTJiGhAKe5XQXiuipSDSbotx8K/IAuu6NQkEcaP0lHbz3Z1i8wBXP1Nu4RpM2iRuH3QQJahkhxi8ybZW3OMPt3nzsYrixp+btGxjEiXjingnDc5hb6FzCZTza9Yo04kAVMORHmChRlL9F9hNm+zoibZTxU3F1ItWpMTcSNruooOgunPw5qgoRbWSH6c+ACG7mWsbeyKm2xmo7XfuSeAk863Uk+dcNY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d0d6dd-07af-4845-de2b-08dd461a76b9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 19:22:43.2830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQ5PTYDY488rUqFSVaAvg4CryXWRAH5VS+y15vT3bdKYGF4y3yfAFuxYymVixnAVvbkSgfIvlG2FwmKVm0Uwug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4756
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502050146
X-Proofpoint-GUID: pQtSaPCGBzvWjXQckjNLRmeSr5xU5iZJ
X-Proofpoint-ORIG-GUID: pQtSaPCGBzvWjXQckjNLRmeSr5xU5iZJ

* Alice Ryhl <aliceryhl@google.com> [250205 14:13]:
> On Wed, Feb 5, 2025 at 8:10=E2=80=AFPM Liam R. Howlett <Liam.Howlett@orac=
le.com> wrote:
> >
> > * Alice Ryhl <aliceryhl@google.com> [250205 10:24]:
> > > On Wed, Feb 5, 2025 at 3:38=E2=80=AFPM Liam R. Howlett <Liam.Howlett@=
oracle.com> wrote:
> > > >
> > > > * Alice Ryhl <aliceryhl@google.com> [250205 07:10]:
> > > > > On Tue, Feb 4, 2025 at 4:46=E2=80=AFPM Liam R. Howlett <Liam.Howl=
ett@oracle.com> wrote:
> > > > > > > > > > > +        let vma =3D unsafe { bindings::vma_lookup(se=
lf.mm.as_raw(), vma_addr) };
> > > > > > > > > > > +
> > > > > > > > > > > +        if vma.is_null() {
> > > > > > > > > > > +            None
> > > > > > > > > > > +        } else {
> > > > > > > > > > > +            // SAFETY: We just checked that a vma wa=
s found, so the pointer is valid. Furthermore,
> > > > > > > > > > > +            // the returned area will borrow from th=
is read lock guard, so it can only be used
> > > > > > > > > > > +            // while the mmap read lock is still hel=
d.
> > > > > > > > > >
> > > > > > > > > > So We have complicated the locking of the vmas with rcu=
 and per-vma
> > > > > > > > > > locking recently.  We are now able to look up and use a=
 vma under the
> > > > > > > > > > rcu read lock.  Does this translate to rust model?
> > > > > > > > > >
> > > > > > > > > > I believe this is true in recent version of binder as w=
ell?
> > > > > > > > >
> > > > > > > > > Yes. The safety requirements of VmAreaRef is that you mus=
t hold the
> > > > > > > > > mmap read lock *or* the vma read lock while you have a Vm=
AreaRef
> > > > > > > > > reference. This particular method achieves that requireme=
nt by holding
> > > > > > > > > the mmap read lock. But there is also a Rust lock_vma_und=
er_rcu(), see
> > > > > > > > > patch 4 for that.
> > > > > > > >
> > > > > > > > Right, okay.  Thanks.  You can get the reference by only ho=
lding the rcu
> > > > > > > > read lock, but you should hold the vma lock to ensure that =
the vma
> > > > > > > > itself (and not just the pointer) is safe to use.
> > > > > > >
> > > > > > > Hmm... To modify the vma, you must hold the mmap *and* vma wr=
ite lock,
> > > > > > > so holding the mmap read lock prevents mutations?
> > > > > >
> > > > > > Sorry, I think I confused things with my answer.  Your code is =
fine.
> > > > > > The phrasing of the "only be used while the mmap read lock is s=
till
> > > > > > held" made me wonder about further clarification on the locking=
 here
> > > > > > (because the locking is confusing).
> > > > > >
> > > > > > Yes, mmap read lock means there are no writers that can modify =
the vma.
> > > > > > Essentially, you are using the lock to ensure the entire vma sp=
ace isn't
> > > > > > changed during your operation - which is heavier than just lock=
ing one
> > > > > > vma.
> > > > >
> > > > > I could extend the safety comment like this:
> > > > >
> > > > > SAFETY: We just checked that a vma was found, so the pointer is v=
alid.
> > > > > Furthermore, the returned area will borrow from this read lock gu=
ard,
> > > > > so it can only be used while the mmap read lock is still held. Th=
is
> > > > > ensures that there are no writers because writers must hold both =
the
> > > > > mmap and vma write lock.
> > > >
> > > > How about just changing the last part to:
> > > >
> > > > Furthermore, the returned vma is still under the protection of the =
read
> > > > lock guard and can be used while the mmap read lock is still held.
> > >
> > > Well, the important part here is that you can't do this:
> > >
> > > let guard =3D mm.mmap_read_lock();
> > > let vma =3D guard.vma_lookup(...)?;
> > > drop(guard);
> > > vma.foo();
> > >
> > > since that would use the vma after the lock has been released. The
> > > reason that the above is prevented is because `vma` borrows from
> > > `guard`, so you can only use `vma` while `guard` is still valid.
> > >
> >
> > But it implies that this isn't valid:
> >
> >  let guard =3D mm.mmap_read_lock();
> >  let vma =3D guard.vma_lookup(...)?;
> >
> >  vma_lock(vma);
> >
> >  drop(guard);
> >  vma.foo();
> >
> >  vma_unlock(vma);
> >
> > See mm/userfaultfd.c:uffd_lock_vma(), which falls back to mmap read loc=
k
> > to do this if rcu lock + lock_vma_under_rcu() is unable to lock the vma=
.
>=20
> This patchset does not have the functionality for doing that, but it's
> definitely possible to add.
>

I don't think that's necessary right now.  It's just that I read that
comment and it seemed to imply something that isn't strictly true with
the "only valid" part.  I think?  Is rust doing something that makes it
true?

Thanks,
Liam

