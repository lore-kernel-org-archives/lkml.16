Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AFE2DCF52
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751623563; cv=none; b=SLg95sOjGgz1iKtXpfjEPgQLO3BpicyvD3XdjBEz/ZJm3RwyAXR2WFSZlrpvpaixDpCekdj6ZGjL3/KDPCQ1CjWSz1R1sboonGCXAmC2TE25nPpwjHeEJqm5/QGawgS7Euj9XrAZsGe+DrSCFwAYqOwPbS25mnrK/N6SMcR5Kpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751623563; c=relaxed/simple;
	bh=71dc6JLkityvq4AqEmB4pVwCiA8FHv66RqjPW1eJvUk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8ijcLkMWMB2FkLkIP7f8eEjeqa3xRDgZnFhWaFIEQUTfuAa6A8aFbqVfcSLpbHtk2ay2SkcS5yTZb6nEziimQsUXVZoefTGrxCrJjFqY5N2qLLb7G6MoYHCJ4or78FzPpgv3rCj7z5HVvJRDGKsEP3H9d/OwAbaLi6ShAnhAmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RK2j9pd3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RK2j9pd3"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55502821bd2so879120e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751623560; x=1752228360; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dcL/QQv0v6PsTVP/Yd2c+lopgAA2CTPotWFkTnuxIZk=;
        b=RK2j9pd3LOniUkoayQBUdGRPTLAR/8Mt4Px9Ow2JqDjtmWW8lkLwabb9jSCe+hH+pw
         pIrN7bJt0ET1xT0Fcm5VeHzAl+dcHiwf5nTxNbkEqh5tImTwLMb4g/Ndz5aUCARfgC+F
         Xh1U+pYECyxiRsVdIopeI6CJpBScUG6K+Ya0Cc2LncfjQnLF7LDBZqHb6aqBKakFWun4
         tPVjBT0LyMyyleLIl0vlq/cXceAMl/TCZ8dfE31FQCC0QAMkost/VYMPhk8MLyRofzUW
         2L+HVAaF1eM3nRpgIws9bOmr4cHZ/BpSTYZ/E1gFmxg0FBkDIrSC/y2M5PjKRAeq+GmO
         f8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751623560; x=1752228360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcL/QQv0v6PsTVP/Yd2c+lopgAA2CTPotWFkTnuxIZk=;
        b=Zwr9sCmKJ8T8JbTEYKRB2R9kiviO1NvDJsIrYmsKY+iOZm+H0yMVyqPZb0Vlkjai7p
         lrxw03AOXUj012t+xs3sSgF8VYQFzk4J6Y2QYaNeOARitFHHS+HyC3YcSE268uW9Om7s
         8yW/IMLiBVsbQ5OIvv9cVMP+0UhH+wDXgdNRjSowQgJ+eEi/1zsz9k0CUzzaaJJzVl7p
         RrWfJxlAkCZxuMwA0BdcZ1hjudlkX1FrOGIoALMm1AQnI/Ejx/gwRbc59T/Fybfg4xd6
         zgiFpC+JfuQpO+YTPzvz6V0IYFF71l4kDp1d7Zjb8j/PhSNyid584Ng/vaQXqlXOCh8H
         pjhw==
X-Forwarded-Encrypted: i=1; AJvYcCUMGIvBjNzRK8RUKVihP8T0S2RlkVCZs0SKLTjcR5BnJ6XHnyVTTt7wEvv/MGUOTMNl4/+Mtnqg9L3TmvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKpSrTA3c5IP4R9BxovxirFHQMtQwKOsWWZcEAgfICyHn4vLuQ
	M93D4tQvJMvvcpunNRjkCh3o0PaX3fT7I2ZNn2GGkEjJ/5juYYg5uXuCDrD+Jw==
X-Gm-Gg: ASbGncstYZaJbb31bnrRXd4jCXLCE2ChOnnmz8+848ISP2VK9UYdPKP/Nex5N59UkQc
	Te0i/gsWtKJoBc5RZWD2gf3xIAv6EcqApbtRtplezdiCsxOH4YJs3D33Q69K2+2seQx6CRSs2my
	xW6BPGarSxD6RqwNkQl2GtHplsseSMD/T7MJYmZzIWmeMiXazZSGDwf0Pr1LP5TvFjZHkckS9Kx
	9AsrgNOt9cxZ1iDTR2mygG54voSXWae68ISYLPo4qMJFDqZmdobqwVk0aLqIZdWrVOdqBA8LX38
	eBPc+4MttpErIGBfcD1fjmvGcJUp/5dVMluiJ8DGBGxkEpGf2vBJCTafFoWGWIldE3cpPWqT4N/
	Z14nVcqEZxq+uSA==
X-Google-Smtp-Source: AGHT+IFvpYCtGG5n2rvYiQTV9df6qhwb3okjDIjubuUdvRt1MOGH/ylKO+3O8AH7k8mMH0IPufBlXQ==
X-Received: by 2002:a05:6512:12c4:b0:553:314e:81f7 with SMTP id 2adb3069b0e04-556dbd9640dmr605375e87.17.1751623559489;
        Fri, 04 Jul 2025 03:05:59 -0700 (PDT)
