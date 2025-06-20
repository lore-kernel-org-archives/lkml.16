Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3452A238C16;
	Fri, 20 Jun 2025 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750456670; cv=fail; b=Kf76QmHDCdiW0wvPItF+8744AlKyFZOS19W1oTkU1DUHa0/pVxG7sQNtT0ZFYEjvQ7lmezTJkPTSR0MrpBGlQGehELLMDd0ncgjwZVSFQ3ADL+ZH6Hanf8Ogjw97ZqYj/knBaWSGR1MVF+Kf6jrip2Z/tm303YsFCSskPT4hLZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750456670; c=relaxed/simple;
	bh=ztpa/e9cfF4HxQSCelQ9uXEgouJ6iPT3eYyVKAf43pU=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lVsFUeF1PHlj3JIxqs4Nq3eWjqJuBOc+azLwGHKimkfaBm2dV1sjTOlACVOeey7CJvwUT3okaoDxBRyAmq4KqGEr2mgtCYV610q/J6q7yIGOwTjNHNIcBiNYvvry/3+KFewTXE8pvLby42U/lfapdzp4usIiNyJTcpsWZs4vrcc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EdINCbHM; arc=fail smtp.client-ip=40.107.220.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EdINCbHM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTemnMpjczmPKdYIHUftbB2DLtomBEmtMTMdaddmLMos6G3Jlw6smNDXb2Z8suvjcv7gv+CMP2qprVSwUly98HWtLhMA+of6A8V5U61z92asVh3ETlsGN5O7pJlRvwDRgXkhTXocpfXGjKbXdXdgMXgX/iJoYaMbjt4uyA3UR/XAn6OzmGtpoZP9ccCU4YJDxfgQjle9efUsSyGaMoibWWy59bpEO7/wlOe7F+730K8uTthaRCBTTi4BwAU1yECsws9ZKuhdVcZvJKgftoXgbH1/iB+7RSDocoCxz3TZOP2FcgHrNgJZgNbWyjDdJKCZ5IeEtD09XMmd0oMON4yl/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZepC1goUVo/ab/u9cev2NZMPd41RkTmsvYWIeE7VBY=;
 b=YuzgGwpcCQyZKa0sU58MHk6vWDp/YJ+2tqVfVJyudyobJq7f1MHLaynUvUMygk0Hx9mnNnhAATrMzPwJXFSm2tPYr2DmW1e3MYHxhROaOpUoOxkN+vwte0ofyBYtipnVMO0cbMZEurK2i31KaVg5VCvFSwvW17LHeV0+tmS64CSd7EYhamQhraN/Ef0wJlzHaMqDS2muw3+xLwZP58l0HG4t4iVPaHu+4kJLuIYifZWHELBRCrPn9/8MjDC7hgFtSgdh7bYbL2w0gmf+dE0Cq6g0hLhav1EU+4VNRsPgdimGQHXon6xUJ1+fRB6MqXOG6qcLs8dp84AYkkHmRBUhWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZepC1goUVo/ab/u9cev2NZMPd41RkTmsvYWIeE7VBY=;
 b=EdINCbHMBt08vu4U2y3N1axj1NdKqx+qVvoCrodRU8KgQ7h3Syl76vvIJvrxcNtp4gM9NspLVptxChwMK2sSkxchHazoYuzKh/8yRvz0QYMYLeggiKX4LLtshvhYeS4e1cIZTIsirPfE7TKXgST9E2742hEY6shpNfCNqqY8jQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Fri, 20 Jun
 2025 21:57:47 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8835.026; Fri, 20 Jun 2025
 21:57:46 +0000
Message-ID: <659b7776-573a-43bb-9ea9-cf957af25238@amd.com>
Date: Fri, 20 Jun 2025 16:57:41 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <bmoger@amd.com>
Subject: Re: [PATCH v6 6/8] fs/resctrl: Introduce interface to display
 io_alloc CBMs
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
 <16cebf7069e11e07c0d9e343aa72363325befafd.1749677012.git.babu.moger@amd.com>
 <6870a52c-4594-4ec0-aa56-1bf9e1fadeb0@intel.com>
