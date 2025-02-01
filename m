Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0569208A9;
	Sat,  1 Feb 2025 16:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738428772; cv=none; b=AOS7KiTYQfH6OEHEhrfwCMvm85Ry7A+Uul04PNQG4xqPHrptt8T+Uf5o4fDkd+FBUDAN0leSpBdbWQlPjzbyebQ8ohVzHoz3X85Bfjcf3gGORrE33e1vhRVj2sAo9Ire8ilwZw2jAxdr+FCMWaUZhUxPcAXWVzGMitOfvnpLHWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738428772; c=relaxed/simple;
	bh=MGMbXg/l4cT2mVq5Z460kZHZEWj1jubCnLtTj3OH4lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rTrf6lnH7Wcjj3Zx4sZ7wnBlT9R+CdRuOLoE/g9Px23Yy9+20nF840nYULCcDW2g0V9dphC1r31VhCqUt2WuoXU3Hg0JuFcSh5a/K8MftgI7PBpWoxtbi0hY9HP+NQl3/jFU0cQCtC/CEiOqTl/ZmzL92bYg3GUptXdGGzYjUBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9fdFv2g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9fdFv2g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6FC8C4CED3;
	Sat,  1 Feb 2025 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738428772;
	bh=MGMbXg/l4cT2mVq5Z460kZHZEWj1jubCnLtTj3OH4lk=;
	h=From:Date:Subject:To:Cc:From;
	b=m9fdFv2gFykxrh2G726bUQ4w+w4Y1F94Sqsa2Sikna95GnEKLB2P7OIK9W6B6tfBr
	 kOvURrHYNFcoXJHCaoXvHQ49rBsfsP2oYEC7nFX1n13uW2rcb7X2zDbp1M9YtylJ1J
	 tQ5qZdk8RvWpUWeL7BFkWmhvYGN0eus2flE2twVZ8Bw2kN3Q6x525P+a1H5XJ7ctJH
	 LEVZB54cjvO5jN225b4yDzTy8KfPQaqBzTzn4pUyozoVW91YMmXLog7mgjLmt6fkAH
	 xrrzZrPHx/IYcrCPWs5alJet4EcW5ytQX1aRp47gZ9r6gNxjl4YvGgzplAq8PavXMF
	 FcJaYqbTjQZGQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 01 Feb 2025 17:52:30 +0100
Subject: [PATCH] clk: Warn (and therefore taint the kernel) on
 clk_ignore_unused
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-topic-ignore_unused_warn-v1-1-f29db78cea3a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE1RnmcC/x3MSwqAMAwA0atI1hZq0IpeRUSKRs0mldQfiHe3u
 HyLmQciKVOENntA6eTIQRKKPINx9bKQ4SkZ0GJl0RZmDxuPhhcJSsMhR6RpuLyKwar0jXOzw9p
 Dyjelme9/3fXv+wEJPDFoagAAAA==
X-Change-ID: 20250201-topic-ignore_unused_warn-254a966f627a
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738428769; l=1975;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=RUMTNPwf39+R3he/xz33fiHQcMU6Lh+Bmch14er4pSY=;
 b=F95J3OADT0N/lGBf0V6M8IOA7T0LxEemcA0qlcgZVs4t+jVd5i9ILtKjNpi+4tkLwZm89oJqR
 5PUlX8niPURCcL/TZBr+VWXPLBJD3nN+izTK/0zWTRRTtyUT2CMWQk6
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

If any sort of ignore_unused is in place, it means one of:

* power is going to waste
* the platform description is incomplete (missing consumer-provider
  relationships)
* the platform description is just broken

Many people will happily declare their job done when a platform
magically happens to work as they make use of bootloader-enabled
resources, which then leads to double or triple the amount of work
of another person, as they attempt to reduce the unnecessary power
drainage and/or ensure stabiility throughout a suspend-resume cycle.

Issue a good ol' warning (and taint the kernel) to make such cases
obvious and hopefully draw more attention to it. This way, it'll be
easier to avoid effectively untested code or DT description getting
merged into the kernel, or worse, going into production.

The clock subsystem plays a crucial part in this quest, as even if
the clock controllers themselves don't draw a lot of power when on
(comparatively), improper description of clock requirements has been
the #1 cause of incomplete/incorrect devicetree bindings in my
experience.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index cf7720b9172ff223d86227aad144e15375ddfd86..9e2e240efc31f02e4880542370ba773037b733a0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1527,7 +1527,8 @@ static int __init clk_disable_unused(void)
 	struct clk_core *core;
 	int ret;
 
-	if (clk_ignore_unused) {
+	/* If you need ignore_unused, your platform description is broken / incomplete */
+	if (WARN_ON(clk_ignore_unused)) {
 		pr_warn("clk: Not disabling unused clocks\n");
 		return 0;
 	}

---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250201-topic-ignore_unused_warn-254a966f627a

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

