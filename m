Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF9C1C5496
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750223768; cv=none; b=L2n4GMBxgcuSF9Lu2vWOjFRSAiNf4U8JKMy+q/MCEZNoD1tycxmFQzuFNSV4GWwjuwwWe04vC42o6GmQMZy1RdgCT/derzeq+BKGPPBveTeZVAVj0IVJkMoFNX0xwi+fv9jtPtEjnRDYkDAiX/4B1q/crhxt19jX+hMU+CKiuNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750223768; c=relaxed/simple;
	bh=cuqTtJ5y0H9S2EGfUcDskfm/X7wxUUFoRriaFWn19JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bwyOVPIDZo8eubfx0uDWv/hrD/LJSxaUIWkYhK9eecXAiZhh8NdKv8atRXTG3AfV3ByYCki8bPEslInYi8tG60tBXWKmDVdU8UpHEgKGReU91DNHRB7kQM6Pu6kQ9kd5Y2dbsZbETSP4EDZGbD0b7lE8k+w5iNVlK1q9iMEMLJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0J1tdSa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0J1tdSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750223767; x=1781759767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cuqTtJ5y0H9S2EGfUcDskfm/X7wxUUFoRriaFWn19JQ=;
  b=n0J1tdSa4VBXYAyVFA9aEqEFh1JQ2s3dWT2QIod0agQwUFCS3ivUQKaB
   qnCqtb+BZcriOOLNY8g/zI4MtrNJ3owrVaBQNMadrpSmQzwGP4mprCN4j
   7+CzPCXBsJ0yIOwnUWHCGj+aA7swV+I0cexvRMPeWdiGFunxmyThxSR/O
   j0ns2gUcyKgeAFYqjHrcZLt32pGI9fZrkyMjTs2XWRJ0K+e1NI7+60b0e
   1JrpCgGGETBUnvVi1w8StS6X514PJA69LokHszGeI32usgVBxwu2qHNgU
   TfUNWz3v8Ocyuq3rIaUbXGFDnYiS75NaCbZB95ZG+FKmBr1Oo/+VeDbm5
   g==;
X-CSE-ConnectionGUID: iswAboDVTBGnjHeu/zacHQ==
X-CSE-MsgGUID: cqL7mXw8QBq3Zu+RY3HBmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52404035"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52404035"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 22:16:02 -0700
X-CSE-ConnectionGUID: 0lI6FISDQxySkgpmXv4UuQ==
X-CSE-MsgGUID: fPTaV2sEStaIJGhTKo26Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="153886881"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jun 2025 22:16:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRl9R-000JQY-2j;
	Wed, 18 Jun 2025 05:15:57 +0000
Date: Wed, 18 Jun 2025 13:15:29 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: [tip:core/bugs 11/16] include/linux/compiler_types.h:497:20: error:
 impossible constraint in 'asm'
Message-ID: <202506181535.fUTgXhab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/bugs
head:   d298bb98d65f964288bb87feef014da1baafedda
commit: 45c79ca947c936085c94b716be92eaf9a1bdc8bb [11/16] bugs/s390: Use 'cond_str' in __EMIT_BUG()
config: s390-randconfig-r072-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181535.fUTgXhab-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181535.fUTgXhab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181535.fUTgXhab-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from <command-line>:
   crypto/api.c: In function '__crypto_alloc_tfmgfp':
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:43:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG("", 0);    \
     ^~~~~~~~~~
   crypto/api.c:389:3: note: in expansion of macro 'BUG'
      BUG();
      ^~~
