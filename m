Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E81D2F3E;
	Fri, 27 Jun 2025 06:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751005841; cv=none; b=dyJ0tswjsGh77VjNaESa6j49kbnYD7t0i7jeDw2yL20iHUA3hEAgAt9G91EkIteouHNVtPI2CpZb09rWqdWt0ZmFa4H4vj2udY+tIAdQ7E+ik8yEjWo4Qq87lcnXrrQXgTCuOvLZtFtWRz6ibd8U13BM7eq476gvIcMqZpOpJLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751005841; c=relaxed/simple;
	bh=A8g893xtk1dK4cJaLgB0wst2X+UBVHooFVW6CTqVfTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESEjcINqF34qLpvKjOPaFirUGs6V8rcmptltr7ObjBK7XxNh+Tq3dwXPtU2n1wjNdu/KB2UUstJwxV5fnM6M41dBpnl4X3KjkQA4q+82t7Pclg8Vsv+AUzp+R8mp3/0UOfnQN39WGcfyQ+YyArcrsWH1Lr0ce+zdeUSllsKIUJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdCI56KR; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdCI56KR"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23633a6ac50so25789115ad.2;
        Thu, 26 Jun 2025 23:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751005839; x=1751610639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iS5tVSNWUllBELvROnskbRuvuRv6gr3FeSaDzg0SVcg=;
        b=EdCI56KRkmjAUyUrH4RRUSrGWzDzv6HOvtj1bHaIXPx+8TdwJ9p0X0JApgQvQ830T/
         hO+B66OoUDG9N9ihN3573yQQP51qC/1OVpOb2GnYnW/5OKMvgVM0w47LMPBC6nAGw9tD
         6SKgXyH7UMx7/YZ7RT1Zt4O6jK2v1zN1oraaX9hCA94a0yrwe9Ybptp0E+8RXpdmtyAp
         SPB+06+aip0VyNxVf/S7VXoWCYpKWGS7vY7iB//BGCXYu7JFMQIYDQiEjlCRCKOokBuD
         A7HWpaq7RlI6bpIG4yN+fbQIhiVpepAofDovyE43FNIToVBJZx9O6a3ySr1bPLLwlY25
         Gdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005839; x=1751610639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iS5tVSNWUllBELvROnskbRuvuRv6gr3FeSaDzg0SVcg=;
        b=AI+pd0BmgcToIJHYX9Y3WFPY0wInV3zPgTnVX3oJHknHTaazHLoCWlaxVr910ezQFe
         t0cfP0XEqJFF1otkoMh0ZY4f4+6i1D9qjF/imnupv5SMIOou4JABp7tTTSpKPz9DVxFe
         x29ataI5AQPJxzmyAv38surh5qhpBID3rgYtdQ3aNGxcglrI0t2jVOCJYwblmm4aBhgY
         GUfRkftRavOUBIMxLrnHiS3c00UI3RUjwYmnzbKaaXYVwqurEZfFus8bl0VBYcLEINfT
         5q9Fs9sIWLSlSpvj/l6nT+ZA6P3m5pSKagFwrUyL7o7YCo24iV43EY/JHCQYS8M5WR4b
         C29Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUBYwfTlyoPWewohajOfkIzOcD41K6nVhFKj0ACsFi1gOZ+KkQfAJKOHB+m+3LvXPi6+ljXXYmVLsFYbTR@vger.kernel.org, AJvYcCXgA05ZRWdtkESPFwG8qZrPsYpmcOOvEC4/4pjnA01YH+QvVucL5iTaVDVpyGU5FUUS+5wmSTZm2FTm@vger.kernel.org
X-Gm-Message-State: AOJu0YwSXpgd2uFXZNdvajDDazdUIT/VILEdRmR21tKAqeljqZdpvO+x
	eJ4s9yG49t7D8RX7aYqEBaklOSgm5Av02y2Uk1y0edQwYj7LxjJ7gf1s
X-Gm-Gg: ASbGncuRYAMTap1yBpoKpF7RreukG58Tpi4S4RWvqXtShujnm84DDOFKEdmrq06fWvS
	yEo6bv+RAJnfv2ntrDQIupHP6xGlhd5n5LE6p6NVtoTGR00hBKBaZWRAOqLDbxQg/M75rYFuFl5
	4fZ6t8zSRyy09dMhb0MHPxuN9TLEguwnta17RXkAaxS71LeV8ZgUMoqbBytCC2yxGvSVTbCGmJQ
	jf4wjz/VFKWPhz0h2ZyxZr4NOeHQQSxZyyv3ATfQLNcJ56ycFZoBHKiClkpAniSfx73TRTmv0V6
	7F4XSM65I5HdqpLuBwULYKN+yUCTAcH5IJtg4+RFbveNFdkU/AMsPSG415RiXg==
