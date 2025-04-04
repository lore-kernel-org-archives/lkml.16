Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6882D1DA53;
	Fri,  4 Apr 2025 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743785415; cv=fail; b=KloHTrO9NsfQZ3aX8i3y8ddxwPcouEJWFF7C911zl5YdRZfcrYvpqIysEtH7xqDfs0vc/ad04wLYIAw0FY26j1tuc4PW60gEXP9c9+KQE80oyr3sCCf0c3Ga97O/ebaRgMpYFGzqEjuHCObCAPWGZi+93NtJ1avufsmCL+13dzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743785415; c=relaxed/simple;
	bh=cApcswUgbGsuT+p2HnERe583XMeqzdUrArZH161QDwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o/2u58brvXaBSBp45VY69t3E/khA1vVO+BaFNQmT/NFxbQS9IsT3HAlSkMqpAadqlL12m2RsqjezFIr6xyXYDQIOmrXNcYNrQEl4EaDGE8/TcWHab9PwmRdU2+p/3Fw9/CUMFpvl/fOG20Gnj0HLfVgAuEjr5s+mJczJ+4nONNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oKsLJlYb; arc=fail smtp.client-ip=40.107.20.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oKsLJlYb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKcK61JMoUNs89kVShuoRb4HB058BSf7evRzhnKPQg9Z0kb6kcRBcNn2YgQdrqUz/auqtddfC6cBMaT5o13xlhxDgwGE6LvAFHJVe19MxaH+wsW8GpGp+zCvqqxNHHCe5XbA1kJvgh61f9U3BUL8XLK4Ypq2G0e7BaBSsbVhQkwcnql2zZsjDHSAwQeIcb68xLmSWYFJqFi+W3cJXvZz/e0JlNAZaoZld3OgfPgHXMH1tnX+iz90GvNAVJcD2gFNZx014aqVP+c9XiHpN1jlCPuPU5HE3UShY1AzldPBHBYmBJPsojEjv9uvAVzNdKO/SB6E4uCtOq1dDYhyb606Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+sgAnsLhH57eOdNsvuI1L0ywx/UFZY/lzF0V83S3Uc=;
 b=SokvsjstyBEt/h/6kIL96e+ZgN6tOQkw2PKoT8oOhjjesa/jouh6Nsb1nACahFXmAC2JCUE5oaPIBoTEbhg/43J1WRvLqqLSRxTjaIlVTZYEt8qx0wdiEvmSuOLyC+NRnBbjamk77veuQ1XQR2G9ZM9G51qMS56LZ7vezM/saI7iXDp2S8ogtOg+vUTePYaL/F/DvYlRjfA0z6yzyE4H8mFHV0ESuIufhkf/y7g8Dmj14MzZLlqNRnby8zi55KFtqnrnI/zStnvvMbAJmXnTW8TJv8ofruXkfufm+ynrYzf2EcDzHMBTd219uUlASE90w1+wy6smdE2foHn/HpqJgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+sgAnsLhH57eOdNsvuI1L0ywx/UFZY/lzF0V83S3Uc=;
 b=oKsLJlYb2xaTXd+7N5j914qqXYgBGsXfCLUMDBrGX9PxVziVrIp/57pIx8rRPWPrnJqF54HF3I/w+Zk12F+YPNdNP+PM47RW99as7c1jR9mgkWo5avl1pHOpKZMFG03Xl9qdxMBQYUtY7xaooKMrqOqXmnVs0QqqE+MIFOksg2Xo+AvLoaS4zmuGLEDFfflAPONod+af9+I50cGNqgyrYanHjgRCMwJqdu6D1jEhGtuhbBS1RRHoPm0ESdX5KPd93GY3tnZFEb/WWx7D26Bquc2GUzQjlUwC1M0cPawtWirboueJ+viCc1ysD8u95zvHqdjOaakYGMkuOKVRf61AWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7303.eurprd04.prod.outlook.com (2603:10a6:10:1af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Fri, 4 Apr
 2025 16:50:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 16:50:10 +0000
Date: Fri, 4 Apr 2025 12:50:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v14 4/6] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <Z/ANuvgHRRTUWV0x@lizhi-Precision-Tower-5810>
References: <20250327-imx-se-if-v14-0-2219448932e4@nxp.com>
 <20250327-imx-se-if-v14-4-2219448932e4@nxp.com>
 <Z+QePoixgnheYQTW@lizhi-Precision-Tower-5810>
 <AM9PR04MB8604C02C27C8C43FF89B95DC95AC2@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <AM9PR04MB86046B9A3821D8793877F1D395AF2@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <Z+2qFe/E0dbR+qkQ@lizhi-Precision-Tower-5810>
 <AM9PR04MB8604F5E033F9C0985F29BD5F95AE2@AM9PR04MB8604.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB8604F5E033F9C0985F29BD5F95AE2@AM9PR04MB8604.eurprd04.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: f08961b4-f2bb-4fc8-77e8-08dd7398c2fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?grjGk8WP1c14NjFtfKgFm53i0jj3Vc6zYLpWidSvw+azurwqQGHLV4TONamX?=
 =?us-ascii?Q?nzwgRmH7UDpRI9GDuO98diaJI7Fr10KZuBitGadFVBbmNp7fNe5OY7MK5kyM?=
 =?us-ascii?Q?9YgE7JVC1RYDqE4tProB1HyTGK5Nc9E1QFVZXZFis3wIour6C6NasCvS1aEB?=
 =?us-ascii?Q?YujHmmK9ICVRiVZknufwS0R3b8N/SgPGxz4vwfNYF5yheQSXT5cuFnqX+LMa?=
 =?us-ascii?Q?tt7PpbsF7wRHqT7hq7sQWRyN9i7YIUfvBP3wxS5s3OGUXoTfam2KOEnyl8b3?=
 =?us-ascii?Q?lYORlNIV+swh042Jw+oMoETAW6pN1wd6kvzMDEEorzGmLAAIxcoWuczrX8L7?=
 =?us-ascii?Q?sAyZ3rowv9dwy76a6s7RSvaTO9JszEObtzmk1FJlvISpTOcyAieiUtbHz/9y?=
 =?us-ascii?Q?DhKORegBZSlGkH8SE59FD0stRH3VDt8zsXPBFrunloNs9pYlqKvDgu3PN+HW?=
 =?us-ascii?Q?qHukr+pwT7w5NybvTqK+1KhZqNWZp6ukhiYHvEwQjv2/q6SwtTtH6QYNS80X?=
 =?us-ascii?Q?y44vKGJbjScg+cPreEMSWHhCgwBJYXsrdyXSp84+MTtdi9g4TCvEGjpvkK9U?=
 =?us-ascii?Q?Rx9O7XbZxS0R2P6KrCl+t7XB+FxC6fGqozrwNPg/K4FS7PnzjswxEPqCd7CZ?=
 =?us-ascii?Q?Lp/GrTf61nYjoh+8MdHvQyjS1oM3wA28vCipmswHQ5bBeP53wdNMmQjLOgHt?=
 =?us-ascii?Q?aXKi7MCCG0PY49QK6AUYWvw0M+A+PbskBCX4YPqgd2a0yQo77AiP9jrv9xiE?=
 =?us-ascii?Q?Fed0UKSqIQU5H0bo27eDoDsXvTSQDso3mfVZaqPBBet8cH6dFuvKKFQsbJcO?=
 =?us-ascii?Q?TNCmt91TYL+m6jCNilGiE6AFvnrAD13uxuFSfmUhA9htMvdq+Ikokxe4Sgd6?=
 =?us-ascii?Q?Dw9tPZr2em+fG5+sFfYEL8JO8B16pRR2e2r/5WDOCu11bR6iwxYGLzzpooQZ?=
 =?us-ascii?Q?RwyPQDG/F1SrkdgA6jRBT4kKTjd4gYcbGbF24gBtWNbOQxItQdvrrRisC+de?=
 =?us-ascii?Q?RvLjSMdtowEgi8o0p9nZNYJOFWiV/NzCeuKBZ2IMy3hbvrtRtsEPb0IEYe+v?=
 =?us-ascii?Q?6XaresXpK8d+HVED3t0DiZM94sGZCn0aDPQHLW8mCOTiu/2usoQ4/nxNkyg9?=
 =?us-ascii?Q?O+5HK2q/lroKdD6lhFOFSBrhWIO7BJl7kzRVz+Z94VDUCUsXJchuFZN54OQB?=
 =?us-ascii?Q?YrUSDLTRwzAqZPSObQA30pM1BDrBZf7nRkHiIHpe7vQp5Of+NpWa/AlRkRv0?=
 =?us-ascii?Q?Y/63ggsQ8sRLH/l3U2AAgPISujPVFv4r+rRhuyRXHWRz88955Fts/o9LBa5d?=
 =?us-ascii?Q?ABhyNsfazlfp+Rmnw0nPCKYkXTj70SS9y/uKhSYEtRCZ5C2f0AmZ79clpT+b?=
 =?us-ascii?Q?nxyF8KHk3//6VVT7QJdk0mTATJ6LRM0LjYB6IqFy8zWfXauy3bDtCFO/AX6Z?=
 =?us-ascii?Q?RxAckLPr/pu67dPDaYxtT7IHjcLm4Blr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RyOS0/7AiKDDwQNvIUOUDXXCdcRsk59kjg976OYe+lEY7NX2PJUh3L/LQ1Yr?=
 =?us-ascii?Q?28sJJxCqbcntE6bXQIvaAQCFHBBzVGKkf7dBapHnbJ99jBAPbSFHhu6uKqjm?=
 =?us-ascii?Q?Hvi0rAYg8SEx0gn+JC6iDIOQDA/L5TAyJYrHLdvpAhFy0PqwdbAUBqM1KhF+?=
 =?us-ascii?Q?TcgFCUad2XaLxM9Bq0E+kev+XgySbNulJ3kNzb+8NExWm83ofuVRIOOBMc8l?=
 =?us-ascii?Q?o2AhLUEFUu2roLdF87rqGTWc48sXh4TzPyTJt24VnKBjNyG276ATuLU2NQT2?=
 =?us-ascii?Q?RUYrbZ2elQNOBnQCttcwZrgTJIm308CbuEqtkf11V6ykj5gnv1Xl1WP9xwQK?=
 =?us-ascii?Q?Uh6B0ze6bYXdqCVPJJvxqS0r5j3b+hlqLIWZR7ev7otfbTwcbPtfkzqkmvm6?=
 =?us-ascii?Q?iO49sVz8keL0Iv+Mdu0Bk+v2E3PVTfreKk5ighVBFepKDeJ2Vk2JmjuttC2O?=
 =?us-ascii?Q?wGDatpwdRTMEcrIn2W03luGwVyzi0zObL0YEh+mXYIp6awYZiSXE1imWMm8q?=
 =?us-ascii?Q?E+wFFXNU+469OQatIpvkFhWpbkLN96P5duRqnCYanXWpuNTctpqoeu0kXJnO?=
 =?us-ascii?Q?GnU6G8I/YzuYMXOgHbohqYRftRv2CZlBC7v9p6xoHI0DrccfKBgRq0s/8cSJ?=
 =?us-ascii?Q?N4pFs+nHZ2C9/yCNEXoohab8P+eliROnZ7gIXFOmVfDncu/Ywnkc+fjI60RY?=
 =?us-ascii?Q?g9eZVeNTaZu6pjbI0KXtD3uHXuVLpxZnXl00x9kyrjz+wlwf2U/4S+764y4E?=
 =?us-ascii?Q?XiedelwvgIiaaipJyIuAw7bx51JSEeUoTI9PdQ7UAzKSrV0OiwtbEGjalfHn?=
 =?us-ascii?Q?RQJuONKGx6y4584vLRPZfSuMxL2SpudOtcHCpqCXrqXfEOUJ/qOuYyhRoaZR?=
 =?us-ascii?Q?5OhcZQQcCD4gPiCY4JVnZIUCyCUmlmICCMkAWy/AC/3ikw8cA4kkR9pKJ9Xx?=
 =?us-ascii?Q?YUacYt5vVwwrSAqb2DQ/tlueia/qMKZDaISP54/nhLQxHu4qKdd2g+QJamfd?=
 =?us-ascii?Q?1rYeLpCJSntGQmCsEjzmlfngbaqDXH1EqNM4nzrcmzygImN2x7UQnofFL65y?=
 =?us-ascii?Q?xkS5+HfhHhIY6uq5CrNe6cu8Nae0SAy2BQKoi5JzjRT2i611UPKDdk7n/TxF?=
 =?us-ascii?Q?x49Dd8UTijd+HHENJhW1OXN0H47FcxG+9JwSlasGJSsfl1MGCWjd3FpW6jrK?=
 =?us-ascii?Q?dX3Es9eORn+Bo1svsFj8vHJHC/1fW653j71TC7aRL3DY+X9gfbjF9VKEPuNu?=
 =?us-ascii?Q?AdN54phPSY67DVu5hW1VevAE8IvWYvBKbXeXuiQD3vAZ8qi2eZjj+stwl/89?=
 =?us-ascii?Q?3Pza+6nSVRH8KywFuVuLfuh4Cx2wvduysRUSMI0Djg16dQo2wbys581/Wj6M?=
 =?us-ascii?Q?vHrloZBppjIMM6CxQHIikNsR0P9jnqsMvuDOo2khpU+AIHf5m8mushv6hr9b?=
 =?us-ascii?Q?X4oOm899vak284QChjEWGRdTZzH9lws+yuUI14eqkGhDheGlhtLPjMprRgJu?=
 =?us-ascii?Q?4wCtQoYWZB0pHlDSQ0WiDB+q68EsOx+Vq6PU/HTHFeLY7Yy19Aa89t4f8FWB?=
 =?us-ascii?Q?MdEkHmWRSL/7uAvF5tA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08961b4-f2bb-4fc8-77e8-08dd7398c2fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 16:50:10.3684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+Y0Pfg+3YldNd7D7vFe+LlvjfHj6uegsP9myy64cwuPVibcdNH+mE2Jk5F+DJS811HsJ6STSCXbTO0GHIMHBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7303

