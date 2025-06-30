Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D582528E574
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751300802; cv=none; b=rxCWbsLiaFRF8jaXcpD7A6QHOQHclD4X+2evsu4q0E7hLyuRefVh4FeHyQKWGlrcVAd9xWDvHHFqAYtLfQONeHKtM1n1w9Zf2Fy5j+D5w+7f37EeUFwmhX6Tap80SoIfimjPxDhufTsM2ELNu1pwdXlJ00SRpPWiPJ5wozuNApY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751300802; c=relaxed/simple;
	bh=ZYMR7z5T+7I0DbIT2AphsLI9oq3i24aPeQXV7iyq+7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=b2J7m7PzRT+w7iomIY+agouQBEzpYNcwKPKYxx7pokfBpT5AbxQfhrz/CdfQ461i4qJCYGLnTG8k5KEzJAcNn7QGQI+NrIquuqhLb7dq1eYIFqtlV9nv5u7ug+xThJi0TQerDeJQ+4h2h8ntJPMCQRCkx/SnoINqVNYYncBwU7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFO0IwV0; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFO0IwV0"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so4947584a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751300797; x=1751905597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=535W8k9pU5sUVdNwdQXzTxnf8TouFsbPOMvqYlYzbaQ=;
        b=OFO0IwV0VDUks6qHfeiGp1/dKfJCKWcgO6RWOtzyf71T9imsy/Hm5ed1RYAH24S/Ua
         36PyhOXMeqqgmJ1UDvTm2nLjBqt/X9bux4SwYum705Mi/TpWCcx1hTP+L430TxsnOX/x
         YOVEwWqQBzg1+7kAyTrKv4M3BX+nvwLHkMnFQZlUxHxqQ/Hk/NyGOsWLtcaY+3WIH4N6
         Hy+c4A/cErKg0i2kRQnxa73hhiXbVI/iqRLBx7SdsXHXAYXgphVe6c8kTPBqXNm2Z5/A
         tgicq+SED/IdcMFLq4rAe1y6EpWNjeagJ6u63YiNVFBOPhOS4y7bLjrcTYyaHs+B4PYK
         e76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751300797; x=1751905597;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=535W8k9pU5sUVdNwdQXzTxnf8TouFsbPOMvqYlYzbaQ=;
        b=VrJ0qpgMexRPNbFgigZ76IrxX5xnlK5g26wieUwAVhtJRF+cj411zkyPoZMtDrOBKf
         tCb3TeWp9H4/5Ji/nlzq0UeQcZhUZK6wDFciPF8es67RXB7rudqwKIimdYOUuD1HMUKo
         jHvpJ4aAtvahsMM01JuDb7Tb+OR9+RgZ6FrRXidaFbmCQIvTW91mKRBWYNbkTX7/G2wi
         6/54MFnauzQ7Ulpf5OWphazLGdqSBnkF/UpA9AJ/wXoax77o92l4i3Nh0QOcY3RL3GsH
         QPRd8mCf+NwgHTj9A8177Rr5ubL+Yexb/EpPB4hIjvo7fFD4blGY3l0nZYtjJjfkFVjb
         UYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrQrysCW+Bi0ha0yLiv2J90Svexg0RXJQzQNNabHvNd6TBKNlriy3dCvLRldfKSi7g4Y2mxd2W6gIJUPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJI5B5N5KOPoR9rs869V7MkLD9EYSplDOY/ZPho+Bi473LpHmc
	cQIYq173JI9WkexH6vJVl/fRJLPyNXFxWEPScwrsrA7C887M7XC3xmhZ51tYd0KxZvI=
X-Gm-Gg: ASbGncszxeAuSRgaQC8RoGefbLJLQrAxpkSxPU1Bn66jmxck+1MxvmRtn/Nv69651n9
	mSStTD871iiWpMt5oESoz8NgY3kxnhNVbPiVL8ecR4nUH1Hq8mIYuSgLVGnpLhOBQB8gRs4P/dt
	FlClHrCyaxGQFmT822bOcAGvb3mcOl4HJz7TM/bMEoHYmTY0PQyhoxF3AnT9yHZrtiJb5l56NdB
	2dbC6h96AZNZcRFCXBOsFTCFiFfqBaOKv5Y4bU7qzq5kAXjFZ785Mo1xbpicx3IXOTjNmPt5sol
	41KTeWOryjXbfb9TNnHHdxtuePgVc2pwFkHsqElHwQz/Yoaag7PhXfuhmgyEwlLZqKAiaxii1ar
	tfvE=
