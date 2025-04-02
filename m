Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB4118A6DF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615674; cv=fail; b=bkrUa/sByqi7JLYQ7tHZy12EHgxnPUUFAs2EtnJfGcpflqYMrGDhe3tH87fG3201xvmm3gxd3GujFIbrYvUL++AizkdiCP9x1hOAzoz9/w223QBtmERhrHZqH8jmm8Q0zzma4EyQ5eqwnPG9tj2d6F4g/GCzWs5et+HlGpaZofQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615674; c=relaxed/simple;
	bh=2V6KodYeBneUyvE0gar5/HtWoV5y6OIEQT3TwPkdoNA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PvWSJtMfzeGQ+hodnKCBvPHsFy0bW1hrDa7XuDdV+SWySQ7WFJo8MsmkRiKcKWBsW4LB85crtObA0TSmHu8zVjCkuhfwjCn1/en22znF4PMmIJWKYykcAlxwAbcaQf+60EIbkcS7GmLN4KNEXpH2J3rV/9RDkknOR9/9c/Oms8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=VcbGPti6; arc=fail smtp.client-ip=40.107.220.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="VcbGPti6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bw89iGusn5S09BUi417gP8qMM0P/5MIcAEx2JYiQF8N5fZ856xVmES6I7oBUKFTYDVB2cv1lyVgEm6ioIUjcLJ0d3zRb0t2j7hJ5PcLQzT0MOSpZfjBZoAygeCgq4V57EeG3d9BaD6D5LuxaaEmfUroh8+ig9Z3JpIWO3s/CffwqVWEK2e0ya+9zTG3V8gwgXODul6jEpGYZm2K3eq2eg8D6dA+Pv0m7jHRHJhiwpzea13lD8OlQ0FMa5qapD3+YX5KPeayN8aAsJxLnTIxc+iNN58VGB48L+V+xioddsxwmVzo5X75UAF7JHQbBblL555xP9erM/A6PGB6rukMILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwOQL5WqZo/dniCd28MDnVcqKz6QWJvHBE8fYaEe/mw=;
 b=rkUMSxW9LPfnQVsgeH+ZzqG1q018NElcPWxjDJFKv0o3f5FWy3Bp2wbG46tyA5d3wtbVpZ55A5ypkX6IDjkfOm0z5rq/bXP3KlBm5JBeLDCEPNsYDPUv49V8PZh4ObuJwoqqg4b0yE/Fk6rQLkoTZ7F8nOsU4o8c8bKzKou77YnE1pOvpiBLtzhFCgnEsezbGaDzWQsMmVkVJE7eJjVJc2zImEYJCm/GsJOteHBSMIM320eiw2INIpXKgPUF/KrHWZmIhOpcxLqMNBZAfDbnprdsNMIK4I3pl2Z+Bhi6/Xsws2Yt7D+0Fd9QW0O/tgVlaX7exIOryzE3ZWujmW065A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwOQL5WqZo/dniCd28MDnVcqKz6QWJvHBE8fYaEe/mw=;
 b=VcbGPti6XqV5PcrhWFx+sIOZklQkPjD1OGCGWPryaWZ2lbPbPprBLADMOPd1BF0f2ZwJdshpZ+GelhW0Anq0wF3+3vyBvA2K1yGu4a3+QN0YTGuS9M5DaLR23xdIOfyxvWwrbIEbvsPsbiBWNc9YoWT/qtSTUL2OyU6RnDjzkZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) by
 SA1PR12MB7200.namprd12.prod.outlook.com (2603:10b6:806:2bb::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Wed, 2 Apr 2025 17:41:09 +0000
Received: from DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::c8a9:4b0d:e1c7:aecb]) by DS0PR12MB6583.namprd12.prod.outlook.com
 ([fe80::c8a9:4b0d:e1c7:aecb%5]) with mapi id 15.20.8534.045; Wed, 2 Apr 2025
 17:41:08 +0000
