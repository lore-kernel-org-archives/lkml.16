Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5622DE6F2;
	Fri,  4 Jul 2025 04:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751601688; cv=fail; b=iJW9GBnh/nx/+NjuOgCCGx1qk2o7uQkJ5u7g7fhOdOoJx1C9DqHxWn64T5lZryN7YE7aLcvuiNnLw/KO5kBWx1i0/gXH8lTeVUFeqWK2zWAfgY4poNSH+/V9bsKhiZ4JlJjdemWL0aSYgTam/oG/5vyLN4qG7w7WwnrXoUVOQU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751601688; c=relaxed/simple;
	bh=Z7O30GY/HA/17TkQaly8BPoo6qXTwAnzjIiXjZ7kvDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dlV1xukAQc5Os+yUX0BPSVDDGBja2/m0ymxmRRawkkf83NpjZxlNWlmJBM0PZVe83GgRS71yS7AkrYuyTtqHAcYsvz5TkwK2+pXaO702WUkXk5g2ThoyIc7qbZNM7IfwXRUeVWkK40bO5obZhhbi9j84/lWX7/RHQn/P/hofEkc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UJSs7iDy; arc=fail smtp.client-ip=40.107.130.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UJSs7iDy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXqww2jsY097i5cGQnOntTabP7mebPnDNBv2L/viJei+jPK7Tv8VfyGPo9Y8tkMyPUCDGC2PF0olDUgU/XXd5XsY9d2TTaZgqJAAcz4RajUq/uj0OsaGJG2kJs+YV/Fz6jMve7PgX6H6DaBSLpAQf4qyoz1oGx/3TIHsJW1tzRO+zZFB2Oi1HH5lS0ZHmCpmy9D1MS5i/2ksCi/wYSg9l5cqKLOXezF78+G8fjRdhWhxvVA/YhXpSV8sevJpWhmYtRkrNQ/3N5f3v87ICJ1+msxYqb8bpYgDwFietLfarpRI5G9oigy1IQrPZWF0D7PFE77eEY1EhBoxJNBEQ8b7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eoHyp2eUerpv/QdGarPo+LtG55n9fIKuHKetyAwEpE=;
 b=K0+VvzAYgm0KVSYTcOtUTP6cV2NzbSgTzDpKB7RMJnBS+LJMWnVQ6g6JOBPDu4e/+39qR8LZZKgX3hvmrmLt5TSzdK6RTTgKbYg4doEFCu4dnxLwdel+7zP7MUnMDa3CjBc1/YEvZbWbOKJ8rGisF4mwQsuKG49kMzPZLCG1GZtShD9ZhPNV4xR9oNO57MiAgbDgBKAkcHxt3f1r9rrqho7ND4lmRl4Y8QF0mGVWnxlEuh/x/brV4aXO0i+TmX/2X4bk9HuTxk2fNNv6gY8WYowEuXsHmTjNVnEIvsrqsFeRRHys34rG539PDuL2FjYMszQmpOPCAe6KSjXo0t0iRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eoHyp2eUerpv/QdGarPo+LtG55n9fIKuHKetyAwEpE=;
 b=UJSs7iDyc07g9ewRlq/t8TQPzDzEfjsYrUcSC4QIKy4odGE5X8zkIlMO9YEk0T6acBd/zF6/77MMHV/AHzG3ZDlOgTF59zgzvm9xjI9oIjTGMsvDmDfQywa8+Bw8r+pJDH2R8VnpJbu280xgO5MXTgVMhLzYiOzoZ1ArBnHLxdYKHAIPKrUSvKELRoG9qsse1Uj5E2+RqkE7Y5Rq5esNPWv8jRvp8NFbavf7HjTr+EazCLlCxOnTFnJiUi9DaT4ePTrRlLMKaIVVC3/SfBpRyBNfA2Zzt3O3Yh2NSXkJGaOqRtfiuclsZMtpORv42e30ffY0caxtdR5vPh231j8xdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAWPR04MB10055.eurprd04.prod.outlook.com (2603:10a6:102:380::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 04:01:20 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 04:01:20 +0000
Date: Fri, 4 Jul 2025 13:12:04 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Chuck Cannon <chuck.cannon@nxp.com>,
	Souvik Chakravarty <souvik.chakravarty@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] firmware: arm_scmi: imx: Support discovering
 buildinfo of MISC protocol
