Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013011.outbound.protection.outlook.com [40.107.162.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6FF28003E;
	Tue, 10 Jun 2025 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555320; cv=fail; b=Yzwq+cobfVwzHzFRMEuE2tNJ+J8gen4Mh7Z+46EvCK+2nMXGZ5OmP90hj+H1pDQBzQSkfp2lQiapR8+Eku/M7KRb1xwXkapplCun//1Gfx18Hm17SYj8THios9y+gs4owTfZtTxxl9wKK416ExsXuzDebTrpRKj/BHLzJcq71UY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555320; c=relaxed/simple;
	bh=Rs4xnIZjd+ldrdOnklqOAso0WkozbBsvYrtBLKDVFPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X7g+G4YHoJSCAppWzKIv/GMLgS+VsV13230z090LR0IDwxeG5pp93kcJq0l/dk3yCBsKjdU6nruIAbCea8p9NPA/VVou+U3+3UzkzGN4hITHQK6i0f+XoUe/RAA+JM2QIJTF8wFoJsR9uK96GxRQMH+qqGcS5dwwy7vjm87/j6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nrkJTF5M; arc=fail smtp.client-ip=40.107.162.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nrkJTF5M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SE/a9sQNEM8g1n2agziV8F12AhD2AN+IJXUSZewAHLaiswUGl5kPP63uhUXw48tNQ7yfjg6fwCQ1Y4XWNgFc5LSjz2EVIX+/algeqC4KmVfeOXldZZRE4e4EbJ42o0MYLo1CnqMau//TmJg7IaiXiIbxUvM+WEAGz6lRr6vrxvKgK9vcUG2dgzbtTbvBLHHrDvb7Vm/BIMccHJ0MmUKAIRayYKAC4hPd3tMdrV+0DL4ne/Go1GG9w+8mR1S+01ub8kgOsWH+7+SWyOREbBbSJaxQSvV++ipJfKTpfoaTUYt92+Ngo2djY/Ri2OA1jTmEhEQXV7CAkkTUtJShq8Purg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RP2Ywl/A+X9Nyx+k75+cftqi5I1sQrob4tF+iLwBsKw=;
 b=R/rFrHd2h/drMXd/9whJTC8SsP8vkXzAnDddmRku7Baafm8zLGUud/3AzUw4rMjoIvvMQjrpW54SrlVtJDKo0WNbKeBcGcCTRr1bDMxifDWpKGHyrAZey10rNgxFBIR3yqOm8xSEv+xYzWrgFQgY5/q+OeXgECzhRswDvVSEmqCeVclrsewaEevgSn8650eY0eISH+n9M5wzKzBfmDhe5xuzBVFxLv+gy/v2OD1XVO8N9mGqQ/+mis4gnxcy2oVsr/xGriZ4g4L2lu0ANjHZtbMgZtzWHb3oCVhDDoN2COL17vhQQyu6KYeob+zM75tzuD2/NUxvxgNQdDr/IRZO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RP2Ywl/A+X9Nyx+k75+cftqi5I1sQrob4tF+iLwBsKw=;
 b=nrkJTF5MhMlXFSUG3Uud5vmmfth9HfDQJ3Js6HKqS370coHdVDdCo1fQ9k6nBiMEHjcLG8sghwzoNRpuAbp+ekar140W8uLsd7ZC4rk2dlxG2H+B/UeRyhy1MX7oxJ5brzEfdBZfpmBEonwY5BuzW/E6ZVPy/fh29VhF98pOX7xK4QErmxTIUbwSaeqL+xMa1kiTU7+7/W2rgz8zGEB+hygNJHIG8hs0y6epsViKvq4WNKPjqN3jFcQUAlWtQ0893XE3PcI6uHEYhKLpnqrUzsyptu2DVoZ01v4HDHNJpIxHNYo9GPt7Vpp31UbTiSXO12X5TLX2clN5AiKmSw/+ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PAXPR04MB8476.eurprd04.prod.outlook.com (2603:10a6:102:1df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 11:35:15 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%6]) with mapi id 15.20.8813.021; Tue, 10 Jun 2025
 11:35:15 +0000
Date: Tue, 10 Jun 2025 19:30:31 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: John Ernberg <john.ernberg@actia.se>
Cc: Shawn Guo <shawnguo2@yeah.net>, Peter Chen <peter.chen@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <k6j2za47cp4ccyfkevwpx2x5s4bjrxxqhqvteyspbf2n7yxcff@ccztqeuhn2di>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEbstxkQmji4tfjf@w447anl.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEbstxkQmji4tfjf@w447anl.localdomain>
X-ClientProxiedBy: SGXP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::23)
 To PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PAXPR04MB8476:EE_
