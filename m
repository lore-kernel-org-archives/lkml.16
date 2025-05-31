Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2125.outbound.protection.outlook.com [40.107.223.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C5C20EB
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 02:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748659585; cv=fail; b=ClSGId7gThGVHFC/zdGFvMqOBEgFcbYegNgh6x4tEwpmQTRtGJqQONpcs4a1wbfPNF5MX1IBiCj8wXd0taLTi+3BWHKHmup7hkDr89xy+NXwC3/is4bD2MHLpZQYYOOlcJYt3pyrQQ9MIhu3/5NX4G1vfR8xsngy2lASaXZoC3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748659585; c=relaxed/simple;
	bh=62APer/11vCcYnwmOd2GVWQYl12Whta79lUzjVFsarE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JLDd4s43pgU/ws8jAY/Syqj2F9zSv7E8vYKiuxKTOLUxxVRUZJ7Z/3J5KGe01MUelkaLAiCjSCgCFr35u6czUhMwbRs1oU2lhQsZDHqMASka4OQwbOuXJT1zlCkDwFvzX1xcOXuykWTIxzChBEhol88LjqOl7AF+UuKm6vNcExY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=c9y9RJ9h; arc=fail smtp.client-ip=40.107.223.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="c9y9RJ9h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMU1lo8LTTxD1Y127ea4u2VYG2Mh6i1fjfmJ9mG9MlmNkX+7y+cVmGHv9H/i6LIO6TXL28PPp2FWc/rU16xKk5BYusX8G4T5ZnE7jk41kMDPhUmY1HEc9JwbQF/KU2VaylisQOmtpe8adCue3UnOe9SWkJTKZcAOUum+uhQSVK+8Qqtwm5OZmmPCo8NJE9PSkACmDjN+b732quV28RGs505IKCbm3Xw8rI7+zZUWaXKURwDq05k9aFPHWEs+XT3mp1KKIzwCo/NKUNnVG8iDeDhKXG8pHvacXPfi+vWxt/f/JewyVW17wOT1DGm5VwIm+2zFvVuJeK9i55Jhaa8UPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOM3Ls3n7MIJAl/Jog+tWTcFCZakeDrJw68tj5/D+Vc=;
 b=rqjhe4B2DGloGlmcyTeO6O3Xnxbc/U+CF3uYJ9QQyKOxlR8XEYor2v6uozvywIGU4OGZtdPeO1bBPpwBkR+iHAYZ96dNfyUieeENSNTA6m7n0SLT5Z1g+dPF1zz+gM3gDL9ZEObPCxAxvCdlB9fldx+h7S3U2XD/mVVsT3oYQnJSmiExyKiK4Us/qHVGsQ4T2LgsaNyRiWqjt+d3SS+kviNWPKOowjqn9f24hA/t6uNrXZMEdR2H3+4YC5ocB8fzNUuhWWwZI2gBHK0W/NaB50i1rVssTFL4JyxrF6HS0cVyRsIguuwlKY0xa75M51aWqZ3YN7/3ANlnLv03cqZCqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOM3Ls3n7MIJAl/Jog+tWTcFCZakeDrJw68tj5/D+Vc=;
 b=c9y9RJ9hUknRBLQ3cZ02PvQ9Bezoltb9XrgfozQP2qa6peUMsaVB0D/Gq/yepZWk3ZfFRvTONI6LszJcnNcef7fIVDRB0iOqOZsiatDT1NqRxUuGZ283kyasl8NwE0lBidhpHq+brbIVaZ/QIhRcxpbyeHl/9qjoC7iu1ZyY4b4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV2PR01MB7551.prod.exchangelabs.com (2603:10b6:408:17d::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.26; Sat, 31 May 2025 02:46:21 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Sat, 31 May 2025
 02:46:21 +0000
From: Yang Shi <yang@os.amperecomputing.com>
To: ryan.roberts@arm.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	Miko.Lenczewski@arm.com,
	dev.jain@arm.com,
	scott@os.amperecomputing.com,
	cl@gentwo.org
Cc: yang@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: cpufeature: add AmpereOne to BBML2 allow list
Date: Fri, 30 May 2025 19:41:51 -0700
Message-ID: <20250531024545.1101304-2-yang@os.amperecomputing.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531024545.1101304-1-yang@os.amperecomputing.com>
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR22CA0079.namprd22.prod.outlook.com
 (2603:10b6:930:80::26) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV2PR01MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: eed7c664-9a5f-46cd-ad6a-08dd9fed5356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LTua0J4o3oT6EedLalv9WuEgb8JgnrhOZ/Cn9VGsL6jGccspn/S/u/n2zu/2?=
 =?us-ascii?Q?c7Yy3oaKQFkfQ2K9v3dVNcOYKEDTeOVv1ybu8fJY9tL57ksCNJx/K64wkRUY?=
 =?us-ascii?Q?kK4r4D5+HPl4a0Xz88IMGWpzW6frbUJhXBjsYHo5x9+XjIBx2HBQN6qYQ7dU?=
 =?us-ascii?Q?sRB4k5z7C2yTzt02NzUo0ZsB/sJXxuArVbI9+kQYhEfJJpMoB/XUqzjxZhwO?=
 =?us-ascii?Q?tVcKwdotFjNm8H1lL0W2L26c1yBUWzcQ6hbI47RltHzTtpepLIQnxXyjNa6h?=
 =?us-ascii?Q?i7IYf+4H7kScp3+xhloCvfclS7Xj6HBlIxjWfE4XxDBc+z8pTpoikNSK7h4v?=
 =?us-ascii?Q?xWSjN67dKEaHv7anAG8Pd4N6EAmIqfGjvEc+a2Zk3Yg/GuFtUoKgW0M6M49J?=
 =?us-ascii?Q?y8VsG7b7SCj5n5Shsp7DjItPRRbMhIVmvh6eSof6uVypak/REbZBwKliyzgJ?=
 =?us-ascii?Q?vkmuuVaeTOVa5J8HDct1JV5pLKO1PyXzCUuQ0XD2uAW8aq6N9zK1Dq1L+rhs?=
 =?us-ascii?Q?UuIBJHrd/WaZsBDUXbOyWxLmRy0/p6IPkig8JIa5cyvsbb3olrfR0gzrUOy5?=
 =?us-ascii?Q?NWZkuhORIMC79rWxVw0qA8iJdJ0Oc8dOuSrY2xsOyIF3tqCRHbcbBvuoGbem?=
 =?us-ascii?Q?uQn4596FxGOuYap/xlLQLsorNTppVoX+gYhjZCQXcyYBJF/Epj4U1wUyDVs+?=
 =?us-ascii?Q?J0iBQ7w+X8kYZUDvHG70Z1X1BJKzb53SbMR2PIcGDmteCaxl+VkpdQpnjMbj?=
 =?us-ascii?Q?5/PnWeesztPjpI0LamKSguFOv6wzv5k6OKIpfllbz/HcR+GCh4Os9MuUMbbx?=
 =?us-ascii?Q?KLiO4lrsNf5/ER+zlT7pHU7L2s4UivcfICuQtk4oZQ/jUMa9XsNzFB/FKR0P?=
 =?us-ascii?Q?ZOVbotXKiyOOVq62BjalGkR8WqtVDXFcNYgq6zdfhLoYcfadpl78238UV/Ue?=
 =?us-ascii?Q?tCyY3VR1FHyx7g2psJ32k5lzo3oUrQb4iMdkXYjGOYSl2TnKV6lGWQUIhUpJ?=
 =?us-ascii?Q?82oqyZOCfSGcSV4tO8x7kWrtrP6ufy7mp8VUUQvYjfxENzFyB2KXPdlBwt6d?=
 =?us-ascii?Q?O6ii1wIMTWeHKx/WYB+dwhSZuK4AuzUH4Z/UG2RjsPCGdqFqjK65hGJPhKgT?=
 =?us-ascii?Q?mrJZXDNRiIdDufU4897QlOaDZz2n7pDxuzcHvuxYBfkk6Yd30JxXsWzApHkT?=
 =?us-ascii?Q?lAEkqRWBUEGN+c2QQ7QoCocogNBvCHVh584M+4w9ziXgHk9P3I1HltRJC8B8?=
 =?us-ascii?Q?ry+d15pdyLZjv30GkAOzuyrM//z+8l4gEfHK1ynsgJQoYNPtYjShvtUFeTwc?=
 =?us-ascii?Q?yVAzDdBuGUNJAKV7RlYKLw6buBDUESQoCXVIFM8AsMC/4gdzhPs1R+k0uCFy?=
 =?us-ascii?Q?BzwvoVaTG/FMx75TfC5zHLcFRAbUKB3VNrVHuUnnht0KfeTH8LPgxIakMiR7?=
 =?us-ascii?Q?EgE/2k4bKHAIS6P8McOzLLagRQzE+6s+pPeiJg5gPOXkUKmuYmyF3Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wGxSPUSaNxqpTFBr67xBNIG4AeQYK+jdxOgF91tG0BinxkXzufJQmuWXPC4/?=
 =?us-ascii?Q?JMXaNEkPc5RNKqGqhkuf+QcZ5H2Uur/e9H7Zw7XdLiYgve4C/ahfd2BgIGtY?=
 =?us-ascii?Q?TS3PuVWLnvpJMkU2VX2rQ9TMCXOEqUtz8N3Ei8XsFzDGtk9mMCmReVoM+Y/S?=
 =?us-ascii?Q?5XvWzJym5MqLUfYeX/Ngyph5wA4XTtDbSxncS1km1Q1ICe7pXZuWSOH7O8Ww?=
 =?us-ascii?Q?0A1cDIjBDQawCvuAcUX2kNwwORZlKWFX+YyJIDRVd010rmQZwHNb/stH78TX?=
 =?us-ascii?Q?ZRndijt4n6YPnpHTfDKBiYw5hB52a5eFnOMcVs1g35Fe1ZblxJHL9MCe4bfB?=
 =?us-ascii?Q?w8gH2IsgZ0N4b6yA/z64Xzhf+Fwd3Ddr0xfSyFwdwNMpoRcWSx6J8Mj6YCmf?=
 =?us-ascii?Q?ufjhYuYZJrTWWlVrI/FHoUQR2xOWWTz1SH5mWhtX8LEfjVSa2LhUZfZL91nJ?=
 =?us-ascii?Q?2zSCs9g4pNdSzKTOU+LB9GJIiCX/v5FnylAja39gh4z5MvXkPELJOBMb7eF7?=
 =?us-ascii?Q?CaJhRxgT5bEGdswTkw4KL95YCaNLBbLaY4MilDwg5Swzz4yjrIKsPJs8Bk4F?=
 =?us-ascii?Q?o9G56btMpzWYkGKR4FngO3sGW+WM6+gup9s5FH/B72xXHOaMYWuLkIwXow5Z?=
 =?us-ascii?Q?TisyKxm82v7Oni73pG0rm1QOAwr5G2CG+II2idkJzYlmWNfVZACK7lYD0Itc?=
 =?us-ascii?Q?o6E14tAksnepO4mzqpkYnJ2IypOQGi+H9U0CPXkImONS0UTxpUDd+bQ1MNvv?=
 =?us-ascii?Q?/11vxHt4RhhVOOgBX4t5/z4kxCKzBx+dh1x20hXt9N0RUpCT172M7MOedvND?=
 =?us-ascii?Q?moM3TGEpECk+pdopViBX8zHVCRWYI4lfKA4ucilwy/qMoXP6ChKVox8QKDy8?=
 =?us-ascii?Q?XHmqfsxCb9wLFuk94PHbIT/qZq8fEzK0g0M9TLu82Tq79+Fx7fN5yfYH6W1D?=
 =?us-ascii?Q?ZyYTxNZpiXGrm/dTMqpsNwVHeloU1Lf49ovvwasUBbFFmnoLJgl7G9sP2zSl?=
 =?us-ascii?Q?k1EkL8Eq/TGebSOnsJnKdMLTuj34uBDG2v3TS7dQhyaPr2nEJ7msOOuGOfkN?=
 =?us-ascii?Q?BmkUjxeWaHc8twY1gkh1H6wv7JXk5LiId5yxO+Yhy1d6SI/fzX1Yf5SHVJz6?=
 =?us-ascii?Q?U5aB2woVqopXft9zAqzj4pQ1qMMWmMU9IilRtt7Rt/Fm0wjA0sI73Rj4vKtm?=
 =?us-ascii?Q?t9qtfsr2KjenFkt6aYdoHlxLEasWlJ+MIiRp+9fyLm3kly4Icg9vFXAz1grk?=
 =?us-ascii?Q?wgqZ0pmj6Zh3njFfaDgMcbUm0fIUzKP4ZB/13Fk8H3zA7ZVUSZBXJuVf4Kvi?=
 =?us-ascii?Q?ul9wLBmRUDu128dNt4vFAokcOPuJ8NeCWOCBmmuyjcVrXl0eS6kTW3YKGeSt?=
 =?us-ascii?Q?DnvdLY9eHBz3p//8qBuVKZTFr0mA8JKUTxHoqa9YXVH21cOrIG8u6202oEEh?=
 =?us-ascii?Q?wmEy3HevoaiKZ99zhGZkrlBNA7541cnOToFxXkEryG1CTvLoV68FDHOeX3Me?=
 =?us-ascii?Q?5GuyYUqkTwYWBCOj9ygcjB+CoNB348jYHxF+b2LsCo+gxmYUWJ2qpKSJCH+g?=
 =?us-ascii?Q?OQ6FNmgBf9sn7Gd8Wr2CqqOOdhqHrwwM4Yr0aWZTK9mOt+AT/Vr/F6NmYCin?=
 =?us-ascii?Q?EfBgmyJJAHR9zZIRUSGsKmo=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eed7c664-9a5f-46cd-ad6a-08dd9fed5356
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 02:46:21.3435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QkEkHXxlaOx2aHIsu3pBe7CssTPwscKkBmwJHzv1Us82BSb9UU7EGR9lcvZHJrpVYxcg9kQFbUZFd6u3te5vGkvRRw2bQK5R5isAjjz4Uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR01MB7551

AmpereOne supports BBML2 without conflict abort, add to the allow list.

Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
---
 arch/arm64/kernel/cpufeature.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 327eeabbb449..25e1fbfab6a3 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2224,6 +2224,8 @@ static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
 	static const struct midr_range supports_bbml2_noabort_list[] = {
 		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
 		MIDR_REV_RANGE(MIDR_NEOVERSE_V3, 0, 2, 0xf),
+		MIDR_ALL_VERSIONS(MIDR_AMPERE1),
+		MIDR_ALL_VERSIONS(MIDR_AMPERE1A),
 		{}
 	};
 
-- 
2.48.1

