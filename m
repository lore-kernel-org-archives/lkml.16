Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5588F2770B;
	Wed,  2 Jul 2025 02:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751422725; cv=fail; b=JfPxrjvepNFrA3cff62a5+oJ0bxR0d3uqgTldin7WYI4gjiMA9BWLcNFvLm1M7e7hXS3kT+ygKPYghb/wt/oukfpvrZRoRqt+4r+Q/Q6n1U+rUPjl2UjtBRcdskq9OrpfOZZHsmH4ii+gPaGR3MMPiZYBLLYFrCT6kMz8EQaoSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751422725; c=relaxed/simple;
	bh=WF2Mpk1PCe9zsBIwHt7+vDLnYonKPW/WTYJb8YhaA3A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C+L+IlZU5aBc1cd6rbznAM7uEvRwVLUwZsYj9Br5H6te0G316/bdxr1XCCVF5j5cZ91xqQ5dZv9dOv0GS5H6FhdeTICYutchQFjTFdznJS3imnOREzlDFtJFnY7cSBXX5i/NJQZmuofNgvJfEwlSY68IY0Sj+hIH+JQdOsjaiDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AyIULgAI; arc=fail smtp.client-ip=40.107.223.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AyIULgAI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fK92qty1S43qQRgBvaiQ2TLU4CPS0xrbBs3dZd3YtW5vOyjrZ7mli2mxZabE5fcZZ/uaP3iNBiormaX5p3DrSWk40A0ZDC0VP3BCyoOzn0WfdorWOI4lB4f56+XKD0WLJPXvLvsGYqDPNXWShVVcjG/RCPKVfOVAQ7Sk86IKvGOQLp6fDqt+TUX0auzjPNJCjXJXM/JqsxuKB8DKbPxaTMcsQQNAQs247+qOkYyYZIzI79YF1AJQglHTS1odN/672KdhsJieAKGfx7ZqtCbEqpATIRNsIyhSDs4c79+RRKsDPgBHHl6GKJtrF/s2czNSuMKaOgEvIwya4Wiq6Jz0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDGiBwbaK9cU0zZh++RmQf/IJHkm/+Bd+Qa/2Z/PQ1Q=;
 b=iTm7Wqpg2IDXVdVH4bEaBzW3Uzax/k+tTysWxygQ6rr8XAI0BCoyNSq9HZSAfNU9XDEK3VIwoczzhlpunlqC2q3r8U7fmQC9RjfKNwXvrD5PTIjkRAmLPr925LYOKFP0c3cUDOl8PADxq4l9s7F8Gfzu+l4MBhUGiOO3s+QLVQgD8+H/nkqwivIQ/1kezEaZLgmdv0ng88a+YksUCF5nYy4wrd7OwOCC0V4WrfEdxTwoIKvGdvSoy4oc959+6bpQa0Lfjovje8FTQCC4rTBZiwqi5/B5FnASGQJsSwuipsnat1PiJ3sVofP2MCEK2L7FOV/dQt+UQT3OJgjI/CJpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDGiBwbaK9cU0zZh++RmQf/IJHkm/+Bd+Qa/2Z/PQ1Q=;
 b=AyIULgAIBz5k8zi9qU5BluQOnKbfNedG/iLzweUsm7jhaFM15RsIhbilefykT0+/03uM8ckWx5Br1MgbXcetdQwBFUD/5jnHG2feUPP5cdhAY4LUZotroHWfKAfugWkr0GF8xmPtK+isrFyvYGpE5nQX7uyisymLRsGPMZEjQFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DS0PR12MB7678.namprd12.prod.outlook.com (2603:10b6:8:135::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.32; Wed, 2 Jul
 2025 02:18:30 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8880.021; Wed, 2 Jul 2025
 02:18:28 +0000
Message-ID: <3a3f7af5-6b21-46f5-88e4-d534c9cacb10@amd.com>
Date: Tue, 1 Jul 2025 21:18:22 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 29/32] fs/resctrl: Introduce the interface to modify
 assignments in a group
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
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
 <1fa5ee1e36bb599ae33d772e7a3c40fd3a4abe82.1749848715.git.babu.moger@amd.com>
 <7d149e94-ab9d-4db7-abb6-83aaec1e6735@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <7d149e94-ab9d-4db7-abb6-83aaec1e6735@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0066.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::21) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DS0PR12MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: d586eab4-db64-48dc-0a56-08ddb90ebb31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z1JXbi9TOGRqa3N4NHZMRzAycFhldEJiYlpRbkJKNnR3ZE5DMUpub0puTlE5?=
 =?utf-8?B?N1BwRWRBRlZXK2VqYTlqWUtEN0tkSnZDalJUcWFFaFUxSWpIbE9Gc1drekta?=
 =?utf-8?B?WERCNG5GZDNhSXJxQ003TUxNdWppWnlHWmZQTnlYOGVBUkc3SmxtV2huSFBK?=
 =?utf-8?B?c3J0N3gzYXJ5eFpCZmVabTJzaUJ2Z0IyRHhUU3d1SW9kakV6d0pkclpLR3Ja?=
 =?utf-8?B?a3F1KzBZczVGVVpidzFPVlJlbWFVdWd2WUJ6S2ZMOUFISXIxWFlYYWVzL0hU?=
 =?utf-8?B?Z3Q1OTk2d1I5Qnd3anJLcFhta1p4d2lXZ2Y5YmM0QlZ0aXpadzNlOHdhcEZm?=
 =?utf-8?B?U2xUN0pVbnBIVDJYR3liVjgzWDVGQnVOR241aG10M0tiY2k4K2NIeWtUWDlK?=
 =?utf-8?B?TU1NRGNZMXlwTitaelpqNk9XVFZGOEQ2OENwTmJYQmp4Z3dUWklPY3RlZ20z?=
 =?utf-8?B?aEhtamVYb25rb1lBMTVOa0dWczZVZ3lrZURISld6ZkVyL29zZVR6SEdqT0Fk?=
 =?utf-8?B?VHliL3hNU1lMNVpnVFJBdFJvY3ZmSmd3QmprZnh2azlqdkNhWU5SZytEL1dy?=
 =?utf-8?B?RTR3TTdiei84Y0pMVktjbUFWazRFM21yN1JSRnVScGpQdThqeWZINTQrbWM4?=
 =?utf-8?B?REordThEYVlGbXozQXVWNWxCbXV4VWZ1L2h0SnlPNFNhSTMwOGJiZDFvQUI2?=
 =?utf-8?B?MEFGOXhHT2tKMHRIeEhNS1VQWVpnc29FdXBZYUhvdW0xL1JhQjN1ejVQZEpj?=
 =?utf-8?B?YTB6bXJkTWZJRFpOWHJZSjl1TGlZZmt6UkhWNUZ5WWVjOWVReFlZaXV5ejEr?=
 =?utf-8?B?b3FXSGZiNmJqVVNoUUlXUWFlSnZaVlRQTXY3eHJTVFJ1R0N3czVsdVVVcDVP?=
 =?utf-8?B?dUxxdXE5ZEREb3lQejB4L1VHb2FEYjN0RnhCeEdKUFkybXVCZ1Nwcmg2SmZo?=
 =?utf-8?B?T1V5TjVjdkg3SkROQ05VRDBBUVdJZ2VCQUg3bExMbmpSN3BwclpRYnJpMUFI?=
 =?utf-8?B?OEZnM0txeEloZElmQjI5V3NBdTYrK0VrWVFUcGlHVFludXRNdUVOVk1LM1U0?=
 =?utf-8?B?UXZxWTd5WWtxdlpmdmkwaUExQ210ZzZlUE5lZVJUY2RJbWZkaXlNL1lXSElB?=
 =?utf-8?B?OG80ci9DT3d3aUNyR3pyeTBweDU3WndNc1hyOHZjdlgrOHRhbXBtc0hRRFd1?=
 =?utf-8?B?M0RaRVI3ZExMMWJ4YTQ5Qmw2VlRkbjdYMkFIcEpHUUtMS0N5YUxqY0pDcFdP?=
 =?utf-8?B?cXc2aDdBa0toSVdpTnB0SkxEYWR5UDJCVlFkaFdsZDREbTN3NmY5K3NKcGF3?=
 =?utf-8?B?a211RVVnMTVseG9mU3RSUVJhVi9FbHE2ZDR5dHNMV0dsWEZjZkFhZCtXT29C?=
 =?utf-8?B?bmhTNW53eTRBdjgxa2VBN2EyQ1JNTGdhazF2dkdXQWQzbXcxMG5CeGY1QXpy?=
 =?utf-8?B?amNHRk94ajNFUGlwOXMvOWxYMnd4WkJrOUdINnUwM0Z0RFJFeVlOZWM0OXBQ?=
 =?utf-8?B?Z0dUSU5hUlY1MGptS2lGbHZ1MEQvUEl4MmhubnlvNHU0SElmakJSNGdPZDRl?=
 =?utf-8?B?c1p5MXUrMUVHZWdYWkpVc3ZYSVg3WnRvbm9OajFMYUdJdFN0WW1QK29nZjd1?=
 =?utf-8?B?SDNlUW9aUkhOWEFscFd5ampFQXU2a0ZSd09kd1FYeEtJSzBubEhjdlZqbG1o?=
 =?utf-8?B?NXFWejBmZTdqamRtNkFlbFVQVm4zT3puZXgvUERkWE9jYW5hY1owQ1loZkcr?=
 =?utf-8?B?bGNsRko5cytvNEU1TkhySU8ySVcvNE4xR1RXeXJ0Z2JZMXN5ZWluMjdQOFZu?=
 =?utf-8?B?R29jL0U4UTltZ2xvMVM2TThvR0dwVUZoRFhBeE5QMjBPMkxTYUpDM05iNC9E?=
 =?utf-8?B?WXc1NnVlaDh2QkRjQ1RuUnlPTCt2dm0xZlVpQWJJVGg2ajlYNlhwaks5a3Uy?=
 =?utf-8?B?L092NVJXV3ZEM3NLMEEyT05LbWRobk4xL1QxbVVEa2pBYzBCY3JzM0lSUEFS?=
 =?utf-8?B?Yy9xV3RLUHZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Kzh4Q3J6elBWTU5NRVQ5UVlLdjZGekJEZ29KdFFmVnpyMjlXMHVsWEliMVIr?=
 =?utf-8?B?UG9yMzZuMzBHZDJnNXhTRkJpYmlGN2N2TXd4WlRnZE1FUWdqNnJDU0MrTlhT?=
 =?utf-8?B?VlpWSXE1OENWVHhKRUtybjFFNU8yVnNqUFR3R2FMa3o0TW54bExYdi92dENq?=
 =?utf-8?B?NWFSd3FGV1RmSEo3VWsrem13L2kyK0JUL3IxQ3dPSC9naXlJWEJxTDc4Tnhq?=
 =?utf-8?B?bmxMTzJ3ZGNndCt1K080SGV0SUJ1NlRhZytIOVJuSUxwMytMMXN3VkhyQncw?=
 =?utf-8?B?Sk1HTTM1eDA3dDFJbjFyT3kwZEZJdHU5L3RxVXl0R0h4dkxkVCtENTNDQXZl?=
 =?utf-8?B?RHNwMUFLWHNiYmE4WHlJSkJRWXdXY0FWZkRmYmVhdFpPODVobHFmVmFZVFF4?=
 =?utf-8?B?cmhXMXprYmdSaDd4QjA1YlNtbHpsVUg4cy9NaEY1QUJ0d2pOajFUV1hyQzVH?=
 =?utf-8?B?QUFSdk5TY2VTa2pnWDBnRmdnMUwwQldMaG8wb0ErN0M4SnRzMlYzckZ4WHNU?=
 =?utf-8?B?allIazM0eEs4OGMzcEFsbzYrek82LzFndU5UQ1lXTlZqbk1MKzVJMlBFTXRu?=
 =?utf-8?B?aTlHS0Z6cVF5eE9oNEx0U3BXdlpsRFhqQ0hoVW9VWHYrUDQrdVN1VGh3RURB?=
 =?utf-8?B?NjNEY0owd3RCQ3pSL29OZjdtS3pKaTdSTFd1aGhWMjZKL2U1dS9ENVFRQkQw?=
 =?utf-8?B?RU9reCtOUGxxOHFtNEovKzZvcDhmdUozUnVja1ZoaXg2QTlnUHBTd0o4NFR3?=
 =?utf-8?B?MHc0K0FFSHJDUWlTeEtzMkRsWXVzMk1zVmtvRzhoaHo4a0hEaXgrTFRzSE9R?=
 =?utf-8?B?R1NsNE9telBnbTdrU1I4R1FaeS9FclJFZFk2SjBBdHRNU1RlZVgveG8wa3ZS?=
 =?utf-8?B?NDkwZWJXaTZzdCtWOEl2eVRQVGUyNVFCOGg5ditzbVNhVkRLSXlySWFJTkN5?=
 =?utf-8?B?UU5FV0EydGFESVVMNDh4VmRadjJZWE92MzlkN3Ayenl4NFZhSSsvREl3VFVl?=
 =?utf-8?B?aEMvTUlFU1NVRDU5Q21BRHRCNXpsVGVybTBQLytHZnZPM2IwTUxERHU3ajJ6?=
 =?utf-8?B?dmFRTEo1NXVwV0xsU3FOQU02SDJOUHBMT3FqdUhTR0tuZzdzZGhLckY2NnRF?=
 =?utf-8?B?QjcvbmRaZEJMMVlvRS8wQ0d4ZUlWbFhpWlRwdFVsR2Z2aWl6VlZQdmhjVzhv?=
 =?utf-8?B?MHZ5SGNkSHRmaE1lOHRZdFQ5STl1ODlYK1VWTTBHc2M0VFNNKzdFV1B6UVZX?=
 =?utf-8?B?aHhFc2NZWVBJUTl6Q2p4WjRXOWI4cXQwRm5Mc1p4eXF2TTAwZkFoSXNTV0hu?=
 =?utf-8?B?N0FKb0srQksweTQ3dHIrKzZ3NE5STmZDd29oWFRJNE9pTEtsdk5qcmRkaUVL?=
 =?utf-8?B?VGEyejY2ZjVjWkNrYnhYUncyQUkrcmhYZGVqWEJBTytqY1JQajJHeUl5RTVQ?=
 =?utf-8?B?aWFxVnhSQ1FlT3BIY2IwV3dkQkg1bm4rZFQ3THVuaGpHdWg3a0laVHFiMVF1?=
 =?utf-8?B?UU5QUmJGTkwrb2VtU2lPWlFRYWJacjFURFZ6MTduMGFPUHAzU21KamNyQjRR?=
 =?utf-8?B?alUweXJ5NlcyTHNCeDdiZmNUVGtuR3c3WHEvdElwb1pKL0V4OVhMaGlXeUUr?=
 =?utf-8?B?ZTZRdXF2UElkK1I3OS9wTkgrUGp3RUdBMi84ODVsZUt1SUNiQTR0MWxpY1pi?=
 =?utf-8?B?RnNpV2pmcE1TbXMyZTVuQVZZQjBSZmdsRlpycklyR1hvb00xM1Bzb050RmZO?=
 =?utf-8?B?UkU0b0E0UnhjQXhhQ1M3N2lHMkZXRC9iQzRaM2RHVUE5aFd5azlvbWdJRERp?=
 =?utf-8?B?dFN2Zy9Rcy96bCtiRG4yamFNL1p5aUtpYUdFeTFxdHRxa0FMR2s0TXBYeDNN?=
 =?utf-8?B?VmUxSFFaSTMrN3FBT1JYM0tZY3R5akR6SHIrK1pja0RDTHZxaVVaQXJaOVIy?=
 =?utf-8?B?M0NZZUw2OUVWYm5BaUxtN2ROazBGQWlIb3prZG9BaFltV3FBRitpcVpKUDls?=
 =?utf-8?B?WStrdjRoR0pqVVQ2UHdTRC9mVTlxQTQ5ZmZDckFaV09iVHVndVF1bzhySjVu?=
 =?utf-8?B?UjF5eDYyWUZPSDB1M0dnM1RmeWFPVFhWbE5kYmJ4YTJnQnRLQVcwVFRjV1Fh?=
 =?utf-8?Q?y3xA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d586eab4-db64-48dc-0a56-08ddb90ebb31
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 02:18:28.0735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Twt07BV2jvSmtF2pPUWobkH9Z/IPNq0sCJ4HvePWanBXVPMB6xVKZuQM/D6i99+s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7678

