Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646994A23
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747271914; cv=fail; b=okpkpJ502iIKchT1PczpxYVq6tuNvgCI1yOvGDaSGT7rhad91PGRxjoHwWCaZhH6OBewZ5R4sdVfpBInIZZR74J/qYd/sESQh2bd3pVKVreDzklV1u8l4NbXxEDM5wlh/L+pIGiqOTKcyX4OR6VUUAeQXlKKwZv6GSYUxj4YtfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747271914; c=relaxed/simple;
	bh=cWdIvqym5Vjg9NUG05IgCaSSy1/5UCfAXHskhq5ygPk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PFhZJDtvS+yonBu32lPhVW3V4GB9anur2bendL6jB3r9AF/oWNtABkg6jV2fUJVTUKprNEGuLbWFs2cfkjV6efvrSBOSETyocjeZW2jvkhHUwGYW9QzYzxoOCOc5foZVUAqzcV0qsa8oYr1uJk3kSzLXLJThRco1V1xoiSbMjWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UtMycIHd; arc=fail smtp.client-ip=40.107.93.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UtMycIHd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olvhsN72sSInAzqz8jY0LuTdbuUBmHLAfvLhB5fP+dCRLPu/55qm0obeKOZmnHOzyfFgN3AoCXkDUFFZp2JjnHQFDfp9o4WALeuZ7Hh2ulUZmEmResVBirpQ66rZiHeliBqC29+verdNC1Ro5XZsGVyow9y4/bVLHoiSdviDUp+ueCNPZiRa9AiTsnquavhslt1WNwEch9l1hPGXo80MFxlbkNrEs6eRLOFx/w2P4DH+uB/sWjG8b/cBC5FgE0CzLZBSretUOdKrKKCJpbOQRexscwU5RxCwVAjXa0jEkC+8CybZ/3R+xvoOC7aAtinyTsYt01miwTiYXTodJfSMnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWdIvqym5Vjg9NUG05IgCaSSy1/5UCfAXHskhq5ygPk=;
 b=MmmhyXRP39OLeaG3k+KsnRKqK7sSHB/LIyowB7mtolwop873TyvIQFnE8xYi+GMqTaow8Sdjhi/VqhJWE4obSOBp31j+qKiJ2MX0Aj2HORLkIi/216r451n2eOcV+PVKl/gEu/qyE36qoc2iGJmWx7EYUc7dZjGp+eMJ6ODWTz09t2y4es9QZ6zNA0/yoF6sxlUtZqhLqF/lQfsZ+wvuMcyS46ktT+ZjDEourLKyBFSGaITfAW5ddEdzW2gh4t28/FUX5Zrn/3oJdlQeQhw9BEdsglK0EQnV7pZFXFgxJxUrvr8Qnl4pHC8Kbz9+ePMVkYtqTg4527PzhQ/5id7q3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWdIvqym5Vjg9NUG05IgCaSSy1/5UCfAXHskhq5ygPk=;
 b=UtMycIHdqL8ksv7m9yUfemPuJdGW7pBNqM/tx1gIg0i9b8W5UUvVzRAPBsyixBvZN3mHSYCbPUTZPuv5eH/QjfgCOzQPrQ9XBHu05HNJLKsV3tQBBMYnYmpNqr/UUvZ5C1T+T2wZq0VJkuOoa4uQCwzkc+v/ky5Cz/cAoX47Pr7ORdi89nZTs5L7XY5MmAj+/QreYs6wlCS+UI/De0lt/Gm6jyieiYhWllkE8SoDJP9ifLlzIE9+TFgNJSr+V3e0H8Yf/v6tmvTroxLo/XgGhtPPI2h8nTpQJQ6nOP5/JRezhdz1KMIXTErTCWoYDgEsZW5uLfC31UI2VJIsQr2QRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB2667.namprd12.prod.outlook.com (2603:10b6:5:42::28) by
 SJ2PR12MB8650.namprd12.prod.outlook.com (2603:10b6:a03:544::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 01:18:29 +0000
Received: from DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2]) by DM6PR12MB2667.namprd12.prod.outlook.com
 ([fe80::bd88:b883:813d:54a2%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 01:18:29 +0000
Message-ID: <cf855b76-af04-49ca-bee5-91b9a96c1843@nvidia.com>
Date: Wed, 14 May 2025 18:18:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 23/30] x86/resctrl: Always initialise rid field in
 rdt_resources_all[]
To: James Morse <james.morse@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
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
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20250513171547.15194-1-james.morse@arm.com>
 <20250513171547.15194-24-james.morse@arm.com>
Content-Language: en-US
From: Fenghua Yu <fenghuay@nvidia.com>
In-Reply-To: <20250513171547.15194-24-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0065.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::42) To DM6PR12MB2667.namprd12.prod.outlook.com
 (2603:10b6:5:42::28)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2667:EE_|SJ2PR12MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1af161-0cbe-4cc0-41f0-08dd934e6686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MWROVUJjOG5vM0dtL2s3Z1pvYXlka2dqVW5jUlNHL1dDOWNvTm5GUnNJMENu?=
 =?utf-8?B?bC9TcFRKeFF5dU1oV2lETDR1ak8va0N5L2ZQN1BJOTRsZkM4ZU5jUnpHNkQv?=
 =?utf-8?B?eVdNNWc4R0p1RGxTS2R1UlVHaWYvZ092UUo1TENBY0hqUUpBOEhPNWlYdDlo?=
 =?utf-8?B?Q04vRUJQZzFmVmYxdHhmRThXY2FZM0hsMUhDZjhIWjhKZVJhaFp2SUhmOFBy?=
 =?utf-8?B?U3d2SThxR3JOMUd1VHhaT0VpZTNLZEdEWTczTXdzZ1Yzc2hHRXJQZW1WK2N2?=
 =?utf-8?B?UDdUcFIrSnRHVW54anZjRmVMdXdILzF0RUo5ZHIxMjdQZEtnWmkvcEtoUnVy?=
 =?utf-8?B?dGRlY1lkTHFjdmJwTXJhQjAwMk4xK0duZkRBMUlHeWJIbStjbW1pMk9FTnh4?=
 =?utf-8?B?RlJZWFRqcVJlUFpmOWdiY2E3cDRTZUNXWXBOS0ZnOXlqNmQvcDUxcC9PQkM4?=
 =?utf-8?B?R2NrTHlzK3RDUnppYW9iMUMwSlkwUFNyb2tNTzlTUjlVS1ovL1BQa3VoSVFs?=
 =?utf-8?B?NktJY05qZTlkS1lvYVNnZnhKWFE5Q0FPeUJOYjFmMFdZU0RteFlCdmY2Ykwy?=
 =?utf-8?B?K2QxY1NiczgxeWJwMWNib013Rlp3bGwxTjZ4dGFKdlRrY2dEN2s1YnZOQVhx?=
 =?utf-8?B?SU9XZ09vQ1lURmkzbVJXNUdZY2p3U09CL3M3T2ZQd0lhL2RNZ2tPWmtFVHlp?=
 =?utf-8?B?TzB4TzkzTDg3d3cyendmU2lhZUFoalNqNVYvTHB0N2lSNFMwNEZmbWpQNlox?=
 =?utf-8?B?Y3E2RDF3WjJ6QjllSDhHdGNvR3lFeW9hUEJPSmtmbDRtNkF2L25obmlNZDYx?=
 =?utf-8?B?Rkttbm5vNGx0Z21DVDlpRWp4OXUycDRUODVmaktCa1hKVXRNUjkxQUt5S0JK?=
 =?utf-8?B?VWwvYjdzdlBwcEFzb2tNazJCQWMwVDJ5bEw4ZWh0b205RCtqOEswTk1xWlRU?=
 =?utf-8?B?TnlZQ0dQOURrRkUyMTArYjJPVURZWWR6S2JKVGh6YngzTGpvLzVZTHFwamZp?=
 =?utf-8?B?UnhjTGVHTGxNRHh0L2NDREEybEZ5elRDc1RSWGVrT1lUdUZwbWtxWGxxTzdE?=
 =?utf-8?B?M1dNQzcrU1dRTk1NbjQyUUNVaEZtcVlDZitBNUdhck00YS85MHh6UURkR1Bp?=
 =?utf-8?B?ZkFhd2FmMDQybzJnQzRwelRsVktiT1p2UTUxQlRWblc1a0R2YnhJNnp5TStM?=
 =?utf-8?B?WWtabG9ReVNlSDZCb0dmUHF2VjQzOURvM2cwaWlrWEdvRFRiZy9MZUhZaDBq?=
 =?utf-8?B?anlLK3VqZjFnUGJ2cDBGSzRaUjZOWi9RUlRWK0tMMmU5WFNUa3NmbEZyM3FB?=
 =?utf-8?B?K0htVCt1eWdUcllwdXBjRTdKYm9GbWFjZGlMQmt6ZFBUMEdKY2ovSFZINVhE?=
 =?utf-8?B?UXZ3LzlER1piVmdobkRUcmwxeEtIM1ZiL21RdGhQa1ZVUGJERG9xY3E4OXF5?=
 =?utf-8?B?dmFRUHI3ZTNvRlNXczEzWHlSbHA4QUZGd2dBRUZCUG55UlkxUVJUMHV2MlRI?=
 =?utf-8?B?RHdLbHMvNk9hTkN3Q3dlcVkvWncrMDNLVjNwOWloYnNSTTdJTWVxY1k4SVNJ?=
 =?utf-8?B?TXMwVlA5Nm9RYnVzVW5nWk9LTWcxS1pxaExyLzRQYVJZMXVkYVprNjBnTW92?=
 =?utf-8?B?NG1zQkYvREVNSUlqdm5MaGlROWw5MERWNjhEaHFGUzNhTTJrRXh1emNQVVZy?=
 =?utf-8?B?ekJsOTkzYjVGK3dmOEVMNDdRRW9uMzg4dm9JR29aRlBoNDJjd01hRmJKdUU5?=
 =?utf-8?B?aUR2cTlydmV5bnN4RmhrSzA4ZERmaC90Wi96bjNHalpxdlo4SzZsVGZiMTlR?=
 =?utf-8?B?OTBIMi9kYUFFYk9OSmljcWVjaWE4L3FmYnpYc25QR2pyc1JhbE10VGJoV2Y1?=
 =?utf-8?B?RDRQWmFNdTFiRzJMbTF3S3V2b1kvN05Pb29TNDJlVVhNbEtlL2o2b2Z5d1U5?=
 =?utf-8?Q?ihJRlU7E/oA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB2667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bERFbi9kbGlidGkvRFJjZisvUGoyZTVzMmRSZ2kxS3RJVXdCNU4xd3NTMnFv?=
 =?utf-8?B?YmdOZkVCb1ZpZTVqS1hmbVpJZjRXekFHUG5mdnNDMWllREpqU3hCa1g2TENz?=
 =?utf-8?B?ZzZHK0ZjVDh3WTcvNHM3aGMvU1pISFVqVkNSSENyenJzTmRvZWorNkpXemU1?=
 =?utf-8?B?RWpnNnJOQzNZNjEyN3VORDhod3lPdmZXNmpCZlNON3Q4WnVpS2hVaWl1R29U?=
 =?utf-8?B?dUNCaW1yb0hZeDB3dHR6cExGUGJ1a2I5S0lIT0RxbENTeEZCTDArQXNKTmx1?=
 =?utf-8?B?cmVIQkFqV1NPY2FIZzR6YnRJSWtpdFF1a3RlYjJnY2IvZHNwYjd2YmFBa211?=
 =?utf-8?B?MDBMYTdiZXJFSnpGa1RvU0J3YTBGVllTcEJ2WXE2TTc2TWNWdEdwREFVenYw?=
 =?utf-8?B?RVlkYWJkQzdKSSs3RCtrcVRUdHhvM3hQTEJraTZCZktrZFBJaU9zbXh2TFcy?=
 =?utf-8?B?a3FFZm5DdUpBaXVrcG9JaXN5aThuOTJhRFA5MXV2TUV2aW9EZ1p3VkZhd1o2?=
 =?utf-8?B?NUxvL3dNa1BxWi9TYVNhQnAyNk9jRzhCaDNidnUvMVhITTVrVHNOSnpHZE5o?=
 =?utf-8?B?M0JZNmlvMnEvNVhIN3hmb2RQZmsrL2lQWWJ1Q2V6YlVLRkZWQmJQY2dIc0dY?=
 =?utf-8?B?Q0lqNFRiY3BJNnZnMmZoREZNZ09ualVTSkpuQ0xQdnBJZWtleUMydDBSa0s2?=
 =?utf-8?B?R0lTT2pxdmhyOU5Hb2ozeXFnclZkc0ppRU1MOW9SV0FHUkM1U3ZQRWMrR2I0?=
 =?utf-8?B?SGpQYzY1eHdVTGhXSmg2MzZSbTZ2b21wT1FzQ2RSZEdQR0dDR2xtZ3JqbDZt?=
 =?utf-8?B?QXE3RVZJNTRaRTB2UTFLSXBhZVgwUmpHN25JRUVwVFUwZTFLeUNIWDlrcHVo?=
 =?utf-8?B?WlVJeXRTSWpIYUxocDE0RGk0MU5VbzFoMVJxMDFLZjlsaTRnMmxwQ3NMUUhB?=
 =?utf-8?B?UlpYcWJsYmtqckxDb01GSXVLZGlxNThsSU9NdnN0NlByM0w0YVVSQkh1Q0Zh?=
 =?utf-8?B?TFR1Nzlaa2wzZHpBano4ZHA3aXhQeXVVM1FmZTNSbVFscklMMDMwODk3RVZX?=
 =?utf-8?B?MWM0bENZaUpLR2hYaWFqaHF0cENaTGdHMyt1dDdVVUsyOERyUWJXbkJwdVdq?=
 =?utf-8?B?N0NsMXZXdWxaUnZwbmVzRG9SL0gwNlB3TFkrdXd2ODNwUldKeFVJbWJLREly?=
 =?utf-8?B?MEtzL1NBcVlWZXgyM2xzV0lWUGdROGM3cFMyOEJTK1FoMzdMcEJGZFM5Wkgx?=
 =?utf-8?B?Mit3cWtFT0FIWFRDSjVMWTBBcGxtL1FONTJheFpCT3ZSNFFGMHhVWUk5VVo4?=
 =?utf-8?B?Tngwd1ZLdGtydVRWeE54TjlpMnU5bzRlK1ZQaytRZnNuZFU2Vnp6Wmxva0NY?=
 =?utf-8?B?ZkptRWZONnJ5eFFkbXpTenlnNnZOdFdqUytlMjNXVDBmWXFFb04weXRwZ1h1?=
 =?utf-8?B?emNVdHFTUFVRTG5QNDBlZ2xILy9JUTl4UDlSTTNlVVVUZXBTbko1M1k1cHRT?=
 =?utf-8?B?VlZ0NVQ0a1ZtT0JZUkVLOW5BNERiTDFxUURYLzkyM3dFVE5DYUFkNWZmK3dn?=
 =?utf-8?B?NWVDMzJVMy9BWlVQSzZZRjdGMmVYUGhHcEhCZFZYOUhrVzdmVytrck5uZ3Y0?=
 =?utf-8?B?d0JxZ3h4OENIMStnd0xLdjk2cXBITDVKMDR3UjE5QkFCckdlQlpDT0dIRDBz?=
 =?utf-8?B?cEhmWm5DNEhHZmROVDZaY0o0Rmk1a1ZOYSt6MFd0c3lkODViYnp6alZEL28v?=
 =?utf-8?B?TlhteGlzTUVaZ0Q2eW13U3lIRnVidi9PVGwweTJVencvUW9UNWJUTEVjam50?=
 =?utf-8?B?SHV2aFNUbDNmWGlLRGhFVVhJUWMzdUViUVZnRzBPZGtYbEhJYUdWWk1JN1d6?=
 =?utf-8?B?NjhkeUIxVzVrK2xZQzNjRlhmS2d5NDNBL0lYbXZzb0RlSHp0Y21jL3JpWFBn?=
 =?utf-8?B?ZWpjUlZXanBXTU05Qy9DdHJzWDhmaVo5NXhEYXNYdWp6YVBFNUt4WmhZZk9z?=
 =?utf-8?B?ZFlFM1JVT2lFNnJ4M1habUF4ZTRWYWphblY3UmNCazhoNnFUUjFYVVVhLzlQ?=
 =?utf-8?B?ZDY0ZDlQRzIzczZGZ08xNlJYVG5hK3lFbDVnRkQxMWRqYTFtVURNNUhRRER6?=
 =?utf-8?Q?cjXcUaV4JuHSsR9/9bqdlReKn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1af161-0cbe-4cc0-41f0-08dd934e6686
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 01:18:29.5470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RG2WYzUaIT5KXOM4nHW+deB67c4+UOhI3saRxwbV61JihK/vfX42+PqQB5KEoD+rYQ4hPLrzvbHhofFaepOR0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8650


On 5/13/25 10:15, James Morse wrote:
> x86 has an array, rdt_resources_all[], of all possible resources.
> The for-each-resource walkers depend on the rid field of all
> resources being initialised.
>
> If the array ever grows due to another architecture adding a resource
> type that is not defined on x86, the for-each-resources walkers will
> loop forever.
>
> Initialise all the rid values in resctrl_arch_late_init() before
> any for-each-resource walker can be called.
>
> Signed-off-by: James Morse <james.morse@arm.com>
> Tested-by: Babu Moger <babu.moger@amd.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reviewed-by: Fenghua Yu <fenghuay@nvidia.com>

Thanks.

-Fenghua

