Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53778267F4C;
	Wed, 25 Jun 2025 20:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882490; cv=fail; b=EfSRTBfak890W4Tdb0dCqJwFvKfOvbNShKOsC0kNKG/0tMQkssUQU6G4IYiZe2qC/6gFd7in4/2XxXZ2l8LfTdt5lffmlN7ssi3LvqH605PXAkUsVTXgW+9Rar1u54V5E5xQSOy12midf1Qs3SyBwMkbGGqA9PepwAv4HScNSck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882490; c=relaxed/simple;
	bh=VWM0DYMW1URszuI6D4VcZ1CwCLkpki/adi7eTzLVkE4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BVLvu8Uugnzi3UebqzEOJfq2NntxV7zLVN0C2dKXfdTHlzw7/aa2B+x+9fZCrs4HASBH7M1RvwcthtB13rKyWUlfEZBoWYjp5Dq77D8TSjdPXEEPj4krOf+BFnMV/5b0rjgtBE7es+VYa0rS9cB7Lz5+sWQ7zSVo44/G/idsC04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AhVPvM5W; arc=fail smtp.client-ip=40.107.223.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AhVPvM5W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZCk9Sk/Ionkku8guQsDq17+2Bijifegvl3GmgDlj1QzxEyBzpmhFybRMQvaW9ok0fMoGkyS40d/l79v38XSuBg3r1i5b/d6/ihvPo91UV7tiRIlZzrO5jeMBLuwueQr9Ooz6hq1HlKTgLkUT4pUROAX1Zv3XF0apFoth/YBhSdq/Dq8K/S9JLvWkTouzlSarL2kNK5/8DqOzlbr/OBM6leP+ahx68oaakDycl5qPpUl/McpmczOPP6f+DfkB+0vGtbGJizqD/UeZLwxfXtJosu+7fNZIsiHrQprFNCp6HVmTdqwvQAKQoLZzYaqFxVCpscSpqUX1cds6tRNKMjbNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yujWDLpM31gS9MRXA+2dP+q7ncDY159daxWofFf2IZs=;
 b=EZgFPi/4eHd2pox0NyX0upipDLRCC+t4HRip76fAas2HF6KyrSt4ELW0vRS2MkQh3z4UXVQWwCBxrl3KtRN7/omXy8j9fNClElgSBkePFpiLK8e3RpLMZ09KHuF6XDD8fZuoaBV+ZAWR0iyOOq7C429EssmT0SBASFWE4l6/zkv4PVmA8vwsnc+7j9q4DU7qogz1VRdYGpoFT2FUYwsAogZ8+MazfSm7NodC/0ddBZgux1m7v/hmL8G90UpMqHwWLZRU7fizQop/k3WO6fBckj/T86ldaMW+wF6BGV/LlVIZ4/fIdXl/0BEXN6ZZqAzv30QkPMKMiMI0lnVKXJbnMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yujWDLpM31gS9MRXA+2dP+q7ncDY159daxWofFf2IZs=;
 b=AhVPvM5Wp/aMTAR9QyDVcrT8WKk8EzaKFhYDSMgEoZgHz/x4AjZBKtraWqGpjsyZX9a5KSPqEgj0Qtyudk/NmzQnC+kRTYHw+a2g3OXFfEOITu8RxFkzisBAZFqCvJ1GU7CKE9ZPBd2lPHEA7HwaRh+Yk5z2GJh9/b3LfH0MZsU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY8PR12MB7514.namprd12.prod.outlook.com (2603:10b6:930:92::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 20:14:46 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 20:14:46 +0000
Message-ID: <102328ce-39fe-44a0-884a-1ba74c4bbaef@amd.com>
Date: Wed, 25 Jun 2025 15:14:41 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 11/32] fs/resctrl: Introduce the interface to display
 monitoring modes
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <b1192216e05c5a5a0963b43698760106644b95eb.1749848715.git.babu.moger@amd.com>
 <94825e50-1f8d-4612-bdab-33db756a19a8@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <94825e50-1f8d-4612-bdab-33db756a19a8@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0100.namprd12.prod.outlook.com
 (2603:10b6:802:21::35) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY8PR12MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: cea553bb-330e-452b-a0ed-08ddb424ee11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlBCTm1yMzZNeGNHSGNPNzkxUDlReFdKWkQxUGc5M1hSZjdHVmlHZFc2bE1Q?=
 =?utf-8?B?bmJSMUROTzYzbzVJUG1kNGFDenBDOVJ6RzFqYXgvTUZta2Vhazh0MURMbUR0?=
 =?utf-8?B?UmZDWk5qaFBrMkZqU01aVlR1aTVDd05pc3NsOXpMTmZUYy9rVzNGSXRZYnRl?=
 =?utf-8?B?RWxSV2kwMXBLSHJLY0t3QmgvVGZPbklqbllQSzVWYXJQaGZPRlZqSVJGWGZz?=
 =?utf-8?B?d3lPdHk5TFR6ZU9lV0RzMDl0RE1JVGZLNlB0eEM5NXVRTDNaWjZMZ1BqeUhB?=
 =?utf-8?B?Mit2T2FiaXpSWnVpcE5CZ2tRZ1VwRjFQOE8wUlR0bm1PSkZMT1BYUHlEaGJ1?=
 =?utf-8?B?Ty9aSmpyRGQyNE1SYXFJVXlDK1hPbWNwajRuUEtpZHlWZHFiaGphNmI4R25w?=
 =?utf-8?B?ZHgwazM3a2MyZ3RvUGloc2ZneDdVTTJDMjZIYk4xK252NC91SklaWVZhMDBl?=
 =?utf-8?B?OGE0bmt1Z0xtSEtSWDdUdStDUVVTWnBIcXJGQkZVNlRmaC9WalUycUw4eWRs?=
 =?utf-8?B?VGk1OHRXdnJJSGcyTWJlNlZOQVNpcXJSMktRVEM4aHk5SUVtWWRaNm5qQXlO?=
 =?utf-8?B?SWxlN1IwdW5YN3F5eEI0d1NjdjJhc1FnaHBETzh3VWl2VHFsVmhiMEV0ZDZo?=
 =?utf-8?B?bUlibGxROHhzNmxSKytSd3AvRFU0SFZCS05uUTZudDNsVzk2dTJnSk8rVFF3?=
 =?utf-8?B?TnpVbVNvOUhNVi9CS3doWXI0Ym1taEJ0WUdsYWZGckN3a0duNEdyYWdYQjRh?=
 =?utf-8?B?R1dYdFlNSkxvTTRrbUFzRVM5cE1nMHJTb1IvcFBBM2hXd1dpajIvRmg4VFp0?=
 =?utf-8?B?SGppVFd6dDZGS3pUK09uQ2ltVlA3RjMzQmh5Z2Znd1R4ZVRhanhmeFhORisw?=
 =?utf-8?B?K2krTDBHODYzeG5paTN4cTFhVTI1K1pwT0tzclZRVVp3RlpWYlg4SDRvbGRu?=
 =?utf-8?B?RGtEOVFvT1p6ekR6T2tUUTJkVS9jR0tiL3ZRNThuaS95Nmpabi9iYmw3cGFF?=
 =?utf-8?B?MFZlV2lkYi9qWUVpaWEwdktrZVd3WnJBVTRQNFV6UmJVZ1l5b0pJM3VTdDZp?=
 =?utf-8?B?Q1lGVnBET2ZTcHpuVmhYUnFSak9JMkJJMmFhUjFlTkp6Z1ZLN0l4aDhDT2U3?=
 =?utf-8?B?ZEpyK09GWEhMd1hDYmtrNFRya2cyWkFGMTNNR25GWHpWRUdMYS9lcm55L3VI?=
 =?utf-8?B?Nm9qWGM4ZFI2b1VnUTk1czlKSEROVjFVcEVzVW5pZGdISGlvbDcxS3JuZXpV?=
 =?utf-8?B?OGFoalM4T1pWVFFTZThZc1JVSjRvdDd4NFU0ZjQyRFhrblZMVW4wYVpDYjdn?=
 =?utf-8?B?N2pjQnNHMXlkcVAybTlFYkxZaUlZOG13TFN2eStDWFdrQnNxT2JQYTJHZXJ4?=
 =?utf-8?B?Wk9VWEd4NlVjdDMwcWZXRVRPcmVuVHZlTnlHN0w4REZScnlLeEpvSlMrQVZz?=
 =?utf-8?B?SHZDaVl3SWRLRXRMdmhFeXo4TTB1SjNndCtJZXIveTFuV21DcVlvclF4SlNq?=
 =?utf-8?B?Nnd4VVJ6YmdrckM1U0grbW1Qc1FaUUJzLytXVEYvUkNTSWlLMUY2Ymdxb2lv?=
 =?utf-8?B?YThTbUJWK3NGNXVWbG1CSitsbjBVajlNQlhwb1p1eEtrbk9BS3dDNUZRQUVk?=
 =?utf-8?B?bHRuc0hoemFMTDdFaGx6bHdvVWhxZXJRdktOck5rRjBDR3ZkZEFqWmVvcUdo?=
 =?utf-8?B?Q29TSy94ZUlGVUtDK2lETlhqcHVXYXRrc3JHQVJRWUV4dWJNclJjeWsvSFRv?=
 =?utf-8?B?Ry9EbjN4Z3h1THNhZkdkK0FEYVJxbDUrTWJGVkwzUUFNd053Y0E0dGIvR1hx?=
 =?utf-8?B?WktxYWU4ZjV6eUs5T0E3MVNlNzVTeEpTTUFrcS9EOC93TWViazgrenJVK1M1?=
 =?utf-8?B?VGIrclhqcU13Z2d5V0ozR0pCRjJZcUxjb2hDRFR6dlNwQms0dmRKRVV6b3lV?=
 =?utf-8?Q?RFwLIs9cp58=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjRZcmlXcE1XQUw2eitwT0dXQmhySlFsM2wxbHFTNlZEbmd6b3lnVmpjYlpI?=
 =?utf-8?B?REs2NTdVbmdPNURaRm1EVjIvZzBCRmJTK1ZKUnFiSjhGVGhaYklSeHJkNE0r?=
 =?utf-8?B?UlJvNExUNnc4bXN4enNxdnpmcGdrTWlqQUNuR3ZZakF4cWw2V3ZiSzhpQTh1?=
 =?utf-8?B?dDdORk5nQnArM1BxeDE4OUd6ZzdyK1lhcmVpdnlka29VYWdZM2V3Tk40dHIr?=
 =?utf-8?B?S0FrbXpRTXFkYUh0cEF1eURNdFphVlY1V3VMcndqYlhWYlpub0svVDlLN1V4?=
 =?utf-8?B?c2d6ZTRveEdFUEJsYndQRmpjZXpUcXQ4SHpBN2JxN0hORENFcnpjYlhBVzJ1?=
 =?utf-8?B?cnQ5d0RBMnJDVkRVaitCUjZ3VXJ3ckExamxpOGpUbk9pOUdnZFhJRVUrb0tM?=
 =?utf-8?B?VTVyZjhNT0xDL3F6ZTFucit4UTFaSHkrTWFwNWFnc1UzUHpxejY3cTRkcjBN?=
 =?utf-8?B?Nm92VjBQSWZSR241ZG8xVTEvbk9tV3A5b2lNUzE3MmNjbkhXVDhIdmtoMUxr?=
 =?utf-8?B?cmhucCtxaEdmZkEvcDJNQmViNjFxWUVSZWNKUVUvUk5sOVF3VlZIMkZ6cVZX?=
 =?utf-8?B?VG44ZDk5eEI3VEZpSjJsdDB6NWdTenpPZnhIMzMvK3p5UHk2RUxWWjFyUGRE?=
 =?utf-8?B?SGtFVlNXcnBTZWRnTUpURDlDbkpmR3hZUFZ3NU9xcVMrMmx1cmtPNU03Wjc5?=
 =?utf-8?B?cFh1VWp2anBZSmpYV0NQK05oaVZkQ3ErUWJzN0RITDUvUmhhelhyYVNzZlRN?=
 =?utf-8?B?aElnWEdhZlNTaGJ2SGt5bHJLSDhzdjBTK3UwM1AzS0pzWmNTMGZaYlRNeWR3?=
 =?utf-8?B?QWVJV3JwN0VpSk15dm4xSktFRHRFbHl2bWNkNG9pTkhpN2szODQzNWkwSHA2?=
 =?utf-8?B?QmhoNjQ3VUFjUGM3SnhlODNrdlQrenpTV1ZKQ0pSVytkTWoxNk4wdGk2RHh5?=
 =?utf-8?B?QTd5WDgrcFdYUldPK2ZJSU5aYnNXVGxIVFgwempCQXFVWkczbDd6bmxSZjc0?=
 =?utf-8?B?anpHV2IxeXlBRTU1YW8zNWMvbmovQ2o4bVV0QzY3NUhlUDlpc244MEhYNXNr?=
 =?utf-8?B?aUJjS0JUd3lOK0pjSDJja0c0WlUwOFJ3N3JEU1ltczVNYVFpdWowWnBMTG91?=
 =?utf-8?B?RmllblJkUklQajVpOGw2dW8vdHNGY2xaTFF4NFp2Q3NQbm1xaEQ4QWhpNXVV?=
 =?utf-8?B?cGE1djF6dkNrLzJURVRUbk9YaVNYZ2NNWG4zTkVidllXVFFjdld1T1hhQkZp?=
 =?utf-8?B?Q1d1NHZZVnhQRWdHd3M1bTlXT0VOVFo0ZmsraVo0TEZoM3U4RjFGSm0zOElr?=
 =?utf-8?B?L0pvV1pJTUVENG9XVHJKQkY1bW5URk94OUhFYkYwR1lMOWdZdGJyT1daSWlB?=
 =?utf-8?B?aUJhUG1RSDliN0RTUFkyZkZKZXZQL0VGUk5zOEVGN05PMFUwWUVuakdpeW1U?=
 =?utf-8?B?aGFYRFNhR0tvKzlQaDNxeWp0d3N4em9SemlVT0ZqQ2VwcGZlNzFZUzJVcDRy?=
 =?utf-8?B?TlVlMEN3MXpCbGdNa1hZajNwZ2tZK09QL0U1WDhqQk9NcVJON1hpVyt2SXVY?=
 =?utf-8?B?SUFJWXdvQmViQ3NtYjJLbDZzUDYzdlJLdkpFdDRKanFmUmEySjVZOWVWeE5X?=
 =?utf-8?B?N0VacUkveUorTHJEemwzaUtVdUpwYzFDc2wwT3VJeHpZdEZIWW9rekRlM2xr?=
 =?utf-8?B?eXVYRzBYMUVwTUl3dWFuOVZBMjluODUvY2ZOemRaSXhUUFFJWmVlV056eHpz?=
 =?utf-8?B?cFpwb2U0VVAxL3FmVWxrdmcxWVVrZHVhd3o3ek1mYmJicy9tRGYxVUV1dmc2?=
 =?utf-8?B?QXJyRGFFV3lBbWxFdHN1c0xWODk2ekNlcWNaekg5aS90RU9mVHN0ZDc3S0xO?=
 =?utf-8?B?bGlhK2J1QVhGVTIxUHB6Q1Mza3V6ZTdnb3F1U1B5alVQdmpRdk45ckNUTFYy?=
 =?utf-8?B?eDR5ZjJSY0JnWld0RUlxNjVySDY3bDRZRjRSSExIOXBGcWFGb3QvYXpQbjZI?=
 =?utf-8?B?ejNMQ2dZU1dqZGFhOGxDWW9IUzYrNE9EVEVWby9EK1E3aGNrUW5hZmg2WVFT?=
 =?utf-8?B?ZjJKY1ZpK2J6RnoreUlvdk03NlBoMGE3RVdYYlVkVCszQWU4ZlI1c0pYM2FV?=
 =?utf-8?Q?GwbE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea553bb-330e-452b-a0ed-08ddb424ee11
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 20:14:46.4949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PsMC8mLxnyzYZXoljD6S7NcY0t4j/NVREHfReJSv3CZYoN+eGPspGQ8C3GhD/F9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7514

