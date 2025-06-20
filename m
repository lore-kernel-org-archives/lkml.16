Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73BA221281;
	Fri, 20 Jun 2025 06:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750400914; cv=fail; b=rLXtsjHok5pRZxnlgp9NAZKm3J827QpFAPaNXiYSl9IF47nNpAi0DYrBFdWy89ie2lFAgbFy4py/fMcnD0/HH8pHdOVj1SycgBB/pZL7O2XAyOj4mS5Ox/c8lBSIt32Uuz0iyL2e/2XyXcinYk21oMA1n6DdQXJxUqinpg6U/Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750400914; c=relaxed/simple;
	bh=teleziZwm0TaawPAeOpp/+v3HnwuBQolfgj3SFsYOR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AtaNCURArhQdItGNso8Du2lQ/lo372kbj96rtgzVrCLf/9DJ3wdyiORdmD7nuETBl4ce5w38m2HTcd/GRfSMSUEMu+wOL8Y/q5w3AEZDcrH3Py1aclIWmTagRlLiKmluM75fgx+Bmkucvzkuo5p8P7hsSiA3G1qyBO8J/JwE6Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gT/Fh6iH; arc=fail smtp.client-ip=52.101.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gT/Fh6iH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hhld3Y2A9TRASCtXLCikuxXJ9eJs8UHNvujDx2tdB6vzTT3m4HHsxUrXs3hgIxiHiv+V4wBysWrBPnzrbP739IzbnAmm51739SyeaGfXfRdh4yPwemXrfmhevbWzemYt1iFGjqsAssR5LMcL1dtKCGvnFRrnbyoGgaM0XBnpHRp1FV3pXffHSwEyg3RH4kI2WodwnZMLZgKLceF4Q12/1HPo8iPZRgDB8XUQrdtvjjKxQgMC9Y2Bns57+yOGKIkd8kBkqNtkBTomuJ9V7J6LZ63FxGiPDxIy4bYoXYnmsz74JnIR/r44Y68XwbtGsUKDoN1TMNRrJZtzN8s9zkTcfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zCmx3lShxCY+jEjTusc2+zsHqtfbiWVIo3rCCH92MKU=;
 b=yZUPZZoj/kIlsdHWNqQWmekRIFTOe8mztZGIKzpFTbrD5IdcB1W26z65PyEkoQ7lDxx4UB6psbg26Dj7gaFB+eq0sygRTKJZkwU33J3lTqQZH/Lfr3GNFN0/Kkzqvsqm5ydWxC1y5CPE8A+RWbAr+xo0eZIv9CO2RwWuXVHbJLjgTNeOzZsolfYiT1LJ5Zbw8bolzDWYkfNQvxTE5XZxItH+W2z4F8zWliZ1N8RJ7JAXc/M6Jfp+DygdzUpMqqHUwnxqi7QoZ5tDA+Ly0lggVHa/LmGK/EWmWOgf6tLsmSdX3+l7fNXn8jCs/2gmWlbiKLWrfNbrwPFYskJmCNyH7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zCmx3lShxCY+jEjTusc2+zsHqtfbiWVIo3rCCH92MKU=;
 b=gT/Fh6iHV4FVCbZwhmAp8cksEjujqc4DC8Plz1WecFSyITgEiscLWiRwRsxUi+v86rOLDHhsxPOQBm2EYSXemJgyGd+uLVf8DpjliQ7RRbFWYT7XsA5G0PlzClw6+x1LQoHRD/Vuv3JkUKvSeh7htu6WNqltpqTC9ix7UALjk8gyxb9X7womRe6+61esim6luUAIrJKoqiXD+57ltHUgcYyetrHoZU0TdAg9S/1nXmPWtGM0gszLQppxb1rlulBNQ+1pRykr8HHbmDfGLWf86+UEk03Am0jveNpFiAYrY5iisJqyC4xQNuVAWF00DbZzsxElT5pI/2yMYy8/QpyHVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB9011.eurprd04.prod.outlook.com (2603:10a6:20b:42f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 06:28:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.021; Fri, 20 Jun 2025
 06:28:28 +0000
Date: Fri, 20 Jun 2025 15:38:48 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, peng.fan@nxp.com,
	sudeep.holla@arm.com
Subject: Re: [PATCH] [NOT_FOR_MERGE] firmware: arm_scmi: Optimize notifiers
 registration
Message-ID: <20250620073848.GA27519@nxa18884-linux>
References: <20250613095059.GA10033@nxa18884-linux>
 <20250617135038.2439818-1-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617135038.2439818-1-cristian.marussi@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::30) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB9011:EE_
