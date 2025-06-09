Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9639E182BD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486235; cv=fail; b=jr0xHqsBnlz9V2sOfhwczMetwi226Z3qrn4tpOxO9+2emw04kAjomxRGb7NmIXgz1HDeMLaeXrH30i5v8C5uxsauC7oZVrdSm1u5ND0V8h/gSNSfyilbHD+tM7A2X/KHtGMJn3TnHCilRUl9+sN5AQxkrVFM85GB33NdO/gKL0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486235; c=relaxed/simple;
	bh=bOap8wAMjkY7h/oGARQS8BtPhkiH81BvfQk39sT+emI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=T3l2CnPMk094AT08amPoWOTwNYc9B4jkgrrYJ0DvCSVoMSPk42zfJhQEjyw/Z8/jM5olpvc7LH9MnLh/EHylGycFbGZd08NopvbOtuP/Rijj3uwev1Yw6a/5qzpCrDbp3Nq792i4lmxz0oy7stfRCJOqjYfogWV9QhlzfNSg0Qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jHxyue52; arc=fail smtp.client-ip=40.107.237.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jHxyue52"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yijqfc6uRL0SeIpnU+L2veCNcDRrFZH2m/AvoRBkIOJOvVNz3+sLP/oDiP1kWbp+hdRyvS4yXayqn3p98yucMCaCTEjM1YtBXSryZtokXW4LBAIjrJcOzG6KhpLKHe1wqwJRLBftQU6FOl4QBePfpOWz22FJSyh81CPf3o+7kSY0I9qV1AEZKABRNRbPdiTFPmtkSljwUvsA8IcVttS7NoeDrKkq6m5lDbO+OBeSPwAbYt/VP2LgI5yiBX1AQLLbolmDuuGAdR3b1mllD+YptaqbDsj2W+4pjE9j3OakpOg1h08SN0MjAZRXiYsi3XGdF7qLb5z5BlE3uAuxOvHXHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U13JxR79iu80OX58oWfWNXFwBMduKW/auX4zDGW7Sno=;
 b=vGnMGBQ+2riJpLdjTK4P6bx0qT4Zcsjm8RDi0/MJKOSH0okdRpJUTi2pzJmAWww0vdHXrN6S8iHkmYu9+xgHdIMxHmi3nXAevhFb33rwGjqkHQBu26d/0YT/MFJt6gMLyxTRwYpEsrcydN0uvQ+8qwtF/265h5Ea46V6QbCkn8YgWDOf8UpHyOuW1mCwTA3X0nFMaoTSZncwcLvcU9vmdNICmpSHueFy9/QiMQZ2w6v99P8433JIBwZy/jF4BUS6N6UNJoD+7aW58PZ3+s+qe3naEgfRpu7NOW0k5FMUhbQiY/eWJqkD/zcI3QzFIBzYFIj/ZvepvO/JqRSULsdC4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U13JxR79iu80OX58oWfWNXFwBMduKW/auX4zDGW7Sno=;
 b=jHxyue529sRDWs9RTFMvvTVhaecgNWyYu4U1Cq45oWNYTLloyS/iVSxg2nH1Iy7hSdQXmYV1gg5WbsPGQeWldvD0o/xEkvV4C5Hv4S1vU7viGSiZk2KjXUu3xIuVvVC3qYHX82NH7UV/RJgW+ZMJDjganKHSy6BbaZzMj4IXbzOfHnt/eTlw3spvdQzVWVIzFSaduvV4k+/boKbQmR4lGnqlKzBaB/OcY+1kKd1/O4BZsN/gi74AS/G70sXa0G/dkBwz1kAy8pIC/Kbv21O5x2Fp1aDL/sllHnLh3x+T2u1i0NtPWKKOuwJzt4O1xVGanFbNYj2E9WS7zVVVzzyW9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB8570.namprd12.prod.outlook.com (2603:10b6:8:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Mon, 9 Jun
 2025 16:23:50 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%5]) with mapi id 15.20.8792.039; Mon, 9 Jun 2025
 16:23:50 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Tejun Heo <tj@kernel.org>,
	David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Emily Soto <emilys@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched_ext: Documentation: Clarify time slice handling in task lifecycle
