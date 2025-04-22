Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED51D27D794
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326764; cv=none; b=Peoa+uW3yNNgQsmUEhyzMP8D5tDRPXoZumRiC8o+Ler4yzQ1jetyczZr1TfTamw2GODlcxXqUVvw5bL2ZgcU5o5TLW2uJ2kvYuU7DAzPl0YFnNxhEPER5EkkGokF43Bec0aqKnli57qw2m/LlbcwWnRbi/gTvywYKJc4unN0OBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326764; c=relaxed/simple;
	bh=vibN9ZSfXy5zFiJUP2dCmlyBVTHRC/fEQrHHfr0lXDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ej3jDv3Kun9Bi88L+I8njp1rX8Nff+qyHAY0OjCeVnZV2gE/kPkhwGiFcUzMQT530FQcEv6SenoZpAeKB6zdw5fUMMc7c+8JpV4IP3uZ7+99rB+WzvghCY2/BSWsce+uDDE797W7ItDDqq8KhmAnLMG4S39XWkUWplwzROg8znM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW4M53DN; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW4M53DN"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-549b159c84cso6014108e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 05:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745326759; x=1745931559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8WZ20Ih1Q7tpOfVJlKZBPC9pkgZDvEzKbmRot7VLDk=;
        b=iW4M53DNIZsnsLXYq5HUc1KlSojRMiXg8TxYauPJUKSWvGyF7qTxjtuHrgMgyBacX2
         Wz4U/pRbupA/pxul8cvuBAGy6ngprkvBB6jBYdwLeTqwmDHZ4sx0xSXTD+0ubH2bnMlD
         ssx3HcdN9eXepLacWiGfXtk2tgAB8tG7q4U+G8NtgoQPBrE2yIpK2u/Cen4skVt0iHd2
         a+7HpxckbA8/2Q9J4sT8edD0+419FNoMME4avVFhfaYK9Js5Xl5uVJv/RYYzi3QWE73M
         mVQa9W6HU1AyE8l0uulXo9NdZGdYDVtzuQmVLMAbawTDVCby8/Oft2H+ouol4Bc6STIg
         UfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745326759; x=1745931559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8WZ20Ih1Q7tpOfVJlKZBPC9pkgZDvEzKbmRot7VLDk=;
        b=j3dw0l+tvJ/1JV1cdQptZ1dDvh1ChXM0m9sRFTT1m9XIM8Yjtx2xkrlHKQ5gh5XtiL
         5ghM/txuzLI0kuopzIWu8FbbV3p6RTyID/jrswKMsJ7fq14vWG9hoRJKtj2A4DaZpMpw
         O4orep1LLkQL834HH8sEmis2H7pUf13I8Oo3FY5UmyDxqXPAHCKBOb3GA+qHjsDsQK7l
         /D8eu3wtXNdeaBfcPLMN0EcZm3l8xla7MYXImgomKQNsj0Qq+3F/m3y7via9Ni+SIjZ1
         WIM5u+mHf+w5TYrd1JMqKol04tH+3Hmk4xbxfXU3I3uPWEq9EyIPTiKF+OdBBkaQ1NIm
         bKWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj3Kp7a8peX5vkokFLCx7Ola4IK3+nnNQbgITN7gu6kvsrkRIBwVFWMuhUVEiiCgEhJ75DcUtYki/NiAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6v572mUueoUMTUZwwCc7xEqV1dgOCeQvgKKVQmMY3G4vJzH56
	1cFhL2cc7SnCOlhiF41NmeMdtzxUOLClAzvbPBz9AXfpyUwNThoqyT3YSBD3VESPyK0qOJn0X2P
	J0EICTXBeGk20+wqL158AaOHRpkE=
X-Gm-Gg: ASbGnctSuPxCGYTMrSd2JqDD7QY56LEyGkUg81IcBBqHhGQFGWP+PmWvoFV07/ZabHN
	Hmjudw+ONUfpzP//t3eNA3ExbMuYPzi+ib6mPrdDDQ2Wq7rtj+QLYgAvQl4bMmYnvyQLN+RwoTf
	DGsHGSceqH8oFtwi5ZBnXgTQ==
X-Google-Smtp-Source: AGHT+IF+BXe9Dah2VNiUiueSorXOEtKz/pXgBDRayS9e3Jv2Eh+MYcieNQm0i2+UQVTV2wPxdY7LNcbBAjelYlrOs+U=
X-Received: by 2002:ac2:51d5:0:b0:54d:584e:d76d with SMTP id
 2adb3069b0e04-54d6e667f29mr5487744e87.51.1745326758395; Tue, 22 Apr 2025
 05:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417161216.88318-1-urezki@gmail.com> <202504190146.gTBIrktk-lkp@intel.com>
