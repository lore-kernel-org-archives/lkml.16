Received: from mail-ua1-f74.google.com (mail-ua1-f74.google.com [209.85.222.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066131CEAB2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744661382; cv=none; b=nm/Ek1mDIaSJFX7KjoAGwP3a/NhspT+vaR8iMEUCzfhApbK57J2mx95T789OQBNM/LhcS/MCbvVxA9dmzzDkJ8HW1o4k9XzKxcKok/rXvX7uxbqCyEgjmVm1e439KbZhHBeVApx7s0OsenePCSefDLDr1+oul+jGFtUt6TS8lW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744661382; c=relaxed/simple;
	bh=x6q1xZ3yBUeYcvd83AJGvAMjSYwBLFzBm1ig+KWei+E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sN7HEMOfS3u7gdVVllhZHOn7LHi3SE/TzzihwU1Lp99M7vKV7FUUKlE1tuSw645bWBSMR5RJnZ+uLsgy19HvSO9QdfX2sxEky8QrEVortNI4PiNJtjat9GNvsUZmqpV0XzvWh2oEjyX/M6f2o9Gr/gusOMykwwc1SWB+b4JHt6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CN+Adv6X; arc=none smtp.client-ip=209.85.222.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CN+Adv6X"
Received: by mail-ua1-f74.google.com with SMTP id a1e0cc1a2514c-87003ab0511so885909241.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744661378; x=1745266178; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yShiSNlbRrsjewo8erMpkmzkSvjH2QZkd/vX1jbbzhI=;
        b=CN+Adv6X0n7ch09DqGrGklfsFTNcD6Rw9lFX6mr5zfSmoYKiQz85MDhD9s4uW+MEFh
         pLHhcDqh5ZIyBxyN1aB6bR5Rgnb3bL3vQBwkaguURaEFwYPdFunoLeUOo4maAx/Z8Txk
         YlFMsnM9NdwB/zyna+77mMA+Z/obH1f0f1JxgiWVldvrBNWJWwvoiwhuIQ1TrHIBPhiD
         YuY2P7voLpKW/7WF3WyhNN8QQHFYi1zyBNpXDa8LNpOA1UigS8TIquvbyyjB1jpegzqg
         yh1Q0B4DX5ZQovivLouDWNpusZz1Th/h2IhhYVv2l9Pny+V5/cIjXEjqF07Zgunueshu
         hcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744661378; x=1745266178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yShiSNlbRrsjewo8erMpkmzkSvjH2QZkd/vX1jbbzhI=;
        b=k09S2iUpVBwt03TW47BeBkRPAYjwfSvxv8AQs8ApV4DqWEXdH5dpfvLfkgT9c3vpg1
         jhKcML7gG+QEsmKkKIj98g+Ixi+iLRLZ2R6Tqr6jcj26nNjsPeGB6Q7LKQZUJ0fx9Eek
         Z53H/c/3bsFYaVDUqZiBRf/kUs+0cagb/khHJ6U6x0olOWs04lY2ADBo6wOX6K/vSaAH
         NrZyS2uzJ4JNdEPmKPuPRMtEmXsKSg8nETRXD4Ibe19fFSmb2AeDoA5OHOGhD7YFY1jQ
         +78Si6mWL4MQISD4o8xaVVvqg7DiPYVGF6ze6M7/8MpMJAnJGTnBEVvRDyFZRZ+uw80E
         fYFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnLNe8kkDLH5ikRfjMITBPS7fMPGbsUE5hwD/tp54j+GLdel8cY10Xh3s1g+PlQ467WgsH6mhIMYVsnRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYED6OIFGuk9iOkAir2dsOF6eedO4L0cUgkj1DkOtnfnXt+fM
	Nm8epWiWZ1MZr2octAjrXTq+yGsitcEDFsbnyXKdrsXwHYeCekkyIhiVpe7qoAd0W+T5IjKmpZe
	ROlBWf0tus3UmSzLjvQ==
X-Google-Smtp-Source: AGHT+IFWx4KpMIbxFpAwRHbcSPjOf45XcTuJLvHUktQ+xHXKdwuwHIuf1RL64vv5UDAQCwn8mu36HAZXiw5xxVhZ
X-Received: from vsbia12.prod.google.com ([2002:a05:6102:4b0c:b0:4c1:8cb2:18cb])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:5247:b0:4bb:eb4a:f9f2 with SMTP id ada2fe7eead31-4c9e4eec0damr9244631137.9.1744661377900;
 Mon, 14 Apr 2025 13:09:37 -0700 (PDT)
Date: Mon, 14 Apr 2025 20:09:28 +0000
In-Reply-To: <20250414200929.3098202-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414200929.3098202-1-jthoughton@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414200929.3098202-5-jthoughton@google.com>
Subject: [PATCH v3 4/5] KVM: selftests: Build and link selftests/cgroup/lib
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
2.49.0.604.gff1f9ca942-goog

