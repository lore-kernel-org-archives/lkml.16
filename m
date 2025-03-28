Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011037.outbound.protection.outlook.com [52.101.65.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DF123CB;
	Fri, 28 Mar 2025 15:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175644; cv=fail; b=gSJwGLeuAnArSDhatJkVoT9IFufy72uCN4EBc/2XHMp18ywoBM4PhGT+VYpzC5fi4rygJPZAjcO/OTuoJKT6+Gan/JicTn1lMFx53SPHzR2UzYxiTBZ5fI9j8JxN04LIbgmtPraFJAw62AQCs6+ZS9o0tqBKvtLSsGw+8fcebYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175644; c=relaxed/simple;
	bh=m0RXXRGE3iBAqhy+wg93DGobIdPxSDc+hZf/bcUyTjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ddz3xcJFgDSgkYfKDZVM+jqxnnkLAkwdrMcqvunqnSgpUr8ILCho99LQokc+/Y+Vo0k8lAEmlGzsZ+hU9pFOJ/yTKWL7qkhV4o/wHQUnPLXH5YnzMZ1P5cgzHyGmSmKPQiGEXPG4qjHYigE/44vaU5PSWcW5dlMp+gr4Y4IVNRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HxPDGX2k reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HxPDGX2k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zCQHzJ6rjfhTKv50rjtBJV1Ow5tXa3vHYb+Nne4wBuMOCIWfCzWcMdRc4RTaWeEcC+7KQBC8SyfPOGgfeGDmRhPtTzipKOtKZh8XKP2fUv+bSuBW7n3BFZIKagd5oA5GduamEKZzx/EoA00eSIwaADuD1qn+xbzXc73g1uN3pw0RJ8XR9I5Msv+OuzICeYdS6GrrSiYkZxYn7t3E8RfedV+2fPiOTluRm5Y+3RfsrWxBYMWsKPj7Tw5dypUVYmxa17pYxmdkQE3JfFP+AcR/fCE+Nm7V1gYBN7KjaUKpcFQWPsCf8BUrMnhcWq6CAGO8pTgxoLBVPkPTDedRQOAvsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oH/sufy3NjiowwRXnPY3ZH5vtv30xBCfzOrQ5DNiIRU=;
 b=itsAo5sYNtNQLT20/6fkZNqJKTh9HEXMSRczXvjvacNLJy1lQZWCADD97keEqtUhVfmy2DGjHdK0RNxAkbsWC0yD7dUac+yGcr7WI4wgIYZKAAPYbybYFVfqVCcsYqxaHmH3O6YoA7gZ1suck9AkX8wcsETGP7E98HUu0H2teaBGihYVAQrILa7g4T40rGn7ELfQykFUG5Kz23BpGXoenyJf4oy2YVkiX8QI8YfFES7wMqmkT1SGfEDgZ3CmDDnTkTbF3ljhzZNIONiHeGtp8zkZWXxbdFYbV088WV3+S3XWHND7EwjMduLJxHQ7wYpQuXZ54889hytiXvtZo/X9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oH/sufy3NjiowwRXnPY3ZH5vtv30xBCfzOrQ5DNiIRU=;
 b=HxPDGX2k4oeri3FGt/ZP8/4jTsCaSI316Cx9YIATXSyDdQ7kqw0OvKnvwu7q2ylSJ3OwQ4uaeqwSg1lE2+JoOnxqXSKHQWjhoDC7kUGF0JrYKhEdMYKgvkyEQYk8U1n3lXU54F5M29JyZcTUT5I6/U8C3d30ec2msP1o1NdiXcL73UaXLz5utGwhvPYxiKmytZTd2ijsISZU+35qrzOJYimg7EUeUqLCbRI4BRWl9Q4QXFz5KLV6gxtMDjU/DXpSwyVDDRBV6vKUl1RDZcBCWuFnk1vjGQMTLYYKnof/2IYf3qNfV8zCc8DMy4rAbDNRkYl+hDBp7F4MaI4xTCXAgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8237.eurprd04.prod.outlook.com (2603:10a6:102:1cc::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Fri, 28 Mar
 2025 15:27:19 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:27:19 +0000
Date: Fri, 28 Mar 2025 11:27:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 5/8] arm64: dts: freescale: add Ka-Ro Electronics
 tx8p-ml81 COMy
Message-ID: <Z+a/zwGksilJVN7/@lizhi-Precision-Tower-5810>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
 <20250327-initial_display-v3-5-4e89ea1676ab@gocontroll.com>
 <Z+V6VAZLqIPuEsmk@lizhi-Precision-Tower-5810>
 <PA4PR04MB7630DD14BB8A55B57487B790C5A02@PA4PR04MB7630.eurprd04.prod.outlook.com>
 <PA4PR04MB7630342FE066C2C45D25AD4FC5A02@PA4PR04MB7630.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PA4PR04MB7630342FE066C2C45D25AD4FC5A02@PA4PR04MB7630.eurprd04.prod.outlook.com>
X-ClientProxiedBy: BYAPR21CA0025.namprd21.prod.outlook.com
 (2603:10b6:a03:114::35) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8237:EE_
X-MS-Office365-Filtering-Correlation-Id: 791c1f6e-74f8-49bd-019b-08dd6e0d070a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?F2/oqBMI/sd8z0ghW85Mb2HekVORaRZfsne47XWYj9juWkx1pzPRUmeX3S?=
 =?iso-8859-1?Q?+1VtRBtTY0qTN41mUne7qNMmf82W+n6Jo0JNaeHbh67OUyqZVe63kVxV1K?=
 =?iso-8859-1?Q?ytjevnsHiw6aqJIlNGb82eW5dJ62Ze3NeP2Ci5ajCclhHdATW1Nzz2sxUC?=
 =?iso-8859-1?Q?hXsZ0K/fNZ6Rr2FLPKOVnuYCj4LfUjFAdXEOVpOv5jeOsv5O2yv79ECGJ+?=
 =?iso-8859-1?Q?Gyia3NmSeHqVrUp19TkdCOQXX2hGw9evIKNAmBz0NzUSvyAeQkSvj9zZLB?=
 =?iso-8859-1?Q?WkIdT7RzSwrHPOXMJZn8wd/f0xsK6Wodyx93Dgxfr+clM/RnRpV05UV74q?=
 =?iso-8859-1?Q?yn4idt6fFz8HLywR3UAjmkOEy68LuH0bwk/zcQBVYf/QWqw72vnJXpThzS?=
 =?iso-8859-1?Q?rlb2s3Xh7UFrMOgiEwWFYpW7Ht9PGWp8O+phYe2DT6EJA1pC+pCJV/RozP?=
 =?iso-8859-1?Q?ZB9M4mjkWQO8MsGWbqi3VBE/6tZ+p3sr4dNvgESOWU1YAAH4K2NgSnTBJU?=
 =?iso-8859-1?Q?SM1hHBax4D3eDY83lMZxZpFrrG2nVRm47nxU21afDG1lHlKpzjr8yhYpdO?=
 =?iso-8859-1?Q?16WuK4btkwNluL14h8oDE6yAgjP2rAMrgVYij5JE0LxuEkeS5oKOFZmPdM?=
 =?iso-8859-1?Q?ph50xDMagBlKn/1Mu4iJPRxBD9q2y067MgRiENjseIpSWeHmWT21q044zb?=
 =?iso-8859-1?Q?MHvsLO6ua3oH3Z+N4qbVYgPd7cWUWyuVgvZyaTDtWg6Izp2mQ9lSSSDgNU?=
 =?iso-8859-1?Q?xgma61QdloFmDYZHaT1JsCJI2rRpneHo7/KvVcdk1c3uaH21LJ/v46NMfm?=
 =?iso-8859-1?Q?sXh8fMtdBTap9/bkEFwMa18PSCTpDDnFLEGtamRaxpSaBB2RHrvCIoD3oz?=
 =?iso-8859-1?Q?Eyo1EQNQBokSdNk/s44fHYTJJu/+gtvdwjA56goX9ru0frpdurhH+9ezSA?=
 =?iso-8859-1?Q?YzTCjTRNJmWwVpRYsVGsVoitfx3uVEagQnywR8czFzNnaCZH3kdA6Q7gI7?=
 =?iso-8859-1?Q?3uJ8aH2i7CXBg1RpuiddHS+c573/F0ZEiSC7DRsXvRHRHmuu8yvrVf+Jt7?=
 =?iso-8859-1?Q?uskEP6iv8inBPxaMvl3grWgiYROPXsrESxldzVEivcxSXKWZ3bRW4wBBnG?=
 =?iso-8859-1?Q?IObNUaUtbYP2iWZw489iaFdmTzJM89SRwWBhN5nTaRsip+V+VJdOtsQj+l?=
 =?iso-8859-1?Q?p01uyY1b7f9jZy4IFEKNqBUj0zs2JxJObwASgRyAReMRUmldwRAUXDzSMV?=
 =?iso-8859-1?Q?3A0Lzu0Fem7PncxVSuYC0b/YzkrvfQMFZiMO/apUjuG8H212rw+9fXIhPl?=
 =?iso-8859-1?Q?pS0NE0gaMg49EQkwrkoNkkrzppN1l2cFl9YBVdOKyekzQucqc5RgujkVVZ?=
 =?iso-8859-1?Q?P3i932jZ3LIydUgz0vJFqh6tEbFOo/S1/znYetP2ZYOtFGA4hE9Mlp3EHu?=
 =?iso-8859-1?Q?87wIgqZ35nT1WZrYCQZIpksiBcBrtBd4g1Kb1jPX7lBTWlBPYLgoxretHa?=
 =?iso-8859-1?Q?zJq6e8FpGbUZg23KYs+FRC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?t/TxMXehvxL7MMl7s+de9FXRFKZlpaoGf6JNPgjfZNXOTUv1AKvUza43xr?=
 =?iso-8859-1?Q?UnEOp3fKXQ+bEs2RtwN7ZviiKhj9BTo9A4W7kYIFou0DiLwdUCkGkoImRg?=
 =?iso-8859-1?Q?SNj1Tr8yW9BhrVjPEO3k0qThPWtRhMpQV1f9rQGzoxavqd/l5aCeMFQTER?=
 =?iso-8859-1?Q?Eik6bMMVl8k7BFV2EUOcK02sLL3Lp7bq1jpO5mSU+rqCGhWNRVzLEIJraG?=
 =?iso-8859-1?Q?EMu1bBTvnlli711XaeCfwnrozv/BIGBeg0x56D6V0eJzGgqNMjuMyDmYc+?=
 =?iso-8859-1?Q?xCFFeaxMT8GlyUAqW5EciSdIgFZMlyTMk+00H7EPKkkNCw3WGYjujIxKs7?=
 =?iso-8859-1?Q?eV/B0y0hdD/g4iOScgPbDDneoZJjjOh2u/olPMlVblviC+QnDL5fgpv9hf?=
 =?iso-8859-1?Q?ZZvos7itxhOzo0bMmBjUWsoQt+0wMYqct30c0zl79E1R0oEYzJSCMgX0LJ?=
 =?iso-8859-1?Q?5nkYaNS/4udZCKqayN6msmfUntAuU19eNBp02DxXjmZkECvMQvuNaqKI+l?=
 =?iso-8859-1?Q?ErmVLKwQuW2k1/WpB/vd5YSdQ8kP/MTZQIWYbeg4uaqo3SmOdw/TMGsvbb?=
 =?iso-8859-1?Q?BI8Y6sn1UsHsp4+zjTqid1HtilgfX0wdkoh8gi7JZebwKc4tLTelkME1wn?=
 =?iso-8859-1?Q?a96OF/X/Igq5v41L+N1bhAhcGSRGCTUk2dvRsH1YhXsqCeb3UJo3U4lm1f?=
 =?iso-8859-1?Q?eiZAS98CXssGhr3iIBqyrD+IO3hSVv2YBAIodXgfOwjmuW6f6zuc1dBEpw?=
 =?iso-8859-1?Q?SaNjhI99xbqDUQhFWs0h//rmDvNWPTrGLgQ7iuQjn8ZMdAnGzy/LJy3XQ1?=
 =?iso-8859-1?Q?j5cRECnmYvUQmXlS27tKOkyheZ+XhaMRkXuBXeL+a1k+hRnExHbjkdHiCN?=
 =?iso-8859-1?Q?E0zu1aZ/mFxE0cLNYKzpzbyL6pwaBfxc8GQvWNnhYInBzX83aCbNxvUo1v?=
 =?iso-8859-1?Q?tIZ29XqOOZWPKi2t7KVDihv1HU0aNmNnT7FHDtydntXuf/j74HusAeTh+x?=
 =?iso-8859-1?Q?sSp5hfwv9zc7XWh7IokgTJ/y+8yLFZXTs9/IFVTtRT9j+UQLW9Q37gEdtn?=
 =?iso-8859-1?Q?CPUzS8Pm8Bk+z0ed8JPALVKu42pvCQPTwIVTxA48IXduKua3agUhHrr8T8?=
 =?iso-8859-1?Q?C2/pCh2+rbmSOuRsuMVdSfgQM2+ti9LyaelfMPmCs0rWaa1YeyKg5b+c0B?=
 =?iso-8859-1?Q?7y+R2itrfilrUbS0Mfu5rbs3s7sWdTz30JeV9WXQydePogaWCiQyC4Vn4e?=
 =?iso-8859-1?Q?xb9PeffuXUXKZFnnfsyKMMnkpo5rAeIsN4TkRYQv9fKWVaQPrkuuZj7g4f?=
 =?iso-8859-1?Q?Mc7tDqMgBU1Edf9qmGPPCJG8tFoTw/WJkkhytbU/Ey8UsiHBuYmA0M9Skd?=
 =?iso-8859-1?Q?C8vz/mytOncpksTUFTmyzpB/oD1xYrL7mJmbABJg1wQ/B3qa4hGZ3Xy+jG?=
 =?iso-8859-1?Q?kIPfn7GWAoogLi1W6/X6WZhPzFQ7QYKRnubBkAnFB+S4SLSKiHiE5IC/Gy?=
 =?iso-8859-1?Q?xKMB8IDx5rwyEIDn0/rC6/Zrg2PXSFGs+x0M76qc5FRfGynVWdtK2nio7i?=
 =?iso-8859-1?Q?qAik69vzkJL3iM+wfSKfLGLed2FihOpkbAEiAgtFRfZwimbPjaZ2371v3s?=
 =?iso-8859-1?Q?LD3mN1vzWDFS1WgH4UxWvuDmErfqc1fszQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791c1f6e-74f8-49bd-019b-08dd6e0d070a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 15:27:18.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gp+3I3d14tlXxFYE6mVpakmTHHZV3V+prblt0ucp8xABVEjWqEKX9HIKJJPEIoFsgBtnu4Y9gETn40YStu2sVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8237

On Fri, Mar 28, 2025 at 10:43:44AM +0000, Maud Spierings | GOcontroll wrote:
> From: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
> Sent: Friday, March 28, 2025 8:20 AM
>
> > From: Frank Li <Frank.li@nxp.com>
> > Sent: Thursday, March 27, 2025 5:18 PM
> >
> >> On Thu, Mar 27, 2025 at 04:52:40PM +0100, Maud Spierings via B4 Relay wrote:
> >>> From: Maud Spierings <maudspierings@gocontroll.com>
> >>>
> >>> The Ka-Ro Electronics tx8p-ml81 is a COM based on the imx8mp SOC. It has
> >>> 2 GB or ram and 8 GB of eMMC storage on board.
> >>>
> >>> Add it to enable boards based on this Module
> >>>
> >>> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> >>> ---
> >>>  .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 549 +++++++++++++++++++++
> >>>  1 file changed, 549 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
> >>> new file mode 100644
> >>> index 0000000000000000000000000000000000000000..9c4304e909b96afeb62962198da377319eda8506
> >>> --- /dev/null
> >>
> >> New dts files, suggest run https://github.com/lznuaa/dt-format to make
> >> nodes and property ordered.
> >
> > Ah I didn't know there is a tool for that, never seen it before, will
> > check it out.
>
> I checked it out but I have one question, this tool orders all nodes
> alphabetically, which is correct. But from what I've seen all imx
> devicetrees have the iomuxc node at the bottom, regardless whether it
> should be there alphabetically. Should I still keep the iomuxc node at the
> bottom?

Old dts iomux is bottom. But I think there should not such requirement now.

Frank

>
> Kind regards,
> Maud
