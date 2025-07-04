Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14F32877C7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623624; cv=none; b=D/UE2vr5MxLSRHDD+DpFNngUrlL5uopCEMHGo1A0Q+FuZP2l9EfjdnJ6QK5Uzzhi3p6I7ZSk772xNiW5/7OfIwSkbbE+JMOcw7yd+cK3s+JrUJiD0XwgjdsOfQSuhfofMh79YOjB/zXBnji+PwBqE9vIhvIpzb6FCt4gNaNvKZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623624; c=relaxed/simple;
	bh=LkAUB9v0ZLbmyeqpnVoUP1Fmidj427Eikm9O+EusqQk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H46Iyf0QnXgkEEGAAi5mg3GXGLT5WMXgoeFOdcPoIMtPDrT0FfSee1WugF3cipfjWJ8PE623s/qbNn59oFHNceCh4BRLMddPQ41gKhGlA0P7YolSdM/9DG39DrbJrBdMIlVplrAo/W3L2abD5XGKnbcvFUHdASMsFLtXYl2OmL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RARjEQ0R; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RARjEQ0R"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55502821bd2so880160e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751623621; x=1752228421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GBpUAXpUHK8L0O5x/PSZEh+Eg1La3x1VdaMrEDGAIBg=;
        b=RARjEQ0RR7mZSBZTRmJSf6WPFgwX4eOk3Som15iQY7mXva1kxTjB6IYopLcMddtrRK
         85W4KCicU8UCNbjSBolnyRtZnn6vl7oND/XlJS6EvZHazeNO4jY70js1TqptGs3cr5V+
         84ZBvXRqfl7Yn6x/u9f47TSTgFxDVT1s4XN8ZvIGkXJeFfyLn88M3PY5mQJkF6nGhYFH
         KIjSA6ghT5KAHQ9lIoMKsEkktv540HKQ4EMP+qxIwu5YzCMA6vvgBBRcLZzYG3C5YOUZ
         ecEZ3TnRgy4qn9f74Kr+f6MdpRT8rtegHgykym2HYTOu9A3OmuA87bS8mB2xnbeMJjBT
         uJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751623621; x=1752228421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBpUAXpUHK8L0O5x/PSZEh+Eg1La3x1VdaMrEDGAIBg=;
        b=Zd+tqVbssYzeyiu1LA7a2EvkN3Pmtpel5/12xvUYi54MTPfqREE/tjove+/hkuYzlu
         Jeb5qC/Wyn6ST9kPt5bmMyvOo7ZJna/c/vRbQF5Eo47AXJ1zpPsViUva5w4NlUtCgNn2
         h2WuqiPKTknVeyDotXmAYNXFPuqTorTTC3RLoLJ+CFbZSLQoiU/tAaZ/8qJoQyYJoo6M
         gKXpVWm8rDvIWMjIjBxw8ryIrqleZSsWMtMWrvDJ3/0L9wxNXK8WGeQATRWeArZaRBSi
         9jRuszJFEHyGBIeX3q57me4hd+uW2pLIuE8AEWf7upEFZ2y2i/m5WyTAD125HvI+jNPd
         AGww==
X-Forwarded-Encrypted: i=1; AJvYcCXMakTlGsQ+4NwFh2LuyxYdzWF6pCFan+ya3St1uRZO67elNMMGjjI9dMWIUm87AOMuUnJEzJO97QxdcS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc0au/qJq+wDejRwBTd0xyuxIbNVfMhfrVDlUUcBkRSmgPxpn3
	uZL6YUMEVXAtPsJBOMvgsvK8jB4VVqlI1wbkNZ8nxKNKXgMPwimKGX/t
X-Gm-Gg: ASbGncuzO4uFg7fH0Okwhi6pM6gdfTAWM/iJMLdjjEsMEpx4PvRJcFZUQmNrt9tIWD2
	0Fxd+UIzY77JjXr4XW1Cg4ImeG6d155/xg4r54MUz5jDQ1x0A4IP6pHeyDxFRgLNlA+1fqApbY8
	USXr1eKh/+E+QWdHFyUeIU7il1IpCVSavg5aU9mjOhvBTmcq14AgcayjGN2VPGRcXAWa6qY1F86
	/kBBVuJOWBLRy3QwQkePvidO9TZL5azH4rLc+wd1jOwDyg9o2r4JY8SO/XpLMzWOk/V4gcnxiNV
	JLa6QwZktdBmJg3wu2crvn8OvuVitZ+rbhtMJnnOH4NOoFYzj3gW7/HWi9b0+lFRWP9wY4GAgyT
	Pz5tu0pVOqj6acg==
X-Google-Smtp-Source: AGHT+IFbHYwsnJG/zAoff3r3kG9W1cPaInyvNJ/r1hgcQ3EPqYgv6jIk4fD2RQezZhgJLjqbHip+1w==
X-Received: by 2002:a05:6512:ac8:b0:553:3028:75ae with SMTP id 2adb3069b0e04-556de076273mr643698e87.46.1751623620593;
        Fri, 04 Jul 2025 03:07:00 -0700 (PDT)