On Thu, Apr 03, 2025 at 05:02:08AM +0000, Pankaj Gupta wrote:
> On Wed, Apr 02, 2025 at 06:15:12AM +0000, Pankaj Gupta wrote:
> >> >> diff --git a/drivers/firmware/imx/se_ctrl.h
> >> >> b/drivers/firmware/imx/se_ctrl.h new file mode 100644 index
> >> >> 000000000000..177623f3890e
> >> >> --- /dev/null
> >> >> +++ b/drivers/firmware/imx/se_ctrl.h
> >> >> @@ -0,0 +1,84 @@
> >> >> +/* SPDX-License-Identifier: GPL-2.0+ */
> >> >> +/*
> >> >> + * Copyright 2025 NXP
> >> >> + */
> >> >> +
> >> >> +#ifndef SE_MU_H
> >> >> +#define SE_MU_H
> >> >> +
> >> >> +#include <linux/miscdevice.h>
> >> >> +#include <linux/semaphore.h>
> >> >> +#include <linux/mailbox_client.h>
> >> >> +
> >>
> >> ....
> >>
> >> >> +};
> >> >> +
> >> >> +struct se_if_defines {
> >> >> +	const u8 se_if_type;
> >> >> +	const u8 se_instance_id;
> >> Getting used at drivers/firmware/imx/se_ctrl.c:320
>
> >	dev_info(dev, "i.MX secure-enclave: %s%d interface to firmware,
> configured.",
> >		 SE_TYPE_STR_HSM,
> >		 priv->if_defs->se_instance_id);
>
> > You only print value, don't actual use it. It should be safe remove it
>
> > Frank
>
> No, it is not just used for print.
> This variable is used to construct the device name as well, in 5/6 patch.
>
> Moreover, it is needed for other SoC like i.MX8DXL, i.MX95, i.MX94, there
> are multiple instances of same secure-enclave type.
> It will be used to identify the intended instance later.

But it all is 0 now. Add it back when it really need in future.

Frank
>
> >>
> >> > This is not used actually, you can remove it
> >> Getting used at drivers/firmware/imx/se_ctrl.c:347
> >>
> >> >> +	u8 cmd_tag;
> >> >> +	u8 rsp_tag;
> >> >> +	u8 success_tag;
> >> >> +	u8 base_api_ver;
> >> >> +	u8 fw_api_ver;
> >> >> +};
> >> >> +
> >> >> +struct se_if_priv {
> >> >> +	struct device *dev;
> >> >> +
>
>


