Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6829115E97
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200184; cv=fail; b=ZjU3AC5p8fcOMT6YepRo7fylCxfoS5bxRgysj7FG7L4mkxSoN3Rb+sKhLQPbIXnazXvba6Vck1O4G6oRt0T41dlOOJfaqfSPfNjkKTdo8xi+M9qTlgrep5Do91+xLdVOvoHAWv42mBWVfz4lA48Rp4zmjAhzbfqLYzWWMY3Cvnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200184; c=relaxed/simple;
	bh=XPy9wjGZ3Vjdmgp3SrQrauhQ6VMMjjFnKyEkVP6go8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qnYMLHbP6lQ0P/T0oH103XjIIhLCZMmRnJy/FGBjAuILjjY0Ohxucs1qtQJkxvlWVyTIdhD0cOsqEEAM9OjzYv+TG73BGdJDbSSD4IvGS84h3gsn3tGIIyFN66DO1qafG7sbJo0qajzcFSTdoYHXEfFNeYwu/sdYq3jAW6neW+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PMx5sKtS; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PMx5sKtS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEJ/2V3Ww2VJ53zTF4ACxtx8pPW5kF49hqtVQRfkZlZviF721In2RsX5l2wo+HDtSZdWRs9v3T/+hym50I7zlNN2vcPXm67+29Zf8xJNdplytxgvsPtlcTGObS5An8idMlBVzyT1Ft4ZP2v7JSK/whfuKXZsPfOPBDBhvfm4SfFXJVpknq9OHMLO2BwY029W3oBhQSIehw0fne/U8h66nfJE9RO4AfYuYDd7NfuRb/0XLNQjUrEDoyUyvPgeyoP3X4Tx4xkrwM//iCZt/gLRhFWcXjqazai/YCDcZ3HpEtpOqO/A7uKrBixnZoXhfloKUoiw4XOcbwhxqApNHTdCyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvWz2sBwiMYVDOeeVPFNXH+AtoQ3a1obuRoGTJRUtqk=;
 b=WW+X1s/De4eMZTR/LcL8acsx7AJCfRZBXJ6mg76/Fv+ARY5M1y7tZLPleI4j1ZqEswRfHe5l2Gd2C4FfQYeOyuti6QTjHlzuHr3VI6Bhk9b4XZ12El3QrQ2zSSJfnGsLsCzLjCQO5dsaIGS9PiCqEI1khLMZokBy9/EhXtRdu6u8AkA9t1g6dVwV7AE64JkP2j3bM12oGRH+7CZxpMSPE4VEAzPHZRZfiBm8M0BMwiq+0DwtjnT6u1KBTUp4n9uIG4K+bui190aWhLVfMTGWsSMQXjrpC3NhPf0iyJaupxw5jvPNNywmc3QaOvn5n3QLqR7OE4ENWtDIeRt86LrZLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvWz2sBwiMYVDOeeVPFNXH+AtoQ3a1obuRoGTJRUtqk=;
 b=PMx5sKtSNpPlKGK0w2xJUzavTvynmqdl48DX9MH/VWGinSLcs/4zJnfJvp+WZM9tfiqic7+/QGP03bGDtfe6JCM5EFeZw30M5cNl6kboq7JwBg6dEy75ROq9yKWMXM2OaXX0powWRpVSfTuySP9R+n7jth4pIk8JeMatNse9Rs4WjYYtu6hyEgub3nr3JlkX8kyEjZsg6ayOtmyqFyB2bF5WhJJIgEMlSoG8nXxhHFoZUjXWSY3+imelWO+5M0gtfS7uMPGkuGIYNGlpZHMlSMPIdRPG3tcv6viZ8iFdXSocTsVKlZxME6fdPzLMtha6kw4uwTNqRL8XsfAPl7hoEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA4PR04MB7871.eurprd04.prod.outlook.com (2603:10a6:102:c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 12:01:42 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%4]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 12:01:41 +0000
Date: Wed, 9 Apr 2025 15:01:38 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Breno Leitao <leitao@debian.org>
Cc: kernel test robot <lkp@intel.com>, sean.anderson@seco.com,
	bigeasy@linutronix.de, horia.geanta@nxp.com,
	madalin.bucur@oss.nxp.com, hristophe.leroy@csgroup.eu,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: Re: include/soc/fsl/qman.h:383:4: warning: field context_a within
 'struct qm_fqd' is less aligned than 'union (unnamed union at
 include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being
 packed, which can lead to unaligned accesses
Message-ID: <20250409120138.f5oingawrurwq7ep@skbuf>
References: <202504091657.OgPuMa8C-lkp@intel.com>
 <Z/ZXbElRLBsJcc1X@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/ZXbElRLBsJcc1X@gmail.com>
