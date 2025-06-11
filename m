Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528662AE66;
	Wed, 11 Jun 2025 21:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676930; cv=fail; b=P8HtK7CmVkTk2fKpxb1IJQtOWgqAgXCUFEFnMBMvUqHoOJ1qMU/lN3kxmx8Jl6DpfzdGb9ZN8n9qxNXEJMuynXx+RzcdmySRozEYBE9dvoSh691HCzWFn3lge1tFGy+GM61E0fApuAVkjGp/F5ronfATnnwtXyQxHBbBTIV/WxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676930; c=relaxed/simple;
	bh=VmRzYfFF2mikfT+6lMLH936tczFa/mbt6x7BeZBNfyw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jfiRsrKAoO2PvwcKNfErQv7Q91/dORRL054495N2KFO6mOMc7BiY8Jf4Q/FN2cBrR4N/KFsPNV6G4WuCEzGHHQ3aKiIcC7hq0HbFTnGwylSjKZSX8p6fcRdUf5kbqZ7rhyiZoJd7sLNY6AV7pvXSjiiuM4G2dRII72SPGB8bL8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PMFNABrD; arc=fail smtp.client-ip=40.107.94.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PMFNABrD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmDyNU4gRvjYh2PPFFUpGdlQWMdcPRlQ40RT6h5nzNL4MA4JttNrUhmdDaTiiiUmfQ4wUYYzqaXeuaZ8iIsR3b6mbEsyySMMh9n8ScN3hz7mo4BB8FPMhMYoTMNfA2P3CDmpKASVVGHquPmzoVU7Ysz95DltTA86bSt8TvmBfQC7muLzypWcIxCpHywoOFfalY1e3D7mGEyNRuwdezAZnstPl+1pfmoqKnrmiIyrpCOWU8Sn2GLvny8nFGJ4BTHHQs9dzrRGLmS+mgq4LuyWAi+OxFwR9DDYVDSnTF/K4OAq8yIaEI8F3uzBLMCvPLohvLx43pF92BTEZOPPk/ovbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/KfAf9PYOwRfFlVlXqgLEeMWslruzKFbCfd9G16EfY=;
 b=Fb8CJmx5Dcw1WA06m2gpaDaInq9myRhwG5pwKHNwjWpW5GPGq4JrIwvUsKO02PS9YdI0ufp1N4dyPRyW8UwfQhuTlcdWqWYkCdG3Rxe1jxy6C3IelqMatKGHdccGWGwXCqsh8oUC2pb4oMLhYphP8YF/psF5bhKmPUbobGG1G8XwdDgzs8qU4+mDHB3ceQdFtEt9qQt17DnrLz6it7CvnE7ib8CPxlFYO7Bo93tdz6zrS8WvXv8Vt7X1Kp2maM8b4HKOy334z0xi0hs1n7JO5oL6fvWMbAGvu2ctwWZUVjBLDzqn+6/8rZvVTx9I40z5tYNyn9FKApHWs+MWhunwAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/KfAf9PYOwRfFlVlXqgLEeMWslruzKFbCfd9G16EfY=;
 b=PMFNABrDaHzTJvttbWlg6w74ZJcyzaUepS2fOtluKfbOTAO8NMQb7pSZ0QJBm1/ZxiX8lHbCy/dm59bZF6RHBtDI/Tm4tbcs3cjhx7fWx0VQbOb1fTnLiOpX8bqwq8867pKx8/1TfzDvCg887pdkomjfFTK9yNFv4BLpKgUqr8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH8PR12MB7133.namprd12.prod.outlook.com (2603:10b6:510:22e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 21:22:05 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%6]) with mapi id 15.20.8792.038; Wed, 11 Jun 2025
 21:22:05 +0000
