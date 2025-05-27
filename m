Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6801B041A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748337629; cv=fail; b=TU6sJsvAppOMTTZmSSr5qiR/Q09mRwVLDbx6/kBSoN/JpFPPp22FEMADRGQ4N/uI8cR6ZRpTK0dgVvXvXiy2iJgrkDnS/d9NeaDhm6NWoHk5luskIRqe2NDv/Ru5usTPo3rNfRFka5Lvh9XzEZ3Oj8kOz4AvxV7IXQMmJNqDU3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748337629; c=relaxed/simple;
	bh=iPbVM2PvF3ILRTpc30/HxwaS6zrVNo5BEskBjVM5sTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tjNVVWtIruzCoKeguphv+R5ldVEUQbivqpoAG2Wl2QC2bsqvD0bF5tffxoT6LKHrg2L9A8RVwVOAxR4fHkyQrpr3j5kYOHXP/qk+PMaD2KIveAsxQT4IIpe1jBvUW11Lgccn8vPdeeU2hW4fSRsExNR7yNDQPMZoxMhfC2N/7w4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MfLicuRy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=q64usV5Z; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MfLicuRy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="q64usV5Z"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R69b77004998;
	Tue, 27 May 2025 09:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=5kK/YG8IqKkjJ35xT+YuWsEu5V+s0ep8d9ShLnXDEbE=; b=
	MfLicuRyra5S/iJeC9oyoXc0U3YPnfzJ8GXSCwxUzLaFB7LI5xettn1pZ/H9D8SP
	aksKenhFwn1f0dKztswDw21gxs8VDaKP/6XsufUYoSuokH8OGpsxnICKkBLzWUyp
	Gxkaxn6Wd12qKcaVkP0oQ4p9cwXym0V7/V/Iapp2NvLiiuuhAQIkPOmRIooGMrjM
	NGE0e7Hcad8Q0MgaqOIhi87JvPHWHteOPHElKwB04tary2Pjp51sBa3HoDjdR00R
	dDYTI9NeDWGD+lhtISGEWyQN5YL7M8D5CjUOfhEgMTieUJ2UGRQsTJIpFE9OSfKE
	ncf7HkNqe76madwy65KBaA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v33mtr21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 09:20:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54R988ci035618;
	Tue, 27 May 2025 09:20:10 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012039.outbound.protection.outlook.com [52.101.43.39])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j9m6xd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 09:20:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+TamztX1kglTQPR+mvO98gefwG4up1s3T7vO5zraCsvFBSdO3XnFKPpeMXtY+1o8GWYPuKzOH9CQSb/nFheaUmlota8mVJCJiQdmMAhOj38Az679pzhAWWQ84zCzINU3Ay8mvNifD/k3dleFDvDQkm/jNwejeeK6NSRv+4bn+KLh2oHmGISfDIDGx/vT6oj9GY1bu8qKOUW1UqzJ70ronpRlzkzMdhMV0SaK9X0N5pb8Kobuw2q79hZuQFiaC+vIvOM7WO8xAkyWsT7KmYTQ7/7pVDfbQKdl9c/ZQ2Af81sOtS3hpNA7AtIrKt6mV6BgIsHuzy+3idBAo0g9D7kJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kK/YG8IqKkjJ35xT+YuWsEu5V+s0ep8d9ShLnXDEbE=;
 b=CYpKEGl7nibIm9XLfvhiKVC/sJDvj5UW101/29im+ljyrEu1J1F7licWVVBgXt39fKW179SQSnKC+EK0OZhnhmIbp6keINCkNMSEPtGkcWBFHzVtKZlQd64TJg8hWWj9/qyYDMkreioPQOmLRmsIKYOX4FN1piQ4Ut3pCa2tbON5ONdVkfXucFZX5ZK7whGCO57+/XQVj5gFPQFZfklvBsBdWHPF/AsEaKPvZh+h1ripeKMeV8FutyYdqAxS1MYecO8A2KvT0HDeA73TnVVh1goz583iWrs8mjBTYUGJVE7bba+AI+SwYnacCxwkVBGTkLHnv5eMhNwlghjpAk5FZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kK/YG8IqKkjJ35xT+YuWsEu5V+s0ep8d9ShLnXDEbE=;
 b=q64usV5Zmi1+M+NKDHJc0tlSFwyuDEQT/uYbyGNqZkFRsjYKTCnibQEmcVAU1cvC7oU3b4ju1IiLtqt3hwfl7CJ2jP06gZFamPDiDc28N/nhmFVrLPEafjj7F9zSgcj/wgzTTbsuoEuqqtpMDkK5erhQ01t8OIuLLP0wwQJd5uY=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by MW4PR10MB6298.namprd10.prod.outlook.com (2603:10b6:303:1e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Tue, 27 May
 2025 09:20:06 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Tue, 27 May 2025
 09:20:06 +0000
Date: Tue, 27 May 2025 10:20:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
        Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>,
        Lokesh Gidra <lokeshgidra@google.com>,
        Tangquan Zheng <zhengtangquan@oppo.com>
Subject: Re: [PATCH RFC] mm: use per_vma lock for MADV_DONTNEED
Message-ID: <93385672-927f-4de5-a158-fc3fc0424be0@lucifer.local>
References: <20250527044145.13153-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527044145.13153-1-21cnbao@gmail.com>
X-ClientProxiedBy: LO4P265CA0288.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::16) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|MW4PR10MB6298:EE_
X-MS-Office365-Filtering-Correlation-Id: af5ce770-e5da-44e3-f10a-08dd9cffab5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHNZRGNEYnR5Z1VMMk5oYWNMOG9ZcndFR1Y2SFAxRW5pcS9yK25qa0F1Mzds?=
 =?utf-8?B?VzZDdDIyd3J1YVhFVFhCUWMybVZ6alJFcStnK3g3bFBDakVVT01GTkdEajhx?=
 =?utf-8?B?R2RPdGZCOWd1VVZhVVdSQzZ4U045WUdjaEJMenUzLzJHdzBBZmJOMU9Ua2gw?=
 =?utf-8?B?VlBvSDFKT1JsOTVVU2ErUVMweFRXcE01OXVlNkxjTjF1TzZmaVlSUHR3TDM2?=
 =?utf-8?B?RnhZOHA3VnRxSVNtVEpVdjZvbGk5dElEcjgrek5xcUZCZUE0NGJOeHpSdjU3?=
 =?utf-8?B?WHpZaEhxZ09mWFpwaDhrNzRib0xlcjIzdlFIblpuT1ZxbkU1M3ZmS1NZNzVy?=
 =?utf-8?B?alhQRzBBd1dHdjl5SWIybzdEVGpEeEpoSGN0TjJ4RDdoWHBUMFBJZUhrdmQz?=
 =?utf-8?B?Y1lKbUJZU09MK1NYUDJiWktCczlza2tyam55UHlIb3llL3pjMjY3SlA5dXJX?=
 =?utf-8?B?OThjMGpjRWJpSkFRZ2pJSTdnU0lzUkYvc1hZOXpvUE0rUFY4V25ZSEZyQk8z?=
 =?utf-8?B?RzJ1Q0FEcDdsdzZqTWh5M3YycWtVRnVuMStMRHhWYk5FOXZRd2YveXNQODZB?=
 =?utf-8?B?cUttTVorZExoNzh5WTBQYllEdnBXWEVMUXN6SkFlZTAzS01meHZXVWpubHIr?=
 =?utf-8?B?K2h3K214VXJLVnVnTk5nbUtTRnJxT0JVMUgrdWUzY3NQcmdvSGhYOUNvVXJu?=
 =?utf-8?B?QWxsZXB4d04wVTBOQXh1TXMydFJIckJVVEhxWk9EU0gvU3FyVkkvYWh1Vml0?=
 =?utf-8?B?V2c3ZFMrU1RicVFMWnJMaCt6c01zNjVvSnlQbkxBOHlicFJDSkpLbGppS1Vw?=
 =?utf-8?B?TzBHdmw3d1F0VEZCQk9DUmdjbExoY0FYTzFLb1RXTXVGbk0rVzVOMy9FaFNB?=
 =?utf-8?B?UFM4d3Y4YlZOLzlmYlNyZ0Z2MXM4T3o3OFVPTDlzU3dRYVA1a1RxVHB3cDN0?=
 =?utf-8?B?ZE9jbnpKV2UzY21KRERmUWRVVnpGNEVwcmxTUFhQdnF2UVFreHBzd1FPSzFI?=
 =?utf-8?B?NldORXkweHp1UUQ2Q2pBUXZDOU50amNzUXJoS29LaWxvOWE3Q2NTdTVsOXJS?=
 =?utf-8?B?Z0wxYXNUMW1KbFpVLzFuRVhoWEI4cmhybm16ZHdJdzQzWG41K1QrWm5PU096?=
 =?utf-8?B?UEFoVGlrSUN2eW1QRGkySVFra3NmZU5PaTQ5NDM3dlQ1c0NIWFZNRGplcTJF?=
 =?utf-8?B?d2gxYTZtSnM4eC8xQnIvZXkxbWVab3NGaHdFWGhNOXJXWW14N3g2VE55UXlq?=
 =?utf-8?B?eW5qR2tIQm9XUW5IeUtVSndrYjZHcXFVZlEwR29yWDUyMWs5bWpFcjVObmhD?=
 =?utf-8?B?OFVnSC9OL3VVNGRZMVZURDJ3MnA4dmY5ejRxM0lRRGV0SGNQb3RlamdjMmlk?=
 =?utf-8?B?Z3VvOVVvei9ObzdFU0Qwa3E4N0dTZTlQVmlMTHdIZGwxeHNXWEVDR01ESncr?=
 =?utf-8?B?c0VIN1VDVjlLS1MvaUtZb08xTmpUbDVnV2FNQmNWSGtWL2hoRmFua0tsOFEz?=
 =?utf-8?B?MHd3azRsNDJIbEZGOVYwdjdNWmxkbmpra2Q3ZCtaa1BlbGs5V0Y2U1FCSDhN?=
 =?utf-8?B?dVd2U1JnanhLcVlKUDNWZlJRNkR5UzRkaTdlMXNtcU5tTjZYVUp5UW9vUEMz?=
 =?utf-8?B?amFaenM3QTNLUXZkVkFYcGc4eUdBN3BPNlN6bSttL2tDTXRNaEJHSVdXTlJ1?=
 =?utf-8?B?ZncwRWMvazc4VFBSL1V0VUdYV2NEQ296TkdEQ3RaTkFlVnk2bHp5cEoxajlz?=
 =?utf-8?B?eDRxZWhmeVdBZHBpYWc2MUZDdVJZeGxaSTBZSzlqTHc3WjUvSkNGL1FOM3NC?=
 =?utf-8?B?b1oxNWsrRkQ2QjJ0bVJkSU9FYmdDMVVMYnIrSjBnMURyazFwWkdyRkVWS2ZY?=
 =?utf-8?B?ZmMrWnYrY3p1QlFtMmxsbHk2QS9jTVhBbFFVcmVZdlVFNmFseVNSeDVkZ3BW?=
 =?utf-8?Q?ks9h+wokttg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1JxajRFMW0vcFJjak8wanNxMldOUUwwcGdQQWY5bFN5WU4yS1gvdUNMOWlP?=
 =?utf-8?B?MjNXcUk4bHFaR05HckVqYndLSzk3Q0ZVdk1RdC9TWDgxZTJNckMvQkE1SEhO?=
 =?utf-8?B?dVFtRTYyNnkyVzlnQW01QmIrdllRaG9vM0xtSHc4eW5VUDZlZ1BGRnhtTFpv?=
 =?utf-8?B?d1A0S3pnZmU1OUxTc0dMQzhnalU1Sk14T0R4MDlUak5ScWpaMHUwaWF6RlI1?=
 =?utf-8?B?SFl1cm5TNHdxcFQ3TFVVanVvVlhLV0JmbGh2aS96cVVQZkFzZGxMMmxZMjJB?=
 =?utf-8?B?VVhGcmhBczdLZ2JUMU04ODlnQ1ZHU3UxSUZYS3NmOUxMaGhwTkdWcElPTTRY?=
 =?utf-8?B?ZndQVnNsdDJ5Nms0OGdxMUZQbE1xVzNKeWFzL0ZDci9XMmZSR0xFMzBoS3B0?=
 =?utf-8?B?U3RLOE1oM25vZ0xidUluZitvUHJOMXF3VWx6Y2pLTUovSjV2Kzk4WEo3ZHEx?=
 =?utf-8?B?MmdiSncvdTZndXp2TE16SEEwU1hFaHZZS1hGNzhvbGhPd2dIc2JLajkzeFhs?=
 =?utf-8?B?aWx2eEJjZGZrK2dJYVhKalRyT0NHOXZOd3ZXMW81dDJ0YWEzUjFhTk1GeXhX?=
 =?utf-8?B?b1BLb1hiR3R6cGF6L0RnbHVUQ1RaL2xtRk0ybkFxaXhlbmFmQWh6SnQxZ3R4?=
 =?utf-8?B?QUQ4TGZyVWxsUnYwZnVCbFN6ZnJqajBoZHFvb1oxUWpqbzhpdFJPNXpQZlN4?=
 =?utf-8?B?ei9mbWQ4U1FRMVI3S3h4bU80MHZsbXJ4VXF4Q1pMTUxpSnBNaW5XSkgyYmRs?=
 =?utf-8?B?QVdjb0Fpdmx4SzROdVRvZTVPRDNuVndOSTVtZmowRDhjdzR6RzV2RUFzTTR2?=
 =?utf-8?B?dHgxWVBVK21CR2QxWFg0KzNOWmJFUWZMbU16YU11RGw1Tjc0cXVlWjBaVUlZ?=
 =?utf-8?B?WWt4YmpOTmJBS3I4WVJEODcxR1hGTFE3TGdpc3ZOYzZjWnRrZjVKdE9aeUoz?=
 =?utf-8?B?RjZ1K1VyZ3ZqbHAxdUpNTnVYQWpqejBaQjFLL2d2bDZtVWdQL0t0b3Rhbk9J?=
 =?utf-8?B?KzR5MjMwT2JBbkx6aUdZRkdWQTQvdjRTejRFS0pDdUticDJuMXBkWWs1ZFFR?=
 =?utf-8?B?THRJR1cyOWZjZVFodThWeE5mZDkrN05Sb1pQMVhOQXg3R1h3OWNNbllEV1Zm?=
 =?utf-8?B?eUZOQVEzVGFXVTF3ZFVoUW1WbHpJZEZPdDZVNVh0SDNEZTRuYXFja1IwMUti?=
 =?utf-8?B?ekdmUk03c1l3VU4raUVDM2dnd1pLZWpKZHBtc201WjlBZDFGQWM0dE13aXFQ?=
 =?utf-8?B?YnpnZ0RLZVYrNmpoZm9RdWFFWHFSV0FJYmp3QzY0b1ZvUSs5TDlJQWtRSmFI?=
 =?utf-8?B?bjV4RTFvT3VjUEZSYmw2a0ZkSVNsMUR5RGVwQmRPaW5LNFJ0eDJNc2dCNjhP?=
 =?utf-8?B?U21qTU5nUHRISCthUkYrTDgrbW92ekVpU1NRQmRpS0ErSHRvZFoyaXRSdHg0?=
 =?utf-8?B?aGNDdXlkTDU1UWR1SzNZWGkrYWJlTXRGbGhLUWdiZWQxODQzdk1hWm1TNGxH?=
 =?utf-8?B?SlZFOExSYUp1My9KajVFdVl5Q1RkYVg5ZW8rVDJyWkJ2NFhmd1R2MENjbGdZ?=
 =?utf-8?B?NlROZUlFTTJmb0ZqbkRoMHVxNHBxQmU5QkMvWFcvMDFnZkRnUmlTbDlFYVQz?=
 =?utf-8?B?WWc0b3Nkc0VIdHYxM2cycFVsWUw0SEZrNWYvYXBnWWVrQ1cwVmRFcEtYQi9n?=
 =?utf-8?B?NmNvWDFNM1ExYU1JcHlVN0w1UWlnZlJLNGQ3MnUvemFTTTFGQWs2N1Zpamdp?=
 =?utf-8?B?cjhhSmEwaXFheUZJYmN1YlVxMkM1T2RvZ0FtbFdyZW4vZXBOU2JpWDdpUWtB?=
 =?utf-8?B?SHdpMGVJdnI1bStkU2thdm0wcjhTSnl5VG9rdkNSUlJoYTFKK0JRSUd2eFZ3?=
 =?utf-8?B?Tm9ZU1RxNVI5SURSSXRPRGtscnpGaEw0S2VrYVlYTWFIazB0cmJpbER6YjVL?=
 =?utf-8?B?a010RDgrZUVUei9EbWVMUFFQbkU3eVJERzdXdTN0L002Z3dUeTJ3bDFEZFRE?=
 =?utf-8?B?cXZLMTZqZHFmankwRmtQeUlxZ2orZTFMZ3pHZXVLMU1HSnQycklQSE5vaFhn?=
 =?utf-8?B?K1ZoUE40TklQSDZhRjdDMjI0d1pJVko5VmE4dHowd3RUUkNqZ3BVUWkvS0xK?=
 =?utf-8?B?TytCS0EvMXVxdFBCY04zYjczc3JRblZ3MjQzSmpCbGh5Slc4aGZjMVhXQXlH?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n5cDtEB9WPN/fPWKFk16SSyQ2fC813qM3m48U38uPWIA9OjR6pY36UBbfznnfKRVcsdV8fjDkL3X9kzH3c6ECBdxNfE1gP2shxoicHb5gZ2JaS9Sdl5i1E+ZfPzdZ+w5Y48o/vqXeH3PqJcEv/uVUcuUOiD6H66eGiQK19gO9vnow/e3s2eW+IyaGxlpCLGIDbX5H+pfeHcALkdY3JKGECb0i1PO07RdQHvz0ghvz/Kk0bAQoPiyXExCA2MjtlznfB2LMHF4jcB1b9MPFy3kaSxh0h1BsJb9voINUdkLKDr6oNFdWbi9i7f82hLk8ooRPz5FLyjVSSQty1N/ISc7aIMj26F4oOcGDQoaTFaBP/8PG4jkpO+qOXgQSr38M+dQvFzMplOxKLPoo8AAiuhTefxH4/vMAaupzF5PZz4UZ7Sh1B0f2h9NI/hq+JQ2jQJKIqbZfZ3+9Yk15O38AX5wuBABjehfAIV/gWZNgIpSO0+NtZJhK4++t/IoG6QAEdNqe3tE1+UvuhShycWvDKkBYrltdCaNrdzPGtFHhNKeqIHk/zYm4qNN+fhG0R/J3Umm7j5qumijN5gEPfrtQckM5WVG+hzYjf8hek1X9RHTrmo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af5ce770-e5da-44e3-f10a-08dd9cffab5d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 09:20:06.4111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0c6UwjPXAXmr3BmsIXGRRgIdgXa3XZwNk8WNE3itxhHdwx0eGLqbvIFm3UcCdDCCMU9Wi8B/qMYkySlkMJWWMJs2Fv8oUrKyudOwi8C9N4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6298
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_04,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505270074
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA3NSBTYWx0ZWRfX7krogmWnKuiq jDuWffINi6zr0HM6Ffke+qmM+4GXpo2yS+wEcJ1bcDJqihR3nQSPTieoe8i4kfWytjm612T8oth fTdz0InzQHRye7UgHl/7jxLrtBQVoVrGXqeHvMmuymQyjURRSv862khXuGBXg6cLsl23Hv0wVLi
 BqkjlI22Q7tB6iLnJKTBE1rLFxgbCRDjPjHpMnICi+QTpYV5Z0L5Pl/M/efpOmnC+Gl29c+qOX6 I1rl64x9ZaaaDkd8C07WyGXIYzI8jDu3okr6MP6wTJYvHnvHtKoK01iWtoFbbxH62vYIQ+Baq8i i1HLgkxCl5lN1bf/r2mPHsI08RcWTARMFmNhk7PjHprXXgJIyDiafd4P1VEJ1OdN5vTJxLfhO5B
 pPucPBWg6AHaD4eSTkDCN/mQYOIbcnJDg76UNaybjTXDKNIKaoVl6AFN7ABbj02DfG5EBbxo
