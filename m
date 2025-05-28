Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2077.outbound.protection.outlook.com [40.107.96.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7CA2AD22;
	Wed, 28 May 2025 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748449141; cv=fail; b=ljsokGr7cLxeEcF8REZXADU+6azGidffI2pvXyOfXiNuXACj9PHte1JfDcTxQoscMzmvJLV0tSXivQnO4IYA888kCPdLqlZtagVpbe5/5lfn2EBHhK+J4qj9OilPC+i21CSVXEB3q++2CCwLRQIksZEHkwhxuN+w/URG06Rcd30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748449141; c=relaxed/simple;
	bh=GHT+sRAPwjXhHmWvK/ecZqkmby2mPJ6z5hxrtICKC+0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gHv+yj93e6Cvh7SjCH5CxkAsoKl5rNBjHO1xVagCLeNO7S8rqZO6oZ3Sn1XiRSy8mBUftKzAGHscKYaT1UnrquMJLhLfuKQx51/hfl1ZchBA8qBWe1a1jvborZPrXLI/oHOWXQMezNRr53/2y1vrdvvO3myY9xPY0hyf1n+4Nw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NIk7UKl2; arc=fail smtp.client-ip=40.107.96.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NIk7UKl2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fslESAUDUkEsEFMUC6J5gdXaQy/d9P9ZB/irql6oTuBUSVQsfbUs7MYPbpNc2b7aion46AP+Tc2PhCNkg2budLj3Nk1blNF5L6zqq5G7LiFsUkahBQw92ZUQl9DldCbBJmHFhBE7Opob2aOu+hy8JQ7nYrBJTD76zIv0BcwglGtTmBExF/SlrIoMwftNZG0q3TunCQRvDT+KACcuNiOtdItDFjr1nZiE/osrkIhbw63UJzLQNt++M3oL2ObJBA3qv6il2fhkqPpemaOQrmwnLvQNU5twMni1yjDO67Bf+snv9z3YAsSTmIS/OSNyIrxwwl7P6tCB/pYA13GiaKnmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5i1/OL5n1Ojj0NXKSnt4E+fujUcshKJbsicK3Mg47zE=;
 b=BoJDXOp6o/w7MUc7gT0bP/JwUJXz5JFBHyUPIj2bivQXGtg1nrMh/Tb3lvuN1FKeL1GE989DTnKpX2DV2IeEe8VcxFfE/SHix5xMHrpKWykPq6aYKyNS+jSPeQVGG3trcn/D46oxTGVBPwlHlc50mpWSB19Igc51EQUiN9//N//Oso3m7TXN4SuWlXDBX3wv/lir4oiG8+gB4aCilfOKLfVoVQ/0tVccWbbobC0DgIzesUwRUB9SBloH2tK/82bFaNaidRA2negB/wsT0zQUPN1JOHciluvHi3AvD4q2Rr2mjsdmGfbovRXyRoIICPZ1QKXx0q2FB49hGaI8OYcxUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5i1/OL5n1Ojj0NXKSnt4E+fujUcshKJbsicK3Mg47zE=;
 b=NIk7UKl2FM1htrzA2Yv+/HRHbI4ZfZLOXpVrGuyD8V60Zh4onBWF/VnMfviq06CEi2yLo3fRwzY4bdqKfTFMcNrgkqyIO9APbH7BW3/ZnZQlW08nxXNjJOUMVSxqHRrinlJkZRl8qMsPGP6h16Fsddxfd2d9sMcMZC5lSql1ZIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DS0PR12MB9058.namprd12.prod.outlook.com (2603:10b6:8:c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 16:18:55 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 16:18:55 +0000
Message-ID: <bbb6b6fb-7b9d-45ab-87eb-82747c370cb1@amd.com>
Date: Wed, 28 May 2025 11:18:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/27] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
To: Reinette Chatre <reinette.chatre@intel.com>, babu.moger@amd.com,
 corbet@lwn.net, tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com
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
 <aef9947e5ed68feb0d33a2c882c140e2e472276f.1747349530.git.babu.moger@amd.com>
 <505f530c-810a-41a4-b3cf-7eb326bb6990@intel.com>
 <6cd9873c-1add-4d19-8d08-a7c3a514bfea@amd.com>
 <5f8b21c6-5166-46a6-be14-0c7c9bfb7cde@intel.com>
 <3c22ea8f-7467-4a25-b1b7-4f7f47177211@amd.com>
 <8e22044c-f36e-41d0-bf1b-311ac8758da3@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <8e22044c-f36e-41d0-bf1b-311ac8758da3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:806:22::35) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DS0PR12MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c755d1-4407-49a2-7e8f-08dd9e035792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OERpcnh5OXp4MTQ1WGsyTFdQNVpwc3dQTU05aFlGMy9maXdHd2l1MWtVVnNu?=
 =?utf-8?B?ZnVUTzJzYVRoRFR6SGpvVEpBZGp6MGgweC9JUCtlMmZPb2lGOGxpb3ZEallP?=
 =?utf-8?B?cms4SEpLb2JQeVFRbFZ3NVZ6SUtRb1NkeEE2YnVueUlVTnZjakpMZmdoMms2?=
 =?utf-8?B?YTZXNWtnTDNoWUJpajRxejZtTXRiejVxYm5ZUmNRTjJPdmt2S0xvNGgzSHZZ?=
 =?utf-8?B?N1g3NVJnL0pNMDNoL0lRRVA2YmN4Y2E0RTBicVc1NGhVa1l2NzlOQ0VoQ2Rz?=
 =?utf-8?B?bk93c1lsenY0ZGRON0prU0E4SE9HRW5pMzNrMmh2UERiS05ndEJGRUlxNUFq?=
 =?utf-8?B?cGxnRVlMQUt0OGtpWjFJNDlQSlczcEE3M3I4UmR0N3NkaEtIVkJWV2hLTnl5?=
 =?utf-8?B?djEyVC9uRnJnaGhPNnRGaU5kaFYrMkNUdW9DRGFON3BNMzU5TjRTNXRZaXl4?=
 =?utf-8?B?MTE0SXRHN09seUtCaWFoRytSajBwVmhSY0czYmJqZFJ2by9DOXRJYUNmQWs2?=
 =?utf-8?B?Wkk5amxXYkFIWEplM3EyTkRCMU5JM0RUNkVBMUNtb0dtN1l0MDk4QXNZaFBN?=
 =?utf-8?B?VzN4MkYvS2RSNStxK3hVYUNSYmQyaklEZWtjY245c215VXJVemtUWkpLR3dv?=
 =?utf-8?B?bFF0Y2I5SHVkWlJIcGluelNWMVB5OW0xekI5SlhVRWlLSHQ2V2ZETjU0NGRp?=
 =?utf-8?B?bmN3U0FuMTJGMkhEaEM0UEwxTzFGNy9LY1NaUjlqNDVYbDJVZ0VjVmdQdE12?=
 =?utf-8?B?VlN5RkUyVGxsQUNEV3lQaTl0emdUNXRqRXZYOFdOT256MEZ0czFESXgvUzJj?=
 =?utf-8?B?TkRtcFZiUXV2S01zSWdCeWJvTS9ELzhpajdZdUFIQWNuOHgvQXJnbnhkdk1L?=
 =?utf-8?B?d3hGcFJGNEFUNFVBYU8zYytQSVltNkYrT1FRYmIvdlgrK2EydSt5NDh5YW5C?=
 =?utf-8?B?SlExbjByMi8yY24zSm50a2lmMkdlc1hid1I2d09jb0VlYzE5MjJjQzlkNldx?=
 =?utf-8?B?b095NjFvTnNaTmtqc2oyUkk4S1o5eUxBM0dZYVplam9STkNwQVZleVVGVGJD?=
 =?utf-8?B?K2FGTFNQa2graXpsSzhXVE43V2hkZzYzeG1QZHp3TWRDY0hGTXBVN1NqeWNl?=
 =?utf-8?B?Z2hFMGgrTHFEakRZUUl4ZjB0ZXdoMUxmSy94OXREL2FoazZIVVZyRlBiSXor?=
 =?utf-8?B?Zm9Pbk52MnpuSHNmWmNNdnFtZk1MQXNSV1ozQy83cURGb25taUJZSlNpQ1Rj?=
 =?utf-8?B?dEJaek1uZjdEZ3Y2YmQwNzRYZFdlOGtpZEdWaWZvQ3doMEh2d2dnWTRLYXEx?=
 =?utf-8?B?ZEtCLzFiUi9RVkhBNGtwbnlHb2h1ODFsSnUzclE1TmE1SDZYUkc1ZmdwcDk0?=
 =?utf-8?B?RzNrZUdKbEpRQ2hYUWpFTGNoYjg4ZytPbVlQcGNBbkY1OGlMem54THF6dkRO?=
 =?utf-8?B?ZitoUkFoT1A2SHFvdk9KWTNUSFVBRHRreUg2KzNpV2FPcFJJZnRVN0hDMy9F?=
 =?utf-8?B?M3RJUENEZkdBRFdRWWtLbGdmUnhSSzhXZkZCcTMra0NqekFsaVZhWUE5eWpu?=
 =?utf-8?B?d3ZXSXlURjd3NWd1ZGFYb00wcWJob0Jjc3l4dWRWelpWNjA5OWNjR243eVdh?=
 =?utf-8?B?MFhZSTZCWFl3KytIc1B5Q2ZqckZNVjNsQkJXaytHTmhKbVRsM2RrNGZYL1hU?=
 =?utf-8?B?R3hORG8yL3lHSmtDREhVckZTV0RVNXhOekRHaW9BdWNYcnRDM0RuM2ZUQmVr?=
 =?utf-8?B?bGhmWHkweUZRWEdrMUdvckdBd0dJMmN1Ujk1TUE0Yy9JdTl1a1RWL0Njc3Bu?=
 =?utf-8?B?Y2FWTlRsL1NJZVFWcTJ1OEZpeXkyUnlyVG1RTlh4OTYzcWxudDFITHpkalBS?=
 =?utf-8?B?MXExYkFIbi9qMk9NdFdyZmtCTGNFbmorNGJkN045V3F0TVlyYlAxQ25WYUVG?=
 =?utf-8?Q?guztNxEZp9U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFA1NXhFSGxIRHYwakJPTEwyYmpTaUVSRGJabXdFVWxJbEZGa1g0dFhiSkQx?=
 =?utf-8?B?NE02UGNlSGxJUTJRZHNxbVpqU3lYRHFyUFJraHF2RXBPN0RrMndBa3pRMjd0?=
 =?utf-8?B?anJsU1l3VnNvUUVMNGVxcXFKSXJtcm5wSzliTVcvbzFVTTdQTTlXK2I5c0Z1?=
 =?utf-8?B?L3RLaEhoUEhTYUhlNWc5Wm1Vb1IxeGQ0ZXVmd3lkSnVyZmdnQ1Naa0N5Rmg4?=
 =?utf-8?B?RC9kb1p6SGpUWEQvRitzekJneHpEZGZxTFhDMkNuYURrRFdXZUszL3IwVWlB?=
 =?utf-8?B?bWxobHRFRlpIanlIOHQvWmZBTW1FWXNIV2FJTHVqKytxcHhOdjA4Q2ZUUXlh?=
 =?utf-8?B?Z0FiRXBDWWE4OXQvendnTUVnWWdGcFMvMFVvaDVDdk05ZEU3WjRlTXBXMHkr?=
 =?utf-8?B?dk1MRURaZEx6UCtYWm9hVlA5ZVFaNGhDWVBUYWxLdnlTclpaMUphRC9yM2Z5?=
 =?utf-8?B?LzJDWUMwOVNXQmdPTEhaZXo5UmJNTStFMlF3MkV3VFZYOVYvc0R3TlQzdEhO?=
 =?utf-8?B?eXVDZ2R5KzlTSHlvRmgzeE5mbTRTUDQ2YU1SdVJpalhqbXhOcVY0MDgxWEVl?=
 =?utf-8?B?dWwxZEhxQmQwVVZjQTBVTG5HcnFhdEJTSThJYUZhTHVRZGl1cmlGam8xRm9k?=
 =?utf-8?B?WGE4YmExOSttckRtY1RyZmdnRFVzbnlwVWFYQ1pwYVNNTldYU1RLTEZBd05w?=
 =?utf-8?B?bnNKME1yaUdLV1dSRHY3b0xwRFVpNW5WWFVCd2FUNHM5WWsvcERWUStxL0ll?=
 =?utf-8?B?UUxmZG01YW9VRUgvam0vYlRlcFdwUWJ4d3NYM1VuVXBxUXhMZXRWS0J3dkND?=
 =?utf-8?B?NkQxRncxZ0xyL2taWXZrcjlkbVdzL3BDUWlDUmNySVIvVGMrQmg0bDlwc3lj?=
 =?utf-8?B?ak43dFR1VkN5Q0VZOXRORmlDNS9VUGd6Y2hHNXJ2Q2VEV3AvRmVpalNmc3N4?=
 =?utf-8?B?cFEwQjNGZzRFQUFmS01rNGMvV2psVlZuVXhMM3VLeUtocFdiY1M3VGhGa1E5?=
 =?utf-8?B?d0tKZDlVbjQxWC9SYlNqRmhpNmJXU2RTOFFnNkFHUzZLdkozVms5TXZmOGVL?=
 =?utf-8?B?WG4reW1mbVRYam5jNStyK2JlaXZnZUpjZm9HMkxlZUpjY2tTWmJqKzBWYjA0?=
 =?utf-8?B?Wmk5WEZRdjNFV3Znck5jOEsvbEVWT1ZWWmo1eXFGU2pQaW9FeVM2NGo2a0NJ?=
 =?utf-8?B?dGh1YzkvSDZrcEJpdFlSOUxERk9ZR3ZMWHVmdmUvZDl6NW1FMmNVWStkb0tw?=
 =?utf-8?B?NVhpL2huWGxPNHF3bW5IemtpOVdMZ3orUUZaNHozZ1FNNVpMTk4rejNLSVJa?=
 =?utf-8?B?YUh0dnNyVmgyOHZKWnQ1dmRoK2trcVFramM2NUVja1Noa0RmZWNiNTZ0ZkJa?=
 =?utf-8?B?MXpoNnZ5RHJHTHEycXNnaVVacjRkQTJBSlhQQkZTOFp3SWRTRDVFUVc0SFQ4?=
 =?utf-8?B?ODVnNlBaUkVFTHZiSnRvSHdpZG9BcCt4aXVDcVBKWjFVTjVNRERkT0lwOTVG?=
 =?utf-8?B?NTQ5dUx0WWF2Nk5FT0YxZk9VVDJTcnVMV0ZiN2NSaVA3UFBEN0F3WVRNMlNS?=
 =?utf-8?B?R0k3Z2ZNV2hpR0VmNVVPRGk0Q2UyRFRQOU9GK05QdVFEOU8rQW5kdmhnVnky?=
 =?utf-8?B?aUFmcy9ieGtSczlUVkRURzVMYXlpTi9UcVFidEd4WE9lUU42SHJjUFFpRys3?=
 =?utf-8?B?L3g4b2JOdG5LRldhdUx1ay85c2ljL2gxVXpiT0tHcHRieTZ3S21kdHlQUW95?=
 =?utf-8?B?eGJDdzF2WUQvMVZvQmc3RVl2eTg0c2FqUkxnaEpJc2lxTlQ5Q1pOR3V3QjNT?=
 =?utf-8?B?QU5wWi8wdzdCR0xWVDZXcnNMREhJcExxVXdZL3FjSW05d1kzTkl3eklYNDhD?=
 =?utf-8?B?VGp3Z2FXVWtYK0p6VWZqenczTWdhYm56b3dCN0pwb1d2SlZ1TXFiYTlqOVoy?=
 =?utf-8?B?VmZCYzJpc1dOMFNKMm5RcUxvZkxtUWZZWm0vbHlXQm9sbDhqdk9UQ1FLbEtE?=
 =?utf-8?B?U012Tk1adE93TW82YTJBMGVkRy9ub1VobXRtaDJya01zQXllM3BaY2xNbUxL?=
 =?utf-8?B?N0xBeTg4VU9iWHE5YzVtUEJqSURjVlBYTERIMmZ2aVUwaFJrQlc0d3plY2hI?=
 =?utf-8?Q?zjDg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c755d1-4407-49a2-7e8f-08dd9e035792
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:18:55.0131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QznIW5PImUmCIy9HA/SCxtHwcWFrYkBo5ce0GZokPJ0gdqqN6l4plkBFiKIjebK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9058

