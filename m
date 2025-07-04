Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012051.outbound.protection.outlook.com [52.101.71.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7932874EF;
	Fri,  4 Jul 2025 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620643; cv=fail; b=Ub7ojQOkk79CdhIWeNEv8ejFn18CfylqIKeR6BPlePhbTqhs0o/iMiCQ3neftcSA3iUee9Cafo3t+JYGAlicFgxzLAAITIZkgITLhHc7WoH55l7i09PSv2c78+anz93zHcIvbTGDlIVeyBGSZpQX3yxQEcTlmL/JUmNXEdi8EU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620643; c=relaxed/simple;
	bh=vgzztL0Hcc08Z6DZu9GEAs5swSUVS5ty2/PYrvEHP9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mC0IA7dKVj6u3fQYciq6YIUtB8rBYv6Ht/gXAkSQ5mH08BFV6IegJtYJgR6MI51Epwgh3uw0iUmSzKSlm/NIf0c1hIBK+HPlKfwUkbDMya6tGiACe3EG5W7SL1UD4V8vI9/c8aR6Qic10qpyglri28hl5qdPSrDBmR0ARUlJKOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YDLsHiCU; arc=fail smtp.client-ip=52.101.71.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YDLsHiCU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZktLfz2YZnD2I6Q/88LHcuWbmI+yqroXJhzQA6d+aWFTmqyzmTFS8ehqyN7n3OuBwjIbONd+RBDoHFxze0ba/Qapvqh1rFbUc7bEPol4LY3zmoTG6V0Nx2pTbz37/yYvJmHsEyxkf22bsM73M+KbO8QEjtckmzJ6yV0IlZJLU47XbeDqsbjEjJhL2YzHbL5YscFjb5tqPJ2rd66DPnet8FheK0BfLhl4mZexYWyLnTK9RgbDhRUgSya6WpSc0WSoSn1qMVZlyVIyJeKLFWlzHv4ZcR4h+WqnfcUnrAfsPZcN+jqOH/RkmD420+tb1MwkmwP2hXO5d8A0mXIfPLCGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Alz6nPBt9rB8O9VfX+APsxW6d2d+igrprREpJzHRnXk=;
 b=oZm94I0Gw0J8QvlYRSXp+E0wXjlbrBxQvg0FvTVxtRXayXlMnJNM+Rmyzowg/eYyDRNBv3AKYZJZPKJKGMmftF/0RjksV669rmFjXJT26KNcCJJ/AfC7au83hZGQjB+NdEihTTfK9doQhVUJn6Xp+/8raqBEXjB4Rv5d4QdwXrdy6oisCiPBWwQRmaEDf6EICpBe7nnWLAAba0uwrjg8RvqTnar2b3MLSMf3LJVlUGtg6QnLv/obKkTDYHAwtD1AETtAg6wWX/bQXfAfEpxAM2x58+j684v9ieMCUvlNuithwo1V7fVdhaqy5SY11O6dXR3H6hRUGe33BqkIfld1ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Alz6nPBt9rB8O9VfX+APsxW6d2d+igrprREpJzHRnXk=;
 b=YDLsHiCUUEmM0Um3YB2Ia22s2ljtifyM2UL3fTxaBpk4J4QLgriJ13FrQGyKfJKzpfUImKzbUjtRliMv+YDmi7VlETbFdNXXk8zyB2pjgjDyZO4mjo5xQDOEqrRGC4F2WdJZasD3d1Gt6SsC1QkF1C2A1FJ/x+R67PYa945hlqv/naE3Da5LWhb1GLJ/wqmXjPHCms8kf3/5KQjgEp47UaAaFOA6p+qQNMTRKeojX2RwWQjP/WV4zh/J97DveHoU93vY0g4MoIb17weap9ji9dPkAKjUectzA6QIBmz4uzh+HDHMKxjaMC7084ktmxLNgTTyFeYMuXU/0HU55q/dnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AS8PR04MB7975.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 09:17:17 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:17:17 +0000
Date: Fri, 4 Jul 2025 18:28:02 +0800
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
Subject: Re: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Message-ID: <20250704102802.GF4525@nxa18884-linux>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>
 <20250702-berserk-paper-uakari-74a8bd@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-berserk-paper-uakari-74a8bd@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA1PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::10) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AS8PR04MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: 242a612c-8302-49b4-0474-08ddbadb926c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZL3ziwIFGtpw9fxHtmQRqbprEJG27RaWqdjnQCYrl6A1fgXXmciPN+d6TUnj?=
 =?us-ascii?Q?J9cGCPrqQlhnWx5RcQV9dbVDYIc7AU/wcehTZTd2OMuAuLLYWT1kX9hkYFYO?=
 =?us-ascii?Q?+bfVxoUgmhmVtu52efm9pmgVPR/ssSiVM3UiMspTCzBtc0l9zxdWXGWO2HYv?=
 =?us-ascii?Q?bcA1fDj7DoOXcAikfrOC5CDIbsa6ueDliqa/IMrXCMk1fBn2Nsai0hOJ+jlh?=
 =?us-ascii?Q?I6DVZSJnUdCs16lvoIiZ55DG5woDx9EpjYAXeFtPIa3PPGfzz0b8FP5OBTN2?=
 =?us-ascii?Q?UVvV0Ip542LIc8Jge2q1sYSnLsbNy34w4rKThqbx9/to/CjHeiXFU5DOAdcZ?=
 =?us-ascii?Q?8b7WeadzGZlAhwIWpteLTK08D/n5DWCNTrCeoXDXDAeZz/9Mr2d+HiSM9bgx?=
 =?us-ascii?Q?VXTi3trIqjrUiu1oIO3ExPP0u+NoztyaBBV6RmJDAoYHoEnYaL4XhtYhz3EH?=
 =?us-ascii?Q?THqR2psqMXF0sRsmo7rugRI2zb5kbCzYOztF9875goNXF6W5Jzf9gTYj3/YQ?=
 =?us-ascii?Q?InHwKD5yN/kEOLAJYvCSyd0gKoqboKQ+cP9AvuHThyS8lxidFq2wr01T1x5D?=
 =?us-ascii?Q?ggelTjGQn8XQ8j8PZkNQEbXtTN9Gb1daj3NSmFLZDmVYM9Hji4p7QzZW41TO?=
 =?us-ascii?Q?dUeOoOQ/h1A5l421XK317NtvOf9NssOjympFf7FX3YhfGlN9tRU7PDtpqddp?=
 =?us-ascii?Q?hwaMJPd7q+GLilfLlNWsh700F+g5HNIri2rf8RP7hLLE9EuQ7952Yd6NeFVB?=
 =?us-ascii?Q?7IZwlIAP5aDOmgA54g/3NeyoWjdG8Z7Afyc0+3pK+olN0RNZF4ROY4+wdlSC?=
 =?us-ascii?Q?+7oIZMw7upC2bQwi2kSHvL+ZJ5qZW8518scQNKOu6E3y/1YbOOlXP93uRDzE?=
 =?us-ascii?Q?ZUN/QprbSh09FNAstgrIfc4gM1EQ+iW8YXg5YUDBYInESVBoeYFWxX1gTOLO?=
 =?us-ascii?Q?32SeubPe2apX/4fecHOx2/gndAUwZCDkwgcra0+YgnISiONjsbnjeWcbP/2v?=
 =?us-ascii?Q?cYNjMB7vYBiOosALn51CrYgpw1DcraBwyBiE+JBFggDta/VhvYu0yH0DVngM?=
 =?us-ascii?Q?Wc4cOVrSxfhzqOwCaAHfum2/PlJ0k+aUibqiKFNKHfFpbS3nZB0iVdI1Im3j?=
 =?us-ascii?Q?AW7W+yr+RT6bLnr+FrLsAtm+bbMUg8Q6etPQgMLJgc/VoXZaOn3aU2F9Jc8s?=
 =?us-ascii?Q?GJDC5ZeO5XMKzb670zTdUxvrM/qj1v+4brfBlRsyGXnbHFTc7/kQNxpl0+vC?=
 =?us-ascii?Q?4OkjzumaeeXOkTrWglPPmybXouxzfnVZ6IMC9wjJ7OwEC7qO6jnPDUZcVlkQ?=
 =?us-ascii?Q?wjzajsbFaIjI1dQGRPZqSV0ChNA5OuRU7ilEBzrkZ2jGCSAgJg8Z+/dR+DrQ?=
 =?us-ascii?Q?Ns/2AP32ysiFLcoqMubYIhWabcglHOh5IjcPOSQ/1048ypXC7uVaj3+caskB?=
 =?us-ascii?Q?k6odsjQounYhn1XGeYpSB9fTEhAK4SMU2u00GOVdD6bbli/TskXddQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YWIIYGXsf0GpbSEElBxiVM37jWcmAls2JCUVZKa3mZSwRPl7VFU7tZLUH4A5?=
 =?us-ascii?Q?xPC07rwwooPR9Uv6VakYFo5XVnN9sKKFwXa8uvbktnGYaoASboFn0nI+og7K?=
 =?us-ascii?Q?SR25UHJshJjZwq5aMTqpMsgYkPQ3sU3hREmCaPFYhMQ8O0+bcK+msvhP5sTB?=
 =?us-ascii?Q?GZLPnyGD3RGwt1VX/DfHmRkbNEkHQF4wHlBWuxl0jxTPT0YNy6/veMC/hJBy?=
 =?us-ascii?Q?kmmzXMjDQ7Z6LI9ATG8u69+2jThQIS4GntAzii/w5srvWyUc06T5P/CGRndy?=
 =?us-ascii?Q?FvQ2dKDsyV0PlM9aYsOoSbg9Wfs0QOZEnRa0lH7VrGecN/k1fyV3VTJcrnhT?=
 =?us-ascii?Q?WqtU1tZ6uXIqkDbOQCkOP91ZuaUG8qWFSVAm7een6UDe346P2MiWC+PSmZX/?=
 =?us-ascii?Q?WrQBSOCKYEDKv5muQwdudXyUt1sNzudZl5dGz+Qk2Fir5XX9ZJfp3/CK9lct?=
 =?us-ascii?Q?9HdpEotnYnbWd2ElSIjVJKyJwYTzbG+DRJoyJ7mYnC+Ok3v5AVl7mtt72/K3?=
 =?us-ascii?Q?zwkPV2X49azz7cEu0UfqhNFBsDMaDQx2gKLjSuubOmZjZCvAeKAP1s35lphS?=
 =?us-ascii?Q?2GUGuXS4iJnQ8AV3YF6x9KpTv8yytd5ViMrEIvhL1vQmFVKE7eyWGqNNJCkZ?=
 =?us-ascii?Q?edJg9eaiK6MqFk6GmuJN9sT/mgqQ5u4bLhAx5BbZB3yGHyjwiuDMplz4Z5hm?=
 =?us-ascii?Q?HZZpTh96JXlYRXGpDRRr+5SadFTrQ55R39J11XHs9wbuXdIsRGzOmhmoGwMs?=
 =?us-ascii?Q?QDrlW4iRiiiF7JEvnr89K1B1wplQUITJC2H12LfQ/DXryxOh/EQ7sqZUQY+f?=
 =?us-ascii?Q?6o4BW9yNCCXNLJMPPHTZTCDqcwRiPnULY0fuu73qDV67Dtx+oojG/qcxt5U+?=
 =?us-ascii?Q?SpzCTALiXKwmbi7TXIO6XrkKiRXo+mKIyt/P0pMP5cNJ596kJJD/24+YeQ5y?=
 =?us-ascii?Q?wXIY+adfuCBjbb4ZB/z1FitxQj8Sl+CDQFWr67x6XuFwPSkDMpgiJs8Y30zE?=
 =?us-ascii?Q?VbQq9PuS6oPaKv2utYJI9JTDGYXE/vaT9b9n9lz0G9xoncFH5RrN24x2cDn0?=
 =?us-ascii?Q?C2WVmoKoTDJmA9crUbO6Smx5Ctr8/54+/cdM7LnyDvfO518owJLbpa4l8bpT?=
 =?us-ascii?Q?CHDoKtCjFNb8CU70Nt14erXKaVkuOda5sUno6cUcMHWEh88D1H8PmdbTuNR3?=
 =?us-ascii?Q?tOqJT6O+gDkplhuJSyXjh/+efrSJwhp3elJqGe30GZbczKxvAiqu66c1Go3C?=
 =?us-ascii?Q?J3eZCju2s+Ca677HCkzY7CVcZtHu+vgL4UuMF5MKRBHLHuBU7WhbwpyrhF1M?=
 =?us-ascii?Q?w8Rs7iZXL+HGzyU6G79kLNOx4eNwkDFZnAVpO0yQhisPHLtzNQtb3FaE4033?=
 =?us-ascii?Q?cMsHdWzao0mGi7XbMPFmMlNOIlgh9pcXmVzqE9OdWcEUMth8NCbEO2nSBjSI?=
 =?us-ascii?Q?sPiMMeoPVEpCQvnxG4NE48VsMn0bIUD3hKOwlP0T0ka5c0F64JQu7cw3/GND?=
 =?us-ascii?Q?ZEHIYD/uVzyLcPh4SFtTfOCFifTJgEM162fXBrkc9eF96QVXi2VlHNmVenfA?=
 =?us-ascii?Q?7+nT5hhmVdJhVN/3dtaHOmXRlfq7db1d6DsA80MV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 242a612c-8302-49b4-0474-08ddbadb926c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:17:17.5057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79NolZGQlltwij4C3QN75HESnWQYXvT6iRibvSt4m5h/ibD6bSfpRgmj8UyAA4W1XZrJHmMX+wYKUe2ZDkEPoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7975

