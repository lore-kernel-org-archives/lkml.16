Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2085.outbound.protection.outlook.com [40.107.103.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A599B154C1D;
	Wed,  5 Feb 2025 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771966; cv=fail; b=TLVSXljv8tXfdwRWpFu5MlzKQj8vSa895fQYBj901qgE7pL45mOpajd4Dl/EMxKqyokcDqgVF5hklqVLRyEyXi3ZC7QbiQmem6tiuQ2M2SaGE1tlYfX/j2+9BsdIitsHr82YpNOQIuaaUu7gCEI0BGMhdQTEDq8Yrvayd6FCagk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771966; c=relaxed/simple;
	bh=U8Fi1mHPiYSYH4bw1+ic0yUmoC8jNfrl6l+NZlsxyzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=m/qcij5LcQNOUPW0ndHr6HHxgE8Y0TLfezY57U3X4/Lj6x7shN8YcWKacYRlMs1A4DC6zqYt6unHNvX4rj7GGjxQ0h/mKqDakbOVjO7xHtmbfM70nFwYlryIApwxRhILBm0me7Hj1fIPGf5+h3Ewm8q1hMe8CYpEG9OdBE18ZK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JzKjDkAP; arc=fail smtp.client-ip=40.107.103.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JzKjDkAP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+b/3JWgljXDT4dLno1LQRBAuwhTfiSGzKmuvGpA2vrXOHVFglNfuG1tWIf83lXn2xWao7CQY8UYWPEwMsj0OTrpWe8CF9A0WtOZJpR3EhT5TWs+NVO2rZ2qdl+v6sCdXktdvuFwpdjg3WMqDK9QROwhkcdCguesBtMeQbXuBp6HoKm4kvjGf/KB3CZJuq+3pG4C/WLCR/fZHOqSg7XBP9yyLOxlp0irg6n8dG+n6HOHBEcPguJ06sAKx5wF0X/l7TjJoKEsq0rYUj9ocBAwf+CwD12UTxNj00YEsiPZwXzw6NMqam2RiOOO5OfP2dPlCAPID1l0nA9DnRWaqcIolg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnTOzQil92UReHhb0gH4eMPFgs6rJlBE3QQwtT5F6Is=;
 b=Ms29Y87Ds5w+gpwPBWsGbJZVCgj/r2eWUMmi0jzQZz/DP3FlwIfuLGvT93PDKS+zGw8gJcine6TppJX5JRol7tUVqttC+yp9ZGdlhD+H99YPBjXWL0+hV2tlZ5VqwjwQoK7lgF0NTEPfD0cqxq5UPIOx3AQFVU+87aD8V2uz0wwvG5rWvuEk+X5/wD3S0PugwrJs+xAd1IurvOakkVRO8zgBrF80wbTlrLZ9M6wlAT24U0pei2+j0WgkOSXuASGYUybmKQuCCyNicIFxNJzTfe8fT62n4Sa0NCx8B6M6X2HkRLNl6EuxmSqPa8GOMxQzCjOxlQ7jMg7mjfcUhK52dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnTOzQil92UReHhb0gH4eMPFgs6rJlBE3QQwtT5F6Is=;
 b=JzKjDkAPnk578MOpUAed/QUWteyrOjuRvYzCYjSZ7w0KSB7bWxFHHUKiWPvhj6iZJxdmTay5PlpAtlJnmJ9rh/lKJ40DV+YwSdZTd3Y0JS28QZ7qhMZ4G46AvPNDDo+RYs/EUc7o4HmGaktND9WNTgOs3F4XF1jINSk1IzqfDsX+DHx47YT5XJ8bc/OaMPVAB5ZgdsG5OdQHtBxkYGgWE3P7CNMufZZYWfUbbvrKo41XSAcm+w1kpCHIOQyvIpKMeEwfy3x0pngvG0p5RMDzYZcjAJqATcpZ3hv6ggj1qJ6LfsBN71DRvALpRxA7V+0X9iwtrFONXJQ+222LK67hcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9023.eurprd04.prod.outlook.com (2603:10a6:102:212::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 16:12:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 16:12:41 +0000
Date: Wed, 5 Feb 2025 11:12:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 8/9] ASoC: SOF: imx: merge imx8 and imx8ulp drivers
Message-ID: <Z6ON8WsNwZtUevKs@lizhi-Precision-Tower-5810>
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
 <20250203171808.4108-9-laurentiumihalcea111@gmail.com>
 <Z6EhvHXeNJPW1Cwh@lizhi-Precision-Tower-5810>
 <1e228234-96eb-4482-bc35-343ed42af746@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e228234-96eb-4482-bc35-343ed42af746@gmail.com>
X-ClientProxiedBy: BY5PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::43) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: f216e293-8ffa-4b72-db62-08dd45ffea52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EIO5ogY9aoJrtA1AwZruVUS3lblY0PotfM+KnNBx+bf59uGftalREwW2xB9P?=
 =?us-ascii?Q?AKNs/Hf3h8LkaPh9wVxYYG0HfFjX9fadJs92eD39WqDM3YRWeNMOLiTkyV/X?=
 =?us-ascii?Q?+aT83m6SLH/pl9DynARswbVHkAo/e8MeErp7qTVN2BV+jAmaXEQNRiuTTsS9?=
 =?us-ascii?Q?+2/RiwXImYLgxUkXdwOnPjkEAYhZMnsXIVGa1Xw9M+DwW6AY/iX+OBl0+WWX?=
 =?us-ascii?Q?XiBzPYDl8nbtktNyOsshQyJvbavo2DLjBtMJz3nrvTjEUMx0aalsrrIsq/mx?=
 =?us-ascii?Q?oIMEWPpBqDG2Ao8dAFqKmYn54B90Dl6MTOL6xIVF5ux+04w8IUQgYeoKpRYv?=
 =?us-ascii?Q?3z50jESd9Nw/NFnWSqxdUH+c61/tXnbAt2EsMMbt5DC6kv1/k3qQSycdaLHi?=
 =?us-ascii?Q?3rgu0e3RZ8FP13jYzpvH9JIS0X2dDvAt7ttcnqfwHaNpfQQlrLGQ1xB1+b8E?=
 =?us-ascii?Q?k9zvAPtBwuQNqTur/Z8eFR+h/ONx5VevhF+F6aklerbcX9s1uANtV66VM+ai?=
 =?us-ascii?Q?8502KdyoeVwoMafrB71w9PjBOUjZ65qY8hGs6X/T8VBJVueTaBSnUMlk/clm?=
 =?us-ascii?Q?zhAiegVtGjOua3xmZVW0eBeYgyR8gRVBfJM8qXYCa7ajNIccrDkEDMpEQnEs?=
 =?us-ascii?Q?kkCOAj851vy3+ZLdeFktfKd7czd6nRyQxdpLucXPg8oeq5AKG+3L0TdiAl3o?=
 =?us-ascii?Q?uRrYOV9erLX2nqkey8H2J+a9FSLZXOyb/7hSIjlxiJbG7KtOgjk+cemtbf0v?=
 =?us-ascii?Q?W7PfnnDMYSM+RoCdGIXSpNiLllb/A7ITtUxI9zme6JPFl9k2V9LwdXIWbwa4?=
 =?us-ascii?Q?ZwD4paM8U21Ddzghv5hsmBitUENmSA9RSk8qKsqcSif6bd/J6UKunI/WrDrq?=
 =?us-ascii?Q?DPRnEjMDBJJza96mF4+G02gClFm8bQGxEvf9DCB1SkVsmsHzM4dRk8ArdG2N?=
 =?us-ascii?Q?e/XuRjtA4y8snWifuFXW/lf977ecrwEDBS+cBNDl/GYs5ecJ/7unz3R3QiBh?=
 =?us-ascii?Q?bNH6T7fOVANALgxCCGxOgTer2zEBtseiemS3jZERM+CrffQ61sSOn7Kn92mq?=
 =?us-ascii?Q?S9+NgGgcUfl+1GNkVqhlY3CXMRMF2eHTK7uIsVKC2sV1scm+sGlk3xcKw7uz?=
 =?us-ascii?Q?zsXAwGF8zyoiHqUNIpQF7PpMABU1hyUYp2rgOGIrp+ZSMm/1hIq6wwJnRu51?=
 =?us-ascii?Q?8jBmjthRrFIQ+EYWk1d0jN4I3P+oGmNUyxOjpf3XW1vWrpds68zSSaxECY4y?=
 =?us-ascii?Q?Qs2QT5LIvWhkSFk8cg50gQZgZrd+wUsJs4VvpO/iK25JhJRKaMaIaCAlhXXn?=
 =?us-ascii?Q?ezg8Sswz+JtxQgR//+Ku8AhQZ/UwhCcYC19t9hZYy/4XFCkLLHddP4HDoW5e?=
 =?us-ascii?Q?xuDCcAF5zpuHwhCsGPD73+ZJoDhAbqNjXEDaePR4GnHMAkoBtyP2ciMlKdBQ?=
 =?us-ascii?Q?1kMNMGapeQlU56/zwokpOBQYmycLfo2u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JAnae4zJwNioDKQOJTQ9RowKxVRDmOvSEY8PdjrYjdLShlpYzAmvDvcFw07W?=
 =?us-ascii?Q?cRtFkjr1BMCZCfxHqEE0IcRwFklyho4iROJRiMm+R7xa5hLCSoB7fj5SUyo8?=
 =?us-ascii?Q?wkbBXD+zI0t1WshsQrwN2mfQkVbjQ5PCa6M1DCQxHdz3Vked5pOtal3lnXJx?=
 =?us-ascii?Q?A3RevzjXLvDJ1J3v6dinQf/B5WfbF7Bpre4cTX8ePNcJDRyueZoYCYcQHVrh?=
 =?us-ascii?Q?T+xcW7syOfW2RUICVTi2rlQEH5ZWrNCwL39RralDHoYrVwsJdgAVTN6dnqaL?=
 =?us-ascii?Q?YOL8LBzCGV2n93BkCl4nf8MkVlzTzyD9m7Fg2H4KijuKF9G1lGbkjP2g/cDm?=
 =?us-ascii?Q?3T1L7Gs2291h3HPGvqJ1BiPIs5BasWednX8V5wwWEUMTWYTEihBVKCRCW5oa?=
 =?us-ascii?Q?9lH3IAX/TSPwYELPA4lvs8/IEJnVWN4mD5/JgK/+PEVzQ0XkKGDRQpRRgTyJ?=
 =?us-ascii?Q?7VswT9KZL264NXvMhZ6lUqfwq2UYrv4u37zdkSVCUwx7n9ZaoazEHzD/HqcH?=
 =?us-ascii?Q?58MWmppCsAlkD8fO2G2l7d3SVIqbyUmRE3/Naidqudibr2GIbpB0RkxAose8?=
 =?us-ascii?Q?eVZLgcDNyR5dMD+frFj1LuuTQBxoLGyczYmpjt8MaNJruweiTZg41U1XLFke?=
 =?us-ascii?Q?DBbcR6aF3mZ6Vz9ghIuqGL490OZQhlumFPvv5Fqt+Q8KYhJj3NB6KmTqtgry?=
 =?us-ascii?Q?FtZUrkDKfYx4KhGtzdlQ5pdmVNUfoXFXyBJvyPxVNyUyOyiUvkDIQ3GfEVot?=
 =?us-ascii?Q?Rc67JwxACCMDFz9bFowE02g4LroSTc43w+nLuF5VMqec51r0TdRwskyfehej?=
 =?us-ascii?Q?iqrR8Ju6Wq7t/sL5g/QBH5TduIqmdCvJdGoPCfGqN+HiQE/GHCL8hEfLnmNv?=
 =?us-ascii?Q?WXz2fUrMFSC4taMaxkNCWUVyEfGdZHOjoFXcxuUQBys+dOTdneCh1Wp5uYUt?=
 =?us-ascii?Q?5gUFtP/wbZ/e/umk6g8fNt1mRG+tMdg9Awfv3177m1Wg1pCd43iDb6bs7zje?=
 =?us-ascii?Q?V0VxBuv8X5DRv7+5FWtcpfOISTECK5gPvfa/egdFTF1LVP7MWeq7+gBGUw4A?=
 =?us-ascii?Q?/MLJn+HmXwBBIv+Q+vlEoHUzXQsWCa9YiG6B5UgX2o5jw94KI9UXb+ovqw7H?=
 =?us-ascii?Q?ka3I50frfcgRwrKsDK8s7P4b5B4MWjQAjnhN4sgQbXyOct/QU2JJqSP7pBEi?=
 =?us-ascii?Q?zVLzN1occZWGeoq5Ep7Ax2HYod0FRLISNfLWn/vw8qw9mjbWZd8ugPu2Mp58?=
 =?us-ascii?Q?0T5brYZ7SJ91zCLc05tbXjhK2R+eWb2G9/VgCx1QopDsFCDlT7udAoWtrtpn?=
 =?us-ascii?Q?bI6q9ff/Q3g43dSrPc4bwK0aumEPSGTTqLpX7XSRTcyM/R7LhsjeqV1KljMA?=
 =?us-ascii?Q?XqJyxMGjEU9CD5gF5h0i5r/ssTJE44KlXGNh1C/27CTG5KN3X6lIL9yQD5+k?=
 =?us-ascii?Q?3LJ+v7DyKLIzrgX0j69uQxJnoRpyVhp4SGIugrIrONDIJdawq1vL4Exqpiw2?=
 =?us-ascii?Q?iR7cP9QnfQwOiLKH36AJMkJGnS2faCAcMnS2fiwJArZLzwhpxDMlSKxJnIjK?=
 =?us-ascii?Q?MOcEl1LMddzntVCzUmc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f216e293-8ffa-4b72-db62-08dd45ffea52
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 16:12:40.9955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvVfB0pw5vc2uB1FFNnvqLodWFO9BMmH9w0Zldc2hIcRr6Xv03uLzp28i9TogaR6J3kkDQOb/Nw9/t+VDCuHsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9023

