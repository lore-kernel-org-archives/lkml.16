Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0F293B44
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310567; cv=fail; b=j7TUIFWj79kMXN9gHSIxAnOaSutgcCVdJWChfGXr6OzgY2OpojKZx7LqlNA2jI9lxuHkldzbsNzkbdm8qKBrKS9wRVn2qnWlfQgGMYouXo+WTDacQy70ocChiJiqhPRhb3jEkKny+ydjkOlAFYtrUrn7CPf/LLmyXac2hOgPPhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310567; c=relaxed/simple;
	bh=WQJ2JVBkdrfMpdQpBM9vnvjQedSIHI6cHjOGsnLywAo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Juvav+VwXGkQ+zn3+2eSuzL5tHEQap92bD0FJONqXEFgWuWq8n1y9E/8oe9AbJKQWRq1rUj6NlsW0PgbVWNU7zkAQGK0hOTw/Iel3eXB4YNYkwuqw8GpWZQJMQppixDRAoVLyZ0fwdw7AZLSjWOs6hpeYzIMmuppF3cUKbHxrS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r4dzP9SR; arc=fail smtp.client-ip=40.107.223.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r4dzP9SR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVbbYPkkMzk/6+iRC546/MDCffysXa2pc6ISiOHSjAMUs74I1IZ/vwYBv887gVA1Z0IsQmRBuW7i2xHm+yR+50c4696l9kTlDkN/sKwE8vqfuhKBVH0IZcqiQpWPF8r+v+QEINFJxksGXDkJ12Rus/TUGfydOBe4fLkH+5T9iA3Lq83IClGtYneAXcdz7wJCm3qNYX/i8WNWyqPngJESuC86Lbj0BRQkti8C57gR737W6rnMzkvdDWcylEBeQX3g7iTAtwHVBiEFgkBvXbtJt4OGcODBH8CCW6IjaWWIDmvhH8/BBPibOUXPC1U3FZotFyCtSQUW0rnPKtZpd6Ip+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4hPToxKutNKuEh1mRv6NQcPaHSd4ZykyHo9zArfi9Y=;
 b=K7Ir0DODGnHw4m4KdN4jxMBMfMLsv0zbiPUl53ZEDC+eSVHUW2rJP/xnLBwTh7fvs2flCj5AxfFhSHETF8glYzNm9HftT+gAD790MdoMOxzU9bbYXPZAMqUe1eucuxm+nnun9gnpz5Bswg2uhA/wy7v6yzecDEup9/Mqi0UGQ6QRv5ShX978gaZkLwrLkwsXBJyg2VRgQEsKcO0OO5JbcBvStKiWfuiRx9o3V0xhXVxaafxhuQQRPp5GVA8SWcMMaXgsRMImSJ6cDs+RRQJ25E4ARtW3VhbWXfewnWKWDYx2G7KRgRRD5HX0Xj4fkVIhgzjf9Zqt4f8kLGPShGq+ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c4hPToxKutNKuEh1mRv6NQcPaHSd4ZykyHo9zArfi9Y=;
 b=r4dzP9SRsRt/aDu3ODN70NY1rSUCL9Yax/rzikYz08AX2MCpu7IeOcElUd2eshYfxayhA7auhi8V6/h2sOAAS1uCkvXUdaiVwK+EGdUA8mTSnPScxlBs6BhoV3U3zRLaNk8zHat5aYa6pREJ2zxCNCGlegTNUFZLCf5KZyQrDMFmy9pERFw5jEO2qy4Acpke/cK8j8Lq8UyNWsybOMfiqMWuesBCLhDsPuFgAo0uRFsom2nMFgowv6SMZ+Sq3m/fXSBU6GnJRQLj2353tCSr4kM+nRdGBzPMaG67qjrnh870l9rlEvn6HwA85EnM+ULcZRZEoDfzqbkw7+DX4hRYnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Tue, 22 Apr
 2025 08:29:23 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 08:29:22 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] sched_ext: Introduce rq lock tracking