Hi Reinette,

On 6/25/2025 6:38 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/13/25 2:05 PM, Babu Moger wrote:
>> Introduce the interface to modify assignments within a group when
> 
> nit: This cannot be an introduction since the "interface" (resctrl file)
> already exists at this point so this patch enables it to support modifications.
> Perhaps:
> "Enable the mbm_l3_assignments resctrl file to be used to modify counter
> assignments of CTRL_MON and MON groups when the "mbm_event" counter
> assignment mode is enabled." (Please feel free to improve)

Looks good.

> 
> 
>> "mbm_event" mode is enabled.
> 
> 
> 
>>
>> The assignment modifications are done in the following format:
>> <Event>:<Domain id>=<Assignment state>
>>
>> Event: A valid MBM event in the
>>         /sys/fs/resctrl/info/L3_MON/event_configs directory.
>>
>> Domain ID: A valid domain ID. When writing, '*' applies the changes
>> 	   to all domains.
>>
>> Assignment states:
>>
>>      _ : Unassign the counter.
>>
>>      e : Assign the counter exclusively.
>>
>> Examples:
>>
>> $ cd /sys/fs/resctrl
>> $ cat /sys/fs/resctrl/mbm_L3_assignments
>>    mbm_total_bytes:0=e;1=e
>>    mbm_local_bytes:0=e;1=e
>>
>> To unassign the counter associated with the mbm_total_bytes event on
>> domain 0:
>>
>> $ echo "mbm_total_bytes:0=_" > mbm_L3_assignments
>> $ cat /sys/fs/resctrl/mbm_L3_assignments
>>    mbm_total_bytes:0=_;1=e
>>    mbm_local_bytes:0=e;1=e
>>
>> To unassign the counter associated with the mbm_total_bytes event on
>> all the domains:
>>
>> $ echo "mbm_total_bytes:*=_" > mbm_L3_assignments
>> $ cat /sys/fs/resctrl/mbm_L3_assignments
>>    mbm_total_bytes:0=_;1=_
>>    mbm_local_bytes:0=e;1=e
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>   Documentation/filesystems/resctrl.rst | 146 +++++++++++++++++++++++-
>>   fs/resctrl/internal.h                 |   9 ++
>>   fs/resctrl/rdtgroup.c                 | 157 +++++++++++++++++++++++++-
>>   3 files changed, 310 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index a232a0b1356c..cd82c2966ed7 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -527,7 +527,8 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
>>   	Event: A valid MBM event in the
>>   	       /sys/fs/resctrl/info/L3_MON/event_configs directory.
>>   
>> -	Domain ID: A valid domain ID.
>> +	Domain ID: A valid domain ID. When writing, '*' applies the changes
>> +		   to all domains.
>>   
>>   	Assignment states:
>>   
>> @@ -544,6 +545,34 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
>>   	   mbm_total_bytes:0=e;1=e
>>   	   mbm_local_bytes:0=e;1=e
>>   
>> +	Assignments can be modified by writing to the interface.
>> +
>> +	Example:
>> +	To unassign the counter associated with the mbm_total_bytes event on domain 0:
>> +	::
>> +
>> +	 # echo "mbm_total_bytes:0=_" > /sys/fs/resctrl/mbm_L3_assignments
>> +	 # cat /sys/fs/resctrl/mbm_L3_assignments
>> +	   mbm_total_bytes:0=_;1=e
>> +	   mbm_local_bytes:0=e;1=e
>> +
>> +	To unassign the counter associated with the mbm_total_bytes event on all the domains:
>> +	::
>> +
>> +	 # echo "mbm_total_bytes:*=_" > /sys/fs/resctrl/mbm_L3_assignments
>> +	 # cat /sys/fs/resctrl/mbm_L3_assignments
>> +	   mbm_total_bytes:0=_;1=_
>> +	   mbm_local_bytes:0=e;1=e
>> +
>> +	To assign the counter associated with the mbm_total_bytes event on all domains in
>> +	exclusive mode:
>> +	::
>> +
>> +	 # echo "mbm_total_bytes:*=e" > /sys/fs/resctrl/mbm_L3_assignments
>> +	 # cat /sys/fs/resctrl/mbm_L3_assignments
>> +	   mbm_total_bytes:0=e;1=e
>> +	   mbm_local_bytes:0=e;1=e
>> +
>>   Resource allocation rules
>>   -------------------------
>>   
>> @@ -1579,6 +1608,121 @@ View the llc occupancy snapshot::
>>     # cat /sys/fs/resctrl/p1/mon_data/mon_L3_00/llc_occupancy
>>     11234000
>>   
>> +
>> +Examples on working with mbm_assign_mode
>> +========================================
>> +
>> +a. Check if MBM assign support is available
> 
> "MBM assign support"? I do not think this term has been used so far.
> 

