Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013024.outbound.protection.outlook.com [52.101.67.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA2D157A6B;
	Mon,  7 Apr 2025 19:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744054953; cv=fail; b=FiTZjXIO6KieBmRo2PZ0lSA0eosfz//v7NTMRWJhMQ9iLUOWuHfAIqIAxPzabmcsadAVg7F8ZKO8fZl0VQq716YJHl94d8jHvSNTpMY+ai51nuAFA2sUcSjQgqn5Lt9E30YqOPy6NQ6pxRzDOLxFFYaTMz7N3+KurgCgIbouB0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744054953; c=relaxed/simple;
	bh=RLfz1cePgofI4myyCuvpbC70y6Bh7oIp3D5IDQEDnAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gxTB+IC4fy9CtEjA6GQxs5B+21Q4j20iJ5UEULHN+nkgk+A/z7Gt9JqxBZ5054x0DQe5zqjGih5QuTmHoevO2j5j8aOKBfvgEYOC6UmcKp2ZTczj55Dfzs571xSQGJeq5R3GBjO7hAk3D5bwE3IVrVoN9sM6EDBkxTNPjIZsnX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XO22Yoag; arc=fail smtp.client-ip=52.101.67.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XO22Yoag"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CE6/ModZ6eIrKfa4id9K9on92bBJJ3i5zAMUTAWCbFOAYK6KakfhksSzewF5Bhw06XnZkPHuBncylyZhfaWZxNzts/DywtbOlodZ4YTGi365O9D9jPP9SZMLXhMhYCP6R6wtPowEDNraPWWyWp9TVVG29pINtPA7Wc2Lu0aDruqiPANxvOI4CtT5UQEwlB7isclBpOn1CR4mfMEj9HROHGLi1WSBzbWbUxL65jl/HuDYuleIrtEuNRl/U6L3/Giz2inqVv6aUn8Wo3WgllQFVGAxAkHQ3mOOuJQ6AyEe2cWHfB7KP98dbCs1Rln481l4HqNh8J594sf6k13g/MXTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJtcVjSw3m4Rq83GLBebkejmKo+TP0u1XOUPNlaa+QQ=;
 b=CmEkgETrGuGbDqh9irjR49fflfyja3kUw1fc/PjTJESgH9UWXr8whk/+MltXY5UtmB4gXkjg6HvSQ0ADhDfwUOO/LOmGX+EWi2btli9i+kRDzcEpA90tC86vzd2ojztbczafLFRrepFighwdrOjT6E468gzpoUqosghRBF40NI30vStIw5+tT6JACx1WH+i4on4r+wMy+g2B6ywbTwZpJXU5v7xEL4NR7WUbDIM5jat1LzvQ3YFUR8qAu4K5ZOlNcf0YpXfENGL0wOXQkHzIm5DNtlNlUa2LDlrpRXgzgMxiY8bnckxEjfUe2iC7xK0uEYbqa3B1YTmRMHMWG4VV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJtcVjSw3m4Rq83GLBebkejmKo+TP0u1XOUPNlaa+QQ=;
 b=XO22YoagUOfEjh0qrgSxRvvJpw7TpgmukE8k16WPXBvwCq9ZyPeUveGGKwc5hALt947ZKXpXDVUgZkDp7m3vTi9Z/ujkem9wzzdSZguX4qj5Sz0QzdT3GCp2M3FefjzzlYCScnSsfWzNyAnoG5Be485pIJMtViVDIKf61IopTkrHQbtdhaSeYagiuRrQSFNxTR4jgqNDnADLdcXmgERQFVRwtDZPwl+e8I5edAv8UH3x4QlqSQEnmgt1sY/gO6ldw4QjA8qMF0CHL4vsG7VQhwzrbA5da2kw22sUkwkE1FYfAROF2EMRddSRYO8A4ROrtVbyO8DSjre1uHLrg1Y2SQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7930.eurprd04.prod.outlook.com (2603:10a6:10:1ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 19:42:25 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 19:42:25 +0000
Date: Mon, 7 Apr 2025 15:42:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v15 7/7] firmware: drivers: imx: adds miscdev
Message-ID: <Z/Qqlp+mq109+nta@lizhi-Precision-Tower-5810>
References: <20250407-imx-se-if-v15-0-e3382cecda01@nxp.com>
 <20250407-imx-se-if-v15-7-e3382cecda01@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-imx-se-if-v15-7-e3382cecda01@nxp.com>
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: a666ce88-24f0-4aab-30a8-08dd760c523a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|7416014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ijhAooEGcv7O7b1q1jrikg3IU/iABCREFPRPAnmZn+DH9e6BipFxkVSUff7A?=
 =?us-ascii?Q?QpxTsV9a4g78fBizbFgitUz1Mc/K5fL1/UwgpFV/ohd9gLpcdraLOqdR7mQA?=
 =?us-ascii?Q?2GZnbk2xENgYvGnhS+CRE66dgNuWYb8AqSsZiz8mtnIonbLRf00rqWNeCKqs?=
 =?us-ascii?Q?zph6bdZMT1EhHiF1ujP/Oj67+oHx+37yvwOAkx23B2kcv6v6vQHlqZzpgVJQ?=
 =?us-ascii?Q?qHla46YqMyEEA3YWIOUw994ZlcoeYmkUmHFGSVeXq0phXEPSVCBEkZaytWOE?=
 =?us-ascii?Q?Ef9pK3lVsOfqzMHTh/Iynv2ezzGtdL1oZOY9sczGW9BepCopNJuvwcAzAhMY?=
 =?us-ascii?Q?eQ+XN1Fc4nJGtu3zKHr8hxnX++zhHzR/v1PN11rurXZIe+MxdBmtMhXCsAyU?=
 =?us-ascii?Q?mTPQyvh9JgxQFqNz1PTKRWjvhIgcBXeFNkvSTUAwOji3t2Btmk0X4a7uSXK/?=
 =?us-ascii?Q?qm9Ssgvwti7ep8gAFr2C2U1n6EnYfaVYhn0zT5Qbmmty7wMAXgEBEBauPs3j?=
 =?us-ascii?Q?89CuuS5BAKZGoiTPlZnYXmdk91MIjYh36p6yfE611mYXtUTSqIgOWOeoRar0?=
 =?us-ascii?Q?rf6LR5HDEDnerFbpMJNYG5EuJF4znOEJjfyDStyqgqDGKLKre72rkYhP5o9K?=
 =?us-ascii?Q?N4nrLnEiNnV5+eIbsngjxb+rwlE0mMeVzAHIV4r742aqg+/YCX0X/vr210hw?=
 =?us-ascii?Q?3KXCd8I3kAW2/gP3pShmwQ6KmqSvQIiT6ksKFNxAt6wzzknD8XybYtz96VVB?=
 =?us-ascii?Q?WQ9M5aAFvE//Fm/K1PZEHQ8N+9Q/hj0K3E8nSJcTbj6AJMXk0QGhS8dR43Jb?=
 =?us-ascii?Q?5lVgczNvI60PYRYiP97Hnnsf7AwFtlWCr6VwsB3Yve5I5/7IIl29Eg4R0jRb?=
 =?us-ascii?Q?7MI6Ysgnn7Gp8UhiAFtRaX7Dmeo1dj1yD6dY2vKJyu/BO+qymMo7RDNZv8Zk?=
 =?us-ascii?Q?QRsV46P2q8T9pZRzp+CFDgJwTPF0dKhnpOXcm40tqGGWRwmieYkm11VLxB1p?=
 =?us-ascii?Q?H06NlgGCHGIYuv3dVYYbsCMR5geWY37MJPhMb3jmOljNued8adPedzCG45NI?=
 =?us-ascii?Q?vASuxpEhzwA691idyu8lqWq7zGypPEni6NTx336ZOX/895O4DlxpJis3UeFJ?=
 =?us-ascii?Q?ARlQ4ugcBS3nCwctGGIsyiWKuyNMfroGbXkE3LYqYzYVWkM3MVrxyExBzkjw?=
 =?us-ascii?Q?1GpPY9J+BMKDQCp0QnkDi5nX8hahTfg+XGdmMAKMewsKdYcn6bWcLC7nUwTd?=
 =?us-ascii?Q?jySLbP33MUrTMTi/6eCRvCvy744/FtBuUdvrUIWjPnMykSC4nhJkI3zpZGhm?=
 =?us-ascii?Q?GfMbml72l3GWQ9kB5uOMV/yCA6YSbm9wv022MkghBIWnriDlNwUMfc5K+dfM?=
 =?us-ascii?Q?+hy7Eidqnvifum77vJYXUuu0OQbiCFO9UPnVIStH+QGD+mTHjBzau6EAPLnP?=
 =?us-ascii?Q?jRzNf+cTWBFDpxMmxiPrQ9CxIxwEwD7xSpqfgN7ayK5p8fnIeiInydr345dY?=
 =?us-ascii?Q?UYe2/84411ezFfM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(7416014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t6sLrnOPfQ3l0JzTzgLmfb+IG2hJ2hKTnQHrcUA1HfxszGtBNHPcpPEwTd77?=
 =?us-ascii?Q?JtKElwaKwyzbVgJn9LlPadFzXzGkGcPWwezBvoeWT/x+DLtlNaDct5y9t0bI?=
 =?us-ascii?Q?eYZd+1AAp1fZS+7PUSABayvOgIUvTSrlI9Nr+o/JgbfXO2L3190Wr2/vfj3c?=
 =?us-ascii?Q?QCsBi0rCkK8G+UcejZEq+FpP7CmtP7JPbsU8GjPeI92O0a1Avs8RT395sxng?=
 =?us-ascii?Q?wUGDLb/x+CtFumc8HfpNKIMMBxGtKjo5HdZd3IOdEXIU8z+anpelnvKYDrJ1?=
 =?us-ascii?Q?cPhi5Vweh+Y1zZARfnZVn07LSiWZa8WTzD4P3BKPENnVQShMwJ9qj8a/m0k1?=
 =?us-ascii?Q?V5Qcu+20typioswtKsdTo/R4OyjPL0wNELPu8lUofcMtCyB9O5uWSPQqt3V6?=
 =?us-ascii?Q?Q9VpwxyC0ak0VrQmcNN+IWcMf5sdwuIQjXaE0KCxpJbpZJQc9l6KZUEt39+1?=
 =?us-ascii?Q?7aJ8QX/BzNgdPR4faSV6Iu9yJB3kuJDRVx6aOswRA0An9SQjlGQw3tM9JheM?=
 =?us-ascii?Q?SNKPv3PZl/VSu1yoayA/4GT+olvkm9zE9bj35DT3fMtkTvMTHI4HIKt8zJ3z?=
 =?us-ascii?Q?B9JoeO3EhBRTbqvZKh81F8dcV2s2EU8oLrWiEhcDFJmcLUPO25zsZaKK0qxr?=
 =?us-ascii?Q?SUjOHD9J98U1ifBs3BiMR9YXcRqEXqL9D+hSUexxlta3snk2jQdVDojT7Lym?=
 =?us-ascii?Q?QAM85RFYYP3MuNt+BsEH9VFFKcIIjYijqpqxXdRv9Nr0QKiztbf3opbq3fwk?=
 =?us-ascii?Q?aMangztVj0FmCGQ7yjBsQp6umYgoUMi/q6U4PGni4M3GHOVwdVkGE9TUsCq8?=
 =?us-ascii?Q?pPMj3P0qYzhT8Naa++kFJYbnlohNMqAojFRQdC5DMbbg1IevLL6Ti59kLFQl?=
 =?us-ascii?Q?P3vY5EStUquIM3PJOoNOJ871X4ZMOZajGGXrOizS/XMiOK3z+gxhMAwie/vC?=
 =?us-ascii?Q?n9+c7/NebDpKtwKHuS/Q0u22WOO0LJRkMRMlLzouaOS//107IfLeQkIx1Tsn?=
 =?us-ascii?Q?XsSlxpnaqxRDYxtf/I9j2gntlP5Ozu8BUUvnHa5KI5PEW9ZZqVumS7na32cc?=
 =?us-ascii?Q?6DScgBVJ0aZoc2hu6gi3yXXp+KhH0EgenB8HOCh0zeFiduu7MSE+4x6b+FMC?=
 =?us-ascii?Q?DbU+RexbUoc4RzHVXt4OkdOk6lU7rQdrHJsMorMY8iAxvdEKxFEuskEtAzKE?=
 =?us-ascii?Q?vzWczyZtKFaUFSM3HamOXXyEx1kogS5SatS6+HrpLBwappivQN673hFOdfWc?=
 =?us-ascii?Q?dtPb5oKtRKLBN6NBymRWvZUkiaIQpZ64gvXCTEmJdLRkvGPFAjifeR9qb25p?=
 =?us-ascii?Q?6nzSfKmm3aamNNOMIpPbnJXXn0CjqoyY+yWGl+J4l/iqZUlTR9wLfz7M8yP3?=
 =?us-ascii?Q?R24wcHqbHk/iWLeyXqf3PhHQcSME7C8QDC9NTouEWcAa0ZmCWZ73icEbr913?=
 =?us-ascii?Q?lLA4MkpXOom/9i/YK5JE0lGxdqPcjgvSFP0O+2iDIOJ0ItWfl188B82QomPq?=
 =?us-ascii?Q?74iTcZRuiBkvYF/wCbS4oND7UdRGBZiFKAJg7OFrBJkpv0Rx0egSYTdVpWq+?=
 =?us-ascii?Q?EdJB8yw5xYAQumWx9LbDqzN4DcSFJBD2j8D8bm85?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a666ce88-24f0-4aab-30a8-08dd760c523a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:42:25.0897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGIZ/GWB00sX+esSxonNlU1nN5bhNMyEdjr67Lp4Y5aCDTKoA4yGd6+VkF2C+PUs58vpmDuBbEkl8Z9IEcR0cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7930

On Mon, Apr 07, 2025 at 09:50:23PM +0530, Pankaj Gupta wrote:
> Adds the driver for communication interface to secure-enclave,
> for exchanging messages with NXP secure enclave HW IP(s) like
> EdgeLock Enclave from:
> - User-Space Applications via character driver.
>
> ABI documentation for the NXP secure-enclave driver.
>
> User-space library using this driver:
> - i.MX Secure Enclave library:
>   -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
> - i.MX Secure Middle-Ware:
>   -- URL: https://github.com/nxp-imx/imx-smw.git
>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> ---
> changes from v14 to v15
> - removed the se_intance_id structure member variable.
> - replace variable name from wait to timeout.
> - used 'goto' to follow the common exit path calling "release_firmware(fw);" in case of error path.
> - removed TBD string.
> - Used ARRAY_SIZE(pending_lists).
> - moved init_device_context after init_misc_device_context.
> - defined err as long to avoid force convert in func
> - added se_rcv_msg_timeout to priv, to control probe/suspend/resume per interface.
>
> Note: copied the change logs for v13 to v14, to cover letter.
> ---
>  Documentation/ABI/testing/se-cdev |  43 +++
>  drivers/firmware/imx/ele_common.c |  14 +
>  drivers/firmware/imx/ele_common.h |   4 +
>  drivers/firmware/imx/se_ctrl.c    | 785 +++++++++++++++++++++++++++++++++++++-
>  drivers/firmware/imx/se_ctrl.h    |  33 ++
>  include/uapi/linux/se_ioctl.h     | 101 +++++
>  6 files changed, 972 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/ABI/testing/se-cdev b/Documentation/ABI/testing/se-cdev
> new file mode 100644
> index 000000000000..dad39ffd245a
> --- /dev/null
> +++ b/Documentation/ABI/testing/se-cdev
> @@ -0,0 +1,43 @@
> +What:		/dev/<se>_mu[0-9]+_ch[0-9]+
> +Date:		Mar 2025
> +KernelVersion:	6.8
> +Contact:	linux-imx@nxp.com, pankaj.gupta@nxp.com
> +Description:
> +		NXP offers multiple hardware IP(s) for secure enclaves like EdgeLock-
> +		Enclave(ELE), SECO. The character device file descriptors
> +		/dev/<se>_mu*_ch* are the interface between userspace NXP's secure-
> +		enclave shared library and the kernel driver.
> +
> +		The ioctl(2)-based ABI is defined and documented in
> +		[include]<linux/firmware/imx/ele_mu_ioctl.h>.
> +		ioctl(s) are used primarily for:
> +			- shared memory management
> +			- allocation of I/O buffers
> +			- getting mu info
> +			- setting a dev-ctx as receiver to receive all the commands from FW
> +			- getting SoC info
> +			- send command and receive command response
> +
> +		The following file operations are supported:
> +
> +		open(2)
> +		  Currently the only useful flags are O_RDWR.
> +
> +		read(2)
> +		  Every read() from the opened character device context is waiting on
> +		  wait_event_interruptible, that gets set by the registered mailbox callback
> +		  function, indicating a message received from the firmware on message-
> +		  unit.
> +
> +		write(2)
> +		  Every write() to the opened character device context needs to acquire
> +		  mailbox_lock before sending message on to the message unit.
> +
> +		close(2)
> +		  Stops and frees up the I/O contexts that were associated
> +		  with the file descriptor.
> +
> +Users:		https://github.com/nxp-imx/imx-secure-enclave.git,
> +		https://github.com/nxp-imx/imx-smw.git
> +		crypto/skcipher,
> +		drivers/nvmem/imx-ocotp-ele.c
> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> index baf83f03c1a0..5e61fc68fbaa 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -42,6 +42,11 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
>  	return chksum;
>  }
>
> +void set_se_rcv_msg_timeout(struct se_if_priv *priv, u32 val)

val -> timeout_ms (need unit for it)

> +{
> +	priv->se_rcv_msg_timeout = val;

se_rcv_msg_timeout -> se_rcv_msg_timeout_ms

> +}
> +
>  int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
>  {
>  	unsigned long timeout;
> @@ -49,6 +54,8 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
>
>  	do {
>  		timeout = MAX_SCHEDULE_TIMEOUT;
> +		if (dev_ctx->priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx)
> +			timeout = msecs_to_jiffies(dev_ctx->priv->se_rcv_msg_timeout);
>
>  		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
>  		if (ret == -ERESTARTSYS) {
> @@ -59,6 +66,13 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
>  			ret = -EINTR;
>  			break;
>  		}
> +		if (ret == 0) {
> +			ret = -ETIMEDOUT;
> +			dev_err(dev_ctx->priv->dev,
> +				"Fatal Error: SE interface: %s0, hangs indefinitely.\n",
> +				get_se_if_name(dev_ctx->priv->if_defs->se_if_type));
> +			break;
> +		}
>  		ret = se_clbk_hdl->rx_msg_sz;
>  		break;
>  	} while (ret < 0);
> diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
> index 62c75e149d95..35543b1cdab3 100644
> --- a/drivers/firmware/imx/ele_common.h
> +++ b/drivers/firmware/imx/ele_common.h
> @@ -12,6 +12,10 @@
>
>  #define IMX_ELE_FW_DIR                 "imx/ele/"
>
> +#define SE_RCV_MSG_DEFAULT_TIMEOUT	5000
> +#define SE_RCV_MSG_LONG_TIMEOUT		5000000
> +
> +void set_se_rcv_msg_timeout(struct se_if_priv *priv, u32 val);
>  u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
>  int ele_msg_rcv(struct se_if_device_ctx *dev_ctx,
>  		struct se_clbk_handle *se_clbk_hdl);
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> index a326e07ae547..5b8447c8c8da 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -23,6 +23,7 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/sys_soc.h>
> +#include <uapi/linux/se_ioctl.h>
>
>  #include "ele_base_msg.h"
>  #include "ele_common.h"
> @@ -32,12 +33,6 @@
>  #define MBOX_TX_NAME			"tx"
>  #define MBOX_RX_NAME			"rx"
>
> -#define SE_TYPE_STR_DBG			"dbg"
> -#define SE_TYPE_STR_HSM			"hsm"
> -
> -#define SE_TYPE_ID_DBG			0x1
> -#define SE_TYPE_ID_HSM			0x2
> -
>  struct se_fw_img_name {
>  	const u8 *prim_fw_nm_in_rfs;
>  	const u8 *seco_fw_nm_in_rfs;
> @@ -130,6 +125,14 @@ char *get_se_if_name(u8 se_if_id)
>  	return NULL;
>  }
>
> +static uint32_t get_se_soc_id(struct se_if_priv *priv)
> +{
> +	const struct se_soc_info *se_info =
> +				device_get_match_data(priv->dev);
> +
> +	return se_info->soc_id;
> +}
> +
>  static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
>  {
>  	return &var_se_info.load_fw;
> @@ -204,8 +207,223 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
>  	return 0;
>  }
>
> +static int load_firmware(struct se_if_priv *priv, const u8 *se_img_file_to_load)
> +{
> +	const struct firmware *fw = NULL;
> +	phys_addr_t se_fw_phyaddr;
> +	u8 *se_fw_buf;
> +	int ret;
> +
> +	if (!se_img_file_to_load) {
> +		dev_err(priv->dev, "FW image is not provided.");
> +		return -EINVAL;
> +	}
> +	ret = request_firmware(&fw, se_img_file_to_load, priv->dev);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "loading firmware %s\n", se_img_file_to_load);
> +
> +	/* allocate buffer to store the SE FW */
> +	se_fw_buf = dma_alloc_coherent(priv->dev, fw->size,
> +				       &se_fw_phyaddr, GFP_KERNEL);
> +	if (!se_fw_buf) {
> +		ret = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	memcpy(se_fw_buf, fw->data, fw->size);
> +	ret = ele_fw_authenticate(priv, se_fw_phyaddr);
> +	if (ret < 0) {
> +		dev_err(priv->dev,
> +			"Error %pe: Authenticate & load SE firmware %s.\n",
> +			ERR_PTR(ret),
> +			se_img_file_to_load);
> +		ret = -EPERM;
> +	}
> +exit:
> +	dma_free_coherent(priv->dev,
> +			  fw->size,
> +			  se_fw_buf,
> +			  se_fw_phyaddr);

exit: should be here

> +
> +	release_firmware(fw);
> +
> +	return ret;
> +}
> +
> +static int se_load_firmware(struct se_if_priv *priv)
> +{
> +	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
> +	int ret = 0;
> +
> +	if (!load_fw->is_fw_tobe_loaded)
> +		return 0;
> +
> +	if (load_fw->imem.state == ELE_IMEM_STATE_BAD) {
> +		ret = load_firmware(priv, load_fw->se_fw_img_nm->prim_fw_nm_in_rfs);
> +		if (ret) {
> +			dev_err(priv->dev, "Failed to load boot firmware.");
> +			return -EPERM;
> +		}
> +	}
> +
> +	ret = load_firmware(priv, load_fw->se_fw_img_nm->seco_fw_nm_in_rfs);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to load runtime firmware.");
> +		return -EPERM;
> +	}
> +
> +	load_fw->is_fw_tobe_loaded = false;
> +
> +	return ret;
> +}
> +
> +static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +
> +	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
> +	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
> +
> +	/*
> +	 * Allocate some memory for data exchanges with S40x.
> +	 * This will be used for data not requiring secure memory.
> +	 */
> +	se_shared_mem_mgmt->non_secure_mem.ptr =
> +			dma_alloc_coherent(priv->dev,
> +					   MAX_DATA_SIZE_PER_USER,
> +					   &se_shared_mem_mgmt->non_secure_mem.dma_addr,
> +					   GFP_KERNEL);
> +	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
> +		return -ENOMEM;
> +
> +	se_shared_mem_mgmt->non_secure_mem.size = MAX_DATA_SIZE_PER_USER;
> +	se_shared_mem_mgmt->non_secure_mem.pos = 0;
> +
> +	return 0;
> +}
> +
> +static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +
> +	/* Free non-secure shared buffer. */
> +	dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
> +			  se_shared_mem_mgmt->non_secure_mem.ptr,
> +			  se_shared_mem_mgmt->non_secure_mem.dma_addr);
> +
> +	se_shared_mem_mgmt->non_secure_mem.ptr = NULL;
> +	se_shared_mem_mgmt->non_secure_mem.dma_addr = 0;
> +	se_shared_mem_mgmt->non_secure_mem.size = 0;
> +	se_shared_mem_mgmt->non_secure_mem.pos = 0;
> +}
> +
> +/* Need to copy the output data to user-device context.
> + */
> +static int se_dev_ctx_cpy_out_data(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	struct se_buf_desc *b_desc, *temp;
> +	bool do_cpy = true;
> +
> +	list_for_each_entry_safe(b_desc, temp, &se_shared_mem_mgmt->pending_out, link) {
> +		if (b_desc->usr_buf_ptr && b_desc->shared_buf_ptr && do_cpy) {
> +			dev_dbg(priv->dev,
> +				"Copying output data to user.");
> +			if (do_cpy && copy_to_user(b_desc->usr_buf_ptr,
> +						   b_desc->shared_buf_ptr,
> +						   b_desc->size)) {
> +				dev_err(priv->dev,
> +					"Failure copying output data to user.");
> +				do_cpy = false;
> +			}
> +		}
> +
> +		if (b_desc->shared_buf_ptr)
> +			memset(b_desc->shared_buf_ptr, 0, b_desc->size);
> +
> +		list_del(&b_desc->link);
> +		kfree(b_desc);
> +	}
> +
> +	return do_cpy ? 0 : -EFAULT;
> +}
> +
> +/*
> + * Clean the used Shared Memory space,
> + * whether its Input Data copied from user buffers, or
> + * Data received from FW.
> + */
> +static void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
> +	struct list_head *pending_lists[] = {&se_shared_mem_mgmt->pending_in,
> +						&se_shared_mem_mgmt->pending_out};
> +	struct se_buf_desc *b_desc, *temp;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(pending_lists); i++) {
> +		list_for_each_entry_safe(b_desc, temp,
> +					 pending_lists[i], link) {
> +			if (b_desc->shared_buf_ptr)
> +				memset(b_desc->shared_buf_ptr, 0, b_desc->size);
> +
> +			list_del(&b_desc->link);
> +			kfree(b_desc);
> +		}
> +	}
> +	se_shared_mem_mgmt->non_secure_mem.pos = 0;
> +}
> +
> +static int add_b_desc_to_pending_list(void *shared_ptr_with_pos,
> +				      struct se_ioctl_setup_iobuf *io,
> +				      struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
> +	struct se_buf_desc *b_desc = NULL;

needn't set NULL here

Frank
> +
> +	b_desc = kzalloc(sizeof(*b_desc), GFP_KERNEL);
> +	if (!b_desc)
> +		return -ENOMEM;
> +
> +	b_desc->shared_buf_ptr = shared_ptr_with_pos;
> +	b_desc->usr_buf_ptr = io->user_buf;
> +	b_desc->size = io->length;
> +
> +	if (io->flags & SE_IO_BUF_FLAGS_IS_INPUT) {
> +		/*
> +		 * buffer is input:
> +		 * add an entry in the "pending input buffers" list so
> +		 * that copied data can be cleaned from shared memory
> +		 * later.
> +		 */
> +		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_in);
> +	} else {
> +		/*
> +		 * buffer is output:
> +		 * add an entry in the "pending out buffers" list so data
> +		 * can be copied to user space when receiving Secure-Enclave
> +		 * response.
> +		 */
> +		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_out);
> +	}
> +
> +	return 0;
> +}
> +
> +/* interface for managed res to unregister a character device */
> +static void if_misc_deregister(void *miscdevice)
> +{
> +	misc_deregister(miscdevice);
> +}
> +
>  static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
> -				    struct se_if_device_ctx **new_dev_ctx)
> +				    struct se_if_device_ctx **new_dev_ctx,
> +				    const struct file_operations *se_if_fops)
>  {
>  	struct se_if_device_ctx *dev_ctx;
>  	int ret = 0;
> @@ -221,12 +439,552 @@ static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
>  	if (!dev_ctx->devname)
>  		return -ENOMEM;
>
> +	mutex_init(&dev_ctx->fops_lock);
> +
> +	dev_ctx->priv = priv;
> +	*new_dev_ctx = dev_ctx;
> +
> +	dev_ctx->miscdev = devm_kzalloc(priv->dev, sizeof(*dev_ctx->miscdev), GFP_KERNEL);
> +	if (!dev_ctx->miscdev) {
> +		*new_dev_ctx = NULL;
> +		return -ENOMEM;
> +	}
> +
> +	dev_ctx->miscdev->name = dev_ctx->devname;
> +	dev_ctx->miscdev->minor = MISC_DYNAMIC_MINOR;
> +	dev_ctx->miscdev->fops = se_if_fops;
> +	dev_ctx->miscdev->parent = priv->dev;
> +	ret = misc_register(dev_ctx->miscdev);
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret, "Failed to register misc device.");
> +
> +	ret = devm_add_action_or_reset(priv->dev, if_misc_deregister,
> +				       dev_ctx->miscdev);
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to add action to the misc-dev.");
> +	return ret;
> +}
> +
> +static int init_device_context(struct se_if_priv *priv, int ch_id,
> +			       struct se_if_device_ctx **new_dev_ctx)
> +{
> +	struct se_if_device_ctx *dev_ctx;
> +	int ret = 0;
> +
> +	dev_ctx = kzalloc(sizeof(*dev_ctx), GFP_KERNEL);
> +
> +	if (!dev_ctx)
> +		return -ENOMEM;
> +
> +	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
> +				     get_se_if_name(priv->if_defs->se_if_type),
> +				     ch_id);
> +	if (!dev_ctx->devname) {
> +		kfree(dev_ctx);
> +		return -ENOMEM;
> +	}
> +
> +	mutex_init(&dev_ctx->fops_lock);
>  	dev_ctx->priv = priv;
>  	*new_dev_ctx = dev_ctx;
>
> +	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
> +	priv->active_devctx_count++;
> +
> +	ret = init_se_shared_mem(dev_ctx);
> +	if (ret < 0) {
> +		kfree(dev_ctx->devname);
> +		kfree(dev_ctx);
> +		*new_dev_ctx = NULL;
> +	}
> +
>  	return ret;
>  }
>
> +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
> +					    u64 arg)
> +{
> +	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
> +	struct se_api_msg *tx_msg __free(kfree) = NULL;
> +	struct se_api_msg *rx_msg __free(kfree) = NULL;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	int err = 0;
> +
> +	if (copy_from_user(&cmd_snd_rcv_rsp_info, (u8 __user *)arg,
> +			   sizeof(cmd_snd_rcv_rsp_info))) {
> +		dev_err(priv->dev,
> +			"%s: Failed to copy cmd_snd_rcv_rsp_info from user\n",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +		goto exit;
> +	}
> +
> +	if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ) {
> +		dev_err(priv->dev,
> +			"%s: User buffer too small(%d < %d)\n",
> +			dev_ctx->devname,
> +			cmd_snd_rcv_rsp_info.tx_buf_sz,
> +			SE_MU_HDR_SZ);
> +		err = -ENOSPC;
> +		goto exit;
> +	}
> +
> +	rx_msg = kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
> +	if (!rx_msg) {
> +		err = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	tx_msg = memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
> +			     cmd_snd_rcv_rsp_info.tx_buf_sz);
> +	if (IS_ERR(tx_msg)) {
> +		err = PTR_ERR(tx_msg);
> +		goto exit;
> +	}
> +
> +	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
> +		err = -EINVAL;
> +		goto exit;
> +	}
> +
> +	if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
> +	    get_load_fw_instance(priv)->is_fw_tobe_loaded) {
> +		err = se_load_firmware(priv);
> +		if (err) {
> +			dev_err(priv->dev, "Could not send the message as FW is not loaded.");
> +			err = -EPERM;
> +			goto exit;
> +		}
> +	}
> +	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_LONG_TIMEOUT);
> +
> +	err = ele_msg_send_rcv(dev_ctx,
> +			       tx_msg,
> +			       cmd_snd_rcv_rsp_info.tx_buf_sz,
> +			       rx_msg,
> +			       cmd_snd_rcv_rsp_info.rx_buf_sz);
> +	if (err < 0)
> +		goto exit;
> +
> +	dev_dbg(priv->dev,
> +		"%s: %s %s\n",
> +		dev_ctx->devname,
> +		__func__,
> +		"message received, start transmit to user");
> +
> +	/* We may need to copy the output data to user before
> +	 * delivering the completion message.
> +	 */
> +	err = se_dev_ctx_cpy_out_data(dev_ctx);
> +	if (err < 0)
> +		goto exit;
> +
> +	/* Copy data from the buffer */
> +	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
> +			     rx_msg,
> +			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
> +
> +	if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
> +			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
> +		dev_err(priv->dev,
> +			"%s: Failed to copy to user\n",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +exit:
> +
> +	/* shared memory is allocated before this IOCTL */
> +	se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +
> +	if (copy_to_user((void __user *)arg, &cmd_snd_rcv_rsp_info,
> +			 sizeof(cmd_snd_rcv_rsp_info))) {
> +		dev_err(priv->dev,
> +			"%s: Failed to copy cmd_snd_rcv_rsp_info from user\n",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +	return err;
> +}
> +
> +static int se_ioctl_get_mu_info(struct se_if_device_ctx *dev_ctx,
> +				u64 arg)
> +{
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	struct se_ioctl_get_if_info if_info;
> +	struct se_if_node *if_node;
> +	int err = 0;
> +
> +	if_node = container_of(priv->if_defs, typeof(*if_node), if_defs);
> +
> +	if_info.se_if_id = 0;
> +	if_info.interrupt_idx = 0;
> +	if_info.tz = 0;
> +	if_info.did = 0;
> +	if_info.cmd_tag = priv->if_defs->cmd_tag;
> +	if_info.rsp_tag = priv->if_defs->rsp_tag;
> +	if_info.success_tag = priv->if_defs->success_tag;
> +	if_info.base_api_ver = priv->if_defs->base_api_ver;
> +	if_info.fw_api_ver = priv->if_defs->fw_api_ver;
> +
> +	dev_dbg(priv->dev,
> +		"%s: info [se_if_id: %d, irq_idx: %d, tz: 0x%x, did: 0x%x]\n",
> +		dev_ctx->devname,
> +		if_info.se_if_id, if_info.interrupt_idx,
> +		if_info.tz, if_info.did);
> +
> +	if (copy_to_user((u8 __user *)arg, &if_info, sizeof(if_info))) {
> +		dev_err(priv->dev,
> +			"%s: Failed to copy mu info to user\n",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +	return err;
> +}
> +
> +/*
> + * Copy a buffer of data to/from the user and return the address to use in
> + * messages
> + */
> +static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
> +					u64 arg)
> +{
> +	struct se_shared_mem *shared_mem = NULL;
> +	struct se_ioctl_setup_iobuf io = {0};
> +	int err = 0;
> +	u32 pos;
> +
> +	if (copy_from_user(&io, (u8 __user *)arg, sizeof(io))) {
> +		dev_err(dev_ctx->priv->dev,
> +			"%s: Failed copy iobuf config from user\n",
> +			dev_ctx->devname);
> +		return -EFAULT;
> +	}
> +
> +	dev_dbg(dev_ctx->priv->dev,
> +		"%s: io [buf: %p(%d) flag: %x]\n",
> +		dev_ctx->devname,
> +		io.user_buf, io.length, io.flags);
> +
> +	if (io.length == 0 || !io.user_buf) {
> +		/*
> +		 * Accept NULL pointers since some buffers are optional
> +		 * in FW commands. In this case we should return 0 as
> +		 * pointer to be embedded into the message.
> +		 * Skip all data copy part of code below.
> +		 */
> +		io.ele_addr = 0;
> +		goto copy;
> +	}
> +
> +	/* No specific requirement for this buffer. */
> +	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
> +
> +	/* Check there is enough space in the shared memory. */
> +	dev_dbg(dev_ctx->priv->dev,
> +		"%s: req_size = %d, max_size= %d, curr_pos = %d",
> +		dev_ctx->devname,
> +		round_up(io.length, 8u),
> +		shared_mem->size, shared_mem->pos);
> +
> +	if (shared_mem->size < shared_mem->pos ||
> +	    round_up(io.length, 8u) > (shared_mem->size - shared_mem->pos)) {
> +		dev_err(dev_ctx->priv->dev,
> +			"%s: Not enough space in shared memory\n",
> +			dev_ctx->devname);
> +		return -ENOMEM;
> +	}
> +
> +	/* Allocate space in shared memory. 8 bytes aligned. */
> +	pos = shared_mem->pos;
> +	shared_mem->pos += round_up(io.length, 8u);
> +	io.ele_addr = (u64)shared_mem->dma_addr + pos;
> +
> +	memset(shared_mem->ptr + pos, 0, io.length);
> +	if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
> +	    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
> +		/*
> +		 * buffer is input:
> +		 * copy data from user space to this allocated buffer.
> +		 */
> +		if (copy_from_user(shared_mem->ptr + pos, io.user_buf,
> +				   io.length)) {
> +			dev_err(dev_ctx->priv->dev,
> +				"%s: Failed copy data to shared memory\n",
> +				dev_ctx->devname);
> +			return -EFAULT;
> +		}
> +	}
> +
> +	err = add_b_desc_to_pending_list(shared_mem->ptr + pos,
> +					 &io,
> +					 dev_ctx);
> +	if (err < 0)
> +		dev_err(dev_ctx->priv->dev,
> +			"%s: Failed to allocate/link b_desc.",
> +			dev_ctx->devname);
> +
> +copy:
> +	/* Provide the EdgeLock Enclave address to user space only if success.*/
> +	if (copy_to_user((u8 __user *)arg, &io, sizeof(io))) {
> +		dev_err(dev_ctx->priv->dev,
> +			"%s: Failed to copy iobuff setup to user.",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +	return err;
> +}
> +
> +/* IOCTL to provide SoC information */
> +static int se_ioctl_get_se_soc_info_handler(struct se_if_device_ctx *dev_ctx,
> +					    u64 arg)
> +{
> +	struct se_ioctl_get_soc_info soc_info;
> +	int err = -EINVAL;
> +
> +	soc_info.soc_id = get_se_soc_id(dev_ctx->priv);
> +	soc_info.soc_rev = var_se_info.soc_rev;
> +
> +	err = copy_to_user((u8 __user *)arg, (u8 *)(&soc_info), sizeof(soc_info));
> +	if (err) {
> +		dev_err(dev_ctx->priv->dev,
> +			"%s: Failed to copy soc info to user\n",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +	return err;
> +}
> +
> +/*
> + * File operations for user-space
> + */
> +
> +/* Write a message to the MU. */
> +static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
> +				size_t size, loff_t *ppos)
> +{
> +	struct se_if_device_ctx *dev_ctx = fp->private_data;
> +	struct se_api_msg *tx_msg __free(kfree) = NULL;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	int err;
> +
> +	dev_dbg(priv->dev,
> +		"%s: write from buf (%p)%zu, ppos=%lld\n",
> +		dev_ctx->devname,
> +		buf, size, ((ppos) ? *ppos : 0));
> +
> +	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
> +		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx)
> +			return -EINVAL;
> +
> +		if (size < SE_MU_HDR_SZ) {
> +			dev_err(priv->dev,
> +				"%s: User buffer too small(%zu < %d)\n",
> +				dev_ctx->devname,
> +				size, SE_MU_HDR_SZ);
> +			return -ENOSPC;
> +		}
> +
> +		tx_msg = memdup_user(buf, size);
> +		if (IS_ERR(tx_msg))
> +			return PTR_ERR(tx_msg);
> +
> +		print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
> +				     tx_msg, size, false);
> +
> +		err = ele_msg_send(dev_ctx, tx_msg, size);
> +
> +		return err;
> +	}
> +}
> +
> +/*
> + * Read a message from the MU.
> + * Blocking until a message is available.
> + */
> +static ssize_t se_if_fops_read(struct file *fp, char __user *buf,
> +			       size_t size, loff_t *ppos)
> +{
> +	struct se_if_device_ctx *dev_ctx = fp->private_data;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	int err;
> +
> +	dev_dbg(priv->dev,
> +		"%s: read to buf %p(%zu), ppos=%lld\n",
> +		dev_ctx->devname,
> +		buf, size, ((ppos) ? *ppos : 0));
> +
> +	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
> +		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
> +			err = -EINVAL;
> +			goto exit;
> +		}
> +
> +		err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
> +		if (err < 0) {
> +			dev_err(priv->dev,
> +				"%s: Err[0x%x]:Interrupted by signal."
> +				"Current active dev-ctx count = %d.",
> +				dev_ctx->devname, err,
> +				dev_ctx->priv->active_devctx_count);
> +			goto exit;
> +		}
> +
> +		/* We may need to copy the output data to user before
> +		 * delivering the completion message.
> +		 */
> +		err = se_dev_ctx_cpy_out_data(dev_ctx);
> +		if (err < 0)
> +			goto exit;
> +
> +		/* Copy data from the buffer */
> +		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
> +				     priv->cmd_receiver_clbk_hdl.rx_msg,
> +				     priv->cmd_receiver_clbk_hdl.rx_msg_sz,
> +				     false);
> +
> +		if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg,
> +				 priv->cmd_receiver_clbk_hdl.rx_msg_sz)) {
> +			dev_err(priv->dev,
> +				"%s: Failed to copy to user\n",
> +				dev_ctx->devname);
> +			err = -EFAULT;
> +		} else {
> +			err = priv->cmd_receiver_clbk_hdl.rx_msg_sz;
> +		}
> +exit:
> +		priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
> +
> +		se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +
> +		return err;
> +	}
> +}
> +
> +/* Open a character device. */
> +static int se_if_fops_open(struct inode *nd, struct file *fp)
> +{
> +	struct miscdevice *miscdev = fp->private_data;
> +	struct se_if_device_ctx *misc_dev_ctx;
> +	struct se_if_device_ctx *dev_ctx;
> +	struct se_if_priv *priv;
> +	int err = 0;
> +
> +	priv = dev_get_drvdata(miscdev->parent);
> +	misc_dev_ctx = priv->priv_dev_ctx;
> +
> +	scoped_cond_guard(mutex_intr, return -EBUSY, &misc_dev_ctx->fops_lock) {
> +		priv->dev_ctx_mono_count++;
> +		err = init_device_context(priv,
> +					  priv->dev_ctx_mono_count ?
> +					  priv->dev_ctx_mono_count
> +					  : priv->dev_ctx_mono_count++,
> +					  &dev_ctx);
> +		if (err)
> +			dev_err(priv->dev,
> +				"Failed[0x%x] to create device contexts.\n",
> +				err);
> +		else
> +			fp->private_data = dev_ctx;
> +
> +		return err;
> +	}
> +}
> +
> +/* Close a character device. */
> +static int se_if_fops_close(struct inode *nd, struct file *fp)
> +{
> +	struct se_if_device_ctx *dev_ctx = fp->private_data;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +
> +	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
> +		/* check if this device was registered as command receiver. */
> +		if (priv->cmd_receiver_clbk_hdl.dev_ctx == dev_ctx) {
> +			priv->cmd_receiver_clbk_hdl.dev_ctx = NULL;
> +			kfree(priv->cmd_receiver_clbk_hdl.rx_msg);
> +			priv->cmd_receiver_clbk_hdl.rx_msg = NULL;
> +		}
> +
> +		se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +		cleanup_se_shared_mem(dev_ctx);
> +
> +		priv->active_devctx_count--;
> +		list_del(&dev_ctx->link);
> +
> +		kfree(dev_ctx->devname);
> +		kfree(dev_ctx);
> +	}
> +
> +	return 0;
> +}
> +
> +/* IOCTL entry point of a character device */
> +static long se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> +{
> +	struct se_if_device_ctx *dev_ctx = fp->private_data;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	long err;
> +
> +	/* Prevent race during change of device context */
> +	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
> +		switch (cmd) {
> +		case SE_IOCTL_ENABLE_CMD_RCV:
> +			if (!priv->cmd_receiver_clbk_hdl.dev_ctx) {
> +				if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
> +					priv->cmd_receiver_clbk_hdl.rx_msg =
> +						kzalloc(MAX_NVM_MSG_LEN,
> +							GFP_KERNEL);
> +					if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
> +						err = -ENOMEM;
> +						break;
> +					}
> +				}
> +				priv->cmd_receiver_clbk_hdl.rx_msg_sz = MAX_NVM_MSG_LEN;
> +				priv->cmd_receiver_clbk_hdl.dev_ctx = dev_ctx;
> +				err = 0;
> +			} else {
> +				err = -EBUSY;
> +			}
> +			break;
> +		case SE_IOCTL_GET_MU_INFO:
> +			err = se_ioctl_get_mu_info(dev_ctx, arg);
> +			break;
> +		case SE_IOCTL_SETUP_IOBUF:
> +			err = se_ioctl_setup_iobuf_handler(dev_ctx, arg);
> +			break;
> +		case SE_IOCTL_GET_SOC_INFO:
> +			err = se_ioctl_get_se_soc_info_handler(dev_ctx, arg);
> +			break;
> +		case SE_IOCTL_CMD_SEND_RCV_RSP:
> +			err = se_ioctl_cmd_snd_rcv_rsp_handler(dev_ctx, arg);
> +			break;
> +		default:
> +			err = -EINVAL;
> +			dev_dbg(priv->dev,
> +				"%s: IOCTL %.8x not supported\n",
> +				dev_ctx->devname,
> +				cmd);
> +		}
> +	}
> +
> +	return err;
> +}
> +
> +/* Char driver setup */
> +static const struct file_operations se_if_fops = {
> +	.open		= se_if_fops_open,
> +	.owner		= THIS_MODULE,
> +	.release	= se_if_fops_close,
> +	.unlocked_ioctl = se_ioctl,
> +	.read		= se_if_fops_read,
> +	.write		= se_if_fops_write,
> +};
> +
>  /* interface for managed res to free a mailbox channel */
>  static void if_mbox_free_channel(void *mbox_chan)
>  {
> @@ -258,6 +1016,7 @@ static int se_if_request_channel(struct device *dev,
>
>  static void se_if_probe_cleanup(void *plat_dev)
>  {
> +	struct se_if_device_ctx *dev_ctx, *t_dev_ctx;
>  	struct platform_device *pdev = plat_dev;
>  	struct se_fw_load_info *load_fw;
>  	struct device *dev = &pdev->dev;
> @@ -284,6 +1043,13 @@ static void se_if_probe_cleanup(void *plat_dev)
>  		load_fw->imem.buf = NULL;
>  	}
>
> +	if (priv->dev_ctx_mono_count) {
> +		list_for_each_entry_safe(dev_ctx, t_dev_ctx, &priv->dev_ctx_list, link) {
> +			list_del(&dev_ctx->link);
> +			priv->active_devctx_count--;
> +		}
> +	}
> +
>  	/*
>  	 * No need to check, if reserved memory is allocated
>  	 * before calling for its release. Or clearing the
> @@ -324,6 +1090,7 @@ static int se_if_probe(struct platform_device *pdev)
>  	priv->se_mb_cl.tx_block		= false;
>  	priv->se_mb_cl.knows_txdone	= true;
>  	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
> +	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_DEFAULT_TIMEOUT);
>
>  	ret = se_if_request_channel(dev, &priv->tx_chan,
>  				    &priv->se_mb_cl, MBOX_TX_NAME);
> @@ -348,6 +1115,7 @@ static int se_if_probe(struct platform_device *pdev)
>  					     "Unable to get sram pool = %s.",
>  					     if_node->pool_name);
>  	}
> +	INIT_LIST_HEAD(&priv->dev_ctx_list);
>
>  	if (if_node->reserved_dma_ranges) {
>  		ret = of_reserved_mem_device_init(dev);
> @@ -356,7 +1124,7 @@ static int se_if_probe(struct platform_device *pdev)
>  					    "Failed to init reserved memory region.");
>  	}
>
> -	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
> +	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
>  	if (ret)
>  		return dev_err_probe(dev, ret,
>  				     "Failed[0x%x] to create device contexts.",
> @@ -399,6 +1167,7 @@ static int se_suspend(struct device *dev)
>  	struct se_fw_load_info *load_fw;
>  	int ret = 0;
>
> +	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_DEFAULT_TIMEOUT);
>  	load_fw = get_load_fw_instance(priv);
>
>  	if (load_fw->imem_mgmt)
> diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
> index b5e7705e2f26..d6d5736c39cd 100644
> --- a/drivers/firmware/imx/se_ctrl.h
> +++ b/drivers/firmware/imx/se_ctrl.h
> @@ -14,6 +14,7 @@
>  #define SE_MSG_WORD_SZ			0x4
>
>  #define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
> +#define MAX_DATA_SIZE_PER_USER		(65 * 1024)
>  #define MAX_NVM_MSG_LEN			(256)
>  #define MESSAGING_VERSION_6		0x6
>  #define MESSAGING_VERSION_7		0x7
> @@ -37,10 +38,38 @@ struct se_imem_buf {
>  	u32 state;
>  };
>
> +struct se_buf_desc {
> +	u8 *shared_buf_ptr;
> +	void __user *usr_buf_ptr;
> +	u32 size;
> +	struct list_head link;
> +};
> +
> +struct se_shared_mem {
> +	dma_addr_t dma_addr;
> +	u32 size;
> +	u32 pos;
> +	u8 *ptr;
> +};
> +
> +struct se_shared_mem_mgmt_info {
> +	struct list_head pending_in;
> +	struct list_head pending_out;
> +
> +	struct se_shared_mem non_secure_mem;
> +};
> +
>  /* Private struct for each char device instance. */
>  struct se_if_device_ctx {
>  	struct se_if_priv *priv;
> +	struct miscdevice *miscdev;
>  	const char *devname;
> +
> +	/* process one file operation at a time. */
> +	struct mutex fops_lock;
> +
> +	struct se_shared_mem_mgmt_info se_shared_mem_mgmt;
> +	struct list_head link;
>  };
>
>  /* Header of the messages exchange with the EdgeLock Enclave */
> @@ -89,6 +118,10 @@ struct se_if_priv {
>  	const struct se_if_defines *if_defs;
>
>  	struct se_if_device_ctx *priv_dev_ctx;
> +	struct list_head dev_ctx_list;
> +	u32 active_devctx_count;
> +	u32 dev_ctx_mono_count;
> +	u32 se_rcv_msg_timeout;
>  };
>
>  char *get_se_if_name(u8 se_if_id);
> diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
> new file mode 100644
> index 000000000000..29a9b1ec5ec3
> --- /dev/null
> +++ b/include/uapi/linux/se_ioctl.h
> @@ -0,0 +1,101 @@
> +/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause*/
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef SE_IOCTL_H
> +#define SE_IOCTL_H
> +
> +#include <linux/types.h>
> +
> +#define SE_TYPE_STR_DBG			"dbg"
> +#define SE_TYPE_STR_HSM			"hsm"
> +#define SE_TYPE_ID_UNKWN		0x0
> +#define SE_TYPE_ID_DBG			0x1
> +#define SE_TYPE_ID_HSM			0x2
> +/* IOCTL definitions. */
> +
> +struct se_ioctl_setup_iobuf {
> +	void __user *user_buf;
> +	__u32 length;
> +	__u32 flags;
> +	__u64 ele_addr;
> +};
> +
> +struct se_ioctl_shared_mem_cfg {
> +	__u32 base_offset;
> +	__u32 size;
> +};
> +
> +struct se_ioctl_get_if_info {
> +	__u8 se_if_id;
> +	__u8 interrupt_idx;
> +	__u8 tz;
> +	__u8 did;
> +	__u8 cmd_tag;
> +	__u8 rsp_tag;
> +	__u8 success_tag;
> +	__u8 base_api_ver;
> +	__u8 fw_api_ver;
> +};
> +
> +struct se_ioctl_cmd_snd_rcv_rsp_info {
> +	__u32 __user *tx_buf;
> +	int tx_buf_sz;
> +	__u32 __user *rx_buf;
> +	int rx_buf_sz;
> +};
> +
> +struct se_ioctl_get_soc_info {
> +	__u16 soc_id;
> +	__u16 soc_rev;
> +};
> +
> +/* IO Buffer Flags */
> +#define SE_IO_BUF_FLAGS_IS_OUTPUT	(0x00u)
> +#define SE_IO_BUF_FLAGS_IS_INPUT	(0x01u)
> +#define SE_IO_BUF_FLAGS_USE_SEC_MEM	(0x02u)
> +#define SE_IO_BUF_FLAGS_USE_SHORT_ADDR	(0x04u)
> +#define SE_IO_BUF_FLAGS_IS_IN_OUT	(0x10u)
> +
> +/* IOCTLS */
> +#define SE_IOCTL			0x0A /* like MISC_MAJOR. */
> +
> +/*
> + * ioctl to designated the current fd as logical-reciever.
> + * This is ioctl is send when the nvm-daemon, a slave to the
> + * firmware is started by the user.
> + */
> +#define SE_IOCTL_ENABLE_CMD_RCV	_IO(SE_IOCTL, 0x01)
> +
> +/*
> + * ioctl to get the buffer allocated from the memory, which is shared
> + * between kernel and FW.
> + * Post allocation, the kernel tagged the allocated memory with:
> + *  Output
> + *  Input
> + *  Input-Output
> + *  Short address
> + *  Secure-memory
> + */
> +#define SE_IOCTL_SETUP_IOBUF	_IOWR(SE_IOCTL, 0x03, \
> +					struct se_ioctl_setup_iobuf)
> +
> +/*
> + * ioctl to get the mu information, that is used to exchange message
> + * with FW, from user-spaced.
> + */
> +#define SE_IOCTL_GET_MU_INFO	_IOR(SE_IOCTL, 0x04, \
> +					struct se_ioctl_get_if_info)
> +/*
> + * ioctl to get SoC Info from user-space.
> + */
> +#define SE_IOCTL_GET_SOC_INFO      _IOR(SE_IOCTL, 0x06, \
> +					struct se_ioctl_get_soc_info)
> +
> +/*
> + * ioctl to send command and receive response from user-space.
> + */
> +#define SE_IOCTL_CMD_SEND_RCV_RSP _IOWR(SE_IOCTL, 0x07, \
> +					struct se_ioctl_cmd_snd_rcv_rsp_info)
> +#endif
>
> --
> 2.43.0
>