In-Reply-To: <202504190146.gTBIrktk-lkp@intel.com>
From: Uladzislau Rezki <urezki@gmail.com>
Date: Tue, 22 Apr 2025 14:59:07 +0200
X-Gm-Features: ATxdqUEdKZRtLvAOsCxlNYoH0CQrb3dXeWcB0C9w5O5-L3-WZkUZMJc9vlkddxY
Message-ID: <CA+KHdyVegyOM0hGnzCNJe4GgJ5mvu+_KK1dRpUOxFTNvS7oE6g@mail.gmail.com>
Subject: Re: [PATCH 1/4] lib/test_vmalloc.c: Replace RWSEM to SRCU for setup
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, 
	Baoquan He <bhe@redhat.com>, Christoph Hellwig <hch@infradead.org>, 
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

Fixed by the test_vmalloc.c: Fix compile error with CONFIG_TINY_RCU

--
Vlad Rezki

On Fri, Apr 18, 2025 at 8:13=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Uladzislau,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-nonmm-unstable]
> [also build test ERROR on linus/master hch-configfs/for-next v6.15-rc2 ne=
xt-20250417]
> [cannot apply to akpm-mm/mm-everything]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Uladzislau-Rezki-S=
ony/lib-test_vmalloc-c-Allow-built-in-execution/20250418-001446
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-no=
nmm-unstable
> patch link:    https://lore.kernel.org/r/20250417161216.88318-1-urezki%40=
gmail.com
> patch subject: [PATCH 1/4] lib/test_vmalloc.c: Replace RWSEM to SRCU for =
setup
> config: sparc64-randconfig-001-20250419 (https://download.01.org/0day-ci/=
archive/20250419/202504190146.gTBIrktk-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250419/202504190146.gTBIrktk-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504190146.gTBIrktk-lkp=
@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:69:8: error: redefinition of 'struct srcu_usa=
ge'
>     struct srcu_usage {
>            ^~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:52:8: note: originally defined here
>     struct srcu_usage { };
>            ^~~~~~~~~~
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:102:8: error: redefinition of 'struct srcu_st=
ruct'
>     struct srcu_struct {
>            ^~~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:16:8: note: originally defined here
>     struct srcu_struct {
>            ^~~~~~~~~~~
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:149: warning: "__SRCU_USAGE_INIT" redefined
>     #define __SRCU_USAGE_INIT(name)         \
>
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:53: note: this is the location of the previou=
s definition
>     #define __SRCU_USAGE_INIT(name) { }
>
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:167: warning: "__SRCU_STRUCT_INIT" redefined
>     #define __SRCU_STRUCT_INIT(name, usage_name, pcpu_name)      \
>
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:34: note: this is the location of the previou=
s definition
>     #define __SRCU_STRUCT_INIT(name, __ignored, ___ignored)   \
>
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:207: warning: "DEFINE_SRCU" redefined
>     #define DEFINE_SRCU(name)  __DEFINE_SRCU(name, /* not static */)
>
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:46: note: this is the location of the previou=
s definition
>     #define DEFINE_SRCU(name) \
>
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:208: warning: "DEFINE_STATIC_SRCU" redefined
>     #define DEFINE_STATIC_SRCU(name) __DEFINE_SRCU(name, static)
>
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:48: note: this is the location of the previou=
s definition
>     #define DEFINE_STATIC_SRCU(name) \
>
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:210:5: error: conflicting types for '__srcu_r=
ead_lock'
>     int __srcu_read_lock(struct srcu_struct *ssp) __acquires(ssp);
>         ^~~~~~~~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:63:19: note: previous definition of '__srcu_r=
ead_lock' was here
>     static inline int __srcu_read_lock(struct srcu_struct *ssp)
>                       ^~~~~~~~~~~~~~~~
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:211:6: error: conflicting types for 'synchron=
ize_srcu_expedited'
>     void synchronize_srcu_expedited(struct srcu_struct *ssp);
>          ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:99:20: note: previous definition of 'synchron=
ize_srcu_expedited' was here
>     static inline void synchronize_srcu_expedited(struct srcu_struct *ssp=
)
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:212:6: error: conflicting types for 'srcu_bar=
rier'
>     void srcu_barrier(struct srcu_struct *ssp);
>          ^~~~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:104:20: note: previous definition of 'srcu_ba=
rrier' was here
>     static inline void srcu_barrier(struct srcu_struct *ssp)
>                        ^~~~~~~~~~~~
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:213:6: error: conflicting types for 'srcu_tor=
ture_stats_print'
>     void srcu_torture_stats_print(struct srcu_struct *ssp, char *tt, char=
 *tf);
>          ^~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:113:20: note: previous definition of 'srcu_to=
rture_stats_print' was here
>     static inline void srcu_torture_stats_print(struct srcu_struct *ssp,
>                        ^~~~~~~~~~~~~~~~~~~~~~~~
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:217:20: error: conflicting types for '__srcu_=
ptr_to_ctr'
>     static inline bool __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct =
srcu_ctr __percpu *scpp)
>                        ^~~~~~~~~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:76:20: note: previous definition of '__srcu_p=
tr_to_ctr' was here
>     static inline bool __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct =
srcu_ctr __percpu *scpp)
>                        ^~~~~~~~~~~~~~~~~
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:224:41: error: conflicting types for '__srcu_=
ctr_to_ptr'
>     static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu=
_struct *ssp, int idx)
>                                             ^~~~~~~~~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:81:41: note: previous definition of '__srcu_c=
tr_to_ptr' was here
>     static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu=
_struct *ssp, int idx)
>                                             ^~~~~~~~~~~~~~~~~
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:243:41: error: conflicting types for '__srcu_=
read_lock_fast'
>     static inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct =
srcu_struct *ssp)
>                                             ^~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:86:41: note: previous definition of '__srcu_r=
ead_lock_fast' was here
>     static inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct =
srcu_struct *ssp)
>                                             ^~~~~~~~~~~~~~~~~~~~~
>    In file included from lib/test_vmalloc.c:18:
> >> include/linux/srcutree.h:271:20: error: conflicting types for '__srcu_=
read_unlock_fast'
>     static inline void __srcu_read_unlock_fast(struct srcu_struct *ssp, s=
truct srcu_ctr __percpu *scp)
>                        ^~~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:91:20: note: previous definition of '__srcu_r=
ead_unlock_fast' was here
>     static inline void __srcu_read_unlock_fast(struct srcu_struct *ssp, s=
truct srcu_ctr __percpu *scp)
>                        ^~~~~~~~~~~~~~~~~~~~~~~
> >> include/linux/srcutiny.h:96:31: error: static declaration of '__srcu_r=
ead_lock' follows non-static declaration
>     #define __srcu_read_lock_lite __srcu_read_lock
>                                   ^~~~~~~~~~~~~~~~
>    include/linux/srcutree.h:291:19: note: in expansion of macro '__srcu_r=
ead_lock_lite'
>     static inline int __srcu_read_lock_lite(struct srcu_struct *ssp)
>                       ^~~~~~~~~~~~~~~~~~~~~
>    In file included from lib/test_vmalloc.c:18:
>    include/linux/srcutree.h:210:5: note: previous declaration of '__srcu_=
read_lock' was here
>     int __srcu_read_lock(struct srcu_struct *ssp) __acquires(ssp);
>         ^~~~~~~~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
> >> include/linux/srcutiny.h:97:33: error: conflicting types for '__srcu_r=
ead_unlock'
>     #define __srcu_read_unlock_lite __srcu_read_unlock
>                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/srcutree.h:312:20: note: in expansion of macro '__srcu_r=
ead_unlock_lite'
>     static inline void __srcu_read_unlock_lite(struct srcu_struct *ssp, i=
nt idx)
>                        ^~~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcu.h:56:6: note: previous declaration of '__srcu_read_=
unlock' was here
>     void __srcu_read_unlock(struct srcu_struct *ssp, int idx) __releases(=
ssp);
>          ^~~~~~~~~~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
> >> include/linux/srcutiny.h:110:56: error: expected identifier or '(' bef=
ore 'do'
>     #define srcu_check_read_flavor_force(ssp, read_flavor) do { } while (=
0)
>                                                            ^~
>    include/linux/srcutree.h:324:20: note: in expansion of macro 'srcu_che=
ck_read_flavor_force'
>     static inline void srcu_check_read_flavor_force(struct srcu_struct *s=
sp, int read_flavor)
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> include/linux/srcutiny.h:110:63: error: expected identifier or '(' bef=
ore 'while'
>     #define srcu_check_read_flavor_force(ssp, read_flavor) do { } while (=
0)
>                                                                   ^~~~~
>    include/linux/srcutree.h:324:20: note: in expansion of macro 'srcu_che=
ck_read_flavor_force'
>     static inline void srcu_check_read_flavor_force(struct srcu_struct *s=
sp, int read_flavor)
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/srcutiny.h:109:50: error: expected identifier or '(' bef=
ore 'do'
>     #define srcu_check_read_flavor(ssp, read_flavor) do { } while (0)
>                                                      ^~
>    include/linux/srcutree.h:336:20: note: in expansion of macro 'srcu_che=
ck_read_flavor'
>     static inline void srcu_check_read_flavor(struct srcu_struct *ssp, in=
t read_flavor)
>                        ^~~~~~~~~~~~~~~~~~~~~~
>    include/linux/srcutiny.h:109:57: error: expected identifier or '(' bef=
ore 'while'
>     #define srcu_check_read_flavor(ssp, read_flavor) do { } while (0)
>                                                             ^~~~~
>    include/linux/srcutree.h:336:20: note: in expansion of macro 'srcu_che=
ck_read_flavor'
>     static inline void srcu_check_read_flavor(struct srcu_struct *ssp, in=
t read_flavor)
>                        ^~~~~~~~~~~~~~~~~~~~~~
>    lib/test_vmalloc.c: In function 'test_func':
> >> lib/test_vmalloc.c:460:19: error: passing argument 1 of 'synchronize_s=
rcu' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
>      synchronize_srcu(&prepare_for_test_srcu);
>                       ^~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/srcu.h:59,
>                     from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcutiny.h:55:43: note: expected 'struct srcu_struct *' =
but argument is of type 'struct srcu_struct *'
>     void synchronize_srcu(struct srcu_struct *ssp);
>                           ~~~~~~~~~~~~~~~~~~~~^~~
>    lib/test_vmalloc.c: In function 'do_concurrent_test':
> >> lib/test_vmalloc.c:538:23: error: passing argument 1 of 'srcu_read_loc=
k' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
>      idx =3D srcu_read_lock(&prepare_for_test_srcu);
>                           ^~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcu.h:247:54: note: expected 'struct srcu_struct *' but=
 argument is of type 'struct srcu_struct *'
