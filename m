Received: from CAN01-YT3-obe.outbound.protection.outlook.com (mail-yt3can01on2110.outbound.protection.outlook.com [40.107.115.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACE92367DA;
	Thu,  3 Jul 2025 18:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.115.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568717; cv=fail; b=Hwd8XgwfnAQa493Ka8CXpgXzGerzDW1gOksPxf5NwygWZ+/b21tV0lKNHI47JqdNf372ug4J+1y5Il72llEb6jnlFEcZmnjl3MmP6/oS/aOJH18habDO5VYL32vw+7w5Yv26mSesZafT073kp5jDoWew54zjILt0RApEW4byzWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568717; c=relaxed/simple;
	bh=IeRgXYgqjos19HKpI4X5CsPDpYzFd2JR7xcITSlp0lk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=fnTo3i3Qv5BhcnxmYB4avUdy9tHgOGAhnQ9XJIvgPnRxvKAA4oNNYquT6O/TxrCj5QyATqigx85fukBPWClv58PIJUIlXCRo8wE6EbbTWqXcFMg8ZcoikuzyGxL63cH6hZ5hTTzPgSFStC7h+z73zRYZfJdOHwrKoBLVTZyBAHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ndigital.com; spf=pass smtp.mailfrom=ndigital.com; dkim=pass (2048-bit key) header.d=ndigital.com header.i=@ndigital.com header.b=OUUydzgI; arc=fail smtp.client-ip=40.107.115.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ndigital.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndigital.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndigital.com header.i=@ndigital.com header.b="OUUydzgI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAK2168/SPT26Eu384xKbByloh0pS3aTpEq3PHd/YYzZfUFdMJUrAG/46usBu/8RHlt/tGyq9u54rp5KvWPoc2eGGJxxNsqrPUFxxF7QU3NzVGj1ZRKbxFSsynr1wDtLYFd5Tus/KyHM/JQFPIKKfmh0rPpYesgTLDxGDljmoZOtr1kU6wI40cO3uUAsDLjI+1sOXgVFr8KiegKH6OSoZDYbmHqNWyqB2dwmOVFA5onwMhlUitLWQBpELRAbZXXd1+O2pBRiMOX5cQ6caQwUZHhOjw5lpeNJYIxivpT2V6dlt+ClW6cllS9d6BqtyJTZC2p2BF/RwmT37q9o6SrNsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeRgXYgqjos19HKpI4X5CsPDpYzFd2JR7xcITSlp0lk=;
 b=Rci4p/Ek9lO6uXGl4h4TQ7z6sNdm+Fd2BYluIHboxdBCVapBSg4D57nDrfRHzzFxoav70b9RBHRoab82JYMGuQ3+HRQ+8XE+PiJ02qEZ1nG7NfpcGxwekOiXTyLvS+m7KDU1bP5xHqMb0HIsjtQBPETjcp6XRtMjq+Pmuekr8+xtLm0Kr88mfef0wvo5h4+9hc8GX7JA+bZFvtUUFXVBshxOmV1whgD93iRrxUDF04J565kzct3oo01lBPT+2+fQnKC9TGihg5HAZZwE9tzzNnr+RKwmWPPiCZWurx5m/pzfpSEssqTT6kAktVpryxjDxco80nFJtsK0V/v/5R1BuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ndigital.com; dmarc=pass action=none header.from=ndigital.com;
 dkim=pass header.d=ndigital.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ndigital.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeRgXYgqjos19HKpI4X5CsPDpYzFd2JR7xcITSlp0lk=;
 b=OUUydzgIyem8F6rHe7KQbC9TqOU7bLPA++zRe0uqYmb4wlnT0vIWEIBw0Tv079svB/cBwIIA3aSwzzz72xs+JXfWdpjS1ewWcUQQtE/+pN6U1Ug1fqyWGHuPJOm/VifrErGI2o3Y60C/Pe8ieHFF1+WTR9cA0rzDlH8VkkNemhyW8HNJN4zmF3eCPuaJ+5X/+umgnbKTHiXtgwqzK49sUvYxb0GB3p0YGRlTpAXkVZHzAGeHu20OzbR9X1JPdAacXa5F/lmYHIV6LZXR4DZ5NuI0huRtIGlkBudOo/e9QNVUK5FpvIwzOBu6f9cpqYk/vEp8RucPSq+/uCbCSLH18w==
Received: from YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::5)
 by YT2PR01MB10636.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 18:51:50 +0000
Received: from YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::206e:a5af:7f5f:76a3]) by YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::206e:a5af:7f5f:76a3%3]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 18:51:50 +0000
From: Ryan Mann <rmann@ndigital.com>
To: "johan@kernel.org" <johan@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] NDI FTDI USB driver support
Thread-Topic: [PATCH] NDI FTDI USB driver support
Thread-Index: AdvsS1xa9R1d7OPFRyOyt2z1uvaDLA==
Date: Thu, 3 Jul 2025 18:51:50 +0000
Message-ID:
 <YQXPR01MB4987C8EA75554A89700D853DDF43A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ndigital.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YQXPR01MB4987:EE_|YT2PR01MB10636:EE_
