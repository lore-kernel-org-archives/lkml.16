Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A682F3656;
	Fri,  4 Jul 2025 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620219; cv=fail; b=d4HaVQB1aVIsTncVdp9FxUsOSleqNkuD0l4KHvrAHxiwuOQq8ZN7UcHgovWzfbO8EwqQfanaqfWGfLbJXHXYwehLt0gxHU0zWD7bhq0wEKdDSpIxz+6XQvOcWQyFZpiFHGk8EJVNelfTInboUhCXJVyLV0Vh2ZAjouxIEo4QU50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620219; c=relaxed/simple;
	bh=ku16wGbyspGo+GMy3lSkdgJM/kAeYWqyJfWnofvOVqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VswVgWWHTUEexP+x956p5998N32V8ogXi/YbOio4T84q666n/cgRu6cISTapUACT2iTl9YcUAZaNVfhcR5aUFpAx3Wj7EMgyAPsigV43u229wpExKw5XF9RrH1sQ7eIftLEH0r8BXp37JPnT/yc29xOLa4pUtbCTTdXvsuz953I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CB0YhMQN; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CB0YhMQN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWmg81hSLNzqoB35xyyUaWXISfRhjnplni07uW7yvtvU60dkA2C2yM0i2eTMl9XSVSAvDPTUhxYz9p4kEn+wHvE+eOI5XtNOYOT54TWUJ4lG8JdrjpTuOQfHL5SvgD5dAlYet3TCVSFOHW3ywNT76n4ojPp9qM/F7P/55FhjnKCXufHfTXlhpqk69LtOErqhwoPELh+7StFkNp5Va9K5S1PZUyRSB/eO1NjEShQpigW+zJDMacNuJsQFf14q5Rk61lOE2YkmYi0SnbhT1MPcpV9KcCq8jaiKbi0Np4w67z3LdGzuvEa1GEVwr9Bi5iTItMwb+1+0jv4iyzTY9tknzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdN/vmAo60zUMab+0+kt98UJlAxkcRsKJ+QfAWLMSmg=;
 b=d/n0hVZPWNcj5XQJbX25PFQ1YoN0uVZh4uO5ztH/mpE9R4jvc1c43EhgUD2QrWfuMfSt3ndS8sdUQX9kfpo7yUbC0r24KfTI4DW5QaAiLMPzzv9Q9E2erdiWDtqd8H50L+voY0SHRUtE1TTV1Ie+4yowvgzHLFiqEU8Qv4RqkhtjV4GD7mVeA2HzjYEE1AW7olb7UKG/gErRT8B0xA1J7x2u9J8HENxOZDhGBYd99W1+4Jxf8bneQiGQz3RNM/uNoPhKXmzVHBh5MoXNAvehAwS0pcXEGSKS8HkGI4oTL+hX9g8q/kj6UauJbsLPt0MVYPLp78kszrPiFAf1NvPlBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdN/vmAo60zUMab+0+kt98UJlAxkcRsKJ+QfAWLMSmg=;
 b=CB0YhMQNmxs/1kQ8jFusAMzBvUsgbGn2B/wZHiTGl5ZDEutdceSBLiGr4qo9JPUeQN6flaq4z8M/9wsu/27patxITsF+pREwjKBIaffG9eHAAiMQcSh6/T76r+fkuWoo41jLm2PMOGcBqMpNKgn840PZ8xBcN/Z7zdxAM9GGqrLqYbjRzf8hGD1pdyhh6wlRJiIwKOK+tsxDdh2z9QpvRalMeNWWIavRqs8H1vPiHTJTFlM2A/l0vZrzP6b3Yn6f4YaIY8K07VvyTlpbxecPkTFhGxEuY9RDGFvlgjM+LCVjS6UBmigHj0ICtKC3xOwjNhoUDgBEta8i0Loy7ACj9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 09:10:13 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:10:13 +0000
Date: Fri, 4 Jul 2025 18:20:57 +0800
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
Subject: Re: [PATCH 4/7] firmware: arm_scmi: imx: Support getting silicon
 info of MISC protocol
