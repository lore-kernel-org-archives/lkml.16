Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2134.outbound.protection.outlook.com [40.107.249.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E68C267B89;
	Tue, 20 May 2025 11:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747740274; cv=fail; b=nsPzd2IdWAmo1vp3IXbjjKpQ/yR4oDr1PPSMzd2/I3oJXxJGYMdLjK6048FFkZ3/5Ay4mozUeUebVT8YyxTp3YvCeS2LTzZp6LDW2TVOED+59jw5jYGxVIynPNoQcy5Uzg+pc/X989xMRPGE66n9zzOeog7OiTKOc3FT8PXMEeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747740274; c=relaxed/simple;
	bh=XGjrb9wnkRDeLi88YxcDSxBxX0197dvWIgXmVXUpokk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MzhUtmZRWim+mH5rOpL74eN6jiggreT9uEhytCdPTkjLNaaM0I4qen/zmLG75bPXR7AwkMXdHM0LICn8mTtt4NC8U9w1aCNVOJuIRrQ8YL+m/3w6Q//ry5xrNyAr/+tL+GCBZLunoQs9i9uKnv8DVCEN1Z2nctCywMfFMGUvvsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=fbNcSQvw; arc=fail smtp.client-ip=40.107.249.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="fbNcSQvw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yk16ATWtYwJ+aJBFLZ8i3Q/8ve02QP0MGlpgHbgisArpw3VLmv1nEzELGHYiiwWJPH7W8GxVMhIte2bS5iaTxRc0FM2SEbiw7IierAF+wYNI8dsP5p1tIQUJwzJ3xRBuud6VrWUbb9Ajn9K33sX/m66VheDuZ9gQxSsFbgMR3m/IRcqK/x0EN9PxKejmg0aKENrezMWxB1xRlk1L7n+FeYpKre/DEMLXXyuIH660NGfPai04MYZuRwmmEiWq2oawZj+oBTl/ICvMxuDFNGlFWALKkeZnlQ7gt3fWBzvNvJ2U52qXfTQmlcKfQR/VegA99PYRBSIkZYUbNFnITu3RGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGjrb9wnkRDeLi88YxcDSxBxX0197dvWIgXmVXUpokk=;
 b=LLmo8vWA4Uk1jot7mwvsvl79GHjjGM1O7exMQ4mC1N+xNWetdyTo4BWR+nVHQDuql9TnYDLVygvKJrdh98lhusjcJkDClEBBfnuSFlFO4jBZxeFocGYfIdGqaROaxYv+Cb0ASUQa99n8UdRTnRtdeysOko8hb6Eyee0W23NUHzeEvs1roma5JrO2hVnNlGllA/XJmMWK8sfC0Xc4w1XRPFK4p9Yulk7Ev1TgpM+2mS15LGzIdrQIDn6JNhjWC8NveQo5hUNSsSjMfAPvKYbpj/XfU2Qr9x9Vt1PS+kWyxZMAA20FMm+8GYJiSRSe+MGozYyamyGpRLYdTbB51IAVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGjrb9wnkRDeLi88YxcDSxBxX0197dvWIgXmVXUpokk=;
 b=fbNcSQvwSGXS42FMupV3lU+ZhMGKTWpa3j59j8zI4VCaXJWpi70PsWSPcOo1iWJWhoy//MtmRaTLJrN1wASAspLgmVn9waezePiqfztvJkqPALwmQvCvORRkSyb6v6JM9PNP3xpmYO++69BB57Nrd07ZxjN1senOjLwD1EJnYFtvaNlz4DlduqXW+/jR6TqEwDp+TxngUaDuxOb/m71Gh7kCEmFJDJ4CcroGShpHRI16aopQ8W0JArW6rz+xQhuKUcAKwijXvuahfAo90oJMES9D8WEHUXGlB2Tbpwh8RFxh4LU4pZFQVN1lzeVXNvMIQHm3uaKrFOItGSmwT3fy5Q==
Received: from AM0P195MB0257.EURP195.PROD.OUTLOOK.COM (2603:10a6:208:b7::25)
 by DB8P195MB0632.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:15c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Tue, 20 May
 2025 11:24:27 +0000
Received: from AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b92:3cc:22b3:4c59]) by AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
 ([fe80::9b92:3cc:22b3:4c59%5]) with mapi id 15.20.8722.027; Tue, 20 May 2025
 11:24:26 +0000
