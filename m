Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759611DF982
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064312; cv=none; b=CgCLKfv+2Cly4BY5B6ma1fDX0+6ktX3/CvoVfG7m8TxsEmafRsM9OAs+ii2OVxwBIeohPo/s6X51QqRIVcVSQmq6Ty8o/rg14wraiqpPbTLGkrevmnaMQOcia1RvK8hvYpOwlOHEZqk7ZDyMy1YMQ0eUgrkkOghkeTak4/82Mng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064312; c=relaxed/simple;
	bh=g7tlwdRNtN0gqtJClqvwnCStjM6vCVUxxCaFkz13PfI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=qDqYeR1EMf8BpUIdPmX2s/2gHfoGXi68aINkTUhLRFjyY1GERa+KOe3H8C52EUWduW5tG1n33Qt2oibNEmouPPRZpthraNOaKhVkpcxmIy4w7G3mn4paygAk8Dypu1+5FubTNuZ1zFwgYbU2Tzs9wDAJ+vKe/CVWrtXfcJ/nDg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--anvithdosapati.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JkzNPxan; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--anvithdosapati.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JkzNPxan"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2eeff19115so5526507a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750064311; x=1750669111; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ERVQz1A2O2BXzPah5knZjJSx5XV0pxIWUqYZQG345/A=;
        b=JkzNPxanarVjXL7Iu8RW6H+YSn7e2LqAE2rbonskKeaGa54b0QtsCjbK7mquaxZkLu
         bSgnGjTJ4iPfa7PXIOiPD6ZIoGR7n3WAIDimHE6yXUVgtMIaZwFr+cHJV6P1ueO8OO89
         vuVgQBw4a6SKkgMD6DXgdDgT4KAY8+WdJy/L8VADaSfB1IyB0WQwOT90teMNHhNClHs+
         eFhudXrrMI5Ga95QHpWOq/Ep0t8hhnlcTx8k3O2bxash4G3JRZAD19ZGUhuZOhUETCOD
         PFwR3VzDbpjgmNHomILvkx7pdtTaqugSB8xzZ5Sc/8y5Vw2KbcmiAzG9LOCRkST1Rxcq
         Vx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750064311; x=1750669111;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ERVQz1A2O2BXzPah5knZjJSx5XV0pxIWUqYZQG345/A=;
        b=QmUgnwCbj0UlU3hPtgfQrIm23EuqqoWhtZV7+MRbr+LEqn0fKtXzaxljByJ7taa9Rc
         7Fky7QmJUnTOOEQQ5gQqN08DX8YkkRIYA/0GW4kUfklwRhp+ikJuParhcJNIU/9NNWzk
         695N2Xr/LyGWBY5yzgbBhCs6blt0/ovT1hSI66xxETUO2EGNJqqj6+RaZh29axeQr2r5
         Dd3/L66X9Hli6BBTfJPctZVjgJO9bPKxNBgQXhJA3+AAPNhMoeeDtTrf9g4qfyDXzIdR
         dR1ppLpA6PllVFJ5ixVqlms+N3VG19/9GyzISCxDjcqsk8VqSmOvupNtwonCPijlMqBz
         VPEA==
X-Forwarded-Encrypted: i=1; AJvYcCXjxFpdIRegzIwlXmGLJ8UckFwmCKo44Uq5Tdjlsib+Dmbt5qbShfpbUnPD0jnHvr62ROSs91IAy1Uid8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwomNyzK3nuXvb+uPxa9h48Jn4yDJZOdDviNkzQO/rmPjQ0tywu
	9JIBwjftZ94i3YSHWJ5hcIeUNi4LCZ1hO414JqyJxkJnkGsZCfrefOyD8Tzdj8X0c7psUX0Y6pT
	N0SjvX+gAhM8ArzM3kbBZselYcQtjD4LDfVNWEw==
X-Google-Smtp-Source: AGHT+IFhXs6n3o6icotL1+3XeLD9ZY9eTAmeu2x57RShZxqj4RSih7awjaXGE2lMq+jpHBr9PWJ3C6BLb0Iepg4J0wUDcg==
X-Received: from pgam2.prod.google.com ([2002:a05:6a02:2b42:b0:b2c:2104:8856])
 (user=anvithdosapati job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9ccb:b0:215:eafc:abda with SMTP id adf61e73a8af0-21fbd4d48f6mr11377195637.18.1750064310866;
 Mon, 16 Jun 2025 01:58:30 -0700 (PDT)
Date: Mon, 16 Jun 2025 08:57:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250616085734.2133581-1-anvithdosapati@google.com>
Subject: [PATCH v2] scsi: ufs: core: Fix clk scaling to be conditional in
 reset and restore
From: Anvith Dosapati <anvithdosapati@google.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Subhash Jadavani <subhashj@codeaurora.org>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, manugautam@google.com, vamshigajjela@google.com, 
	anvithdosapati <anvithdosapati@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: anvithdosapati <anvithdosapati@google.com>

In ufshcd_host_reset_and_restore, scale up clocks only when clock
scaling is supported. Without this change cpu latency is voted for 0
(ufshcd_pm_qos_update) during resume unconditionally.

Signed-off-by: anvithdosapati <anvithdosapati@google.com>
Fixes: a3cd5ec55f6c7 ("scsi: ufs: add load based scaling of UFS gear")
Cc: stable@vger.kernel.org
---
v2:
- Update commit message
- Add Fixes and Cc stable

 drivers/ufs/core/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 4410e7d93b7d..fac381ea2b3a 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7802,7 +7802,8 @@ static int ufshcd_host_reset_and_restore(struct ufs_hba *hba)
 	hba->silence_err_logs = false;
 
 	/* scale up clocks to max frequency before full reinitialization */
-	ufshcd_scale_clks(hba, ULONG_MAX, true);
+	if (ufshcd_is_clkscaling_supported(hba))
+		ufshcd_scale_clks(hba, ULONG_MAX, true);
 
 	err = ufshcd_hba_enable(hba);
 
-- 
2.50.0.rc1.591.g9c95f17f64-goog

