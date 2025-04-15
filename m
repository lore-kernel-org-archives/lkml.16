Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B87236A99
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744743651; cv=fail; b=r2SBZh46OOYtSrtgwdLZcXL2aEj5NqfLOzAj6Cgg0drGqQqkdvzcMe9Uw5yOIRiddWH06YeImbzMGiujTNxnyWCefUmKL0/LbFrIdm10OkMqhEX+kyPPGds6HOcz5oQfvP+co8oPcvX1sibl5UY23jnM6dQPDLVlcMZs9b41up0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744743651; c=relaxed/simple;
	bh=VwPIqbj7RI6TKqxm4keq4Ql5cbebx7fZ9Cwtq6JROEs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Gb8zCihd30L02Sq8HqZAgY27VdRrf+vEfio84xFmd7dSYw97EPdURQQmDZiPMGZa//AjvWkMEUzBgYseW3hOIRQeedfOcUTwdw5crvh+wB547OZSgALEN2ST6zZsdGcgygStNGQDxF+YjnpcncJq8fFHUdN7cNRLG+yFVD74lY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=20EVaY8i; arc=fail smtp.client-ip=40.107.223.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="20EVaY8i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lb09+ydR8Crj2fGnOPYDRbCk9eZLKeDXpB9NCCvwBXxrgMafSTdRqJj+MCsYvNFDXAfrJBLgee8tOk5Kl16dM58U5uic0q4ymh4a4YOR64HKnFJU8U5fu0RPeLFmdtV+VqWIR5sk0J+BgTgIN74MaOWkY4LLt6It1LMfIv0DelnnEJNl/ASVa+y+9OLANJYiS3HHOkKCwu0KqnBhFhrVvSxLrGfD3vSGbeM0pQBfyWk6NVDaC/hs4RylnltxsheesdXlyWiB2CqzppsAv/565cAqf5h534ucfGRWEDBUVuomQptuuCjP7OHGsPMMI9pAxgp8m3PfGMV1c6RLcVWz1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8T9eRLmYI9kEADvvoIfeYxmfCLKDU1V6epFLtb+A4A=;
 b=prqMv3SJ/OxWFZGDY9t7qOsX8AjwYZnzJTnQ6YtRbITmpIhkFbhMXvDXOPpmMJi9CUtxw0CSSyU45IG7gqcPlVd2bYqQuz/+VVtHrkGEDsaO30PW6+iSDPbzxCW+jmwQEbmgeI2mR6XVkwgUXoW3kunK5Ct7s2tM3UkSjVAZJcvLM/FooFO5RUf0AoRk9waqtqId8Hh6aLoE1ptRhW8DPhVGW7k4n7nJFtCn09XKRNoh4MoqvmdxOyMAhigRmn6+xQTJZuMKz5tAnh80meY8+QZo6CQi3p1IG2/zjxC0j3HvqZmoxj18yTf05ba8Uaz++ck1YxI/WfFiT0gnidQegQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8T9eRLmYI9kEADvvoIfeYxmfCLKDU1V6epFLtb+A4A=;
 b=20EVaY8i3QisnTs7KaUtn+fbYh2UerLVJRgSfQjCuP6Y7zZ/RwsmQYxsZFZwdc7wxNnWGkJRlE8rGAy24zlMxuWEni8AjPy0KZ22+sp2zc0IsfuFXaoOkPK+toUoOL8lTD4zasxkAf+Cq/Sc9oGDpHQUaeM2SK1PulzG4LE1E88=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by DS0PR12MB8453.namprd12.prod.outlook.com (2603:10b6:8:157::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Tue, 15 Apr
 2025 19:00:45 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 19:00:45 +0000
Message-ID: <1841f2e1-d677-4bb7-b449-78322e52f212@amd.com>
Date: Wed, 16 Apr 2025 00:30:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] mm/vmalloc.c: return explicit error value in
 alloc_vmap_area()
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
 linux-kernel@vger.kernel.org
