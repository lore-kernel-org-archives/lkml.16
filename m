Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBC0209F5A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597980; cv=fail; b=YMPzmm3s3jnyLITHb1jRmtmtX/63aH+YkAjCsde/hIgwPjCGLjHDlSczHpzZdVX5aVHaQvEKS3OAHzDE2qtyOCmIfkM3c06207f4hMX6svtTVXeIJVpzkNTjgVs5dq9Ex19ODluPqNYXO2btryNbVnsPWt+PpOnWK5/yp+79JLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597980; c=relaxed/simple;
	bh=xQMhAygEXRIL9y08ayzbco3N1Tuuu9RyRqwvbwgUmuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n+IiHjJD1G7Xoy+uFfRgSCaob0UUnN2GrOIr7zNtjHTGcadPFF+2sONymihnkua/9EWzUNfgqDzs4OFrxA/rsXgZF6/m37uVC1JEt+2+xubm483ncxzTuLRE/OuIVblLlPZ5rpLBv3IN9na5lfyI1JcauDvgtxfafAjxKndOpAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GwPINoDI reason="signature verification failed"; arc=fail smtp.client-ip=40.107.21.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GwPINoDI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtN0T3bUWJW0pOXz6uy8HEMNaCQsAuafQBzklbo2R0Z+wxIqoCthitiWdwgAiP+5eiTZWq9CbFVwm9cEAYEUE5Rj+GHjtjFlKnKiJZBCIWuDnkVlE+NMlhqTv9OxM3og6H49cRysfgziU7d7MjjeK0BbLWKNXF/1HRAB75agwdz7FilKNEEMNLRL0EUHfJ5GceyoLbyUQ8KSrjY+DziVUSqf24MB6CGeO5CCcoWCVEgWLOhHmUza6DWGn0mKd/9s1NwuJUh6XPUiAI6KIa1IwIa2VTYshZJt4J+/LL/bJdcLtZ3yvb+dx/O80oApFBzXNY5aw1Nx1ZFI2QAmJUyy2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5ZCRNBXVUjE4N+y+asPwtGnKJkzrgxs7QSf5Pi8r9s=;
 b=LMjMeK0SiARbkyE5Unl9a8U8nU1fdONeanuaykJT/poVTj8EKhToveMNnyjD5OMdhyqk+x481TmmNTMITn2cmhd39azs5aMFJCtPQiO9zqanBVvzJL1xsygIYNuijfb02zdc1WOaKTSEN+5bQIy/hLASnOWycX4DRZkGb44w3V/+JGww/Ab9lLdsHdnWp/jYtz+WRgKzwNWf9lq38qXF2Rqe18u5BEE1UPDLynIYYeLigRKzZEVmX+itfwmG92eM2SX2QkPxezH0Uk4JdOGDDLoHTkZrQXBAQjoIMy3+Lego7Y55i8XwrG6v8yzinOhiKi2M3j1kxVLFHyf6VmUJbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5ZCRNBXVUjE4N+y+asPwtGnKJkzrgxs7QSf5Pi8r9s=;
 b=GwPINoDIFSr5EGQ0PT61v7WWt9o0IYLspYzgl2nRmGWklFhBPZqBCs68yHZJtEC+fHFHbPqorTsWcUlYBY6pNJGBM3N6oqYC4uwhGxGyL2LN3OGJRrTgOOK1xGDsgEWFIRk67vk6N501nK5eKFG78Kpb71cE4SXYF8+LagDvW04ItwvOWjkX3OfEsW872t5CR5SlVpZuXcYFr5qHZ9f9zRzqfZltKHTd/5jNPCdo9OUO1grkV9KxNfDI5woNzoiRcucFIZuZIlsEbh1KOWEr/Dm5yXh6b0vhOVkfFfDMeWOL6Dkh8KHSD64jgfBxPUJoaaA/is7gK56o27+HjeJScw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10602.eurprd04.prod.outlook.com (2603:10a6:102:490::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Mon, 3 Feb
 2025 15:52:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 15:52:54 +0000
Date: Mon, 3 Feb 2025 10:52:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/2] i3c: Add basic HDR support
Message-ID: <Z6DmUIKn5usytjl3@lizhi-Precision-Tower-5810>
References: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
 <20250129-i3c_ddr-v1-1-028a7a5d4324@nxp.com>
 <e09b50b8-dd65-4636-aa35-42efc86bba16@quicinc.com>
 <e28bda63-bd6f-41db-8c24-43f21cccb386@starfivetech.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e28bda63-bd6f-41db-8c24-43f21cccb386@starfivetech.com>
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10602:EE_
X-MS-Office365-Filtering-Correlation-Id: 927fe99d-a2d9-46aa-4a6b-08dd446ad2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?0QlvvtdcJHgftnFAZza5WHAP3yCQHc4puFTHht/LicH68rbQhu4GpeMJ16?=
 =?iso-8859-1?Q?ObGiPKuazUG+YncHTEUNvSHBAx42EDezsNT0jFFv6p7s4cO7JuuJaK7fU+?=
 =?iso-8859-1?Q?5nCM9rfyiW7YsjGhKuvJgdTgdFXxz9rPJkO3PsJJ7gpwv9W1YxLWrCMtk6?=
 =?iso-8859-1?Q?h9r5cwXiAUQnchDoYe+RETxvZLWs8FptRuU7B27/h7mPCEN2cpW8ZbLNsW?=
 =?iso-8859-1?Q?iS0Dg2xNK2UB5ITig9h/jsP2Y1ZV8xz/lt7/ezFd9eSnzqvKu7OzWzO41A?=
 =?iso-8859-1?Q?evZmSTFaV02meOxZcbHdY49TQraY4OFBO6wukBEd2g3Y14/hA0kSHbEr/f?=
 =?iso-8859-1?Q?HK/YGr4SxIIPBFLk6vYr8Ph9wEt9A5D+f7x3PilNMskYH69c5cJLAJ3ylh?=
 =?iso-8859-1?Q?gETnx7qW44qbIBQDmvqOcI7rq9JNV3r9aoJfp5N07sVYXAQ8+EBjDYhc5J?=
 =?iso-8859-1?Q?CD20c4MMFZLLVMLzKRjmQbzSZ0jTdeV4NVkWf5tcGprrLhBxVtK9WJvImL?=
 =?iso-8859-1?Q?sK7GimkcrD2znozXcrBy6WYbI0MoHakUiAkzXEx8Uz3eZZa48B+q8Qbkwe?=
 =?iso-8859-1?Q?oD23LW26SX8xbXFW5BPBWSw871cd3OkvojHjntir1ktzgGLlwC4QQLo6qb?=
 =?iso-8859-1?Q?r/UdqKOx0mHuQ8mkpaxVry0ucYbCIkHudZ61jpyzSEEvoAsmEA7UImyOg9?=
 =?iso-8859-1?Q?g1QO0QW7k8awya8TwuEovtQYLjhDIyRmJwqW8aVoant3BKRpOE9+PW+3he?=
 =?iso-8859-1?Q?7TZEnWlyh3gBxQKYTWf2/LevJ9fBzj7cRBDpJrzWZZUniARIkKufizbIru?=
 =?iso-8859-1?Q?Jh0Iv4CjzSiVMjCUUJkPX85qLf3IMWjLHpsX6E0cuJPAVi/Hg58Ht4Zkd3?=
 =?iso-8859-1?Q?89QEERj+4qw45OI+nlZ7Ttm8WSLIqYuNXgc2R/WLrvLyNCqKihPa40fl8o?=
 =?iso-8859-1?Q?8WPrK9hwjuvlJxLj3/l6vM4w9GFMYvw8Nr4xxLW0Galr+Gz1/YDd7YnHAe?=
 =?iso-8859-1?Q?oam8Sar9Jw6wkedr+zbIYMLeR8EA02Kgrxiqyy2XehvizUmykWfBE+/Gz1?=
 =?iso-8859-1?Q?RXM1EfIwMYQtDJ5+RjXXiGovCR9ka+1Ykq7s+FarLJ04Uei8kWGGUQavun?=
 =?iso-8859-1?Q?aQhHNGbBcf25cdqx2fBLhaL9/4JHpOKo7HNI4y1Uc/vYin1TtWXat/IzzY?=
 =?iso-8859-1?Q?j+gCddyjsPSNxGd1xPaZCs2CRtLmABt2FOV2pe1csPR8dabHIwx/8e65T9?=
 =?iso-8859-1?Q?diu0rpVMFvEymjvWez18Ya/ulcVrhXDIu0nPV5pBgOriHpIwXcieD54ZQj?=
 =?iso-8859-1?Q?TEmQJh0FlQEz9eUygKn9HcbHVReJ7C17eh/nsF9IR66x7ZUplu0f3nqlK1?=
 =?iso-8859-1?Q?/8LVExCDD6vHiNbxbpiKK8IMOH+gMMGvGYz2f3jY81XS6vrEvCJ3v0Hg2S?=
 =?iso-8859-1?Q?kkeFj6Vws/gvx57gDstFTyYvca7m/G6GR1jZtfp6Oay68NPoWsP06rMGTN?=
 =?iso-8859-1?Q?NLDoPPKPwbymYO0L2XsqW5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?CC3PinDRmOLFiQcNr+gUMkTkz5lVPEHMNqC6njoLoSYfRzKm7f0qQpGJ9K?=
 =?iso-8859-1?Q?CmPtzEHzXxPqIbnPOGh8T3s6pULuDHivXF5EvwqvnnF+3Yj4Behfo1bZ34?=
 =?iso-8859-1?Q?g8eCPl6ilc3jVjCxtL0up8aggB/MQlpRJtHUPD6hQ5iHL1fvB3Wuqqb2Ey?=
 =?iso-8859-1?Q?iwiZX06qG9Owe1ZqntzP7m9EhI7eZ/GRxfi7W6TLKDqdJ6bGqP6DwFJuzP?=
 =?iso-8859-1?Q?f1dPL7A0/21akdT/76p/+WlZNDBJjP5h4nFyBWWlpgiVFpMG/J3LLiQ7Q3?=
 =?iso-8859-1?Q?ZQetE4iPHacUDhHtdlyBmFST5aTBHHjsJF4TAFuIauhsuPeWZTfPttPoVz?=
 =?iso-8859-1?Q?kuKwbVbYF1r4vYMY04qaA8o0lOmyZrjJvTgs0sKmMjUkIRbOOvJE+AUQOU?=
 =?iso-8859-1?Q?J1ZfqWuFM43GRy9w4u6lEZehXwUgfTF+N6BaSvWPhSzVgbfxEkmmURtjpp?=
 =?iso-8859-1?Q?mu58XY0a9BEdCBg7ZqeGgqx6GyAPentIKsSOJkwoPrjtD002Dp1xg9HcuB?=
 =?iso-8859-1?Q?agNUfUvK9LXqs8krSjPqAH9StPdd0e005FSHg6ATVlod9g1XuENxDcHf/F?=
 =?iso-8859-1?Q?OVkJ6Jrxzdnu4quyTL9uQYWZSK8mk8T92O4Gleh0k7hU8xjGeadCyZi4HG?=
 =?iso-8859-1?Q?8ySZtOowJMBeNeCZPG5CgDFMUAOjkzAmAfTVwPotkGx3tvZNeKP5MdfIUG?=
 =?iso-8859-1?Q?qjUMTRm7I79AyoA5aAqS7dGRxYKstIztphdfS9T37m2oCdi/adTtZ0DIxL?=
 =?iso-8859-1?Q?H0Xa50SPo8MYEaSr/ORE0g3rC5MW2CKnPhKGq9pRT/z0a3otHN1AJHmd7b?=
 =?iso-8859-1?Q?ztg9HQB8QNJrwACezFJ+7b4lrLShHjo8E5hMFQu8K7kffgH9kYXMkVrOAv?=
 =?iso-8859-1?Q?v00JYcBeLJoiRmBUeFJoZmUGgDhoY9HTcvNng785Y1QAO0vW0ZNl/P2X/b?=
 =?iso-8859-1?Q?mOE2/ysWSqcUiqsiWDtQIUDhankNZfzYm0yJtydIaurgAL2DmXh8/fd5dS?=
 =?iso-8859-1?Q?xkaXoDFNaEBv7Vlsc1xI6hvYUzCp2sj3GUx7vvyFKO1RNtywcI3jwd2tOG?=
 =?iso-8859-1?Q?2zt9Adr5hvg8Qbvob4pbE3avHF6Ff3DeoU7nbvxyQ0c+V3LKgex2w0M3Kl?=
 =?iso-8859-1?Q?o5knvuTMLgoUJthhmfgHuO1sKGBU7ZqtDvAFWaHImMSUa8VM6Ou+AwvTFK?=
 =?iso-8859-1?Q?m5FQZS7PA2LDbNObeBy3IIY795Lr2ch0K7O4Wh1XZ7yHdEBoejWGVMwnai?=
 =?iso-8859-1?Q?8M9lugCki9PE3nphUlc1EHqcS/w801gTM7/UGuFuRBtNjq+V7nbgNZXa8x?=
 =?iso-8859-1?Q?ygrZDIrZHpbjgBXSoZAvTJYUByi+ZOjw0RAVVngQO6LvEW/HkLmekbIatP?=
 =?iso-8859-1?Q?IN4rAvX1KzfyFuJm9KHLm5S9oVsirYQL86+g/0uHaz1szA53fcJ/UBkQCy?=
 =?iso-8859-1?Q?CTi730YQ2DHQKzrD8FSa12CghJWf5DN/iv2W0vqiieMQfCaNQDIss8Qdgw?=
 =?iso-8859-1?Q?Pyvp31ieKkn6VMtJIHyx+Lg5VpbNJ4jdheG72HDTi3rmrlwNSQhg29q6zJ?=
 =?iso-8859-1?Q?6JoE9HBC7HzuGpf+V+Ec+/2mons9lKSzDO802176e/yEVK7TXMz/q3RMob?=
 =?iso-8859-1?Q?8cjKp3+nUYtFVh3ataHpyd06mVecM5M/O/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 927fe99d-a2d9-46aa-4a6b-08dd446ad2ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 15:52:54.9089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rL5Bc5Z80PbvJhzW5E/MSE8bEvtEz/6xgsuIef+45JUugE3cUw1ylBf3TzcEC/D5fjTkaaTtnWyGsxvB6nEMmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10602

