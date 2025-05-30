Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012069.outbound.protection.outlook.com [52.101.126.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4C31EE017
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748593580; cv=fail; b=JWXGa2PjVLeLTdfdVVa2CTbpTJUxAn8cMTBhbwpxDthHqIJctdMvZxzzygz2Wa85bDZ9JD/2ghY1myjHLhneKJOpSHne44Ib+bzOqNe98js51HQJMRHQY3fLZqra3Yl7OggGO5q4UC2QxF8IFvf25x9gCiTTejRWksLuOnh1D2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748593580; c=relaxed/simple;
	bh=9f4rCakj9b8yasks0C2JOuge6XVzx+tZPEscfOTCRX8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=PMQnEqdJfkrZwBqu6f0Un21zkVErmpEHpfCjmMaK9RZeCOTOdaUu4Ww22b6DtkY8hmTpmHcGGplRO893qztmy8sUHMSx081/UfglDKSjmO5BylShpnaISgYgOnFKZhKxLPhHauaNLq4dAuzR1zpiPJN+66w3MFSuJglCw/3hv7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=DqHFuOoF; arc=fail smtp.client-ip=52.101.126.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="DqHFuOoF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtosSpT+BsnNYbWV3C6TQYdI3yM+SvVEUvmhivmnTxe842bmXe3c00vZK6gFxhc3wRfux1S0QKzOZtNkGvKrQudX9oalGXOlSwpMVw7OC19UZ1o7I6/tqoOGi6W/QAfp2ssi0VkawJU9la4z1R5JZeIM3Aq0Xfl5RfwnBEOQOYUcNmLeR5Q6PdBAikbunpWrMncYmME5/RBzw2UEjHEZ63FOQ2KzyYeyBLYQ48lCVP+dC8hkiprv+GOi61TtPpzKi5RUxfu7t+/SE/EXd54tiv74PeIOHD5t1Am1kYe3bwUE8KACdKtydp9WjTWLAnkdiY0R1ET4GBfjfyutemOSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVQd4dM5rx3tVO7diiJbTp0Vx8DOhrY4j4psPouzaDo=;
 b=RClR/LMBx9dXw/Zn2JdJnIc9pWTPyxst2/PKZhJreRxGavLO4NA89HA4EJW7WROzKDr1sO0Gg1EQwmmZO1QESZsJIrxdbzeDc5H6pKPFvaZ69m4UENxzU9Mr3aNAQzniMpXI69ebTaZurgJxhCj2wbbD4aqu92ZWHWbhdMgOysSx4+eKZrPCUJSuY86va7tWjuGWXXMg/6FkIO3TbjVRtdRQXFJwW1BRS1sYwzTOR5eV0ntDUj4E3NhihK8KqH4rL4p6ySxxNMN6Zh1BoOjL64ytPfrgSYJ2MtRb+dYfEytURLKB8jUUj9uDoJs0wHVPaqoi0LTMlaeuvfZzV1lf+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVQd4dM5rx3tVO7diiJbTp0Vx8DOhrY4j4psPouzaDo=;
 b=DqHFuOoFdEX125n0taKcbnFrRINRJzdOfubvN5icJvVMcaK1Q0Z4lpre87zOCfQhdxpJ7u/5u2ROhwPzeNI6cIyrIYu6CMRYBq7jgUHFHP07nMPiIOFrTLhLNYVITpM4JqcvdpCiCiqHzJjWueKH8RSlX4SWAFjoBYCnDC4+rXh3ge7GfM8K5vyx8AqlkW5r7y4vFxOdlCE5OBWdP2RH4jey/yJlpkl1pw16LyM3xOIpq2uFnARrlAgaYe0FO2mMPb5/aD4blY+qWRjO4n0yIBb/DM5GMEdrV+TSW3c9eQ/xTM3KAJLqDsRGmhbKHKJyGX0ROenO2/8kNxcDR2louQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5605.apcprd06.prod.outlook.com (2603:1096:101:c9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 08:26:11 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::8c74:6703:81f7:9535%5]) with mapi id 15.20.8769.022; Fri, 30 May 2025
 08:26:11 +0000
From: Yangtao Li <frank.li@vivo.com>
To: hirofumi@mail.parknet.co.jp
Cc: linux-kernel@vger.kernel.org,
	Yangtao Li <frank.li@vivo.com>
