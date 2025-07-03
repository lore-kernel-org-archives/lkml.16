Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022081.outbound.protection.outlook.com [40.107.193.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812E12F50B1;
	Thu,  3 Jul 2025 18:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.193.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568795; cv=fail; b=WzmX/ql0mRD67phKxUjvy4b5wt1pEORhwCBogTg12S+w2QCCTWDFLFv52dpxancvy7AYQEslHhn3C3zsln5LvZ27iGOCBRDFm9ecRt2Pj89OvgW0VvDHCCAld0Hl7eGp7x6wsW7HG3uLT8wfUkUPRtdV2zJyHgAVOKP0w+2jfCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568795; c=relaxed/simple;
	bh=B3AItXLvrVdjNjCop3VOjgUw+qrsdv+G2Sa589tb8Mk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=duEDpvc/znr5xVugt1EH5eOtDU6pKCOPf7oAmADYItTzvWx5ybCaH2HYZCkjqH2KaXN/sZL5Ngt/iRD9OBG875nO7r61p4URxfRQuc5sIo0h1cewP9ZDbLO/F00kksTH6RcSFqGD+Y4qkMV/Xl4ipI6f5GaRELFrjliKItgSHcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ndigital.com; spf=pass smtp.mailfrom=ndigital.com; dkim=pass (2048-bit key) header.d=ndigital.com header.i=@ndigital.com header.b=Lkgf1vUJ; arc=fail smtp.client-ip=40.107.193.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ndigital.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndigital.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndigital.com header.i=@ndigital.com header.b="Lkgf1vUJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERsHPpHmqDIR717KGMtJn/ALXLXQbkiDCnf8e6wrywEnES5YnNfnRQtCYr1dZ8Qj3JJ6G31uk8+6bVX3vgPZiz77g+cXIaBkkmnFKxnFjb4fotWSAVI22lERFLzzWsEModmsR1lQUhjrdJVeBT5vTk9ZAHdtjQ12du3Os3Jym+EdUIBEpDZ+N8lAhpmiuz3NniPnzD0YSJiq6tFvbcnsB3cMtRF+x+2YoZwJIrU1BEfRiwyzryRiUHiwexiOdV9SkEfsiVlXBlUEp6IL0XKJP+1W4yHGJbQQiuldNsAWNexM+KpZO2eZxch0NgBaFHIHSMoyXaMGOr9KMRyMFDvE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tGytvdb2c+s4Qmc2gRvIBT8jcn4LyTk+GEi6NI0MjQ=;
 b=YaDDLpEvLJaNTBXQ4//Sao/XKQFq5NofwrlVcXgr2jg8hwTgc+K3+vLcvvnZm4L6lqtT2cwQVRcT4FwH6DyAP/0sCf6HYoUIAuQa+ri9WgXHuHRNDJBkke/JH1MkDG0tBKdVlYzdE3S2wDqZdWMf+YNyHpFSjPfySyhBXtK1PtguXAFhceKeKHwFvZFBQUUrr8Zvnc9b5J7fmte3HdjAmssx+HDgL/6bw8bPw6BlDtQcVLqexe0jqwevisWz47ZeE3EDz91R34B1Rm8AyPCc4fGVhqTDC+wmjKl+6QXWdREqCZ0U6+WW5bgIBrnJh2IgEt6MBkmfZV/jhJVMbRSy/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ndigital.com; dmarc=pass action=none header.from=ndigital.com;
 dkim=pass header.d=ndigital.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ndigital.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tGytvdb2c+s4Qmc2gRvIBT8jcn4LyTk+GEi6NI0MjQ=;
 b=Lkgf1vUJtaHyGqf0l57+rvZiWl9k5HF15vW2NHERKf04ffoYW8mm0RosgpL6TIGGxQBQ2FYUJZNw8Ls0cChAagnFa0LDWu1Th/NkWtp5ulxmkN9IXjNOrGIgKO5mEb1BXFRLxQpQaOtKbtDMiNYkrU5YG0dIE3w8qp9c/eI1bxmL29d2uOKFhQCJKaWtWcyrjhxSvV0cgWAmpbSkO3nJNO2/Ub4hlhG716S4IY0Hk8wEHuJcTEuXwcomttN34aQ1LOqLx/2QRZ5095aHmAwNR2azTrA33k3MWoTEQFCWH746K1NDqneQ0WqR8XcN8SkaWmROYMi0ECB9s+we5UQZkQ==
Received: from YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:27::5)
 by YQBPR0101MB9838.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:7a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 18:53:06 +0000
