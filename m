Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2137.outbound.protection.outlook.com [40.107.212.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1A815A8;
	Mon, 30 Jun 2025 03:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751252621; cv=fail; b=D3j4wLSpVsoHkNUQ10qKu62oaV8XgETDOw5iCZafvp6pY1dxEuV5gJIifMH4pPjwxb9JPGXYizBhgXmYtxtsmS55He6hF3pxbjJsv+i9uJBcaMxRHvKtn+aQsl3br+XkSK3dDPHWNWQjxs1hV6GZRrNn029OxrLdqvxgQXE7Tr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751252621; c=relaxed/simple;
	bh=3Tazfi5H8RCH91PydsavtUaL8WTs6757L/Dyl2AtUDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=o2maULuXnFnCfDAEtxlDOGzfvc3/57EOXfth29vK2BpeBoMb2dcW/6lswWZ6VFv/Xj6MHODF4FDxqtBepCNUUxttueDoi+uF7cefRC9qLEu5WSidzVzIN5lIfC2NG5TEoPYAiIxGqFn1QT0LC0o17TlieUYrtsV4bYkG5CZPgEA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=monAXFw3; arc=fail smtp.client-ip=40.107.212.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="monAXFw3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LndxE7I3f3Pr/mCdPGiZC3YckBOYItLCWXJvnMaN+HAlGuEmMPyeFd8U4vdpme3gIMGfq0BN+UhQviozJN58ekXyNawOYt1Yip1kYc9Rz3lAF7g8zLGvgdxdNJZ8S0mellcPMF7XI5VgdRSGoHmArsqzI7V4MfTgylpgRswyXEu453gwSXb1w1ROE8WyXpgfyULJGHaDfnIUQC/Ul3ou6cL4AXH7l7mPbu7RsGlgE6D2ALveQudSMGbi8sgr3istgYdGBXheoGywVf6Zj5a01nn04wL1ed/EM+YsHxvZOAbPFlVqH9Dkw69A4zPazzbtOg+jeHMq0qiKVNHVfTLxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbu+FlebaWMoZzkgjR4Jox7LSZUC3SPfXAf4rifUlI4=;
 b=iMyTkv7IMwKRYvNZ+jtsG73SzggQhmGSqUZnWQBgZRLO6FeE/xv5ja3gf+YkioFs2L59C3bxYJz6fcY0pbM+HprKeFwo9PW+BgOS1fhTvtoWYxpcUYZ+tCc58jVHIg/Avxt21zbt9hYs+mv0SIz/KTTUtAgOKq8EGNVto/K4vzl+cX/CGGAqA8Fe7BBrhpnpuiF5PoJlm8HyGQHvkl+sK+wu8u3XnqNmxXfQAuVzmv91U0PP/JQTk/KFTsZNAjYQw1jnw6LpOVlOvILSBC0hm3Ea/5KkQhhBU/psW38VBycuSIzRzAmx2IaizzbO/njrraMcggIeh8DkPcym45DPzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbu+FlebaWMoZzkgjR4Jox7LSZUC3SPfXAf4rifUlI4=;
 b=monAXFw3IP5TmC5MaSePYxcfut+gsWQ6mzNW86xwxQuEdSQ3lCNJ/pScyASI93Xn0eb1O/MYUVn1Plik3BbvZkRKV3QS4tP3xBcFwn2JwXTOBTarwY1IAKpmFkZ0OQ62KoqXgS3PLIbZju4GdETNGEJhtdNHLyuhaYNF82k90IQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 LV3PR01MB8511.prod.exchangelabs.com (2603:10b6:408:1a0::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.28; Mon, 30 Jun 2025 03:03:34 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050]) by PH0PR01MB7975.prod.exchangelabs.com
 ([fe80::6926:a627:118e:8050%6]) with mapi id 15.20.8857.026; Mon, 30 Jun 2025
 03:03:34 +0000
From: Huang Shijie <shijie@os.amperecomputing.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net
Cc: patches@amperecomputing.com,
	cl@linux.com,
	yang@os.amperecomputing.com,
	akpm@linux-foundation.org,
	paulmck@kernel.org,
	rostedt@goodmis.org,
	Neeraj.Upadhyay@amd.com,
	bp@alien8.de,
	ardb@kernel.org,
	anshuman.khandual@arm.com,
	suzuki.poulose@arm.com,
	gshan@redhat.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Huang Shijie <shijie@os.amperecomputing.com>
