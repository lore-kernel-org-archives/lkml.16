Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023111.outbound.protection.outlook.com [40.107.159.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD692DA75C;
	Sat, 14 Jun 2025 14:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.111
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749910892; cv=fail; b=a71y1mrVmTWe74HjkiIaGlQhEpRaqLEeLam8Hb3m8bLZ0d0rz1nslPvtzTxOZdNuAGGCslohey7mulKuFhzGLD1T4jX2qfEAVtvk6ds9BqBOQDGT9k+ZnJPM+2qBjynJf7Pf0SECt3AWHaSQwKVrXGeofv/clmlYzak3Jfc2OBI=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749910892; c=relaxed/simple;
	bh=iLwGB9Cz+ekHVEBz74ll88bIdltrxet9rAGtIUnkARw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XLJbDmd+ezm75p4BVjdXTALT/DJvXMPKD10JmCMBcNDdDhzUyR2HZtDyvDAgMA1bWl3ja4RrxIRrSarLL5ewXU7aQzXtpCxe9WiEDjPAU8IEdcqAQDqBoUL9xkukJ0+EcXGRuHqGdDZvTL5HpnohEQdCqAhGxSrW4g8qTfLix7w=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Y2yujjAw; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Y2yujjAw; arc=fail smtp.client-ip=40.107.159.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Y2yujjAw";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Y2yujjAw"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Bf2aAAZSdmdqPhOhKT4bqxNCS43VICg85bvEK6IrLJD9Ixb+/VyUhPPORYxsT0Su6cAATiaE+p96By37E4x3TXRqSXznIH2VdwZcO/9RSp5Rts05ov0zBB22SaKfLiMqLiSMivVzJA0yY+2dgkopua+bzDawz9mB/BmEfLJFgI4n8DdxMAED8i+Wk3QnnAQPvl1NqeJMNMIzN2fcBvlRrNLFjUJshrpPF3U/17J1JL87Hhj4ByBssptJFQvOi9eMMKBSjRWcdlXyZVoCRbY1f7u2lJekZv3PzrTpZI28hFFvwanr7SpqtHPo8VwyGtvGOfVFEjCTfCaz0NCVKUtcvQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sH3nBWchK4dL3OJQih0nbJlMVklro06J6MOi9chmabE=;
 b=tZ5Q8LYTUjsLrwU4zp4S/Y8kELkjAWvDJFWQ/BuJ8a6K15gO7V8mSfdUX2oZlyNfd4zg383kduvTDBA8Vadx8t1rhs8khb5H6Cz4PgLv8Pdd0vSLyA5x/i5Q7N5BpFUHjNinil+IaPc31JSxp18ggw+JiEJ3UM5L+cTe2L4ATTG9upGBPyuh0yHj6y6XP82rTzvMBi9YXB1mQb8OhcmsnxOBUjrHqqutOqp8GSO8I+0MLPsQh+rHQgu/ZlwkrqPBpQU4UIszJMEv+zgsLCKBlP6VMv1vwznt66NdahB7jx/Mv/RcCq5VJNOblt2HN0y5bsAwLOvQag9fc0PhHiLVoA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sH3nBWchK4dL3OJQih0nbJlMVklro06J6MOi9chmabE=;
 b=Y2yujjAwmLLtKGSHuyrQ8Y7CNqr601eyn4r+Hu3wgQGwlduYh4sJ/XbB9tI/ry4Ywt9oARLKpsM1O5uELdyMmW2rkcU8AY0exH/PkCf2XLzrdr61UT1NHOAjHH7NNkGkF2z4xpeJjw5nLWMqbuaVj1s9JiXkVbeuofr+GcIbioU=
Received: from DU7P251CA0001.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::14)
 by DU2PR04MB8663.eurprd04.prod.outlook.com (2603:10a6:10:2de::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Sat, 14 Jun
 2025 14:21:26 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::e5) by DU7P251CA0001.outlook.office365.com
 (2603:10a6:10:551::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Sat,
 14 Jun 2025 14:21:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Sat, 14 Jun 2025 14:21:26 +0000
Received: from emails-813896-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-110.eu-west-1.compute.internal [10.20.6.110])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 129D57FF11;
	Sat, 14 Jun 2025 14:21:26 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
  dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1749910886; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=sH3nBWchK4dL3OJQih0nbJlMVklro06J6MOi9chmabE=;
 b=X6I9V7XOofWOQEN7+QbrrZqSvnkFAB65qTfyoQu+aJxi1jgoah+/tnW3Ew1DeGigw6eYj
 toNTjirp72j/W6f2gorPJxiR2i8SCF5mpVtIjzBlLlrTzjpcD4aw1k2O3CMtP7x56RArJZF
 pLhU26H/Cd8jHtBWZDHYZI5h4PdBzKk=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1749910886;
 b=dcNrVoiJjgflAWzN0x47EdwAvsQq0Tu3c9Fa1zR9tqpm2WqTpAbvqLVvMZU488OtHoURR
 E5Eqr+ITpxb204s1EjvLn5Sa2sT8JZS8Iz5Dx1ZYTMykNmXQnopXF8SUM4iO+HLT9Sf4HIm
 7SK1Xfxyqk8MnH96TFx8Ps/Pz3kczuY=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHDbiqQHIU8kkLbCrMBJSeQ+AVh3/UmcO3yNKy9WYPOmn7TRqTKWOeFHcwODlUSL4NeMZZPIA1c4jGwB+PYnKpWkstq4NLKfW9qGYkZ729arDKHaVZMB5SAJJBDXu3nPaLg5dV4cvrNPK7WBPg5hMncKSJWEE9w9L4vXLCOiUlrtvGL4b2GDbZb7JX6N61iwAJK4q+YAsxzcHDN83tar41b3XsUaHMm5UzeLF4lQxXiDEuvN4i/U2OIPZWsrAoC9Au1B2DsT9gGoa7ekjGEAFFzgVUgf9O1B1vgcysAinTGyIfS3vqwPlalq3OEA+/w7U1fIreq5NA/rmzoh0wJ2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sH3nBWchK4dL3OJQih0nbJlMVklro06J6MOi9chmabE=;
 b=VCPr2lQLQfnK6D3XkLS4s0vvNDtSSmwjJszh5dQtCRQqOjE61V8zCkQMuzHzzvpAANa6aIB6lE5aaRz/qXQWSed1ONRa9nBus98ZTfiJNJmdIdYnlI5Ok3YauTRvyqQ4uSDm7yjLYvVS3BHIBZ4JxfYWUkkSra2nJIVfP3BGm+L0Fq2Zz95HJr/UoyDS5PsOwc7tHZKe3LLGWL20OlcgfcVcBFktuTp9dS4qTtbd9ftYzgoDtvP/8VuCM28GUSFNt+KuKrTRmPo3tlEPTgongjcEeKA+twfi4AkyC0ia7V2YUjAN5Nv6XVBrZnO1/JCx5ZdVI0vkHQ4qeBmeywqTHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sH3nBWchK4dL3OJQih0nbJlMVklro06J6MOi9chmabE=;
 b=Y2yujjAwmLLtKGSHuyrQ8Y7CNqr601eyn4r+Hu3wgQGwlduYh4sJ/XbB9tI/ry4Ywt9oARLKpsM1O5uELdyMmW2rkcU8AY0exH/PkCf2XLzrdr61UT1NHOAjHH7NNkGkF2z4xpeJjw5nLWMqbuaVj1s9JiXkVbeuofr+GcIbioU=
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by VI0PR04MB10174.eurprd04.prod.outlook.com (2603:10a6:800:243::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Sat, 14 Jun
 2025 14:21:11 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::c04e:8a97:516c:5529%5]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 14:21:11 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 14 Jun 2025 17:20:57 +0300
