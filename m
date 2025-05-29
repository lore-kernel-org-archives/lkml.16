Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2065.outbound.protection.outlook.com [40.107.95.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E8C1B7F4;
	Thu, 29 May 2025 19:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748545276; cv=fail; b=gS3rv0pnQ90dA0gXhqLeZ0P/FNz6aM7le/h8ELzuOAkCf0pGyUco7NpCNNGYXClMvd8Rnlgpc4Ew9CPOFP7vZmFGm1d+Jw22W7sZGSfxrYINmML3BHoo5opbAlsLNh/cPLc80DzM6VmRyP/dw0lCstedu7KkkQVyEHRgZgQPeA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748545276; c=relaxed/simple;
	bh=RHfv3qd0l31/PtsB1an4wamAqmFjQua0j6u9ii35EX0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L2tvOzQHT6YHPBtMQuJp8qqUjcY7aXivl0RBAipe0F1vUKHtBhXxZ7t3GjSoegUwzUzeosj0B40S+uEdxsiIxMb2frLFJP500fRVHsVRdl6BaICicv3YzRD2QHoIyFtbCxfrfCJ5jkL/NZ1HYNiFb6Ui8L7R7V71L5OMG+DZ/aI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Az+pB1/g; arc=fail smtp.client-ip=40.107.95.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Az+pB1/g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLT48P/TsZ1un6TbC5mUihdKuOT3pmwyF9MPE+uTpPPc4TT1y8zs9YtJ+SNiTsi8+AXLjh9EBiXTvbys9QHAz1DTU+rr+/DfNuNMuAmZlKasLH00v28WNNUm1BN9YAazlXow6u+GgVVz5yccSFkiV6cD980akmaR9tHWWBPn6TXP12cbiac4jHKWafFOLO+jbOPfnBhVI1IQa50WfHHOMigR9kIp/K6jTSJUfYjm/KwIS6fI3cYV/iRhb2enV/mHD98TzNxigA6OQ0+mWfS8AQlGxxd3K1tlrxlroFl8oKMLJ22CBAAqIUsWrgwEoFw2fGeXFupRtow4aVBo5WSDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tChMVQrI35AAcW+AQ1gSvpWNjB3olnIlPb9OAAj7gtQ=;
 b=Ao8aYNyoarikDngsTc8JC4Wj8zcO5ffgMOPn/0uazdlP6ooUOwTHrhZKdilJInu2XB3Tq5Z9abEZI19e+uW0l6OOoGBbeyl2Ej9juiSE/f4NjYWwu94X3nA+FJ6y7cMBCzuvktopd+rlvvJe4zb4gsHCAZzbj79i+DqRPrUcCtsPbr7BwNTv4AtDBLJBWkxaLu6LdWAoq4ZI3PpTTFHGBsMSGh9jCDPMuZRczIJPh3G0HQy4rx7vffeMsY/xZEoT8eIWyFRxHq6Vf1lTIUMBRfNO1CdoPuYmo9IJWg3iA0XZEL8a4Uriapa5LoRlVGSw9HT0P9ZUorUxpgSg98Rxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tChMVQrI35AAcW+AQ1gSvpWNjB3olnIlPb9OAAj7gtQ=;
 b=Az+pB1/g8av6dHZmKP54ql0NUWVZ+ZNbAoADOhG89Zeln8A6WuikoaVYfsjG4Pj/orYEkOPQP3B6RbJIWh13R4+NqUGDwOzmvzlgMGpmyYsmV9Zjtu31Gsn835HfMEnIWJX5bXXxPqtGE1UyoiYEoteXF8w3Xni1it7cH0FILbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DS7PR12MB6023.namprd12.prod.outlook.com (2603:10b6:8:85::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.26; Thu, 29 May 2025 19:01:09 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Thu, 29 May 2025
 19:01:09 +0000
Message-ID: <da57734e-75c6-4fa5-9cc1-89376184d9c3@amd.com>
Date: Thu, 29 May 2025 14:00:53 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 18/27] x86/resctrl: Add definitions for MBM event
 configuration
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <8e9f18e1bba578d74fc3e3cb887c5101eb73e1d7.1747349530.git.babu.moger@amd.com>
 <ee5b9df7-d087-455b-a782-027d117b2178@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <ee5b9df7-d087-455b-a782-027d117b2178@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DS7PR12MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: ed524b43-c25c-4d51-de22-08dd9ee32c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2lOQ2doVzBYTHBQNStXUXVBRnUzeE5iZnNwWHdFT0hnampHL08yQjE3M2xx?=
 =?utf-8?B?VnFINWplMjdTVis0aFhENHYwanBLMk5vRDFDR3FvdkdaaUVncnVYOVJRcmVo?=
 =?utf-8?B?MnlxY3EzcERXSTViZW4xOWxpVlJvbmxyb0g4UkV3NW9VcEhsOElKaVBrVWI0?=
 =?utf-8?B?U1Rlc3lTNlJCOGROL09vZDdQWUE1WlErdE1Mams0dExPYWI2ZGlMVkptR2pF?=
 =?utf-8?B?WW5JekRsNkZNUzlXbURIUGRpTUo4N1JIMytPVXpRbTBGV2dlcDZGQzhsUllq?=
 =?utf-8?B?MEhBbTVCNW9EaDdiLzVsb3NBVEpGME1HZWdvQnpkN2ltZklHZTJrOEJ2eVRh?=
 =?utf-8?B?OTlFcjgvd050UzJoQWxqcUhzU2dJV2pYdVREdHdQakdTelUxY0dQVG8rbUYz?=
 =?utf-8?B?RTRQaDRGTE9WQXN5M3RpRGphNFFvY2tyZ3dsUHpNSW01UnZ0TThuTG9IYUMy?=
 =?utf-8?B?d1ZFbGZla3NQL2R2SnlXaTVtNDl6Y0RKTTBtRG9JZWlySVlaTmVEMnZLdElI?=
 =?utf-8?B?YXA0NVpUVGxFRWlaYkNwNlZXMERuZklKaXdMeXdJL0puMkxEWE1STnBiZDBu?=
 =?utf-8?B?dFRaRjlQMnd2dVpiZ3RsTTRLMUpIQXFaZU9IWGt0Sm9KakM1S0gwVHNGc09a?=
 =?utf-8?B?ci9DYzAvMHM4U0pEcERxMmRGMElCMk50YmpZeW1ScGVqeklGMHpacjliUE1y?=
 =?utf-8?B?ZjBNNGtYazVRbUdGVGhnWXJUTHdsazdxeHhvMjdBSjl0WWJEUEpIODh4b0xz?=
 =?utf-8?B?NmFUSk4wVURzOE1KQUQ5aVlUWFJYZGRZTHZSQnNmTEtlemlIS0tnQncwV0wr?=
 =?utf-8?B?TGg3SVNOR2lvQks3a1NTd2tkdUxQQ1lJZzlpUUFJSWhVSUZRQW5vc05USEE3?=
 =?utf-8?B?ZXBueHMxZzA1OWZBVXllQndLcXIxWVRFRXRVMTRIb3EyMk1hem8vaEVwNXI3?=
 =?utf-8?B?V1c1UXRlelUzalZaa2hUTWs5WlFEbnZHYXhRZ3I1NFB2Zjh2OENBNFR6WDNk?=
 =?utf-8?B?amxRQWtadWdHYVBINXYxa0NpdWhydlZ2cUppT2JWYWFLUEpXTWRiRTllUUEr?=
 =?utf-8?B?VXRtRk1ydDlNNUZBQzQzbVc3bUtXYk01b2tRYjlxcnpUKzlwaklJWTUyNlo2?=
 =?utf-8?B?QXV2M29udk5XVWtnN2JXL1JxWi9xS0tPMUt0djBHRk9IekdwTHJLUXFaNGxM?=
 =?utf-8?B?T3dkVzNSOHR2ZUFrakxxczVzc0FSbStaazEzc1daVVNadW9CSy9QNTUrbDlw?=
 =?utf-8?B?OGU5Nkloc3Z0T295YmZNbWF3ZUpyZ1A1eTJ5dFpFQ05FTXYyRkNUaVVkR1h5?=
 =?utf-8?B?cW4xWEZsb3UxOWFCcytMeld1QjRKdnlhTGhSekpzSzNvL3pWbjMwQkJWb1lj?=
 =?utf-8?B?MzJENGo5Y25oZWVtQURQSzB0NmUrYktRZEFmQytsOVBYVHFVTC85U1hZb1Ey?=
 =?utf-8?B?U3NGbVhRYUh6NFh2bWZONFp6bW9QRkppaDljcWJHSzc0RGY2cFV0VzJLT1No?=
 =?utf-8?B?K2hNeVlLVzBoSG8xTkVEeC8vbWJjUStSSE14WFQvM2J1ZnhaTWdxcENDaGRh?=
 =?utf-8?B?QjA1b1EwZkpVdnZWQnQrQ0ZGSzhjMGZLaXg0REcwUUJCN0ZoMC9neTNqbEFQ?=
 =?utf-8?B?c0ZXY0dZMGJiSHE4WEx6SGw3WktjMlp4QUJVT2tyWG1XUTZxT3VhMXJ1amI4?=
 =?utf-8?B?M0k1MHJYcDB4M1M0NThEc3B4NUNzTEF5eEk1aWVQZlJIaHN3Y1Z1OWhUWnlo?=
 =?utf-8?B?QlV6VStmTTBJNHdyc0R2a3hlY0Z1NHE0K1ltK1lySks5aEZUajQwcUVrOEhx?=
 =?utf-8?B?eC8yeE5VYjRXbUpaRDd3RkhsdWRLUnpWSjd3OG1IRTlMakNibVp2MHRnZXpK?=
 =?utf-8?B?SVFob20zazl1M2JwMTJxYnV2SkxxeHNNbFEySWZIU29pbHBnV09LK0J1Zk92?=
 =?utf-8?Q?GuksdwCsWr0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2Y2VlI4QVROK0JCMkZ0SzBKUGRjQXczM3loSnZmNmFHeTU1RklGaE5IRndO?=
 =?utf-8?B?eFRzNWV0VUpBMmVhRWlmbUpYeEUwT3dqZGtrMDJvVmZtK3pHTWdjTllrUDEr?=
 =?utf-8?B?YklRUi8vcnkwRkF5b0VOUy8ra2ZWK05jUERvbUhXWDNROGVWOGtWSjJPemZZ?=
 =?utf-8?B?eFY3QzVCNndLOUd6bGw1ai9USU1IWlhkQlJZcE5McC9XNjRZZ1BCZnAvOU12?=
 =?utf-8?B?VFdXc3oxelI0NVlzbjBwNCtkOHJPdWRieHFaYWcvS3p6aUpwQ1BUaG13dHF5?=
 =?utf-8?B?WVJ4QmhqSDJmeXRQbElOUzRLdnBPbU9OUXRBZ09hVDNtRVM5UCtCYTB6dVFW?=
 =?utf-8?B?M0FXWXZybWRwK1lOdk5EQkREVEd2NWJxWHhGckc0ZVYrTUpCajFwQXpRUWwx?=
 =?utf-8?B?SmJiRk9nZ0xkd1U0OW9RdkZmRDRzc3YzL1o1WlZZQysyNXpqWVhYdWJsclhr?=
 =?utf-8?B?STNIb0RNVmRLSmgzYVRMUllUeVF0dUdCT0V5M2JFUlIrSkhUZWYyQ1BjNk4x?=
 =?utf-8?B?bmx0ei9UTEViMXN6aTRUMHp4QndEOWFEUWxOT2RpQkRzMUpmRU51WDN4bG12?=
 =?utf-8?B?cDlyaS9rL2VjWkhxTENUWnhKV2tSWkVJdkNpMkdTeHdCbkJBcW5OZjk2R0dz?=
 =?utf-8?B?WnpvdVpxVFIxQlpwV1dEcUtEZkU2QWJaaElyaGZCKzI2aGwwNCtrRVY2dkd4?=
 =?utf-8?B?cGJheUptNzc5UEpWUUxwY0s1anlhQkVEa3JhbEVXaUx5b21nODRhR2VTUkla?=
 =?utf-8?B?Q2JDejhIRnFJSWxZbGowOFRZZVJMeWpueG8xWmxONFN2MkpkR3ZMeGd4RmlQ?=
 =?utf-8?B?VmptQmJObTY4ZklqdmlveTRKWGZjUTFUanpVUXlLd1lOdTN6RUhXblZ6c2NN?=
 =?utf-8?B?WWhnOGNSVkUyMlVnYjRDZWxMNE91RjVBOFUvTzlDSHdoY3Ztd0NKUEQ3ZENP?=
 =?utf-8?B?dVZpdW00NDY4NjVPNi80MXpIamp4SUg5UldUbW9ucE03THpMTG8vTTdMY3FM?=
 =?utf-8?B?NUp5cHdMQ3lRQ3RRNElMaEpSYlhIVnhGa1ZKcHJzTG51SVBreWNrMWZJR3NW?=
 =?utf-8?B?S2VYVjZkQk9wS2xXU3k3SW1pL0NtalJPTnFkVFlYM1ZrNzNFT0Y3bERjY1lJ?=
 =?utf-8?B?WUFvMkNsdGp2bjBCRzZiM3BMWCtOOVBydjI1aEpKNXRjV3Vja2VtL2lJeGlx?=
 =?utf-8?B?TjN3YTJZT01JQTBjUjhISU9lVkpNR1lPbXlEM3JTUTRxQ1g3eG0wS2JTcFhV?=
 =?utf-8?B?MUgwZ3VaRGVMLzFpVjN1M2Y2T1A4S3VKN29rZVNXRmpyNzgvRURsSW5NWWhB?=
 =?utf-8?B?cVpzcUtIVC9NeXZwVXd4TTZuQTM3K01LN1IxYzJjSHN1b1I4eElna3IrSjRo?=
 =?utf-8?B?RmtEaUp3akp6SGxOemZUc3dQODNVbFFFMHlFM0JiUThsaW15eFMzWkJUdENF?=
 =?utf-8?B?MGcyOVhMYzVGeUVINmZYbzEvS3Q2WkRJVFk2NURWOVp4Q0NpNzVWMDIwN21z?=
 =?utf-8?B?UTdzazhxbmJjdUtRZ3graVlmQU5oZVZGWTVtRk5rNWRTbTA2MFlyMGl3ai9N?=
 =?utf-8?B?SFNsemNmSmtrSE9aMndHaGp0WktNWkNzYkRWK1dZWk43QlVLNUVPd1N3NVVM?=
 =?utf-8?B?N21Ld0tRaEpUSFk0N25lalFrZDE0RGhMeDFHQUVSTU9rNWx4dTVUU2x6bWxP?=
 =?utf-8?B?dDUxQ3NqQTR2V3FpM2N5WlA2d1c3MDZYWG5zUXh3R3hKYUFlMkI1NGFYUU4v?=
 =?utf-8?B?bGtGV2k2bE1IM2IvdEg2S1o1V3BUbStPeDJzREdqVFBvMEczcnkyZU5vMk5l?=
 =?utf-8?B?bHVRVFp0ckFraEc2NE9jc2pYVFBQNVZnTTFpYUM2OVQwdjZSR2h3LzZSc3N1?=
 =?utf-8?B?aTRXbDVNTjRnVDY5Qml1V3FGMWEyRDZuSTFFS3VGcWd6UFdmZjd2NmRUZkZs?=
 =?utf-8?B?NC9VaW81Ui9tUDRhMy9JRVdVYkM3c0ZyOThzNGNITCs5dk5TTXlsOWtPVEFD?=
 =?utf-8?B?cWQ0aTBaVHdVRjl3YThESHAyc0l5WjVBT1VsdGI1U2FjcDNMbm1UTS9SUjdG?=
 =?utf-8?B?Qno3amc5RnV1dzJ2TDVUZ2RJZlRkeWg1NlNkQlBCT0U3d1lOYWhXUDVhUkwr?=
 =?utf-8?Q?5Hf8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed524b43-c25c-4d51-de22-08dd9ee32c5f
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 19:01:09.7524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OCeBTZyw39iipxhA646/fx22n+/4hrBsjWEOJ5m9lsGhI84lSQgZu3B2ciLwWzUA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6023

Hi Reinette,

On 5/22/25 23:41, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:52 PM, Babu Moger wrote:
>> The "mbm_cntr_assign" mode allows users to manually assign a hardware
>> counter to a specific RMID and event pair. The events available for
>> assignment are configurable.
>>
>> By default, each resctrl group supports two MBM events: mbm_total_bytes
>> and mbm_local_bytes. Each event corresponds to an MBM configuration that
>> specifies the bandwidth sources tracked by the event.
> 
> hmmm ... earlier I thought "bandwidth source" means RMID but here it
> seems to mean the memory transactions? The various terms are confusing.

My bad. Yes. "bandwidth source" means RMID.

I should say "memory transactions"

> 
>>
>> Add definitions of supported bandwidth sources.
> 
> changelog uses "bandwidth sources" while the comments of patch
> uses "memory transactions" ... please be consistent with terms.

Sure.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v13: Updated the changelog.
>>      Removed the definitions from resctrl_types.h and moved to internal.h.
>>      Removed mbm_assign_config definition. Configurations will be part of
>>      mon_evt list.
>>      Resolved conflicts caused by the recent FS/ARCH code restructure.
>>      The rdtgroup.c file has now been split between the FS and ARCH directories.
>>
>> v12: New patch to support event configurations via new counter_configs
>>      method.
>> ---
>>  fs/resctrl/internal.h | 10 ++++++++++
>>  fs/resctrl/rdtgroup.c | 14 ++++++++++++++
>>  2 files changed, 24 insertions(+)
>>
>> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
>> index 0dfd2efe68fc..019d00bf5adf 100644
>> --- a/fs/resctrl/internal.h
>> +++ b/fs/resctrl/internal.h
>> @@ -203,6 +203,16 @@ struct rdtgroup {
>>  	struct pseudo_lock_region	*plr;
>>  };
>>  
>> +/**
>> + * struct mbm_evt_value - Specific type of memory events.
> 
> I am trying to decipher the terminology. If these are events, then it becomes confusing
> since it becomes "these events are used to configure events". You mention "memory
> transaction" below, this sounds more accurate to me. Above could thus be:
> 
> struct mbm_evt_value - Memory transaction an MBM event can be configured with.

Sure.

> 
> The name of the struct could also do with a rename to avoid the "event" term that
> conflicts with the actual MBM events. Maybe "mbm_cfg_value" ... I do not think this
> is a good name so please consider what would work better.

I can change it to "mbm_config_value".

> 
>> + * @evt_name:		Name of memory transaction type (read, write etc).
> 
> Unclear what "type" means ... maybe just "Name of memory transaction (read, write ...)"?

sure.

> 
> The "evt_" prefix looks unnecessary.

ok

> 
>> + * @evt_val:		Value representing the memory transaction.
> 
> This could just be "val" and the description could be specific:

ok.

> 
> "The bit used to represent the memory transaction within an event's configuration."
> Please feel free to improve.

Sounds good.

> 
>> + */
>> +struct mbm_evt_value {
>> +	char    evt_name[32];
>> +	u32     evt_val;
> 
> Please space member names with TABs.

Sure.

> 
>> +};
>> +
>>  /* rdtgroup.flags */
>>  #define	RDT_DELETED		1
>>  
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 72317a5adee2..b109e91096b0 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -75,6 +75,20 @@ static void rdtgroup_destroy_root(void);
>>  
>>  struct dentry *debugfs_resctrl;
>>  
>> +/* Number of memory transaction types that can be monitored */
> 
> "Number of memory transactions that an MBM event can be configured with."?

Sure.

> 
>> +#define NUM_MBM_EVT_VALUES             7
>> +
>> +/* Decoded values for each type of memory events */
> 
> Please be consistent with terminology. In the above lines it switches
> between "memory transaction types" and "memory events".

"Decoded values for each type of memory transaction types"

> 
>> +struct mbm_evt_value mbm_evt_values[NUM_MBM_EVT_VALUES] = {
>> +	{"local_reads", READS_TO_LOCAL_MEM},
>> +	{"remote_reads", READS_TO_REMOTE_MEM},
>> +	{"local_non_temporal_writes", NON_TEMP_WRITE_TO_LOCAL_MEM},
>> +	{"remote_non_temporal_writes", NON_TEMP_WRITE_TO_REMOTE_MEM},
>> +	{"local_reads_slow_memory", READS_TO_LOCAL_S_MEM},
>> +	{"remote_reads_slow_memory", READS_TO_REMOTE_S_MEM},
>> +	{"dirty_victim_writes_all", DIRTY_VICTIMS_TO_ALL_MEM},
>> +};
>> +
>>  /*
>>   * Memory bandwidth monitoring event to use for the default CTRL_MON group
>>   * and each new CTRL_MON group created by the user.  Only relevant when
> 
> Reinette
> 

-- 
Thanks
Babu Moger
