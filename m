Received: from CAN01-YQB-obe.outbound.protection.outlook.com (mail-yqbcan01on2114.outbound.protection.outlook.com [40.107.116.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FCA2F949F;
	Thu,  3 Jul 2025 19:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.116.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751572308; cv=fail; b=sC1P+2pcY9TxwHKI6DeqcwbMLJ+/t4Hv/+QIEN1Dc0G85IrYmH2INi++zIHvVtUfxiumdH7R5yVgznEq3ZVv0dhiXPT6k/sNGDLxSRWi3ruQ3gvmB3ClLpI65zHi58h+L0w3ODdsRL4W0+yNESIia3mkGfrNcwwpnj7spS8oCSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751572308; c=relaxed/simple;
	bh=v373dw3sVN5QbFnzmZwh/lL91q8UFhdi2NvBt1twuyE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lM2V74Xb4G854WuULNT7LzYGDB+XNKB611Af8h81r0m+bA96uh3+VkzQzg6ChRWMXcbuQWVTwxzj1OKliZpussEZ8ZyejwE5ZRjrIaHOVNndpqNwMsWEIlAPERkVzvSzxZQzaSzbFt0k3lDf7rxU0WCF+53k75lkQv/4gwIiaDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ndigital.com; spf=pass smtp.mailfrom=ndigital.com; dkim=pass (2048-bit key) header.d=ndigital.com header.i=@ndigital.com header.b=A3suz5i3; arc=fail smtp.client-ip=40.107.116.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ndigital.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndigital.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndigital.com header.i=@ndigital.com header.b="A3suz5i3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYScbiDySLo5fhubDCG0c4JeUJ6LF2+FSoyZzl2JVopR/dmMaRhtYtfZJVw8ywpzCdwDmQPkBB3/cbjaSIxAg+1hJRmo1ip9VemCSaa+WQnTmIhE758Ms+pP2zEm/BrczrdwhPuE2tDDYl4Qpb8/g+jDxhdNgp4ls7Ep9Q/9bUrZ0jOmyX62ROt4a9LdS6O2Sow1z7naOHPoeGHFFj20GTGSAxEfFo2+QdTmCKMyx2/ZUyn3rZHehuLqis2gYsBaCesyBG4lNBgZuqIcyxJN5z+lOYUzX37HSta2j5i6jxjNJvoA29wWotn3QHxMr01lUX9rnaY+7TFc99VwXMfqMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbyT5CPa2dIrd+mCbJbYMS9zX51Qswt+5guxe+qbbfM=;
 b=IQJc7nuelED5J1dMXfG9IFE6kP6Un7Pd/TaLY/qbXdXnTmYAb04BBhmXPe7VgSO2f2R+nuzQpkKpbb+maeDWPLaf2tL+g0Z6/AVYR/JxTZShypqFXkA0lMu2Wj3V/Xcgmas56NQrGe2MlWvCtz0yuEFSWtHCOjtTWD4QQ0VfZ69lPCDThKFw7OLAh+JW695+6WfZWnvsarkoUI+X9WmvOjVTu2gJMlObp7D1dQcgBwbjq9pyso9qYBqs4h0+ugGlYpnNEhcSipPs5L9VtRcfF99CPJlDjlu4VlqUobPgM0BgrMW5aAuHKfO1X80k6uRxorwui642nJgdnrBysxwihQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ndigital.com; dmarc=pass action=none header.from=ndigital.com;
 dkim=pass header.d=ndigital.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ndigital.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbyT5CPa2dIrd+mCbJbYMS9zX51Qswt+5guxe+qbbfM=;
 b=A3suz5i3c5ZRX/a+TyIF5CvmBYi0PrrxyXyGkS84GlEO9kZTogLqlPTq4YSq4cs08vIawh0kNkl2mS/dIM9b2lbJjqHmiXcI3DJ97gDEg1WXp1W+nyEoKCT5ufuRFWf9hgeOgOTCbw/EOInKIkP1fShRhQKEdIOgkoDYzxsfkWxNgDQaX+LhL4GpS5ZQOvDx3fzxwz9s5acOtOC/HW9JBdYFxPBupmDVU9Z1KXrhtgxsmWzYGwWAs3/+vf/mfjyWu2KSoScCzv9vNg3alsBwmj+1tYiAhd4UV9MeI3TTgaUzuIcSp60WcWAWZhgW5KfzNL9uyjpW+4OVLmEbsYrr8g==
Received: from YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::5)
 by YT4PR01MB9926.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 19:51:38 +0000
Received: from YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::206e:a5af:7f5f:76a3]) by YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::206e:a5af:7f5f:76a3%3]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 19:51:38 +0000
From: Ryan Mann <rmann@ndigital.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"johan@kernel.org" <johan@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] NDI FTDI USB driver support
Thread-Topic: [PATCH] NDI FTDI USB driver support
Thread-Index: AdvsUo3AZSEQGa88Q3O7CZcXksmAVA==
Date: Thu, 3 Jul 2025 19:51:38 +0000
Message-ID:
 <YQXPR01MB49870CB7B3075ADDF88A3FD4DF43A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ndigital.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YQXPR01MB4987:EE_|YT4PR01MB9926:EE_