X-MS-Office365-Filtering-Correlation-Id: e76b11b3-b0fd-45aa-dcdc-08dda812dbdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?reLDMl//Th/zkVFx4LkZMC8BjzW54PBPI7QYosFLjCErgiZpn3pIqtKG9R7h?=
 =?us-ascii?Q?00ZPxpCFhmsm3aR+NlPrQ5CPWTKL/ailvuJoVwhgHz1c7Zwj/rxQFL9T/o/b?=
 =?us-ascii?Q?3eu/tr+8E6j6VBcTkR43/zUJ224nmAWHvjTYw6Dle7tB1rtpm2Eq9i5ahL30?=
 =?us-ascii?Q?T4Fy0IdRaRNGmf22+dTdrYULZtVXfVsSsTWnAgxQSbLvcV8lKoonpsEiHNvo?=
 =?us-ascii?Q?bhF4LXu98b0QnD6QZ54VUNAwidO+ioXvqOFyT6RDgrPC71pgv12JmLkYkXtV?=
 =?us-ascii?Q?vbYLmJyHh/Y0ecQhtVMDDipW7r3tk5hi2unVrhmsJ+eL4LPwyou+XTNODLVd?=
 =?us-ascii?Q?nDe+HjNrfhTbCehTtyVO4jxMYzq6HQzukDjVgBSoqIHM8PG6Q1coiT26d2Yj?=
 =?us-ascii?Q?IgGM+ksgZoFFEDiVhJgu35iGIVw4BwmuGvm5qCvTkRb77mOYaIRwCFSyFhGO?=
 =?us-ascii?Q?v8XxRrwgTBPTKy+dUSdNBwAwk9+fX3Mabp7Ir9AT42Vd5+Qh0douVk+gcUOE?=
 =?us-ascii?Q?1VsyRZ2FjNDgQpmRioqqRDkyptGkydUmM2N8sMNkAB3WPCiKmmBNNqWBkLem?=
 =?us-ascii?Q?jhw9fqf6DMgdzFnEqJd1aJ12wTRjoq7tXSx29/SjPpsg0TNHTcTZ9oH3voJQ?=
 =?us-ascii?Q?fbOgtG0Tw2lV4b244jFAU2g7pw5tOcXMKVPt2j7MvveLj+G26kRz0MFHmmJU?=
 =?us-ascii?Q?BY+LwdjsaJ+/hpUwDe7TLajWiKSu6Si3GdwvLnyRKxgy2itedr3cRSB//lrA?=
 =?us-ascii?Q?o8NPl7aAzAulHDzupEKJb6SUYwr7X9q+tHpWhmUHI4VAcwRFJQV6ExNztjuH?=
 =?us-ascii?Q?XpvWNbYHaQ9QHKPqDvGUiQuy4tu4l+Ji4Ij8rUZot/p02Ol4q963Do0cTJXJ?=
 =?us-ascii?Q?ULCOnNZAlcVfpZjkyOn60eEDVH3yo+K2BalbuEdlaE7JINvxj4OrbnsJ2moy?=
 =?us-ascii?Q?UHqhipxmnCH/lSo3081fsm+WHU8qECzJHLdVX2iUFDEV/OUs+9w14iaDuEDa?=
 =?us-ascii?Q?98GuNtlR+aNNXKCKNembfqDlOfO+MRv0P9jnC857PkP0bsEexeBHhvd+Ft61?=
 =?us-ascii?Q?JlM3Vr62gLiDnwWeJBwTikHmILd4qnq1fQ98JjMBb2AUuIpheMoBvRUunexV?=
 =?us-ascii?Q?FH+ELGR3NZvNxZQWWo64+2mQtNRtcTyMcZ4wOTi/IyNuTvAPTT6Lwd8v0iUV?=
 =?us-ascii?Q?/d4R1+4AK5d7fXwMqqwTHu1u0O/ZbJkXclwb+vsdYP71KxkiLsR9LmmfZu4C?=
 =?us-ascii?Q?0ZLO/DBRQ1hgknX3ofbd/0sxspVmKkXzKChNQxTdk4HuSrKGTB0VCXh4my1r?=
 =?us-ascii?Q?4G0XOxy1peKhmXfQ+aI34ZLwJHosi9DwTffs2naBkpOKzg+YEzRK1D92zheS?=
 =?us-ascii?Q?vuz1OJ249xH3mxUO3L3HN64Q5D4gkOwN7FpTTAecnAUDAYxbnlux5DQvWNaw?=
 =?us-ascii?Q?2txcoZ4wc90xQCkIsmImMmFfrLcfnsggnvi0Rs6/SEIYcXUGopPIQt9iRqcg?=
 =?us-ascii?Q?PsPbQ38VUS4IBWU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MgNEGQHbYbJxAc1xeVZ0QINxz/lDBL//EEFMj6MdCRCayIuZGv99V1nllJMp?=
 =?us-ascii?Q?2yoNYaVobu6xAQDgpWjKh0DuMPVlts2O7GoKuQJMibh5+HCyO5m/m90u56GG?=
 =?us-ascii?Q?cBJCVGJrYHYBcY17EvLa3agHv3soy50cMSSLFIklgXnOls0ecCYtHMrGzTEh?=
 =?us-ascii?Q?BI5nzPAriwZyMBXCrf/oDCKftI9yJi+RbM3/VgmIzRhNR4SOoyisEEFvE/HS?=
 =?us-ascii?Q?eOpcnT8wJ2H2K+tHs6bTfwnkI8UFPKBHxx2k6LqD0of88nUH60U752JHNPwm?=
 =?us-ascii?Q?XhIFrdjV3SdBUDgaoWy/1rw+8wVyLN8Sw4YjyS8ZIprFfgGXRllKMjC9a8s+?=
 =?us-ascii?Q?+Ywfb0ATWBclTIKcuqfUc6txtJZPRbWfIGH/v5VHgC8rnk1be3vFXq0C0C/t?=
 =?us-ascii?Q?/tsrZANzE4zA8W8VqJcYtbEu8GyMLqlo01mu2qOKd1+3LfZFUSNTnnFZZn5Y?=
 =?us-ascii?Q?4aHM2ms6yfDgszvePI0cWJ0OU8TwZ84PRa9hrRjNCIevNqhZbLA5GWHH90hF?=
 =?us-ascii?Q?LayuRq7X4yl1JrnEMrvPhpyLZqPPVAzQUq2XIQV1bL0906r7STfBJSnOGW98?=
 =?us-ascii?Q?X7z6zAUAhbZniJg4w3jYnprfusG0G7xhzv5rVoma7fBoJtSSuoPwzfmkjNgs?=
 =?us-ascii?Q?uEEpYXS5p7JuA6IG44zajHMl9XgrqoK93qVcnBy225ygrAgbt/DI3YyzVvRs?=
 =?us-ascii?Q?G21DH0sB6Kxi5tdc2h+dgpReDdwRt1I++BfeveYiO5do0u8frMJP80vSpopR?=
 =?us-ascii?Q?FIHly6Ov73+86bc3Ep192mnKDM81GPmKaye4VIL9v97gHf7G17WeZobh/m6E?=
 =?us-ascii?Q?wj663z53vzcmDCFT8yxyOqsEQMfPRqcHsnVafdI6q2odvGhji59VV3VyBvE0?=
 =?us-ascii?Q?wz0N6KMSZsx19vG/YQzLTiPuEUYMTmUjjLffZhxSO/9WZKDhgEI7YCkTSqfr?=
 =?us-ascii?Q?ijSUK+/kqTCab+rpzigmPzd7KzkkLAT2QaLowCoPQ+T9VClDZbsQ0Fg9uu5R?=
 =?us-ascii?Q?5PDpW75MCFq24sFQP5JdQekxBBxX2P60t93gKUT4I+/GMm//Pxa7JrJJeFsM?=
 =?us-ascii?Q?Adu4hfFb2zFmxhaEt/JP7H8rqQLSmbD0eXeYKfFwxAuI3tveTCxNn4eSOESi?=
 =?us-ascii?Q?AxaBtv0WOdmpt7oU4VkwyL4U1WmbF2OKafEsxTxZ+QG2I+tIezSo1j0DEOqd?=
 =?us-ascii?Q?7meYjX6s5HKY3+VPXyErHdpGaOBgrTZuxVvdj30uR0BoHmTPS7uCJdovPXXB?=
 =?us-ascii?Q?7+wfTOZtbdszpSjOZBaUlHu3Uvl6H1b+iJQBmuR/CFrgreQXwPUOsS13erXG?=
 =?us-ascii?Q?Cy6U1Jrjrc7r40ZtZQWfV6Nk3Ol1lQFbvv9uEiUdhYfwO6ISvmay/4od0IJs?=
 =?us-ascii?Q?KDngcaFn/tu9gWL8KHOrOM+wpMku34EuV7rdaa4V8rr32mxq+tUrKHWNzRj6?=
 =?us-ascii?Q?shhq5oYB2/d9byFTR24D3TCnvW++GtWDrTwNlLZ9suLNR2d9z49a8Xs5Lut8?=
 =?us-ascii?Q?u80ghDlGmCYpnX6do2+QpkD3AN3r7LkIS2ZycdNe8nsxZ+71jtDxYHzQOXow?=
 =?us-ascii?Q?VDXj65YlS4n70WroQO06VY95daOhigKf3twudqbY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76b11b3-b0fd-45aa-dcdc-08dda812dbdd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 11:35:15.2667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+n7352/ZZ176h8cTSD7M/vqXONZOcHoa0Fgp1QeSpEZrDgu3q7S+82gEcbKLRUNXPOK3IqIpJB1Mr0vAindSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8476