>     static inline int srcu_read_lock(struct srcu_struct *ssp) __acquires(=
ssp)
>                                      ~~~~~~~~~~~~~~~~~~~~^~~
>    lib/test_vmalloc.c:555:19: error: passing argument 1 of 'srcu_read_unl=
ock' from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
>      srcu_read_unlock(&prepare_for_test_srcu, idx);
>                       ^~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/notifier.h:16,
>                     from include/linux/memory_hotplug.h:7,
>                     from include/linux/mmzone.h:1494,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from lib/test_vmalloc.c:9:
>    include/linux/srcu.h:397:57: note: expected 'struct srcu_struct *' but=
 argument is of type 'struct srcu_struct *'
>     static inline void srcu_read_unlock(struct srcu_struct *ssp, int idx)
>                                         ~~~~~~~~~~~~~~~~~~~~^~~
>    cc1: some warnings being treated as errors
> ..
>
>
> vim +69 include/linux/srcutree.h
>
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   65
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   66  /*
> 95433f7263011e Paul E. McKenney        2023-03-16   67   * Per-SRCU-domai=
n structure, update-side data linked from srcu_struct.
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   68   */
> 95433f7263011e Paul E. McKenney        2023-03-16  @69  struct srcu_usage=
 {
> 2ec303113d9789 Paul E. McKenney        2022-01-21   70          struct sr=
cu_node *node;                 /* Combining tree. */
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   71          struct sr=
cu_node *level[RCU_NUM_LVLS + 1];
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   72                   =
                               /* First node at each level. */
> 994f706872e6ce Paul E. McKenney        2022-01-24   73          int srcu_=
size_state;                    /* Small-to-big transition state. */
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   74          struct mu=
tex srcu_cb_mutex;             /* Serialize CB preparation. */
> 994f706872e6ce Paul E. McKenney        2022-01-24   75          spinlock_=
t __private lock;              /* Protect counters and size state. */
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   76          struct mu=
tex srcu_gp_mutex;             /* Serialize GP work. */
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   77          unsigned =
long srcu_gp_seq;              /* Grace-period seq #. */
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   78          unsigned =
long srcu_gp_seq_needed;       /* Latest gp_seq needed. */
> 1e9a038b7fe9a8 Paul E. McKenney        2017-04-24   79          unsigned =
long srcu_gp_seq_needed_exp;   /* Furthest future exp GP. */
> 282d8998e9979c Paul E. McKenney        2022-03-08   80          unsigned =
long srcu_gp_start;            /* Last GP start timestamp (jiffies) */
> 22607d66bbc3e8 Paul E. McKenney        2017-04-25   81          unsigned =
long srcu_last_gp_end;         /* Last GP end timestamp (ns) */
> 9f2e91d94c9155 Paul E. McKenney        2022-01-27   82          unsigned =
long srcu_size_jiffies;        /* Current contention-measurement interval. =
*/
> 9f2e91d94c9155 Paul E. McKenney        2022-01-27   83          unsigned =
long srcu_n_lock_retries;      /* Contention events in current interval. */
> 282d8998e9979c Paul E. McKenney        2022-03-08   84          unsigned =
long srcu_n_exp_nodelay;       /* # expedited no-delays in current GP phase=
. */
> 46470cf85d2b61 Paul E. McKenney        2022-01-27   85          bool sda_=
is_static;                     /* May ->sda be passed to free_percpu()? */
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   86          unsigned =
long srcu_barrier_seq;         /* srcu_barrier seq #. */
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   87          struct mu=
tex srcu_barrier_mutex;        /* Serialize barrier ops. */
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   88          struct co=
mpletion srcu_barrier_completion;
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   89                   =
                               /* Awaken barrier rq at end. */
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   90          atomic_t =
srcu_barrier_cpu_cnt;          /* # CPUs not yet posting a */
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   91                   =
                               /*  callback for the barrier */
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   92                   =
                               /*  operation. */
> 282d8998e9979c Paul E. McKenney        2022-03-08   93          unsigned =
long reschedule_jiffies;
> 282d8998e9979c Paul E. McKenney        2022-03-08   94          unsigned =
long reschedule_count;
> d8be81735aa894 Paul E. McKenney        2017-03-25   95          struct de=
layed_work work;
> fd1b3f8e097b7f Paul E. McKenney        2023-03-17   96          struct sr=
cu_struct *srcu_ssp;
> 95433f7263011e Paul E. McKenney        2023-03-16   97  };
> 95433f7263011e Paul E. McKenney        2023-03-16   98
> da915ad5cf25b5 Paul E. McKenney        2017-04-05   99  /*
> da915ad5cf25b5 Paul E. McKenney        2017-04-05  100   * Per-SRCU-domai=
n structure, similar in function to rcu_state.
> da915ad5cf25b5 Paul E. McKenney        2017-04-05  101   */
> d8be81735aa894 Paul E. McKenney        2017-03-25 @102  struct srcu_struc=
t {
> 795e7efec6ea7e Paul E. McKenney        2024-12-19  103          struct sr=
cu_ctr __percpu *srcu_ctrp;
> da915ad5cf25b5 Paul E. McKenney        2017-04-05  104          struct sr=
cu_data __percpu *sda;         /* Per-CPU srcu_data array. */
> d8be81735aa894 Paul E. McKenney        2017-03-25  105          struct lo=
ckdep_map dep_map;
> 95433f7263011e Paul E. McKenney        2023-03-16  106          struct sr=
cu_usage *srcu_sup;            /* Update-side data. */
> d8be81735aa894 Paul E. McKenney        2017-03-25  107  };
> d8be81735aa894 Paul E. McKenney        2017-03-25  108
> e15a19306004b3 Pingfan Liu             2023-01-04  109  // Values for siz=
e state variable (->srcu_size_state).  Once the state
> e15a19306004b3 Pingfan Liu             2023-01-04  110  // has been set t=
o SRCU_SIZE_ALLOC, the grace-period code advances through
> e15a19306004b3 Pingfan Liu             2023-01-04  111  // this state mac=
hine one step per grace period until the SRCU_SIZE_BIG state
> e15a19306004b3 Pingfan Liu             2023-01-04  112  // is reached.  O=
therwise, the state machine remains in the SRCU_SIZE_SMALL
> e15a19306004b3 Pingfan Liu             2023-01-04  113  // state indefini=
tely.
> e15a19306004b3 Pingfan Liu             2023-01-04  114  #define SRCU_SIZE=
_SMALL         0       // No srcu_node combining tree, ->node =3D=3D NULL
> e15a19306004b3 Pingfan Liu             2023-01-04  115  #define SRCU_SIZE=
_ALLOC         1       // An srcu_node tree is being allocated, initialized=
,
> e15a19306004b3 Pingfan Liu             2023-01-04  116                   =
                       //  and then referenced by ->node.  It will not be u=
