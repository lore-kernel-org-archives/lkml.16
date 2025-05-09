Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06082405E5
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808149; cv=fail; b=bYhvgkRWmZ/wVY1qhedfxFfK5OAJQMkr3bUymk3vmCxgaXd8fd6e8lCmkZEMb+fWuV05f/tNPUjPoNgCy1k+gu94/1RSz3DrNK42oeFTZ+pkJHQ9I034spv75S53fSgw2CsSEV430ndUJcCRmNroqejEmyByZfJCZlR5kAZcSZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808149; c=relaxed/simple;
	bh=hoLK2ZwfaQBf8CbKWxpCs2NnqNyqbMBQJVBygOaofV8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c3xkqX84E6GThtSdHvwfc1pObDviJL0x69eMsoLvZF4kDRyrZCMDBhKRJy1BT1BW2NSCozpp/rdZSYkOySYk2Y/wXPM+jhkKY142GOCLup/xkSQ5/KZxogo+K035/QJfd+RzHu516JATumxR91Odk1fEzQyrpTg0gNElQcK8BAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DTF7bZ4M; arc=fail smtp.client-ip=40.107.243.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DTF7bZ4M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFuStezf1npiMvSDvpqdb3BBfTSChTRNqG9qHsWfV44DF1iHM/NVXBEMpzEVDvDgN62+OnB8j/AFWu7I3nQQdD8Nk93R9Bb7xSozX07LaULx5hVlbqQnb3Ntkui/Gys6gIc3RC37AFOSM/qjNizrslxZCKUTGMGI+LGSNHXt2I88nmWki+3f1cf8HuNYzH01Piojl8bk0/LYnYrL623zGLWGipXb0PIFm+O4aKIFCy1VKeG1gWsE35HL5SJz+RVJDw+cLiNr05yzFnKKF6A454bMd1pyAH+g4FcnrHKxI3XjBjNLqdXroV7avxvXW73EgoSCNZoNIcuJhD54eFheNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQiOoRukaY4EyFv9nLsvbmMVsJO09rc3JKs5k/rP/vY=;
 b=ZeFiHCEhBH47e02K1onQtQQ3LSbFIb2dU6Lo0kDcCedtmGfArzQWiVOY8yFrM6HSzYlhCiNvQ6EKmTllbRykkOVoGwjGsTQBjAUaVfAjqf74qAVZt6Qo6Mf7D5Jn6NVVGFt8ZqGlHgnf/uzWOgbXNzKpp8uYUlN6/lbN1di42po0qdKtLb1GLwmltX9OPQ69CyOdJbTkuzh12iM2frKakMNn8WjCtbFNT468Fm2oQxKNWtcgMLa27FhkvVHODNQn6oUfJqEH1JrTzXfs3d2/f1D+/eJWUzfejZa5S7MqF8VEOI+NFTQLzRrNhe59znfwoy3dFCPZfRiXAo6o2jrN9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQiOoRukaY4EyFv9nLsvbmMVsJO09rc3JKs5k/rP/vY=;
 b=DTF7bZ4MAfgHpXo+lhVZmRTds7AM/y2OiznWdHGcIVFa+UxJUj/vBR5rYIZ4j74IzXXTkJ2Le5NfaYVWXGNT06f9hlB2CI4RKxqzHednF/nh0Eb+dLj1IJg3P5cw64Ym0CkRyPBduWHWqOlANS2xsBa9ybQIBrHMWlWHPohThhk=
