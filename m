Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D15F1F4CBE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615762; cv=none; b=SGgB3UIwC4MXMOyMjD4dAVsyHYq6qlMkOXQ1tSiAelp8DymH72PvmslBgid50wr1ML5FCC8yPQKpcUMJebDwHd7XGGJ11+QbIlGgj/oPby3MsctD9unt1wjpUX6j+8v2sIKMM0BKLMFmMQhpGCthT23wfIOHqwPgHBjrADGMuwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615762; c=relaxed/simple;
	bh=FufqRHztesKUA9R7JaFyA9Iq+LLeP3mh04LhL5pR3Co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TulIZkjcLHG+9/O5rRxWnkWF7Gx5v+5WPOPHw4mnIw5pnAB0Fj3iZ9tgFILGixpcGWzGsrvFOkK+YF90q486a4v36C3YyuVF91n8lw/eofg6j/OSAY5Mv/XAQsNlHWBKFYBhvbyffPSTRcItF0O6PNlqsVI6IPcu4JtMD6vAEkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfzZ4LQN; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfzZ4LQN"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d589ed2b47so469725ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615759; x=1744220559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImilXtuxs5UykdZVkLyjXnRTikwvIK4nE+zQcHkVhFU=;
        b=lfzZ4LQNXjrMetBt4Z5KW9sEIpLOJXjbe3CV54q5ipjdbDkc03y6t7MnJWVZJFmpFO
         XVHTMhjyfTjb2yC5dUqIsTj2DQzslPF6sIqy6108hm5mP3odbSga84tGB2o+4vDIiQc5
         cHoOJLnZZBOFV0ZLYJoXrf8wyOVqmQdNGZTEg8b8VqszabRX1KWqHX+oeswR94X1AvXx
         2vtSCvCY+kQ6/iRjhFOJyAiHfc9HKW2B3L2eqmAwPoEAy99226rDYFCfqNJcQjUs4wTS
         w1eYKIrxItf3jDzWkDrLHX2X5Y751+s9F6Hh4Jkf7LJV0CFnNHHZedE8szT9gKbcz2Pf
         2SWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615759; x=1744220559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ImilXtuxs5UykdZVkLyjXnRTikwvIK4nE+zQcHkVhFU=;
        b=Ipgwpbzc+xhhScABDmVow9VPPH/PpA4jAoF92uFFTAlo3qg+ftaaV28Ri5Hq49P/D+
         X41RZtsYodfr/mdzLyRBaehLltT4ix5U4QnopuYvg/IMJxYL9RUqrVKughosvPOgfm7k
         EL7YVVtqyZN/32T2TllFvfQXexebOq1lZxhSyYDeRY5Qh9AzLdQfJE9XbZDGnnO6Bq74
         E+p7sfznB+3fI3CYVjl7hvMfT02SqB07Yef1RJktt+z+glCURP4f/S2Vr+QIufdbTcVN
         3i8jKokyqMGjXZU8JGEQ/EJekSmwIwOcALA7MZHfYYAl/CXyf5UXrVE//ks8QmIc4CfU
         YYig==
X-Forwarded-Encrypted: i=1; AJvYcCXUmElskEAEaDMY96rT3we8kw7KW/HDjgKfpwp9ZaBqPi2tubWvDj1SxCCO24V7v3tpuHAt9redqTkp7A8=@vger.kernel.org
X-Gm-Message-State: AOJu0YylsExaj7GP6NMCgvRydNgtg/xBH0EfsgOqMu8IXB0anuGHclbl
	u+DAxAiWmRVVuG5U82bNhBMajHqarTzRgsrLiei41aRrBaz1mEVk
X-Gm-Gg: ASbGncvgPfWfaGW+10XPJ8Y8nteyRBmDTLW5fCm0+DGAsKdFSro0riVX2lgj3iCzBS5
	RGFV2xNv6mE+YogIY3WxeBBn1GklCDZs983ofZmGwzXm422nC2/GB9zWA7w+bwuWbMtq1seNuBr
	RM9kEKx/5tUY8+b70OMFSeU2A0wdP/f1Y2eNHkPrT5yvQ4wXae7P+4pzpZM8R9WRc1xSac6KALV
	MHXIPS3AC+xXbuSM0ICEAVvVbCNTnTQlPCtYHONDtPXvDyiHkxC2Kr3DYQc/so7vbVFo79nenbx
	wEto6X86t4vTu/QRmK6xuuORdOlUzRd6H7yJ+YixOnh5cmhvhu9KN9UgynMkIHNs6rBeJzceC4g
	SOg==
