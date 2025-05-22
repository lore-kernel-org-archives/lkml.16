Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1576C258CC2;
	Thu, 22 May 2025 23:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955554; cv=fail; b=R5lVgd9+MrvjwRM6waXMetMz+gs79iWR90AAbNW3t9NFwr+/tcOeh1tZwL1jscJJsBoyxYbP81suthVWhiqTvs48fvsa4DsWNYMUO/sBuc7Gd4+MVoIc3JnjRbR4D9VfgMbAWzWVwl6LOD7utx26tZp5hKSGSWDbsGPczKfBly0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955554; c=relaxed/simple;
	bh=Oi8hhwvMB3FAtqbgz94LLX2vq4l92Iqgwm3kG89uYXU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Oo4J7xDHUFxsz6BU4gD4ZQo9JFPoA/n0/ozmRuzs/64+X4S+UYsuBSml6hNqWmXii8kv4CtCRHnmH243b5RLJQrGvJ5rI4DyAxniWIe594BDsPwL0lR+Ll/QG9xCqbeGMGFAu4mE3JTpwMK5y20RjFAhOfnoa3ehsiVMw6WIIo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=TCAEVnxR; arc=fail smtp.client-ip=40.107.243.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="TCAEVnxR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2AdQvh8Hi0f/C0LSVNQWAT7MrWFWp5X6V/cUk/mh1Zt6aaEK6BLMJxp+T9hV6+wvcQAvzVHj9i1dcFOo5HMzXVSQ9+YLfN/MrM1QH0RkcXqUSgmqmvD++5mUiQsH7MPn4TJwZajcMyXnKiFvVbpBBivpH308773YYwkgPkHcJLPZNvecEzAJFLrXW8MlUxiNDsQy6mBDL+qiEUkvVSXi1NS9CQPXATO59ztGBWS7oLZVPW1+RUruVXlidBdEZoor0ZF15jdPi+bFBsz+AODqB773sD5Bv7hlx9u3SGNSnMjQNnHsvw+UrfxpUocL2JcTi9ad2stbH0aHoKHrhaoxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vd22j3mYVIReMAl2MTGudQm51aaaccz31b3BBZXJolo=;
 b=yHIXV4Ow6+7lXnhtin1VIp2DEcX+cFYryODMOIwguZi+WJmZQLkuKNnU8yLVIcxo156GXy+hH08iJcxvXGxk8Na9xfulNKvfCqVBrllHFkt78ALq8pXa8xUyd0x7neLnIhwTQksXcVq3rlo3XqhSpDTeNhvSjDCoJzNvTBV7r/Ha6lkelrsTtCrOEf4VSAu93R639Ki/WMAyJHgcKEUQ6gtY4WwQNoA465XWcoHmqETmAJIETpi5C7m7qSFDAoEvgoGtfKgtdA3dH8MuK1HwYcb+TTELmvXy0EYY2Hrm88DlZzZLe9VU+0+RF3qXEVozV34meMjcq1pO8wkdB1vo2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vd22j3mYVIReMAl2MTGudQm51aaaccz31b3BBZXJolo=;
 b=TCAEVnxRkUofmq6wh/8s4wkKW4f0YBZpiaK98j5MhTnOFlg2qVE4dG9CzJEsDk4MGb4bf2HfR60hCGbTw7F3hXi995GpmcemUhvEDTkMChz+5vnIUJxy/T4qCuDwTttZZNGbTUjCCKKWpuKjydLVYpBqVOOwE6DNWFSpUClKXkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BL1PR12MB5732.namprd12.prod.outlook.com (2603:10b6:208:387::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 23:12:28 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 23:12:28 +0000
Message-ID: <e768535e-444d-4fa8-bfe2-f8e8c0b1d4bc@amd.com>
Date: Thu, 22 May 2025 18:12:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] x86/resctrl: Add user interface to enable/disable
 io_alloc feature
