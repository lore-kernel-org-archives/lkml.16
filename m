Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C2F1C84D5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751255305; cv=none; b=s0STLpv51yax/8MMv41bpQjFdX54egmIS9+q9WPvlArsBi7j+HhkM2b40PKyzlwsSlJBTfbxg96BmpT8EIZ3/yttKl9JnFP4rhbsW44FDIRR3AxAHH/D9M6QfoRvEn5bcM52LgsLnKyjNnJHv8yDvL/K8CwSCzHoUAwTgwfPYx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751255305; c=relaxed/simple;
	bh=rcXB8sUVYbgV/LLd1eTDWsHjfWUpMTfAU5sX2LEsSqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iNOw7bpDbEbt7hRa/BB/YE3Q7Xx84tGRo2dt504OGe2VyFqQej5NSOx8pwWmtpI/j9m/GTQS5Otgq4gL0ElPcOs/t7/DtieVuOeRihRplL5A2y4lIhuK01bHVkOqwqjFnlIXVME1PRv7BjvWdb43IioS1vuFj11+W2u3hqidCuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=nGQu5xHB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="nGQu5xHB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742c7a52e97so4179976b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 20:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751255302; x=1751860102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ri1e7xvqfD1xJqzMHYa8cxstKVT8liDfwJUs4Nyy/QU=;
        b=nGQu5xHBdZu4RrFpUhYeQ/5dMhpGrfKrQP2iW+7NPkBOchXxwuZD5CPD2c9zPVDozB
         wosV4xwdpBqfw3Z3eoPEffFj1H0OdoFKSKTotfdKi5rqIZLaJPMwOadlseplTD8D2Fti
         5H1ND4pVynUNR0RGuQv6KKWtH1Q/4IoMjBgdhb13pNNEznd/FDCsHUrHMU5zzkeRbI0O
         0oJaWz8f0iS77bnyUeJDnoxFJuPdsoo4K9zixFatCgt8VjRNnbSKseQE3VHBI4k83zDO
         BdT9Sy1VotZWjOItxHlNPAmJgxkrU2I9fgqiWlyjCMmLkDWPTtiAGK3Eb0DVWw496NHo
         FFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751255302; x=1751860102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ri1e7xvqfD1xJqzMHYa8cxstKVT8liDfwJUs4Nyy/QU=;
        b=FGF235qU9RIPzraN0L9eS8dmhOAvqNHbyb3yO2SS+JLlnI3d5XkQKIeztN53djW8kh
         3QhMvMnZ5xveZ2ett9DrNSC9EBK7hAdic48JbpZaLTElftejC3+ZHooUPhXHgXg7gC0+
         CKZHBKeV8PDqpOtRt7phIM/Wnvc24JRa38JyGxbf/lhtfuM8UsiOXDzpCXitkzKRfCIi
         lS+lmqkGTBeI4bkPpE5ZEfFLWoGINDjFasP06WSsepnW9RYO0rsnDcAArsA3kum3oPke
         RTzsbi6bmtcDxfOWX6ouCCP5Qv/rW8xnLK7rzVwoiikfWUCg8GUrWNDsrAbXCSE3M5tk
         OBdw==
X-Gm-Message-State: AOJu0YyV+w6oIJVTYKB3W13X0tuBEs8pCjXdlA1KQyHngwWhvirfBmFd
	8gnRjWWxvIvZlZTisVHkMpVKYo2WeViECCyiQRO7ZzJTaxp/Oa4jvpgrZ/GtJ0+HA3g5Ba/gUsP
	mLFkc
X-Gm-Gg: ASbGncs02IuxomSUHH/4PzKLZITYyCzrUQq4FhbMlJ3i8ZAmFcvhqu8ixn+65NsV6LV
	TSNrxdTsLjlWS8nZHCFiOS5hV3aW4aHiYxsCNeXCSV29+BZ+JebtsFvHW81uDsZENkQM1rvBeyp
	G8pIhjYJJb7YmKeEjfui6H8e4XCWUZhz86SrCueMeQNaZg1NUuvVcNoCrb+aZuujP637Vv4IqGG
	Z8QYRT3UvQapv6HY5xq0jjpksSom3ksUmsxBtEwD1u9tud4+9RIckInoJE0Xzl+rLv00odBnRyN
	suClSvI4jdt9/x0U6Uq+hy4nkKqh17xFHM3ob+/G7TRbccmiqFGgHKRvyT4Z6PRBhpaXVBd3
X-Google-Smtp-Source: AGHT+IG71WwVUzest/mJtvn+9x2w5xMiAsY0zQAJe8GnER+ZaxhJXmmKNzdMlkrBD48ocwYkdyfatg==
X-Received: by 2002:a05:6a00:1813:b0:746:2591:e531 with SMTP id d2e1a72fcca58-74af6f081c9mr17099430b3a.12.1751255302416;
        Sun, 29 Jun 2025 20:48:22 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.195.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57efaecsm7837862b3a.161.2025.06.29.20.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 20:48:21 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v3 2/3] ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
Date: Mon, 30 Jun 2025 09:18:02 +0530
Message-ID: <20250630034803.1611262-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
References: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
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

