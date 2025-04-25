Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655B5199E84;
	Fri, 25 Apr 2025 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745598279; cv=none; b=JSl8iFtUQVOmesRET3rzAEgmSgIWBwKAKlbTuRK5J8A0y6MMdRMSAQo1MosZQ50VlQi8G6SAB9aiFRP3M08uKoELwRJZr6NqBEpzw1pCm9UaeHB00qbYMllVCvR42RdRitm3ToHpMYLM8/54iFs3Th47HI0GssUk6T5pjkv8eo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745598279; c=relaxed/simple;
	bh=NkU7tAkxyRI3+ZzeXQF0hq98MO5Gc/uMx+ZHCBqiJ0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7ea9fHfUFw0t09tJG9QTcxt8VHYHTEAUSaMQsGWxNuJY0JspX7Q/qf+SundOfnzCWOAR89xdaXvT5i6yr7Ne85WGuDJSQNpgSmU0mh5UFJorCA5CY+Rht3AVAWkSAYAvlDMVt4asDXgh7P3sm7qLtpRxk9JsBvc2IO5ZGWQ16E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SdGAYdfw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SdGAYdfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745598277; x=1777134277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NkU7tAkxyRI3+ZzeXQF0hq98MO5Gc/uMx+ZHCBqiJ0M=;
  b=SdGAYdfw/tyEr1qaOvd/iC+L5x+bedyXtPaG0cPsDVkBmIZ4pDfRhTUM
   cc62ilA7eRX7uyH5eoBYrPWnpEalPIk17W2a4FJSfZKCCWVYqm1Hq1sn9
   Bg0PBBwOxWx9MK0NycguxVHsd/PFQ5z4dj0y5mdo8srGaSzJf6nbMFpqi
   Dq35rxlaT6jzMEnV5km1+4w3n91XvsZja4MH9Eilg78duUBWAt3hEPsk+
   b+yabeuVzpVzfQfVaMpYkR6PRNBX0KKA3FW/cNm6q6btsu+SEEWGcy1Wh
   6iaFjJOgdjOvad/64NyAqOLB9VN9lpc/yNxsMzEtfLMLjrzy15YW/FGwV
   A==;
X-CSE-ConnectionGUID: 0Q7RCBIvSsy7NVoAjV+n5w==
X-CSE-MsgGUID: TxCTSjgLSpauD+eCLJZBlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="57906601"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="57906601"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 09:24:36 -0700
X-CSE-ConnectionGUID: AB0hULXiSEiLUC0D3wqTkQ==
X-CSE-MsgGUID: NHCw9QsNTnaRuBFdsyFb/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133472533"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Apr 2025 09:24:33 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Lqp-0005LZ-13;
	Fri, 25 Apr 2025 16:24:31 +0000
Date: Sat, 26 Apr 2025 00:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chiang Brian <chiang.brian@inventec.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>
Cc: oe-kbuild-all@lists.linux.dev, Chiang Brian <chiang.brian@inventec.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Message-ID: <202504260027.mOmzx213-lkp@intel.com>
References: <20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424132538.2004510-2-chiang.brian@inventec.corp-partner.google.com>

Hi Chiang,

kernel test robot noticed the following build errors:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on robh/for-next linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chiang-Brian/dt-bindings-trivial-Add-tps53685-support/20250424-222559
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
patch link:    https://lore.kernel.org/r/20250424132538.2004510-2-chiang.brian%40inventec.corp-partner.google.com
patch subject: [PATCH v6 1/2] hwmon: (pmbus/tps53679) Add support for TPS53685
config: loongarch-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250426/202504260027.mOmzx213-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504260027.mOmzx213-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504260027.mOmzx213-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwmon/pmbus/tps53679.c: In function 'tps53679_identify_multiphase':
>> drivers/hwmon/pmbus/tps53679.c:133:57: error: passing argument 3 of 'tps53679_identify_chip' makes pointer from integer without a cast [-Wint-conversion]
     133 |         ret = tps53679_identify_chip(client, pmbus_rev, device_id);
         |                                                         ^~~~~~~~~
         |                                                         |
         |                                                         int
   drivers/hwmon/pmbus/tps53679.c:90:54: note: expected 'char *' but argument is of type 'int'
      90 |                                   u8 revision, char *id)
         |                                                ~~~~~~^~
   drivers/hwmon/pmbus/tps53679.c: In function 'tps53681_identify':
