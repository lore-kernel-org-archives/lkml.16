Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7D17263E;
	Thu, 26 Jun 2025 19:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750966322; cv=fail; b=ehyrfggOkPyLYU4xzXbTdW70o8hloQzEJGnTa4p1U+meqZtsm0QS5WySyIqRNYffPE0xxRw+9RWdFNxjYHPRoQLGoBwnby2bX8VT2o3WqssrKSkXdIR/7HMiTXjYeffAou0aKHiafEdM4EfD7Kd0uLan6/dtY3Wz7+DaqkUXKeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750966322; c=relaxed/simple;
	bh=jGuH6kVbTkUNgtyfWCrhrrM6BkgzkHxs4gWKfEOyOCw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ji9HVMgpabsTCAwyt45a2TxiXFxFCQTF04YsBIBqehANTsATL+XyXOEARBblTlBJ0NHlZbeFce/Gc/gSmT3zqpjfA2/U11E1bPWflcwJJJuBpazcaeEwbnGNVX3r2HTnKouJuG+xIAEgUI4NqpqJul0IuBBmoRFiTP287J8XnZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=p+ZrurPI; arc=fail smtp.client-ip=40.107.92.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="p+ZrurPI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+Dhi89asTw8R6a8ONkkGXDxThDowNXOc30KIJvGemrVV//t5Zik1sv9jJqfLfjNa87GoCZm999mie7V+16yH9bBFDx7IhnIG6JJWNuRzYXPHnHo38q3jnKxGDqvpqHN9crER57KUF+wr6lEpKyJo5c0aX2jMsNuXPrBG9XMiDLzMF78TYU0k0WLG/dMCp9UF9vVUEgbXhsE2IN367E0mK1/PrvcSb57seJ7YN11hGTmfTyRFyZx57TNwCVe+ZwaQ+0qclNlE3/A/bAYJwdxFG355ehMW2m8IMPu/lCOroacWQK0OjDS4ZUR26msX9goE7xA0KFR5AG2qbjDEy8MUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Vf1LgJQ//uY9I5O0dLM7v7gal2WsfC7kmNVxiu0qvU=;
 b=cQjDYfgbr2Wsp0AjOFndMmERp9GDZynJ+r1xkUQjdlDtaSd7da5jBRzcBNHBg8PPt9sk28AYPSLl+mLroSu9wjgutI6fiJJpdw40dHGthC6J1nrNmZnaXBpyVhx8+cWFG9/sPQnPJAH+m343nsyAQAuNey1C98FSV2shqktm8O56Otfwy9CQZGj6vwwsCpi6PbFG02w+EmuRKW5a3SPTCB52exPzHaYL2jOTwD8c8ZB6kKhrdmgfjbjmSH5/v4k5qYhSbjIerT2WY8NbfF718qmzxJLWFDTm7dF/9O+tHKIdKWQ+h35nhkTKXlimshKJElbZqASx3qLNkxXPVJXIeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Vf1LgJQ//uY9I5O0dLM7v7gal2WsfC7kmNVxiu0qvU=;
 b=p+ZrurPI7DVfQLqg8deBl7J51EG6GxESxJ6MIef7CUXNI5Y7gY7lKh1hexjTkqI+H4fZUzX5+cRQDswCsGwh+my74lT16ZtgxvXsqw6JNIca5L0TtVFMEufH/Ov6asqoFA7iltg7ubtt2i2sxaXG2WNS4UzvwzhriSvtu+Ccvzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB6719.namprd12.prod.outlook.com (2603:10b6:510:1b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 19:31:56 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Thu, 26 Jun 2025
 19:31:55 +0000
Message-ID: <95e675a6-5cec-4f14-bb57-eebffb6024a5@amd.com>
Date: Thu, 26 Jun 2025 14:31:50 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v14 18/32] fs/resctrl: Add the functionality to assign MBM
 events
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 rostedt@goodmis.org, paulmck@kernel.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, manali.shukla@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, peterz@infradead.org,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, gautham.shenoy@amd.com, xin@zytor.com,
 chang.seok.bae@intel.com, fenghuay@nvidia.com, peternewman@google.com,
 maciej.wieczor-retman@intel.com, eranian@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749848714.git.babu.moger@amd.com>
 <eea2cfb5b6231b322ab2194abfcd1ce335e2bdf5.1749848715.git.babu.moger@amd.com>
 <77ce3646-2213-4987-a438-a69f6d7c6cfd@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <77ce3646-2213-4987-a438-a69f6d7c6cfd@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0137.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::6) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 339c5772-c808-495a-dcf8-08ddb4e81c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OTZ2dWVHaTFEdGYvVTZvWFZtekNxaGRlR1haaDQ4OHN5ZHpZb2tXS1Jucysx?=
 =?utf-8?B?WW8rOTdZUWdKVmRzYllaRUI2M1ZGalJNeDIrUGYrK1kwWC92eUNvUVhuMjRV?=
 =?utf-8?B?ZGNsQ09kUDNFU0d1UDdOcXFKUFJsdW9kNUJ4MExFQUE2cWo2YUt2YkJTVHg3?=
 =?utf-8?B?eDlVcDhLNk9oaldJOXR4aHlQTTJXbUpYaUZXL1l3eE9scFFXMloxcitPenJk?=
 =?utf-8?B?UWtiTnN2TXFEdlA5WXBUWWhmTTBEQnZPa3VDeFNnMUwzT21KVGFoeHg1OFZo?=
 =?utf-8?B?MnJMMlhveEV2eWloanZVdEp1UUtWeEVQbiszaU1yVzcycVp2Y21mZkVNdllx?=
 =?utf-8?B?bzJwdHV5ODRQbVQ4N1dEYkY2ZGlONWg5aTZqS1VsZ3hNL2g5OTZMWkRVL09Q?=
 =?utf-8?B?VEkzcm94STFzSFRheCszc1IvSkJ4SEdUWkkvTk1kbHphVEttdEVkdjJsUDVW?=
 =?utf-8?B?a3M3ZXFTSGpXVFdySTFTMHgvTGdJTEdickorL0V0Y0JlU25JZTRZbWFIdkxF?=
 =?utf-8?B?U3R5amFUYUhlWXVBVk1WQ3J3aGZVVHpiQVVlTWppdDBaTE5wdlJaZlgzVzBu?=
 =?utf-8?B?ZHJSa05HWHkxalIvOE5HWkxNeXZtSndUdFA5L0hPc2IrRHJqUkcvbzdwVDcx?=
 =?utf-8?B?b1YxT0J5NTdTd25OaDcwOE5BMzU2d0lkdER0aVhuV2FzMFRkQWEzTUd3d3ZS?=
 =?utf-8?B?QUxBMEphNUpLREs3NWxHOUpMVjJzbGlPSWcxbzMvR1pieEVWOC80SzdWaE00?=
 =?utf-8?B?RWNtSEVGeFR0RTVCa0FxNTl3WlZNZmZhbVdSQlBLS1JmVGJSNzMxd2UrRlB4?=
 =?utf-8?B?bDFvb0xpR3VUUitSaUw2WHJGTnRFVm5KMzdZUXJGQXBEOGN0VE5iK1NGeDY2?=
 =?utf-8?B?TitqekFFRU9JVkJlL2xydFNZclAwVjF1M0RwKzh1a0MzbEl5SlNLeWN1TGlU?=
 =?utf-8?B?Qk1IekJ3aXpVRW0vNmlDV2hiZEZ4OGtzQlprNGMvN2FuL2Q1V0QzYVdkdDdk?=
 =?utf-8?B?endJZVdVTEJBQ3FPTUZPaS9RTTd5UUFNcjRpUFh1MUl4eUtVSDhEUk9OMDF4?=
 =?utf-8?B?Y1hKNDVKV3NhbWpqTEJ0OWVFVUR5ek5jb25TVi9NR0tiWjVtR0xjVTdQSXV3?=
 =?utf-8?B?QmtKME9oSTN4dExQZ3dwc0JTdzFFSTRHM0xRNytITTltem90ZWZ5a1E5S21o?=
 =?utf-8?B?RjNnUWt0c25OZUsxNjhKaERaRWhxOWwyRkJkbTBqWC9aSzdlNTJiYzZlbWFj?=
 =?utf-8?B?bXRGTU5mYlZlckdjWGx5ZGtJSDFQNnBXS00rY1ZhdU5pem55VG5MRjQ4dGZ5?=
 =?utf-8?B?VXIvdlAybnQzajUvSmhaTUpHcUwyTU0rKzF6YVJpRDIxYS92L3p0RWVpUXFM?=
 =?utf-8?B?dysza3JObFdPMjd2YitVSjgrR05lWC95VEZtenhXQklXZVpHdGQrZ1BkNE9Z?=
 =?utf-8?B?NkowM0Y1bmp1bUIvNVRwUEJzU3diOWpaVk9CeDF5bFNDVzlBMUlFbW9pakFa?=
 =?utf-8?B?a3JmYjBBY1l6eDV0UG9NejVaaTRXZG9GMkVnZk5sb0x6cHd4aTJjSDhiVlFY?=
 =?utf-8?B?Y1lHcFFKdFlsNnpWM3VMU1VCSmdXYm0xUEplc3AwOURiNUdTTXFkWGRyd0tI?=
 =?utf-8?B?V1VpMS9GdFF2ZTdzTlU0L29nM1VFZUdrdGM4bkFHODRtRWtmUjZVWlVCRlpG?=
 =?utf-8?B?NWRvNkdJSVpCaHVKdVNqcEVGYmNtbXlMc3VZMVBodmNjSzFDVVdVdFlNd2pV?=
 =?utf-8?B?RE83bzF6OW1lM2Z3b1luem8wVHpMeFMwbXVBOUNkaVMvQUhoOXl0dmppTmxz?=
 =?utf-8?B?NEpqQzJuODlkVHBORU9JYm52Y2JLRFRNcXVSNlFlNWdTMDFwTGV2WHR0RzFo?=
 =?utf-8?B?bWxTTmVsRldhM2djdko4OTF0aFcwNVdwUjhtNUdtMEc0bUNZRXpSZ2tHNmpn?=
 =?utf-8?Q?LKtNA0iIP5A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWxoa1FoVTVjaUlzcTNkdmJoSlRKSm9KUVkrVEkxNTR3bG9hYTkrY1ArLzhK?=
 =?utf-8?B?d3ErclBxZUxhM2RlYndNaGFpcWgzdVRuQmQ4QkpFUDk3K2dtclVtSkRDUDJa?=
 =?utf-8?B?M2ROSHljNVJ3a0s5V3F1TERZbUY1cTNZZnkyNnlDalJYbDMrTkJlcm1JaVNp?=
 =?utf-8?B?cjRPS0w5V3FibFNVYWVaRTFqQzdZZEN2MmRXNDJFSTZ4aDRXNzRUZTJLSlJm?=
 =?utf-8?B?YWhJNk1Ra2pJekRiNjJjY002MVpCOS9zYjdTemY2cTd4VEVlcW9mVklRWlFW?=
 =?utf-8?B?M2p5OVZWSHlGbGFrcVV5L1Z0NGlUWFdIR3YydlJUVlRXRnlhL2Yrd2NMS040?=
 =?utf-8?B?aWdRSExOcmtjQkhsQUlNTSttaDhrdys2SG9LZ3Ayb2NaYXJGdXJobzBTQVpo?=
 =?utf-8?B?WGRFWTV4SCtOM3A4NGFOMDYwU3RTWk5qZmV5cnZlSTByR0xGSkpYekMyQzB2?=
 =?utf-8?B?TTA3Q3RHVVlBSmozYkRTS3JkZ3JEVlBBRWFzQ0FCNGc1cnJZWXFneC9lbkJL?=
 =?utf-8?B?aE1ab1dwbGM5c3FvM3E3UnRZTWtOVDZqaXRwdFk2OWZIekZhNlhiSXJUOHVZ?=
 =?utf-8?B?Sm82N3RhWFN5SWNPWmtOYXJoc2Zhb1piN2prOFRaRFh0UlAyRWV3STh6Z1Nx?=
 =?utf-8?B?NUpidjNLVXU1SVplYzhnbVZBUFhYZWVSTjgweGxwWUd5RDJRWitVSXcrckpu?=
 =?utf-8?B?TWZlMTYwRFNubXRNbDhsNDRYeEdSYUtzMzNTTlpNSXRQVUNndGRWVWdYajRC?=
 =?utf-8?B?bmZzQmlsaHEzVGpPL1g3M0FYblR5R2oxaHNJQ3pOQVdYd1M2QkxzeFFkQ081?=
 =?utf-8?B?cmw4c3RBemtRakhmdjFrWi9MQk1kV25jVDduNzkxSE5neDlnVC90dFAvWlFB?=
 =?utf-8?B?Zm9QKzl2VE5DT3JYMlExV2xwU3NKUlE0OFF2NGdKeFU1WHR1UFlXeFZkTHhO?=
 =?utf-8?B?djNJWXp4TkNsQ0lhdjBRU1hZV2Z0YmJHNFhiNk90TDBTdVVqODBHN1JXWEd1?=
 =?utf-8?B?R1B1bGw2ajBrR1RCS0czVHgwYkh0R3A5czRaQTEveU5vbVR3VEU3YTlwU2JD?=
 =?utf-8?B?aGxPUjZBNjNsTGx6c1hMUlRURGhua1VnbWY2a3QrdzV6ZFJuSlBhVjVrTzhz?=
 =?utf-8?B?aWV5dmh0a3ZoenFUWElydHVQUXU3clFBZFlGNjZaOENJRWZZamFuWHFiY3BG?=
 =?utf-8?B?V2h4MXZ6a3JORmd0TCtGOXU5aEV3MTJER2pOSlV4UDI0alBVTjZTZzRCQzFx?=
 =?utf-8?B?aS9WakxDTHorSFlqY25TYWZqY1N3ZEtkdXgwclY1dWVkZDBNVktxSzNIejFP?=
 =?utf-8?B?ZHB4NTVJeTRYVlhyMDdCOUhZaHVLRUpKajNxWURCQkU2aUV3QTFTdzJnTW9W?=
 =?utf-8?B?OE9BNi9kMzBndzZVY1N2L1VFVWozc2FiWFFIcHJhMWdESzlDWmc5ZktibnlZ?=
 =?utf-8?B?M3Bkd3FwM2l0WDFQVjV3RnU5Wnhla0xJRCtkTU1kc3NYdUxzOXpDRzJRWEtx?=
 =?utf-8?B?L3pMOVpQMjd3Ukk0a05nT0VDYWx6Z0h0aTNlWUY1ZGxqNmhDQ2ZwMERvaGdL?=
 =?utf-8?B?V2FRa1d3bUNWT1Mzd0JwL3lFYXUrNzVkQ0FNOEJNbFROOEtJNGVQVlJpMklk?=
 =?utf-8?B?RlB1elZ6dFVZeXhLKzBhTlVGTDN6c2FrOUZmdkFLVVdHVm1pNkdycEh1d3ZZ?=
 =?utf-8?B?cnJuVFpjY29HaE1HdXpieU1iRUFMdDdRNjVuNnNWLzdzcnBPQ3RRYkp5NEJn?=
 =?utf-8?B?cFBYbVozRW1iVHBtWm5DaW15cHNSNUZDZjhQck9uZEtyV000N1RNTzdYdExk?=
 =?utf-8?B?Q0xrRXdYL3RhZUZrMjQrQVQzOTV2QUxuRW1rRUM2N1RQRmJXa1orV3NQMEdO?=
 =?utf-8?B?S3A0OVp1ekpveGkzdlBUeVJvY0dEVDFKR0FvdEYvYnVhSzlGQnJWSjV1bTE4?=
 =?utf-8?B?NGJFQ3NwdmtkT0VlY1h6c1hmTVlqQnFmTUhQNGNhNnYweU41R0Q0SmRWYTQ2?=
 =?utf-8?B?VGo1eThPWERTa1lQb01jcHVJYVBnQVlPR1VhUkpUTTV2eSs4WEY0K1R6WCs1?=
 =?utf-8?B?bXBLQWd1M2IyZ3FOMVFkV1pDU24xTzJSYU9tcWdva2UvbzNCem1MUXh2YURH?=
 =?utf-8?Q?05YI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339c5772-c808-495a-dcf8-08ddb4e81c0b
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 19:31:55.5469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0/5zn4bOY1+Q81PYGiTyfPjaljpfO7IiecXmIYKnN0+/T2gYnYEqybzvdxV2For
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6719



