Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060DD2DFA38
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788651; cv=fail; b=lu21nJXPW1A/LqCeltAEvM3CWMraZl+y+FU5el9C3XrupghxE0RLhnZeMUAMMg9TdT+qmtAiuwcHTQkfWl6BxmYiK+ZRFAx+75GZgeNxDlyfHtjV+lMZXi4nIbVwdne5fTyL7RdhdYsKu8mhvQwSJ5QWIEG9NR7ROmLrnhegbsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788651; c=relaxed/simple;
	bh=JILWWrfxVhaAqzk0iat2SY6emcQ1YwG3NJwVTxzQWGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Nycir8oOKjdudkKQ9zJLfR0m3E8RVS0INzQrr153d1ZIBuTrw+p7FmL0bMym4R4/BhuYYtR9Yri88zSN6ZaZGk0h/oMJ5kSSFuS5EJjR4CpiNC4f0McEA8pgVEyf6GYiXrlk5z6DtUhpIcj916u4E/wjo0XvTx08zaPFE0niHGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PkmG9rJA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eQWwTbaH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PkmG9rJA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eQWwTbaH"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FMNrIx010301;
	Wed, 16 Apr 2025 07:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=KLs1CYzCgpJqDV1byUU6IS71wuXd30USTVYOjc9mZfA=; b=
	PkmG9rJApq5Y7oYyxxKmrOmQJA5Kqx1ipYSXCXb87gfQGPtq63272nHs7Wwa25CB
	KqNx5i+NoEAnfmwIPEVJs05PPavqsO72E3oYuM+wDr2oJV+vbZYI7Cjlhs1USJiB
	3aroGXRRnkxKRkT3kIjIR0tS1NNmxyHm9LKLi6USqq74/jvmKbr5WhIsCWWQcMEl
	7Y+GZqXZqYgWkYSoseDBM8IwVTl9bb7f95CnH3jFDNyw/FiFRPXvYlZ+2zY/F85h
	wsuKZf8w2voKjhooGWsKxg+5sYhojxZ5CDIgsnpnlEmMq463Gzif49InxoK+kUXx
	wcoB2KCMSEwer38Rw4o+iA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 461944b84n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:30:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53G6YVbk038823;
	Wed, 16 Apr 2025 07:30:27 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4sgqfd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 07:30:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1puApMagl3k0ewBJTrroDpgCfyB1PELJd8E/z5hfdYej8RfkpYkKxAbZNsqIpLE8dMRYDjwrRlA8u41AY/4vfx8JC7xuHiMX+lgqtqb8DEu0V+tcOHnS37OOTepvwRb0dUQAD/Iz/acP6iDop6JDsAwlGlvPRdCY2tJl0X2nUlYwNtVMRTe7pU27Yy1WUmHePRAPhbMr2oJkRwBXlmlMSCu1ERXzSF0Wfh+r/t9uxeeCzhKU9JJjmksriXnK/Gl+ykC3Gg64bFHLrv2TpShvIcbBh9HgQ10nv0V0kycE9NCXQSSPLgIcE712H1L2SXWDdSaLcoc1QebYSGFf+d3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLs1CYzCgpJqDV1byUU6IS71wuXd30USTVYOjc9mZfA=;
 b=tA1VMavE0y82iMD3vR5Aobc2m+oJLNJv61/OD8V3k0MNKJiTdh+CkFsZr6F1lXalOyXrMtbIuMB2cXRVc9zhijw0uXgCvVmHbjJfHDWTPY0BlKLBfWOCSxvDNRyo8fmaLgiFt+h/5uhbb4Yr8YpegLifusVOwSuUrWPRxh8ME0/1KvoWhceYkGVvWzK+3wE9bNt4Vp3P5sA2Z2OXnPWOpy0iwo4qADC1UAWYREjwHpKROOGo2RIQU/2f7TBfHTfoYOfXiFhe4maqqt40lE5Ns38TtThIKi9z/YkidCZcQFTuYAkux7uUKU/fBjogT46El8GIY5ct8Qr/08ybY8dc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLs1CYzCgpJqDV1byUU6IS71wuXd30USTVYOjc9mZfA=;
 b=eQWwTbaHmlaijUwnt+lmp7GvFSCo1poHqZohkWzWvoNIIZDh4F4waMdznOlwRiqO3zZjP0Gq+MAvHxaE9S7Weom9WJ/eLqGYFylKMuKxuikPITVZHXLMcjRnn8G+kqjGGS3uzHPWtAwhGpKiEDn3W6IXq0wNr9DIRj5FZlbRSRc=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB7367.namprd10.prod.outlook.com (2603:10b6:930:7a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 07:30:24 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 07:30:24 +0000
Date: Wed, 16 Apr 2025 08:30:22 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        SeongJae Park <sj@kernel.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 1/2] mm: move mmap/vma locking logic into specific files
Message-ID: <3920e046-7135-4a94-b523-1000afaaa56e@lucifer.local>
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
 <acd557ff58c49aec6a83955b62de026687a79fa9.1744720574.git.lorenzo.stoakes@oracle.com>
 <CAJuCfpHg8ru9a3jQFaGRqJA0hpTODXXstqbLAJqy7bH9RfpE7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpHg8ru9a3jQFaGRqJA0hpTODXXstqbLAJqy7bH9RfpE7Q@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0276.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::24) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b5bb862-81ed-41bd-61f2-08dd7cb88d86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFE4VXFWNVdNc3VVUzllc0FFU0VtL0dQQ2xvbDJmZEhuWTh0Z2t3aUZNSnBX?=
 =?utf-8?B?a0NocjUvdW5WcTllODRodWFJeXBoUTRERzBHSVljZlVUYWU2QitESGdoSVg4?=
 =?utf-8?B?WWwvMlpMY1pyYmtIcjF2NVUyRk0rM3ZHblRvRWFjdjRwYlV3ZmhRdVl5ajFa?=
 =?utf-8?B?L0lHR2RFRHBzU2s5aXpVVnFOeWI3QVVYbVAyUUZZTW03MS96elRwaERFbWcv?=
 =?utf-8?B?OENkSWVIemI5VSs5UnNXc05EeFIyZk90MVBYamdUYkxhdW9yTWV6Vm5leUhE?=
 =?utf-8?B?VnB3Qi9SWnN6d1l2QkJLK0NCQUZ4VGxFY0c1WEZQU1pzQzNDNEF4QmJJc204?=
 =?utf-8?B?Y2Q3cVhLWjZwMEtha2pGTjZEZUJqS2NLR0NyMnFzbVVVVWoyVHYyOHI2ZjQ3?=
 =?utf-8?B?Znd2ZnRyUnVjd29GMnVsRi9IVHJucHlPazJHSFZnaFRVb3NMbHNCdUw4Q2t5?=
 =?utf-8?B?dXpqUS9Wc3VlQkxZWGsyZG1lR2NMZm9Zb1gxeHdET0Y4TTBvSDZmb2ltSW50?=
 =?utf-8?B?WGxMNkpCVzhDS3hOVVRFL2h3WnNDbGFiSGdhRXN2L3ZQRzUybE92R1BNcE8z?=
 =?utf-8?B?SGwzZ1R1SGNod3JtOUszVDZ2TFR1Qk5kcnVJblQvME1ZYmtkRGpodVNweXdO?=
 =?utf-8?B?MGdEVUxodnlSTnM0TEVJNmlYQUFmMEE4SXNkc3AyTGNpTW11SFU4V0h0eGpU?=
 =?utf-8?B?aHhSUXh5NHI1NU5vS3FsNFdESzNqYnlYU09wUEN0R0xHY1N1VU1tNDU0ekxq?=
 =?utf-8?B?VSs2QkttODhacXdPb1lETC9SNW41RUczT08wclU5bzRzSkI3UWNCb1BtcFdN?=
 =?utf-8?B?NVBiMzE1VUhHN2phRkx5K3Q4S210eDcrUjcwdk53WkUzc2hWL1VJNHZGdHhI?=
 =?utf-8?B?RFl0dkp1SXU1aS8zS0p3NHkrbjA5UGs2b1E2YjZ2TGZzckhZZERSTm5VSWZ2?=
 =?utf-8?B?YTBNcUg3OWdHL2UxTjJqUzdmZlhVUDM4SG9WQVcvSjVnT1A5dk96cXhTY21C?=
 =?utf-8?B?Y0x4K0xIL1VDMm5uQ2xqTHJ0dEJUNU1SMElkaFJJR3FyRFZtTTMvTkNBVXVS?=
 =?utf-8?B?S2lHejBDZ0lyRUxudlgyZS9WblhUdnBGS3pYamJvWS9ZZm4xaHppQWY1RkZU?=
 =?utf-8?B?a0Rub3phUnNZS3RRQ2NPS1VoREtWL1lnNlRPQXpVNXdCa0RNVFFoWTBQZXVi?=
 =?utf-8?B?bUk0M25pdXg5UnlNNE9BT25keS92eUcwVDNLUG9MM2dyTTRzUzRKeWI4K3Bn?=
 =?utf-8?B?MHczQ0pLS2haa3lLTDFBcXdOOXRzdHlQTlMzSzBhWE1tTUQyTXQxL09lcmty?=
 =?utf-8?B?c1RRT0QyTktGQ04wMDY3c2cvaStIaWRUMVB4RXByTGpPeVBXeFpRRG1FbXV0?=
 =?utf-8?B?OEdHTG1qUSt2S3JZRGo4cE94MWc3OHE1bnoyMkhaOCtQOWVLTStwbGR1bU55?=
 =?utf-8?B?bDYxYS95bUVxczlWQ0lwS1RINExTKzFnb3JISnIwSXRaWVBMZjY1N0xoTEpo?=
 =?utf-8?B?dlA0R0dJYUx0cUovTnk4cWRDdjgwaHkrU3FpK0k2TWppb2VLZkZJSE0zRXQw?=
 =?utf-8?B?VnRLNC9nUnNJSytDekVTWkwxaWlzSjc1Q0xmSHIydG5oNDNCSHFEUEpwTUNP?=
 =?utf-8?B?eERQRzJUeHFObWZWQ09sMVkrbGszZEpzdDFaKzVBNFdpWmJQTEVPSC9XNVhM?=
 =?utf-8?B?ZUFyZkxoMkxEdnBROW1NVlBwQWYvOGJja1pvcXVUZktTck56WGpRVDJoUGZK?=
 =?utf-8?B?MklCQkVMOVg2Z1JRSldsUlVXeUs3cEl5QzNMZXMvTjJOQ0MwYW1aeStFZ1Ny?=
 =?utf-8?B?Z011cFJ1ekhvZEs3SndxS2FHM0VaZVlOOHlXY2RrWW95RWlmV3FRVUVDNktp?=
 =?utf-8?B?aXhaVHU3NnUyTzA1Y3FZS3VDWjd4dzhHM0FGcUVlaTZOVndkTTk3TVdBUUx6?=
 =?utf-8?Q?v1jA0sDrl3g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnVoNVRPaGVzNmhvZndWeUlmR0d0Y2N4RnpEUHJyajQ4VXlnQ251bVhtVm56?=
 =?utf-8?B?c2VxK1M1Z0NHbkIyeHdaWThGQ1Z5RE9zMjVkbW8wWStMdFhFQUMrUFp6eUlm?=
 =?utf-8?B?T3Jsc1NCSUdwN1E0MUpKT3BNYU1pQ0Nac2JGb0puN2dRVjkyeGNGdllWdm9z?=
 =?utf-8?B?WnNzcjVmU0VieW01bTJrTC9RQ0VYSjEvdEhlYS9zWHIrUng3SHhwMmR3S1dL?=
 =?utf-8?B?d0dJV1J0cEhRUjM4VnNlQUFuSWM4WHJqL3lFdXYrUlVFckNYaHphNGxPNkp3?=
 =?utf-8?B?cmJ2MVpCTnY3M3kxcHF2cHlscEJWYUFrbm14Zmt5eityNEtRSEpqeTNsYldt?=
 =?utf-8?B?NU1kdE1SK2dqNnVneFdvUDRuUWVMN2wxNW1EVnQ4NFJYQmNvYTVUeHFmNk1V?=
 =?utf-8?B?ZXVEMlJwSFo1V3oyMVhES3hJZStJM1hhd0EvSXkxbVhSdUI4NmRTNlJuK3hU?=
 =?utf-8?B?alFZN0N2TVlRMUp3ZU1mUFhLOEE3QndKd1k4TFJ3VzcrMGtyRFlXZjM5ZGY0?=
 =?utf-8?B?NFZYSU9hNitNVnhPVGxNcWE0YXdXT0dsK1hpa01WeUZZdzZFSlp5WnZvY1JI?=
 =?utf-8?B?eXFGZHJpYVd5QzRXTWdQTVNzNTdkdkhGNTJzRzMvTEovemxKajlDN2g4S2dF?=
 =?utf-8?B?MmRNQm9QSzRvYVFyYXJncmlkWmxNTUZaVVNYeTR6aVlPSTFTNElVQ253TTlw?=
 =?utf-8?B?TENqbmFhaVQvTlY5S2I4RHlUcmtwSVF0VEdvVm9KUmxaV3hSR0E1Rkp4NW1S?=
 =?utf-8?B?V094d2hKMncxQkV3M0swcEZGK3NNWHBubzc3ODl5NjNwRUl5MmdoZmdBZ1VL?=
 =?utf-8?B?UWtDSUZTMktER1VSU0pNZWMyRlRuZXdmQXJKbFlGSllNMTVZOVFPR1N5Z1Uy?=
 =?utf-8?B?U0lsYmowWWZFWTJtdFJjTThTQkp0b25keHJXLzRzUHlFdWoxVjloZUpzdE1p?=
 =?utf-8?B?SHBVQ1ozZWdHSVY0bERkRXhTb2p2T1BuVGpNQlJEZE5vS1BLSDBOWEN1V2lu?=
 =?utf-8?B?R0N5VnA2Z2JIQXY2WDIyckJTalI2NVAyL1hBalZZdWdkYUZGMzVETnBwOEZq?=
 =?utf-8?B?Y3RNTmcxV3lkU0pEQjB5bk96bXhBWWIvaUhNRzNkRU1hMG1ZMzRoazU3SllC?=
 =?utf-8?B?WUI0NFluNkFtSnJRcWwxUnAvQ0lkTmNkLzJ6S05zOWxzSDFZSytPQUZrRjNz?=
 =?utf-8?B?azIxbUpEVE5yOWZmc3pOWnRESDVjL2RjVUVscUNidWRrRHcvNUZwRkl5dDY3?=
 =?utf-8?B?dnI0QS9lMUhlMDFrU2d3dzJmNzlWZnY4byt0QUVSbFdXT2oyRy9IeDRJNEZF?=
 =?utf-8?B?d3oxaVM1VmwrUmFINU4vNkwveGVpL2Q0OCtSZjRkVkR1WlN4dm84T0ZLaDZw?=
 =?utf-8?B?dUNkMVhUcDdHRi9mbEtpRnZBNWJCTSt3ckNjOTA0MDFQNnMvQU1YZmZRci9n?=
 =?utf-8?B?VmlEd0hXa21lNTVLTnNXcU1oUWhsRU5zOHB2bERxKzMxNVZRdHRpQkttai83?=
 =?utf-8?B?NjgwZ2VBd2tlUysyV1g5cmhwWTlxaTIyeVVlTlRpeHVMLzBDWWpTZkx5SkJu?=
 =?utf-8?B?RC9kSnV3cFhyVlNkNVY3N0QxSFkrZHpnN0NoNjkxYUVJTnZlRmlQUVM5TGNR?=
 =?utf-8?B?WjA0Yk1BbjBFWmFxcnFhL2YxMENrQjhTenlWZXY1c3M2WHpVYVVCM0QwZjM2?=
 =?utf-8?B?bGtrU2dkVUlSTFlZUXdSUU5UcXlxSkFrZ2c3V29vc3VtYlp5Vm1odHY2MnIz?=
 =?utf-8?B?MFdZekZzc1ZNbkg1dXJ1elhjcHliVzFpSFZnU3hxcUFRYnZvZjlPZHFsWkt2?=
 =?utf-8?B?ODNOWFZhWjZVeFY2QVVYcXE5am9SR3hOVVJ6WnZiZ1psbUVXbWdQOG83L1dR?=
 =?utf-8?B?U0k3SGEra2VmbHRwa0xqc2xJaEt0UXpnMk81dWhTem81SitJSGJqVzFCQlVC?=
 =?utf-8?B?bFlHZ3FYL0o2ZDdFamRoT3N3YXpDRGt5RURvb0ZsaWZSOG9JZzFvTkl0azBh?=
 =?utf-8?B?WnNJOXdBTmVZaWNkQTNDc3Q2ZHNJSU1UTWRSTE9OdGVpN2djRWxBRFdyQTE2?=
 =?utf-8?B?Mlh6bVJmd1ZIbGNtY3oxV3kxN2p1UlBWL2ZPbXZWV3ZseHRyMEZJd3RrS1Jq?=
 =?utf-8?B?Vk02VHlyWXdFdnh0ZDZVODdWZmJJQzFrREthcmlOaU9UcUNBOTlNZTVmNjJW?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/EkzZT4NcqvvrU6nn1d58et1cMtITebtv3T0j3/ybBfKtxQ3XAngnhW1cPocm7pWjGygbnXeIzCtlVg25/wa3iDkpdMTxAHkEwsdPuoAh0sSMqw5dcHdkFdXjH1Vi1R9Yy2E/Wa4WWwBU/tSNzJPuR05VTNePKJmE2ACy4O0z4TvfUy8jEONT/I1eUAHLDbWt8qhxwxRccIPtf3gW6gXKKpobWpNYOAGSDyh0x4eikB1NbcHrpOUWPhcyDVfficiaigY4G6ktWrkZhSLCChXxqkklfcPrOLsrcOXn6Ybmp7KzIwsDOGk88FgSuklgk/sKA2BkqKY/2BMUZYegreFSw5D3aMTn9uH/zVY/KJniPS0Gcl9qKBiLc64IOLjUDwaxmKb6X6lrFabCkHQrLZbcycp2/wAtNqPsySaZFs2XoUooSt2gHyFk2v6TgiCRycK+dttdwW0Kq3c6+HJegQR10TbPpXqgAp/HtoF51aBkzns0KFAfjcvz3nRDKZCOr+AKW9b+Iu8a/I5tR9C8Km+gS6G2JdzK/9RHYlIDXAE40upcbhXtgIjI0P/mbX1ZBXipoFqKkZh5rsvARdPxxxkTHH8iIR401r5LJ57952ilic=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5bb862-81ed-41bd-61f2-08dd7cb88d86
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 07:30:24.8899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8zNZmCqk6/TL8gIehd64kzvS7z+YMjdixK3LR0yphLQsaJRovjbLvkD6+A1QgJK/0yo7nbU+7spcoqCwWoKFTEgt0d12IDecj4+gPARguo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7367
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504160060
X-Proofpoint-GUID: K-Mro8JkMQ6z17ksBWCbSUra68XZuWtt
X-Proofpoint-ORIG-GUID: K-Mro8JkMQ6z17ksBWCbSUra68XZuWtt

