Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2056.outbound.protection.outlook.com [40.107.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D085925FA1D;
	Tue,  8 Apr 2025 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095777; cv=fail; b=JVkMzewKsncpLyMXf7fQzidfyg170CP3UlpEXpR7UOWScZzACbG2vU7hYdNwzThm4YWmHbl6TDTwNBWbbN/OzOEPfB5IpRIpg0HZb1sHUANsPnB8haS5t/cs0vXJt1Gka+35cvaGllANSwRWWZmdzPii/rVAha03R74NwbeGG3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095777; c=relaxed/simple;
	bh=b7Ud7YBPtGwtL70fes9vLLLuQ2pt3DZhz5LwOxNS9kg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uIOUCYIbcyCykhTmltpXO0XFHa2GDZ8G2bIwSk1JE4UxCqFViwfPzfLGKmN74bhH43HmFkdMoqH4sy7bIhx62nbyoFQ43IokZVIkiEK7jhMtgHNtisFJVH1rSnEyosNI59MKwBp/zyHRq9G+E9KAD4MV44sKtzniERuvjEwpWUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UM/a8LYi; arc=fail smtp.client-ip=40.107.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UM/a8LYi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7UC/UDenRwGYiUQ1vK9aU9L/FDHwIYmnB96ivw8jsFgDJpqgY7yYuJwGsdVNl3rXHSuDMPK0mC0SlXNclEkEW57A9npH4xuTNcBX4IvbUKMr6j9hNUnxnQil9rRJBcwOfEG5HOSuBXXuLWIv31kiY1b5a0VntMObUAeTcFjx3jvvU71aI+yHiMkjwkuqNi3D9GRiS0DtayU1QH4U8kbOtBkbTB9H2ujWVkEqhVCAVQY/h4xezPjecuYfh0kQZXNwAvIFLghJTpuKHjsyM2GJVePmHFvbE6teE5fqSVFHV0RPFK4wqsg+yC5ogY55VZobF+OhqxVhvoDQQlSrom+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vm9RytGQiNDEopIPTOiiytfxshfIS5+Rfw6gHfWgHHI=;
 b=mhYt0B1eU+YHK8rydnd5mSb+YWGt9mHTDPatQuxwoiT6ey+l9y5lh86ZUMbzcoXhc+U3+7zsh0PGgahQ6w+vZkqDoDzdq133x7PfgSrFz9VD5XEJ6clHnS+UbTUn6nAk0r/7XEWF/7IROAWuIKL2HLkfYHByzHzzCSqQK+uGChCgHzKv6vYl4iB89Q8AfacqDFj0K/JJ0puzF5K9Zyrpxsa78VN+M2n75GLAjk9rx7e1HbgDv1J2bsmm5QySNZKqiZwUBk+t4ibYXMFh5swrrzPyyL1Q3VLzojd/GwoOgTtUCW4QmqtCr+1huYgy6DuSrQtNXggx4rpKwV5A9TRayg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm9RytGQiNDEopIPTOiiytfxshfIS5+Rfw6gHfWgHHI=;
 b=UM/a8LYiD4GLTGRHV9dt+pqxqiDmKZE7Uuy2vssYbum5Umj0EAf95fbp6gEaU1a3+C9Kf0xV4A3B9rzGqf6f661wqz2LQeWNb3mQ6hv3Mk8LHM0/F39vOJAdTkdwuyPubRoGWD9THm0pWyWswIE/Neykpa2/Rn1DfvnZGvARD1d3LiEu+XBMxlR7Xn8GJrjZwMB302Nl55BK5spQ9BbKycEN4oZzuovh+CxzuyZzUav6nt2ehqGnYHnvb2cqAAQhRvva5Tqz7GJkJk3t5/knXWrlAl14s+uOTQLfe0TB3MaaP5spQhHZmWwytexuiKB6DBGt4srCxHDinOS0caP2Pw==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DB9PR04MB10066.eurprd04.prod.outlook.com (2603:10a6:10:4c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Tue, 8 Apr
 2025 07:02:50 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%6]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 07:02:50 +0000
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
Subject: RE: [PATCH v15 5/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Topic: [PATCH v15 5/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Thread-Index: AQHbp6vhaY9E288aNEeiPyiVfy3UcLOYlioAgACwizA=
Date: Tue, 8 Apr 2025 07:02:50 +0000
Message-ID:
 <AM9PR04MB8604CF0462EA2071610F0E4095B52@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250407-imx-se-if-v15-0-e3382cecda01@nxp.com>
 <20250407-imx-se-if-v15-5-e3382cecda01@nxp.com>
 <Z/QmjEZjBGLSMO9d@lizhi-Precision-Tower-5810>
In-Reply-To: <Z/QmjEZjBGLSMO9d@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|DB9PR04MB10066:EE_
x-ms-office365-filtering-correlation-id: 87d04b02-e819-45ec-99c9-08dd766b600c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018|4053099003;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?iSgC8cRaUj0yCzlBOCjJKVm0nCEQeTw/9SMBmKd4JR/v35y8bZBIcYfkIyY+?=
 =?us-ascii?Q?aZ3ixaXb9RlJJ5+niz+XqmM20CKelgEQiJxciIuAoq3T5l8teo/Zp9IOOIfY?=
 =?us-ascii?Q?pTdqDIadv2uX2CuLB4djegRBCQxu+byndXDu/yrKMFJKoro7efQL6ld6gaLc?=
 =?us-ascii?Q?NZDhqEDm0USXeynoESaZlMMAdgqZ6X3O0TvzUEaqDRymoMZTCC4r7LmfJLeb?=
 =?us-ascii?Q?veGdZRUMTpb3X7iA30lndGkJencZNr1yTfSYyn0ux3O/5AWhD2EziXLhJAwC?=
 =?us-ascii?Q?uUY1oZ7VabxYACGoOMf9vhm4GDjsD7g63SK1z2rTVJtiUKjLWkj7vVtQYn3m?=
 =?us-ascii?Q?Uw1Y3XIrXTiqZwBRHVR++s8ld7/x0z/oBxvTfCQx0FvoWb31QFEBjY4JnwWb?=
 =?us-ascii?Q?XusujM6zlmqNr8kFnuSG8vSA2cA8Ye3/5hYPeA89c5Bwl1W4gtrHRZQvufa+?=
 =?us-ascii?Q?64B8SktsxV4xgg0B6XwTrOjvCLTgoA6KdB4EcPOw8MFreyoAGZRe8ipAwx50?=
 =?us-ascii?Q?qTg30h1Jqy2guEzTpaOWGg56RMSc0lO/56PfwpZGJsA9joOLtzGXq1HqTTce?=
 =?us-ascii?Q?KCfQI/S9IiCfnov83kjOr0UUXhOHBw1mI1GntZ1+D9ABhMmCMzIV6pxRGzbz?=
 =?us-ascii?Q?bTSkOeKymX+Djsy0GiWgbqryjTpAXKr9/QrCyP7yjs8IYsRRPzI4UVDf9P5I?=
 =?us-ascii?Q?3AGnCuPf0+hhT8tKyZVIgA2akQA/EnIq7SJ+Ee7P+2lKO9k58wpRGqSws0Qn?=
 =?us-ascii?Q?tsoqvb0A5Jrchb+keF5sVueOQJ6qRVdNhSxL5r0G/UZlnO87k7knksJYRD7I?=
 =?us-ascii?Q?zVfgEvemNjt1r4GKxhEXETubJ4UT+FVkBFepNCkLB1B5eJO2+cFXyn+nXhEp?=
 =?us-ascii?Q?/geDMoevbypJtNV6b2iEYbhK1ftpLn9gqe0jwKNtX8WHFCGLgePDYd1jJRIe?=
 =?us-ascii?Q?CBg8koFG3/dOUATP3civx+np004eLGErAcL/KMkARMX2JhEXqKB23X/eQ1w+?=
 =?us-ascii?Q?IxB4PhPDf0Fe2DPdc8BZc3pJ6oAFpP/P+ZlFU/nk4iHzp98Qw9w+jfyTXqID?=
 =?us-ascii?Q?v6i5smwGvdO+MO/SgNScQzdksctFIKKUu3+HPwWnCjAHciGTJYSKWIu0vvoB?=
 =?us-ascii?Q?CPLY88LZKVLWazUVWzpWg/0tdiSSV1nIDpkcgJ9pgTYmxPrTb5wknGH0nAzL?=
 =?us-ascii?Q?edlWTIjgxxwum69WNpMvy2Wnc1gyHgbNh1FqRSML/z2Z9l6qcD8CiO4AIUBr?=
 =?us-ascii?Q?e2ZpmyygxZrQYVLP/YE1EbFCcwwkP+ZVkbH73Q9plQyVRTKOC9axaCLPbuwI?=
 =?us-ascii?Q?nEmb46vDWke5vz8DSmpjW73HWKPZZRihnxrQ62GQx11mavXxLMqau3QwBYU6?=
 =?us-ascii?Q?Dfesw5/aES4IXDosx0raWI9eMVKNm0JICvsAy/uFJf62th6jTWxf6uZ+cbPe?=
 =?us-ascii?Q?1mDxqkHxbf+mv2vmPlfft+8C5q+kTD3NsGKmDkZP5x7XHn2xdvzfcA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018)(4053099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yS6OB59bRITzsJkRoXBt7WEkiW/mxJC5L6EcMDsgbOy2jNvNnJB8N6hWhp+h?=
 =?us-ascii?Q?ab+Da2XRzYCiYQTl3FX3p/ucHWRof9jXUi/Wvx0pdGVBaIHKzg7tAqs6kELC?=
 =?us-ascii?Q?atRBL1P/6bm9I93j9cEl42L7ITSUyIVjhGxwnH3xjNUcoVyzVd6oF8lojToa?=
 =?us-ascii?Q?FqMSJuMOseFv7wqpploHKc2ykxElyxdB6FIgSyHCr+BpM53Us5ZYGi7W/0Qr?=
 =?us-ascii?Q?zwRrN4TKm/Xt+rACEwuJVFI+PxWUmZW+2lY4SQLEY3EnHdEmY4lThswOws5N?=
 =?us-ascii?Q?nO/1MHPVtq+/exkgOVOctOHq+YWlIiIiwxMqmru+zEK0RStEGd0aZ9v/5N18?=
 =?us-ascii?Q?QYdTTsJRVVQEzS737/h/9pmUiuLqsyVhta8qL/kPjV2W4LuQb23QiTT9BKRN?=
 =?us-ascii?Q?OM58JT0uSK4UuRi+Q9Yg6pOIAA1N37d/JF93xaaRXaKExBB31K40h/FPwHBl?=
 =?us-ascii?Q?EdltzOJEqccct78yjjZ1+bkPto9Y7vDo4ykRDTGVa9qdFkRdWelQywPhDM7V?=
 =?us-ascii?Q?cDxX7n9K16OSFEeqSbvbqyVasFl1UPy3c9Ra0iqKmIlnu3yyaasoSxBwlBfV?=
 =?us-ascii?Q?JdUEIX89dLhd3yMSQuXmgMG/4ve84mrStX9X2Jt4TrZodOyuw7/ZxiMNMe5v?=
 =?us-ascii?Q?wmXCllNpMN+S1La/ux7Vx31R+CVrcZya4cLEP9jsFjWEbUMngHWjEG8qMzwN?=
 =?us-ascii?Q?bAuoV97jBAlTCF3Lxh7jykAI6e7DujDsbkysFGwKDQpvArUZRVrhRtVQ655x?=
 =?us-ascii?Q?gjGdH7tCQRtQBZTPpH/J3q4nEcOXDL0ZXIaSCL4JPMMqiwbf0qlHZmtUBXf6?=
 =?us-ascii?Q?CkzcpoqMXxTSlKNuX6wjOuY+kCk8E6lFdEBNefNtOs3ZlTAin/XERBTSUn2N?=
 =?us-ascii?Q?BdiHmYCHPyireIBIZ35qKMQ4FQaHmm4N4k6ciOG8eiEXAwoCugZMTo6rp1RI?=
 =?us-ascii?Q?zKAv3PRmVufsYx05Qu4KBo9ExgjhRMKgtdBRb0+M3PdL4M2tReKNppDP602B?=
 =?us-ascii?Q?rihq1kHsFG7hQAxUiuzfOIXk0/OT0EzcCpgxFhufp8BZgxV+1574H+DxOvd1?=
 =?us-ascii?Q?K87J4XSMWWZ3RJbs4Wczd+FeH98KFp3wLoqdMwIyObKODXK/3bJx3L5wmVyx?=
 =?us-ascii?Q?cb7mLRmgKjYoVlzG6VR6poOmKMGXMW64VzXuFxA8Yv8EMZdJ5n8bbdI6dmUn?=
 =?us-ascii?Q?M3VBGUf+BiLaCbfnCmolA0k1wfFhlQPpdRLq1SZxqFOsXNMeQnWKe/RCGplv?=
 =?us-ascii?Q?B0BOKp1Mec6kt+tEdlzN+1DmlkdpzKTENhaWJ8/6AhUkbgFa/MEbGOh1rZEE?=
 =?us-ascii?Q?2AYPpv8YT1SF+q9rqy4oN0Le1deV5MZIBdUc2j3NDolvPQFAuMb71PBQWHg4?=
 =?us-ascii?Q?GlgGuDSHhkc+plF6Iz8+7EIxL35ALHWnFnTZiioo0usSElBgCdMTXupdybJv?=
 =?us-ascii?Q?pCgRSJzI+xJ3ow054KLEf4/mOpOOSRHKru9Q134eeF1t613DpnniXrO6r0iA?=
 =?us-ascii?Q?Fmc2f2Hjx6Yu9QeDB3koS/9dJh9cNpUaEcKpKR0jCtTD4FpmvzmP/PqBStVd?=
 =?us-ascii?Q?OB2AKLZJN8b5+P1YEvnZLIxyKDAJa5qhqz7CZKfH?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_0016_01DBA882.53E84F30"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d04b02-e819-45ec-99c9-08dd766b600c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 07:02:50.0924
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T+ONWjL/9/iTRvndiU0LGIa5SL5rWGe5Ujt3lRYvvc5YK3TtmllHLG3Ae1TzZe4YBHi9Q6BzeoqjwOokVLr0MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10066

------=_NextPart_000_0016_01DBA882.53E84F30
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> diff --git a/drivers/firmware/imx/ele_base_msg.c 
> b/drivers/firmware/imx/ele_base_msg.c
> new file mode 100644
> index 000000000000..c843a5508a9e
> --- /dev/null
>> +++ b/drivers/firmware/imx/ele_base_msg.c
> @@ -0,0 +1,312 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2025 NXP
>> + */
>> +
>> +int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t addr) {
>> +	struct se_api_msg *tx_msg __free(kfree) = NULL;
>> +	struct se_api_msg *rx_msg __free(kfree) = NULL;
>> +	int ret = 0;
>> +
>> +	if (!priv)
>> +		return -EINVAL;
>> +
>> +	tx_msg = kzalloc(ELE_FW_AUTH_REQ_SZ, GFP_KERNEL);
>> +	if (!tx_msg)
>> +		return -ENOMEM;
>> +
>> +	rx_msg = kzalloc(ELE_FW_AUTH_RSP_MSG_SZ, GFP_KERNEL);
>> +	if (!rx_msg)
>> +		return -ENOMEM;
>> +
>> +	ret = se_fill_cmd_msg_hdr(priv,
>> +				  (struct se_msg_hdr *)&tx_msg->header,
>> +				  ELE_FW_AUTH_REQ,
>> +				  ELE_FW_AUTH_REQ_SZ,
>> +				  true);
>> +	if (ret)
>> +		return ret;
>> +
>> +	tx_msg->data[1] = upper_32_bits(addr);
>> +	tx_msg->data[0] = lower_32_bits(addr);
>> +	tx_msg->data[2] = addr;


> are you sure 0 lower, 1 is upper
> in ele_get_info(), 0 is upper, 1 lower.
Yes.

> Please order as index.
Accepted.

> why need fill "tx_msg->data[2] = addr" (0,1 already have addr)
As per FW spec after the header, the 3rd word should contain the actual
address of the image, conveyed by the container. 
In our case container address is same as that of the image address conveyed
by the container.

Accepted, Will add another argument img_addr. And re-name the addr to
contnr_addr.

>> +
>> +	ret = ele_msg_send_rcv(priv,
>> +			       tx_msg,
>> +			       ELE_FW_AUTH_REQ_SZ,
>> +			       rx_msg,
>> +			       ELE_FW_AUTH_RSP_MSG_SZ);
>> +	if (ret < 0)
>> +		return ret;

------=_NextPart_000_0016_01DBA882.53E84F30
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
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
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
KoZIhvcNAQkFMQ8XDTI1MDQwODA3MDI0NFowIwYJKoZIhvcNAQkEMRYEFBCZfg1j6OYzt+XobGx7
sb9njl3wMIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggq
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
AQBFzSLykTs31N6LzPkhU6AXWDPOPB8T+EXJdy3g65itqihf2RgeoZRdeBT2job7XPQWSWR5W0fO
K99klVP0D5favBQMo39VTcELS4xr7sIX4Q7YVZmPgn1e5G9kME/6m7UKfOuASHVJfWzXpo8gt3Am
3sOpFwozkigioEl9Gef8Np7S5sx+qQbg5dgxxrspNDsCaOTBrvAQzhU4QGC7A2E9v3x3jHf8uN4j
AaarQbu2ftImaFSJgQ1KxUInzJILX3ECgoMgufQDNHKv24H1jxW8om00AwglorU8LNIne1OKTjYb
CgvVhNbQybsVB+Z4HGg8auWjLx4AUjyagkzeMh5hAAAAAAAA

------=_NextPart_000_0016_01DBA882.53E84F30--