Received: from pc636 (host-78-77-210-196.mobileonline.telia.com. [78.77.210.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384943aasm205546e87.111.2025.07.04.03.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 03:06:59 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 4 Jul 2025 12:06:57 +0200
To: Raghavendra K T <raghavendra.kt@amd.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] lib/test_vmalloc.c: introduce xfail for failing tests
Message-ID: <aGenwXvHCnOH2QBC@pc636>
References: <20250702064319.885-1-raghavendra.kt@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702064319.885-1-raghavendra.kt@amd.com>

On Wed, Jul 02, 2025 at 06:43:19AM +0000, Raghavendra K T wrote:
> The test align_shift_alloc_test is expected to fail.
> Reporting the test as fail confuses to be a genuine failure.
> Introduce widely used xfail sematics to address the issue.
> 
> Note: a warn_alloc dump similar to below is still expected:
> 
>  Call Trace:
>   <TASK>
>   dump_stack_lvl+0x64/0x80
>   warn_alloc+0x137/0x1b0
>   ? __get_vm_area_node+0x134/0x140
> 
> Snippet of dmesg after change:
> 
> Summary: random_size_align_alloc_test passed: 1 failed: 0 xfailed: 0 ..
> Summary: align_shift_alloc_test passed: 0 failed: 0 xfailed: 1 ..
> Summary: pcpu_alloc_test passed: 1 failed: 0 xfailed: 0 ..
> 
> Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
> ---
>  lib/test_vmalloc.c | 36 +++++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> index 1b0b59549aaf..649f352e2046 100644
> --- a/lib/test_vmalloc.c
> +++ b/lib/test_vmalloc.c
> @@ -396,25 +396,27 @@ vm_map_ram_test(void)
>  struct test_case_desc {
>  	const char *test_name;
>  	int (*test_func)(void);
> +	bool xfail;
>  };
>  
>  static struct test_case_desc test_case_array[] = {
> -	{ "fix_size_alloc_test", fix_size_alloc_test },
> -	{ "full_fit_alloc_test", full_fit_alloc_test },
> -	{ "long_busy_list_alloc_test", long_busy_list_alloc_test },
> -	{ "random_size_alloc_test", random_size_alloc_test },
> -	{ "fix_align_alloc_test", fix_align_alloc_test },
> -	{ "random_size_align_alloc_test", random_size_align_alloc_test },
> -	{ "align_shift_alloc_test", align_shift_alloc_test },
> -	{ "pcpu_alloc_test", pcpu_alloc_test },
> -	{ "kvfree_rcu_1_arg_vmalloc_test", kvfree_rcu_1_arg_vmalloc_test },
> -	{ "kvfree_rcu_2_arg_vmalloc_test", kvfree_rcu_2_arg_vmalloc_test },
> -	{ "vm_map_ram_test", vm_map_ram_test },
> +	{ "fix_size_alloc_test", fix_size_alloc_test, },
> +	{ "full_fit_alloc_test", full_fit_alloc_test, },
> +	{ "long_busy_list_alloc_test", long_busy_list_alloc_test, },
> +	{ "random_size_alloc_test", random_size_alloc_test, },
> +	{ "fix_align_alloc_test", fix_align_alloc_test, },
> +	{ "random_size_align_alloc_test", random_size_align_alloc_test, },
> +	{ "align_shift_alloc_test", align_shift_alloc_test, true },
> +	{ "pcpu_alloc_test", pcpu_alloc_test, },
> +	{ "kvfree_rcu_1_arg_vmalloc_test", kvfree_rcu_1_arg_vmalloc_test, },
> +	{ "kvfree_rcu_2_arg_vmalloc_test", kvfree_rcu_2_arg_vmalloc_test, },
> +	{ "vm_map_ram_test", vm_map_ram_test, },
>  	/* Add a new test case here. */
>  };
>  
>  struct test_case_data {
>  	int test_failed;
> +	int test_xfailed;
>  	int test_passed;
>  	u64 time;
>  };
> @@ -444,7 +446,7 @@ static int test_func(void *private)
>  {
>  	struct test_driver *t = private;
>  	int random_array[ARRAY_SIZE(test_case_array)];
> -	int index, i, j;
> +	int index, i, j, ret;
>  	ktime_t kt;
>  	u64 delta;
>  
> @@ -468,11 +470,14 @@ static int test_func(void *private)
>  		 */
>  		if (!((run_test_mask & (1 << index)) >> index))
>  			continue;
> -
>  		kt = ktime_get();
>  		for (j = 0; j < test_repeat_count; j++) {
> -			if (!test_case_array[index].test_func())
> +			ret = test_case_array[index].test_func();
> +
> +			if (!ret && !test_case_array[index].xfail)
>  				t->data[index].test_passed++;
> +			else if (ret && test_case_array[index].xfail)
> +				t->data[index].test_xfailed++;
>  			else
>  				t->data[index].test_failed++;
>  		}
> @@ -576,10 +581,11 @@ static void do_concurrent_test(void)
>  				continue;
>  
>  			pr_info(
> -				"Summary: %s passed: %d failed: %d repeat: %d loops: %d avg: %llu usec\n",
> +				"Summary: %s passed: %d failed: %d xfailed: %d repeat: %d loops: %d avg: %llu usec\n",
>  				test_case_array[j].test_name,
>  				t->data[j].test_passed,
>  				t->data[j].test_failed,
> +				t->data[j].test_xfailed,
>  				test_repeat_count, test_loop_count,
>  				t->data[j].time);
>  		}
> -- 
> 2.43.0
> 

Reviewed-by: "Uladzislau Rezki (Sony)" <urezki@gmail.com>

--
Uladzislau Rezki
