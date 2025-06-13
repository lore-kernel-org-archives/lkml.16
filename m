Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2072C1EE014
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749785701; cv=none; b=RaL6h3+R2MAh5AkBfmxS/66LgxMIfnWPio3P/C8NKuYRFLYjncctHI3qWe5uuXXaQctzS3kPJCQ1ZdNZdUFgENOpfIQVmAwbVwbYWZKx1N3QeDI6cCbvFs1VC6/72kid+C+zc2um0Q64e7SYmhkA2ydJbwKXR4XPUmE/ITg54EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749785701; c=relaxed/simple;
	bh=SkozSVOnUsEzXPxitjFHJu8bXkL2jLMEy6Odc4iIxM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lqPJs6hPHKOQvct3P6EluEYaC+ZsG0/sNryfTlb8AZw8LfEGs3bDmQyFnzfVb9Sko+23iAKSYsItuLBThNbxyY61OxbDbWr2fCXqZvBNcw6lvG/pBVmMz/MzZ8H9h5JBFLpEy+cmlMfFnDSkIABxRLtpobTd32SRENP3cLr/yZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOl/Xbhu; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOl/Xbhu"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-235f9e87f78so17896355ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749785698; x=1750390498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNxJUfWKAJFM1mLIFS2utgiqmJqo3aSwrfykHEFk6Lc=;
        b=QOl/XbhuANluVV71RtJM86dEd+DmahC/ISL2PiZDpnYfOLKEUIrIrQzKqr+DnvyoFJ
         C98IegONspZ68mGtzWBnWYKmFA5EKVxxPfvvbyuvfMvC+fiTJtqL6dmwCgixGwJtJNzW
         5NNE+gb7x4JlbkW4dL4dB6JgkMutUBPH44sYkLygqzA/7Jn+NPWIevDXgHkh29mwnROw
         i5e+QIBwn7w+QuEU/SWKooXnxvy5CPh/4zdTPC9wqeuZMKGV44s8L2o3xaxBFHiQ73Rv
         UEdsCKCCxvWDNcMpL4HXrPKKYZ3GhZ3vBnkuY3ASLz9cvQhcHLWV3RnHc6inbALAVLzR
         rwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749785698; x=1750390498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNxJUfWKAJFM1mLIFS2utgiqmJqo3aSwrfykHEFk6Lc=;
        b=PPRyYHNHyV6UFoFdUzYmjPSz5yhEIidhWrxtziwURtEVLSrk4jpvAGXeKgu3iSE/yp
         BK80H+qlTPFkAJWzQsO46NRywdG7xqVaQq2+XJJJPdWPYQ4V0m4z2WiIGBvOckdiRruN
         4Bb/WmET3EAhMiK5nur8kHi6SLMwwqPlof6KrCd6NK4xtprW9huh4K6+6AYkhoA8vvDG
         TqVNClb8HHq2rHfWRx4Go7N3BtW2bb+1id7Ejet65FpNGx5dt0AYmP+NVMAEVdBZA3gq
         e1KeJ46L/nDqr0VEBnFFqLm1W4A5Sr+cUgNQ0WFbPxUTqZsVKusQawaJHO45FYEWdul3
         /x3g==
X-Forwarded-Encrypted: i=1; AJvYcCVJqUtvzqoYYSuVW+Mq751GDfmXmJ7x0e7qdmQbkI7FaO5TGEXzfHrdGdBC28tK90Ufauc5wlgestuYWa4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4ww6tAqPeicGOQGHkdEx9yUwJineB/C8VmV3o7cR1DJuD7kCm
	fXbfwGYBb1htDbHkaucam3hs++7hzqwWaEOn0yoivj+qSqrKPopbp4x2
X-Gm-Gg: ASbGnctPVBGh6RtUIhJNtomJ+jKQRy39nwgRmoi/yHF3zsJYW9PNAp8dqeoHdP5NPV0
	moNve+XY0GX2ODy/0MI1b5cDBZ0X1vYG/2KA3klMdAq0JhMrjeqxlqfQgGiFeL/xsmpJuktEGNf
	nHipmT0jzpf0SiFLL7h8c3TuCmYliiNyZ4ht1phax9zzzbCltxPMb2jHsToVSDbKabgeT+ZVagO
	xxEsVVAV8/9NIIla3b0LK1r2YxS/K80pj2Wsb//JxLDlhgGmloSOSg8xiMhIWHqNcM2Ry8fcrO0
	HbxpTAp1KwTvFG4Xkp7NC2jg04WMpykl50Iqa0wURlli1TVVCWQaNjFSjSbVbkmne76nZapBFzY
	I5AQDjzwc6fMqFYI=
X-Google-Smtp-Source: AGHT+IESF+M6oqXA5f8Vw2SniR839ETtLyIUTc+3tpCna/59lCR//WHjBrVJ6TJCecTnlxNf2+Mn0w==
X-Received: by 2002:a17:903:32ca:b0:21f:1202:f2f5 with SMTP id d9443c01a7336-2365d889afamr17940315ad.8.1749785698398;
        Thu, 12 Jun 2025 20:34:58 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:873:d810:9d97:1c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d1122sm2339081a91.13.2025.06.12.20.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:34:57 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: yury.norov@gmail.com
Cc: linux@rasmusvillemoes.dk,
	jstultz@google.com,
	tglx@linutronix.de,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com,
	visitorckw@gmail.com,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH 1/2] cpumask: Introduce cpumask_first_but()
Date: Fri, 13 Jun 2025 11:34:46 +0800
Message-ID: <20250613033447.3531709-2-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613033447.3531709-1-richard120310@gmail.com>
References: <20250613033447.3531709-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the implementation of cpumask_any_but() to cpumask_first_but().
Elimate the need to looping and make cpumask_any_but() a macro to wrap
around cpumask_first_but(), just like cpumask_any() does, to make it
more consistence.

The change brings some benefit in terms of code size shrinking of
vmlinux, for NR_CPUS=64, it reduce 78 bytes in total, for
NR_CPUS=4096, it reduce 2 bytes in total. The details are shown in the
table [1].

Performance test is done using the test script [2]. Running the test for
10000 times, the origin implementation of cpumask_any_but() use 19665287
nanoseconds in total, the new version of it, which is a wrapper around
cpumask_first_but(), uses 19545574 nanoseconds. The difference is 119713
nanoseconds.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
[1]:

For NR_CPUS=64:
$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
add/remove: 0/0 grow/shrink: 3/7 up/down: 46/-124 (-78)
Function                                     old     new   delta
irq_migrate_all_off_this_cpu                 716     745     +29
try_to_unmap_one                            3380    3391     +11
try_to_migrate_one                          2451    2457      +6
uncore_event_cpu_offline                     343     342      -1
calibrate_delay_is_known                     236     235      -1
tsc_store_and_check_tsc_adjust               506     495     -11
arch_tlbbatch_flush                          302     288     -14
tmigr_cpu_offline                            406     382     -24
perf_event_exit_cpu_context                  592     565     -27
flush_tlb_mm_range                          1561    1515     -46
Total: Before=23390770, After=23390692, chg -0.00%

For NR_CPUS=4096:
$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
add/remove: 0/0 grow/shrink: 7/3 up/down: 136/-138 (-2)
Function                                     old     new   delta
uncore_event_cpu_offline                     291     333     +42
try_to_migrate_one                          2378    2413     +35
flush_tlb_mm_range                          1476    1503     +27
irq_migrate_all_off_this_cpu                 741     754     +13
tmigr_cpu_offline                            353     362      +9
calibrate_delay_is_known                     183     192      +9
arch_tlbbatch_flush                          296     297      +1
tsc_store_and_check_tsc_adjust               484     482      -2
perf_event_exit_cpu_context                  546     528     -18
try_to_unmap_one                            3560    3442    -118
Total: Before=23448698, After=23448696, chg -0.00%

[2]:
static int __init test_init(void)
{
    struct cpumask test_mask;
    ktime_t start_time, end_time;
    s64 elapsed_ns;
    unsigned int result;
    unsigned int random_cpu;
    int i;

    cpumask_copy(&test_mask, cpu_online_mask);

    start_time = ktime_get();

    for (i = 0; i < 100000; i++) {
        get_random_bytes(&random_cpu, sizeof(random_cpu));
        random_cpu = random_cpu % nr_cpu_ids;
        result = cpumask_any_but(&test_mask, random_cpu);
    }

    end_time = ktime_get();

    elapsed_ns = ktime_to_ns(ktime_sub(end_time, start_time));

	pr_info("Total time: %lld ns\n", elapsed_ns);

    return 0;
}

The test is running in the form of kernel module.
The test machine is running ubuntu 24.04 on x86_64 machine with kernel
version of v6.14.0, CPU type is AMD Ryzen 7 5700X3D 8-Core Processor.

Best regards,
I Hsin Cheng
---
 include/linux/cpumask.h | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index f9a868384083..d91630a97d76 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -408,22 +408,22 @@ unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
 	for_each_set_bit_from(cpu, cpumask_bits(mask), small_cpumask_bits)
 
 /**
- * cpumask_any_but - return an arbitrary cpu in a cpumask, but not this one.
+ * cpumask_first_but - return the first cpu in a cpumask, but not this one.
  * @mask: the cpumask to search
  * @cpu: the cpu to ignore.
  *
- * Often used to find any cpu but smp_processor_id() in a mask.
+ * Often used to find the first cpu but smp_processor_id() in a mask.
  * Return: >= nr_cpu_ids if no cpus set.
  */
 static __always_inline
-unsigned int cpumask_any_but(const struct cpumask *mask, unsigned int cpu)
+unsigned int cpumask_first_but(const struct cpumask *mask, unsigned int cpu)
 {
 	unsigned int i;
 
 	cpumask_check(cpu);
-	for_each_cpu(i, mask)
-		if (i != cpu)
-			break;
+	i = cpumask_first(mask);
+	if (i == cpu)
+		i = cpumask_next(i, mask);
 	return i;
 }
 
@@ -864,6 +864,16 @@ void cpumask_copy(struct cpumask *dstp, const struct cpumask *srcp)
  */
 #define cpumask_any(srcp) cpumask_first(srcp)
 
+/**
+ * cpumask_any_but - pick an arbitrary cpu from *srcp but not the given cpu
+ * @srcp: the input cpumask
+ * @cpu: the cpu to ignore
+ *
+ * Often used to find any cpu but smp_processor_id() in a mask.
+ * Return: >= nr_cpu_ids if no cpus set.
+ */
+#define cpumask_any_but(srcp, cpu) cpumask_first_but(srcp, cpu)
+
 /**
  * cpumask_any_and - pick an arbitrary cpu from *mask1 & *mask2
  * @mask1: the first input cpumask
-- 
2.43.0