X-Proofpoint-GUID: 1f5AJiaMgFxGTd6_sZUR3Tc30CIKEw4O
X-Authority-Analysis: v=2.4 cv=aO/wqa9m c=1 sm=1 tr=0 ts=683583cb cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=A2pY-5KRAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=1XWaLZrsAAAA:8 a=CyYOJqRsQwjmhBsHiA8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gmshbCpD-_wA:10
X-Proofpoint-ORIG-GUID: 1f5AJiaMgFxGTd6_sZUR3Tc30CIKEw4O

Overall - thanks for this, and I'm not sure why we didn't think of doing
this sooner :P this seems like a super valid thing to try to use the vma
lock with.

I see you've cc'd Suren who has the most expertise in this and can
hopefully audit this and ensure all is good, but from the process address
doc (see below), I think we're good to just have the VMA stabilised for a
zap.

On Tue, May 27, 2025 at 04:41:45PM +1200, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
>
> Certain madvise operations, especially MADV_DONTNEED, occur far more
> frequently than other madvise options, particularly in native and Java
> heaps for dynamic memory management.

Ack yeah, I have gathered that this is the case previously.

>
> Currently, the mmap_lock is always held during these operations, even when
> unnecessary. This causes lock contention and can lead to severe priority
> inversion, where low-priority threads—such as Android's HeapTaskDaemon—
> hold the lock and block higher-priority threads.

