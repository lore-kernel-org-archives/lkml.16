Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E571E2607
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738181176; cv=fail; b=pk+M3GnT3eOlMiK6s+VcSDtv/ErJEJe4OUDX3+droezfQK6vbH34C6iuI6pYW8/Op98zVtE921KCwfrddjqwx5BjLSSo+4aQlnYm69XvpAL+kontaMMeNbUkNz4oILmelbH8e7RPZDy3ML8tMOZy/ybzLIWcsJWy52IyPztcEK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738181176; c=relaxed/simple;
	bh=JEIsXJQCrGymehdd1Jleuv9Z0kCcnhQNHdjnEuYbQ1Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=A8VfjT82ULrx91QqFFsXfnCSnSIyPVHR6ed7cbxCztK0S3GCpAbNBTUvM9Hr7JDOPKCzdOgNtWDbMMLQU0zDKYdX++quWHmilMDsOnrDPyiYvhJ6uAYriyuCriu8kMnbw8jILXI6o4UaLILyVjjh/ZTs9uQWPOSbxeTHAINyEuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D2tZ28Pv; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D2tZ28Pv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tF0cr4Nwihlyh4wjxIKWvM4WgXLzslI8fRGwb/zAWAeCXhfgJW7+WfyxbHhJpKdyHSFg7Fj0//Ssepe7qgwpZlUsOxd7GOf4ai1c3jfPb5p5rYQ7sZI1H907bG+7SoOL5ZgGCgm9BlZ1CyXRPtMoDpI5opTneRB0JSkV8OpSqIZPPQhnGmY5XCOhUwN2QcYA8mdtkqHEpHeZFuzc8E+tOwHfViI8CX8Xn/ZbQcQ82DeZJXIVgxPwhi6C+d3fytCqkUX2gqdiFN453q5C04j8OvMZ/FOpfcyXL/7uxZ88RvQHFcqE4CejxpfQRNJrR+IHhN+9Rdi1S5J+aCXZnWcp9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgXky10trcn/+bt/y3+16l8vQezgvECWvae9pCH4Y9w=;
 b=w9YyUDrvT7Y+UTz0vTOOcZCxw1FERivZWA1q3s7fat7YB1iVUdEudzoV+nAPJk4onEpzhA0vijOYJKxQ9w9ZcDIMZ3f67ebKQQYbx7dGbCL/931hzommJJpxsrAqbTxmTkuL1+tZ+F7H2xBw3RBY+n5vUdGlPWILerjbladYfBNujBMGRUcuhGWkUuN3KVJumRbXP7ILvRfTVNSsFEfJ7wwm1CoV7szYL9ytDRYC91y1PwatX+V7s0IwI1Tz1t0Esn06U9obD/xchCj839ePWcGWFGnIXSQBWLlYHosHyoGKf4uIMJDANvJtUkNnX3dWDW9RCwlH4Rd7P39aVQYCTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgXky10trcn/+bt/y3+16l8vQezgvECWvae9pCH4Y9w=;
 b=D2tZ28PvWwkzIljwyzIBY9DfP7xJI4SM93RUPtaDq2KeayQbm82mPDSeEurdZHCW9Svv6wJD1dTL0YsrHPlnq0EuDNuzZ2XeY3ECO2uhbGRntecsYy2k8fDI+0gkNoYWMBHcIp6TfuFeDCb2XQbGXPlVKml7gXFTbU7tKl5fja2+2D7i+tTiey48LczNNUbj0AKj0dViudwhO/6MG7uB8h6H3u2pTuBwHUtURkoxEvr+3WqyFICXEVmbo7AKAMsqsCp10UVqIVBLjGByb9UP22P6XzcEXbSx5cor1q8BxOnGHFm7iXPE0i9zl3D6SkF/7Wj5ZL000y9nS8u2vq2hGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8995.eurprd04.prod.outlook.com (2603:10a6:20b:42e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 20:06:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 20:06:09 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 29 Jan 2025 15:05:53 -0500
Subject: [PATCH 2/2] i3c: master: svc: Add basic HDR mode support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-i3c_ddr-v1-2-028a7a5d4324@nxp.com>
References: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
In-Reply-To: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Culhane <conor.culhane@silvaco.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738181163; l=7629;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=JEIsXJQCrGymehdd1Jleuv9Z0kCcnhQNHdjnEuYbQ1Y=;
 b=+zcPldY+xwTc1cXdayUYnO8yrl98j+jKLqjoeSEPPMt2k9vwcN0vnXAXTCxkGetbFeCkXqrZ3
 W3IMtID44xLACAM+Tn7JLZi+imKbEeYZpjmSCKRCWZyIggAAEEVSt0P
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8995:EE_
X-MS-Office365-Filtering-Correlation-Id: 80250fb9-0219-4257-5e9d-08dd40a05f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M1MxeWdOVkhDcklzYVpCbmNMK1kxOTNHTXpmSDJpbkE3TGZXREZFeFVyb200?=
 =?utf-8?B?eVl6WUsyei9kN2t0bEJaVVNGc3k3VkN3MGRDVklVR3laOE1TdTNZT1NwYmZu?=
 =?utf-8?B?ZFYzSU05cjIwclpyUlQ5WHZ4YWJkc3lBRG5nR0p5S0FSbjkrYWVRL0FFcmRs?=
 =?utf-8?B?NTFpQ2o3WTVLQXA2aThqTHY5KzZ6QlZGY0U0a1BBN2dJYWR3OFZBOVR4SnBF?=
 =?utf-8?B?blRqMW1LNytKS3V6aEQ5WnBUcThXN3V4SDRQK2hxMlFyRVF2NVdidE5hQXdF?=
 =?utf-8?B?TUFkZHJzQVMzdXJ6ZWZGOTN4ZEEwRnplYTNqUWxrbnppTjh2UTVvWEVPbk9C?=
 =?utf-8?B?SFJZUU5vdnVJU3prck9tczBYYzlpRHA1a1ptK09YS1J2b293Z0ZWTUl6enQ4?=
 =?utf-8?B?MzdnOTVmSTd6QXg5Z0NnRGtCaXROeTRqUGtkUjFWaXFUWjlvcnlBQlhZUHE3?=
 =?utf-8?B?V2NHZisrUFp0K0RJOXRaUDRWVVpoV0MrMGR6aUx5LzgwNG5QUmNXZFVKNyt2?=
 =?utf-8?B?MEhZempFd2hzem1hektFRklEQ25kRm1yVGZTL1RRRVlOelBEb25MWHRGckw3?=
 =?utf-8?B?c2k2cFFWL3BBS3BjTW1LcTY0Z1QyT25CQndrYnBHWitwdU1aVVJaRkZrZ3NK?=
 =?utf-8?B?VEp3RXpsRU54QUxuUHE4VkVOYldCZzFhbExlN3RhYmRHK3IvRGV5Y1Myd2VE?=
 =?utf-8?B?UTZINktTVEZHZ0JaeUo3TThyVW5QRmJxdEc5YnZZWWl0NVduYVk5ZFRtT2sv?=
 =?utf-8?B?Y3JuQ0ZrY2ErcjVIUmNoTk5KTEJ6MG9FTk9MYWZwZ3FPTmVJMVVVMmtvdWlD?=
 =?utf-8?B?NkYrRkRjWEZ4Qm5YN3I3THJYd1pPaXIrZWVFRUhEVnJ2Sk13bllxaS9kWVU1?=
 =?utf-8?B?SDJhMkJ2UWJPdDd1RjZGbUx3VTFjdGJJWGx5NmhZcGIvUGhhWjE5L3Z0Y3Fn?=
 =?utf-8?B?OFVLMGc0V254ZU4vbWtlSUFGcktFTlJDQXFzU004ZXJvb2FQY2V6aE5aZExv?=
 =?utf-8?B?VFB4VzdoMjV6S0ZNNGJEajBITXN5VnFUN0hSVEl1TEhMeUxUUXk0aXJRanQ0?=
 =?utf-8?B?WE5NU1pnMEZ6TDlwMlVzNTRqcjJHVHZ3YzJ1WXVZbVZ1MjNKc2RucjBzZU9H?=
 =?utf-8?B?azZoK2hmNE50RjhsaklrbnlPTXhhOHkwTWFYNXBaSGRac01kaWtuRndxZlY1?=
 =?utf-8?B?YzJxM3h4Z05MNTdqVVlrYSt0bU5Jd2N1Q3RSVHRnSG84bjMvR2drdmtHZmc3?=
 =?utf-8?B?ZlVLdWVIeUN6Sk5McW5WZURBTEJiT2Z3RUpiUDJmVFN2RGYrOTRUcTNFRmJm?=
 =?utf-8?B?bkVSVEZjblJSMGlGbjJuU0ZhTXZXRFd4cW5mOXhxS3FEUGNEanNvaVI3Slp4?=
 =?utf-8?B?WndWZSs0K2pSSzVaYW55R21sTHFxL0IxRVNyRXEydDNOZmpmcURDR1MxWU5m?=
 =?utf-8?B?bENHWVJWNVI0WmxhNWIxOW1URm1XUlpIOWd2cU9IeGp4YklQS2NSaUE1TDBU?=
 =?utf-8?B?QW5rODAxMWhodlYzeGxWM2pLZFNxMys2VWdBaU40Y24zdFlzYUE0RkFBeFBE?=
 =?utf-8?B?YWpCdGpWeEJBa1FrWVZORlNQeHk1aXluc1k3cFQ0VjB5VUFMdVYyRG1ucTZS?=
 =?utf-8?B?Y1Vsa0d1OWU1UjlzZEExTnlxaC9uQmo3VFBDTFNOZnNYRCsvbmpjeTNwTG9n?=
 =?utf-8?B?Q1M0Y3M5c2Iza2hEMFRNck41Y1cxS2QxbVJPcks3TmNRNE0wdWZpUTdsN0tB?=
 =?utf-8?B?R0M4ZWdiYXpuRkVieCtWSkhDVTV0eVRKK0tTNkc3TVJ4TEFTMmhrNFB1MzlX?=
 =?utf-8?B?UFQrd0tkclBkNFZXQklUMzRBVUkyNlJzL1Y0bVgwOGVWeXZoWUVoQzl2aHpG?=
 =?utf-8?B?ckNkR2JISHhmeWlOUU0xZXRoQjNMeGRLMTdyOHdMU0QwdVA2N25BVjBkc2Nk?=
 =?utf-8?Q?Rwzgon29d+1S/S/CFy8OkztPtJ1W8rNH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2g4MHNqWXZaYkFKMGd5QVZSNm42V2xoRlZ0dlhXQ3dtQnM5RHpXM1BGTSsz?=
 =?utf-8?B?MTEwa054a1puYkJBTkFuTEEyNTBQMHhqWk40Q0dyUDk4RHcyTldDUkFtZ1RW?=
 =?utf-8?B?SXBBY3dZdGU0dVMvTXJ3NERhNDlmZWxEeGtoMUt4SE0xSlNWcE56T3dGeGow?=
 =?utf-8?B?RzY4NDkxMlE1a3pWakp3WitzNU9sQllOaDJlN1hncUVpVldxUm5GaDAvMmcr?=
 =?utf-8?B?c1pxbUJWQzZOU0JYQ0RMeldoZVgvY3RvRmVFWjJHa1ZGOXorWkJGSlhIRE4w?=
 =?utf-8?B?REUyZ3VnWUdxQktyZkZqaDl1dHptekI5Vkg2RWZmVUdKM0NuWktDcy9uWjlh?=
 =?utf-8?B?QzlPY3RPYXB0T1l5RkdTbHFHUUtETS82T0lyMXEra3Q1dDZOdWF2SW4yandM?=
 =?utf-8?B?VVVuYmV4RGg4M2xaa3puYU9wa24wbFFJUldhQytVRWpEV2NxckJGVENEd2Mv?=
 =?utf-8?B?R2hXYitHSi9GQ0ZkUVFKRTVOTHhESi9HTkozK0l1RWlrSDVnMnpqTDJFUDZ1?=
 =?utf-8?B?a1dFNDNlYUJxZCtrTlZGYWoyNkxxU2xDdWlDb2RMbnNhN2RLd1ZVakF3cmMx?=
 =?utf-8?B?Y3I1VkRPZ3JBTjFaODNOZEtmTWJyTUNjZmIyU1NwNldEazZmdXpmSDRsRDhZ?=
 =?utf-8?B?aXcwbE5JWVpTSWEwZ3kvdEZHaW1TbDJrUjZoRmkwa1FQUDNINW1EWGVhZlox?=
 =?utf-8?B?WG1GL0p3akprSVRsZEpCWG5zOGVqakF6WHN6QnhicEluRzVjRzBDRjV6Z3Fv?=
 =?utf-8?B?WFcrYmVMc292QzB5RVpZQUNBQ3hXWFE4czFoZVFiMTFGZWNOZ2JLUDBXNEsr?=
 =?utf-8?B?U0RPNHFIeDAxTlNpSnF3eUQySVh5TDlEVzdNci95NGdGVUZuaTJQNDVBTmZl?=
 =?utf-8?B?L0lYaGVaektJMm5pWlp2emtXc2loeDVmU2xxV0h5WmlRYlJlNkF1bWZKUXRJ?=
 =?utf-8?B?WHA0dVNyamhmWjF6Uy9aZTNZRThTMFhPd2pxUnNrd3lTMWFxK1RYaWNNMXBq?=
 =?utf-8?B?MmlYckdOVExjUU1UODI2MzRMcWhIODA5NHpKVWQ3K1pLRlQzR2tSbjJ6Qzg1?=
 =?utf-8?B?ZTdVZVIvN0hJMkFyV0grbmNJTkZSMUdOb1ZNVTJYUURvdE5BeG84Q2dvN2o0?=
 =?utf-8?B?Q2tadEZwWm9tS2V5NkVIY1RRUGY4a244Q3VaVFBSTUw0ZjZzUWhJa3NWUGVD?=
 =?utf-8?B?UDdzYzdBZXZGV29SVDR5RW1MN0tidkpyQ2Q2dlNqc2t2Yk03Nk5aSkp1c2Nq?=
 =?utf-8?B?Z1I4UlEzeXVybS9Bd1djZWRxV05LN2U0ZlgxRGo5WWJGZDF6ck5EaU9pQTFH?=
 =?utf-8?B?QkpaZ3ZxVkQ2SWcyUUxtSXdOeUoxajEyeVF0YWR3Z3FwY08rZVZZNDIvYTYv?=
 =?utf-8?B?WG5lUXN1ZUxyenM1R1djOGk4clRTRFRnY2ZKL3NyVTl5VUlzSGlkdG9sVWt4?=
 =?utf-8?B?SWRZemdlUU1mMnU5bllueUtLUk1OaDVFKzdUeE4ybVFOaVhyZWIrVEMrL1pD?=
 =?utf-8?B?WFBFazFCdjNGMUxlQVRrdWIwNGE1MS94MU55RVVWbi9IeVVxYWtHRng0OWo1?=
 =?utf-8?B?TmtMUld6aVFPQldWbFZVVjE1R0h2andzdURYRDFhYS9RVG5IaHdzNFJKRGla?=
 =?utf-8?B?K0hTWHJIVEZIblBEc0Z6ZEJZNGJRNmEzaXBGckZyRjQxTXFHcGt0ZzZMVWk0?=
 =?utf-8?B?UEp0UnphbEVTWEJIbk14KzcvQmt2bTByWEw4aUpJWCtzbFJ6ZkdaZWdpNW1Q?=
 =?utf-8?B?UkJJV1NzNWRCU1Q2dUMydzFOWU5kbmdHWjRUOGxBSDBxWXpHWnpGZERpdjlK?=
 =?utf-8?B?ODkxNSthYmhHVC84bDlPYUNYMU1yS29PUkJYWFhnTjdlbzhNdDhwTzQ3aFA5?=
 =?utf-8?B?Z1RHWUhGZHA2RzVFQ1FYY00wK21ITUJVUiszSjhtTjY4Q3QzWW1sYmpaM0Jm?=
 =?utf-8?B?YUVjOGJhTW53U3JhZlJpMkhFTnFsZ3BOUlUyTEsxQU1Ua3JRZlhRbm1HUzFk?=
 =?utf-8?B?bHQ2YlpjdGxSUWZzN3JYTGdEUWYrV1pQUEJoUko1a2dPclFUWitzclJrdXRH?=
 =?utf-8?B?Sk5lbkFqZlpmTE9MbkZpRkRZaTQyRmYzYlNkQkNqSTNXY3IwbmVkQ1JsVTU1?=
 =?utf-8?Q?W/tk2u9ilf82R7KN9DhDed+7a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80250fb9-0219-4257-5e9d-08dd40a05f6b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 20:06:09.7429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUP36dF8AUo1y9mXsgb1NKTQEm7umzOvwLesxPJwzIHuLGv03AUPf4Qu+jtvbn5Kwjk3i1T+ktih7Kh1uwWP3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8995

Add basic HDR mode support for the svs I3C master driver. Supports HDR only
for private transfers and does not support sending CCC commands in HDR
mode.

Key differences:
- HDR uses commands (0x00-0x7F for write, 0x80-0xFF for read) to
distinguish transfer direction.
- HDR read/write commands must be written to FIFO before issuing the I3C
address command. The hardware automatically sends the standard CCC command
to enter HDR mode.
- HDR exit pattern must be sent instead of send a stop after transfer
completion.
- Read/write data size must be an even number.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/svc-i3c-master.c | 69 +++++++++++++++++++++++++++----------
 1 file changed, 51 insertions(+), 18 deletions(-)

diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index 19a16eb44220c..28b14972ca987 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -39,11 +39,13 @@
 #define   SVC_I3C_MCTRL_REQUEST_NONE 0
 #define   SVC_I3C_MCTRL_REQUEST_START_ADDR 1
 #define   SVC_I3C_MCTRL_REQUEST_STOP 2
+#define   SVC_I3C_MCTRL_REQUEST_FORCE_EXIT 6
 #define   SVC_I3C_MCTRL_REQUEST_IBI_ACKNACK 3
 #define   SVC_I3C_MCTRL_REQUEST_PROC_DAA 4
 #define   SVC_I3C_MCTRL_REQUEST_AUTO_IBI 7
 #define   SVC_I3C_MCTRL_TYPE_I3C 0
 #define   SVC_I3C_MCTRL_TYPE_I2C BIT(4)
+#define   SVC_I3C_MCTRL_TYPE_DDR BIT(5)
 #define   SVC_I3C_MCTRL_IBIRESP_AUTO 0
 #define   SVC_I3C_MCTRL_IBIRESP_ACK_WITHOUT_BYTE 0
 #define   SVC_I3C_MCTRL_IBIRESP_ACK_WITH_BYTE BIT(7)
@@ -135,12 +137,13 @@
 
 struct svc_i3c_cmd {
 	u8 addr;
-	bool rnw;
+	u8 rnw;
 	u8 *in;
 	const void *out;
 	unsigned int len;
 	unsigned int actual_len;
 	struct i3c_priv_xfer *xfer;
+	enum i3c_hdr_mode mode;
 	bool continued;
 };
 
@@ -337,6 +340,20 @@ svc_i3c_master_dev_from_addr(struct svc_i3c_master *master,
 	return master->descs[i];
 }
 
+static bool svc_is_read(u8 rnw_cmd, u32 type)
+{
+	return (type == SVC_I3C_MCTRL_TYPE_DDR) ? !!(rnw_cmd & 0x80) : rnw_cmd;
+}
+
+static void svc_i3c_master_emit_force_exit(struct svc_i3c_master *master)
+{
+	u32 reg = 0;
+
+	writel(SVC_I3C_MCTRL_REQUEST_FORCE_EXIT, master->regs + SVC_I3C_MCTRL);
+	readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
+			   SVC_I3C_MSTATUS_MCTRLDONE(reg), 0, 1000);
+	udelay(1);
+}
 static void svc_i3c_master_emit_stop(struct svc_i3c_master *master)
 {
 	writel(SVC_I3C_MCTRL_REQUEST_STOP, master->regs + SVC_I3C_MCTRL);
@@ -1205,6 +1222,7 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 			       u8 *in, const u8 *out, unsigned int xfer_len,
 			       unsigned int *actual_len, bool continued)
 {
+	unsigned int rdterm_len = *actual_len;
 	int retry = 2;
 	u32 reg;
 	int ret;
@@ -1212,14 +1230,19 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	/* clean SVC_I3C_MINT_IBIWON w1c bits */
 	writel(SVC_I3C_MINT_IBIWON, master->regs + SVC_I3C_MSTATUS);
 
+	if (xfer_type == SVC_I3C_MCTRL_TYPE_DDR) {
+		writel(rnw, master->regs + SVC_I3C_MWDATAB);
+		if (svc_is_read(rnw, xfer_type))
+			rdterm_len = DIV_ROUND_UP(*actual_len, 2);
+	}
 
 	while (retry--) {
 		writel(SVC_I3C_MCTRL_REQUEST_START_ADDR |
 		       xfer_type |
 		       SVC_I3C_MCTRL_IBIRESP_NACK |
-		       SVC_I3C_MCTRL_DIR(rnw) |
+		       SVC_I3C_MCTRL_DIR(svc_is_read(rnw, xfer_type)) |
 		       SVC_I3C_MCTRL_ADDR(addr) |
-		       SVC_I3C_MCTRL_RDTERM(*actual_len),
+		       SVC_I3C_MCTRL_RDTERM(rdterm_len),
 		       master->regs + SVC_I3C_MCTRL);
 
 		ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
@@ -1279,15 +1302,14 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 			break;
 		}
 	}
