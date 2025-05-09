Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2114.outbound.protection.outlook.com [40.107.249.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB902749EC;
	Fri,  9 May 2025 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781419; cv=fail; b=RMZZfAeLPIxD8e9NjJGQcNg2Krd4rjunx+q5smr/caZVGbCnW95Gh1Z99XBaIf17hjGpeDMo1QaIUzyBm8GDLYXs2hGeQiStHcEfOgGfgfD1KxPRaeWp2i6kJ4JEzx2yY9TisQNZF8vrVUdy7fzmE7LzCzpvc8ouv3d/wtXoMJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781419; c=relaxed/simple;
	bh=uZ6vwYjKgKD3owcB7pqRFWI4RmmaDvukpK0EDMnpGCE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RWp79TTyvg6X2/bslOgE1UQrPq1xDSKAoVEQ2l7mGSsFWUJi/LxuicpEwCFEVWfimmZNq0IohzF6XkMjy11nxkV2V0bXAAthrV1/xdoGrbcX8HvUqC+x/OuPPp4tqf+Tjdfhyf5HL/U9gdkZqn6H5PiT43NszxPjg0KNv6pY0b0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; spf=pass smtp.mailfrom=gocontroll.com; dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b=jKGQxe2m; arc=fail smtp.client-ip=40.107.249.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gocontroll.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.b="jKGQxe2m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqV0G0ySCcAbng5YGYrbzMujhrcb5TdVcWGM/iruBuOfDSzJu0C0xgZJt4FB6OebUYT12PC1WseI372E8K5dgB7n/nH0kP3ZpUuc738d0HnVBbtmpo2awUjagDEZ0ZJn2/JwKnZidVw0UA73tzMb6SchYEhtbX5oT2kIbnUO7dfM3czCrNugr/Sw/rfBqMkXIR5UJHMuTcAfzU2mZ6gwm3rqShLMAGUv3cJaLMWaWlLnj92f/lXRwVRt18ueGlCem/hi1d0FRtflYaTwaLaUa7WKArFzDL6J0awCZIgdOh0aSukhoNonHIqOmRmdLA74Q9itZV1XUt3RbX++RISoCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aubqUkripHUOiaLb210b8EuUiV1JoALieMxAHY9Nm5E=;
 b=PYGak+bKJhLekSDYGMMR1Cc4zGLWu9VSvzCbi7CNLrt+FQ7s0cvOBse/agwVOvbAGxs2cosz9Y6aDVvejgqLBW5AKWdzC9QrSELA3zGxgjEH7+9ipdpoM04zdXc5TqRuqiimbzcdjHDj2rOcpGSXf9tQMTl1RfTgzKkZyJhrCp1b3ZakUJag/9CNSyegTLf4YwtmnkcBnATRYRd3GBXgWfQN8caz9GMMLgeOZWAL6bha6byJAy3I9GSUC0ebSdjXZFrZATOMaMR2kAqhDs+tC9nE3KgcA2HIBye2gpZHzeuJn/+U9z/COpsrVbVw6JIJT0Y94mYNSVngeBD002EzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aubqUkripHUOiaLb210b8EuUiV1JoALieMxAHY9Nm5E=;
 b=jKGQxe2m6l04EC7CWkMOFlMYEIq1yyhRIZQL/E2CSb6oaP9rdMYhnCCp5hkUXPbq3Dxt9QlqImWQIyMCfmu/sN+HngsxVBYc9hDuYghCXONZYSAh4rjTzzujgV4JO1VZgRPls4SqpUcn/8wrXZit/4tQIPMhf8RgbbIYDBpFB2qissv7/LI8+C6tU5E+ItSjpGMD4bOCmfFGXze6g90q9SCy/Y8SxZGOmqfqlS2lDyF6VYJrZUya63PwbUpeohol3uM+yXs9t9SAusDIK1E4qO6AQD6jVjuDx+cadSt25zOzWv9DFffGLw+wOJJyyKNh70kf7zVWmtSwhVSDZ2Gm9A==
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com (2603:10a6:102:ec::16)
 by AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 09:03:33 +0000
Received: from PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f]) by PA4PR04MB7630.eurprd04.prod.outlook.com
 ([fe80::311b:ad3a:4a62:7b5f%3]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 09:03:33 +0000
From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
To: Shawn Guo <shawnguo2@yeah.net>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 3/8] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
Thread-Topic: [PATCH v6 3/8] MAINTAINERS: add maintainer for the Ka-Ro
 tx8p-ml81 COM module