Received: from BL1PR13CA0114.namprd13.prod.outlook.com (2603:10b6:208:2b9::29)
 by DS7PR12MB6192.namprd12.prod.outlook.com (2603:10b6:8:97::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.21; Fri, 9 May 2025 16:29:03 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::8c) by BL1PR13CA0114.outlook.office365.com
 (2603:10b6:208:2b9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Fri,
 9 May 2025 16:29:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 16:29:03 +0000
Received: from tiny.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 11:29:00 -0500
From: David Kaplan <david.kaplan@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 16/20] x86/bugs: Add attack vector controls for L1TF
Date: Fri, 9 May 2025 11:28:35 -0500
Message-ID: <20250509162839.3057217-17-david.kaplan@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|DS7PR12MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d1681a-a619-4c2c-1cf9-08dd8f169cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a7Ye9Jrak1ULAPG8/dv0g00Vv9xTiqOVVk78hDOphP22wyQJwZDorl3zwhfJ?=
 =?us-ascii?Q?NX6UjuqRILjqe19zxSqmnf+MHbEHl0Z4mBrv3qFVjwTVn9j5q1LuVwaoVU0J?=
 =?us-ascii?Q?RXBBWKZH+LbFKWgql7mwJlZpg8LkUS5zLfzM5yDma2KCbtQjwhGRdMM2lcdK?=
 =?us-ascii?Q?gmnT6wEq7VSKlxSHazgLyhoc4yAvfCna4bB78THiFe1505dv6H8Cow+wzewN?=
 =?us-ascii?Q?ujldixIwDPFeXXYCAG8kvUzLaVq5TUlhxfSkyamV1hraC6YHhLnljg637fgZ?=
 =?us-ascii?Q?mw1DoXJ2UY5XzRTTHcraWXNpwfth7c/HMA7jqImdlpYIGK3nOv02CVYb1btb?=
 =?us-ascii?Q?3WJPCHD2xzFG3F5hfZyBncpMsYWBm7RIT0HddiLoxpmhjKF00ypCRezcrYVz?=
 =?us-ascii?Q?Y3XnJkKafW5g1GstbJztfRa6v42srvh0i+6fCOFZKLcKNRHGYN4WjAgyiBVw?=
 =?us-ascii?Q?2t0dvN777FQOMbT1Nw8lYwvOC8LFSK/6W4vdF1rR+Lgy/+IysDTA/w8H+4FG?=
 =?us-ascii?Q?iJv28QqB5SJpNs52n3zWH6ij6Yib1ari8nW7ileiN7mMyrVyg8SQTqk34jkd?=
 =?us-ascii?Q?bslUhyIaCGE5c3kzSlUUyIicuwuMPzS5CI2DV81OfZEWgkZcP6CbqMqiXkLJ?=
 =?us-ascii?Q?IQkhHGvkGgmMSJv7iLkKchuwgrQ0xp7fiFyZFjyClaDx65Z2zKIJSmywK0Zk?=
 =?us-ascii?Q?Pp448TI4fv/H39/ztl5sQg3irfa3AOKPuXHsqtyhQS+7wpeOhJeyjnRn+Qvs?=
 =?us-ascii?Q?bMQnu5Ozy2xYW3IsceS4SVTPTTToz/Pzo0MFFDdR+MKzmsYFoxmeG9m5kgWc?=
 =?us-ascii?Q?d9tko/3LKfEI7pXDG6fzyibye5nliOUat+aiBpsoG5Oj4imCdM9V/08r7V2e?=
 =?us-ascii?Q?lIPu7kbJei1yG4rHVyQI2qmVXpudn1PcFWzZrVquAuDJ1wJi8FsOlH46+Udt?=
 =?us-ascii?Q?q9xShheFMyvaOilLSgGT54LEJlYlAr1goYwMSjquPt7nQRVT3Tz1zZ5Ttmyl?=
 =?us-ascii?Q?tHMLJqGV6tamirYjwOaQ1AC2nlDQd3cCybdf349jAUYoe4gmUfS/z1/YMGhu?=
 =?us-ascii?Q?vFXoOjozFv9MiBTlJPhKRN+lR5jvviUTKjRRYnfn3XR2LknyOSJo7+QGEnUu?=
 =?us-ascii?Q?AGUJn3R01psY9i/KteaTdJVGlc/epJtx+KJXLVg6uRJGSuzc0NH0l13S4Wpi?=
 =?us-ascii?Q?LaexVZpFFHxd6I+VygvDCcQUXpp4tOWXefx1OxLcYpmRWGPtkuZFy+Hhszve?=
 =?us-ascii?Q?9WDrHGGFhAIBg4qhBZCRN+l2YFx/AeQ72nKuflC2Ohl7mQtnltcP5xM6XWG2?=
 =?us-ascii?Q?511SaxCxvG1T3ZseF0tOx1ZoVQp3kpWJlqS+Msk7fduH1rWNwsl794l2bw6p?=
 =?us-ascii?Q?s7o3eK7cat3gYlpfcaz9HSy46/2texuRB0VYH01Bd2fEFYta7LTjawnrtB3j?=
 =?us-ascii?Q?LeWinaA4q3r9ey++NVYWJUYUy7ldSMuBzuM7VDdBaX2tpaWqDTquIrZsXOw1?=
 =?us-ascii?Q?dzSTXBTYEVBpSSpw2MnvL7WolYXwMblgW5N5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:29:03.7869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d1681a-a619-4c2c-1cf9-08dd8f169cbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6192

Use attack vector controls to determine if L1TF mitigation is required.

Disable SMT if cross-thread protection is desired.

Signed-off-by: David Kaplan <david.kaplan@amd.com>
---
 arch/x86/kernel/cpu/bugs.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 6a4bc80be1e9..19a176369b22 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -2697,17 +2697,23 @@ static void override_cache_bits(struct cpuinfo_x86 *c)
 
 static void __init l1tf_select_mitigation(void)
 {
-	if (!boot_cpu_has_bug(X86_BUG_L1TF) || cpu_mitigations_off()) {
+	if (!boot_cpu_has_bug(X86_BUG_L1TF)) {
 		l1tf_mitigation = L1TF_MITIGATION_OFF;
 		return;
 	}
 
-	if (l1tf_mitigation == L1TF_MITIGATION_AUTO) {
-		if (cpu_mitigations_auto_nosmt())
-			l1tf_mitigation = L1TF_MITIGATION_FLUSH_NOSMT;
-		else
-			l1tf_mitigation = L1TF_MITIGATION_FLUSH;
+	if (l1tf_mitigation != L1TF_MITIGATION_AUTO)
+		return;
+
+	if (!should_mitigate_vuln(X86_BUG_L1TF)) {
+		l1tf_mitigation = L1TF_MITIGATION_OFF;
+		return;
 	}
+
+	if (smt_mitigations == SMT_MITIGATIONS_ON)
+		l1tf_mitigation = L1TF_MITIGATION_FLUSH_NOSMT;
+	else
+		l1tf_mitigation = L1TF_MITIGATION_FLUSH;
 }
 
 static void __init l1tf_apply_mitigation(void)
-- 
2.34.1

