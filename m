Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBAD13AD26;
	Mon, 30 Jun 2025 01:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751248749; cv=fail; b=Gr+EvPZ8FascApnR52dTkvCesi6jfhjIjwS4ag89EoXT/YbJ1ZAcOzVoly1R+Xxzkgmtx77hnseyNVARsCdBuLrbZKXEpberagYWpugb61Am6YK0C5dU0WZ6EO4rN256Tf5t4m2HxOFcnPeDXhRe05XWIoZ8RZ4WD1y1+dcQYSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751248749; c=relaxed/simple;
	bh=UUPz68zdDAkN9MMME7rybFJt/eMUzQqgLj0MvkSlovw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VXsZTJvMIoVNWmXhbg9iyrlPp7dVxcE8X7FC3oZluMxpPQT0w2QTnmYVE1/WoLNNGYpKssAVJUbgXwknu7ZsXH39B5MhVOF1A7bV64vjnTSFVH8K0TK06tEMd0WMq1HUWlwAUEBxC7t22/oR21nFgFFGz9tuSQTt2SnUmwgIEsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NAJrWg7N; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NAJrWg7N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxmfH3WooE+5VgP1VOckUnnQNSDHeJOf40IzsdTG6/2zXfc8s6Dp1pMczLC9wQDb7h/wZ2KtUdBPiDzN/fpxTSdzNzeKMUkBVKr3eHUw+lpLD2Cf1eQLjvu7trYTzf6ZkPc059jGHeo9ylk4Yd9h2XrxrT+7KVOt/BrPbGU6iLMcRVJvw2YLiFlB2SYDbW1wrVRSs3Ato3r+b8OGLXbd3QZOFhBQJ/fIoxjuL9FRFOVpU/31m5hhOO6lv6SXsORDMJJOcr1yIFQheb5Xx/Xxa7scIMc90FT6z5IM6HcUaEvesBFJZ/mdufKbEfukzgoNjAjM+E6RODkiWULzeiq5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWu0EIDG5sRFbMDxn7Mz3EFhKOFSm+wjK3fGnU3J1MY=;
 b=tCSb36y5tE98HN1eYowxUpxuYftnc+8MU8/l8M3JCiLqSmAm8eR0afXW6y2pSVlrhRRUUnrhup4FKEACMMOLpO+p68DVQiES7tICEcTzpTxLdv8ebJTNQisEQVarDsndb1LMWN8JEj7YeL6ROc5wrp6u9XKd1ydG4Wu5YMpwS5BMMlUbp8LKPDaSDU+gEQVgb9lC16HdcDhkvUNwTfdryABDkZLzLlb8UvHUTGE9ecA2k81tMgvrUidAh1QZowLwHUDmK7xbUJ1zFSQ+878Z2NBvdfaaYfuPXovf2IWHYxwhLjWG0vl5xjaAeOM+AlJr5iLzdbUw7yIuhUCXEgCx6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWu0EIDG5sRFbMDxn7Mz3EFhKOFSm+wjK3fGnU3J1MY=;
 b=NAJrWg7Ny9+Hy2NkdydlkFn6GdSGxSO0UxO5AEEMoKPNSP0d6+7Rd05TPpjov3JtRU1YCGxBqypetM/7C9/mywzVpeE+lqHCSZN8pN2/nT6PjA5+/9WJbWgztcvmEtYbhyWg7EzmhwCUGR8LaIRal6nKLMSxJkdE6AaFxTWfh/DIduqadjRhki2Kj5GkWBv/gHpVH0oV5Te8mqwkzs5PA6U/kNpf8VWg+DdKwrFawdtwd8uKrVItFiAViRZLV4JT3emWqCBPAmNCeyFutQyhFrSFS73lWSfBwjYMFA7xE9Lmz7H7JJ3ylN85/P+9peGzFGDvJuacmS//YhL1si8cWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10171.eurprd04.prod.outlook.com (2603:10a6:102:460::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Mon, 30 Jun
 2025 01:59:03 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 01:59:03 +0000
Date: Mon, 30 Jun 2025 11:09:40 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] firmware: arm_scmi: imx: Support getting syslog of
 MISC protocol