x-ms-office365-filtering-correlation-id: a87ef8cd-5e50-4144-45f6-08ddba6b05f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?W/lzxDvTY9o/5wVVhY/+A4tom3bNO8RNHyjUChKk32b6O5ibUjisOpJItFb+?=
 =?us-ascii?Q?kLrSr4UO2rtbpAifRZ1AYX6ZPkChRcPuYW42fhm+esq6iDdrnqNhhxxnZMI/?=
 =?us-ascii?Q?zQFGc9TGMk0SskVq2bEL/Y+xFbpGmcq3ljpaxaSBE9mbbho2hRpV1Ef1mHcn?=
 =?us-ascii?Q?/8ymZwGa1vMyev4yCapaqaQXbAXHcB+FjmfyAeo09SVl0tFz0ZbClEKCG1b1?=
 =?us-ascii?Q?RqCuQ2xaCImRx3Ekmk7BuW+IIt4z+8rpaDmSAbPfviCQSsEei51NSAyr/wum?=
 =?us-ascii?Q?ZjDy2/60AF3T+yQjXqAdDa65o+TLbBe3HLYKGdFLn1GVGG2UGv8iqX7dG1G/?=
 =?us-ascii?Q?4RbJftLi3pXD+KULgPIgaOJjU201LqdZ+krqNAn8iqEI8gZ/2dK14jnAniez?=
 =?us-ascii?Q?n8m3lk5SqNQfg8AIONfPo/g9IfjvOPIL35uQkNYS5XjzPTFuh9KI+Q0P3YTe?=
 =?us-ascii?Q?25P4U1hFHKfYLRlyHpbmXDrhsYC+iBkkLnHlz/D//NJNYwB4LwzyYGL0DqlT?=
 =?us-ascii?Q?HqIgEcvdDUuwsMTOJJZ44vk0TfmQ3aBGuE1pkzN7Wbwp01upMw2EUFtmg2IN?=
 =?us-ascii?Q?+iwiHOLFQgMghRFPjr66UPvCw3XPPn4se0cMj7femwrN2MBC7tOje+Yq1FMN?=
 =?us-ascii?Q?4axlKcPyUWxq1KjpDXYL2qUzMBFQT9kqvSdB2JHYq2G1TSznsj6tvry88Dn8?=
 =?us-ascii?Q?DOqup+5ZXBUg0B27zKNX/Ipefvf45QxRwGv0pYrk55jHT/zzlob4qLvJ3pXR?=
 =?us-ascii?Q?bQXFe8qhnB37NT0OXwxyGB8jDeMlfEDNAyXLx3g0Ube3rdOa5/6hZb1bgrfQ?=
 =?us-ascii?Q?JVvWEMFS7vKGpvC4D4QhIfIg9fF8KwIK+zL0+DGHqanACN+e8h2/Tz1uKq3m?=
 =?us-ascii?Q?L1tGhE4lh00FIchAGReUbqHaIft4yCoGO8es6aeUvw+U+BiZ0FiLrZr8DXYA?=
 =?us-ascii?Q?Bs9W1ZRof7qssDxovT4Iy+PbUlCmWUp8JlyGXW5NQj3qcsE1aKu6MO+XZF06?=
 =?us-ascii?Q?qosYQlSbUCqJMEqir9u8FnL7sMsGKMCjw04xCFcm6SJUIJnEAJr+Mn+m1XHe?=
 =?us-ascii?Q?mFQroWeVlb0RHoab7VyVbg7w0CVDfPLIM69qyfYNP7gwP1tweb5vvK5ukrrI?=
 =?us-ascii?Q?ZdaXxjRPMxpvHZ+4jXxcufVBBp5+A5kasRqno+6QZwpvEfq/vCZLqbY8W9+q?=
 =?us-ascii?Q?4V36F6UgQBXTNYtmgocx1wZPzC77PkJCcb3X5lOwtblwU4jEz5YxPMNeOx1N?=
 =?us-ascii?Q?q5mess4JYYsyjpQdy1pYlNFAho4Zd+mHj7+EXvhf6MY87LZm3vwm3VEYnw11?=
 =?us-ascii?Q?x8eca/iPthzHgyVgjinHR+M1zhrBvcbgIyhBfkDsm3hklneFyIKvlkEOQaBx?=
 =?us-ascii?Q?wrvKVSNYekQkk+BLGeRis0i1wmnMCAv/tNUe4mkg8pjtDdxwuLKxRAAoDdX6?=
 =?us-ascii?Q?fcK3TwssoWc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IcW135y1l5o0XviDyZiRVzKO9Uu7UksTG4CRitq5STsMOteMGrHcTHaWtYi6?=
 =?us-ascii?Q?9DXDxceWTOXhvrbWDWh9F55ZuZx/2VA08Y2rV66vb3VM0NTXJLomAXEOPpUs?=
 =?us-ascii?Q?tPTRt2eUfWZiTfetV4eoBYchdrkQc8gYcdYVl1zEng1iiNXPgpeIGNSe40e8?=
 =?us-ascii?Q?qemMaq8+GW7BzT2m7PED15KtA5Pc/PPLFZftT7bXkcrmbUyDuQ7YvzrMjNlt?=
 =?us-ascii?Q?KpYC04gEyzoDGNQCS2fL9v/mVnX8sCXddfLE35DaxfEKrHnY/D6gCQbkQNsu?=
 =?us-ascii?Q?qCQjymD5Woek8r014kBwNZZrS02ekjuwKoo91FE0QC39hYDSqUXsJvyWJ8sD?=
 =?us-ascii?Q?lQax741Go/1DeMgY6h9Ul8SG4YbjtKhNFxL9uGsdqtPZ0o7+5saFmKbFd2v0?=
 =?us-ascii?Q?BD42sncmvTf7TJNTNfLnEom512Qb6lb2G5w5zRC/cHMWNyfgRHCh5zFu9GqA?=
 =?us-ascii?Q?HontcPtwg2L0mP9ip6N+d0SNmn/rIpLUpAULJXt5vQzrX5BILJf8/elHXDr6?=
 =?us-ascii?Q?/8OqyBpuJ7XFnmddAlSZcqJtacuRZeBgN5zby5t07xo7tzx8R8w6NOD7vilt?=
 =?us-ascii?Q?UIIPVrWKoJvY/1OWv6TdyyuFMgk1MDL7wYDkdHeh065xGkwJu4iGzffjaEaE?=
 =?us-ascii?Q?FLzw6Cd/5T5HqiqzhaGGJ+bmqFk+bUCNjopnMPRx63JCj9OFZZCcnjCH1N8X?=
 =?us-ascii?Q?2TLxyGZreuW3qOyw8ywa78pQsyuR01EU9p68ILMKDJ/4gWT4KGtAmp4RrDOX?=
 =?us-ascii?Q?LTQCFBlsNPh3Y6RYROA+16nhP22U044BI46fqTTd/f3PVZyBOW9M096G4wrG?=
 =?us-ascii?Q?jWeqG5DuCFhi0rYQasZbg4sjanAIgrZ+8dTgSs0ghPfAuYgpa1J1Lc1RI7rJ?=
 =?us-ascii?Q?iaKBTnaIyzGM6w7eNHQNrlKVWIIoYpvq3FqJb70+Pq7n3SEOTLYsCDn6AxLx?=
 =?us-ascii?Q?yYO470FGy12BpBvo+IzWyCbBEDplzLWozTNgFR3L2MPBPZ6kVJCCIJswg3xx?=
 =?us-ascii?Q?bbe8o6pFtR1a8RYy97nUbB6o56FCB7C+JUvOan7a0N+8/HfYSvt8QSKrd7Qc?=
 =?us-ascii?Q?OvjjJ7yDaPyMrLkek+mfbA5xKCBOn+z3QRHCQqR56Dc5piqKkKntWUBmuqOY?=
 =?us-ascii?Q?lnNA6ozCsHU9SCljbcdNBdX+dUyxAG0Q/C/pU+Dxdqk/FJytd98qHx1T+h3T?=
 =?us-ascii?Q?czWElXpgBiJlVG9U9dqArsuFkgJ5zoxgBbXL0cYiVe+vupLMNuPmVtTjcORB?=
 =?us-ascii?Q?zVegYUlnUeC9STltjsBOAvYzgP+8gaZqY1WVrdsJoz/gz2KFNDINdMAxsu9w?=
 =?us-ascii?Q?ZNVSlNAnvmQ0FIUn1eNiF7fvsR27Gf8X4+REZ1JTkIzncf4jO05qVBZeU3PN?=
 =?us-ascii?Q?kFilKx7FFMtlfic6knKlPgZEmI3J0F56kNKoAXX2XURGCpzICAXSMwtUAP3l?=
 =?us-ascii?Q?xdNXk3N0gUuCPV0DY9otpQAO9k9n1wO3hBLbReOm96XwArEn4mUCO19zr1S+?=
 =?us-ascii?Q?9R8MmkZVgdPXiqI7PpQXBP8bpRk9k++2MUwe42EHTYAuO1TuVH1GxRCTRNW4?=
 =?us-ascii?Q?qEJ7tELz+T/syUHn4EXhYovNOT1So2MNls2MOUTD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: ndigital.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a87ef8cd-5e50-4144-45f6-08ddba6b05f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 19:51:38.0245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fd6f7980-6d04-4a6f-86bf-8f6d0297dd2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Po9D7k8me+bD6+wTd3hZ2zQIVrmazbNwMZ0jlNnu9SqMX6FD+F3qCWITOS4WPgRT3+anKwKOKMB36dUg3b58Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT4PR01MB9926