Message-ID: <9551d350-a665-462a-9f5a-d8666ae73249@amd.com>
Date: Wed, 11 Jun 2025 16:21:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 Peter Newman <peternewman@google.com>
Cc: corbet@lwn.net, tony.luck@intel.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
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
 <9b08ab86-22d2-40c1-be20-fcc73ee98b3d@amd.com>
 <0081a33a-2f92-47db-af45-afe3c820950c@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <0081a33a-2f92-47db-af45-afe3c820950c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR18CA0030.namprd18.prod.outlook.com
 (2603:10b6:806:f3::7) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH8PR12MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cac2c51-3cf3-4336-2c8e-08dda92e03d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0E1UDJ1cVdsdGlpbGZiSUZmZnJTemdCbmp6RTdFdmdqbGJUL0M1TExUeFVy?=
 =?utf-8?B?UGhJdGgvazhOOWpIRkhCcUFMTDhBbEttQVUyMUZ1MGV6emV3Q1hBQXNLOVhh?=
 =?utf-8?B?RjhTVm1UTldtdThBMi9Jd1dxN3gvTjlQck1HbmpRQ2d3akR2VnAyd2syc1Rw?=
 =?utf-8?B?OG40SFp4RjBmWUxYcW5wa3JMVUViRHNHc2c4WjhsNHUxSCtLUFZ6Y3dITFJJ?=
 =?utf-8?B?bmdXNHJIc1ZGNW12Q0Rpa241NHB5S1pJd1RaNDZ2aHQ3cndtbjFjQzArcFpK?=
 =?utf-8?B?bWRGTkNVN29UMlppa2p5MTRsWDJGMTlsRVNNSkhab1VjN2FxNzZyNG1iK2Fa?=
 =?utf-8?B?ekFyM0ZkMzlyYUl5eG5PeDlLQjNNUDJwczZ1TDJlVEhiUkxsaGlXSnFlY0R3?=
 =?utf-8?B?UmM5OUFVcTFDODJ3Y0ZJQ0lRaWJKZ3R5U2tRR3lCSzdSUkNyZVhuWUdYQlFi?=
 =?utf-8?B?bER6QnNmUDlnREUrR29Xb3haNmVkRHdTYTFWLzhyaU5YTndhZCthS241M1po?=
 =?utf-8?B?RmhjWFFLaWE5VkxTaHgzc1Q2VEdpNWhnbFJSNTVtY1ZPZ1BkNitHaUJyYk1E?=
 =?utf-8?B?WDU3Wm1SdjQ3R21HNXJPQitOZGRKcUZ1MUxkZWpFWXVXSWc5Z1RqZXpIVG0w?=
 =?utf-8?B?QlJxUjU5dW9iakxIU1FhVDBGOUY4U3R3YktqL294QjVhYk5YckVCeEo5RUxF?=
 =?utf-8?B?ODN2bnRUMnFjRkw4T2FLUmpsSnBKUFpHa1gyN1BNcE5FcWVKS290djdZckVB?=
 =?utf-8?B?dmVLM2FnNVlWcklNWVJwaFdGVENFNm1kelhTWXZNVkpvRzN3K1Z3Nmc0TUlF?=
 =?utf-8?B?Uy9Vb0I4SDFFNVQzbXRsYVZnSzBYQVhReVBXSjl5TExzb0d3NldKbkVvVklk?=
 =?utf-8?B?alJDNERWcVJFMkRzMk4vcWMwK2s1ZU13cWFGQlVScVVZa3pUVFR1UVBXWmhE?=
 =?utf-8?B?ZVorOEVJekJheE5LZkZZa2VEWVdOK2J2aUdzSWVSSWp0Tmc1NmhQVnQ5L0pr?=
 =?utf-8?B?NXk3UW9hZ20yTy8vSEg2VkJVOWdXbmhrL2hQUndXaTEwL0UvRWIxYWl5SFI2?=
 =?utf-8?B?V2ltL0xUVU13QU9SYTU2a0QvTHI4S3FzMkhBeDUwdk1RZHhmS2Z0QTF4cmZD?=
 =?utf-8?B?SVg4M0dFazhrM21HTWVlNUZoS2pGREEvalByaGx3NFV0QndqRExBbUZNemw2?=
 =?utf-8?B?SWRnZ2k5NytGWEYzak5zSnJseHZEL3RUK3dsRXFpRUQzUEl2dm9lY0NscUdO?=
 =?utf-8?B?TXdmbDQ4SFBCTU10YTRzSGpock5yb3VDVUJmYjBDb2xXK2RXeTRnbXczemFj?=
 =?utf-8?B?aUZOZ2EvcTllNFBlRGF5YnZHeVMwajl2UG1wUFJTRE5Oc1JQQ2pwWkJmU1N0?=
 =?utf-8?B?QVIvUk5YYjh5WTZkQUlJU0xMNDJZVVBrQ08vK3YyTnQrSzlTR0paQVJQSWw5?=
 =?utf-8?B?UEF0YVBINXk2L2d3UkFuK1VVamVqNDBrdXY2Q1hlTmhzL3dRMEExZnl3ZUZ3?=
 =?utf-8?B?YTUzbldINlJ6aWR5ZHRIRnMyTUNtc2hCdUhESUVSMWYzdFJva2VxMThtSFlU?=
 =?utf-8?B?WEpyT0lGcCt1MzhlVnpSYXJmQWlsY2ZDZ2VhVXBlMXcxVDZ4NlFQZ1VCS0dO?=
 =?utf-8?B?VCszN1lRbGdPWWttOThWNTl1U0lCUG51NlNwcTBVMURxRngzby83SXp5UWQ1?=
 =?utf-8?B?V0ZyUzFqbmhsK2dyVjhhOEFsc2FSa09IUzZxYm1YNTZQcVc4SVJ6UnRoR3dj?=
 =?utf-8?B?Z0FvdjNQRUV0S0RtMG9vVDFuT2NVdWN6T0FjWXV0K0VmR1JCNDRsMWZ4V0Uy?=
 =?utf-8?B?UngvTjg2VjFib2htOG9XRENzK2tGREx1T0JNVUxZS091OFM3ZzhGdUR4aVJ2?=
 =?utf-8?B?Szd2KzBmSWJhTE92U0gzcDAwN2VDQTcranNnSEZtWDBSb1VXTUwrY0djSTJD?=
 =?utf-8?Q?sGbbH7CWM+I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXlsSERjSVEveU9yQnh6bXNObnhtSnpwcGdKaUpzUjVWNHN4VENuS2VvQ3hj?=
 =?utf-8?B?K0dpeE1NSER0dW82Mlk0aUVFcndYb3hrWnoxMmwzTWYrUDh1dTJXQnpFZmk3?=
 =?utf-8?B?OXNhbzIyNnlISDE4YXpjNDlUK29vMVZRUzdNcnNobEZlS2JCTWNpVnphdmFK?=
 =?utf-8?B?OC9LUVh1WFNkQTVNeFhSQm9aMHlsbFA2a1RwVmpSRGJ3VGR5Zk43UHYxWFND?=
 =?utf-8?B?OVhuWjBHS1NFSS9NOVdoUzQ2MDdSeHh5eXRiM3JLay9iNytMbUJ0eGpmM3Nv?=
 =?utf-8?B?QVIyUytWblV2emhPMmFSK1ZqTDFMSWlnRWMrUWROalhJTHU5NlEyUngyQnha?=
 =?utf-8?B?SlovVitaNFRJa2VNQVVxeW41eDI5NW93czhmUHA5ODd6Z1VCQUtZWTFDODhW?=
 =?utf-8?B?ZUg4S2M3MlRhdCtTNS9BZVVsZThDZTJLNHlRSDc5U0ZXbWJJajVWR0ZJN0hM?=
 =?utf-8?B?aTlWZUJtWGtxSzhoK2FQdVpEcnlZL0h2TVVOVHcvOU5vOFFTN3Riam9McDE5?=
 =?utf-8?B?N01vejFYMm5IdFdHa2NPNHV4NUppcUUydElPVjdXekFPT1liNHRveFNYNjln?=
 =?utf-8?B?ZXBNdVVIQkhSR0ZyRHRVeU00a016eExjeVdwSmpERHA5NXJaSVI2b2NkVWw5?=
 =?utf-8?B?Q2FjS3pIWFhZSFVjSW1WV285Tk9UNVp3bzdYVnl0QTJ3akFvSWc5T2ROZ1dB?=
 =?utf-8?B?Q1dvWkdBdFIwVzZGaGRDdnViazNpa3RoNDdSWXRCTys2UkwrYVZtdWUxeFE4?=
 =?utf-8?B?NHN0WWVZNXpGNHpDZnJzUnkrb1Y2MXlOekxaKzFxOEJMRWNKZkFWN3VVMmUy?=
 =?utf-8?B?cDZ3YzJRK0tXckc3bU1pN2xEYmtnSDRuU0c3bzF0T2Y0VVU3MDFQdW0yc3RS?=
 =?utf-8?B?OERaU3o4MlRDSWFZZGthM1BkaXkwRmtyTENMQ2lBK0Q1ZzhhbnpaTWNHMDNs?=
 =?utf-8?B?Q3M3dkJMRVd3UHFwRm02M0NSdXlreTRmWWJNM0hVVmlUZFRpTERGdmFaYkt2?=
 =?utf-8?B?RjZQTW5wdy9XWVEvZkJiTkptZ0dqNkpEa1loSVVEcEFHTnhXa3owM1NsbEZF?=
 =?utf-8?B?ZzFrRjZia3BQMmpMVGZQYkFwZ2pjdmxLcnV1cVRDaUdwc2RLMU00Qmd6VW5L?=
 =?utf-8?B?SFdCbnVDOURURlh0Q2sxNFpIQzBWSG4wSmJCdlU1eHFudm5sSGZHbEx6UDNi?=
 =?utf-8?B?YXpQbk92TXpjMVByTmhBeWpWbTZDc3BaZEU2T01VS3NveVBOT0F6WnUySmRx?=
 =?utf-8?B?MTloVkt1bzJIbVpiVk5NM0RSUEJqNGw5c0dsRFpteTY4RmVaSnhGSnFHbXZE?=
 =?utf-8?B?ckxURVpqbUtYNGVFUm95UTliUEhUMmZEYTRrVVpiZldCamtjeXc2VW50bVdT?=
 =?utf-8?B?VFRUdlBWUnd2RFdJbjRWVnVEcFNMQzBBckxqdW15b3V0Y05yTmt3dm5wZzF2?=
 =?utf-8?B?RHFRSFJzd0kxVG1VVXZxNGpQS1BxajdsZmVna1ZWVFJwczNsREVOK3lDM0Fl?=
 =?utf-8?B?d3lzdU9TK013UHZtZ3dWRnhoZkw5b2ZIVndTVnkxcVljek5scE40eXRkY1dK?=
 =?utf-8?B?Y0J0SEdoR0xkK1lmZitjV1U3TjZzZkFlSm93NDQyWEwxaXZhSDlpb0FSeWtQ?=
 =?utf-8?B?aHFwRi9zMzJTYytLeDJuVkd3WTV0aFBiOWt6ckFjS3Z1Zy9HVHFGM0IzUEgr?=
 =?utf-8?B?dGJva29WQ29tSWhNWkVrWnBlL1hnMzZOelNqRjUxRmU2bTNGbU8vWVNOeWJX?=
 =?utf-8?B?NnB6anhuTTd1aVRzWkM3TDkxZTN1T0RTZ3pyN1UybHAxQ0JUWE5ZQ05pejJu?=
 =?utf-8?B?NXhTVnlOS1NhQ3FPZWhzN01IL2RQeVpmb1NEZTVFaDJTOVFBRUl5VFFpUTc3?=
 =?utf-8?B?Um5jTWJHanQrZDdmYlVGM1EvUDlHL3lIOG8wSEpnVkpuZktTYVVSdy91cUZR?=
 =?utf-8?B?S2tMdERzc3d0dEEyQ2FGSUFFTHpnTEZ1UytFVXNuL3FDcjlveE43ZWVMMmpO?=
 =?utf-8?B?SjhnLy9IS3JUajFFdmRFak1jMjVKS3RYZ2krUWhXZEtkN0xqaFdKOVQ0RDdH?=
 =?utf-8?B?K3RaajlUTWlXV25VTTVIdTA2bi94UzhUQ3N5OS81QVVvdjcwQktPdzNiNkp2?=
 =?utf-8?Q?kA5w=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cac2c51-3cf3-4336-2c8e-08dda92e03d0
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 21:22:05.5934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCXfVVJraD4Stxpd5R3IlH8WjZSsw8YG4Y8/a/uTaD68WVs2sHyLqvn8BIO2xYag
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7133

