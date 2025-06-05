Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022132.outbound.protection.outlook.com [40.107.75.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75ED1C84D9;
	Thu,  5 Jun 2025 07:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.132
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107391; cv=fail; b=BCLr3cn507IWFJQtfCvaAXV7y9ga4OcZ2YyWuUOky44CzZVxtlt3Jb/ZrRorymT7Gs1HEIe28AfQGQNQ75jvrjklNbBLGAs70TiJweUP5AaHQK6MWeuedmyhNqBjV62cKa7ymh/lNewpB1BY3uKkENL6mv+h8kbUpwLBc03frQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107391; c=relaxed/simple;
	bh=L2U3AfkB0581D3UlLzytSlib+hv7BAyQuhGAtlFyIeI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WmWjrx2+vL55aUNn+MjB/9YNYre+HeR9B030kAzVfG1esdFwwm1PtWgD7cxqY4lR+XCp3iHX694Jm9ujJOPmKv4sCr1DBOAf/8Dr/X6HRo5MfdsvGHd+Gj2Mj0usNoPnnT8Lk+Xo6Roq747eqMXnCSEp3PGfTIbg8PG3CqUW8Ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=technexion.com; spf=pass smtp.mailfrom=technexion.com; dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b=IG0aSeEx; arc=fail smtp.client-ip=40.107.75.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=technexion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=technexion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=technexion.onmicrosoft.com header.i=@technexion.onmicrosoft.com header.b="IG0aSeEx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riNQRQqECixGWSY3+UwU739E0wTtZJAICrnQzMYrHCcWsJtVaX/89xV2W3ivMPIHkgvaU6BzKXAMfrGrd/+c2mlNj0ibjrNR5K3aFqP0DL+jnYAuOsCw3o3QvpDNE3DiS7y9Ip0IF40dQ/p1KrJxbZGBy30jOFWUeimuJ3aoKuZ0WtXSTlgbKm/ZuuP3N39ze2Iysj3J3+B+XqC8D3jG8a4Gh0TBb8x+0dBbU12TOqpEIhhTNL9itkKCn194QNf5t2m8x6KpPF3IiseonSdANsI/d1q1OZlFPru8BCdIIqrfiJFB2FEkXEIcFMrgV6qVUjvR3Kwq1LtXtFYIh0pecQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEz6T0rwGuFy0+gzW4ROaLMGZedszCt4+kjvdR0KDaQ=;
 b=Pk8QTAmhiWFppQcSUyDnDE5O2b6WULJLMxgETSYweCTmiKWAjyL2/GHmHhe6lqYjsypPg/WFtG9mD1nrGVoW8ZKRiwV1wA0lzNy1wq9m3VFCPUul6uO2e5O6GiiGA+GxMUexmkfQQrT2F9YpwiUUbGRJS9bKEGETL5/GJmTq0iijJDZRWY8INLEg3ploePFUHTklV8/DJOHTsuVnVAslyBDKetHJmUuGVt8E5jeRnJvQ0C6EEzq+ldGIKrSSKwMdF4ZS1iJrJpCypTR9K42m+TZrQSOO1FzKZpQrASa6yVtHF9rSDoI8PTS598En4OzKxWZ7qF07Ujz0A9ayLNC8kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=technexion.com; dmarc=pass action=none
 header.from=technexion.com; dkim=pass header.d=technexion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=technexion.onmicrosoft.com; s=selector2-technexion-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEz6T0rwGuFy0+gzW4ROaLMGZedszCt4+kjvdR0KDaQ=;
 b=IG0aSeExmFMj4k0xlyuR7A1Gc3KnexW5rpFM7FOWyUCcZReQ9EpXsCqYR/NKZXqV1vL1234XZ7JtUvloqbXagD0VAOLtvY3GFfYaE6IvcE8CYQmg0QlRFYI2Oy8q9hcek/VQmFYr4FXHqaxQ6gKrbQy4QUNkyPss34+mgsXwIkE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=technexion.com;
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com (2603:1096:820:ed::7)
 by TYZPR03MB8034.apcprd03.prod.outlook.com (2603:1096:400:463::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 07:09:46 +0000
Received: from KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::980e:3c71:3a5b:6404]) by KL1PR03MB7454.apcprd03.prod.outlook.com
 ([fe80::980e:3c71:3a5b:6404%4]) with mapi id 15.20.8769.031; Thu, 5 Jun 2025
 07:09:46 +0000
