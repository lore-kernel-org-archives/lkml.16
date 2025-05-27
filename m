Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF5914AD2B;
	Tue, 27 May 2025 15:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359451; cv=fail; b=Hu+v9Co9BMbJRotFP/ShyK/Pp2/n6aYPTxZXN3LfUqKFU3PKcxgeevLysPfsIfuk+ptAoIzeSzMQx5gMwNBLNiceL194NAaPubSD4Cmo+q6LDC7Yk5z7rJitN3DuxOoH4Ic47TmTOY4e5s4Xvs3MeFO59qOxKpJpgw3uH9xSki8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359451; c=relaxed/simple;
	bh=+PqahnjWHrtjX4YPhJbZGoIhVvBpYRlGSnbsD9Di4dU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m9WsLi4FPkDaYEhZoph09MQ2jbd140YBs9OG8AJkXfCEsW0oB7ucWKzh2GyUnTev81qwqcle7z6Bmfdo99xAQxm3tKkJINUzRGpuj4zZ+HV+3I8bT93wFNTp9sTbDmCHMXUAmceeYpuniVw+rQYl0M5VB0D1kuxZXx5bN1ulc28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vxSNE6xR; arc=fail smtp.client-ip=40.107.223.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vxSNE6xR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWQDySdFt8zjaXPepMaCqRq8kSEH+0HA3qo7KJMW+TVdsVqHjKDM6G42qfRPVoWrdXMugqALvQd92lSJkyFkWKiYJnVCrdLyws75X3gtIYyjMeRlu8hNzD7FRYX7+KDKKAyficJ1+hDw56b/cMZFcqo2KS6uIxnR9oPELUWfNwmtn5sz3EaOE0KMZ8+X+nqOxUWSPt+Ovq8u6VTYqwxn1aLXqEoDCUg4532FerDNAuqzRWxWbmyHo0qqzaYXejTYdsQacuupNp5tOsIdTJmWmNrEF7taJSnEdlS5p0JLKGzLIMuiALyGgxczjogl2/QDJmi8EwlllMbUGGolapga/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ugYye4JzDi8XzpHJnBs4CSUSTahWWsfd109YEhsgInM=;
 b=A8iI1DD2elfslUVqH/Y9tLzZDA8C7LAXQe/sFbnVgnqoKVBdbBheYUDwR7UCSuDVvtv4L41C0KPaAetVK0WibEaq+qbdGvZVqdYGAsB5BqAUh1N3u7Up5KImN4VZgjxaudgHBmOf64F0zuNcK6ulg7M8aj+plEMTqeOy970QA8p31p2vuE6aXO5loeH7ovzLAdw+odYGGk4dWnCi0PT6BG7ozodpmRIm+vKUVFImEUG/khsCogzph+cerN9CLydXwXWFxiY3sbbGvMjQjXP+9rM7egyxznTcoY9lfzF0zhUQGYt6jELnjwxYcjNFYXkviJ8alfUQPoDrp/sGysyZzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ugYye4JzDi8XzpHJnBs4CSUSTahWWsfd109YEhsgInM=;
 b=vxSNE6xRvagfU/qv1qMZNxQw2WmmdTy0NQNwBGOPuR9PlV/JI/z1xw4TBTwBVahSBe4gBSLw3MwzqeP/6Vp+YALoS+mMFdd9YDaL7S4M/yswt6n3x+vncj48oU0Embj1r9snEcrojAdEzsdEl+hT/KlyIih5ERyCv9lFSe8rgGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA0PPF0A63E7557.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bc6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 27 May
 2025 15:24:07 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Tue, 27 May 2025
 15:24:07 +0000
Message-ID: <c6baeaf0-35a1-4798-946b-029f3af47066@amd.com>
Date: Tue, 27 May 2025 10:24:03 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 24/27] x86/resctrl: Introduce the interface to modify
 assignments in a group
