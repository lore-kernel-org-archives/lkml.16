Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013047.outbound.protection.outlook.com [40.107.162.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFDE12CDAE;
	Mon, 30 Jun 2025 01:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751247603; cv=fail; b=imSpCPVc8l6N9uUc3aDSyNdTx3C4rgY/w3DlkbgyMP1sdqyPWMpeZXM24ug1/exa9Fa7vv9uzcQdLKRnQM82DZpuw0W+8V6jCtPABUU8KCv7XC9KPBa0evRI4KtHZ07RlKK+ugq2mcdEqg+kTZwYiLM2kvgGdS2Jzbox8o7CvMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751247603; c=relaxed/simple;
	bh=HfwqPnviep7KRU1++8QWJ2kXOtRx5COeJSucsqXQlt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CcIi4cpR5wnXMogjKII1qqZ0GuxQV5Wv3r4SY8BKmJ8FtHYbVglWJMj4P3tkhiGI/gyaGQnfsysAgSM+jy2+yT81yswUkXne0aTZrG4Jsob9ZYOziW9e14RXaFMzWhTzpg9W2IdtRypwSHBUGWR8T3LDVde7PbKeg1P1du0dTUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TCtmB726; arc=fail smtp.client-ip=40.107.162.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TCtmB726"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZ19JYnbcnqP7cAWein23SVAaQVAIRNd/vM8O3mLsOkY0CplURcVJ+yuxgkCzgKEDQ7dPbh9lKKTKc6Ku0IU3boSDrE+8iJXr0kLIhMKj+97kn/OTWIOxiocyq6rMrZpO9xAGI3wgsSV5HWkupUx4QB4R1cUJouD6mTbqqkmE0xtRFXpzCq8zHCHM5KLUF4idEn3681BhcpsgKoMopPuDUqlMZ34fQqzj14jlYop/4jHrAMP0fDpuxtIAvZ4qRAi09beQ/FdV4Fdp6/eFdh9EMPkZlznZOuGFccBVWXFlS99m0aorRClKr0DSSDqYCGf3cvfZztxiFtYfG3vcU/+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeewiGowsVz1/ViAX5hrrkliBPWbNMkheLphvrHy2VE=;
 b=awfgCdXgZdkIa+CwbK/qyZOeGw44KwfsCEAeEjvo8/3/24lIj+j83BwtIppbXLWjKiE/Sw7V4iUzeobqILmvXU8d7Fdpdu9+m8rnvysKj+piLKGV1cU0giYsIhs8J41u+Xg6Ebq7gfJlNEcTPLrz1fK1kmISvSXWOrCeiY2XK2tOXj6j/g/IKP6ICku62c9/TRUCImna3PdkSjGszFABV7PQA6Cx2RqKeNkU8yk9SmEBlB5q3ETusNpHIZQNedoY0CmHgWu5ZSPdOsx3jWNr7lIRTIhQvj4TEyoFKqEjTtWKdcIRbNoHAeub3t7XcsXDdii5TepYZNKepPJ2ciFPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeewiGowsVz1/ViAX5hrrkliBPWbNMkheLphvrHy2VE=;
 b=TCtmB726PTQ1hvY04nhI+SOAe3NHfWSW8Gpl/ITI4wC1VkWZsUoJRIgSbWsIC9acatLHrHjR0bKs3ft2F2ZiITuRjph3pRabEUrQpnK5TNFtSEesbWIBY+jS+TkaNYJgqlW3ZQ64iHxLT+xrpSsB24lK4dkF+6H1nCynSIvgMa/Xl+qS2v0hcMX54TIksUj8gMkE5l5zg4e172HQ8sefYWXDjQwBZLis/DuyLRh8x+87H6Cb1vRDHBsxbgCR1h5G9xKScEhwktCcSah+S0c0+0z3efsR6bh33QmZ0/4ZqZuw38yDrQfzSr6NCIdFH1ePZd0H54vy/FflTq3TQKziTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB7715.eurprd04.prod.outlook.com (2603:10a6:20b:285::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 01:39:58 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 01:39:58 +0000
Date: Mon, 30 Jun 2025 10:50:35 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] firmware: arm_scmi: imx: Support getting board info
 of MISC protocol
Message-ID: <20250630025035.GC13878@nxa18884-linux>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-6-2b99481fe825@nxp.com>
 <aF6gi9ejloRphvgI@pluto>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6gi9ejloRphvgI@pluto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB7715:EE_
X-MS-Office365-Filtering-Correlation-Id: b6a12c27-b530-4ac9-4fd8-08ddb7770581
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dZGWd/VQ71n8CSsoeEgZgeseAwi83XdItViqaaLeqYr/KK0IEOw4NwRgD1zf?=
 =?us-ascii?Q?XGZ6CP5f8eE15RHkaN+3eqp2sL1xM0ajbsB9n93OwLi9kAksI/5oh9KXCUWm?=
 =?us-ascii?Q?ESb52n9BKPrJFxH4H4mZ2zusf1RQN7weP0CRmHSr6kntLYmF7TxtQvgQi6/K?=
 =?us-ascii?Q?7jmSCbeqN9+EXqOJKzMPuph5fFuWVDl4LkSv/OQ40mc/B/f9NlaGAR28IrYp?=
 =?us-ascii?Q?WgFgEhC97I9arp8er5XKSsSHBdXveYguAaAdqWPSwemvGfLybfMEqPbJZvsh?=
 =?us-ascii?Q?dm1sz40d5PQnU2srHKpYhGES3t/CAjuWgK74wUjlk6fljJR35rT05U+dGa7C?=
 =?us-ascii?Q?urXDfziz1GqprmzlsYugLkalCflUVteYpoTLoTU8B+O413h3BGPxliOA/AOU?=
 =?us-ascii?Q?28jtbIBEm9bn/u7gaM/EKCRC3ZpYB5iR1NO//8OiZ6kVmVRziwRPirymA4IW?=
 =?us-ascii?Q?BSGm5/8I/56BFygnsBPymfCUOFXpPnAskKc7SNt2aGiyubJPHq+dpBrKRDRu?=
 =?us-ascii?Q?dTZAybLyYGU1TLOwHEzQkPzXXaUA+4WrAPwVhfTPo/AF4Akpxb3S4Fl6YUU/?=
 =?us-ascii?Q?Y27PAK+8MPD19CCG7fgK9YecQSGwSyuh1/gQR852+y63QbxVoJpotC2r1SGG?=
 =?us-ascii?Q?ThcGIipvbLGXtSGvqs9GOZmmZ9NuyoINcHKUZySWiI/ltNdk8AEhDHtDJbM7?=
 =?us-ascii?Q?EX2b+SRS42I5TRQWPvbkXA+0+ybFWk6LMX/tkLilgmTmq6ashLW2sSC9uaVc?=
 =?us-ascii?Q?lZ8LJFME+pEztTu1f5ejCQhMka/3d5PHZdF6cHjHhdVpNh+lphkCXnfIKA1n?=
 =?us-ascii?Q?l3aHif9mBOPlZbyPpYrJVxfp1J9WgiclTvNTRCy0Yh7qhSq1gr2vM+yJuf5S?=
 =?us-ascii?Q?N4ISCENZN3uguWfdYq5q1Dx5nBeIiS3/oDEC8owZLLsTtjbhs8zzPY624+0J?=
 =?us-ascii?Q?xZ4KWlcHZZw1s8pIJGjvsj6grsb6sBDmEudB1+zo4eMffP+NNztG8uPGOtbo?=
 =?us-ascii?Q?huWC2mXQn5m+JzS5rAj619BB5MsWpOWv6xU6ixjMMlcQ9gMlW5Vmj3f1e0W0?=
 =?us-ascii?Q?WopZa0HONl78JDmIpW5bhss2sG1hHIBVHsCpsmXEM3SqmRwjGrgiIf5Ca+f5?=
 =?us-ascii?Q?rv+rWUWz619qz0jvZ2Wp74RlY0grM/hMwK9PUyBfh8QsjBsOy3KskDaxH0zf?=
 =?us-ascii?Q?IIi9KR1NneVEymgXL05CX8ZUYlPKI+v2iUCRmOwrqm/cyqz0/fdxcXAYRX/5?=
 =?us-ascii?Q?d1QPhRvhKtZDM64TtqybWUWTj1Mh3f6YgN5xBUw5ZnwP2567ydPArxCTY/AN?=
 =?us-ascii?Q?9QnIe6u3l22fnblK1rXBsdEtEAn7Xl/FwCzvR8sr0gA9lEVD8jRayp8cxQI+?=
 =?us-ascii?Q?JQ1FzPxjV83APzcItPQlr/yVaYo555Edi14nf916EQfgP88QTiuydAyBmnP6?=
 =?us-ascii?Q?QKnRF+j3v28QQ4n35XPRITPpM4ZVoEjPnGmtYLIbTtD4wX4lUFbMbA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zQJ8CW9ck4bkWcaoMABFiLUDE/DG1uYj677g+sTjgWm4pW6d0KrEgSsEmOXS?=
 =?us-ascii?Q?h09JPPlie2zEHxXnsbvb6TUycXzFuhoaQu2xQIA75JuVtDslqo/HnEtusthT?=
 =?us-ascii?Q?gBW8t5K1O8X231cpNW3tZ8mNDOT0UfGiseoMsylzGl3QE4RS/SEXjWxlGv7T?=
 =?us-ascii?Q?WHtydTcws8LpXasAAI5OVcUy02DnP4e/8hyuwdr28QWt8k4fss4ysADRR05X?=
 =?us-ascii?Q?k0f9BztN9whEBUbsNEHbk6IfU+EfXh8df6/3vU2BeGPCJjz+JmeD5lZPhuNZ?=
 =?us-ascii?Q?aaB5pmB2fRcGPn9mIaa1tdx7taEj7Fj/t8fBGjJYhjvaoEc81AfpV8cC78kP?=
 =?us-ascii?Q?SnubJxGWKcTQWTk6gMlaCdkz12MC3NmD8iKXhh/gxk3m+lQy9P5TDzNnXwYq?=
 =?us-ascii?Q?RSHKuiOY05xvtcJdsR1vM0h5Y6eWDiMhgbgBGVijpPl/4R18Pg7x1LWmhgf3?=
 =?us-ascii?Q?NNm0bASdA/QbHXCIF0M4mNOVjlqTGwX8UluxO94u6SkcsiqLT6LLboE5uHru?=
 =?us-ascii?Q?7t1GyBLYP3Fn4nGsH++ZLm6rRarPfbPMdQOnP9w/SbF4KVGOHbrmrc1Wnvb/?=
 =?us-ascii?Q?8iv07DWNrb9d+uRl79hKTyL9V4HizUVLrWECBYBaoMKiQbuJdl5snrHTiU5l?=
 =?us-ascii?Q?HCNe7ccmfstLc6f+LrxusVFBTmRYz/dcnH5Cnue1WXncJsyEDUJQmAMMEPa+?=
 =?us-ascii?Q?4F4xt/jnQIYh7Qg/5u5HJt0O9vDGJc1MwzYmMCUJyLWgfYIVJ9vJnkABmbrJ?=
 =?us-ascii?Q?f2cWQ0hRjrGVWA8WiZck7nZAG59L4AFWHVIezSzyCIvE3ill17o0R8DsBL+p?=
 =?us-ascii?Q?aBAjI7tr5SIZpPShxOSzoBAMTQcO4kQEieUJRXD7gVvBbd+nO0RebzyMkBtQ?=
 =?us-ascii?Q?9sRGa3tbOqLQ1IQGQy8XfN+NHT1uCB5vDeSdiXIOQ1KWtvFc7LiZcaOwpdpU?=
 =?us-ascii?Q?9TQerOYyJd+6/zbTcL+5PkeONOKfORSkn9qwQGnCY0O4NKjNcheOwsNJKQ6H?=
 =?us-ascii?Q?xmSdJ8EvTpAK4PBqVvaJB2T3WYLKuHX8sX3W0lCiedGtR9HfMGKnHaU3Cjvu?=
 =?us-ascii?Q?B8ggBIj9BcKCJzxoqADGehMfBM4pxKqK5IXRuHAmZXgEsgKwfcQ5hufTbPA7?=
 =?us-ascii?Q?0YvsuaamemCJKjOgEAapINjRhXU3ibCEkFijzce5uWPZwgguFO8nzkPrLReO?=
 =?us-ascii?Q?QrXCpaoU25XuZONdZT4LKYycn/Z96PHTAqgtQ1/+hTJNEJlCPwerapncYmgc?=
 =?us-ascii?Q?B/3LWpz7sE5Yud/wX41C8XrglJHhSBq6DW0tJ50ZnrTDI1qOX2OH4BRtH9dQ?=
 =?us-ascii?Q?l/99ilNFSwsBewDDXa2oqGHIaSrQz0GSlatr+s8jqVWJAZeAYaI2Vh2qWzLa?=
 =?us-ascii?Q?ae33taHikVa5gt2moIZZHZd/OGbJNC4ydzxorSi6riHoFBinoYmkCAMXQlNI?=
 =?us-ascii?Q?LpIHNLL8nX0Cdl8hXI5MLsEiZx3JnazWA2CVJ5jBd+Q0Wf67AIdPVnQXjeYP?=
 =?us-ascii?Q?dtWbBHILA9wN4uAfNWsU7GyAXgEeBQgp6r0VpY1550j/cxz4DKURFQrFQYE5?=
 =?us-ascii?Q?y14AUO1fGULTtealZxSNea3EAHPSG3z5mvcoXenX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a12c27-b530-4ac9-4fd8-08ddb7770581
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 01:39:57.9154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOQtUmLHQEp+ccPcePYAamnD40MeeN38TCTDTThm8ygFrtLz+cfa9p2FsaA0qD2hECP4kOPDLH2G0zIgZtuh0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7715

On Fri, Jun 27, 2025 at 02:45:47PM +0100, Cristian Marussi wrote:
>On Fri, Jun 27, 2025 at 02:03:49PM +0800, Peng Fan wrote:
>> MISC protocol supports getting board information. Add the API for user
>> to retrieve the information from SM
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 30 ++++++++++++++++++++++
>>  include/linux/scmi_imx_protocol.h                  |  5 ++++
>>  2 files changed, 35 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> index 1a6d75357b76ce6bb7d06461999b368c27f1fa43..35c63e7cb189475807ed1e6723dbcb61ab66800a 100644
>> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> @@ -29,6 +29,7 @@ enum scmi_imx_misc_protocol_cmd {
>>  	SCMI_IMX_MISC_SI_INFO = 0xB,
>>  	SCMI_IMX_MISC_CFG_INFO = 0xC,
>>  	SCMI_IMX_MISC_SYSLOG = 0xD,
>> +	SCMI_IMX_MISC_BOARD_INFO = 0xE,
>>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>>  };
>>  
>> @@ -76,6 +77,11 @@ struct scmi_imx_misc_buildinfo_out {
>>  	u8 buildtime[MISC_MAX_BUILDTIME];
>>  };
>>  
>> +struct scmi_imx_misc_board_info_out {
>> +	__le32 attributes;
>> +	u8 brdname[MISC_MAX_BRDNAME];
>> +};
>> +
>>  struct scmi_imx_misc_cfg_info_out {
>>  	__le32 msel;
>>  	u8 cfgname[MISC_MAX_CFGNAME];
>> @@ -334,6 +340,29 @@ static int scmi_imx_discover_build_info(const struct scmi_protocol_handle *ph,
>>  	return ret;
>>  }
>>  
>> +static int scmi_imx_misc_board_info(const struct scmi_protocol_handle *ph,
>> +				    struct scmi_imx_misc_system_info *info)
>> +{
>> +	struct scmi_imx_misc_board_info_out *out;
>> +	struct scmi_xfer *t;
>> +	int ret;
>> +
>> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_BOARD_INFO, 0, sizeof(*out), &t);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ph->xops->do_xfer(ph, t);
>> +	if (!ret) {
>> +		out = t->rx.buf;
>> +		info->brd_attributes = le32_to_cpu(out->attributes);
>> +		strscpy(info->brdname, out->brdname, MISC_MAX_BRDNAME);
>> +	}
>> +
>> +	ph->xops->xfer_put(ph, t);
>> +
>> +	return ret;
>> +}
>> +
>>  static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph,
>>  				  struct scmi_imx_misc_system_info *info)
>>  {
>> @@ -446,6 +475,7 @@ static int scmi_imx_misc_syslog(const struct scmi_protocol_handle *ph, u16 size,
>>  }
>>  
>>  static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
>> +	.misc_board_info = scmi_imx_misc_board_info,
>>  	.misc_cfg_info = scmi_imx_misc_cfg_info,
>>  	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
>>  	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
>> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
>> index ff34d974046aa982fa9f5d46fc673412e01a532d..4950cd6f50aa7b3038bd519a7287e805f70e1cf5 100644
>> --- a/include/linux/scmi_imx_protocol.h
>> +++ b/include/linux/scmi_imx_protocol.h
>> @@ -56,6 +56,7 @@ struct scmi_imx_misc_ctrl_notify_report {
>>  #define MISC_MAX_BUILDTIME	16
>>  #define MISC_MAX_CFGNAME	16
>>  #define MISC_MAX_SINAME		16
>> +#define MISC_MAX_BRDNAME	16
>>  
>>  struct scmi_imx_misc_system_info {
>>  	u32 buildnum;
>> @@ -69,6 +70,8 @@ struct scmi_imx_misc_system_info {
>>  	u32 sirev;
>>  	u32 partnum;
>>  	u8 siname[MISC_MAX_SINAME];
>> +	u32 brd_attributes;
>> +	u8 brdname[MISC_MAX_BRDNAME];
>>  };
>
>Same comment here as before...

Just reply here for all comments regarding system_info.

I could add something below in next version:

struct scmi_imx_misc_firmware_info {
};
struct scmi_imx_misc_silicon_info {
};
struct scmi_imx_misc_board_info {
};

struct scm_imx_misc_system_info {
	struct scmi_imx_misc_firmware_info firmware_info;
	struct scmi_imx_misc_silicon_info si_info;
	struct scmi_imx_misc_board_info board_info;
};

>
>>  
>>  struct scmi_imx_misc_sys_sleep_rec {
>> @@ -89,6 +92,8 @@ struct scmi_imx_misc_syslog {
>>  };
>>  
>>  struct scmi_imx_misc_proto_ops {
>> +	int (*misc_board_info)(const struct scmi_protocol_handle *ph,
>> +			       struct scmi_imx_misc_system_info *info);
>>  	int (*misc_cfg_info)(const struct scmi_protocol_handle *ph,
>>  			     struct scmi_imx_misc_system_info *info);
>>  	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,
>>
>
>Anyway, LGTM.
>Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Peng
> 
>Thanks,
>Cristian