From: Ryan Mann <rmann@ndigital.com>
This represents changes to the FTDI USB serial device drivers to support a =
new NDI (Northern Digital Inc.) product called the EMGUIDE GEMINI. The EMGU=
IDE GEMINI will support 1.2Mbaud the same as other NDI FTDI virtual COM por=
t devices. It was noticed in making this change that the NDI Aurora was inc=
luded in this "quirk", but it does not support rates as high as 1.2Mbaud, s=
o it was replaced by the EMGUIDE.
Previous FTDI devices produced by NDI all used the FTDI VID (0x0403) and a =
very limited set of PIDs that Future Technology Devices allowed NDI to use =
(0xda70 to 0xda74). Since then, NDI has reserved its own VID (0x23f2), and =
used two of the PIDs for two experimental, non-production products that did=
n't use the FTDI chip for USB connection.
This patch adds the new VID as "FTDI_NDI_VID" in the ftdi_sio_ids.h header =
file. It also reserves PID 0x0003 for the EMGUIDE GEMINI, as well as stubbi=
ng out PIDs 0x0004 through 0x0009 for "future" NDI devices. In the unlikely=
 event that the NDI hardware team chooses to implement the USB functionalit=
y using something other than FTDI chips, those "future device" lines may ne=
ed to get removed.
As the EMGUIDE GEMINI product development has not been completed and the st=
ep to write over the default VID and PID has not been completed, these code=
 changes have not been tested with an EMGUIDE GEMINI. However, the code cha=
