Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DF413B2B8;
	Wed,  5 Feb 2025 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762671; cv=fail; b=DONd2gC2yzdGgp+dcyntdEvbIKZ39tgbWfLGpVJ3cF+O52tVGdDG67ZIOHUhcLk9vlR7uHuxFellIyziLOwLECiVRrKDRndZ6M08559kkWQla822Ygp/YPURljE0ql+GhwC5LbS75WbphB444+DDBM70Kr6rogTEKvXeg0PdG4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762671; c=relaxed/simple;
	bh=u3Bt7b8J5xDxo+54EiW/CtmeF8znh6hAPIvNzGi1wNw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=clGJpf9nV/8eaneijLzqqDCmWrgg87l+/yoTP7qK87wE15Googo4Wgc0jlePHK7zGvpVHxDArRhcNVKOhi/UHuGyCa8HbqtOGMGMyiZ+OuPx+L9GEWrFF3WYRZftsbVhs1Acgj8FtCIz9u/wr8QEuKL43cBEzJhp0+zjo8/Ug08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3ZdJJB/V; arc=fail smtp.client-ip=40.107.94.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3ZdJJB/V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5cx7NAB1zWkCpU9/Qv7r7ju+5t1TDAHzIhc9Lum5ZtamKf3ENW7pXMfzgMOBZ4I2QcztMwkMnTk1e7RmnCROw8C5GX7LoEW6aybGhtH+gonxoJQ8zuBafgyB24UYwCrSWpYdjDsivemfxZyUy3Sj09ecTWQhQzkr8Af/OohOPqw4Ukh7Spdvl4CsEC7Q8uLfVMrO0GiWUBPrO0bCoACYjKj3jF9WLbsgzxfMmziFYmiVMvTkJo1KpmA/nHUy5rG6xULOnz9fyj6jbdDkqP5603899GsLmB7xz8AHOTBcvca8Ha5cfh/L9nrtHfeD/1gWbYdWXidi5UqYtiW3A8qGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yObSJOw1LqKBf4W7VNzSzL66WNn1WJS2eGn+hE8X68s=;
 b=pR3AJOpseiqSQgniL/9dJfBm/LTdgYrcs+6MBE3YKeFdtRBKheSC5FuE0MSJC4gWyO2WOCrXueS3LLtH3JVTmp7HE740Ae7udp/JJ5Q15ZWjvNQDjlrhFhrffF65XFxD2NLwBuQEAPMObqwBHe+rY6xqyiZs9IAwfbpEJjjMmdF4qxrvn0WWvo7rDDYZzVjUpkF0Oy4bvB+Hdloc5cCspb3CEEDBLr9deUtnLKw9tPhnUM0vzbNv8eyF2EmJYmBMuXnYbjLvdGohCdTfHo7yOwD8HGG6bNnMjjjqhI2b6/mHGw46Qc8szTtV2EgKYV7/uDDRcmB6ZRzxfgOFDWqx1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=bootlin.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yObSJOw1LqKBf4W7VNzSzL66WNn1WJS2eGn+hE8X68s=;
 b=3ZdJJB/V6Irb3ZTk6+qPAuyuPdDsgPOWvGaoGYKJtx5650ubrpEzJcxjjEHT0JZdTc+fi3rFYnGIO4iqoad1nyEb9hsvW64Obxt6znuLOF5LJkZhXpxA8iYAMUNuoa426k1S0vj4kfz2DXgM9kRmO4oGRE8WJgmv+fY6gvlEwRw=
