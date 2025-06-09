Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37871C8630;
	Mon,  9 Jun 2025 09:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459775; cv=fail; b=Yj0vR8Jl5xGw18C92AFuwEcrVMdTHIPIhCw6ipbas2tqBBteMFinXpE28NDW7caMwzsCZ+O8gL+RgnoBbBsKSiD0Dc8azQOBwriNKvShjNDKr5la0RjBBZPin8Sui6CmFVeFNlLgSZ4Qb5hoeTHntFxqXq/NjUPsQY2RvEQohi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459775; c=relaxed/simple;
	bh=7X7+mziXF9yTAOgR9WT+97cp62jYI0kVqd+X+aLNcA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mpHASV37F4xPkAt5F90FHPdEA2RMmNc8MiYvcBx864VRm2GivISJ8v1QfKUDuxokjHPajgnhpCpe6yaJTSiRvUuONI2eS5U987IuHTzcGeS0t2yUbO6Os6QA7yphYzYSAAX5q5JfS4jgMYD/l3XPPL9sgcSi/eMlxIAiW72n08A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pGHRET+i; arc=fail smtp.client-ip=40.107.130.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pGHRET+i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WD5moXT3tpFmFdK3wPjko0HdYO0mdAac3V5IL79n7soBqrpQz4hnE2mXenQS280OWTdRG63ojRXZsyEiY+bRiizkiVJcgoCJqBmVwjNQLKj5iPrqrlUobZY8xButCe1xmY8YOG59MZzx+NpURNoWQIfxF1lHEdw24uY5wY5cPjCKm1iNZTtlHzvDJN1lk95Nptx8ilweZRsf1SJ9F6Aurzzn1lE+n18FVFjDV9bcQaT75V+KCRE9csBzecK0EULpm4D2ohAEf3Z797LYocwUEWNVGH/aSqfytL4FrZsZ8qkfVOgBrhiFVPP5Fmxw3tw9xNkCdiLRD5YrVeAjd495dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7X7+mziXF9yTAOgR9WT+97cp62jYI0kVqd+X+aLNcA8=;
 b=YUPmNFk0i5Ihh9DBzolPm3Rlyu+VYnCg1Rw2shKElqemyU/zgOeru6q9SbuhGoVndumrcvwM5ToW8FItpk7OMz+v9rUjq6btyqumghxT8HxKFnnPtFz5QbI/XNGbc2kGzugni/QeSRD+UXLhu4HfFotg6VRXRfZW1QW0NDIZLQ4cCabAttsV2C5R+3KlW4LrtBgiiZglneFlzxWc/qZ2OQLLVGCWhEg9kVIyA7UZ6M92xBIF/nDRaUJq04hf+zpjUwMdVECjl5WASaIxvS9i82IW6dGalOsOca/TJ8QmQgqv5Hk/s9jFr3dsT7ntWwt9gkZmHP5Ph6jVmNT6VEws9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7X7+mziXF9yTAOgR9WT+97cp62jYI0kVqd+X+aLNcA8=;
 b=pGHRET+igYkY/LjVjqfp2vohghsED/yDIrfh4cYiIS0kraNsHNbqknPVopBusKBM4WLf+sgxQSCdQxZmZ5Nyc3yt2oKS7tZiuPHRj/tQAQ8jGycfP64Gbg9OzWpt1khkseyg7lC9RXc3qWSURpaUN18KP1YZzNiVgvH3IeqizZSMwBX9h069zbuo4vuE58IQuT0VGHEAH0N/FWzeVWc5/+tpgPLn/vjcCWYTRe6AsFMmTXFHhORUBw+ADOu39AJdr1kqYpxZP+y99pkkvy4UuUcdCI/ESFL8XXbxVehj/tzaW54ZqCbDNKyfcxyOfnB4sAMjZWIdqRRtQJhPfxxLrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7640.eurprd04.prod.outlook.com (2603:10a6:20b:297::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 09:02:50 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 09:02:50 +0000
Date: Mon, 9 Jun 2025 18:12:58 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/6] arm64: dts: imx93-11x11-evk: reduce the driving
 strength of net RXC/TXC