Message-ID: <20250630030940.GD13878@nxa18884-linux>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-5-2b99481fe825@nxp.com>
 <aF6gIOrY5ODBumkf@pluto>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6gIOrY5ODBumkf@pluto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10171:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c0e688-8f9e-438d-8489-08ddb779b009
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7jJsuNeDSG9vXQ46aewaZD2Qa8uKRvssp8mb5taVdZT4MwEQoDRjUhZhAiIC?=
 =?us-ascii?Q?UliA8fJ2mSkn+u7raKrQxy++WF8V0dGXaxLIqMyyV/rcf+vxw42VmacMsFgy?=
 =?us-ascii?Q?QNE9arCqdK0yjbMNEVTUCxyEBXfK3BFTFQpW5A2BJc4ZqpS0y7qqiXzEkMtU?=
 =?us-ascii?Q?5D09dUqLmMtMyYO3IyWbpUVOyXANd4EdsSGTVCVfOJ9k7SuYjrQ4xgE+xaOb?=
 =?us-ascii?Q?UP42gBxP/53zT1V5CLOpyoO78MsirSNuMxBa3cwg7HFHoF4ofmS/K4vyme60?=
 =?us-ascii?Q?025GQJ2ZYdDMz960ahZ4oJzK7WlbkOYIHW25/2rHUjVEP3xskdwVgtrhuIdN?=
 =?us-ascii?Q?rIGjllIe9DKuVGtdz7eVoEjSzoB/FpXmul2Zn1xf0+dmAmAthIdL+5Dtv+45?=
 =?us-ascii?Q?BS1OMM6h+nr7DOe9M+Amtq6MJZ1Zk6KWbJ5hdLSaw6nnalpjwOWLefB7XDWO?=
 =?us-ascii?Q?wlfVO2abFoWl2vnRpVLKEryzB+DMzxfkXqK5aiOUFBY/T9TpJ1g0kyl/Hoap?=
 =?us-ascii?Q?1a9BS2rfmr0j5wRf6hhq8gGJKwzds2CJ7O39kmfvYBPehJkS8KR2Dq2dP/Nq?=
 =?us-ascii?Q?WUJsQx6iBpJ9fCINhavaAnUhHxpIRTX2idhX8pVEjE5AilV1KnBoEFG2oqNM?=
 =?us-ascii?Q?8LG/XBWCafO3Wwe5BhUEYum4UammPdUUYaE+bDX/MfYJWTp70VZ7OCgW/jYk?=
 =?us-ascii?Q?ZjNcOXQD/cP9yP1vR7+HjrtsR4G/1q2flugyup5rM6KdiAjZIIVi9hc2GU0T?=
 =?us-ascii?Q?b1cG/iIa2NnJkMrPvcyBxOiFoLDkh2IhnA2df+RdRGHEj+fT3zTivlCvcyEO?=
 =?us-ascii?Q?uF1I80SiVVpuqNUSAUnO/oh/jupDaSqcagOlAbguCeJZLc2O2uLqAMcN7rdo?=
 =?us-ascii?Q?0NIGvaBw0/jBAGtEAIbqTRn9LIm29l/mlnYWvfLUjF8NXEGuBL+lxnZWPSGV?=
 =?us-ascii?Q?s5bfJ9mLJnSxrf/klLS4wpOSOxJ8AhVzkr//SK3FhnPzuVd2Uvl+PkkbjhzR?=
 =?us-ascii?Q?X98YwQgQlakFsnZsSZiGii8gA7oNXAH5WSnXeNi0Xa366rjIjGrw8OhizvGQ?=
 =?us-ascii?Q?coT7sA0c20DJs6WGJ2v9PDhWH+qhaMANA8GF7/7KmHadjdmCgVbvmrIBJNIE?=
 =?us-ascii?Q?6r3ziD9m0MDLUTv+pQrDo7QCj45uAcBVsAm1ywkyWO99ubbkKUujnK51VhFM?=
 =?us-ascii?Q?eTQVky5tTa4ut3y/6i+Lfk18Eq5cN+Gv0qAJ7kSznW3vCBGlYXUQ26z8VK4S?=
 =?us-ascii?Q?T5iHu1WjJVtwES0NWeLbCuimKVk0/glr9ytBOg6DinbbmA24bmKmnRmFoD4U?=
 =?us-ascii?Q?LOOUazLBLF7UMUhLDLQltOecF+drIunhVDdDdbKfMKLMfrQGirR/TR3MtO+/?=
 =?us-ascii?Q?0Bx3ySPD27xd0Ue14/9PcIVs25N9lgytmvSU/LADICvbScn8onZYBCItc4QX?=
 =?us-ascii?Q?khASuIqAQahUwogTOnPYi1ulxK7vVzPYFMllo5EQjuKxGcxxNcbttw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0MaofTgVomiEgWxNOkxyLTiXxjnlh8OOaWiy2rzCW07G7waL8JTXjsRF8H8f?=
 =?us-ascii?Q?S/fMBb4NBky7KImdoP7iVC1ljvWv1G/ysFEq7jf72syFoKn/iR029E8IPy2f?=
 =?us-ascii?Q?58EcOLKTJnD4cKTjMjAkU99dxr2hgYejsNxVv7yl9pcdXOAOXE2CEIw7AkJE?=
 =?us-ascii?Q?qZ06dO0aXQ1s0BS5wKHosJUP1R7P2/rOYl45n3xcOpFre4fkqkKmXOToX5bL?=
 =?us-ascii?Q?kaF+9MPVlyMb4b4+MxgWcoaPX/G44BmQxIIYyMOmoo4sm6AcuMBtmUKwV+qg?=
 =?us-ascii?Q?T3HUf2GnwM+0VRsxaw7RCjJMrYO9ZpL+Ksdv5TVrdGwreTWNODMHBF09HeKc?=
 =?us-ascii?Q?VoiSrz+5TjNBU49POR8MJcmNaPpVb0a3716OgPTl5FPBTkEpa6lKb8mySFQA?=
 =?us-ascii?Q?mw8KrpNnILdDuRSak7FPblMO1jA/FsPmSA+RH78Scc8aMC+mt+Yib3QBw9tV?=
 =?us-ascii?Q?N9ysB6My2NdwMd9eqtv8OBbq1rwP3iMH6ZNeqGOQ+T8wZoWMD1qAJU6vRjFk?=
 =?us-ascii?Q?G47Kc3ZrZ9U7gcFNQw8bM8b07tWQgnGJycwkvPF4R4hlCkDBGLT+1toyqvbo?=
 =?us-ascii?Q?4+V8cO6WKTYxWM30ty3WOqF1TeMpFvx3r4mbu1lkgFfIexrdZjCnKIYU/ZE9?=
 =?us-ascii?Q?3dP7Ge1JyNUZi/3w/VtY8FN3coG7OgC4Z600wnFEx2LGt4aatq/BpDK+Lwmo?=
 =?us-ascii?Q?aVNQXzAKDyVbTftgUnPZt3qMY7VG3GeQvg1ApWRoO+nteoRo7odH1TJZ6Dde?=
 =?us-ascii?Q?F06l24b34wAKs2/viDYub+XuCILN45tG1njfkvzH3ixGRd62Ivt2Z4wLCcUN?=
 =?us-ascii?Q?dgZHeauCD4xWxNP2eB9GtVAcMqfqxuyPTkfjpu6qupas78dOFZ59Ar8UrfOi?=
 =?us-ascii?Q?sCJYjTH883b7hbMJhE2Mu56EYAsxMXAAwpbfv2zuCTfH5Sk/AgKiHwLyLBOK?=
 =?us-ascii?Q?jdxlYWcHNRdCXE2vd20yzl+lb5nCPyUmcGMdLf1zOjlDYQX30ubcXVBZjRRt?=
 =?us-ascii?Q?z32u5ui49m+xXzXjuVnAf/8pFy/8XWuXy60aQEd1XgzH4ypAOhtKt7gYjNwW?=
 =?us-ascii?Q?AhUiYd4/2uSz3UHy6o/enRwH8PMNz6n8uk7NQRJmaWH2R/aGYIqtXaqRU+Zq?=
 =?us-ascii?Q?3F4wOB5DzkyZSSL7//s+2vQ2oz1jCNxrSSlqmRBgQFASHuT/P444VXJGcDsI?=
 =?us-ascii?Q?llvdnleb0uySKKsk2uBcCD7kNfYdmmS+RXtrHOLRUr53ZJ78mGdHJMmjl13r?=
 =?us-ascii?Q?2blzWQYKBimt9/MAyVlGh+MipaOvo6D0ZRmwFSL6CdMlhJTC0j+W4cgPRzKd?=
 =?us-ascii?Q?gz4v3mFqoWMlgQoQORA/ZqWQxO7nNvlumAJ23RpbqoSN5OTLPpnzMIlYu3n1?=
 =?us-ascii?Q?Fg3D9LB3hAT0SreKlV6iFSGJIBLfIIDeZW46UzaaHLXdDz8QBQl0gheySebe?=
 =?us-ascii?Q?PMKc+cn8GhxQw5oQE+Bacgn4V5cHh4pv1r6gShla7hpJF+aRqx9L1mz/Rm8D?=
 =?us-ascii?Q?4HnbEPPqPbYg5zU7Ben/bHDi7b9TVaARoQU21Cp9j7U4BR39vkLkSlzrE2kx?=
 =?us-ascii?Q?+Vrm6zSFtffgzo6JH+QgbG0JnGdjedabG5BpVO9y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c0e688-8f9e-438d-8489-08ddb779b009
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 01:59:03.0702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foYEo8qy7gXL6KZ5JPgPyv9NK2+LN7k2Fl5pLCgQuAaNIapnHK+L9nXXb6+qi0VJGwU0hQmZUgw4qdGiRyr/IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10171

