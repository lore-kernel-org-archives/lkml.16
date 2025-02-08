Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1663F1B0418
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739026873; cv=none; b=TR9+cJcoIKPC85mf5+1CtmPmsWyu5/TD5LP5amAbACEfvJMgSVcaynid4HveV5aiXcMJprwC2txVpykEr0lM4zA5GGXScxKulQsM04Pw6Q8GzeH10QPw/bsxhn+NhmOSeclpJ5ErF7HOe+6NiZqfNyo6KqqSEcZsKerVzUnCap8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739026873; c=relaxed/simple;
	bh=v354CKGKsghhN9y79hZfj+0p3P3VLQ4dOpiUOlQN8BE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SSmEHg7SUoLeKuPL4jWRN2yg+D569NRoZ5mZdyt1GIp8cMiOj9VZjqwiqDWV/q13Sq78mmXqxUKRieGi7AjMsytTdCxiix16KCYk3f9lKG3g90uK/b0p6CX5T3R1cfURdaTcIreeCaykxOSI5HqM8KziSPRtDE5ose2OQeJMrw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PW32H3Ch; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PW32H3Ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739026872; x=1770562872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v354CKGKsghhN9y79hZfj+0p3P3VLQ4dOpiUOlQN8BE=;
  b=PW32H3ChhMM9GgTzZb4rtmKkdVAIlfUPmbrVCkxxHjhRl2jWLL6pki8o
   jAYx4EN56AepkpsUxwTGUeU+lhR+FFp5EDhXJU7tbgMZp5sc3GndDF6Wy
   nsPUSSALgSg4zPc/2Bj7uvhJi8sBSvM8HCC5TbDiwzKoBwXKWYqpdcXJP
   RwphEadcoBH+ZLDnOoPOu/0FaacNWauqw8/ann2vDg2b+FlflbLLzFTBy
   dkOEUXE6HbleX1YTt1Pfy+jkCh+CqGYbX73jlWDaikImC+C1Sx1SCgM16
   cwv4GOxqtsAH4vtuuUVghu9+lsc2HFiMbvKkFCZc88n4dC3O0vBgdaoew
   w==;
X-CSE-ConnectionGUID: SFi9fmrLQPGKwIcV1uGTQg==
X-CSE-MsgGUID: YmOexKTcRPeBN1yIEdvQ6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43420798"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="43420798"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:01:11 -0800
X-CSE-ConnectionGUID: TlhO0w11TiWiaUKX4FgTjg==
X-CSE-MsgGUID: ng1q+a6qTgCB+KUW3FmfMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116726458"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Feb 2025 07:01:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgmKQ-00109T-2X;
	Sat, 08 Feb 2025 15:01:06 +0000
Date: Sat, 8 Feb 2025 23:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: drivers/staging/greybus/audio_topology.c:1172:56: warning: '%s'
 directive output may be truncated writing up to 31 bytes into a region of
 size between 17 and 27