X-Google-Smtp-Source: AGHT+IE+7b9v9Zj2LkXyd2nC+NZQDpDyK3bypoGbpAIzajLvSyCeyoIKvei7PJggtI88oZ0VmbeCOg==
X-Received: by 2002:a17:902:ea0e:b0:238:f2a:8893 with SMTP id d9443c01a7336-23ac4654004mr32944735ad.42.1751005838719;
        Thu, 26 Jun 2025 23:30:38 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2e219asm9090255ad.40.2025.06.26.23.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:30:38 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:30:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo
 CV18XX/SG200X
Message-ID: <kt3envdgn7kxjjvu6mm5hozb3ml64d4s54ssozljmr7qttvxij@hnuzfawjspoy>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-3-inochiama@gmail.com>
 <aF3i3L4BF6YgUMcO@vaman>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF3i3L4BF6YgUMcO@vaman>

On Thu, Jun 26, 2025 at 05:16:28PM -0700, Vinod Koul wrote:
> On 11-06-25, 16:18, Inochi Amaoto wrote:
> > Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X. Currently
> > this driver does not support OTG mode as lack of document.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/phy/Kconfig                  |   1 +
> >  drivers/phy/Makefile                 |   1 +
> >  drivers/phy/sophgo/Kconfig           |  19 +++
> >  drivers/phy/sophgo/Makefile          |   2 +
> >  drivers/phy/sophgo/phy-cv1800-usb2.c | 222 +++++++++++++++++++++++++++
> >  5 files changed, 245 insertions(+)
> >  create mode 100644 drivers/phy/sophgo/Kconfig
> >  create mode 100644 drivers/phy/sophgo/Makefile
> >  create mode 100644 drivers/phy/sophgo/phy-cv1800-usb2.c
> > 
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index 58c911e1b2d2..678dd0452f0a 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -122,6 +122,7 @@ source "drivers/phy/renesas/Kconfig"
> >  source "drivers/phy/rockchip/Kconfig"
> >  source "drivers/phy/samsung/Kconfig"
> >  source "drivers/phy/socionext/Kconfig"
> > +source "drivers/phy/sophgo/Kconfig"
> >  source "drivers/phy/st/Kconfig"
> >  source "drivers/phy/starfive/Kconfig"
> >  source "drivers/phy/sunplus/Kconfig"
> > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > index c670a8dac468..bfb27fb5a494 100644
> > --- a/drivers/phy/Makefile
> > +++ b/drivers/phy/Makefile
> > @@ -35,6 +35,7 @@ obj-y					+= allwinner/	\
> >  					   rockchip/	\
> >  					   samsung/	\
> >  					   socionext/	\
> > +					   sophgo/	\
> >  					   st/		\
> >  					   starfive/	\
> >  					   sunplus/	\
> > diff --git a/drivers/phy/sophgo/Kconfig b/drivers/phy/sophgo/Kconfig
> > new file mode 100644
> > index 000000000000..2c943bbe1f81
> > --- /dev/null
> > +++ b/drivers/phy/sophgo/Kconfig
> > @@ -0,0 +1,19 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Phy drivers for Sophgo platforms
> > +#
> > +
> > +if ARCH_SOPHGO || COMPILE_TEST
> > +
> > +config PHY_SOPHGO_CV1800_USB2
> > +	tristate "Sophgo CV18XX/SG200X USB 2.0 PHY support"
> > +	depends on MFD_SYSCON
> > +	depends on USB_SUPPORT
> > +	select GENERIC_PHY
> > +	help
> > +	  Enable this to support the USB 2.0 PHY used with
> > +	  the DWC2 USB controller in Sophgo CV18XX/SG200X
> > +	  series SoC.
> > +	  If unsure, say N.
> > +
> > +endif # ARCH_SOPHGO || COMPILE_TEST
> > diff --git a/drivers/phy/sophgo/Makefile b/drivers/phy/sophgo/Makefile
> > new file mode 100644
> > index 000000000000..318060661759
> > --- /dev/null
> > +++ b/drivers/phy/sophgo/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +obj-$(CONFIG_PHY_SOPHGO_CV1800_USB2)	+= phy-cv1800-usb2.o
> > diff --git a/drivers/phy/sophgo/phy-cv1800-usb2.c b/drivers/phy/sophgo/phy-cv1800-usb2.c
> > new file mode 100644
> > index 000000000000..1d21db7f875b
> > --- /dev/null
> > +++ b/drivers/phy/sophgo/phy-cv1800-usb2.c
> > @@ -0,0 +1,222 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/regmap.h>
> > +#include <linux/spinlock.h>
> > +
> > +#define REG_USB_PHY_CTRL		0x048
> > +
> > +#define PHY_ID_OVERWRITE_EN		BIT(6)
> > +#define PHY_ID_OVERWRITE_MODE		BIT(7)
> > +#define PHY_ID_OVERWRITE_MODE_HOST	FIELD_PREP(BIT(7), 0)
> > +#define PHY_ID_OVERWRITE_MODE_DEVICE	FIELD_PREP(BIT(7), 1)
> > +
> > +#define PHY_APP_CLK_RATE		125000000
> > +#define PHY_LPM_CLK_RATE		12000000
> > +#define PHY_STB_CLK_RATE		333334
> > +
> > +struct cv1800_usb_phy {
> > +	struct phy	*phy;
> > +	struct regmap	*syscon;
> > +	spinlock_t	lock;
> > +	struct clk	*usb_app_clk;
> > +	struct clk	*usb_lpm_clk;
> > +	struct clk	*usb_stb_clk;
> > +	bool		support_otg;
> > +};
> > +
> > +static int cv1800_usb_phy_set_mode(struct phy *_phy,
> > +				   enum phy_mode mode, int submode)
> > +{
> > +	struct cv1800_usb_phy *phy = phy_get_drvdata(_phy);
> > +	unsigned int regval = 0;
> > +	int ret;
> > +
> > +	switch (mode) {
> > +	case PHY_MODE_USB_DEVICE:
> > +		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_DEVICE;
> > +		break;
> > +	case PHY_MODE_USB_HOST:
> > +		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_HOST;
> > +		break;
> > +	case PHY_MODE_USB_OTG:
> > +		if (!phy->support_otg)
> > +			return 0;
> > +
> > +		ret = regmap_read(phy->syscon, REG_USB_PHY_CTRL, &regval);
> > +		if (ret)
> > +			return ret;
> > +
> > +		regval = FIELD_GET(PHY_ID_OVERWRITE_MODE, regval);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return regmap_update_bits(phy->syscon, REG_USB_PHY_CTRL,
> > +				  PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE,
> > +				  regval);
> > +}
> > +
> > +static ssize_t dr_mode_write(struct file *file, const char __user *_buf,
> > +			     size_t count, loff_t *ppos)
> > +{
> > +	struct seq_file *seq = file->private_data;
> > +	struct cv1800_usb_phy *phy = seq->private;
> > +	enum phy_mode mode;
> > +	char buf[16];
> > +
> > +	if (copy_from_user(&buf, _buf, min_t(size_t, sizeof(buf) - 1, count)))
> > +		return -EFAULT;
> > +
> > +	if (sysfs_streq(buf, "host"))
> > +		mode = PHY_MODE_USB_DEVICE;
> > +	else if (sysfs_streq(buf, "peripheral"))
> > +		mode = PHY_MODE_USB_DEVICE;
> > +	else if (sysfs_streq(buf, "otg"))
> > +		mode = PHY_MODE_USB_OTG;
> > +	else
> > +		return -EINVAL;
> > +
> > +	return cv1800_usb_phy_set_mode(phy->phy, mode, 0);
> > +}
> > +
> > +static int dr_mode_show(struct seq_file *seq, void *v)
> > +{
> > +	struct cv1800_usb_phy *phy = seq->private;
> > +	unsigned long flags;
> > +	unsigned int regval;
> > +	bool is_host = true;
> > +	int ret;
> > +
> > +	spin_lock_irqsave(&phy->lock, flags);
> > +	ret = regmap_read(phy->syscon, REG_USB_PHY_CTRL, &regval);
> > +	spin_unlock_irqrestore(&phy->lock, flags);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (regval & PHY_ID_OVERWRITE_MODE)
> > +		is_host = false;
> > +
> > +	if (!(regval & PHY_ID_OVERWRITE_EN))
> > +		seq_puts(seq, "otg: ");
> > +
> > +	seq_puts(seq, is_host ? "host\n" : "peripheral\n");
> > +
> > +	return 0;
> > +}
> 
> This should be done by host controller and not phy and then use apis to
> set the mode for phy from controller, pls see other driver on how they
> do this
> 

Cool, I will remove this thing and let the controller do this.

> > +
> > +DEFINE_SHOW_STORE_ATTRIBUTE(dr_mode);
> > +
> > +static int cv1800_usb_phy_set_clock(struct cv1800_usb_phy *phy)
> > +{
> > +	int ret;
> > +
> > +	ret = clk_set_rate(phy->usb_app_clk, PHY_APP_CLK_RATE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = clk_set_rate(phy->usb_lpm_clk, PHY_LPM_CLK_RATE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = clk_set_rate(phy->usb_stb_clk, PHY_STB_CLK_RATE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> 
> Should this not be return ret here? or just do return clk_set_rate()
> here
> 

I think return ret is the same as return 0. And it is a good
idea to just do return clk_set_rate.

> 
> > +}
> > +
> > +static const struct phy_ops cv1800_usb_phy_ops = {
> > +	.set_mode	= cv1800_usb_phy_set_mode,
> > +	.owner		= THIS_MODULE,
> > +};
> > +
> > +static int cv1800_usb_phy_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device *parent = dev->parent;
> > +	struct cv1800_usb_phy *phy;
> > +	struct phy_provider *phy_provider;
> > +	int ret;
> > +
> > +	if (!parent)
> > +		return -ENODEV;
> > +
> > +	phy = devm_kmalloc(dev, sizeof(*phy), GFP_KERNEL);
> > +	if (!phy)
> > +		return -ENOMEM;
> > +
> > +	phy->syscon = syscon_node_to_regmap(parent->of_node);
> > +	if (IS_ERR_OR_NULL(phy->syscon))
> > +		return -ENODEV;
> > +
> > +	phy->support_otg = false;
> > +
> > +	spin_lock_init(&phy->lock);
> > +
> > +	phy->usb_app_clk = devm_clk_get_enabled(dev, "app");
> > +	if (IS_ERR(phy->usb_app_clk))
> > +		return dev_err_probe(dev, PTR_ERR(phy->usb_app_clk),
> > +			"Failed to get app clock\n");
> > +
> > +	phy->usb_lpm_clk = devm_clk_get_enabled(dev, "lpm");
> > +	if (IS_ERR(phy->usb_lpm_clk))
> > +		return dev_err_probe(dev, PTR_ERR(phy->usb_lpm_clk),
> > +			"Failed to get lpm clock\n");
> > +
> > +	phy->usb_stb_clk = devm_clk_get_enabled(dev, "stb");
> > +	if (IS_ERR(phy->usb_stb_clk))
> > +		return dev_err_probe(dev, PTR_ERR(phy->usb_stb_clk),
> > +			"Failed to get stb clock\n");
> > +
> > +	phy->phy = devm_phy_create(dev, NULL, &cv1800_usb_phy_ops);
> > +	if (IS_ERR(phy->phy))
> > +		return dev_err_probe(dev, PTR_ERR(phy->phy),
> > +			"Failed to create phy\n");
> > +
> > +	ret = cv1800_usb_phy_set_clock(phy);
> > +	if (ret)
> > +		return ret;
> > +
> > +	debugfs_create_file("dr_mode", 0644, phy->phy->debugfs,
> > +			    phy, &dr_mode_fops);
> > +
> > +	phy_set_drvdata(phy->phy, phy);
> > +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > +
> > +	return PTR_ERR_OR_ZERO(phy_provider);
> > +}
> > +
> > +static const struct of_device_id cv1800_usb_phy_ids[] = {
> > +	{ .compatible = "sophgo,cv1800b-usb2-phy" },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, cv1800_usb_phy_ids);
> > +
> > +static struct platform_driver cv1800_usb_phy_driver = {
> > +	.probe = cv1800_usb_phy_probe,
> > +	.driver = {
> > +		.name = "cv1800-usb2-phy",
> > +		.of_match_table = cv1800_usb_phy_ids,
> > +	 },
> > +};
> > +module_platform_driver(cv1800_usb_phy_driver);
> > +
> > +MODULE_AUTHOR("Inochi Amaoto <inochiama@outlook.com>");
> > +MODULE_DESCRIPTION("CV1800/SG2000 SoC USB 2.0 PHY driver");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.49.0
> 
> -- 
> ~Vinod
