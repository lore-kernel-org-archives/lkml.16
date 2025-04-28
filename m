Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB7A20F089
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876613; cv=fail; b=fyg2wKzkrL8EnVyUPy97YsPU1b6gtTCCTcQt8EbOLwwsdU6ZObPzcxYyAuAuKgdgmdKYv/2wTA1U11lLnZjnNQt0rDIDuDlWT9OCZLuIUkOS0j9Tg2jRzo1IMPd712Ku8Y8VYDjayTaHBtSPbENCDQjcqQSt3aQWqCGRzT80ul0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876613; c=relaxed/simple;
	bh=FlQ3lElCZ7DsIEbyn95sRfjPKLHzs3oXdzq3ixDZGKw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hNxuJkLpMmG1GvH72qfBuOwFQQVPfo6iAzISjbJmmX0axiWSN6CDzlGD8mHihE0h60boRSLwPiqr7Utrb3M1h/XhW3gGjJKXAIedk6tzgjZds8NlcCrZQWev/GEmF80mae+NCdL30YHe4MxU3NpVCw2mm1jtksVqezX6zOz4TP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p2/NO/7O; arc=fail smtp.client-ip=40.107.93.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p2/NO/7O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRH8A5FEHIPKWeZ5tySX0yT/17JI6ncJtyi3Meu29sUc8INpa22qPTynqXDAimZtuGFvWEGGe5bCA60CyhunjJ1NGn/U4zj3cOWhAcsqdsfnKKMhh3TQnBANAF3TYuiPsO5JTc5Iog7oOnqdUuWTbEgAu+nyMpWYnu359MM/m5PIg37hdFM38M3TxUtE12IDiEjI2Jes/dXM7YQucRX/B2AUo49kjwYIGK6dLRMGixQF3fBe+HRluj0fldyIFYg69wmGICeHiuQyog1BxoYFHkE5ST6Uxvq2IIJW11TAlgbyId52+bPvfDZb8+DXNjEQCspgl6DGNWfQEiWVKTiy+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhU54zzTOKSqFg/kHyrHJLQK7Mm0LkmfsK7FCWiFXXs=;
 b=Aefj6+i/TQLzsvnkJW2nnKFwr8ZThjdU+OAR+HlgC/sTAv/cQAZynfuoHnu9s9TQGNMpn5EWpCIvY6Y6/vw7kr0gcpq2t5nWyJlKR9zzpGPY9DBlfrGhBLh0ncVDR3cVWvfmMd9GNDSqHFHAoAJgsK2rNXolyHi81cV2IsX4emR7FN5mDNCNde71xy/VvPsvlfXMhW+IrTxuBWj3SsNF5wnocTe7ZdPfKA9tfjNDLdtTq6trRL77V1yN9bnfgRQ/7Dgk7q339qbFj/64TrdORPl7W8UR61XXxMM8SxeX+GjdwddzlQTSZdPsZSk5li/u3bZBp6cnKkBaUw15l6NEVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhU54zzTOKSqFg/kHyrHJLQK7Mm0LkmfsK7FCWiFXXs=;
 b=p2/NO/7OruQemf2okkw58j4+3QdWhOojXcQUmPLg8oJNQtY0J+DLBr8EdNb7ZmJxL/aWuIi34Ge2IjRmn8V95qkEfrTO+GNc2e7DD0KHrlFzcNkbpwDaBqB2gWXNQU3VYYZ/+iljLv+O7UtXz6vljR0fOgWtS0hPtPDDRwZg8xKfGjBEM2weLkAdz+MPbs+KwddfB95CbsrONFKDzkC2Bp6khSo6E53V08Fz76AT8SZ+8bU4PDm4oxWfj6rU3R5MvwBgGol8MHTguXqSMiXvH85sHKkZPGQAKeXJlIlsPzCpJjloFdlIkdlBldxdA9hV0z33UeatZBMODyi3nECrxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17)
 by CY5PR12MB6226.namprd12.prod.outlook.com (2603:10b6:930:22::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 21:43:29 +0000
Received: from CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5]) by CY5PR12MB6405.namprd12.prod.outlook.com
 ([fe80::2119:c96c:b455:53b5%6]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 21:43:29 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] sched_ext: Fix rq lock state in hotplug ops
