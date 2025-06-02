Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013061.outbound.protection.outlook.com [52.101.72.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A242EB1D;
	Mon,  2 Jun 2025 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880031; cv=fail; b=C9hgpOnwh425VeyYpY3nSd74QKheIvijaKuNI+mQ4h8jnidBTQSEVpeeLqvwOM7Ujpx+ENAJxnAOALJpbkEXSDXukkbpzanwCtsyB93L4rTEUizTZxMsrtAG4RED0Eb/2kZucWkWAp1ZhzQMmTEfiz7rEgky/lX5TIH35ABvyek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880031; c=relaxed/simple;
	bh=NcN2JVnp/hsUhU2WnU6MbvJ/8s5VtFfRnVL/KCndl10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=um0EKNirjemNmbO3dzx/yg2kCpm4k6kUi8GoUCfQ00petiJ9m1WAh3opLkZObcvB2TPZko7u5pI/5wun18EhcPePd++KEqI1pXa0XzG/EGWG7Qo4aC1UHsKLDnMrDIfIL/WG568dXfxFAJe05Ij14SJvgOKUOaFPThZj1PRGKew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=khYvc470 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.72.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="khYvc470"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZ7s4K/8BEyu/a9cj/c9XHZm13OtcXeKn9hJxbhMAjMaQigreCSfbdgQcBkVy9XcM3iZiEA8f4xMURa29zO24swBlXHa5VSYzCtGLYiUIVKCnVwC/wFa3GY1aKqPUUCMyA2R3Qm3dgoJ9DVl6o9Dc+mey2Fpw8Dx8odE8ouYvfz+0S6unNUQnSAkzZlVciDkcMwsQHnZeU3j2Qi8OPy4326JImRBPzyE1aeMg04gDAZqPw8jdmkXPddvoyVuxn/d+p/B1VzrlC0a/bwYAZgbAsdvcde6WMru3AkbaZP9cecwCg+RuXBE3M+GaR4G3xGlC/ubXb0MJEmDElb/2R4L/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6BVatR4QAvTcqLe6csh+18V5rWokCINkNSX936DOjI=;
 b=qjq5KtCtl44iFFHsp9Q+1TpUopl7ELActbQNFaZ2tEIag+zPHmcj5ckd3EtzTG/KWc/bN3g6NiU686A9GD0XKdyHGJi7/ZSdAiAp7V5uDEVu60e0r/kUiieQC66g42OEbIZ9cH6DJM/zrQTz240aBCKGMhyUzZjp9uHsledXcqIvkybfNvYfwnV4OJ/nYkceO4cELq1BHlci5WpeWTUwoOmM0KDLezl7JBpUZiT181AOrev3L7NnkgNCIOFhupBII+kxNPtOVm81a03/GZZ2ZmryBId8y83Ulp2jiuZtkQJ4n//XnUhPV7ZxSF4ZPeHp+FnMFqdUi9rwyEs1Pey9XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6BVatR4QAvTcqLe6csh+18V5rWokCINkNSX936DOjI=;
 b=khYvc470Tv1BUIbBO486hjM9Lxl/h8aWp1RBJIrLrHKg9VWUwp9d86GGgyBqgRUKhUgqknyOFQEhPS98kXalmuT4+pKG5fTZhEM9hL340ePwMEHGk9FkBDsTKT9V5K1TuBtcDOXcFD+y+EDblWzahfFy8Km7QZL30eDN9D5lKmc2v7V7gGVz9zokSQig3Zoh2glZX7poHgHwbkSi3SsH9Bljva/FdzDzbyZXgjOOCodJN2SeTZnBPGbMoBhEQS84fA37/1DtG9hlwfZ+fLvOmHsNy2tYiVI4h2x6Hisi9mnbuAeO/n/tW5vrUGi1/uT594pelE7L5ozE5TmTjBpXEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7881.eurprd04.prod.outlook.com (2603:10a6:10:1ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 16:00:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 16:00:26 +0000
Date: Mon, 2 Jun 2025 12:00:18 -0400
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
Message-ID: <aD3KkkSwoUKaWrim@lizhi-Precision-Tower-5810>
References: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
 <7298658.31r3eYUQgx@steina-w>
 <aDnZ/KjP/mMDhwF0@lizhi-Precision-Tower-5810>
 <5019298.31r3eYUQgx@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5019298.31r3eYUQgx@steina-w>
X-ClientProxiedBy: BY3PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: f09b5724-0e87-4688-7295-08dda1ee96a0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?iso-8859-1?Q?1i1i0Syqlv9Ez9uvHCACI5+EzNAvjd2j9Q0cz+kmkTGTkj3/FukLK3vB/n?=
 =?iso-8859-1?Q?DaiIGb0xZpS+0DCB8lyJTRvcQxHTYXfbu3qrCe2msAbzKd9MqrIaZaw4Cb?=
 =?iso-8859-1?Q?XRJH1wLggXiUgSwJr1gSgkjvFBEQpy4cMlDHYzGxp8ilKCWf7wrz7W2mFW?=
 =?iso-8859-1?Q?j423TMiXlDa8uPcqAnmHe4L/EKBHHGGRZUrz/qDcB/TAccxS9JAEfl6ZmH?=
 =?iso-8859-1?Q?dtfvvznh3DAb50F/p/ontjl6wYYYyDy83LU3sJP5yLBChZVUCyz6/N1yeQ?=
 =?iso-8859-1?Q?PvKkIcCh1AXZJYndIowFnw5w1AHnwfn7wwdW+HdJ1wyH8v9Lud+uy6OkSZ?=
 =?iso-8859-1?Q?OyIbXX7TthBRWQPMEDnCPdZ3IOdG6t42EygiqJ3xNJKIBIPGsot2v5ne8i?=
 =?iso-8859-1?Q?LdOAJVfPiHZyclyKlxRInR02KkOx/SQaqEVLbkDdCU5dtWlrL5dgn4zWHM?=
 =?iso-8859-1?Q?6hPGFmfE7Q/fbcbr2IdRNwPDiY+A0G+I+M24UKcY25W+DU3MBOUd6nte/6?=
 =?iso-8859-1?Q?CdlSmwc1dd+Pq8pA8rcXC6A0nhq7Ss7HDmZ/eGVlcPXxT/FVS4umDxjG1D?=
 =?iso-8859-1?Q?JRWAfZTmbMwWbDIaypZ+1Yl9+27GhbJCDYx91em20R33z4nSn2Sfytj3uI?=
 =?iso-8859-1?Q?mFdlpkaXOsjgfcxo0tnSMTG5hgWT3il/Q+P9BFPVIaXaBskF9pwxqGOYcT?=
 =?iso-8859-1?Q?S4O3QYhYVAs9kxK24fxUWvIDL89ei4nJU1bsQEYL35EO+cyJKZuPAdE5+n?=
 =?iso-8859-1?Q?8IJfYf+t9MzYoo5ZqA7tTtwoCkOgLhUkSHTaXGj8cjRhDv3qwVZDyluvHm?=
 =?iso-8859-1?Q?esGGew51BYBM2TuYCqngDuQc5gXHSNIQiho0A4cAxhAlPApkdgJzOGuY8X?=
 =?iso-8859-1?Q?qKns3bReSyO/BpqY0Vj2iVxVc8ihJLXDcTOVdD+i5SPorZp8aX/MSoyIzt?=
 =?iso-8859-1?Q?F6sZ/wQKiK9YyYCMyl/0UYFf/1qKCWZ2xgwDyhU7PyaMWgqJqbzZSUfPJK?=
 =?iso-8859-1?Q?dhY/UikgOaThCj252qsBWjRy6d6ryMlflAB63a7MDlABlC21ilNerT49tP?=
 =?iso-8859-1?Q?4kZ8sMbxknhirs+bCIzOXx5wGfHpp5aBoXfXgq5zFMtmpfoVHxqSLS/gfz?=
 =?iso-8859-1?Q?hCKL1gkkrgO5y8E7tC1wrvMBURbWiZMFSKm/+R4Ret+GHyzj5HtJ2wUXu/?=
 =?iso-8859-1?Q?oPeKRj53ektbPfdjoqoGuOw9KNgeTmIVJMtFvrS3rS3KN4p0jFPNmS4ERU?=
 =?iso-8859-1?Q?DYrOTAH2bR0/0lk9z5fSo8SP1SVKeI9HiC3vr3bOoSnmhjXrLTCSKM/xky?=
 =?iso-8859-1?Q?SnD1MBWZEfeMAFsKl93hCHbjOX+dNxL1wk9Y6KZ0tuHqpSEfUu6GetiWRr?=
 =?iso-8859-1?Q?v8EBhqJon+UHuEty++TG2W/e+N4lf5GVSM3Jt+BlRpGE5p5eVgHsMX0wis?=
 =?iso-8859-1?Q?gsdWia+gxNa+9zznxMBxWQ/IZX6sLhZ+CiFJfgYvS3BghLzTqE1TvcYypB?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?iso-8859-1?Q?v7Ljsvzy5/1PJq8wkTdsJk3AUA+Xt6Wqt1SfhsUAay1Un6Mnq7KntvF8c6?=
 =?iso-8859-1?Q?oy7e3hk5mtctv3oPIL/UK/1UOSpflc38g9qoVY1/mM+OWosDLj2ihuZcJ7?=
 =?iso-8859-1?Q?azNMb603HgjTIhb5pKmE91JF8muYNvUFn1hJT735HzHPXeh4ivpwqYOqkX?=
 =?iso-8859-1?Q?Kq4JBJ1jHaUWT2YGHv2XMyQEKZF5A1VoLHxzPl+opi+BqJJVpR5ASet8+H?=
 =?iso-8859-1?Q?z+jgIA49qq2Ow5YQf15DJLjgBmSbRcVjswtZg1zAotbXstnpS43Nqi90Kk?=
 =?iso-8859-1?Q?sb9pVNiGZpsBJhVhPmIZSiZd1/H2bWM5lV0lIakqkAaKOy5k5yfGlHrbTL?=
 =?iso-8859-1?Q?x4qAfqG2GLddLX5D0cnUChSHksTrWSs/VCV8jiCr3QjX2MbX8IRTNQ7/Ai?=
 =?iso-8859-1?Q?ekSRxQjlRKVsDUntL5+zVNWuxDg2+Pe5/7o9J+5BidPholuZL08gVi12pW?=
 =?iso-8859-1?Q?XCpNE6HyehNgCoNgCnyAmvcCUcs0eTqO42SNnXFeWn6kGMlP1AMc7YxHLK?=
 =?iso-8859-1?Q?/hg1WxO2syKsduBamBo2yIabPxqWTErbp2iwmnYhnYwyG0semxcc4Cz1Fr?=
 =?iso-8859-1?Q?Wg2INXe4FQxk3Ohpuv7PlwMMzGATebyAKD0Bt0kfzm8AnUNE77SGlbbbAe?=
 =?iso-8859-1?Q?rJkTiuNSUBWfEXbjYDSaOxY8uijVeO30I+H25fCj7vsL+zz8mAQjWQbELf?=
 =?iso-8859-1?Q?U7EE1U40EV8sBxfhS6dpV5aPw4ij5SX53QJTfo7yIvRxEPa3S5HFNE9lZV?=
 =?iso-8859-1?Q?ESyX54rpva+lJvg6PVvorGRdiTTPA5w+d05vEKTpBzTfpabnn7aZoPeQpV?=
 =?iso-8859-1?Q?dVr+9gWMlZep1KzfgXpmgTH+Q8qDoIDD/AkMcmIy0cxW/rtuy2EwumclvN?=
 =?iso-8859-1?Q?O1WqIkMYb8c/BBAUAAYdpEpI/7XTNhWojC3yPpZQad02XDc8LWIfyoqPR9?=
 =?iso-8859-1?Q?AsHeka83X09MQ8DThGeUxtg7G8s6y/wY9kHC4b6VmkeL9fqN2pndqqRr6s?=
 =?iso-8859-1?Q?qecBUsZLyGajw3qzeOj8vFRMZfH14nMYnJG44CGv92ErGyeYeBVAvhfhtQ?=
 =?iso-8859-1?Q?9tXfMO1w7t6SwmtychYPne/5QL2W38Z65KVeOqFVWKSPzcBAaEWp+ZmnUR?=
 =?iso-8859-1?Q?5Dm8oOOFyTlwKcijzHwjX5vN5JJK3dP7boufX6slWb1mBTm4O8FgWxMx5o?=
 =?iso-8859-1?Q?Xto1JBFW9U4ZplU8i6igrqva1DNu3xcSl5cePujjfKNWfWcdMHulAWkQTU?=
 =?iso-8859-1?Q?+kD7zMKmgB0FYvS05jQNxWQsSkZuSzMLgocBPv3mLxZV3cPeHwvIi/fNPV?=
 =?iso-8859-1?Q?byZRm5kPoFcQRQldgpDY/QYpO57YbsVpsfQQpZAMp7plsjGQXwDboYUMh9?=
 =?iso-8859-1?Q?e29kheXjw/4USDmtOzpzYtB0Vk9AAK06J0PZCZnoCBYWA6Ftn1T/eh57Mz?=
 =?iso-8859-1?Q?s4KEzh+P1F1C9Xa347ulUVrlKvN4EFa/PTqwQrleIVJ6flXEi5z/DlRPib?=
 =?iso-8859-1?Q?M629C5pRWHsRE51LR3yOsq7BrqP5eENnC/2PJBnPnS3oVpmEycOety/SWY?=
 =?iso-8859-1?Q?Z0rfpQGcbIN1eCgFeeCGdduYz7+tAcJvaryKhpZxDtATk9LvEX0NTBcnPe?=
 =?iso-8859-1?Q?OccQYsASxsHY0dIGKsmJ3mWNAIW1m6QwEc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f09b5724-0e87-4688-7295-08dda1ee96a0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 16:00:25.9437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8lQaZJWWGanYTKamsFdf8j6sMZ06ec56jcO1EQbGSNVGW/1l/AjlVxoxjmqdYgsigFdiLU/buJxOmohAAvuAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7881

On Mon, Jun 02, 2025 at 04:28:55PM +0200, Alexander Stein wrote:
> Am Freitag, 30. Mai 2025, 18:17:00 CEST schrieb Frank Li:
> > ********************
> > Achtung externe E-Mail: Öffnen Sie Anhänge und Links nur, wenn Sie wissen, dass diese aus einer sicheren Quelle stammen und sicher sind. Leiten Sie die E-Mail im Zweifelsfall zur Prüfung an den IT-Helpdesk weiter.
> > Attention external email: Open attachments and links only if you know that they are from a secure source and are safe. In doubt forward the email to the IT-Helpdesk to check it.
> > ********************
> >
> > On Fri, May 30, 2025 at 08:29:27AM +0200, Alexander Stein wrote:
> > > Hi Frank,
> > >
> > > Am Mittwoch, 28. Mai 2025, 17:35:52 CEST schrieb Frank Li:
> > > > On Tue, May 27, 2025 at 08:03:55AM +0200, Alexander Stein wrote:
> > > > > From: Gregor Herburger <gregor.herburger@tq-group.com>
> > > > >
> > > > > Add device trees for the MBLS1028A and the MBLS1028A-IND and the SoM
> > > > > TQMLS1028A.
> > > > >
> > > > > Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
> > > > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/Makefile        |   2 +
> > > > >  .../fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts  |  68 ++++
> > > > >  .../fsl-ls1028a-tqmls1028a-mbls1028a.dts      | 118 +++++++
> > > > >  .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi     | 291 ++++++++++++++++++
> > > > >  .../dts/freescale/fsl-ls1028a-tqmls1028a.dtsi | 117 +++++++
> > > >
> > > > New dts file, suggest run https://github.com/lznuaa/dt-format to nice order
> > >
> > > Thanks for the suggestions. It does some improvements, but I also disagree
> > > with a lot of proposed changes:
> > > * Wrong indent of SPDX tag
> > > * model property should come first IMHO
> > > * {gpio,interrupt}-controller should come before #{gpio,interrupt}-cells
> >
> > I checked code, it is specific rule to make -cells before -controller. It
> > should come from previous review comments.
> >
> > Do you have document or mail list require -controller before --cells ?
>
> There is Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.
> While not exactly saying anything about property order, "interrupt-controller"
> is stated in the very first sentence.
> Also from a readers perspective having "-controller" first seems
> reasonable, IMHO. "-cells" is necessary because it is a controller.

This document have not updated since 2019.

A rob acked
https://lore.kernel.org/linux-devicetree/20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org/

interrupt-cell and msi-cell is before interrupt-controller and
msi-controller.  The order may not be big deal. -cell carry more impantant
informaiton than -controller because all consumer needs know -cell number.

Rob:
  Do you have suggestion about these order, so we can easily follow for new
dts files

Frank

>
> Best regards
> Alexander
>
> > Frank
> >
> > > * gpio-hog property should come first in a hog node
> > > * sorting gpio-hog nodes by name instead of line number seems wrong
> > >
> > > There are some more bogus changes, so I'll skip this tool for now.
> > >
> > > Thanks & best regards
> > > Alexander
> > >
> > > > Frank
> > > > [...]
> > > --
> > > TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> > > Amtsgericht München, HRB 105018
> > > Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> > > http://www.tq-group.com/
> > >
> > >
> >
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
