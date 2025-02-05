Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD8618F2DF
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768310; cv=fail; b=XccN9x9Fjb88X9Xru15B/Hzc6Ouu7lP+sxcH+zITqcgZ0Vy+KvtxulZXLDeMmTiDozwllrjAHiUneTOnL0qfJ1+7dVTSAwoz0BMrYqaR7B4IwA0jaXFivxoVo1vRUnSg7qYELDHbmm37FSJBy9pIUEEo0NWwAb+On2kba9RTmBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768310; c=relaxed/simple;
	bh=+QaGpmyv7gA6LZPebByQ+S3L138K2AFUotTiKt/jK70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hhv2CYKvLQAClKe6jUtYglbhNlUQ2b8czABHmWY5G+SUfUg/S13VYIXBS+BnnqhJvf6p4UahbjnHL06aCNZqG0PTspXO3zk4TPTQzYKFVku6+acvqrQMPn25uBIcGhODBJjMPIH0tOAICYXgC673lKmqzF6zBcHl0nzhl+o7PFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nAw+P4Q4; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qCuEZbXg; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nAw+P4Q4";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qCuEZbXg"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515DRZ3m010280;
	Wed, 5 Feb 2025 15:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=HoIVGXyyRpzRjJskZfQ1FrTRTKk0t9AcKzi9Iier0qw=; b=
	nAw+P4Q4N88qz/no2YQivYzNkbW0OswPl1Etg/g2Vu/XbrQ1MFd7lzEFQlc+50GK
	PqiKpucSxIBrFs7vv7gcszH77b5pviA9bWkD4CpfV46ONvrocuFUDiXKyQo3SVw2
	0nshh+rCsc7ox1p2u5ikNj3kYg4MiBMPyuCj9tGvBlxpO5LVy76hFaCl+kvJBfG6
	Qly7b5lWQo1xZ3JPBUn1SpJ4I1KTQxYDgi9eycJJfRr9btHOFSU0qjtsYpORrHFW
	bu4Q61Cf8xWdcEC5M9fPlboh/LUj4jkUxaeina6GzLZuqWpgj9bpnE+cbSqNt3Et
	95Xo3l5DD2iE6zf1xlCaKA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44m58cgnu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 15:11:35 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 515EhGhE027811;
	Wed, 5 Feb 2025 15:11:30 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8dnsd3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Feb 2025 15:11:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLU2D8HtB89elXY7nhesepytzpEagruzh0Xsq+edkhKRAacKn7IWC16p+4NLchBKcc/kkosgZWSe8SbTDHfKrsdfgw6OeO6AFwfCWyBL/L7Zg+dVtN4TT3o9reFgG7F0gZNx9lzXTCM4GnfHsmjmwe7Ts6x1kLDhk8UW8slYqBo+ugY6xYiecfCJoYCUb757zo6nzTkszCpY4GZmEiufhYRfDkY2lmTt1zmXVCckxRbCWDRdtTBfLG2rgTmVy8/BUEL1vikbLRZHzEng5OVUtvCx46A8lwI1sb3v3+put9TD50UPUbRRZT2ufKpZLUobVfBHWyzzySqw54Sd4XDxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HoIVGXyyRpzRjJskZfQ1FrTRTKk0t9AcKzi9Iier0qw=;
 b=e0cX7i/FWvtW4AbtDqf+uQMTDuNtU3G0R5OOoPcw0tZGOOIUXkv3+oX8MxKSoSqZjypjfRM7r+kh5lD/9bwopXHWScBp9NaByCtWL3eYdhULk3UMozMmtQIi1Ml3vE6R83gQGTsu4mzRhK9JXL9DvACiik6jX66E3RX5p1cBY2i+ldk9xZGGpkpaG3RaDwjL6VAjUEddGcAI8CGLZkRP7B2g26EkftVWXxx3JmzW8Pht2S6brKPgW3UhBVtpqwlZBg+eQrjcVpS4crFIHuwYdp+sUF2POog8jCL5O4zi7Ikqd0IUXxlk4AeAiYG2p/rgnlfNBlX3laEdLOV3QfQTcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HoIVGXyyRpzRjJskZfQ1FrTRTKk0t9AcKzi9Iier0qw=;
 b=qCuEZbXgMv+kM92Rgk/YeJ1zvAvli4zZCZrBCqd4vvR1//BWOunEadUlAr8jckxhcuuV8R900N72p0b94pNJSxNgZQHxMQHNIiWvFTk22PJgQMJkI/YCegQbHRbk90tQ6+4PkjU8vZbnXr4f6pkkUGqh/2h5o1iLgE66PwXjOjA=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DM6PR10MB4185.namprd10.prod.outlook.com (2603:10b6:5:217::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Wed, 5 Feb
 2025 15:11:28 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 15:11:28 +0000