>> drivers/hwmon/pmbus/tps53679.c:34:32: error: passing argument 4 of 'tps53679_identify_multiphase' makes integer from pointer without a cast [-Wint-conversion]
      34 | #define TPS53681_DEVICE_ID     "\x81"
         |                                ^~~~~~
         |                                |
         |                                char *
   drivers/hwmon/pmbus/tps53679.c:165:45: note: in expansion of macro 'TPS53681_DEVICE_ID'
     165 |                                             TPS53681_DEVICE_ID);
         |                                             ^~~~~~~~~~~~~~~~~~
   drivers/hwmon/pmbus/tps53679.c:129:60: note: expected 'int' but argument is of type 'char *'
     129 |                                         int pmbus_rev, int device_id)
         |                                                        ~~~~^~~~~~~~~


vim +/tps53679_identify_chip +133 drivers/hwmon/pmbus/tps53679.c

610526527a13e4 Vadim Pasternak 2017-08-30   33  
a49c0dafb304b8 Chiang Brian    2025-04-24  @34  #define TPS53681_DEVICE_ID     "\x81"
a49c0dafb304b8 Chiang Brian    2025-04-24   35  #define TPS53685_DEVICE_ID     "TIShP"
53030bcc87e4a4 Guenter Roeck   2020-01-20   36  
53030bcc87e4a4 Guenter Roeck   2020-01-20   37  #define TPS53681_PMBUS_REVISION		0x33
53030bcc87e4a4 Guenter Roeck   2020-01-20   38  
53030bcc87e4a4 Guenter Roeck   2020-01-20   39  #define TPS53681_MFR_SPECIFIC_20	0xe4	/* Number of phases, per page */
53030bcc87e4a4 Guenter Roeck   2020-01-20   40  
dd43193976b9a7 Stephen Kitt    2020-08-08   41  static const struct i2c_device_id tps53679_id[];
dd43193976b9a7 Stephen Kitt    2020-08-08   42  
53030bcc87e4a4 Guenter Roeck   2020-01-20   43  static int tps53679_identify_mode(struct i2c_client *client,
610526527a13e4 Vadim Pasternak 2017-08-30   44  				  struct pmbus_driver_info *info)
610526527a13e4 Vadim Pasternak 2017-08-30   45  {
610526527a13e4 Vadim Pasternak 2017-08-30   46  	u8 vout_params;
b9fa0a3acfd86c Vadim Pasternak 2020-01-13   47  	int i, ret;
610526527a13e4 Vadim Pasternak 2017-08-30   48  
6f944004f873e3 Guenter Roeck   2020-01-24   49  	for (i = 0; i < info->pages; i++) {
610526527a13e4 Vadim Pasternak 2017-08-30   50  		/* Read the register with VOUT scaling value.*/
b9fa0a3acfd86c Vadim Pasternak 2020-01-13   51  		ret = pmbus_read_byte_data(client, i, PMBUS_VOUT_MODE);
610526527a13e4 Vadim Pasternak 2017-08-30   52  		if (ret < 0)
610526527a13e4 Vadim Pasternak 2017-08-30   53  			return ret;
610526527a13e4 Vadim Pasternak 2017-08-30   54  
610526527a13e4 Vadim Pasternak 2017-08-30   55  		vout_params = ret & GENMASK(4, 0);
610526527a13e4 Vadim Pasternak 2017-08-30   56  
610526527a13e4 Vadim Pasternak 2017-08-30   57  		switch (vout_params) {
610526527a13e4 Vadim Pasternak 2017-08-30   58  		case TPS53679_PROT_VR13_10MV:
610526527a13e4 Vadim Pasternak 2017-08-30   59  		case TPS53679_PROT_VR12_5_10MV:
b9fa0a3acfd86c Vadim Pasternak 2020-01-13   60  			info->vrm_version[i] = vr13;
610526527a13e4 Vadim Pasternak 2017-08-30   61  			break;
610526527a13e4 Vadim Pasternak 2017-08-30   62  		case TPS53679_PROT_VR13_5MV:
610526527a13e4 Vadim Pasternak 2017-08-30   63  		case TPS53679_PROT_VR12_5MV:
610526527a13e4 Vadim Pasternak 2017-08-30   64  		case TPS53679_PROT_IMVP8_5MV:
b9fa0a3acfd86c Vadim Pasternak 2020-01-13   65  			info->vrm_version[i] = vr12;
610526527a13e4 Vadim Pasternak 2017-08-30   66  			break;
610526527a13e4 Vadim Pasternak 2017-08-30   67  		default:
610526527a13e4 Vadim Pasternak 2017-08-30   68  			return -EINVAL;
610526527a13e4 Vadim Pasternak 2017-08-30   69  		}
b9fa0a3acfd86c Vadim Pasternak 2020-01-13   70  	}
610526527a13e4 Vadim Pasternak 2017-08-30   71  
610526527a13e4 Vadim Pasternak 2017-08-30   72  	return 0;
610526527a13e4 Vadim Pasternak 2017-08-30   73  }
610526527a13e4 Vadim Pasternak 2017-08-30   74  
53030bcc87e4a4 Guenter Roeck   2020-01-20   75  static int tps53679_identify_phases(struct i2c_client *client,
53030bcc87e4a4 Guenter Roeck   2020-01-20   76  				    struct pmbus_driver_info *info)
53030bcc87e4a4 Guenter Roeck   2020-01-20   77  {
53030bcc87e4a4 Guenter Roeck   2020-01-20   78  	int ret;
53030bcc87e4a4 Guenter Roeck   2020-01-20   79  
53030bcc87e4a4 Guenter Roeck   2020-01-20   80  	/* On TPS53681, only channel A provides per-phase output current */
53030bcc87e4a4 Guenter Roeck   2020-01-20   81  	ret = pmbus_read_byte_data(client, 0, TPS53681_MFR_SPECIFIC_20);
53030bcc87e4a4 Guenter Roeck   2020-01-20   82  	if (ret < 0)
53030bcc87e4a4 Guenter Roeck   2020-01-20   83  		return ret;
53030bcc87e4a4 Guenter Roeck   2020-01-20   84  	info->phases[0] = (ret & 0x07) + 1;
53030bcc87e4a4 Guenter Roeck   2020-01-20   85  
53030bcc87e4a4 Guenter Roeck   2020-01-20   86  	return 0;
53030bcc87e4a4 Guenter Roeck   2020-01-20   87  }
53030bcc87e4a4 Guenter Roeck   2020-01-20   88  
53030bcc87e4a4 Guenter Roeck   2020-01-20   89  static int tps53679_identify_chip(struct i2c_client *client,
a49c0dafb304b8 Chiang Brian    2025-04-24   90  				  u8 revision, char *id)
53030bcc87e4a4 Guenter Roeck   2020-01-20   91  {
53030bcc87e4a4 Guenter Roeck   2020-01-20   92  	u8 buf[I2C_SMBUS_BLOCK_MAX];
53030bcc87e4a4 Guenter Roeck   2020-01-20   93  	int ret;
a49c0dafb304b8 Chiang Brian    2025-04-24   94  	int buf_len;
a49c0dafb304b8 Chiang Brian    2025-04-24   95  	int id_len;
53030bcc87e4a4 Guenter Roeck   2020-01-20   96  
53030bcc87e4a4 Guenter Roeck   2020-01-20   97  	ret = pmbus_read_byte_data(client, 0, PMBUS_REVISION);
53030bcc87e4a4 Guenter Roeck   2020-01-20   98  	if (ret < 0)
53030bcc87e4a4 Guenter Roeck   2020-01-20   99  		return ret;
53030bcc87e4a4 Guenter Roeck   2020-01-20  100  	if (ret != revision) {
53030bcc87e4a4 Guenter Roeck   2020-01-20  101  		dev_err(&client->dev, "Unexpected PMBus revision 0x%x\n", ret);
53030bcc87e4a4 Guenter Roeck   2020-01-20  102  		return -ENODEV;
53030bcc87e4a4 Guenter Roeck   2020-01-20  103  	}
53030bcc87e4a4 Guenter Roeck   2020-01-20  104  
53030bcc87e4a4 Guenter Roeck   2020-01-20  105  	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
53030bcc87e4a4 Guenter Roeck   2020-01-20  106  	if (ret < 0)
53030bcc87e4a4 Guenter Roeck   2020-01-20  107  		return ret;
a49c0dafb304b8 Chiang Brian    2025-04-24  108  
a49c0dafb304b8 Chiang Brian    2025-04-24  109  	/* Adjust length if null terminator if present */
a49c0dafb304b8 Chiang Brian    2025-04-24  110  	buf_len = (buf[ret - 1] != '\x00' ? ret : ret - 1);
a49c0dafb304b8 Chiang Brian    2025-04-24  111  
a49c0dafb304b8 Chiang Brian    2025-04-24  112  	id_len = strlen(id);
a49c0dafb304b8 Chiang Brian    2025-04-24  113  
a49c0dafb304b8 Chiang Brian    2025-04-24  114  	if (buf_len != id_len || strncmp(id, buf, id_len)) {
a49c0dafb304b8 Chiang Brian    2025-04-24  115  		dev_err(&client->dev, "Unexpected device ID: %*ph\n", ret, buf);
53030bcc87e4a4 Guenter Roeck   2020-01-20  116  		return -ENODEV;
53030bcc87e4a4 Guenter Roeck   2020-01-20  117  	}
53030bcc87e4a4 Guenter Roeck   2020-01-20  118  	return 0;
53030bcc87e4a4 Guenter Roeck   2020-01-20  119  }
53030bcc87e4a4 Guenter Roeck   2020-01-20  120  
53030bcc87e4a4 Guenter Roeck   2020-01-20  121  /*
53030bcc87e4a4 Guenter Roeck   2020-01-20  122   * Common identification function for chips with multi-phase support.
53030bcc87e4a4 Guenter Roeck   2020-01-20  123   * Since those chips have special configuration registers, we want to have
53030bcc87e4a4 Guenter Roeck   2020-01-20  124   * some level of reassurance that we are really talking with the chip
53030bcc87e4a4 Guenter Roeck   2020-01-20  125   * being probed. Check PMBus revision and chip ID.
53030bcc87e4a4 Guenter Roeck   2020-01-20  126   */
53030bcc87e4a4 Guenter Roeck   2020-01-20  127  static int tps53679_identify_multiphase(struct i2c_client *client,
53030bcc87e4a4 Guenter Roeck   2020-01-20  128  					struct pmbus_driver_info *info,
53030bcc87e4a4 Guenter Roeck   2020-01-20  129  					int pmbus_rev, int device_id)
53030bcc87e4a4 Guenter Roeck   2020-01-20  130  {
53030bcc87e4a4 Guenter Roeck   2020-01-20  131  	int ret;
53030bcc87e4a4 Guenter Roeck   2020-01-20  132  
53030bcc87e4a4 Guenter Roeck   2020-01-20 @133  	ret = tps53679_identify_chip(client, pmbus_rev, device_id);
53030bcc87e4a4 Guenter Roeck   2020-01-20  134  	if (ret < 0)
53030bcc87e4a4 Guenter Roeck   2020-01-20  135  		return ret;
53030bcc87e4a4 Guenter Roeck   2020-01-20  136  
53030bcc87e4a4 Guenter Roeck   2020-01-20  137  	ret = tps53679_identify_mode(client, info);
53030bcc87e4a4 Guenter Roeck   2020-01-20  138  	if (ret < 0)
53030bcc87e4a4 Guenter Roeck   2020-01-20  139  		return ret;
53030bcc87e4a4 Guenter Roeck   2020-01-20  140  
53030bcc87e4a4 Guenter Roeck   2020-01-20  141  	return tps53679_identify_phases(client, info);
53030bcc87e4a4 Guenter Roeck   2020-01-20  142  }
53030bcc87e4a4 Guenter Roeck   2020-01-20  143  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
