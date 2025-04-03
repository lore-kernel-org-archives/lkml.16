Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013028.outbound.protection.outlook.com [40.107.162.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23FF33C9;
	Thu,  3 Apr 2025 05:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743656535; cv=fail; b=qPi0HCsg91fZminXgvKos2NRq7psmpEae9rizTGfYfHeOSIczHEVkkinu4mIdFbf33Vbxy+e6LzMk7xycCFoufoYNcQXsKAWq/iPEJS0lL6X1LrSA+v5oYBrTItR9jmaqvkmwcfM9l/7ox2HpZhKLuBxPZwCYD/399AYn/gb1Oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743656535; c=relaxed/simple;
	bh=ljGu3HJiWAj8X9pGMXOVcR6GJOQtz7ulUW10J8OJndA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BvlDLDhDRvBXp3mf31WMLb0EIrFiwLUykzm4jJCjASCojqeUF5thzxlq0KQBYxoHh/Q8WXhI7No7aMV6r0NFKf0G6UuRFo2V3Hkq4AGYyaz5JIesMMGlqXIlPZIjTlziDUo794XV1YxByJ40aNBHUeC3sBfHEV9TyhOeXnvgvXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bhGJ7RDd; arc=fail smtp.client-ip=40.107.162.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bhGJ7RDd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+nIOH8gTwpy67I0JzQ/u3Kuw/BIatd3uudQmnsUqBRV4cMSB9lSQn1NGqbFHjg3UrGH83IefmP3XLQ3gSNznxXs8YBc3il7QO84McLwVFjjIvog5rOqQBcofvwVY6YibD3iIJAQ8jEo48So2QzKFgaLANrKkTnJq9KRHdHpS2+oO/QR9GtST5+R0BuYNI+kOY6g6YhilBMIjIvLLs6lPkzCrkwo9V7qNjWRKC324FR+KaXIPkpOIfTJUepJcpqv9nEmyonufWebot6Irld4svLqdJ5DRzy7tJY4nTkxJJogJY2o5pMpGORuN0iz00K9RWXPYgGaT8g2oJqm+dMo5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hey7o7OUSDaAgrgJKHAtw6KSFwdcnrAWsDTlf4mq91A=;
 b=xeiW0Otdw/CA5NPCa4jOwWqjYC7OkNkTumOsLdP7k86Iz3qyUsxpKx8PlB+2INM6QUjrAa3MVKJsKvMkZf6/PvUchxRXrQ5MLyF1cTL4NP1692HCBXsGWtx9calz5bvnSpBqnCVwkTzrFHIV/3bsGgayHim8e7Z9GxcNGlWaSa/xN9vGQcAWtXYBCI+EPEM9/2UBClVGSyV3Eb3rShgRz+BX2pCfGKhxQPvSTNSWouB3NS1/MAM6fFytXLOUlAQ6yMICtbksc/mOKRxUIMcudNMeDWLQV3//V1gYU3Tw679UhCBrbtFyApae7xnl+Se/WIvc22Zw3ROO1d7wBXWr9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hey7o7OUSDaAgrgJKHAtw6KSFwdcnrAWsDTlf4mq91A=;
 b=bhGJ7RDdsl7W9Z/b3pF6qTqLOJphf3FOczUoiH0pgSXtal+6HgCEt5HqTq7Ox/zTDJxs3g5K6TbiG8Eqt5vL/qGlcD2Z6k12n/KcgLjW3EGWIftiR0ojTJSQ8XX59JiE6SRd/NANrsiXoxz0TJSwBVtI0ILobJQ43uh8qHe9CN6xVTunaQ42zGVHRPlFsttaTIuHDOTPKNGkKD0lPuCq/PS9e2muw48vOcXoC5vJ8vZiOXw5fIPBq4nJIu2PRJ47MxxzuJrwS11AyjhGkhoP7KAzIRs0wcZNp2Sz30hijoQPPx5f8LyqI37jaHhoH3sJ09c2jdStUeHuBzzFeMN6rA==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI0PR04MB10904.eurprd04.prod.outlook.com (2603:10a6:800:269::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Thu, 3 Apr
 2025 05:02:09 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 05:02:09 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v14 4/6] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Topic: [PATCH v14 4/6] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Index: AQHbnlEZ/rAD+YPIT0yUa1mjl0COqbOFjCkAgAkQwGCAAVJBEIAA/kiAgAB+rhA=
Date: Thu, 3 Apr 2025 05:02:08 +0000
Message-ID:
 <AM9PR04MB8604F5E033F9C0985F29BD5F95AE2@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250327-imx-se-if-v14-0-2219448932e4@nxp.com>
 <20250327-imx-se-if-v14-4-2219448932e4@nxp.com>
 <Z+QePoixgnheYQTW@lizhi-Precision-Tower-5810>
 <AM9PR04MB8604C02C27C8C43FF89B95DC95AC2@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <AM9PR04MB86046B9A3821D8793877F1D395AF2@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <Z+2qFe/E0dbR+qkQ@lizhi-Precision-Tower-5810>
In-Reply-To: <Z+2qFe/E0dbR+qkQ@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|VI0PR04MB10904:EE_
x-ms-office365-filtering-correlation-id: ab2cdf7b-3322-4ff9-77e4-08dd726cb012
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018|4053099003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?3M1SHQDXSCuyUV8FfEvRDBALyGwkxqVcwgYotrC0UKrv1OMcb/U5knlAhyYZ?=
 =?us-ascii?Q?tO2VLtu0xV5Z4saUHkQYlafNizQDtpoMg+5tOlVQtkGz/pVWoMmIW6O0s0mu?=
 =?us-ascii?Q?zP2buNduUC0Dm/jWHBJWXmb/5qi2YXJmNDzn+GUexG+ST189MZxkH/RdbvFK?=
 =?us-ascii?Q?tn+RuR7ouOpg8ctnfRPlCPBAPLYiXMwk3nZXLX1YFUPfxcIzKYYUEg/e/SMA?=
 =?us-ascii?Q?BWWivyKkUkVMka4L4QtBeZtF9JrfWg1w05YgTD7GHbBZ6L3creBsaUcVwCxG?=
 =?us-ascii?Q?e8FurD5/AELQavnUrCeZMqCHCNJlpgXnBe9TQX4CGAaTPDEZpU3M5eWFkz3F?=
 =?us-ascii?Q?kuLQcXWJd5bmVk4+aas/hGAHZ6W6Ih0leIB6fs/LmWioOprjERtvQg1tBqRK?=
 =?us-ascii?Q?X1fK6lRyy6KAEBIaYeiuPLGftnZBxNWIeT0uOZs+tyWldhLc8Qvcp2AElOGD?=
 =?us-ascii?Q?2H5COIwoh9gNKZfJBmwNhzDSwpZhYA/eyfa/N+rlpDheHwToxkIGgH2SS8zF?=
 =?us-ascii?Q?wWuTo5dMaHZQ0Wy7EyobJJSzv6/wtEc/2hYC5ybjRxQW9x17gTXjR+587JOd?=
 =?us-ascii?Q?eI9YV3BSM0TOVNS1YN8pOZlg6ucYnE0+qah8/TufvisBqa++rTr3mXP035H1?=
 =?us-ascii?Q?vNhnwnUV8E3KOSv1/WVw1mVdZ+WrA2ZIgWzGiMt4bTGXzojT05OqwOtGgxvq?=
 =?us-ascii?Q?zToSM072EmHG/+AErs/qvVtooJzd40WgubNY/xQPlmWS1J+kqCnFEkCBc4OM?=
 =?us-ascii?Q?c7b9sKWm0TCxbA0C81fgUIOv7Q6Gf5AjGsyZrj1Zv/9W8UEAv86lna0XGAeA?=
 =?us-ascii?Q?nAXYDe/LIQnMSKWwL8IUVL6F0xFJXCDqKjazsIijHCJHYaSODOdVj3Jv+CoB?=
 =?us-ascii?Q?z11O+a7pev3HPAaDLuI01Hzo9l3VC2+BfrUL5ZNS/UJf6ofi6BBe9XzPief0?=
 =?us-ascii?Q?eKLLeNQAdhupfjRw9w1tdcwbdrTx7dPgxqi6QMavVfeVqR7wBAJ8KTuk9K8q?=
 =?us-ascii?Q?YrMOy17Kl/JYdfBFF/jBSbN1Ltnn5XXB6d7gHkOURoZuL8V10AtfMQK7nkIu?=
 =?us-ascii?Q?yeGc6JVPaQrSMJmn38TwiG2rZa5RHTpqlutJOHRfOMYIyQeCK7ahwWquc+Zy?=
 =?us-ascii?Q?MxIc2FqyBkewEbsGY74p5xlGDdhuntKBpMEDcy7M/4PboYtBnMx6rJYqqQ1C?=
 =?us-ascii?Q?FzLZYNsnqO0bAHVWG0BdEnXME/DsS0yfcBarriYuF2GTAXfVRZnxOABDYQdz?=
 =?us-ascii?Q?J5FKFmmervhVed6JdgKl8Jef3U3/X/glqVIgUELZrjX1RTq4YB+Btv3DCKvM?=
 =?us-ascii?Q?iYLGpnxUY7fdjEySPLKrkcZP+xtQfGFYpOtmjVwlekonzCQujhdTuf1zjAKd?=
 =?us-ascii?Q?POVv7ouPpuvTZuRQv/3g2XRnZDUHufTKWmcldxzjSkcwms4CIPBygnlV3KlE?=
 =?us-ascii?Q?TrnDVqtUfud1jYi6C5U0trYPkSk0bJJe?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018)(4053099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QZhTwyiXIzgZtbbaly9sxHSDSHqBuWRPGTtw+dwe++/PHpZ161k0NLC4YS1A?=
 =?us-ascii?Q?p4z2qT1T7Lp0WjDI+uv3mrteJmPiIVLpG16oKDyJ5E1LKL6Np2y6LzdYyPPA?=
 =?us-ascii?Q?lBmaYYke/1ZmJZRh6a99gcOxFixgqDSZmlRXqfokLHuVTO/uhtdIisG30sAu?=
 =?us-ascii?Q?4BNwP10Z8VRhiSBnD9uaKReD6f+0gePovAr26XrQ4f4Gi4J9KO3TVoisJnY7?=
 =?us-ascii?Q?Oq3cUEzHyAez/zriNncRTkiRjCxHlYM+Kk8Zgr9T/+g/4LCgPdmO34sN7Ocg?=
 =?us-ascii?Q?q/TbrqlHOxDtJlviMM7/nouBpAg6xHY5InHtf+uSccShkBaff3ZuJ1wnNK7E?=
 =?us-ascii?Q?7f/ohh5G3qmoisPBbNW8aUoE/xo0CyC9ZwWPqxJFooLM8ABoU50DGO9FariK?=
 =?us-ascii?Q?wt354pkuyYrb0pSLf1vZCSjHhlW9atiqjCJGB24RxZXWn4ku00XYsbg9rObN?=
 =?us-ascii?Q?hdcbJtd31Eje7LgmPIS39PcmKeiCVtbuYTVAtSHcCTOMtHv535E+FV0s8213?=
 =?us-ascii?Q?FT0d2LYV3ikoKiWMA/Ay1erRZlCPZZ8NZKRY1WZEFzmrdpzlj8jpz7ywYbNi?=
 =?us-ascii?Q?1RTW6bUW9UZXWgbl234AQzGR38zVC0NDoLmxUhrS6y4XLj4uwGAW1JkrBkIS?=
 =?us-ascii?Q?LiOQBvPFKyggkGjJX13BOuBKHycZ1SFNgwH35jq0aTD6D2ePxFC37XTTNHXf?=
 =?us-ascii?Q?TkJ4AxVHMchPY0uBQUqQDQ5HBWUnpYtJM52+OWYshqJUbuv5T6UqtZWtBjKZ?=
 =?us-ascii?Q?BkaO6paQMIxS4DNiNoJYykocjouQ3ZIW50H/5tijD/h2KWny24WdbJpDQK4h?=
 =?us-ascii?Q?W5GXzuMSKhN/6b8XKpEs1g03xtYg6q+fB2oNNSq0uQ9uOrC+zxZq3n0ajR3c?=
 =?us-ascii?Q?1WDExgZxEeFieMFR59hMfItVWruZa5z2pB50yM3stuYsVh/TYYHrXq9YdmxJ?=
 =?us-ascii?Q?pY2ulqdAiqoyxTh7K9qifvtQ/gX9FX2TQn3t+V0uHNMv5faNj1qkmwYIG3qY?=
 =?us-ascii?Q?mh45DQxMz18Ybc1iYBR144YuhTZy0kbZ4xGZf5PsEeciozD6ykf/EYyi4kRJ?=
 =?us-ascii?Q?AfLInF63J/IgxC614NhbVD/pepibJ1Zjqw0kG4oWtRQ726qKV8/PxBhQ9b4X?=
 =?us-ascii?Q?gtEfYVetdEJ2HMzWQRwBf3f+CiKci24kJ+YLPVFDm0oW99xFyuuioctg9Twf?=
 =?us-ascii?Q?p4hyWy1pC+ps48FcKAPY9eG4F54xC6JtEo5KM5S+u071V0V83SysNvBHvPsU?=
 =?us-ascii?Q?9PO9Z8ufkRi0aynWw69/bHueZBnRTDvEPxrb8HXnHJ30/2NatkO0sXP8IYVn?=
 =?us-ascii?Q?xzJ/MuFuZ/TNa+BjUvU2rwJ1TdgxwwRCaOYINutG+ZYuO1BO3/yRF4SMdOYD?=
 =?us-ascii?Q?Yr0u2AtjkIT0BFqAIhs+W5ouGjitJi+KFckSXfMxeM9EbGKynN5XNspDzRSX?=
 =?us-ascii?Q?Vfzr/Z/vOeLk4nZ6N8CcG6vZSqk3ui3lGCzI0T63p7Ql+h97agEFYvSD/1xn?=
 =?us-ascii?Q?7NFccg1fzKeVpIq8+sj1CbSNXP/+WuNcg5RA3V9Po5UrB7YxsA/rZPW4uppy?=
 =?us-ascii?Q?zFwIUQV4asV+QGfZVsMaL11zBpVBdmW3SHnE0kOe?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0276_01DBA483.A4B4E070"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2cdf7b-3322-4ff9-77e4-08dd726cb012
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 05:02:09.2472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oJcgZ2HInYUxkElG42YYuM1BEJ8xhR2k2RSVuMFTrOK2Tm5Wrf6crzn6OwoolOdh2IIidGXxnBCihNS4A4P2cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10904

------=_NextPart_000_0276_01DBA483.A4B4E070
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 02, 2025 at 06:15:12AM +0000, Pankaj Gupta wrote:
>> >> diff --git a/drivers/firmware/imx/se_ctrl.h 
>> >> b/drivers/firmware/imx/se_ctrl.h new file mode 100644 index 
>> >> 000000000000..177623f3890e
>> >> --- /dev/null
>> >> +++ b/drivers/firmware/imx/se_ctrl.h
>> >> @@ -0,0 +1,84 @@
>> >> +/* SPDX-License-Identifier: GPL-2.0+ */
>> >> +/*
>> >> + * Copyright 2025 NXP
>> >> + */
>> >> +
>> >> +#ifndef SE_MU_H
>> >> +#define SE_MU_H
>> >> +
>> >> +#include <linux/miscdevice.h>
>> >> +#include <linux/semaphore.h>
>> >> +#include <linux/mailbox_client.h>
>> >> +
>>
>> ....
>>
>> >> +};
>> >> +
>> >> +struct se_if_defines {
>> >> +	const u8 se_if_type;
>> >> +	const u8 se_instance_id;
>> Getting used at drivers/firmware/imx/se_ctrl.c:320

>	dev_info(dev, "i.MX secure-enclave: %s%d interface to firmware,
configured.",
>		 SE_TYPE_STR_HSM,
>		 priv->if_defs->se_instance_id);

> You only print value, don't actual use it. It should be safe remove it

> Frank

No, it is not just used for print.
This variable is used to construct the device name as well, in 5/6 patch.

Moreover, it is needed for other SoC like i.MX8DXL, i.MX95, i.MX94, there
are multiple instances of same secure-enclave type.
It will be used to identify the intended instance later.

>>
>> > This is not used actually, you can remove it
>> Getting used at drivers/firmware/imx/se_ctrl.c:347
>>
>> >> +	u8 cmd_tag;
>> >> +	u8 rsp_tag;
>> >> +	u8 success_tag;
>> >> +	u8 base_api_ver;
>> >> +	u8 fw_api_ver;
>> >> +};
>> >> +
>> >> +struct se_if_priv {
>> >> +	struct device *dev;
>> >> +



------=_NextPart_000_0276_01DBA483.A4B4E070
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIImZTCCBaIw
ggOKoAMCAQICCE4Rpu+H69FRMA0GCSqGSIb3DQEBCwUAMGUxIjAgBgNVBAMMGU5YUCBJbnRlcm5h
bCBQb2xpY3kgQ0EgRzIxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJ
RWluZGhvdmVuMQswCQYDVQQGEwJOTDAeFw0yMzA0MjEwNjQzNDVaFw0yODA0MTkwNjQzNDVaMIG2
MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQ
IEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmS
JomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTEL
MAkGA1UEBhMCTkwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAWrnSkYP60A8wj4AO
kATDjnbdgLv6waFfyXE/hvatdWz2YYtb1YSRi5/wXW+Pz8rsTmSj7iusI+FcLP8WEaMVLn4sEIQY
NI8KJUCz21tsIArYs0hMKEUFeCq3mxTJfPqzdj9CExJBlZ5vWS4er8eJI8U8kZrt4CoY7De0FdJh
35Pi5QGzUFmFuaLgXfV1N5yukTzEhqz36kODoSRw+eDHH9YqbzefzEHK9d93TNiLaVlln42O0qaI
MmxK1aNcZx+nQkFsF/VrV9M9iLGA+Qb/MFmR20MJAU5kRGkJ2/QzgVQM3Nlmp/bF/3HWOJ2j2mpg
axvzxHNN+5rSNvkG2vSpAgMBAAGjggECMIH/MFIGCCsGAQUFBwEBBEYwRDBCBggrBgEFBQcwAoY2
aHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFBJbnRlcm5hbFBvbGljeUNBRzIuY2VyMB0G
A1UdDgQWBBRYlWDuTnTvZSKqve0ZqSt6jhedBzASBgNVHRMBAf8ECDAGAQH/AgEAMEUGA1UdHwQ+
MDwwOqA4oDaGNGh0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEludGVybmFsUG9saWN5Q0FH
Mi5jcmwwHwYDVR0jBBgwFoAUeeFJAeB7zjQ5KUMZMmVhPAbYVaswDgYDVR0PAQH/BAQDAgEGMA0G
CSqGSIb3DQEBCwUAA4ICAQAQbWh8H9B8/vU3UgKxwXu2C9dJdtoukO5zA8B39gAsiX/FcVB9j8fr
Y7OuqbvF/qs5SNGdISMIuXDrF5FSGvY5Z+EZcYin4z0ppwDr0IzVXzw5NvopgEh6sDXgPhCCh95G
Mpt9uHDuav1Jo5dfN9CWB78D+3doDK2FcHWxT6zfBOXQ69c7pioBz5r5FP0ej4HzWWzYUxWJfMcQ
uxwIRfISM1GLcX3LliiB3R3eDUJyvgsPhm7d+D1QIgElyLpUJJ+3SZpXK6ZVkQlLcpEG01Jl5RK7
e0g7F2GGn8dkTm2W3E9qRnHLnwj3ghnewYTOk8SWARN7Epe0fPfeXyS0/gHEix7iYs4ac2y8L0AG
2gbegEAKATWSxTgN/At+5MLPqnQuilUZKlcjgtDMzhnSJK2ArmuEXTEJUa/0fwKsnIQuhF4QONqS
nm8+QSb+/uRm/IWcW5LuCUuxwufQDzto7Xlc1q1dpOggtUJI+IojSlzTfeHkgYNr2XFZ4BrkY0i8
VFVmnqichsJOM2+zqQU4ZGszdFz/RLD4mLMCvmsMzRI7jIg7fkQer3CvIZkBwS1xjl4+ZGrkzyZm
zHyP274V7PSyYztkXvYr/CkTgjIu+JG6vGEN8LuVXt7AmwD7WNF8MKAkPOFIKWHXviyotKGRb0Jl
x2XwYgoaXD5Noa1jwB8kKTCCBaIwggOKoAMCAQICCHIFyg1TnwEcMA0GCSqGSIb3DQEBCwUAMGUx
IjAgBgNVBAMMGU5YUCBJbnRlcm5hbCBQb2xpY3kgQ0EgRzIxCzAJBgNVBAsMAklUMREwDwYDVQQK
DAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMQswCQYDVQQGEwJOTDAeFw0yMzA0MTQwNzQ1
MzFaFw0yODA0MTIwNzQ1MzFaMIG2MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA0MQswCQYD
VQQLDAJJVDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwN
Tm9vcmQtQnJhYmFudDETMBEGCgmSJomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDET
MBEGCgmSJomT8ixkARkWA2NvbTELMAkGA1UEBhMCTkwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQDVSMlM/AT8vRa4mBRQJwL0iYE6It2ipQbMoH8DzO7RQLmGmi82PhZs2XhTRcEWtede
DstWIRWwWC4vQiZvwshmknxltM+OwkFHVcUrpG5slDwe2RllSij7099aHWJmOai6GjOz7C/aywDy
zrftFuzd3+7JsGlBi4ge5d7AT9NtlhBOySz4omF4e1R+iNY8mqq/mfPcBFbAe6sGWQ96+0+UAAVx
BpCZ8NmtwUjeSGvWVSfPDga4IW+VoJdQWFsY0YoDVdglKSmA4n9J0hfq+gErN4nq8/1/Q8AamPaN
qVRwtN1g/mI/1JyHa+J2nmqLiixjtndxIPnwrKdS+sM34VuXAgMBAAGjggECMIH/MFIGCCsGAQUF
BwEBBEYwRDBCBggrBgEFBQcwAoY2aHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFBJbnRl
cm5hbFBvbGljeUNBRzIuY2VyMB0GA1UdDgQWBBTlMnr0ZsFHliR//CeAOVjfKxfiuzASBgNVHRMB
Af8ECDAGAQH/AgEAMEUGA1UdHwQ+MDwwOqA4oDaGNGh0dHA6Ly9ud3cucGtpLm54cC5jb20vY3Js
L05YUEludGVybmFsUG9saWN5Q0FHMi5jcmwwHwYDVR0jBBgwFoAUeeFJAeB7zjQ5KUMZMmVhPAbY
VaswDgYDVR0PAQH/BAQDAgEGMA0GCSqGSIb3DQEBCwUAA4ICAQB9ysTcSisP+PmOFcN//fmoimql
EXMtFHPygpRjW4aa0s9GnKk31mO6aKr48BKD4yYRPIy2dWwRI2P2JqNxBPRLVF8vPi/h7sFt9Or7
4marYCgw8GtEDKZ5DWFJpPLCI99UsYY71u/lpQvY1H1TqvAwkjvTGriWmuCzl+M3SueIl1Eu74AZ
Y9tN+codSViZhFjV8s/nWeNhD40npdTEl+cOKHHfkALQlhR+JG33z1vX1blyGIfeXpGldgKX7unN
r05B0DhU1gT9Rb0PvVJjr9zQlVUHA3cklQ8a4xRTB1hpIp2ZkmgFr1IWDS8H21o89gO0AA6LmR0w
C7/aVOg0Ybn3TjzmpggTbDIAiF0jBhO0MffStheqFsZZJ0xd09tUlert+HPemkuNtDRMSd92mr/B
p9iv4obXXR4nwCDE7n0YCeYBeSBOEDwpE7TganD0S6Csg+5bpgmDriIT1eXt40qBgG2fBpYKAzI9
/S5+pnqP25nGVuuFb5ZyHLXhQtXGHk44eyh6kzI750GF2ldN30wu363hDdq53T+KoP2dLvTosA3z
ipknv55JRUU77pn5Y/AEAWedYttK0k6DqE63akxW1AOu+OKMywLXTVz+EWod6ZLrCKrfp93MKbcd
fC2USt3UV04kTeTnXwSWX4e0h0hC57UpBZX6y9rBk8tN5aRQrzCCBawwggOUoAMCAQICCE5+Bsxl
kQBIMA0GCSqGSIb3DQEBCwUAMFoxFzAVBgNVBAMMDk5YUCBST09UIENBIEcyMQswCQYDVQQLDAJJ
VDERMA8GA1UECgwITlhQIEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjELMAkGA1UEBhMCTkwwHhcN
MTYwMTI5MTI0MDIzWhcNMzYwMTI0MTI0MDIzWjBaMRcwFQYDVQQDDA5OWFAgUk9PVCBDQSBHMjEL
MAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5kaG92ZW4xCzAJBgNV
BAYTAk5MMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAo+z+9o6n82Bqvyeo8HsZ5Tn2
RsUcMMWLvU5b1vKTNXUAI4V0YsUQRITB+QD22YPq2Km6i0DIyPdR1NbnisNpDQmVE27srtduRpB8
lvZgOODX/3hhjeTWRZ22PAII57gIvKqZCMUWvYRdYZsSKP+4Q+lEks89ys953tp3PI8EeUztT3qU
Tfs7TbgD5A9s+1zCPqI7b/XmXTrkWBmwmmqDHBijwIvzy5uE3MTBunVZFAl2kD/jiBgdj+4O4u59
3Ny1c9c4If6Xvz3+DEIjdvbULrUyGIatwJdvw6FxRt5znmYKe3VyzsY7Zk/8MsOZvzoSPBMSZBWS
Hj/e8fBwDEDKf6XQ0BD7Z27AWTUcddk1sphn38HHOwEpjKfOxNGX7fSXqz2JaRtlamvSoCrd4zrH
5f94hcSVFcP9nF9m3JqRzAmbGYTdzgAjKjPRVWAgaZGF8b/laK5Ai8gCEi767DuzMsXkvj9/BQw8
fyn5xOY55zRmFo2jU8/blWy/jsAwUeEBDo4KPRAuPbSiOt8Jf8NbDOvDGPKwEC8de76SxPi3ulhu
Fb0Qzxsbk39+ET3Ixy347MAZTji/a87GeIDWi+nCWHwZPQSEg0e0LVh7uRNNb1clWILEF/bSMe3z
T3rWKWDmzCiTn3+PicqvYM7cWiZi3srlCkIAeaiav9tMaAZ3XG8CAwEAAaN2MHQwHQYDVR0OBBYE
FJBIUyMqeeqEmz0+uQ7omXRAXqC2MA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAA
MB8GA1UdIwQYMBaAFJBIUyMqeeqEmz0+uQ7omXRAXqC2MA4GA1UdDwEB/wQEAwIBBjANBgkqhkiG
9w0BAQsFAAOCAgEAhIKiXslbxr5W1LZDMqxPd9IepFkQ0DJP8/CNm5OqyBgfJeKJKZMiPBNxx/UF
9m6IAqJtNy98t1GPHmp/ikJ2jmqVqT0INUt79KLP7HVr3/t2SpIJbWzpx8ZQPG+QJV4i1kSwNfk3
gUDKC3hR7+rOD+iSO5163Myz/CzzjN1+syWRVenpbizPof8iE9ckZnD9V05/IL88alSHINotbq+o
0tbNhoCHdEu7u/e7MdVIT1eHt8fub5M10Rhzg5p/rEuzr1AqiEOAGYcVvJDnrI8mY3Mc18RLScBi
VHp/Gqkf3SFiWvi//okLIQGMus1G0CVNqrwrK/6JPB9071FzZjo5S1jiV5/UNhzLykSngcaE3+0/
zKiAP2vkimfHHQ72SJk4QI0KOvRB1GGeF6UrXROwk6NPYEFixwTdVzHJ2hOmqJx5SRXEyttNN12B
T8wQOlYpUmXpaad/Ej2vnVsS5nHcYbRn2Avm/DgmsAJ/0IpNaMHiAzXZm2CpC0c8SGi4mWYVA7Pa
x+PnGXBbZ9wtKxvRrkVpiNGpuXDCWZvXEkx118x+A1SqINon8DS5tbrkfP2TLep7wzZgE6aFN2Qx
yXdHs4k7gQlTqG04Lf7oo2sHSbO5kAbU44KYw5fBtLpG7pxlyV5fr+okL70a5SWYTPPsochDqyaH
eAWghx/a4++FRjQwggX8MIID5KADAgECAgg4IAFWH4OCCTANBgkqhkiG9w0BAQsFADBaMRcwFQYD
VQQDDA5OWFAgUk9PVCBDQSBHMjELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYD
VQQHDAlFaW5kaG92ZW4xCzAJBgNVBAYTAk5MMB4XDTIyMDkzMDA4MjUyOVoXDTMyMDkyOTA4MjUy
OVowZTEiMCAGA1UEAwwZTlhQIEludGVybmFsIFBvbGljeSBDQSBHMjELMAkGA1UECwwCSVQxETAP
BgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5kaG92ZW4xCzAJBgNVBAYTAk5MMIICIjANBgkq
hkiG9w0BAQEFAAOCAg8AMIICCgKCAgEApcu/gliwg0dn1d35U0pZLMvwbNGN1WW/15pqzBcpG/ZB
q5q+ygq4/zkEqQAM3cZsSi2U2tjiKZOEfj4csyEJVZFQiwXMptsmErfk7BMoLtaIN79vFOd1bzdj
W0HaSTb9GkJ7CTcb7z/FKKiwc2j53VVNDR1xVBnUNEaB1AzQOkp6hgupCgnlkw9X+/2+i7UCipk2
JWLspg9srFaH0vwrgMFxEfs41y6iBVD70R/4+suoatXvgFv3ltGZ3x/hak3N1hHkjJq3oa1jSkLm
p6KoQAqbcHTkeKomMOmPUJK1YqDkpdbGuuRkYU3IvCW5OZgldrkigcOTaMNUaeZUAv8P3TTtqN4j
Ip/Hls/26VR+CqdoAtmzypBEyvOFDtzqPqVzFXfkUl2HZ0JGTYEXUEfnI0sUJCyLpcLO1DjnwEp8
A+ueolYIpLASupGzGMGZ5I5Ou1RoF2buesEgwb+WV7HRNAXTmezUh3rWLm4fAoUwv1lysICOfGGJ
Q2VkNe5OXzObvzjl30FYdDWb6F+xIDyG0Awxft4cXZcpFOGR3FH4ZZ5OH+UNl1IxnNwVpGSqmzEU
7xnoTXlyVH3Q/jYDG27HSoILQp/yRMJXWx/Xn57ZVXNm63YrZ35XsX91pMHDRoQdJBMKkya813dg
gmhEszSIBYKqoiFt1HaMK/KnPwSSLO8CAwEAAaOBujCBtzAdBgNVHQ4EFgQUeeFJAeB7zjQ5KUMZ
MmVhPAbYVaswEgYDVR0TAQH/BAgwBgEB/wIBATAUBgNVHSABAf8ECjAIMAYGBFUdIAAwOwYDVR0f
BDQwMjAwoC6gLIYqaHR0cDovL253dy5wa2kubnhwLmNvbS9jcmwvTlhQUm9vdENBRzIuY3JsMB8G
A1UdIwQYMBaAFJBIUyMqeeqEmz0+uQ7omXRAXqC2MA4GA1UdDwEB/wQEAwIBBjANBgkqhkiG9w0B
AQsFAAOCAgEAeXZR8kIdv3q3/VJXsdc8y+8blR9OWqmxjAo40VqPOWLcxLP2PkH3pleOPO/7Eg26
pQzIESYql5pxlw/tL7b4HhjcYpFom8yECNChnIxWeh8L/EfMPmcxi8wts4Zuu9q3bWOJxAcu4zWy
SDzbR/F/y6tzuaLgOZOmYihKTvG4dbRYBsC+0QMkf+6mfmDuB0O/HXE6bP9yf8rYZ1QWIfDp4h0e
MtRuPZ7DeJd15qEqv0AqeAWtuwAdXCQIBxYTYXHJxIwg7sxAMXdkFOXrGc8mCe6J+myQ0d449XIA
FVTpBtKPBjUfAnulbDFY8bEmkEEgyPYSmMALe+gDhOIlL3dJ2jeOd/edEfaIGlMfUPEnfD1s2sDX
PH8O3o9zWHWaU2bevYw+KUK86QiSa+wGussopb+n/cnBhgd9g1iNsO4V29YpaqaUQZVnKhL3EAhu
cecoNPiOJ2MMSboxLKmKtAGALdP2VC2gU7NxmatkzbU/FeZVApqWw/k6SPcO9ugisCOx93H77CHt
0kD6JWcMOn5/fQQmVvk34PESJrHCbYb11pdfzHsSPMwgih/CHik1cWP09mP8zS8qcucbUAloNHlk
kZl/V5eub/xroh4Dsbk2IybvrsQV32ABBfV6lfiitfvNOLdZ4NJ2nbPM8hBQpcj7bPE/kadY1yb1
jgaulfXkinwwggdyMIIGWqADAgECAhM/AAV1goSswyqoLYNbAAUABXWCMA0GCSqGSIb3DQEBCwUA
MIG2MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA0MQswCQYDVQQLDAJJVDERMA8GA1UECgwI
TlhQIEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEG
CgmSJomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2Nv
bTELMAkGA1UEBhMCTkwwHhcNMjQwMjA2MTA1ODIzWhcNMjYwMjA1MTA1ODIzWjCBmjETMBEGCgmS
JomT8ixkARkWA2NvbTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA3diaTEM
MAoGA1UECxMDTlhQMQswCQYDVQQLEwJJTjEWMBQGA1UECxMNTWFuYWdlZCBVc2VyczETMBEGA1UE
CxMKRGV2ZWxvcGVyczERMA8GA1UEAxMIbnhhMTg3MTcwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQCsljsxzffby7IAt42e7cJH7K+49RL+7i56h3ORt8dS8WNVSdDlejp6uS6mLk/UX0wn
sSxDK1S5KquGJQzaT/3gxE8tdgvfFNBVdrgr48DeCVwWDr1o/UF3RmGcMdxqRz1M/oLDJ03C8n6h
L/0JXiwsNx0KZJoqDrN/48yX5TkoeKJmHFftZ5Op57xV0WkZJ/yLxSC1Om75jOG/UPdqsDzl+wi7
YVj5egV24hoaXgHBxtCeJzUgsHcJlo9nFtGe11j6H1vqFzkPzN9ydjRmhQATV/WLqpG8uot79u0m
6n7Mjwsd/HmJf+8xpovMcHPO2a0axppssKso/3APP6mR1FuVAgMBAAGjggORMIIDjTAOBgNVHQ8B
Af8EBAMCB4AwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMAwGA1UdEwEB/wQCMAAwHQYD
VR0OBBYEFLNr0DCWM1fCXv4ubOt/elkvcoiaMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRw
YW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFua2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAU5TJ6
9GbBR5Ykf/wngDlY3ysX4rswggFKBgNVHR8EggFBMIIBPTCCATmgggE1oIIBMYaByGxkYXA6Ly8v
Q049TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1ubGFtc3BraTAwMDQsQ049Q0RQLENOPVB1
YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2Jp
LERDPW54cCxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNz
PWNSTERpc3RyaWJ1dGlvblBvaW50hjFodHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFAtRW50
ZXJwcmlzZS1DQTQuY3JshjFodHRwOi8vd3d3LnBraS5ueHAuY29tL2NybC9OWFAtRW50ZXJwcmlz
ZS1DQTQuY3JsMIIBEAYIKwYBBQUHAQEEggECMIH/MIG7BggrBgEFBQcwAoaBrmxkYXA6Ly8vQ049
TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNCxDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2Vydmlj
ZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jQUNl
cnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNhdGlvbkF1dGhvcml0eTA/BggrBgEF
BQcwAoYzaHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFAtRW50ZXJwcmlzZS1DQTQuY2Vy
MDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRVhu2FOILrmUuaklY/hMbNXILljX4C
AWQCAT8wJwYJKwYBBAGCNxUKBBowGDAKBggrBgEFBQcDAjAKBggrBgEFBQcDBDANBgkqhkiG9w0B
AQsFAAOCAQEAWS4IrHXWhCGNWk5vn20xV7mlLkM7JPwltVJzB6MRzwUB438upbyUMwNHcEgAmHcs
xL9hafErN+n9rLL00wEqZsCV732s7YOxSRRjZTE3CmZQ2+TYjXR7A6AzQKo0fv/x43bpSes8ttQ6
Qtt8nzIbGBkDAcI7wfXsUPF5o0NwLOxre+Z+JCPNH0eaOj2J7EKD2ERLCClmvohrYdlmu85iXfyi
nJo42eq9g08FtnxTXVQSIZCtiETiGtXA7+t2Aa8429XXunsijRznaYw2SwI/s4sVmvaK3XHaif0D
QaUYxQp4s2ctzgz3eU6hK68OnNzbhBtF/lx6PHbifqHDzrtUbzCCB+8wggbXoAMCAQICEy0ACwRu
JYOozH+yQuYAAQALBG4wDQYJKoZIhvcNAQELBQAwgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNl
IENBIDUxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVu
MRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPy
LGQBGRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDY29tMQswCQYDVQQGEwJOTDAeFw0yMzEyMjAwOTIw
NDdaFw0yNTEyMTkwOTIwNDdaMIGaMRMwEQYKCZImiZPyLGQBGRYDY29tMRMwEQYKCZImiZPyLGQB
GRYDbnhwMRMwEQYKCZImiZPyLGQBGRYDd2JpMQwwCgYDVQQLEwNOWFAxCzAJBgNVBAsTAklOMRYw
FAYDVQQLEw1NYW5hZ2VkIFVzZXJzMRMwEQYDVQQLEwpEZXZlbG9wZXJzMREwDwYDVQQDEwhueGEx
ODcxNzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL2JT+kRihW1mBdeZFOoCLGIl4DZ
VL7FWt3V1iFFJJe/bZDw/SUf5z1HeA8xv9+S8rqMyybjlSRHFLgiMm7qrGpVEDniKe8eiqP8Un4Y
3fHgK5FKZIVVn0KlaMuD5G30AMk9HyUdc2MkVRL8YSQCewkQDEVjB8gnx/e6xfbWEVHf5+dOWJoR
aket5+0JKV0l/dPV7cT4hL3BFtiBhq8976Li6rn8gxIi63u0G3qvm9Scqk+EHzemDhw/W+eMmGR4
nwKVLKzumxko8l6EOnnvqqF4vj2hKTpB+2lsEXH1giireMEsvB2RY40lnRUXVQ0FDklOIQV4Qdgi
EJfUdq/ZhCUCAwEAAaOCBA4wggQKMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWCwH6BjvRV
hu2FOILrmUuaklY/gbeCPIPthzICAWQCAT4wEwYDVR0lBAwwCgYIKwYBBQUHAwQwDgYDVR0PAQH/
BAQDAgUgMAwGA1UdEwEB/wQCMAAwGwYJKwYBBAGCNxUKBA4wDDAKBggrBgEFBQcDBDCBlAYJKoZI
hvcNAQkPBIGGMIGDMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAS0wCwYJYIZIAWUDBAEWMAsGCWCG
SAFlAwQBGTALBglghkgBZQMEAQIwCwYJYIZIAWUDBAEFMAoGCCqGSIb3DQMHMAcGBSsOAwIHMA4G
CCqGSIb3DQMCAgIAgDAOBggqhkiG9w0DBAICAgAwHQYDVR0OBBYEFMJ81PK4p3H8Q7gn7u/5OwWx
uAwGMEUGA1UdEQQ+MDygJAYKKwYBBAGCNxQCA6AWDBRwYW5rYWouZ3VwdGFAbnhwLmNvbYEUcGFu
a2FqLmd1cHRhQG54cC5jb20wHwYDVR0jBBgwFoAUWJVg7k5072Uiqr3tGakreo4XnQcwggFGBgNV
HR8EggE9MIIBOTCCATWgggExoIIBLYaByGxkYXA6Ly8vQ049TlhQJTIwRW50ZXJwcmlzZSUyMENB
JTIwNSxDTj1ubGFtc3BraTAwMDUsQ049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENO
PVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y2VydGlmaWNh
dGVSZXZvY2F0aW9uTGlzdD9iYXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hi9o
dHRwOi8vbnd3LnBraS5ueHAuY29tL2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybIYvaHR0cDovL3d3
dy5wa2kubnhwLmNvbS9jcmwvTlhQRW50ZXJwcmlzZUNBNS5jcmwwggEQBggrBgEFBQcBAQSCAQIw
gf8wgbsGCCsGAQUFBzAChoGubGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENO
PUFJQSxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0
aW9uLERDPXdiaSxEQz1ueHAsREM9Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1j
ZXJ0aWZpY2F0aW9uQXV0aG9yaXR5MD8GCCsGAQUFBzAChjNodHRwOi8vbnd3LnBraS5ueHAuY29t
L2NlcnRzL05YUC1FbnRlcnByaXNlLUNBNS5jZXIwDQYJKoZIhvcNAQELBQADggEBALwIIuww1PaF
EbpQoy5vgJ/4N3xS+niIpFTKyYNAD0Ar38FcUlSnj0FIHKRj8rUmZP9WTky3U8m5B3LOyhJ14FPh
iy1EwkhZmds9fJiZyEEFiwQWYDG/uknu6zIKOTlLmtlYPfbzfi58keGcjD3T5H8D8DpCGWI1lAwe
clR9fJCbcYnQSQnuicSCfrHjjXiDZ2O8h7WbE1CC6Cj/qwo5nmS0lMv7yoG94rTNBvYe8iqOkcav
7KiZA6SdhXms3ppvFmBukI6pTheMvT39SM0S6E0dgeqZSGSxHrM7dcxUdAL4fnYMv3Sa+GAgyXB6
rihWC11+goz2eawt5TRU2w45TmcxggSzMIIErwIBATCBzjCBtjEcMBoGA1UEAwwTTlhQIEVudGVy
cHJpc2UgQ0EgNDELMAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5k
aG92ZW4xFjAUBgNVBAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJ
kiaJk/IsZAEZFgNueHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYTAk5MAhM/AAV1goSs
wyqoLYNbAAUABXWCMAkGBSsOAwIaBQCgggK5MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTI1MDQwMzA1MDIwNFowIwYJKoZIhvcNAQkEMRYEFEhfMN5REa7EvrFODbZp
cKWc3cvDMIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggq
hkiG9w0DBzALBglghkgBZQMEAQIwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsO
AwIaMAsGCWCGSAFlAwQCAzALBglghkgBZQMEAgIwCwYJYIZIAWUDBAIBMIHfBgkrBgEEAYI3EAQx
gdEwgc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjCB4QYLKoZIhvcNAQkQAgsx
gdGggc4wgbYxHDAaBgNVBAMME05YUCBFbnRlcnByaXNlIENBIDUxCzAJBgNVBAsMAklUMREwDwYD
VQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJRWluZGhvdmVuMRYwFAYDVQQIDA1Ob29yZC1CcmFiYW50
MRMwEQYKCZImiZPyLGQBGRYDd2JpMRMwEQYKCZImiZPyLGQBGRYDbnhwMRMwEQYKCZImiZPyLGQB
GRYDY29tMQswCQYDVQQGEwJOTAITLQALBG4lg6jMf7JC5gABAAsEbjANBgkqhkiG9w0BAQEFAASC
AQCV52PJWIzyOSWNOWJjvFtGU/VHXsu1Vmjyi93okXxxkSDm2V6PvxZ6TXgwARQ7fo4VmcePS2iQ
2KhYwDI0u04yEtfxc9PTN6BlTuJLNqzj4/h/hG0kYeby18Wui145cvRGB83VOzd/TeiWMJwncCnj
Oca2lcD2J9UgFnhX80ARxQKM4/IxNJ5X5bwXDHrhhvgPU8ULSBXXY74qYI+Z6S1HT6Ll6Df4lZNu
3Mmy0b/sZtTISX0SRkTVvp9cGHtMt2W7GBqQYEhPj2MRYb8AIInapXgDibWKXKpqzChG6TW8u92Q
b+q/sRBcS69+XT3wSNkrO5Q+N9UzCx8aKodMReCqAAAAAAAA

------=_NextPart_000_0276_01DBA483.A4B4E070--