Changed it to

Check if MBM counter assignment mode is supported.

>> +::
>> +
>> +  #mount -t resctrl resctrl /sys/fs/resctrl/
>> +
>> +  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +  [mbm_event]
>> +  default
>> +
>> +mbm_event feature is detected and it is enabled.
>> +
>> +b. Check how many assignable counters are supported.
>> +::
>> +
>> +  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
>> +  0=32;1=32
>> +
>> +c. Check how many assignable counters are available for assignment in each domain.
>> +::
>> +
>> +  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
>> +  0=30;1=30
>> +
>> +d. To list the default group's assign states:
>> +::
>> +
>> +  # cat /sys/fs/resctrl/mbm_L3_assignments
>> +  mbm_total_bytes:0=e;1=e
>> +  mbm_local_bytes:0=e;1=e
>> +
>> +e.  To unassign the counter associated with the mbm_total_bytes event on domain 0:
>> +::
>> +
>> +  # echo "mbm_total_bytes:0=_" > /sys/fs/resctrl/mbm_L3_assignments
>> +  # cat /sys/fs/resctrl/mbm_L3_assignments
>> +  mbm_total_bytes:0=_;1=e
>> +  mbm_local_bytes:0=e;1=e
>> +
>> +f. To unassign the counter associated with the mbm_total_bytes event on all domains:
>> +::
>> +
>> +  # echo "mbm_total_bytes:*=_" > /sys/fs/resctrl/mbm_L3_assignments
>> +  # cat /sys/fs/resctrl/mbm_L3_assignment
>> +  mbm_total_bytes:0=_;1=_
>> +  mbm_local_bytes:0=e;1=e
>> +
>> +g. To assign a counter associated with the mbm_total_bytes event on all domains i
>> +nexclusive mode:
> 
> "in exclusive"
> 

