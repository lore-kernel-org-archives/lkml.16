Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B8482F2;
	Fri, 20 Jun 2025 03:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750390742; cv=fail; b=H+ZelRA83DqlptYRLGPGpnwz1N+Xq9ATic4iwOjEWqDdio1MYkZ3Lo6q093pcZEiFMtHqonC3JKWjqdT4bHjuqe5IijpygU1Df1cRVps4Vq4mecyLHpkQaa/pGl698nEzMyXzOMfUlNStqREu0s49R7x4AfGNy33vOW/nkkVkPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750390742; c=relaxed/simple;
	bh=wH9VxVGzHnfGBgNvNiOHJWzXcHeDT3PVP7jqpJg9OC4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Ftk7LvwFjChCxSLxmqJokS+/z+F0+9c0se9xShIy3gEdF2e5Gp/BHVIwR2XabHIm4KDhj8REkIGWr44v8tqw9wRIJSn8p5OWtrO7W02vCJbt9XBqRjadS1qO3MJLNnaKy5LVrdpN2xQacGFrNt3+v44TPEsqwDkixKQwqShYV9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Bdt8L6/A; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Bdt8L6/A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LIID1FXJRHoDly8Tmcdhu2egp2N4hKuPslmTYEdsk9LWDMLmAuFPUKOInZjLbeeO4zWUspmjCer1ebS2WaOv+Jztw8PVW+S/6cWm/KiXTPy7Er00pQHfbgb7mJ8xdUJkIvxeBQ4A0huOGaScX1C+1FohkksDHN3RC4viwM0VfyGsgeTeLETzHua4eFFFt/sS75aE4B8MKxR4LSVowOwPU6WRqjof/aQEru+9WWoUU+OUPi0LZ8mPI2p3Qp7YNkNfZQG2ekjnPo+9WdXtcya73XoAPEAeVl+PNZapex+PpNTcgujS4Ue7S6AZf2LMLxGFsjv/owGVd42DYudZWACyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Td0zMNLzv/KqjIcS1SOACXqx0uHC1b01ig2D9+RgxEA=;
 b=JojdiTu+3ama6BEoH5mE6p4feVEhTQ+C5LLvYWBd94UwRPoe6pzEBkk0WCBsXxCWSwJNIxkTZTtchdyX37MJu8XYcu+WobfetHof1MxyyA/DKYrN7G0erD12joUk1fDljLVCbYH/RHc705tyrEaLKD25aBO3NcDjB23/LqMMtI94shKw9zdlDoZhLbuhYbfLzOQ2JQiHkJ9+SgvQ1TK1epaVSvahYdQBWumHJWkYGhDZYWAmG4bi5gXWe+2ih40ZmuFLouyNdVxUhwPibgkGvuDA3CGiF0OJBt1JquLdbNpOpPqF7evrd7scMj6m/YPs9u46GCKEDl4zBdDOtOTryA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td0zMNLzv/KqjIcS1SOACXqx0uHC1b01ig2D9+RgxEA=;
 b=Bdt8L6/AcyqLXDllH/HwUacMwE8mGwecGJEamBnJqnj5VnXuaS3L0musITbDXIEEUDpG5Cgctu9GkezHloAINlKfGiiUFLMyLfSgx4BoStQbgS+CRmZpAtMYmWLBql93cNNu5Hv8YnI4uOPasw68j7JwK+Q7ZoQ98u/EmUIyv4C8nYJ99Z1684Jf0AVirLpQPlGu4AfeqkIMorwjgQ+dbEDx3ASOApdqod7UGj7hqFebSx/F0FgkkVnb1XEopzdVs8PRfXoC6yVhPvRSMlOEewYRmQEFh2+z2Zk867JlflA9lLpTfYQHKV2ey/ZlexK/or+MqoQzmj2aAZBF8cT+5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7369.eurprd04.prod.outlook.com (2603:10a6:102:89::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 03:38:57 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.021; Fri, 20 Jun 2025
 03:38:57 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/2] firmware: arm_scmi: add pm ops for scmi_power_control
Date: Fri, 20 Jun 2025 11:37:12 +0800
Message-Id: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGjXVGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyMD3eLk3EzdglxdizQzQ3MDczNLI2MDJaDqgqLUtMwKsEnRsbW1AAj
 OijJZAAAA