References: <20250415023952.27850-1-bhe@redhat.com>
 <20250415023952.27850-6-bhe@redhat.com>
 <134bd404-d741-40ec-a661-f897da5ca9ca@amd.com> <Z/5Yv+iFmFPuFqvn@fedora>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <Z/5Yv+iFmFPuFqvn@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::17) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|DS0PR12MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b783a58-f76c-498d-0f94-08dd7c4fd399
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODhlUi9TOExYcytpZXZPa1ZGTHNPVllUamtkY2Q4alVzQ2FlUkJjdlJkQTly?=
 =?utf-8?B?QVJyWVhDcXNNQ0gzZlZlenpOZVNDY1pISm1nT2hNenhRcmFZMytOdWoxUlRX?=
 =?utf-8?B?KzZlNzFvdFVEMElHZ3BhUjZQdG1FdC8reW8wWldyWGk5Vi9UY3pOVzdoVTFC?=
 =?utf-8?B?ZWlQTVBXdzM0WjJ0THVsQWM1SXBLb2Z6YmRWSVVtU1BIaHNSYzM5R3ptMGJn?=
 =?utf-8?B?TExxTDZmRmV6MU5MS1BKdEpqZEFNTGJHb0k3SU4xVXJmUUYyTDNPQlFFd0pn?=
 =?utf-8?B?RnZhVGNQQWQ3VGNqaFNQM3FLbHp1VDhlTmdWZGs3cG43QU5Kb2FzdHF0VEZu?=
 =?utf-8?B?YVVWaTVIaHJZUTNOSmxwemQxd21lN3hKTUxlZURPZkdRNWlQWFpVZk1DUFZx?=
 =?utf-8?B?cVJJNVdaLzE0bkEraWtySkVKTzRMRkE2L3dNT2ZIWVhBQkZFRDNhOTlNNys5?=
 =?utf-8?B?WGlYa3VrSXVKcWxrZ1dBWUZwSjlpWTRySFVSZkJTYUt3OUlRcU00UEx0ZUZU?=
 =?utf-8?B?WHpRQU9iaU9EbGdRRDF0dXBnMS9TdWwxL1pxK1lMcldMaTNGS1pxQmUvYkc0?=
 =?utf-8?B?UzJpMHFPQi9pZzBXVndpT0FCZXZOQ1RnMlNhSGNXeE5McWc5VmdFSU0vUUE3?=
 =?utf-8?B?Wk5HNW51NmV3TW9FRWR2MWlUbXRmL1d1dVdKb0owZGFTNjY2QjBlUVBOOW9v?=
 =?utf-8?B?TjF1R1orb1JnVFRJUXBzUUh6d3BybFh1dStwdkVjWW4rZ1hrY1pFNmVoQ2o3?=
 =?utf-8?B?WGpRRDBCNVNPVGloV1l5UWs1cERHM3IyY0NpU1dabEMyNWUyaERWMC9SSHBO?=
 =?utf-8?B?cjRCalIvQmFlUjJXODlLMnF0ZXA5RUR6bCtRRWd5MzJxQkRWRHp6dVlBREVa?=
 =?utf-8?B?YVphYkpuTXVuZWFrdlNBaWVZN1dQWW92Z1BGQkV6dHBXbzAwVmY1Yy9DTW9i?=
 =?utf-8?B?aEZZb2JLRHdMdnA2cWYrUUo3ZDdXM3daSWVwOHF5NmF5SzRveWVnR0pJVkdB?=
 =?utf-8?B?UlprbmpWZW92Q3Q4OGhlTDAyajd0RmJWN09GWGJoUitWSFRnZlNkMS9tbk43?=
 =?utf-8?B?RDYxR3RWenRrbjJZcVpGSXJuTWd2bG9XcUEvd0FsSVVtWG9ycnhXbG1vZjNm?=
 =?utf-8?B?S0tPa2VISXU4eGlST2VkQ2lkYUduckRjS3FLWTRic2FlWnFERzhGNDROVndn?=
 =?utf-8?B?NXB5YkdlRHZ6RzJ4cDlKamduSG9TcEVKS0xvSGtEQzRLL3Z5RlFuT2dmbmwy?=
 =?utf-8?B?MWNTYTV6amxIdWl6TWJ1enBlT2FEQzQ1KzRuWUROMlR3bStjcTFrUzBhd0Zj?=
 =?utf-8?B?bCtIYWQ1WWZBMTlrbVdtd1RhVkszSDMzR2p4QzkydjVoRVJtUHVNTUdkNTE1?=
 =?utf-8?B?MFlQa1VGczVDNG1RRFVteGtsZityQXZtMTFFblp1dVgxcHo4YURmbzgvU0d1?=
 =?utf-8?B?WHphbWxwVXZDenVLbzNHaUVobEFKNU1FNWlyc21XeVFvYlNnOGlvSzA2a25Q?=
 =?utf-8?B?WlBIdk1jK3EvUGJ3cldwSXFPOVV5aG0wS3hEK3lyazBzVWxKRGxPa24yOUoz?=
 =?utf-8?B?UmZDUVQ4YURJeTBncERVbDBnRjNDU0pFZkpvYmYxWFdDbFpCeWxEdXZ4cjJP?=
 =?utf-8?B?NktDMFhuc2dPSkpYVDdMQWZrTEJVNDZwTG5qaG1qeEJUbzNpSTRRL2grZ2RB?=
 =?utf-8?B?TFY4aC9sNmNLUDhoa2w3TG9KMW9lZndXNFgyQ25pYlpSWTdJRHptQk5Xb0h2?=
 =?utf-8?B?cktvMEI1TkRNUU9aaktKMmpKV0hnY0FEMTRLZytNNDJxUi9jbmlOYU5HOFh1?=
 =?utf-8?B?cE9YRUJlOU1ONm92cDJsQjBTNXg2RHhZUFUrNXZHZnd0UHlYQ0JtL2xCTU5N?=
 =?utf-8?B?YWxxYVFja0pKaC82eThHblFKWlhiZUNmQ0w2ZEFjNkVhMi9hVlJsZDFLTHk5?=
 =?utf-8?Q?7ABBlTN1k9c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXpuYnRPc2lZTmw3MElNMDhKYy96L0MySkllOXQzYy95Qk0wRW1VOW95UVRH?=
 =?utf-8?B?QmtJbW1nK1ViN2hvYkp2YTRCUFRNMDM5MHFoYmgvdzk1ZEVQSStsOVUrQVli?=
 =?utf-8?B?aW5tc29nbVV3ZjBmZHdsTW5MME11cllnbXZyTnQyT2Jvbk40Y3VyREgvMjJr?=
 =?utf-8?B?a240cGRyRWVRZVViRytKU1p5S0RBMTQyWEprQkxhNXdGM2hKamxiZXVJb0gr?=
 =?utf-8?B?eWVBTGVFOGFYQ3cya1dwRXRST2k4WitiekczZ3dlYjRWOGFaLzJESjU1SG9L?=
 =?utf-8?B?aFB1Z0hQdTFaMWFPZXVRaGE1c056RWh6T3RiWVZTVWhyblRabTFueFN5M1R0?=
 =?utf-8?B?V1pRV1hkNkNvcDNEM2hzWU5Xd2w3bXI0U2tOK1NCaGJpWG1aZFQwenljS2tP?=
 =?utf-8?B?Tm8zc3BhSmQ2ZUViR0RTYWFiN0VLdTR5UkVNcUxrVHFZbmxyVFYzTit1Yngy?=
 =?utf-8?B?cFd6SkkzcHUzb3FZUHE1Zi9FWHFJblErNGQ5Y1F4ZGRFYldtMEhnaHlWUzc5?=
 =?utf-8?B?aS92bURidlFvZWNrL2V3MHFYYVM4RkQzOUNkZC9yK04zZnZBVC9JVjN5eXQ1?=
 =?utf-8?B?UTIxaWlMa01QSDMyL3lXK0dlekRXc3JTTVYwRzhEQkw1UzJtUmJ6OEcwVnRr?=
 =?utf-8?B?WHZydW9aeHRhY0pnZVdSa3pNbSthbk5kbzdMYzZHbUhtL0VqTkN6WkpWanVa?=
 =?utf-8?B?Wmc5L2FYSG9tdHhGM1lvclZTZXkxaE8wZnpxNy9OY1J6eXQrMnNPQmFrejlR?=
 =?utf-8?B?MXRXVCs1U0pTNThwMjhCem4zb2RJRnpWRlM1cDh2UWcraDFmeVFJek8wU2pp?=
 =?utf-8?B?RHlpdjdsMk5ZbU5FZVNNcHE3SHgxSEN1dVlmR1laaFl2ZmRHRWE2SVQ4MnF5?=
 =?utf-8?B?M2c2dU1kRHYxVk52TWxLRVUwTnJ6aGpmN1hPNnh4SldkVUVZMzh0aDg2M1lh?=
 =?utf-8?B?eUtOSE5hcG5jMk1vVjFGbDNWa3dzOThEcEFmaWc0K3FCZDdyUjcxMDFIekdT?=
 =?utf-8?B?Tjk0ZE4zdkgxMTNMUmVrQXRjMUc1c1J1dERBUmRyN3cyU2FkQ2w3dWU0TVJW?=
 =?utf-8?B?TGp5RjBhczhsam9OT3pCWlg4RDlFQUFkMEdkR0V3QTRzZ0hEVElvY1NDVnps?=
 =?utf-8?B?VVp5alJkOHRiVnRJNVc1NDNhZnV5d0RQeElKeFFHSDBaZzRGV0FFMVUrQjJ0?=
 =?utf-8?B?dXg2K1FTUlkwOUxxTVJ1SVZwbXA4ZVp5enlDZFdIQkg4aW1wU0h2U0RZWnMw?=
 =?utf-8?B?a1NlNHVPVGY4bktTT1lBeVgxdVEzb2dBUDY3QWtVQTJwQUkvMFQrRGpFUUhL?=
 =?utf-8?B?TGQxRm1hY1hSdGF3MkhTSWFwUWUvS2tHS3p1VVdzWkF5eEozSEh4eXZyK1Nz?=
 =?utf-8?B?UnJxYXd5bmY3Nkl1VmJXVTRqSmFLckNCNzA1Sm5WQVBDZHBZdCt6OGJzczVs?=
 =?utf-8?B?L3ZJRnV2M2tsV1BMblNCdSt1SHRuNkRzam4wekFReFdsblNFc1diT21NNU9E?=
 =?utf-8?B?MUI3KzJWOW5rSWlEY1g4QWpTb0pRV0w3NloyenMzNW9Ra3RPUDk1RHlXME1L?=
 =?utf-8?B?cUczOE1MRTk5MVc3ZzlzYjdyMGdXM2lhVmI4RnlyY292YkQyRFFzTVNjRkVF?=
 =?utf-8?B?TG1PemJOQmRldFIxU3ZDRllKVmYyLzZDbFZlWEY0OS9FbUkySlNJV0ZTZUM1?=
 =?utf-8?B?QmhVNHpsZDloUllxSkJnbmpQblVpWEpyWkRkZ1drK2RsN3J6OG5kY2dWcUNP?=
 =?utf-8?B?bEpaTUpHWHRMam44RythYVVzN1ZrZEVoNjg1MVdQWUVSSjVYZkVuZ0lnYWxW?=
 =?utf-8?B?WWJWR24yZDh4TWJWQjBNTTAzNUtwWlJTekxhMU44anFPa1ZZd3g3d3draCtL?=
 =?utf-8?B?WjlTNFQybmxYWWZEM1poYWZIQURVZjk2cFk2Vmtoc045MjRndm9PekVWVG95?=
 =?utf-8?B?UFlEK3BIOWxxbmhTN1prbXlxNnc5WnhKM2tOZm00NE10YTBZTTVRSUlVRTJT?=
 =?utf-8?B?T2hqVngvWnBHNWVmR1Y0SlhpZUlJclhRRmxEakNBaXZWZmFRRlg0Rm51bS9L?=
 =?utf-8?B?YkxWQktZUzU2RXlhOXVnWXdxbWFmOXFTVnZzS05ld2xCNTRGNW43aGhOTUtF?=
 =?utf-8?Q?oJKkpgI9J7ZmIumBEjieBnZei?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b783a58-f76c-498d-0f94-08dd7c4fd399
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 19:00:45.5396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBzO/RfjdmK+cjMMcxfKLfbmcMe7aII4OMbu3PdCKNMGFppTj9cl0wBL0uljgpQeURiMydPxSYa0BsEc0mEiYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8453



