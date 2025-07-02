Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06241CCB4B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 21:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751491471; cv=fail; b=MP/6MLm3zMaUg2Ta9TdJkFnbXmD3y4NLlCqnmBOTqiiPhUaKf/KqEYBBE5UlkjuCNnzpiJrtj5DpS0TvTeIFK8DfXEyHDKfnWMs1adL/jHYXUhuWhWAo9Ts6NRkmr3jbsLkTy0G7RQaPodoODAE5mA/o6XKivB09ovoz3chYeuw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751491471; c=relaxed/simple;
	bh=0cg/6Wn91jjA6rvemt/uqgiHpeO27G/ASSDoaDzZMpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=c/4zGQlbkUmIsw6crAbxCUhScmfWmN1c52JnrrErDi1bBvDzW4rLDVz32XpuVnYTqkMHda5USncJIOGYfyFziH/OO4Gjp1o5bQ/Aqd4VsQw987UXcZLU7IPOUdgwXH/F36gOL2OvC7+YBH6S9f3kjDQC2brltBpZ0lAcIAyZE40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oyrPUyRS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Ryu0Qz2/; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oyrPUyRS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Ryu0Qz2/"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562KfnqR026490;
	Wed, 2 Jul 2025 21:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pbRtJ7kS1VqVwSxJr2ueKYqPe/1qB1i001sEC4/945g=; b=
	oyrPUyRSOyGq8K/cRPRLpudjXFAvl3YM3VS+G/vW9ZBCmCJ8XN3XeO9jG95+91Tv
	tsIde7imNLZDIrg3IRg0BI/t1kc6CnwF8rPU38Od90nJrYQu+DA5Co26H+fiEjkW
	MZchR8CtsP1N04J9HyEvr02YtUB+rerLLyhOcghqnGiWsNIIQ1wl3S7x0CQVOR/B
	nHSxDr5Hr4iQzRDqVC7aZb4lIz7Njz0TIXvkOTMbskb4MIuicxNtJgjCZIO79zJk
	V93/YBqXNUozod927780EAlA1Zfl71AAqIPdXAbMNrJv9T2xNUbSIDbsojVvJDvH
	SByOP2QB1h6oobSbQLozVg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w7uaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 21:24:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 562JNbWv033925;
	Wed, 2 Jul 2025 21:24:10 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2059.outbound.protection.outlook.com [40.107.95.59])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ubse2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Jul 2025 21:24:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1z4evaY/39ZJXXGG+mW9mFCocghz3TPlAlhjX971KkoBdPuFM7cAINnyyj47zRc99VAfd/Iq6WXyQ5pMFH5i1AH3eNLuKBg8xdUwrPOfpFlk/wqWzcMShGRE54r90iYbfs7RDnbomvw5yn4Ja8iV42skPEN8xkTWU0uUtUTKLSCXdBIrfKmNAgKgPHITRJVXz6Eh1/KJgBMTC6yB8+ttDMqTjolmuKhCDldLr8ZPDC7mYIbHq4GR5VIkaWstC8KCxAqkn7Gd77qoqfUZc9XogStvpjPmVXonLCWJZgCy3KN7s1rjNYeptanIqevNTqCwQbKl4lDGJT/iY10TB/q0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbRtJ7kS1VqVwSxJr2ueKYqPe/1qB1i001sEC4/945g=;
 b=JGvr+/61Rwy5LNhrbYe8CE4l5N8fvakNGPyypxFbTsxAlM1FrO+OQ1nZPXQkmYMEmE10WDWdh1V6deI7x3A5CiGyKyEQswn9uqJq41asunK4QndJbsg9PcCMVvVcW0fLPGSRxky3JU0TphgolEQpC+HMLeQVwQ9qCyvx+ORzqdGfwX/+0OuOy3+yqXaJE/9xKsWk94DLUh9rWPXgLth4G4ObKn8ioLc3HrxxuDrwZr/6lVo3Y7uroY10udcVq7vy93MH+wnjM/MaZrb6xziy4EFMcqK/6/MWsBxZpNSOZ85gL7/cNRhWo7C+ohm/i0MG2jbt3FP8pd1vfpAuZij0ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbRtJ7kS1VqVwSxJr2ueKYqPe/1qB1i001sEC4/945g=;
 b=Ryu0Qz2/Ew9NCkY2H3wL2qTg5EeFpK6JR1NtfTxNgPjedrxpPxmHmlMKP5vJ4rLiy8V6Ok8tlrSIZd6CXsePD+0VQnjshXjbg2VWnzFCpRSsKC4s57hnwxWOuk9WQj8AD7O4Iykzpbn+OzTLobVHNmeULsoKpF18uT+GvHSYBsc=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS0PR10MB8007.namprd10.prod.outlook.com (2603:10b6:8:203::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Wed, 2 Jul
 2025 21:24:06 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::75a8:21cc:f343:f68c%6]) with mapi id 15.20.8880.015; Wed, 2 Jul 2025
 21:24:06 +0000
