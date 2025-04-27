Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C0B4431
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745759810; cv=none; b=uNLB84LWmqqc7inkmWnA+Unui44O4TmqYS0sUiQFh4IKd3zjGf1Qk6v+6nZtMicKhGogcq+DQOWmo+IUqtP42/K4zrZnWTvKEeH+DzXMO8NsqtQaP/OkPpwYL/rJ77Gd9HMzZiUxV35DVh59IaKOzZ49t82FWCbjo/F5Z1Wktq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745759810; c=relaxed/simple;
	bh=zpbX1uMtfOi2J4AdPhR43Ca4FXYXOfxg45fsj7Hd8x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9LssfyWh3B7HlRsL1pbsGtoTAERQCuxQbkk/PdGuYu1Krw8CKUao924QjOzmXcgVeXiAQVwFrPmRQZugpcQdWqLwFP1HEAoyWE8nuInVh9lSgl05xP0YaAr4o+B8eTYNlbXPLG4yvnIggTZFeM3ftCM1tnpf5H1j8NITdaXpr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWcwfo1C; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWcwfo1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745759807; x=1777295807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zpbX1uMtfOi2J4AdPhR43Ca4FXYXOfxg45fsj7Hd8x4=;
  b=ZWcwfo1CWvL+lrP85uyIPjv0VYNHwD3/6BopJw8v+meVvRuhKO4KHQb4
   ZJoQF+DIJ2zYUGI3luR5MAwLJBMyZhRe9E6OB9n1LkJ99+V8nmze1PZns
   JPH2SWWpgUa3tVr92dpJv52lHtTXeIobTrsvSK2R6ry+yApcqLNM0oSBT
   nE9xmxp0N0wyLyr36YgrKAUt4Q+a8uD0anUfXHBjihsQifCl5wQM3owwO
   KFveH6bKeOs4QVBpdwbD2a62yRWPHa/0S5p+8askUZ85cOkuQLhFUtdZw
   U5Ri4qSd2Y+K0/9HGib4snlH730tQXZ86692m6Cs1TIGBlobbGD4rLZZa
   g==;
X-CSE-ConnectionGUID: yVcLY1AmQxmAul+SkyMNSQ==
X-CSE-MsgGUID: ucwOGaCeSsqp4rYk5FWP+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47245313"
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="47245313"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 06:16:47 -0700
X-CSE-ConnectionGUID: CKY2I5vPR/K8PTltUK0qNg==
X-CSE-MsgGUID: 0MQVi9mpRPuTO1Koa414DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="138457997"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Apr 2025 06:16:44 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u91sA-0006Ir-0M;
	Sun, 27 Apr 2025 13:16:42 +0000
Date: Sun, 27 Apr 2025 21:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: Ariel Simulevski <ariel@simulevski.at>, gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ariel Simulevski <ariel@simulevski.at>
Subject: Re: [PATCH] staging: rtl8723bs: Fix CamelCase and coding style
 issues across driver
Message-ID: <202504272023.zLKcAokT-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250427/202504272023.zLKcAokT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504272023.zLKcAokT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504272023.zLKcAokT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/core/rtw_ap.c:322:6: warning: no previous prototype for function 'add_ratid' [-Wmissing-prototypes]
     322 | void add_ratid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
         |      ^
   drivers/staging/rtl8723bs/core/rtw_ap.c:322:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     322 | void add_ratid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
         | ^
         | static 
>> drivers/staging/rtl8723bs/core/rtw_ap.c:399:3: warning: '/*' within block comment [-Wcomment]
     399 |                 /* prepare for add_ratid */
         |                 ^
>> drivers/staging/rtl8723bs/core/rtw_ap.c:1219:52: error: use of undeclared identifier 'set_sta_key_cmd'; did you mean 'set_stakey_hdl'?
    1219 |         init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, set_sta_key_cmd);
         |                                                           ^~~~~~~~~~~~~~~
         |                                                           set_stakey_hdl
   drivers/staging/rtl8723bs/include/rtw_cmd.h:76:18: note: expanded from macro 'init_h2fwcmd_w_parm_no_rsp'
      76 |         pcmd->cmdcode = code;\
         |                         ^
   drivers/staging/rtl8723bs/include/rtw_mlme_ext.h:646:4: note: 'set_stakey_hdl' declared here
     646 | u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf);
         |    ^
>> drivers/staging/rtl8723bs/core/rtw_ap.c:1278:18: error: use of undeclared identifier 'set_key_cmd'; did you mean 'setkey_hdl'?
    1278 |         pcmd->cmdcode = set_key_cmd;
         |                         ^~~~~~~~~~~
         |                         setkey_hdl
   drivers/staging/rtl8723bs/include/rtw_mlme_ext.h:645:4: note: 'setkey_hdl' declared here
     645 | u8 setkey_hdl(struct adapter *padapter, u8 *pbuf);
         |    ^
   2 warnings and 2 errors generated.
