Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BCC18A6DF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615729; cv=none; b=D1RSNRTRXytqVML78a0Ge9JquzV6DyOatpU0L9BGFHRlm9+9L5dR45fjARv38WT6oNiF2TBtntG24kngH6ZERpR75o1M9Pp4pgjhc8WeLnWz4YXAf0LLLPMH4dQxyh7fYy6sg+BdceRs2oKoY5tiM8aGWs5f0IbzZtitss2DnMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615729; c=relaxed/simple;
	bh=9a/sCYEVlhOW0MpifKcJ2L5GED+5FismIdK13SReaq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R301nNuxDgwWUj4Cr6Luc/2fKvE+hbQCaK4K+Wm3ZiWXdu1HiwCxCrB0nTQLyZ6KMiiEbgDF8ObD3s4LcO34hpa3tD43Xm/NLbN5xIyDScuVBbdXXuOwwamn7R5Ap6v5HSSRiAXY6ghmEEl2nKjX0DiD3r93GWJ3GjUsfLFAXHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luT5H8HK; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luT5H8HK"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85e46f5c50fso1022639f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615726; x=1744220526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6x8J8MxvjMee+RIlbh/Ob/Mr8Kug11gtk+t9RRnsrQ=;
        b=luT5H8HKzYLz4JsxGLzm0wFNvlnmNE4KLwHf6xvy8uGyHSrWIjJoq65lrM1JuaqTE2
         UXMehYSNfK50qo1PebTqNlXvWnQUO8f0EcqG/M6E6xs8QePAKuKL7BdjaUODUKM+2AE7
         RpWcDM8UGCWWVBTEWZK1Zdhj6ThBZBRwTr15KRhNXo6IaF0qpgV2vbCgTqh1+k6LEZhj
         cIptzQp+X5B4AcXM21STIYunGb4kqb2uTxzg1UDlAtFEcSVWZmreCg2ozIduDH7LyYL0
         8s75mvTbVBvvX23xGg4CrmMi/L/8LuxTESSJMnjPcKZTf7POLDuRf6mjYo0fD2uL71cq
         /+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615726; x=1744220526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6x8J8MxvjMee+RIlbh/Ob/Mr8Kug11gtk+t9RRnsrQ=;
        b=mZ0LIwcG7oTzETp7AzWiShABmF2QiaIXB9jZARSDXv9rqu13zZDI4cf9+qIQH4Dy18
         c6/twId1MvprmhD5flJd1P6RK2lF8an9ydgI0jHo+N4BUsTk3dNeoyibu9tljyswhoKw
         7Z64+4cAeqMLAiM/uCWCQR7o94nVfuXMxTjOLhkgnHmHMGJ3g+dLrDTyf51llFLq2jWm
         WOqRjcX30JJt5USxc09Ac1rEEPvAzvMa+mj206wEp3nsrymdGgIm9B2iaIHzpLVBPIEj
         XtQzi6YAM+Hl/wvClEwdZorVN6n4H7mPm827PrciBnOAfi66CS7GumxFz8cNK6kJHs0r
         vuXw==
X-Forwarded-Encrypted: i=1; AJvYcCWvYzxl/EIMwlZgL3SPy9b/IdTYjZblDtzlRf6ZX8B/f6jF8EgecMWQOj+yJVOKVIy2dJKH8CrQZ/EK2h4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyygQ3vAU2Bs8ugPcy9y3x/YACQiSbUxvbW1jQxF0OEgUb/YWky
	tFbSdp2dEHvv6mcj1bZ7SRA+kOjEAf9M4eb7abfCSmCkoArSjyI5g+LGgSES