Subject: [PATCH] fat: correct superblock flags
Date: Fri, 30 May 2025 02:46:48 -0600
Message-Id: <20250530084648.2434569-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0044.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::13)
 To SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 40461977-8e21-43aa-857b-08dd9f53a23c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GD3vnzUNEo0j5XTyDKjIDsbsIbtEi+Xkj2j6SOEZKGu16tusaEu17i/5Qnv2?=
 =?us-ascii?Q?46fUWWstGi7aDFrRLyCws3gH71DCFqCe+zHMo2h3A6Rn2lI6aSBMu0HC3HR7?=
 =?us-ascii?Q?EyuTusEKngIm6+I4bAI3KN0shILzDn2HZV4uyYD57UU9EFm4QhYamC8+9zRW?=
 =?us-ascii?Q?ORjLL+gzOEK6xnC5zECRjX32doaiE9AfEG754TWFgaBybEzEaUjSAdSha3BZ?=
 =?us-ascii?Q?eIvN7e9xNKBsvCmZ0B4cyjC2vKE9NQgM3Aq5oE+NbND+jXlu46cA8gJY+mHQ?=
 =?us-ascii?Q?uDRgr1Mk6sH+GjcJ7s4BpgSlzIiCU6z3J3bcmKrZ5l2SwRPmfNa007xrhcvt?=
 =?us-ascii?Q?Bvdn8JJqHIJa1T/lJfYGHN5TMNLmPXOqtyDMfIBOi4/dKrA5jiqfR1lmHM2G?=
 =?us-ascii?Q?A15x199HHwAujGBe7s9yuhDOK4+Ei/2sGwdr3soGShIfaMFsONO1ycfYqfR+?=
 =?us-ascii?Q?N9MZyTDwu0s7oZ9C/UJtxdL2HLV/aCpKlMP/w9T36jlaX9vD3o5G7BLT73bo?=
 =?us-ascii?Q?Iwn00EeP7t8dTMX2B5XsbapbuB+2zA+p9CMVu5Q/OOELPkngXgJYnJMmNTPS?=
 =?us-ascii?Q?Yfe4i9Wmc2fOrc+lKCRGi6k/k4e0W1/75AcnNqqWw4cuMIG3vR3lLulfqbuC?=
 =?us-ascii?Q?zlcpDhp7XaMu5nVfDu5bzwWywXIiJreUQ5oHQVzntQ1DvwDbBP1Z79ErQxkY?=
 =?us-ascii?Q?KEucatCWoezXRTLXRWhiqkQn8Hz95FFeN6yhLHWIVm99h7tLtcrVl8eW/VvZ?=
 =?us-ascii?Q?Hs/JUyYKF4Y/bRWsSQ6TSr+Z9iPM2mxBbrpzBJjoNqT5GxhdEIVbgWJEifuB?=
 =?us-ascii?Q?SKB7Flegxr499ETBpFHe6tjlerihJQZV/sTI84oBTg4It/JwiA3MTxgoeIMF?=
 =?us-ascii?Q?OjjLbuqV2Pmyjj/ms2LPqsYZIZFROdbUnffFW8gW3GuITHMNhGHHhnByMge8?=
 =?us-ascii?Q?xipRVku23ZzFWWqkF2W/qr4m/ZvWpR/IfXDcjQlpuL0kbWYcRILIk3gQWP+h?=
 =?us-ascii?Q?M4XC08WLQoxlzClmtg9awmyQ7iobV1FFhu5gDJ8dDpeudGPmFY/xRAq/bb7z?=
 =?us-ascii?Q?iLj2cHAOzIAsJt8slMtGmU6xrotf46ZHGxNS6qQUue/h0z+ZmGL89fDR/M9s?=
 =?us-ascii?Q?4Y2hse/zpGx84LIqapf+GT9c9TlF1IohXH0KS0ogfiYbMHsqcsJiZ2928OnE?=
 =?us-ascii?Q?Wi1k+9e+WpPzCSWIL/WU0QinUxkgg7Gg9v/ugLGBdUJcE0VGPrpKZ/G4kOKO?=
 =?us-ascii?Q?qfIxtALhF7cxVWyjh29TcrkdqutwZcDS9FZG/tBdMYJrmrix8jzq8m0K/d3J?=
 =?us-ascii?Q?iX9ofPYuLthbYMDx/4/GREcdnAoNpTrVYPlKswMwoUvHLlBytz3bzTPiCyJ3?=
 =?us-ascii?Q?ymmnrD2pd2AYb550bpkY4UHY9mu368Bd62Cib935ouMdKzDvRgtQzKabOzRv?=
 =?us-ascii?Q?KeND0sGZL9pf+q5nY4UeEnJMhuj7/frxoJzrUQk03fKa648rpv6AUg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?INoSYI4RoggaAztRxrSr7p7HHPxWnOCTqDhjPo4mvJUeoASNDCjvGAIRrlO0?=
 =?us-ascii?Q?9KHGl2bTFhjGZTOHvT7XZ0vwnje3RRvkvKpznqLMQjCDkYnBYDgeh3bZzy0O?=
 =?us-ascii?Q?bpnJwp7OGYk9vKSawYcIvZVXDM6byRP0Onln6mBIkX310oGMdzBDAaTew3V+?=
 =?us-ascii?Q?tjF0qhGh4tWnU33B3RWsxCrJdsICGbo3EX/S/l2faBK9ez1Z5TUZQssKbJ59?=
 =?us-ascii?Q?vnEwpLwpCFITrTJtKIjBbxf9RzIg+qDKMLTULNsAQa8Ll1iBaH7d1s+X+KYq?=
 =?us-ascii?Q?igQKe9hh7KpXruD83eW3DlvNoU0p87m+nKbksOVyNgpMs09sB0+eIvanBE0N?=
 =?us-ascii?Q?rVL+4UXXTGkr+8kOxVeXnseom/Xhn1F6izyL1b3iQcny8MhiiHrs8dADA3zf?=
 =?us-ascii?Q?bXbBvPYEM/wDG887eeU17Iorq4TzcqAZKv6zcMgjQruzgAAt6TYWge7+PsYb?=
 =?us-ascii?Q?dTUvzeFwTmqRcsW9IBtFGunPBzcmHH7sGFgrlbzITQ2MnVUbeHSmhFg7DjO2?=
 =?us-ascii?Q?s0radDs2nfb/sPaBOimz7v/CtzNoLgMmbc7LXrFAoA0XpK90bQ+JmIsbwxEP?=
 =?us-ascii?Q?h1RAUS0aahNuyXxMHDaQWMcPqoNNRbEDrnyvbcrILPTcBuXRYC0Zg+k2ihRg?=
 =?us-ascii?Q?Wwjd3F9vi2tyjGG873BsPgDfwa5LjAiNePQPgWXoKzxcp/cjeAn2ZRBDtdLk?=
 =?us-ascii?Q?IddO6DBEW02A/c1ogMWMx31mE4pE6w+S9hPHzoZZVZt21HgX8Fxs6qhggJFA?=
 =?us-ascii?Q?vlc161lId4qlzH5mAuzufVsr1yOqGa2e4LCay6KLOSTASnCkU2AwDbGHZAvg?=
 =?us-ascii?Q?/vZtQwvyLyVxKcuSxjdTegmt7VnxKa8rRQAfxEHKRudibGvrTtujLfJzYQQd?=
 =?us-ascii?Q?cQ3/ImGsBrced2KQ6bd8GIVXyJeSxAe1+suxVngT7tAte0w2SiXE2iiAzf5E?=
 =?us-ascii?Q?/qA+wU8BwxKz32ULn3JSE4mkGFnEQApd6QnNzGA86xRXhsa+Z92ECAEMhyje?=
 =?us-ascii?Q?yVdSloIVqhAvJxDQ820GgIUrgNsqkfHwYUkBn4o89jFM9cZzmzVHHcoF9hD7?=
 =?us-ascii?Q?n06TCNIuHf12A45nx6HrgP0sHGrXEDkV4vw6mi+GoMnFNjTfvWP6R/SABpFh?=
 =?us-ascii?Q?QjvWxaICgHQC4uTZHC2WyUJ9TAkPxxBx8g6MLle9mXDut6/tWBp2756XqUn/?=
 =?us-ascii?Q?QjyFicvvmcI6Y5XxhZ7pTpfb2Ydg/4yogXORh7wuPUFxRRTIELm7CGHIPXY6?=
 =?us-ascii?Q?JFtNLG38hHyGfDDZXfkNC3mZ84lvwp/bpkO77ZylGC8llXXWxunB3AO+COr1?=
 =?us-ascii?Q?J2V2en/HKHmcfpaCNS+Fyu9h8VXqMFyYTK50gJw1chL/axpY6fHOIoD9QhqR?=
 =?us-ascii?Q?MQZkl7cWN7yrYpUbHHhQAa1YVVpancZ/30kRGajvjtGXzgqK5c0nm+McPCp4?=
 =?us-ascii?Q?hFG8PJV+hhUOVGgzUr+oXgjpJnF64m9uULwdcGp4DNn7IbcDMgvErfzWhsfm?=
 =?us-ascii?Q?oLjnwrEKZPytthh3v5g06cbLXGkhdrse5C4+ybpcql8AbZlAL2v3YZ7jdWB3?=
 =?us-ascii?Q?KqvpHNcXII+rqXf9DgnGdY/aXWhfRaAf3b6nj7Nk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40461977-8e21-43aa-857b-08dd9f53a23c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 08:26:11.1978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwyivR4fZMjjhNQ2s4K9ack/O3M7CpsfxWTCSTP58DIp8TqhjXUs+KXdGJhUnzPlqI60SNGw/iS88Q7qHlbgwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5605

SB_NOATIME includes SB_NODIRATIME as a subset. Therefore,
setting SB_NOATIME is sufficient to disable atime updates
for all files and directories.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/fat/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index 3852bb66358c..5da96c37386d 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -807,7 +807,7 @@ int fat_reconfigure(struct fs_context *fc)
 	bool new_rdonly;
 	struct super_block *sb = fc->root->d_sb;
 	struct msdos_sb_info *sbi = MSDOS_SB(sb);
-	fc->sb_flags |= SB_NODIRATIME | (sbi->options.isvfat ? 0 : SB_NOATIME);
+	fc->sb_flags |= sbi->options.isvfat ? SB_NODIRATIME : SB_NOATIME;
 
 	sync_filesystem(sb);
 
-- 
2.48.1