On Mon, Feb 03, 2025 at 02:32:51AM +0000, Joshua Yeong wrote:
> Hi Mukesh and Frank,
>
> On 02-Feb-2025 1:54 AM, Mukesh Kumar Savaliya wrote:
> > Hi Frank,
> >
> > On 1/30/2025 1:35 AM, Frank Li wrote:
> >> I3C HDR requires enter/exit patterns during each I3C transfer. Add a new
> >> API i3c_device_do_priv_xfers_mode(). The existing
> >> i3c_device_do_priv_xfers() now calls i3c_device_do_priv_xfers_mode(I3C_SDR)
> >> to maintain backward compatibility.
> >>
> >> Introduce a 'cmd' field in 'struct i3c_priv_xfer', using an anonymous union
> >> with 'rnw' since HDR mode relies on read/write commands instead of the
> >> 'rnw' bit in the address as in SDR mode.
> >>
> >> Add a priv_xfers_mode callback for I3C master drivers. If priv_xfers_mode
> >> is not implemented, fallback to SDR mode using the existing priv_xfers
> >> callback.
> >>
> >> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >> ---
> >> Why not add hdr mode in struct i3c_priv_xfer because mode can't be mixed in
> >> one i3c transfer. for example, can't send a HDR follow one SDR between
> >> START and STOP.
> >>
> > Is it wise to add two function inside main funcion and separate SDR vs HDR ? so we don't need to change current function arguments.