Date: Wed, 2 Jul 2025 17:24:02 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>, Peter Xu <peterx@redhat.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Vlastimil Babka <vbabka@suse.cz>, Muchun Song <muchun.song@linux.dev>,
        Mike Rapoport <rppt@kernel.org>, Hugh Dickins <hughd@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        James Houghton <jthoughton@google.com>, Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <rsumpavnbe63jvfz7w63batked4obgnzmz4boeee6q3wiv7smi@rkok2a4vug72>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, 
	Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, James Houghton <jthoughton@google.com>, 
	Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, 
	Andrea Arcangeli <aarcange@redhat.com>, Oscar Salvador <osalvador@suse.de>, 
	Axel Rasmussen <axelrasmussen@google.com>, Ujwal Kundur <ujwal.kundur@gmail.com>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
User-Agent: NeoMutt/20250510
X-ClientProxiedBy: YT4PR01CA0466.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::8) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS0PR10MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: ba05b146-1d07-4771-8a63-08ddb9aec669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUdmTnpPOTVCY094SG4wRUJjSUplWWNlWUtOa0xzNU9objdVN1JSZTJqcE1N?=
 =?utf-8?B?eERtZDJKaDdKN1lDcEpObHZyVXNQYUNnTjROSDl3ckR0UnM2MGp6QXF5UlAr?=
 =?utf-8?B?RkwxbElhL2Jack02bFprKzNDOEVQOGxrV1h0dTFLeHdFSDFYWUx1OVozb1kv?=
 =?utf-8?B?c3hZTkZUVkNkcGFMd1RkK3cwaUxwa0VmVEIvaFAxVlNsa0YrcGhBR0dQdHQv?=
 =?utf-8?B?NWQ4WU5aeUZ2VG1FeENsZVdNWWcrVUd1aGp5cnVHTFFFQ3Zoays2VDlWTE9z?=
 =?utf-8?B?aWNVUkdWSGJyQ1hQQTQwRXY3RkZrSUhTRnVXSWliTXhOVDVrWGhKNE83alZL?=
 =?utf-8?B?YjlnMXBFcUJpKzFJK0Z1cnZhNXZqamp1NFExV0ZNSjV3Y2VhZXBGb2h1VWlq?=
 =?utf-8?B?YXdBVTMrZ3NTNHA1Z2ZKTFFzNEY4ZlpOdVFKdTZBOE9YRitwaUo5clVtcDlO?=
 =?utf-8?B?LytSSUJtMWRFT1IrdkJwNTR0M0Z2dGtKS1haY1prOGdYOGpzZjN0cS9MTlk2?=
 =?utf-8?B?cGFqUHlsZWxVV2pPSWVDcWNyQkQ3aFU3anlKTG0za1hSZFoxMTU4blNTRG9L?=
 =?utf-8?B?YXdIaFZqeU1kQmVMV01QeG1DV0tMd29PT1UyL3FQdjgvRjJIRm5PYzJCYmFw?=
 =?utf-8?B?ejA3NTcxTFI2U0NnZDRaNXg1ZTVwcXhlYks5Z0RXSFlVa0YyNE9OUlBraHM2?=
 =?utf-8?B?Zkp3czRwSDVBZWxaN1A0TVdTODdkZDN6QUhLYWlzRzRaZnJ6T0p5N3FkelFF?=
 =?utf-8?B?a1h0TWNQUFlPRytTUnRmblMwU2NMck5MYmw4R0srVFhGWEpEcUVRSEtSNXIw?=
 =?utf-8?B?TkRNQmJLN3FNV0NWSTBJbFk4NHVmVytPdVhsTDROb1JqVjFVSkcwYjhMaS8r?=
 =?utf-8?B?NG9UTlZwTmFJRFovdGExZXU2K2F2ekN4eXdXWXFheDhlRlk1Qldibzd0NDZy?=
 =?utf-8?B?TnkvamlEbDNOL2JBSGZwT1ZpN0hoQkZFUDFXT1VOZjUzRFBxRjQwVzg0NGdD?=
 =?utf-8?B?UmpUeUFWemFCb1pHNWFwem04VFQwRTJ6dGNvM1hFbHhaQ09teW8ycWRXM0pP?=
 =?utf-8?B?T3paL21UZFNHdkFZdGw0NlFIY0p0M0pLK2ZoVGZqMzlaWGtRQ1piUGo4aHVH?=
 =?utf-8?B?NnlKNE5DaE4zQ1V6cGYyZGJTR1V5ME9hMDZ1T1JWUS9xZHRNcnRFNDJhdGZ3?=
 =?utf-8?B?Z2tHUlRkcVpiT1JXSmNjbXJjdHhNNGRPVHoyS1BTV1hMZkp5YzNVUDZKTWhQ?=
 =?utf-8?B?TEU3UkU5bGNlQkRsUWxsUS9nS2J0bGdSM3c5eTkwQ001NW1NeXFHS3JaS3lx?=
 =?utf-8?B?aTZHcGhDeDFHcjZaT1dhVHp2KzBIVDdCSkVBdGtxUUlsc3hWT0FMZVRKem0r?=
 =?utf-8?B?U1VabnhETTV1cldpMHJtbWVEZEw1T0V5MjE0a1d1MktoMTdrOUFOdnRsdjJr?=
 =?utf-8?B?T0VQMEY5eHJJSHZURzF0WGhEdkdBdURTaWtHQkNTOXVlOTd1MHBzdHVjTVJ4?=
 =?utf-8?B?YUdnci9KWFdma1g3TytUeUx1NDF6QXBYZnUySHNEOXVmSmJDbVZQQm02YUo0?=
 =?utf-8?B?WXhuL0lVTXVkYldxZWJRQXFjN0paa1dlT3Myb0t3dEhKcDlmbk41WThBSldW?=
 =?utf-8?B?SkRhTUhYMXFWRXg4RW1nUkhpaU90VllhSjljcHkxZ3ZINVJOZ2ZjVCtmcXVR?=
 =?utf-8?B?YTNFU0VJZmdlMi9SNFIrSU9XRzMxWktxeGxMT2UxdnQ0NWdUSkdxVUh2ZG5i?=
 =?utf-8?B?MVhOelZwQ0lkQWlMZjg4eHVibzFGUTdPS0dJUzZmZDEzRWJUZ3ZPSStvdXhX?=
 =?utf-8?B?Z0RnMllZamVraG51TzhMQXJua3F1WWZBYkE3VWx0RURkQjBaaXVPWTlqQitL?=
 =?utf-8?B?OThRd2JvMHlXaXBTeFE1VFVSbkdQZVNiaXBYWTJpb1FXZlZNTWZmUnhMQ2po?=
 =?utf-8?Q?jEX71rOJs64=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEcrUjFDOVdCeWpuVGs2Wm0wYlpBMVJQZHNBeExGaE9YemcvMnEwcmtYRUpx?=
 =?utf-8?B?ejJQSzBUTCs2MzhBRjA2MHZoNktXRktCVk9waHhHU2djWjNNaWEzSmI4ckhL?=
 =?utf-8?B?VU5SVzBvM3YxRXNMd2xQay9HbllsZDVLMlFTa2E1WG1BMGtmSWtnSnE1akw3?=
 =?utf-8?B?Wm5EcHdHVnIzVWEzckNGK3Fwa2QyQ01KUW44Sjg2RmVRL3NMbDBCVTYyekJT?=
 =?utf-8?B?eHpJV0NTSGVpaWQzMW9WdHhMd2Z3cXloZHVTM3ZOcDlqdUdIdTNBYUw3Q1dM?=
 =?utf-8?B?ckNxV3NVaHFIRWJrbGxTYjVHU2hPSVNobDNaYzBWYVZnakpnak4yUzFPZVN0?=
 =?utf-8?B?K2VKb3o3UmVzNnRPVEE3dmVvaWNCT0dFVmkvckJUekxpVTFER1NoZ1RTT0wv?=
 =?utf-8?B?dDJuejFPaTZaN25ad1BFd242NDhaVkV4SStBcEpoNjhybjdCMVp2NS80YU9I?=
 =?utf-8?B?MTdEaWxEZE1OejBBaHQ2UFd6QU16YlNCcG0rY2ErQ3ZlL2VDUzBnQWppVisz?=
 =?utf-8?B?Z3hSRU1GTmZ4Vno5d3FOc2FKTWZhUDB1STl5SExkc3Rqd0JUa0ZJemlReThF?=
 =?utf-8?B?UEthc1lhZ2JqUjZjSlBxV2J3bVF2TUJJUE9QTEFGcE1YaWhTT1lJbkU0RXJK?=
 =?utf-8?B?TmNjamlCOTduZThIdENIV3ZvSlFqbXFwcWorVXlveEFjbEdvdWozNzNRaE5P?=
 =?utf-8?B?bUtveGRGcnNQS3I0UEVPQUpBby9Qc1hoOXN1WTV2ZU1XemswL1R2ZW9va3pK?=
 =?utf-8?B?WlYzZDJqeDZhcDJNVjNlZ20wUkdPT3BlVHVCcHUwUVBrc3pkV0lERExLNVNO?=
 =?utf-8?B?aGdKaVh6aENSYWtpK2RQY2lEWjhSSS9DRHhKTVZZTkhmL1MvZXI1aUlrM1FX?=
 =?utf-8?B?ZzR2U1VRRzlycFhWblM4RjBJRVFuTU9SUDZFcGZ6eExJSVB3aWF3dnFwUzBj?=
 =?utf-8?B?VWpnTUxzUlh4Rms0Z0ZkeEQxRERiamxCbHJVZVhNNXYxOHBUMDJaVjVnbGdt?=
 =?utf-8?B?czhEOFpscEt6REN5RDJOMHVsTWs4djBURU9MSzRRMERhaDM5N2k4VVZ3T1Jk?=
 =?utf-8?B?N09aVnNxclpUcHVmQzJNMDRZOGxBMFZTOW9FSFI1YzVLakxCd1NQWDgzOWRi?=
 =?utf-8?B?M2RlSVk4N1FyOXZBOEVKbk54clNKNlQ4Q1FHK0dKNGp5NkwvUDlackpyeE5V?=
 =?utf-8?B?emNCSHFQMWNaOUJIMGFOc1FTaTd6ejl1V05TQjJuYmVpQ05FZ0pWbDI4L0cy?=
 =?utf-8?B?RnpUOEdFYkZ2Q21ONGFQanEwSXZYci9XdzlzUkEvNzJXcnFHclFadDlLZXBU?=
 =?utf-8?B?YjF2bzFsQlh1R2tuRjFZMmZaQmtHUjFOWC9mekJ6ZnpwU2ltMjhhN2JVUWpI?=
 =?utf-8?B?cFUrS3FrbG5uSHRzZmRBRU1qTnR4ZnVlOE0wL0hVV1Rrd2tvM2k5S0xqQStR?=
 =?utf-8?B?SnNoUllKRHhwbmlDQjJ2RDlEb3EzSmVHOStWVlI3TmZpTHNwbjNpQXZpL0NG?=
 =?utf-8?B?OVpPMVdiU0UwOHZlVFRmVTdDVm15RUh3L3FZQStEbStwMDFtYWVMMFlYdVkx?=
 =?utf-8?B?Y0l0UVI5MU02Q3gzcmZTOXkvejZ4QUNpTlo4RlZMZjA1ZXlvNUZ1Rmlxc0Iy?=
 =?utf-8?B?ajZPRmNvNDJINStwcm9JVjdSUkRPUUYrTVV5OHdVdWhJSDUwMUplTWswM1dC?=
 =?utf-8?B?bjFJN1dBK1l0ZUdISmcwZGtiTXV1QVdYUTdndFRVV3krOFQ0UHduU015Qk9P?=
 =?utf-8?B?VkY3a28rbUhvWTRsR3VkVVJTUkhuNEh4S2x0M0hRTjJIOEpqR1llcHkvTWhW?=
 =?utf-8?B?MG1Ob1E2N2VTTWJzMkJ1MTdIMUFRaDhKL0dqakovQzlJL0JBRnhOMks3QWR5?=
 =?utf-8?B?WE9UZWpyZHdCdmNhUk9oSmRseTIwZGxZKzlnVyszcEtMcjlUTllVVTYrZFY5?=
 =?utf-8?B?QkNBNVRucDZ3T0d4bmtjREwvRnNFaXkvNnpSZHRTL1UyNkNPdHo1SU5qT2x4?=
 =?utf-8?B?K2Zyc2dIWUNGbXc2eFZ3UGd6blk2OEdBM1RpTHdZQ1Q3K0UrQkVUV3l5YUNR?=
 =?utf-8?B?bDYwcjNlN0ZqY2E1TUhzdUdEUzZDTXJ6RnZ2U1FBWnhLaDd5UEtab1EwMFo0?=
 =?utf-8?Q?APTEluPsTcEBpLnUJ/3TFarJ5?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZBDAnEO4tsc3B+LleqUtYUWE+GfshCriP+7soe/l0CbW/XKk58XJ0010NmDuMGwxohBDOF0uidX6LdglE577K/laHz9wdVJX+9QA94H/zi6xB7JRWKHnalvTxmLqbqMSZ7BfQtq7lGF3mXvAAbmwan5SrCJxcxf6dlu38Hu3uNCe+AWeoWHlvYgKXtowZaV+8Ky9avqLjW0ftQHVMmgWwTfmREjXAdV4pZxu4m6jnCZoPwhPSvr1EgaVaDf4w43LXJTC4tZ0AC5Pq5Y6xwp+6KdiYj4/Oe/psLPMTzVITGxDEqr4dZWsQJ88KUqrJ6fTc3LpMa//taO5ANJC58SeoULZIlhxuaDI4u/aST4tjCpFnWMPxzwY6r2WWrV2iDxT2Zn+kDSatqtbsh8jxoZZfnDN/v4jH4KOnTYwQf4XGWUtdeZJUyRb5jQH9YvpIiyE4clEOsEwiLTG9JRsOxCcw0MNzx2HE2tT/U2EPoHerAHRb43BPMC1tTTvm/xfHwgo/8ZujVrOD3s8w2IL+vFFkZ+gzgOyn5E5gRYRaFxNcubLaRhsd2q8ZsITX2DNaHqURKXp5T/PzeGfBqv3fr1Ubb0YCeT+gLllQ3FCfjWk2xA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba05b146-1d07-4771-8a63-08ddb9aec669
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 21:24:06.2343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8uc9XqleOzLz/JIDMYvsuJaV2NNHGfAIhglA7HItiP6JOxcaAL7Q1Fog8yO+LI68fVBZ8e6CgQEXOEPe9r+EzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8007
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507020177
X-Proofpoint-GUID: KGrwgg4fISD7I9i1gB-mBhaMabGgrLRU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE3NyBTYWx0ZWRfX8FXsYKbf0Pjs Bv/D2+XVh4ZWrAA7cOHxKCqptqCJgT2gYh+ImwqC2KXL1RHl/7nVzDHULIl9GAfYkSeg6FYxczq KkLuii453muuKWoWus3x0t+dY4RRgftPnrjnMTDJgerxiJtQnW+mOhGDrxWPawXdG/mgL5jrZrS
 nA8KZfwLDjBPDDZsDDxZDLUlRuEQKC4/UC14Wh1UFX+igXvuEipsaWO4mjJBZaOjF7AdHk0gW45 tzOICm0yDGz9vH9K1s8fVFfUejqZo8g9tI2X+ah6wEIKCNtc2otEMCDrBGYhtYTRfKlOnQwn/9V teuT74KeQRuqj+OXkTs04urG9cHmF7ohe4eGOQCIRwSHPT8itm5vbC94jL7a9Zz3E/mRG77NDk7
 fvMJrpJVKfh4ZGxNQg4p31Jzni2WZeF8yyk/YxJ+0T05akLtqzyGYtisGHJ0sJVqvRjXpW6y
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=6865a37b cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=vggBfdFIAAAA:8 a=yPCof4ZbAAAA:8 a=zEJHRJnkUyuRthDBexEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: KGrwgg4fISD7I9i1gB-mBhaMabGgrLRU

