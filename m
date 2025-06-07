Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27C3139D0A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 07:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749281004; cv=fail; b=NjnDD50aslTtptXFhZy5zpREGB7r3dvea736lcggaiVzhhrF3uc5J9MI7XvahpmSUAMzPlfyEBNISE7UMzGuEhUe/juvvOldwxeMnxFyFzze9m4B0HXBDcOjdlb1lsA7HwTwXP+T4fpSEWWgmvcFdsrrpnxr1jnz+Bi1fTruZ2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749281004; c=relaxed/simple;
	bh=DXJcYJWGt+FLlnTI4begPtmRlMRA0FLgeKIJ99lJCVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QYMm8Uxmw+UP+flR4VrACgh440hT56z+RmoonNhVU29Pa57zQzOx8hK/G7Q0/VbBw29MjLCQvVd8VV6zza1UFAOAPa7Q3FrOUzXWf6euDFp2XvltDUUDfZd1jDINrgxjKXb/GODu92veXe4xHkkABS72VGCBnzldq0MoJYJUNf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ISTVkNR4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=euQ4WnsQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ISTVkNR4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="euQ4WnsQ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5573ijF9017364;
	Sat, 7 Jun 2025 07:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=mYglHwm3gcE/ZesPvVEk/tNcmwVIR/6osPIPog0BkvA=; b=
	ISTVkNR4jGziglmk0S18Ai1cmlnfPBPlohdH59GwksxBqY7OAUo1rOODOqP5z9jD
	QI/QPiRzr/xPBw8jPluTXhtjtqRLu1Ywp0l2C1aYBMdgiafwNwUWa0na3EDByOQS
	KjCVzBnpcs5Etbkk4lea3rHHY/hXhTbtEhx7gZhaBw6pH8fk/hNFrzbfqIfCxnyZ
	ULxAlKDiIwRFJRoin2Y56qTml2FogAnsqfQM8l39Zb6HBcLhkZffBbQfhvfW7WvD
	yiHoDk8WHUY1hrM+tsDtf92mr3wgPY+AciOk5DdJVXhesYAUCLYo1t1U6GnP5FX7
	eGU8W/TmIIHkLFCk12YZzA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbe83yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 07:22:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5576m6JH020423;
	Sat, 7 Jun 2025 07:22:51 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011029.outbound.protection.outlook.com [40.93.199.29])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvc50f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 07 Jun 2025 07:22:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEN/jkS7cFdk7EBk9J8KKtuYeTbmErGDEsGf5gEYKgRj50ymG64tQ5p+q3P4EmejjXTrg7bRj0hEysJPxXaqWhmsJTDk/6qaQkpjzFi9Wa9yE8omppVi3OoG89EebhkZz1/GM2yOAFedCbCTK6CU/WuBNUxEeRIrEF6xf2iZw4JIvVlVyd1bXQqWofj3FtfEQaqIi2O0T3sY6YL0SQ1ChY67fU5hJsa8KLmk83sj+iye5synwDzxu1S/G7+ngdAsAXNycDMYJACTYhr4R9pyL4u54/aEe/YJ7He6OuAcdm0diT9inV/v0S/NOfY1drfswxudHt50MUJYZKfqgYLdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYglHwm3gcE/ZesPvVEk/tNcmwVIR/6osPIPog0BkvA=;
 b=PTCjzCjJR6uTBf8p96VzHh25QXJDgvoJPnokZ+Q3iwlhKaGXRbz0JeaAP2E1/7iqYC7U9esBf1ebH0F7QKu7nuxlbXaQLhZwKyifuxfEpn3B1YqAPItwO9A8SE6NUCOUAYPViDgYMPkK0csa8RoKadtWnrIc9XCkfaVlNr7VAIbw/46bCBax5kPIwfJ94R0KY+fjUbsIV0G+vByOv014tKLvWdsYLtw89iZMx8B/9fusWdgqgAXdjvrfeB5uYHZDV6Y+aj5b2vbvEX8Fu+cVVBIZ0e0sASLKjiHjemGxaEnEAGaQlt1MpifRxcYLsQf7XCwGqdOW/Od1oBQPmBGCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYglHwm3gcE/ZesPvVEk/tNcmwVIR/6osPIPog0BkvA=;
 b=euQ4WnsQ6CJa5iqn0g2uHEZkz9T5kLOylDphC5W5A+Sj7w3lks3UCcOgwT+i1/DkSOYYfwPus1qfHjYPBm3snpXhBVagELtqjQJ9wBDc/05Dxw/21O5a/MTMvRZ6vPPXna/GwIU4CPJG0vvFZ+zvVVSuLQmuuTQmPo//M22oYMI=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB6654.namprd10.prod.outlook.com (2603:10b6:303:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Sat, 7 Jun
 2025 07:22:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.022; Sat, 7 Jun 2025
 07:22:48 +0000
