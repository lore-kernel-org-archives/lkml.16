Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37FE21B9E5
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750628024; cv=none; b=VQn6rACVCaBFCvitp5Zc8r8SP/axceJ3H9/BwtPbsHogMuGaHfFCmEOEy9cCvWAGy4nM0up5bpG7mzLHMUnxoI0TpAxIAIh9MmyzRj5a8DAom8pZGC6AptxSKStao+yFIw1Bde6bWoFIcMjWKDd/szSgB1EibnbHlbOrueT3Eqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750628024; c=relaxed/simple;
	bh=kvY4llqgRsxBvMcZ/CXo6FHDMPIg9Hmu3RD2Lrj2HZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Elp/G9vXs7hK89cUf83/zyN3/CfIA+1WrN/HuonGp4gViLMCQ2jfdOF09up1njA6zhlTu3epAA7o3KKKxXs0jcq4pekurmIqpZqP2tMMsp2WTADrjOc63V8YJOl7/CUM7xAnN+M7CUE1cViC0eljpTNjvv1RTeQ4+S0gJTk0VV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEFy63Ox; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEFy63Ox"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2360ff7ac1bso23572925ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 14:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750628022; x=1751232822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfaLR+xtvYbSj0Yj5pLhRxT8PrYzixVb/sw/K5Eb4uM=;
        b=NEFy63Ox7cJimbNq08CkoIAWsWlLyYxxmlgx1BP/kbwV24ZownW8YdXy2Lqcm6itgH
         hiMQkLmegJ7LGwH4p+Myj3xoqYXZTE5rJ7v+cCgL1jvEYV//wzZ72dhGwHx5EfkzAd64
         4Z7mBC1qJcO7TtTNcUO1EY70Fih25P9qKTL5aEur0dlUlYi2FHU8rldGqK3LfMqcrQek
         6p7rPHwbAjAfMt0Be3NZvRuGw3aGegpcerFsSDGdY1HLTiKJB7viuY6Nx1AFgWPHRQ6O
         8ps4eipGckoO+fgrnsSZoTktyGS9Vjj2umK123nYo4GpqpcH84+g1E58j3EWf+xHCEFo
         eC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750628022; x=1751232822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfaLR+xtvYbSj0Yj5pLhRxT8PrYzixVb/sw/K5Eb4uM=;
        b=d0rQcYpCkx5g6L82l0cnVNkTynZ02o5D51pYf5e3GPKeVxTCcvkaToGSjSPUjMD1Y3
         IgxFJbsCSx20xGVljI74bZqVM7WY6qZi7nB1jU496Eju9wIFQcbNW0nmReYO3fHFJswP
         6ymGn9etOT1uTwssriM0CX8nZJVb4twaAYXb2hn3m85rmvxk8QS2eq3pw+byb7dx8UEh
         GBwlK16HatJ6Y9L4PoJfj0cPsQZrnMPXm64yDq3pmQLpKLENcYgpTyL2zqFQNQz0F2Yw
         Aql/6QIfxgZddIrq/d7Mcf22tgUXa7WHuRgxpQ7oR99RXs/4cYGeDEL6+yH5Oo1wvGhx
         gxWA==
X-Forwarded-Encrypted: i=1; AJvYcCWd+9SSR/itT0le5mz+X8U81aTS2rkAfVtYCeLuaA4YeERducWSapW8b2OjnEHSIvqn3NC0doUrhn3B69Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkP89P7WmBC+DlwLhyXykPHxtLTymyOQAsc1qVcy3xylRqq5hV
	szQNDDocxxK+WtQEN05W0RcsYOrSQe2eMtTKmM9vkzpNXLhXkcoquV5o
X-Gm-Gg: ASbGnctNPpZsJFgXEHzu9x2x9GlynDgW7n4iGs1onerM0MVQPVIoH/Q8fFHlcHT6CtP
	66pcZBMgIEO6sxSh2es60oHccXR202fEFp7csmQggXcL+p7mEZbFcX5SERGMfa+EQUNtmCp2gI9
	3PSkuqt8QB0F3cYAMNwyNIXKRoSrxo7Al81hl+pjwLgUqFatjdKiQ5ZBOy0LIJ40Ouaoj0SResM
	x1+q8bxkcNXxsKLvUq0zUnARym0Yp0YiP7aDM+fGNh2yau1mmc6rZlFuX9x8D03295Rfn/zvEbT
	zUUT0rcvoUGwSRK16PLBqMUeUl+Il5HE6IIRBvWvkSrMcvzs/mtwd9triyo+HWc82ecZbJ758bc
	N+LWegIpj7sO9qCPzRYRf0bGI6l3s8VMS
X-Google-Smtp-Source: AGHT+IE2X/a6jjB1EnFZZyhowFHSJjm1zCMXjlA1XnMsjL3oMDjBlwH6AM3zKhRsmJ9nHB3vT4YZVg==
X-Received: by 2002:a17:902:e889:b0:235:f51f:c9e4 with SMTP id d9443c01a7336-237d980b75bmr163794955ad.12.1750628021956;
        Sun, 22 Jun 2025 14:33:41 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83cf981sm68073275ad.59.2025.06.22.14.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 14:33:41 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 5EFA2EF1EBA; Mon, 23 Jun 2025 06:33:38 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 11/13] um: change machine name for uname output
Date: Mon, 23 Jun 2025 06:33:09 +0900
Message-ID: <a0ad90a5ce95e8d34c6c5855cff701bdd51dea5a.1750594487.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750594487.git.thehajime@gmail.com>
References: <cover.1750594487.git.thehajime@gmail.com>
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

