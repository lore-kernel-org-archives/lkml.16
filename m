Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D091DF96B
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738181173; cv=fail; b=U/RxCsZFjuAbbxHOWeSGC1lJ9RwZ5Wfqa5jflMQAow9J0ckdHbUXRv7AVU6BB1czJ35AonLpG7oLWFVirXc+LNpuqiljbZag4cVGXh9iEEe/pFeR4WsRvJ9Ws1oO0gh8azgvJfs2CrBQoJsbMbDsNMLdc7o6LZUKaUuQdionpv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738181173; c=relaxed/simple;
	bh=Qv+OIZUavFWAsZsR0hppGZh+8cB7gwaFIH0gV7V5F2Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bcwOjMDGJx7uKNbQM2v9EKjU7C5tfq8E7QylvS4rqa6XTcRO6V+BnvtSwEKpib5CWEzF7lBINqEtI2bOoT7Ez7MQK4x5VTXTISXr1waNbRfIkMXQ94vMxqpCBmA/9bvRKd75R1w6kt70VEl4GyD5/o6hRCmPHysBLSh8eBxWE6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=koL8xuk4; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="koL8xuk4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlxbHDjDrWLMEj4QoQ4AgdGVBkl7q6A5TkPq+wZ2YtobbuRrr8+dhBmglKECw1j5N0baQIB7h1J3g5DbZVxvhaCiRYC8jrrR6MJcsiHBUp9i9KyTxKRZW9iYnqrhSwxCpZgYVwjlsgo5eR/lCtZenRWE9n20LCmeAIicUAarSHt0RCENdPbZx4jcMORtwUl6f/ybSyjkiP4pQEa5+FnloiHLS66wRO0u5Gp51Xwqz48WTLV8LwHs0QASoyyG5dR47icyVnQ20P6uZNtM9Vr52uej7XjvIikImHN6xcKUW+5ltO8jhfo21UFMiiQblA2diNoVxXiXZhfbVTBBvYk8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xn3u/pAWnMVPiqNzEyEfz/JVJtr2ST8EZyxY/LMSig=;
 b=EmCLDg6teR+t5dNg+LkYWj/QTo3PJTsmIDhOeXhCR9up6AYmk5fwW1bmnxOMZHM9cYn/SN6a2bU/1TCcAmrWWRkGUtr/LMwCbInDsY0QQES5wKdsBcFrF86SKuWtXkerVQnUGOOZrd1MzGVQwVzLixr/Ooa7gMPGn8KZpO3gbF3DyDqCZkOPHOutBhxPj0KqnJSAj+Gq3mr2a6+I1Y13is2cHdsQjo0tcxXO6pNj7DCOzK6X/TwDaG9E2eWAEJzqIJY7ky5VqgFa6QnkZGOz900wFyCeEMloQi5rKf18sSOy5AVyxalYE36qWs1m/2qDN9sXXEUPUpOMCIAn7x4EuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xn3u/pAWnMVPiqNzEyEfz/JVJtr2ST8EZyxY/LMSig=;
 b=koL8xuk4hr9/FKboVdXoqp7vJrua7sS/ig4ZFb+dl0Mq3svcWNfqAJMCD5UJPiAVahcVkxZAjzIba7UFmD1tQBuMA4vTrLRr+dWNk3vYb8eLhs1j35CR3g41bdGaryrEam78l57+HbNma7GILNSloMWJIXnt6QQ9C4AhcnxbKdHxppJ4s7QxaZpEkcxYpn6yRJeWVI9gceZSsg1Itq0ugK27uY+KHkIdr4BF5BwYKYRLdEnar50Uy9u5mzZQuXM9MsCB/xfSg/UKZtIUkZkIzPRmIaFrHJHRnMqlyvQfw6IpzW70p0NHNg5VqyRON54ehQyyZU+8I9OrsZXX/Dp2fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8995.eurprd04.prod.outlook.com (2603:10a6:20b:42e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 20:06:07 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 20:06:07 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 29 Jan 2025 15:05:52 -0500
Subject: [PATCH 1/2] i3c: Add basic HDR support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250129-i3c_ddr-v1-1-028a7a5d4324@nxp.com>
References: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
In-Reply-To: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Culhane <conor.culhane@silvaco.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738181163; l=6612;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Qv+OIZUavFWAsZsR0hppGZh+8cB7gwaFIH0gV7V5F2Q=;
 b=wrmGPkIgbj/nyGtRsl41Dg9/ksdiyaa8YDyPFqFJsuwVmv+5LyiPATNBBUDi7EijUYL54GK//
 DJs11Sq/Q/DCWe7ctzzPqw0N7Zgmzliqx0bXQJDGsCFdZFn0S65tbfD
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
X-MS-Office365-Filtering-Correlation-Id: 587ad316-beb0-4472-ad9d-08dd40a05e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NkhGQS9zMkliOXZ0VHp5YWxYaldybUt2R2lRR2xOMWhTRkZwSHVSMzkvb1cv?=
 =?utf-8?B?RkNnZUFVRFQybmlpbG45N2s4VGFReWJsRUg4ckg0dFZodWNNdHFNcUxCa1NB?=
 =?utf-8?B?L1dUcUJyWjBVVlh3Um5nNXdva01HVnZ0ODVYbmM0eWVuVktEenpzWkVIMzVP?=
 =?utf-8?B?aE1BZkp6cUhwNVVJMWJENmM1OGV3ekw5WWdNRXJPZ05FN0twWXJHYzlLWnQx?=
 =?utf-8?B?NkpiNjRzaVkvclUyc0ZaeUkySnZkeDNUSXdEYmxHYnhjcHc1NjZQc055TUJG?=
 =?utf-8?B?QU5Fa0wySk1KUlBDRS9iVzRuKy9OcVJ0RXZsRXRMTGkwVnJNOTR6VEZMTjRI?=
 =?utf-8?B?V3hEcHNRVERWT29DSm1VbzFRQ2ZiQXdGQmZhd2gwL3VEZkoycjM1dyttNjFy?=
 =?utf-8?B?Vm1PZnp3RW53SWFHYTNyWWZHZnQyNGpYQXJvK0JTT2ppZVdmOFhWeWIxWTRs?=
 =?utf-8?B?SEZNc1RGaHcrRTRyVWxCRU9UdmFUelp6Wm16WDNRQ2c5aEtBNDROZUluVFFY?=
 =?utf-8?B?dUthQ3RUSnBsMUZ6OWx4S3dJYWtPMVg3NjA5ZzkrMW1UKzAyOXJqTzBVSjV5?=
 =?utf-8?B?eDlMbXdJSWM1RHg5czVXSXo3TTllMmt3ck0wVktqdmt1Nm0yeXJvdVVHRjhr?=
 =?utf-8?B?ZmRvTlZGTCtyOUZ6NnJuSk5GS01ROVRpZis4MXVWMExSNlJkOE1KM1hYUFRa?=
 =?utf-8?B?ZmJRRXRzdDBFQ1h4dWdEZTFlMjc2cVUxV0dld2R2d1dZNW9VdnZUTXJkUm9z?=
 =?utf-8?B?ZFRmdHI3TW04ZHZuSWVuSlg2TjhVQUV2VzhkZ0NUYUM2eldHZ3R2VU1WczFO?=
 =?utf-8?B?WTc3elNrcGEvWW9NZWF3ZlhQTS90WHZoKytzRmhEY3NPSERFM0N4RDU5LzNN?=
 =?utf-8?B?WUNlYmh4OUErUGgxcmJJZ0RMZ0tSQkhFVnd3UEpVL3lPd2FFSUJrcmNCRnVl?=
 =?utf-8?B?SENMd1NUVUNTSDZBb3dFeUFlSWNSR2NBbW40S0NhVUtkNUFpejN6TGdZblV5?=
 =?utf-8?B?Q1cvSGNhc0hvV0diMytLUENjamlaZjRqdVRERzN4SjVaU3YzcXhJNVRUbU90?=
 =?utf-8?B?anlDREF1Q25ZV3lrZTVGWXczZG9uVXlwR0NiaC9vbS9FVUowZlNNVFQ0MDJS?=
 =?utf-8?B?eVRvTnhLNGl6Ny9aajJSUXBrSk9kSVI1bE5aVVFwc2dlampmRTdvRSt4UVN5?=
 =?utf-8?B?bEtlTk5LMEpDQnUyWUQ0MTdWMUgvY1oyWjFwLzRjaDZHYmhaMy9yS2VlbzVk?=
 =?utf-8?B?QTdZV2p3K0Q5VFFIWGF5cGJIa2lKV3N1NW14clovUmtPTXNmS2VhWVg5R1g1?=
 =?utf-8?B?aWZnWEwwVTBlOXpZbUVQMlhyaVZteGdoVHRCY1pQT1JGait3MmtxRjF2SHZp?=
 =?utf-8?B?VnByTFl5bDA2RWpkVHZ1cjljZjJGNGtrc1Y0Sk1tT1VrMkJLeENNY0V1MlNN?=
 =?utf-8?B?K0YyZ2VEQmk1UnE2cyttUy8rRndSeFA1eklFSkVWbGcxOHpSYm9nQmRqUk9Y?=
 =?utf-8?B?YjROdXJXNmFzUTVjNlFVNHRXWUNrU0lObVIyOGZnaVB1Y3I0R0VoRjI1cHlq?=
 =?utf-8?B?R0pmZ1p6NXdGRFN0eFBhRzBIWHQ1K200eXFWeW44WnBlQ3lNY2FGVmhrMjlh?=
 =?utf-8?B?c3pCZUxNVzhscUNFMlBuakNaUnQxK1VmU09ScmczTGgyOGxGL0NXYlZTamtC?=
 =?utf-8?B?UkNLeVZxTXhsaUNFczUyRzN6cWJ4WXkyb1VKMHBsQUxCUzVOd3JhcTlWNkIz?=
 =?utf-8?B?d0ZyZG9TMEdoZjRXR3IyZmJZemt4aVYxNk9pWDY1WEpUN1NSbE1rd0R4Z2J5?=
 =?utf-8?B?TVRzUWNRUmgwVUk2RTNsYWpEYnZSU1FtZUphZlJtczBDeFF3UmliV0NzQXZW?=
 =?utf-8?B?d2xsNFFQaVhDMDcyZUVDUE5iSWZ3a0xwWHZoWGFBVlJJK0RRTzJnY3Q1c3BB?=
 =?utf-8?Q?YDODxmneh5RZ8BXD5W1tZu7IaQ6zK9KS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWVjaDBjQ3BpMURDc1FtYTRLWkZEaW1tRU5aWlo4eC9Bc1dycG8rdTVjaWoy?=
 =?utf-8?B?cm9XQXZ0c05zTHQ2Z1l5TC9WKzc1WWFtbEd5d1NxbUowaUxHbUR6WFR6SUpy?=
 =?utf-8?B?OUgrY0xTWjZpTmZSV29NcFlzb01SY3VKTG1lSHFsTUtpWjJKUGlzRHVnei9W?=
 =?utf-8?B?cmIvTVBRTDVqaXppdS83cU9NOWw5eHQ1TjVKUVBEZlNGMEtIdndEaGhmUmgr?=
 =?utf-8?B?ZUNITFhMK1IvWmEwY0c0WDFHc3FWeXFFRDVFaVAzRzJ4NXZKSnZtL2E3WitM?=
 =?utf-8?B?YkNibWgzcG1KK3EzOWQyU3JxNUxBVlZENzdac1lNRVo5M1M1bzBXbStEN0ZC?=
 =?utf-8?B?dHNhU3h1YkF5eVhFYTNwcklscWRUWUhIbnJIU3hnRXlOQmdMbjVEZHZtV25n?=
 =?utf-8?B?NW5qdWt3OVlSK1FQNWlGcWdoWXgrT0p4ZG1NcEd3SlZHaGp0SUZOQ2JhMXlt?=
 =?utf-8?B?aEc0TXVISlg5UlJpekVxS2pDNVRkekxkZCtxclZaUzJCdnZWKzJ1eEpFZ0x0?=
 =?utf-8?B?L05oa1pIODVHTFg0L1FHMXE1bkNrKzBILzl0WTM3V2k2NFBQdEFiaVZ4L1gw?=
 =?utf-8?B?ZWEvTkw3dHhCOW0xYUdndEpabHRkbUxXUWs4Uk9JdURVcVhucUZLWUZwTG9t?=
 =?utf-8?B?Tkx5NkVGdk03Y0FMQnZYanRqcjY5OWhsNUlzNUdoc1pKOG02MGZjUHVPYU5J?=
 =?utf-8?B?ancvYkVnVW94NElHZi9aRWZNamtqclZscEJXY0hCOWc2VUNUK3JEdGVMVlJO?=
 =?utf-8?B?Rms2SFp2NkxhY0g2L2JubEhLL0I4NWpMK2JBejVDa1Q1T1VNT1FxKytUTmFi?=
 =?utf-8?B?cllveXRhT3BCM3h6WUpGOVMvOTNSV2ZOOGxhS3haZU0ybFZvczNhc3lRN21h?=
 =?utf-8?B?cTM1N2NOUzlCaVZtS3o1Y0F5OUpkQWZUMDVEZ1V5S0xJQklickxQamtyZWNP?=
 =?utf-8?B?RFJrbGFHcUxBM2g0RzEwZ1lvRkZuTXBzcUs3TktzLy9oZHRNTkpJNUtCZFd2?=
 =?utf-8?B?bFUrczBSWjczd1pRSUFDcmtaR3F6WTZmek42M29vVURZRmxodHZjdlE5Slo1?=
 =?utf-8?B?TEtvQS9GdkhsMW51UFZaMEJKaVZxN2JwSkZPVDFFZUliL0pyYS94empEeU1E?=
 =?utf-8?B?NXZEWkxSNUFMajBNSkE3TWcrUDlIZlU3cXk5VlM4ZXA2WG1LTUVMcTVqSXg1?=
 =?utf-8?B?NWdpZC9hRUhxWWtXa044K0drREVzSjJJWkVaRGZVS1l0K0RsZWRKL0VHZjlj?=
 =?utf-8?B?M0pxRDVGblQ5Yjd6ZmN3amRwS0l1SWZsQnQzNSsvN3VPUVRDUVBvTTNQcU5K?=
 =?utf-8?B?OWF2UzBSZmhFTU9Pbk8vSWVjQ0UxTG9PdkVYOTFabFJ5aENWcThPNytiOXpx?=
 =?utf-8?B?K1JPbkVMSjYwdkVzUC9vcnBIRlVvRllMTVFTcTdtYkdIVEdjNnBaMjlpZkpj?=
 =?utf-8?B?clZURWo2cERjd1pMTkFRZlZvM2FJWWZ3OGRnNjdQNGpiSlVXek5KYVJURU5j?=
 =?utf-8?B?QVM2a2YzOVlyZ0FPZ2doUEZEdW1SRllkU2lWbjRlMzhweUpWVVJocTMxTUN6?=
 =?utf-8?B?a3pJR3ZCdGZpa2grMnR3aHpBeGljTlphSXNwTmxhSFk3N09UZjZnRkNmNUZF?=
 =?utf-8?B?c3drOXRlWjBWRk1pUUJCZmduZHVhR2dQR0JnL29FeWhXNE9qTWNld21KZDRt?=
 =?utf-8?B?cER0T0JzUys0TDlXSU90NjhWYVRlZ09rUzkvYWRvSTNIRHU2R0dzR2NTQlFp?=
 =?utf-8?B?Q21VQTlBTVoweDhwR1J1VEFReVNQaEx2YUswSEVNdzN3bEsySVRlMWpyVG9y?=
 =?utf-8?B?RjRaV3Ftdzd0UC90azAyeDZXRTREMkJFTCtrQWhpRVNNNEJXMVcvT1VsK2hM?=
 =?utf-8?B?ZlBibEdPRjlaRVBvcXlFK1ptT3BVYzcrcU1waHNXTFpQUFBvMFdORHVXeFRU?=
 =?utf-8?B?UC9TQVpTRkNQdUNOT0JINDk1ajlTYzhIbVVXZjdPL0RuSWxuK0toMFJ3SWpR?=
 =?utf-8?B?TkJMT2QxeE9VUWQxQTM2K1JyYko4RmpoSUdOc0UzbHdIQ3F1bzhmblpMRk5s?=
 =?utf-8?B?b1dGSWxHa0hEQzV3aWlLMDNqcVJmS0k2OGZJUUxZVENXa0t3ak4ycFBrY0Ew?=
 =?utf-8?Q?1xNFBxYp6deiwUzwXLq1rschQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 587ad316-beb0-4472-ad9d-08dd40a05e18
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 20:06:07.5444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JwywFUA+AUHDHqXQgHAfg9Vqs8oh0/7GP32Ppd7DP0+amRdm1XZvJw80oB9zPqVdFqh/5uoITjGi53NeYwobcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8995

I3C HDR requires enter/exit patterns during each I3C transfer. Add a new
API i3c_device_do_priv_xfers_mode(). The existing
i3c_device_do_priv_xfers() now calls i3c_device_do_priv_xfers_mode(I3C_SDR)
to maintain backward compatibility.

Introduce a 'cmd' field in 'struct i3c_priv_xfer', using an anonymous union
with 'rnw' since HDR mode relies on read/write commands instead of the
'rnw' bit in the address as in SDR mode.

Add a priv_xfers_mode callback for I3C master drivers. If priv_xfers_mode
is not implemented, fallback to SDR mode using the existing priv_xfers
callback.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Why not add hdr mode in struct i3c_priv_xfer because mode can't be mixed in
one i3c transfer. for example, can't send a HDR follow one SDR between
START and STOP.

i3c_priv_xfer should be treat as whole i3c transactions. If user want send
HDR follow SDR, should be call i3c_device_do_priv_xfers_mode() twice,
instead put into a big i3c_priv_xfer[n].
---
 drivers/i3c/device.c       | 19 +++++++++++++------
 drivers/i3c/internals.h    |  2 +-
 drivers/i3c/master.c       |  8 +++++++-
 include/linux/i3c/device.h | 12 +++++++++++-
 include/linux/i3c/master.h |  3 +++
 5 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index e80e487569146..e3db3a6a9e4f6 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -15,12 +15,13 @@
 #include "internals.h"
 
 /**
- * i3c_device_do_priv_xfers() - do I3C SDR private transfers directed to a
- *				specific device
+ * i3c_device_do_priv_xfers_mode() - do I3C SDR private transfers directed to a
+ *				     specific device
  *
  * @dev: device with which the transfers should be done
  * @xfers: array of transfers
  * @nxfers: number of transfers
+ * @mode: transfer mode
  *
  * Initiate one or several private SDR transfers with @dev.
  *
@@ -32,9 +33,9 @@
  *		    driver needs to resend the 'xfers' some time later.
  *		    See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
  */
-int i3c_device_do_priv_xfers(struct i3c_device *dev,
-			     struct i3c_priv_xfer *xfers,
-			     int nxfers)
+int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
+				  struct i3c_priv_xfer *xfers,
+				  int nxfers, enum i3c_hdr_mode mode)
 {
 	int ret, i;
 
@@ -47,11 +48,17 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
 	}
 
 	i3c_bus_normaluse_lock(dev->bus);
