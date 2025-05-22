Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0172BF3D9;
	Thu, 22 May 2025 19:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747941332; cv=fail; b=MhwlL5SHZzTX1uMpS7AQawf4VCHivuz9ARpbligv043trqICJrkEx3+N5g8Rtq8CflCUuVrp+fRTJYuHjINvk+Q3bwfX0bBtXd5UjAgeR5RBMO2EVrEAb8Gf4u3nwtYAGxyZs4ykijzjfrT4wpZ3NuxxHt+h8Iid16IJaNx3UD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747941332; c=relaxed/simple;
	bh=z7fU64tt3KEe0GzaYGdJv8d+42/905sf3LwAzLHcmeo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n7jMUAKX6Ko6/W+/EhCP+eSzkZ5gWwlh8p9T5S9p9hCPndyeFa0QNGXE1N+ADXFgHp0ssUSTYkFsEajgeCcD5cUjybqZdimeGWNNSK3nvDiDDYGIQQFpZpKIyVFaof4UCgSUhUBRQ6UiTwPWUyUSUiqWfVtPZiE2axs4nH62WkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tRTZioVl; arc=fail smtp.client-ip=40.107.94.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tRTZioVl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mU5mt66ff08B6IQQcGff8ErC9F5UPEfBjEJJesjtLxr3F2sNOzIU6qd4mh0fW2inMTjLEw+g5FjdMh2rc4PeK3WIbI1pRkKgo1s6x+pDBhlU6fh2AFGPtsSb2wuaaEyATT2g55mJL+7WC/zk2P0TY4dVNtsedDM5cXVRAE0KIOhnLU3lqzHpT8Hhqxp+pFgHaaW5Rnom/aclWF0Vvmts/hw1mRW2Ef5PTQXsjJSoBuga2aAZx1gGp+cXXKCUzxKN7z78sppzE0FkV/SH+HGnutDtl6jM4ntrCnzUnt6wXf+yOmmFkCw+uXqdyLPr7WRZHSbYwsZEvREZWPbCnOSk3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3HngllwzajTA4MXIuZETCLjW0REzSTVSPxQoW66jb7U=;
 b=X05+qUBR5+eLKXH6GWgNOYriSj4chDyCyJ1+pmEb2oKkGJD7TXp3ulNB1TA/aVFflOxh0p1FZ0Ntm7XjTnsIMzgULEnpFSYLMecYzqY80oineC75CC2VPqEJRBkW46mr9n9iS6Mnx1lnHn7kdGAru+lyIeo0iwo5oBl+E7ojmkKrFcpASdr5xmtK8OGIz72ygJ897vTe3q4yBe8FWi/3AXvDqhWl0VlRMf2mOHF1aE5ZIVlrpWRw7bgqScscsR1W+YCrVC/b2v1G57SkRZDuP496YxIbOSRlf3DOtG2P6beTtcKiNxFg2Rw5cpsRg9sDNLfYTELfZcZY6U8lJZS37Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HngllwzajTA4MXIuZETCLjW0REzSTVSPxQoW66jb7U=;
 b=tRTZioVlJbMdJBXa2/sAicWKsu4yRuSbL3c4HobtpP5JyaVQWnruHLIJbLRJHke4xFyKnbORSmv7Heg/xG51Xs86n8y1GY4yfVfBTHyVFtWSEZdf1eTqRbABJ2MGAl8RX3yVhqRE0sgIXb/YPCm7pD7VbWncj3zXu+QOzgd+OJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MW3PR12MB4443.namprd12.prod.outlook.com (2603:10b6:303:2d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 19:15:26 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 19:15:25 +0000
Message-ID: <6a3f6867-04cf-4691-a0f4-a722b603ec32@amd.com>
Date: Thu, 22 May 2025 14:15:18 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>,
 Peter Newman <peternewman@google.com>
Cc: "Moger, Babu" <bmoger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
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
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
 <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>
 <7628cec8-5914-4895-8289-027e7821777e@amd.com>
 <877642a9-cef0-4b80-9053-3ecace9326ed@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <877642a9-cef0-4b80-9053-3ecace9326ed@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0030.namprd05.prod.outlook.com
 (2603:10b6:803:40::43) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MW3PR12MB4443:EE_
X-MS-Office365-Filtering-Correlation-Id: 379f06b9-76cf-4a99-e2c2-08dd99650141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkRmTXd5bGk5aG1tODNmYklwd1pYL0J2VW9CTWJoNjR0QUlURVhZSzhJb3pT?=
 =?utf-8?B?T3VtT2N0OGRhbHZPTFU0T3EvOE83TjFncy9PUmRvZFhTMHZWejVMbGxxblJu?=
 =?utf-8?B?Sm0wSUsrYU1pSUlIVEVUME84VDhTY0VkZWVWb1h5QVI1a2NxVVZyazNyNHp0?=
 =?utf-8?B?bzR5YzZBY3BUZ1NCYWZacEhmMXVleUE1SHdrZGlIT2hJZHNIUXB1VEtQYysw?=
 =?utf-8?B?ajYvWmtJVkZuTUdUUkZ2U2IzQ0xueDdkSWdsTEw5RjhXZ2VsNDA2dEdnNFh2?=
 =?utf-8?B?cmYwTHBlK0Rad3R4cnVZYjNPUnpvWEVWckFId3FrdFdSZmZ5dDZnMEpQbmdL?=
 =?utf-8?B?UUR1YXExREpBZ3pIMCtpSXNyb2JiS2loRzBBN2hOckNFWlM4TUt4RXhIWmUw?=
 =?utf-8?B?VHMrSXFlQjBwTnl0bjhtSk82bHF3NTNobTlVTHFNaU90dSswMnYvVHppSHZE?=
 =?utf-8?B?T3NZekkrdlZaZHd4MXdjKzJpYlY5TjQyMmJyL2RwT1lVR29FUCtUMm9abHJy?=
 =?utf-8?B?SElNUHE5UzFXYkRaMzRHbmhkYkFJSGJBelg0Y0I0cjlTWTY2T2RyU3VVNkgw?=
 =?utf-8?B?aHg1Y2lMeVl2a21HQ0hDOVMxMHRWaTMxajZvYUpQQXBTR1FiaW1aQWI5RUNa?=
 =?utf-8?B?MFo3aURJK0kxWFVZbHd4WUNHYUwvR2lNenNaOGdIU3V6ZXJ1Q2I5dVFDNytF?=
 =?utf-8?B?c0xXNzkycnFUMFNlSzJKZk43dUluUmNXZVFvS0Jyb2Q0R000bUZPcUd4RXRL?=
 =?utf-8?B?ZjV6OXVJWmlES1g1MGdQeC9pcGhXQ2pFZld3OHJ1bDJEaTBhRjA5WnZuR0hR?=
 =?utf-8?B?cnd4TnkyK1JWTDBoL3ZpbUp2akthbytNRElLdWw0b2p1VFdTMEtLcEJyZWZV?=
 =?utf-8?B?aXlnNXhaUm9FMkNMWmk1TFVhQ0k3bkE3SHdiWTZ2OGlaRngyL1BrSGswREJE?=
 =?utf-8?B?eTN0QzFINkc5Ti9FUUhXaFZUdXd2VUorTVpBWmkyN1U3THQyaks3ckF2T2Fr?=
 =?utf-8?B?WVNRbVJ6OEZlc3lkY25EQVczZ2tEczh5OHMxTUxzRUUrSTBITEI2eTJLRCsz?=
 =?utf-8?B?Z3pBK3lsZm4xd0RubkVpY2xKNm1Hd05oeHRjQ3lHNmhHNXFkWHNZbVB5UlV5?=
 =?utf-8?B?U2NIWkl5djVUN2xRQkIvenEwMk5jQWRPTEtLemtRZlNmcmQzVWk1SE1HWmVE?=
 =?utf-8?B?L1gvaEMzV2lxcFVram9wVlh4amhUclFnRjRXVGEzREpyNWZ4V2lvQVNGSXN5?=
 =?utf-8?B?SWd2RGFUeUF4Tk4rczVCRm9wdkVWaTRxSVdGekVGTjBBbisza21QMTFabHF1?=
 =?utf-8?B?RXM4M0t2L2JZcDR6R0gvTHVMbXZ2WDZ3WmI2czlVMElDclJWSzZoOEdUNFhq?=
 =?utf-8?B?T0NvODRCZURUU0VSL1ZVdzNROExSbHFReFU0WVpQYy9UZ3p6T1dEbTVLMGpX?=
 =?utf-8?B?MmI3aFF0cUd6aWR3SEhuY0sxUWt2VnlzQUI0UFZyUHNxSGhzT0h4aEZYUHBq?=
 =?utf-8?B?SVo0amJubzhObGZsWmdENFgxdks4Qmk2WHgxenp4TENnTjdzbG83S00ySVdB?=
 =?utf-8?B?WEdWdERaRnFBQm90eEtSbExOV1dJWWxnQVNmbGRwUFBrVnhHSHdVdlJ5d2t6?=
 =?utf-8?B?WTNoUXZiQnhLaVYyL3ZPQm5jeWFBd1ZtRWVpbDN6bGdJQ0hKcHU2OXZDeEJ4?=
 =?utf-8?B?TFpLTUN4RDBSd2s3eGtMSjA2QlhKd25OVG1vd3BpR21RdE9nUVdHT3JyTzBR?=
 =?utf-8?B?ZGJqVWNYNHQzN3E1MVhMOE5tMGlWUzUwVXVqVGRnVHpza0VHZ2R3dGRNQXFs?=
 =?utf-8?B?V2N2NTV2TEU4YmhrTlRCaThlNWdlZ0VjL00vOEluTmVvZUg5OUI2MWR2bHNa?=
 =?utf-8?Q?LbHFqr30abab5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2c4MXg0Zk1VUVBEVVU0N0F3ZUNrS3hPd1FuTkI5cm9OYk15eWlhaDZXZlRU?=
 =?utf-8?B?MXpTVjlmdkozZUhTbjMya25wMURYSEdrQ0VOaWV5bk5JZVp3NFB1ZHBUUndk?=
 =?utf-8?B?anNqcWRRUWhYYkFwVTFkTkl0Zjd6TENqdnh4bjZJdko0cVNhd0NpOU5ZNFho?=
 =?utf-8?B?bllXMnRGT1hFUjFudlBmZGhHZkxoQXBiTEF5SnpDeTFFQVJtcEpvc05sbFZk?=
 =?utf-8?B?YTN0cTdJaXp6UzNNVWFzSlV0bHFGNm10d3d3TzdoWldwQ1Radmkrb2pINkN4?=
 =?utf-8?B?eGRTSlBBdWNnWmhLeU11NUtrcEluME1pRmZiaWJ0ZlNBY1lkU29BNmxMS0ZK?=
 =?utf-8?B?Q2xvQWhZejhQQ3d4VGhBRmp2MVdsWUh0TTBkelBHNHVpcnJNMFZ0QUJ2dU90?=
 =?utf-8?B?WFIzQzZHdXdHZUFsUFZjbzhGWHA0cDNnVDdMK1VPd1VVdFB4eG1lS3Z4UVpX?=
 =?utf-8?B?eFJza3Roc0FZbGxrWFIwck9CN0t2NkVDL0tZNEwyUEFON1dpQ2NVTEsvRlBN?=
 =?utf-8?B?M1hjQk5VSXNPWmhXa1h5dmVoV1FlTHdUaVBxT3FKRWE1WjFSdGlyVEpNSjRo?=
 =?utf-8?B?OHdhOHdjQWMvOHFaWVBTSGtVc0NxVXE2d3lIOHB6VVJRNXFOODM1S1UvMzZq?=
 =?utf-8?B?MTVsNzhwVVNON2VtdytkN3JOQVBBRG04S3l1S2xDaWlzeDBJZ2NDVm1renZI?=
 =?utf-8?B?UUxLS28va3VtU013NmhEQ3A1WDdWL0NxUEo2NlFlN2Mvb2NJRjMrUlJFQnlS?=
 =?utf-8?B?b1QzdDcwUEttZWk3QzJ0NGxzcCtSaVJxWFNzYUpERnZXYk5TYy9JaVp6Vzdq?=
 =?utf-8?B?TXZrRGUrSkJ3VXdKSzBZd3NBTG5JYllMY0VVTlBEUWtjcTNZcC9WMXY0R082?=
 =?utf-8?B?N2thekFKdFJ6aXB5ckdweEVqWHp6Tkl2ZC9mZUtscG50VjlNUXJibitZSGhs?=
 =?utf-8?B?MHVnUWkyL0ZMaW9lbnZhTGZUTE56YkM2UmU5N1J0MDdRL0hUVStueEIyeTIv?=
 =?utf-8?B?U1ZhdGFFOHlyT0p4WFVYS2pFdGo2SUNMRlY1Z2JUZWk4bkk5WVhLWTZUTmxL?=
 =?utf-8?B?RmJXL3NSWG5OVzJVVUJNTzhOK0M5WnZ0OThUb2cxNEh1S1BMRFZWNzQxQXRk?=
 =?utf-8?B?Tk5oUTlJZ0hrcHhkTDNlSjk1SlluQlNXODlvSjFQaGl2RWl5WnVqblU1d3RK?=
 =?utf-8?B?MzE4V0Y1bEUzcGU1am5Tb1dUaVRzZ1VHdm1yWnNqNzBBSS9VWXkxYytyNGxp?=
 =?utf-8?B?WWZKTjgvMGppQnd1TC90b0cvMm1idW40TjdodjVBT1NiZTFhcDNJSWlXQW95?=
 =?utf-8?B?OHUwNFN5WTh4Wno2MU9FSnArdEQyNFVWTTdKVU8xRkNDS0ZUQXhnaG5ySm9r?=
 =?utf-8?B?S3M2bzAyUkl5LzdGUHdGWUdVQ3VJRUwvblUwS042anhheUFJWGYvbC8rQzVW?=
 =?utf-8?B?TElacmZ0VXZNUTNJM3hlbk0raU9TbXRNUDRQanBCbHVkQ21SSWtqdDlBc1la?=
 =?utf-8?B?QlNVcnJXNUhOWlZBbG9FTndjeHJFQ0dxZGtUbDE4dGtWT1V3eGozblRFdGFC?=
 =?utf-8?B?VjVHT0tyTTZ3SW1TWUNmMlgxdEx1WGtULzgvcFJYU2UyMncwdkFtQlFmOGYz?=
 =?utf-8?B?N2NPQUdCZlVZRUdqbnkyN3hEWk42Z0loaVpidS9ramNEL3hUSzE5cThTZFNs?=
 =?utf-8?B?b1BDcmtpdFZQV2VaZHpGUVBQZ3Nqc0hjZUZ6cG1VSnI2M3hJYU9GS241ZHZy?=
 =?utf-8?B?NnVlSzNHSXdhMzNCcDFETng2MTI3akVzdXZETGEra2pqTTV0UU90MUcyODNP?=
 =?utf-8?B?eTMyajE3K0JmNEN2MU5SVi9raUFuUXhVWE54QWVpWGJ0WWwrOEZRdzd4eHIr?=
 =?utf-8?B?TmEzVEtTa3d1d0J1UWJZOVlYdFNsVW9xaU05UW80cXQ1Y2h2dUlUSTZpd0w3?=
 =?utf-8?B?bElzZXA0UWdGTm1SUjN3cUJGSzVMQTRjWklTTm5nejRvU1BSQU5FelVYdVdw?=
 =?utf-8?B?LzljK1V4eENaNThCWHdCeHVaSHpDZzh6bmw3bFFrUEQwSS92b0J2Z3dHTEFF?=
 =?utf-8?B?M1lSMThTenprcjVzU2N3cjRsTFNUT2JJMGE4dCtEenpKWHljcVloK3Q2VENE?=
 =?utf-8?Q?lf/A=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379f06b9-76cf-4a99-e2c2-08dd99650141
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:15:25.0189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkT23EhMUVLJo+7M7IrjM5iALPfIjEl0E0HlbozemvlfluYRjdSSRMP4dhzISFfP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4443

Hi Reinette,

On 5/22/25 11:33, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/22/25 8:44 AM, Moger, Babu wrote:
>> On 5/21/25 18:03, Reinette Chatre wrote:
> 
> ...
> 
>>> This is why I proposed in [3] that the name of the mode reflects how user can interact
>>> with the system. Instead of one "mbm_cntr_assign" mode there can be "mbm_cntr_event_assign"
>>> that is used for ABMC and "mbm_cntr_group_assign" that is used for soft-ABMC. The mode should
>>> make it clear what the system is capable of wrt counter assignments.
>>
>> Yes, that makes sense. Perhaps we can also simplify it further:
>>
>> # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode:
>> [mbm_cntr_evt_assign] <- for ABMC
>>  mbm_cntr_grp_assign  <- for soft-ABMC
> 
> Looks good to me. Thank you.
> 
>>> Considering this the interface should be clear:
>>> num_mbm_cntrs: reflects the number of counters in each domain that can be assigned. In
>>> "mbm_cntr_event_assign" this will be the number of counters that can be assigned to 
>>> each event within a monitoring group, in "mbm_cntr_group_assign" this will be the number
>>> of counters that can be assigned to entire monitoring groups impacting all MBM events.
>>>
>>> mbm_L3_assignments: manages the counter assignment in each group. When user knows the mode
>>> is "mbm_cntr_event_assign"/"mbm_cntr_group_assign" then it should be clear to user space how the
>>> interface behaves wrt assignment, no surprises of multiple events impacted when
>>> assigning/unassigning single event.
>>>
>>> For soft-ABMC I thus find it most intuitive for num_mbm_cntrs to be the exact number
>>> of "active" RMIDs that the system can support *and* changing the name of the modes
>>> to help user interpret num_mbm_cntrs.
>>
>> Sure. The option A: fits well here then.
>>
>>  Option A (counters are RMIDs):
>>  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>>  0=31;1=31
> 
> Thank you for considering.
> 
> Please add the requirements from this discussion to your running list. Also please keep in mind
> how soft-ABMC intends to use the interfaces created by this work so that the documentation that
> accompanies the ABMC support in this series leaves enough "wiggle room" for soft-ABMC to be built on top.

Sure. Thanks

> 
>>>> [1] https://lore.kernel.org/lkml/CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com/
>>>
>>> Reinette
>>>
>>> [2] https://lore.kernel.org/lkml/b9e48e8f-3035-4a7e-a983-ce829bd9215a@intel.com/
>>> [3] https://lore.kernel.org/lkml/b3babdac-da08-4dfd-9544-47db31d574f5@intel.com/
>>>
>>
> 
> Reinette
> 

-- 
Thanks
Babu Moger
