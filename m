Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013063.outbound.protection.outlook.com [40.107.162.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5225E1C8639;
	Tue, 13 May 2025 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127059; cv=fail; b=sKAyIUfsXaFCyGI7ZnH/41Q7ziDK/Oz5CoToBu/KJ/F8VZQAmKJmWWItFEJacEgsCW012kUAbNsBwrlQ+VrZPyrPiGWo0S4XVuQA4nc5+9b5FiM0hw6POR/8MjOPJnUx1BMWPKtmuc5MC+kzAUeDpITJPv4CA6t9Oire6o0JD2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127059; c=relaxed/simple;
	bh=LDBq2uECUzSVqAFznDBHXNAuWS/nZ0UifWEdbwrbVt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tmNfwjejHabuMQRLnd3V/q7u9uew48yRaSFtc4ESIEddJ71lDyrciWgNdKACPtKvFxOChURIf1WZsuv6Ht5dOGxN27K/wK6E4StNaogmLhyDrqwK5VLnTGWppXtKaRwO6hZSy4Lgsl+z4bZSbD2z4yMvWP3UKXQoFyesrv4cs6M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KdkATB7z; arc=fail smtp.client-ip=40.107.162.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KdkATB7z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujBNSzrNlCCqJ/JI+HmQaQWrmnnDZAZJjQ+O+qa9qpiQ4RFtwZfd2ezpBPcmxzRAov1gHNRscIcMX9feC/ct96rCRz4kAtpyqpYSdKOBE6ocTc6sNAgEEES90egxKYO0Z5Exao+x7rmszqRQ1Q8E+vLeJTjBS3HZboIUw43c1emhqm9SvEJnrbzTjVl2NantDUVfCjKEDvfD6xeRnrFjIMgGYObWHlWHRlgrZztK7h3aWDnDuJPKW68JwmSbg1mXSZg7fLrDDc59CqYYiEcERFk9862CmStlkkkBvuAaFzk/ehzdf7w4P9Tk/RQ1pwpNKnATAPzOZGJP22jh3nyifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmNJOkQcYCX5p0gnmgWlSPPtaG8Mp0iYnoT03r6c+Iw=;
 b=CFwJCz9IBqhjHNDpBhrFcxrH+rY+2EIuzebYq2tSQwII+/xZGP3eRYMWrClneNDM4/cActLIq7gPII5qXLc54DXdeGEuZ089VHgYmfrV/q83c9+pHSs8cUcaAwTob815BIWQBYOK4FsAw/pT2Sfd7Q9dgo8iIWgqqACTAkdoqajXq5o1oHSjNBmPFGW0JcUnyuyz80a80rdut3N5HHIRZy7hLmZCbzLDTdun/4rSqgH8/q+Yw3hrP8WF9egBXraqo2y3fS6jTLVmhQz3PrA/VKZz2d+bgG722LiAMKKKYzHNMar5IL9BiKID/kKY4FSmb6uDjzWzseRR8tu5zKGetg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmNJOkQcYCX5p0gnmgWlSPPtaG8Mp0iYnoT03r6c+Iw=;
 b=KdkATB7zy9DdsEUDaIPs2e2VLgQiVlnvmXuUHvQ0hPRyPO/2YlAaCipsfswhwf7MaFy64xg8Sm+p6tHFQ6JkAM55ly94F8LeEeDq0h/0hht5FRiVMB/yqcnm9VU3HO4dXWbTPc4IzPdjOSPcxt/lY8/zoLX5XYcNra0irNeRshm7BmV6/Xj3D7kI+0EivUYH+lXsJG9yVbyZKDKTaX+b3J0KYuWoH2mkssAhKN7tjV+IFxLYgOmIb4Fw9UPgNdXGo1xNm0OJSh7TL+tdS2CT2PQoxp4ifNL4nGbRhW0IjHhnmBzukaSK3gopS2f1hSjTznxJ3TVA123Fe94yo9Fo1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PA1PR04MB10673.eurprd04.prod.outlook.com (2603:10a6:102:480::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 09:04:12 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 09:04:12 +0000
Date: Tue, 13 May 2025 12:04:09 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, vladimir.oltean@nxp.com
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add bindings for QIXIS CPLD
Message-ID: <3xpk6nzqku57i56tzuqsc546rp66upht5wyrcdl7xxnqud2wvf@evakkcowm2it>
References: <20250509152940.2004660-1-ioana.ciornei@nxp.com>
 <20250509152940.2004660-2-ioana.ciornei@nxp.com>
 <20250512-festive-aquamarine-junglefowl-572f90@kuoka>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512-festive-aquamarine-junglefowl-572f90@kuoka>
X-ClientProxiedBy: AM0PR07CA0018.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::31) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PA1PR04MB10673:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dcd07dd-47a5-46f2-93c8-08dd91fd2127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5LygYKxKmAzz7a8gAZosXULRq2VeVtiY0uPyl7DN8Wo5LtEp97Hh6HczRDaw?=
 =?us-ascii?Q?heCEMs/z+mVcrKxWXEr1V/sqvTOBeG+enh51jvF7rlhzfZjXqxFWptO50qdi?=
 =?us-ascii?Q?drWRUI8O7nhip1oANr8F9jU9WAP3k43IFoiReT59J10YHtXWdCiNmelAuN9l?=
 =?us-ascii?Q?k5321G4Wu3fIOwdnG147WAHuEPBLiOG2MqE87cujF6gKE8QnoGMFsJ+tBoTy?=
 =?us-ascii?Q?qJH+tCa6zPs0Xvmsa7t5tFldt2X8WV+0kli14ZuLecw/N9q3N3oMJtZkXxbY?=
 =?us-ascii?Q?KSJt2P9pqYdXiK15m0Vev58xYniHoaqaHccR5/hd/3VcO5jZdo4VQke3SFBD?=
 =?us-ascii?Q?onLkY7nCPRb+zHsLG1zVzOVmXhnly8GdphtaHbqUqkjyzpHMu/Gb01ckPJFt?=
 =?us-ascii?Q?gRYMlqDDHWWuBg5nwK1pVhrlquR29QkwYUBFWWa5q/9h/O/uOyGa32uPhlhR?=
 =?us-ascii?Q?9LnHcpNC4NZYHv6jEDBLrJuk63KA8XjJzv6BjirtW8in1BPPu4YltEvuI54B?=
 =?us-ascii?Q?rsgDs1K86wU2pa4tNnC4V3GhgbTGbbcCeryIrL8SGoFk5zbbTy6Ffy+OqtbZ?=
 =?us-ascii?Q?eOWDecu5F+IH6DytvPKv9tVbXElpkaCav2w8JUzVBnYzRA9ONcAIOA/RCeku?=
 =?us-ascii?Q?UECzvAdFZFgfIi+6RJnBseaTFYpr/SYpf7exdpzzqvetWak1SyHfF0+MOEwx?=
 =?us-ascii?Q?0Io4usxS00BSIRQzsHA8bNIsEiscW3OvXJxtw9yxNO6Rs1EHJIK/wRz7L4wK?=
 =?us-ascii?Q?4IXhpp/n2FcpjwGosldU5icNXXyoEjJIBvxPvPpyv5R2CYH8b9JFmDsjCYTC?=
 =?us-ascii?Q?s3RYAh4/wFkxM+5R0iMtGhIckPDOzAdgJWdaP3b7Cw676QcwXbP1mvAOfQMe?=
 =?us-ascii?Q?jzYRex56AViyTDyLeUBrrw/tdm3pxp+Q1fNn+NYFmhM2H5O+9Bf1MrpkQ0oJ?=
 =?us-ascii?Q?Bzth8GBWSyqlOUgGAX18DFQNE/x2RillpYBxmowoXv9URqrkTwWq7EgvuibM?=
 =?us-ascii?Q?5MHSU6BliONdP8Es33NlboMbdN5jPTww4uCTLmthtAkIsNipqMLjoVhkZ514?=
 =?us-ascii?Q?K8MlDzl8o9VnYV2ZGe3V1MYyiKWIDyIh62lra4dkSZVixLrZ01Y80/dqhDPK?=
 =?us-ascii?Q?NtFvI5amh4Be+Tdj7cEvjJb4+2RilE4rx8mpcH01QRW1bDbpB0OYojH9sLW/?=
 =?us-ascii?Q?p0E9VG7IWBYEc5mzQsn2Q4hnwdcuLF1xdcsLhZx6OWj4MMhe1FlrpIUtIYpC?=
 =?us-ascii?Q?28IGmL6YPuTnS8zsJSTAJmxkJjCqru4Em2v3kcIcssggG/YTUhvYC7nrSTXc?=
 =?us-ascii?Q?W+FsBKptGD0Jiynlf3zHD+cMA1NpuZJ36M8sb8q8diM430FPKKFNxv2orOEF?=
 =?us-ascii?Q?daYug+0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4GHbMa7Q2kQUZgyZe1jbAWfEQvzd4m8BxcvC523rCwT3rTcsVW5BeO6b1JiH?=
 =?us-ascii?Q?nCcjYb85UF+VxqdC46kyg/W01CrlBb04ttIt+0v1CmxIbv4a4pWUViwzBbSI?=
 =?us-ascii?Q?LNRYZuPGo0wxa0MoWkVmMOpOJFz8IuWFhf4dypvMqSKIcbTTuRMPkzvvr+D+?=
 =?us-ascii?Q?sGu+7AWz1TyWaKKTYZAzItnEnYXCSAhPN3zHqqCN78H21bcN4OCTi0R3NORa?=
 =?us-ascii?Q?jtEgDlr41JUS+SatloQ898YBCUm6at4uFZ8l7psE1Tem/HBu8Epv2BhIWegj?=
 =?us-ascii?Q?1ECm87HVVeMbFXGCZuQ8flXcEyRlrXohF8urxeCFm2nfxEDScruKGRGCtZOy?=
 =?us-ascii?Q?yjAn3TSHpUwi4rVqWROX8KakqtK0q4jRTpJFGd8AeS1womsjq1ZfnzAtUpQq?=
 =?us-ascii?Q?zav+fWZyEoMfOlZruwiiMEJQ5TPSSnLS74cF56Tq76wggaTvjeJU2eSMB764?=
 =?us-ascii?Q?6n5LvZTe3wczmb3oNaIQdne5euGbbf+RZY0edb2wEcp9Ks2KaZwpE71xtHUw?=
 =?us-ascii?Q?yuk7UgX/qBdjRPjxp5dgBrdnELEmbn/60KLX7vjLQoyescPLUOPGsrNSwrss?=
 =?us-ascii?Q?ieyL0yve6+MEZVIasFdWZJsAaWlkNazA1NGGIPgaMkPA8IUZSfSq3LTIGHCi?=
 =?us-ascii?Q?2kp6CfXZ4yDF0qhKCgTvZEKUWvHT26Ekp9XnjdSNXCyiKIkjosTXmq2SboEc?=
 =?us-ascii?Q?ZEaXG9ad0grEJ8Q2OZgvcF7DXjh4xZwAl5n0ITYWzjSEOwvUFgXpv/Q7LiIH?=
 =?us-ascii?Q?/98PTSRvLLayabqFC2ovflRcF22fim8LYlDO2dd2fQBeVNtf2i/3mVgHStLm?=
 =?us-ascii?Q?IiZ3ojKeUXINte+e4G3VCuL1/DHWXiMwOlEUrNSNBF2YG6Lg+qt3IpUgaIsA?=
 =?us-ascii?Q?kRq6/rmNmrfazH9FxHuLUvzLHvCuy8Cnr2mzl71O7Hi6piMKcRInkSGRAXl6?=
 =?us-ascii?Q?B1T1I9siF59kWV9NTZjyoGChgEyklnNGsP+pkyPZsoHHWJNgMjlKAotDp/gl?=
 =?us-ascii?Q?hx7n815Hi5XIrz8xQXwSo3NjC/oA9e2smyOgTo+IZempTo0dtgel1Uyk0mtI?=
 =?us-ascii?Q?3WyYRxZILaPll8btX9aPdsVFpLWBhrb4sPjMBXq5YT/iEV3v6mEidsOv6UA5?=
 =?us-ascii?Q?ZwO1NcLxJHkMjCoFAmpfgn3jpdbgsyHkZSO0dEhOyY6GNzTR2GFPecN/HD/o?=
 =?us-ascii?Q?CRjXaLVCJJyrxJ8KZtLUn9Fh6rM2mBNhaVbWPyynZfz90ynfoGbvANmqL3J1?=
 =?us-ascii?Q?qISIsXQ0KKC8eUcKWdjEpMg+X49WfsOjdxFSrshFKKpf/zuAxsJc90irFn1L?=
 =?us-ascii?Q?HYEZNvZqaeih7uyUJ8nOI6mBbS2lq927UHKwGzTf8xVtUFyQiFiJnc2HqkpC?=
 =?us-ascii?Q?OHmV9KzlsgR+xnrNLKq9q3FX1x7DVCir1RCL4/28rs+AWtE6WNvLRkyXtGgO?=
 =?us-ascii?Q?Yv23gTTrJKEjsZE6tp4SSk5eoZh8f5FXl6AjXZ8d4SJ1j7pwriF1GkjeJU3Q?=
 =?us-ascii?Q?FnAdYtsv9J9H/HY53gU8uXJvnCFqV2u+BHr8u163vLlMWbWaGh3tyxRqjdb8?=
 =?us-ascii?Q?UV1j1XkQENatE32dTCJRnlDN3OJroZ65Kje8TIWe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcd07dd-47a5-46f2-93c8-08dd91fd2127
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 09:04:12.7351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYHZmcfqRqswgObw6B5IBVmi1K0/455HxNMCsbWjX9wl+d2u3VQ5oVY+TELMReHE9DjwBxGy6e3W5/Ggj3TRbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10673

On Mon, May 12, 2025 at 06:54:39PM +0200, Krzysztof Kozlowski wrote:
> On Fri, May 09, 2025 at 06:29:35PM GMT, Ioana Ciornei wrote:
> > This adds device tree bindings for the board management controller -
> 
> "Add devicetree bindings...."
> 
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 

Ok, sure. Will fix.

> > QIXIS CPLD - found on some Layerscape based boards such as LX2162A-QDS,
> > LX2160AQDS, LS1028AQDS etc.
> > 
> 
> ...
> 
> > +title: NXP's QIXIS CPLD board management controller
> > +
> > +maintainers:
> > +  - Ioana Ciornei <ioana.ciornei@nxp.com>
> > +
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.

Ok.

> 
> > +  The board management controller found on some Layerscape boards contains
> > +  different IP blocks like GPIO controllers, interrupt controllers, reg-muxes
> > +  etc. The QIXIS CPLD on these boards presents itself as an I2C device.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,ls1028a-qds-qixis-cpld
> > +      - fsl,lx2160a-qds-qixis-cpld
> > +      - fsl,lx2162a-qds-qixis-cpld
> 
> I think my question why existing compatibles cannot work is still valid.
> If you responded to that and I missed reply, please point me, but I see
> I replied on 7th May and you sent it later - on 9th May.

Sorry, I was under the impression that this message from Vladimir
responded to the question why the compatibles are changed:
	https://lore.kernel.org/all/20250507153811.ukkficut2f3jm2hg@skbuf/

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  '^mux-controller(@[a-f0-9]+)?$':
> 
> Either children have bus addressing or not. This should not be flexible,
> because rarely devices differ. If devices differ, then you need separate
> schema most likely.

Agreed, the intention is to have children with bus addressing only. I
will remove the '?' character from the regex so that it is clear.

Ioana