nges were compiled successfully using Ubuntu 24.04 locally and tested as a =
module using an NDI Aurora system.

By making a contribution to this project, I certify that:

        (a) The contribution was created in whole or in part by me and I
            have the right to submit it under the open source license
            indicated in the file; or

        (b) The contribution is based upon previous work that, to the best
            of my knowledge, is covered under an appropriate open source
            license and I have the right under that license to submit that
            work with modifications, whether created in whole or in part
            by me, under the same open source license (unless I am
            permitted to submit under a different license), as indicated
            in the file; or

        (c) The contribution was provided directly to me by some other
            person who certified (a), (b) or (c) and I have not modified
            it.

        (d) I understand and agree that this project and the contribution
            are public and that a record of the contribution (including all
            personal information I submit with it, including my sign-off) i=
s
            maintained indefinitely and may be redistributed consistent wit=
h
            this project or the open source license(s) involved.

Signed-off-by: Ryan Mann <rmann@ndigital.com>
---
 drivers/usb/serial/ftdi_sio.c     | 16 +++++++++++++++-
 drivers/usb/serial/ftdi_sio_ids.h | 16 ++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 6ac7a0a5cf07..a41a9ed7e946 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -803,6 +803,20 @@ static const struct usb_device_id id_table_combined[] =
=3D {
 		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
 	{ USB_DEVICE(FTDI_VID, FTDI_NDI_AURORA_SCU_PID),
 		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_EMGUIDE_GEMINI_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_4_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_5_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_6_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_7_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_8_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
+	{ USB_DEVICE(FTDI_NDI_VID, FTDI_NDI_FUTURE_9_PID),
+		.driver_info =3D (kernel_ulong_t)&ftdi_NDI_device_quirk },
 	{ USB_DEVICE(TELLDUS_VID, TELLDUS_TELLSTICK_PID) },
 	{ USB_DEVICE(NOVITUS_VID, NOVITUS_BONO_E_PID) },
 	{ USB_DEVICE(FTDI_VID, RTSYSTEMS_USB_VX8_PID) },
@@ -1333,7 +1347,7 @@ static u32 get_ftdi_divisor(struct tty_struct *tty,
 			     (product_id =3D=3D FTDI_NDI_SPECTRA_SCU_PID)	||
 			     (product_id =3D=3D FTDI_NDI_FUTURE_2_PID)	||
 			     (product_id =3D=3D FTDI_NDI_FUTURE_3_PID)	||
-			     (product_id =3D=3D FTDI_NDI_AURORA_SCU_PID))	&&
+			     (product_id =3D=3D FTDI_NDI_EMGUIDE_GEMINI_PID)) &&
 			    (baud =3D=3D 19200)) {
 				baud =3D 1200000;
 			}
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_si=
o_ids.h
index 9acb6f837327..6e162a73f64c 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -197,13 +197,29 @@
=20
 /*
  * NDI (www.ndigital.com) product ids
+ * Almost all of these devices use FTDI's VID (0x0403).
+ * Newer devices use NDI Vendor ID
  */
