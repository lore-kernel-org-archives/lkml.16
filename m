Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11021088.outbound.protection.outlook.com [52.101.129.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A7314386D;
	Thu,  3 Apr 2025 02:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743648791; cv=fail; b=H3YrcaL7lR1dSbx7A85oy6703NtetB9rqu1rAA9svxLve4DcWthoEyiZxnDEnsJqn81P+/TiEAGR+Iv+de8oVlBCGe20SY+QBFm45XqfYUWlsvQsFNQD9uaWrXRTBd4WrwSfXJ1ISU8tyo5jsN8h841p/X5x6yIA3LMubrp6lDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743648791; c=relaxed/simple;
	bh=ixlqwwXb2Y2R0A9GyWwsAUPyPZMyaixhjgPaTBDWhBs=;
	h=Message-ID:Date:From:To:Subject:Cc:Content-Type:MIME-Version; b=HUS749tJ7E7TZyueZjVI3XntvynXOoy0X70KQREnzZR4R3xRuq9f/dDm/PCD//Mnt6nHOp1Z7PG6GEaSVAxnrmR7n28MBf0C/u0ytu9uQJXHYzAmHw7oos4Gpdw4YouHlRkMKaIRbvnuZ+MkHoCPejLZ7fMTbVI9a7MbNOuFacU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=jIbBJd9i; arc=fail smtp.client-ip=52.101.129.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="jIbBJd9i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbqCWt/Fp2cJAM6F04+Q1bDpNQgEUmTDQ95MRsasDcptZwFnPOxVP1lrKMQfzzeRbPL81nv1xhp6nKPDHSO2J1HgWQxMnO6wATezOMwwVkKbW+MbAQkeOQh4UkWURN1budh23hy4jEIqKCkXxEikUS1avNR0UUWCZfYbnAhxtGRVLWjMuKniVtNwb2LmKvD7VgTZP3fk4oUCZMH9ic2p4sTDwegy92yj3JyKM/otKNpEIRPRcHu31yZO2p9jdehQsUq60dOrYvBJu1dCQHv4zXbEuwaOJTk+yK5aKtXxY9cpOTm50j3aR/gcd5biAUqJ72hwu/wJn6S+ysrpnQ3Axg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYLdW3SJCXiWex5Q8tckgT4xvkkL194hcsxwAtOKRgw=;
 b=WKm1NcpWtyojtFcs2+5A+Uy59dUTip/D1LJtAHRPcqiW+RZzfuYt9GxTo4KeFxuIZ+O32+kNsc4Deyqj0uhQ98dHPEwh3Bz/Vs+kVXzoKjekn+CWlUgKjOOIO0aSOq+Hcaxfp6EXFuZovN8pHSbDZZ2DARM/mrGxpXmQN5Y8Hug5h4uhBTFx5zN3BMjnX9l2CPcdnTapwDLbpZ261NsLkdPGIYcihox08KsexjxHsSMA4M9NPKkTyDmM/p2FzaC75FHQpWRGuAviYqexjlm8XRJpt5jlpssax8zflsGeWoyxLm6Dz77EnG4Qf/H9j0rFtYlYTEtMHH8eF5PkunUkEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYLdW3SJCXiWex5Q8tckgT4xvkkL194hcsxwAtOKRgw=;
 b=jIbBJd9iSEnga8UovPgBrCt2bOnrXJDqgmPXkNONgh7sl77JMbHmv2KoPcFRppdSM138bDqIQkN8owK3hO6FpvboNnZcMGdvZ3yzmRyiCQimiAuWkFiz3TSsh2F5W5MkgB9pQGN8+yTudE80p4cmL7ipyOU/mXATIT0vDicR09cL9mC3F6UEjF4LD/aNoGsHweNrLLtNhj/Amj2tSUxNw0vXu+AamaBoYTWwjEk/SUnlsaJ8mNGzxF1yaQYKuRvsOdo6VuWfQw/aJ0BZ+6LvVdCoLhd3CFnX7dmeAu/6dnBp+EQSPcIeNJiygTykN+9790NOQ4CjgXZ8H3IrHCIZbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TYZPR06MB7171.apcprd06.prod.outlook.com (2603:1096:405:ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 02:53:02 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%5]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 02:53:01 +0000
Message-ID: <3ec9d070-2d2a-45ff-af78-923ff1628c08@portwell.com.tw>
Date: Thu, 3 Apr 2025 10:52:57 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Subject: [PATCH] platform/x86: portwell-ec: Add GPIO and WDT driver for
 Portwell EC
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 jay.chen@canonical.com, jesse.huang@portwell.com.tw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0015.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::10) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TYZPR06MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f6c546-34bb-472e-2db5-08dd725aa61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2VSaEY2ZjVkMC94dDJVVVFTMnV6bVZVeWdXc2VydzB6NldONElLMTVqSm1n?=
 =?utf-8?B?RHlwU2h6d3U0amdWK3JxMDNpaHZkdXE3TEo1alNVVWNkK3dVWGx0ZlZyc1c5?=
 =?utf-8?B?NDM1UGtMV3JWbXJ3MWJiV2pzWS9JdEVLOEZzYXNCV2xoNWxEMGNlWlRXLytT?=
 =?utf-8?B?Y3ZrengvSGhEcVZGTlBDaWRId1pINll1U1A0ek56MmJUTzgwb01TK3g0STJr?=
 =?utf-8?B?YjVTdDRydzBnMnM1NDBhZ0l3U0gxNXNwc1FFRUNsUXpRQUc0cUdpclNVSkFo?=
 =?utf-8?B?Mk9La0NORC9TSEhwQ2J6c1JvYUo3a1RvN3R1b0RBNjZEcm9rd1B0QWsyeWI1?=
 =?utf-8?B?Z3dkNzNzOTZEeEtGSC9iQmN5c1FxUlpWZ1BSeENWZnROeW52RHR3bllOTWF4?=
 =?utf-8?B?YmtCcEIwRDRQVnBYd0Q0Z0JSUTZmZ1puOFVkQjliNDdzdHR2L0xNVVYzMGpS?=
 =?utf-8?B?TWROU2RrcCtrb0RTNHFVeVdrazBHc200b1hCeEs1RDJyWEVRb2s1b1RZNk51?=
 =?utf-8?B?V0JPTGpmQ2hEcDVsVFFPL1EwNS9zNnVoOTV6ZW1LcU5tdFlhcy9MblY3amJn?=
 =?utf-8?B?VHZQMDFTQzV5bXN1UVZ4UERmU0hUTXBodk1ISWJZNnFvWGpDSGVJZ1JQWnVm?=
 =?utf-8?B?L3RGbFZ6eGYxUDFhdllmRzZnNFVoQk1IWVFXOFd6QnJYWFFSeWlBUHp6OENF?=
 =?utf-8?B?dHFFdmd2ZmNQc3NzUi9VdVlGcXVzUlF1UEtrWWhJRTc2RmdDanUraGdTaEJz?=
 =?utf-8?B?WkZySDlLZzZpTVljNkVPMTV1elI0cnR6Z24xdFlyZnllS2tEWStxd0FaLzlB?=
 =?utf-8?B?RlJIL0p2elYvOWtVWCtnc2VkOGJFTW9qWHh5STFJYXE3UjhyTkxtMEUzTldy?=
 =?utf-8?B?VHRQbjdYeFFFa2gvajNUa0JSSFZqY0FCT0t6eXFvL2phVmkvQUx2RWFaSzJF?=
 =?utf-8?B?T3VnVWF1S09PeThRYW9HQ3BGaUJ1cHUwZmJqWklkMXhNcHd1N0REZzhlK0N2?=
 =?utf-8?B?MElMOHlSOCttMFNBNCt0am1ZMkxldDB2a0hsRGpYSDR6b241SkpFcHF5a1Vs?=
 =?utf-8?B?MXd1ejl2MHdwUnRZVkszMDZlZFpHc0gzc2o0ckdPdEVsbFlkWG91YStVd082?=
 =?utf-8?B?bFptN3dVVVBXTVdDR1c2K0lhbUtyeTlCaURqYW5TZWY5dXdva3pOdDlKS1hD?=
 =?utf-8?B?bjhHYzNDUmtoUWM3bHVuL2xsQWpQK2RTZnB2ak1mLzVLNTJ1VVIwekFyTEZj?=
 =?utf-8?B?Qlp6OEJEdDJHQjJoM0p5NWlhcktBR0dOZkxNYk96RVVSbXordVBHTTlYR0VH?=
 =?utf-8?B?Y1hKTjl3a2habklpbG9NK1hXVjdTeU9BNWwvcEtKOXUrTHVFalZkbFN6clBJ?=
 =?utf-8?B?L2IxcEtEOXFUbnJGZG0rVUF3eEM0YjZmbk1oQ2g5aC9OaEZ6eUxPUXNnVUtF?=
 =?utf-8?B?MU1OOGZmRmlWV2JOUzVwdGNUZVJlRnY4aUtZMTJQUzFhZUtzR3J4ektpOWpX?=
 =?utf-8?B?alFBSlZiS3dxZEpCU1ppdjNkNkt4ZG1OUVFpazZqMEgrT3FSVzNnZWVLNlBl?=
 =?utf-8?B?UVdmZ2ZZRVFuWnZQMWNTM1lqQzJlY2tRcGhhekJYQjRhMWRQL2ZGeHkzRllI?=
 =?utf-8?B?NGVLUko4aUx5VkpaOUhKZWlNMGFYM1JVTitIRmswUzFYM0Z3eXlPZmFYdm9p?=
 =?utf-8?B?R1laYkxWK290Ym1vRHppS0ZtMWVHTVdGVFUvNFVMZ2lPcWgzLzBoU1phTVBF?=
 =?utf-8?B?TDVaUjNjZUdscWpnb1I1R2djeWZQdGxIckhTVVVmY0QwWVFWQlFYNGQvd2po?=
 =?utf-8?B?YlR6TVZFNzc1SXI3dVJ4ZkFRQThJNlRPUGVTbmI2R0MwaVRlTmpjczJwc2Jn?=
 =?utf-8?Q?A1AsSh2yWA2Vn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cytqOHZmTUFDcjRmM090cUVuVXRoZkVGM1NoVExpZkwrWmpWRnJwZFZmdFIr?=
 =?utf-8?B?MU9lUENnL0hlcnBFblo3VTVPT2hKRzhkNm9PcXZZeDdXWGZFT1dwTmZ3dTha?=
 =?utf-8?B?cGdJWUViRXZBWmZ3TjE2ZEFYSHBDc1VqYU5HMFBHUzRXd0dhd1BZb04yS3lK?=
 =?utf-8?B?UGxVRXpQZjIyOWUyVHFlVEtQVkJDemZndjk0Z2pSYlIzeFVTbHA3K0ZLSkJ6?=
 =?utf-8?B?Q0IxK1d4MW1keTkvVkJqcmJIR1BqWU1YRGR0U0pHUjUrUnkwaWMzS0tiMDhM?=
 =?utf-8?B?SThFRmdhS0xadWhxR0Z2OGFkUUhTTlN1eDAyQVRWZ0RZcVRVcmIwRnpwTmNC?=
 =?utf-8?B?emdxWmVOdmtEM2VCc2hlODN5UEZydDFvTXJJWklHcSt1ejlpRnltWTRFWGdj?=
 =?utf-8?B?QmhhQnNYT3FvakZMV2VjVCtHaDQwQ21IYnBSMmh3OTNqcnAyRmd5Rjg4Z3I5?=
 =?utf-8?B?M1V3dnJtbnZKOHpza3lkTEowRlNVcXVBUThGbmxJQmxVaURoWVNLSndhL3B0?=
 =?utf-8?B?T1B1azJTSDJZSVBYWUU0UGYvZERTT0pvZTlITkx0dE9YWnViaCtsK0Vlc05O?=
 =?utf-8?B?MnpzblJicXJzWlJ0MkJ4TFY2NnMrbXE3RnNoandkOFZyZVpUUVowSnE0ckhl?=
 =?utf-8?B?czRDdURyTVNIeXgvNHc3K1M0U2lMMWM4L2JqRUU5bk9RSkJITFBDeHBxQ1lj?=
 =?utf-8?B?WFZ5NE5OTks0MTdDV1NVUUEvMEZCSWwyd0xXUytvZTlkSTgwMWdodHB3a0pm?=
 =?utf-8?B?MGE0THI1TzVzUklHTStEM3N0c2kxZHBoTEp6NXJXRlp3TWNSaVo1d2RDcldY?=
 =?utf-8?B?TEZzaHVPK1FoeWVTeURRSGxRWTlLQlQ3RUZSNzlUUTJSME9RaGxEYXNxc2hT?=
 =?utf-8?B?NCtMeFh1VEhRODN6NFErenJuQU1VclFUdDUycCtCbDIweDFtNy91OE5LMW1V?=
 =?utf-8?B?Q1E4VXZJTnVGTjQ4dzJrY2c5eDFkeEhBU1NidHpEazNJTm9RUmR6VjZqdFlK?=
 =?utf-8?B?blR3ZDZlSnBYSjFwZ3laa2M5SW9iTG9BVjFUQjdVd3ZoVlpqMUIvUmNJek1r?=
 =?utf-8?B?L2o1VERXNVo4aC8xbm9oVVpnWkp5MUxaWGVHT2g2enk3ejZRU1VPSXRMZTQv?=
 =?utf-8?B?c0p4Um15bDhVK0lWcE04RTRLTmJpRHhVTzRjaE1veEIyTXZNL3hYaGg1QmN3?=
 =?utf-8?B?Y3hXNWFqYks4VDl1a28zamFPUS9rK1F2WWNxMkhwU2FXK1dvWEgwemd0Wk11?=
 =?utf-8?B?WTN6OVYxWFBwMDY3TzVVTWZJUFNUQjNkbnFDUEZGVEhaZEp1SlBja2pNNm1l?=
 =?utf-8?B?RktIZXBpSFVjZ2Y2Qkk1ME9XTTh1TEpValJKOEF4RnBHc0VQa3N6R1BkZW5N?=
 =?utf-8?B?ZGxZUDJDcVAyVUxEb004OXFvcG5KL0dweWVnWDdyV3FSTFFNYUZJQUVnU2JU?=
 =?utf-8?B?WkRtN09xeTNUSzRjUmN2NVJmc2l2QnkrbDZxUmRIV1A5S2dvOG9EZkhvSC9V?=
 =?utf-8?B?NUdhNWozNGlBNnlGZ0R0bmp5OFNoOVJNYVA4d2dqKzBEN29WSlpib0JNandp?=
 =?utf-8?B?YU1lZjBuQ1N2Q295cFo0SVdNcmd0S0thY1QySWRRZzZmSHRBaU9wUzdvYm1P?=
 =?utf-8?B?TE1BMTM0UGxNM25oeGFaZHRpekFvUHpDd3dMWThMOTFXYVNxc0RIaTZQR3h0?=
 =?utf-8?B?em5iejBvOVVSQzdjSEkwblBtZU9acUpjY3BzaE1xL2V3SUhneU1QbnRwbzZC?=
 =?utf-8?B?UDltWTZoZWozREU2TXlqeXlVUTkrSUtHYzRZdklMS1V2ckFxRHFHY0krSTZy?=
 =?utf-8?B?dFkzaXUrNTlGUE03RGZBaUZnNGdwTVFuYXo2dmxRd2NRQ3R5VFZsT0VtL1FY?=
 =?utf-8?B?cG5YNnUyelJxR1hJOXd1OGNPd21COTQ4Q0N6aDFuZTRldnUwa0lxN0F3Y0s1?=
 =?utf-8?B?TFE2N0kzeXFYOFoxWmNoMVlPYnRXUENSaksraHJtbFF6U2lITXZyMHpKeEFJ?=
 =?utf-8?B?b0ZqaVdJamd1SXBKV1NWejV0Ukk2WnhLZGxYUVZ3L1ZpbjVrY3VyQU5qZ1dn?=
 =?utf-8?B?R01iYzhPQVFFRitaWkhid0ZScTRGdEZ0RzBEMnp1RWR5T3RxNDNIZzJpVGNM?=
 =?utf-8?B?MTBrN3loWmVTdWhkWFNuV0tjY1lMQjBwc3pESjZSM2tlUi9tTmlaQXRYeTJX?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f6c546-34bb-472e-2db5-08dd725aa61c
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 02:53:01.7694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V834tHaUIBdM+QHL7PSowIL4J1aQ+7xugPPu6x5IiYgvaqGiXuhnr0zFX9q5DAenVcLgrGdKVKH+8ZeVmXu/KLRrZXHBVx9JP1PqnqTdkik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7171

