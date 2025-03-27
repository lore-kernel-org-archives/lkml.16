Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFF378F43
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743053009; cv=none; b=Gri2FNVOYVVUnOvwIJwHPbWsxewy3bGfVIbHTEs+VtAYjWwYq97sUVhFEj3JAkI6LLZCd4erydXXcqGrY0CJiPuYyrs2QTVZyoEpkv1D9tT9biZR07otLMxLDX5x7xQXgWGRFL8Za/BdbwikvbHanvE2wVeI7Kj6O/hRLNxKMg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743053009; c=relaxed/simple;
	bh=vciYr/bB2Z030OzCKKWlzUHRiut4nQ8Rn0W4u8S2Avg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YhXwPKVEO8QTtSVGNi8olhLRYdUH9w8zYDYuPMJ3cS46xhiOVILbzCYt7t+bEQYB4aW+FXNL1ixFqd2CuO6QG5j3n+whOXbxFj1dfkdCD+Ufdno9N0EWIpRCKDOVlUhv4yCZ0+3wNCGhkplAfw+PzGV+U5vcGbk9LBHKj9dy9Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MfXW1iYW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MfXW1iYW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43690d4605dso3673935e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743053004; x=1743657804; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Be3xrXZBKcyj7JgwFrFZrJzYdk2fkCS3DpDGsgYxVdg=;
        b=MfXW1iYWhv3WO4S+Wz7O2GRItNaGxV5ym0+4cxmHc5IWGSTaVIiGGjKGQ6GIKev1hX
         lsOJhdnrLuGGZE3d/0EG1MkK6WoM+fTfyuODOIWNyRT9xhmNqYtMZJ9fVEMj5AzRB8qh
         5/aGFYOn8aDDLlHPiXda00Ju519x43YxZd5KS91Z86ntHcRTZJP2VEqp0VzPdk7hcZ1X
         2ZPiLow0ABCz1aD2uHi2lqsYbyUbUC5E3zX5/SUXSZzmt/F8OCw9ouioyOjGt2mwN9+l
         xDhbkmSXc3q+kKBmrbOhLmD9OK/cLrXG+GGbMbyySMTf3m6cqu7ZYgaIQTDrxm6jCh9h
         h06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743053004; x=1743657804;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Be3xrXZBKcyj7JgwFrFZrJzYdk2fkCS3DpDGsgYxVdg=;
        b=sdeMzwfbUy0JlmJtwIYz1ZRaQ2bdwdI+sPeaAVg3dnfCubPGz7nu+qwAWQtnJnubqE
         dBalVl+4bRvONSHdNwbstAUlbTi27k9N/OMjSjpc9HbHiqw8VE6d2g8jysc7/pBurpUi
         safR8G+qjQ827uBFYKICt3FoiVLKjrW+yqpSu4DcmgzENa4/UXA7qrmtgJu4cO5bSHqQ
         8oAHfwgG5pEAsKuNulCoRYLawrEhtnYXuoYgbuD5wDpVoObGaQRGesXJmih9KDyUsdRd
         iUjrWQL0hCNfobUW+PgfiEpUqYG6/ns2j6PnAwzE7iRbOPihzXQaFEfXGiunUXUvkced
         9uWw==
X-Forwarded-Encrypted: i=1; AJvYcCXXYv0zkuFh6SzISh0dJCznQM8iw+qpri0Ko7PKqq4iGmwGRpzqK+A5lUezabwCfYQx3mIiUW6ecw4DpZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ax88SEmUCQtAih/ZyZ6+EtmpUoF7+enc5FSjCPTcUcEam0+k
	u+cVVlxssmRd07fPIr6ALzEjyU7lhINTvc1CPT00v+7Lu3zool7m0UwK0yyeRRI=
X-Gm-Gg: ASbGncs4UjqBIXfstpWq2HBcAmwAgkNk8G6osJfWkJ8sHly9Nz2Z+W7vN7kUUIZwriQ
	aKS6XtAw9awx/1EYOr9s190QScLZgqt6N/eHgloBFo6Ifmm7EyFfEGxtMgDEF0H1SpMw3DiW7OG
	AwAKYQiHmO9w+3R5T5C3EWk8uQF1TQEHfr/vjHBlJriDzM2HwK0oLU8xLvoDiL7HhFQgG23p9xf
	9wc5IuL3c8unpX68WgNGrtYrDVETb8Gul8oLyUszmTS3bJLFZESMeQbBi/XmeFco8L4CBDZzAGK
	jUHOLpU8gD8Qze3wG61feXdA03dyoPRALf+nXHAusbJ+XRX+
