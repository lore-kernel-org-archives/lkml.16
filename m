Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023102.outbound.protection.outlook.com [40.107.44.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FAC296163;
	Fri, 27 Jun 2025 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015489; cv=fail; b=b/dSJwu+pFIjtmtNel7aPzS830yZ54jqT67W82tJXJ0ltxHYelZ8HTFF6hVgIbSs6aeme8HxJBDOCXV+jdh5EeKHJcSlrunM05dDfQzNZh69eJ0wjZ4G3Ovsfpp8u3pm+nrN0bcOKhA/ninDE5o/9YmFyQ9IA1gJ6VSaVaKSUOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015489; c=relaxed/simple;
	bh=wdlW0bwbSjbF6m8wDvrcMr8Cz/dZf8AwlfQURTBwv8o=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=hbSn/RQra4KN2rffqNOQj44ozQYWaoKcrUyJCZG1Rlya8eZjdVQqJTxzjt16YxR6GvP7vlp3MIReasNIpBnPKiDkpJi2npQW6I4WhgNVPRiDTcdXclzsVxfHRRlmm6FE0FQMLtNQblrAY8Scll9WwByJqn9l4F7MDRqzkiR+Vb8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=JN5YE6oH; arc=fail smtp.client-ip=40.107.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="JN5YE6oH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMejpSfr2135/ji48SjFgFAQcwK8TI8Foza9Z+9IAk2BtCCsNtYqxIWreuz25gnFOznVhUKDqPPRDRST3AQs7ry7O/SYKKcO3uue6J8XQLn+4blXhZA9JtDvgUYX5d7SEm/gxwZk7ky30yNRuogs0q5muNBaREDl5uDLiide4ZpxDq8YIxdnJxfJx/SAm3FV5ZKMBCjjLAhl2lvTVPSPFwthScohD3Sj5a3KB1gD76KB8MWiHIpvFOHeIZpru/YxYui/ifr+eO0ELbXlsQXetVw3gDY1KLuXuG1B/anLU+knnymO61wVauNyrh9p606Vr7IPhlmj5JzGDnK9weGQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNw/tlNwB9cvrfwejePN76STFX0ILAi/lbbe9kjSnIk=;
 b=wQ/rc2LhAuq+Dj8IBUD+UiE3s7SnR4ppMLmkJ0X7/jZ1LTybNCPsPh0iGBDlrUPjQ9gGMWIFtW79JxIPjynkf1mDgfxCKWDBxJEtqR2at973xhTWl9BbCKYd2sDZiFymefjS+hgJWUiZvEuCglCh1UbeWw3hlrMjh73Id+XpJUwtdKC/Q7tj/HD4kE1JXphlrZQULt0cSzm3TsKJn3UcOUSCjpXABFyZlzWBymRZGQ6SKEQukbuCg+uknRybg4UYDEWjwW9brRtivTgwomKMtmG1V27vGsu3LxjymW6G96mHBLlqalswqF7T5+XwFYKh0aqv7RrZazS3/Z0+vGs2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNw/tlNwB9cvrfwejePN76STFX0ILAi/lbbe9kjSnIk=;
 b=JN5YE6oHhL9PExTrBdAft9zD6zKW32O877uhGeLKgW1P2prxZtR0ZZXaYuxM0dRfNHSKXTay9xxVn7Ssb0cKh7nrfuvSbucylUB6+pZqAF/Pu7V/LIiWYzs5VaEurIClY+QoLWKIkOAUsr1UdPBxJQg9TFRt4PfCVy+QE78AvAio90LZujMtvLAhImoRL9MfzfCE0ZoGpO+ovDN8KWDZ0t1E1le/v9XakjTOabEnXZDYhgYlm8x6mRIg52WDD9zFvepqjr4XLsO+Qbh4dnfv3+EtgfHk1aC5JopRFP/crqUyS7TDR/X4pKrcEisufI+iTydSW1oc4qVWbMUIj0swbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TYZPR06MB5999.apcprd06.prod.outlook.com (2603:1096:400:33d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 09:11:21 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%6]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 09:11:21 +0000
Message-ID: <8bf959d1-bfa0-4546-bbdf-396ec8ffddd9@portwell.com.tw>
Date: Fri, 27 Jun 2025 17:11:18 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH 0/2] platform/x86: portwell-ec: Add watchdog suspend/resume
 and hwmon
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TYZPR06MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: 8255bc20-63ad-4b69-e400-08ddb55a9518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cStzRklMdU5LNTRPZ09VZWVyTDZEZ1lPNTZnbGFaVURpS2Jhd1dSVmNYMFc4?=
 =?utf-8?B?VXgybFVYK2JYRFk4U1RmVFlMQzNzb1hXL1hyQzE3OUhGeGdMS1htcTlTc0dx?=
 =?utf-8?B?eVllVzczd1VoRitLbG9TK1plRVE3aXZsWHpqU1YrZXJZVnY5Y2VqdFRWNXMv?=
 =?utf-8?B?dUJYZFFmMVpudnRkdnNMQ1Rwd0J3YXJBcnZiTE9rUWNSWVVDOFpxK2piQUlM?=
 =?utf-8?B?QlJXck9PRHFpd0VTaUVINFdmQndPMWs2bWNJd2RKMXRQbFdmWDJvL2o3RDVu?=
 =?utf-8?B?Q0Q1c0c4NVVxbDFud1J3V1N4VjVDUmh0M25samJoTnlSc0kvelFRcFlhZFNw?=
 =?utf-8?B?OURwd2FCajlLQ3RHRitiekl6ZGhJaXpJY045VjFVNE9NYTBvQVl1dWRZZUhL?=
 =?utf-8?B?KysvSEVnN2VIT1RIYmNIdFRhbWhweHhYWktNdExXOG1uQ21XdXNuM2h0ekxm?=
 =?utf-8?B?QldtWCtmNlZINncrTUtmWVQxd1FucEs3Q1hjTjcyQStFOTkyT0pEMCt3RFdm?=
 =?utf-8?B?VlZvZDFTOTkyaG5oTnBMVGtLL0NzREFGeWg4cStURW9ldzk0dDJXMVdweGov?=
 =?utf-8?B?czVicDJCZi9zd0ZQQmpDNEVtYXJCQ1RLbnVLa2wwNEQ2eFJndU1jNFg3VHdi?=
 =?utf-8?B?dDNiT0EvN0NuSUtBRVdiRHhYVUUwbEFiR0ZCbURjNTUyWEt2cEhwYjJJTlRw?=
 =?utf-8?B?N0tIaWpIQzZReFlHSitNdjNSU2syUWNqSXZ6OGhnUEVHRjhsUzI5bDE4dEVS?=
 =?utf-8?B?SGgyeFN1UWdwQjgwM1BORGk5Rkg4aFRpMDBkTVBtbFovMVFYeXh6QjdPMTB0?=
 =?utf-8?B?RS9QU2hwOGdFQ09qS1orM0ZrTC82ek5EOUJxYmhINVl5bVIvL2tvanYrajIr?=
 =?utf-8?B?dEw4QjIvT0VkMkZvZkJJK0pIODFLZFl1UXgyZ2d0dkpPU1JNaTBJOXdpUDBE?=
 =?utf-8?B?M0pacDkwNFFRYzB1bGc1aXlvV1ZyVFFkQ2xHUGpuSGhxdG5uT2JxNVFKVjR3?=
 =?utf-8?B?VkVMaFBqQlRwbDFRaDFRQ01PVkhhbzlOUzFURTk1SDNrTk5abFdBN0QvWWtO?=
 =?utf-8?B?K2Y5T3orV2pWWk1MVWkyQXVrVDhmMWlNdGc2QlpIdVZVcS9RQ0o0OEt5emtO?=
 =?utf-8?B?V1dSYk80V1R5cHdicEI5M0NQR0FxcmovVFdBVnFERURQYWpVeXZtS1JRN1Jx?=
 =?utf-8?B?ak10YlI3NWJkRTRwRndZd1FDTXhyNXNsb2dLWnUrSnAzSFpVU0hVSTVSYjRo?=
 =?utf-8?B?UXVWSEozUHlLVHBlemhjZEJ3bFZwaGxKSkYvZFd3M2lpMFdwTGVZaUZPVk8w?=
 =?utf-8?B?cEVNdXNVQUo3dFo4KzZEbndOUi9WWkNOT213OTI2UDgyRm9UNE1tK3BTSkho?=
 =?utf-8?B?VGVyazNxRHh2MDdKdWM1amhnL1cvVmVKWmpjQ1F2VUZ4c0NWR2NDczBIMkQ3?=
 =?utf-8?B?K2M2Ky9CM2RiR1QwanVhTTB0MU9uTXU4eHBqWEVRRDNBMmNsVTE0N3grbUJD?=
 =?utf-8?B?dTJWNXc4eG1FcVpEU0lFcU0xOTZDSnB1Q1Y2d3hsY1BEeWl5Q2graGtGcEV5?=
 =?utf-8?B?eW1BVDgyUmE4VjIvT3NyL0tJazlBbTZzcHAzM3FXWDcybFJjeVI1UlBsc0kv?=
 =?utf-8?B?Vm96cU1WUEtUQndpZHNLSVQ0UVAzWFlvWThhSDh3RFB4azlJaE1pYVJuSG1P?=
 =?utf-8?B?K0tKMGo1NUJZbGxlWWI3d2J5dzNDa3hJWVBvMzh3TjB2b0Z2ZVc4aDM1WmE2?=
 =?utf-8?B?bG8yMXJtempLSXhwTWxFaFBDd2J2WTUyRFIxOVF0bElCWU1MR3hzTEN6SDZB?=
 =?utf-8?B?QTVUc1hKMlR0aVBFQWtiRGRNbmY3UXBTdmpJQk5Ld1VZSnBrTFdaVzAwTFdW?=
 =?utf-8?B?VzAvVEpTSDhqQ0wzYVpxNEpTMmNWNFJpb0NwMlVYL3NPaUlKN296SXpTSE1P?=
 =?utf-8?Q?0ulNfo6bKJc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFplSDRWUG9mU0xPazB1MDVnZ3BZSGNtcjU5ZDdFYjNtVFMxdGhIcmY0Q2RP?=
 =?utf-8?B?NThWMTJXVUcvUEh2Y1Y1enlIdGFnalBLNnpIdmFaYzlYYlJtN2NzV1lZSVFH?=
 =?utf-8?B?cTMwUEVNcFpKUi9mRmlOc003MEErTkRXQ1ducHJ5TlZScjFWY0tsR1d5NTMw?=
 =?utf-8?B?eTBkRXA1TTFodlRBQmFPeUxISEoxeGlpaE44U1FwQnl1cGZoSWg3cnJvWXlj?=
 =?utf-8?B?c0RwK0RmaWl6QWVwK2NTcGJlUnh0cGFVY2ZlbFpoRUp1WGZucTRBaE5QQmxS?=
 =?utf-8?B?WTRlQ3I3MVhNYmxiU1Q4SUtrRTFJQnZmKy9vYnlBV0JiNU5YdWV5TWRWMFBN?=
 =?utf-8?B?QTJEc1c3bHlGVkhIMkJLcXU2cXhNQjE4TmJ1R1ZxamppSk1uWFRYTWtFVW90?=
 =?utf-8?B?aDd4QzNRVDdGZzlpckZzNXlNZGdOSDNPUjI4OUhXUTdKN011WnRDQ3RydXE1?=
 =?utf-8?B?akNqZEZLdkZVcVhTZzVpdktNWFRkMzFvNTZVQ0h5MytZWDM0TVA1by9wVU4w?=
 =?utf-8?B?VVBnY0VjVVlRam54TlVFZWhCTGtnc0ltdklVNjFSOEEwU1BBb05jZjhmdVpW?=
 =?utf-8?B?TmdsWTRRNUYra0dSYm1VMTZodDVqUTVtNEkzRzREbXl5cXJxVFloL1YzNk94?=
 =?utf-8?B?MFpkWG9zSGovSzIrcWlLRmlUVDM3WWx5YnFrMnBCUE5LOXZhL2s2V05xa1Ir?=
 =?utf-8?B?Zm05Q2l5bGRWSXpabitVeElMbDFoUjI4c3RwWEVNQjZhb1lEbkYrNThLRHc3?=
 =?utf-8?B?VW5LdmtmUEkvUGhTOVNSTHdkeDd4Mk9LNlhMeEc2TGsvRzMzZmd5RTR5UVI2?=
 =?utf-8?B?QmJ5ZG5qd3hYamo2bVFqSUJobEdNRW5wN20vRzcwR2ljc3R5TVEraktUOFJD?=
 =?utf-8?B?eEFqMHN2aHIzQ0tjVHJYRzRpTzllQ0MxdVllMHFrN3JuVmhWc0pWTXAreG1G?=
 =?utf-8?B?b1YwZ28vbVVreEE0V3ZvQ1FkYWVZRGJ4Y3poZklWWnUvTndta1dlTVJWSEFs?=
 =?utf-8?B?bHRWV2hGa0RtT1RJODN0R0J4RjZGU090d1A0bENZd2M1dFptakVxeHVWc3p3?=
 =?utf-8?B?L2hGakE5V1RQOGNxVURqTnNkS28zU09oR3MvUjNUWnBQTjh2ZXlXTWUzemtl?=
 =?utf-8?B?em9YckJubVIydFU5NE43aldTQVFwNXdjeGZkNVZNcFJhMTFvckVRT0NVZW9t?=
 =?utf-8?B?RzRGUXRqTDhnOStDZEVQV1BJc1ozS2E0WmF3R05MUURTM0NPVlBudDUzajFm?=
 =?utf-8?B?djNjLzhTYVMvWWpmSFJEQTJlamxIalZQcEVyaWZYcnRyQ2QwNDlXQnBGQnNX?=
 =?utf-8?B?Qm13S0owS2ozNng0TEU4M3VLVlF6THNSZmRPcCtCQVBPdmxvNERwMmtJeUM0?=
 =?utf-8?B?WHQ1dlFwaDhZejFDcGlRQ3FJdHVPVFVNeEttSWMwRExnMGFhQU1HYlFVOTBn?=
 =?utf-8?B?N2dnN1FwSGM0YTV4SDRJbHM2Q1FWSGFOZEpHWjBLQVZ3V3IwSEYxWVppSWNX?=
 =?utf-8?B?SU5LNzNMREFxUTNWWnpWMDd5OEdtdGp3TmljWUZibTE5MGc0ZTFaT2htaUh3?=
 =?utf-8?B?SVMyYmI0aXBYUE4wV3R3cmtKbkxRQ3hJTisxeEVKYWEwQlVqbHpJanJ1RWh2?=
 =?utf-8?B?UFVXMmRJcllCaXRUZklRKy90REtBVHJCdW1OckIwZWxBK0dJMnRZUHIxYUVT?=
 =?utf-8?B?OHg1d1dkUW8yWVBVZG12Rk5iZk5nYkYwdjRYVGV5SWpRSEhyNnd5TUFST1Bu?=
 =?utf-8?B?OXdXSndhaFgrUktoS0s0eXBzMmFLS0tBWmhUSnk3WHZ6Vm9VSUNOTTI1WmZQ?=
 =?utf-8?B?Ny9IYTVWS0w0WHlmWW5uK3RYeDVpVVR4ekRsclU2R0FJZS9KWWhxR0hTV3dn?=
 =?utf-8?B?ejVQYUg1dVRSbWlRaUpyY3owYWVRZmxpYnIwZ1BuWFBNbEFZaVpNVzg2OXp1?=
 =?utf-8?B?U213bW9QeXlaQ1ZRWjdFVWpiUzZPVUc4QXk1VEpUcDY5dlZBckNKZ0l1OEVV?=
 =?utf-8?B?dk51Ujg3THNId0xOOGptM1ptMGExWnhidXBSSTNNSi91Nlg2MVlKdmRzS095?=
 =?utf-8?B?WDFNNzBVSDM4Si9PT1RNL3dWWWhXL0pyT3MwcWd3Ymw1TE5PN0tVcW9rbm9Y?=
 =?utf-8?B?RVN5a1ZZaEFoTTErN2FUOHllSFY1WWlmZG5GRUU2eklJNFROVURYZ09jMnJW?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 8255bc20-63ad-4b69-e400-08ddb55a9518
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 09:11:21.2616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BOo3In1yMK1Z05xe3ytsR/Qnbc4oNlYPVI++H/JKOunKtDytckoco6DoMIttCE51orsa9Y76DIpZR6iXFy5VbQi6Bw8/o2PNnrYMDPQF/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5999

Add suspend/resume support for watchdog and hwmon monitoring functionality
to the Portwell EC driver, enabling better power management and sensor
reporting.

Yen-Chi Huang (2):
  platform/x86: portwell-ec: Add suspend/resume support for watchdog
  platform/x86: portwell-ec: Add hwmon support for voltage and temperature

 drivers/platform/x86/portwell-ec.c | 206 ++++++++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 2 deletions(-)

-- 
2.34.1
