Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B625D78F2E;
	Thu, 24 Apr 2025 00:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745455317; cv=fail; b=LjhiOLlyWyO+6VFxmFuAS8VCaEcJz1e5IiN1GQ7szkvqzeBMTukB7eMCgZqb+g7YmhLZv7POUPmIMSwIU+xVf7vedvnsDC9/KNDmBl8pD+wL0QEFFxbLaoynrvf6xnbMdufovD5HFm8ywVKfUqnAvuY+fEpLgxsRjiQBvQ4dTNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745455317; c=relaxed/simple;
	bh=RBMSI3ADIJKGIqpzwUcdguMq0thFRHCRC1IYciJ1o8o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UkjNF+chZ9Xk8LhxAOXJTxjKxg8CsrKdl4W04qS3h0yUT841J6OLBium47OiNlynRMv/l9A2IIdm1zD41pFwyYxU9/PBW1oGECdvuyrFZ3BPDWG7hTuZRbEzsK71/IvdgpnOBDToqIAuq6n94sBrrVKK9iDFNjeLifdJSQXNHac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n3geOnOg; arc=fail smtp.client-ip=40.107.21.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n3geOnOg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGCBKY60lRMyhfGv2UGqXn24TBMBb39Q6aLVXRSmG3fbcAge417X/vcReAm2oSQR8UHgSsSqxFLiIrg1AjZK9cCqxiJS7kHU4JF1TI95ixLW2rrng5euskm0zyVakF3mcOeW1S/wsKoXti98bAaQXMPAu20bdcAq4jD/8GXcYO2S+VmTVyVXI+J6n6yLrB89ifcb43K5crO+aiFqxdZqK3bJmBRBfyp8685I7v+EmZhEjsX1zdEpBS8D75PFvlzLrf/HOIdQjuckQSaVm8/oD/otVpTfjTqEXlDnHHgYZDcW8kqe6sBxUispe1W/PIE8owIA1lB+HHi+K4NUY5PsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBgbXxCRcUEKMXlHB4yezFVKoHPmVvq26W8DlLVrh4s=;
 b=QXeI6tsQC0k99RDIVg1o78o/f69Ax7x/0E3l8HFhCv4raL4kmKVvgQf5th1/hZBCAfiMtbtMGIjxoyF8kMmbIyhGqawGXn9ZS0JTT4N6eRaJ0F/emD2KpGfobBtp98a0DhtZxHhy1p5/ExgV3/J8Hnu04+CTRhEt2gk4HGd5UIBMFSEipo0Qnvo6q/Ped+i6th0BUwmpDODRF0B2yg8zTdppfOBNQOnxvgPlDo9LGx1u9ymikG8qaY+kPcEENxWX+noDV3jH3eq6W2/nThSMaAYCDR2Cy+rJsXCgOpypCWdC85oyJ9d8y71T6pl0PuId32ADgbwg9WKJWhYmNp0gWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBgbXxCRcUEKMXlHB4yezFVKoHPmVvq26W8DlLVrh4s=;
 b=n3geOnOgeb3Jx/+8u8SOUAFUAOW8pzLLeQO+K+prK21cjQEYOCqelKpTcRw0d+hhhwnAupBHsAOJMkATS3zBZJ6nMt9a/2uULzyRzR4ZYPRn2Rk1V7pyMOMlGTY/lavCs6wyHuEYcR4KXBYeweNCWDsLET/eALYbRCONATuVozm+YRbGw8P909XiJCjkjiMJONG1g3zK0hb/cwcvs2VcI/5SeQoEpqOsw/GIR0YDGZeZhVHfAKz17r6Wu1DU+TNTXTo5TjSf0EaVEppo7qNV43GCtYFaQ4Y9K0ie7V/uQVvbGwJMxDdmsFYB0igRA0da0FOIlY6rcGHZtL13EYdoIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8605.eurprd04.prod.outlook.com (2603:10a6:102:218::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 00:41:53 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 00:41:53 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 23 Apr 2025 20:41:25 -0400
Subject: [PATCH v2 3/8] arm64: dts: imx8dxl-evk: Add pcie0-ep node and use
 unified pcie0 label
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-imx8_pcie_ep_dts-v2-3-43c982d83a8f@nxp.com>
References: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
In-Reply-To: <20250423-imx8_pcie_ep_dts-v2-0-43c982d83a8f@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 hongxing.zhu@nxp.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745455301; l=1063;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=RBMSI3ADIJKGIqpzwUcdguMq0thFRHCRC1IYciJ1o8o=;
 b=1fST5xm3yx2XF4U02YvwzTy2ZI3jCBCGcdWnEkYkzqX4xBD0wTKaAy7ldATRtVHJUywaIlEzH
 en/NdqVegNGCMqSpaYGMIYiZGgZ/JLZn3Glgzv93hh72sw2iJ/5Ld7E
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: 11366b21-ef9a-42a7-17c6-08dd82c8cefd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnB2OFhBUWQweitWUUJGUmVzcU44d0srM1U5SDlTeVRFR3ZrOSsvbFY2cHNa?=
 =?utf-8?B?Z2RRSVlINlg0eXFyK1lDYXpIcFpJTE1hNXErVnFCTnJTNGd6aWFXSGxyN0sz?=
 =?utf-8?B?Wm1hQjFmVTI0YmlxVnlPak90R04zYjV1SzJPMlIvYXdrcjBWdHUra3A3RWJR?=
 =?utf-8?B?dm5MeFZEOUp4eUN6WXpvTmp0REtBcjdLNzVFN0ZMMWtMZmFTTUdCbHRRTFZT?=
 =?utf-8?B?L05iTE9aUFQ4OVNBS0NNS24zRlNiQ3hXWFp1NzREeU5BK2VqeHo0dGdwR2Rm?=
 =?utf-8?B?M3FudVZSOFFiVzZxWm9iUHd4cVRHd0kxdThzemZ0V1pucmlTMDBBamlRZ1NC?=
 =?utf-8?B?K2UyYzFaT1Q2STJhTEg3NjRMNXlPbTNZVDB2QUcxamd1RVZLa3V0cG9kS2ha?=
 =?utf-8?B?V0R2a2hGQlVIQWYwY2Fpa05Uc0gyQlhaRWNnd2o5SlJ3dzBtSVhVdTAyZ1oy?=
 =?utf-8?B?eFl0eG00dklzVHVIWE0zYnpBd1NDeXh4Wko5Ni92S3lycFZacWhqK2thMEg2?=
 =?utf-8?B?MUpnUkh2b1h0QXpMQlorZVN4bzBjR2E1cmMwdWxMWm9wbnJXUThQU08rOUxt?=
 =?utf-8?B?OXMyWEkvK1JNZnQyaHpWTm1uTjRNS05Zc1kvYWt1WS9scDZIa0Mzajg4eUhN?=
 =?utf-8?B?NmpROFRlSUNoVDJEeUNseUpCNkdnakNqbFJqQVczblFVVWJoeXB5VFRkWVBw?=
 =?utf-8?B?YVFwS1Q5YktvYnpLNUVzck5rTm5YY2N1NGpaUUZwSm5uV005cWMySzlLSExh?=
 =?utf-8?B?bUdJU3pIbDlJemZpSjZhS3UzNjZkYnU5cmhEME9CTmQrS2ZQSUtKNThWRTdL?=
 =?utf-8?B?bVRjTWFPcGtLVHNjem5JN3pBT1Y0d0JxVnM3Y3Y3ZUhPL3ZPL2tYTFpuOEs2?=
 =?utf-8?B?bDBKdFZ5VFdRTU83TExtWmxyNWJlY2crKzlqQnQyaytVeXpXcTJjVEpBRS85?=
 =?utf-8?B?WjlzWTBOMWhyQThwYjZWRUphRzYwSHd3ZGRCMzRVVEoxVDFUZlVoQ0dDTDkr?=
 =?utf-8?B?a2hWMkFJTjU5Y3VQVVFWNTRKL2YwMlFwV0o1Wi9IbTRONTFTVVlUM01QYWpw?=
 =?utf-8?B?VktrTnMwb3hxRFpscTRva0VFUFltVHlhRkpmWU5xa1ZCby8wQ25oYTEvM0U5?=
 =?utf-8?B?ZHJaM0k1c01FVFo2SmpYeHRhRjNlVmhtenRGMlhYKzBxS3d3ZVQxWFU5Rmwv?=
 =?utf-8?B?VzdpQldpdGcxOEhKZW5KbURTQzVGR0RwT2pORnYvOHdZOFN4L3RrdjlyQVRk?=
 =?utf-8?B?RG14MFpLdmxualR3dVY5OGszNWFEQmU3WTBaVjRCYksrSVdSZDRnRkJBV0NC?=
 =?utf-8?B?SHg2dVBIZW9BZzBlV2MyNXp4YkphZVR4VE1JbGcrTmMwcjIyM2podUxRT3J5?=
 =?utf-8?B?aFowV3hQTTU0MHRYWDFPUlczVW5qR0RoNzZaakVCb0JScU90R1J2Y0NXNmtj?=
 =?utf-8?B?MGJzUHZKemVXR1hoTld6c01LUmd2cnpFZjJjOGdXRXFpZ1ZpU1RxWGxFTm11?=
 =?utf-8?B?RWdWQXB5SUZ3eEJxdEljREVLRjJGRFNsWnpMaHNuSzd0U3pvSmo4UXpobE9R?=
 =?utf-8?B?ZktkdmZ1N2picFNFazdxZHRKQmJnK29wRDNBWmJ0U2JFWU5NSnJXZDRsdjdz?=
 =?utf-8?B?MlNjT2xzMmxlN3g3RXNzWVdLbS9WQk5jQ3VndkMvV29UY2N1S1VIUFl5MlZz?=
 =?utf-8?B?dVZjeGFOT0pXU095bG5pRHhTcjRpZzZ6RFM0THFxcXg1ckdQaWh5MjFvaEJt?=
 =?utf-8?B?V3VORnpuWXdLQVJ6U0tvV2NkSW96ZTE0KzZqdi9nejhYclpyK0JTZ3h2NDda?=
 =?utf-8?B?UkR6ZTNWY1FINjlUakVla1k4VFo1dWMvLzB6azczbGs3dXozY3J4RnpqcTJE?=
 =?utf-8?B?Q3lVY1VaV3NtMXZQSDhQaG01bW1kdFdYLy9tZTlIQVdDMTREV01ENjZVRUJm?=
 =?utf-8?B?UGRYQ3Z2NUJTS2NZaVd2aUVxWWh4d1F4aWE1L1p0NFZ5OG4vUHhqYWJHWjd0?=
 =?utf-8?Q?e+964TEEtvilPKi2Kk98ysj+T2Qe0w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTFqbEh4Y1JKdllNZXd0eWdJMmtFLzBSeElFeWZ2WlZkQzBvbkJZM3JOTWJv?=
 =?utf-8?B?U3ZkNU5nUFNUN3FQL2JQUno0ZjVEcEs0aDdsbmp1KzFkQ1ZsNVNPUStwS0pM?=
 =?utf-8?B?ZDNmeGpyM09taTAraEpYWXM4bFA5Ui8xVlNrNDFnNDZMZWVEVDJUYWxkSXRD?=
 =?utf-8?B?WkltYUZoaWlJbTVqaXZwK3lNazZ3anBQK1ROaHJmNDYxZnE3dHlEcDg3TER6?=
 =?utf-8?B?NkUxTktzNit2Vk1pOGlHZ1lONm1lQmU3a01kaFk3OThrRTZ4M1pUTmtKVGxI?=
 =?utf-8?B?L2lRODhLa3VuKzQ1ZWxvSmFLR2p0R25WbUtwMzliU2JVczM4dkp0US9qRVNQ?=
 =?utf-8?B?MFZvZVRvTE9XK2ovMGJ1OXE4SjVLTStWK05jUlZ5NHliQ2lnMmszQ21SYXoz?=
 =?utf-8?B?dXRIZU9ITnVhaUlNaGxPQkVWaEZyL0VKZ3QwYmc1RzFJU0RIOUxqMkwzQ2x2?=
 =?utf-8?B?ci9lU0tYcjRoSU45ajJHaXBYZmFGRWZCNVhIa2Vsd0ZDblkzZXVsMkdrdmZN?=
 =?utf-8?B?d3dQblowcGJJbkg4dGx2NDRCYThITm95WTRwQnNyZjg1blgvR1RDSUZia21N?=
 =?utf-8?B?WGJBUVArUzE2eWVPQlVQd0FGZ2dzbXUrOHdIa1h0V2NMa1ZSbEVvdlFGQTVS?=
 =?utf-8?B?VzJ5VTdZcFM4ZFFOcDdmU3p3NUZYalBoRnl0T3VYSlFzdmg3Z0lKeUhPcHRH?=
 =?utf-8?B?SnpOSmJjRUpHbXh4b0lRZVBxdjUwaGg2RGlWOC9sa3UwRERML0hUK3Q3RnlT?=
 =?utf-8?B?NFFIdEw5K0tTYWFhQ0s3Mlc1TFV3MXAzd21sZ2hxWmtYTS9tVEM3amRRRGMz?=
 =?utf-8?B?VG9lZm8rOXc0Q0d5S2UyZWg2N0JtbHBpMHdMWDZMTkNjbDJsVHdFZGFpYWE3?=
 =?utf-8?B?R01IK0gwaHU1dk1mb296bWU0YVl2UGp6UWVYSXFyRkpwNFBLOVF4dEpFdlNT?=
 =?utf-8?B?MUUrUWNsSVZRKzJ2MFFBOVBUSG5VaU12YnlBcWNxdk9hdWJ4RXNsRlVTNjV4?=
 =?utf-8?B?WE0rcUtmajNMYVdEYU9WMCtLbnNnbkJINWg2cnhnbG5SaERCQm45L29uM0d6?=
 =?utf-8?B?Q1JnakFZOXR5L1JuYXoyL3pERHdjR3RyekJhK25PU0I3MW9maUhUMFBxcDdH?=
 =?utf-8?B?NkZKNjJzQlVLcDM4WmFWSFR6VGlFQmVlS2VUVXdRUkRBN3VKWkMwcThGbEZu?=
 =?utf-8?B?LzA4RnFvaWE1a1UwR1RiN1NZUlM2bStVM0F1RjM5R0JDa3dvWnNVVDlINGRV?=
 =?utf-8?B?c1hzb3EvRm9EOFE0WTlRTGJCUnFjajM0ckFRcGFWaEJTTFlhM21IVDRQKzdk?=
 =?utf-8?B?YWMrY2FXdUIyeWZ1WGtMMnBkVzRLbVJ3bS9KQ3ltbDV0Rk11ZUNrTmtMZmtM?=
 =?utf-8?B?SUFFZHJYa0V6b2JseEQ4Y1R0M01WUG9FOXBXRHpmd01sL3lrSTIwNTY1Tm9D?=
 =?utf-8?B?V29UbSswVnlIYW93b0QwRUN3ejc1WmZyeTZ2S012OWQ3K1JRNWMwR3ZKV1Vp?=
 =?utf-8?B?RnJUays2Zm1zN1Z1cmplOGNjSldUM3I2WTVLZzBIR1VMbWQ4dk51RUkzNnA2?=
 =?utf-8?B?d1BrRWVWa0NaTHQyTHNscFJ2cTg0V28xWEdhM0VQQm55QlhwTTFiSUtCQjM4?=
 =?utf-8?B?V0pxM1UvTm5OdzRXaVovRE41YlJ4aEtVOTRPV2VrZnVncGNXRVNiK21YYTVE?=
 =?utf-8?B?SEcwYUJ1dnZiZmI1VW9sUjBJOHJ2bDlyWm9KRlhKelB3WGdhL0VxTHExandB?=
 =?utf-8?B?Nnc1M3VaLzMxWDNRSzVnMS81MlR5NEl0WHNORVJySTR4bThRUjJKMkdoYjY0?=
 =?utf-8?B?UTFtTGZSMTFCZjVWUGVMVUxzQU5lbWZ5QithdHlpc0h0dGlaTCs3eDlkdUZ4?=
 =?utf-8?B?bXU5Zk5pdDNFWkFGM3ZiOW9lZkVGR0M4OVNjckZ6L1B2a3A1a001RDZhTHB4?=
 =?utf-8?B?UG1SMFpmY0xUa0U3cUg2TDB1VUFSNGx5ZkdNaEtzQVIwM0hsT3NheG0rdjFz?=
 =?utf-8?B?MSsxK2NZei9UaWZQWmNlY3owN2tQQkgrMnpYNmRLTHNMNjZsTTRDOTAwQ0tX?=
 =?utf-8?B?ZEk4ZlppWU8yQUNoeCtVcnhnaDNxNWplZG44WmNDb1pRY2toWlc4SmZ3WGE1?=
 =?utf-8?Q?l0vA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11366b21-ef9a-42a7-17c6-08dd82c8cefd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 00:41:53.5603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yrSX2oRNABb036AHL1mxrt377mUnB7ORjlCGrf8dvfxMqDGuHsstxoJ218FIhzBG4Xm+dxu27JxnBjM9gDUqoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8605

Use unified pcie0 label and add pcie0-ep node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
index 5f3b4014e1521..b6d64d3906eaf 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk.dts
@@ -642,7 +642,7 @@ &lsio_gpio5 {
 	status = "okay";
 };
 
-&pcieb {
+&pcie0 {
 	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
 	phy-names = "pcie-phy";
 	pinctrl-0 = <&pinctrl_pcieb>;
@@ -652,6 +652,16 @@ &pcieb {
 	status = "okay";
 };
 
+&pcie0_ep{
+	phys = <&hsio_phy 0 PHY_TYPE_PCIE 0>;
+	phy-names = "pcie-phy";
+	pinctrl-0 = <&pinctrl_pcieb>;
+	pinctrl-names = "default";
+	reset-gpio = <&lsio_gpio4 0 GPIO_ACTIVE_LOW>;
+	vpcie-supply = <&reg_pcieb>;
+	status = "disabled";
+};
+
 &sai0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai0>;

-- 
2.34.1