On 6/24/25 22:32, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> When supported "mbm_event" mode offers "num_mbm_cntrs" number of counters
> 
> "When supported, "mbm_event" counter assignment mode offers ..."?

Sure.

> 
>> that can be assigned to RMID, event pairs and monitor bandwidth usage as
>> long as it is assigned.
>>
>> Add the functionality to allocate and assign a counter ID to an RMID, event
>> pair in the domain.
>>
>> If all the counters are in use, kernel will log the error message "Unable
>> to allocate counter in domain" in /sys/fs/resctrl/info/last_cmd_status
>> when a new assignment is requested. Exit on the first failure when
>> assigning counters across all the domains.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  fs/resctrl/internal.h |   3 +
>>  fs/resctrl/monitor.c  | 134 ++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 137 insertions(+)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 71059c2cda16..0767a1c46f26 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -386,6 +386,9 @@ bool closid_allocated(unsigned int closid);
>>  
>>  int resctrl_find_cleanest_closid(void);
>>  
>> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      struct rdtgroup *rdtgrp, struct mon_evt *mevt);
>> +
>>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
>>  
>> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
>> index 3e1a8239b0d3..38800fe45931 100644
>> --- a/fs/resctrl/monitor.c
>> +++ b/fs/resctrl/monitor.c
>> @@ -950,3 +950,137 @@ void resctrl_mon_resource_exit(void)
>>  
>>  	dom_data_exit(r);
>>  }
>> +
>> +/**
>> + * resctrl_config_cntr() - Configure the counter ID for the event, RMID pair in
>> + * the domain.
>> + *
>> + * Assign the counter if @assign is true else unassign the counter. Reset the
>> + * associated non-architectural state.
> 
> A few reports came through about the kernel-doc issues but I did not see a
> discussion finalize on how to resolve them. I do not think it is required for these
> static functions to have full kernel-doc. Just having useful comments without
> kernel-doc style is valuable. Some kernel-doc syntax can still be useful though, like
> above when referring to the parameters. It is ok to keep doing so even if section
> does not start with /**. 

Sure. Thanks

> 
> Where I think kernel-doc is important is include/linux/resctrl.h.

Sure.

> 
>> + */
>> +static void resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +				u32 cntr_id, bool assign)
> 
> If resctrl_arch_config_cntr() does not need a struct resource then resctrl_config_cntr()
> may not either?
> 
>> +{
>> +	struct mbm_state *m;
>> +
>> +	resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, assign);
>> +
>> +	m = get_mbm_state(d, closid, rmid, evtid);
>> +	if (m)
>> +		memset(m, 0, sizeof(struct mbm_state));
> 
> sizeof(*m).

