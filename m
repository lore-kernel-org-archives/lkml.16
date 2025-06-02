Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CD7252295;
	Mon,  2 Jun 2025 22:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748901686; cv=fail; b=n/o9KhIMrW4y3A06YsetVqHkj26wLp62Iu8fLcweLplEN9+/HeEpDJPpHsAScizQoJ7pz1Oq8PiyG29++BSOlSL/SgSQWMh5OR1qMHOotvBy59dtbwwGKsL1tmtQuULcqjjV1oSs0GRwlOSYLUGv83lat816T4C3XN6JIL+MgE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748901686; c=relaxed/simple;
	bh=GhnxyAiyciAFEyZgCCPtSqceYF4pj8EmNVhp6mEAKGQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dvtSHsV73QzAoJmLISLbbXWy+tLKp9F9nsWPNnAzq7mRmKMkX9MiiS2cnzIw167wMVCbgeF1MXjApvjXg5aCTfmibdjSnVVMJWxbToPwCW6tOwNwSFnrBRTMjZ/Le8OAq5JyycB8P1OEKFjEIdUAa0tnBb5fyAV6HMx1HVdbop4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lRUxFY6R; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lRUxFY6R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eNkEEOL2Sfj0gr+/B6NR04cHiojWE5oDDERg6YSUGPSmpmITKtdXWmLpyHnqVDZB9GW+WdaCF9jQH96w3BDG6tJQ1DvagmHc7qHmdkIR+iAKxb01bmpCaWt4wn66oPu3yJXxHvTqgsVUxk23OdbbfQk+bVreRthVzJ09cpgfI6br4Y4jIaJ5Wi9MZdIz8wVQZM+29qa+vEyc3Vku9oXEysf2hc/xgGIxPGQecNPnXaLv8HnDk2x6QpZ3w4TGDKwr9ucktRoQ4LwsxNa5FSIdIflSIUNhts1tTp03znvGoZ5250BgkAKNlTXwYJb/t5eilJfGGwHMGmrTigY4kF0/kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZZzYwldmOsmVQJTFiVtkoI8G7cpTh+UGlvq3JrTRvo=;
 b=cv+QXNJUcnRECCLMXDzbZZ2Ohwaqh8tmWUXsBqrV7tkfb2F/6bosUOljyRjCVBHwvGjnjIx2FvwKjJtUcrtrdDS5RXXCEx/buSeB51MwElTvYGIwNeX7OoG8pZELJFjRvrMLjVwZ9tXqcuFY3Lg08ZOlQ5XwdADjJ2Fj7WiHEdj3mcrT1XpM1gp51It4rEs9AdI4gPR/PQ1teMm2OiOgCruOiRHQt2s13dZVZ0dgGpCDSUUF4BLHaO0n7EFFw4vd5OfmO6WaxyPPL7roi5mxw0Ti8sF2b5L+FVFM1J0E3lrhQCXvHUtavNcbRNZzPM8IPw5bj9fHSBpaCgolwIC/4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZZzYwldmOsmVQJTFiVtkoI8G7cpTh+UGlvq3JrTRvo=;
 b=lRUxFY6RSmD5fiW9t4tcH7K8b/379mWn189i1h3gA+Z861bu9KxOYldMLiKS23wK/T0lNL0UjptzT8gbAcX14vfOQcFg/nfG7McIdDVI8lJSAP0sfLcnyW38S6gy6VmRdqXbkQ7WByZ7h43Elw5gToA4zu0BhO3sAStzf1InkK1SINuAhVd/GVMi5zyZ09/DSuNE5VKTOUoCcLSGUQ+WX/aTfTdiiyWC6i856Qj/fa3kuNfozvlHT6ZY85+3JlSD5JHfi/xX4b8XDlSZA5OQvRReNddRbXaJCfo6tiHVRHO7EqgxWKzakHTI9Y0Nbq7NJlgVA0n1PyBUHEEgGU6HGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9756.eurprd04.prod.outlook.com (2603:10a6:20b:677::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 22:01:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 22:01:20 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Jun 2025 18:01:01 -0400
Subject: [PATCH 1/3] dt-bindings: usb: add missed compatible string for
 arm64 layerscape
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-ls_dma_coherence-v1-1-c67484d6ab64@nxp.com>
References: <20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com>
In-Reply-To: <20250602-ls_dma_coherence-v1-0-c67484d6ab64@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 bjorn.andersson@oss.qualcomm.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748901674; l=2235;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GhnxyAiyciAFEyZgCCPtSqceYF4pj8EmNVhp6mEAKGQ=;
 b=2AmrHsSNpNjsK8dmXBpzTbtdQWoF7TjYqFsBA5sGg3tUi7gZTamejDr7YFLQu5rksoR/oiFOH
 9xfp5IMcPkACmtovjm1/r7iTINVqi9tal7mlVSAC8XFN7oY1u6HTOtS
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0055.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: d823bf27-a0eb-40cb-30b1-08dda22101ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUE5UmpNSGJXMjhqcno3K3Z4NmNHcjRpOG1qUzRRRnZ6RGZUTFgvSTlUQVFZ?=
 =?utf-8?B?dzlBUzNkS1NFQUJMS3gvRWRYalE5V1J1YUJHdGpHN1l6SmhiZFJUWVB6KzBy?=
 =?utf-8?B?RmI4SElGcUFDSkl4TCtXcEtDWkpMSmNLTzJSV0tlUzg5TnBQdi9SSjUrRE4z?=
 =?utf-8?B?NFhrWlpMelBtcTNNeUZnby95ZUR1UUdQeHpiT09JMXQ1bmRjQ2h3VDVFdXlF?=
 =?utf-8?B?TmFTZVdaeGpQd0ZOT3NWRzF1UkhMU3Z3ZUxFeUZBd1psZEdjbFZuYmt1Q0JU?=
 =?utf-8?B?VURhOVJyM0RlZEtWWGNLSUdHM3VZYmd6RVRyZVd4MGd0OWRLVnpSaTdNQVMy?=
 =?utf-8?B?K1lkMEhZU29ZZC9SV3ZUWGl1WTZwbDRNR2VMSU5JSmZROFBhWnVhWDkxdzVC?=
 =?utf-8?B?UEcxK0I2dk9QOVZRME1RRVp3Tnk3NFFaaUp5TW5XbEtIL3ZXeU1IeUNOQkg2?=
 =?utf-8?B?UTNxTHRuZjhhbW4xMW02Zmh3NFBMMnMrcGxhSzZ3L21IZ3MwVTc1eXBocmVi?=
 =?utf-8?B?YmFqM2c5RytndmhGekUvQjRyMWFDbElwZ1dBR25PWkRKVEVaVDQwQ0NFZi9O?=
 =?utf-8?B?b3doUXJPMkw1ZWMvUUNYOVY5c0xBeTY0VTcrdnB3T0JDcUQwcWQ1U1lSNkVs?=
 =?utf-8?B?NnNxQzZtbDYwT1BwL0FQVWRPL280UnZVVmZwMzdzQzZMV3pkeldocUdVUDlX?=
 =?utf-8?B?VDR6dmtLMlhGeWxKczMvemp6clNZcy9lL0NxdkIyQnExSWswcmhuS1VJbGxV?=
 =?utf-8?B?a0Y5K0p5Mk12bzJPcTljVzNKZDRnZUppWFVyaXJKSkRnL3IvWGxkRHZtZmdm?=
 =?utf-8?B?M0pIVXJGdnIxWGNYalg3YjYwREp0QjMzOUl2YUhkSXR3MTcrRVREU3plWTBh?=
 =?utf-8?B?OExSZENvdVpnSXlyTmpRMDVWbldaQjV2eEg4YzJ6NnB2VjVYUnpXUit1bGZh?=
 =?utf-8?B?bDI3dUVmaitubzhmTnZzeFRoME9ua1l2cWRmK3NjOGdTN3pITjFSbFo5K2V3?=
 =?utf-8?B?aThaaFRDVmpsQzkvQTA3Y1NtSmtKOUEzMERPeGNwMGhGNldIeElIV1RiNTJh?=
 =?utf-8?B?Y0o4UkFqWE5tREE0ek1Xbm9CNTNDak5qUWowbEltdW9jc2tWcTRJd3VET1dD?=
 =?utf-8?B?SHVVdVhnQVZad1VwSC80cGdDZGh1ZFIyTzAweDVQWXdkVXhNT2hOd1cvenA0?=
 =?utf-8?B?V045cHdsWXFjamZ2dDVKTFRNQk04RHJuRG45THVWaFhnSi93SHpCamUwTWsr?=
 =?utf-8?B?THVJTE9IWFM3NkdmZXlpZWZqSVo5S21ZMXFjNXBEQW92elIzcWxKMkJqcjY1?=
 =?utf-8?B?bEF1aDdmUGpTODFYZ2JaUlVJVzZvTS90Q0NvMUNSNTIrb2QvazdsZ3ROVDhn?=
 =?utf-8?B?eFNzT1FrK3BXTFZSbGl6Y2RSZWJWcmZoQXZuampweTJTd2dyYm9mY0FKend1?=
 =?utf-8?B?Ym1ZS2w2Ri9SY3Qvb2szaHcrVDdtZGpUckE2aHo1eStsOTdVWWdkTnQySFN3?=
 =?utf-8?B?TTJ3ZzdqbVI3d2c5Sko1SHdRN3BOY05tU3lLcFMvc3VUWHhJRGw1bVhKWUh0?=
 =?utf-8?B?TVp0MXorVnF0amtqRy9ibVc5ZFJLUTZqT2dWdjZkSml4bjU2T21BVExFSnIy?=
 =?utf-8?B?RENNK1pCT2lxSlV2bG4vTXY5WGhKaFVzNCtGSWFrVmRic3F6Y0VVMjhxbUo3?=
 =?utf-8?B?NElDL2FvWHVrbzdlcHNJOVphaXNqZ05GWjBPR1pTQTVKbjBaaFpNZU5BTGFj?=
 =?utf-8?B?aEE4VjhRU1YzUGczYVpBdDA2N0NHWWM2QnBMV1QwSHBKVUxpMEprelIvOVM1?=
 =?utf-8?B?M0c4Zm1wRWk4anJJS1RxZlNNWmxLRE9naTlKenFuOS9LZmpRSFJkWnEvZUFR?=
 =?utf-8?B?Y01yL1NzdXRibkMyMmg3Rlp2QUx5R1dTYlk2OFUxN2lSaU1HSi9OMHFXcTVa?=
 =?utf-8?B?Q09DaCtmTGIyTnEvTTJEd0VtbjhLVDZoL0llTjZYbVh5alRSWTdnNGJJOFpS?=
 =?utf-8?Q?LrtCK0qRU8BWIPjF7w8+qq0DWJsnew=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW9RakZVVCtOSURrYTNud3hBeXdJNWlQWkhaUytISHJudkhuaTNzY05Bc1lQ?=
 =?utf-8?B?UkFWUDVGMUhTMkExM1k4d083Qms3cmRBcFA4RjV4R3IxVWEwc0pudUVCQ2dN?=
 =?utf-8?B?QTFIUEZPcEJ3MVQyU0dOMEJCNzJkcThkWFcxRVduemJ0ZUxMdytmTTRXd3ZW?=
 =?utf-8?B?WXJOdTRiMUNMQ2RZeENFRjhRK0U1ZEJEdzNGdVV4cE1VMjFYeC96dVpSRndq?=
 =?utf-8?B?OElQbi94YW1lK3hSYi9JMHQ1RWlEYUJtZzFKcU5JNUFCNzJ2YUJ1Z1VFOWhY?=
 =?utf-8?B?TEhjemRWSjhxNTJIWkxZMUhDMk5YR29GRzk0bTJXZGNPcW5Wd09SdGdoMGVW?=
 =?utf-8?B?YjFBUSt6R1VkR25XRG4wM3ljUW96SWgza0t1WVFTMDVBalFFMUtpcFZEbkI0?=
 =?utf-8?B?UU8zaHBsMGRPRS9wdDE5ODhmbDZ6NVkyRythaGpCVFRyRDh3QmpkblU2eFhY?=
 =?utf-8?B?dGMvSzdjZWxJQm9ZbW1tOGkrMzZHYUJZS0YyZnRQWk1JWCtuREtmTGFyVzlU?=
 =?utf-8?B?bFNlWVROWFJRaGpReUJ6ckd3NXo3RTJDcUtaTHpuSmlCMDdJRlBlcnl4YWVP?=
 =?utf-8?B?M2FkcWZRMlVkd2xNdEhMN3Y2OUMrdXBMb0RuYzZRNmk1cXNmSTJla2I5OGM3?=
 =?utf-8?B?ZXdyRDdlZE5kcmlGWHIrVWYrenBIWlFUU3VOemJ3NFdSbytVZ21TM2xNYXZW?=
 =?utf-8?B?bjlnVFFYWnFIcnZNRmZUNnZ1R0NYZXhtZFY0aVNQWGhOaEZkTjJndDFMU0pq?=
 =?utf-8?B?NXFZK2pSWi9mSkNhWGNudnlqazd1dUhQdEZkS1ZwcUM2UGdjT0p6RWRDZzFa?=
 =?utf-8?B?VjNyeU15ck5zUWdwM0RTRFhaUnVQMDROSG5uZWpVZ2ptTFFGb1Z3Y3ZYWlJv?=
 =?utf-8?B?NlFsN21MeHNGWXhaMklzbllNY0VxRXVZcGs0aHM1RHJLS0lxTFd1VHV6N2th?=
 =?utf-8?B?ZEpvZVVPWCtiTDVHT0xRd1FtSkNGdm9LMHZMNi9GL3VoREplZVFudW1TMDJM?=
 =?utf-8?B?S0pDangrWDh5QnVlalNQWlNSbW1paU50eWNKejVNcVVIR3p5SFdaQzJ1RWF3?=
 =?utf-8?B?OUdybWZ5NlZNcW1kajhYVC9VK1p0VFFicThjRS9JSVJ3ZE9Ba1BEM0VOUVIr?=
 =?utf-8?B?cTZQdmdXSnNsUnduTTQyWmtyQ1hKQTMvV3Zyblo3YVF0N0g2N2dBRzRiS0ZG?=
 =?utf-8?B?MVBZQk52dnkxL0FldjMzd0s2cHhvNXNGK0RlUThyM2RUem1aUnp0NzRVN2Nj?=
 =?utf-8?B?UXFzZTByU0tkTkpoTmlta3ZHL2NGM0tTN1lQUzhjMnBYck9KZ0tIOW9ueHAr?=
 =?utf-8?B?L0JLNWVQNWFYZ2xxU0x5cDBtOTkxUWJlN1B4T2lGWWZLamk3eGVqSEMyN3B2?=
 =?utf-8?B?RC9reHBMSXJrckN6ZFhNYzd1aGE5NGhIOE5LRWpKeW8vazhSMDZvczhyUjRt?=
 =?utf-8?B?M1B5dytTT01iaVpURk1rOWRiVjdnNDFUenlKTnFxRC90QldDWUVQM2JaQk9n?=
 =?utf-8?B?SWh1WkJ4cnZUM3lsRVdYODBoblJrbFhyMXVibXZkRExmbnFFbi9EQldxaG5O?=
 =?utf-8?B?VGtrazlUV1QvZXZwU3VMbmFNdHM4YzF1SmtaREhobi9jUzVlNzN1V3gyT0F6?=
 =?utf-8?B?a2JJZzZpOFBaKzJIZ2NIWjZRbTVOZzN0V2xwUkphZ1l1U3pWcjZaY2FPVy9q?=
 =?utf-8?B?elhxTFBMcEVlVnkyY2UweTNZSlc3bElxWkR1clJxZlhXK2VCdzRpS2hiN3I4?=
 =?utf-8?B?TzV6N2NJeEpXcXhwRFpSVnYwVDRJNkVCaXpaYnI0d0R0TCtSTGdlWTdqd01t?=
 =?utf-8?B?VVl5bXg1c29xc1NYQjBabHVSQ050MWw1TmFFSEZ0K0RhQ0pENzFuWXdlc0dz?=
 =?utf-8?B?MisyNW1lejVVU3I5WFpaNEo1VDBoMmRsVzdUdjJFTFdFOEwyV2ZGWGN5VkVm?=
 =?utf-8?B?M0t2WDErckNaUDdiaTdCcHZxZmJ6cHMxcE5IVjZ1UThZVGxFWUt4cmQ2Wklm?=
 =?utf-8?B?QjNBS21uQ3BQekNWazFiT09wK01NSHBuZkYrQ0ZzME1LV2VKQ0R2Zkp4alFz?=
 =?utf-8?B?MTI2d08vQWl5bWVtNktmT3B1Si8vYS9XaVprZE5mcVFBVWhJR3hpYXM1Qkkx?=
 =?utf-8?Q?UN7kWEkUIZ/yH4d6iXnMkJKjM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d823bf27-a0eb-40cb-30b1-08dda22101ac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 22:01:20.3889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPYFWv1dUCPhZPHU+taarvS9ItFrOAQ46t6Sp1rFLht53jLApbiIFl0ZXBSFuZZZK2sK3IdWpKHnvU3iiRJ5XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9756

Add missed compatible string for arm64 layerscape platform. Allow these
fallback to fsl,ls1028a-dwc3.

Remove fallback snps,dwc3 because layerscape dwc3 is not full compatible
with common snps,dwc3 device, a special value gsburstcfg0 need be set when
dma coherence enabled.

Allow iommus property.

Change ref to snps,dwc3-common.yaml to use dwc3 flatten library.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/usb/fsl,ls1028a.yaml       | 33 ++++++++++++----------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/fsl,ls1028a.yaml b/Documentation/devicetree/bindings/usb/fsl,ls1028a.yaml
index a44bdf391887f..4784f057264ac 100644
--- a/Documentation/devicetree/bindings/usb/fsl,ls1028a.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,ls1028a.yaml
@@ -9,21 +9,19 @@ title: Freescale layerscape SuperSpeed DWC3 USB SoC controller
 maintainers:
   - Frank Li <Frank.Li@nxp.com>
 
-select:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - fsl,ls1028a-dwc3
-  required:
-    - compatible
-
 properties:
   compatible:
-    items:
-      - enum:
-          - fsl,ls1028a-dwc3
-      - const: snps,dwc3
+    oneOf:
+      - items:
+          - enum:
+              - fsl,ls1012a-dwc3
+              - fsl,ls1043a-dwc3
+              - fsl,ls1046a-dwc3
+              - fsl,ls1088a-dwc3
+              - fsl,ls208xa-dwc3
+              - fsl,lx2160a-dwc3
+          - const: fsl,ls1028a-dwc3
+      - const: fsl,ls1028a-dwc3
 
   reg:
     maxItems: 1
@@ -31,6 +29,11 @@ properties:
   interrupts:
     maxItems: 1
 
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
 unevaluatedProperties: false
 
 required:
@@ -39,14 +42,14 @@ required:
   - interrupts
 
 allOf:
-  - $ref: snps,dwc3.yaml#
+  - $ref: snps,dwc3-common.yaml#
 
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     usb@fe800000 {
-        compatible = "fsl,ls1028a-dwc3", "snps,dwc3";
+        compatible = "fsl,ls1028a-dwc3";
         reg = <0xfe800000 0x100000>;
         interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
     };

-- 
2.34.1