sed.
> e15a19306004b3 Pingfan Liu             2023-01-04  117  #define SRCU_SIZE=
_WAIT_BARRIER  2       // The srcu_node tree starts being used by everythin=
g
> e15a19306004b3 Pingfan Liu             2023-01-04  118                   =
                       //  except call_srcu(), especially by srcu_barrier()=
.
> e15a19306004b3 Pingfan Liu             2023-01-04  119                   =
                       //  By the end of this state, all CPUs and threads
> e15a19306004b3 Pingfan Liu             2023-01-04  120                   =
                       //  are aware of this tree's existence.
> e15a19306004b3 Pingfan Liu             2023-01-04  121  #define SRCU_SIZE=
_WAIT_CALL     3       // The srcu_node tree starts being used by call_srcu=
().
> e15a19306004b3 Pingfan Liu             2023-01-04  122                   =
                       //  By the end of this state, all of the call_srcu()
> e15a19306004b3 Pingfan Liu             2023-01-04  123                   =
                       //  invocations that were running on a non-boot CPU
> e15a19306004b3 Pingfan Liu             2023-01-04  124                   =
                       //  and using the boot CPU's callback queue will hav=
e
> e15a19306004b3 Pingfan Liu             2023-01-04  125                   =
                       //  completed.
> e15a19306004b3 Pingfan Liu             2023-01-04  126  #define SRCU_SIZE=
_WAIT_CBS1     4       // Don't trust the ->srcu_have_cbs[] grace-period
> e15a19306004b3 Pingfan Liu             2023-01-04  127  #define SRCU_SIZE=
_WAIT_CBS2     5       //  sequence elements or the ->srcu_data_have_cbs[]
> e15a19306004b3 Pingfan Liu             2023-01-04  128  #define SRCU_SIZE=
_WAIT_CBS3     6       //  CPU-bitmask elements until all four elements of
> e15a19306004b3 Pingfan Liu             2023-01-04  129  #define SRCU_SIZE=
_WAIT_CBS4     7       //  each array have been initialized.
> e15a19306004b3 Pingfan Liu             2023-01-04  130  #define SRCU_SIZE=
_BIG           8       // The srcu_node combining tree is fully initialized
> e15a19306004b3 Pingfan Liu             2023-01-04  131                   =
                       //  and all aspects of it are being put to use.
