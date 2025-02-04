Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECFE2139D8;
	Tue,  4 Feb 2025 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684004; cv=fail; b=DMwvXeN0VPE68mQRaUtGFK5Ggg0uhf3gfAegI+gmKrDslRfOx7lWRkmeifnVJ4+qn014iAJOlSo0W51yDgQIonkfY/0x36imobiGlR5m5hv51bPWXuGMUkHROZJwz4w+ZyzWkVQNJls6XUrtpCJKBHCUOnnZlYyNi9tJ/7s09+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684004; c=relaxed/simple;
	bh=gApI1Qp9CysbtqbLLNgpLsfEehVIB79P9gcZy2JLerY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c0luq3aT93+E8rEVH5u/egjIaOi9xgJ0flXUa/3fvtf2oW/tOIXnnx69OGtFNdSysWyFGuUAOQj0bEPaeRNT1QWfn2P02LHSwM1F/h9ApFPvocehEK4iUrc4uHm7UXhOOZUOO8JxBdxLUh+ZW6I38KrV/Hx0oSaISUv+wKeqjss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V/wFmC4c; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=TgPTLulI; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V/wFmC4c";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="TgPTLulI"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514DRfqm017229;
	Tue, 4 Feb 2025 15:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=B+TSqkDVIm4/PFA0PjYcvBrVTidGF/y9xrraShqW/QU=; b=
	V/wFmC4c9v0csW2wfv4nx9OEJVRMqC8cQewSaFD77tqxuHTff/Dz28rm8mSUTHWS
	EG/GmipfSysEt7d3E3MAco4R6wP0Aj+OhAUQrRJ8/1ey3hFQzzFjDmBCC+KXV70F
	MrAVN2nCj8bsXOCHOi7sk1WO7MUIkVTZmAmrwEzZVgm9USbRYgXZXfdIjqF0dIGH
	8N3nyO26jlzC9P6EjdWSKESDLDBFN/oVdjubetOFtTueQLQpmH+8e4UP99p2PEjI
	HZvanpAmkvGqfaqKTOfmhcdMsTNUaPJpVuDMy/XW2g8IXK3XpjtjLdxNrCcmwrAJ
	lL56auCQzPgigmbsvIBzlg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hh73mw8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 15:46:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 514FCMd7029967;
	Tue, 4 Feb 2025 15:46:11 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8p357dh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 04 Feb 2025 15:46:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9DmTTQVmMtlFyon2U+cXpi8/OSzoxPVjCQIZlYWFhcv+FmInZlwyk2VmgM/nFM8irVU+gPAOQK+G23uDcZqIseMhhmnX4BpkMdj3UviznqBt+24sNh000FAzS9qbGi/uMnCqXZyNqO3ZKBMj8ZeqY5ZFwpCW8BsRB+0h0D7bHLD9BxMvFnSwIXbY4CSEQMxAgUP1RzDU4bHynJpCKuy3pAXQRSsm2u1nejpYGoBZ4NDDGqFTjc9fXWrq+ypwfeQxjhDujfu6wvxvC59f2DSQp5O8H0ryMzXjKBtt3YcI9s8VyzsqfueeS23azPq+F85IWl+LNhJ4VLyhnm4C3MeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+TSqkDVIm4/PFA0PjYcvBrVTidGF/y9xrraShqW/QU=;
 b=v9WrUf275qIa+2lamUmrheQydhHuJvRr44nYBRd2kmYAIqsun5aFl93TuGCnDLXBUC/DXUzylr6bTvUgBIRLo1fTcBCSyfNojWi+yl8418/yXrT3B9jgHLug2WY7f/s/N6vMTrbqDA9dau+yNq5jL9gIdnlxRThCP5qanBfjxosD3I34nUQGPqednolDdrlXIlWhlK1Q9HbBG1ZD/1b78Gv8SiN6Uxvr3pEfjOmaJcmjmLjN6de8onP7friQzEpQDMf4j51ASc0/er4Mey5RQg+dg6svwhA6fKTOKNLA8RNprKjKSUvO+nTtMHi1jr/d1HesX1JQ55yGZxVeofIwYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+TSqkDVIm4/PFA0PjYcvBrVTidGF/y9xrraShqW/QU=;
 b=TgPTLulInGIwAv5ugT2qBJaloP8aHtVl+OHwX6CenJoF6kjyyNB2ytUGMKWRqJn2ZW1AwKQnOW3peRm7AQ0RVE0FED52O0+H7/26lYv2rRMr8q7oDi8CT7SiG/o3D/PZtRwVbWdHoJBxGOsZoq4GggPZ7kd4sitYu6rlarNdYdg=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by CYYPR10MB7650.namprd10.prod.outlook.com (2603:10b6:930:b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 15:46:07 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 15:46:07 +0000
Date: Tue, 4 Feb 2025 10:46:03 -0500
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
Message-ID: <ebwiebbxomsjamv2uk6gnpg2uzjpqw25llvcz7njadklfi66nk@ab5uyq4bvwlb>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAH5fLggd75BvB6VXPjR=_jxn1u7kOfix2rynvMHU4CeUUDHnVA@mail.gmail.com>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT4PR01CA0503.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::21) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|CYYPR10MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4350bf-4a50-471b-07af-08dd45330a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkIwT2VwejZNdHhCL0VZZ0RjbzZCdWRtZVY5NXFoZ2FqcU1zRGRRQndtaElt?=
 =?utf-8?B?OEordUQ4eXpsbGxTTk1UT0RLaGt6VUtzY0xrb0hXVU5wRDhTcTZxUEtGQWc5?=
 =?utf-8?B?K1I0dmtURDdVQlpqNTJjczBUeHRFTkdBbSt0NDEyZk10ZWg2aTkyckpVYWsy?=
 =?utf-8?B?cUNTT3o2OXlJRUNXait0cElkTUF4ZWFyTCtKYWZhWjdYNkNFY1MvVUVyckQ5?=
 =?utf-8?B?T2tMdkM0dHVLQXlsc0MzQnFFVDZIdjhGTHNZRlVDUDhscUVuaDd6eTVaRVl0?=
 =?utf-8?B?UUxqN3ZQZU04VHFkTG5qd2tHT3NZUy90NnljZ095QmpDK2NYN3JkYkRWVEF4?=
 =?utf-8?B?UTd4VnJ3a2tWaDA5c0pkUHBpWVpkR2RVb3FoMTVKVHVoZm9EL2cxYk9PdnBZ?=
 =?utf-8?B?ZGZpemd5cXl0a1FPcWZsUXhuUHk2ZTMyc3ErdWRTV1RzSVJkdzlCcU1CRWdq?=
 =?utf-8?B?QU4yTlVnN1BnMWUrcnNxMG0zTzNvZzlQeGczMDBMUTk3dHBsK0FOZHRJUktl?=
 =?utf-8?B?Sm92U0wrcmI4cVgxUm5BWk5wbTd1MWZUMkpnUThCVzlSdkcyczlkWUg0UzI2?=
 =?utf-8?B?YlFoYkwyUGw3cEdLMS9qeXRDOTZaYi9HN3JnMERrSWdNajlianA0ZFVxZkRF?=
 =?utf-8?B?R1FiZWkvcit5MDB1UjJZMEhhU2xUSjJVMmxLanExWjhLWmFsWHVNSlhiTlJD?=
 =?utf-8?B?RVdzQ3JuR2lNSFZ2OGl3aVZrWGQ4ZXllRURidUtWK1dtc0tCMFdjNFoyWENR?=
 =?utf-8?B?N0ZnaFY0RWliY2lYK3FpbEVibjBLZkhYa0VSWWIxYjU5RHlkakdqMTlKS0Vs?=
 =?utf-8?B?VFVFNTNzUHZDRUlmbVJ2VkxabDlFQzFSRlUxZmRmQ283aDRGODNIb2tGNmlH?=
 =?utf-8?B?YUNEU1doNjEzOUFjZEliVFBheDJZQ3p2T2hURXZiYS9yendCNElXdlhmaFJi?=
 =?utf-8?B?VXVUN0pHRWNOZWhzT1FDM3ZKTW42YnZzcDl4WjdqNDUvVjNGUnZGdTAzT3RM?=
 =?utf-8?B?N1ZHUXJ0cEdtd0JQVkJVbnVuKzBKVmc2NnVTbHN3WFQxQ29WWHo2RU96aWlQ?=
 =?utf-8?B?Wnl6Sjh4VURsaHhDazJsL2k0bnErR1NEL01VOElMZHd2VEg5SHF6QkdWN28y?=
 =?utf-8?B?VVpLOGV1YVA5aTVwUHNtRXB4c0hoQXkvUHdxK1JoR2lZWHI1YXNMakdMTzhE?=
 =?utf-8?B?SHhYYUZUaG1waUxjVytnQjZ5eWdkTDluOERrd3dINHdpYm90LzVBYi8vWllT?=
 =?utf-8?B?dm1YTEh5dmc1d1E0cWE2ZDgvUVdvZCtsS1Z3WU5DQk5ub08wZTVOZzZqaVdx?=
 =?utf-8?B?L3EwcHE2NUJVaU5yT2MzZXpRaXFFS01ERjN5b2tJNWZxcmVXNVc5SlVDV2JB?=
 =?utf-8?B?NHZydCs4dXVWWkovbG9oYjJTSk9ZVEZRUlo5ejV2QXJ5SHdIQnhoeXZoMUgr?=
 =?utf-8?B?dmNqY1c1ZGRqbDNxWmY1V0lNc1ROMVM1Sm84dnFQMHI0TU5pM1M5OUxqR1J5?=
 =?utf-8?B?bVdzRkZidGUzdmRQS25aK2U4emFOeHZBcEQwcVZtVDIxWFRVMTg2L0ZLc3F2?=
 =?utf-8?B?cVRhbFhlMEZ4QmEySTAzZ2xyVjVRSk1rVlc3YjRnR3QyS2U3akNJUzFPMVdU?=
 =?utf-8?B?T3RkL0dxd0tKbkNJb1RRNGx6R2xPNHZaNGpvSW9odnArZEF5dmpiVDIxZkd4?=
 =?utf-8?B?NThmendzcmhRUFZVWDNzRlJGR1RVbU8vS3RRL3N1Ty8rdUFVSzBXNmpyTmww?=
 =?utf-8?B?VWlHckRYU0FpRkVRMW9WRnhZRTBsK0w3UXM1alNxOFNaMkJFMmN5N3R3eGhS?=
 =?utf-8?B?ZkZEa05MZW9xTUF4ZDVzNGRKdVpzRHdoSHJhQXRxbHhJWlRiUEpZQ2d1VnVE?=
 =?utf-8?Q?aVM4PZZy3NKg8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NE5EVEZSR0R2b0w0VXN6YWx0Z2ZXWDJQblBlelp3QWFOdHJZWnl5L1d4djZ6?=
 =?utf-8?B?RUN2VUZEVFBFbEl5NjFZY05pMzVKRTBNNWlqSzRITUxQWmRXVUJtYnhNeXd0?=
 =?utf-8?B?MFo2Ty9IMHl6MkZjVXBsazkvSHlqTFVjc1lFQTlJMTRDY0x5Y0VzeEhOSUNo?=
 =?utf-8?B?aWZrQ0oxdGZaOUpMSmtrNlZoNGJiVWUvZmh6aG4wYUo0OTc2RWtmYVA4Y3BU?=
 =?utf-8?B?ZkR6bDUwM2FVTlRiRU9NQTMrZnZjcVlwTkVjQlY1TG5LalBzTStiM2xycWJp?=
 =?utf-8?B?bm5VazIvMm9RaytOd3VnTFlDZExkNXByOEVTSnFWeTVGazh1Sk00bHpxN2xX?=
 =?utf-8?B?RTZLUVYzUXZ6S01nVXlWTWg1Y09YMVd6OURWQi9VZm5MMWNrWVdpZmxJcnZu?=
 =?utf-8?B?YkNPd05yN3o5NlhKRGxESnZsNUxJb3F5eUliSVQ2Qjh0cVJVYm92N0J0dmlZ?=
 =?utf-8?B?czVMUEVOaGlIL1J5c1JReGUvUUFIUUJOQkd5TE1Wc3NXZU9kOHRJYVR2eGY2?=
 =?utf-8?B?L256Mzg3UFZHTHlrWmVKN0lRZTY0UWJueG1KUWZETFBlUzhTS1pSbldVSU9x?=
 =?utf-8?B?NjVJZFVUU25MclFaTHZrT2NzUUNaMU4yeU5EZkJzeDlKKzVDUE5wWVM5WXhq?=
 =?utf-8?B?U1IxNUpXYlYrbEZJUW9PcjlGYVFPK2RNdERZVmRMZEIybkEwZXFSOXVLdGo1?=
 =?utf-8?B?dE5UQmMxcmJTcjhrL2FNTHYzcERqaVZxck1ZYmFnNmx2aG1Ya3BMb1ZrRkxI?=
 =?utf-8?B?UWxlTU54eGhMYlQrU08vRGxrd1VKaFZKNmoyL3pEMVBLd21pRHV0RjBkSDVs?=
 =?utf-8?B?enhRcVM0T3RvcEhaMjZNSUpHZDIxa09QSFVrVzdhMG81aFZtczU5d1IzcjR0?=
 =?utf-8?B?clpHdjI1dVlocXM2N2N0S2xORGMvVTArSFI5L3luQ3JIRnJGczk5K0pGK2hZ?=
 =?utf-8?B?NDRsbUxIRlN2c1pKUGNEaEFRNjJMNzd5cW92Y1RlNXdLcUwydGloL2hMSnh6?=
 =?utf-8?B?UjhnTjJ1S2g2UGN4YVpEd2o4SHFaU0hNMVRPVnZKcGxQOXRFRXJlcjVKOVQz?=
 =?utf-8?B?WFJFQTJmNlV0Z2lwa1c0UW5Jcjhlc2g5cUJjcFdpYjBTclNQK0ZIcWhCSWUr?=
 =?utf-8?B?dFpvWmNxR0JiQU5ud05DTWI0QmpPTFBSRi8zWXZSeXQ0ZVROK1VNQmVuRGFW?=
 =?utf-8?B?ZVBUL3hDV3h0anVpVWhNc2w0c3VEL1VST2UzR2V1SExMODZYQ0dtblV4V3pD?=
 =?utf-8?B?YngzZk1WQkxvSVFWTkUvYm43c1VNUFFZeFBnRkMreW82Z3BvZUpXSlJPU0x3?=
 =?utf-8?B?ZTMvNHpXVEtUZXZpRFBQd1dpaVRnVWFnejlwR0hRZDNmM2RJRGJFZThlQlhk?=
 =?utf-8?B?MFJUaG12NzR3dVM2eTNTOUxPc1JVY2NKMnNaQ0FJL0pUV1lKcFZ1ZDRVNHY3?=
 =?utf-8?B?Unl6NkQwZDdHYkV4L2xseGZLM2JuSXJWNXo3Y0NWMFBackxPbzZhcEtDOVdm?=
 =?utf-8?B?UjlsQ2RkTy83K2FIMkV4Qkl2ZngwN2JBYjhqRXhFNGFzWTJYbWJoSzZrbGs2?=
 =?utf-8?B?QnB1SWFyM3RjTVVSeDJIUkhJRE0wVmZGcDBkakk0WUhxdlJ5U2VsbDV3UnIw?=
 =?utf-8?B?QVJJYUdxVDlCZTlzelFUSmpLL25VWGNYMjAxMHoyM01BMk1XY2hteTNwZkZu?=
 =?utf-8?B?KzFzeUplcGhlY3R4TTVRcmV1K3dwTno2Y2RKZWYxSjl4STZEbEEzTjQzOW54?=
 =?utf-8?B?ekNUUUVPOUg5c3NESGk5cGFHNmdmOHA2TUxWVnNqK2VZcDZMc1pkakVuVVpB?=
 =?utf-8?B?NVFmOFp0OTluL0s4d2xFNytISC9BeEhQTlV4cjJ4d2RyVHBnWUV4TnBXU3NS?=
 =?utf-8?B?alJWZGJxekVQRDdZUjdXL3pLcDhyVHo1Uk50aGNRd2U3eVNZMWJQYkkzR3pL?=
 =?utf-8?B?aEtKTHM5ajAwc2ovZFlyRVp4SEhRUlE0M1Q1YTN4TXJlQjF3enE0eU9tSWR0?=
 =?utf-8?B?b3MweHhpTlF1cFU5b0IyOXE3TzVySDJBaFRiOFlQOEdkdW4yYjZpbHRndW5R?=
 =?utf-8?B?MDlDUjRSUjdrNGRXbW52SjlkTXc2MDk1bDV2R1RBRG1uSzNpU2Z1MHUvZzBi?=
 =?utf-8?Q?ZEnvNGyTgRbnF+H5kxDZQeUJ7?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nLmNiw+DHu/jM4AqbU21Aho6T4BqKPd3+9KscJo79R/Ifdb5YfWh7K2DCj+oZex8Uztg77d6BbcREcKyDsV8F1wx2usJSZtqI+snuQ+7mmPJzeTg9hGW4pAD1noq6vSOOs9Xv1EDVht32PP5vJu4nOi4vBPLz0zqwBWY539bCJydl75EQATyuHt1cFWI5pDEweLlxRTChkpDrFZDTEWbpf56v5I6tv+d+AJ+Vx1YXAlzF+qIQq1+y3DgxNsce/cChjhlJJ/bdK3r91oWMVnEsSFUDGrAq7Ld/xE+NIg6LDEXDVTTAOATJfCJIF1TUlQPcFrlBZ3d7y6vEl7QMo7IKT5mdUcbfPJQf7rEr0GJJwTKD6//IqQzaAO8YK9yCP3Ro+uzjnzYXHd8zqT6tm5bN6ExQSp3ASVja/J202NFZFPFgHRhtosii5loaT7ezf/HphOUXB7VRkPmk68O/mZ+aZR5p9me9hBVf24i09BJE0yW/urWf3Z2cMz7mOb/Bx7N6kwiN5wDqMa5kEPO31T72CDONenhwbKVEOmsCX76JvGR0PAC6dlQMHecd4thrnJNZWukVfqtggwit4vwNUUPmuuqiq1N9x19dZcsaCv/5s4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4350bf-4a50-471b-07af-08dd45330a51
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 15:46:07.7308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eV03cDW2NPVxhxhgR/UEGpnf0mYKCtjVHXlSB+e/PpGsW2EVAsdK+1vfYVJXQjsYYaXUzDiXL3ANii4NmnoYGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7650
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_07,2025-02-04_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502040122
X-Proofpoint-ORIG-GUID: iUvuzjgpnRSJ5CEFqBeAYB7oldqcJcFj
X-Proofpoint-GUID: iUvuzjgpnRSJ5CEFqBeAYB7oldqcJcFj