Date: Wed, 5 Feb 2025 15:11:25 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Jann Horn <jannh@google.com>
Cc: syzbot <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com>,
        Liam.Howlett@oracle.com, akpm@linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com, vbabka@suse.cz
Subject: Re: [syzbot] [mm?] KCSAN: data-race in mprotect_fixup /
 try_to_migrate_one
Message-ID: <13bb4bbf-92e7-4c45-a3a8-a52312015f92@lucifer.local>
References: <67a34e60.050a0220.50516.0040.GAE@google.com>
 <CAG48ez3KKEYRU+-Mkk+tq1Onv3QWg0jP6fEKYjNjRS+ziP5dAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez3KKEYRU+-Mkk+tq1Onv3QWg0jP6fEKYjNjRS+ziP5dAQ@mail.gmail.com>
X-ClientProxiedBy: LO3P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::22) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DM6PR10MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: 975d4bc7-c082-4163-86d9-08dd45f75d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEp0Sm5zeitFTEJxRXJzSHI3cTdQaHV3NmczUmRlNXUzcXpHcWhpamFuT0t3?=
 =?utf-8?B?L0RzKzh4K1cwUmpkWnFTbHF4RGhWbkRTaFpoQXR5UlQ3Um1JUmZYbHJONHAw?=
 =?utf-8?B?UU1kSlJxUFJtdWdhTWhpQmhvTUx6dnZhckJldjZWMEpmRmxNaW5jd2dDVjRp?=
 =?utf-8?B?Tjdpa1JhdFF3VzNtUmF1blJONE0rbGxhZ25qeVVZakVHb3dYMktEczF2Smwz?=
 =?utf-8?B?Vlg2aldUamJVTUtkUXVodHpHcStpWjdkL0IvcVlnQVQ1M0VzZ3VsSkp3YzE4?=
 =?utf-8?B?Zzg3MGUySC9YR0hCTGhYSm9OSHh6eVNDS0hXVHB3d1AvTWROelluZjY4cTl5?=
 =?utf-8?B?anAvc014ZXBvMHFYM0k1dmFYcGdJWFpqdGk2Y3BhR0U4TnNLdy9TeHo2dUQr?=
 =?utf-8?B?ek9GaU53eHR6cmU4R2xOd1dXTlR5bFlnQzFCTkdiYW1kWEU5QmdrcVUvazZ1?=
 =?utf-8?B?enl1TFpZdHZxUmY3TkE5NFl6Rk5STzZjckxuekFhczkwYkpUK0ZaUytHblNQ?=
 =?utf-8?B?VS9jOXMvQm9TV1ZHMlJhNlEwOVVOUmdCMWZRdmpVQUsvMEZ5NVlmVU5ub0FV?=
 =?utf-8?B?Qk9qNDh3MDJzc0VKOUc1YzZWV3l4L0grUDZTWkJMcktlNVZTOS9JY1VZc25p?=
 =?utf-8?B?M3hnWUxXbWwxMzBEWG1HQ2ViY0JrcHpMTml3V2Y4TUhFaHJ6NGdndEFBM2FY?=
 =?utf-8?B?b3gyQjJlVGhsbXl0UkozWTBSMWtNUThTbWJlZ2R6UDNURThyb3h2UmNVb0pF?=
 =?utf-8?B?b0g1U1NTTnVzWDVUdm82MTRRMkh2WmdKSDBuZC90WUlBSnlteGVPeHd3Y3hk?=
 =?utf-8?B?YUNUUnBBODczeEY2aENnUjBoZFpEdHlWSUFFc3NSMTZhZVpneGh3VkpCVlZ2?=
 =?utf-8?B?U3VVcVBlblVrdTBkdU04Tzh6bHl0dXZHTnBMWCtQSUR3aWtueTdqSnJEY04v?=
 =?utf-8?B?SjgwRTdQWTBpa3Y4MDdLNDMvTDViMnZMZlJDd285cnZyajNLWHoycGNUMW9s?=
 =?utf-8?B?WEFtd0g5MWw5d3h1Rys2VDhkMWR0NTNoblVtWEFHSnhPcFVndWMwaTVyYk9a?=
 =?utf-8?B?dkdETm8yVWdBMUlUZDE1NjZueFlVakZ3Z1A5TVlTa1IxazE2ZVliWkk5SWtB?=
 =?utf-8?B?NGlxUTNsejhEaTJ5VWRMeFljWlFjemZNaHBKdi9aMnR5Nm0yVm9ybTJjUVB3?=
 =?utf-8?B?U2tMd0p3S0Mxd25LcFA5R2E2aEc2aW14K0pQVUc1VmM4SW1hQitpam93M2t5?=
 =?utf-8?B?TlVDZ1BML2IyQ1U3M2ZORW8xT00wS3V6UFg0cGtrakZ0amsyYUFDZDZxeGV5?=
 =?utf-8?B?Ylkxemtoa0xvSllsNkdLY1BqbEZlRWg1bUJOQU8wWkUwV3JFRU01TC90emc0?=
 =?utf-8?B?TU5SbnRabHpaNnpKVTI0YjNhdDB4RFFQeTM5MnVlMmkvUUEzY21tNU1LbGZS?=
 =?utf-8?B?NGlHa1BRVndZTS9vVTk0R3BtU2g3eU5kZEJOOHhIQ3F2SWhkK0MvNkRudTNU?=
 =?utf-8?B?UjNWdVFRSzByUFVhbTFXZzJGSGsvOXBsSWEvczNOUDA1L3lpcTJGSlZXancr?=
 =?utf-8?B?UFZMUE5wVVNoMzI0Zjc5SUoyeEMxMG1KcmxSbnVvZUFxN3lXVFFEdWxHTGdS?=
 =?utf-8?B?QzlVa0c2NFlkOGM1MmFFK1RyaHhzdjJnWXFQVjIwSzhmQkFGRko1K2JDajNS?=
 =?utf-8?B?ZFZpMjZpZDg1M3BhQ0tOcHg0cmhaVnJuaGZIR0IwQjNIUFFQcUcydHV4ODJa?=
 =?utf-8?B?TUI5Y1FzeEtWWitqK3c1N1FXSnNsOVhsbnJ5bk9uY2ZnVU1adHZxOGV2OXBS?=
 =?utf-8?B?Sk8rSm9OWmVqMmh2ckdEdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEZRejlXL2RVM1lkL0ViWHVqTGljNWw4QmErRFRsZk13TDBpazJ6WnZ1R3Fr?=
 =?utf-8?B?M3g1YTQwcFlDc245RCtIYTRUSzExKzBZY2V3TEwxZnNzZjZsdWJETDNvNnFG?=
 =?utf-8?B?MVdBUFh1aFRnNEFyTGlSaDhtcDV0cmMxeURxQ2RKSGxudEpyZjhvc2YzaFVR?=
 =?utf-8?B?ZnBPUHExc3lUejl5cjRTWDI3YTk1THh3Y1NzNVM3VXphZG5RU1A2V2xrWGJ1?=
 =?utf-8?B?WDNuOFhnRDZNTGxPRnhXcGNKYVIybUZtcDdxWi96VExvWmFSV3Raeko5RUlj?=
 =?utf-8?B?dS9ONjBqZ2NLNVh4cmZxNTN1N3RqVExOUGdYT1FHcDlIUFEvMld4V00rVjVP?=
 =?utf-8?B?T2c3Ykc0bEVneG9VaGR2L2M3U3Q4Q3FheEUxeGxMUjQrWjJ3MVFqTVNLY2Vw?=
 =?utf-8?B?QmdiNHVCanU3c1VlUEs2RjVMMVRvNm9xZW16bUxWeC9vQWFWT2R5NklQZ2JS?=
 =?utf-8?B?cXgrMWdBR3p6bzBsQmdpUEtKRTZpL0Q0Zm5JdDlyN01OczlRWjlNS1ZXeDND?=
 =?utf-8?B?VEd2b3RaWDJ2MmFVSzBZTnBsVCtHVlE3eG51MDVoaUMxN2cwSmoxMzFXRzFM?=
 =?utf-8?B?aDJNYk84SmZKdzM0MUpONEM3ZHI3dDV4eUdPd1MxaldBRHVBT0lhWjlyajlJ?=
 =?utf-8?B?alJweFExd3Q5Y0p5SHFKUS9lSlR4TVY4ci85ekNLclVidWlPeFJGYkhBaUd0?=
 =?utf-8?B?ZUlqT2ZkblJQMmUzYk1yRnAyM1NJTHlZUHRCRTdlbC9PbHMzazJiUUNMK3dM?=
 =?utf-8?B?ajYvaGpPN2diblVGOTNpVUphMUR3ckhncFhYdjJZV2RpbnBHeHVjQ2p0SjhJ?=
 =?utf-8?B?em44c2U1c3VBb0tibUViSHBPSDdMbW1yK2tKVXF6L20zQ1c2cFBObjY1Mk5C?=
 =?utf-8?B?R1hxTDNDM0N6NVJkcXY3NG4vSnZoT0U1N2hlVVpOdjFsdVVvRmhlQmlZMGtY?=
 =?utf-8?B?WmVIWWxtNDdkZHN1dndKUHhYVFZTM2NpdEd2NWNZRHRCZHh4VTI0VTlYWHVS?=
 =?utf-8?B?MFl2ejd6NU5yWjlmNmdyN09DbHZPRTBaemprNnJaMEtmQzBLVUpVMC8rVGhM?=
 =?utf-8?B?bnFhb3JUcTBkMWJHcW52dVFxOE9DTGI2aXNXbDhJNk5OL2ZTOHV1NVlwaEZU?=
 =?utf-8?B?WUx6TlpidXVIUm44Wk0zcXl1S1pQMUcvR1RyTEtNRDBld0tsQ29OcnJhWndI?=
 =?utf-8?B?czBnaldzMG80SGhRUFUyMk5QK2lpQjhydmZJS1pnWC95VFI1UkJNejJKYVdB?=
 =?utf-8?B?MWhOaE9wdmtMQjg5TnZzbUFmYjVVV0EyMFVMWVJGWCtpUGVVcjBIK092WmRm?=
 =?utf-8?B?K1oyMnYvVkRtR2s4SHo4aGQxU1o5dXFWaXZvWXJaZ3pVWHc4Y2Raano2MnRa?=
 =?utf-8?B?UXNoZG5NQUZSM1lURFVRVHdacjJ6ZmlYUTFGM0tPOVBUbjBCdFlFb0dJaXd5?=
 =?utf-8?B?Y0o3d0tMVHFIQlZaQWVIZFFnRXdreVpVc2taVjRpc0hUNUV0emZQTnNweWZZ?=
 =?utf-8?B?RjIxaHEwU1Y3dWQ3TjZtRkFVTHVKMVZLVkFxQ3ZIREFxYUg1RXpFRkJrcjRC?=
 =?utf-8?B?Y1IzVWFwRkNhTmR0Zm9VVVdPNWVhVHN6cUg3SzVMOURqOEgyYTBNdjMreEdT?=
 =?utf-8?B?ZTVFMXh2NmNZUyt5S1l1alBwY2RIU0djUE9Db1pDcGExZlNSOUp2aUExck11?=
 =?utf-8?B?Tkx4enRwZUdidEdkRzArUmh1ZnB4aVAzMHVyemY5T0RJQnQ5K09nVDFyOFdQ?=
 =?utf-8?B?UXVhaTdZV3R0MHpqQ3ArSDVjcXhQMGtvaDVaRUdTU3pnbDBBL0dBem5HdWwy?=
 =?utf-8?B?RmxZYU1pQ2lha002YjgzVE90QnJCa3JURmIramlyOXFTaHpjVzlpVFByRlhO?=
 =?utf-8?B?d05WT3ZSajJYemk0eS9RZFpXcE1seXQ4T3J4cDg5NmFHZDlETE1jRGo4MTB6?=
 =?utf-8?B?SkR0RU1NdFAwRUVPdGI3SHVkVU1Kc0phalZuY1ZVQjlMcFV2ZmNYNHpiSEZp?=
 =?utf-8?B?Y2lPanhkdXRSL1o0UW9YWnlSOHBkLy8yR096dGhDUXlCMU8rL2p1MEFPNFA1?=
 =?utf-8?B?VEc0ZzU5ZXZnYjYzY0RKbU01aUo4d1BZeGJlTVhiNkJLN082dUZHc2JRSjla?=
 =?utf-8?B?YlBGMG5OQjNRUUVURE12UkNZTGFxbDd0NnJqZ1pGRjBKeTRLZVFLU3BsRlJl?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZmxfUgOEGaRVbgLEoVPsTp5Sga8XCyaQDEr55BaSXqXwdhDlVbtdq+pGjCvJJAkwOcWAKgOtZErTwCljRNBth8aQjVCDpEa4ZJv5kDfyOC8W5xQxeEZn+sn0nCsCakz0xk6oJbtEvJwYAQcDnGSd9J8wzeMHdeDKynkqJH/eYi/BX/EuhmDxO31C1VoGZ7eHJVQbDPQ430XppPS9fVyXtymFcZR8cELVQyCUiDtQ9BPcIopciCZtOFLmAkt0TuI5YDWgFv+UFR5nTKLFwfUbkGcSKXRqv/bli7n/AtjIYEJz1QUHkpTyOPVsz+IlT/mkGYk9BldRrIyg6n+SJ9ULugBgzUHVDIo23Lb/rR/HAw+NNlRSlqT1CftefkLnAUbXPZN6AybDRhyabGW1d1BSGkNRWCcAO1FaUVNszACU801ou5ZPbMY2PJuPCAabwR2b8igIh85PciySZu3H4AqN5l6Y48cN2dP+x/hZGMbQcpfl4lWOk5V0HUEEIvg8WGdXZWgvpho+hagibQMO92uVlG7V3ERcgr0THmURRoMOJbCD9sKu2JPcWNc0b/L9owvwZmKYJ+IuLrENyfr6nLYNS5B+se02PkXsHOjC6JgiSf4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975d4bc7-c082-4163-86d9-08dd45f75d6f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 15:11:28.4997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTopCajk7DfF02X9xK3OM5LMW7B6t31uSSqwwNT6eAmx718OPKRbD2+ZpfsspO1XbuFib3+mf6tSKGP8ypiR+BqYt9tZH6UHh9RfJcPQk4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4185
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_06,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502050117
X-Proofpoint-ORIG-GUID: NxWrF2pDsGzbX_-qqhg8Wr3kOgpAadL7
X-Proofpoint-GUID: NxWrF2pDsGzbX_-qqhg8Wr3kOgpAadL7