--
>> drivers/staging/rtl8723bs/core/rtw_cmd.c:910:53: error: use of undeclared identifier 'set_sta_key_cmd'; did you mean 'set_stakey_hdl'?
     910 |                 init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, set_sta_key_cmd);
         |                                                                   ^~~~~~~~~~~~~~~
         |                                                                   set_stakey_hdl
   drivers/staging/rtl8723bs/include/rtw_cmd.h:76:18: note: expanded from macro 'init_h2fwcmd_w_parm_no_rsp'
      76 |         pcmd->cmdcode = code;\
         |                         ^
   drivers/staging/rtl8723bs/include/rtw_mlme_ext.h:646:4: note: 'set_stakey_hdl' declared here
     646 | u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf);
         |    ^
   drivers/staging/rtl8723bs/core/rtw_cmd.c:961:53: error: use of undeclared identifier 'set_sta_key_cmd'; did you mean 'set_stakey_hdl'?
     961 |                 init_h2fwcmd_w_parm_no_rsp(ph2c, psetstakey_para, set_sta_key_cmd);
         |                                                                   ^~~~~~~~~~~~~~~
         |                                                                   set_stakey_hdl
   drivers/staging/rtl8723bs/include/rtw_cmd.h:76:18: note: expanded from macro 'init_h2fwcmd_w_parm_no_rsp'
      76 |         pcmd->cmdcode = code;\
         |                         ^
   drivers/staging/rtl8723bs/include/rtw_mlme_ext.h:646:4: note: 'set_stakey_hdl' declared here
     646 | u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf);
         |    ^
   2 errors generated.
--
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:975:51: error: expected expression
     975 |                 if (padapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X) {
         |                                                                 ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1299:49: error: expected expression
    1299 |         if (adapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X)
         |                                                        ^
   drivers/staging/rtl8723bs/core/rtw_mlme.c:1857:42: error: expected expression
    1857 |         if (psecuritypriv->dot11_auth_algrthm ==.dot11_auth_algrthm_8021X)
         |                                                 ^
>> drivers/staging/rtl8723bs/core/rtw_mlme.c:1901:19: error: use of undeclared identifier 'set_key_cmd'; did you mean 'setkey_hdl'?
    1901 |                 pcmd->cmdcode = set_key_cmd;
         |                                 ^~~~~~~~~~~
         |                                 setkey_hdl
   drivers/staging/rtl8723bs/include/rtw_mlme_ext.h:645:4: note: 'setkey_hdl' declared here
     645 | u8 setkey_hdl(struct adapter *padapter, u8 *pbuf);
         |    ^
   4 errors generated.
--
>> drivers/staging/rtl8723bs/core/rtw_pwrctrl.c:330:50: error: expected expression
     330 |         if (padapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X &&
         |                                                         ^
   1 error generated.
--
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:21:2: error: use of undeclared identifier 'WLAN_CIPHER_SUITE__WEP40_'; did you mean 'WPA_CIPHER_SUITE__WEP40_'?
      21 |         WLAN_CIPHER_SUITE__WEP40_,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         WPA_CIPHER_SUITE__WEP40_
   drivers/staging/rtl8723bs/include/ieee80211.h:106:11: note: 'WPA_CIPHER_SUITE__WEP40_' declared here
     106 | extern u8 WPA_CIPHER_SUITE__WEP40_[];
         |           ^
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:21:2: error: incompatible pointer to integer conversion initializing 'const u32' (aka 'const unsigned int') with an expression of type 'u8[]' (aka 'unsigned char[]') [-Wint-conversion]
      21 |         WLAN_CIPHER_SUITE__WEP40_,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:546:39: error: expected expression
     546 |                         psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Auto;
         |                                                            ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:616:42: error: expected expression
     616 |         if (psecuritypriv->dot11_auth_algrthm ==.dot11_auth_algrthm_8021X && psta) { /*  psk/802_1x */
         |                                                 ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:764:50: error: expected expression
     764 |         if (padapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X) { /*  802_1x */
         |                                                         ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:858:7: error: use of undeclared identifier 'WLAN_CIPHER_SUITE__WEP40_'
     858 |         case WLAN_CIPHER_SUITE__WEP40_:
         |              ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1325:38: error: expected expression
    1325 |                 psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Auto;
         |                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1330:38: error: expected expression
    1330 |                 psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Open;
         |                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1333:39: error: expected expression
    1333 |                         psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
         |                                                            ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1338:38: error: expected expression
    1338 |                 psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Shared;
         |                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1344:38: error: expected expression
    1344 |                 psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Open;
         |                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1369:7: error: use of undeclared identifier 'WLAN_CIPHER_SUITE__WEP40_'
    1369 |         case WLAN_CIPHER_SUITE__WEP40_:
         |              ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1403:38: error: expected expression
    1403 |                 psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
         |                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1405:38: error: expected expression
    1405 |                 psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
         |                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1448:47: error: expected expression
    1448 |                         padapter->securitypriv.dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
         |                                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1457:47: error: expected expression
    1457 |                         padapter->securitypriv.dot11_auth_algrthm =.dot11_auth_algrthm_8021X;
         |                                                                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1580:37: error: expected expression
    1580 |         psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Open; /* open system */
         |                                            ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1676:37: error: expected expression
    1676 |         psecuritypriv->dot11_auth_algrthm =.dot11_auth_algrthm_Open; /* open system */
         |                                            ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:1699:43: error: expected expression
    1699 |         if ((psecuritypriv->dot11_auth_algrthm ==.dot11_auth_algrthm_Shared ||
         |                                                  ^
   19 errors generated.
--
>> drivers/staging/rtl8723bs/os_dep/mlme_linux.c:72:49: error: expected expression
      72 |         if (adapter->securitypriv.dot11_auth_algrthm ==.dot11_auth_algrthm_8021X) {
         |                                                        ^
   drivers/staging/rtl8723bs/os_dep/mlme_linux.c:106:34: error: expected expression
     106 |                 psec_priv->dot11_auth_algrthm =.dot11_auth_algrthm_Open;  /* open system */
         |                                                ^
   2 errors generated.


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