* Alice Ryhl <aliceryhl@google.com> [250204 10:06]:
> On Tue, Feb 4, 2025 at 3:55=E2=80=AFPM Liam R. Howlett <Liam.Howlett@orac=
le.com> wrote:
> >
> > * Alice Ryhl <aliceryhl@google.com> [250204 07:45]:
> > > On Mon, Feb 3, 2025 at 4:44=E2=80=AFPM Liam R. Howlett <Liam.Howlett@=
oracle.com> wrote:
> > > >
> > ...
> >
> > > > >
> > > > > +impl<'a> MmapReadGuard<'a> {
> > > > > +    /// Look up a vma at the given address.
> > > > > +    #[inline]
> > > > > +    pub fn vma_lookup(&self, vma_addr: usize) -> Option<&virt::V=
mAreaRef> {
> > > > > +        // SAFETY: We hold a reference to the mm, so the pointer=
 must be valid. Any value is okay
> > > > > +        // for `vma_addr`.
> > > >
> > > > Is this true?  In C we hold a reference to the mm and the vma can s=
till
> > > > go away.  We get safety from the locking on the C side.
> > >
> > > Notice that this function is in the `impl MmapReadGuard` block. This
> > > implies that you *must* hold the mmap read guard to call this
> > > function.
> > >
> > > The safety comment should probably be updated to mention that we hold=
 the guard.
> >
> > Thanks.
> >
> > Does it imply you must hold the lock or does it enforce that the lock i=
s
> > held?
>=20
> Not sure what distinction you're asking about. To obtain a
> MmapReadGuard object, you need to call the `mmap_read_lock` function,
> which locks the mmap lock and returns an MmapReadGuard. When the
> MmapReadGuard object goes out of scope, its destructor runs which
> unlocks the lock. You can only call this method given a reference to a
> MmapReadGuard, so you can only call it after calling mmap_read_lock
> and before its destructor runs.

I was wondering if the lock is ensured to be held.

Thanks for walking me through the way this works.

>=20
> > > > > +        let vma =3D unsafe { bindings::vma_lookup(self.mm.as_raw=
(), vma_addr) };
> > > > > +
> > > > > +        if vma.is_null() {
> > > > > +            None
> > > > > +        } else {
> > > > > +            // SAFETY: We just checked that a vma was found, so =
the pointer is valid. Furthermore,
> > > > > +            // the returned area will borrow from this read lock=
 guard, so it can only be used
> > > > > +            // while the mmap read lock is still held.
> > > >
> > > > So We have complicated the locking of the vmas with rcu and per-vma
> > > > locking recently.  We are now able to look up and use a vma under t=
he
> > > > rcu read lock.  Does this translate to rust model?
> > > >
> > > > I believe this is true in recent version of binder as well?
> > >
> > > Yes. The safety requirements of VmAreaRef is that you must hold the
> > > mmap read lock *or* the vma read lock while you have a VmAreaRef
> > > reference. This particular method achieves that requirement by holdin=
g
> > > the mmap read lock. But there is also a Rust lock_vma_under_rcu(), se=
e
> > > patch 4 for that.
> >
> > Right, okay.  Thanks.  You can get the reference by only holding the rc=
u
> > read lock, but you should hold the vma lock to ensure that the vma
> > itself (and not just the pointer) is safe to use.
>=20
> Hmm... To modify the vma, you must hold the mmap *and* vma write lock,
> so holding the mmap read lock prevents mutations?

Sorry, I think I confused things with my answer.  Your code is fine.
The phrasing of the "only be used while the mmap read lock is still
held" made me wonder about further clarification on the locking here
(because the locking is confusing).

Yes, mmap read lock means there are no writers that can modify the vma.
Essentially, you are using the lock to ensure the entire vma space isn't
changed during your operation - which is heavier than just locking one
vma.

> Is the mmap read
> lock not enough to read from the vma?

Yes, it's enough.

The vma write lock is needed to ensure there is no race between an rcu
reader using the vma and the mmap writer modifying the vma.  This is
done using the vma lock.

I am confident you already knew this and I'm just saying it now for
people who find this conversation on the mailing list.

...

Thanks,
Liam