x-ms-office365-filtering-correlation-id: 18c7b18c-b7a1-4dbc-e8f4-08ddba62aba4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7vRAzsP6GDiptbkHr9Z4zKb+HJ+xWrSkSdDaEnDy69dw6vX8h7HTEGxm2cyZ?=
 =?us-ascii?Q?B9S96kgPMzkUvB+6T23BUEfW/mqVbKxvb3wYfVzHYjWl1Q/RoBpjP3gH+rml?=
 =?us-ascii?Q?TdMF6g+NINSMVO+jZimqupAFRysRg8bXSYH/xjOSbRXuQdvxTu2yTuft8Lqp?=
 =?us-ascii?Q?GmLdTrvIavxmMaf5ZgCbRYBjNir4i+kAae+AcOHyN6298FmIXkh5Ws/YxMH1?=
 =?us-ascii?Q?9sk3gGRn4J1y2+mO3rXIhJZp4blDXFFqYZSJHxuEqoMgVl6bUOwSI9wV6kaW?=
 =?us-ascii?Q?Pe4kVBtEpGKQcSZ+EhyljX9C9cmd/1+tINZ5Q8L2y6u5jYaQ1PrQm+jLCizs?=
 =?us-ascii?Q?oZ9YdxJ+uxqxINOnLNVkwpIWljuHkvV+bIfqqlHGnFljCOdRxPhXxBJk/39v?=
 =?us-ascii?Q?YUBcC2T7dkpz14GIyqOGRa1PZ2aaPsrRhPnSLLTPQXzxV7d2+kAqmmhbaZzz?=
 =?us-ascii?Q?5akfOJ0PWAMpdEG6PVB4/xDksxQOWEFxsQ749ibZzltANa+iTCOo88AxSpAl?=
 =?us-ascii?Q?egqpC/iJlY8WZGDRs4fi67XMviaPp3g18RGgTWADERZfebNt7pLacJ8twvwc?=
 =?us-ascii?Q?3o9MF1W+BqmLkZhxMajqtvdk0Q7VFMR+w6bEUs8B2T3FaIWpOgT1euyWoN62?=
 =?us-ascii?Q?2EocQJ+OGmMqiu8MmrQ6ZLoy0hceipZuBi9QleWKmsocJ/F1Ec48rdXxy+po?=
 =?us-ascii?Q?HfP+HQ27NK204E5wtffok4PajW/5soGjzVDoCbWtiamHul0iVx47lfzEiQAn?=
 =?us-ascii?Q?1W9xtPV7zmZMeLD4qLH54NupnEWxRvTIHGyEzAF/NKNVzZWt/Hlh+jMENxuT?=
 =?us-ascii?Q?kRlVUqBbFz4im3QLndDLbAEe28HEdq/cGuqSGDcdhbsqphgikEpi23potO7H?=
 =?us-ascii?Q?DvKlX/HUq3YMkahvJqL5SqmTpRaa7HF0DTo+HWJR+tTmzYSVDpHQa4mFs9b5?=
 =?us-ascii?Q?JfDn+gDxJxsZWPRnKqsBLEEsPHmJWc9L7FIqJehBo0Z8/PIbhDWOHE/uLDaC?=
 =?us-ascii?Q?YZVjKqae72znAXYUdP2+gl32u2YhUwbiQ3OMuPlF2cc/riR4Gc5W12N9rXiS?=
 =?us-ascii?Q?dcpAO/R2mAh9u6kULGTpXz+WlHaYiar5PEsYXy9d+YWJZtjvWC9LwEC41Ydp?=
 =?us-ascii?Q?3pZUoy0UtSf0laEkzQB6yS8mOor3ixUVrVcM8N4Q0MbCrSV5byhzeqYNWnQC?=
 =?us-ascii?Q?G6RGdJTlmQLohhx4//LJZGab7jpwG22HVGXZvpiV3pF63y2POjl06K2I8yHP?=
 =?us-ascii?Q?yOH0r+uWJIfK7krwua44elNVpihJpxfyfWsrI9dNfGGgN+iU9JA65DeyFiQw?=
 =?us-ascii?Q?pH9DfDpkJiYc+wNU/ciHI0iD6fDANE3A2KHPTXXPBITVdo/DntafPE/f90dJ?=
 =?us-ascii?Q?aLbEkVoLDC/G9TMpd1twNdQg4YJlZ+/lGPMR7MCUhcnHqwIjj0DafKTUxsqR?=
 =?us-ascii?Q?TZY64tlVXTk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iXmyfGnFjUCpgUX1MsMLWRGNq+uwyYc6HU/mkarvrcIxE5mzDlxEWFYtFENH?=
 =?us-ascii?Q?2Q/f876/izZJlC/BgLpgf940dpSLueswCNQTU6pD3xKIGjIZySuGz6MBeIvJ?=
 =?us-ascii?Q?tQIZXNnSRnob9UCZGkY9TET/5Uaq1EDJrqoOVgSUZ1O3V4c430Uul0rTgRTL?=
 =?us-ascii?Q?Csz2qoVZjD98xOC7TUw/Q7Taz4t3eV6t7Fn9B50MkJye4t07NqC7V0+epwcE?=
 =?us-ascii?Q?sVqumlNERRV/BE9gsGc2sg5MVKRR95owfU64f0Y8n/peSWVCwtEe2ygCgTJu?=
 =?us-ascii?Q?o2M2Ux15g7ZK113EWMkJP8hBB3eg9SUnjLTirqNg945s3yIlauqzN1jh38Q2?=
 =?us-ascii?Q?hYB+0Ur+oMm6DNr5ssGxB4Yufic7s9MAMpr8dd+ZXHDuiESIfA47w3GDJOtM?=
 =?us-ascii?Q?5/jlMAnX3XN4/smZtfLjeDlO1PCugjil+ND4L9kEvSsZqf/+tecxCYylW+e6?=
 =?us-ascii?Q?hBUvlG6HHTBQnq9kRnzKQgpHw50AIfdh1Hhc/siUwNug7RDfCi4geolAzkBz?=
 =?us-ascii?Q?ABXIdxQMfEfgaLEzO6gNbiU6VFTI7aFLY1TOgpwf6hya2rTp+A13fQeLDeqo?=
 =?us-ascii?Q?W5HBr8TMgT+D+EMPPQNkrSEPu8/5G8+Kh+DRhuFnNBTn7DokF8O3bOp06EAl?=
 =?us-ascii?Q?cJJVSDRAZ2YJ/v7qX2hJ6TDPNE45+tBwCNOMDfZB/HdoyD1Y7vcGmySiV0ME?=
 =?us-ascii?Q?IOPJMwqxjDHm8Qed7iITEkUUNItcEFPjw9AEZB3wrFm9BFDAJMZSWxmfuPhL?=
 =?us-ascii?Q?R5ZYiwxRp2jZK8cDc++OW8LnXVjQbNC5BTVNglHNepEQ4rI7D+XESgEWUAL1?=
 =?us-ascii?Q?bstyvHKdZyCh9EPhbDTFYHDFhK3rYoARinroBJVYH8WWnsNSAna/6pZuoaq/?=
 =?us-ascii?Q?YXfQfS+/pQVdE0GZfOLoLXuHS/aJXFAZX3KGdM66+OH4jNE5ALpcXnnUh667?=
 =?us-ascii?Q?dKQdlDd0nbLeAfIozjKU/8fy7TMQtH8qqHA8caljNuQhdF3hJjDgzmoo7XQT?=
 =?us-ascii?Q?kXhuREdrGdSIsG5g1+z2PFfmnIaB2ueRNFpiglDK5uXgkzGSXjopfoHzrclE?=
 =?us-ascii?Q?DAA0FHW5SI4u3FwCDYEfjQyKD+dSnnV3l/Xp/ibX7s/Z8sqAbDYPJSkOfR85?=
 =?us-ascii?Q?f0i4bXqSbPFXEFKI/yy6IRQD0ai0hTOHKDU6VpJsniv0PEIMQX9/XO1IDAPM?=
 =?us-ascii?Q?+3RawBdkthMla1rYNgmOjSJ5oVLy2dFR7PaPrjXwtKMeKJxeqXdHfCbg7Csw?=
 =?us-ascii?Q?apVlm0sFuWXw86GRke5DVLK+njX7Rjk7rpfxVCa4ynUV+mfNrOVInm3elaze?=
 =?us-ascii?Q?Po7R7EIX5B5JqhWXJs/CXEZy5BP90E38F+Xn83o4OK4OnyTgdSa8bWsDfI3Y?=
 =?us-ascii?Q?A3/mvcZ23nI8cqx7v6uWOpIeuu5ejm6fIEtctpBYGD7ek97UUeQmmJHjSPHe?=
 =?us-ascii?Q?5+3YWqRhVYN7DQdFDV2IBTDo6YmZLzSw2ynbQDQaUFx8xzcJIbgCO71dvzQL?=
 =?us-ascii?Q?5m2JftNUAnGVY0tRY/nuWW5gvpuOrKEKoKvNGaFKCsnnb6Yk4fMOxQVmiCAI?=
 =?us-ascii?Q?lEEhgbSzk2+xNPZaLDuJnLfkO3n2l3upjfC5XMC2?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c7b18c-b7a1-4dbc-e8f4-08ddba62aba4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 18:51:50.5518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fd6f7980-6d04-4a6f-86bf-8f6d0297dd2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qnDSFsIx5ba8HUe8LtYz7WM32DnSDFRIpjOVw2GyhSw1FxDVxWI0Z8g3tl0g4iyv03V9zYmisaEXthonWXdo5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB10636

Hi John and Greg,
Tag: ndi-usb-serial-ftdi-6.16-rc4
Public branch: https://github.com/rmann-ndi/linux-kernel/tree/ndi_usb_seria=
l_ftdi
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
Thanks,
-------------------------------------
Ryan Mann
Software Development Lead
103 Randall Drive
Waterloo, ON, Canada N2V 1C5
www.ndigital.com