Date: Mon,  9 Jun 2025 18:23:42 +0200
Message-ID: <20250609162342.18790-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::16) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB8570:EE_
X-MS-Office365-Filtering-Correlation-Id: 186f9b7b-9f7c-49e1-5652-08dda77204a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lQANLnrwwEE4JDB6L1kUQ5WarQneoXdI/srNHx8fpp0UP9CIPisNwwF0yKcW?=
 =?us-ascii?Q?hZWYRzVnGh1De4bbpSLMHi6yLAer4JjViePaCfBUtJSUJG2MLiyOn1x/ZZgf?=
 =?us-ascii?Q?SVJ8pQoBVn3z1bKxSnwSEieF727oFvmvCos94/NcxZn3JacFvyPlKtm/0WkO?=
 =?us-ascii?Q?Fj7l28JwqfRmhwECm+PXIjU1JjybiSbW613+M/l4CEtBPZiXMPuRoBl5S4Fp?=
 =?us-ascii?Q?KARMB2yPITy0rqmh/72KXn6u0HX8n3GW7weyE1/GUxEbi7kjBFyT9fbYf7/K?=
 =?us-ascii?Q?mHel5U2bLCwBqRD8BesqXLxTlyF7mpBDTbuCMl/pPSgx/8ghrmX24LWtF0OU?=
 =?us-ascii?Q?puPeArrunftxX4Vq94cPcMoiozSLXA3+x+9RMSMXqkvgxDOcTClDsUnrnO5a?=
 =?us-ascii?Q?4DGYq1pOJ5eSRS5LLUT9IVzLMoSST80WKneZQT2cP3LPQQQVn9Q4Ihbq5IHq?=
 =?us-ascii?Q?bob0kTEO4ZzqBzPv6gxaW/nJ3KspUZGJi4fMzZrvYB4/xitI+0S8rp0LoljF?=
 =?us-ascii?Q?HEJJfAakwwavn4YFIRbUjjrq4PVz1y08qga9uAdq1nUnlFKQrNyt6qupEpzT?=
 =?us-ascii?Q?VHxOVuV1aN87OTC98dxMyC5dLQ5g8XjHoHutnHkaEs0MSwJ8ms64oFBsb8ZF?=
 =?us-ascii?Q?vig52j+T8fapI5X3V3/m1/6Mil+5r64jG+83Uk4VbIH6Mj2VAMehMYAilQlL?=
 =?us-ascii?Q?bU9B5waUEVlS8GFEC7X0BFUt5yVlunp0lCPcEm3DZtO+oQJhHzK86IUTerR8?=
 =?us-ascii?Q?vwisi214F93QtTlMgsItxKZLfkGrjn8rI3NOgzOyQ3pKmvFDIpPKHdLD7K4w?=
 =?us-ascii?Q?GnyOkoLNXdve0rrNxzoBWikAeYo8hwJiKb17WBjrtv9upplYZ9/bgKv8P1Tx?=
 =?us-ascii?Q?vmCJAz1a1R7OIguRRtt+Kzzw4QRnHRHl5wrpraHHvmzCecj0Fa76olPZfeT7?=
 =?us-ascii?Q?g03tkQkZ6fzdlbg2rnntS5jDKpHkKl0EKcFrugZamJrZ3zl9MWPjWdB0HIZB?=
 =?us-ascii?Q?JlD0t+GsI6KEMDUdGMadzkhNdba1xqESxeYnFncwXhYPnv89ZEWRiw/+9JaZ?=
 =?us-ascii?Q?zaDxgoYAw0B4KYQOLhR3APKJKp5TdE08qpEjO0TBGF8D11cSZIYiRmf08sbs?=
 =?us-ascii?Q?bBfyDf4dVmF1APK61KIeABANYH0QK7Z/JNXppW3zrVf8PCSBr9IKIaI+Z1ZU?=
 =?us-ascii?Q?B00odzo6w70Tmf5vtmEAyYdLlBdGFvXleU3ZqpSIhJxPkuFERVfX+pZijOh4?=
 =?us-ascii?Q?0AKVn7pjl4FhYYCur6ItoopPNnJg7SV9SwGBMDI+3it9xuOMU6A4ZIl/2gyH?=
 =?us-ascii?Q?bYOh9/y98djCflMIfybZUyn68bSBbaU5RE2pEAfWhWOQQeP4NXOkFZphcYCr?=
 =?us-ascii?Q?W80L5V0u/uqLwPRnGffN3WaYk242O3WZq9V1A2C0CLuQpW7yWxhu+3qRG2B1?=
 =?us-ascii?Q?TqcQRvbZuSY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZVtlhFxewUzYLrzc5mn3pcIYwtjwHBI8owBjX0CfTZ5uJ+RuWnj9LFuGnLpT?=
 =?us-ascii?Q?bJsXseTlVNcMFPRIufqQ4iIgwTlAlGVsJyqWAsivHCQR7QdelAZ4JXvSZ22Y?=
 =?us-ascii?Q?jEFb39yCf9N6lxhC8YkQgNPEr5VZEF9sN/N3EqV84wwZFe7Y7pzCmz7HQBID?=
 =?us-ascii?Q?kFAb0gRp7Zx6XYe4q2PVcDyLajQnamFGMWeK5RcOEOa/rpssU5j00BgZxkTe?=
 =?us-ascii?Q?in7lsJl0uGQza70brbOZ06p/7B/j94FpbCQ/UIB4o5RfpCHQDqvX7ZtFY+Fc?=
 =?us-ascii?Q?KK9rlYQmiiBo3pj/TXHcqLGL2s4kDS3XJW97JxsDM2myEQr3QWXbVQMts1XV?=
 =?us-ascii?Q?L78xb/DGjD9cBbIPRXXU+5jlDkPelDEZ8YiEQd5I/CzHFzyO5WVnkoesVrSV?=
 =?us-ascii?Q?rzoCbxEQJ5ECU5aBxhhrDy2LeO81DiPAAH9RTGhy0tIkNQxOi/NyW2myaQmB?=
 =?us-ascii?Q?6wQ5PIj+AgXraglSGbypJaraUzMkFrPaNLWRtiTwtNcFtP5S9i9GtwnCuwJc?=
 =?us-ascii?Q?4QaQ5jpC5V6oHwQYyewyHqTADXfF24IoU074D8NzSWde1l2ozpz8zXPOCRuB?=
 =?us-ascii?Q?pI8pxQSaZ4pszkms+e8r9Bh63xz+FANkjrFBYbOGvorKaCxcAiTNZJ4rgT62?=
 =?us-ascii?Q?Om7HdptalpqEgFmk1Ks4eOnTt3PXy3cHZlkC5zbh2cjc9FH1ts0BrG06GqJK?=
 =?us-ascii?Q?YEtWhIZsoEAgq+uZniPDyZiOSmDDa189R7P0jCdejPrddiGlfNjjOwoDUCo5?=
 =?us-ascii?Q?cU6Z+QHQtejXmjhh8iLxrrxc3DAsYRGhcH2EnTLlO1tWdmRNCiNXjrC5DRpt?=
 =?us-ascii?Q?qiughZGdR1fIMigsM8fs6LLr9jk0YHovc49GMBP9HzZ5VlwlCRmKbu5FmI4x?=
 =?us-ascii?Q?qURcE6kg+1moy88QWjrr37VAnstrlc14aueXo/hKOI/EJnWd/y2MHp/KpgNN?=
 =?us-ascii?Q?13peozsH7fVRee/q18UqUPieDEOTWxyRP7+LQKEwCAOw6zOWGcQFHYXVRXdV?=
 =?us-ascii?Q?7I71aezLB8AdfUskO1vt9stBT6kST5TMnLPSWk47yNnv2nZFg9qS/Wf3TT+6?=
 =?us-ascii?Q?nmcyFUvhFIUn5NAOC69TWVMaVWCT+H/RE2qyMuQoUYgaaQU4fj3fXFq14blC?=
 =?us-ascii?Q?CNAOf7HQ0NjnQfR/5DWXCTEeYP5yI8wDvyOXLtmyDAtUk8YkgYmZuvM9FJOp?=
 =?us-ascii?Q?FoNsG4S03xdbUsjUJsyb1eMNs/BaLp9qknbnBQtVSJP9g48SZtOIfEirRvjQ?=
 =?us-ascii?Q?BXRwvCjCWbDECknHvmoDy5M3ZtFy9BTt9rBi3bs2AbgJ46b3MD9XPV8Lr1wi?=
 =?us-ascii?Q?GxO+LYoSsbzqOrcFrTFBeumSADZGe0aDuxgQ3E9MnfCKh9JLxGfKGhy/koFZ?=
 =?us-ascii?Q?aq8mfVebW6G+TEzX3+hOg3A9dQiC6H9BU9lpbY7sXnLD1CL9baKVs5fsSOlB?=
 =?us-ascii?Q?M1ROY4Zg/gOm3UyvYy+c+9U02ioD+PyHq8r5NNMb6aOhdq7OO5GB0ndn9aQU?=
 =?us-ascii?Q?VTHrtDgmqcMWCuvjj68sTKhmZOQhOL1aF9DiydEf7cMeZsZg3hNRRep9q7JT?=
 =?us-ascii?Q?0RLHlTqJQx+Nz8u+Li+FqV9rNPI0vygwqC4TSde0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 186f9b7b-9f7c-49e1-5652-08dda77204a3
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:23:50.4518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGnzod1ksBXWZAg/F/QXNn0Qo4xTpinlXWvhO4Q7HRE51K6WpZGPOf123VZmRJHKhlqH1Wj/z8x9l4lLXUilVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8570

