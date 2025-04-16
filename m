Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2102.outbound.protection.outlook.com [40.107.247.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D492356B1;
	Wed, 16 Apr 2025 09:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744794406; cv=fail; b=f0cG5C50eiBW1v9GWnoaKNhzXQNiqpdarCfh3hk+C1+bp8TZbWbLlBBUN+9HjcpZ2Z79w38shc65SU9Z+hOs1HJK4z5CNQf8ANqduqtxVhdv+DG6mnbtPEwSwyAbQ06CVvP14Ihn1hbq74B3t7u8uda7zJkBkn+2MqC0VrFET4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744794406; c=relaxed/simple;
	bh=UK58Xbdwqz4d9aqw4QboLCUIHsdxLvLfoo4BdGFQ7wU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PXRYDglzX4acxAwABHy4SoqLF/R0Em5N6D1plIewGvjOtw/2B02vaavBHAv3sMaj4gPnC45dU5DXwoNdWJ/RGJgDLx21bFzv5RExqbxvgEonU0j1tQ0JofpgUZRUakw2nJp9LbJGqG52aAeCqZE7RuWYtZwxRZHvZAz1oHGu0sc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=s29b6wXf; arc=fail smtp.client-ip=40.107.247.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="s29b6wXf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8iDHqHKqv8k4C4KbkL0OtxegqdlcrBiU8NzGeMxWwIYky19j2lMMW6m8qa1JFuyobQNiynDl4mfycdrII1x8vzK4m2CZdp27JcEGh3ZzsCSZM4u7fj4jqu8INDJ33lXauTbkqHDoCpCohCfj60XkAQTIbnOema2T7oIMe1/Epu3axT/TFY10x0YC1o+/jkkIzQbb4jsQDEOkdmzniMLy9z73s8Fzj9KAbYaXozc6jM1fdgw33y5MIYxyPhkvngp3jF+3Yt4O7EsO0qAk55I1wMWDQqwK/q2tkXQkqT2UG1NUnXvFFvhwb7avfGwOJNFw1sgKNDg51a/WK4DvnOUAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfXlI92AqoSduMz/+MXiLWpu5hpg/b2uWA/f0vBPfvc=;
 b=jLp08xdr4t2ReCXJwRPNeP6B9+e+wqmnzKBSFWqs6CQX6uRgBqkqjdrBG9ldS8XYYaIrj4965yPDe10vSq3ZF2zDX0seIKHCXZDgthCcSvK35e02jiNLOSUmUDPwUWg5ApwEsf7YzCy55Eo6E8AgABIh7Xo0N9VEAixKjQQEdSkC8XxF/P8rqRWS0Ed9z0twbzl9HOspjLRzs5wNsHfRsFcvFoF4+pqPLFYGQMpMw5EiRj2YK3/WBFnbO3veiGk4yakG9zo2kpMQtE1kkpAJdDh8EJGpNDBZj0tOukrd3CnpZg9paSNQ+PNkEuiZDS5CSJysJ3ND23kKLRgL7Xn2HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfXlI92AqoSduMz/+MXiLWpu5hpg/b2uWA/f0vBPfvc=;
 b=s29b6wXfOCm2DY8ZTQbai+czX2CXFYOyFuRWvRzxKddFUJnjtFEL45MoJnCkQq91StGoW/0DSXMC5iZmbncKO1ne9e/6dmHfu4jnf0ogWA/a+joNd0O1xWu3bsviusC/eq4dyTf+/8iuBTT1l5nbbcrmgB2SI5mkTomLmKI4N6guovRZkkfdqbYlytc2jb+p619pGBrY2UA1Kpu1ItLKj7rvDQaLrN2EkDCa05NqklFAbyMwBLNYqa8hIfOkAdWX2o1k6Okq3XDSidnLd2sKdbjZ3sKipgUvST1G1gKtHZ+zbtZ+UzJ+jP8e26ve25p9SuvPyFSIrWXPAFQU6+wfng==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by DU7PR04MB11139.eurprd04.prod.outlook.com (2603:10a6:10:5b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 09:06:40 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%5]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 09:06:39 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 6/8] arm64: dts: freescale: Add the GOcontroll Moduline
 Display baseboard
Thread-Topic: [PATCH v5 6/8] arm64: dts: freescale: Add the GOcontroll
 Moduline Display baseboard
