Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453B21B423D;
	Mon,  5 May 2025 19:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746474889; cv=fail; b=JUMvNpiPRd6VA6k61hECMo8wuHM7FAeU2G/vlLNz9HXeOqksCn1fArY4vEE1crA2vrgenvXuhsCCKZV0WCK8WPjycx2f/wlpvgzvtFgz6hk8R8D9Gb56vXCAwUrpBu/TGA5zMkxm5YsYx8GHWycEl4rZ9AuFkN5rba3KMxgYO74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746474889; c=relaxed/simple;
	bh=42FOrvWlszDX4tvSL9Uow3gKP+rfUgLHQcd2x0VwTNI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JEHK2BWZ+EjThF14BJVykUUshft19FgFXXWLXYeyXBDg8Z9QP4Jr7Hpcug2WRLhNQZsaiwoYZEgs6Yro8P0puKIVpfFf8rMEXuOkZES8FXdt3rrTylr9Mqen2xri4kWmbvVcvr+3dF5YIfP4r+voIz8ER3FIA/Y+oQQvJOWSEsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=D9+SdOJF; arc=fail smtp.client-ip=40.107.94.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="D9+SdOJF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=geGfNwIFPti5ArajamTzIVC15I7ZtV+eFIURBeKz/8S4GcnqAsQIkN7SljR5d4eBixBmkKjNzIt5qtAfg1ggTI+65sqlZSSqFNampAqE9tKNut15UNCK56wWDfaWFwiJlrpPvT7zji/kIHofv6/1cJ1RDg/qbPM+LaxC5+/nBOKiwR+sJvKLU9N6bCDtasJoYqFDRl4k0o7DySFGmlWdk8SzcTMcGM6Gt79DV8cLI30sqcFTYOfqK9r3V1TaKB61YqNDSUQvqvZ4YBEfTLwV79rB6ynSayER5QYyJ2pSQIICYuWZbobTnxN89DTpZAYzW3jDzdurm+yFhXyQ7qVeRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxLQtg5Zj4UjfVK9qkQ8EQmQrxeSZ+kEzIUD/xFpqDs=;
 b=RVHKXXe1nHf0SwUTHONfnhzgLfr0EX5kV+oT+x5hazBLgb3A0X3wCnZABtV8+cxR4SAnZ0QHI9IHqCv4Wx4nU68DhLSpu5TTzhOWE4E+wGQyFFCzqblOuVJKP4EFpOgwx3vyKBAOQODzTYnfZCXjaoie6ReduVemcX5DzbTRYzYU1NSOGdvJ0E7FqAknvuDWc8nQDvnczr1V0Y8zgs2gKI1oBhQUugKkl0DvChiv6pgtazlSzP6CeEb3tMmSAfLvgbIVDjdNC5FFf/WQ/G9cKm8NSpvlYJD2fg3h7lJEN8PGe9lgGBu07ESEsSUZqNKpEMMq1Ec/F4JoTXpAbePrsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxLQtg5Zj4UjfVK9qkQ8EQmQrxeSZ+kEzIUD/xFpqDs=;
 b=D9+SdOJFeTke0zoYJkizpCadeGjdUpzq/TQwl8fG6MsXeJfoAbqXWyzilPIxBn3oS8TPquB38enSCXwc1EzkZYHzPEvWj+QCP0mtwtU/9LJclYjdM2ZH2yokq116d1y0RIYSWUK9EAVgByD0xJflbRO0Nmcb7Opl5Jtk55V+VTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA1PR12MB8699.namprd12.prod.outlook.com (2603:10b6:806:389::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 19:54:44 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 19:54:44 +0000
Message-ID: <b6521b41-d94a-4e69-af69-ed7657569f7c@amd.com>
Date: Mon, 5 May 2025 14:54:40 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v4 0/8] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com
Cc: corbet@lwn.net, x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, thomas.lendacky@amd.com,
 mario.limonciello@amd.com, perry.yuan@amd.com, seanjc@google.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, kan.liang@linux.intel.com,
 riel@surriel.com, xin3.li@intel.com, xin@zytor.com, sohil.mehta@intel.com,
 ak@linux.intel.com, ebiggers@google.com, andrew.cooper3@citrix.com,
 gautham.shenoy@amd.com, Xiaojian.Du@amd.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, james.morse@arm.com, fenghuay@nvidia.com,
 peternewman@google.com
