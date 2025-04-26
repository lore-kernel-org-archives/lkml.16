Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2BE6AD3;
	Sat, 26 Apr 2025 18:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745693674; cv=none; b=dmEXvk+zspEOnW1pIGVYUgAuVyupxnYSYTKxQqcNXhLBxy1oDMUAME/btpU2kwQTTQ3FNcJKUOYFfT/xPQmcJBEvoV4lk860UavaxLpFTN4FcGWaPq7Fr+wNZJDaSGy6ufZIy9L0nnJ2IrxmdQXNxzVEARS5OQudBRA//4UUhYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745693674; c=relaxed/simple;
	bh=NEhAH6oIQNX33fLKiJP0JySq0BboMwHUOP1khrBoGDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=asIZE+g8gNvtTrwcXnRGmDAnx+X+Mr7bdKG4jtwKYRH5pH53UnsA9lVi38kt8VbQoFMAU9TDQz/3xithubF8eTXTkgiPJG1rGoIM/asie5fzsmzfHEs8gZsFT4Wrx31OCVFRKkvRNfmLqWu/3ORAqCmWcFo7ShavTPDIwpzQimI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Grv8umOw; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Grv8umOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745693671; x=1777229671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NEhAH6oIQNX33fLKiJP0JySq0BboMwHUOP1khrBoGDA=;
  b=Grv8umOwca8xgzbQ9FJLcGfqm4/TGHX83YQXQzsnzk8D5cV1YAFGf+We
   UByQQI2fLWlSgrstVNc4GvHdL/mBImILhrKPMSaJvnq/hn4RRSI0QThce
   RQBBlvmAqmC8qzqvqqQQwEh4Fjtckgl1VCzmgAJk92jgFEN4J1ibHrSh7
   RP0VXyFOmCzgMBibPwwRncUiTnHUG6ucbW6Ahy0zvGiwEWwGDoMMPB6iA
   RqzvYSzQC0HNrpMGEdq7UNCfoTqoPPIcnHGcdNJ3CiUbk2O782Dm/s6pi
   cKlysmcBJJDAasvcg2lJ3c+JMYUp5gkrjCggen1YPqCwMRNT2mPrNEFzL
   w==;
X-CSE-ConnectionGUID: HagjaYGcRg+4oPgQ6It9lQ==
X-CSE-MsgGUID: yJxv2MNuREGRdqDnCfc1EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="46562795"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="46562795"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 11:54:30 -0700
X-CSE-ConnectionGUID: SIDxRh8qSxSwsCBjAX1zVA==
X-CSE-MsgGUID: zRZsg5ydTxG4o0qsP9Vc+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="133661367"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2025 11:54:28 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8kfS-0005xH-0v;
	Sat, 26 Apr 2025 18:54:26 +0000
Date: Sun, 27 Apr 2025 02:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ovidiu Bunea <Ovidiu.Bunea@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
	Hamza Mahfooz <hamza.mahfooz@amd.com>, linux-doc@vger.kernel.org
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn35/dcn35_dccg.c:1416:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504270214.c0aGJBHt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: a3e6079bd93d5c66a43bf6a5f90e5b98465dc7b3 drm/amd/display: Remove PIPE_DTO_SRC_SEL programming from set_dtbclk_dto
date:   5 months ago
config: i386-buildonly-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250427/202504270214.c0aGJBHt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270214.c0aGJBHt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270214.c0aGJBHt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn35/dcn35_dccg.c:1416: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
                    * PIPEx_DTO_SRC_SEL should not be programmed during DTBCLK update since OTG may still be on, and the


vim +1416 drivers/gpu/drm/amd/amdgpu/../display/dc/dccg/dcn35/dcn35_dccg.c

  1348	
  1349	/* Controls the generation of pixel valid for OTG in (OTG -> HPO case) */
  1350	static void dccg35_set_dtbclk_dto(
  1351			struct dccg *dccg,
  1352			const struct dtbclk_dto_params *params)
  1353	{
  1354		struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
  1355		/* DTO Output Rate / Pixel Rate = 1/4 */
  1356		int req_dtbclk_khz = params->pixclk_khz / 4;
  1357	
  1358		if (params->ref_dtbclk_khz && req_dtbclk_khz) {
  1359			uint32_t modulo, phase;
  1360	
  1361			switch (params->otg_inst) {
  1362			case 0:
  1363				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DTBCLK_P0_GATE_DISABLE, 1);
  1364				break;
  1365			case 1:
  1366				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DTBCLK_P1_GATE_DISABLE, 1);
  1367				break;
  1368			case 2:
  1369				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DTBCLK_P2_GATE_DISABLE, 1);
  1370				break;
  1371			case 3:
  1372				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DTBCLK_P3_GATE_DISABLE, 1);
  1373				break;
  1374			}
  1375	
  1376			// phase / modulo = dtbclk / dtbclk ref
  1377			modulo = params->ref_dtbclk_khz * 1000;
  1378			phase = req_dtbclk_khz * 1000;
  1379	
  1380			REG_WRITE(DTBCLK_DTO_MODULO[params->otg_inst], modulo);
  1381			REG_WRITE(DTBCLK_DTO_PHASE[params->otg_inst], phase);
  1382	
  1383			REG_UPDATE(OTG_PIXEL_RATE_CNTL[params->otg_inst],
  1384					DTBCLK_DTO_ENABLE[params->otg_inst], 1);
  1385	
  1386			REG_WAIT(OTG_PIXEL_RATE_CNTL[params->otg_inst],
  1387					DTBCLKDTO_ENABLE_STATUS[params->otg_inst], 1,
  1388					1, 100);
  1389	
  1390			/* program OTG_PIXEL_RATE_DIV for DIVK1 and DIVK2 fields */
  1391			dccg35_set_pixel_rate_div(dccg, params->otg_inst, PIXEL_RATE_DIV_BY_1, PIXEL_RATE_DIV_BY_1);
  1392	
  1393			/* The recommended programming sequence to enable DTBCLK DTO to generate
  1394			 * valid pixel HPO DPSTREAM ENCODER, specifies that DTO source select should
  1395			 * be set only after DTO is enabled.
  1396			 * PIPEx_DTO_SRC_SEL should not be programmed during DTBCLK update since OTG may still be on, and the
  1397			 * programming is handled in program_pix_clk() regardless, so it can be removed from here.
  1398			 */
  1399		} else {
  1400			switch (params->otg_inst) {
  1401			case 0:
  1402				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DTBCLK_P0_GATE_DISABLE, 0);
  1403				break;
  1404			case 1:
  1405				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DTBCLK_P1_GATE_DISABLE, 0);
  1406				break;
  1407			case 2:
  1408				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DTBCLK_P2_GATE_DISABLE, 0);
  1409				break;
  1410			case 3:
  1411				REG_UPDATE(DCCG_GATE_DISABLE_CNTL5, DTBCLK_P3_GATE_DISABLE, 0);
  1412				break;
  1413			}
  1414	
  1415			/**
> 1416			 * PIPEx_DTO_SRC_SEL should not be programmed during DTBCLK update since OTG may still be on, and the
  1417			 * programming is handled in program_pix_clk() regardless, so it can be removed from here.
  1418			 */
  1419			REG_UPDATE(OTG_PIXEL_RATE_CNTL[params->otg_inst],
  1420					DTBCLK_DTO_ENABLE[params->otg_inst], 0);
  1421	
  1422			REG_WRITE(DTBCLK_DTO_MODULO[params->otg_inst], 0);
  1423			REG_WRITE(DTBCLK_DTO_PHASE[params->otg_inst], 0);
  1424		}
  1425	}
  1426	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
