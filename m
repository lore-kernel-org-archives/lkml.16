Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2068.outbound.protection.outlook.com [40.107.212.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC9ECA6F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148907; cv=fail; b=pETKR8FdujZzNlArtMua/fcTD+FIg643J5wuW71W0X0UNxzAf6icZNXXsurZDIW6LJO8p+dfBJ2CgfD/vWLxGg6IRroCeCXA4V+yxgA+ZGutHTjl0PZrad0y2slcTWcC8PvvHAS0RGKa3RkXHRQQcqK/BuX8APptygyM6GZvL1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148907; c=relaxed/simple;
	bh=Twwwbk4Ndeau5sc+3hx24BrvZazBa8txp7iRePb/dZs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tIoFNiW1B0Ud3pyvl7GtWXd9PDRbf9btH0iS5Uxnm10cHadtUBDEtTVHaML97YnLzDQjGMnrC6aN5fCZK/lNgWVSd83CQuzWf8dCfyYneYBFi8QPAuEX2twCnav8WO5GB7PPYx3PpP69XBLRm69mv/AaPCi83d5qIFxqJb4vpMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eKzEw07s; arc=fail smtp.client-ip=40.107.212.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eKzEw07s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGzM8D+EP+CRbDGi0ofVOEWfR73rHuo6R9jBP1FaHoDnNUOSblxJ/8JBWuXn6+kFcYtFf15uhsCicsx3XWFwYtwLX0qs7VXTmq0a4R9TWiTTdqKm3a+5UAob5l1GgylPuHutT7tTC3gPwNMZZa9Cp71cDcQS8FG5W2goxiCnVIa2SzqEccU/4AFkGb57rmayzteTHM3cbI36Kf+e7aZ+XJ9cxyF45PKDcvbsIw6PhMwGaGPASnE/6oQaG6M6H4yy+gUUUnDLLe5fToa6Vk4oK3MUnlj8VGNMwz6X2pJDBFK0DrVo8EZdypzs1l9YoDdXMLZXVEpLemvZrNB+lTJ+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBKXt0ciFbW+Q4f1Uy+ZPAfwNjC8hvcy3DYJ+EF0qdo=;
 b=xe76dlhW+fm5yb4HUcGozX2r4NSHFsbWFXipPmD+mgPhLzkFy7cRKtV5UZXMQNeWmKjMJTrXfWet71SRrBywRIj4v5Wkm7T3i+6RalHhEeBzG2OOpzPEuuow8x8ppsrBd9hf6gLCcA8AbRWli8SS9+vcwPdeTGLcqkgLOy22SAwykW8TMp9Fan8ypgdvnSfMU03thRV7idpsp+XgRDgVaAzE2SoN2tiyZ/e++WxSGJwJdYoBC+TD2oBqvNP6rfruP+8lol/b4HwjTniIiJwu0++hQ+LZLT6wCnAK8vf50OK3EBfBvkRhGdU/QQm9OQ7EkFD3VvuUsEFfBGQBBJxg0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBKXt0ciFbW+Q4f1Uy+ZPAfwNjC8hvcy3DYJ+EF0qdo=;
 b=eKzEw07s1unhboEcEZqRwF08Yb4mtBeekEv5C71OMQwCsQVf28tI41MYKg0WllHFFuCS8wOjeR0iIL0jzHM60k3JPt/fDQnp0qKqM2fyUffY0dqhq5pgYMZGbWj+wXXx092uHtopW6OYegZwObUr4GLBZ1NIuAgN8IupAm8kkEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by PH8PR12MB7255.namprd12.prod.outlook.com (2603:10b6:510:224::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 08:28:21 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%3]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 08:28:21 +0000
Message-ID: <9f9ce455-262a-4d55-829f-ff485f67dc7a@amd.com>
Date: Tue, 17 Jun 2025 13:58:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: page_ext and memdescs
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jonathan.Cameron@huawei.com, dave.hansen@intel.com, gourry@gourry.net,
 hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
 peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
 rientjes@google.com, sj@kernel.org, weixugc@google.com,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, xuezhengchu@huawei.com, yiannis@zptcorp.com,
 akpm@linux-foundation.org, david@redhat.com
References: <20250616133931.206626-1-bharata@amd.com>
 <20250616133931.206626-4-bharata@amd.com>
 <aFAkkOzJius6XiO6@casper.infradead.org>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <aFAkkOzJius6XiO6@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0196.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::8) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|PH8PR12MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: 2137a086-bcbf-44cd-4a22-08ddad78eb30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGtKNE4wdGQ1NkhOOWd0T0pUSGFTQW50dnB5Z2QwWWc4TzhpWE90MkxHd1VI?=
 =?utf-8?B?N1VCdkJlNnFaY1dGSE1HWDk2TWx0MDNXZytSVjhDUzlJSDJLc1VnUGM1Wkhk?=
 =?utf-8?B?SUxTUndYR2xZaUFOM1hnalNCbktMcllUOThybE9RWVNTRi9QakQyZGl3M2Vt?=
 =?utf-8?B?WXI2TlFxcmRkYXhtcDdVa05VSCsyL3JnMkRLTjZFRWFOZHpEU3Q1RzFYcDlq?=
 =?utf-8?B?VUZnYi9DSHkwUko1M3ZiOVhxMkYyRnovVVpraUdIQy91RTdXLy95QU9CREIz?=
 =?utf-8?B?NlFOS3dXUG55VGJtc2FYWlF6SHlNZVBrVSt1Vk1XaDVMRnIyNXZTY0IzSTY5?=
 =?utf-8?B?MWlUc1FDcGFjQTVIV28wdTM4bFVVVkxzODBRSHdsTmFlbnB2ZXVqZ01YOVBS?=
 =?utf-8?B?bko2TWpWc01qS2VubXR5N1JmcVB2ZTk1WW93OFFGUW1xNzNndVloN1hodk1T?=
 =?utf-8?B?bmEvVnhrZHR3cTFlKzl0Wjd2c0l4YTBOcUYzM3J6cWJJczcvd1lLdDZrSUtn?=
 =?utf-8?B?MVF6cGEwcmlJRlFIMS9vOGU3NXh4RTdmbzZRL1dza2pJeWczTkhDdnVpUFRt?=
 =?utf-8?B?RUs2WVpPUWwydFpta2tsTGdmMTNyeGF6Mk1Bamd6VkJJT1l1bmxHOUpUQ0pk?=
 =?utf-8?B?aDJaWGdiZ0NRRVZyUTQyMWNoYkZVUXpHZ29mejlyT1dDaXNwdUU1Q3RjTWcx?=
 =?utf-8?B?SGVQbHkvS2VxcGtWZkpCNEJRM0RyVk92aEdHenIzbTlJTmFWWDRvclhuSTZR?=
 =?utf-8?B?Z0RsOEhYb24wSlc1N29Fb0lTRDlkaXpSVm1vSFBoZVlNV0ZwSlZSTmx4SFk4?=
 =?utf-8?B?WjJWcUxERWZQRGJ3RCtabzh0allUby80cmJHU2lCS1lnYjYyc1Q3Z29GTWZH?=
 =?utf-8?B?SFVFR29oQ1RjV2txZTVXcWVIUllHcE9sNU5NRWhUNEZzWU1TZ3NEcnlsdlFr?=
 =?utf-8?B?THJIRGxzMGNMVzJ6QlNGb05zT2tHa2ZBMUo1QkloZ2FOOHhFYzd5OGlkU2Mr?=
 =?utf-8?B?U3N2VFM2VlU0Z3pObzBvdTlCZzVQcDBudWVmNmgwa2pWTFR5dW8zNEVGTjNw?=
 =?utf-8?B?M1NCUW9FSm5iNVBFSkplSmloS0VaVmtzOUdrTzQ5NGhzNVBhQkxYaERUZXla?=
 =?utf-8?B?MVRvTDhzamFLK3dDak05UytDSjl3QjM3aGtZY2ZjTDZBeUJSZU9DWmtZbFlR?=
 =?utf-8?B?NTBYcHZDZ3dnTzN3N0hpa2hqNzYwTzBZREQ0dzlPWjlIZ3d1ZWM5ZDA0WW5a?=
 =?utf-8?B?STFMdjhtNFJ4N0ZwNU13ckpJVGdaaGlqOXg0cjlKVG9OYWdhSTNsaGJJbUha?=
 =?utf-8?B?dDlNaE1HUmViaEpsc040SEJ1NElHdFpRU015Q05hMVBSNVlWTDB2NkRyTUg3?=
 =?utf-8?B?c1lqTHJMQktSaWcrVzdMclh0ZE5KbG0zdkx3RFdQVFhwanJ2M2tQTlByK25O?=
 =?utf-8?B?eUR0anUrWnlIUHdNUWM0VnEyekNiOExadUlXUmUxOHh1enNmNnRYdnUrRlVG?=
 =?utf-8?B?VzJFTW1Sd2xuNHJVeDczYUlOUHp5L092ZjNPaVExcDZJdS9HQjVRc0Y3K285?=
 =?utf-8?B?NDFSVHZzWmN3dUtVN0p2dzdvVTJ0Rzl4bDdwN0hRMGtIZmZJdURvSDFsejBk?=
 =?utf-8?B?N29TV295V1c0YXpCd3o3S3hGRERWUDdvMUdvaDJiV2NBUTh2OW9jYXBJcUQ3?=
 =?utf-8?B?L0FHdnVzSU0ydUpQdllZMnovcldRaXRDOXRoNDhjNlRlcEI5UGlCNDdPSno4?=
 =?utf-8?B?UnRRQTZreGMyaVBxaDc1L05MbkQxNUVSNGRnNExHQ0dEa1hicDJ2MGFrc1Q2?=
 =?utf-8?Q?VkRUu+PO/MwWL+YG1fyGyHDM0SM5cMOAGynXI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXl1MFAvUTFxZHcwaDdEK1EvYWNyL2ZGdDJ6dUV1c3JaL1Q4bHZKdzRuajdG?=
 =?utf-8?B?RXdTWkZXeFhuR3NUMGtxdklDTThqL0xGdkVrNkRDVy9rSHo2Y3pkMlZBRmpw?=
 =?utf-8?B?TXQrUWUrV2xiRHNvTlNLRURUYlhqWlovVGZSN0FubkhUei9RSUVGUTBoVnRn?=
 =?utf-8?B?Y2lncHc5WWRVcVNiUy92RUZPbjZnYkNEQW5uMnNhRGF0WnU2NnBxdlJPci9F?=
 =?utf-8?B?Sm9yeGhIMXhRbHpTcWN3Zkgrc0VFSDhxZ0dYSTNQcnZzVUVjWTZzMkJ2Y2VN?=
 =?utf-8?B?S05HRkZSdFcwUkVhVEczV2dtRy8wQlNwdDAvTmo4VzVGUUVhWUt1WkVoOE91?=
 =?utf-8?B?VkQvc0hMSHRlMlJHYkdHMXlwSEN2ZDltMjAxZjdPMENiODFZTUJFWFFPSHdo?=
 =?utf-8?B?SWRwZURrSzlkaHI1dzFuUGxsMjlWdlRsQ0FqL3AzQy82bzVGNkIvRmxqeGtI?=
 =?utf-8?B?c1V2bWdoVlgvVU02NUlqOEQ2S2twZEowUGRpZWx1dE9FZXM5aDJxVEg0cjY3?=
 =?utf-8?B?TTl6MnVIY21VU09RajM2Mjk2aFJ4OTVVbDdOU1U5b0VXcGM4SFFIRzh5VnpD?=
 =?utf-8?B?OHJTQzhtUUg4U1RxbjdHUUFjdnlBK0tLQmh3S0tDUTBDUFJUSVByRXpJSkVx?=
 =?utf-8?B?ZlMvLzg5KytlMXF3aHJwTlZwNDd5bW5NaUpIMkdGcVRXbWMxTXhublVBQ25s?=
 =?utf-8?B?QngxdHAwMnplV2tTMlpCTGxaU0ZmcTlpMmlpUjhmTVM2d3NxSWVSTHhvbFN0?=
 =?utf-8?B?M2gxMXJxUzJzY0Ird3hIUHBHd0RkRk9FdTdST3hWRmFSN05xNzVXT2UzeUVs?=
 =?utf-8?B?Zk5rZ3NEOThFMTdCNThlUU1CY0U5V3h5QjdTUGhqMExBUG1MQmdHTTdxU2d0?=
 =?utf-8?B?S280NFNpd21TUGlpTnhiSGpCdWUzZnVlaDRWL3R0Y1hNUVZvdGFCdzI1TzFh?=
 =?utf-8?B?eWx4TFFVVDRPbTg2ZDZBV21ZRTUzTXIrdXNacXJtU2Jhbjl0NzZZbm9ISXox?=
 =?utf-8?B?WWtoM2VBSG91K1kzaDFNOGtxTUkrTEh3djAwM0NBcVJ1ZlNSYkJBbVg2QVQ5?=
 =?utf-8?B?cDhqWHlaZXc2MEJhVFlTSGQvVHEyRWViOHYwS3ptRnVUWElIQ0crcWxQM1J5?=
 =?utf-8?B?OTZuS2hpcSsvVTh3S29va2JlUXgyT0V0MlpHSWRSOW1BSkx4N20xTGZobDds?=
 =?utf-8?B?WEU0OE5rcWlqVG0zd3NxYXlxVWtaUi9NdjV3d0lTNThwdXRKQUdpN3A2STMx?=
 =?utf-8?B?VWVIZHpEMmp2a215NDI3QXBZVjRzcW53YW5CWUFleitIWTh2TEtkQlZXT0tI?=
 =?utf-8?B?Uk11UWFweHNJVTk3V2FtbjF5WUhLbGNoMW1uRE5IMmpTSCtPT2tJN05NdTdE?=
 =?utf-8?B?UXNUakFxTzd0YjNGbUNsZUNIMU5SQjBseW9GNUp4YmdiL0l3RlVEMHZ6cTdo?=
 =?utf-8?B?MVJBbk14bmo2Y2MrN2RMN0lVYjl3UjFhbThvdjRKN1BHRnpndU83M0lueStQ?=
 =?utf-8?B?TVQxUTZkY29uVmM0Qzk3a0g3djBTZGUzcGxPbVNndHRNc29NQ0lHdUh6MG51?=
 =?utf-8?B?MzF2ckg2L0VQaGVKQmphRzhGNjF1VmNsTmxEdS9rYnJzWXpENHZyaGNjMEhj?=
 =?utf-8?B?VE1EdHRQT0xHS2E0bXZQempONWFKaVF6ekhza2VtOGJVai9NQk9KSUx1ZzJs?=
 =?utf-8?B?bEFGYzdKZEE5UldlYndsQWcwbjRVSkI1UGFoUDI2ZGRiLzh0cElnT2llRXpG?=
 =?utf-8?B?WXJrRnRzYWV5S09PWENRRUNyOTBMdldZdjM5ZE5sOG5aVXNkQXpYTzA3RVhK?=
 =?utf-8?B?QXNSZVNLWGpjMHh6WTBWM2dja1JHOTNJNEdjNjRlajRkRjZRYXdZNzJocVpJ?=
 =?utf-8?B?cUl6dERuU1UxU2JTbkVocFQrdlN1dERWUmRrWW4zS21YZERYS3BOUU1mbThM?=
 =?utf-8?B?UUd6TzUvZ2RGd2lsQVpzc3VYVFJ4ZDNXczBibUFrV3FibldTeVpKRTZZaytj?=
 =?utf-8?B?YkVSRDdLY0lkNVJFZUtNSVhZa3VydEtleml1OWdLcDFFdWdMQWYrNmR6ZmJ4?=
 =?utf-8?B?b1FQS2I5RTFOY0UxN2RxenQydW5PSElucHhLNU9CMng4Mml6b2dyanczMitG?=
 =?utf-8?Q?cSM2ilOuxNcZpNLMXiPxBgzWk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2137a086-bcbf-44cd-4a22-08ddad78eb30
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 08:28:21.4046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7xkJthuXSIKxDbbUMw0qQ2RCZUewoXuxfW1j5o6enRrgPy25nhovxxD85nZZC8GJDIptjnOoxpSgKudv0+R13A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7255

