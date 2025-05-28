Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013009.outbound.protection.outlook.com [40.107.162.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3885C20E011;
	Wed, 28 May 2025 15:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446336; cv=fail; b=hzbeGbPex6VF1Lxdhufbw0lcMU00Pgykt4Is7C2xHUB7POXXbrmgXAJ+AWT5Jte68O6BjsowGL4GALuZutif5e5vUMg0Vdu9bP73Dcja2U3hxKGJFq9McXZIUccklxocGzH68u0Y5ti/545wqoOaghC7AuSklmohcDtyKt+lwtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446336; c=relaxed/simple;
	bh=mgOaB/pDdyaVj1Gqsfk1pc0YlWkrptUP3P8Ea9u8zs8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eN6mGHLxj/tCRjO4VXSfBswLm2jyfkk3iaanv0WampHeGd4JQFbokJdtdzZIy7aAG5PrzmDDJsHg6WnTmX899LBr0nDnrtPN75fIaGrhLF45yPnCOWyP30GN7iWY/IBNPimP75m99J6245ICIiGxf1omDbWju0bvIPxXRkQUMac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UBIWoeq5; arc=fail smtp.client-ip=40.107.162.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UBIWoeq5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqRR8lJNzJ4HP6g1eFNXE1AfbtQYgSZ/HBoFdjlTPKXhZ9Y9i6qxqeL/ubczOe8Qjbh9X1I4UiRak6C46Zd4T47J5JmUnIeJ1Z6H2K5nIQxjFDgwpsv0Wd7FyywzSnmoxKnMLFhXSSx0J+pywfBRHTQX8pqNp6vuo0QjtEB1R2r/FWX1qb0DgbQOzj5j1/4X51aVoXUikA2O9ZlhjGgPN3o/eVLUEx3c9iUp96i0twxjngSKq1/pRf+wkmrNfpvpgT/dXxOmL1wiZ08O5srnJEou/6GtAXxquXNlpYnLrsvlPC30x4VJP1sR7F6qyYx3yDwhOD+t40611/dbOn3H0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CUYOjT4NaTAqq3UlC9Q4VuBl9A+rqQAbhEWvFEYPxM=;
 b=yp/1vSUJu0E0CeQ1MnC0uaYSynr7umG7I0tTDbl2l79g5NwQn72TK6n7AffV+XPAN3hxtxI29Rn/aOZ1AEZlg5PWtXZoxWeNwnEz9CLVAxKg523IwdeRY/KbGy7LpFsOQjvtbPqt3N1faFmd1TYdRVxqxh8x0WN8gT1KHZ0oxgb9DUkaW9UARO38ydEeXryEjrfpT5ZxgQ8cRu9asjjAd75m5L6rppCrQ/X0R5TzsLJaUFcOhihCmj+e8vHOb8axSpgkxGJkOpVoC6HUC9m3Ft8WD+AYi+NK6C46EfZHb1UTutJ3MpJIZukBH3jEPoWlvUkTmBhzaWLz24g3tsT72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CUYOjT4NaTAqq3UlC9Q4VuBl9A+rqQAbhEWvFEYPxM=;
 b=UBIWoeq5HLwE6oBaTn/nf0Aae3jMD/sIJ8cGMOn7CExUBkasA5gUbMpgOL00w3YBgj3DFk4JY0IafGYAcl6YqpxGbEkZE/IPtQ1XNJrOOFhPXMXvn+fzzT09Q7KejODNhDgL9669zDzV71bjvQ7w4AZRcSshlpzMIi3lGPdI1oSDR7DSHdYZyUexi+y14kH0G+cyow77N9Z/02jwePQNZVt4dFtwZi15Va13Ni2a9xZ6Q0UFxoHmvyvnhVRe5qqQGFOSGBAovkUIa2Q4ZAe+XuN3q4bJI8BgpnOwkWc+9ZynYxvwD5UUJTwc3dtLM8eGSRb17pykdYjk6ho6J6JaMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10959.eurprd04.prod.outlook.com (2603:10a6:10:586::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 15:32:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:32:11 +0000
Date: Wed, 28 May 2025 11:32:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: mtd: jedec,spi-nor: Add atmel,at26*
 compatible string
Message-ID: <aDcscr4pF5vC4kNq@lizhi-Precision-Tower-5810>
References: <20250523155258.546003-1-Frank.Li@nxp.com>
 <mafs0r00arpzx.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs0r00arpzx.fsf@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10959:EE_
X-MS-Office365-Filtering-Correlation-Id: fa52c1d9-0552-41eb-2617-08dd9dfcd09b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VQKrSQdSzGg73RxPVC6DIysI7ah6m7R3d1X3+LLBFruRPDnp1mCQARfiNh3z?=
 =?us-ascii?Q?QGYr9K5wAx9goF/yHL7T712fj+JnYxgc9xwi1JuO+JCIqcuhXsHXaz7sCuFU?=
 =?us-ascii?Q?yr2bDwudU06vIM0mTu9HOyl87SzN4mY1ThdXAGfZZUsK1YCTcliN8MzlGwO4?=
 =?us-ascii?Q?D5e5B8pGfTWD0oYdfrqIea7wMLKC7LDua1qwUq+Obrdv5mZkR7z6+ymnC4B7?=
 =?us-ascii?Q?WuBGvyWAdmo+QoihASthcsASaiuddnQpKjS9HGFtwkS/ZYEnIaEsUutqfDxN?=
 =?us-ascii?Q?10Q4/aeqOYIbEB/U0Eg893tZRkCOMj+8qYcjahAvFpaJOzQ42zGd8r8lJEAf?=
 =?us-ascii?Q?cBQSGCc0qNe6QKbQUENSVDhnmw4JTFyGZIQZPHeSO9NmPX1JmXdOtNCH/d+P?=
 =?us-ascii?Q?zpT9C4ScduWKTzyiLHbvBX47LShbkT3anICvd5VLF13XtHOAs/6bfqtfWrSN?=
 =?us-ascii?Q?wFdtNFmbieo8dv9zaYFSxKAh5PL/dMnIJ0qxfiAG8O2MI1uyvPBIcwGSmuHr?=
 =?us-ascii?Q?4I/PgD17XpcapzOdNMBxLt09Vu72NOfJHd/A3lVraPg3UlOZtlwQcUXfe3KW?=
 =?us-ascii?Q?dgAYlYbKYnXTUs2QECTNsFmrdxCEJERCIzKs0PzzDNuBOAv40pCGc378klXd?=
 =?us-ascii?Q?oMaIOxYpCRIbVMal4yFFglbuG4JAkqfaMa7rYskvWBZqyhnSntygdsEZ9/uC?=
 =?us-ascii?Q?KnQtq/Bhd3cWLvgDiAFSpqtJbDpqpBgTTv6aRyZyobzAZ7Vebrg11Q5Akf5O?=
 =?us-ascii?Q?+vPlgm6mYjo2dhXu4Y5pGCq8di02sAM/oC1K/O+yo2gNGUGtdAPIjj5cn/yU?=
 =?us-ascii?Q?//iajp7ij7hRyIP2JHlvLWv7vvmE1VmVCuWqMtMQPegAxEawqOXxAB0B1AWN?=
 =?us-ascii?Q?EDMfyntaXCLsAz1fMskKsiewrRV+S6ZXqn6cb1otc2/3geP+sW8HQRINiPrK?=
 =?us-ascii?Q?86EWWrSXnT4HhRbnLyltSzMOuTtoPqSmB8+YbG7gjOhOsdwj5oXKjiTCxh/N?=
 =?us-ascii?Q?rH/euLJVwKTaeSBNA3qR0OsIle1fyuP/j2S0bOples9JUesFBV3fr1LfWa0E?=
 =?us-ascii?Q?pT1LYZPRk5I7n6uEPQN3tReVUfqX/Yl5gjK2H6xztKZQWdrTvB8nOEf3vnzX?=
 =?us-ascii?Q?TrI33RNvQ+uNS1yOPRC328SV28V50DA6vy4FhKPmItgNDS0J0X+in2TxnOtn?=
 =?us-ascii?Q?wp9uPeD4c66awZqcnXGTHgvuBWDSXTLCAk1otxBJkEDlkQ5XIcIZYzuZuBzo?=
 =?us-ascii?Q?Y6Y/c0C0NwGy9kHlHCjspdzAq21NZaxJkh+PoetKo0uUVreQJ4UbQJM3EzH0?=
 =?us-ascii?Q?oykQCidAfRQlQdunEvrVyMQIKKdoNpS5qu1Lfeakc7BhJv2Wys0gtsI9iCzt?=
 =?us-ascii?Q?bdIAjgZWdJ1/j4F2tSgREuTkCUu9gD2n0a0SD8ICtO3CH0Aj+FvAZFb0IMfd?=
 =?us-ascii?Q?OaU25ywrxAJdEvKBKSN7ZNfbd+z8SuH/KmG3DXqFkmqTdpUCNsdd/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GzxVGIG9KxmdfncBH0CLSMTiKxSdi3sXDMGqD8kXD+w97vOeTx0P+ZDVsW/Q?=
 =?us-ascii?Q?AjvFkwBcfGDwMj2Q3xYyPOvq0K+eMrqDDmh48dVS0S7zjGvuV1BIinKV9OHv?=
 =?us-ascii?Q?IRqYOE6bv0uv6dHZ2YF2D8aQiNEzfy1iINl3lgxxG7R/ERjPkjBzcDrmEDe3?=
 =?us-ascii?Q?05lG883fnM0Tb667WWkK1/EaJpO8YdMQAcEnD0MFk+keJ6u/tzzlsSsWGSku?=
 =?us-ascii?Q?bXgUw5ycrdUxYPUXb9JLvRMQangETXHkOV7iER3KvpOZJnkI2Kxoi4yLlTNk?=
 =?us-ascii?Q?51UaSH1sE02s+YefVPpRHi1cVtm+CxyExjJC+GQwp6TdNzfBUzg+leKR5TvD?=
 =?us-ascii?Q?sV2hNSntz8U636jS4A+J3oyGewhAUCPhXru5cEd4jaNAoN1SNboDYskKvFkg?=
 =?us-ascii?Q?Z3wNNMOmb625IVkZizMI0O6beM9JHhP+qrvMCSYXj5ZDwKbdCREo5MUPib50?=
 =?us-ascii?Q?uTw5nzQR4okopxLXwy84c/0Oh4pDQZ1xYXX8ZDXUlQ7Ku3BAjZvJrKdxgZPJ?=
 =?us-ascii?Q?HfxwmwjqXTTa/gAfqbUNRUYzqeVwqW3Qi1p3rQwTi1rdPXCxoqoxTYgNn8HR?=
 =?us-ascii?Q?xk7ceMB79PI/iHTrBQ0UqxtZ9XV2oBvTLJLI2ctoibxA4s5j99so8BnUlE4i?=
 =?us-ascii?Q?MQxePqibKE5hBCteph89VAoTi4d7UShR9tDYY5VXewaducQiLEGjv7PbF2hm?=
 =?us-ascii?Q?v/aPrOaruVJL+AsIRhANedTFOAVuvwCv/eKsUmtTrrHLOQp8XJDFPmhR+bvU?=
 =?us-ascii?Q?ncOxAEyL8os0ryvoyrtDAZrDAjJGRBCnx6TVABO2+UebUqtvlUw9EPQbxw2Z?=
 =?us-ascii?Q?ehRwsk0N+mTVw0rpUSz+qsrf3LVgQy22pxvnmI1AIEVhbEVVmh20jPpvxuFa?=
 =?us-ascii?Q?OkgB3enVtxOR5hlBg6dtefC6b/oHfDXVDxkN2en8N8/064UMRtcskoevQSwV?=
 =?us-ascii?Q?0RcymwfqFcKalhAmfm+bkR7CzmMlT4SgrPhXSo/GUbVWKLR0fO173VAnlBfu?=
 =?us-ascii?Q?2pxOEdkvloZFzE9eJ/xqRGWr63j7kyvc7IcbUjBzVOUt4RwxZWxDmmnVRuQ6?=
 =?us-ascii?Q?QawiJZt96MOee3MslvjmdReY0+a2LgzHs1I/umMRze+ex1fESegY6ZsDQBPE?=
 =?us-ascii?Q?PXxzecBeOMpksVFMr2tx1719MS/7zCE/JVTj5hR1lzc3/+4ePnqr2rA9K/8M?=
 =?us-ascii?Q?0RPOM+F7tNwye6AYT3f9rPcijtcMuoKNPYBYPIIvYENcoaNus39OUUv6TDwp?=
 =?us-ascii?Q?UfGwjJSKbPTb1Yb3tLJ09RB5Ze1i7XanSMQHbp9fm7KCOMbJGJU9o06tMDWG?=
 =?us-ascii?Q?ybzxrmbapzK1s/V//0yEc69agX8cHYpBGRmUhSLESn49t/+K/jq97kH6Wrik?=
 =?us-ascii?Q?JEeiiLzUr3970CVZpTu8U+VVFXl5GfoA0WyS7bDP8P92G6oIqe937SqiCbeJ?=
 =?us-ascii?Q?/yzL+1w6a+G7vpLrCLyNv7GgPv84L2CVC+gM3xrAIauUipARLiTdenfrIIwG?=
 =?us-ascii?Q?kGvuAxbamCBWu8TSrI/xjkbnm97QLjUFqMDNldE8BDXZivmdW2B+g2ccN6j0?=
 =?us-ascii?Q?gZ0jKxk8el4c4RIuwjBbNOFQUHArE8q8tKGc+pSX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa52c1d9-0552-41eb-2617-08dd9dfcd09b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:32:11.5278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxjMex/Pxi5VndL1RkGgWiZFhbenXAIa2Ow2c8/6CRTaXitaHFEYUgJzvp+qd+dEy5pGd7RfdYTCIzW9e9Lvpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10959

On Tue, May 27, 2025 at 06:13:22PM +0200, Pratyush Yadav wrote:
> On Fri, May 23 2025, Frank Li wrote:
>
> > Add atmel,at26* compatible string to fix below CHECK_DTB warning:
> >
> > arch/arm/boot/dts/nxp/vf/vf610-twr.dtb: /soc/bus@40000000/spi@4002c000/at26df081a@0:
> >     failed to match any schema with compatible: ['atmel,at26df081a']
>
> Is there any problem with setting the compatible to "jedec,spi-nor" in
> the DTS instead? If not, it would better to do that instead.

I suppose it should work. But it is quite old legancy boards. I have not
board to test it.  And dt also prefer add chip specific compatible string
before common failback compatible string in case need workaround some chip
issues.

Frank

>
> [...]
>
> --
> Regards,
> Pratyush Yadav