X-Gm-Gg: ASbGncu1W+woJIFEFnbyhH4nyqoF/poraQc0b1kw5sveLfb2Sda86AGSOhPax4yU/yp
	/XzQzLzcbkDzYrDzfdmFASxVKM/fuj0+Z15FOIuBDKTrFNzZwup6nuBTVU04fXLpd+dnzE8zq6l
	wm1QfO6oguUrHF5nVnbtLDwi6DRYAW+j9uANDuQ8kZ4ov7qc8BuqULAcQKMLtdbsJkORBvjv+Yk
	D326Sg6nps8iZ+5NI/tSnw4Lu4CuvODAHDT2k+rsAwAhqNdGa5glwkUCNRgMKnJ7lfavHhSWSri
	HEJ13IzZSlcRi6kw2oEgw6BvyhakkIbV8JfvoIiXvcbOIz0ykdOGz8muqEptHQ7N/gSpzLDwP16
	wTA==
X-Google-Smtp-Source: AGHT+IGRIBIMVU0N2WBIhZ2hkHivR9ifuc8aWmuVUT36I6whqo6KXVDeyNrmxfx2q4qyUelroTb/tw==
X-Received: by 2002:a05:6e02:3807:b0:3d3:f040:5878 with SMTP id e9e14a558f8ab-3d5e0a04e26mr206539215ab.21.1743615725874;
        Wed, 02 Apr 2025 10:42:05 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 00/54] Fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
Date: Wed,  2 Apr 2025 11:41:02 -0600
Message-ID: <20250402174156.1246171-1-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


This series fixes dynamic-debug's support for DRM debug-categories.
Classmaps-v1 evaded full review, and got committed in 2 chunks:

  b7b4eebdba7b..6ea3bf466ac6	# core dyndbg changes
  0406faf25fb1..ee7d633f2dfb	# drm adoption

Then DRM-CI found a regression when booting with drm.debug=<initval>;
the pr_debug callsites' static-keys under the drm-dbgs in drm.ko got
enabled, but those in drivers & helpers did not, since they weren't
yet modprobed, and didn't yet exist.

new in v3:

I've flip-flopped again (evolved) on class "protection"

Simply put, /sys/module/drm/parameters/debug is ABI.

If that is true, its an inviolate user expectation that their settings
are authoritative, and we cannot slide dynamic-debug in underneath
without accepting that constraint, special-cases and interface
annoyances not withstanding.

That said, w/o a PARAM, there is no ABI, so classmap use-cases without
one are left unprotected, so that they can be adjusted without
explicit "class FOO" queries.  This should satisfy the
keep-both-pieces crowd.

Note also: theres only 1 reason to want to get under the ABI: you want
to turn off some of a class's debugs, because they enlarge and clutter
the logs you must review.

   # iirc, these are high volume
   :#> echo module driverX class DRM_UT_VBL -p > control

But this isnt actually needed in this case; DRM_UT_VBL is already
pretty specific, and controllable directly from drm.debug.

Someday "mfsl" flags might apply to drm-dbg, but all drm's logging
prefixes are currently hardcoded, and may be semi-ABI, since
log-watchers might key on particular formats (however suboptimal that
might be).

This change is expressed separately, in a new patch:
  0028-dyndbg-restore-classmap-protection-when-theres-a-.patch
	
Minor changes:
. more late cleanup patches pulled forward in parts
. split doc of 2 parsing features
. merge parsing features, tests, docs
. added v2 reviewed-by tags.
. dropped extraneous patches

For your testing convenience, its here:
https://github.com/jimc/linux.git
commit 5cbe833ce591cdb076310b7dcf479fd566f10a22 (HEAD -> dd-fix-614, ghlinux/dd-fix-614)

-v2 is here:
https://lore.kernel.org/lkml/20250320185238.447458-1-jim.cromie@gmail.com/


Design Review / Restatemment:

My primary design goal for dyndbg-classmaps was DIRECT support of DRM,
with NO api changes, starting with the enum drm_debug_category typing,
and keeping as much of the existing macro stack as unaltered as possible.

Some UUID-ish thing was OO-scope; pessimizing unseen optimizations on
compile-time constant ints (that could fit in a byte), across DRM's
macro stack, with ~5k expansions, would be ungood.

Immediate consequences:

= unique integers are *hard* to coordinate across the whole kernel.

= 0 is not special - DRM_UT_CORE is already used.
  other users probably want it too
  
