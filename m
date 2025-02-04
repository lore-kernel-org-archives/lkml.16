Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D75420F082;
	Tue,  4 Feb 2025 12:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738672936; cv=fail; b=bgVt0lxI0qP0EkAlFEuNYgL+ADOpqqQKFNxd8poeNIWr2cQUJo00uIVNWxlYlMdKfFiiEeeGYW5v9nXdHVlYoAy5fx4mHw2cIpaq6Hd5omOcxM9LGGcqbxK8HP1JtAhnFm66gKWbu8eNbzCcleqKQBtXRBiuv+DkVDM2NZTQSRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738672936; c=relaxed/simple;
	bh=sjfrwJo3cirnw0w3T7cHbGyxh5PCEPcyb9YHHF2hyWo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=a49SJNmhJjVSOzidVIavmCCJx6zl2+xx2qBCiC+HX/9Hoe73lAw54WY5Ryrjn+IlLXzXmjiSE16TdGfUeNLAwY/meZlxu4vawAqtI11OFxtm9lrvaiNHhbM+6FQ9qX6lj1+UjahDivfE/SE+zO663eIGKIADTkbY+ICR7dhHrXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qFp256RH; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qFp256RH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ewQXMl6TRQRkVhXiqDYETSgzZS0Nbceb4djbuw5bUhQGJ7sjr7s+Zvr1/TGd7Gsy3hKHAojZjytHiz4wZVsfBo+HGDXHuSNWv+UukgMBlsCcNKX6QeiRyfaLu9guOlve9/b/NRcj+cnxpHwm1fNzwNdgvp12P215gfoepd+C/3GebIq8uB0u9nuECs1wbiBxUGEURqCF3xCeroev52AZyVQbd6O3UYmTHabAch9Znp/rIE1w9pgUinvKSI5/YyeAwJy9sOovaMWRooEOGNkWLD1VWdpu0GwCwQXl2w0+iBAAiqhye+QLFTLis+Y2/BUa5GqxTOZetqPxHrJQ+PokxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqDWQKTZyqxTxaDKQ1olaPCS0AfrUcUd5yOLvVszXDw=;
 b=mN69kOrtivUvhqEXs74Bv/6op8kYhQc7Ox9Uc6uw/h1NAsvgiMXdYgj/BJhe3tVq8kiZ2566el/BhEz+fHKAHP0uPGQyIGcChFqf33Bq0ZKZMLXXtX0o2rwcv9lRhwFFqsOaKTyjdJg+EwrmNt5o9SKTzBqvu4a+gGdhc3der9jVJ8kKL7cQNgv23E6pYoO+WYvpqO175lIpr2Se0Fp4wn+b+A4fwmaC+zPa/HyjydRgFhRLLWhhQKcxJpRYJxrcuMEEm/ZSG1to9HDbWnl62Pc7QfTlO36n5hfQuGEF0KYFfVrVCwwA2By5fdnfAJy/xPswFYHXRhsYJYMszszOzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqDWQKTZyqxTxaDKQ1olaPCS0AfrUcUd5yOLvVszXDw=;
 b=qFp256RHBol1K83KMUX3x2VmHbX+BYpSwf3unD4tU2venh1SVvjUEw5vA5OcmTJBfahWsFAMBBaKlyrkOXLediFBWxaYPRXCy2/imtX4gxmgwlY7KQ5tPDQqntzt1BSR1sK06ZXa3BF+zDXW+n6zQvGSuv+oMk6kOdK0+PiAxyAQbtpn3l8+C9F0NbaD/9Cmw6k1Q2r96uHPOZ8BM3gmS2orrzcaXKAO0wHpW4SiSDFHnCzbfT1X6UBlsbDMSTtc7Duyxebti2Du6yd4v/LM//kKIlLhXmc7fd3ACNgw53fQ3QzzxSQTz1uMYJPjIw4jdQCj3DVu6PnpWZ1qYlIW6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10889.eurprd04.prod.outlook.com (2603:10a6:102:491::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 12:42:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 12:42:10 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 04 Feb 2025 20:41:13 +0800