> 994f706872e6ce Paul E. McKenney        2022-01-24  132
> da915ad5cf25b5 Paul E. McKenney        2017-04-05  133  /* Values for sta=
te variable (bottom bits of ->srcu_gp_seq). */
> d8be81735aa894 Paul E. McKenney        2017-03-25  134  #define SRCU_STAT=
E_IDLE         0
> d8be81735aa894 Paul E. McKenney        2017-03-25  135  #define SRCU_STAT=
E_SCAN1        1
> d8be81735aa894 Paul E. McKenney        2017-03-25  136  #define SRCU_STAT=
E_SCAN2        2
> d8be81735aa894 Paul E. McKenney        2017-03-25  137
> 29bc83e4d90546 JP Kobryn               2024-07-15  138  /*
> 29bc83e4d90546 JP Kobryn               2024-07-15  139   * Values for ini=
tializing gp sequence fields. Higher values allow wrap arounds to
> 29bc83e4d90546 JP Kobryn               2024-07-15  140   * occur earlier.
> 29bc83e4d90546 JP Kobryn               2024-07-15  141   * The second val=
ue with state is useful in the case of static initialization of
> 29bc83e4d90546 JP Kobryn               2024-07-15  142   * srcu_usage whe=
re srcu_gp_seq_needed is expected to have some state value in its
> 29bc83e4d90546 JP Kobryn               2024-07-15  143   * lower bits (or=
 else it will appear to be already initialized within
> 29bc83e4d90546 JP Kobryn               2024-07-15  144   * the call check=
_init_srcu_struct()).
> 29bc83e4d90546 JP Kobryn               2024-07-15  145   */
> 29bc83e4d90546 JP Kobryn               2024-07-15  146  #define SRCU_GP_S=
EQ_INITIAL_VAL ((0UL - 100UL) << RCU_SEQ_CTR_SHIFT)
> 29bc83e4d90546 JP Kobryn               2024-07-15  147  #define SRCU_GP_S=
EQ_INITIAL_VAL_WITH_STATE (SRCU_GP_SEQ_INITIAL_VAL - 1)
> 29bc83e4d90546 JP Kobryn               2024-07-15  148
> 03200b5ca3b4d4 Paul E. McKenney        2023-03-17 @149  #define __SRCU_US=
AGE_INIT(name)                                                             =
    \
