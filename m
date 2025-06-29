Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010011.outbound.protection.outlook.com [52.101.69.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E781AAC9;
	Sun, 29 Jun 2025 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751186752; cv=fail; b=oshMUPK1OY8im9juT6PuVz5pT64hyYtHTcZ5q+VXNFh34e4o5u+n3g0rmLLTPvTSPTPYNQFTSYC73GnYTa+Q2Wvd2C/wOuIQK5bz3F9rMn5yw5JIBM+2KJElhBs6Hfa9TpXXdheZy2j7PAxbKJh4gTto471/Qhcglk3goaFk6po=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751186752; c=relaxed/simple;
	bh=N1lY2VnzDDhZhRQ7U+MTFf8kQrRhHf30hgilMP2ZfDI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jG9AFrRDaTF0WNWsbPxP2KPaTECMBZZZGK8jqNOKLGGIfRb1wstVjfjbfNfKGgTo6L2IrMrJYRu1ED+ji+OX9fgYeWQ6saFtR0sr01iI3bnX4XAMK1/UiB/MRwekMuvO/SMeRqEnweJqpovFZxWj4Ol8143wleZ2XGNxhkCVwro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=X7EfY5r1; arc=fail smtp.client-ip=52.101.69.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="X7EfY5r1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsQQQH/wsb6XtOrXGoebFTb0xDD0NdlO9CFvbYBA+4SNaPglgde3/gHuUavlnhjvxZ7G5pNlCS35QBuyU5lCvARRImFJLMxIdbkfQ/b0LxTumpzUOfSfgzVpT24fQo37FcyFp1z7Cpcbd8yn+G00s5434PVBHmMSyqlCoW9uKcT3NsFmrZpin9NfJkU87/FPpwr/qEFWuw0bEmbTSN5JWxl+O3tgRppaPxeSaNJMCygC8JRvVg9v440wbKwNwQY9FVu2WOONhKPmbVWdKYITAx67oshZlWdjh6VOl3Rfs+on5fpUwq9kE+oPFMCFUXbxWwBAgdcbvSAiMJrk16MJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtHs2BTA0sVzqOywIwsmeYjrHn6dEnv1m2T9XSU5eoU=;
 b=M/u6MFh2jt1oTtdFpYNM2Op8jm0LbGM62LGdxoh31+O71qf1IwdNSTuxetP79UAzj6VzT2cav13YDXgCeGGy3u8z+getTp5Nm4Oxo766y4jLN7U1gCoLTeuGRbQ7/R3kF3nZUsmrAeC5A3m9yQYmcEZgVj0RQGiCjSMKaQHGxuyItJCVLpw81YpDDcGNVY3Af+5iMgbwAJk+c1AB1yQG8w/5YvfjPPkO7YivZQs6frXxGbdAKZqwkH6neY+8LIerhK2nGvA3cuKdSFI9CAHDU7rJnP+0x6jtw6sSk7OnvEp12E55YOCbIXRAbRhgdol5k3twQn9II4s8DsyTeKNoEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtHs2BTA0sVzqOywIwsmeYjrHn6dEnv1m2T9XSU5eoU=;
 b=X7EfY5r1oSQaTx2TZ4CsrJVflztIxLptaQM8pKCdK5q6nFnLbkU9VlumyqaEJhGPC11blO8+vMFbtzjU5Vf/JA0qfANphNmgnGXOFl0rq/meZVYHghY071IU/EYzC1+hDJCqQc1deAKjjvmTlamFf1LjFllL0DLBwgQOBaYrqcA=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by VE1PR06MB7136.eurprd06.prod.outlook.com (2603:10a6:800:1af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Sun, 29 Jun
 2025 08:45:45 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8%4]) with mapi id 15.20.8880.024; Sun, 29 Jun 2025
 08:45:45 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH v3] usb: dwc3: gadget: Simplify TRB reclaim logic by
 removing redundant 'chain' argument