Hi Cristian,

On Fri, Jun 27, 2025 at 02:44:00PM +0100, Cristian Marussi wrote:
>On Fri, Jun 27, 2025 at 02:03:48PM +0800, Peng Fan wrote:
>> MISC protocol supports getting system log regarding system sleep latency
>> ,wakeup interrupt and etc. Add the API for user to retrieve the
>> information from SM.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 78 ++++++++++++++++++++++
>>  include/linux/scmi_imx_protocol.h                  | 19 ++++++
>>  2 files changed, 97 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> index d5b24bc4d4ca6c19f4cddfaea6e9d9b32a4c92f7..1a6d75357b76ce6bb7d06461999b368c27f1fa43 100644
>> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> @@ -28,6 +28,7 @@ enum scmi_imx_misc_protocol_cmd {
>>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>>  	SCMI_IMX_MISC_SI_INFO = 0xB,
>>  	SCMI_IMX_MISC_CFG_INFO = 0xC,
>> +	SCMI_IMX_MISC_SYSLOG = 0xD,
>>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>>  };
>>  
>> @@ -87,6 +88,19 @@ struct scmi_imx_misc_si_info_out {
>>  	u8 siname[MISC_MAX_SINAME];
>>  };
>>  
>> +struct scmi_imx_misc_syslog_in {
>> +	__le32 flags;
>> +	__le32 index;
>> +};
>> +
>> +#define REMAINING(x)	le32_get_bits((x), GENMASK(31, 20))
>> +#define RETURNED(x)	le32_get_bits((x), GENMASK(11, 0))
>> +
>> +struct scmi_imx_misc_syslog_out {
>> +	__le32 numlogflags;
>> +	__le32 syslog[];
>> +};
>> +
>>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>>  					struct scmi_imx_misc_info *mi)
>>  {
>> @@ -368,6 +382,69 @@ static int scmi_imx_misc_silicon_info(const struct scmi_protocol_handle *ph,
>>  	return ret;
>>  }
>>  
>> +struct scmi_imx_misc_syslog_ipriv {
>> +	u32 *array;
>> +};
>> +
>> +static void iter_misc_syslog_prepare_message(void *message, u32 desc_index,
>> +					     const void *priv)
>> +{
>> +	struct scmi_imx_misc_syslog_in *msg = message;
>> +
>> +	msg->flags = cpu_to_le32(0);
>> +	msg->index = cpu_to_le32(desc_index);
>> +}
>> +
>> +static int iter_misc_syslog_update_state(struct scmi_iterator_state *st,
>> +					 const void *response, void *priv)
>> +{
>> +	const struct scmi_imx_misc_syslog_out *r = response;
>> +
>> +	st->num_returned = RETURNED(r->numlogflags);
>> +	st->num_remaining = REMAINING(r->numlogflags);
>> +
>> +	return 0;
>> +}
>> +
>> +static int
>> +iter_misc_syslog_process_response(const struct scmi_protocol_handle *ph,
>> +				  const void *response,
>> +				  struct scmi_iterator_state *st, void *priv)
>> +{
>> +	const struct scmi_imx_misc_syslog_out *r = response;
>> +	struct scmi_imx_misc_syslog_ipriv *p = priv;
>> +
>> +	p->array[st->desc_index + st->loop_idx] =
>> +		le32_to_cpu(r->syslog[st->loop_idx]);
>> +
>> +	return 0;
>> +}
>> +
>> +static int scmi_imx_misc_syslog(const struct scmi_protocol_handle *ph, u16 size,
>> +				void *array)
>> +{
>
>...so this size...
>
>> +	struct scmi_iterator_ops ops = {
>> +		.prepare_message = iter_misc_syslog_prepare_message,
>> +		.update_state = iter_misc_syslog_update_state,
>> +		.process_response = iter_misc_syslog_process_response,
>> +	};
>> +	struct scmi_imx_misc_syslog_ipriv ipriv = {
>> +		.array = array,
>> +	};
>> +	void *iter;
>> +
>> +	if (!array || !size)
>> +		return -EINVAL;
>> +
>
>...which cannot be zero and is passed down to the iterator as max_resources
>is meant to repreent also the length of tthe array passed here as an
>argument and filled-in by the iterators ?
>
>...and so basically array bounds-checking is enforced by the iterators
>core code, because no matter what, it is always enforced that
>
>	(returned + remaining <= max_resources (size)

Right. I think set size to 0 does not make sense, so add a '(!size)' check

>
>...I am fine with this, I am just trying to understand and see if I can
>find a mishap :D
>
>> +	iter = ph->hops->iter_response_init(ph, &ops, size, SCMI_IMX_MISC_SYSLOG,
>> +					    sizeof(struct scmi_imx_misc_syslog_in),
>> +					    &ipriv);
>> +	if (IS_ERR(iter))
>> +		return PTR_ERR(iter);
>> +
>> +	return ph->hops->iter_response_run(iter);
>> +}
>> +
>>  static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
>>  	.misc_cfg_info = scmi_imx_misc_cfg_info,
>>  	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
>> @@ -375,6 +452,7 @@ static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
>>  	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
>>  	.misc_discover_build_info = scmi_imx_discover_build_info,
>>  	.misc_silicon_info = scmi_imx_misc_silicon_info,
>> +	.misc_syslog = scmi_imx_misc_syslog,
>>  };
>>  
>>  static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
>> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
>> index 0e639dfb5d16e281e2ccf006a63694b316c431f4..ff34d974046aa982fa9f5d46fc673412e01a532d 100644
>> --- a/include/linux/scmi_imx_protocol.h
>> +++ b/include/linux/scmi_imx_protocol.h
>> @@ -71,6 +71,23 @@ struct scmi_imx_misc_system_info {
>>  	u8 siname[MISC_MAX_SINAME];
>>  };
>>  
>> +struct scmi_imx_misc_sys_sleep_rec {
>> +	u32 sleepentryusec;
>> +	u32 sleepexitusec;
>> +	u32 sleepcnt;
>> +	u32 wakesource;
>> +	u32 mixpwrstat;
>> +	u32 mempwrstat;
>> +	u32 pllpwrstat;
>> +	u32 syssleepmode;
>> +	u32 syssleepflags;
>> +};
>
>So where is this used ? later in the series ?
>> +
>> +struct scmi_imx_misc_syslog {
>> +	struct scmi_imx_misc_sys_sleep_rec syssleeprecord;

Included here, but used in last patch in the patchset.

>> +	uint32_t deverrlog;
>> +};
>> +
>>  struct scmi_imx_misc_proto_ops {
>>  	int (*misc_cfg_info)(const struct scmi_protocol_handle *ph,
>>  			     struct scmi_imx_misc_system_info *info);
>> @@ -84,6 +101,8 @@ struct scmi_imx_misc_proto_ops {
>>  					struct scmi_imx_misc_system_info *info);
>>  	int (*misc_silicon_info)(const struct scmi_protocol_handle *ph,
>>  				 struct scmi_imx_misc_system_info *info);
>> +	int (*misc_syslog)(const struct scmi_protocol_handle *ph, u16 size,
>> +			  void *array);
>>  };
>> 

Thanks,
Peng

>
>Thanks,
>Cristian