> d8be81735aa894 Paul E. McKenney        2017-03-25  150  {                =
                                                                           =
    \
> d633198088bd9e Paul E. McKenney        2017-10-10  151          .lock =3D=
 __SPIN_LOCK_UNLOCKED(name.lock),                                          =
      \
> 29bc83e4d90546 JP Kobryn               2024-07-15  152          .srcu_gp_=
seq =3D SRCU_GP_SEQ_INITIAL_VAL,                                           =
      \
> 29bc83e4d90546 JP Kobryn               2024-07-15  153          .srcu_gp_=
seq_needed =3D SRCU_GP_SEQ_INITIAL_VAL_WITH_STATE,                         =
      \
> 29bc83e4d90546 JP Kobryn               2024-07-15  154          .srcu_gp_=
seq_needed_exp =3D SRCU_GP_SEQ_INITIAL_VAL,                                =
      \
> 4e6ea4ef56f942 Paul E. McKenney        2018-08-14  155          .work =3D=
 __DELAYED_WORK_INITIALIZER(name.work, NULL, 0),                           =
      \
> 03200b5ca3b4d4 Paul E. McKenney        2023-03-17  156  }
> 03200b5ca3b4d4 Paul E. McKenney        2023-03-17  157
> 03200b5ca3b4d4 Paul E. McKenney        2023-03-17  158  #define __SRCU_ST=
RUCT_INIT_COMMON(name, usage_name)                                         =
    \
> 95433f7263011e Paul E. McKenney        2023-03-16  159          .srcu_sup=
 =3D &usage_name,                                                          =
      \
> f4d01a259374ef Paul E. McKenney        2023-03-17  160          __SRCU_DE=
P_MAP_INIT(name)
> f4d01a259374ef Paul E. McKenney        2023-03-17  161
> 95433f7263011e Paul E. McKenney        2023-03-16  162  #define __SRCU_ST=
RUCT_INIT_MODULE(name, usage_name)                                         =
    \
> f4d01a259374ef Paul E. McKenney        2023-03-17  163  {                =
                                                                           =
    \
> 95433f7263011e Paul E. McKenney        2023-03-16  164          __SRCU_ST=
RUCT_INIT_COMMON(name, usage_name)                                         =
    \
> d8be81735aa894 Paul E. McKenney        2017-03-25  165  }
> d8be81735aa894 Paul E. McKenney        2017-03-25  166
> 95433f7263011e Paul E. McKenney        2023-03-16 @167  #define __SRCU_ST=
RUCT_INIT(name, usage_name, pcpu_name)                                     =
    \