= 0..N are special - in several ways:
  1. DRM_UT_<*> is 0..10
     its the natural range, everybody wants it.
  2. they're exposed in sysfs knobs.
     ie: echo 0x1ff > /sys/module/drm/parameters/debug
     all classmap-param users get 0..N on their knob.

= DRM_UT_<*> has only 10 categories/classes
  small enough for DIRECT storage inside the _ddebug descriptor

= DRM's enum gives us both class-names and class/category values.
  classnames === stringified DRM_UT_<*>
  class_ids  === bare DRM_UT_<*>
  all future classmap users are expected to follow this model.
  
To accommodate the "special" contraints, we need to "privatize" the
class_id's, per module/group.  We can do this in a few steps:

= modules declare their map: classnames => Ids.
  author defined, user oriented
  classnames/strings is wide, expressive, *flat* interface
  2-levels used: DRM_UT_*, no 3-levels yet;
  _UT could vary, but has no meaning now.

We can use the known (and desired) ordering/contiguity of the 0..Ns
here, and of the array of classnames, to simplify the specification of
the map:

  _CLASSMAP_DEFINE (_base-ID/start-of-range, list-of-classnames)

no sparse maps, no reorder-maps, nothing extra to think about.  Just
consecutive classnames mapped to consecutive class_ids / categories.

= dyndbg refuses direct selection by class_ids.
  this privatizes the numbers
  "speak my class-name if you expect a response".

= dyndbg requires "grammar access only"
  no other control exists, not contemplated.
  ie: "class DRM_UT_CORE +p" >control
  ie: "name the class to change it"
  class-param handler writes cmd-strings per changed class bit.

= classname --> class_id lookup "validates" the user.
  unknown classnames can be discarded, per module.
  other modules get the same,
  no other class-user would accidentally know "DRM_UT_CORE"

= with private class_ids per module.
  a small 0..N range is enough.
  32 is a practical limit for a single classmap,
  if you think "echo 0x12345678 > $sysknob" is practical.
  16 is more practical, DRM has 10.
  we have 63.
  This allows ...