References: <cover.1745275431.git.babu.moger@amd.com>
 <c00c00ea-a9ac-4c56-961c-dc5bf633476b@intel.com>
 <3e0e9b68-2ebe-40f8-a840-1ad7cd3f56e0@amd.com>
 <3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::9) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA1PR12MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: fdab4033-49d8-4e04-e8bb-08dd8c0eae4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THllUHZ2WFVPbHVJVzFBdUlGMzRLSVVKODB5allVbThvWlZGVGQ1dWRnN05z?=
 =?utf-8?B?eUxNUnluMXZRL05zMjl4RjFTMTA5MlNUU0VzSTI4SDR5WG9NWEhiRlVtMDFP?=
 =?utf-8?B?ZVdCOExnUkU3RzhQZkJhZG1Ca1dYekV2N3A4TFZMekJBcHpuU3BwQ0VmcU5P?=
 =?utf-8?B?c09wRGVWQ1ZVU1RvWDhhVmIyZXNGeXM2cEdGcFBXamNVVXQrNGtndlpaY0JM?=
 =?utf-8?B?VXY0Y0NyKzdCMTYvTGZQY1F6VnBIS1RQZy9FeGNXSllhOCtOcFBXWmJ5dm5N?=
 =?utf-8?B?MWh1cmhuSmNRUGJuMUdhbE9YVFRwMHhjSjhDZHI1bjJVd1pNRVJXUDFlY1l5?=
 =?utf-8?B?ZkUvWlFIMDNnOUt2enlDSkZtQWhiWUt1ZWt5VU1jaGozWWJoMUVKQXIrMitT?=
 =?utf-8?B?Y3ptU2twZUJGTUtnN2pYeUY5QVdZcUg3MExKSHJzUTZ5c3l1SGVtUDN4TnMv?=
 =?utf-8?B?OVRQRXREWjIrV1JUUERoNVhkR0FrZ0VucWYySXhHMTR6dGxhUUJ4ekFucC8x?=
 =?utf-8?B?aEZoZDZOYnpQanRHaHBXc1lGdFZWYnNreUE4cktWemdXaFVBdjhsZzhYM2tK?=
 =?utf-8?B?YXI5NG9QZXVMTGhLOVJ1UXdpT090MXllckJxZUFHL3F4ZUZ4WmUxMkxmYURU?=
 =?utf-8?B?RDVvdFB6djdnVGRPNXROOXM2OXRVQ04rakhjRVFNdjZGVndGTFdKWDgyME5u?=
 =?utf-8?B?K1E4MGxSckxzOUFKVjhzSW9qb2JOS2F4bloyUitlUlptdGtOcUpPSzlyZzZ6?=
 =?utf-8?B?eS84a05hNHZPZDBJcUdvZzJqUTRJTEJXdUZ3QVBaNk1QcjlNcnhXOEFmZ2VF?=
 =?utf-8?B?MTdVb09kTkFBdkhCcFpCYkU2Y2Q2N2pmNVZHT2hkQU12bmdoM0lBNmNaeUp6?=
 =?utf-8?B?THVVQzNlZWdYamh3VUh1T3R2Q2ErMXY1aW0yYXhWc0NFbFFLM1RCbUFjaHZC?=
 =?utf-8?B?VU9tanZ4emtVaWZZZHU2Y0hlOENLM3E1NVhjTEo5RndMZlEySWFaWGNGS3Va?=
 =?utf-8?B?QlNkeURjdVpMT0JzeVVKbkRBMnRPZWdLRktETHhPNEpVdUc4bHlJY2twN09y?=
 =?utf-8?B?ZW41MjZhZTJDTy90bElVb3RwcU1QTjBSVHdtK0pJeDRqYUpUb2VDVGZmcFlr?=
 =?utf-8?B?YjB4SnhFSkhwTGNuWUlZTmxtSmdPTVpIUHphWkFYa0JzL3kyNDlKb283NzNV?=
 =?utf-8?B?YmFwSzBaTy9BNlVlUnhTMmNNNFZXbkF3RWVYdUNTT0ZmNk1kb1VsbWR4OE9z?=
 =?utf-8?B?U2RnUld2VjBNcTdXZHBSNjhYdFNHUENYTHhpWk1CUkFxRmNteVlZWExtejhE?=
 =?utf-8?B?Z1Fyd29teThaZklsOXY1MHR2R1R3bks1WnRqa2Qyb0NvMHE0S2ZNSmpzaThv?=
 =?utf-8?B?VzR2VEVpK3A3cmk2RmdnOFQ3M2E3VjEzdTVmM2NCMWFpQ3YvL3ZTaEFvQ2Zn?=
 =?utf-8?B?bEdjdTh6TEE2WlJkd2xCMUQvOGRUdGZGa1V4bW93emhxd0U1cWo4TnJCOXJW?=
 =?utf-8?B?eURxd09GL0ZSQ0FMR0I2SUpORWhNbG4rZGJlR2hSdFZqUk5OamJFdlUvbTBx?=
 =?utf-8?B?dG9kQWtRMFhqaGZWQzFYS1FZeE1sVk4rQWpTR0J6aG8rdWsrTkcrYVF3bnhz?=
 =?utf-8?B?UkptMDgrVy9WYk5Mb2V0RW42aUROMFJTUVo0UG1MZXBuMmRLYnE0WDNFNURh?=
 =?utf-8?B?WEpSRlVuVCtnVnVIM1B1WWR4U3UvdG9hNVd0TVB2NWpPd1BUOXoycmxGNG13?=
 =?utf-8?B?TDFUeUtlNWxUMlNaVEkraXZBRjBRb2NJcG9KQ0lvL3YwUHI2dlVrY3dkNm5H?=
 =?utf-8?B?UlU2L2ZPTXd2Q3UzSHRvWjZsckkvNzhTc2dNQU5oNE1XcHJxVkdSTDhsNk1M?=
 =?utf-8?B?Z0pZOEYvQnIwQ3JOUk1hRDFkay9wZVZUeUJmcjVZWU1ZYXNJdTl5OTBTVnBl?=
 =?utf-8?Q?zdSNLhz/Eoo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFlpK2QrbUZlK3RLSUwzSjMxeHVLVGg2VnZSOHJlVkp1bjdodDByWkh3eGhB?=
 =?utf-8?B?SDZuZysyYzZNbWRDa05hNXMzYzlXdVNBZjFvQmRDUEtONmxyMmdaRmxlNlMy?=
 =?utf-8?B?eEVlbkZjSTlYS0tPTkp5YnU1V3JBRkhTbGc5N20wTWJmTEY2VmJIbXRiTU1V?=
 =?utf-8?B?NGNEcmlrekhGM1JONC9iV2k4Ty9SaWxPazNHT3FDRkFCM283VTZYRWxJWVFB?=
 =?utf-8?B?Njdyb1FhcHJKKy9rREowSWsxLzh3clhMT1IzWXdsMTlyUktHcXRuWjdFNWdO?=
 =?utf-8?B?RDFnSWxJcXhxVjVoZGpNRGJwU0FQMEFxbGxRWVByaHpob0lCMzdLQW9TRDVa?=
 =?utf-8?B?OWIwZk9wU0JCRGJub01lZ0pqTWJDQVFDZGNoMEptV1ljOHBYMHJ0OVQ4SGdE?=
 =?utf-8?B?VzA3RXdhZ0ZwbTJvTXVJNmwwRTFURTVybUNjVGV2ZEVkcVVFVjVISHptaGxD?=
 =?utf-8?B?eGpqL2tqZDZMNVhaUDNiNnNZcVJwRmxwVmx4QjIxbHlkby9VZlB0UVl4Qk16?=
 =?utf-8?B?WEN2bDloTnNBL3BDaU14cWdkUlJSZmprekZZQUhJVDlZVldZbXU1S3Z6Y2U3?=
 =?utf-8?B?YkIxV3JXSUQ2Y2grY1VrdDBDYVFwbWRucjZxTk92b3N6NlAydjRpbjYxVm9o?=
 =?utf-8?B?QndIYUQ1T3NrTXg2cDliY2ZsSDhxMVBCY0ZFV3lxZ3JVUlpmTGtUSDF4cUpF?=
 =?utf-8?B?Mk90OExjSnhFYm1nTGpOYmFIblllUmcyaGtKTzJ5V1NJUEpGSjkvWDFXL0Np?=
 =?utf-8?B?a3FaRzN4RjIxUXRrVm1IaHk1Nkt4QVVZaWhtMHozbm5tZHdNa0hsd2g1U3Zm?=
 =?utf-8?B?VVBUZlF4UjNJODlCZHhHMEYxVWJPUFhpVm42T1VTb0xqa2IrWm1nNzB6RDRm?=
 =?utf-8?B?L2YzRStVMHgwOGRzQVRMaC81NUxhM0FMWTVweTBOOE1KRlk1NGxQbTJPWXN0?=
 =?utf-8?B?Z1pnTSsvYjdBNm5Zb3pLeWtRSXdsd1JqZkQrQTkwWlZ5dFZNcGpXeWg3VDJO?=
 =?utf-8?B?aXdHMFZCZUFYTEZWMFdUdjNIemJ6cGV3K3pqanVzc3NLaFFXWmUybFhhRnNM?=
 =?utf-8?B?UjVXaVJpcWxmQStGU0Z6THV1Y1kzUzZFSW9TdDdPSlplMHlPVENtR0NkSm9R?=
 =?utf-8?B?QXY4UWFteEhGQnNXYWtKamwvQU9FZ3dWUTZQNFg2QkZZUUVuaWdEZjk1VGRL?=
 =?utf-8?B?UURINUNucEI2RkRnR0taOHhIdWFvaC9GTHUzUW5zdWl2d2pVVHhJTC9JWXBp?=
 =?utf-8?B?cVl3OHljZlh4V3cwaFVUOC9neGY2OU4yVU9WTmgwczJqNUlQT29UU21RZlh1?=
 =?utf-8?B?NFNVZ3pYVjN1ZHRtbFpSWnhscVY3RVpBL282aW41QUUwLzVoSk8vbE05akNs?=
 =?utf-8?B?UzZBSU1hcXczeUx4UjBWcHUyaXptTW1aYW9RTEJheThoREp3MjdYL3FMVzha?=
 =?utf-8?B?Zk9IbTdVSTdxYkc5VENpUmFFNDdxWUZTeEljangxVGRrSVlnN1JtSHRCV3lL?=
 =?utf-8?B?S25JMUw5YmVDWFkwK01ESy95V1JuQ3Q5NTg2ZytOVkJHa2p5Zld4QVYrbjdE?=
 =?utf-8?B?cjhIOGpBdFBSQmkvM3puNG5oSXdPKzFad2tOeGFrQU42SHluU0xhcHRubGFw?=
 =?utf-8?B?cFRXYTQwZ2JHNUxaclJXbWNQODAxQytvVUQwbmpwWFowSERxamo1V2JlSlhv?=
 =?utf-8?B?WmxOa3JhMTNCdzFUSWV5MzIrNmlyQmNsWkkzQ0pkWEdjODd3aGYySGJ0Nk9O?=
 =?utf-8?B?UkZtU21UNEgxaFJFWW4yZ1BOOHJPYURjUFJhWlRkWmZzVGxMNkkrak55U0Nl?=
 =?utf-8?B?cUdBT0hSWmc0c0RaT3FVdTRiV2lscXlybEJJbEtNUlRXQlRpcWIyaU5LcTB5?=
 =?utf-8?B?ODRRZEV6dUtFSEdyVWtuTVREUkNHS1ZXRTlvVktySnF1MlQ0RWVnbEJyRUZO?=
 =?utf-8?B?eDZjNG9jTWFrc3E2cFVteU1iWTBmdUdNMHozcEJqT25hY01ic3UvZUxxUTRj?=
 =?utf-8?B?ZVBQVUJYOWlLRU1jUldqeEwrZlhGc3NkaHhMa1VEalh6bWJaOVVCMDRXTlU0?=
 =?utf-8?B?NzlpV3NDSUFpb0ErL1RPNWNndUdBQnhTbUc4VE10Ykd4Tm1weDRtd1Z4MUc4?=
 =?utf-8?Q?fl/o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdab4033-49d8-4e04-e8bb-08dd8c0eae4c
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 19:54:44.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7b9Tl1oOEGHWccWtLY792CJs57RCdQvAw2vq9L9rHTpmYdVdtHizVdpkf9LKPBof
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8699

