Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013052.outbound.protection.outlook.com [52.101.72.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4E1EFF8E;
	Wed,  4 Jun 2025 19:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749064227; cv=fail; b=VfFz8YImG784gMp5ADsfqZ8K9rciSK2bQsasuVks+Fnzxy5XnJVuhs6xbazsa8ncnmk6ozwMNscYj53tDYsCVUPdZoZcAbjweBBmUaM62L015TRlM39CicvhnfcRDX4DibD2jBarGO2GcEdRikx3OwdTj202UWZu3iD66SHUQE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749064227; c=relaxed/simple;
	bh=XfPMLK59IzUkaTrkSNE2aH9cEkpGWnO2TWueT4Aqf9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=id0SFyVyjMcAvzBcn8FQNnM4QMFQewdFeGsA4KdUfQvd/zrLnng6HF9YjvXUMC2fHBY76ex7Z/bDuollYaDYs9fdcTAr7Fg6j5MuMeEKLTGT1IGirfvo6Uv9L1XfRywamevF4nCjC1hkeit/rVScko6tv87N9ea3K/+s50yCzs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jrgMR4l5; arc=fail smtp.client-ip=52.101.72.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jrgMR4l5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bwbo3/ILr1xnJyEJXnu97kwTC3/2goZYEyFEqzoHL67tS38ICwznYFTF+4t/5zk7EDdDf6rnTbnEZQ2j0k1moFg+zCWSuG9xx+rUC5kJjPMHRjkyHSZE7o+bh2Tv6p/2EzyZ0H03UGHSJfqt4dMr3ne0M/8MoYSar5s5JvpuadxYCT/bNZq+TRLv3JCrejpdhkb/FEpxowE7H01+AL1scf9KAMOpZJZNqE+IaaPGTbPOVeL+pSj7d1p8Q/oOGaBAdedKjTC/0k8C4J8NhsyP62i5e2dvECiqcbVRJMwJa/dMb5+iYfuejKk5jU5d2liNusPx1AJwNHAEqmVT1f2Reg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJU4ZGETRmPYPdcuMdi5HR14+9IhyX3G9QBTOAFJ3lg=;
 b=fp6MhEMXUPe+DyQxh2SK2b0vzFYGi682gUmVWm0fVEff5bu9fyD3REao7ESX76wF32vgcaw0N1FvKAUykPklQzXcp1GxuEGrpLXB3mJ/1EKLqXO1eynIYRJDV5DOc+mG6Rn2A7PkaJilRUadMAWrwT6wGqX6Og4KDsFqOw/FGlG38W27/OpwALR77VaGLL1m5CmDX6rB7vZHBXV8sDswriyCjFQBFwIO7eEnuYrI0gpgbL3n/VRxM0aQ0lTu2Xhhvk/7kB7N07wP8mGvA8qrK/KOsTrZNo6M4vuRNaINaChz+7vLLFvOosp7n7BIBVmNYXxtMw+QmVEQI/evfSQlBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJU4ZGETRmPYPdcuMdi5HR14+9IhyX3G9QBTOAFJ3lg=;
 b=jrgMR4l5nYe9M/P0EvCLsLZVBFiH+2dvu0CYNKExrLtuVuVPjYlIfIV7T1lRO1JfXxas93vA8vz8AnJH+xtyao/4l/ezuHOKrL/EmFGbWtcTBMRAN8iYX/mEjCEI0w6f2tNNihZGZkM55nwDsssmHUsOBMyrZNb5RejzzSSeTYXHXFSqpg3gI+lBRkBXRDnwW4mAN3ILD3opCcf3mHo6dELmBh0hUA3T9E9yVs2YYZEYSg05s4JK0jJvTyu/kB6Jn72X4TNRF79diQxpZ0TeM3zXcqkBeVcLlobh95mb35wKWUYRiF4w22ZYdPh6ywXeyGQb7u16nXEZpeGs3AH4Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7436.eurprd04.prod.outlook.com (2603:10a6:102:87::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Wed, 4 Jun
 2025 19:10:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 19:10:21 +0000
Date: Wed, 4 Jun 2025 15:10:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <aECaFQzkPYdfjagK@lizhi-Precision-Tower-5810>
References: <20250604-adi-i3c-master-v1-0-0488e80dafcb@analog.com>
 <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: 01266cbf-08bc-4fd5-9b29-08dda39b737d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnZNS1hNK05ENXJpaUpOR21LNHBtSC9iWGsyVVRvbDBsNTA1b0Fvc0hxc1J1?=
 =?utf-8?B?OXFLMHZsY1FWN2lRMWwwUUhlTzZvZVBCb1k1QnBnNVF1c2hmTlFuWkgzSE0z?=
 =?utf-8?B?MXVkZ1lyZWNuWnlZWHNkbFJkMlluSEd2L3orMVdaRy9CemFUSmh0Q3dDVHA1?=
 =?utf-8?B?M2h3SXFmWTFvcFRySWpUY1BQZisrSldLUDFTYWdHTjFFM2huNnlxZFVudklP?=
 =?utf-8?B?Y3RFQ3lTMDJ3bmpER2xqOHVOcWQ0TDJpVy9TR1N5SW1mVkJvSTRFZEdCallq?=
 =?utf-8?B?WDliSWxUWG9yU09KN2NFK0RsT0RLbUtmcFl5NDg5RlNmd1dZQ3RHbTNxWHFH?=
 =?utf-8?B?VTlaK3RpZytaUDV0MUNxMlZUMDB4WE5CRmZIWmIzdThESllqWThUMHl3b01X?=
 =?utf-8?B?UU9MSG9jTjhqRmR2TDhlWDlKWkFDUUcvbjNxMkp1VzczZHRzZ3VJbTlxajA3?=
 =?utf-8?B?UnFHYWRTeHMyL0dkYmw0eEJqY2RIVnRSVzZ6OVBiR2VHRlRzNWhnQnVRY21O?=
 =?utf-8?B?Q25UUXVQeVRaemFUaU56MENsVUlyKzRsSUduWlZFbGI0a3k2cVowL2tKU0k1?=
 =?utf-8?B?emdwK25DMU5TVldpYlFiUDZvQzArMEdoRVMvQURocDgraWRxRTFrdnNzL29W?=
 =?utf-8?B?TStlSU1zRnVJZHFldktkcFRETE9GKzNxMkFtM0ZMSU5Ka1B4UVo0Z2cxQXpj?=
 =?utf-8?B?TkNKUWlkcFVuQ0FXR0ZkMWVpcXZ1VXdBSSttM1hFZTg2TXFyaUZnN3g2b0ZQ?=
 =?utf-8?B?Nkg1Y2tiNlM3UXJoTVJLNzMzM3o1eDV0dUlKem1ucGt3VC9CUVp2dUVGYVhY?=
 =?utf-8?B?WDRYRlpwRkU1Ui82SjRFQUxiR0wyYzB0MGNxNzFnUmZYYWJNZ2s4VWh3Q005?=
 =?utf-8?B?QWJyL3NCNlBpK0o5RVltMXAxRXFaalFhOEozWVM1bVg3blp6NWVRRWRlQ3Fi?=
 =?utf-8?B?NnQ5WFRHZjgrUnpoTzhHVno5RXcvUk5SMEMxNEJUa01oVmxGa1RLb1RtVjZP?=
 =?utf-8?B?Z3VUa1NYQ1o4UEtsalk2b3VjcksvNkVITXFBZzU5S2ovSFhUSXZ2U3h0NGxP?=
 =?utf-8?B?NU1tYUdpUnVDRnhVT29PTy9ONDRUeW15RDF6NjVCYUEvTGt1ZnF3MDNqRHVV?=
 =?utf-8?B?WmpYV2JOaS9qbTMwWDlXSCt4Y2FrK3YyQWtwcTJSbWpFalpjNkQvQ2JXaURq?=
 =?utf-8?B?M29saFBFQU4yc2YrcHJ0cDB6YjYycEpYR3dab0VBalJhbDVVTmlFT3pmRGVs?=
 =?utf-8?B?Z25xOS94d1VRMVNqTXczUFlHY1hJOUJjK1pYY0ZzQlR1aFBIVFhyZlVrejBH?=
 =?utf-8?B?NWY5OUk1U2p3ajZXQUNIUWRvSDM4NkdhYXNlSWU5MGM1Q2xrUXp3N0NaSENv?=
 =?utf-8?B?eDdjZ01EcGlkRG8vOTU4b1g0VElmQXVDYTk4SWM0RFBFVW0zNk54cnNtL1V1?=
 =?utf-8?B?V0g5S1U3empIbnVBcENwTXh2VDZ4QWNzeFRTMUk3bTJCUFY5cmZRdWZKOS9u?=
 =?utf-8?B?bHltaGRKeXZHV3JndWhNMzlVc0t3bHVlSlZZamh0MDRJS0VpZS95WUphMzJk?=
 =?utf-8?B?SnVuUlVBcnVGRTRGOW8zdXIyOG1BZjFCVjJEOXhoVFJhbGwxb25LdDZwVUhl?=
 =?utf-8?B?WHBpNjZmYzBobzMxNmhTTWthRjNoL3FBSG52cXpxQzJaZEQ4VHI0SGpLeUdE?=
 =?utf-8?B?Sy9sNFF6MmV2NUJGcTVha1BuNnJyQ0hzblZ5dkx4Mk5oNlQ0T1NSVHp3YjF0?=
 =?utf-8?B?QVpvZTd4eWd4OUVYb1Y3eUpObmg5cHNTMy9NWW5jTG1wVW5YbkIybDMrOWZS?=
 =?utf-8?B?SUdzemFOSHc4QnlKZnNYK1F1OTV0YkhYRUVtWjFUd3ZFN2FzVEhsaFcrK2hk?=
 =?utf-8?B?MkgzaytYWXVvc2syUWNkbk8wanBXMFVhcU1vVncwL1lOcFJzZHp3TmZkdkM2?=
 =?utf-8?B?TTVDYm4vZFc1R0lOLzBNZCtqbHMrYnpRaHhRSkRKWmVnV2UxWW5vN2h3Vldw?=
 =?utf-8?Q?VkcfMRRb2Rew0Z8T+e4q/PK1eaJ4OY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzdLV0JJbkNlQmNyM01RamtNZmV5RDZoZklRMEc5THROQ0pTelFUM1l3VUdL?=
 =?utf-8?B?dm5GaE1oMHlwV25HN1Y2N1pScGZzT2NtQVpGbHFxUUJEeHU5UHFBY0dRSHU0?=
 =?utf-8?B?MmxDYTlBVUVWTFFTOGtNQmJmYnF0bHVTT2taVm1qZVo0WmVzSzJvOXRBSkQw?=
 =?utf-8?B?Q0VNTC9Bb1BPNndndGExejZyYzZDV3Y5VzJZRGFqQ2hxM3dPdGRNUVdpRXpY?=
 =?utf-8?B?dzVhQjRMNUtqWHRPWjR5c3lTY1ZGL3g0cStUUjVnWTRTS3hlUmxrUi9NQnR0?=
 =?utf-8?B?QmVDR3c5Vk14bGNsUkFHbWFUSjFrM0tJN0dOVTBaTjgwaEJuM0ZIOStNaDJa?=
 =?utf-8?B?V0Y2dzVhdXpOK000Y2hZTytTNTRGTWFXSlE2Yld2ZVNrWkJMRURLT2FkcVY3?=
 =?utf-8?B?cFl0YTFHU3J0ZldvZHN6Y1l6dmdLYVBKaXJhSWdla21rdHRhRmREMHJqUUFB?=
 =?utf-8?B?Y0lCOVI3UUJES0hLbkMzdWcwZnpDb25Sd3haOUdpV3NYS3FYL2EzVldjSGRn?=
 =?utf-8?B?dnk3d2hPSXpEQWJCNkJiRWlaYXQ4MEoyTUc2dWtIU1NvMzd5QTR6bUVIb05W?=
 =?utf-8?B?UHR2cnZ0blNTcEdINjBybGZ2TWhVeElPZU5BVjQ4dWU0eXI2QnVXNUE1RE9h?=
 =?utf-8?B?OXR4L1JwSzNmL2gwYmtOMjgzZWtCYmQ2Nlo2czd4OS91NGNjbGdXa2pXa2Zu?=
 =?utf-8?B?YVVPMzc5eGlFYkVWY054SWR3a0YybHgyYTlieUJwUnpXaGtHUHRlekZDcW5W?=
 =?utf-8?B?bERKSVJxSWx4Z3QrbFg0YWI4Sy9YTWxIY2dTanVoc215OTBzNGx0WDBxWDZ3?=
 =?utf-8?B?dmloNlJTRTI5S2pWL2hhUlkzN2pLOVZtRmxBYXhqYnRWUm5rZzQ3WDNIaVR6?=
 =?utf-8?B?YnZpQXVmbDhPZ0JwOHFQdVV1Zmk5QUhudHQ2UHAxdVJrWW5XWlFPZmJOUWU1?=
 =?utf-8?B?WTlHeU9HN2pJUlpkNm5XVzFEa0g5dDc3bkRJSXUzMHFNbFc1UFBsTG1aYTd6?=
 =?utf-8?B?ZVpmRytrTjR1ckJDWUFvTUFIUUZweUZYWlFWTU93L3ZIOFFYNnJpQlZmQk0r?=
 =?utf-8?B?L1I1VWtyVXFEQkM2Uk96Vk5SZG1GQXRnUS9qeWE5a09kUXFEYTlSZFVaUWxI?=
 =?utf-8?B?SmVBU1FBNWFBeWt3TVpJYkUrT2dwRkZvRHJSNmIwNlE0VlFvNW5GUm9tL1hN?=
 =?utf-8?B?SCtnNThFMkFoVHFrL0NOeG84SXdtNmRCTEZrNWVxOUdtZEhaeDlGY1VYeTlU?=
 =?utf-8?B?NGRyZWdSLys3NS8vQVBKN1VCWmtFWUtJZGZSSlRQcU1Ob0ZMQWNUTFBxOEdn?=
 =?utf-8?B?bERqc25Zc2VNbktEUDR3Y3FEa2EyVkY1aVEwWm5TWkNsc2ZyTVdPVDl3cERQ?=
 =?utf-8?B?NVJpbWZmVjQyYXFteHh3bGQ1STNlUXRtYzIvU2pKYXZKZVFIUHRSc2lIekdZ?=
 =?utf-8?B?aWw5L3NHMWU5MFFka1A0SHp0azRQdnphVUlOelhkVVZWMlg0UmZqalptRzhJ?=
 =?utf-8?B?VFRYV2pFUVNwTCtzYjhBV2lMcm56YWNrWHM5OGxGRWxvV1kyR3VIR3Zab0Ux?=
 =?utf-8?B?cm9rWjhYdGh1OEl5R01waWtkQS9BQTE0cy9FR24yZWgrN1dIaHVrZExoRlV2?=
 =?utf-8?B?VENVS3Y1S1NYMzFtelY5cGJacHE2MEhyZk9xOFdPYTdwWjgrTS9HK09IaWpl?=
 =?utf-8?B?bHM4bnVlMHBXbVdiQTRmM1U0NWJZbEhNWlgrbk0yUXg4NkdKUXlGaktGYjFC?=
 =?utf-8?B?Sm1UY0JaeHlCUzgrdGVmczN6VGFGSi9LQVdsaUtUVU93T3I5RGxqK2t2ekgv?=
 =?utf-8?B?ekNIaStwK0tvVzcwVDZmYjBnN2MwRE1OUTlITzFEQTZDNmVlWHlBVlVXRmNL?=
 =?utf-8?B?UzFJUlJwdTAxd3pmTml2NkFxUGpSamRpciswekZzbFNVSFJJQmx4OTRITmND?=
 =?utf-8?B?dDlMRWExcVFLVnVNeS93dWhFZDdXVlZiNTR2VVRCdW9MdWNHRWhUc0duZndI?=
 =?utf-8?B?NUtRakh6SFB3L09yNHJTci80Qi9yNHpyT001eXVQMHBybEsrTVg1Z2F0aDNT?=
 =?utf-8?B?cEJxYWpyelRGNTVoMEhGenBoMmluaUdvWC9RUkpkV1VpSERwUDVydXc2dk1Z?=
 =?utf-8?Q?ufCz1uqVQtdDWX7K8owMHRaO3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01266cbf-08bc-4fd5-9b29-08dda39b737d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 19:10:21.3599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V+4tfyMwglm/tnizFxvGNCebW8tmlp8f/OAjpUZ4IwfkR6AIBkTigbpKpNGeGI2sSG2/NCewBB12Q8PRrwCgKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7436

On Wed, Jun 04, 2025 at 05:48:58PM +0200, Jorge Marques wrote:
> Add support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> core that supports I3C and I2C devices, multiple speed-grades and
> I3C IBIs.
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  MAINTAINERS                         |    1 +
>  drivers/i3c/master/Kconfig          |   11 +
>  drivers/i3c/master/Makefile         |    1 +
>  drivers/i3c/master/adi-i3c-master.c | 1063 +++++++++++++++++++++++++++++++++++
>  4 files changed, 1076 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6f56e17dcecf902c6812827c1ec3e067c65e9894..9eb5b6c327590725d1641fd4b73e48fc1d1a3954 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11247,6 +11247,7 @@ I3C DRIVER FOR ANALOG DEVICES I3C CONTROLLER IP
>  M:	Jorge Marques <jorge.marques@analog.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> +F:	drivers/i3c/master/adi-i3c-master.c
>
>  I3C DRIVER FOR CADENCE I3C MASTER IP
>  M:	Przemysław Gaj <pgaj@cadence.com>
> diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> index 7b30db3253af9d5c6aee6544c060e491bfbeb643..328b7145cdefa20e708ebfa3383e849ce51c5a71 100644
> --- a/drivers/i3c/master/Kconfig
> +++ b/drivers/i3c/master/Kconfig
> @@ -1,4 +1,15 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +config ADI_I3C_MASTER
> +	tristate "Analog Devices I3C master driver"
> +	depends on HAS_IOMEM
> +	help
> +	  Support for Analog Devices I3C Controller IP, an AXI-interfaced IP
> +	  core that supports I3C and I2C devices, multiple speed-grades and
> +	  I3C IBIs.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called adi-i3c-master.
> +
>  config CDNS_I3C_MASTER
>  	tristate "Cadence I3C master driver"
>  	depends on HAS_IOMEM
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 3e97960160bc85e5eaf2966ec0c3fae458c2711e..6cc4f4b73e7bdc206b68c750390f9c3cc2ccb199 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_ADI_I3C_MASTER)		+= adi-i3c-master.o
>  obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
>  obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>  obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..6f44b0b6fc2020bb0131e8e2943806c0a9d9ce7b
> --- /dev/null
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -0,0 +1,1063 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * I3C Controller driver
> + * Copyright 2024 Analog Devices Inc.

2025?

> + * Author: Jorge Marques <jorge.marques@analog.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/i3c/master.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#define VERSION_MAJOR(x)		(((x) >> 16) & 0xff)
> +#define VERSION_MINOR(x)		(((x) >> 8) & 0xff)
> +#define VERSION_PATCH(x)		((x) & 0xff)

Can you use GEN_MASK and FIELD_GET macro for it?

> +
> +#define MAX_DEVS			16
> +
> +#define REG_VERSION			0x000
> +#define REG_ENABLE			0x040
> +#define REG_IRQ_MASK			0x080
> +#define REG_IRQ_PENDING			0x084
> +#define REG_CMD_FIFO			0x0d4
> +#define REG_CMDR_FIFO			0x0d8
> +#define REG_SDO_FIFO			0x0dc
> +#define REG_SDI_FIFO			0x0e0
> +#define REG_IBI_FIFO			0x0e4
> +#define REG_FIFO_STATUS			0x0e8
> +#define REG_OPS				0x100
> +#define REG_IBI_CONFIG			0x140
> +#define REG_DEV_CHAR			0x180
> +
> +#define CMD0_FIFO_IS_CCC		BIT(22)
> +#define CMD0_FIFO_BCAST			BIT(21)
> +#define CMD0_FIFO_SR			BIT(20)
> +#define CMD0_FIFO_LEN(l)		((l) << 8)
> +#define CMD0_FIFO_LEN_MAX		4095
> +#define CMD0_FIFO_DEV_ADDR(a)		((a) << 1)
> +#define CMD0_FIFO_RNW			BIT(0)
> +
> +#define CMD1_FIFO_CCC(id)		((id) & GENMASK(7, 0))
> +
> +#define CMDR_NO_ERROR			0
> +#define CMDR_CE0_ERROR			1
> +#define CMDR_CE2_ERROR			4
> +#define CMDR_NACK_RESP			6
> +#define CMDR_UDA_ERROR			8
> +#define CMDR_ERROR(x)			(((x) & GENMASK(23, 20)) >> 20)
> +#define CMDR_XFER_BYTES(x)		(((x) & GENMASK(19, 8)) >> 8)

use GET_FIELD

> +
> +#define FIFO_STATUS_CMDR_EMPTY		BIT(0)
> +#define FIFO_STATUS_IBI_EMPTY		BIT(1)
> +#define IRQ_PENDING_CMDR_PENDING	BIT(5)
> +#define IRQ_PENDING_IBI_PENDING		BIT(6)
> +#define IRQ_PENDING_DAA_PENDING		BIT(7)
> +
> +#define DEV_CHAR_IS_I2C			BIT(0)
> +#define DEV_CHAR_IS_ATTACHED		BIT(1)
> +#define DEV_CHAR_BCR_IBI(x)		(((x) & GENMASK(2, 1)) << 1)
> +#define DEV_CHAR_WEN			BIT(8)
> +#define DEV_CHAR_ADDR(x)		(((x) & GENMASK(6, 0)) << 9)

The same here.

> +
> +#define REG_OPS_SET_SG(x)		((x) << 5)
> +#define REG_OPS_PP_SG_MASK		GENMASK(6, 5)
> +
> +#define REG_IBI_CONFIG_LISTEN		BIT(1)
> +#define REG_IBI_CONFIG_ENABLE		BIT(0)
> +
> +enum speed_grade {PP_SG_UNSET, PP_SG_1MHZ, PP_SG_3MHZ, PP_SG_6MHZ, PP_SG_12MHZ};
> +struct adi_i3c_cmd {
> +	u32 cmd0;
> +	u32 cmd1;
> +	u32 tx_len;
> +	const void *tx_buf;
> +	u32 rx_len;
> +	void *rx_buf;
> +	u32 error;
> +};
> +
> +struct adi_i3c_xfer {
> +	struct list_head node;
> +	struct completion comp;
> +	int ret;
> +	unsigned int ncmds;
> +	unsigned int ncmds_comp;
> +	struct adi_i3c_cmd cmds[];
> +};
> +
> +struct adi_i3c_master {
> +	struct i3c_master_controller base;
> +	u32 free_rr_slots;
> +	unsigned int maxdevs;
> +	struct {
> +		unsigned int num_slots;
> +		struct i3c_dev_desc **slots;
> +		spinlock_t lock; /* Protect IBI slot access */
> +	} ibi;
> +	struct {
> +		struct list_head list;
> +		struct adi_i3c_xfer *cur;
> +		spinlock_t lock; /* Protect transfer */
> +	} xferqueue;
> +	void __iomem *regs;
> +	struct clk *clk;
> +	unsigned long i3c_scl_lim;
> +	struct {
> +		u8 addrs[MAX_DEVS];
> +		u8 index;
> +	} daa;
> +};
> +
> +static inline struct adi_i3c_master *to_adi_i3c_master(struct i3c_master_controller *master)
> +{
> +	return container_of(master, struct adi_i3c_master, base);
> +}
> +
> +static void adi_i3c_master_wr_to_tx_fifo(struct adi_i3c_master *master,
> +					 const u8 *bytes, int nbytes)
> +{
> +	writesl(master->regs + REG_SDO_FIFO, bytes, nbytes / 4);
> +	if (nbytes & 3) {
> +		u32 tmp = 0;
> +
> +		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);

ALIGN_DOWN(bytes, 4)?

Do you need conside big/little endian to trim down data?

> +		writesl(master->regs + REG_SDO_FIFO, &tmp, 1);

writel() is enough

> +	}
> +}
> +
> +static void adi_i3c_master_rd_from_rx_fifo(struct adi_i3c_master *master,
> +					   u8 *bytes, int nbytes)
> +{
> +	readsl(master->regs + REG_SDI_FIFO, bytes, nbytes / 4);
> +	if (nbytes & 3) {
> +		u32 tmp;
> +
> +		readsl(master->regs + REG_SDI_FIFO, &tmp, 1);

readl()

> +		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> +	}
> +}
> +
> +static bool adi_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
> +					    const struct i3c_ccc_cmd *cmd)
> +{
> +	if (cmd->ndests > 1)
> +		return false;
> +
> +	switch (cmd->id) {
> +	case I3C_CCC_ENEC(true):
> +	case I3C_CCC_ENEC(false):
> +	case I3C_CCC_DISEC(true):
> +	case I3C_CCC_DISEC(false):
> +	case I3C_CCC_RSTDAA(true):
> +	case I3C_CCC_RSTDAA(false):
> +	case I3C_CCC_ENTDAA:
> +	case I3C_CCC_SETDASA:
> +	case I3C_CCC_SETNEWDA:
> +	case I3C_CCC_GETMWL:
> +	case I3C_CCC_GETMRL:
> +	case I3C_CCC_GETPID:
> +	case I3C_CCC_GETBCR:
> +	case I3C_CCC_GETDCR:
> +	case I3C_CCC_GETSTATUS:
> +	case I3C_CCC_GETHDRCAP:
> +		return true;
> +	default:
> +		break;
> +	}
> +
> +	return false;
> +}
> +
> +static int adi_i3c_master_disable(struct adi_i3c_master *master)
> +{
> +	writel(~REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
> +	       master->regs + REG_IBI_CONFIG);
> +
> +	return 0;
> +}
> +
> +static struct adi_i3c_xfer *adi_i3c_master_alloc_xfer(struct adi_i3c_master *master,
> +						      unsigned int ncmds)
> +{
> +	struct adi_i3c_xfer *xfer;
> +
> +	xfer = kzalloc(struct_size(xfer, cmds, ncmds), GFP_KERNEL);
> +	if (!xfer)
> +		return NULL;
> +
> +	INIT_LIST_HEAD(&xfer->node);
> +	xfer->ncmds = ncmds;
> +	xfer->ret = -ETIMEDOUT;
> +
> +	return xfer;
> +}
> +
> +static void adi_i3c_master_start_xfer_locked(struct adi_i3c_master *master)
> +{
> +	struct adi_i3c_xfer *xfer = master->xferqueue.cur;
> +	unsigned int i;
> +
> +	if (!xfer)
> +		return;
> +
> +	for (i = 0; i < xfer->ncmds; i++) {
> +		struct adi_i3c_cmd *cmd = &xfer->cmds[i];
> +
> +		adi_i3c_master_wr_to_tx_fifo(master, cmd->tx_buf, cmd->tx_len);

what's happen if data length bigger than fifo size?

> +	}
> +
> +	for (i = 0; i < xfer->ncmds; i++) {
> +		struct adi_i3c_cmd *cmd = &xfer->cmds[i];
> +
> +		writel(cmd->cmd0, master->regs + REG_CMD_FIFO);
> +		if (cmd->cmd0 & CMD0_FIFO_IS_CCC)
> +			writel(cmd->cmd1, master->regs + REG_CMD_FIFO);
> +	}
> +}
> +
> +static void adi_i3c_master_end_xfer_locked(struct adi_i3c_master *master,
> +					   u32 pending)
> +{
> +	struct adi_i3c_xfer *xfer = master->xferqueue.cur;
> +	int i, ret = 0;
> +	u32 status0;
> +
> +	if (!xfer)
> +		return;
> +
> +	for (status0 = readl(master->regs + REG_FIFO_STATUS);
> +	     !(status0 & FIFO_STATUS_CMDR_EMPTY);
> +	     status0 = readl(master->regs + REG_FIFO_STATUS)) {
> +		struct adi_i3c_cmd *cmd;
> +		u32 cmdr, rx_len;
> +
> +		cmdr = readl(master->regs + REG_CMDR_FIFO);
> +
> +		cmd = &xfer->cmds[xfer->ncmds_comp++];
> +		rx_len = min_t(u32, CMDR_XFER_BYTES(cmdr), cmd->rx_len);
> +		adi_i3c_master_rd_from_rx_fifo(master, cmd->rx_buf, rx_len);
> +		cmd->error = CMDR_ERROR(cmdr);

what happen if cmds[0] is write, cmds[1] is read.

> +	}
> +
> +	for (i = 0; i < xfer->ncmds; i++) {
> +		switch (xfer->cmds[i].error) {
> +		case CMDR_NO_ERROR:
> +			break;
> +
> +		case CMDR_CE0_ERROR:
> +		case CMDR_CE2_ERROR:
> +		case CMDR_NACK_RESP:
> +		case CMDR_UDA_ERROR:
> +			ret = -EIO;
> +			break;
> +
> +		default:
> +			ret = -EINVAL;
> +			break;
> +		}
> +	}
> +
> +	xfer->ret = ret;
> +
> +	if (xfer->ncmds_comp != xfer->ncmds)
> +		return;
> +
> +	complete(&xfer->comp);
> +
> +	xfer = list_first_entry_or_null(&master->xferqueue.list,
> +					struct adi_i3c_xfer, node);
> +	if (xfer)
> +		list_del_init(&xfer->node);
> +
> +	master->xferqueue.cur = xfer;
> +	adi_i3c_master_start_xfer_locked(master);
> +}
> +
> +static void adi_i3c_master_queue_xfer(struct adi_i3c_master *master,
> +				      struct adi_i3c_xfer *xfer)
> +{
> +	unsigned long flags;
> +
> +	init_completion(&xfer->comp);
> +	spin_lock_irqsave(&master->xferqueue.lock, flags);

suggest use guard(spinlock_irqsave)

> +	if (master->xferqueue.cur) {
> +		list_add_tail(&xfer->node, &master->xferqueue.list);
> +	} else {
> +		master->xferqueue.cur = xfer;
> +		adi_i3c_master_start_xfer_locked(master);
> +	}
> +	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
> +}
> +
> +static void adi_i3c_master_unqueue_xfer(struct adi_i3c_master *master,
> +					struct adi_i3c_xfer *xfer)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&master->xferqueue.lock, flags);
> +	if (master->xferqueue.cur == xfer)
> +		master->xferqueue.cur = NULL;
> +	else
> +		list_del_init(&xfer->node);
> +
> +	writel(0x01, master->regs + REG_ENABLE);
> +	writel(0x00, master->regs + REG_ENABLE);
> +	writel(IRQ_PENDING_CMDR_PENDING, master->regs + REG_IRQ_MASK);
> +
> +	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
> +}
> +
> +static enum i3c_error_code adi_i3c_cmd_get_err(struct adi_i3c_cmd *cmd)
> +{
> +	switch (cmd->error) {
> +	case CMDR_CE0_ERROR:
> +		return I3C_ERROR_M0;
> +
> +	case CMDR_CE2_ERROR:
> +	case CMDR_NACK_RESP:
> +		return I3C_ERROR_M2;
> +
> +	default:
> +		break;
> +	}
> +
> +	return I3C_ERROR_UNKNOWN;
> +}
> +
> +static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
> +				       struct i3c_ccc_cmd *cmd)
> +{
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_xfer *xfer;
> +	struct adi_i3c_cmd *ccmd;
> +
> +	xfer = adi_i3c_master_alloc_xfer(master, 1);
> +	if (!xfer)
> +		return -ENOMEM;
> +
> +	ccmd = xfer->cmds;
> +	ccmd->cmd1 = CMD1_FIFO_CCC(cmd->id);
> +	ccmd->cmd0 = CMD0_FIFO_IS_CCC |
> +		     CMD0_FIFO_LEN(cmd->dests[0].payload.len);
> +
> +	if (cmd->id & I3C_CCC_DIRECT)
> +		ccmd->cmd0 |= CMD0_FIFO_DEV_ADDR(cmd->dests[0].addr);
> +
> +	if (cmd->rnw) {
> +		ccmd->cmd0 |= CMD0_FIFO_RNW;
> +		ccmd->rx_buf = cmd->dests[0].payload.data;
> +		ccmd->rx_len = cmd->dests[0].payload.len;
> +	} else {
> +		ccmd->tx_buf = cmd->dests[0].payload.data;
> +		ccmd->tx_len = cmd->dests[0].payload.len;
> +	}
> +
> +	adi_i3c_master_queue_xfer(master, xfer);
> +	if (!wait_for_completion_timeout(&xfer->comp, msecs_to_jiffies(1000)))
> +		adi_i3c_master_unqueue_xfer(master, xfer);
> +
> +	cmd->err = adi_i3c_cmd_get_err(&xfer->cmds[0]);
> +	kfree(xfer);
> +
> +	return 0;
> +}
> +
> +static int adi_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
> +				     struct i3c_priv_xfer *xfers,
> +				     int nxfers)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_xfer *xfer;
> +	int i, ret;
> +
> +	for (i = 0; i < nxfers; i++) {
> +		if (xfers[i].len > CMD0_FIFO_LEN_MAX)
> +			return -EOPNOTSUPP;
> +	}
> +
> +	if (!nxfers)
> +		return 0;
> +
> +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> +	if (!xfer)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < nxfers; i++) {
> +		struct adi_i3c_cmd *ccmd = &xfer->cmds[i];
> +
> +		ccmd->cmd0 = CMD0_FIFO_DEV_ADDR(dev->info.dyn_addr);
> +
> +		if (xfers[i].rnw) {
> +			ccmd->cmd0 |= CMD0_FIFO_RNW;
> +			ccmd->rx_buf = xfers[i].data.in;
> +			ccmd->rx_len = xfers[i].len;
> +		} else {
> +			ccmd->tx_buf = xfers[i].data.out;
> +			ccmd->tx_len = xfers[i].len;
> +		}
> +
> +		ccmd->cmd0 |= CMD0_FIFO_LEN(xfers[i].len);
> +
> +		if (i < nxfers - 1)
> +			ccmd->cmd0 |= CMD0_FIFO_SR;
> +
> +		if (!i)
> +			ccmd->cmd0 |= CMD0_FIFO_BCAST;
> +	}
> +
> +	adi_i3c_master_queue_xfer(master, xfer);
> +	if (!wait_for_completion_timeout(&xfer->comp,
> +					 msecs_to_jiffies(1000)))
> +		adi_i3c_master_unqueue_xfer(master, xfer);
> +
> +	ret = xfer->ret;
> +
> +	for (i = 0; i < nxfers; i++)
> +		xfers[i].err = adi_i3c_cmd_get_err(&xfer->cmds[i]);
> +
> +	kfree(xfer);
> +
> +	return ret;
> +}
> +
> +struct adi_i3c_i2c_dev_data {
> +	u16 id;
> +	s16 ibi;
> +	struct i3c_generic_ibi_pool *ibi_pool;
> +};
> +
> +static int adi_i3c_master_get_rr_slot(struct adi_i3c_master *master,
> +				      u8 dyn_addr)
> +{
> +	if (!master->free_rr_slots)
> +		return -ENOSPC;
> +
> +	return ffs(master->free_rr_slots) - 1;
> +}
> +
> +static int adi_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev, u8 dyn_addr)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	u8 addr;
> +
> +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> +
> +	writel(DEV_CHAR_ADDR(dyn_addr), master->regs + REG_DEV_CHAR);
> +	writel((readl(master->regs + REG_DEV_CHAR) &
> +		~DEV_CHAR_IS_ATTACHED) | DEV_CHAR_WEN,
> +	       master->regs + REG_DEV_CHAR);
> +
> +	writel(DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> +	writel(readl(master->regs + REG_DEV_CHAR) |
> +	       DEV_CHAR_IS_ATTACHED | DEV_CHAR_WEN,
> +	       master->regs + REG_DEV_CHAR);
> +
> +	return 0;
> +}
> +
> +static int adi_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_i2c_dev_data *data;
> +	int slot;
> +	u8 addr;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	slot = adi_i3c_master_get_rr_slot(master, dev->info.dyn_addr);
> +	if (slot < 0) {
> +		kfree(data);
> +		return slot;
> +	}
> +
> +	data->ibi = -1;
> +	data->id = slot;
> +	i3c_dev_set_master_data(dev, data);
> +	master->free_rr_slots &= ~BIT(slot);
> +
> +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> +
> +	writel(DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> +	writel(readl(master->regs + REG_DEV_CHAR) |
> +	       DEV_CHAR_IS_ATTACHED | DEV_CHAR_WEN,
> +	       master->regs + REG_DEV_CHAR);
> +
> +	return 0;
> +}
> +
> +static void adi_i3c_master_sync_dev_char(struct i3c_master_controller *m)
> +{
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct i3c_dev_desc *i3cdev;
> +	u8 addr;
> +
> +	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
> +		addr = i3cdev->info.dyn_addr ?
> +		       i3cdev->info.dyn_addr : i3cdev->info.static_addr;
> +		writel(DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> +		writel(readl(master->regs + REG_DEV_CHAR) |
> +		       DEV_CHAR_BCR_IBI(i3cdev->info.bcr) | DEV_CHAR_WEN,
> +		       master->regs + REG_DEV_CHAR);
> +	}
> +}
> +
> +static void adi_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +	u8 addr;
> +
> +	addr = dev->info.dyn_addr ? dev->info.dyn_addr : dev->info.static_addr;
> +
> +	writel(DEV_CHAR_ADDR(addr), master->regs + REG_DEV_CHAR);
> +	writel((readl(master->regs + REG_DEV_CHAR) &
> +		~DEV_CHAR_IS_ATTACHED) | DEV_CHAR_WEN,
> +	       master->regs + REG_DEV_CHAR);
> +
> +	i3c_dev_set_master_data(dev, NULL);
> +	master->free_rr_slots |= BIT(data->id);
> +	kfree(data);
> +}
> +
> +static int adi_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_i2c_dev_data *data;
> +	int slot;
> +
> +	slot = adi_i3c_master_get_rr_slot(master, 0);
> +	if (slot < 0)
> +		return slot;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->id = slot;
> +	master->free_rr_slots &= ~BIT(slot);
> +	i2c_dev_set_master_data(dev, data);
> +
> +	writel(DEV_CHAR_ADDR(dev->addr) |
> +	       DEV_CHAR_IS_I2C | DEV_CHAR_IS_ATTACHED | DEV_CHAR_WEN,
> +	       master->regs + REG_DEV_CHAR);
> +
> +	return 0;
> +}
> +
> +static void adi_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> +
> +	writel(DEV_CHAR_ADDR(dev->addr) |
> +	       DEV_CHAR_IS_I2C | DEV_CHAR_WEN,
> +	       master->regs + REG_DEV_CHAR);
> +
> +	i2c_dev_set_master_data(dev, NULL);
> +	master->free_rr_slots |= BIT(data->id);
> +	kfree(data);
> +}
> +
> +static void adi_i3c_master_bus_cleanup(struct i3c_master_controller *m)
> +{
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +
> +	adi_i3c_master_disable(master);
> +}
> +
> +static void adi_i3c_master_upd_i3c_scl_lim(struct adi_i3c_master *master)
> +{
> +	struct i3c_master_controller *m = &master->base;
> +	struct i3c_bus *bus = i3c_master_get_bus(m);
> +	u8 i3c_scl_lim = 0;
> +	struct i3c_dev_desc *dev;
> +	u8 pp_sg;
> +
> +	i3c_bus_for_each_i3cdev(bus, dev) {
> +		u8 max_fscl;
> +
> +		max_fscl = max(I3C_CCC_MAX_SDR_FSCL(dev->info.max_read_ds),
> +			       I3C_CCC_MAX_SDR_FSCL(dev->info.max_write_ds));
> +
> +		switch (max_fscl) {
> +		case I3C_SDR1_FSCL_8MHZ:
> +			max_fscl = PP_SG_6MHZ;
> +			break;
> +		case I3C_SDR2_FSCL_6MHZ:
> +			max_fscl = PP_SG_3MHZ;
> +			break;
> +		case I3C_SDR3_FSCL_4MHZ:
> +			max_fscl = PP_SG_3MHZ;
> +			break;
> +		case I3C_SDR4_FSCL_2MHZ:
> +			max_fscl = PP_SG_1MHZ;
> +			break;
> +		case I3C_SDR0_FSCL_MAX:
> +		default:
> +			max_fscl = PP_SG_12MHZ;
> +			break;
> +		}
> +
> +		if (max_fscl &&
> +		    (i3c_scl_lim > max_fscl || !i3c_scl_lim))
> +			i3c_scl_lim = max_fscl;
> +	}
> +
> +	if (!i3c_scl_lim)
> +		return;
> +
> +	master->i3c_scl_lim = i3c_scl_lim - 1;
> +
> +	pp_sg = readl(master->regs + REG_OPS) &
> +		  ~REG_OPS_PP_SG_MASK;
> +
> +	pp_sg |= REG_OPS_SET_SG(master->i3c_scl_lim);
> +
> +	writel(pp_sg, master->regs + REG_OPS);
> +}
> +
> +static void adi_i3c_master_get_features(struct adi_i3c_master *master,
> +					unsigned int slot,
> +					struct i3c_device_info *info)
> +{
> +	memset(info, 0, sizeof(*info));
> +
> +	info->dyn_addr = 0x31;
> +	info->dcr = 0x00;
> +	info->bcr = 0x40;
> +	info->pid = 0;
> +}
> +
> +static int adi_i3c_master_do_daa(struct i3c_master_controller *m)
> +{
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	int ret;
> +	u32 irq_mask;
> +
> +	master->daa.index = 0x8;
> +	for (u8 i = 0; i < MAX_DEVS; i++) {

Not sure why need pre-alloc MAX_DEVS address here?

> +		ret = i3c_master_get_free_addr(m, master->daa.index);
> +		if (ret < 0)
> +			return -ENOSPC;
> +
> +		master->daa.index = ret;
> +		master->daa.addrs[i] = master->daa.index;
> +	}
> +	/* Will be reused as index for daa.addrs */
> +	master->daa.index = 0;
> +
> +	irq_mask = readl(master->regs + REG_IRQ_MASK);
> +	writel(irq_mask | IRQ_PENDING_DAA_PENDING,
> +	       master->regs + REG_IRQ_MASK);
> +
> +	ret = i3c_master_entdaa_locked(&master->base);
> +
> +	writel(irq_mask, master->regs + REG_IRQ_MASK);
> +
> +	/* DAA always finishes with CE2_ERROR or NACK_RESP */
> +	if (ret && ret != I3C_ERROR_M2)
> +		return ret;
> +
> +	/* Add I3C devices discovered */
> +	for (u8 i = 0; i < master->daa.index; i++)
> +		i3c_master_add_i3c_dev_locked(m, master->daa.addrs[i]);
> +	/* Sync retrieved devs info with the IP */
> +	adi_i3c_master_sync_dev_char(m);
> +
> +	i3c_master_defslvs_locked(&master->base);
> +
> +	adi_i3c_master_upd_i3c_scl_lim(master);
> +
> +	return 0;
> +}
> +
> +static int adi_i3c_master_bus_init(struct i3c_master_controller *m)
> +{
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct i3c_device_info info = { };
> +	int ret;
> +
> +	ret = i3c_master_get_free_addr(m, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	adi_i3c_master_get_features(master, 0, &info);
> +	ret = i3c_master_set_info(&master->base, &info);
> +	if (ret)
> +		return ret;
> +
> +	writel(REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
> +	       master->regs + REG_IBI_CONFIG);
> +
> +	return 0;
> +}
> +
> +static void adi_i3c_master_handle_ibi(struct adi_i3c_master *master,
> +				      u32 ibi)
> +{
> +	struct adi_i3c_i2c_dev_data *data;
> +	struct i3c_ibi_slot *slot;
> +	struct i3c_dev_desc *dev;
> +	u8 da, id;
> +	u8 *mdb;
> +
> +	da = (ibi >> 17) & GENMASK(6, 0);
> +	for (id = 0; id < master->ibi.num_slots; id++) {
> +		if (master->ibi.slots[id] &&
> +		    master->ibi.slots[id]->info.dyn_addr == da)
> +			break;
> +	}
> +
> +	if (id == master->ibi.num_slots)
> +		return;
> +
> +	dev = master->ibi.slots[id];
> +	spin_lock(&master->ibi.lock);

use guard(spin_lock);

> +
> +	data = i3c_dev_get_master_data(dev);
> +	slot = i3c_generic_ibi_get_free_slot(data->ibi_pool);
> +	if (!slot)
> +		goto out_unlock;
> +
> +	mdb = slot->data;
> +	mdb[0] = (ibi >> 8) & GENMASK(7, 0);
> +
> +	slot->len = 1;
> +	i3c_master_queue_ibi(dev, slot);
> +
> +out_unlock:
> +	spin_unlock(&master->ibi.lock);
> +}
> +
> +static void adi_i3c_master_demux_ibis(struct adi_i3c_master *master)
> +{
> +	u32 status0;
> +
> +	for (status0 = readl(master->regs + REG_FIFO_STATUS);
> +	     !(status0 & FIFO_STATUS_IBI_EMPTY);
> +	     status0 = readl(master->regs + REG_FIFO_STATUS)) {
> +		u32 ibi = readl(master->regs + REG_IBI_FIFO);
> +
> +		adi_i3c_master_handle_ibi(master, ibi);
> +	}
> +}
> +
> +static void adi_i3c_master_handle_da_req(struct adi_i3c_master *master)
> +{
> +	u8 payload0[8];
> +	u32 addr;
> +
> +	/* Clear device characteristics */
> +	adi_i3c_master_rd_from_rx_fifo(master, payload0, 6);
> +	addr = master->daa.addrs[master->daa.index++];
> +	addr = (addr << 1) | !parity8(addr);
> +
> +	writel(addr, master->regs + REG_SDO_FIFO);
> +}
> +
> +static irqreturn_t adi_i3c_master_irq(int irq, void *data)
> +{
> +	struct adi_i3c_master *master = data;
> +	u32 pending;
> +
> +	pending = readl_relaxed(master->regs + REG_IRQ_PENDING);
> +	if (pending & IRQ_PENDING_CMDR_PENDING) {
> +		spin_lock(&master->xferqueue.lock);
> +		adi_i3c_master_end_xfer_locked(master, pending);
> +		spin_unlock(&master->xferqueue.lock);
> +	}
> +	if (pending & IRQ_PENDING_IBI_PENDING)
> +		adi_i3c_master_demux_ibis(master);
> +	if (pending & IRQ_PENDING_DAA_PENDING)
> +		adi_i3c_master_handle_da_req(master);
> +	writel_relaxed(pending, master->regs + REG_IRQ_PENDING);

this need move just after readl_relaxed().

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int adi_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> +				    struct i2c_msg *xfers,
> +				    int nxfers)
> +{
> +	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_xfer *xfer;
> +	int i, ret;
> +
> +	for (i = 0; i < nxfers; i++) {
> +		if (xfers[i].len > CMD0_FIFO_LEN_MAX)
> +			return -EOPNOTSUPP;
> +		if (xfers[i].flags & I2C_M_TEN)
> +			return -EOPNOTSUPP;
> +	}
> +
> +	if (!nxfers)
> +		return 0;
> +
> +	xfer = adi_i3c_master_alloc_xfer(master, nxfers);
> +	if (!xfer)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < nxfers; i++) {
> +		struct adi_i3c_cmd *ccmd = &xfer->cmds[i];
> +
> +		ccmd->cmd0 = CMD0_FIFO_DEV_ADDR(xfers[i].addr);
> +
> +		if (xfers[i].flags & I2C_M_RD) {
> +			ccmd->cmd0 |= CMD0_FIFO_RNW;
> +			ccmd->rx_buf = xfers[i].buf;
> +			ccmd->rx_len = xfers[i].len;
> +		} else {
> +			ccmd->tx_buf = xfers[i].buf;
> +			ccmd->tx_len = xfers[i].len;
> +		}
> +
> +		ccmd->cmd0 |= CMD0_FIFO_LEN(xfers[i].len);
> +	}
> +
> +	adi_i3c_master_queue_xfer(master, xfer);
> +	if (!wait_for_completion_timeout(&xfer->comp,
> +					 msecs_to_jiffies(1000)))
> +		adi_i3c_master_unqueue_xfer(master, xfer);
> +
> +	ret = xfer->ret;
> +	kfree(xfer);
> +	return ret;
> +}
> +
> +static int adi_i3c_master_disable_ibi(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct i3c_dev_desc *i3cdev;
> +	bool enabled = 0;

enabled = false if you use bool type.

> +	int ret;
> +
> +	ret = i3c_master_disec_locked(m, dev->info.dyn_addr,
> +				      I3C_CCC_EVENT_SIR);
> +
> +	i3c_bus_for_each_i3cdev(&m->bus, i3cdev) {
> +		if (dev != i3cdev && i3cdev->ibi)
> +			enabled |= i3cdev->ibi->enabled;

if you use | here, suggest use u32 enabled

> +	}
> +	if (!enabled) {
> +		writel(REG_IBI_CONFIG_LISTEN | ~REG_IBI_CONFIG_ENABLE,
> +		       master->regs + REG_IBI_CONFIG);
> +		writel(readl(master->regs + REG_IRQ_MASK) | ~IRQ_PENDING_IBI_PENDING,
> +		       master->regs + REG_IRQ_MASK);
> +	}
> +
> +	return ret;
> +}
> +
> +static int adi_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +
> +	writel(REG_IBI_CONFIG_LISTEN | REG_IBI_CONFIG_ENABLE,
> +	       master->regs + REG_IBI_CONFIG);
> +
> +	writel(readl(master->regs + REG_IRQ_MASK) | IRQ_PENDING_IBI_PENDING,
> +	       master->regs + REG_IRQ_MASK);
> +
> +	return i3c_master_enec_locked(m, dev->info.dyn_addr,
> +				      I3C_CCC_EVENT_SIR);
> +}
> +
> +static int adi_i3c_master_request_ibi(struct i3c_dev_desc *dev,
> +				      const struct i3c_ibi_setup *req)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_i2c_dev_data *data;
> +	unsigned long flags;
> +	unsigned int i;
> +
> +	data = i3c_dev_get_master_data(dev);
> +	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
> +	if (IS_ERR(data->ibi_pool))
> +		return PTR_ERR(data->ibi_pool);
> +
> +	spin_lock_irqsave(&master->ibi.lock, flags);
> +	for (i = 0; i < master->ibi.num_slots; i++) {
> +		if (!master->ibi.slots[i]) {
> +			data->ibi = i;
> +			master->ibi.slots[i] = dev;
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&master->ibi.lock, flags);
> +
> +	if (i < master->ibi.num_slots)
> +		return 0;
> +
> +	i3c_generic_ibi_free_pool(data->ibi_pool);
> +	data->ibi_pool = NULL;
> +
> +	return -ENOSPC;
> +}
> +
> +static void adi_i3c_master_free_ibi(struct i3c_dev_desc *dev)
> +{
> +	struct i3c_master_controller *m = i3c_dev_get_master(dev);
> +	struct adi_i3c_master *master = to_adi_i3c_master(m);
> +	struct adi_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&master->ibi.lock, flags);
> +	master->ibi.slots[data->ibi] = NULL;
> +	data->ibi = -1;
> +	spin_unlock_irqrestore(&master->ibi.lock, flags);
> +
> +	i3c_generic_ibi_free_pool(data->ibi_pool);
> +}
> +
> +static void adi_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
> +					    struct i3c_ibi_slot *slot)
> +{
> +	struct adi_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +
> +	i3c_generic_ibi_recycle_slot(data->ibi_pool, slot);
> +}
> +
> +static const struct i3c_master_controller_ops adi_i3c_master_ops = {
> +	.bus_init = adi_i3c_master_bus_init,
> +	.bus_cleanup = adi_i3c_master_bus_cleanup,
> +	.attach_i3c_dev = adi_i3c_master_attach_i3c_dev,
> +	.reattach_i3c_dev = adi_i3c_master_reattach_i3c_dev,
> +	.detach_i3c_dev = adi_i3c_master_detach_i3c_dev,
> +	.attach_i2c_dev = adi_i3c_master_attach_i2c_dev,
> +	.detach_i2c_dev = adi_i3c_master_detach_i2c_dev,
> +	.do_daa = adi_i3c_master_do_daa,
> +	.supports_ccc_cmd = adi_i3c_master_supports_ccc_cmd,
> +	.send_ccc_cmd = adi_i3c_master_send_ccc_cmd,
> +	.priv_xfers = adi_i3c_master_priv_xfers,
> +	.i2c_xfers = adi_i3c_master_i2c_xfers,
> +	.request_ibi = adi_i3c_master_request_ibi,
> +	.enable_ibi = adi_i3c_master_enable_ibi,
> +	.disable_ibi = adi_i3c_master_disable_ibi,
> +	.free_ibi = adi_i3c_master_free_ibi,
> +	.recycle_ibi_slot = adi_i3c_master_recycle_ibi_slot,
> +};
> +
> +static const struct of_device_id adi_i3c_master_of_match[] = {
> +	{ .compatible = "adi,i3c-master" },
> +	{}
> +};
> +
> +static int adi_i3c_master_probe(struct platform_device *pdev)
> +{
> +	struct adi_i3c_master *master;
> +	unsigned int version;
> +	int ret, irq;
> +
> +	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
> +	if (!master)
> +		return -ENOMEM;
> +
> +	master->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(master->regs))
> +		return PTR_ERR(master->regs);
> +
> +	master->clk = devm_clk_get(&pdev->dev, "s_axi_aclk");
> +	if (IS_ERR(master->clk))
> +		return PTR_ERR(master->clk);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = clk_prepare_enable(master->clk);

