Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425A930E84D;
	Fri, 20 Jun 2025 20:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750449780; cv=fail; b=jrEw3mpfKshbLR2tmFyEBRgyKMWgcERqi9nEy/QxR/0hvb/vlzxT15G3zctVc96cMAGzbGWOdg0mZPn3D6UA3ihNzEtSqv/KBfZXOOdxjC0Xi5drofaCaE0CPCvT/5Q5pfmpePdfCR0775psqaRYFu+PA+XcwFsxEgx/jTJbepg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750449780; c=relaxed/simple;
	bh=D7EEtRavgzL/aej4JWe0CQKZ9daQ8EttaxWbqkJLlJc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fVHdUKnYy75iOziC20stfJ2WsY3WIwkinn3OQBsyqkoKAqqczYr5bsGVMv138MuUo0iM+mA7MDtA2amzua7dWBIubht/MN5LKT+WyE4limWv5zLWRuNuGI8gEhFdzxeMojsPfJK9EYrxUUMcyl3fox4wVHVFANYq6OqNtat1238=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hisQtC7g; arc=fail smtp.client-ip=40.107.223.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hisQtC7g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kf052bl51wo842rKTIWKJboCWPqd9hHfsT8uNNJpLCKAeRJAnu5++Pq9SlvjFVy3M1cVcaX03dEmZSTGxe0mO6OPGo26llkY2Deezqg3PQ7Mt6aZeFIgNE1S3cGYPMX9AnW+WVz8YpfWxzdzr9WhUMlCnkmzBvJVDcUoCXjy6wYmib2D2r39BEF65rBM3gYYn0pNuFW7akSnlwHOkYoUdo0LAS0VEcork4MGpyJ+J+fcVn9uda8pfl2Q7U85sC+OF0lFs0ofB2Gj7KUpRdyx8+0uGRrDveNJAXHs4vAp7x3ByfioT1wrJDO56LT3BjuKTcRX8qZ9nOe23jeldOiQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j71XMOg9URpT2R99uYkEDmCK944SElCb6FadvfKLZuk=;
 b=hqi1fHq6MgEXqudKzblmsrnP+eWIp2rGAwyCiFAx6F34ZX7qFXEa6NL4RZ5bAnkthdfeoIEuJKQXKPvNpBPCEjf9ZTMAaHj2KFlIjX5ewn51HuoURdPoG81PPHJB5fnY/RceyScdyd3ohlR79J1eAMr+2LyeMGFaipeabUTQ2VDyRY9bxIxd2CuGNuPOQcJ9JLzLNVySFP/SH8g8Yz2p3VYzFAhaqVp/LKr/MKef2rx0rsgx8Y1KrxdgOaeR+hnCs5lLN4zFaqL30KTsIbnOMrZjoiWVtsSbHP5M18X/A4LwoxO6QpAt1jLQ4KwdMcsQbPXh9QiacAxhg7gMvxGSWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j71XMOg9URpT2R99uYkEDmCK944SElCb6FadvfKLZuk=;
 b=hisQtC7gSZ7JOUR+1o75wOtmszgmXmwTXtreRDh6aJWVdF+ZH56MaVdISGCqJkrv3An0UkD0fUG/rAN0LiDN+3VDhMtra7Iqp5y0LR9rICd7FesNuAAeluZ9earF0+V8ViXxMB1w2BdlLc+Y6WgTTwjb1KpdFiMV5v4OqzwCK9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by CH3PR12MB8512.namprd12.prod.outlook.com (2603:10b6:610:158::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 20:02:56 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 20:02:56 +0000
Message-ID: <4e4edb94-e2fc-4e32-bc27-3b0bc5ccd74f@amd.com>
Date: Fri, 20 Jun 2025 16:02:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd_isp4: prevent built-in configuration
Content-Language: en-GB
To: Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>,
 Benjamin Chan <benjamin.chan@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Armin Wolf <W_Armin@gmx.de>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Chan, Benjamin (Koon Pan)" <benjamin.chan@amd.com>, Bin Du
 <bin.du@amd.com>, "Rosikopulos, Gjorgji" <gjorgji.rosikopulos@amd.com>,
 "Li, King" <king.li@amd.com>, Phil.Jawich@amd.com
References: <20250620115448.202425-1-arnd@kernel.org>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250620115448.202425-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR08CA0016.namprd08.prod.outlook.com
 (2603:10b6:5:80::29) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|CH3PR12MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 374f809f-64f2-46ad-73ff-08ddb03572e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVRWcGhicFU5MUw3azdScExUT3dXUkg4ZzR2Y3JHSUMrZy91SmYvQ25CUldO?=
 =?utf-8?B?cWZNWVlVeUhqYkJVVHlhUk1vUkhaQXV2L0xGRm9pN2lVRXRWVVo5TUREQ256?=
 =?utf-8?B?d3FvSXpLVEhuV201ZWlDZTZZYlIyQ0k5dzhRWUVCc0hhSlpLWlI2bHF4MHlN?=
 =?utf-8?B?enh6bk9BdUs0bkEyOVBFZUZSR09Lbm5NbHJ0b2hLL2NXWnp4VFhaTjk3VUda?=
 =?utf-8?B?OEhERURGT3RUTmZTNzdrNXRpWHlmVE9FMUVnbzVSSWxwTHhjRXRBRDF6YS9W?=
 =?utf-8?B?ZGxvK3pQTGNKNXRLSTNNcGhvQzBDVnZtV0xCczY4VmZEWkJHRjVwR0pQT2lI?=
 =?utf-8?B?bytHbTV4ZXRLbWRCcXRBSk1aQllvZ1ZMVkdwbWltVWRDWmFiM3JvYW5vdi9S?=
 =?utf-8?B?eG45a1o1RE1DaWo2b1VIdSs5NldEaGIzWGxjSUdmY3Zjcm5uSCs0bVF0Qk1X?=
 =?utf-8?B?NlNMQWtwM1poWFZGTk92czl2anRTdUxiZGRqc29HWXErVVRVM25EbVpGWmpr?=
 =?utf-8?B?ZzZmc1VMZFkrbTNScmg5RU5hbVpQOFB0MzNZcThZQU5VRzFxN1hkbTdHMk5B?=
 =?utf-8?B?dlVkL29uQWwwQXNxZk5PRFFXUUl0Uk8yTnF5cTkyQmZZcC80emQray96cDZj?=
 =?utf-8?B?aHo1U05vMjllRFlrSUFPSEw1UkdwMWJNWU12Y29odlk0VDJGNW4rOUtseFhH?=
 =?utf-8?B?dnNaTFcwVFBRajg2a21SZHE1Z1ZhOUwvOTFzeUVyN1paN3liQisxNktyUkgz?=
 =?utf-8?B?T0xITnFyaHd0THYvUTdYY3gyVXBsN2Y4ZEEwMzEvL3VwZHZyUXhueXFqRlhS?=
 =?utf-8?B?SkExOU1jY3hYRHNQSGFlazNlSW1aYWN6WkQ0Nk1FMWE5a3lMVjBEQWNpS2N0?=
 =?utf-8?B?OWZJb3NYMHVoVWd4S3VVQkRrbzhiTlFyZk55VFFnV0R3NEpuSkZEekszQ1Yx?=
 =?utf-8?B?NllKSStWZ3VDSGw1S2FscnV2SVVHNkR1OFl1ZjFnYmVwY29odHF5UHE0L2Fw?=
 =?utf-8?B?WGpXU0J6QTZMUkhtSjVvaU5LWEtrQkNoTlFyQVdQQTIzOVUyaDk3cm9aOStV?=
 =?utf-8?B?clFEOHlqaWoyMlhFcjk3aFp1TEV4MUswK0RYQXNnMGg3MHpDSkVlN2RYVG16?=
 =?utf-8?B?dENxWVVqSkdyTS9WTGZ5V0dhS2d1YTA5QXREcVJkblV2eDZadTgxUVBoSG0y?=
 =?utf-8?B?QkhiMTJKR2tMVFdWVk5XZ05NV0FOVlMvelNLS1U3dWpkK1hYaWRvZDhhK1g5?=
 =?utf-8?B?RlJVRjc1QjhqSzQwLzRvSzUyOVVNckZkUkdsbGJZeG9EcldLQk1mUzh1ZG8r?=
 =?utf-8?B?dWhlVkN1eFNucTAwclJJVU9LRi9hcTJXUnhLRHhHSXVWbkF4S0lVKzd4UlRx?=
 =?utf-8?B?S1ppRmM5T2g1a2xDSzNsb2k3dm5XTjZJYThock16UzFPazkvb3VaKzZkWFdM?=
 =?utf-8?B?a3Z4VXNwWW9YUmNZYXA2TVlvVXE5NXlTbDdERENaODJJV2tlc0JEbWRqaW5x?=
 =?utf-8?B?Rk5GZHBpRlVzQytLelREcmd6cFMwd2cwREtweEtVRGdFc3hQZi9TaDJLdkpj?=
 =?utf-8?B?aWl0My9YeXVMem4wOXFaY05EaHlsT1lwWUR3QVlNOWV3OTBpTWFTWmpEV21S?=
 =?utf-8?B?bmV1T3IxcFRPMlcvU2cvVS9nVVpQUnh0aThGM0hoNWdheE43aWlZeWVzS1A0?=
 =?utf-8?B?eWwvd1N6a0Y3UG5DdFowSjl5KzRUbVdnR2JyYS9CdFpMMWhDZS82WnFWM1VD?=
 =?utf-8?B?Q3U3UHh4STRrcXZBaWlKcXNCaVhmVDNGOWtvYnFMc0h0M25aTWZib0pNa0RG?=
 =?utf-8?B?cVo2WWtTMm5ZM0l4T2J0WHZvWkU3U3k3c2pjTXY0V01ScmhvdEVmc2RKTE1Z?=
 =?utf-8?B?OHdPU21BN1FDaVVDNndkMWxTQWdPQlg2ZFNHdDh0dFV3c1lxRWZuaDhDSEZn?=
 =?utf-8?Q?1THyqVwTiL3QK31yc9znK/MCIVV87i3e?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clhiVGlPYWVWNDBrdEdUcEkxK2QrL2drTkNEcFpwNGI1Q3JFaW9UZUM2djk5?=
 =?utf-8?B?L1BtRWx1TUhQUmFyc0s4M0tQbTEyZi9IYnhhZVdEMEZxWEFLQzZtTjBCdWQx?=
 =?utf-8?B?Tml2Nkh4R1BxNmZoaEZJVEQ1bHp6VkJTUVpWVHpSQTlrRGthVWJEeEpRNHRH?=
 =?utf-8?B?OHc3RG1TNEJmb1ltS1VReEpyMlh3K3Q3L0xyVTNFQ3JpbU5BUmxLbGhPVjYy?=
 =?utf-8?B?bjB6cE1BZHk3R0tTcnpxMWE5Uys2aFJEdytlbUlHOG4xekxvQWhOWU1lQy9q?=
 =?utf-8?B?Z2V4YUhrdFJwK05mc0ZCckFMSTJRQlgvbFRYM2JvUFNhRGUrM2F5a3Vidzcz?=
 =?utf-8?B?Sjh3aGpaQndoMzBLSFkyd2lTZ0tJdGdSdjdrM2Nkb0NRbWFiVTBycnZYUHkv?=
 =?utf-8?B?Tm55WitpUzIzeFVneGhvN0Q3akgyYWRyaE9EVTNOSFcwd2EwZ3JDN1Y3SmpB?=
 =?utf-8?B?ckRkbnBEQlpBWGRoWnBVK2RvRy90ZjlIcGtVM09ZSThDZW1Rb1VZYVBKNWtv?=
 =?utf-8?B?T21KWHl4bTFzZTNFbXZVSVdNV05URWJ4R1hOUGNhVFg1OWhnQ0tybXllTitC?=
 =?utf-8?B?NWttK2xtN0IzNGlra0dVbVR6enZFNVQyTURBTVpJZnU0L2JYclZ6eFFnRTMw?=
 =?utf-8?B?QTA3R1F5M0hPQXNscnhSSE9LQlM5eElGYlBYcTVKYWkvUy9kNGR6bzRRcHB2?=
 =?utf-8?B?M2pXbjEyZWloakV1Q3cwamQ2dG1OWHpMVXJZeXNvVC9jVGYxRlFDSGY2cjJP?=
 =?utf-8?B?UXlwVTZZMjVGWnp2MVZiSE5hdDRMSlJ0akREUHd2ZEpwSlVyWEFtSGk1Q0hs?=
 =?utf-8?B?T0FBNWRRZzZ1TWNiVi9qR3J5Tzl2VXRGTVVoQThXcGdyZzJJQzUzaktBMTk2?=
 =?utf-8?B?SnlqSjgySG50YzI4TEhLWFcvdGxBL09GUDduN3hJQzVEN21OTWwxaElOdWxK?=
 =?utf-8?B?S3VoTlYyaFhUSWxjOXNvUXFNdGZtWGlyeXFCZ25ORm1pQzZEdks4QThZOGZC?=
 =?utf-8?B?dU5kMTJISS8wNFRSOTB3ZjAybUp0bTcyY3NWZjB3cW84b2JyZVZRNVFiS1NT?=
 =?utf-8?B?MWhUWDRleGNDZmtmUDJyUHI1bGM5RmNnbHBtaEhRb2tOTU00bTIra1dybzVC?=
 =?utf-8?B?V0I4cUdpaVBja2RHdXFlWHBqWXE0MDhKMTRzR29wZzVReW0zU3Ayd2VDb0lK?=
 =?utf-8?B?c0NFcC9mNTdsaU9SZFVaRmJsc2JXZDlmNFVZSjBZU01tYkVsZWdvU053SWpk?=
 =?utf-8?B?Rjh0SXlCQlc4blptK0xhQjRhbXB0dHRQQW1mektxbTBCRW9LalNQMG1mV29E?=
 =?utf-8?B?QTRSYW4xcFFORzdKT0VXVXdGSU1uWEFqOE16RUZ1QjNvcXBqUzBXU3BBbzVh?=
 =?utf-8?B?M1B1U0VjUVJvMGVLb1FhNnpEYUZqR0VqbU53SkpyUkxPNE5VWVorSmVIeE9K?=
 =?utf-8?B?dGpBZDRabGVxOVlXRlZxRzliZkU5ZU5xWFk5bXVLeFd2VkFoMEV3UkhaK1Jm?=
 =?utf-8?B?VjhsRm9LWDltNmtxM3BzOTJtWHNnTVViZlFqYTkzbVdYZnROWmd0S0U4bENO?=
 =?utf-8?B?ZC9lQUdZRENRKzBPSkVZMWtpcWtCVktxRy81a1ZZVzloUlRJZ2F3WHh5U1Ux?=
 =?utf-8?B?dkdtbWEwcy9qRmsrUHJHVm43Wi9Bd09YbXY4c2luRDFZZTZOSmQ5SkJXVENI?=
 =?utf-8?B?RW0rNjRGSGZ2SXRBaWNsYkl1dTlnNGhLT3VuZGsyUEdsbTdDN0RTSjVMSWhy?=
 =?utf-8?B?TGpzdGhyOFJtcUxLaUdzL0lVM04xTlBjQkl5czY2Yk1mNENwN2hNUXhHQ1hn?=
 =?utf-8?B?ZkY2QmJpVmJGWHBNaGxrMzRYQlo1YXI4REN4TUY0SWU1T3FlWmtBOFhhSUhG?=
 =?utf-8?B?cEVhL3NGT1c4M3hHUHczdTBBYzVFcDFXaHFBZUhyZGtkNXhCdnp6OEF6djB3?=
 =?utf-8?B?aURDMFNwTTVDL0lWU1hIRzdUTFlCTWtJa3BRZTFZSmNhNjhpVkk2RllQYU9r?=
 =?utf-8?B?Vk5IVEtleHp2T0JkazhHSUZJYVJ6QnllNnFzbXN3SUxnUkQ3cFh0cFFkZWs1?=
 =?utf-8?B?SEQxRjNlMnVucFhFRFlBNDN1b0FUVnlmYlRtWTErNlI5ZktkWUZwT09JdGpC?=
 =?utf-8?Q?tNSxlXBZ57rR8h+VBsofF7PVp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 374f809f-64f2-46ad-73ff-08ddb03572e4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 20:02:56.5714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqiBp6QJa/k+LfFlbi85sKrfLCRjUQ7Ws6Wubez5st0+MTm9SvZ/TUTALo0j6o8RyvQYW2aL5QNDzQD23Y3nYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8512

Hi Arnd,

Thanks for the patch.

On 6/20/2025 7:54 AM, Arnd Bergmann wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Checking the module owner of the device only works when modules are
> enabled, and the device is created from a module:
> 
> drivers/platform/x86/amd/amd_isp4.c:154:28: error: incomplete definition of type 'struct module'
> 
> Building the driver as a loadable module avoids the build failure,
> though this should probably be fixed in a different way that still
> works if the device was created from built-in code.
> 
> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506150313.UHoIoVhR-lkp@intel.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/platform/x86/amd/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index 63e4bd985699..9e150500e37e 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -36,6 +36,7 @@ config AMD_WBRF
>   config AMD_ISP_PLATFORM
>          tristate "AMD ISP4 platform driver"
>          depends on I2C && X86_64 && ACPI
> +       depends on m
This issue is reported earlier and the fix has been submitted to replace 
adap->owner->name with adap->name to remove the dependency on 
CONFIG_MODULES. But until the fix is accepted and is available on either 
i2c or pdx86 tree, I think its good to have this fix to avoid the build 
errors.

https://lore.kernel.org/all/20250609155601.1477055-4-pratap.nirujogi@amd.com/

Reviewed-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

Thanks,
Pratap



>          help
>            Platform driver for AMD platforms containing image signal processor
>            gen 4. Provides camera sensor module board information to allow
> --
> 2.39.5
> 

