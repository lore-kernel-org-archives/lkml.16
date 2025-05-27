Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2604C1E0B62;
	Tue, 27 May 2025 19:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748375580; cv=fail; b=UlEEI9+a0AHn9z53dxMN54d6EC2e5ftL6ecG3fkAaY7tKSOQoaWz9zQgTV3Gv4n972+5Af9TIU2TnTE5GFwqKDTzteVOvzWiZxV9V7T4WnLJ+bxLtJWEZ+sIyokPb4HZ/YjdpGI8e2kKaLnVRThmvo7sDsDKe52sQ4/THMPhKYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748375580; c=relaxed/simple;
	bh=RX7qG7aWgt8sYLZW0ZCaw8P1ehA5sr4JWhY9uAXVIV4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GLeyU43G093Qb4sB+ACIUMS57rlDIfSrU/OWmMEww+8pjrXNQsdDaiJX2KB9Th+Wp/hQ0l6gjspPL+0g/RO7hTjEerAEWtJHRQmN5dYZ8C+C8Ye/5B3TmJUDCs3XV3M1Z1AdmhQ/FC1SkxoGBHMtgA4AwIdftUvS0+0fJoAqbII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=g+KEPd3f; arc=fail smtp.client-ip=40.107.94.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="g+KEPd3f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ehm5VLsRsYGac+TEq/UJ/mXR+Ie6eKmQROmErVa2xBEebDJ+o9mNWjfsx4g1o4BaMfshLghpDpiMLt3rU5ihZmV8b3KoC1Fsb2nlgzi3+cShhyP669nLuD3BJrm78vhzII5e+Ugyr/p/Omb3TrCKfbtIWJ+CpetkdBc+n7ZJa7RmI4L4d5huSd+bBMYh9KVXm0BFbWDJionYfbkGOVwjoyayRR4wMsZX+8nNTRvI8fypG/uwuiJEYaw6Me7qg6hiQ6HQ+ZT3Zh/bHhvTE2jG2QmuGNJQowfeO/izd0177Bzqc0N6oPCNb6nvhOik4mE80dMDXuyNs7suNiLfEuupig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPaeZ0T/isWRvRhuwDH3aBRYL6/VNpoRTmogoH8oh5E=;
 b=VX1v6X2PgBkYUF50g5OhRK6q4V0Eu8/UASKKhwn7LWOhuHM/Exo10KguHTo2Z+3dRMJXXe49q8vVijRmyiYmzj2OgFsCjlwuQoEn5k3FGOfnvjmdSCblfFomD9wWSF3NSWSKehBfBassV317a0kiEIY46XkAZrD5h0wkSt+9AqL7TnVNgGlycHzFrkNZZtuMcCKdd+R5w/2FmcVMACpPC/mJ4FAWjWHpNVBmi0dOCg1V+OvRNjhlyLC/dT0UmBNDB6JfY6QQPEo377G4pEq2FGxTDIBSaRlz1xjYU6qkpnR1pMLLhorY55SoG0rLZC3qNgJKhMjTKOhAovBWf951Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPaeZ0T/isWRvRhuwDH3aBRYL6/VNpoRTmogoH8oh5E=;
 b=g+KEPd3foIiA2zfxON9/HQWs9RmFMdM/pYZi0wqJ3uRzM8QKuSG9bn5aPR0FbeaMoagJ4vTVRs6QwTGuenu+xtQo8rl0CjCk/0fKJEW1YJjjFQPSy9Xr11prQCQ9MDYdrplkif1PKfQpFp00n57mmiBaFras6Z2dxIY/LyPEXNg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 27 May
 2025 19:52:56 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Tue, 27 May 2025
 19:52:56 +0000