From: Richard Hu <richard.hu@technexion.com>
Date: Thu, 05 Jun 2025 15:09:41 +0800
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: Add EDM-G-IMX8M-PLUS SOM and
 WB-EDM-G carrier board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-1-db5a7bbe3c84@technexion.com>
References: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-0-db5a7bbe3c84@technexion.com>
In-Reply-To: <20250605-add-technexion-edm-g-imx8m-plus-som-v2-0-db5a7bbe3c84@technexion.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Richard Hu <richard.hu@technexion.com>, 
 Ray Chang <ray.chang@technexion.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749107384; l=1183;
 i=richard.hu@technexion.com; s=20250604; h=from:subject:message-id;
 bh=5FpoZ2s84dZoSUmvYTuRL2xXk/Ef0wNpduDEiDDYLGY=;
 b=tmJMp8CBSDxHybtmnKtItA5unt42RxsjWYqQqSt4UFUFf4vErCuOzADnK2Nuaj+8fo77n6Nvy
 kmxvNFtefJ0DBFVkAwMTzKU5AMEtlzt8zMOkTFMqPD2POIrm/k+LUEq
X-Developer-Key: i=richard.hu@technexion.com; a=ed25519;
 pk=MKoW0/U0r4MjJdRNaq37Tb25KE1fzJUdMN0pa8XBJSA=