sure.

>> +::
>> +
>> +  # echo "mbm_total_bytes:*=e" > /sys/fs/resctrl/mbm_L3_assignments
>> +  # cat /sys/fs/resctrl/mbm_L3_assignments
>> +  mbm_total_bytes:0=e;1=e
>> +  mbm_local_bytes:0=e;1=e
>> +
>> +h. Read the events mbm_total_bytes and mbm_local_bytes of the default group. There is
>> +no change in reading the events with the assignment.  If the event is unassigned when
>> +reading, then the read will come back as "Unassigned".
>> +::
>> +
>> +  # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
>> +  779247936
>> +  # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
>> +  765207488
>> +
>> +i. Check the default event configurations.
>> +::
>> +
>> +  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter
>> +  local_reads,remote_reads,local_non_temporal_writes,remote_non_temporal_writes,
>> +  local_reads_slow_memory,remote_reads_slow_memory,dirty_victim_writes_all
>> +
>> +  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
>> +  local_reads,local_non_temporal_writes,local_reads_slow_memory
>> +
>> +j. Change the event configuration for mbm_local_bytes.
>> +::
>> +
>> +  # echo "local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads" >
>> +  /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>> +
>> +  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>> +  local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads
> 
> Please let output match code wrt spacing.
> 