Date: Tue, 22 Apr 2025 10:26:31 +0200
Message-ID: <20250422082907.110167-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0216.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::7) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|SN7PR12MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 977b1adc-c6b8-422d-0ed3-08dd8177c8c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NaEILmma1/4QEKxIAoZrF2eKT/aNucgTc8rHkInn8foJyh0Mtzol3Y2N9zFB?=
 =?us-ascii?Q?KJ88+IX4K9pdUpJkig7zVaGC7Egh0OsaP8DCXazUpPzpa1JTW0Zo9gUU1Iz+?=
 =?us-ascii?Q?J8lfk3VKAAQlOPn3IWYbVHJVEfrkCvOc2wP1UNMDYXORJ2b24GI7YsM0N3at?=
 =?us-ascii?Q?MmtEzqlCN9x4w04qgP41a1t+J1b8qTf/JyUrX7khSiC693w0DqM9X+Ist841?=
 =?us-ascii?Q?K5mEmDchpLZYJJm6IOkDM0vivb+u1iGRi+DRFx/Ftu5V5ieMDhKjN6PX8AUs?=
 =?us-ascii?Q?HUgsdzsu6+J024uZXBb0kMNATilggSLn95NKUIwxXrwqc0Iby5JpC8aHVFOI?=
 =?us-ascii?Q?5PVmDqJUdRcm7FtRQFfHvJr3tTrUM6ApMQKlpghKnLQBYx38auIBPdEzk1RD?=
 =?us-ascii?Q?Ej7YU5SGtPcGDi3nLVIkBkGbxxbOaZhwBn5cd2j9zzBWPp1c8rQTabciE7nk?=
 =?us-ascii?Q?ck8cDVgTHfAiZTNOf4nbKQcp9ZD0q3s+92N/qh6701eDUt8/jaJPZ72iYxC+?=
 =?us-ascii?Q?EfnXMBd4u2+fMn1W/l9Tgf/m7rnNYn5smMguMz/SsXNI6x6/9yWnODNbS6+U?=
 =?us-ascii?Q?hNLfQCkCpf5gsIhQfN0+ydVzG8n72D2lWwqwvqczT/S1Lx9lfqXsdCQnJDxk?=
 =?us-ascii?Q?bc+KF6KYOrAd4yr57nAdPSTFoFwInknDUs4Xtcaxjvoo/wpud1Lr+wq5HLoW?=
 =?us-ascii?Q?MzTrI/GchL5h89nLbnN/oxqLK0VM5iJcGyclVcpfY+LWzBJcKGFvIyFD6Nfi?=
 =?us-ascii?Q?C2hDswNmyvV0g6I0w4Lq/FI7RIW5dZnm2yb2JY0N9bT4GF6T/5MEbiWiabp4?=
 =?us-ascii?Q?rkQ1vkfZAccPzkuBDKYcipXL9YawrD24ocBDDZ3H2kofgpneg0LtG76LVOSU?=
 =?us-ascii?Q?YWqHSxYzc+WbdrYq61mY1AUb3Lptr6QOZu5HqD1vBqcyFuCwR2+0bxEchJfU?=
 =?us-ascii?Q?f8uJ6X4IWGiR3waLYXAvNOdVSZYIt7S+TLyhnpNEOAbiWvraE1tAxUiGanVG?=
 =?us-ascii?Q?EgRcIMgr2v9NIJT7PFjI6b8vOwBoCnjSCb4X55d0Di9FIrBxiG3ue5eHSPOC?=
 =?us-ascii?Q?LUbpMR2qrf1xlWDHDtq/iQNA4wNmJNOpe15EpXVBg0doceplBKeCBvVAFU1u?=
 =?us-ascii?Q?AkRK9g9hc8X1S6Y8jgFYJOc7GyYRC5fosMHmBve6kQlsweODpsr5apUr5zrZ?=
 =?us-ascii?Q?HX3NsWGDWrVR7Epf8YTae93jHzFmTps5cvLwZuf2eIerpQG7NaLYBeAYkVdY?=
 =?us-ascii?Q?WADYk2bAFF8eVjuND9jvwpxXj3ae/oUp4qrbRCdhExX497/Pq9jdXWFa+pLr?=
 =?us-ascii?Q?4pjMJB/L2ZxK+CWF368s0L3JqNsTWgO/ux+bblaMW6FwcJbIb1flBGnkqd1V?=
 =?us-ascii?Q?Px5cQUDwAifuxHBoDdVniTLAqsgDuMKi7Wh4FHeR8BMlLoy8dMbBcfsf8qJ3?=
 =?us-ascii?Q?FNHSnem91Pw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qtPsgmeXGxV3De+n4et/hdKNdSGtxg3FGQBTZqLqufEOzEG59MG3oxIlnHXd?=
 =?us-ascii?Q?geiiMDSJy/mL5SefR4uoB/AasQv4vMwWRQkPZnj4OasM3yHlYrhgy4Wh1Bun?=
 =?us-ascii?Q?nwbphCeWAmut7/WE2PHGpMqncBWCYwBhoqncWRkgSyfyUkMdP7lR87IpFa6M?=
 =?us-ascii?Q?ZGN3XmVc77nJLAH7+F9FaDuHkKr32qiE/8J1OMAiw2l3ROEx9fMAHpcoVr0b?=
 =?us-ascii?Q?cVTN9CXGLOyMqg3BmGNR4hQchYWaazvVykW26lHs8ZVwscMUU1sSBmWciI+W?=
 =?us-ascii?Q?WDv/zDeKPijzQ2PNrkDexx1e5/YQMBug/+aPiLbmn+YS9EpwzIrd3Wr9Iq5x?=
 =?us-ascii?Q?vvlwELYFK4xaCzXvXwiwD+IbD/4h4JrnFTGik0L0NOBNV0i5dpVH61ifo6y2?=
 =?us-ascii?Q?IE/zFQOVDnHyGxe35WPqH8S/ELEVKsIljIiT/kJaE/2QfSu3iGbySe9WhNT5?=
 =?us-ascii?Q?/xyHMqpTk3iPhWwON1GlO4TgHl14lwziyOKm2ynjd8mV+uGgyOUd0huUCMok?=
 =?us-ascii?Q?+euLHc4H9hdOQNISklVsmezUkkxGBrFqDYac1ZLBztWpVytZQfgtrGEHudqE?=
 =?us-ascii?Q?utN4iB2pvkQvGN1ieC3/mW9+sPT1jOVA3PfB40fv4vo6DlSNGzxAoVMHTtXb?=
 =?us-ascii?Q?3ZPdcrIORqq/Knzfm9IZ7waPkP4+b0WwbHdJ7ZRhVrO8pEHIvWyYHG4SHr3c?=
 =?us-ascii?Q?zjfg7g8ebN/+Aj7pcNhB5wJQEHT0y7A/SqL/AsztceqGvTVJ4voWJ1vv6nBA?=
 =?us-ascii?Q?hvwFqTUmd7+QL2k5/jdMsEfbvdlaCNDXkdGlZBuMG0N/H0OX4bNxFo0Hqb+S?=
 =?us-ascii?Q?QkgAhIj5Sy5GswUNfPuUMMPq0bIJMv3dh20ZfWniHP3VXVOeuZrERgQKsj8f?=
 =?us-ascii?Q?HP/uUwPrAFgKwUSYZz2uIV14Y1UiT6LkfZN5EKSDZ7E9CaJMOO3s+o8MraTQ?=
 =?us-ascii?Q?5DQ2unPSOlvN/kHYCvXhZ3dJjcY2asvsvTkY6LrPrlRc5w5XzcgHa0BsTGL/?=
 =?us-ascii?Q?cpxjqJpoDzyTGjJd7pWXwoQdNwhip563T1Z+qbffoRXUsIgQhPm+1f7oyeVX?=
 =?us-ascii?Q?87/bd6P0HBduljchNsdfBVd0OHxkZtwq5oIHZ7nEITMwQFMM0EHs7QmrRznu?=
 =?us-ascii?Q?4GhnfeWUiFOlt3PPttBwHibuFBXr/WMuZo3SaQkGONGRopT6vZzjqRRxPFYS?=
 =?us-ascii?Q?QjyjZeMkpn8oPIRp4bKIgBR/h2fa+ySmdlLrKcjVjZKxQbyZH1akMKiHJB19?=
 =?us-ascii?Q?6s1R9ouo6T7CUoEPiEVYewmo/Se0qLgZ3dTj4BOb949GhA6v4EOkzb5tKT8t?=
 =?us-ascii?Q?dGRKAKVUBBnmCV3E2jdupfrtgmFAlOuUeXAtFAHBqpT9r9dQCM4NfW/UkqcP?=
 =?us-ascii?Q?LMsoAKYIpGE/8RWfTjMw11KMnW56MIULpA9rA6cVQAkMVubkacbUfOVmg86p?=
 =?us-ascii?Q?h4E4+cfNKZtp0obfEKC/Si3jW14pVem6Nuh2NdN/EA8HY0TWU80TqZAUE1Fw?=
 =?us-ascii?Q?5O5mfLCRFQzabEMyocOcGviLetnvs0lt/n383J6ykF9x1o73lwlLaxCAwHvA?=
 =?us-ascii?Q?jh65yJW0O4TQTuQPX3gBrMZsCfOi68+yjZxMcjBB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 977b1adc-c6b8-422d-0ed3-08dd8177c8c4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:29:22.7246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xbNacA44IS7K7LtvIwvjREEGPOQTULu8u3gs06XqRU1ocSreWAh2+Ils0bT2adhtmusQE2XuVcSsrYeLsFBRZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603

