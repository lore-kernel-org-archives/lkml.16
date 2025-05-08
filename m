Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021138.outbound.protection.outlook.com [52.101.70.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A76425291C;
	Thu,  8 May 2025 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717555; cv=fail; b=iK1xNJ/MGxT3N92OzXwneTszz446AQ/KdTSfdBLzoBII3ZBUAJwmMnt8F4L/C18NLfeQA2pUwEGm9VlaDB92RkBpHc0ABYgl6O0KKwS7m5qz88yns9TWfPEB+g4o/Wfxs7Egu9OOyxXH9skS/AzzvmE1Q3OLn2lZCB4+zCXP/S0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717555; c=relaxed/simple;
	bh=8Ijwq2w6Ve3W776Z8rO8KeM7nTHYGuILIK8aO17j9N0=;
	h=Message-ID:Date:From:Subject:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cYoD8gaSM45FZFDYDcAVOCqkMOs56hu6LW9JeTn3FgUr5M1HiPpUSwCWbXhp4zTRHn9Zf/15v/PsnbMZJmbjtvqNNqy+3tT5xg5ROOAA+cQXS23ZVxsCQFKuNx9ari/O/omhxdLmmRCBaSwzAq9wBKxlfc5ngfEauw/ODvh+fHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl; spf=pass smtp.mailfrom=topic.nl; dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b=XRsVVrQ9; arc=fail smtp.client-ip=52.101.70.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=topic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=topic.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=topic.nl header.i=@topic.nl header.b="XRsVVrQ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofQGpSeiL2QtYDzQsswyMrtIcrLogmu+EpkCIS06xYdPsbsv8+eHl8s0YZphk1Onn39BQMwad/E5dV/uWT3cA4si59MV9UOmgM9pjWwTpBIXsAFPFzC1R84WyLR8SDB7v1PCy9yjLpHeJ9WTuw/qk+ZFmYc9HALQsnhgpNruAyyGOEkCDVxTrHuwQBWoG2kHGiXtNlxvMF5GWePiyphUIWWWiXe/fnj18SutdrgiuIUabFQMxSsxi0pJVy9UU7wP0cFNnZspL4S2gRxajbeZ5TIqwwBnRCgVgos5NrpDO5Nd76d1cw/j7e9mHFRjaClr0O1FuvZaj7XlWHrbESvcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqAuMBcOONxLOcGnHh3ncpaXCoWxljUZvJs4IeTERMA=;
 b=UrKwX3jOcpgcgzBLxlDUxLzbrzjgJ/keCmEahGS+6FL3N1rcHvqR+MTaAOGYxSLJoDa8M9/bgdHxX8ScGr/VX+dmYhL4sV1ff/lQNbgu6I/k96oPo+H/R/JMKzE9SgtT5X12okcep4WrL+bn00/a0LxfaNB5U8K8Y561yjBatL2E3FJ6ihelzAdc9k1Ky1TFvLV8I0NHcG37PfcYALChRyNJ9zixjkg/oF6jMUYoR2bc+tMFreztENqEOlpPN93bX2O/8/FZZH/kwSETTRIKjRKLoIbNIY41yv0Aapjr+0BRr4XZ/xuiQ3k8rhPbg6ZdiawljMeaCbmAvqHqNeqkmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqAuMBcOONxLOcGnHh3ncpaXCoWxljUZvJs4IeTERMA=;
 b=XRsVVrQ9FPOc3SpXOqFAPUCv9MGVeTWApZa8vvVoH5uprjUjIYzKoCgYUnpea/LVnfJ5PjbOlpnX20LPWuaNV97q4273b3H9OvwiPuTINJ9f43EZL+hGScSnvs0f8B7xuDRayuc1fTk08F/LIHOZaOFL5XS0suSP64qapa7jQIg52x5ytFGmuqmhF+/bJWDo3KozWlSVWHrgL/00qoWOldGuwq2Da0i8VSQszV+XNzfMlR0wpSmfNEuqDOsAvcRSleo8nVS7a3g4PfWZExWEr2K+NQJfeMMaxUJy9cER4mqU8hyUtnKZDzAkvvlm9rdUL36qxknC3AfYH5lilk4fYQ==
Received: from DU6P191CA0051.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::7) by
 AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 8 May
 2025 15:19:08 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::c) by DU6P191CA0051.outlook.office365.com
 (2603:10a6:10:53e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Thu,
 8 May 2025 15:19:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 15:19:07 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com (40.93.64.11) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 08 May 2025 15:19:06 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by PAXPR04MB8591.eurprd04.prod.outlook.com (2603:10a6:102:21a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.34; Thu, 8 May
 2025 15:19:04 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%6]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 15:19:04 +0000
Message-ID: <583dc73e-23d3-4c8a-a457-f2bf71190e6a@topic.nl>
Date: Thu, 8 May 2025 17:19:03 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 2/2] dt-bindings: usb: ti,usb8041: Add binding for TI
 USB8044 hub controller