Thread-Index: AQHbr4F44tTPQq7J1kig5rAcrpD03rPKFpSAgAAGvFyAAATCgIAAATnf
Date: Fri, 9 May 2025 09:03:33 +0000
Message-ID:
 <PA4PR04MB76309AE2C6E2C774DF8FAE29C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
References: <20250417-initial_display-v6-0-3c6f6d24c7af@gocontroll.com>
 <20250417-initial_display-v6-3-3c6f6d24c7af@gocontroll.com>
 <aB26FRq/Ets5fiRK@dragon>
 <PA4PR04MB7630F5874577DA12FCBE1537C58AA@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <aB3DuZMBIwsFXrVz@dragon>
In-Reply-To: <aB3DuZMBIwsFXrVz@dragon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB7630:EE_|AM9PR04MB8506:EE_
x-ms-office365-filtering-correlation-id: 38601113-e3d1-40da-1c18-08dd8ed86037
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8gtTsg0eEEKNn7lMR1UQtEZipYr3LI5PJNIzMblna6Tpl572JLXm0j1GC4?=
 =?iso-8859-1?Q?ueLBQpWGOxNJ0G3qY8o5DaumTuFoGi3WYO0hKTxEoxXcmGvYtHlPYbbLcs?=
 =?iso-8859-1?Q?5KvE02h80irKkr6scLJxWD5mrHDR2dT4fDGj7ccflmgbWakn9tA/FY5dTP?=
 =?iso-8859-1?Q?2YhuxFsbYS3wQCboP4ouLk4zyPYC8iHlmtmwk5Q3jf9EEkJIAUnoqwmV/w?=
 =?iso-8859-1?Q?ebwrQroXQ4d8cBvDQaLSJxiQeSt29TPMk1yjEB22GnPtRPIA+TKJL7Iuyg?=
 =?iso-8859-1?Q?jbLYJwfzlCkxurRAA4/aXEGR9EAmHeatfaVKZYYObIHJGioQBnuGUsPB5U?=
 =?iso-8859-1?Q?1PPfNUo0CHeI5C2pz9bwj9vg8xaHLGREki3hTRDxWSFrXzUVpRnBC6RvqV?=
 =?iso-8859-1?Q?Gyb+TRui+7u9mEl1h/HGZS07QFOKeicSZ+56hP+HYPLU/5StWwuF78vkEd?=
 =?iso-8859-1?Q?t7wNm/FN6JoORzRrZJTcWazNXotCnbSqinuWvzjoLt+3CQxTRBjKPlMuCL?=
 =?iso-8859-1?Q?Zc/Kb88WBAvM0+8EJ/fpYTZ8dpJzYdMOEQQ3wUNe99o7JP53mLuuuExpAb?=
 =?iso-8859-1?Q?xlAncHroS7JTcti7O6umGhHwBUH3/KAvLH9WUXYfJ5sLE3wQE4ULkCYMB1?=
 =?iso-8859-1?Q?l0nfkYCvCag20NVIw2+kP96tJAk4kNj6e5GI27SVI9iQIhtsB0OIw32Xza?=
 =?iso-8859-1?Q?sgkchYzUOWj6SewK5pnxB+AtXHAgNkR3ny7PhQUF+03+zh/4ib8ZjEadLg?=
 =?iso-8859-1?Q?3XX3+9Hc7UmlVyjcN+AJQxyhL12aUtS+QcW+4UZw4NfXQXuniCviF/Qz8N?=
 =?iso-8859-1?Q?DGG7biNZm6+0OOpK4mj69c55VrU44PtK4tNbMKHNnJ0zqDwg8kTBp/7Gh1?=
 =?iso-8859-1?Q?j00AupubKSbmgiHLvIOiU3dyaSv3ZNn2peEgrzJkYpsK/yghkv8tkiwpBN?=
 =?iso-8859-1?Q?9dIU2zaB+3xAQIjF9iE88YRjDrEcVzatb1TTiwLOV+CXmj0Vuba7r3lipp?=
 =?iso-8859-1?Q?AA+sRkA6g6pJ3Id6TfBjOTF7H2f0QRxzKeRD43njt9OZOVoqVhn7UnlPi5?=
 =?iso-8859-1?Q?R8XiOWxxhkLFFPVemA+UjEMGLRk35Rk+qPcjihIXJPB4q4RUNrs3XBbSc9?=
 =?iso-8859-1?Q?svBiCZ5EH9lFiPED8jqVOKXB6+4PmyGTB7nK2lH8fHnuIQuY8X4dCIVnkK?=
 =?iso-8859-1?Q?GtHYP6FSSwDXfwbH9FExr6vcGzaZgEVsJhZH5nDs8ZBjLBTzqIHb9RX2NN?=
 =?iso-8859-1?Q?nPaN/j+QOGWYIlKT9kUWMKk2hRHCdhxKJZn2IjJvPrN1nhicYZ7f+loyAd?=
 =?iso-8859-1?Q?u5wnYXeI0+CCoNq0K1NjRSyE/jHLtfGVhS3ls5D7ROgPKSxWGxRkrSlhfQ?=
 =?iso-8859-1?Q?we9+HWv1/WaIwd9Gp7SvGZx02HBW1sc68Ig7ItZma7u9BEr59okB5AvOtE?=
 =?iso-8859-1?Q?7db2seTgxNeA3ASMQmvQHEYeAKG2n7RZd3yWPElCd+k339EF8/enM9l5Qd?=
 =?iso-8859-1?Q?3PlvQsOeFSLcJUVVmF0B0xWc4dw8C36vTGbLgK7qFOdg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7630.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8zwQXUWd0NI9htrcmB4YcQbe4K8jpb332wErve5D7l9jKyliDo8fW6Sydr?=
 =?iso-8859-1?Q?AUcyl4WvVRfiDsNmbBAEdIWkd5xRscwPuf7G863mE5l0i2oDczPBbCy+mb?=
 =?iso-8859-1?Q?iPuItyPnyH6LFTckz3qqppeg7mPSJS+slFtT02zGUHzo7dpyv+5kHy0O0p?=
 =?iso-8859-1?Q?6nM2Wh1jvupBxIqNE7bk6D/ihZ1FwZMHVz3qVBE/pirJCObFckXab734y0?=
 =?iso-8859-1?Q?HShkuVyZZf99XOkIKoXpg6DTpxffZljWbRBiJfuc3o5jCqcYENW1HarhaR?=
 =?iso-8859-1?Q?wdnu88PaCQ823MdmEYBswPgi/n+gSq0rJiqNBJMg5FnoP9vwnlyN5N5fJn?=
 =?iso-8859-1?Q?f0QFhsocCDq+9iO5z7OJklDVh3i1dzTQHn2TwrFGw4WNVatCskoLeujQK4?=
 =?iso-8859-1?Q?QvdouHBRxoDEZfelQAwh0QkLWoxs1JUej5pBgukzfXeimhspL2UWjDQ1e5?=
 =?iso-8859-1?Q?h6eK1r/cq7fN25c88iNGSoEilOI7x6MAnXK8vaU9mG/ut301WrYbDyqaQN?=
 =?iso-8859-1?Q?+86FTCnR81unRxCzbhP7v7iYSVONONXgLRIZmhIgBj+lYDoT6/WxRmMc+y?=
 =?iso-8859-1?Q?rBEyVx3Zt/x56Fv7dhYWXpT/ns4t02ZOCUgQB/32ax9u4p0oBv77rHg8hV?=
 =?iso-8859-1?Q?+lIU0PwAmMcmkuZtq7w99Qle1RNKIdKqSyxXyAlYNO82z0S6DQyjvdjORy?=
 =?iso-8859-1?Q?EPTVRJM5uOU/pjmY+zffVNQWOpEE+mId3OJlzHsufQZT2sGbW+LudTRBnG?=
 =?iso-8859-1?Q?12htdxFiMEimjB88cMZN4LIM8yIfb4Cvjq7ApPZ46P5Lu8NA6nx4MYcPxn?=
 =?iso-8859-1?Q?qrQUa69T1osH60lFmI6rwUWWjkdlQj6MxzRcx9rNEPHlIauTkFN7El8V7x?=
 =?iso-8859-1?Q?tcxD424LTpGwtj5k7HNlQGyHG2VY6yXvGU/0wdnEtjiH+Mt9TTQ7tzLXBr?=
 =?iso-8859-1?Q?rvhnm9hx5Ys0NXHakULi56fCfyD1akXgMuZLepVYvbtb0KY2deqQ+9VK6o?=
 =?iso-8859-1?Q?f+NM/vWdVA9RVKtm1Gjglsz7zY0OF0T5B1LdNb3B9oOqxnPuiBqTENForX?=
 =?iso-8859-1?Q?k4ddcj6Yoy9bus6Pxk7af+IMoaQLccnc3/oIdMEINPvbS6w4VI1MR6lY9i?=
 =?iso-8859-1?Q?+sirG3Gq90F9XYqCeeej3zWU3uO782QIrfGK443He7jT69L3PsLltnXBJa?=
 =?iso-8859-1?Q?4shRvU4mXKvKsEEVXZePVegiOFn9wQLoMhYGbqp8RS8fPiSju4JmtEQkX8?=
 =?iso-8859-1?Q?rAwGyLLImQTxRd5Hj2M+hjXIHyc6QRjPpuHBOID4/IW5kivF6GCG4cYjki?=
 =?iso-8859-1?Q?j5Yt5guHxZUYXpzrtji85NqawTUswAMQhrQmGq94DG8WHbes/X96TUPwGI?=
 =?iso-8859-1?Q?EauuDYjusMmdF7GNcENB2+g4aVMfLDrX+Fhp/0/GLNL8EKieObn1SJ67kS?=
 =?iso-8859-1?Q?EzcqM8ueFWQFlmLjZbnAseOe6pKzxeL0OYcv/SurkDppZTk6TJoun9ewuT?=
 =?iso-8859-1?Q?qnrvUDDRfdLB65G9JL/kpBxbC3e9OG+4bNoGzva1I5HgHYs1Gz+rTbMMgf?=
 =?iso-8859-1?Q?xbE36SXaE6qyKNh5VpSdYY4oGPhAmFPjXFpb/HKUGGbwVgNWWAHQ1YotPT?=
 =?iso-8859-1?Q?xxlEPiUrwcnEX8wTY8Gf+kBounoZ8gSWEgqIC5fw1FA4Hd8qlcySMwXFgd?=
 =?iso-8859-1?Q?3DvcTAXwwY2kjzgOA3cKyyy4LlIdwYcCUfei5pbzEBddlENeW12f9F/OMp?=
 =?iso-8859-1?Q?Qr9g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 38601113-e3d1-40da-1c18-08dd8ed86037
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2025 09:03:33.4737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oqJBZlUQbB9+p4wTYKQPdPcxxvNzhK+Tzpzp0zGumP+tvr48u4MT1pTg/xUQnAic1ghelTcw/Svy6MQgpAD6R69LooMQXd4DGxp9TzOKs1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8506