Add rq lock tracking to sched_ext ops callbacks to enable scx_bpf_*()
kfuncs to detect whether a specific rq is currently locked and safely
operate with it.

If no rq is locked, the target rq lock can be acquired. If a different rq
is already locked, the operation can either fail (triggering an ops error),
deferred using IRQ work, or managed accordingly to avoid deadlocks.

This patchset is also available in the following git branch:

 git://git.kernel.org/pub/scm/linux/kernel/git/arighi/linux.git scx-rq-lock-tracking

Changes in v3:
 - remove unnecessary rq != NULL optimization check in SCX_CALL_OP()
 - reorder SCX_CALL_OP*() arguments to group static args together
 - link to v2: https://lore.kernel.org/all/20250420193106.42533-1-arighi@nvidia.com/

Changes in v2:
 - store currently locked rq in a percpu variable
 - link to v1: https://lore.kernel.org/all/20250419123536.154469-1-arighi@nvidia.com

Andrea Righi (2):
      sched_ext: Track currently locked rq
      sched_ext: Fix missing rq lock in scx_bpf_cpuperf_set()

 kernel/sched/ext.c      | 179 +++++++++++++++++++++++++++++++-----------------
 kernel/sched/ext_idle.c |   2 +-
 2 files changed, 118 insertions(+), 63 deletions(-)