To: Conor Dooley <conor@kernel.org>
CC: linux-usb@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250507131143.2243079-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3e03400f-766d-4690-8f43-cbea2cac93d8@emailsignatures365.codetwo.com>
 <20250507131143.2243079-2-mike.looijmans@topic.nl>
 <20250508-prewashed-jawline-37f53c0f9429@spud>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20250508-prewashed-jawline-37f53c0f9429@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM9P195CA0016.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::21) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR04MB8644:EE_|PAXPR04MB8591:EE_|DB5PEPF00014B91:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: dc446405-c76d-4535-d79e-08dd8e43ad62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bVI4eG1FaVdRV0VHWWsvRlBnTEY0bFhrRWNJeGE3cGlvL3BUS0hlSTd0SWZT?=
 =?utf-8?B?dXhOTzJxNDc0WVQ3SGoxMzZ0VXUwOFRUNk5TUVBWbWlBMkE0LzJJUXJ2emVN?=
 =?utf-8?B?aWp1YWtmMkMxM250RUtLeVYyWHM5MS8wMDlHREFOZjdaM3VhSTMxdC9tTDNK?=
 =?utf-8?B?Skp2WjJLUmt2NlhuUi9rRGVUaW1jQUNZaENQLzhqZlNNa2tPWWVtdDg0L3lu?=
 =?utf-8?B?akVOOUtoZzN0THVWelA5Z0VwQWJic0IxWWhUQVBDNnVYTENPMzI4bDhVaGpM?=
 =?utf-8?B?Mk1XQStEMXlBMUJ0L0pFaHhqMFg4YlNhRXdPTnVSL0tRaW1PZjBvRitnTUlI?=
 =?utf-8?B?K0Q0R3BadHdsSC81Um9xd1FJM0YzSHBPUmlldit6dHl2aWtWQUlqQjVTeEVz?=
 =?utf-8?B?RHlyOUd5T2QvbFZlaUhmYnF6SURHSTVrKzJMTm0yYzdIREdrdmIvL21QU3lI?=
 =?utf-8?B?L1NzamVUTEREYWhCRlBReTFlbDNjcFg4NkhUSTVyNmk2cm9xRzAxYUlyWWww?=
 =?utf-8?B?dTJ0RGFISDBNc1hGNmo1YUdldXpxUUh5Y2pVNk5rV3E2aXRvaTBEcmNqN3Y5?=
 =?utf-8?B?MUFpR3VZdUo0VEZrNW1OUTF2cVNUWkpUcURwTjJDblNUZVF3andmMHlCalA3?=
 =?utf-8?B?M3M0U2RpNU1KZEYyOXBEMHhuUzF1Vm45OVJybzdaRDJ6eS8zN0RhR1Y3L2xn?=
 =?utf-8?B?WXpWUy9rcko4MDBWdHk5bXlRdzQydXQ0UFE1M0tjSEZXbVZscU9SR2pIZWRZ?=
 =?utf-8?B?N1lQSXYyVDhoS0kvYmZNMG1sUU0wOU9zMXg1NTk1RUp4WUhqTTYrUG9SblNR?=
 =?utf-8?B?RFBZTDVtejZHSS9lODNIVlJNTVdCYitJb2FQTkRKYnY4c1MwTElpbm9KbUQr?=
 =?utf-8?B?ZFdKS2I5SGpydXdPUFFaVTRkdWhBWTZ1RHYrMVJyUG9EWEl1ZStjNVNUZlhv?=
 =?utf-8?B?TitjMUE0d1o5MWpRS2s2M1lOS0Uvd01Id1Z3Zmt5bHg4OWdSQldxek1vK2M0?=
 =?utf-8?B?bnVLTFJKYk05Z1VRaVgvUldYV0F2Q0xlZHd3RDhXVHIzVlhNcE1wVXJlcVR1?=
 =?utf-8?B?dzZ6Sk9mcWlGT2IzYzhyTlNubnBZV1gwYUdTRUZwcHFhL3h6bVZpWEVkWHdM?=
 =?utf-8?B?dWRPSWkyUE5GeDBCbWhsbS9pQ2s2T1o1NVJ6YkZuVXpxZ3diK1pSZmdSRWgw?=
 =?utf-8?B?NHlqYVVUcU1KT2lTQks2VExxc1NiWTdZTG9zcExhZFozSGN6YU40NXFXdzBX?=
 =?utf-8?B?SU5VeU1ScmdlakFXcnU1d0k0RnpWSUhDcWg5dXhvTms5STdpQmI5UzJrQ3NK?=
 =?utf-8?B?cnY0N1REejA5VExtVjhZajNLYytZZGowNG1GQUw3cDM1M3NhYkNrRkMrbXc0?=
 =?utf-8?B?bXdwWUNhbmpXdFZiWXZkREVQZk4wTW9BcWVET1B3UnYzYmRFeHBZMmZ0Y1Ny?=
 =?utf-8?B?RWR4aEcrMFo4eHJTZ1pJekpnTDJBUW1GZ1dkcHNZTExpd1ZYZVJ5OEZiN1Iw?=
 =?utf-8?B?c2VGa0h2bURNbnZGakIxdTBOOW5lUkxwR1JnVS9kb0tDamdMKzF1RU9lcndl?=
 =?utf-8?B?K2c3UWtCcUdKVWYxMEhnUHAvSkZYK1NRNlVEQ3BWaG81TnQyYW1wOFZHTWdl?=
 =?utf-8?B?MHUrNittV2hDd0FrQXAvMFliSm9NYjRuNXByZFlRZXhmRVBKamNwY0NxbXFu?=
 =?utf-8?B?Znd6MEdBaEdkYloyK1BKWmJKZUY1VHpqZEQxYllGSHJrc2NhNXdBTlUrVEgv?=
 =?utf-8?B?N2cxcVNQdG5zTzBiUDNmYjhLM1lNbGdyem1tU2creU9KRTlmcEx0SkljUS9Y?=
 =?utf-8?B?NjY5dFM1a0QyOWhKdGlYN2JYTzY5bHRxaXc5ZENVUkNERU1xWTRENkRaOE44?=
 =?utf-8?B?WWNNbm9UZXNUc2dFSi80bENFc0JVUktwaXNUS01sa0FjODY2Snh4a1BaNnFH?=
 =?utf-8?Q?lTkf3Z2wArE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8591
