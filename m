Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B45923717C;
	Fri, 20 Jun 2025 21:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750456720; cv=fail; b=dEFu84lI/eoLmCzkCXJ2bG/Wb1VYypK+kqsinH1SPqH1azWx1Uc+/7bf67I1RugtzebDTOrjUUQVfoVV1VB6MsaoqDcGkY3R4oCcMPUdgMnWGXoOib24H09OtLCDaC7o3WauY2I0olsqxw2A7AvnbbUuMdizaMGzhBfHXztKMv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750456720; c=relaxed/simple;
	bh=z9N8po0S2I9dYxgDmzbLLEjN+kadciYpJ1nLga9jiTA=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NbBN5A2ZUsmOArpZhpwOCSX36RQSV8t28tL9k97ne5kr4qmOLQcc+tjBFkEN7GvcV4UWAt+j2YMhDeGErgpDu9ss+DZ3okmonhKj59dDOuutTIfykiamO3EUaOQlNjrcHk8uPR07HZd4oj2VCo17tHwxsPBT9z1/8E12pPR2dak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0OHr/R44; arc=fail smtp.client-ip=40.107.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0OHr/R44"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1MbouhiyZM03XPS5cBmst5lQQX8QaBJINJSW7/6oEdxAU8ZZvgLxaS8l2lCilV6qnhGWCTBfcE1nJe1jrdlucWUSVMdwEHIC4rJoa9W45JCrn47UXlXel/46QnmFm8Y8LX+Wl0ApSYddKaXwYDMKSjG6AWLuJ7yZQpfir9ejH1Ncpz7QfgisZ16Xri19569xY5TlipoKR6ga3qJHiCYgyEHlBNld2BiYdnJBiDGNGiJB0gjGP8ii9K+CO7rmXXqvPBB0bHwgyeGjKf6mu1H/peQilPYzWw25Vamu0ghLD3meiAwQxU0Ms3PLoFmXlZOYHCOSZiBepFirvp0BuP0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0Q8yt8eXRItZNNUvrLLLMNbtk9Zh2ZZWTZkHhJMK5g=;
 b=ErRTwerBmybC13JGnBFqXREuKX6K6+cKnrGkW7zrW3so18bYuLn0dvAE4PeIOLFVCGKyJnEzi08hDkmHNB8SrtlWks9x3x5U7d5vhrvVLpniu7wm1dM0Gg6oSFGLLpP2yi0xIx6dKNq4KiAhCe2gGP1a0IAMz6whnIlHAc7kC8r7nP1wivNwXFEXLNeDHLAqnYTsXpgF6tNgyWZryN3DlTc3hOXPzPTFyWtU406lZ++VMNWEABdfgjvcyVNpEqASxMIUYFkiiYpHyOCcESmEhYwJOUfDq3JGcPtJQ5/xSSQtl9fxYbhvRlimu32mpdV16QgDwNwG3LXGVldO9kstlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0Q8yt8eXRItZNNUvrLLLMNbtk9Zh2ZZWTZkHhJMK5g=;
 b=0OHr/R44mtTMPdufSyoZf4A093alM13+fAZaLMzLNi+sS0HJ80vxcHTwEDHjNNfCPC9KlYmov4uWzXbD92/4EXemfB07ZWx5D+53iTH3A1MNjmH9+REBxNMGXKstRB9F+n86E0B7tquNVHfZzvoMg0qnZRVZxjU85VI2Rgsv2ko=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Fri, 20 Jun
 2025 21:58:36 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%7]) with mapi id 15.20.8835.026; Fri, 20 Jun 2025
 21:58:36 +0000