Message-ID: <20250704051204.GB4525@nxa18884-linux>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-2-2b99481fe825@nxp.com>
 <aGVOhMr7vg9Sl7Z2@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGVOhMr7vg9Sl7Z2@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAWPR04MB10055:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d427f6e-2ac3-421a-9592-08ddbaaf6f42
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r1xc7SKzSqlf199L4eJYFRofIDe5gC9+SCzAb6zsBeFVvQSmTjnkCUGwzgSi?=
 =?us-ascii?Q?J4FZqsnP7kUenQJYN+d61V7F0pRd9Veum7oBVvhEPmnFxdxMWcpt03hvV/ok?=
 =?us-ascii?Q?yTCa1QjY8E+v35ByMCEI1wcpnSmmIYu3/QXr0XKQ0+HoikIc/lFul0GebgMB?=
 =?us-ascii?Q?LHbhGljHsxuBxH0Sr31D1dnmMe0+0i1jRKReUhfucBBk7WJUXQ0IerNYK6Pv?=
 =?us-ascii?Q?jkjieAGEUtY+c3HkY32i5H+bjnN6gTiyKki5XkqNOdfOUqIkXxeGTVFSLkJf?=
 =?us-ascii?Q?vXGGEKXIZ32JZ3AvaRVuxSsDp4fZd+outlyP/HipFegjmvxvfSV6ewRO3AMz?=
 =?us-ascii?Q?Wpgsr+YMmLqj1jZlDEDJh3ZnOXIQCGrL//mrUtjXCX6jfOI8Dtl/ZpDd1NeF?=
 =?us-ascii?Q?jpvAnKp1sOwnHjpW3F8uzYxKQxoFUtgEUNHwTkmzxj7scegcspSPZASCVmvx?=
 =?us-ascii?Q?BFTRqkGHS8gMpHukg+i1HpsZv0EhAR9Wi5sLqNYP3F2IPRre2KQtip6tgog+?=
 =?us-ascii?Q?zj6KDI8Lh4BcCDRIvHl+kfGQm+m5R4N5NsNcaKYVCVotOmKNU/l3oPpZtSIi?=
 =?us-ascii?Q?+Zxputs9lSZK/e9Bxo+PEXSG3e/8M6t0OpxYH6+fZI4BQcSJfv/CKYQ1CfE4?=
 =?us-ascii?Q?44JsMj2SgYUMvZD+swqSr6HYRiVy2CUDPY/KAJDokjXmdzUkBHo/6vs9pe0R?=
 =?us-ascii?Q?pLxbQbRUqtvKEzisx7FsXNaI+01cNfe9IL4fYvkNlKRNRPHWC8gNEbl8x+7z?=
 =?us-ascii?Q?XuG0M89rAaqhgmH3O+0bxYq3OZLwcGq/VLq2jbUeSIhHJ+5bfY9FXL0XNGfJ?=
 =?us-ascii?Q?H2M8262/8aM1QgD+VhNNI/qTXBvwW6VJ1YncspekZsOgs/51otQw3o//NCXx?=
 =?us-ascii?Q?f+f6raig5HM2MYiL1EFtmTSpXow8IQPQzfdBzft8IZyq3nswhYx7ixwpFwq6?=
 =?us-ascii?Q?n8quStj6Azn0ODN3sStCm/zZxk0rzYa7GHZfKvu89BndjG8lxF9ULMpRWEbz?=
 =?us-ascii?Q?TJs6iwn26XpaFNnLg18sx4EcizVll4kGY1hOYDLFaPrJuvGPNEZuCOsejIfv?=
 =?us-ascii?Q?D+zStmijtkKbqqQq4MvuDi/z3OGI+I4tcOx/atvV8O/h1ZTwEtCh321XppSv?=
 =?us-ascii?Q?8+ESHYfwit4kkqQcH5CSmTqkF3QUdRN0VGzIerJPS+cwhfD0JQW7ZlN3chEJ?=
 =?us-ascii?Q?GJ9FuSwcLRAdI1xPfx848SQtsEnrzL1Va7RaQOB8T8SmNgx3GO5uJqaC+Jvi?=
 =?us-ascii?Q?+VtRtoZhbZ100pGcvI72urhma3Is1VEFy+uOa8WQodHXDOa1FlRXPnc6MPJH?=
 =?us-ascii?Q?HoLJeOzlnjVcgTQEPXGR6oenes1W77GCscIiZbEJdMmXJRkAuENXVawgLfLc?=
 =?us-ascii?Q?l62iuCjW1OTCBwm4Pyzf0TFKn5Eq8iXzt0kvkS7zmx6la7YyWD2QLIAGO5Jg?=
 =?us-ascii?Q?PtsmXNWR8Q3riIeTnLIV+upgkcoEvvXvhZLrsWGnG7PNOmQeCG3KgA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AsvDEIf2m0c1TuUpI8OS6Tf4i0l0Tz5AHjbUMGWmNkKKRgDPsQUgTE/PmU3h?=
 =?us-ascii?Q?QN3NgPyiD9JrouNTIAy1YmxwdfyjxZAevZzIyxkIoNdF0dOOQaFksp/+eGQn?=
 =?us-ascii?Q?j8AVCB5bGKm+3ponGSo3Lf0BqBBjqfKx3aKLLW0BCKLjup5eCTd7aewm6AJ4?=
 =?us-ascii?Q?eOYG9C6/9WBLWknh7QhTVQMEftCzopoGgGyxXXkwbXAY+YGh3v1puhR65VyK?=
 =?us-ascii?Q?dOVx1rcQr/C9MQfZs7AhyFbFyWde9eTJK8glCiForikfti6JNCmAFosQ8UFO?=
 =?us-ascii?Q?oijMjzATDLRGmi7RBmEXQtf09iK6fyUjLCatXwzeuRxBx78W4J9kzs0IPbuG?=
 =?us-ascii?Q?ffHCyUz6h8TcpirToTzYp9mInZAsZJYAI2cWgKDQ06lFzfsZSYPg+LBj2qpJ?=
 =?us-ascii?Q?uTswlEK9Nf9qx2COLeJR4TFwnSTGyMn1Dq55ygLZm86iy8BcOZnJKsM9S0HD?=
 =?us-ascii?Q?CtwY2Dd6ESykpjjt4t8qq3T4PW6H3BeeHSd3E+lJ0G370VRXoyIyiYPC+sY7?=
 =?us-ascii?Q?Xq4wgCqQDA3lXWIotfiLiS0n2ypVjz6ZtCWuq1IzAFz887kLv/UPOabk9rTF?=
 =?us-ascii?Q?kyOntJiGRKf9v+d+jaFS5uIvjLzEaJFRSHXvwvTrfg82FU1dE7mq43OM35pR?=
 =?us-ascii?Q?19OHi5lLfZPhLpib+aBMUzv2F/Lf1KBHyQ0Ib/RFNIz2XqMX6mFaqG+VKQ4S?=
 =?us-ascii?Q?Bnxj5yw/HY4T3y+wtlOiAXQIBOvh0Fhlzav0jbmGbeFj7cDAyOWkJYwga3wL?=
 =?us-ascii?Q?fMw/oKg3GInkv9V/brMPM1uk2g1NeoIedaeLYyVyo+7/am+f5/XA+csMi5Se?=
 =?us-ascii?Q?XTFswVrCYSno/O2Gt1eyZ+ZP2NsNTj/8/GYnMNrt10LLeTxAO5FO43GlGwc8?=
 =?us-ascii?Q?AnFxAAw2dI6KC1eYLwVh8O7OkK3Mb9tAx68gW9Jj6MKBNy8NbyZdASnbFmsR?=
 =?us-ascii?Q?0veVFB7oOQjzeLukHIZMGfwIG/lNaTdwZuyC/6bKcjqo9KwZMu+HjvBQvwNZ?=
 =?us-ascii?Q?NqkMnCSZkeOeRkAUnBBDiDhUA/awgCse8oGcP01n8ryBYVNkafVPzQEjVWQb?=
 =?us-ascii?Q?Topi/T4P6NxRt7eq/hFZrALv+xf9EkM8dRgWIlhWwbLiIFbUlVQpGhT4HBjM?=
 =?us-ascii?Q?apztWes2JT3zzjZf1Hy75G9Fh7KLyQA0xI7dSIH6cMzILrmwYI5C3jW+aU+X?=
 =?us-ascii?Q?jSdlQ/51Syx0BwbaSeXi8DQCZVysGxImQicDTJqyXV5dZNI4V/y8xI6W782g?=
 =?us-ascii?Q?Y8h9ge/GnUQ2IBQnIah5p8iuKbgJKDm/FrBVk1QxjUMUQy0CVSEU99+n/NDy?=
 =?us-ascii?Q?XL+nxA287tuU6dHrfNsh0MmNcXPcqXTWw0GwOKmIALsOsPzOxiTXMSADcAm/?=
 =?us-ascii?Q?x8Jp86BF2BSs8jRdnZqUOmo+/VH4ciPixUPPqHiuldkFg6KA+azyBbsBhfdV?=
 =?us-ascii?Q?QucL0KN/dg7kGMaw6FxmaHd7InZ4VjPRUIAx4k9vOe7uoyKaUOZs8GIkpM4K?=
 =?us-ascii?Q?1+Mz9X7DTcNKaS77E/Hcl59j2IJ2DMplaQ+mvejdRs/S/r5z8nnom3LrLN6F?=
 =?us-ascii?Q?qUv/rxJguDgXdsX8v5dijUj/m+ZjsR+d/YfUvkWO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d427f6e-2ac3-421a-9592-08ddbaaf6f42
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 04:01:20.6666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DL1jBvDESbhk+Qnd5sWkgQGV6YEsmAAD9WJYBlsDTbBs4bua3uUGCblpUvpBeeYwOUpAlusgMY0nZsIop+x9hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10055