Hi John,

On Mon, Jun 09, 2025 at 02:17:30PM +0000, John Ernberg wrote:
> Hi Shawn, Xu,
> 
> On Mon, Jun 09, 2025 at 07:53:22PM +0800, Xu Yang wrote:
> > Hi Shawn,
> > 
> > Thanks for your reports!
> > 
> > On Mon, Jun 09, 2025 at 01:31:06PM +0800, Shawn Guo wrote:
> > > Hi Xu, Peter,
> > > 
> > > I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:
> > > 
> > >  - USB gadget is enabled as Ethernet
> > >  - There is data transfer over USB Ethernet
> > >  - Device is going in/out suspend
> > > 
> > > A simple way to reproduce the issue could be:
> > > 
> > >  1. Copy a big file (like 500MB) from host PC to device with scp
> > > 
> > >  2. While the file copy is ongoing, suspend & resume the device like:
> > > 
> > >     $ echo +3 > /sys/class/rtc/rtc0/wakealarm; echo mem > /sys/power/state
> > > 
> > >  3. The device will hang up there
> > > 
> > > I reproduced on the following kernels:
> > > 
> > >  - Mainline kernel
> > >  - NXP kernel lf-6.6.y
> > >  - NXP kernel lf-6.12.y
> > > 
> > > But NXP kernel lf-6.1.y doesn't have this problem.  I tracked it down to
> > > Peter's commit [1] on lf-6.1.y, and found that the gadget disconnect &
> > > connect calls got lost from suspend & resume hooks, when the commit were
> > > split and pushed upstream.  I confirm that adding the calls back fixes
> > > the hangup.
> 
> We probably ran into the same problem trying to bring onboard 6.12, going
> from 6.1, on iMX8QXP. I managed to trace the hang to EP priming through a
> combination of debug tracing and BUG_ON experiments. See if it starts
> splatin with the below change.
> 
> ----------------->8------------------
> 
> >From 092599ab6f9e20412a7ca1eb118dd2be80cd18ff Mon Sep 17 00:00:00 2001
> From: John Ernberg <john.ernberg@actia.se>
> Date: Mon, 5 May 2025 09:09:01 +0200
> Subject: [PATCH] USB: ci: gadget: Panic if priming when gadget off
> 
> ---
>  drivers/usb/chipidea/udc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 2fea263a5e30..544aa4fa2d1d 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -203,8 +203,10 @@ static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
>  
>     hw_write(ci, OP_ENDPTPRIME, ~0, BIT(n));
>  
> -   while (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
> +   while (hw_read(ci, OP_ENDPTPRIME, BIT(n))) {
>         cpu_relax();
> +       BUG_ON(dir == TX && !hw_read(ci, OP_ENDPTCTRL + num, ENDPTCTRL_TXE));
> +   }
>     if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
>         return -EAGAIN;
>  
> ----------------->8------------------
> 
> On the iMX8QXP you may additionally run into asychronous aborts and SError
> due to resource being disabled.
> 
> > > 
> > > ---8<--------------------
> > > 
> > > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > > index 8a9b31fd5c89..72329a7eac4d 100644
> > > --- a/drivers/usb/chipidea/udc.c
> > > +++ b/drivers/usb/chipidea/udc.c
> > > @@ -2374,6 +2374,9 @@ static void udc_suspend(struct ci_hdrc *ci)
> > >          */
> > >         if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0)
> > >                 hw_write(ci, OP_ENDPTLISTADDR, ~0, ~0);
> > > +
> > > +       if (ci->driver && ci->vbus_active && (ci->gadget.state != USB_STATE_SUSPENDED))
> > > +               usb_gadget_disconnect(&ci->gadget);
> > >  }
> > >  
> > >  static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> > > @@ -2384,6 +2387,9 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> > >                                         OTGSC_BSVIS | OTGSC_BSVIE);
> > >                 if (ci->vbus_active)
> > >                         usb_gadget_vbus_disconnect(&ci->gadget);
> > > +       } else {
> > > +               if (ci->driver && ci->vbus_active)
> > > +                       usb_gadget_connect(&ci->gadget);
> > >         }
> > >  
> > >         /* Restore value 0 if it was set for power lost check */
> > > 
> > > ---->8------------------

