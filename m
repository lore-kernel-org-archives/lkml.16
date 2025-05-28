Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C351262A6
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748425488; cv=fail; b=B/+yqcIYs5Vv8nzB+FDGJtnMaJo+TRt6Rk2ebxVeZRgflA3p/oK+JTU5JrqsVKc6haNohYfUh8gAODySLB9uFBeMx4SgpKL1+znbTU58k1Tx54y3OwFiwRKvBgogeCamyvqhPUctYGWh8Oxd9Qvmv+mB440T5w6WHz5AdiowXFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748425488; c=relaxed/simple;
	bh=rPZZ87WS0iM5MQpaOsD4dNkUD+ygDG7AmWZi+lxTNCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fAhTHcrJ9QA8KRqpjVWZFNj2TwyHW+C/rVm9YZLnAmmXyMnh8a5VGXq/5N/gZUjmk1YA1QmRR2dIS3yJINvd1DnKdxaFC3zbFzDwfVVkprgKaZ4QHi0hjb5dZKZFJ3M5PdEaoELqGXkn+yX40MmZRPZj6fUcAuLBiGlt7KJaBe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CN3S7/WF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PkmIfHQF; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CN3S7/WF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PkmIfHQF"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S1h85j011936;
	Wed, 28 May 2025 09:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=R0ZzjDhPaopAVWtpyFMjA7rdixihnqNSTOMx32pN+ow=; b=
	CN3S7/WFlmRamrBw0OYT65YkdnK5zRY27uYhYhhCfWS+N2lv/QHuFz2w9Jh+yHzU
	C8HwFfmUjx4Hu3zSZajat7u6Jsgpqu9UfWtet4MqdFAEMKu2Gff+O8lieFnoeWbj
	6n1YWxZdz37efwZW/LrBVvM0ZYGISDASV2wTmObxncQWx4d1zzaVzuZZH9AJQnE/
	DZ/oD7xkjJKD8vgRNoCycKI45f5dMydTsEe2zuQKEQp1L9fFMSV30+EU0WBlcn7l
	jlqv9NImuAuxl4GUwKVvkyZ5jndgque/USTHNJc0Wd273a5ueri04rF+mi+6hbFQ
	KTxYAVYyIfTPJdvaFd6vIQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v3pd58cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 09:44:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54S7j54a025374;
	Wed, 28 May 2025 09:44:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jaegn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 09:44:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWnMxrjiN1gONA04wsSJUk8UPcrzQraWsGImZNnt6NMD4A+OvJ+c+zJ0vM1h8aYk47HHz4KXmB0TuM9/JBe2V/IW7l3Yq+0HO2H+jCvEL1jqxbxSEjHiT4cX9BdBkUpk2iwt6YYCxJoMoGh0AqhkLXtzhSv5t5H9ve3BQla/rcUfhMfJxrxpYlw4EbJZ2iJaVwr7xu60Mn1jnqJy52zcXn8F0eMUAgi9Z0cDKf5ANpUs0u14QDaumoa7WgBNAOEtgJ3am7LtMupmdbLGvT/4BBTJ6TA+LL3eUmV3xXdPbLrlm0ePGJCHg5oKttLwIZEFcXE3iDPTCiFpNCngaI0U0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0ZzjDhPaopAVWtpyFMjA7rdixihnqNSTOMx32pN+ow=;
 b=L+QTMH8yHMtFTQgcHOGeK07l4eBoK2KtzW4NaZ9fYKRFMuaWrbUwbIgNqEj+SGOvA/9bYoyudpuyBkBNr3Y38r7pjmoPfloofevtXu1kyOvCtjFCpogNYcYgyWIwiu+PI58nL8qV2k5rTn8PoEwNLMHvyGMokO/mfJ8UUK/iGQ6f0lYwY0EgdH+qRDYPLoBRXFqvkkUF+r6Ie30uyRSBZ/7EWJ+X0FPLbEhfAKqjNgQ8pwZnq0StJQOqHyji6SQDYX3K3jWgxkQQwil9HVEve9VbNVWIJ8qZGHGQAHkBqK7LeRRgwJg6Gl5cW6XuSnuOsN8a8AT9Pg0LcTs9YHIB7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0ZzjDhPaopAVWtpyFMjA7rdixihnqNSTOMx32pN+ow=;
 b=PkmIfHQFOFIUirkYL3Xtgonor25e9kbaLf/gvOGhAFp436RFjCmMBRhl5/CBhNHytw4wOKgjs46dwU4HfM18jghafQdlzy8ln25yv3Vwmbcg86I3rsaNv4ZDucjFeGq6MgeAdfwy/l3kno9AyMDsS9GJ6sBQ0g7Jpu4j1hTlfW4=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB7731.namprd10.prod.outlook.com (2603:10b6:510:30c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 28 May
 2025 09:43:57 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 09:43:57 +0000
Date: Wed, 28 May 2025 10:43:55 +0100
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
Message-ID: <bbf35e8a-d90a-4e06-a941-3690be6577ba@lucifer.local>
References: <20250527044145.13153-1-21cnbao@gmail.com>
 <93385672-927f-4de5-a158-fc3fc0424be0@lucifer.local>
 <CAGsJ_4yHQLmUF7ZRMjaV7c1JQ9-Sr3ccWMTOBwAyKUSaB7CPhA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4yHQLmUF7ZRMjaV7c1JQ9-Sr3ccWMTOBwAyKUSaB7CPhA@mail.gmail.com>
X-ClientProxiedBy: LO6P123CA0022.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: a074247b-6b69-41aa-2320-08dd9dcc2b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFZSMEFXYjZBVEhWWld4bDd5SnZZcmJmREpXdWxCclpjQjdzVisyWXY4Z2E3?=
 =?utf-8?B?cDlseXp6dVd1bzZha0FzK1c3ZzV5UTM2V3VxUG9rS21kaStuTlNrWVhlOTl5?=
 =?utf-8?B?ekxaUFRDdHYvN3k5SmpsMmpMaGtBV2lpU1JBeW5JZzl4Q3krV0Flc1VrVzE5?=
 =?utf-8?B?VXJpU0xYdGdHbWQvVmVEOWFQRE9JVzk5OGpKRHJZVFdjaDR0enp6VzJFU3Vp?=
 =?utf-8?B?MDRJMGJQeEgyM1FIS0tGRC85TXpjNWdUMlNqSnRSVG4rREJwd0tVamFMS1Y0?=
 =?utf-8?B?cnZYM1M3ZU5ObVZkaFhZaWhId0JEOUx1ODh3TElDMndYcVNOQ0dZSHRvSzRY?=
 =?utf-8?B?WFdjYmRlalhVRzFMd1dnaXE1Y3Q3YTBvWENYdFp5V3hQMlVCbUJ2RmMzT1Yv?=
 =?utf-8?B?OWtLN2c0dmNYcHgvS2pPMDBVOC9ILzR4OWJiWUNXWUxJbW16TzdKSERMaU1u?=
 =?utf-8?B?ODNvVnZjRG43NzJTQjRGQTUzdFlUM24vai9hbXVvY2pKTUxwTmtiN0JPc1Ba?=
 =?utf-8?B?S1VSSU1Ud09JQmJCNHEwVGdTd2V0SWVnekdHaGtTM3poc3lydnQycitaZVhV?=
 =?utf-8?B?dzZqbVdrRUR0Mlk4NXdScS9KeGtSSnI5eCtQYVZQNVZEbEhHazdianJ5T0Q4?=
 =?utf-8?B?U0k2TllFT2lNV3Qxd2RCZEFNNm9Vb3AyNG9MSVkrWDdqWDB1SUh3Q3V4TmVa?=
 =?utf-8?B?VTMrTVdXZlFsVklkU1Rxak43NUZTdUY5RENydTZaV3U5M3hDQU5LUVVVQk81?=
 =?utf-8?B?dHF1SXJWZ3FNMkdLUWxXVnFlWGdpV1gwclVGUTRiQU1hOVFuUFZuRFBSWFZm?=
 =?utf-8?B?SE9Jbk5PM05YWUd5ZmQ2NzlQTklLTktLSGo3L0RSc3NSM0hCaU80MVkxY09Z?=
 =?utf-8?B?RFEwV0hqU09VTDN3U1VsYzNtS3c2aG5rT1cxeFB4TFQ0T21NNTMrYkhKcXll?=
 =?utf-8?B?ZVowbzYzNUtMZlM4aXFURjlBNkFMRnFHY1lFUDhKY094TElWckdET3VmSjdy?=
 =?utf-8?B?WGhZZlhUUWpqUkg1QUo3bVFQRDRrTUwwYTBhSENJVU1VUDFpVWV5V2g4OHBT?=
 =?utf-8?B?Z1VaTnorRk93WUdKREwvRGVnZ2IxMUZ4NW50RXQ1SW9rb1QwNXhUcjM0NG9W?=
 =?utf-8?B?MU9pQ0dIWURHem9pT21VYjhLREtEM2o2Zy91ZEJhWU5TOUlhelMyU3FMS08x?=
 =?utf-8?B?OVhzeXBha3JudG9mVkR5VFpaWlRwWFJhOS9nblpWZ0RRc2VSdjVyY2Iza013?=
 =?utf-8?B?TEpwUjAyU2h5TGtYcHplSm93NVJQNTdaWWJrTmNSS1VyaWEzcmpEQ09saXhC?=
 =?utf-8?B?b3pIeGhZVWxnMnVia1A1N3dqc2YyeEpyWnpwWTcxYTBVVE43Z2EzbmFJd21C?=
 =?utf-8?B?dEVUK0ZtTnQvWkpaUVZvaElOTGZtZTlldnY5SHhEM0ZZQzVPWWsrYi96N29S?=
 =?utf-8?B?MVh5OWxmZWdBR1hwMnE5WGtMZWtnOURmUFpsdDhDakFYT1ovWHhFZ0RCcmZD?=
 =?utf-8?B?aStZbFZFanRvUCtIVHkyeVRvOEZKN2dDR2QxUTUwU3Avc2p0R2ZtZTlpMWJF?=
 =?utf-8?B?cld4NVExTE5sK2hZR1BXUTZwZjkvQ2s5ek90U0V6SG1hNkg0ZkpONTRvcDR1?=
 =?utf-8?B?dnRDTHdXT1dtaHRvN0NFSjZXeUJ3OFdxWFI3bEVsd3lVeTlKSy9XNEZYdXZW?=
 =?utf-8?B?NW5ENVFlVjRDTEhRazcrdmo1VnpZRTdvVDVVU0p0S2g4NFZJT05YR0lmOGlL?=
 =?utf-8?B?M0V2cUFySDdHUTBQMUNlM3JIbjFISG1vUmlVeXJHazFEN2tuQStmR3UrOVdu?=
 =?utf-8?B?TFNYTTlzVjQ3bk81Y1c5WndhNGdBeGxxa2hMOWVwb1E3eTBDaEw3V2o1SEVu?=
 =?utf-8?B?YWRrd2x6OElRT3lKaFRkR01mTjBJYmpJSVllR2R6M2FkdFBCWEVvMW5GUU42?=
 =?utf-8?Q?TZpiUP2KanQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2kxZ09GY3hIU01TMEtjYmRxOTdNdFFFc1hxUFR3bHJWclBkYzMyTzdPRXFV?=
 =?utf-8?B?WEZVQ0p1QWo3MXZTT3RTaVo3ajlrK1h3WjVxNDFGU1N6N1ZiS2ZhcnNpV2U4?=
 =?utf-8?B?L3ljS0xmbWpscXlVL1NPVmhGbWUxY0Vja29rTG9kRWR6S3lqSmxyTE9sYnlI?=
 =?utf-8?B?M2F5UmZKdjRLNG9kV0llRVpiNU9sdFpGclh2WmdFeWl3MGhxbjV6OTlzMVBL?=
 =?utf-8?B?S2J6Tm5WVlEwb2dTWStHL3BWNkRBS0J4Q0d5RU5hL0VkTmJ3NjdzL3BGMHA2?=
 =?utf-8?B?UFFDU2ZuNFI5bVl3cHZBU0FnT25yWVhWNkhrRlF5K0h4Rmh6bVZ1N3dVTWRy?=
 =?utf-8?B?U3oyNDBnamUwdmY4dHp1THAwbFVSQm11NS85bjI0NVVyOGpKUEJiZjJDa0ph?=
 =?utf-8?B?L25qeC9qdEQycVpmdmtibHhSaXZBK1dYWFI3V092c1ZNY3FmR1NidFdQQklM?=
 =?utf-8?B?TFEzSDg0ODBTU1N5Wm9uSEhXaHhLR0ZYZEVTOXNsc1hJYWxvaEcwalREWm5H?=
 =?utf-8?B?di84OHFmZTlqQkhSd1UxY3JjODI0OGs4eWFGZHJUUndnSVJLbTA4SFA1eWFF?=
 =?utf-8?B?UWVJZnl0WVVpaW9VZXZySGZIWFVNVmY3UElLT0ptaUVVNGNCcmdJbFdIcS9H?=
 =?utf-8?B?YjNyOFJCeGEwVGZPNHNXQ3h2S1Vmb0xtbXdMWE5xSFNiVE41L0NHNnRxL2tD?=
 =?utf-8?B?RjZxeFNFOWZKZkp1dlIyZXhmNjNyTHQ5VDl4bEdIMVVwc0xTN1RNMnVkNVcv?=
 =?utf-8?B?M0xUdkF3SWFNYVFqTCtoeWxXQ0tPN0RnSDJPV0NKaUhZOTl5UHUvWHp4L3Bo?=
 =?utf-8?B?SDFGcS9KTEdsN1VWU1BkTkZKNTArampTM2ZsbDJYeklybkZXZEsxKzFHU2VX?=
 =?utf-8?B?NjZKTEdaQjBLQXo4c3NyTFVqbysxcUk2T0diQUE2dUZ3NWxYWjBlVHBrQUpv?=
 =?utf-8?B?MW5qNW1wTXJvYzhYYWZtTlRvR3Y3WHMyODMwRnFGeEcrR0JvTHlQOVpSUWxG?=
 =?utf-8?B?VTlGaGNmOHM1QVB1eHpVKzJESDA1Vy9lQkFSckJvVVdwZWVLemNoMWM2dURy?=
 =?utf-8?B?clF3YXdYT2ZUdm1CVzVBZUJWN1ZLU0paYzRYamlnbUNoY2J2elhzL0c2elNr?=
 =?utf-8?B?b3VwNi9rbnhZNUhmQjUxdkxFUWNZSXlyZWNobm5xYjV4YXRGUXlTbnNnYTVt?=
 =?utf-8?B?TmZpejdWM2R6MVo1bTd2TFJoalV1NWU4cWxBUjl4VDl5aFc1bjI2cTJTeGFK?=
 =?utf-8?B?RENsS0grbENwYnZISDQ4KzJtcm5rQ2NzY1AzZVppN0VuZWoxci9QQkVueW5H?=
 =?utf-8?B?T2tZUzhSVHFkWk9wdXVYRW9hdkdIMjVUK0xlemlrVGVxb1pFV1NJNnJpNENT?=
 =?utf-8?B?cXMxQ2FBdG5Lc0N5ZEdjbTVvUVZZTm10ZnVvOVZIc1kvTmhlNVFoZy9RaEZi?=
 =?utf-8?B?NU1TZklBVzh5NUE1MFdjUFNXSkswS01MNWFJZTNkNTRkR1RFR21WZFNLelV6?=
 =?utf-8?B?V3JoaGxtZ2ViSnZ3QVNiK3JOemNUMi9saStBR04zb3NJcmZWR1NPeFhUM24w?=
 =?utf-8?B?RUF2eGVlc2RHNnRPNWpwMVM3Z0RIdWs3SjNkbmxSNHpJVC9CaWRDTlhYcHpM?=
 =?utf-8?B?MUtGeHU5WFBvNVg2d2pUZTRBaEw5bTZMRFA3TGlEZnMrekhOdjZXWVVyNXFQ?=
 =?utf-8?B?MlNMWC85S0JBc3doVTNrODJ6ZTlqaTZ0VC9adDZpa0U4VGRNOE52Ykswc0ov?=
 =?utf-8?B?V2xERkx1Z3FCQXM3WjE5VUs3Y0RwbllNZUJVWmEyQ01SWDdEeUNSNmpXdE92?=
 =?utf-8?B?aWFRWW8vc2hrS0l4WDJzQmQzMVJvclJSNWxUWGRhK2hNUmNpbjBXb0ZDS0lz?=
 =?utf-8?B?MDJuYmV2UFg2QnlKMStENDNwbUdBS2xjNHY1SXljVWtNcHV6YUlSWkorZ3pK?=
 =?utf-8?B?a2JKclk3b3BIZ3B1ZHN1ZHZJVDErK2xENWtDWjBubkdmVWFwOXJNcHZrWDRN?=
 =?utf-8?B?d3FMRXpkRmpJWVJhQ015RVpZUjAyZ0lGaWRDK2t4dUIzMllPRlRoZU1QQ1po?=
 =?utf-8?B?NDlJUzhtZWtia2c4MHRnQVFiSXludldOUytEM05QN0thVmdlKzFEcHZ2b0h4?=
 =?utf-8?B?c2RyVThIekFCV3l6VnVmWkZPMklMU3A1NCsyRjQ4WHorZEZ1ZllQQWZGcDJu?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MPnaWztAxnN2PNR42hLZy5P+myXyq7I0n6WGEBTGdvBhlYrzHzJd9521/WLL3yyD2QqLKiBbnDMNNV0eybNdZzFKz8OurAYBjDz5GxMRMX1rDjmhzgaScNp4N5+zequZen8+uR1bFO29xEzmvcR77bw+wVLUsH6CbKLmomN0Ca53cykKaVfGWbH6IQhqhd1ec/ivudMqXFXQlD0OjukuQT/2oP7QPYOLH5wPEt9HppIJMwC40h2qatdYt0Aqf2WtaHxJ5hOoakX7m1oqkR0IWVYU3KvFZgcS8ZSjEUH5zUMhjHh159d/Gi9b1dXoKmmz+qu2ek1ZgXvJlJkBPfEQK4P8vW9RzD+0LiB0bp5pk+Pna4VuwvoM6rnc/vROHvaF1QnNUCzksaHY5i8DBGUHp6t0E2JRsqlZxPX3l1fdhFH6M1ayK9a8TWzpnWhMFuIrLb2vDaZIcYhXg6HXB58Ce+f+yX7DJLQrRHKqlkMalwrAnfMjs0iwPuEyOvWqrwhFD2EYpv9fsM4fHdVe5OnjyGlh+Urnwgf+NfyvJ1DTpbZHZ/ywPnADULgsDmShahJFHvsQuqutHbtlze0mV0N6cOwc13ZWfu1fDWmxOMHLl+g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a074247b-6b69-41aa-2320-08dd9dcc2b03
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:43:57.7831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RbK4QMyD3djF2JlP2Obosvf0iVxnMEKlLIgmpHCmaE/sQl0hXCRMiO+phZ0+7DQ+/7aYL892zQ65eAUhWSe5AbdZIedrbCJ5qCYTDZ1yXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7731
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505280084
X-Proofpoint-ORIG-GUID: _0laH_CVZXuQvsliJcaDWafNLjw9U71j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA4NCBTYWx0ZWRfX6KRC+3veXbIj p3b7IO47QsCL01Wkc9xP4S+jbdcxiQ6esaClcbTMrKaASUWKSuSaOkjA8ng/NT0lVOwa4QMaJAx jqiPi/HfcNBhH7zFhjb3pzklcDP6oLLYJB0ey3hzNvkOfJTEhUtpTtEnfwA9qt/5wNemO4NO9Ex
 GCDSj4UTftJJg1Lil4vxIf3SIY4ljXH3JiAMFnbhAp7JLdzst7YD/MPRrj/P6ZcaCMRYzU66P8x WHBdEKdlKZ7u2g3TV/0nzS1oOvIe0dkzCMpISBEN8J5sS/1J+eS5poIgALDcXqB2cQTiC7nPDfd zKl21zYcKUy8mMj0GCBR1D23mf8pA0eQx3OIwzV8Byq22atFfymOhCn1RhzQbg3b04j1fPX+qL8
 K7wJU+DGZHlXZpO1edd01vRo3TddLsSn7kaUPzE80ve/LAU1uoa57ipMqzFW0/dFaIMC7Sfo
X-Authority-Analysis: v=2.4 cv=UZNRSLSN c=1 sm=1 tr=0 ts=6836daff b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=TrRrXOY9sZjfoi0tQVUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13206
X-Proofpoint-GUID: _0laH_CVZXuQvsliJcaDWafNLjw9U71j

On Wed, May 28, 2025 at 05:36:40PM +0800, Barry Song wrote:
> On Tue, May 27, 2025 at 5:20 PM Lorenzo Stoakes
> <lorenzo.stoakes@oracle.com> wrote:
[s[nip]
> >
> > Thanks, this sounds really promising!
> >
> > I take it then you have as a result, heavily tested this change?
>
> This was extensively tested on an older Android kernel with real devices.
> As you know, running the latest mm-unstable on phones is challenging due
> to hardware driver constraints. However, I believe the reported percentage
> is accurate, since it seems pointless for userspace heaps to free memory
> across two or more VMAs. How could it possibly manage a slab-like system
> spanning multiple VMAs?

Right, yeah. mremap()'ing anon memory around might get you unexpected splits,
but generally speaking you'd expect them to be single VMAs.

[snip]

> > >  mm/madvise.c | 34 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 34 insertions(+)
> > >
> > > diff --git a/mm/madvise.c b/mm/madvise.c
> > > index 8433ac9b27e0..da016a1d0434 100644
> > > --- a/mm/madvise.c
> > > +++ b/mm/madvise.c
> > > @@ -1817,6 +1817,39 @@ int do_madvise(struct mm_struct *mm, unsigned long start, size_t len_in, int beh
> > >
> > >       if (madvise_should_skip(start, len_in, behavior, &error))
> > >               return error;
> > > +
> > > +     /*
> > > +      * MADV_DONTNEED is commonly used with userspace heaps and most often
> > > +      * affects a single VMA. In these cases, we can use per-VMA locks to
> > > +      * reduce contention on the mmap_lock.
> > > +      */
> > > +     if (behavior == MADV_DONTNEED || behavior == MADV_DONTNEED_LOCKED) {
> >
> > So firstly doing this here means process_madvise() doesn't get this benefit, and
> > we're inconsistent between the two which we really want to avoid.
> >
> > But secondly - we definitely need to find a better way to do this :) this
> > basically follows the 'ignore the existing approach and throw in an if
> > (special case) { ... }' pattern that I feel we really need to do all we can
> > to avoid in the kernel.
> >
> > This lies the way of uffd, hugetlb, and thus horrors beyond imagining.
> >
> > I can see why you did this as this is kind of special-cased a bit, and we
> > already do this kind of thing all over the place but let's try to avoid
> > this here.
> >
> > So I suggest:
> >
> > - Remove any code for this from do_madvise() and thus make it available to
> >   process_madvise() also.
> >
> > - Try to avoid the special casing here as much as humanly possible :)
> >
> > - Update madvise_lock()/unlock() to get passed a pointer to struct
> >   madvise_behavior to which we can add a boolean or even better I think -
> >   an enum indicating which lock type was taken (this can simplify
> >   madvise_unlock() also).
> >
> > - Update madvise_lock() to do all of the checks below, we already
> >   effectively do a switch (behavior) so it's not so crazy to do this. And
> >   you can also do the fallthrough logic there.
> >
> > - Obviously madvise_unlock() can be updated to do vma_end_read().
>
> I’ve definitely considered refactoring madvise_lock, madvise_do_behavior,
> and madvise_unlock to encapsulate the details of the per-VMA locking and
> mmap_lock handling within those functions:
> madvise_lock(mm, behavior);
> madvise_do_behavior(mm, start, len_in, behavior);
> madvise_unlock(mm, behavior);
>
> However, I’m a bit concerned that this approach might make the code messier
> by introducing extra arguments to handle different code paths. For instance,
> madvise_do_behavior might need an additional parameter to determine whether
> VMA traversal via madvise_walk_vmas is necessary.
>
> That said, I’ll give it a try and see if it actually turns out to be as ugly
> as I fear.

Your reticence is understandable, this code can be pretty hairy, however
thanks to SJ's refactoring efforts you can now use the helper struct he
introduced - madvise_behavior - to store this state, so you don't have to
pass parameters really _much_ more than now.

Unfortunately the current version of the patch isn't mergeable as it
stands, so it really does have to be sensibly generalised, however it ends
up looking.

To be clear - I appreciate all your efforts, and sorry to add some extra
work here, but in the long run it'll be worthwhile I feel, and will lay the
foundations for future use of VMA locks :)

Cheers, Lorenzo

[snip]
