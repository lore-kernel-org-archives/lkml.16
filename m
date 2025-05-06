Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2056.outbound.protection.outlook.com [40.107.104.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0683428151D;
	Tue,  6 May 2025 14:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540981; cv=fail; b=I18IvzWEd6LPTifMYsmm+if+YslkwGdbIIP9+GFJcUjdwYHFqnGZtpoHDRqPcVnM8IjM9yFSgS6xD+sJxCmp9PweSg4EVHgfqk/z7GPIbGJlioffyD4kZss9P0O8zJHp5LEc2+Cy/EsdNKB9oCHGThE7tlIgNngEbTHEkmprVhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540981; c=relaxed/simple;
	bh=DXeIfEccMNmJ0EINMLllU625vL+S4E2WQyYtmXE6kxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g+mvyOM7fzNcUUQuNrK4Dpzx9+0yq7l0YhKg++4xlCnjvMGe6Cris31HxnyfQlMl6t1ZCv/j1n/l9uZoDRRFfMALhlUmlCEVsRQTemgvaSM+aT+n8ZNhHipBH3QS9tyE+4KLoG7Ix5UhT+4H8qRrJztliTRN2oZ3o9Gqn7kNSSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DPSfZHO/; arc=fail smtp.client-ip=40.107.104.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DPSfZHO/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtnrv2Tg4hYixmF2BwX7N4oxtB8J/RcN1EeyFE5+22u447UNuP4hqp2+l03TsavsdPHRupW0g40OUGYFqovhOHo7IhhKA0kcG9r4ItuTFME+/q33XrV9bzIXT1eVSoRDhqA4+8lhbE/8FvU9noA+GsGqY07Z0uJFyT7PIOB9rcvNhmzM+9arU3tFUHL/O8c7c1y1EmssK0fLbCSCUSoaz05TW4HQp4BtNFS7NAcuH359KC+AaMocGqPwvX0bKOoM/TO8xv8WrO7HRS2NYF/GEVcJ2chCRovEc9h0T4HJNynOtAmkt2PfpP/8aOpWeWcBhnj/1wos7ex4HNXiIyNnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQL56Q7NqYtCiE5fpYsCErKs3Ur7H1CmXSF/PcymfN8=;
 b=Wz+fQBmWT/M25ASUL29dbvw4H98GdKosRksBNoTGdBfIkGt4UtKej5nXY52IuxGo7HSVaDxOs1Z2gfytLs5iCnsc7b3xHLk5mn0Eyls+6ebQ7d3D7+UeawSrZDL3hcI7H9yDcqKzYAq3cgR8VQqSqLHnN4M3llt0Zp5qJoINYLpCiEctQf+AzxJnjrLutk5ikiY1u2wzustm4PmiWWGzznVvz/b6Yej7WM3dm6OT1FzCDDyFpL7GDNy+/8+lz7BGBC9yuIQYw7/n/H6D22g/Cjx/nzNPXmpY5wLr3U7b695p9nrkVNRv0/T5dnESfMiuhDnVXvZOveOhiDxT/m190Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQL56Q7NqYtCiE5fpYsCErKs3Ur7H1CmXSF/PcymfN8=;
 b=DPSfZHO/Vf8UiaJCxRTv6IBKOUwcRkCTLZaLWhYZT1X2WenYoEodJaaCFwtFgfk9B9m/J60LdfcLhP5Y6lpJgNFw3Mtf8ZJZNc5ayWjJxI/lKHIXjgiAZHlkJSlGJau0AJEt1Zd0sHwyG1IJRaxrYVWJK7OUX+0qfsWfMwBq7LLfk+VWg1sHVbtqMb5H2mkbWiDJ6hHzyzGERVbIwVT2OkU4NaFPnEXuPIF+TZ/C3b5YW1xQ6wD9CsZWC1BrBkEfQt4LvZ1BNOd0k6vQYE6t+2IKx00BWcDlBg3h/H8MQZuq1W+uGn1t3ORzr23aNlp71jwneCNaJVqAF5/4iL7c2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB8653.eurprd04.prod.outlook.com (2603:10a6:102:21c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 14:16:16 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 14:16:16 +0000
Date: Tue, 6 May 2025 17:16:13 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add bindings for QIXIS CPLD
Message-ID: <miuxxgv73fmsl5plcoso73dk6bnuwgmlydzupnb7fcz6ub72ra@dro4cqbn67jt>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-2-ioana.ciornei@nxp.com>
 <20250502-meticulous-bulky-wildebeest-c1a8b6@kuoka>
 <wna3loahthqbn5hnw2pbt3yznmzzv3zppi7f2nblvq3t22jdc2@7cse4r4p6q5z>
 <959b56f0-ff63-485b-86eb-96ae32bdeb88@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <959b56f0-ff63-485b-86eb-96ae32bdeb88@kernel.org>
X-ClientProxiedBy: AS4P251CA0017.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::6) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB8653:EE_
X-MS-Office365-Filtering-Correlation-Id: db4d3261-f0a8-4112-9aeb-08dd8ca89052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4r+akctB0YG+gppSifajH4kRCOEgwQp1A5OzXNj9wgUsztfXca04eblsN/MA?=
 =?us-ascii?Q?4NTkDn2s3E18XwxlyegEmNQU3HLGcsgovdKATdwY1izVinZWcbqxBn+zLTd8?=
 =?us-ascii?Q?GL2VrfSOPjcmd4VhqBOl+4eLPsYGFUS8FRU84IUkIozIAsY1H+NiwnVtwV5L?=
 =?us-ascii?Q?NRdjj+++xrdy6eG5cO+8+KdkEh67mjXSN4QwMZVPrdVyRKJ8Oyi07yaaCIkZ?=
 =?us-ascii?Q?HGUX0piLKGjBnZnkuz697t1BtQWcLuv2F+vqeiB2LWsB8hkJknVKuMnk0plD?=
 =?us-ascii?Q?0rQ2xq+GqoUeV0NwrElWeavbP0a3/a+Pn3jC85hof9imL/kJUdadW0bzZ4Fl?=
 =?us-ascii?Q?vrVW0TRH1zlGoRrrGAoTgfX3wIJxKYhmAC+j+eK9YG8uD9WD1Zm7G9KMTUCC?=
 =?us-ascii?Q?+v37RAkIqAuCrboMgJm/jE1tBj6FuM/GsgMgUDgnTRFKeqawxPG78I4e3Qmm?=
 =?us-ascii?Q?+Q0EzSXAY2IADgqZFsHbxSDzg41kQXvncoJdDvxzjYm45m95u+FBwbFcd1Nb?=
 =?us-ascii?Q?vwtdy03owDOID55NGRHLnXEsoI+m1JJXCwS/fc/h3q5Tl+rhubn8Vd3peqHs?=
 =?us-ascii?Q?mj8RydWgr4M3I1RUle+I6eEKIYV5LqCwVepiTpx2/55HSQVdZd17Dj/89Ctd?=
 =?us-ascii?Q?Gf7BkjFq8mnCEinygnXSPZNU/ixtXfaFT3eqRDkwAkkTuFv6cBWXjwx2kN5L?=
 =?us-ascii?Q?Dci+YNiR+j5mfNe8fakGx1pYzYNEkB0iaOhuXGbLhtIsh62DaSKd0lfqwJHr?=
 =?us-ascii?Q?pysUA0omgDoQXQ/XKWf2ipKmPBUKqbaumUie9d5bCd1SVgyZGdylWdP/yvpy?=
 =?us-ascii?Q?9bNoRY35uMX7Gg09nbVyxddv6MD1qm+yMNNodxkIqLb3+XGODfka79kQ/vlY?=
 =?us-ascii?Q?6TG8EDxZjnclku018UHAqOS6krtYcL0CrCXHJLeJXH49D+wRKNnGt4wuJxX2?=
 =?us-ascii?Q?x1qBaideDU1S+goCoE68QgE79DXQYG61JIlgL4YBaT8F1zaOqzjKHoxVwNHF?=
 =?us-ascii?Q?hT4s8KlRm63mVrn/hAVBYC2YNZJduTPKG7efBlrbMg4KiAdNCEf2SarFN+E1?=
 =?us-ascii?Q?32HAtpmlW4hl6FSNLaep25XKKTr+Gv3iZrRJ8fPs+OVkVVo0/DUVKyx/B2PP?=
 =?us-ascii?Q?2dNl8fJKt35hRG4M/KjFOcXDzJanTSRJ19TYtocCAlkJcsuWQLGi5ben4s/H?=
 =?us-ascii?Q?xUEDTmCjQ8wykTrb+CzP7L1jDs1EFA0I4JjNo4IWnQHTvMuLL+KegWiTg7XK?=
 =?us-ascii?Q?oZqpavtUTofcv8PiEi36vbnaT41KOZcql7XIbI4/ZgusL9fzCf60jmJjQgPA?=
 =?us-ascii?Q?K/oE7Ay9UOkF8ZB8UQcbcvw/rXMApCdcTzBXnl9EvphKqkAOhg1rRU46bJ61?=
 =?us-ascii?Q?ZpEWM1g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A76dbCj2WAOurbFl1SCF/IbCKXlaG7rIXyjDVXUloRj4Wmo28vFG1pu7kMo/?=
 =?us-ascii?Q?tjPKlxojmnDn0MVee85v9FdVfmk1YQgsFWP2pwzHGSkL5ihrT+v02bWnjiok?=
 =?us-ascii?Q?QQkTGC64DLjTaiw4LQ4cpaykVrpcaybE26dbFnIEfouxeEeo17vixr+W8jrp?=
 =?us-ascii?Q?wMzIkudMpaceTDdlPj7M7DssndVHioFf0kjANXe/fvn+ZYRbsCwczlMDVlgO?=
 =?us-ascii?Q?Th4UrWi9pPE1UZiz2BsLz3yjRUNEOZJYx2/536A0dgIqXwXnQxHdQTGlUcwQ?=
 =?us-ascii?Q?jGss446+LmwDBVRIOJPcHwBqh9ot88vcVaElkgJ9rep99T5ebf/LtAjgjslw?=
 =?us-ascii?Q?3TayululfNZLV0hEXq6V3g7H775ZlCmZiWdat3igMUMfGQ/NJVw7u9ndmGn9?=
 =?us-ascii?Q?24DaBp4nV54OG4g3XR+JP+T0hlO/SOrgN94uSnzh6O0Y9WQ00nxuDj01yJMz?=
 =?us-ascii?Q?e8KyYbGfnuWUJBb1vn4yC6ppjTG66fqT+OKsVXXqFTq11triV9TFC/Se5Mty?=
 =?us-ascii?Q?vCBu2VDHkodpvNVIosgybR/7LBl9sR16LFJKbUNDf30HSONnRBC5yonQ979a?=
 =?us-ascii?Q?jFnxxNeH9zEXZeHp5llvypbvH+8lPhlp4fPFx/8/5iblA3QuPebwoqz4dHN2?=
 =?us-ascii?Q?6iSqcg+dD+6Pmo11kDTbVcDYF4IJI4DPFxxl4KqdzAjK3phiCbQ0ARV01YYW?=
 =?us-ascii?Q?YsVDOfM2x1ayyBzOqVZkYhyNBqyShopnmjrf7BlHE04EaUf31651WO3Xhh0H?=
 =?us-ascii?Q?IeNuxWX4zGdgtPVCQNaNF7viLzM0pBhWMa9srhWrIYjJlXfjRWhwGkLN3kAM?=
 =?us-ascii?Q?k1QOnPAjc07kJjFZDq8bBjeYuTkUijuzSb6HzukXXNlhIFxjoEYbR88TPvv2?=
 =?us-ascii?Q?lepG4qM53JMmS8QYcQA75XrC21FUIvV1H4GlAOkBr0n7zGRnlRs5TefkPO/A?=
 =?us-ascii?Q?jN1Sr5EfU6BQSr+wEz/MF7zcJcM6aoTnRAbLT9l2/RwNjanPfErM26o2a2Ue?=
 =?us-ascii?Q?0xGaFQiH+xlvMkUgdXIBrvL8XJnTwqwo03EGt1nb6qDRaL+O2TWapfOKWgks?=
 =?us-ascii?Q?PJEvQMiu3J+AoqCnyODFIeFVyBg1QnnNY+x6FLLjLYk6Zj+6ac9/FTzSQTZB?=
 =?us-ascii?Q?xxxy7tdog1cj+QpHUC+3ymutruO6SwFGyohOupL5k0banXx1lmf3FSQ4LIou?=
 =?us-ascii?Q?+7DlpUWQjEwDerFOls/WecSA4ueQTlnGQ3cV8oCPGFJYFmv921U2I8qTXFtj?=
 =?us-ascii?Q?Z9gdcM8SmJhE+DKPZYqViRn6GeGFInJhE4MFSCyU59va3SdN64aqKwTIPYaL?=
 =?us-ascii?Q?GxrEgplcUndCY94a349QJAU7lTESDxAj/oLHta0giQOEcGERBBkGcSnxbEFl?=
 =?us-ascii?Q?HQbFm3j+V5OzbHpoXV9xNGbJ5Y4jMY+kmhbv9ycexSctaFppu42A7rXF8pnA?=
 =?us-ascii?Q?sZt/D3glxiEq5wac1wtqgiD3NIDZPd12XTF/slHl2J5YaDoQt/H+j5tPz9o2?=
 =?us-ascii?Q?4qVeCHrfQfAjHKjne4H5w2fKXzYOBSuplY5jpPk0Sm2hYmHIbmGqwSf/5EsS?=
 =?us-ascii?Q?OJKlsi+jp5x7Qn0ZQJID/R7h6sZ2ixkW6I5WU+Ji?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db4d3261-f0a8-4112-9aeb-08dd8ca89052
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 14:16:16.1804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UyHlslfba2hw5ZNzfMY6dE5wwc4evGygnGCkHl/hm8s6Dxuh7rqLa2eCtgBMMJJxkNnmqcboBsexj5GnxhQYYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8653

On Tue, May 06, 2025 at 04:05:46PM +0200, Krzysztof Kozlowski wrote:
> On 06/05/2025 15:57, Ioana Ciornei wrote:
> > On Fri, May 02, 2025 at 09:01:59AM +0200, Krzysztof Kozlowski wrote:
> >> On Wed, Apr 30, 2025 at 06:36:29PM GMT, Ioana Ciornei wrote:
> >>> This adds device tree bindings for the board management controller -
> >>> QIXIS CPLD - found on some Layerscape based boards such as LX2160A-RDB,
> >>> LX2160AQDS, LS1028AQDS etc.
> >>>
> >>> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> >>> ---
> >>>  .../bindings/mfd/fsl,qixis-i2c.yaml           | 65 +++++++++++++++++++
> >>>  1 file changed, 65 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> >>> new file mode 100644
> >>> index 000000000000..562878050916
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> >>
> >> Filename matching compatible.
> > 
> > How to choose one if there are multiple compatible strings?
> 
> The fallback or the oldest or the lowest number or whichever you prefer
> as a base.
> 
> > 
> >>
> >>> @@ -0,0 +1,65 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml
> >>> +
> >>> +title: NXP's QIXIS CPLD board management controller
> >>> +
> >>> +maintainers:
> >>> +  - Ioana Ciornei <ioana.ciornei@nxp.com>
> >>> +
> >>> +description: |
> >>> +  The board management controller found on some Layerscape boards contains
> >>> +  different IP blocks like GPIO controllers, interrupt controllers, reg-muxes
> >>> +  etc.
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    enum:
> >>> +      - fsl,lx2160a-qds-qixis-i2c
> >>> +      - fsl,lx2162a-qds-qixis-i2c
> >>> +      - fsl,ls1028a-qds-qixis-i2c
> >>
> >> Keep alphabetical order.
> >>
> >> What is actual device name? I2C? Is this an I2C controller or device?
> 
> I assume you will then drop the redundant part.

Ok, I will drop the i2c part. Are you ok with the below compatible
strings?

	- fsl,lx2160a-qds-qixis-cpld
	- fsl,lx2162a-qds-qixis-cpld
	- fsl,ls1028a-qds-qixis-cpld

> 
> >>
> >>> +
> >>> +  reg:
> >>> +    description:
> >>> +      I2C device address.
> >>
> >> This says device, so i2c in compatible is wrong.
> >>
> >> Anyway drop description, redundant.
> > 
> > Ok, will drop.
> > 
> >>
> >>
> >>> +    maxItems: 1
> >>> +
> >>> +  "#address-cells":
> >>> +    const: 1
> >>
> >> Why?
> >>
> >>> +
> >>> +  "#size-cells":
> >>> +    const: 0
> >>
> >> Why? Drop cells.
> >>
> > 
> > See below.
> > 
> >>> +
> >>> +  mux-controller:
> >>> +    $ref: /schemas/mux/reg-mux.yaml#
> >>> +
> >>> +required:
> >>> +  - "#address-cells"
> >>> +  - "#size-cells"
> >>> +  - compatible
> >>> +  - reg
> >>
> >> Keep same order as in properties
> > 
> > Ok.
> > 
> >>
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    i2c {
> >>> +        #address-cells = <1>;
> >>> +        #size-cells = <0>;
> >>> +
> >>> +        qixis@66 {
> >>
> >> Node names should be generic. See also an explanation and list of
> >> examples (not exhaustive) in DT specification:
> >> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> > 
> > In this case, an accepted node name is 'cpld'?
> 
> If this is CPLD then yes.

Yes, it is. Thanks for the confirmation.

> 
> > 
> >>
> >>> +            compatible = "fsl,lx2160a-qds-qixis-i2c";
> >>> +            reg = <0x66>;
> >>> +            #address-cells = <1>;
> >>> +            #size-cells = <0>;
> >>
> >> So were do you use address/size cells?
> >>
> > 
> > For example, fsl-ls1028a-qds.dts looks like this:
> > 
> > 	fpga@66 {
> > 		compatible = "fsl,ls1028a-qds-qixis-i2c";
> > 		reg = <0x66>;
> > 		#address-cells = <1>;
> > 		#size-cells = <0>;
> > 
> > 		mux: mux-controller@54 {
> > 			compatible = "reg-mux";
> > 			reg = <0x54>;
> > 			#mux-control-cells = <1>;
> > 			mux-reg-masks = <0x54 0xf0>; /* 0: reg 0x54, bits 7:4 */
> > 		};
> > 	};
> > 
> > Also, some boards have in their qixis CPLD gpio controllers and I am
> > planning to add them as the next step.
> 
> And if you tested that DTS you would see that binding does not work
> well... so my arguments stay valid - these properties in current binding
> make no sense. However binding is just wrong, so maybe these properties
> make sense after fixing the binding but then in both cases: current
> stage is not correct.
> 

Yes, I agree that the current binding file is wrong. I even said this in
one of my ealier replies to the bot which found the new DTB warnings.
I will fix it in v2.

Ioana
