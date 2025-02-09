Received: from pv50p00im-ztdg10021101.me.com (pv50p00im-ztdg10021101.me.com [17.58.6.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA91DED4B
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739105998; cv=none; b=rOgUH5XMRsMleQe/2fd8hIX311i7+rOOGwuhYclzEGNBn32pM8DeSw9yVH2T91yhhTYo4HhTKXJDVGiWaZb3xJTXYQfaPHrUk5PQRoaV0Gg/gAvc0Ask7ITx5hutAnQcloOt4kMO398xsWi0klvfgFMM6cfZ/Eijhu+dOYIz2n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739105998; c=relaxed/simple;
	bh=0aCwt7elpHi7M64sqIBz/0dFie5skxQUze/5Nt0qt+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KrW2M8h6D+JE+qIlWrGBm+eCuedtWXsoawdUNQ/vX9/crkvDgAbnZ9eQ9FEYfSPztbPye3AvcxpbzS/ZI93KZn7M/eBNQ3oOtFdhSxihFcAjphLDtWsIU7k2gQvpHjxttxnIERWNpt+STnYtQLGrMJdhygJ2jIQHfelWGtlFKB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=UyHE03fA; arc=none smtp.client-ip=17.58.6.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="UyHE03fA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=P499tSrXCSXauiyeO8bqq59+i6/Wf1NjTlpVK9TVwxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=UyHE03fAg4FMLx+03ZJUgfyeSTAE24mUurXMKaRY3as4KhO2BqjDKW5iK7Kh4FbbF
	 GicWR5x1dkm7Z3DxYfkqXqBWLdreZMx0FcyA9iUgQBwqcDQ0rrcV0NvBWBg6IK7Ts6
	 ix0mjzml8kEKGOJh1Dh3r5rbOMQZh4utdY6EKG3SiOCeUuRaK2pwjeFkCQ6kDLcAx8
	 8Qkj55K9/f3uR/85jxsmEfjUmlgqhl/4biKRKpdLjn6JexLxrK7K5L9Cue3QAz1qAL
	 5FJJK+ux9GVXrM2n3zEJ2jKfwTdC5P7l2uzcCkALKuDL1HUOd4WyixoRHdvo/EIPaM
	 H5w47wI1IiMAQ==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021101.me.com (Postfix) with ESMTPSA id E9D6CD00249;
	Sun,  9 Feb 2025 12:59:51 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Sun, 09 Feb 2025 20:58:56 +0800
Subject: [PATCH v2 3/9] of: unittest: Add a case to test if API
 of_irq_parse_raw() leaks refcount
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-of_irq_fix-v2-3-93e3a2659aa7@quicinc.com>
References: <20250209-of_irq_fix-v2-0-93e3a2659aa7@quicinc.com>
In-Reply-To: <20250209-of_irq_fix-v2-0-93e3a2659aa7@quicinc.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Marc Zyngier <maz@kernel.org>, 
 Stefan Wiehler <stefan.wiehler@nokia.com>, Tony Lindgren <tony@atomide.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Zijun Hu <zijun_hu@icloud.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 25BJ4EESskLyH2hYdJYmWgnwlj8QIaK4
X-Proofpoint-ORIG-GUID: 25BJ4EESskLyH2hYdJYmWgnwlj8QIaK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_05,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502090115
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

To test if of_irq_parse_raw(), invoked by of_irq_parse_one(), will leak
refcount of interrupt combo node consisting of controller and nexus.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/of/unittest-data/tests-interrupts.dtsi | 13 +++++++++++++
 drivers/of/unittest.c                          | 24 +++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/of/unittest-data/tests-interrupts.dtsi b/drivers/of/unittest-data/tests-interrupts.dtsi
index 7c9f31cc131bae79ed81a1654cfc564e9c85bf9d..4ccb54f91c3068c0857f461fea0cf465aa0e2633 100644
--- a/drivers/of/unittest-data/tests-interrupts.dtsi
+++ b/drivers/of/unittest-data/tests-interrupts.dtsi
@@ -50,6 +50,13 @@ test_intmap1: intmap1 {
 				interrupt-map = <0x5000 1 2 &test_intc0 15>;
 			};
 
+			test_intc_intmap0: intc-intmap0 {
+				#interrupt-cells = <1>;
+				#address-cells = <1>;
+				interrupt-controller;
+				interrupt-map = <0x6000 1 &test_intc_intmap0 0x7000 2>;
+			};
+
 			interrupts0 {
 				interrupt-parent = <&test_intc0>;
 				interrupts = <1>, <2>, <3>, <4>;
@@ -60,6 +67,12 @@ interrupts1 {
 				interrupts = <1>, <2>, <3>, <4>;
 			};
 
+			interrupts2 {
+				reg = <0x6000 0x100>;
+				interrupt-parent = <&test_intc_intmap0>;
+				interrupts = <1>;
+			};
+
 			interrupts-extended0 {
 				reg = <0x5000 0x100>;
 				/*
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 48aec4695fff647226697fefcae696adaa307480..64d301893af7b861cf3e3c25d10f943dfd92bc03 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1659,6 +1659,7 @@ static void __init of_unittest_irq_refcount(void)
 {
 	struct of_phandle_args args;
 	struct device_node *intc0, *int_ext0;
+	struct device_node *int2, *intc_intmap0;
 	unsigned int ref_c0, ref_c1, ref_c2;
 	int rc;
 	bool passed;
@@ -1668,7 +1669,9 @@ static void __init of_unittest_irq_refcount(void)
 
 	intc0 = of_find_node_by_path("/testcase-data/interrupts/intc0");
 	int_ext0 = of_find_node_by_path("/testcase-data/interrupts/interrupts-extended0");
-	if (!intc0 || !int_ext0) {
+	intc_intmap0 = of_find_node_by_path("/testcase-data/interrupts/intc-intmap0");
+	int2 = of_find_node_by_path("/testcase-data/interrupts/interrupts2");
+	if (!intc0 || !int_ext0 || !intc_intmap0 || !int2) {
 		pr_err("missing testcase data\n");
 		goto out;
 	}
@@ -1690,7 +1693,26 @@ static void __init of_unittest_irq_refcount(void)
 	unittest(passed, "IRQ refcount case #1 failed, original(%u) expected(%u) got(%u)\n",
 		 ref_c0, ref_c1, ref_c2);
 
+	/* Test refcount for API of_irq_parse_raw() */
+	passed = true;
+	ref_c0 = OF_KREF_READ(intc_intmap0);
+	ref_c1 = ref_c0 + 1;
+	memset(&args, 0, sizeof(args));
+	rc = of_irq_parse_one(int2, 0, &args);
+	ref_c2 = OF_KREF_READ(intc_intmap0);
+	of_node_put(args.np);
+
+	passed &= !rc;
+	passed &= (args.np == intc_intmap0);
+	passed &= (args.args_count == 1);
+	passed &= (args.args[0] == 2);
+	passed &= (ref_c1 == ref_c2);
+	unittest(passed, "IRQ refcount case #2 failed, original(%u) expected(%u) got(%u)\n",
+		 ref_c0, ref_c1, ref_c2);
+
 out:
+	of_node_put(int2);
+	of_node_put(intc_intmap0);
 	of_node_put(int_ext0);
 	of_node_put(intc0);
 }

-- 
2.34.1

