Received: from esa2.hc555-34.eu.iphmx.com (esa2.hc555-34.eu.iphmx.com [23.90.104.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5BB28A708;
	Tue, 10 Jun 2025 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.90.104.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550005; cv=none; b=H3CgGHs9BYqylt1LmJ5eRu5MW8bbExmnbec8fwjdd/P0cmhEDYYNrqj2dS9irQnDrxcJHRhlVK5Bb1ygeDmmLodSIe7yhCzXHZZUCkPstCQ/culeKiERoHNMMBGMGgoMxqlzfw+sGQ+dy2kjxxsw38sugx4WZ8ebwejMfLf1G4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550005; c=relaxed/simple;
	bh=S4SlciKZEDkvxxA53sOZjgI7BGGyzxMFgS4kqW029qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dd4mEFUWouzDPV7f3kT19/+4VUA8pyZvUQGFsLCdCLyaPPxZuM0JSUV0X6MszS5aR3MOur71tYwVJwgzffucjvvinOvi8+OmOh0uRwMG0ky6Eq9goPGoaY9lNq23TqjOM7Yt0z9JNX5HgcxZRhMDlu0JDm+UoOFo8TFV6M7/bIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=D471VFPk reason="key not found in DNS"; arc=none smtp.client-ip=23.90.104.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="D471VFPk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749550004; x=1781086004;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S4SlciKZEDkvxxA53sOZjgI7BGGyzxMFgS4kqW029qc=;
  b=D471VFPkZYynsRqheUyi5ZZqVSoP7KEtDrkvegQb+71XaAyZcFjWLP2U
   /NfxnD+zGJ/b0iiAZM7ZwFALbmW7JwVPbDsChHo3GWrFuLSrL7KDcjoQk
   +VISJeeFvnsAITut2V79zY5amd5BgY242TYPWfmh/6lG9dQWn4S6mV+9O
   6gtwqIsvGk6mg9q5sNeapWADHFRKHdSPe1rvklL19sKJnJm0W9ZhU0ZsY
   6neGoATnZY6eVkmI9CC3PiuBLYmIPR3W3KWP9ZUvclnQczoWpLwpFDC3u
   9h5gzsTnHiBYO3jWYQXUUF8L9rB8tNUd6dN2NdLobR5q8qv8PmSitdcXE
   A==;
X-CSE-ConnectionGUID: 44TnxZt3SyeoYmRFmM3UJw==
X-CSE-MsgGUID: he1bGLnJRzqdVEyeLeDcnA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:06:37 +0300
X-CSE-ConnectionGUID: L/mYHuCUT9qp4TiIzR8Dlw==
X-CSE-MsgGUID: hvG3VRHtSp+PyC8qsVTeAA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces01_data.me-corp.lan with SMTP; 10 Jun 2025 13:06:35 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Jun 2025 13:06:36 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v2 2/7] irqchip: riscv aplic: use riscv_get_hart_index()
Date: Tue, 10 Jun 2025 13:05:35 +0300
Message-ID: <20250610100540.2834044-3-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use global helper function instead of the local
implementation

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-riscv-aplic-direct.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
index 205ad61d15e4..c2a75bf3d20c 100644
--- a/drivers/irqchip/irq-riscv-aplic-direct.c
+++ b/drivers/irqchip/irq-riscv-aplic-direct.c
@@ -219,20 +219,6 @@ static int aplic_direct_parse_parent_hwirq(struct device *dev, u32 index,
 	return 0;
 }
 
-static int aplic_direct_get_hart_index(struct device *dev, u32 logical_index,
-				       u32 *hart_index)
-{
-	const char *prop_hart_index = "riscv,hart-indexes";
-	struct device_node *np = to_of_node(dev->fwnode);
-
-	if (!np || !of_property_present(np, prop_hart_index)) {
-		*hart_index = logical_index;
-		return 0;
-	}
-
-	return of_property_read_u32_index(np, prop_hart_index, logical_index, hart_index);
-}
-
 int aplic_direct_setup(struct device *dev, void __iomem *regs)
 {
 	int i, j, rc, cpu, current_cpu, setup_count = 0;
@@ -279,7 +265,7 @@ int aplic_direct_setup(struct device *dev, void __iomem *regs)
 		cpumask_set_cpu(cpu, &direct->lmask);
 
 		idc = per_cpu_ptr(&aplic_idcs, cpu);
-		rc = aplic_direct_get_hart_index(dev, i, &idc->hart_index);
+		rc = riscv_get_hart_index(dev->fwnode, i, &idc->hart_index);
 		if (rc) {
 			dev_warn(dev, "hart index not found for IDC%d\n", i);
 			continue;
-- 
2.43.0