Content-Language: en-US
In-Reply-To: <6870a52c-4594-4ec0-aa56-1bf9e1fadeb0@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0166.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::10) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: d59f9fc5-b9cd-47c5-e3f1-08ddb0457dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZkR2YytPM21yVFMvRTU1RGg3a2g2Z3RraDk4bE5EM2lUM1NSNmRmTDVGYW40?=
 =?utf-8?B?bzFudXAzVzhzaFZNS3dmalJ3b1JrL2pVa2VVTXNwODJOL2xSbHV4andNdWhK?=
 =?utf-8?B?SDQ1S3JGY0F1LzQvLzZtN0RqR2NOcFVNbWpwdnhIeXpzT3ZoWC9nbmtjOGhB?=
 =?utf-8?B?ZTFRM3NRbXB6ZUhTTHE4ODhzK1dWWWFBQ1JyOUFiRWxmSWIvaXZjdkxWZ1Ni?=
 =?utf-8?B?YlYvaTUxMjdlRy9jM25MYk5IV1BxK2xNMkszS3VpVlBreTJZVnpVZmpocFNp?=
 =?utf-8?B?RXBpODdNMTgyVWJkOU0xaDEybm9xMjEyMkF0RHpOY3gzbzNKSGc3MkxZSmxm?=
 =?utf-8?B?cGhXdGVuRlBzdzhYeGw3YlR5VTRMcytaTStjeFVGNmg1Ly9mWm1vR0lCang1?=
 =?utf-8?B?akpQRGtDSTZRZWMrbEphZzRLMFF3ZU5yd3ZFUFJabFhOR1Jrbkd0RnpWdmxu?=
 =?utf-8?B?NFdEZXNaTnJMNDNzRTJIM3QvRmNWcGtReVlZeW1qcm1XQnU1dXNSNjB3V2pl?=
 =?utf-8?B?b0VIeUo5NkgwY3VFQkdKeGhIR0owdmhEVkh0NzNCTWU4enJYd2VkQ3dEK3Va?=
 =?utf-8?B?aG9HUW82allKTzZ4b2dyVSt6TlhmNmNYczl4eU94MnJFenhhSFdoeWk3VHl6?=
 =?utf-8?B?OTB3NUZTY0pEemxBdndpSmtsdlhGUE5JbE8ydGptMUx6dngvR0xkSCsvTllM?=
 =?utf-8?B?TXlTK3hhQllwQ1VsZENXdFlIeXZrdWZKOFZiQkdPUEkwQXh4clFUdm9mRjk0?=
 =?utf-8?B?SkFXZ2lWaTVLSURMQXJSSkxGV29HamVVQVB5WDE0MS8yQUpqYU8vdEU3Vm1H?=
 =?utf-8?B?dExna2hMMUJkYk1POHFsbjJ4RHZ3UzhnWEVUVFQ2OVlJb3puakVqZEhGRWVN?=
 =?utf-8?B?ZDk4Q2ZHU2x5RlMxRXFPSm9xVTJTQ1VIU3QrTHdSaEMwRVMzS0doalZpb09m?=
 =?utf-8?B?ZWs5VkhXbEJSYTZLeVhNSVdTeGFEbGFvcVB5Rno4R29yQ1dZZytXTTc4KzNw?=
 =?utf-8?B?RGJTUGxRN0FYWG0vdHFuZTlDNWlPVTR2ZG1WUVhOcGpLYkIrVmRFanl2Q1lN?=
 =?utf-8?B?MDZDNEZDUnU1VkZGTU43UGtET1RUYnBnY25TeVdHVmh3cjdCNUpoY1FnUlhN?=
 =?utf-8?B?WUIwUDhjQURxUGIwTGhaSmJ0REs4VEZ2dTFaUmIyaXVjcG5DbVQ3RjFCa0F1?=
 =?utf-8?B?NHRsSkpsMGhJazNWK05FRVJ6dDJWb1dZak54ZVFHelUzWmZIZ1hCcHVTWDNL?=
 =?utf-8?B?K1AvWVp2ZE40elpRVEtBZk9LdTBxdlpNV3hrclhsbnNNaG1sMkNqMHp0TFZS?=
 =?utf-8?B?UUYvUHA2YjA3bXByRDEwbEt5MlljU1d1Z0JtOGhIVTEwMnV6UEoxN2orcklL?=
 =?utf-8?B?cCs0OGM5U2tlcjA1aGxRWXZQaFV4V2FsTEVaMEREV0VjQ2tjVmoxLzJqSmVr?=
 =?utf-8?B?NVRPM1Z3VmR2MkFFNnB4R0kyZEx3Q2NIWnZUZldHd1lYaWVxOG4yQ01ya1U3?=
 =?utf-8?B?d2w4SzRmSjNCUFhxQUdPMm1BblRhMFpsWHpTWDdLVmI1akhla2MzcnFIUTVJ?=
 =?utf-8?B?SDV3d216SVNKL3ZBM2lrcC9MUjNvTE05U0dWTVY5RTZEb21QeHVldjNDTHRW?=
 =?utf-8?B?aWNwdTNvR3dnK0lVNzVvS09ReUg4WW1obW9YeW5zWlF2SDdFNXhtSHV4YnE2?=
 =?utf-8?B?aVArcDNsTkFHaTV6bFU0cVZ0aFJ2YnZkUVFoaUFpamtMTlR6Z2dFM1dBaDh0?=
 =?utf-8?B?WkFrZ2NPTkk4UE1lSGtRb2FDa3haTWRiL1JKeWdXT3hKVFcvYVJldmVYcWd3?=
 =?utf-8?B?QU56dmxMZWtUWS9EVmdNTTU3d216aDd1bWE1NjBaZnZjc1BITXZ3dEFBeFdt?=
 =?utf-8?B?UUx6akVYeXF1aWpmcFVoSkZkWUF1TFBNemFaRE0zbHUydG1sd21TMGZmU2dl?=
 =?utf-8?B?Z0N6aW9paHBQNWVBM2JBN2hRdEtadWxJMnpsaXdPeXloSkZ2NTJFbDEvSzBu?=
 =?utf-8?B?Y1dITFBjQytBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU9GK1c4YVFCUUFGcGpOa0lBMDBqeUtGZ21pdmhmUU51bXRIRnROMU45ajZN?=
 =?utf-8?B?ajNKV3dEWS9YZ0hONTczMGhiaEs3UVhCSVJ1cEl5WllpQ0tNaFF0TW9lVkJl?=
 =?utf-8?B?VnZERlZJRHYrTk1kMVFzME9OTktKL1hRSEl2MDNuYWZQZHl6UWtWSmhEZEJs?=
 =?utf-8?B?c0RMdExkbkxFYURPd21FbFVHS2xQNHhqVDJUVC9nTklxWGdUbmNtSmxqdE81?=
 =?utf-8?B?Q3ZrVXF5MnlqcUhsbkVKb0R2RkJreHFyQkNmdlB6VUl0U3JFUzRoS0xhQXZn?=
 =?utf-8?B?K3g5MVRBY2hKdFNxTUpub2FXVS81NXpkZm1TTjJMUGRxRTNjSmFEaXVWNHdl?=
 =?utf-8?B?UU1HUmpFN1dua09ZNlhvVExNcnhhUzFTaXR2ZGR3eS85cU9ORlN6VjBXRjQx?=
 =?utf-8?B?a09VYjM2SEszMzFjc25selJ1UXJhVFczWE5zeEx0dTBsZVVZbmN3TlhUcFVr?=
 =?utf-8?B?MWNCeVNwVUxoQVN4b1dhTEFUVFpWcURZRk80UVF4T2NaOWtMSzhGQkE2T0dm?=
 =?utf-8?B?MTlDR0JDakFWZ1p2ZmcxblRvSFRXT2tScFBCNXN2dG1yMi9LdlptSGZuQ2Nu?=
 =?utf-8?B?MDFHV2FIcXJ4WTdJNjVFeFZLRVlCRmJKSFhtdnp6ZExhY1JnNnRIUFBpK29r?=
 =?utf-8?B?cnJmaTVmYjRDNm9URjZjeGtpa0J4TkNnSHcrejRTZUprVVVWU3pXVTVRblpK?=
 =?utf-8?B?NnB4NlRyVDEyY0UxdlE1TzA4WG9LZnNBTEdMaGRIRklucVNzVHo3ajRTQkQr?=
 =?utf-8?B?V3J3Smg4TCtzdXJSTTV1THF0RHZHQlN0d2kvMWFyR3hmWHhQamw2eW92ekt2?=
 =?utf-8?B?NTFHN3ptSzQvc3RnaGI0M2tUamJUN3lkZTdkdDBLMWdNb3ZwS0kwREFmamxL?=
 =?utf-8?B?WWFMdnJtdWRrTnMranlCdlB0amlodVJvRlB1a3NyekNYOFBBam16L0lmUGlH?=
 =?utf-8?B?cE1VWjR4ZFFmTmc1WU5BY3lsaWREeXpISGhlNDRFQmE2dmN1ZGdLdm4veVNR?=
 =?utf-8?B?L3hWazBCTDZ6SVpQMHlvejc4L1kyd3k2NGhtSmZyTW9nY1BibnZTWmxLR2xI?=
 =?utf-8?B?NVBtc3BRRFhIRytsRXFmYkdOd253N2JvNnpDTEVpY29IUUF4TFc5b2tDcEhJ?=
 =?utf-8?B?elRtN3pLRldhY09jN0lwajVwTkJxSWhIWHZ4TExPdWh0V25FamhVWWN5aTFy?=
 =?utf-8?B?Z3IvRitwVStDL2VUMzlDUDdvdytZM3ZuVXRrRXhVZkNxanEvTUdNQmZLUUhF?=
 =?utf-8?B?ZUJGbXlkbEMxTjUrRXhnYjh1b2RxTGpwSG1lWXBycU50VVhIU1NBckpjRGtv?=
 =?utf-8?B?eXhRRE1Za3FjbFYwcHpXRlY5WkVxZzd3OGdZMXRvRk5lS3libHJGZzdWM2VV?=
 =?utf-8?B?cGFRc3M3K2hlM2Q1VU9Vb0JYNTRmNElKTEQ1dG9pWXZ5K0FQOHpLdEtkMVFs?=
 =?utf-8?B?ZWtkNlNxSXkyb0JjeVpUSXpKb1FLREFqTU5qTWtYTkZKbWxPbFZKRk9IQW9L?=
 =?utf-8?B?a0xXQjJtSUhKa3FUT1R4dVJDUDN4STFKS0JHYVBoeHA2aldXSWNLdURNc2x5?=
 =?utf-8?B?U24wTHhaMnVkS1BaOTZIMHNxdHFEaGN1ZW83akphUUQvZE9iSTQyNktFNFZk?=
 =?utf-8?B?Qm5MVTVRRmRXZmc4OUMzL254K1BMcEpyNldiUm43d3orQU0zblNWcy9TMXJT?=
 =?utf-8?B?ZXBJSnpIV0tReUdoN0grQ0xPRk5lT1hGdGJYZVFtbzgwRlZZY2FwUlg1NjJq?=
 =?utf-8?B?cTdUdjAwd3o1WFdZdTVxaUdGR3RPZFpIOTc0L210ellyY252SkVrbjJIdHBt?=
 =?utf-8?B?SUgzRkM3YmY3MTFPY3loWjJQam16UE5mTXdPU1ZSMlI5a2hvTWx0Sm9ybnhC?=
 =?utf-8?B?R0ltSVBORXNTcm5xdnJFQmpCUXNzdkhVRE5rMXNOVDlZazNtdk9Ea28wOE5x?=
 =?utf-8?B?VWpOVElFR2EyaU1weldBUllFNjhYSEZ3aUtrQTA0akxyY2NHWjlvTXNVeC9F?=
 =?utf-8?B?VjcvRjZQeklUSnlMWHFGWFZJUTJZTGFwWC9pSnBPYmlzdVBLMm9abjk1STZ0?=
 =?utf-8?B?empydkhDK0xXa0s5TkJCaVU1cCtwS2xJUFRjOHlpSVFIVkVuMk5USEtNS0tD?=
 =?utf-8?Q?Ih2A=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d59f9fc5-b9cd-47c5-e3f1-08ddb0457dd1
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 21:57:46.8967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YwVkU0f/NGyt1YkNy4Cgx+49CwlTt/jg+WYg0y4bjUpvdQ+8yC4Liu+BXDEBp/J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104