Subject: [PATCH v8 1/2] dt-bindings: nvmem: imx-ocotp: Introduce
 #access-controller-cells
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-imx-ocotp-v8-1-01be4a4bb045@nxp.com>
References: <20250204-imx-ocotp-v8-0-01be4a4bb045@nxp.com>
In-Reply-To: <20250204-imx-ocotp-v8-0-01be4a4bb045@nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738672884; l=4072;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=XnzgujPvzhDsZMamCFtENs9apB02aFgSkBfdNqk+fEY=;
 b=jfAPUOvurKkXAM7XzcOmAwf6tkx4jvx1yZqp1Q1Hw0bL600A2ZWu+zlmLaiKF1wjL8LRRzKij
 9RLul2YV03dB4kuYPKv50EBZYtQz1QzYwtYo0k/xDdkg8mJ5qMLsprf
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10889:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b7f189f-0f6b-44f7-3b19-08dd451957d5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0d4ODUvbFI1V1doME8wM2lHMzE4VEdKa2NjWlVmNFduSGc0VlE5ZkJmWTQ5?=
 =?utf-8?B?WW9Zc2cxaDFqc1owK1VRUFQ0V3dPbGRMT3JKU1dHSWpTZ2IvdWlqSGl0dmVi?=
 =?utf-8?B?eUwzTWZmVkN3aU43ZXIvbkNTUEQ1NmZWNnlWWDFRZjU2QnBwdWxyb2RHWG1K?=
 =?utf-8?B?dFZMOXppcUQ3ZnVYNXVkZjhsSmh2QjFNUTY3b1FpYjlIUDBMWkVlRzVNR1RU?=
 =?utf-8?B?WTVRN3pXb00xZlBTZVowTnVERkdUN0VWVk9JdHFBRCtzVi9YRDE4SmFPYllE?=
 =?utf-8?B?MURBeFVpeTZMNDhHVi9FZW5DRkJCeHRBRkJyNURPS0k0VFN3bU13NWZ6Wi9R?=
 =?utf-8?B?TEd1YzdwaGlpU2xYOHpjKzBDZEJodVlXeWIvY1VIRlhyOEtRUWZQR2IwYlg4?=
 =?utf-8?B?VWFXR0ZmcVc5UDJMWUNLTjNIQWc4WlB4MDZmc2xvRGE0SXUwRkpFUzN2bDl1?=
 =?utf-8?B?K0VhUyt3ZTE3a2FCdHpjM2U2R2NlMFh5MTJBRGtNRm9HWnd6VG8xVzBUc21C?=
 =?utf-8?B?NStVQWhuUFRvTDZVUm96am5CR2VkRERGMGxHU1lZZVJZN3pjdEt6OXNlNGJN?=
 =?utf-8?B?Z25NU3dpRTNwdmVhdk9EbldOelg5bFJJOXo0U1BWbkdTVEJwbnJYSzd6cEh3?=
 =?utf-8?B?YXdDWk1TK0swVmZqMU4vUjNhZ2NaTG51Qm1BSWNlZnVqcHR3VTZ2NlpNNDhG?=
 =?utf-8?B?NDY4aXk3R2YyVUNyQUozSDQ2UmRBWnRhYjFYT3NxMEs1RnlCWGZrb0tSZHJm?=
 =?utf-8?B?M0ZDSldab2Q0QWtzQmpvK2NuSzVONWFySWV1Tlk5ajd0SnRLK20wRS9icm14?=
 =?utf-8?B?TkpNaWdYV0ZDYnNmczlBblJwQlAyaldIcWE4bVdMcHJEMFBtQzRYMHNFZUk1?=
 =?utf-8?B?OFh6aWF6cTBrb1dJTmpTcTRNSk1hTVhCeTc0RzArTFNSWktybW1xVGhKWW1R?=
 =?utf-8?B?NnZPRzI5Y3R5WnpuSnJ2ZitVcXJLYk9LUVM0SmY3dUhvanpqTVEzQXQrem80?=
 =?utf-8?B?SDZXWU01UE82UU5kakM2SDJGZEV4WUpqaTJxU3M0MFhKYUs3eFBlK0pvNTda?=
 =?utf-8?B?WndFS29UL1YzYVY0eWxLak11Q2F3VGE4Q3ZLVUp2dC82N0hpY0tjWmxFdlB2?=
 =?utf-8?B?OWZNU0RoaXBYOU96U2pQbkdCUk1ub1AwWmxRNnRsSEVaSU81TEx4OS9BYVd6?=
 =?utf-8?B?dUVqWmpZUm5NMkwrYUN2cUdnRVA5b0NsbnBzSmp0cTJqNW44WWRZYTJCOWdi?=
 =?utf-8?B?ODhLSDFYOEljQjZ5N2FWdXIxajFXc1hCbWp2R3ZIM1RyM2JJdm5IeGQxYjR5?=
 =?utf-8?B?RFVPZmxhcStyZkw4RjlOcHppSmltRkRINU9EcGQxTGcrYU4veVRpSWFjbG1B?=
 =?utf-8?B?VFRFZUx6V2NsNHVQL3k0dmhQS2ZVOXRDL0FxUnhzNUxTL3hJcDBCZ1dNbmQ2?=
 =?utf-8?B?ekR4SlQwYWxXNnlVeTNtSEtsRVhmY2sxNXppRGl0MStabzRoU2NyQ2R0alFv?=
 =?utf-8?B?L21mdThYd09BdEFFWHhzVDZweGtSa1Frd1c4YjFvOC9TOWZ2bWxqQnE1QTdR?=
 =?utf-8?B?REJ0Z3Bjb1daMnpFbjhHSFYySWg3QVF2dUNZM0ZLdEVpdCtsTG85Vm03UTBq?=
 =?utf-8?B?NTVwSlllWC9oTnYvRFlBbnpUUXMwNDFwc1B3SVFER3hZcDgwWS9XYlVRVi9V?=
 =?utf-8?B?bkFUd1JMNW1ZaXVJbTVwRlhacEJKVWViS0hIRW8yekFEa3hMSHhtcGUwMllM?=
 =?utf-8?B?QTZudHIrUDFVQWxyRHBSMGpLclRmbk90UGxQZUxLcXZweVhVUS9VeDRPM1Fk?=
 =?utf-8?B?bXQyajRTb0c4YmZiVWZxQzF0RDhGNWpZeTZxNE5CNW9QVDNqRXZYRjJPdkxF?=
 =?utf-8?B?YTQzTUhYWGZxZjlSaUwrZ0lGWFJuS3FZbjJXZXVTL20rLzI2b1RvK2ZoSlZ1?=
 =?utf-8?Q?tgxphX0l/zTgg/6vPVrwcz/EsL02YmGe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnJ6U1dxVll4UnJBYVE5bDM0Y29kZ1cwUndMN25nZ3NRYmhINGpFaiswNjhj?=
 =?utf-8?B?SFhmd0V1VkFnQzRlRklxY3FUTEZKeU14cGJUMEhxR3dycTNnemh4SDRzRFFh?=
 =?utf-8?B?VHF5Z3lGSk1mN1kwSXNxNENBbFp6T0tYNHRMZVZBVStyRDcyUkJYZXBzaDdX?=
 =?utf-8?B?QkYvTVFYZUtScnU2eXJHUEROZW5EYnNGVFBSNVc1MUtWY01oRDJSZHQ4SHh1?=
 =?utf-8?B?N29Kcm1ZU3ErcVowM1J4ak9KQ0F6SmczVDZiVEJtQ0cyVmlYV1orZy9mUzNE?=
 =?utf-8?B?TkgrUEc2Y3lEVGY4OVBURGpBcFJlZDVPeUlhQVp6TlFGYWhBbU9hS2pzb3lZ?=
 =?utf-8?B?bmZWRXBLQzArQlo1ZDZPZnlidjhETTFqaDlJaUdYMG5wL2x4MUJYTkFrbXYy?=
 =?utf-8?B?aHBiMExqOUFLWk5iQUpqUzJOQksyM3lEa3lQQVhhajJMZTIzTXRvbm9BYkR3?=
 =?utf-8?B?WHJOZkxkaTJMTEJ4dU5TQ2FBUVcrd1FJM3ByZlVVWkZMSkZyc3QxU3BUbmph?=
 =?utf-8?B?YUFzOWNHUytuY0piOUxQTGpORnVsNHR5d09abDV6LzlybWErcDZHSGxvbWcv?=
 =?utf-8?B?eVJpYVlnWi9SM3NrMHV0SjdaVS9GWDlOY25STGFFQThrSExoMjRIaGJGQjVh?=
 =?utf-8?B?cFN5ZUZMYnJ0aGlNa3RHVzcvaHd2akhYblNub3kyeVNYZGtod200UUJ4eitN?=
 =?utf-8?B?c2FIMUxDdXRLelp3dFNCczFpbzU3L0M3Z0NOcFhGU0NKT29ERjNjaERaS2RU?=
 =?utf-8?B?bDNvTjR2T2dMdEtzZG5GRFV0NmxjMUZ0MzBsaFd3NzhTSUUzZEZ2UXJSaDJO?=
 =?utf-8?B?VHNNNFFMNnVxc3F4ZElXMFp3K3poaSt6clIyNVM1Z0ZWQjlnd2tuYVJPTjEz?=
 =?utf-8?B?b0JlS1kxbHlsQjdaTXlnVkphdDdrcDFpOUs0b2FjZWRtc0pxTE4rZzdDaDNG?=
 =?utf-8?B?cUE1K0pjSFp1V1lIaHJaS2tBYVl5MlpoVXNPcVJhUVUvV2VSMXE0eDNrQzQy?=
 =?utf-8?B?cVRkSnMyVlZSQW4wMERRL1k2RG1CVER2bktWKzN6ZjNoZVd0WVFWRXhUcFFk?=
 =?utf-8?B?MDNjdzhyNnNIRnZWOG1zYytnaXJoVUk5aWxxS0gxSVFKdXN6aGkwMk1raWJT?=
 =?utf-8?B?V3hFaVVZa3VKMm90Rk5wZitGcmdwNzFucjFoU0tNZ1RiYTdMcTN2cWNxMGNV?=
 =?utf-8?B?T05iK3JnSTQwRmNtWFF2MGh5SitPR1ZlWGpYZTI1bUxFZzA0c0tXZm1QKzRv?=
 =?utf-8?B?OUZYN1hHL0hkaU1RNWNWZjBvQ1NLSmFuSkJCMjNHZndldUVkU3Z2UU9TUy9X?=
 =?utf-8?B?NGNud0hONUc5NHdnOUo4WDgyOE42T0QwZ2hhR09XWXlnbzV0SFh0azVrbUFR?=
 =?utf-8?B?WDlwN3VNYmx1NEFNZGMxemMrRlVPOVg3clFjSjhlRFN2czVvQXEyRzZRMWQ3?=
 =?utf-8?B?cmY4c216cStyT1Y5R3c3MituOUxka1NMR2tuWDRPR2NXaU9lWXJCRXlaRTNJ?=
 =?utf-8?B?dG80TFBzSEY0M0JiQ3g1bkVaY0ZFd2l0VWtva0M2TldmaHEzek1QRGZGU2p4?=
 =?utf-8?B?aDVDbXNZRVFBSExjUmxyYlJIaVJYbmRNSzlOeEw5QzJpZ3lTdWlmL3FyU3VG?=
 =?utf-8?B?aHMxVkJJQWxWTGRESyt1T29nN1VUS1NEdmVGYWZHOUsxdlNhWi9KaTdVRGh0?=
 =?utf-8?B?Z2ExNFlrM0h3N3laa2ZnYy9aUmxmTnhyWWtOeWYrNVlJVVc0bVlUMG5UTEpj?=
 =?utf-8?B?a3pjblN6YmJORkRYcGFLTVJnYzNxR0tOZFJFaGJJK0R6MXlQSnV3aE9Eemo5?=
 =?utf-8?B?bHd4ZUxlUm1TdGFQU0p0QzFNZDQ1bGVySWVOQVZiRURpUWJObjQ2SHdsOXoy?=
 =?utf-8?B?Z3N0R3BjQjJpMHRQNzZzOVU0RHhxQXhadnlLdThWSFpBYjg2dVR5RFNGM1Ew?=
 =?utf-8?B?QXBIZTFBNlhlQUR2WmRqMHd5Y3RhYTZPejRFV3p3clhHajBkYVJwZWtMaWh3?=
 =?utf-8?B?dzRSRDYvN2NwV1RkUVh6ZVJ4M1loNk1qY3FDamF6cFl3MDQydVExS0RTMG8r?=
 =?utf-8?B?T2dhT09KQXUyZ0l6UVdKWHRIUVdHaFpxWW1sdlhtdjg5VHRyajl5dVlWd1R4?=
 =?utf-8?Q?FK98zbOgCpnw+2WUs+gA1sMfM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7f189f-0f6b-44f7-3b19-08dd451957d5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 12:42:10.8040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmpIZe/fdSY7LbuKW/tJI719z01pw09eMoxT7OGBIXd45NVIAxt+YR1qptpQk2xwnDEQ7MvlzL9l/AxE14fIzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10889

