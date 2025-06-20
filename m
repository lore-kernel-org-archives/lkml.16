Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9403238D53;
	Fri, 20 Jun 2025 21:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750456696; cv=fail; b=Gyc2ZWstZsO1/fXY9SdBM5C98m9IpIKu/gOiEXCrXnRkFWPjJsAsC4cbomR3odmC1fpEZ6qbpdlgRJFTbk45pQSTpI5JOIav0Kbp0iZcIs2zObd0j7KwYQ+FRMSZVSaM9d87Qpo8vGyxmPDPxKJAyb/xob2I8jTZfXZN/pkuVoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750456696; c=relaxed/simple;
	bh=gcfLY6cDN6owuz+rvUsIFyK6RodqRqu9TzCq9UYltZs=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nEL8CJxfQb1LeDaT3ycKU3cpC4wnfKYKiFx70B+V4E8Gon+kiFNYv2Rc6d775x7TcBgR7M5Wyob7kpnRLg5q7IWPUVvVhYFAqktyk/p/hujYV777b3wrPEExqHMLtLhL126kD+ujpHj84IBJBMsON2ua7IHK//hP8JecPSWgY80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FvzngMIr; arc=fail smtp.client-ip=40.107.220.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FvzngMIr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lRCcAfObg5Ka2Bn6kwIWlzF7cgw0VD2lihSHi0rflHoJ6I+hnbIn/SriYBFG0Jgf7RvEsJdoHhTwl5DASUH0oBELhJmCReguDfO8s8xoXS4n2jaoFZHCAc4RqJaMsTiyrVOBowfQ+FlHFdXoz/Zat5BweaF6gbY3lE4gBDhpXLiV5yGTR1zTUBOP/aWvCmUxpDQdFFpO3l6TFZnU0DqG4gu8sJSNiL1NhNzJ/qh7lPQLeHaeWwtRdoA124uYZhokJc6ljSgNHRMPuXZYGn7t3mx4xrfRtjPxQz3FDjKu/oVmMMqh8PI38iP6qnyElzzkatRNwNZqEmHw/pEzoXCEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0Y7RaeiMXrWFNgsRoOoHC6yeIiqi9qw6BlrYs8VI+U=;
 b=JLPoZM6qqs4cpRGqz09qwEbrn/vN0diOxdvyYbpSnL9Kf4hSDya+5MjebMEy6pNI++Lu4so0IYtM1aJ52F/9v5EAwCnXuVx818I7/vDAfKJywblJS8gvM62LNrNOMR8DwDTdxgcp0g4rLiKDKkBH9PCzxT1oFV6BizHABitneaDtR5CJwERKMgAIyEejo3Nxz0bmAhMwYOqsGmJbQnhIq6uRaHKZvG6gr9W1/voSLJZdYzLGo36yLhBvx01lJ944cPdtmJYwtqZFpgPDdaYZOHfoWitH6h+8twN30Qd2CfgqNpKR4d8Tb3axgxw6Lt64CT123uK3Utv70Nlt2K4h8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0Y7RaeiMXrWFNgsRoOoHC6yeIiqi9qw6BlrYs8VI+U=;
 b=FvzngMIrIDwo9CrCeyL43oS+xD+HTkW3yzuDoPKMX/Xl8Kyj58szxyT+DyLhtDxZ8fAlyGu5t3UgAFbQdQ58nKRHshpJTJpUIw/jVyUweLz7ZGr0V7rR25mBW9Sfv8yjUH6IF0Wka1GBO+YtIHEvN5EBkb4XrGmZ3rewGnSpAn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Fri, 20 Jun
 2025 21:58:12 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8835.026; Fri, 20 Jun 2025
 21:58:12 +0000
Message-ID: <cd1de466-734b-465e-9cf2-bc5822efd6ba@amd.com>
Date: Fri, 20 Jun 2025 16:58:05 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <bmoger@amd.com>
Subject: Re: [PATCH v6 7/8] fs/resctrl: Modify rdt_parse_data to pass mode and
 CLOSID
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com,
 yosry.ahmed@linux.dev, kai.huang@intel.com, xiaoyao.li@intel.com,
 peterz@infradead.org, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, sohil.mehta@intel.com, chang.seok.bae@intel.com,
 andrew.cooper3@citrix.com, ebiggers@google.com, ak@linux.intel.com,
 xin@zytor.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749677012.git.babu.moger@amd.com>
 <8ffa8b31f471750464235f6df21971f7353b7015.1749677012.git.babu.moger@amd.com>
 <2dd192ae-3342-4115-bdbf-a4109dd54d89@intel.com>
