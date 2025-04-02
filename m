Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321821F872D;
	Wed,  2 Apr 2025 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615766; cv=none; b=swqEbF6ScSWvnEyODwywp7Wu1D8dAvChpV3cC8TuN2nBvJHlDwQGsuLsPHiL/vUBpaztR4TwDSwby5KsiHxYASj4JVZFEJ8JRsYPuRlkHtPM3BZHyDMEZoaLyKFeakfc/0atnx9APF91Lvieq+/tHA9CgPGpndM1XrNMtGMsz34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615766; c=relaxed/simple;
	bh=3hHSl94t/bITBPs3clvDM2F2NCjf/Zgf9AUYQfDspoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGPiJbFlm2dlV7l36FB0AQ4MzhBixNyyFpbgErJq8/t5SI93vh7pTfKbWBGOC8Qlnr669voi1q7nAtUzoYNbsc2etLBPmdiQJdnSHBB4AKL/JtaqfrhBbJA7R5lcRKQZW0s59Y0QQU45yieX6VWoI142JZQHhQF8qkBdpDVSrtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRn3QkmI; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRn3QkmI"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85dac9729c3so1001139f.2;
        Wed, 02 Apr 2025 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615763; x=1744220563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBFFM339JxjzZFE9F9mUGqskJ1T7S9VuqFHMSYzFpwo=;
        b=dRn3QkmIsJOOxHalxPhqWrKwOq/oDA2e8GQro6crcpbhHckrW+CqM81V9wawLPV2zr
         XnWNzUUaDY/dEuSQkz+xfPpqUjAFFNsOWOF3L58KnFf4zYEJNuiHrxDLvxXtDAd2q0IU
         63hADY8Q1zZkwppNuv97T4WsmjrkQP4RjPKcfMlHF1lKvowfJKqXj+hasVj+VLmrDmBY
         fzeQ1x/T+J0hWqkja5zQf6AU5SercDhpUIJDGsyJ2635JJKHqPEHH850jPuQw7v468FE
         g3ccFxCpKujcuVylrN6cgVY5nJNMkQ+f/34Prfe7hhM6w9lmd1Xlt/5ONJ7I9oYnsVuo
         B6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615763; x=1744220563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBFFM339JxjzZFE9F9mUGqskJ1T7S9VuqFHMSYzFpwo=;
        b=jbcG3guPJCprwF0R+MiVZ7UDaS7x15PqF+0vwFopZkUvvSeeJ8Y+uLDoPFtQPtEp5F
         fntEu7gtax1UOQTMVTKO1rA02IotyKiumYaXCfMGEFMuvxYJmIaH4seHW2uhFsIM4J5M
         +NMcUUNWcObWBU7DMYPFmX1OO64r942FG9j2QXk/n+yvzmbtU1Dt8DTx9bIhmegyyeVT
         F7nWyTPgYcRR4bhj+DGEpkdBpjqHZZ8yJTCzkGDAIDvVHk1/SF8/hKvQJ1NWuz5GSZEW
         Tb4EOVd6fj5TXO/6qMIUQEvwmnqGhnN+syRwWPefHXb5fYQuKFbxo6BoBocQ1eyKy19I
         b7EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWORHfmYTgPg4lHmtZ0R4Wg4MWr9fazRt6CVjHuAkSd7CEpHW5G6mNVl6ghRg+jgXSvvTE58PGXDZrVeoQq@vger.kernel.org, AJvYcCXVD2JWMDuTIP1IGc5vSf3retTO00Lmx8riITmfLHuDJ20Ts/oWyJlMyjzmdUGpVXBAAylNzSDIVek=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbI9sLjsL94piDbCt1vF/ra+5pE2k6nSetddoJh7h23R4rNCbB
	NpM51yr76AHAF1B8StcxWLxj16NvaZwRZTTAXu0D+HroqAUlDGMp+tB9vSed
X-Gm-Gg: ASbGnctfUrIovHYREadm6FkyIOmb4HyjAoPy8qRyUiFqMzg+c8ncKzooTkMfumnV4I0
	bLbYxR+VSByfiJPQZdYJF6fk2BCuABOXoiuBQ04M0McAO2JukGKyMqnx4H9xVP34ifyqM85vBsw
	lXSRRMf3L+u0lB1jMEB2cOp4/dsAyvKCJ3+cERlreJDznj4B11+w/Iwt4Vj4rgJGVJdqfUnCMoN
	zoOb932WrJIeHPhndVHtpvsvyKydh2Tlm7MFAXIwfqR2Yt7kw30owrl3mUTzQPvbBW57bJPTDUl
	++DjMXYWOwfGxIkL7F0UyrcJ/wZvfcu2WdB9tU1+Cg93FdFII6gVTc8QYhtJnSZ7UnhKlcZGFW9
	twg==
