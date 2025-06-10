Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013025.outbound.protection.outlook.com [40.107.162.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA0122B8C6;
	Tue, 10 Jun 2025 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556761; cv=fail; b=kr5NoDTctfmIlR5zHUgNNHnJ2Z9J6bcrX6lAnzfeqvYQ3gwwmQ6pP2a/7tVYiwTtnVeZZrIGuWjgOp+VAIANwBKy8TRIf/0C17z3b+qSY899exObR8dPpGMY/+o+FP135tO7UKeZ+4iRPHWCjJvhQl34PK3JZZgf+wG9XvQA2OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556761; c=relaxed/simple;
	bh=85Tx65pVcyHFVaoS0wvqmpJE3f9SX5Exe2rUPwURgRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d7Ag+91CQLmEyFo8BUls9hEo6CDSGVhN25yf7RjW86uiJt2DCvWvpHmRSl27boG7xDnhaGbm7gwQvKawvL/vmUodLeQLXvBGPxTHkEyUoweEsZxFDQlyFTgr1uTLYk7MN3irwF/DDKaepKP+lyMAwxlEUtKgvxgBP1NUTSvz95I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m9AhKOyu; arc=fail smtp.client-ip=40.107.162.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m9AhKOyu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DArebuP57KpSClF9v8hcS69sCBqqbqB7iFxrdjHCxPEKN07cpKChDjIZXkM641Mx1MORP82OhcQGN+IkcdFTsXUmRiglH1s54BB/s2/5UHDyHUqgGQAuhlIqXAD6e+RkaMQxm/YYOINTwaUykPHWmG02Wrg4d+cegNxkpHxyqDrmEGC4F0T2GbJqn5lYmYQenWdo8rWwGCxqeebwTpacWFUP+SDPsWxHyN43TPhlLX4DIg2XY83obkKvRrs1T8ldK+03TEH//QAx5+VXZoWFwoFYv5gzW1nMfnbRoL3/L3pVCLHcljXFyu8G2To2OTCgLKgBPg4cNRC1RJl3i6Tstw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08LO6FbNPkTir1j1egIrJ4dmAI2KtDV+QIbGYiPMbbw=;
 b=oNm0jTfd6YU1okrvXg0dcX+/l7APu7iC0S9CxkprEqUNZX1cRG7/fgUP0xpzFFT5/F88dQuY4cfZ6i0x1CBEnd7gq6K4H5GduXjz6tYDRf1iPSAs3YaDCn8VTC/yeITRsaMPAnY6BsZwFI1ePz6dRpVBNxG/LiJE9/0yM9HK4kFL3XIhwdNdfxmrfEjR/aIRbNZjk6oPgDLeCNBIAeSlpEq0HMZAknD8DPkZzurBxaeBra/urUMKEwFjnCGBfkJWfEV4xAqjfIiXS5MqVnZ0uU1RmkI5451ZSSM/RPACR3yZm9ngSRC9DE4QtkqIwlUq2UaMM9DaMckslNRcq8PzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08LO6FbNPkTir1j1egIrJ4dmAI2KtDV+QIbGYiPMbbw=;
 b=m9AhKOyuWiVEEDItGLmP0W0I8JSChZdBVgrTokyI0oxAirmT5ApjXIJvrqI40noZ3vk0m7I7hKrUim/NYHLJyM5/N/Exc2Yt5b2wdVAGIW9IyzLDi/EGTH7oxQQYkdWoYsrquH2tjH8SFMSj65jCmlKCJMSX0GWUGbr2zLPAMuL0N5tR+B/nugTVr4/+AfDQCMV4Xg/xj24gAyC6WMD/lwUuJhSNJmnT8I7E5M9TzFnTcBHorvap+71g3Pw2QyQU2IjHkPgkqZ0c6Xym8n3YFtYaV2FnRMZnFPKNo+vEM4yUt+sK+Ve5MbJZP7IQqFdfYOdOvv9DYOSEIcXDL6MOaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS8PR04MB7653.eurprd04.prod.outlook.com (2603:10a6:20b:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Tue, 10 Jun
 2025 11:59:16 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%6]) with mapi id 15.20.8813.021; Tue, 10 Jun 2025
 11:59:16 +0000