To: "Luck, Tony" <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>
Cc: corbet@lwn.net, reinette.chatre@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 akpm@linux-foundation.org, rostedt@goodmis.org, paulmck@kernel.org,
 thuth@redhat.com, ardb@kernel.org, gregkh@linuxfoundation.org,
 thomas.lendacky@amd.com, seanjc@google.com, mario.limonciello@amd.com,
 perry.yuan@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 nikunj@amd.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 andrew.cooper3@citrix.com, ebiggers@google.com, xin@zytor.com,
 sohil.mehta@intel.com, Xiaojian.Du@amd.com, gautham.shenoy@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1747943499.git.babu.moger@amd.com>
 <3946e8cfd3ce77028cdcf79a1ff5d5f70a714698.1747943499.git.babu.moger@amd.com>
 <aC-JAdEYyhshVIQA@agluck-desk3>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <aC-JAdEYyhshVIQA@agluck-desk3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0151.namprd03.prod.outlook.com
 (2603:10b6:208:32f::15) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BL1PR12MB5732:EE_
X-MS-Office365-Filtering-Correlation-Id: 050ae3bc-2cc0-42d0-586e-08dd99861f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTd6OE1qUVFndnBXRUU5TDdxbFI1NVhYQ3FPS1FuZWd0OWM1dFZZUGZvQWVK?=
 =?utf-8?B?bE1IZ2NSSnMxUURoa2ljZ29hdFBXbS8veWFoQTg1MXg4YUEzMERIanFTcmJK?=
 =?utf-8?B?YkV1REJjQVQ2QzhNY1FvSzgxc1JJRlpSZElwb2h3RlhONUIvMjdlK1c2SDBG?=
 =?utf-8?B?d3lJNTFHTUpDSjQ2WjNmV3RzcWhidTFiWXE5a3Y1d2hiWDRDYytrQzRianpU?=
 =?utf-8?B?NGR6SGV3TmV0UjZKZ25pWTlLb3diMUV6VU9Od2V1Q0xOTmZCQ1pneVVrbGJi?=
 =?utf-8?B?dzdjeDYvRG9oZVVzcS9IanlCYjc0dzg3dklzZjZVeDE1NldjYXFOcDAwN0pZ?=
 =?utf-8?B?RjBZMDB3R0MrM0MwellsYjliQUo2T2Q4ZGQ1V0RmUkJUSEhVZkQ1MUd0Ri8r?=
 =?utf-8?B?bi9LWmdtVDhmcWFsR3FqaWlEQVkyLzI0Y3piWnkrUXF6R3B6KzN4K0U0dEtU?=
 =?utf-8?B?ckk0MGlGc1h0YU5rYzBVVXF5ZXZjenpJaGc5cysvWDBKWnlGWXRreGZMMFJ5?=
 =?utf-8?B?RkFHOXBIZnA3SzJFR0ZIeVFIT0hhc0JTaVY4bVdPUk9oTG5wbWQ2bmt6M21D?=
 =?utf-8?B?RTVIU01PQlV6TnZNc0tDS2dIUjNkS05iUGJvS0E0ZFQxSUlWck1TRUhCanVl?=
 =?utf-8?B?cVpDTGZzaFFRRWxISGlRZ0VEWXZINHlhSmszaEdBc25MYmxEYkc5aHU4ZzlB?=
 =?utf-8?B?YkVyak1OTWd1dFE4bDlMUXMxdE9oR2ZmSjN6bkNFR1I2VXdFZUhOWTBzWTRC?=
 =?utf-8?B?K0tFaERXUnJVNTUwbHNGQTdRWFZJYUk3Nm45Zmx3WHBZRElJaDlZcXRnSHVY?=
 =?utf-8?B?T3lVR3daVFA2dzhFUWtUaDhSRjV0bkpvZ2tQeE9tZzNvWmVobzVkSlU2QzlM?=
 =?utf-8?B?RloxTEFEdzhXS1VCTVVBWkc5K3JxVjllRXc0N0ZlcUFUQWFTOHp0Y0YvK1dx?=
 =?utf-8?B?R2lkUFpzczhDZTFXSWFhQUkxWVp2T1pIK2M1cE44YXZCV0gzMm9Pdk5PazBY?=
 =?utf-8?B?cWlNY0cxSkVYT3d6eXhQbytpZGxjUlZIRUxMNHVYa2xWUWVaVUlmd3BML3ls?=
 =?utf-8?B?VzFYbXNMWTluK3lFRUxyYnQ3WEVZOGVmaXpwdG5FVjZaUWthTmxkTEZ5QWFH?=
 =?utf-8?B?c3pRR2hubkRpSi9sbTgrZGgwZ1g5eG43aG0rZ28vdTBVYzBQL0NQaUloRnJn?=
 =?utf-8?B?RDl2WGJicTFLVWNCMkpNZXB1eEJ0azdPMTRWazN6TVRmMWFoRWRvMENkM3dv?=
 =?utf-8?B?cjVBZ29kOVZMTGNSVUhobHc0aCtYNnBqbnhKTENYVWh2TGttTEdxaXpiRCtV?=
 =?utf-8?B?Z1E0cXdRSUorNXk3aEhsYVRoSjVkTnpCVFJmaDZRZU5sU0NyWmsvcXJpSll6?=
 =?utf-8?B?aUJvM0dkRmhIRWxxOGlIRnJrM0J4SjgvdzFrWCs2SEdNNG85NFBQakttVUZX?=
 =?utf-8?B?YzljNktsVzdJSms0ZTRzV0c2UHZWSW9uSk53QkJMOTZ1SXQwY2VpZHhMcTF1?=
 =?utf-8?B?SWhxcGdYb3RzS0Q5UGxxdlZnc1JDLzAwQVBKeEtTSEVuODhhT01FOFMvek0z?=
 =?utf-8?B?clpydDJ2RVhJOFJOUkR3ZC81bVhKVnp0eXA5YnZka0R5V01FWEs1RWx2dWZN?=
 =?utf-8?B?M1RXNmM2Tzh2SWorVU01eFNPb1pYVEhsSFpSdE1ZR2FvRXFKWk9NNFdWNlJK?=
 =?utf-8?B?UElzVFhGY01HWmVBSlVqZkU4ZlZsUXRUQVRyNDNVZ3ZMOFhRL1gxWk5rcUh4?=
 =?utf-8?B?czZwckcvREQ0azQ5ZTMrMzgyZmdiMURFQzI3SGYxNlVadG5Fd2Z6YnQrNWxl?=
 =?utf-8?B?cHVaekorbElmNGNwZWd3T2R5MlR1RjQ4eEp6VzZHcVQ5S093eWlTMWVxS2cy?=
 =?utf-8?B?a3JKYXZyYmxBT0lrcklpQnNqS0tmZ3RKOHNmZ01OVit3YlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHhHOUJsSy9wRDhkRnp3enN0aG8rNk1pa3MvM2ttTDI4VFQycmpBK1F4a0xH?=
 =?utf-8?B?eXNDUHVEYzlaTGsyUmJHd290bGJpbDZDSHNaQ0hZRlAzclhrOFJXMlVNRks3?=
 =?utf-8?B?cTIrT0JrRVF1MXJ0MlZsR0Fybkl1WjhpNVhPUEEyYkVqZ3dRQWhEa0RNRDBE?=
 =?utf-8?B?Z3ZGUHNodXlzNVNFS2NOY1k1R2huTzFxa1FVbFlveTBWSXhsODlrQ1JFTG1o?=
 =?utf-8?B?RGV0YUl5c215NHN1enZtcEg1Z2Jib2w1L0Z0b3V0dzUzRmhhSmJhVWl5Vk40?=
 =?utf-8?B?aWRnL0JoZkJvQis5aGVQTmRDT05leVdNYmV4a09WZkpIS3N4eUxkUGxudk9u?=
 =?utf-8?B?S3ZoUWNUSnh6OFRaOVVFdStXMDh0N0ZXQmZ1cGJSMjl6bjRrWndEMURKOEQ1?=
 =?utf-8?B?Ry9pY05NU3o0NWJnR0RpQ0gyU1NCNGptZWEvL2w2b1hHZ1FsemNvamNPcnMx?=
 =?utf-8?B?UkJKUDFtTWxRZ0w5SlZBY2xuVm9LSHAxRnQ5WGJqb2F1MXRLT1dMUzduQzVM?=
 =?utf-8?B?UzdtK1VzTUVZS0x3SzhSUlB4ZElGM3dyeE5wYUM0RitxWUhoS3VkUGZSMDRE?=
 =?utf-8?B?TjFRRGdNekw4ZXgvWmR2UUVqMzJxK3RUaGVEbkNDSjhnbnNZMjBHK2lva1dD?=
 =?utf-8?B?RmVXbXNOK2JBekNUZXdNRU96ek53OFA3c1I3RVk3dTV0UjlvNUFhd2p6ekF2?=
 =?utf-8?B?cG0wMm5qWXl1OFVPa1RNTE1PSXFxcTJYeGdVU3E3NnFUbm9DQVZQTHY3dzVr?=
 =?utf-8?B?NmNsMGZYVG4wSkN4WXdETU1SbmtNNWRpQkc3UFRzcnc0MHBjVENEUEp5ZDQz?=
 =?utf-8?B?VXFKL2xxaC9uZ1d5MlZXb21ZYVRIaU1aS2hITngzQ3NVdWNici91bzAwMGF3?=
 =?utf-8?B?ZXRrc0R3U004amZWQU5URVo5SXZDY20wUVAwK0lxbGsxaEZhYnRlWXZTM0Vt?=
 =?utf-8?B?MTBqN2NFbXZmRFlFNHNhaHF6bTJsdnBpWGRmbkNkUjlXQzh5aTJqR3dkd0di?=
 =?utf-8?B?eTh4TU54bGwwSHRISU9NeWI3cFl1dWNrRUlOdzJ4Y1Nvdnp4R2JLTFBSMHhZ?=
 =?utf-8?B?Q25FVXVFd05SR3Vkd2xZQlB4dHZYRWdkajBkTHpDd29CZkVRdENpbnJZb3RZ?=
 =?utf-8?B?UWpueUVWdkdHUkpCeUhqaEtkaFBXeVhFMCsvZGpnVXJySW1GQmtZV0VuclUv?=
 =?utf-8?B?czV3RExvZkZGbWVOMFhIakZIYXBsWXNEMXA0WmFjSXpGQ2puL2xKUVZ4Uk9H?=
 =?utf-8?B?MlUrRTZMRU1IeElSK1h5MnAvTEVvcWlSa1NKcDd5MS9ML1NUQms0eEcrRExJ?=
 =?utf-8?B?aFllbWd4akdlSWF1YkJGTlY2NktVU0ZDOERoSkg3TXVlZFJqVi9ORHFXVGhm?=
 =?utf-8?B?K2psQmg2QktyNmxWT01QTzRYdXM2NHdjTUlmVDRUb0ZpaWl1VzhBTXZyL1pM?=
 =?utf-8?B?UGZEMTN4S0VUcjY3Y2g4YjVQZ01zMWZCbGpSOW4vUXFpQTdISjV2eW1uaGtS?=
 =?utf-8?B?Y040Q2ZpUVNDczFhREFqOGphWCtHcUNUSHV3SjYrSXF2Uy9kV0hFS0YyT2pD?=
 =?utf-8?B?U28rc3ZPNUYxZG9XNC9MNW56eXo2aFVINjFaamxXalY5NVlJL0NoZFFUSVpi?=
 =?utf-8?B?RUtJeU9udGlXbzlHVDlpOU9WUVRHc1o1U0xFMkt2QWhldHJaZXcrUWgxbVVy?=
 =?utf-8?B?KytibjRhS0QwU2F4QWFIaG5lWW9KVzBwZkJHbndlTWgzMUdWelhYV3dkK3Na?=
 =?utf-8?B?SXE0NmVMTlllQWpVc3Y0bEpPM3BnV2VCZWxraG9vd2JiczNBSFZaQ3Y0MlZx?=
 =?utf-8?B?eFd2UTFWV2tWRjBmQnd4RmVqTXBudmVkN0ZMYnJrQ2IvSnhhYldyRzJCSjZL?=
 =?utf-8?B?Uml5UEdkc0IvZVdLcjFXQ0M1RHRXMjN6b0hUa0lYTmc0VlJ6ekJKUUNwS2lQ?=
 =?utf-8?B?NzBIVG5DOUxxVVZvcWNTcjZOVmcwM1g4OEFtTGZIdXdvSjhKbWpMV3RFNktk?=
 =?utf-8?B?N0tSYkZBbnlEalFtRlRPQnpiWWVNRk5hV3AyTE5nN2NiWlpXcktVMVl5WG5S?=
 =?utf-8?B?aGE2dVM5Q3B0ZE96L0lsWkFuMmVSRGlGc2xYYTZoa2VaZzJlSHppdzdMaE85?=
 =?utf-8?Q?4//M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050ae3bc-2cc0-42d0-586e-08dd99861f12
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 23:12:28.4602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHWI85yxuzeRUxdvQpehpxmnsfhAmfPLqJVtwgD2zKBMELNaUegN2qcHohtg+KEV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5732

