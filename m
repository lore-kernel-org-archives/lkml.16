Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C1628DF10;
	Wed, 28 May 2025 16:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451409; cv=fail; b=r4O4afRf/1NUp+jd4+vzNqfPYj2oSH0Yy9WSlIAwHzckc8ixdwDtcBwHxeN09dyq9X1j3ZzZlwG/acDb9qzLy7SXqG/yE/9OkvGXZjplx6kJGLLl1q4EYro5ETIvYxhj3ig+OmJOGCeu4YKLRfesAN8pOij2f7CVNWpa0ZnW8FU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451409; c=relaxed/simple;
	bh=SJ5pZVST4sqsZUlsJxh3tFWb3sIrPO0AzFycw1pMZeE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=npfncEL4XTQRk66CUgXHdDIbhimusjRek4c8ljJzyjXV0t3OzvRR0ijfnElw+LVJrzteH4ovRzAiVaezXqi2RdGkuHrsG85gfuEWiF88qKz6gEgCHJ3jDlu5kAPnIyfZLeNbLvfl7Vo+BSp6LzqcUV6KiZgBTgh5AFPu5yIF8ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Rc72a+R0; arc=fail smtp.client-ip=40.107.220.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Rc72a+R0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4lb0iBUHPAnBBoKTarUrKHehfBitZ/jfK4NnYeC5rq9HXThkTRB1BG1Q+BrjI+kV1yHw5QX67636eIResRdbn4R6XHkhJu3RFb/d+fSjUkLxLBHjsV7vnlvaSUNl8O4qiNPbm2hfX7PWI1+rcQQz7VC+eMcvG6pu61jzJ/ahDy2FcZMA1y+pTPeFjKd0zg0znralXxsy8IOC1v2RaVqR1djdl0a0bez3G0Z+weuZQmruxvy3wDoVq4WHj1FWCIsRjwlNQfwWaRP6Mvh2exgFtOjbx7CDaFIYqANuZXITQx7HmNpJENPqwwgoMsofANSifSL7shOV9O6hkJWJan+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVQeYbQQ8MdFvJW96HgOmtjVn+GODzFviGferJF8S7s=;
 b=pd1dJVPvoKEhMid1oyF5RNBPmDPOLmYNXnO3tP+TMS93tq0DmLmyHDwV6gLTJPtledsIVuMMeF65lGnXAftBl03nuzKaYSQJOCaPiQqcqJRYRrU/rUHtnd6hW5ULbsgL/uu6OqgV2Q/zGMXNztvpShyQagKBODXvdBZW2Q0uaaO4eamgu2B9UJb7aEH/HBz0gz8pXDrKKj4kYQb8dfBWu6jhrgLQvPVH3/P4BRQL9SuKBYQX8yr/Pov5hFuhggPktxwZkM67AhZbfkegDHYMKnt2ieAMYHn8fycnegl0FnXiGT437spybJOfZd5X76XU70KmAE/dr+BgqJc9PUxBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVQeYbQQ8MdFvJW96HgOmtjVn+GODzFviGferJF8S7s=;
 b=Rc72a+R0V74Cu734ThBvx991O09TXXnZ4+2iOiFZKiAlS5wX1V5q1RQJirR/niF7EM2FatnhP/y72CnSvrbepk/3ehAeJWP5QsEB//yuGtvs16zTcg0oOszq14dAtwOjSCEJsdTxUadSY7fNFK5cqupx9WOEfdNpC0zAwRX87p4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BN7PPF28614436A.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Wed, 28 May
 2025 16:56:44 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 16:56:43 +0000