That's very nasty... we definitely want to eliminate as much mmap_lock
contention as possible.

>
> This patch enables the use of per-VMA locks when the advised range lies
> entirely within a single VMA, avoiding the need for full VMA traversal. In
> practice, userspace heaps rarely issue MADV_DONTNEED across multiple VMAs.

Yeah this single VMA requirement is obviously absolutely key.

As per my docs [0] actually, for zapping a single VMA, 'The VMA need only be
kept stable for this operation.' (I had to look this up to remind myself :P)

[0]: https://kernel.org/doc/html/latest/mm/process_addrs.html

So we actually... should be good here, locking-wise.

>
> Tangquan’s testing shows that over 99.5% of memory reclaimed by Android
> benefits from this per-VMA lock optimization. After extended runtime,
> 217,735 madvise calls from HeapTaskDaemon used the per-VMA path, while
> only 1,231 fell back to mmap_lock.

Thanks, this sounds really promising!

I take it then you have as a result, heavily tested this change?

>
> To simplify handling, the implementation falls back to the standard
> mmap_lock if userfaultfd is enabled on the VMA, avoiding the complexity of
> userfaultfd_remove().

Oh GOD do I hate how we implement uffd. Have I ever mentioned that? Well,
let me mention it again...

>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Jann Horn <jannh@google.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  mm/madvise.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 8433ac9b27e0..da016a1d0434 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1817,6 +1817,39 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>
>  	if (madvise_should_skip(start, len_in, behavior, &error))
>  		return error;
> +
> +	/*
> +	 * MADV_DONTNEED is commonly used with userspace heaps and most often
> +	 * affects a single VMA. In these cases, we can use per-VMA locks to
> +	 * reduce contention on the mmap_lock.
> +	 */
> +	if (behavior == MADV_DONTNEED || behavior == MADV_DONTNEED_LOCKED) {

So firstly doing this here means process_madvise() doesn't get this benefit, and
we're inconsistent between the two which we really want to avoid.

But secondly - we definitely need to find a better way to do this :) this
basically follows the 'ignore the existing approach and throw in an if
(special case) { ... }' pattern that I feel we really need to do all we can
to avoid in the kernel.

