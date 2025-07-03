Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CDC2EA146
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551668; cv=none; b=lXnPzfmKHnAIBDgl8RSmN8onhTxye1p050trH5EYafcXkwNZNufdqOKa97EjnG65Ehj/tUVoZzN8iYrYozk3+Muvu4sMaKRnW4oLkmUtrObqMQKD4m3BzOi8mNDJSm9YwOaWNCaormllWjnTO8gPnh4U3Vt/w8DSopdpRCCHCWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551668; c=relaxed/simple;
	bh=tZiZ92ztTcdwSFwaDSEjuylr6E2oMfBwx3JEMzcXyII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MRqOtzAnrDtxdLanbVcJFXGe5x/rpMvJuX1fbR0YCrJt57bxsYEv2a8ccgudUNC3e4aXXrFw9y6tePO1Mdki0D2yVSHokOZcn2hs9n0MwWcS9Z2DJ9jEHU0Lc5mdrN6XYqUYsCxgs6MJ0eU9Jcf2HQ17Vuy8cS0JxA0+ztW6WXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xui94Qb+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xui94Qb+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453066fad06so55946265e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751551665; x=1752156465; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ycI4WYThtdNsX6KYwyJiENU7SdlsJACu2s2/RAZVc/g=;
        b=xui94Qb+fQn9ZjakukbMGl2DdqpOFHJY6ZLSYwcBLgPjkKL6hZaoUV3Hr/YzjFvNzb
         zCeQHiKRA/QiTBKY8padANOeys4SBeNSk0GvYFiRXkf7VhoNrAuyJ3sxgOpGTD6G77lG
         jHz2R3Kx+lVrZ+h0/B1telDK8avjKvA3ZsFZPhGTbhPdlpZbZyLPVoHw2acnDkGHOAgM
         mDlp5FknINVQuvhLZb+XMQokPXRmO/BaDCSyBnnbWWADfnz35b1TKWfVoOXf4e/943Fi
         wT2lKZXh9Lxpt9iCXqa1yN3dyRUaMJHzntWAvEJMgIA8/bJYVOKsSsT5S6/2niWaqbdp
         fydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751551665; x=1752156465;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ycI4WYThtdNsX6KYwyJiENU7SdlsJACu2s2/RAZVc/g=;
        b=qaI8eARlfU48Uba3+uWGOGESVO6FA1O0A4TaSpxgA/bp061xTdtpcFNEC5SAH2sSiB
         wDm+HTzL31VKjJsFwOUTPUpwLk9JwcS1PTlVUhMkeoeeCuwRhNZ8yOe2Jy8E2e0GA1eA
         NeHFParkOjJi4nmWDbrsbd/ynONL24Z3Z9jUvLOTGlSCaNyifxBN4ALLNQj4xz2rNSQr
         yENjIdvGwdGNIIueZX+P64rdNqekixU2DbOWikTK9PzDeQGHsHH+KHYB9AP4lIVijWPq
         G2FG8O7BMrfdrQB8O/HVqEeKXQ2VoQEsXYWxkUqqgPDplIMZy1RlQY14imB7chRufeFm
         biDA==
X-Forwarded-Encrypted: i=1; AJvYcCWt/gyMAaveWsiXgTLCvRC6td+/0LuhxidmBQieW52CmZbjRQCXMGJrOG9x2nRgEB3OmhmGIEf4TmYumtM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqLuNTubVmqKBQO5pkOsQV3e3i1Zj0HhHwUNVU5tGwiI1FiTMz
	PNE6auHQsYGDIqiKt41SMs34bMANAyVmkxKw27WyXSuBItGXNCVn3Mqg6GfnAg+JYR8=
X-Gm-Gg: ASbGncuLI6q4YxIM5phJxHk/yBKoL3bVb1qRbClKJOV4oEQNi1OTz8WNCMBY8WP9pA9
	GHAReMrNTHNBaeUJp2ywKh6ULgy7krQfbk+1BGF0NW5wnjHX1pjvvUx/wG6pXxdmwZonaz/lmoe
	BjnF5BDXSGn4Fi0PSQ9ArXCd930/BM8GZaTavO907VfLub2GSBHuhp2Q+BsanxWdALhjCwnlKF2
	VscHrl5Oy3v1TNeIu/yMhgM7FMU0Vaim0BypJickKI95RQdc1HP0CWLy75BD0CtC4hEKCksPck6
	E+cb4x2NM6TixpWlbDSwGKy/MhxZkmlniJ5NxOCtW8ii4hRpDbTsmW4dcNyF4BsJNMylhTQE+Q+
	2wsDwqdT7o8xt0A34
