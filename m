Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5A21A23A9;
	Fri,  7 Feb 2025 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925252; cv=fail; b=XFpODnmXD2N/wQdQntSXqw19URt08mCD4SRceyg3eF+GhzObUyI9Ts89nac1hASS0b13jMlHy81RI5WomLeRDtCmM5U6LA4V5WTwc3hFLTp0g4urP/T/AQZ4SgTWFbmdgMnDEk8aKnUp59BUq+cjI1ltTvAkCMkj393hLWVBo7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925252; c=relaxed/simple;
	bh=7D2miebxBIT6q8sHGNpLMvU70E41mW7zkJcH/f6s7NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cVJFUWbcuMAx+4azhYD4jqZH9wE9DFVsXaqDtPCQCmI0f4GJNK1QadglwhM2wrl6iZaAVWY3rKphTEXrVhqdptJdh5joZJPr/M99MDQLkNn73lZR2HpPaprUuLiRUm3q2vzz7cH+pKYgbXe2A5t8REpKy3rA7cXrBWVT0ejgbgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XfU4zUB+; arc=fail smtp.client-ip=52.101.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XfU4zUB+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dN2yIBy1mxk91RQsr+edvWKwTtVZ3s1ArlCT3V+di+Pb3rT7J/iZWihEg8z89ZJNWxlQOpoZMLjEcaX7BFgwVywU6um45fYzOVEBW/tmvFBs+HbQjmTmypiGJRB8BpAJ/BOx+mRoRBE+4VVVrqfmMUH8dWXGfp9JZLOS1rJECI5vUR6BhApcyXdH2PJvQWb4dTp+djFmHrTJpNzYtgKJdQX2nulHlanTlv+GOh7TDQjjK6UxLH1sUZWVAWMtTnzUtOZxXgDRGWMPg53DPZ+R5VokpHwx0GrJu8LPWKhaTLymZLfb1LziPwtL05diRIvh98b2e0HB1U7LDJ8vU5NYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7D2miebxBIT6q8sHGNpLMvU70E41mW7zkJcH/f6s7NQ=;
 b=h6KR+xvp7hYVRbsM6LId9keUaDLOyYYjYwjZiTNhI58UnYa99HdhzLiLJqzTustqPZHQcNB/i3x5pYIHSYO/5H//0EsmGNh0OHF/WnrSDRgzm/s1rW7SaNKSIVvCfPsmsnxnYrBMels2DHMMKoqUNxkYMcQJzHhObHRap5W83Ds5a+FpqivsxmYK6VgIioaCl9lCjqSnN4LVF+5bN3Wt7X9j2eF6nMW/Aam46M8wdjzEf/z6RsprOAXa5DuFvkqY7cT/5/ANRQLXRq2ZmllLo2QJ7sJxc1hLD6MBTqWj1ecGzHF+YqdcCMRtwgYy9/YKrYauBUoXDoIOZ4XfpuzOgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7D2miebxBIT6q8sHGNpLMvU70E41mW7zkJcH/f6s7NQ=;
 b=XfU4zUB+bx6a2H5W0xn3PEX4IId80nAK00CsJTjHQMOZu+Mc33p5drr5Ai2jbRwyJH7pBA4nxfV15FWDJO158gMlgcMnFpSYJsZQesedAVTe4dX9F8ZqARK2+p4I/dI22YGhLAt56au4RJr084pqqqu8t1MTigXStqHidUb/VEK5KzugkmuhRWSUMqKJi1Z+qjzAWDy5D7J4Wdh0sK98MTEHY0SAIHytncefyCJIAEAYZiKnop5AHmo/5W+XIYeAA4GDehJ3q7A1B9r49FkX3mX2p2lnEo/KiWw9WxuC44qVDtZavVOOQbDy48dILKy8CfQGnB8FP/t84h/Mi3UieQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8491.eurprd04.prod.outlook.com (2603:10a6:102:1df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 10:47:27 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 10:47:27 +0000
Date: Fri, 7 Feb 2025 19:54:11 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 03/10] arm64: dts: imx8mn: Add i.MX8M Nano OCOTP
 disable fuse definitions