Message-ID: <c375ac30-fb69-41d1-b2c0-22198de03506@amd.com>
Date: Tue, 27 May 2025 14:52:51 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 04/27] x86/resctrl: Detect Assignable Bandwidth
 Monitoring feature details
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <a4e2388b708883874adcd621f50f773484945489.1747349530.git.babu.moger@amd.com>
 <bedd1ddc-d1de-48bb-926d-074fe6f6c253@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <bedd1ddc-d1de-48bb-926d-074fe6f6c253@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::20) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY5PR12MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 517c4db8-3102-4295-2386-08dd9d58134f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGJ6TjJtU0IrWmVDaFNNWTJZQzQ1c3plZWhlR1VDVHJJeE9XM1pabTRJMUd6?=
 =?utf-8?B?NFVBOS9WWERiNmUvMUpxOHEvalMyaTFsdTRWbnNOM2VXNXB0d2tvR0dPcmUv?=
 =?utf-8?B?dy9DeHVKTVJXSEpQeEMvdjFQN3hVdWpHdWZxcThVQi9Mc2NsMnpXUmtBNEZY?=
 =?utf-8?B?Qm9TWVJDcy94T2NGVVJET0JjbW15T1VDUyszd3B0b1ppK1lzK1dUQVpxZ01u?=
 =?utf-8?B?TWNPd1ppSCs0RXNaMDN2aUFKekdjWDlXWGJoT1J2Y1I3MjhPU0xkZ0RjLzFK?=
 =?utf-8?B?d3d3VGNmSEVvNnByLzFNci9MQlFSRVVWaHo4Z3NUMTV3MW1CYnl6cTRnS1RP?=
 =?utf-8?B?YVAxVUFkdHcvdlhBajRjS3F0bTdVZ3hBV05YNzFyc2tEMS9vUDFiS0kzT3I5?=
 =?utf-8?B?NFpSKzVRVk5VczB3OUtZZERkblUxb2FKSG9UT016QUdKcElwaFVENUJRRTc4?=
 =?utf-8?B?MXRvNVRYYWJETEJRNnZLNTBkQTlTNm9MYjJhRGRKQ08zN1FSK0l5Wm1zenFy?=
 =?utf-8?B?VUxLTzcvOXBWcDhKMWNmRUlzSG9ScE1uL0Vwa3ptdllPUVF4cU1yMDRacVZT?=
 =?utf-8?B?UnpnUXpTY1puQ2xoa09JV3NVUGxyKzd0Z2s4c01uMk1wY1JaWHB0TGRtYTBh?=
 =?utf-8?B?QWpsczlHZlR2UEt0UUpJTnpCK0d0NGJLYUt3VEEzZ0txWGV6aUlabmhyWVNh?=
 =?utf-8?B?UXRSemdFNjlYKzYvd0dSNjFNaktsOU05bmRyRS80VlZKRkM3Sk90VllPdk9x?=
 =?utf-8?B?UkxsK2Z1WVdidTgvT1BFcmNDSGpFK2NOSDl4bGI4M3VlcklPcjdPZGhYMnN1?=
 =?utf-8?B?VVAwbFAySXhjbmV3NWNDU2YxdVhZakRLanNySUN6eDcwUnpXYytyNHRFWFJY?=
 =?utf-8?B?SFJxbTEvL2xFNmpKM1N5WE5ZU0RWVGJuV2tRTmticTZCUWtKN0lrM3lyNWJ5?=
 =?utf-8?B?YmM2T2I5aU81aCtYYVl6UmdPdFc4Nk5KeGM2aG45aXNFSGtPbTc2ZlJlLy81?=
 =?utf-8?B?S2M3M3VXOXZ1aEdJRHAwQ0ZDR1pIbEV4dTJEaVM5eXNyeXRWSnVDQlFySTlO?=
 =?utf-8?B?MDl4Zi9JbW1EL0h4eDcrbWpYNVRoYXpGU2ZXRTAxbVpRWlVNakVjRzROb1RU?=
 =?utf-8?B?UGtIcUpVR1RsWEpCV2pQUnRBOUZ3Tm5FSGl6Z0crMGV5dVFGbCt5YXdzd1Za?=
 =?utf-8?B?VzBFUlFhcnhSUzdBb004M0dUR3RybVZlOUE0WkcreXpsZHlHdytyUkZNVEYv?=
 =?utf-8?B?NjlteUN0ejFRY2FlZXpOYUZUYzNtTXVxd1FWZjFHMUsyYWVjK0ZrRndZS2J0?=
 =?utf-8?B?VGxDT0ZnWTY1QXFmcXdBb2hSY2V1eC9EQk0rbGV5bEFYcTJOZmNUM2phMW5Y?=
 =?utf-8?B?b3NhaTdjTWhOSnZCRHZmV0Z4S3RLbGpmck16b290Y25INUZ0bmMyREMvdkxH?=
 =?utf-8?B?TmN3RmVoZnh0R2JncHNqaFRXdkNabnNEV0xvMklBY3NtejR3Q2tVSGc1STBR?=
 =?utf-8?B?d1hKZGM1cVZmbWpWYVBsN01HVXo5eURFWlljdERYMkxxdi80a1NrdTRCU0pO?=
 =?utf-8?B?ejJLdkhzVTdkTEVFNHZGTkJMV0pqWTh2UzJzRnNBZEhVcmVWMEREbGh5SGlE?=
 =?utf-8?B?UGdPRkVqSnBOV2tYRHVvMWZkdWY3R2R4WlpNdjRjcXFMM2dGcXN3Q1dTNGtJ?=
 =?utf-8?B?aDR2eWtBZ3FyeENlbW9BeDRDcTBOdjM2SUJUVDlyTlRmSkZWaysyZ2ZTU3Jn?=
 =?utf-8?B?QVdMNVFWY0N5N2YzSllGMTcva1NWT1dZbFdLUUpaSzRldWVjVnZCcG1FVlJw?=
 =?utf-8?B?V3dYNnE5elNYaDRCQWtPYXRlUG1ldnRMQ1Q2L1hzM0h3UTJRZWo1NkhpU1RI?=
 =?utf-8?B?d1pCd3FEMkpBTWIvMnd3QW43Y20zTmZOcWc5bXNtYmhwYlUvaFFsUWs3YllZ?=
 =?utf-8?Q?p1Sv/kIelAA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1hsUmJITTlURURrRU5IcmdrbW1oQ3ZzQXNQdWhLVklPNXpzamRtMHJ2aTdh?=
 =?utf-8?B?M0N3ZFRvTkhrKzhSR1hHajlaNk5oSjkyOGppQkZ6R0FKaHRnUDhLWVhmOEww?=
 =?utf-8?B?TEFTOVV6bUFVbGZLRFJabENoRHZxVytEUnhEeUo2UTZTeUhKNzBkcCt5SVVN?=
 =?utf-8?B?SzJyeDJvdFpoQy9abllrY3dETDVKZFB2dDFBMjNZdyttSkxYa04zQi9yMDM5?=
 =?utf-8?B?UmNTMWQ5NWJJUU5xV3ZCN3M4emMxL1FCV0ErMnByb2NlUk5xSXBETnFCaU1J?=
 =?utf-8?B?L2hhQm8vNVE5TlpPOFh2ODRpZWdpT3pIaS9XMldJS2RNYnI1V1h5OGJGajZY?=
 =?utf-8?B?UHpyQWRYNDVMeGZyQXFLTTh6RW9Hb0hwRjlSNEVqekJDa1dsbnUvNy9IQ1lv?=
 =?utf-8?B?TU05UTZ0cFZheFdsbUo4UW40bCt2cUtFZHMza2Y2WWNYM05yZTkzRUFFSXpE?=
 =?utf-8?B?Zy9vUW5HcElPV1gya3VUSW1KUmdqME84VEhUY0F4S1N6emFyZGFuSDVSSTZu?=
 =?utf-8?B?QlQ5V1dMNlp1Ym0wSHFUVjBLUm54K2RYdUxsU1BEV2FHbmZZNEFvekJtaUcz?=
 =?utf-8?B?UUhPLytqbVpOS3gwK2drRnFHVzJjUGg3UE5VOEp0bHVDZlA4ZE5odFhMY0RM?=
 =?utf-8?B?NjBHVms1eEpmOXE4ejN4LytmTXpqTkIycU84aUw4SHBLekRRY2JtSmYvNUNq?=
 =?utf-8?B?L1A3K3pRcFR1Lys0UXJXREpmTDJqYmx3WnZsRVNZZTVpTEU2Q1B4T3NhT09a?=
 =?utf-8?B?Vi9qSFROSVBwaHVxTTE0Wk5RUEZIL1NPKzlMTk5yTjM1K1lHNWdmK2dBd1lD?=
 =?utf-8?B?c0xZSzMydk1oR3BjL0JrMWl0SWF5Mzc1TWl4cDR5VmZiSTk5UFZQZDR2TlNy?=
 =?utf-8?B?RXhLODV0UFZRQlk4OE96SmprVGNoVWhCUDZQcjJHS2hEUTZGTXJlN3BUbC9C?=
 =?utf-8?B?ZXlpeW5OcjN0b2VHVHVHWGdEcnQ0akNXN3l1MGRkVDNhUUlHazFha0JzK3cr?=
 =?utf-8?B?UXlpMDlldnhnSHZrRHpDQ2R0TmE3TGdZYk1ORDQyUWNQOGFQUEtRQlY1M3Q1?=
 =?utf-8?B?UWExR0NHb2ZkcEQ4MVl3OGE3cnhRbjNuVWZBbHJ1WHBVb3lBSDdZenFiN05L?=
 =?utf-8?B?YjYyVzZMWUY5QmMxUkE2S2k0Z0YrZTdnYWxHQUkzanNjZThRcWQ2Zkhla0FM?=
 =?utf-8?B?VmZZV21YRHBqMi9Oc0VtQTNQcWFveGpqNVE3SG5VVTVrMzZYY1YwVTZmM3JE?=
 =?utf-8?B?U3k5djRTVFBKRjVscDNaS3lLUlM2UGovOEhHT052TklwaXc4YkdyRXBYQWdy?=
 =?utf-8?B?N1ZMRDRUNjBuY0gwMWNJbElGeUNidm13NnU1amRHK1VKLzh1VStTUitJWmo5?=
 =?utf-8?B?N0QzOG5yNDRvQWtBQ24xclhsU04vSzlpU1hXY2hNNXpvYmtIbEJBMFd6SUdD?=
 =?utf-8?B?U3orVTkzWDVmUTZpWmdxeURIZW14ZVhWbnlvZHFqRDdyNHVKY0xMQUR1MUZH?=
 =?utf-8?B?bHN1QWRsU2lOUGFrSnVXeHBLOUlsUGpHNEhlalhJRStVd2toUVdDZ3FUTmRu?=
 =?utf-8?B?SWkvN0kzcGo4TXkzdit0MVhuY1cxalUrWEF3Y3ZRTTZlTXV5VWh2Vkh2RERo?=
 =?utf-8?B?dXd0eGNUU2E1WTZxcmpvekNlTUkyc2ZwSTk0K1hSaWNMU1ZPSW55RGhONy9U?=
 =?utf-8?B?dGRJbjhaZmp0c3dOdzR3SHdVbGRzbk1PU2RBSG9qUXFGajdjU1NnYmZJMTM1?=
 =?utf-8?B?cFJ5bG50WktWU3g3MjJzVlhiYjl0Q09HMTdMRUVUVGY2WG1xR1ZlQTVSR09h?=
 =?utf-8?B?ZFNWRG0yVDUxNlE2MVhOOEE4UE5rRUs4b1A2M08vZWRjZjNyZ2YrbUpZS1dH?=
 =?utf-8?B?c1B6ZEJJbFZOVFFMdmRsZUhSRHhjQ3FZOGN4MG0vODIxV21qL3Y5YnZDWFM0?=
 =?utf-8?B?dHFIRkd6ZnlpWlQ2WHhLLzFseEdrM25hTjAvanZLYkIvckpEblB6Wm9OYW9I?=
 =?utf-8?B?TlQ0L1Y2NzZkYlAwazU3eWJaS0REaktTRGpPNmtVMHpGd3hsZWJYcjVNNDZS?=
 =?utf-8?B?amVoZjdObUZ0TVgwQXB1bGFmaW5CQW9HOTIzdkVITUhJK2E2Wk5LUVI0azE5?=
 =?utf-8?Q?Pep0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517c4db8-3102-4295-2386-08dd9d58134f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 19:52:56.5137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCh/4ARXy8tGH0LGrZCk0CQG6cKzVdHf1fSLU5MCjLk2UnJMitc9+zhth77hlbkH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6478

