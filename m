Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023104.outbound.protection.outlook.com [52.101.127.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB85224AE4;
	Thu, 24 Apr 2025 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489703; cv=fail; b=bJKgAnnukvzF+ZAL8MLoLoOg2Q38I/yGIdGqR+Mc20c5TtMr67CKcXnAQiL3d4uprKSi21BGjrroSQB131YfQO1my7lJFiT9a0Z9YikLY7I96tOuJd/fFkvIssrvnOYSpVoAdu/tRveSOXQct4fMIfKFNimTuyQW3iKkMmhpm/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489703; c=relaxed/simple;
	bh=YQRdCzmgD3bjE+qY7keC2ICk1tUiKpG9LxDhLe/lvb4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Vf2x/CNHvwCS/jjsdoaMVnj1cnsKa8sJBzdgLzzsY09dVhHAsZ9PoIr5YDMFkNR/LJ1JwM+cGuLIfMRJJ5tIo38FM/wDkEiutRD75ZtTdltDxnsQrf+17zNKl82+39ekDCc+cGu277BWs0RiNVqkRACQKcmBj944EmKQGWDUqQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com; spf=pass smtp.mailfrom=wesion.com; arc=fail smtp.client-ip=52.101.127.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesion.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuTUgrBm/ROxHsZx8K6j63uZNsTx6nzB6BE1qvK9AyHiCtMb+zQnvEny5mB3xI3/BfQsYW6gJAkBx4FI7bQmHyptbz7LMtKgjU58OeMrjApHgkK5cjPtmduBMUnnJ63lLm9uFuImcw9V/AWoCO4IKsHcE9ouIOgErgC+2HXzkHODKcJYt7FmCm5jAB8I0RTQY4tNYEycDeGuT42h4nBqhPIUhUnAshcCV1FZ9ZHldtmNaIh01RRtZ+RyOeu0dDDMukQo4uFtZS8cmkyqdIpKdqh9mXSQl9CYSW/LXjuueOXcqlvs3LWFRak2AdSUJOdfDM5J3NWSOaFyNCAlRhoTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXQunH9q7UHvEsNQC5kYOB4bg6opcZLh8pzKVskyqlQ=;
 b=Z2Y2XkBfS3gA7B4rOjjMGPIJtLKOqVYVoC6QI0k8toX2KiMHAoZwecwqBlLB0KzPAqUnhSDiP6uHhzKh6gsO/lbDNCVJhIojOhtPdi+5ZTpkRYGvW+ZDs9NooEoB/nrSkaiLryFKtSQHFNJX99EmEe0SOPVejSDrHVphgmxd0GbjcfKC5vdzlCCPRutaWudgwhULO1bPsqWN2UAtZRkKQG8Pl/QDwVAoLxkFr6kV68PfkT0+2rC3aE8P8rLD8/ZO2OPSih5C8aO12WI0Aa3IUFlf3b7i19jEbRD4qqhrpspO9H9fKcZa1TofI0OiWvrLh9/DNEoJTwIlxXZjEPz8xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from TYZPR03MB7001.apcprd03.prod.outlook.com (2603:1096:400:26a::14)
 by TY2PPFC1C818470.apcprd03.prod.outlook.com (2603:1096:408::9e8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Thu, 24 Apr
 2025 10:14:56 +0000
Received: from TYZPR03MB7001.apcprd03.prod.outlook.com
 ([fe80::78dd:5e68:1a9c:36c0]) by TYZPR03MB7001.apcprd03.prod.outlook.com
 ([fe80::78dd:5e68:1a9c:36c0%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 10:14:56 +0000
From: Jacobe Zang <jacobe.zang@wesion.com>
Date: Thu, 24 Apr 2025 18:14:42 +0800
Subject: [PATCH 3/3] arm64: dts: rockchip: enable HDMI out audio on Khadas
 Edge2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-edge-v1-3-314aad01d9ab@wesion.com>
References: <20250424-edge-v1-0-314aad01d9ab@wesion.com>
In-Reply-To: <20250424-edge-v1-0-314aad01d9ab@wesion.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 nick@khadas.com, Jacobe Zang <jacobe.zang@wesion.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=837; i=jacobe.zang@wesion.com;
 h=from:subject:message-id; bh=YQRdCzmgD3bjE+qY7keC2ICk1tUiKpG9LxDhLe/lvb4=;
 b=owGbwMvMwCXGEJfeJ5AmN4HxtFoSQwYXv/jpDhbrop8Le/d3X6ttWsy9KvJtrf6n7T/Xpld25
 7y3mVrWUcrCIMbFICumyCK1TFQqwp03bevy+G8wc1iZQIYwcHEKwERE7zMy/GxsiXzHV3LBmm13
 6MUDXOfiM/d7ae483Nmd9WfR5SWf5jD89+K7vT64/l/A5OQPD+6vTBMqq95x/aiun4Fh+9P5SoH
 B7AA=
X-Developer-Key: i=jacobe.zang@wesion.com; a=openpgp;
 fpr=1AA6151A58470D66B5A75FF6005E678E10661E90
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To TYZPR03MB7001.apcprd03.prod.outlook.com
 (2603:1096:400:26a::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7001:EE_|TY2PPFC1C818470:EE_
X-MS-Office365-Filtering-Correlation-Id: de3888ee-ba50-4653-281e-08dd8318dcb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFR5aGI0ZytxRTlpRUdseitDMWx0eC9BNWZ6aTM2WFhQNmtvbmdubGVIdThU?=
 =?utf-8?B?SlV2OThvQ09GMHNBOFoxTlFxYmxOcmtwNERUbzUyVUQrV2p6SmN3SStyR2Ew?=
 =?utf-8?B?cHp0RVZFK2cyTFh4cFhVRjdGclh2ZytYekdLUmRMVGo5TkxiU2xZL1dvZTl2?=
 =?utf-8?B?bTZ6SDcxWW9ZVWw2NTMrVHJYTE9MTzJURXhuSGZFTnV3Vm1qd0FDR0I4Ym1H?=
 =?utf-8?B?b3ZUNTJudUxUZFVPMmxtMFF2bUk1ZERhM2w3NWlRYWFaa0c4aExGSEdaYnBB?=
 =?utf-8?B?RUFTUnZZZVAwZittd3lqZnlBdzk0YU9xc1NhRFkxc1UyTGQ5SDYyZFQwRGpi?=
 =?utf-8?B?ZXl6U3cvTnZzYlFHMHZ0Y0dIemk1RXEyek1Tc2pMYnVFYlRlaUhVRkZ3S2RK?=
 =?utf-8?B?d0dvOFJ0U0k4cVQxV1lPZnFhL0lPbTJNYWl0aUY1dy82MkJTaEpReGxyTGNY?=
 =?utf-8?B?bDVZMXNyMHhpb2FDZWRsUk1FYlJ1T3llc2hJRDFMeW0veTg1dHk2U3FvSTQw?=
 =?utf-8?B?djU5eU1wZ2pvWEI4RlQwSGFtbmNpaXAxRjU0UmkvWnZsUHFqVEovMTlTWjkx?=
 =?utf-8?B?ZW1KeEx6TzFxR0xOdTJGTGxpS05Fb0ZLUFFTRThSZWJTWldFQUZNUUpvNU5T?=
 =?utf-8?B?OWNrU1doT0RtTm81MUNXYTVEUUsweEhOcVhQWElMa2oyZTZIQkRmc2xoZ0hH?=
 =?utf-8?B?SHhsUTNBNzQ4NUllaytPTU52Q3RicHVCM0EyclNZcS9wK0huWlFSbGhtV0lD?=
 =?utf-8?B?S2x1QklkZEFTZnJmbHBsenRET0xISGRNcjh4THIwRzhINFBCcVBnTUVQVzcw?=
 =?utf-8?B?am1oWEpDTzduVnJlei90SEdWMHFrUVkwL3VjSlduMjdZV3daeUl2S3BWOW0z?=
 =?utf-8?B?QmhxV2s0L0FLakZyK3EydnFRZ3FWbmxLT2xHTEZxWEtTSzd3U1hRL2hLN2xQ?=
 =?utf-8?B?R0FrejZsY3o0bUxsLzBHTStpM0hkSG5QVDEyY0oyWnZDT3JCTlJsVENLcU5Q?=
 =?utf-8?B?VDlFNTdUYncwZ3U3RGJEWTAyaElBcmh6ejR5aVNBdU9WNElaa0wyaU9USURM?=
 =?utf-8?B?QmRjZ1U4bXB6Q0wrQjNXYUNLMHVyTng1NlBUZkFVdHNTeVdoSHNjcmpUTDc5?=
 =?utf-8?B?cnZhbzRxd0tiTTBmUFNpdmNXbE9kVmdpNGI5Qnl4MXBWVzZIZDIrYzJnMFhp?=
 =?utf-8?B?ZHBJUnoyTWx5ZTBjOVpPRkVyQ3Vtd1FuN3NSYVJWZkhjZzdVaXE2MHFaY1pm?=
 =?utf-8?B?U0lCLzV6bk1vQVg3dDB6dXZXM2VMTHdYeUNVRmhvQXB2ejB2dXgrWEQ1Z000?=
 =?utf-8?B?Y2dlSmR3b3dTRjZyc3lMTXIvelB1NVQ3YTZmMzhXTEplSVhESVRCODREaFly?=
 =?utf-8?B?TS9oR1FvT1RNRUM4VVpZUTJzaHVsV3RiRWZ4bmpoQ3U3ZjEwaXJmN0U2ZHZP?=
 =?utf-8?B?cDloMEVISFl0Qjh2UVZtR1NQSGpmMmtlWTF4UnNaZlZiNi9SaU91VkdGMXJj?=
 =?utf-8?B?MSsvSGFSSjNzVkJ3YTNpL2cramFBVXJ4WjhlMlJHbEQ0NEVHK2RDeSs5MUZm?=
 =?utf-8?B?M1AwcnQwc3R0ZTBPeFF1Y1lFWEFZaTcvYW5xNlEzeENVVTFubkhtODV2MFNn?=
 =?utf-8?B?cGw3YWUxd0tUOG5OQTJpTUJyc0JkMHgxV0dUV0xiZi9BSnU5eVZsTFE3cEJx?=
 =?utf-8?B?SEVRdjc1TzdpVzB1TmdqLzhOYmpKNmo2Y0dWbHVxdnBIVEdhT0M3QjBxUjV5?=
 =?utf-8?B?N3JYNnh3K2tmazVrblJHNmFLOEVPb0c5cjMrUEdrdFIvRkxhMTA2WFZmK0Fo?=
 =?utf-8?B?eXhaVFZWNm10TjVLRVZUdU5MMzdFMXByVHllZ0IyMlp3MU1EeUpmU0kwQytN?=
 =?utf-8?B?dEV4Y3QwczBOc0VmV2RRUW1penE4WEpvM3BtMkkyMXdsRFpsZTl4ZDRaSVhi?=
 =?utf-8?B?Y0Iva0NtenJEYTNhNENIU0todVhYQVdIQk92VDNMdFFwdUl0ekJMbTA4djVl?=
 =?utf-8?B?ODlTTmh4eUR3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7001.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enZESzZwQWkwbk9ySWhnNldacE8vcFNuc1FWYmM0QVJlQjR3aGU2b0VOUzll?=
 =?utf-8?B?d3ovNHMzV3ZOd0ErQWxKUktGU29UVmZTTVZCVDUrSEJBT2VsTFNGdDdPdmJQ?=
 =?utf-8?B?T2Q4QjdKSVdVRmk1Yk1PQTI4SE00SVJkZG5yUGs4VVBLTk4xL0ZuT0tzc2V4?=
 =?utf-8?B?T0Q4ZjFjaERNS1h1Rm5XclZOWUJDNFNwRGpDR0dBYUppQXVEdDRNL3FNY0xK?=
 =?utf-8?B?b051cmlJek9UWGZ3WEg2SzREdEUrTDVuRXFXc0lveW9HdmM5RlB0NXRMcEUy?=
 =?utf-8?B?NS84dk91a2pxb2p5YTJFcElXc2VEOHVUVERHaStPZ1N3SjdMd0o0dFBwTm5k?=
 =?utf-8?B?NFQrNmRxa1Y3UWhyVXJGVWdRTC84Ly9JVVl0MkV2eEZYT29LbWhDcnRRVTJL?=
 =?utf-8?B?MEc4N295d2h2aWIzWFpDVnJrczM2WEE5Qmg4YlY4M1J4NkZiNGtHTDN4eEY3?=
 =?utf-8?B?L0VxaTJSMThPYjlZMEU4VjBPR2V6QVA4alpFK0NTdEdkTEZ6TU1TMTNuVElN?=
 =?utf-8?B?VTJaUm44QWpoVy94ajRlVmFkQkxRV1l5Y1l5THB2UTB1UUdlcDJrRHhJUTdB?=
 =?utf-8?B?RUU0c3FuSEhmd1BmR3BzVkZNakx6MGFKOEY4OVJMUjNRQWdzaTFOM3UvVUhG?=
 =?utf-8?B?SmdweSs5MWZuTU5BSGU4UWxqSDdUa3Ivd1Vsd0thS3MvcDdpeldwU05JemNh?=
 =?utf-8?B?Ym01Q0lhdnR3SndBclVaczE1S0RIU0tUb3pFaU5DQk8zQ1V6RTh3cVZPbk9m?=
 =?utf-8?B?Nm9JSVBxTGlRSVg3RUk4MDJjTVNLTEtndjVmK2RzeXFXYzRvVzZ0bjRrdW5K?=
 =?utf-8?B?VkdwT05JRWt4UDNxTUFlaitmSXpPSXRyNjVpcnVmOHlkN09LSXlMNE9Va2Vx?=
 =?utf-8?B?bU5pYUIrSTNFRmpSRHNFS1JqckJrYnV0QnZTdmRnYnNUSWc3VmIveTdORjc3?=
 =?utf-8?B?ZXBMa0lVMWlLVGFmZ1lheTFrM2c5WkVtTElaYnlieG11Q1JXMTZhTFFrVXVC?=
 =?utf-8?B?N3FieHkyeVNVOXN2M0JUbUdOakkyRVladlNnbk9UNFJzRUhROXZrS1hyWUo4?=
 =?utf-8?B?c0Z5QjllT3V6N1lwWFlXdy9IWlBQcmRhWFZYU2MvSmRZRTA5dElJLzhjUjZr?=
 =?utf-8?B?d1ppTHoxam9CRXNmY1FpVUswQUY1cDQ5RE8wdXVBenhVa2JjeHVDMXJQT3lJ?=
 =?utf-8?B?c1hXVU95amxZNmpITmsrWmYxZzFrSUpSa3Q4R3l2d2UxcVhMNEVYRVN4SnNI?=
 =?utf-8?B?NkNicitOb09ocy83MlFWMGxRZDh3eDNwZFFmanJONG5veUlxNUE0cWVNaGRG?=
 =?utf-8?B?SnUydjRkTzljQTdjOEFvRVVNdUtUSFFKVjAwZW5LUVFJVXljNWlHTUdIamhR?=
 =?utf-8?B?bmtaZUlXZUtuZmtOMHNOOEoyNjNIZUZZaW5FRUVTa2Yyem96a2djakM1eFlk?=
 =?utf-8?B?U201NVdQV1RXcXorQk05bXVEVWF5K2JhQVkrYUZFS3l3eGJEd0FlaHJyVmdq?=
 =?utf-8?B?N29Cd1JTY2pBalZCRlJiRGI2YWs0RmtGSGRpOGU4MDNMbXJ5Q0pIVEdqU3Ji?=
 =?utf-8?B?MFlLSnR3VDJqWENsNmVoMXVzZjdHMnkzTXBvYTdTNDE1bWNpTWpaSnZuY3VB?=
 =?utf-8?B?U3N5bG5laWtzRTFuSDhmczdZSlFwYjFFaGNXa05WK1UxbWdYRklEaVlqRHFE?=
 =?utf-8?B?TlNCdHhLME1iNEQ1dkZXcVZMbWttclBDWVdsK0xubnRFaFV4NFh1QjNqZWZx?=
 =?utf-8?B?QUFIZTJuaUxKV3I0akE1ejZ5R2ZGTVJiN0NoSWJqOXBYLzU0bC9Qcm9KNnpi?=
 =?utf-8?B?RWhRaTJDZ2cyeTNGSmhCTU9kVTJ0V21aM3B0aEUwQkc2Vm9zS3RNUitodmJ0?=
 =?utf-8?B?NjhRcmJrNXBwa0tUOHVuN3VnbHduOGNkTldYemdkWWEyVEdjajd5RDF6cndU?=
 =?utf-8?B?SVhmU0pZZWtZSG1IVmF4eEZhOVYxYm5wSVplQUo2dWpYMU9iOG53TlRBV2h0?=
 =?utf-8?B?WldoSENtbytTMDNrQmlCNTdtcHBuaUl4OGpNMFpWcElNUWJGS3I1MkU5dGE0?=
 =?utf-8?B?bGFzVzdrMzIzSWZZV1lsN3BNRS9Gald4MnQxODg0YkViNHN4RFdQK1JLYVpN?=
 =?utf-8?B?QVdMYkpFQm1zNEk1WHQ0SytYbW1UZC92RkxhK2tlSXNVejh6cXZFTnRHenQw?=
 =?utf-8?B?L2c9PQ==?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de3888ee-ba50-4653-281e-08dd8318dcb9
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7001.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 10:14:56.3066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bm+/M0o8vd+X76T5bh7sJHopDVJnA/Xa1ZjEkcVY32xQ6GKbv90IDmdy5tLhfJ+QAsOFjpJEtc16dXHLDthP6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFC1C818470

Enable HDMI out audio on the Khadas Edge2.

Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 7aa93ab3bc4b..2c22abaf40a8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -217,6 +217,10 @@ &hdptxphy0 {
 	status = "okay";
 };
 
+&hdmi0_sound {
+	status = "okay";
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
@@ -269,6 +273,10 @@ hym8563: rtc@51 {
 	};
 };
 
+&i2s5_8ch {
+	status = "okay";
+};
+
 &pd_gpu {
 	domain-supply = <&vdd_gpu_s0>;
 };

-- 
2.43.0

