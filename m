Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48E41A08DF
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007641; cv=none; b=QyT3Ap6wHhrMfShY6uPd95Kf8oHisnjCl5nTBJeJ+nDvq9p+7iDna3a3kJhXXCr24c0I0AgI1LnfJxBQ1RMhEqAGRjSf9pZ0ykUdM/+GDcLDRhCvtg0sAkGuZMhHKHNcaqTaX8IBjmDthCQHuNHidpPGPQ4cStGkNkuIKjPVzSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007641; c=relaxed/simple;
	bh=0hShcddQUJ+0eOxNUp6ajHVoa9avM9UDQg3ZWcmCiL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pg3hBKDsEb8ztO05nem2VLrHJDEUqVGPSPoVlw2GXVW+uRLx9P7RF7xS3MYEP0bnab0oXiBFLkTvbT88IDcRIGJQsbbNf9yFa8/6zVQ+jDGmPjIRCKyqKTmfFhW0JRLnRFjp1LCtaDcILJoiR4S7aEC5pCyJ/SCJ1QYA7fvPqj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BobEldln; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BobEldln"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so11504885e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007638; x=1748612438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o8UsG0Cv+W+SbA3fwsKYtIRZq6NFodm959GZlb0m+LI=;
        b=BobEldlnqiWaTKuDsewJMTFSxNvCYZecB70K8TqP34uetLYnLvKGpyyC5zq3rEkTjI
         eWgCpQfnydq73QFaJp/fcbWDK1oBhT3bJ334USJ4qIiWrpvwh+wRWn02EkGoHXd6fVd/
         uYc5+uccy2XP5jPdrI2h8N8IOKW9Q1V6SmusCbReukNKLkpt7NBUj80aUBKUOeZUNghd
         scJ+c302MIs930wH+XE7LSLJXudgvKO7co5B2XVIXK9NrXRlPmx+SG9x5sJ5Z+RH2ujq
         cj+E3fKiaxmHV/XLs+9VHW8RqG+ioWQ4Q6udMMlbDCvLnNQOp3cNsi9cFib7hWL+Tzv4
         eoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007638; x=1748612438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8UsG0Cv+W+SbA3fwsKYtIRZq6NFodm959GZlb0m+LI=;
        b=dEPNzXtexiC2CBtTXfoMZjDIJ6xpxuAs7W2ExZvFf5xMpSjoK6lP2YxWp9X6eVGjQZ
         u166KK4ofq+7UranQUdpvdOi/yRRIiZ7AAK8crj4KYSEuAGJqO4GLPOGVS1N1Lj2xuBp
         vP7zOBKIK15dvcR8J6BL45U8lHu2J9SjKUD1y/H2SC3jhYVbhfInJ2KYJhrsVi61rFk3
         ON8q+weFEqmmHa9Sw/DAw0+jJH5eR/mnUyeSlynR2aOw8E8l4I1t+pLdj4KchCpBJ2oN
         m3EHbkgnNIJ1xKhFmSeT0zPupqXLqilwHg23gS0QIsNxgWcewKrMXMYJLssKy/YvA3eZ
         Gwlw==
X-Forwarded-Encrypted: i=1; AJvYcCX7JpdN0ZuL9o3hTFlElkiz7dnyaiyHA10l2meCY4k1wDCQZ93v8utRgNtGEbIFyit97f4xkykNqQFeBfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YweQajx73F9H6Yet+1ZzsMhLQ9t9lHUfTbPYIR+lcm5JCcH51yx
	LOxzMpg/hj/JFNBi+9ZgVHxprQg7m4LLel/jNtSBoFu/74HwGhy/CvrQyLsj/40TapI=
X-Gm-Gg: ASbGncuA5jqzhqwfiM5LRpTa6KH6Hd1EiOQD0kZus7YYIDVtOX/QfEhthZwCYph9+Mk
	/7X5m1i+4VlH6kNJnfG4HW8BuW/ZDmAVAYD6zRKgTkvNdsWUtTwZyIi7rSqP8tWWnRj5XYeY9Kn
	f7Bi0O37OlQitBDCKNrqv6iIaUw3Quzy/lio+WNDolR24eGb3BFehY2keqzFdAIzUB0FPwq8FZb
	c5yqJxKvFq51noBOvALZbFMqacAeji8Hp56nx8h325w3ck1Zp4TZFyGSO6JC96ZbuGljXV/gmsF
	KaCBlaYQig/FdJNedazb3RXwQgKMffX3mZTqFgJfujL3OfmRmKAU4MXhnQEQQy94DhgaFHgmLMC
	EeFCTRLrCgNwYUDjhwtEKnC5jTA==