Thread-Index: AQHbrdM+rTbOWy7xEE+A0k2rEwpkRLOlFR0AgAENIYA=
Date: Wed, 16 Apr 2025 09:06:39 +0000
Message-ID: <78d30ba1-a4fd-41a8-967a-97252cc2ac7a@gocontroll.com>
References: <20250415-initial_display-v5-0-f309f8d71499@gocontroll.com>
 <20250415-initial_display-v5-6-f309f8d71499@gocontroll.com>
 <Z/6sWD949qKeahtc@lizhi-Precision-Tower-5810>
In-Reply-To: <Z/6sWD949qKeahtc@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-imapappendstamp: PA4PR04MB7630.eurprd04.prod.outlook.com
 (15.20.8632.030)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|DU7PR04MB11139:EE_
x-ms-office365-filtering-correlation-id: 9a9e9c24-b037-4d6f-d823-08dd7cc5ffcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?MxrR1/wjRtnPwGkZx09Nf5DgW5EadtZfbAmLzq5aogSof+QH5UhaN4IO04?=
 =?iso-8859-1?Q?ePVp7q2MdMxToMh1GyyNmY+b5+WjblAln8bGR1NJe+m6M249DEjX0sA9GT?=
 =?iso-8859-1?Q?0uC5mGM57uIOk1cPFl6B40eynWXYE7Fr9nrYTM3IzGACLt/zNv/+NJC+us?=
 =?iso-8859-1?Q?b2PHRhWsmSTkQyczj13zaRDcFA6kdzofyzTz+NsE/Uw+GFxGti1kzjz0dy?=
 =?iso-8859-1?Q?pv1jH7PbNcd3hwzAZHv2U439r9Y4dJSLty32FwFKhdcQQE0Kq7rPAcVquK?=
 =?iso-8859-1?Q?2RCDvds0SyFePfh6l4HWnR0tEHaXC1iG/uh84p6AGz37Szk9AOJXNJSvPx?=
 =?iso-8859-1?Q?QbGQzfqPp/1/V1FUCk2Fp0UlHzBnARjQHImv5Jq6xgN/9tlLf4gB7L4s2b?=
 =?iso-8859-1?Q?8ptHUVUtfFMnTY453TM+WMY2OTj0gapQRC5rFX4/ywZFW+0VfHC3myQq5l?=
 =?iso-8859-1?Q?UbsCzpAFvpaLTpwS8Z6Og/QuHbLXDBUh9WfiIZpNjG2cma/C3t7Z9Iu0bS?=
 =?iso-8859-1?Q?2DpxYZoPkerZGtf6fW3Tm70W0AfcCG49eyPqDEP+SBVlmz0p8kLPHzCo3b?=
 =?iso-8859-1?Q?8mAypyos+3LZbpC1HBPVGq48+glXmSZrQjwyCTbvZeRkiCqdkPD06sQNGJ?=
 =?iso-8859-1?Q?FD+im+0lV+O/OW5FATabpRu/96b/drI7+cPB10EnQ/XrGtrouRSJwn2I+e?=
 =?iso-8859-1?Q?BeSrYARshgCK8kJVvDjXF3fNs1yhpSlkW04mGjsp4WGsoHh8uRc8XSlCee?=
 =?iso-8859-1?Q?gr2nRLh9QWbr/MH81s71dt09gOa2ud3DvElouo53eRawj/o/TmjL0yXmVO?=
 =?iso-8859-1?Q?o/0NxXfU4zDe1f+kVHDOWhmvDHcjqsS/xu6XCuHpiZYINBD9eoU2sbg4+O?=
 =?iso-8859-1?Q?rtK2O8Y8WnQeil4hS7dgeU/ls+HdHXRdHz4ATiB8ho1ECqktcmqFr242VD?=
 =?iso-8859-1?Q?lVnsL9Vjpy7+7zvDDWxW6DsO41Exqp6xfn9L8TPBBoCwhgpi/yE5KMse71?=
 =?iso-8859-1?Q?Iet55OL2pT9UDBN8aOSKUa9UbpedJrTXiM6O37x91vAFySuMTDO9ypW948?=
 =?iso-8859-1?Q?pshBYzpVa3AY+0ec+JBslQ77zyY2mwDwxRUJtJobnmex6+vOta4xr2ifXO?=
 =?iso-8859-1?Q?5jQnWmnRcj4h0KLeQWYT21WptjuLNsXf+z090E86HlBJzANCdIVqY+3I4S?=
 =?iso-8859-1?Q?jDJiumseJR5x7pq8f5nyp/wtCGFc26W0IDMvPyYAmPfcpi3PrOVzwK4J6G?=
 =?iso-8859-1?Q?9J9CUgErzc+bojWyjVdPqws8BCLKAG+lr2s/6r+eNDFPiVIvOFsj7LEW+R?=
 =?iso-8859-1?Q?G83JLBkn7cCIh4DGer2Z4JLqs2Rz2eY6OWqin62UJVKTl4CMHvcS4oIh4J?=
 =?iso-8859-1?Q?hBf+0Lw8eu7lAB4u3PTGHwnCKVyqPJlRrjzjCL9PWA/5yiySNEQW0NLuMP?=
 =?iso-8859-1?Q?Ny4G+jCtqRsALNoKQxuxZhVeLxbkV61nZep+HLFCP1kqtlOLkQHnpqrhKf?=
 =?iso-8859-1?Q?WHfr7V6cqZFOqIOvoi3qR3jyaFgRYOSKiNrAVuuce42g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?umTCwxYnBVX+XNxWJOl+1rNjCoJ8+NaUWS5f4mwdhSedeioxemBGG5N3nY?=
 =?iso-8859-1?Q?8L6DUCqQKLFO80cwfI9YTBkGcKqt2ElCmDNgjJ5KbdfUcHhMb2RXpRIbq5?=
 =?iso-8859-1?Q?4ROQDRmr5NDTScfyJyeomMSzH9okiYPx3G4YGQlh6MWZb3yw1LctOrrzkD?=
 =?iso-8859-1?Q?P4BAvwNQSW5/oCi/jbf67/ysLBcYWS7ZelHjcKf36G6sniQuMdSNNVS0s3?=
 =?iso-8859-1?Q?/VOVrnQH+MPOYQjGEGwtO7MCRlHoMORsRJLgR4N3fScAQFjYr1TOJaHLWg?=
 =?iso-8859-1?Q?qFMcVmdOus32Qn7a1z/kX7HGmZqZY8frbogrvJkN5M6WY+ZeQ57f5qYQEU?=
 =?iso-8859-1?Q?RUfuqDCVHplX7mfyVSPtCVG8CgMUUtLTDbDd/77QzvkIJQ7vk7OL/3vgXs?=
 =?iso-8859-1?Q?ekjNZOk0IcjPARA7TA4FfYI/NP/EJFXKYMxQOrNSPWVaViIGZ37OE/qYKI?=
 =?iso-8859-1?Q?luvfFcP+4OKoR6XtT2Q6kfpU8g97myNEIcGeVxjTy/D4+C2fb7yELqo6tW?=
 =?iso-8859-1?Q?EzMpJATG9sThksNMjIGQOZAf4UKFNSbPOK2BvAuEVNICi8MjUrwrOLmmOU?=
 =?iso-8859-1?Q?Rm0+t4CPzv4Ux5Qa4UpX/QdvJ7b70TMoB3Aum9XbZut8xien7DFZ+elMfC?=
 =?iso-8859-1?Q?gW7BkMf12R6U2zb+vcwOkEpWKDCmahLwdryv6yl5zURDff4Hnl0eYQjANL?=
 =?iso-8859-1?Q?PyMGzgR8FbbUtn4IjbNMlX5a9G6KArz4goILU6ZXt2oZQMFDW3fTGuSWJB?=
 =?iso-8859-1?Q?Wis8lMoBVEJdweD24TGmTkU3yxQZtYqzTIs83MdHcH3w3+EDCHsXt6r79+?=
 =?iso-8859-1?Q?N05R7He3hJHFVdrbBLZ6y1LR/cDNeqlM1ojUleT7hVaLLeF5hJqXXMPSXv?=
 =?iso-8859-1?Q?K1HG3oXnA4apsB5DpH5eJkyWXR6KSecH1y14WYscBPDEWbM4DVAfCkTtKp?=
 =?iso-8859-1?Q?nLr/fNsRv4Kkp9SDqoyFJ2irNm64KCqTPJk5r69ozYBn0G/VQThJeY2tid?=
 =?iso-8859-1?Q?J7+L5331vdnd/cSYNWFQpX2nck9VwlXQ0zyuVrCKqZ3AHCIkKr07BJU+GP?=
 =?iso-8859-1?Q?rVClEaOAYlMjkT6u43y+/pyCYAV9Q+Fx8PJLuNE+EjcqQWwSb3sjQZQt9G?=
 =?iso-8859-1?Q?fKds5LjoUrxvRLM0b/1izNQcfzzM7aLco/fmLfvsQ74TLV2BDnpwI5F3qh?=
 =?iso-8859-1?Q?EbyN4FyAVYGyCYtjMz+KgT4kFmAvU5FbK/a89q6vMata0PId/FxieVg58a?=
 =?iso-8859-1?Q?vMTV6ArO4WwECJ1XsTtGJThj55T8OL2Sq7dI2wUGiR/yVwSFi6L5zIZDCQ?=
 =?iso-8859-1?Q?sThJCUsnaRe3sExaw91PN/aWuL448u85Jw8sXG6pznCn8xmlg8nZfb4Q/5?=
 =?iso-8859-1?Q?2Kf64HwxSX6fxYJG/CxHGQh9bHzGxC++SmtpLFSiXnv95bURZ6g3IVn4D5?=
 =?iso-8859-1?Q?6IuGJuv0HLYxEfNAcdHYriFuzNEhwIHAWY31AjDgAWgXKeQPS82gVhQcnr?=
 =?iso-8859-1?Q?fQQAbVSFRrB1g7fHo7MvkfbhNbrT9E5A+/fIELk8bnKM2O82HPwheui9eI?=
 =?iso-8859-1?Q?Sw6XgSZ0TnIaI6jP9q3Opepqinm7O/cah+R8iVlJZDG5Jci4m3n12S8r6i?=
 =?iso-8859-1?Q?Fxnb5WiDGkJqFsTy5JlYnSjZH3VM17474R6HVLGqCChacWIc4200Mx1Bh5?=
 =?iso-8859-1?Q?F89dMlvcutwuz3ar7cmXx99AGEpHwNUhU53EQsaImulXVnza+NGtAIRfnQ?=
 =?iso-8859-1?Q?AJPA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <31738CB92102BA43AC49786C004C9F04@gocontroll.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7630.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a9e9c24-b037-4d6f-d823-08dd7cc5ffcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 09:06:39.8298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CNrRVsikn5oRTwePS+D3DlplmTf4ABCTQ/PyjLyObpWLzDVWY3+NsY75+txgpVhH00p73bmXkHUNpNSGjDq6OW21uM+8VLxTHKLpruf/bko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11139