Hi Sudeep,

On Wed, Jul 02, 2025 at 04:21:40PM +0100, Sudeep Holla wrote:
>On Fri, Jun 27, 2025 at 02:03:45PM +0800, Peng Fan wrote:
>> MISC protocol supports discovering the System Manager(SM) build
>> information including build commit, build time and etc. Add the API
>> for user to retrieve the information from SM.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 35 ++++++++++++++++++++++
>>  include/linux/scmi_imx_protocol.h                  | 12 ++++++++
>>  2 files changed, 47 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> index a8915d3b4df518719d56bfff38922625ad9b70f6..1b24d070c6f4856b92f515fcdba5836fd6498ce6 100644
>> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> @@ -25,6 +25,7 @@
>>  enum scmi_imx_misc_protocol_cmd {
>>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>> +	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>
>I clearly missed to raise this point when the documentation for this command
>was added. Anyways I assume, you had explored all the options before adding
>this as generic tools may not be able to pick this up. Instead, I would have
>just stuck with vendor version in the standard protocol with build number
>embedded into it. The date and other info must be implicit from the build.
>
>I try to be more cautious and ask questions in the future as I don't want
>vendor extensions to be dumping ground for really random things like this.

+Souvik

And Loop our firmware owner to help comment. I just add what the firmware
supports here and allow linux to see the information when the firmware
does not have uart output in some builds.

From SCMI spec, it does not restrict what vendor extensions should be like
as I know. So I am not sure what we should do when we define vendor
extensions and what I should do next for this patch.

Please suggest.

Thanks,
Peng

>
>-- 
>Regards,
>Sudeep
