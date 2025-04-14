Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5C620C492
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 23:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672978; cv=fail; b=EkihJ75Q2qE6AnXf2TjOA6Pfe+tAWYdyl54tHxRn9jZptU71Nr2t7nA0YLiOKeeSx3SsiwLu0qwvRYJCN0PH18yNLbIASr9VUJj4eGqZH+Yh4PI1EbW1x+QNqJ3fqvQj4pO6upq9HbXoTHca1lK/b7KvvB3nyQ0tgaBA645Uizo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672978; c=relaxed/simple;
	bh=QV/9VUITskBTKpdOG1n3PKJoB5m32wPCFPu1aCSFy/E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E4zBP1MmGbq/WqTdjs5F1eUVrZZnx568jG8GU6WJaQRc/GfnnSFDEh3ylmYbzH9D8iLcWy5pMTBewVQ6M1r9NspmtnD7BzdtRqPV5GDXvviXKNCj4bC9VOHUi0mW6553unqS9QGIORjmF6bl0pmJpGamN7XEAEAYkndpKmH6WoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MZtrvUo2; arc=fail smtp.client-ip=40.107.94.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MZtrvUo2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHQVwkIqDq7VXGcT8Er+bx9APWg6wNFicsJfEhqhmgXzwx0trnDMez1c85zqzo6yGWfuPg269e7iwLQnOMAtgkfEMLya3mfPUJjf7G9CigrEW2/E46rnE95N6xAE6i4OTxIgeIIlrLYoB7ym0xjjPd6B3VFVt56tMz0qgtDA9ET8TaXLgkKCRoQ2ClEGcjI390KtqAp8Rz7BR4tbSVYBkAuX5/Wu36FcAWAiJPV31bHOPUqmC7cylc6tyDVgpWk14g13402dtHRSvP17vuS91nIzRSC40qqcQUxxlyvD91xJSORtPuY0sZGHJLhP2MeADIETshPsxdPg2A12bpVihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgYC8XXEez2XzTzIi2D557qCWiteGGwSp4JiHqxea94=;
 b=opIyBUlg8aXvVlonY5TqiM8iKHkGzfglRMTSIWqrx7UGY6Rk4i6pa+h6Ncacn3/rjDETyHJgWEVCfCZ0eD0JBE5k4MwJvN2G9VxnTHxxBKQHan97TdK3PauMlKqi32UNwblC7+AOZwHgnOiIbkw7Ip/B0+xNiZbqQKis2jvPmnUfKEHA9hRZJtPuhBOIMVTDTw1k4kv+gaBHQT1rF0wDTU455pSox3n8HebUBSuknfOLIkQh511C4iz8cP5HOHcvc/YpEnNJMR2EAacF3q9nvm2ULvmFvh8fhct9tvpEqPnD2fRe6DH/xYVe3rjrTACz6kDfxug4E7Jt7H35i2Wzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgYC8XXEez2XzTzIi2D557qCWiteGGwSp4JiHqxea94=;
 b=MZtrvUo2ciuBtkek1/IcwKImB4WKFWXO4Ci2K/SQHwkj6ymKAISPpZhAfLMOIrb0Of6+a4NIe46CvqfNEoYxTKElyK3zHnkKJ3f5UdMiBuUxyGuz3klU1GMteswXBT6ahdfLascQk1pyoVHUM5C+IKRG/rWfTnaQpgN3fvEfoF6aeTd85vTa5wk9Z31KhGGuh1hAMGhD2BNpM7oTGFfiSSGW/DNVE7r1HByhVPQrxyYUQYUrLUNSaZDsT/75fLR+0x0quRMylR64DpSIHmo7Z7AmIZlZA4D4OwvvFrYOxVWEb1mi2oiWSu3x8xlsRMjtzUKrB25JW8C89vcC9q9FWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 DM4PR12MB5938.namprd12.prod.outlook.com (2603:10b6:8:69::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.33; Mon, 14 Apr 2025 23:22:52 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 23:22:51 +0000
Message-ID: <b1679053-feb0-4b73-87f7-69175f0fe6e0@nvidia.com>
Date: Mon, 14 Apr 2025 16:22:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/21] x86,fs/resctrl: Move the resctrl filesystem code
 to live in /fs/resctrl
