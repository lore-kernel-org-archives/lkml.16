Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF792F430D;
	Fri,  4 Jul 2025 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619423; cv=fail; b=Q80IeFg5XjYVcKoLD7Dc1RWhX2HTj0DAgYyNIbwYNPLsIGvmLoHsYc6ThF6iN8GfmwslH3vhesDEs6X9yNyTIVU3U1QupNiEvIZ+0eEpjL7DvogEcFVR7ADqn+zAIF8A7FH1F2fgWVJjJEmuR/An495t9zgf+ittZczTYDYj0P4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619423; c=relaxed/simple;
	bh=Zqd4dfvz60qllScxDG8A4EsvZG2ckATL6rtSPb2f7Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H2ZaNmO4AI6ZU7cRyHo0fo9UIFJhX3pttrxCI9vgT6SJONRr6xgTTyG8TTJY/ICxjcH/LtMVyL19Ox3d+6btsFRL+nes9FSuWXesTF2wvwnKKVKkWJ2lh85t+6kS/iAyqvMVL21nfBs0RfJkv7ussYxHZyoEFvIttjv+UewQ8V4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KaxvL040; arc=fail smtp.client-ip=52.101.69.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KaxvL040"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVkeXa3J1VtGeQHUTLD2pOCOEXUV4YXYaR1pUnX8A9B1GIsxrY4z4QvUb1iSuIV6Gy0otCx9zCoYBnc8ns+nR0L+LzF33ReimDvEoKpda/0bVX31F7CyKyrCKwPqHOXKOjTsjVFO93C3Xg/KsuosFQbMXKLZErT9uc35ez3FpLIHflqgAHp0jJh8tmdOv6IUwjrimP9TluyrC3OnDhDYw4qQgcpFJLnTNJgP2EX7H/th02IsHCQIRBj2SdXr7HlfNMTVyH1S0RltEvssnptblNsIHw8i3Svs8SyIsuA2x2i2DamiBVDlx7GxGJjOLhbVkb/jL3toSuwqFND6WHQP7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZuDeiiMFNiHh5DOlLE5Ty1OaFaCma6W7R3cnBne5rk=;
 b=j+KIqy+l869dmSmILFZ75CBMluTIm7UKt2bwFHyCuKu+Ju6IcNIs/jgjssXD56VxfVtPbbzCAzPpuyBObRFcnkXgsQlJKAFiJkU55UUHh0T42hc4bkmZBZFA9GtGziU+/cPjXLGFsaxHpi4FfU8puRm+MjOC7MObW5g6gANxKAiVoFnbtywncXDsrTO7SdxbFX8eLy3/YP+Dnum5kdj9dj+XbeSThfBPIx5oM3otk5Uo7tFnzlKySt0ex+KpOukGDYDP0oJKg8199xnKEmlcrz7bjpX4vYrvQoUH6Agq/KaD8On4bjgWpHu1bRfuGhKzIno8CXTd2Bgj5cFppfBG6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZuDeiiMFNiHh5DOlLE5Ty1OaFaCma6W7R3cnBne5rk=;
 b=KaxvL040irGdqkJI1YW5WtPLoo6e+XPe13+vkOZ+i3pjbQU5gbw9xj1wYkZuq5aLP3WMCzWoqUIz5PnzyRBTNaJpUIgQkH3333oYrVvz8JJSS6yVcaGNSQ+y7wEB9OA0xEbC7YPqrr9wLj5ypuXgK2LORAOR+HB2aR8mDJH9DC8veWscwTvL6yZRjg1/p7JAtJi2dT7Myp+pkTXFdB4rDMqDfDP34tlltX6LNpPSM9EjO0vzBkZft9r3HGtKDeYdAqJyZGQstFO1XziYoCHKqKENjoEKo5XAM6sfdil13CSH3xv+3zpXRka56hkjrlZljIHUXVx8aMf5rKKUJsg67A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GV2PR04MB11302.eurprd04.prod.outlook.com (2603:10a6:150:2ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 08:56:57 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 08:56:57 +0000
Date: Fri, 4 Jul 2025 18:07:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] firmware: arm_scmi: imx: Support getting cfg info of
 MISC protocol