Adds a driver for the ITE Embedded Controller (EC) on Portwell boards.
It integrates with the Linux GPIO and watchdog subsystems to provide:

- Control/monitoring of up to 8 EC GPIO pins.
- Hardware watchdog timer with 1-255 second timeouts.

The driver communicates with the EC via I/O port 0xe300 and identifies
the hardware by the "PWG" firmware signature. This enables enhanced
system management for Portwell embedded/industrial platforms.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---
 MAINTAINERS                        |   6 +
 drivers/platform/x86/Kconfig       |  14 ++
 drivers/platform/x86/Makefile      |   3 +
 drivers/platform/x86/portwell-ec.c | 224 +++++++++++++++++++++++++++++
 4 files changed, 247 insertions(+)
 create mode 100644 drivers/platform/x86/portwell-ec.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d5dfb9186962..c52f819786dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19132,6 +19132,12 @@ F:	kernel/time/itimer.c
 F:	kernel/time/posix-*
 F:	kernel/time/namespace.c
 
+PORTWELL EC DRIVER
+M:	Yen-Chi Huang <jesse.huang@portwell.com.tw>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/portwell-ec.c
+
 POWER MANAGEMENT CORE
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
 L:	linux-pm@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 43407e76476b..5b61ab422953 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -779,6 +779,20 @@ config PCENGINES_APU2
 	  To compile this driver as a module, choose M here: the module
 	  will be called pcengines-apuv2.
 