Message-ID: <20250704102057.GD4525@nxa18884-linux>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-4-2b99481fe825@nxp.com>
 <20250702-sceptical-caracal-of-drama-3cbc63@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-sceptical-caracal-of-drama-3cbc63@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::18) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: 579e170f-35b9-4028-0a62-08ddbada9564
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dJKldE7qpWM+0bi7S3KZbnZA2ImZlnkuSyc3+f2+p9WtT2MthglesipysQbj?=
 =?us-ascii?Q?2xkwtMXsn3LWYp8oEEdsU0rGfiUs2Mv9ZJIYG0tDEK9VTNIqDYdQGn+MFaWL?=
 =?us-ascii?Q?B7xGNX83ZS+Ezc668jobGTuXJXPaAvDNNG183tR5NadKGKuL4tR1S7c1B1b+?=
 =?us-ascii?Q?QDNGh35+C7dhMNkzuikkT4t+uUYkGKbvGzh0O1CXUuuDtai8c+3pfBC8r6LT?=
 =?us-ascii?Q?M0NZYoBBAVsb7C0e70pS8zq300KMVDWpy0aezGfqohdOtoEIRd7nm+0p2yA6?=
 =?us-ascii?Q?LOrAVrDSFLUEijvLMRV9t4qiHVnZz+l0I2zl/aWOOReurchrQ7rxTo37H29g?=
 =?us-ascii?Q?+JeCrOAw4y/Q2BQJPVZiOHUUAoWk3Tnv78CMheYeWV9WVzlIcNj4iSSLh8FY?=
 =?us-ascii?Q?UwH3xISRPLImbCeY6pwNYQFffM6ZQmr7fjZOos0OehzKbKLaZXi++D7FMD1O?=
 =?us-ascii?Q?RKvhwjF+iMp3/pYZepOTV4HzYu6epmj3wGv1/8rTnbkl5Z2aY6u1JRJ6lBEd?=
 =?us-ascii?Q?8qys3QHJff4Sr2i9awVcmGInJL29kgCDPa8bWtKzPXH2rym8QlzTwSe4+59Y?=
 =?us-ascii?Q?bELW8K7vG1ybve+3VrTzfUAod9L3CGss989fSdLosSFRssy8sJD63ZVzyJwS?=
 =?us-ascii?Q?SSN6X14Yrg90au3YE/V3lJrNEEgSsZtPRv2CKCQ5WgPr4jFIaODABs1VBHyF?=
 =?us-ascii?Q?zPu+AYiIhbzSaD362oAVi41wm6eg4oEtzlCCrXk0puRIIZZjndIZTbbY7y+j?=
 =?us-ascii?Q?e+eCsWZw3sVwhdYRcGBTWbvUpBFvSA+FM0bi0nmpfWfMzTEmfMf1eWCNzpeE?=
 =?us-ascii?Q?8FECj82Dyw+nUYIq42PMrTtk2yraui6MNjI3pIO5C8SwAoHTC2qlkdcAbg/7?=
 =?us-ascii?Q?LKl2JOt4r3ZusnEQ/a4dp8KU0/9UVNjPS4ilOEnzht6ZVMDWcg+dg1t966OX?=
 =?us-ascii?Q?DbCK178Ui3tlziJcnIliCFo2/0GaLgTGMODZGXXiGg7v3ZWhcY53mnFZeqQ/?=
 =?us-ascii?Q?+Q+y35GFdc0Tm7l1imsQtfl0PngdkzRNbyI+i2mwotwAu1fMH0iq8LTziRUG?=
 =?us-ascii?Q?Cq+5OxNJ6smX1OaHwfuJ1Gl/l5e6k2/eXvUC4kTXce8ZTEPqyzKFZ4KN3qf+?=
 =?us-ascii?Q?3TTzedjtSa62O2MLc/axScs8BepuH81IxrUBrAySPoNqg5JMiW3I4NU96ZTM?=
 =?us-ascii?Q?vtJqxSJzMf9j6824wjQyBAQfLe/XKhpkUSMHEWNW+8tTOfwKorlL7JAurFjF?=
 =?us-ascii?Q?sdX+SOeTi9DlYP/b3yA92/pNzMvyk0Fb2pHbuPyWtVevLpG2kBf3DyG4hkBY?=
 =?us-ascii?Q?6kDpQUGRe+ZIhgN6h8lwDxJWo5ge0cFET92s+3rWLaQWXWs1os38M3Uzuq4k?=
 =?us-ascii?Q?ueSUBigaI4yxz8pnFfSa3eSnTLF4Pn8ysEJ+kLMccREEqram2y+zf3/tTkoM?=
 =?us-ascii?Q?VAntu/CL0krALHJmQasw6oloHAizGcehmap7fLAl4pAm7tG0cA0uQg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LjjXXmXAy8CDHtd4OGs+lWmPBNvM97BZV3mj1EevO7dtVnHhrRjEKxUDhw87?=
 =?us-ascii?Q?XygUZOy3Go+8a7zVplKvpdhcO/mzXgWisLYncHNXHunFbZCXD41x9UuNpBen?=
 =?us-ascii?Q?bG0Jlxcjd4JQRJMPR9pF40Q6lO9w8gw8PYoV2DqPYXjxI1BMstfUtzCT0dEI?=
 =?us-ascii?Q?5ZW80hhfMoSXBXF+JP/CyyPhdNkF3AuT1n7eKXG+vS57KW1R1h2+zTd0ZW+G?=
 =?us-ascii?Q?oeklC1g7miDAIkxDOc6nMZemanEX053r9PEF5sWpovMLwDRiSyGeBgo0owJ+?=
 =?us-ascii?Q?YSaTZk4OTgOW7EFdja9jwEWgSisYYBi1Abpi4jxf8T9FD/wMwex0taxMsOUA?=
 =?us-ascii?Q?6aG6/LRiRREx9XN8s062tK1sRfdd5jDfmM01cLxzRcAvHD/Z+hTNWzfqhLOO?=
 =?us-ascii?Q?sBu58aKDz/lbQVKPBO0j7SYCJHJmqxS+dtwWB4PUE6jxQ0KzyvfFx77iBfBF?=
 =?us-ascii?Q?sdhQU2n7p/vyQvISMDrGXB/sM3l967rmKLr/AXisOG4EB3mmMPqAGMTVdcWG?=
 =?us-ascii?Q?zdDqvy5vA1xFh46irrgwh5lPBjPBk+U8JPusDys4lSkTMK8wC9/6dXZGRG7F?=
 =?us-ascii?Q?bwZonyUt3NXapWZiWSB2O5ypCW+xGd+7wy6kcOepqvwBJ0t0dlwzcHSfiAuI?=
 =?us-ascii?Q?8ye6JWsk8791PlUFab3kJycbPTbN//ef3y5dVt9sSdgZdsMM6Xsn1t+gv+zW?=
 =?us-ascii?Q?IwUeGV99+aFR0rCsi7e7H/deHiAb4luDZ9Higd/CHg9ARqpJgDyA1e7WqQAy?=
 =?us-ascii?Q?b43fIEOqiQOFH1WyW5NNyLEEwarO9R8fJPSX98mEcbipQv7JwkN4ESy/qghf?=
 =?us-ascii?Q?JgDypAH3a2bjJ9273tsKq2Vr17MltuacpL8tjK8RbmYX532ErPk9+vz84C46?=
 =?us-ascii?Q?qhgehYrYFc0DuWqd8YXuLv6gqNxK7bHbBJwoAKlpK6GnNdoUJxBlZoidMnZU?=
 =?us-ascii?Q?GtYG5s2XP/SeIi+J+WWUbgaWnMgh+kQz4lAzt868vgy7HM23tBuqqJS33ar3?=
 =?us-ascii?Q?6mCIExzhptfNYofAdjiJa/r3eS72SP6wTlFQSzV1OIhxFYo0SKKYyymLPn9K?=
 =?us-ascii?Q?CBOMTLdV8AkZN7NGuzFzq8K7KvGRNFiyKTIEl41MnX61BSBDRxGA0AsZ6FEe?=
 =?us-ascii?Q?zl0ZNrEnhBvDmqR+4BdkgD3QWxjjcHFAbzdlGhLkO89L3do2hRuPydtRPEFL?=
 =?us-ascii?Q?ccHiSbEFojg0aF+5aWZxirQ5C16iW2Zla19JHsNygXufbnQpRPv3MxgQzY4u?=
 =?us-ascii?Q?Mn/qn/6VQ7XCcuh2Gm2Mc+NISHW36EzgHgbKXYw8YzUSt3wkqGz3YvkA+sB4?=
 =?us-ascii?Q?n2mnkAuy/F/rorsQQkKtG/+pHpY4+LzA1CVX+rcJYm0/FMOlfAp5Ollp84Lp?=
 =?us-ascii?Q?79R1b9TE37bUVrWPVUiv7gF1IgH1wnDpWD56xFUP8AwzrLl2ycmZNNWNTU+2?=
 =?us-ascii?Q?XFoHiCYvb1qUlbgv9s9J5coUmm55USdWWJoCpneCJQ2RYVk2bXWPf4wVaXk1?=
 =?us-ascii?Q?gjR5EC7y+L6AzuMmdeeElaycrFq+fRknfu8r2leDcR5VUQ14jJHm/2tuuvX5?=
 =?us-ascii?Q?A3Le3yXoPhTqNC+qjWW9JuiIDhQpoj6r2vSGeF8s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579e170f-35b9-4028-0a62-08ddbada9564
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:10:12.9942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhzZsOwMGYWypt75qv2axom/AKPuD9MbGKXOqHaimrb2mL62yO+fGHT3ni4gsAiIYbkm6OO0bzbnITsXSjjWOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041