> f4d01a259374ef Paul E. McKenney        2023-03-17  168  {                =
                                                                           =
    \
> f4d01a259374ef Paul E. McKenney        2023-03-17  169          .sda =3D =
&pcpu_name,                                                                =
      \
> 795e7efec6ea7e Paul E. McKenney        2024-12-19  170          .srcu_ctr=
p =3D &pcpu_name.srcu_ctrs[0],                                             =
      \
> 95433f7263011e Paul E. McKenney        2023-03-16  171          __SRCU_ST=
RUCT_INIT_COMMON(name, usage_name)                                         =
    \
> d8be81735aa894 Paul E. McKenney        2017-03-25  172  }
> d8be81735aa894 Paul E. McKenney        2017-03-25  173
> d8be81735aa894 Paul E. McKenney        2017-03-25  174  /*
> d8be81735aa894 Paul E. McKenney        2017-03-25  175   * Define and ini=
tialize a srcu struct at build time.
> d8be81735aa894 Paul E. McKenney        2017-03-25  176   * Do -not- call =
init_srcu_struct() nor cleanup_srcu_struct() on it.
> d8be81735aa894 Paul E. McKenney        2017-03-25  177   *
> d8be81735aa894 Paul E. McKenney        2017-03-25  178   * Note that alth=
ough DEFINE_STATIC_SRCU() hides the name from other
> d8be81735aa894 Paul E. McKenney        2017-03-25  179   * files, the per=
-CPU variable rules nevertheless require that the
> d8be81735aa894 Paul E. McKenney        2017-03-25  180   * chosen name be=
 globally unique.  These rules also prohibit use of
> d8be81735aa894 Paul E. McKenney        2017-03-25  181   * DEFINE_STATIC_=
SRCU() within a function.  If these rules are too
> d8be81735aa894 Paul E. McKenney        2017-03-25  182   * restrictive, d=
eclare the srcu_struct manually.  For example, in
> d8be81735aa894 Paul E. McKenney        2017-03-25  183   * each file:
> d8be81735aa894 Paul E. McKenney        2017-03-25  184   *
> d8be81735aa894 Paul E. McKenney        2017-03-25  185   *      static st=
ruct srcu_struct my_srcu;
> d8be81735aa894 Paul E. McKenney        2017-03-25  186   *
> d8be81735aa894 Paul E. McKenney        2017-03-25  187   * Then, before t=
he first use of each my_srcu, manually initialize it:
> d8be81735aa894 Paul E. McKenney        2017-03-25  188   *
> d8be81735aa894 Paul E. McKenney        2017-03-25  189   *      init_srcu=
_struct(&my_srcu);
> d8be81735aa894 Paul E. McKenney        2017-03-25  190   *
> d8be81735aa894 Paul E. McKenney        2017-03-25  191   * See include/li=
nux/percpu-defs.h for the rules on per-CPU variables.
> d8be81735aa894 Paul E. McKenney        2017-03-25  192   */
> fe15b50cdeeebd Paul E. McKenney        2019-04-05  193  #ifdef MODULE
> fe15b50cdeeebd Paul E. McKenney        2019-04-05  194  # define __DEFINE=
_SRCU(name, is_static)                                                     =
    \
> 03200b5ca3b4d4 Paul E. McKenney        2023-03-17  195          static st=
ruct srcu_usage name##_srcu_usage =3D __SRCU_USAGE_INIT(name##_srcu_usage);=
      \
> 95433f7263011e Paul E. McKenney        2023-03-16  196          is_static=
 struct srcu_struct name =3D __SRCU_STRUCT_INIT_MODULE(name, name##_srcu_us=
age); \
> db8f1471c61336 Alexander Aring         2022-01-26  197          extern st=
ruct srcu_struct * const __srcu_struct_##name;                             =
    \
> 056b89e7e69974 Joel Fernandes (Google  2019-04-11  198)         struct sr=
cu_struct * const __srcu_struct_##name                                     =
    \
> fe15b50cdeeebd Paul E. McKenney        2019-04-05  199                  _=
_section("___srcu_struct_ptrs") =3D &name
> fe15b50cdeeebd Paul E. McKenney        2019-04-05  200  #else
> d8be81735aa894 Paul E. McKenney        2017-03-25  201  # define __DEFINE=
_SRCU(name, is_static)                                                     =
    \
