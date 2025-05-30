Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF621231821;
	Fri, 30 May 2025 15:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748617531; cv=fail; b=vAY7P8+qloVYPegRGzNcEDG6Bj3D5ibcXMa/NnuOJH/IWw82SsToF7FH1XKAMSu4ytDGiyzwd/ZfpR1d8s/RXt6ejKVqg7tD9KoAXCRVHPcdCbPoQQbmC2f3KkOjG9Ui59N3zCKV4eBON93fHAQUvFIeEezhx1E6S+JK144QdwI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748617531; c=relaxed/simple;
	bh=sUXrDmEsQcyJlGEbbVzozXlP3jWOm6y3rRfPD5pzBs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FbaSom185OJKheUix45Jtxu9C410UabeJgPowHt4nNMNIV8MjjmM+bolG5NlvFkbR8HvFRYxQHD4VyUWxNAhHNs2QruOZnXGozivLqDdIJ/s1wsFCbXR3sRcQDD21Fk2rVvUf6J8pA/AXk1CedOKgj3pt/+3v+5bHs2DOeqvD4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=glDc66cI reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="glDc66cI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuGGbTJWIz9Rv2kpYsV6j9gOSwSEnPm9Ce/h3E0z95EKyvzibk98UsXEbQVbIvOI6a0b8VuUQbPDVbOPHGVXG4KCYAY5LYwhBu7zs4+eCmImATvJQzVJIFQM9RtpyirsaWA9YDqYKeKPdAQaRJmnxyXKbjf8HiFtnlXjy9uApsievSwbR7ktfWqJYhzH1NbOiiI5Mm2LZEkoQKqFPIQ/JaQmUvh5CA7Bu6tp75oZ/vYuLWy4Fh9Fg/IYw8iV0EMp6ZGzDWP+wiUVsyhflVCEYXazXzFktOzwZGHlAvQi0ATxtSmADN9HUL1Z9Mwq7/kgApFFSq24oIUoNeBvTSw2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Bg5CBW9zHozhSjx1S62vUpZ62Bt7UCLEVjqkioz9Dg=;
 b=eb1GKi/hG9ddi9mYAD/Si6UuDLMOa0wTBEObMVSl1jYEgsOlHBQIO9TvaskzrU4Kfa9UdA9OiTPIYlGrTtzK2+m81rdMevw/wA61Z0KipNbYdSN1N/VvOB9DK50GT1WmaTSyghMkHEjXjrmHLbq/3J8xqX0M5ZmriYfCG0cbxdBupUQuhLNYv5F42xr47hJc6P4SLyvfijhyUZUOxjsBvfNexUx5+grTYyTq5SsnztvzNVwLjJZ7qymAtkTEGeOv74XOUFrtdCdPvRSM4P083LWV8MTpAEHeteIZIgTDoBELNybAJqeJzlOw0KNjRQBanZ3i5Fb4yZmoMX0Cdf42uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Bg5CBW9zHozhSjx1S62vUpZ62Bt7UCLEVjqkioz9Dg=;
 b=glDc66cIAmt0QRg3gEbm3wxjZHjo7wIfr9ZP0//BOCfHL2EI2/Xx/NbVsnRtYHFo1Eyr+YWExmNXjiTH5ruriQSmwm/RCqNpN4uU2a44gFwo98Nqjy7AFdOInz9Fk6uY8B/lUguTTKKwkpAOLsWGwgANABezQVU80ooLIm2wwmzQZuyjp7DrOSjTz+rMcS6vmoRjfLSgtj7eJs8q1bqRDtMyL9+hHMk1+6qGePFto5DOkvjYgwES/dziLzy8J3rOCpDwTU7FoS5g9UW5jMQhTbgp7YDjs7imYBqBmbCr5Hs1tGsQnZPMh+WhAU/zB/SoU3r+XZTope7Jx33k6QfoUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6865.eurprd04.prod.outlook.com (2603:10a6:208:181::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 15:05:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 15:05:26 +0000
Date: Fri, 30 May 2025 11:05:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 2/2] arm64: dts: ls1028a: Add mbls1028a and mbls1028a-ind
 devicetrees