Date: Sat, 7 Jun 2025 08:22:45 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v3] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <5fc1de4d-7c2d-4f5f-9fb2-65bef5b6931b@lucifer.local>
References: <20250607004623.8896-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250607004623.8896-1-21cnbao@gmail.com>
X-ClientProxiedBy: LO4P123CA0699.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::6) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b1dfc3f-6df7-4c6e-5b32-08dda5941b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXpubjF0Q0EyVVA5ZHpYSmx5NW5KRlg1ZDF6a2VVVWhmZlhGQXVkVjdYMjJ0?=
 =?utf-8?B?emhDVStjb2JSam05UHYrbUx3VW5Xd2lGb2gvdVZySnZhTEoyRnhqRGdGWFdh?=
 =?utf-8?B?bEFZaGk1REdKcVl5N2NrRU4rV3k1MVJYdS9kUWZkRWMrVWN5YklYbytlVHVV?=
 =?utf-8?B?MFlyY0pzZ0dYa2NXSjJnWmVyRmg3MmJDZEVRTjBQL29mT25GSnJEeE9iM25Q?=
 =?utf-8?B?cUtIODMxVUJ3WnBPM2NMV0FqbFhCcllpZm83VjV1eHdjTExXUTc3dmdYeFhN?=
 =?utf-8?B?Szl5LzUreXEya05Kem16Q2hESDFNanlhWDNRS0RJU0F3ajV6NC9vWnRkcURz?=
 =?utf-8?B?ZHdhL1hDMlNWL1ByOTRpNnppOW9ibWtldVpEYzc2V0xCTGh0aDlSSHRTc1Nl?=
 =?utf-8?B?aDZQZ1NjajdNRUtlVWhsN1haMHhjYzc0dVZhQzgyQWNQSXRrYkNuMVJKbGRx?=
 =?utf-8?B?RU40VmZuTEpsU2tjRUFOdDJFN0FmZFoybjJNbk1KL0Nuc1Z2cnBjdHBxM3ho?=
 =?utf-8?B?VnF3cUJnRE5INGZRYitiQXlwRzU1Qlk4ZHJRdzBySEpnREpuSmZmMG9kQXNJ?=
 =?utf-8?B?b1NjdzlEQ3Q4WlVJZE50Wm9NakVvY3lBRUVWWk5aYTVDVGZjdlRWalVpTU43?=
 =?utf-8?B?WmVOK0JlUGpEbXIvZU5SOXVzYk5mSFVJZ1JFc3lHR241aHNHODRTSGdhcDBt?=
 =?utf-8?B?a1B4UWk5VHdsVC9FdWo3WEo4T0lUcGtYSUEvOG5MRU43L2RpVDJiZlVpT1Ji?=
 =?utf-8?B?cThyVHJndW1Xblh1RC8xS3M1RFJCUEhZa3ZpM2wvZmhhd1QwbHBlVGFPeGZL?=
 =?utf-8?B?YzZpdGVkYkFBR3Mya0ZmRHN1aXpKdDExWmorRWZSN0xHc1JzWU5LZnovMFQy?=
 =?utf-8?B?dE5oajc2T2MyVnJSWHUyWDhVUUk4aGNMT0R4bVVvQ1FEWVIyNEFuY2pPL0xB?=
 =?utf-8?B?RFZRS1dxdGtLZFlXTXYxZHFSMzN0SHZMa1B3elpWdjNzSHNjcEVzMUdsRnRZ?=
 =?utf-8?B?bk15VTRxaVgzdS9WTDNBdFlpV2pheEdxb3pzYkF3eUk3NmFvMmlpZ05XS0Zo?=
 =?utf-8?B?Vnp3NUY0dmpyL1BEUlRXRTN3NlJwWDlrbnBtRWpueTFCWTBEVURNaHBCM0Vn?=
 =?utf-8?B?RldyVmpLRVIvUHIzbWtVeXBXdzZxY25OcnRHbStLNFVUM0p6dWF5ZjlveTh6?=
 =?utf-8?B?OXU4N1llWWUrYTlDbFl4ZlU3eHJCNzdUNWtrelhwbzQrT0VlNkRCbWRLbmg4?=
 =?utf-8?B?U1FFWUdjbDJra1FrdndFSkt4RUFTTTI3OFgxTFVNWU4zYzVLa3FSQ01CU2hF?=
 =?utf-8?B?YThvU3VLbldBRU5pb3RiUVMwNkpNNy9wOTR5c3JuaXJPR0UrZTJUMGVDMCtv?=
 =?utf-8?B?K1p0MEZtTlVCbHBpbTNIdjgyRUIycDhHVU5GMmYxdjZVNi9YR09HWW1lOGxY?=
 =?utf-8?B?bXh2bXl1VXVYYWNQeGZHbFIrWm9OeGlxNTVhZzZrSUwrM2ppQmd3cFFIT2lV?=
 =?utf-8?B?Y0s2aGF2Zit1MWh1THlOd1hzTWpKV2l6eDZTTXRyRWhYV2ZTSkNmNHNRVm51?=
 =?utf-8?B?bDhUWlhub3pPTVgrSHpGNHJzZDN6NWxPTUt2YVR1RjFGVGtIUHNHNFRUYU1q?=
 =?utf-8?B?dmJud0VtNjhDOW42UkV1OTd5U29nMFN1SjVxZndxVEVqYVBFa3ZFbzhMeGJU?=
 =?utf-8?B?c3hidjBCazZDcGMvRzBLV3I0cjE2LzVIbEJkTU5UUytxbVJTOVk3aFBrSXh0?=
 =?utf-8?B?MWVaa3JGWHdhWmdRWDErQUNYaVpHcEFBeU45VCtsQ1p4WTRJK2p5a1ZrT2tE?=
 =?utf-8?B?MVVxei8xbXdzQ1lMY1dQeThMWkY5ZEVUVDhJT2t2VzhEVGN4UStjbjlmV0Vx?=
 =?utf-8?B?b3V6RkpnRTFkUGtWSzVoTG1yemtUL01uZE5lZ2dzVGdvRG9lOEt0ZU5EUEtl?=
 =?utf-8?Q?YWsT0HR9xMu0huhKEVdZ0sAcS5dtHA1x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUtTRDE0bTFHVDBZcWluK0lsUFNzeWpDcWtuMy9IdnR1RU9RbE5FeFpKU2s1?=
 =?utf-8?B?S0x5Mk1sd1ZTTzdYWmxteWpqNElhTGlNR2VjbytybHRzczRKZzk1ckdFWFpD?=
 =?utf-8?B?WUV3QkFZSzdiaERLcVRtOVg2TFFPakNJS2hjVU5UelNTL3FIdUJjbGJYa2ox?=
 =?utf-8?B?eUZISzBjQWVMb2dZRHh3TE9Bd1VIQkZkL0pDODR5S2YwaFdXYy9HUzlBUmJQ?=
 =?utf-8?B?eXNpc0tlMkZvY2RDUEZYTCtJTzRXWW5KQ2hVSXk1TGRqVFF0aUc1cmcyb1Fy?=
 =?utf-8?B?TTRYMFNqaUFEYU1URzFxRk5zRDd0eFBhUjdwa3NkMHRHS1NKZ1UwM0FDSTNU?=
 =?utf-8?B?SlAwbXlTV1ZkU3RsY3NvcW5xeEU5R1RVbmM3eDFySVJxZTdyVlRkaHI4ZFVy?=
 =?utf-8?B?QXhBa3YrcVdGeURlUExnUkJobG42d0lBR3loWk5wcG5ncnE3VzE4QnhKaUhn?=
 =?utf-8?B?Qisvc0RPUloxczgwUCtlUG1GYzJTT0ROdTQ5MnMvUWxpaHlVejc3UTFVOUUw?=
 =?utf-8?B?NG5LUXJsUFpPcC9NMndrcGNIaGM0Q1MxTFMwZzVZZ0tNQzAzNm9KZmhGSkc5?=
 =?utf-8?B?QmRhbzlyczZYMWgrMHhQSnZyVWl1a3FvTy94V3VNTHBIQnQxeHJ0TlpzK2k1?=
 =?utf-8?B?SDJIT2szajUvaGZMaE5iT1BseGxJd09HcjkzSGJHTnlDS1A3SXhOODF6bjlm?=
 =?utf-8?B?eVQ5WjRDajZVMFlIemEwNnhqZTBVdC9zelFrYnJMOGc0bkpVQTcwVU9DQm04?=
 =?utf-8?B?Rlp5UXA1MVdOZmQyYjRiVSt4UWtxZzdYVkRSbmxHdDZuM1YydWFMY2RGRnZq?=
 =?utf-8?B?aHUzcG1wd1Y2bVNFWVhLbDlyTVRUQUtXajZINVpjSlduZjNtTjljeitMOTQy?=
 =?utf-8?B?eSt4RHNnYjQyYnBoN3hZZDJQZmpZWUduRncxRmJhSThoMDhQQldWNGloL2xl?=
 =?utf-8?B?SjA5SnhCS0dnRnMwbVh5dFNwN1B1bW5CQmllcXM3Q29xWjlvOEVRYnVyeVJs?=
 =?utf-8?B?ekxyR0tKTWRRbS9YbDFpeGl1bDgvdEZTTFYwWjlWWjcyUjlnbWovM3RoSTlu?=
 =?utf-8?B?czRpb0Z3MThkMUVQSDgyT1NEWlozU0ovQnIvZmxSVW9FVEtlemkvckNPeDFG?=
 =?utf-8?B?Y0txVmdhREI3cHNlVnI2ak41bjdlSkJjdW0wUy9VdWxEVmpsdjBqcVVST3gv?=
 =?utf-8?B?MC8yTVZpelpyN3hUVE50R2tKUlAvUHgxV0JVMDV0ZFNTT0NlcjA4TTk0eUVE?=
 =?utf-8?B?d1h4NXMxa2ZNa2dNMTZDVmhTQ1hvZS9YZnh4Q0hVZXJTeU8wdVk2Vm9LVEk2?=
 =?utf-8?B?Nlp5a1FnaU1JTEIrUEcwSFdXL083NnJRSzNCU3lUU1A0enUyeTd0WVJtem5o?=
 =?utf-8?B?WW9LQm5EanRSN21HNFVSSmNOSGszZXViRWR1NkpyQXJId1VpNlQvMWR6RUJE?=
 =?utf-8?B?VWR2ZzBlcWQ0TGZhWFZPeExOaHFHWXp0dGpvRDh4MDZZWmhDL3pkQXB5TmV3?=
 =?utf-8?B?RXR6VXZEb1pKZDBuK203Qm9zZzk0NlZNaGNNaVBOY2V3UTBLUTdLWmNRaHRV?=
 =?utf-8?B?NWZKaVZIQ1V4c3FBbWdHei9vOUtvRnNRa3J3dzNadVVGd0RyUFA2VW5NMk1H?=
 =?utf-8?B?c3U4YnZBSFJmRUJsY0FPV3Nra3RsVDVJcGhyaE5XRW01VGNjbVlkalllOVRN?=
 =?utf-8?B?UkNWSFA0bFRueisxb21yYkswNlFGaE9tZzFjYjJOT24wQUhwWVhWN2dmVXlu?=
 =?utf-8?B?WUp2WndyVlBKRjZUbnk1ZUYrZG11NVUwZ2E0ekJiTTZYT1VBcXM0TU52QU1q?=
 =?utf-8?B?dzkzNkx0b0RUa3NCL3BlYXZuRkl0M01lR245c2sxdXpobVJqSFh3cnUvd3gr?=
 =?utf-8?B?d1pWTjN3Q2ZjOTRNcndZbTZqODN2Uy9KeUw0TnV0K3hBcE1Na2tGaEpiSnl5?=
 =?utf-8?B?bk9yNnpmaWlnY2kwQmZUamVLSUU4TDh5S2Y1enA0TlB6YUMrN1U0WmV6WDM4?=
 =?utf-8?B?alJpZDVqejlVNHpPM1FkVzEvdUN1RDcwajBLYmY4Q1UwTm12c2RmYms2SWh0?=
 =?utf-8?B?a3NDTkRSaWwzZmFzZSs5S1labWN3eU82UnEycEpKNGJIQnFHRHFIV2ZDQ3pG?=
 =?utf-8?B?eHYzTWFqZFBDNzV4eTRHaWxMV0dxUUdTS0NGL0pOUlR6SkZuMngyeThmbVRz?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ywRM1KbtUy8yv7b865gzIgbfIroFW4VyX9hKOmdG/vHS/gg9KNFSbffaixp5tnUvydF+y27hPASXkZ3kopuce7EmxX3eVzCONkwSZFTKYw9Wyrw4ecr3Z2fvcaTgTkeqSBKiAwGhKNVJ1EwqQ+JPyG+qHWCT7QAnoaFO9R5AyHY6VOuTA7EchRL9SyKVgrA3jo8o9LK3UVr5TOSwxExOhlGFUcPJCWyCVBystm0RsF9w+nvaPjZ0t/ehNy3xSRwKA9vnooV5p6m7SZOgTfdL7rEO+ivI7Mt/cMwLazOmKTsEp5n1uxqHeX/dmi0/z3i1bwFbmhSjb0q4Z7XhnpcRIgJgcrnRjQLwrgmM7ALkRMJOzbU24oWgDff6lCIoE/GB5tb/a3soCi7VO9AcZzkMgGfKuY93kyNgDaYjvdeUsLbEiV1w2rHXYqPUBPEziL3uq0kNJ7OwUm8mhd/zpB8UUc3qmtG0f6Q6IyzYzICOGC22NH0iEItJ0eMTGOdMEpQjR1HwOMhE5/FE2lcPEYnE7UesskgoXmaclQbXQUA9MGNazNRtXJfgfcrK7qvDF7/OjCV/a18siOtIViE4xTx6aKsE4+GcfTr98flc2tfhmbQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b1dfc3f-6df7-4c6e-5b32-08dda5941b03
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 07:22:48.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nGqv/v7440TQEXfblg//8R/dFQY9aMduvC2wyjbTrbvqIaWto73jf3gXaKLTdFmH1Emr73dWFedbDdoxRl/U3l2hha04xU+H1Ev0vh244A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6654
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070052
X-Proofpoint-GUID: -9GK2SAzspU9fTnO8JWa6VZ3FPIIkkvt
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=6843e8cd b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=A2pY-5KRAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=968KyxNXAAAA:8 a=W4DqBcbW8ghXN-U_vgAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13207
X-Proofpoint-ORIG-GUID: -9GK2SAzspU9fTnO8JWa6VZ3FPIIkkvt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA1MiBTYWx0ZWRfXwWybWnVl1aHy LYH8Dj1o7L2HqslnyMEWFv9UlKMF7TJsPFa2VdDpW6VD08VWanNy9SiTZp4t0GcUX+GbohU2CDq FzHwmbHVYVCIOPxtXx2Y7Jf3xs5RXReHm2zh1N3OFlh1dHy9S77+jUlK4/fmsPfKbNG9McHr7lo
 yVdX09DMftQjhYsy+XKqYWjUDBmJKMsKGA/ulM2WGoYpYtSGseFm+itAPhEmEA23W5Vm0BIzvKG Y2RqntKm9V0OJXsbuCYb98KXNMxRmBMa/y+EGjswfZImN8cPx7uZPpHu6j+aZHAKnwOjM1bsfwC F9zC8+4Tyw/Zf30KlYJHcmR4qCXsIDAkEyznwbYz80fwuMdcveH1NwTTdSDMQTzUUoVCd5D4L2r
 QA7WUbju3ELz5nZ9hiKmZsVlD7Kx/a7+TufxybRtTBxWRPrbojnpB99pncYCsK+fUxND8xvL