+/* Using DA70 to DA74 block of FTDI VID (0x0403 ) */
 #define FTDI_NDI_HUC_PID		0xDA70	/* NDI Host USB Converter */
 #define FTDI_NDI_SPECTRA_SCU_PID	0xDA71	/* NDI Spectra SCU */
 #define FTDI_NDI_FUTURE_2_PID		0xDA72	/* NDI future device #2 */
 #define FTDI_NDI_FUTURE_3_PID		0xDA73	/* NDI future device #3 */
 #define FTDI_NDI_AURORA_SCU_PID		0xDA74	/* NDI Aurora SCU */
=20
+#define FTDI_NDI_VID 0x23F2 /* NDI Vendor ID */
+/*
+ * VID 0x23F2 PIDs 0x0001 and 0x0002 were used for products that do not us=
e FTDI
+ * The following NDI devices use NDI VID
+ */
+#define FTDI_NDI_EMGUIDE_GEMINI_PID	0x0003  /* NDI Emguide Gemini */
+#define FTDI_NDI_FUTURE_4_PID		0x0004 /* NDI future device #4 */
+#define FTDI_NDI_FUTURE_5_PID		0x0005 /* NDI future device #5 */
+#define FTDI_NDI_FUTURE_6_PID		0x0006 /* NDI future device #6 */
+#define FTDI_NDI_FUTURE_7_PID		0x0007 /* NDI future device #7 */
+#define FTDI_NDI_FUTURE_8_PID		0x0008 /* NDI future device #8 */
+#define FTDI_NDI_FUTURE_9_PID		0x0009 /* NDI future device #9 */
+
 /*
  * ChamSys Limited (www.chamsys.co.uk) USB wing/interface product IDs
  */
--=20