X-Google-Smtp-Source: AGHT+IHnygsP+tGAk04VZnCfGgEIdN8EfQ0ZCgQ471fg+idaH3A0yfEu5eg6xgFw+xqxxde3XVbpbQ==
X-Received: by 2002:a05:6512:6081:b0:545:6fa:bf5f with SMTP id 2adb3069b0e04-550e7195284mr7962698e87.2.1748007637808;
        Fri, 23 May 2025 06:40:37 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:37 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/21] pmdomain: Add generic ->sync_state() support to genpd
Date: Fri, 23 May 2025 15:39:57 +0200
Message-ID: <20250523134025.75130-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
	- Well, quite a lot as I discovered various problems when doing
	additional testing of corner-case. I suggest re-review from scratch,
	even if I decided to keep some reviewed-by tags.
	- Added patches to allow some drivers that needs to align or opt-out
	from the new common behaviour in genpd.

If a PM domain (genpd) is powered-on during boot, there is probably a good
reason for it. Therefore it's known to be a bad idea to allow such genpd to be
powered-off before all of its consumer devices have been probed. This series
intends to fix this problem.

We have been discussing these issues at LKML and at various Linux-conferences
in the past. I have therefore tried to include the people I can recall being
involved, but I may have forgotten some (my apologies), feel free to loop them
in.

I have tested this with QEMU with a bunch of local test-drivers and DT nodes.
Let me know if you want me to share this code too.

Please help review and test!
Finally, a big thanks to Saravana for all the support!

Kind regards
Ulf Hansson


Saravana Kannan (1):
  driver core: Add dev_set_drv_sync_state()

Ulf Hansson (20):
  pmdomain: core: Use of_fwnode_handle()
  pmdomain: core: Add a bus and a driver for genpd providers
  pmdomain: core: Add the genpd->dev to the genpd provider bus
  pmdomain: core: Export a common ->sync_state() helper for genpd
    providers
  pmdomain: core: Prepare to add the common ->sync_state() support
  soc/tegra: pmc: Opt-out from genpd's common ->sync_state() support
  cpuidle: psci: Opt-out from genpd's common ->sync_state() support
  cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
  pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
  pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
  firmware/pmdomain: xilinx: Move ->sync_state() support to firmware
    driver
  firmware: xilinx: Don't share zynqmp_pm_init_finalize()
  firmware: xilinx: Use of_genpd_sync_state()
  driver core: Export get_dev_from_fwnode()
  pmdomain: core: Add common ->sync_state() support for genpd providers
  pmdomain: core: Default to use of_genpd_sync_state() for genpd
    providers
  pmdomain: core: Leave powered-on genpds on until late_initcall_sync
  pmdomain: core: Leave powered-on genpds on until sync_state
  cpuidle: psci: Drop redundant sync_state support
  cpuidle: riscv-sbi: Drop redundant sync_state support

 drivers/base/core.c                         |   8 +-
 drivers/cpuidle/cpuidle-psci-domain.c       |  14 --
 drivers/cpuidle/cpuidle-riscv-sbi.c         |  14 --
 drivers/firmware/xilinx/zynqmp.c            |  18 +-
 drivers/pmdomain/core.c                     | 239 ++++++++++++++++++--
 drivers/pmdomain/qcom/rpmhpd.c              |   2 +
 drivers/pmdomain/qcom/rpmpd.c               |   2 +
 drivers/pmdomain/xilinx/zynqmp-pm-domains.c |  16 --
 drivers/soc/tegra/pmc.c                     |  26 ++-
 include/linux/device.h                      |  13 ++
 include/linux/firmware/xlnx-zynqmp.h        |   6 -
 include/linux/pm_domain.h                   |  17 ++
 12 files changed, 294 insertions(+), 81 deletions(-)

-- 
2.43.0

