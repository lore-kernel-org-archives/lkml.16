Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B5A253931
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.59
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464960; cv=fail; b=Gq9TGmoMAf6uO7awn80TPrgzh3onzKBG6larrL+g9ZWTLYctlFd4sJ9j6mJR/FGglsyuOeyjJLe/xUhCH/lp18Gu4J/pu9t/XVe3uJzcwiQaSEjpX2FL3BPzDN//UD3VBzWdqysmVi39i3FA39BYIvozEJC0eHJZKSuaUERQ8eg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464960; c=relaxed/simple;
	bh=Xf1mpe9poCwzJLj00bWGouyDYjBhxcP0pru+sy8K0rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ml6mDDnXSs7GHeQbBsNH6lOoeWQW4lqVkE6P6w++DySE10aW6Op4MRDNitnKcRVbTT8ZeR/r0Qg1dxZVXMrBlO9zTTTZ/4tf8kEDOaIAQPEeOlM00EBeSC/y1nEStP09fYXr6VN84xAUULBrbKlTld8V5Qm57JaXDmWU7TU0aII=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fCNvvcrl; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fCNvvcrl; arc=fail smtp.client-ip=52.101.70.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fCNvvcrl";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fCNvvcrl"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vM/hIAKAs36pGmYsBzp/HIheqBvXYvZ+VDIfwx85hXLt/R2jnHA324hXxwMDBBYiXx0CMHs7MFOw2Ss4v2zql+48i6mj6EEaPy/6DpywFBBwkwgCL0vA0QhiwfyefGLqwV8BJk/2rKq9jaCEy7C2NcBJAO13HDU6qrE2wE7dNj9TU3qFvMgQMrvx7f/ctofwk138I0a+Jd2d8LyJJCU74si7V8GN7Dd1LkX4sJosrdtfdZh6bwMy0fCcsh4kDMaw8jNW4vHCDck8mKYSKae0kJ6DTaC34Zg2q4mF5Kq+pawZXoYNO38j1ZlpphKxcTgZaDGbX6cPeQ/elhsA/8zU3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4b3NfUHPrd8EJwzECrK5TN8xM34MJ9WnSF5VX+qeIu4=;
 b=Z+WEypQhQUzmc4XWmruR899i2diRoXIw7IkRDw2tlMuLeMXT47/i+h1FRrXhEl9COWWKfmdY+rMisyfo+VuWvmE89tfsQjxIb5eGwLneVGaizmy5bXxrw7JvAc3DlgqaHM8J7iWS6Bja1EBPwumYhqHBsV4XmVjK9cV/1SlxSvmqncF3G9BiANndI7Y4FjZ0ofNDZD/DO2lek6hjrO4fkxEYHgvpsIur9sc1suDe1SUmL4b5omt2FFPWMLhgNw7vn/Rtzk2bG+kx8lZLNMbtR4skPuFUXyA9aI+ajJkbEtEwAwHGIuraX14IF/aObZY2mWVPOix/3zsZK3LvvYzC8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4b3NfUHPrd8EJwzECrK5TN8xM34MJ9WnSF5VX+qeIu4=;
 b=fCNvvcrlwKmyCwtEBHp0z2eKyq+yGxVu6G1t+2gSKXux2I42imoPQ2hd7nvStlzNaX6jJ4AYrxGLOw8IUXa90MAreRYCsLJ6xNQ2XKnSvfw9JDj3AkfwiGZ6uozd8Vq/SUWsHTlnVBq9O5K//4VSNCX0z01H5QehCBDVgL7xQSQ=