X-Google-Smtp-Source: AGHT+IEZUFYK3OlqCsPYEUjbY6KleNynpLo18SzDo4cGFtE9VgvfMNqI4nas16gqs6EKpGcliuTGQg==
X-Received: by 2002:a17:907:94cc:b0:ad8:8719:f6f3 with SMTP id a640c23a62f3a-ae34fdbbadfmr1268647466b.22.1751300797043;
        Mon, 30 Jun 2025 09:26:37 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35776d0ebsm685350066b.155.2025.06.30.09.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:26:36 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:26:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shradha Todi <shradha.t@samsung.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-fsd@tesla.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, vkoul@kernel.org, kishon@kernel.org,
	arnd@arndb.de, m.szyprowski@samsung.com, jh80.chung@samsung.com,
	pankaj.dubey@samsung.com, Shradha Todi <shradha.t@samsung.com>
Subject: Re: [PATCH v2 09/10] PCI: exynos: Add support for Tesla FSD SoC
Message-ID: <5ed352de-8319-4e3f-8cce-43a4bb332e66@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625165229.3458-10-shradha.t@samsung.com>

Hi Shradha,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shradha-Todi/PCI-exynos-Remove-unused-MACROs-in-exynos-PCI-file/20250626-104154
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20250625165229.3458-10-shradha.t%40samsung.com
patch subject: [PATCH v2 09/10] PCI: exynos: Add support for Tesla FSD SoC
config: um-randconfig-r071-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301329.VWoiH0yn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506301329.VWoiH0yn-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pci-exynos.c:621 exynos_pcie_probe() error: we previously assumed 'pdata->res_ops' could be null (see line 609)
drivers/pci/controller/dwc/pci-exynos.c:655 exynos_pcie_probe() warn: missing error code 'ret'

vim +621 drivers/pci/controller/dwc/pci-exynos.c

b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  595  			dev_err(dev, "couldn't get the register offset for syscon!\n");
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  596  			return ret;
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  597  		}
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  598  	}
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  599  
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  600  	/* External Local Bus interface (ELBI) registers */
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  601  	ep->elbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  602  	if (IS_ERR(ep->elbi_base))
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  603  		return PTR_ERR(ep->elbi_base);
778f7c194b1dac drivers/pci/controller/dwc/pci-exynos.c Jaehoon Chung      2020-11-13  604  
10106d5c1f9cee drivers/pci/controller/dwc/pci-exynos.c Cristian Ciocaltea 2024-12-17  605  	ret = devm_clk_bulk_get_all_enabled(dev, &ep->clks);
6b11143f9344dd dripdata->res_opsvers/pci/controller/dwc/pci-exynos.c Shradha Todi       2024-02-20  606  	if (ret < 0)
6b11143f9344dd drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2024-02-20  607  		return ret;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  608  
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25 @609  	if (pdata->res_ops && pdata->res_ops->init_regulator) {
                                                                                                    ^^^^^^^^^^^^^^
This code assumes pdata->res_ops can be NULL

ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  610  		ret = ep->pdata->res_ops->init_regulator(ep);
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  611  		if (ret)
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  612  			return ret;
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  613  	}
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  614  
ed1b6ec2c47ce8 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  615  	ret = samsung_regulator_enable(ep);
3278478084747c drivers/pci/host/pci-exynos.c           Niyas Ahmed S T    2017-02-01  616  	if (ret)
3278478084747c drivers/pci/host/pci-exynos.c           Niyas Ahmed S T    2017-02-01  617  		return ret;
4b1ced841b2e31 drivers/pci/host/pci-exynos.c           Jingoo Han         2013-07-31  618  
b2e6d3055d5545 drivers/pci/dwc/pci-exynos.c            Bjorn Helgaas      2017-02-21  619  	platform_set_drvdata(pdev, ep);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  620  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25 @621  	if (pdata->res_ops->set_device_mode)
                                                                                                    ^^^^^^^^^^^^^^
But this dereferences it without checking.  Most likely the
NULL check should be removed?

b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  622  		pdata->res_ops->set_device_mode(ep);
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  623  
b9388ee21b4e79 drivers/pci/controller/dwc/pci-exynos.c Shradha Todi       2025-06-25  624  	switch (ep->pdata->device_mode) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