Message-ID: <20250704100741.GC4525@nxa18884-linux>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-3-2b99481fe825@nxp.com>
 <20250702-arrogant-jackdaw-of-skill-bb9fd3@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-arrogant-jackdaw-of-skill-bb9fd3@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GV2PR04MB11302:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f5a3fd2-3b9c-4e5d-d4f1-08ddbad8bb27
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RpFaUjTmIXXUXtlRL2MJ6dpy3Wfkby7ypEbCQzrRLPlfQYxmLvnYFY0Nhtcy?=
 =?us-ascii?Q?KiNJexPjKKQHqojB1R+i2fl9mYY1dxANniMLw3os71Ck2NEd2rZM2x1rqheB?=
 =?us-ascii?Q?WEltI+hMl96HRbwxT4XWP8NXH8jOLWiDjabGFq3pU3QaQfXaR3hBXiV8HmoK?=
 =?us-ascii?Q?kMtl3IxR/Hq1scK0QTANZEGTy74EKQm5kwfDkK0t1+wVvtBOtd/9AsAXOUS2?=
 =?us-ascii?Q?XwbhpcCEjNfiCwlZChdYMg21BIJrES918No9thCVIe6jV8QB4QcuJqO2A0LR?=
 =?us-ascii?Q?0gLzqmwevDhseSFlaNVwe5nHKPKApF5Qb5K+O/pTUK0uRoRLuWZb5EFR56uL?=
 =?us-ascii?Q?6Dxlz0zWbZf7QjbpJp/GNGdNkm7S3LlUBkZ/Mh0mXrsU8gei1HBM6owI538d?=
 =?us-ascii?Q?lavI2dkBuyPosaUck+KE2ctFjxvnHEVLqIM3ahsNyDnp9oDoWwdq0iX7p3E8?=
 =?us-ascii?Q?uAOtUwd+RpoR4ynTKj5SFENfwYw2/Bxkv4SybBRz+4UDyof/NjAOffTbWYS4?=
 =?us-ascii?Q?B5zngvF3Ia+FixAf78lBdhlpZYWACZbJ3ESU22Cf0PRmhs2epxmF4aKbvlu1?=
 =?us-ascii?Q?ED+kVlAOCE7IdkL6QzjX2crLRXXnxKRDBAEx0n1fHFsFJ/6zg9Cumj/I5mi8?=
 =?us-ascii?Q?FxuTv7GIss3UqlNgFu5DSpUpYXFRKCirEFfzt2b9tzIa/WwJ0WyotDxhSGqj?=
 =?us-ascii?Q?h6ZdCheysDpMmVNzGRgiW5Nsoq6sfV5JGgLJ8d2+hDis75t0okKdtlGFk8p2?=
 =?us-ascii?Q?Jh6x3Gc3+j196Dbvr+YmxvVpfZFpY6X/mWunzgjtQbb31VGLWTKU64SuZJJ8?=
 =?us-ascii?Q?QlNvt45Jl9R5/oCGig8WRJHUvoaA4Nslws1wne3yVy0cDqGsT1A7fGCUEIu5?=
 =?us-ascii?Q?WE2y2iFVkGIBw2AZi6AB+7rQ0+xAFtshx9103nAHdJGbKud1i6XOcwPDVbg8?=
 =?us-ascii?Q?3BJRqu7r6hNYLRt3M/UXTyo8YhYk1wNxPv3fAd8ksgUv8FCOZoMMf5Mhj2it?=
 =?us-ascii?Q?I71x5PBUn6X2jrTdIefQYt018LD6w4gIvQwAhKlRRo9fbYK+754Ng1HfRu3R?=
 =?us-ascii?Q?hhXuqOZy4xKzKTi7fDGHUsulMCys7QBS4vdgIbrxNrCbpEn5R/dlwAg/Ssve?=
 =?us-ascii?Q?vD6iTDXoOTETLLJxc2OvfVWFU/OGwz2KPIMtcr9tAX8rJ67Ej5b3Cm4R4wQM?=
 =?us-ascii?Q?DPODSDPYaxt7p2BndGV6fPL4Y8L5214ilFnKhO1HlD8gElS3glI46ZbkRRS4?=
 =?us-ascii?Q?FP+37OUSyZXFQ8UwNRAFpINkCWVg9LdEynWNHI6Wjcx33xcAsQuJoHlfq4zy?=
 =?us-ascii?Q?AHlKCqaVd7Jd6/8j2IDjDYnqaVnKkO1ZukzC8FEC5pkqHLJx2CAHxnYdpMRR?=
 =?us-ascii?Q?ntohxArq6d8svGajhTuB7bNTRpC9qB2HApQPjdTcuiEKJcTum/q4BTRDF4N5?=
 =?us-ascii?Q?XdhpbOvyXMwZX1i2hwkDNZYnAWqsuXUO3bmo3AmGDJBNN325SJyUAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yAP/KyAxDi4bfz8vRAh4NDlIH3aAQZS3braadLCe9re2mDyjDtnyzwxtX8pj?=
 =?us-ascii?Q?yMiYRgXXvZuhBe/BQ0LABHFfmWl6YV6KwqGnJ04FpkAfagZaJXnmvZ9HvecH?=
 =?us-ascii?Q?h/jJuFXAqcF0AuZdlO0whSMV60ugFgWcxMvx2yQohvZeV0UmCgLUCiob43k3?=
 =?us-ascii?Q?QtjoxevlVnsTyOVqoqrKEu61KGILoJCOezeWNytwyTK5npiTTe7fvkXFExe2?=
 =?us-ascii?Q?B5S4DECzbwASRr9i5HsXRrxmJT+j5gt/MnqXTkfd8pxYikwuWe4eOmloKlhE?=
 =?us-ascii?Q?rFyq8GOEVYEKMyUBV/yL7Lt9xri+5Khi7PjsD1GIDdpdwDKTl3XQTvAdJZdt?=
 =?us-ascii?Q?BfkQgrhWLB0lfgRbeAS3Ne8YTkqNp0fB+C09FggyFyLa+1+hGKoWpTHjpn5E?=
 =?us-ascii?Q?MBCllqFYL6SbHJUSiO3J2tJH/Is7X9oHIe7imYBNzY8Q1S6FE3epsE9m+eKl?=
 =?us-ascii?Q?jeiYsWNgJfAc2I+EmpzqLh6xwmoVHOW6kabIZm8ey9si2AmuI4dTVoSkl8iu?=
 =?us-ascii?Q?OPIV8dqqj/67psg8m8bncNBSzXqadVLq/Ij9jlSraZ+fTA1ANsoZnP3NLerg?=
 =?us-ascii?Q?P6pifET3Dju5aQH5RuqVJyD7LitPn9ILLLik1MR9pQM045EBnYNm5mDOTmaU?=
 =?us-ascii?Q?1TJDbAJHEznMQGoP7tY/UNZlNmayIcpXUNBP3w0rI5DMX+86EMDpRGs0Ha/m?=
 =?us-ascii?Q?MG9y0QajcyLolzd8vBilg0mFbD2TerR+SGDVG8x4rJ/LjfN6tYVi9hQx69oo?=
 =?us-ascii?Q?uDpFtWUTHKLrSrDfDB614aDHM8uU90dhnwGQWMJXSoe2+X26uyznmV2AJ1Hk?=
 =?us-ascii?Q?Z2LH/SCDPIu6vC/gwrs9no9stCDyQpfqf6pz5wMnNDanph2oHbhK9ZeVX/Ut?=
 =?us-ascii?Q?W4gyxRXZjBPyrNMPzhXX+Ew0zml+CZ++Arcs+h+zcl6tZsgHqyNDVqogrYro?=
 =?us-ascii?Q?MRS7Rzq4aZ7GjpaqErqCvMd0XLcoOIAbOwbak+R4R5WkAY9iy9A8XKjkO1To?=
 =?us-ascii?Q?mbe8G7WSxSQYd9hN9bEBU6bHQwNw3qRFK4Cs68dueplNw8SzNDbUQbMuDytB?=
 =?us-ascii?Q?aLaLW0Rm6LI1mCP3Jvu7gOn7WEhgKvXHY3nA9olLcW4aGpOOPJiIZCjfn8WK?=
 =?us-ascii?Q?tD+TWOOIHipUxYOsCa35Pld++RL7v2hF+yuj6X/LXoXBwpsVzVZlqKuEt5Wi?=
 =?us-ascii?Q?QRV9fsI3JapyjavIBIH5oFtYr8jDd3YpLKYyymakSKiHmWmkgMepjeYEiXBM?=
 =?us-ascii?Q?whewJZJtmBh+r169gQHNnOP8EIMOtskYxBmb1nS8tv0BtUk/EEDA3CBRPojh?=
 =?us-ascii?Q?1ZrWbM+dr0RylN3WNcwWejLnaLO/J1GPmETrRhMxqx5RAd/mAk0WbTbijBpl?=
 =?us-ascii?Q?+dP2cvMXQW5uAdwHRayc/xgPWci0IH+b/Bb94Z/2H4w/uPA7S4q9qWvHl0z4?=
 =?us-ascii?Q?U3VfJ46q68d2dAPnJKtYDrJ4J8hWmooV9dfR1RwgWTWpfOMyClpL6u0XP+23?=
 =?us-ascii?Q?rdGFpvbBk1yxkv4smAWtoGg3GzUvup92YGtIBu9FFdzXOXyl20T/LksZ4xvZ?=
 =?us-ascii?Q?fVDoA+eHfTUlHKv6F88i+fkZEPLL+ryvmrpus0rv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5a3fd2-3b9c-4e5d-d4f1-08ddbad8bb27
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 08:56:57.4689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S++IUh8zNZcLKzdC8qvuyHx6GkzC8G/+oClyvKdYX42JnhzE+8cVGKlpMj/DgGYfAKBdQos7T9KbGRN1iu0Jmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11302