Date: Tue, 10 Jun 2025 19:54:41 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Peter Chen <peter.chen@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	imx@lists.linux.dev, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <emdju6mml2o65hmtiyf5jwlzhudmbpyx433wz5a73lkpinzbyp@2oexfo2ra7xs>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEf/2+3MU5ED2sxE@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEf/2+3MU5ED2sxE@dragon>
X-ClientProxiedBy: SG2PR01CA0172.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::28) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS8PR04MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: b68d0263-989b-4d8f-939b-08dda8163978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AZWo/e8/E9SsW+/ozgLTdKBnpMyL6bPUl/y9N2Ch3AmBMTxK7jrbrFdynA9U?=
 =?us-ascii?Q?XgqVZMyiEeVLM+D4sXGm+Feu6VAOvMNHRoSygybfA2mf1UQfnL8VyD8TwftG?=
 =?us-ascii?Q?7oZUtjfELYwEWEM6/QJW0CrDRL+PwfwnFcMLjjT8cIJdUMFBVUX5CGYBa9Eh?=
 =?us-ascii?Q?HD6nHBUV0eSwuD+H44ETH1avpvkWNaNfCin2erI4Og0lDdwKjuN89In08XvE?=
 =?us-ascii?Q?R+zf6aDR+qFAWgju7DR8Zt0GGeznireyV358h0E+DzmrQF25ttcxA10zA4Pj?=
 =?us-ascii?Q?KXk4VbtZDnLzaTpPEpMNcER+HPOCr54dr9wsp2N6uBPalI26ZdKKBJ5otOGv?=
 =?us-ascii?Q?rfWORdkpSsSrBah75Wup0WpOZ1BgpG4e/xGrTmIaxuXx2yC5xvxkBT/1H33v?=
 =?us-ascii?Q?9NgsjpdFWp6kkFJvHpbd3vzfHZmofIonfj8g2caYER0Zmho52oC9+WrZn9fB?=
 =?us-ascii?Q?6hqY4y20AWT1C+Ut8XW9lsGD2OcptpyDGPN1Icoag86++1M9FNc0QC1PKQyQ?=
 =?us-ascii?Q?oesKiu/yY+dTubAsVYjlRDL6cqaBRP0E0n8VAjcqsNRBiMtlvWI1owlP6NKY?=
 =?us-ascii?Q?q3I9/HlPQmtd/tsCgKVdH/MdvWLTWkAGqndya6psC7Xg5ad7sP9IwEPzehAs?=
 =?us-ascii?Q?r+GCMgs3fvpYvEOGQU/cj1wX6GQF172jbqUXgKcI9lp7GHuoA56KCpe/Otie?=
 =?us-ascii?Q?HeOfyt1gm9t4HrKbK8IxYtEPfs7/gdTWsgAtq3q7pDBrrlz/Mo67VBzKycq4?=
 =?us-ascii?Q?smISUadetiShUxmqPTlxKx9U1rlc2hrr+Fu0K02Kafr/3rxHsXydQjZkSIf5?=
 =?us-ascii?Q?c3M2Cp4RmHj12L9vEibS9MRAnoHL+cDpO5IBes3DVGaKmHVOQfZBCdvaJE0f?=
 =?us-ascii?Q?owkQFYgwtAFMM4n0NZumI94HqbDPnq8sCH3CSs75aUJWEXFBOuZQmikRyGiT?=
 =?us-ascii?Q?MhVdf9PdAJE6Sun8L55Iq1xW9Et0/j5tU1+lvVfVHe1z7uMqw++uyaAlzOUw?=
 =?us-ascii?Q?dnPIi9Y5Kckitn71/m8KHJKjjeCe20LQRCh91ON3Zuk0abpUN435s9Z5svfW?=
 =?us-ascii?Q?gJ4F+JMm+Z5sf2e9BwN9l5h5knsRNkeKIC3gUxU2PMKmkH1uUL6psrhHEaBd?=
 =?us-ascii?Q?/vyILMw0qrAKsHDjUSOMTjjd5bVx9T6hl+Zl6WvZDH28+oHJxHcctlo1DUSI?=
 =?us-ascii?Q?Ai8DfgA24N2g9061lQa50xXsYz96GKe9eFj9c///qP00Ggs/o3v6YxKBpT2a?=
 =?us-ascii?Q?3V+aR1MhWIez76nlrlFMNtc41rJtxkB9uMG5Sz06TdjTvmR2tqT6gXVmKDR5?=
 =?us-ascii?Q?U0j6KWqLuKhLl8chR/wAVrYinYHIKio3+lh9Yt3XO9BaDOts7ktVHa2Vic9U?=
 =?us-ascii?Q?gwcYNcFOBkivutF78+BNpl7/V/bX6ixzrMWkQYMRGhdHWldJd8zDxa6sIYB5?=
 =?us-ascii?Q?y5nyMTDqauIo70wPU8nHzEN1/jYOVJTNsRYpK+p0l1L37GEyQuz7Tw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KthPgUXN3HRP7L3ETkt6gB6ajgAy1lWJQGTEWdMDri5hGuFzGHJesukaHIyg?=
 =?us-ascii?Q?Ofr1U7nsBD9gJvhL1SQS1yKfvQp8KIPGyIhk3SpII7HuOXA1SunSzoyKmINC?=
 =?us-ascii?Q?B6iSTfPfzkuQ2dhpYc80oC+D33fWbbvXhdVnDdvDu9zHZisWr4VOj6iODWKe?=
 =?us-ascii?Q?ZatCdEpf1QtwKscUir3hwuqE+uGqWdhDLd5bOkOlNMWz3ymMLUqfDBrHUOST?=
 =?us-ascii?Q?J0StV5CXKYPIUL9oOXWATBOs/NfsXeOCy72sRIxQ/I7IkWNn4wERuzSDE7fs?=
 =?us-ascii?Q?qiPsPsQesxi8coQPF671rpsuqFgyY2vaeNgbS0gMMGwqKFFeDXygrw099n6U?=
 =?us-ascii?Q?lT0BJCVDBbNC1eMBKnYlQdizJdI6Ngy6XJnecokJuXEeLKxz/171ur3L/7JL?=
 =?us-ascii?Q?KSchtASzLol8UhnkP2VtQg9uWa1mW/fCh/JDBrD0PVpQLbvtq76UQGept0kO?=
 =?us-ascii?Q?xxV/VZwZb/zL4tfL1jNihEYbda1pdaLTSrYWaCIo2hKeNXrvZYwm5rou7AuD?=
 =?us-ascii?Q?HKi5pPS9MMzCiLFMeg7Ay8FdUdHVCN/P6Dd/qZQiYf7dQ0twtwoYoqK1/VMg?=
 =?us-ascii?Q?hAFSgOoRbzByIl1/2dcQ36nY0ZaQIKSeLgj1MvHr94oh1RiG3ue6v5XFtT8s?=
 =?us-ascii?Q?lLBCC/wqOJK8ySNbHljS61ordPxwFeams16OZS2ZC9PwJcGYnznSFr4HF3Bo?=
 =?us-ascii?Q?poD8vCDo19C7C7YNnakrjMb2Yr03oYw1caO3qIbUpDHg37H53UvYF6j2jnVm?=
 =?us-ascii?Q?hiJd0yx+95BjgNwbUo1Jxn8lxZky6Hlp3c6Pl9XNqvwtwR+SA5LWkBhIj2RN?=
 =?us-ascii?Q?NAL6shd0/C8bIzLd9UxgKpOXUpTnBCA8AtKw1kIwA9RZYaH+9BzN3saJ2Xr7?=
 =?us-ascii?Q?d72tEuDLuQFsAXIDpRHAwEQINjlFSjEUGxRRT3tBRDMDNSOzy3wK+cQVEKrf?=
 =?us-ascii?Q?HDrZHdy7yzcy5aGTGjhdYqZc9D5YdxizlXZpLMKmQkycn8TEmOhFkwHDV42u?=
 =?us-ascii?Q?bRIWk2/VBJvI0qvWeMLfTyzX3Reb3j75AAdnD9n51BM1iwska88DEeW0Ce8P?=
 =?us-ascii?Q?82GrqIvLhLfy+91jYbFBKhlGHbfXtVxTEzKVNdO+IBD/MyvC5Zjjj0zyJAal?=
 =?us-ascii?Q?gvxK7dNdBO6MBMfJax5iw/f/UfUtXD8EinRLDZ/Bg+uHktXEYUt31jDShg0r?=
 =?us-ascii?Q?jkYsq8ovATxK+7ItTQvz0ok2dNxBeq3WGYrKg1sO1od5+I692x8g5hoAdsyw?=
 =?us-ascii?Q?AERnqwHTazBDf/2osT7USHCIBk0cqYNwHwOQ3L8prRNOsIhlJ9EhrQnmF+vS?=
 =?us-ascii?Q?iTvKiGJRRxNurfg2pvZ9uaZtaG+8C1Tnk6QOuOdGvmbXjh3bMg6cQp8Z5c7m?=
 =?us-ascii?Q?Mpy14IX+ESjY5B7kU0fApqGCsVr7tbU0IBh53OjN3Pwdoy2jWJOvHOcFNn3V?=
 =?us-ascii?Q?ZTPqVxORFw59LXB/A2Xi2WkKF+PicDz0AXuyDfJb4CygRMiGo+sz+ofKi+ho?=
 =?us-ascii?Q?SiXRaWbD4ECItsrzJK4d9fiMIo/QcR5tb3GLm9q7z9Xnfd6JLo4caV6KQf+8?=
 =?us-ascii?Q?hCJLe+MBhAKprnnB6n8Ww1QXf43Da39lx6j6afSi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68d0263-989b-4d8f-939b-08dda8163978
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 11:59:16.4814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiabCrFCMgUxZy3BxUessLLmXA+PC2Cx+mXdf/Vfq6vi3rW92i65W9sQRxhqsF3F5ZkvG5QQYQLbZSD+0PMnIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7653

