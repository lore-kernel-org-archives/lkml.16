Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9031E5B70
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744696019; cv=none; b=OSgrPn2xtRN+d4otOHM29Ru/TFhALk9dnT+JRioVp1bQlYNCuNwQqctzDDOIXDX0XXtf96lpTQ+XuP18mo5i+scnQKaNP++7BkxOxkJy6nbpuLU4OXPcHrS0vFpHfh0qLnNllk3lgswh3f9YyHasZXGPHRkyQNFyJIwHOp+qW4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744696019; c=relaxed/simple;
	bh=CuimUCxABVpqq10GHMJ0bxV0GGCA4zQouC4cjyd/m/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oMjlbajE3qYAD3d8jfvrOvkCVB5qd2pYwZB5Wcj0MTz3syn+OeyCpHXYe/u7+XltbKyrwSoJBglRyn0Bt813SRc/d7wFGGdPGcsYV1Ncaj4SSXTHIsqUROpkakSAqppL5AeGoOW56r91MbHby2DN2hAM6/ZGFRvrJhmwxKEbOK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WefWCqlF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WefWCqlF"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so5770333a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 22:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744696017; x=1745300817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k4cZxTtVMJDaaa7hDwJgmoHujDnPmGdlQIS/4rZGmLk=;
        b=WefWCqlFFq+k/DuWKwNrnTGobHyrIhemm7WBxA3vl8Vlnx/Tv7AB4dcdL74LAl+oRS
         1G1lpEI4myUcxQIJ7PRpXE5TDBjgqLl3DO4rTtfkzztWdDMtEEutW17nS95yAKvBYLZz
         5tbXxN8/Y2nc3vID2grZRZK9djr4rhWWN7926p6Gr1t13XnsWVuel+dNF10elkNDgxin
         5nMK5YCNej1202zQgp0vril6yZ5PyEJl4QVcIDTzqZ4LrYz6tQBhfb9PeklKVKi7ZyF3
         gMeJXcFNxtUEF+9xDYMdT3CGDtlMSXQn4a1p/axzCt3+1pji0SMpTUaafcJ7zySCCU6V
         g+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744696017; x=1745300817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4cZxTtVMJDaaa7hDwJgmoHujDnPmGdlQIS/4rZGmLk=;
        b=cy74grY4V42FPgb5dMoyp2kAfWWU3gj81T+Xq0LJcE6b6bq5OyNT+mWXKarJR4WHVL
         w3AUFM2nfPhQIZDGtAor2GMe96VzZ/hwOuRr8RlKFUheUHI864tJXRVMrHmPLSi2DRnl
         iuE7abH+3DP1ip7OJ3x14i50DtlLp5YxuUB20DEaPj4KfS6b4bQlq21mzTQqiD9xs//1
         asoUoHNtUZhA1UfMlXqdDDsePL71MomlDkePHQ/g1GHV7zzsb3hXQ/sRINld1cjFTV1R
         LtOGXDdZ944AZWSfxDrIeWKriDTJ5RL86qlngxQeBxVtZ50eHlRImqqwRJUTGJMBqolS
         UF4g==
X-Gm-Message-State: AOJu0YxL1pll6d4x2AByzR50BMX0D6jm/VsNne8BRrhtt+lD2N+bnGlI
	xJbAOClz+606bNBQc2IEGe2Pl4AyGTa+K/wGhiPnvim4tdjMVLCY
X-Gm-Gg: ASbGncsyrURDEbmzRwE779mH/m91QXn8MGCeayPWKNOY2Z+Ms7+JjP8TL0zTnw1AA5J
	3cthb9eKBXenWy8+1pHO/XT+Yv3JB9jB7WyJMZ7NVcXKLzbS2ZeKU6FXeHCAbn+9bMdZbUZySJz
	ZBdWwxw08z7xZhSL3oP5xs+wZWJxSHqkUQLiOjFhTR7A2VjKy1oss32H/vqwiJLg9n9TeFZewbZ
	hOoyRIONBrBYwZGml+rkcBq6PlvbXdzp5Rlkox4sYFbqwWZ7LmIeiQUe4a+qAtWquNIbyp499C7
	916dR9pLVH/fR77H4hwOk1YU1ikH21OsW+42VMi2zMV107BS4jcookhWubfaKXCg6GUE4VBLjJQ
	=
X-Google-Smtp-Source: AGHT+IF7s2hYBEEX/opgVv7QoPu8Lk1EsNQ/k37JSlTMw64+HMx36CxdT602jm30YOrpkzyAK6ryUg==
X-Received: by 2002:a17:90b:5210:b0:2fa:3b6b:3370 with SMTP id 98e67ed59e1d1-3084f3d3391mr2689675a91.16.1744696016765;
        Mon, 14 Apr 2025 22:46:56 -0700 (PDT)
Received: from PC-YLX47FB9.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b9042dsm109219185ad.104.2025.04.14.22.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:46:56 -0700 (PDT)
From: yangsonghua <jluyangsonghua@gmail.com>
X-Google-Original-From: yangsonghua <yangsonghua@lixiang.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	yangsonghua <yangsonghua@lixiang.com>
Subject: [PATCH v2] tools/sched_ext: Improve cross-compilation support in Makefile
Date: Tue, 15 Apr 2025 13:46:42 +0800
Message-Id: <20250415054642.3878839-1-yangsonghua@lixiang.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the tools/sched_ext/Makefile to better handle cross-compilation
environments by:

1. Adjusted `HOST_OUTPUT_DIR` to be relative to `$(OBJ_DIR)`, ensuring
   correct path handling during host tool building when cross-compile
   (HOST_OUTPUT_DIR now points to $(OBJ_DIR)/host-tools)
2. Properly propagate CROSS_COMPILE to libbpf sub-make invocation
3. Add missing $(HOST_BPFOBJ) build rule with proper host toolchain flags
   (ARCH=, CROSS_COMPILE=, explicit HOSTCC/HOSTLD)
4. Consistently quote $(HOSTCC) in bpftool build rule

The changes ensure proper cross-compilation behavior while maintaining
backward compatibility with native builds. Host tools are now correctly
built with the host toolchain while target binaries use the cross-toolchain.

Signed-off-by: yangsonghua <yangsonghua@lixiang.com>

------
v2:
  - keep HOST_BUILD_DIR and LDFLAGS unchanged
  - change the title prefix "sched_ext" to "tools/sched_ext"

v1:
  - https://lore.kernel.org/lkml/20250414081436.2574882-1-yangsonghua@lixiang.com/
---
 tools/sched_ext/Makefile | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tools/sched_ext/Makefile b/tools/sched_ext/Makefile
index ca3815e572d8..eb85f3762a1f 100644
--- a/tools/sched_ext/Makefile
+++ b/tools/sched_ext/Makefile
@@ -62,7 +62,7 @@ BINDIR := $(OUTPUT_DIR)/bin
 BPFOBJ := $(BPFOBJ_DIR)/libbpf.a
 ifneq ($(CROSS_COMPILE),)
 HOST_BUILD_DIR		:= $(OBJ_DIR)/host
-HOST_OUTPUT_DIR	:= host-tools
+HOST_OUTPUT_DIR	:= $(OBJ_DIR)/host-tools
 HOST_INCLUDE_DIR	:= $(HOST_OUTPUT_DIR)/include
 else
 HOST_BUILD_DIR		:= $(OBJ_DIR)
@@ -136,14 +136,25 @@ $(MAKE_DIRS):
 $(BPFOBJ): $(wildcard $(BPFDIR)/*.[ch] $(BPFDIR)/Makefile)			\
 	   $(APIDIR)/linux/bpf.h						\
 	   | $(OBJ_DIR)/libbpf
-	$(Q)$(MAKE) $(submake_extras) -C $(BPFDIR) OUTPUT=$(OBJ_DIR)/libbpf/	\
+	$(Q)$(MAKE) $(submake_extras) CROSS_COMPILE=$(CROSS_COMPILE) 		\
+		    -C $(BPFDIR) OUTPUT=$(OBJ_DIR)/libbpf/			\
 		    EXTRA_CFLAGS='-g -O0 -fPIC'					\
+		    LDFLAGS="$(LDFLAGS)"					\
 		    DESTDIR=$(OUTPUT_DIR) prefix= all install_headers
 
+$(HOST_BPFOBJ): $(wildcard $(BPFDIR)/*.[ch] $(BPFDIR)/Makefile)		\
+	   $(APIDIR)/linux/bpf.h						\
+	   | $(HOST_BUILD_DIR)/libbpf
+	$(Q)$(MAKE) $(submake_extras) -C $(BPFDIR) 				\
+		    OUTPUT=$(HOST_BUILD_DIR)/libbpf/				\
+		    ARCH= CROSS_COMPILE= CC="$(HOSTCC)" LD=$(HOSTLD)		\
+		    EXTRA_CFLAGS='-g -O0 -fPIC'					\
+		    DESTDIR=$(HOST_OUTPUT_DIR) prefix= all install_headers
+
 $(DEFAULT_BPFTOOL): $(wildcard $(BPFTOOLDIR)/*.[ch] $(BPFTOOLDIR)/Makefile)	\
 		    $(HOST_BPFOBJ) | $(HOST_BUILD_DIR)/bpftool
 	$(Q)$(MAKE) $(submake_extras)  -C $(BPFTOOLDIR)				\
-		    ARCH= CROSS_COMPILE= CC=$(HOSTCC) LD=$(HOSTLD)		\
+		    ARCH= CROSS_COMPILE= CC="$(HOSTCC)" LD=$(HOSTLD)		\
 		    EXTRA_CFLAGS='-g -O0'					\
 		    OUTPUT=$(HOST_BUILD_DIR)/bpftool/				\
 		    LIBBPF_OUTPUT=$(HOST_BUILD_DIR)/libbpf/			\
@@ -185,7 +196,7 @@ $(addprefix $(BINDIR)/,$(c-sched-targets)): \
 		$(SCX_COMMON_DEPS)
 	$(eval sched=$(notdir $@))
 	$(CC) $(CFLAGS) -c $(sched).c -o $(SCXOBJ_DIR)/$(sched).o
-	$(CC) -o $@ $(SCXOBJ_DIR)/$(sched).o $(HOST_BPFOBJ) $(LDFLAGS)
+	$(CC) -o $@ $(SCXOBJ_DIR)/$(sched).o $(BPFOBJ) $(LDFLAGS)
 
 $(c-sched-targets): %: $(BINDIR)/%
 
-- 
2.25.1