X-Change-ID: 20250620-scmi-pm-8f6170769230
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>, 
 Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750390643; l=1581;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=wH9VxVGzHnfGBgNvNiOHJWzXcHeDT3PVP7jqpJg9OC4=;
 b=BIMNHXveFFfxyliHnMNiVcVMpabpNUfurMU6/j2d5MHec2kYlpKRLEW98d0wFRrTKr93hc0IN
 kSK4qQyGeq4BJH1C4diJWZWT9nH0npmjFoFJGKxdp3GCNhCRqCvQn4q
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 8441e5de-d3c8-46c2-82fb-08ddafabfcc7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0duUjlOQU9DaGpEQktUZFlDaDgvMGlVSllsdzhNMVZqNFNiWjluQWRDOFNO?=
 =?utf-8?B?dXAzMFErMGZpZUVlMVJoOXV5ZEc2RmZwQkFTZmJBZnk0QzM1SUkyUktQTm5N?=
 =?utf-8?B?bElyeHhuQ2JzWmRnMU5lcVc0b1RMeHJvSzV4cFRmSWxmbnlUeS9EUlhqSVY0?=
 =?utf-8?B?ZnR6c0RMWUpYZWVVcnp5dm9BNzljOFRLZnExbEdObXIyeVNVUVUvZFhadlNG?=
 =?utf-8?B?eFhCamJhZy84VjQwNk9MSTkzTTJxZEV5TWtsZEdSa3hjTm1kK0Vyd25KY2Uv?=
 =?utf-8?B?QktRUWtEbFVmSzFCdDhBQ0pqWkdidHArUVNGYklNUVJEdlQwMk01MVJLTDRI?=
 =?utf-8?B?bUV0Sk9oWjJrSUVoMlA4V05RdGRBLzQrbm1SRE5kWTNEYXhHVXhmQkQxSjBw?=
 =?utf-8?B?TXN6bmNVV2tWNmp5dUs1WXJBVERhekdDWlF1clBQUXFYM2pmakw0bGlxenVR?=
 =?utf-8?B?MDI3Zk9CV3NKd05xTURDMTdkcVcyVGZQa3MvWUo5ZCtBWmRzWGwyWDdEOHoy?=
 =?utf-8?B?ZXI5amdaNGJVUE9SZDVYeGRJa2djQkh5VzVTQXBaenpuclpEYVFhdTRyN1k1?=
 =?utf-8?B?eUk1SXJEQjdVL0NmWmI5dnZVNi9uZWRkOE9WbW5VYmtMT1MwOXNsbjZuUGJh?=
 =?utf-8?B?U2g5N0ZRWUVkeHJZbGhsbXQ1MDM0QUs1UEVnNjhrTGF3Ry90MjA0UHVXZjls?=
 =?utf-8?B?dGpBQ01TR0dTcE9aRlRuZzA3NGVLV2Y2SkMxT1M3aTQ2cHZwcFN5S1dxUzVM?=
 =?utf-8?B?cUhleWo4VGZmdS9QMXVITjhRM3hXOEZESjVJbGRIa01sN3R1YVBXSVVObS9m?=
 =?utf-8?B?WVVxekQzZWdtclRqVkI2V1lycjJjV1pyWmU4bmR2VWQrRlFIUmpjZExJb096?=
 =?utf-8?B?MWVmbFVqNjhBRDc0aTNKajltc3VGbVJiVzNhZmkxK3c5a2lSWVhjdUJZd1ZE?=
 =?utf-8?B?UUhjVEg1SThsck5pNFpNakF6L1Q3YTFVaFRiS1RmVGloRWJXeDNDVWRrR2xU?=
 =?utf-8?B?Y2piSUV4bVdwWTQwelh3bzl2NW54SkUycER1SnBNR2FCaHovZWhFcGlZbGhN?=
 =?utf-8?B?Y1RpSDRGeUplRzFHTHVnUDJZVVd4RWVZMlpNUXdaTkh4NHpTbzVHd1NlalVO?=
 =?utf-8?B?WXJIYlpnVDNFd1NNY0tHb3NpNHhXSUVVMlhpVUpQTUpyc2gyczgzUkgyeWFp?=
 =?utf-8?B?NVc4bjMvbk0wMEdiVXdEeHNHbm0vSUJqNDZhMXdNSDcwZ2M5a1M2bjFJVVE3?=
 =?utf-8?B?NHVzbHBsNVZzQ3pOa0VidW5Jc0MveHEwa1g1OU1nK0VvQXVBaHR4WEp2ejhn?=
 =?utf-8?B?REZKSk1PTDYvRi9vNHNBTk1uQ2I5ZE1JNG9GeHRqalFsZUxkTUFZR2J0Tndo?=
 =?utf-8?B?MHZKQ2dOUjcxbVdheGVBRlVKUDhxZisyeUtqZ2liUXYweWJCUDJtSTFqS081?=
 =?utf-8?B?NVFZWmsxVkluRGJaMGNnc3JQNDJuYkNGZlBDRGxQOTdvUEVCWk1oOHpjYUVm?=
 =?utf-8?B?Vm13aGhnZXdhd2FpL0E3dEoyczlwdXQxdnRDYmo2ZW55QXhpdXdhMlpaSmVj?=
 =?utf-8?B?RDB6cWFENWVOY3REeExGUC8zWTlUSXlJdVhPSzY3SVpHTWtsZlZwdE43UUNW?=
 =?utf-8?B?V0NKdmJWeVNUYi8wL0Y2bnNUV1AyOW9nUEhCR1d6MTEwM2Y3U1BpWWxSSUJz?=
 =?utf-8?B?MlNZMTI4VTRZKzhpZ09XKzJXRDM5V05EZHNsUXdqc3kxMGZHOVhjVHByMklQ?=
 =?utf-8?B?Q0pRQUJ0OFNSZXVMTjgwanJaaUVIVTdOaFJ1ZTlZUERwQ3N6NHRzdFBDOFBV?=
 =?utf-8?B?TG1uWGIrV1BUSVVUb0FRdWVDVklZRVlwUnhsS0h3cFBmOVdHcTB4c1MxN0JO?=
 =?utf-8?B?NjJ4YTF4b0h4bUlHSzNSV1J1Q0tkY0Z3V0t2MHN5Uk1wSWdoZThYV042SjJX?=
 =?utf-8?B?ek1DVWQ2cTNRVWVFdWNTNFVnMlp2Z25JM0lQWlZWTGhhRU1heS9JTVRUUTd4?=
 =?utf-8?B?OFFOMlgraERRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjV6Y0RPaW12VWlIa1NJVmdwTXdVVnVNOVY5OHNEUlBlcUxUbm42MUh3bmJO?=
 =?utf-8?B?Zng4N3lhYUlvK05YUzZ0ekNoVXZuL0ZsL2kvMWtIRE1xMUl2Q2QrTHJXYk05?=
 =?utf-8?B?alNYdUd3SGhqSzY5MkF2TkhDNGd6c0duN1d3b0Jjc3RZZjVJN2RObVl5bDh2?=
 =?utf-8?B?VW1BejFyeUJXT0pLSW1iNDVBaldZN294N2pIdVgwNnR0Y3NsNnB6L3cyZDVI?=
 =?utf-8?B?Q1RXZEdxSHFJYm80bXZCVDE4ZWpURXlTeVpBQXNYN2h4Z1kzeW5iVTVBTWFN?=
 =?utf-8?B?ZmtBSWp2MmNxaHJXYzNrMFJHQ2hNcjRPRGI4ZTBiYk41ZVJlTWsxVmlRUDho?=
 =?utf-8?B?Y1RTNktpRnZpOWxNRjdFbHhBZVVyK0tCU3hkdXRkWmtDS3VZQmRGbFN0Nmdm?=
 =?utf-8?B?UW1DdS9GOERCdGJMSHJ4MU1rbEhYRlNKYjd1aVN1T3oxMkFWUHZiRklYOHUz?=
 =?utf-8?B?STRPc1J1cHl0ZklkYk81clM4WkVPY2NnR2I3VFo3amVmWFFNbWhwRmJzaW56?=
 =?utf-8?B?T2pVZFNOeDFUSXlERGRBb1JTazVsM05qTmlPMUdNbHMrZld4Qm90Yk5NN0RB?=
 =?utf-8?B?dGRlOWIzVVBNa3ZRRHpOa2RxYytTZTg3T3J2NWlyUW95aVdMLzVaVlBTQStD?=
 =?utf-8?B?Zi9HbnNMVVQ2dThUNllKV2xwcnZ5RjhFVFhqTWNPbnhobGUvNnJYTm1xMXJU?=
 =?utf-8?B?ckhtN1pFd1hFRGxyYjZhbGtyeFFZNmFpT1VHUlpLNDlBcmVOblRWOGErL0Ir?=
 =?utf-8?B?NjFFL0hldlkxTzlUZzlmVEdibFVvNWRUQlNOZEkwWDlBNmhGTXVrSE0wcFMx?=
 =?utf-8?B?TkNPZk5jRVYvSjhvZVhON2RxYXVHdzlwNUh5UWNqNG11NEV5UDJONGJVcmdj?=
 =?utf-8?B?QVBBZ1hIenlOM1h3SnVzaTBrRFZlNGxVcHlTVFRrR3RGQUQwRTJiNlVKaWpk?=
 =?utf-8?B?WjFPWWlMQUZSZkJacjB0VjI4MkxUaGtZNGpnQytpWW45T2N2VzdtaHQ0ejFs?=
 =?utf-8?B?TEY1NjFQVDdGU0pDeGFvRy9PQkJhN3YzaEd4Rk05eDhTMU96Smo4a0JMMEN1?=
 =?utf-8?B?a3NrUHgzL1UvTHRsZ3BaR08rVjVnNUt6Zy85UUFNMmxEbUtIbkgvOVphS05r?=
 =?utf-8?B?cWppdUk4U3hNNXJXTUMvaGlBRUpqdkJpMU56ems3MEJmRUQyUzZCTzJJWWJn?=
 =?utf-8?B?QkFKOGNrTTJYTG9YRkVFUHNPOHJxNFdjaXZiU0VPcUE4b0l1KzZoTUFZSGho?=
 =?utf-8?B?dCs4TC9aVUcyTVg2Wm5xY3Fzd1RCMC9wdGh0VGlTN0JIWHorWkZrRlpKQzBT?=
 =?utf-8?B?YTZtLzY1UEt3VkVyRXNpUzdUTHZwbzRwbTRyRFFkS2c4cGVqODlHbTV3ZFFL?=
 =?utf-8?B?ZlN0eEQ3NUdzR3pxRGxEa1AwMC93VklSSlFGRU8ra1RLNno1SmVBQ0NoZHl3?=
 =?utf-8?B?YStyN29UL3U2a0NqRm1hTlNBeTJXMjFoVVZuUzhoNy8rTy9iZTk5V0U5Yy96?=
 =?utf-8?B?QTVwOS9JMktYZ3FhN3R2SFZnL1JJcUtOQjRZbTA3YjJ2dVU4MDJyTDhCVFJs?=
 =?utf-8?B?QU15eUF4UHBTdjNSSGs2V2Ivd08vUUxHbXlWb042Z1prOFYwVk9tOTV2VzFW?=
 =?utf-8?B?eXlvdHhkY2pxcUQyTmpTSUVDR3h2U2Z2amtrK3JSOEF5NmdiRXZGL2l4K29X?=
 =?utf-8?B?SThiZHIycEF5bllyZEowUWtiNWtOcjNXaUFLMWV4S2lReEVhZ0gvK2ZtaFhX?=
 =?utf-8?B?WmY2alZURFZkaHFsSSs4TFZIVy9uUlNoMlZ4SVhYSmFpM3NtV1VBc1l4Zk16?=
 =?utf-8?B?ZzZENnJLcHhCZHZkZWlnOWVCM1Zqeno1RzUrSStKMGM1SDFLMjJZb3hhVFFo?=
 =?utf-8?B?S2tOZVhkYXg3OUZsaEV4VGNsQVVTR3ZDUjhKT3NKU3pFdFd1TEpuT0M2MWth?=
 =?utf-8?B?K3YrRjhXN00ya3ZpaGsxcjVYaGhhSDlBc0o4Q0N4bmNLTVZsYStwZmxUUXF3?=
 =?utf-8?B?dzZibnlGTVNaUkZWZ3E5VVhsampnRkEvNWg0bGFuZ0tSRi84SDZmWDFXZlFn?=
 =?utf-8?B?aWkyUTJGQkpSRUxrUGZXQ0NEYm9wS2ZFNzFOVDVpdjJxTHFxSXJtbTVCa0Q5?=
 =?utf-8?Q?jl2g/+ysThRvVEou/uSS/37gY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8441e5de-d3c8-46c2-82fb-08ddafabfcc7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 03:38:57.3457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3IRbcqAxPnVBUr44WsW660CRdAt2Br58XK25eP46YMz0wafS7IRh22zs3meys7NM14aFZDEm7XN4WM261ssQag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7369

