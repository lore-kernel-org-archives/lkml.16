Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B2E21B192
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295100; cv=none; b=f+FXP30inhJDHmAzka/ssY6qZ8+rWoDo9waSpTWShWdQSqMeBbYOZqwBrvlk1VbsOLuP0bdHHw9nozUofh858de6xic5kzoKt+q+cZzRI9JoO7efFOHrvFKe+n9dtxDh3CG9NOqKpe5ZOnWPZvQ48dH4+fpthHqAuZvH1+VBsJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295100; c=relaxed/simple;
	bh=kvY4llqgRsxBvMcZ/CXo6FHDMPIg9Hmu3RD2Lrj2HZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhEdYjGd6WK26EIwmvDuet4Z29H+gEufjkIeo4Epysu7PRVidRmwgm6B2jqMeHyr7nt+dYxwPb0ATeu49G+Eucb7VHRP1Jj4DfQKiDrUNe67wE8A6bjJ+9FHT70C5xFkhei575Ikrw5zQ9O/8Avz5vBcrbdsjpHTFn23Mk6awTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZ9u20cN; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZ9u20cN"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so178464b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750295098; x=1750899898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfaLR+xtvYbSj0Yj5pLhRxT8PrYzixVb/sw/K5Eb4uM=;
        b=XZ9u20cN6A0dv0EM2c/8SK+qXRJENpBDmzfqwutsnFM46RoQ2JLaP/TEOFexAvPJOW
         fnFR5dBC6CrCKkRRAfEKwSHeqfm66g6/Q1QHkvDSRVLJncUap4XGAhgAh19U2MEqM+Fg
         vGpFple86xE3GZV33O7TS4crtcFBteJsZSeVIgMYSChnuDRkHMngT33e05PFs+mURobQ
         DK40WhW488g3WsgEAz+ekhnzwBeLOKNCZo7jgAmsLelTcR/T9e2jQFZvxqzcw1/yzA/A
         8dyljQ9zGbqRLYhaWiVwx/aizs1GdwhVNB5W3c/gAaSAVJckrkXus4fkxd3ter8LSxvo
         N6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295098; x=1750899898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfaLR+xtvYbSj0Yj5pLhRxT8PrYzixVb/sw/K5Eb4uM=;
        b=vJ7iT+AFoM8XGaIVy6prlzZbeubw9jqrWtEcfTX9VPqwxfQxnSLLkDP0Cr6qGBW4M9
         bRpJaa9ecCWXNSDLDbNCQSFGei/s/OEV4O192GFC687+9BBcVaEIlwarTGjLl5m2FsVC
         43ZNyNxUpBEhQ96CF1XYcQMBes/Lz8CNThSy/ilA3BW8B4dwIw3S5se975dJm8cXGxJY
         gKw+QIj3xQ4TSlq00v1le6ln8AO12S5XTsC/VN7njZFDxTJBfMPSEKs03h6lGNm94XuT
         9A1jOWYD+z8/cX7GvuL207NdcncjirzV8XDNmjOUJcaCmCfl4OPTBFPelcWatAG6Gy2X
         O1pg==
X-Forwarded-Encrypted: i=1; AJvYcCWIzSSI5VXQ7yAUJTjE+3T83O8MRR41xF8fs1hOD/pX7Lbowd3ohi9FYHlYv0ksW/VhK3OPv1Xav/pnZYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhL4S3xBSQERvk2LtOEPITuOfOGzygnBzk8KL6WsejvpOYa8lM
	HjrwfQ1ppBMxQyfVRtVJsq+DAgN7ext/gO7gPfjm9wNo9OHBREpuhabd
X-Gm-Gg: ASbGnctFCrp2inUgwaKAaA/P6k9WwT7/xNhJEIeTS+hEJ2QPnZ/BuuMA2GPqOt4DI7h
	nDqlGrZXOb8tv1nyWwMoVAZYPXbo0pMA8l63+9vCBsOGi9WyW870mpXBq+bV3eWn8kcao+TJI5i
	Aj9H+wZIyGQWYTXGVICPFsEYu9AjFi/DREVhkTUHceuSFTUDO84862qttKQI/8Y12dxsu50OhjF
	Td5ys2iBv+dq8kVY3fdTKxKW3G5g1eQxPVsibsUSKdOwNkndyVPNJ7YuoWSK0iFbqHCmtS75b4Q
	/KqSXzBnC6Axuxu1oMxKE0G7oJIITvCkCbKOJ92nJMX+40rSx9Jbk1iyP39+9xMMTIPP8EPDctB
	gOhbtduoO5wng0+ewCjm52AiM2mG1ClWdj7x+rQU2oV4=
X-Google-Smtp-Source: AGHT+IEV6Y3cJLP4JaMcdJhSY/ETlnIE+14RVCjfX1yXRvBEOpmZSlGpLo0DZSp8M2QLOOjfCnAESw==
X-Received: by 2002:a05:6a20:72a5:b0:215:d1dd:df4c with SMTP id adf61e73a8af0-220111ad18emr2803824637.6.1750295097772;
        Wed, 18 Jun 2025 18:04:57 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d233asm11870453b3a.159.2025.06.18.18.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:04:57 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id D9ED2ED653E; Thu, 19 Jun 2025 10:04:55 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 11/13] um: change machine name for uname output
Date: Thu, 19 Jun 2025 10:04:15 +0900
Message-ID: <b580c35c6a52f009d863a1fe29bd7b089283b994.1750294482.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750294482.git.thehajime@gmail.com>
References: <cover.1750294482.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit tries to display MMU/!MMU mode from the output of uname(2)
so that users can distinguish which mode of UML is running right now.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
---
 arch/um/Makefile        | 6 ++++++
 arch/um/os-Linux/util.c | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/um/Makefile b/arch/um/Makefile
index 5371c9a1b11e..9bc8fc149514 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -153,6 +153,12 @@ export CFLAGS_vmlinux := $(LINK-y) $(LINK_WRAPS) $(LD_FLAGS_CMDLINE) $(CC_FLAGS_
 CLEAN_FILES += linux x.i gmon.out
 MRPROPER_FILES += $(HOST_DIR)/include/generated
 
+ifeq ($(CONFIG_MMU),y)
+UTS_MACHINE := "um"
+else
+UTS_MACHINE := "um\(nommu\)"
+endif
+
 archclean:
 	@find . \( -name '*.bb' -o -name '*.bbg' -o -name '*.da' \
 		-o -name '*.gcov' \) -type f -print | xargs rm -f
diff --git a/arch/um/os-Linux/util.c b/arch/um/os-Linux/util.c
index 4193e04d7e4a..20421e9f0f77 100644
--- a/arch/um/os-Linux/util.c
+++ b/arch/um/os-Linux/util.c
@@ -65,7 +65,8 @@ void setup_machinename(char *machine_out)
 	}
 # endif
 #endif
-	strcpy(machine_out, host.machine);
+	strcat(machine_out, "/");
+	strcat(machine_out, host.machine);
 }
 
 void setup_hostinfo(char *buf, int len)
-- 
2.43.0