Hi Reinette,

On 6/11/2025 1:29 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/10/25 4:19 PM, Moger, Babu wrote:
>> Hi Reinette,
>>
>> On 5/22/2025 11:33 AM, Reinette Chatre wrote:
>>> Hi Babu,
>>>
>>> On 5/22/25 8:44 AM, Moger, Babu wrote:
>>>> On 5/21/25 18:03, Reinette Chatre wrote:
>>>
>>> ...
>>>
>>>>> This is why I proposed in [3] that the name of the mode reflects how user can interact
>>>>> with the system. Instead of one "mbm_cntr_assign" mode there can be "mbm_cntr_event_assign"
>>>>> that is used for ABMC and "mbm_cntr_group_assign" that is used for soft-ABMC. The mode should
>>>>> make it clear what the system is capable of wrt counter assignments.
>>>>
>>>> Yes, that makes sense. Perhaps we can also simplify it further:
>>>>
>>>> # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode:
>>>> [mbm_cntr_evt_assign] <- for ABMC
>>>>    mbm_cntr_grp_assign  <- for soft-ABMC
>>>
>>> Looks good to me. Thank you.
>>
>> I am actually ready with v14 series. I have good feeling that we are getting closer to making these changes final.
>>
>> So, Looking back again, it might make more sense to rename few user visible interfaces.
>>
>> 1. # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode.
>>     [mbm_assign_event] <- for ABMC
>>      mbm_assign_group  <- for soft-ABMC
>>
>>     This looks much more cleaner.  It matches with "mbm_assign_mode"
> 
> ah, I see, by dropping "cntr" it reduces confusion where ABMC assigns counters
> and soft-ABMC assigned RMID. This looks good.
> 
> Taking this further, the "assign" term in "mbm_assign_event" and "mbm_assign_group" may also
> be redundant considering that the filename, "mbm_assign_mode", already has "assign" in its name.