X-MS-Office365-Filtering-Correlation-Id: a92b233b-6648-4427-c374-08ddafc3ab0f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dtiA7n2IdIVGZBIqXAQw/hDX30W+sxOfYi/PyK2cmMvJ/kvrKywvZWshOol6?=
 =?us-ascii?Q?RL+rPI5xLHtTm/44Rr67MzL/blm9gqp8AOnmlTyEQD9Zr/caE1sCajaQnTGU?=
 =?us-ascii?Q?JrQEZ0dHDvRtzbTO7DK6qYQfYfYr9toLFAvhk6Fh4+wmqXrmzeSerGTs2Y7m?=
 =?us-ascii?Q?t5PiuUcopvGii0xou5zxA3zkW2KdoWMF1WkXES/KfRnsLHRLpwd86RG/8JRp?=
 =?us-ascii?Q?LNkywxA2Sour6w05ucaLrZy9E4fl5B0AWa1omhdbF4xDk+TVe+RohceiB0fv?=
 =?us-ascii?Q?B5Ceg2rN6TpA70q6hnyShw7r0HSonuNfDJoLZ75hDjpU1ze5lNJgsvDkKTmM?=
 =?us-ascii?Q?DbLFnfodAGe3VRw2b2WbZBcJJ6NKZ+yQbULNZJnLpqpigHc/jTPRf6MnEMaZ?=
 =?us-ascii?Q?23NJdapbQOtKY1cnu6LSD49sdFv4oytZ0wy3kgdpWG4SODH/i+l033WFMgAj?=
 =?us-ascii?Q?ssHA0dp6tUqTrtAWS+sr1GM78yAZRJchRjPGOZmtZc9caxXwTrO2qOmVUMd1?=
 =?us-ascii?Q?+yGPTb1/Afj9t+xUGoaNhQf2LTXj5HrGi3XxE48Spv9oPqzqcuPcGP9VqSUX?=
 =?us-ascii?Q?MJRJyOpk9iaeinFwWudSmywsd8rrDmPkgPAPlmAadIuNSFaOK1kMDewXCeuE?=
 =?us-ascii?Q?MHMPxde1WhdvTSFfrYK7Rc7kZ77x29+//8LEyOfcJmIXM0KFrx1f5XtCVDlA?=
 =?us-ascii?Q?XC4Y8v7jL6tWPaKtJ4PtrT+pGuzDGD+rmmbvxoHl5SUC3Ho0ya13puB1KlSc?=
 =?us-ascii?Q?tlLwV5qrdEktmQYk/Sx3gb9811K4G8xIvkDO8XVSdXiBwvnmGHq6mGIIWqFV?=
 =?us-ascii?Q?CXzyQsgbTLiQSz2SM6Kz34IS6eTWJYcuxSfzAAIVEbRw8a5409w+uu8W3mqD?=
 =?us-ascii?Q?0UF04BP9T2Zu00eZhAZ1MY0XWEpR5bxALzDYCiIG48evv8B0hE80u0KGojuI?=
 =?us-ascii?Q?vSspO0dkWeatOLnK+HmkGpQiW20zn46n5lM9ojQe4MzPJRCE1a6P8VQvtLGv?=
 =?us-ascii?Q?4M2hsKtPBUOyepleyYS0ewnVNM6q714nUdrS1qGtH4aK0sDn87bdOlkcTZqT?=
 =?us-ascii?Q?ADvStC/wMiWoBJkL20yPLF4RBSpieBRuFSxVW3DXioRcoPCrhO48t1n7bddS?=
 =?us-ascii?Q?eTBtENzm8Lt3ER+edOnXQDEmI8otg5lF5BHQ1r8ggJBx+esUY3t3qmFeK1ci?=
 =?us-ascii?Q?DKrpGUN3XBMdzWICTw1sHD2rU9D4WR3GCTaaWere0sd7Sw5H5GntrXnBpOjr?=
 =?us-ascii?Q?HVpNA3GHjHRvHM0lBwIKWBZiiihk/FKNh70XjJEdWdeMVUhMglnyjFIpUHvV?=
 =?us-ascii?Q?n/Ue4br7Fo1ZB7ArIEYiFeqOD/z4OmAOmzXF1hCr5d4+Gx/CZp04jSKZ2NBQ?=
 =?us-ascii?Q?ltwlMNyajbGofVyzyf4GWP4ZoBBRtYQ1dATAkZiYbSOBjMQftb9jQWBnPoOP?=
 =?us-ascii?Q?cjQfJOG/e6yhfpeMzovMY6puldn9nZNqxFw6wIwOhbBPGTDVmfSvnTWlK64H?=
 =?us-ascii?Q?i3eAzx9LNp+Vx4U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cd5fKBCdOQlXl+1zJAFSwr+U1bDuSOZqOIoLMcjoE9SmqvgYecLypTZvUgbn?=
 =?us-ascii?Q?WYlcBssqTAlL+nkdCwxv/iPWE1M4uzf9pE2T+S2AlZfvVrqRAYfEjX34UlJ/?=
 =?us-ascii?Q?heiq5wkO1UWvvkRr4VmIKCr3Jp6Apxp2gf2Ad2P4kDaDUZq9CuVBzwDdmXNR?=
 =?us-ascii?Q?SrIFVKadPbps8yuEbYcuQtqbomThdfzbjSJuMUNk1PFWBDwS4ZAAsylT3ATM?=
 =?us-ascii?Q?IMqiKznAd2DWA1jfVyQBxibDlxoZJB6Po1M8332CiT0h3KoQtL61CyqhZKMV?=
 =?us-ascii?Q?oi/NgSSj2A61pfTv9AehOYMEMhXfUuEwyfwiUoQlZtyyHFODLB8sCkgkyZmA?=
 =?us-ascii?Q?qwTM+mxqZKerCtzvb7gB+q2VxsVKX1ow530EHJShNmpyHy3HXYFIMURwmGcX?=
 =?us-ascii?Q?valAJiTTfChMkxLYGFKgkAtmy39hKKLCrpuD+ZvcrZGVa2JskfxSuEawtNyc?=
 =?us-ascii?Q?ZALKZKGThPmJCsFwHwJj+6o7n2x9OmNs+0iYMzx+Mga5ct7dV6rSaiW21l92?=
 =?us-ascii?Q?uGgC1tU5KDWSfKrcvaK7Qo3Z3zrLvsc1+9/Fg0Vqkw6/HtwsLMI6O5U5sz7l?=
 =?us-ascii?Q?1Lx4Mxyfpw2ZMCDieQmc5PV7l6evSlNwmNNEjLwZY63M3+euz5w8phCLzSwt?=
 =?us-ascii?Q?/DrseYAizxVCntnmc7rxfsHp90SZ1ia3CnxXS8GDG0P/KgYgzEd+nWCO57Um?=
 =?us-ascii?Q?yTw5BOl4vteXaEE60HFpyuSatyPCS0WNC4kLnXYXGNRrKqPudIkXBztqaxOP?=
 =?us-ascii?Q?FdlXOR9A3IehmT0RPCJJ8kdT1p4x1P0JvcvkMSl7v/C6pG0U49UNB/CLOopx?=
 =?us-ascii?Q?RvqZfGXyauM/C81zt3sYx8IC+4W5FxgArTfsU/b6RrB62ERx7kehh6Or0g8D?=
 =?us-ascii?Q?i9i+pzWE/zF41Hg8Ar6U3OZBqzVgwNAT2QC41fjpZRCsKPgYp+HFUAP9Cubv?=
 =?us-ascii?Q?bVsl8JilgRNTScWmcVYtp/l898pBVm1Z8DiUFoOM3xf28i37Di1UwNXT0GHg?=
 =?us-ascii?Q?aK3KyWadCWGhWDk+bCdK+5w4XDi49zJ7bNrKWPo7lHRE9y+w+0a362SM2xl9?=
 =?us-ascii?Q?rTpuFg5bawh5va3uT8VGbTjGC6sjfK44CCiqhIrXEFJPflvpUKpGcY0VHNOT?=
 =?us-ascii?Q?JSKY9Q4S/oFbobB++MsuXU01vbKnvVwaikcynDc16b9bj0D9ee/EtneWWsc7?=
 =?us-ascii?Q?UwzvJzYX6E9bYjKasWidEHlTtydLn2AsQrs64JJBV/4kaeFgGdzxPEsZnJEL?=
 =?us-ascii?Q?biyHD0ObO+dhzhZ3nL6reftr/KXhTXLHMsUyCEIJUA90+ALMsKsNxn5VJuuC?=
 =?us-ascii?Q?2LkXxfT0yLVGkz7+gbnpA+WHjQa1idmmH1qmR0YB+E2udyw6/p5rIqRCD68E?=
 =?us-ascii?Q?N5AViGDO3vRyImlscZMB8ZjZt89vvbRl9YE8oxnw7v54eFtYCKGrOa9K8Md9?=
 =?us-ascii?Q?IGaaoHUmhU32S/J8nnwPq4ytGTeuWRtcWne8NHwvkI3JEB8/zCbhcAMp2PFp?=
 =?us-ascii?Q?lbeOaTs2KQfUZT2WQ1NA24zjj/jUAPrqTS6Hd8CTIqurmK8E+ZwJwBiS9xe2?=
 =?us-ascii?Q?BItTI+wYfL1VBMlEhx3UBIsIGY0M474E1KYFywoV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a92b233b-6648-4427-c374-08ddafc3ab0f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 06:28:28.2225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBhCraX6xqtSgC6/6o0KoeXcAJdQr1TUF2Ksp5qM8Pft6ZHyRHJJJkz4Djuxp6GjETl2raC2vD5ac/tkbYYbXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9011