Hi Reinette,

On 5/5/25 11:22, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/2/25 5:53 PM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> Thanks for quick turnaround.
>>
>> On 5/2/2025 4:20 PM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 4/21/25 3:43 PM, Babu Moger wrote:
>>>> # Linux Implementation
>>>>
>>>> Feature adds following interface files when the resctrl "io_alloc" feature is
>>>> supported on L3 resource:
>>>>
>>>> /sys/fs/resctrl/info/L3/io_alloc: Report the feature status. Enable/disable the
>>>>                   feature by writing to the interface.
>>>>
>>>> /sys/fs/resctrl/info/L3/io_alloc_cbm:  List the Capacity Bit Masks (CBMs) available
>>>>                        for I/O devices when io_alloc feature is enabled.
>>>>                        Configure the CBM by writing to the interface.
>>>>
>>>> # Examples:
>>>>
>>>> a. Check if io_alloc feature is available
>>>>     #mount -t resctrl resctrl /sys/fs/resctrl/
>>>>
>>>>     # cat /sys/fs/resctrl/info/L3/io_alloc
>>>>     disabled
>>>>
>>>> b. Enable the io_alloc feature.
>>>>
>>>>     # echo 1 > /sys/fs/resctrl/info/L3/io_alloc
>>>>     # cat /sys/fs/resctrl/info/L3/io_alloc
>>>>     enabled
>>>>
>>>> c. Check the CBM values for the io_alloc feature.
>>>>
>>>>     # cat /sys/fs/resctrl/info/L3/io_alloc_cbm
>>>>     L3:0=ffff;1=ffff
>>>>
>>>> d. Change the CBM value for the domain 1:
>>>>     # echo L3:1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm
>>>>
>>>>     # cat /sys/fs/resctrl/info/L3/io_alloc_cbm
>>>>     L3:0=ffff;1=00ff
>>>>
>>>> d. Disable io_alloc feature and exit.
>>>>
>>>>     # echo 0 > /sys/fs/resctrl/info/L3/io_alloc
>>>>     # cat /sys/fs/resctrl/info/L3/io_alloc
>>>>     disabled
>>>>
>>>>     #umount /sys/fs/resctrl/
>>>>
>>>
>>>> From what I can tell the interface when CDP is enabled will look
>>> as follows:
>>>
>>>       # mount -o cdp -t resctrl resctrl /sys/fs/resctrl/
>>>       # cat /sys/fs/resctrl/info/L3CODE/io_alloc
>>>       disabled
>>>       # cat /sys/fs/resctrl/info/L3DATA/io_alloc
>>>       not supported
>>>   "io_alloc" can thus be enabled for L3CODE but not for L3DATA.
>>> This is unexpected considering the feature is called
>>> "L3 Smart *Data* Cache Injection Allocation Enforcement".
>>>
>>> I understand that the interface evolved into this because the
>>> "code" allocation of CDP uses the CLOSID required by SDCIAE but I think
>>> leaking implementation details like this to the user interface can
>>> cause confusion.
>>>
>>> Since there is no distinction between code and data in these
>>> IO allocations, what do you think of connecting the io_alloc and
>>> io_alloc_cbm files within L3CODE and L3DATA so that the user can
>>> read/write from either with a read showing the same data and
>>> user able to write to either? For example,
>>>
>>>       # mount -o cdp -t resctrl resctrl /sys/fs/resctrl/
>>>       # cat /sys/fs/resctrl/info/L3CODE/io_alloc
>>>       disabled
>>>       # cat /sys/fs/resctrl/info/L3DATA/io_alloc
>>>       disabled
>>>     # echo 1 > /sys/fs/resctrl/info/L3CODE/io_alloc
>>>       # cat /sys/fs/resctrl/info/L3CODE/io_alloc
>>>       enabled
>>>       # cat /sys/fs/resctrl/info/L3DATA/io_alloc
>>>       enabled
>>>       # cat /sys/fs/resctrl/info/L3DATA/io_alloc_cbm
>>>       0=ffff;1=ffff
>>>       # cat /sys/fs/resctrl/info/L3CODE/io_alloc_cbm
>>>       0=ffff;1=ffff
>>>       # echo 1=FF > /sys/fs/resctrl/info/L3DATA/io_alloc_cbm
>>>       # cat /sys/fs/resctrl/info/L3DATA/io_alloc_cbm
>>>       0=ffff;1=00ff
>>>       # cat /sys/fs/resctrl/info/L3CODE/io_alloc_cbm
>>>       0=ffff;1=00ff
>>
>> I agree. There is no right or wrong here. It can be done this way like you mentioned above. But I am not sure if will clear the confusion.
>>
>> We have already added the text in user doc (also spec says the same).
>>
>> "On AMD systems, the io_alloc feature is supported by the L3 Smart
>> Data Cache Injection Allocation Enforcement (SDCIAE). The CLOSID for
>> io_alloc is determined by the highest CLOSID supported by the resource.
>> When CDP is enabled, io_alloc routes I/O traffic using the highest
>> CLOSID allocated for the instruction cache (L3CODE).
>>
>> Dont you think this text might clear the confusion? We can add examples also if that makes it even more clear.
> 
> The user interface is not intended to be a mirror of the hardware interface.
> If it was, doing so is becoming increasingly difficult with multiple
> architectures with different hardware intefaces needing to use the same
> user interface for control. Remember, there are no "CLOSID" in MPAM and
> I do not know details of what RISC-V brings.
> 
> We should aim to have something as generic as possible that makes sense
> for user space. All the hardware interface details should be hidden as much
> as possible from user interface. When we expose the hardware interface details
> it becomes very difficult to support new use cases.
> 
> The only aspect of "closids" that has been exposed to user space thus far
> is the "num_closids" and in user documentation a CLOSid has been linked to the
> number of control groups. That is the only constraint we need to think about
> here. I have repeatedly asked for IO alloc connection with CLOSIDs to not be exposed
> to user space (yet user documentation and messages to user space keeps doing so
> in this series). Support for IO alloc in this way is unique to AMD. We do not want
> resctrl to be constrained like this if another architecture needs to support
> some form of IO alloc and does so in a different way.
> 
> I understand that IO alloc backed by CLOSID is forming part of resctrl fs in this
> implementation and that is ok for now. As long as we do not leak this to user space
> it gives use flexibility to change resctrl fs when/if we learn different architecture
> needs later.

