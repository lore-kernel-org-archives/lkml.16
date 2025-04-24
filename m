Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1023CF58;
	Thu, 24 Apr 2025 00:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455324; cv=fail; b=IseBlY5SgFW1bdizxjkor3rV0C/GJyIrrFYH8bt+KQZ6C1VghXP5BZLEbNxVcm7KYBG58f6nWCtNUeGdkTkNB36MVoElbzZ3ClkrpDF2Pepuo3JVzE01EqGz/IZl1/5cZ/WfNrsaxl+oLZiW/3/Mx4c89kMwT+kzBbEQcmjID90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455324; c=relaxed/simple;
	bh=wUzzmhDB/9CzXnkjTcXxOspyvIcRoQQHL9awrJQVyyQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ii5f5S9CCBUQ9hw8ndfFYK7pSF5Gb/7c3M1ERQLk5sttkIy+shrkDWwlpSRnSnwoV8m78R1XPI+ZnVdWua8oWuKDtKJXGN0YRZeKURuDS/88iXyEPYtUNURFkIW1WAEnXihhcXp/PM47+xlwd7JSOn8v+fM1kRrcxmTzraZgTWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iIiDr/b9; arc=fail smtp.client-ip=40.107.21.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iIiDr/b9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtTGHueJO8lISVW3ol+NBJ+yBBjjRIn4PaZ4SOomYFnxoYL8j7vQRTRKLYVgMHJ+IXX+Y0z639ccyHSYtm+1He5IRQZBSJrH6+mm+MvGoRQj2t0MkEj1fJ/i76yj5axRGv0oCcoZZBLD9YumM5eSeOBpZjWgmA7ujRnUnkXjDJBdGfc8ZJMNQQwzV26eijtyvkR5iEZYmiZzfE26Gecg4Aetyjnl4ArwVUypd0NfPcEdYOwIHXkAHR8UnmD34NgKvoXWgCSI2oITADe7s4TzzorkQ0xH4S/DA5glhzgjweqOVoF+8KkElElkBOA9FBlexFNW6C62vxxFlItOjuw+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt99vAb/lBmgNC/SdE3CkXlm/nUSdI2Y6eKgI5m7L70=;
 b=gQsW/+ElaWZNo8e9VGmEoX4S2+MQbXlFO7ArQWZDDweEDXZEhYVp8kRMGRGA3BYYXogpkBmj149GUB+EGisc+PyU7xhR+oKkL/17x8oYVAxE7kJLJqcqigR66JYkDlr5fo3+ndQpDk3N43EmR8k5/rJcGqLmukuWAPCd6pQ00LEBzYfC+N1YLaWSQAniZYfWM/RZBjNHRtHo1QgozvbmMQxCACLz38WKXC758pqEaTGvywuIExoL8FKOnGAArGxOUmncLpqHBKfXGLksMSApzxUOAhYYdD0vQ/Av45gqnsV7awqad5QWDSi2GtbUI0JmMI2UIYyA/1y9YqmlT/+nNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt99vAb/lBmgNC/SdE3CkXlm/nUSdI2Y6eKgI5m7L70=;
 b=iIiDr/b9w+U0zA4y1vY3g6gKOussB6HKmiIKVkvaqbbBI+UfRa2LxRYFsNZWPglW5kOYCka0/zPLileg5ztenMpBSHGbcGuC+4rMyy3736tKlsKi33rwrs3xl8V2J9gKE5hkYUGPwGqxIpxez9wGgifYf2OQciB0Q3YZdqL8kwG5E18HFkhlptrYBmfLeXgR3/KDtue8j3vOszXmDcSgqom0NIOxuHSO7CLYDQV1scZMR3HIftXIkJAXW+8TPztczZC5ZaDVbAueYnko4nCJAtGEztjvmPOTVEkUa/Zq4vR1NNV2x/zn7LU8PNgu+yXBELKlujJk9u9jP1OwHAVlAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 00:42:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 00:42:00 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 23 Apr 2025 20:41:27 -0400
