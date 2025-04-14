Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF912F42
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744618494; cv=none; b=tuNFIopv5mAxuh47B3F1Cq+E3465lzurFxDccJtU1O2T5ryFvVYtW/1PdioGAgvcP2QAI/pNBAvHFrQBOHLTnccXd5DTRv2+PRySpavhC+6JpCYMeF3LaXQ1n6SgdZ5Y3Xccjp+55OmqwQPN7u+NQR8s6x1pMTAF4Q8/uxDge2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744618494; c=relaxed/simple;
	bh=WTY2xF73491jcWi+pbUfD84Ujuuk6avE3RsdFENBEbI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hyc8YIW/mKbp0e4lPnGeGVaNvSNrT95thrr3ACVjyRkYgR5zT2KZDXJXHwvINy6o9B0dfGc8nTJ61ntZPC+bkCcRN3MvoAeKZ+BGmSMpKegGA0DZ8JF8E0ULwDewvypjqTZmi86BeenN+A8B+/gjY7A5EpLYkkNORjT4+DKHoGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIkBZX7X; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIkBZX7X"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-301d6cbbd5bso4139905a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 01:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744618492; x=1745223292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dE9VD9RD6koBoFk7wXCP6jGtY5EgBLVP2+HcE47KE3Q=;
        b=LIkBZX7Xv02wtc58kCU5PUul5KNF6uk4KL2VCO5sBmoTrzwgo2JcWVUGpxw8W73RLw
         eK0SSxRdc5J2BtP9IOq/ClXpxXGLmObeZPuvvZW25NTueIrRfTiPNZc7Z6AJ1B9/Aq9c
         MlkBcAAHc7SfY9hwEz7kMr5OMCyaf4ydsF/ed4yejiWDXkJj8JT6gud31eNGBd8KJkSp
         Mw9DiXEeS9jP2lUYd8E9y3AtSZ56hw4HSkrm/TT1rwZFMmgpbIGwVLven3wBWCPoRBzQ
         d6IxiyIZ0AJdD+Inw1GIT27zmxoPAF2v40zs19G7p7fIllDlRGwJZW8D0VJj0Be8stmV
         8YEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744618492; x=1745223292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dE9VD9RD6koBoFk7wXCP6jGtY5EgBLVP2+HcE47KE3Q=;
        b=V6DhilDCSmiKhNQToWAz4IUBG25zHzBFzOmklfYbhZRGNZm//pR85t5Bcv8LOQh79x
         SeaJi3bzEQxIJN2781uYx+h5NdJIvYefaJW4PKnjEbs+ACKlyAB1XZUzf1ZUlmdAQA5a
         +vH9t8xuV8RL2VJP98iqiEcGobhWqL9ZRwHEpUFKiu6mswEenTBDySg4mehT/hjLXUd0
         K8V2FuNmSK2caU2uiObGwvOq6d/8buI2muWl6iVNLwvH6Z3r4+mswaHC1AbAfR5uasQh
         YMfE3hgd5genfgGf50r7oFbALKtL1cit8BDqpGpvCOfVPbiFI2CNdG5wjJrAKW/5JOzd
         oncQ==
X-Gm-Message-State: AOJu0YwBbPXYY1ZeZTzJ1UxaFTj7UlvwZJIPdtsHcjB8daAdMhL86/zu
	0mv+vd8H/0vz2GPsOhr+HYqoFhoIn6J9Rb5O0h7Zg0P6owuviuLG