From: Christoph Stoidner <C.Stoidner@phytec.de>
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "upstream@lists.phytec.de"
	<upstream@lists.phytec.de>
Subject: Re: [Upstream] [PATCH] arm64: dts: freescale: imx93-phycore-som:
 Delay the phy reset by a gpio
Thread-Topic: [Upstream] [PATCH] arm64: dts: freescale: imx93-phycore-som:
 Delay the phy reset by a gpio
Thread-Index: AQHbyVm6wIJkoj4mxU+x+qmjWwrzRbPbJtOAgAA59YA=
Date: Tue, 20 May 2025 11:24:26 +0000
Message-ID: <dcbee5dde29d18bc471054aff08f64aeab16dbb3.camel@phytec.de>
References: <20250520073450.388989-1-c.stoidner@phytec.de>
	 <e986fcf0-fe2b-43de-9d46-8ea60d97ca14@norik.com>
In-Reply-To: <e986fcf0-fe2b-43de-9d46-8ea60d97ca14@norik.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0P195MB0257:EE_|DB8P195MB0632:EE_
x-ms-office365-filtering-correlation-id: 20ddba04-3b2d-4a55-906a-08dd9790e148
x-ld-processed: e609157c-80e2-446d-9be3-9c99c2399d29,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N3N5N25JcFRTeVpGdmtCb0hXa1I4UW43WDEvdnpPNHd5YzVYREtoeW50Sm9I?=
 =?utf-8?B?UWR6ak9aKzI1bFJNN1JtNzR5UGtwZkRvNjNhTS9GVCt2TVNKODEyV2kxWlFH?=
 =?utf-8?B?UHdtSG1CbkFJZWZqT1V1bm9Pa05ENkZMUGxrSTNXUGJyY0xkUkw5aDI0eVgy?=
 =?utf-8?B?R3RFejJiUG5DZ3VyaGM4Zm5KNndYZVcwQXhLaEg5Z1JpL2FOYlVqMHFNVkpi?=
 =?utf-8?B?NTIrUVRlL0VmZUI3L1lXYWs1LzF2Z3o4V25WS1NYZHIxMzR1dkhETkFBWncr?=
 =?utf-8?B?eUFDWk5DWU1EbXhGUUM1N2Nxc1BtNjRWWGZydDNrcEJ1MEdSQlVsTENDUm15?=
 =?utf-8?B?emwwSTBVTVJSZ3ZId3JUeHZqREdPUEFqUWwzU3hhV0FEMUp5MnRNZnQvY1dl?=
 =?utf-8?B?SUxBT2tNOWl0RHd5aS9wNGdYY1pYY0VtL2dQUmRxWEt3UHNpQ2VrVzRuQldo?=
 =?utf-8?B?SG9SQzBPOUx4eE9LR0xYcUkxK3RWbHhsQTdndEVoZ2RPZ1JQZDgyTE1VTjFL?=
 =?utf-8?B?dnZkTEhrSWE2Nm93UnpmNk1HOWN3OUVnd0dtZGE4Zkxob2h1K2IvMVhkVDQ0?=
 =?utf-8?B?ZmVPVGk3ZnNMazVhZGxYaGZqS0lxSmtmYVNKdmlyOHVxQzdTRGlSUGZ3cmdO?=
 =?utf-8?B?T09lMGUxZnlrTXVUTWozeG9BRmlvWTJnNjAvQkxXNGc0RkxtVW9uaDZ5emRn?=
 =?utf-8?B?ZFlHUW5FWHJjdTlqSkx3cCtYWEFiZWd6eDdLSDArbWp1bEZxS2VvKzJlSHdV?=
 =?utf-8?B?YWExeUE3c1hGRlBOcHpVU2hUaXliazE1aXRQVVpncFNlM2RpUGVISWh2SEtY?=
 =?utf-8?B?cnNVeWhvMlFoSzl1SDRteFhHL1JQcE5DNlFURXdsY2F5YzlHR2JhczAvQ0lO?=
 =?utf-8?B?dklncTNnSUs1a2Q1bUdaZHhJWDRySGNVRUt0am9sZlJWMzQ2c21mbjdUUkVB?=
 =?utf-8?B?UERxZHZCNGhMQitkZ1NrZERZUTdRWllTS01ZUEgrRHpoRG5vSjV2aEZTemRk?=
 =?utf-8?B?NUpJMXFBR2FWZFllVnpOTjYzRXJnTnRTRTYrdlNSQm90clVKNjA4TnE3azYr?=
 =?utf-8?B?Q29CZ04xalVYckdkZkRLRDJUUTlZMXB1YjJmZHRqR2VKNFkybDZhWCtIUkxW?=
 =?utf-8?B?S1dyV2pkZzRUT0lPeDhQd2NKbVl3TloxMUZMbjBidHJQeURRR2oyYzRRczZI?=
 =?utf-8?B?TXNuTGRTellDakZ3L0NzL2ZTY1hCcDkrYmJFd0E2RHVNd2ZBeDE3cjhOalg0?=
 =?utf-8?B?cThiR0s0ZWFmZzVUOGkzM0V3MVR3MnZlOUhFTnFha1hHdnVrbDdvWEt3MHNX?=
 =?utf-8?B?NDBxamhNQnJQSVBlSG82OWxJZ3VoVVYvKzV2KzZIbVc2ankvd2ZhblEzei9t?=
 =?utf-8?B?OHp1OGd3WGVaSVBOdUREaWNvdHgxTFl2L3gweG9ZSFVOUFNIWkNIU0NiTlR4?=
 =?utf-8?B?dmppbjVnVHNkMzg3bU9LZ0diUktPL0lFSU1MWGpQa3NLWFN3aU5GYlcrVHdq?=
 =?utf-8?B?RnN3aGRqN1czdkRXZ2w0ZHc3UENiSjM5UHpmTlVmZFB6cUErZVEzZDFsd2g0?=
 =?utf-8?B?dlpCQURSamtRdXRBT3JzVUNYN1pEc3BodW4zcG4xbkhob1RzMnpwQm5ESlVO?=
 =?utf-8?B?UEZtdzdmWHZ1NFJRQVBSMWxHUUlaWUZHa3N3VldMVzk4MVE4aUUrNGRwOW80?=
 =?utf-8?B?MDRpS3lJVnRRajRGRHIyZE4rYnpQTUY5ZjhZY2IyWXhzSGdvU3NIbSt2ZDZw?=
 =?utf-8?B?b1UrVkNMeWJ4Uy9rOFNycXc5TVJlV05PNHhOWkx0ZHhPdkc0aDN3OUFmRlNZ?=
 =?utf-8?B?YWlCTWxDdFMrN0FTeFp3aDczVW5RYm9uZGtHYSswbVAwT2hVZnBQRmpMcUpk?=
 =?utf-8?B?OXJWWURzek1UamhoakU4SU1lcUczeGFDaklWbzRMZk12KzRnbzU5dnpiS3Q0?=
 =?utf-8?B?YzNvcHNKSU80NG1NRmR5WjhpcldnTVJlSU92OGF5Uy9NdG9neDN4WHFma2RH?=
 =?utf-8?B?dDVGa3JaaTZBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0P195MB0257.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bHVsSWVRUWRuQ2pNeEU2UXlZNjBvbXJ5R1ZhdVlpN3JhZ3kzL2l4S2hhV0Rn?=
 =?utf-8?B?WUdxZE5QUWM0eGtWQzlpRGZ2MjArczFwK01QMlRXZEdnYkp3R2hqaWpLY0dm?=
 =?utf-8?B?SFNQV3llZnJDOGNhaXBNK0w5NTVFWnlicHlvdURmZy9nTTFBVVNWc0JoL0Y3?=
 =?utf-8?B?REtZUFYvcjNCRzUyNFc4cG1rVGphQm5CTklZbG5ZTm5xckdNYmF5cUhncy9t?=
 =?utf-8?B?WHFxY3dWQnU3eHo0OUpSTEFrMHo2YVhuRkFFd0lGekJ6MTUvR043SzFVMTRW?=
 =?utf-8?B?eUdRdk1pc3RXdFBXUGVYU0xnLytNRVNKazJJVnFWMVdNSktFeFR3UU56YUZ0?=
 =?utf-8?B?d0JWTyt0elIrS1pudHdjNFhKUURxWkpHanJpUnJoMm0wYnl3bzgrVDFzbHZx?=
 =?utf-8?B?a3FBZCtKY3JlWTlCbGdKSCtZQk01TldKNHBsTVIyTTFUWGRHUWZuK2pZYjQy?=
 =?utf-8?B?K2ZncEtmQ0I3dStNYlZKNkYwZXlQNWl4S2tFTlhHTEF5SCswRUJKdkg2T3g3?=
 =?utf-8?B?Zm42MnF0Sld2MngzdDhodTVqVEpTVjg1MlM3N2xhNGRrWHptaG1kSjJjWDlT?=
 =?utf-8?B?czcrUkxvdzFuUm03OXQ0cjdvSzBOZ3JwTkVWdll0Nmw1elIvT09ESk0xL0g5?=
 =?utf-8?B?WktBRDBRanY3TU5yQ0cwOFdUMzBkMjZ5cDlMNTN6MTJWUXA1MTFZOGFGTm1u?=
 =?utf-8?B?blZqUnNLK0J3d3IxU00rdFpoSHJKUk9BalgzR0F6aHZKNmYyZzkycmoreXpO?=
 =?utf-8?B?TTV3TXpTaHdqN0hRNWtMazVZY1BKNUpBcTlrcTVqUnNONnNLWkpwWGQ4NW82?=
 =?utf-8?B?b3NLVjdTNjU0cnI5a1JwK0YyRS85WWgwZFVoak05SG8xZWFxd0t2MmJ2WjVI?=
 =?utf-8?B?NkdVTnFiY3lydlB6eFZFZUxTRy9ZT25xbWpPaXFQK09wTktZNGZKWFhIOUly?=
 =?utf-8?B?QVJ6bmI2R1dzT3oxczYrR2NXb2pvYW1uWUFibndjbThOcDZPUVhKV296SW4r?=
 =?utf-8?B?UmVmbUpVdThua2RiRC84Q2R6dHNJNXZXME13d2hvaEZBUFRmNFBJTklTbXg5?=
 =?utf-8?B?WTFnU0h2QVY2VjhJSmhhNzBrbEZlR0M1bTRWdHBNYkpxRnhuZ0szbHhvRmx6?=
 =?utf-8?B?K2kwams0aUordnZMM0NBMldZbDhUUThES3U5SklLQkxkKzVwdFI0R0hEN1N6?=
 =?utf-8?B?Y1dQbDdnbUZTaHByeWRGNWlwZEV5NnRBbGJsVllKd2kzakJQQ28vQ2x0WUJI?=
 =?utf-8?B?eUlvT3g5M0JVZWRJODNmV01YQjNJL3pBa1IrREEzZTJPSnRhcWxZcGFFTldr?=
 =?utf-8?B?cVJsTCsxMmFKZlFBa2JJbWdqVUpVU2JRM2s5ZHNTMTV4TU5HczNZMDJNMUht?=
 =?utf-8?B?RkVrMUlHdFp2KzhZemdNMUZFOG5sQW1kWS9TS1FKN2pxa3puSkM1bEQ4ZXdK?=
 =?utf-8?B?QUdzTkQvWTZFRXFVZmhoVnhET2crM2dENmdNOXdMMnpWVUxaQnlOWUQ5bHdF?=
 =?utf-8?B?OGtuVGdjNGhCSUd6MUJCSUV3cUVlN1F0b2I4MUF1TnNBVFlYTiswbWhtQyth?=
 =?utf-8?B?c2EvRHVXU1REQXZFUnpBd3RoSEV2K2diMzhUd2pFeWRaYmM4ano5dUtldkdY?=
 =?utf-8?B?QTBORVRxNkEzd1VDdzZPMEdrbHZtbkdGRVdUZXNyTVdPU0JHdFUzaElkc1Zi?=
 =?utf-8?B?NC9pQy9MVkhlQ1RuQXRPekQrNzBLVTNVTDJuUm5hN0RrK2ZFYlJUS1FHSURF?=
 =?utf-8?B?dEE3Rk1yU2p6M3BObEtsTzJwVncrTUlhTGxkaE11UWdSQ1l1akpuWTdKNjIw?=
 =?utf-8?B?cmQ0R1g2ZEVvQnZrQ3p2NFpWSWVSMGNKUHBQV2YrV3RneXY4YXkyVE1tVkhr?=
 =?utf-8?B?Y29oM21xQkVPdi8xeVVVelNsRWNUcmJBYS9GZXIvUXh2eDBDZzRrVTk4MmQz?=
 =?utf-8?B?dUozd01POUxtYmtTR1VKYVVwd2FHN2lQc0ZoWnhTK3VaWUVuY2Q1aDBIcGZY?=
 =?utf-8?B?Uk00a1VMOWRwQ1Q3K3dBU1g0c1djTWtmSW9FSlBvWmFHd2pWcWtOYnA3UVRY?=
 =?utf-8?B?aHFKemVJS3MwRTB0R1dGL2pHRjdodmFLem80Vk1ZZlhHTGxUTEhxOVlIZUQ5?=
 =?utf-8?Q?WCym2H6F0LdyCJhO0tpqn1Nr8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC85B03884ACC840B0132E00341208AD@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0P195MB0257.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 20ddba04-3b2d-4a55-906a-08dd9790e148
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 11:24:26.6682
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g/cdbRfMtWIfRxO/ygp3BoD7xFM2doEdAmd83LLzcU3W4UumAZlbqqaG+pJtNgucNhWZdI/EOduFH4dtPIXTdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0632

