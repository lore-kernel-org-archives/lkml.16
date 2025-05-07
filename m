Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618DD20D519
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 23:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746660574; cv=none; b=jIwxm5lalcVxN++ONc7+vDXGt5qiEScm6BR4DxBj33cBqDzhKVsCuEmnZ56yyxlELpaapFJ7q6WRKmbu0prY1Afm4QAinjW5L2M9Zz2bN/x3G8pV6SmjKED3QS4H0G4PGTbNKMP6Q3PBzSpuSV0CQqLUXMQTvvLMvkHbTGLAVYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746660574; c=relaxed/simple;
	bh=cA3nZ+47Np47/k2SgDsvbWMsfWOH1A6Ausk1woOuJlw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qDntXKnUlnh1iRRs4oDnh30/tkAZ2iEZvrhBXGQjM8/w68e77gdrBZd5RRrzm9CPTfW0EzgBKfRRIbb6MF1gda6aA0QaCG4ikNau3sNunsbjZg6GQPHlv7c0Hywkj7og/i/YSiRBxlGIepVy3ILH/+QiVX1cE+2u00H0CfVi3Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ammarq.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nSc9E0IF; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ammarq.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nSc9E0IF"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-739525d4d7bso297972b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 16:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746660573; x=1747265373; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g4vZXdmlr0Ib3hABccKLLz+7+GjpdBalfaH2InUcmWA=;
        b=nSc9E0IFu2QYeYCPmh6xkKv9g78oDQoUf4TTBO9L1zExsmmAhHg+kqWJnKhShktCrd
         8ufaA4pDrnmB/nf/laTKzmSGsFVhuJ7pe8fftx7iu1+YuBVz5Xqi4i3mi5YpovwDldvN
         iU89OA4Hqm+9+ciJqumxGNLa7vwILLJE3coHA4iWC2GXGACa9Ml1AOyZiPlowUirHJ9N
         Wy95SfbUVi0ADDwVyEGmfPzI1pOW14ub0Ct81kSyomq3rJ8l+as4yWcD6Bn+dbdjBXJl
         EHDj8J2wMFsyN2sNDWkbCaPBMlUB/bNOEqgT3wtLS5Qq6wJP8G5+aCIFAGhrZZZLTh35
         rm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746660573; x=1747265373;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g4vZXdmlr0Ib3hABccKLLz+7+GjpdBalfaH2InUcmWA=;
        b=MleqyujxGFYE/shTGqYK8sXPPxHm4MR29vnfRdZc9yTA0R7SBaZjlXPqNohRRhSMvT
         uXXHANujdSzcmUpUJlbavEYiyvkAIwhAJxwfPhw2Z62tQZgqu9EcYhOutW7EAzITWTOI
         4n2oARxpmDVa26ZqbqoaFZvV3GPhzpX+WQPEbi0kRodmgSxnSjyVp1ajz6RSrV+5MG+c
         B2F5IyIvrg4knhkO8YdyjG3T4cKBLpSSBIGWzaNP+ehcXl322Aoubj6jRfE2yT8ZJiAu
         79OoEgD3ykJ49hBsTQ/m25J0fDTQCWtW6HMo0hpYjULDlZdegm3QTbS/2bZiOLU/0hLI
         ZATQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8CZ9VWMlrMVOUI3CLhEm/9R+UwwYMssQ/dMimzJZVA8Cru+VTol4FU7Ldmbt0jgtFBK94FgbbUFb4foQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPrHn62GdqVIlxpZefNhA7H+ynTyFsX4mll5dn+eTVgpvrklja
	OAakJLnKVpNHl0UkkVV6A8fvesLwrOVHelMh2CxIzeECG8weCLChSVqdNy8UZsryQXHUBO2XQxM
	HGQ==
X-Google-Smtp-Source: AGHT+IHHAYzNaFA/bcGy/j5LLehiRiaIWZ/+FhNrGNe7rHwAPk8GvTUcemAtW3iw6AAELIGDuhFfIh+cIwU=
X-Received: from pfie11.prod.google.com ([2002:a62:ee0b:0:b0:73e:665:360])
 (user=ammarq job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3305:b0:736:5725:59b4
 with SMTP id d2e1a72fcca58-7409cedc6dbmr8091350b3a.3.1746660572653; Wed, 07
 May 2025 16:29:32 -0700 (PDT)
Date: Wed,  7 May 2025 23:29:19 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250507232919.801801-1-ammarq@google.com>
Subject: [PATCH] PCI: Reduce verbosity of device enable messages
From: Ammar Qadri <ammarq@google.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ammar Qadri <ammarq@google.com>
Content-Type: text/plain; charset="UTF-8"

Excessive logging of PCIe device enable operations can create significant
noise in system logs, especially in environments with a high number of
such devices, especially VFs.

High-rate logging can cause log files to rotate too quickly, losing
valuable information from other system components.This commit addresses
this issue by downgrading the logging level of "enabling device" messages
from `info` to `dbg`.

Signed-off-by: Ammar Qadri <ammarq@google.com>
---
 drivers/pci/setup-res.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index c6657cdd06f67..be669ff6ca240 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -516,7 +516,7 @@ int pci_enable_resources(struct pci_dev *dev, int mask)
 	}
 
 	if (cmd != old_cmd) {
-		pci_info(dev, "enabling device (%04x -> %04x)\n", old_cmd, cmd);
+		pci_dbg(dev, "enabling device (%04x -> %04x)\n", old_cmd, cmd);
 		pci_write_config_word(dev, PCI_COMMAND, cmd);
 	}
 	return 0;
-- 
2.49.0.987.g0cc8ee98dc-goog