Message-ID: <20250609101258.GN13113@nxa18884-linux>
References: <20250605205853.1334131-1-Frank.Li@nxp.com>
 <20250605205853.1334131-5-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605205853.1334131-5-Frank.Li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b957e5a-b341-44fc-ea38-08dda7346989
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N3TxtmoGw7F/mE2d2Lq+PjwC0Ce3A8ApmSV25Q2SIjXonzMoaY+htfGwSu6K?=
 =?us-ascii?Q?7ItFTqFxuPk+3aNN4sxsnWqJ0610/WMRW3ACOPaagjpZnX4YWpNtUWcwWHQ4?=
 =?us-ascii?Q?TUOoqFAOYxHPrgSp+DXKnLNVkBH8PzHatlBlT9dnvy7IK2nE9EhG7O+/Kcmp?=
 =?us-ascii?Q?sUyroM9rfd6NlZ5FHVRqt9KFZbmldGmgWehAEOPlsjggUBXpCyc+oBaWu+fj?=
 =?us-ascii?Q?ZanraKQ151BP0dsIS3gnpmhVmrECOGMquq9Whkq1TvzMil8hSBIOeYw1/xk8?=
 =?us-ascii?Q?fzhAB9lTDPTNkeE/EyvlxQ0iZ/JtbbLIJKd3ho+SieGNyU/TOfs+TUOodjFW?=
 =?us-ascii?Q?HcF6zjIqhKpfemedptwL7eOmvBN/qOc3cxQuU3f8UWetyEcmWFxt+6XBDsHg?=
 =?us-ascii?Q?mRB9BJ82es9wqI3gkbw1NRNg0F+iXI7wfBeX5SoWzub4CqWqVuE6WF+vQoS8?=
 =?us-ascii?Q?ddByosG/eA/NjAgIUGS/eHgPQApLkT7ipM5NWzMjcOEisL2tGGGaJdq7p2cL?=
 =?us-ascii?Q?e+q1wJU/y+GQM+FhWY6JLckK/HEsk3cgsl/nBSfZ/uNqoZvCIDUguqlpgWPd?=
 =?us-ascii?Q?y68f/tlJg49CCji390y+xuyw2REsLmKSs0iUs5UkQmvKzF4v/loTYrhzxdra?=
 =?us-ascii?Q?YezLi77lLT6OlsrN+tFVbuVEwz84RNUUEagmJRkGqAGD1ZiUsrsQy6oQOOll?=
 =?us-ascii?Q?mFtjYKSb0Jb3qqkS5ZguFgUHXRlFf+PZWYWcX3YGXjORgKVUo/rF3TnEOhuI?=
 =?us-ascii?Q?/AN+61OjQnvMrvPhs35gO96SzVaIsfETx8tVq3hDUNyFbVk3TClTwBsVa6gv?=
 =?us-ascii?Q?eePmjQfur6Oxd6UFaMB+Cpj+7GWQf5k7uoDX/hNOdZKzpLAHdkLt9lco0fHg?=
 =?us-ascii?Q?QjitgaqEMfHmWQgGHRjdbLfW+/pUrtqsNdmRBiQ5kZv8Dxf7i5Z2wVPjPIKJ?=
 =?us-ascii?Q?RvwgMla4GHYgfjV1qzydN41zYCg9XrNpif8l92W3ajFna8mIIPFdXh4yh4G4?=
 =?us-ascii?Q?wFlH6CITvYJlfTHvNuyu0UGPNBI8OTU76+0dXT5XnpwTAaqu+oWabb+d8CWf?=
 =?us-ascii?Q?sLekCy2zhRg9VZNYqF3Wkg+qh/TPmtzOPByM1Au1GoKfS6BfNFGx+0PHsZKK?=
 =?us-ascii?Q?KzfSIsG+uUmFHVluqtACsi02KsFQoH4HcvjtGzoPDDKwSOhBfPAjPzsET3yo?=
 =?us-ascii?Q?01NnLtwC5IsuTclkqD/2NCMqb7jMyN+6qEIkE7xG3xqFl8ipaHsxn61Q2XuD?=
 =?us-ascii?Q?YLU9KGnxsH2XyQnjaS491hD8V62dy/bH7gpxPwwbUwJcM0LVIpOiDNdoAswK?=
 =?us-ascii?Q?C6rKZ8nVU1DAZBjp2qjcZ2KisdpOtDwJMDQQZ2JGqitm8yfQpZ4Yb5ObaAGg?=
 =?us-ascii?Q?T/bWvcUb9aOIVR/fZL5ZNyDxsEftgfh4SfjKZLgvXtMzz2bPZSocEyhg3XGu?=
 =?us-ascii?Q?gw+B+03Mz6equTqbfPsDJQPyXL4GyEkxNK3/caH2t4B4+WBfUeF6Ug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8TVPaGSDX8gue14VtaVOTEeFpweW4cwnWanHBQR970/ZCmTFiz+MCI28P3Gk?=
 =?us-ascii?Q?IZ7Gj+uTPT3G8KhILSOB216FyAGzVFrB0w8mU6psHd3252m+s1993IK5zEjI?=
 =?us-ascii?Q?C5mAJ27/O4R+VqajPYL6HDGvXZC28EkGB6BZatvy/+DIMgByNnDGCFDwk0qF?=
 =?us-ascii?Q?u7tVNaYLahLlqXUL/6Ik4JvowGaGm0hd/FC/GQ2h9UFjVVb/9w43SkUGzRs+?=
 =?us-ascii?Q?pjyahLSeCZ4j+FIaEIpjlpvLv6XjrFx9MYoWDGZGYUfrJ27wWq7EeXkxFUHF?=
 =?us-ascii?Q?KmZMlI9ox6pOKsKgJqrsW73iocxo9lbgEDaaCy4DdgvwGiU08XdCEyMGKsvL?=
 =?us-ascii?Q?A3ELyNI21JDVRxDejOP2L+FaQ0SeLZMH5QeA6yDO9hxlQIh7+W7WMoFXINVm?=
 =?us-ascii?Q?v7S3yIjsFXuRx0RBZr9oAMOzUzh1tePCRD5FlxATMSeTnH/18EpFXkHuzHI6?=
 =?us-ascii?Q?B42D8JyTH0+vJbiZ44jqHx8g6U9QWu8JDO4QK71Q3tV44f/gBfW/3GEM/z/w?=
 =?us-ascii?Q?Z2eAs8QlCkaxhO0hyDZc21CBv39MW+vb7fhsqioJxhh0BYhCoZ7rkYEoWhcr?=
 =?us-ascii?Q?P73NG08oXoyJA5iEsqmtePt4OtZ6B+NtZLkxO6HU0ahFJneCyjQgcN7ZY7S8?=
 =?us-ascii?Q?oVW4b2nTG7rjHLyN+tlKW0/4cnkEiWkNu1cq4KYb+P8AQmX8A44zWjSSEYyx?=
 =?us-ascii?Q?2gL/Zl4umcGvID8cHSGIt06twKEbAamL0KrECm7QAA+OCx+O10SKG0ztDG20?=
 =?us-ascii?Q?v++NXnPEs6rTlFDUSI3AFjEPTNDm8DxaV6WoqLds3kUSxUVztRI/jX/ldt+x?=
 =?us-ascii?Q?dbzKWf17aW71uEuBsI0ql7wcQo4PlAXDfjd4VxyZCXjVDE9TJOgTaJ2Ku28j?=
 =?us-ascii?Q?vNA6BzfGt0/UO5lhJx1rxW9wx6hYBugLx+jTwAnwdohu6SMaFsIkixCAL+lU?=
 =?us-ascii?Q?GiDfMAWYpV0IvPbVuThu1aS4nMEJDYko/DU8Fwh9uBun/k7g+V26Wnn7DD1q?=
 =?us-ascii?Q?K+gpRFDlaAJno2J5mX9WPz6yt2Khd5Ta44RJwloc/ty71OOLlaC7xrZfDoSn?=
 =?us-ascii?Q?V3vQtXKHyIm1rBbbYnr5HeHlxDWcous9v2/ExytZpu4HlWJsaoRarWMHK3MS?=
 =?us-ascii?Q?xO1CCXiW7E+JsPoNXkrCHMoVdf4TuUopKCevwfGJFxJ/kgmGzAKxgQb6Wjkn?=
 =?us-ascii?Q?0i/RLHQ65qg3I9BwoLuEgxiO8kG2PsFf+xNNAE8vrDNs/2yTiyb+H9r6CEsR?=
 =?us-ascii?Q?jaOYWXA+ia8vDmc1We0Vq5zITbNWyRozT+3iGkXW7WKN6JQ0KQeV8d+U/4n2?=
 =?us-ascii?Q?j5PD0v4iUtQ1LeVHZNieK/VWmtWiBVgVUqkbC6DqAiQ74VhGilKwY9OsGYkE?=
 =?us-ascii?Q?53vhxKRkdag0KD14hwk9RFHjsuqD0RhF0EjDgXLq/hu0o9ocj0p4hVFLUsH4?=
 =?us-ascii?Q?GjgrUh3/TlOmngqpkX/FIuCFfpSgcPuBIV272NR48AKOybE22PwvBCphu7Le?=
 =?us-ascii?Q?leCdKmN4Jip1PHYijN8sAEc6AFbBSq0XXjeuE3MQIS89GfOO4Jly8kL9ov36?=
 =?us-ascii?Q?yVizHEdfRvhTgRutLND6hgSHDOdteFO8ndEZSGrp?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b957e5a-b341-44fc-ea38-08dda7346989
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 09:02:50.8709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFGA2UBKLLLuf7OI4vEXsPqapWNSQasaJR08RN/VKKoKoFKUVwtaFTWJkgNjt5NNeKcLMUfbDDjPuI6MkCUQNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7640

On Thu, Jun 05, 2025 at 04:58:52PM -0400, Frank Li wrote:
>From: Clark Wang <xiaoning.wang@nxp.com>
>
>Reduce the driving strength of all Ethernet RGMII R/TXC pads according to
>hardware signal measurement result.
>
>Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>

Miss you s-o-f.