Message-ID: <b2e16be8-c203-4acc-89aa-5af29b7d6e63@amd.com>
Date: Fri, 20 Jun 2025 16:58:29 -0500
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <bmoger@amd.com>
Subject: Re: [PATCH v6 8/8] fs/resctrl: Introduce interface to modify io_alloc
 Capacity Bit Masks
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: x86@kernel.org, hpa@zytor.com, akpm@linux-foundation.org,
 paulmck@kernel.org, rostedt@goodmis.org, thuth@redhat.com, ardb@kernel.org,
 gregkh@linuxfoundation.org, seanjc@google.com, thomas.lendacky@amd.com,
 pawan.kumar.gupta@linux.intel.com, perry.yuan@amd.com,
 yosry.ahmed@linux.dev, kai.huang@intel.com, xiaoyao.li@intel.com,
 peterz@infradead.org, kan.liang@linux.intel.com, mario.limonciello@amd.com,
 xin3.li@intel.com, sohil.mehta@intel.com, chang.seok.bae@intel.com,
 andrew.cooper3@citrix.com, ebiggers@google.com, ak@linux.intel.com,
 xin@zytor.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1749677012.git.babu.moger@amd.com>
 <6f8158ba0eebf41c9ec59e82dcdc28d4d3151c3b.1749677012.git.babu.moger@amd.com>
 <d6d469e0-b5ee-4e19-917e-a3bb4075fd27@intel.com>
