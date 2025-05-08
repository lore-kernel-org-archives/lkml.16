Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2089.outbound.protection.outlook.com [40.107.102.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972C621883C;
	Thu,  8 May 2025 23:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746746010; cv=fail; b=kGpMe4mC0hbyB4ID4ARi3N3Fu/u9ltFh+y2jW3qC4OyR43hKduVUAiItY50e1xkGu413zZEuuIwNjXSk6t5x/arGejmi6mQ2zRJF0bF0vpxYlSoPYYulJpQHYW9DaS21NUfKD4TClg7fypsBpeRiOFVTE5S7F/PZIFQiA9V+qtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746746010; c=relaxed/simple;
	bh=zQ7FOHUKm83uFm8PPo4/DLR5H/+7TIxR2BW2BT3yFA0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pU94ES/5Ct+bKWsnPuhNQlbXj3OdBHAN2wn/kXAN0reC45HVaHeLxpKea/oLBO3YqSK6mPGfv7gZp3QuChzgoDtGqz+jHXaFKV9k29AB1F6VJhJu4NTQUSVez/WWY3T//PBNi3L5rXH9sxP6jV1jnwv8QQzjOAE5maJAhuYYyWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=LIapA81s; arc=fail smtp.client-ip=40.107.102.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LIapA81s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6KOeDQdN+Qud8GMAgQs+ULJGbI/B23YD3zMmIAkVLg9rbq2kIc8/+xqmThHZHb4setb697qNS6zaCwdoRLZeswdnronVQf9MRoxDGhf4a5bhZP3deg1MNy8IMd/MF14wMnOhhKvWbA753fil6XEiD698d9UruFAni1jX8ewv3VNgJpjOhf3releqZrRCEO9NnUsyGiO7anhXB70weVWeid1w8B6RdZyPMQmpR/Y+e0vinkozBhqo9P/yFxD+TSQ9jCaB9kRlkcl5bjnfhSBVpOwkXi3HkuTIwyXhuOwqkxBbzY4W/kL3o0PEOsrjSfVXE8WHYNSJ0PqSFhov809zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7Ujvu/NWKEEBfggPFp7LsZV8ozz43A3iLoIgREiezQ=;
 b=MNS4D9SWNQqXcKo6EH6m460S8RtEANG6M9uuEVdzRVo6TGdIDxsUX2+uXUuZxa6NXfJfc9jYRJBfVBby4xtQpdPYalO1G1soNmn8D+W0PcWvqJ4xF39OixIKWzAgr0bWOKw9NoX3ywc9j4Da3oh/ZFudNj3OgLrMiz8//3HtEma/b/0fgmkshZsQjOoTSZFC6eulhGMimk/Rb521CJEfZ+v7zpSPblGEbQtk4/iZLhbl6oO/Smmp+EBGBSkcI/Qhj0I77pZVjmdwgqAzib0BQCmxMx8Nz699UAQqtZe8K7k70p1s6fN1QV69M2O5Pi9CNQhk0+O9hzAHCJv4zxIU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7Ujvu/NWKEEBfggPFp7LsZV8ozz43A3iLoIgREiezQ=;
 b=LIapA81saw/nyS34GpZvOKYBbAPvpeBgNvgWCRhZ4dutA17L7NjyQmfTQzYvYtVie8xK04SduwfN2d6awXxret+FLJjKA7ehXjBbHPun1IvPsw0J59MArq84x8wCah+BJbX2fZH4FToApV8Es7UzK8jeYtkEgDtwHVqBSsDf0Hk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 SJ0PR12MB6926.namprd12.prod.outlook.com (2603:10b6:a03:485::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.23; Thu, 8 May 2025 23:13:25 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8678.028; Thu, 8 May 2025
 23:13:25 +0000
Message-ID: <2a9ba94e-7985-4ba9-88c6-45b8cf4d001f@amd.com>
Date: Thu, 8 May 2025 19:13:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: Add AMD ISP platform config for OV05C10
Content-Language: en-GB
To: Sakari Ailus <sakari.ailus@iki.fi>, Hans de Goede <hdegoede@redhat.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, W_Armin@gmx.de,
 ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250505171302.4177445-1-pratap.nirujogi@amd.com>
 <aBosuj_TbH7bzjfZ@valkosipuli.retiisi.eu>
 <0d801367-da24-4596-83d9-08ccd89ca670@redhat.com>
 <aBxalXYus1R6Xbrr@valkosipuli.retiisi.eu>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <aBxalXYus1R6Xbrr@valkosipuli.retiisi.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::21) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|SJ0PR12MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eebfc7c-8416-452a-7381-08dd8e85ef72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjNEOU96OGNNVDdXODJ3c2Zja28veUhLSmJyVGlUL3lGYllGTFVGcjQ5dTdQ?=
 =?utf-8?B?SmIxckR3NWFvSEVXZnZ4YlhFd00wZUkxUTd4aHZtQzFUZGNiOEZnY3V3Zzl1?=
 =?utf-8?B?Qm13d09xeVFiRUR4UHR6TlJabjltUlpzb3dVUDNBc3lneVRxOXR1dG4wdE9u?=
 =?utf-8?B?TUhTaDBuSW0wc1drL096NDBhZ3lucEZIQ2lZK2pGSzllR2hwM1RDR0lZdEE4?=
 =?utf-8?B?UTJEU2drWnZrTE5CWGNKdmdQenU1WEsybVhJdWc1Nk5jenVqc2QwRDR2Qk9W?=
 =?utf-8?B?WEZoc2RrMS8ybHdKTjh4NS9FWUlkZStnYzVQZjlCWUJVYkxGZFd2U2h2V3A4?=
 =?utf-8?B?UG1od3prZ3NNSHQ3azlTQXpORGM5aFpEUHovQ1YzV09IMDdvMy9kWjcrbnla?=
 =?utf-8?B?RHJOc0x2RWtybFVhUTVSVjFIR2ZKRkdHaXRtVXVaK0VxMXZ6ZlY2dDM5UHNq?=
 =?utf-8?B?M2Ywcld0R2pLcTdPdkVJdTEvQXl0bktNWkZpTDFmZ05HSUo2M0I0M1ZESjRH?=
 =?utf-8?B?RzlPMDhsWkdBNFpqY3FRcG9DMnZVV3RMSjNHS2VpU24rS2FpL1M4MWN6YVNk?=
 =?utf-8?B?VnBwZ1p5bG1obWEzcGxVMFFIVFJHc1F3SGpTL3grcmxITU9nTVlGSU1nUkZz?=
 =?utf-8?B?VEQvWVA4ZHdtVFEza2JoYkVGaXliNnZsM2tJelR0V0x2eG02SjgyeVhSaWJv?=
 =?utf-8?B?aE0vQ1kyNzI4bFJ0b1JiTW1kcUJGc1NpZTN3ekNnaGU0YUtSYjROOE0xQlJl?=
 =?utf-8?B?VHZ4SGVFZ0Fka2ovcGl6UUJmR0UzUnpIQWg4bzNPUFhhc0ExQXlYNURabzdG?=
 =?utf-8?B?VXlWSUVUaGwzUzFSQXhUd0FmREJZZ2lwb3F4OWZqWjU0cDNUWTU0TUlBSWFm?=
 =?utf-8?B?Z2RVOS9jUW9IczFDMWF6TTQyazd4bzZra3Zna1hVYnZlZWMvci9NSEdjYmcr?=
 =?utf-8?B?RmxJZ01CckNrSzRpQUdndm9WTVRiRmhtYmVZRHNQcGdodVg1TEFJZFRKT3hP?=
 =?utf-8?B?dU5wajN5Q2dxclBMNUdxa1JHbnlqZkcwVjZxSVFQN3laQXZUZGdjM0hUU3pu?=
 =?utf-8?B?VndvbDFrTCsreTM4cDRkNTJWTUhHM3piRkJPdkEvTlYvclZFNHdDdGtJS01C?=
 =?utf-8?B?Q2pOcWIyTW5Uc0QzaGpGZFhPbjhobWpJYk02YjRlRlVNZVFDTG5LNDB3ZXBI?=
 =?utf-8?B?WVFUYWl0aWJ3SHN6eUYyVTRNQ01VaEliS3MyOGRJcWdmRjlhYXhzZy8wc3VL?=
 =?utf-8?B?R0RSQmxlc0dTbk9tWWVlVmxZaW92SnpYajVjNDdhM0Z3dHYxOXIyd1lqN3hj?=
 =?utf-8?B?dTkrZUNaV1FXcUkyNElWNmcwdEUvamIyaW5TbVc2bC84TUpUWDZEd1Mweno3?=
 =?utf-8?B?Qm5pblQ4UlYzMUtyWUhIa3Vod0VLQnNHL2YrWlBySjVhZEZRZndPR0VXaXBw?=
 =?utf-8?B?SEtsUGRRY0lUWG05MWE5RGtpRzlUN0RzRXlwRDhJemFWVURlcVhpM1UrZzI3?=
 =?utf-8?B?RzFxcjZkMWxxQzhrbEp5QTNZZWhxNFNURkN3MXV3RTk2SU1xNGY4eGhZbGgx?=
 =?utf-8?B?T2NYM2xKd1ZNbENnTmZmNVhELzgxOFVwVTJCbmQzdVByV0htNWFadzdYMjl2?=
 =?utf-8?B?czFIcnRGRmI2WUN0U2Ftc25TR2pWZXh4ZGo2WUFVVUVPZTFTSktCUEI5OXh5?=
 =?utf-8?B?ZXYydnA3TEg2SWFWTzBWem45S2xQUCsyNVFwT0FQaHBINDJQV3VvRWJnQlR6?=
 =?utf-8?B?aElPQTVGbVJySjB6R21JUW9MazE3WHJqdmNRTjUvQnhRWTVJQzZ5eGZvS0xx?=
 =?utf-8?B?Ynp2ZjdDazFyTEhjK0NrVDk0S1d6eDNrKzVFUFYyK283cFBNNVNzdWtSL2FT?=
 =?utf-8?B?T01nWUhOOWtiUU1LU3pSSkhXeFJsd2FNeG5WUkhETHdwLzEvK2YxYkNiY1FH?=
 =?utf-8?Q?4c6zI87JIn0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFZWZEk5eGZ0REYwUENGS1R3c1F6OUN5VU9wQkQzMGxyYW1sYThOQmNhZFZh?=
 =?utf-8?B?ckhyUnR6TDRaSjAwRHI5STloUnQzdEk1OHZhVDB2ellOdE1jUUEza21OUm43?=
 =?utf-8?B?Sy85WU9FdDRJTTZuZWMvQkZyL3NuOUhLc3ZRSHV4Y2JFNW5tV3dua2l3NXNl?=
 =?utf-8?B?YzhSWkc1SmdjemgxaUROcjI4bllDN1ZHUjBnakZLMXVuYmYrQVNyNVFOQzhY?=
 =?utf-8?B?cHhUR0ZhQlVwWHM5cFRtN1BuL2Q1NzlJTURDNTZWYVhvSzNHdzlUMndXa0ha?=
 =?utf-8?B?Zy9HMDFDMEJFWEhGOC9mV1hOVWRxQ2UrRzBCNjdGVFZ5RmR6NTFRZGZhMXZH?=
 =?utf-8?B?NHM5RXpuVGlGeEhBK0NUbytSNzZOSmY1T1VCeTVMamFNaEtwbXB6VExoWVVm?=
 =?utf-8?B?a1BPeTNWZ1N1NjR5VFFyK2xidWRzMms2dVhLNjhOcnJuV3A5YmJ4N3J5VjVQ?=
 =?utf-8?B?SGVRSlhkU2p3YnNrRTBsS0w3MjV6RUYvZTNoMFlZMDA5TTlhN1hHRTBhbEhJ?=
 =?utf-8?B?cnUvVXpCZHJmaDIrRmgzVDBQRUJ5N2x0WFNLUFpyMDR4Nmx4eDI4UmhaNHFM?=
 =?utf-8?B?MU9mUWh6blJEa3RIUXUyVmpqYlhRYWs0dStVQ0V4dEhiUzZSazF0Y1dyNVRz?=
 =?utf-8?B?STJKQnNuaW40UnJGMEh2a2xZNDhtcE43THpXaXVITkVHOGpoeC9kTE9aU0di?=
 =?utf-8?B?bzY2YmduV3g4OCtjSW5Lc1B3S2xsK3poSk9wUVE1bjQrUzlnZmV1TlZ1cXVY?=
 =?utf-8?B?UXpNb3lFZVRSbTlrcE5sRFNueWNjcGg2UFltK2Y2WlhpWGNicEJvRXRGT1hE?=
 =?utf-8?B?N0pCeVFWcFNtOHpGT0pwZGs5TGZIcGcvTnZZVUVBSHJPTTNGN2kwNUF2aDdN?=
 =?utf-8?B?cVljL01sWDhxMnh5Vzc1dW9zVWtWZ0tHZW93aGhzOXo0VFdBek5HdDNXMHc4?=
 =?utf-8?B?VUQxcmE0WVFaUVh5bnRRQkorVEI3YVh4QzBKTXFBeTFJeFZGSDhsZENLczV6?=
 =?utf-8?B?V0sxVXM5ZFFkZ1kzeFloQjQ1QkZaeFJSWTEzKzBzSElIZFhBNHlIS1NxdWtD?=
 =?utf-8?B?dE9tbU9rcDg3dTFaZjRMcEQxMzRRVnRjK0x2aEdzSHNmWXdCL0ljcEcvam9Z?=
 =?utf-8?B?enI2MEladTEwakVVUnEwSktuLzh1RGJRSVFhQlpnSjZ6Y2hBSnpCN05yL1Z4?=
 =?utf-8?B?ZkxkS0V3Y2NMYVlsOWVoaXcrSll2dGcwYTJkVGJwWTdMTlMwM2ZTOG1QZ1Na?=
 =?utf-8?B?MUdqNDI1azNKNlJsK3RIYUgzTkRGUzk5aFQyQXNJY3JJZnA3cjNGMWdWU1Rh?=
 =?utf-8?B?RFk3dmxuUVRVekNhUnFubSs0OFlTN0RTZjdCOWc0UmdublJvdUpLZ25rVURz?=
 =?utf-8?B?UkF6QS9XK0FILzNTNVY0MFVXclBHSzhRZ25SWXlnN3QyYlErN25IMlFBbHJF?=
 =?utf-8?B?SmhIcTBKWDNWWjJsVW9ROFNHNURLbVJ5MXNhY2N6ZmNCZ1U0cUkyT0pBV1VL?=
 =?utf-8?B?WEFsQXNVODg0elVUQldVL05obHoxK015SS9pYXV1K3M1WnZ2TUF6bDZZT1dR?=
 =?utf-8?B?cy8rdXZiWUR4dHczbERjZG4zV2dFR2VITFZvTk0raExaaXg1NEZEc2RHYnQ0?=
 =?utf-8?B?dGNreVBScXBIVnNRQWNSVFNXVkVTVXROTDJnZHd1NzZON3hIMkRldGxHcUg5?=
 =?utf-8?B?d3VLdVBDbDlLbkloRXJwQ2M5VmZBTkNXU29xWkptMXR6ZHJYYU82MzZkMHlM?=
 =?utf-8?B?dGVRVVZsUXpHUnpnZElNNUJwbGRIZ1lTU3d6NUVpSmY0Ujhub2VzU3BielYx?=
 =?utf-8?B?dDRDaUdJNS9jczAzUk8rcVpEMTM3bkRQQWs3L3N2Z0pmTDNhYzZoRldLYWtJ?=
 =?utf-8?B?eG9hRVdQYkNNWXNjQzNsaCtuTlU4c1YwZ0FrSk83YVpHd3c4TWFORFNwSHRx?=
 =?utf-8?B?SDZ5YXBqdFR4TFJxQVZGYWs0SW9wV3V3cEl5cjRNZEI3SkU0UytyZUNWcXBK?=
 =?utf-8?B?TnRLQjhSRW9nUVowdlBFOERBRVdRbXd2V3c3dTNuT2FTaXdRb0VySGRlUnU1?=
 =?utf-8?B?bWZMcEJkK3VadmlaMmtmYzRsNjE1M0FJZzdpWEZMWndySXF3Y1NJVkFNNFo4?=
 =?utf-8?Q?KICQAHb4b0TmwbkVCBvGZ3yWX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eebfc7c-8416-452a-7381-08dd8e85ef72
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 23:13:25.7570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: paMolVEmjhuRHHc+iAmKeJBE3budeM9iLhEZmIHQwBAPnsJbHsXpl/M9TCnem1togJEFPq3rYripyF0tlIlZIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6926



On 5/8/2025 3:17 AM, Sakari Ailus wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Hans,
> 
> On Wed, May 07, 2025 at 11:13:18PM +0200, Hans de Goede wrote:
>> Hi Sakari,
>>
>> On 6-May-25 5:37 PM, Sakari Ailus wrote:
>>> Hi Pratap,
>>>
>>> On Mon, May 05, 2025 at 01:11:26PM -0400, Pratap Nirujogi wrote:
>>>> ISP device specific configuration is not available in ACPI. Add
>>>> swnode graph to configure the missing device properties for the
>>>> OV05C10 camera device supported on amdisp platform.
>>>>
>>>> Add support to create i2c-client dynamically when amdisp i2c
>>>> adapter is available.
>>>>
>>>> Co-developed-by: Benjamin Chan <benjamin.chan@amd.com>
>>>> Signed-off-by: Benjamin Chan <benjamin.chan@amd.com>
>>>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>> ---
>>
>> <snip>
>>
>>>> +/*
>>>> + * Remote endpoint AMD ISP node definition. No properties defined for
>>>> + * remote endpoint node for OV05C10.
>>>
>>> How will this scale? Can you use other sensors with this ISP? Although if
>>> you get little from firmware, there's not much you can do. That being said,
>>> switching to DisCo for Imaging could be an easier step in this case.
>>
>> Note I've already talked to AMD about the way the camera setup
>> is currently being described in ACPI tables is suboptimal and
>> how they really should use proper ACPI description using e.g.
>> a _CRS with an I2cSerialBus resource for the sensor.
> 
> That's one thing, yes, but it's not enough to get rid of the board code.
> 
>>
>> Although I must admit I did not bring up the ACPI DisCo for imaging
>> spec as something to also look at for future generations.
> 
> I think we should really try to get rid of the board code the raw cameras
> on ACPI systems currently depend on, in future systems, instead of just
> reducing it a little bit. MIPI DisCo for Imaging enables that.
> 
> I guess you're not very familiar with Intel-based ChromeOS systems in this
> area? Maybe largely because they work out of the box. And there's no board
> code for these systems in the kernel. These are based (albeit I'm not quite
> sure about the latest ones) on older Linux-based definitions whereas newer
> MIPI DisCo for Imaging spec is OS-independent.
> 
>>
>> Note that there currently is hw shipping using the somewhat
>> broken ACPI sensor description this glue driver binds to,
>> so we're stuck with dealing with these ACPI tables as they
>> are already out there in the wild.
> 
> I agree, there's little that can be done at this point.
> 
>>
>> But yes for future hw generations it would be good to have
>> a better description of the hw in ACPI.
> 
Hi Sakari, Hans,

Thanks for your support and understanding. We will work internally and 
ensure our future models adheres to MIPI DisCo Imaging spec.

Thanks,
Pratap

> --
> Regards,
> 
> Sakari Ailus