Does above change work for you?

> > 
> > During the scp process, the usb host won't put usb device to suspend state.
> > In current design, then the ether driver doesn't know the system has
> > suspended after echo mem. The root cause is that ether driver is still tring
> > to queue usb request after usb controller has suspended where usb clock is off,
> > then the system hang.
> > 
> > With the above changes, I think the ether driver will fail to eth_start_xmit() 
> > at an ealier stage, so the issue can't be triggered.
> > 
> > I think the ether driver needs call gether_suspend() accordingly, to do this,
> > the controller driver need explicitly call suspend() function when it's going
> > to be suspended. Could you check whether below patch fix the issue?
> > 
> >  ---8<--------------------
> > 
> > diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> > index 8a9b31fd5c89..27a7674ed62c 100644
> > --- a/drivers/usb/chipidea/udc.c
> > +++ b/drivers/usb/chipidea/udc.c
> > @@ -2367,6 +2367,8 @@ static void udc_id_switch_for_host(struct ci_hdrc *ci)
> >  #ifdef CONFIG_PM_SLEEP
> >  static void udc_suspend(struct ci_hdrc *ci)
> >  {
> > +       ci->driver->suspend(&ci->gadget);
> > +
> >         /*
> >          * Set OP_ENDPTLISTADDR to be non-zero for
> >          * checking if controller resume from power lost
> > @@ -2389,6 +2391,8 @@ static void udc_resume(struct ci_hdrc *ci, bool power_lost)
> >         /* Restore value 0 if it was set for power lost check */
> >         if (hw_read(ci, OP_ENDPTLISTADDR, ~0) == 0xFFFFFFFF)
> >                 hw_write(ci, OP_ENDPTLISTADDR, ~0, 0);
> > +
> > +       ci->driver->resume(&ci->gadget);
> >  }
> >  #endif
> > 
> >  ---->8------------------
> 
> I tested this during my debugging and it doesn't work because suspend/resume
> callbacks on the gadgets are designed for USB triggered suspend/resume and
> not system triggered suspend/resume. Meaning that the link will just be
> woken up again by the next USB transfer.

