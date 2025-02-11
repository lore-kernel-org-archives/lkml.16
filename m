Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF3D253B7D
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290295; cv=none; b=nSMQ/H8EmJJqGitayoaIC6wNHGiV1jgHTMI+5EvqWwzv33amvXNjUU8PoNdiOtdKtW+oFXvWuogOxgCxl7K6GEgF6oy147f4OSiR7lwPARXk9jfYyfgz9JM81nKhkjocA34NcRMXPvRY9gF0qn++luhXGn0ATZPoFBi+V1v4KXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290295; c=relaxed/simple;
	bh=cS70XGk1+sLAYhKj1uQAW9UASWnFX0MpKMElTx9v8hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLZIM3qRej1YNUlmlo/eYaD2tOKuewyPBWthhm1kgRlaBJZG+zP1AFt40s2xyQVY8yRQAYxHesr2UknCPODeIK/4haa8ojU6N0bPcgR7siQedRw8tVnQ0PyTJth2PA3heItNmGdSAcE0fSLArCQBplHpBZc89qH9maeYq01yp+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3U8dDGm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3U8dDGm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739290293; x=1770826293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cS70XGk1+sLAYhKj1uQAW9UASWnFX0MpKMElTx9v8hk=;
  b=G3U8dDGm9/T7YW0QnLrvdvMqDmcZ/Upd0Y+dV3xf++BJP4J0WTrrZUWd
   Pw1MqgGIx5vdI8KVy7nJSD7adSPx+I2DCHecKXQRPz+SYxjN9v8CBbMww
   q/tFPY4wg4lUrxqDFRCv5EKOv46gejHaj6h0SzFFnyHfV6qXTzO0avLwE
   UdqZSew8QJa3+DNEcH8+f3LACewFubXryy/BPUPRHgx7iOwci+slNKNnF
   lccNfQW6N9Q3042bOPRdtdjK/2r9IqqfFHxpykbJvRRHFSB5W3e2YSbuX
   nrJAVSfmKSFfNaoxJXr6qazsi2HLLZUvukgpku4MsN4GiIkw2rzgWNNmL
   g==;
X-CSE-ConnectionGUID: pb/P1Q3PSuO6L4IHqPUOug==
X-CSE-MsgGUID: hwo+gUphTWSoYdQeZQ7FLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50551770"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="50551770"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 08:11:32 -0800
X-CSE-ConnectionGUID: sJkk/VkhQs2Rwl/eqIIfbQ==
X-CSE-MsgGUID: x05H8EayRVWwPL/wRMM1Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="143409992"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Feb 2025 08:11:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thsrA-0014Ph-1m;
	Tue, 11 Feb 2025 16:11:28 +0000
Date: Wed, 12 Feb 2025 00:10:51 +0800
From: kernel test robot <lkp@intel.com>
To: Piotr Kwapulinski <piotr.kwapulinski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: drivers/net/ethernet/intel/i40e/i40e_ptp.c:1375:27: warning: '%s'
 directive output may be truncated writing up to 287 bytes into a region of
 size 64
Message-ID: <202502120046.MLa5sPZW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Piotr,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   febbc555cf0fff895546ddb8ba2c9a523692fb55
commit: 1050713026a08d605b61f039700b67aab646371f i40e: add support for PTP external synchronization clock
date:   3 years, 7 months ago
config: alpha-randconfig-p001-20211207 (https://download.01.org/0day-ci/archive/20250212/202502120046.MLa5sPZW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120046.MLa5sPZW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120046.MLa5sPZW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/intel/i40e/i40e_ptp.c: In function 'i40e_ptp_init':
>> drivers/net/ethernet/intel/i40e/i40e_ptp.c:1375:27: warning: '%s' directive output may be truncated writing up to 287 bytes into a region of size 64 [-Wformat-truncation=]
    1375 |                          "%s", sdp_desc[i].name);
         |                           ^~
   In function 'i40e_init_pin_config',
       inlined from 'i40e_ptp_create_clock' at drivers/net/ethernet/intel/i40e/i40e_ptp.c:1414:13,
       inlined from 'i40e_ptp_init' at drivers/net/ethernet/intel/i40e/i40e_ptp.c:1519:8:
   drivers/net/ethernet/intel/i40e/i40e_ptp.c:1373:17: note: 'snprintf' output between 1 and 288 bytes into a destination of size 64
    1373 |                 snprintf(pf->ptp_caps.pin_config[i].name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1374 |                          sizeof(pf->ptp_caps.pin_config[i].name),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1375 |                          "%s", sdp_desc[i].name);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~


vim +1375 drivers/net/ethernet/intel/i40e/i40e_ptp.c

  1349	
  1350	/**
  1351	 * i40e_init_pin_config - initialize pins.
  1352	 * @pf: private board structure
  1353	 *
  1354	 * Initialize pins for external clock source.
  1355	 * Return 0 on success or error code on failure.
  1356	 **/
  1357	static int i40e_init_pin_config(struct i40e_pf *pf)
  1358	{
  1359		int i;
  1360	
  1361		pf->ptp_caps.n_pins = 3;
  1362		pf->ptp_caps.n_ext_ts = 2;
  1363		pf->ptp_caps.pps = 1;
  1364		pf->ptp_caps.n_per_out = 2;
  1365	
  1366		pf->ptp_caps.pin_config = kcalloc(pf->ptp_caps.n_pins,
  1367						  sizeof(*pf->ptp_caps.pin_config),
  1368						  GFP_KERNEL);
  1369		if (!pf->ptp_caps.pin_config)
  1370			return -ENOMEM;
  1371	
  1372		for (i = 0; i < pf->ptp_caps.n_pins; i++) {
  1373			snprintf(pf->ptp_caps.pin_config[i].name,
  1374				 sizeof(pf->ptp_caps.pin_config[i].name),
> 1375				 "%s", sdp_desc[i].name);
  1376			pf->ptp_caps.pin_config[i].index = sdp_desc[i].index;
  1377			pf->ptp_caps.pin_config[i].func = PTP_PF_NONE;
  1378			pf->ptp_caps.pin_config[i].chan = sdp_desc[i].chan;
  1379		}
  1380	
  1381		pf->ptp_caps.verify = i40e_ptp_verify;
  1382		pf->ptp_caps.enable = i40e_ptp_feature_enable;
  1383	
  1384		pf->ptp_caps.pps = 1;
  1385	
  1386		return 0;
  1387	}
  1388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
