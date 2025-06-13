Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2AB2D8797;
	Fri, 13 Jun 2025 11:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815120; cv=fail; b=BYYu6HmGLe+coONBq2uz5bBD4+aWzAH7zB9uFmergrGHIMnVCS/br7oVp7dD1Z0IxtOblJGbRiSWl6ArgGwdUJrhTSU+zi8P6S4cB+nz49HraGsC05q2KL2ERLwmWiFOfwB2w4co/AIRFYFVQsGFGtxM5baFav9gT6TRBu/fWUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815120; c=relaxed/simple;
	bh=vCCEKatrNf88sdLQNDU2Jpot4wls7xd2lcp2QRAgbtU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hEhhhTrsXc8s8u972hF2M4w3W9XsXcmdJ5WFvMx3FGm33YlhHoWUWC4Hv59XDAktNx4TVY7s7Jfny9yi69FcPIWsUbsVFCNlN9bZICP1eOB4Vam4N3CaqnX6O39ZE5DpqQEfkY+1A36fUDSYlb4pAFqnqXlEuIgGxQKFLimQi/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zfF5sIaq; arc=fail smtp.client-ip=40.107.93.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zfF5sIaq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=co7bYy5IkCtnDaQcGOraV2L/ICo7KrYccEfVaWqlTKSjyxFXkbChejmR6U5ppJXQSuf52W8jahb0RzLYI1fSadqpr2oP6nvsDqmvjPLAODCAEfqZR7I6Sk01TUjWdnUCcZcEsbIeBhlGyLGXYo+lQlzkw86qYkyNc3pJEgB1cAzM9Iid3ltO82RrEXrHQJOBpA65nf3pY7MhuHH3vKUrHle3DY5DncFS2yC4lRFEH8T5cHk3JqcbuK2Q4lhKndYaFnm+OTHvJXe0ifKs0NWZtBclQavJbAocooj+SJMJnxaMgZvV/y5wFsCRNqZiyaxqG8gbzRNMeaTNCBn7Wkv76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdYQYEg7K+fQUJ8Jxybsqn26/ssihp3Qg6XuLldyuTU=;
 b=V+AM6OH5kHsJxTWiwmlGaKBl1kmbbesiZWFiJoJEzb0ts7MWf01zGvu7A/pxV29peYF27WZAWjrrhJiibbIYqFmiKAoRjO9YHGZVKlMWVQ8oM7vxLLVxeaYlhRPdXXKYkS0w9Ijd5FCqCa6kMLZb5bqMyqAtM22PoO30lv2LIw6oNpAnFTNALgVl4/EznU+e0hgyUpm5jclaY66rLXm+G3m5GpM0HB4nsH3buozhGkP2P6I9z41MZf7AeGtj3UnT0CGkEiWGznxoqIb13F7yizx5kUx5N3oVATSr4mHvvtXVnxpUSsjfYql56QnPoffDtmOAyivmoLbw3hqPICXc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdYQYEg7K+fQUJ8Jxybsqn26/ssihp3Qg6XuLldyuTU=;
 b=zfF5sIaqwQQZe6HNfu9y7ZA2YlUt9/m4ODasEzxM9Gfxr8BUzUV53QDfP65v2bb5JHIg7Fvd2YTAK0gDIX4PkrtfIrwJ4YUESuby7+bjsQkCrXzr1JBZ/FSJktGnNgpUWORCaXY1UMHE0xdRfeZOTGhRWL7xvLI1DsOZsgo5eiM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by DM4PR12MB7598.namprd12.prod.outlook.com (2603:10b6:8:10a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Fri, 13 Jun
 2025 11:45:14 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 11:45:14 +0000
Message-ID: <0f22b60a-abfa-4cfa-9104-127d83edd883@amd.com>
Date: Fri, 13 Jun 2025 13:45:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: microchip,usb5744: Add support for
 configurable board reset delays
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <1749148171-1729610-1-git-send-email-radhey.shyam.pandey@amd.com>
 <f1b83b96-7cac-4014-b791-e073d2299c01@kernel.org>
 <2e03b43e-5917-4581-9aed-780dec9e3ea9@amd.com>
 <896e09a1-6376-4516-901d-354993ac4afc@kernel.org>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <896e09a1-6376-4516-901d-354993ac4afc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::16) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|DM4PR12MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: d1457eeb-8b16-4574-6063-08ddaa6fc2ff
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MldiNmxYTU1XY3B3Rk53M3FxbHFIU2tFL3kxM09pb2VOTWpHSmthdTFmMjFt?=
 =?utf-8?B?YVQ1dDZnU0gyVGJWM0JHamN4K2pOMWFNdlpoaGgwUVMwTUJBNEd4NG1INlRl?=
 =?utf-8?B?dTg4REFYOTdQWGJlNVVDd2dyWHlUc2piZzN4ZW8vcHlSUjVyOU1CR2tXZDRi?=
 =?utf-8?B?RWpQUUJsV3RJL1VyTzM1akRIVVNoZlFkbTNHWUpEaEpzcEVJQjJjQlRpZG9z?=
 =?utf-8?B?UFF1RVBHTkVidjdvUjU1TXpSemM1Mmc5cWtpMjI5MUdQeVBkL1lRUFcrMUtC?=
 =?utf-8?B?SmhqOWJvczd4WGRFY0lzUHdRalYxOU4xTW00ZGtTMmFYOUNodWFlQ3NhTUd1?=
 =?utf-8?B?dXJPQmRFNGZtQUFHcU5EbStuUzZrZGppNDg1UXg0V3R0ZVlEZFdZaHBpbkJV?=
 =?utf-8?B?bG1RM1VqODQ5TEdTT2NLNDBPaThORy9oWitieFYyeUtSajZyWVBQNWJEM2RY?=
 =?utf-8?B?a25EZCsxQmRJbkpOeWtVb0xqZGJzTTZWTmZtTDNjSGllRFhVK3plUytGT3h3?=
 =?utf-8?B?VytFS2xESkljNGJzV3E4NEFCSEdMMnVoZk12bSsxY3Vpd3pKUWtJby9kRG95?=
 =?utf-8?B?bDR0TzI4SFhWbUJCeCtSaERwRlBDL2p1WWFYYXUxWFBGL05jN3ZEQW54N3Nl?=
 =?utf-8?B?ZzY5dDg4bHhPdVd1Z0E0RVRYT2R4TFhlekZWeDdCNzBjYnB0SFVZenRQbU5O?=
 =?utf-8?B?dzhQZnBJcGtjdTBycURrRmJoZGlOV3o0RmhMNEdWV1Z3bE1EZWRYU3Z2b3FM?=
 =?utf-8?B?eHFudFRoWWhJaDBwb0pNLzErY0RBMEZRRURtL3F2SU1BMmlRN0N6ZWZncnd2?=
 =?utf-8?B?dm5MS2lTTE1IelYzZURSUENMTzNFK0NGV2MydjRUNG1QaDJML3dQN1lLUkJB?=
 =?utf-8?B?VlRHNnlaRWRJYkl5ZEhrMytzT2RtM0xPb3NxYS9CSlBUSXBHRGhWZDVBM0FY?=
 =?utf-8?B?QjJueUJDTVhqUjh1SS81WlA5OXVpQWdaNkMycWVpZGdnQis2a2twbHhzclFU?=
 =?utf-8?B?N0ZCeFQyRXFSSVFvbjhocGlsbWNiSXRiMmtMNUVGT1Vmc1diY204ZXowUmYr?=
 =?utf-8?B?Q1FrVFNIQndHcWwzNFJsRVRLWkxIaWloV1p1aTc1R1hzdVArV2kveUx1bVds?=
 =?utf-8?B?WEZ6KzIyWVJJSG5QR2NTOE02bDlQd3RSZ05MdnhtRlJoa3J1VnhKR2RVUnJI?=
 =?utf-8?B?ZW53K3RoNks3NitXMm9Bb0ZURlJSVkJ5SnlLK3RiY0NTZVJDU0xQMVJFVU5k?=
 =?utf-8?B?bkV6a29UaFNFeG9hbnRXQ1krUmdrdmlzSTZSanFya1V3c3dZb2dtbG5CYzlw?=
 =?utf-8?B?c1FVQ2Nzd2JuZitjbzBGbnAzd0hEblRTK1VMdFltRVYwK3hZTHdkNnNCcHpo?=
 =?utf-8?B?YnJTWnZEQXplRkcydkdJeTlYZjJCVm8yZVpGdnEzR0MrVVQyMXFzUlZXWnJD?=
 =?utf-8?B?SmhuOEZERFYyVmdrZWxEU01odmJnTlNpZUVoaHI0WGNtZTdKUzRJK2RQeDN4?=
 =?utf-8?B?Smc3N0k3aUcyQUVKell3N0xYK29GWVF2ZnA5Nnh6WTYvZU1nRVJGcVljMnJZ?=
 =?utf-8?B?TXFaTkV0a2xoTnkybGpGRnJza25PRm8wSjZoUy9OcGlsUXZZczR6bnBlb0Nu?=
 =?utf-8?B?UkJ0WGxMbUVyWjlOS3hrTXV2TXdFdXM4MjZhcFlYM0VsYXFUbXQyOHpHUlNw?=
 =?utf-8?B?NWFsQzBzUGd2ZVpUUXFjN1QzMlRVVmRBcG5mbmRIVHZSMmJXVURYUmhnVHE4?=
 =?utf-8?B?Mlhud0xJUERSVjRHcEhmK2p6SFB1Q0kyelcwL2xVRDlEVm1VUjRFNSt2LzlG?=
 =?utf-8?B?T1VKUXdXc3BRTFZIcTRQcGFVdXI5QmtveG1GL0FVRSt4VllYVHp3aGVoRXJR?=
 =?utf-8?B?RUNzc2Fjb3lUWWt6Ukw1and3N3VodEkxZTRPOEZKQXliKzFmS052RXJHN3g0?=
 =?utf-8?Q?yygK8JCqXTE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEJQUUptN00zaFowa2pKTWVMY1RhYXVLQ3FkVThqaGw4Y0ZVaWZiY0NqMmc3?=
 =?utf-8?B?MHg5T3ROb25relJPQzFYcS92WEtXdUZYVHYvQUFKU3d3cnRPcEJaVkR3QzVM?=
 =?utf-8?B?eitxcUROOC82eEhsZVEvTnI4LzVsUnh4Um5odDFycEU1MDRRNDFCQmV5WFo1?=
 =?utf-8?B?dVBkU3JvdEp6T3UyekZram53UFJqbkxwdlpxbWExMzArWDRqNW9RaFJzcHps?=
 =?utf-8?B?a0VpTGk1enBLbGx3R0pEeE41eUkvSyt4NUprWldOeS9kdG11RHExT2VhOC9I?=
 =?utf-8?B?SFZNMGN6aFhmcDVNTi80bnRiUzNzNm4wT2JsWkxTclRteUZUNVUvd2pFaHRl?=
 =?utf-8?B?VE1DWGtOb09FcE5xS2FUSE1pdFBaMzRONGFyb1M0N0t6NTZKUXdGT0FGS0tU?=
 =?utf-8?B?U0RuK3Q1MjZYaERMaGRzTlVIZjFzSXZVRWVyMzB3RjNTTGU1LysxakdvTlFD?=
 =?utf-8?B?RSt6bndpMzExMVlxVGM3Y3Y4eWVvaEN0czhDNGZMK2ZaSjVLaG11RkpGOTRh?=
 =?utf-8?B?QzhvZWRzVzJEc3pRT1NJSGpKNlMwM3pwa3dTWDlydGFkcVNMZjF0OWQza1ds?=
 =?utf-8?B?bVI5dm43L2lRaFdxWExGK1hxS21NbGNaUTZEYUYzYjkvMHU2VDBMQUxTY3Zs?=
 =?utf-8?B?b2F2WkFiMmtaRW9pbVUrbFg1MWxicFJROFQ0Wk1mVHQwTm9SVTlVRWlOTkh5?=
 =?utf-8?B?eDNMcVJ3enNPRmwwMm1NaVdGUFhKdGdtWjNkK0w5YlJMYThBN0tVb3FIdmQ3?=
 =?utf-8?B?Tkl4cTFYZ3ZtNURuRjU0UnllY0wrU01mTTZZOW1MQlhlNW1lZG1vSmNlSFMw?=
 =?utf-8?B?NGhpUmtPQzFvdEw4Q0tPK0dqWFJCMmIzUmhJMzdzbkJ0NS8xWEg1dlhEVW4z?=
 =?utf-8?B?UXFtWHBqSXZqZ3dMbnREekdVanRIRUZNTk5mM0tpNE5vSUVhdE9FSk9EenJW?=
 =?utf-8?B?aDN5ZjJUWkZ4UUNNRXh1T3VqSlBXWTduU09wRG5VTGRYYzVJS1l0WGdlNC9t?=
 =?utf-8?B?dEozMmNTZEVXZVpRbDJ4Y3N5T3REbnBraFJNaWRWb29YalZYNVkxSTRFNnBJ?=
 =?utf-8?B?MVU5MkVIOUhhU3h6OS9ucHZsdFBnTnRVT0IvdDQxK1g5ZkRkNjd5RWJUV1cv?=
 =?utf-8?B?aG9IZS8xZTY1SjI4Z1QyOVpVUkovSktySHFCZll3NS9NdWQvanUvUjM5VUpa?=
 =?utf-8?B?MWEvR29ldFk2WExDTTRWUWJqUFVpNFZUZUZmTHFXekJwSjQxUE1UQzMybUI4?=
 =?utf-8?B?RmNudDYza3l1elZoWkc2djkyNXc0dTZpV2ptU0VCTUtaYlpON25lckQ0YklH?=
 =?utf-8?B?U2FTZWdUcVRwSW85UmdFVVNZZXl3bHFoQWNCSk1XQytGSlF2ZHBJeWhGRjBE?=
 =?utf-8?B?dVFSeUVWb1JxZDVoRlFmTDFoLzFqV2hmWklxOTBPZVNKV0FmVTRyNDhGOHFH?=
 =?utf-8?B?VVlhYzJIN1psSTFWRGxTRVBDcFc1Zk15OEQyRWVVTE5zMTZJSURha1E4R3ZG?=
 =?utf-8?B?eDdYTjU3Rjlqek1pakx5aDlkL0tMZ0srdFNyZ09vdXNuY0RmcHpqc3FGbDlU?=
 =?utf-8?B?UElTQkNkaEZ0V1ZnNUxSK2NhMHBtYmFFQVY5K3BUcHZyMXcxQ1VOOVo4Ym5G?=
 =?utf-8?B?YWFsR3A2T2JGZEJEbzRic2pPYmdWYnN1QnpiT1JVK1pYbGtMZEpWaklnSzha?=
 =?utf-8?B?dTVRVFJkMVpHcUZQMkpUS1YvWVhnVUQwMlNJTGRlTFdRZXZLdFNiWHdoVkIy?=
 =?utf-8?B?TGpHNDE0eG4yM1V1T3NNMkxTOTZJVEhMcjlxUTkycytHU2tObTB6MU5pSFRm?=
 =?utf-8?B?ZDdVa3QxZTJ4dXB3ZHV3eUpkNG5UVVlUTmpqVk5VV3F4d2tWaEpNT0ExbXln?=
 =?utf-8?B?NkhpN3drOEUvZE8raVdTUUthaWl0eUxPWkVoWDErai8yQlVOdnZYZ0hobXky?=
 =?utf-8?B?TVc4bmt2TkM1bEp0Y0VkeVVmSzljMWdvd0kzMDJId3VVb1cvNXhjcTh3QmpT?=
 =?utf-8?B?T0NyUW04eTdKczk4WmM1QVhWWjE5VGVCQkdyZkJsQ00zV2NXKzZ1cWtiN3ZE?=
 =?utf-8?B?WVFjbnZDVDZRT29oMTVHNXRSSXZjL1lELzNLZFJnZEx3N3c5bXJrTnFnZ1N2?=
 =?utf-8?Q?ZkWP2NrfdLvvGzFCVFD+4tmoT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1457eeb-8b16-4574-6063-08ddaa6fc2ff
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 11:45:14.6932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9el+xiOChGr4hw0K9GYd6GVE7IE0KJNbuWfJqluUsbGHd8boh+CUxtl0Xyqa+L1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7598