Subject: [PATCH V5 0/2] arm64: refactor the rodata=xxx
Date: Mon, 30 Jun 2025 11:02:26 +0800
Message-Id: <20250630030228.4221-1-shijie@os.amperecomputing.com>
X-Mailer: git-send-email 2.40.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0009.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::8)
 To PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|LV3PR01MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: c91ff18d-eac8-4942-b905-08ddb782b388
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pm1dH2sxTad2jjVLnE9aWUOH9QdxHB7lKisXfKdN1vAGYTvkRm/bcEgwjHxD?=
 =?us-ascii?Q?Iuf1Xos5Upev6XAOhKe0TXsvOlaEKNvFPqejLB/JOWVNHhpOd8IwoWb09CVw?=
 =?us-ascii?Q?Wm9xJ0E0du0O/Ii4nAiXFkc7TN4IS45VAriS+JM4/hlOO547ErxYyqOpugAy?=
 =?us-ascii?Q?zkYPLGUiwi6OXahibMjDJ1iZGobhjsAb9kpWPEqPZO+12F+Bc8aoaCsNKssn?=
 =?us-ascii?Q?WSlkg4nwgNNZfHsjWYdrVGjw066nDfW0gn9WkbPOyB2FKYnOAGxqvkZpmk7v?=
 =?us-ascii?Q?n3M5TO0T7KMVyuew+t51CEhHYwrK8D5axk6wYMIOED7AfS2CZ4Q+FKgRfybM?=
 =?us-ascii?Q?Orhp1QNnEqwquDRyqEnbw2PRKUnc5oNx/aDWFDBQ6ylYEv9qw1PYagjY/is6?=
 =?us-ascii?Q?FE3SqC1z7ljMJ1FHe7QgJXTv47dPdjT3I6memppuUqyuUq0l6Ve1ubHadPWC?=
 =?us-ascii?Q?AQrAdStvp2WRAKW004tybduwAqQz8qZ7JLn+q/4ycnaa9+PNiJmXioOznUG5?=
 =?us-ascii?Q?9ncvaLNE+wkSdTzX22Vr4v6/C/4FhGor/mUe1NMggD84j5yrBKGn1Zsft6Ve?=
 =?us-ascii?Q?yeenYXmBeZwVp72IFRmsRT1clnGnjj+HXl4b0tYC9LHeuTK/4U72syIJnF4Y?=
 =?us-ascii?Q?A4LnucA2G6Re4N17f5JVzA6FNhbBma7NdHfbzB9+aVGd1ss9SyFCTU0435xE?=
 =?us-ascii?Q?kWR26jBKtMkc+rSX0qkVYg5+LgYfg6VMZrWpbAMZ/M2pdNP30wQR6DJfp4ik?=
 =?us-ascii?Q?ARRKAWww3UG4j/pOJI2v2rkxsI2EiByvzjd71U+t7DNyC4fvYVjwBU9uyJay?=
 =?us-ascii?Q?OZNbJzrtSQii9AynmtJ8sWRXeIKmnX4c2GXHERl9Mgj8xThU3sbJF+t70LBF?=
 =?us-ascii?Q?1dbo/seEqmKXJRjllMRGFjp2N5i5Hu/a8tFm9kOXsGcc/8s9d43gBhqQna/9?=
 =?us-ascii?Q?Jq/1VBlqs3TLd6XF7XO4UIE82561BfFFhcpGS4kdQbCLXg/YOtDPO9KfBAHs?=
 =?us-ascii?Q?1SZWSLQsynLJCI3GeEPSwArkryX+f8oOarHn0tePRtFs61QgsghnkBQE6OFR?=
 =?us-ascii?Q?uVwnL91twyfwCnvjen6T1pzfxIE3MA7QePvErSEo4ZeofvBbcYchJo1YESW4?=
 =?us-ascii?Q?tqW5DObIFu0xKrDvkK1m/oRw5PuRInqnPg08AsZo+lVpBtPgvgWwo2kCVrH7?=
 =?us-ascii?Q?hUquElUZ+zulOibaBRCj1FAr1w23gtd/LKpnvwbDUAewbvJ+F7EOaYmvgT/Z?=
 =?us-ascii?Q?xgf5+C0iAuibYEy2cajMk5dArH60OHTn8fQ82vFPjPxBzjeGZyb3qYX/gFwS?=
 =?us-ascii?Q?l6YMyPclDgYKZ9duhpb2wGkiq1FuM+nZ9O1O4jrie4xYmP8qKHOfZPEMq+Zi?=
 =?us-ascii?Q?4wf1CE4F1/mard1CcYXdzrh8xRZD1uvElRj5Eq1aVoT7kwYphROQ9kZj7H7P?=
 =?us-ascii?Q?Q6NP7UOaJ6EO9Qt5xFOg5WR0lQH0bW5fbhlhN3fuqNM42IZANA3gtlOzKgaX?=
 =?us-ascii?Q?6K3Xd08hprkBeug=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pmURk8ueLOnv7JZL9MvwDRdabRPaS96t4THH+AkCRmhcqhW9+IPhWphm4AVU?=
 =?us-ascii?Q?0XPEmXoEn+kCBoe+WEywBQ3kxbz//VCZ2Cid6phQBOatF/pTFzlrZdm2qt51?=
 =?us-ascii?Q?f1Fo9sVws1dblkVM4SrM8CTVBY4ClLtWQGOZV6xRSasMX7c1opHZV2qIU9xR?=
 =?us-ascii?Q?niFMYsFKFUo8w6kHYrcH7Ie8M2bq/upOFy+5s9SSDv/yK6Ikp5E7PWKw7U19?=
 =?us-ascii?Q?1/6n6IoFOVCdYnGbStZz8UQtFscA5MldeCUfoCKrofLvWhKgBtiiSqTvgkFV?=
 =?us-ascii?Q?6h4rpsMCbb1dQZrTrPZKFOrCZbGR5Zvj82ORHr/9kbWFalZceIv67xVBlveI?=
 =?us-ascii?Q?LevyKii8OdNNdugrv6/zqkiEUF7AjvNNabtObXw7A5WKkRYKgMTpyS4iG5Xu?=
 =?us-ascii?Q?NDwFx3XfYTrWkZ38n/IDZXR6yG89WDrgZT7NFSr/Rz/Crx8ibt9+KPyvfYz3?=
 =?us-ascii?Q?V2lkTvCbSVTozglROg1iJxvjP+7P3cC3+RjOngnUpfCLp4btbWI8NtvJ7Ghe?=
 =?us-ascii?Q?o7o5aRmKXuP90KUEa7NywPCkU0bMzWeddjARwlsJuajAppmscM/hkPNzUfTh?=
 =?us-ascii?Q?+x56AL04krYcROsGG/xFDB+2LcepZJ24f6xhlSTKWWkz9BRNkmYrdrIySJj+?=
 =?us-ascii?Q?AGAaneLdDO7US/m97C5IDl6vrviu6pkXFc0oAw33DFytb35ZxEHvTYVDGxQ4?=
 =?us-ascii?Q?QO0StInClV84TQy08hITivMCVfwP+geKB5LRFjlPrXgpNTOZJvLueFTrW5xD?=
 =?us-ascii?Q?sb/gQVbvTf7mTiT2yh9ezSMy3VXoOvmyZ/r1UkmsrtB212/RNU7W7L7CPfsW?=
 =?us-ascii?Q?/WL373M4jpqVq/XXVB8jzRf9M9iz8RmHpi9VWhY/pB6Ul1b1IdoUmuhIw0EI?=
 =?us-ascii?Q?qtSgiMqgjlKplN1ADFycb3Xrl8/SyBMj0TAtbCv7stWuuuRvc3XzDvXuBpNx?=
 =?us-ascii?Q?Y0LlaaqSe290JX0kWJMubYIU5ZenFlMK4FOLsME0DDqtdZ1dBWRbm08RmOOw?=
 =?us-ascii?Q?75uGUklWcWJwJk+C/depyhIAZpNMH1Epv/DXVENdnhhLO+aZ+TQJ1we3+Bdd?=
 =?us-ascii?Q?RaIO+bYoPZADYmQAXNrvdO7pyOzobnF2hbWhmu9lJ2/S5lcqOf5QLD2bZJnU?=
 =?us-ascii?Q?bxpCXD4/0F4A659TkPNPeUNwEv7aM67JFiMa5oMETi15yXOSpPo678gU5ysf?=
 =?us-ascii?Q?zbPsE8Y5KLlHk4zPUeWjgQ6MuGr/8SBvd7xtd1+pNp7Ts7ZLgjLVl76fvBNR?=
 =?us-ascii?Q?1nJ24HuIOMfA23k3rQGOmax+v2QcTHpQRcBidb/6dYXu1Kcr6gmnndOp6mxc?=
 =?us-ascii?Q?VYD2zevyxmw7rEexaHTfBUXIt4sb9uQ1d/D671N4tSTyVhoI/Q0wpUuP1aaC?=
 =?us-ascii?Q?eSHeVKjkTi2+X5qvQTpv/hAtzjAbIGSzIiJ8P4XBTJw+93lFnurU0beoBYQV?=
 =?us-ascii?Q?ByqsTZokw9WKaUG/kCdU0Qz0nZVzjZZxxT0ekwfFVlHCYIOhRHiSz927batu?=
 =?us-ascii?Q?zdunJswK0t/bLywzxOH4OjHgZMshEK6RMaX7gqLJsqgW8/HIX3bHWHjZQ/Ko?=
 =?us-ascii?Q?zr+EffKzjZVtWHhVWJ3TiusywwKgGpgGPOowZF/Ja3GePX/JReM9PXvGuNWt?=
 =?us-ascii?Q?eZF+IjLV6GZqgEHAXGAe1lA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c91ff18d-eac8-4942-b905-08ddb782b388
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 03:03:34.5632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDtgfRtj2vKyEF+MIURR+XF52VrpYxYZb9MSRFXPOz9yRVNADxaK6Xcxfebmv/v0SDBjvjxONJbD5HpSMNTub/7U4Rab7GOFw/36sYk+0X9vHkrJb1KWvA4SAap68iIc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR01MB8511

