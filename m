Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81056275844
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749142061; cv=none; b=jUnW5GFZb6kRu/3/rLV8PEy/Xm6qHG9u67bmgZFAtsJO1YQhgt/fjPAlK90YISaRoR1qBL9fCBZigno5sKdRvJiExSnCkKuLTt5PCOLpdaAHJ535DDZzreiZb5SrtRohbwL5QUdGrkFYskocVDvVZB3+ivd8PQpNWdUdUx4pxdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749142061; c=relaxed/simple;
	bh=NFnFBvpiJ3gORrm9GFBTxS5eaPH+tAYkMwH1uVNzF/8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=shiFpmstyCVJcs5bwaKZM+Ta4ul/OXxKNMOTr2VgnrXnQ8SJyCFuFtPLEwZ5Kqoys4HFk5BFT+8aewI3zT2NxZb+l5OwPbDpkND9ww2aaYkRHw5ygRIGfoeqLfkGfD7PFAFXGfW0cE7j4EY7Gc2B4WyiBIZe3bKQZhj3tVFN61w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilIh7FCJ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilIh7FCJ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6069d764980so4497015a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749142058; x=1749746858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BB+6bwu2SnyCNKu7AKO4xQjxYg/leDIZeTz7AqghLTs=;
        b=ilIh7FCJ15xScpHMH7Znkz/q79R9ErcQfmJm1qq2XSGCr+p/2cdfOouAL9X8kYOs6Z
         cBa5e3V49Zl6WctNeZ+Y+0eb0IEOR/o+2JUWeXgTCaKu3O7sbemDfjdlULhB9TFYyHWx
         b1QyfO8Ht+OLHXexCZvyxTMByu4cfcJycA/m5v1M4u8l4f6CVrpeyGFLEMj5my2ehbX8
         RQvq5N05uG4Ibfd92Ku8tm45pce9dqo4wx5ogWmPnAQr03LE7ULM9TJ7b+xcsyei/kXQ
         r7slBK0kFKBq0hSgJDFZLKZLTd1NXRAJj3d+x1i+TsUvubpTXWiZ7QHxkn+c2NhosYdl
         PTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749142058; x=1749746858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BB+6bwu2SnyCNKu7AKO4xQjxYg/leDIZeTz7AqghLTs=;
        b=BFHfBY9BDyI96qdCcMSYtyVqK4akSowklxdU2vZufzCgKUPsRtJOhlD1jXTRsC22iu
         Fmt5BkCg8vXdbLi2DxI8J+S+UrPX7YrccDxtIqW33pgmYS9yhXV9PJjHxkODbUElda0L
         Y1Iq+KfzAIJkmM5SYImbFoXVe/AVob1hRZKWE2B0JIXfHkeFb5SslPCmvPO1te89o8Pq
         W4VO8npphaNaQuUoRgVYvzAI/Zeg8rWyvtb1zLhmphDaUSBZHZ05zwNBe7g4DDhv6EOl
         L6m881qtCS6CSdPMRix6WcRpexnxuV0HPiFdSJ7guXMsVb1cf+Mvw31A8GZo/WmSNLJ/
         QyKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZcWD6KHd1CSBU6KiCH4Vo6kR5Rid6Sz4mz9J+tziFrVct2Xdn17FgpCNagw9pzVu2eC30XClSoaiGLTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUMDw3IxS5CEjShxkXEB6OyGOROBqUT+pCsHeI2iEfJTg87zZl
	JBPDq+T0WFMEvnpaCd/l6tavgmLMmVq04AL6s7v9HlsAZRAow5dZ2raA
X-Gm-Gg: ASbGncswCuyjn8q/U+sEUNmBhWLi9jS0axN4Tqx2cYbnyGLHxoWFchVcbyTEmxUj464
	hO65Zq8i6MAM+7Cy6MkblaTcr2XJTQSUTc7xsJ1h07RVBnZibc+oo5YYDP3AEtBXl3ixK60G2JZ
	xQZt3lZj5IFDp+RdPcjLXgGllk6oNuQ7hFFv7c7eChaHQdQ5D44D2mNJ4QHSQr6cj41YLlyj5fJ
	bDWvGFjUxIac19UtcRhEs3JBJ9L/kOJO1Dh1Rzv16goREVMUpzVnkWv+ug8JuX3k3MZDrXd1Zo6
	rP54Ebplf9gIuvY+ueg/BcqIY0AeTrExhUD6C9n6RLHt6xMFRqbaMLbNpfTJxOX+hIF8fA==
X-Google-Smtp-Source: AGHT+IGg3BPO/7TOzNiwM6QXe7Anl/Xf7CTdvE8ARkLfMuhmyZ5xjijMrnSgKI2ogiMHvmy8U70x/Q==
X-Received: by 2002:a17:907:96a7:b0:ad5:2e15:2a7b with SMTP id a640c23a62f3a-ade075bc0f5mr434653466b.2.1749142057515;
        Thu, 05 Jun 2025 09:47:37 -0700 (PDT)
