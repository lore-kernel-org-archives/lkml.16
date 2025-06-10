Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894972253F8;
	Tue, 10 Jun 2025 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749555137; cv=fail; b=HU4flGM4kCQqLLGudxi+efAuqEp4ADEQyai7WrqQZKpiRBZFiqcCUWRKJfPUu1UCJGahMPmaJpFxw7NNgPHe73kfnWAvFC3vtSW7mDr2g43sJxl97rgAhEhyI3pndAO2QCmo6wtsoWwVFCRRYnjkqTk0JEZnZCZva9JdliPxlyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749555137; c=relaxed/simple;
	bh=vQwGvCTYAqJ8nE6ld+uK8nj5AOQ3XglxoQet+jIGkrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E7GJXDWMzQ7x2klSyZSYT87vHhqWdLvXhkGmaF2czWwE8oMxDsLbOdFK57twfZqIJ2ImwBThFphfGQcmt6KwWi6TygY5NODdrH1MI1QzJV+2MkJoK5J5jN7c/1F5EyOSPxfJiFwucF0BcJU9oGUw9eHsrZ2Zyg8f9A9lvwhv2VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mYHCSYz+; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mYHCSYz+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wI8sh92uW+NXyGBRTq4C3Gug18anW4/yBfd8Z53Anb8fm4l3Dd8p0t9W0Irfbzg8qmURYvwMWyAwjw6tV3GW3hSij8CNPN9KRM3QJ/auA4gz/CkqBLBTTBLC7t816kerQMHDInhrAZAqj5ViLnQ0AeDKuOu9pwyDfB+UwbjG80URnKPh3HweSmy9bSdzVB7FFkJDrZYOsmbvasmxQbZWrMAsHWIkChzgOWmssikxGNRodr6C3DlsJPDg+AGQrF9H4Y64pm2tgWboS9o/At4xdIShrPZrw96FOJAV0WwioNPml27gaVrQVNoktflpe2qdPElGKko7zbUZt/U5HOYFtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhA8wACGdCdhLWP+OK+p0LvxWUxdLeUsRGtU+jFHLe0=;
 b=TmZabdP0ZEUMXJM7+f2KAmOoEp62/KsYbBlVPBKlMmfDsR52Y/Tw7ybcu2HVwtVXNDOblK0v1ZOv+HFKbx9S0x6RfHMu8G7Pr6YfwLLYXYobXeJgAZBhhFmfJSp56S9rj2o9ePrm3ilkShqAwyF7Ci4VwrHoQlwcwXOoJYUN/J3Ek2atWg/TsxwTSdGsjLwfArlM3ndA87ajev527AA5RA2+7ZjZHZ4pLJDMCwDU75TCZuv3soP0xtJM6OVAewVi2XgWxQh20ebeN+VKdbU0N3BiKrsrLJJvfoQsZrF+yLjfJwIVcyLO0v8dh6Ez0ovNDHeH8beWFPn1FWLCZEw4Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhA8wACGdCdhLWP+OK+p0LvxWUxdLeUsRGtU+jFHLe0=;
 b=mYHCSYz+38jURNNar4CTZTsHh9jVgUWR5Wbx6PCq1lvZJ4ivnGL8OsHqK5EpcPzhaSQwwBbdRtpfweKwB4D6fHAvFZjs634bLGEsmcwTmbGPn/GOn+8Ynof9QBflYITs/e3y+4gj+kLZnKdFcYua8UmURSZbf264hnqD0pZciic2xaG+3D8m5WpwNA+CGfm0OXvnSgRdbhc6GIMH9ugEb9P3xnsUcDsUbA7OQ26IcNz+4P7+R+CbRz7FIvlF0KsOJjufpEMREqy1DAfrXhWH+yByX2p9V5T+728QKFpSiWH6S0X0vunen7fASBf3OoeCk5w4sjrvN771tIQikIXBgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DB9PR04MB9674.eurprd04.prod.outlook.com (2603:10a6:10:306::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 10 Jun
 2025 11:32:11 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%6]) with mapi id 15.20.8813.021; Tue, 10 Jun 2025
 11:32:11 +0000
