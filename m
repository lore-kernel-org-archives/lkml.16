Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2092.outbound.protection.outlook.com [40.107.104.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C438E19F11F;
	Fri, 28 Mar 2025 07:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743146464; cv=fail; b=Cf8EDXFXDAyPj3J7kLZPKVp43t1shvsI4WSo1lknvvJ/Hm8jz+wKGdrRGnS7Hd5MqJ2EBYMiFaoQTCNCmkm4hXPDvJPQJWnhZAeOUkJ5z+ieUb4jCH6n+znnBNNvpsJou0mRrL72DuoY1YMRsJgAjTVeLKNvtjLFlnqp3BxhPMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743146464; c=relaxed/simple;
	bh=iCGkT05vjNsiAFtWYEw7+YrrLCEjU/rsZCo94nlXWp4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u2BWshdAd3FfGtK2C9Cd5i7wkLWIkdMG6+Yz7Z+az3+nXUOiHNoi/7Ba12ivxngduW32dzMm65dVajrpKTN22Wo9ZlV0WlnO/NqXQGHOU6vWdRc1HFtYzHX8K6D26JJcpx49cQYcJxUc7PDNyCKzatGk8wTkrTEph7WfnYmhywg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=cIl/V95E; arc=fail smtp.client-ip=40.107.104.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="cIl/V95E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpzQrr7bRYImiTtnWvFHUDyvDj89DEKI2qjHx/Na2vBqehzoywRUNWd1TqK9a69TmzjYjtqmYF30TCpUe35rgmdcDWiL+ab1p7nEWp7TUrCMSj/1YnJitLSdkC3k9Sg50PvAdsOlKjb3wrUTJ6/R9FSJyiAm1kCC+GPW7p0h0featIeoFqLZMBkCtMFBm41+Ft1JsnY8df4U5nsY8ne6RabWD8PA4RFuguKZ/MgXv0lYjMS1L39L8QxuisoPc1/LP55/jRyBx1f6Ly+1oOhJQ1vhXEQueuXOEFfSbEo6bT4UEy6pBSgA97ttG1ftzi2HikQeviLOF18oFaBpgLrsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFioYwPxGtQyikYSEUQV+3h5Uc6ZEn9cWCbVZhNn4x4=;
 b=q3DsJuXtxRlS7DYVz6pjs9famOkaTBWd2Sz1D91KP88ryZIQDmcFT0QdnpDsB4zjheSeIqSIrwx9F9WI27E4yTmH2FZCUn3AoXcVY0IMFCTZ8U/kI80kqJch+zExscc0foKR78oYM0rmT1pjGR6xr6H1vsvDG7JFB7hUrf3V94ByrKw8ub5RoJeCd+4PtfOQP6lVMjS5KoDOEHLHl3x75CbwNmAv7fLHgDzmM2aR2m73Z5TwpBIJWE5TJ/FKcCWpW03nlHdsJZhIeMq4EDl3gUufF4eWQCmqjS7Y5a28g6XQ2VLt3qnW/jeGtYt05aLoIjFy2yto03rPYZc3S4urlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFioYwPxGtQyikYSEUQV+3h5Uc6ZEn9cWCbVZhNn4x4=;
 b=cIl/V95ETaPWuxZmZFvjhCdVQckMSEf1TLWyBU9n7C3wCjRo2XR/odZoqJJ0PztkB059ORO2EjbIGrZkn32oFO4FKRy1gXuGamxMlAfqJ5tj/lNQOJ2I4hF+XrLWyqC07T9Vh49a4180Ovc+07UuAWXcFdm9cOlyF/QafrW78su1JfdcLq8uofl2YkF4GY+F1XjTWeNXsySLB5I36aR6Gk+K6Dik050ctawUBoTMY0TdSO6Ie29vq4+FcL8AGyNcvwzr3wg8C6SBXFGQ1vlc/jQdDwLQSqaoC3UOaUC/HcOVrYlaIK8RtqITONmf9tsp52F+9thy/FxujU3EFCodRg==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by AS8PR04MB8117.eurprd04.prod.outlook.com (2603:10a6:20b:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 07:20:57 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 07:20:56 +0000
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
Thread-Index: AQHbnzP0liYa0ITeuEOAzYMZFD0o3LOII4wi
Date: Fri, 28 Mar 2025 07:20:56 +0000
Message-ID:
 <PA4PR04MB7630DD14BB8A55B57487B790C5A02@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
 <20250327-initial_display-v3-5-4e89ea1676ab@gocontroll.com>
 <Z+V6VAZLqIPuEsmk@lizhi-Precision-Tower-5810>
In-Reply-To: <Z+V6VAZLqIPuEsmk@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|AS8PR04MB8117:EE_
x-ms-office365-filtering-correlation-id: 4e049df1-6105-4da9-2718-08dd6dc9152d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?U+qLnBmy2dcsampKVfiumeaAKhNCDbRlzk3wcsp9Dka0VVUd/jLWoF0137?=
 =?iso-8859-1?Q?mFpl+nzWBCyBlDtTGCcf5kPy5pkp1jMJeXhGVJP8zBSQuwe57la/yeDtLj?=
 =?iso-8859-1?Q?S6zv9bTX3zO6scpbFWbq0rQ3acsJ8l4IRbHofSW/zgKMVidGaI/o4CZSW/?=
 =?iso-8859-1?Q?JpFs305ZsA1bZI2F2LqjPIa278JUHPRFar2ddtrJ5jlMjG7ySY3XtRXBEt?=
 =?iso-8859-1?Q?UVefP0MF1qFKLgbuwPe/J/0m45RVVVCzdfSx8lYlxMo4jKwqBtwEsxh1F6?=
 =?iso-8859-1?Q?VrTNH1elGRHK9m73OESl/Y+gz5TqBa+zr4sNxtLeYHaSr7OIk8ASXf1/63?=
 =?iso-8859-1?Q?fl9GpI8TV0qKUJE0BIXL4TMOcS2uIr6UcLf+DtLJUu2aTQEDk7lA7s8Z5j?=
 =?iso-8859-1?Q?3HjZqNFp4UR6M6FepsNXT0NdglkJB/fSdCKebHpGX+QCLLOmIyHUjW5fb/?=
 =?iso-8859-1?Q?fUG/GGEYWntPoYPzqhHB3StyGgPJcTco4VtwFgc5rDWVBfYEGX3k24AZdr?=
 =?iso-8859-1?Q?dhZOxgBcTrb4qgyUSsmx3pRRtz7KgwdlC4ZnsHVgdIhkZWK1wFd79sl43E?=
 =?iso-8859-1?Q?lnbwj1hbVAzitxvbdbArVaAjEoVek56y8dC3oYzZxzjvc3thBsHf6xAHxL?=
 =?iso-8859-1?Q?CZ+++ICBclXL8lIQNWM4PFnbEZFy9N+MgVndLVyF3Z7LQqjWlcXgtQ5A9/?=
 =?iso-8859-1?Q?4KQSmF+wRMur4ii7vA2JCmqLpjxDfGzq92FWwxk1ButFYEgS4wti8TJXQd?=
 =?iso-8859-1?Q?cdNBsNhRgCpcJIwTTc2aT57kTI4zx1K+UY6hkb1JFvB2HGhb/4zDB0w+Ko?=
 =?iso-8859-1?Q?8gV57l0k0seuZ9YBg/A2nIqz28QhLeMYyKIyjzKSLBac18+KSzBAoJCovE?=
 =?iso-8859-1?Q?fuXv5z2B8glN11CGYQADNnX2IPydLf8zTVZDFX3uOWxF/iVdmS/r7+Ww/V?=
 =?iso-8859-1?Q?2GHth2bVVUE9BIsJ47rQUK1BdcGhjBIcT5kxJwgyC6fdBFfCG0x9+TuZzj?=
 =?iso-8859-1?Q?p9FRr1OFiQ0nek3xPznnly+3pyjWHhDpX42INUcrCgMGk7mzPbWf8ZB+T+?=
 =?iso-8859-1?Q?pmQaGC/AtyaQQi13ZINKvA1FyM0SLOAFKXH3+pGhBwBuoITdWI1JEsNdOo?=
 =?iso-8859-1?Q?9JaZ/L6+FYHII6KQSX+D3OG8Poqu8oGVKBloA7BfkCsBHdjmp4wg1+1Zuk?=
 =?iso-8859-1?Q?rtlWWk2DAWHdQJ2H7mmGAhzQ84qXqxP/ep8VZ6B/Dgo7TewNN4Ed3HCtk4?=
 =?iso-8859-1?Q?j5vLSIeokK8J7xwVCoKNCuWJ+vpJPX2Qehuvs04oFi2tY44BHs/6Epu6kv?=
 =?iso-8859-1?Q?3utJein3cJhwIhGqG0FcPjr0CoWCM6PbKKQrC2uk1Ho9Bt88MIruIY7nNN?=
 =?iso-8859-1?Q?LnpgXp1niz4x2YGkngZKYJg3oKdPuz3/x+GxoR2cqYduN+O/Oef3hNvCSx?=
 =?iso-8859-1?Q?qIznhpeQURofTrnlrTJLGH+D7X3yJAgOJY02AGG7iwI4CN6EaiRUU4qW4J?=
 =?iso-8859-1?Q?cIazKo2feXYOeiYr4gmxUI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?WzUTtx1vu8SP9U+jZBgeMbuN3pIoZ9NQikmoZSr1ztTqVEexOi7SEpk5pS?=
 =?iso-8859-1?Q?dG9sYlszR8M6U3UYF6aGJVQUW0BW3u4If2e5u4TIQDSzyCBjc96y/VcwwX?=
 =?iso-8859-1?Q?uwkmzcprbJNVl/lQqE9NaMhdPTVSQ+A25WKwOgbvwHLIIc1xd78AyMYg83?=
 =?iso-8859-1?Q?fHZZl/aTvcPzpvhfWmIvHVL4jZw0ZrF5gHC0KPhL8Wq/Uw1n7I1hnZm5wn?=
 =?iso-8859-1?Q?64MgAvm5OcAKl40eT9078Ys7NIXv7ziK3UVPEcVHjRzKKQUxkfekVvS0F7?=
 =?iso-8859-1?Q?AsfZOUmfHLCYxmyt2+wCrAuXgEu0OSBcpdhNuClAEuTyrO02JsIUNc5wfF?=
 =?iso-8859-1?Q?KLSYoitEnIOZU/vDpInAKPMZ87FkmUsugbqDW1hI4KZPkSiCG7sZXbf2qX?=
 =?iso-8859-1?Q?RYQNmt1j3j7cX6h1wxxQEVhpw7SFCreRBIiMGNpwpXKc9TlMuujB1BtHmU?=
 =?iso-8859-1?Q?2aC+KYcA/IjCSP8hKUiI3p7ItMNnOLDuRaDDEre47ecLSGOolNAYXlrh88?=
 =?iso-8859-1?Q?6IWIh2I0KKYOK7oAIMP91BdhVN5nt+qRt/RVy3FzJumGLSGyjjIvD9vs1q?=
 =?iso-8859-1?Q?MEiHyfrV/85M7N26w0kUN5t7XKA61hBuKzjkvyRkJuFOpfkoy3kUySIeVO?=
 =?iso-8859-1?Q?G+cxRrur58xUKxoM/phx2pW8IO995jHE7SPGjAJxSxm1Z0RTE7mPa6jeAw?=
 =?iso-8859-1?Q?eRYk2ouOnWM10/bvn7Rdy0a3ZxIL5r7e8HbYXeLoZoVajc34ImHQ5+5vm7?=
 =?iso-8859-1?Q?4NMOZI2Y69NMw68Egwq57zgntYaJCxcrn5eX5TiLj3N7vlLYxfmjgcLpFs?=
 =?iso-8859-1?Q?Lk4JVaNo9WxO1r03ChePDZLd56FT+5Itne/oMndUNOnlV0ysANCMoKEAgO?=
 =?iso-8859-1?Q?ksHQEgFi9eUmyWcVpHSAeo4TbW8VkAFDh1Vz0uFPsYrvz1PFKBwBLiv44X?=
 =?iso-8859-1?Q?kReCnncsayKck4VAChMv5dRX9fsekFXGWwvolr3G42Gv2Sy9eoZ3zKLCp0?=
 =?iso-8859-1?Q?xL8qHkZD/6BgAtoPZa3VLmLCImXBnodEhHi5PwZEqXbBwmtProrZoaWbHm?=
 =?iso-8859-1?Q?qWXXHI7rbCuCCSevzbVLvmtZViK/cE43Ri5wZXockutNkQsxe9HMtVUDVz?=
 =?iso-8859-1?Q?QKejwa/ZHZdTRQLQCZZRM0HbW6y43/2yQTEyMSCIyBKA+IChiSxbjdhmnO?=
 =?iso-8859-1?Q?t0/xPaDlWdQVpN6QCL9MI0Tn3LSPydweykZrwRvhjLSW+1hHKBnDE5sPNQ?=
 =?iso-8859-1?Q?+e5fR/2gkGx6JhDyaoEIh77aVl5sRvV6mVtIppGY/1lHNO57yS6+pwObO2?=
 =?iso-8859-1?Q?nZDUSCQz7zfN7THTKgAM5QyWWgpQFXd4kRjiGCMvZSMB6ZBaQtMm3tv12c?=
 =?iso-8859-1?Q?Qibxh9QQrd+R2HqdVuC4NDAchkYQh1i9uwixNR84Ff0RisFihxeWYSd5kR?=
 =?iso-8859-1?Q?XjEq3VZhS1nTlUnLnEm9beXHnJnWYmTQ6br3282opyeK6T6VVbLMVhSH4z?=
 =?iso-8859-1?Q?UJf23CK8ZcL33MjvCCtNVmN99yKocRKQIbpyAHDKFhlLp8pbyA3aeog7is?=
 =?iso-8859-1?Q?bzh97iSIs0bwiNCHUFyiSeQPzWZ9FFtghugj/ShtYUUuUQQxFaY4Q3Ekiv?=
 =?iso-8859-1?Q?pRrHKmG5qRcghQ8DJY/zx4gXwzq2DtfhQOaRwMIgphMCDEZlYozwWLHZEU?=
 =?iso-8859-1?Q?yRyKGyjH5MhBu5t8SIBjmOTwfwtWPNYjY/xJGPlal7WchrWUVTuqx/vNoI?=
 =?iso-8859-1?Q?TJ+w=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e049df1-6105-4da9-2718-08dd6dc9152d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2025 07:20:56.7213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HTvluwHUmh+eYTGP5s2GhpH5WciTQJenTQ+vVGQm7yDw+wB0k2AVRMVQAzE3POOPBhamH6QjYNhBggJibooGqg8qVar73BXJvm297jlY8II=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8117

=0A=
From:=A0Frank Li <Frank.li@nxp.com>=0A=
Sent:=A0Thursday, March 27, 2025 5:18 PM=0A=
=A0=0A=
> On Thu, Mar 27, 2025 at 04:52:40PM +0100, Maud Spierings via B4 Relay wro=
te:=0A=
>> From: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>=0A=
>> The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It has=
=0A=
>> 2 GB or ram and 8 GB of eMMC storage on board.=0A=
>>=0A=
>> Add it to enable boards based on this Module=0A=
>>=0A=
>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>> ---=0A=
>>  .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 549 ++++++++++++++=
+++++++=0A=
>>  1 file changed, 549 insertions(+)=0A=
>>=0A=
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi=0A=
>> new file mode 100644=0A=
>> index 0000000000000000000000000000000000000000..9c4304e909b96afeb6296219=
8da377319eda8506=0A=
>> --- /dev/null=0A=
> =0A=
> New dts files, suggest run https://github.com/lznuaa/dt-format to make=0A=
> nodes and property ordered.=0A=
=0A=
Ah I didn't know there is a tool for that, never seen it before, will=0A=
check it out.=0A=
=0A=
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi=0A=
>> @@ -0,0 +1,549 @@=0A=
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)=0A=
>> +/*=0A=
>> + * Copyright (C) 2020 Lothar Wa=DFmann <LW@KARO-electronics.de>=0A=
>> + * 2025 Maud Spierings <maudspierings@gocontroll.com>=0A=
>> + */=0A=
>> +=0A=
>> +#include "imx8mp.dtsi"=0A=
>> +=0A=
>> +/ {=0A=
>> +     /* PHY regulator */=0A=
>> +     regulator-3v3-etn {=0A=
>> +             compatible =3D "regulator-fixed";=0A=
>> +             pinctrl-names =3D "default";=0A=
>> +             pinctrl-0 =3D <&pinctrl_reg_3v3_etn>;=0A=
>> +             regulator-name =3D "3v3-etn";=0A=
>> +             regulator-min-microvolt =3D <3300000>;=0A=
>> +             regulator-max-microvolt =3D <3300000>;=0A=
>> +             vin-supply =3D <&reg_vdd_3v3>;=0A=
>> +             gpios =3D <&gpio1 23 GPIO_ACTIVE_HIGH>;=0A=
>> +             enable-active-high;=0A=
>> +             regulator-always-on;=0A=
>> +             regulator-boot-on;=0A=
>> +     };=0A=
>> +};=0A=
>> +=0A=
>> +&A53_0 {=0A=
>> +     cpu-supply =3D <&reg_vdd_arm>;=0A=
>> +};=0A=
>> +=0A=
>> +&A53_1 {=0A=
>> +     cpu-supply =3D <&reg_vdd_arm>;=0A=
>> +};=0A=
>> +=0A=
>> +&A53_2 {=0A=
>> +     cpu-supply =3D <&reg_vdd_arm>;=0A=
>> +};=0A=
>> +=0A=
>> +&A53_3 {=0A=
>> +     cpu-supply =3D <&reg_vdd_arm>;=0A=
>> +};=0A=
>> +=0A=
>> +=0A=
>> +&eqos {=0A=
>> +     pinctrl-names =3D "default", "sleep";=0A=
>> +     pinctrl-0 =3D <&pinctrl_eqos>;=0A=
>> +     pinctrl-1 =3D <&pinctrl_eqos_sleep>;=0A=
>> +     assigned-clocks =3D <&clk IMX8MP_CLK_ENET_AXI>,=0A=
>> +                       <&clk IMX8MP_CLK_ENET_QOS_TIMER>,=0A=
>> +                       <&clk IMX8MP_CLK_ENET_QOS>;=0A=
>> +     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_266M>,=0A=
>> +                              <&clk IMX8MP_SYS_PLL2_100M>,=0A=
>> +                              <&clk IMX8MP_SYS_PLL2_50M>;=0A=
>> +     assigned-clock-rates =3D <0>, <100000000>, <50000000>;=0A=
>> +     phy-mode =3D "rmii";=0A=
>> +     phy-handle =3D <&ethphy0>;=0A=
>> +     status =3D "okay";=0A=
>> +=0A=
>> +     mdio {=0A=
>> +             #address-cells =3D <1>;=0A=
>> +             #size-cells =3D <0>;=0A=
>> +             compatible =3D "snps,dwmac-mdio";=0A=
> =0A=
> "compatible" should be first property.=0A=
=0A=
whoops, I guess copy paste mistake from the original, will fix.=0A=
=0A=
>> +             pinctrl-names =3D "default";=0A=
>> +             pinctrl-0 =3D <&pinctrl_ethphy_rst_b>;=0A=
>> +             reset-gpios =3D <&gpio4 22 GPIO_ACTIVE_LOW>;=0A=
>> +             reset-delay-us =3D <25000>;=0A=
>> +=0A=
>> +             ethphy0: ethernet-phy@0 {=0A=
>> +                     reg =3D <0>;=0A=
>> +                     pinctrl-names =3D "default";=0A=
>> +                     pinctrl-0 =3D <&pinctrl_ethphy_int_b>;=0A=
>> +                     interrupt-parent =3D <&gpio4>;=0A=
>> +                     interrupts =3D <21 IRQ_TYPE_EDGE_FALLING>;=0A=
>> +                     clocks =3D <&clk IMX8MP_CLK_ENET_QOS>;=0A=
>> +                     smsc,disable-energy-detect;=0A=
>> +             };=0A=
>> +     };=0A=
>> +};=0A=
>> +=0A=
>> +&gpio1 {=0A=
>> +     gpio-line-names =3D "SODIMM_152",=0A=
>> +             "SODIMM_42",=0A=
>> +             "PMIC_WDOG_B SODIMM_153",=0A=
>> +             "PMIC_IRQ_B",=0A=
>> +             "SODIMM_154",=0A=
>> +             "SODIMM_155",=0A=
>> +             "SODIMM_156",=0A=
>> +             "SODIMM_157",=0A=
>> +             "SODIMM_158",=0A=
>> +             "SODIMM_159",=0A=
>> +             "SODIMM_161",=0A=
>> +             "SODIMM_162",=0A=
>> +             "SODIMM_34",=0A=
>> +             "SODIMM_36",=0A=
>> +             "SODIMM_27",=0A=
>> +             "SODIMM_28",=0A=
>> +             "ENET_MDC",=0A=
>> +             "ENET_MDIO",=0A=
>> +             "",=0A=
>> +             "ENET_XTAL1/CLKIN",=0A=
>> +             "ENET_TXD1",=0A=
>> +             "ENET_TXD0",=0A=
>> +             "ENET_TXEN",=0A=
>> +             "ENET_POWER",=0A=
>> +             "ENET_COL/CRS_DV",=0A=
>> +             "ENET_RXER",=0A=
>> +             "ENET_RXD0",=0A=
>> +             "ENET_RXD1",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "";=0A=
>> +};=0A=
>> +=0A=
>> +&gpio2 {=0A=
>> +     gpio-line-names =3D "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "SODIMM_51",=0A=
>> +             "SODIMM_57",=0A=
>> +             "SODIMM_56",=0A=
>> +             "SODIMM_52",=0A=
>> +             "SODIMM_53",=0A=
>> +             "SODIMM_54",=0A=
>> +             "SODIMM_55",=0A=
>> +             "SODIMM_15",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "";=0A=
>> +};=0A=
>> +=0A=
>> +&gpio3 {=0A=
>> +     gpio-line-names =3D "",=0A=
>> +             "",=0A=
>> +             "EMMC_DS",=0A=
>> +             "EMMC_DAT5",=0A=
>> +             "EMMC_DAT6",=0A=
>> +             "EMMC_DAT7",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "EMMC_DAT0",=0A=
>> +             "EMMC_DAT1",=0A=
>> +             "EMMC_DAT2",=0A=
>> +             "EMMC_DAT3",=0A=
>> +             "",=0A=
>> +             "EMMC_DAT4",=0A=
>> +             "",=0A=
>> +             "EMMC_CLK",=0A=
>> +             "EMMC_CMD",=0A=
>> +             "SODIMM_75",=0A=
>> +             "SODIMM_145",=0A=
>> +             "SODIMM_163",=0A=
>> +             "SODIMM_164",=0A=
>> +             "SODIMM_165",=0A=
>> +             "SODIMM_143",=0A=
>> +             "SODIMM_144",=0A=
>> +             "SODIMM_72",=0A=
>> +             "SODIMM_73",=0A=
>> +             "SODIMM_74",=0A=
>> +             "SODIMM_93",=0A=
>> +             "",=0A=
>> +             "";=0A=
>> +};=0A=
>> +=0A=
>> +&gpio4 {=0A=
>> +     gpio-line-names =3D "SODIMM_98",=0A=
>> +             "SODIMM_99",=0A=
>> +             "SODIMM_100",=0A=
>> +             "SODIMM_101",=0A=
>> +             "SODIMM_45",=0A=
>> +             "SODIMM_43",=0A=
>> +             "SODIMM_105",=0A=
>> +             "SODIMM_106",=0A=
>> +             "SODIMM_107",=0A=
>> +             "SODIMM_108",=0A=
>> +             "SODIMM_104",=0A=
>> +             "SODIMM_103",=0A=
>> +             "SODIMM_115",=0A=
>> +             "SODIMM_114",=0A=
>> +             "SODIMM_113",=0A=
>> +             "SODIMM_112",=0A=
>> +             "SODIMM_109",=0A=
>> +             "SODIMM_110",=0A=
>> +             "SODIMM_95",=0A=
>> +             "SODIMM_96",=0A=
>> +             "SODIMM_97",=0A=
>> +             "ENET_nINT",=0A=
>> +             "ENET_nRST",=0A=
>> +             "SODIMM_84",=0A=
>> +             "SODIMM_87",=0A=
>> +             "SODIMM_86",=0A=
>> +             "SODIMM_85",=0A=
>> +             "SODIMM_83",=0A=
>> +             "",=0A=
>> +             "SODIMM_66",=0A=
>> +             "SODIMM_65",=0A=
>> +             "";=0A=
>> +};=0A=
>> +=0A=
>> +&gpio5 {=0A=
>> +     gpio-line-names =3D "",=0A=
>> +             "",=0A=
>> +             "",=0A=
>> +             "SODIMM_76",=0A=
>> +             "SODIMM_81",=0A=
>> +             "SODIMM_146",=0A=
>> +             "SODIMM_48",=0A=
>> +             "SODIMM_46",=0A=
>> +             "SODIMM_47",=0A=
>> +             "SODIMM_44",=0A=
>> +             "SODIMM_49",=0A=
>> +             "",=0A=
>> +             "SODIMM_70",=0A=
>> +             "SODIMM_69",=0A=
>> +             "PMIC_SCL",=0A=
>> +             "PMIC_SDA",=0A=
>> +             "SODIMM_41",=0A=
>> +             "SODIMM_40",=0A=
>> +             "SODIMM_148",=0A=
>> +             "SODIMM_149",=0A=
>> +             "SODIMM_150",=0A=
>> +             "SODIMM_151",=0A=
>> +             "SODIMM_60",=0A=
>> +             "SODIMM_59",=0A=
>> +             "SODIMM_64",=0A=
>> +             "SODIMM_63",=0A=
>> +             "SODIMM_62",=0A=
>> +             "SODIMM_61",=0A=
>> +             "SODIMM_68",=0A=
>> +             "SODIMM_67",=0A=
>> +             "",=0A=
>> +             "";=0A=
>> +};=0A=
>> +=0A=
>> +&i2c1 {=0A=
>> +     pinctrl-names =3D "default", "gpio";=0A=
>> +     pinctrl-0 =3D <&pinctrl_i2c1>;=0A=
>> +     pinctrl-1 =3D <&pinctrl_i2c1_gpio>;=0A=
>> +     clock-frequency =3D <400000>;=0A=
>> +     scl-gpios =3D <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;=0A=
>> +     sda-gpios =3D <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;=0A=
>> +     status =3D "okay";=0A=
>> +=0A=
>> +     pmic@25 {=0A=
>> +             reg =3D <0x25>;=0A=
>> +             compatible =3D "nxp,pca9450c";=0A=
> =0A=
> Compatible is first,  reg is second.=0A=
=0A=
whoops, I guess copy paste mistake from the original, will fix.=0A=
=0A=
>> +             pinctrl-names =3D "default";=0A=
>> +             pinctrl-0 =3D <&pinctrl_pmic>;=0A=
>> +             interrupt-parent =3D <&gpio1>;=0A=
>> +             interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;=0A=
>> +=0A=
>> +             regulators {=0A=
>> +                     reg_vdd_soc: BUCK1 {=0A=
>> +                             regulator-name =3D "vdd-soc";=0A=
>> +                             regulator-min-microvolt =3D <805000>;=0A=
>> +                             regulator-max-microvolt =3D <900000>;=0A=
>> +                             regulator-boot-on;=0A=
>> +                             regulator-always-on;=0A=
>> +                             regulator-ramp-delay =3D <3125>;=0A=
>> +                     };=0A=
>> +=0A=
>> +                     reg_vdd_arm: BUCK2 {=0A=
>> +                             regulator-name =3D "vdd-core";=0A=
>> +                             regulator-min-microvolt =3D <805000>;=0A=
>> +                             regulator-max-microvolt =3D <950000>;=0A=
>> +                             regulator-boot-on;=0A=
>> +                             regulator-always-on;=0A=
>> +                             regulator-ramp-delay =3D <3125>;=0A=
>> +                             nxp,dvs-run-voltage =3D <950000>;=0A=
>> +                             nxp,dvs-standby-voltage =3D <850000>;=0A=
>> +                     };=0A=
>> +=0A=
>> +                     reg_vdd_3v3: BUCK4 {=0A=
>> +                             regulator-name =3D "3v3";=0A=
>> +                             regulator-min-microvolt =3D <3300000>;=0A=
>> +                             regulator-max-microvolt =3D <3300000>;=0A=
>> +                             regulator-boot-on;=0A=
>> +                             regulator-always-on;=0A=
>> +                     };=0A=
>> +=0A=
>> +                     reg_nvcc_nand: BUCK5 {=0A=
>> +                             regulator-name =3D "nvcc-nand";=0A=
>> +                             regulator-min-microvolt =3D <1800000>;=0A=
>> +                             regulator-max-microvolt =3D <1800000>;=0A=
>> +                             regulator-boot-on;=0A=
>> +                             regulator-always-on;=0A=
>> +                     };=0A=
>> +=0A=
>> +                     reg_nvcc_dram: BUCK6 {=0A=
>> +                             regulator-name =3D "nvcc-dram";=0A=
>> +                             regulator-min-microvolt =3D <1100000>;=0A=
>> +                             regulator-max-microvolt =3D <1100000>;=0A=
>> +                             regulator-boot-on;=0A=
>> +                             regulator-always-on;=0A=
>> +                     };=0A=
>> +=0A=
>> +                     reg_snvs_1v8: LDO1 {=0A=
>> +                             regulator-name =3D "snvs-1v8";=0A=
>> +                             regulator-min-microvolt =3D <1800000>;=0A=
>> +                             regulator-max-microvolt =3D <1800000>;=0A=
>> +                             regulator-boot-on;=0A=
>> +                             regulator-always-on;=0A=
>> +                     };=0A=
>> +=0A=
>> +                     ldo2_reg: LDO2 {=0A=
>> +                             regulator-name =3D "LDO2";=0A=
>> +                             regulator-min-microvolt =3D <800000>;=0A=
>> +                             regulator-max-microvolt =3D <1150000>;=0A=
>> +                             regulator-always-on;=0A=
>> +                     };=0A=
>> +=0A=
>> +                     reg_vdda_1v8: LDO3 {=0A=
>> +                             regulator-name =3D "vdda-1v8";=0A=
>> +                             regulator-min-microvolt =3D <1800000>;=0A=
>> +                             regulator-max-microvolt =3D <1800000>;=0A=
>> +                             regulator-boot-on;=0A=
>> +                             regulator-always-on;=0A=
>> +                     };=0A=
>> +=0A=
>> +                     ldo4_reg: LDO4 {=0A=
>> +                             regulator-name =3D "LDO4";=0A=
>> +                             regulator-min-microvolt =3D <800000>;=0A=
>> +                             regulator-max-microvolt =3D <3300000>;=0A=
>> +                     };=0A=
>> +=0A=
>> +                     ldo5_reg: LDO5 {=0A=
>> +                             regulator-name =3D "LDO5";=0A=
>> +                             regulator-min-microvolt =3D <1800000>;=0A=
>> +                             regulator-max-microvolt =3D <3300000>;=0A=
>> +                             regulator-boot-on;=0A=
>> +                             regulator-always-on;=0A=
>> +                     };=0A=
>> +             };=0A=
>> +     };=0A=
>> +};=0A=
>> +=0A=
>> +&usdhc3 { /* eMMC */=0A=
>> +     max-frequency =3D <200000000>;=0A=
>> +     assigned-clocks =3D <&clk IMX8MP_CLK_USDHC3>;=0A=
>> +     assigned-clock-rates =3D <200000000>;=0A=
>> +     pinctrl-names =3D "default", "state_100mhz", "state_200mhz";=0A=
>> +     pinctrl-0 =3D <&pinctrl_usdhc3>;=0A=
>> +     pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;=0A=
>> +     pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;=0A=
>> +     bus-width =3D <8>;=0A=
>> +     vmmc-supply =3D <&reg_vdd_3v3>;=0A=
>> +     vqmmc-supply =3D <&reg_nvcc_nand>;=0A=
>> +     voltage-ranges =3D <3300 3300>;=0A=
>> +     non-removable;=0A=
>> +     status =3D "okay";=0A=
>> +};=0A=
>> +=0A=
>> +&iomuxc {=0A=
>> +     pinctrl_eqos: eqosgrp {=0A=
>> +             fsl,pins =3D <=0A=
>> +                     MX8MP_IOMUXC_ENET_TD2__CCM_ENET_QOS_CLOCK_GENERATE=
_REF_CLK=0A=
>> +                     (MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE =
| MX8MP_SION)=0A=
>> +                     MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC=0A=
>> +                     (MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)=
=0A=
>> +                     MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO=0A=
>> +                     (MX8MP_DSE_X4 | MX8MP_PULL_UP | MX8MP_PULL_ENABLE)=
=0A=
>> +                     MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST)=0A=
>> +                     MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST)=0A=
>> +                     MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENAB=
LE)=0A=
>> +                     MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_PULL_ENAB=
LE)=0A=
>> +                     MX8MP_IOMUXC_ENET_RXC__ENET_QOS_RX_ER=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_ENABL=
E)=0A=
>> +                     MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST)=0A=
>> +             >;=0A=
>> +     };=0A=
>> +=0A=
>> +     pinctrl_eqos_sleep: eqos-sleep-grp {=0A=
>> +             fsl,pins =3D <=0A=
>> +                     MX8MP_IOMUXC_ENET_TD2__GPIO1_IO19=0A=
>> +                     (MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_ENET_MDC__GPIO1_IO16=0A=
>> +                     (MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_ENET_MDIO__GPIO1_IO17=0A=
>> +                     (MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_ENET_TD0__GPIO1_IO21=0A=
>> +                     (MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_ENET_TD1__GPIO1_IO20=0A=
>> +                     (MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_ENET_RD0__GPIO1_IO26=0A=
>> +                     (MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_ENET_RD1__GPIO1_IO27=0A=
>> +                     (MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_ENET_RXC__GPIO1_IO25=0A=
>> +                     (MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_ENET_RX_CTL__GPIO1_IO24=0A=
>> +                     (MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_ENET_TX_CTL__GPIO1_IO22=0A=
>> +                     (MX8MP_ODE_ENABLE | MX8MP_PULL_ENABLE)=0A=
>> +             >;=0A=
>> +     };=0A=
>> +=0A=
>> +     pinctrl_ethphy_int_b: ethphy-int-bgrp {=0A=
>> +             fsl,pins =3D <=0A=
>> +                     MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT)=0A=
>> +             >;=0A=
>> +     };=0A=
>> +=0A=
>> +     pinctrl_ethphy_rst_b: ethphy-rst-bgrp {=0A=
>> +             fsl,pins =3D <=0A=
>> +                     MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22=0A=
>> +                     (MX8MP_PULL_UP | MX8MP_PULL_ENABLE)=0A=
>> +             >;=0A=
>> +     };=0A=
>> +=0A=
>> +     pinctrl_i2c1: i2c1grp {=0A=
>> +             fsl,pins =3D <=0A=
>> +                     MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT =
| MX8MP_PULL_ENABLE | MX8MP_SION)=0A=
>> +                     MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT =
| MX8MP_PULL_ENABLE | MX8MP_SION)=0A=
>> +             >;=0A=
>> +     };=0A=
>> +=0A=
>> +     pinctrl_i2c1_gpio: i2c1-gpiogrp {=0A=
>> +             fsl,pins =3D <=0A=
>> +                     MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT =
| MX8MP_PULL_ENABLE | MX8MP_SION)=0A=
>> +                     MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_PULL_UP | MX8MP_HYS_SCHMITT =
| MX8MP_PULL_ENABLE | MX8MP_SION)=0A=
>> +             >;=0A=
>> +     };=0A=
>> +=0A=
>> +     pinctrl_pmic: pmicgrp {=0A=
>> +             fsl,pins =3D <=0A=
>> +                     MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03=0A=
>> +                     (MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | MX8MP_PULL_EN=
ABLE)=0A=
>> +             >;=0A=
>> +     };=0A=
>> +=0A=
>> +     pinctrl_reg_3v3_etn: reg-3v3-etngrp {=0A=
>> +             fsl,pins =3D <=0A=
>> +                     MX8MP_IOMUXC_ENET_TXC__GPIO1_IO23=0A=
>> +                     (MX8MP_PULL_UP | MX8MP_PULL_ENABLE)=0A=
>> +             >;=0A=
>> +     };=0A=
>> +=0A=
>> +     pinctrl_usdhc3: usdhc3grp {=0A=
>> +             fsl,pins =3D <=0A=
>> +                     MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_=
ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMI=
TT | MX8MP_PULL_ENABLE)=0A=
> =0A=
> =0A=
> It is much better than hex value=0A=
> =0A=
> The most are the same.  Can you define helper macro to reduce copy long O=
R=0A=
> =0A=
> for example=0A=
> =0A=
> #define USDHC_DEFAULT (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMIT=
T | MX8MP_PULL_ENABLE)=0A=
> =0A=
> so pinctrl_usdhc3_100mhz=0A=
>                 fsl,pins =3D <... (MX8MP_DSE_X2 | USDHC_DEFAULT);=0A=
> =0A=
> usdhc3-200mhzgrp=0A=
>                 fsl,pins =3D <... (MX8MP_DSE_X6 | USDHC_DEFAULT);=0A=
> =0A=
> Frank=0A=
=0A=
Sounds like a plan, I guess those helper macros should also go into=0A=
imx8mp-pinfunc.h?=0A=
=0A=
I think the I2C one may also be a nice standard one that everyone copies=0A=
=0A=
>> +                     MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMI=
TT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMI=
TT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMI=
TT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMI=
TT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMI=
TT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMI=
TT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMI=
TT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_PULL_UP | MX8MP_HYS_SCHMI=
TT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE=0A=
>> +                     (MX8MP_FSEL_FAST | MX8MP_HYS_SCHMITT | MX8MP_PULL_=
ENABLE)=0A=
>> +             >;=0A=
>> +     };=0A=
>> +=0A=
>> +     pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {=0A=
>> +             fsl,pins =3D <=0A=
>> +                     MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK=0A=
>> +                     (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMIT=
T | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD=0A=
>> +                     (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0=0A=
>> +                     (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1=0A=
>> +                     (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2=0A=
>> +                     (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3=0A=
>> +                     (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4=0A=
>> +                     (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5=0A=
>> +                     (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6=0A=
>> +                     (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7=0A=
>> +                     (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE=0A=
>> +                     (MX8MP_DSE_X2 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMIT=
T | MX8MP_PULL_ENABLE)=0A=
>> +             >;=0A=
>> +     };=0A=
>> +=0A=
>> +     pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {=0A=
>> +             fsl,pins =3D <=0A=
>> +                     MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMIT=
T | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_PULL_UP | =
MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)=0A=
>> +                     MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE=0A=
>> +                     (MX8MP_DSE_X6 | MX8MP_FSEL_FAST | MX8MP_HYS_SCHMIT=
T | MX8MP_PULL_ENABLE)=0A=
>> +             >;=0A=
>> +     };=0A=
>> +};=0A=
>>=0A=
>> --=0A=
>> 2.49.0=0A=
>>=0A=
>>=0A=
=0A=
Kind regards,=0A=
Maud=
