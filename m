Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DD31B424F;
	Wed, 16 Apr 2025 17:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744824482; cv=fail; b=HcMCNGY/gdFeVQVA9OS1M52Kz4y5+MxUuyZNr3D8a27eF9Ck1Z+mDv+i55141ZBWfSHAZL2JSLLPK2uzOeKJHPcAWfncZ5JI9aX/hKe0rCmcYxWfIUbN8cpBTzitv6ILJx0D5AMDks7J8+jVvCqMUpNoV3mBEoLTSbZX9t9ceY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744824482; c=relaxed/simple;
	bh=S7ipAMeyvhcmjzzFrGCC02ovbmpSf2kiq3MLZSM+Dfs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hg4pmQNFidj96x6vHTke+FSZgkbH0UikOjxAE68wcieiH3lGpkKLU37AOQ5OUiLPAdpRSfF0TfFkEREssPD8KpF/FzXcQUiCSQLVY/EdsO3SCsNkv9wz/QRR5PuPNxqLwgdOrEBpFVeGnHUdTc+SShcLTNij7eBCp5xP+KLiN64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kMJNaNRp; arc=fail smtp.client-ip=40.107.93.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kMJNaNRp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzlxoOJxkr9f/PJhEbMrr9GvXqG/5Ij+MQpqmQ0KkRjX732EthIk1K1w8vgLrHAFD4OG6yk77LmDorc5piqpgbxK7ppe8bsdPCpEtPkhwYQ3HAZdQ5cqpssoEvxRrq/PIxnzbGz2fhi6pcLDh7BqKYXlBiZFmgmGQAHptQA/H4tp7kHJxvWe89ZQaNMq8wa+ywzBXHr3lzeNTOf14u+cSpV2qmpxw7b08ZRYjhDfhcxDLTXAYJEonLqEwOyy17KZAbHqxahSmL6JWubt9Mknm/gx1G/5tumbHSWDc6au+9tOtq1FZumXfoszJuusYF5yFHIyDT1hMq5T9eWe2o7D9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKXdYJnrWGmXXyc12EjMGj2Zi+sdzT0+W3Qxla5pScU=;
 b=SduPDwZYghrRfiQlKhWLFygBUJJ23rYthUyolf5LjYnge2AQEwCOycQ09fwodE6jg7/fRpG9Ov6Ykx9rflr4EdGoxSWs3NsSgkPv+OZCXT1Gwy90qe0tTRwc+UErXH77rIPlak5etYO5zqG71p1BHx5uyzW9dDFwKLftV6ORTPrT4Uwl3/XA/J16HFttCP4i9itCFLkoSgX+YtpH0Z6/OsWqfVmNNUQN3obcPgoiSGxuvx3DERBOGk0XYIs9vEjYGpj/uNq/8bV71L7ELye1nOOSk0hNLxDrmXmI0LycmB+y3KJ+xBOGD1xFGfFDZv3aX/oXljnpY65CWWPotslZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKXdYJnrWGmXXyc12EjMGj2Zi+sdzT0+W3Qxla5pScU=;
 b=kMJNaNRpWPShEeK070g/n5Trn9KMTbNO5YZEM5dzJdjh4GhDrfO+ORKf02ooY1gPRaH12dwmclqSXx6vPatG2ZlwIOxOccBxlAXoi5eM83szu0fnYp7aJo+HdwyAxn6xNMz6OtX+XY9VavjGTTLzf1zwxuIZR5kpDv2LzC8yb/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by LV2PR12MB5845.namprd12.prod.outlook.com (2603:10b6:408:176::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 17:27:56 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 17:27:56 +0000
Message-ID: <eec98f44-f329-4dc2-b6b4-99bde056ff42@amd.com>
Date: Wed, 16 Apr 2025 12:27:52 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 18/26] x86/resctrl: Add default MBM event
 configurations for mbm_cntr_assign mode