Hi Tony,

On 5/22/2025 3:28 PM, Luck, Tony wrote:
> On Thu, May 22, 2025 at 02:51:36PM -0500, Babu Moger wrote:
>>   
>> +/*
>> + * resctrl_io_alloc_closid_get - io_alloc feature uses max CLOSID to route
>> + * the IO traffic. Get the max CLOSID and verify if the CLOSID is available.
>> + *
>> + * The total number of CLOSIDs is determined in closid_init(),  based on the
>> + * minimum supported across all resources. If CDP (Code Data Prioritization)
>> + * is enabled, the number of CLOSIDs is halved. The final value is returned
>> + * by closids_supported(). Make sure this value aligns with the maximum
>> + * CLOSID supported by the respective resource.
>> + */
>> +static int resctrl_io_alloc_closid_get(struct rdt_resource *r)
>> +{
>> +	int num_closids = closids_supported();
>> +
>> +	if (resctrl_arch_get_cdp_enabled(r->rid))
>> +		num_closids *= 2;
>> +
>> +	if (num_closids != resctrl_arch_get_num_closid(r))
>> +		return -ENOSPC;
>> +
>> +	return closids_supported() - 1;
>> +}
> 
> Is using closids_supported() the right thing here? That's
> the minimum value across all resources. So suppose you had
> 16 CLOS for the L3 resource, but only 8 CLOS in one of L2/MB/SMBA.
> 
> I'd assume the your h/w doesn't care that Linux chose to
> ignore half of the available L3 CLOSIDs, and is still going
> to use CLOSID==15 for SDCIA.
> 
> I think you'll take the -ENOSPC error return. But do you
> really need to do that? Maybe you can still have SDCIA
> enabled and using CLOSID 15?

We cannot support more than closids_supported(), as the bitmaps are not 
initialized beyond that point, and other routines are also not designed 
to handle more than closid_free_map_len.

While it's technically possible to implement a workaround for this 
special case, it would be a hacky solution. It's likely unnecessary to 
go down that path.

Thanks
Babu

