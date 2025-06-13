Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D4A20408A;
	Fri, 13 Jun 2025 04:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749789585; cv=none; b=Dy2IYhePzB8nZzBfi/Ej2Wx+yja/GQqGVmb1VDUryt0P5ewcCraBCQq5Wkg1gdsz2Kp8XlQsiVYfhlU66vHq19DlqVc/qirJRpQnul+JLRZ7ZlA2ZPoRx2lWEHIO5CZUuhayEGaucWjSC9GQJxZJBcf4R0F1WHjHkmkyKh6uNeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749789585; c=relaxed/simple;
	bh=RLUI2Xtzpt/rZgKoWC06w6lCNBKNmbGBsZk1eE4A8rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TURhk9uS2GzGTG7mJilxpNhPMqOmfa75S9A2C8nNvr+Zs+Hq7/zJphFjjrzLkNXgD2gQr48Kzp3vtfreVVUWi2meWnImCdKlN7Ev1smE5gu/IJ4Bu2XuWPFM5tUcSuUnrCPKifqn6t6fSPDucq79lNB4vaJLAjf/7WClZ3jBnC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCldUZFx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCldUZFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749789583; x=1781325583;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=RLUI2Xtzpt/rZgKoWC06w6lCNBKNmbGBsZk1eE4A8rs=;
  b=LCldUZFxbQssm24QnPYGNB1i+skp25szCYUny7iKJFST2yFtd8cFsg2S
   Ml3nwKnaQVRdG93pv0iBYs3mBrMeR9FfGXse7MnsvptGYxPuvev1dnKVv
   34M2CPFxmmljkFT9Qe1IlwmeII+Jh0BwJ6XiUwAQbuuRac1mdhLN1ex0L
   OTmhrda7iPiowHnN0wOQy8rt4y1sf1KXEl6o1p9EXPoH5Qm63w9qwWxDr
   X+CjcSe+SFE+V4Wfj+DnPtya/7BGL3WqKbqZS2MqhL3jIyUFognf3JtZZ
   lGDRWgz6R8MeBQro9GlJNW3p0LK4Q0PZm7UWjmXUhkatbg31LrMKkKqGM
   g==;
X-CSE-ConnectionGUID: Uv3mYAS7TjqCui7mBITG3A==
X-CSE-MsgGUID: B/kF0h5pQ/Gv8fwDT0TW7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="77391718"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="77391718"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 21:39:43 -0700
X-CSE-ConnectionGUID: 48sngEy+QWWj7B/GeSpnOw==
X-CSE-MsgGUID: ecD6PYnZQ029o2M1wms5FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="178618890"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2025 21:39:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPwCW-000CEs-1q;
	Fri, 13 Jun 2025 04:39:36 +0000
Date: Fri, 13 Jun 2025 12:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <jpaulo.silvagoncalves@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Jo=E3o_Paulo_Gon=E7alves?= <joao.goncalves@toradex.com>
Subject: Re: [PATCH v3 3/3] hwmon: (amc6821) Add cooling device support
Message-ID: <202506131212.4UdngOz7-lkp@intel.com>
References: <20250612-b4-amc6821-cooling-device-support-v3-3-360681a7652c@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612-b4-amc6821-cooling-device-support-v3-3-360681a7652c@toradex.com>

Hi João,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b43674a549ed17319cb08ede9e0909ff6198ea70]

