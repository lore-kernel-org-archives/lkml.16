Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC91DDA39
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849980; cv=none; b=FPzfrScSDi2iECEY5J9qLONV+o0v49XodWUrTqUGwTc5qPoon/6oxIJ39ueNOOOiywlw+Po3vH48FCvCr6/iRaSYqXO2gSbnJUuEiQE9kCasvho0KUDLVGnpkfL+H40rzS6xhyn9Tij0VkjO3DYJ8lQNF3z/DEyLSKANt6xBSRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849980; c=relaxed/simple;
	bh=mCsspTE3UaGQ8nT6EDevPiUOVoXq56LZJPwAiRcCzV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhaM+nHG/iJ1/03kQCTpshsGHvqKEnGgMsAOhHi91PwZ+AosK8bYm0GrYf60/xH+zleHbqxQBdeFYDtrCdzSkWuUf3U9YzmLaCzL633sb8LDMMiu08n+BK23jrWiFRbQQRCbvsugztpxVBJV7ZhgWa8QW6uGnIwbeHigiwRiEDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Jl6+TSKB; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Jl6+TSKB"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-73bb647eb23so150260b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849978; x=1745454778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Em25zRDyXTzVtfIF//c+VGrQ1J4twC/n9eclwcMlRg=;
        b=Jl6+TSKBOHorIzC1LTloxKSe8q4/qbMEDaHZg2uM2f+IAsc6Jb6xkr8kzSSFExoMi5
         p9BnEhcyWPAWLCZ3Lr3duBrDI3uhqNiwbC0pcywHbWRjLbMbqGFuhGXk00xFyJ38f92U
         qC9agmQBUB8c5E+KJKKVMnLCh6YqqYwysqLhBFnL/Eo91rfoJ5eWn3RdDd9RoJLxUbtA
         89fA7t3pjr2DCsWbqpesr2lk9uKr3r/xRBa6wa5YQAGTuB+8IjcdFCRciUCwv3ayTgaW
         4PB8/2r3w5/ZIWCnzmwWoToi3YSSIct9e+lbYUhvSF/2MIDVhAEA1wvP7c9i0qJxr4Md
         4OvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849978; x=1745454778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Em25zRDyXTzVtfIF//c+VGrQ1J4twC/n9eclwcMlRg=;
        b=f74/HbrwopsobN5ENT5Xp5OIvAV6WOHT1iAnkyysQz+gWlwSO9TyWAS+RbZjJ5Yird
         i0AiiiANW3YXEbVbzOtnMFQGi3K6/OGrQ673NlYEyVA9EePS7I2O04zdl2o5h9cfu4xN
         8cDZnO19nrEeMncDCRk1YJCR6ovn24d6DWb8RKbkkBsnsHEa+L5UDz9gg83Np2cpCQ9f
         9vp5hJbnF3RCW2FtDVJgHbG3uo0ENEEhsgGJxYE2NMay+CPCL3DAs6vmkzW88k9PlIhJ
         gCN3+f/DXo+v/p8plx2hBNILOYs19MTSe1HsC0UIjzrtApLNKo5tvQ/rfBt6FpuiEjtc
         5kNw==
X-Forwarded-Encrypted: i=1; AJvYcCXTfIi8F6ADR1ouD40wOaHVTtV5hRLDZiQ78zwjNJtN7Fz4e6db0WudtPFb+d7FIspoG6JbZ6W9ZLr4IsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHpHdgpmGPf22H2JV1bMJCfeuXT7e21RGLCJmspl5VIKs8j5vA
	phmm6erkpQ7P1ronlEDPBZnX64DG6NhP7bZWRrx4mMhCd+PuXQMVtQnIatJkrA==
X-Gm-Gg: ASbGncsHFvacm/X19BAJ9b8JMMdMt04n7dmGMvE5z5Fxmiaz4dqUeUAn9IVq33wFUPB
	Aq5xusfQAnLbfuCodX1a69Kw+rvBmFeVkY0J+JBPhX6L71SmeKe0uIhhAnsCm7Y9ZudxF2l8Slu
	1WVd09wyVtq9cFIakV4o7CUQlgShp7EncNlLSM22bl4y5J1eC+hAVFmKfxSk1lgMRMIq4Q7VGNZ
	hn90l3ZfQblJwrk/YKbc5RASHiVLGXFnBJlxQQM3PkkYpeVErGpjkO1gDbJg9BIalu2A9DZU34O
	C4eqc9pBAPlNcBedmNNv8EFYJkzLxAHn0C0mykiJNe5VF64LV6QtJ8CcWgNUexRYkq2wbgoN12c
	2eN5+QA==
X-Google-Smtp-Source: AGHT+IG6v8HH85HUkI2gNJcFwtsUXGFErr/79Ygu9DBV38QGm0Q0z030T8jpk4t+wzZOOcp1rgp8mw==
X-Received: by 2002:a17:90b:4ed0:b0:305:2d27:7cb0 with SMTP id 98e67ed59e1d1-3086402814cmr5665354a91.21.1744849978064;
        Wed, 16 Apr 2025 17:32:58 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3086104a0ffsm2314150a91.0.2025.04.16.17.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:57 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 08/18] staging: gpib: fmh: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:36 +0000
Message-ID: <20250417003246.84445-9-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index f86d3f90bbff..992e6f7c035c 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1031,7 +1031,7 @@ static int fmh_gpib_fifo_read(struct gpib_board *board, uint8_t *buffer, size_t
 	return retval;
 }
 
-static gpib_interface_t fmh_gpib_unaccel_interface = {
+static struct gpib_interface fmh_gpib_unaccel_interface = {
 	.name = "fmh_gpib_unaccel",
 	.attach = fmh_gpib_attach_holdoff_all,
 	.detach = fmh_gpib_detach,
@@ -1059,7 +1059,7 @@ static gpib_interface_t fmh_gpib_unaccel_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_interface = {
+static struct gpib_interface fmh_gpib_interface = {
 	.name = "fmh_gpib",
 	.attach = fmh_gpib_attach_holdoff_end,
 	.detach = fmh_gpib_detach,
@@ -1087,7 +1087,7 @@ static gpib_interface_t fmh_gpib_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_pci_interface = {
+static struct gpib_interface fmh_gpib_pci_interface = {
 	.name = "fmh_gpib_pci",
 	.attach = fmh_gpib_pci_attach_holdoff_end,
 	.detach = fmh_gpib_pci_detach,
@@ -1115,7 +1115,7 @@ static gpib_interface_t fmh_gpib_pci_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_pci_unaccel_interface = {
+static struct gpib_interface fmh_gpib_pci_unaccel_interface = {
 	.name = "fmh_gpib_pci_unaccel",
 	.attach = fmh_gpib_pci_attach_holdoff_all,
 	.detach = fmh_gpib_pci_detach,
-- 
2.43.0

