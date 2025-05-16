Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2054.outbound.protection.outlook.com [40.107.105.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8999F205E2F;
	Fri, 16 May 2025 03:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747365320; cv=fail; b=EChdbMIJQhedpVF+1lJr1d8PuYIJbX7VUrftoZzXGjuDSOM69L9eOXL5bVeTsJpZnmh7AAWKOp8376SfOtSWXmHkoVY/80c54ZaROlurrtSmzzjWu1cWJzjdRLNQqnOtgOIxEC4Uo7faIf4dbVpMo2j4bTFe0XpQhvglaDCLtVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747365320; c=relaxed/simple;
	bh=KPrjjInPU8x3afZ0M5BM5Mdo31durBouCg2ypcF/nTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bY8Uo7ORP0tdSHCmHo9uLwg/XtPzffZR4dFJRSvTlIta/Gt0oEEtcrGQbs6mJZKrwrC5bRXArB0/7NA7EpyT32JZao09Kag0SXM8n0XPn0bl5rEXRBZfhtq7cXSMFknwQLs8p/fQNM9jaGwEq3oLP2GE2C4DFn4D+CFj5AtzJ8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OLAaxitB; arc=fail smtp.client-ip=40.107.105.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OLAaxitB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9852X5HW8srUOoLSsEOEprCjMD5PVEbxcv02TxJwPEphroD0b1uUjg+YOTzsFiDgG4fCrxbB8jc627qdTfRf+YUHBy3IrdcWP5povfS+680wLNzOxcxooy73nKbI5+UNqSN+cfH+iDNqhUT2hzCZbbmg8SkZV4ojYjcFhPxOPuVkTqGtYvxgJf/Wc3GwFfkDApinpyhJwvMpuRBnt8EVHXbPVJLCAIqgMgdE4OcQW3clwHmDhFko27Pe1EEajqzfvbQT6e0LMmm04dYAZIKZMUQKXU2ueezoW6de9nearzVRdO3tdLmWCivba5e1MDsXctbxoDkF30yGIk+hmNEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPrjjInPU8x3afZ0M5BM5Mdo31durBouCg2ypcF/nTc=;
 b=IZPWBYIVc4AxidRC6LBWDku5H6r7hu4440ADDt2L5piFCFifdEdK/2NuO7WLvRxXVwedMzYWS1tkVBmV4UxH1LFmirhuPzOcB+JSZpX7/UR0nfZmbgJ3/EWJ5tFAilMUpOd0v/JsZZRUSpXLjvM0iXygVlT4XyoGzWWjwmMofcSVSDB+HIVP5ymfYGYmnJHPk2pl3IANuLxJWj2jM7e3U+wj/tlW/qBccUDukYpG3PV7xnGYuSPV4/hR0etCwr/8nZgIY5N9EurHQHHoXFEYkpJp4nZyO9aQ/Wb3GHkt7tIvFCFn+gZGDshot/jgeYwcN8friQKOgPxNX3LK+uxqDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPrjjInPU8x3afZ0M5BM5Mdo31durBouCg2ypcF/nTc=;
 b=OLAaxitBXjOJ7sJqljJ9K2yZC/l6NrZ/qhJRnnxsPyMWhkgIuDQCf3PS24ZRdl4TSYWQSQQj6PoVWx6xe6oI+YstcrAnX7wWZ09tTn0Dfop31EKLezdH0LEpht1bsaNbksF4hXltdIc5UjYPlEYgst30k8K72Lfql5I9ylv8+AY0USfwy+OMbCFc01XDtdeOffrxNSJTX7SY8oeNkuC01+suzEEZ1cI78cIZnA6XmIhbl7tFemMptLbnPiwXWClByGRkZVhpRbw0b54WS1AsWWTB4RxrJnBWzHalC3nBKrT9pbhDA0H6qnJMtrOCEV88cpnesGy/zlLC8fnXAeywew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10114.eurprd04.prod.outlook.com (2603:10a6:800:22d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 03:15:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 03:15:06 +0000
Date: Fri, 16 May 2025 12:24:33 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 8/9] arm64: dts: imx8mn-bsh-smm-s2-common: Increase drive
 strength of pmic irq
Message-ID: <20250516042433.GH28759@nxa18884-linux>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
 <20250514082507.1983849-9-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514082507.1983849-9-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10114:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f9a7dc5-9b7c-4319-a5ca-08dd9427db97
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2Clj/JwrGTJiTm1GAewvMClKZVAjIiLWRjFcHiH9PL4TI8I9oySJU7FiGzYA?=
 =?us-ascii?Q?mrERxNZWG+hJsNLagVfJ3ZitHwVKlQWq9MbGDYMtv1BrxgoIs1ZXbzNC4h8L?=
 =?us-ascii?Q?N4epC9UVCCZj1wQV6rWQHYaNBRm+mXG0ru1LTmc9SkQ8Va7WZyTRmVeZxUSg?=
 =?us-ascii?Q?qKuTNK2HWL69n73fSI/znuvTZgRxwYTqdtW0j3U4eF3WN2JCiaHP0pAtllzr?=
 =?us-ascii?Q?eGhB9nQEAvyzAjHOuUsaF4JOk7eOaq7WtfegNshSdf5hhaObHTE1qGlvJ5ZC?=
 =?us-ascii?Q?KEC3o6ZUXJTTvKT3Xs4ElP7V1QO00qRQkpUh96x3s4zi8pwehdRUBnY6EHAH?=
 =?us-ascii?Q?mP8FYLcAORf4DiA/YnHcdTSnQtq1nCuyHvRrymFmlUiYSqb1XLPL8q2hStuK?=
 =?us-ascii?Q?QPo7Voo7RgWPdHYRVrNb1XXdaCmb3RhslAmPX2z2HfbyV/kEfXXuVZPBRCC5?=
 =?us-ascii?Q?3lQSSC3J7wCaaK68dZd5VUE2+woDVpVcDiel9b1ondT+yqBBeQkC5uxcJSAU?=
 =?us-ascii?Q?+pTChheXWKpc//L3iuuvJuM8AcmzAPQMwKfX47ss8cWSz328uaZH7ZmI7Jff?=
 =?us-ascii?Q?VBZmYw3P60mK1y02vBbo+w0+AhFDXfBBiepHRhBgU3ccvVRvj4beSVne0lvj?=
 =?us-ascii?Q?Yc82ESRZvaVY7u8I4Y4dOtq7B5SSYHcnjzJj5z2zRvcxx0JOQq2XptIODXER?=
 =?us-ascii?Q?rueJLK0pN59A/J3BEKls+HOC21PRXhfvqC0gXA4U/1zZQ0083Vox37SKUKb5?=
 =?us-ascii?Q?iGK6MgyzfLZOXIqi0rnoR5H94K3G0Uzv4uHDZpUO8sUZwlJ6w/oUIMHFAUSk?=
 =?us-ascii?Q?BRp+IQMAQBIm5gUesoLlmtvrA4NdFTafchYcb2sCMimSJL8pEk12cyuvbzT+?=
 =?us-ascii?Q?Y+ZEArR1svXTVn9Fgf7pfuqW6nee5m3uBTnDbVfVGtAPwj7uC/+Ijz83JoRl?=
 =?us-ascii?Q?NEsEkk0FLkY6i1CCjLu22kUqkc3RrqOCgvGFUQq8bH2Rl0pVcaBFt4bUyKmb?=
 =?us-ascii?Q?3D2WyB3SpXS9ivpcawDHtJ7INSS0tFuLQa4LrSrwWRyW/CW6DtK2McGa/8z7?=
 =?us-ascii?Q?XJ4zvGBLQgWE+2YOL89HbZPSGkwbS4xqtQ+ghSfjBKhektciDhcHbYy3GgRb?=
 =?us-ascii?Q?SBKXnzrlj3vxgczGbiyj0HnxPpNiZ7fTI9arRDbGXbTTOZfjdZYMOJkEB6K3?=
 =?us-ascii?Q?/kyVxP8HSz6dJ79IZ/KbWGe8/SYWcL5qD3F5a0XhheN6/2OviQK5LcKAIqI3?=
 =?us-ascii?Q?5B6s9smdHp28JsQTyOH41tzSEm+e14B5FJuuvWBRElXRYJkj7DaLd1d0DqEZ?=
 =?us-ascii?Q?cRm3DDmj0BmIz+VLS06TSiKRMOuGLA8lw1MjmTxU1DrVek8DY4+paAog6Q9/?=
 =?us-ascii?Q?nZpI6orIOOX/pgIyj6ctbX8BNEXYQL6jgbdNagPyE6lwrXY37iGG1Uxr3wYq?=
 =?us-ascii?Q?aIHw+hN9VyP4Xu0tcmD/l2v99W7sOISGwAulz5+yaKfr2PJVOR+UCw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KlNlbWHunsXjlYZigtUC9tzjCFmoXvrjLoIoDyWfuCoR6l3ZuEgWMvihq6q8?=
 =?us-ascii?Q?oxVyErzTG8EKu0epR82vgOdAAJWtCQOZrinx5m04YGkYm/OjpqcWOL2OYzuh?=
 =?us-ascii?Q?U8haMhjLd/89xP2fFUw5IdR4MpO3adLYRQMalLqZd7iN6o1qdr44pdEWcPQj?=
 =?us-ascii?Q?MKqCUuanlzuFaLOVWJfNyXlzN9zkO1JC75/Gv8PIhbphqGWYLRLX7/Xn9l3V?=
 =?us-ascii?Q?9JNT6TIuSHc4yxqjeyUyyc+cu8ZbLiWP04MTNvqZnvAbr1gPPTlX0PigwfhD?=
 =?us-ascii?Q?hR+Ivb5i8JNQOMnaGCwZf7sMmZCmL2Ai/aTRdxVjFmqsricWVyo7Hu+0VbUx?=
 =?us-ascii?Q?qw4qXGijjwOju5o+j4Gd3C/KvsLsyZ+Jfn9TQozmXiyQ4Wk7aZBRXcR8EFtH?=
 =?us-ascii?Q?0Jf2VpmX+vuSq8UMqiWCQBrIZyj99JBpCWeLnMh/putfP3kFQ3gFsTw15pF/?=
 =?us-ascii?Q?GgN60VkNQXMktjCpj7dETLqUI0nQTNqaBsEnehng/XXBsX/0mAW/KkYUIaxs?=
 =?us-ascii?Q?Y4YPgwjBMsg/yx7EbfBrTyYR95ZUD9SXppJlYuzZDlFaccU/9MTmEQF1I6Q/?=
 =?us-ascii?Q?8HXKV+n4u+0xS9SoWHihtTaRpZ0BJAyRdrYMl7NtBlZiCdBFVi4UdBpFq4Zu?=
 =?us-ascii?Q?I6BrKq8vrPbCQm4n3kxfZUaKk3a3368MpUewh65osp5sYgYHsLkgVPmsIkHf?=
 =?us-ascii?Q?S3gpWtelYcZT21I8efNRHC98NDfZSTeIwv+LtYCIlxv9Q4icJWjGa6ZSAviE?=
 =?us-ascii?Q?tefQfDmVs9x4y9/SEGQ4+15vHt16HbbLkWo1q5N6tUEUeK6KY8dGUCUpF8oR?=
 =?us-ascii?Q?O5BgMychnJTsujrgx21t4DDht//l33+V4Z+o+p/WJPxpgvvj42hIvuG5gql0?=
 =?us-ascii?Q?UufVZBeVZypo38MDjJUX9KJg+Hbz4jbjyFm20pOZZM5uZsNy+sZlK4T1HVg6?=
 =?us-ascii?Q?Gt1JOP28uPFVMJFvvd6fL0/RMYl7k2qYg5qFWukfVsDjv+PJ57w+baRIBasS?=
 =?us-ascii?Q?jlLe3Tycg+mq1jQLMm5QaY1ZX+IZL5dX1fBBo5GPVUPh6n5nC0GMikRWF09D?=
 =?us-ascii?Q?weYC44JhIWKT+4CMdJ3/+WTM7KW14Nd5uEgoEVFsf5tvs5GT5/c2Ixo+N3Yu?=
 =?us-ascii?Q?0GhW1Jg9+uluaaYblbOl+uhtwEAYnhx/kb6NGTGLMfm1KZE+0D2ALG8LZJ4U?=
 =?us-ascii?Q?s4PURGYLT/kD9PGtCL82fAjneKt5zT9iw+AnMuM4dRxf9m4SPgAZheWBmoOX?=
 =?us-ascii?Q?UHfkFT0RO7WDfrl8Z66ZpkH1HIfeXW0941aX7PM5AWeC34mcItCFOnvmbgll?=
 =?us-ascii?Q?CIV5wUKvHKPM0jA8yASGX6A6/aI7n5c49rm6q2zYy2d8EemYG1IlKrJENCD8?=
 =?us-ascii?Q?//6+RfFQXcR/dCceK1iEpnZQOKtalASSWLXUK8dupcmfQUYeOVdFBrpV3yV4?=
 =?us-ascii?Q?V0atS1SZSwWkdKAV7EncGfF6ljW+4Y/iP/Vi8xpZ0kKzlQXC6AIfaUe6D1RS?=
 =?us-ascii?Q?QK+cBs3pjr+hH/57Vvh3XNkNaKdSUHrZTNgq+gaK20xioS3WlwdUzPqJAZRX?=
 =?us-ascii?Q?qPN9WwhUBgFSn14KKD9M2OyvXgezv0YzSdmHpq5K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f9a7dc5-9b7c-4319-a5ca-08dd9427db97
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 03:15:06.6940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ah/fLBg6iGdMZQVUBVb4U/ZEfaR3kc8lQ6jhe6zjK7ktRzCwUJjY0SZ7HD0eWzZ7k2ARjxZ6rvi5uPQaIwFmlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10114

On Wed, May 14, 2025 at 10:25:02AM +0200, Dario Binacchi wrote:
>From: Wolfgang Birkner <wolfgang.birkner@bshg.com>
>
>Increased drive strength of PMIC IRQ pin to increase reliability on the
>reference hardware.
>
>Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
>Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>---

Reviewed-by: Peng Fan <peng.fan@nxp.com>
