Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2097.outbound.protection.outlook.com [40.107.105.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071322DCC06;
	Sat, 24 May 2025 21:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748122646; cv=fail; b=Qu1C9IkiPJDN+SBLk+K83wtR39/+CjEVtJO4Ckk8Wx1M6pIsC6849ii9iZhNnM8GLRAhZyX0tYClwFFuKdKTTWAQ3sh2PVBBSBUvcSWijET9yi71Q1WjPcvp1R6IoJdUBTii0yEM5dIPeB8ex8kelPBN/JRV6FjX5nwz9HnT8II=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748122646; c=relaxed/simple;
	bh=nWKI0HuihUtbl2vzum4MSXFljSBCEfBxu7nkHW58l90=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D9dLL0ZVp/yH64f8TJouTHzQFc9r24g/wTz1MNNDwUT5tThb2l3LFtd8ha1Q7w/WgZQJAu7WOCCBVAl943PXxjWNzcY95kaQBj+MQ7GZnH8NzINANyDrsMGagC4teTdtd1lXdnRL5rc/OgshoSRNsCZX58NRw9Wgy+VL4n8y4nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=BVD/nhiv; arc=fail smtp.client-ip=40.107.105.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="BVD/nhiv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lc8fl0pXlpbbqL3vTby8HkNeNwyzLa/vKYLsUbIvGYG8j4UjZ7BXxHC6OUzuzovycCTpJahLJTQ+9GgqFwuTatNFyB/aQ9Svw4ykR1C6s8iRCaqVAdquxq2yZk+1VfUUhPuc4J29iRn0NxSwpjQ5e9DAzyzHHJZrU/f4Rmwhk6zBWPJ0k/4k/01evlVhzofJZbShB982fnXCnPmghld4hBfPzt0BDD1kUEREJmleUbOBmdfityNCXpHnehgKDMlddpMHFwuhI2jdhozrL1m+uXtdnqz04knTS3jShFwBqxX6xDjGxtp1bVPLPlxlB9nfN/MXyXppHGcL6Chv5AyCKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vC0X/QxmJwdrehjfIn3T5ZZn2sBdoyj6zD2UyFkrIHs=;
 b=rB9bXvwHa27wk/PfOzIpv9PolgPIk6GA4PNlF7irLAbkB7Sa/GqI5rjLDmIsul6N6eWamXXYOeLuiKxYxbSkldeGIpzjxmUY73RD251L4iSaCelPzPO9QSiFAYZh73x/0hk1Ufw9weNXUmws8X6sGzyVP32K6Kv/vccgA42aWXPQF3rSPLJzo9T2VHVw4DKAGutzVorG3nOe8toiX3SZsFQgQV2UmBRxKL0/JxMnGRZDF+KsgD5krYKDMFwprS3/5OZdsmsqZ9P+fRDa3mpvpxYA+SEiXk/Tfa4+09pJLkDFUNOfG0b5QRDCi1tE9EubyuyNrjwa9t1L8uP+ToXS+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vC0X/QxmJwdrehjfIn3T5ZZn2sBdoyj6zD2UyFkrIHs=;
 b=BVD/nhivlVgWNLlZuVJuAW/YWCCNttjkAHxloicNvn1eC/ls0vnZu1snv1gyLWFYJA/StgJlr5SByWDwJL5IfGQgN++INgrOgB13/Rs3E8o2WzIRG6D2+PNOx3l7TLCiGzPgDmFIIOzcZbSYCaf6f8wWPTZ9cw2iESA5PdNZzT6mw4P9AfF8Mhj3Lt/GuhdRujD35vI2szk8i9IOKbh03iDpgityapQKMTRbOQWvU6D41VfdQQ7lxe9Ih34V2UhY/ER9XwE8V9yZ00Fha5HzPBNTHrTxJVU0ORBlCfK3sK661OoYn+N/UENtg6uNBplB3Gbvuv1lblO+ew/H8+s+hQ==
Received: from VI1P195MB0272.EURP195.PROD.OUTLOOK.COM (2603:10a6:802:60::29)
 by VI1P195MB0592.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Sat, 24 May
 2025 21:37:17 +0000
Received: from VI1P195MB0272.EURP195.PROD.OUTLOOK.COM
 ([fe80::e9b2:9988:f36b:8cc]) by VI1P195MB0272.EURP195.PROD.OUTLOOK.COM
 ([fe80::e9b2:9988:f36b:8cc%4]) with mapi id 15.20.8769.019; Sat, 24 May 2025
 21:37:17 +0000
From: Christoph Stoidner <C.Stoidner@phytec.de>
To: Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: AW: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Topic: [PATCH v3] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
Thread-Index: AQHbzJ5IkKiCUrqPH06p42f/+549BbPiDcKAgAA9rmY=
Date: Sat, 24 May 2025 21:37:17 +0000
Message-ID:
 <VI1P195MB02721791E42104B050912965979BA@VI1P195MB0272.EURP195.PROD.OUTLOOK.COM>
References: <20250524112315.695376-1-c.stoidner@phytec.de>
 <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
In-Reply-To: <047c963e-f24d-4995-aea0-4a8cf8e343f5@lunn.ch>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P195MB0272:EE_|VI1P195MB0592:EE_
x-ms-office365-filtering-correlation-id: e4b828ca-6008-472d-1519-08dd9b0b2808
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?knnCUGrMG3xsBJfssrIEBBMO+IHIKbwQMaqbL9uO53DcPw8BtMDyo36tyS?=
 =?iso-8859-1?Q?4ylHR09feZU/KlCiTHBQxPLmYLP5Da3e9+bBtNeZg05Zoe2wDdYBlxc+ei?=
 =?iso-8859-1?Q?ZB40LmLlUk45K5RJbY7P/+G6fUCMbejKBobbo2/qM5BlyyFryF5hj80mrH?=
 =?iso-8859-1?Q?n+bQ7mRoBkwLh+gRrNbCs4JZcz0rLu2/fJoQM4mGzzP41FKbHIyt75fqiz?=
 =?iso-8859-1?Q?BPbNVEerea5pkgQ+AWN9gAtV80rSi4a5Oh3SMJd4aNwF9LndRn2PtGFLo5?=
 =?iso-8859-1?Q?anBxeGo0G882lN1EpEcsybDVkVBaKaboI9xjbnL1zSF8RXtuC+pDAW0K2X?=
 =?iso-8859-1?Q?OE9wgEUxuN/DImMHbc/oakmrKhnQRDtoebTzEyaAiOAjQFI0AqD8U786wy?=
 =?iso-8859-1?Q?VTATcKMj1ysTmQ1tlZ+mzb81q+EqE0tKl9TL5JsAl4XWEQpM2rISxOHnAr?=
 =?iso-8859-1?Q?0cqsZ3YmnDUt7ZoRbZl0ljankghy11gOlzDKOXgJHfsPp2wwDP9Wcxcfnj?=
 =?iso-8859-1?Q?MoM7yvpyT7hSIN2HkAJXsG4MGj50qNyU2CcrpePHNgGkt8G3V2SMPyoo5Z?=
 =?iso-8859-1?Q?RjWARQoCIjrz6xXQJngvBVEtzpy2bmQ3RwVPT68rxMBceVLgT7cFOWp6Ip?=
 =?iso-8859-1?Q?RwEEOwY0NHToTb3oV6I4jG65hffvPhffs8CE18pWIvOkFHitB8UHX2gb1B?=
 =?iso-8859-1?Q?qM8n20YrDERjhjHFbWglAZXWi+9zitsl92grBwHcdYTMf03qRq+kE+FPVQ?=
 =?iso-8859-1?Q?AYi5VujchX3EsKBgY8WMujrMOZ1LODE4xrAx4dTdcwhRiBBSfvH5qAE4AB?=
 =?iso-8859-1?Q?pF/HZnHfBsMrttDO1jDQ9+NnM97r1thD0mtJkl9OPBn0YzYJlq7NuT9GOX?=
 =?iso-8859-1?Q?Yx7VpM4ApNsY5W+Cmb1bK/4WpgIHfSiQiZEM6P7OtJF7bbmnZeOjtgUObG?=
 =?iso-8859-1?Q?TCRAOsFKhIuyCfKpycUVQjkhK4fXv24UAZv3RWSnH5lx9I/nDB/vte+Sft?=
 =?iso-8859-1?Q?YyFBmpuK3YEc7kGWzwhF31XDDEpzSZrubpEckeTezvBMXi7fVYNEyzooQa?=
 =?iso-8859-1?Q?LHt2FMbmMe4dOWJtiP8VEPvGLBXVYEi+pNo1AJpTOJ1cyFB6MpT6QAAsqt?=
 =?iso-8859-1?Q?T7jI34Pu+aZhHJ+1i5xi/dHectuRi8Aao8WJX8Ndni3ZWuuF8Q/l2/Iprr?=
 =?iso-8859-1?Q?5J82NtYPY+lMAwBASiFeu/jkic08RIZv/2mQF6e4Q7gp02m8cP2nucemLN?=
 =?iso-8859-1?Q?YRcrspkHxXLd/XKolnSK5cuURBDK7uy1LRvvOW2SNJPEuhQsPzLN1ABt15?=
 =?iso-8859-1?Q?8weR+nAi0dZ0C3uCyiMw0ONonFxn53LAhtCLkjuRsVhxRb0pLqIUaXuXJo?=
 =?iso-8859-1?Q?7MEneVnNyWED8MAK1DWJXEu16cNR38rFMHYQBqx3QeaGMMIth3/Zc0+uKY?=
 =?iso-8859-1?Q?nuYEIpOHJTOALxgIx6UqiJZvLfcFZExls9/WCbaiHZeLRvq2L2Nw4F5upF?=
 =?iso-8859-1?Q?sVxYXZnkC0zMyIeKPacDcezhWBWFQS9lrikCt1zPR8PQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P195MB0272.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UbQsa8Eig0ggtn8xWcJAteps0UBuKdMqYusmTBojbAOCIAEL/QS5sjayvX?=
 =?iso-8859-1?Q?NDhfXM+uSsuxf6/8kIEWliEkNrlgT9HwhtHynGNQNDz2AbVpB6AplcwNid?=
 =?iso-8859-1?Q?9MgWAsG4axo5jk948XsyucJWs+QFZ0A98JuQ1RIHxA4FNVPUdQ0RGYKN8z?=
 =?iso-8859-1?Q?4EJ6B3qS5NOAnUPP3inW99Xr3gczEAb/eNWn+p0OHrUvJOuGzXFnmxNF6S?=
 =?iso-8859-1?Q?UcFxlQAJ4JNGEKu8Xt/q5Megti2gq7ODU/TkVjJ87v2KTE26C9XigpJAS7?=
 =?iso-8859-1?Q?mXVDszwaZzjq8dxdbEdO4fkI1YwFDErNjdApVGzkuzFkhgkZZbeOYnlo3R?=
 =?iso-8859-1?Q?vtVbpzYDxaYDbhcwvSgQzRuF4a0f/hPy2L7DSG3eJCeOYXqin93QYUVftx?=
 =?iso-8859-1?Q?/nU2V1IsQ1Vqng59a7GHQFakfzb7i/cMJvmMDVJjkT5xkj1hSR5OVztn+r?=
 =?iso-8859-1?Q?BFOTLah3LR8x7bbDTcdZc5QI/4WDwTKmJaQMzzVQwYxhwyme9iUA8OovPk?=
 =?iso-8859-1?Q?hmhhnjmXpqj7aDpAI9pqxwSDMlET5Ca3NeoAuWbIXRoGLuOBq9PVCaK4NK?=
 =?iso-8859-1?Q?VepZ5jYu6tlwGSViC8fjKYZwJ2W1Eob9C1t+voAS1QKGTzQwj+3+cEzA9w?=
 =?iso-8859-1?Q?k595dGyZjJyGv2ZIAX8eAs/hxUzFmvQJ0KoKr5Uzw58ViHFRrp/S4tt9id?=
 =?iso-8859-1?Q?3hM89Hh+C/URvK0vDod/LTY/LQrlMEa+LdvC2F7CkMABI7O1P41FskSWKb?=
 =?iso-8859-1?Q?vUXTwOwC2W0XgwN8pQRUCGPy/M773RZzE1q7A3BfELFB0KozoYN2var9nL?=
 =?iso-8859-1?Q?SHxIUeNWAj1Hu1sD4RCbwiTuuZ/oHiV5uN4V0/sRC8tEJD+UH/f8BZr+iI?=
 =?iso-8859-1?Q?Ll5UuiOpy2O5aMszmOxhqwkyeRXVthwhHgqncuT58z9ZVwTNgmClqKqw5G?=
 =?iso-8859-1?Q?Fv24wwZd8/db5vApt3scY1VwAIFgiG4JVjPXDbAyy5GkuBMSzmer1/n7/l?=
 =?iso-8859-1?Q?NgVRcmn2iopLeOIzBrEcaBGirjOc68QCGukQBxxoBVY5FLBTvmkmBwf+tx?=
 =?iso-8859-1?Q?GOjahdSc6FexBJaw3NiIvsKgHrfzJDyalqvzIGxxLYP64BXZ9KcRvWzzSV?=
 =?iso-8859-1?Q?c+bOF9Xtx/IxXLRw++nt4o/m6NNn0kEc4ATYI32KczI8d1C1jK6eysXAc1?=
 =?iso-8859-1?Q?GB8hMEfTX7GWflYSnFl8xFd6/uCUEHVbc8RETEQ5jDJ9ZqL5b8QxtDTHP+?=
 =?iso-8859-1?Q?1IKq6TTjCrw+gl20/yoXsmwVAFIISMTahsM4S30sdYcwVbykPLLhV72XaK?=
 =?iso-8859-1?Q?szArG4V6Gk1oXzhb2dbjDA2iOlOqECYT2/ePtv8Ypq37ZmrqvSfekXSPiw?=
 =?iso-8859-1?Q?8LAR9HR3d0Rw7GahKoNkohvi9uWsOZD0ZL06qXltgQXEvIL2a6/cVik9BC?=
 =?iso-8859-1?Q?uBznwOpkneB6Zg/PFKNrxnpzVgDnzu3LXH7MufXVoAhsGwjeeigaTYWq1j?=
 =?iso-8859-1?Q?ZhkfViGEOfZexk5edciuxPqdl4+rlt0LsDTSu0BsLKFm6Hh90gbmHPdtxW?=
 =?iso-8859-1?Q?oVlvcEB4bPNIozzBQ3CzgXpZ/GPP8rg6EUQtPTHTDI/5ghHxvsjD/8s0p6?=
 =?iso-8859-1?Q?6ytvYuw4mvyKA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P195MB0272.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e4b828ca-6008-472d-1519-08dd9b0b2808
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2025 21:37:17.4723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Wkz9vYG6DSJUpB3rjJjndcu/2UwrvUrwBZp2rT4etn1p5tcaQJvsrm2McO7HbADAkm5MeVQQfsCr0fEqYTXNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0592

Hi Andrew,=0A=
=0A=
> On Di, 2025-05-24 at 19:44 -0300, Andrew Lunn wrote:=0A=
>=0A=
>> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch=
/arm64/boot/dts/freescale/imx93-phycore-som.dtsi=0A=
>> index 88c2657b50e6..b481097f08a4 100644=0A=
>> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi=0A=
>> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi=0A=
>> @@ -68,6 +68,8 @@ mdio: mdio {=0A=
>>               ethphy1: ethernet-phy@1 {=0A=
>>                       compatible =3D "ethernet-phy-ieee802.3-c22";=0A=
>>                       reg =3D <1>;=0A=
>> +                     reset-gpios =3D <&gpio4 23 GPIO_ACTIVE_HIGH>;=0A=
>> +                     reset-assert-us =3D <30>;=0A=
>=0A=
>Is there anything in the datasheet about needing a delay after the=0A=
>reset? There is a DT property for this:=0A=
>=0A=
>  reset-deassert-us:=0A=
>    description:=0A=
>      Delay after the reset was deasserted in microseconds. If=0A=
>      this property is missing the delay will be skipped.=0A=
No, there is no need for a delay after the reset mentioned in the datasheet=
.=0A=
There is only the delay after the assert (i.E. the pulse width), that I=0A=
declared with the property reset-assert-us.=0A=
=0A=
>=0A=
>Anyway:=0A=
>=0A=
>Reviewed-by: Andrew Lunn <andrew@lunn.ch>=0A=
Thanks, and regards,=0A=
Christoph=0A=
=0A=
>=0A=
>    Andrew=