Message-ID: <40ff2cd0-c8b9-460b-b98a-087cb251324e@amd.com>
Date: Wed, 28 May 2025 11:56:36 -0500
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
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <5636898e-78dc-4eb1-b226-ced62372e09a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DSZP220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:5:280::17) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BN7PPF28614436A:EE_
X-MS-Office365-Filtering-Correlation-Id: c0be8c85-f0c9-4a22-95ff-08dd9e089ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVYzcFJOenh2UlZiTWIxdnI4SnpNUy9UYXFmaWR0eWtJdFNSSlFRdW9xK0RC?=
 =?utf-8?B?M3VJUnFKZG5pOHBVallJcnk0dUIzdmhrdFFyczNOOE1KbXlmUUE1SmZUZDZR?=
 =?utf-8?B?UWV1bWpMV3U0M1k2bklzWHlJbWp0RVdOR0FJd3hpZkF5Njc4QmQxOFlRc09m?=
 =?utf-8?B?NmY3ODV3WnZIQ1FUTEVNdGUzQXIzY0VzQnVXMDdBS05yTUNqdTBoeWpPdTh1?=
 =?utf-8?B?Y3RXL2lIQnBFSG9ONVcrdTB5RVl4dHJXZUkzUk5TVWc5bXZrMER0UkhOTlhY?=
 =?utf-8?B?V2ZKSnhSNyszNkhzT2hEK1B5bHhWOW1GTytkeW9iNjAwQVpNckxuK2p4dmFY?=
 =?utf-8?B?dFprNHVHdWprR2Npbnkvck1maW4zMGt3c3V5c21UR2NnYXlaOEZlMHJDRyth?=
 =?utf-8?B?Nnp2MmdCeCtGYnlrZklCZmdKeUFKN0ZTbzkwcVAvQjhWRmVBQ1F6L3dUNUlP?=
 =?utf-8?B?K21qZVFXMGgrd0w3V3R1UFlBY1FSRlBkaHZoZDFuY2tjanVJMng4SXVRYlY0?=
 =?utf-8?B?SzlFamdlcFpUQTRZTXRpQ3UrRzM5bFRZUHpUdHR6R3cvZHVNcUdVdlBUR1BT?=
 =?utf-8?B?TjgvQjRwT0RyYTNNT2htMW9hVVM2Qkp3dFc2TkwvQnFZSVNrWWRlTlkvL2x3?=
 =?utf-8?B?bVBKazBxc08zOWdGUlpBUmJOU0oyVUJYY01KTDZiTzJxR2RraXV1TURDY2Yx?=
 =?utf-8?B?d0ZrQjdSaEVXVVU2cTExME5RZURyTjc5TWt2OTBZMDRHclUyT25SWkFOQ0k3?=
 =?utf-8?B?L3g5dmxTcHkyY3JFYzlOS3hVYjE4VTdDUHB3dGpqNXI1OXVZZldMazI4RDQx?=
 =?utf-8?B?a2ZQdW9nLy9pRzB4NWRJNW9JMlRCVDNmaTFTek11REpna2RFRCtRUEZ4b1dJ?=
 =?utf-8?B?QWRPTXRXQ0UyOG1kZzFMQWlzdGVTMXN4dlcycndoSU1mVEdvMWI3YVRTV2dY?=
 =?utf-8?B?dWU5QzI2MHV5Q281L0I2Ly9HNHdVYXhtT1J4OEFINmlHT1VJS3dlYTNoZmhi?=
 =?utf-8?B?WjVZNHprLy9KYTlxZEJqelRjRzRWb2xGQmRZUytDY1AwV2l1MzdPV1FNbmpQ?=
 =?utf-8?B?ZjRMS0Q4WmVReGhBUU1rRU94NzhOVXprRmRtTU5SOWsvYno2VDRpMFVmbFFC?=
 =?utf-8?B?dFYwV3FvdWp5VEdJUWlGeHdZOWZsamJ6SmxXanAyNHVGdUF1R3djYnE1c3lt?=
 =?utf-8?B?Rzc0aml6T3k4bDBCNVlEd05RditKREd5bC8yYThIL3hRK3dNdTFwRkRZVy9p?=
 =?utf-8?B?KzJ6RFRmMDF6ZnF5SHJ6K3Uzb0RudEQvY3VmQStRaENGRWpVaHplcHZ6RlNn?=
 =?utf-8?B?cVpwYnh1Z2t2NlJ1UGFURVJDWnJpRnZaTWp5dU9xWXk0b3BCYjdHRUF2OW9E?=
 =?utf-8?B?Z0RQN1V5ZXJndTJYQ2EwUVd1YWVjbmw4SWFTTWtpclFPMWZKeG1ucGJNT01N?=
 =?utf-8?B?QnJVUnNpM3NuUS92V0c2UXVlbFRkakNma2dFQ3dwY3picVZLSW1CTE9KTTAz?=
 =?utf-8?B?cHhyMENsaG1zYmFCZHF5WWxYSEZzNkhnM2lMZkFSRUx3bEMzeDk1cklaY0dI?=
 =?utf-8?B?VXg1S1ZQSWVoNzF3bHM2blUvcHRGWHU0cGhyUnc5dWVFZWhOazhDak9zeWFI?=
 =?utf-8?B?dlFjcHFQU1dLY05pUmpaaXhpNm9iRjlrbWUrNEVjLzVTaS9LZCtyalZRNmJL?=
 =?utf-8?B?RklsOUN3cW4wRE03TDQ2N0lGYzNPOEtVWDM5VjJUQXJ6VFA4emFFMS9aZE5r?=
 =?utf-8?B?NWhKRXFJYTNhTUtHeWlDRXlhekFSbW4zRHBSZFF1ZGh2THBITWFadEcvR1V3?=
 =?utf-8?B?RmMxdFkvVUxydWFMUmFIb0ZwVHZKQVJhZVlLMW9WbWNWdS9mMENMbHRxemJp?=
 =?utf-8?B?NlVlRy91cTRsTE5SRU14MlhWM3h4MG5iV1pjMTJ3S0ZOOEt5Uk5YODJ2NS9S?=
 =?utf-8?Q?4ZbxE+jzudY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmVPdzUrNzROTFlYS0kwZnJ1S0FVVmJHdWw0YUtuUWNHYWNKRlNvOGtHeFhj?=
 =?utf-8?B?OWdrL25YRzVud1VSRm9RcEVLWTJZTGNhMkFHY2loMnFBK0NmOTN0OVJiMkRQ?=
 =?utf-8?B?VmVVT3RHb0JoaHl5VG1nQWlJUzJRa2xtMUNGY0RwWDBEY0RiZnpDRjgxYnRo?=
 =?utf-8?B?RTJwQUJHUFlXbm5GNzZHK2lGalF5bnIySDk1elZ2VlRkU2RuOER1eEhyY0lt?=
 =?utf-8?B?MmdkR2RPSXp5YlBhc3I2OGNKS01KT3B1QTVEM3Fja0FJWXZvUzF2dm9aSFFH?=
 =?utf-8?B?UWlMVUxFcG16NXJDRkQzZXJqSFk0bXlhNm45dnJseWlOMHF1bW9lSFd5bzAz?=
 =?utf-8?B?b2NuaEJqYmJLbXNSaEdPb0hZVnlxYzdPV0NBeTYwekFEOTBPZEtPMHl1UjA5?=
 =?utf-8?B?bnZUUXBUVkw4TmRvZHJUazVZZGkyZ3dQdm40TVYyWVFtM1UxNHc1TzRKR3Y0?=
 =?utf-8?B?ejNScUliaVJYVHQ2WGJoeDRuWHZyRnVyOUhxMGdwWUZ5QWFzWlRYWHZWSkdI?=
 =?utf-8?B?eFZvUmJKQUNSOExKb2FDUVFQM2NvaTB3bHdnRSt0NHBiMHFZMlZ0MW02R01q?=
 =?utf-8?B?TFlHQzlKV1lLcXlpbEcyZzhPV1Q2ZUJoZGFtWlpzeVBXQ2R4UlhpQzR4UVlp?=
 =?utf-8?B?YkFUd1hoTjZuVXB4N0FDK29GRVBKRVdSQ1d4UWhlZnp3NXRJZkptSWp3cVFq?=
 =?utf-8?B?NGxjQ2ZnMFdaVHBQQU1OUzZnZElMdmI0bjRRbkFFaHdyY1lOSVNMMnEwYVQ5?=
 =?utf-8?B?NGZ0Z241VW5POU8yUUt0TnB0bmwzTSs0ZkM4a3B5Lzhablp2K3FJaDFuVVk2?=
 =?utf-8?B?ejhuNTd4VXlWY280di9LbU1qcFBGNEd4bkZwc2ZVTEJvVnMrWkp0SUJqYVZz?=
 =?utf-8?B?Y1dZWVVoTkFmUklLQXZ0S1dEMTdibmJDQTdiQ3pWbUxuTVNFMjdNU0NvazVl?=
 =?utf-8?B?NlY2RDJtWUdvakxVUWZYakVpMDY2dUJ0Qmx4WHpVbkc4QnJjMHBlenh1R0VS?=
 =?utf-8?B?RXVpd05BaVVvZG9maU1iNk9sNG8wSEhBMTFoejh4bUZaMzhSWllaS0pRRVBN?=
 =?utf-8?B?WUJBOE5iUTQ3UGVjOU1oWlZVaXZjWXc0ay9uUWl3R1ZhTE9qaXo5UTVYMUZT?=
 =?utf-8?B?NmZxd1luRG5rajRBSWhMeElnbUhxVjZTZnRDamNycDBGdnJNZVgveEZmV2dV?=
 =?utf-8?B?bm9kWUZHT2QrV0cwbGNFVW9NblRJREhrSWwvOVdGY2I2VWMvTmJXNDdCQVJm?=
 =?utf-8?B?TkhwRzUwclhMSGxNQ2o4bjBBalpTNWFtVjFjQmo2TUNJd3dWWjAvWHZQcitG?=
 =?utf-8?B?MFpyd3ZrL3ZvbGR0YWZPQ2xBdlZRQWExN3JyZzJoVEFyWWZMbmVQcXRjRXBi?=
 =?utf-8?B?b3U3REd3dUlrMHY2eG44ZVFxQkVNNFVaaHAwSmdaVWdKOG1QbXV6Y1ZJNWNJ?=
 =?utf-8?B?ZUFJWkFyeitDZVVYaTNQZ3ZEUkVpWmphNzllQzU5aTA4RHU2L1BBcE9Hd0U4?=
 =?utf-8?B?VkpneWJYbVJ6ODZycVEvVUw3ZDVZSGlqeThveUZoUVNlNDUrZVpCbnZKNUdn?=
 =?utf-8?B?OWI3NFJ6ZjZ0VjlCOGpzS3FhbUxwbVJLczVuS3hiQ3dSMm04RWNvY1B2bUth?=
 =?utf-8?B?YTI5U3MzeDhZNEVOdDJ2TDQyM0U0SnVpQU4zUnpPWkNoelRZWG9xL0ZhKzJU?=
 =?utf-8?B?SXVhWmVDcGRQT2FTbXU0ZGxzUW5NbndiYkV6S3ZFWEUreUFsTi90bE8wYkJS?=
 =?utf-8?B?NWI5ZEw5MmFnaTA5RzE4YjNBMlNkUUdocnFLM29uT1M0S0NvL3ZmNUFHUFFP?=
 =?utf-8?B?QU5HMFJ5N254a01qd0JORmlBYm9DVXQ3TDNRQWlRMUFTRU1sV1ZQRFFaUlBt?=
 =?utf-8?B?cURDMnNHK3dnM3lkbUVJektzNzN4cTdZQXFHVnc3bEQzK1FmUVVBUmF2Z0hJ?=
 =?utf-8?B?WmJaSlQyS2dsb2tHUDJuNHRtVlVmT2dhZm9vQTgvdU92Y0VuNUlsT3hmNUNy?=
 =?utf-8?B?cWNMS05GdVUyNlpvV3c4T1hmZktxVmhrdFRxNDZiL2gzejBmdmg2alRBbTRL?=
 =?utf-8?B?Y2pQYUYxR1lrVkQ2ZFdRMmxPV0NBejJYbDBJN0RSZ2F3aytMYm9DYmFDZUVz?=
 =?utf-8?Q?vFp7tKhLh9yMVRp/8hNSwZwj9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0be8c85-f0c9-4a22-95ff-08dd9e089ffa
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:56:43.8997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkjHyaSLm0zqg3NAyztJw4rt7uCJNh2el0jhsnRrE/1XmcFfuhBFnO61ppwqUKZl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF28614436A