Hi Reinette,

On 5/27/2025 6:42 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/27/25 11:40 AM, Moger, Babu wrote:
>> On 5/27/25 12:54, Reinette Chatre wrote:
>>> On 5/27/25 10:23 AM, Moger, Babu wrote:
>>>> On 5/22/25 15:51, Reinette Chatre wrote:
>>>>> On 5/15/25 3:51 PM, Babu Moger wrote:
>>>
>>>>>> diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
>>>>>> index a2fbea0be535..2f54831e04e5 100644
>>>>>> --- a/arch/x86/kernel/cpu/cpuid-deps.c
>>>>>> +++ b/arch/x86/kernel/cpu/cpuid-deps.c
>>>>>> @@ -71,6 +71,8 @@ static const struct cpuid_dep cpuid_deps[] = {
>>>>>>   	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
>>>>>>   	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
>>>>>>   	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
>>>>>> +	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_TOTAL   },
>>>>>> +	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_LOCAL   },
>>>>>
>>>>> Is this dependency still accurate now that the implementation switched to the
>>>>> "extended event ID" variant of ABMC that no longer uses the event IDs associated
>>>>> with X86_FEATURE_CQM_MBM_TOTAL and X86_FEATURE_CQM_MBM_LOCAL?
>>>>
>>>> That's a good question. Unfortunately, we may need to retain this
>>>> dependency for now, as a significant portion of the code relies on
>>>> functions like resctrl_is_mbm_event(), resctrl_is_mbm_enabled(),
>>>> resctrl_arch_is_mbm_total_enabled(), and others.
>>>>
>>>
>>> Avoiding needing to change code is not a valid reason.
>>>
>>> I think that without this dependency the code will
>>> still rely on "functions like resctrl_is_mbm_event(),
>>> resctrl_is_mbm_enabled(), resctrl_arch_is_mbm_total_enabled(),
>>> and others." though.
>>>
>>> The core shift is to stop thinking about QOS_L3_MBM_TOTAL_EVENT_ID
>>> to mean the same as X86_FEATURE_CQM_MBM_TOTAL, similarly to stop
>>> thinking about QOS_L3_MBM_LOCAL_EVENT_ID to mean the same as
>>> X86_FEATURE_CQM_MBM_LOCAL.
>>
>> oh. ok.
>>
>>>
>>> I expected that for backwards compatibility ABMC will start by
>>> enabling QOS_L3_MBM_TOTAL_EVENT_ID and QOS_L3_MBM_LOCAL_EVENT_ID
>>> as part of its initialization, configuring them with the current
>>> defaults for which memory transactions are expected to be monitored
>>> by each. With these events enabled the existing flows using, for
>>> example, resctrl_is_mbm_event(), will continue to work as expected, no?
>>
>> Yes. It will work as it uses event id.
>>>
>>> This would require more familiarity with L3 monitoring enumeration
>>> on AMD since it will still be required to determine the number of
>>> RMIDs etc. but if ABMC does not actually depend on these CQM features
>>> then the current enumeration would need to be re-worked anyway.
>>
>> Are you suggesting to remove the dependency and rework ABMC enumeration in
>> get_rdt_mon_resources()?
>>
> 
> If you have an alternative proposal that would accurately reflect the ABMC
> and existing L3 MON features then we can surely consider it.

I don't see any other option at this point. Will change it next revision.

Thanks
Babu



