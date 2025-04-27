Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C636F4A21
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745759208; cv=none; b=foSvWj1fKkKHFRweXUvl5InZnZyfvX80yeIO9u7i2g9JUfQPYRshxH5qKUjDFXwumBle+OWUB2LC7JWiwjBuEf2T/U+9m4vT3ekVjADrM/Z3RSMmsYqGua7rR0UJ5X6LhXaJBWz/wF13oYerjZAXjMg7Lrx0OSvPCyMgO843T8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745759208; c=relaxed/simple;
	bh=lCphsQCLwz1RdTZxD5xq9sVTJ33APfy4vq5qdOGudVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGpOwX0bASsvCt4TtlsAKv4WwhqBq4cbOQGHHL4RW6uX3bnFzFkfyDt8LeaHu8Msaf+qpRJ6qcWFeDR1tNcyuinYBfd3ZIxEgLT2srW/alsS9Nq3Bx6SbBH4VGxYUTXoXTaEdLBrvtG0M+x9CztVqQfBq2UyazN0f3U6YHcCYds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXOGJEtS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXOGJEtS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745759205; x=1777295205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lCphsQCLwz1RdTZxD5xq9sVTJ33APfy4vq5qdOGudVk=;
  b=jXOGJEtSPRgirMxWVmk/IUA5Lll5qUqZO1WTcP4+xPdLXX1pgbHQQ+/2
   Ka1Z52o+Tl/LIjR+NxzMn20VhbiJtFFMlGBcVwya9mK5Jju7y9UhU8rKb
   c5qJO46SjYHSaTxF5GwvGKHz41SS6ZBI24atUun8m3LqkJzUgEugHBtym
   ABr4jU0RhxnX4Mu8BU2XY46UAOhVi2ZBmmVu9pO/3YGrMjvLX24UxHgWJ
   8doOSvliz0Dlfl8DLNRhB+tPcF1hlJoD8uiVpXz3i8H0wZKnLtBOBCiIX
   +0ohJfjFkZjhGfHwPoRz4rA/fhMsbFKWYUvrgrvL1cn2061gDDgG0zLOL
   A==;
X-CSE-ConnectionGUID: 0y/hFCr8SLy/EMkQOH/SGg==
X-CSE-MsgGUID: Oh2TRKEmR7euOclKDJacBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50010522"
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="50010522"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 06:06:45 -0700
X-CSE-ConnectionGUID: qmdFSC4vSUeXl9AqaxzKgQ==
X-CSE-MsgGUID: /okm8gnbREeowzBb1dshZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="138380927"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Apr 2025 06:06:43 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u91iT-0006IX-1Z;
	Sun, 27 Apr 2025 13:06:41 +0000
Date: Sun, 27 Apr 2025 21:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ariel Simulevski <ariel@simulevski.at>, gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ariel Simulevski <ariel@simulevski.at>
Subject: Re: [PATCH] staging: rtl8723bs: Fix CamelCase and coding style
 issues across driver
Message-ID: <202504272014.zJRt6NGl-lkp@intel.com>
References: <20250426232032.193306-1-ariel@simulevski.at>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426232032.193306-1-ariel@simulevski.at>

Hi Ariel,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-linus]
[also build test ERROR on linus/master v6.15-rc3]
[cannot apply to staging/staging-testing staging/staging-next next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ariel-Simulevski/staging-rtl8723bs-Fix-CamelCase-and-coding-style-issues-across-driver/20250427-072220
base:   staging/staging-linus
patch link:    https://lore.kernel.org/r/20250426232032.193306-1-ariel%40simulevski.at
patch subject: [PATCH] staging: rtl8723bs: Fix CamelCase and coding style issues across driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250427/202504272014.zJRt6NGl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504272014.zJRt6NGl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504272014.zJRt6NGl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/core/rtw_ap.c:322:6: warning: no previous prototype for 'add_ratid' [-Wmissing-prototypes]
     322 | void add_ratid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
         |      ^~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_ap.c: In function 'update_bmc_sta':
>> drivers/staging/rtl8723bs/core/rtw_ap.c:399:17: warning: "/*" within comment [-Wcomment]
     399 |                 /* prepare for add_ratid */
   In file included from drivers/staging/rtl8723bs/include/drv_types.h:29,
                    from drivers/staging/rtl8723bs/core/rtw_ap.c:8:
   drivers/staging/rtl8723bs/core/rtw_ap.c: In function 'rtw_ap_set_pairwise_key':
>> drivers/staging/rtl8723bs/core/rtw_ap.c:1219:59: error: 'set_sta_key_cmd' undeclared (first use in this function); did you mean 'set_stakey_hdl'?
    1219 |         init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, set_sta_key_cmd);
         |                                                           ^~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/include/rtw_cmd.h:76:25: note: in definition of macro 'init_h2fwcmd_w_parm_no_rsp'
      76 |         pcmd->cmdcode = code;\
         |                         ^~~~
   drivers/staging/rtl8723bs/core/rtw_ap.c:1219:59: note: each undeclared identifier is reported only once for each function it appears in
    1219 |         init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, set_sta_key_cmd);
         |                                                           ^~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/include/rtw_cmd.h:76:25: note: in definition of macro 'init_h2fwcmd_w_parm_no_rsp'
      76 |         pcmd->cmdcode = code;\
         |                         ^~~~
   drivers/staging/rtl8723bs/core/rtw_ap.c: In function 'rtw_ap_set_key':
