Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B2321506C;
	Wed, 16 Apr 2025 17:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744824405; cv=fail; b=EVjFeJIwV294JKHQvMTjXs3m67l271SsWlZISChlQcS6pRSjygempr1tUXijHzk2CHzDHUV2vvzgcjW7Vz2oZlexEH40nZTjLGFhc+T37mTKwJ84ptTz5Q5DeZMBGcLDmnrUJCgc3MJQamtVDj2A/FRUYSHPEiLvVLVYwIv37hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744824405; c=relaxed/simple;
	bh=C47+k3eiSFwrDqTF7k4Hh72mLCMdRkWtM0tk7hAdJ/U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=InEfklL6RZ5k65gDs1UaJSBeZAajv1ZG4715y9ehUgyxcH/Ye42gH89kr4KuvC7XBcUkRz/nJETSm1h2SXAT0T2xu6GLNV7M1K/oa7WYtXagPF8UrqLbMzn954OR33FFJQY0eqVB7bc8hoWT93oYdS9wV2GaXkuQCvKPCsiImb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=m0Y6ij+W; arc=fail smtp.client-ip=40.107.93.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="m0Y6ij+W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmUbHbRHDPUjdgiheoAvTS0TPJllYqyMW0jp5y3P2FIl3ai7dlpyLX86/F5PJE8xQEjjuImrZerwSUZ4gNky37EJVqYpwqoLm+7B3TworlhN6qGi53XzkFgQsjbO60WJR0TTfUVD2LS6TDSqDCHMgSCWK2/AHnuSQVYH8NfECrzOfZP0zaN6FVIdTVjvMJGOvrnOour5dqodeERTq0V3LMVkzdzB9HXTQXcLqLOwvlPaquMCBo15d3TC0uTFXQkJgPkZZ2wwkRPQCG1SuLhNrRJLTHlKsHUaln8ToSBCxh/St4jhppEhQoxpeTzXwlhU8O/A2YfpurkNLxlb7eLlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ChKWGZMrS0qdTsyw2r4muQkD1Uc+WU/d8lgkByrWUI=;
 b=lO4gUTnCO/KslxslZQBZ9AlHcDfGpUcokNRiMtveUkuM8KPOKuMtrdAY+nBqeoTNA5HvRQwZ2QNKEcu305SkFNt29Bk378zvuBEsIWz8RQjqIfzDDwhRDPXjVsKhiWQhhOVwXrAQMvdN4KbPyIOOZ4eaMtmnBBeR7UxVcZKstWkm8ZQfbvq3Nz/cDM+RxiPY0tib/Xidl/MGo57GnHrzW8w9w1cVwR6dlODTJtn9alZCM6Zv50PmyQy91b9snWgzMyshia7dl+chHaJVZPX8UbM49iFvY4Uxx5wXDciBxxRktFNlFKswjWO9RLWah3jw7ULu2xMpGHYPUWDOBA1vQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ChKWGZMrS0qdTsyw2r4muQkD1Uc+WU/d8lgkByrWUI=;
 b=m0Y6ij+WKZK5Osdwcrv3qPR7WROY9KuGig/VzsaHrkpHscyo+w32bztzGLHZS4PSuHljQo1kaBBUJpeC7r29yi8zEo1ZU40fhNP6EfplIcDd8T6+WzDVlfD6HwxFRNIfZO9x4u0lYKBjgIDrkoKlXG0T1bw1PPSM6FRGjkkDPH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BL3PR12MB6428.namprd12.prod.outlook.com (2603:10b6:208:3b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 17:26:39 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 17:26:38 +0000
Message-ID: <108878e4-0ac2-4c8f-9bfd-900d65720213@amd.com>
Date: Wed, 16 Apr 2025 12:26:34 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 18/26] x86/resctrl: Add default MBM event
 configurations for mbm_cntr_assign mode
