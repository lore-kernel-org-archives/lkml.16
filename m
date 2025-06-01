Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11042904
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 10:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748772639; cv=none; b=fuNWnabDFiNQbg4sv+2N1XcohYbnheRSC3pyXjFEEpfLfEqkXQY+SmaOEtjhKsm13eue1bVksLI5C1bmWi7fkhVKaDR5GiNzkewHKlW+Od7AnNeNZaUq+VaSDWkvI7jxQD2LFw0e+cs7MnKqncxwOQsTpY30tiq7NYfN+FueZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748772639; c=relaxed/simple;
	bh=pwwBwVsdNGsdUCa7FJVqahA5IDy1hbqadNCp4drXoFw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=nIl0Ido27ue/sjk2xhXOr819uKZYCcZjxNiKtzhX3CCzq1eAfA0UTXoTUoooXyDGmDBVEAfMbuTvIOG6bO9flYBWjSQmWbsZm5uaSqq20m40sUUq4QoK97R4Jjc2UyzobptSBwkbEjD327dnRmIy4EmYzfSS0IAHRgteICAi9j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31271ed809dso331299a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 03:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748772637; x=1749377437;
        h=content-transfer-encoding:organization:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bCJ/NW4Fgd4zONtfaBv9NF4M8zWk024aWOpSgbORhNI=;
        b=FdFD3gV5iP3BMwl06Y1EPfOu/HMdB2xJlhqRmiYl7VinT6lc7y96uYsrxiuXzfS0Lv
         Yc4amKzVY5qvyf+gg0CSmYa9WNL45msJ/D5eQKX53+Wu3+qDc7DHVtvMY4XpRSiH9ft6
         K6x8PK8toyO1qqrRCgfQprr7OMxFy9kcr99kqAYjNn28j6E5ibi71qKug7RglN7lNw9s
         QkDz8kh+ijcq+5ACJ6MN9L7xNJTQUM0eNHlD8PmHtclprMUPCr/TC3U7boD1gsy7+5BX
         DGTFjSrTcMH7ubKC/qEHS1JogbTFDD+ll5aT1CuoSpeL2Tb61To6hrykKOfCpgrP4PeK
         EGmw==
X-Forwarded-Encrypted: i=1; AJvYcCWijtQkNxEWWF4qEJI4WcpOVe/CzPqfJeZ/hm0rU5zSWu8UXULIRUudnUg5uyoWMNIudCKVViueunHEruw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBR1gVQ2k9YQ3hQ2iQqGhl2MnJiOq+XFIK66qN0Ctfx+jgtaoY
	gVWZxqUhFT0KQTkw4LWTfw3G9Xvo0BEiTYJ2ACXeu5KHgBekc6O0aob3
X-Gm-Gg: ASbGncuHH2GWU2IF1hrnx5GTRtD8J2WiYtdd3wF9jgFHOJMRoWx5BHxaMAsmx0GB1mo
	vrP9jesJbu88xPCyYKnoSIWbWMkIJQv+qcpC/290iXrt59SyiXw8lk33jtAyfZUV+lvtiaMqeFs
	zAFT5brQGCPBz6VA8BeVEgzd+mAnU/BvaKVkCVmeLO/vPEWtMP3uKUkcia2QZ+rO2THLN/AiZzl
	AiF86nLQqKIOykVdhOszeGHsNyVmVK8hKXeNnt3IdtpW4AB8OqWzxVDqhz7yFaA0UNnD2R4HZWT
	iS+H+1gqqk7RcNpTkQsOEBwsAXV+WZd08QN6D6+5HjJdJGEA3BPo/dd2ki8NHZk=
X-Google-Smtp-Source: AGHT+IFUvXsDyrWNINhgZNECDvFRsuboM7cgI7pwtRSj1S/vGbbe7URSPkEbL1ouTdy0BVzcsQbYCw==
X-Received: by 2002:a17:903:2351:b0:234:ed31:fc9f with SMTP id d9443c01a7336-23535b648acmr50697785ad.11.1748772636869;
        Sun, 01 Jun 2025 03:10:36 -0700 (PDT)
Received: from [192.168.50.136] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf53dasm53256865ad.184.2025.06.01.03.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 03:10:36 -0700 (PDT)
Message-ID: <693e0aa4-34cd-4cb8-88a2-2cbacbe99a42@kzalloc.com>
Date: Sun, 1 Jun 2025 19:10:32 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Aaron Ballman <aaron@chiselapp.com>, Reid Kleckner <reid@llvm.org>,
 David Greene <david.greene@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, llvm-dev <llvm-dev@lists.llvm.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Byungchul Park <byungchul@sk.com>,
 "max.byungchul.park@gmail.com" <max.byungchul.park@gmail.com>,
 Yeo Reum Yun <YeoReum.Yun@arm.com>, Yunseong Kim
 <yunseong.kim@ericsson.com>,
 "kernel_team@skhynix.com" <kernel_team@skhynix.com>
From: Yunseong Kim <ysk@kzalloc.com>
Subject: Clang compilation error in Linux kernel with DEPT patch: cannot jump
 from this indirect goto statement to one of its possible targets
Organization: kzalloc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dear LLVM/Clang Developers,

I'm encountering a compilation error when building the Linux kernel with Clang
(clang version 20.1.3 (Fedora 20.1.3-1.fc42)) after applying a DEPT
(Dynamic Execution Path Tracing) patch.
Link: https://lore.kernel.org/all/20250519091826.19752-1-byungchul@sk.com/