use devm_clk_get_enabled() instead of devm_clk_get() to simple err handle.

> +	if (ret)
> +		goto err_clk_disable;
> +
> +	version = readl(master->regs + REG_VERSION);
> +	if (VERSION_MAJOR(version) != 0) {
> +		dev_err(&pdev->dev, "Unsupported IP version %u.%u.%c\n",
> +			VERSION_MAJOR(version),
> +			VERSION_MINOR(version),
> +			VERSION_PATCH(version));
> +		ret = -EINVAL;
> +		goto err_clk_disable;
> +	}
> +
> +	writel(0x00, master->regs + REG_ENABLE);
> +	writel(0x00, master->regs + REG_IRQ_MASK);
> +
> +	ret = devm_request_irq(&pdev->dev, irq, adi_i3c_master_irq, 0,
> +			       dev_name(&pdev->dev), master);
> +	if (ret)
> +		goto err_clk_disable;

needn't goto if you use devm_clk_get_enabled()

Frank
> +
> +	platform_set_drvdata(pdev, master);
> +
> +	master->maxdevs = MAX_DEVS;
> +	master->free_rr_slots = GENMASK(master->maxdevs, 1);
> +
> +	writel(IRQ_PENDING_CMDR_PENDING, master->regs + REG_IRQ_MASK);
> +
> +	spin_lock_init(&master->ibi.lock);
> +	master->ibi.num_slots = 15;
> +	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
> +					 sizeof(*master->ibi.slots),
> +					 GFP_KERNEL);
> +	if (!master->ibi.slots) {
> +		ret = -ENOMEM;
> +		goto err_clk_disable;
> +	}
> +
> +	ret = i3c_master_register(&master->base, &pdev->dev,
> +				  &adi_i3c_master_ops, false);
> +	if (ret)
> +		goto err_clk_disable;
> +
> +	return 0;
> +
> +err_clk_disable:
> +	clk_disable_unprepare(master->clk);
> +
> +	return ret;
> +}
> +
> +static void adi_i3c_master_remove(struct platform_device *pdev)
> +{
> +	struct adi_i3c_master *master = platform_get_drvdata(pdev);
> +
> +	i3c_master_unregister(&master->base);
> +
> +	writel(0xff, master->regs + REG_IRQ_PENDING);
> +	writel(0x00, master->regs + REG_IRQ_MASK);
> +	writel(0x01, master->regs + REG_ENABLE);
> +
> +	clk_disable_unprepare(master->clk);
> +}
> +
> +static struct platform_driver adi_i3c_master = {
> +	.probe = adi_i3c_master_probe,
> +	.remove = adi_i3c_master_remove,
> +	.driver = {
> +		.name = "adi-i3c-master",
> +		.of_match_table = adi_i3c_master_of_match,
> +	},
> +};
> +module_platform_driver(adi_i3c_master);
> +
> +MODULE_AUTHOR("Jorge Marques <jorge.marques@analog.com>");
> +MODULE_DESCRIPTION("Analog Devices I3C master driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.49.0
>