Subject: [PATCH v2 5/8] arm64: dts: imx95: add pcie1 ep overlay file and
 create pcie-ep dtb files
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-imx8_pcie_ep_dts-v2-5-43c982d83a8f@nxp.com>
References: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
In-Reply-To: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745455301; l=3203;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=wUzzmhDB/9CzXnkjTcXxOspyvIcRoQQHL9awrJQVyyQ=;
 b=NZOO5LH2oNISnDywYyThrbqI1boc7aYC2L4mQ+2W/7sTkl++jnHgESIrR4E1t4sTz+XaqVvKh
 8oAauZ7SAbyAJvIQb45XX1d8q9I1GFMAvWTyonx2jV5vrS50QU7HFEq
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: e21ff3a5-8b99-4f8b-69d0-08dd82c8d2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RExRL2ZESVVoTk1CMU1xczhFemluN21NTThqT0gvaWRmTWNIcG5BaFdSRm1u?=
 =?utf-8?B?YXg0WXJDS3VEWFBQNVhlV1RaWHhrOVQwYkp5NG9OQ2dOQ0FoUXJxeEtYNit6?=
 =?utf-8?B?eE5Tdlp3VC9uZGdtU0xkcnRGMldyK3pBRWFuTHVYa3Q2QjNFbng2Ukd5ajJE?=
 =?utf-8?B?TXo2aW5VZ1JOMkxNWWJsK3VFUEg5OEloaFBtM0JMbzduU3NFdjhrUHc2dmQ3?=
 =?utf-8?B?Q0ZQQzljTExERUhqZzJHNXozb2pOS0tNSEVCQTdVcmRXbHJhSjdkVm1NTjNG?=
 =?utf-8?B?bno1bDBHemZGdENzSzB0N0RKZTF1Q2xpWFdUbnhUQ1Bvd29rWDlyVXc5Z2Ja?=
 =?utf-8?B?NC9wbHdQR1h3L0NVcHRJSjJheEozSHNFZlJud2xBUVAySjFpVnJyMVl1a1Ba?=
 =?utf-8?B?a1FaU3NUaGJzN3RXd3lxTDZtMVpMeG5mNExFQWs0dUpyZDdSYlpTVnRueWZN?=
 =?utf-8?B?aExPdVNVZy9BWDNJR0RPR1NlZzBLS2Uycjl3SlMveFpwNjBuMEVibXp6eG9O?=
 =?utf-8?B?ZjBzY0NjR2JYR2d6Y3FZRU04ZWNiOXR6N1ZXak5LOVN4bHltM3krbmxkTEtB?=
 =?utf-8?B?ejJSKytudjlvVjVoUFBBV1pqZ0xXZUFZekZJcXU2UUJBZDhoYWRDeDVOK0tW?=
 =?utf-8?B?d0FoZXAyMldPM1N5TUxpcHdTN1FhUklQbU5Mc0N5UU92OEthZEV2QW1JWXUz?=
 =?utf-8?B?REp3WStSejNZWjcrelducGZpTklDM1k3U0hwbnNqYVdQb2VzM1Z6SG54VUtl?=
 =?utf-8?B?aW5OUVcxNG1jZmZhc0VJR2h6dWxHV0Vzd1prUlgzYS8zbVZiai9adE4zMjdV?=
 =?utf-8?B?SmozcXhnM0R2TU5nSGgwQ3NxNHhLVnBtT1d2SEI5eDN4Z1QwNkkycEk5dzZp?=
 =?utf-8?B?ZWltQnRrYWxFN08yakc3d24wbEh6c0dEUmtTd3pUM0t5TlRWUm1LQ29CVTYr?=
 =?utf-8?B?UmlXcjNZMDRUbWUwMitLM2dFYVdIeGpwRVlCNVFOVHJxSHZFNGR6RGgwOGlU?=
 =?utf-8?B?UWJlcnZTV0Y4aDZNOVI5b3JpMEZMeXkrUDBjaWJXNVkyc1V0bm5tYndXTnBk?=
 =?utf-8?B?MW4xR08yM0pFd2h0Y0pDeE93ZGFkRGU3RTY5dWsyRDkyMUhJTUFlZlpxSkk2?=
 =?utf-8?B?V1JaZlpGNXkwQkc4MExPbmN2eHphdWRlOVFvbzdVRFB0NWdpNVR1V3YwcDZv?=
 =?utf-8?B?S2o2MFNNRXhMdlRoUmtSSEpmd2laM2taRWtRRE9EYnJhQlBoT2JLUXlEQ3BY?=
 =?utf-8?B?SU9pRW5WQ3Vwcm9iaVAwM1g5cE44OEVTSDlOSURxa3RnVk1OQTNEUnJ3OUFn?=
 =?utf-8?B?S3VjTjBRTm5tQlVhcDV4ZTNTeXZnd2ZhZ0R5QklCano5VzZsS293eE1jNk80?=
 =?utf-8?B?aE5CTUJBdm5sNWFBS01xaHJZbzUwRkpGTGZpRHFhc0dpQ0JsZ28vNnRSZ1Nu?=
 =?utf-8?B?a0p5cUpqRmorRFQ5QnpDWjdudHJvT2NacUVjQnltQVBYTmVnM3U2ck0yRUhE?=
 =?utf-8?B?RjhGUWhoMjQ0dFVKbUdYSnZxNEJMUFFnTG53eThzWFRiMUhaeVlXMGtsc1RL?=
 =?utf-8?B?NW11K1pYSmxoSVV4NUNVRS9wU1NNVTVZZFdlSVgzNmR0d1BZYjh3cXhSMkE4?=
 =?utf-8?B?SHpzVWpaVm84SURFbVcvZFRHN2tXVm9DT2JGeFYySmdEcllHNjJ3dWJjeFhD?=
 =?utf-8?B?M2g5VSs4WGJobDVQdDJINjQxNHR4L1VHWkVMZHEraWFNK3pYMzhXL3dHZWhu?=
 =?utf-8?B?VkxqNC82SlNLTzVHN0NMNUlNcTdZOE55WFVnanJwaldNUmc3ZlB4cDI0eUJz?=
 =?utf-8?B?UDN0M3doRXpsdG1uMk43dndsckptNTB1Z0NvS2picFREN0h3czBubHpwdkdi?=
 =?utf-8?B?aTZJaGV2N2IzbVE0MDRiYktrTjNXRTR5MHJoWkhvVVZmdVhFVCs0emJIUER1?=
 =?utf-8?B?ZGtqRzFsS3kzRnp6SWkyUkVoM0JrSWYrYmJ5N0c4MHRWdUpUTEhUYmMxbjQ2?=
 =?utf-8?B?N2RXMGxIa2J3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UkZKdXhjRWU1bWtaTGx5T0RGR2hMM250S1FSRnkyRTNUdW1OVlZyek45MDli?=
 =?utf-8?B?WEUwS3RzdGhuSXFtYW1WTklVUjFtbFdxUVBPVGtSM1FGd2NVa0dNZCtXNmox?=
 =?utf-8?B?MDFZZnlDN2Znb3RmVHAzeWw3WXJvVGZtN0xsRnN0RDZIbFh6dlRRK0pNdGRS?=
 =?utf-8?B?UmoycC9EY2lXSjZ0MzNmdFpOR01IenNKcW1yWGw3VG1lVDkvaG9RSy9DZGJF?=
 =?utf-8?B?dFg2ZTVLai9WOUxGZjRFZWhHc3pGNzNTNkUrTldEZ3p1ZTFTNllzaTRQZEJs?=
 =?utf-8?B?RXFySERUMS9zWUN1MFMwNnJRVGpQV2lSR2xOUmZwTXdNLzBDSGY5LzZTUy9x?=
 =?utf-8?B?S0lQV0pvM3p0T0pHSjh5UDh6U1pteVpZMU52QW9DMkxDNlhlN0Q4MjJkdUw4?=
 =?utf-8?B?WVBab2o3ZWswUEhVNnNQZ0EzaExlQms0SkpHb1BEeWlUZTNtUlo3NE1FMkdO?=
 =?utf-8?B?WU8vOUkzK2ZVV3Nob2dmMzdadU9BaEhWYmdUZlNIdzhaQlJqVW8yR1RWaXNp?=
 =?utf-8?B?eEdaejhwK3pjL042WGNCY0Z2K2gyUXMrbUs5VUVjT2ZrRmdwaHMxeVBhbFRW?=
 =?utf-8?B?bjVHVWVMbUhyZytSUmtIQkFDMWE1d04vUHpWK1paNzJJYXNpdnFKTFBpQnZR?=
 =?utf-8?B?OHRVRkRkZGpmblNmREFkZlp0YWFCaWZ3S1pIbEVLTWlMZTdvZVlLdmduTjRl?=
 =?utf-8?B?NUttQUNEUlQ2ZVJNOERFVEFzY2hQNUs4VFJ6eU5ZeXdabzlGZDRKN3RVQ1RN?=
 =?utf-8?B?ZGdKbDUxbkNjOHFNNktUNGhLTERFdTJxd3Fza2xrbXNmTThya2lXMmN4WWps?=
 =?utf-8?B?N2RGdlFsRzdjZXJSMjV0ZkJWQUlZSlY2dkJPeDRTYVRUUkhrcUo5RExaTTd3?=
 =?utf-8?B?dGsvK2FHN3MxY01jSDV0VmhHdjloekMvbGVMM0p4Zjg5TkdpNGxJeUV3ckgy?=
 =?utf-8?B?U2dXcjg3YXJyYkxSdXlxNndsajJRTy9GTlBnSEl3bnJObWY2aUsrMHhXR2g4?=
 =?utf-8?B?ZTltck54YjhWWVVPeTc2K0xzU3ZZaENRQ0tKMUw3VVpaMkpTR1BFeXp3Z0d4?=
 =?utf-8?B?VGxwcFZUaXpyYkZ0WmxvNE8vQytZMVNXR1pQN1F3RjhBaUtwbEYxRzc1L1Fa?=
 =?utf-8?B?NTgxTUkvRklRMC9JWCtURGRYeG9VSUc0VEJTRnZkUzFiVEpaZTBaSlVzVzZL?=
 =?utf-8?B?MStHcTRqWmhzTHg3L0ZQbG5uTEFXSTBZZnU3K1ljOE43Mllub0xnM0p4OEs0?=
 =?utf-8?B?WnNDM0wvYUw2MTFJZVZlc3B4UjMxOTlBRitWWVA0bnJVU3ZqOUZJSmo1TEdS?=
 =?utf-8?B?SEVKaEVLOFVGM3h2RVFXUnVwQStXV1htY1k1aEh6ZlkwNW5xbUJWdFQ2bmYx?=
 =?utf-8?B?SGYzaUV0TzZWZ25DVnNQejA3d1BoT1hwR3l3WmZEdjNsV0psQlo1azEyNXRQ?=
 =?utf-8?B?ck9KVi9uTnBlVVJ6OHMrOGhlRzlnSllUYjd5WjV0eDJHVjZJUE1zeHZKMUNq?=
 =?utf-8?B?bHhDMllKQ3RadWNBUEdHczREQW5nT0IrV3VzQ0xjUEg2MkdRWmtBdERWeTA4?=
 =?utf-8?B?UXRpRFNLcCt5eHVnUDhjL1ZUVEg2UXl3WWpPS2pPVHlwWmxaWXgyNFE1TUVL?=
 =?utf-8?B?QiszV2t2SUdKV3czQTFzNG5NVWE3LzVjUFIzb0JLc3d2SFV6NTRNQ1RSbnAv?=
 =?utf-8?B?aWVOeVJkcTNMUnVMOSt0VFFBcFZlaE5jVjc4bVY2MVNNdllKaTBQTkpRUzdL?=
 =?utf-8?B?bXNBaE9wYXIwWHdjaEFzczUvTW12QXIwS1pwbGFsVU5nU0lDUUZTZTFQY2pi?=
 =?utf-8?B?QzRIdktOclhFTVUzMUJ0dmJmaWFGM1hJR0pTdlJuUi9VT0pBU2M3RWlhU29j?=
 =?utf-8?B?bVdNdGFsY1I4MytWUjdZOXJkK0trdEdCZnNsUjRrU3ZtS3VhUEVENzV0NHdR?=
 =?utf-8?B?U0x3cGZVMDJFSTc1cUNNUXlKOEFSSHE2UWtraVFodzJvVnIyVFhaVlNlUXJt?=
 =?utf-8?B?Q0d0eHZXTTF4Y0JzcTZRSXhOT1VGTWFPRVo5bGw3VDlSaVVvWU1aLzlJekRk?=
 =?utf-8?B?bWpzZkxGSzdEUEIrVSs0UEhFUE8yem5TTWtMM1VLcmZEOG53ZkNzaFFrUkp4?=
 =?utf-8?Q?IdA4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21ff3a5-8b99-4f8b-69d0-08dd82c8d2b9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 00:42:00.2858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2ICTXYCFJwoWenbs6IP/78EQ4Yoi9aj4L/8MBpt6wv3HGzNsHfBUTNxAqbWi13/TNrpKjVdLck3MUb+t2Wf2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605

