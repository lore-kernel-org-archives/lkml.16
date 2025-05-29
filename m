Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFB9347B4;
	Thu, 29 May 2025 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748534447; cv=fail; b=ArUhu1ItznKAy0osXXonl+89sinZxIBA4mc4L/gPx4QMql/PM1chJ4by5HOkpN5uAvFBwYDOiCo58GL4qYxIrwmZ113DCkBx5qZVqlhhX5oKF5aG5j0iTBtZG803FTSv6yU+MGnQcAzCVFEUJO37VLC/Ly1ns7M67pYb38ZMq5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748534447; c=relaxed/simple;
	bh=6IilOmPsrUDQrD8GGpOxUru6NKHS+3jfbtVvesw3Wcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EPg/VvfciqpeK9J5NSjjd2V9myBciSUpUPKx0WMelltoT+ltDbYCBrScxPCcba/Ed3ksIjz4+L5GIZzjAz89/MvvDzK77WuDBztwqdSgzZyvrKHfuEfUUnp4p4DHcQQTnpM4+HobtvGxgUpyR126Mc+kgBpK2iTtKHYJYSOVYw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jwykS+Dg; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jwykS+Dg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1YjFXws0zKSLJAe8RI1qnIa9KNplXduVTj92XaUTjRPvWYk8Amn+kLVrcbLxbpZ5+MiTKpMrZbv/S+qwdF8Lg97I1S9XbhYT6wEd4X7VORvXghmqbCaP3/xxIOlqykGkHZ09Jtvmb4HH8MBMOyMnkWA8c/TwXXnw5i7wM9L7HYqqlI9FOCSyhaBYHbYy2G0MmTJykRo0JaP9KjdNIWQuy2hxpqvNqrhpdt6akyP8r1rKjBSr/Rzv2e8TDqvawAYC6jjyFQybliSGu+wz0bgjhhF/PSQpml/a1F8BJfgUHXCUZQTolekeUUPNx7hm5V6EDPRusIDImh7hi8NK5qh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLQYP2uSkIK8/jMkXSzqFnc6w4WKcp+6jQZXo6Jo3tQ=;
 b=eVfRfL7W7iQ4hBlbEHjUuhKKuK7FykssMzE2IQTsqVCvSJpPlkWdB7lWshLSDuExLbZcFI2sa7bGtEJrI5g+GARbXwbWEkgYv8IJ9Y+c+4I0Js1aT7S2CkLP2KFEgwz0EX3KoWh+FCZBBUl027cePgRdpuBmLsA7zCtgg2ss1V4beM/EtJqNZt6wQdcpNcN0hkHmeIWQP4xsCgd3vo5Tv3S6gCQ1ZFe8b+HVclVa3+N+f6oSV/mC/5YS3uXY2POdhtyb3MOd4XKI3b05xVZ5WbenpY/M6QP++G8zxzo+3wDZf0FnXy4JBTtuPhWlQSzgzu0Z9CPQchds193RlVbkfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLQYP2uSkIK8/jMkXSzqFnc6w4WKcp+6jQZXo6Jo3tQ=;
 b=jwykS+DgIqpF25CC3CCL7kRFTv7ElFNa7kWJhei5/k7yYUE0Fi/f8SNfZnMVqLYx6PCcDh4MBOmoNxQQP4nCca8EAXCf7QquS8+M6npwMB6a+MQn+DgnnagkNU61Ud1iFc5t153XWRu1M1lp170BZx5if1xbCzWgvamxtgPto1pdoegp7Alxq6Sh2Qza9/YEcEgqH559hjvlSR67wW+rYVfxaZfQ/HOV0A+85OtdxKzaqf2lfP0Za4d8a2iQC35LzUxJOqBtThLhzO0e7eXIZ6XnLf9EcmWIoWdnA+FsdSUOdyo/0eEWK7PKK3uOGuv/kf5nnpX15pR5qfgyB0Vk3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU0PR04MB9659.eurprd04.prod.outlook.com (2603:10a6:10:320::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 29 May
 2025 16:00:42 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 16:00:42 +0000
Date: Thu, 29 May 2025 12:00:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Li, Meng" <Meng.Li@windriver.com>
Cc: "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
 watchdog node
Message-ID: <aDiEpsIt0rJi1aRQ@lizhi-Precision-Tower-5810>
References: <20250528111751.3505224-1-Meng.Li@windriver.com>
 <aDc1gobqagsYohO0@lizhi-Precision-Tower-5810>
 <CH3PR11MB8773AC992036FC042BFCB4EAF166A@CH3PR11MB8773.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR11MB8773AC992036FC042BFCB4EAF166A@CH3PR11MB8773.namprd11.prod.outlook.com>
X-ClientProxiedBy: AM0PR01CA0110.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::15) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU0PR04MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: ca86f453-e9a4-4911-6dc7-08dd9ec9f6c3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?x6A1NY4nHqHZS9fxMHH4SX88I1cBAxjt2n6ZlIJ1tI0dDU+o4DOZX4W73e2W?=
 =?us-ascii?Q?fxdE2jXCZ4+KRDHmmoGs3oHmfyvawBnduaUxFB1+aXdvnk4mJISbr2eKN3+v?=
 =?us-ascii?Q?fV3ll00ecQHbgL8Ci3/1XhCrh68swQheIo9XG/YY/lifx9EvN4rg+XTYu/Hd?=
 =?us-ascii?Q?nyt1PZBPkhVF0HIQpcOQH0dxI+wSslACBzLUnL+kKalAjNpAxp1PTUiBVOfd?=
 =?us-ascii?Q?BgFDccW+9G3xLN2bAF0YGqQ6NJ0K/l4PyRMjPfzLcINLm1FXkK/MvJorrdHy?=
 =?us-ascii?Q?Gu3ejIF/IIz8dTLWyzmvTbL9kLN/cVa+NJaM/8sSCCL9m8d4FCYFNBKMni0O?=
 =?us-ascii?Q?Fjt59luut7AY0/VYq2WDRz7YRtDWhMMlysmCoIjGcw7Eg2sKowWzIxcjwHhC?=
 =?us-ascii?Q?uR/uXsgSWicz9iH/JlRGs3vkQnM7rCrbBOiwivIR+cVETF/xxlgxog9stqY6?=
 =?us-ascii?Q?juoub0y7SFPny5dhW/mVC0/6GNw17oqZja6jbsjkOtxvuYb7+7pfJ7sUkDMZ?=
 =?us-ascii?Q?O8XAWbp/o81iz3jLMuLr6NaJ8iF5iqJEIjxi86eAZdA4JNf8vtyzrnam2xIP?=
 =?us-ascii?Q?4sW7FfobN9ML0j4mIuRkQ6ELEusJ4b/WQGvIajScSxQyuMYezpO8/MyEDKT9?=
 =?us-ascii?Q?kwQEKsOXneMRlx9cyIRkFMcq6peWO/+hhJv4puFm49+CrTY1pbbIa3+S/unO?=
 =?us-ascii?Q?5Ep4sqEjU/Afzu80nafCbD3hGoXojXk3CFGUYFuOeRtLpynBqlfHxBT5ehFc?=
 =?us-ascii?Q?AIUB6d0+QmvtV1Ud92SS/UWDxw19zBG+XDWEJ/tFKy/lxhMlVpxYPYB4wcrf?=
 =?us-ascii?Q?JNsCroFb9oxz1hRTVFxO1HwuDX2pcTrtVx7yhuO5DqBBOgd3Rgo9b4P5b2MP?=
 =?us-ascii?Q?MhZXY0TpAEEgNAj3i0Wenlp/VfkiZKmBkguMJPY60EHT7ErEaFt4LXE1slUJ?=
 =?us-ascii?Q?FFVnk+0OTliTs5Z2sOwvCwLauEGlT6mdORSco9t6vTxyY06Ckx77HO8grF4S?=
 =?us-ascii?Q?FbAJXs04ab9ClBB5smDO8/oSTcF3JyyEgaoygI7Z9ORUaDkDQjZORCVuuYLT?=
 =?us-ascii?Q?nsRiO08ASqGp6RrU8g7TU5fdot5/hX9EI1Ja+5gAZprC6uSBMEBj4kALKef7?=
 =?us-ascii?Q?jdZ+bGxnX2xIhnZnIrHZ5RJXTbvmta2gfgeRP4+HFU5uhM/4Q7I0zYPqIqKF?=
 =?us-ascii?Q?KZk5ZqbJXI35tYSi6F0039G/pWCcxHeBnYrTnD/1RIo4t5/kNLClflr4uUe9?=
 =?us-ascii?Q?y4Cf/s19OBSgx66SzU7RGHKfp338VH180a94/Ce7X2o+Tb1iC5++O7cSY1sP?=
 =?us-ascii?Q?5MSfZqDWyKGX2bZ2Ux1y7R8YrgOCQ0H/TZmlx9j39SRIBivz/qd2dPite/RC?=
 =?us-ascii?Q?l59bLnDhyiFAbEBxm0KzgzruJ2CzAd+Rmcqb/81XkKMIGBhmRyOW1OfxcMDW?=
 =?us-ascii?Q?ql7w2KsS/JrU1+UZt3dbeoq4etuQvCIk/MPqUpTDQJmjxhVhjC8vIcQid4VZ?=
 =?us-ascii?Q?K25wyRxfQ4pIozc=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?74VnUycuMKcu8+Y3VhWmqHyKakLNq6IhvHmlWJEl+MkOz4DnFyREIhezQoGU?=
 =?us-ascii?Q?l8P4dTMGDpJqw9zeC+vC6FWj/Z6HEJZ0tWyyflXjdOLlrsGN9tEVn/SmIytw?=
 =?us-ascii?Q?2uGlnKe/tj3+oBYJkx9OPKXPWZ8v5rMdX8sjsqMaOC4pAbWwaZT3uRWop8N5?=
 =?us-ascii?Q?7QyOZ2vpaDN2yk3gynImxNVK92owT9p26M9mwN/BitfX2LVoYMQBhxe/BCUJ?=
 =?us-ascii?Q?f7uqyjkTREB1hzy0y92fhpz8adOfii7qBQD16uB4apBWmI5hhwSLmAAy9RWL?=
 =?us-ascii?Q?FGZ3Dqf/pyji0OJt+H7qqUe2YrwvE85lkqEe55TroNlxD3W+qXRIfRpj4atX?=
 =?us-ascii?Q?Ct+rLbzdUfy20pqJnQtg8ZlSFSJlDVKHPBHzpy+7UiBAk2Dt4jVExWSAzGtR?=
 =?us-ascii?Q?rzvAdIH9aSIkZD6Y033wyAHJr8iNe89iZWHp1fQIlJ/3A37tiIr3lIank6Sl?=
 =?us-ascii?Q?cX4RwmShBcsKjrs7K1nPsxBCcI3dwoxsfzdB5GPNakJJvUZOSBWoolRScZu1?=
 =?us-ascii?Q?hRgGIgVnQPes5vnXroXk+TbSifv9nl++4FmQ5tcCA1SOln6cJt0pWIx7lW3m?=
 =?us-ascii?Q?6/B6J3ZTdwu9trssm8IOYTn+to4/N4U0LeyP8glT+FkgtFpXNTsRcow5IpBh?=
 =?us-ascii?Q?6TTlj6NEAHQUbTSCvYjR/rOvfmBy8XdkYMNvvpHCBrpZqrACEoe7aqGnfClM?=
 =?us-ascii?Q?/FmRe3471dkcOv9+nq825vwlUx9qI5fSBPj86KfQTH7+qwaMSL8IJmZ5IwCC?=
 =?us-ascii?Q?WOFGfNuugCwKlfvn8RBRfFFAUtS0J2mcEIjnIfff1INJXZPUiOd0NC5A2CM8?=
 =?us-ascii?Q?Z1ueEw00M1krewCfry9bauPVD0uJBsExLR3DggmKguV6gqKr3PS5dtZT8yWj?=
 =?us-ascii?Q?8gALhvlFDFZsfb4VE63rs6m8SoQay/GOtTzCdGqMxNpp6KVIAMo7hY8oFrTS?=
 =?us-ascii?Q?cW9ZLg3gy5zuebks5NQfirLK0J+bhajp+oKidy6Zt7kaU/gGWArKVJtyK2vV?=
 =?us-ascii?Q?y9CDplRTTZrqA3LS/gHebuvezKrorqBDb4fzxFQ3YGA0vS8QqUHYEh+or2Wp?=
 =?us-ascii?Q?0W4LYjAGBGRF3uBkzmQ1MM9jwDzpt3simS8LBnsd800kFxbMau5xe41G059i?=
 =?us-ascii?Q?qsJsFQ41J6Klm23tFeXo/4wXBnTw9RCJdk34ADSGi4r68m7Wnc6dz1xZcI22?=
 =?us-ascii?Q?2fAkQRGr0gbhxx6cIS1f7/S5rAULSsOb+CYFnBcGOjbU/wbarhLbp+JuJtKb?=
 =?us-ascii?Q?zI3xdSHc3BcUC96TqhpKDWDPXagBGaFn+krsvuxd6rykTsqb7KYH3gMduUQv?=
 =?us-ascii?Q?3CCiIGh9MoKEYZbgBIOJb97iH1FIPK3vj+kTqFlDhjjrI32xXxrqM4K3Lnkl?=
 =?us-ascii?Q?xe//LpUif/HIBjwZ02jBLo0sTztoRAwhVhPn9VnusKj+rVJnzu2KUobVba4t?=
 =?us-ascii?Q?tA/hw/V94/nrGwjFZxUrwBFugUimCf0oRmPvCJEyXmxy79v9/bqDBYCrUcyx?=
 =?us-ascii?Q?Vz9tUt0OwCv5eqHLBtRQJIF7yo/TBcHvl70r0tXFwJFIZ9LVzuOWgvpbb9Xc?=
 =?us-ascii?Q?VoA91LcISd+lZRMJq/VsarJjkPGcVCDT8JClplwv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca86f453-e9a4-4911-6dc7-08dd9ec9f6c3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 16:00:42.4868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2jZHBojHOM9/OviE/OjDn9uhtX6XWoGoV28lwH/IHV792uXimGI7EcDqILgKqc7tIzSioE0apZ+yvfZo+cI4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9659

On Thu, May 29, 2025 at 05:50:03AM +0000, Li, Meng wrote:
>
>
> > -----Original Message-----
> > From: Frank Li <Frank.li@nxp.com>
> > Sent: Thursday, May 29, 2025 12:11 AM
> > To: Li, Meng <Meng.Li@windriver.com>
> > Cc: shawnguo@kernel.org; robh@kernel.org; conor+dt@kernel.org; linux-arm-
> > kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH] arch: arm64: dts: add big-endian property back into
> > watchdog node
> >
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender and
> > know the content is safe.
> >
> > On Wed, May 28, 2025 at 07:17:51PM +0800, Meng Li wrote:
> > > When verifying watchdog feature on NXP ls1046ardb board, it doesn't
> > > work. Because the big-endian is deleted by accident, add it back.
> > >
> > > Fixes: 7c8ffc5555cb ("arm64: dts: layerscape: remove big-endian for
> > > mmc nodes")
> >
> > fix tags should be wrong.
> >
> > I remember I tested without big-endian. If it is wrong, please revert original
> > patch and provide enough reason.
> >
>
> Although you said you understand my patch in your next email, do you think I still need to improve my commit log more clearly, and send a v2 patch?
> For example, describe that only the big-endian of watchdog node is remove by accident, and the mmc works fine. Only add the big-endian for watchdog feature.

Yes, you'd better descript why it is accident remove.

Frank
>
> Thanks,
> Limeng
>
> > Frank
> >
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Meng Li <Meng.Li@windriver.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > > b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > > index 4d75bff0d548..e15ec2e1cb04 100644
> > > --- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
> > > @@ -753,6 +753,7 @@ wdog0: watchdog@2ad0000 {
> > >                       interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> > >                       clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
> > >                                           QORIQ_CLK_PLL_DIV(2)>;
> > > +                     big-endian;
> > >               };
> > >
> > >               edma0: dma-controller@2c00000 {
> > > --
> > > 2.34.1
> > >
