Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2050.outbound.protection.outlook.com [40.107.247.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F2AA50
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747875172; cv=fail; b=nc9b7zM9iyKyYDfD5wCauKzifYTf9HCvDmsAlukwMTRpEIipzVO6sRwl140BJywokFSPvXdNHB+exXhWWqiR1nbsnPqGcF1aqHzuOVL9+LLcNI3NmMO/K7BCzcqlcMLorfkfc2OAaZsEiicletSV3HURLk+4ccTVIgKrOv1vHRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747875172; c=relaxed/simple;
	bh=avxsguGWFyBoWa7J0ZTdcpnTWdj7wlUpIGbsQI8pTZ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WtqXDDgu5ZKr5SAC0UAu/L2aq+z57Bc8+IzefFdqRRv60WBz10ycDwjtpR7xoZtIy/oBlNL3oSuMpUsguF8aXFhp2cBuIeCN0JyEXK2x/lca06vxRLe0g0dHl8UY2gJOzml50ceb8HQT8ReMyE2gubJc3En/dO+QO8SwnIrcY9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MQfV4at9; arc=fail smtp.client-ip=40.107.247.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MQfV4at9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piQoirvU1yHJP3aL+e0AItsblaJjR5NqNj5LmeJzWMhBwfaRtxW4w7Wm6At9V5a/rd6jVw2SWeA7cMz3sjaQ6uYUWzQxyDa70mO1ubkj2XWTP6j0GjdJe3TDnT/uYfv+MJiwpZZipk2mbxj2lax81lhph0wQcdAkGT7v73EHlDS6eGo/BO5L8lJiGZeZ1y5ClI2sYj0+nv4EiQCfUcmEqS2T+Sh3YnLo2yHx+Y5AcWF7gRSDek6hFtaSCgirm7V6ZejvO1eLLRrN4CGbvbsdBXGwT5jInKQd7Cp+W3N98i/CCwGPnZJjaquUzhfQcgwY2fETjxoq5pubhQdHatUyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avxsguGWFyBoWa7J0ZTdcpnTWdj7wlUpIGbsQI8pTZ8=;
 b=tWzgLXxldQGXdvoqjKd7f0b3OZddj1qdhTGqDAU/y8UWuzXwCuCm95M5bm0qM7muZ22Ne+nbVPpBw5euuN851jk860TdXvJ5R90G4dO9VtyFP6Bbh53G8ApX0p3AftWNocQUWLrjtowrAiNOwpu8BN/j1sGp4/bsx4sqJUP+JRLyNipGZ+tA0LBDnMZnjF78uW8CBcKdMaUA8q3jE/LdC/2Lz7TVRu6kKne5ryqDE5fQKbUmlzbaciDhpZ97H8vMwK3C09ijVBC+tY1BBjH0X8wm+ZzS7B92Cwsm03njKluietTwgKvt3UvpjMdiRCJZTtDfzk+Ti78V08eBLyua6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avxsguGWFyBoWa7J0ZTdcpnTWdj7wlUpIGbsQI8pTZ8=;
 b=MQfV4at9V5dOVCdvxX8VsI3hnpte4omWqFSGxohgWtqR4xMboR2hqjskOKZr4aE0J3AbvwN9KrdANbTzvBWPSZ6jBR2AsY9ouD7uwa++hySA2DlawYzsaOiXtyugclSTv4dKVDeZuPSEBXfXUXHZnaipuQJ9ZjV+kBeKjKOQRPLe0sTZLiOuoMZHFol/czOoqy1+xbv6c+6EpESmVMyZAar8IhxydZ7X9rgRbJ7G0YOsJyKOLvEc0jUgw9ScY97t9eJ6G3Dou8DUU2MJywM8sIsnPBgKa4RJcvdhM5I0ChADbT8vjRq/RIqWL0DyeiRguW2Xmrva9JEzHOCtb15pLw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB8001.eurprd04.prod.outlook.com (2603:10a6:20b:24f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 00:52:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 00:52:46 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "mailbox@lists.linux.dev"
	<mailbox@lists.linux.dev>
Subject: RE: [PATCH] mailbox: imx: Fix TXDB_V2 sending
Thread-Topic: [PATCH] mailbox: imx: Fix TXDB_V2 sending
Thread-Index: AQHbtYSAV8UPPj7Pk0+53RMex7z/sLPd/H8g
Date: Thu, 22 May 2025 00:52:46 +0000
Message-ID:
 <PAXPR04MB8459B92E6D82E0FB8DBAEBC38899A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
In-Reply-To: <20250425014937.3812976-1-peng.fan@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM8PR04MB8001:EE_
x-ms-office365-filtering-correlation-id: 55a079b7-b051-4b8e-5d6c-08dd98caf7bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PtsdOkN9fZ8NRjsYeCIu/ghEaPuD4/5C4g8IUPHI0U00NrmTv3YlrSj/jh8B?=
 =?us-ascii?Q?748/9Gk5AMBYH53z69eQr4hKSjb3brT13v8mYDLdyX5N4tMDTBcqeZeyuBer?=
 =?us-ascii?Q?UkQPVadBn0rMuz8+nTkk41HJZOXE8FTTr40GRT5EXGvzqscpRxS8CWRb+71F?=
 =?us-ascii?Q?EM7vgpF2Mb+pBrqhCpy+vKB8ZsoTN6B1E7nrm9NvaDRx51ZEzwtNuVNqWO3s?=
 =?us-ascii?Q?0IS5sQVi82j4NM81sdsVZBBT6/fJaxruBuwuzo/F3Y7HZWryJKFYOXR8NCb1?=
 =?us-ascii?Q?WCvmsY8HUzGSmcFJEfUwZw7vTXcYMl5mHlHXqNm4ycgZVkPUboyYk/4pbeH+?=
 =?us-ascii?Q?XjQ6sva/BLJjpGeyK66lSgl4zJMKpAeNR/w74IzZqKHlhWviy/pNxWhpZ+YZ?=
 =?us-ascii?Q?cQRWXK3gQUPMGcl/eiuT39bKREXXlznllVS8GEjQlHZQAavS3QfTJjlnv5tc?=
 =?us-ascii?Q?2LnBq1CI1thTRVaFWpxm2Jd6KUP+U8pbxKb4ouLmd4GEdXDAXBVVQ7a06e9e?=
 =?us-ascii?Q?cTD4E71q0050RTDSTAhKWbVpQGMxZd4TrLqroV3z7ntEZb8l3QrL7zeW66ng?=
 =?us-ascii?Q?nrHrHkAgb15/6DgKeIqusSZM7v1PKvn7nKaQyuKk3oDtokh00QF95qErOcZz?=
 =?us-ascii?Q?4XXXG/j3b9ThzIliwSen717vyUFDWh0LtT3qfZOLQC7MLjadrGOsu3IOwU3G?=
 =?us-ascii?Q?QmdPBacILidPXG18+JYJxwemCjz+4MF/Z/nRX4DAbTz4075pZ442tYbj1y4w?=
 =?us-ascii?Q?oaD9ivdSZwt3/CkNIRLhORHtfUD+QD9pvA2IryNoypv7DEjU301i2CoMWRKM?=
 =?us-ascii?Q?nq65PS9OH3xJJCj9ckQaiq7GHwVAFcYtxyOClE2rh3LNVcYVgtlgILAFrPaN?=
 =?us-ascii?Q?P7MN3aBI1PoPsZJJw0PAsh6iehSaTg7zocEAjIKH7aHu6Tx/5IF6VJLb0bS1?=
 =?us-ascii?Q?8VmfwDIxFPXI3WaTm8AAVSltYfFE0Fr4mc19BUcpd8FHN5t/0fTimrjfyhw4?=
 =?us-ascii?Q?JzuY1crcYWvU0vao6kV/iSePi7ca8eITEaXaUFw9JwYE0eeIp9UxGXlZGcFq?=
 =?us-ascii?Q?ppdqj8fvsa2vgSp8YD51gqxgLgWzcaHcI609/yIZWW3JbHPJU2YmPI9R2Z98?=
 =?us-ascii?Q?uGujfZRfaPXBkCVVxtdPbpP4mc5L68va9xz0t6bCILBWaUXo9DMT+O34I99N?=
 =?us-ascii?Q?Tc7LKtO/fAyOapKTQ0z+OoGJxM1grgkPdjniPCIcsepqa+4RpcWCsCF+Jw+i?=
 =?us-ascii?Q?9s73ozDAz96UUSnXrE/GmRZtHHsFkuZ46BKWopn3fYKruv6faSfgBS7YnxBZ?=
 =?us-ascii?Q?vxIa8qQKNMowxmEZAeyM4hXdMbL+f109gOPBulhlFZD854cuIvj9RbqAr/4B?=
 =?us-ascii?Q?JPf07MRUvnD8z47rksaBp9+MYzzmE/9T8uST5cIcgqst6WJSS8UBVdeQqXQl?=
 =?us-ascii?Q?j3U9OOXFBOCOaoXoxqKJV5mOEygDWYI3YglsO2V9BjOHo/D0mGLCIw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?LHkEBd2KrG5h+h9TeN3HmlfvkaN3Q2ahyma7sdCIRjhNCFWtK73yRZ5wA3hY?=
 =?us-ascii?Q?qLCccxBnCx3jU622pdIaynlfX/R8MlgF1eZMfKpKD3TY+HAOY5h11KjUnfBc?=
 =?us-ascii?Q?qe4Y2Dgow52iZPoZDsEjF24kIqjVUno6lu6ydv56F19c+y+RQ46t94oDG4sA?=
 =?us-ascii?Q?N6ZBmb6JFK2hjpscwod0xItonMYvka0uNsQbZCFJgkv9F4p3Jdp/qOqfmTDz?=
 =?us-ascii?Q?iROTyK1TK3b9ddsOB9Cx8520aRVYx1wNmVbGRILP2MFmQyq0nGBoYqNTo0ju?=
 =?us-ascii?Q?BtdpApAuYjsx1B4d7WinSmZsC6EF4hvRdCQvL6JDA0kiSHgzlbx6DbqugbfA?=
 =?us-ascii?Q?jQmCaU1D/vN6qo2ehK3cwaauYhj2rr7EciGgSMd76LklUJKJmI1jlKYxuaev?=
 =?us-ascii?Q?L5lcVxpcIJyfkqZCm1l0fjp2GADOfWTBCbN06tZMufYYx+LlVIs2j1Rkz8fg?=
 =?us-ascii?Q?ywIK4bhv56ocuu5pE5fkyZMQemNr8z8alK59vvat7/hPUBFvsSKcjb2DEsEg?=
 =?us-ascii?Q?NKJdMPA0xdUmSfmEjWnL7Z7f0gtAaCEz6U1/78hRzdYvI9mb8vvfQ8PW4R6K?=
 =?us-ascii?Q?l92uSBlZhDSfPCe88x3wsYas0Z2vIzVp6Z3kxck4IXNKKg3XQvAdOHKHu/0S?=
 =?us-ascii?Q?kswTCQeHmKUGQ8W8CEbErZYOGwm4KFrzbU9BbR2cmAyGJujwXkPnZTgcKmsj?=
 =?us-ascii?Q?kkhSQw9w5GJCVO6IukocxkpPCy/lDHzwwC4/OXrr0NnegDSZbBaJG0FDjnj+?=
 =?us-ascii?Q?vVvEZ8e58zyhGAfqG6dBxCjFWa7MH0AihdHdTYkcGhkgqZOj1qys5IQSa0Au?=
 =?us-ascii?Q?an7Y6q3W636CnEsZEUJYCDeXvsWf9ZhnIAIeyVC0ZJEO6B0+3KzrgY3+H76a?=
 =?us-ascii?Q?aIrGpu6rL46BF3XHVG/Agthx9o86aZ53dyd/LvtyOSDD9qntc6Acpu7Bn+Vv?=
 =?us-ascii?Q?SFglIRp77uQtc8NXzdudUFDr4ogqptxxgxlSFvCDzkBLhD8LVjnPzBwW6vtz?=
 =?us-ascii?Q?0nWo363M93nV96slfzp1CeZtzLqrv2tmrRxY4Xj49DbQAko3lyuC/zSvxiGp?=
 =?us-ascii?Q?YV3PA4qbXr8WIzLFSniB8/dufBSPUDTmqGUWGV3SvQW1RS720h6vr9qbDui2?=
 =?us-ascii?Q?TmOZEp9CsviGHtMsbA/YdwY7rcLh6eRXBftJ3Vwu09rh2jodqm6YFaAzei1/?=
 =?us-ascii?Q?/yvglCWZ3Q9BbC2V+oz775/GDJoEgQzGgP/OGGMMO7kYp2l9M0PxepWZTsc5?=
 =?us-ascii?Q?1q1UuepWHOfvmS8Mt/luVKM5QAnXRZ51AYgcYN8LN7bk1Au6gJrE2K91LyCw?=
 =?us-ascii?Q?8en/v3fUW1pVFyZQ02kpu8GzhjdErlwquS9LfcXijtMcCr4Y3hcfuph0TqQe?=
 =?us-ascii?Q?AmVPdWKZTVtdoikXTjRSmVpwGMlQ7b0WjaSiqt1xE1uOC89SYu3yvmLHFMFq?=
 =?us-ascii?Q?BFJiCBb7ws8JKKCevkR3Mkd+S9WHlfsvLrk0cfxjPHi+wZFMKjWCa5dXKWaE?=
 =?us-ascii?Q?0rFX2G316d9PnkAwpU+KWs5QcpZoXlajkTl8l7WBkq8pW4MI65g/Z16Oyoyo?=
 =?us-ascii?Q?264u2N+Ct/HgepL+nFA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a079b7-b051-4b8e-5d6c-08dd98caf7bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2025 00:52:46.3448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j5ra/CAehxotOdI5j02GCDqAD6bD3vksnwJvWwctiLzbWJYC88UQfxF9IhcbKlbWlA13OKlWrEqJO7TOWoBlyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8001

Hi Jassi,

> Subject: [PATCH] mailbox: imx: Fix TXDB_V2 sending
>=20

Ping..

Thanks,
Peng