That makes sense. I’ll go ahead and adjust it as suggested.

> 

>>>   (Note in above I removed the resource name from io_alloc_cbm to match
>>> what was discussed during previous version:
>>> https://lore.kernel.org/lkml/251c8fe1-603f-4993-a822-afb35b49cdfa@amd.com/ )
>>> What do you think?
>>
>> Yes. I remember. "Kept the resource name while printing the CBM for io_alloc, so we dont have to change show_doms() just for this feature and it is consistant across all the schemata display.
> 
> It almost sounds like you do not want to implement something because the
> code to support it does not exist?
> 
>>
>> I added the note in here.
>> https://lore.kernel.org/lkml/784fbc61e02e9a834473c3476ee196ef6a44e338.1745275431.git.babu.moger@amd.com/
> 
> You mention "I dont have to change show_doms() just for this feature and it is
> consistant across all the schemata display." 
> I am indeed seeing a pattern where one goal is to add changes by changing minimum
> amount of code. Please let this not be a goal but instead make it a goal to integrate
> changes into resctrl appropriately, not just pasted on top.
> 
> When it comes to the schemata display then it makes sense to add the resource name since
> the schemata file is within a resource group containing multiple resources and the schemata
> file thus needs to identify resources. Compare this to, for example, the "bit_usage" file
> that is unique to a resource and thus no need to identify the resource.
> 
>>
>> I will change it if you feel strongly about it. We will have to change show_doms() to handle this.
> 
> What is the problem with changing show_doms()?

There is no problem changing show_doms(). My intenstion was to keep the
change as minimul as possible.

Sure. Will make the changes "not" to print the resource name for io_alloc_cbm.

> 
>>
>>>
>>>  
>>>> ---
>>>> v4: The "io_alloc" interface will report "enabled/disabled/not supported"
>>>>      instead of 0 or 1..
>>>>
>>>>      Updated resctrl_io_alloc_closid_get() to verify the max closid availability
>>>>      using closids_supported().
>>>>
>>>>      Updated the documentation for "shareable_bits" and "bit_usage".
>>>>
>>>>      NOTE: io_alloc is about specific CLOS. rdt_bit_usage_show() is not designed
>>>>      handle bit_usage for specific CLOS. Its about overall system. So, we cannot
>>>>      really tell the user which CLOS is shared across both hardware and software.
>>>
>>> "bit_usage" is not about CLOS but how the resource is used. Per the doc:
>>>
>>> "bit_usage":
>>>         Annotated capacity bitmasks showing how all
>>>         instances of the resource are used.
>>>
>>> The key here is the CBM, not CLOS. For each bit in the *CBM* "bit_usage" shows
>>> how that portion of the cache is used with the legend documented in
>>> Documentation/arch/x86/resctrl.rst.
>>>
>>> Consider a system with the following allocations:
>>> # cat /sys/fs/resctrl/schemata
>>> L3:0=0ff0
>>
>> This is CLOS 0.
>>
>>> # cat /sys/fs/resctrl/info/L3/io_alloc_cbm
>>> 0=ff00
>>
>> This is CLOS 15.
>>
>>>
>>> Then "bit_usage" will look like:
>>>
>>> # cat /sys/fs/resctrl/info/L3/bit_usage
>>> 0=HHHHXXXXSSSS0000
>>
>> It is confusing here. To make it clear we may have to print all the CLOSes in each domain.
> 
> Could you please elaborate how this is confusing?

# cat /sys/fs/resctrl/info/L3/bit_usage
0=HHHHXXXXSSSS0000

This may give the impression that the all CLOSes in all domains carries
this property, but in reality, it applies only to one CLOS(15) within each
domain.

Example below....

> 
>>
>> # cat /sys/fs/resctrl/info/L3/bit_usage
>> DOM0=CLOS0:SSSSSSSSSSSSSSSS;... ;CLOS15=HHHHXXXXSSSS0000;
>> DOM1=CLOS0:SSSSSSSSSSSSSSSS;... ;CLOS15=HHHHXXXXSSSS0000
> 
> Please no. Not just does this change existing user interface it also breaks the goal of
> "bit_usage".
> 
> Please think of it from user perspective. If user wants to know, for example, "how is my
> L3 cache allocated" then the "bit_usage" file provides that summary. 
> 
>>> "bit_usage" shows how the cache is being used. It shows that the portion of cache represented
>>> by first four bits of CBM is unused, portion of cache represented by bits 4 to 7 of CBM is
>>> only used by software, portion of cache represented by bits 8 to 11 of CBM is shared between
>>> software and hardware, portion of cache represented by bits 12 to 15 is only used by hardware.
>>>
>>>>      This is something we need to discuss.
>>>
>>> Looking at implementation in patch #5 the "io_alloc_cbm" bits of CBM are presented
>>> as software bits, since "io_alloc_cbm" represents IO from devices it should be "hardware" bits
>>> (hw_shareable), no?
>>>
>> Yes. It is. But logic is bit different there.
>>
>> It loops thru all the CLOSes on the domain. So, it will print again like this below.
> 
> This is what current code does, but the code can be changed, no? For example, rdt_bit_usage_show()
> does not need to treat the IO allocation like all the other resource groups but instead handle it
> separately. Below us some pseudo code that presents the idea, untested, not compiled.
> 
> 	hw_shareable = r->cache.shareable_bits;
> 
> 	for (i = 0; i < closids_supported(); i++) {
> 		if (!closid_allocated(i) || 
> 		    (resctrl_arch_get_io_alloc_enabled(r) && i == resctrl_io_alloc_closid_get(r, s)))
> 			continue;
> 
> 		/*  Intitialize sw_shareable and exclusive */
> 	}
> 
> 	if (resctrl_arch_get_io_alloc_enabled(r)) {
> 		 /*
> 		  * Sidenote: I do not think schemata parameter is needed for
> 		  * resctrl_io_alloc_closid_get()

Sure. Got it.

> 		  */
> 		io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
> 		if (resctrl_arch_get_cdp_enabled(r->rid))
> 			ctrl_val = resctrl_arch_get_config(r, dom, io_alloc_closid, CDP_CODE);
> 		else
> 			ctrl_val = resctrl_arch_get_config(r, dom, io_alloc_closid, CDP_NONE);
> 		hw_shareable |= ctrl_val;
> 	}
> 
> 	for (i = r->cache.cbm_len - 1; i >= 0; i--) {
> 		/* Write annotated bitmask to user space */
> 	}
> 	

Here is the behaviour after these cahnges.

=== Before io_alloc enabled==============================

#cd /sys/fs/resctrl/L3/
# cat io_alloc
disabled

# cat shareable_bits
0  (This is always 0 for AMD)

# cat bit_usage
0=SSSSSSSSSSSSSSSS;1=SSSSSSSSSSSSSSSS;2=SSSSSSSSSSSSSSSS;3=SSSSSSSSSSSSSSSS

==== After io_alloc enabled=================================

# echo 1 > io_alloc

# cat io_alloc
enabled

# cat io_alloc_cbm
L3:0=ffff;1=ffff;2=ffff;3=ffff

#cat bit_usage
0=XXXXXXXXXXXXXXXX;1=XXXXXXXXXXXXXXXX;2=XXXXXXXXXXXXXXXX;3=XXXXXXXXXXXXXXXX

==== After changing io_alloc_cbm ============================

#echo "L3:0=ff00;1=ff00;2=ff00;3=ff00 > io_alloc_cbm

# cat io_alloc_cbm
L3:0=ff00;1=ff00;2=ff00;3=ff00

#cat bit_usage
0=XXXXXXXXSSSSSSSS;1=XXXXXXXXSSSSSSSS;2=XXXXXXXXSSSSSSSS;3=XXXXXXXXSSSSSSSS
=============================================================

My concern here is, this may imply that the property is present across all
CLOSes in all the domains, while in fact, it only applies to a single
CLOS(15) within each domain.

Thanks
Babu Moger