Hi Reinette,

On 6/24/25 17:47, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:04 PM, Babu Moger wrote:
>> Introduce the resctrl file "mbm_assign_mode" to list the supported
>> monitoring modes.
> 
> "the supported monitoring modes" -> "the supported counter assignment modes"?

Sure.

> 
>>
>> The "mbm_event" mode allows users to assign a hardware counter ID to an
> 
> nit: users do not assign/pick the ID, this is done by resctrl. So perhaps
> just "users to assign a hardware counter to ..."

Sure.

> 
>> RMID, event pair and monitor bandwidth usage as long as it is assigned.
>> The hardware continues to track the assigned counter until it is
>> explicitly unassigned by the user. Each event within a resctrl group
>> can be assigned independently in this mode.
>>
>> On AMD systems "mbm_event" mode is backed by the ABMC (Assignable
>> Bandwidth Monitoring Counters) hardware feature and is enabled by default.
>>
>> The "default" mode is the existing mode that works without the explicit
>> counter assignment, instead relying on dynamic counter assignment by
>> hardware that may result in hardware not dedicating a counter resulting
>> in monitoring data reads returning "Unavailable".
>>
>> Provide an interface to display the monitor modes on the system.
>>
>> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> [mbm_event]
>> default
>>
>> Add IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check to support Arm64.
>>
>> On x86, CONFIG_RESCTRL_ASSIGN_FIXED is not defined. On Arm64, it will be
>> defined when the "mbm_event" mode is supported.
>>
>> Add IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check early to ensure the user
>> interface remains compatible with upcoming Arm64 support. IS_ENABLED()
>> safely evaluates to 0 when the configuration is not defined.
>>
>> As a result, for MPAM, the display would be either:
>> [default]
>> or
>> [mbm_event]
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  Documentation/filesystems/resctrl.rst | 31 ++++++++++++++++++++++
>>  fs/resctrl/rdtgroup.c                 | 37 +++++++++++++++++++++++++++
>>  2 files changed, 68 insertions(+)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index c97fd77a107d..4e76e4ac5d3a 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -257,6 +257,37 @@ with the following files:
>>  	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
>>  	    0=0x30;1=0x30;3=0x15;4=0x15
>>  
>> +"mbm_assign_mode":
>> +	The supported monitoring modes. The enclosed brackets indicate which mode
> 
> "The supported monitoring modes." -> "The supported counter assignment modes."?
> 