On Wed, Feb 05, 2025 at 04:00:06PM +0100, Jann Horn wrote:
> On Wed, Feb 5, 2025 at 12:41 PM syzbot
> <syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com> wrote:
> > syzbot found the following issue on:
> >
> > HEAD commit:    d009de7d5428 Merge tag 'livepatching-for-6.14-rc2' of git:..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=12b678a4580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=9e757e3762bd630b
> > dashboard link: https://syzkaller.appspot.com/bug?extid=c2e5712cbb14c95d4847
> > compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> >
> > Unfortunately, I don't have any reproducer for this issue yet.
> >
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/9235000a1b88/disk-d009de7d.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/098ef82f8ab3/vmlinux-d009de7d.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/4f51f5eb5782/bzImage-d009de7d.xz
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+c2e5712cbb14c95d4847@syzkaller.appspotmail.com
> >
> > ==================================================================
> > BUG: KCSAN: data-race in mprotect_fixup / try_to_migrate_one
> >
> > write to 0xffff888114b41700 of 8 bytes by task 6432 on cpu 1:
> >  vm_flags_init include/linux/mm.h:875 [inline]
> >  vm_flags_reset include/linux/mm.h:887 [inline]
> >  mprotect_fixup+0x419/0x5e0 mm/mprotect.c:679
> >  do_mprotect_pkey+0x6cc/0x9a0 mm/mprotect.c:840
>
> This is one side changing the VMA flags under the mmap lock in write mode...
>
> >  __do_sys_mprotect mm/mprotect.c:861 [inline]
> >  __se_sys_mprotect mm/mprotect.c:858 [inline]
> >  __x64_sys_mprotect+0x48/0x60 mm/mprotect.c:858
> >  x64_sys_call+0x2770/0x2dc0 arch/x86/include/generated/asm/syscalls_64.h:11
> >  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> >  do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > read to 0xffff888114b41700 of 8 bytes by task 6418 on cpu 0:
> >  try_to_migrate_one+0xb5a/0x12e0 mm/rmap.c:2321
> >  rmap_walk_anon+0x28f/0x440 mm/rmap.c:2646
>
> ... while the other side comes through the rmap, which does not
> involve the mmap lock. Yes, that does not have any mutual locking by
> design, I think.
>
> The comments in the VMA flags code incorrectly assume that no
> concurrency is possible here; and I think the comment in
> mprotect_fixup() about protection by the mmap_lock has also been kinda
> wrong since the beginning of git history.
>
> The VM_LOCKED check in the migration code was added by Hugh in commit
> b74355078b655, but that's just one example syzbot stumbled over; we
> have similar racy vm_flags reads through the rmap on other paths like:
>
> unmap_mapping_range_tree -> unmap_mapping_range_vma ->
> zap_page_range_single -> unmap_single_vma -> unmap_page_range -> ...
> -> zap_pte_range -> zap_present_ptes -> vm_normal_page
>
> I think the right fix might just be to make sure that we use
> WRITE_ONCE() for these vm_flags updates, and READ_ONCE() around
> ->vm_flags reads that can happen in rmap walk paths, though we should
> think about the consequences of concurrently changing flags in every
> place that gets a READ_ONCE()...