To: Peter Newman <peternewman@google.com>
Cc: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, james.morse@arm.com, dave.martin@arm.com,
 fenghuay@nvidia.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com, Xiaojian.Du@amd.com,
 gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <6a2cdedc0b2bf7e3da82d453b0104b46a2e85529.1747349530.git.babu.moger@amd.com>
 <CALPaoCjvUSKLKOXzF85j8mHT=eZYM-7R0=gJ3PRgOk4yuF5ZhQ@mail.gmail.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <CALPaoCjvUSKLKOXzF85j8mHT=eZYM-7R0=gJ3PRgOk4yuF5ZhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR14CA0026.namprd14.prod.outlook.com
 (2603:10b6:930:2::34) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA0PPF0A63E7557:EE_
X-MS-Office365-Filtering-Correlation-Id: ba9d449f-4f71-4e7b-6bc7-08dd9d328598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?em1tUlR4WFJxR2lZekRYbmZwNmF3emxMMkNMOVZtbHZQUFhwT0xubFQ0dXFy?=
 =?utf-8?B?ODNPZHcwUmNRbG8yYStIS2RxdEdsY0t1NkRCOFhYamhMQkdhTDA1aC9PcFUw?=
 =?utf-8?B?ZjhuV0RQSm9aczRVeTFZaEJwYmJ0OTZ1K2dmQktOdXk0dzFLanY0cnkxN1Bz?=
 =?utf-8?B?RTVTRlM5ZnVTbGVuWTluRDArTzFzNnhhNlc1WnNFZkR0R3ZsbjltTlMzeGg3?=
 =?utf-8?B?bDdGMTlqR2VzNHlJRGxnNWFYUzVVRWl5ZnA1dVJSN0V5dTJ3cFRDbDZ3ZzN5?=
 =?utf-8?B?anhwOVRyWVRCQmpzM2IzU2x4VU5CT3RzcU1jbmFPMTVGNkI2VVhUTHN4bzNm?=
 =?utf-8?B?UG5JRGtDbzJMeGorU0RZV2ZzR3lpb3FXODFTdG10dUY1eVdrSzRMaXptak5n?=
 =?utf-8?B?V3IrV2NLSm9Vb1JrakZ6R1pGWXZ0c3JNVHg5R05KNHZKTUtiUkRKOW5WeFh5?=
 =?utf-8?B?VlliREE3ZUErTENXVjlQdGlaWTA1bXJ3STU5MjYwZjF4Vy8weERjVk1WSjF4?=
 =?utf-8?B?T0NsT3pQRkZzNHBZWnpwS2NibTkvekJlQWZzSDFGa3U2eE5xck1WdmFYZEFi?=
 =?utf-8?B?TUZqTGFkNlUxVjZwd1hSeEtycDhWQTFMdDFkUXVXajg4czV5SDU5Zk1wQTRq?=
 =?utf-8?B?enAyeDdQQm1aWkVhbDQ4bGdSSGx5R2dPQitDSm1vWHZQUFBhOFBuU0VkajFL?=
 =?utf-8?B?QVFhMVVoNjI4M1N4SDY4Tit0WXh4NHJ0TDR5YzhnaUhCODBMbXE3REcxYU0v?=
 =?utf-8?B?Q2RpZTNvL0xiZVVQTkFrdkpTUjJ3SlBGdEpNREQxc21zZDlVck9Ma1U4SGhQ?=
 =?utf-8?B?Mlp5QVkwOTB0QU53YTJ3R2VWMWg5NjlVMGZNaWdLbmVhV0dGU0VJeXQwVXdN?=
 =?utf-8?B?ZTgzRDFKRm1uSjlyR05RWEhTOENyeHRPRWtoT05pNUM2R3ViNENHa0MwRTl5?=
 =?utf-8?B?ZStaYUpwdTJ3d0JRQjgrYU9kSWpmQ24vYmNMcjBwMFZabVYrWGRTQnpGV2hJ?=
 =?utf-8?B?M0t6djI1VWU0L1RpeGFFTW00ZHlmVjhKcjRVS0pXaTdkMG15bnA1N081dnhv?=
 =?utf-8?B?WG5EUUp4Z3BuYXNtd1lOSjg3YWt3QlV2UVdFaCs4UTd1TDVLREpBcDA1Nnkx?=
 =?utf-8?B?TEJQT2YrRjdqcXozN2dUZ29rTlVkNmhuV2NrR2lndWNzZUVkbE5kUkxXZUFs?=
 =?utf-8?B?YVdWcEFGeEVhSXFsdlU2b0hodkxvRkVJSjkxUmU3dGRGUHZUVHhWS0Y0WCts?=
 =?utf-8?B?OGZTVGdjQ25xSnVKeGxzS1gyYTJ2UCs3Q1pnWFRDaEpMK1FNOGV0VHROSTV6?=
 =?utf-8?B?bVlaUlhEeHZOeU56VWlObnpaTFFRMFR6YjRKUGtyYlB3ZTZXQzV3NE9JdG93?=
 =?utf-8?B?RlNSY01wcXVlZThlUDZ2SXlvYXB4b2Y5UHozS3pJZXBmRWtSQjB2TXI0VHRs?=
 =?utf-8?B?bFBWM0REY2Qvak1wQTl3emhhRFVhM2xkMk81OEJ1V3FLRVZwczZRc0VhSTJn?=
 =?utf-8?B?RVNQQjIyaktuSWFHRE1hTVBaVXFMR2t2dnFIOUZNWlJ4NGNTTGVqWWI0RFJ5?=
 =?utf-8?B?VUYrZjE0Rkx1TEVtZGZpc2hoY3JScml4K3pRTlZ1WE00cUJha2JtVU1XYlJv?=
 =?utf-8?B?RFZEbUErWGVwUGtlR2FUWWtjbGV2cHdBNHJUUEZwNWR0N0FGSUY4WDI4Q3oz?=
 =?utf-8?B?MWsrZU1iOUhxV3lQSVZDOUNZWUFZVmp1c1dJY0MyNUwyQ283UVNmVHJWRnJJ?=
 =?utf-8?B?RjJySDlsRmlmMGM3RFNrNDNRTWtBbmZmVm4wZ0VjWGNmVEFyWlZVQVM2UHNl?=
 =?utf-8?B?eGVOcFp3YVptTDErZ1FDb1dYVkNjMWEzTW9sa2RtVTBWa2QwZmh1cXdLTWpU?=
 =?utf-8?B?Z01mUXV6REQ3bWx4TVJ4d0FLcmFVYU9oUTFSbkxhd1lMSGwzMnVyWEFTRUls?=
 =?utf-8?Q?Jcb3um9FiKo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkxzS1Q1cmJmVHhjNmhUN0tKeHpwdzhjZzM3UFM5bG5tTm1tOCtLV2grbEVZ?=
 =?utf-8?B?MnI4UFNrV2dSZTJiNVpTZm5oVXg3UmdJaUtyY2hFRngxclNGc2p2ai8ycnVK?=
 =?utf-8?B?WHdYQWh0S011aGxVMUtPc01hTUlaaXg5K3BLRUxLMm9hcThjOWY1emt2VFY0?=
 =?utf-8?B?dkFJQ3N4V3NHU3dsYnVhcHlzN2tBSUlxb2ZaU0JQWHFpQ0kydUdRcDBpQ2xS?=
 =?utf-8?B?VC9aK25KSEMxeTc3QXMyVDRmZVpITUFOdG8ycFp6RHJMemxDOENnR3k1TTZD?=
 =?utf-8?B?SnROWlBPMHliYUJYNStOc0FMd2xXMTNVanNxYzdQaDVYV3hmNDhQOExZZFp5?=
 =?utf-8?B?T2VacVRtV2ZUUkxGRHdPQ1hINGdQcHpNdVdET1IyN29XQ1FFeXFoM0hoanhE?=
 =?utf-8?B?ekNnNzJDelJOeCtSa3FWZ0ROSkpUTWR6RnoyNU8xRWRqaWpBcVNEWFk3Lzdx?=
 =?utf-8?B?dTJCU3lhV3pyYk5YamM2SUhyZjZ4RmdRSnFjQmZvQk5Nd3U2Y3pFU3BzVE9k?=
 =?utf-8?B?cklxWUhHQWc5SlhZRWtEMlA4ek14SG5YT3F2MW5vUTE2eW9mai9ac1p4Vlgz?=
 =?utf-8?B?TEtIWjl6WDFoQTkySHZsU1VnVlJ3Tk5TU05nd3BDS3ZhOVFDL0dQTlJBcks1?=
 =?utf-8?B?VkZDT1FmTmhWSk9uZlZ4RFdGMnBLUHN3N0RWWWNDMEJyV2VLSEJTLzArSUQ3?=
 =?utf-8?B?a0d4U1lWSkhMR2VpTldXR201RkI5ckthQTBNbzRvSzAra3FPamd4WDd0ekxQ?=
 =?utf-8?B?M3FEa2FFbnd0NG5YTElWVTlpY2Urbi9RcUZjVHBlK1NURklBL2Y1QkhiTGxD?=
 =?utf-8?B?Ti9tbGdPZ000dmNNaTBOdVRhVHcwZUlEL2FwckZRTm1kMFdFVzdTaXRUTktP?=
 =?utf-8?B?VFVtWG12ZGgwTlk2L1VHbFRxOWQzKzRoMXpYSWdUOFhCcTEwSnBaOXRMaTZJ?=
 =?utf-8?B?VkNNckFEWFk1cHlYVldJbDZ1U1Q4VTRBM3Y3b29ESTN2K0NQNVIzeTNXUE1s?=
 =?utf-8?B?Q01rc2tUYVhGeVZGVXpvSnVvUCtYUWluU0xNQlRNMzA3M2QwN3NnZTlJRkt5?=
 =?utf-8?B?ZTh2UDZ3ZGtEc1BxeXRxNm1BODZVNDV3UWc3dk02NjJNY3hITUpIZjFUUUF3?=
 =?utf-8?B?bG1yNUJNQUo4cmpHekdXejhrVWlJS0QxS09EbzVCOE9UNGZ4MkRYenhBUW8y?=
 =?utf-8?B?enRpSnphNXYvdXRJNTN5cDZOakoxbzhSQWhtU3BjQVF1ZVZrTlhiVlBUbi9M?=
 =?utf-8?B?bDlnL0VEWm91Z21LVmxheGVKMS9NVjFlQ21zeDJUa2xxelBQbHVDSlozaG1P?=
 =?utf-8?B?alZKMGlYWHZLVnRUM0cra21oRlhCVngxcHI4TmJ4MW1yNmRsNmo3d3BlNVJU?=
 =?utf-8?B?aE9YMVNxRm5FNVptYitRK3FaQkpKbndtZThaVzluRUFpYjRYc0xOUVprNnZT?=
 =?utf-8?B?YkJPVzRjcTRVRURINFZzU3pBUUNDZlloV1IrdThtdlJnakRNeXd3VUxvam9h?=
 =?utf-8?B?azA3SU0ycmZFSzR4ZUQrdnRtQk1mUmVqeXpnR2VWaXQ5R0xFRnZBdlhGTGlO?=
 =?utf-8?B?NlIyYlJkYXJranRIOHVwSTBiT0NLWmcySXYvR3pScVBONDN4TDZnYldLTzV0?=
 =?utf-8?B?U0ZuRDgwSStvejJIOE5YUGVNRyszQ2pZK2JYYTI4ZnRISklGd3Y2TDRKOTRv?=
 =?utf-8?B?NWRqYVgzYldUQ2t6amNsT2RnK25lQTFKaVRISUlHQks3V0RKbmlBZmdjcVFp?=
 =?utf-8?B?L2dtTDZuWm84eTVsWlNCSytHd0llMEpWK2JWRi9xQ3o1dVJrZG9tZGhSdXlO?=
 =?utf-8?B?QjlJWFZtY3RzcXZFcDRQbUI4UlhVZlM1SVNiYm90NGZMYVdQVFdQU3BETUNH?=
 =?utf-8?B?RFZTaktyZDlaSzQ5dFZyQi8zY21aVlI1eHhxYTFHalFkZmRhT0MxaytxcThl?=
 =?utf-8?B?VlUxM2dJUks5Q0gzTks2N0lCYUFkU1FqSFpnZmViSW13S2g3ODQ3NVR5Si9o?=
 =?utf-8?B?b1hiZDRDZUlYaHBzU0diRmsxa1ZoZjNPamJxanpkNEV5SkZLQUZvdXA5cEZ5?=
 =?utf-8?B?RDRYLzlpSk9iMDhqd0p5V3p5a2tUNWg4bXp0a3VVUDBZK25aK0pPVU9raVNJ?=
 =?utf-8?Q?DTcw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9d449f-4f71-4e7b-6bc7-08dd9d328598
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 15:24:07.4154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGBwA6Lqr4w0pLpxmQomfxZ8yn0/HTu5H/6gA0sYuSPyAivv/o9yspiE7PI+O8mU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF0A63E7557