X-Gm-Gg: ASbGncvrdnK4YyeyFzTmSrkgeYihK4DYpHlzZ7w4RnDlaib1+uzN4TRESlCN/5uLSbZ
	BnDv3134JGv+elq6dEjESRTo/o7HjMmGcGoPMiNDOqsCXNWu8eITDtL+q12Qgcir5Esjg0qjofL
	yXiLRYrvTewI7pps0h+3vYGiTsJV/7cFvDdaQCkV8olAiFqaTXS8KAsKKYM1W/NH1xmryG1KipU
	k2cXtmedjEJTpRSVJdR6I0BLEIBJrYaPOTKERI17WYILlj7kQabiY/BW0wmt9ZY6ovVXs8nG3Xc
	jjSC0VJdYg0mXUesRFItubVkSZYkKffgXST27yL+ziHm9wFFT///+b5H7uGCGnaz41ps650=
X-Google-Smtp-Source: AGHT+IHZNL64bNtM1Gh4EgtOoA5Fj3JGdos+e7ftA8O6slt5XbT8WRDUX3EjS3Tn8E5q4eVggoZQOA==
X-Received: by 2002:a17:90b:5206:b0:305:2d27:7ca7 with SMTP id 98e67ed59e1d1-308236523femr19745567a91.16.1744618491844;
        Mon, 14 Apr 2025 01:14:51 -0700 (PDT)
Received: from PC-YLX47FB9.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd1717cesm10731825a91.31.2025.04.14.01.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 01:14:51 -0700 (PDT)
From: yangsonghua <jluyangsonghua@gmail.com>
X-Google-Original-From: yangsonghua <yangsonghua@lixiang.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com,
	changwoo@igalia.com
Cc: linux-kernel@vger.kernel.org,
	sched-ext@meta.com,
	yangsonghua <yangsonghua@lixiang.com>
Subject: [PATCH v1] sched_ext: Improve cross-compilation support in Makefile
Date: Mon, 14 Apr 2025 16:14:36 +0800
Message-Id: <20250414081436.2574882-1-yangsonghua@lixiang.com>
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

1. Fix host tools build directory structure by separating obj/ from output
   (HOST_BUILD_DIR now points to $(OBJ_DIR)/host/obj)
2. Properly propagate CROSS_COMPILE to libbpf sub-make invocation
3. Add missing $(HOST_BPFOBJ) build rule with proper host toolchain flags
   (ARCH=, CROSS_COMPILE=, explicit HOSTCC/HOSTLD)
4. Consistently quote $(HOSTCC) in bpftool build rule
5. Change LDFLAGS assignment to += to allow external extensions

The changes ensure proper cross-compilation behavior while maintaining
backward compatibility with native builds. Host tools are now correctly
built with the host toolchain while target binaries use the cross-toolchain.

Signed-off-by: yangsonghua <yangsonghua@lixiang.com>
---
 tools/sched_ext/Makefile | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/tools/sched_ext/Makefile b/tools/sched_ext/Makefile
index ca3815e572d8..d68780e2e03d 100644
--- a/tools/sched_ext/Makefile
+++ b/tools/sched_ext/Makefile
@@ -61,8 +61,8 @@ SCXOBJ_DIR := $(OBJ_DIR)/sched_ext
 BINDIR := $(OUTPUT_DIR)/bin
 BPFOBJ := $(BPFOBJ_DIR)/libbpf.a
 ifneq ($(CROSS_COMPILE),)
-HOST_BUILD_DIR		:= $(OBJ_DIR)/host
-HOST_OUTPUT_DIR	:= host-tools
+HOST_BUILD_DIR		:= $(OBJ_DIR)/host/obj
+HOST_OUTPUT_DIR	:= $(OBJ_DIR)/host
 HOST_INCLUDE_DIR	:= $(HOST_OUTPUT_DIR)/include
 else
 HOST_BUILD_DIR		:= $(OBJ_DIR)
@@ -98,7 +98,7 @@ ifneq ($(LLVM),)
 CFLAGS += -Wno-unused-command-line-argument
 endif
 
-LDFLAGS = -lelf -lz -lpthread
+LDFLAGS += -lelf -lz -lpthread
 
 IS_LITTLE_ENDIAN = $(shell $(CC) -dM -E - </dev/null |				\
 			grep 'define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__')
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