Okay. Thanks for your feedback.

Thanks,
Xu Yang

> 
> > 
> > Thanks,
> > Xu Yang
> > 
> > > 
> > > But it's unclear to me why the hangup happens and how the change above
> > > fix the problem.  Do you guys have any insight here?o
> > > 
> > > Shawn
> > > 
> > > [1] https://github.com/reMarkable/linux-imx/commit/0791d25578cb0e46fd93ae7a3c36ff7a424f3547
> > > 
> 
> I didn't find the missing lines of code that Shawn found and instead ended
> up looking at why the UDC core isn't suspending the gadgets when the system
> is going to suspend. Because to me it feels like a job of UDC core.
> 
> I ended up with the monstrosity below that I have been intended to send as
> an RFC when I'm done thinking about it. It currently applies on 6.12.20.
> 
> But since Shawn also ran into the problem I'm including it for the sake of
> discussion about what the correct path of solving it is.
> 
> Best regards // John Ernberg
> 
> ----------------->8------------------
> 
> >From 3c1d167f1eff0bd010b797530e3d03f6939db322 Mon Sep 17 00:00:00 2001
> From: John Ernberg <john.ernberg@actia.se>
> Date: Mon, 5 May 2025 09:09:50 +0200
> Subject: [PATCH] WIP: Suspend getherlink on system suspend
> 
> ---
>  drivers/usb/gadget/composite.c        | 68 +++++++++++++++++++++++++++
>  drivers/usb/gadget/configfs.c         | 53 +++++++++++++++++++++
>  drivers/usb/gadget/function/f_ecm.c   | 22 +++++++++
>  drivers/usb/gadget/function/u_ether.c | 34 ++++++++++++++
>  drivers/usb/gadget/function/u_ether.h |  2 +
>  drivers/usb/gadget/udc/core.c         | 29 ++++++++++++
>  include/linux/usb/composite.h         |  4 ++
>  include/linux/usb/gadget.h            |  2 +
>  8 files changed, 214 insertions(+)
> 
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
> index 8402a86176f4..f1ed1db1e1d0 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -2669,6 +2669,72 @@ void composite_resume(struct usb_gadget *gadget)
>  	cdev->suspended = 0;
>  }
>  
> +int composite_system_suspend(struct usb_gadget *gadget)
> +{
> +	struct usb_composite_dev	*cdev = get_gadget_data(gadget);
> +	struct usb_function		*f;
> +	int				ret;
> +
> +	DBG(cdev, "system suspend\n");
> +	if (cdev->config) {
> +		list_for_each_entry(f, &cdev->config->functions, list) {
> +			if (f->system_suspend) {
> +				ret = f->system_suspend(f);
> +				if (ret)
> +					return ret;
> +			}
> +		}
> +	}
> +
> +	if (cdev->config &&
> +	    cdev->config->bmAttributes & USB_CONFIG_ATT_SELFPOWER)
> +		usb_gadget_set_selfpowered(gadget);
> +
> +	usb_gadget_vbus_draw(gadget, 2);
> +
> +	return 0;
> +}
> +
> +int composite_system_resume(struct usb_gadget *gadget)
> +{
> +	struct usb_composite_dev	*cdev = get_gadget_data(gadget);
> +	struct usb_function		*f;
> +	unsigned			maxpower;
> +	int				ret;
> +
> +	DBG(cdev, "system resume\n");
> +	if (cdev->config) {
> +		list_for_each_entry(f, &cdev->config->functions, list) {
> +			if (f->system_resume) {
> +				ret = f->system_resume(f);
> +				if (ret)
> +					return ret;
> +			}
> +		}
> +
> +		maxpower = cdev->config->MaxPower ?
> +			cdev->config->MaxPower : CONFIG_USB_GADGET_VBUS_DRAW;
> +		if (gadget->speed < USB_SPEED_SUPER)
> +			maxpower = min(maxpower, 500U);
> +		else
> +			maxpower = min(maxpower, 900U);
> +
> +		if (maxpower > USB_SELF_POWER_VBUS_MAX_DRAW ||
> +		    !(cdev->config->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
> +			usb_gadget_clear_selfpowered(gadget);
> +		else
> +			usb_gadget_set_selfpowered(gadget);
> +
> +		usb_gadget_vbus_draw(gadget, maxpower);
> +	} else {
> +		maxpower = CONFIG_USB_GADGET_VBUS_DRAW;
> +		maxpower = min(maxpower, 100U);
> +		usb_gadget_vbus_draw(gadget, maxpower);
> +	}
> +
> +	return 0;
> +}
> +
>  /*-------------------------------------------------------------------------*/
>  
>  static const struct usb_gadget_driver composite_driver_template = {
> @@ -2681,6 +2747,8 @@ static const struct usb_gadget_driver composite_driver_template = {
>  
>  	.suspend	= composite_suspend,
>  	.resume		= composite_resume,
> +	.system_suspend	= composite_system_suspend,
> +	.system_resume	= composite_system_resume,
>  
>  	.driver	= {
>  		.owner		= THIS_MODULE,
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 29390d573e23..e0d2f0998e86 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -1962,6 +1962,57 @@ static void configfs_composite_resume(struct usb_gadget *gadget)
>  	spin_unlock_irqrestore(&gi->spinlock, flags);
>  }
>  
> +static int configfs_composite_system_suspend(struct usb_gadget *gadget)
> +{
> +	struct usb_composite_dev *cdev;
> +	struct gadget_info *gi;
> +	unsigned long flags;
> +	int ret;
> +
> +	cdev = get_gadget_data(gadget);
> +	if (!cdev)
> +		return 0;
> +
> +	gi = container_of(cdev, struct gadget_info, cdev);
> +	spin_lock_irqsave(&gi->spinlock, flags);
> +	cdev = get_gadget_data(gadget);
> +	if (!cdev || gi->unbind) {
> +		spin_unlock_irqrestore(&gi->spinlock, flags);
> +		return 0;
> +	}
> +
> +	ret = composite_system_suspend(gadget);
> +	spin_unlock_irqrestore(&gi->spinlock, flags);
> +
> +	return ret;
> +}
> +
> +static int configfs_composite_system_resume(struct usb_gadget *gadget)
> +{
> +	struct usb_composite_dev *cdev;
> +	struct gadget_info *gi;
> +	unsigned long flags;
> +	int ret;
> +
> +	cdev = get_gadget_data(gadget);
> +	if (!cdev)
> +		return 0;
> +
> +	gi = container_of(cdev, struct gadget_info, cdev);
> +	spin_lock_irqsave(&gi->spinlock, flags);
> +	cdev = get_gadget_data(gadget);
> +	if (!cdev || gi->unbind) {
> +		spin_unlock_irqrestore(&gi->spinlock, flags);
> +		return 0;
> +	}
> +
> +	ret = composite_system_resume(gadget);
> +	spin_unlock_irqrestore(&gi->spinlock, flags);
> +
> +	return ret;
> +}
> +
> +
>  static const struct usb_gadget_driver configfs_driver_template = {
>  	.bind           = configfs_composite_bind,
>  	.unbind         = configfs_composite_unbind,
> @@ -1972,6 +2023,8 @@ static const struct usb_gadget_driver configfs_driver_template = {
>  
>  	.suspend	= configfs_composite_suspend,
>  	.resume		= configfs_composite_resume,
> +	.system_suspend	= configfs_composite_system_suspend,
> +	.system_resume	= configfs_composite_system_resume,
>  
>  	.max_speed	= USB_SPEED_SUPER_PLUS,
>  	.driver = {
> diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
> index 6cb7771e8a69..4df67d5ee0fa 100644
> --- a/drivers/usb/gadget/function/f_ecm.c
> +++ b/drivers/usb/gadget/function/f_ecm.c
> @@ -892,6 +892,26 @@ static void ecm_resume(struct usb_function *f)
>  	gether_resume(&ecm->port);
>  }
>  
> +static int ecm_system_suspend(struct usb_function *f)
> +{
> +	struct f_ecm *ecm = func_to_ecm(f);
> +	struct usb_composite_dev *cdev = ecm->port.func.config->cdev;
> +
> +	DBG(cdev, "ECM System Suspend\n");
> +
> +	return gether_system_suspend(&ecm->port);
> +}
> +
> +static int ecm_system_resume(struct usb_function *f)
> +{
> +	struct f_ecm *ecm = func_to_ecm(f);
> +	struct usb_composite_dev *cdev = ecm->port.func.config->cdev;
> +
> +	DBG(cdev, "ECM System Resume\n");
> +
> +	return gether_system_resume(&ecm->port);
> +}
> +
>  static void ecm_free(struct usb_function *f)
>  {
>  	struct f_ecm *ecm;
> @@ -961,6 +981,8 @@ static struct usb_function *ecm_alloc(struct usb_function_instance *fi)
>  	ecm->port.func.free_func = ecm_free;
>  	ecm->port.func.suspend = ecm_suspend;
>  	ecm->port.func.resume = ecm_resume;
> +	ecm->port.func.system_suspend = ecm_system_suspend;
> +	ecm->port.func.system_resume = ecm_system_resume;
>  
>  	return &ecm->port.func;
>  }
> diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
> index f58590bf5e02..d4f0e28ffd4d 100644
> --- a/drivers/usb/gadget/function/u_ether.c
> +++ b/drivers/usb/gadget/function/u_ether.c
> @@ -1078,6 +1078,40 @@ void gether_resume(struct gether *link)
>  }
>  EXPORT_SYMBOL_GPL(gether_resume);
>  
> +int gether_system_suspend(struct gether *link)
> +{
> +	struct eth_dev *dev = link->ioport;
> +	struct net_device *ndev = dev->net;
> +
> +	rtnl_lock();
> +	if (netif_running(ndev)) {
> +		netif_tx_lock_bh(ndev);
> +		netif_device_detach(ndev);
> +		netif_tx_unlock_bh(ndev);
> +	}
> +	rtnl_unlock();
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gether_system_suspend);
> +
> +int gether_system_resume(struct gether *link)
> +{
> +	struct eth_dev *dev = link->ioport;
> +	struct net_device *ndev = dev->net;
> +
> +	rtnl_lock();
> +	if (netif_running(ndev)) {
> +		netif_tx_lock_bh(ndev);
> +		netif_device_attach(ndev);
> +		netif_tx_unlock_bh(ndev);
> +	}
> +	rtnl_unlock();
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(gether_system_resume);
> +
>  /*
>   * gether_cleanup - remove Ethernet-over-USB device
>   * Context: may sleep
> diff --git a/drivers/usb/gadget/function/u_ether.h b/drivers/usb/gadget/function/u_ether.h
> index 34be220cef77..ffd023b7be7b 100644
> --- a/drivers/usb/gadget/function/u_ether.h
> +++ b/drivers/usb/gadget/function/u_ether.h
> @@ -261,6 +261,8 @@ void gether_cleanup(struct eth_dev *dev);
>  
>  void gether_suspend(struct gether *link);
>  void gether_resume(struct gether *link);
> +int gether_system_suspend(struct gether *link);
> +int gether_system_resume(struct gether *link);
>  
>  /* connect/disconnect is handled by individual functions */
>  struct net_device *gether_connect(struct gether *);
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index 4b3d5075621a..1e4ee5ffcfbf 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1683,6 +1683,30 @@ static void gadget_unbind_driver(struct device *dev)
>  	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
>  }
>  
> +static int gadget_suspend_driver(struct device *dev)
> +{
> +	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
> +	struct usb_udc *udc = gadget->udc;
> +	struct usb_gadget_driver *driver = udc->driver;
> +
> +	if (driver->system_suspend)
> +		return driver->system_suspend(gadget);
> +
> +	return 0;
> +}
> +
> +static int gadget_resume_driver(struct device *dev)
> +{
> +	struct usb_gadget *gadget = dev_to_usb_gadget(dev);
> +	struct usb_udc *udc = gadget->udc;
> +	struct usb_gadget_driver *driver = udc->driver;
> +
> +	if (driver->system_resume)
> +		return driver->system_resume(gadget);
> +
> +	return 0;
> +}
> +
>  /* ------------------------------------------------------------------------- */
>  
>  int usb_gadget_register_driver_owner(struct usb_gadget_driver *driver,
> @@ -1896,11 +1920,16 @@ static const struct class udc_class = {
>  	.dev_uevent	= usb_udc_uevent,
>  };
>  
> +static const struct dev_pm_ops gadget_bus_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(gadget_suspend_driver, gadget_resume_driver)
> +};
> +
>  static const struct bus_type gadget_bus_type = {
>  	.name = "gadget",
>  	.probe = gadget_bind_driver,
>  	.remove = gadget_unbind_driver,
>  	.match = gadget_match_driver,
> +	.pm = &gadget_bus_pm_ops,
>  };
>  
>  static int __init usb_udc_init(void)
> diff --git a/include/linux/usb/composite.h b/include/linux/usb/composite.h
> index 6e38fb9d2117..f42ba1cfd181 100644
> --- a/include/linux/usb/composite.h
> +++ b/include/linux/usb/composite.h
> @@ -226,6 +226,8 @@ struct usb_function {
>  					bool config0);
>  	void			(*suspend)(struct usb_function *);
>  	void			(*resume)(struct usb_function *);
> +	int			(*system_suspend)(struct usb_function *);
> +	int			(*system_resume)(struct usb_function *);
>  
>  	/* USB 3.0 additions */
>  	int			(*get_status)(struct usb_function *);
> @@ -522,6 +524,8 @@ extern int composite_setup(struct usb_gadget *gadget,
>  		const struct usb_ctrlrequest *ctrl);
>  extern void composite_suspend(struct usb_gadget *gadget);
>  extern void composite_resume(struct usb_gadget *gadget);
> +extern int composite_system_suspend(struct usb_gadget *gadget);
> +extern int composite_system_resume(struct usb_gadget *gadget);
>  
>  /*
>   * Some systems will need runtime overrides for the  product identifiers
> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> index df33333650a0..8cdfdece1561 100644
> --- a/include/linux/usb/gadget.h
> +++ b/include/linux/usb/gadget.h
> @@ -744,6 +744,8 @@ struct usb_gadget_driver {
>  	void			(*disconnect)(struct usb_gadget *);
>  	void			(*suspend)(struct usb_gadget *);
>  	void			(*resume)(struct usb_gadget *);
> +	int			(*system_suspend)(struct usb_gadget *);
> +	int			(*system_resume)(struct usb_gadget *);
>  	void			(*reset)(struct usb_gadget *);
>  
>  	/* FIXME support safe rmmod */