Hi Shawn,

On Tue, Jun 10, 2025 at 05:50:19PM +0800, Shawn Guo wrote:
> On Mon, Jun 09, 2025 at 07:53:22PM +0800, Xu Yang wrote:
> 
> <snip>
> 
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
> 
> Thanks for the patch, Xu!  It does fix the hangup but seems to be less
> reliable than my/Peter's change (disconnecting gadget), per my testing
> on a custom i.MX8MM board.  With your change, host/PC doesn't disconnect
> gadget when the board suspends.  After a few suspend cycles, Ethernet
> gadget stops working and the following workqueue lockup is seen.  There
> seems to some be other bugs?

Thanks for your feedback! As suggested by Alan and Peter, disconnect device from
host should be the best solution. I indeed don't see other usb controller driver
call suspend/resume() when do system suspend.

> 
> [  223.047990] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> [  223.054097] rcu:     1-...0: (7 ticks this GP) idle=bb7c/1/0x4000000000000000 softirq=5368/5370 fqs=2431
> [  223.063318] rcu:     (detected by 0, t=5252 jiffies, g=4705, q=2400 ncpus=4)
> [  223.070105] Task dump for CPU 1:
> [  223.073330] task:systemd-network state:R  running task     stack:0     pid:406   ppid:1      flags:0x00000202
> [  223.083248] Call trace:
> [  223.085692]  __switch_to+0xc0/0x124
> [  246.747996] BUG: workqueue lockup - pool cpus=1 node=0 flags=0x0 nice=0 stuck for 43s!
> 
> However, your change seems working fine on i.MX8MM EVK.  It's probably
> due to the fact that host disconnects gadget for some reason when EVK
> suspends.  This is a different behavior from the custom board above.
> We do not really expect this disconnecting, do we?

It's an expected behavior on i.MX8MM EVK. The host will see device disconnected
after imx8mm do system suspend. It's because the usb phy power will be off after
system suspend. If you enable wakeup capabiklity for usb phy, the usb phy power
will keep on and you will not see disconnect event anymore.

# echo enabled > /sys/devices/platform/usbphynop1/power/wakeup

Thanks,
Xu Yang

> 
> Shawn
> 
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