> da915ad5cf25b5 Paul E. McKenney        2017-04-05  202          static DE=
FINE_PER_CPU(struct srcu_data, name##_srcu_data);                          =
    \
> 03200b5ca3b4d4 Paul E. McKenney        2023-03-17  203          static st=
ruct srcu_usage name##_srcu_usage =3D __SRCU_USAGE_INIT(name##_srcu_usage);=
      \
> fe15b50cdeeebd Paul E. McKenney        2019-04-05  204          is_static=
 struct srcu_struct name =3D                                               =
      \
> 95433f7263011e Paul E. McKenney        2023-03-16  205                  _=
_SRCU_STRUCT_INIT(name, name##_srcu_usage, name##_srcu_data)
> fe15b50cdeeebd Paul E. McKenney        2019-04-05  206  #endif
> d8be81735aa894 Paul E. McKenney        2017-03-25 @207  #define DEFINE_SR=
CU(name)               __DEFINE_SRCU(name, /* not static */)
> d8be81735aa894 Paul E. McKenney        2017-03-25 @208  #define DEFINE_ST=
ATIC_SRCU(name)        __DEFINE_SRCU(name, static)
> d8be81735aa894 Paul E. McKenney        2017-03-25  209
> 443971156cebfc Paul E. McKenney        2025-01-13 @210  int __srcu_read_l=
ock(struct srcu_struct *ssp) __acquires(ssp);
> aacb5d91ab1bfb Paul E. McKenney        2018-10-28 @211  void synchronize_=
srcu_expedited(struct srcu_struct *ssp);
> aacb5d91ab1bfb Paul E. McKenney        2018-10-28 @212  void srcu_barrier=
(struct srcu_struct *ssp);
> aacb5d91ab1bfb Paul E. McKenney        2018-10-28 @213  void srcu_torture=
_stats_print(struct srcu_struct *ssp, char *tt, char *tf);
> d8be81735aa894 Paul E. McKenney        2017-03-25  214
> f4bde41dd19db5 Paul E. McKenney        2025-01-08  215  // Converts a per=
-CPU pointer to an ->srcu_ctrs[] array element to that
> f4bde41dd19db5 Paul E. McKenney        2025-01-08  216  // element's inde=
x.
> f4bde41dd19db5 Paul E. McKenney        2025-01-08 @217  static inline boo=
l __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct srcu_ctr __percpu *scpp=
)
> f4bde41dd19db5 Paul E. McKenney        2025-01-08  218  {
> f4bde41dd19db5 Paul E. McKenney        2025-01-08  219          return sc=
pp - &ssp->sda->srcu_ctrs[0];
> f4bde41dd19db5 Paul E. McKenney        2025-01-08  220  }
> f4bde41dd19db5 Paul E. McKenney        2025-01-08  221
> 4937096b579a36 Paul E. McKenney        2025-01-08  222  // Converts an in=
teger to a per-CPU pointer to the corresponding
> 4937096b579a36 Paul E. McKenney        2025-01-08  223  // ->srcu_ctrs[] =
array element.
> 4937096b579a36 Paul E. McKenney        2025-01-08 @224  static inline str=
uct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ssp, int idx)
> 4937096b579a36 Paul E. McKenney        2025-01-08  225  {
> 4937096b579a36 Paul E. McKenney        2025-01-08  226          return &s=
sp->sda->srcu_ctrs[idx];
> 4937096b579a36 Paul E. McKenney        2025-01-08  227  }
> 4937096b579a36 Paul E. McKenney        2025-01-08  228
> c4020620528e4e Paul E. McKenney        2025-01-09  229  /*
> c4020620528e4e Paul E. McKenney        2025-01-09  230   * Counts the new=
 reader in the appropriate per-CPU element of the
> c4020620528e4e Paul E. McKenney        2025-01-09  231   * srcu_struct.  =
Returns a pointer that must be passed to the matching
> c4020620528e4e Paul E. McKenney        2025-01-09  232   * srcu_read_unlo=
ck_fast().
> c4020620528e4e Paul E. McKenney        2025-01-09  233   *
> 3cec27453db49a Paul E. McKenney        2025-01-28  234   * Note that both=
 this_cpu_inc() and atomic_long_inc() are RCU read-side
> 3cec27453db49a Paul E. McKenney        2025-01-28  235   * critical secti=
ons either because they disables interrupts, because they
> 3cec27453db49a Paul E. McKenney        2025-01-28  236   * are a single i=
nstruction, or because they are a read-modify-write atomic
> 3cec27453db49a Paul E. McKenney        2025-01-28  237   * operation, dep=
ending on the whims of the architecture.
> 3cec27453db49a Paul E. McKenney        2025-01-28  238   *
> 3cec27453db49a Paul E. McKenney        2025-01-28  239   * This means tha=
t __srcu_read_lock_fast() is not all that fast
> 3cec27453db49a Paul E. McKenney        2025-01-28  240   * on architectur=
es that support NMIs but do not supply NMI-safe
> 3cec27453db49a Paul E. McKenney        2025-01-28  241   * implementation=
s of this_cpu_inc().
> c4020620528e4e Paul E. McKenney        2025-01-09  242   */
> c4020620528e4e Paul E. McKenney        2025-01-09 @243  static inline str=
uct srcu_ctr __percpu *__srcu_read_lock_fast(struct srcu_struct *ssp)
> c4020620528e4e Paul E. McKenney        2025-01-09  244  {
> c4020620528e4e Paul E. McKenney        2025-01-09  245          struct sr=
cu_ctr __percpu *scp =3D READ_ONCE(ssp->srcu_ctrp);
> c4020620528e4e Paul E. McKenney        2025-01-09  246
> c4020620528e4e Paul E. McKenney        2025-01-09  247          RCU_LOCKD=
EP_WARN(!rcu_is_watching(), "RCU must be watching srcu_read_lock_fast().");
> 3cec27453db49a Paul E. McKenney        2025-01-28  248          if (!IS_E=
NABLED(CONFIG_NEED_SRCU_NMI_SAFE))
> c4020620528e4e Paul E. McKenney        2025-01-09  249                  t=
his_cpu_inc(scp->srcu_locks.counter); /* Y */
> 3cec27453db49a Paul E. McKenney        2025-01-28  250          else
> 3cec27453db49a Paul E. McKenney        2025-01-28  251                  a=
tomic_long_inc(raw_cpu_ptr(&scp->srcu_locks));  /* Z */
> c4020620528e4e Paul E. McKenney        2025-01-09  252          barrier()=
; /* Avoid leaking the critical section. */
> c4020620528e4e Paul E. McKenney        2025-01-09  253          return sc=
p;
> c4020620528e4e Paul E. McKenney        2025-01-09  254  }
> c4020620528e4e Paul E. McKenney        2025-01-09  255
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki



--=20
Uladzislau Rezki
