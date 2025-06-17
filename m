Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB06288C06
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145832; cv=none; b=puKD4I/jPTR8AeT/ADNPCa9+4ISrcsdjFLhwyxCmBY+AQKkiKXRkhVAkMC71b6HLNWNXPnZxcgoimkSUx+EreZPy3kIxccu4SSae+XmQ3MUH+G8mz9GW6Ufe+eDNaal8Jla51b/CE0ABBffvbnnYuDn1QKVUHq6WtE0pgOO2/fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145832; c=relaxed/simple;
	bh=Fw0r/pD8eXjBxq5M9YDCHayUq2kGXUfM4+movx1TiNM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rPN8hGSb3Ea6VnRAkQSa5z5aCSNC5TWzUNjeNtRNqTaGBcOLmL5f3LZ0bM0qI4q08d9IqcPBkavnnwjZcInyxYC27/tCPRs/7ubgVG8er/LX9WKy68QN/aDMSfql3iA93Bch+cKd5r4zuz7dDBUyg/DdgS6dJ14C3SQH76RNKBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mrigankac.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z7naIZlL; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrigankac.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z7naIZlL"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2f4c436301so3943463a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750145830; x=1750750630; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sy/UQIqIkh4iDz5Vmt1LhSxZUQWIjcCk5+X9H5FvqVw=;
        b=z7naIZlLMuSOWR9jXKGqu0vEn6sOaXvrWT/M5HMHDJ0/U98x96YKPWiApRsx/r09Js
         VvpCCWJXssxho0+reDehfQCyNO882OcVIoTiiTJ7mWW44L2LBSJs+MFj/2VL/FhAm7hv
         qhk9iaA+u6umpmvUf3eE+QjECZB8ROKoCEGMPien8EQdHmAU78wSN2cP/Jtot/UaYoHY
         zmnAKLAXUo0qY4azG0bHqnI0RERLZQKz4LpCClEZ5bhEEiO6ImtO9n00sYOz417XfP/C
         VPvp4Okq0i9W0zYMA9+OSz9DJomGI2pyRIx7GTB51lwzWlL2GYBRPn4IBiLlUhA1l0NJ
         s9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750145830; x=1750750630;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sy/UQIqIkh4iDz5Vmt1LhSxZUQWIjcCk5+X9H5FvqVw=;
        b=J6lanQxwUPO6LjwFCLZ2tSOx90VT+HOnhx7CUP55Qk87yEftMINQZPyga7uxPs+jV3
         GuwlyKpmGp6lkzgmP2Yqcva3ZEjtAUijRb0hTzu/A4ed5huJuYCGP5+97g979A9j3u08
         CNW5n3Iu6HNH23L1GCHGmAUA1nvHLm+XKiau2EoL76o+E9vC6ofQpVL1sZYF5zmmXJxy
         ZXoeEcDFGcEojreM2WQuHacUqs5wQ4PyPthmqN6rg7J8eWS0TXXJJpX/2MUZH8CS7YK+
         KGpKM7/761AXN6nC+tHwEXA0LlKZaU3Y3bWAbN3EPcv06gHUcI4fUKEEYHkkAT2HOSMR
         NJRw==
X-Forwarded-Encrypted: i=1; AJvYcCV+7Bq/vXfvu3nU66UG0sC/MSa5gbpLFfEBPuujqLNOgeUR+jMVZNBK5A+P1pEv0xendltog3ayDgkLa9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPTFODvQyw/N/+zrBr1oYy7zkrvRWfj/+mHZEUYkHzY2gbufBQ
	qrwOkR0CWESV1o0zf8bx9AyYnWYxSxVf9M1xhn8ml4tZNBfZ1E5AEbwtmg7WoCTLnyjDnA3vANp
	dskvXKeU3O79oLI1owQ==
X-Google-Smtp-Source: AGHT+IEPC+WEQptuRwt14ZtttLHQvynjqrFoVYYin/ZfT1B+AtpRXR5jEzUVjnNSC3heXSLfxA0sDfPfcFVox7M=
X-Received: from pgbda5.prod.google.com ([2002:a05:6a02:2385:b0:b2e:c3bd:cf90])
 (user=mrigankac job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1512:b0:215:d41d:9183 with SMTP id adf61e73a8af0-21fbc62c0e0mr21527045637.1.1750145830209;
 Tue, 17 Jun 2025 00:37:10 -0700 (PDT)
Date: Tue, 17 Jun 2025 07:37:02 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250617073702.1207412-1-mrigankac@google.com>
Subject: [PATCH] ufs: scsi: core: Send a NOP OUT to device before disabling AHIT
From: Mriganka Chakravarty <mrigankac@google.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Peter Wang <peter.wang@mediatek.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, "Bao D . Nguyen" <quic_nguyenb@quicinc.com>, 
	Eric Biggers <ebiggers@google.com>, Can Guo <quic_cang@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	manugautam@google.com, vamshigajjela@google.com, 
	Mriganka Chakravarty <mrigankac@google.com>
Content-Type: text/plain; charset="UTF-8"

Synopsis databook recommends that the host must send a NOP OUT to device
before disabling AHIT(setting AHIT.AH8ITV to 0), if already programmed
to a non-zero value.

Signed-off-by: Mriganka Chakravarty <mrigankac@google.com>
---
 drivers/ufs/core/ufshcd.c | 10 ++++++++++
 include/ufs/ufshcd.h      |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 4410e7d93b7d..f9a2d15ab2ee 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -4507,9 +4507,19 @@ EXPORT_SYMBOL_GPL(ufshcd_uic_hibern8_exit);
 
 static void ufshcd_configure_auto_hibern8(struct ufs_hba *hba)
 {
+	u32 reg_ahit;
+
 	if (!ufshcd_is_auto_hibern8_supported(hba))
 		return;
 
+	if (hba->quirks & UFSHCD_QUIRK_SEND_NOP_BEFORE_AHIT_DISABLE) {
+		reg_ahit = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
+		if (hba->ahit == 0 &&
+		    FIELD_GET(UFSHCI_AHIBERN8_TIMER_MASK, reg_ahit) != 0)
+			ufshcd_exec_dev_cmd(hba, DEV_CMD_TYPE_NOP,
+					    hba->nop_out_timeout);
+	}
+
 	ufshcd_writel(hba, hba->ahit, REG_AUTO_HIBERNATE_IDLE_TIMER);
 }
 
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 9b3515cee711..b069d15c1c71 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -689,6 +689,13 @@ enum ufshcd_quirks {
 	 * single doorbell mode.
 	 */
 	UFSHCD_QUIRK_BROKEN_LSDBS_CAP			= 1 << 25,
+
+	/*
+	 * This quirk indicates that host must send a NOP OUT to device before
+	 * disabling AHIT(setting AHIT.AH8ITV to 0), if already programmed to a
+	 * non-zero value.
+	 */
+	UFSHCD_QUIRK_SEND_NOP_BEFORE_AHIT_DISABLE	= 1 << 31,
 };
 
 enum ufshcd_caps {
-- 
2.50.0.rc2.692.g299adb8693-goog

