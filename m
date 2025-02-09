Received: from pv50p00im-ztdg10021101.me.com (pv50p00im-ztdg10021101.me.com [17.58.6.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD501BC065
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739105985; cv=none; b=RrytUk2GavwBmd0l9LKNMjSMlP934/p3l9taIEsY/axqu7SBDkqgaP0IQ2i8LH/UsOe/jiJJ4c3NZL0hjW+8KkQCdSgDfPidCqZJAxkKBTFcFhNI3SuuKJ8BpGCM/yrJ2sA2c3SJxKMAwhrf+cmAne8ljTC1VhH9/J4SvtxIb2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739105985; c=relaxed/simple;
	bh=yUrZq/119igB2w0eCWpSZBjHfbejt2CC8kiwWpNdHZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okIDQmIVWfSoOnJOeJpyAGoUrjpYQVztQlBYbZxEPMarQB7DND7qyNxK6bMQCYIPBXOEkHCFQfeURDK0fQMLaVHNVoEptdB8SvYUN367GNlvcd4paHfjiP0JM1xNAE+lnWmRwrZREs8mMpCVh0kYiHbzuohX4dDyjXxv+zEefGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=V1ZaqkA2; arc=none smtp.client-ip=17.58.6.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="V1ZaqkA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=PmKeKoMvm+sqd7jiaFBivxOuYoCBp3qBT9MZwpC/Mpw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=V1ZaqkA2CFbhSgA05reFbjnzKcQgWRyjC1lHxFVg/pp4fzIyBnfUhaenfH0UcxgM4
	 +l03rtjeJF1wCNo9qk+BCrhAYUqDKI7VtOH1LCXV2z7BfsALVpGB8HfRkHp6Qauh+M
	 oAepFDdTJ8X5IpmaUG/iWCjrc3VfzZTLVxSTWk3gWyT/cj6qkaIk6O4nCljE/MoGpF
	 DsPssJPo+tEYdRWPkvbX0wAR/i+1lJTWQJp7Ou2YxlUHOvrn8zhH+/gsE8J9iqjXlP
	 aWmWJXWw6CoZaDevLHMLjUXSiRqDpDzDpsMevaKS5LDH1eV2ClH1pucZw77uq5lzPJ
	 p10NS5Pvrd7Mg==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10021101.me.com (Postfix) with ESMTPSA id 4E365D00261;
	Sun,  9 Feb 2025 12:59:37 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Sun, 09 Feb 2025 20:58:54 +0800
Subject: [PATCH v2 1/9] of: unittest: Add a case to test if API
 of_irq_parse_one() leaks refcount
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-of_irq_fix-v2-1-93e3a2659aa7@quicinc.com>
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
X-Proofpoint-GUID: bOCVLMMmO9CeyS7QWX5R2_XFkh9aqqtk
X-Proofpoint-ORIG-GUID: bOCVLMMmO9CeyS7QWX5R2_XFkh9aqqtk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_05,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502090115
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

To test if of_irq_parse_one(@int_gen_dev, i, ...) will leak refcount of
@i_th_phandle.

int_gen_dev {
	...
	interrupts-extended = ..., <&i_th_phandle ...>, ...;
	...
};

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/of/unittest.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index f88ddb1cf5d7f75ac90eeff1f944d563df56f2d3..48aec4695fff647226697fefcae696adaa307480 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1654,6 +1654,50 @@ static void __init of_unittest_parse_interrupts_extended(void)
 	of_node_put(np);
 }
 
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+static void __init of_unittest_irq_refcount(void)
+{
+	struct of_phandle_args args;
+	struct device_node *intc0, *int_ext0;
+	unsigned int ref_c0, ref_c1, ref_c2;
+	int rc;
+	bool passed;
+
+	if (of_irq_workarounds & OF_IMAP_OLDWORLD_MAC)
+		return;
+
+	intc0 = of_find_node_by_path("/testcase-data/interrupts/intc0");
+	int_ext0 = of_find_node_by_path("/testcase-data/interrupts/interrupts-extended0");
+	if (!intc0 || !int_ext0) {
+		pr_err("missing testcase data\n");
+		goto out;
+	}
+
+	/* Test refcount for API of_irq_parse_one() */
+	passed = true;
+	ref_c0 = OF_KREF_READ(intc0);
+	ref_c1 = ref_c0 + 1;
+	memset(&args, 0, sizeof(args));
+	rc = of_irq_parse_one(int_ext0, 0, &args);
+	ref_c2 = OF_KREF_READ(intc0);
+	of_node_put(args.np);
+
+	passed &= !rc;
+	passed &= (args.np == intc0);
+	passed &= (args.args_count == 1);
+	passed &= (args.args[0] == 1);
+	passed &= (ref_c1 == ref_c2);
+	unittest(passed, "IRQ refcount case #1 failed, original(%u) expected(%u) got(%u)\n",
+		 ref_c0, ref_c1, ref_c2);
+
+out:
+	of_node_put(int_ext0);
+	of_node_put(intc0);
+}
+#else
+static inline void __init of_unittest_irq_refcount(void) { }
+#endif
+
 static const struct of_device_id match_node_table[] = {
 	{ .data = "A", .name = "name0", }, /* Name alone is lowest priority */
 	{ .data = "B", .type = "type1", }, /* followed by type alone */
@@ -4324,6 +4368,7 @@ static int __init of_unittest(void)
 	of_unittest_changeset_prop();
 	of_unittest_parse_interrupts();
 	of_unittest_parse_interrupts_extended();
+	of_unittest_irq_refcount();
 	of_unittest_dma_get_max_cpu_address();
 	of_unittest_parse_dma_ranges();
 	of_unittest_pci_dma_ranges();

-- 
2.34.1

