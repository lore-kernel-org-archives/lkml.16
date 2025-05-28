Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD7D213E78;
	Wed, 28 May 2025 19:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748459152; cv=fail; b=QNiNBlhdrCqDXNGiAoE2hoxR09tSSseXDdQvhxIsdDl3Z3Rx+6N+mQAXImnDjaeaKr0TitYfvt9C9cxjEpacd12Po42sS+lixkCVWMES+ZOgcxbbrp6/CNTm+DohDe01NOtAv/k4C6pCO2YxhJ10Rohn03qp65lDJGRL58YER1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748459152; c=relaxed/simple;
	bh=HjRv0aTvG3kdhNW2Bk+jQtAPmVfCCz/2fX17TjaG49A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mHK/MGuoIpWWVacFVxhg7EW1YDHxSygVyS6f6FNwvcna7C/WgjY0bLHnKywUC8shoFPBiMV85V5oR6HOkc39MqGZ/FGrBZ+8jwQAwpOXR+GfZ51uTVCJMT0wOPpjUVoPVe+SrN2ZNCJA/zaXqX3B+dwa10DAScBgsD4o9LHBlSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=i1ktQ/wn; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="i1ktQ/wn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abAJnXda9SOJ+le/exRIAPxxWa77OjScLAdzKxtAmd0C3DQ4clWMQusParCCR0Wp18h6Uqjtg2Enh2gN8cuOAnyNRjFVUUJr3hJuwKvtMDIG8MjokCsbW9AxqyUxkRrxDmNztoKWVgfoXaxa6pXP5UWOjnzatcW82++lK+7TK4Ne7CWxa8M247kFcbFXSAdDBNQ3igSjGjIAK868E996rtM0inhcdA66kS+NSrUOluNa4PVWRMuSvLGnYB4Voj//Vxz7TGnEvpzMqn/zyYFfLtOiHJ4d9cAHzT8MPkjnlzm1vah74ojgtomahscG3yUm6KxksiiAe2jNTTTy8ER2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUU8Y1hJDlir3ZhBqXUm81peocm6cD2Pqm6qCLKkOsw=;
 b=mCIkkCrbX+D3ZHvz/dzwkBLcGnkM425p26warihTY/fhEghTMvZ7nIncD+PWryqlYbTWd9TV2+7orCV6crXn/svQo0WoDi3Zdx7z4V6HHZuDT5YkUJQil1CGaKnE66TjAiL9MtyqigvWQFrpQ9os+RJXeBZVgyCEY2Gtk4bVEMSJ38b9a5xTAXtkFi4S55S8C1kCyRfc3haEqvh8gUJ6d7RgMlZ6xx/MNKC4IiAJTSvQcHCGcvgYjtetkyLwK8LYJC/zYNf0enNZdiskoToHLjzMEZXU6IxgdqLqv4grGVvjX+MPc3KHZkybs8NkK1QiffCWCHgslCUX/nSqQ7gAiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUU8Y1hJDlir3ZhBqXUm81peocm6cD2Pqm6qCLKkOsw=;
 b=i1ktQ/wnbYybiHvpHQB2HcGXfuJ2rcICxOfYa+CttNDGPQL6iG6fQnRCSUn2mB9tlt55JWPvqAzIt7WQeMPRA3j1CiV7MuOeC31vLkh00LA8mGyndCd5Gdo3s9y7mO/HzIoZThT1qANvKmS/PV1UYhG63olLJmIiNwIEQTDuutA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA1PR12MB5659.namprd12.prod.outlook.com (2603:10b6:806:236::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 19:05:46 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 19:05:46 +0000
Message-ID: <40c649c1-9dc0-4996-a5b9-8c01a460f1a9@amd.com>
Date: Wed, 28 May 2025 14:05:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 08/27] x86/resctrl: Introduce mbm_cntr_cfg to track
 assignable counters at domain
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
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
 <79efa13654a6f1a308622bd13e0d2bc21ffb4367.1747349530.git.babu.moger@amd.com>
 <5636898e-78dc-4eb1-b226-ced62372e09a@intel.com>
 <40ff2cd0-c8b9-460b-b98a-087cb251324e@amd.com>
 <14ca1527-ee25-448d-949b-ed8df546c916@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <14ca1527-ee25-448d-949b-ed8df546c916@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:8:56::28) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA1PR12MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d38464-6e95-4672-7d8e-08dd9e1aa6be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bis1aHcrdlFpajJwLytqYks5cEVnQTNkazVsUWlXTnVUZWMweE1WSU5hMmxC?=
 =?utf-8?B?b3d5b090bjBwaUNWQkpHcDh4a1pDV3pSa1BaVGN1RXRkMG9nUkpya0ZpTy9Y?=
 =?utf-8?B?YUFsTUJoZTBTSWJDS2lxUjdBcWdSSzFVRkZwc3daTTlOR0NNTUNrRW81RTdI?=
 =?utf-8?B?QXJwdXpNK1FmYUZMQVVQMURMZEwvYmMrd3ZRTTlSSkxBeXRpOFpUL2ZGZzlY?=
 =?utf-8?B?TFppTVZHNjlKN24rRURPeXhBd1Yxalk5S1Uwa3VSYXBYM2kwc2l6ZTFoaHVL?=
 =?utf-8?B?SFliSnVOeVJUK1dMendGYTJJTElGNE9jbzBTckhMU0xlU2ZzYWJ1eVNlcXgv?=
 =?utf-8?B?OWpVUFJPSlhDdmpXK3Z4eGRwZHpTTDlqcXlCNUpDeFJBMWVvMGRLMFg5dTRT?=
 =?utf-8?B?VEVTSFpkK0VxVlBZUWYrTmp0S0tWM1lsRlVJSUZrZngrSUJsWDh2dGVubHE5?=
 =?utf-8?B?S2dXZitLdlVsVDcwdTlJb01zcDhoektsaXk2WUdIRlJtbDEySitFOG9XUTdt?=
 =?utf-8?B?eFFaMEtDZjU2TjFNaXE1RzEzdXdKZ0I0enY4Uk9jdktCM3JZVFBjenVsdGVy?=
 =?utf-8?B?OE9ENEQ0V3dXVHp5Q0FPMi9QanBVakZLS0xJeTZLM2x1cldVMUgxV2dVaTN5?=
 =?utf-8?B?OEd2M1BkZjMrdEIzRjRndXNEbGc2azM2MWxBSG9JNDBNTjBmcUhVSXh2RVJM?=
 =?utf-8?B?VnhYNTNlZEVXNWJ1eEtuTXV1a2gyZEtmZE1BN01YVm13QjMzdll4RDd0MjVQ?=
 =?utf-8?B?dzVSZDFyTDdxMVZkQkYwbnlTdGFMN2VKV2F6T1ZVSkEyRDhGUWlXVjJBTzNw?=
 =?utf-8?B?dHhZMjdVV2dQYVZVZDdMZTdrVE5xc3pLeEYvVy9Ob0lCK0ZOMGEyYW82cGhH?=
 =?utf-8?B?VXFwVDlXbXhpR21GNG12VlI2VlBlbW1Oa2NYOVgzVGRSY2trSkR3SVArVXps?=
 =?utf-8?B?cmNTS21zT2MxQTRUcFUyeXZnak1LMDNPUngzZVZlWE5wV1p0cjZuZHAvaXFC?=
 =?utf-8?B?bW5yMEZYT3dXdmh5VEo3dWxQUmdaTUpWYUdhWmZETm1OMlMvUUpqVTQvSW5N?=
 =?utf-8?B?aGo3VUdCbGpPdmd0YWN2SG9zaCtNRmZRT3NVd3NFVkxnUUNxN25ocFpUQ0E2?=
 =?utf-8?B?VGpEaGYrSE91blF3WUttTG52ekRoZHIwdjh6Z213RzZZMlpUS3RMWXJBSHVr?=
 =?utf-8?B?MmhNVkpucEZXY3hIZytEQ3JBdjBsajlwTVN3eG1seDVIUzUvWHdJdlBYWEZN?=
 =?utf-8?B?VFJzakVFZGhIa1JWU0FmbzZ2ZFA1WmVXWUhLZFV0MVhrdDUzUDdRdDNETzVh?=
 =?utf-8?B?RDVicVdwS2hOcEx3S01OZFUxRzJHU2hBRUh6TlpFQmpCRlJEVGlVamZLQ1hX?=
 =?utf-8?B?ZUI5dVNxenh3UVFGRlJrV1BuSStMU1Z6dUdSTThYOFAyc0RyOVgwTjM5akc5?=
 =?utf-8?B?K3kyUXFrT3NpT0dxOUtRaEhIOFVxTlJzVDZsQWZmMDhYamRhQThmbEh2UnVJ?=
 =?utf-8?B?SHZDbXhOSHFEcVlLeGdqNTBtMW1lTzFIRC9kWk5FQk9uMFZ0TnFkQWxndll0?=
 =?utf-8?B?SEpsZ29aYXZMU29vZmVzYWZhd3FhZXd5YVN4anhPbXBXWVNldFJqS1NLVzN3?=
 =?utf-8?B?cFhRdE5SS0E0Q243VnBnaWt4aGtjNks0NVBXMGd0RkdwNlhrcm1RQ3JGMWVS?=
 =?utf-8?B?YjdRc0IzVzNoTjVwM0Ywa1BkOGpGQlJOTFBna0FPOEJMdHdEdVdXYVVRQThl?=
 =?utf-8?B?Q2lzZTVvUkF6eFpOVW9MWnltb01qT3BTZTJMUy9wUmRDYjZaYnZyRmRoTWdK?=
 =?utf-8?B?NUFVV0JUTlN5WkhOZW5jT0x4d29wS1BibnNOaHl2Nmk5RURwd3RIdm9ueG0y?=
 =?utf-8?B?Umtva3Zkc3Z6V2tNQmJBNGtQUkk1blNocTBrUEtUcEc1eGhSN3ZZRzhja2tN?=
 =?utf-8?Q?pXGsdGFthYQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGN3ajJPMGVLa25RU0FnSzErK244SWd4Q3MvQU1vUXJYdjZXUTNQK3FKT1Mr?=
 =?utf-8?B?Q25BaXlpUzVqeVZSazFBbUt0eGtUR3pTVURGOVB3SHBwL3J0aUVFblpiTVc5?=
 =?utf-8?B?UHpDTmFHSThhRlM3L2pQN0I4a3VxTkVJWG9EUTRkeTJBaGhQSG1RNW1KTm85?=
 =?utf-8?B?b0gyQTFYTDFMV3B1MkRDNXBKMkF1a3Rqb3NXSkN2Wm1EL2YyUHB1RFBJWXBV?=
 =?utf-8?B?S0U2VmpjQWpwa3F4aFpKMkt2eFNOWndNNncwdzdCL3VzekhBQkozcDVndkpV?=
 =?utf-8?B?RCtyQkRRYng1OFR4RkxJbHpLd3ZqMm1YalJyaXlMRVB1Ukd3WVRwSFNJMDli?=
 =?utf-8?B?bEdTWUxWZW1RVzhZWTUra1lQVzRlaElKL1ZBTHRqNlBTcUN4WW5FSUJYNnFk?=
 =?utf-8?B?ZXBNUnRDeVZWbXl5eC80ZDdrMllUT1ZIMElkUW1YSlVTS0ZqS3RMdXZIQVBZ?=
 =?utf-8?B?V1g1Wm1CVVROcVZObEdiYjJmSmNnRElyZm9vcU5jUjNySnFybTdWMTBUU0lt?=
 =?utf-8?B?b0pRbWh1VFAvZHRTVmxPeW1CU3Y3L3JHWFJ2cWI4Nzk4aE5PTlBQUFlhYllt?=
 =?utf-8?B?akVhZmV6RTN3WFpDYnMwR1FuUzBlRk1ZV0djQ3pRV2FCZ3hRbDdvOWs0aUdH?=
 =?utf-8?B?ajUyRWVXaWIzRVB2UXVsODV3NWUrK1duOGpjZUNDVHNHdG1BUjlXc0RMNnVX?=
 =?utf-8?B?VFlxTnY2V2JRZno1d3dTcXQvRGFHMXAzSHZaM2ttWUk2NWFzLzRnOWl1NEZU?=
 =?utf-8?B?YXdzeXI1L01GTWhDaTBTejJ0MEY5c2NmcnRDVEdFUHdvb2RsblllczlFTFkr?=
 =?utf-8?B?c2Z2OGNOelJ1eGZlWGFRZGI0dWo1L1hRaXRLUkNCK2toY01DbnRza1k4dmVm?=
 =?utf-8?B?VldrTzNiVU1GZTg0c29NWVFmYjhBbFl5ZDFoeDBiNmNEeEpUQ1BNSm5BMUl2?=
 =?utf-8?B?T2VSaWFkU1JhYkFyNGxKbDdwN2RkSXZFKy8zRWhWSW1UWXVMaitGOVVycjVj?=
 =?utf-8?B?Qk1KVnpVK2hsQnN6Zy96YXpiUVlMdDVrbXJnLzBCTG4yeHNkMm5OVW8yYUFs?=
 =?utf-8?B?c2hXZXNWUUxoZkFJV2VMTW80bVZCbWhIWThhN3ViZTM4cFF5UWRWdG8rSWYx?=
 =?utf-8?B?WEdKc1lQQ1AzOHVsdWl2VDRpZDgrdHQxdnkyMkJBY2NZMkh4elRjNDNsU3pM?=
 =?utf-8?B?UGRnbFZRWjJCclNhV0Mxd3hINSs1NXRNSEtvTG55bjJKZHlIVEtXL2w4N3BW?=
 =?utf-8?B?Ry9LR25RejE4M1hIRXBGazJrZzBQWmNYRmwzdGdySk9Jc3UxRGgrSzk1dTQ1?=
 =?utf-8?B?MjZEL3MxejdKRGdGOUp4MzY2U05EdEJuVFJ3RFZoSlB1Nm9yMFZFcGJ4Ymc4?=
 =?utf-8?B?clNXbU9hNzBCTWFsNk53Z01mR01KcVFJUVY2VHNlRVRyTGJURVVXQXBxNmV6?=
 =?utf-8?B?dlQ3NjJ2bk5BbFVnNTg2WTFNVmRDYjhIaE16dFI1MWtsa3dUbzhTVTYxUURv?=
 =?utf-8?B?N3ZMeVYvS3dycS9zYlZMTEgwRjM0R1AvNlo2dUZhcDBGQVlUWmNzZGNENzUv?=
 =?utf-8?B?RUNISkVNcXlFOHRnVFFPRndmVzZaRGt3b3c0Tzg0RlpLNzRuNG43OU9tUDBW?=
 =?utf-8?B?RHhucUt6RkZsL3czaUlDVXlNazd4eGlIV2I2SXVaWTdtM3Uybk9oVUZFQ3NX?=
 =?utf-8?B?RndvQzZLaGZQSU9QMk1oa2hoTkhJNkJCSk1tWnZyK3Qva2lSZU1iaWRrbmNj?=
 =?utf-8?B?VHdLclEvdmRiVXJlNkZ2N0xncVFQOTd0ZTZjd0NyWERZS3c1WjlSdU90OWM1?=
 =?utf-8?B?aVpTb0h0UG8vQURDMkU0SGhyNnQwWFIxbzVsalhONndSaHYxcWJTcG5XTkRD?=
 =?utf-8?B?b0EwaHhwZC9aN1dRWDRWWjZWQThPMVVscWhtcGNGek56eWE1QWFpOCsvRDM4?=
 =?utf-8?B?T2VHQm1qcjRkcVpHQ2gzcmtWUWJqT3N0bnNzV0FiL0ZIV3d3ME5aMzhIdG5p?=
 =?utf-8?B?bzk3SXUrbW8vdW1hUnZMWDFvNll3WllBN3U3ZUV3OUk4Mk94ZG1OOENadlUw?=
 =?utf-8?B?MGFGWDhjK1ZvK3IvTHpCSzNWNW0xVUljTXlpdGJlUUU5Tm84dDdIaklST1d6?=
 =?utf-8?Q?z2C1rikYmY9ayM2e0+KLumEUQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d38464-6e95-4672-7d8e-08dd9e1aa6be
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 19:05:46.1975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5MJX3V0TgVlTjuCySuoT5SY+boZ41YKg1MXW1Ki1RTWwTGDOebAjuuzVo9c0y5U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5659