I am not sure if understand your means. HDR have difference mode, anyway
need add new argument.

>
> I think the 'private transfers' are limited to SDR communications,
> would it be better if we have a different interface/naming for hdr transfers?

The key is what's difference between hdr and private transfers. So far only
command vs rnw, any other differences I missed?

>
> >> i3c_priv_xfer should be treat as whole i3c transactions. If user want send
> >> HDR follow SDR, should be call i3c_device_do_priv_xfers_mode() twice,
> >> instead put into a big i3c_priv_xfer[n].
> >> ---
> >>   drivers/i3c/device.c       | 19 +++++++++++++------
> >>   drivers/i3c/internals.h    |  2 +-
> >>   drivers/i3c/master.c       |  8 +++++++-
> >>   include/linux/i3c/device.h | 12 +++++++++++-
> >>   include/linux/i3c/master.h |  3 +++
> >>   5 files changed, 35 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> >> index e80e487569146..e3db3a6a9e4f6 100644
> >> --- a/drivers/i3c/device.c
> >> +++ b/drivers/i3c/device.c
> >> @@ -15,12 +15,13 @@
> >>   #include "internals.h"
> >>     /**
> >> - * i3c_device_do_priv_xfers() - do I3C SDR private transfers directed to a
> >> - *                specific device
> >> + * i3c_device_do_priv_xfers_mode() - do I3C SDR private transfers directed to a
> >> + *                     specific device
> >>    *
> >>    * @dev: device with which the transfers should be done
> >>    * @xfers: array of transfers
> >>    * @nxfers: number of transfers
> >> + * @mode: transfer mode
> >>    *
> >>    * Initiate one or several private SDR transfers with @dev.
> >>    *
> >> @@ -32,9 +33,9 @@
> >>    *            driver needs to resend the 'xfers' some time later.
> >>    *            See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
> >>    */
> >> -int i3c_device_do_priv_xfers(struct i3c_device *dev,
> >> -                 struct i3c_priv_xfer *xfers,
> >> -                 int nxfers)
> >> +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> >> +                  struct i3c_priv_xfer *xfers,
> >> +                  int nxfers, enum i3c_hdr_mode mode)
> > why can't we pass mode as another structure member inside struct i3c_priv_xfer ? Adding function agrument parameter impacts existing drivers.

