Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2081.outbound.protection.outlook.com [40.107.95.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8EE282E1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747264828; cv=fail; b=HZCrCGsINNBruQ8TvMU8lkPW1gxKF3NwPYqIrYdwQoe+cz/LP7vnzAdsBtLysHTErNj40CrDKFHCOJyTTllTf6jNuuiu855aA6Vc+7hhUkzYnDGJj4//R3Vj67tRBdwqBzFsWM8L1xrM4eozlicP66UP/0xvuz6tXtAOis6TjrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747264828; c=relaxed/simple;
	bh=fFD990EItlfrFlXNbOsTAAr/hBvngflrTpdzPYC2q0A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jtvIajVOyH/CQF8e6cuWkNFHPj0ZyeHcFr0O79zBJYQnrqXF/imjLIUd8C9egPuwwOgJn1+ZGNUNz9fRtbPKolCEujy9s+3+Qy4WVb/Vy5j8nkaYRM7I32RWYz01JCJtFZcpfmQ41rtVNqAuezVa1fizNOZ7uNSeXjXLqSfBX8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kdERVkzp; arc=fail smtp.client-ip=40.107.95.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kdERVkzp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fe+JJe4tZdsL3/gjg+9D284m08opyAhbqvAJqgKcqra40U2miLkxABfMLltnaIRcHMZht/ky/WRDYz/uYUheY4aYFLvAlYjYTon3q4h3hMGMLpq9MwNOaK/p3AXKIRh0VEzELdD4X7xwJq0/e9Fi9zc0JTtKkkaWfVAYwUKiQTbPIqqQT3ZZE+5xoekDSPtqc5ZVWV64OsebJS/V9dmeKCwr+yr/yyNDbar6drb/HubNlQF0jCk9O2pt/CjyLQFwtpnVXrY/JJj9RSFHiBKjnUHs5pzgB5h1G1dyBSCyYmqtDqGQ0s/co/ReJu/cXbUlMAAHeeYQaEH39ZpGs8zs9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGMipGuDki/V1R99AYT+4Acl5RafpKyp6EdaEYJBO4Y=;
 b=BC1qgDh77tuyZHHX+ea8yiAK9yzzQ/Be1Rsiho+h4O2JVrVOlxh55niGUxuG0yGla8yRMJJy8OjmDiazHKfVAvCrEU6g9wt5BAow8n11P9C1RPfm8zM3hWq/EegtLPSMPoLNPyY0iThJn9hNWtATKMs70hTyVlQKcath3reldRTL+Pp0XMwMPno2kBwW+gWKOK9oSABdMa999niA7tnQUkT7rgeBx5q0beWrf5tR5e1VGokrEUK7tQ8F8+7RRab3jYcxNJ/PEOQuNPfJXLuJ3XxgQzuJQ+KAWLaz0qXnqEX5GpsbVOzfJdUKbNs4QS1750dD3v+PnL02RpQtY7BJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGMipGuDki/V1R99AYT+4Acl5RafpKyp6EdaEYJBO4Y=;
 b=kdERVkzp1g5Qxg1MApOb2QirxJaFlOKCXQxnoQYFBjrf41MnGwRZ6RiAEuO6g8LJoRZ5yXYSxJ80zaoECGQP5fwE5YUuHqlkjhuJkVmU92T7J4NsMi0SJY1tvx2TS7aIfzLvW0nPz5SLQ56TbfOrjxRFE+vpBfuSisR2/jXq++VfK5hRrwXJ3OkQ+H0gw1ICsuaRJ784E4bK1sBWwvpkcbDNl+QUT23ATly+jkzCiX1oa4GjdNSUg+cRc8TNDOc21MlgTgY1P+GNjX3TQ/2nji0TuHM7SSbL00g5KXOYND6LDl+/5YSQoh2skZkSWzf3ej6S2CBWdwJn7QHsVkgU5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 DS0PR12MB8525.namprd12.prod.outlook.com (2603:10b6:8:159::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.32; Wed, 14 May 2025 23:20:22 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 23:20:22 +0000
Message-ID: <e2b35d83-4347-4502-a76b-107f92f6a3a2@nvidia.com>
Date: Wed, 14 May 2025 16:20:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 02/30] find: add find_first_andnot_bit()
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
 Shanker Donthineni <sdonthineni@nvidia.com>,
 "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-3-james.morse@arm.com>
 <4f8b88aa-524c-4416-9eaa-74ea68ff1ed6@nvidia.com>
 <ce10214c-84ac-438a-ac0b-d876e322b2f6@intel.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <ce10214c-84ac-438a-ac0b-d876e322b2f6@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:510:339::23) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|DS0PR12MB8525:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d71cc3-40fd-4a89-668a-08dd933de5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1l5eVJiZjNCdFNKc0lhVmFpckFzblcrNmRNYWVYT1lXSkw4ZVlzOUd5WW5L?=
 =?utf-8?B?NTRxUml1dm9PU3NvcEVMZXhqSDgyYnRYVVFOY2xwMnQ5aVVWYTQ5ZFBCTnNF?=
 =?utf-8?B?YlFyMkxxOXBiV0ZMWVNicW9XWGlLeWtrSTE0OEw4VDZjaUhLTTI2RDArSTg5?=
 =?utf-8?B?Qk9rdVE5Y2xNWW1QdUtpSXlTVUVqSWh4Z2d4SU01cjQ5Q0VjNjNuL01tSnV5?=
 =?utf-8?B?c0pIZnd3cDVXcExnYXB0ZGw2d2NGeTBqN3ZMa2N4MTNtK2hEU2YwRGxUV3RZ?=
 =?utf-8?B?UUlkR05mSUxtOGhDMUVlNlM1bk1LcUFPZGc1M2U1MVFkSXM4L0I0N1V5MUFX?=
 =?utf-8?B?bGYrcWtYb3Z2WUpnckFyTWpYNnVwbEhqdzFjeWxDZmx5Mm0yM1dTRWhZbGhi?=
 =?utf-8?B?U2NreTVSMGNWR0ViTnVDcVM1c3h3VDNaN0VpMlZBbC9oU05NdXhUbmtsYi8y?=
 =?utf-8?B?eDJ1QzlBeFhNcWRnS3hPZ0RVY0Q4a3N3MU94UHhvdHQ0b0hSNHBoNnZvckFE?=
 =?utf-8?B?UEZQMDQ5eTFOUVRDbmRCNHZ4UE14Uy90TzZhV1RWRFJjWXFUVXljaDRxSjhR?=
 =?utf-8?B?N285VTZkUlVkL0tnT0laWDhUM1JLOElMMisrZW5PbHc1cE1VWGd0WEhnbzdK?=
 =?utf-8?B?a1NlR20yUXRxL3JlVlVSZGF3RkZGMzFIZGZRbUxMZDJKMmNpQlJKOEluaFVt?=
 =?utf-8?B?akprdGpoRnZ3VTh4UlZLbFlldTVrVVcyVHZMRCt2RHNmK3V4T3ZhZHM2MzRQ?=
 =?utf-8?B?SHV0c2YxZEwxMTVIdlAyTDhoTGYyNGRxUUV4L1ZERkhjZkltL2R3VEx4RWdJ?=
 =?utf-8?B?Umt5TDV0NFVlOHJPWVFHUUlHT09qbTVOSjhpckhQY0wyRVpXS2Vrb3N3S1JI?=
 =?utf-8?B?Q0FUL0c0dHFaM2Y4REQ5Nm1BQzN3TmQvZ0VDVDZXeU4wMkUrMWVoL1BYVWtS?=
 =?utf-8?B?UThReStaSmYyRWFJeUlsSDV1OXZ6aUNsaXNGYmF5YnMyZzN6Mytvd21NWDBC?=
 =?utf-8?B?UUc3S2F5Ri96MkgxK3czeVpCV1ZDRjVUR0ZrWDhuQm43S09LL2hNTmNqdWUz?=
 =?utf-8?B?MGkwRnVUdjEvOEtGd1JYanBlUVJaMUJJVWpJZm1RVDZPbnZCeVd6dHFyTXNF?=
 =?utf-8?B?UXIxeFg3T2dHdHFNNDFUenROUXY3enVxeGZDYTR6akg3OSt3aFArQytnNGVW?=
 =?utf-8?B?WXYrOTVUSTFpUlpzMHJmTjNpaWZaeTd5YW15TkRqRTZsM202cnIzZUpCNzRT?=
 =?utf-8?B?OVdvSjdDQXlJTUlVNmdUVFIyYytPVWpQejlnbWdNdllrT2lReGJTdmRLaWZB?=
 =?utf-8?B?S253UmdUNEwxcmFMdlYyWXJCOCtHN241ZDVrRVJ5RzdRT3A1VVRia3dmdHc3?=
 =?utf-8?B?N2tKclYxZitBRUJ6QVdFQjJ3K29QTG84WSthdUxUeFRWSzhXOGVEaXRTK1dj?=
 =?utf-8?B?WDZOSjdhbG01RE8wa3V5a0NselpnamdMWGhudDlaNGkrK2pGOUw3U05yZUph?=
 =?utf-8?B?WG1VbkxmVVJLbTVyYjNkb3pLS3diWkJEMENtamZWZGRIM1lOWGdpYlFjbld1?=
 =?utf-8?B?QU9jRnNBcHpSSGF6SmFZTVJrODliWUxHL0h6OW8rM1BRRHY0TzFpVS9YNlRY?=
 =?utf-8?B?WGJMN09SOGtBZ2JHRzBad1g2aTJLM3FXTFNNblFrWjRwLzMwUGJPbU5WbWQy?=
 =?utf-8?B?WXZZWFAxSFdpaWx0ZFEvK1ZrVGswaTNKd0paMDVxZnE0Q0NWczAzMUFJZHZy?=
 =?utf-8?B?bmw4eDd1MS9pRUlzWlBkMkcvWXdkbmd1WW1PNjF5WFlUWmk3MFl3bFlJRTEv?=
 =?utf-8?B?UE5LZ2R6Q0JnYklUUkllYmR6bTVPS3ZDMHVyVXYremJoUUVFelNCcTA0SmQ1?=
 =?utf-8?B?L1U3SGs4cjlzVTZvUzZIMVpkR1dVc1huaFo0MmxWOUd0TnVVZndjVEZUYm9h?=
 =?utf-8?Q?a6Nbneoeldo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEVkNElVZTdXeDZhVWdYZGg0bHhEUldrU3Zma0lMejVReXB5QWo4NWQvZkR3?=
 =?utf-8?B?eEJnZzVUMExnemVJVE45R0tKU2tPYlZha1RRckFRWko4ZXpxQk9DSWdIUllE?=
 =?utf-8?B?Nys3dVd6ZlZFaXVZUXBhZ3dXbFk1VWI0Ym55cDNNalgrZ3RVOHMzblU0MmhR?=
 =?utf-8?B?RW1nZndQNmw1YmF2OGxXSkZPR2Z0VGhudXNqVlhwZUcrN2Y1WXJybUVaL3dz?=
 =?utf-8?B?OUoyUkNWdHJlTmE1S2VicXQwWFZVL1JaSExhcFpKa2FlT29XKzFaTjRkTkZO?=
 =?utf-8?B?bkxNVWVuT0puRzlkYXR4T3dTTEg2YmxRVUM0OHhNTUY0dHJYZ0U2QjVDK2Q4?=
 =?utf-8?B?UjNtT09IUjJpOVYrRzFIL2F4aXVRWXQza09WQkFSQzk3aWd4cndLMFBoMTNo?=
 =?utf-8?B?aTh6UWlqWUVVQXNqS1Yxc1lCTmptL3NUQnNFeGRNNEtwM1hzNHl4SmdURGov?=
 =?utf-8?B?bk80RytndkNHd25KODlKOHVnSTAvUktuWFNxcE5qTE8xNjd3bmZRaEVacEI4?=
 =?utf-8?B?aXdDUkFLVWMwUTIzQmE5M3VaNWZRRzRMaTJtWGozeXhMdnlrK3d4eC9UNDZx?=
 =?utf-8?B?SUo0ZFJBMVFKTEFqOHdyVnlsbEdpbWcxMVRlOWxzN2JtTXRUNHZsYS93cWZC?=
 =?utf-8?B?S2E0UFB1YlZsZHdzaXhkSlRCZVVJVTBtU2FaZzBpZ0lFRDV3K2V4clo5VWl3?=
 =?utf-8?B?eDhIeXpLalV1Q2FibitPUUJNVDV4OWFiMmM4cVBHUmdxY0E3UmlOOTlUV1Y1?=
 =?utf-8?B?Q29DSjV3azdiN3hFZVg2Zy9rZVhLWHJvOFM3QTdydVZESElFYmJLL3d3U2pQ?=
 =?utf-8?B?d0NhTnJsUnhBRlJBc0o2QU1JN0EzTENSMGx0V1oxSlBLc0N5QVJMS0hSSWFL?=
 =?utf-8?B?Y1NVKzh3TnN4NVcwTXhrc3ExdzA5NDhyNHo4NndWa3lhby9TOUtSSmE3RTFT?=
 =?utf-8?B?My9Qc3lCNG52ZE1zMmo4Q2lsMm9nRTBXRWRkNjI5SkNDTC8wd2VycUVCV1ZZ?=
 =?utf-8?B?WUtZcC9ucUZ6eE9UZXFYaWVodTExZ1NGcHhCNlVTWUZydXk0eDVGajZGcnRU?=
 =?utf-8?B?SFNUTm5aclNrcUxZQzgwem4vTWUrUFlXd0ZiYnZqUC9BRllEVm1QMm5SSlNm?=
 =?utf-8?B?citNbzN2eWZ2M01JbkU1b1hCNEpqeHVseDRYOTV4U1RKbVFkdUZ3Y2tRbHVv?=
 =?utf-8?B?alZZTmdoRFdlcnIzd0RxQnpuWlg2QW80YUZtb0FybXBMZFlLNGIzdWxESXcr?=
 =?utf-8?B?N3IyN2xPWjE5bE9EaXBkZVB1b3N2ZC9uTTFkY21YSFZ4UzZFUXd1V2t3OStZ?=
 =?utf-8?B?alEySnBtV1pUVXdFR0YyWEkwOUk0RXkwSVBVTS96QmtkVFczSW9GSlluVzBN?=
 =?utf-8?B?ZFp3Rlo2cjlLbUk1a0U5MHJTZFI4Q3pNb1lzbVBUNHNtTk44Y3I0VURCVTBJ?=
 =?utf-8?B?cTgvK28zZTQrNjh6b3Q5N1pwZlVJQnhqeENjemdqZWIyUHdpY2pablI2c3o5?=
 =?utf-8?B?UkZIemNNc2xZMXN5a1VBQVBMejNISzE5YnM3WEZ3Q1FWbDgvak8xT2tMSFZU?=
 =?utf-8?B?M0gxS0tVbzdwcUVZYTVVRVR0ckl4bEhoamREbStBOHdkZmR2Q2xFK0pBZFBy?=
 =?utf-8?B?NE5OWHQwVHlMZ0EyMElrNE8rcC8vSjFtTzZaejNVNzR6YzBHbHA2NmE3M2lM?=
 =?utf-8?B?TmNHQkZEWFdveWFYc080WFZCSy9DYTM0cGxPc2RkcS95Y2RBMWhSTkRCcTBk?=
 =?utf-8?B?RW9ma1dOb1lqcEtjYzZGV0dmdGJjdU9PUUFQa2J0YkJsZDJsWkhFbXpZN0dJ?=
 =?utf-8?B?WWRzV0t0bFd4M3RNVUtESGxoWGZOSFc2dVZKcUEyZjRiMm9zOFBVTStmWGVG?=
 =?utf-8?B?c09RMGhoWG53NmtZZkd4bzBCa29UczNIa09yK21OUmQwYytTZE9IMkhFdGFU?=
 =?utf-8?B?eHVFNXdrUkZXRmZUbkQxY2YvZ2tBbGcvYy9sRXA1UXhlMVRDUzgyVk9uVytU?=
 =?utf-8?B?bEhPZFhCZ1llZ0d1TFQwQkVhTUFNMDN2QTJudDhVejlsM09GUUpMdWVRMWpy?=
 =?utf-8?B?WlNidzFLWDJzWTNidTZIa0dOeTJGRjJHOEdHSG14UUpOKzE4dGp1RHg0YzRS?=
 =?utf-8?Q?gSTjSAJVDbIPHfU8V2C27FG5b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d71cc3-40fd-4a89-668a-08dd933de5be
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 23:20:22.2430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVJPcd4ah+Bhuz9OUlMMYya5LJxoaqqM/7FPuwtNQ4f5BkbpxnDfepwYNfV9QMIQrXqmajEksKWfFBk84Q9w/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8525

