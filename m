Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2DF18A6CF;
	Wed,  9 Apr 2025 02:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744165760; cv=fail; b=K+KwB0l+5kHfT9x7byuEG+f5nRL0F8L2GbUYLtEY6fdCRPKrAuz/C0V6Tr4lsE8kS5VL/3cMLPvAIX/SIBWUasFPfHTish61RigKTTHxUP6F2ZuQGtAHjsJbA4TE1z/6CfsBkSDQeb9O17ixAunZNOeCcJLw4Kj8NVUKIOOsQrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744165760; c=relaxed/simple;
	bh=W46wdONsMQ4o2LBLHljTHJ6ytBrW24PwZ32qRZZt5ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VDuqMbgSDP6sttyLnc9ddAJEhhLavO1QsFJoU8fU9Fw3hYf6WxtvJmMoJ8fQqX8xitAbNIJWSoeyGcGpl3RApJDvboQb2nAjCrQ9IoGmDnFmDVeOTRlGoi+BTy6c1xNdlx8Vj8B2ab2uYB8iiqBRIv+Jhd2lJai+xNtADGtQt3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nZxTPZq/; arc=fail smtp.client-ip=40.107.20.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nZxTPZq/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qbc81a7KUxgABx6eh1h2BbhAHVhyDAKxUq/Fw9BmYjJ8EcghFptpRSh5DTIOEtW79ha4GZhDBsTcqlzFnWQmoUgdOBR66S2nnD4FZ3I2o6Zg7hqpClVGE3XUtHCT05itGpXTQULY7VDF060hISsSQV+o18Qkpwf1Z2GuxnZiGE4o5kRVdJgYMK/PWkr5cKRkmyNbIHsD5rquEOqk4D3d/MD0NlvUf+N+pLqH7ghWjRbQ1riDB6/PulYoU0yv2reAAyA7XrEwoDrLyZSFY+qH/gVWe9r9UFtL6Fvk5GwTFFuLr9+jirgfkygXJp1dTG5fltBYyS3KHPFo9TL1e9fsoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeNjNXVLV4k4MD7KbcP05jSpt+obTlJiDCMzkyLhxRM=;
 b=X6yhf1SXo2G1TmL6bAL1bAPs2chMsgt5xKw0yKQVEpcd314aFcRulxzNr/JqAHp0DVv7Kt37tRX6uGbGONZJCTiUiMYcaYigVcyQh2e/r/lNGbP3GmWo1rUQLaPuaYlbnh+LWd8lEimyUVlUpgyh69R/+ObGc/WGQwfkebzENnbAgEE0YIOFCMtgMr3UKomNeqAkat2PtB4+C8dcYEGoekPwphWFtA6ymk8jgLRWNRn6OxApjTzYNvlnXrb8W//5v+5FYjw5VZcLTL4ZR89XoufnjAj7Ws+YIHEUaUcRTBg09OYTO4qt6lV5SLTL79KSsKYbd080+r6J7hlb5aLpsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeNjNXVLV4k4MD7KbcP05jSpt+obTlJiDCMzkyLhxRM=;
 b=nZxTPZq/C+XFDGLNI1Fxi/T2a4yNgELIl1Q71z+kb/sqcXjyzE2w+9GU7U8DeVSxnCxpHneplNHG3Xt8ZPXuuqa98/aynKQ+H6Sn5d9ZGypyWX9VeuTvzeYemS08vGVbvSrxf8S0YLV8TtEhPLs1Djd7Ih1Je4ahHxBuXoUlJky1s0GIZDmRIQciO8Eu8p6777FmH6z+9f6o5mDbjFmlGIXfvDEbjTLOUn3EIqyPGpxZf6eQkGTfd1zE9ao8nqgHoOSG/0qPjoAl16sMpNo7EuPWl9JcrC/y4rjsu2jvcqJ4CoGPujgda2w7n8DpO9amCgFrssTM6mkKgQ+gjffqEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB9205.eurprd04.prod.outlook.com (2603:10a6:20b:44c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Wed, 9 Apr
 2025 02:29:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 02:29:12 +0000
Date: Wed, 9 Apr 2025 11:37:39 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <20250409033739.GB27988@nxa18884-linux>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>
 <c71fb862-85a5-42d4-91f8-398d0d532872@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c71fb862-85a5-42d4-91f8-398d0d532872@stanley.mountain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7ffdf7-5340-4296-1568-08dd770e5082
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?64EPYFSCtsDpW0xlAnGg9dQGXpuHQ83G0ufTSoNnblToohIvxgJT8fYSAKM1?=
 =?us-ascii?Q?j3el1nL9liZVO3jJpAczSmkkC0M9qGZXgau6PNBru4W3vFtNoNfEZOgk7i4H?=
 =?us-ascii?Q?TU9GXfsup3EooN21uixuG1aU9TN63HgaI/dZdvQArFL9foMI+tj58/UHfPDJ?=
 =?us-ascii?Q?rlt2G9w08uMzNVG1PIarpNuLcpt/20yul5HVdLvmFPHHLbRSpfvB1+xPfbXG?=
 =?us-ascii?Q?dTiv2hCksN8jeAwDpy/Nk4JwCwzQHa2USkFpJs8U5LpWCYaPvBxnbky3Mzfg?=
 =?us-ascii?Q?guaMmvZ5AJuRhDaZ3fPvBGZtcoqkIdb5wc0aON5FHSWO7WfC5ux8W+qTQ/F8?=
 =?us-ascii?Q?4LDMIGozWv69IUqkPjnHZAbAbRBgyPd4AckLcsH5X/oKVFIaZXJEHLYC/Qo8?=
 =?us-ascii?Q?yOX3NBqW03fXEGomxcqD0Pif1yp/T27m/yE/QIAMoHjZqhPV1gSdOnUpXP2y?=
 =?us-ascii?Q?HzTJzJYcfBPFVqQCGjZlPrquIHNHQQ6MUsWPCcwLEkaFRuLm5ZIfLWQX7WoZ?=
 =?us-ascii?Q?Upm+9bgfFJ06q4AzqVYoW2KVw4R6GMrQZUi95rBSCzNBSkRFZ7sZsn1TERbs?=
 =?us-ascii?Q?qPrSExOcgQfssDtPR17tAae46il61EQ7DlZSTwIWaKoGLxv6HZBuBprt9xen?=
 =?us-ascii?Q?iaYWJoMxC9qJeGi8LlHdCfjgdonFdbFCrIucNSkK0VSL6VMxWGmX/PSdL+BB?=
 =?us-ascii?Q?YpFIqeMjoQ+ZtAHi5NZ+8luFN1phzjY5pPwn6lueL2hvYlOMmF6icy8fqGVy?=
 =?us-ascii?Q?nYNjLpVtD5P8kN2MiWamJWoJdzvkXOIKHKlWRo5v1rjqaWZa+iZWAFwj+/TZ?=
 =?us-ascii?Q?GLpfMMzuVEO8LXHLuSsfKgZk5HRb4nmMVwRkzz9opzfCAt4ZOZpEN8LeEzka?=
 =?us-ascii?Q?HJsvC1o+1N7R4F9wPgXMAYZOwpO9JzGRuRB3BEJRVdYB+8wlJ0SdsNs7uIqs?=
 =?us-ascii?Q?ot1zV7PXS2jWEbq5HxFhINentcvdMGVCAPw25wjHUf9A8//Vh4h0JuLQEVBa?=
 =?us-ascii?Q?7OoJq68PlBFuqCsxECR98kvV3FbY/sdGScSkNA4K0HuKFDzHPXUASHm48mOZ?=
 =?us-ascii?Q?wPR062YPc1SkNrqZ0JNPD7rgyPnygFgwqH2CJfzkYLpoVDZT/tYCKH/R3fPn?=
 =?us-ascii?Q?zB7s88TPp22rgmtqqAIeZaoyTspscE4sXvNA9U3AFBOSLrrCxxQpvTQ3YFNo?=
 =?us-ascii?Q?5Tt5N1It7wi9nyubBgzMqVMjdMerb9o+k08OcEn4yzVdBlbhLGaSYSfEp2gV?=
 =?us-ascii?Q?cgyi3tEN4VRrO9pJbNUhBOn9qnlPn9LukVRWdxIZkCBqq37XOQpq2gydfhqQ?=
 =?us-ascii?Q?DK6S6RBbLtXcIXR0O2tubnypHmIBkqjDQn5R6YUNORb46ER5ULneRCD5Ipam?=
 =?us-ascii?Q?nmYf6gYYuQCuuwpTPvBY8476PCw474Sc4vRDnk/cGOexD09uBNu2sUuLkfY+?=
 =?us-ascii?Q?B9NIcfm+j8rG8BhWD8CEdZc8qE93k3w7uaQ5+oCPCfFwQ0lUQigr9gVa5ZmE?=
 =?us-ascii?Q?HWfB7PrqmX4WOz4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rqQmBwt14ChkxasLdjcxfGM+VWGhh7eg9vp+5xYHWLUIU/hsPVecY7Zw8pOH?=
 =?us-ascii?Q?2Xl1/D1J0sNwZxNZbDHZhIzWxnGijXZ+5eCXw0s1JsJl3Z8rcf/Y5TQmnSr/?=
 =?us-ascii?Q?FnOCjpPP+YFIz3se1s6Mtpv1k+hxG3R7y+CPkTIK3+dHTtsdwr7HphCstZJH?=
 =?us-ascii?Q?tvXNeNWl+s7cxlqDKy9GMZfOXacxqZ+x0l5quCJND9Uxs/F5VjKOhK5O8v7X?=
 =?us-ascii?Q?8iW7flnVhM04gG3Rid7Q7IEfZnqOzCnchdwOZcEfjOD7Z5dviRihCNa2ogkM?=
 =?us-ascii?Q?DFatPRS/FETG6uA4m9/yjB4qD3o4NbL/sJmtave3K5toQv5isMQ4qFvelCtf?=
 =?us-ascii?Q?+vyFishstJ2p4GqPJ7/UtVMu0opeTfsI74sxD6oG56BT8IijC1rWGoJcnKoT?=
 =?us-ascii?Q?M/XPsc55rxdZ6YtKnMY/zxgh2rdQF95pMJU2kld7E+AXzRq0J+hoxgJCAfs0?=
 =?us-ascii?Q?vtp+n0DyYAih5+wgAcN51xBphpem7jgSIloBdduhEARnsq+NJAQzYoQOPUmW?=
 =?us-ascii?Q?7Z/B2fQ5TTAgOaanEEz25+fB4ZaWHZEevkjZLnvWckMbN5ThRtFwAm2euBPm?=
 =?us-ascii?Q?I+5bzy3hs0pix02r3zgDsHQlbe3EVgrY+DVUYgjZrCuPu0OTtuYFByuRWmtL?=
 =?us-ascii?Q?pRUAK/HahC45ws7htW6KhY8/7GZDrXdB4CQR5I+wbtXXXGO/Avi6KJNfdVHB?=
 =?us-ascii?Q?mPu8AWEkAAw337fC6okKpv19iqH9WjzCpnXaJWNdUjZKcnvZumGgYdfQG9uD?=
 =?us-ascii?Q?ujrIcSt2qAtdANDXUXNnEpsCzg+qvn8CVT9y28Tl3O3bgYC3uLBTyGVnlJgO?=
 =?us-ascii?Q?OUcL159WwJnFLEmtM00GgRbz+/zCXtbuDU0Y80JZvn+aUAJbunoXlxy/zDlv?=
 =?us-ascii?Q?nGEk3cxkrW+nyptx+wf5YpYA0A0rfH4ovRSXN4Qdyz7mRH0WbXEo9ksaa7el?=
 =?us-ascii?Q?XxFH1YBtynZLicDCroGj35jA89DTfjUk3mQBxli+BeAS19AqA4Cl6F0EaJLQ?=
 =?us-ascii?Q?6OzIWoC8b/MezoAMOFr1xKausj3DgjZ9KBUbA/TNkIoRtWmkkHV6NAy21khD?=
 =?us-ascii?Q?pQOKC9XsLEpERxf9KvOYhy8nunFpy/BNST5/ETNMmwKttLUgXrw9+sj4Meri?=
 =?us-ascii?Q?wl7tvgNwZJ11HC4cmFTMQw6b/R6XxYxp6RWpGQBrlEAkwH2vDERv8hjv0lAh?=
 =?us-ascii?Q?JmoNv49kbCSl+SCd7lv3EjrVHplk647UD300h3uSysf9ZFyHbWgxrgZfh1jr?=
 =?us-ascii?Q?O7xgBA8bevODLYAutT+DPl8nrh7dCe2NwyEEfYJGyVp/QzGJbuGS2jznFPsL?=
 =?us-ascii?Q?QHAe04ptVcloBk8L8mweqJ9GjK/ytlJj0IopD0jdpqoxd5UHu8uDfjujJ5iG?=
 =?us-ascii?Q?1EG8xKY0zOVtAJrgGiVyV+YzAktog1AkmT777gDV4Dk/DA1Wv/FYZbR8pz3G?=
 =?us-ascii?Q?/a/bPiltmCAbYueDpFm60Zg6Gwkrkit6XAKJpVMPgqLXj8dS9vT9TPc/VZbr?=
 =?us-ascii?Q?BxIda6eGrTpXzWMHWTMFzTs35rlkS5NCmxogwPRdvmsJ+u/kI/lA/VIPLkc4?=
 =?us-ascii?Q?BDVjh+RmeV87WXytRrOAM9JkpjgMfrYRinFXPP2P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7ffdf7-5340-4296-1568-08dd770e5082
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 02:29:12.2133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orjobqqNv6Dle8+4UV7dHgI9h3cHnx/YAgJtZFnHRjyT8HB1vbi1sCFb8X8NxW0JhAo6hKGoWR9sU7BuL+zD0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9205

On Tue, Apr 08, 2025 at 12:17:54PM +0300, Dan Carpenter wrote:
>On Tue, Apr 08, 2025 at 04:44:27PM +0800, Peng Fan (OSS) wrote:
>> +static int scmi_imx_lmm_protocol_attributes_get(const struct scmi_protocol_handle *ph,
>> +						struct scmi_imx_lmm_priv *priv)
>> +{
>> +	struct scmi_msg_imx_lmm_protocol_attributes *attr;
>> +	struct scmi_xfer *t;
>> +	int ret;
>> +
>> +	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0,
>> +				      sizeof(*attr), &t);
>> +	if (ret)
>> +		return ret;
>> +
>> +	attr = t->rx.buf;
>> +
>> +	ret = ph->xops->do_xfer(ph, t);
>> +	if (!ret) {
>> +		priv->nr_lmm = le32_get_bits(attr->attributes, SCMI_IMX_LMM_NR_LM_MASK);
>> +		if (priv->nr_lmm > SCMI_IMX_LMM_NR_MAX) {
>> +			dev_err(ph->dev, "i.MX LMM: %d:Exceed max supported Logical Machines\n",
>> +				priv->nr_lmm);
>> +			return -EINVAL;
>
>This needs to call ph->xops->xfer_put(ph, t) before returning.

Oops. Thanks for spotting this.

I will wait to see if any more comments.

Not sure Sudeep could help address this if no more comments, or need me to
send a new version.

Thanks,
Peng.

>
>> +		}
>> +		dev_info(ph->dev, "i.MX LMM: %d Logical Machines\n", priv->nr_lmm);
>> +	}
>> +
>> +	ph->xops->xfer_put(ph, t);
>> +
>> +	return ret;
>> +}
>
>regards,
>dan carpenter