Received: from AS4P195CA0011.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::15)
 by PAWPR08MB10058.eurprd08.prod.outlook.com (2603:10a6:102:35f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 9 Jun
 2025 10:29:13 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::31) by AS4P195CA0011.outlook.office365.com
 (2603:10a6:20b:5e2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 10:29:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 10:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsXy8jhmWHX25XrlORgt/WStwINFFMERc9r0epeVMSaU/x+ILoetbnep0gkqzGzLh6mT0m2NlP2YtpTZzzsaYj6sJfPqMTO6hyyC3oZZNg3fmlId9bgVk+7K8DPGvN7dU4B9W0nJG9K+VkOR0VR/wEzIApCTBdGtI3+XMtIF2JiWT/DzZ77Wni59tnJ0WnSHx8FRBI7Jcf8Vd8Ns0T254uVx79YhdvKbY5PzfHUu2e/EhfBQI+rBdnFTfQbvzavEzCgT8iDaorjHCTgiDajOwQ0Wt0Fw0F3N+T4G7z2z0RgDHp7NLy95cuC0lWxu2olqhEP+9YeFRLSeS3t9lOhF9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4b3NfUHPrd8EJwzECrK5TN8xM34MJ9WnSF5VX+qeIu4=;
 b=f7KNU7k851mhvzh8yrtpzbwXW2hFXbiP7fQm7KqdCXbUsJIOChiLqgsn8dR8aR0qM0nSsSV1wIrhzfCB34vhWHVILlmdnwvpgsdr5oNSzwcwK8XRJlgGJ8rwIwpgmLOaMhubXotYdjV2K4ksQCk0fUzm0d32nhKu/vrcFscWU2zEuX7NHgHQ5J2bt0EWxMt1fjREhexL/kZiYSwqlXjkmkLw9t9rdXr8MTqPS4Lz/oBd2pt03lPLjZT+M4eyQQkcVsdK41vyjd5TkwJmRloMjrMjJiwks1pbOwWbT3DSWGxy96SYn2hsd9yxCnUxkGUzrXoYkfNZrxbprSfAXZlrfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4b3NfUHPrd8EJwzECrK5TN8xM34MJ9WnSF5VX+qeIu4=;
 b=fCNvvcrlwKmyCwtEBHp0z2eKyq+yGxVu6G1t+2gSKXux2I42imoPQ2hd7nvStlzNaX6jJ4AYrxGLOw8IUXa90MAreRYCsLJ6xNQ2XKnSvfw9JDj3AkfwiGZ6uozd8Vq/SUWsHTlnVBq9O5K//4VSNCX0z01H5QehCBDVgL7xQSQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV1PR08MB7377.eurprd08.prod.outlook.com
 (2603:10a6:150:21::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 10:28:39 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 10:28:39 +0000
Date: Mon, 9 Jun 2025 11:28:37 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Marc Zyngier <maz@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: trbe: Add ISB after TRBLIMITR write
Message-ID: <aEa3VRQtymgBpdzo@e129823.arm.com>
References: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-james-cs-trblimitr-isb-v1-1-3a2aa4ee6770@linaro.org>
X-ClientProxiedBy: LO4P265CA0211.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::7) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|GV1PR08MB7377:EE_|AM3PEPF0000A79B:EE_|PAWPR08MB10058:EE_
X-MS-Office365-Filtering-Correlation-Id: f61324bd-2f08-4976-1fb7-08dda74079b5
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?8SnRQC3IhdVVJPFrCDs2xM3bt4IRKWWcR42a/5JBE/c4dyXAAxLXp2MgsWab?=
 =?us-ascii?Q?WhyQB2PH8pDlvuXpjqFqAY1M56l/A75NIZuMusZSW5LbEcCBdZCDOcrT8Ikk?=
 =?us-ascii?Q?waY+sD+Gtj43AKbw93LgXS2DkcOSOQ/LdblEtIlfoK5a8vevDXxDOBjJssO2?=
 =?us-ascii?Q?A+9cmUn6lLk+d5fB9WG5e+dfmG60+SXwkUGN4IsU2Z2F7Fs1HPk57txZmhdG?=
 =?us-ascii?Q?dmbXOaantkdN+tT4DjM4uqWqk40ltXHcr4q+alJ0RkptqxG+CJAt+a/gdGHq?=
 =?us-ascii?Q?sSi6pD6roucr7F+p+t7kcRseyAFsR4Vf9Obv/djUdG1b5tgV07mFewKXT8f4?=
 =?us-ascii?Q?Wpb/bsvlF1uA3XKSJgxKIJnNRooqFpqWq783Jy5B7H3A7Agc0tP+FWLvFjaa?=
 =?us-ascii?Q?SDMShDIIh7EodLE7XnPj4kIiDYTBJpgnwz1+DYo0JSyj128V7KpsXB8Vw/ht?=
 =?us-ascii?Q?v3CQOrWxKWP+szpzrJkltrlb3ZsK1tAB2AYnHeJ64OpCHWEBfpZCxkhVaPdH?=
 =?us-ascii?Q?2gAxdWIEFMbFIQ7Vl7dJbSM9QuTsHb3vE19EjOWqeuqrpXSmDHFQO1tfx2eH?=
 =?us-ascii?Q?7Lbgh+iOEQbaqkrN+hSG+K8RAytXbJszSglAjO2u5EbIGI1rp87GpOaZBJpV?=
 =?us-ascii?Q?QJ0GgPVnJ9pOlUxdA81g1UKQ9QzDXWfJQmYN4oKEyaQlgluNYa7x97HGYfp8?=
 =?us-ascii?Q?ryLjsJLSHY2oHuEtpg8rCWLu8HK180W2UfaMXe2r/I5s+6if97Wz2UuQKjmx?=
 =?us-ascii?Q?q8AAoVMF7irGFFS+cz9Taeee31hfg9sTj0rTz1GzD9pN/fM6L0pA1dIfJ0V6?=
 =?us-ascii?Q?sBdPL5+AxjreMKZDFe6ctYw/FilXmv2P7teIXjJUA6Xd55Emm4yPhJ1JrhiM?=
 =?us-ascii?Q?UNTdw0DyaiAB8f8biNWyIAWTfJq7vrq3qEaiHeGErAZTivpTJn1jqEClm9AR?=
 =?us-ascii?Q?1w2rHdjxRDJ2PLpVL4I8IAqc71RuMnvFdClOJcyJSxPg9crYbxNMddK8ybDy?=
 =?us-ascii?Q?chg661Mz+7DczaD1ByEbKXMDE2ownEuQfxGa1MZRVpOqQQUqAYwEQgtnWOqc?=
 =?us-ascii?Q?tEB4lhqwRlD79AiBM7SHqwDxDOuRwKBpo3Vn08kEyVdLBRTx/dJn0/ojJC5V?=
 =?us-ascii?Q?wgC9k22Cyn+rgoTtMp7QMPHrN5tq23rMN9BJMj9w4A/71ZSRT37GzN/pXVHD?=
 =?us-ascii?Q?iib8BglWo0Rv4gtRrONiwO8G5iRqpgPcsDLjnHVL3qtWo1VUOIu/hpsiqSM0?=
 =?us-ascii?Q?mpA9gyr66DHbd0wiyFK3O27w6tRwJ3aGsM4yPui3IGx4v7JkstR9VplTOSSS?=
 =?us-ascii?Q?O19kYSbgfX3UFbHhemN1XGcsNuZK3L5nupPNNv6jEeobSXnceAIPCCdjdevg?=
 =?us-ascii?Q?56Ob/D5cgnusncuD0trX2ot7dfDCSogshhNItT2aaVTbyEMvmYBlAhZDUK/f?=
 =?us-ascii?Q?onxy3Skmfq4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7377
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	96b34d1b-cbdf-49a9-b954-08dda740666d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|36860700013|376014|35042699022|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UZlS7XWNVmvQ9exgA9aeg3ertR2mRwXH4DD2C13SlFfmXmPiYNoZl6/NPAWk?=
 =?us-ascii?Q?GmA61rcjd3wxU4++5babThygNjB9BDdM2wAVaB4bysbZQ+Dpuojr5D1vlves?=
 =?us-ascii?Q?yTkzroR4r9HWEFUpGAvsRSiwaFZ2gxn0axjIaFhFv9DoVvNuWN7mJcHj3j4f?=
 =?us-ascii?Q?xc+wH3/Oo8VENmrIDK/TFQKFz33dwDfbEB/hIf+vNS8FIdkWNrNa6NtSHP/p?=
 =?us-ascii?Q?++yi27WtwfX8e8BXoLzgy+mmr/P+480EhI+7kxumlic69SMnu8OaKJ9hvUP/?=
 =?us-ascii?Q?MpPZpyxjN1yiwWM11LygJQFtEy+Yk/lxFCHJxcAPOFRwOQrP3NlyXiC0JHlo?=
 =?us-ascii?Q?LhyNInyTqv3F1g1wMdH4URnf5QvYMSgkn+igSkSE/ha39zolp7pkdeRPiW4E?=
 =?us-ascii?Q?4kk9SrsF0BkUfVMg30dXQZ41xlgM20wAv1Er023LbwnkglrtjmBHwXX1EdGg?=
 =?us-ascii?Q?Jka+wVBSEIaOwvFUbkgNtT3FEj3+EikKMrPrctSJ3/XFaD1np/r8EtehvFrs?=
 =?us-ascii?Q?lplfWEoDabZS4cIztH1cCMADvO3TNYMQHFOS5flBYzVCwHEYGD2BrkBngKBK?=
 =?us-ascii?Q?OLgPSkXX/gO7xzvx6ul5Qi6GsbImq0s0NtgQDvnNqq8O8bG2SVDnZf8seuNC?=
 =?us-ascii?Q?pBFBhzdMizKeEEbX9E49c+EHb54USakCPP9j04FyRyposNvt6FCi14UBnP+B?=
 =?us-ascii?Q?5mwMiipHYSQY0tI2PtOjC93hYJwJEDsiUANWRYa4LqWGrmA7qmO2IW9kAome?=
 =?us-ascii?Q?vC+f8Cx5mPjUr4y3FiDXkxWXetKrnUeAF0c/mb1QHJIlyK4gMTnNYQ0ksxhx?=
 =?us-ascii?Q?UhmmY9MmMQRLMUUq49tR6eOc1hecH0la15EJSnrxPHkENEyUNa6vS0Y8IYyz?=
 =?us-ascii?Q?h+5cb2ile9fJHyrwjE5twpfasK3wzUxuSMVA2MFK3Oz8akVtABDvU4BsD8o3?=
 =?us-ascii?Q?XpV7LOC2OBMaPnDkBdL6uFeZrN64arxFjig3IfTRDb45TNigkNdFA+ylTd5f?=
 =?us-ascii?Q?IKa+qZD6H93DidfY21ljUxOHuj41YXCYPM2mLzip7QgeAS8v4VRcc676PW4h?=
 =?us-ascii?Q?ITdblMmwhc8mkLpucl9AmocJnPmWCWr3YnzNTat97opKt12e2YVPdJBwxjoR?=
 =?us-ascii?Q?8Sn4eMTzMPpnfFMgHrf+1YLN6fGChxE6Erv3LwtN/V2xuXMa6gRf0k/HIzxI?=
 =?us-ascii?Q?dEGtCZQfmRcEj7CmSijF7h1/yIVcjgvTz4Uxx0zgGbEaIn8WvmXymcmCnpcy?=
 =?us-ascii?Q?IUcV26tSXXVN1ODz9wEIo1YrR77BacdOFDkqFRGCUCDWNt+VefQdDccW05dE?=
 =?us-ascii?Q?+Y+lRbqc1C49qBcL9HRVuw93kt3s8NrxRYMlnOlDhvt+CVDO1UthYZEABmGP?=
 =?us-ascii?Q?2ihpZfEaPPSOKcEYLO/0rNh5nziQN9t3suKsgjPHYBSApFJBjalGqoBLKrNQ?=
 =?us-ascii?Q?+2qkjXHwe6+bMyAlh/32qMpg+AM1agD0CFc5ARjblAW//Ue2NiGUxV6DQWw9?=
 =?us-ascii?Q?TwXZ8BRXN0XL3JurRc7CnSatNYfQV8u8QZua?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(36860700013)(376014)(35042699022)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 10:29:11.7298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f61324bd-2f08-4976-1fb7-08dda74079b5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10058

Look good to me.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

> DEN0154 states that hardware will be allowed to ignore writes to TRB*
> registers while the trace buffer is enabled. Add an ISB to ensure that
> it's disabled before clearing the other registers.
>
> This is purely defensive because it's expected that arm_trbe_disable()
> would be called before teardown which has the required ISB.
>
> Fixes: a2b579c41fe9 ("coresight: trbe: Remove redundant disable call")
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-trbe.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 8267dd1a2130..10f3fb401edf 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -257,6 +257,7 @@ static void trbe_drain_and_disable_local(struct trbe_cpudata *cpudata)
>  static void trbe_reset_local(struct trbe_cpudata *cpudata)
>  {
>  	write_sysreg_s(0, SYS_TRBLIMITR_EL1);
> +	isb();
>  	trbe_drain_buffer();
>  	write_sysreg_s(0, SYS_TRBPTR_EL1);
>  	write_sysreg_s(0, SYS_TRBBASER_EL1);
>
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250609-james-cs-trblimitr-isb-523f20d874d6
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>
>
>

--
Sincerely,
Yeoreum Yun
