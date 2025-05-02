Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CD8267AEA;
	Fri,  2 May 2025 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202555; cv=none; b=SAUqhk1kONmJeXikKEXI6FMQJd0AhkloOZPFLH9WNEgpHgIecb0jVYlC7c6Ez4xMtHdBpiJpWw0kI4WLPhjePni/p2HMRH0+9bTcBOro7audmu6xrzd4QyvIzN2zlf8xtY5abcsgVpo+607QNrP6ZECroqZ3kMZcncenG9zmzes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202555; c=relaxed/simple;
	bh=PLhj8XRRcFobgNY8IKrQl05mOUEVDT1ZaUSUY1pOwWo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TQtJW7YXSJ1GVobxFvlax3JXNnewtcWsWCfHf6cD1lY+BGVAiz5C1X75AbRZOwLCs0qSvQz07pyxsdc72N6RDOmkBJET8cOcpc9uR5UlYNbkwYHqUM+Rb/uKey5CmxLy3fm6RkShjoqbGzfWofTBowYOEIk6RVZaQhLe+5Wr2rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZpwrW6S1Mz6K9MY;
	Sat,  3 May 2025 00:10:51 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id A3514140447;
	Sat,  3 May 2025 00:15:51 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.77.180) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 May 2025 18:15:51 +0200
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: <devicetree@vger.kernel.org>
CC: <robh@kernel.org>, <jonathan.cameron@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <mark.rutland@arm.com>,
	<shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v2 5/6] arm64: of: handle multiple threads in ARM cpu node
Date: Fri, 2 May 2025 17:12:59 +0100
Message-ID: <20250502161300.1411-6-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502161300.1411-1-alireza.sanaee@huawei.com>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500003.china.huawei.com (7.182.85.28)

Update `of_parse_and_init_cpus` to parse reg property of CPU node as
an array based as per spec for SMT threads.

Spec v0.4 Section 3.8.1:
The value of reg is a <prop-encoded-**array**> that defines a unique
CPU/thread id for the CPU/threads represented by the CPU node.  **If a CPU
supports more than one thread (i.e.  multiple streams of execution) the
reg property is an array with 1 element per thread**.  The address-cells
on the /cpus node specifies how many cells each element of the array
takes. Software can determine the number of threads by dividing the size
of reg by the parent node's address-cells.

An accurate example of 1 core with 2 SMTs:

	cpus {
		#size-cells = <0x00>;
		#address-cells = <0x01>;

		cpu@0 {
			phandle = <0x8000>;
			**reg = <0x00 0x01>;**
			enable-method = "psci";
			compatible = "arm,cortex-a57";
			device_type = "cpu";
		};
	};

Instead of:

	cpus {
		#size-cells = <0x00>;
		#address-cells = <0x01>;

		cpu@0 {
			phandle = <0x8000>;
			reg = <0x00>;
			enable-method = "psci";
			compatible = "arm,cortex-a57";
			device_type = "cpu";
		};

		cpu@1 {
			phandle = <0x8001>;
			reg = <0x01>;
			enable-method = "psci";
			compatible = "arm,cortex-a57";
			device_type = "cpu";
		};
	};

which is **NOT** accurate.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 arch/arm64/kernel/smp.c | 74 +++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 3b3f6b56e733..8dd3b3c82967 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -689,53 +689,61 @@ static void __init acpi_parse_and_init_cpus(void)
 static void __init of_parse_and_init_cpus(void)
 {
 	struct device_node *dn;
+	u64 hwid;
+	u32 tid;
 
 	for_each_of_cpu_node(dn) {
-		u64 hwid = of_get_cpu_hwid(dn, 0);
+		tid = 0;
 
-		if (hwid & ~MPIDR_HWID_BITMASK)
-			goto next;
+		while (1) {
+			hwid = of_get_cpu_hwid(dn, tid++);
+			if (hwid == ~0ULL)
+				break;
 
-		if (is_mpidr_duplicate(cpu_count, hwid)) {
-			pr_err("%pOF: duplicate cpu reg properties in the DT\n",
-				dn);
-			goto next;
-		}
+			if (hwid & ~MPIDR_HWID_BITMASK)
+				goto next;
 
-		/*
-		 * The numbering scheme requires that the boot CPU
-		 * must be assigned logical id 0. Record it so that
-		 * the logical map built from DT is validated and can
-		 * be used.
-		 */
-		if (hwid == cpu_logical_map(0)) {
-			if (bootcpu_valid) {
-				pr_err("%pOF: duplicate boot cpu reg property in DT\n",
-					dn);
+			if (is_mpidr_duplicate(cpu_count, hwid)) {
+				pr_err("%pOF: duplicate cpu reg properties in the DT\n",
+				       dn);
 				goto next;
 			}
 
-			bootcpu_valid = true;
-			early_map_cpu_to_node(0, of_node_to_nid(dn));
-
 			/*
-			 * cpu_logical_map has already been
-			 * initialized and the boot cpu doesn't need
-			 * the enable-method so continue without
-			 * incrementing cpu.
+			 * The numbering scheme requires that the boot CPU
+			 * must be assigned logical id 0. Record it so that
+			 * the logical map built from DT is validated and can
+			 * be used.
 			 */
-			continue;
-		}
+			if (hwid == cpu_logical_map(0)) {
+				if (bootcpu_valid) {
+					pr_err("%pOF: duplicate boot cpu reg property in DT\n",
+					       dn);
+					goto next;
+				}
+
+				bootcpu_valid = true;
+				early_map_cpu_to_node(0, of_node_to_nid(dn));
+
+				/*
+				 * cpu_logical_map has already been
+				 * initialized and the boot cpu doesn't need
+				 * the enable-method so continue without
+				 * incrementing cpu.
+				 */
+				continue;
+			}
 
-		if (cpu_count >= NR_CPUS)
-			goto next;
+			if (cpu_count >= NR_CPUS)
+				goto next;
 
-		pr_debug("cpu logical map 0x%llx\n", hwid);
-		set_cpu_logical_map(cpu_count, hwid);
+			pr_debug("cpu logical map 0x%llx\n", hwid);
+			set_cpu_logical_map(cpu_count, hwid);
 
-		early_map_cpu_to_node(cpu_count, of_node_to_nid(dn));
+			early_map_cpu_to_node(cpu_count, of_node_to_nid(dn));
 next:
-		cpu_count++;
+			cpu_count++;
+		}
 	}
 }
 
-- 
2.34.1