Message-ID: <20250207115411.GC14860@localhost.localdomain>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
 <20250207083616.1442887-4-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207083616.1442887-4-alexander.stein@ew.tq-group.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 9333236f-78e0-4121-2cce-08dd4764d05b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t4pGgmpAzax0UgQXr59wVjK/bPW/SGI+pUpw0FHXHRBWALQaYBL9+Q9mme8+?=
 =?us-ascii?Q?TQzxyW2aEsKEVLdfGAbQuepNN/TNlXITwNZKcXW63vnXuYV2htWPahiTmY9i?=
 =?us-ascii?Q?w9RR19m2J7sTViym5fnZBq+ogdboIbOCZ7BM+hbPBySOCq/XcPRUfVUg2Npg?=
 =?us-ascii?Q?RVaOmkqEWXgfgRtPbQRdC5dutgyMvHp24oHFZ7tbvALLyX6yNT+li9KjQeCN?=
 =?us-ascii?Q?nRT4PYe3GQpwg9TV0AD1qL6dk6j4XDQFZNUfeTbjYtmgtg/pbc9BqAZNBo/Z?=
 =?us-ascii?Q?iHceIcQ8GmuLdK+4HJycIYakoQOCXbgzg8FE12gN0fiT7/oUti0EFEZcZhKb?=
 =?us-ascii?Q?M759G+OwsS/mZLQw3aGOCedlLQ5PElkAqLY/1fvR63B2RdmlOmj6FwFYM+eV?=
 =?us-ascii?Q?vAn1s9mw2kdAZTEDAeANLrU1QCUca48Baz2wkji1djNeBqmqV19d4zAp4Ftm?=
 =?us-ascii?Q?qVsnj+6ozBe41KhaY6AyxDs2S8uqKYgY2jXEN9StxUvI3LaDoSgEInx/uukF?=
 =?us-ascii?Q?8H7IuccyqHz9N0iK6WeChAaEp7N/mTNbmAMbG0Ks7cde9fn6XZ1Ld1vlBJXC?=
 =?us-ascii?Q?z6Sd5d7H/cZFzYiFIhiv4zAQItYnI1d6sfxKkxrphZkMNstn15LEfLuKL2Fo?=
 =?us-ascii?Q?Isl7lSQanC5yhCKhZpoBy8ZtZYn1u4RVHOoW7iMMhCpQJ93ES3m9wdzTRhZF?=
 =?us-ascii?Q?LGxvNU2rClgCBNqleuzuWt9c3z+6w6A8hwGqea7LeNBUvVLQ1QVewbQwQMpE?=
 =?us-ascii?Q?TQpDkyANdG+LQWjyrdknHjgyi1Cf+eVWVh+XHDHeMQRi+in7e7GRksGnL+Hd?=
 =?us-ascii?Q?+zRC+JsJfXk6DH1XQh0B59MuB5nJ89e/wsQFZKPcvMpDCXbiFbByEVGuDNB7?=
 =?us-ascii?Q?f78HlKtsdInP/T9q+wmn8V8QcyH1cfTHu6f2Jhr3Yc49t3NfXUfXzlOpqvbk?=
 =?us-ascii?Q?JGSFO0mg54ZWxhCUkYDfnyqHbSfpV/fGxGDkq7D5o9d5mJ7dQZ58aMn77UQy?=
 =?us-ascii?Q?SVUtDqzHV5GpkNctTWu5PRYZzhJTeDXoVoflSoGjS9bBKfFJCISyyCqcQvkj?=
 =?us-ascii?Q?AFEwO+x5w/6Fn94+CL/SPH2JIfeNA3etGFtH2PlCRgacAQLY0JIRT7XwM1g6?=
 =?us-ascii?Q?QPRMqIRILD5j+3BMhPsHKsmHD14pjdfChL0X/3oyDb2JuMyuOTlhQOQuEkzu?=
 =?us-ascii?Q?gm26PWXuMaYXCpjDKbJTtVcTbWyAs2mpoAv4m4BGHB+/G2G+6UB61+0BIdE6?=
 =?us-ascii?Q?fIY1h4Rf0ByhItale0lWL8shHHvtJ+EvyuAGmA9shmrYWJKfGOC+HcqC2KoL?=
 =?us-ascii?Q?1jsxUWyqiJk0Gg7/agzGfZweczNQcrkZ54S973DD6SQf5rZpHmivqrt1OdgU?=
 =?us-ascii?Q?/Y4qFNAF0kkbJUJ0vk06+0H67jFGLtw1bD9ppArOidWX/L7mJmRuJ7yhqZBu?=
 =?us-ascii?Q?pGJ2BEzGVBvfodx0l6aPhGWuWVaAxwH8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sy0evFBktboa/ZR+kALTInBIlxeOiHd+vQ2209FRuMfBeb+kKK7md1HrDs2D?=
 =?us-ascii?Q?4udWhuANZPnFERUCXdnFEDpLCQq6OfmMJINfDOORyrAcp91e9abTrtJNL4RC?=
 =?us-ascii?Q?i2HxmldALS8/kmGbKykw3jXYI6mlMtzrmiLV5w+2LRXEn1daRMjcF5ecu+Fa?=
 =?us-ascii?Q?VnhyEK8IKGsrp+lPg7cxuUceAYm8ZHQkkzz6K/wogXV0L7AzO4Bbmix6EXzT?=
 =?us-ascii?Q?QTWatIX51GcVu5VxQf3BafmFrFiUrAu8/aBtjZL0UNP7SUtCo0KV0DFHDlGp?=
 =?us-ascii?Q?a8AUO8PpjT7FCc61YICl5r7zN4x+8kmHvX3AeUzEUFR4a/R57L5+I65apj+x?=
 =?us-ascii?Q?H5k4SuGCCy6DzsTzqRq1gy87mjreSzlwQ+8c/b2OpXk1YEE+ARBPGqOsEPpc?=
 =?us-ascii?Q?/t6KQKMWzMlE9nsTxZhbPU3OJdN+42VDWlHHSntO0mfGyLUHBgEg8k+ddkwM?=
 =?us-ascii?Q?qdMRNmthJXjLFdYrKZRaIavZacNlrISSrIr09EG8xmQ5U+acPtFYP6wj0nU2?=
 =?us-ascii?Q?4oA0tX6j/LNnIPBZwIM8F6v/kIaq885aGt5bHXAc1Cvlb/iAlBGn12hPj9+I?=
 =?us-ascii?Q?xaYGI6TJCKtkhlt46FOUVVBTvwTiOGNykTmvGRqiOJMhp+9dlMto9OAF57/f?=
 =?us-ascii?Q?jRQS72Ah0xiFCAi37kmOQirGm0xJwjg+/RVr17I/DK5keqCAvlYn7Pz0MIwj?=
 =?us-ascii?Q?8Sf2gKkZIbsZkC6g6eHqkc1Ife/4ytZsYnQvz9DQ9apcK+dVG+B7wtikH/UA?=
 =?us-ascii?Q?B/2MwNCN6XI8l1+NuLXZMUwf7s9mwe7zpBp9eFyQkpTYh9xAc6cjd0Zd0vHu?=
 =?us-ascii?Q?OU8v0Lq92daMowlUb4kQGW/7he2p861/UeXkjOXdwtTvWO3Tg7uknzTdSIIg?=
 =?us-ascii?Q?cmsZtXEx9mYJB4HbnqJsJ6vyvL16sJyWTSW6CkhqQ0VDINNYjsfEHUOF4V4+?=
 =?us-ascii?Q?R/V6EkfnBbs7Z6F0fsYkGPJ9H8VHdCL20suTcUCZqGPZ9C1lPTVSWK2S2vdl?=
 =?us-ascii?Q?Cf19NZaQr136aZaV0VBmyapjg5HMNPYI2L7hojU0+gZXj/cgBJFeBfVADuMO?=
 =?us-ascii?Q?R5kC1DZTAvD1PApUBPM4CNSJD2xq29cmkgjrpCc7Oy/yeFkJH2PKOl+38PNe?=
 =?us-ascii?Q?qG5cNXkSGJtvEgtRGydhFjSRquONwFtXwkclkws3tzqEJwidnfmnVB0ceANv?=
 =?us-ascii?Q?AfOlDEBz6K4A+aapBsja7WSu5DKi3o4zK3LtX2HQvcxPy9JveM2ATVTDR6r0?=
 =?us-ascii?Q?o9FiglZg69Nu4J3qO8GIfmm1y+JPILqKWABZ8q1uyZi7RzYr0raixy1yTqPL?=
 =?us-ascii?Q?+mlk6AzX3u4die1P5yldTIw7OWKKs4O3AdDXDxmM7KSwr0U7og9L84rDyhC+?=
 =?us-ascii?Q?yVSFVZOFbxHtuqvQUhlYtJyLYxdZlzrxYaCQWufTmh9rPz5W98/Flh93txfE?=
 =?us-ascii?Q?eWQ8/MTex3eB4H41d6hiVacgpvno0lF//kM8zuPpEGlc46CD0PSb33cJ3Uq1?=
 =?us-ascii?Q?nz2eVnbQfTfuEeaRskJk6/mYjmouRWjuQkoPk/1qk99lhau3vydpj2X5RSES?=
 =?us-ascii?Q?is1k9ZTg+NyIEG5W1eA+baHKc4YexjTYgYFywUkk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9333236f-78e0-4121-2cce-08dd4764d05b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 10:47:27.5665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VX0roLXbDaqrYmnD+5yUs8etNSPj/FBbxRtHMbMNCR5wEWwWcJoUochRtgecS5HwSwLaclefzxqjsv2LVGXdjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8491

On Fri, Feb 07, 2025 at 09:36:08AM +0100, Alexander Stein wrote:
>These definitions define the location of corresponding disable bits
>in OCOTP peripheral.
>
>Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
