Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010005.outbound.protection.outlook.com [52.101.84.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726541E47CC;
	Wed, 25 Jun 2025 07:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838002; cv=fail; b=prf+GxbBQpDFSQrIoiv0ZuiC4gHgCRD/7Ufe7nSW4xB6wLBpS6XHRue6PG6RnzwAvEncPLfGYBwv9KUvzqY9CZ+nbSjnvMT8uFEHiDx9Ju10IaA/gNq6PN+1qOZLifLCVDXa8942mugQ/UbjNdV9XIbTcpnjzUP8Jf1uQlnaX7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838002; c=relaxed/simple;
	bh=Pq+CsZZ1xyhDKiWQpTA+XqPeKXty/lC6yiJrSyVKY9Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=igzxXL1oIFRhLIWUJ/5n1SktJWq+ej4wfL4qyVSvNTyAbE5boFyzrqZGbAUxh4r+wFi+87i+7q0jYNMX9wKwaXMjwRRZX3YwG858izs0lWs9aiTo4pXElFL5zqjNvNAegvgjCgdHn5tBdu5yoJYCw1WlqfoqMljDAODgAMbzZnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=S/gTRATl; arc=fail smtp.client-ip=52.101.84.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="S/gTRATl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bv5XF2unU/90on8pWzVE2ySonp/pz3LxFKZLvXOX4IFCQovEk3zlwXlovfLrmlHMoaNff4s9VdLdpaKvu5uszgOSfqg96R5No9FXlEey2SH2rXki9Y4UaaLCTgV783255ktNwL3UGw8VKw6rwRJupHFgkqGePcsy0DxAS5fcaSTG0TtAGczJLiwzRUNWGGwAoF4UpGV9k1xMuk6dZuxQjpZhnNboPG3/5fg/84l2zLnKix1fi9sVKtg+p6B3KaOkswvw4QmHtMRn2VHRwEoGy5X/YXbHjJVXb5pjoal85NStw0b31B+UfK4gdC02JysUxoNT2Vhq3+uOiJb0AvOFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxSvgTvUjjEPsOT/2hyr2qVpTHDdN8egtpE9mchGgFo=;
 b=mt0E2BcadkZE7UFKZxeCm9VqBBe946pLfT1wlWyIK4yVkBE6vTcBl9fNTje3mqbzI5VwGdsU6A5UbeO2EXAmh1ZUt1b7cOA5wbU6tKx74dilML2eI5BFGxflAt8YjXhAl1sVdrqK8lhC02k886GmAgdubFUFgnwL1e7GXSOXO7pTzWokOgSRWiYab5F4Ycs2pVn/bZUPJpQLUw/yLRz79+8yvd9y2RiPyt3cX1o1MSPk4XPNnSTrI6ZPGgjHqrKfmxbW2PdRuvSMWYI3FkF+nF02hOVMO1WR9fAcVIJDNkG/wHuOrDX3sKVbGdup6V6IE4AhHA7GHdri1P+/m6ArEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxSvgTvUjjEPsOT/2hyr2qVpTHDdN8egtpE9mchGgFo=;
 b=S/gTRATlWePP9JJ07/D34sxtOAT+Tu+f254cMGYB4y0lpyNei4VS6TxBSI81yBJzSpRsXWsuqrC52vrlt2oW8bAGbDlu/FrDKTmZo+MzN2NbpSuEZtP870zPYlEDS91ORwIpr+niBDP2l2oKLhSN3F95b10jRH9sw+sqsH8+OdI=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by DB9PR06MB7276.eurprd06.prod.outlook.com (2603:10a6:10:1f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 07:53:17 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::1797:2a6b:ecc5:f7b8%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 07:53:17 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, GEO-CHHER-bsp-development
	<bsp-development.geo@leica-geosystems.com>
Subject: [PATCH v3] usb: dwc3: gadget: Simplify TRB reclaim logic by removing
 redundant 'chain' argument
Thread-Topic: [PATCH v3] usb: dwc3: gadget: Simplify TRB reclaim logic by
 removing redundant 'chain' argument
Thread-Index: AQHb5aY23VilZRqmBkKBDgn9D4g7yw==
Date: Wed, 25 Jun 2025 07:53:17 +0000
Message-ID:
 <AM8PR06MB752168CCAF31023017025DD5BC7BA@AM8PR06MB7521.eurprd06.prod.outlook.com>
References:
 <20250621-dwc3-fix-gadget-mtp-v1-0-a45e6def71bb@leica-geosystems.com>
 <20250621-dwc3-fix-gadget-mtp-v1-2-a45e6def71bb@leica-geosystems.com>
 <20250623224340.oszkgwnhcjhnibaz@synopsys.com>
In-Reply-To: <20250623224340.oszkgwnhcjhnibaz@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|DB9PR06MB7276:EE_
x-ms-office365-filtering-correlation-id: 7ee97a10-ba96-46c6-206a-08ddb3bd58df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?oN02wu515xTlGztA6ZQgYCfDZSNIOJlGd4yfNllUmF+fAFcUuVmTDsqU?=
 =?Windows-1252?Q?d8joEryYN5AM1qvZQwYRJqFF2mfZuqg2c6z9uWp+cA86A89sEPaxNm7F?=
 =?Windows-1252?Q?aPsv1rqcJbQELjMPSJDt65P+cjNrEC/A9UH0voU9UqrZivCHNX7N34vE?=
 =?Windows-1252?Q?muJ4iFsK7nTwUZ4w5whsmdAJ3m6CH7OtmONpK8jDCLu9NvAAhjiWVl20?=
 =?Windows-1252?Q?vrIgMBXJ3BpHEGiNyz4oXIJFWbCHtO+pHw5vugO3laxGHV68lj5P8HoQ?=
 =?Windows-1252?Q?Er8AiqvFPMsaqzKYEwHlecHdavmVGTmF0kGRcYWxW0CCsXTGxgghtYpD?=
 =?Windows-1252?Q?pQquKEUkj1fWAblEBHXoBf7WxiFD/QkQH6DMGNwT+P2qlpHzbNyM7pLc?=
 =?Windows-1252?Q?n6vET+GUK6lwfQJCbVl6go+66SPnQ3Ur0SNWSuLbQLBhqskmz17KbKTM?=
 =?Windows-1252?Q?5LBiBBKeSVbLCJpZ9sRAHBKkkH4OHRmpRgdgRyNgYYAj/PUCdnn14yfF?=
 =?Windows-1252?Q?UcaAIAWrP1z3gzQW+Sb+IfMKCMbGDBmt42hbTai0S6PigI6Uzit+fdWX?=
 =?Windows-1252?Q?gvTmCj1FUQnHb+Cxl1tbmHrJ0LMLQZIBUiaq2FX6tNbjuRkKLFv9/Ums?=
 =?Windows-1252?Q?R5DL+P3RtcVPB2dLiPR+VqkzFBweDJVa6FA2g8T6OF49dZSD08DYcxw+?=
 =?Windows-1252?Q?/t/UhlBTfhoST4CYaZjrYJQrsrRUH46lOyv6JTMGxeFoTYMjUe0+zF8j?=
 =?Windows-1252?Q?iGRa6Wl2nn0PAtpw6JB9LQl/V+r28M1mcYtu77JwbXAt1F0GAoyandY9?=
 =?Windows-1252?Q?IrUHl7hf6Ys+2hL+wWboxkgTFG8q6bTonYWXPymeGS9BMamrc33kKd0W?=
 =?Windows-1252?Q?VMjibBnzDaDbIe3u7lOa/0nPWGpVumB6Qy3kzcoU7NZJei3lmPSampt2?=
 =?Windows-1252?Q?i2kAhwgBZouhzXvRurrXgcEeUvzaOswj4zQU9p/hiEYMr8pBRWt6IZ8e?=
 =?Windows-1252?Q?nchHvWpchVRiB3hCgccf/aVFNiK3m2296vM1xxkdzbZPwk/zA4cYXO/v?=
 =?Windows-1252?Q?XL6LHCP+p5J44r1vzBRux7xk8SWiY0bjMgl3CTM7JL6EVunQaH0yc7yH?=
 =?Windows-1252?Q?26cDnWmj36s6aCGcz7XdJcow7lo7+dGPLjkquJAPyQ7RI2/5ZSqCg/F/?=
 =?Windows-1252?Q?Jafj0O/El5qZJDEreLeehiVZ1moX46e77vSqC2zs2QDLMe4YCBDRDkWt?=
 =?Windows-1252?Q?m7zcakCzYMoUgEmK1r+nmzWUuEiD+llBVCofCcf/UgXkTd6fmUdi84tp?=
 =?Windows-1252?Q?aR5FdEqmeTbtK+EpDICRSR+1jsVbPdvlJTIFnmLsv0ChmLCuJ2EUvSXN?=
 =?Windows-1252?Q?yrlNXS0qxDPd2ezYqpz0hTdYIVtzp01iSbvhd02Xwe0xkiFD1Q5M0XpY?=
 =?Windows-1252?Q?wfOd6PZioJFHk8KrY55sLZNHs1yz7B7naLUk5V2z5GFH4VK6Z3zXDWm6?=
 =?Windows-1252?Q?3qN1bSnmQC640SkSuwJQsT8OXbKOqdXz5XfuUurydKbzIaFfaPY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?wjuCOo/62lL0PzSExhzEc9fQNTHIbvPevngBheC34w7U2YmPpRWYTJwu?=
 =?Windows-1252?Q?JSHv3R0CB12iQZQKvb9XP/bjKj7Kg+CEpuy9xZ04JERIkR4lLnw5B3E6?=
 =?Windows-1252?Q?TGAXyAQbDGYb4wIzKNQ+ccCoYkH9M6jmxU0UbeY3jZ756CcesJMz4kGS?=
 =?Windows-1252?Q?+md6noQ38FcN3IS0gA2ijxsMS9+wY6EzxsQB5GXHlxM+zXOS1GJoExP9?=
 =?Windows-1252?Q?vm8zWnJgLyEjGXqKPAH6MFxKRAF5wzhF20rmfCHUU5RvTtG+oz5VfPm8?=
 =?Windows-1252?Q?jVFeVGuGVmgprp7JPbNTEQjcAHgYndMEMC1eaTekT7NuJJ41Iz0u91DP?=
 =?Windows-1252?Q?Cbm1R4qu9cyFyh/Xu5gUhd3O27KOgjZqdaK64/XRKfKBv1qLbEnLcSh5?=
 =?Windows-1252?Q?pw8fSVZSxyfcUelOStfmxILitRQNLMZJL/bNg/UBQOuhsVXbkiPf+2sN?=
 =?Windows-1252?Q?S053uQtTUl2VMRNBNRzpexFMnxlR8cC2McUbIaF8YhAoNPRg6t0OY0tF?=
 =?Windows-1252?Q?SM80yDXhZMAwloCRnxzucH25tHPB/D8tp+ZLw0vDqqwBypm4s3z566mh?=
 =?Windows-1252?Q?8740JJm6UjzpzSi7LUlp3LjWnQ+9bnJRJRGof4hk5+w3pWQsQJmVa5x/?=
 =?Windows-1252?Q?l08VI1/iUsNAKPXIfqgX0eiJZaCQ4bpbruoCbRdlMuY/EDRzZoRgMgBD?=
 =?Windows-1252?Q?A1JJKDfHJkUnx7uAIp5fQh21EwFAOXspNzQAynrmuVujC3mpNJ6c+Zng?=
 =?Windows-1252?Q?9fOCvQc6/ejcOro1GpKOEkly1P65CVUrX3KhJbO+nXKK9ZsnJBlSWfCh?=
 =?Windows-1252?Q?Dxtb911xYjOtYcoL4aUo8tvjKCOuxTkEzbULrrP4+Y4vdTYRPawXC0tn?=
 =?Windows-1252?Q?EBePmPCKjJKvheUTycoEtAHTdWrnmy6T8B4RsGMBUTPH5ofHMGHD9H6R?=
 =?Windows-1252?Q?C6ln8kojdg2xqXFmgI99zGQPYsnNfQ3e6ftofxYMzFqu+khrVt3sDH83?=
 =?Windows-1252?Q?5PmWH4SdO0cUGGiXHW7NDZS8LUBGM/1h/hp5pYRD0Sl5zNNpzfwkwBGu?=
 =?Windows-1252?Q?qoUHZtjDADV2MUFx1419lCbAe5KmC3CpBVTuDJACAkWYmvCKTa9ZAmE2?=
 =?Windows-1252?Q?mrOWT8Fl8FmQ0c+LjO7sDDcU4PEgzp+1bI4IeA24ZsyNeEmCRRQYmVXk?=
 =?Windows-1252?Q?OjTCuRG4gtfZw2IrVP+NM6HZvxfCDCf0luD+cU3NUicfdACrw8vIEZXs?=
 =?Windows-1252?Q?14ObQF7U4pgJFePhFr+PT2maF3ltv43fohmSV69AMXygRu59tw/Rv3K0?=
 =?Windows-1252?Q?y8h2jeURdObxVGjXFWIPDFARALQHZ0L3aSygV5x+0diuNqnYL08mHVFd?=
 =?Windows-1252?Q?/LVHhd0LsaDz38NiESwNJ8Ig0IN8EAOkPr00X9W6H4cGjeHlb8FGWk17?=
 =?Windows-1252?Q?/iHIJym202L1cnGdA7QD7UQ+vVkHQvRm9mw+l01tIOxtATQqdlmRZ7qu?=
 =?Windows-1252?Q?cDf/YTAixWBIHVYrYuKX2PbUP6hlUh/Z7HQXHcZKbtCFUhfBey9IEldQ?=
 =?Windows-1252?Q?hZYkd0TIiABBrclNUGhTpi7/JODm/UdZHsab2Bi10bm2NywJoXYXDLY0?=
 =?Windows-1252?Q?AwDqrkU4y2R/yJwzWHl5o0OwyOLon/81N99XPoczio2/Wfgz3zndEV6k?=
 =?Windows-1252?Q?Cjmv18h/bHrSFLMNS8ajeuuiqxRTipuVJFQHpXe+U2aHhk5EVoVOYeYk?=
 =?Windows-1252?Q?Q98t0txqvYulvfAQtMb2DR27o+Zwg1HBRv1CQCumIoVwJ91rz+zdl4C9?=
 =?Windows-1252?Q?cBqEEp//Ml0QFtpiLP+i3r15PSM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee97a10-ba96-46c6-206a-08ddb3bd58df
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 07:53:17.7573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 01uYFzPxYqMSFREYxRrwVjJUbRRZjb1VA4EZCtsqUyBSIpw58Kbtg474eHUtSBgvxAV8P48pvEk5HtP589Yi8B3icJI28BrDYLIn3CeWmwg32eHA5g9gAc5Y/S2pXUO0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7276

Now that the TRB reclaim logic always inspects the TRB's CHN (Chain) bit=0A=
directly to determine whether a TRB is part of a chain, the explicit=0A=
'chain' parameter passed into dwc3_gadget_ep_reclaim_completed_trb()=0A=
is no longer necessary.=0A=
=0A=
This cleanup simplifies the reclaim code by avoiding duplication of=0A=
chain state tracking, and makes the reclaim logic rely entirely on the=0A=
hardware descriptor flags =97 which are already present and accurate at=0A=
this stage.=0A=
=0A=
No functional changes intended.=0A=
=0A=
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>=
=0A=
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>=0A=
---=0A=
v3: no changes, re-submission as single patch=0A=
v2: no changes to the patch, "faulty" re-submission=0A=
v1: initial submission as part of a series=0A=
Link: https://lore.kernel.org/lkml/AM8PR06MB7521CFF1CD8A93622A537EEDBC78A@A=
M8PR06MB7521.eurprd06.prod.outlook.com/=0A=
=0A=
 drivers/usb/dwc3/gadget.c | 8 ++++----=0A=
 1 file changed, 4 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c=0A=
index 99fbd29d8f46..a4a2bf273f94 100644=0A=
--- a/drivers/usb/dwc3/gadget.c=0A=
+++ b/drivers/usb/dwc3/gadget.c=0A=
@@ -3497,7 +3497,7 @@ static void dwc3_gadget_free_endpoints(struct dwc3 *d=
wc)=0A=
 =0A=
 static int dwc3_gadget_ep_reclaim_completed_trb(struct dwc3_ep *dep,=0A=
 		struct dwc3_request *req, struct dwc3_trb *trb,=0A=
-		const struct dwc3_event_depevt *event, int status, int chain)=0A=
+		const struct dwc3_event_depevt *event, int status)=0A=
 {=0A=
 	unsigned int		count;=0A=
 =0A=
@@ -3549,7 +3549,8 @@ static int dwc3_gadget_ep_reclaim_completed_trb(struc=
t dwc3_ep *dep,=0A=
 	if ((trb->ctrl & DWC3_TRB_CTRL_HWO) && status !=3D -ESHUTDOWN)=0A=
 		return 1;=0A=
 =0A=
-	if (event->status & DEPEVT_STATUS_SHORT && !chain)=0A=
+	if (event->status & DEPEVT_STATUS_SHORT &&=0A=
+	    !(trb->ctrl & DWC3_TRB_CTRL_CHN))=0A=
 		return 1;=0A=
 =0A=
 	if ((trb->ctrl & DWC3_TRB_CTRL_ISP_IMI) &&=0A=
@@ -3576,8 +3577,7 @@ static int dwc3_gadget_ep_reclaim_trb_sg(struct dwc3_=
ep *dep,=0A=
 		trb =3D &dep->trb_pool[dep->trb_dequeue];=0A=
 =0A=
 		ret =3D dwc3_gadget_ep_reclaim_completed_trb(dep, req,=0A=
-				trb, event, status,=0A=
-				!!(trb->ctrl & DWC3_TRB_CTRL_CHN));=0A=
+				trb, event, status);=0A=
 		if (ret)=0A=
 			break;=0A=
 	}=0A=
-- =0A=
2.43.0=0A=
