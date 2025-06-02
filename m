Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE7D12D1F1;
	Mon,  2 Jun 2025 22:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902775; cv=fail; b=Dj/ds2JKszFUmMMn/Mo6DRNxeL/DHAwx27jYeNLAhXk4X1DJtEG5Z4viCigcYh1ZZ9Y8RuqeW/Ecxvib/7yMy4nPmK2+JKGCBOX/2So5yHmKuUfsbCTqztlJJB7Gei2exkeZfH86uhJrPdH87iJUmomiSc67pv+NORWnliBmy1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902775; c=relaxed/simple;
	bh=nhnxXQT8XLoEzmnKSquaf/sprzlIhuMv6+tN4pEhyuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YM5O6wPKO/ZpBNgA/tEDrdDZvsxGAiAzDGRBhD02pYWrdkV3QrXR8VYNK5qh/Ss7F2snCeqPniuV8vGz/YX5cm9pV2dTkTK5cqhQEgI4O5uorq4tnS4b3Qf16QhSfcf39C3Ce3efGKA7gcpcaEFUDi66ZlYEbt5/AudHNITM47A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lvrm+iZl; arc=fail smtp.client-ip=40.107.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lvrm+iZl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rryzzcqHGx+Bc637uQYSjJ9m3Rh5aWYF37/cRjfSmpln5O5LgRxdKU0gJQhGOsD/Xuvh3xyyXj2GUS02ylU8LU0FP5tbcSF8XMwgX1TAJQlYBwUz5c5tnqp1/Ts0tNfbmp3jg+ghTujvcfc86ei2xGysaCCwwC/X+ZOQdvpn/9ZN3Hm4OZhxh06cee6Rfk5ONd52XeruWh/Ia6Si/HqXpIltkur5f9mWhs1uQ4KfGQRHSx4QxRlJNjT2PQHEHHXnaCpOr9vSVlhn2Zniv9mfBF7M0YoJqUpsAGOjAgF52RanmkgQCwbrm55LgIZyKZ7vlZWyd9gS0a/S/8tkuK+9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeDTaG1eubiLNZ9ntQF1GrxJcR2HS8tkS3LQfZVRu04=;
 b=rFkyV4b8/pHlfvyBztcMKj4dNRHzEXG2xHD514qujt5yY2DTbzOIAg03Q1JeGq0G+e4YIr7t6Ud2reEQwPAi86e+/IJdzBhEJrNOXLjTWuMJnYd2oNseB2Y5ZXWS5Rik+y5mE6on4paHoc8APCNpb8M4y8/zDbsf8k3d6tLxv+Eowr8Fh8IOvuNcS3SoDTJFRdnB60hYxHKhUAJlJdnOdL2OEx091MKdcW1G/MYNkbZO2SqzlNg7gkEIC/g3einv1tK+FymG1lGHW84v25QhR09/ZrFGQbfeMzIAPJDr1vU9XnDj2qOPyOqD4h8aevCEUZqU47sI6PUZRYdH6Pfi8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeDTaG1eubiLNZ9ntQF1GrxJcR2HS8tkS3LQfZVRu04=;
 b=Lvrm+iZlhgMd6aYFSMSnO3vRHrRoX8eM3VxlXf7WwQnfXdunNaYcj1ouoUnMjgCCgo8x0brDwmL8YAb0hdMDi2Fcpn//l7GBBevq/XWTqg1i0kWfzH6C0+5wIaDkGPgwWHo+yPpCdH3Hl+rJ9tvKGU8SVZ5mERSlOpgo32638pVWtwxKpbUQhhsM1hGOk7iTwe26VgS+NYpPHfN82j+vouEyVnO14zMdwcVCPy3DNRQyW2V+sKjCSba1LWfShF+hk7CMUb6/KYkTNX5DZRmSmeAHxPFvJplgt32kDBgeJAYSx/SVJobhClDO794sHGOh12KBmJlbSPrISkwa7pk0aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU6PR04MB11231.eurprd04.prod.outlook.com (2603:10a6:10:5c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Mon, 2 Jun
 2025 22:19:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 22:19:28 +0000
