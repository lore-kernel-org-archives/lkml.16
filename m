Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010002.outbound.protection.outlook.com [52.101.69.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32273214
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.2
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750303424; cv=fail; b=nQhXvhXwqxIYwrLSQktFAl+AoXIdiAN7d2NpI6KqWdeI9SeyEb3D9Zcrh43fClw0TalpVN9hKahYMh76dmj59GP1eGwX4nPshA426/OOLu56s+mdru12v9IwFxd9qCtudDTlrt6U5hYnuf2L+RhIowTrkp9XJAEiCGjJSvjn/Jo=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750303424; c=relaxed/simple;
	bh=RHnlqWbIpNKPtA/AQupSwQMQEXRnK4652UtyAu5c09c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KF3+c6pa31LcXNaR5VtolpmIsUVAI5oxpiM4rmtIrw212JXpW94FoA3BLGr13VQ2o1/Gjpz11446Z+jK+JOIcf6xw8YyNuCScV0VLiH5uGey1yLqpWOUERthuLxhlRW/J2w9uHXUUPObt8XhmYrLqM4iM1yBBsHjHMYkPqqeaNs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YtKmFuQ3; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YtKmFuQ3; arc=fail smtp.client-ip=52.101.69.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YtKmFuQ3";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YtKmFuQ3"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fNGh3uXoppdqUvFLABVxSjiV8vhOk95WzQMrmatLpnFBmcmsvJYOwzvdJzmFBBMCy1BWkVSUUZbullKdZIfVcfxXDKTUwka/zrpyA8ZWthpunMlJXRYV3aNz47KbgejiGWegc4x7Lgcp+aUto/dqVF+IOChS6ijb7I/oph8Z/hAeLyDWpcvBfoUJsXsB21d/r4pYRnqrAPC69doCnSDk9jFQqFVElLa7fFAhcQ1DVMB3d6CJypukBx+4B7t+66FEPr9s3Czn7FmY3Dp5d8Q+Vg92yazCgBa4pYBdMZleEUU5vZ1pavrksmCZwyPMTAWub2B2P8DpZKomDBhMmP41xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJ1d8EEMjQonJxKW2m8dacAIxTLq1xnEoqO/NMy3TXU=;
 b=rZJrXQOZXCnVsleQFpQrSj2M6I0nsZk93nhgLDgpl33eTbaTIkgcyQyGyCxoP/zFn8QrjovBWYStpGh+CU6pMEf75L9x7ng7KMztmiv3pxbm7wv9H2Bghm8XmerfQkinodYiQDmFv02Acg3R+mVxexSMZi0Mzbp0uz0ysFe9wpGA4xUMMiXmhi4FrmEbxrBXJO4LpDHP9iHLRC9xv9KX+Yq0h/4oLCkcRjMKLbYu6Pn2V/X7vzXwBLq8+VeIhzpVom9BarNMj+OXmz1EOF0pAdtnEJwPNsj/+WLh9TRoM1MIOWpcpwI8MymovfsChhcK2Dh18u44cF7jtFltk1+1JQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ1d8EEMjQonJxKW2m8dacAIxTLq1xnEoqO/NMy3TXU=;
 b=YtKmFuQ3CPj0HHLM7VKG8xi0JtAUVWJEL2HyYBQm+qdG4X4x4X9S4tC05wki39V+8QTkZOSadmHd33DK5UBrpdME33MolxBXZ9p2JbB7Jp8EBXgDeuTMW7PCaGeD9E7MboyrFsx8pyNO0grOYNO0lpDZCom5+GTnm6aaJrjPHJc=
Received: from DB8PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:10:110::39)
 by DU0PR08MB9106.eurprd08.prod.outlook.com (2603:10a6:10:470::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 03:23:37 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::5d) by DB8PR04CA0029.outlook.office365.com
 (2603:10a6:10:110::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Thu,
 19 Jun 2025 03:23:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Thu, 19 Jun 2025 03:23:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFpaxM0FkwA9P/GKC2txV5WlN3MJOW5RrhPOfdVZyEvNX7IQLzruys5WRWyh2TFdJ9cCH6WbQrMEdAyKCJKzS8sWvCw3y+L5SSIn5aiiH1OsbeJJC6csV36o+enjf6GM3EjO+8rTHNbQTSguCWhXfMNyOF6G1JxaoYcgBbz3sxJ8K8a5J1GwJIOOEVC1bfxEz3YU8QGBXBbelnPsNBKSLIPFG3wl+gRdkOk1loQlZtR0BP8oQ1M6U/gNQGTto8evqbgXltjIDEB3ENa1gNW/ri/o7rsvDha0bT7UgLafuaCyoHuuTpaUwiYzCtpqPMjDZwU71ZuWZyl3R7/vDlkrxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJ1d8EEMjQonJxKW2m8dacAIxTLq1xnEoqO/NMy3TXU=;
 b=KI3pLxRae2pk05auhe2SvZUXZNhiNEel2vTIfDcH+9m1V5Qy7lBRNPXfmYK0emfh6tKijH0gJt0sqMlZepNKRduhzy+x042r+XbkS+Lg/1RLB4vvXag6M3R+NDHzgRww3NQPKHqlVC2xY1mDo6QRVI2CDKzo7afvhKicFJWdSBTEoTEVqyldIDUtopA02cb+RW7bJ2mFTUPGgw6n1wrQBDb30Acrf61dHUJ0jR9TiipsGez11DEUsai5lXPXS0ESHOCnd7oRvx3v8Vg0xFIl0vtanGjU4GpFqEOs2FdNBtq3+zvFraaigPSZrXUXqNgBjKSwuYLypFYJr4p9GD85RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJ1d8EEMjQonJxKW2m8dacAIxTLq1xnEoqO/NMy3TXU=;
 b=YtKmFuQ3CPj0HHLM7VKG8xi0JtAUVWJEL2HyYBQm+qdG4X4x4X9S4tC05wki39V+8QTkZOSadmHd33DK5UBrpdME33MolxBXZ9p2JbB7Jp8EBXgDeuTMW7PCaGeD9E7MboyrFsx8pyNO0grOYNO0lpDZCom5+GTnm6aaJrjPHJc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU0PR08MB8835.eurprd08.prod.outlook.com (2603:10a6:10:47c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 03:23:03 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 03:23:03 +0000
Message-ID: <e3a0a179-9246-4055-992e-3b9046e89748@arm.com>
Date: Thu, 19 Jun 2025 08:52:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Optimize
 __collapse_huge_page_copy_succeeded() for large folios by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250618102607.10551-1-dev.jain@arm.com>
 <f4de7754-e60a-4a87-9319-24b78a0c6895@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <f4de7754-e60a-4a87-9319-24b78a0c6895@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY2PR01CA0001.ausprd01.prod.outlook.com
 (2603:10c6:1:14::13) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU0PR08MB8835:EE_|DU2PEPF00028D11:EE_|DU0PR08MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: 0673928d-0818-4734-4858-08ddaee0addc
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SVVZdk9UNlptYXBPVGpsRHhxQ2dzQ3pyelFFOG54ZG5Bb3FRMExTSU1mK3J2?=
 =?utf-8?B?YVg2ajZ1VzlRb2ZlbGpHOVFTcEZEQU5KZFJNSkd5RXBWYmdra2lEaWp3b2xE?=
 =?utf-8?B?QXJyVnNiZjlidW0yYzVpakZlMnlzNU5TVlczM1BqdlBSNERiUy9vTUVHT0ZQ?=
 =?utf-8?B?ZWg3OVozNDlJOCttaXNJS2dCemJxZ0JSanNNTERXVFQ1SGxxYmhiazJqZHlz?=
 =?utf-8?B?elJKc29nVTdNejAvRk1rMWsxSVI3RThCT010NUVzdW92MThyU1AvMkJhRVZn?=
 =?utf-8?B?NUNLNHJCOHp1SnJPdEZEQUJqZmlaOEFCMnM3azhrUzdYK2xpZFUwT0djbmdC?=
 =?utf-8?B?MTVpblkrN1dtVndla1hoOVJoUWlrV1dNdkNWTFJPMHNqRk44b3RNdGFmeU9l?=
 =?utf-8?B?YjdFNFVhaVQwMXFVLzNsUElpblhhNzl2eVdxVndweXF4eVZWV2RKQnJlOE1z?=
 =?utf-8?B?SzZ6WVJ0MmRxeEttdVpGc3BvL2xIME9TQ2pTdWpkcWVGUGhISUJLNFJoUUpO?=
 =?utf-8?B?ZE9lM3Btb0YrV1RhbHdsRTZGVkcvSDlTS0FzVmVKOGV5TjM4RkFmb1JuQnZE?=
 =?utf-8?B?VHRuZXFzaExQelJFMzhxZWhLZmtzOWpYY3pzREhhY09XTE9BZHpMcjJZa2Vq?=
 =?utf-8?B?cHdTRDZ4RlA5T2poNTBPSTNKSFdIZDE2ZTNySjdFcmRvWGQ2OTkweUdyWUJS?=
 =?utf-8?B?OVJFUmdYbEZOV25zc1oxbkhaWjYvMWxKYmZ1NzF0R0ZRZXMyRXB4K2NrYS8y?=
 =?utf-8?B?elRBVTdDMG81VklvUnJDVGlEY1p4ZktpMndzWE9ZQjVzMUZGaXcraXA2TjlX?=
 =?utf-8?B?R0JJQXc3SjQ0QTRQdGphNmtEL05GalA1Um1lbmxDVTRPcXBxbmd0SWw3d3Vn?=
 =?utf-8?B?T1lpZlpuTlJvRnMybURoVHdaaDBOQjdXS3dsUnVkaUVDZTZmamRaNlhNVzlH?=
 =?utf-8?B?ejZkV1RkMmRnMU1KUEpQdHBrREdyT0dGdTNWekUrRjdkdi9IT3BYWGtVL1BV?=
 =?utf-8?B?Y01vRWFuS1NLM1Y5a2JUNFBHRUVJWnNkM2xnWkVlNC9weWZTTTZyUXQvRkQy?=
 =?utf-8?B?UitZRUd3cllzWWhqdE9Kb2xMMUZxVkl4c2labnpYVGJVeTMyTEtVeitvZTZk?=
 =?utf-8?B?VHRIUEp0aXJoWm50WGk1dXluTzF6UU1hdlIwb3B1MEljejFIM3VmZFJNZUlL?=
 =?utf-8?B?a21Rb2VqbnlkS1NaNGZycTZpSWh2TjQzaHJLaFh4QWV2NU5ab2hDYk91YU1J?=
 =?utf-8?B?WCtLTUtuMHVCaUl6Q0l0RHBhSVBXRlp2aXkyQUJwMjhFcE5yanY4OUdCQ0s1?=
 =?utf-8?B?TmxiZGF2UEx5QzFiRklhQnhzK3dveWp3K05Wckc5cWJLSS9pcXJuQ0JuWlVT?=
 =?utf-8?B?L0F4UVNSQndnK05GcFdYUkFBdFFqZkQ3ZU5OT0JjZEVlSlZxT2RxeTRpZDFl?=
 =?utf-8?B?Q1NLeFZSM0pJby9uMVVnZEJrR2RmbnVjQ2VyNjV1bnFiNFc1ek96RWlwbmFm?=
 =?utf-8?B?TkpxRTZ0SjBkaXpWNGQ4T3ZxSWFvTWpDSW1CbUQwMmhreC9OQWVDbFdGTFlF?=
 =?utf-8?B?MGtqZTByNkxwQVU0REdWUGpDcXp2TnRmVWRmUnl3ejVOVndNdWpibjBzV1Vn?=
 =?utf-8?B?OXJkSFpxUXVhdUZPR3c2ZzJQR3I1d1dPaW5ENjI3RTlsOFg5T3pnTlFPY0RU?=
 =?utf-8?B?UzJtVG1XUTBLZitxZW1hNnB4SEZUVEFoUkFMaUZXanpwTVNzY04zRXVpZ3N6?=
 =?utf-8?B?TE1OeXpsZHMvbkRNeGdXZDJ6QjVremE4MGU3Ylk3eGwzNnNuRkF0UGEzeHgr?=
 =?utf-8?B?RUdhRHg4Y1REaklxdkloelJJS2FKazVhRFBuT05EakxFK2pjOXJHNFVKaGgz?=
 =?utf-8?B?MVZGejFXb0dJcTlicnpKVHNYN3o0U28zRGUrMFZ1a0Z2OXhqRjVQc05iZE9G?=
 =?utf-8?Q?+d1SH/hHhRI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8835
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3af8a6a-a974-4b69-d82a-08ddaee0999d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|7416014|14060799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmVFTGRSdk5jNlV3MEpSbU9oc0M3TmllTk0zM2NOR05saHprSnB6UG9WSW5t?=
 =?utf-8?B?a1JidWlnYmd6UithcTd2ak9BSHpnSHFDcno5VURvblFmTVAza3RSbTBadjVE?=
 =?utf-8?B?QklJV3F6Mk1PSk9BRk5JOXpFOXUvc3NYdmR4VEVVdUFvQVRHRkN1Q0lvMXE1?=
 =?utf-8?B?SHFUdk1FaWNFNjNweVp5OVluQ0Z2RS9CTnNXQUxzVFAwSVZ2WTFkdWR5TzlO?=
 =?utf-8?B?N2Z1UTNGa2orbytQWHk2NVpNb1I0TXk3SGM3RlNZZi9SS3NEMWRaOFNjY3BT?=
 =?utf-8?B?Zk1XRjZQN05OMGsvb0Y4cnp3Q0R0bS9qM3J2YldWaDdoa3dldFZMbGZiV0xG?=
 =?utf-8?B?Z3FJNm8vbmFkaVlucTFWYVVOTTJuNStONThOTTZKQThEMVU5dVZnKzdRTkFt?=
 =?utf-8?B?bGFHNy95a1FxZ0cyTHRDb1RNR3gxdUY2UkJPWnF4YmtQN1g4SGFTeGp1anVE?=
 =?utf-8?B?N2VQYkF1YldleTdKVDdXZkxJN09wbGF4cGtiN0xoV1lNRFp0R0ZyV1RpclVQ?=
 =?utf-8?B?akhOMHhjd3lOUXQ4bjZjVjh1WlBaOVl0Vy8wNDA5Uzd3SlZDQVVmcUttY3dt?=
 =?utf-8?B?YVZ2TE5zL0VXYzVCUXA3YndGN2UxVkUzZTdVRXVWRnVNM2Z4L3ROVnEvUzl6?=
 =?utf-8?B?STJhTUFSbUFaRExVSnZkZ0tYU3NuZlA4UmFZQlBhK0IyNUdYQ1c2TVpyZlhm?=
 =?utf-8?B?U2lTRUlHL1Q5dzljMEk4YWlnNmZlQmNVN2JJdXlVZDRaZXV5YUEyTEhtaE1I?=
 =?utf-8?B?TzlCb05zQ2JMclhIYXJONHFQZm8xVGtHNE1PalBjY1VvUWtjWnJlR1NjNlRq?=
 =?utf-8?B?TWRtSXZ1SWpSMGxJajBYb0h6dnVvbjl4d3VBSVZXQnZuMmQzcEtsMHE4ZU5T?=
 =?utf-8?B?K0dFV0tUdFVGaThMd2dsTFE2UjRtd2tGYy92L2NvUyt1enM5WjVXbnJoR1o2?=
 =?utf-8?B?L1pIb1U4TUkvM1hDcitoNmJoSDk1SkJkcUsxcEZER0VwbmxaMFFkUzByRjRB?=
 =?utf-8?B?ZWEwZk9mbkpELzhpT0hucnNnMk9DcGRTYXFjSGVsb1JscTNBOXNzQmZETEIw?=
 =?utf-8?B?SDhDSHZMcFRnT2JleXA2eDFhdmE3RGRNUEVFTU51VG55eWVlUVQ0QWFvbkQr?=
 =?utf-8?B?L0ZOS2RJZ3dGT3FNaVBiYUlKNldLT2ZEaERTOUFhYkZ2aHZ0NDlBcEJGRzF2?=
 =?utf-8?B?VTRyaTA0VW9zcWlWcGtua0tUYlpRUHRIN0tsM3FVWFV3VlNUdUJCclpTM3ln?=
 =?utf-8?B?SXJRMEtyU0NuMjA1UGJuOG5MdnFOODJUUUwwVTJ4UWhzeWlxZTRBRkVzZGtK?=
 =?utf-8?B?Z1NVOVJwVm5qdWhPSHJrUEs4dTBDUXhDTEhDYUpFSjlGTlQyVWRES2w2NUdE?=
 =?utf-8?B?dkpxNVJiUmZLSlZmMzJtUjRBYnlkeXh2ZlVZNC9XdzZRSWF5ZENuYlFYdEFw?=
 =?utf-8?B?TG9OQ2NESnhJQVhJYU5mcXBWK1M3TnV2c0tZTUhtOGtpcmk2SW5FeEpDT29P?=
 =?utf-8?B?dUJmdkpoWGg5QzBwMFJSaExOQmdBR0hvK05FN21iZ2VJaENwNGtiQ3drSWV2?=
 =?utf-8?B?dFJWREFMMTVvQloyMEVEdGRoZmkwRkpyMmNlUTNZTU8xWkduVE93czEralUv?=
 =?utf-8?B?QVdHaXlpdGx1V3JrNHJyVXBDTEVqSE80U2RoWnBmdzR0QWY0MnB4ek9nRmNQ?=
 =?utf-8?B?N0huTlpqYzl3OVBiVk9ieFQwMGdwaTRYc3lEa0ErT3pHcjBkKzVSaW5PM2pn?=
 =?utf-8?B?bVl3N3VVRS93YlpjRzRndG9HNVBQWndwT2wrVGNSMGppTTV6SjdUS1U0Z1JB?=
 =?utf-8?B?SjhhZWVXSUFxRTlPQlNZYkc2elZLdHNHOEQvS2syMzVUUVRYR2poYThrNk9p?=
 =?utf-8?B?OWhIT3ZwbFk4cGk5bUVuV2F2NitLaDFDMWFCRzJqN1JDTDA4aU1vLzl4aWV1?=
 =?utf-8?B?QU1HSUJtZFE2ZU5LUUtzT0pyclJvNlhFZCtHaDF5aXlST25WaW5CMHZNanhN?=
 =?utf-8?B?VHpRT3hLWUJDd29LRXBGb3EwdUd1cjVSS0lpUFdsQnR3YS9OTGF6bnkyWFFT?=
 =?utf-8?Q?U2pJNu?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(7416014)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 03:23:36.8195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0673928d-0818-4734-4858-08ddaee0addc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9106


On 18/06/25 10:56 pm, Lorenzo Stoakes wrote:
> On Wed, Jun 18, 2025 at 03:56:07PM +0530, Dev Jain wrote:
>> Use PTE batching to optimize __collapse_huge_page_copy_succeeded().
>>
>> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
>> Then, calling ptep_clear() for every pte will cause a TLB flush for every
>> contpte block. Instead, clear_full_ptes() does a
>> contpte_try_unfold_partial() which will flush the TLB only for the (if any)
>> starting and ending contpte block, if they partially overlap with the range
>> khugepaged is looking at.
>>
>> For all arches, there should be a benefit due to batching atomic operations
>> on mapcounts due to folio_remove_rmap_ptes().
>>
>> No issues were observed with mm-selftests.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/khugepaged.c | 31 +++++++++++++++++++++++--------
>>   1 file changed, 23 insertions(+), 8 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index d45d08b521f6..649ccb2670f8 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -700,12 +700,14 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>>   						spinlock_t *ptl,
>>   						struct list_head *compound_pagelist)
>>   {
>> +	unsigned long end = address + HPAGE_PMD_SIZE;
> I assume we always enter here with aligned address...

Yes.

>
>>   	struct folio *src, *tmp;
>> -	pte_t *_pte;
>> +	pte_t *_pte = pte;
>>   	pte_t pteval;
>> +	int nr_ptes;
>>
>> -	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
>> -	     _pte++, address += PAGE_SIZE) {
>> +	do {
>> +		nr_ptes = 1;
>>   		pteval = ptep_get(_pte);
>>   		if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
>>   			add_mm_counter(vma->vm_mm, MM_ANONPAGES, 1);
>> @@ -719,23 +721,36 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>>   				ksm_might_unmap_zero_page(vma->vm_mm, pteval);
>>   			}
>>   		} else {
> Existing code but hate this level of indentation.
>
> The code before was (barely) sort of ok-ish, but now it's realyl out of hand.
>
> On the other hand, I look at __collapse_huge_page_isolate() and want to cry so I
> guess this maybe is something that needs addressing outside of this patch.

Trust me I have already cried a lot before while doing the khugepaged mTHP stuff :)

>
>
>> +			const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +			int max_nr_ptes;
>> +			bool is_large;
>> +
>>   			struct page *src_page = pte_page(pteval);
>>
>>   			src = page_folio(src_page);
>> -			if (!folio_test_large(src))
>> +			is_large = folio_test_large(src);
>> +			if (!is_large)
>>   				release_pte_folio(src);
> Hm, in this case right, release_pte_folio() does a folio_unlock().
>
> Where does a large folio get unlocked?
>
> I mean this must have been existing code because I don't see where this
> happens previously either.
>
>> +
>> +			max_nr_ptes = (end - address) >> PAGE_SHIFT;
>> +			if (is_large && max_nr_ptes != 1)
> Is it really that harmful if max_nr_ptes == 1? Doesn't folio_pte_batch()
> figure it out?

Yup it will figure that out, was just following the pattern of zap_present_ptes
and copy_present_ptes. Will drop this.

>
>> +				nr_ptes = folio_pte_batch(src, address, _pte,
>> +							  pteval, max_nr_ptes,
>> +							  flags, NULL, NULL, NULL);
>> +
> It'd be nice(r) if this was:
>
> if (folio_test_large(src))
> 	nr_ptes = folio_pte_batch(src, address, _pte,
> 		pteval, max_nr_ptes,
> 		flags, NULL, NULL, NULL);
> else
> 	release_pte_folio(src);
>
> But even that is horrid because of the asymmetry.
>
>>   			/*
>>   			 * ptl mostly unnecessary, but preempt has to
>>   			 * be disabled to update the per-cpu stats
>>   			 * inside folio_remove_rmap_pte().
>>   			 */
>>   			spin_lock(ptl);
>> -			ptep_clear(vma->vm_mm, address, _pte);
>> -			folio_remove_rmap_pte(src, src_page, vma);
>> +			clear_full_ptes(vma->vm_mm, address, _pte, nr_ptes, false);
> Be nice to use 'Liam's convention' of sticking `/* full = */ false)` on the
> end here so we know what the false refers to.

Sounds good, although in the other mail David mentioned a way to elide this
so I will prefer that.

>
>> +			folio_remove_rmap_ptes(src, src_page, nr_ptes, vma);
> Kinda neat that folio_remove_map_pte() is jus ta define onto this with
> nr_ptes == 1 :)
>
>>   			spin_unlock(ptl);
>> -			free_folio_and_swap_cache(src);
>> +			free_swap_cache(src);
>> +			folio_put_refs(src, nr_ptes);
>>   		}
>> -	}
>> +	} while (_pte += nr_ptes, address += nr_ptes * PAGE_SIZE, address != end);
>>
>>   	list_for_each_entry_safe(src, tmp, compound_pagelist, lru) {
>>   		list_del(&src->lru);
>> --
>> 2.30.2
>>
> I can't see much wrong with this though, just 'yuck' at existing code
> really :)