On 4/15/2025 6:31 PM, Baoquan He wrote:
> On 04/15/25 at 12:52pm, Shivank Garg wrote:
>> On 4/15/2025 8:09 AM, Baoquan He wrote:
>>> In codes of alloc_vmap_area(), it returns the upper bound 'vend' to
>>> indicate if the allocation is successful or failed. That is not very clear.
>>>
>>> Here change to return explicit error values and check them to judge if
>>> allocation is successful.
>>>
>>> IS_ERR_VALUE already uses unlikely() internally
>>>
>>> Signed-off-by: Baoquan He <bhe@redhat.com>
>>> ---
>>>  mm/vmalloc.c | 34 +++++++++++++++++-----------------
>>>  1 file changed, 17 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>> index 3f38a232663b..5b21cd09b2b4 100644
>>> --- a/mm/vmalloc.c
>>> +++ b/mm/vmalloc.c
>>> @@ -1715,7 +1715,7 @@ va_clip(struct rb_root *root, struct list_head *head,
>>>  			 */
>>>  			lva = kmem_cache_alloc(vmap_area_cachep, GFP_NOWAIT);
>>>  			if (!lva)
>>> -				return -1;
>>> +				return -ENOMEM;
>>>  		}
>>>  
>>>  		/*
>>> @@ -1729,7 +1729,7 @@ va_clip(struct rb_root *root, struct list_head *head,
>>>  		 */
>>>  		va->va_start = nva_start_addr + size;
>>>  	} else {
>>> -		return -1;
>>> +		return -EINVAL;
>>>  	}
> 
> Thanks for reviewing.
> 
>>
>> Braces around return -EINVAL seem unnecessary.
>> They can be dropped.
> 
> This complys with the codeing style required in 3) Placing Braces and
> Spaces of Documentation/process/coding-style.rst because other branches
> are multiple statements.
> 
>>
>>>  
>>>  	if (type != FL_FIT_TYPE) {
>>> @@ -1758,19 +1758,19 @@ va_alloc(struct vmap_area *va,
>>>  
>>>  	/* Check the "vend" restriction. */
>>>  	if (nva_start_addr + size > vend)
>>> -		return vend;
>>> +		return -ERANGE;
>>>  
>>>  	/* Update the free vmap_area. */
>>>  	ret = va_clip(root, head, va, nva_start_addr, size);
>>> -	if (WARN_ON_ONCE(ret))
>>> -		return vend;
>>> +	if (ret)
>>> +		return ret;
>>
>> Is it safe to remove the warning, or was it critical for debugging?
> 
> This comes from a reported concern because va_clip() could be failed by 
> NOTHING_FIT or kmem_cache_alloc failure. The warning here could cause
> confusion misleading people to think vmap area management is failed.
> 
>>
>>>  
>>>  	return nva_start_addr;
>>>  }
>>>  
>>>  /*
>>>   * Returns a start address of the newly allocated area, if success.
>>> - * Otherwise a vend is returned that indicates failure.
>>> + * Otherwise an error value is returned that indicates failure.
>>>   */
>>>  static __always_inline unsigned long
>>>  __alloc_vmap_area(struct rb_root *root, struct list_head *head,
>>> @@ -1795,14 +1795,13 @@ __alloc_vmap_area(struct rb_root *root, struct list_head *head,
>>>  
>>>  	va = find_vmap_lowest_match(root, size, align, vstart, adjust_search_size);
>>>  	if (unlikely(!va))
>>> -		return vend;
>>> +		return -ENOENT;
>>>  
>>>  	nva_start_addr = va_alloc(va, root, head, size, align, vstart, vend);
>>> -	if (nva_start_addr == vend)
>>> -		return vend;
>>>  
>>>  #if DEBUG_AUGMENT_LOWEST_MATCH_CHECK
>>> -	find_vmap_lowest_match_check(root, head, size, align);
>>> +	if (!IS_ERR_VALUE(nva_start_addr))
>>> +		find_vmap_lowest_match_check(root, head, size, align);
>>>  #endif
>>>  
>>>  	return nva_start_addr;
>>> @@ -1932,7 +1931,7 @@ node_alloc(unsigned long size, unsigned long align,
>>>  	struct vmap_area *va;
>>>  
>>>  	*vn_id = 0;
>>> -	*addr = vend;
>>> +	*addr = -EINVAL;
>>>  
>>>  	/*
>>>  	 * Fallback to a global heap if not vmalloc or there
>>> @@ -2012,20 +2011,20 @@ static struct vmap_area *alloc_vmap_area(unsigned long size,
>>>  	}
>>>  
>>>  retry:
>>> -	if (addr == vend) {
>>> +	if (IS_ERR_VALUE(addr)) {
>>>  		preload_this_cpu_lock(&free_vmap_area_lock, gfp_mask, node);
>>>  		addr = __alloc_vmap_area(&free_vmap_area_root, &free_vmap_area_list,
>>>  			size, align, vstart, vend);
>>>  		spin_unlock(&free_vmap_area_lock);
>>>  	}
>>>  
>>> -	trace_alloc_vmap_area(addr, size, align, vstart, vend, addr == vend);
>>> +	trace_alloc_vmap_area(addr, size, align, vstart, vend, IS_ERR_VALUE(addr));
>>>  
>>>  	/*
>>> -	 * If an allocation fails, the "vend" address is
>>> +	 * If an allocation fails, the error value is
>>>  	 * returned. Therefore trigger the overflow path.
>>>  	 */
>>> -	if (unlikely(addr == vend))
>>> +	if (IS_ERR_VALUE(addr))
>>>  		goto overflow;
>>>  
>>>  	va->va_start = addr;
>>> @@ -4753,9 +4752,10 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
>>>  
>>>  		ret = va_clip(&free_vmap_area_root,
>>>  			&free_vmap_area_list, va, start, size);
>>> -		if (WARN_ON_ONCE(unlikely(ret)))
>>> -			/* It is a BUG(), but trigger recovery instead. */
>>> +		if ((unlikely(ret))) {
>> 		    ^^		   ^^
>> The extra parentheses are redundant and can be removed for clarity.
> 
> You are right, I will remove it. Thanks.
> 

Please feel free to add following in next version.

Reviewed-by: Shivank Garg <shivankg@amd.com>
Tested-by: Shivank Garg <shivankg@amd.com>

Thanks,
Shivank

>>
>>> +			WARN_ONCE(1, "%s error: errno (%d)\n", __func__, ret);
>>>  			goto recovery;
>>> +		}
>>>  
>>>  		/* Allocated area. */
>>>  		va = vas[area];
>>
> 

