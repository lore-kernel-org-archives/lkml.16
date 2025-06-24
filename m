Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013044.outbound.protection.outlook.com [40.107.162.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EA99444;
	Tue, 24 Jun 2025 02:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750730609; cv=fail; b=BoF70koHYVnu6Tq7XpYljeYq0EhZ1TX5jLVLgm2NICsyexhkzn9Ybsjx86iI/O+Q9gfJm2oySa6FgKEsbZjQ0Awv/zyfNc2EDNGUN0cjWgOX7x1cRZRKTBMEZTH1hs4xZcZc5FAIzkud0gnRPik3U37dUerY6xytsDmFXgHH02w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750730609; c=relaxed/simple;
	bh=0FsueVmC7dm2N395DK9c/m+Z8eHjBdX+q+YdJm2sPQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bax1/Y4Ayr+ECj1R5+nJ0kTb4bX1NoMJ0j8V7VQJDo/Ns8FVCUm5vsj+jS9em1BKrXMxZ81haeUS7aP0P735wLPIi3/lS0nPuB2XbYu4Vs4qGuesrsVn/6rGbqOI/fgsQ4w9XbfHjc7PZhSWopwhfWM8ESzc8KOCUHF8pedUX28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=THEEGh7X; arc=fail smtp.client-ip=40.107.162.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="THEEGh7X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McbIorFcW5iQr/glPVn8+74SUxGt4ibxA/VHI0Xl/TCWfsd6QnYt1ftv6FEN9qmX4t9RrYxMaKr4cY8jRa37sZ+d3AnyUh2QEQIFxzNMAv+0kLlDQiXDlU79LPLuNM1pEqUWwx1762d2zA0DSmzOpLEQZYCTmckyoHhCzzplEt18s+oKLzlrAjSGkbd2zO30fzA0EHv6J1FMuiK7l0yBB5cd+9QDIkgfyECh3K87hNTjEpkTUhCssx14bgSWNUojEfPfoCh9renov0yW1OjcPqIsYeSSBHYOBJIVStn9GR9VXX/Ghj+QrSmkk6Zk8qLOGsNTd4B5l/m5qINeLUpUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUSqS/ozSQiA5pIwF6lY3g9ZUSGabaHGtU6rgAk+mtU=;
 b=N7u5g5R3wIqKCiS1wrVv0I7kawUfoZlirwL/wEgstHUhYD+G2BJzm9PByHRu4H8PHAwDBjn0098Iino+2Xhz/TruhreDTPZ5Y70GpqwExH6A6vMqw4SyPttei1PoSuc6yLDzwBzaibT6/husnUray5z7O8+HTdGe1j70rEH2ltMo5bfpBXn2xss04l/p5D49tTqrQKsi7iHZkb0g9qXCHA6tsbsIcPcUwohQdQXkaS+/fChqP8mcOjziVmZqEUiCC4ooswNhegz01BVbYwDGahXmLKcEbH5olpy0P57Gaibu9hF6p/Kg1k8PyjciEzxwTProOpKW+8aMyBEOTIc0mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUSqS/ozSQiA5pIwF6lY3g9ZUSGabaHGtU6rgAk+mtU=;
 b=THEEGh7Xs1cXm1Hdu2rdB/9jSZd6rc0AJwyQOA5yKeQ9OW40LvLL6zyFPc4bM4W9BE9+kJ+NWQVsTCzElJs8Kv2IpRHtyXBs2Fh01XQN7ZJPoKzD0cK5cC/DWZs8wKC8eENU4/dyWj90FXSWKqGlBe3j9L193+fY9Qsqfsgu0DZMWicfFLrMd6d2TrZhQYGu1l41mKg5iXSUDWYq8w2w2iWzdAxk/g9pK4XeBnd5TQ5gqk4kSJ++nnEPSlX8/09pG4Xs1B/g+ml5o7JYHTuG3EcVT+mlkFk0/Qd6HmLm21jP8qtVeOKQFKVNWrp706B+0M5/+f8xIv+nn6mipFsvRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10173.eurprd04.prod.outlook.com (2603:10a6:800:245::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 02:03:23 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 02:03:23 +0000
Date: Tue, 24 Jun 2025 11:13:51 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 1/7] firmware: arm_scmi: Define a common
 SCMI_MAX_PROTOCOLS value
Message-ID: <20250624031351.GC10415@nxa18884-linux>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-2-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-2-cristian.marussi@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10173:EE_
X-MS-Office365-Filtering-Correlation-Id: 3218b75c-0999-4fd9-10ad-08ddb2c34c90
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O4czjrV01sf70n6w7WVcpUcYxlNDCo6vbP0nEvGODSOa29P7673Vp4lVPLM4?=
 =?us-ascii?Q?gyzmkHb2qdGGbmgyI6iI7uBLLBFoujOXPM8lLq2QeQG/8u36zbJKaTtE7BIr?=
 =?us-ascii?Q?5JIhsiv4kGQZ6bsJoPAQQuUGDKZzqlHY+UQLIzVu70mBgD3x220Wlgs5dMUD?=
 =?us-ascii?Q?6pAsXNUGcUFL2YKNGj1SM2Cm3SoEVlkjNtL5kMMItI4/wvi0hq0mRBYWjP5v?=
 =?us-ascii?Q?S/3VK2AoYWC1a+Axrj7NeDgbKdry+Xft80fqoiRMB2HBNP7PvvqyvYqZgbZR?=
 =?us-ascii?Q?rKDuFkdilmBs5dqNA9DAZFh8aVrpzXl+pra+LF5md4BF1ueDNd6gM7cagNjC?=
 =?us-ascii?Q?TQamXtd5s0veLTItQoWUEh6BoVNmz+Ifaqsar94F7vQr2kLiv0XAbqkJ0ToM?=
 =?us-ascii?Q?U+jt57VEtXlce+n3O5QyF39l0Q9VKM+Yy9n/iX9MY5Kh6LQ+lkJ0frTovDPW?=
 =?us-ascii?Q?PQG2nnEkWOIPF7QSP2rHu90631DCUcl+NaHoPN4ScHfR1teVzJxs68wpdGqh?=
 =?us-ascii?Q?+Ruv35Q34DfcFFDmsjuUeT4iFLs7BGe2FPOB0M6It2IEIHd8HOEoo6xK5KAb?=
 =?us-ascii?Q?uW3jMkzJcA7lxVD+aSIzlBRjUS3l4KfPfV009bOnpsDVfzL5dPstfvdjGKOU?=
 =?us-ascii?Q?HdxXMeSYVy7e1Azzu6kZQCpFORQyhCi0tl8+njiNH6iKkcKHWP917CQ1c3G6?=
 =?us-ascii?Q?IussESOd/2lIGviINto/Eo5DtI4Ix8gVuw4eHgw7EktwGaeNgHkGHkK6sV28?=
 =?us-ascii?Q?1aUZwiSqNp5J4BtnQcU26iRuo8LQfal4CNAXeBEnBeA4svobeR1XUfeIDhZN?=
 =?us-ascii?Q?AWq/Ymqc+RBoqgoTLAL28xAhtmB+97FQheZ2SX7zsjxW516o4K0aHg9Deh2X?=
 =?us-ascii?Q?oYvdTUKjdpGNoeFkiBUsJ8PosDWRAoiqJ8t+uynxTUjL3h3PCfXasUOR8oVj?=
 =?us-ascii?Q?1hzppP+tzuYKRpN8TZiURovd4xyzjEQbfoWmqZHO0yFWVkSq/+cv4D4I6noQ?=
 =?us-ascii?Q?lE3LGzJVYz2FaEzYxu64dHweiyP4mOzTg2ijqeYLHy4H1FNtjprZanE3PBrf?=
 =?us-ascii?Q?PYV53/7A9uQB+FEhgrmDjY4fki4c01Ih6ox7iXyWNwXCZPGE13piKiskE12H?=
 =?us-ascii?Q?3yeVPgZ/EoblE3o35lXSbqBF77JoN/Y0kacGp40KSKIK9dhdGH7d8/Zaum1t?=
 =?us-ascii?Q?XbO1btTtsX9pS0dCycdLs/yQ1pE0ON+t2pGTqdzVM/zpJKfcsOduTHF3rqZf?=
 =?us-ascii?Q?rp09mvhiPKnMQpAEom9oyEfVnigBT4zb6HvbbMsgMUe8rYP22t09zvT0/No/?=
 =?us-ascii?Q?T/sRrZmTqHCZImhIW1Si9H7ImXt0ylW2yOMapcn/3OMf/GIp7/iiMiV964DO?=
 =?us-ascii?Q?eMAgV/FtLKJnB2VOcL7by48arnpp3MSVFyiIxCZOKWXhHJoi8/W83upQudMD?=
 =?us-ascii?Q?yT62d0KeH+e3yvhjTZQiIOvNnAFLvsgmfFMKn44HoMcFGmtdqTXPCg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XAEr7Sk7WNh5cBnX6SKFInkZlhQ+DLNx8H0QJZ26grE2bhfXbG2aIoXi+Szc?=
 =?us-ascii?Q?TC25oT9SxYm5cInwpsDZG8W9gWDOuwRDZuZbhsx/NcY5yOP8A0nAEO1wrD8L?=
 =?us-ascii?Q?kBowt3MC3EmW71uLvQ19h75suRJwH5rzRf9hhTG8357UETY32gbzGuE5Y85g?=
 =?us-ascii?Q?6OlaRZAgFHEVCSvwpdkgKYnVyRh+JvdsMyksFbJP0Flg6nc12FGhexlxbc//?=
 =?us-ascii?Q?VbSoHKrC7X2myt13XilS8qKob516oda84ti97A7PXUYChoCuSIQfWmsqK5o4?=
 =?us-ascii?Q?Vz+tEpGu+AhvT2p8o1YtHvwC5ysEDjpaae81vrOg15O0fzOlEEvXKSG60BWi?=
 =?us-ascii?Q?W13dc4i5Dn90SaGc6RUkmzNw/wvG7X4MQHgNmnfIIJX0EPPN9j9hdt3T61mn?=
 =?us-ascii?Q?3FPz/oM2hudwArEbA6/rrq08wbT7M4s3x3wuxzIcySguSGI7pYVyxYdWZ6U8?=
 =?us-ascii?Q?qs1/VdNOgm6RGpyJPJhqulWshKaMvwY5WIKtTqpOlf4DzBScovsaPOWuwc8R?=
 =?us-ascii?Q?I/Dcz1DU/h3NgDBrycEA15FkOpz/VZ4yNEdeY6VgBk1EfgiyK8YoqGX8hye2?=
 =?us-ascii?Q?rqPtXimqeu194WvYC1Mor1a7ULCwGZpVndjnobsuWY6mqzJgYUaj09h//LHd?=
 =?us-ascii?Q?nTk/NBYbjMao2sUz/6GVEUFDaJgZ30wjeU+8EmxVe10P8AFb7NFW3Crefp8O?=
 =?us-ascii?Q?Ln/Bh2oeUCEo6BqSZAA6I+AYr2VNa2lTy+SyAx+6X0AfoMerXCGHG7O+/S2s?=
 =?us-ascii?Q?0pBMphcQVtLqx0fCZFuvG9L7xVYiFL1jf4W0azl/GjrsuDoL2q8EkmXldyct?=
 =?us-ascii?Q?KJzqjDJBzk0rc37HQ2UOcwmBKrJUb9KwvdiqBvc0Fn6mx2ofr7Q7wIijt30H?=
 =?us-ascii?Q?/nkEuzPD/bNBJazVCaRpgP63okak88ycowMdgpyVUsR4H+i30mcw4R+097aL?=
 =?us-ascii?Q?bf05EV9XGIBjFfPiFcKNTDmdR8y/W44S9NtnkinOJsy16uZzIXn5a58wjUSC?=
 =?us-ascii?Q?iLG9uGJ+NxGzP9uzhmRdQqClWNRPFsSNA5kGAGDy2vYQ509VYmuZ21lV9QXX?=
 =?us-ascii?Q?Y46wXF9TyJuIWfI9CB95Gc97O2/uHYlBjmkrzRPms+QxhmxLb5p30TWIgM1c?=
 =?us-ascii?Q?16OpjWwFo8kAawpvyp/q7I2uMy5TbmHUgLZ16xEFULwnvzs9H98GdbghrGUN?=
 =?us-ascii?Q?zJoMz4JdNA2woKlIT7nhbOWxgx5dAsnxnTdQ480W6vBFZaVHK0Iu+wnYJ3NR?=
 =?us-ascii?Q?bLDUsYVhsrbGjiBI/G2iMJMDnbgbgMPGVNl2zzJa3Na3cyRHsoivkVmPXknV?=
 =?us-ascii?Q?LcicqbmbcU7oxHPG91OJc72WkWhwkfRWrfsoizJVdgrxOcJjEUy7La0L0H3T?=
 =?us-ascii?Q?AVKCqRXQc2ynPby8tOvWl9sTjlqAHaUJJVgnKqr4LgIZZ55AHNpBvPe0tva7?=
 =?us-ascii?Q?o60Ux0g9s1vUA94S0UYSoJ5LJKaPin6y8xU6LumrOQSpjX0GEfJZBP2cpLOI?=
 =?us-ascii?Q?LBhNPfVv7MwvRYCRuJhYflO8KEMNyZOpehOZxhlswsBB892AW3DchFRuVvs/?=
 =?us-ascii?Q?ckDxpNfqZci5eCQB9APd3Ogdm7GQ/LHd1rFhh+ee?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3218b75c-0999-4fd9-10ad-08ddb2c34c90
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 02:03:23.0508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7uxdvhf3wgT3711hdpM9QbwjObzWuApE7ia7/VrYeJ04LornWcDTRV0FZ8gUyGdaieBrCBnKGKvb6dIwD2YZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10173

On Fri, Jun 20, 2025 at 08:28:07PM +0100, Cristian Marussi wrote:
>Add a common definition of SCMI_MAX_PROTOCOLS and use it all over the
>SCMI stack.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>---
> drivers/firmware/arm_scmi/notify.c | 4 +---
> include/linux/scmi_protocol.h      | 3 +++
> 2 files changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
>index e160ecb22948..27a53a6729dd 100644
>--- a/drivers/firmware/arm_scmi/notify.c
>+++ b/drivers/firmware/arm_scmi/notify.c
>@@ -94,8 +94,6 @@
> #include "common.h"
> #include "notify.h"
> 
>-#define SCMI_MAX_PROTO		256
>-
> #define PROTO_ID_MASK		GENMASK(31, 24)
> #define EVT_ID_MASK		GENMASK(23, 16)
> #define SRC_ID_MASK		GENMASK(15, 0)
>@@ -1652,7 +1650,7 @@ int scmi_notification_init(struct scmi_handle *handle)
> 	ni->gid = gid;
> 	ni->handle = handle;
> 
>-	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTO,
>+	ni->registered_protocols = devm_kcalloc(handle->dev, SCMI_MAX_PROTOCOLS,
> 						sizeof(char *), GFP_KERNEL);
> 	if (!ni->registered_protocols)
> 		goto err;
>diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
>index 688466a0e816..6f8d36e1f8fc 100644
>--- a/include/linux/scmi_protocol.h
>+++ b/include/linux/scmi_protocol.h
>@@ -926,8 +926,11 @@ enum scmi_std_protocol {
> 	SCMI_PROTOCOL_VOLTAGE = 0x17,
> 	SCMI_PROTOCOL_POWERCAP = 0x18,
> 	SCMI_PROTOCOL_PINCTRL = 0x19,
>+	SCMI_PROTOCOL_LAST = 0xff,

The enum says this is std protocol, but 0x80~0xff is for vendor extension.
It might confuse others to keep "SCMI_PROTOCOL_LAST" here.

> };
> 
>+#define SCMI_MAX_PROTOCOLS	(SCMI_PROTOCOL_LAST + 1)

How about "#define SCMI_MAX_PROTOCOLS 256" as the line you removed in notify.c.

Regards
Peng

>+
> enum scmi_system_events {
> 	SCMI_SYSTEM_SHUTDOWN,
> 	SCMI_SYSTEM_COLDRESET,
>-- 
>2.47.0
>