When testing on i.MX95, two consecutive suspend message send to the Linux
agent, Linux will suspend(by the 1st suspend message) and wake up(by the
2nd suspend message).

The ARM SCMI spec does not allow for filtering of which messages an agent
wants to get on the system power protocol. To i.MX95, as we use mailbox
to receive message, and the mailbox supports wake up, so linux will also
get a repeated suspend message. This will cause Linux to wake (and should
then go back into suspend).

This patchset is to make the 2nd suspend message could suspend linux
again.

So why SCMI fireware couldn't block the 2nd suspend message from being
sent to Linux agent? Per checking with our SCMI firmware owner:
The SM(System Manager) does not know exactly when Linux is in suspend.
There are no handshakes that clearly tell the SM this. The flow should
be, if in suspend and you send a suspend (or graceful reset/power off)
it will wake and then do the request action

Move information could be found in patch 2 commit log

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      firmware: arm_scmi: bus: Add pm ops
      firmware: arm_scmi: power_control: Set SCMI_SYSPOWER_IDLE in pm resume

 drivers/firmware/arm_scmi/bus.c                | 45 ++++++++++++++++++++++++++
 drivers/firmware/arm_scmi/scmi_power_control.c | 24 +++++++++++---
 2 files changed, 64 insertions(+), 5 deletions(-)
---
base-commit: 4325743c7e209ae7845293679a4de94b969f2bef
change-id: 20250620-scmi-pm-8f6170769230

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