Hi Reinette,

On 5/22/25 15:54, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:51 PM, Babu Moger wrote:
>> ABMC feature details are reported via CPUID Fn8000_0020_EBX_x5.
>> Bits Description
>> 15:0 MAX_ABMC Maximum Supported Assignable Bandwidth
>>      Monitoring Counter ID + 1
>>
>> The feature details are documented in APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>> Monitoring (ABMC).
>>
>> Detect the feature and number of assignable monitoring counters supported.
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  arch/x86/kernel/cpu/resctrl/monitor.c | 9 +++++++--
>>  include/linux/resctrl.h               | 4 ++++
>>  2 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index aeb2a9283069..fd2761d9f3f7 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -345,6 +345,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>>  	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
>>  	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>>  	unsigned int threshold;
>> +	u32 eax, ebx, ecx, edx;
>>  
>>  	snc_nodes_per_l3_cache = snc_get_config();
>>  
>> @@ -375,13 +376,17 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>>  	resctrl_rmid_realloc_threshold = resctrl_arch_round_mon_val(threshold);
>>  
>>  	if (rdt_cpu_has(X86_FEATURE_BMEC)) {
>> -		u32 eax, ebx, ecx, edx;
>> -
>>  		/* Detect list of bandwidth sources that can be tracked */
>>  		cpuid_count(0x80000020, 3, &eax, &ebx, &ecx, &edx);
>>  		r->mon.mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
>>  	}
>>  
>> +	if (rdt_cpu_has(X86_FEATURE_ABMC)) {
>> +		r->mon.mbm_cntr_assignable = true;
>> +		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
>> +		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
>> +	}
>> +
> 
> Shouldn't ABMC detection also include enumeration of which configurations
> are supported? From what I can tell, looking ahead patch #18 hardcodes definitions
> of all known "bandwidth types" (which term to use TBD) and then patch #20 allows
> *any* of these types to be configured irrespective of whether system
> supports it.
> AMD spec mentions "The types of L3 transactions that ABMC can track are
> configurable and identified by CPUID Fn8000_0020_ECX_x3."  It thus looks
> like the enumeration of r->mon.mbm_cfg_mask when BMEC is enabled is
> required for ABMC also and used by this implementation.

That is true. Will add the following check.

if (rdt_cpu_has(X86_FEATURE_BMEC) || rdt_cpu_has(X86_FEATURE_ABMC)) {
  		/* Detect list of bandwidth sources that can be tracked */
 		cpuid_count(0x80000020, 3, &eax, &ebx, &ecx, &edx);
 		r->mon.mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
}


> 
>>  	r->mon_capable = true;
>>  
>>  	return 0;
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 2a8fa454d3e6..065fb6e38933 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -260,11 +260,15 @@ enum resctrl_schema_fmt {
>>   * @num_rmid:		Number of RMIDs available
>>   * @mbm_cfg_mask:	Bandwidth sources that can be tracked when bandwidth
>>   *			monitoring events can be configured.
>> + * @num_mbm_cntrs:	Number of assignable monitoring counters
>> + * @mbm_cntr_assignable:Is system capable of supporting monitor assignment?
> 
> "monitor assignment" has not been used so far, was this intended to be
> "counter assignment"?
> 
> Reinette
> 

-- 
Thanks
Babu Moger