Thread-Topic: [PATCH v3] usb: dwc3: gadget: Simplify TRB reclaim logic by
 removing redundant 'chain' argument
Thread-Index: AQHb5aY23VilZRqmBkKBDgn9D4g7y7QYtfKAgAEh3H8=
Date: Sun, 29 Jun 2025 08:45:45 +0000
Message-ID:
 <AM8PR06MB7521915A5FB0DDD1DA38BA3ABC47A@AM8PR06MB7521.eurprd06.prod.outlook.com>
References:
 <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
 <20250621-dwc3-fix-gadget-mtp-v1-2-a45e6def71bb@leica-geosystems.com>
 <20250623224340.oszkgwnhcjhnibaz@synopsys.com>
 <AM8PR06MB752168CCAF31023017025DD5BC7BA@AM8PR06MB7521.eurprd06.prod.outlook.com>
 <2025062825-equipment-barista-dabc@gregkh>
In-Reply-To: <2025062825-equipment-barista-dabc@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|VE1PR06MB7136:EE_
x-ms-office365-filtering-correlation-id: 7cbf79ea-c43c-4243-d0b1-08ddb6e95686
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|10070799003|366016|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?oGBuclyQ3R1iVMdzihXTUf5H+BIJMjQk642obZtrWrdfx1YAVE2lfMx9?=
 =?Windows-1252?Q?tDz3KmxbRnfIeu30YMhWJWC6Pc1RdC/StdAnROG3aZg8sUSZjD4pMPps?=
 =?Windows-1252?Q?rn1p8vB/5XZ3vmPLBxyVNoyuMij5Lz5NdTsASElMmp+tvxo3YT9saGaH?=
 =?Windows-1252?Q?Cn64y195uqvhdmFoF+zmRstxkpUzKNPY2pRdizfBG1B+sSxgsEdWVKJY?=
 =?Windows-1252?Q?CaUDekofbbbs/zyMgOl+1OpG6rn3pFOj75fLW32mdhc0pU/mJ+U0D6yJ?=
 =?Windows-1252?Q?IY8jXw5TmqvXYj+1pLi7gd9LvtM63crEVaSSZR990EzkqsP9R+wrYZ4O?=
 =?Windows-1252?Q?juZt3JV1RI+Rahd1CLsEf9IMFH+Q7safDBmdcWIiFtMUMijhIIxEJUOw?=
 =?Windows-1252?Q?E/yc4vrzf795MsLeygNt2/7bRdrdy5hmK6eIkudBah1Ql9ZX2cIvOhN8?=
 =?Windows-1252?Q?RIWR9MLS3F2pbgI5eTFPdyQGDTEbRnx0elR1Qz15ZIQtr9+PmEH6P/XR?=
 =?Windows-1252?Q?IjK6EnwXoUV0ZfV9hRIl3/2WMb7OfX6tEAzn1Q1sPuUT2A6QV2oGYO3a?=
 =?Windows-1252?Q?7Pxs/5MZEyfTfyoCzzM7IPh0DTf/2fQOWU6wpIeBnkNFQDsCTp9tWnkr?=
 =?Windows-1252?Q?7Fn644ar8AO1I1BilXCUn1wsfedpmuL/w94V/XxiiZevTTXtzxIKze2J?=
 =?Windows-1252?Q?D7W+YYvpcc0HGP0/BnvzfLQtPp6ZJvY2ssL9SVPzj0V19OfLwg7Z5YDh?=
 =?Windows-1252?Q?y8mFZF/zIX0VLKANspCe7mGkYgjDFpnW3a00nZIVovchj8Ls8N+bruOA?=
 =?Windows-1252?Q?rDg3TDRtHFCMs5khzxvz2xJlU3kSbw/jIAimq0rt2EcGoaGoX8xZXP8m?=
 =?Windows-1252?Q?DciptLLOCC6K+nnu4tSt9AMJx34U7fglbJ4X6sV0AnoWHWFjwK+O+pMA?=
 =?Windows-1252?Q?/u1A62tlUspnFM6sRstVKawCdKsCs9fCCa9E0DP0QH6aYl+4YSJSPrqs?=
 =?Windows-1252?Q?34KK+vJQZyfMV+PFzVKAmQVtqxXJpMPvq2EBlznt3Y+TPDCdESTM4I9+?=
 =?Windows-1252?Q?+9eGEh8XR6SMNdw8QHqGhG5uAGfX4cjd1hXiKJvr49OjM5t+pqcJcLep?=
 =?Windows-1252?Q?9LkGledz312OwqNt0+LqQpmIr+lpWrdVaM/x3dP4ZStwAy4wm3RYK1nB?=
 =?Windows-1252?Q?9e1u6C4wq34SHsWQ1NBIH/Hi+VDKbOLYWYzBeyV8rMA7PKkmyKy26Ejr?=
 =?Windows-1252?Q?THkBbngojPZc4cZOINv7IFR6qzBaYvieQGevvT0vmb1K/E7RmrVBZMnG?=
 =?Windows-1252?Q?dNxTi9VjtdBIG26i56SnPRA46u8JnkkTqmEr4XVL7sxk8PFts63v1fOP?=
 =?Windows-1252?Q?KZPTBoTfHJrDMsnTESz6Z2O5FOdtWHOYGDvGGWjSg9lZQmUCdlYB216e?=
 =?Windows-1252?Q?sBCfT/h9Z3+tU98VObIbLyY7zu+WsjndwzhJL8wN5d1ZxLgemC1y+Pwr?=
 =?Windows-1252?Q?V7V1Wei/CGSPjotPjrnSqzx9roDuiIiM5R6aMEOwRlU4NhKgnvrHiP77?=
 =?Windows-1252?Q?LJMiBRNWdf5bDGOTm8L1AGBjY8dbCzNcE7b7BQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?h5Lg3TJzVxheKTPOAbMmexVBmdOZPI5DnXPCtnKiDx5gqyNjki8e0LZt?=
 =?Windows-1252?Q?0GgQWQNfVPCV7PxLxNF9nIs0UzvTYRyiWzY4P9Q7qBUjaG+XwX0mAYX0?=
 =?Windows-1252?Q?qV36FUv8B0xMIhEyATzRg/S0H4BDW/WJGzKABW5kINzBH+CO4W9swQrW?=
 =?Windows-1252?Q?S9VVxDL3JZmUviusZvagPFYdiweyjd3JXjp9baVQN2+79s0VIKabAFAh?=
 =?Windows-1252?Q?FI5gzmicS0p0M54AebFBMUYhQpyC0SnspBXLnTBtfjKV/97vBoSghT9/?=
 =?Windows-1252?Q?p9gHBb9irEpgWMGXrx/qFKLbhgmM163OQz1c0G+IjdDUo1Q3DxpbalNt?=
 =?Windows-1252?Q?bRkV9F4NsdYDR57xFbFwuVO2gF0gTA1V9hOR9YmGmrjg7g9Jc30s9mWx?=
 =?Windows-1252?Q?4zYG3IL/+rndTln+GOT5vO4WWwSKK2SMykdJ1bshBxGxGC8f8PovwT8K?=
 =?Windows-1252?Q?gMtNaOOYPKA68zNcX0bmAFY8s9ujK5e5fd0mrr2bQ2wCGKMMjXlsJJiD?=
 =?Windows-1252?Q?LgOQGpBhk+tUP/cS2nSv580AhOZrH7yhir30G8Y14JKP+YZetIwweQ02?=
 =?Windows-1252?Q?umkrZP58ptKc+YOfEfUYVlL7RxjVCO7YKl2xraqTiYcnp58sUVy7jnKc?=
 =?Windows-1252?Q?eqHLWYbHFbB5R2YEKaRQsov/AJamVvUuQG7aL4Cb2yfSEY/A9fIk+70X?=
 =?Windows-1252?Q?22ScuCTGxnLV+y09UCTRDsi6czj9vSacGKT0ZAo0YjWTauoKNJBH+JVU?=
 =?Windows-1252?Q?tP9QFURaFcfeMem+dwN2ms+uEjdnVMVWPzzQc59TXEhQB8Ag18CAFI/m?=
 =?Windows-1252?Q?jF5U+0hEgrkwdJtbdK8FbIsm5inGRFu5gck+/f/yZPrcEV55mlzwzQlQ?=
 =?Windows-1252?Q?3ShfGMSnCfxf52yzr/iNlLbzcILDoPv4ewkXnOrZFDAvgVBoll9efCrk?=
 =?Windows-1252?Q?l5uoK0JV0oM+gGXBlCWRevIvwzSDpAOio99TOmqawk6y2hCMyEQb50Q/?=
 =?Windows-1252?Q?zFKgZSPmB/TUYCRzwAX0p6QoIFmWqIR58oNFi+CykjnaUJ/jITrxrfKT?=
 =?Windows-1252?Q?M6W8QjrMj4wrsH0/nNTIhKdGIaDCI+hHwqN6X2yncetN8OZo1v/ByF4P?=
 =?Windows-1252?Q?UmGkv6ovR1g9xi19i6GB9Y3sMW1jOSN6bWor9x7bpbN9Rn7EsW0i3PGQ?=
 =?Windows-1252?Q?4Aovw9AiudFEJTFNUEAXFHP+9C0vGzbAJhRsilRUeNM4hRpbgtdLeqVT?=
 =?Windows-1252?Q?5Bhq8WeB4WUdsnibbna1mztbzq/p7uVgIix9CVciZeSXl8PiSgrZA4h9?=
 =?Windows-1252?Q?n9w3NLWDXN6Nk5l9uVWlR87tWlhqvniVwv1aUGmU8U/qYkdeWTqMluZC?=
 =?Windows-1252?Q?fRu6/+wsJpuWbrXf+yLYj4ieMwouHtzW45S43KGIrucCgcbBV/E1XeuA?=
 =?Windows-1252?Q?Zy8Hi9weITil4ACGyryCQZuHuCrWd13feaOez2FNKmgMJAyJXlWNr1Rd?=
 =?Windows-1252?Q?I60p15Zxd9+4FgV+/R2OEakIC7b7MoiRRYrqByXI4dhXKJhmln5Q0pui?=
 =?Windows-1252?Q?HEm6z0PqQQukDmbKmP638CLOqlPIA5WpJPBf3+VJmPXUZ1xBYuHFDpST?=
 =?Windows-1252?Q?O7z6313Yrd1kELDy6Qhy1CH+9clI5Un7TgNMcP8KNLirGzacZ1c8xvp5?=
 =?Windows-1252?Q?RO6mJLZrQnXnnKp/Z6vAADsf+dbesoyPFe3uEl4D7t+CqLHikjLV3sfH?=
 =?Windows-1252?Q?bHe48HVBDWUC5xsh83Hq3zbXFJvFOKcFfwtDt0PD/bFw/s0rtI36np85?=
 =?Windows-1252?Q?QrfX3GUmptkvNu71t7R+FxVQVX0=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbf79ea-c43c-4243-d0b1-08ddb6e95686
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2025 08:45:45.1357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +rK/lYRx/Jy0aeoLD4AxLP11JbqARVfrvVLxU8gsBzm2d3/C5FEgGd0owP2CVvr5dvY5AG/rjAGNnt1gDQLe/GKIvoMjQAMZZhA6uIxjj6lD3+DCA4vP8eYDAEi0Q6gW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7136

