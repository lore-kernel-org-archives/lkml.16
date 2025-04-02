Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98D521ABC3;
	Wed,  2 Apr 2025 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743590975; cv=fail; b=oSAymw7tOYH0rf3su5dO5yW16oNBODhkPfviWDbbElZHoH2UInUFFecxu9E+2M7XMSD54BSc6zhag5cbVyYhtNWd8eMb/eKydj8xtU3BEO2X0FOzO3V0vvzblJ1oFTTdssGqlzKmefSjM44JgrTwbRGKGvIEt5iclnCowhZP784=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743590975; c=relaxed/simple;
	bh=bBFC9QogFwGRG2Tcc/zUCFvh31XW6jjtFBDvgnuoyMQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u1qzAmmj92fDktZrStMNWAC/o+VqFpWw6T6pcSARudkuyBn4DRNRLpjdA3US+4ev5WD5QiFbaV4ObHJ7KmtAGRDnXRPBMZDwWWi6BbUe6V/uT67qNAKt7vQj7jkrfHDJNO/D1he3jjMSrZFTI/f0d50UHQPKSvhi5hYH12RCLeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arri.de; spf=pass smtp.mailfrom=arri.de; dkim=pass (1024-bit key) header.d=arri.de header.i=@arri.de header.b=i2PQe7qe; arc=fail smtp.client-ip=40.107.21.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arri.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arri.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arri.de header.i=@arri.de header.b="i2PQe7qe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGc/myex+1PhgBDfixvS0LCSLBe67LSkUYqwSoiMJr/ZOQK0tIUHINiHUsYV2AINalMGPfOKQa4xzmqGqYfq0RRlo1dw0z9a2i3hLT6k/8PjJuu7ldHKpXUWmubP0i6fYubR7BnqCUFjicbZP/8U01MPYIQXWU0R/vu2KxGJTt5MMxc51/JfLmw/6Zwfs1sM0SOyI8hye9ZrVQUOQOueQapIaMfKILHYO9/i2zIXBLtuMg2bxIuZs0/5vZBetsH3uz6NY0W4oraSw4ckGLHsP7JJXxVruObTv5BG/5ITicp8eGJLxM9gEQzrR9CFvKe7t9JGG30ywmPjas3bz9Ak5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOJTapwRly5ilWzkXqnDaHCDwGcwXfR+EW9vKYW1OOo=;
 b=FoXcTYfejgAC6xtw+5XNP9izvrCIJUTcD/labgiXZxth5UWxeB09xUxlSWpRIgMXgWQoXBPc3yVAPlFSZBuaovN5hVdzwRRlwi6wcpru4IMxagwXF+/BHZTdQ8TG2PNtTmhX9dEqGscFK0d/K3LE5KmEJw7SKxT5qFuwmk1zj3isiyuKyXRQixTPUbMwN9/40R2Zbhs8YLTqtXdtQ6WnqldiYHlL6OSPOdK4g3MjTFGUEtE/hsvIIx8FKpU74G0zsKcy2S9uT6NErwa6g3aSs9bKSLXZhKDknZp4+MCmh0zJEko4+Hrt8+wZ6N/i2AzTAp6fVuMKNagN8fzKYVpD6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=cab.de smtp.mailfrom=arri.de; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=arri.de; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOJTapwRly5ilWzkXqnDaHCDwGcwXfR+EW9vKYW1OOo=;
 b=i2PQe7qeMTVUs0UiAKtBqB1wLkEklzuQgJeDAby5lYolHHLGZWe6aNoypPxw9zfKSsT6y6FMsHU4oUPIACBv2enQ7XWn8EoJs8A0q426QSERYBI+i2fjv4j/y6MIoxqT/syA0GhuhtmIUzOsyAvhh8Vj5nrBL+6kIyV13Vx9dVg=