>> include/linux/compiler_types.h:497:20: error: impossible constraint in 'asm'
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:43:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG("", 0);    \
     ^~~~~~~~~~
   crypto/api.c:389:3: note: in expansion of macro 'BUG'
      BUG();
      ^~~
   crypto/api.c: In function 'crypto_schedule_test':
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:48:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags)); \
     ^~~~~~~~~~
   include/asm-generic/bug.h:119:3: note: in expansion of macro '__WARN_FLAGS'
      __WARN_FLAGS("["#condition"] ",   \
      ^~~~~~~~~~~~
   crypto/api.c:176:2: note: in expansion of macro 'WARN_ON_ONCE'
     WARN_ON_ONCE(err != NOTIFY_STOP);
     ^~~~~~~~~~~~
   crypto/api.c: In function 'crypto_larval_destroy':
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:43:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG("", 0);    \
     ^~~~~~~~~~
   include/asm-generic/bug.h:77:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   crypto/api.c:97:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(!crypto_is_larval(alg));
     ^~~~~~
--
   In file included from <command-line>:
   crypto/algapi.c: In function 'crypto_grab_spawn':
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:48:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags)); \
     ^~~~~~~~~~
   include/asm-generic/bug.h:119:3: note: in expansion of macro '__WARN_FLAGS'
      __WARN_FLAGS("["#condition"] ",   \
      ^~~~~~~~~~~~
   crypto/algapi.c:729:6: note: in expansion of macro 'WARN_ON_ONCE'
     if (WARN_ON_ONCE(inst == NULL))
         ^~~~~~~~~~~~
>> include/linux/compiler_types.h:497:20: error: impossible constraint in 'asm'
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:48:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags)); \
     ^~~~~~~~~~
   include/asm-generic/bug.h:119:3: note: in expansion of macro '__WARN_FLAGS'
      __WARN_FLAGS("["#condition"] ",   \
      ^~~~~~~~~~~~
   crypto/algapi.c:729:6: note: in expansion of macro 'WARN_ON_ONCE'
     if (WARN_ON_ONCE(inst == NULL))
         ^~~~~~~~~~~~
   crypto/algapi.c: In function 'crypto_remove_instance.isra.13':
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:43:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG("", 0);    \
     ^~~~~~~~~~
   include/asm-generic/bug.h:77:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   crypto/algapi.c:154:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(!list_empty(&inst->alg.cra_users));
     ^~~~~~
   crypto/algapi.c: In function 'crypto_remove_spawns':
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:43:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG("", 0);    \
     ^~~~~~~~~~
   include/asm-generic/bug.h:77:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   crypto/algapi.c:203:4: note: in expansion of macro 'BUG_ON'
       BUG_ON(&inst->alg == alg);
       ^~~~~~
   crypto/algapi.c: In function 'crypto_unregister_alg':
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:48:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags)); \
     ^~~~~~~~~~
   include/asm-generic/bug.h:113:3: note: in expansion of macro '__WARN_FLAGS'
      __WARN_FLAGS("", BUGFLAG_NO_CUT_HERE | BUGFLAG_TAINT(taint));\
      ^~~~~~~~~~~~
   include/asm-generic/bug.h:141:3: note: in expansion of macro '__WARN_printf'
      __WARN_printf(TAINT_WARN, format);   \
      ^~~~~~~~~~~~~
   crypto/algapi.c:498:6: note: in expansion of macro 'WARN'
     if (WARN(ret, "Algorithm %s is not registered", alg->cra_driver_name))
         ^~~~
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:48:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags)); \
     ^~~~~~~~~~
   include/asm-generic/bug.h:109:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS("", BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:58:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   crypto/algapi.c:501:2: note: in expansion of macro 'WARN_ON'
     WARN_ON(!alg->cra_destroy && refcount_read(&alg->cra_refcnt) != 1);
     ^~~~~~~
   crypto/algapi.c: In function 'crypto_unregister_template':
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:43:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG("", 0);    \
     ^~~~~~~~~~
   include/asm-generic/bug.h:77:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   crypto/algapi.c:588:2: note: in expansion of macro 'BUG_ON'
     BUG_ON(list_empty(&tmpl->list));
     ^~~~~~
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:43:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG("", 0);    \
     ^~~~~~~~~~
   include/asm-generic/bug.h:77:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   crypto/algapi.c:595:3: note: in expansion of macro 'BUG_ON'
      BUG_ON(err);
      ^~~~~~
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:43:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG("", 0);    \
     ^~~~~~~~~~
   include/asm-generic/bug.h:77:57: note: in expansion of macro 'BUG'
    #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                            ^~~
   crypto/algapi.c:601:3: note: in expansion of macro 'BUG_ON'
      BUG_ON(refcount_read(&inst->alg.cra_refcnt) != 1);
      ^~~~~~
   crypto/algapi.c: In function 'crypto_register_alg':
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:48:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags)); \
     ^~~~~~~~~~
   include/asm-generic/bug.h:119:3: note: in expansion of macro '__WARN_FLAGS'
      __WARN_FLAGS("["#condition"] ",   \
      ^~~~~~~~~~~~
   crypto/algapi.c:442:7: note: in expansion of macro 'WARN_ON_ONCE'
         !WARN_ON_ONCE(alg->cra_destroy)) {
          ^~~~~~~~~~~~
--
   In file included from <command-line>:
   crypto/scatterwalk.c: In function 'skcipher_walk_first':
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:48:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags)); \
     ^~~~~~~~~~
   include/asm-generic/bug.h:119:3: note: in expansion of macro '__WARN_FLAGS'
      __WARN_FLAGS("["#condition"] ",   \
      ^~~~~~~~~~~~
   crypto/scatterwalk.c:275:6: note: in expansion of macro 'WARN_ON_ONCE'
     if (WARN_ON_ONCE(in_hardirq()))
         ^~~~~~~~~~~~
>> include/linux/compiler_types.h:497:20: error: impossible constraint in 'asm'
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:48:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags)); \
     ^~~~~~~~~~
   include/asm-generic/bug.h:119:3: note: in expansion of macro '__WARN_FLAGS'
      __WARN_FLAGS("["#condition"] ",   \
      ^~~~~~~~~~~~
   crypto/scatterwalk.c:275:6: note: in expansion of macro 'WARN_ON_ONCE'
     if (WARN_ON_ONCE(in_hardirq()))
         ^~~~~~~~~~~~
--
   In file included from <command-line>:
   crypto/aead.c: In function 'aead_register_instance':
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:48:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags)); \
     ^~~~~~~~~~
   include/asm-generic/bug.h:109:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS("", BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:58:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   crypto/aead.c:284:6: note: in expansion of macro 'WARN_ON'
     if (WARN_ON(!inst->free))
         ^~~~~~~
>> include/linux/compiler_types.h:497:20: error: impossible constraint in 'asm'
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:48:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags)); \
     ^~~~~~~~~~
   include/asm-generic/bug.h:109:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS("", BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:58:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   crypto/aead.c:284:6: note: in expansion of macro 'WARN_ON'
     if (WARN_ON(!inst->free))
         ^~~~~~~
--
   In file included from <command-line>:
   crypto/lskcipher.c: In function 'lskcipher_register_instance':
>> include/linux/compiler_types.h:497:20: warning: asm operand 0 probably doesn't match constraints
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:48:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags)); \
     ^~~~~~~~~~
   include/asm-generic/bug.h:109:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS("", BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:58:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   crypto/lskcipher.c:415:6: note: in expansion of macro 'WARN_ON'
     if (WARN_ON(!inst->free))
         ^~~~~~~
>> include/linux/compiler_types.h:497:20: error: impossible constraint in 'asm'
    #define asm_inline asm __inline
                       ^~~
   arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
     asm_inline volatile(     \
     ^~~~~~~~~~
   arch/s390/include/asm/bug.h:48:2: note: in expansion of macro '__EMIT_BUG'
     __EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags)); \
     ^~~~~~~~~~
   include/asm-generic/bug.h:109:19: note: in expansion of macro '__WARN_FLAGS'
    #define __WARN()  __WARN_FLAGS("", BUGFLAG_TAINT(TAINT_WARN))
                      ^~~~~~~~~~~~
   arch/s390/include/asm/bug.h:58:4: note: in expansion of macro '__WARN'
       __WARN();   \
       ^~~~~~
   crypto/lskcipher.c:415:6: note: in expansion of macro 'WARN_ON'
     if (WARN_ON(!inst->free))
         ^~~~~~~
..


vim +/asm +497 include/linux/compiler_types.h

dbaaabd60e1662 Linus Torvalds   2024-04-08  495  
eb111869301e15 Rasmus Villemoes 2019-09-13  496  #ifdef CONFIG_CC_HAS_ASM_INLINE
eb111869301e15 Rasmus Villemoes 2019-09-13 @497  #define asm_inline asm __inline
eb111869301e15 Rasmus Villemoes 2019-09-13  498  #else
eb111869301e15 Rasmus Villemoes 2019-09-13  499  #define asm_inline asm
eb111869301e15 Rasmus Villemoes 2019-09-13  500  #endif
eb111869301e15 Rasmus Villemoes 2019-09-13  501  

:::::: The code at line 497 was first introduced by commit
:::::: eb111869301e15b737315a46c913ae82bd19eb9d compiler-types.h: add asm_inline definition

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
