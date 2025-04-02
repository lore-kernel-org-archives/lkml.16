Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EFB1DA5F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601375; cv=none; b=aINA9CUJ4QtNAbXerp9IdrNtE5YaacxDsKPPP5CE4dvCU7exoShW2r+j/5XWJozFFFww0nvQLuwjcL+IoIuYBVDFnUaxqMLXRpmWhud0sNj/pQXWFqkj9coppss4BdWY+SGgY3D8UcJSbcoTPZG9sUHXGRZZ2R6em5I5B8PQEYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601375; c=relaxed/simple;
	bh=ChveXZDkFtmy0KvhOkni+vMgTSHWWBXpSEltUMbEwQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ezIPPydwR9XDYg4pmlPQ7yx2b27RBHYTn8lp51k8DEPSO0+1nrK3hHc5Q4NyQceI2ckKUnpUB7JC5sRYEJs6wE2CKP5hIOTdOGaD2oSpnoVzk4vYJRHRKrm8PNUG8W8/7cgqchkQcKxI4Grjf/o1xEevYxNNz5DU0MB/2zCxzLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUT3L8nC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUT3L8nC"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c0dfba946so2997051f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743601371; x=1744206171; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5dIRk/SGoa+s9G+rkBPMxBY7azSBEa0v080fX5Lf8o=;
        b=EUT3L8nCoLGCkxfi+y4xq5EhzeEyraaBvkeEZN8B3xVQaHCAZ71P0Hrv5G9mxYy6Vc
         reLjEncn61N7VywiGGTtrGRSncaJ2aOZSl6ywxYWmiILLY+cdO3fW4FWJ1nwmrl7cU9n
         468jI6Vk0i9sij5oIKx1VBALfrAnw2kOBPgoQ6Ce64UoG4xmYqJb1VlcceXldpUx3BCo
         g7WLgtyAeXrB12yi2hlw+AuU+lPNeqaLSAbIfWZ6no+cUGLdwKvl6vp6ZGVaavn61pbp
         6DqnZPPjMkx/5DS83cP2axlBk0xF6hMGH/dvVJEN+wphQJ2Z34XUW3XJGXKfW/wRlijq
         51MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743601371; x=1744206171;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5dIRk/SGoa+s9G+rkBPMxBY7azSBEa0v080fX5Lf8o=;
        b=wZqIsWMkPYEDuoQ1F9V8iNCjbPEXJCh7OVkQrimNhoFoIusRx7EVEqEh0j1Sml7MtO
         NmJ3PDa2SyOrmrb9lpt6xWlkZw2y1Y8m/fVGRxhT0yBqii97d/XBUvq9ByFnc/X3UwZY
         KHLehRnOu0O3eATM2udRA8oP1oGc+qCHrXglpjqcJ0LdsOSM/zpSmLvn8eDmK9hxV4uW
         8Fv0N4Hx5zc2ydsOBqEByPLaX02dGLDJajgkt9EybTqGGboUrY2oJok7V8PuEd3w40To
         hlzDcCDxo25bvQYelF7oMKG3nxEPX1qEKURD7Yyhwymltake0KGHy6fpfOFlFbHGhEkG
         xOtw==
X-Forwarded-Encrypted: i=1; AJvYcCWsFkiiuwOIe4YGUNxru/EzfRZxzH6aTqzUZNk5AtW2Lw86Xrxg1OJW+4VYPgB9mBhWKWJ1Wv4VxQ6g4qk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB3OixkAXesj3zC5WukQpkSxh8TuMR3YlKAODY4nmneDP8jzOf
	OnWLcNinDJsAgiFIvhbxODYI0Erdg8CcwbAVBj9Z1kEVB9IQ4jAX
X-Gm-Gg: ASbGncvtsMPb7P6HWc7UXSWp7taoWDsEy6qOOuXCjjZcFu76epUUBFSYXyoC3xVi1pr
	jMQkpnpiLYWdpkUqehmDULuJxehyrInNB5x7+CqVIUkMNxQyF0Y4NO9VFyJjONa5h71r0AiKWnH
	oU8vgRifqd1XWsE0tTQmOEgcVhevT1iw4PtRMB5HUsT0l+BLx07/oABW2Jhm7vmo6I3/rsZNR8u
	wJGbhoE+ejv4l5/NLh5bS3V79/sIByvdUz+DJje221NpMUn0b0C8BIqchZCIs5N475ruY3cEgB/
	N2eCNgIhEmlB/MIxJpwWW9RN23wVivP+9DjhNcnLnfCpYelGkLuy8IEGWg==