Hi Reinette,

On 5/28/2025 12:34 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/28/25 9:56 AM, Moger, Babu wrote:
>> On 5/22/2025 4:02 PM, Reinette Chatre wrote:
>>> On 5/15/25 3:51 PM, Babu Moger wrote:
> 
>>>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>>>> index bdb264875ef6..d77981d1fcb9 100644
>>>> --- a/include/linux/resctrl.h
>>>> +++ b/include/linux/resctrl.h
>>>> @@ -156,6 +156,20 @@ struct rdt_ctrl_domain {
>>>>        u32                *mbps_val;
>>>>    };
>>>>    +/**
>>>> + * struct mbm_cntr_cfg - Assignable counter configuration
>>>> + * @evtid:        MBM event to which the counter is assigned. Only valid
>>>> + *            if @rdtgroup is not NULL.
>>>> + * @evt_cfg:        Event configuration value.
>>>
>>> @evt_cfg is not introduced in changelog nor defined here. Please add a snippet here
>>> on what @evt_cfg's values represent. This is important since this is exposed
>>> as resctrl fs API to architectures so all architectures need to use same values when
>>> interacting with resctrl.
>>
>> Sure.
>>
>> @evt_cfg: A value that represents memory transactions (e.g., reads, writes, etc.).
> 
> This still does not explain how an @evt_cfg value should be interpreted. For example, it
> could be something like below (please feel free to improve).
> 
> @evt_cfg: Event configuration created using the READS_TO_LOCAL_MEM, READS_TO_REMOTE_MEM, etc. bits
> 	  that represent the memory transactions being counted.
> 

Looks good.
Thanks
Babu