Hi Peter,


On 5/26/25 04:48, Peter Newman wrote:
> Hi Babu,
> 
> On Fri, May 16, 2025 at 12:56 AM Babu Moger <babu.moger@amd.com> wrote:
> 
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 8d970b99bbbd..ea1782723f81 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -2126,6 +2126,168 @@ static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file
>>         return ret;
>>  }
>>
>> +/*
>> + * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matching
>> + * event name.
>> + */
>> +static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r,
>> +                                                char *name)
>> +{
>> +       struct mon_evt *mevt;
>> +
>> +       list_for_each_entry(mevt, &r->mon.evt_list, list) {
>> +               if (!strcmp(mevt->name, name))
>> +                       return mevt;
>> +       }
>> +
>> +       return NULL;
>> +}
>> +
>> +static unsigned int resctrl_get_assing_type(char *assign)
>> +{
>> +       unsigned int mon_state = ASSIGN_NONE;
>> +       int len = strlen(assign);
> 
> [  395.013183] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [  395.013426] #PF: supervisor read access in kernel mode
> [  395.013600] #PF: error_code(0x0000) - not-present page
> [  395.013779] PGD 39322c067 P4D 2a4f49067 PUD 2a4f4a067 PMD 0
> [  395.013973] Oops: Oops: 0000 [#1] SMP DEBUG_PAGEALLOC NOPTI
> [  395.014156] CPU: 37 UID: 0 PID: 24147 Comm: bash Not tainted
> 6.15.0-dbg-DEV #13 NONE
> [  395.014403] Hardware name: Google Astoria-Turin/astoria, BIOS
> 0.20241223.2-0 01/17/2025
> [  395.014652] RIP: 0010:strlen+0xb/0x20
> [  395.014778] Code: 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 90
> 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 c7 c0 ff
> ff ff ff <80> 7c 07 01 00 48 8d 40 01 75 f5 c3 cc cc cc cc cc 0f 1f 40
> 00 90
> [  395.015356] RSP: 0018:ffa000002f743d58 EFLAGS: 00010246
> [  395.015522] RAX: ffffffffffffffff RBX: ff11000129a00600 RCX: 0000000000000000
> [  395.015747] RDX: ff110001299f5253 RSI: ffffffff827b9651 RDI: 0000000000000000
> [  395.015968] RBP: 0000000000000000 R08: 000000000000003d R09: 0000000000000000
> [  395.016202] R10: ffffffff827b9652 R11: 0000000000000000 R12: ffffffff8305b7f8
> [  395.016421] R13: ff110001299f5240 R14: 0000000000000014 R15: 0000000000000000
> [  395.016644] FS:  00007f1281ff8b80(0000) GS:ff1100bdc8276000(0000)
> knlGS:0000000000000000
> [  395.016893] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  395.017071] CR2: 0000000000000000 CR3: 0000000420bc8002 CR4: 0000000000771ef0
> [  395.017298] PKRU: 55555554
> [  395.017388] Call Trace:
> [  395.017471]  <TASK>
> [  395.017545]  mbm_L3_assignments_write+0x2d4/0x4e0
> [  395.017700]  kernfs_fop_write_iter+0x132/0x1c0
> [  395.017851]  vfs_write+0x2bf/0x3c0
> [  395.017963]  ksys_write+0x82/0x100
> [  395.018074]  do_syscall_64+0xee/0x210
> [  395.018198]  ? exc_page_fault+0x81/0xe0
> [  395.018321]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> [  395.018482] RIP: 0033:0x7f128177f8b3
> [  395.018598] Code: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc
> cc cc cc cc cc cc cc 48 8b 05 99 91 07 00 83 38 00 75 10 b8 01 00 00
> 00 0f 05 <48> 3d 01 f0 ff ff 73 4d c3 55 48 89 e5 41 57 41 56 53 50 48
> 89 d3
> [  395.019167] RSP: 002b:00007ffff66e80f8 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000001
> [  395.019409] RAX: ffffffffffffffda RBX: 0000000000000014 RCX: 00007f128177f8b3
> [  395.019636] RDX: 0000000000000014 RSI: 0000000001eedb60 RDI: 0000000000000001
> [  395.019861] RBP: 00007ffff66e8120 R08: 0000000000000000 R09: 0000000000000000
> [  395.020081] R10: 00007ffff66e81b0 R11: 0000000000000246 R12: 0000000001eedb60
> [  395.020303] R13: 0000000000000001 R14: 00007f12817fa650 R15: 0000000000000014
> [  395.020532]  </TASK>
> 

Yes. Got it. Missing NULL check. Simplified the function now. Thanks


static unsigned int resctrl_get_assign_type(char *assign)
{

        if (!assign || strlen(assign) != 1)
                return ASSIGN_INVALID;

        switch (*assign) {
        case 'e':
                return ASSIGN_EXCLUSIVE;
        case '_':
                return ASSIGN_NONE;
        default:
                return ASSIGN_INVALID;
        }
}


>> +
>> +       if (!len || len > 1)
>> +               return ASSIGN_INVALID;
>> +
>> +       switch (*assign) {
>> +       case 'e':
>> +               mon_state = ASSIGN_EXCLUSIVE;
>> +               break;
>> +       case '_':
>> +               mon_state = ASSIGN_NONE;
>> +               break;
>> +       default:
>> +               mon_state = ASSIGN_INVALID;
>> +               break;
>> +       }
>> +
>> +       return mon_state;
>> +}
>> +
>> +static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
>> +                                 char *config, char *tok)
>> +{
>> +       struct rdt_mon_domain *d;
>> +       char *dom_str, *id_str;
>> +       unsigned long dom_id = 0;
>> +       struct mon_evt *mevt;
>> +       int assign_type;
>> +       char domain[10];
>> +       bool found;
>> +       int ret;
>> +
>> +       mevt = mbm_get_mon_event_by_name(r, config);
>> +       if (!mevt) {
>> +               rdt_last_cmd_printf("Invalid assign configuration %s\n", config);
>> +               return  -ENOENT;
>> +       }
>> +
>> +next:
>> +       if (!tok || tok[0] == '\0')
>> +               return 0;
>> +
>> +       /* Start processing the strings for each domain */
>> +       dom_str = strim(strsep(&tok, ";"));
>> +
>> +       id_str = strsep(&dom_str, "=");
> 
> If there's no '=' then dom_str becomes NULL...

Yea. That is correct.

> 
>> +
>> +       /* Check for domain id '*' which means all domains */
>> +       if (id_str && *id_str == '*') {
>> +               d = NULL;
>> +               goto check_state;
>> +       } else if (!id_str || kstrtoul(id_str, 10, &dom_id)) {
>> +               rdt_last_cmd_puts("Missing domain id\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       /* Verify if the dom_id is valid */
>> +       found = false;
>> +       list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +               if (d->hdr.id == dom_id) {
>> +                       found = true;
>> +                       break;
>> +               }
>> +       }
>> +
>> +       if (!found) {
>> +               rdt_last_cmd_printf("Invalid domain id %ld\n", dom_id);
>> +               return -EINVAL;
>> +       }
>> +
>> +check_state:
>> +       assign_type = resctrl_get_assing_type(dom_str);
> 
> then the resulting type of whatever this is supposed to mean is "panic"
> 
> Thanks,
> -Peter
> 

-- 
Thanks
Babu Moger