X-Google-Smtp-Source: AGHT+IElKYHDuwdkGCLUOvCGDjQhULscSKwrc/6608KXPfmVS/Pq6x79ntb01M8jpKdgWSyUD9h1Wg==
X-Received: by 2002:a05:6000:4203:b0:391:31f2:b998 with SMTP id ffacd0b85a97d-39c120cb8a3mr13529300f8f.6.1743601371049;
        Wed, 02 Apr 2025 06:42:51 -0700 (PDT)
Received: from f (cst-prg-6-220.cust.vodafone.cz. [46.135.6.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61b6cd2sm21085035e9.39.2025.04.02.06.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:42:50 -0700 (PDT)
Date: Wed, 2 Apr 2025 15:42:40 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: torvalds@linux-foundation.org, mingo@redhat.com
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
Message-ID: <xmzxiwno5q3ordgia55wyqtjqbefxpami5wevwltcto52fehbv@ul44rsesp4kw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="uifixdeqtexi6rm7"
Content-Disposition: inline


--uifixdeqtexi6rm7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Not a real submission yet as I would like results from other people.

tl;dr when benchmarking compilation of a hello-world program I'm getting
a 1.7% increase in throughput on Sapphire Rapids when convincing the
compiler to only use regular stores for inlined memset and memcpy

Note this uarch does have FSRM and still benefits from not using it for
some cases.

I am not in position to bench this on other CPUs, would be nice if
someone did it on AMD.

Onto the business:
The kernel is chock full of inlined rep movsq and rep stosq, including
in hot paths and these are known to be detrimental to performance below
certain sizes.

Most notably in sync_regs:
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

When issuing hello-world compiles in a loop this is over 1% of total CPU
time as reported by perf. With the kernel recompiled to instead do a
copy with regular stores this drops to 0.13%.

Recompiled it looks like this:
<+0>:     endbr64
<+4>:     mov    %gs:0x22b9f44(%rip),%rax        # 0xffffffff8450f010 <cpu_current_top_of_stack>
<+12>:    sub    $0xa8,%rax
<+18>:    cmp    %rdi,%rax
<+21>:    je     0xffffffff82255114 <sync_regs+84>
<+23>:    xor    %ecx,%ecx
<+25>:    mov    %ecx,%edx
<+27>:    add    $0x20,%ecx
<+30>:    mov    (%rdi,%rdx,1),%r10
<+34>:    mov    0x8(%rdi,%rdx,1),%r9
<+39>:    mov    0x10(%rdi,%rdx,1),%r8
<+44>:    mov    0x18(%rdi,%rdx,1),%rsi
<+49>:    mov    %r10,(%rax,%rdx,1)
<+53>:    mov    %r9,0x8(%rax,%rdx,1)
<+58>:    mov    %r8,0x10(%rax,%rdx,1)
<+63>:    mov    %rsi,0x18(%rax,%rdx,1)
<+68>:    cmp    $0xa0,%ecx
<+74>:    jb     0xffffffff822550d9 <sync_regs+25>
<+76>:    mov    (%rdi,%rcx,1),%rdx
<+80>:    mov    %rdx,(%rax,%rcx,1)
<+84>:    jmp    0xffffffff822673e0 <__x86_return_thunk>

bloat-o-meter says:
Total: Before=30021301, After=30089151, chg +0.23%

There are of course other spots which are modified and they also see a
reduction in time spent.

Bench results in compilations completed in a 10 second period with /tmp
backed by tmpfs:

before:
978 ops (97 ops/s)
979 ops (97 ops/s)
978 ops (97 ops/s)
979 ops (97 ops/s)
979 ops (97 ops/s)
979 ops (97 ops/s)
979 ops (97 ops/s)
979 ops (97 ops/s)
979 ops (97 ops/s)
979 ops (97 ops/s)

after:
997 ops (99 ops/s)
997 ops (99 ops/s)
997 ops (99 ops/s)
997 ops (99 ops/s)
997 ops (99 ops/s)
997 ops (99 ops/s)
997 ops (99 ops/s)
997 ops (99 ops/s)
997 ops (99 ops/s)
996 ops (99 ops/s)

I'm running this with debian 12 userspace (gcc 12.2.0).

I asked the LKP folk to bench but did not get a response yet:
https://lore.kernel.org/oe-lkp/CAGudoHHd8TkyA1kOQ2KtZdZJ2VxUW=2mP-JR0t_oR07TfrwN8w@mail.gmail.com/

Repro instructions:
for i in $(seq 1 10); do taskset --cpu-list 1 ./ccbench 10; done

taskset is important as otherwise processes roam around the box big
time.

Attached files are:
- cc.c for will-it-scale if someone wants to profile the thing while it
  loops indefinitely
- src0.c -- hello world for reference, plop into /src/src0.c
- ccbench.c is the bench; compile with cc -O2 -o ccbench ccbench.c

It spawns gcc through system() forcing it to go through the shell, which
mimicks what happens when compiling with make.

 arch/x86/Makefile | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 9b76e77ff7f7..1a1afcc3041f 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -198,6 +198,29 @@ ifeq ($(CONFIG_STACKPROTECTOR),y)
     endif
 endif
 
+ifdef CONFIG_CC_IS_GCC
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
+# The upper limit was chosen semi-arbitrarily -- uarchs wildly differ between a
+# threshold past which a rep-prefixed op becomes faster, 256 being the lowest
+# common denominator. Someone(tm) should revisit this from time to time.
+#
+KBUILD_CFLAGS += -mmemcpy-strategy=unrolled_loop:256:noalign,libcall:-1:noalign
+KBUILD_CFLAGS += -mmemset-strategy=unrolled_loop:256:noalign,libcall:-1:noalign
+endif
+
 #
 # If the function graph tracer is used with mcount instead of fentry,
 # '-maccumulate-outgoing-args' is needed to prevent a GCC bug
-- 
2.43.0


--uifixdeqtexi6rm7
Content-Type: text/x-csrc; charset=utf-8
Content-Disposition: attachment; filename="ccbench.c"

#include <sys/types.h>

#include <err.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define	RUNCMD	"gcc -c -o /tmp/out0.o /src/src0.c"
#define	WARMUP	5

volatile sig_atomic_t got_alarm;

static void sigalrm_handler(int signo)
{
	got_alarm = 1;
}

int main(int argc, char **argv)
{
	long i;
	int n;

	if (argc != 2) {
		errx(1, "need time limit in seconds");
	}

	n = atoi(argv[1]);
	if (n < 1) {
		errx(1, "bad arg");
	}

	signal(SIGALRM, sigalrm_handler);

	if (!getenv("CCBENCH_SKIP_WARMUP")) {
		alarm(WARMUP);
		for (i = 0; !got_alarm; i++) {
			system(RUNCMD);
		}
		printf("warmup: %ld ops (%ld ops/s)\n", i, i / WARMUP);
		got_alarm = 0;
	}

	alarm(n);
	for (i = 0; !got_alarm; i++) {
		system(RUNCMD);
	}
	printf("bench: %ld ops (%ld ops/s)\n", i, i / n);
}

--uifixdeqtexi6rm7
Content-Type: text/x-csrc; charset=utf-8
Content-Disposition: attachment; filename="src0.c"

#include <stdio.h>

int main(void)
{
	printf("Hello world!\n");
}

--uifixdeqtexi6rm7
Content-Type: text/x-csrc; charset=utf-8
Content-Disposition: attachment; filename="cc.c"

#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

char *testcase_description = "compile";

void testcase(unsigned long long *iterations, unsigned long nr)
{
	char cmd[1024];

	sprintf(cmd, "cc -c -o /tmp/out.%ld /src/src%ld.c", nr, nr);

	while (1) {
		system(cmd);

		(*iterations)++;
	}
}

--uifixdeqtexi6rm7--