url:    https://github.com/intel-lab-lkp/linux/commits/Jo-o-Paulo-Gon-alves/dt-bindings-hwmon-amc6821-Add-cooling-levels/20250613-013059
base:   b43674a549ed17319cb08ede9e0909ff6198ea70
patch link:    https://lore.kernel.org/r/20250612-b4-amc6821-cooling-device-support-v3-3-360681a7652c%40toradex.com
patch subject: [PATCH v3 3/3] hwmon: (amc6821) Add cooling device support
config: hexagon-randconfig-002-20250613 (https://download.01.org/0day-ci/archive/20250613/202506131212.4UdngOz7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131212.4UdngOz7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506131212.4UdngOz7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/amc6821.c:1053:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1053 |         if (fan_np)
         |             ^~~~~~
   drivers/hwmon/amc6821.c:1056:6: note: uninitialized use occurs here
    1056 |         if (err)
         |             ^~~
   drivers/hwmon/amc6821.c:1053:2: note: remove the 'if' if its condition is always true
    1053 |         if (fan_np)
         |         ^~~~~~~~~~~
    1054 |                 err = amc6821_of_fan_read_data(client, data, fan_np);
   drivers/hwmon/amc6821.c:1040:9: note: initialize the variable 'err' to silence this warning
    1040 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +1053 drivers/hwmon/amc6821.c

b5430a04e99508 Tomaz Mertelj        2010-01-08  1032  
6748703856d461 Stephen Kitt         2020-08-13  1033  static int amc6821_probe(struct i2c_client *client)
b5430a04e99508 Tomaz Mertelj        2010-01-08  1034  {
1276fae2a93142 Axel Lin             2014-06-29  1035  	struct device *dev = &client->dev;
28e6274d8fa67e Axel Lin             2014-06-29  1036  	struct amc6821_data *data;
1276fae2a93142 Axel Lin             2014-06-29  1037  	struct device *hwmon_dev;
a051d507ba1718 Guenter Roeck        2024-06-27  1038  	struct regmap *regmap;
194be60020ab02 João Paulo Gonçalves 2025-06-12  1039  	struct device_node *fan_np __free(device_node) = NULL;
28e6274d8fa67e Axel Lin             2014-06-29  1040  	int err;
b5430a04e99508 Tomaz Mertelj        2010-01-08  1041  
1276fae2a93142 Axel Lin             2014-06-29  1042  	data = devm_kzalloc(dev, sizeof(struct amc6821_data), GFP_KERNEL);
28e6274d8fa67e Axel Lin             2014-06-29  1043  	if (!data)
28e6274d8fa67e Axel Lin             2014-06-29  1044  		return -ENOMEM;
b5430a04e99508 Tomaz Mertelj        2010-01-08  1045  
a051d507ba1718 Guenter Roeck        2024-06-27  1046  	regmap = devm_regmap_init_i2c(client, &amc6821_regmap_config);
a051d507ba1718 Guenter Roeck        2024-06-27  1047  	if (IS_ERR(regmap))
a051d507ba1718 Guenter Roeck        2024-06-27  1048  		return dev_err_probe(dev, PTR_ERR(regmap),
a051d507ba1718 Guenter Roeck        2024-06-27  1049  				     "Failed to initialize regmap\n");
a051d507ba1718 Guenter Roeck        2024-06-27  1050  	data->regmap = regmap;
b5430a04e99508 Tomaz Mertelj        2010-01-08  1051  
194be60020ab02 João Paulo Gonçalves 2025-06-12  1052  	fan_np = of_get_child_by_name(dev->of_node, "fan");
194be60020ab02 João Paulo Gonçalves 2025-06-12 @1053  	if (fan_np)
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1054  		err = amc6821_of_fan_read_data(client, data, fan_np);
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1055  
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1056  	if (err)
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1057  		return dev_err_probe(dev, err,
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1058  				     "Failed to read fan device tree data\n");
194be60020ab02 João Paulo Gonçalves 2025-06-12  1059  
cd17587272e284 Francesco Dolcini    2025-04-02  1060  	err = amc6821_init_client(client, data);
28e6274d8fa67e Axel Lin             2014-06-29  1061  	if (err)
28e6274d8fa67e Axel Lin             2014-06-29  1062  		return err;
b5430a04e99508 Tomaz Mertelj        2010-01-08  1063  
8f38236de689af Farouk Bouabid       2024-09-06  1064  	if (of_device_is_compatible(dev->of_node, "tsd,mule")) {
8f38236de689af Farouk Bouabid       2024-09-06  1065  		err = devm_of_platform_populate(dev);
8f38236de689af Farouk Bouabid       2024-09-06  1066  		if (err)
8f38236de689af Farouk Bouabid       2024-09-06  1067  			return dev_err_probe(dev, err,
8f38236de689af Farouk Bouabid       2024-09-06  1068  				     "Failed to create sub-devices\n");
8f38236de689af Farouk Bouabid       2024-09-06  1069  	}
8f38236de689af Farouk Bouabid       2024-09-06  1070  
e98ab50e1f2dd6 Guenter Roeck        2024-06-26  1071  	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
e98ab50e1f2dd6 Guenter Roeck        2024-06-26  1072  							 data, &amc6821_chip_info,
1276fae2a93142 Axel Lin             2014-06-29  1073  							 amc6821_groups);
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1074  	if (IS_ERR(hwmon_dev))
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1075  		return dev_err_probe(dev, PTR_ERR(hwmon_dev),
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1076  				     "Failed to initialize hwmon\n");
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1077  
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1078  	if (IS_ENABLED(CONFIG_THERMAL) && fan_np && data->fan_cooling_levels)
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1079  		return PTR_ERR_OR_ZERO(devm_thermal_of_cooling_device_register(dev,
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1080  									       fan_np,
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1081  									       client->name,
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1082  									       data,
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1083  									       &amc6821_cooling_ops));
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1084  
6364a7ce37ccd1 João Paulo Gonçalves 2025-06-12  1085  	return 0;
b5430a04e99508 Tomaz Mertelj        2010-01-08  1086  }
b5430a04e99508 Tomaz Mertelj        2010-01-08  1087  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