It is not always obvious how a task's time slice can be refilled, either
explicitly from ops.dispatch() or automatically by the sched_ext core,
to skip subsequent ops.enqueue() and ops.dispatch() calls. This
typically happens when the task is the only one running on a CPU.

To make this behavior easier to understand, update the task lifecycle
diagram to explicitly document how time slice handling works in such
cases.

Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 Documentation/scheduler/sched-ext.rst | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/scheduler/sched-ext.rst b/Documentation/scheduler/sched-ext.rst
index a1869c38046ed..404fe6126a769 100644
--- a/Documentation/scheduler/sched-ext.rst
+++ b/Documentation/scheduler/sched-ext.rst
@@ -313,16 +313,21 @@ by a sched_ext scheduler:
         ops.runnable();         /* Task becomes ready to run */
 
         while (task is runnable) {
-            if (task is not in a DSQ) {
+            if (task is not in a DSQ && task->scx.slice == 0) {
                 ops.enqueue();  /* Task can be added to a DSQ */
 
-                /* A CPU becomes available */
+                /* Any usable CPU becomes available */
 
                 ops.dispatch(); /* Task is moved to a local DSQ */
             }
             ops.running();      /* Task starts running on its assigned CPU */
-            ops.tick();         /* Called every 1/HZ seconds */
+            while (task->scx.slice > 0 && task is runnable)
+                ops.tick();     /* Called every 1/HZ seconds */
             ops.stopping();     /* Task stops running (time slice expires or wait) */
+
+            /* Task's CPU becomes available */
+
+            ops.dispatch();     /* task->scx.slice can be refilled */
         }
 
         ops.quiescent();        /* Task releases its assigned CPU (wait) */
-- 
2.49.0