>> drivers/staging/rtl8723bs/core/rtw_ap.c:1278:25: error: 'set_key_cmd' undeclared (first use in this function)
    1278 |         pcmd->cmdcode = set_key_cmd;
         |                         ^~~~~~~~~~~
--
   In file included from drivers/staging/rtl8723bs/include/drv_types.h:29,
                    from drivers/staging/rtl8723bs/core/rtw_cmd.c:7:
   drivers/staging/rtl8723bs/core/rtw_cmd.c: In function 'rtw_setstakey_cmd':
>> drivers/staging/rtl8723bs/core/rtw_cmd.c:910:67: error: 'set_sta_key_cmd' undeclared (first use in this function); did you mean 'set_stakey_hdl'?
     910 |                 init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, set_sta_key_cmd);
         |                                                                   ^~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/include/rtw_cmd.h:76:25: note: in definition of macro 'init_h2fwcmd_w_parm_no_rsp'
      76 |         pcmd->cmdcode = code;\
         |                         ^~~~
   drivers/staging/rtl8723bs/core/rtw_cmd.c:910:67: note: each undeclared identifier is reported only once for each function it appears in
     910 |                 init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, set_sta_key_cmd);
         |                                                                   ^~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/include/rtw_cmd.h:76:25: note: in definition of macro 'init_h2fwcmd_w_parm_no_rsp'
      76 |         pcmd->cmdcode = code;\
         |                         ^~~~
   drivers/staging/rtl8723bs/core/rtw_cmd.c: In function 'rtw_clearstakey_cmd':
   drivers/staging/rtl8723bs/core/rtw_cmd.c:961:67: error: 'set_sta_key_cmd' undeclared (first use in this function); did you mean 'set_stakey_hdl'?
     961 |                 init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, set_sta_key_cmd);
         |                                                                   ^~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/include/rtw_cmd.h:76:25: note: in definition of macro 'init_h2fwcmd_w_parm_no_rsp'
      76 |         pcmd->cmdcode = code;\
         |                         ^~~~
