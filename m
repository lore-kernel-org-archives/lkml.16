Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E180B23D297
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808147; cv=fail; b=Q1SnZfYx3q5n807qget0bpxwK4mMF02Ydo5jSG87goJXN8VdMVIW9vzA46rbHjfPs02xbl7k2MAuGp2ae4otT+J/y9UZnoCqy3jy1dt+G5rRaiL9GpiRzS4TXrkODll2hEl+kOcLNpCV3oGIph/HDpRz96WaQHy3jTSAYufwo44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808147; c=relaxed/simple;
	bh=2kD+8zFNaQ2HNwxoIx/sJz6284xXHeDYxL/boIKH/4w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PpTxNHl1rGcqov6SUpG6VPCkLcCYTWl8hrErqcdgBtc3mTyBFuQVps42QatkZbJmj8jzKa7bUIk0PN0fNV8QfAiS+ekBIYgNJxox3LhX5mb9qMWQVR9HKdskqc+QOH+Cd22fuRZPqf7qQyYD4+RxzFblQ+l8vpPL6xaLGVGF1nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=W7eTl/mc; arc=fail smtp.client-ip=40.107.93.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="W7eTl/mc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNpv7ajvKOFHN5AnCJxQxET+dVtOUS9FJqF6/krN8FxFMHd9h+oqkFbBIvphoEGQSUI/IjLdXdKPFuyVzpEWlahMUeigzs/4UE/GoGqoAaLuNwGOaqsQJb6M4zVhMk+apT4bMWwfGznHrgzcbOuCI7Yty5fQohoVQ5qXhz0Y6+4vzAAgl+Vsz+G1B3u+ncaCi9kmsnVyqY/Da3h31xfSJd7lMHO04msrEeAiANNZrzenAFO+txHgJ2JEBRIkuYDZlsbC9fHwmJ08YplcPKwHt4OqUu0GaINLPgA0gFR1qbGQzp038ty8M0FRgeESbauJ+/YJoTmc/jintggJDi7ybg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYMwPe/gFYIkY6DEvjX6L3EzX5HD972Q8GSbVaRrrp8=;
 b=rbg0/ewkv6xFTQgtPHJ++2tLKOh4b1r16+w8Wz0Mm55U1G2Mu6Xup67vSKYqKXe7Se51ABGbwVDtecE0mjtEFH5ni5yUs0lwOu0+7liSIzW/cVEiToVii/ixgyx/8ZASWSp6Ygc3vUeKwIQEKIiNlm9SNR2qlT3pov4a9duJbizKlco/u25O6N/jyLLMRYC7LtdDCb/QuqyOYMH9oGakcafNq1wNRMPpodxx1VUwTs7a5Yz6JgGW7Nu1NM69BHkPyr+oo/6n/SPrOGyXivUGipsclf8GTdkUSoz2zxS9edllRODjiTq5udcKW+2xbIx4N9Uce1okrJE1tXHeCPqlig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYMwPe/gFYIkY6DEvjX6L3EzX5HD972Q8GSbVaRrrp8=;
 b=W7eTl/mc8f2diXmKwXTajCPJybImrNLftbotHFNx37FChRJ9pDMX8XKUGmcaBJqNax4NCSfHsA3TpfKxydL6x4gPf8lxjR/tIIn3r53MQ8hGeNMlcCsnZCAC6Dk2vLdKuYOxdsKAw4l9X0UKhmn/LuopzyHi81AmxvoWkEqKWVU=
Received: from BL1PR13CA0097.namprd13.prod.outlook.com (2603:10b6:208:2b9::12)
 by SA1PR12MB5659.namprd12.prod.outlook.com (2603:10b6:806:236::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 9 May
 2025 16:28:59 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::88) by BL1PR13CA0097.outlook.office365.com
 (2603:10b6:208:2b9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 16:28:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:28:58 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:28:57 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 10/20] x86/bugs: Add attack vector controls for GDS