On Tue, Feb 04, 2025 at 06:46:15PM +0200, Laurentiu Mihalcea wrote:
>
> (snip)
>
> >>  IMX_SOF_DEV_DESC(imx8, sof_imx8_machs, &imx8_chip_info, &sof_imx8_ops, imx_ops_init);
> >>  IMX_SOF_DEV_DESC(imx8x, sof_imx8_machs, &imx8x_chip_info, &sof_imx8_ops, imx_ops_init);
> >>  IMX_SOF_DEV_DESC(imx8m, sof_imx8_machs, &imx8m_chip_info, &sof_imx8_ops, imx_ops_init);
> >> +IMX_SOF_DEV_DESC(imx8ulp, sof_imx8_machs, &imx8ulp_chip_info, &sof_imx8_ops, imx_ops_init);
> >>
> >>  static const struct of_device_id sof_of_imx8_ids[] = {
> >>  	{
> >> @@ -339,6 +448,10 @@ static const struct of_device_id sof_of_imx8_ids[] = {
> >>  		.compatible = "fsl,imx8mp-dsp",
> >>  		.data = &IMX_SOF_DEV_DESC_NAME(imx8m),
> >>  	},
> >> +	{
> >> +		.compatible = "fsl,imx8ulp-dsp",
> >> +		.data = &IMX_SOF_DEV_DESC_NAME(imx8ulp),
> >> +	},
> > Can you put imx8ulp_dai into driver data to avoid of_device_is_compatible()
> > logic?
> >
> > Frank
>
> should be able to add it to "struct imx_chip_info"

Yes, you try it.  Generally if use .data, needn't check compatible in
driver. .data should include all difference formation for difference
compatible string.

Frank


>