-	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
+	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers, mode);
 	i3c_bus_normaluse_unlock(dev->bus);
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers_mode);
+
+int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_priv_xfer *xfers, int nxfers)
+{
+	return i3c_device_do_priv_xfers_mode(dev, xfers, nxfers, I3C_SDR);
+}
 EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
 
 /**
diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 433f6088b7cec..553edc9846ac0 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -16,7 +16,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
 int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 				 struct i3c_priv_xfer *xfers,
-				 int nxfers);
+				 int nxfers, enum i3c_hdr_mode mode);
 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
 int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
 int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index d5dc4180afbcf..67aaba0a38db2 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2945,7 +2945,7 @@ int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
 
 int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 				 struct i3c_priv_xfer *xfers,
-				 int nxfers)
+				 int nxfers, enum i3c_hdr_mode mode)
 {
 	struct i3c_master_controller *master;
 
@@ -2956,9 +2956,15 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
 	if (!master || !xfers)
 		return -EINVAL;
 
+	if (master->ops->priv_xfers_mode)
+		return master->ops->priv_xfers_mode(dev, xfers, nxfers, mode);
+
 	if (!master->ops->priv_xfers)
 		return -ENOTSUPP;
 
+	if (mode != I3C_SDR)
+		return -EINVAL;
+
 	return master->ops->priv_xfers(dev, xfers, nxfers);
 }
 
diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
index b674f64d0822e..7ce70d0967e27 100644
--- a/include/linux/i3c/device.h
+++ b/include/linux/i3c/device.h
@@ -40,11 +40,13 @@ enum i3c_error_code {
 
 /**
  * enum i3c_hdr_mode - HDR mode ids
+ * @I3C_SDR: SDR mode (NOT HDR mode)
  * @I3C_HDR_DDR: DDR mode
  * @I3C_HDR_TSP: TSP mode
  * @I3C_HDR_TSL: TSL mode
  */
 enum i3c_hdr_mode {
+	I3C_SDR,
 	I3C_HDR_DDR,
 	I3C_HDR_TSP,
 	I3C_HDR_TSL,
@@ -53,6 +55,7 @@ enum i3c_hdr_mode {
 /**
  * struct i3c_priv_xfer - I3C SDR private transfer
  * @rnw: encodes the transfer direction. true for a read, false for a write
+ * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
  * @len: transfer length in bytes of the transfer
  * @actual_len: actual length in bytes are transferred by the controller
  * @data: input/output buffer
@@ -61,7 +64,10 @@ enum i3c_hdr_mode {
  * @err: I3C error code
  */
 struct i3c_priv_xfer {
-	u8 rnw;
+	union {
+		u8 rnw;
+		u8 cmd;
+	};
 	u16 len;
 	u16 actual_len;
 	union {
@@ -301,6 +307,10 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
 			     struct i3c_priv_xfer *xfers,
 			     int nxfers);
 
+int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
+				  struct i3c_priv_xfer *xfers,
+				  int nxfers, enum i3c_hdr_mode mode);
+
 int i3c_device_do_setdasa(struct i3c_device *dev);
 
 void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 12d532b012c5a..352bd41139569 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -472,6 +472,9 @@ struct i3c_master_controller_ops {
 	int (*priv_xfers)(struct i3c_dev_desc *dev,
 			  struct i3c_priv_xfer *xfers,
 			  int nxfers);
+	int (*priv_xfers_mode)(struct i3c_dev_desc *dev,
+			       struct i3c_priv_xfer *xfers,
+			       int nxfers, enum i3c_hdr_mode mode);
 	int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
 	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
 	int (*i2c_xfers)(struct i2c_dev_desc *dev,

-- 
2.34.1