Received: from pc636 (host-78-77-210-196.mobileonline.telia.com. [78.77.210.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baf64sm209380e87.36.2025.07.04.03.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 03:05:58 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Fri, 4 Jul 2025 12:05:56 +0200
To: Raghavendra K T <raghavendra.kt@amd.com>
Cc: urezki@gmail.com, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH] lib/test_vmalloc.c: introduce xfail for failing tests
Message-ID: <aGenhKOjXq6FTsTo@pc636>
References: <20250702064319.885-1-raghavendra.kt@amd.com>
 <8adf60ed-91ed-4469-86ae-59e8e30bc6ed@arm.com>
 <1ffe2e4d-88f2-4e2f-8888-8cb278f1cc28@amd.com>
 <980a1569-cdae-4343-bd94-4fb2ea6e247b@arm.com>
 <f2dcafff-1be7-461f-baab-020f8a06b351@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2dcafff-1be7-461f-baab-020f8a06b351@amd.com>

Hello, Raghavendra!

> 
> On 7/2/2025 1:43 PM, Dev Jain wrote:
> > 
> > On 02/07/25 1:38 pm, Raghavendra K T wrote:
> > > 
> > > 
> > > On 7/2/2025 12:18 PM, Dev Jain wrote:
> > > > 
> > > > On 02/07/25 12:13 pm, Raghavendra K T wrote:
> > > > > The test align_shift_alloc_test is expected to fail.
> > > > > Reporting the test as fail confuses to be a genuine failure.
> > > > > Introduce widely used xfail sematics to address the issue.
> > > > > 
> > > > > Note: a warn_alloc dump similar to below is still expected:
> > > > > 
> > > > >   Call Trace:
> > > > >    <TASK>
> > > > >    dump_stack_lvl+0x64/0x80
> > > > >    warn_alloc+0x137/0x1b0
> > > > >    ? __get_vm_area_node+0x134/0x140
> > > > > 
> > > > > Snippet of dmesg after change:
> > > > > 
> > > > > Summary: random_size_align_alloc_test passed: 1 failed: 0 xfailed: 0 ..
> > > > > Summary: align_shift_alloc_test passed: 0 failed: 0 xfailed: 1 ..
> > > > > Summary: pcpu_alloc_test passed: 1 failed: 0 xfailed: 0 ..
> > > > > 
> > > > > Signed-off-by: Raghavendra K T <raghavendra.kt@amd.com>
> > > > > ---
> > > > 
> > > > Thanks for doing this, been thinking about this for so long but
> > > > I'm lazy : )
> > > 
> > > :)
> > > 
> > > > 
> > > > >   lib/test_vmalloc.c | 36 +++++++++++++++++++++---------------
> > > > >   1 file changed, 21 insertions(+), 15 deletions(-)
> > > > > 
> > > > > diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> > > > > index 1b0b59549aaf..649f352e2046 100644
> > > > > --- a/lib/test_vmalloc.c
> > > > > +++ b/lib/test_vmalloc.c
> > > > > @@ -396,25 +396,27 @@ vm_map_ram_test(void)
> > > > >   struct test_case_desc {
> > > > >       const char *test_name;
> > > > >       int (*test_func)(void);
> > > > > +    bool xfail;
> > > > >   };
> > > > >   static struct test_case_desc test_case_array[] = {
> > > > > -    { "fix_size_alloc_test", fix_size_alloc_test },
> > > > > -    { "full_fit_alloc_test", full_fit_alloc_test },
> > > > > -    { "long_busy_list_alloc_test", long_busy_list_alloc_test },
> > > > > -    { "random_size_alloc_test", random_size_alloc_test },
> > > > > -    { "fix_align_alloc_test", fix_align_alloc_test },
> > > > > -    { "random_size_align_alloc_test", random_size_align_alloc_test },
> > > > > -    { "align_shift_alloc_test", align_shift_alloc_test },
> > > > > -    { "pcpu_alloc_test", pcpu_alloc_test },
> > > > > -    { "kvfree_rcu_1_arg_vmalloc_test",
> > > > > kvfree_rcu_1_arg_vmalloc_test },
> > > > > -    { "kvfree_rcu_2_arg_vmalloc_test",
> > > > > kvfree_rcu_2_arg_vmalloc_test },
> > > > > -    { "vm_map_ram_test", vm_map_ram_test },
> > > > > +    { "fix_size_alloc_test", fix_size_alloc_test, },
> > > > > +    { "full_fit_alloc_test", full_fit_alloc_test, },
> > > > > +    { "long_busy_list_alloc_test", long_busy_list_alloc_test, },
> > > > > +    { "random_size_alloc_test", random_size_alloc_test, },
> > > > > +    { "fix_align_alloc_test", fix_align_alloc_test, },
> > > > > +    { "random_size_align_alloc_test", random_size_align_alloc_test, },
> > > > > +    { "align_shift_alloc_test", align_shift_alloc_test, true },
> > > > > +    { "pcpu_alloc_test", pcpu_alloc_test, },
> > > > > +    { "kvfree_rcu_1_arg_vmalloc_test",
> > > > > kvfree_rcu_1_arg_vmalloc_test, },
> > > > > +    { "kvfree_rcu_2_arg_vmalloc_test",
> > > > > kvfree_rcu_2_arg_vmalloc_test, },
> > > > > +    { "vm_map_ram_test", vm_map_ram_test, },
> > > > >       /* Add a new test case here. */
> > > > >   };
> > > > 
> > > > Why this change?
> > > 
> > > Perhaps not entirely necessary except for align_shift_alloc_test line,
> > > still updated the field since one more bool field added. But let me know
> > > if you are okay with current state OR need a respin for that?
> > 
> > Oh now I saw the "true", I thought you were adding commas for no reason.
> > 
> > I think that's fine then, but will let Uladzislau decide.
> > 
> > 
> 
> Uladzislau,
> 
> Do you think this patch would be useful? and above change is okay?
> 
Sorry, i missed this. Yes, i think it makes sense since it confuses
people.

--
Uladzislau Rezki