* Nikita Kalyazin <kalyazin@amazon.com> [250702 13:08]:
>=20
>=20
> On 02/07/2025 16:56, Lorenzo Stoakes wrote:
> > On Tue, Jul 01, 2025 at 10:04:28AM -0700, Suren Baghdasaryan wrote:
> > > On Mon, Jun 30, 2025 at 3:16=E2=80=AFAM Lorenzo Stoakes
> > > <lorenzo.stoakes@oracle.com> wrote:
> > > > This feels like you're trying to put mm functionality outside of mm=
?
> > >=20
> > > To second that, two things stick out for me here:
> > > 1. uffd_copy and uffd_get_folio seem to be at different abstraction
> > > levels. uffd_copy is almost the entire copy operation for VM_SHARED
> > > VMAs while uffd_get_folio is a small part of the continue operation.
> > > 2. shmem_mfill_atomic_pte which becomes uffd_copy for shmem in the
> > > last patch is quite a complex function which itself calls some IMO
> > > pretty internal functions like mfill_atomic_install_pte(). Expecting
> > > modules to implement such functionality seems like a stretch to me bu=
t
> > > maybe this is for some specialized modules which are written by mm
> > > experts only?
> >=20
> > To echo what Liam said - I don't think we can truly rely on expertise h=
ere
> > (we make enough mistakes in core mm for that to be a dubious propositio=
n
> > even tere :) and even if experts were involved, having core mm
> > functionality outside of core mm carries significant risk - we are
> > constantly changing things, including assumptions around sensitive topi=
cs
> > such as locking (think VMA locking) - having code elsewhere significant=
ly
> > increases the risk of missing things.
> >=20
> > I am also absolutely, to be frank, not going to accept us EXPORT()'ing
> > anything core.
> >=20
> > Page table manipulation really must rely in core mm and arch code only,=
 it