Hi Reinette,

On 6/17/2025 11:01 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/11/25 2:23 PM, Babu Moger wrote:
>> The io_alloc feature in resctrl enables system software to configure
>> the portion of the L3 cache allocated for I/O traffic.
> 
> Drop L3?

Sure.


>>
>> Add the interface to display CBMs (Capacity Bit Mask) of io_alloc
>> feature.
> 
> After the fs/arch split it is not always obvious what is meant with
> "interface" ... it could be new API between fs and arch or it could be
> new resctrl file.
> This can be specific:
> 	Add "io_alloc_cbm" resctrl file to display ...
> 

Sure.

>>
>> The CBM interface file io_alloc_cbm will reside in the info directory
>> (e.g., /sys/fs/resctrl/info/L3/). Displaying the resource name is not
>> necessary. Pass the resource name to show_doms() and print it only if
>> the name is valid. For io_alloc, pass NULL to suppress printing the
>> resource name.
>>
>> When CDP is enabled, io_alloc routes traffic using the highest CLOSID
>> associated with an L3CODE resource. However, CBMs can be accessed via
>> either L3CODE or L3DATA resources.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>   Documentation/filesystems/resctrl.rst | 13 +++++++
>>   fs/resctrl/ctrlmondata.c              |  8 +++--
>>   fs/resctrl/internal.h                 |  2 ++
>>   fs/resctrl/rdtgroup.c                 | 51 ++++++++++++++++++++++++++-
>>   4 files changed, 70 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 03c829b2c276..b31748ec8c61 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -169,6 +169,19 @@ related to allocation:
>>   		When CDP is enabled, io_alloc routes I/O traffic using the highest
>>   		CLOSID allocated for the instruction cache (L3CODE).
>>   
>> +"io_alloc_cbm":
>> +		Capacity Bit Masks (CBMs) available to supported IO devices which
>> +		can directly insert cache lines in L3 which can help to reduce the
> 
> "CBMs that describe the portions of cache instances to which I/O traffic
> from supported IO devices are routed."

