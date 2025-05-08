Received: from mail-qv1-f74.google.com (mail-qv1-f74.google.com [209.85.219.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA64628851B
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746730018; cv=none; b=NXEJjoPkhnbP6+CX/bUK4Wdv+8yObowauOjsa7t75oGQkTetRej2/0rfx3dLaltRaRIBB45ksOdWmSjYBkcGoBe3xjYPln5ub/Ae7XQxVZM3iRw9av4pzwsnfTl00xnXKSO3pM6pnK3aS3gdjRU1stlsdmnEezNo0FtsQ2PoLMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746730018; c=relaxed/simple;
	bh=XxmjuqNyUSH40nAiJniXWQhl/jBhBznduv5cxq5yeKs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jZGG9+Dy1tqIWHeff44e7GK3j6BYXrNAFypRpj5nsbTdexb2S89PZVUuMnLerk5ajJl68uj67u9jGu5sALq5M2kRGt/xtYfNPNPZCWKWBZefro47lMksjq4hN/Ls4sJNDFx0lbEMM1T5TQ6JVXLIh8NZwF/phABnonR3/ujXjuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=axpBAd6j; arc=none smtp.client-ip=209.85.219.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="axpBAd6j"
Received: by mail-qv1-f74.google.com with SMTP id 6a1803df08f44-6f2b4ab462cso14514816d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746730015; x=1747334815; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uONc7WAgpVw3vuoHf0vvNHDupNr/S8j5Mtg90jyXV1Y=;
        b=axpBAd6jCM2ZSzMe6E2Ygn7EDSYK+zQ6TViyr7A9GuxcWttA5hYoXeDMh4ZfFx+phV
         v0hOUiEmDDtILH8HOViCQenUO60EoNY8PQRwZRviAyhEZIl7uMnlR8bTL/SAPgxXc5LG
         B6zCQNHIlFvmivpeP/Ikr2UeRfamCLqdc+WRPREI0rBHDIkYmzNSNyLe4oEYcfMzdPe0
         2r/smUugwpIJRnqokef15gGKBqHSjYh3vbO2nTsdkpdqguXH006kyNRmQkhtZCMFfV5G
         bNQkB0wSZgUUB+h+LQdNlzTXAMJ0/hSZr+ji2Eyp4EnrQzrb7HtMEga1HOh0KQqLVBYf
         iamg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746730015; x=1747334815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uONc7WAgpVw3vuoHf0vvNHDupNr/S8j5Mtg90jyXV1Y=;
        b=jOnmQBU8MaFAPkT4wx4By/HfZ9NmIwLE2YAHxAdjbv2EaIBDcINZsL3Od7JUhovCts
         NTgsBcofZMTSCa9e9P6nKAzu4w0LLDFViseuBKHl9nNn0T/ansn4PFA7y0OF89QjfLdn
         k8mWyV3jjfzsQx4l0c74oDiTyCLA6wReX2U+rbS54RydizSw23Gu0DP7z+zVbPVs8H8r
         cE7/2JUzVpIHyDDz4RoCng+/LgF3lYztFWsYoZMq/kQjypNWmZ7pqCtpgfr5BSTt5jgP
         2MsAYf8lCfjQ1A4AxqzF9mkN7CjjS/Cx9XDCw9D2YaT6UsqyLzc11ptjONSzmZ3tKRzw
         MMUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvRbNz4/0zGwU7N/x6EnVBXvankS7Ryi82ZVBaxFqa5oMqgR9i1sl/DK4jOPSZsdFF78YTumaKlOCwRQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxV8QLYXZ+yVL4F2BkgLvCLe9i9csLm16uyPFHiY0Qsi4gC1GK
	hvAQ0zwr/QDp9XJvb0gl3jolIhOeWlWuD4WN8X2qTIwsTDg2J15l7nZVM/PAclnG7CgMfckP5xC
	z1pY2x0XpAu7XrXt32A==
X-Google-Smtp-Source: AGHT+IHCSF3WPWtWHvI8KIBlSC7FdHqt0IH8/ghvMwVjrKFTrdvoF62AI1U/UII2RXUtP23ELsj30SazWDnfhkbF
X-Received: from qvblr6.prod.google.com ([2002:a05:6214:5bc6:b0:6f2:b7f7:aeaf])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:ad4:45ac:0:b0:6f5:3f55:343c with SMTP id 6a1803df08f44-6f6e480e25bmr4365056d6.32.1746730015502;
 Thu, 08 May 2025 11:46:55 -0700 (PDT)
Date: Thu,  8 May 2025 18:46:47 +0000
In-Reply-To: <20250508184649.2576210-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250508184649.2576210-1-jthoughton@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250508184649.2576210-7-jthoughton@google.com>
Subject: [PATCH v4 6/7] KVM: selftests: Build and link selftests/cgroup/lib
 into KVM selftests
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Yu Zhao <yuzhao@google.com>, 
	David Matlack <dmatlack@google.com>, James Houghton <jthoughton@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

libcgroup.o is built separately from KVM selftests and cgroup selftests,
so different compiler flags used by the different selftests will not
conflict with each other.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index f62b0a5aba35a..bea746878bcaa 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -204,6 +204,7 @@ OVERRIDE_TARGETS = 1
 # importantly defines, i.e. overwrites, $(CC) (unless `make -e` or `make CC=`,
 # which causes the environment variable to override the makefile).
 include ../lib.mk
+include ../cgroup/lib/libcgroup.mk
 
 INSTALL_HDR_PATH = $(top_srcdir)/usr
 LINUX_HDR_PATH = $(INSTALL_HDR_PATH)/include/
@@ -257,7 +258,7 @@ LIBKVM_S := $(filter %.S,$(LIBKVM))
 LIBKVM_C_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_C))
 LIBKVM_S_OBJ := $(patsubst %.S, $(OUTPUT)/%.o, $(LIBKVM_S))
 LIBKVM_STRING_OBJ := $(patsubst %.c, $(OUTPUT)/%.o, $(LIBKVM_STRING))
-LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ)
+LIBKVM_OBJS = $(LIBKVM_C_OBJ) $(LIBKVM_S_OBJ) $(LIBKVM_STRING_OBJ) $(LIBCGROUP_O)
 SPLIT_TEST_GEN_PROGS := $(patsubst %, $(OUTPUT)/%, $(SPLIT_TESTS))
 SPLIT_TEST_GEN_OBJ := $(patsubst %, $(OUTPUT)/$(ARCH)/%.o, $(SPLIT_TESTS))
 
-- 
2.49.0.1015.ga840276032-goog