The error occurs in “drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c” and is related to
an indirect ‘goto’ jumping into a statement expression. This issue does not
occur when compiling with GCC(gcc version 15.1.1 20250425
(Red Hat 15.1.1-1)).


Problem Description:

The core error message is:
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1372:3: error: cannot jump from this indirect goto statement to one of its possible targets
 1372 |                 drm_exec_retry_on_contention(&exec);
      |                 ^

Followed by notes showing the expansion:

./include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
  123 |                         goto *__drm_exec_retry_ptr;             \
      |                         ^
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1399:2: note: possible target of indirect goto statement
 1399 |         dma_fence_wait(fence, false);
      |         ^
./include/linux/dma-fence.h:679:2: note: expanded from macro 'dma_fence_wait'
  679 |         sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);      \
      |         ^
./include/linux/dept_sdt.h:45:45: note: expanded from macro 'sdt_might_sleep_start_timeout'
   45 |                 dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
      |                                                           ^
./include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
   10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
      |                                         ^
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1399:2: note: jump enters a statement expression
./include/linux/dma-fence.h:679:2: note: expanded from macro 'dma_fence_wait'
  679 |         sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);      \
      |         ^
./include/linux/dept_sdt.h:45:45: note: expanded from macro 'sdt_might_sleep_start_timeout'
   45 |                 dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
      |                                                           ^
./include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
   10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
      |                    ^
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1399:2: note: jump enters a statement expression
./include/linux/dma-fence.h:675:38: note: expanded from macro 'dma_fence_wait'
  675 | #define dma_fence_wait(f, intr)                                         \
      |                                                                         ^
1 error generated.


Context and Analysis:

1. “ _THIS_IP_” Macro: This macro, defined in
   “include/linux/instruction_pointer.h”, uses a GNU C statement expression with
   an address-of-label (&&__here) to obtain the current instruction pointer.

2. Code Flow:
    The “drm_exec_retry_on_contention” macro (from include/drm/drm_exec.h)
    expands to an indirect ‘goto’ statement (goto *_drm_exec_retry_ptr;). This
    pointer is set within the “drm_exec_until_all_locked” macro. One of the
    possible targets of this indirect ‘goto’ (as identified by Clang) is a line
    within the “dma_fence_wait()” function call.
    “dma_fence_wait()” (from include/linux/dma-fence.h) calls
    “sdt_might_sleep_start_timeout” (from include/linux/dept_sdt.h).
    “sdt_might_sleep_start_timeout” then utilizes the “_THIS_IP_” macro.

3.  The Problem:
    Clang reports an error because the indirect ‘goto’  from
    “drm_exec_retry_on_contention” attempts to jump into the statement
    expression generated by “_THIS_IP_”. The diagnostic “note: jump enters
    a statement expression” is the key.


Comparison with GCC:

GCC compiles this code without errors. This highlights a difference in how GCC
and Clang handle GNU extensions like statement expressions and
address-of-labels, especially when combined with indirect ‘goto’ for control
flow. GCC appears more lenient or implements these features differently.


Relevant LLVM Issues/Patches:

1. LLVM Issue 138272 (Add builtin/intrinsic to get current instruction pointer):
   Link: https://github.com/llvm/llvm-project/issues/138272
   This issue discusses the problematic nature of _THIS_IP_'s usage in LLVM.
   It indicates that ‘blockaddress’ (LLVM's representation for ‘&&label’) has
   defined behavior only when used as an operand to “indirectbr” or for null
   comparisons. Using it merely to obtain the instruction pointer violates
   LLVM's requirements.


2. LLVM Patch D154696 ([Clang] Diagnose jumps into statement expressions):
   Link: https://reviews.llvm.org/D154696
   This patch directly addresses the issue of jumps into statement expressions.
   It was initially reverted due to breaking the Linux kernel build but was
   later relanded. This shows Clang's active effort to enforce stricter
   diagnostics for such constructs, which GCC's documentation also implicitly
   states as undefined behavior.


3. LLVM Issue 28019 (Wrong 'error: cannot jump from this indirect goto statement
   to one of its possible targets'):
   Link: https://github.com/llvm/llvm-project/issues/28019
   While not directly about statement expressions, this issue describes a
   similar error where Clang flags an indirect ‘goto’ bypassing VLA
   initialization. This reinforces Clang's conservative static analysis and its
   tendency to diagnose potential undefined behavior.


Conclusion and Request:

The compilation error seems to stem from Clang's stricter adherence to LLVM's
‘blockaddress’ usage rules and its diagnostics for jumps into statement
expressions, which Clang considers undefined behavior. The DEPT patch integrates
“sdt_might_sleep_start_timeout” into the “dma_fence_wait” call path, exposing
this problematic pattern when combined with “drm_exec_retry_on_contention”.


I haven't found any specific Clang compiler options that would allow us to
disable this diagnostic or work around the issue.

Could you please provide guidance on how to address this compilation error? Is
this a known limitation or an intended diagnostic behavior that kernel
developers need to adapt to? Are there any recommended patterns or compiler
flags that could mitigate this issue without fundamentally altering the kernel's
use of these GNU extensions?


Thank you for your time and assistance.

Sincerely,
Yunseong Kim