Hi Cristian,
On Tue, Jun 17, 2025 at 02:50:38PM +0100, Cristian Marussi wrote:
>Some platforms could be configured not to support notification events from
>specific sources and such a case is already handled properly by avoiding
>even to attempt to send a notification enable request since it would be
>doomed to fail anyway.
>
>In an extreme scenario, though, a platform could support not even one
>single source on a specific event: in such a case would be meaningless to
>even allow to register a notifier and we can bail-out immediately, saving
>a lot of needless computation.
>
>Flag such condition, when detected at protocol initialization time, and
>reject upfront any attempt to register a notifier for such completely
>unsupported events with -ENOTSUPP.
>
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>---
>NOT FOR MERGE until tested properly even with late loaded protocols.
>DOES NOT address the issues with verobosity of messages and lack of
>details about failures (which protos ? which resources ?)


I tested this patch on i.MX95, no error log anymore. Except
the one in cpufreq:
scmi-cpufreq scmi_dev.5: failed to register for limits change notifier for domain 8

The ret is -EOPNOTSUPP.

Thanks,
Peng

>---
> drivers/firmware/arm_scmi/notify.c | 39 +++++++++++++++++++++++-------
> 1 file changed, 30 insertions(+), 9 deletions(-)
>
>diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
>index e160ecb22948..dee9f238f6fd 100644
>--- a/drivers/firmware/arm_scmi/notify.c
>+++ b/drivers/firmware/arm_scmi/notify.c
>@@ -318,6 +318,9 @@ struct scmi_registered_events_desc {
>  *	    customized event report
>  * @num_sources: The number of possible sources for this event as stated at
>  *		 events' registration time
>+ * @not_supported_by_platform: A flag to indicate that not even one source was
>+ *			       found to be supported by the platform for this
>+ *			       event
>  * @sources: A reference to a dynamically allocated array used to refcount the
>  *	     events' enable requests for all the existing sources
>  * @sources_mtx: A mutex to serialize the access to @sources
>@@ -334,6 +337,7 @@ struct scmi_registered_event {
> 	const struct scmi_event	*evt;
> 	void		*report;
> 	u32		num_sources;
>+	bool		not_supported_by_platform;
> 	refcount_t	*sources;
> 	/* locking to serialize the access to sources */
> 	struct mutex	sources_mtx;
>@@ -811,10 +815,19 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
> 		if (!r_evt->report)
> 			return -ENOMEM;
> 
>-		for (id = 0; id < r_evt->num_sources; id++)
>-			if (ee->ops->is_notify_supported &&
>-			    !ee->ops->is_notify_supported(ph, r_evt->evt->id, id))
>-				refcount_set(&r_evt->sources[id], NOTIF_UNSUPP);
>+		if (ee->ops->is_notify_supported) {
>+			int supported = 0;
>+
>+			for (id = 0; id < r_evt->num_sources; id++) {
>+				if (!ee->ops->is_notify_supported(ph, r_evt->evt->id, id))
>+					refcount_set(&r_evt->sources[id], NOTIF_UNSUPP);
>+				else
>+					supported++;
>+			}
>+
>+			/* Not even one source has been found to be supported */
>+			r_evt->not_supported_by_platform = !supported;
>+		}
> 
> 		pd->registered_events[i] = r_evt;
> 		/* Ensure events are updated */
>@@ -936,6 +949,11 @@ static inline int scmi_bind_event_handler(struct scmi_notify_instance *ni,
> 	 * of protocol instance.
> 	 */
> 	hash_del(&hndl->hash);
>+
>+	/* Bailout if event is not supported at all */
>+	if (r_evt->not_supported_by_platform)
>+		return -EOPNOTSUPP;
>+
> 	/*
> 	 * Acquire protocols only for NON pending handlers, so as NOT to trigger
> 	 * protocol initialization when a notifier is registered against a still
>@@ -1060,6 +1078,9 @@ __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
> 	r_evt = SCMI_GET_REVT(ni, KEY_XTRACT_PROTO_ID(evt_key),
> 			      KEY_XTRACT_EVT_ID(evt_key));
> 
>+	if (r_evt && r_evt->not_supported_by_platform)
>+		return ERR_PTR(-EOPNOTSUPP);
>+
> 	mutex_lock(&ni->pending_mtx);
> 	/* Search registered events at first ... if possible at all */
> 	if (r_evt) {
>@@ -1087,7 +1108,7 @@ __scmi_event_handler_get_ops(struct scmi_notify_instance *ni,
> 				hndl->key);
> 			/* this hndl can be only a pending one */
> 			scmi_put_handler_unlocked(ni, hndl);
>-			hndl = NULL;
>+			hndl = ERR_PTR(-EINVAL);
> 		}
> 	}
> 	mutex_unlock(&ni->pending_mtx);
>@@ -1370,8 +1391,8 @@ static int scmi_notifier_register(const struct scmi_handle *handle,
> 	evt_key = MAKE_HASH_KEY(proto_id, evt_id,
> 				src_id ? *src_id : SRC_ID_MASK);
> 	hndl = scmi_get_or_create_handler(ni, evt_key);
>-	if (!hndl)
>-		return -EINVAL;
>+	if (IS_ERR(hndl))
>+		return PTR_ERR(hndl);
> 
> 	blocking_notifier_chain_register(&hndl->chain, nb);
> 
>@@ -1416,8 +1437,8 @@ static int scmi_notifier_unregister(const struct scmi_handle *handle,
> 	evt_key = MAKE_HASH_KEY(proto_id, evt_id,
> 				src_id ? *src_id : SRC_ID_MASK);
> 	hndl = scmi_get_handler(ni, evt_key);
>-	if (!hndl)
>-		return -EINVAL;
>+	if (IS_ERR(hndl))
>+		return PTR_ERR(hndl);
> 
> 	/*
> 	 * Note that this chain unregistration call is safe on its own
>-- 
>2.47.0
>