Subject: [PATCH 2/3] arm64: dts: add description for solidrun imx8mp som
 and cubox-m
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-imx8mp-sr-som-v1-2-3ca3269883c4@solid-run.com>
References: <20250614-imx8mp-sr-som-v1-0-3ca3269883c4@solid-run.com>
In-Reply-To: <20250614-imx8mp-sr-som-v1-0-3ca3269883c4@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TL0P290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::17) To AM9PR04MB7586.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d5::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR04MB7586:EE_|VI0PR04MB10174:EE_|DB1PEPF000509F0:EE_|DU2PR04MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: 94453967-0fc5-441f-8cdc-08ddab4ebf49
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|52116014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YzZIZWZiMG5ma3c3LzdGSlptTEdKVG5vdjdWQStlVG55YnE1VmkrRXdUZURw?=
 =?utf-8?B?NldGdS9WMnh5YzJ2K1NmSFJyUlE5VVd4ZnpDOWwvQ3g3Q3FEOG5xZG5pNy95?=
 =?utf-8?B?V3FrT1d6bk91cHRWcTIweGxhcjBGVDBNN0F0aU5nWkZqS0lmNnQvdE5LSXVk?=
 =?utf-8?B?ZFFlYjk4RHA2QTFFQ2xpZExjMUczOGdaQVU0Y3E3MmVJL0syMVlXQlE0WTZk?=
 =?utf-8?B?ckVjS1hyODJRbnpiWHZNRmpFUmd4TUcrekR0ZUgvSzB0N0t3TWc5MDhjUTBh?=
 =?utf-8?B?RGNvSnRQOHdCTnlkb0dVTTBhNS9ZaVdEenZqTmM5S3RHbWV2bWo3bElSd3VH?=
 =?utf-8?B?RW1ZS0t1K0JzYm52OVZ6QzNwKzEyR1k5Vm5GMEZqWDA5WjVGUUI0YUFCUGVw?=
 =?utf-8?B?RXFpVU04d3dXL0R4VzUwRndQWWpVT0xqQVc1Nnc4TE93Smx5cmJrRlE4YlV0?=
 =?utf-8?B?eDA3M0pEaTFKZFNuSzZHaUVjL3JESENjWXBuNEpKRElLSXIxQUVPaVIybGRD?=
 =?utf-8?B?eUc0cjNUNjVrdm9aMkg5UUZmbkQ0YW5rNG5aT0g1cEx5K214NTV1Wi9vL3Bk?=
 =?utf-8?B?TFVzNitOWUJOK3pteXA3RU1kZlZ0UUs3Z2hTRDlyU3dKZ0t2TXg2UFZFOWpQ?=
 =?utf-8?B?dkNuU2hNamNwbDJlLzdsRGxLVm1kcnoxWlNKVFFzMUFQMFoxajFKYythOE54?=
 =?utf-8?B?Mmg3UXFwNVlkaVBTZTJUQUJSc09NcnYzdTUvZXlDK0k4ZHlrVk1NVXhvcTRJ?=
 =?utf-8?B?dTFvNjNhK1F2S0xJVUJINXcvZU1CSm13am9NOFdySHlnelZ5TFI3bGJZL2lV?=
 =?utf-8?B?cDJicmdQQk5HZXZmTWp1RXZEL1VyNHZNSWZTd3Rwc3RuQmg2cGFaTllkUTVV?=
 =?utf-8?B?M2dsMGFOam9PMzZFTW5BRHV1aFo5QjFEVVJ4S1JocHc1MFpxRngrRytaODY1?=
 =?utf-8?B?OVo2VHIwQkNxTlpUaXVQMURCUUw5aFFGTjlJa1JHWXkzL0M3Nk8wVEZJQytV?=
 =?utf-8?B?K2NtS2RKSjY1NGhmZGxTQnRDVWM0RWZBbzdqeXZTNGp3OGJMSithbzlyUEFV?=
 =?utf-8?B?dnd5Sk02VVgvTTlLQTlrb3l6bWdmRzczNi82RVdsMkh1aDdwSmtJNWZQa2I1?=
 =?utf-8?B?SEc0T2xPTklxaXVYMEVoMEh0Mm9aSENoYldSMWx2blVYb0dBd1NrcDlQeU1U?=
 =?utf-8?B?Z0tYcGd1dys2NFNzVG1aV2lSSzl2WEJ2U2piNkd1K2IrQnZ1UytNWEdzeEI4?=
 =?utf-8?B?YjRhSnhITmpnTlVjdlZianRacjFwa01veU1EK1JiQTliTlJ0Q2VaKzFXOXZD?=
 =?utf-8?B?VXhOeGlpYmFtMEd0d2w5U0xlbi9CMFh6aU5tanArdXUwa3g1NzZLb3BiL0Zz?=
 =?utf-8?B?VEN1V3ZqSUVpSmQ2bmVzVXJtRS9MTnBiRDVYTTRJYS9GbUpZVFVyM0ZDVWRs?=
 =?utf-8?B?YXVsWFgyWTRJZisveG5RQTRPWDB2Z2lnU3JJY0l0bnUyQTRwRjVYeDhMbkJn?=
 =?utf-8?B?ci8rV3pkVXVJdW81OWRnL3pFbmxKSXhHNDNqOUFRMENGMDVsMHh0RzdSS1o2?=
 =?utf-8?B?aktobGJTbWovU25NL252dUZBcVdXYzZva1BhU0tJWklsbmpOTXdZeWttQVE2?=
 =?utf-8?B?MHY5V0lpTFNvSUNlVndIaXlPN2RPMVNDS3puYmtzK29vNUxvRDJzY3FWVndo?=
 =?utf-8?B?eEpzbklGRFczRXlONzQwZ09XenQvVysyWXgrM24vNWd1TUZrenZZd0syUkND?=
 =?utf-8?B?ZnM0Rm9LM2hQS2c4VEp5V2FUbHh4MFNyVEYxSStselVORVhKcFl0VFpJNFRp?=
 =?utf-8?B?aEJKMUMra1ZxSGhyRGxzeGh6N2ZwcktoblljcWhWL3hZY2lyc1dZL3JqaVNH?=
 =?utf-8?B?dkJhWFpGckErYy9SbTE3SHFFcU5LZXN3bnlVcVlVaFd0ajdBajN2aUcyRGs3?=
 =?utf-8?Q?qNEs2BDGK8k=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB7586.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(52116014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10174
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 5f30a195b6224913abef10d594a60fbd:solidrun,office365_emails,sent,inline:c6c1941fd6a7e60e4eda29d9496811eb
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba8e9f06-50e5-4e82-a1ee-08ddab4eb692
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnQ5MWRqV25NTTJSN3pXWHhLeE1EYzRRQkFOTjY3WUQrMlloL2dHMGV0UVZn?=
 =?utf-8?B?Rm5rL0ZZdVplRU51K0xSZ1dxWXN3S200RUxoQUJFZkRWYzBGSTZRa25ISTdu?=
 =?utf-8?B?ZTBNTFdXLzZsemRyeHpkYXFPTkU3bTZuMnVhZTFBNjV0VlRMWHBHb21iMnBS?=
 =?utf-8?B?L1krVkdNRFRQZm45Sk9lLytxM3lKd253SUc2WVR5WGl4SWlLYXVQVlVBUWd4?=
 =?utf-8?B?VTVZUWVrVm81aUpUT3dSd2hxdWJxejhFcndROXYwdVVNaHNQL2plK3NNMEhT?=
 =?utf-8?B?Z2IyR01SRXluVmptZU51VFB6WDFjd29ITkx5QTZhK1c2azdscnlMY0w2OHdU?=
 =?utf-8?B?NkNXNTh0ZExJN0hsWWcwcGNHNDdoR0p2MzVtSjVzZ2JmdlNDNjl4dmE2VjE1?=
 =?utf-8?B?ZlVkUlUyWmhXd1NHK04xSHJjUHdlYWpKQVVBaFNjQ2V5bE5ST3FRQzYxU1o1?=
 =?utf-8?B?Z2twN25GZGxSbXR1MjRmLzh5ZE1mbWhyL3l0Z2RmM3c2Q1NDZStnS3ZnQTV1?=
 =?utf-8?B?dCtZMGtIZVArb3NIQ2w2enE4elVQaWJrbU1KUDQzNUVDZlp1M0VNZFN0MjEz?=
 =?utf-8?B?VjMwaytXaFFhR0syZmFYZDRGUnNacFMwVElaclNhOHlGWng2L1lhbjJQOTBD?=
 =?utf-8?B?NmtFZlVIYjYxQmF0VjFIVkZWamlSZmlnR084cHU1M242b2xBZ2xNb0ZCWWNU?=
 =?utf-8?B?RXM3UzE0ZkcwRUowR1dxVVlGMUhTVVFoc2NGK1JMMTNsQWYxRXloT2syNzdq?=
 =?utf-8?B?K1NpdGFHUWdpRjJUMTc0Z3JsQkp5U25vQVdLbWhDak9hbWxyNjNmcGx4aWJu?=
 =?utf-8?B?ZHZTSTczMHZyYjdEZWpmdThzREVMNjJiZURsY1BpL1dINXZielMwQjMxVnpz?=
 =?utf-8?B?RWJUcFRrZGdPcS9QcmZPaDlOcjF4OVlJZC9hSEVZSHlJb0hOMXV3VHRwREhn?=
 =?utf-8?B?TkJ4UmZYK0pWY1VQQmpZOVpOMXZJVmRUWVIyVFZWYXA2ZG5Rc2Nsdkp2NjR4?=
 =?utf-8?B?Q3BXd1c5SVg5NFpXUmEyaXdWSEo2bnd2QkNUVUtmNjVBaWNiZ2hJWDFKL1hZ?=
 =?utf-8?B?QlpmOUpROTNLb2xCRWZLUjlNQStKbUlmNVFCd2Y0RjBVS29lNHVIeFFZZ1po?=
 =?utf-8?B?K3VhNnl6a2o2cS9sU0I0am1HdEpTTlhpTE1wSWFxREUycFJhSW13dUk4dm9a?=
 =?utf-8?B?NEVFb2VkRFQxclNRemtQaDhkVEpMY2k5dFAxZnlneW8vYmpUUCswN2czQm9s?=
 =?utf-8?B?OW9UdTF2aGJDQ2NpMXpyNkhMOW9BamFNUDNueTdnRzFvSUNQaTBnaENHODBQ?=
 =?utf-8?B?b3YxTFJZT2tFNTBZZ3NxSXVrei83MTRJMXNrM0tyRFRwZzJRcXFYWUIrMFFC?=
 =?utf-8?B?c3BCSjdOc3h2L3NUSkZYMi8wUEZ2N2xvMVNGODQ4M1F1ajV5NGhhUnIvZWV5?=
 =?utf-8?B?UW1XMlBLdGNnWE4zU2tkaWtzQ3pxUFY0WnZLWU9iTXZ0NTk4anJoUnAxL3J0?=
 =?utf-8?B?ZUVUWko1MnVnYldGWUZKVXY0Q3VObEh6Q2ozRzUwODNrcm5FRS9ob2xtTURN?=
 =?utf-8?B?U2NnZUZPSE1jZzZoeDYzOFdoL3dsa1dLdVZZeXdqVFV3OGJRKy9sUTBYOWVl?=
 =?utf-8?B?MHBTN0pVWWJZaWFLazdNQWZkQkR1SGkzY0owWGw2bUM5VFpKTHZGMG01VGNY?=
 =?utf-8?B?ekNTMnBRK0lXTU9ZakJiNFBiSnBuSjZzczlCY2djZlp2aExxY0szUk1tVURn?=
 =?utf-8?B?S0NuMW9pcENJQ3NuSTQxZmVyRE9BVXAzSVkzN0paMXJCY3BNR3Ezd1drNDY1?=
 =?utf-8?B?VlZWbUpyYTJBUHdWU1F3QU1adkhLU2MrWkFFWmFLWmsvTTFzL01Xai9XUHRN?=
 =?utf-8?B?TW84YytEU1YrVE5VZHhRaDJ6ZmxGVDdkLzRrdHN0ai9COXFJWVNqQkNaaWRK?=
 =?utf-8?B?cE9xcGN2ZXpCYlJuSm5xRHljeUJzWHVPTmxPaDErWGxac3EzV256dXQ1MVlx?=
 =?utf-8?B?c1ZGcDlSd00weGo1ckF3Snp4ZWRYck1nNGNPY0EydGdBcTErYkx2OU9DVFJ4?=
 =?utf-8?Q?u5bwK0?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2025 14:21:26.1111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94453967-0fc5-441f-8cdc-08ddab4ebf49
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8663

Add description for the SolidRun i.MX8M Plus based System on Module, and
the CuBox-M.

The SoM features:
- 2x 1Gbps Ethernet with PHY
- eMMC
- 1/2/3/8GB DDR
- MIPI-CSI Camera Connector (not described without specific camera)

The CuBox-M is a complete product with enclosure featuring:
- 1x 1Gbps RJ45 Ethernet Port
- 2x USB-3.0 Type A
- HDMI connector
- microSD connector
- microUSB connector for console (using fdtdi chip)
- IR receiver
- RTC with backup battery

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile           |   1 +
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts | 224 +++++++++
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi | 591 +++++++++++++++++++++++
 3 files changed, 816 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0b473a23d12008ff79d6467d9e1c7ab2c4d6a9a6..e98c15eb949957a193eb3a7612f3f0f2b04790af 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -194,6 +194,7 @@ imx8mp-aristainetos3-helios-lvds-dtbs += imx8mp-aristainetos3-helios.dtb imx8mp-
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-helios-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-proton2s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
new file mode 100644
index 0000000000000000000000000000000000000000..13da5e0196a3fc168efdde63d86f0fe776f999fb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mp-sr-som.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MP CuBox-M";
+	compatible = "solidrun,imx8mp-cubox-m",
+		     "solidrun,imx8mp-sr-som", "fsl,imx8mp";
+
+	aliases {
+		ethernet0 = &eqos;
+		/delete-property/ ethernet1;
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	ir-receiver {
+		compatible = "gpio-ir-receiver";
+		gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ir_pins>;
+		linux,autosuspend-period = <125>;
+		wakeup-source;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		status {
+			label = "status";
+			color = <LED_COLOR_ID_RED>;
+			gpios = <&gpio1 12 GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_HEARTBEAT;
+		};
+	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+		status = "okay";
+	};
+
+	vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus";
+		gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc_pins>;
+		regulator-name = "vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <250>;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&fec {
+	/* this board does not use second phy / ethernet on SoM */
+	status = "disabled";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	status = "okay";
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
+&i2c3 {
+	carrier_rtc: rtc@32 {
+		compatible = "epson,rx8130";
+		reg = <0x32>;
+	};
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_pins>;
+
+	hdmi_pins: pinctrl-hdmi-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c3
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c3
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x154
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x154
+		>;
+	};
+
+	ir_pins: pinctrl-ir-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x4f
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12		0x0
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-200mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
+			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
+		>;
+	};
+
+	vbus_pins: pinctrl-vbus-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0x100
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19		0x0
+		>;
+	};
+};
+
+&lcdif3 {
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1200>;
+	vbus-supply = <&vbus>;
+	status = "okay";
+};
+
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1200>;
+	vbus-supply = <&vbus>;
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	dr_mode = "host";
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	cap-power-off-card;
+	full-pwr-cycle;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..a7ee0a4d4f765581dbc27d3c5dfc656b026d27e6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
@@ -0,0 +1,591 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include "imx8mp.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MP SoM";
+	compatible = "solidrun,imx8mp-sr-som", "fsl,imx8mp";
+
+	chosen {
+		bootargs = "earlycon=ec_imx6q,0x30890000,115200";
+		stdout-path = &uart2;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0xc0000000>,
+		      <0x1 0x00000000 0 0xc0000000>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 11 GPIO_ACTIVE_LOW>;
+	};
+
+	v_1_8: regulator-1-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	v_3_3: regulator-3-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&eqos {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eqos_pins>, <&phy0_pins>;
+	phy-mode = "rgmii-id";
+	phy = <&phy0>;
+	snps,force_thresh_dma_mode;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&gpio4 19 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio4>;
+			interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <5>;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+		};
+
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+		};
+
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+		};
+
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <5>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+			snps,map-to-dma-channel = <0>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+			snps,map-to-dma-channel = <1>;
+		};
+
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x4>;
+			snps,map-to-dma-channel = <2>;
+		};
+
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x8>;
+			snps,map-to-dma-channel = <3>;
+		};
+
+		queue4 {
+			snps,dcb-algorithm;
+			snps,priority = <0xf0>;
+			snps,map-to-dma-channel = <4>;
+		};
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fec_pins>, <&phy1_pins>;
+	phy-mode = "rgmii-id";
+	phy = <&phy1>;
+	fsl,magic-packet;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy1: ethernet-phy@1 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x1>;
+			reset-gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio4>;
+			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-1 = <&i2c1_gpio_pins>;
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	som_eeprom: eeprom@50{
+		compatible = "st,24c01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+
+	pmic: pmic@25 {
+		compatible = "nxp,pca9450c";
+		reg = <0x25>;
+		pinctrl-0 = <&pmic_pins>;
+		pinctrl-names = "default";
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 GPIO_ACTIVE_LOW>;
+		nxp,i2c-lt-enable;
+
+		regulators {
+			buck1: BUCK1 {
+				regulator-name = "BUCK1";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <2187500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+			};
+
+			buck2: BUCK2 {
+				regulator-name = "BUCK2";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <2187500>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <3125>;
+				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-standby-voltage = <850000>;
+			};
+
+			buck4: BUCK4{
+				regulator-name = "BUCK4";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5: BUCK5{
+				regulator-name = "BUCK5";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6: BUCK6 {
+				regulator-name = "BUCK6";
+				regulator-min-microvolt = <600000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1: LDO1 {
+				regulator-name = "LDO1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2: LDO2 {
+				regulator-name = "LDO2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3: LDO3 {
+				regulator-name = "LDO3";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4: LDO4 {
+				regulator-name = "LDO4";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo5: LDO5 {
+				regulator-name = "LDO5";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-1 = <&i2c2_gpio_pins>;
+	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-1 = <&i2c3_gpio_pins>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&i2c4 {
+	/* routed to basler camera connector */
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-1 = <&i2c4_gpio_pins>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&iomuxc {
+	eqos_pins: pinctrl-eqos-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC		0x3
+			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO		0x3
+			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0	0x91
+			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1	0x91
+			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2	0x91
+			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3	0x91
+			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x91
+			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL	0x91
+			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0	0x1f
+			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1	0x1f
+			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2	0x1f
+			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3	0x1f
+			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL	0x1f
+			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x1f
+		>;
+	};
+
+	fec_pins: pinctrl-fec-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI1_RXD2__ENET1_MDC		0x3
+			MX8MP_IOMUXC_SAI1_RXD3__ENET1_MDIO		0x3
+			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0		0x91
+			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1		0x91
+			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2		0x91
+			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3		0x91
+			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC		0x91
+			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL	0x91
+			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0		0x1f
+			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1		0x1f
+			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2		0x1f
+			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3		0x1f
+			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL	0x1f
+			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC		0x1f
+		>;
+	};
+
+	i2c1_pins: pinctrl-i2c1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL			0x400001c3
+			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA			0x400001c3
+		>;
+	};
+
+	i2c1_gpio_pins: pinctrl-i2c1-gpio-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14		0x400001c3
+			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15		0x400001c3
+		>;
+	};
+
+	i2c2_pins: pinctrl-i2c2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL			0x400001c3
+			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA			0x400001c3
+		>;
+	};
+
+	i2c2_gpio_pins: pinctrl-i2c2-gpio-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16		0x400001c3
+			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17		0x400001c3
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL			0x400001c3
+			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA			0x400001c3
+		>;
+	};
+
+	i2c3_gpio_pins: pinctrl-i2c3-gpio-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18		0x400001c3
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19		0x400001c3
+		>;
+	};
+
+	i2c4_pins: pinctrl-i2c4-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL			0x400001c3
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA			0x400001c3
+		>;
+	};
+
+	i2c4_gpio_pins: pinctrl-i2c4-gpio-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20			0x400001c3
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21			0x400001c3
+		>;
+	};
+
+	phy0_pins: pinctrl-phy0-grp {
+		fsl,pins = <
+			/* RESET_N: weak i/o, open drain, external 1k pull-up */
+			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x20
+			/* INT_N: weak i/o, open drain, internal pull-up */
+			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0x160
+		>;
+	};
+
+	phy1_pins: pinctrl-phy-1-grp {
+		fsl,pins = <
+			/* RESET_N: weak i/o, open drain, external 1k pull-up */
+			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x20
+			/* INT_N: weak i/o, open drain, internal pull-up */
+			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03		0x160
+		>;
+	};
+
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x41
+		>;
+	};
+
+	uart1_pins: pinctrl-uart1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX		0x140
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX		0x140
+			MX8MP_IOMUXC_UART3_RXD__UART1_DCE_CTS		0x140
+			MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS		0x140
+			/* BT_REG_ON */
+			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10		0x0
+			/* BT_WAKE_DEV */
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07		0x0
+			/* BT_WAKE_HOST */
+			MX8MP_IOMUXC_SD1_DATA6__GPIO2_IO08		0x100
+		>;
+	};
+
+	uart2_pins: pinctrl-uart2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX		0x49
+			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX		0x49
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK		0x190
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD		0x1d0
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0		0x1d0
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1		0x1d0
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2		0x1d0
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3		0x1d0
+			/* WL_REG_ON */
+			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11		0x0
+			/* WL_WAKE_HOST */
+			MX8MP_IOMUXC_SD1_DATA7__GPIO2_IO09		0x100
+		>;
+	};
+
+	usdhc1_100mhz_pins: pinctrl-usdhc1g-100mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK		0x194
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD		0x1d4
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0		0x1d4
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1		0x1d4
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2		0x1d4
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3		0x1d4
+		>;
+	};
+
+	usdhc1_200mhz_pins: pinctrl-usdhc1-200mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK		0x196
+			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD		0x1d6
+			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0		0x1d6
+			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1		0x1d6
+			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2		0x1d6
+			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3		0x1d6
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x190
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d0
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0		0x1d0
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1		0x1d0
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2		0x1d0
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3		0x1d0
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4		0x1d0
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5		0x1d0
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6		0x1d0
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7		0x1d0
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE		0x190
+		>;
+	};
+
+	usdhc3_100mhz_pins: pinctrl-usdhc3-100mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x194
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d4
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0		0x1d4
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1		0x1d4
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2		0x1d4
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3		0x1d4
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4		0x1d4
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5		0x1d4
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6		0x1d4
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7		0x1d4
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE		0x194
+		>;
+	};
+
+	usdhc3_200mhz_pins: pinctrl-usdhc3-200mhz-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x196
+			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d6
+			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0		0x1d6
+			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1		0x1d6
+			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2		0x1d6
+			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3		0x1d6
+			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4		0x1d6
+			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5		0x1d6
+			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6		0x1d6
+			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7		0x1d6
+			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE		0x196
+		>;
+	};
+
+	wdog1_pins: pinctrl-wdog1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B		0x140
+		>;
+	};
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	uart-has-rtscts;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MP_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		device-wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>;
+		/* Murata 1MW module supports max. 3M baud */
+		max-speed = <3000000>;
+	};
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc1_pins>;
+	pinctrl-1 = <&usdhc1_100mhz_pins>;
+	pinctrl-2 = <&usdhc1_200mhz_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc3_pins>;
+	pinctrl-1 = <&usdhc3_100mhz_pins>;
+	pinctrl-2 = <&usdhc3_200mhz_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wdog1_pins>;
+	status = "okay";
+};
+
+/*
+ * Reserve all physical memory from within the first 1GB of DDR address
+ * space to avoid panic on low memory systems.
+ */
+&dsp_reserved {
+	reg = <0 0x6f000000 0 0x1000000>;
+};

-- 
2.43.0