Hi, Reinette,

On 5/14/25 13:19, Reinette Chatre wrote:
> Hi Fenghua,
>
> On 5/14/25 12:59 PM, Fenghua Yu wrote:
>> Hi, James and Yury,
>>
>> On 5/13/25 10:15, James Morse wrote:
>>> From: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
>>>
>>> The function helps to implement cpumask_andnot() APIs.
>>>
>>> Tested-by: James Morse <james.morse@arm.com>
>>> Reviewed-by: James Morse <james.morse@arm.com>
>>> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>>> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> ---
>>>    include/linux/find.h | 25 +++++++++++++++++++++++++
>>>    lib/find_bit.c       | 11 +++++++++++
>>>    2 files changed, 36 insertions(+)
>>>
>>> diff --git a/include/linux/find.h b/include/linux/find.h
>>> index 68685714bc18..5a2c267ea7f9 100644
>>> --- a/include/linux/find.h
>>> +++ b/include/linux/find.h
>>> @@ -29,6 +29,8 @@ unsigned long __find_nth_and_andnot_bit(const unsigned long *addr1, const unsign
>>>                        unsigned long n);
>>>    extern unsigned long _find_first_and_bit(const unsigned long *addr1,
>>>                         const unsigned long *addr2, unsigned long size);
>>> +unsigned long _find_first_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
>>> +                 unsigned long size);
>>>    unsigned long _find_first_and_and_bit(const unsigned long *addr1, const unsigned long *addr2,
>>>                          const unsigned long *addr3, unsigned long size);
>>>    extern unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size);
>>> @@ -347,6 +349,29 @@ unsigned long find_first_and_bit(const unsigned long *addr1,
>>>    }
>>>    #endif
>>>    +/**
>>> + * find_first_andnot_bit - find the first bit set in 1st memory region and unset in 2nd
>>> + * @addr1: The first address to base the search on
>>> + * @addr2: The second address to base the search on
>>> + * @size: The bitmap size in bits
>>> + *
>>> + * Returns the bit number for the first set bit
>>> + * If no bits are set, returns >= @size.
>>> + */
>>> +static __always_inline
>>> +unsigned long find_first_andnot_bit(const unsigned long *addr1,
>>> +                 const unsigned long *addr2,
>>> +                 unsigned long size)
>> CHECK: Alignment should match open parenthesis
>>
> This was brought up [2] during review of V1 of this specific work [1].
>
> Please compare this code to the rest of the file. Specifically, this
> alignment guidance is not adhered to in this file. In this contribution
> we thus accept the contribution from bitmap API maintainer (Yury) without
> dictating how formatting should be done.
>
> Reinette
>
> [1] https://lore.kernel.org/all/20250407153856.133093-1-yury.norov@gmail.com/
> [2] https://lore.kernel.org/all/062e5e61-e2c3-418e-987b-33fd9009d03f@intel.com/
>
Thanks for the info. This check is acceptable here. I already put my 
Reviewed-by on this patch.

-Fenghua

