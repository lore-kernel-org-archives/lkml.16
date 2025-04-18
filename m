Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012022.outbound.protection.outlook.com [52.101.126.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFC914BF89;
	Fri, 18 Apr 2025 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985466; cv=fail; b=GPhEsjROp4Nqfbo/AmpNV7kwkIImO1TaAwPUK0p+pYCdXUxJL/BluLy2fZn4/89lvh0BydVUeEeA/0hMY9Hhgka22UDVkMteS5ORWGilrwhg9KTTrheVbeoWW1Ko96c54eKi1sHpoRXPT/Xz+p5JccbcGpUHC2ozF7WzYqFJdMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985466; c=relaxed/simple;
	bh=BvyX+5lZGLwkcycoGqKOauyLP94E19WOIXJ17ucEzk4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Fd9nCJD/Jl8qIp9z5aAWzeBn/DRlX5VHewntDJhTKTLPsXhEk7n4I1wBrQRpclnUD//E0vFm9h6qNe+DPEDhO7jINFvffPIXP9tnhwCOeedw1G4zeLyygocLPhKHE87Z1azLcq05s4gzPrUh6ONDcXv/gHLdiQWSCm55F7NHsyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=dfYANp7t; arc=fail smtp.client-ip=52.101.126.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="dfYANp7t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDReszrhZCtCF4V83KfnuMqXWwc+vjqtSOxTHEjuVu7Vm5rSieHmou5pz09N9l2Qrb88zcVA7DBQwd5MLJ1ak7Vh+TWWEJzRprpZP14Iml60MTVoDCDsisyK6L5hNQhy24tFA/VxBTM8OtZMC5xf2nyKolJHv5dEU8Zt/zhvKaUFjXmq3dvCA0OMn4NQS25FwoCqnBIfwG5WfPeOo3owsQ4ja5x2dmjNHEgmG+Gd3eHxa+wlCLkK3ZXEBb44j01ZUuPK8PpZRooGRsTeHLtGuDIknNnsJEoKC3F6f0/LrCQg5lmHNSq5B6mBBpZesVuv5dubYyL8Cu6VbRitZuxQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvyX+5lZGLwkcycoGqKOauyLP94E19WOIXJ17ucEzk4=;
 b=u4cUaMJWJTkPBFm8oZUEflvy/ei6rZIrCwzJ+PKS7lwxRchZ56boH37IU1lQ+YzaSWjXaPzI5J5viVGHhSDeK2mJe/GP0e4C+pupOObYt+zAyn11eKhRSmiNLvpGaLtjhSY+mpQ52VbKCkX9h8a5v7qXDiZ78T/sTwuWfxDOYiBQ3BhO8BkU/acqeALYUFLr0oo9wTKfWWGMWdn2srCaoKg0r4WiVsXTZkDRCmSvyOrgz3uwFDFnnkFlKtPNe61CWccpzKZrXQYCChRrmpMH9LH4bthku0YVqyja9e94WasfpjDV2Id88eN6ww0CO9d5wyM/01whbnwDYxN4Bd1iUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvyX+5lZGLwkcycoGqKOauyLP94E19WOIXJ17ucEzk4=;
 b=dfYANp7t4on9rN7iT8vIVHS0WGT/P0dVe65L53wWik6BICLsdYeC2ysOh6Zfm+KdS3B6TxWMTBMifXsLNKdngi/AlKti7HOXu/M/hiVAAGFlZw5iV6M/wNE68+SI6Hq78g2p12G8bymRDhUu6bgyNVcARUYgmkgtqyq38RUfrPvPt3V9rfTXWW35QphU1ef9FzGLtRA7uIhuh3yshDk28QjLKFauy9t7NLqvX2sN70lQG+1gaYpHrPH85eY/ldAyMkPq5IqpBqYAtxOj5I8wcJkFxEGln52DKMI0v+h9fbxbV0o/JXWnA2nJEj7LBwZnLRP3dMx6kEohQf/vcoZg6A==
Received: from JH0PR06MB7294.apcprd06.prod.outlook.com (2603:1096:990:a1::6)
 by SEZPR06MB7023.apcprd06.prod.outlook.com (2603:1096:101:1f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 14:11:00 +0000
Received: from JH0PR06MB7294.apcprd06.prod.outlook.com
 ([fe80::6bd3:c327:c5c2:bbbe]) by JH0PR06MB7294.apcprd06.prod.outlook.com
 ([fe80::6bd3:c327:c5c2:bbbe%6]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 14:11:00 +0000
From: "Chen, Jay" <jay.chen@siemens.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Shao, Tzi
 Yang" <tziyang.shao@siemens.com>
Subject: Recall: [Bug 220033] xhci: Compliance Issue - avg_trb_len not set for
 EP0 during Address Device Command
Thread-Topic: [Bug 220033] xhci: Compliance Issue - avg_trb_len not set for
 EP0 during Address Device Command
Thread-Index: AQHbsGu2VjcTSnJrZkGy7U1npUOrwQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Fri, 18 Apr 2025 14:11:00 +0000
Message-ID:
 <JH0PR06MB72942D95DE88AFFB70FD150B83BF2@JH0PR06MB7294.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-traffictypediagnostic:
 JH0PR06MB7294:EE_|SEZPR06MB7023:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56b9fe9b-7f7f-4b50-1f35-08dd7e82d904
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YSEb7CX3DTD/iTzgI2KuaJRpp87M9rG1O9SZ6VyEf1T40ixD+orOxjLgcF2S?=
 =?us-ascii?Q?KKKXIgO8Bnox2RHouHjMnCT4Ja5H6DZ4vnk3WUz3IzQgjsnls2lgWwjJeTVe?=
 =?us-ascii?Q?zt+B5t2qFu5UHAPjvnboeo1ZOjZrS4Psu6b5/+nW4BNfHtWeu11+8re67AqS?=
 =?us-ascii?Q?XsJpeeGMP2JQA00kR77sR26HrRFX2RRBR/p51sIcAC3rUzB3VfnPMX7JL2mD?=
 =?us-ascii?Q?VQoBZoSt6KRlMVNSBY9LeIfik9h66dy9mT1/ET7S8gaul/xj8uuGcvpFqoCz?=
 =?us-ascii?Q?EJ48/dLmn4jNYeJTZYwDuRynneWcAnSX5VCNgaYdw7cv5TYLx611LeNTQwA9?=
 =?us-ascii?Q?iBJeu4fIe9BW67F+qNHGhMqJvO+lekB4H9TMbMdxdTnMnev77fBveJGr6kx/?=
 =?us-ascii?Q?yDzcFb1T8qLaj5U9fQ7OnbuJrl41ILhs8J3Yn+AINWVPvngTNp32hafpIaSM?=
 =?us-ascii?Q?OnJlotF5T+Z25yiHkxBDLSSaEuuIKJ00qZDNzCl/+E0msEBdV7pb6kNatqfC?=
 =?us-ascii?Q?rc9VTftFzAqtoFKdBmDbd4hqZwr0Do2CZ644/G1YgeODuwRnmz7HldEp/p5a?=
 =?us-ascii?Q?UIdByVhUNCWqBMX4U0bqVatSLe7I/VJB+/n4ieh+AOoqyZ9FcX0dF8veJBQd?=
 =?us-ascii?Q?/dKtsT3hb3gtEOcsDUclK03pGtfx+xjFc4r2/kG5twwVCBz6x1EJbnJup9UH?=
 =?us-ascii?Q?GjXmG9G8bGyBqkgYjuJ0ubDli38eOZO8jwEF33NcZbXn07e1SuPvteMCX76l?=
 =?us-ascii?Q?OIZD7G79EzPyxQSTInoWyroFSuuqsd+D9cILB1KJkQ6+8mF4cnSp0XpK/c1p?=
 =?us-ascii?Q?uR+qvtg++vBByPK6oerk8w5AAKaIH0m4XmvoaJAysioZfXBJYzt2wyGde0Hg?=
 =?us-ascii?Q?GfCPTE74C1Xku7VXZf0okAgLYw5f7X/us/raI3L5D4DNjXuuXOaGYkJi50Wq?=
 =?us-ascii?Q?W3Lt+KvPwDVyF11Wp1bqPCKDP5V/4pkg0cWARkfeZF6KX/uWnjBTSB2NyOB3?=
 =?us-ascii?Q?sL2xEQixEsJNSR9ka1/eXxML+3+L5gCd9oVwpUCBAC8yyjWw2lYdJ6UBf34u?=
 =?us-ascii?Q?SyLqj8Q4L8JaWU+ZYHfekkALbLgo5WSXGvjSLfaEWXOmZiUkib8G4gpSPecm?=
 =?us-ascii?Q?ufhXNUsq4/txj75HUtK4hXo8vzm9esHtmWqd5wfYbDFTy82pyOVdRQ+CsuZV?=
 =?us-ascii?Q?Km8oJLaztEHPkHvMFuDCWTGbJPSvkfqR0f/j/ShJRoueijGqupei0cvbSUg0?=
 =?us-ascii?Q?YGF+oU5OVwxvsIAr4/N4LLqx4N6sVlqDOGNuhoMxOGYPGE2XD4pLdS/KO/A1?=
 =?us-ascii?Q?dDB/2BIpf5Ns+zB5GyLBHCRmH3Q1byRE8VMArlpyZYKednpZiiFLzODxDKr2?=
 =?us-ascii?Q?PEVEvU2d9WHWC5eLffHEwPrjNJ3IaCmaFHJk3U1dWz6xvO2sXLyIGdZYGB9I?=
 =?us-ascii?Q?0g5D4jCDKeYhTHd1Bga1Ds4ml6ec+wo7Pdav9yFRxPbx3QjrKyVyQS9Z44Vn?=
 =?us-ascii?Q?A9N2BwEcsfA47LM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR06MB7294.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HVdOz+nka+7GlzBITSjUGuseeW5o+DEjlRMVoiJ2YdJXCJ5nOdYCIX7JDwkt?=
 =?us-ascii?Q?XF4BtsMtWJwQYc8zRE+pI/atlbea7rs9mHIkxObF05sWTZqQNOn3unJJkXH4?=
 =?us-ascii?Q?UTxzlm1XdQWqGs+KpLS4yLGO9gxLPmZo3B0TTgGDziPA52TH7LmC362JGR3E?=
 =?us-ascii?Q?Je2oj2cpRiDcSY9V8kB0xGDlgCqprF+6ascwR5RQEdHZppsf98ta2cIQ+EGT?=
 =?us-ascii?Q?YyrtNvEI72IB+eUl/I3MMDguN1RF+PL0+/dhQgHGhLwqY2Ur+Yuq1hmBXJ5F?=
 =?us-ascii?Q?1B63xKpRR/BYAnZIVxv9Uu+L+4d7G5JM0q44eDp9QaFbfnqBQLJi7BvUzKiM?=
 =?us-ascii?Q?Oug95gJcIBiPX6iEMXTaXAVJ/EBiIv84LMfxp7lMSiKyMNA5YowW12qNvOti?=
 =?us-ascii?Q?cHb/5mfLIqio6V+9jZ40G7MUBydh03P77RHbZM5pcYglFPjW5cyplygBWSLf?=
 =?us-ascii?Q?uOCOxCIIDkbQrXjJVF7JpD5M3q6JogTBw/TPfB58WTLoLHg7+5AoQ6szqWJI?=
 =?us-ascii?Q?ggTbABoE4+N6WktXSlxLb8fbghEg1pUodS5q+St+3Zm65+NHAkFZypST28uw?=
 =?us-ascii?Q?jdX0esRh86Jn9fpGqe/5a6Icdh59ta405R1gE4v3pR6jSVy2kTvaHhHsQ/X5?=
 =?us-ascii?Q?Mfu2olOYVGXJ18O+fT8366YVIzFww4zCjDD3KHWam0vLr1uVjwFstUlcFm1G?=
 =?us-ascii?Q?GjfFi6tFcT2ij3xUyt2M0stUXFzE17oHxesFuptIx+meQjPDgUJwq9jOIyqh?=
 =?us-ascii?Q?/eziIon03J+gKy3KrlMKKcM0yRR7uBAve/hzsO5h9vejr3ZXs3IhFSehVPuE?=
 =?us-ascii?Q?QoU6gr+oqkqzbI9RAXjW+RvOQgQzDF3gow1B6dQeUR/nHxlcY8DI5nAAaJgw?=
 =?us-ascii?Q?+YLdToXnESla/O0gW6UWMQMVaZjwL7QzWBEZDzfgMhnXXYYI1IQV9wrPpg4Q?=
 =?us-ascii?Q?Ee9ZW58ipBupQB/KyBOxq8PrWJSB/wYi3uo4g7xcAMla/F67yHq35FZ1vupL?=
 =?us-ascii?Q?t+MjIQZitzexD2ckTDbG2obK3mi6y0uY5Vv7xK4fXNSzrBAShcGmCUKb6cJL?=
 =?us-ascii?Q?xSWYsVpQucqPYSkjqHuH3Bq98xA+IChGpQ8XfyTXt0JadUWcASkyvVRam8HW?=
 =?us-ascii?Q?J1U5hGf6aTIKyPH6p8tPqkgMv0m4bojVSfJeZd28C6ksTIbmhXtdk0jn3yzI?=
 =?us-ascii?Q?Ztjh6aNDc7JOMzOeP9/OchkT7GsjL5QQhRzx8fpu03oaZ98INoVMVaJUoktF?=
 =?us-ascii?Q?Y7TIpz9nwrfICUuTJ88FMN2uBor7xvgAku23mQFxLydFHlfwJEWZ/G5qNzCq?=
 =?us-ascii?Q?S23879Vyvm+POSN7b09Zis319mIEQf6tibtNgB9fa2Nfr7ncCPFsni6aKMI1?=
 =?us-ascii?Q?+1EPK9Y7PScFBB3bOuZbeOReEHx16OC/nWVi61wn+QrPh2GQDOHWugKVxr6t?=
 =?us-ascii?Q?0/ZMxihGGkVHQSnVVhpT8FIOP48dxlwk/QxjaTqmc+pZoOsJR0ZlY4zafRXX?=
 =?us-ascii?Q?TalRT91tewu3zSilLSsHMAGeR0U33UcZTb8ISUccG6OGmkyZr7279B3bW/Dt?=
 =?us-ascii?Q?+3K7hOOCURay0bA7MZnTJhc/8o50dxp1+4jSKS3N?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB7294.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b9fe9b-7f7f-4b50-1f35-08dd7e82d904
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 14:11:00.7681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aEMZ8RBLWIN5VpT42Q+X3vOV3zU/S+LFutbdojQkFNW/UQejzYMPPvHowSZcF8eIT2CKL3waikwBs7nCySMQKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7023

Chen, Jay (DI SW EDA DVT RD IN AVE US3) would like to recall the message, "=
[Bug 220033] xhci: Compliance Issue - avg_trb_len not set for EP0 during Ad=
dress Device Command".=