> > is easily some of the most subtle, confusing and dangerous code in mm (=
I
> > have spent subtantial hours banging my head against it recently), and a=
gain
> > - subject to constant change.
> >=20
> > But to come back to Liam's comments and to reiterate what I was referri=
ng
> > to earlier, even permitting drivers to have access to VMAs is _highly_
> > problematic and has resulted in very real bugs and subtle issues that t=
ook
> > many hours, much stress + gnashing of teeth to adress.
>=20
> The main target of this change is the implementation of UFFD for
> KVM/guest_memfd (examples: [1], [2]) to avoid bringing KVM-specific code
> into the mm codebase.  We usually mean KVM by the "drivers" in this conte=
xt,
> and it is already somewhat "knowledgeable" of the mm.  I don't think ther=
e
> are existing use cases for other drivers to implement this at the moment.
>=20
> Although I can't see new exports in this series, there is now a way to li=
mit
> exports to particular modules [3].  Would it help if we only do it for KV=
M
> initially (if/when actually needed)?
>=20
> [1]
> https://lore.kernel.org/all/114133f5-0282-463d-9d65-3143aa658806@amazon.c=
om/
> [2]
> https://lore.kernel.org/all/7666ee96-6f09-4dc1-8cb2-002a2d2a29cf@amazon.c=
om/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuil=
d.git/commit/?h=3Dkbuild&id=3D707f853d7fa3ce323a6875487890c213e34d81a0
>=20

That's because the entry point is from a function pointer, so [3] won't
help at all.

It is recreating the situation that existed for the vma through the
vm_ops in mmap, but for uffd.  And at a lower level (page tables).  I do no=
t
want to relive that experience.

We are not doing this.  It is for the benefit of everyone that we are
not doing this.

We need to find another way.

Regards,
Liam