+config PORTWELL_EC
+	tristate "Portwell Embedded Controller driver"
+	depends on X86 && WATCHDOG && GPIOLIB
+	help
+	  This driver provides support for the GPIO pins and watchdog timer
+	  embedded in Portwell's EC.
+
+	  Theoretically, this driver should work on multiple Portwell platforms,
+	  but it has only been tested on the Portwell NANO-6064 board.
+	  If you encounter any issues on other boards, please report them.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called portwell-ec.
+
 config BARCO_P50_GPIO
 	tristate "Barco P50 GPIO driver for identify LED/button"
 	depends on GPIOLIB
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 650dfbebb6c8..83dd82e04457 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -92,6 +92,9 @@ obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
 # PC Engines
 obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
 
+# Portwell
+obj-$(CONFIG_PORTWELL_EC)	+= portwell-ec.o
+
 # Barco
 obj-$(CONFIG_BARCO_P50_GPIO)	+= barco-p50-gpio.o
 
diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
new file mode 100644
index 000000000000..59c51b80a148
--- /dev/null
+++ b/drivers/platform/x86/portwell-ec.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * portwell-ec.c: Portwell embedded controller driver.
+ *
+ * Tested on:
+ *  - Portwell NANO-6064
+ *
+ * This driver provides support for GPIO and Watchdog Timer
+ * functionalities of the Portwell boards with ITE embedded controller (EC).
+ * The EC is accessed through I/O ports and provides:
+ *  - 8 GPIO pins for control and monitoring
+ *  - Hardware watchdog with 1-255 second timeout range
+ *
+ * It integrates with the Linux GPIO and Watchdog subsystems, allowing
+ * userspace interaction with EC GPIO pins and watchdog control,
+ * ensuring system stability and configurability.
+ *
+ * (C) Copyright 2025 Portwell, Inc.
+ * Author: Yen-Chi Huang (jesse.huang@portwell.com.tw)
+ *
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/gpio/driver.h>
+#include <linux/watchdog.h>
+#include <linux/io.h>
+#include <linux/string.h>
+
+#define PORTWELL_EC_IOSPACE 0xe300
+#define PORTWELL_GPIO_PINS 8
+#define PORTWELL_GPIO_DIR_REG 0x2b
+#define PORTWELL_GPIO_VAL_REG 0x2c
+
+#define PORTWELL_WDT_EC_CONFIG_ADDR    0x06
+#define PORTWELL_WDT_EC_COUNT_MIN_ADDR 0x07
+#define PORTWELL_WDT_EC_COUNT_SEC_ADDR 0x08
+#define PORTWELL_WDT_EC_MAX_COUNT_SECOND 255
+#define PORTWELL_EC_FW_VENDOR_ADDRESS  0x4d
+#define PORTWELL_EC_FW_VENDOR_LENGTH   3
+#define PORTWELL_EC_FW_VENDOR_NAME "PWG"
+
+ /* Functions for access EC via IOSPACE*/
+static void pwec_write(u8 index, u8 data)
+{
+	outb(data, PORTWELL_EC_IOSPACE + index);
+}
+
+static u8 pwec_read(u8 address)
+{
+	return inb(PORTWELL_EC_IOSPACE + address);
+}
+
+/* GPIO functions*/
+static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	return (pwec_read(PORTWELL_GPIO_VAL_REG) & (1 << offset)) ? 1 : 0;
+}
+
+static void pwec_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
+{
+	u8 tmp = pwec_read(PORTWELL_GPIO_VAL_REG);
+
+	if (val)
+		tmp |= (1 << offset);
+	else
+		tmp &= ~(1 << offset);
+	pwec_write(PORTWELL_GPIO_VAL_REG, tmp);
+}
+
+static int pwec_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	return (pwec_read(PORTWELL_GPIO_DIR_REG) & (1 << offset))
+			? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
+}
+
+static int pwec_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	/* Changing direction causes issues on some boards, so it's disabled for now. */
+	return -EOPNOTSUPP;
+}
+
+static int pwec_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	/* Changing direction causes issues on some boards, so it's disabled for now. */
+	return -EOPNOTSUPP;
+}
+
+static struct gpio_chip pwec_gpio_chip = {
+	.label = "portwell-ec-gpio",
+	.get_direction = pwec_gpio_get_direction,
+	.direction_input = pwec_gpio_direction_input,
+	.direction_output = pwec_gpio_direction_output,
+	.get = pwec_gpio_get,
+	.set = pwec_gpio_set,
+	.ngpio = PORTWELL_GPIO_PINS,
+};
+
+/* Watchdog functions*/
+static int pwec_wdt_start(struct watchdog_device *wdd)
+{
+	int retry = 10;
+	u8 timeout;
+
+	do {
+		pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout);
+		pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, 0x01); // WDTCFG[1:0]=01
+		timeout = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
+		retry--;
+	} while (timeout != wdd->timeout && retry > 0);
+	pr_info("Portwell EC: Watchdog started with timeout: %d seconds\n", wdd->timeout);
+	return (retry > 0) ? 0 : -EIO;
+}
+
+static int pwec_wdt_stop(struct watchdog_device *wdd)
+{
+	pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, 0x00);
+	pr_info("Portwell EC: Watchdog stopped\n");
+	return 0;
+}
+
+static int pwec_wdt_trigger(struct watchdog_device *wdd)
+{
+	int retry = 10;
+	u8 timeout;
+
+	pr_info("Portwell EC: Watchdog triggered with timeout: %d seconds\n", wdd->timeout);
+	do {
+		pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout);
+		pwec_write(PORTWELL_WDT_EC_CONFIG_ADDR, 0x01); // WDTCFG[1:0]=01
+		timeout = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
+		retry--;
+	} while (timeout != wdd->timeout && retry > 0);
+	return (retry > 0) ? 0 : -EIO;
+}
+
+static int pwec_wdt_set_timeout(struct watchdog_device *wdd, unsigned int timeout)
+{
+	if (timeout == 0 || timeout > PORTWELL_WDT_EC_MAX_COUNT_SECOND)
+		return -EINVAL;
+	wdd->timeout = timeout;
+	pwec_write(PORTWELL_WDT_EC_COUNT_SEC_ADDR, wdd->timeout);
+	pr_info("Portwell EC: Watchdog timeout is set: %d seconds\n", wdd->timeout);
+	return 0;
+}
+
+static unsigned int pwec_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	unsigned int timeout;
+
+	timeout = pwec_read(PORTWELL_WDT_EC_COUNT_SEC_ADDR);
+	pr_info("Portwell EC: Watchdog timeout left: %d seconds\n", timeout);
+	return timeout;
+}
+
+static const struct watchdog_ops pwec_wdt_ops = {
+	.owner = THIS_MODULE,
+	.start = pwec_wdt_start,
+	.stop = pwec_wdt_stop,
+	.ping = pwec_wdt_trigger,
+	.set_timeout = pwec_wdt_set_timeout,
+	.get_timeleft = pwec_wdt_get_timeleft,
+};
+
+static struct watchdog_device ec_wdt_dev = {
+	.info = &(struct watchdog_info){
+	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
+	.identity = "Portwell EC Watchdog",
+	},
+	.ops = &pwec_wdt_ops,
+	.timeout = 10,
+	.min_timeout = 1,
+	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
+};
+
+static int pwec_firmware_vendor_check(void)
+{
+	u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH+1];
+	u8 i;
+
+	for (i = 0; i < PORTWELL_EC_FW_VENDOR_LENGTH; i++)
+		buf[i] = pwec_read(PORTWELL_EC_FW_VENDOR_ADDRESS+i);
+	buf[PORTWELL_EC_FW_VENDOR_LENGTH] = '\0';
+	return (strcmp(PORTWELL_EC_FW_VENDOR_NAME, buf) == 0) ? 0 : -ENODEV;
+}
+
+static int __init pwec_init(void)
+{
+	int result;
+
+	result = pwec_firmware_vendor_check();
+	if (result < 0)
+		return result;
+
+	result = gpiochip_add_data(&pwec_gpio_chip, NULL);
+	if (result < 0) {
+		pr_err("Failed to register Portwell EC GPIO\n");
+		return result;
+	}
+
+	result = watchdog_register_device(&ec_wdt_dev);
+	if (result < 0) {
+		gpiochip_remove(&pwec_gpio_chip);
+		pr_err("Failed to register Portwell EC Watchdog\n");
+		return result;
+	}
+
+	pr_info("Portwell EC driver initialized\n");
+	return 0;
+}
+
+static void __exit pwec_exit(void)
+{
+	watchdog_unregister_device(&ec_wdt_dev);
+	gpiochip_remove(&pwec_gpio_chip);
+	pr_info("Portwell EC driver removed\n");
+}
+
+module_init(pwec_init);
+module_exit(pwec_exit);
+
+MODULE_AUTHOR("Yen-Chi Huang");
+MODULE_DESCRIPTION("Portwell EC Driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

