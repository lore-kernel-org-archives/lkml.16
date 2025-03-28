Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023136.outbound.protection.outlook.com [40.107.162.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44C81DC9AC;
	Fri, 28 Mar 2025 10:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743158631; cv=fail; b=f89x+6ND65LC3eRvdPMAxwmZ9TxD3ziY5Ni0efzsJMWfpGWTgTG8Eg2yqnJVk2BNoW32cEkpWJjzSxBXJjRi9RY8K1DV7PdQ8czX2GtJA172iguIbyhyXPbfoKv/UObabCov+dESifR5in3w9RmEkVskRiyEb1BBo89Uqotkjz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743158631; c=relaxed/simple;
	bh=5rpCmDVoBg0azuP/3LrGq+jBLviYTkjyHE54Gn6rh/U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rFzL/TYVwuaLbvRqe3lN/eea7d3/roXtrrxu5tigvuJZbta0aky7hoVQI/LhzXnRl+y66htkanhcLtsJnd6I44iLod8N98W4Em2b0Na9n+GizF5X2OeYXcwoyBvSCoglh+tz79D90HqachG5PZWlUWuN0UbYEiR+8tmf5P87Kaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=eda3OmJv; arc=fail smtp.client-ip=40.107.162.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="eda3OmJv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxlOeN7UlqrQ7W1w3h1iWz3q81cxkFSc1g4BIUtso+nA/yvNoFUVODGM3xZ4C/Hu7AQAS8b42O+x8Em3tWGK5+h8w8oTXAQDtt/esKLgvQHWz07TvgmAUnohYW5qOxl9GChwLWNGHRJe4d0yY/vZl5c/KrUk2hbkHQokHcrP3nkMYSs6MqaW8vvIDEQSyhjJWC6bP3LIt2fXg3zZkpLONWHeGRzGKjnTJe0pWnyi3VwXaHljUU/M9ZtDi6W05HuNffwvBjlEioKZzRgc/6hfWvXjsc4H1+CoVA0ITOfsUcQJwcvORMjtBR+plnTDdVlvmoQz1Jof4rNiLBi0fY3VNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6sa1lY+oox//08AZf4/dIKoG51mTkqNoy1oaVZw6bA=;
 b=R/i0/RWjbZdW3UwAaKbLxaB34aL6RqaT2YPFx3zHAOdFdAcnRSaeipdM6rQ032gM97JVFPh661/sGhOrWpHBj77BK9x+UOtK3YKoYMsu1pscLB4kuud11fIYkvcLPLKcJ786jd91mJQ9dDIlXv7EYyInO7oAhANe02JZWF/yPCNxpbZRiRax1fUBeMuwnidl/1vslljOdKm6CdenYsYevT+37b0IT6S8d7aLqZ7Uuq2gbilc8UTNQv/zgr7xMoq4Mw1wlxc+69kBIZwwe8UrY3w8X8IXaTg+JHMg0a8zxG8e/xnECZV13ZN8hPRE2Y9pOoGWOPIy4/oSnmG2eTR6JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X6sa1lY+oox//08AZf4/dIKoG51mTkqNoy1oaVZw6bA=;
 b=eda3OmJv7Xu19pGXELXrT0JST4WtRWtA2rZnJyNLIvaws1+TBbGarH9D5r4yVrkGnw1KMyjo2jQAgqb7UMUBmuraTTI8sdPSlWtD+wRzdcIstA+iwihgRqLoxGSukDS5+CFKPiROrrVsVu/opBjMsZmgWfdh9Jrm6NN8/AA5l3EOr0LyYVivxw0aVm9VANpu2z6aART357VubQDQyEJkQUjTa/WqF6Du+O5hE8NVIPlZsBegZgt7X0M+hb/Tm82WU1dzVwAXyaSPyFoJDatJeqihq1GXfBfo0UuHXwys2NVPlyGwLJX1hmBj13tBdzcW87Rs13ACbu7K6zGP4lk14Q==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by AS8PR04MB8851.eurprd04.prod.outlook.com (2603:10a6:20b:42e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 10:43:45 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 10:43:44 +0000
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
Subject: Re: [PATCH v3 5/8] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COMy
Thread-Topic: [PATCH v3 5/8] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COMy
Thread-Index: AQHbnzP0liYa0ITeuEOAzYMZFD0o3LOII4wigAA4lh0=
Date: Fri, 28 Mar 2025 10:43:44 +0000
Message-ID:
 <PA4PR04MB7630342FE066C2C45D25AD4FC5A02@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
 <20250327-initial_display-v3-5-4e89ea1676ab@gocontroll.com>
 <Z+V6VAZLqIPuEsmk@lizhi-Precision-Tower-5810>
 <PA4PR04MB7630DD14BB8A55B57487B790C5A02@PA4PR04MB7630.eurprd04.prod.outlook.com>
In-Reply-To:
 <PA4PR04MB7630DD14BB8A55B57487B790C5A02@PA4PR04MB7630.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|AS8PR04MB8851:EE_
x-ms-office365-filtering-correlation-id: d680c656-a5fe-4296-90f3-08dd6de56985
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4O2mTDfX+OGEL/dVv2TlrZnZMCXfJ5TiCdehL8cf+U+OPMq9HtuJuEJ7W4?=
 =?iso-8859-1?Q?/YOcNnRw58HkPeEWonNepeD1fdpDS2zovorXAnmIkpcigqfAl1y/xZbhAC?=
 =?iso-8859-1?Q?71GBgjMdgoInc7wdm+SwW4SFIkqsJweQ/xMIad2Kw+YCEf+dufYKD/OU3t?=
 =?iso-8859-1?Q?HczimZG/dXNTtUGqkz7aXpC+5lyhn4ZSi4QgbTc7j9ttE/eL4fkzAUsIkj?=
 =?iso-8859-1?Q?+S+uet7K4x/hQXglW8P/4ONRWkfv8FGECSql4wjaE4W1zo9TubYBar3/vX?=
 =?iso-8859-1?Q?mYXUbu7deJ3oyqqQ4enVZIPYj+GZu0DFcMYskFBv/OlTfUvh77icvXM3mc?=
 =?iso-8859-1?Q?xrSDySDQEQBTkBQa3zZ6P5yGI9YnG9nd+AeX9swhO8UzKyMvtCkSmit5MB?=
 =?iso-8859-1?Q?fiUcHxGVctayD1SgnLFkzwI2aZ6zsoIxjB/E9XsACjWDTEtiwWP3DLCBzA?=
 =?iso-8859-1?Q?BZPoMHciHRxkn8iWIkgLb45fMQvMsApOWUEeF+v/+8Hzqz4w5ICoif1UyV?=
 =?iso-8859-1?Q?VVltlxeO80r5j0szO9VXvSrFLh7iKMBApTMQSbevHGiQ/6ql08It98FZQr?=
 =?iso-8859-1?Q?7KDYKMdjkPYVVWRKmwOdhqgHwhv+rTXNIlDUjUDL8KBq93Gg7fuggzg3TA?=
 =?iso-8859-1?Q?CVeqSlH3h6wcl9H4y5boeB2D5ce59cFRPBr7kL+2hY988E/Qz1H1NkFYSG?=
 =?iso-8859-1?Q?zobmhe71joTNh+Jksd7wPRkKeatyvJc4139m0aj0kd8Mrs9cGSZlMFOXS0?=
 =?iso-8859-1?Q?ZVRFk5Xx2kiUdzHj/azrdOL8GSKF7wyRmUw6sEzo0ELjHM9NlW0CXUd4b5?=
 =?iso-8859-1?Q?eVj049N4ysWf8EGr6Y8ytUTCnLyKGqioc85n7i3+QL7nY/1udVrDw9Ahfo?=
 =?iso-8859-1?Q?kelGC3ni3iuzjqnnAA6BTKL+niOtail3VbOCMyaNkY9UPkDZ9sh9ENHe3i?=
 =?iso-8859-1?Q?AMoOt+AiQWhKKuR4M7r/gSL59ZU5ghFseeB3VpwbNSkmRAXkUnslYOyaBe?=
 =?iso-8859-1?Q?wT2pBUnbK2G0OHUWOk7A/zP1fO6rJX/T8op92iGiatphpQl6FgmFUiQqbO?=
 =?iso-8859-1?Q?9BwcA7dVea0JsV2Y7Di1QhO9wOYom1Wgt3pV1jBKQKXXVUJsQwkX7FNR4W?=
 =?iso-8859-1?Q?dnc6ScIQBJL4bXcUBPKq7b9UeuLk7uk9Kggo9Zsm8sjNCnDWy//MTysmjZ?=
 =?iso-8859-1?Q?+2Bw+k53IblRFK/xoxHgqQGr1g6H2PTlcpZU/0du2ptOJkP/V9oJNYF01Y?=
 =?iso-8859-1?Q?+ewrBEgOi5qc6WamUp8lNAU5ZNgqs4X3S8GOMmtxpDNKf0IoGxiJce5hro?=
 =?iso-8859-1?Q?PaW1q8LCKVKGGIVsE0Yj2jmRUFYa0xQ8CXKI1ic4IfPUW7OH3wYi6sOcUL?=
 =?iso-8859-1?Q?Ww8Xpmt6yOQnGKudh45SbYhhIs5YSUrqj+HI72HyNGiwS6uwmJaOaJYwbU?=
 =?iso-8859-1?Q?2P4Nk8MpBocGcA0rD168bGAECav9oCreXPEuVij7bOyLBkqSCJC96xGRt3?=
 =?iso-8859-1?Q?3U5uywbXXJZ1mtECcZxbWX?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vF0OSlQuX3N7mn3TUc1Jk0opDNkgLQ+VmBFPR2TQaMQtchQJ9U4tTj+ctr?=
 =?iso-8859-1?Q?Ng3wIwjzeRiPmaVlqZPjvOGfeiwZfRvZDam4HpSZAw433BZpsVF5ZRyRyk?=
 =?iso-8859-1?Q?FayVbAGkuYpHU5uBc9Qvm8cpcoNOThZkYr99WuC+HIDXAhvHipm3Qhk0br?=
 =?iso-8859-1?Q?4/7Kt801RaG0DbeM3s00sjHIREhofI1wSimtGL+eEzROT6SX06hlxsjvUo?=
 =?iso-8859-1?Q?4ptlYxkLxc+o8ixox2rJfbGkLRJN5YkkBH+MXpU0yu6eyxL2PWtfkW/16S?=
 =?iso-8859-1?Q?6sjPUMYDcWdaekYwgz0JAk/WtgLEzxzt7qmFOWCemGIIUusgIFbgHpqsqh?=
 =?iso-8859-1?Q?KvzOSgqNtFHoxKbADe+uecfteevx2U2SjVFkk14cE8abptmx+mzUo+6Kyu?=
 =?iso-8859-1?Q?zrDTERcOLW6OhYjQlNLFwIZLPI7f3rP1PqHMAzzgGNzWpBuNZWDv4rqqBy?=
 =?iso-8859-1?Q?dCM/NAgxxLSqwJH2moAHZNOylY/4LEJpny6Q10/lJPwbbosepuzXMOqZUA?=
 =?iso-8859-1?Q?2u0ZYo7vGa6tKvFHnrbfKteHt8L2XPGYyaTiJnPlvjgYfmDWMsJepLE57/?=
 =?iso-8859-1?Q?DhPOm+n+QwxCN+vYwHrzWmOc3ICphB1gNiMZIaYUJC6WPuoYidw4a8IKY6?=
 =?iso-8859-1?Q?TfBEB+4WN3N3CKmz+VXDG3u9EvipWCJ30DCXfZmBoxN82Nu2OtM13tcuIE?=
 =?iso-8859-1?Q?JyQO/3SJAsp+aJUM10jSXJG8LGlW+pq+pSX1AljRWLFJ07TBdAGdjSktiQ?=
 =?iso-8859-1?Q?z4YUnSo/R4VE4nCP7kMmS+voVjT+2VR/QMDHPKxnf174hisefrlVaMvYdg?=
 =?iso-8859-1?Q?z0Zdz6lSmX/CG69+8iFytjcr8mNfLsQiYzPsFZ6cOBZ/r3Go3Hoy1xqesJ?=
 =?iso-8859-1?Q?FTjUNnUwfy20ev39uqisz2N/rBDZnhCFpeeM3dMwgG3btSGxhVcdQoQQw8?=
 =?iso-8859-1?Q?ofoK+NkUNB3pFgW5pVRtgAU5A0KbTgfu845WwUTeU9AfZ/sqNnzamK5hLe?=
 =?iso-8859-1?Q?ZY2uR7w+ORk7PL4veoSPl56PqdhA/N8ijf2vz5YmaUaecXUA0vhxDtW4aU?=
 =?iso-8859-1?Q?por/ITvwsTOHOZbJIRIUyAIt1lA37owgLK0jJE2nwgC2f2mLQYkDhhUX8K?=
 =?iso-8859-1?Q?jvKX6ZG0ry3wII7P+cqLOjPZ3OxBITTWHsQqk64IoVrt58a68UnifCllSW?=
 =?iso-8859-1?Q?/UJvIx6rn6VaXZTk4KhWh0w1JUHh//rp+W5tISV++c0CWbmCyO1Mso4kbp?=
 =?iso-8859-1?Q?1QYHwGXrQHGXpX/3fXN28HXCwLh1UknUvaQ83QmlRBcgGmDcvvbyLnaREV?=
 =?iso-8859-1?Q?HKCGS6QlkGx7Ay0aSSmzE0q1sFqxuCdDki91a/YYLvs6RX9HdXRxGTgXMq?=
 =?iso-8859-1?Q?lZ67sQPEsKoYP1IT+/uwayzmNMgCNViNMX1D1RR8Jym107I4HEf3AU/Dcn?=
 =?iso-8859-1?Q?3h8EQB7UWOqlWoV6eHYSNGmNfiioCxaAOTOBFoScF52Ztn/a+piGXfzelg?=
 =?iso-8859-1?Q?vQjT6B618lq9Z/e9UMc05X3FTpDOXhFPqMmHmCik9P7yVbqcTFVy7C4t06?=
 =?iso-8859-1?Q?qKH1MKHsUImmcryyjiwSN26AF7D/TM0tChpwalDcsFj+PuljD32GvXFH+K?=
 =?iso-8859-1?Q?7yFM0r1aesHHeuB8hpIjVB6Z3F8zl0RV1naNeA7kND3cRCdLrsV3F1LBsz?=
 =?iso-8859-1?Q?QGEi/gRqSeG+v7P7VSj+DYfRmUMrtYePYT4BlfmKkg2zzpGk5TOkS1mv0g?=
 =?iso-8859-1?Q?VWWQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d680c656-a5fe-4296-90f3-08dd6de56985
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 10:43:44.1309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2IAMvZZkvqD3a7szeCvTj94P5EqKTGYhlSwvw2cjNvx38nIUf0k/LYlD3no7f0rVtQGOO7dRAtcvSaGuVU37u+Hwmb0t30uSbdQ8ZhPL9Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8851

From:=A0Maud Spierings | GOcontroll <maudspierings@gocontroll.com>=0A=
Sent:=A0Friday, March 28, 2025 8:20 AM=0A=
=0A=
> From: Frank Li <Frank.li@nxp.com>=0A=
> Sent: Thursday, March 27, 2025 5:18 PM=0A=
>  =0A=
>> On Thu, Mar 27, 2025 at 04:52:40PM +0100, Maud Spierings via B4 Relay wr=
ote:=0A=
>>> From: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>>=0A=
>>> The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It ha=
s=0A=
>>> 2 GB or ram and 8 GB of eMMC storage on board.=0A=
>>>=0A=
>>> Add it to enable boards based on this Module=0A=
>>>=0A=
>>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>> ---=0A=
>>>  .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 549 +++++++++++++=
++++++++=0A=
>>>  1 file changed, 549 insertions(+)=0A=
>>>=0A=
>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch=
/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi=0A=
>>> new file mode 100644=0A=
>>> index 0000000000000000000000000000000000000000..9c4304e909b96afeb629621=
98da377319eda8506=0A=
>>> --- /dev/null=0A=
>>=0A=
>> New dts files, suggest run https://github.com/lznuaa/dt-format to make=
=0A=
>> nodes and property ordered.=0A=
> =0A=
> Ah I didn't know there is a tool for that, never seen it before, will=0A=
> check it out.=0A=
=0A=
I checked it out but I have one question, this tool orders all nodes=0A=
alphabetically, which is correct. But from what I've seen all imx=0A=
devicetrees have the iomuxc node at the bottom, regardless whether it=0A=
should be there alphabetically. Should I still keep the iomuxc node at the=
=0A=
bottom?=0A=
=0A=
Kind regards,=0A=
Maud=
