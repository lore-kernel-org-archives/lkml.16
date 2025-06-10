Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4AA28D824
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552425; cv=none; b=Y5f7vJYjiokcACZ/Rt0fn8Ay0vcJi0oC7fTcWQ1e92ioaUrT8g+v7Kvudw36hz3ZacAJPWF+4r9vud0I9HcYFqvclV4iJ0ffmZSF0TXTGFwGIS3sZSJSW5LgUt0YBuLG6fAbWBWJDPkKWGEfqHjkZke8eq0kvryTdz2RbuFV4tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552425; c=relaxed/simple;
	bh=h73ucvaKC7tusoZ366WFdpRJo5bbH+f6qpcdSe3pUX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MH58AjPtYbomfygA2Pj3kQvMncpnTfeYtqNwAXUqZOPOyOYHLeXDdrIAvaIfM+UhB4rw7egqv0Lfey9OwY/P3ne3KPcAqNQlY5SIr+Kc5zIdIl8xttewSjzz2dSPApbKRlmFhbhB/Z/Yjk3pBzFosgXvXcssipkIBoHJ+msbjzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=CDEvh3u9; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="CDEvh3u9"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so3961198b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749552422; x=1750157222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOPKLQETC23awiI7CT9ZOjIxOZ+G4ZqvM0do3bqdxho=;
        b=CDEvh3u9CedjMhCO1N5s+MLcrQ09c8rpZxd9Gk43i32PSsQ+Ja6F3UqxMVQIPNAQol
         TkEtoMvs4nBTmOJupoMLyJBv+dfbmDuHZmemfajDr5TY6cbmmwF12SwzeRDmksaGDsvw
         ffCzywMcOC2njLYdREXdk8ZwYm6Ldd5Gocbx2fN8ztuBKrelHE+xbdWQoyuUbIEolpWD
         QLZJAdD3wLZyKPKeGGdRP2u7N6gYx42W3UEqQDe+pdfnWDOKJgOvBpTV+z1G4kNkPH4k
         ZMJYBC5NpNuIvkOXNitPLUMblLUH3CCmzu11bRSOTdIf5shw/yjpLquYZkqnobkeWrdH
         MnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552422; x=1750157222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOPKLQETC23awiI7CT9ZOjIxOZ+G4ZqvM0do3bqdxho=;
        b=Y+8MW1aSEkwqMDPuLhSLDBEsicOMaREVh3B67JBJiVxyrOckv44eqsHB8Bn1pnuQUh
         TVFwhd7mJWPBd7h6foJQ3vfgpmkkr4V0AOMw6zPAFQXgMWbIV7nglhutWyIlbla1QUv8
         UGdRCokwK8NdQDHeZhUCojVDRKC36DhA/7XovPbjX0cT4bBV++BBWuSalWkoCvNEOzXV
         F9EdyYgQxQeiCR+mngv8yux9OBh4IgYEXytLB9K/5+xu/nqCmVE9jEr+tHfzdGbPmueG
         YxKUXeocjwLihtxYVn8rfNUhGnBMNzH7TX9uftYqEbOd+pXQ8+kd2Kvm4oClaOkaLici
         NXOA==
X-Gm-Message-State: AOJu0Yyd4NRRiyHd8sseC7Aq668/XQdyXzmV2JMxUMdijcu3n5MdEBCh
	LCZnbofJR1Bhge0f7QZoRg++Z7Mz+m2L5WP6wSoUf4BKy9NDqoxxtQPF8QU340MpeHLIVwCZ0t7
	SciGtYyw=
X-Gm-Gg: ASbGncuqsaiJvhKemX7TPoIRck4VN/AGWL6Gx3jDVq+BMtftbIKOJ/XfxgYg+dsB/ru
	sZbRBtDw956kiCGYll7kg1kWp16Ei/9Yaa62ruCqfVBfHOqi7iRaz+c+rWHwgzIAJIfVteFzpMc
	IzlKm/FIPAiIskzdNyEaY7trMyMt8I7RsdG4pdt8anB/VUXs1dTKwzlx+Wsb/+LCsGk98fi56Qt
	6v18VrRELBFkg8K6fxikFpmtHZD/i6At/N2Nr6EUSmo9FSs+w1qhlmZCJJ6yPyywuD8FKsaEjoY
	onVr3dTAQVtM72Fd2Hv2WGKcVowuqi5rmrZMasCJ4An/7qguSXfIVbpdJZplelsfbcXbQKH0
X-Google-Smtp-Source: AGHT+IEY8u8v01mFisc/TL0W6gCvBjvkLcKdurAn91xGLMr57xfYjH/zVaAAA3K7rATTcPpWb32wlw==
X-Received: by 2002:a05:6a00:9292:b0:746:2ae9:fc49 with SMTP id d2e1a72fcca58-7485ea78f73mr3883622b3a.9.1749552422541;
        Tue, 10 Jun 2025 03:47:02 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.196.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0842c0sm7152448b3a.73.2025.06.10.03.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:47:02 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v2 2/3] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
Date: Tue, 10 Jun 2025 16:16:40 +0530
Message-ID: <20250610104641.700940-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610104641.700940-1-sunilvl@ventanamicro.com>
References: <20250610104641.700940-1-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acpi_iommu_configure_id() currently supports only IORT (ARM) and VIOT.
Add support for RISC-V as well.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Link: https://lore.kernel.org/r/20250514055723.1328557-4-sunilvl@ventanamicro.com
Signed-off-by: Anup Patel <anup@brainfault.org>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/scan.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index fb1fe9f3b1a3..70f57d58fd61 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
+#include <linux/acpi_rimt.h>
 #include <linux/acpi_viot.h>
 #include <linux/iommu.h>
 #include <linux/signal.h>
@@ -1628,8 +1629,12 @@ static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
 	}
 
 	err = iort_iommu_configure_id(dev, id_in);
-	if (err && err != -EPROBE_DEFER)
-		err = viot_iommu_configure(dev);
+	if (err && err != -EPROBE_DEFER) {
+		err = rimt_iommu_configure_id(dev, id_in);
+		if (err && err != -EPROBE_DEFER)
+			err = viot_iommu_configure(dev);
+	}
+
 	mutex_unlock(&iommu_probe_device_lock);
 
 	return err;
-- 
2.43.0