Sure.


> Please check ...  there seems to be some inconsistency in "IO" vs "I/O" use.

Changed to "I/O" in all the places.

> 
> Also consider something like,
> "When CDP is enabled "io_alloc_cbm" associated with the DATA
>   and CODE resources may reflect the same values. For example, values read from
>   and written to /sys/fs/resctrl/info/L3DATA/io_alloc_cbm may be reflected by
>   /sys/fs/resctrl/info/L3CODE/io_alloc_cbm and vice versa."
> What do you think?

Looks  good.

> 
>> +		latency. CBMs are displayed in the following format:
>> +
>> +			<cache_id0>=<cbm>;<cache_id1>=<cbm>;...
>> +
>> +		Example::
>> +
>> +			# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
>> +			0=ffff;1=ffff
>> +
>> +
>>   Memory bandwidth(MB) subdirectory contains the following files
>>   with respect to allocation:
>>   
>> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
>> index 6ed2dfd4dbbd..ea039852569a 100644
>> --- a/fs/resctrl/ctrlmondata.c
>> +++ b/fs/resctrl/ctrlmondata.c
>> @@ -381,7 +381,8 @@ ssize_t rdtgroup_schemata_write(struct kernfs_open_file *of,
>>   	return ret ?: nbytes;
>>   }
>>   
>> -static void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid)
>> +void show_doms(struct seq_file *s, struct resctrl_schema *schema, char *resource_name,
>> +	       int closid)
>>   {
>>   	struct rdt_resource *r = schema->res;
>>   	struct rdt_ctrl_domain *dom;
>> @@ -391,7 +392,8 @@ static void show_doms(struct seq_file *s, struct resctrl_schema *schema, int clo
>>   	/* Walking r->domains, ensure it can't race with cpuhp */
>>   	lockdep_assert_cpus_held();
>>   
>> -	seq_printf(s, "%*s:", max_name_width, schema->name);
>> +	if (resource_name)
>> +		seq_printf(s, "%*s:", max_name_width, resource_name);
>>   	list_for_each_entry(dom, &r->ctrl_domains, hdr.list) {
>>   		if (sep)
>>   			seq_puts(s, ";");
>> @@ -437,7 +439,7 @@ int rdtgroup_schemata_show(struct kernfs_open_file *of,
>>   			closid = rdtgrp->closid;
>>   			list_for_each_entry(schema, &resctrl_schema_all, list) {
>>   				if (closid < schema->num_closid)
>> -					show_doms(s, schema, closid);
>> +					show_doms(s, schema, schema->name, closid);
>>   			}
>>   		}
>>   	} else {
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 9a8cf6f11151..14f3697c1187 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -374,6 +374,8 @@ void rdt_staged_configs_clear(void);
>>   bool closid_allocated(unsigned int closid);
>>   
>>   int resctrl_find_cleanest_closid(void);
>> +void show_doms(struct seq_file *s, struct resctrl_schema *schema,
>> +	       char *name, int closid);
>>   
>>   #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>>   int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index bbc032b4d0e9..0c2d2cf4baa1 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -1997,6 +1997,46 @@ static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
>>   	return ret ?: nbytes;
>>   }
>>   
>> +static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
>> +				     struct seq_file *seq, void *v)
>> +{
>> +	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
>> +	struct rdt_resource *r = s->res;
>> +	u32 io_alloc_closid;
>> +	int ret = 0;
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	rdt_last_cmd_clear();
>> +
>> +	if (!r->cache.io_alloc_capable) {
>> +		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
>> +		ret = -ENODEV;
>> +		goto cbm_show_out;
> 
> out_unlock
> 

Sure.

>> +	}
>> +
>> +	if (!resctrl_arch_get_io_alloc_enabled(r)) {
>> +		rdt_last_cmd_puts("io_alloc feature is not enabled\n");
>> +		ret = -EINVAL;
>> +		goto cbm_show_out;
>> +	}
>> +
>> +	io_alloc_closid = resctrl_io_alloc_closid_get(r);
>> +	if (io_alloc_closid < 0) {
> 
> Another example where io_alloc_closid must be valid thanks to earlier resctrl_arch_get_io_alloc_enabled(r).

Sure. Will remove this check.

> 
>> +		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
>> +		ret = -EINVAL;
>> +		goto cbm_show_out;
>> +	}
>> +
>> +	show_doms(seq, resctrl_schema_io_alloc(s), NULL, io_alloc_closid);
>> +
>> +cbm_show_out:
> 
> out_unlock ... to match rest of resctrl

sure.

> 
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +	return ret;
>> +}
>> +
>>   /* rdtgroup information files for one cache resource. */
>>   static struct rftype res_common_files[] = {
>>   	{
> 
> Reinette
> 

thanks
Babu