This lies the way of uffd, hugetlb, and thus horrors beyond imagining.

I can see why you did this as this is kind of special-cased a bit, and we
already do this kind of thing all over the place but let's try to avoid
this here.

So I suggest:

- Remove any code for this from do_madvise() and thus make it available to
  process_madvise() also.

- Try to avoid the special casing here as much as humanly possible :)

- Update madvise_lock()/unlock() to get passed a pointer to struct
  madvise_behavior to which we can add a boolean or even better I think -
  an enum indicating which lock type was taken (this can simplify
  madvise_unlock() also).

- Update madvise_lock() to do all of the checks below, we already
  effectively do a switch (behavior) so it's not so crazy to do this. And
  you can also do the fallthrough logic there.

- Obviously madvise_unlock() can be updated to do vma_end_read().

> +		struct vm_area_struct *prev, *vma;
> +		unsigned long untagged_start, end;
> +
> +		untagged_start = untagged_addr(start);
> +		end = untagged_start + len_in;
> +		vma = lock_vma_under_rcu(mm, untagged_start);
> +		if (!vma)
> +			goto lock;
> +		if (end > vma->vm_end || userfaultfd_armed(vma)) {
> +			vma_end_read(vma);
> +			goto lock;
> +		}
> +		if (unlikely(!can_modify_vma_madv(vma, behavior))) {
> +			error = -EPERM;
> +			vma_end_read(vma);
> +			goto out;
> +		}
> +		madvise_init_tlb(&madv_behavior, mm);
> +		error = madvise_dontneed_free(vma, &prev, untagged_start,
> +				end, &madv_behavior);
> +		madvise_finish_tlb(&madv_behavior);
> +		vma_end_read(vma);
> +		goto out;
> +	}
> +
> +lock:
>  	error = madvise_lock(mm, behavior);
>  	if (error)
>  		return error;
> @@ -1825,6 +1858,7 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
>  	madvise_finish_tlb(&madv_behavior);
>  	madvise_unlock(mm, behavior);
>
> +out:
>  	return error;
>  }
>
> --
> 2.39.3 (Apple Git-146)
>

Cheers, Lorenzo
