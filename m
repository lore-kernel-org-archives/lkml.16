Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012027.outbound.protection.outlook.com [52.101.71.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C80F4ED;
	Tue, 15 Apr 2025 08:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704103; cv=fail; b=MzJBrkKf9fHdMyk1+4264rSe1K1xsuE8Ol8J5YcqvMQjPCGjzImgAn8sN0fvOf1daUKmIeYH67mPOuiKt4RkFbnu/7LijwECAJnqZ/Q06ZmFIk7BwJIpF2uNWB1m8WCuogx1qM0y+Xhxs3iUJiHtaFgjtjAsYb/fJ1xc0/ZOTKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704103; c=relaxed/simple;
	bh=mEn3jwy72RUACHqhQBP5WPteiK8ji+L6wc+O9b/rZX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CjcSdjUQPsPq4DPQ3/wiS6JX9uqwU+E7sUzsv0hBknjG74gg6OIoKvtL/xW9yRNI++8UnR+PzTKcBjBgItp42itBy2Owx1YXOqYS0MxQ+fakyGBcshyc064+PBgfRj1y8BM/MCHUaLDYWvyxljlbeUByAP1O7+zR4y1N1DEXnss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dd03ZOnN; arc=fail smtp.client-ip=52.101.71.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dd03ZOnN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=avuVoS7kNAzVQDMP7fqcgOJygVEKS1waEELERqzoxy2SQiYeJu88lPR5TwlaIHFnyvia6rvxXh63wzz1zI5/ZxFjN6G0eqwWJprnIF3govkiyP14Lx3TppTgdKWvXQkTO+f85CvG5cTuepDQVun/GC5GNDvUfSr49MNTrH1EEIViDtyaZ6kCzke5V7+wFwmnFk+m/uypjdKyAW4/7kXSq2IF8DzzHHEAqROqOVmeMQ/byZU4ecLc4+H81n/KrdFSTjdAv8xLqXibRmlThWftyfRMx+m3fJMuNfJkjYIhb04CjJTQrZMr95N/wWaWbg7fukrg4a7sGjvihcORuPp2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6+ROBLxQmYGrXQg4DLIErH9yhI6FI/5cCrGTY1BmtE=;
 b=HbdwDjj/wUMgujwOVbjqmeg6ojULZjAYFibCQJl1TDcvNeIGbHn4HiN6X2A+ys2lxdnUMXNQ3dkDBDIaqhlmxKVL5JYCFgzR+/y96duDBgz5pTMCJyFxGTmyWKdX+VpVYe5IPad1cM99ulbL2nsrO9VuvO5NWr2bMZEFYuafrTe/hsoxDDivaQaDKcBM91TxySkFbvCL0yXpxBGzqrfqIXY6OySM4V19dxSi4TOSft4TwymgPpIIXMhvD+ElzwS2gdsZmYg/BOxpqeIZlChvM37YrDE9w520ob/IcLAr8+u5tEOwgKCrKwSVN7nd0BIkymk3NJ4uJOU4X1Sgto2fWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6+ROBLxQmYGrXQg4DLIErH9yhI6FI/5cCrGTY1BmtE=;
 b=dd03ZOnNmieu05CHxJE/4rMupewgzlwiZIN+87ALVImUD+LcZmIJ7F0iKew5UoawO7rhmT13KjxInuFUL6y995ER2Nkt0U2BejqAEg+7gNXzceGupHPlsb8UzJ3exBhiTwQcepfmvf+h0/QZk2L/J+oggUtv3gjrUM6uhO884hcaJR0jktHzUQIpgDBrb0JQCPPgGkEAzmRPLpMQLmCyejApRFxLjhAKsAvYNzBHB1RgCmJfs1F8bFELQpwOOrTzczsBQMgBCbDtdKiUa8iZFKlGHkGjNd9dZGxzdzDzMi31YlX2+zdV5Nwul5w1QiOkYSu+M3zllYygfY9ddKUIjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10117.eurprd04.prod.outlook.com (2603:10a6:102:454::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 08:01:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 08:01:38 +0000
Date: Tue, 15 Apr 2025 17:10:16 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/7] firmware: imx: Add i.MX95 SCMI LMM driver
Message-ID: <20250415091016.GB10243@nxa18884-linux>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-5-4c5f4a456e49@nxp.com>
 <20250414-wonderful-cute-bandicoot-accb6b@sudeepholla>
 <PAXPR04MB8459195AAF65D38AFA1D4F9688B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414-tiny-classic-barnacle-5f8c8f@sudeepholla>
 <PAXPR04MB84593BB91063D13BB05BEB5988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB84598733FA39A7402E91DA1988B32@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250414-ebony-slug-of-felicity-421b0f@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-ebony-slug-of-felicity-421b0f@sudeepholla>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10117:EE_
X-MS-Office365-Filtering-Correlation-Id: deb1a11b-6c12-40fe-dde3-08dd7bf3bff6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+fBh3669vw9F9ft0OoMYO0kV1EH6dvcIL6PmfEWlDNjgVYVP0slHhM6CnaQd?=
 =?us-ascii?Q?yxmuFIWVv73QvpciVTptwIdh6VpFnoB/D6FgfnWN8uYcIwwAIxm5P+0vJoxW?=
 =?us-ascii?Q?q2LViJxu4KCvVDx9Kcgo5XbYPwdQiDcMhmBp5FMCjj1eVgz3PKhxNzV/hfBg?=
 =?us-ascii?Q?QJnybZJKORcQBbaa/DsLWFXoirSWy8uhW1Q8PCIOed8cEKhJKb0eEXqPTI8P?=
 =?us-ascii?Q?hCoCvzMZQYl3PLOqY9xXgPL+6BTX4Z7ZfkdYMGcIKQecUQsLol09wHoFZ/lu?=
 =?us-ascii?Q?e4ywTPMJo9jGXwsFazt0WS6FgXRbs3WhfY/HQzlsHXWCpnekXlKeeQ3Bmaux?=
 =?us-ascii?Q?fHD0fwfYOlT8vRkpxbFPafiL+tapr6HGSp+7r80OGApIxPCovnPyYvRNLu7T?=
 =?us-ascii?Q?bS77BbCuxz4jUhcQfvPKa3MfS3N2x+C6/ZH/kOoL+j0IjN00pADlXKUv2Edu?=
 =?us-ascii?Q?piGOpIXiGbgk7s1EcutsJb/+nnJ3UPF2KPsFg244TyvfouQudBAw0dcrcT4x?=
 =?us-ascii?Q?jRzdbc3RQfB4tVpMnHw3MO3lM3vC+OfMfde7iv3GE9xyKTmRZA1+ZkAPzlQg?=
 =?us-ascii?Q?6OZ4VE9XinBrGEpbPq+TBYkSACMIMuPU9x5Ox6x5NbF4Xy7DSKt9Gftab4aX?=
 =?us-ascii?Q?331x9WTV/Wyjys0Qf0F6o+J265j6l5pmWsRUy/DFYqThqf07tsknx5CuD8A6?=
 =?us-ascii?Q?PyMPvnzYKFPq772wMnNL9f2cnegpCZFyEEg2bRLfidqlF+WVoamwXFWzb0pE?=
 =?us-ascii?Q?m/rilaDW6CXDb9TxSKeNn7hjIBvdJi0wd1yvWvF4BmQ1z4FS651JM4gmHOP2?=
 =?us-ascii?Q?S3ptQil1rLQvyjjiC96EBHk/zPPJhv+f0BsjSGoL7o+2fzVbgvytC0OtdhkV?=
 =?us-ascii?Q?NN7Vd613Ysm7isSx0oJgjzZqRrAgqpP+VTvGqRCsV0mVAmgD7cRtshrPQUzD?=
 =?us-ascii?Q?jUpjoQCtdiCNLI/vWIuQ4R/W45CjNk6yqn0hXat4QoKCbjT575OM9lXLdUbJ?=
 =?us-ascii?Q?KE0RK0nq9cf16gk0hCvKPwJdMJP4LCi4CgcU87XmImeHUO5lLtqZwH1BaDMD?=
 =?us-ascii?Q?2E5pcPeEL+WuvBmHmOIj4ioKMaxkwNATWnxG4UZQrpLVGb4oBixrmlPSFrOD?=
 =?us-ascii?Q?xJqK4UIyxDQjSNT5ekCDkda6MSXq1h9JXW90fpzg0jRHjC6UzkBAvOQ8M+1k?=
 =?us-ascii?Q?o5bhMGuNAHEFZ6KRlJlaS0syknnVCEZ6aYghIGpT6387Nqm6MucgHH8h9E+R?=
 =?us-ascii?Q?eU2NBVi1Nh0g4vuRohh3+T08LJiHOzr8Pscku4lsFj31k9rvGvxaJjJ/7XE2?=
 =?us-ascii?Q?JABi55NFN4lHLkVcnF2QbW/SJPXSdjCf3GtSmy85XBizAg3Htg+7jWD4d+2b?=
 =?us-ascii?Q?lIGqRVySpZhyL/7asJXAh/xE7tuxcSHvOccbKmO4IIdEjFQwAWh4M1jdYzIl?=
 =?us-ascii?Q?fBnSyXkTRYZPxOikYFgo1iVJIdllN2+L6temmOvV0YJ4lBWvrAVgGw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3PENLZ8r+107KeV1KdKADb1UzlE1mkoiv94mWBpULocHDSGGZSQ6pmCIlaQg?=
 =?us-ascii?Q?s7oFg1SBdfUyqTNXTqptPUzn3RKLSXzRO0S7QyfSJEDUY5lXt2zokict8h4t?=
 =?us-ascii?Q?w9ZSLMln5dCQlvKWrYWloFiPBDPwk+Vme6EAB7NKjUCtgZhNAQucbEB3bPTa?=
 =?us-ascii?Q?y2JCPPNswClrqePdLeQ50cczmsDYmqijdpCW+IbaG3PEsfuGAZITrX/3FuwP?=
 =?us-ascii?Q?ugmaSZlfJMyFdp9pDxWxuA0D9N9IB0+qpY+n6rAiOj5nbsyFD3a2+x2sTqlL?=
 =?us-ascii?Q?o5kVl/MK0pTql4kLspPty1W8vPKc99DZF+jV3ZZK8dAmno7H5HBEL66jZOai?=
 =?us-ascii?Q?MM/CaLK21j6JX049cGQN0PKGUS5vsia9Cb7aO/dc5hsps0+NI5M3Z908N98i?=
 =?us-ascii?Q?6/b361Q+hkL40+M9gnnezGUrbE+G0K2R3Hp7SnzwL8T253uE0Kby3syw3aU2?=
 =?us-ascii?Q?wkqI9KbXWequgCs9xnJdZGS9DH9rTbPFau/kmYQ5rqYCax9u9n6c0hhlOTq+?=
 =?us-ascii?Q?a2ObjprN9Vcqm+2wDjOLZNOXp7TRzM4KvEWPB3Vq3h8tcL+Mg8pl/lsmTNCk?=
 =?us-ascii?Q?b7FqKvBx0i6VVvvh1IaVMZoG64im9ONnH805cvGBbAVXhcq0wukTUVA8alMv?=
 =?us-ascii?Q?uWSGsB8w+p/hs+cI9AJZXXneGzhNcNHO01IihZEFhpAQOojHT0LVzhxa5CRY?=
 =?us-ascii?Q?yuYJjPslfsGObLR/McqfuNS6XVW0lFnLUQqBQ+4rCq/TxIloImQJR7xo8vhl?=
 =?us-ascii?Q?x03DjmJ+B763dyM0Idgxz9oE29GQCeenlF76dtW4fYV6n+14wH78FDnL+PEN?=
 =?us-ascii?Q?eLt1hE5UI1HO1quOQvfRSMJoTBbh8QST47djSPvmQImA76DiYQCUd4OU1hSZ?=
 =?us-ascii?Q?WTOtcrVF8aNdzxkpc/u6UWHMueIEQnDe7bi7fsZFjdtQfTL6+3xu0GcfKlqK?=
 =?us-ascii?Q?XdvI7a15zniMuD5//8ig4vU3WEyq6Ok9znOKIoTNZVSspKUnzDPsBDttzRrt?=
 =?us-ascii?Q?XkJD3K9Oif6VCJYEc3VsPgsNFjJzsYZ0DVvBitD9x14g6rz0FgCLU9dFZk9Q?=
 =?us-ascii?Q?9hFPTB9xC7GSu0ZDhDhOYITVWtfm/HenZ/4Uf5NBp+tqi6zjpsKZonzuBb0J?=
 =?us-ascii?Q?z542ptlDYozX7TrDp0jyX6aNCLKQPU9ZudzCJmw4B/RADHPeb32nLxebEXKJ?=
 =?us-ascii?Q?A4CFkf76zz30vOy6JKWou5DTNGuyXbHVLrXXeH/UtkbUHz6xxJO3pbOKMWh3?=
 =?us-ascii?Q?S1YPRFGGenwovx4tnjdhtwB4ivNQu4ZKGsdN3Ta9coFqAwxj5o/frYmT3RL8?=
 =?us-ascii?Q?mY83iq8pYe0Bybed0xpK1fAPpOnFq2BKFuyB5gW/JJJJAfdFtaMTYijtTTiQ?=
 =?us-ascii?Q?UqQz6QJ4i64UZH25YtCRTmeiWPagED34bM/KdUBCi5x4Ts4kpmhK+nx3puFK?=
 =?us-ascii?Q?erUIVOTKoKXJBxIEPOw1bhBPbFk1Oz41WflNRPJRnjzLhqisqL3f9p5Qc6wd?=
 =?us-ascii?Q?mb/tIYGj3CZDJj6dJxlry8ry4IbME2BTVEW+N90wlSCI/y12ziGkS+fuT1za?=
 =?us-ascii?Q?7NXvGfEXQDZPlsbtaCsjb+GMCiSlSkI7XS9it7JZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb1a11b-6c12-40fe-dde3-08dd7bf3bff6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 08:01:38.6537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xoa6qVS+c2MUZT7vXcrz+2Fg5DVMRD83O8qlqBwOj1ZmN9AJO+zTAetYxVR9ggYIyiggcI8t1e4eb1ZTFbOrQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10117

On Mon, Apr 14, 2025 at 12:17:34PM +0100, Sudeep Holla wrote:
>On Mon, Apr 14, 2025 at 11:00:20AM +0000, Peng Fan wrote:
>> 
>> Oops, I just checked wrong Kconfig under drivers/firmware/arm_scmi/
>> vendors/imx
>> 
>> Build this for ARM32 i.MX is ok, I just think no need. So add
>> a ARM64 dependency.
>> 
>
>OK, I will drop the ARM64 dependency when applying. I also don't understand

Thanks for helping on this.

>the dependency on i.MX firmware LMM and CPU drivers in the scmi vendor
>protocol as the dependency should be other way around. But I see Arnd had
>fixed it so I will keep it as you have posted to keep them all aligned.
Not dig into much on this.
I just followed what Arnd did when I prepared the patchset to avoid
potential build issue as reported before.

Thanks,
Peng

>
>-- 
>Regards,
>Sudeep