To: Reinette Chatre <reinette.chatre@intel.com>,
 "Luck, Tony" <tony.luck@intel.com>,
 "peternewman@google.com" <peternewman@google.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
 "paulmck@kernel.org" <paulmck@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "ardb@kernel.org" <ardb@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
 "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
 "alexandre.chartre@oracle.com" <alexandre.chartre@oracle.com>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "perry.yuan@amd.com" <perry.yuan@amd.com>,
 "seanjc@google.com" <seanjc@google.com>, "Huang, Kai" <kai.huang@intel.com>,
 "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "kan.liang@linux.intel.com" <kan.liang@linux.intel.com>,
 "Li, Xin3" <xin3.li@intel.com>, "ebiggers@google.com" <ebiggers@google.com>,
 "xin@zytor.com" <xin@zytor.com>, "Mehta, Sohil" <sohil.mehta@intel.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>,
 "Eranian, Stephane" <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <03cfb41a0b2538cb994fa0c5b0950b7280cf2eb7.1743725907.git.babu.moger@amd.com>
 <8c3aa9cd-335e-415d-a9d3-35593fdbe812@intel.com>
 <15852d2a-5a44-4d15-aecd-d28660a40a85@amd.com>
 <DS7PR11MB60771546582C59A917647239FCB22@DS7PR11MB6077.namprd11.prod.outlook.com>
 <d6079947-2538-4258-8b1d-1f7b18a628f6@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <d6079947-2538-4258-8b1d-1f7b18a628f6@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:806:130::13) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BL3PR12MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f3f9df-9169-4a29-8817-08dd7d0bd87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VU9MT1U4S0d4UUU4b0JqMEVtTHJGZmMxZUpUTloyYXMzcW1jcWVZenhzclVz?=
 =?utf-8?B?a1V3SXVDYy9FY3dha3lwOXRxRUlyZWM2cEQ3dlJHYWQ4ZVU4d3Q3OVZuVE9C?=
 =?utf-8?B?M3h2Z0NOVlh1OEg0a3pJRU5VbU93VHhqeVNFZVNSQUR0T3oxWHVITEczSWJS?=
 =?utf-8?B?dTBGbXBlYzBoKzVCdmE1dGVwd0I1OVp0N2dKZFFpZWYwQm10OGM4dk1QTHFW?=
 =?utf-8?B?Nml2L25YTGdJeGp3L0pEMWQ1WVFESnJRMm15K1FaVk1KbWc4bjZEcDhjYjND?=
 =?utf-8?B?dkV5TTVBUkRKbVpTK0VNOFRzQzU1OCtTMklmcnNVWWNxbi90bTloeXY3Zm1F?=
 =?utf-8?B?Z0h2MUU4Tzg0Z0hXaDlzZ09XNVpBeHl0cmtmWUhDbUptTnYvL1h0Mm5DckV3?=
 =?utf-8?B?VlVUWDYvODVDR0xnTUpwTEtRNG5OQTVwU091bEVYSEtPSldnbUxLdGdDSnVT?=
 =?utf-8?B?d3d6ZCtGblU4M3FOM3RFMllrakFQT0VFdmw0VVdpRHpaQ0NrOWZDLzQ4SWZQ?=
 =?utf-8?B?Uy91T0FzZkNzRHA0ekdrZlJrU2hNdDRHUUJNNzdocG1mV2diUmlRbHJjdFAx?=
 =?utf-8?B?OGZXb0VUMERHMnFjRC90ZlNpcXB3Nlg5djlMUzJBeTdGcG95V0t5bmUrVm44?=
 =?utf-8?B?YTJEVnBQeFYxbnAzaEJFeGNBeEw4b1lxdmVHWk1QVFpoZEhvTDRCMkh4bFJl?=
 =?utf-8?B?VlM1dzdDN0NGNG9lSHdSSUYxU1dzeWVWYk1EREpzME13d1ZqblU3ajhWcmc5?=
 =?utf-8?B?V0tpQ0VqRWVJdnBTRmJRS1B1Yms2RUxCemdxbXhYTG42bXpSWGNrS0xoYm4z?=
 =?utf-8?B?OGpFTXZ6N1J1Y3ZPMEsxYXFMdmdsYzZtaGhCU3c1N0YzaXdXQjFmUnZ4VkYz?=
 =?utf-8?B?aEw1U3hJSktjUUVqQUtQb0MxSytIa3dZNWg4UXM3ZzhDWkZ1RFAzUUVzTS9w?=
 =?utf-8?B?cDNvRUllU3Z5dzdZSGxGV3NQcEgrOHhzdjdWUlloY3NIZ3hmV3FGL1N6TCsw?=
 =?utf-8?B?ZXNJWTJsYStqVjAzdWtBZVlyWWEyQnoxSndBVW5EWHlzem03Kyszb3prNktX?=
 =?utf-8?B?N3dWZGs3aGNCUCtiNjFZVlZOYlVMN2ZRMFU3S3puVDZJblRQM0JGdE5TU0hM?=
 =?utf-8?B?dFJLUFlJUlJEM3FFRXh6VWlKeGx6bmlra2xVVTBMNzdVMUxvUms4NXovdGdq?=
 =?utf-8?B?dWVpLzZLUWRPcmMveW1HTUhTdnAzWnIvckhwRU0vTm5ubkdWd1JwYnZkcDNr?=
 =?utf-8?B?NVoxcEZNZEpEL2NwZW5wT3hYWEcxRzlJN2ZjMko1MWo3alo0OUtIYWtPS1BL?=
 =?utf-8?B?VStIdUZibG5ad0pIOUYwcDczYkhrR0NJeTIvZm4wUEFvZWVaLzBYd0NBbnl5?=
 =?utf-8?B?TFd1ck5FRWZrVm85Tit2cDJ0ci8wRHF4anE4d0o5aVVwbkFURDFzM3lHNWpz?=
 =?utf-8?B?TTFPQ1RQcHdidnZ0aWd3QURnZ2xWWkV6c1ZsNU1mWkpvSFk0cE92MUVWZUZP?=
 =?utf-8?B?U3k1UGFROU43M2NyUUxLNHVGRzFwTDIzMzNGNWpWUDlBTXJtd2VzSjdiV3gx?=
 =?utf-8?B?VWV6eERmSTB5a2RBa3pYRXVoTE5iKzdFOGlmelFTaWZQWEhyTlRFTkN2Mkw0?=
 =?utf-8?B?Mlg0MklpNyt1NjU5MVB4NGZqY1NhSlV1dzVudXZnSWxZb3hSdU8yN255dG8x?=
 =?utf-8?B?MDJCaWlrWU95NlJWQzdydmg3VWdSd0VZUWhYRjl0TGhCK25SUGI4ZXVad0tD?=
 =?utf-8?B?UWFEQnExWUlEcTJmNWluZG1HQWlBUWRWYlhXWlRST3pPNUhzbGZYSHZ0VGo4?=
 =?utf-8?B?R3M3SFR4R2NxYnNaWDVBTnN5RDUwQnhSNDRDVWZ1bUE3UGFMbXIvVDFIZWs3?=
 =?utf-8?B?ZkMxTzFiMkpZU09URXVUZmNYbjJLMVFMVjVUWi9QK243R2tFSmx1V0VQbTZ3?=
 =?utf-8?Q?PRJJ4kVfcFw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVJlSEdTY0ZTZGFuelErMkxIcS9OL1dFOHVzZ0U2T29mbVAxQzVEcVVJWXZC?=
 =?utf-8?B?eXlyOFBhdjNucVZsMjlrMEFuYzlKRldVVC9Ta1JvVlhwRWg5TWJFM0h0MUsr?=
 =?utf-8?B?MFRBVUZMZFJsM3lRbEQycDg4OEVxbE45YUYzWmcwZWxON3FNR2pLTUN5dXg2?=
 =?utf-8?B?OUVJNUZCNm8reEIxNitxU25vUHpTZGtoVnlnNlM2b3U0Z2I1VW5nWFMrS2hF?=
 =?utf-8?B?NHh4dlZMT0FvRDRFRnlrdTFmcEJObVF3c3pNUzlNRTBsb1JPVGlFOFI5cjc5?=
 =?utf-8?B?ek9SQ0ZEc0lrSFphWVdqOVNHeGpMZjdudkd6VFJCc3J1cjU2TUJJa2dtUS9k?=
 =?utf-8?B?TFlndWMvWnQ5ZUZ2SVc5Rm1RZVRlUXg5N3NQc2kwQmp6RURHRmdPOEVuUlRE?=
 =?utf-8?B?eENtdEtCUE9DMkZQb0owbGd2TjRmMzhvKzIvMzlDbWlnbTZvV2pGSGFqVlFs?=
 =?utf-8?B?NUE2OU5tMlQxZThQOGl5MWFYZkhYR2VVazk0ZDZsVGNPdVJJN29HVWd2dTZ2?=
 =?utf-8?B?K2lMY3JzRG5NR21OUnY3cXJrSnIwY0xadXBtZnBpYjBZRmFWclh2WjY4ODdl?=
 =?utf-8?B?OUxGWHdhSllVSmVQYi9Vd3NzbVJZQWNLT1dad3h3TWN4STZ3YlBURXdxN1pS?=
 =?utf-8?B?c3c0M2lyRnQvQko0ZDJYUjVHOExsQzEvRzBHZ2hxb2tFam5oeVJBeHJEWDBl?=
 =?utf-8?B?NzdVWlNwTzV4b210V1QweDB6YlR0UGNIOWhoY1o2aGtjV0NRMktUdHRsYVVw?=
 =?utf-8?B?SktFSnhRRzZTTHdGN0JWeUtUdjRyc3dPWW1tRXZrc25KOHhQSXVFbXBaWUlD?=
 =?utf-8?B?OUZLTGNPZzF0eW1MMkFIckh1NmVES1daL3B3S201d2xtbkFtMVZ1RnBRSTFa?=
 =?utf-8?B?czFPNEI2L2kxenpHRGs1U0ZwWVVuWlFOamhObmlVdkE5cTRyY0tnbmpaWTYv?=
 =?utf-8?B?NHhFa2xhTjR5UkFnMWxvcWZZc1dVU2FZQVo5SHZrQXE2c2s3dnJDNjkxekVE?=
 =?utf-8?B?bDN5dmZkYkJlVWk1WmM3RGJOeEhXYTFKUGRtSmN4RlY5WWdKRnRKekdqck9L?=
 =?utf-8?B?SFU1T3VNK0tNV0dSN0NMSmVUYXRzK3JBOWVEa0VvekVEWGlMdG56YTM5emow?=
 =?utf-8?B?b2xYbFBJeHVZWkNVeHg4NkNxRnhNUDZPeU9SRjIvazFmeDJDc1pHSnZ4aXNU?=
 =?utf-8?B?anB0a0FjOCtiVllOMDdNTmk3Q0ZlTFJ1YkhaTGNiSTJXMlhjOVhLSE9POC9M?=
 =?utf-8?B?ZWpFa2xiKzRwdVJtOVpzaENuSk9jQktOSjF6b2NUNHlCeEtVa2VBV1praUxz?=
 =?utf-8?B?TUpnY2lsdGFINTM2QU42dUpnelplZEVmUXJpaThWUGxwZmZMN0hwVGtIQ3BY?=
 =?utf-8?B?TTA1MUFZdVl2WjhNN3RuNEc1aHZxeGxwdjY2YnZiYktMT0t3M1Z2bnduVTlx?=
 =?utf-8?B?blZ0dGdmc2x3dDJpZ1JlY1NiQ0dIcm9IcnlKU1BScHNCMi9kLy9hNk1ybmJO?=
 =?utf-8?B?aC9peDdvWGpDSjRQSG5PTmN6bUhGM0kxaDFpcE9FaElTSWh0UUdNeWY1dk5Q?=
 =?utf-8?B?L3dYamNLRER0NGZ5TXFzdEV4bzZ3Rm5YQUtOZUR5ajN3Vzc4Z3B3eVdFaFhU?=
 =?utf-8?B?ZFhIUUhueG0rS09DSXhCTU90R203UlBlK3NWWEhIcERkRzE1ZUpOSExCSnZq?=
 =?utf-8?B?VUtKa01yS0JhREx6MWVNdmwxWkNGOWMrQ3FwNkpjR1lTTE9OQk9HWnZHNHh4?=
 =?utf-8?B?OGRIL1ZnbWR3dXMvZjAyZ3BwVkRnYzY5dkM4MmF0Q1h3eUlzeVRnWUI2b3R3?=
 =?utf-8?B?ZjROY0luamNRbjhyQWxYRmx3R1FLSTgzUVFsWEtTUTgzSmk0Z0FoOUxLTzZD?=
 =?utf-8?B?TEVuclNqSEVNeHU2YUJFMkZ6SlFoM0ZWUVpSa1lZU3JxOW5iajhrWkVyNnhW?=
 =?utf-8?B?TnRLQXo4VWlHcS9Fc0pBWE1jMHd5aVZZczBSYVUyWVlFakwwVm9kVUJSTG8z?=
 =?utf-8?B?blRWSHp0UncrM0pXOVVTSWUxSUdlNytvOElOcDRiaFRaOWNrMXdkbk9oZ1N0?=
 =?utf-8?B?S2ptclJIN1k4bzBhY2VRVkdoYjB5QWhJQnlMV3QwQlNkY0czM0VTM0Q1RGNm?=
 =?utf-8?Q?o6x4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f3f9df-9169-4a29-8817-08dd7d0bd87a
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 17:26:38.8334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kDSR4iaKRIOYnzNNvTbp0iKhKKvEKaP/7OMOTRgzGSU0LJ0FmUlUDCDb3a6yw2hL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428