A quick build/selftest run reveals nothing concerning.

On Sat, Jun 07, 2025 at 12:46:23PM +1200, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
>
> Certain madvise operations, especially MADV_DONTNEED, occur far more
> frequently than other madvise options, particularly in native and Java
> heaps for dynamic memory management.
>
> Currently, the mmap_lock is always held during these operations, even when
> unnecessary. This causes lock contention and can lead to severe priority
> inversion, where low-priority threads—such as Android's HeapTaskDaemon—
> hold the lock and block higher-priority threads.
>
> This patch enables the use of per-VMA locks when the advised range lies
> entirely within a single VMA, avoiding the need for full VMA traversal. In
> practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.
>
> Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
> benefits from this per-VMA lock optimization. After extended runtime,
> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> only 1,231 fell back to mmap_lock.
>
> To simplify handling, the implementation falls back to the standard
> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> userfaultfd_remove().
>
> Many thanks to Lorenzo's work[1] on:
> "Refactor the madvise() code to retain state about the locking mode
> utilised for traversing VMAs.
>
> Then use this mechanism to permit VMA locking to be done later in the
> madvise() logic and also to allow altering of the locking mode to permit
> falling back to an mmap read lock if required."
>
> One important point, as pointed out by Jann[2], is that
> untagged_addr_remote() requires holding mmap_lock. This is because
> address tagging on x86 and RISC-V is quite complex.
>
> Until untagged_addr_remote() becomes atomic—which seems unlikely in
> the near future—we cannot support per-VMA locks for remote processes.
> So for now, only local processes are supported.