On 5/9/25 10:58, Shawn Guo wrote:=0A=
> On Fri, May 09, 2025 at 08:42:38AM +0000, Maud Spierings | GOcontroll wro=
te:=0A=
>> On 5/9/25 10:17, Shawn Guo wrote:=0A=
>>> On Thu, Apr 17, 2025 at 12:14:04PM +0200, Maud Spierings via B4 Relay w=
rote:=0A=
>>>> From: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>>>=0A=
>>>> Add GOcontroll as unofficial maintainers of the Ka-Ro tx8p-ml81 COM=0A=
>>>> module bindings.=0A=
>>>>=0A=
>>>> This support is not officially done by Ka-Ro electronics, if they at=
=0A=
>>>> some point will supporting mainline, this should be changed to them.=
=0A=
>>>>=0A=
>>>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>=0A=
>>>> ---=0A=
>>>>    MAINTAINERS | 6 ++++++=0A=
>>>>    1 file changed, 6 insertions(+)=0A=
>>>>=0A=
>>>> diff --git a/MAINTAINERS b/MAINTAINERS=0A=
>>>> index b5acf50fc6af4322dec0dad2169b46c6a1903e3c..1ca022081bcf564c8ec91f=
b6431570045495ec23 100644=0A=
>>>> --- a/MAINTAINERS=0A=
>>>> +++ b/MAINTAINERS=0A=
>>>> @@ -12779,6 +12779,12 @@ S:	Maintained=0A=
>>>>    F:	Documentation/hwmon/k8temp.rst=0A=
>>>>    F:	drivers/hwmon/k8temp.c=0A=
>>>>    =0A=
>>>> +KA-RO TX8P COM MODULE=0A=
>>>> +M:	Maud Spierings <maudspierings@gocontroll.com>=0A=
>>>> +L:	imx@lists.linux.dev=0A=
>>>> +S:	Maintained=0A=
>>>> +F:	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi=0A=
>>>> +=0A=
>>>=0A=
>>> I'm not fond of such changes, as MAINTAINERS file could be bloated=0A=
>>> quickly by individual DTS.=0A=
>>=0A=
>> Is there some way you would prefer to see it? I don't really know of a b=
etter=0A=
>> way.=0A=
> =0A=
> There was some discussion about getting ./scripts/get_maintainer.pl pick=
=0A=
> up the Author: field (in DTS header area).  But I'm not sure where it=0A=
> ended.=0A=
=0A=
I feel like that would be wrong in this situation too, it would pull in=0A=
Lothar Wassmann, who has nothing to do with me upstreaming this. I have=0A=
seen him around on the mailing list but given that Ka-Ro are not=0A=
upstreaming these themselves, I feel it would be weird to pull him into=0A=
this.=0A=
=0A=
-- =0A=
Met vriendelijke groeten/with kind regards,=0A=
Maud Spierings=
