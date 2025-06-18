Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022122.outbound.protection.outlook.com [52.101.126.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CBA2AD14
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750222970; cv=fail; b=Tae0dx5Zf5pGDbocOmg+YYWMw7OyYHjdAJLCBoMx6oguuoXvN9DKJ8yvjpX7Lf9r5GAAE3lMy3w9ejMu8lqJj1r1HMQPozBT2SC8M+qAbrE+ZOHWLNEvAYIhl6BGay00qCJlyeWbgqn2jKTqRyRVtHJZfsSbYeflGc0HH52tLNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750222970; c=relaxed/simple;
	bh=CspAdp6+g+ZCENKj+13u3nWXESrugLXPludfhJ+WbkA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IpwgEH4OFT/eERxZwMm6jYdL0igowkTrxIavNU5/lfeut4MhKrXTuRZs2M8REfFb6uJ+B02DPzE2tVscP/8cxtPUyS/sncA0s4MIfuzugzQh6AADHrtz44Fei5CDGP1J8/5TOe0mxDieDuuwyGBbWukw3W9y64w7fs8a4bKTCUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=WnJG9gUV; arc=fail smtp.client-ip=52.101.126.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="WnJG9gUV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gz6ocEOswTnUcdYZUj/MLC/SHxg28jK6Uw/IbDkW5jxHK/bC/o/52DSBCwRkMzcKlgsgX5fXwpt69MY906HqbCDSxd0G4QDcDZ6FPIx+UusMu4PAt2deKRHDPVNLKT+Pmj2Hnn7wy9qRr9LGRsdsU6UzK014EEPs9ZDEcTAgBeMk4zCmRe2gIi7GyVCmQ3RfgPHwg3qYUy7osG8kmslqdNQr8y0dtUhZ/ChqSaZ1S/6PVXTeI2tqXdUOCCrmAuE5FecS82O0HrQygzf7i7e0SNhxcrtmcHla7OtDHJG8NT32FdOZEODnqjiMXHATMoqzNaXf+Y1r6IIt8+VJ2+JIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEeiWszFXSn4b10g4r7b5r+IB9w4nypfwOJon+6O+v8=;
 b=bMJGklhoJ8FTEnK80ju8nPLh8pjLD5widi+VjXsDY27Bn4Y53+IQw7HalcT8C+9as20gZ2vwccuzxOzqoCypW7EkxMuZ7aAp3EhFhtQguXSeMkrT/INOc6D+bjpTaEH9mfmgSFPB0YwgnhrAc3CPdgmsJZE43pk1rB9q98rHU+NQJ6RwUcuheYN8gr/DgO/iSdWoulEQTQn1O1VOa94Ss6OiVjanrovhmJyMgBWYgG7ce5ZLsq7woaBTe6KYv1qmgucbRfY2s60/Hs9mJm6S/mdFsEWlJWMPZhxnIuLKNx4tLpjqbBFvealMCjhwLP6Am06OajXrCLvUzz1j9aXrww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEeiWszFXSn4b10g4r7b5r+IB9w4nypfwOJon+6O+v8=;
 b=WnJG9gUVV/Ebay9b7c62ADXBRjSRC7y/y2qWBjAiKP4KkSm43JbeeCGnvLglPk5TsuiGz2aY1JiIKQawzmbg3nhCl/0O9BsiaaeaQbmQHmg3atP6FFcFLm/vkRIBVhPUfgdkUWDNqiAQDWE9kNnrHQ6LrBbtgNiglKg6qZoZ9Af8sN/glPbGdXXpEhepq5qoX6/79BPWcDc02xEkeNTqeZi8xz5OY6AYepUS3bFw7HnE95HbM6ftxzINUYWceu5BdcPi8bYtNNN/yYw+rEKw3dXZSi0Di22RI3KWgJyzXQnyU7EN0ptGihRRy9+/VZNzRK1BVSTVbtV+c1mtyY2qqQ==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEZPR06MB6874.apcprd06.prod.outlook.com (2603:1096:101:18d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 05:02:30 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 05:02:30 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Frank Li <Frank.li@nxp.com>
CC: "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"aniketmaurya@google.com" <aniketmaurya@google.com>,
	"jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
	"Shyam-sundar.S-k@amd.com" <Shyam-sundar.S-k@amd.com>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, BMC-SW
	<BMC-SW@aspeedtech.com>, "elbadrym@google.com" <elbadrym@google.com>,
	"romlem@google.com" <romlem@google.com>
Subject: Re: [PATCH] i3c: ast2600: Generate T-bits to terminate IBI storm
Thread-Topic: [PATCH] i3c: ast2600: Generate T-bits to terminate IBI storm
Thread-Index: AQHb2oWZQZZfD7nYeU2zGERd1ayEs7P+MQsAgAoe5Cc=
Date: Wed, 18 Jun 2025 05:02:29 +0000
Message-ID:
 <OSQPR06MB72527A056D135FE021A885208B72A@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20250611040203.487734-1-billy_tsai@aspeedtech.com>
 <aEm3Xr7Oj1wjASUT@lizhi-Precision-Tower-5810>
In-Reply-To: <aEm3Xr7Oj1wjASUT@lizhi-Precision-Tower-5810>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEZPR06MB6874:EE_
x-ms-office365-filtering-correlation-id: 4c64b060-8516-4ecb-49de-08ddae2553cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?lmIuNZ3NvDWj7z+IEROH8uVhyr/y1V/KAVvTGaajINPvO/zv0qsHgKcU?=
 =?Windows-1252?Q?63qp49bVMj74TWjDd9XSI3/JE9MeeHAdZC5NMBkwdALXDIriF1Zc1XnM?=
 =?Windows-1252?Q?H58FAb7jPYQge1tbvP1iI7YwiXh3C3NXYmzpRt2Y6xCXZhWX3BDxPSLe?=
 =?Windows-1252?Q?xrYg/mnQ1lb6ZCdANJtRNDw/LbyOwlK2pG7Yvse3ZldA3QjRooYib76D?=
 =?Windows-1252?Q?bTzU61QZKuJ29HNPHu4jy9eAnOrpJpi++4/BKdMk5OBCWziBIiAlLS33?=
 =?Windows-1252?Q?quriJXr2yaLDWaDypvsibmgsCCoJzEM6oEj+yTIsTdu+Vx5Juyioy1rN?=
 =?Windows-1252?Q?kii7Nh1U+7+LiIq+KtzqoC4R+qs+0OZVd5WkXG9dbLAoH5NHiE+x2fZ9?=
 =?Windows-1252?Q?OU5MmMV+oJrMQxDONRFve2vc3tj2XcHMr9JYOUWb6tx2RK21ABHvgFPV?=
 =?Windows-1252?Q?dVuotNa3q57ETJq6L2R0CxhaGnpVUzwEj6JWuGChxzUR3LdFT8X8G/7Y?=
 =?Windows-1252?Q?e/s+nkkQ50d3NlIf0Ebq8AgCho6kTjGP0hjUziKSNIyos8OLIobUN5Sh?=
 =?Windows-1252?Q?TeF4h3KHraQ9xURX7poc0k7Bn5OvtaCdxmApQYPo6osHSKvnP8Od464o?=
 =?Windows-1252?Q?RnEJlToOyMRJUGiT2tPvz6zdj+a6GZbgH2LfF9jHPDioqLrIqwzo3+14?=
 =?Windows-1252?Q?xH0LINyj+ZLfD5/y4yruIiWcWVC3/xzznZghrfUBPCxzIIAYyO2WWRg1?=
 =?Windows-1252?Q?lV+4p7LVno2Dh1U2i3opBuYobalFo8Ixv02+Sa/3+/EWiDEMYIfoPoER?=
 =?Windows-1252?Q?fmfX62Oi/sjhgYSqb9SQ7LdedPL6cp4uIXlh9QunbXRCoWzNKyvy+0jI?=
 =?Windows-1252?Q?ve1GtDPlJpZzmSJW4txObzFxDhDtV+MrEvXAuW72fe3zabrxuHbZzcHM?=
 =?Windows-1252?Q?qE/5Yw9QIH9vjDBdP4Zh1ALG03gXvsgzEre63sqnysmelv11cSZP77Qz?=
 =?Windows-1252?Q?w+csb+vODr2RYcvoSuHA+feXTtqqI4oTm9d2o7NJ5yr2Sdb6hxc51gKL?=
 =?Windows-1252?Q?iXkinbMjbgctMX1IzXC54hKBiiHrASiBhoElsUU5TsO/580EMiekUl28?=
 =?Windows-1252?Q?LHvPLR7rn25oqOUbvbX2FTNHAKz1Qrp+hWscnTnq4X8qDDGZCctXfKHO?=
 =?Windows-1252?Q?eeRBKQxQHJD3yg8ayNmusHTwr7YAb9BhJHJjMG3LYDfd6/pd3qk9NYMw?=
 =?Windows-1252?Q?WRNuHgPiYKjr+QnzObBmq2hlorQjl9BBinDV9mO5CTXuoIdoiwT0DVR4?=
 =?Windows-1252?Q?uU2C8oyxJL38yO4wpctk4iJhVgnaNS0XRDvhuUDA2cw/nNhQ26khscJl?=
 =?Windows-1252?Q?po5LXj/ffQpzfp2NDljS9jQE5pjTZZjLKodS2jaiiTk8178AjU0NimHP?=
 =?Windows-1252?Q?zNH2hYo1DiUBF9bYIfRsAU5aYMbe5u6yB6Thn8yyJ6Oa5qmsJLyivXYJ?=
 =?Windows-1252?Q?ce3SUTegJw6twQV0Ib9kP32Xizm2Py0ameraSpUX/fE32qxPXz7otAFR?=
 =?Windows-1252?Q?9RhXi23pi6fqHUM6dXEvhN5mhBAluOXS6PC2cw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?FUIJSXAYJ8qsxEfR77zG6ZLBqqlvVGeM6510zpTyiCmGfaFZNRTQCCyu?=
 =?Windows-1252?Q?y2CtFWZPuJU4P6SDKjMLgS4pJR3ly+PNLgvp0uoUBqFfg3ayuW7kQpfR?=
 =?Windows-1252?Q?ecvI8N/UNx2QEcHMbX0lOpBASJB1dtTh6oLwipWuYznUm+WWFi01flGY?=
 =?Windows-1252?Q?D6f/hf1gdghjdnBQcVySTa4XYVYQqUxSa6gdUMRa2kFlquPRh+jK+vkd?=
 =?Windows-1252?Q?/41JWzCn6KTuCqi4XZ/Q1zpgrrvD8jAkdyhFlpPJOd0isyGatntCxpuw?=
 =?Windows-1252?Q?EzaaU5g3RN5LH6u0hmDYAlmJXvVwhxUGc8sWU8oVop7T/ahhxuMEbOd4?=
 =?Windows-1252?Q?9jKKYZ+XpUmtYWW1R9tuwyCj/1vn9cHePRaqo9hT8YlEo3GOJKsppAvx?=
 =?Windows-1252?Q?u0Rle6170RBYh2iDmfA/bLEy/xjZvOnN5rqRGZpMk75pIIDaXWRpOy6I?=
 =?Windows-1252?Q?6+Fwo9H4IxQU77WB3i1Lnr3Rtb++tD/uhsuzuPYFVruM36oueGgdBGGo?=
 =?Windows-1252?Q?CWPRfzK9B+6bCcgjPL+YyjOh6hzP3jqFzY6jHC3WC0cZFJnCWkYx3vQ4?=
 =?Windows-1252?Q?gIsE8Go/rbfq1GEJjSDOsDjkATdptCYhbC+C+cL2yut4xjgF8QOnzoeP?=
 =?Windows-1252?Q?RRYKsK3z9Nq+PlFTjnLCtlXt05yfvQtWHfYvTsaGu/FHG6U5UV/BhaOD?=
 =?Windows-1252?Q?H28gsroUSQbOBOun2CQ5ur9r9Pzf5xZ6vZzesEE9gAQj/TeQ7aSiuVIQ?=
 =?Windows-1252?Q?quNiN5MjLYcPg4i4Ily4CWjqzfKwXN2NcS/OSRsojS+cWjSNXphBhIF6?=
 =?Windows-1252?Q?mNspbdmMMuJsk9H+XRZcooCMEmU0uapztS4mBL1V3+OMAkXii3vr4Df+?=
 =?Windows-1252?Q?qnFkLgheEdOEXZdOifGZFzzeXzEJ+5xr49axzrw/1/L4A5iYnF0P3ACo?=
 =?Windows-1252?Q?1UVTuPK9+o2Q5XCzFuQ2uU8N/wymnAftRgYQuQ3BRVPF8Sha99PefQX7?=
 =?Windows-1252?Q?iXoJ2NylYk9yf9di478F5/cZvzqENQBJEAh+g/upjntfCLpqchaeHQ9o?=
 =?Windows-1252?Q?AygUCdztn/Jo1sJRX+Rr7IDpaOLm4stSYwBzsZj4+oDuwQ13jscC2v3u?=
 =?Windows-1252?Q?6b8rgWLYWC1O6dOPxZXw6A52VgNO8YoYbv7sjtrwoRCIReNJ+KAyTlbj?=
 =?Windows-1252?Q?pxzpkyh3eN1pQ0athBUyt7yOqf7myklOT+AWi1jSTZMbkEYv4UKVvgFL?=
 =?Windows-1252?Q?/hnN/W3+LrmOPsli6v+I7X3Bbi25fkjWCdCqgPoN3P0EClu3XIGmYRIE?=
 =?Windows-1252?Q?1Xkl3S4F4YRNxRGHfoDnYwdPM1CrkILYw5TFfnM916DV/4Kb/n47v2WP?=
 =?Windows-1252?Q?AUT7q60dCAVYrK2EXqZH7rXZbLTF4+2V/cmoaiUg9a6Dl2gGCx19NG8d?=
 =?Windows-1252?Q?mv0HmxM+FgJumaas6Wf3HGz1R0SFlCrXMeKAof72oItx3Fi29alS8CrA?=
 =?Windows-1252?Q?F/RgiL2vfmbzaXVkM6vPGehinHL3uFlAArvE5BjjkgOK83owAa/PoOMC?=
 =?Windows-1252?Q?6Aet7MtcH32ZPWfc8eNS2WWTb39g3h4hH5PEY7RICOj6ylHIxoLokPge?=
 =?Windows-1252?Q?PFxz8bUG0CzIGviwA2V8yjCyJ+1U1jT4xto8h3yLREgDULcObPKipofj?=
 =?Windows-1252?Q?0vI8QXmoQEFobI+gdB0Mdpe5bKZFMF4T?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c64b060-8516-4ecb-49de-08ddae2553cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 05:02:29.8942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H4NZtorlhE7giSySUHOZXabsTSxX/LWzEuGZ/Ub1RAAm/VlWANL8NYBWuengnaQd70RrwdD4Kr5oKM0y9hQ7uycVIuneY5ZOuAsM5Yw9ly8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6874

On Wed, Jun 11, 2025 at 12:02:03PM +0800, Billy Tsai wrote:=0A=
> > Under certain conditions, such as when an IBI interrupt is received and=
=0A=
> > SDA remains high after the address phase,=0A=
=0A=
> Can you descript more clear?=0A=
> =0A=
> Generally IBI happen at below two case=0A=
> 1. SDA pull down by target=0A=
> 2. Address arbitration happen=0A=
> =0A=
> Then Host send out ACK,  according to your descrpition, look like host=0A=
> NACK target IBI request.=0A=
=0A=
No, it means that the Host acknowledges the IBI request. If the target devi=
ce=0A=
then encounters any issue=97for example, if the device shuts down at that=
=0A=
moment=97the SDA will remain high during the data transfer phase, and the H=
ost=0A=
will miss the T-bit to terminate the transfer.=0A=
=0A=
> > the I3C controller will enter=0A=
> > an infinite loop attempting to read data until a T-bit is detected.=0A=
=0A=
> BCR/DCR have indicate IBI mandatory data length. You should know how many=
=0A=
> data need be read according to IBI won's target address. Why relay on T-b=
it,=0A=
> which just is used for when target have less data than what expected.=0A=
=0A=
IBI relies on the T-bit to terminate the data transfer, and the BCR is only=
=0A=
used to indicate whether the IBI includes data or not; it does not specify =
the=0A=
IBI data length. The IBI data length is controlled via the SETMRL/GETMRL=0A=
commands. The specification does not state that the Host must use the IBI d=
ata=0A=
length to terminate the transfer. However, this behavior can lead to an=0A=
unrecoverable condition in our hardware. Therefore, this patch is necessary=
 to=0A=
recover the hardware from such scenarios.=0A=
=0A=
=0A=
> > This commit addresses the issue by generating a fake T-bit to terminate=
=0A=
> > the IBI storm when the received IBI data length exceeds the maximum=0A=
> > allowable IBI payload.=0A=
=0A=
> Add empty line here.=0A=
=0A=
> > This issue cannot be resolved using the abort function, as it is=0A=
> > ineffective when the I3C FSM is in the Servicing IBI Transfer (0xE) or=
=0A=
> > Clock Extension (0x12) states.=0A=
=0A=
> why ineffective?=0A=
=0A=
The abort function is not effective when the I3C FSM is in either of these=
=0A=
two states; this is a hardware limitation.=0A=
=0A=
Thanks=0A=
=0A=
Billy Tsai=