Sure.

>> +
>> +This will update all (across all domains of all monitor groups) counter assignments
>> +associated with the mbm_local_bytes event.
>> +
>> +k. Now read the local event again. The first read may come back with "Unavailable"
>> +status. The subsequent read of mbm_local_bytes will display only the read events.
> 
> (note comment about "read events" on duplicate text)

Changed to

k. Now read the local event again. The first read may come back with 
"Unavailable" status. The subsequent read of mbm_local_bytes will 
display the current value.


> 
>> +::
>> +
>> +  # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
>> +  Unavailable
>> +  # cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
>> +  314101
>> +
>> +l. Users have the option to go back to 'default' mbm_assign_mode if required. This can be
>> +done using the following command. Note that switching the mbm_assign_mode will reset all
>> +the MBM counters (and thus all MBM events) of all the resctrl groups.
> 
> hmmm ... earlier documentation about mbm_assign_mode changes was careful to use
> "may reset", and here is it switched to "will reset". I am still cautious to make any
> strong commitments about resctrl behavior in user documentation.

Changed to "may reset"

> 
>> +::
>> +
>> +  # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +  mbm_event
>> +  [default]
>> +
>> +m. Unmount the resctrl
>> +::
>> +
>> +  #umount /sys/fs/resctrl/
>> +
>>   Intel RDT Errata
>>   ================
>>   
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index ed0e3b695ad5..14d99c723ea5 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -51,6 +51,15 @@ static inline struct rdt_fs_context *rdt_fc2context(struct fs_context *fc)
>>   	return container_of(kfc, struct rdt_fs_context, kfc);
>>   }
>>   
>> +/*
>> + * Assignment types for the monitor modes
>> + */
>> +enum {
>> +	ASSIGN_NONE		= 0,
>> +	ASSIGN_EXCLUSIVE,
>> +	ASSIGN_INVALID,
>> +};
> 
> I do not think this is necessary (more below)
> 