--
   drivers/staging/rtl8723bs/core/rtw_mlme.c: In function 'rtw_joinbss_update_stainfo':
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:975:65: error: expected expression before '.' token
     975 |                 if (padapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X) {
         |                                                                 ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c: In function 'rtw_stassoc_event_callback':
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1299:56: error: expected expression before '.' token
    1299 |         if (adapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X)
         |                                                        ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c: In function 'rtw_set_key':
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1857:49: error: expected expression before '.' token
    1857 |         if (psecuritypriv->dot11_auth_algrthm ==.dot11_auth_algrthm_8021X)
         |                                                 ^
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:1901:33: error: 'set_key_cmd' undeclared (first use in this function)
    1901 |                 pcmd->cmdcode = set_key_cmd;
         |                                 ^~~~~~~~~~~
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1901:33: note: each undeclared identifier is reported only once for each function it appears in
--
   drivers/staging/rtl8723bs/core/rtw_pwrctrl.c: In function 'PS_RDY_CHECK':
>> drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:330:57: error: expected expression before '.' token
     330 |         if (padapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X &&
         |                                                         ^
--
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:21:9: error: 'WLAN_CIPHER_SUITE__WEP40_' undeclared here (not in a function); did you mean 'WPA_CIPHER_SUITE__WEP40_'?
      21 |         WLAN_CIPHER_SUITE__WEP40_,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         WPA_CIPHER_SUITE__WEP40_
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function 'rtw_cfg80211_ap_set_encryption':
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:546:60: error: expected expression before '.' token
     546 |                         psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Auto;
         |                                                            ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:616:49: error: expected expression before '.' token
     616 |         if (psecuritypriv->dot11_auth_algrthm ==.dot11_auth_algrthm_8021X && psta) { /*  psk/802_1x */
         |                                                 ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function 'rtw_cfg80211_set_encryption':
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:764:57: error: expected expression before '.' token
     764 |         if (padapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X) { /*  802_1x */
         |                                                         ^
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:769:25: error: 'psta' undeclared (first use in this function)
     769 |                         psta = rtw_get_stainfo(pstapriv, get_bssid(pmlmepriv));
         |                         ^~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:769:25: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:25: error: 'pbcmc_sta' undeclared (first use in this function)
     811 |                         pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
         |                         ^~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function 'rtw_cfg80211_set_auth_type':
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1325:52: error: expected expression before '.' token
    1325 |                 psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Auto;
         |                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1330:52: error: expected expression before '.' token
    1330 |                 psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Open;
         |                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1333:60: error: expected expression before '.' token
    1333 |                         psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
         |                                                            ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1338:52: error: expected expression before '.' token
    1338 |                 psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Shared;
         |                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1344:52: error: expected expression before '.' token
    1344 |                 psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Open;
         |                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function 'rtw_cfg80211_set_key_mgt':
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1403:52: error: expected expression before '.' token
    1403 |                 psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
         |                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1405:52: error: expected expression before '.' token
    1405 |                 psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
         |                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function 'rtw_cfg80211_set_wpa_ie':
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1448:68: error: expected expression before '.' token
    1448 |                         padapter->securitypriv.dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
         |                                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1457:68: error: expected expression before '.' token
    1457 |                         padapter->securitypriv.dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
         |                                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function 'cfg80211_rtw_join_ibss':
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1580:44: error: expected expression before '.' token
    1580 |         psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Open; /* open system */
         |                                            ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c: In function 'cfg80211_rtw_connect':
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1676:44: error: expected expression before '.' token
    1676 |         psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Open; /* open system */
         |                                            ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1699:50: error: expected expression before '.' token
    1699 |         if ((psecuritypriv->dot11_auth_algrthm ==.dot11_auth_algrthm_Shared ||
         |                                                  ^
--
   drivers/staging/rtl8723bs/os_dep/mlme_linux.c: In function 'rtw_reset_securitypriv':
>> drivers/staging/rtl8723bs/os_dep/mlme_linux.c:72:56: error: expected expression before '.' token
      72 |         if (adapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X) {
         |                                                        ^
   drivers/staging/rtl8723bs/os_dep/mlme_linux.c:106:48: error: expected expression before '.' token
     106 |                 psec_priv->dot11_auth_algrthm =.dot11_auth_algrthm_Open;  /* open system */
         |                                                ^


vim +1219 drivers/staging/rtl8723bs/core/rtw_ap.c

  1198	
  1199	u8 rtw_ap_set_pairwise_key(struct adapter *padapter, struct sta_info *psta)
  1200	{
  1201		struct cmd_obj *ph2c;
  1202		struct set_stakey_parm	*psetstakey_para;
  1203		struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
  1204		u8 res = _SUCCESS;
  1205	
  1206		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
  1207		if (!ph2c) {
  1208			res = _FAIL;
  1209			goto exit;
  1210		}
  1211	
  1212		psetstakey_para = rtw_zmalloc(sizeof(struct set_stakey_parm));
  1213		if (!psetstakey_para) {
  1214			kfree(ph2c);
  1215			res = _FAIL;
  1216			goto exit;
  1217		}
  1218	
> 1219		init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, set_sta_key_cmd);
  1220	
  1221		psetstakey_para->algorithm = (u8)psta->dot11_802_1x_privacy;
  1222	
  1223		memcpy(psetstakey_para->addr, psta->hwaddr, ETH_ALEN);
  1224	
  1225		memcpy(psetstakey_para->key, &psta->dot11_802_1x_uncst_key, 16);
  1226	
  1227		res = rtw_enqueue_cmd(pcmdpriv, ph2c);
  1228	
  1229	exit:
  1230	
  1231		return res;
  1232	}
  1233	
  1234	static int rtw_ap_set_key(struct adapter *padapter, u8 *key, u8 alg, int keyid, u8 set_tx)
  1235	{
  1236		u8 keylen;
  1237		struct cmd_obj *pcmd;
  1238		struct setkey_parm *psetkeyparm;
  1239		struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
  1240		int res = _SUCCESS;
  1241	
  1242		pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
  1243		if (!pcmd) {
  1244			res = _FAIL;
  1245			goto exit;
  1246		}
  1247		psetkeyparm = rtw_zmalloc(sizeof(struct setkey_parm));
  1248		if (!psetkeyparm) {
  1249			kfree(pcmd);
  1250			res = _FAIL;
  1251			goto exit;
  1252		}
  1253	
  1254		psetkeyparm->keyid = (u8)keyid;
  1255		if (is_wep_enc(alg))
  1256			padapter->securitypriv.key_mask |= BIT(psetkeyparm->keyid);
  1257	
  1258		psetkeyparm->algorithm = alg;
  1259	
  1260		psetkeyparm->set_tx = set_tx;
  1261	
  1262		switch (alg) {
  1263		case WEP_40:
  1264			keylen = 5;
  1265			break;
  1266		case _WEP104_:
  1267			keylen = 13;
  1268			break;
  1269		case _TKIP_:
  1270		case _TKIP_WTMIC_:
  1271		case _AES_:
  1272		default:
  1273			keylen = 16;
  1274		}
  1275	
  1276		memcpy(&psetkeyparm->key[0], key, keylen);
  1277	
> 1278		pcmd->cmdcode = set_key_cmd;
  1279		pcmd->parmbuf = (u8 *)psetkeyparm;
  1280		pcmd->cmdsz =  (sizeof(struct setkey_parm));
  1281		pcmd->rsp = NULL;
  1282		pcmd->rspsz = 0;
  1283	
  1284		INIT_LIST_HEAD(&pcmd->list);
  1285	
  1286		res = rtw_enqueue_cmd(pcmdpriv, pcmd);
  1287	
  1288	exit:
  1289	
  1290		return res;
  1291	}
  1292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