Date: Fri, 9 May 2025 11:28:29 -0500
Message-ID: <20250509162839.3057217-11-david.kaplan@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509162839.3057217-1-david.kaplan@amd.com>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SA1PR12MB5659:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c3bce9-9d3d-43bf-ed98-08dd8f1699d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eHm5ENbFxeYjAgvAT2SkmSx5V/H7xWxLqpf0bIIPgm0ULb6MOtxpugi3noOW?=
 =?us-ascii?Q?SoZWJ8TZ5RmPerQO4CT708CSYxtFiVPLVXTAA7/7EbO3iKixqyJezN4TZrWy?=
 =?us-ascii?Q?ctVwlqkFtI2fhaFicDeoHBIeWv4OBDPJYV0MhPIVhUFq2RbWN+cFZ7cvHZPz?=
 =?us-ascii?Q?xSrO25LvU4Qctu2+WVGccL79zp0aVREZgZk1oY/2uodpwuuC2GrzBVD2060u?=
 =?us-ascii?Q?ePOt0lM5+/wWmimRab6AV3FFQlcwSqWSPy+vYwp1Lo70gz6++K+Ht3zPRUYB?=
 =?us-ascii?Q?Jn6K/LdQtLDzONK98kAZT6jrZQALn8sDniBOAmRcLY9lNndIsSBUKoO5NNEj?=
 =?us-ascii?Q?QAPZ0vACHFHEJd/Ju7zcFpNjKt8JzyjhdzMolf5wL8n7jd4daKTDDVBvxL44?=
 =?us-ascii?Q?7o5r+5IFgHaKkqRSnMTLtaJzG9O5zuzEPb0psk1L+amBbREZFC5JxA9gA0om?=
 =?us-ascii?Q?4/bQZcln2kFZjFQDPsG3O7KIvBqipXzwQXVvdSDCH9TGf8GdsAWi0gXrgSp5?=
 =?us-ascii?Q?CVfhscXo4/OuArI+1CBsc46twM1W4x8RqHZ7GDcqFl0jAuRSi84eB2mN/2lm?=
 =?us-ascii?Q?0yjT0TwwumWottY0mCZrda7H1woCFNGROVqBdqxofiSx1rk1lD2oP3yKcNHx?=
 =?us-ascii?Q?ffXga7AB+Sql5mgsBeVyTq06WN3JCpupyIZbv30kohIw38uOp+AQCKqqp3JS?=
 =?us-ascii?Q?+Mz2t7UJU8EMRVMIIKyaqZZ46D7QRs5DjtdTG5o68JrYgj5WIiOf0HMe6zEq?=
 =?us-ascii?Q?O7pt6OlPK1u2Gfk+IB12pXPSFUcgl5ICuHR9CxG0rriBxt1XTTHSuU525cAa?=
 =?us-ascii?Q?uWw3K9iWaiD8Jvke2kJMQ2aizColQ5z+xhtYOnJXreEBvAPczXVEatHM5X/0?=
 =?us-ascii?Q?0+qjLWb7nIsnXu/6622fPy46OJBmXHFosWSagPPZgoA/2urhssGG4VcprVTR?=
 =?us-ascii?Q?lcErrwOLM9JAiyR1bXNO3dur72JZQ+UeCYNGkt3+tXnNMxaOhoUdPNa1BTLB?=
 =?us-ascii?Q?o6HM6sGmtGoqxGrWmavwd4L3zxiZ29U+0yb6CcF+9u25YOZcLIa5rrMmAyAh?=
 =?us-ascii?Q?L3eN/7GaecwRSy4tdErAP5FZgmqG05YV72Y7Rb5NzKNHeX9W87bVkSMPYZpq?=
 =?us-ascii?Q?pLpAl9ZW7MSaHpFuz0vQaYSSnY+b8PUZjN3TBTm3/rrROq4U62i71vO4r5rA?=
 =?us-ascii?Q?Ik3RNs92/WP18sh0TmFKURyeP8AlhurOMC02gMTOWUAwyLaG2t+jItz08PUt?=
 =?us-ascii?Q?Hm0mJoL3C65HQRwGFb3YScEGpmGIrhh3jhG5QLuPOqRhqWkU3UyjLgf/ROvC?=
 =?us-ascii?Q?ARihFvOE+sa77L0EUhsTP4RKGGTalXEAfSc8n43aFkddw5QVDHs0ne38PNi9?=
 =?us-ascii?Q?i5MriB04mMSpx+gYrUNKulGo5SVoGIvPhLKbpzmtR8XB86t3hdZpq7x0L57O?=
 =?us-ascii?Q?b/AstIgCnm1phG13Jekf6OLKdb8xPw0e3bzyYW5GTQ/nW/mzEeUOzrK7BOwr?=
 =?us-ascii?Q?MRz6FY4w4ZJA4wOnIh+KmZzQoA9XtZQwIAKM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:28:58.8709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c3bce9-9d3d-43bf-ed98-08dd8f1699d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5659

Use attack vector controls to determine if GDS mitigation is required.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 237ef8d0980a..659455c5b38f 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1008,12 +1008,15 @@ static void __init gds_select_mitigation(void)
 		return;
 	}
 
-	if (cpu_mitigations_off())
-		gds_mitigation = GDS_MITIGATION_OFF;
 	/* Will verify below that mitigation _can_ be disabled */
-
-	if (gds_mitigation == GDS_MITIGATION_AUTO)
-		gds_mitigation = GDS_MITIGATION_FULL;
+	if (gds_mitigation == GDS_MITIGATION_AUTO) {
+		if (should_mitigate_vuln(X86_BUG_GDS))
+			gds_mitigation = GDS_MITIGATION_FULL;
+		else {
+			gds_mitigation = GDS_MITIGATION_OFF;
+			return;
+		}
+	}
 
 	/* No microcode */
 	if (!(x86_arch_cap_msr & ARCH_CAP_GDS_CTRL)) {
-- 
2.34.1