To: Reinette Chatre <reinette.chatre@intel.com>,
 James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>,
 Babu Moger <Babu.Moger@amd.com>, shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-18-james.morse@arm.com>
 <f4ab6c75-f6ef-4504-9060-8ca9ab38b0aa@nvidia.com>
 <2dce14d8-55b8-451e-942e-5979f1454db6@intel.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <2dce14d8-55b8-451e-942e-5979f1454db6@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::26) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|DM4PR12MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e35639-9605-4874-085e-08dd7bab46ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ry9IY040V0xVTnBDamVUT1I4STI3eVAzMi91U094N3pNemViOUl5NDAveDE3?=
 =?utf-8?B?WlhPZ29VLzlIT2UxYXlWNWYrbitxR29KQnFSeDh6MXo3N3Y2SlBnTEUvSk9M?=
 =?utf-8?B?N2RmdzRoTWtOSVEwY2prMU1ZcGpSRGkvRk1YR3UvWjZFMzJaRGtHbEo0dFdH?=
 =?utf-8?B?d1JiWnB6dlo5Z0g4cHExRndybGx0dW5NMGlTRlBJZzA3VHJOd09jeGRjUE9O?=
 =?utf-8?B?K1AwMzN3MzhNMTdINFJIMi9WSUY3bm8vOC9hbzhMQmhZMmxJbGJoeHUyazAy?=
 =?utf-8?B?eDZJYmd6TFNYVkN4LzQvWjVXeXprMHB4OTlFdWhMSEpYSGVVUk5aazQxeWc4?=
 =?utf-8?B?L3R0UGZoeS9ndDF0R2RtbzNzTFByR2taQy80ZzFFV2xHaktEZ0wxYVpNSXpW?=
 =?utf-8?B?clBkU1pjZFZhUmI3L1d2RElkZzBwZkRTYW9lNTJpaHZTeXYrWlFwd3BzTmpl?=
 =?utf-8?B?QUk0RFZRNW42OVY5ZnJwcnNwZnkxUnU5MTRHS1pOUm1iUzRmS1dESHBmNWJJ?=
 =?utf-8?B?c09RR0NNcmlMRTN5Q0VWenVHYXA5clFTUHZDQVhJMEUxeE1UZ1BuT2V5aXlS?=
 =?utf-8?B?ay9LWllBR2k3QnRYTXpGRXRNSy96c1ZqR3VYYlNOWWxzL293WVA5QzRlYTdH?=
 =?utf-8?B?V0hodXptTmdyMWtvZVBac0dyRFFpWVUzTXNvSUtncHZPMlJDL3duS21nZWhn?=
 =?utf-8?B?ZkNabnNnZ0MyQjQ1eTNjNXJ2L1R1TDd0ZTVhM1dzUWdrcmV1eFVUbkNDeWVq?=
 =?utf-8?B?SnpMQ0tna0FrV2RuSXlxRkNEbmZESVRCcUt3UmhtOVJOd1pjK3hvaDhXZnNv?=
 =?utf-8?B?TDFaNnJBclV2VHN3UzUrTVhYL0xkSjlVNTBrUGdRb2I0TUhuNHQrbURjSnpr?=
 =?utf-8?B?b2t5ZUh4S1l0Yk5EYlRUVHVtWTE0NnVlME4wckEzTUhyVmdsRldOenB4aXRR?=
 =?utf-8?B?K0hnb3BJVVpJWjRBSkRzRlVtQ3E5MlBqcVovUThFQlR6RkdYaFpqVzBRaFJK?=
 =?utf-8?B?VTVyLzRwWWREMXlNenZ0SHphQ0ZqSDQrOHdnNFd5WFNicVNibWtxMzFHTnVP?=
 =?utf-8?B?ZDd0UWJuclNKUEhGR09qZHRicGZYVDl1eFpPR2NmdFNQNWFlR0tVSHpOVEM1?=
 =?utf-8?B?VnlROHdMeVpOWHhhNWRLT0ZYR3Ard1FORnlybUpJRW1XeGFNQ3RzcnozRXVk?=
 =?utf-8?B?QTZUVEZRWkIxalhNVEJ1cDZkS3NRTTQ2clp5V1FLMzNaZUZJNVZJUTAzMzcv?=
 =?utf-8?B?WjVUVkVIOEVWdzlKZGlsNmpJZUNNRGZWeHhVdm1OYVJwak9hZ2dyaE1oanBZ?=
 =?utf-8?B?aXhuVHdDNjM0UFh3a0FQclg0NXFSUk5JTUpKQXc3THM0aEwxWHdvQ1V2UElP?=
 =?utf-8?B?eGZUUTk1bmJUYlV3Vm5NMHE1WUM5Lzl4aERQRVBhR0FTdWpKOUNCUTZkZDVW?=
 =?utf-8?B?ZDdVOVN2MmxpeXovd0MrMkhTdjliT1pHV0VDZGp0dkQxUjA5ek40VTFYYUg4?=
 =?utf-8?B?RGM2YnhKMjdiZkRFbWhGTUk0cklBVGo3UUZVVGM5TzU3MjFrZEFRK1BqSElS?=
 =?utf-8?B?b2RFVEowQjFaR0xhTDI5Rm5zZE90a2hmMVJDRGxyV0UxdDF5QmZ6NWlwZmJu?=
 =?utf-8?B?RU5DaEdXNmpidVRqRjlmWmswUVc5NGFUZXdMc1doVjZuNTlTaWlWWVozUDV1?=
 =?utf-8?B?ek9wTUVuTWdla3RvZkJldGpBUDYxU3l2R3E5VFRJc2pnYjRMY1cwZ3ZJTlNi?=
 =?utf-8?B?Zzd3NWE5YlF3MVRQMmthMmovaTJocUtsc0YwYzdNeC92ZXI5bENMUmRPOTEy?=
 =?utf-8?B?aW92dSs2dlF0QXdUSlN1VXJmMVFXS2xqV3llTnJNTEJRaWlEOXJNUFh5UDVq?=
 =?utf-8?B?MWxNRXhucnFjTmk1d3MwTElFdFBDNU5FTWo0MU1IWHlBUGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckI4RmdVVzB5VjJPL0lUOTZQYndNb1NwQmUwUDdnSFVQMmFHUHgyNDZpUEkv?=
 =?utf-8?B?MzJ5cW1oTEh3VWlJNi9lUUFYVy9XSkNTcmUyRXFSOFp5NG5lTkFvTnhQU2Ru?=
 =?utf-8?B?aWVVNzRub2plc0srZ290dUFYNkNnMXh5bGFqek9od3hUZnVKM0tndE5rYThK?=
 =?utf-8?B?ZzhOTHVtRkpZZ3BySGtaTmFOYTF5Yk5JOVBxR20wN3RqRmpvNGxpWTl5VmJT?=
 =?utf-8?B?UEE0MjRodVJiSFFZVlh4aDBFL0VCcVdzanlZSmY0a0tKSVlIOWxsNnF5ZE9h?=
 =?utf-8?B?WG1FQjFIN3NmZEp4Z1BpNTFhWUNIUEtNQXlTd3NpRDNNUG0xTnRyMzlEblEx?=
 =?utf-8?B?VHZLWmdYdG1CV3NoZG9DM1JJc1RrMGhpdDZNVk9ndERKbEowN2pSR1dQZU1u?=
 =?utf-8?B?a0I2NVQvVGp4SHg3WTJaZGpDYitwQ0dPaXlWcVkwZUlRZi82c2NSLzYvTFd0?=
 =?utf-8?B?MTVwUHFJTWl3b1JQa1RxUTRYcDFPVWlPWTNNQmsxcEZlZjhBaWRidnlWVDNV?=
 =?utf-8?B?NHdJUmo5RzhRWjY0RGJ2dUhSajlKM3Y5dDhYeHdDOUExQkEweTJQekdVKzNr?=
 =?utf-8?B?MFRZaTlWR041TXJ3NThUR3ZSQStNaTVKMGJ3MVd2QmhJQ2F0VGFGL2N5elFV?=
 =?utf-8?B?aDJjREhGeTZkYXVhSElxMWpOR1prcGh5QUQ4ajN1aFRSNC9VL2JGOHkyR2tP?=
 =?utf-8?B?NUw5TmthRXh3L01wQmRZcWZHSS9LL1hVdElNMFp5UVM3SW1nQW16Tjd6TjNw?=
 =?utf-8?B?VXRHeGhMcE5MbTFrb0orSTJOOUtwM3FiY1k3Nm1QdGp4blg1djQranFXRmYv?=
 =?utf-8?B?OThqdE1OU250ZUpXMGlVZjhrN3prOWZUV3BzcktPKzFTL3JzVy9vZU9pS3lW?=
 =?utf-8?B?ekNidzFjVVJHaHFuR29lc1VZRFhoTG5XVzRSS3FWWllMWkgxdG03UkdiOENh?=
 =?utf-8?B?V3FGQnMwWm9maXRhbGt4SUU2WENydkJ1eW9GRzRvSkk4NHhsZnFqSmRjaUJR?=
 =?utf-8?B?M015bUxLT3Voam5aeG1qMDhLdS8vMXNSMEVDNGloK1BoZGlJR0F1OFgxY1JU?=
 =?utf-8?B?cmdiYTJCWXZYMGhiaENnWUJsSTMyT1pqeFdMemtLQlRGUFZ4NmxzTjZjbUlv?=
 =?utf-8?B?RG9WQ1FYUC9tczBUdGxnNDhtRTI4M1F4QjFmc3U0dGRvL3B4aWtzWEVmRGFP?=
 =?utf-8?B?anlRdXFzcC8vZ3dDYzFWaUpjdEFUNFhHT0QyaUZhbkl2ZSt6bFgvTmhtUWI3?=
 =?utf-8?B?SEpGVnllQmpxQXR5alluTU1VdCtKMWtDcTFTSmpZQnBkT3lCVXVwbjR0Ulox?=
 =?utf-8?B?WlVnRGp4bHVRalIxNTczbjdaNjIzWnZJQmx1bHcxNmVrcWdTNXJoSjBoay9s?=
 =?utf-8?B?UWdrL0JibmRaZ1ZyOHp5b0dMcWsyVlU1WVJrR3g3RkRWSm83eXdTR25GMzVs?=
 =?utf-8?B?RGpwdXppOU5OREw0SE5zWWJYY3I3MFFKWjRaMmdzQ01rQXVaUDJzcWhqRHE1?=
 =?utf-8?B?M0ZBcndlQ3JncHNqV2FYOWJsUHRQSWxVMHlDSWhsdGZtV0hWWjdEWWdlUUxp?=
 =?utf-8?B?TjRIempyV2JrNXliK2JOUUtzcmJXd3VKUTg2b3lTd0dNL0tXbFpNVERoRUs2?=
 =?utf-8?B?bUNFajRaWTdlYTdEQ3NORFp0ZVc5dWJ6VUFmbjBUblpWeVQyMEJQUHNzLzBw?=
 =?utf-8?B?NHhBVERzN0JRYWFKMXM0S0hBV3Rid2syT0xLN0grNjNEM01jYU1meTJwV3Q3?=
 =?utf-8?B?WVlOQkwxWWhiR3hlNmFiVTlqWmxlZmJxM3Z4ZnMyTWpvWnJuMFBWdGV4T1Nw?=
 =?utf-8?B?NFNkSS9yUHN6dWN4WG4xeWdPQzNKL0JBNXVCOCt1UG5HOElPNzhkR1QvM1Js?=
 =?utf-8?B?RldaTUlnN2tEM3RyaFFDZ0pBaUMwWEFwamtLaGNlYXBTcSt3QTB6SmNtTFFC?=
 =?utf-8?B?VHFUdldzL21TWkFodXBVaUJ5T0ExanpjSVBEOHlxci9jam53cFJtYTVic1NB?=
 =?utf-8?B?R1NpcFRCL3c3L0VscGtqbWsrSGJJTWs2RXhpMU11aUt6dXA0WFArQUFJWFk2?=
 =?utf-8?B?QUlmM1JTLzh5MG9YSnUrTGMwOXRtYk9ITlAzcWZBM3pTZ0wvYWQ2WDR0ekhQ?=
 =?utf-8?Q?qIPu8HFAG22BRIgzaqskCnHdp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e35639-9605-4874-085e-08dd7bab46ec
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 23:22:51.7889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIj63L1ygSI+qKeGxEhRl0EGiliVzhur2MaYeU+9SmdGK21SO19iY8T+gBuuksI4bbTdillaVLR6NSqf5s4wvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5938

