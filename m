Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD42B21ABC8
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053374; cv=none; b=pXXOV2vaTR2BOmXF7ZjfhE4Cfn5CTtqZJ+X4jYwVs6LHLgbFMfHtBp6NNsKpB9aVMysNjBma2yC6DKYvpvmpRxbioSaOCb6IOqOUbSqIvGBo54l6REG/oA0teVyzoUu8vEVKfKAkGFwNcBWXdq6A2LxlGXTf48PuPld0Ok9HOP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053374; c=relaxed/simple;
	bh=QihDfFv9ga4JrI1pfJodLb6y/r8Sk3I1rAJV/82jHOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dZ/50B5mt9njhHrQ6yGcRZlgFuSpIKN/p7imQbLgvlSaeFat+2DvjL0Vd5PdbKAmeHyIRuuG/RE/2ezgRa4NYIoKjERfyXqclWavQeddCUV45FE1o5w5X6qQQikhux9La0a04AzRussucrssuxkibuan/GW//eWX3ueGKKEN3YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qIp70078; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qIp70078"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-40af40aeef6so824539b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751053371; x=1751658171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHw+WJ64dHACnc7Bud37Nl/T15dKpBv+JiMjM+lyrgA=;
        b=qIp70078W3UO8k0RL5HQTU8zV9d9huyEwxO6PXXdMK7uwIDEWWc1/RceYVOSKGcy0k
         rQAzZ73XlgV+mS2apqddYFv84HBoa5YMZQJNVuOGDaqNAz2Zut3hw0ZOXBERIkigkhLQ
         Fe+P/GfUy0JdxXnboYpr46xJLcJ8PIe8jxIpfEzG5pC7DaxytaH0J5mC3ejCIp/AcK0U
         TMtMpJLkEg4MRx6cnI2AcRd1ma8E1jRkHlSGI2FZuFM0MltH/Sz04tGhS3EDUCjq/zI4
         fIMjaB99CbmuvMxw6U/NAYFIH2lypkbn5GlUEQDqrR7pQZIedTLmVcy7bA1YM8XUBidM
         g90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751053371; x=1751658171;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHw+WJ64dHACnc7Bud37Nl/T15dKpBv+JiMjM+lyrgA=;
        b=Oo4JZ0Q+aFg7+1YewhXe3KGJdnMVDs50aJm8k2N93DmAlMabVSf9PANgXX/qwBlCYQ
         3TAywV3LkWymx67XPSf9vRkruUb+pK+zs9UPDqnmIGpnwhTSgyntRoAxIaTyNd4sLlFB
         gOPmBaI8lI5iRTlZZOe1FPwATX5fbM7iEOVNjwmh7bsaw7AoMS3ov+rqnYhXyarwNEs4
         JWgRsxpFzsC/Iu0b8ko95KkR7xG2P3aa3Ie6K99LtYSnkjd/zFta3VFuAouRTf1O37/9
         MWLwCupXpt/M8vlCcaUfVPUuX1wxb5C7CJW9KoQ7F/PG2XIyk544JfhkvWCxc32rl9aI
         ygPA==
X-Forwarded-Encrypted: i=1; AJvYcCXAyHvWPUqetSSoDNNmMXREawa0ABd5u5WqeoIA/Wjh6nzIh8+4q0D+5aSOuPxq/bJWilDA8uXIdvFtBH8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7IGLTb6fcX2GpAfpe8uSODS4X3GFtgEFWFuF9Ts9tGZ6yHRpN
	2sET2PSFBb++fX1ES6xy2Cp/ruS2yIUdcrRI03P50RqKpqUuO06I7s53D5DsTIOvaZM=
X-Gm-Gg: ASbGncs6O5Jo3nOqUS3tyZXBID+SjRK761hdPHwy88+ZjWv24QhVbv22L61t97rxw/i
	V00TFWDags4mWprfiuZIA5BKSC79vJLaMVV6OdHz6XNi0httwr9LuVR0vfeWfKvIlkJSABxCJFu
	7N2lP0MXN1140rrNxXRPSyo6VQ0h5iMNDm6zYQl3iNjWiASffYaOU1g1W9xk3gCfb6Y1Q44UMeb
	Dbbk2I7cBI/R9sI5J31K36CFAb1Vvrxx54HpCeDiTQdymOOaM/JRdEFwmjdgqGr6G4ZM2qomA5E
	hO0UiFqjilxalWqQNMPAlnahc+p4zA+hAHBVckVux7MWOKYLjvzvPqDgEdPv3Mjt5FiOpg==