On Wed, Jul 02, 2025 at 04:21:58PM +0100, Sudeep Holla wrote:
>On Fri, Jun 27, 2025 at 02:03:46PM +0800, Peng Fan wrote:
>> MISC protocol supports getting the System Manager(SM) mode selection
>> and configuration name. Add the API for user to retrieve the information
>> from SM.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 30 ++++++++++++++++++++++
>>  include/linux/scmi_imx_protocol.h                  |  5 ++++
>>  2 files changed, 35 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> index 1b24d070c6f4856b92f515fcdba5836fd6498ce6..8ce4bf92e6535af2f30d72a34717678613b35049 100644
>> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
>>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>> +	SCMI_IMX_MISC_CFG_INFO = 0xC,
>>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>>  };
>>  
>> @@ -73,6 +74,11 @@ struct scmi_imx_misc_buildinfo_out {
>>  	u8 buildtime[MISC_MAX_BUILDTIME];
>>  };
>>  
>> +struct scmi_imx_misc_cfg_info_out {
>> +	__le32 msel;
>
>Now, I realise, this mode select is not properly defined in the document.
>Just 32-bit word. What are those values ? Any fixed list of values with
>well defined modes or configurations ? If so, please add to the document.

The current used value are 0,1,2. It is used to decide the logic machine
boot order, such as 0 means booting LM0, LM1, LM2, LM3...
Regarding 0,1,2 using which LM order, it could be defined by user in
i.MX9 System Manger cfg file. That means 1 could mean LM0, LM2, LM3, LM1
or LM0, LM3, LM1, LM2.

I will update doc with below:
msel is used to decide Logical Machine boot order, it could vary per board,
because the order is defined in System Manager board configuration file.

Regards,
Peng

>
>-- 
>Regards,
>Sudeep