Message-ID: <aDnJLoXtjCAin4QO@lizhi-Precision-Tower-5810>
References: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
 <20250527060400.1005757-2-alexander.stein@ew.tq-group.com>
 <aDctWKIvBKwF29lP@lizhi-Precision-Tower-5810>
 <7298658.31r3eYUQgx@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7298658.31r3eYUQgx@steina-w>
X-ClientProxiedBy: SJ0PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf39407-1102-44e7-8bfd-08dd9f8b68fe
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?iso-8859-1?Q?y6iZHuw+GImKNs24kO+w4IXcnHjyUj3JbqJeWJdxMPqSM5d7y9kvg5q5WF?=
 =?iso-8859-1?Q?TmFZV5g1gp/FXRbmEACLP+fT98oecXuyQ7qjkcsqiIKbeImOHbaUFzNyy5?=
 =?iso-8859-1?Q?YukQAb7uQOO50ZN3gw+wcSVKmBI3FRzYL4gUq3c8mPuU1TXNeQWvXyOt6T?=
 =?iso-8859-1?Q?m4MKvHqNlAEUJj2L9PhKAE+z5BMYWOV0mW+TTRja2y6/6RlJtkT6LE5Q82?=
 =?iso-8859-1?Q?HDWzmluesUXsWs+JUtwwKTiBe81xRqSLbjkoizLak+q+1yTeB+GY5OKSM4?=
 =?iso-8859-1?Q?5LcB+AyI4NcEbEbji6YuzunSyTXu/l31JHxu63yXnqx1ivBINp6/FUgiz2?=
 =?iso-8859-1?Q?P1Q4LnlJ0JH12Ucgynma7kY3heDl4Yi7awbvL6y8dJsodCb+/16y2YXHOK?=
 =?iso-8859-1?Q?G3628+4qImDzeNO9YNacVLT1xOLWIISJw6h4pRV9VKoH+4WNn6WBImCWIW?=
 =?iso-8859-1?Q?X0kTm1PsJN8MffDwUMSkgwHvfkF5OUdTr0ZYlCm8PcqEEmnl1bUS9DZpnQ?=
 =?iso-8859-1?Q?50NsdFpQU5DLyIG9j8K7WoFhxZi+UBXb6iT1ZLr1eqXBkd5p9AQbTFcyFa?=
 =?iso-8859-1?Q?atlwBbKs7nZR1VyburxVpk9dsoGote2vWTMVHo5EnI7gouSvpffw8LFwBS?=
 =?iso-8859-1?Q?6EmiR9OPw3/3rlI0BRBFlsRt4brObwnVFBLPogUD+4m7t3h8G6Jmoh47V6?=
 =?iso-8859-1?Q?a6dAOMLjAq8SuvybyHrlChXUwIvdwjXdEMyGE7MnSQVJoRsYsQPksM+/OH?=
 =?iso-8859-1?Q?egm42LZYjyCpD30RBAwYITiIGHGz6tt+kbagV+fefGTHd2JVpA4HxMn6Tk?=
 =?iso-8859-1?Q?3EDVN4C4PYDj4KzlYzo5ISEGcRPD2NbXOjlsjMe9WPTt+dQJMfQffa+rEK?=
 =?iso-8859-1?Q?glcS78kgS6Fk1AsWkznNpm7yxkJwJ5G/YCRYh5zHbslGLaXFEmIqsrEq8u?=
 =?iso-8859-1?Q?F8LLaailEadaCMZBl95iJQjnkrfhTiJ9uVs9Qps60qy7IC5yn1kISGa4ss?=
 =?iso-8859-1?Q?5/0N0JndCOK7koMtp4dYSyIWCA0de+8enZeO0PQCFRR/MZFWcVHHmcDYbK?=
 =?iso-8859-1?Q?Exytkja86haF7WyxbNymsGW1Avdf165pqsFxnydMZsYRMbdX+rbynsCsku?=
 =?iso-8859-1?Q?YOXYXRihQ/nN+v+7fToAFIjM4ke2fJ250+h6QamSGk1ifTKOPU+M8khTvA?=
 =?iso-8859-1?Q?0T3YPpoK00PzBBfZX0O1gIHBA40RXZ+vNuqGHmVomERBfpfCHri66LF9DE?=
 =?iso-8859-1?Q?I1bIiIk6oBGac59EhSRa1EGJQyoUOj/WWObRMrGtcvFzYXdtseJrKp8D0W?=
 =?iso-8859-1?Q?hZgOndjBt59AYth9pfzz9bjVZBcraeQfJPrJMIT+IGfqqb7btmybBGVPET?=
 =?iso-8859-1?Q?fx7QoL0EeV/g5Ph2CfHPeF3ai5CYl8GYZZn90ypexCaLFEsi6GDLK/U6Aw?=
 =?iso-8859-1?Q?y4636bHBD2WJYZ36IwyYGYql396Xlt4CENn86aQEheDaDy2tP5Ztsvw9KN?=
 =?iso-8859-1?Q?k=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?iso-8859-1?Q?yRO/TOyYdBuqRjvloc/SnwYFFz6TVC8mRnlgD74zkw8/XqbVLxKzckoUzJ?=
 =?iso-8859-1?Q?zqA7eTFGQ6V38gqnXLgJAyeBa9GF23PAk26wZkzLUQnzv0lHNLbZMO+KI6?=
 =?iso-8859-1?Q?auIf1gpywvhOxqeGhlN9lU1pP7EfnRrbLxg1i9khcjbXGneOv1gk7nKSjv?=
 =?iso-8859-1?Q?qcCs/un8a56uDg93r0vdbsypTZYFEeSix2hH4znmhAg4XesraNjpwKpoh0?=
 =?iso-8859-1?Q?7s2SB/g04VRE8Qq3bgdF7N19Kx4L2o/eLN+azn4RQKvqUtCJHaznDlFqo1?=
 =?iso-8859-1?Q?jSWWfN0S2PfYzZhSTlsniNNqf8P8wvJtCWGi6CNZ6ei1EfWl4KrsdjqXB5?=
 =?iso-8859-1?Q?ahVLcyLpJWVwqOcRFBNAfvGl9Du1+3eI2kq38MglMZ0NRfJdqQILwyQSvo?=
 =?iso-8859-1?Q?kiSmmBikEr3kj6lmUCc9lSSZ8li4CEuONU476Ghir7/2entcORNxnuAjrx?=
 =?iso-8859-1?Q?v/rnUQGqAqLVvwXXW2C0yQ5uEeQlULQe0kCmi4FH8sHiYSMdObdNcCGomP?=
 =?iso-8859-1?Q?EMyWab4qPviayYhwOC8he3uxnduZHGkWeDNxGbXDxukLtd0AANa1K5DZ78?=
 =?iso-8859-1?Q?QTdw+NL5o4t9MYYxokJ7ItmCkVsN1FSMjzm/VSUG2hzwYzeRk6+GxhVRrA?=
 =?iso-8859-1?Q?3/pqazipgjr1V03P2WL4btMaVlGrOR6vQWVs7NPPsHFSt/tfIu6rEBdW6d?=
 =?iso-8859-1?Q?buX8pEoC8QpxqY/KYOlqDGtxFDKCp7flKYIkBJ04RIGSPj10/gZHhe6FX0?=
 =?iso-8859-1?Q?bQgFggLQooFBpmhqVqKOY3XesBqr7aOgUaQNtrC1JNdXpIy1QD410yimp4?=
 =?iso-8859-1?Q?52ejHHHeeTbcBhMAX+elteX86HPbq24kecDumew3n8skrilvrmDa6PAHan?=
 =?iso-8859-1?Q?5B+ulIK4BHTi77IlDM/y9aCojkuTn5SB8Gi4Xt+kvcjT6TU4Vk8lyFZgTs?=
 =?iso-8859-1?Q?vfFdulfGwUmizpvwYL5ZMSbJPK5hhSQVrlKXdl6gKkl0wf5fsPJQGMsDD5?=
 =?iso-8859-1?Q?4xlAseWwJP4+z0J54+U6RigpFOh5H3zyGZFeiEUQ/sJBefH2qCh0nrpRNK?=
 =?iso-8859-1?Q?qBXeJAlBjebXczbgx3YsdYB2rzWLP8FkkeVGP0lcYbsd4pd8F5heMpQFFW?=
 =?iso-8859-1?Q?82xcX05DfywkwnbLQ3+37N8kr9YsbTIFd5gJ2dJN0nlmpqoZ8ZWKwtMvLd?=
 =?iso-8859-1?Q?IwlGPDq+wSfjzbs+PY+KzY33IU81OnD9DovZvkBuerAiGO6po2uJtydtqk?=
 =?iso-8859-1?Q?VJCOB4AzfOcAbtTAeFAbqgPQ0tpMUIArRmHLQYgsocsFqx6Cu6LdDapunI?=
 =?iso-8859-1?Q?7Lyf3BmuQ8n5HACt6ai62sFknLzV8NDFmMiTnRFfyyQSf5jeTHAaCE1FHq?=
 =?iso-8859-1?Q?1XxKnTrQnqHf5fpbISV6OXHWvchO9SfVnXs4WDn1f4xHRT6m7POGIzZTt0?=
 =?iso-8859-1?Q?DFsNn0HPRxhwQV2MFObfcH9nFAVNz8amXQin95u9q8Ni9AyOh7Gd3W1yw3?=
 =?iso-8859-1?Q?GFI02294kYdDCM8+c/M+JVEVLX7p6/3t435pV9l8/wAKYPS9fm7aqXH8+S?=
 =?iso-8859-1?Q?cMD2h0dso2V9b3qOU4kB0JpPIvAeqOwPvn4OF7lTL4d3etL1/TqNWh4luZ?=
 =?iso-8859-1?Q?3MKxYEux8VVqnZMBeTe1rtpFhesMwQmwhH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf39407-1102-44e7-8bfd-08dd9f8b68fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 15:05:26.8838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9hyPy1GfJEEEfe80QhDsRHldGRH5EwGyOeXxe9Eg6hY4SblMe8cV2OiBk2E8uvaQJJm2D8YPKBzM1qeAAvRRtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6865