Date: Mon, 28 Apr 2025 23:43:20 +0200
Message-ID: <20250428214320.137576-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZRAP278CA0006.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::16) To CY5PR12MB6405.namprd12.prod.outlook.com
 (2603:10b6:930:3e::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6405:EE_|CY5PR12MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb80ba6-1a83-41aa-eebe-08dd869db688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Od7jX5QWHO47U+hlpCzTcJTQTP5VW4FrHEwdx/vbP/gGMNfvIBIUy1GF0Owt?=
 =?us-ascii?Q?rU8HvTYtnO+804HBlQv19at3wI0MP04vU48VCR+RDG0PiR6X6JsToPFijAl2?=
 =?us-ascii?Q?PsWBDM6O/M7TpJav47U23j4d/PeaLazk+KYAi+IXoxc4wv8t2ZS+MaamM2gb?=
 =?us-ascii?Q?0Knq1+HwycQ08PDyGv1/DDpmgAmbzKHDHi2/bjk8q1gSnpT3Yvq/PsNScQb4?=
 =?us-ascii?Q?JR24SaGUKPEeFWiQkxv0v8sFycyaebH9iVXYEtrKuey/baf1KgR1LRwPzmGQ?=
 =?us-ascii?Q?1xnOZsc/VpTJJ0h1aGvUpsA4Z+Euj/GcPPCNHcyEfgiv4UX6TflyFvfCqkhi?=
 =?us-ascii?Q?QisoUkhw+xXArhQkb5hBxVoP75AfJBUREoWuKrnvNfefjn9h43YMornS8JnA?=
 =?us-ascii?Q?tP8OIUdbt4Md9aGQtWvOZsr6CE8c1khDoN/JEjWJDkG1oCnMp0EIuwmtU66X?=
 =?us-ascii?Q?L7usSoDZpKnYs8am1/vVnlq1p4s4fMe//4KWDlpCGfRMBVY1YWrHnqoySuEh?=
 =?us-ascii?Q?rWm/DnAQR8/ZmSJhRrFdqmz2KFKW31e+bqBwFhwpvfTbaq4nmTDDuiy15JxW?=
 =?us-ascii?Q?OlkfuLHz21Au/Byo9b2DYsWhZMUzRlx7GLFLN+oXhPS24XhCaLemQGkNBLwt?=
 =?us-ascii?Q?SBwopgg8+mk9PZfVYQbK20nX7X4vd7e/ENNM7PyA7aqLXSz26iVJg3/cglVi?=
 =?us-ascii?Q?gBnTbXeDq6sRilnf7os+LH/h1mI42uU2U5XsFX3qNinFr7ViK0gn2V0PN6ty?=
 =?us-ascii?Q?216G0DqN65eFWCmGaiMyM+97EXDUrd7cn6ZKdZpVKUTN1NAsy0GI8usV6PkD?=
 =?us-ascii?Q?ajJMi4pIBChHXRulmz3901xokJJ7ltCgO2RrrObEUgAKB2WnOmztdQMPk4E3?=
 =?us-ascii?Q?YA5rvmhi8QFBTEXE2zfcTjBsqryEDjAG1qUnQf0Gxm+/esXqQZehAftdfXSv?=
 =?us-ascii?Q?4pcPXGWPV1wSEETOfvjckNkExSXb7S4ZvAkwavJUpa5qnUviMMMn0p/oRCxt?=
 =?us-ascii?Q?SxkHUxO98Rwj2yEFzuC7R4NFwy/mEpXC9U6kzbfOEwsMfPpFFrt/Avt6iefx?=
 =?us-ascii?Q?zmkB+R8UVZ4kn95NRcLfUGxtPA4CZHh54FBfVPt0xViS4RkatVy4SxKHbDE5?=
 =?us-ascii?Q?AxhadLcZPHWxrwejKxFksnNOAWdxqOHSMM01VjNPu4Aw70NGSUH9zJGeN1dS?=
 =?us-ascii?Q?m/YZRABHEVpKmM8wVeRylCZqp1LWALJzh/t1+f9IINHvm61dB8Hwo5P7I16w?=
 =?us-ascii?Q?JbbtfxL7hhJjySZSzG7EZovCuLLCzG0l2hklD6fgQ7D9Sliw5edaW6qXX/EL?=
 =?us-ascii?Q?YASKL1bkAjK9OshuN1nhvlqOYiXJRzNqZJedUCIdEkHdYKB8lQUAr+llwfVy?=
 =?us-ascii?Q?vvYsJCsFok6OXX9dNzKVBX+zdjG2bkAVmHQv67J8/PqNcLP3K8MeSz6AeY6h?=
 =?us-ascii?Q?J7jhOdqbByY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6405.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L7hjc1ZUoY2aB7b4HyxoLWR81tZMCiyCw1pUxyvHtuBA1NH4fprsnc66Us2Z?=
 =?us-ascii?Q?OOVPyd7bMvvuter/MOs+9KSPo2bNJGK+E3SuMaKU8uhxy6EaHD+3vTYH6STh?=
 =?us-ascii?Q?4124rjqveDxhsZy1E4LLP1BkBCBQtZCXNsXwKh/Jc/uYeA3Y8S6MNb5Ch34a?=
 =?us-ascii?Q?aE02VRgnGhKEmkFb3vEi/zYTnGnV4HcDGlgYI0c/u9MKCCI22V3LZ6FywheN?=
 =?us-ascii?Q?CnMrkljGBI1idp7rNiBaNyPjedaNLKm9heFjwJZmZsp4rAzE/TjA6KSKQcA6?=
 =?us-ascii?Q?cLaSG2I2zUtywosas/Ue5IEee/EFUEVGOTMXA/fz2cn9dIPgdwEiTiED+wwP?=
 =?us-ascii?Q?O/7AquPJ8JSB3dVkD1J/A7IGgg70TelMOBAwrOw3U3q22NoBE1H7Wt/3zeFx?=
 =?us-ascii?Q?26BaylTX2uYnUKfkE9TQkBgXBYE7LcsRHq/qSJ6NXv864Kay5d24MuH9AKyP?=
 =?us-ascii?Q?tGyv/jR9+aEZGiZOLrMj2wmu/rz7IH/1VMr81ivqBu5lSna2PtMjvISiDSXL?=
 =?us-ascii?Q?61Hwz4PmblkWaqyIaOuhKSp1raP1dpP/aL1CHfm6wrOzxOaLMrlhbZpiLpQd?=
 =?us-ascii?Q?8y+hS+nAy1S0eIzOF0T+bEBRojgOqMrN6JpJAdEFEx0CocWkawY9rSCg68mm?=
 =?us-ascii?Q?FFfYMQWLs3QoecedSmi1/O+fOqaRAwj8gZTfirxJq1wz33Ca0QdFTfu7cR8E?=
 =?us-ascii?Q?z7CZ+hmaFKDC00jEjGINSc8/0cP2FKhPRW6xYq3WXUqFspyokXWu3V0AULe8?=
 =?us-ascii?Q?0W1e/7ZFOGDejU3R1jBjO1tGzgE0iR9PVK8nhfVbV2XHRKKgExaZANM0gAso?=
 =?us-ascii?Q?LkjOZ150zavKDPvi3B98/1rteXfpokeUcsMnMSoh+D9aCvZ8O4QD5RQsb0bk?=
 =?us-ascii?Q?b7U643FF07LfOr1vfL80lO4v/Zi//a3PbR3TR8zIi8xAb8bkSer5VLI8t22f?=
 =?us-ascii?Q?mdLQ+sdpWvxesAefCgtwQp/IvWiNPzXKkP8xzj19YJUd3Gu6/Paq52KSvy1z?=
 =?us-ascii?Q?AK8X0RC7yq+AAg9GG0NynteKk6YbzpY8LkTu9//aFS5Eu7JALZhdlEpkY+fF?=
 =?us-ascii?Q?HhBEPthxSS4fkVJ6/pu/ACtwiDZJs4NxGZMnhxGDJrkp/jUejlH7y9g4CFm+?=
 =?us-ascii?Q?BORP2DpG03tThT+qoGFbJBOd1w13keBg9u1026MVemXn6xIrX2NdR1ITSMrU?=
 =?us-ascii?Q?xncgLdHYeQUz6HYHDVRq+fP1JHtwSxNaNf90bvpNsG2N2434kim0/UZQ+BHv?=
 =?us-ascii?Q?iv0zzq9eH3djPLzoEUYYIvbroufapqjnYnr9CzTuzW3kOybopy9fzgiDnwvA?=
 =?us-ascii?Q?mubkTn/LFN+LuObgOl9kwGiJ+JGNRONucZHXZKWuGre2oN5enxbga5dwErMq?=
 =?us-ascii?Q?9cRRr3kfjOGLcTk6SL61f2FR+3ajPXuGncKfOy6J2K9IdjoonRRhiwHrfa+8?=
 =?us-ascii?Q?nndq2Jk0ZVgSmTXjuzE67Y+HwRQji5rmIc4IuaO6nS7HrwmlElJExBITgh/y?=
 =?us-ascii?Q?vUg1vyLlxMLJLSUfq4WlvbjNHEr2FxNPzeU0afuiJb62KIDOhbujgw2AiVXS?=
 =?us-ascii?Q?iVk7nzbsrCS5Ev5DmvlmzL+j5oM6adtjTKwNPOjk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb80ba6-1a83-41aa-eebe-08dd869db688
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6405.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 21:43:29.4646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsXU7YHR07c5FDPnh/3kUeXxDO3fgCN42bf1GGYS7D0C1JIrBMayEyioMIyPOMvqjdV1/HMUlc+OYhYjxGsmPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6226

The ops.cpu_online() and ops.cpu_offline() callbacks incorrectly assume
that the rq involved in the operation is locked, which is not the case
during hotplug, triggering the following warning:

  WARNING: CPU: 1 PID: 20 at kernel/sched/sched.h:1504 handle_hotplug+0x280/0x340

Fix by not tracking the target rq as locked in the context of
ops.cpu_online() and ops.cpu_offline().

Fixes: 18853ba782bef ("sched_ext: Track currently locked rq")
Reported-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 kernel/sched/ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/ext.c b/kernel/sched/ext.c
index ac79067dc87e6..d0f40fd258752 100644
--- a/kernel/sched/ext.c
+++ b/kernel/sched/ext.c
@@ -3477,9 +3477,9 @@ static void handle_hotplug(struct rq *rq, bool online)
 		scx_idle_update_selcpu_topology(&scx_ops);
 
 	if (online && SCX_HAS_OP(cpu_online))
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_online, rq, cpu);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_online, NULL, cpu);
 	else if (!online && SCX_HAS_OP(cpu_offline))
-		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, rq, cpu);
+		SCX_CALL_OP(SCX_KF_UNLOCKED, cpu_offline, NULL, cpu);
 	else
 		scx_ops_exit(SCX_ECODE_ACT_RESTART | SCX_ECODE_RSN_HOTPLUG,
 			     "cpu %d going %s, exiting scheduler", cpu,
-- 
2.49.0