Removed it.

>> +
>>   /**
>>    * struct mon_evt - Description of a monitor event
>>    * @evtid:		event id
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 18ec65801dbb..92bb8f3adfae 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -2129,6 +2129,160 @@ static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file
>>   	return ret;
>>   }
>>   
>> +/**
>> + * mbm_get_mon_event_by_name() - Return the mon_evt entry for the matching
>> + * event name.
>> + */
>> +static struct mon_evt *mbm_get_mon_event_by_name(struct rdt_resource *r,
> 
> struct rdt_resource parameter seems to be unused ... but should be used to match
> with mon_evt::rid?
> 

Sure.

>> +						 char *name)
>> +{
>> +	struct mon_evt *mevt;
>> +
>> +	for (mevt = &mon_event_all[0]; mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++) {
> 
> (use macro)
> 

Sure.

>> +		if (mevt->enabled && !strcmp(mevt->name, name))
>> +			return mevt;
>> +	}
>> +
>> +	return NULL;
>> +}
> 
> This looks to be a utility that should be close to the data structure in
> fs/resctrl/monitor.c. Please check if you can move monitoring code
> to fs/resctrl/monitor.c.
> 
Yes.

>> +
>> +static unsigned int resctrl_get_assign_state(char *assign)
>> +{
>> +	if (!assign || strlen(assign) != 1)
>> +		return ASSIGN_INVALID;
>> +
>> +	switch (*assign) {
>> +	case 'e':
>> +		return ASSIGN_EXCLUSIVE;
> 
> I think this can be simplified by calling resctrl_assign_cntr_event()
> (rdtgroup_assign_cntr_event()) directly.

Yes.

> 
>> +	case '_':
>> +		return ASSIGN_NONE;
> 
> Here resctrl_unassign_cntr_event() (rdtgroup_unassign_cntr_event())
> can be called directly.
> 
Yes.

>> +	default:
>> +		return ASSIGN_INVALID;
>> +	}
> 
> With assign/unassign done the function can return proper error
> 
>> +}
>> +
>> +static int resctrl_process_assign(struct rdt_resource *r, struct rdtgroup *rdtgrp,
>> +				  char *event, char *tok)
>> +{
>> +	struct rdt_mon_domain *d;
>> +	unsigned long dom_id = 0;
>> +	char *dom_str, *id_str;
>> +	struct mon_evt *mevt;
>> +	int assign_state;
>> +	char domain[10];
>> +	bool found;
>> +	int ret;
>> +
>> +	mevt = mbm_get_mon_event_by_name(r, event);
>> +	if (!mevt) {
>> +		rdt_last_cmd_printf("Invalid event %s\n", event);
>> +		return  -ENOENT;
>> +	}
>> +
>> +next:
>> +	if (!tok || tok[0] == '\0')
>> +		return 0;
>> +
>> +	/* Start processing the strings for each domain */
>> +	dom_str = strim(strsep(&tok, ";"));
>> +
>> +	id_str = strsep(&dom_str, "=");
>> +
>> +	/* Check for domain id '*' which means all domains */
>> +	if (id_str && *id_str == '*') {
>> +		d = NULL;
>> +		goto check_state;
> 
> Instead of "goto check_state" resctrl_get_assign_state() (with
> more appropriate name after changes) can be called directly, its
> return handled, possibly printing to last_cmd_status without needing
> any sprintf() tricks, and exit from resctrl_process_assign().

Changed
resctrl_get_assign_state() ->
  rdtgroup_modify_assign_state().

It takes care of calling rdtgroup_assign_cntr_event() or 
rdtgroup_unassign_cntr_event().


> 
> Apart from simplifying the code an additional benefit is to avoid
> (ab)use case where user/bot may write:
>     # echo "mbm_total_bytes:*=_;*=e;*=_" > /sys/fs/resctrl/mbm_L3_assignments
> 

Why should we restrict this?

>> +	} else if (!id_str || kstrtoul(id_str, 10, &dom_id)) {
>> +		rdt_last_cmd_puts("Missing domain id\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	/* Verify if the dom_id is valid */
>> +	found = false;
>> +	list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +		if (d->hdr.id == dom_id) {
> 
> Similarly, resctrl_get_assign_state() (new name TBD) can be
> called directly and "found" can be dropped.

I think we still need to know if the domain id matched or not.

I think it is better to call resctrl_get_assign_state()(now 
rdtgroup_modify_assign_state()) at once place. Code is easy to follow.

I have taken care of most of the stuff. You can review again in next 
version.
Thanks
Babu