To: Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 peternewman@google.com
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 paulmck@kernel.org, akpm@linux-foundation.org, thuth@redhat.com,
 rostedt@goodmis.org, ardb@kernel.org, gregkh@linuxfoundation.org,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org,
 alexandre.chartre@oracle.com, pawan.kumar.gupta@linux.intel.com,
 thomas.lendacky@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 xin3.li@intel.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1743725907.git.babu.moger@amd.com>
 <03cfb41a0b2538cb994fa0c5b0950b7280cf2eb7.1743725907.git.babu.moger@amd.com>
 <8c3aa9cd-335e-415d-a9d3-35593fdbe812@intel.com>
 <15852d2a-5a44-4d15-aecd-d28660a40a85@amd.com>
 <5cbd73c9-421c-4147-9922-29123f011882@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <5cbd73c9-421c-4147-9922-29123f011882@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:806:130::28) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|LV2PR12MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df20155-1fbf-4874-bb80-08dd7d0c06ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjlkNHpNb3JNT2RlcG53d2F2N2NtQ0JrZzRyMGQxWC9NRkJYazdERGFpR1hL?=
 =?utf-8?B?Z2JsbVFyOGp6QWVNY2xJdTZPakVpZDJvQWQ0TXBqV3pMR3RLNmFia09xZmJQ?=
 =?utf-8?B?QS9NQm1yc0VrcmpzM0NGUXVmTE5IOWhuVWdiZ2JpZnRIUnlPTzNXbFV1Mkgz?=
 =?utf-8?B?NmFBOUh5ZldGS1BjQnJMVlQwMTlqd0JSVVp4blRmdGZVSnFmRjRVbkRBU0tz?=
 =?utf-8?B?RENLNVEraEY4TlZpRHZrYW9ack5NZjNyem5WM3BIajY3TkZDRUZlc2ZPbEo0?=
 =?utf-8?B?S2lzVytMTkJLTGVDK21rREtXcGlWZGlSamYvY2RPZ0hLR3o1eFFDVXN1cm50?=
 =?utf-8?B?UDVpTnBOblA5cUNOLzFRcmwwclBIUEk1aFdDdjhhTW4ra2FzWWNTRE9OWnhp?=
 =?utf-8?B?Yzd6dkQ1Wmk0cmU4WUFGdVpZcDVqYUFnYUpSaEw4ZlJTTUlLVHRmS1JKUjFI?=
 =?utf-8?B?bWo3QTlCZFZJdUJ1U1pFSmhIWjh2emdZY2RQNTZFbHVVczVnRktYdHRPWW9w?=
 =?utf-8?B?OTlRbTJjVGNEWjh6UkozNGcxMENKbkZnbW9vVnYvOXArQ2JZbTJ6aW9GaVQw?=
 =?utf-8?B?MkR0b3Y5dmx4elNLRUt3RTkyNnVMRkw4ZzZ3Mk1XUXhxYmxJN2NScGtiSlhL?=
 =?utf-8?B?T3VwOHVHVk9meVNiaTNzNGVKanhOM1dCK25SZk9OU1J4MFRscFRkNEJ5SEFO?=
 =?utf-8?B?VVc4OTl1Mnlla2t2emNYaC9NUm5ZU2h0bWxFOXVadDVnWXZmQ3pRMzdqQnUy?=
 =?utf-8?B?M0VGZEZiNW9IekJsd3kyWFpOY1l6bldNejJBcFBsem1aUWhEellBVDBTOU1W?=
 =?utf-8?B?V29rR2tnZkFSS3piTWI2Yy9JZEp3aGE5aG55Yi93M0M1enBhakNlZVd1RFd3?=
 =?utf-8?B?d3E4aEUwS04zRnUzZk9CRWlvN0l3ek5uNGhobWFCUTg4MnRKeTUxRjM1VTNF?=
 =?utf-8?B?NlVseFZ4YjVRUmhITFRSYUZpbXRzUlYvYXhCaUQ4OElsQ2VpZ280RjhKb3Ro?=
 =?utf-8?B?Rnd1aW1YWThORHBBUXJhdldTQWpKSittbjMzbkdBaVR3T3NhZ1lNUTVzS25v?=
 =?utf-8?B?ZFJ1UkVKSVVBUE1hRnY5QUxPaVhRdUlWMVVpYWduL0p4YVdQYzZhcnFFNXhN?=
 =?utf-8?B?OWZyS0d2dU9SelFYb0lZaWkvN2Y2Z2FaMUJPVnRMT3BOb2VUZzFJcWlaYTJr?=
 =?utf-8?B?RzluczRNemg4ZTBxWkgwTnJWQmFudy9aNGk1TzFiRGpkcWQ1ZytQdXRTTjR1?=
 =?utf-8?B?L3E5bVRtTHJXQ1k3T1JyKzBIOTFnTk1yZWx6OWxKMUFRbk9LQTgySW54eGZv?=
 =?utf-8?B?ZTFqTEZTWUJFdDJrRW9IdFFUakZ3N2JJcGRLWmRDWTBnUlo4R1ZXbEFlRFE0?=
 =?utf-8?B?TjVFT09EZnJyaFgzTnBpNFhBRUYzMVMxdDhwSUFWN0NpS1RGam02N2dlZWs3?=
 =?utf-8?B?U1MwVkNYbVQzZFEyNGZoNnJKcUpOR2ZLbXlPa0I3ZVpROHkrbk1xK1pwQXJ6?=
 =?utf-8?B?MkM3OHU4OTVWWFhUeWQzTS9JL2phWWpzUEdHeHBCZWdGZUlhWGpZZEtubk9k?=
 =?utf-8?B?VDJoM3ZoREFNSkk5Z1FPc3o3NXNFTDlyODV1Znlma24yZTd0a2pKMjJzRldo?=
 =?utf-8?B?OXVqZXhFYlk1elZQalpsUTRQYk5ZaGVDRHdYOXpBMFF5b2ZoTTNrU2FGVVll?=
 =?utf-8?B?Rm9ldkRkWVFFMmRQSXlGaWc3dGNIMURVTlB5NzZNcjcvY0diSERkR3c3d200?=
 =?utf-8?B?VitJT2hwMnlUQkZKWnVuTHN6VE03Yjk0blhaK0ZrMUE2aElJZ3dQYmxyVGpG?=
 =?utf-8?B?R2VpeURuSm94WUx4ZEsxVm1xTzBoank2R2VqVTVPNVp1TVF4K2lIUXZKeDhI?=
 =?utf-8?B?azcxNWk5OEQwb2FmWTU3NFNpVDBLa3M3bWdaZlRNaDBWbkpqWXkzTmY4UWoy?=
 =?utf-8?Q?nNOO2BSSItI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUhtanRiZG1PMjcyM1hMeVNNKys2YWdydXZUdUZPVjg3NHpmZUpoZ1FmVGxk?=
 =?utf-8?B?d0o1M3hsZStHWm9EZ2JOMXJSdWRROWxsOEZFTzk4SmQyTmUwSzlYNWVEaEM3?=
 =?utf-8?B?Z0RETHRKQmJtZkY4OGhjdzV6RTFpVFZmYk5pa2YxOVp4UGZvT1E0ZklJY3pn?=
 =?utf-8?B?Y1kxNjRTUEtZSkNjQ0RLTGxsekpLZUtVdmNpZWxUemRMQ1FHemdvcTBPa3hx?=
 =?utf-8?B?RkpLUGFka1NuK0lUL0VhVFh2SFF5am5MMEc4ZGRpNVdFSXBMZU1ad3lQMW02?=
 =?utf-8?B?bDRRNGFFclRnZ2pQK0JOOGpwT0Z2U0cvVUI3WTZrandxR3pNQVRUNnBFM0NE?=
 =?utf-8?B?cTd5d3NVT1ZlRThTZVp2UWV4WUFidnJxSkRpeFRDZENyZXNkcmdKQm1tZW9H?=
 =?utf-8?B?YXZTclVXM0kxS2tkY1d2ZGlWUFE5cXE5WlNtdkdvM2RaTGY3a0g1SzRxWTRz?=
 =?utf-8?B?c2dYYWlQN213YlBqeDNzNWRYa0lNUkJNaWVXSDRSaUtJNit5ZnVVYXNXOXN6?=
 =?utf-8?B?SkRNUnF3Znd4TTBnYTg2bjBteTNmZWs0N2p5b1ZleGZOeDBHYXhldVFqZTZz?=
 =?utf-8?B?bWs2Q2R6VTUxa0E0MWJCdWRQRU1wNjcvK3lVYXNpQUtHcUlyTm9kQjZoQ3Qz?=
 =?utf-8?B?Z2ZyY2JIR3NjOVV0UHlBT2pJOHN3cm9IYU5FL3JqTktxT05ZS0dqcmdFV0hV?=
 =?utf-8?B?dHAzTjRIM3NZWUhyVm80NHZxZ1ByYnVDbHFuODJkSlNVSXBEZUJyMUthN2Yr?=
 =?utf-8?B?aGhrNGtCeGVBRlorQWQ4MndXMDRPay9wMWdTRjdsR2lRM2ZHZzhHYmdtM3JV?=
 =?utf-8?B?aTF1YnNvUDdqWTB5MW05bEFQdWxyemM4cXllRVhqZFg4azlEWmJnb2RnRnhi?=
 =?utf-8?B?c1lCWmVhbXI3Zmd2SFRlcDV2Q0NLZllhTHloYmJSSmlzZWN2VE5wSG4rSm4r?=
 =?utf-8?B?bVJzU0huMnlDc3J6Qkc4VzBMUUNrRW4weXNHa0V3SWZTbGpTQnBVMm9obU44?=
 =?utf-8?B?amM5akQxUi9tckVYODBITUc4b0k1YWlWaUtZMWJyT2xiM1FQdFdCejhqdnlJ?=
 =?utf-8?B?SVlXSEk4TEpoUEVwTVIzYmFIUEwyV1dmbGcrTUo2N0J5VGdsdklPWnJPalVM?=
 =?utf-8?B?bFBEVmQ5SDdvRnphTUJNQjM1dFdINnpydy8ybDNnQW90bFBqRnl2MFZDQjBV?=
 =?utf-8?B?a0M4Y3NWMkI2S2IyVEUxV1dhQ3VHTmo3Vk5ORHk3RENMdUNtaWtLUlVqQndT?=
 =?utf-8?B?dFZ6TnMwYlNIRFUzVHRhcjZKcHEyNUlnczhxck9tZXdhYjF5NlB6QTJycEFC?=
 =?utf-8?B?d2pWb3l3UjEzVmVSQXF4T1RWSG1tOVpCRUVDTFRjdFdhZmNySG9qbzZDTkl3?=
 =?utf-8?B?ckpnNkZUNjVtTTRNWTJwMWZiWlA4eG80Nkx0a1hFdzlvQWtlY2J6UG96cUVs?=
 =?utf-8?B?bWtGUi9yWUpnSE5uUEFBNTJGUmlDZW1XaVE3eDFSRFRqZnd2WjlHajY1U1hI?=
 =?utf-8?B?ZWFGMS8wbWsyZGFzZ1k4MmlNUzlrdmcxU3FDdTA2ZkZnVmZtQ2NUQ1YxeERj?=
 =?utf-8?B?cnFNcnpvSkYwQXlVdFlVN25QcHpST3F0bjRqYUhWeWo0NTd6eE0rUTlOdnVS?=
 =?utf-8?B?VCtTTW5icW5HTmpna3F5dEZ6VTl1S2h5enM4Yy8zVVVTTkkxUFlvN2NXbDJV?=
 =?utf-8?B?THZRTXVrM0xrcGxrdlBQbWtFd0lmVnM0eGhIRUU5M0wrcE9zZEkxTDBaTFV3?=
 =?utf-8?B?aUE4NFlWWlFqY1BxakxHcFM2Zkp1RURuY3VFNG5qVDZvenhyOVdGdzltNUdD?=
 =?utf-8?B?R0o3S0V5ektrV1JabFNpZ3BZZmwxNFFrVXFlN2xqdGhocHN6VGJ6ay92dE5Q?=
 =?utf-8?B?UlBBNWxDSnhROTdWNTZoYlJXNkRwTU4wVU5OY0JOL01PY09veUhxZkVXNUJ4?=
 =?utf-8?B?RElYWmFYTExFOWpYM3Z1VWx5MVRFM2NKd2l3bmRTYlB3dXhTMEFsaHFIR1Bp?=
 =?utf-8?B?RmlSck1DL1hzWE4vY1N1bll4TTNWRUxFQzFMOHFWT0U2cE1BUHNOYVRFdGg4?=
 =?utf-8?B?TGxXTC95YnVkZlJZdTNacGpFalRSRjJqcGwyLzJnUnk5bXBMS211T09SUHdV?=
 =?utf-8?Q?QdTY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df20155-1fbf-4874-bb80-08dd7d0c06ca
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 17:27:56.5282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9dc+sYqclaXx7bVOYF2r/lXQtXkJrvITrelyApb61HkIrCWsbe9tZwEiI9B9PGq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5845