-
-	if (rnw)
+	if (svc_is_read(rnw, xfer_type))
 		ret = svc_i3c_master_read(master, in, xfer_len);
 	else
 		ret = svc_i3c_master_write(master, out, xfer_len);
 	if (ret < 0)
 		goto emit_stop;
 
-	if (rnw)
+	if (svc_is_read(rnw, xfer_type))
 		*actual_len = ret;
 
 	ret = readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
@@ -1298,7 +1320,10 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	writel(SVC_I3C_MINT_COMPLETE, master->regs + SVC_I3C_MSTATUS);
 
 	if (!continued) {
-		svc_i3c_master_emit_stop(master);
+		if (xfer_type != SVC_I3C_MCTRL_TYPE_DDR)
+			svc_i3c_master_emit_stop(master);
+		else
+			svc_i3c_master_emit_force_exit(master);
 
 		/* Wait idle if stop is sent. */
 		readl_poll_timeout(master->regs + SVC_I3C_MSTATUS, reg,
@@ -1308,7 +1333,11 @@ static int svc_i3c_master_xfer(struct svc_i3c_master *master,
 	return 0;
 
 emit_stop:
-	svc_i3c_master_emit_stop(master);
+	if (xfer_type != SVC_I3C_MCTRL_TYPE_DDR)
+		svc_i3c_master_emit_stop(master);
+	else
+		svc_i3c_master_emit_force_exit(master);
+
 	svc_i3c_master_clear_merrwarn(master);
 
 	return ret;
@@ -1354,6 +1383,11 @@ static void svc_i3c_master_dequeue_xfer(struct svc_i3c_master *master,
 	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 }
 
+static int mode_to_type(enum i3c_hdr_mode mode)
+{
+	return (mode == I3C_SDR) ? SVC_I3C_MCTRL_TYPE_I3C : SVC_I3C_MCTRL_TYPE_DDR;
+}
+
 static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 {
 	struct svc_i3c_xfer *xfer = master->xferqueue.cur;
@@ -1368,7 +1402,7 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
 	for (i = 0; i < xfer->ncmds; i++) {
 		struct svc_i3c_cmd *cmd = &xfer->cmds[i];
 
-		ret = svc_i3c_master_xfer(master, cmd->rnw, xfer->type,
+		ret = svc_i3c_master_xfer(master, cmd->rnw, mode_to_type(cmd->mode),
 					  cmd->addr, cmd->in, cmd->out,
 					  cmd->len, &cmd->actual_len,
 					  cmd->continued);
@@ -1544,9 +1578,8 @@ static int svc_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 	return ret;
 }
 
-static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
-				     struct i3c_priv_xfer *xfers,
-				     int nxfers)
+static int svc_i3c_master_priv_xfers_mode(struct i3c_dev_desc *dev, struct i3c_priv_xfer *xfers,
+					  int nxfers, enum i3c_hdr_mode mode)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct svc_i3c_master *master = to_svc_i3c_master(m);
@@ -1558,16 +1591,16 @@ static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
 	if (!xfer)
 		return -ENOMEM;
 
-	xfer->type = SVC_I3C_MCTRL_TYPE_I3C;
 
 	for (i = 0; i < nxfers; i++) {
+		u8 rnw_cmd = (mode == I3C_SDR) ? xfers[i].rnw : xfers[i].cmd;
 		struct svc_i3c_cmd *cmd = &xfer->cmds[i];
-
+		cmd->mode = mode;
 		cmd->xfer = &xfers[i];
 		cmd->addr = master->addrs[data->index];
-		cmd->rnw = xfers[i].rnw;
-		cmd->in = xfers[i].rnw ? xfers[i].data.in : NULL;
-		cmd->out = xfers[i].rnw ? NULL : xfers[i].data.out;
+		cmd->rnw = rnw_cmd;
+		cmd->in = svc_is_read(rnw_cmd, mode_to_type(mode)) ? xfers[i].data.in : NULL;
+		cmd->out = svc_is_read(rnw_cmd, mode_to_type(mode)) ? NULL : xfers[i].data.out;
 		cmd->len = xfers[i].len;
 		cmd->actual_len = xfers[i].rnw ? xfers[i].len : 0;
 		cmd->continued = (i + 1) < nxfers;
@@ -1766,7 +1799,7 @@ static const struct i3c_master_controller_ops svc_i3c_master_ops = {
 	.do_daa = svc_i3c_master_do_daa,
 	.supports_ccc_cmd = svc_i3c_master_supports_ccc_cmd,
 	.send_ccc_cmd = svc_i3c_master_send_ccc_cmd,
-	.priv_xfers = svc_i3c_master_priv_xfers,
+	.priv_xfers_mode = svc_i3c_master_priv_xfers_mode,
 	.i2c_xfers = svc_i3c_master_i2c_xfers,
 	.request_ibi = svc_i3c_master_request_ibi,
 	.free_ibi = svc_i3c_master_free_ibi,

-- 
2.34.1