On 16-Jun-25 7:35 PM, Matthew Wilcox wrote:
> On Mon, Jun 16, 2025 at 07:09:30PM +0530, Bharata B Rao wrote:
<snip>
>> +#define PAGE_EXT_MIG_NID_MASK	((1UL << PAGE_EXT_MIG_NID_SHIFT) - 1)
>> +#define PAGE_EXT_MIG_FREQ_MASK	((1UL << PAGE_EXT_MIG_FREQ_SHIFT) - 1)
>> +#define PAGE_EXT_MIG_TIME_MASK	((1UL << PAGE_EXT_MIG_TIME_SHIFT) - 1)
> 
> OK, so we need to have a conversation about page_ext.  Sorry this is
> happening to you.  I've kind of skipped over page_ext when talking
> about folios and memdescs up to now, so it's not that you've missed
> anything.
> 
> As the comment says,
> 
>   * Page Extension can be considered as an extended mem_map.
> 
> and we need to do this because we don't want to grow struct page beyond
> 64 bytes.  But memdescs are dynamically allocated, so we don't need
> page_ext any more, and all that code can go away.
> 
> lib/alloc_tag.c:struct page_ext_operations page_alloc_tagging_ops = {
> mm/page_ext.c:static struct page_ext_operations page_idle_ops __initdata = {
> mm/page_ext.c:static struct page_ext_operations *page_ext_ops[] __initdata = {
> mm/page_owner.c:struct page_ext_operations page_owner_ops = {
> mm/page_table_check.c:struct page_ext_operations page_table_check_ops = {
> 
> I think all of these are actually per-memdesc thangs and not per-page
> things, so we can get rid of them all.  That means I don't want to see
> new per-page data being added to page_ext.

Fair point.

> 
> So, what's this really used for?  It seems like it's really
> per-allocation, not per-page.  Does it need to be preserved across
> alloc/free or can it be reset at free time?

The context here is to track the pages that need to be migrated. Whether 
it is for NUMA Balancing or for any other sub-system that would need to 
migrate (or promote) pages across nodes, I am trying to come up with a 
kernel thread based migrator that would migrate the identified pages in 
an async and batched manner. For this, the basic information that is 
required for each such ready-to-be-migrated page is the target NID.
Since I have chosen to walk the zones and PFNs of the zone to iterate 
over each page, an additional info that I want per ready-to-be-migrated 
page is an indication that the page is indeed ready now to be migrated 
by the migrator thread.

In addition to these two things, if we want to carve out a single system 
(like kpromoted approach) that handles inputs from multiple page hotness 
sources, maintains heuristics to decide when exactly to migrate/promote 
a page, then it would be good to store a few other information for such 
pages (like access frequency, access timestamp etc).

With that background, I am looking for an optimal place to store this 
information. In my earlier approaches, I was maintaining a global list 
of such hot pages and realized that such an approach will not scale and 
hence in the current approach I am tying that information with the page 
itself. With that, there is no overhead of maintaining such a list, 
synchronizing between producers and migrator thread, no allocation for 
each maintained page. Hence it appeared to me that a pre-allocated 
per-page info would be preferable. At this point, page extension 
appeared a good place to have this information.

Sorry for the long reply, but coming to your specific question now.
So I really need to maintain such data only for pages that can be 
migrated. Pages like most anonymous pages, file backed pages, pages that 
are mapped to user page tables, THP pages etc are candidates. I wonder 
which memdesc type/types would cover all such pages. Would "folio" as 
memdesc (https://kernelnewbies.org/MatthewWilcox/FolioAlloc) be broad 
enough type for this?

As you note, it appears to me that it could be per-allocation rather 
than per-page and the information needn't be preserved across alloc/free.

Regards,
Bharata.