X-Google-Smtp-Source: AGHT+IF9CBeiGU2yZrZ82k/O6kOKzwqAnDoVlC04vE5L4Mi7wpTwe8x99x+/dOX3Nu3l5H5388tZow==
X-Received: by 2002:a05:600c:4e56:b0:43d:bb9:ad00 with SMTP id 5b1f17b1804b1-43d850fd05amr16409025e9.15.1743053004471;
        Wed, 26 Mar 2025 22:23:24 -0700 (PDT)
Received: from localhost ([41.210.155.240])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d830f5708sm25814215e9.32.2025.03.26.22.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 22:23:23 -0700 (PDT)
Date: Thu, 27 Mar 2025 08:23:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Joerg Roedel <jroedel@suse.de>,
	Nick Kossifidis <mick@ics.forth.gr>,
	Sebastien Boeuf <seb@rivosinc.com>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: drivers/iommu/riscv/iommu-platform.c:54 riscv_iommu_platform_probe()
 warn: 'iommu->irqs_count' unsigned <= 0
Message-ID: <d1eaa67e-3766-46c6-95cb-69cb9e91fc29@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f6e0150b2003fb2b9265028a618aa1732b3edc8f
commit: 5c0ebbd3c6c6e00af112fe053e81ac0c7cafe647 iommu/riscv: Add RISC-V IOMMU platform device driver
date:   5 months ago
config: riscv-randconfig-r072-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270710.nzXdpHfG-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503270710.nzXdpHfG-lkp@intel.com/

smatch warnings:
drivers/iommu/riscv/iommu-platform.c:54 riscv_iommu_platform_probe() warn: 'iommu->irqs_count' unsigned <= 0

vim +54 drivers/iommu/riscv/iommu-platform.c

5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  20  static int riscv_iommu_platform_probe(struct platform_device *pdev)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  21  {
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  22  	struct device *dev = &pdev->dev;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  23  	struct riscv_iommu_device *iommu = NULL;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  24  	struct resource *res = NULL;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  25  	int vec;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  26  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  27  	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  28  	if (!iommu)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  29  		return -ENOMEM;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  30  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  31  	iommu->dev = dev;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  32  	iommu->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  33  	if (IS_ERR(iommu->reg))
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  34  		return dev_err_probe(dev, PTR_ERR(iommu->reg),
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  35  				     "could not map register region\n");
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  36  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  37  	dev_set_drvdata(dev, iommu);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  38  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  39  	/* Check device reported capabilities / features. */
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  40  	iommu->caps = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_CAPABILITIES);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  41  	iommu->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  42  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  43  	/* For now we only support WSI */
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  44  	switch (FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps)) {
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  45  	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  46  	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  47  		break;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  48  	default:
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  49  		return dev_err_probe(dev, -ENODEV,
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  50  				     "unable to use wire-signaled interrupts\n");
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  51  	}
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  52  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  53  	iommu->irqs_count = platform_irq_count(pdev);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15 @54  	if (iommu->irqs_count <= 0)
                                                    ^^^^^^^^^^^^^^^^^^^^^^
Unsigned can't be less than zero.  platform_irq_count() returns
-EPROBE_DEFER on error.

5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  55  		return dev_err_probe(dev, -ENODEV,
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  56  				     "no IRQ resources provided\n");
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  57  	if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  58  		iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  59  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  60  	for (vec = 0; vec < iommu->irqs_count; vec++)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  61  		iommu->irqs[vec] = platform_get_irq(pdev, vec);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  62  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  63  	/* Enable wire-signaled interrupts, fctl.WSI */
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  64  	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  65  		iommu->fctl |= RISCV_IOMMU_FCTL_WSI;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  66  		riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  67  	}
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  68  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  69  	return riscv_iommu_init(iommu);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  70  };

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

