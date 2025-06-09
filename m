Received: from esa4.hc555-34.eu.iphmx.com (esa4.hc555-34.eu.iphmx.com [207.54.77.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359B425C80D;
	Mon,  9 Jun 2025 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.77.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477078; cv=none; b=k4Dt6r3gJjMxixUwbPm18pBFY/y5WIzoJL1nsuLqmmOa7/FsjkcZ6eCGnZCFseQF7m/yzY3RPkYnfembJqVJrcLKAqpEQZDQCUcGUgiNoyk0z/XvQ36Z02YVfYb5BY6dqS2x0vqSFa9733U0SlBon3fEgSmDZGsq68sY8pP6JTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477078; c=relaxed/simple;
	bh=TtHw7OI3yp0+TB8iaEUmdvg7kVXB+STgSN9bNkoKV3s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=prW5x2VPus28/NvI+kBgNAF4ML7bZ10HIm34HiTaRGzmD/rxi4zICOb8fZftAVeogcprfK2rsHYHq38vRmSRVVsC2tiT56lwvOMjiagP3g332QLM2i+hbjM7zI8VJ+1er+aLNKgDbQ/1sG0g2V78JXSVCa8oKcKDnLByuesPShg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=fail (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=JLGG/hs8 reason="key not found in DNS"; arc=none smtp.client-ip=207.54.77.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="JLGG/hs8"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749477076; x=1781013076;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TtHw7OI3yp0+TB8iaEUmdvg7kVXB+STgSN9bNkoKV3s=;
  b=JLGG/hs8MdIWlBNteoLSTzwchL86Sn58HE4z6jgcn5MHfv5cgrhknBpF
   z0mw3Hc3WmkJWHFDmsIcKWgylKzRpu5xlTTI5LHrfoCz78nPZ9jmaYt18
   7wZtLrlxcak6If2A3kbl03k01ZDuvFVCt7u0WzeIZZDsvnjUW4R51s3fY
   iaZuDYHlcJujqXFUaEJ9N4VvPf6czNR5XSmqBd+RvTeFhg6qGtXUcS5WQ
   OFPKRR1HNZUDX6j+cc8Vr1fMO8p5d82rGOymQoGHx+BuKPeOKaDB9FdRz
   WDabft5b6EyqvG9s8OaN2E+h8DrVo4i6+MPv5seLkoP7yzLlCZibiJHFU
   A==;
X-CSE-ConnectionGUID: jiJ3+IoTQGWyA+Syk7PYXA==
X-CSE-MsgGUID: /yNDoU3nQK6YXRdYj8dClA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:48:03 +0300
X-CSE-ConnectionGUID: Xpmc6IOFTGmH62gimrgRZw==
X-CSE-MsgGUID: 1z6d7FmXTyyo1QNV8T1xeQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.6])
  by ces03_data.me-corp.lan with SMTP; 09 Jun 2025 16:48:01 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 09 Jun 2025 16:48:02 +0300
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
Subject: [PATCH v1 5/7] irqchip: aslint-sswi: resolve hart index
Date: Mon,  9 Jun 2025 16:47:47 +0300
Message-ID: <20250609134749.1453835-6-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve hart index according to assignment in the
"riscv,hart-indexes" property as defined in [1]

Link: https://github.com/riscvarchive/riscv-aclint [1]
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-aclint-sswi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index dfba34f712ff..7ff43f685e92 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -71,6 +71,7 @@ static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 	unsigned long hartid;
 	u32 contexts, i;
 	int rc, cpu;
+	u32 hart_index;
 
 	contexts = of_irq_count(to_of_node(fwnode));
 	if (!(contexts)) {
@@ -92,6 +93,11 @@ static int __init aclint_sswi_parse_irq(struct fwnode_handle *fwnode,
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 
+		rc = riscv_get_hart_index(fwnode, i, &hart_index);
+		if (rc) {
+			pr_warn("%pfwP: hart index [%d] not found\n", fwnode, i);
+			return -EINVAL;
+		}
 		per_cpu(sswi_cpu_regs, cpu) = reg + hart_index * 4;
 	}
 
-- 
2.43.0