From Documentation/admin-guide/kernel-parameters.txt, we know that:
 rodata=	[KNL,EARLY]
	on	Mark read-only kernel memory as read-only (default).
	off	Leave read-only kernel memory writable for debugging.
	full	Mark read-only kernel memory and aliases as read-only
		[arm64]

So the "rodata=on" is the default.

But the current code does not follow the document, it makes "rodata=full"
as the default.

This patch set follows Anshuman Khandual's suggetions.
It makes the "rodata=on" as the default, and removes the CONFIG_RODATA_FULL_DEFAULT_ENABLED.

v5:
  Rebase this patch set with linux-next20250627

v4:
  Follows Anshuman Khandual/Ard Biesheuvel's suggetions:
  - Change commit message format.
  - Change the titile name.
  - others
  https://lists.infradead.org/pipermail/linux-arm-kernel/2024-December/985629.html

v3:
  Follows Anshuman Khandual's suggetions:
  - Merge patch 1 and patch 3 into one patch.
  - Remove patch 4
  - update comments and document.
   https://lists.infradead.org/pipermail/linux-arm-kernel/2024-December/984344.html

v2:
  Follows Will's suggetions.
  Add a new file fine-tuning-tips.rst for the expert users.
   https://lists.infradead.org/pipermail/linux-arm-kernel/2024-November/981190.html

v1:
   https://lists.infradead.org/pipermail/linux-arm-kernel/2024-October/971415.html


Huang Shijie (2):
  arm64: refactor the rodata=xxx
  arm64/Kconfig: Remove CONFIG_RODATA_FULL_DEFAULT_ENABLED

 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/arm64/Kconfig                            | 14 ----------
 arch/arm64/include/asm/setup.h                | 28 +++++++++++++++++--
 arch/arm64/mm/pageattr.c                      |  2 +-
 4 files changed, 28 insertions(+), 18 deletions(-)

-- 
2.40.1