X-ClientProxiedBy: VI1PR03CA0063.eurprd03.prod.outlook.com
 (2603:10a6:803:50::34) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA4PR04MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb45cd7-ba5c-4ce1-9229-08dd775e4a6e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?veZMJJHlZsRbso4gUuUl8eJvz27uHzufx332CAOVX4Ue16Pd4+vaLG2s9udb?=
 =?us-ascii?Q?Fxosig83RSy+E9LN063Dy/WfuehjLIiI/qm5FzuMxAeKwk0h3m+e2yBYNNDa?=
 =?us-ascii?Q?9IuNUREYTxo7gLujarLYa08Gas9F6RWkjiuV2/Wkx6OhM4pTBzeKdLmktzsU?=
 =?us-ascii?Q?61OC+BAvuW834xVL3WyyzShkln+fULs2v+OzIFLt325dIgU1w5u8fXqBpCc+?=
 =?us-ascii?Q?rkfxaxzYj82MWiw8As2i0LI3gsmptDLnqf349lkHwrnuF/k8DB7xx/YBK2gx?=
 =?us-ascii?Q?R+S5mBOezX3nwZ5GpAE5wm3z5DaZgAj3Km+0ZSP9Edx1AlxlcHzZOmzJc/6a?=
 =?us-ascii?Q?OKOI4KezWMaYbooWMeXhlbaF86sBDPQPrILghvCeVUl2h+sP6kqE+K7i1CBQ?=
 =?us-ascii?Q?ffNv6ppDF0CXyGLty0z4+W2kfrfCZIYrcu51ykjoEU3sPwRHrZw0m/fZur3d?=
 =?us-ascii?Q?rGuDRBKVQTw9XYAQsPiLFyP0mo7nhRlYGDeoHPDbXVnqCgC9H7Ln6d5tS/vS?=
 =?us-ascii?Q?tjG19xqiuW2XEgNJqEN1WEGDffy96qUtBHuoKoXmVp88OJ4wWdzdzLn60teR?=
 =?us-ascii?Q?sYqF46TGTmA/4qgytT1SO+gxdtRypzk/kOhsMRBT2xMsW98L6/cKqT+mGnLn?=
 =?us-ascii?Q?38KhK5d7xR5/0vHVXrevm2bRG0pA+8ecq/kRwr0jf8hQm+HlM1/pcneRmRsc?=
 =?us-ascii?Q?IpjvLOYK6D40srJ7tdHYuywgm6M7r1Vm5br2079VXqLWqYmqQ6fLJGJfQqLT?=
 =?us-ascii?Q?iYkYQIPfzNlrYKLCJjZ6smfmqjjIeS1KBAtLGot8Ht8+zWS9JMu6xNxuLuO2?=
 =?us-ascii?Q?DPAcPmTSTuYEuW/C1jHy6WLbweLC8//KyzWlO4r7ZHJPtOo5qBbw/P8Uvp2H?=
 =?us-ascii?Q?BC6/U/0DGBn1dacSZpukPjQPlPBzppqSVLmykEZka10qQ+pLeSdSSlZEtw8N?=
 =?us-ascii?Q?XrDA+KjlSJIy5UKYYC65Z31496lVmHSxHAZgwxByCTvhv43sbYDh+Zg2wfOM?=
 =?us-ascii?Q?WPaQCQRcMnObK4tbouFdRBWX5oGY8vog60eTcosipBg82qsNbbDrXV9WyeDO?=
 =?us-ascii?Q?DZ6exNez1eUf5ClcoiLBoZgAVxo0cSwTpXm3JjRpZjJFNyt2LZv6mu8EE8vk?=
 =?us-ascii?Q?5oaPaiyqf9krtaV5J4t8eZ19+SoOSECC4ahIPNauFYPSt5S0TI5vbZyqhnbE?=
 =?us-ascii?Q?JHLd3AU8MEsB6YKNb7ICqeL1VS2ArFhxXOARN7XNnoth27alW+9bsZc6lur4?=
 =?us-ascii?Q?HJbenEjfM8rDrqpKrO3iaOWC/ZgGCkcYSksNQFL5FCqIjVBHca5eic/72qqB?=
 =?us-ascii?Q?F3ix0DUECjevozmbdsR/c69B674y/1fK/qgpx+YdgJOL/3Qv8RvnwEkSWWcL?=
 =?us-ascii?Q?Ox5QFaa8OGsCdGBGgBeOb8+aBzyPg9RoENOLTFp7RtcvAH1UNHZ/pLGIV5BL?=
 =?us-ascii?Q?zP5OYrRenms=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?cH+5RcIwq9WkyrgqmKf6ItSf9tSE119qz1lIvaAwWUjpCsNcxHdy4VBqVH7A?=
 =?us-ascii?Q?vGEMso1As892Qr8sh1QexbwqSwURQWA11QRJu7p+27zoL2mHwehGeVvlpMa9?=
 =?us-ascii?Q?ipARGO1W/n1lqLIFNDj0cyPATXsN5KsiGV0AXAEyscbBWpF2hCZ9gShS3ia6?=
 =?us-ascii?Q?mNFyKhtQyQVkP2cpVrlRRWbJEb0ql592YkdcVYdJk422XK0PrRxMfAOpHwpY?=
 =?us-ascii?Q?MrTCpi+q78UuOd+CAptoktobqwrssFrOZnEQehLhWskwYiNZvP6S4fuJX06E?=
 =?us-ascii?Q?zCNiKBkLAfSTQEO7vGr0Pqp9x7k++LiWiS6k2MvgyG14Z6wD+Qp8Z7bslGgM?=
 =?us-ascii?Q?FFg3WyiDUS51zM/RTdy2/6yLUst/bbutn6JXKTHdse89rWuY4ynrOo69nGi5?=
 =?us-ascii?Q?PUR6O9Swds01KS9ReEiMi2V8g7j3SU2mJHrUbfIbwSP02IPQ2eVgZnQZO/P/?=
 =?us-ascii?Q?EiPxQNV5pylxzJBygbxQS7JWrTXbmQZ3AW61nznTBwnq1wxX4nYwosXL3lup?=
 =?us-ascii?Q?rFES7qJ8oorBB0sj+7u7MdGvtE+1NmXAEUeZ40hk+d6ssZuIbVQNPA+pcvi3?=
 =?us-ascii?Q?isPdUICBPWVdjLHIOHLyc7UOcHSQJi/MbCISbeBFYoPN0ue9L17McAwu1t5f?=
 =?us-ascii?Q?G1DS6D4/Dyw9JsdGq2K0eKzsk6qaP9rZBkAsHRbya6g9CfuAer8ZQOtMwQRZ?=
 =?us-ascii?Q?rXGbGb2lgkTJ10WGqV14fsNmLMJ9yteF5MbUKmBthahKOMCeMqRZ/gLQ35J1?=
 =?us-ascii?Q?YqOXx2ZKkBRS2n3MGWZkFTujOmSnOQ2uH131c6hhkVQMRPqX1jrPMuJwl9NP?=
 =?us-ascii?Q?t/zDxIpp26TnajOJBm78sJdStw0TR/OWdHGa76ssJ+Fu86J2GrEqHuB8injy?=
 =?us-ascii?Q?YiGYIY09N+GEE5ICg5m69Wi+wNxfzoeYOMcABHn07SwnGmPN1h2Uo6QfzHpJ?=
 =?us-ascii?Q?V94zZ8esZ8qc6P/N7dMLyrTmC8fRCWaaJ7X6xNq6CcU8DXb9GZhwtEt5eSZb?=
 =?us-ascii?Q?8F4pSEAeEIPDDvyoJpPB1vPE/NYL3Ud9/7IQIoqmhkhMsN9NmWqbk1YlEqPv?=
 =?us-ascii?Q?AFIwLxhkzsTNYojbpXH4VrVJ2oImC95WVXATtkRk3TOQuXtYRmIemesx2Zvn?=
 =?us-ascii?Q?SrVv3TC+4QBvRZH/pSthu06b2ZKH2qfygikoo6ommL6nbgvdYoD8T+bbkuzJ?=
 =?us-ascii?Q?Ioe9qbTjJsNBlTUbnADANQzJXZ3L/y4C/R3I5Rp/mAOFekbqeS5URvHR2A81?=
 =?us-ascii?Q?czYhTZWfbV3PVLO/EW+vB0fHr4Rzvm/FmTYJT3YhObXczPvi6zYn/QI4KHy3?=
 =?us-ascii?Q?f5sm0RBltLLAL5BjPnwXOooZTFJUzrwK2KzqsPlzRaJ7cVQdtPjrV8gN2Vgp?=
 =?us-ascii?Q?hV+RDc5Os+uK3olNhF6o8rDW96ZdmJP9m0xD7a1ZIRTlx464TBVs0YOSa40s?=
 =?us-ascii?Q?phHuTFPYcmWXO5E5FAiu/y0ZnvjD1N/xUdtjyOiC3ueZ5b5X7r3j7Y+1aOBg?=
 =?us-ascii?Q?rjJVYTHy8zqIeLQmWtg85SgLIDpHd2yWXAbS00lmsxDn2oCxSwpXebg2XhPL?=
 =?us-ascii?Q?Dcu+uLMwVjoEA5Y3l5vR8X44oAmShsK+nPLvy43tv7FGUSyTcU1vOMVS+80T?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb45cd7-ba5c-4ce1-9229-08dd775e4a6e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 12:01:41.8607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVt5Hiw1mKZzjEm8NFOIar2gO1AQwrNNxlCTRY+ddXWF4nmfU50SOkIQ280ZdVjUHIoor7eNVlMmA1PqBIxWwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7871