Content-Language: en-US
In-Reply-To: <2dd192ae-3342-4115-bdbf-a4109dd54d89@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0784.namprd03.prod.outlook.com
 (2603:10b6:408:13f::9) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: 396b6e42-ca5f-4957-77f5-08ddb0458d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3ZGUHgvblNhVFJUdkJWSDJKZ1Y1NlZBS1Rua2R0MEw5c0RYbkI2MmpzZDYy?=
 =?utf-8?B?RUoydEF1Q0h3T1g1ME55ZlpOcEVmNWJYRDIyM2FOZHg1L2s0NFdyWHdjRU5B?=
 =?utf-8?B?dE1rd0JIb3QwR00xRXJPNVhWREpOYUY2Y2dyUUZDMWxuODN5SlAzZEg5RW1L?=
 =?utf-8?B?bFlMNkhPdHQ1Zm91SDNZbi9KMmdIWjNHbStUMWwzd0FqeWxvM1BYS3ZDSHEv?=
 =?utf-8?B?RDhKMG9uanNLZnpRTnFuNHB6RTVkMmhCQ1BUVWVEcFdWdWFzTkpSeERxQzJI?=
 =?utf-8?B?aXZUM3VrV2pPNFc3RERSd0duaXhvcUF3VXpLV2xod1hhclVWZ1RraWIxaGQ0?=
 =?utf-8?B?OWNheGJGcDJMN0VCam5lbUhNQ09vNG5PbkJCNHdoTzZyNUgwd29kbng0NFJS?=
 =?utf-8?B?Qkt6QVRCUStaRzk3ZSttM3VWY3pSTm1mU2VHcm5zeWtibWgzOWlXcTJpS0lI?=
 =?utf-8?B?QVFiSGVUSmdVMTFjS0R1TktzNlhBdzYwbzRmUUp2YlpFQ0VCREs4K3lDUURl?=
 =?utf-8?B?T2pIaWJrekI2RnVDVnFsaUhsTXoyd1BvK3FJQU9qelZZcnR0c05UWG8xdUIz?=
 =?utf-8?B?UVZBZ0t3L1JaMUVBcTFOTHFkR01MNnZQU2Y2aG5VeldnUjEwVVY0VmRnbUMr?=
 =?utf-8?B?Ry9wbm90TDdieitJQVlmWXJ2OTZQUVZnUS9aTGQxOCtYUnp1Q2ZDZjZjbFA5?=
 =?utf-8?B?VGxBWWV0S1Zlc2k2V054MExUMC9tUFZRNGNDOVUrL2VTaWhZNllDUXhHckNG?=
 =?utf-8?B?NWNvQ2NyMXppSFRMQ21TY05aSnZzSHJXQlZwYnZjckxuWTFFNEJWMXM5N3pl?=
 =?utf-8?B?OVcyUmRFVlJTblZjRWZUUVpJWTU1T2UxMS8yQTJ1bkVNRW1rMm4zYnI2bUxv?=
 =?utf-8?B?SlphQnJPQVJFMEQ4TzFSaGZtSStTTjNDUFNZamFiZitMcTJWcEJpSG5KUFVu?=
 =?utf-8?B?ODhnVXZac1BiQVJZZVN6R240c1M0T0NQWjZaMFJxbEV6MjlEL3lzUkViSXNt?=
 =?utf-8?B?eVNmRDBWbVZUMUdLTEU0cW43QU1WNDJrOTN4cFVxT2V6MTIxQ056eGQ0M1Bt?=
 =?utf-8?B?NEcxS3lKUkUyNWxQM1B6SjRMNHlCbi9LQlpBcndibG8vL0EyN1lWN0F4TW85?=
 =?utf-8?B?TEdBdU4raG4xY3g0eGVJelg0aVFCcVZuQzlTK01OSjVlWnRMbHBHd2JEQkVR?=
 =?utf-8?B?K0tqdk1icGU1Znkxa3hJaHlLOXNvc0ZoenozSmdNTEh4Um1CQmVYSEppeERT?=
 =?utf-8?B?NDc5K3NwOFNtT1MzSHkrbXRsa20wTmNmeHRSNFMvT0dPeVFOcHdzV3kzejM0?=
 =?utf-8?B?bjY4YkNWdlB0UUZEUmI1eUlHZFhxaGtnVU96bGxRWDM2Zko3K3BIUkZNQ21L?=
 =?utf-8?B?MmhBQWNFMmk3SW5kcHdrSWNTRzV6bWpqb2JFUzNDclVKMkkvVERRcUs1V0p5?=
 =?utf-8?B?RTNkbGxoNm5ORklxRTRHbVdWWkVLa2d5SjVZZzlaQmdaSHBydDlkdUlHRTBY?=
 =?utf-8?B?TnVYTWR3bzFSb2huNmVZZE5oMUhqQzY1V3dWQnNPajhXSFZxWDg1dzR2SkJo?=
 =?utf-8?B?UTRjb3ZGUDV0dlBsMmoxdmxPNTdYc1MxZllsZ2dqRmNqZmV2Qjg4QXg0ODVs?=
 =?utf-8?B?U0x5dUxLNDcwMDZWZ291UUtKYUthSTVqQW1OdWVnM3FQTXNiMFpkSFVQK0dz?=
 =?utf-8?B?cnRvSG1JdzlzSHRrRHBCTGJpRVVPUkNWb0pCMzYzeFBkRHZwb3FXbXdKQzQ3?=
 =?utf-8?B?WHV2d3RqaTd2azljRkVjOEl0NlJMeitkVitYODRFRWJvclJCdXVwcGRFZTBz?=
 =?utf-8?B?enpTaUlZQ2kyd21oRXhkV2tmYk13RDZwd2hHdU9NVG85WGcxQUtXSkY1Nllu?=
 =?utf-8?B?R04yb01hK2RjUHhQZmNMUklXVjY2Y1ZGSUwxNVNVMS9OYW9Oelk0NmtPbUMy?=
 =?utf-8?B?TlZ2WXNwZWN4TWNaMXlYdkJIRjVJZ3VoYnA1NENRODNFc2NtMExIOUFpZ1ZY?=
 =?utf-8?B?NFFEaC9KanVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1BnT1lxZUhvVm8zYWpRSzRWSllidXl4MUpUOFNNSlFuQ1ROaU1XVTZOL0dN?=
 =?utf-8?B?OVVBcUVIbk1iUDNwWkFSN2s0T05yNlY4ZTRVK2N0WEdNbEd0SlNvanNZb2FU?=
 =?utf-8?B?OXI5WVV1aU9ISTgvM29yVXMwdGh2QUI0NnJHNmJBUVdoeEVTSEp4Q1RzNGRz?=
 =?utf-8?B?ODU1RjZWMFdpLzJaNDlwbTE5RE1rSTlBQzE0SnFEOHg5elVyR0dsMGVWc2dC?=
 =?utf-8?B?S0NteGl6dFBNdTRvZDZyaVNSOFVDT1BmQUQ5ZGRaOXY1alRIMm1Qc1RIYjcz?=
 =?utf-8?B?M2tSY1hQT2JvOHA1ZkE2TzZCUzk1elhHcktVaDNaaUwweGJ5MjREMEY2WDkr?=
 =?utf-8?B?MWVNSW1CN2U1TzRzaEE3amFoWU14RVNQTmx6MmJCaVYzUm10dEErOEFiSGN2?=
 =?utf-8?B?VUhtVTc4YVBSSmRSblRNMVJ6QWxmQWgwaWk2cHEvaWJtVUl5ZTM2VGRzVWNa?=
 =?utf-8?B?bjZ1SXZ3dDExSi91QmE2c1ZXSGJrcFJaT1ZyeXBZTk1PcEp4dkJySnhzdWwy?=
 =?utf-8?B?VXBVekVJZ1VNeFBnV3luQkhnNjBRSEFhdC9xOHZMMEpYbVNtaXpwc2RiMHEx?=
 =?utf-8?B?YUIzYUtvRzNvS1FKZHlPL3N6c3VHOUJYRGtkVmY2SEtCZEluN01xdzdOM0RF?=
 =?utf-8?B?MFRvSTZGNG0wM3VFcDRBNE43M2xuRExGSXRBNTErOVpCdVdrNm1yT3Blbkk1?=
 =?utf-8?B?Tk1XSDNBMXA1cVpZMXM1VUZ3VHZFai9jMlh3UGJQbFU3WTdBR09QbWZOU0pW?=
 =?utf-8?B?RXRmeFhMV3kxWjlsVzVRc1dLbGZuc2EweFNxOXAxN0ZxVm1CcFJRemd5NFJW?=
 =?utf-8?B?ekFwUHpoWmpsS3ptVlByMStZRnR1Y1RXakd4WTk2TXRnem85QStmS0llL25U?=
 =?utf-8?B?TFM2SUNDZUloNWV3TWdrSDFiN3d1Z0lsOGltcHdOVHZNK0VTc0Z4QkJlcHZy?=
 =?utf-8?B?WDhKOWJEZkFmR0hSL2NDVDFFUUdVK05KM3NpOFBMWmEwMVpoNVdjUFpvSVVy?=
 =?utf-8?B?d3UyK2VDUWltdU9jemtlY1gxcXVBc3h5cXlUZWdRbmlzT1Mzd1ZsZWVUTENH?=
 =?utf-8?B?WU4yc3dZUkViM3FGY2lscEJyZUdNSVVGRFV1WjVSSGk0VmYyUkFURVRmN0RQ?=
 =?utf-8?B?V2YweUJRaXNIQXIvV1JXaHN0T1Fvbkl2MW1DeWk3M3R6VUk1Y0ZFVGxDQkhx?=
 =?utf-8?B?bktMK0h6Tmsrc1hXYlhiVGxLZzJTWXh1WXNPUExMN0VWdWxWRE1CcS9vNHgz?=
 =?utf-8?B?K3dvM1F0TkV3QlpGTzdPc09SNCtNY2lkeldtOHNjdlhJUGtyb3JwYThQNS9m?=
 =?utf-8?B?QVZLdnVkVjlKL0ZLZSt0UjJLbDdZb1dRd2k1a2h6L0ozNjQ5dXoramVlYTRD?=
 =?utf-8?B?WnE5NytJRWljVk95eXQ3V1lma2tOQ2xBSVlYdmh1T1Bsb3FlYkZYUU5tZzRL?=
 =?utf-8?B?aG1vUXF2YUpGMGpjeUxmV2tMSjJwR0VvVXd6citDcjJ4RW9RT1J2MWpQZXd6?=
 =?utf-8?B?Qi9CUDVxamxYRGQrU3ZidnhDa0VVdnYzU3VXMHZnRlU5azJLTTZ3ajlUbnE4?=
 =?utf-8?B?bmFrd3VSVVdPTDlPcTR3N2tqelYwNHlCbTd0Ni9BT0xNNXRCQTBlOURDN1Vt?=
 =?utf-8?B?V2tsQnhDcEJIQ1k0OVBmdlhjU1N2TytiUTVjNmZQNHNKdVJzdUxyUzN2TmVV?=
 =?utf-8?B?N2ZJaDUzQ1JVdG1rQWNmNjFkV1NSbUZ3ejJ4NXZTb1dBSVNkWTdIT0E5aWlJ?=
 =?utf-8?B?QndxWjk4OFA0Syt6STNDdTJrTlZnSVZjbkdQRmhHUVdtOVJVU25NcDhHRGxB?=
 =?utf-8?B?RW5qZmlmYjVVQU5oN1RDT2Foak5raFlEY3B3WlJ4WEl0SlJ5MlBOMVRPMU1x?=
 =?utf-8?B?dmlVbTBFRGRlRm1sKzNieUhzeCtvcTA0Nnp6WUhSbE5YYkVxV05PSTNHbXFi?=
 =?utf-8?B?S1gxZk1JWkhtSyt3alRvaHJkTGlvbXQycThEQzh0ZHhHWWk1UEVBU1Y3dzNl?=
 =?utf-8?B?RnBZYWJnd1AwZkV5ZVpHS2ZySlE0bUxQNUtuY1F5MnRka0R4QmVER1p2eW9W?=
 =?utf-8?B?YUxRZ3FXMGVnN2x3TCsvL1FPOWV0dkFtWG1Jd0E2T3JDd0xjbEczUjZmeXJa?=
 =?utf-8?Q?LSeI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396b6e42-ca5f-4957-77f5-08ddb0458d2f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 21:58:12.6707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2rUe1wrKzv8ZAAtntcCt98fUBkBYJJbxNN0BRTEKJuyoMEPNvqSUJaHyRRKUW9FN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104

Hi Reinette,

On 6/17/2025 11:03 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/11/25 2:23 PM, Babu Moger wrote:
>> The functions parse_cbm() and parse_bw() require mode and CLOSID to
>> validate the Capacity Bit Mask (CBM). It is passed through struct
>> rdtgroup in rdt_parse_data. Instead of passing them through struct
>> rdtgroup, pass mode and closid directly.
> 
> Above looks like a combination of context and solution description.
> Expectation is for context, problem, and solution to be in this order
> and in separate paragraphs.
> 

Will rephrase it.

>>
>> This change enables parse_cbm() to be used for verifying CBM in io_alloc
>> feature.
> 
> Is this the problem? It is not clear from changelog what problem is
> being solved.
> 
> Also, please drop "This change" that is semantically the same as "This patch".
> 

Sure. Will change it.

Thanks
Babu