On 6/13/25 13:12, Krzysztof Kozlowski wrote:
> On 13/06/2025 11:13, Michal Simek wrote:
>>
>>
>> On 6/13/25 10:47, Krzysztof Kozlowski wrote:
>>> On 05/06/2025 20:29, Radhey Shyam Pandey wrote:
>>>> Introduce 'reset-delay-us' and 'power-on-delay-us' properties. Default
>>>> delays in datasheet are not good enough for Xilinx Kria KR260 Robotics
>>>> Starter Kit (and others) so there is a need to program board specific
>>>> reset and power on delay via DT.
>>>>
>>>> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>>>> ---
>>>> Taken reference from mdio.yaml[1]
>>>> [1]: Documentation/devicetree/bindings/net/mdio.yaml
>>>> ---
>>>>    .../devicetree/bindings/usb/microchip,usb5744.yaml   | 12 ++++++++++++
>>>>    1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
>>>> index c68c04da3399..94a2bebd32da 100644
>>>> --- a/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
>>>> +++ b/Documentation/devicetree/bindings/usb/microchip,usb5744.yaml
>>>> @@ -52,6 +52,16 @@ properties:
>>>>        description:
>>>>          phandle of an usb hub connected via i2c bus.
>>>>    
>>>> +  reset-delay-us:
>>>> +    description:
>>>> +      RESET pulse width in microseconds.
>>>
>>> I don't understand - there is no user for this in USB. Why do we need an
>>> ABI if no one ever uses it (and commit msg should clearly explain that)?
> 
> This still needs solving.

Let's solve discussion below first.

>>>
>>>> +
>>>> +  power-on-delay-us:
>>>
>>> No user here, either. Plus I just wonder if you are mixing here RC
>>> delays or regulator ramp delays, because datasheet does not mention any
>>> delay.
>>>
>>> Can you point me to datasheet page explaining these delays?
>>
>> Here is datasheet.
>>
>> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/USB5744-Data-Sheet-DS00001855.pdf
>>
>> 10.6.3 chapter
>>
>> minimum assert time is 5us this corresponds to reset-delay-us and then there is
>> requirement for minimum 1ms for configuration strap.
>> On Kria platforms 5us and 1ms is used in U-Boot usb onboard driver but that
>> times needs to be extended to be able to configure hub over i2c.
> 
> 
> And why minimums don't work? Because of some RC circuitry? If so, we
> have bindings for GPIO delays as well.

There is slg7xl45106 device which is likely adding delays.
But maybe this is something what can be validated on different board without slg 
device to see differences.
Let me look at gpio delays too.


> Or regulator-ramp-delay... but I already said about these two.

Not this one because there is physical regulator to wait for. Second time is 
configuration strap one and power-on-delay is likely misleading and should be 
renamed in the driver.

Thanks,
Michal