Received: from f.. (cst-prg-88-200.cust.vodafone.cz. [46.135.88.200])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e760sm1293971366b.52.2025.06.05.09.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 09:47:36 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: torvalds@linux-foundation.org
Cc: mingo@redhat.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v2] x86: prevent gcc from emitting rep movsq/stosq for inlined ops
Date: Thu,  5 Jun 2025 18:47:33 +0200
Message-ID: <20250605164733.737543-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gcc is over eager to use rep movsq/stosq (starts above 40 bytes), which
comes with a significant penalty on CPUs without the respective fast
short ops bits (FSRM/FSRS).

Another point is that even uarchs with FSRM don't necessarily have FSRS (Ice
Lake and Sapphire Rapids don't).

More importantly, rep movsq is not fast even if FSRM is present.

The issue got reported to upstream gcc, but no progress was made and it
looks like nothing will happen for the foreseeable future (see links
1-3).

In the meantime perf is left on the table, here is a sample result from
compilation of a hello world program in a loop (in compilations / s):

Sapphire Rapids:
before:	979
after:	997 (+1.8%)

AMD EPYC 9R14:
before:	808
after:	815 (+0.8%)

So this is very much visible outside of a microbenchmark setting.

This is very page fault heavy, which lands in sync_regs():
<+0>:     endbr64
<+4>:     mov    %gs:0x22ca5d4(%rip),%rax        # 0xffffffff8450f010 <cpu_current_top_of_stack>
<+12>:    mov    %rdi,%rsi
<+15>:    sub    $0xa8,%rax
<+21>:    cmp    %rdi,%rax
<+24>:    je     0xffffffff82244a55 <sync_regs+37>
<+26>:    mov    $0x15,%ecx
<+31>:    mov    %rax,%rdi
<+34>:    rep movsq %ds:(%rsi),%es:(%rdi)
<+37>:    jmp    0xffffffff82256ba0 <__x86_return_thunk>

When microbenchmarking page faults, perf top shows:

before:
  22.07%  [kernel]                  [k] asm_exc_page_fault
  12.83%  pf_processes              [.] testcase
  11.81%  [kernel]                  [k] sync_regs

after:
  26.06%  [kernel]                  [k] asm_exc_page_fault
  13.18%  pf_processes              [.] testcase
  [..]
   0.91%  [kernel]              [k] sync_regs

A massive reduction in execution time of the routine.

Link 1: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=119596
Link 2: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=119703
Link 3: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=119704
Link 4: https://lore.kernel.org/oe-lkp/202504181042.54ea2b8a-lkp@intel.com/
Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---
v2:
- only do it if not building with CONFIG_X86_NATIVE_CPU

Hi Linus,

RFC for the patch was posted here:
https://lore.kernel.org/all/xmzxiwno5q3ordgia55wyqtjqbefxpami5wevwltcto52fehbv@ul44rsesp4kw/

You rejected it on 2 grounds:
- this should be handled by gcc itself -- agreed, but per the
  interaction in the bzs I created for them I don't believe this will
  happen any time soon (if ever to be frank)
- messing with local optimization flags -- perhaps ifdefing on
  CONFIG_X86_NATIVE_CPU would be good enough? if not, the thing can be
  hidden behind an option (default Y) so interested parties can whack it

See the commit message for perf numbers. It would be a shame to not get
these wins only because gcc is too stubborn.

While I completely understand not liking compiler-specific hacks, I
believe I made a good enough case for rolling with them here.

That said, if you don't see any justification to get something of this
sort in, I'm dropping the matter.

cheers

 arch/x86/Makefile | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 1913d342969b..9eb75bd7c81d 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -198,6 +198,31 @@ ifeq ($(CONFIG_STACKPROTECTOR),y)
     endif
 endif
 
+ifdef CONFIG_CC_IS_GCC
+ifndef CONFIG_X86_NATIVE_CPU
+#
+# Inline memcpy and memset handling policy for gcc.
+#
+# For ops of sizes known at compilation time it quickly resorts to issuing rep
+# movsq and stosq. On most uarchs rep-prefixed ops have a significant startup
+# latency and it is faster to issue regular stores (even if in loops) to handle
+# small buffers.
+#
+# This of course comes at an expense in terms of i-cache footprint. bloat-o-meter
+# reported 0.23% increase for enabling these.
+#
+# We inline up to 256 bytes, which in the best case issues few movs, in the
+# worst case creates a 4 * 8 store loop.
+#
+# The upper limit was chosen semi-arbitrarily as uarchs wildly differ between a
+# threshold past which rep-prefixed ops become faster. 256 being the lowest
+# common denominator. This should be fixed in the compiler.
+#
+KBUILD_CFLAGS += -mmemcpy-strategy=unrolled_loop:256:noalign,libcall:-1:noalign
+KBUILD_CFLAGS += -mmemset-strategy=unrolled_loop:256:noalign,libcall:-1:noalign
+endif
+endif
+
 #
 # If the function graph tracer is used with mcount instead of fentry,
 # '-maccumulate-outgoing-args' is needed to prevent a GCC bug
-- 
2.48.1