Received: from AM8P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::19)
 by AS8PR03MB8468.eurprd03.prod.outlook.com (2603:10a6:20b:52e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 2 Apr
 2025 10:49:26 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:21b:cafe::26) by AM8P251CA0014.outlook.office365.com
 (2603:10a6:20b:21b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.39 via Frontend Transport; Wed,
 2 Apr 2025 10:49:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 10:49:25 +0000
Received: from n9w6sw14.localnet (10.30.5.38) by mta.arri.de (10.10.18.5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Wed, 2 Apr
 2025 12:49:24 +0200
From: Christian Eggers <ceggers@arri.de>
To: Markus Heidelberg <M.Heidelberg@cab.de>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jiri
 Prchal <jiri.prchal@aksignal.cz>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH 0/2] eeprom: at25: support Cypress FRAMs without device ID
Date: Wed, 2 Apr 2025 12:49:24 +0200
Message-ID: <2293994.vFx2qVVIhK@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <Z-zr2oj-hD28ccy3@KAN23-025>
References: <20250401133148.38330-1-m.heidelberg@cab.de> <2759958.vuYhMxLoTh@n9w6sw14>
 <Z-zr2oj-hD28ccy3@KAN23-025>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|AS8PR03MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 71655cce-95a7-45dc-578b-08dd71d408d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sz1kZC3Q8HeG8Obr0Yo5pPGB1m6rbkoxSD997P9PHO17P5SCsh2bJxbSYDxq?=
 =?us-ascii?Q?qbmrUIrCm+d8zwZtiWsLBgoA6Yd83KK6iFWqnUWWOFEczH7pYZfg1uyE+peO?=
 =?us-ascii?Q?TNDtqwQUlOic4J7vOMOUQNiXBKi3JHBJ3aq8oOQFKRo3vD4VAjcyyvqAiMdu?=
 =?us-ascii?Q?3xzRlgiYrcmHMWM+g3pvKQXZYGlSRkpZJbXUZCdVPsAWduYWpJQ7lSsC1piW?=
 =?us-ascii?Q?s1q/xkfyspZu9cEbFsLTDjj6e9V7Gwrli1kSwzrZtfUlGoUd9P30+jKGXl61?=
 =?us-ascii?Q?G95EhVg3WKpMPcD2hVsqKDGXRrFCK9MtZ81lwTqBvwP5O/7stZdRBV+kdQGo?=
 =?us-ascii?Q?taQI2/KndQQYG/sq6t9IHv5LZE4Nusp2za4mg3Sf/QLZdpxyamIvzKoD8KI4?=
 =?us-ascii?Q?mPFkwxvkmkrAPPb4ZB4wi+22u3H91GkbsX5JyZCdA79BCrE56VVDxu4ZDHl2?=
 =?us-ascii?Q?nqaJhAlNyj7Y431USclhL2lt6ST56Kzn5NPV6zvXSeA2SbW6QoBtH4U1SXxG?=
 =?us-ascii?Q?hS2mQDA4vl+YFXn6A1zP6RhaLj5yINJEO0AiuHtmGOYh3/wI3mmtjfM8+1YZ?=
 =?us-ascii?Q?3KEVAQmv4MjksTKHr9aQuRd9g6QGnSQjt0KSHh8YzZhj7ZPxkENK7F6SGHDQ?=
 =?us-ascii?Q?ODaAY+4ZtFmihANLbTTrhxGXOUK9hoUwg2GUO+yxSpJkl2OnvYxSdwwL/iAi?=
 =?us-ascii?Q?J3j2ADhu6KQIlZGn9PvVaHwiHvJpW/UrA5/oFqpFXfk1NdNjI0OguuwIG4K7?=
 =?us-ascii?Q?JdOJNNqhBIm5C46OxzQxsL+M/GmV4tlDurxbGmjMx4hwbbBNmK0q6H087bV4?=
 =?us-ascii?Q?kovgSKU+r9sqoREEok+xucVvi4WklKydK+/sbVJOlg/WtyqDdvIbn4bnqL/d?=
 =?us-ascii?Q?qYAEIU71IYqz233Iu2mHXshP80yGwmmyF5s65WXLtQR/LEDBecqex590xes5?=
 =?us-ascii?Q?SGb9IgevS3sL2cRmEvao2m/HT8i7CfKn0yRz1UrSROYxiST0BEQ7s6vwUhYt?=
 =?us-ascii?Q?F5hZPegj7g5L5941ujnaz4Us0INmcNYRXVFePjM09eavC21LJ0pShCsBj6z/?=
 =?us-ascii?Q?N195/CeuNwh8JrbjknHOsDkjIifLuW7iGnN/a5bZ075hdhqaVuTgzQw1gGAE?=
 =?us-ascii?Q?8/4R2WM8gcbiK8ePDeLf7S4POiVJA0kjsobM+XZcgr5WV3BMKh5QQ/J1AJe+?=
 =?us-ascii?Q?vrFBAGy8FMrmsoBbVZXaWIJ8OefjePbZFzZV838sTKYzjH8oSgEDYkn6EBI9?=
 =?us-ascii?Q?qt6XLaerKeE9m0zW64sgc6aUGN0WP/X+eTpiTAnhk6+vvUcIi0eM75j/jkmk?=
 =?us-ascii?Q?wcfhQq1r4A22wsMTHKtRMrD+wttUKb/kDuYM/Ad7X4dy9p5X9ABy30Ozp9Ax?=
 =?us-ascii?Q?YWxXNyNSA8/4AiGT/vZCzqlRFdBm1oTKVKhCrPM6Tu8rkJrF2QmCogSyxq9v?=
 =?us-ascii?Q?vkC/itSlqX5WMdnxzY6O3q2e1UT200y4BJoykQev63P5CacjC2lmI/5e/jRJ?=
 =?us-ascii?Q?garQu1/Ji8QwdW0P+4+M8k71Hg3f0Yy6FHN/?=
X-Forefront-Antispam-Report:
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 10:49:25.1321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71655cce-95a7-45dc-578b-08dd71d408d9
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8468

Hi Markus,

<disclaimer>I'm not maintaining the AT25 driver</disclaimer>

On Wednesday, 2 April 2025, 09:48:52 CEST, Markus Heidelberg wrote:
> Hi Christian,
> 
> On Tue, Apr 01, 2025 at 03:45:14PM +0200, Christian Eggers wrote:
> > 
> > I use the following FRAM device: Fujitsu mb85rs1mt. 
> > 
> > This FRAM is also not able to report its size (at least I didn't
> > try).
> 
> According to the datasheet there is a device ID, but with a different
> response compared to Cypress FRAMs. It wouldn't work without modifying
> the current implementation.
> 
> > I can use this FRAM with the following (Eeeprom) settings:
> > 
> > 		compatible = "fujitsu,mb85rs1mt", "atmel,at25";
> > 		reg = <0>;
> > 		spi-max-frequency = <30000000>;
> > 		/* mode0, uncomment for mode3 */
> > 		/*spi-cpha;
> > 		spi-cpol;*/
> > 
> > 		/* from the datasheet it seems that there is no page size for FRAM */
> > 		pagesize = <131072>;
> > 		size = <131072>;
> > 		address-width = <24>;
> > 
> > Is this what you are looking for? Of course, the "type" attribute 
> > reports "EEPROM" with this configuration, but my application don't care
> > about this.
> 
> This is what I started with, but I thought there has to be a reason that
> EEPROM and FRAM are distinguished in the driver (at25 and nvmem core)
> and I wanted to do it right. If not relevant now, maybe in the future.

maybe the "EEPROM" protocol used by at24 (I2C) and at25 (SPI) EEPROMs is
not smart enough to provide really useful detection of device capabilities.
At least I remember that I2C eeproms of different sizes require a different
number of bytes for addressing. AFAIK, using a wrong number of addressing bytes
may accidentally overwrite data on the device. If this is the same for SPI
eeproms / FRAMs, reliable auto-detection may be impossible or require
at least knowing the vendor in advance.

Flash (MTD) devices provide much more powerful methods for enumerating the
device's geometry/capabilities than eeprom/fram. But even for ONFI there are
extra tables for vendor/device specific workarounds. I am not sure whether
adding such stuff for at24/at25 devices is really worth the trouble...

> 
> Markus
> 

regards,
Christian