Hi, Reinette,

On 4/14/25 09:04, Reinette Chatre wrote:
> Hi Fenghua,
>
> On 4/11/25 5:18 PM, Fenghua Yu wrote:
>
>>>    arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  636 ---
>>>    arch/x86/kernel/cpu/resctrl/internal.h        |  380 +-
>>>    arch/x86/kernel/cpu/resctrl/monitor.c         |  902 +---
>>>    arch/x86/kernel/cpu/resctrl/monitor_trace.h   |   18 +-
>>>    arch/x86/kernel/cpu/resctrl/pseudo_lock.c     | 1080 +---
>>>    .../kernel/cpu/resctrl/pseudo_lock_trace.h    |    2 +
>>>    arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 4556 +----------------
>>>    fs/resctrl/ctrlmondata.c                      |  660 +++
>>>    fs/resctrl/internal.h                         |  442 ++
>>>    fs/resctrl/monitor.c                          |  932 ++++
>>>    fs/resctrl/monitor_trace.h                    |   33 +
>>>    fs/resctrl/pseudo_lock.c                      | 1115 ++++
>>>    fs/resctrl/pseudo_lock_trace.h                |   17 +
>>>    fs/resctrl/rdtgroup.c                         | 4313 ++++++++++++++++
>>>    14 files changed, 7668 insertions(+), 7418 deletions(-)
> This patch is huge. Placing a response in the middle of it makes your feedback
> very hard to find. Please trim your replies.
>
> Reinette
>
>
You are right! I re-sent my comment and remove all irrelevant code. Now 
hopefully it's easier to see my comment:)

Thanks.

-Fenghua