Received: from YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::206e:a5af:7f5f:76a3]) by YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::206e:a5af:7f5f:76a3%3]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 18:53:06 +0000
From: Ryan Mann <rmann@ndigital.com>
To: "johan@kernel.org" <johan@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] NDI FTDI USB driver support
Thread-Topic: [PATCH] NDI FTDI USB driver support
Thread-Index: AdvsS7WrbM9mp7gvQ9GhY23a3boxLw==
Date: Thu, 3 Jul 2025 18:53:06 +0000
Message-ID:
 <YQXPR01MB498723CF19D915DD09C8C0B5DF43A@YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ndigital.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YQXPR01MB4987:EE_|YQBPR0101MB9838:EE_
x-ms-office365-filtering-correlation-id: 30a5ea27-c339-4b38-b518-08ddba62d8dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|4053099003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ShZMNDayEj/51zRRgFlkuau9tPtvY45wPg1g5bVucLi/q/i5899xCzDZYtyu?=
 =?us-ascii?Q?DwAuKk89gNVfKcBuEGRCs8zP6kMplYKxWHqmNicife6+FRvT2WawpUPZ6oAX?=
 =?us-ascii?Q?aO/TiFu6fZKr5/ZAihUkHO3qpKQPrr9bQlRa91a6Qd7oAxIyk1t0BG7VEVfk?=
 =?us-ascii?Q?rgcb//9UlqrkAQ+P+D7jooLGu+TjqfsiU3K5Vn+7G/rOofK7rl4aQUXaqUPN?=
 =?us-ascii?Q?PPPb2s66b6etqBhEUGghA5LUE11WPQyvuLRMK2zzIJEwobvhh7eTvcloHgfg?=
 =?us-ascii?Q?W3sIBKr2D3GCzfQV8r5fXZ6h0tW3/60/5jQfQuI6+ayrjU8ao9++hC4KR+7r?=
 =?us-ascii?Q?EwFPHxxKsDdGRLNbJVw4Sl3Zsspcu9I5IBwcjuNNeBpMMkfYYvWOlCjx7cJD?=
 =?us-ascii?Q?fqBco+dFqYbz0L+P5wwNR21y3KwRx9YSWxQ8FT8boornMSwMaopQFqFwPcMe?=
 =?us-ascii?Q?PTWHWvX4fYCfKMFaSo4dz2TqMTjyMWuS0sLm7b5NQ9Xds3+khcs6Y/25tNgQ?=
 =?us-ascii?Q?DaVFMBfJruYFBtIGYq46N21ffp3qRX3DWWcsK8o5b587VVajo7j40MDQJ8Pt?=
 =?us-ascii?Q?DB+mejrIEzSFPkz0DPR77gqALTWD37Q9bCK2MR71OxhJoTNeaaVTLd76XxrZ?=
 =?us-ascii?Q?S/Ylgrz70K3gQJbADqIwPlwDU0ouN7/GuXdh5AkVQwoBvMWe4j1HxrbFddKo?=
 =?us-ascii?Q?CQvh82evbhkauFUjjrptypCNWo15LjnpM7HBA7CISPzaEm3Cr6DFlfFKFv93?=
 =?us-ascii?Q?dq+PQuM5bzMBm0qAVP/4RGG0jBBn4gwcGHPDx9Yxr2wK61DvNknAF+lZ0N/C?=
 =?us-ascii?Q?awkyHOTLduO7D7cxRk+Y9Zo10VQidFKpBCaXbLYrL8E0Y1GLVmGv6dPu0t38?=
 =?us-ascii?Q?Ws7SR1AxsnqVo2jpsj6u1N1h1/a1KYrEiBL/Zv5sJhtCN9R8ZGQLMuqQKInP?=
 =?us-ascii?Q?PfJ2bQXjEf+6tCkn1sNeWlAFrmdSVJWlo5HGUCWNIWEEPeAeWRGwTYwGtter?=
 =?us-ascii?Q?c/Bw0a/UHHbtVjtBSEje7yAFEvcQx1qceQAToP50ruQJEnKsUyhMM9a4+SBg?=
 =?us-ascii?Q?XbdUy5AYHUUj3bAdWL/4a4vU8RR6fvyav/1U4/RABsBiPCfb7jY7KhDsqf53?=
 =?us-ascii?Q?RDt+3TNGy1HCAiUFve8DQYtJAj8Vo2d6U7zQK92YEf0zqF29v0JyX/+dRuM9?=
 =?us-ascii?Q?KfJ7CpafVSfjiiwLIpLao30iev2u/A5AGLkaU7HlR8ItUZF9cRr1vglbXmoG?=
 =?us-ascii?Q?khXwySLCA+bI3rAW+leonUwAsvzxZp80vqObyZg1kfBQskqmENSAtBOWAFJ1?=
 =?us-ascii?Q?WYn2AU9X21Iz5h7HtRa8FOgHIOB/kNRPF0AVMV8Ab7Ewri+KNcXfYbPr00IO?=
 =?us-ascii?Q?7sH83qnhR9+dU3xQZsu1SeSg53lkBMp1Dlk7MhDl6kMXF2wI03MNt9iuujka?=
 =?us-ascii?Q?afEDqyOoGwM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(4053099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?aoHJHbrUF5Ij1020J1MKSrYQ1trBMPDPOLcqNaZlgaQSHaUuBizPUzTL4i0i?=
 =?us-ascii?Q?BwYjLXdM3PSFiLTRAmJl3kRdfrFFWeZZk22QqUPvfmajsQxIgJhfQxrYVTdZ?=
 =?us-ascii?Q?PuBROQeU/Tik2G9h5TZxYj8hbow49k8Odqd6BKwkwCHs5RUmwB9JTB3k2s4d?=
 =?us-ascii?Q?YRF5Cl9//LI0yalmuf2KUTIeYte4GjnFN4ORsVvzmeCWlWshCa8yK2JE6h1i?=
 =?us-ascii?Q?2rucQoGo6fL88X4qUwDeZJ46E2Ahv0VcBkQ7ePvdd0O8VnBJ7KxZSjZMwBqe?=
 =?us-ascii?Q?iFsPGCFQzGQzP0YTDBYE+RCML8mexAxE+/XoPdbGFSZcMunDBJIvHQRVosal?=
 =?us-ascii?Q?zMDULHEKgM+32nqDVYCO+qSJtKR4xI5Nge6F8WmOAEzscR4BtgMRN3pHWSMG?=
 =?us-ascii?Q?HzIJwpnvjcqCNOEPvyn6aFeDZ78vgEMcsA6gKlEFQ9uhVs+t10nPedPN5WOn?=
 =?us-ascii?Q?5Lz/xNDsw+vn82AQfnQpcdRxhcE9iMTbB7tT2lmqu4uvbWq/qLsQ5wobFwa2?=
 =?us-ascii?Q?MNTPddgBq5c3UCPl51VhmNwkmqW/Y8jc5HR84ZytNmPZfXTW+2g8d/ZAct+8?=
 =?us-ascii?Q?7U5pe0p+b9cbxGnHx8E9cjbqwZlOY/C4/VzlwU6+eVUU/EEFILqLwVyvzV1U?=
 =?us-ascii?Q?4ClOGuXkg6Yz1k/afqv1kb9Yw+gtpV82H9KWP7+ff/P4jkgmv049Jhq6twIF?=
 =?us-ascii?Q?kwSS5gxHVmCzbuerbbHWyrcEvtTyOP/bCRfXuJcQPbZx3Vbm6z1VkxhGBtDG?=
 =?us-ascii?Q?I4DOsriGO0zHcYdTULXXllY8jj91GLGuLmUz05HI5fNtrcV4ebC8o/P9r4MA?=
 =?us-ascii?Q?jDUnGM0TR21C1ADATr8jgzgfIDFn1HypdkeD7NSCgT8SOXv7k9wnohrdn7Cm?=
 =?us-ascii?Q?P0fKGFgOSfjiwZFloHoibudV/gWsIYw/q1OrAywS/3paBmDfaQ1XhrHOPlt8?=
 =?us-ascii?Q?waY1VI0T1u/KwtrxCo4c7rAWJzNPb++qmBrTwLfM8gVsuMApYzr/AVrj84hn?=
 =?us-ascii?Q?43enrwVX355tGVDAeDWKOBFk1x0kvZCk9MAlrFHvvTNotTpvBJqucneQBNbi?=
 =?us-ascii?Q?NzyEmehuw3KEnkXG9hlB9M+56/NsPQAEA/KvQfsXOHfkN3s9rOSmInTv+i2u?=
 =?us-ascii?Q?oIFuQQCnCC+krPNUvtZEcVuZCZQgicMYG9qZGX5Vp2rT5unv4WWrlYyxjfG3?=
 =?us-ascii?Q?9BpXYgOOxZ4JxZY6XmF21EDDRU10EJufSBwD00q6+gAr4QDRxe/yeHWzScRp?=
 =?us-ascii?Q?iWQqeelIpKzDzpZ1eRD1HMgMe5ZucQhL5uhFslWoBzc0CXLrSP0NXu7YRBqU?=
 =?us-ascii?Q?Ns/Unwzrq38Xne5UQSYCtuxdzbGIzXsjkLTnRz7QmacR8PZJyG1HMUBHQ6mj?=
 =?us-ascii?Q?XDaEBbvwZ4YI3ybykokm8huGrh0EWNQy0hfOdurz6OM/XGxyjsuFJGAHVD5m?=
 =?us-ascii?Q?0exPT+RG7QkmpRdfAhcIuSkHvblMqTlHfhYcu9doVTuzwAQWhlZpReL4A6Rm?=
 =?us-ascii?Q?SU0cgKcJatg7AJnl4i6pWIFrJR7lYnO9On0j4F3dl6mTV2o4x5JRPWHiEzRt?=
 =?us-ascii?Q?e0FT3kgBz4AxAZCn2QJp2XTBQKllXUcPOhkgvvua?=
Content-Type: multipart/mixed;
	boundary="_002_YQXPR01MB498723CF19D915DD09C8C0B5DF43AYQXPR01MB4987CANP_"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: ndigital.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YQXPR01MB4987.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a5ea27-c339-4b38-b518-08ddba62d8dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 18:53:06.4150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fd6f7980-6d04-4a6f-86bf-8f6d0297dd2f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wtem0IdFyNtlya9UmFMOzroLn5zUNECdvuO7ND5Uu//QwJwQgA31VcM49T17Fng5xs1THSkCt/qxbXyGtvL5hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB9838

--_002_YQXPR01MB498723CF19D915DD09C8C0B5DF43AYQXPR01MB4987CANP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

--_002_YQXPR01MB498723CF19D915DD09C8C0B5DF43AYQXPR01MB4987CANP_
Content-Type: application/octet-stream;
	name="0001-NDI-FTDI-driver-support.patch"
Content-Description: 0001-NDI-FTDI-driver-support.patch
Content-Disposition: attachment;
	filename="0001-NDI-FTDI-driver-support.patch"; size=5145;
	creation-date="Thu, 03 Jul 2025 18:52:22 GMT";
	modification-date="Thu, 03 Jul 2025 18:53:06 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyN2IyNGQ5Zjg0ZDA4OWNjZWVhODdjY2IzNTY2ZGNkMTA3NWQ1MjI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBybWFubi1uZGkgPHJtYW5uQG5kaWdpdGFsLmNvbT4KRGF0ZTog
VGh1LCAzIEp1bCAyMDI1IDEzOjUwOjAyIC0wNDAwClN1YmplY3Q6IFtQQVRDSF0gTkRJIEZUREkg
ZHJpdmVyIHN1cHBvcnQKCkFkZGVkIHN1cHBvcnQgZm9yIG5ldyBOREkgRlRESSBVU0IgVkNQIGRl
dmljZTogRU1HVUlERS4KVGhpcyByZXByZXNlbnRzIGNoYW5nZXMgdG8gdGhlIHVzYi1zZXJpYWwt
ZnRkaSBkcml2ZXJzIHRvIHN1cHBvcnQgYSBuZXcgTkRJIHByb2R1Y3QgY2FsbGVkIHRoZSBFTUdV
SURFIEdFTUlOSS4gVGhlIEVNR1VJREUgR0VNSU5JIHdpbGwgc3VwcG9ydCAxLjJNYmF1ZCB0aGUg
c2FtZSBhcyBvdGhlciBOREkgRlRESSB2aXJ0dWFsIENPTSBwb3J0IGRldmljZXMuIEl0IHdhcyBu
b3RpY2VkIGluIG1ha2luZyB0aGlzIGNoYW5nZSB0aGF0IHRoZSBOREkgQXVyb3JhIHdhcyBpbmNs
dWRlZCBpbiB0aGlzICJxdWlyayIsIGJ1dCBpdCBkb2VzIG5vdCBzdXBwb3J0IHJhdGVzIGFzIGhp
Z2ggYXMgMS4yTWJhdWQsIHNvIGl0IHdhcyByZXBsYWNlZCBieSB0aGUgRU1HVUlERS4KUHJldmlv
dXMgRlRESSBkZXZpY2VzIHByb2R1Y2VkIGJ5IE5ESSBhbGwgdXNlZCB0aGUgRlRESSBWSUQgKDB4
MDQwMykgYW5kIGEgdmVyeSBsaW1pdGVkIHNldCBvZiBQSURzIHRoYXQgRnV0dXJlIFRlY2hub2xv
Z3kgRGV2aWNlcyBhbGxvd2VkIE5ESSB0byB1c2UgKDB4ZGE3MCB0byAweGRhNzQpLiBTaW5jZSB0
aGVuLCBOREkgaGFzIHJlc2VydmVkIGl0cyBvd24gVklEICgweDIzZjIpLCBhbmQgdXNlZCB0d28g
b2YgdGhlIFBJRHMgZm9yIHR3byBleHBlcmltZW50YWwsIG5vbi1wcm9kdWN0aW9uIHByb2R1Y3Rz
IHRoYXQgZGlkbid0IHVzZSB0aGUgRlRESSBjaGlwIGZvciBVU0IgY29ubmVjdGlvbi4KVGhpcyBw
dWxsIHJlcXVlc3QgYWRkcyB0aGUgbmV3IFZJRCBhcyAiRlRESV9ORElfVklEIiBpbiB0aGUgZnRk
aV9zaW9faWRzLmggaGVhZGVyIGZpbGUuIEl0IGFsc28gcmVzZXJ2ZXMgUElEIDB4MDAwMyBmb3Ig
dGhlIEVNR1VJREUgR0VNSU5JLCBhcyB3ZWxsIGFzIHN0dWJiaW5nIG91dCBQSURzIDB4MDAwNCB0
aHJvdWdoIDB4MDAwOSBmb3IgImZ1dHVyZSIgTkRJIGRldmljZXMuIEluIHRoZSB1bmxpa2VseSBl
dmVudCB0aGF0IHRoZSBOREkgaGFyZHdhcmUgdGVhbSBjaG9vc2VzIHRvIGltcGxlbWVudCB0aGUg
VVNCIGZ1bmN0aW9uYWxpdHkgdXNpbmcgc29tZXRoaW5nIG90aGVyIHRoYW4gRlRESSBjaGlwcywg
dGhvc2UgImZ1dHVyZSBkZXZpY2UiIGxpbmVzIG1heSBuZWVkIHRvIGdldCByZW1vdmVkLgpBcyB0
aGUgRU1HVUlERSBHRU1JTkkgcHJvZHVjdCBkZXZlbG9wbWVudCBoYXMgbm90IGJlZW4gY29tcGxl
dGVkIGFuZCB0aGUgc3RlcCB0byB3cml0ZSBvdmVyIHRoZSBkZWZhdWx0IFZJRCBhbmQgUElEIGhh
cyBub3QgYmVlbiBjb21wbGV0ZWQsIHRoZXNlIGNvZGUgY2hhbmdlcyBoYXZlIG5vdCBiZWVuIHRl
c3RlZCB3aXRoIGFuIEVNR1VJREUgR0VNSU5JLiBIb3dldmVyLCB0aGUgY29kZSBjaGFuZ2VzIHdl
cmUgY29tcGlsZWQgc3VjY2Vzc2Z1bGx5IHVzaW5nIFVidW50dSAyNC4wNCBsb2NhbGx5IGFuZCB0
ZXN0ZWQgYXMgYSBtb2R1bGUgdXNpbmcgYW4gTkRJIEF1cm9yYSBzeXN0ZW0uCi0tLQogZHJpdmVy
cy91c2Ivc2VyaWFsL2Z0ZGlfc2lvLmMgICAgIHwgMTYgKysrKysrKysrKysrKysrLQogZHJpdmVy
cy91c2Ivc2VyaWFsL2Z0ZGlfc2lvX2lkcy5oIHwgMTYgKysrKysrKysrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2Ivc2VyaWFsL2Z0ZGlfc2lvLmMgYi9kcml2ZXJzL3VzYi9zZXJpYWwvZnRkaV9z
aW8uYwppbmRleCA2YWM3YTBhNWNmMDcuLmE0MWE5ZWQ3ZTk0NiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy91c2Ivc2VyaWFsL2Z0ZGlfc2lvLmMKKysrIGIvZHJpdmVycy91c2Ivc2VyaWFsL2Z0ZGlfc2lv
LmMKQEAgLTgwMyw2ICs4MDMsMjAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB1c2JfZGV2aWNlX2lk
IGlkX3RhYmxlX2NvbWJpbmVkW10gPSB7CiAJCS5kcml2ZXJfaW5mbyA9IChrZXJuZWxfdWxvbmdf
dCkmZnRkaV9ORElfZGV2aWNlX3F1aXJrIH0sCiAJeyBVU0JfREVWSUNFKEZURElfVklELCBGVERJ
X05ESV9BVVJPUkFfU0NVX1BJRCksCiAJCS5kcml2ZXJfaW5mbyA9IChrZXJuZWxfdWxvbmdfdCkm
ZnRkaV9ORElfZGV2aWNlX3F1aXJrIH0sCisJeyBVU0JfREVWSUNFKEZURElfTkRJX1ZJRCwgRlRE
SV9ORElfRU1HVUlERV9HRU1JTklfUElEKSwKKwkJLmRyaXZlcl9pbmZvID0gKGtlcm5lbF91bG9u
Z190KSZmdGRpX05ESV9kZXZpY2VfcXVpcmsgfSwKKwl7IFVTQl9ERVZJQ0UoRlRESV9ORElfVklE
LCBGVERJX05ESV9GVVRVUkVfNF9QSUQpLAorCQkuZHJpdmVyX2luZm8gPSAoa2VybmVsX3Vsb25n
X3QpJmZ0ZGlfTkRJX2RldmljZV9xdWlyayB9LAorCXsgVVNCX0RFVklDRShGVERJX05ESV9WSUQs
IEZURElfTkRJX0ZVVFVSRV81X1BJRCksCisJCS5kcml2ZXJfaW5mbyA9IChrZXJuZWxfdWxvbmdf
dCkmZnRkaV9ORElfZGV2aWNlX3F1aXJrIH0sCisJeyBVU0JfREVWSUNFKEZURElfTkRJX1ZJRCwg
RlRESV9ORElfRlVUVVJFXzZfUElEKSwKKwkJLmRyaXZlcl9pbmZvID0gKGtlcm5lbF91bG9uZ190
KSZmdGRpX05ESV9kZXZpY2VfcXVpcmsgfSwKKwl7IFVTQl9ERVZJQ0UoRlRESV9ORElfVklELCBG
VERJX05ESV9GVVRVUkVfN19QSUQpLAorCQkuZHJpdmVyX2luZm8gPSAoa2VybmVsX3Vsb25nX3Qp
JmZ0ZGlfTkRJX2RldmljZV9xdWlyayB9LAorCXsgVVNCX0RFVklDRShGVERJX05ESV9WSUQsIEZU
RElfTkRJX0ZVVFVSRV84X1BJRCksCisJCS5kcml2ZXJfaW5mbyA9IChrZXJuZWxfdWxvbmdfdCkm
ZnRkaV9ORElfZGV2aWNlX3F1aXJrIH0sCisJeyBVU0JfREVWSUNFKEZURElfTkRJX1ZJRCwgRlRE
SV9ORElfRlVUVVJFXzlfUElEKSwKKwkJLmRyaXZlcl9pbmZvID0gKGtlcm5lbF91bG9uZ190KSZm
dGRpX05ESV9kZXZpY2VfcXVpcmsgfSwKIAl7IFVTQl9ERVZJQ0UoVEVMTERVU19WSUQsIFRFTExE
VVNfVEVMTFNUSUNLX1BJRCkgfSwKIAl7IFVTQl9ERVZJQ0UoTk9WSVRVU19WSUQsIE5PVklUVVNf
Qk9OT19FX1BJRCkgfSwKIAl7IFVTQl9ERVZJQ0UoRlRESV9WSUQsIFJUU1lTVEVNU19VU0JfVlg4
X1BJRCkgfSwKQEAgLTEzMzMsNyArMTM0Nyw3IEBAIHN0YXRpYyB1MzIgZ2V0X2Z0ZGlfZGl2aXNv
cihzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5LAogCQkJICAgICAocHJvZHVjdF9pZCA9PSBGVERJX05E
SV9TUEVDVFJBX1NDVV9QSUQpCXx8CiAJCQkgICAgIChwcm9kdWN0X2lkID09IEZURElfTkRJX0ZV
VFVSRV8yX1BJRCkJfHwKIAkJCSAgICAgKHByb2R1Y3RfaWQgPT0gRlRESV9ORElfRlVUVVJFXzNf
UElEKQl8fAotCQkJICAgICAocHJvZHVjdF9pZCA9PSBGVERJX05ESV9BVVJPUkFfU0NVX1BJRCkp
CSYmCisJCQkgICAgIChwcm9kdWN0X2lkID09IEZURElfTkRJX0VNR1VJREVfR0VNSU5JX1BJRCkp
ICYmCiAJCQkgICAgKGJhdWQgPT0gMTkyMDApKSB7CiAJCQkJYmF1ZCA9IDEyMDAwMDA7CiAJCQl9
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9zZXJpYWwvZnRkaV9zaW9faWRzLmggYi9kcml2ZXJz
L3VzYi9zZXJpYWwvZnRkaV9zaW9faWRzLmgKaW5kZXggOWFjYjZmODM3MzI3Li42ZTE2MmE3M2Y2
NGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL3NlcmlhbC9mdGRpX3Npb19pZHMuaAorKysgYi9k
cml2ZXJzL3VzYi9zZXJpYWwvZnRkaV9zaW9faWRzLmgKQEAgLTE5NywxMyArMTk3LDI5IEBACiAK
IC8qCiAgKiBOREkgKHd3dy5uZGlnaXRhbC5jb20pIHByb2R1Y3QgaWRzCisgKiBBbG1vc3QgYWxs
IG9mIHRoZXNlIGRldmljZXMgdXNlIEZUREkncyBWSUQgKDB4MDQwMykuCisgKiBOZXdlciBkZXZp
Y2VzIHVzZSBOREkgVmVuZG9yIElECiAgKi8KKy8qIFVzaW5nIERBNzAgdG8gREE3NCBibG9jayBv
ZiBGVERJIFZJRCAoMHgwNDAzICkgKi8KICNkZWZpbmUgRlRESV9ORElfSFVDX1BJRAkJMHhEQTcw
CS8qIE5ESSBIb3N0IFVTQiBDb252ZXJ0ZXIgKi8KICNkZWZpbmUgRlRESV9ORElfU1BFQ1RSQV9T
Q1VfUElECTB4REE3MQkvKiBOREkgU3BlY3RyYSBTQ1UgKi8KICNkZWZpbmUgRlRESV9ORElfRlVU
VVJFXzJfUElECQkweERBNzIJLyogTkRJIGZ1dHVyZSBkZXZpY2UgIzIgKi8KICNkZWZpbmUgRlRE
SV9ORElfRlVUVVJFXzNfUElECQkweERBNzMJLyogTkRJIGZ1dHVyZSBkZXZpY2UgIzMgKi8KICNk
ZWZpbmUgRlRESV9ORElfQVVST1JBX1NDVV9QSUQJCTB4REE3NAkvKiBOREkgQXVyb3JhIFNDVSAq
LwogCisjZGVmaW5lIEZURElfTkRJX1ZJRCAweDIzRjIgLyogTkRJIFZlbmRvciBJRCAqLworLyoK
KyAqIFZJRCAweDIzRjIgUElEcyAweDAwMDEgYW5kIDB4MDAwMiB3ZXJlIHVzZWQgZm9yIHByb2R1
Y3RzIHRoYXQgZG8gbm90IHVzZSBGVERJCisgKiBUaGUgZm9sbG93aW5nIE5ESSBkZXZpY2VzIHVz
ZSBOREkgVklECisgKi8KKyNkZWZpbmUgRlRESV9ORElfRU1HVUlERV9HRU1JTklfUElECTB4MDAw
MyAgLyogTkRJIEVtZ3VpZGUgR2VtaW5pICovCisjZGVmaW5lIEZURElfTkRJX0ZVVFVSRV80X1BJ
RAkJMHgwMDA0IC8qIE5ESSBmdXR1cmUgZGV2aWNlICM0ICovCisjZGVmaW5lIEZURElfTkRJX0ZV
VFVSRV81X1BJRAkJMHgwMDA1IC8qIE5ESSBmdXR1cmUgZGV2aWNlICM1ICovCisjZGVmaW5lIEZU
RElfTkRJX0ZVVFVSRV82X1BJRAkJMHgwMDA2IC8qIE5ESSBmdXR1cmUgZGV2aWNlICM2ICovCisj
ZGVmaW5lIEZURElfTkRJX0ZVVFVSRV83X1BJRAkJMHgwMDA3IC8qIE5ESSBmdXR1cmUgZGV2aWNl
ICM3ICovCisjZGVmaW5lIEZURElfTkRJX0ZVVFVSRV84X1BJRAkJMHgwMDA4IC8qIE5ESSBmdXR1
cmUgZGV2aWNlICM4ICovCisjZGVmaW5lIEZURElfTkRJX0ZVVFVSRV85X1BJRAkJMHgwMDA5IC8q
IE5ESSBmdXR1cmUgZGV2aWNlICM5ICovCisKIC8qCiAgKiBDaGFtU3lzIExpbWl0ZWQgKHd3dy5j
aGFtc3lzLmNvLnVrKSBVU0Igd2luZy9pbnRlcmZhY2UgcHJvZHVjdCBJRHMKICAqLwotLSAKMi40
OS4wLndpbmRvd3MuMQoK

--_002_YQXPR01MB498723CF19D915DD09C8C0B5DF43AYQXPR01MB4987CANP_--