X-Google-Smtp-Source: AGHT+IE0+XTb679NRDlwHvBKShIbNYwOqIHu3Kb2Ud4uaIbrPaynJg2DfA762m7J7fFxbGsQC+M3Yw==
X-Received: by 2002:a05:6e02:4401:20b0:3d6:d838:8ba9 with SMTP id e9e14a558f8ab-3d6d8389342mr21563885ab.1.1743615759159;
        Wed, 02 Apr 2025 10:42:39 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:38 -0700 (PDT)
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
Subject: [PATCH v3 25/54] selftests-dyndbg: add test_mod_submod
Date: Wed,  2 Apr 2025 11:41:27 -0600
Message-ID: <20250402174156.1246171-26-jim.cromie@gmail.com>
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

This new test-fn runs 3 module/submodule modprobe scenarios, variously
using both the generic dyndbg=<queries> modprobe arg, and the
test-module's classmap-params to manipulate the test-mod*'s pr_debugs.
In all cases, the current flag-settings are counted and tested vs
expectations.

The 3rd scenario recapitulates the DRM_USE_DYNAMIC_DEBUG=y failure.

1. 2 modprobes (super then sub), with separate dyndbg=class-settings
   check module specific flag settings

2. modprobe submod, supermod is auto-loaded
   set supermod class-params
   check expected enablements in super & submod

3. modprobe super, with param=setting (like drm.debug=0x1ef)
   modprobe submod
   validate submod's class'd pr_debugs get properly enabled

The test uses multi-queries, with both commas and percents (to avoid
spaces and quoting).  This is the main reason the test wasn't earlier
in the patchset, closer to the classmap patches its validating.

With some tedium, the tests could be refactored to split out early
tests which avoid multi-cmds, and test only the class-params.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
r3 - skip test if LACK_TMOD

older
  drop -v used in test_mod_submod(). V=1 does it for whole test
  ifrmmod at test end (Lukasz)

test-mod-tmod
---
 .../dynamic_debug/dyndbg_selftest.sh          | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
index 513f6cb1db1d..09937dca3056 100755
--- a/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
+++ b/tools/testing/selftests/dynamic_debug/dyndbg_selftest.sh
@@ -279,10 +279,83 @@ function test_percent_splitting {
     ifrmmod test_dynamic_debug
 }
 
+function test_mod_submod {
+    echo -e "${GREEN}# TEST_MOD_SUBMOD ${NC}"
+    if [ $LACK_TMOD -eq 1 ]; then
+	echo "SKIP - test requires test-dynamic-debug.ko"
+	return
+    fi
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    ddcmd =_
+
+    # modprobe with class enablements
+    modprobe test_dynamic_debug \
+	dyndbg=class,D2_CORE,+pf%class,D2_KMS,+pt%class,D2_ATOMIC,+pm
+
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    modprobe test_dynamic_debug_submod
+    check_match_ct test_dynamic_debug_submod 23 -r
+    check_match_ct '\[test_dynamic_debug\]' 23 -r
+    check_match_ct test_dynamic_debug 46 -r
+
+    # no enablements propagate here
+    check_match_ct =pf 1
+    check_match_ct =pt 1
+    check_match_ct =pm 1
+
+    # change classes again, this time submod too
+    ddcmd class,D2_CORE,+mf%class,D2_KMS,+lt%class,D2_ATOMIC,+ml "# add some prefixes"
+    check_match_ct =pmf 1
+    check_match_ct =plt 1
+    check_match_ct =pml 1
+    #  submod changed too
+    check_match_ct =mf 1
+    check_match_ct =lt 1
+    check_match_ct =ml 1
+
+    # now work the classmap-params
+    # fresh start, to clear all above flags (test-fn limits)
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    modprobe test_dynamic_debug_submod # get supermod too
+
+    echo 1 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 4 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( V1-3 + D2_CORE )
+    check_match_ct =p 8
+    echo 3 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_CORE, D2_DRIVER )
+    check_match_ct =p 4
+    echo 0x16 > /sys/module/test_dynamic_debug/parameters/p_disjoint_bits
+    echo 0 > /sys/module/test_dynamic_debug/parameters/p_level_num
+    # 2 mods * ( D2_DRIVER, D2_KMS, D2_ATOMIC )
+    check_match_ct =p 6
+
+    # recap DRM_USE_DYNAMIC_DEBUG regression
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+    # set super-mod params
+    modprobe test_dynamic_debug p_disjoint_bits=0x16 p_level_num=5
+    check_match_ct =p 7
+    modprobe test_dynamic_debug_submod
+    # see them picked up by submod
+    check_match_ct =p 14
+    ifrmmod test_dynamic_debug_submod
+    ifrmmod test_dynamic_debug
+}
+
 tests_list=(
     basic_tests
+    # these require test_dynamic_debug*.ko
     comma_terminator_tests
     test_percent_splitting
+    test_mod_submod
 )
 
 # Run tests
-- 
2.49.0