Sure.

> 
>> +}
>> +
>> +/**
>> + * mbm_cntr_get() - Return the counter ID for the matching @evtid and @rdtgrp.
>> + *
>> + * Return:
>> + * Valid counter ID on success, or -ENOENT on failure.
>> + */
>> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id;
>> +
> 
> Since mbm_cntr_get() is called in regular flows, could you please also
> add an explicit check to return -ENOENT if !r->mon.mbm_cntr_assignable?
> Otherwise this is quite subtle with the assumption that
> r->mon.num_mbm_cntrs is zero in this case.

Sure. Added the check.

if (!r->mon.mbm_cntr_assignable)
                return -ENOENT;


> 
>> +	if (!resctrl_is_mbm_event(evtid))
>> +		return -ENOENT;
>> +
>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
>> +		    d->cntr_cfg[cntr_id].evtid == evtid)
>> +			return cntr_id;
>> +	}
>> +
>> +	return -ENOENT;
>> +}
>> +
>> +/**
>> + * mbm_cntr_alloc() - Initilialize and return a new counter ID in the domain @d.
> 
> "Initilialize" -> "Initialize"

Sure.

> 
>> + *
> 
> mbm_cntr_alloc() will allocate a counter to a RMID/event pair even
> if that pair already has a counter assigned. The doc should note that caveat
> here with documentation that the caller is responsible for checking that
> a counter is not already assigned.
Added the text.

Caller must ensure that the specified event is not assigned already.

> 
>> + * Return:
>> + * Valid counter ID on success, or -ENOSPC on failure.
>> + */
>> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id;
>> +
>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
>> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
>> +			d->cntr_cfg[cntr_id].evtid = evtid;
>> +			return cntr_id;
>> +		}
>> +	}
>> +
>> +	return -ENOSPC;
>> +}
>> +
>> +/**
>> + * resctrl_alloc_config_cntr() - Allocate a counter ID and configure it for the
>> + * event pointed to by @mevt and the resctrl group @rdtgrp within the domain @d.
>> + *
>> + * Return:
>> + * 0 on success, or a non-zero value on failure.
> 
> "or a non-zero value on failure." -> "<0 on failure"

Sure.

> 
>> + */
>> +static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				     struct rdtgroup *rdtgrp, struct mon_evt *mevt)
>> +{
>> +	int cntr_id;
>> +
>> +	/* No need to allocate a new counter if it is already assigned */
>> +	cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
>> +	if (cntr_id >= 0)
>> +		goto cntr_configure;
>> +
>> +	cntr_id = mbm_cntr_alloc(r, d, rdtgrp, mevt->evtid);
>> +	if (cntr_id <  0) {
>> +		rdt_last_cmd_printf("Unable to allocate counter in domain %d\n",
>> +				    d->hdr.id);
>> +		return cntr_id;
>> +	}
>> +
>> +cntr_configure:
>> +	/*
>> +	 * Skip reconfiguration if the event setup is current; otherwise,
>> +	 * update and apply the new configuration to the domain.
> 
> When could "event setup" *not* be current? As mentioned in earlier patch
> I do not see why mon_evt::evt_cfg as well as mbm_cntr_cfg::evt_cfg is
> needed. There should be no need to keep these two "in sync" with
> only mon_evt::evt_cfg as the source of configuration. I seem to be missing
> something here, could you please detail this scenario?

As discussed earlier, removed the following check. Return success if the
counter is assigned already.

https://lore.kernel.org/lkml/887bad33-7f4a-4b6d-95a7-fdfe0451f42b@intel.com/

> 
>> +	 */
>> +	if (mevt->evt_cfg != d->cntr_cfg[cntr_id].evt_cfg) {
>> +		d->cntr_cfg[cntr_id].evt_cfg = mevt->evt_cfg;
>> +		resctrl_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
>> +				    rdtgrp->closid, cntr_id, true);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * resctrl_assign_cntr_event() - Assign a hardware counter for the event in
>> + * @mevt to the resctrl group @rdtgrp. Assign counters to all domains if @d is
>> + * NULL; otherwise, assign the counter to the specified domain @d.
>> + *
>> + * If all counters in a domain are already in use, resctrl_alloc_config_cntr()
>> + * will fail. The assignment process will abort at the first failure encountered
>> + * during domain traversal, which may result in the event being only partially
>> + * assigned.
>> + *
>> + * Return:
>> + * 0 on success, or a non-zero value on failure.
> 
> "or a non-zero value on failure" -> "<0 on failure"
> 

Sure.

>> + */
>> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      struct rdtgroup *rdtgrp, struct mon_evt *mevt)
>> +{
>> +	int ret = 0;
>> +
>> +	if (!d) {
>> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +			ret = resctrl_alloc_config_cntr(r, d, rdtgrp, mevt);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +	} else {
>> +		ret = resctrl_alloc_config_cntr(r, d, rdtgrp, mevt);
>> +	}
>> +
>> +	return ret;
>> +}
> 
> Reinette
> 

-- 
Thanks
Babu Moger