Content-Language: en-US
In-Reply-To: <d6d469e0-b5ee-4e19-917e-a3bb4075fd27@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::9) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b0ead8-b868-4c6e-404e-08ddb0459b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGxDZWMxSWJBQ3YzV0t1OGVTdW92Qkpxc09iWUNHeUhRaVhyU2VqUDFoakxt?=
 =?utf-8?B?VTRiNlpaMGxZcE5PVUxGNEQzVUhReDJQNSt6VHFkL2JjSzdEK3QvblgvK0hj?=
 =?utf-8?B?eGZmdVpOUnJpTkRkQmgrblRCWHVFRlRKNEFFcnNKRjhLdXlNbmdwRjd1VEds?=
 =?utf-8?B?Yy82eVpjaHN5MHhnUVF6d29hZWpOUGFmSE9OWVZCT0ErT1JUZlNVTDU3bWdm?=
 =?utf-8?B?R3dCWHdwSml2YnF1cld0NVdZQm5ra044eHhlNXFTTVZrTGRQSjZMZHExOEtG?=
 =?utf-8?B?VkFGMXZoNDBrWk03OG1xS2hNYVp4d2ppU0ZscVZYL01WYlZkenJjeTY4NUpO?=
 =?utf-8?B?MW91R0tOUGlCVS9kclg0a0FSajFkZGhQVlVoNEZMdlBlNGFmN3lMWTdpcVIz?=
 =?utf-8?B?bW9TUjVHSFc2djAvS0Z1dkhsUVFJQVhPQnNvaFRZRDBtYmdRd2tEdFJjdk4z?=
 =?utf-8?B?dFBCL0I2MkZKc2Q0dU5HTWVHNDRqUjV1RFFteExMa2NzR1J1TFkxaThCc2V0?=
 =?utf-8?B?cHAwb2VuQ2pweWRiSEhjQmd0aDF2eXZEdGFFYmJ2bFgvVm13S1lNNm41R0Zp?=
 =?utf-8?B?WStzVHFycGZFMkFqb1hiZ0lGN2tlb2MzN2lYamw2clRGSUFCU1FtUHBrMGZy?=
 =?utf-8?B?MUhvbUVSVWRxV3dTaE5CQ25HVi9KWmh1eU9QMWlIT25raEQvM0l6a3NSWDB0?=
 =?utf-8?B?WDRhMlA2Mm8vbEtPTmFQdmZmRW9FUjhJRFpUeEJvWjdJdWN0ck11WXMrNmND?=
 =?utf-8?B?ZjcwaHI4M0RPcVcybDJuYUltQmlINGFGclVPZHNObDg3azhWOSs1UEJlajl3?=
 =?utf-8?B?MDJYWDNva1pWSVltbGRnbjFGZURMaGFUbml3a2FFczRIOGJIZU9rclBNeFZ6?=
 =?utf-8?B?dXhNT3JCT2dKT2Z3cEptNXhJdTd3Y1FkTHVCQXZGc3VtdTJ3Tm5JWERJWUNi?=
 =?utf-8?B?TFJmMEZ2Rkw4Wi9yZ1RzemZQdi9ZMU5vUjYxZUZpM2w0WHAySmR0NkFBSkU5?=
 =?utf-8?B?YjFtTXJwOWRsNzN3RGJRRWxKdmt4TkptZjRXN0FZbmpyQkxQWllSTE9zRkZQ?=
 =?utf-8?B?WUhwYU1wZTFMbVFTbmhvU3JrV09VbGhJMXRqV0NBS3AwclZmdHZLNEJic25K?=
 =?utf-8?B?L3JuLzZtclUyNEo5dDNVV011eGlEbzR0Q1NxSUpQR1NQUjh6OGs4bi9HQ1Vn?=
 =?utf-8?B?dS9mTlAwZGZ1LzBSdkY3S3Y5T0hFWWNJRk5KcUl2TEU5SXlyMFAxQTdtWEwv?=
 =?utf-8?B?aTE1MTc1RTU0bXdWZSsyQjlvWDB6d01SREkwNGx3anBKK2UvTUVIcHF3ZEp6?=
 =?utf-8?B?MzJGcGZ4R2MxV2o2akFqZ21pcmtKMksvUUZEWmFyTzVDSjlwRnJzamVaSVVp?=
 =?utf-8?B?elFOMkxhd2gxTk16S0gzcm9uMExDYnE1d1ZuNmduV2JWQ1dUOC9CSEpoN3VC?=
 =?utf-8?B?UEtqdzY1YW5QZzE5cWcvdTNPc3J5OHZQSXBnSTJPOTlNYW9DaDB2QkF5Ymlm?=
 =?utf-8?B?TmxXcTQzeWMreW5Bb2pjTUh2VWdFT0V6aHFJa2Q0Z0tXYlJiMjVzSk1Mcmk4?=
 =?utf-8?B?emU3dGFLK1lTdTByTGFVUzMvR3VieE1NVGNPRjhvS01NUmEwWTV0RUdoNjA3?=
 =?utf-8?B?YVBjY0lBaytubUVSNksxUlE2enFGTmg1Z3g2SWpwTkRwUDVVZ3Y5YlYrQjIz?=
 =?utf-8?B?c0M4ZTNWampiN1FHNTJXanV0TlJrSnRIdHl1eEFtaHYydXpJNEFXS0ZxSWRQ?=
 =?utf-8?B?Tk55WnhxcTdnSlRUR0RWWDhyMUZISXo2b1ZmZzV3UVM5Sjd2T2hKT3l5dytD?=
 =?utf-8?B?SW1QQnZQbVlIL2tDZ0pQWTBxRFFZaHpaaFgrd3JkZ0RCenBpQmtmbmRsTEVW?=
 =?utf-8?B?K3FhOEoyTE1ZSGVRLzVncGRFaFByS2lDSG1wc3ZJci82Q2g2OHRDQ1Ywbldl?=
 =?utf-8?B?OFlXOFZwQytTWkRCMzlXaFBhcUxwYzN5a0tjRTZNUVFmd1ZPNnNsdzFLNXpK?=
 =?utf-8?B?bHY3ZWQwQ0Z3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3oxYWIyQ1JDN2dOd0NhR3VXZENUUjJaTUZYTGxzbm81ckw4Z2VrME5yanZ4?=
 =?utf-8?B?ZEc5TU16akpYV3Q0RXlKc2VNUlZZeVFDcnQvZ1plR0pkRDY3SjVDRngyWkNl?=
 =?utf-8?B?REQ2N0g5ZC9VUGY1YWVyK1RXcGNkaThFYWVveDNFWk8vNGdYRmlGQ1NlUHlt?=
 =?utf-8?B?WTRPb05YREZqV0lHT0lVSDI5NmNkQ0kyMHBOQ1hmaXUzUVQzYlhTalNyUFFv?=
 =?utf-8?B?OGdPa0dMTHdzcVlCckYvQnZxVmFKdUJNZlR1MmdldjhoZ0JGQmJVY3h5Vk0r?=
 =?utf-8?B?VVhvMW5MQXhOZStDOHowc1B3QWVscXZzZUdJYlExWVRQVVZVUmpwNjlwMkpt?=
 =?utf-8?B?MWdoekJmTUlGajkvUEV5eEQ1OEZTWDdrWTkyQTdUd2t1czRmVHA0aFZqVDMw?=
 =?utf-8?B?RnFQZ3RSMmlYYzF6dWxyd0xuLzhuakZ4Y0wyV2dnS3BEYlJCMEdJVElzUStL?=
 =?utf-8?B?Mm1idVZlNjJtK3Q4a1ViK2ZxQkdDSnlwSDVsdFU2T052N2pRL1RLVFczYTRj?=
 =?utf-8?B?dUV6dGl5U2JvWVcyR1JkczU1RjNNejZ0SHhhM2pwRG5OM0thazY4dm03Y2lX?=
 =?utf-8?B?T1JuMUU3SU1ibGZUcENzSzkxL29Dbkp0eTRRUmkyYWUxWlQ1QjViNnpNWWFq?=
 =?utf-8?B?SFFoemRhVkJwYXNOZmQyOVk0aWRKejJ4Z0cxMGNONVRXNmQ2U2o5dHRzM1lD?=
 =?utf-8?B?MzRjQzZSallWeWx4YVZwUG1ReExaZlJJdzBKUU1tQ3A4eVl5eGNBWDQvM3Bv?=
 =?utf-8?B?dDl4NDhEdTE1UnFHNkVmYnFsNkIzK09wa0w0ZEo5MW9sYkJuTFc5YjYyeUZH?=
 =?utf-8?B?RWlpT0hPS3gxZ2Ftc01GU0Rsb2xaaWE5VUw0SlJCVXVHY1hucS9KSktqWGxT?=
 =?utf-8?B?ZU1lYjFaTkU2WjVkZnpMNHVCeW0wclhkemVKK0tTNlR1WkhQWVY2ZzZSbzk2?=
 =?utf-8?B?NVBoU0NOR3N0bE45M0Fhc0hVN3VVa3o4d3JJVnVtRzM0NFM3bjJUeEI1UW9C?=
 =?utf-8?B?Y3lQZWw3ZDFzOGlaMFVyNXNjbExXSTArekpXRW54T0NkdlpLTWdHelp4VFY4?=
 =?utf-8?B?azExRkg3OEQyR3NpWFNzejFOMzBsVzZXTVVQU2dQQ01XcGNSSXYwS04xR1VV?=
 =?utf-8?B?a1EzZ29JWWJ4M1ZLVENmQXZ3QktBdms1RlJMSG1PL0NZR00xaFN5aFZjendI?=
 =?utf-8?B?RjlFUFh4U1ZPN2NsdnNjWEk1NWIxb0FmTDV2Zkt4dVZqNjdtVG5ZQWFSYzNz?=
 =?utf-8?B?YVJLUUZ5VmMyV0tZVEF0NnJKbWdHYW9MZkFrR20vY3dwcHNLV25DZEJSTU5s?=
 =?utf-8?B?eVVFUjZCU3E1N3ZBZzZ2TUk4dkI5WGRZVnNRa3ZQVVh3S044dTlINE1JNDN4?=
 =?utf-8?B?dHFqendpSjBEenE0OWY2OS9MYks5UTRmTzFnTzVodlhSaGV4Ylo3bi9nUHQr?=
 =?utf-8?B?cFpuZlYzeUJBOERXd1J2d2VESXJlVmkxSUQ0UE5Ld0RaZ0FKQUFubVZqUVZ6?=
 =?utf-8?B?VmxRTHhYT1hOeW01MGd1UU9jRlJSbVdIUVdzaTNWeklVS3Bwc1FINndQK0hU?=
 =?utf-8?B?WE5RWER4V2Y5Mk5XQTNyRk0wY3hSdC9XY2czQVJ1MU1EeW83WHNlN3ZiL3BE?=
 =?utf-8?B?MXJ5WExjdU5QZzdYRWtyK0RUUzAxZ2tLRWJEMjNzb1E0Q0dqTmY4YXZaTDNm?=
 =?utf-8?B?U2orN0lXNzJCd1JJRVhCckxFYjVtVzhZc2ZMSnZna1dvNU9EbGRtaU5ZbWVi?=
 =?utf-8?B?bitkcmx0cmlRRXNnUCtFem9rcTdUSEs0WHphY0JoSTdUeHJPMzI3N3lBbXdl?=
 =?utf-8?B?aHpQQVRoMlh4b01FbWYzOS9JdkhvK1hBTWhzY1VhSGZnSlR4MjA4OGtVMThI?=
 =?utf-8?B?ZFZyNFphZi95N0QweitvTGlpNER1K1JKNyt1Q1M3MEVrbEM4eXJhSnB2bG9N?=
 =?utf-8?B?UXpqMWdCWS9Uc0JVM2V0RG4zN2hrMlFwVEtDd2E0NC8vRi80NjhNQzNpekRv?=
 =?utf-8?B?RS9xdFlLY0ZEUjBQNThJYlUwSlhUWkN2OW1JYzdFd3daZjM3RWNtd29RclY3?=
 =?utf-8?B?YzNlZkd4QXN6NkpxTEQ5eWdFb2dnR0l0MWp2Mnc0T1ZDbmtSQjdMMkN3WFRy?=
 =?utf-8?Q?gcm8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b0ead8-b868-4c6e-404e-08ddb0459b99
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 21:58:36.8318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvMKF0GuAUi9DTIT36dtCp0ZgtY0aFsk1GNayK9ZZbAE8+vFUMQEW6/1I7qKo0UP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104