Create imx95-15x15-evk pcie0-ep and imx95-19x19-evk pcie[0,1]-ep dtb files.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile            |  6 ++++++
 arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso   | 15 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts |  7 +++++++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 14 ++++++++++++++
 4 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b485e2260a3bd..aa7fd9dfd39dc 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -309,6 +309,12 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 
+imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
+imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
+imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
+
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-kontron-dl.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso b/arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso
new file mode 100644
index 0000000000000..0e7ef7ef85605
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie1 {
+	status = "disabled";
+};
+
+&pcie1_ep {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 514f2429dcbc2..a35962f929f6b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -525,6 +525,13 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie0_ep {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_m2_pwr>;
+	status = "disabled";
+};
+
 &sai1 {
 	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 25ac331f03183..4accbccc75239 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -417,6 +417,13 @@ &pcie0 {
 	status = "okay";
 };
 
+&pcie0_ep {
+	pinctrl-0 = <&pinctrl_pcie0>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_pcie0>;
+	status = "disabled";
+};
+
 &pcie1 {
 	pinctrl-0 = <&pinctrl_pcie1>;
 	pinctrl-names = "default";
@@ -425,6 +432,13 @@ &pcie1 {
 	status = "okay";
 };
 
+&pcie1_ep {
+	pinctrl-0 = <&pinctrl_pcie1>;
+	pinctrl-names = "default";
+	vpcie-supply = <&reg_slot_pwr>;
+	status = "disabled";
+};
+
 &sai1 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";

-- 
2.34.1