Sure.

>> +	is enabled.
>> +	::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +	  [mbm_event]
>> +	  default
>> +
>> +	"mbm_event":
>> +
>> +	mbm_event mode allows users to assign a hardware counter ID to an RMID, event
> 
> "hardware counter ID" -> "hardware counter"
> 

Sure.

>> +	pair and monitor the bandwidth usage as long as it is assigned. The hardware
>> +	continues to track the assigned counter until it is explicitly unassigned by
>> +	the user. Each event within a resctrl group can be assigned independently.
>> +
>> +	In this mode, a monitoring event can only accumulate data while it is backed
>> +	by a hardware counter. Use "mbm_L3_assignments" found in each CTRL_MON and MON
>> +	group to specify which of the events should have a counter assigned. The number
>> +	of counters available is described in the "num_mbm_cntrs" file. Changing the
>> +	mode may cause all counters on the resource to reset.
>> +
>> +	"default":
>> +
>> +	In default mode, resctrl assumes there is a hardware counter for each
>> +	event within every CTRL_MON and MON group. On AMD platforms, it is
>> +	recommended to use the mbm_event mode, if supported, to prevent reset of MBM
>> +	events between reads resulting from hardware re-allocating counters. This can
>> +	result in misleading values or display "Unavailable" if no counter is assigned
>> +	to the event.
>> +
>>  "max_threshold_occupancy":
>>  		Read/write file provides the largest value (in
>>  		bytes) at which a previously used LLC_occupancy
> 
> Reinette
> 
> 

-- 
Thanks
Babu Moger