Message-ID: <83612114-a8a5-4765-846c-bec21053ce89@amd.com>
Date: Wed, 2 Apr 2025 10:41:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH fwctl] pds_fwctl: fix type and endian complaints
To: Dave Jiang <dave.jiang@intel.com>, jgg@nvidia.com, saeedm@nvidia.com,
 Jonathan.Cameron@huawei.com, leonro@nvidia.com, brett.creeley@amd.com,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250402165630.24288-1-shannon.nelson@amd.com>
 <47d36f29-6507-43bd-b39f-f19a4170551a@intel.com>
Content-Language: en-US
From: "Nelson, Shannon" <shannon.nelson@amd.com>
In-Reply-To: <47d36f29-6507-43bd-b39f-f19a4170551a@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR15CA0114.namprd15.prod.outlook.com
 (2603:10b6:930:7::28) To DS0PR12MB6583.namprd12.prod.outlook.com
 (2603:10b6:8:d1::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6583:EE_|SA1PR12MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc58561-991e-44ec-0a9b-08dd720d8ce9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bXdZbjlSRzZnVTEzUTJxa2Z1NStHclN2MjhrMU5ZWjhCU1hmeEJnRjJSekgv?=
 =?utf-8?B?TzZUdC9HbUF6WU5xeXlDYXp4VVZUb1Y3a2Q2WFgxcGxGMjJuZDVKUVhtbVY4?=
 =?utf-8?B?c0VneTZjY2IwR1lKOFJuOTF2VXVKMHBScU12VVFXL1NRRDlJK1VNbVJEdk02?=
 =?utf-8?B?OTFPZ09PZmdheG9jQlZHaTUrc2JZRmIyNlNyL2thRmMyMGpXenhsTGVkYm5m?=
 =?utf-8?B?ZVpBeEptUkpIOXA5eHFSWUNTNmVCTGY0ZTJLQUw3Y1FNbHFVVXByWHgvbmwv?=
 =?utf-8?B?YmxyL0FidUxSZUIzWW9FWWttbzB2YktuT3ozUkY1cmZUT2NFWGZmdStySllr?=
 =?utf-8?B?Z2lORjAxYndPTndTeDMyVUp2N3NKRWhRaUVRbjZpNzdWYzltNFdDWUVzNkpW?=
 =?utf-8?B?M2lQMXpadmlCRHA5c1JMUnJxNUUrWHVDMEErOHhhN242VUZjZTVqRDZlMWxN?=
 =?utf-8?B?bklvQVFKQmkxZGE0dGI3VkpDNXc0YjNOZGhxVXc3b0lQOVRXRHFSbXJzMFlx?=
 =?utf-8?B?L3R6My9pUUVrMlU1RnQ1VDhEU0VSZ1ArM3ZYbGs0cnFzVEg1TVJrTld1eHFh?=
 =?utf-8?B?OFRxL29laWgwQ2NraVZ4UGphUmJ5SWRQbk1DdGo5SEplNlJudHRBVWNuTUw1?=
 =?utf-8?B?ZllxT1ZueWhvWkFZcHZHS0w2Ry9ickp5em5zbjJ5YnBFN21MTlFPSEFSVzRs?=
 =?utf-8?B?UG90MC9wTS9WVURZRnp0NWUyVTZWalpKalRoRDY1YzVMakw0K2Q1UWJKT2FE?=
 =?utf-8?B?UEJiOWo0cUpuMmVuZXFuL2pwalBvWlphVFF2Q2J3TlNRWi9jbGV3clo3WnBt?=
 =?utf-8?B?dVdBM0V5eWxyNzFXMjFUcHlUK3N5NGVVN1cyQnp3dGV1clg0dm5rVHUvVnZL?=
 =?utf-8?B?VmxOdFYyZlhpVmo5T0tsdFE3TFZLNmJkMW9SR3B2TDFvTTIxNzM5RWk1YzZt?=
 =?utf-8?B?cmltYjcrdzFGWkg2N3owQ1FqRG9tS0FreG1HTXd5SHgwVlIwaGN6cExnR0w5?=
 =?utf-8?B?a01xb1pIU21FUlc1VzhicFF4Q3B6WnNPSFBpUElKSHJ0TVpMVjZQMnM1ME1C?=
 =?utf-8?B?MHM3YjVTT1JlNTEzY3BVVTFCR0JmMGJIeG51dUdpd2FIa2QzaTR1K3pKdzJG?=
 =?utf-8?B?ZkVBYmxiS0ZVWmhEYjAyQllZZmhtZ3VOWThpOFE2RG5jTXFyMlRldlhVazJz?=
 =?utf-8?B?UHlOTVVCTU5tNTlyb0FzNUc2WTd3c0MvQTA5bEM5bFhFSjA4YXB0cW9yNUhO?=
 =?utf-8?B?ZWZNZEpxT0hENy9nSHpnWnZxSlpJN3RlSnFSQjF4WHVidUxoaFkxeEhuNm05?=
 =?utf-8?B?TWVKZW1PWDN1ajBVbFQ3dm85bmM2MURhQ2g5YVBnTzh3bm5YVWhqZGh1eUpC?=
 =?utf-8?B?Nld6b0w2bjFkNFVvUEVPc3pySjZqTDFyRzJNb0l2cnRnTzFBWGZla2UzVVFv?=
 =?utf-8?B?aHVUUDZHc0p4MUdPNUtZdkp1SjZUNVJUU0N5VXp1NUNGNlNtb0g5MERoTUtG?=
 =?utf-8?B?cUFKTHlXb0trSXlWRmozdnRKNDBlTndZMnJ3cU8yUTNPeWVEY2M2SXphYWYv?=
 =?utf-8?B?YTVwd2pQUW5OMXREZHJ1YlZjWWdCOTNWOGxMM0p0YlBXKytCQ1RvUkdXc3Bz?=
 =?utf-8?B?WVpKNy9oRkQzWjFVSExCS2orLzJNeHdKNmhBS0pCNjhUUHlCYTRpcDBOaUpG?=
 =?utf-8?B?Qng0T0xCV0tTUDR0TE4raTZ3LzZZa3FMMzgwcVRxajlnbGRJYVA1R1N1VFQw?=
 =?utf-8?B?Nm9yOHQ5eHJwWVVvMXBXU2duei9GREtMdVNWWm1zZnMzeXA4dm1aQ25MZkNz?=
 =?utf-8?B?amZQQnl5ZWt1RnkwLzJIeDNXK0cvbE1BY3FCekJSQ0FwOHhQK1BQMkJEYkc3?=
 =?utf-8?B?UnhsODBoUWk1MFR6SFdmSVgyTFVtei82TWpQQXV3L3N1N05wUE5jUklpMVZS?=
 =?utf-8?Q?FlN7NPdkIiI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6583.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEo2SXNMVnpVVXNZUHBhWnpza3JYU3NIYUEyZ3VqSU52SFVJUWUrTFpBL1Na?=
 =?utf-8?B?dlVPUE9MTGEreFpJS2x6VjFvUlkrUDJHaHoxdkNMZFJsZ21RM01sNm41ZUJK?=
 =?utf-8?B?b3R0MWVrd0JxczZjSGxuM1p3T0NEUXpGVHV3aU5GcllUajlycjR3eHVNVWNQ?=
 =?utf-8?B?UTVKZTNTQ0ZVQVBlbnJ0QzdZK2tjSm0vdVNINGxsTkRYQmY3R0p2U25QMlB3?=
 =?utf-8?B?MDJObTdSSHhYUlk1b3lYK1BxbC9CWmJJUEwzM1prcDFpLzVVcXFRNzZHMHBa?=
 =?utf-8?B?U2YyQktvaUcyeUJVR3d0NGlHZzFpVCtMZVpLTVErMnoxbVZjM3cxMHZvRTZa?=
 =?utf-8?B?L1Z3OHZNR3NWZ0ZsWXE5QzlUTis4L3hSejBma0xtek93Y3czWC9xcmRjUEpG?=
 =?utf-8?B?SS9BcTkwSHFHay9EUTBsaGc2MkJlbngvaTR5ZGFqZXlwaWcvNHlMKzhFUWJT?=
 =?utf-8?B?Yk5XWkt2K0YwbWhLbFlDbWt6QUFHNlNTcTUzTGVEenM1V04weFMxTERNQzJy?=
 =?utf-8?B?ZERBc0VWbUt4OWxUMnJCRW1Na2dGRjZSU0V1aGJkK1NWelBnK1FQVkFXRVNT?=
 =?utf-8?B?cnZaY2hEaGwvRHRTS2NMZk1oSCtidktlTFk2aG5OVGNjV2owb3hRK2l0K3pQ?=
 =?utf-8?B?dUd4bG5JOGlid1N2bXduZloxNExWUmg2cEdiUGZvc0dJK1NBcnNvZnUxMjg2?=
 =?utf-8?B?djR6dUhqalVocGlBMGorQkNGU0RLK3Qrcm9ocktaVWpLdzN1S3ZrZVJwSStG?=
 =?utf-8?B?TnY4T0xETVI1eU1WVi9kakoycjA1K3BOL0NBYTlIOEtjUXdrU0RwQkp1RjQ1?=
 =?utf-8?B?ZkNuam5VVHFBWlU2WGJweVhoN3BnL2Nkb1AyOExPaUR0bG5qa2hxMi9kSzJ3?=
 =?utf-8?B?QnMyYkdpR09vMFNydXROWTQxYU1EZ3JUWk1EczhVb3VDV2h6cVgyVC9xWEtD?=
 =?utf-8?B?NVdVb0p0WHowVUZuV3pLcUNFV2FSNWFGSkZiVlRWN0dyVXB1SFRaQ05Famgv?=
 =?utf-8?B?dFlaZGgySHYwcWFWMGUzd1NGRVZ4TFF1TkEvNGFEY0IrNndmMEU1SFZvd25M?=
 =?utf-8?B?LysvcHBxSy9KZm54YlZ4cUFWK3ZqcEFoMDdXSVZub3B1ajc1T25ETVJPWDVG?=
 =?utf-8?B?UWg1cytaUzdnL1JsdUZrcFplSWd5UHRXWXNvY1p1RmxkWmRWVjQ4SFFBL2xF?=
 =?utf-8?B?Tk9QK0RGVzNnWXluNWk1d1o4aUoxb0pOUFJqSVYzRnAxZ3FJMUwrWktlY1Mx?=
 =?utf-8?B?SUlEWisyR3lIOXNkYVlQbU5NL29qVVZ6NmQwYzNaKy9WKzM2K0FNanhlc0F3?=
 =?utf-8?B?UjZEclNPdjRXZitmTGpGMGJtSisyQnBhMDRQN0NPUmxCcURYVnRHNjJxRUM5?=
 =?utf-8?B?ejV2RW5HTDRxSjA4TmFNNlkwMlpKd2JYOGlaekk0YkpoRWM3b0pjUnNlZjJn?=
 =?utf-8?B?TkxQbVJoaXpCT0FCY2Y2STg3RnVnNjd2Z2JrVFVmZ3NJcURaczB1U1ZLc08w?=
 =?utf-8?B?a1NKeHVJc0hjUzgxN1RvN1hDR0RSU1AwdnBOalRyeWc4VFJ5K05yMFpuMlZk?=
 =?utf-8?B?djJWUmJhYitNcjEzMEFIZUY4QStBSjNpZERsWUFrdzZDME1VZUhCc1pMOGJW?=
 =?utf-8?B?ekZjWFFxL2R4MVp0d2NDNGVGQ0VJT2l2ZWhPNzhLRzNUdjFUcWY3UWhRL3J0?=
 =?utf-8?B?bzl2MmtSeXBsREd3cUtFTDRnS3RrcXRpbFpUSzlsNE1zdlQzK1pKNDQrM3V6?=
 =?utf-8?B?Y29qeGZSdXlMQzhCWFAvS0tBVWNFTUlXblVCL1VlYXhObGlEaHlGczJITVNz?=
 =?utf-8?B?UDZqWDNadmNucENpaUhKUUlOcnpOVDQ3WVFtYTQ3TkRZNXVBeDhkWFV1QnRr?=
 =?utf-8?B?bDdIVXR1bVpKZXlvdnRHRForWVlkWTEyUGUvR0RvVzlJOUxvY0g1QnV2NUF4?=
 =?utf-8?B?YW9NTjlqREMzVThmaysyYi9HT2o4QmN0VFp4R1hhdkxhNWJ2c3IvR3JsUmxM?=
 =?utf-8?B?ZWxnNTVZQ1ZMeThvcWVCMkMreG9teHhzNnJXTFlWTmU4aDhSK0dlMkN3Nnlt?=
 =?utf-8?B?SDQ0dFVOaVpndWxyN3hlWkNXVVpSRzJzUDRRWjdtekplQ2NRM3pUYXZWTVBv?=
 =?utf-8?Q?XUkgiYxBMAJ9yb+9EGgXb4mbW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc58561-991e-44ec-0a9b-08dd720d8ce9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 17:41:08.3224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjBkArgJus9ikwrZavZ55F837hvd5c8TkIPox6nfWgzqmdvfu78e24/UnTwId5hbz6yAXZ2J18xv5EK/dMYTvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7200

On 4/2/2025 10:11 AM, Dave Jiang wrote:
> On 4/2/25 9:56 AM, Shannon Nelson wrote:
>> Fix a number of type and endian complaints from the sparse checker.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202504020246.Dfbhxoo9-lkp@intel.com/
>> Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
>> ---
>>   drivers/fwctl/pds/main.c | 33 ++++++++++++++++++++-------------
>>   1 file changed, 20 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/fwctl/pds/main.c b/drivers/fwctl/pds/main.c
>> index 284c4165fdd4..9b9d1f6b5556 100644
>> --- a/drivers/fwctl/pds/main.c
>> +++ b/drivers/fwctl/pds/main.c
>> @@ -105,12 +105,14 @@ static int pdsfc_identify(struct pdsfc_dev *pdsfc)
>>   static void pdsfc_free_endpoints(struct pdsfc_dev *pdsfc)
>>   {
>>        struct device *dev = &pdsfc->fwctl.dev;
>> +     u32 num_endpoints;
>>        int i;
>>
>>        if (!pdsfc->endpoints)
>>                return;
>>
>> -     for (i = 0; pdsfc->endpoint_info && i < pdsfc->endpoints->num_entries; i++)
>> +     num_endpoints = le32_to_cpu(pdsfc->endpoints->num_entries);
>> +     for (i = 0; pdsfc->endpoint_info && i < num_endpoints; i++)
>>                mutex_destroy(&pdsfc->endpoint_info[i].lock);
>>        vfree(pdsfc->endpoint_info);
>>        pdsfc->endpoint_info = NULL;
>> @@ -199,7 +201,7 @@ static int pdsfc_init_endpoints(struct pdsfc_dev *pdsfc)
>>        ep_entry = (struct pds_fwctl_query_data_endpoint *)pdsfc->endpoints->entries;
>>        for (i = 0; i < num_endpoints; i++) {
>>                mutex_init(&pdsfc->endpoint_info[i].lock);
>> -             pdsfc->endpoint_info[i].endpoint = ep_entry[i].id;
>> +             pdsfc->endpoint_info[i].endpoint = le32_to_cpu(ep_entry[i].id);
>>        }
>>
>>        return 0;
>> @@ -214,6 +216,7 @@ static struct pds_fwctl_query_data *pdsfc_get_operations(struct pdsfc_dev *pdsfc
>>        struct pds_fwctl_query_data *data;
>>        union pds_core_adminq_cmd cmd;
>>        dma_addr_t data_pa;
>> +     u32 num_entries;
>>        int err;
>>        int i;
>>
>> @@ -246,8 +249,9 @@ static struct pds_fwctl_query_data *pdsfc_get_operations(struct pdsfc_dev *pdsfc
>>        *pa = data_pa;
>>
>>        entries = (struct pds_fwctl_query_data_operation *)data->entries;
>> -     dev_dbg(dev, "num_entries %d\n", data->num_entries);
>> -     for (i = 0; i < data->num_entries; i++) {
>> +     num_entries = le32_to_cpu(data->num_entries);
>> +     dev_dbg(dev, "num_entries %d\n", num_entries);
>> +     for (i = 0; i < num_entries; i++) {
>>
>>                /* Translate FW command attribute to fwctl scope */
>>                switch (entries[i].scope) {
>> @@ -267,7 +271,7 @@ static struct pds_fwctl_query_data *pdsfc_get_operations(struct pdsfc_dev *pdsfc
>>                        break;
>>                }
>>                dev_dbg(dev, "endpoint %d operation: id %x scope %d\n",
>> -                     ep, entries[i].id, entries[i].scope);
>> +                     ep, le32_to_cpu(entries[i].id), entries[i].scope);
>>        }
>>
>>        return data;
>> @@ -280,24 +284,26 @@ static int pdsfc_validate_rpc(struct pdsfc_dev *pdsfc,
>>        struct pds_fwctl_query_data_operation *op_entry;
>>        struct pdsfc_rpc_endpoint_info *ep_info = NULL;
>>        struct device *dev = &pdsfc->fwctl.dev;
>> +     u32 num_entries;
>>        int i;
>>
>>        /* validate rpc in_len & out_len based
>>         * on ident.max_req_sz & max_resp_sz
>>         */
>> -     if (rpc->in.len > pdsfc->ident.max_req_sz) {
>> +     if (rpc->in.len > le32_to_cpu(pdsfc->ident.max_req_sz)) {
>>                dev_dbg(dev, "Invalid request size %u, max %u\n",
>> -                     rpc->in.len, pdsfc->ident.max_req_sz);
>> +                     rpc->in.len, le32_to_cpu(pdsfc->ident.max_req_sz));
> 
> Maybe use a local var for max_req_sz. I'm seeing that getting converted more than once in the same function.
> 
>>                return -EINVAL;
>>        }
>>
>> -     if (rpc->out.len > pdsfc->ident.max_resp_sz) {
>> +     if (rpc->out.len > le32_to_cpu(pdsfc->ident.max_resp_sz)) {
>>                dev_dbg(dev, "Invalid response size %u, max %u\n",
>> -                     rpc->out.len, pdsfc->ident.max_resp_sz);
>> +                     rpc->out.len, le32_to_cpu(pdsfc->ident.max_resp_sz));
> 
> Same for max_res_sz.

I went back and forth on that, then left them this way in anticipation 
of possibly removing the dev_dbg() uses.  I could go either way on this.

sln

> 
> DJ
> 
>>                return -EINVAL;
>>        }
>>
>> -     for (i = 0; i < pdsfc->endpoints->num_entries; i++) {
>> +     num_entries = le32_to_cpu(pdsfc->endpoints->num_entries);
>> +     for (i = 0; i < num_entries; i++) {
>>                if (pdsfc->endpoint_info[i].endpoint == rpc->in.ep) {
>>                        ep_info = &pdsfc->endpoint_info[i];
>>                        break;
>> @@ -326,8 +332,9 @@ static int pdsfc_validate_rpc(struct pdsfc_dev *pdsfc,
>>
>>        /* reject unsupported and/or out of scope commands */
>>        op_entry = (struct pds_fwctl_query_data_operation *)ep_info->operations->entries;
>> -     for (i = 0; i < ep_info->operations->num_entries; i++) {
>> -             if (PDS_FWCTL_RPC_OPCODE_CMP(rpc->in.op, op_entry[i].id)) {
>> +     num_entries = le32_to_cpu(ep_info->operations->num_entries);
>> +     for (i = 0; i < num_entries; i++) {
>> +             if (PDS_FWCTL_RPC_OPCODE_CMP(rpc->in.op, le32_to_cpu(op_entry[i].id))) {
>>                        if (scope < op_entry[i].scope)
>>                                return -EPERM;
>>                        return 0;
>> @@ -402,7 +409,7 @@ static void *pdsfc_fw_rpc(struct fwctl_uctx *uctx, enum fwctl_rpc_scope scope,
>>        cmd = (union pds_core_adminq_cmd) {
>>                .fwctl_rpc = {
>>                        .opcode = PDS_FWCTL_CMD_RPC,
>> -                     .flags = PDS_FWCTL_RPC_IND_REQ | PDS_FWCTL_RPC_IND_RESP,
>> +                     .flags = cpu_to_le16(PDS_FWCTL_RPC_IND_REQ | PDS_FWCTL_RPC_IND_RESP),
>>                        .ep = cpu_to_le32(rpc->in.ep),
>>                        .op = cpu_to_le32(rpc->in.op),
>>                        .req_pa = cpu_to_le64(in_payload_dma_addr),
> 