= multiple classmaps are supported
  as long as the mapped class_ids dont conflict.
  a fair requirement for a narrow, future use-case.
  this is now verified in this patchset.
  7x 8-bit classes is workable (if you'd like)

= "legacy" class.
  all existing (un-class'd) pr_debugs.
  class_id is a 6-bit integer,
  so all existing pr_debugs need a default.
  63 = 2^6-1 is our _DFLT
  0..62 is then available for named classes. (0 is not special)
  63 is "legacy".



Jim Cromie (54):
  vmlinux.lds.h: fixup HEADERED_SECTION{,_BY} macros
  docs/dyndbg: update examples \012 to \n
  docs/dyndbg: explain flags parse 1st
  test-dyndbg: fixup CLASSMAP usage error
  dyndbg: reword "class unknown," to "class:_UNKNOWN_"
  dyndbg: make ddebug_class_param union members same size
  dyndbg: drop NUM_TYPE_ARRAY
  dyndbg: reduce verbose/debug clutter
  dyndbg: refactor param_set_dyndbg_classes and below
  dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
  dyndbg: replace classmap list with a vector
  dyndbg: macrofy a 2-index for-loop pattern
  dyndbg,module: make proper substructs in _ddebug_info
  dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
  dyndbg: ddebug_table.mod_name down to _ddebug_info
  dyndbg-API: remove DD_CLASS_TYPE_(DISJOINT|LEVEL)_NAMES and code
  dyndbg-API: replace DECLARE_DYNDBG_CLASSMAP
  selftests-dyndbg: add tools/testing/selftests/dynamic_debug/*
  dyndbg: detect class_id reservation conflicts
  dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
  dyndbg-test: change do_prints testpoint to accept a loopct
  dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
  dyndbg: treat comma as a token separator
  dyndbg: split multi-query strings with %
  selftests-dyndbg: add test_mod_submod
  dyndbg: change __dynamic_func_call_cls* macros into expressions
  dyndbg: drop "protection" of class'd pr_debugs from legacy queries
  dyndbg: restore classmap protection when theres a controlling_param
  docs/dyndbg: add classmap info to howto
  drm: use correct ccflags-y spelling
  drm-dyndbg: adapt drm core to use dyndbg classmaps-v2
  drm-dyndbg: adapt DRM to invoke DYNAMIC_DEBUG_CLASSMAP_PARAM
  drm-print: fix config-dependent unused variable
  drm-dyndbg: DRM_CLASSMAP_USE in amdgpu driver
  drm-dyndbg: DRM_CLASSMAP_USE in i915 driver
  drm-dyndbg: DRM_CLASSMAP_USE in drm_crtc_helper
  drm-dyndbg: DRM_CLASSMAP_USE in drm_dp_helper
  drm-dyndbg: DRM_CLASSMAP_USE in nouveau
  drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
  drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
  drm-dyndbg: add DRM_CLASSMAP_USE to simpledrm
  drm-dyndbg: add DRM_CLASSMAP_USE to bochs
  drm-dyndbg: add DRM_CLASSMAP_USE to etnaviv
  drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
  drm-dyndbg: add DRM_CLASSMAP_USE to radeon
  drm-dyndbg: add DRM_CLASSMAP_USE to vmwgfx driver
  drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
  drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
  drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the gud driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
  drm-dyndbg: add DRM_CLASSMAP_USE to the drm_gem_shmem_helper driver
  drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
  drm: RFC - make drm_dyndbg_user.o for drm-*_helpers, drivers

 .../admin-guide/dynamic-debug-howto.rst       | 143 +++-
 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/Kconfig                       |   3 +-
 drivers/gpu/drm/Makefile                      |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  12 +-
 drivers/gpu/drm/display/drm_dp_helper.c       |  12 +-
 drivers/gpu/drm/drm_crtc_helper.c             |  12 +-
 drivers/gpu/drm/drm_dyndbg_user.c             |  11 +
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   1 +
 drivers/gpu/drm/drm_print.c                   |  38 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |   2 +
 drivers/gpu/drm/gma500/psb_drv.c              |   2 +
 drivers/gpu/drm/gud/gud_drv.c                 |   2 +
 drivers/gpu/drm/i915/i915_params.c            |  12 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         |   2 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  12 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |   2 +
 drivers/gpu/drm/radeon/radeon_drv.c           |   2 +
 drivers/gpu/drm/tiny/bochs.c                  |   2 +
 drivers/gpu/drm/tiny/simpledrm.c              |   2 +
 drivers/gpu/drm/udl/udl_main.c                |   2 +
 drivers/gpu/drm/virtio/virtgpu_drv.c          |   2 +
 drivers/gpu/drm/vkms/vkms_drv.c               |   2 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   2 +
 drivers/gpu/drm/xe/xe_drm_client.c            |   2 +
 include/asm-generic/vmlinux.lds.h             |  12 +-
 include/drm/drm_print.h                       |  12 +
 include/linux/dynamic_debug.h                 | 216 ++++--
 kernel/module/main.c                          |  15 +-
 lib/Kconfig.debug                             |  24 +-
 lib/Makefile                                  |   3 +
 lib/dynamic_debug.c                           | 637 +++++++++++-------
 lib/test_dynamic_debug.c                      | 203 ++++--
 lib/test_dynamic_debug_submod.c               |  21 +
 tools/testing/selftests/Makefile              |   1 +
 .../testing/selftests/dynamic_debug/Makefile  |   9 +
 tools/testing/selftests/dynamic_debug/config  |   7 +
 .../dynamic_debug/dyndbg_selftest.sh          | 373 ++++++++++
 38 files changed, 1353 insertions(+), 477 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_dyndbg_user.c
 create mode 100644 lib/test_dynamic_debug_submod.c
 create mode 100644 tools/testing/selftests/dynamic_debug/Makefile
 create mode 100644 tools/testing/selftests/dynamic_debug/config
 create mode 100755 tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh

-- 
2.49.0