On Wed, Jul 02, 2025 at 04:22:11PM +0100, Sudeep Holla wrote:
>On Fri, Jun 27, 2025 at 02:03:47PM +0800, Peng Fan wrote:
>> MISC protocol supports getting the silicon information including revision
>> number, part number and etc. Add the API for user to retrieve the
>> information from SM.
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 34 ++++++++++++++++++++++
>>  include/linux/scmi_imx_protocol.h                  |  8 +++++
>>  2 files changed, 42 insertions(+)
>> 
>> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> index 8ce4bf92e6535af2f30d72a34717678613b35049..d5b24bc4d4ca6c19f4cddfaea6e9d9b32a4c92f7 100644
>> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
>> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
>>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>> +	SCMI_IMX_MISC_SI_INFO = 0xB,
>
>Again, this seem to have slipped through in my initial review. How is this
>different from SMCCC SOC_ID interface. I am OK to have it as part of your
>vendor extensions and be here in the kernel documentation. But I won't
>accept any users of this within the kernel. Please provide justification
>as why you can't use the standard SMCCC SOC_ID.
>
>So, clear NACK for adding this support in the kernel for now.

What I do here is just wanna to let
linux could print similar information as what SM shows in its console:

>$ info
SM Version    = Build 677, Commit 49a36aaf
SM Config     = mx95evk, mSel=0
Board         = i.MX95 EVK, attr=0x00000000
Silicon       = i.MX95 B0
Boot mode     = normal
Boot device   = SD2
Boot stage    = primary
Boot set      = 1
ECID          = 0x7BADEECC000001D40001300963E636F1
PMIC 0 (0x08) = 0x20, 0x09, 0x20, 0x00, 0x01
PMIC 1 (0x2A) = 0x54, 0x22, 0x00, 0x0B
PMIC 2 (0x29) = 0x55, 0x22, 0x00, 0x0A
Compiler      = gcc 14.2.1 20241119

With soc_device_register, dumping the silicon information needs use the
other sysfs interface. Here with this patchset, reading one sysfs file could
dump all the information.

But anyway, ok to drop this patch.
 
Thanks,
Peng
