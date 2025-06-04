Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012004.outbound.protection.outlook.com [52.101.66.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9D820D4F8;
	Wed,  4 Jun 2025 18:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749062201; cv=fail; b=iLRKg5noRDvzIbs+VRUgNjX6eLlTWB2FrMqartf6YtAm03OWBnfqoOHZMOm+Rv96kaY28bs483gMWtKejjTN5hDQuw5ZCPGnx1lxMReGtk/jcWatLJbFwIDBUrfF0L6zrXAwMajKSR4yKH60U5keyCeeKTzeQbNE9Rr5avQ8LHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749062201; c=relaxed/simple;
	bh=SQEZUm508Zi2wUuR/dkml8O32RUVZihw9w08KrWhrUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Xz3wslEphWlln2L+WCwL3lb0Nf/bfWuH6zl5j6WZXqJKMVAtTzw7JOpjYWvSiJIW1rlS17Mqq4CWR4h33yHAyjVH6lEdh4In/MG1D+syvxaWUY2kEa/GuSN1lUrXMnqFuBK4nHrwN4hz2rHl9oSLIKUY8Btlwd9pUyipJDuWUFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fVP4MsA2; arc=fail smtp.client-ip=52.101.66.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fVP4MsA2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD1aV7+SmceZS9CIjKyCjP26XBou3/sGMNoYxd6Jub2kH9itmo9qJEyDUKGKTX4VwuN8c/riD1xSWhs7BQr0hix0NvgzA2R5+Q5bLPqME+xCmB4/Z5qAfzRhpJtfazL/R1T9uEUhJYSeUvhsOSblikRfUYmvdF1YzjQbpMPo4JvFFr+eZDZAqXRxe2SbJT6MX686SO6B04gr4DYKlu0DFQDNloaoD0N2EQ5CfhqrKdtO1XeD5zQBhnka3kQDCJMok6RNkOgF091qXzCj27UhSRJm9CbAA3I0QJU4Mp7Tpw6Zax2Y8bIZJWOuF/yzow2vaxGZRuokpVaDIayD5mXJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeC/RXZK0uvikT9Must1KyEsGAlQPuH9EoAf5ytYQ1Q=;
 b=JAjSTePrnsYhzqRK8Rx52X8FlHxA0EK5ZU07xTezi7Odr0p3uOFdh5FL+qXxxc+6JWHBqesL7TP5ZAVQQ0UGWAZEpDrtLvhZBSejMqnXs4ZvsItsHVVsLeMx/KQd1uD5Es0foGShqzfeH1hZUDbA3YIq8wTWBgo5MHgi4tjGcMETnSSP4cmiHNnDFHnBVR/vtulLJ1F62JRTv+X77dZWbwKPCbMUaPOBUjG2TdLO4bN0IHmbdeEBTHhTh/0VsZuDigZve7+k3sInb+OI4CDWpwmKd4FU8jq4+m/qjGhtO8VeYqIoc3F71S4rY3fdWp53KtHF0rQzsk1IIbWMigbJwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeC/RXZK0uvikT9Must1KyEsGAlQPuH9EoAf5ytYQ1Q=;
 b=fVP4MsA2rxLwWnSO/XBmPlqJfKmDcN27VVcptu2m7IZN7dcBNxkTI37i4SBq7mevWowpKOz0xp3AiPP0gHAoBa5usHpvehJ4o7xl+oxr90QLYa/20pkMEvgbOXtP1tAmqqL/f2KTglyuBEiJs+gEp18/GV2WaWIAAiGnIdfbhdeS8WOg4QbXlpqzH/Bb8sKHuz71n5MOtiET4Tyceqcl4g4UGB4t5HV8nu28QxxztIv3pqQsnuRBeaYv2EG2Dvp84y0c5N8zYH/LCZ4LkbP5I/f0AK0qK3hCEbNoo0zczzyEeL0HmA1vhD05AOWe+oF9r1asj6T+THwd+glqRsJ8vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB11358.eurprd04.prod.outlook.com (2603:10a6:102:4ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 18:36:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 18:36:35 +0000
Date: Wed, 4 Jun 2025 14:36:31 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <aECSL3cn3m9pKJv6@lizhi-Precision-Tower-5810>
References: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
 <20250604-adi-i3c-master-v1-1-0488e80dafcb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604-adi-i3c-master-v1-1-0488e80dafcb@analog.com>
X-ClientProxiedBy: AM0PR02CA0135.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB11358:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e1ebcea-c404-4728-5ec6-08dda396bc3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SThmdmE0dDJuWXdieFBVaC9ZQVlDaUVvNTJYYStLWnE5Rm4rUEU3aFArc1lY?=
 =?utf-8?B?MlJMTDdXQVpNemIrRFZObmhGa0REL3ZWNDV0Z3pNajNWUzhMRkpGYXBsVWI0?=
 =?utf-8?B?WjJwQlpuVk1pejBHTms2R2txODhPUVFPUThRZTArbkZLMHhDQUFNNStzdmhz?=
 =?utf-8?B?bEdjWEhTZ1VyR1V0YnByWTdSL2pxdFRnMU9EckFiMC9xekxjaEVsMVJLZVNi?=
 =?utf-8?B?eFdUZ21mUHJhME5jdDZ5am90V3dnRmZnNUp5bE5hb0J5RUZvVytKcmZiS08r?=
 =?utf-8?B?NDlrVEpSa3krLzh2bFliVnROMEFOSmNOYVVybmxUbmRQM0ZGMnlDUWtOZHB5?=
 =?utf-8?B?QllrUTlBM3A3TG16ZnJGcTNDUzNWakY0NmNZNzNvaHBWck1QanNsNE1HbTli?=
 =?utf-8?B?VjRiR292NUZuVjZlU3lNQkp0NW83cUoxb2RRUnNMK2FnZHk0KzVYcFJYMVND?=
 =?utf-8?B?eXlmV203UklqRUdmRUpCVGpZWEg2L0p3SEFNYlhoNmZuczVnZERKZ0pGNGxW?=
 =?utf-8?B?S0toNEN4a3ZPSGorRzFjQlNCOGFrMjZrZmp6VDJ4UFBlZDhuaGhPVXdEczkx?=
 =?utf-8?B?dStHQUhYbFF0SHNySWdJdnlid1BZd2lCb201N1N0L01iTDkzclVBQUZxZlRj?=
 =?utf-8?B?M0JqbUdLYjBveXpiUkVqckdwVmU0RHZNbldudzc5ZXpPeTcwSjVGd29KUDcy?=
 =?utf-8?B?aktON3pSTldKUE5BeE1FaUFRWG9Eb0F0NG1VRmRYOVkwUmNoeUFRYW4zbGJQ?=
 =?utf-8?B?ZW9Cei83OVF5TmZoOWx3VUlTblp4dXNmaVIrMjJiTzdrakVTSWliMzJyUUFu?=
 =?utf-8?B?NmtVRTh6WkdtRjk3ZDhYZGFnOHJnNnhuK2tDaU5hcGIrSzBDcS94MVcvZjNy?=
 =?utf-8?B?SWYwTjA3ellDckdLVUtpQTNHSXFybG53NmpPUEdnU2xuSFFYbFU2Qzc0K3cy?=
 =?utf-8?B?OUF4MVA5T2s4MUdnSG40T0o2ODlpalZHYlpOVjIvalBqcFZlQUh3dGpkekRn?=
 =?utf-8?B?ZDJSemUyelpKeGExbkhBMXJxVTRmbUUwTmpyRVF5R08wS2ZxaURWTjFRS3dx?=
 =?utf-8?B?WWlaMnprL3RpZy9ucWl5dGl6NXJ5amQrYjQ3bUt0Q1drUHhKY0dBUUpzY0Rj?=
 =?utf-8?B?aXN4Qi9Ydnk0MXFsVTZPTWEyQVVMQ0phN3piOVVqemo3a3NOd2Z3RG5ZdHNr?=
 =?utf-8?B?dnpjWm9ZNGZ2bGVvUjE4SnhBM3BuVEd5ZVdGZkE3ams1VUJOMnBNWC9nMTVB?=
 =?utf-8?B?c0JIbTNmaUlDMFZyc2lYR3EyWk1LNmVQUlBJOS8ycnNMem9GOUtXZEJvRWF6?=
 =?utf-8?B?NElVSStBQ1R5SVduaVNiVThXRUprNGhYbEtNME1rcnBqRFdhWk1oYzZBcEIv?=
 =?utf-8?B?cW1zT0x0ZXBuYmtlWHlrTEY5amdqTzNldFVjaWkybFFTUWRvWmpvb09ZbnQw?=
 =?utf-8?B?V1NETzBCUEE4WDdrSVZWM290aDY4N2ZNYmxaNW9tL0NSL1V1NWpSeFBqUUtp?=
 =?utf-8?B?Tmszbi9QVXJndDNBckwzUGxiS3VQRDlBZDhtaEZsemkyTFZ4NlJscjNsM0tH?=
 =?utf-8?B?OFNYekx5d1AycVNIVTZUdkYvQ0NnRU04ZEZPNXJyNG82VEw3NUh3WWR0dklR?=
 =?utf-8?B?bzdTNEpDczY5cUVGSWlSRyt4RmRoUDJnc0FnWmE5SHVCa0djZmlod21OSHZ6?=
 =?utf-8?B?dVJOK3dFR1YwNld4YlJzcnBpblR5Z1I4NyttV2RFZnFZMTgvV3l4MU5EQVU5?=
 =?utf-8?B?d3hxeE1STm5vOWhMSmRac1NIYzVFck5JcnV1eUd4U0NFN0kyZGxXRXNoaVJS?=
 =?utf-8?B?NkdWS0dzLzRsa2YrdHlmRENVcXZReFVJbE1nd1daWGtFTGd4MVlnL2JTSHNI?=
 =?utf-8?B?U3p6SVFtdVVveHRmYzRpTjhCZ0loTDNMWlBMU0NPSlllRmMxbk4vK2RkM1pV?=
 =?utf-8?Q?yXstBbt3ZY28rrBIZDKQiNqEpT+gLC2I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVJ5SWErMW5oazlUYkZsZG5tNzlXRzJOUUhmREVGRm1NaEFTdFdtODNheXMr?=
 =?utf-8?B?VjErVzNhZmNKbVJYL3h3QjQrMlRRTlppa0NuUk5hVFIrQmptWGI2LzQ4Y2hz?=
 =?utf-8?B?WkR4RCtwMEMweDBleFhkcUoyT1RWOW9lN2thWUVsUGhGS2hQb2pCWk9ncjNm?=
 =?utf-8?B?N1lkMGplL3FsSC93QXVXY1NoWjFtR2I0c3VvZEFwc3l2UjFrVnZ6YlBaNDBj?=
 =?utf-8?B?QjNUOXFSZVA2eGVxakZoaXh4ZWs0MFI3M2F5L3V3OWNaenh3eHRWYlluRG1W?=
 =?utf-8?B?TmtXL0xFYVhNWE1Xb3djZThDdFlnaENEZHBNakF0N2VpQUFEb0ZyUm1yMTNq?=
 =?utf-8?B?UlVCQWcySTd5UEgwMDBVdTd3YWNrRU53RGFvcGEwV0U4b2RHV1oxUGlCL3R6?=
 =?utf-8?B?aXk4ZGszYlFpZHQ0UDJ2WU9UMSs3STl3UmRsUWQzOTQyTnkzQXdqaEtDbisw?=
 =?utf-8?B?K1Bzb215ZXgyWW9SeVhuSUlmUHMxSnBGU1M4VGs4U1dzTXRRWGRiR2xnM3NM?=
 =?utf-8?B?ZG5TWTUvS0ZVczJJVlFFUkorUGZHa0ovcXBtRzNQVU5rV1dTb3pSd2NpdGMz?=
 =?utf-8?B?M25iWEIrVkpPT0lPYTAzZEwvQXZGUmQ4bzlaTlE5ZXJuRTRhWTdhMnZPZ1Vl?=
 =?utf-8?B?NTNnSFArM3kvekVjcll5WjZTenJZRGlLUHppZ3U5NGhwSGwxbVhYUzBSZEJZ?=
 =?utf-8?B?b205RDlUY2tYV3BMMjVsY3lMcFlwS3VEOGNCcmYzeG5HenlyelV1ZnYwMW9X?=
 =?utf-8?B?MDROOUU0YXBOc1JRemlEajFRdmlMaUNlZHlQTjVBc0JRa0ZIVWtZbkJXUC9K?=
 =?utf-8?B?MkNFVllVN1hwc3NZcm43L3dUZkVueklUVVBHcEplcXlLTGZuODJmMExaMlN6?=
 =?utf-8?B?TjF3bDV3Y2ZNN2NiSTA4M1RtbTJ3UWEwTDlqbjFEczFuRDB3NVBtUXI2ak9L?=
 =?utf-8?B?a3ByQU92bmJUOHhUZjlPV09nZWZKckJQNExodEtmNFJmMWJTRzFGeVc0eTNK?=
 =?utf-8?B?TWM3L2ptaHltWE15V1JmWkEzUGNVV1BubXUvNC94NjZPZkZIVmR1WW4vMTZi?=
 =?utf-8?B?MkZuejY2TzAvNnM2T09QL25kZG1odXR0TWY4aEQxQ3gvVHlsTzBNUEhMYjZ2?=
 =?utf-8?B?OUdwcjlKOEFpdEJ3VDkza2ZIUWJCMm05MEdUQzFFcGNPWFFUck9XRlJPYXZU?=
 =?utf-8?B?ZXdJb0JEeGpkUStOU25ROXh6UHQzSXdsWVpYbG1zWHdSM3Z6ODdMajBWMFlw?=
 =?utf-8?B?aW0xSU1hdUI3ek9VdTNtTU02bHZYV2dGaVhMV2tBWlZaNWJ1djcwMjF0UE9j?=
 =?utf-8?B?MHM1UGRiWVJEdUhUYytjVGFDZjVQNGpDUURJd2hoR25qVWJlOGhJMHUreUZQ?=
 =?utf-8?B?NUZlamp3dnVMVzJEak5oNDhCa2dIQk93eE42eW9MU2lVQkNWMDJpWGw5aDA4?=
 =?utf-8?B?eW5Xb3dONmR1eUJiNDlQVVNvVUR4Q3ZNSTgxWmZtandvNFdwYVJyUnF2UHFC?=
 =?utf-8?B?NjQwbVNZcEs4MGs2SG5mS1BDNmZ0T3I2RngxT2hoc1Y3dDZidStuTk1tRnZ3?=
 =?utf-8?B?OGNCaHFzWHNyb01veWcwSTVBVS8wNEJVZHJiVUwraWYveWY4b1JpYXFSSUFH?=
 =?utf-8?B?di9DdTJqVFpGOUNCTHFjOFljaG5WWUNhR0hrQ1BQcnV6aUtyUVM0NkFFOEI4?=
 =?utf-8?B?cFNEOG9BQWp5cWJhYUV2anBoMFo3ays0L1p6QWhaTU1WTjhmSW9kcmVXbjg3?=
 =?utf-8?B?aHVsT3UzakNEVlR1WXEwUW9RWm4yQTFNY1BDZzRpSHBkMjdrZkM2bnhWT2VC?=
 =?utf-8?B?SUMvVWgvbEkrWTVPc3hrQ0Q0S3lvaHljZXpFMFFvWFgzUVMzMk91RkpyS2lB?=
 =?utf-8?B?Y0Zad2JtWGs0cXAwZ1oxdUFQSElKTlEzR0xiZ0ZWeW5KSGNYU2F0Ty9qNnhu?=
 =?utf-8?B?d1hTdUFyb0pZK1lMbDNZTXFFams1RElNN3RFdng1RERNSFJQallRUjI3Zy9N?=
 =?utf-8?B?eHlUV2hJbENLcVNPN3MxMnNIVUJ0VmF2ZFR6Uktsd3o2d2pqdmc2cXpRc2N2?=
 =?utf-8?B?K0VWRGU5NC80RTU0cHZQSUN1MDNFdjRNUHdZempIOEhGNHF1OElsd05TQW53?=
 =?utf-8?Q?DNzc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e1ebcea-c404-4728-5ec6-08dda396bc3f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 18:36:35.8075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNONoxEwZpUFnmAt9V18LWNP5hZ/tYWFVBgKVT1SzAZZOBLIcdSJSK1H0TeVcmQNaP2mKPQxirumOQEMgQ1lIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11358

On Wed, Jun 04, 2025 at 05:48:57PM +0200, Jorge Marques wrote:
> Add nodes for ADI I3C Controller IP core.

Add binding doc for ...

>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  .../devicetree/bindings/i3c/adi,i3c-master.yaml    | 63 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 68 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..859dbfde15f123db59d7aa46c120c4a3ac05198e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/adi,i3c-master.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices I3C Controller
> +
> +description: |
> +  The ADI I3C controller implements a subset of the I3C-basic specification to
> +  interface I3C and I2C peripherals [1].
> +
> +  [1] https://analogdevicesinc.github.io/hdl/library/i3c_controller
> +
> +maintainers:
> +  - Jorge Marques <jorge.marques@analog.com>
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +

New binding, generally, allOf between required and unevaluatedProperties

> +properties:
> +  compatible:
> +    const: adi,i3c-master
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: The AXI interconnect clock.
> +      - description: The I3C controller clock.
> +
> +  clock-names:
> +    items:
> +      - const: s_axi_aclk
> +      - const: i3c_clk

Needn't _clk surfix,

- const: axi
- const: i3c

Frank
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i3c@44a00000 {
> +        compatible = "adi,i3c-master";
> +        reg = <0x44a00000 0x1000>;
> +        interrupts = <0 56 4>;
> +        clocks = <&clkc 15>, <&clkc 15>;
> +        clock-names = "s_axi_aclk", "i3c_clk";
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +
> +        /* I3C and I2C devices */
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b82704950184bd71623ff41fc4df31e4c7fe87..6f56e17dcecf902c6812827c1ec3e067c65e9894 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11243,6 +11243,11 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
>  F:	drivers/i3c/master/ast2600-i3c-master.c
>
> +I3C DRIVER FOR ANALOG DEVICES I3C CONTROLLER IP
> +M:	Jorge Marques <jorge.marques@analog.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> +
>  I3C DRIVER FOR CADENCE I3C MASTER IP
>  M:	Przemysław Gaj <pgaj@cadence.com>
>  S:	Maintained
>
> --
> 2.49.0
>