SGkgUHJpbW96LAoKT24gRGksIDIwMjUtMDUtMjAgYXQgMDk6NTYgKzAyMDAsIFByaW1veiBGaXNl
ciB3cm90ZToKPiBIaSBDaHJpc3RvcGgsCj4gCj4gT24gMjAuIDA1LiAyNSAwOTozNCwgQ2hyaXN0
b3BoIFN0b2lkbmVyIHdyb3RlOgo+ID4gQWNjb3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQgdGhlIHBo
eSBuZWVkcyB0byBiZSBoZWxkIGluIHJlc2V0IHVudGlsCj4gPiB0aGUKPiA+IHJlZmVyZW5jZSBj
bG9jayBnb3Qgc3RhYmxlLiBFdmVuIHRob3VnaCBubyBpc3N1ZSB3YXMgb2JzZXJ2ZWQsIGZpeAo+
ID4gdGhpcwo+ID4gYXMgdGhlIHNvZnR3YXJlIHNob3VsZCBhbHdheXMgY29tcGx5IHdpdGggdGhl
IHNwZWNpZmljYXRpb24uCj4gPiAKPiA+IEZpeCB0aGlzIGluIHRoZSBib290bG9hZGVyLCBhcyB0
aGlzIGlzIHRoZSBwb2ludCB3aGVyZSB0aGUKPiA+IHJlZmVyZW5jZQo+ID4gY2xvY2sgZ2V0cyBp
bml0aWFsaXplZCBhbmQgc3RhYmxlIGZpcnN0Lgo+IAo+IEkgd291bGQgcmVtb3ZlIHRoaXMgcGFy
YWdyYXBoIGFib3V0IHRoZSAiRml4IHRoaXMgaW4gdGhlCj4gYm9vdGxvYWRlci4uLiIKPiAKPiBE
b2Vzbid0IHBhdGNoIGFwcGx5IHRvIGJvdGggdGhlIGtlcm5lbCBhbmQgdGhlIGJvb3Rsb2FkZXIg
RkVDIGRyaXZlcj8KCllvdSBhcmUgcmlnaHQuIEkgbWlzc2VkIHRoYXQgdGhlIGtlcm5lbCBkcml2
ZXIgYWxzbyBoYXMgaW1wbGVtZW50ZWQKdGhhdCBwaHktcmVzZXQtZ3Bpb3MgaGFuZGxpbmcuIEkg
d2lsbCByZW1vdmUgdGhhdCBwYXJhZ3JhcGggaW4gYSB2Mi4KCj4gCj4gPiAKPiA+IFVzZSBncGlv
NCAyMywgd2hpY2ggaXMgY29ubmVjdGVkIHRvIHRoZSBwaHkgcmVzZXQgcGluLiBPbiB0aGUgc2Ft
ZQo+ID4gcGluCj4gPiBSWF9FUiB3YXMgdXNlZCBiZWZvcmUsIGJ1dCB0aGlzIHNpZ25hbCBpcyBv
cHRpb25hbCBhbmQgY2FuIGJlCj4gPiBkcm9wcGVkLgo+ID4gCj4gPiBOb3RlOiBUaGlzIGNvbWVz
IGludG8gZWZmZWN0IHdpdGggdGhlIHBoeUNPUkVzIFNPTSBoYXJkd2FyZQo+ID4gcmV2aXNpb24g
NC4KPiA+IEluIHJldmlzaW9ucyBiZWZvcmUsIHRoaXMgZ3BpbyBpcyBub3QgY29ubmVjdGVkLCBh
bmQgdGhlIHBoeSByZXNldAo+ID4gaXMKPiA+IG1hbmFnZWQgd2l0aCB0aGUgZ2xvYmFsIGhhcmR3
YXJlIHJlc2V0IGNpcmN1aXQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBTdG9p
ZG5lciA8Yy5zdG9pZG5lckBwaHl0ZWMuZGU+Cj4gPiAtLS0KPiA+IMKgYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvaW14OTMtcGh5Y29yZS1zb20uZHRzaSB8IDExCj4gPiArKysrKysrKy0t
LQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMt
cGh5Y29yZS1zb20uZHRzaQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg5
My1waHljb3JlLXNvbS5kdHNpCj4gPiBpbmRleCA4OGMyNjU3YjUwZTYuLmY4ZTJmM2YzYmFhOCAx
MDA2NDQKPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLXBoeWNv
cmUtc29tLmR0c2kKPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkz
LXBoeWNvcmUtc29tLmR0c2kKPiA+IEBAIC01OCw2ICs1OCw5IEBAICZmZWMgewo+ID4gwqAgPCZj
bGsgSU1YOTNfQ0xLX1NZU19QTExfUEZEMV9ESVYyPiwKPiA+IMKgIDwmY2xrIElNWDkzX0NMS19T
WVNfUExMX1BGRDFfRElWMj47Cj4gPiDCoCBhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDwxMDAwMDAw
MDA+LCA8NTAwMDAwMDA+LCA8NTAwMDAwMDA+Owo+ID4gKyBwaHktcmVzZXQtZ3Bpb3MgPSA8Jmdw
aW80IDIzIEdQSU9fQUNUSVZFX0hJR0g+Owo+ID4gKyBwaHktcmVzZXQtZHVyYXRpb24gPSA8MT47
Cj4gPiArIHBoeS1yZXNldC1wb3N0LWRlbGF5ID0gPDA+Owo+ID4gwqAgc3RhdHVzID0gIm9rYXki
Owo+ID4gwqAKPiA+IMKgIG1kaW86IG1kaW8gewo+ID4gQEAgLTkxLDE0ICs5NCwxNiBAQCBwaW5j
dHJsX2ZlYzogZmVjZ3JwIHsKPiA+IMKgIGZzbCxwaW5zID0gPAo+ID4gwqAgTVg5M19QQURfRU5F
VDJfTURDX19FTkVUMV9NREMgMHg1MGUKPiA+IMKgIE1YOTNfUEFEX0VORVQyX01ESU9fX0VORVQx
X01ESU8gMHg1MDIKPiA+IC0gTVg5M19QQURfRU5FVDJfUkQwX19FTkVUMV9SR01JSV9SRDAgMHg1
N2UKPiA+IC0gTVg5M19QQURfRU5FVDJfUkQxX19FTkVUMV9SR01JSV9SRDEgMHg1N2UKPiA+IC0g
TVg5M19QQURfRU5FVDJfUlhDX19FTkVUMV9SWF9FUiAweDVmZQo+ID4gKyAvKiB0aGUgdGhyZWUg
cGlucyBiZWxvdyBhcmUgY29ubmVjdGVkIHRvIFBIWXMgc3RyYXBzLAo+ID4gKyAqIHRoYXQgaXMg
d2hhdCB0aGUgcHVsbC11cC9kb3duIHNldHRpbmcgaXMgZm9yLiAqLwo+IAo+IEkgd291bGQgcmVt
b3ZlIHRoaXMgY29tbWVudCBhbmQgbWF5YmUgbW92ZSBpdCB0byB0aGUgY29tbWl0IG1zZyB3aHkK
PiBhcmUKPiB5b3UgY2hhbmdpbmcgdGhlIFBEL1BVIGNvbmZpZ3VyYXRpb24uCgpJIHRoaW5rIGl0
IGlzIGltcG9ydGFudCB0byBrbm93IHdoeSB0aGVzZSBQRC9QVSBhcmUgY29uZmlndXJlZCwgYmVj
YXVzZQpmb3IgdGhlIG5vcm1hbCBNRElPIGZ1bmN0aW9uYWxpdHkgUFUvUEQgaXMgbm90IG5lZWRl
ZC7CoEFuZCBpdCBpcyBub3QKc2VsZiBleHBsYWluaW5nIGhlcmUsIHRoYXQgY2hhbmdpbmcgdGhv
c2UgUEQvUFUgbWlnaHQgYnJlYWsgcGh5IGNvbmZpZy4KCkhvd2V2ZXIgSSB3aWxsIG9mIGNvdXJz
ZSBmaXggdGhlIHdhcm5pbmcgaW4gYSB2Mi4KClRoYW5rcywKQ2hyaXN0b3BoCgo+IAo+IEFueXdh
eSwgaWYgeW91IGRlY2lkZSB0byBrZWVwIGl0LCB5b3UgbmVlZCB0byBmaXggdGhlIGZvbGxvd2lu
Zwo+IHdhcm5pbmc6Cj4gCj4gV0FSTklORzogQmxvY2sgY29tbWVudHMgdXNlIGEgdHJhaWxpbmcg
Ki8gb24gYSBzZXBhcmF0ZSBsaW5lCj4gIzQ2OiBGSUxFOiBhcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg5My1waHljb3JlLXNvbS5kdHNpOjk4Ogo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogdGhhdCBpcyB3aGF0IHRoZSBwdWxsLXVwL2Rv
d24gc2V0dGluZyBpcwo+IGZvci4gKi8KPiAKPiBCUiwKPiBQcmltb3oKPiAKPiA+ICsgTVg5M19Q
QURfRU5FVDJfUkQwX19FTkVUMV9SR01JSV9SRDAgMHgzN2UKPiA+ICsgTVg5M19QQURfRU5FVDJf
UkQxX19FTkVUMV9SR01JSV9SRDEgMHgzN2UKPiA+IMKgIE1YOTNfUEFEX0VORVQyX1JYX0NUTF9f
RU5FVDFfUkdNSUlfUlhfQ1RMIDB4NTdlCj4gPiDCoCBNWDkzX1BBRF9FTkVUMl9URDBfX0VORVQx
X1JHTUlJX1REMCAweDUwZQo+ID4gwqAgTVg5M19QQURfRU5FVDJfVEQxX19FTkVUMV9SR01JSV9U
RDEgMHg1MGUKPiA+IMKgIE1YOTNfUEFEX0VORVQyX1RYX0NUTF9fRU5FVDFfUkdNSUlfVFhfQ1RM
IDB4NTBlCj4gPiDCoCBNWDkzX1BBRF9FTkVUMl9URDJfX0VORVQxX1RYX0NMSyAweDQwMDAwNTBl
Cj4gPiArIE1YOTNfUEFEX0VORVQyX1JYQ19fR1BJTzRfSU8yMyAweDUxZQo+ID4gwqAgPjsKPiA+
IMKgIH07Cj4gPiDCoAo+IAo=