Hi Reinette,

On 5/22/2025 4:02 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> shortlog: "at domain" -> "per domain"?
> 
Sure.

> On 5/15/25 3:51 PM, Babu Moger wrote:
>> In mbm_cntr_assign mode hardware counters are assigned/unassigned to an
>> MBM event of a monitor group. Hardware counters are assigned/unassigned
>> at monitoring domain level.
>>
>> Manage a monitoring domain's hardware counters using a per monitoring
>> domain array of struct mbm_cntr_cfg that is indexed by the hardware
>> counter ID. A hardware counter's configuration contains the MBM event
>> ID and points to the monitoring group that it is assigned to, with a
>> NULL pointer meaning that the hardware counter is available for assignment.
>>
>> There is no direct way to determine which hardware counters are assigned
>> to a particular monitoring group. Check every entry of every hardware
>> counter configuration array in every monitoring domain to query which
>> MBM events of a monitoring group is tracked by hardware. Such queries are
>> acceptable because of a very small number of assignable counters (32
>> to 64).
>>
>> Suggested-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v13: Resolved conflicts caused by the recent FS/ARCH code restructure.
>>       The files monitor.c/rdtgroup.c have been split between FS and ARCH directories.
>>
>> v12: Fixed the struct mbm_cntr_cfg code documentation.
>>       Removed few strange charactors in changelog.
>>       Added the counter range for better understanding.
>>       Moved the struct mbm_cntr_cfg definition to resctrl/internal.h as
>>       suggested by James.
>>
>> v11: Refined the change log based on Reinette's feedback.
>>       Fixed few style issues.
>>
>> v10: Patch changed completely to handle the counters at domain level.
>>       https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
>>       Removed Reviewed-by tag.
>>       Did not see the need to add cntr_id in mbm_state structure. Not used in the code.
>>
>> v9: Added Reviewed-by tag. No other changes.
>>
>> v8: Minor commit message changes.
>>
>> v7: Added check mbm_cntr_assignable for allocating bitmap mbm_cntr_map
>>
>> v6: New patch to add domain level assignment.
>> ---
>>   fs/resctrl/rdtgroup.c   | 11 +++++++++++
>>   include/linux/resctrl.h | 16 ++++++++++++++++
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 51f8f8d3ccbc..e2005fc9acd9 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -4085,6 +4085,7 @@ static void rdtgroup_setup_default(void)
>>   
>>   static void domain_destroy_mon_state(struct rdt_mon_domain *d)
>>   {
>> +	kfree(d->cntr_cfg);
>>   	bitmap_free(d->rmid_busy_llc);
>>   	kfree(d->mbm_total);
>>   	kfree(d->mbm_local);
>> @@ -4171,6 +4172,16 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
>>   			return -ENOMEM;
>>   		}
>>   	}
>> +	if (resctrl_is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
>> +		tsize = sizeof(*d->cntr_cfg);
>> +		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
>> +		if (!d->cntr_cfg) {
>> +			bitmap_free(d->rmid_busy_llc);
>> +			kfree(d->mbm_total);
>> +			kfree(d->mbm_local);
>> +			return -ENOMEM;
>> +		}
>> +	}
>>   
>>   	return 0;
>>   }
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index bdb264875ef6..d77981d1fcb9 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -156,6 +156,20 @@ struct rdt_ctrl_domain {
>>   	u32				*mbps_val;
>>   };
>>   
>> +/**
>> + * struct mbm_cntr_cfg - Assignable counter configuration
>> + * @evtid:		MBM event to which the counter is assigned. Only valid
>> + *			if @rdtgroup is not NULL.
>> + * @evt_cfg:		Event configuration value.
> 
> @evt_cfg is not introduced in changelog nor defined here. Please add a snippet here
> on what @evt_cfg's values represent. This is important since this is exposed
> as resctrl fs API to architectures so all architectures need to use same values when
> interacting with resctrl.

Sure.

@evt_cfg: A value that represents memory transactions (e.g., reads, 
writes, etc.).

> 
>> + * @rdtgrp:		resctrl group assigned to the counter. NULL if the
>> + *			counter is free.
>> + */
>> +struct mbm_cntr_cfg {
>> +	enum resctrl_event_id   evtid;
>> +	u32                     evt_cfg;
>> +	struct rdtgroup         *rdtgrp;
> 
> Please align struct member names using TABs.

Sure.

> 
>> +};
>> +
>>   /**
>>    * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
>>    * @hdr:		common header for different domain types
>> @@ -167,6 +181,7 @@ struct rdt_ctrl_domain {
>>    * @cqm_limbo:		worker to periodically read CQM h/w counters
>>    * @mbm_work_cpu:	worker CPU for MBM h/w counters
>>    * @cqm_work_cpu:	worker CPU for CQM h/w counters
>> + * @cntr_cfg:		assignable counters configuration
> 
> "array of assignable counters' configuration (indexed by counter ID)"

Sure.

> 
>>    */
>>   struct rdt_mon_domain {
>>   	struct rdt_domain_hdr		hdr;
>> @@ -178,6 +193,7 @@ struct rdt_mon_domain {
>>   	struct delayed_work		cqm_limbo;
>>   	int				mbm_work_cpu;
>>   	int				cqm_work_cpu;
>> +	struct mbm_cntr_cfg		*cntr_cfg;
>>   };
>>   
>>   /**
> 
> Reinette
> 

thanks
Babu