If that, it will be possible, xfers[0] is sdr, xfers[1] is hdr. Actually,
I3C can't do that.  we assume finish whole xfers between one whole traction
(between START and STOP).

Frank
> >>   {
> >>       int ret, i;
> >>   @@ -47,11 +48,17 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
> >>       }
> >>         i3c_bus_normaluse_lock(dev->bus);
> >> -    ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
> >> +    ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers, mode);
> >>       i3c_bus_normaluse_unlock(dev->bus);
> >>         return ret;
> >>   }
> >> +EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers_mode);
> >> +
> >> +int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_priv_xfer *xfers, int nxfers)
> >> +{
> >> +    return i3c_device_do_priv_xfers_mode(dev, xfers, nxfers, I3C_SDR);
> >> +}
> >>   EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
> >>     /**
> >> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> >> index 433f6088b7cec..553edc9846ac0 100644
> >> --- a/drivers/i3c/internals.h
> >> +++ b/drivers/i3c/internals.h
> >> @@ -16,7 +16,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> >>   int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
> >>   int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >>                    struct i3c_priv_xfer *xfers,
> >> -                 int nxfers);
> >> +                 int nxfers, enum i3c_hdr_mode mode);
> >>   int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
> >>   int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
> >>   int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
> >> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >> index d5dc4180afbcf..67aaba0a38db2 100644
> >> --- a/drivers/i3c/master.c
> >> +++ b/drivers/i3c/master.c
> >> @@ -2945,7 +2945,7 @@ int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
> >>     int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >>                    struct i3c_priv_xfer *xfers,
> >> -                 int nxfers)
> >> +                 int nxfers, enum i3c_hdr_mode mode)
> >>   {
> >>       struct i3c_master_controller *master;
> >>   @@ -2956,9 +2956,15 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> >>       if (!master || !xfers)
> >>           return -EINVAL;
> >>   +    if (master->ops->priv_xfers_mode)
> >> +        return master->ops->priv_xfers_mode(dev, xfers, nxfers, mode);
> >> +
> >>       if (!master->ops->priv_xfers)
> >>           return -ENOTSUPP;
> >>   +    if (mode != I3C_SDR)
> >> +        return -EINVAL;
> >> +
> >>       return master->ops->priv_xfers(dev, xfers, nxfers);
> >>   }
> >>   diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> >> index b674f64d0822e..7ce70d0967e27 100644
> >> --- a/include/linux/i3c/device.h
> >> +++ b/include/linux/i3c/device.h
> >> @@ -40,11 +40,13 @@ enum i3c_error_code {
> >>     /**
> >>    * enum i3c_hdr_mode - HDR mode ids
> >> + * @I3C_SDR: SDR mode (NOT HDR mode)
> >>    * @I3C_HDR_DDR: DDR mode
> >>    * @I3C_HDR_TSP: TSP mode
> >>    * @I3C_HDR_TSL: TSL mode
> >>    */
> >>   enum i3c_hdr_mode {
> >> +    I3C_SDR,
> >>       I3C_HDR_DDR,
> >>       I3C_HDR_TSP,
> >>       I3C_HDR_TSL,
> >> @@ -53,6 +55,7 @@ enum i3c_hdr_mode {
> >>   /**
> >>    * struct i3c_priv_xfer - I3C SDR private transfer
> >>    * @rnw: encodes the transfer direction. true for a read, false for a write
> >> + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
> >>    * @len: transfer length in bytes of the transfer
> >>    * @actual_len: actual length in bytes are transferred by the controller
> >>    * @data: input/output buffer
> >> @@ -61,7 +64,10 @@ enum i3c_hdr_mode {
> >>    * @err: I3C error code
> >>    */
> >>   struct i3c_priv_xfer {
> >> -    u8 rnw;
> >> +    union {
> >> +        u8 rnw;
> >> +        u8 cmd;
> >> +    };
> >>       u16 len;
> >>       u16 actual_len;
> >>       union {
> >> @@ -301,6 +307,10 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
> >>                    struct i3c_priv_xfer *xfers,
> >>                    int nxfers);
> >>   +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
> >> +                  struct i3c_priv_xfer *xfers,
> >> +                  int nxfers, enum i3c_hdr_mode mode);
> >> +
> >>   int i3c_device_do_setdasa(struct i3c_device *dev);
> >>     void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
> >> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> >> index 12d532b012c5a..352bd41139569 100644
> >> --- a/include/linux/i3c/master.h
> >> +++ b/include/linux/i3c/master.h
> >> @@ -472,6 +472,9 @@ struct i3c_master_controller_ops {
> >>       int (*priv_xfers)(struct i3c_dev_desc *dev,
> >>                 struct i3c_priv_xfer *xfers,
> >>                 int nxfers);
> >> +    int (*priv_xfers_mode)(struct i3c_dev_desc *dev,
> >> +                   struct i3c_priv_xfer *xfers,
> >> +                   int nxfers, enum i3c_hdr_mode mode);
> >>       int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
> >>       void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
> >>       int (*i2c_xfers)(struct i2c_dev_desc *dev,
> >>
> >
> >
>
