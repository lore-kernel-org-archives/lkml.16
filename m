Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570E026D4E8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361142; cv=none; b=jyJx72KI1qUsFbTvCi0+TZy5Pp3e727jiZMxMGx8+xHjt2B/vF0gnkTL7TQVol2zW0WS8dfDS7aveEnP2YIX/8An6Usrx2mV08XiWoyhEUxBaFc2dBD4j1b+pm7xhbYjkDWorsZo7vCQd2BmhoBJN/rwkmhQjh+bvob3APwlig4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361142; c=relaxed/simple;
	bh=mpzqWhT1I+6uw/XL0NOgYZhIQ3NUjVGpw47BxenLilM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eeAriDFw6/IJuFVE8Ii/U+Rlmj2UDxF0e5rUY5sUJuPqQgOXxMB+/cnGL2Leisn3NfNdRJA3MMUJXUIm+4RqatWPFXQN95U8hnoKv2x0s7Chk61YwivNAMZ2o/bALQAI0odc1hyD9/qeyzrSL8fmYIgkkH0/Cdf7tptpB8/cLdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IhqVGaLU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IhqVGaLU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2366e5e4dbaso53502435ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751361141; x=1751965941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gz5DxFLcNcY/JgVYAsCkaQXBb/kJxxrffxVb/EKMKLE=;
        b=IhqVGaLUgPXpL8g1T3MZxH8WXmv5o0OyaGG4mOI/lSSJFV2n2GpKEdGIDW2YPzYtFx
         1Unczt5BjPiWnKzdZYk23GOMt0tvmVhnupAwZtfyoGpNfFICpIWhXBjTy06Jf8+U8pbs
         Gki5GC8HqKvT6GCGFCx83axLZgnmpDhOn7liM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361141; x=1751965941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gz5DxFLcNcY/JgVYAsCkaQXBb/kJxxrffxVb/EKMKLE=;
        b=L7epkHQb4Y4EYJfgYVSV+gKDX45IlsjMdsuiBXr1cdFEt4SndpHRJbBtPoiiJvEmve
         xPQ7fmixKST2ADomiYbiOvWzedEF0XDTkHZZCRGaux2zivaAbBmQJiGWrBE+O1sS0VFL
         NCt7cF5IFyUZY17yybBTtePTvEGJ1vn9CmCTCxkLHh9ikw7YSsrIh9oX+LyFFIeR2or9
         lF468YLXQ7DGX7Jc2v7TNPYb4TJir3dR87Xp/O9NClbsgDtrc0dL/dQBeNGQQBn3+bsn
         s7loFXIBPKUKuTHD1glx6a2BfW2QyNJhxehPkVuHDoBahAlZ8Jqt+MN+DJhc943rJV1S
         QJ6w==
X-Forwarded-Encrypted: i=1; AJvYcCXcxwiiHVz/pzhaO7JUDRXd3poJmoLavdXKGo95l1tZ4ZTfbVS5QJk8IdFeLK5BwmZ1kl1ppHFNp4WhlQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeKr1NUDu75fVc7UC3xqWfyISCLZwuY6lYYsUTxmGtgg9fdCSO
	gYddoHquuG8liuMKxzMfnF4NoqeeqwIaV/xW0/jrG7+bxbaW66sphTVsU/U2zIg1Kw==
X-Gm-Gg: ASbGncvvXjrj97QcV63sGaZ3ujzZuvybgSe9oQsTw/lW8c56V6xHOjjGGHNhZjbKPxf
	WV5p6JP5nqKJ7QJEDrbYwsXEO4IpvHnl+R3rk6sDAFUyV/w2DIebO/jeeIYxzTfyT0u4Q1k4kc0
	Ag1jz2UYGoUUKDZ2JaTjvaF/B3nFLj4lY9Y/Fzh4f/OqWPvZFfO2RZeJTL4sAkpzAZXMqWTOFig
	luI1cascGTfmmgZTv/8zJxzHP1IIdmmJhkvEC/9vyQEoK/zI/RxAzBOkEFSLSDRNV03+oj33LOe
	CksODoPYrXELxL+yj3VaXHMoj4aL/CocK7qiQTLYklbOM/fnHvZA4GcRcR3lOqTItpuVb5WXw8I
	zmZoCMCDBfwIBku1SSRbe2zLHnyghjMG1lRkWzT4=
X-Google-Smtp-Source: AGHT+IGYBGgecd8dWYPIr5lPRMgzOqoHDpBa6fI9mi67gnjdbRnBBRPCFnVNS888pXR+GeNceSOnog==
X-Received: by 2002:a17:903:3a83:b0:234:5ea1:6041 with SMTP id d9443c01a7336-23b354bb8b8mr47396115ad.10.1751361140627;
        Tue, 01 Jul 2025 02:12:20 -0700 (PDT)