X-Google-Smtp-Source: AGHT+IENaq88sCKdSam+I4emffuT1q9K5iTEZO5saslNhRejQ3SetZS7xkYpcNjBldQAnYj+qmKUfA==
X-Received: by 2002:a05:6000:480c:b0:3a8:310a:b1dc with SMTP id ffacd0b85a97d-3b32fffbbc4mr2523114f8f.56.1751551664251;
        Thu, 03 Jul 2025 07:07:44 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.66.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5966csm18926220f8f.72.2025.07.03.07.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:07:43 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 03 Jul 2025 15:07:40 +0100
Subject: [PATCH] scsi: ufs: exynos: call phy_notify_pmstate() from hibern8
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-ufs-exynos-phy_notify_pmstate-v1-1-49446d7852d1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKuOZmgC/0XNQQ6DIBCF4auYWXcSSgOtXqUxBnGoLIoW0EiMd
 y8pabv83+J7OwTylgI01Q6eVhvs5HKcTxXoUbkHoR1yA2dcsCu74GIC0pbcFHAeU+emaE3q5me
 IKhJqRvXQ10JpKSEbsydjt49/b0t7ei35Jpbx/9JUv48MY4HxCxvGeyXEjRspmpVDexxvUT6tU
 rwAAAA=
X-Change-ID: 20250703-ufs-exynos-phy_notify_pmstate-c0e9db95ac66
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=tZiZ92ztTcdwSFwaDSEjuylr6E2oMfBwx3JEMzcXyII=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoZo6u+V3Q026xLVWd3U0WTHK0GIijnylbPkNaZ
 Nk9sNbretSJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaGaOrgAKCRDO6LjWAjRy
 up9jD/wMpHZvlBCnREgmHLSrg0lxxe2ntcr9OETQ+7+AiDjL5pkH9OAGBPU+NCBY/bCqDjguH9v
 EVtws4IY/0/0VViKPOiH2Y9zJuNyaYNzadlQStEJyHJdDFH5YXfJcRGTtbR+mRehJu+6XK6vXDU
 AK6pemUfcwJ8g03tqVMjURIuJYdRns34AUP/BHPlTV92w7MqEXqjifiNfuDqyhADk5Qeq2Gc5Qc
 Cf5CpXIQmWjOKyU0STy1zlQmUnXjipvGTmmjmzNdRcDqK3eQQzMUL2xbnrc7oqzlXimVgkaDLme
 xOSDaZzsw0YiIsM7zHIv9hrWjjrQckT5JOkcZ8LMMvzvxDHTUcZrTasdvCGElrDcnNs2965dw7N
 7zldXitX3acPMpUtmvyf2DwuITA1Y9oPcE2x7CZxBA7k7YGAUEUUc9f++sG4TmNBgE43Ygokkz3
 OEgP5NJNLUZUiz4rZ4WxT7E5RFO6Aur6uf/EEVRqn+PNHWEYbbTmt6NqZZ7MGy5wGI96/Ku1a2i
 TMLTscMTHr/lOTuYwBcfwhQu/n2ue4ARLjIi0flCIp76E4mQ0dh6up3U2ip1m/E2Y/GBvqx4yEF
 BlWaeijNzs9rAJPCuDdxXxNEqoziojgXHxtp3tj20cOHs2ONAeHknZNQb3+BtzXN/kKcsqcrlqc
 xRXHSsU+e3Jg7fA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Notify the ufs phy of the hibern8 link state so that it can program the
appropriate values.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Note this patch has a dependency on the new API proposed in [1]

[1] https://lore.kernel.org/lkml/20250703-phy-notify-pmstate-v2-0-fc1690439117@linaro.org/ 
---
 drivers/ufs/host/ufs-exynos.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 3e545af536e53e06b66c624ed0dc6dc7de13549f..e9fac23dc15abd685aba4c169c82e211040dec8b 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1574,6 +1574,8 @@ static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 			exynos_ufs_disable_auto_ctrl_hcc(ufs);
 		exynos_ufs_ungate_clks(ufs);
 
+		phy_notify_pmstate(ufs->phy, PHY_UFS_HIBERN8_EXIT);
+
 		if (ufs->opts & EXYNOS_UFS_OPT_USE_SW_HIBERN8_TIMER) {
 			static const unsigned int granularity_tbl[] = {
 				1, 4, 8, 16, 32, 100
@@ -1606,6 +1608,8 @@ static void exynos_ufs_post_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 		exynos_ufs_gate_clks(ufs);
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
 			exynos_ufs_enable_auto_ctrl_hcc(ufs);
+
+		phy_notify_pmstate(ufs->phy, PHY_UFS_HIBERN8_ENTER);
 	}
 }
 

---
base-commit: 4611e0cba12ff5bb64b469cfac129f40f41b5caf
change-id: 20250703-ufs-exynos-phy_notify_pmstate-c0e9db95ac66
prerequisite-change-id: 20250703-phy-notify-pmstate-f02ba5582f65:v2
prerequisite-patch-id: 99070bdd3132b74f7b8932d3d8bef685815a5edd
prerequisite-patch-id: 02cd952ede323864a87816a20e3f6e06b885eab3

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>

