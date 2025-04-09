Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C93E1DE8A2;
	Wed,  9 Apr 2025 06:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744179277; cv=fail; b=syOft8xLZ4qLrolaiSED4v+pf1CKBOo0DbL73JW6psDFF7+lVbT5G4GjgL4dr4VU6eTNQcz6pkZJEfPMAXN22jGelwfcsS79jMsVsAAmJm+eCp3eeoQTIvOrqDz8+wbkjULpsiqgBMFhDXdxWitZ3zAwMVEBSivUSStrYrx0E2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744179277; c=relaxed/simple;
	bh=8QvSWd4rmn+G1ZEKi8f+TGc8yN5T+yIQA/mdWdtzwO0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sLD0Mmegan5r73ijnDLeanvZgYqxDSav9Rg8nSWZVav9U4zREvPPuqjMV2e9zb3Q1f+sg/3bB4Ws8GOaBqtNIw6PKEcRNg/xGdz1eOHtcV8dGYR6MfFZyi+X6ur3CVNWpHwk+Qm+CdGoBvqNGQ3gshrxiLXWAx5ddNisJEq0kPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GAqQZxxE; arc=fail smtp.client-ip=40.107.21.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GAqQZxxE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNGnAWUdOTo5aWsIkHHb2stWnua4IIO+QmyimOIE6wrjkrNFrVjQzNIwHXQGH8wTvBfpCNElEz6CIln3d3p0KtZNNIZbQN85ZX4E+2tS7pFdg8qnXnjL2luzOoVQIxfGNHX/VpoIfc11jYKd4xQog3IfYFylN9GlmkMyNd4iAjJGdTROiI32bDMLyaHvrtPGG7DibAEfHwJpt9GxvWCtOOmAR09X588do1BT5O5NvcUB5REOdwCmeFu/izY5lqH357+Id+xl30UlkCuiZT93VXThpKBgTRSNULGsqLInhyF6JdSwY3mebDsOVmXe7NdSNvJCbFa//Ms4baT683sdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+o55FPMa7m6VVea9dp3slj5OALcBnoJzyUth39j3Gk=;
 b=G9c+tkgB1Zt43r4C3+vRyACKMz2jWkN+VcJWq1HCSPfREDSpP9zIWVXd6CMZDLHuWjGP+754A8V5ky/lbDLNlGqVgFiLaKup3LPuhCE2AlKiphWavDXICnG17egtlngGNBvtDi7FwncWtWytDoa7Tvxwv/H+PWIxRwVzx4T8krLiXM5UWIP5BlYPYitZOa+tIwwd4GZbOY2vdApYmK9/H27MVntcoF0LMjpg4DEzzb4+MrQO9GgPYTIYhLaWehObri6jUS4tyN3san2PweC3YFfBqm0y/2VEfloYuOiXKCQ526z2pXJpnSobGOkVInPgC8kAfIjTbg5GWD/ZlPS+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+o55FPMa7m6VVea9dp3slj5OALcBnoJzyUth39j3Gk=;
 b=GAqQZxxEtba1hhXKZsOuvIOagvUu7JOFjq008q3BQWAH3RHTU4tFdPzhjaDKWc7izYGSPGH3acZNg6b4i6ugduAFYcHdDAFQ63FtsHKl5ErSk0eqaNuoGGbiwLy3TCFYlGwUxzpfYZP7onwtWwetMmkrZXdLEUHeLVmWDoysTfxpVAsJ9m1rr6qRgak5BB792dCLe+wrnTLah9R8ej4yj14qWLNCsH7Q/2By6nWYZEoD16Zr64FyPNVaQ/vldXJAVX4PZx7wPmwvWXMg9HSM1jGmYWC1r8S44sebQcNwta/ijyGMcwFJUIDHAwJQUivT855WEcGnLFvZS/Ce6uNI7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM0PR04MB6882.eurprd04.prod.outlook.com (2603:10a6:208:184::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 06:14:32 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 06:14:32 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 09 Apr 2025 17:07:42 +0530
Subject: [PATCH v16 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-imx-se-if-v16-1-5394e5f3417e@nxp.com>
References: <20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com>
In-Reply-To: <20250409-imx-se-if-v16-0-5394e5f3417e@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744198674; l=6679;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=8QvSWd4rmn+G1ZEKi8f+TGc8yN5T+yIQA/mdWdtzwO0=;
 b=ocnMsAuWfZSGl0NoV6kSSjtQOK8RYwSojwof51Phg9rsdBOKuvHoKiAmrLu3culDA+PxqD8sb
 xffg53UkkYICfIXxwaqs7ITo/YvyW0EMYCmKWC1LCqMlpEC2Yw8GNL2
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::11) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AM0PR04MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: fb47841c-f23c-4c1e-5e78-08dd772dcb49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V091ZVZOUDlYak9ZUHNEeFpuSTlwYkZHNWhrYk0wRTBERDZkanFnRTBreWNO?=
 =?utf-8?B?MEd5cTdBNDhIYnpCOUJXSktDbXBXVk55UU1NOTBtUU5WbkUwUkZUMjVkWGNH?=
 =?utf-8?B?SWpOQW9oOFRCeGR0VEF3ZHhUZDV1dWU0YjdTZWl4RGZxN0Q3NEVSRmcwUnNZ?=
 =?utf-8?B?K1VzVWVnS05aMHJ6NXhrYlBRYUJ6bElVRHRPRGdkVXJRRVprNzRvTDdUbXg5?=
 =?utf-8?B?c1ZsV1o2MXl0ZGdnSXFJeXc0WVpzV0VKVmkzRTZjWjg3RnlMd285VHNWaGdO?=
 =?utf-8?B?SHgrT1pGeUJxTEtKSE5BVVA3UEY5MFBUSHBrbzUwNVVPSnFodG1MZElKNzEy?=
 =?utf-8?B?WDBEM3V6OXZnUy9NelpsdEtDS0VEQS9BaVh2NzdOV2l3czFlc1FkeUlINFQz?=
 =?utf-8?B?VWNjdWpPdkg3TENvVmlxZ1hEUjhzY0hLazlMZTM0UW9nR0Z0MSt0YmFSNnhV?=
 =?utf-8?B?WkZJVHRRUE5qSmp0QkFZUnFoeWNuV2tQVXl2ekNNc2dWRkNkb21qaXRNUWRL?=
 =?utf-8?B?RktqZks5cVNTTzJlZDlPb3NxYU1uL09XTk1pdUM4ZFdyT3FFclBpd1loTTVa?=
 =?utf-8?B?eW1WcldiM2NiVTVBYjZvV3F0WmRjZUM5VTV1VnRtVnluRGszRFZoWjRaa2kx?=
 =?utf-8?B?NTYvdnV2VmZnL05kbk9haE83ZkZtNU5kd0Y5OWpLTWxYZElNRExid1pDT2FB?=
 =?utf-8?B?Qis0WnppaXJQczNhaFQxRWxaMHBmU1JwMGdFajQrR2NlVVZONUVGbUROeEEw?=
 =?utf-8?B?WDFyL2QwanF0S0RsU0JrM2hLUlFQVFRLR1dGbVlvaldpSXl0TnN6b0dTTGNv?=
 =?utf-8?B?SUVOUUl3Z0JOTC9oK25POEhzNDhkZjdkQU5hZ21SRWFEdWl1eC9kU0NuR2Yr?=
 =?utf-8?B?SW53UzRHWWFTb2NOUzNwcndXclltU1Z6TWNLWXU2dVFsOVRVV0I5aHVWd1Rm?=
 =?utf-8?B?Z3VzVzE5M3Rici9WQm1ZdHpQbklpaWJ1MldZcUk4TlN0bkZqa3lFb2tiVm5H?=
 =?utf-8?B?TnJLS0pyWlQ1SmF2dWZFQU8yMnZGcjJ2eU50OUNEa3dCcXBXdzllMW0xcHZr?=
 =?utf-8?B?TllKOGx4eFV6cloxd21pU2pFZHdMOGtzZS9rNncrRVg0RWhNQXUxeG5Kc014?=
 =?utf-8?B?YnZLYTBPYm5xS1FGUnFISW0ySjJSSXF0RHQzSDArMXpiNkkwOG1nelpUNy8w?=
 =?utf-8?B?NEN3ZU0rUFdPT2RnMW55aEhjZDMvdjEwZTB6NTdqYXBPVTU4cVlqR1pEaEN6?=
 =?utf-8?B?VDYwRk5oa2w1ZlR5ZGh2TVpaL1BkL2grRzJLT0k1U1BZUEx1WThwM3lRRUIy?=
 =?utf-8?B?dXlLSThlOUU1YXFTcWpONndTaWhmVjNPZXNRVnc5UlNONWEvSlNPbWd6cklv?=
 =?utf-8?B?Qk5nZTAycWhTZUZBcTFxQytCcTByQVVnU3JaQmVXK29KRklQTXczVHBPaG1Q?=
 =?utf-8?B?S0l5ZFFkNUdoakdXT1ErclprL0k5enBYQzBnT29ibmtEQzB6cE1vaWFEWmpE?=
 =?utf-8?B?THBUZ05iUXdIb3lCWHQ1TGFobG05eGtRUzl5M3Z6TzVJSG9KZWZSbkZadWJt?=
 =?utf-8?B?ZGM0bEJidXQ2eklLY3RDc0xEblJBb0NZd1FJUFQ1aEl4UlBaemtrMDRCRCtO?=
 =?utf-8?B?WXdmQmhjTUJWNm9pek5qcjhHcVNuOGlIalg0anY4c3hPL3hBeWw3bldJUVlS?=
 =?utf-8?B?RTU0VTQ0Uzlpc0N6UUR0UGtxTjQ4WU41S3Zmd1h2VFFJRXZOcXhydjZ4Njdy?=
 =?utf-8?B?Zk5OYXord1B2S3NscG5BRDFVVmgxS3RBVGhDbXRUV0YvNnhucVBnUHVKTWpx?=
 =?utf-8?B?cWtPZHVOSEl2amlZL1RCOTM0WVVjeHFxZDl1QjFVMldleEtBRW1NSEJHenZi?=
 =?utf-8?B?ZDVHS1lZMkhwRkdMZ1ovbkNCSDBDUFFjTkRkSzFNZ3VYRytiUEZBQ3AvZ3Bl?=
 =?utf-8?B?aHlZQzU0NExpcyt4dE13U2oreEU1L0dFdzV3THViSFhaZThMSzNxTjdqeVVT?=
 =?utf-8?B?T0RVSHEvQmJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGIxNmZrbzlhU2h2aTdZVmtQN050c2dqYjJycjA3UElFQUx2bUF3dkluTys2?=
 =?utf-8?B?VWpoUHBjUXF1cUtHaVlFZFdyZTBIZnc1WWNLK1IvUnZTRXZoT1BLRnQ3SCs4?=
 =?utf-8?B?aVJUYWJNYlNqNDBKQlpFQWZMcFRWekR3M2x3Tk1aSUkzYUxmOFBkY00xNlQ1?=
 =?utf-8?B?OWdEL2RTbFl6RXlPUG5BZUUzRUdyOFhzNFNWNzd6bFEvNlYzV3o1WXpZeEN0?=
 =?utf-8?B?SC9pa3ZCU01nOUwzV0R1SGVHNU81YVVjL2drVytVazZ4U0o1ZWVRZXZjdm5E?=
 =?utf-8?B?SVB4ekhQKzdXejczOG53OS9lNTltRXF2NllXVWkva3N3bmxCWENydGQ5blVH?=
 =?utf-8?B?RWpJSWhGUTQzODVlTTg2SXNmcnp2YTcvb21KTmZmUDhIdFhacy9KUk9TY2Z3?=
 =?utf-8?B?Ny81ZDhxWjBxVXBKUU9PemR1UC9GRGFpWjFaMXdXTXNscGs5ekgvZ25GZHI4?=
 =?utf-8?B?Vm9BN2pQOEF1Qk9EN2RCREVvSy9CdjRpWDlPU1Z4UG5SdGNkeit3QkJjTnlD?=
 =?utf-8?B?TXJiSDdkYS9PdC83THQwWWd5QVpFaFgxZENDTGZjaFJoWDlWQjdodTUvemIv?=
 =?utf-8?B?d3E1WktXUEUvL2NyQzNaNWtzVTVJdGR1ZDRvNkJINENKcVFEb3NLSktVeUhN?=
 =?utf-8?B?OTB2c0ZCaGxHekFISmptdU9KOHJ2eWJwYjFwS3NEc2NRYm9TdlJtKzlxbFM0?=
 =?utf-8?B?ZlV3eXdZNmZpNHY2S0FobVQ1cGF0TER5RHlkQVdNMm9Fc1BFNWc4bk5qY1JG?=
 =?utf-8?B?VFhhUTEwUVh5Mjk2WlVuRkp5bVNmY2tjOHEwTGQwQjFaRW5DQWJZbW85cGhW?=
 =?utf-8?B?ZkNTNVByQjZybHJCSkdmQzEvV01zSXVaanhtWnNOQ1p6OFhBa1RPaXJEWjIr?=
 =?utf-8?B?Yk16dFl3NTl4SEdQdWdQLzNMdExpTHYwWmQvbkRyYVMxMk5YVlpSeFphL2o4?=
 =?utf-8?B?WW1WSjgxVFpVNE1yQlBIc0dMeFVCdHNCakl6eVRMczJDY3pBT0dsWVo3QXk5?=
 =?utf-8?B?WmJxZHZsVE4xTk9aeXZkN1BhUmE4SHlIOHNteGRpSlM5NEtXdCtnMlVWOC92?=
 =?utf-8?B?emttbmQyamkwY1FHOXplQnU4UXpQTEdQVzVOSXRNdVdlYW5PcGF0Q2lsT2Iw?=
 =?utf-8?B?cXY3Zk1RSUpQZndWdGZ0QVU0Y2ZrTFJZckttTXNrUTU5Qy9NV3hBZnNIZFBC?=
 =?utf-8?B?WENrb2FFdWJadDFxYjQ0clVxUnd3NDM0V3VGV0xXVUw5NUVkQzFCTkpTMlZH?=
 =?utf-8?B?QjRCMCtWY3hPUU5ITllCa29Fb2FtWGdGTzBpVnhrSFc4djRWdnF1aDZyUW9U?=
 =?utf-8?B?WXltc1FlT3NUbjdlUjNaQ1dmcUo5M3pLRHd5Z0NvZTRSVEQ0TUJTUmtYYVZO?=
 =?utf-8?B?S0JXeDdtazJubmhDK0pOTW14TTBSM0wrUTd6dTRYWURWcS9zYmtiOG9DUUsr?=
 =?utf-8?B?TG1MVTAzSmlOMzM2ZmtnWitjUlFPeWhlK1NYTnFuUHdkWk1WRDNEU2RWT0J1?=
 =?utf-8?B?UXpCUWFoWTBJbjl3MkptMHdMbXRLeFFNVWwvcjJJb084bnFCQmF3dTgzMUI1?=
 =?utf-8?B?bm5md0FSUXBER2ZNSzhidTZvVU9oSWlleWJSK1VFUnc2ZTY0T2ptdU9xUHpn?=
 =?utf-8?B?R3JGcDRENWtXNE5PNTZ5cEdhWkk2LzNSNXhEMGx3Z0tmQk9kMXQvWWs3V3ps?=
 =?utf-8?B?VUd0UCtxWUE5b1NRbXZQVW9ld0k3NjZXYUw2MGh4WTRHVS9xcGZ2eVlNSXdE?=
 =?utf-8?B?cUprcXloeGsrbVJzdTA1Tzd2YXlyNFVhY05tT1M5L0Q0MndMQ3BlTVM5cDdz?=
 =?utf-8?B?cElWS3NXR3EvSHhjeFNzalcvcHdsMjl2Ny9IMmp6RWd2SXQ2eCtkVHA0UHAy?=
 =?utf-8?B?WlNOUTlEOFhhRSszQ3JyNDh4YlNJR2NaT2MxZUVSVVQ4d0k2SU5UeitqTUlp?=
 =?utf-8?B?TnFYRmsreW1maUprOHl3aGRBTnVDRWFWYVdpa0hhaHVoZUVBL2MvK3dLbDlF?=
 =?utf-8?B?NnROTktOMmloWlN5R3ZHTzlFZjZpdU1yVktmUGxyRjgvVEpDS0l5ZnBIUGJD?=
 =?utf-8?B?Um80VHpvQXVsWmNpTFNUbk5uVlpoOTQ5akdYRTJXVVpqVnJ2L1dqWkpDYnhw?=
 =?utf-8?Q?v0Hm5PDJ2CjmyN6pbHpZHAHTo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb47841c-f23c-4c1e-5e78-08dd772dcb49
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 06:14:32.5969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtxshCAbCxsG42V/F0+UHBbqugryVlVNczjfdVi4VywFcUbC/Sf+640ZEV7rP9J7Ck62Ti+Eaqraj4Q9+aGl7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6882

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..a3a95b54a174 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,124 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like
+ - Hardware Security Module (HSM)
+ - Security Hardware Extension (SHE)
+ - Vehicular to Anything (V2X)
+
+Each of the above feature is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs.
+Communication of the MU is realized using the Linux mailbox driver.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprise of twp layers:
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+  - Serializing the messages to be sent over an MU.
+
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                  +---------+      +-------------+       |
+                  | se_fw.c +<---->+imx-mailbox.c|       |
+                  |         |      |  mailbox.c  +<-->+------+    +------+
+                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+ kernel space   +------+      +------+     +------+      |
+                                                         |
+ +------------------------------------------------------ |
+                    |             |           |          |
+ userspace     /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management, over Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_fw.c
+   :export:

-- 
2.43.0