Hi Reinette,

On 4/16/25 11:18, Reinette Chatre wrote:
> Hi Babu,
> 
> On 4/15/25 11:48 AM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 4/11/25 16:44, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/3/25 5:18 PM, Babu Moger wrote:
>>>> By default, each resctrl group supports two MBM events: mbm_total_bytes
>>>> and mbm_local_bytes. To maintain the same level of support, two default
>>>> MBM configurations are added. These configurations will initially be used
>>>> to set up the counters upon mounting, while users will have the option to
>>>> modify them as needed.
>>>
>>> This jumps in quite fast by stating that MBM configurations are added but
>>> there is no definition of what an MBM configuration is.
>>
>> How about this?
>>
>>
>> By default, each resctrl group supports two MBM events: mbm_total_bytes
>> and mbm_local_bytes. These represent total and local memory bandwidth
>> monitoring, respectively. Each event corresponds to a specific MBM
>> configuration. Use these default configurations to set up the counters
>> during mount. Allow users to modify the configurations as needed after
>> initialization.
> 
> I am still missing a definition of "MBM configuration". How about:
> 
> "Each event corresponds to a specific MBM configuration." -> "Each event
> corresponds to an MBM configuration that specifies the bandwidth sources
> tracked by the event."

Sure.

> 
> ...
> 
>>>
>>> There seems more and more overlap with Tony's RMID work. Did you get a
>>> chance to look at that?
>>
>> Looked little bit. Will have look bit closer again.
> 
> I'll study that series next to catch up with Tony's plans.
> 
> Reinette
> 

-- 
Thanks
Babu Moger