On Fri, May 30, 2025 at 08:29:27AM +0200, Alexander Stein wrote:
> Hi Frank,
>
> Am Mittwoch, 28. Mai 2025, 17:35:52 CEST schrieb Frank Li:
> > On Tue, May 27, 2025 at 08:03:55AM +0200, Alexander Stein wrote:
> > > From: Gregor Herburger <gregor.herburger@tq-group.com>
> > >
> > > Add device trees for the MBLS1028A and the MBLS1028A-IND and the SoM
> > > TQMLS1028A.
> > >
> > > Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/Makefile        |   2 +
> > >  .../fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts  |  68 ++++
> > >  .../fsl-ls1028a-tqmls1028a-mbls1028a.dts      | 118 +++++++
> > >  .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi     | 291 ++++++++++++++++++
> > >  .../dts/freescale/fsl-ls1028a-tqmls1028a.dtsi | 117 +++++++
> >
> > New dts file, suggest run https://github.com/lznuaa/dt-format to nice order
>
> Thanks for the suggestions. It does some improvements, but I also disagree
> with a lot of proposed changes:
> * Wrong indent of SPDX tag
> * model property should come first IMHO
> * {gpio,interrupt}-controller should come before #{gpio,interrupt}-cells

Thanks, let me try to fix it. 'model' suppose after 'compatible'.

> * gpio-hog property should come first in a hog node
> * sorting gpio-hog nodes by name instead of line number seems wrong

This one is not easy to fix, some hog have not line numbers.

>
> There are some more bogus changes, so I'll skip this tool for now.

It is up to you, but I suggest we can follow a rule, which is checkable.
It is hard and boring to figure out by manually.

Frank

>
> Thanks & best regards
> Alexander
>
> > Frank
> > [...]
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
