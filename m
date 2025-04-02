Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012037.outbound.protection.outlook.com [52.101.71.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9018230BE3;
	Wed,  2 Apr 2025 06:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743574472; cv=fail; b=s2cs5AproV+CTw1d3gzErcCQzL6IcGvjHhei6IFOWCGKSzHLaQsj8TVOlAhyqiQ/NWilB9zyFgqbCAuZPqFEodqcx3FUqEnCOvVq32Be1oaOa9gQ6m4q9lPfeLJyOq75O8CKBmD4tLKN4WBp4aScdmC52mjjWRApcXY9ZTOZLQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743574472; c=relaxed/simple;
	bh=8qGSR+1rHOSjas8Np/8cWpYsMTTFNQr7W/nn0H+4f5w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cxxAiHgeh/p7YudVwSG+ADC3Yg9ctuSpXjECWHbjJ5pa6S0QvjleiLcGjhFL8ZsbLE4i7UtIlbvO2+r+e7tFrwyEWSUE3e0tLa0Z1puiK2tvR17MKgxBrj+yN4d3n00n+s+IS1JiZi9cFFKJb7G7+qn56bzkz0Z/y0M73LRzROw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ehodUl6y; arc=fail smtp.client-ip=52.101.71.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ehodUl6y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGF06cNH2Sj8lVG+08s8+Kzm9TTcXsvrrPTdr6SyQeP8boFIDuGsiCE7Q9z7+dfVx2MvbQzFznZQ05SbKUFu8Kp6QXmWNmdWRi9V/EiDxrPEBZGKmPh3UEqwMqYgZ7cPEaiGF3g8wFc2ZK2yofxlwvYAtd55meLpDghNW1yDoveScXjH8/nXj/FijeXZgPQYqafFyXVFuBvmdTpI9ajHvE4wDBXGKDSCDSZisoqY0jZLL6WnvEeCWy546CLF+WANZmbUW2VJ01xX8+AuW+3VvBEY7rvbaDSll7fsOOmuK5hMJHhU4BEIPXi6PrJDVkThDXoGT59pyHnswYtnoeXUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5N6+7mBQcUxHEViJ8CdAkiyA2RrWZsoMi+JC+QVpmKk=;
 b=nVgBCauAau17+3xWS1Aw4JEE98e2eOloDI6lVbDvDciF8HDzismfSptYgmLLcrWvZZhsZ+pcPcfukgrui5gPw95cqNm2ZJMb1/79gmklK3J43oIzE8CRUANG2YZYSsDOrpY2OkvWG8bMQTU9+ZdNyozIt45XhB8gQfGjv8cpUWrDTHAyxXNJmoiJiktEnGKC6Y6cwkWMB3nRU4J6Lyscjgu4UQrDnAB/n1U5SFHe7YVUughiMr9dGtStUlgLMEpVXJBfZkwYzy9rlikmYhM4ZUJ7MfdoWu2u9TqqjqADOvi9gxMQ3nYeddq7GfsF2q6tJug4lehNO1MUlogDxlbF8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5N6+7mBQcUxHEViJ8CdAkiyA2RrWZsoMi+JC+QVpmKk=;
 b=ehodUl6y8ZjkUsJez2+WYzatOFfq4gUtZKBz5AufaYsHzPNRw2WuR+vJdWeGqdYXna6AGxqSDOvjh0T1PYf9To4+SSwY/DSfllkftpkrDmywM5cC2vLy3yOKLuvYt5klWPIkZIm9cycrkbYzBs8CL6hV96GUJsMK+0vF+NIAY3OLJhY1ssDo25BDFLG7CyAkHK4WJaSPdwOck+kErpVzlrQwEIFfEVK1s0SG/U3+fNZ6AcmIM6rRJ3G8Zji4c6Xb4cYnz8vWxVxaCGdlAOJ+AYOT78P8LW/NTegKtvDGq85Ce8g2Ezd2pdCG7I+4+9fxgKIpFamMMJ54QMDYcW74DA==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM0PR04MB6819.eurprd04.prod.outlook.com (2603:10a6:208:17f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Wed, 2 Apr
 2025 06:14:27 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8534.048; Wed, 2 Apr 2025
 06:14:26 +0000
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
Thread-Index: AQHbnlEZ/rAD+YPIT0yUa1mjl0COqbOFjCkAgAkkShCAAT9OIA==
Date: Wed, 2 Apr 2025 06:14:26 +0000
Message-ID:
 <AM9PR04MB86042908192F7C5C7E9B139395AF2@AM9PR04MB8604.eurprd04.prod.outlook.com>
References: <20250327-imx-se-if-v14-0-2219448932e4@nxp.com>
 <20250327-imx-se-if-v14-4-2219448932e4@nxp.com>
 <Z+QePoixgnheYQTW@lizhi-Precision-Tower-5810>
 <AM9PR04MB86040127423D0A657103589D95AC2@AM9PR04MB8604.eurprd04.prod.outlook.com>
In-Reply-To:
 <AM9PR04MB86040127423D0A657103589D95AC2@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|AM0PR04MB6819:EE_
x-ms-office365-filtering-correlation-id: 922cc523-ea6c-4eec-678a-08dd71ad9f1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|4053099003|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?YphVJqPN4xMLIlE0aAO9AUWFqRnkFMuLNJ3sOe+EzH45zDjcX4HyxYm1gAEe?=
 =?us-ascii?Q?vjSJh2iroYxZePS6M45YeOclqT0HIT1RYkcugY15RNXkCShptvV+oa2uOfKS?=
 =?us-ascii?Q?xbp/1iPxccAXzGhVFEzL5HHhFRFgHPLBzJnmKQnGNaR2E88kcz36+MEKdlEQ?=
 =?us-ascii?Q?7EbzO9c33TQ4twGHlxSeh1iQapmrVrICMKfELJf81zITKCn4UlxP2g9Z1MqV?=
 =?us-ascii?Q?a4U45b77/KAuZUDsHJYwBVphNl/0A0tE9yvsYv51sLGtU+3HDLK/6ZpLyOMa?=
 =?us-ascii?Q?zfs+rgEXuj8SjyExISpoVOKM8egTdcbgOtdzTS4L2RQUNPT89S9j9QwVqYix?=
 =?us-ascii?Q?/OgUY5vmmAbo95o2j9bKXvVU9cnAhbByoypJRatIuut85rwxDuTcDWuf8KeL?=
 =?us-ascii?Q?3XgiPkmZeOtf6IZX5/Kp9uhGQ9Vfrx/IbQ/jO/yOWyfPoQZFGK3Qn0DAXx/+?=
 =?us-ascii?Q?go14nfJdaArptsEWGzdiEVEMU3JTmGST9gnh3M6hpLl1FlXH5ZP5ukDLqBmK?=
 =?us-ascii?Q?FCoQxmR2Pt+J1uAx4/6QqlTlL+rdK3Ihdia6u3K5YE1nou/qsl4CrP/R7/t3?=
 =?us-ascii?Q?DyDt4ZJ8gymROB3eAlypYtLVpnY0C6vk1dBjoFWy4QPNbcsB26IgZHLdC6nN?=
 =?us-ascii?Q?9Imivuzv0UBKWgJgQkGIaDbg95oawbNX/n4oMYdW4DB5471NSweNlfZtqS7x?=
 =?us-ascii?Q?y6yfzieb26nc0dzYuCauS2zk5IlZ96+h85/s+nJ+o015HDP+971gIvQmwO6e?=
 =?us-ascii?Q?oAArmNE7PqJVVxGvpkqEcZPPe/LKy1MNkzRrc2GtxpFrOoaoK5kklDJpNr9a?=
 =?us-ascii?Q?XkphvDQSftBj9w6dRVqU1QgEV5U86Xp6jdLW58adfCJGxL/Bt86qBGbvAI9k?=
 =?us-ascii?Q?3APLysVESIkmJSyzO+l23aq5Rhzc+YPORdNTxFcLo/x30Xemyy19uyGbHxI1?=
 =?us-ascii?Q?tLM8RYjWBaIE8v5kvmajWM095UEU/E7AulWDz5iv3X3GIHVrAkuDr82L9moV?=
 =?us-ascii?Q?48AofRIqe55PaGqTTd5b/CPnpmM9Z62vJuR7wcDynXoRA0Iq38fsPE7UGlEJ?=
 =?us-ascii?Q?XeVv4xP+EHcMNF9L6PYhFwdolt1CCYX+Ytkab4eCxJeUbBCiA9/Q7WQBKRxv?=
 =?us-ascii?Q?I1jrE2r5v7XHeULkG3RmqX4cJ1uX3aukVh37vKvtQK9zFoX+sSVV9YAwkmyt?=
 =?us-ascii?Q?nRGEgqeKAuizyvu3RL9lbJSM0th0IyfNgh2F0+Zo4ficG86MgdAyRG5u96D7?=
 =?us-ascii?Q?1nm32gfBI6owP0HHpbZ1CEN62BxRQ+4Dg0wgY6ErnPddRDwIU5rz98gaaZ5o?=
 =?us-ascii?Q?tx/W9IsUKSHN6Tzgy60PfOej3WlxBnIPSRzQN+O+a//miYB+mnxrXfce/KWb?=
 =?us-ascii?Q?jO9pttlx7UYgSj6HPt3KBZXibg0idm5JyVIGUS4CA6H/1Tg5mT1Z2P9TDzgF?=
 =?us-ascii?Q?FmZKk0EPWM+6O792edFBkCZIlX6hpwWd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(4053099003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5fVRiV0fljoqFSkeimpdvf0dYGi5WadxweXpfssMg/8zCowu7IrOahcH8mlb?=
 =?us-ascii?Q?0zaH82sf40oxwnRiMmHVz25IMOeL2wRRm19kVGFY44x8US5X7ihhOVVlH6qH?=
 =?us-ascii?Q?gWmFS6UUw1yd8REZjkk1FOic/VXtWvxBZyqPVp80y/xAdZT0bR7j7ANChVoF?=
 =?us-ascii?Q?K//eOoYqaHxhm3SayG1fptLXNL6qLzMm8adxA7wwyDRe/5VpkMCPaz1CcycK?=
 =?us-ascii?Q?DRf+4rSgknZIInfzDXVkVSqRd6ExHYGUjcKNCr/Prj+54wIrAH51BlkFKTu1?=
 =?us-ascii?Q?PDUiixuvY2E1TY0hwDyYRibJHs6bZJNGiVhJm0s9zYvrj218/EvXaCiIO7MI?=
 =?us-ascii?Q?iFsCPXnG59S/CXNKShRHFX8yZsonOX0ET/FzH2F6KMy0yO7dCtsp5qrvxcPD?=
 =?us-ascii?Q?R8nEZPNQcptbJPHrg3F8JPzqHyTLKMyHITAJZi+qV2XmBgOaE2nkzKqhxlye?=
 =?us-ascii?Q?7Vy8VoYwQWZaJ4Hr2E0bhRGRHW1VHr4JCHHUm0gu7SpLTAVPZTi1WkoUwTdI?=
 =?us-ascii?Q?ftZCzUZ+MLQLZw3oa8yX8YhZlpY57vlzwLyfKu9InczT2f1RHM1CVNuS0DTg?=
 =?us-ascii?Q?UmB8mdSKyWS90g5iB+U9eqyAOUbtupbnMala7T/4p1UnJHnlCBsm70JRhQBJ?=
 =?us-ascii?Q?lKt5zoDzT0CvX3i7wFY8E0+cZIOvuOE0xi5ZazA1/6G/nYb7exbgWldJADAW?=
 =?us-ascii?Q?4AAbKLaKzsrKEtlqtZkh7RRZnZmgwLDgj0iOHyRpRsTXaD1g5ojc45zwxatb?=
 =?us-ascii?Q?BnS/5vlec+FDpU/7q3TxwN22g9qwFmM9mywkuHN6hG+ZGg/X7+f8g4wMKUb6?=
 =?us-ascii?Q?Y8JSBQE9reKvn4r231JmfqI2/++yATZFy/T1mRe8lQ751Wc3q1AFlf/PiTNC?=
 =?us-ascii?Q?8TOxzxAgRwc1fpa+yT5Bmjb9IkXL+f5cwqfB2xxCEttCglCu9k6aNR/TB7VG?=
 =?us-ascii?Q?YniLhHTCcv8kaa3bbEYNDf5o14YvDAWRdNv17aAtH/kgGi5D1QRWIsiELd8k?=
 =?us-ascii?Q?JtjfMrlla+6tcAWqMnWzfwmBZ6hAeQimC2CUeTlFxQXDkLJN10dnt2HKaEFu?=
 =?us-ascii?Q?tax/UkEQNpABVW2yBhAwqePnwJ2edWfnUkgletvCnEi7DfgQF0hWbgKvC72L?=
 =?us-ascii?Q?MYgshTbzhNE2QMzsqISu7HucuvBWyFIeUNjfYXgduNcMtN1XVPzEfDk3CcUg?=
 =?us-ascii?Q?ehyLF4rRddonOgpl3yKOCNskY95armLTR5Zv7/B0QYitYegWe2uImfMbNbMK?=
 =?us-ascii?Q?H7RiKk4PxcWjBATyL925hEnLHFWwqaCKgY15JKQPqZ9GV0nQYwpNBBNzqrTl?=
 =?us-ascii?Q?gEZmDeLBoO1/GyZO0QNYE0gklUCqaHQdcOiy1QkGb7ryhR/s2pTCFzLvx0kH?=
 =?us-ascii?Q?bEM5Yh3Zhl5I+H0Oq1CHxRUv6wde4P3qgSYFQOn34s8+VnbgbyK0QKo4R3Ir?=
 =?us-ascii?Q?sdxVcmqdIN2jCfjIvYlcNmwjsE/zUJPcWvhAzxB0bSC6Z1vh2pVLhEMSc47N?=
 =?us-ascii?Q?gBqkOFuJwTYwOv0vY7/fS/MimCWoSdTJyEYJfqd4kfjnjFhno+I3LFWPEzGb?=
 =?us-ascii?Q?S0SuI3C3hX+WlYnqrF1jAc335pg2g2SOGrO840b/?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_01A5_01DBA3C4.93635640"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 922cc523-ea6c-4eec-678a-08dd71ad9f1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 06:14:26.9126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fc6wZJDgzXq5ztmwBVsiBnrlKBs5QYb5WOvbiD/rh9eqBXIFtFTG7DDRe//EJSAjmfQkVwLs7njKmb8fK6gxvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6819

------=_NextPart_000_01A5_01DBA3C4.93635640
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

>> diff --git a/drivers/firmware/imx/ele_common.c
...
>> + *
>> + * Return:
>> + *  0: if the input length is not 4 byte aligned, or num of words < 5.
>> + *  chksum: calculated word by word.
>> + */
>> +u32 se_add_msg_chksum(u32 *msg, u32 msg_len) {
>> +	u32 nb_words = msg_len / (u32)sizeof(u32);
>> +	u32 chksum = 0;
>> +	u32 i;
>> +
>> +	if (nb_words < 5)
>> +		return chksum;

For msg_length = 8 bytes or nb_words = 2, execution flow will never continue
after the above check.

>> +
>> +	if (msg_len % SE_MSG_WORD_SZ) {
>> +		pr_err("Msg-len is not 4-byte aligned.");
>> +		return chksum;
>> +	}
>> +
>> +	for (i = 0; i < nb_words - 1; i++)
>> +		chksum ^= *(msg + i);

> if msg_len is 8, nv_words is 2,
For msg_length = 8 bytes or nb_words = 2, execution flow will never here.

> Only first *(msg + 0) is calcucate, is it what your expected?  If yes,
> need comments said why *(msg + 1) needn't calcuate.

Since msg_len also includes the 4 bytes (or 1word) to store the checksum
value. Hence, *(msg + 1) needn't be calcuated
Will add that as a comment.

>> +
>> +	return chksum;
>> +}
>> +


>> +int ele_msg_rcv(struct se_if_priv *priv,
>> +		struct se_clbk_handle *se_clbk_hdl) {
>> +	int err = 0;
>> +
>> +	do {
>> +		err = wait_for_completion_interruptible(&se_clbk_hdl->done);
>> +		if (err == -ERESTARTSYS) {
>> +			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
>> +				priv->waiting_rsp_clbk_hdl.signal_rcvd =
true;
>> +				continue;

> Is possible dead loop here?
No. it will be the same condition with or without continue.
- With using ctrl + c, in case of no response from FW, it will continue to
wait indefinitely. There will be no impact of using ctrl + c on this.
- Without using ctrl + c, in case of no response from FW, it will continue
to wait indefinitely, 

So, this code leg was implemented to handle the scenario, where the FW is
always responsive and "ctrl + c", is pressed to stop an ongoing task.
It will gracefully exits after completing the full exchange.

>> +			}

------=_NextPart_000_01A5_01DBA3C4.93635640
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
KoZIhvcNAQkFMQ8XDTI1MDQwMjA2MTQyMVowIwYJKoZIhvcNAQkEMRYEFEWf2kt2Yjg8HtX4Op8D
+Pe5SrtBMIGTBgkqhkiG9w0BCQ8xgYUwgYIwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjAKBggq
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
AQAfS35pfCLCd+IoRhCiOA83wbyZ/M9zPA2LUoOjGJW0XbY4e7pnjalpA3qRcGiRCaMzcQNzhkpb
z3jica1uAgZlQ29qPnkYmIZAU6bWvz3T86hBQgw4kJ49t5Lbh4mhiy6PHLiY/uXs0b/AjDwc5frt
B0lTSXsCnAGJSwHmOk8FeeNjGOSxgaU8Rbqu7omCL9fr3UgPUGHJKsTsB83sywAhpC1q9JsJlJ8u
W6r6ZqkCMCxoGWYhptYfMx6lkLCh6L+/MwQ5mWy0ZUGH4pO+FMf/ENMcAbDzZCF3AoLdUEqf7NNk
bcEqY/ZmMk8L4DfMOq9Qxf51rXF+oI/XoAf+YgYAAAAAAAAA

------=_NextPart_000_01A5_01DBA3C4.93635640--
