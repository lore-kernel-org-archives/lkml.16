Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D6C194C86
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750658621; cv=none; b=CvK67A49SeLQS29gggCG85L5FGgbz8rx9NZwreiu4spo/4dp2bkFXbNeJ6U60Uj8AMLgt/JBq5KZkSkqlH/M+W+UsJ0b0pKX1lZoH//y3nQyll1E/gYuI9lzn+c5LID3YVOM+xigKyWIt28e0U59+sktJj6xlL0BmiQq6tDoD8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750658621; c=relaxed/simple;
	bh=I/QBbYGvz0nuAzDxzq2/6lcOFSZlrqciqElrf9JJ+Ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c0Ytzae6V4VqxRb3nnlymnyOwwo2J+KbTNxMMaMBGDjFTMo0lE03hetfVsEY8S6RFxSsIvshsanpZ3mOfuiUA9BIj6ISWdFUx+FpofQThkhURasrTvsdwK+GKp23ejUyu5paXdog4Jijt9BgsgP1XNKeVHk7pCIU5s0fTwZ2xQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qebDi6qg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xhm6YL9t; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qebDi6qg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xhm6YL9t"
Date: Mon, 23 Jun 2025 08:03:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750658611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5lMZuW5zS1w+m9bx653GtllDiW0+u8nSg3LigIbnczQ=;
	b=qebDi6qgdmgrjppRlXjpxBS3aRU4ETiWFbFxT3QZmKmF7udwyEN+JhzjAYBRq3KnqAx2kJ
	4242IDSMZI4smSop7D2aWmB8Mh4QlXOl6kOoPMcUmciSvhHL7GjHvIbBKn0MQ1uTkdohZQ
	qbIoLelAmMxiuRD8BwJ2Aakv1S21aA2NJ/0dMLczirHk2RZXC+wtQI05+n/pL0c6h8uomz
	ceEyYgvWFMon+QrfWxJ2uEaneJpvZStcdJpyntHkPf4+nL0dQsZPz7QkZ5xS37j4JhkbMt
	LPVn00fxVJ3UHbVi1QxKGQdlsPOvgt7pkWWfnkX+2/fLucF2hUfygT6KoG2yag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750658611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5lMZuW5zS1w+m9bx653GtllDiW0+u8nSg3LigIbnczQ=;
	b=Xhm6YL9tLMZqPyAppVY+mZp8WS0wZjhURMpDHBXhwdkfq3vfzrhvUoBuTydCp/zbd/Unj2
	6Qc5vJn5c563N3Bw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, 
	John Ogness <john.ogness@linutronix.de>, Arnd Bergmann <arnd@arndb.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk: kunit: support offstack cpumask
Message-ID: <20250623075943-44fdf86a-adcd-478c-bf78-906145678adb@linutronix.de>
References: <20250620192554.2234184-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192554.2234184-1-arnd@kernel.org>

On Fri, Jun 20, 2025 at 09:25:20PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> For large values of CONFIG_NR_CPUS, the newly added kunit test fails
> to build:
> 
> kernel/printk/printk_ringbuffer_kunit_test.c: In function 'test_readerwriter':
> kernel/printk/printk_ringbuffer_kunit_test.c:279:1: error: the frame size of 1432 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
> 
> Change this to use cpumask_var_t and allocate it dynamically when
> CONFIG_CPUMASK_OFFSTACK is set.
> 
> Fixes: 5ea2bcdfbf46 ("printk: ringbuffer: Add KUnit test")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  kernel/printk/printk_ringbuffer_kunit_test.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/printk/printk_ringbuffer_kunit_test.c b/kernel/printk/printk_ringbuffer_kunit_test.c
> index 4081ae051d8e..9f79bc91246e 100644
> --- a/kernel/printk/printk_ringbuffer_kunit_test.c
> +++ b/kernel/printk/printk_ringbuffer_kunit_test.c
> @@ -227,9 +227,12 @@ static void test_readerwriter(struct kunit *test)
>  	struct prbtest_thread_data *thread_data;
>  	struct prbtest_data *test_data;
>  	struct task_struct *thread;
> -	cpumask_t test_cpus;
> +	cpumask_var_t test_cpus;
>  	int cpu, reader_cpu;
>  
> +	if (alloc_cpumask_var(&test_cpus, GFP_KERNEL))
> +		return;

IMO this shouldn't fail silently and instead should do:

KUNIT_FAIL_AND_ABORT(test, "Unable to allocate cpumask");

> +
>  	cpus_read_lock();
>  	/*
>  	 * Failure of KUNIT_ASSERT() kills the current task
> @@ -237,15 +240,15 @@ static void test_readerwriter(struct kunit *test)
>  	 * Instead use a snapshot of the online CPUs.
>  	 * If they change during test execution it is unfortunate but not a grave error.
>  	 */
> -	cpumask_copy(&test_cpus, cpu_online_mask);
> +	cpumask_copy(test_cpus, cpu_online_mask);
>  	cpus_read_unlock();
>  
>  	/* One CPU is for the reader, all others are writers */
> -	reader_cpu = cpumask_first(&test_cpus);
> -	if (cpumask_weight(&test_cpus) == 1)
> +	reader_cpu = cpumask_first(test_cpus);
> +	if (cpumask_weight(test_cpus) == 1)
>  		kunit_warn(test, "more than one CPU is recommended");
>  	else
> -		cpumask_clear_cpu(reader_cpu, &test_cpus);
> +		cpumask_clear_cpu(reader_cpu, test_cpus);
>  
>  	/* KUnit test can get restarted more times. */
>  	prbtest_prb_reinit(&test_rb);
> @@ -258,7 +261,7 @@ static void test_readerwriter(struct kunit *test)
>  
>  	kunit_info(test, "running for %lu ms\n", runtime_ms);
>  
> -	for_each_cpu(cpu, &test_cpus) {
> +	for_each_cpu(cpu, test_cpus) {
>  		thread_data = kunit_kmalloc(test, sizeof(*thread_data), GFP_KERNEL);
>  		KUNIT_ASSERT_NOT_NULL(test, thread_data);
>  		thread_data->test_data = test_data;
> @@ -276,6 +279,8 @@ static void test_readerwriter(struct kunit *test)
>  	prbtest_reader(test_data, runtime_ms);
>  
>  	kunit_info(test, "completed test\n");
> +
> +	free_cpumask_var(test_cpus);
>  }
>  
>  static struct kunit_case prb_test_cases[] = {
> -- 
> 2.39.5
> 