On Tue, Apr 15, 2025 at 09:06:46AM -0700, Suren Baghdasaryan wrote:
> On Tue, Apr 15, 2025 at 6:11 AM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
> >
> > Currently the VMA and mmap locking logic is entangled in two of the most
> > overwrought files in mm - include/linux/mm.h and mm/memory.c. Separate this
> > logic out so we can more easily make changes and create an appropriate
> > MAINTAINERS entry that spans only the logic relating to locking.
> >
> > This should have no functional change. Care is taken to avoid dependency
> > loops, we must regrettably keep release_fault_lock() and
> > assert_fault_locked() in mm.h as a result due to the dependence on the
> > vm_fault type.
> >
> > Additionally we must declare rcuwait_wake_up() manually to avoid a
> > dependency cycle on linux/rcuwait.h.
>
> The king of refactoring strikes again :)

Haha of course, of course! ;)

> On a serious note, thanks a lot for doing this! The code is much more
> organized this way IMO.

Thanks!

> I noticed a couple nits (see below) but otherwise LGTM. With those
> addressed feel free to add:
>
> Reviewed-by: Suren Baghdasaryan <surenb@google.com>

Thanks.

>
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  include/linux/mm.h        | 231 +---------------------------------
> >  include/linux/mmap_lock.h | 227 +++++++++++++++++++++++++++++++++
> >  mm/memory.c               | 252 -------------------------------------
> >  mm/mmap_lock.c            | 255 ++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 486 insertions(+), 479 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 5eb0d77c4438..9b701cfbef22 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -671,204 +671,11 @@ static inline void vma_numab_state_init(struct vm_area_struct *vma) {}
> >  static inline void vma_numab_state_free(struct vm_area_struct *vma) {}
> >  #endif /* CONFIG_NUMA_BALANCING */
> >
> > -#ifdef CONFIG_PER_VMA_LOCK
> > -static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt)
> > -{
> > -#ifdef CONFIG_DEBUG_LOCK_ALLOC
> > -       static struct lock_class_key lockdep_key;
> > -
> > -       lockdep_init_map(&vma->vmlock_dep_map, "vm_lock", &lockdep_key, 0);
> > -#endif
> > -       if (reset_refcnt)
> > -               refcount_set(&vma->vm_refcnt, 0);
> > -       vma->vm_lock_seq = UINT_MAX;
> > -}
> > -
> > -static inline bool is_vma_writer_only(int refcnt)
> > -{
> > -       /*
> > -        * With a writer and no readers, refcnt is VMA_LOCK_OFFSET if the vma
> > -        * is detached and (VMA_LOCK_OFFSET + 1) if it is attached. Waiting on
> > -        * a detached vma happens only in vma_mark_detached() and is a rare
> > -        * case, therefore most of the time there will be no unnecessary wakeup.
> > -        */
> > -       return refcnt & VMA_LOCK_OFFSET && refcnt <= VMA_LOCK_OFFSET + 1;
> > -}
> > -
> > -static inline void vma_refcount_put(struct vm_area_struct *vma)
> > -{
> > -       /* Use a copy of vm_mm in case vma is freed after we drop vm_refcnt */
> > -       struct mm_struct *mm = vma->vm_mm;
> > -       int oldcnt;
> > -
> > -       rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> > -       if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
> > -
> > -               if (is_vma_writer_only(oldcnt - 1))
> > -                       rcuwait_wake_up(&mm->vma_writer_wait);
> > -       }
> > -}
> > -
> > -/*
> > - * Try to read-lock a vma. The function is allowed to occasionally yield false
> > - * locked result to avoid performance overhead, in which case we fall back to
> > - * using mmap_lock. The function should never yield false unlocked result.
> > - * False locked result is possible if mm_lock_seq overflows or if vma gets
> > - * reused and attached to a different mm before we lock it.
> > - * Returns the vma on success, NULL on failure to lock and EAGAIN if vma got
> > - * detached.
> > - */
> > -static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
> > -                                                   struct vm_area_struct *vma)
> > -{
> > -       int oldcnt;
> > -
> > -       /*
> > -        * Check before locking. A race might cause false locked result.
> > -        * We can use READ_ONCE() for the mm_lock_seq here, and don't need
> > -        * ACQUIRE semantics, because this is just a lockless check whose result
> > -        * we don't rely on for anything - the mm_lock_seq read against which we
> > -        * need ordering is below.
> > -        */
> > -       if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
> > -               return NULL;
> > -
> > -       /*
> > -        * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited_acquire()
> > -        * will fail because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
> > -        * Acquire fence is required here to avoid reordering against later
> > -        * vm_lock_seq check and checks inside lock_vma_under_rcu().
> > -        */
> > -       if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
> > -                                                             VMA_REF_LIMIT))) {
> > -               /* return EAGAIN if vma got detached from under us */
> > -               return oldcnt ? NULL : ERR_PTR(-EAGAIN);
> > -       }
> > -
> > -       rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
> > -       /*
> > -        * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
> > -        * False unlocked result is impossible because we modify and check
> > -        * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
> > -        * modification invalidates all existing locks.
> > -        *
> > -        * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
> > -        * racing with vma_end_write_all(), we only start reading from the VMA
> > -        * after it has been unlocked.
> > -        * This pairs with RELEASE semantics in vma_end_write_all().
> > -        */
> > -       if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
> > -               vma_refcount_put(vma);
> > -               return NULL;
> > -       }
> > -
> > -       return vma;
> > -}
> > -
> > -/*
> > - * Use only while holding mmap read lock which guarantees that locking will not
> > - * fail (nobody can concurrently write-lock the vma). vma_start_read() should
> > - * not be used in such cases because it might fail due to mm_lock_seq overflow.
> > - * This functionality is used to obtain vma read lock and drop the mmap read lock.
> > - */
> > -static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
> > -{
> > -       int oldcnt;
> > -
> > -       mmap_assert_locked(vma->vm_mm);
> > -       if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
> > -                                                             VMA_REF_LIMIT)))
> > -               return false;
> > -
> > -       rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
> > -       return true;
> > -}
> > -
> > -/*
> > - * Use only while holding mmap read lock which guarantees that locking will not
> > - * fail (nobody can concurrently write-lock the vma). vma_start_read() should
> > - * not be used in such cases because it might fail due to mm_lock_seq overflow.
> > - * This functionality is used to obtain vma read lock and drop the mmap read lock.
> > - */
> > -static inline bool vma_start_read_locked(struct vm_area_struct *vma)
> > -{
> > -       return vma_start_read_locked_nested(vma, 0);
> > -}
> > -
> > -static inline void vma_end_read(struct vm_area_struct *vma)
> > -{
> > -       vma_refcount_put(vma);
> > -}
> > -
> > -/* WARNING! Can only be used if mmap_lock is expected to be write-locked */
> > -static bool __is_vma_write_locked(struct vm_area_struct *vma, unsigned int *mm_lock_seq)
> > -{
> > -       mmap_assert_write_locked(vma->vm_mm);
> > -
> > -       /*
> > -        * current task is holding mmap_write_lock, both vma->vm_lock_seq and
> > -        * mm->mm_lock_seq can't be concurrently modified.
> > -        */
> > -       *mm_lock_seq = vma->vm_mm->mm_lock_seq.sequence;
> > -       return (vma->vm_lock_seq == *mm_lock_seq);
> > -}
> > -
> > -void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq);
> > -
> > -/*
> > - * Begin writing to a VMA.
> > - * Exclude concurrent readers under the per-VMA lock until the currently
> > - * write-locked mmap_lock is dropped or downgraded.
> > - */
> > -static inline void vma_start_write(struct vm_area_struct *vma)
> > -{
> > -       unsigned int mm_lock_seq;
> > -
> > -       if (__is_vma_write_locked(vma, &mm_lock_seq))
> > -               return;
> > -
> > -       __vma_start_write(vma, mm_lock_seq);
> > -}
> > -
> > -static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> > -{
> > -       unsigned int mm_lock_seq;
> > -
> > -       VM_BUG_ON_VMA(!__is_vma_write_locked(vma, &mm_lock_seq), vma);
> > -}
> > -
> > -static inline void vma_assert_locked(struct vm_area_struct *vma)
> > -{
> > -       unsigned int mm_lock_seq;
> > -
> > -       VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt) <= 1 &&
> > -                     !__is_vma_write_locked(vma, &mm_lock_seq), vma);
> > -}
> > -
> >  /*
> > - * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
> > - * assertions should be made either under mmap_write_lock or when the object
> > - * has been isolated under mmap_write_lock, ensuring no competing writers.
> > + * These must be here rather than mmap_lock.h as dependent on vm_fault type,
> > + * declared in this header.
> >   */
> > -static inline void vma_assert_attached(struct vm_area_struct *vma)
> > -{
> > -       WARN_ON_ONCE(!refcount_read(&vma->vm_refcnt));
> > -}
> > -
> > -static inline void vma_assert_detached(struct vm_area_struct *vma)
> > -{
> > -       WARN_ON_ONCE(refcount_read(&vma->vm_refcnt));
> > -}
> > -
> > -static inline void vma_mark_attached(struct vm_area_struct *vma)
> > -{
> > -       vma_assert_write_locked(vma);
> > -       vma_assert_detached(vma);
> > -       refcount_set_release(&vma->vm_refcnt, 1);
> > -}
> > -
> > -void vma_mark_detached(struct vm_area_struct *vma);
> > -
> > +#ifdef CONFIG_PER_VMA_LOCK
> >  static inline void release_fault_lock(struct vm_fault *vmf)
> >  {
> >         if (vmf->flags & FAULT_FLAG_VMA_LOCK)
> > @@ -884,36 +691,7 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
> >         else
> >                 mmap_assert_locked(vmf->vma->vm_mm);
> >  }
> > -
> > -struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> > -                                         unsigned long address);
> > -
> > -#else /* CONFIG_PER_VMA_LOCK */
> > -
> > -static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt) {}
> > -static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
> > -                                                   struct vm_area_struct *vma)
> > -               { return NULL; }
> > -static inline void vma_end_read(struct vm_area_struct *vma) {}
> > -static inline void vma_start_write(struct vm_area_struct *vma) {}
> > -static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> > -               { mmap_assert_write_locked(vma->vm_mm); }
> > -static inline void vma_assert_attached(struct vm_area_struct *vma) {}
> > -static inline void vma_assert_detached(struct vm_area_struct *vma) {}
> > -static inline void vma_mark_attached(struct vm_area_struct *vma) {}
> > -static inline void vma_mark_detached(struct vm_area_struct *vma) {}
> > -
> > -static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> > -               unsigned long address)
> > -{
> > -       return NULL;
> > -}
> > -
> > -static inline void vma_assert_locked(struct vm_area_struct *vma)
> > -{
> > -       mmap_assert_locked(vma->vm_mm);
> > -}
> > -
> > +#else
> >  static inline void release_fault_lock(struct vm_fault *vmf)
> >  {
> >         mmap_read_unlock(vmf->vma->vm_mm);
> > @@ -923,7 +701,6 @@ static inline void assert_fault_locked(struct vm_fault *vmf)
> >  {
> >         mmap_assert_locked(vmf->vma->vm_mm);
> >  }
> > -
> >  #endif /* CONFIG_PER_VMA_LOCK */
> >
> >  extern const struct vm_operations_struct vma_dummy_vm_ops;
> > diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> > index 4706c6769902..7983b2efe9bf 100644
> > --- a/include/linux/mmap_lock.h
> > +++ b/include/linux/mmap_lock.h
> > @@ -1,6 +1,10 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> >  #ifndef _LINUX_MMAP_LOCK_H
> >  #define _LINUX_MMAP_LOCK_H
> >
> > +/* Avoid a dependency loop by declaring here. */
> > +extern int rcuwait_wake_up(struct rcuwait *w);
> > +
> >  #include <linux/lockdep.h>
> >  #include <linux/mm_types.h>
> >  #include <linux/mmdebug.h>
> > @@ -104,6 +108,206 @@ static inline bool mmap_lock_speculate_retry(struct mm_struct *mm, unsigned int
> >         return read_seqcount_retry(&mm->mm_lock_seq, seq);
> >  }
> >
> > +static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt)
> > +{
> > +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> > +       static struct lock_class_key lockdep_key;
> > +
> > +       lockdep_init_map(&vma->vmlock_dep_map, "vm_lock", &lockdep_key, 0);
> > +#endif
> > +       if (reset_refcnt)
> > +               refcount_set(&vma->vm_refcnt, 0);
> > +       vma->vm_lock_seq = UINT_MAX;
> > +}
> > +
> > +static inline bool is_vma_writer_only(int refcnt)
> > +{
> > +       /*
> > +        * With a writer and no readers, refcnt is VMA_LOCK_OFFSET if the vma
> > +        * is detached and (VMA_LOCK_OFFSET + 1) if it is attached. Waiting on
> > +        * a detached vma happens only in vma_mark_detached() and is a rare
> > +        * case, therefore most of the time there will be no unnecessary wakeup.
> > +        */
> > +       return refcnt & VMA_LOCK_OFFSET && refcnt <= VMA_LOCK_OFFSET + 1;
> > +}
> > +
> > +static inline void vma_refcount_put(struct vm_area_struct *vma)
> > +{
> > +       /* Use a copy of vm_mm in case vma is freed after we drop vm_refcnt */
> > +       struct mm_struct *mm = vma->vm_mm;
> > +       int oldcnt;
> > +
> > +       rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> > +       if (!__refcount_dec_and_test(&vma->vm_refcnt, &oldcnt)) {
> > +
> > +               if (is_vma_writer_only(oldcnt - 1))
> > +                       rcuwait_wake_up(&mm->vma_writer_wait);
> > +       }
> > +}
> > +
> > +/*
> > + * Try to read-lock a vma. The function is allowed to occasionally yield false
> > + * locked result to avoid performance overhead, in which case we fall back to
> > + * using mmap_lock. The function should never yield false unlocked result.
> > + * False locked result is possible if mm_lock_seq overflows or if vma gets
> > + * reused and attached to a different mm before we lock it.
> > + * Returns the vma on success, NULL on failure to lock and EAGAIN if vma got
> > + * detached.
> > + */
> > +static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
> > +                                                   struct vm_area_struct *vma)
> > +{
> > +       int oldcnt;
> > +
> > +       /*
> > +        * Check before locking. A race might cause false locked result.
> > +        * We can use READ_ONCE() for the mm_lock_seq here, and don't need
> > +        * ACQUIRE semantics, because this is just a lockless check whose result
> > +        * we don't rely on for anything - the mm_lock_seq read against which we
> > +        * need ordering is below.
> > +        */
> > +       if (READ_ONCE(vma->vm_lock_seq) == READ_ONCE(mm->mm_lock_seq.sequence))
> > +               return NULL;
> > +
> > +       /*
> > +        * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited_acquire()
> > +        * will fail because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
> > +        * Acquire fence is required here to avoid reordering against later
> > +        * vm_lock_seq check and checks inside lock_vma_under_rcu().
> > +        */
> > +       if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
> > +                                                             VMA_REF_LIMIT))) {
> > +               /* return EAGAIN if vma got detached from under us */
> > +               return oldcnt ? NULL : ERR_PTR(-EAGAIN);
> > +       }
> > +
> > +       rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
> > +       /*
> > +        * Overflow of vm_lock_seq/mm_lock_seq might produce false locked result.
> > +        * False unlocked result is impossible because we modify and check
> > +        * vma->vm_lock_seq under vma->vm_refcnt protection and mm->mm_lock_seq
> > +        * modification invalidates all existing locks.
> > +        *
> > +        * We must use ACQUIRE semantics for the mm_lock_seq so that if we are
> > +        * racing with vma_end_write_all(), we only start reading from the VMA
> > +        * after it has been unlocked.
> > +        * This pairs with RELEASE semantics in vma_end_write_all().
> > +        */
> > +       if (unlikely(vma->vm_lock_seq == raw_read_seqcount(&mm->mm_lock_seq))) {
> > +               vma_refcount_put(vma);
> > +               return NULL;
> > +       }
> > +
> > +       return vma;
> > +}
> > +
> > +/*
> > + * Use only while holding mmap read lock which guarantees that locking will not
> > + * fail (nobody can concurrently write-lock the vma). vma_start_read() should
> > + * not be used in such cases because it might fail due to mm_lock_seq overflow.
> > + * This functionality is used to obtain vma read lock and drop the mmap read lock.
> > + */
> > +static inline bool vma_start_read_locked_nested(struct vm_area_struct *vma, int subclass)
> > +{
> > +       int oldcnt;
> > +
> > +       mmap_assert_locked(vma->vm_mm);
> > +       if (unlikely(!__refcount_inc_not_zero_limited_acquire(&vma->vm_refcnt, &oldcnt,
> > +                                                             VMA_REF_LIMIT)))
> > +               return false;
> > +
> > +       rwsem_acquire_read(&vma->vmlock_dep_map, 0, 1, _RET_IP_);
> > +       return true;
> > +}
> > +
> > +/*
> > + * Use only while holding mmap read lock which guarantees that locking will not
> > + * fail (nobody can concurrently write-lock the vma). vma_start_read() should
> > + * not be used in such cases because it might fail due to mm_lock_seq overflow.
> > + * This functionality is used to obtain vma read lock and drop the mmap read lock.
> > + */
> > +static inline bool vma_start_read_locked(struct vm_area_struct *vma)
> > +{
> > +       return vma_start_read_locked_nested(vma, 0);
> > +}
> > +
> > +static inline void vma_end_read(struct vm_area_struct *vma)
> > +{
> > +       vma_refcount_put(vma);
> > +}
> > +
> > +/* WARNING! Can only be used if mmap_lock is expected to be write-locked */
> > +static bool __is_vma_write_locked(struct vm_area_struct *vma, unsigned int *mm_lock_seq)
> > +{
> > +       mmap_assert_write_locked(vma->vm_mm);
> > +
> > +       /*
> > +        * current task is holding mmap_write_lock, both vma->vm_lock_seq and
> > +        * mm->mm_lock_seq can't be concurrently modified.
> > +        */
> > +       *mm_lock_seq = vma->vm_mm->mm_lock_seq.sequence;
> > +       return (vma->vm_lock_seq == *mm_lock_seq);
> > +}
> > +
> > +void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq);
> > +
> > +/*
> > + * Begin writing to a VMA.
> > + * Exclude concurrent readers under the per-VMA lock until the currently
> > + * write-locked mmap_lock is dropped or downgraded.
> > + */
> > +static inline void vma_start_write(struct vm_area_struct *vma)
> > +{
> > +       unsigned int mm_lock_seq;
> > +
> > +       if (__is_vma_write_locked(vma, &mm_lock_seq))
> > +               return;
> > +
> > +       __vma_start_write(vma, mm_lock_seq);
> > +}
> > +
> > +static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> > +{
> > +       unsigned int mm_lock_seq;
> > +
> > +       VM_BUG_ON_VMA(!__is_vma_write_locked(vma, &mm_lock_seq), vma);
> > +}
> > +
> > +static inline void vma_assert_locked(struct vm_area_struct *vma)
> > +{
> > +       unsigned int mm_lock_seq;
> > +
> > +       VM_BUG_ON_VMA(refcount_read(&vma->vm_refcnt) <= 1 &&
> > +                     !__is_vma_write_locked(vma, &mm_lock_seq), vma);
> > +}
> > +
> > +/*
> > + * WARNING: to avoid racing with vma_mark_attached()/vma_mark_detached(), these
> > + * assertions should be made either under mmap_write_lock or when the object
> > + * has been isolated under mmap_write_lock, ensuring no competing writers.
> > + */
> > +static inline void vma_assert_attached(struct vm_area_struct *vma)
> > +{
> > +       WARN_ON_ONCE(!refcount_read(&vma->vm_refcnt));
> > +}
> > +
> > +static inline void vma_assert_detached(struct vm_area_struct *vma)
> > +{
> > +       WARN_ON_ONCE(refcount_read(&vma->vm_refcnt));
> > +}
> > +
> > +static inline void vma_mark_attached(struct vm_area_struct *vma)
> > +{
> > +       vma_assert_write_locked(vma);
> > +       vma_assert_detached(vma);
> > +       refcount_set_release(&vma->vm_refcnt, 1);
> > +}
> > +
> > +void vma_mark_detached(struct vm_area_struct *vma);
> > +
> > +struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> > +                                         unsigned long address);
> > +
> >  #else /* CONFIG_PER_VMA_LOCK */
> >
> >  static inline void mm_lock_seqcount_init(struct mm_struct *mm) {}
> > @@ -119,6 +323,29 @@ static inline bool mmap_lock_speculate_retry(struct mm_struct *mm, unsigned int
> >  {
> >         return true;
> >  }
> > +static inline void vma_lock_init(struct vm_area_struct *vma, bool reset_refcnt) {}
> > +static inline struct vm_area_struct *vma_start_read(struct mm_struct *mm,
> > +                                                   struct vm_area_struct *vma)
> > +               { return NULL; }
> > +static inline void vma_end_read(struct vm_area_struct *vma) {}
> > +static inline void vma_start_write(struct vm_area_struct *vma) {}
> > +static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> > +               { mmap_assert_write_locked(vma->vm_mm); }
> > +static inline void vma_assert_attached(struct vm_area_struct *vma) {}
> > +static inline void vma_assert_detached(struct vm_area_struct *vma) {}
> > +static inline void vma_mark_attached(struct vm_area_struct *vma) {}
> > +static inline void vma_mark_detached(struct vm_area_struct *vma) {}
> > +
> > +static inline struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> > +               unsigned long address)
> > +{
> > +       return NULL;
> > +}
> > +
> > +static inline void vma_assert_locked(struct vm_area_struct *vma)
> > +{
> > +       mmap_assert_locked(vma->vm_mm);
> > +}
> >
> >  #endif /* CONFIG_PER_VMA_LOCK */
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 688f3612e16d..35cfc91d5a2e 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -6378,258 +6378,6 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
> >  }
> >  EXPORT_SYMBOL_GPL(handle_mm_fault);
> >
> > -#ifdef CONFIG_LOCK_MM_AND_FIND_VMA
> > -#include <linux/extable.h>
> > -
> > -static inline bool get_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
> > -{
> > -       if (likely(mmap_read_trylock(mm)))
> > -               return true;
> > -
> > -       if (regs && !user_mode(regs)) {
> > -               unsigned long ip = exception_ip(regs);
> > -               if (!search_exception_tables(ip))
> > -                       return false;
> > -       }
> > -
> > -       return !mmap_read_lock_killable(mm);
> > -}
> > -
> > -static inline bool mmap_upgrade_trylock(struct mm_struct *mm)
> > -{
> > -       /*
> > -        * We don't have this operation yet.
> > -        *
> > -        * It should be easy enough to do: it's basically a
> > -        *    atomic_long_try_cmpxchg_acquire()
> > -        * from RWSEM_READER_BIAS -> RWSEM_WRITER_LOCKED, but
> > -        * it also needs the proper lockdep magic etc.
> > -        */
> > -       return false;
> > -}
> > -
> > -static inline bool upgrade_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
> > -{
> > -       mmap_read_unlock(mm);
> > -       if (regs && !user_mode(regs)) {
> > -               unsigned long ip = exception_ip(regs);
> > -               if (!search_exception_tables(ip))
> > -                       return false;
> > -       }
> > -       return !mmap_write_lock_killable(mm);
> > -}
> > -
> > -/*
> > - * Helper for page fault handling.
> > - *
> > - * This is kind of equivalent to "mmap_read_lock()" followed
> > - * by "find_extend_vma()", except it's a lot more careful about
> > - * the locking (and will drop the lock on failure).
> > - *
> > - * For example, if we have a kernel bug that causes a page
> > - * fault, we don't want to just use mmap_read_lock() to get
> > - * the mm lock, because that would deadlock if the bug were
> > - * to happen while we're holding the mm lock for writing.
> > - *
> > - * So this checks the exception tables on kernel faults in
> > - * order to only do this all for instructions that are actually
> > - * expected to fault.
> > - *
> > - * We can also actually take the mm lock for writing if we
> > - * need to extend the vma, which helps the VM layer a lot.
> > - */
> > -struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
> > -                       unsigned long addr, struct pt_regs *regs)
> > -{
> > -       struct vm_area_struct *vma;
> > -
> > -       if (!get_mmap_lock_carefully(mm, regs))
> > -               return NULL;
> > -
> > -       vma = find_vma(mm, addr);
> > -       if (likely(vma && (vma->vm_start <= addr)))
> > -               return vma;
> > -
> > -       /*
> > -        * Well, dang. We might still be successful, but only
> > -        * if we can extend a vma to do so.
> > -        */
> > -       if (!vma || !(vma->vm_flags & VM_GROWSDOWN)) {
> > -               mmap_read_unlock(mm);
> > -               return NULL;
> > -       }
> > -
> > -       /*
> > -        * We can try to upgrade the mmap lock atomically,
> > -        * in which case we can continue to use the vma
> > -        * we already looked up.
> > -        *
> > -        * Otherwise we'll have to drop the mmap lock and
> > -        * re-take it, and also look up the vma again,
> > -        * re-checking it.
> > -        */
> > -       if (!mmap_upgrade_trylock(mm)) {
> > -               if (!upgrade_mmap_lock_carefully(mm, regs))
> > -                       return NULL;
> > -
> > -               vma = find_vma(mm, addr);
> > -               if (!vma)
> > -                       goto fail;
> > -               if (vma->vm_start <= addr)
> > -                       goto success;
> > -               if (!(vma->vm_flags & VM_GROWSDOWN))
> > -                       goto fail;
> > -       }
> > -
> > -       if (expand_stack_locked(vma, addr))
> > -               goto fail;
> > -
> > -success:
> > -       mmap_write_downgrade(mm);
> > -       return vma;
> > -
> > -fail:
> > -       mmap_write_unlock(mm);
> > -       return NULL;
> > -}
> > -#endif
> > -
> > -#ifdef CONFIG_PER_VMA_LOCK
> > -static inline bool __vma_enter_locked(struct vm_area_struct *vma, bool detaching)
> > -{
> > -       unsigned int tgt_refcnt = VMA_LOCK_OFFSET;
> > -
> > -       /* Additional refcnt if the vma is attached. */
> > -       if (!detaching)
> > -               tgt_refcnt++;
> > -
> > -       /*
> > -        * If vma is detached then only vma_mark_attached() can raise the
> > -        * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attached().
> > -        */
> > -       if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
> > -               return false;
> > -
> > -       rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> > -       rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
> > -                  refcount_read(&vma->vm_refcnt) == tgt_refcnt,
> > -                  TASK_UNINTERRUPTIBLE);
> > -       lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> > -
> > -       return true;
> > -}
> > -
> > -static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *detached)
> > -{
> > -       *detached = refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_refcnt);
> > -       rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> > -}
> > -
> > -void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
> > -{
> > -       bool locked;
> > -
> > -       /*
> > -        * __vma_enter_locked() returns false immediately if the vma is not
> > -        * attached, otherwise it waits until refcnt is indicating that vma
> > -        * is attached with no readers.
> > -        */
> > -       locked = __vma_enter_locked(vma, false);
> > -
> > -       /*
> > -        * We should use WRITE_ONCE() here because we can have concurrent reads
> > -        * from the early lockless pessimistic check in vma_start_read().
> > -        * We don't really care about the correctness of that early check, but
> > -        * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
> > -        */
> > -       WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
> > -
> > -       if (locked) {
> > -               bool detached;
> > -
> > -               __vma_exit_locked(vma, &detached);
> > -               WARN_ON_ONCE(detached); /* vma should remain attached */
> > -       }
> > -}
> > -EXPORT_SYMBOL_GPL(__vma_start_write);
> > -
> > -void vma_mark_detached(struct vm_area_struct *vma)
> > -{
> > -       vma_assert_write_locked(vma);
> > -       vma_assert_attached(vma);
> > -
> > -       /*
> > -        * We are the only writer, so no need to use vma_refcount_put().
> > -        * The condition below is unlikely because the vma has been already
> > -        * write-locked and readers can increment vm_refcnt only temporarily
> > -        * before they check vm_lock_seq, realize the vma is locked and drop
> > -        * back the vm_refcnt. That is a narrow window for observing a raised
> > -        * vm_refcnt.
> > -        */
> > -       if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
> > -               /* Wait until vma is detached with no readers. */
> > -               if (__vma_enter_locked(vma, true)) {
> > -                       bool detached;
> > -
> > -                       __vma_exit_locked(vma, &detached);
> > -                       WARN_ON_ONCE(!detached);
> > -               }
> > -       }
> > -}
> > -
> > -/*
> > - * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
> > - * stable and not isolated. If the VMA is not found or is being modified the
> > - * function returns NULL.
> > - */
> > -struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> > -                                         unsigned long address)
> > -{
> > -       MA_STATE(mas, &mm->mm_mt, address, address);
> > -       struct vm_area_struct *vma;
> > -
> > -       rcu_read_lock();
> > -retry:
> > -       vma = mas_walk(&mas);
> > -       if (!vma)
> > -               goto inval;
> > -
> > -       vma = vma_start_read(mm, vma);
> > -       if (IS_ERR_OR_NULL(vma)) {
> > -               /* Check if the VMA got isolated after we found it */
> > -               if (PTR_ERR(vma) == -EAGAIN) {
> > -                       count_vm_vma_lock_event(VMA_LOCK_MISS);
> > -                       /* The area was replaced with another one */
> > -                       goto retry;
> > -               }
> > -
> > -               /* Failed to lock the VMA */
> > -               goto inval;
> > -       }
> > -       /*
> > -        * At this point, we have a stable reference to a VMA: The VMA is
> > -        * locked and we know it hasn't already been isolated.
> > -        * From here on, we can access the VMA without worrying about which
> > -        * fields are accessible for RCU readers.
> > -        */
> > -
> > -       /* Check if the vma we locked is the right one. */
> > -       if (unlikely(vma->vm_mm != mm ||
> > -                    address < vma->vm_start || address >= vma->vm_end))
> > -               goto inval_end_read;
> > -
> > -       rcu_read_unlock();
> > -       return vma;
> > -
> > -inval_end_read:
> > -       vma_end_read(vma);
> > -inval:
> > -       rcu_read_unlock();
> > -       count_vm_vma_lock_event(VMA_LOCK_ABORT);
> > -       return NULL;
> > -}
> > -#endif /* CONFIG_PER_VMA_LOCK */
> > -
> >  #ifndef __PAGETABLE_P4D_FOLDED
> >  /*
> >   * Allocate p4d page table.
> > diff --git a/mm/mmap_lock.c b/mm/mmap_lock.c
> > index e7dbaf96aa17..7e4a1f467a46 100644
> > --- a/mm/mmap_lock.c
> > +++ b/mm/mmap_lock.c
> > @@ -42,3 +42,258 @@ void __mmap_lock_do_trace_released(struct mm_struct *mm, bool write)
> >  }
> >  EXPORT_SYMBOL(__mmap_lock_do_trace_released);
> >  #endif /* CONFIG_TRACING */
> > +
> > +#ifdef CONFIG_MMU
>
> I think we should also move NOMMU version of lock_mm_and_find_vma()
> into this file and these #ifdefs will become:

Ugh wasn't aware it even existed. I really hate nommu... but sure will take
a look :)

>
> #ifdef CONFIG_PER_VMA_LOCK
> ...
> #endif /* CONFIG_PER_VMA_LOCK */
>
> #ifdef CONFIG_MMU
>     #ifdef CONFIG_LOCK_MM_AND_FIND_VMA
>     // MMU version of lock_mm_and_find_vma() and helpers
>     #endif /* CONFIG_LOCK_MM_AND_FIND_VMA */
> #else /* CONFIG_MMU */
>     // NOMMU version of lock_mm_and_find_vma()
> #endif /* CONFIG_MMU */
>
> Note that CONFIG_PER_VMA_LOCK already depends on CONFIG_NOMMU.

Ack, but I prefer to be super explicit as nommu is such a giant pain...

>
> Also something I just noticed. Are we missing lock_mm_and_find_vma()
> implementation for CONFIG_MMU && !CONFIG_LOCK_MM_AND_FIND_VMA ? I'm
> guessing architectures with !CONFIG_STACK_GROWSUP just don't use this
> function?

Well since we never get reports about this presumably it's the case :>)

>
>
> > +#ifdef CONFIG_PER_VMA_LOCK
> > +static inline bool __vma_enter_locked(struct vm_area_struct *vma, bool detaching)
> > +{
> > +       unsigned int tgt_refcnt = VMA_LOCK_OFFSET;
> > +
> > +       /* Additional refcnt if the vma is attached. */
> > +       if (!detaching)
> > +               tgt_refcnt++;
> > +
> > +       /*
> > +        * If vma is detached then only vma_mark_attached() can raise the
> > +        * vm_refcnt. mmap_write_lock prevents racing with vma_mark_attached().
> > +        */
> > +       if (!refcount_add_not_zero(VMA_LOCK_OFFSET, &vma->vm_refcnt))
> > +               return false;
> > +
> > +       rwsem_acquire(&vma->vmlock_dep_map, 0, 0, _RET_IP_);
> > +       rcuwait_wait_event(&vma->vm_mm->vma_writer_wait,
> > +                  refcount_read(&vma->vm_refcnt) == tgt_refcnt,
> > +                  TASK_UNINTERRUPTIBLE);
> > +       lock_acquired(&vma->vmlock_dep_map, _RET_IP_);
> > +
> > +       return true;
> > +}
> > +
> > +static inline void __vma_exit_locked(struct vm_area_struct *vma, bool *detached)
> > +{
> > +       *detached = refcount_sub_and_test(VMA_LOCK_OFFSET, &vma->vm_refcnt);
> > +       rwsem_release(&vma->vmlock_dep_map, _RET_IP_);
> > +}
> > +
> > +void __vma_start_write(struct vm_area_struct *vma, unsigned int mm_lock_seq)
> > +{
> > +       bool locked;
> > +
> > +       /*
> > +        * __vma_enter_locked() returns false immediately if the vma is not
> > +        * attached, otherwise it waits until refcnt is indicating that vma
> > +        * is attached with no readers.
> > +        */
> > +       locked = __vma_enter_locked(vma, false);
> > +
> > +       /*
> > +        * We should use WRITE_ONCE() here because we can have concurrent reads
> > +        * from the early lockless pessimistic check in vma_start_read().
> > +        * We don't really care about the correctness of that early check, but
> > +        * we should use WRITE_ONCE() for cleanliness and to keep KCSAN happy.
> > +        */
> > +       WRITE_ONCE(vma->vm_lock_seq, mm_lock_seq);
> > +
> > +       if (locked) {
> > +               bool detached;
> > +
> > +               __vma_exit_locked(vma, &detached);
> > +               WARN_ON_ONCE(detached); /* vma should remain attached */
> > +       }
> > +}
> > +EXPORT_SYMBOL_GPL(__vma_start_write);
> > +
> > +void vma_mark_detached(struct vm_area_struct *vma)
> > +{
> > +       vma_assert_write_locked(vma);
> > +       vma_assert_attached(vma);
> > +
> > +       /*
> > +        * We are the only writer, so no need to use vma_refcount_put().
> > +        * The condition below is unlikely because the vma has been already
> > +        * write-locked and readers can increment vm_refcnt only temporarily
> > +        * before they check vm_lock_seq, realize the vma is locked and drop
> > +        * back the vm_refcnt. That is a narrow window for observing a raised
> > +        * vm_refcnt.
> > +        */
> > +       if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt))) {
> > +               /* Wait until vma is detached with no readers. */
> > +               if (__vma_enter_locked(vma, true)) {
> > +                       bool detached;
> > +
> > +                       __vma_exit_locked(vma, &detached);
> > +                       WARN_ON_ONCE(!detached);
> > +               }
> > +       }
> > +}
> > +
> > +/*
> > + * Lookup and lock a VMA under RCU protection. Returned VMA is guaranteed to be
> > + * stable and not isolated. If the VMA is not found or is being modified the
> > + * function returns NULL.
> > + */
> > +struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> > +                                         unsigned long address)
> > +{
> > +       MA_STATE(mas, &mm->mm_mt, address, address);
> > +       struct vm_area_struct *vma;
> > +
> > +       rcu_read_lock();
> > +retry:
> > +       vma = mas_walk(&mas);
> > +       if (!vma)
> > +               goto inval;
> > +
> > +       vma = vma_start_read(mm, vma);
> > +       if (IS_ERR_OR_NULL(vma)) {
> > +               /* Check if the VMA got isolated after we found it */
> > +               if (PTR_ERR(vma) == -EAGAIN) {
> > +                       count_vm_vma_lock_event(VMA_LOCK_MISS);
> > +                       /* The area was replaced with another one */
> > +                       goto retry;
> > +               }
> > +
> > +               /* Failed to lock the VMA */
> > +               goto inval;
> > +       }
> > +       /*
> > +        * At this point, we have a stable reference to a VMA: The VMA is
> > +        * locked and we know it hasn't already been isolated.
> > +        * From here on, we can access the VMA without worrying about which
> > +        * fields are accessible for RCU readers.
> > +        */
> > +
> > +       /* Check if the vma we locked is the right one. */
> > +       if (unlikely(vma->vm_mm != mm ||
> > +                    address < vma->vm_start || address >= vma->vm_end))
> > +               goto inval_end_read;
> > +
> > +       rcu_read_unlock();
> > +       return vma;
> > +
> > +inval_end_read:
> > +       vma_end_read(vma);
> > +inval:
> > +       rcu_read_unlock();
> > +       count_vm_vma_lock_event(VMA_LOCK_ABORT);
> > +       return NULL;
> > +}
> > +#endif /* CONFIG_PER_VMA_LOCK */
> > +
> > +#ifdef CONFIG_LOCK_MM_AND_FIND_VMA
> > +#include <linux/extable.h>
> > +
> > +static inline bool get_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
> > +{
> > +       if (likely(mmap_read_trylock(mm)))
> > +               return true;
> > +
> > +       if (regs && !user_mode(regs)) {
> > +               unsigned long ip = exception_ip(regs);
> > +               if (!search_exception_tables(ip))
> > +                       return false;
> > +       }
> > +
> > +       return !mmap_read_lock_killable(mm);
> > +}
> > +
> > +static inline bool mmap_upgrade_trylock(struct mm_struct *mm)
> > +{
> > +       /*
> > +        * We don't have this operation yet.
> > +        *
> > +        * It should be easy enough to do: it's basically a
> > +V       *    atomic_long_try_cmpxchg_acquire()
>
> Is the extra V above just the result of "Ctrl+V" gone bad?
>

Oops! Probably me paging through the code, C-v and M-v go forward and back
a page and it's easy to mis-hit... well for me :)

Will fix!

> > +        * from RWSEM_READER_BIAS -> RWSEM_WRITER_LOCKED, but
> > +        * it also needs the proper lockdep magic etc.
> > +        */
> > +       return false;
> > +}
> > +
> > +static inline bool upgrade_mmap_lock_carefully(struct mm_struct *mm, struct pt_regs *regs)
> > +{
> > +       mmap_read_unlock(mm);
> > +       if (regs && !user_mode(regs)) {
> > +               unsigned long ip = exception_ip(regs);
> > +               if (!search_exception_tables(ip))
> > +                       return false;
> > +       }
> > +       return !mmap_write_lock_killable(mm);
> > +}
> > +
> > +/*
> > + * Helper for page fault handling.
> > + *
> > + * This is kind of equivalent to "mmap_read_lock()" followed
> > + * by "find_extend_vma()", except it's a lot more careful about
> > + * the locking (and will drop the lock on failure).
> > + *
> > + * For example, if we have a kernel bug that causes a page
> > + * fault, we don't want to just use mmap_read_lock() to get
> > + * the mm lock, because that would deadlock if the bug were
> > + * to happen while we're holding the mm lock for writing.
> > + *
> > + * So this checks the exception tables on kernel faults in
> > + * order to only do this all for instructions that are actually
> > + * expected to fault.
> > + *
> > + * We can also actually take the mm lock for writing if we
> > + * need to extend the vma, which helps the VM layer a lot.
> > + */
> > +struct vm_area_struct *lock_mm_and_find_vma(struct mm_struct *mm,
> > +                       unsigned long addr, struct pt_regs *regs)
> > +{
> > +       struct vm_area_struct *vma;
> > +
> > +       if (!get_mmap_lock_carefully(mm, regs))
> > +               return NULL;
> > +
> > +       vma = find_vma(mm, addr);
> > +       if (likely(vma && (vma->vm_start <= addr)))
> > +               return vma;
> > +
> > +       /*
> > +        * Well, dang. We might still be successful, but only
> > +        * if we can extend a vma to do so.
> > +        */
> > +       if (!vma || !(vma->vm_flags & VM_GROWSDOWN)) {
> > +               mmap_read_unlock(mm);
> > +               return NULL;
> > +       }
> > +
> > +       /*
> > +        * We can try to upgrade the mmap lock atomically,
> > +        * in which case we can continue to use the vma
> > +        * we already looked up.
> > +        *
> > +        * Otherwise we'll have to drop the mmap lock and
> > +        * re-take it, and also look up the vma again,
> > +        * re-checking it.
> > +        */
> > +       if (!mmap_upgrade_trylock(mm)) {
> > +               if (!upgrade_mmap_lock_carefully(mm, regs))
> > +                       return NULL;
> > +
> > +               vma = find_vma(mm, addr);
> > +               if (!vma)
> > +                       goto fail;
> > +               if (vma->vm_start <= addr)
> > +                       goto success;
> > +               if (!(vma->vm_flags & VM_GROWSDOWN))
> > +                       goto fail;
> > +       }
> > +
> > +       if (expand_stack_locked(vma, addr))
> > +               goto fail;
> > +
> > +success:
> > +       mmap_write_downgrade(mm);
> > +       return vma;
> > +
> > +fail:
> > +       mmap_write_unlock(mm);
> > +       return NULL;
> > +}
> > +#endif /* CONFIG_LOCK_MM_AND_FIND_VMA */
> > +
> > +#endif /* CONFIG_MMU */
> > --
> > 2.49.0
