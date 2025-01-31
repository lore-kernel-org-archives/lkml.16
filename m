Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F059A1D5CE8
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340064; cv=fail; b=C8EUjlgzsx1f0fAIq6Idaxa7pM0dIAUwv1JtPUIG5fYy66UE2bzTZearRoYkKQ1L1IBcf4UtBpBdc8ho9kguLz4Y88CLGIiEN7kupilOqT4C7AL117bAYr+Q4NTBY95lNm+YklEO7zrHigaZq+zE6Mo4Dn56R3SZN2ecpp1Rj5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340064; c=relaxed/simple;
	bh=7jdN3/fvsbxSqdUz4WCo6Hy67d1oiyPv2qVVbeQW0tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q9P+mu/7pVc/wLKrG6Dw/agd9lU7IGJaNK+dESKtEP3cKGbDUKIA7U3qLMwoGugDkCncYyiIstKWe9B3/SwUfEZvfNsT16JU6Kf9XNLnCCPd3cabq8zm1Fnxhk4kgeTXrX6SVJ73or12F89m97W+xbxAiTssIA3mIBR8yQSd4Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KOeT0Mms reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KOeT0Mms"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCuRYAOfRuyspBjt8qHHVXJh24r67mmtCvTtDJ2LI96XK1gQ25rHifpscQ9/NJ4BeVBC1XSpYJFF96UdMT4bNuAmXpmhdrK7+bIlQZupmQaFXAV1gNDOIb1WLqSmKp6z7uUh7S76HuT9momVASyl0hZr5uiEucAKa+biAlk31yoz3HoEgQ7DLpTyWN91BQjcsC5H20+CqM/kzqDZa8E0Oqp7s3eBDXs09dQFI7UlqBSgvDyM7ryrMdcrA2YEWN0U/WRNVMk0oqLoWnQVDuPArFo2Zi0w3fo3AyZ2RArUevx38E3jxF9tzBnJCJUBQHKbgVy+9uNDBMKlXnvSmjJVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0/JFCjpepENV+wpn9shL/xlvYjLhbzy6AkrbrhP+rM=;
 b=MOSXs3848dyGrDOUyOID1OVnOQalOhYcEuFqRNc8mfMJECMjrB8leQeyZFGi3KtHVKIqsDvZzYZdbCxm2F77fqYB4iLT6GTYXpqAM1j95/liYnWaSlpAqeSvPVkE59Peg7I4Mf0SQN6SRVnSxWmK9nquC0Vsx+/lTcawyF4jHovlNDCxr0zCMXtJPEWIw0l74VqJ1eV2c28M7GrYto/lFHuLv8rh3ptFkcN0em4zIpA5SkQS8odS4uWyE3YZEf5JUFDw0w80cbViLmXrEj1Y6lfBcr1T5yvn01Kk2/8BFL4lrUjiTzldpcCcRpMeEKvNQfHV8FeTb4ISWEkv8YB3Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0/JFCjpepENV+wpn9shL/xlvYjLhbzy6AkrbrhP+rM=;
 b=KOeT0MmsfGNIYZod+dV4ATtgHqRN5nX+wmyVRyWhLZsA5gpq5GEMk+4H987bYnspjTLkyIt7EGoWXjdWkUY0+m4INXyJDd6xgLQPoolRid48LIuuHgoUzEwzf2I0FWouJeC8IQlYUFux8Wy3BRKvbW4KGG9Z+gsX7R1zQVoHWz3pELiI2I5RvqGlrABqZI2YauHExbf57vneV5K9JlRr8mE1idQ3t7ltxhLRcL6g/38jjF5tncI0GOvltcMZJgLSvd4+chmpkqnL0HshxogX3TdmWiYXybG5jdpFt1SBPPrWLC7SEuKIwRQIEuGPEirXHJoob5RQarBa2eAdfZZ0Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB7023.eurprd04.prod.outlook.com (2603:10a6:800:12f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 16:14:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 16:14:20 +0000
Date: Fri, 31 Jan 2025 11:14:14 -0500
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"moderated list:SILVACO I3C DUAL-ROLE MASTER" <linux-i3c@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: svc: Flush FIFO before sending Dynamic
 Address Assignment(DAA)
Message-ID: <Z5z21pk3M6KengFv@lizhi-Precision-Tower-5810>
References: <20250129162250.3629189-1-Frank.Li@nxp.com>
 <87bjvnz7of.fsf@bootlin.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bjvnz7of.fsf@bootlin.com>
X-ClientProxiedBy: SJ0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f2bbeb3-37b8-43fb-48d1-08dd42125150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?DT4o2YD5RKa+fdd/cncOlpTnUkcpTbuf32GdOMJz4HBMVjLgs+W/0Krdtd?=
 =?iso-8859-1?Q?EhduLS5wCAN6V6ifa8p1HtIEJTST8qPnQ88FnGGzlaY8VPq2bbHElYIBQU?=
 =?iso-8859-1?Q?Ep0VInyflxFwzG2O0tsVDmwzRNyadUM0YXdOk6nzCV/JH5c7mO6YO4PAcL?=
 =?iso-8859-1?Q?oTdHwIX7IO4suE9yOMZfhlcgD3KGcoNDn2VP4vtzkSpkHTMrrOykrEY/Rg?=
 =?iso-8859-1?Q?6w8T1Ho1h8D1qPnrsVTIpi/2kthWqSfNC82MFTvdXz/zjtyRNoIFXgIbPs?=
 =?iso-8859-1?Q?zuY5SaeaOJQX4yM7CDPMiEY4dXmJNH2ZpdSfOlG2xBajQ2L1u3qnpn23YE?=
 =?iso-8859-1?Q?/VfmlnFYru6XoJOD82Ypo/EFV0YO9Jlv6kaXsXaWW2GgGleD3ddYJx0dCm?=
 =?iso-8859-1?Q?E9zXofTRijThaylgT+25KPAiu0bj+z5P14Sv0rCKHgRYw/OufO85pnpI/b?=
 =?iso-8859-1?Q?IKO0UTiWkPUKbr/TWNsne6+ghDFUqZ8yzDJy0A6g06g9Y+BHM1Cx3/tgHy?=
 =?iso-8859-1?Q?TB6B14a8gNKXJaKyxVnkuOHgm5D9b1PsUdkKRzQn6pYhS4bR0UgRdTS7wC?=
 =?iso-8859-1?Q?aeJEYEKx76xI9QZ291qx31cHeF2rIENqAi0vxuBVQVVPit3/xCH+M9ZW0u?=
 =?iso-8859-1?Q?UiLT3Q4iZxTaSS08LrLMdS2vmMvzsp/lWmwBwPo2OM1WUJPzQ70zKOmu9+?=
 =?iso-8859-1?Q?JqHOou1GOa2j6s9TgVX9SjTQYxLbe+OhatEGD5DixhqV8+cXRTfYNKewtk?=
 =?iso-8859-1?Q?g3cwCFATL7SWH55ipgCtQ4cSl/wXrDCSUDZjMZrrHVGquSMurV7ebnSujH?=
 =?iso-8859-1?Q?HN+NL15TvV1JXYiTXfphsxID2X90Zg0GZH2Na11r9wx7+NEJl2z9UycUfE?=
 =?iso-8859-1?Q?5uOPI82KSjn+yJV2NsEaPOMo2DAiEHQYrp1S3avmsmh/nqZFIPgSCqXM+n?=
 =?iso-8859-1?Q?HM6FB15TB1HCBe476orylSd4ZPUDLo1GgfzTczEcOHu0VAeU3oGwYAqzVM?=
 =?iso-8859-1?Q?KGx4t9x0L7l0AaxkxXEXGc1J8is4M4l6457d9heQG8O29Nut/GzwBEF6+0?=
 =?iso-8859-1?Q?LD6ZlhzIlj1LWG6M0obsGLL7HTwQ+taJTs2MixBvJn/VD4+MdrUy9bSiDs?=
 =?iso-8859-1?Q?SkchIfKwxcWvWp55z61dyTkq0HQxkVNRBOQ81LTEzC6Gi/Hl2WidAF9+93?=
 =?iso-8859-1?Q?k7MdpoCv9r7YgF9+H6pDk5xG1okfpKdPVJmm8Sbx9EmlUwrq9Xy3hiSYDI?=
 =?iso-8859-1?Q?XtwrLtcVYNiJVHEXKmvUrCBtFlptHsP9Io8h6qTo0v69o74g6tV48bC0vp?=
 =?iso-8859-1?Q?cSqWI2S5zrPysuocBVV7rJ0FKaohArMrKTEARaCemjsxozJsFqTmZssGOJ?=
 =?iso-8859-1?Q?tgYHczMPz+FGu8GvrxBsCKqX8nXqYaAfNKjioHAWSkng5165Rd/5lKRwDg?=
 =?iso-8859-1?Q?4EnGo/3T1HLIjvuNI3vzseVffvQmvKlDfjQlDVUx0XzRGsrBZA6RHLnug/?=
 =?iso-8859-1?Q?wA1mToQ6OH/dFbdwwa8jsZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Lft5NDvKNvf7/I767TTx+YP+TIsAuDFihtbWbnMSd/5TotgOgKc9rZQjKl?=
 =?iso-8859-1?Q?A4eA1LNWYTbBmuzUpOnuy2KO00vzIPvtcMWFuAB+RZyqJNdzbOwXpYyPKh?=
 =?iso-8859-1?Q?so3H20BXXiSU8++EavSQV0fiWDRVZwfuXqbdNOiNtNS2MP3IqGA7EP3ZPk?=
 =?iso-8859-1?Q?8sdgCiqA63JMV/pPrhWW1dh/HOm9RngUjAoISzv5yDALNrouVMGdH1R2iL?=
 =?iso-8859-1?Q?RjbAIhKjoe6Bum/MkozUtT/ekUwVBYqwPDEgWN8vLYH6NCeSutlxe7I85x?=
 =?iso-8859-1?Q?lI0Umu4PgnqeJq/3NanEe0itWhJaEF0DzTACb9oYPoB23Glwv69I2EwvL1?=
 =?iso-8859-1?Q?txdxXNvRIqxW2hzjU6waAw3+vWIxuXk+cT7dGlwdDIQJCvc1Aih7v6iU69?=
 =?iso-8859-1?Q?6g0QMQpdZxfwUfFK8SsMZEnh56bR49i9k/N9X7mYfB+4I1V4AqB5Xu4L21?=
 =?iso-8859-1?Q?cCOiJnKXFBsYSCJIhOIihvP6Wdt7+0ZwyH4EOINGMGe1ZJNL+PMvKGqUCQ?=
 =?iso-8859-1?Q?hvPpgJYixgj9XNVg4+T1W4NVrQkxPHmzJb/1IvmZs2lHkn4Upnn+aYTiV7?=
 =?iso-8859-1?Q?GzMazaZ6RkbcY3bVWiaZPpJRZkdsprnT/O5GghVRKJh3THQHtB/C4VfjCC?=
 =?iso-8859-1?Q?aYbDAhDvp1bSj70oe28+IfEoqOACjFx6gwFxl0EVVexjCZnkoVkgBrAyiG?=
 =?iso-8859-1?Q?6G+SLY6IMetH6BL/mAajQvGhaKTXdl1ldTdIOPIb8GWzXy0ds6v4lBtPBO?=
 =?iso-8859-1?Q?RE3CE7TUpKib1xGaNdLOslW96JeSfRsQewcp+1hF2aRPnZRPqLfunBReKZ?=
 =?iso-8859-1?Q?zP/kbbrc54iL0CwStE7XM9UPSH8MdqyS7rlvfQEgm9wSUMwbfScDXv6PpE?=
 =?iso-8859-1?Q?Opu6ccCXLIRczHHou5GoxHs7VGCH/10V3ApFPnosTiCgf1ma/CV96g0xTz?=
 =?iso-8859-1?Q?Z1rNR3OXyLiDAfyVX1reUyHeu3hovMrdLBW0yh/VVd6R6Jo9OP/gUBfe9A?=
 =?iso-8859-1?Q?Dj4+xhehak1Ytwa3xsadjeMOa2sgo+gmiu8ICxz6HXEY04ndQrgUSSEhnZ?=
 =?iso-8859-1?Q?aw/4xwRHMLxQcSUNMKu5W0fK02ZGoAx2Z/g04n7HWTPuoK0bYG7fl/ohQX?=
 =?iso-8859-1?Q?XUHu/x4hA5lGfiM57QiSSX8H7hj7ZXg1Q0ojVt831mRHyXU93mlzcmYy2r?=
 =?iso-8859-1?Q?1thldb6WyR5/JZLyp+DToKx7tatq/WiH+yHPXBMbwRlxGbaZeaMzugbKt9?=
 =?iso-8859-1?Q?kfKw8F1gsYy5Oy+/H0/WuR3LiaufN6JKcLBQj1NJfVwshuOw/oq+S3quOw?=
 =?iso-8859-1?Q?MhYE23J2mU3VpCTPng2r1Bcc5ycizM70rJcXyVwfQGeRhmoKyDEJXpbYTw?=
 =?iso-8859-1?Q?gFt0Vy+KvmHA0pIv+FpdNdKsgfPCMNnbwxf1UCbTk2MVHP/IbhOPrhFL2H?=
 =?iso-8859-1?Q?lYdY0S6FkwG2e/cZ39eB0phHx8+q0d8O8tULd8wMZ9S1aMKZ6zSfLOS2Tv?=
 =?iso-8859-1?Q?1ToIOkLKOPOpZ0HvY96phduQclkkwYW0kLI7iX+n5y+WUHjGSNCL5xqBhv?=
 =?iso-8859-1?Q?BYqBCTSiGUBLwnNaeFTyZxDhgc6XxTunY8ifw2d95HLkZoX+mYPJK4Rj75?=
 =?iso-8859-1?Q?GfT68rm8CNddw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2bbeb3-37b8-43fb-48d1-08dd42125150
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:14:20.0016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v87yANaGK5zSrsUwvmkSRY7LkI70WOnh8j6Nnd1+ABMzIyiZjexcOtPyjygBbHAAZI/sNTNxQQIw/zCTXq4n1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7023

On Fri, Jan 31, 2025 at 09:52:48AM +0100, Miquel Raynal wrote:
> On 29/01/2025 at 11:22:50 -05, Frank Li <Frank.Li@nxp.com> wrote:
>
> > Ensure the FIFO is empty before issuing the DAA command to prevent
> > incorrect command data from being sent. Align with other data transfers,
> > such as svc_i3c_master_start_xfer_locked(), which flushes the FIFO before
> > sending a command.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Hotplug stress test find a wrong byte send out, this patch can resolve
> > this issue although have not identify which operation cause a byte left in
> > FIFO.
>
> That's exactly what I understood from your commit log, I have mixed
> feelings about the patch because it probably hides something bigger. Not
> that I want to break users, but there is likely something else to do to
> avoid it. Is there any chance you can check the content of the FIFO and
> warn before flushing (at least while debugging)?

Yes, it is random data. We find this problem at some month ago. Still not
identify why some data left in FIFO. Because it only one byte in FIFO, it
hard to find pattern to identify where.

Frank

>
> Anyway,
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Thanks,
> Miquèl