Hi Reinette,


On 6/17/2025 11:03 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 6/11/25 2:23 PM, Babu Moger wrote:
>> "io_alloc" feature is a mechanism that enables direct insertion of data
> 
> ""io_alloc" feature is a mechanism that enables" -> ""io_alloc" feature enables"

Sure.

> 
>> from I/O devices into the L3 cache. By directly caching data from I/O
> 
> Drop L3
> 

Sure.

>> devices rather than first storing the I/O data in DRAM, it reduces the
>> demands on DRAM bandwidth and reduces latency to the processor consuming
>> the I/O data.
>>
>> "io_alloc" feature uses the highest CLOSID to route the traffic from I/O
> 
> How is the CLOSID related here?

Will remove it.

> 
>> devices. Provide the interface to modify io_alloc CBMs (Capacity Bit Mask)
>> when feature is enabled.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>   Documentation/filesystems/resctrl.rst | 13 ++++
>>   fs/resctrl/ctrlmondata.c              |  4 +-
>>   fs/resctrl/internal.h                 |  2 +
>>   fs/resctrl/rdtgroup.c                 | 89 ++++++++++++++++++++++++++-
>>   4 files changed, 105 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index b31748ec8c61..ae1157dcb4a3 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -181,6 +181,19 @@ related to allocation:
>>   			# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
>>   			0=ffff;1=ffff
>>   
>> +		CBM can be configured by writing to the interface.
>> +
>> +		Example::
>> +
>> +			# echo 1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm
>> +			# cat /sys/fs/resctrl/info/L3/io_alloc_cbm
>> +			0=ffff;1=00ff
>> +
>> +		When CDP is enabled, io_alloc directs traffic using the highest CLOSID
>> +		linked to an L3CODE resource. Although CBMs can be accessed through
>> +		either L3CODE or L3DATA resources, any updates to the schemata are
>> +		always routed through L3CODE.
> 
> Please do not commit resctrl to this implementation by documenting it as part of
> user interface. Could snippet about CDP I shared in patch 6 be placed here as
> a replacement? Not the usage of *may* to keep implementation options open.
> 