X-ClientProxiedBy: TPYP295CA0017.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:a::9)
 To KL1PR03MB7454.apcprd03.prod.outlook.com (2603:1096:820:ed::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7454:EE_|TYZPR03MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: d62fd411-3679-4f8d-cc42-08dda3fff41e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFhrb2crNllXZDVycU1QM2F2L000SFloVEwzbTc3V2EvN3dzODk0cjVud2c5?=
 =?utf-8?B?RW1HK05uNlZHNnlnd2lvaXgrWS90S3ZUbHh0dEorNlVKTEFLMTFrSUZDOTEz?=
 =?utf-8?B?cTZNdlVrSXQvZkt0QWtMcHFEazJxMUkyQzlReXRhSG12b0pXb01DVDVYZnVL?=
 =?utf-8?B?WnAwZFBOZFV0V3BBcWx0MzByVTdEazl4dzdPYkJmM3FhTjBiQkI1bGtDaTNi?=
 =?utf-8?B?RmJ0WG83clFSaGtzNnRBVi96aWNLbWt3ZzFram5xUS9Ka1pZQjZhSkNuck56?=
 =?utf-8?B?TmQrQWQ3Q1RLeCtXdDVuaHR0aFdDbk1HTUM5SW1sZHFpS29QRTZ6RU5ZNnVD?=
 =?utf-8?B?anFyeTdENTAzaHhadnVsTFZyVzhJYnk5L0xvQUJXY2U0UHFRb2NRLzhzeXVR?=
 =?utf-8?B?UHR6VWNneWpwOWR1R0FhQ0dzaEJJYi9mVG1BTTFva1UyWFZuallZZThhNUlF?=
 =?utf-8?B?S28yOVRpQ3FzMlNJVitiQStIanp1TGFSKzFzNithRmQ5S2h6MVBML2UvcG1o?=
 =?utf-8?B?T1Y5b2FTc0UveVVTRXpHNXQ3YmtFaTBrdzRubXpLbitDSGNLWW1iU3h2R2Y4?=
 =?utf-8?B?eS9wbWw1dE5oMmx1cm1OckFsVmhqbEZlYTdaSGhkN3lWTjZ5cHVaSEFRelEr?=
 =?utf-8?B?ZjMwNHIrZHp3eGVQS3ZWeW1UbjRsUlJHZC9zMmsyOHhVNUozMVVXZm1mbmlr?=
 =?utf-8?B?RkQ0emFUZXQvQjV6bDczbG5MY29WWWp0cFFJbXVQdnEzSjNsMUwwcTRXSE84?=
 =?utf-8?B?YVNhNjl2N0NUbHJ1a0hVRERKZkcyaHlBb2VWa0x6ejc4SDZiVk0xNzBRR1lQ?=
 =?utf-8?B?MmlLWUt2OTJ2T2hLYTJJQzJJczQ3enIwZTNvTXpQNytsM3loOXBTQmtNR2JC?=
 =?utf-8?B?Ny84cWZla1p1TFRZd3dRNUVQb09iUDlzRGprbTdkaURaWTZMSnZ4bzFOekMz?=
 =?utf-8?B?VGErdCtHNlFzaWlVaDVYY3UyZXJ6WkkrVkNld2pTTFEyOXE3NVhmWkhBaXRW?=
 =?utf-8?B?ZnV4Z2hRWk03ejRRK1V0QmN1aDBnU3VZdFlFOWxJK0JlKzNWcHR4TWlkNThW?=
 =?utf-8?B?M1NhZGIrRnBzTnhVYnBzWTJmVFFER1oxYTY5TVdlMHBRc21qZ1VRK0crdkVh?=
 =?utf-8?B?QUpDUmJzejRsazNUQzdua0pKVEhhZ3VhQytmMjRQbUd4WW5Kb0VJODl6R2I5?=
 =?utf-8?B?YytmaVBQS2NTQzBZejhRV1lVR05pOUs5K3pUS3lSeU9jYUE2Y2lPU3dsaFJN?=
 =?utf-8?B?Zm9qOEUrbTROYWdjeVZ1SWFHYit3cWdTZzZsanYycW4xUDZNNU9XemhPcGlH?=
 =?utf-8?B?UTl0VnlpSW5FcURZOWd3N09vS2hLT0ROOVcyakR5dWZwTjZXcU5xc1VLY1Rq?=
 =?utf-8?B?MEYzNmhuQmFuUTBQTUQ2Q3FLdUZ2UzJta0hRNjZYcWdVMGVUQlRLdEc4UVgy?=
 =?utf-8?B?MWxzZTBMTmppOWJZcm4wWG1VaTQ3UmRmM0VCSzUySWFYamxKQ0F6TnhZMkN2?=
 =?utf-8?B?YWsvczRZVStVQjFVcFhoUjFuMTZidE04T2VRb1ZPVkFRSlRPK3Juc3BTVFRQ?=
 =?utf-8?B?emQwRStoUDNlb25SMWlwcVZrTTBTMldBS1kvb1F4MVZZV3M4N3lLdHBIdWZ3?=
 =?utf-8?B?L2VpSXlBVzJyNWZNS3pEQW9QUnhFUTBiUGZCSk4zM05rRkFHWWMrUk9ONWlO?=
 =?utf-8?B?WEVHVnBleXVKUkd5cDkrbEhvNG5mMlg2R2RsYVY2UThDejNHZVpLV0NkMThJ?=
 =?utf-8?B?V0NFd2FZMjRlUzFpcE9YVmZPMjhpWW5pdnJQU1cvNWQzUisyVnpBbDBUMnRn?=
 =?utf-8?B?Vk0xNWpwNDZCM3MzOXQ0Nm9ONk9Kall6b2hSOUsxZDcwNWRlQitmT0pHbGs2?=
 =?utf-8?B?ZUs4RXpTbk5aTFJmRk9XWWJzSi84ZHRZVzVQYTBrcG53R2cxY0FoVnd2TGRJ?=
 =?utf-8?B?ZkZYNHpEL0orZFVITWs3UmlReFdjd3l6ZDVjbGZqZDB3czE0ZlBFUGtEd2ZG?=
 =?utf-8?B?YWs5bkphaEJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7454.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnpRaVZPYTE0aHBkMFhqWkluN0srQUtCSWZ4ajc5a2c3T3NiWkFNcFlPTTBt?=
 =?utf-8?B?OHFKRmo4RHpCbzlxVlFNRjBiTk4yc2svQ25aOXZWLzhuZWpldm51bkx0VzlX?=
 =?utf-8?B?VmFkeURYWDV5cFRUWEpRTWRFN2c1TTRscXBZMG40Nkx1WWRFdXI0QlFNZllt?=
 =?utf-8?B?bFEyZitCcXVuRisyUy96K24zSTIyVXl4L3dLNUNuVjluVEJZRUN3ZlR1VEhC?=
 =?utf-8?B?bFY2NlJvM0QyTHZPRHlLS2FicXdOL0hvQm5FMW5pOTFSQmVaamMvVFNnbHVX?=
 =?utf-8?B?WDdVMkZzZ1dWRDk2d3dpaENxR2FERSt0QklFY2VUVGN4QTFERHlmaktzck10?=
 =?utf-8?B?WXI4b0xQTWgyYWk1djVNeExrWWI1OGtDc2F0VVluNkVMZEF0WThTV2daMFRz?=
 =?utf-8?B?SGwyVE9SNFB1cVh5Sld6VVpjdHI1WUdybE5rRzlMSWwwUXZZWVJuYk5kdHl6?=
 =?utf-8?B?bFBGUHNQUjZXRWtpVUptNERpMHdnejRNaU9tVGp5YTIwb0VWVjdDNnQ4Smhj?=
 =?utf-8?B?Nk1yM0xueDhQQXNDT3VkTHNZNDFma20rYjdFeGJwTEE4TEl1Y1dwNG9NUnV4?=
 =?utf-8?B?RFpqakRrMk1aNG1tMnNNb0RuMU0wWWV6a240WDVEdW1pOUQvM3Rhc0I3VENk?=
 =?utf-8?B?SmRiay9uOHdPdGJJUVluMDFHRUVYcHJhb3hsTHAzdUVjMUZZTWFoN3ZwMjRt?=
 =?utf-8?B?ai9rY3VHenVtV2lhN3VoT3M4a0dib0daclJMZlpMV1BNUVpmZzZlVWExTUtS?=
 =?utf-8?B?QWJOcGd0aW5haWEvb3liWXJqVGJ0bmtteUFLcmdGT3pwdFhVajUwSW9yeFBN?=
 =?utf-8?B?amVJUXM1V3FLL2YyQlV6Q2h2aVdvYU9iK0gxQmdoc01sMXdSakVKcEQ0Szdi?=
 =?utf-8?B?UnlyOW5UZGlGR1BINEI1MjdkUUpsd1dQTERwVk13UzZaTVJkWnNwRnVEOC9S?=
 =?utf-8?B?RnF2YkR5U3dNR3FLbnE2azl4T25PWHRma2ZiYVBiZGtNSExPZ1djcFJGSjhp?=
 =?utf-8?B?aUtFTWtWemFaN2J4emdGeTgzOXh0aVMzOGVWaTJZSW9RRDJSZ25NZGxLcEh2?=
 =?utf-8?B?bE1SNWJZbzV6dnY0UkhvWlhtZ0g4US8vTFB6NjJIYmJzTHhCc090dkNtbjQ3?=
 =?utf-8?B?aDdoaGlDQUMvNUZqZnpSK2Y5N3ZSdWNzcmY3eExybGxSTkk4L0tjSnlhcUcw?=
 =?utf-8?B?WWEzZnV0REZ4b1l3cFdURlJBaXh2QXVPYTBvbDJUTm5vZmRqckVXWEVIaita?=
 =?utf-8?B?L2Y3bHpPYUJuZjBzOUk1OExLazg1S1llYVc3OUVhaGFnZVFJUEZ3dUk0VDAw?=
 =?utf-8?B?WXNQKy9PZUlwK2pnb3VRU1FjQ3VLaTFoTGdOYTFjRWdWWXlpL0FOblhURXNV?=
 =?utf-8?B?VTRXcm9NMEI1Z0tJWWgvWEVQOTV2bnhEVjRQdzZrL0w2UnVXSnZwOTRKOC9u?=
 =?utf-8?B?NnVhZ2pLMTBSZGl5YmplcElFZWt4SU95Z3cvL21odTduSVRkaFJSN1F6cFo3?=
 =?utf-8?B?aVNSSjIxVXRWcnRJMUd5WTZzUVNlR0ZmaWdKbHdMRVh3U1ZoV0lzWGFIdGdY?=
 =?utf-8?B?MEJpay94eWQyYjNobFVXd3d3ajdLdWJtc3NFdUF6dVZrU2VsT1FsMVZTUmRX?=
 =?utf-8?B?UW5kcU9ueDhIMVV2eDRGYXM5aWFFT2ZzVnJzRnIxeTV1UE41TWtFTTZybHZP?=
 =?utf-8?B?d0VSaEY0V0hWTHRQZm1mYkVJUEsrQlRSVElycUhQaWl6QUZvQi9FTzhsZDFh?=
 =?utf-8?B?aWpHOGJITnczYkptTEV3U09nZTJjN3VLd1U5UDNkZHE1WXpVMHlpK0RmOXI4?=
 =?utf-8?B?YzdGVCs4bGVuRmhGeERXQ2xERTJnV2NkQVlDNVZiUmQxRi9xYUh3SkV6WDYr?=
 =?utf-8?B?NXJKWVluRkNuMnBQemMwS0xISHE5bmJINnE5MFozckx1czY5YUFXSW12WlBH?=
 =?utf-8?B?S3lSaFJ4ZWI0YXdheGdLQzVLc056YmpkL1ZTYmc1cHE3Y0x5S2NTcnhoeTZH?=
 =?utf-8?B?Z0pkTjFmRVlrY0c1U2ZCeGV2RkhNY2s5VFFiQllnd1Q0clJsb2tLb1pHdC9I?=
 =?utf-8?B?L0trQVBEVFRvYVNqdzdGUk1MclIvZ1Z5empOODQvbENxUjBrQ1Vydm9hbUdW?=
 =?utf-8?B?VlJHU21IK210N2cvZXJ2MTRYditJejBpcVpFclZoVEEzVWhld3AyOTlhdys0?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: technexion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d62fd411-3679-4f8d-cc42-08dda3fff41e
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7454.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 07:09:46.6321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5ee19679-b9a6-4497-8ed2-1eda849e753b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBqMxodhk8/8ZgeQeS0Lv02b8U9tEQH1/4TnPBNEJVbLoMlA0KYxaotcUKmvvRbEWYKZolctGmieFUhynw3b3ZTsF6cknMBH5u8fUXZQsX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8034

From: Ray Chang <ray.chang@technexion.com>

Add support for TechNexion EDM-G-IMX8M-PLUS SOM and WB-EDM-G carrier board.

Signed-off-by: Ray Chang <ray.chang@technexion.com>
Signed-off-by: Richard Hu <richard.hu@technexion.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a2..ca0bc46a6f8b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1176,6 +1176,13 @@ properties:
           - const: polyhex,imx8mp-debix-som-a       # Polyhex Debix SOM A
           - const: fsl,imx8mp
 
+      - description: TechNexion EDM-G-IMX8M-PLUS SoM based boards
+        items:
+          - enum:
+              - technexion,edm-g-imx8mp-wb          # TechNexion EDM-G-IMX8MP SOM on WB-EDM-G
+          - const: technexion,edm-g-imx8mp          # TechNexion EDM-G-IMX8MP SOM
+          - const: fsl,imx8mp
+
       - description: Toradex Boards with Verdin iMX8M Plus Modules
         items:
           - enum:

-- 
2.43.0