Received: from MN2PR01CA0058.prod.exchangelabs.com (2603:10b6:208:23f::27) by
 LV8PR12MB9418.namprd12.prod.outlook.com (2603:10b6:408:202::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Wed, 5 Feb
 2025 13:37:42 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::e3) by MN2PR01CA0058.outlook.office365.com
 (2603:10b6:208:23f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.27 via Frontend Transport; Wed,
 5 Feb 2025 13:37:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Wed, 5 Feb 2025 13:37:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 07:37:41 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 07:37:40 -0600
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 07:37:36 -0600
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [PATCH v12 1/3] dt-bindings: mtd: Describe MTD partitions concatenation
Date: Wed, 5 Feb 2025 19:07:28 +0530
Message-ID: <20250205133730.273985-2-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
References: <20250205133730.273985-1-amit.kumar-mahapatra@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|LV8PR12MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: f9aaaee9-2829-4150-c608-08dd45ea43cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J9Helc6zmA9V7Ep22rHUvFA4hzrWPwMbLcZvJ76f4UMt5CDsPucWo62SEuCG?=
 =?us-ascii?Q?ST9NYHb0yZsY0PJ7S8g02nOezrXWB+VG9nAuvPt+UxyJOjNtQh4KThtHGq4c?=
 =?us-ascii?Q?Df4hdx+X2FkDaj6CjZyHPRkMrJpMUuwV2x442gTa+N8XOL966p73HQsEtq/E?=
 =?us-ascii?Q?F7V0N6beq65/V+Eh/Xysv6FJAU2fBws+grrdmBjfA6BdO7RAm3X8A5EajDc5?=
 =?us-ascii?Q?f9jvMUIVo2CfpEnJzHQyZQ+4HYVLWx6BsevOIajVyS+aFCyzfcqfzmAFz0pU?=
 =?us-ascii?Q?umy9MPFE5dqerEoH6P+1sMFYezKxoEUyYSwh0px6aSgFUlL4R0Iswrx37dB2?=
 =?us-ascii?Q?s0u+smuxpRoSQPlMaRvN8GcKDWh+8W65Be0SnYD19d18/nOTSsrZcvHRQsgR?=
 =?us-ascii?Q?iYqPSn080bl0sDNYJaJgi5FQdK990L0L4Q7MQ4OyIXpmeuy84LyLZ2T4W5Fh?=
 =?us-ascii?Q?XBUS/P2FuL+FMs4RcggahF96l/KETRtYAxvs3oCT463cK2m/CTbo75FAgnRA?=
 =?us-ascii?Q?F1oIxkF5l2WXmNsvGL/xmUAwk/i8F3DMk6J1Ifr7+Q3u+/P6OwlkFJgl6nQo?=
 =?us-ascii?Q?bNyTeJ1fiY7k/1wQTu1ev3ZBoeMwSNTdnO+9CakgK8a3HEWXJ6l9JZGCZD4p?=
 =?us-ascii?Q?SbjuUBUuIH9KAjBW2onK43bGG5etde0AY4LWfQ+4u6lEVIthZwYP4RndLcpL?=
 =?us-ascii?Q?lcPILUNmFoZ8gS5ZpFNUtwrF0REw/eU6NxFOpyXJgJAwL+cIBDDK6AiM7uYH?=
 =?us-ascii?Q?z6C17owFSaow+uyfJAqotFU31Kw3kV/ODZ5RVTww+MFJYYi5bSy/J8QoIfPd?=
 =?us-ascii?Q?VqcGfsMsRkBJ0eb9X0Sd6CuGwUiL9/G75KiMeO3G8Qepk3IT37esBr1onPez?=
 =?us-ascii?Q?pf67MX1j66jsHsRKRY127jTNElllBQUht2UsRGjCdwr5/8UBLeR7fBVZhBc9?=
 =?us-ascii?Q?KfRSMaCqzX86sINljuSuEuzQBDJkbEATuTZTKrkamad4RXfy41pmBrV8nEqL?=
 =?us-ascii?Q?YavyS7F7l86oNOvJDTPzMtKz40UEW0VI+n7MK9jYzWXDTX/D2g3Zlz+UZNQz?=
 =?us-ascii?Q?DvpuLjyA399eRD68K5CXv7Opqzhdg8tS75OCU9W5zeraBWU3hXquFeT7S38P?=
 =?us-ascii?Q?z7MpKvO8ZgvkOtCScnEOgz78HHpNqkNcP8OnIeEoMYGTJJxKdB0l+QoQS0zM?=
 =?us-ascii?Q?dewUAEJCFdByPoqU83ysWV7lBbbCgml++Dejk6ao3+pltdMiBHOvDhohbd0p?=
 =?us-ascii?Q?3jM+TjXfmeK+oXcE7XzXxDVwjzWkSfBy0TtpG4UrPBHKSkyFttF+1YY5DQSO?=
 =?us-ascii?Q?9KdKsQ7U4VGvN7y66POZqNpXeyV8Acsg3d4gUQEuqWAAHwAtBcWaI5HmgDNa?=
 =?us-ascii?Q?+jS58rH8FifP6hrIDWTfebEErTqRkBJhqGRAhCA19HWHf8deIKLShGChBPPE?=
 =?us-ascii?Q?RAXtWmtZUDs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 13:37:41.8207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9aaaee9-2829-4150-c608-08dd45ea43cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9418

The AMD QSPI controller supports an advanced connection modes called
Stacked mode which allow the controller to treat two different flashes
as one storage.

In Stacked connection mode flashes share the same SPI bus, but different CS
line, controller driver asserts the CS of the flash to which it needs to
communicate. Stacked mode is a software abstraction rather than a
controller feature or capability. At any given time, the controller
communicates with one of the two connected flash devices, as determined by
the requested address and data length. If an operation starts on one flash
and ends on the other, the mtd layer needs to split it into two separate
operations and adjust the data length accordingly. For more information on
the modes please feel free to go through the controller flash interface
below [1].

Introduce new DT property to specify which partitions are concatenated to
each other.

    flash@0 {
            reg = <0>;
            partitions {
                    compatible = "fixed-partitions";
                    part-concat = <&flash0_part1>, <&flash1_part0>;

                    flash0_part0: part0@0 {
                            label = "part0_0";
                            reg = <0x0 0x800000>;
                    };

                    flash0_part1: part1@800000 {
                            label = "part0_1";
                            reg = <0x800000 0x800000>;
                    };
            };
    };

    flash@1 {
            reg = <1>;
            partitions {
                    compatible = "fixed-partitions";

                    flash1_part0: part1@0 {
                            label = "part1_0";
                            reg = <0x0 0x800000>;
                    };

                    flash1_part1: part1@800000 {
                            label = "part1_1";
                            reg = <0x800000 0x800000>;
                    };
            };
    };

The partitions that gets created are
part0_0
part1_1
part0_1-part1_0-concat

[1] https://docs.amd.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Device-Interface

Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
---
 .../bindings/mtd/partitions/partition.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index 80d0452a2a33..f77fef368211 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -57,6 +57,12 @@ properties:
       user space from
     type: boolean
 
+  part-concat:
+    description: List of MTD partitions phandles that should be concatenated.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 2
+    maxItems: 16
+
   align:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 2
@@ -125,6 +131,7 @@ examples:
         compatible = "fixed-partitions";
         #address-cells = <1>;
         #size-cells = <1>;
+        part-concat = <&part0>, <&part1>;
 
         partition@100000 {
             compatible = "u-boot";
@@ -138,4 +145,14 @@ examples:
             reg = <0x200000 0x100000>;
             align = <0x4000>;
         };
+
+        part0: partition@400000 {
+            label = "part0_0";
+            reg = <0x400000 0x100000>;
+        };
+
+        part1: partition@800000 {
+            label = "part0_1";
+            reg = <0x800000 0x800000>;
+        };
     };
-- 
2.34.1

