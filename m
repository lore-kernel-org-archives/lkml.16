Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354581A83F8
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 08:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746866729; cv=none; b=SQ3qeDG2X89FLf3EdGsXpTNhkN8CZzSNqSAp+CRB0sclJAEwAGag0D3n7G5+49vrMi1sntXfwNDQPzyBCl+tQRgs6VlUL8r/7MchgFT/cnadtLnrElqi33bBKGT/+SuXVzn1L25AhpG5LWMe9pTfDBNQl34p+Xf29bHS2Cp1U3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746866729; c=relaxed/simple;
	bh=I6iJum6veYGsxpAyFOfOr2Yj09dXqcOpxgiyuNYyMxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7plSRFhH2dl3fe/eNUfIIm0q/Q1+nWfQDq1RRs/PBkh8cUlQhRHjNOhA8+jeX2p27H9pYya21Hs7Noh0LaHHu51JXZrSN+JpB2s1HgrtdH4iWSCZ3Fu5pUTL1zbHEEfpaZQwLEF5rejg70bY5lfpJWmVWiZnCCTdPIiNpapxO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGwyprX3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGwyprX3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FEDC4CEE2;
	Sat, 10 May 2025 08:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746866728;
	bh=I6iJum6veYGsxpAyFOfOr2Yj09dXqcOpxgiyuNYyMxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AGwyprX3UyBRk+DKoSfT3MjrJPBg0lORBpbWCmN9tOsYJBm4oX5BeMTEXnK/pbFup
	 WdHJA5ER7kPqB+7ZPc5WdDM2++6y2k/TNdtDjrfOom23rzjzNgdT3zuy+1PVGpXfav
	 U9ulHjHNPfsMtA48Q3Wd6s5eUzDCOIrB1URNPncND3wUFvKCOh1jw4ULGUQELVzVte
	 8YFKSC1XpjNWUZh5oK97zVU8WXd/P3m9SmSjSm4BtUveqUAaiFmLtgCM5cVKaTPnRp
	 F96tTZR/ZsVhd0lwWKkpwPqUnWuaZQIBllo3U1Uk9aXrpnH8187wldnY7vGczx2aLQ
	 o7ZQBM0FkZsmg==
Date: Sat, 10 May 2025 10:45:23 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] futex: Fix futex_mm_init() build failure on older compilers,
 remove rcu_assign_pointer()
Message-ID: <aB8SI00EHBri23lB@gmail.com>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-15-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416162921.513656-15-bigeasy@linutronix.de>


* Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:

> diff --git a/include/linux/futex.h b/include/linux/futex.h
> index 1d3f7555825ec..40bc778b2bb45 100644
> --- a/include/linux/futex.h
> +++ b/include/linux/futex.h
> @@ -85,7 +85,8 @@ void futex_hash_free(struct mm_struct *mm);
>  
>  static inline void futex_mm_init(struct mm_struct *mm)
>  {
> -	mm->futex_phash =  NULL;
> +	rcu_assign_pointer(mm->futex_phash, NULL);
> +	mutex_init(&mm->futex_hash_lock);
>  }

This breaks the build on older compilers - I tried gcc-9, x86-64 
defconfig:

  CC      io_uring/futex.o
 In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                 from ./include/linux/compiler.h:390,
                 from ./include/linux/array_size.h:5,
                 from ./include/linux/kernel.h:16,
                 from io_uring/futex.c:2:
 ./include/linux/futex.h: In function 'futex_mm_init':
 ./include/linux/rcupdate.h:555:36: error: dereferencing pointer to incomplete type 'struct futex_private_hash'
  555 | #define RCU_INITIALIZER(v) (typeof(*(v)) __force __rcu *)(v)
      |                                    ^~~~
 ./include/asm-generic/rwonce.h:55:33: note: in definition of macro '__WRITE_ONCE'
   55 |  *(volatile typeof(x) *)&(x) = (val);    \
      |                                 ^~~
 ./arch/x86/include/asm/barrier.h:63:2: note: in expansion of macro 'WRITE_ONCE'
   63 |  WRITE_ONCE(*p, v);      \
      |  ^~~~~~~~~~
 ./include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
  172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
      |                                                       ^~~~~~~~~~~~~~~~~~~
 ./include/linux/rcupdate.h:596:3: note: in expansion of macro 'smp_store_release'
  596 |   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |   ^~~~~~~~~~~~~~~~~
 ./include/linux/rcupdate.h:596:25: note: in expansion of macro 'RCU_INITIALIZER'
  596 |   smp_store_release(&p, RCU_INITIALIZER((typeof(p))_r_a_p__v)); \
      |                         ^~~~~~~~~~~~~~~
 ./include/linux/futex.h:91:2: note: in expansion of macro 'rcu_assign_pointer'
   91 |  rcu_assign_pointer(mm->futex_phash, NULL);
      |  ^~~~~~~~~~~~~~~~~~
 make[3]: *** [scripts/Makefile.build:203: io_uring/futex.o] Error 1
 make[2]: *** [scripts/Makefile.build:461: io_uring] Error 2
 make[1]: *** [/home/mingo/tip/Makefile:2004: .] Error 2
 make: *** [Makefile:248: __sub-make] Error 2

The problem appears to be that this variant of rcu_assign_pointer() 
wants to know the full type of 'struct futex_private_hash', which type 
is local to futex.c:

   kernel/futex/core.c:struct futex_private_hash {

So either we uninline futex_mm_init() and move it into futex/core.c, or 
we share the structure definition with kernel/fork.c. Both have 
disadvantages.

A third solution would be to just initialize mm->futex_phash with NULL 
like the patch below, it's not like this new MM's ->futex_phash can be 
observed externally until the task is inserted into the task list - 
which guarantees full store ordering.

This relaxation of this initialization might also give a tiny speedup 
on certain platforms.

But an Ack from PeterZ on that assumption would be nice.

Thanks,

	Ingo

=====================================>
Signed-off-by: Ingo Molnar <mingo@kernel.org>

 include/linux/futex.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/futex.h b/include/linux/futex.h
index eccc99751bd9..168ffd5996b4 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -88,7 +88,14 @@ void futex_hash_free(struct mm_struct *mm);
 
 static inline void futex_mm_init(struct mm_struct *mm)
 {
-	rcu_assign_pointer(mm->futex_phash, NULL);
+	/*
+	 * No need for rcu_assign_pointer() here, as we can rely on
+	 * tasklist_lock write-ordering in copy_process(), before
+	 * the task's MM becomes visible and the ->futex_phash
+	 * becomes externally observable:
+	 */
+	mm->futex_phash = NULL;
+
 	mutex_init(&mm->futex_hash_lock);
 }
 
 