Message-ID: <202502082253.FCt44meG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vaibhav,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6629c004b193d23612641c3607e785819e97ab
commit: c9a57eddb235d53b0a8b9d740e454ef466086fc8 staging: greybus: audio: Enable GB codec, audio module compilation.
date:   4 years, 6 months ago
config: sparc-buildonly-randconfig-r003-20220303 (https://download.01.org/0day-ci/archive/20250208/202502082253.FCt44meG-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082253.FCt44meG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082253.FCt44meG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/greybus/audio_topology.c: In function 'find_gb_module':
   drivers/staging/greybus/audio_topology.c:31:21: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      31 |         int dev_id, ret;
         |                     ^~~
   drivers/staging/greybus/audio_topology.c: In function 'gbcodec_mixer_dapm_ctl_get':
   drivers/staging/greybus/audio_topology.c:380:40: warning: variable 'info' set but not used [-Wunused-but-set-variable]
     380 |         struct gb_audio_ctl_elem_info *info;
         |                                        ^~~~
   drivers/staging/greybus/audio_topology.c: In function 'gbaudio_tplg_process_kcontrols':
>> drivers/staging/greybus/audio_topology.c:1172:56: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 17 and 27 [-Wformat-truncation=]
    1172 |                 snprintf(curr->name, NAME_SIZE, "GB %d %s", module->dev_id,
         |                                                        ^~
    1173 |                          temp_name);
         |                          ~~~~~~~~~                      
   drivers/staging/greybus/audio_topology.c:1172:17: note: 'snprintf' output between 6 and 47 bytes into a destination of size 32
    1172 |                 snprintf(curr->name, NAME_SIZE, "GB %d %s", module->dev_id,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1173 |                          temp_name);
         |                          ~~~~~~~~~~
   drivers/staging/greybus/audio_topology.c: In function 'gbaudio_tplg_create_widget':
   drivers/staging/greybus/audio_topology.c:1050:45: warning: '%s' directive output may be truncated writing up to 31 bytes into a region of size between 17 and 27 [-Wformat-truncation=]
    1050 |         snprintf(w->name, NAME_SIZE, "GB %d %s", module->dev_id, temp_name);
         |                                             ^~                   ~~~~~~~~~
   drivers/staging/greybus/audio_topology.c:1050:9: note: 'snprintf' output between 6 and 47 bytes into a destination of size 32
    1050 |         snprintf(w->name, NAME_SIZE, "GB %d %s", module->dev_id, temp_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1172 drivers/staging/greybus/audio_topology.c

6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1137  
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1138  static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1139  					  struct gb_audio_control *controls)
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1140  {
d4cd9daa49b2dc Vaibhav Agarwal 2016-07-05  1141  	int i, csize, ret;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1142  	struct snd_kcontrol_new *dapm_kctls;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1143  	struct gb_audio_control *curr;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1144  	struct gbaudio_control *control, *_control;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1145  	size_t size;
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1146  	char temp_name[NAME_SIZE];
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1147  
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1148  	size = sizeof(struct snd_kcontrol_new) * module->num_controls;
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1149  	dapm_kctls = devm_kzalloc(module->dev, size, GFP_KERNEL);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1150  	if (!dapm_kctls)
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1151  		return -ENOMEM;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1152  
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1153  	curr = controls;
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1154  	for (i = 0; i < module->num_controls; i++) {
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1155  		ret = gbaudio_tplg_create_kcontrol(module, &dapm_kctls[i],
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1156  						   curr);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1157  		if (ret) {
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1158  			dev_err(module->dev, "%s:%d type not supported\n",
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1159  				curr->name, curr->iface);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1160  			goto error;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1161  		}
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1162  		control = devm_kzalloc(module->dev, sizeof(struct
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1163  							   gbaudio_control),
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1164  				      GFP_KERNEL);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1165  		if (!control) {
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1166  			ret = -ENOMEM;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1167  			goto error;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1168  		}
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1169  		control->id = curr->id;
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1170  		/* Prefix dev_id to widget_name */
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1171  		strlcpy(temp_name, curr->name, NAME_SIZE);
6dd67645f22cfe Vaibhav Agarwal 2016-03-29 @1172  		snprintf(curr->name, NAME_SIZE, "GB %d %s", module->dev_id,
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1173  			 temp_name);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1174  		control->name = curr->name;
e65579e335da0a Vaibhav Agarwal 2016-06-30  1175  		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
e65579e335da0a Vaibhav Agarwal 2016-06-30  1176  			struct gb_audio_enumerated *gbenum =
e65579e335da0a Vaibhav Agarwal 2016-06-30  1177  				&curr->info.value.enumerated;
e65579e335da0a Vaibhav Agarwal 2016-06-30  1178  
e65579e335da0a Vaibhav Agarwal 2016-06-30  1179  			csize = offsetof(struct gb_audio_control, info);
e65579e335da0a Vaibhav Agarwal 2016-06-30  1180  			csize += offsetof(struct gb_audio_ctl_elem_info, value);
e65579e335da0a Vaibhav Agarwal 2016-06-30  1181  			csize += offsetof(struct gb_audio_enumerated, names);
055fb9ce92d59d Vaibhav Agarwal 2017-01-18  1182  			csize += le16_to_cpu(gbenum->names_length);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1183  			control->texts = (const char * const *)
e65579e335da0a Vaibhav Agarwal 2016-06-30  1184  				gb_generate_enum_strings(module, gbenum);
055fb9ce92d59d Vaibhav Agarwal 2017-01-18  1185  			control->items = le32_to_cpu(gbenum->items);
02ae32f754a6cb Chase Metzger   2016-10-06  1186  		} else {
d4cd9daa49b2dc Vaibhav Agarwal 2016-07-05  1187  			csize = sizeof(struct gb_audio_control);
02ae32f754a6cb Chase Metzger   2016-10-06  1188  		}
d4cd9daa49b2dc Vaibhav Agarwal 2016-07-05  1189  
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1190  		list_add(&control->list, &module->ctl_list);
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1191  		dev_dbg(module->dev, "%d:%s created of type %d\n", curr->id,
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1192  			curr->name, curr->info.type);
d4cd9daa49b2dc Vaibhav Agarwal 2016-07-05  1193  		curr = (void *)curr + csize;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1194  	}
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1195  	module->controls = dapm_kctls;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1196  
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1197  	return 0;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1198  error:
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1199  	list_for_each_entry_safe(control, _control, &module->ctl_list,
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1200  				 list) {
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1201  		list_del(&control->list);
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1202  		devm_kfree(module->dev, control);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1203  	}
6dd67645f22cfe Vaibhav Agarwal 2016-03-29  1204  	devm_kfree(module->dev, dapm_kctls);
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1205  	return ret;
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1206  }
6339d2322c47f4 Vaibhav Agarwal 2016-01-13  1207  

:::::: The code at line 1172 was first introduced by commit
:::::: 6dd67645f22cfeb55a32e9a08c92deb297d06935 greybus: audio: Use single codec driver registration

:::::: TO: Vaibhav Agarwal <vaibhav.agarwal@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