Date: Mon, 2 Jun 2025 18:19:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
	Michael Walle <mwalle@kernel.org>, Fabio Estevam <festevam@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Tim Harvey <tharvey@gateworks.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: arm: lpc: add missed lpc43xx board
Message-ID: <aD4jZ3QrOS4fM99s@lizhi-Precision-Tower-5810>
References: <20250602140613.940785-1-Frank.Li@nxp.com>
 <5014a8ff-aa91-4ea4-81c5-7aeafc13b330@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5014a8ff-aa91-4ea4-81c5-7aeafc13b330@kernel.org>
X-ClientProxiedBy: BY3PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU6PR04MB11231:EE_
X-MS-Office365-Filtering-Correlation-Id: 27924aad-bb12-4840-3fcc-08dda2238a0b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?KRKe329A7TFmmti9puOMFm1cbFAJ8+R2TT4dmwwcvsvLSc5yGP1advwZWEYj?=
 =?us-ascii?Q?XGhaKiYXsvM+b5IU390ZuA3jzkbl37MtVg66PSDkK1qOWGyfIZbGEGNtlHIw?=
 =?us-ascii?Q?NSVm57rJ4/bry6zCUWttVY8EOcOeu3mO4PGCjh9nSE/RsgnGUmIx90spIaCw?=
 =?us-ascii?Q?T8IAxk+gHhb0M96YM5nwXCOooPGVCfSyjo3dCoaULhAoXhcOAnVvJ7Kp9Gbl?=
 =?us-ascii?Q?CxcL/Y1Wjj8nEdKcLuaiXH2scu81iaxqUq413vsIyhoZU8agYtoCedDtxtxz?=
 =?us-ascii?Q?BxQEOFyFbb5Z4uNR1A5/A0PNNeVJYYJDjD05QPlAzBC7Vk/VbR1ESl3aPdDK?=
 =?us-ascii?Q?j4kzvgmqhfUAqoElnPEfh1byxVrvW/lpGAo9f2Rr8NRn/Orfh/EaX1hVGC1x?=
 =?us-ascii?Q?rRPeAhuyvm1jcVkZ6UmzdbhvLzDPwgFrGuYv4/xrn9hcNvYqXgLjbII5/1q/?=
 =?us-ascii?Q?ParCQlU/bAwUmHE+HqKoQldMouRSFnTYo8Y2zxfQF4VnWOvct1BqJLEf0wez?=
 =?us-ascii?Q?SSBbwajVY8BrXD/qavQIJ7HaT0mgh19qOFNNMTkxWF4TO3ZmW7Y+WcVhecd0?=
 =?us-ascii?Q?aZFdqPvBD3EQBjcPm/LbHB2nTFtnQMPfYhkWkCbr7S8uhq+5ZCj+VNpaUiBK?=
 =?us-ascii?Q?EbIVBuskIssZC7kx0Nhu1XbdfDuYyKdRMIKNMAwwlDL8sYzjMA9wTfq65Yhc?=
 =?us-ascii?Q?hUb0zqvWTZ/IX2DqNinLZuyIERcf9GCmydIQctGNeV6oLLeWIGnwoTOcUEbz?=
 =?us-ascii?Q?+QCd12MJsAnp+q2JErgyJiXMX/sQhAgF1ExXV88lahjClRXAP3GsF2WMg0dY?=
 =?us-ascii?Q?7RkpPSytiEvia4kRXtRNxRDyxQe83gig26gIppkjRbVJQUz8cOtzZxtRUebI?=
 =?us-ascii?Q?dmet9NqdJkMdCvEE9hLKIOU+wsY7sLskI2VpCjOb/ykOYw9Uuonyj4QgQMHP?=
 =?us-ascii?Q?RKP4pKOg6BoHXBgVp+Wk1wei0rKU5SPrBj4djD3DDJme67OQfmpaO2u7luNE?=
 =?us-ascii?Q?i82EAZEuWAvIhbCTu/tkJvB6B2XmircP95lhcLnaqoZ8dhagDeL5WZYq/BGv?=
 =?us-ascii?Q?ny3QTHEDnLi0LAVsw6KBwV0ywAGXx4JHyk5Q6J8oknjr7rW1bsuQiEdjNo6L?=
 =?us-ascii?Q?E3pduzuzMCduKmHBY9Vv/QYkmNRqzbumBkCESaA5MhRa3TGsvZvzWT0DQHcy?=
 =?us-ascii?Q?qlRiBekYQ4SrNRjT+4IZyn6Et8WAx4ulzRipIAFS+WVCbpCMsxG1EDa/LIcS?=
 =?us-ascii?Q?UKdXheKG+gE9jzgnjKCKnFLsn3Tx5HztzdOpuNOphld4QszKLlHQL1QkxrMA?=
 =?us-ascii?Q?85+ywDezxs4ImZtrZI1zDnBxBDtj1XGOmXM12hZAvKl5X6ZUZ6UCioXq+qzq?=
 =?us-ascii?Q?R4xhjvMlV5rvhvVV5XMtZpSssQACxkClEUzywLzM8ZJcPz+wQIjbY1/BHeDi?=
 =?us-ascii?Q?NrFXOlFAUquS5GZ7AzL8KDQCWceAsTDlR5rbA+Kaabu5MgWtY+IY6Q=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?kVssl+0tmfDs3BiPiKpZGDKwZr3BMBAEgfFGqP5iRuPUu/yohsZH8n6vDDsL?=
 =?us-ascii?Q?U3QYKbh4RS1doL2sxMuGKlrUmYsv90DonAn3rIPebcufVAn41sKqr0/K3sy+?=
 =?us-ascii?Q?ajM6s4JBfu/ZJf6iYXEiE6Q8JSyfmvPXoyA+xjhMwog0WXk19ot59frePGeh?=
 =?us-ascii?Q?vY9D14emtT/5+XHvTRQoSNnj8nltfJXH9Uq6OAEjk4tgZnZvopXYuArFV6OM?=
 =?us-ascii?Q?0Sq8i6mQ4WOYQeNjl6pIvmq6da19zf1Nqu277fZoUacw/oB4hcdBOBXAf4y4?=
 =?us-ascii?Q?8gEfgGVw7Ehmw54kDl3QgKkoEK6MINTQ9GlMDvJHXuoOHZrWGx1bkGFEYJmI?=
 =?us-ascii?Q?1B+sDVHQ/XtTngPueh35fH3AoAwWBU3ynCore5Up72w4u+KnfD+caGB4+kvR?=
 =?us-ascii?Q?UTycDKssdcL4rEkW+qX8fnlebdXSOL0ZWSamYMaVZ6t0ofe8HXM0TAtqSD9N?=
 =?us-ascii?Q?nApZAb+mcMcagkL81Pj8a1+mXorgV4pjr/SNbRl+IziIXVmUq/9unFIGV73v?=
 =?us-ascii?Q?A9qvSbopzjEb//L8o/ss4BogfLPhQ2aN2pt1KNJIL3VJdqowFoVdPrGqozC0?=
 =?us-ascii?Q?w2b8+Q9aW5PT9+v22qFFnSCWAoCql0rFjel7G7OZpYjKedWbg1BBGHiR6SGL?=
 =?us-ascii?Q?s+FPXdCrmlqoGBI0qIs/HKycDBQzJW34yscvbqH9f5R6zljWyGmWVcXcrYqb?=
 =?us-ascii?Q?HA+r64KspcUr0TGh0zUNYwNUNpfwAUOzDykeGxG9ASca/2aUUxlaOFUqKZ0G?=
 =?us-ascii?Q?9PwvSNQN2SOpJglPNnlPZbXEfj6VGtoRteqtzzFYHwuLpkCaCo1Qu/PFZviA?=
 =?us-ascii?Q?j9qoD5iY/M2yckdsWqxlpMON6zn1jT8/z4Tkmhs+OcP/9MltzZ0M1/2bAl9/?=
 =?us-ascii?Q?Xy1uuKV+AA5VH01Pk39zH/SOJs14lOMOi366/7xPSq1H2J9ngHsSov87iw8C?=
 =?us-ascii?Q?hf24usOz7SIO7x505/9MStF6bKNp6o6R77S6nv3ST8DAwXburoqnUnra9LRr?=
 =?us-ascii?Q?DteZQfzuZUE3oBjVrLtLyuXuG1mP7DI4NoC1Yu0rximZsgHe4yrqSUqEK0IL?=
 =?us-ascii?Q?KQTjnzU5Wdxi5moH8bWKdrjq8euts7SkvbrvDKRNyTP4eHAWCfXZAjnGLYlq?=
 =?us-ascii?Q?KxjwkDpInVkjkCIxeDx9TtVMZlSEZ/F8k9mGG0R3h4apH2V0iEXYmJAn+uKU?=
 =?us-ascii?Q?Bs16Kje3IxuxMLMWZ1+uiE50ja6pR9bTl419Pme6yZB0L2qzFndqyfoExKHs?=
 =?us-ascii?Q?kURWCt2jBOtI77Z2uKqLhSUAapKbZuXHcDQSepHpMjSzc0NB+8rKdPRAay+y?=
 =?us-ascii?Q?TcXpuNh72qpPlLZZG/Qjj+iid3apwyG2S1yUkwBjgpZEECfKOuMlqYjtx0th?=
 =?us-ascii?Q?6W0zxPLn2FJG8Po5WBIMrzNrBInB03nIzU4ojzBXNjGnuw1d5Td06CUg6WUi?=
 =?us-ascii?Q?ReG75mfOwu/LnSEKCRBcK221F5XxgMswLKAamTU7c0jPoQ9SCU9zDk6reJ63?=
 =?us-ascii?Q?ydkgG90zu7xWNFoNK6RZv3DUrD9+ziiWpWbXww9pl1XdWduQlMl3qVQ/Gity?=
 =?us-ascii?Q?24BqPWW3wPME2WdRAZHddodLwu/4FmFr9IkudefS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27924aad-bb12-4840-3fcc-08dda2238a0b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 22:19:28.2033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KN5O8ofFL1Bp7DGWjAJ/jDoA1T1tkYxLIoW/Gy88S0qnchT2ctLGmWdtowIQTnKSVDdubXJLlL4S7ZU56jjg4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11231

On Mon, Jun 02, 2025 at 06:17:49PM +0200, Krzysztof Kozlowski wrote:
> On 02/06/2025 16:06, Frank Li wrote:
> > Add missed legancy lpc43xx board compatible string to fix below CHECK_DTB
>
> typo: legacy
>
> > warnings:
> > arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: /: failed to match any schema with compatible: ['ciaa,lpc4337', 'nxp,lpc4337', 'nxp,lpc4350']
>
>
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../devicetree/bindings/arm/fsl.yaml          | 23 +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > index d3b5e6923e416..75e46ffe9ba8c 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -1711,6 +1711,29 @@ properties:
> >                - traverse,ten64            # Ten64 Networking Appliance / Board
> >            - const: fsl,ls1088a
> >
> > +      - description: lpc based Boards
> > +        items:
> > +          - enum:
> > +              - ea,lpc4357-developers-kit
> > +              - ciaa,lpc4337
> > +          - enum:
> > +              - nxp,lpc4337
> > +              - nxp,lpc4357
>
> This feels wrong. Why 4337-based board is compatible with 4357 SoC? If
> this was intentional either DTS is wrong or commit msg needs explanation.

I think it is that legacy board dts mess up. I am okay to fix boards's dts.
but I have not hardware to test such changes. There are some risk to toggle
such old boards, such as the uboot may check these comaptible string to do
some fixup. Anyways, these boards is too old.

Do you think it worth to fix dts by take some little risk.

Frank

>
> > +          - const: nxp,lpc4350
> > +
> Best regards,
> Krzysztof