Sure. Yea. Already added in show().

>> +
>>   
>>   Memory bandwidth(MB) subdirectory contains the following files
>>   with respect to allocation:
>> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
>> index 6409637b4de6..f3e5e697945c 100644
>> --- a/fs/resctrl/ctrlmondata.c
>> +++ b/fs/resctrl/ctrlmondata.c
>> @@ -148,8 +148,8 @@ static bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r)
>>    * Read one cache bit mask (hex). Check that it is valid for the current
>>    * resource type.
>>    */
>> -static int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
>> -		     struct rdt_ctrl_domain *d)
>> +int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
>> +	      struct rdt_ctrl_domain *d)
>>   {
>>   	enum rdtgrp_mode mode = data->mode;
>>   	struct resctrl_staged_config *cfg;
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 10a3188ffa54..755f23934295 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -382,6 +382,8 @@ bool closid_allocated(unsigned int closid);
>>   int resctrl_find_cleanest_closid(void);
>>   void show_doms(struct seq_file *s, struct resctrl_schema *schema,
>>   	       char *name, int closid);
>> +int parse_cbm(struct rdt_parse_data *data, struct resctrl_schema *s,
>> +	      struct rdt_ctrl_domain *d);
>>   
>>   #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>>   int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 0c2d2cf4baa1..f6c44fae4b72 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -2037,6 +2037,92 @@ static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
>>   	return ret;
>>   }
>>   
>> +static int resctrl_io_alloc_parse_line(char *line,  struct rdt_resource *r,
>> +				       struct resctrl_schema *s, u32 closid)
>> +{
>> +	struct rdt_parse_data data;
>> +	struct rdt_ctrl_domain *d;
>> +	char *dom = NULL, *id;
>> +	unsigned long dom_id;
>> +
>> +next:
>> +	if (!line || line[0] == '\0')
>> +		return 0;
>> +
>> +	dom = strsep(&line, ";");
>> +	id = strsep(&dom, "=");
>> +	if (!dom || kstrtoul(id, 10, &dom_id)) {
>> +		rdt_last_cmd_puts("Missing '=' or non-numeric domain\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	dom = strim(dom);
>> +	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
>> +		if (d->hdr.id == dom_id) {
>> +			data.buf = dom;
>> +			data.mode = RDT_MODE_SHAREABLE;
>> +			data.closid = closid;
>> +			if (parse_cbm(&data, s, d))
>> +				return -EINVAL;
>> +			goto next;
>> +		}
>> +	}
>> +	return -EINVAL;
>> +}
>> +
>> +static ssize_t resctrl_io_alloc_cbm_write(struct kernfs_open_file *of,
>> +					  char *buf, size_t nbytes, loff_t off)
>> +{
>> +	struct resctrl_schema *s = rdt_kn_parent_priv(of->kn);
>> +	struct rdt_resource *r = s->res;
>> +	u32 io_alloc_closid;
>> +	int ret = 0;
>> +
>> +	/* Valid input requires a trailing newline */
>> +	if (nbytes == 0 || buf[nbytes - 1] != '\n')
>> +		return -EINVAL;
>> +
>> +	buf[nbytes - 1] = '\0';
>> +
>> +	if (!r->cache.io_alloc_capable) {
>> +		rdt_last_cmd_puts("io_alloc feature is not supported on the resource\n");
> 
> rdt_last_cmd_puts() requires rdtgroup_mutex to be held.

Sure.

> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	rdt_last_cmd_clear();
>> +	rdt_staged_configs_clear();
>> +
>> +	if (!resctrl_arch_get_io_alloc_enabled(r)) {
>> +		rdt_last_cmd_puts("io_alloc feature is not enabled\n");
>> +		ret = -EINVAL;
>> +		goto cbm_write_out;
> 
> can just be "out"

Sure.

> 
>> +	}
>> +
>> +	io_alloc_closid = resctrl_io_alloc_closid_get(r);
>> +	if (io_alloc_closid < 0) {
> 
> Similar to other places, since this is preceded by resctrl_arch_get_io_alloc_enabled(r)
> passing the io_alloc_closid has to be valid and can use proposed resctrl_io_alloc_closid()
> helper to simplify the code.

Yes. Check not required.

> 
>> +		rdt_last_cmd_puts("Max CLOSID to support io_alloc is not available\n");
>> +		ret = -EINVAL;
>> +		goto cbm_write_out;
>> +	}
>> +
>> +	ret = resctrl_io_alloc_parse_line(buf, r, resctrl_schema_io_alloc(s),
>> +					  io_alloc_closid);
> 
> Here too I think both schemata needs to be updated.

Yes. Added it.


> 
>> +	if (ret)
>> +		goto cbm_write_out;
>> +
>> +	ret = resctrl_arch_update_domains(r, io_alloc_closid);
>> +
>> +cbm_write_out:
>> +	rdt_staged_configs_clear();
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +
>> +	return ret ?: nbytes;
>> +}
>> +
>>   /* rdtgroup information files for one cache resource. */
>>   static struct rftype res_common_files[] = {
>>   	{
>> @@ -2198,9 +2284,10 @@ static struct rftype res_common_files[] = {
>>   	},
>>   	{
>>   		.name		= "io_alloc_cbm",
>> -		.mode		= 0444,
>> +		.mode		= 0644,
>>   		.kf_ops		= &rdtgroup_kf_single_ops,
>>   		.seq_show	= resctrl_io_alloc_cbm_show,
>> +		.write		= resctrl_io_alloc_cbm_write,
>>   	},
>>   	{
>>   		.name		= "mba_MBps_event",
> 
> Reinette
> 

Thanks
Babu