On Wed, Jul 02, 2025 at 04:22:47PM +0100, Sudeep Holla wrote:
>On Fri, Jun 27, 2025 at 02:03:50PM +0800, Peng Fan wrote:
>> Add sysfs interface to read System Manager syslog and system info
>> 
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/firmware/imx/sm-misc.c | 97 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 97 insertions(+)
>> 
>> diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
>> index fc3ee12c2be878e0285183e3381c9514a63d5142..55485a3c4a5c615102a377f41025a6911d746770 100644
>> --- a/drivers/firmware/imx/sm-misc.c
>> +++ b/drivers/firmware/imx/sm-misc.c
>> @@ -44,6 +44,100 @@ static int scmi_imx_misc_ctrl_notifier(struct notifier_block *nb,
>>  	return 0;
>>  }
>>  
>> +static ssize_t syslog_show(struct device *device, struct device_attribute *attr,
>> +			   char *buf)
>> +{
>> +	struct scmi_imx_misc_sys_sleep_rec *rec;
>> +	struct scmi_imx_misc_syslog *syslog;
>> +	int ret;
>> +	size_t len = 0;
>> +
>> +	if (!ph)
>> +		return 0;
>> +
>> +	syslog = kmalloc(sizeof(*syslog), GFP_KERNEL);
>> +	if (!syslog)
>> +		return -ENOMEM;
>> +
>> +	ret = imx_misc_ctrl_ops->misc_syslog(ph, sizeof(*syslog), syslog);
>> +	if (ret) {
>> +		kfree(syslog);
>> +		return ret;
>> +	}
>> +
>> +	rec = &syslog->syssleeprecord;
>> +
>> +	len += sysfs_emit_at(buf, len, "Wake Vector = %u\n", rec->wakesource);
>> +	len += sysfs_emit_at(buf, len, "Sys sleep mode = %u\n", rec->syssleepmode);
>> +	len += sysfs_emit_at(buf, len, "Sys sleep flags = 0x%08x\n", rec->syssleepflags);
>> +	len += sysfs_emit_at(buf, len, "MIX power status = 0x%08x\n", rec->mixpwrstat);
>> +	len += sysfs_emit_at(buf, len, "MEM power status = 0x%08x\n", rec->mempwrstat);
>> +	len += sysfs_emit_at(buf, len, "PLL power status = 0x%08x\n", rec->pllpwrstat);
>> +	len += sysfs_emit_at(buf, len, "Sleep latency = %u\n", rec->sleepentryusec);
>> +	len += sysfs_emit_at(buf, len, "Wake latency = %u\n", rec->sleepexitusec);
>> +	len += sysfs_emit_at(buf, len, "Sleep count = %u\n", rec->sleepcnt);
>> +
>
>Why can't this be individual files and values ?

The System manager firmware provides a command "syslog" to dump
all the information, I just follow same.

With individual files, some values may not be consistent, because
system behaviour may change during reading two files.

Regards,
Peng

>
>-- 
>Regards,
>Sudeep
