Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D34157E6B;
	Fri, 16 May 2025 03:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747366811; cv=none; b=WQqZHU/dr3e6bs7qy3wmLIEpuKYNfp0ebKLpdpLsjQQVSvRLFv+Rhe/wIAHm3Xd1BU8wOfkR6//McuvI+DMSutGqHmmFEq4kbUuEtOQmHDLG1aeUtxyQFm42q8Xts07sYYtFGFcUaLbabaIpoHgHFGeoSiy23zKQ93roB7BhD60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747366811; c=relaxed/simple;
	bh=Z3ZvQcR+qZMr5q/39wrgedHCC59lo8O7hV//Rz187cU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uA4l+c5W9hcujL2QlyeZ/eTGP5lw1moLM8cdr1IYa4Sl46ed8bkrDJCmXJaPpTuRDDmfaZnk+xggr5nBHrupCBet7C6ddObGXqywYfxoLeF6TWNdezO4CWze8KeGSj3JzxTAJng2p9KzypScqAWxZTZCdqHo0ICj9ONBXUMPCSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtS5xLwY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtS5xLwY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22fb6eda241so22564175ad.1;
        Thu, 15 May 2025 20:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747366809; x=1747971609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/R39owgoQYskJ7CpqkwvTHcCWSwGQ0VHz7FMIJELl98=;
        b=GtS5xLwYQ2uOsHG/5nuqLIJq8ovq+JuvmQwJslz06YXyABtTFTuOBDszWBXQCsyD/W
         4UL/ZLInCeO2Bp7cnTCNYQ8AivPzPx9imCuR9JGgfPmxOkngBpqv+7FfUPEvgCmvO/py
         rYMhBkbedg1lYvf4tDHjvWo3vr6FuGRCCxdIBqnu/nFl0s3v6iszJoJXaQaol6Xu3itc
         G3RA5L1N8ITCFK3NT+K2kdyUmZg1p5JTNAoy5hN3Ge3bgiDvQSvpgpM5wWEdVwQsBYK+
         JOVQwpzInHAk8GmGmVS+4JwR8S+au/wg4WQ7EmmkJRikuWnYGI0/A2SISqSAvLCnC47U
         G6Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747366809; x=1747971609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/R39owgoQYskJ7CpqkwvTHcCWSwGQ0VHz7FMIJELl98=;
        b=ZV5trgvj23hXEnFgr/GPK0Go7wgHjik8Y/+6sfaMIQK/WOr+aO7Qa1mS/nyupQbkjg
         TwWAXxuV4gAai15sikyxtidwYT/fST85hChG8f4KA2r8hBid469cYiUMpUpTTWy/O+2k
         tN8p00G7t+D2QY8EdxaTjaTtaAcUG6eOgePqWMgvY6yq9Bv+fZHEeYQw79ayPbJzxk6w
         LYKGHEgCzJf8AyjQpPoU0frw4hRY0AI/YLVJJyrZif09jalaXkotNqe52VJznFXvHFaa
         HK597SpMcoPrwEQ69+h72GmS3LT6ozHjvmn/Ej7oHfJO9U38HGDzamPkQoinWyojl3DM
         LftA==
X-Forwarded-Encrypted: i=1; AJvYcCV+/SCLtwRGvxyT4qwGwEtXLDsrJArmT0u0RL3woLToTkPgD8Zrj3CCZFSk/IfVqXUSWcupB0tB1kSOw2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhF26+G4v/TxgyAUvYWwNuM411I3XKXRtG0pMhIa4L43oIlBap
	Ae699/OG8fyHbfYaMzIib714anH04XU7MidGwRLov8xrFeBXp4O45GJM
X-Gm-Gg: ASbGnctkkuTCMIYe3JNkW4iK4tOONxeTAoajyAyBAf56uIIWotjoRS9ZED/jhmqpQt6
	0CK0AXYY6qOQKCPIko2cN+jqF6f0vtox2mlWkN1s44H72vhvTqzjsD+Fps9VBed99CXCH7lKKNu
	c8r3OLoaCUUU6fkJvRlarvvtkMFtupUsYs65gYgCF/5pw4dhEoxxhsAeuYAm4Zfg/HbE0IHRBgc
	7vTbFNELf5LmEajTUC0Jgb3Tw2t/ugyNYq1WrY5tvip3QytpsI3aSkbmzX79wyaQ3AQruafWXp8
	qiY441wfopSSyIPXfAHFkbkekYshcfL34mseTcGw3cN+Lz0OONrP30axQG/sqVUKFY4da05jatz
	cAh3Pvu/ub3x/CDQmPrvTxDxkZKyT6SxBU1sNlKFr0pYi
X-Google-Smtp-Source: AGHT+IHjaUQr5niEm7m1P01FxdajXDbmlvMCzpXL95Hrgbv2V4VFCIT7fnyOZE76rU6ndWn2JXe7TA==
X-Received: by 2002:a17:903:41d0:b0:22e:3aaa:8bc5 with SMTP id d9443c01a7336-231d43bdb61mr25502355ad.24.1747366809003;
        Thu, 15 May 2025 20:40:09 -0700 (PDT)
Received: from localhost.localdomain (123-194-189-72.dynamic.kbronet.com.tw. [123.194.189.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb728sm5300755ad.60.2025.05.15.20.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 20:40:08 -0700 (PDT)
From: Jay Chen <shawn2000100@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jay.chen@siemens.com,
	Jay Chen <shawn2000100@gmail.com>
Subject: [PATCH v3] usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device Command
Date: Fri, 16 May 2025 11:39:05 +0800
Message-ID: <20250516033908.7386-1-shawn2000100@gmail.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the xHCI 1.2 spec (Section 6.2.3, p.454), the Average
TRB Length (avg_trb_len) for control endpoints should be set to 8.

Currently, during the Address Device Command, EP0's avg_trb_len remains 0,
which may cause some xHCI hardware to reject the Input Context, resulting
in device enumeration failures. In extreme cases, using a zero avg_trb_len
in calculations may lead to division-by-zero errors and unexpected system
crashes.

This patch sets avg_trb_len to 8 for EP0 in
xhci_setup_addressable_virt_dev(), ensuring compliance with the spec
and improving compatibility across various host controller implementations.

v3:
- Corrected author name in commit metadata and added changelog.

v2:
- Fixed malformed patch formatting issue pointed out by maintainer.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220033
Signed-off-by: Jay Chen <shawn2000100@gmail.com>
---
 drivers/usb/host/xhci-mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d698095fc88d..fed9e9d1990c 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1166,6 +1166,8 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	ep0_ctx->deq = cpu_to_le64(dev->eps[0].ring->first_seg->dma |
 				   dev->eps[0].ring->cycle_state);
 
+	ep0_ctx->tx_info |= cpu_to_le32(EP_AVG_TRB_LENGTH(8));
+
 	trace_xhci_setup_addressable_virt_device(dev);
 
 	/* Steps 7 and 8 were done in xhci_alloc_virt_device() */
-- 
2.43.5