Hi Breno,

On Wed, Apr 09, 2025 at 04:18:04AM -0700, Breno Leitao wrote:
> On Wed, Apr 09, 2025 at 04:55:16PM +0800, kernel test robot wrote:
> > >> include/soc/fsl/qman.h:383:4: warning: field context_a within 'struct qm_fqd' is less aligned than 'union (unnamed union at include/soc/fsl/qman.h:365:2)' and is usually due to 'struct qm_fqd' being packed, which can lead to unaligned accesses [-Wunaligned-access]
> >            } context_a;
> 
> <snip>
> 
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  346  
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  347  struct qm_fqd {
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  348  	/* _res[6-7], orprws[3-5], oa[2], olws[0-1] */
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  349  	u8 orpc;
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  350  	u8 cgid;
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  351  	__be16 fq_ctrl;	/* See QM_FQCTRL_<...> */
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  352  	__be16 dest_wq;	/* channel[3-15], wq[0-2] */
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  353  	__be16 ics_cred; /* 15-bit */
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  354  	/*
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  355  	 * For "Initialize Frame Queue" commands, the write-enable mask
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  356  	 * determines whether 'td' or 'oac_init' is observed. For query
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  357  	 * commands, this field is always 'td', and 'oac_query' (below) reflects
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  358  	 * the Overhead ACcounting values.
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  359  	 */
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  360  	union {
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  361  		__be16 td; /* "Taildrop": _res[13-15], mant[5-12], exp[0-4] */
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  362  		struct qm_fqd_oac oac_init;
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  363  	};
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  364  	__be32 context_b;
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  365  	union {
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  366  		/* Treat it as 64-bit opaque */
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  367  		__be64 opaque;
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  368  		struct {
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  369  			__be32 hi;
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  370  			__be32 lo;
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  371  		};
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  372  		/* Treat it as s/w portal stashing config */
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  373  		/* see "FQD Context_A field used for [...]" */
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  374  		struct {
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  375  			struct qm_fqd_stashing stashing;
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  376  			/*
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  377  			 * 48-bit address of FQ context to
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  378  			 * stash, must be cacheline-aligned
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  379  			 */
> 
> Looking at pahole, I am not sure this is caacheline-aligned, as
> suggested above.
> 
> 	# pahole -C qm_fqd
> 	struct qm_fqd {
> 		u8                         orpc;                 /*     0     1 */
> 		u8                         cgid;                 /*     1     1 */
> 		__be16                     fq_ctrl;              /*     2     2 */
> 		__be16                     dest_wq;              /*     4     2 */
> 		__be16                     ics_cred;             /*     6     2 */
> 		union {
> 			__be16             td;                   /*     8     2 */
> 			struct qm_fqd_oac  oac_init;             /*     8     2 */
> 		};                                               /*     8     2 */
> 		__be32                     context_b;            /*    10     4 */
> 		union {
> 			__be64             opaque;               /*    14     8 */
> 			struct {
> 				__be32     hi;                   /*    14     4 */
> 				__be32     lo;                   /*    18     4 */
> 			};                                       /*    14     8 */
> 			struct {
> 				struct qm_fqd_stashing stashing; /*    14     2 */
> 				__be16     context_hi;           /*    16     2 */
> 				__be32     context_lo;           /*    18     4 */
> 			};                                       /*    14     8 */
> 		} context_a;                                     /*    14     8 */
> 		struct qm_fqd_oac          oac_query;            /*    22     2 */
> 
> 		/* size: 24, cachelines: 1, members: 9 */
> 		/* last cacheline: 24 bytes */
> 	} __attribute__((__packed__));
> 
> 
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  380  			__be16 context_hi;
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  381  			__be32 context_lo;
> > c535e923bb97a4 Claudiu Manoil 2016-09-22  382  		} __packed;
> 
> I am wondering if we should use __attribute__((aligned(8))) instead of
> __packed, according to the document above.

Since you've replied, could you please help me also understand the issue?
It says "field context_a within 'struct qm_fqd' is less aligned than
'union (unnamed union at include/soc/fsl/qman.h:365:2)'", but at line 365,
the unnamed union _is_ field context_a, no? What is it saying?

I _suspect_, but I'm not sure, that it's complaining about context_a.opaque
being a 64-bit field which is not aligned to a 64-bit boundary. Though
I'm not getting that from reading the description.

But struct qm_fqd is embedded in other structures, and the alignment of
the fields changes in that case. I think that context_a.opaque is 64-bit
aligned in all cases.
