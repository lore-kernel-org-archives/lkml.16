Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012001.outbound.protection.outlook.com [52.101.126.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A21153BED;
	Fri, 18 Apr 2025 14:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985502; cv=fail; b=cyPTeHkUvERqvdRb2DXGuFvhYiXJdaxlE1UTeYKVLr/pySqcvWJ0xVixCRlCIcVgUgMXWI26ObfiqxwtW6cx/MNIOVbv3esW0kRG8/xMhRVcVlnWWUv6I+tI0Z/0LZyotW/scFW00aiq8gOhQi//HGuqAGrf+t//BL7yNG080vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985502; c=relaxed/simple;
	bh=BvyX+5lZGLwkcycoGqKOauyLP94E19WOIXJ17ucEzk4=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OjPbbrEbOVT52wK4AtYEFFVCx00Iuagcv8SAzhEvmrKI4l3M9PFGvseDlCd1kjFNLUXn6OupC2G+N3Ye2sKQh2E+fNe6YvfrSFaexNVAIGInP5YTWiEV8yO48sDiAEhcKRMUIL261/Hc6DKUdY72ppwccKj19k/30K+EHsWMexI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=Hum3u1Xb; arc=fail smtp.client-ip=52.101.126.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="Hum3u1Xb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDN6W7ptVCgILyn6hMpuh50HRmVQQGJY6HIYZf+E2G4CkN7PSiUEyNozjNbQI19/kEty9s+R3uchST8BXYhuAwehGFFnHqGlWuh/rtV8MHSsnD/gAD378QGujcjgaNdrzhUkyyB4KZWI2GHiVUtf3Lr4rDOaQW8HjfhdmrXx1k9NEEwSbYSQOGQsSFGtnGSRgrrQyqd8Q+ooeXOO09vKPEvLadwtLLyQ4r5XQHz7UJUbLRbeXkHgFSVxqTzQ9E5Jy3su5XkRM5yOa40PKzBZ5aF+IcseYDN9hm3q7MKomFmPvQn5hUyw8umBiRkpAx9tvF5eO5lPtu3kQcehtKCGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvyX+5lZGLwkcycoGqKOauyLP94E19WOIXJ17ucEzk4=;
 b=cJnBsB59fQFduyaD1jvbkrwiNt37NXYXXH477o3p3F3BvW5quvBXC8nxCjN+1vQjz/rTapz/ZAte6lvGODwFgVLpyUFUL5RWfxUNcawEO1jAFkVrJDWiFz4ceIagoEKQd7bjrY04XJTvtEDP7BJgzx6NUxl27GM4Jato7DViNzhqGr9zlA90uDRvopxE5g60DapH3P8B4IDEsnoj+srmZfmRh0t6/TAi/LOiwlyRoGpUnZfh+0d8yAULwejbCuqIRg2j5Brw3pdIEyCwLnXPlTJX/0lIT2y4mx8yurcBe1Z1LVbM54A5sHlDJCmwKz1dmqsBZaikSRZP8M2JcO0bmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvyX+5lZGLwkcycoGqKOauyLP94E19WOIXJ17ucEzk4=;
 b=Hum3u1XbewZLSsL51ZgQYJVdr20lOsxSIIBodTlF+zR9gqKvmB2aQjMT2iMLt4vV8eDTQ8vDzKfluNIIvTZZt9lldwLbDT16vhLmyp45K/+E0tMELLXLU7TU/TcHXykGErTbHzGgdg5Q/VnG+aBx7mY8WXQ7ho+iDwolzzl7MUHv/SC/BjTWIkzv+k9/U8Nlwepcvgrj/zarWBRe/pYopq1kkT3PoZB7sprV/+0Qym9aBxifNaFPTQWaZ1UEb1SkI386mHpKRdlCg6+IL2wY6eVIoXlQepQjiG/R1aWZt9LWJyxciLZMdrdjZtFrqG/YSg9mYialdXpvlhh3FU5zIA==
Received: from JH0PR06MB7294.apcprd06.prod.outlook.com (2603:1096:990:a1::6)
 by SEZPR06MB7023.apcprd06.prod.outlook.com (2603:1096:101:1f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 14:11:37 +0000
Received: from JH0PR06MB7294.apcprd06.prod.outlook.com
 ([fe80::6bd3:c327:c5c2:bbbe]) by JH0PR06MB7294.apcprd06.prod.outlook.com
 ([fe80::6bd3:c327:c5c2:bbbe%6]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 14:11:37 +0000
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
Thread-Index: AQHbsGvM1t/aP14bBEu43pMuonep9g==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Fri, 18 Apr 2025 14:11:36 +0000
Message-ID:
 <JH0PR06MB7294ED0E59CA35509EC73C9083BF2@JH0PR06MB7294.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-traffictypediagnostic:
 JH0PR06MB7294:EE_|SEZPR06MB7023:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef32741a-84e7-4cde-9216-08dd7e82ee91
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XJeCTV4lOipcTiyyJg4oqEJmc7tsMRvnOKmUqxQsiqNdCsAl2WTRyYj+4bG3?=
 =?us-ascii?Q?Dt0FVbV52C/aADkwd4J6Y9lKZw3bQ50htdmCrAP4ydHV2CYd7ImS/l2EQoBG?=
 =?us-ascii?Q?AZRqIWiEDSCVBVgzArKsMC6FGAePWoqMe+TjxJeuO6oshc18cYH5/dS4lACa?=
 =?us-ascii?Q?8/7FhpWCODoMYpMSbB3fniPwrvJ1sOwC/RwgEGO/p/3xP1yI4hXKo44Cb+H5?=
 =?us-ascii?Q?Lb5OGCkPGKHdOfCoV1gC2V1sRsfvmMsn9Z8L42B9UDJMhePhSWP06q9Cw27M?=
 =?us-ascii?Q?JIpokYZz3rD2/mWwiozcB9NLlpV8Mxfb+hIhWAB8VXjxjJdGmX7cKZKwL0yS?=
 =?us-ascii?Q?vtakrHyGYZWyOvzmr21gIjS/eDR/NOwxHoockaJVYD6z3guLn3dU05afvIsP?=
 =?us-ascii?Q?a/9rEZZC+hc/g23ZXAck1GAY1yLldXsMjysFf1FZ8E5YSTzSCTnQq6S4DVTF?=
 =?us-ascii?Q?Pz1oTbI/VVMaiNbiAiJJaZSOfgE6Byx3WughUcOo/JvoIvGMOZpZ/q6tJfCG?=
 =?us-ascii?Q?OQT0atNNZxsxtMYRfGPGfHr9fBkeVS78sTTmpc4R2HlYzI3PynmuLuFdjz1X?=
 =?us-ascii?Q?T94Q/F8p0TplCEOX30cgG3KjQylgN3G02o/D+xTplUwpuHl8XswLyCmS20pH?=
 =?us-ascii?Q?SqAz5pyIb/6nY6DIfTdYHu/1VxGkEK5jlQ437hyUWJer4pAD2crmyLoondqf?=
 =?us-ascii?Q?KP4Gxitqd3F2OStLqcOJl0jUCe/QDg6aUMGHPLiVZeeJr9yyLMF2i3PfxvFB?=
 =?us-ascii?Q?F88dHxgneXx2D2/UBm7frFGhSb3CbvEFlMHeJim6ACAT0Bm5zlyE/0HFRn85?=
 =?us-ascii?Q?FZXIS4mJiMl4utf5WTkuENTaWKFsYUKpxYMRIhsG69gv0DCdPqLE8Nkkchvo?=
 =?us-ascii?Q?oeCvkG3KuMjtGIKqUw5gmfg/JbwCZIQTBrNZ1Aa8mrwuxrZ5gV9s8bn4tL6k?=
 =?us-ascii?Q?uLCA13HMg0jQk9jRWObkMDh2EhuPKvXQen3N/+8T/jzoxtt5QlL8iGCasOaf?=
 =?us-ascii?Q?jyIjcy2awd1VcMAeWVycjimhvdV2GfdRgFbqEPe48mFv8CYaIrNFU+5RfZwf?=
 =?us-ascii?Q?rGUsTPIf+WW2pFnKbFgPOdN0l76ZpR5psXf0n6akkHVTXV7ScSOAKMn3hdq7?=
 =?us-ascii?Q?b8G/oLNFvdjt2nDCw1pfzsCYy43RnrL+kUGa8ACy6IhC0vTcfZZd7ojH8xIb?=
 =?us-ascii?Q?xIT88Y/Tul5nPQhtec+e/xTXCP7P5gwDJVxB2n75qexPAv8GtSklV4/ix+rm?=
 =?us-ascii?Q?euQLNKd2LGTZYu3c6tUikW44wxumnEZsUxWy0UQ1V1S5RKDyFGxbZlKw4utY?=
 =?us-ascii?Q?QNQldL0HqabFAW0G3btV5sIQrlt4RA9i1a1SoBvaz6XRskowtUYTS+BCKMgO?=
 =?us-ascii?Q?37dR1mP9Dkpi9WAu8GrqdT1nxE2nvhNsMfxLzlfD6YFcZPgrWAjdFBeCUqUS?=
 =?us-ascii?Q?sJAbyK/FJSfLEC3z4QlAAzdPBP5/51WGrG9Hi6Hl4cLppoaTBCgRxoiVJtO+?=
 =?us-ascii?Q?elmWwvUY12lE7MM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR06MB7294.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?exC+ypzHL83+dro141fcDLi+dQ+HYCFYe58F+9Au/xz+qVgWMsJGqQEzoOkp?=
 =?us-ascii?Q?nUv6vkQg0nttrIC6Df3uYKgqUM6x/tT2L4jW71yFjXWR5uoUWzwHLFNSoqp7?=
 =?us-ascii?Q?t1f2EPrYjG9wKyDye1TmX289iPOMgVrqJk5GN8JpDWp6oAmprMHJWK8dLoOv?=
 =?us-ascii?Q?u/jZ4lDO0RvnQVxNA4qDCL9XW4LTLD3JjUvxRuGBSM13CjEWi69ARyJGICA8?=
 =?us-ascii?Q?4IO3w55VEhZzNQcOcMMUHxfHCDXRDJs489wWvfKZSyvT3ybgVFDKaV1uFS+5?=
 =?us-ascii?Q?oSz3moNyNQXFwgpuSH8HFrmbrQBZnT5jvbp39CpCNkxa50UZlJM0FrqJ5c/b?=
 =?us-ascii?Q?tKBJ7bXzi2tnWPPmgz2efSDREpS7EreKOrcA5o0IkrXDv8QML8otCKakMfjS?=
 =?us-ascii?Q?1WJGZe9qAjUfAD4FQXK061OpQ80PctXqI/nb2OYqIM6rx8+noTshI3xba/o3?=
 =?us-ascii?Q?4IGwxk6ouXrrLtWxORlFqBW+juHnpeIJ/u+lcU4skf0b9keFjWx72V1gl1mn?=
 =?us-ascii?Q?epe3kHOsxlSY8Kk/Yj81Abl41FkXJjMHHFkHZcTKfq+0L47i+h5hMC2wBk7v?=
 =?us-ascii?Q?peAzPyL7H7jowJNKx+7KE+aoW9FAcr69c3fn6jfbbFxKXBTufQ0YVK3hhheO?=
 =?us-ascii?Q?AwX/xngDbY+hPv0p5ePvsIwExJp/b6x1zTylbVDVTQPIAahX5U3zDHrrMCjF?=
 =?us-ascii?Q?t4C3TQnPDEQMnCy43qQPWY1D5o+rKJCvboMKhHj4JWcHcaKsXFANIGUimT/2?=
 =?us-ascii?Q?AzkEe5fSaqJEe0Uo9Ue2vcpEXrotCUyi+wiR52JqeUfY+2FDtFxY9l24dJ9n?=
 =?us-ascii?Q?OiP1Raj6GODY9CXtyH9DzKHL8PBwf/KvWof3HysAi6zl0j3nQ2QLxHTiI8q1?=
 =?us-ascii?Q?FiY4Q81qVdw8VgAuiBPB3fQa8JeXQooXhsVzRop8xvzTSMuQMo7OwWbw2e2S?=
 =?us-ascii?Q?ZN4ciKwbsgc2TjaY+fSJbdHwUQbv1JJ3VCfbXf88lCP0ssbZ27DDzMMoe3uI?=
 =?us-ascii?Q?r8FdI13QrS90FUAgLLkdJPLHYNfrL9wpjJWSShVJU3e4WvGp8Tz5g6ZxAu8A?=
 =?us-ascii?Q?1XfHmDsOL6Xf3I+ui6Pw1H1KMMzo3ag1jpKdA/rxW/vkvveY4oEvH7kNmwKO?=
 =?us-ascii?Q?+/4hQXsI14xRCGFb/q6/IPZ/qxnF/9ofkJrF6e+qzLmrRu6nRDV20OBtFKIV?=
 =?us-ascii?Q?BLLcAfBF8scV7P70frRU/6mk0cbrHwV1bGQYdAG98vamQLqE/K5TdSHdMkUF?=
 =?us-ascii?Q?+8vbNBkEPcq3jH23V6RrWTf9Sb4r+kVtg5QHscob8UpQHi/u+gjCGc/9kjlM?=
 =?us-ascii?Q?hTieFaDx3hygMYSsrWkHjBDjq6RWPFodGPJ9mE9aXxihPoYV2wAeTQ4Y7cMT?=
 =?us-ascii?Q?/Ahnr9dtsWbKoJ/lH4E3bMnJ5sAt8kC6mV0LB1PSnTNNleb4spPrbIDT3Mcg?=
 =?us-ascii?Q?MQbwGqohXL6cp3PWfqdsPRwQy2x2f64J/gFBLhAdFCaS/+U2xYcj6iosx6U3?=
 =?us-ascii?Q?g+winiVKpRgExa/cSGWOW+57L7r7RPEqt3Sa+qlzEOVfe+bZ1bHvJH7o6ooL?=
 =?us-ascii?Q?OXai0jZ0K4H1XkWWHs2/Qo9baFsIbMYPzS5pEu65?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ef32741a-84e7-4cde-9216-08dd7e82ee91
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 14:11:36.9415
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j9Nl5a6qABSHYNgzJtbltqY8IxbG8uU9yhbXr2PIw/LrszggZsFVBQMvkp6cjhAihWCt+yHvqLqrcXqTZqch0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7023

Chen, Jay (DI SW EDA DVT RD IN AVE US3) would like to recall the message, "=
[Bug 220033] xhci: Compliance Issue - avg_trb_len not set for EP0 during Ad=
dress Device Command".=