From: Peng Fan <peng.fan@nxp.com>

Introduce "#access-controller-cells" to make OCOTP be an accessing
controller, because i.MX Family OCOTP supports a specific peripheral
or function being fused which means being disabled.

Add the i.MX[95,93] OCOTP gate index.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |  5 +++
 include/dt-bindings/nvmem/fsl,imx93-ocotp.h        | 24 ++++++++++++
 include/dt-bindings/nvmem/fsl,imx95-ocotp.h        | 43 ++++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index b2cb76cf9053a883a158acaf5eaa108895818afc..c78e202ced22f1c278f7be827b71ba434832d2a7 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -54,6 +54,11 @@ properties:
   clocks:
     maxItems: 1
 
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the gate ID associated to the peripheral.
+
 required:
   - "#address-cells"
   - "#size-cells"
diff --git a/include/dt-bindings/nvmem/fsl,imx93-ocotp.h b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
new file mode 100644
index 0000000000000000000000000000000000000000..4b7fe5930331fc7e3be49f2674faf03c0a46d156
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX93_OCOTP_H
+#define _DT_BINDINGS_NVMEM_IMX93_OCOTP_H
+
+#define IMX93_OCOTP_NPU_GATE		0
+#define IMX93_OCOTP_A550_GATE		1
+#define IMX93_OCOTP_A551_GATE		2
+#define IMX93_OCOTP_M33_GATE		3
+#define IMX93_OCOTP_CAN1_FD_GATE	4
+#define IMX93_OCOTP_CAN2_FD_GATE	5
+#define IMX93_OCOTP_CAN1_GATE		6
+#define IMX93_OCOTP_CAN2_GATE		7
+#define IMX93_OCOTP_USB1_GATE		8
+#define IMX93_OCOTP_USB2_GATE		9
+#define IMX93_OCOTP_ENET1_GATE		10
+#define IMX93_OCOTP_ENET2_GATE		11
+#define IMX93_OCOTP_PXP_GATE		12
+#define IMX93_OCOTP_MIPI_CSI1_GATE	13
+#define IMX93_OCOTP_MIPI_DSI1_GATE	14
+#define IMX93_OCOTP_LVDS1_GATE		15
+#define IMX93_OCOTP_ADC1_GATE		16
+
+#endif
diff --git a/include/dt-bindings/nvmem/fsl,imx95-ocotp.h b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
new file mode 100644
index 0000000000000000000000000000000000000000..717152219c9890297440b74e11d67e2dc5da883a
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX95_OCOTP_H
+#define _DT_BINDINGS_NVMEM_IMX95_OCOTP_H
+
+#define IMX95_OCOTP_CANFD1_GATE		0
+#define IMX95_OCOTP_CANFD2_GATE		1
+#define IMX95_OCOTP_CANFD3_GATE		2
+#define IMX95_OCOTP_CANFD4_GATE		3
+#define IMX95_OCOTP_CANFD5_GATE		4
+#define IMX95_OCOTP_CAN1_GATE		5
+#define IMX95_OCOTP_CAN2_GATE		6
+#define IMX95_OCOTP_CAN3_GATE		7
+#define IMX95_OCOTP_CAN4_GATE		8
+#define IMX95_OCOTP_CAN5_GATE		9
+#define IMX95_OCOTP_NPU_GATE		10
+#define IMX95_OCOTP_A550_GATE		11
+#define IMX95_OCOTP_A551_GATE		12
+#define IMX95_OCOTP_A552_GATE		13
+#define IMX95_OCOTP_A553_GATE		14
+#define IMX95_OCOTP_A554_GATE		15
+#define IMX95_OCOTP_A555_GATE		16
+#define IMX95_OCOTP_M7_GATE		17
+#define IMX95_OCOTP_DCSS_GATE		18
+#define IMX95_OCOTP_LVDS1_GATE		19
+#define IMX95_OCOTP_ISP_GATE		20
+#define IMX95_OCOTP_USB1_GATE		21
+#define IMX95_OCOTP_USB2_GATE		22
+#define IMX95_OCOTP_NETC_GATE		23
+#define IMX95_OCOTP_PCIE1_GATE		24
+#define IMX95_OCOTP_PCIE2_GATE		25
+#define IMX95_OCOTP_ADC1_GATE		26
+#define IMX95_OCOTP_EARC_RX_GATE	27
+#define IMX95_OCOTP_GPU3D_GATE		28
+#define IMX95_OCOTP_VPU_GATE		29
+#define IMX95_OCOTP_JPEG_ENC_GATE	30
+#define IMX95_OCOTP_JPEG_DEC_GATE	31
+#define IMX95_OCOTP_MIPI_CSI1_GATE	32
+#define IMX95_OCOTP_MIPI_CSI2_GATE	33
+#define IMX95_OCOTP_MIPI_DSI1_GATE	34
+#define IMX95_OCOTP_V2X_GATE		35
+
+#endif

-- 
2.37.1

