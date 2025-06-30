Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EB8208CA;
	Mon, 30 Jun 2025 02:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751250265; cv=fail; b=VZ0lsU0z7MSuWVWl0lnz8lCO+HHAeMYzfCU8leVr0LKFoClO4ONiTQ1wnWOH7HCOwHJFouUY7v8/6b1YAhyZSrJuSSuy7zSqe+OhbivQIUykQG/mY1oO11Ov1jDNjtZYLjgMetBmnQVFnu+jDCaxIdJAsm+xhIEiRi3WABn7qWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751250265; c=relaxed/simple;
	bh=q5KLYw67D7oYruAbYa0WuBeFvEigR0RtHc4KpOTrT3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S9bB7zUKC7UO1qhkutq/2Wh2lwLfLjurQhWXheKEa2n1dwEtk5InoaTVX1U34qOpjWLH6lM1MlRhJA0X/ApGFqo5WyfsmTIabg3lTtr1BAEs9sTS+87bzddqPCEKTsDMdVE2eLbIg14gAgTkRo3CxyhQ50NKj5IYSFAf/KAyKcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=la2Xefuf; arc=fail smtp.client-ip=52.101.84.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="la2Xefuf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfUw7QgvCYiE3h2tzfaE0qtYHAoSoh8/yiBl/ar0TxcZULJwlE3vJbfGxunLKoeMegq92UBO3yigD9gY5DrYHCkaTxOpiTyUxuNHZr/ppmZdeisI0AOSBDXBOyzt+uXWqAaa+BMSNGL0X/XpFlyq06uhV9wrnHG9ZMMNdSg9zR2trW/PGKlDtCegK/0Xg3w6tkxzV0S7QZlO9OWalwIf/++EMElIP+sJ0BQKZoKQ1uDGpyEBKj9JxZuzrR+nuvbZXq7xcOKebBNkfmr40Ayij4iYHkGyBZ2Fw31F37r+Gopo/asWmwlLbQpYt8/r+A6CnjQR4Hku7WUjWWNyj+iFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKWIr9Kl5ixNTzAvprA/mUXvD4jTVCNCPUoBCN3Y9zY=;
 b=sqBCTh1Pb9Nz7cPlLqq7Nuq5JPVMzjRFrAdarFsEStO8H8PhVe8cW4xw9iEaeMBD3NJ7LCtcrYIM4Ctwa/a1vEbbrpzZxuYEBCOpG76Q4Iqx3TqjJ7/RSTvvl7YRAczEilNKnbvRo/P3TdOnF7xRIcys6dWjuU6Dk+m+sdCEhR40ucvFbizYgvCKHX5q09vTUraomGMJeNDaCANfNuxFNqsfAN+P7EDHy6DeaSOCZhn2BR3lglhpSRVMcmbiI8pU2byvgokG2jrZ60f39Jjzwv+Ukp0EyQ5kTepUfXZMiBgtSngaryvVaETaeVNPlNunmGJ8JYBVKEE9Q2o1D62t5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKWIr9Kl5ixNTzAvprA/mUXvD4jTVCNCPUoBCN3Y9zY=;
 b=la2Xefuf+gb8+ak2+c1wjnGJUKus+f1Obtxz5rwewJLNt2MSN7pfI8UE2txOxOv9Z4P9dqncEc8CUOGmX6F8U9TqJMxFyN3J0KeSoQ9fW9r0LiTYwF0cgvlioj1Km59/SEHIQmZ2rWzvVZAsNKsNOuqlOjCssnuE+UTMQJIjTV+4B/bA16t0v06ILNAnmii19ztSu+HbCVaCX0k0EJexEn2x/fCNw6xicUQ1DfaH3/030m52QVVpcNWHzBNvlaikJ7s1NgSzgK90taW760F/hbMD7FtxqC/5/FNzeOlvTNjAlN5R1NN3eXYmcwPag8c00OpeEKaE2jtxdDge6GgaWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9687.eurprd04.prod.outlook.com (2603:10a6:102:270::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 02:24:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 02:24:18 +0000
Date: Mon, 30 Jun 2025 11:34:56 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Message-ID: <20250630033456.GE13878@nxa18884-linux>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>
 <aF6md8uMuD8EpXvd@pluto>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6md8uMuD8EpXvd@pluto>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9687:EE_
X-MS-Office365-Filtering-Correlation-Id: 48170130-3538-44c8-64c5-08ddb77d36f8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|19092799006|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HGclFd/aVFgvBtPm3M2lLot3sP7RcrXRKqL+g/w+vNp33DxMZmLTMUIraDhJ?=
 =?us-ascii?Q?u5z6SrOH54qKbJVyXM/Ab5PBh1pWTLDsMmMtd3Wjo3uHLKIQKdNb6g6E376r?=
 =?us-ascii?Q?5vm0ng7EHMh8WXRzGKg4arGY9P69JTLuD7CTUgypal4VbVDlSQrk32w4lnkc?=
 =?us-ascii?Q?C8D3+tF4PaxnMeNJLH2zBLzwzGrHUNuyGZGIzSq9NMpkR/7Cmx7iCXmZegAp?=
 =?us-ascii?Q?D17e+Ai2ypg03RLIC0Y8mmyQuZLvse+lDoiCovdzXM3oZR7awPJnblw+UNJt?=
 =?us-ascii?Q?07nrMwnccqPbUniwhQxUmO5ot4syN0Fh/slX2qRlm2EkPaW4JvGBMsxr6R/u?=
 =?us-ascii?Q?lVTpnjXNqc/jCRRWWVPtV+nqYlcQ7U3hng2yIuacv39LDMNnLOWkBhjHkWv/?=
 =?us-ascii?Q?i9w2ii85mdPvDfTlAQd9O2IgSAW3cHQtW9SZZJRZRs1HpZ5sPLSKFW47TX+x?=
 =?us-ascii?Q?fObUiWIfYJnWcK8ebx9WnHgr27yvuJLMM06/oRzRn5BLHnBH5eEOWsok/aGq?=
 =?us-ascii?Q?4vSAcgm1WNz7TAe8mlr/PUyt64bZ1plSBUmXicLl4StmEdWm3pZOX6cCf7o8?=
 =?us-ascii?Q?485MqTokQcR++lJgVlM6xvYzL1PLjkz4xI3zLLFipEeJMtwP5jTQwVdmgFdS?=
 =?us-ascii?Q?wrRDLg8XRF8PLAtAzPWaC3SWcmC7Rphnd0lsHgWS6x1lfw6QL/WwSBCJ8Hnf?=
 =?us-ascii?Q?hZoXHEIUS2LNCRxeG8pxkZNvnU2Qeo0aI6pAMik5tCYSVAdW0+V2+AjYxOQX?=
 =?us-ascii?Q?5z2RHMCRqLBuTY0I6I5oEG1W0Q31sTtjatI3jUi52sHylgJ1cZ4gzukSyPd2?=
 =?us-ascii?Q?CNELTuZPq/ceWq+cOIFoeQ1bxoRkwS01yLiqFqSDjiVoQEjYpTsAlKBI6ZTB?=
 =?us-ascii?Q?gKLDK+VOByQ9oWVKsYekZPl5YelTXWkuDLnWU8eWotyen0iC0C8Lejk/kIIJ?=
 =?us-ascii?Q?TY7F7efu4kCKjxnm2RFxRHIA3GWuSe76SzmlYxgtuocmKYCGFBvVbkhYaAru?=
 =?us-ascii?Q?eTa4JdFDKajeCP+NusID0qeG0rlu6RppXAhPsTbq4n5dnriRFAcQUdcOQOwG?=
 =?us-ascii?Q?KO4sYaorYNsdE/jjVDJqdWiyfHX4k5zikOttZLSjtZnRVijBEiF5OEnyRIVP?=
 =?us-ascii?Q?urzhHQF5jw/o+BMLfuLSst3dk0giqwzWOhqRTuVmu4NrzYub66dxLKd1WpDB?=
 =?us-ascii?Q?PSYLH8aWWr0e/bl2ujLECgr+kfkX+3QgSPLB4rBRj27srAHcSBZRukaRzvAD?=
 =?us-ascii?Q?RspKOPIUfOnRt7+C8DP2y9EU8cV4Ogs9hwJ/Rk70H2h7beR8Eh0z8Grwzn9e?=
 =?us-ascii?Q?hLTXVImC4bL1e0vfG52RrRjMZEfYXnx94OiYKMu/pAQIeT/wOA7uQdfVFHNS?=
 =?us-ascii?Q?ijbh6bfLgEv1T/ZIaeELBrvcFgFJcIrTHji+EOh9TEVBJwPjxJkwC5V6tEPX?=
 =?us-ascii?Q?CyBTY1S5QeLm2PXVIAGZWTbjcfQE/ZJ/ygh1oAcGUuMvA5SzytE7VQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(19092799006)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3Plzt+5/rgCZ6uTX99iYilgnL5VxyA/PM1R8W805dwULu6PH8zkftFVSwT2S?=
 =?us-ascii?Q?BgF74nHmDwfWrttfeQArJdayyIFZhCYRTu73MXYqs+PxAwH08uBiin9bORM/?=
 =?us-ascii?Q?C5P7mNMK+0mieoYRvYj+2GNziimIo2LHGlcuC6UbFz7oKiJksNagKo0TLCMz?=
 =?us-ascii?Q?05MMkJIvkiqvlTX9RNsccyjbYrV2jpA1fR9EOzlgL3gkjFawZsZ8DDAmpohk?=
 =?us-ascii?Q?pZbgW0nq9JlNCIOGXEC4LJE4G9MpAE+zEn+RU7NR25ixJuadxJ6k6shlPEHk?=
 =?us-ascii?Q?lslNApOrhWlzLNEjLkp0SOOLoPKUCa/E99+GKyXfNQDPtNzCnjrA7w2sWHOd?=
 =?us-ascii?Q?pd/o727Scp5XR6CGsjLAjdiZONDb+jQEts0KceDoUvsrLbmwAfSo+iDLqIAw?=
 =?us-ascii?Q?ZemMVn7uAAKAYhfajbFTMGwELyzfpDlkoE2fVvfZ4OzzU54aqI+b3cKsIxM1?=
 =?us-ascii?Q?DY8dpx7nEE1V2TbISKHdaugySFMvzru1c0kCR10+pzFLQAIMudoTImyw4wSH?=
 =?us-ascii?Q?S0+cYQuTKCu5N+Lb4PIHEKrqC8bSLlJD21ieqlGxGZN3BVo8PtKtpOCVjlCO?=
 =?us-ascii?Q?lcNWy3gyS61SdBJa5jJgrJ/MLxAPSd7CmyoYTtWx2naNRx6HjdGJUTcCuHKt?=
 =?us-ascii?Q?u+zo37U+SgGfeKQ3skV82EGyayS1kkrL55yY7WmIDRV6K0d7gIBzQ02HFAfu?=
 =?us-ascii?Q?I+mlZE4A/hEw/uEHYDHG9YMQzwUSqcLk22B8JQNRschfIWS+gKn3uOyuCFIm?=
 =?us-ascii?Q?ZTj1dF9bwDbBOI1HjCh3R44D1lyDYgM6MjDk1UCBLewg9oeiTxgPTiB4y3vx?=
 =?us-ascii?Q?wPuqPBFHvPYCDf65XqtzH+BLMwDbPQFjohkohS4xJ1yAusGHVjTQGqxuY70i?=
 =?us-ascii?Q?2S9Uroa/3WbfuRyA5M6O72Gwt8aWkUQdzM1kX1V7LJNel9eTPZuNOUwqjs8u?=
 =?us-ascii?Q?s2VhUo7drBgAY3gDDT0wIb98V5gM8vUB6v3D9WD/cM+lhIBuEXutqCNcYwz9?=
 =?us-ascii?Q?MeuLSwI+Dy1wii0p5ZnC0c+3jUiCTl2R73hIP/STiG6YDgN9guD9BKh+WYfa?=
 =?us-ascii?Q?S9Taut+/ztIatsXKJmsD2N+yLJu8zIufu1YUCHrPmtzLC9bF6/kYv9X2WECu?=
 =?us-ascii?Q?Wxa704n1ErzbvUmNKxmrwIZFGwDKKVYqXyz0w4uN5JlEIIfo/y4G4pOME6DI?=
 =?us-ascii?Q?Wvc/jQ1cxTG3aq9VlqDi34UkVi7a7BiL+P8m3g5XEivg/yjjZohLJcIdVYkY?=
 =?us-ascii?Q?/ppUZGGskesYtEkkv2r1xp0zaEH0NRBlS3KoFrAtRJDdKp2K3MgRVFR6o7lX?=
 =?us-ascii?Q?bOflHxQkVQplPmf3XC1DlDBCm4w7a4faP8yMa34tA220YcHEtEesZu5cYdMr?=
 =?us-ascii?Q?xq4E6jiXw95pDylp1wXyYr+rGDBzy5afbSshng+nfjqQQoTyPj4Eay7qXAPd?=
 =?us-ascii?Q?880PYbdNUf+8Q2yJH77fwkgEIirlug9CPtsym9nDIfuDTxVjsbHAkd3Rt4JU?=
 =?us-ascii?Q?I4gvYRAmuHPYu9kdT3qMoJNnD3mMZHxJtZAQ8N/hYv/gbjrAzGrD30VpdUse?=
 =?us-ascii?Q?FekCQDtE51xSzH3aaFjels848Q0cHwGh/eco7BN9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48170130-3538-44c8-64c5-08ddb77d36f8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 02:24:18.0945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYWRkwImHpfk0bhYG9+hJu5lmhK5OmTARcpCrTME5dehKy4MqyrLP24RqpTgtSQCDl19xf4E+/uGWf1CdWSrQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9687

On Fri, Jun 27, 2025 at 03:11:03PM +0100, Cristian Marussi wrote:
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
>
>...ah...so you basically cast to void a structure of u32 words and then
>expect that the firmware perfectly aligned with how the struct is
>defined here....size checks assures no out-of-bounds BUT the meaning of
>he blob itself is entirely up to FW and kernel being aligned, since no
>type checking is done of any kind and fields are NOT reference by
>name...so may I ask why ?

I thought to use "u32 *syslog", but this needs a cast in
misc_syslog(x,y,(u32 *)syslog), or I could directly change
the misc_syslog function prototype to use 'struct scmi_imx_misc_syslog *'.
No specific reason, just think 'void *' could avoid a cast.

..also because the scmi_imx_misc_syslog seems
>pretty tiny to need iterators to parse back the reply...do you have so
>tiny transpotr message size ?

The transport memory size is 0x80 bytes, it could cover the current
syslog, but I am not sure whether in future, the firmware could
extend to add more information.

In our firmware there is one more field that I not include in this patchset,
because it is default not built in in firmware:
typedef struct
{
    /*! System sleep record */
    dev_sm_sys_sleep_rec_t sysSleepRecord;

    /*! Device error log */
    uint32_t devErrLog;

#ifdef DEV_SM_MSG_PROF_CNT
    /*! Message profiling record */
    dev_sm_sys_msg_rec_t sysMsgRecord;
#endif
} dev_sm_syslog_t;

typedef struct
{
    uint32_t scmiChannel;   /*!< Caller SCMI channel */
    uint32_t chanType;      /*!< SCMI channel type */
    uint32_t protocolId;    /*!< SCMI protocol ID */
    uint32_t msgId;         /*!< SCMI message ID */
    uint32_t msgLatUsec;    /*!< Message latency */
} dev_sm_sys_msg_prof_t;

/*!
 * Message profile record
 */
typedef struct
{
    /*! MSG profile log */
    dev_sm_sys_msg_prof_t msgProf[DEV_SM_MSG_PROF_CNT];
} dev_sm_sys_msg_rec_t;

With profiling,  we need iterator to get all the information.

In our default FW build, DEV_SM_MSG_PROF_CNT is not defined, but
I could keep iterator in case DEV_SM_MSG_PROF_CNT enabled in future.

>
>..anyway I would suggest at least to add some sort of version-field to
>the struct so that at least you can detect if the FW spits out something
>that is not what your driver expect or is ready to handle...especially
>if you plan to extend or modify the layout of the structs in the future.

Would you please share more insights on what version is needed here?
You mean add a field for syslog protocol as below?
struct scmi_imx_misc_syslog {
        uint32_t version; //Set as protocol version and display it in sysfs show ops?
        struct scmi_imx_misc_sys_sleep_rec syssleeprecord;
        uint32_t deverrlog;
};

>
>
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
>... how wonder how much is still frowned upon to serve such big multiline
>structured information payloads from sysfs ... (asking for a friend :P)

Just take what our firmware console displays.

And in case the firmware does not have a dedicated uart on some
boards, using syslog to show similar info would be prefered,
so ...

>
>
>> +	kfree(syslog);
>> +
>> +	return len;
>> +}
>> +
>> +static DEVICE_ATTR_RO(syslog);
>> +
>> +static ssize_t system_info_show(struct device *device, struct device_attribute *attr,
>> +				char *buf)
>> +{
>> +	struct scmi_imx_misc_system_info *info;
>> +	int len = 0;
>> +	int ret;
>> +
>> +	if (!ph)
>> +		return 0;
>> +
>> +	info = kmalloc(sizeof(*info), GFP_KERNEL);
>> +	if (!info)
>> +		return -ENOMEM;
>> +
>> +	ret = imx_misc_ctrl_ops->misc_discover_build_info(ph, info);
>> +	if (ret)
>> +		goto err;
>> +
>> +	ret = imx_misc_ctrl_ops->misc_cfg_info(ph, info);
>> +	if (ret)
>> +		goto err;
>> +
>> +	ret = imx_misc_ctrl_ops->misc_silicon_info(ph, info);
>> +	if (ret)
>> +		goto err;
>> +
>> +	ret = imx_misc_ctrl_ops->misc_board_info(ph, info);
>> +	if (ret)
>> +		goto err;
>> +
>> +	len += sysfs_emit_at(buf, len, "SM Version    = Build %u, Commit 08%x\n",
>> +			     info->buildnum, info->buildcommit);
>> +	len += sysfs_emit_at(buf, len, "SM Config     = %s, mSel=%u\n",
>> +			     info->cfgname, info->msel);
>> +	len += sysfs_emit_at(buf, len, "Silicon       = %s\n", info->siname);
>> +	len += sysfs_emit_at(buf, len, "Board         = %s, attr=0x%08x\n",
>> +			     info->brdname, info->brd_attributes);
>
>...so some of this stuff Build/Silicon/BoaRD info has pretty much
>'forever' lifetime...are you sure you want to query them out of the FW
>each time you issue a sysfs show ?
>
>Cannot you simply dump this stuff once for all at probve time and
>instead query misc_cfg_info() upon each show to refresh only the data
>that will change ?
>
>(this also corroborates my idea that you should somehow partition this
>data into distinct structs by their lifetime...

In next version, I will change to use probe to query the information and
use sysfs to give userspace an interface to get the queried information.

Thanks,
Peng

>
>Thanks,
>Cristian