On 4/15/25 20:58, Frank Li wrote:=0A=
> On Tue, Apr 15, 2025 at 08:54:29AM +0200, Maud Spierings via B4 Relay wro=
te:=0A=
>> From: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>=0A=
>> The Moduline Display platform is a part of the wider GOcontroll Moduline=
=0A=
>> ecosystem. These are embedded controllers that focus on modularity with=
=0A=
>> their swappable IO modules.=0A=
>>=0A=
>> The base Moduline Display board includes a board-to-board connector with=
=0A=
>> various busses to enable adding new display types required by the=0A=
>> application. It includes 2 Moduline IO module slots, a simple mono=0A=
>> codec/amplifier, a four channel adc, 2 CAN busses, an RTC and optional=
=0A=
>> wifi/bluetooth.=0A=
>>=0A=
>> busses to the display adapter include:=0A=
>> - 4 lane LVDS=0A=
>> - 4 lane MIPI-DSI=0A=
>> - 4 lane MIPI-CSI=0A=
>> - HDMI 2.0a=0A=
>> - USB 2.0=0A=
>> - I2S=0A=
>> - I2C=0A=
>> - SPI=0A=
>>=0A=
>> Also a couple of GPIO and PWM pins for controlling various ICs on the=0A=
>> display adapter board.=0A=
>>=0A=
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>> ---=0A=
[...]=0A=
>> +=0A=
>> +&ecspi1 {=0A=
>> +	cs-gpios =3D <&gpio2 12 GPIO_ACTIVE_LOW>,=0A=
>> +			   <&gpio1 11 GPIO_ACTIVE_LOW>,=0A=
>> +			   <&gpio1 10 GPIO_ACTIVE_LOW>;=0A=
> =0A=
> indention mess!=0A=
I'm not really sure how to resolve this correctly, currently the next=0A=
lines have three tabs and three spaces, which lines up which tab =3D 4=0A=
spaces but that is not the case for everyone.=0A=
=0A=
I just saw two other ways this was done:=0A=
4 tabs (doesn't line up at all)=0A=
2 tabs and 3 spaces (doesn't line up for tab =3D 4 spaces but does for tab=
=0A=
=3D 8 spaces=0A=
=0A=
Another way I thought is 1 tab and 11 spaces which lines up for all=0A=
cases, but excessive amount of spaces.=0A=
=0A=
> Frank=0A=
-- =0A=
Met vriendelijke groeten/with kind regards,=0A=
Maud Spierings=0A=