Hoi Greg,=0A=
=0A=
=0A=
> > Now that the TRB reclaim logic always inspects the TRB's CHN (Chain) bi=
t=0A=
> > directly to determine whether a TRB is part of a chain, the explicit=0A=
> > 'chain' parameter passed into dwc3_gadget_ep_reclaim_completed_trb()=0A=
> > is no longer necessary.=0A=
> >=0A=
> > This cleanup simplifies the reclaim code by avoiding duplication of=0A=
> > chain state tracking, and makes the reclaim logic rely entirely on the=
=0A=
> > hardware descriptor flags =97 which are already present and accurate at=
=0A=
> > this stage.=0A=
> >=0A=
> > No functional changes intended.=0A=
> >=0A=
> > Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.=
com>=0A=
> > Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>=0A=
> > ---=0A=
> > v3: no changes, re-submission as single patch=0A=
> > v2: no changes to the patch, "faulty" re-submission=0A=
> > v1: initial submission as part of a series=0A=
> > Link:=0A=
> >=0A=
> >  drivers/usb/dwc3/gadget.c | 8 ++++----=0A=
> >  1 file changed, 4 insertions(+), 4 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c=0A=
> > index 99fbd29d8f46..a4a2bf273f94 100644=0A=
> > --- a/drivers/usb/dwc3/gadget.c=0A=
> > +++ b/drivers/usb/dwc3/gadget.c=0A=
> > @@ -3497,7 +3497,7 @@ static void dwc3_gadget_free_endpoints(struct dwc=
3 *dwc)=0A=
> >=0A=
> >  static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,=
=0A=
> >               struct dwc3_request *req, struct dwc3_trb *trb,=0A=
> > -             const struct dwc3_event_depevt *event, int status, int ch=
ain)=0A=
> > +             const struct dwc3_event_depevt *event, int status)=0A=
> >  {=0A=
> >       unsigned int            count;=0A=
> >=0A=
> > @@ -3549,7 +3549,8 @@ static int dwc3_gadget_ep_reclaim_completed_trb(s=
truct dwc3_ep *dep,=0A=
> >       if ((trb->ctrl & DWC3_TRB_CTRL_HWO) && status !=3D -ESHUTDOWN)=0A=
> >               return 1;=0A=
> >=0A=
> > -     if (event->status & DEPEVT_STATUS_SHORT && !chain)=0A=
> > +     if (event->status & DEPEVT_STATUS_SHORT &&=0A=
> > +         !(trb->ctrl & DWC3_TRB_CTRL_CHN))=0A=
> >               return 1;=0A=
> >=0A=
> >       if ((trb->ctrl & DWC3_TRB_CTRL_ISP_IMI) &&=0A=
> > @@ -3576,8 +3577,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct d=
wc3_ep *dep,=0A=
> >               trb =3D &dep->trb_pool[dep->trb_dequeue];=0A=
> >=0A=
> >               ret =3D dwc3_gadget_ep_reclaim_completed_trb(dep, req,=0A=
> > -                             trb, event, status,=0A=
> > -                             !!(trb->ctrl & DWC3_TRB_CTRL_CHN));=0A=
> > +                             trb, event, status);=0A=
> >               if (ret)=0A=
> >                       break;=0A=
> >       }=0A=
> > --=0A=
> > 2.43.0=0A=
> >=0A=
> =0A=
> Applying just this patch I get:=0A=
> =0A=
>   CC [M]  drivers/usb/dwc3/gadget.o=0A=
> drivers/usb/dwc3/gadget.c: In function =91dwc3_gadget_ep_reclaim_complete=
d_trb=92:=0A=
> drivers/usb/dwc3/gadget.c:3517:13: error: =91chain=92 undeclared (first u=
se in this function)=0A=
>  3517 |         if (chain && (trb->ctrl & DWC3_TRB_CTRL_HWO))=0A=
>       |             ^~~~~=0A=
> drivers/usb/dwc3/gadget.c:3517:13: note: each undeclared identifier is re=
ported only once for each function it appears in=0A=
> =0A=
> So that's not going to work :(=0A=
> =0A=
=0A=
Oh - sorry! i shouldn't have pulled the initial series apart :-(=0A=
=0A=
I'll re-submit both patches together as v4 (this time both with cc-stable)=
=0A=
... without b4 to have a new mail tread=0A=
=0A=
=0A=
Thanks for the patience=0A=
Gru=DF=0A=
Johannes=