Date: Tue, 10 Jun 2025 19:27:30 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Shawn Guo <shawnguo2@yeah.net>, Peter Chen <peter.chen@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <7d2oyy32oq56sxwetjg7s3dvvuetjqlb6amdjx4edjgwdqmo7v@6ioofc5ksa4z>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <c7bfdfec-bc49-4ce5-8dd9-7a69d8e24ceb@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7bfdfec-bc49-4ce5-8dd9-7a69d8e24ceb@rowland.harvard.edu>
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DB9PR04MB9674:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d4c55b-10bc-4ef2-f150-08dda81270d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5xDeMkDjXljymRLnD7O3v4QEIC3bbW8uxRJ0rgmn+uiKEjgCWHeq2AfQmoNN?=
 =?us-ascii?Q?buD2A4QtBMCuEz6cPdNSpMdpGN7IDrwymSK33O6Lcwfh4nYzhb1EvB+SHTy0?=
 =?us-ascii?Q?VouiCaJlIz/YYG1cdQr6Y5hPzpyzhHY9AeGGHle7qK0UFK6UFwPP8u9qL5B1?=
 =?us-ascii?Q?xy6RUMR+0GreyrorYXhtoJUORzGfHrUVo+jSk8xXKDHlL9biiVsuCb6vSiOB?=
 =?us-ascii?Q?c5SBPlbt1SdfVXweWtUJ/QFnfHtnrPPxjABaNo1104nInPLM3yFpv/xHibeu?=
 =?us-ascii?Q?uyboq0mWfJaPESQsgz/hsPI6VV43TZVSG26JIj9HBpCszKI/svNL84nhh6nk?=
 =?us-ascii?Q?t04H5mBUf32dnsS+hi/T/jDMPnEF6tEzM8wdICmphHvFk8sbR1eRkoUf5ehz?=
 =?us-ascii?Q?Ke0idTdaJQv3aAwwBRcRha4XgDZQTyEQm//xgKBOs76w/GdWkc5MSYDjivx6?=
 =?us-ascii?Q?NLozla/PvUkJMEDIZpCEzG41b7okPsc2Ik+5xiNVfK6GWCywjcSHbgRzP1LH?=
 =?us-ascii?Q?kO2WKAb+UlL3WEnS/DdOq0IZu9prI0Oe+b2qpStrjpkGJlYiPg7VBbvBntqq?=
 =?us-ascii?Q?c9+bWtBrECssiP1Fnb1nOGs9CX1DKKXQfyD215vdPUdWhFMmzqbkpZmKIXI9?=
 =?us-ascii?Q?PSgDjK10KVrPl3sxYmu6gNJzKBK9WapyyhvPW9wUdNL7hVCvTWX+k/4Zsf8D?=
 =?us-ascii?Q?vMbaKcTxoosCEgveRaW+n4cVBHwMaSiGRw1tpGaFDEMpWRUdbfgz3PK3PXqv?=
 =?us-ascii?Q?v+io5joeCdkIocVnw5yyzmqhWqMt0uipn9/qqufVQmrOCe2BNTDqt3Ljp3A0?=
 =?us-ascii?Q?wqFt/lH4AIvOEak0lXd6I0Kr+qzqEfdOt0Yk5Rnd/CF8yeEjECVlSY638tUY?=
 =?us-ascii?Q?bnn/v/BIN07TJd8NR3q5QUEt+F4piZy1LKURtbeWEpOvSLiGN5QQxzbc0z0h?=
 =?us-ascii?Q?rjdfrAY64NOgCTSTMhKBAY7pmRKyuMZqs570L0JGHrQROUZfOnZTWMR/ZCLr?=
 =?us-ascii?Q?EOyPrmx6zpCPKxF7YXayhGyH0pj0VtkZnO1npQi+ein8ZjmnBmWLc5jtt1mS?=
 =?us-ascii?Q?IT0u/R4znii8ZPHiJGOi/mqyYu4vACMJfFQPjlhd7abnw+GwsTsrZeug0Ho2?=
 =?us-ascii?Q?UvUgdQ+NJgi9jEE1PrliGBdluxhZsZGDiTz2oij48xFatWyKIFfvzd+8+vH+?=
 =?us-ascii?Q?aecdKTqTD9Sb9tvUneGWj//wDTuOZ0wjEurgse5TfAHmgC1TWgYHevmhMOtG?=
 =?us-ascii?Q?Ao1ppDzasGXuzslQ2zOOLnwYGPOMXJqL3fBl46NdIJhfn4PmvgkxYY04bUsB?=
 =?us-ascii?Q?q505QA0l4TzZY6Ct39yGOm6bPEey4kDwe+figAeonmXoFPssoACSTsNXgp0q?=
 =?us-ascii?Q?WXut4vPJirBGqb7CUn3MiU0XdEPHK78HYbJweihqwy+Pu6kHNjA70Ll4JSAB?=
 =?us-ascii?Q?BpGM4LgMebwY+T8lQjPEgnWt7nSV/TNLLcWnWvjVE0w5mdHm68Tx5RcBV7dj?=
 =?us-ascii?Q?Sys04r8FK/Ffhm8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XLb8sL0m7kBWOuwKGztYKSHL+pH8aSbfXnWQukUkZCVUenl+k04mZGnmXKZW?=
 =?us-ascii?Q?k1h6PC+6VxgzRoflimo2WeUqXOBdyJqNEPfJNpYonXPy4dRNCaenCKVD5hWQ?=
 =?us-ascii?Q?anBFMEsPMeZOXhNhp/M4Jj927ssxI86kQniB70zo1pi0JvvWpCLPix3xTusG?=
 =?us-ascii?Q?kwSWaAQopxSlfFgD4CdDePC9CMuX5niH6VXcMgGw3QZt40RXtvibg37lNJ2w?=
 =?us-ascii?Q?kWQEVnG3RznASp5+u/KKhix5iZOiZZ50Ye699rSAXfk3IsRSAaGLJ3WZTDbB?=
 =?us-ascii?Q?mKxU0TOzMab/XmsMrPwaLlPuK9nOt60aihgV/jdapVzXyQE/4hF9yFNna1cS?=
 =?us-ascii?Q?EivTFD+SlQ41m+86rMFVDnjuXeuHBQk8qupnx2kruAAYTHbN43raA1/3GuZd?=
 =?us-ascii?Q?ew1supCE2Rva/ZKu4CfIqa3euP6hJNioYCkMmO5gCh7+sXkC5zaTtCpNnPFA?=
 =?us-ascii?Q?RTMqOG5tsM9AiyIAxNDERjUE+uLeQM3Ny1Qd63rQHxPxFf2tiDcYxles3J9C?=
 =?us-ascii?Q?qxj8Bzx1FKHXqKn/RRlZMMyDN9cQh5a6F0BJdwgcjo1Iw1+EFJ+LN6F25IuF?=
 =?us-ascii?Q?f3cgDcLwzkeKlWs77LqKfF7s62T09ONKAJB+/qLw5OwwpCVWLXgMZX0/SukM?=
 =?us-ascii?Q?GJnMwy9o/eZdxZPcUyXe8RDwdQkSbmLMF314WDJviUGW0aZ1oSxz4ZbWnODo?=
 =?us-ascii?Q?GuMEjKdLH45u/ezkk9u6le0mPAuUdBXU5EL4V4oqihEekfXW80ybiBxdXK/R?=
 =?us-ascii?Q?zIYfKxx05TpwlmI3fQ4MN1xTnQkVZwoXeN9T2xK89z/tmAdbHc7DwtADLXbh?=
 =?us-ascii?Q?KfjuwlOA8ZW7DoSC7Fs8f9PiGuYnkANp4H+av4jv54ye4Aau/Wmgziv/VK6J?=
 =?us-ascii?Q?iLgmWKJbCuw3C85XNl73GsroZeGzSRhYqHQNjjfp9z66HzlhT+V1ibk0NnaQ?=
 =?us-ascii?Q?vYZkSZsgUNKASQFICDfEWq+VpESnf7YDsbUqYIvxuZR8CYzwweAac527pGMC?=
 =?us-ascii?Q?D2qpuxvIMJwsn7wv+x+JU4Y65RZhOj12l7qmP1JsHS9lG/qTs8pzzNob3Mgt?=
 =?us-ascii?Q?KlqeoT3Azn08zkfs8JUzwFgUJpLXAjVSYFZM73ceSfHwmGG3GUCewPRxKEo7?=
 =?us-ascii?Q?owb7KJflUQwmJmyUXlkldO4nm/uhAL/csj6Q5O50ZfibelR7i5rgJYAX6qFg?=
 =?us-ascii?Q?WuAPrjNzKOOWbAXv1F3EJ9UyY0Phw2fb8mQMPBsy6IbH6hYPXxcj794/7YQ3?=
 =?us-ascii?Q?AZgZxK8tmr6KiSwqYFz1OwCIeHzmPXmiRLZM4FDYdymgpKu8JKQ6LYVkJjC7?=
 =?us-ascii?Q?2/cyISM19Uj1PGgxLVE6kdo+o+wXacPC46OtP8OWhc03oNGudKzxJITzlnF1?=
 =?us-ascii?Q?GmSSDFma7s+llG271u1hOOVDBGYLPerMmBioQtw72cC8sUt6Bf4GUB6HmR3f?=
 =?us-ascii?Q?wJwe8MBssgWAwH5AwBkvlYVd14y35EFUkkGqp0RReDbelOwUDmlcMukbHATV?=
 =?us-ascii?Q?oaT6nSPMIhWbkD2nWLR22OhnHqIZq3BvU1puhEHy2ElX4hZtUCIepaGvQ2e2?=
 =?us-ascii?Q?r0YlGw3QF8skrZC5hKw0GNFXYDJ4ETFePLn/PukT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d4c55b-10bc-4ef2-f150-08dda81270d2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 11:32:11.3932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5g2l7gRSikV5pktditqztXOpzOoU4c8A+Ylf8FxJZjmDhgqpGByGq8DAypqCl1322iZGhuqUUlLDLVXoOYF2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9674

Hi Alan,

On Mon, Jun 09, 2025 at 09:54:45AM -0400, Alan Stern wrote:
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
> The situation is more complicated than this.
> 
> In general, a USB gadget cannot allow itself to be suspended while the 
> USB bus it is connected to remains active.  Not unless it can be set to 
> wake up when a USB packet arrives, and even that probably won't work 
> because the wakeup sequence would take too long and the USB transfer 
> would time out on the host.

Agree with you. I always see such wakeup issue on some customer usecase.
Then I need to improve the system wakeup time to satisfy usb requirements.

> 
> The best way to fix this problem is for the gadget to disconnect itself 
> from the USB bus whenever it goes into suspend, and to reconnect when it 
> resumes.

Okay, thanks for your suggestion! This should be the best solution. I will
do this when wakeup is not needed and will also take care of wakeup case
due to some user indeed need it.

Thanks,
Xu Yang

> 
> Alan Stern