X-Google-Smtp-Source: AGHT+IFhLqkbJE0UpVSJmNkM4dkx1ppVBJoKSeZT343o5h63VoCAKbsDpePVjKMaUIz6jLi9wx0olw==
X-Received: by 2002:a05:6e02:1563:b0:3d6:cbc5:a102 with SMTP id e9e14a558f8ab-3d6d54ceea3mr34975145ab.13.1743615763162;
        Wed, 02 Apr 2025 10:42:43 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:42 -0700 (PDT)
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
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 29/54] docs/dyndbg: add classmap info to howto
Date: Wed,  2 Apr 2025 11:41:31 -0600
Message-ID: <20250402174156.1246171-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the 3 API macros providing dynamic_debug's classmaps

DYNDBG_CLASSMAP_DEFINE - create & export a classmap
DYNDBG_CLASSMAP_USE    - refer to exported map
DYNDBG_CLASSMAP_PARAM  - bind control param to the classmap
DYNDBG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug

TBD: some of this might be over-specification, or just over-talked.

NB: The _DEFINE & _USE model makes the user dependent on the definer,
just like EXPORT_SYMBOL(__drm_debug) already does.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3- rework protection around PARAM

v0.5 adjustments per Randy Dunlap
v0.7 checkpatch fixes
v0.8 more
v0.9 rewords

fixup-howto
---
 .../admin-guide/dynamic-debug-howto.rst       | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 1ceadf4f28f9..5eb4ae3b2f27 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -394,3 +394,96 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+Dynamic Debug classmaps
+=======================
+
+The "class" keyword selects prdbgs based on author supplied,
+domain-oriented names.  This complements the nested-scope keywords:
+module, file, function, line.
+
+The main difference from the others: classes must be named to be
+changed.  This protects them from generic overwrite:
+
+  # IOW this cannot undo any DRM.debug settings
+  :#> ddcmd -p
+
+This protection is needed in order to honor the ABI, settings done
+there must be respected:
+
+  :#> echo 0x1ff > /sys/module/drm/parameters/debug
+
+So each class must be enabled individually (no wildcards):
+
+  :#> ddcmd class DRM_UT_CORE +p
+  :#> ddcmd class DRM_UT_KMS +p
+  # or more selectively
+  :#> ddcmd class DRM_UT_CORE module drm +p
+
+That makes direct >control wordy and annoying, but it is a secondary
+interface; it is not intended to replace the ABI, just slide in
+underneath and reimplement it.
+
+However, since the param is the ABI, if a classmap DEFINEr doesn't
+also add a _CLASSMAP_PARAM, there is no ABI, and no protection is
+needed.  In that case, class'd prdbgs would be enabled/disabled by
+legacy (class-less) queries.
+
+
+Dynamic Debug Classmap API
+==========================
+
+DRM.debug is built upon:
+  ABI in /sys/module/drm/parameters/debug
+      the bits set all DRM_UT_* together
+  ~23 categorized api macros: drm_dbg_<T>()
+      all calling drm_{,dev}dbg(DRM_UT_*, ....)
+  ~5000 calls to the api macros across drivers/gpu/drm/*
+
+The const short ints are good for optimizing compilers; a primary
+classmaps design goal was to preserve those opporunities for
+optimization.  So basically .classid === category.
+
+Then we use the drm_categories DRM_UT_* enum for both the classnames
+(stringified enum symbols) and their numeric values.
+
+Its expected that future users will also use an enum-defined
+categorization scheme like DRM's, and dyndbg can be adapted under them
+similarly.
+
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
+classnames (a list of strings) onto class-ids consecutively, starting
+at _base, it also maps the names onto CLASSMAP_PARAM bits 0..N.
+
+DYNAMIC_DEBUG_CLASSMAP_USE(var) - modules call this to refer to the
+var _DEFINEd elsewhere (and exported).
+
+Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
+dyndbg to update those classes.  "class FOO" queries are validated
+against the classes, this finds the classid to alter; classes are not
+directly selectable by their classid.
+
+There are 2 types of classmaps:
+
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
+refers to a DEFINEd classmap, and associates it to the param's
+data-store.  This state is then applied to DEFINEr and USEr modules
+when they're modprobed.
+
+The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+amongst the contained classnames; all classes are independent in the
+control parser itself; there is no implied meaning in names like "V4".
+
+Modules or module-groups (drm & drivers) can define multiple
+classmaps, as long as they (all the classmaps) share the limited 0..62
+per-module-group _class_id range, without overlap.  If a module
+encounters a conflict between 2 classmaps its USEing, we can extend
+the _USE macro with an offset to allow avoiding the conflicting range.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the class'd pr_debug callsites can be forced off by toggling the
+classmap-kparam all-on then all-off.
-- 
2.49.0

