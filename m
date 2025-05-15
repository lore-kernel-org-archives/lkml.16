Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4352828A718
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747298086; cv=none; b=BpIIpOezzcmF6nCWuIan6nHeYWziMFtIIimEVav9UI5dLSdNU7Zpk6+RVMLnApxYUUQF6dEdYbR6ca7W6+3ywvRp5w6TfTH+XjiClEsCJfhdWKe/mGP993JaV6R4ZOOAGu9u9EVNZVNGdcybq+lSFjSQPS4cDjzyRKqKxmw0DSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747298086; c=relaxed/simple;
	bh=5Cb6EQdZSJNvGfptwnny4AQlzpNOIDRdpBW0ds+Z9XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9+qSCGcgXTL8NDRTi5wUTMv+DWSTK6eBG6LgaWphUgU+KuwyoNW45RrCtRCGB1J51rAzvcAR7YIrlIWPdk/oZA4tRCg9X3I6tw0iZu6QntfridcdPgL5mgyKiH8ou9pRk0t1bEw0+hHsmoMX+38k2mqNRC+1MXoYrVjrnBDE0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L40qgghT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L40qgghT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so4728485e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747298082; x=1747902882; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NTNydlf5rwZIjCPw7zUm7fKdllwCFJguNUgD96Q4Uu8=;
        b=L40qgghTU4C9HPRMXR0dQucVc4OCWdwSPFboKBszqDGafcoxYr5Btcf4udpSNyL4FQ
         XSTLmv/wscKxS7H3zBRMRjOh6bt8vvDPuYzsSye7dOUUKGIlqAL0RDizWytPa98ZkiOj
         9bb9WPAsUzrbrdjH45Vk9MmKEYAU9jmiivK2onHnI535MNOtCzIPtv1NO413TKO8pyC6
         wbR3KDKHP2rUVCkTkAWfOFGAWCTxqsdZ2yo2lTsJxm2PbyUZcx4Lz43qJxfQyIybKUT6
         PEPIscv9DzLxXdYSTpwnBcWaveb2+z/AfWzTEsB/eWH8zmMLQVEjS2K8y4jjxtvRoAt7
         jbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747298082; x=1747902882;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NTNydlf5rwZIjCPw7zUm7fKdllwCFJguNUgD96Q4Uu8=;
        b=ScFwPxvqfi+0hp/N3u37Mey39UmiMUpi9gbUOsqsemNFHbXD4VKzFxXBNuxTCOr6CH
         DgM3W9C/M8aNQj8ri2HtfxikLkZbVdSCJuQWe35AFLRn+p2qLRKxiS06X0hVVEmp8z4+
         kFZjCv0EfmhtwcG5nFmTNSklFjbmoAULvPEFyXdGfj1uB8ljlHPCcvhzdgEYeGgfkJXv
         9DEED/x/4cc/QD0xup8lPdpM6M3uQ/2B3zA/8iSvroUJdqTtmUEcrJX9fnFsZf2ujB3K
         wzz3D9udJXLZfmp6pplZRfJH26FxkDeJNI8mqlFqSpEuOxjIy1+tno/BpF2iXHqVN5L0
         PhkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPkKocRBitdr7LOF6zmJ0REGwafVTt88VhatG4cI5kXNcpeM9+YXyA77jxXj+cfDYLbxhvEyfK5Q2mdlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfzXuu1aVR4zfDmdQERt+aWurWpxrKOmcOvtzj1/Q2xrCsjZ1a
	CFDQmb4Ki9rXihtFXKL/kwF0/eVLz/m/l2PW2kT3JjV/tB4r394Z1zBb7y8p7LZ6AbQ=
X-Gm-Gg: ASbGncsNjjdhWBXvt+fk5Au08reocu4VSroGEizBfKOuLEU3lKPzxX5lvmBLa/RX3FJ
	GL5kW3WLsOtdupXFmfzKvPIN8EzDZs1Y3ypx5NFcsYgtQVpsTHzxnu/LYPhODzKApsIkvAQf0l5
	A/M2dV6uisG3GSDE4hfL8t0hesAYuQUmGUiGlrsSaJHj/mzhltfzMOwig0unFIXXj0LsK6Q9E82
	ZXDSBw1n7uqpi0pmmTLvASXY28OUrUfqvo7ZwsuYXVJEFLeU+N8G0GIdHWZBNuBgdw2aTuV8ZMy
	ZAFUTr/UXCzpbyrkPZ7kj/FkORyIl26+97GEOphRv1pMYduEpqXyo6hz1zVNuszoJl14EJ9F0Ue
	gUUw2xQvGVdJtJQ==
X-Google-Smtp-Source: AGHT+IG2bIbDRbPIb0zDXbKIFTjTwG3dmfj81Y0Pa+mphZgCx6Es+dFTY7SfBNrnVwGtvcAMyRjyQA==
X-Received: by 2002:a05:600c:3d0d:b0:442:ea3b:9d72 with SMTP id 5b1f17b1804b1-442f84ca3ecmr23841765e9.5.1747298082371;
        Thu, 15 May 2025 01:34:42 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39794cdsm61538495e9.38.2025.05.15.01.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:34:41 -0700 (PDT)
Date: Thu, 15 May 2025 10:34:40 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to
 DT schema
Message-ID: <aCWnIBAPBVqBHGHJ@mai.linaro.org>
References: <20250506022301.2588282-1-robh@kernel.org>
 <202505082358.dnIeqrs0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202505082358.dnIeqrs0-lkp@intel.com>

On Thu, May 08, 2025 at 11:42:26PM +0800, kernel test robot wrote:

Hi Rob,

> Hi Rob,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on tip/timers/core]
> [also build test WARNING on linus/master v6.15-rc5 next-20250508]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-timer-Convert-marvell-armada-370-timer-to-DT-schema/20250506-144131
> base:   tip/timers/core
> patch link:    https://lore.kernel.org/r/20250506022301.2588282-1-robh%40kernel.org
> patch subject: [PATCH] dt-bindings: timer: Convert marvell,armada-370-timer to DT schema
> reproduce: (https://download.01.org/0day-ci/archive/20250508/202505082358.dnIeqrs0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505082358.dnIeqrs0-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
>    Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>    Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
>    Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>    Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
> >> Warning: drivers/clocksource/timer-armada-370-xp.c references a file that doesn't exist: Documentation/devicetree/bindings/timer/marvell,armada-370-xp-timer.txt

Will you send a separate to fix the reference in the driver ?

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