Yup cool similar to my thread on this.

I hate that we have these landmines waiting for us. Be good to find a way
to explicitly annotate this, or at least comment somehow.

But agreed, probably adding a READ_ONCE()/WRITE_ONCE() is appropriate at
least for the proximate thing.

It's a wonder these things don't trigger more, except you need probably
very precise timing to do it...

I can do a quick cheeky patch.

>
>
> >  try_to_migrate+0x11f/0x150
> >  migrate_folio_unmap mm/migrate.c:1320 [inline]
> >  migrate_pages_batch+0x786/0x1930 mm/migrate.c:1866
> >  migrate_pages_sync mm/migrate.c:1989 [inline]
> >  migrate_pages+0xf02/0x1840 mm/migrate.c:2098
> >  do_mbind mm/mempolicy.c:1394 [inline]
> >  kernel_mbind mm/mempolicy.c:1537 [inline]
> >  __do_sys_mbind mm/mempolicy.c:1611 [inline]
> >  __se_sys_mbind+0xfd1/0x11c0 mm/mempolicy.c:1607
> >  __x64_sys_mbind+0x78/0x90 mm/mempolicy.c:1607
> >  x64_sys_call+0x2662/0x2dc0 arch/x86/include/generated/asm/syscalls_64.h:238
> >  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
> >  do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > value changed: 0x0000000000102077 -> 0x0000000000102071
> >
> > Reported by Kernel Concurrency Sanitizer on:
> > CPU: 0 UID: 0 PID: 6418 Comm: syz.0.1339 Not tainted 6.14.0-rc1-syzkaller-00026-gd009de7d5428 #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
> > ==================================================================
> >
> >
> > ---
> > This report is generated by a bot. It may contain errors.
> > See https://goo.gl/tpsmEJ for more information about syzbot.
> > syzbot engineers can be reached at syzkaller@googlegroups.com.
> >
> > syzbot will keep track of this issue. See:
> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> >
> > If the report is already addressed, let syzbot know by replying with:
> > #syz fix: exact-commit-title
> >
> > If you want to overwrite report's subsystems, reply with:
> > #syz set subsystems: new-subsystem
> > (See the list of subsystem names on the web dashboard)
> >
> > If the report is a duplicate of another one, reply with:
> > #syz dup: exact-subject-of-another-report
> >
> > If you want to undo deduplication, reply with:
> > #syz undup