Hi Tony/Reinette,

On 4/16/25 11:21, Reinette Chatre wrote:
> Hi Tony,
> 
> On 4/15/25 12:25 PM, Luck, Tony wrote:
>>> By default, each resctrl group supports two MBM events: mbm_total_bytes
>>> and mbm_local_bytes. These represent total and local memory bandwidth
>>> monitoring, respectively. Each event corresponds to a specific MBM
>>> configuration. Use these default configurations to set up the counters
>>> during mount. Allow users to modify the configurations as needed after
>>> initialization.
>>
>> I think an update to this part of the resctrl.rst documentation is somewhat
>> overdue:
>>
>>         In a MON group these files provide a read out of the current
>>         value of the event for all tasks in the group. In CTRL_MON groups
>>         these files provide the sum for all tasks in the CTRL_MON group
>>         and all tasks in MON groups. Please see example section for more
>>         details on usage.
>>
>> The sentence about CTRL_MON groups providing the sum for all tasks
>> in the child MON groups is only true if counters are assigned to all of
>> those MON groups. What mon_event_count() actually does is to
>> return success if any of the CTRL_MON or child MON groups succeeded
>> with the count being the sum of all the successes.
> 
> Thanks for catching this. This would be important to highlight so that
> user space does not have impression that events of CTRL_MON can be
> used as estimate for MON groups that do not have counters assigned.
> 

Sure. Will add text about it.

-- 
Thanks
Babu Moger