X-Google-Smtp-Source: AGHT+IH5uoBFw2Udb6ovo2SD8dpCsBqIYrHL9XKo8HZbUvvBBEOdNkQdnf9VE5Fth+7RjBV02SNJVQ==
X-Received: by 2002:a05:6808:6a85:b0:40a:a8ad:bc11 with SMTP id 5614622812f47-40b33da6484mr2866471b6e.17.1751053370665;
        Fri, 27 Jun 2025 12:42:50 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f3a4:7b11:3bf4:5d7b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b3241e38csm483938b6e.34.2025.06.27.12.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:42:50 -0700 (PDT)
Date: Fri, 27 Jun 2025 22:42:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	broonie@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, lgirdwood@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 4/6] regulator: Add support for MediaTek MT6363 SPMI
 PMIC Regulators
Message-ID: <f4ec5c4b-78e6-423b-8b19-97171c9d93ec@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624073548.29732-5-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-regulator-Document-MediaTek-MT6316-PMIC-Regulators/20250624-154048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250624073548.29732-5-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 4/6] regulator: Add support for MediaTek MT6363 SPMI PMIC Regulators
config: x86_64-randconfig-161-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280258.somyWWgp-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506280258.somyWWgp-lkp@intel.com/

New smatch warnings:
drivers/regulator/mt6363-regulator.c:351 mt6363_regulator_set_mode() error: uninitialized symbol 'regmap'.
drivers/regulator/mt6363-regulator.c:388 mt6363_regulator_set_mode() error: uninitialized symbol 'ret'.

vim +/regmap +351 drivers/regulator/mt6363-regulator.c

5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  342  static int mt6363_regulator_set_mode(struct regulator_dev *rdev,
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  343  				     unsigned int mode)
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  344  {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  345  	struct mt6363_regulator_info *info = rdev_get_drvdata(rdev);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  346  	struct regmap *regmap;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  347  	int cur_mode, ret;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  348  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  349  	switch (mode) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  350  	case REGULATOR_MODE_FAST:
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24 @351  		ret = mt6363_buck_unlock(regmap, true);
                                                                                                 ^^^^^
Uninitialized.

5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  352  		if (ret)
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  353  			break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  354  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  355  		ret = regmap_set_bits(regmap, info->modeset_reg, info->modeset_mask);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  356  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  357  		mt6363_buck_unlock(regmap, false);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  358  		break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  359  	case REGULATOR_MODE_NORMAL:
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  360  		cur_mode = mt6363_regulator_get_mode(rdev);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  361  		if (cur_mode < 0) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  362  			ret = cur_mode;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  363  			break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  364  		}
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  365  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  366  		if (cur_mode == REGULATOR_MODE_FAST) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  367  			ret = mt6363_buck_unlock(regmap, true);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  368  			if (ret)
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  369  				break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  370  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  371  			ret = regmap_clear_bits(regmap, info->modeset_reg, info->modeset_mask);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  372  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  373  			mt6363_buck_unlock(regmap, false);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  374  			break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  375  		} else if (cur_mode == REGULATOR_MODE_IDLE) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  376  			ret = regmap_clear_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  377  			if (ret == 0)
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  378  				usleep_range(100, 200);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  379  		}

ret not initialized on else path.

5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  380  		break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  381  	case REGULATOR_MODE_IDLE:
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  382  		ret = regmap_set_bits(regmap, info->lp_mode_reg, info->lp_mode_mask);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  383  		break;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  384  	default:
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  385  		ret = -EINVAL;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  386  	}
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  387  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24 @388  	if (ret) {
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  389  		dev_err(&rdev->dev, "Failed to set mode %u: %d\n", mode, ret);
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  390  		return ret;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  391  	}
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  392  
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  393  	return 0;
5dae648aed0eaf AngeloGioacchino Del Regno 2025-06-24  394  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