X-CodeTwo-MessageID: d66d0419-d32f-48f6-bc70-e35c61c94c70.20250508151906@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	74690a05-e3e4-4177-f473-08dd8e43ab5e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|14060799003|82310400026|35042699022|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THVkMFZqaEhjVE9FNFVZeGFONjFMeG5RZklPRC9aY01IdjhzZjNtZTR1cEtS?=
 =?utf-8?B?SmNyWGNXSXdVdTV5d3ZWQ29rMWRZZHE5aEVKM1RIMmZCMlZrM3ZTbUcySHpi?=
 =?utf-8?B?WU1YQWtseTVGZWhYZy9nNEZQVDhOZlh3dkZPejJ4aU91TFYrYVkzRWQvWVE2?=
 =?utf-8?B?S0c1QkU3elppQ2VoMmZWUXoxL0RWbktFcmpLNitLQkN2UXdsTHZXelBmc2hr?=
 =?utf-8?B?SEh6V1N2ODczL1JpbmN1WUU2UXJMQXo0bHRRRklrbENrMWlrQS9zWmNSY3R6?=
 =?utf-8?B?NFRJanVDYWhlMEV4NWl5cDJoYWtvaWdZKzAyY2xESWt2S3ZKbHR0STF6eWNQ?=
 =?utf-8?B?cmFLOExKQXpPNU5ncmRQUGR3N3BuL3FrQzRpRFlscTNYcXNDRXJRUnJmYUk4?=
 =?utf-8?B?Z2U1ZUZHYmRYcUVzWnEwRkxKajBlVGd1N1dwOTFkYjAyUS9lNjdlU2pSWUJs?=
 =?utf-8?B?SXp6VCszc2R6VjVZSVdtTmdGcW5Wc0pyeUV6dDVPVWZudUxlemlRTXIyV09y?=
 =?utf-8?B?bzF1NmpKd1I0elJYaU4wWkVGb3FselJCREpHTHk4T3U1b3JUQ1p2MlBJaHFN?=
 =?utf-8?B?dnY0QllYRXd1M3BCK2crNzA5MWFmbytvMUN2bFdZWGcwNUZYRGNDNFRWeWZG?=
 =?utf-8?B?Q0tQdFhiZThJbGRLU1FvdTljckI4NTNCMHdtblc2N0JzZ0k3T3BqOVc0aDN2?=
 =?utf-8?B?MjNVR1AremMya3Y5L3NCOHhTNFltNzVsWjkzVS9LQ29PNnBxYlQ2elJaWlla?=
 =?utf-8?B?TXZJc0hJYmtEMzhUNEIwRkhUT2RWOUloUEF0ZmZ2TVZBWEZxd3VEQXRNMVhR?=
 =?utf-8?B?N1daeEIxUUUwM1RteDlDS2tBbjJYT0J4U2Q5UzBLNm9wYjlyY3F4a2s1VnNC?=
 =?utf-8?B?eWxQL2dwU1kydndtNzZhMzJabFU3UUt0V0ZwUnNNOFhyck5Ob1E3cjdRV3BX?=
 =?utf-8?B?TmNkdVkwbklTeUpHbGVGaE02ZWc2YU5ISjVQYVlTOE9TUVJJUU9TNUthQ2RH?=
 =?utf-8?B?YVM1VTlVdzNaa2llejdRL05BeUhwT1FiSkEyMVhVYXN0bFBRU0hJT3p1NXRY?=
 =?utf-8?B?Vzd1RERCVU9SWGVUQXk0U3NWRm1FNGtHelJJS1htWGFBR0Y3RDFCeTVnUjNr?=
 =?utf-8?B?Vmp4dWtrTXBSR0hWc2FaY3dwUjBJYkVuZzcrQVRuNUdGSXkrMndzREwvNFJU?=
 =?utf-8?B?UEVVTTlQV3pnQ1Q4c055ckZIM09KdW9yaFZldTY5NW8ybzJQUUgrWXk2L1ZI?=
 =?utf-8?B?NXc0WnZYMTcwcDUvZDlhNWtMeHMyV3loSHFVTUxseGlJeStLWllSZ1JIcld3?=
 =?utf-8?B?RWdlSEFrSjg2VHdiVXE5Z1hjdk0zYUFGZ002U3JGdEpBYkxNbnB5NStneWlM?=
 =?utf-8?B?QTltY1F5ZUtpbUlMUytwN2dBdGtESWV0MXhWQXZpUHpmRE1rOGJmZmo3ZGgz?=
 =?utf-8?B?dmhaNXFHMGpiREx5QTZCd25PQkN1U3lNU1JteFNqRkZNaDJ0LzJzYmZXRkZr?=
 =?utf-8?B?QlcvUzBXM2g1TjBQVE4wajBTbStENEFFTTZwMU11S3JrQncwRCs2YWJMMzhq?=
 =?utf-8?B?MEIvc2FJelI0dm5kMXVBMWxTR3h5V1poL0ZlVTlsTUxDRzZ0cnJETlVoOUhH?=
 =?utf-8?B?cnVVRnlkdWVGZVpwRUpmemhacUxIa2FoeXlLR083QXdnbmZhMXVLb2VaUTRJ?=
 =?utf-8?B?OU1nVy9mZ2psUWpZMTFIRGQvSjFMNTd0QitEMmZtd0ZvK2NZb1h6U1phVyt4?=
 =?utf-8?B?UjZmVUowNWZOcDFFcEpoMmZqVlh0T0k3Si95N1VXV1l5T3NlOGNwZWdoaUov?=
 =?utf-8?B?UForREtiVzlvdmFzZUMrbTlLbTFKekRObXZxUWpqSDhOZVdsRk93eWZBejZL?=
 =?utf-8?B?R1hLaXlMNjF2NjlSK0hiK0FXcTlwYmEySjA0eWllUWNUR2tTYzFaOUNQOUlD?=
 =?utf-8?B?cng1YTBkUXZHTjQ4bkFFRkhaVEd5NXBYTE5YMExxYmdqUEl2WGI4cWl1YTcx?=
 =?utf-8?B?QmNBeHZiOGtBPT0=?=
