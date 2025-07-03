Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012004.outbound.protection.outlook.com [52.101.71.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C871853;
	Thu,  3 Jul 2025 01:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751506240; cv=fail; b=VliPkx9cnWK9Tl0QUMtC2RAwFbiaL3qORs3HNCnd/CezRHAQHSaAZs8gswGAx4H1iW9hKld1t2wFc/Mij9execEAv3ZcdqjeHQn71aGapARJy4KzmAPhezEKvN0Sw4H27WA1mwm7HGxCoRvxFDtjIxo23qs4j9UJN+WwBahKHZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751506240; c=relaxed/simple;
	bh=yB+wZ5wsjCMGGJn5my5tkOMAGNV+pCBW/Q3RoFMqRck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ji8KkwMq94asekX+xJKhHaOD8YBT1qD5vGnMMtucYzTyFfs4wQoVbfOkdBPZmqLKMbz4v9LLI8Gy8rmrtOAS+KljJkIJThFXjoGlipjRmS7UrWvGvyxtBLnyQWbOaEow2HT7tl+/MZNRM8iG1zy40DFp1750GXyBHChHc80fiQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qTxlMBia; arc=fail smtp.client-ip=52.101.71.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qTxlMBia"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUaOoV0de6xZQA7nrYmIgbgSOUvSjtFzTaX1UOUSny7i4nvt6vlakIcJ3kJSt1fZeT/WMTABVjTgecjdV9P3MzGHdsRpVqqoWL8zNOkou4dNVrPqjiC8ceLe762Y33B1Wgc0CAsl+mPOlrUBxteb2EsSVOmSazw0LM7fnWZlxqbIcynURIZ0h06Z7Rav4HGW86xhcpK4lp2ddkoM4xLqyRqGTmcggy05tYpzB+/69jxRS26tAMX4WB32tifTbZ/rtRVSMCCyy5BwAJWG4Mhidysx/478RzDtPxber7e8fy3fNW+QfDj9ZgrA0Maoe6hyfThekj70AnqOdPKpzDPWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yB+wZ5wsjCMGGJn5my5tkOMAGNV+pCBW/Q3RoFMqRck=;
 b=v79g3CTXMVgT2EHu+cItVetgnBPVsrAsYtqWWFSlxwwrM7FunaJBublRHMWVanW3soJAV4XPNHCWC67A3WJHROtiDZLAN1XumqrXRJYWR62fQFDHVkEmGn7y5Rep33sdpIH2Hwsw5zH23t+QHdR9b+4hyYwgNgA2xLhOtdTd7CHTj/fJ6ZF8iLmLhOX1OYsgIvaIadZvK0BoQb/LrhZATAgXa/R1Stk5H19GDKx0yZTHdJlNg6rwSkmd5HtTblHMZJyWTPyF2sI9MTHRP1NMISIdsmQYPG7/UMhLI8t1W2j0mSs9kD65KEvVinA7nV9j+k3I4XJgjl+I5QWHqQjL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yB+wZ5wsjCMGGJn5my5tkOMAGNV+pCBW/Q3RoFMqRck=;
 b=qTxlMBiapSowZs2Zyrl4sXi6ozTvwkxSBiB/dJabIWgE/uc6QqFrWKw9E6Q8RuC8BAi34DFAcKrOfmoz7e3BZClowGwzAuf7e7t4kmqGWmMAjFFa2m57lDDTxd6xXMMV2sPdtOmZ7MkRcSI3rkG0+TIyvqeFV/u7oPfmDVUU529Ji42yDNWhBJovsozA35lKNsR8eL22VqSMVW7590K9Ypv3rsY8iIbBgsFRJsaqdv8whb3cxiSO107MTUmV2mnBNOXpAjSbUu2y/2JlRzjWi/vSE0cOiiXCS7rG55cNooFmY3DpGpnNIrpcyqJO01BoyG/BHlkirHIlhPUd+3efgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10910.eurprd04.prod.outlook.com (2603:10a6:10:589::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 3 Jul
 2025 01:30:34 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 01:30:33 +0000
Date: Thu, 3 Jul 2025 10:41:14 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, cristian.marussi@arm.com,
	peng.fan@nxp.com, sudeep.holla@arm.com, arnd@arndb.de,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] ASoC: fsl_mqs: rename system manager indices for
 i.MX95
Message-ID: <20250703024114.GB18168@nxa18884-linux>
References: <20250620055229.965942-1-shengjiu.wang@nxp.com>
 <20250620055229.965942-3-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620055229.965942-3-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB10910:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b6b1fbd-4948-4c80-5b83-08ddb9d1347f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?80uokR76mhbMAyjTtXl3kJmcSMYC8LT2VGC/jDxnOHlNedMnPsXkI3opVHE5?=
 =?us-ascii?Q?MxlKdQKgK7wDk7HmStQm80iMG9URng58KzBckAZMj5cBJVFvoU04GLKdResu?=
 =?us-ascii?Q?F5/y7XTuqYaZm8316kzVIHTL/qRUEkgAkEIydZn2fzflOgNqG4kaizW6DSkL?=
 =?us-ascii?Q?29q4bnkPmyngdBB1xBAhpioxiekcL2+7syd2nOKzVazeS5jWZb5tAFtjh1Q/?=
 =?us-ascii?Q?m8ikn9m7Sy1szYKqjCuoJH92lK90MW0TQUu4aeMY87YazWLmB6gGUdQnsOdx?=
 =?us-ascii?Q?VkMaaijceXwH1lljI6L27dSY9gZV1JU5qcUAsZQnKho41lTTfnxyKgqZPnIp?=
 =?us-ascii?Q?c6HtDYbUzMaMMWZZSP/DgSOQpotTXDfwc9PuLo+76CA+KiCHowpf9BFB3sek?=
 =?us-ascii?Q?SRhh1eWcgW7QFeSV44x2nnw393Zzw7wu+3KDfeV5/sn2RbgT0ocAbDwaSlpb?=
 =?us-ascii?Q?P40xyYGsIDInclkBanA2fIb96MUzGQQKb48lvFtaWABlH2eIvj/AIHvB1PwR?=
 =?us-ascii?Q?x1jEazvgRetSvclTcFoVU3pxD/+xbol5uv2whETZMq4AjydG+svHpe6bXnW3?=
 =?us-ascii?Q?hh/+NCsDXyn2hrc6bfUbJRE0ecxbl60qAsgu4MSicH6b7aBueYBPCPPx8sQK?=
 =?us-ascii?Q?K22ceMl52dxf1Xvkt2IWbj+nqogqX8k2PEUAh8pKj7IUm8gcrvk10PKaW6tI?=
 =?us-ascii?Q?NnryoBM+0m6NDZ3ARsrfM99C1UoH/RbYPPV12GaXQobS0Q8OJgClK0xWSIa7?=
 =?us-ascii?Q?NFBYIQ+yVnPSEeDRwcAGURhEftIrb/ZbRMu7jxBWy642l1WXA7dci1dQMxEi?=
 =?us-ascii?Q?IcsodYSZ3cYmgQNdACMbeolQPO2gqeNHZIibjiQGDvCATsgbqjIOJYTCoApD?=
 =?us-ascii?Q?zfgulvy6XNxDrWdbEVqUhZ3SUtuCOC/n8ZhAfxsclBSRxAo8Qf6qmAd9xADQ?=
 =?us-ascii?Q?F3Z/jODN5aKQimYN5TxKRaAIj0g3y0mDYw9Ga0TTz5Lb2YmkR5Au1mraOpyc?=
 =?us-ascii?Q?m36fQgftCex8Wl52VBvZObxdZ9d08Ltmx4rzAzhR5uo+et7/Xer/THkSLTN7?=
 =?us-ascii?Q?8Dn4MoHonh9F1jkEU7zfLN7sJ1MAe8L8UwkpMx2uoib6DpwEsgA4UhT2HFU7?=
 =?us-ascii?Q?mR4DdFMJhekHYYB8IpzIwt32IbYvwv9yJzQg6nZblhjupQ032ZefdESZnr1A?=
 =?us-ascii?Q?j0h38mzniWoQDz29/c+xAfe/5tw4EcuRgFDOpMdbr/uXfE3zSU/HZGKVf+ZY?=
 =?us-ascii?Q?XKqiCPyb8Mn6/gaoAd7MQmpxypYTp1zHhDtD10sw+h8isCHp6pmszPwKa5Ap?=
 =?us-ascii?Q?0+0iSpJuZgSnLvYvL2Gj2kX531/ciD8DcGaVDzhIMSV6zcoZiZ6r3/IhYWUl?=
 =?us-ascii?Q?lQedEaqMqlBtJ+nNxt/XbUCokiP1JAJFPhuu2zp8UutiD/G8hlbOETRjb6Mv?=
 =?us-ascii?Q?NF2i7F8KuzVtEOaABm67+JFLVowSH0K/P7fY5nkrUNCFn4AIgtRkuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oW4f5gBKWAAlyMq+zZ/2oIX1kxL8g3WRVDD4FXP7ArFtb8Y3rgne0luMqOkh?=
 =?us-ascii?Q?6DL5cSmV0PRG2fjM14qW5mTDLkbvnVWS0bdjo4RsAPYmcYCrgae5Syk0ax5K?=
 =?us-ascii?Q?qKL/kKOhRiKMchDj91CVkmLHVzVZhm0fJLUn/LUpgxtHqVmekhonnXsCaVqd?=
 =?us-ascii?Q?Qt+RolMsNXtDKRhJETtRqZxQUfuENSLk1/Nh0InguDol8Lvb3p6e0m0nwoY3?=
 =?us-ascii?Q?K2ih5o9CW/aLlng6QmB+hH7gFzH8faTTHL8ZQiI9szIr7fN1OyhQGr0zoKHn?=
 =?us-ascii?Q?uYOESXhtRr/mVbQKqmhDB3F1/22K5+q3AFMwKeMDbOidFjcopEHYe6C7uHE5?=
 =?us-ascii?Q?7rK0vILf6JGGYrByz1H7xIhgThuqsKpBxu8JTvrCPr4cRDiOK1j7eVrSQq6e?=
 =?us-ascii?Q?bPkZM+pRw3eWs7ESdDqYZhD7VT5QctaNO5sBf6CzJRtUJg7ZMYwkmCtlQqZ1?=
 =?us-ascii?Q?oH/SwHvovAqY713nn5ZoKTOddy0skgYL4sNEaJswHkHZVsNQWloSYh3Mx42m?=
 =?us-ascii?Q?50KxhY6uR89fnzl7l8U+JLIifLsHTfLor0VsIhWtYzKvYsMfCSttdyaHJf0i?=
 =?us-ascii?Q?eagcSN8pEn+UEH7FBxBnOADvSUzVPmK6+dmmruotkkvchJ3+AwIz4SqCJSjz?=
 =?us-ascii?Q?4V+OuZjLlmQDl6y93SDkK9ny36dsJCLTpEZbk/Zt6DRmO7Tb5DJZCgc24XS3?=
 =?us-ascii?Q?F3qKzokqsGAvRRuMTx/8LU9CyFCAncPFuo5kpmN2irdgpcf46+pZRV0T0Nvv?=
 =?us-ascii?Q?n5BvKLWAn/vFHkYGBT1GdrMShfChn/QUMviu3SpY7lhdZ+Nh5ca0/qR1U+X3?=
 =?us-ascii?Q?BE9HG5NsJZw4jUrcIiAhW7VuLmZHFvNXF/24vRXXIyvoPmkFgZiKdnnnNiyj?=
 =?us-ascii?Q?KqCR3NLAyJZjzCYUkilUJGDJboo4NOC53DV7MOjJt7cyIEsRd+MvIkNBEWaB?=
 =?us-ascii?Q?pycarc7PEkyYMfDIzjdhIpX/xKs8xcKqKbSYAcflb8c0ULFVudrbYizWEdhl?=
 =?us-ascii?Q?cuFVYMcMb8tOKisAj6sit7Ka4nZH6cuOjPEjmJX0yYzEldGRr4+LtRJ31i3i?=
 =?us-ascii?Q?WKnNSxpjZRoC3qBLXd1J6qA8zvkvBYI4ovGNEAoVF1Pl29fU013Ifku49VDG?=
 =?us-ascii?Q?JpNqBoDxpgmjjK2a8OJocufTP93C5blmbuCpvXrs5RtqjTnsM62oRTJ3NTlG?=
 =?us-ascii?Q?1tSSExg0GyJxWNbt7PLHo/4hDPd0SanCJnppwhyOQlTrBuFsqZCXGZL/gEAv?=
 =?us-ascii?Q?W8spMET9lEiPQq5uYqELTNDXaEG5kO+lUPPxJ42Vpp5Z9sIczSd87yfpTk+J?=
 =?us-ascii?Q?/R2bPsm0uwHIPWVtbwuP48cWiT+vt5S1iYTE2GCHkKSvXDAR+DiPZsoMWDYs?=
 =?us-ascii?Q?imKC9M8mdk1CHvvSoNwZysWxHjrWibYsj+k8BbWKWeSd3h57nEL8Ga5iZIIq?=
 =?us-ascii?Q?5//8H76MWLg8SBmda/HJkaGHIoItto/arRDU3X5wSaiAI2KsKhXoKi7XgFk4?=
 =?us-ascii?Q?Xei8F6FJRcEtjcxeUFabDfeh1eXPJqa9X4mnhv3jJSiGKaHmi2fs+OVv7O3e?=
 =?us-ascii?Q?1lR+SaNINjwQS0MPNI4CkgLtaN66FDBjJHLO4kkB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6b1fbd-4948-4c80-5b83-08ddb9d1347f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 01:30:33.8267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZQgk/LZYaiWAhWHJbzGFG/onzvsa3k9OuMr9ZqxRBNKs47IGtBZJSYTrgiE1xfVbHlu5Tvax/yTjHGzoEnTOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10910

On Fri, Jun 20, 2025 at 01:52:29PM +0800, Shengjiu Wang wrote:
>The system manager indices names are different for each platform, rename
>the indices for i.MX95 to differentiate with other platform.
>
>Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