ok. Sure. It will be

# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode.
   [mbm_event] <- for ABMC
    mbm_group  <- for soft-ABMC


> 
>>
>> Similarly, we can rename few functions and variable names to make little more readable.
>>
>> 2. mbm_cntr_assignable -> mbm_assignable
>>
> 
> I have no insight into how the soft-ABMC implementation will look and thus if it will
> build on this property. If soft-ABMC uses the property then making it more generic may
> help, but if it does not then it may make the code harder to read. Since this is all
> internal I'd vote for keeping it mbm_cntr_assignable since the current implementation
> directly associates it with hardware counters. I do not know if there will be a scenario
> where a system may support *both* event and group assignable counters. The idea did
> briefly come up[1]. If that may be possible then resctrl would need to distinguish them.
> Also, interesting to note that the example used in (1) above notes a system that
> supports both event and group assignment.

Ok. That is fine. Lets keep it as is then.

> 
>> 3. resctrl_arch_mbm_cntr_assign_enabled
>>   -> >resctrl_arch_mbm_assign_enabled
>>
> 
> This is directly connected to choice for (2)

Ok.

> 
>> 4. mbm_cntr_assign_enabled -> mbm_assign_enabled
> 
> hmmm ... here mbm_cntr_assign_enabled is even more directly associated with hardware
> support for counter assignment. It is not clear what the benefit is to make it generic.

Ok.

> 
>>
>> 5. resctrl_arch_mbm_cntr_assign_set_one ->
>>
>>     resctrl_arch_mbm_assign_set_one.
> 
> Same as (4)
> 
>>
>> 6. There will few more functions. I will look into that if you agree with approach.
>>
>> 7. No need to change few of these below. These are related to actual counters.
>>     num_mbm_cntrs
>>     available_mbm_cntrs
>>
>> What do you think?
> 
> It sounds to me as though you are aiming to make the ABMC implementation more
> generic in preparation for soft-ABMC support. If you have insight into the soft-ABMC
> implementation then please share the details for this to be taken into account.
> Until then I think it will be simpler for the implementation to be specific to
> the feature being enabled here. When soft-ABMC enabling arrives the needed changes
> can be made. Since this is about internals of resctrl (not the user interface) we
> are not as pressured to "get it right" while not having all information required
> to make these choices.

Ok. Sure. That is fine. Lets keep the internals to implementation 
specific for now.

Thanks
Babu

> 
> Reinette
>   
> [1] https://lore.kernel.org/lkml/CALPaoCj438UfH3QA_VnGo-pj2a_48sJufUWjBKT3MQatcMJ_Uw@mail.gmail.com/
> 