X-Forefront-Antispam-Report:
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 15:19:07.7727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc446405-c76d-4535-d79e-08dd8e43ad62
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

On 08-05-2025 16:58, Conor Dooley wrote:
> On Wed, May 07, 2025 at 03:11:43PM +0200, Mike Looijmans wrote:
>> The TI USB8044 is similar to the USB8041.
> Similar how? Why's a fallback not suitable?

I don't quite understand what is meant by "fallback" here?

It's similar in that the USB8044 provides the same functionality and can=20
use the same driver as the USB8041, all that is needed is to add the=20
PID/VID values.

M.

>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>
>>   Documentation/devicetree/bindings/usb/ti,usb8041.yaml | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml b/Doc=
umentation/devicetree/bindings/usb/ti,usb8041.yaml
>> index c2e29bd61e11..fd6b35a40a5b 100644
>> --- a/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
>> +++ b/Documentation/devicetree/bindings/usb/ti,usb8041.yaml
>> @@ -4,7 +4,7 @@
>>   $id: http://devicetree.org/schemas/usb/ti,usb8041.yaml#
>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>  =20
>> -title: TI USB8041 USB 3.0 hub controller
>> +title: TI USB8041 and USB8044 USB 3.0 hub controllers
>>  =20
>>   maintainers:
>>     - Alexander Stein <alexander.stein@ew.tq-group.com>
>> @@ -17,6 +17,8 @@ properties:
>>       enum:
>>         - usb451,8140
>>         - usb451,8142
>> +      - usb451,8440
>> +      - usb451,8442
>>  =20
>>     reg: true
>>  =20
>> --=20
>> 2.34.1
>>
>>
>> Met vriendelijke groet / kind regards,
>>
>> Mike Looijmans
>> System Expert
>>
>>
>> TOPIC Embedded Products B.V.
>> Materiaalweg 4, 5681 RJ Best
>> The Netherlands
>>
>> T: +31 (0) 499 33 69 69
>> E: mike.looijmans@topic.nl
>> W: www.topic.nl
>>
>> Please consider the environment before printing this e-mail


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl



