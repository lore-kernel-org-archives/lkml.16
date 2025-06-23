Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA98250C18
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675134; cv=none; b=c/DGop6ZI6RAdt6p1gfrqhJXNM/wQ0MBLrWpT0w+OB3SrFSVIOhDvAaeGnOM78CeVNHdj/VTkfiGW2xhikUfvEJurY3qFuKOYvvrO+8gIN+lYlQeS9mwTsrHnxk8qqZj/BKVkRc52skENVrZUchB6+pjn3dIwKKrjzWuEVHDBGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675134; c=relaxed/simple;
	bh=a+9rJACnV5ydOjRtZKCaQXvk041IvtHZA82iZCNYZik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABFWk8YP3CRjg30FgC021jU4iqo6aZlI27RnyAPYZlwZZLR2WDt4XZceHzrtW+GKLgpGok/iyzOcQILPm3fuywkuXOKce9ncKsoJrtqCcta7YfMX2S/LOOy8+YqgQwC8t/Ab1VBYwHc9be0QCl2ivvx3MjyxamfXl1kj27P6jmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Bzr9LmAf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Bzr9LmAf"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so3164794f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750675130; x=1751279930; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WX0nskovDCrGCU+wbh3ppLRpRAqYK3wcI4u2Rx3QJXw=;
        b=Bzr9LmAf3TmVdBtS+aH9uLmlu4e+2YJuuh/rPfPVQWUG8V4laNVz/YDIqHrOMDK4Ws
         u0av+Tun05XfbDEeAF2KS93EW1wDQJGK6gKiben3VbLuCHSyZLXUW0l+V7MC9Z8CGwvx
         fdwrabeXWtgCItB/IP7jH06ENj1Y20Mto7A/dwIMrSYZ4pAffQhIDRTUD3UFbqw3mYAR
         EKJPbvHCI2fHE6qKpiHSiO17PfcZpnALxunQUcKU2gJ2tEICygog3oYbSh/3CiBBUBJt
         xt39azsSeGksEizfQQyn/GAJ9ERoUGi4bQd1niUByDUxbuaQ0pPRsddZQMB8EjQpEVu7
         lSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675130; x=1751279930;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WX0nskovDCrGCU+wbh3ppLRpRAqYK3wcI4u2Rx3QJXw=;
        b=fD1W1ckrvOrTV2+RnDU9jMAchbYMiTLYrTkuAyGif8lKUzz7+9MQB+58LWt8g8dmBz
         YkbPqYNJBSmLEimwzXSu8sc0nIe+pzYZocwgzbbNUi3bwThcMpTK4Jok8zZZ6YdWq6ZQ
         6bPGfqS0K+Bvp+/z5Nu5ToJntaS6oOU2/KMh3/o1m7SdynV3SAo0cwBMeOsApA32rsg6
         w7GQwlHGxPASZ9vjJHnLd24SgHmJTFl9P63nCWBUslfDBYg63QoNk05LUtmK6Nf5huIJ
         DtqwOCVWj0uYWltYiQRfq8GzfxZSMHCmP+6OXTvgY1ss6Uin4rpFocx6cJlN0UCiUllk
         DUgw==
X-Forwarded-Encrypted: i=1; AJvYcCWW8T29iRMzD4j2BIE9PVa3F+/tORRfe73w6f28APcNysaudodwLuk84qL41y0oq8osc0SDctiao5GWW+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpNH8xkCZXxxarLY83cSHiL75/7eU0pN7dzQy0HRF6lxiMaNZx
	6VeWNYRv7l4+d5ile57zqixzCQiGvDE6s82ON4LyXQgZTj5IAgR8TE7hme20/K1WAgk=
X-Gm-Gg: ASbGncuDsTtzQecWe9eoxyk41Ux4vm0FoAfiWbu+jqR6xkGkpr1bQn8REZGxLMm0OuX
	aAs1Fg+bW/T+StQJ6NSEwAivgwymEEuGrR39NiH1GcVnTd6lj27xXjiBfbLyoVrzG3gA76c7r4A
	ffqQAKn15DVWLiphWJibenM3PYfQvHc8VCE0CbK0XAh8EBQg/eJLeuKE8V666JQAtrYElf2SH2Y
	yxKJCFUg07FcPaklGzoCR3Bb2Vlx+OQda4RBLxSS5atyA0Yr5r1ZTkvMh1K7Kth0B0HaY3m5DTZ
	kSbNNwAmoR4/NL6zlw2s3e9VvWWKlxdmdxh7E8HjP0JZbna7809QQIFg/o0Jt+XXSgc3pIzYa3o
	=
X-Google-Smtp-Source: AGHT+IEJv6yafxxUHxjfLVB1VCjvzm8qclBCxEQhCHTewAodPefbNeppLxQ3UTSM+1HgMondPXFr1w==
X-Received: by 2002:a05:6000:65b:b0:3a4:d953:74a1 with SMTP id ffacd0b85a97d-3a6d12da18bmr9540544f8f.23.1750675130038;
        Mon, 23 Jun 2025 03:38:50 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a649319sm8336761b3a.109.2025.06.23.03.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 03:38:49 -0700 (PDT)
Date: Mon, 23 Jun 2025 12:38:33 +0200
From: Petr Mladek <pmladek@suse.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Arnd Bergmann <arnd@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk: kunit: support offstack cpumask
Message-ID: <aFkuqaFn3BOvsPT-@pathway.suse.cz>
References: <20250620192554.2234184-1-arnd@kernel.org>
 <20250623075943-44fdf86a-adcd-478c-bf78-906145678adb@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250623075943-44fdf86a-adcd-478c-bf78-906145678adb@linutronix.de>

On Mon 2025-06-23 08:03:29, Thomas Weißschuh wrote:
> On Fri, Jun 20, 2025 at 09:25:20PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > For large values of CONFIG_NR_CPUS, the newly added kunit test fails
> > to build:
> > 
> > kernel/printk/printk_ringbuffer_kunit_test.c: In function 'test_readerwriter':
> > kernel/printk/printk_ringbuffer_kunit_test.c:279:1: error: the frame size of 1432 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> > 
> > Change this to use cpumask_var_t and allocate it dynamically when
> > CONFIG_CPUMASK_OFFSTACK is set.
> > 
> > Fixes: 5ea2bcdfbf46 ("printk: ringbuffer: Add KUnit test")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  kernel/printk/printk_ringbuffer_kunit_test.c | 17 +++++++++++------
> >  1 file changed, 11 insertions(+), 6 deletions(-)
> > 
> > diff --git a/kernel/printk/printk_ringbuffer_kunit_test.c b/kernel/printk/printk_ringbuffer_kunit_test.c
> > index 4081ae051d8e..9f79bc91246e 100644
> > --- a/kernel/printk/printk_ringbuffer_kunit_test.c
> > +++ b/kernel/printk/printk_ringbuffer_kunit_test.c
> > @@ -227,9 +227,12 @@ static void test_readerwriter(struct kunit *test)
> >  	struct prbtest_thread_data *thread_data;
> >  	struct prbtest_data *test_data;
> >  	struct task_struct *thread;
> > -	cpumask_t test_cpus;
> > +	cpumask_var_t test_cpus;
> >  	int cpu, reader_cpu;
> >  
> > +	if (alloc_cpumask_var(&test_cpus, GFP_KERNEL))
> > +		return;
> 
> IMO this shouldn't fail silently and instead should do:
> 
> KUNIT_FAIL_AND_ABORT(test, "Unable to allocate cpumask");

Also we need to call kunit_add_action_or_reset() to free the mask
when the test fails (aborts) instead of the free_cpumask_var() below.

The following changes on it top of this patch worked for me:

diff --git a/kernel/printk/printk_ringbuffer_kunit_test.c b/kernel/printk/printk_ringbuffer_kunit_test.c
index 9f79bc91246e..850e5240222c 100644
--- a/kernel/printk/printk_ringbuffer_kunit_test.c
+++ b/kernel/printk/printk_ringbuffer_kunit_test.c
@@ -203,6 +203,7 @@ static int prbtest_reader(struct prbtest_data *test_data, unsigned long timeout_
 	return 0;
 }
 
+KUNIT_DEFINE_ACTION_WRAPPER(prbtest_cpumask_cleanup, free_cpumask_var, cpumask_var_t);
 KUNIT_DEFINE_ACTION_WRAPPER(prbtest_kthread_cleanup, kthread_stop, struct task_struct *);
 
 static void prbtest_add_kthread_cleanup(struct kunit *test, struct task_struct *kthread)
@@ -229,9 +230,11 @@ static void test_readerwriter(struct kunit *test)
 	struct task_struct *thread;
 	cpumask_var_t test_cpus;
 	int cpu, reader_cpu;
+	int err;
 
-	if (alloc_cpumask_var(&test_cpus, GFP_KERNEL))
-		return;
+	KUNIT_ASSERT_TRUE(test, alloc_cpumask_var(&test_cpus, GFP_KERNEL));
+	err = kunit_add_action_or_reset(test, prbtest_cpumask_cleanup, test_cpus);
+	KUNIT_ASSERT_EQ(test, err, 0);
 
 	cpus_read_lock();
 	/*
@@ -279,8 +282,6 @@ static void test_readerwriter(struct kunit *test)
 	prbtest_reader(test_data, runtime_ms);
 
 	kunit_info(test, "completed test\n");
-
-	free_cpumask_var(test_cpus);
 }
 
 static struct kunit_case prb_test_cases[] = {


Arnd, could you pleae send v2 with the above changes?

Best Regards,
Petr
