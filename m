Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013042.outbound.protection.outlook.com [40.107.159.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA6229B38;
	Wed, 11 Jun 2025 17:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.42
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749664788; cv=fail; b=SQXSX+eZoyYP3/QHjgKcyiho/kag2L9CV52pQIgbVpwCd9SLnxEqD7d3rKe/IBLG96fzrZRV1tpgN3iryhwUganiMqfeYB/YhiNDnzOdr2RNTvuJ3Zt6IL9p1BKupZJuO3J/pq+bCzWmsfGX/IxJ6itdC+YXcnSg8DL9VgodJcI=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749664788; c=relaxed/simple;
	bh=88clg/H4qyjYeOEMVIhJh4SMB/E2gOmc0vlZNbaY04I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hMOkKZpHBseoVTxXnpX77Hrh5LCqoUnwIMQ+jfFyp0BXNgxCEgizJ8pBqx7TokqMaCigMtnrL3MQH/0ryogK1rlHTyz1iADuyc4A0hN5M7SgBZemxTHvsEkD8u7byBI4vdlYHiQQBBjSTqvP9piZ17vg8SPpqFJ1AGRBJz/N3uQ=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qKIR1/fW; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qKIR1/fW; arc=fail smtp.client-ip=40.107.159.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qKIR1/fW";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qKIR1/fW"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=f/RlTudwYLdV0yHzUx8Eb0pqCQ3m32kxNwxNeuZ1NXfRsS3tasdcCMcu1fExkm9A5m+7KkzmgvVekJW6FUhzdhklB3HSpFyNZ0GzZKZedwPyWBiSco1Kya0orNUpext35tm5EVpH4HFGyK0XT86dIAc0/Nul4NKZeaX7KHovxTOM5vawO5Vcis2bjBn/UN+J0ixq3k5dtf/JPWJydWSyGMIIU+qhmRLAb75Rmsl0CRT2fHMDWAvWr3kWzJljgt7IESfsLR2+5F5qMmpXFJ8ljW41pK4VELOpa2mo4X+tl8q86W/rIj4jqjJ1thDRVnvevMu+DkUAN4/7E3EszJrRVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7qJdpFI5jXx+mTB1Eo3vR9cxy+Ho9BUM1R2+2Klzzc=;
 b=KvOzMUwJIkaRD5XXBzoHjZrTD/7+R0PcvBmCjZplbSrao0TnG2q8V4D4hOYcZjDu4BOoFMlImlCg/IMepdTu3uyIyPVSeBe8PAdHXLUNqdxJZ2uUEMp3GjBJSuL3TjWMwo/UaWTkaHXPOEU88Cl9DKd5EN0XsYSPcmrEfXl/WUfAPzhNEBKJN6jHl2rCDP0PeZct/bNURparohyVhQ7X04xNa+M+atM1k9jmE/8fIQvnEkR5AnKKvgHo21WNQuSVSuS8UF0Fmdo1PhlJ+qzNBfjohyffEu4WA9QSUBHZXvBplTEV1OktxN7y++h+dZ2pMfgXYOTb0KXTZs6E6yfEcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7qJdpFI5jXx+mTB1Eo3vR9cxy+Ho9BUM1R2+2Klzzc=;
 b=qKIR1/fWUBBvFmStjvPsa5Ok7RCI1NfpGqWseiGZQcRDTQXjB9JSGntJmHxHSbMpHcp9MGQ+/Ar/nKcBxFVyNY9zsP/ydhUEXPh+XPs7iPUaDXuV4gR0FgBREAGqWSw/Y6zBrndoVG3cxuuaT4/uryOToJe7FW66CmnuyBHqIzg=
Received: from PA7P264CA0480.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3dc::19)
 by AS8PR08MB5879.eurprd08.prod.outlook.com (2603:10a6:20b:293::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Wed, 11 Jun
 2025 17:59:42 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:102:3dc:cafe::a2) by PA7P264CA0480.outlook.office365.com
 (2603:10a6:102:3dc::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 17:59:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.0
 via Frontend Transport; Wed, 11 Jun 2025 17:59:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u6UtZ1+RmxWJlwccBCWq0YtThTTTZZZ+gyifvxCgSYDodAA+Ss1JKTgIcmAd6bseswJ71CA1/G+o15DFjq8TZfrOA1MQZBl+4MUIsOju4n4o1TmykH3SS5oM3IE9MGSAMGOoFFAk2474QaJT9FU8E86Pv65+ZxeXLDpkp4Mq6bQMd+XzF8EhL6OYOO9pRZM7WKSC5h1w2FzH1De7Q3UwaZST/8uXQwG/aJpfaCbMdeklofIbJKP8evmjLeTpDEdgAgFRVphw5qsSqDqSVVkN7ghEfh5wEpgUPj4ZTL2ytul4yIfwwNLy7t3otnP0WgnDuO853ZHA0dsX5paajAgY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7qJdpFI5jXx+mTB1Eo3vR9cxy+Ho9BUM1R2+2Klzzc=;
 b=xlybZ02H9lkR0HSO+mhKQxh/OOsHAR+2Qa3TzcWDhjopMF55jAGWB2QZcCJMqYonnNtKqycgALl6mfNJr7dDt6N5m8nEYN/Ez6UZ7BHflhxxGjk69L93k1IZzV1tKPqkFTP4CjtQaQus8ffTsUl1MFzUzzcMaNvG5rJIpkM2x3SaosZLbavI1NwOwwnLHO5jAhWUu2GqNe5VZ2OThYEz0TevUCc9RA5tpeZerRdLEoMxxRhKDs+pqyG2SGFe8m0nfswnuX4fJJRBA4kihashFBOg9BE7o5+tZfQOKoFMqD3Eim9kh8CpeBXZZLDe2M//vgbVmZ5UaMLpBsuTtTkNIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7qJdpFI5jXx+mTB1Eo3vR9cxy+Ho9BUM1R2+2Klzzc=;
 b=qKIR1/fWUBBvFmStjvPsa5Ok7RCI1NfpGqWseiGZQcRDTQXjB9JSGntJmHxHSbMpHcp9MGQ+/Ar/nKcBxFVyNY9zsP/ydhUEXPh+XPs7iPUaDXuV4gR0FgBREAGqWSw/Y6zBrndoVG3cxuuaT4/uryOToJe7FW66CmnuyBHqIzg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB7676.eurprd08.prod.outlook.com
 (2603:10a6:10:37f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Wed, 11 Jun
 2025 17:59:09 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 17:59:09 +0000
Date: Wed, 11 Jun 2025 18:59:05 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 2/9] arm64: report address tag when
 FEAT_MTE_TAGGED_FAR is supported
Message-ID: <aEnD6VOsz8zlQA/7@e129823.arm.com>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
 <20250611135818.31070-3-yeoreum.yun@arm.com>
 <9a78c058-2aeb-43d8-94f8-987507a1a9a3@sirena.org.uk>
 <aEmg9cNGAzqsrTd1@e129823.arm.com>
 <d93452bf-7296-47fc-9d48-44c390cb5080@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d93452bf-7296-47fc-9d48-44c390cb5080@sirena.org.uk>
X-ClientProxiedBy: MR2P264CA0169.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::8)
 To GV1PR08MB10521.eurprd08.prod.outlook.com (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|DB9PR08MB7676:EE_|AM4PEPF00025F9C:EE_|AS8PR08MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c5f66e-7c70-4044-71b7-08dda911bd95
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?RnNmQO6z4TvduXdBeQO9CBxmsBvmTEim4K5cCEDf2WyK+25VYyddeWT8oAAO?=
 =?us-ascii?Q?Dwx4FilYi1w4Wa8ABYLHtG5lToQZkCbljsq8LItBXFgklpU8ahUyCAjFDAEK?=
 =?us-ascii?Q?bMZLmKWGBMeWban5EJlEQ9Mc6cf7vTIO27ed3b9aoAjBD0KZTZbQLw6bjup2?=
 =?us-ascii?Q?oKdoliF18ktyjp0mb5dMbZ3o2EfZR4kK+X5H0OsS8ja9ZDQzJM6K2hSIIycj?=
 =?us-ascii?Q?r/oOV7/j2vz325qPbVLIq2cMPnuswATwq8lKR+ahY1hoJgJ0UFpFBLi8W5vC?=
 =?us-ascii?Q?/oacOJ0/MzazohWcAtC9mi7cOpQOo7eWRLxAxdyrQYCeY1bIgXg6uU9MbwGo?=
 =?us-ascii?Q?Xqm7nkdt9tWvicHCARecLdSCil7ZvrHK0m2i2ep81WBVX13IXVhGemPWfX04?=
 =?us-ascii?Q?Ll7qRe7p5pL6DNuJNpbGAiqoPYGpKo6qWy06/S1YcN62yKTcEIHrHArCixFE?=
 =?us-ascii?Q?FBLlD2eab5Ze+Qz2/8w3JD1YTJ7fn4uJkIVOhE3W60ndKQVRxC8Vg/AKNHLl?=
 =?us-ascii?Q?DPLPyCo6HplETdW0cdfAS4tRhHUj2EmnkrdlH4vikbTlgwPocNvOREV0ooe6?=
 =?us-ascii?Q?fx0iGpbIYrWTAZRJ94X5m+J7XP1a96v31zFdB0YW6W3CtsTx2iT5lQpezVHA?=
 =?us-ascii?Q?24pTN2w4YL0JvDSvmvFTcxAqruJkvMialZDtibDH4oF/IO8/90h9rsMSL4wv?=
 =?us-ascii?Q?1Ao4j97qQFMx10BP6mRllRxB2v/EZ7eYZLPneeUu6UYhhc1wY4eN3tDPD9n1?=
 =?us-ascii?Q?r9mWxfETIpcUHfyEszCkt6ZBtX3XlOqVPXUuf7k0q28wo0eTr3gywQqO+xjj?=
 =?us-ascii?Q?lSfT6hSZkcY+pex5XI3oLyieQhwqde7C7CBrFnD9Otz7UaNj5T7qJjHgpYYe?=
 =?us-ascii?Q?1wTv0bRw6/rRGXqybfhKcCQq1mQDrlBAFVwh4Vq2SLGQWUgwrS5eegGJIn9J?=
 =?us-ascii?Q?zUNqy/6nkbN4iIRbQd3mSATWsS0GeTnGwyz1dMa/H7p1A4s0ZAz965HSh0er?=
 =?us-ascii?Q?iy9KARD9Dp81758Gy6y7dBsPzaGpNJ0zmCvLyZiZJDDFsT7gDXfus8Xkiy2v?=
 =?us-ascii?Q?9hITs/7jrrO/Zp6xllLp9TDapIjFgxg4DP8Lji9AN5CPlusVspa4cg7ANvwZ?=
 =?us-ascii?Q?rApa0KbXEI7t6jqYBeYf3BqEwH+NtfaYtUWG5Mnvp4afQUteCfGxcHc2hYAm?=
 =?us-ascii?Q?yKX2s6qD2uQkOLy70grvvMbnx1mnfRzmbzsHvTsLnjn/MTDpabzVrTl8hSnx?=
 =?us-ascii?Q?TH6RBOSkdT3bq3K/bhSelYsEcj2rO+7LmJf4MvuA5kxQHwOki4bEHWtU1viE?=
 =?us-ascii?Q?I1mlRGx5e+xU192hV/tvcacNUhXE8V1/W0OOZ4BVJ9sbbPeW4CA1Errb5k09?=
 =?us-ascii?Q?EDdJsyMTXw9L2JOI7s8ZicmXON2zWnf5mdIwQgVotb9m9aw0JQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7676
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ad871cab-5876-4e9a-7568-08dda911aa4f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cdpYav+heSFy3EjOexvHC6x1Rjmj3Ks+81OJZSqpbSqy+RAcmXzJga0VQfnv?=
 =?us-ascii?Q?WO/Nc5l3fKPU3W28g5krCO/kldWpN7ESN3ci4QK9cefPLcA4oSbYSpuvI5eu?=
 =?us-ascii?Q?TcbJhq9QlLAiHUYkQfSCeU54LKbVSa9O4ab97R89ToBaf/dxCAVun3LfLzOV?=
 =?us-ascii?Q?1afVYC9ORMPiZedWHDm7e61pnr65zORKbP/zY/Kg1D1CsYI0ne5TGOcUQrL0?=
 =?us-ascii?Q?oOWqKkTEr6MJoIO3IguB7kMje6c4D57WPfupzcX5BmNVDedTTPfG/+5dfk9n?=
 =?us-ascii?Q?V78pSXe1ca1qpYJFqS9HEkAS4qZBuWvutAJmwvyrjRqMwf+PhjacDfZ6K/AU?=
 =?us-ascii?Q?gGzZ757arycVPB8FhqfBBFgUbk4Xt7+1KTfY1F8fC5mExNpI7YC9Imvlv+Ec?=
 =?us-ascii?Q?6BjHZExTNIen249DzsK9gGBl0MLKHC1oxFQSWSZSSOJu+CxNW4OJNwAQdw9M?=
 =?us-ascii?Q?61LHaInw4PTs2guLO0tKnFdjuxcN5xoOxSKAE+6xDasm5Xnj4Su2QCkLLwao?=
 =?us-ascii?Q?88RkkboRMDrMtXHcc7ofx0qQ3M+nJTYpoFuvgNAWL3AfwpJajzAPTrTmuGnJ?=
 =?us-ascii?Q?i8D2Nb6vyl60DVkKyl+BP4KOdHYCffLLq5eB6rGmf8DCeztqD6iWnkNWR6KG?=
 =?us-ascii?Q?WK7V4QQEXaLd3SZbKlRYG4wvGGOQuhYWAEiuGU79qYnmW4HjH5xbVdI3eaaS?=
 =?us-ascii?Q?5MVAHDDspEYF68qxHrjQyHzA0BA1ztShO/RyrqIT6+zEuCjCz8u9Q3HtOltp?=
 =?us-ascii?Q?RZINhgcoAqn8Rp9+UEItQkCNiq3VWMPG/yexAai7USC/qNExaKm6Y4VmuMLi?=
 =?us-ascii?Q?zZw3qj9QDmKwIPjYaeWgzLAt3mERSCGPkl9riqlWPYocblyiEPGUeOy4eMpF?=
 =?us-ascii?Q?SHYoVmqgpRE80vvpqP2EQJD7K9G5PAMS3l+n9AXwvkKwmuUFYoV6TuDc5jio?=
 =?us-ascii?Q?mNQjej/i+xeQPJiDs3y9GlFVOi5obwl2biF0XBKe6YGKf899ObqnIJC7G9+z?=
 =?us-ascii?Q?0uICBmjQNDEwfwRWbj8PrqRMoBJJ1yNYFprLG3z+NjrYp43rLly8XNHRZ6qX?=
 =?us-ascii?Q?Ix0A2CDsDguLxhzddlVpaFZvaCU9tVOdPHOHM12t5+zRdy6E7qje5B/urvUI?=
 =?us-ascii?Q?EewB3dccF8pY5eCahZhRiC3l4t2Qn9/8dMsjwfH7n4cubCGtO2fKLTkcpJ7m?=
 =?us-ascii?Q?aZ74JmYlKlqRhcoqQdNYfb5UCTymGySRbDLhHs3iUv5AeBaTlKfpUcoMBizi?=
 =?us-ascii?Q?p5mly+DYFNgTjcxcNWzs+1XdyWyxGVIpPCdS77C3I/PcaVWBCh94Iwe5XU+B?=
 =?us-ascii?Q?k/7wWChZK2Ixgxa8ALglA39CkWCOR2QpmkajXyJkPpgxNDZDyhJ0j/jiDkMW?=
 =?us-ascii?Q?/G8xZu5rblSmBTahG1fOYQDqG7DIWk/+wiwxUUCObV4MAmy3d4JNTImGdi4l?=
 =?us-ascii?Q?nA9kdAcxcJWeH/nr0/Bq5jGqyqnboexkz3Dh9kwOz9aotZPipy9Qwg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 17:59:41.5726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c5f66e-7c70-4044-71b7-08dda911bd95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5879

Hi Mark,

> > > On Wed, Jun 11, 2025 at 02:58:11PM +0100, Yeoreum Yun wrote:
>
> > > >  	 * The architecture specifies that bits 63:60 of FAR_EL1 are UNKNOWN
> > > >  	 * for tag check faults. Set them to corresponding bits in the untagged
> > > > -	 * address.
> > > > +	 * address if ARM64_MTE_FAR isn't supported.
> > > > +	 * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.
>
> > > Should that be "are UNKNOWN"?
>
> > Otherwise in here mentions the case when ARM64_MTE_FAR is supported,
> > So the bits 63:60 of FAR_EL1 are "not UNKNOWN" but I write it with
> > KNOWN.
>
> Ah, I see - KNOWN looks like one of the specially defined architectural
> terms from the glossary of the ARM since it's all caps but KNOWN isn't
> one of those words which was confusing me.
>
> > Do you want to change this to "not UNKNOWN"?
> > or Am I missing something?
>
> DDI0487L.a D24.2.43 does use the term "not UNKNOWN" for that case so
> that'd work like you suggest, or some other rewrite to use less formal
> terms.  Like I say it was specifically the use of caps.

Sorry to make you confused. anyway I'll use the term with not UNKNOWN
then.

Thanks

--
Sincerely,
Yeoreum Yun
