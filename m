Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 245B878F4A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672803; cv=none; b=eyux2kaGL5mhvivb/WiBegiQiV6V51TnFvWWEOYULH93tytXMT6ulrrkIGzDREklCANX54/AGrNg0LXqzacI4OaIK1JRPS1C43qzD7Of9NxKWTkiQqhzcXfAcyGgVYqiJlJkotOAiDoyVwee3K9v7nv8MJE5f04tZFhNoxLCUiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672803; c=relaxed/simple;
	bh=ub5dIR0MadGwEmMkBhscZrATERyfT0UYkW0XODW7hYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fStWcb7wntZWpcKhoZyffJrY28qopHd/JjoN3uFd2DyTSNF6aL8vfTYOTlFIqM2USVFwVKkPhT//ta+abnLdjSJHy5wrHiCi5w0yFJnzaiUdHELw19Mod5yL+6M4IFPTr2Aza9qCfOTnEGGQML3sJPmbmoioY+u224AA9mAHWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8CxG6zbVe5nahawAA--.64616S3;
	Thu, 03 Apr 2025 17:33:15 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowMCxKcTWVe5nSIBtAA--.29648S2;
	Thu, 03 Apr 2025 17:33:13 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Guo Ren <guoren@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>,
	Qihang Gao <gaoqihang@loongson.cn>,
	Juxin Gao <gaojuxin@loongson.cn>
Subject: [PATCH] LoongArch: Preserve firmware configuration when desired
Date: Thu,  3 Apr 2025 17:32:57 +0800
Message-ID: <20250403093257.1059912-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxKcTWVe5nSIBtAA--.29648S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7AF17JF18AF17ur4DtFW7ZFc_yoW8AF47pF
	W3Zw1UGFW8Gr15GrZay3yrXFs09FZYkrWYqa13ZrZrAwsFvw10vryDA34qvFy5Can5Ka18
	ZFZIyr1UGF4DA3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9jb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWU
	AwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y
	6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7IU8CksDUUUUU==

If we must preserve the firmware resource assignments, claim the existing
resources rather than reassigning everything.

According to PCI Firmware Specification: if ACPI DSM#5 function returns
0, the OS must retain the resource allocation for PCI in the firmware; if
ACPI DSM#5 function returns 1, the OS can ignore the resource allocation
for PCI and reallocate it.

Signed-off-by: Qihang Gao <gaoqihang@loongson.cn>
Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/pci/acpi.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/pci/acpi.c b/arch/loongarch/pci/acpi.c
index 1da4dc46df43..50c9016641a4 100644
--- a/arch/loongarch/pci/acpi.c
+++ b/arch/loongarch/pci/acpi.c
@@ -194,6 +194,7 @@ struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
 {
 	struct pci_bus *bus;
 	struct pci_root_info *info;
+	struct pci_host_bridge *host;
 	struct acpi_pci_root_ops *root_ops;
 	int domain = root->segment;
 	int busnum = root->secondary.start;
@@ -237,8 +238,17 @@ struct pci_bus *pci_acpi_scan_root(struct acpi_pci_root *root)
 			return NULL;
 		}
 
-		pci_bus_size_bridges(bus);
-		pci_bus_assign_resources(bus);
+		/* If we must preserve the resource configuration, claim now */
+		host = pci_find_host_bridge(bus);
+		if (host->preserve_config)
+			pci_bus_claim_resources(bus);
+
+		/*
+		 * Assign whatever was left unassigned. If we didn't claim above,
+		 * this will reassign everything.
+		 */
+		pci_assign_unassigned_root_bus_resources(bus);
+
 		list_for_each_entry(child, &bus->children, node)
 			pcie_bus_configure_settings(child);
 	}
-- 
2.47.1

