Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013030.outbound.protection.outlook.com [40.107.159.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7024520E703
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.30
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746615034; cv=fail; b=g14C+JGva3wAwEqH5tnKqkfIkan9Tljzh2ZaeqhncsVw+wsoIJsfoWKN0iW45lyiD+pCs9fad9BVBed5kBcjE67MjUpy7BFDRWyY5hkfjYQuSXxMQMkBOcToZLy2QwoXsZRB/Lu3Smf2IIIhXwbXR146oi2PxAt75hNM888l02k=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746615034; c=relaxed/simple;
	bh=smiaBP6NaGc1UNUWz1qBDsJ/PMZo1w/OwOslMEJYoHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZEI3SY/ekgRjlPAWBVJg6tF4oUHoysg0FFCeeDSEl/dNzrPkYO8koNoHnOezZD7owv2dxOvfnyWyz4e7igbKGBTfYZLAVkDkCRUKX+N57GF5ITDBblm773q63nQhm9OsmNg9HvZ6WWV/J0nO++7OsmN6yo5ZxvWFfDraFTwPLao=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=H4P4/hXG; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=H4P4/hXG; arc=fail smtp.client-ip=40.107.159.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="H4P4/hXG";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="H4P4/hXG"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jpt6A9DpMY6ulV/Bltl7fM6Dd+wJjqpQXXYtdbjHo3OlB/pjPIw9vSy4jxr4jrvtjDeLN0yGsMnzEM6LK+gyWo5USrztQQlIDlWsi9M2gaovMl4FBn84fSTp04Au/gOz6wRR6Z1WN6Frk9ULXGZZiaE1I+F5XO1JvXWEJGRET1rN66Di0+lxGzcHD/+cukHt5p7Plz+rYXIGubL8rvsRpaXpaqcbgMdsbTM8j1cez+sjX5F4kBKXl5jW83FQ+s+2fPWYxzGXkJ5kT1aAQecLMa29+5KRQdwYRXtcaqj3PgbaEdBnh0z9kNDfmA49ml/zP/iBXLJkyAO47jU51wd0Jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OF05lXNRjElVOq7VcmDq6BEcF6hzjf8vTBhHRxuuqRY=;
 b=BGeRwcVnqTuNMqAIIA6S880zS3SGsThKzlLWgsLE6unuxyn6JHdmXHnvpTN5YKvedGf0Yk7G2bdGtp6hfQV3PTSp8efr5o5bI0ning9gi+FxpBxC6Q7iw6D5DtrZA6/QJ3Vms0yHVOTAn18aiUesNyCcw0R4vkV77Xc3t6+HeiaBC59WRTyywl3xUNNXcsasHekcoO1+lNRk+CmYK4p509u7JJ7bTowjqO+wmxWozSMC5R8cwnRE9rFqSdCSYwjmeYc7AwRQiPxUd3jl2rqE4m8esuXWGFjGi77tpInM6xodxGX+LdJsk6/CyMmI95TBBW+yen9gC1rPl7m0IpFrVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OF05lXNRjElVOq7VcmDq6BEcF6hzjf8vTBhHRxuuqRY=;
 b=H4P4/hXG/cfNVE0sWMB7+XF1yH1uGpNRFvz+0UVzLcQmhyAI4SZ7j7ylVZweCavJ+rZcuOm2c3PYb6/+Z7kqX9vsFqcKvIvxeVg+bx9wjvJqIhg3T594jvRnoQYwxEVrx/YPd/myVGx/8VaJUezr7UvmfxXdS7Px5sX0RpEWd5Y=
Received: from DB9PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:10:1d9::22)
 by PAXPR08MB7573.eurprd08.prod.outlook.com (2603:10a6:102:24f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.31; Wed, 7 May
 2025 10:50:22 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::79) by DB9PR02CA0017.outlook.office365.com
 (2603:10a6:10:1d9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Wed,
 7 May 2025 10:50:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Wed, 7 May 2025 10:50:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YianXDFdSrmGK5a9eyGB6TprfB7i6VNgr6G1TtEdpD7LimVdx6j67CoZ9uNZNnZrHlBl+GSUYD75egxI+ZtKXSpTBmAQLcrC0pZ6opOXHILYXJEV0rBPMg60A0Yn0lO3+vQxE6DX/z8h6cZzLw46xDyFMXAZrbw0K+i3GlyXpqaj2UF00od3PHhcT9Fxbw/iYvVbWDYbDzEGsxYH4aDHdeRcUFJNVQ2DhUJQJjuG1WBDPZb2qzMgyEcNu87EFou+LL5MNhwOUTOs9pb1x2VYa0QzcJULJq+zaF45G09kuVGR/XrvmjcscLZRuhmRwqkzjfTVJvQp6oFKOx61K3DDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OF05lXNRjElVOq7VcmDq6BEcF6hzjf8vTBhHRxuuqRY=;
 b=d5IiLTxST6evSSp1aaCHZ3yBzUxCGfC/DiRjJc5qQaLfKtfcvft/28Eg2t0ea3es/PaspvcP5RFHLcpyGzWmuqt0rp4aTTdFNMrvhNCOCVPbSF09Hj/anBDnWARHaEuITL9N8M9Xh8bJ0SWCaQKEZ8pemJ5tDmbiLD4qwYB/xAuAAAPsQ/uyf6XgCgBqFfRCnbkHe2h/cYsc3JYCnRCdFp3rm2078Wzdk+3Ev0Ygi1wt1HXR31Qr4oOnetC8CoW73XHdJcvE99v4mGURPnZrvZgPCfKvM/sJCr41QCxdnEEi6v+zPijCfj2k0VUxUkQEFB3uwm4vUiEMfWMjqAnMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OF05lXNRjElVOq7VcmDq6BEcF6hzjf8vTBhHRxuuqRY=;
 b=H4P4/hXG/cfNVE0sWMB7+XF1yH1uGpNRFvz+0UVzLcQmhyAI4SZ7j7ylVZweCavJ+rZcuOm2c3PYb6/+Z7kqX9vsFqcKvIvxeVg+bx9wjvJqIhg3T594jvRnoQYwxEVrx/YPd/myVGx/8VaJUezr7UvmfxXdS7Px5sX0RpEWd5Y=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM8PR08MB6595.eurprd08.prod.outlook.com
 (2603:10a6:20b:365::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 10:49:46 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8699.024; Wed, 7 May 2025
 10:49:46 +0000
Date: Wed, 7 May 2025 11:49:43 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, broonie@kernel.org, anshuman.khandual@arm.com,
	joey.gouly@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com,
	mark.rutland@arm.com, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nd@arm.com
Subject: Re: [PATCH v3 4/4] tools/kselftest: add MTE_STORE_ONLY feature hwcap
 test
Message-ID: <aBs6x8nFwvzVyJs0@e129823.arm.com>
References: <20250410080723.953525-1-yeoreum.yun@arm.com>
 <20250410080723.953525-5-yeoreum.yun@arm.com>
 <aBUGI1OaaSUJPGAa@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBUGI1OaaSUJPGAa@arm.com>
X-ClientProxiedBy: LO6P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::9) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10521:EE_|AM8PR08MB6595:EE_|DB5PEPF00014B9E:EE_|PAXPR08MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c90c626-8cfb-4605-e6e9-08dd8d54f65a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?1zyYnEwPI1RKm/S78CNz5t817I20ph4N0nq7NdanR9GO5QA+eX6/b3EeOwnO?=
 =?us-ascii?Q?Ekf27y4fJywSTgFmqs7OZGRjmR64TmZ5pnlmNKV69W63tp3AowZwtNVutndA?=
 =?us-ascii?Q?/us/L/TmIRsUWX882Ez6X8rbE8K2oIc9WdScKqySyTLtzr2WGGBPo77Q93UJ?=
 =?us-ascii?Q?7mTcdRpb5wNtDLyuJRjfDzPNy6CELPUufNpFgpZyeaetkmGysvQijFgeiSKG?=
 =?us-ascii?Q?pIGC46uXlmqYGHq3LeF7S0iirqLiNn7JtdrlWNEVFo/bz2iXOMABM370atmy?=
 =?us-ascii?Q?65awehdxMMTlnvm8NVkODyx9Scp7oGhUcQv3lBb7a/WNOq+ZcT7KuoRBI52V?=
 =?us-ascii?Q?aGCEXTBGJeGP3yNe5PAkJBdqwHtXOKtAUUUzxiQ03Fl55Yz0lDuI3ovwEifL?=
 =?us-ascii?Q?bOEc6ySGaCgNZcrMroP3RFeHRqrJ1ciAZJsmoE6B8Y3POCC6/V+6YEdQxqDi?=
 =?us-ascii?Q?PpGltq976TLCBg8T+ejgWH4VParX0NdN+f2sAmZjFzSj7gzAvd1LNv2s+tNn?=
 =?us-ascii?Q?EmG7KNcEeGy2y6p6s63/lwq5+mZGh8jJIRvpFzdJCJKk+JlV2yZrsWdVYtxL?=
 =?us-ascii?Q?BvcylzJFFjakNTZVDOMuR6w+cPBEx5FFj13Q6NTtakxpfXHYeAwqBU4fhYq+?=
 =?us-ascii?Q?Kh08GvRy4vo7Hj/hL/xeVpb7DlFGlhJA6KznYUTgjcHLo+cY3/uMSpYDVbfQ?=
 =?us-ascii?Q?KSzgJDB5G8Gw2rQZiyBlQdR8CLEyiNDfYGJ6m8HB4f60THfmf4KH4QgFij+8?=
 =?us-ascii?Q?g40h/Q3rD0i0ZLEjPb07RTW8hqTweguJLteL6gCdhQECGMyuyGH99vwb4OiF?=
 =?us-ascii?Q?Nm1W6B1J8FNhVM4PRbHSgX1Y/v32aJKRPrrCd0VPMasnbMUNlkVLhIV4CAx+?=
 =?us-ascii?Q?sx61WtEq9I7NkKGCkfgNqeSVpfIRdQDrzDm6bv3+EEg9t+DqMwDGO0AAZais?=
 =?us-ascii?Q?Fu3ObfaNV89+qRddeo22YOXOZrWWDD2UEYVBlXVN1ThXTK+hmrGCGtJGIdSu?=
 =?us-ascii?Q?z2KCKX5kUBnyHkcaKhtUGdfOxjnW2RejzJtG7JncrLUehImN7UZzfBdowI7K?=
 =?us-ascii?Q?qq9agLtDDAOxHe5MX3TktmA6HBugpLZGokSSG7lSS7MhsNL9Ne3WnQr1arRW?=
 =?us-ascii?Q?nl0+FI/8hZiVfk9b65T0uXa+K3n5KRi0+5o8phEpXO81ls3s5iuHVF7pECuf?=
 =?us-ascii?Q?lb9K1scIe8ULLCS+3N+CFnMG/kctwti+UMbngKvqTuCxtBYwyVIKtSG6z8xw?=
 =?us-ascii?Q?azoI3PFZGYxYja5UFa3+aYY1PUImdEDrIHIEC/eoUiRW4KJVq0K9yvic534F?=
 =?us-ascii?Q?xwdJhvNmE1a5ecRyCwqilxsEGhwK2N++u1/2rOTRHNUuKB7Ku80FhOsTulhR?=
 =?us-ascii?Q?zgesyThWCKwasBhoiFrs5FbNLUl1LntyE2W7j/G2lcY1C+GOjeOTzivDiqmo?=
 =?us-ascii?Q?/e96y6iJwhA=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6595
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be1d83cd-baff-4f50-21b7-08dd8d54e1d9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|376014|7416014|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A1gvtqvmkGNABClX4NZQ9noRR2UJa7B66ZWy88B+LbCyCfULf6gvN6pTTvX0?=
 =?us-ascii?Q?62S0hNXuKxINSmMirY789hDQr90E/thQMj5OhyiXiy+5djEwChqEijczMg6Y?=
 =?us-ascii?Q?Ln+uAAFaDbkpX8gYX5KXlYpgmD0GubjLBdhzKjk9XRH7MQqaPIM5ZdJf9LkL?=
 =?us-ascii?Q?APW84id6OIw6Nxqip7mHpCzOx1tCLAdTuOxJRk31SFpXz5FVb77J/tz7x2yn?=
 =?us-ascii?Q?ymr5Qq8fPt3gA1KB9hWlyY7AV+d2roEP+AsCPJOj/7yIhqSpX2gBZTEuehYN?=
 =?us-ascii?Q?kUKLJTrkHdNJmyvM1FXDePXRvq5fxBJipyWvStQRCy8uzGOOQn8/Y4VuhmdA?=
 =?us-ascii?Q?0Teq7aoQKnT9TX83tXL8IvLOYFBnGLy7AEkMWbzPkcBRv178qgiVh0cV+hXQ?=
 =?us-ascii?Q?2/TxKam5yNGNNVlAgwHaEsvKP+p/uz7IOqeQfaFLTXotExfLgsxvXzTyVlzs?=
 =?us-ascii?Q?ULG00Nq8nvFDb+fXLEmMOVM/GbLFSj08dmuPcLZvRzHvR8XCryJm8peRk3d9?=
 =?us-ascii?Q?Y/9J4pKOZD2B0veoZXswJnnieDGqQ1j0YbFXLmwhNqB80cewGYVc9UiWriG7?=
 =?us-ascii?Q?qHT84HaAFz8JNigAIVZmEkKLzExPC9w1uZxAPwphaGIMql28VggFdOUrXGFo?=
 =?us-ascii?Q?jWOM1qbXiodtwQaCIohrdGWxjWWlnAEe8dy6ktYquKDspgm5TrzRbR5WEZ1G?=
 =?us-ascii?Q?v7DxiIC/mSW6mWWt1/yyJJgMpu7oA6Z+scgDzKCxCqjLfeuzgZpLlTPksLdi?=
 =?us-ascii?Q?4ihziPffk02r92hEKiaWHu/COOpHSE0jw59Pe+Pk68ThMr9i0VQND8fj6ARu?=
 =?us-ascii?Q?p+M5OISnG3sdsR3oe6XkAUmqhZu6/Ff7hbn6QYWen6Z9TF/k36/dWHgG6WOb?=
 =?us-ascii?Q?7E6vNKdHldBPbwup3m41MXQE4YjADZQJPiRkr9lMF2XiYG/bJLhkcHHCHZTh?=
 =?us-ascii?Q?8VHKoF5Qe6ekC7TzY3aszJSnl3hK7QXwGq3noa4hbq9ZLsd1orfnkD1ZRdWi?=
 =?us-ascii?Q?Bf1E0xL61IQfgqepSwslWkRLgw25pgL9jqV7+1ow+aG1szo5Ce+AC8mS+kGv?=
 =?us-ascii?Q?LPyo6ZZNUSt4MXFCtLlLL85j/QrYG681MNdeFZEnWAKK69qjFfxEeC81qT5S?=
 =?us-ascii?Q?dbNgJHXgSCgNEtu6QEppxpW9dA30XMUioo/Q3gi4uC7AU80bEyEPkqkv+9hh?=
 =?us-ascii?Q?W19m1V0X5xTK8ivxFKhvUvbnDY8lgTg+TVyUF6ahvFWsuVS9weu6RA6CejeK?=
 =?us-ascii?Q?joyhwZ4WuRJnAl9qE8IaVyYnMdI9rO/PQkn8TJD26LRchAFVSUWRVmke9dar?=
 =?us-ascii?Q?HfqitqFurJvke4/0DEuOohwIrPXtjatf8QidQ16/fCizy7hGnBrRJcZ7w22J?=
 =?us-ascii?Q?8UoCRMwIb4EJfywm+ykAgIL1FiwlNZCrpUE0DPGWe95AsTpkiQ1QSypY01/N?=
 =?us-ascii?Q?PA9vpan6nfK88NtWTv5I5rSv4qwGt0bFcZF+PwcKRjeIgrn+Zgqzoxh+AOYd?=
 =?us-ascii?Q?TNnQIVRQiQk9EX7YyfMGXUhUkeAlGa0VqxR4?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(7416014)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 10:50:20.5421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c90c626-8cfb-4605-e6e9-08dd8d54f65a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7573

Hi Catalin,

> On Thu, Apr 10, 2025 at 09:07:23AM +0100, Yeoreum Yun wrote:
> > add MTE_STORE_ONLY feature hwcap test.
> >
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > Reviewed-by: Mark Brown <broonie@kernel.org>
> > ---
> >  tools/testing/selftests/arm64/abi/hwcap.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
> > index a539eeb0bfc0..32385f67498e 100644
> > --- a/tools/testing/selftests/arm64/abi/hwcap.c
> > +++ b/tools/testing/selftests/arm64/abi/hwcap.c
> > @@ -1104,6 +1104,12 @@ static const struct hwcap_data {
> >  		.hwcap_bit = HWCAP3_MTE_FAR,
> >  		.cpuinfo = "mte_far",
> >  	},
> > +	{
> > +		.name = "MTE_STOREONLY",
> > +		.at_hwcap = AT_HWCAP3,
> > +		.hwcap_bit = HWCAP3_MTE_STORE_ONLY,
> > +		.cpuinfo = "mte_store_only",
> > +	},
> >  };
>
> Please also add checks to tools/testing/selftests/arm64/mte/ to verify
> that read tag check faults are ignored when this is enabled.

Okay, I'll add related test cases in check_mmap_options and
check_user_mem.

--
Sincerely,
Yeoreum Yun