Nice commit message!

>
> Link: https://lore.kernel.org/all/0b96ce61-a52c-4036-b5b6-5c50783db51f@lucifer.local/ [1]
> Link: https://lore.kernel.org/all/CAG48ez11zi-1jicHUZtLhyoNPGGVB+ROeAJCUw48bsjk4bbEkA@mail.gmail.com/ [2]
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Cc: Qi Zheng <zhengqi.arch@bytedance.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

Since I proposed the approach I am somewhat biased (you should get review from
others too! :) and I would really like Jann to confirm the untagged addr ting is
fine, but LGTM other than a thought/suggestion below, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---

Nit, but be nice to have a change summary here from v1 -> v3 with links to lore
for convenience.


>  mm/madvise.c | 196 ++++++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 148 insertions(+), 48 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 56d9ca2557b9..a94e6a7ee387 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -48,38 +48,19 @@ struct madvise_walk_private {
>  	bool pageout;
>  };
>
> +enum madvise_lock_mode {
> +	MADVISE_NO_LOCK,
> +	MADVISE_MMAP_READ_LOCK,
> +	MADVISE_MMAP_WRITE_LOCK,
> +	MADVISE_VMA_READ_LOCK,
> +};
> +
>  struct madvise_behavior {
>  	int behavior;
>  	struct mmu_gather *tlb;
> +	enum madvise_lock_mode lock_mode;
>  };
>
> -/*
> - * Any behaviour which results in changes to the vma->vm_flags needs to
> - * take mmap_lock for writing. Others, which simply traverse vmas, need
> - * to only take it for reading.
> - */
> -static int madvise_need_mmap_write(int behavior)
> -{
> -	switch (behavior) {
> -	case MADV_REMOVE:
> -	case MADV_WILLNEED:
> -	case MADV_DONTNEED:
> -	case MADV_DONTNEED_LOCKED:
> -	case MADV_COLD:
> -	case MADV_PAGEOUT:
> -	case MADV_FREE:
> -	case MADV_POPULATE_READ:
> -	case MADV_POPULATE_WRITE:
> -	case MADV_COLLAPSE:
> -	case MADV_GUARD_INSTALL:
> -	case MADV_GUARD_REMOVE:
> -		return 0;
> -	default:
> -		/* be safe, default to 1. list exceptions explicitly */
> -		return 1;
> -	}
> -}
> -
>  #ifdef CONFIG_ANON_VMA_NAME
>  struct anon_vma_name *anon_vma_name_alloc(const char *name)
>  {
> @@ -1486,6 +1467,44 @@ static bool process_madvise_remote_valid(int behavior)
>  	}
>  }
>
> +/*
> + * Try to acquire a VMA read lock if possible.
> + *
> + * We only support this lock over a single VMA, which the input range must
> + * span either partially or fully.
> + *
> + * This function always returns with an appropriate lock held. If a VMA read
> + * lock could be acquired, we return the locked VMA.
> + *
> + * If a VMA read lock could not be acquired, we return NULL and expect caller to
> + * fallback to mmap lock behaviour.
> + */
> +static struct vm_area_struct *try_vma_read_lock(struct mm_struct *mm,
> +		struct madvise_behavior *madv_behavior,
> +		unsigned long start, unsigned long end)
> +{
> +	struct vm_area_struct *vma;
> +
> +	vma = lock_vma_under_rcu(mm, start);
> +	if (!vma)
> +		goto take_mmap_read_lock;
> +	/*
> +	 * Must span only a single VMA; uffd and remote processes are
> +	 * unsupported.
> +	 */
> +	if (end > vma->vm_end || current->mm != mm ||
> +	    userfaultfd_armed(vma)) {
> +		vma_end_read(vma);
> +		goto take_mmap_read_lock;
> +	}
> +	return vma;
> +
> +take_mmap_read_lock:
> +	mmap_read_lock(mm);
> +	madv_behavior->lock_mode = MADVISE_MMAP_READ_LOCK;
> +	return NULL;
> +}
> +
>  /*
>   * Walk the vmas in range [start,end), and call the visit function on each one.
>   * The visit function will get start and end parameters that cover the overlap
> @@ -1496,7 +1515,8 @@ static bool process_madvise_remote_valid(int behavior)
>   */
>  static
>  int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
> -		      unsigned long end, void *arg,
> +		      unsigned long end, struct madvise_behavior *madv_behavior,
> +		      void *arg,
>  		      int (*visit)(struct vm_area_struct *vma,
>  				   struct vm_area_struct **prev, unsigned long start,
>  				   unsigned long end, void *arg))
> @@ -1505,6 +1525,21 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
>  	struct vm_area_struct *prev;
>  	unsigned long tmp;
>  	int unmapped_error = 0;
> +	int error;
> +
> +	/*
> +	 * If VMA read lock is supported, apply madvise to a single VMA
> +	 * tentatively, avoiding walking VMAs.
> +	 */
> +	if (madv_behavior && madv_behavior->lock_mode == MADVISE_VMA_READ_LOCK) {
> +		vma = try_vma_read_lock(mm, madv_behavior, start, end);
> +		if (vma) {
> +			error = madvise_vma_behavior(vma, &prev, start, end,
> +				madv_behavior);
> +			vma_end_read(vma);
> +			return error;
> +		}
> +	}
>
>  	/*
>  	 * If the interval [start,end) covers some unmapped address
> @@ -1516,8 +1551,6 @@ int madvise_walk_vmas(struct mm_struct *mm, unsigned long start,
>  		prev = vma;
>
>  	for (;;) {
> -		int error;
> -
>  		/* Still start < end. */
>  		if (!vma)
>  			return -ENOMEM;
> @@ -1598,34 +1631,86 @@ int madvise_set_anon_name(struct mm_struct *mm, unsigned long start,
>  	if (end == start)
>  		return 0;
>
> -	return madvise_walk_vmas(mm, start, end, anon_name,
> +	return madvise_walk_vmas(mm, start, end, NULL, anon_name,
>  				 madvise_vma_anon_name);
>  }
>  #endif /* CONFIG_ANON_VMA_NAME */
>
> -static int madvise_lock(struct mm_struct *mm, int behavior)
> +
> +/*
> + * Any behaviour which results in changes to the vma->vm_flags needs to
> + * take mmap_lock for writing. Others, which simply traverse vmas, need
> + * to only take it for reading.
> + */
> +static enum madvise_lock_mode get_lock_mode(struct madvise_behavior *madv_behavior)

Sort of a nice-to-have/thought but:

Actually, when I proposed the refactor I wondered whether we'd use more state in
madv_behaviour here but turns out we don't so we may as well just switch back to
using int behavior here?

If we do that then we can adjust process_madvise_remote_valid() with:

 static bool process_madvise_remote_valid(int behavior)
 {
+	/* Due to lack of address untag atomicity, we need mmap lock. */
+	VM_WARN_ON_ONCE(madvise_lock(behavior) != MADVISE_VMA_READ_LOCK);
+
	switch (behavior) {
	case MADV_COLD:
	case MADV_PAGEOUT:

Which then self-documents this requirement for any extension to permitted remote
operations that might otherwise use a VMA lock.

We will already catch these though with the mmap assert in
untagged_addr_remote() anyway so these won't get missed and your comment there
explains things, so this whole suggestion is optional.

>  {
> +	int behavior = madv_behavior->behavior;
> +
>  	if (is_memory_failure(behavior))
> -		return 0;
> +		return MADVISE_NO_LOCK;
>
> -	if (madvise_need_mmap_write(behavior)) {
> +	switch (behavior) {
> +	case MADV_REMOVE:
> +	case MADV_WILLNEED:
> +	case MADV_COLD:
> +	case MADV_PAGEOUT:
> +	case MADV_FREE:
> +	case MADV_POPULATE_READ:
> +	case MADV_POPULATE_WRITE:
> +	case MADV_COLLAPSE:
> +	case MADV_GUARD_INSTALL:
> +	case MADV_GUARD_REMOVE:
> +		return MADVISE_MMAP_READ_LOCK;
> +	case MADV_DONTNEED:
> +	case MADV_DONTNEED_LOCKED:
> +		return MADVISE_VMA_READ_LOCK;
> +	default:
> +		return MADVISE_MMAP_WRITE_LOCK;
> +	}
> +}
> +
> +static int madvise_lock(struct mm_struct *mm,
> +		struct madvise_behavior *madv_behavior)
> +{
> +	enum madvise_lock_mode lock_mode = get_lock_mode(madv_behavior);
> +
> +	switch (lock_mode) {
> +	case MADVISE_NO_LOCK:
> +		break;
> +	case MADVISE_MMAP_WRITE_LOCK:
>  		if (mmap_write_lock_killable(mm))
>  			return -EINTR;
> -	} else {
> +		break;
> +	case MADVISE_MMAP_READ_LOCK:
>  		mmap_read_lock(mm);
> +		break;
> +	case MADVISE_VMA_READ_LOCK:
> +		/* We will acquire the lock per-VMA in madvise_walk_vmas(). */
> +		break;
>  	}
> +
> +	madv_behavior->lock_mode = lock_mode;
>  	return 0;
>  }
>
> -static void madvise_unlock(struct mm_struct *mm, int behavior)
> +static void madvise_unlock(struct mm_struct *mm,
> +		struct madvise_behavior *madv_behavior)
>  {
> -	if (is_memory_failure(behavior))
> +	switch (madv_behavior->lock_mode) {
> +	case  MADVISE_NO_LOCK:
>  		return;
> -
> -	if (madvise_need_mmap_write(behavior))
> +	case MADVISE_MMAP_WRITE_LOCK:
>  		mmap_write_unlock(mm);
> -	else
> +		break;
> +	case MADVISE_MMAP_READ_LOCK:
>  		mmap_read_unlock(mm);
> +		break;
> +	case MADVISE_VMA_READ_LOCK:
> +		/* We will drop the lock per-VMA in madvise_walk_vmas(). */
> +		break;
> +	}
> +
> +	madv_behavior->lock_mode = MADVISE_NO_LOCK;
>  }
>
>  static bool madvise_batch_tlb_flush(int behavior)
> @@ -1710,6 +1795,21 @@ static bool is_madvise_populate(int behavior)
>  	}
>  }
>
> +/*
> + * untagged_addr_remote() assumes mmap_lock is already held. On
> + * architectures like x86 and RISC-V, tagging is tricky because each
> + * mm may have a different tagging mask. However, we might only hold
> + * the per-VMA lock (currently only local processes are supported),
> + * so untagged_addr is used to avoid the mmap_lock assertion for
> + * local processes.
> + */
> +static inline unsigned long get_untagged_addr(struct mm_struct *mm,
> +		unsigned long start)
> +{
> +	return current->mm == mm ? untagged_addr(start) :
> +				   untagged_addr_remote(mm, start);

untagged_addr_remote() has an assert on mmap so this should neatly assert that
we never VMA lock w/o mmap lock automatically which is nice.

> +}
> +
>  static int madvise_do_behavior(struct mm_struct *mm,
>  		unsigned long start, size_t len_in,
>  		struct madvise_behavior *madv_behavior)
> @@ -1721,7 +1821,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
>
>  	if (is_memory_failure(behavior))
>  		return madvise_inject_error(behavior, start, start + len_in);
> -	start = untagged_addr_remote(mm, start);
> +	start = get_untagged_addr(mm, start);
>  	end = start + PAGE_ALIGN(len_in);
>
>  	blk_start_plug(&plug);
> @@ -1729,7 +1829,7 @@ static int madvise_do_behavior(struct mm_struct *mm,
>  		error = madvise_populate(mm, start, end, behavior);
>  	else
>  		error = madvise_walk_vmas(mm, start, end, madv_behavior,
> -					  madvise_vma_behavior);
> +				madv_behavior, madvise_vma_behavior);
>  	blk_finish_plug(&plug);
>  	return error;
>  }
> @@ -1817,13 +1917,13 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>
>  	if (madvise_should_skip(start, len_in, behavior, &error))
>  		return error;
> -	error = madvise_lock(mm, behavior);
> +	error = madvise_lock(mm, &madv_behavior);
>  	if (error)
>  		return error;
>  	madvise_init_tlb(&madv_behavior, mm);
>  	error = madvise_do_behavior(mm, start, len_in, &madv_behavior);
>  	madvise_finish_tlb(&madv_behavior);
> -	madvise_unlock(mm, behavior);
> +	madvise_unlock(mm, &madv_behavior);
>
>  	return error;
>  }
> @@ -1847,7 +1947,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>
>  	total_len = iov_iter_count(iter);
>
> -	ret = madvise_lock(mm, behavior);
> +	ret = madvise_lock(mm, &madv_behavior);
>  	if (ret)
>  		return ret;
>  	madvise_init_tlb(&madv_behavior, mm);
> @@ -1880,8 +1980,8 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>
>  			/* Drop and reacquire lock to unwind race. */
>  			madvise_finish_tlb(&madv_behavior);
> -			madvise_unlock(mm, behavior);
> -			ret = madvise_lock(mm, behavior);
> +			madvise_unlock(mm, &madv_behavior);
> +			ret = madvise_lock(mm, &madv_behavior);
>  			if (ret)
>  				goto out;
>  			madvise_init_tlb(&madv_behavior, mm);
> @@ -1892,7 +1992,7 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  		iov_iter_advance(iter, iter_iov_len(iter));
>  	}
>  	madvise_finish_tlb(&madv_behavior);
> -	madvise_unlock(mm, behavior);
> +	madvise_unlock(mm, &madv_behavior);
>
>  out:
>  	ret = (total_len - iov_iter_count(iter)) ? : ret;
> --
> 2.39.3 (Apple Git-146)
>