Received: from localhost.localdomain ([192.19.203.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e30201c1sm8893603a12.22.2025.07.01.02.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:12:20 -0700 (PDT)
From: Vikas Gupta <vikas.gupta@broadcom.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	vsrama-krishna.nemani@broadcom.com,
	Vikas Gupta <vikas.gupta@broadcom.com>,
	Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>,
	Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
Subject: [net-next, v3 08/10] bng_en: Add irq allocation support
Date: Tue,  1 Jul 2025 14:35:06 +0000
Message-ID: <20250701143511.280702-9-vikas.gupta@broadcom.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250701143511.280702-1-vikas.gupta@broadcom.com>
References: <20250701143511.280702-1-vikas.gupta@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add irq allocation functions. This will help
to allocate IRQs to both netdev and RoCE aux devices.

Signed-off-by: Vikas Gupta <vikas.gupta@broadcom.com>
Reviewed-by: Bhargava Chenna Marreddy <bhargava.marreddy@broadcom.com>
Reviewed-by: Rajashekar Hudumula <rajashekar.hudumula@broadcom.com>
---
 drivers/net/ethernet/broadcom/bnge/bnge.h     |  3 +
 .../net/ethernet/broadcom/bnge/bnge_resc.c    | 69 +++++++++++++++++++
 .../net/ethernet/broadcom/bnge/bnge_resc.h    | 13 ++++
 3 files changed, 85 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnge/bnge.h b/drivers/net/ethernet/broadcom/bnge/bnge.h
index b58d8fc6f258..3c161b1a9b62 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge.h
@@ -172,6 +172,9 @@ struct bnge_dev {
 #define BNGE_SUPPORTS_TPA(bd)	((bd)->max_tpa_v2)
 
 	u8                      num_tc;
+
+	struct bnge_irq		*irq_tbl;
+	u16			irqs_acquired;
 };
 
 static inline bool bnge_is_roce_en(struct bnge_dev *bd)
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
index 68e094474822..0e67a0001677 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.c
@@ -326,3 +326,72 @@ int bnge_reserve_rings(struct bnge_dev *bd)
 
 	return rc;
 }
+
+int bnge_alloc_irqs(struct bnge_dev *bd)
+{
+	u16 aux_msix, tx_cp, num_entries;
+	int i, irqs_demand, rc;
+	u16 max, min = 1;
+
+	irqs_demand = bnge_nqs_demand(bd);
+	max = bnge_get_max_func_irqs(bd);
+	if (irqs_demand > max)
+		irqs_demand = max;
+
+	if (!(bd->flags & BNGE_EN_SHARED_CHNL))
+		min = 2;
+
+	irqs_demand = pci_alloc_irq_vectors(bd->pdev, min, irqs_demand,
+					    PCI_IRQ_MSIX);
+	aux_msix = bnge_aux_get_msix(bd);
+	if (irqs_demand < 0 || irqs_demand < aux_msix) {
+		rc = -ENODEV;
+		goto err_free_irqs;
+	}
+
+	num_entries = irqs_demand;
+	if (pci_msix_can_alloc_dyn(bd->pdev))
+		num_entries = max;
+	bd->irq_tbl = kcalloc(num_entries, sizeof(*bd->irq_tbl), GFP_KERNEL);
+	if (!bd->irq_tbl) {
+		rc = -ENOMEM;
+		goto err_free_irqs;
+	}
+
+	for (i = 0; i < irqs_demand; i++)
+		bd->irq_tbl[i].vector = pci_irq_vector(bd->pdev, i);
+
+	bd->irqs_acquired = irqs_demand;
+	/* Reduce rings based upon num of vectors allocated.
+	 * We dont need to consider NQs as they have been calculated
+	 * and must be more than irqs_demand.
+	 */
+	rc = bnge_adjust_rings(bd, &bd->rx_nr_rings,
+			       &bd->tx_nr_rings,
+			       irqs_demand - aux_msix, min == 1);
+	if (rc)
+		goto err_free_irqs;
+
+	tx_cp = bnge_num_tx_to_cp(bd, bd->tx_nr_rings);
+	bd->nq_nr_rings = (min == 1) ?
+		max_t(u16, tx_cp, bd->rx_nr_rings) :
+		tx_cp + bd->rx_nr_rings;
+
+	/* Readjust tx_nr_rings_per_tc */
+	if (!bd->num_tc)
+		bd->tx_nr_rings_per_tc = bd->tx_nr_rings;
+
+	return 0;
+
+err_free_irqs:
+	dev_err(bd->dev, "Failed to allocate IRQs err = %d\n", rc);
+	bnge_free_irqs(bd);
+	return rc;
+}
+
+void bnge_free_irqs(struct bnge_dev *bd)
+{
+	pci_free_irq_vectors(bd->pdev);
+	kfree(bd->irq_tbl);
+	bd->irq_tbl = NULL;
+}
diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
index c6cef514588f..23db93e03787 100644
--- a/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
+++ b/drivers/net/ethernet/broadcom/bnge/bnge_resc.h
@@ -51,8 +51,21 @@ struct bnge_hw_rings {
 	u16 rss_ctx;
 };
 
+/* "TXRX", 2 hypens, plus maximum integer */
+#define BNGE_IRQ_NAME_EXTRA	17
+struct bnge_irq {
+	irq_handler_t	handler;
+	unsigned int	vector;
+	u8		requested:1;
+	u8		have_cpumask:1;
+	char		name[IFNAMSIZ + BNGE_IRQ_NAME_EXTRA];
+	cpumask_var_t	cpu_mask;
+};
+
 int bnge_reserve_rings(struct bnge_dev *bd);
 int bnge_fix_rings_count(u16 *rx, u16 *tx, u16 max, bool shared);
+int bnge_alloc_irqs(struct bnge_dev *bd);
+void bnge_free_irqs(struct bnge_dev *bd);
 
 static inline u32
 bnge_adjust_pow_two(u32 total_ent, u16 ent_per_blk)
-- 
2.47.1

