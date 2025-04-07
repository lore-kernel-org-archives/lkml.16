Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9999E3FB0E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033557; cv=none; b=k+AxD4KM1Y3jBQn4tCI1jhx9CtKduSM/cvTpD99mkJZ7wDKsAGGRzEVOT85jHKhR4SZ5qwjYnFyo9R30kxiAVobq3NBf5E11QcCNvoG+4NeOoDUszwfh5+1qpgoQd/POB/zprF2+HuU8rsPfewZ0Zq5bIkWZ7TXMxU/6MyeNeeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033557; c=relaxed/simple;
	bh=wBZH5iAFwW7ArNMczcU5Wr8pTX9IBSGe5V6n0W1eMyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgOC+d6+ZA0lO+z+QIlPEWNYBXqqMsXs6EUzhNH1Olebqn0JmH2sqsvjmqKFIOQBe+7wn09skW2itLAWKl2QOHkqPlu/ZVghYwKwLZMDzuI96A/7DWDSg3/ob/Zd2FbLYsmbhMiTShuTC612loRrZS2RI3HEGhUNGMY8Kh6n0+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Zxlwoub1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Zxlwoub1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso48333955e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744033554; x=1744638354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mmI/GUCyaMoVDShjSc3OzomwLudeRUjOXZtn/UkzEJ0=;
        b=Zxlwoub1nw7MRCr5WddlQUj0F2cX/pufvDREj229C0xJ1vgu4weVHF4koEe1EyDXwv
         papbNZXx1R132nP4HOKDDSYXy7ebH7fok89//EDVzgD3AykBL5ocM9xhOTUX/vDVh/zf
         zvW5gLSMLIOAzSKhHAq4aq6CWxCtNJBT88e8pirL90F0J1x2F3M8A8li5Ezq14yrJ8oX
         1kTrbKha398uzgf1W8/i7q5KY1L2aXvcvJIzdCM9RqFgJDYdU8ugIUt9qwaQXJGRcBCd
         84TgCjxaVmCQvx/s8eask1z0TKcot8+FfV7AJZpYEPVFt2N/5jrQvRsNHwpCo9NqZRbK
         bnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744033554; x=1744638354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmI/GUCyaMoVDShjSc3OzomwLudeRUjOXZtn/UkzEJ0=;
        b=RBkfdjljAPu7uXY2rg3lmhlvJeQ9TRpR8XQMZx7wBK7amB64PJREoW/9Isotp48UEP
         RNSYMBZhweTRhYce2Eez/OMxL574RAbh2xCpvm+yWDC2bio4nbdXNRjYKbJbfnn/XSOG
         LNssh1xW6Jm2EsS9ZsSmcXC7yn6oL1IKwJQOiYlhmpIMv/DzchJTAoX81q3Thb+1ZVg5
         1q9afSCdMj+TsNf6UGPSt6tvEBqPx3VrgHTrjgm32Bj58ms387wCLegowpzpZjRo4e1f
         KaBE63p+2fbZVqGLRWVfxZa5moS/70IP4uLZlsII/6YdyF5ENZUTWWsL+APydNQdRb/l
         FB5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXv5Mn3hjHvY5t31aJ0OtmgMiW9KzCcs5zp2RECrDNebXdU9Bem9JaxfWsdNACP8dxZ14ORDl9PXA9wJdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy05P5lofq00xN3/7lwXy8lteFiZ0c/hprSWvq9nMDt1r4xg0/P
	VG/iiL0FSRl2G5xD6/pQOW8XWpiqn3XFtmTJA8xMgnyHa0Kin/gQ416YhGZezS8=
X-Gm-Gg: ASbGncuP1j+3+WQiDlBnPLQ8JY6tgsG0RQ+aiqO17vTb1OKxOkjPKrz54aTdaXIHSIj
	zpJP3RRxxoauR30xYlc0wg+4epqu7PBt8ZI483tRhJ6V3vWrpWjwYRI5HMCbSM5RMZfKQ1EwKz/
	SCpkEAYVm/n3VHXT8RCrK9KnMs15mSG0dcVHxXoGx8iIC+X4WeeeQhcBOr41CawwEZM4986BbC6
	zucXEnKXO9So4KRvKN3+xF7hisaN1NhgSh36ZywIyNly+8DeGARof517x/OLGFwIlXZI6mdnxjH
	P1CkS6GcVCrAyv+G7mcM4B6dNdrtUmON
X-Google-Smtp-Source: AGHT+IEHHsM5wqpNmF0qGu29jIMUNH0eRndhQgivRLY4H5xraCW/gKyTvq3ExPsg6IGAXRyht4DQzQ==
X-Received: by 2002:a05:600c:1d16:b0:43d:45a:8fbb with SMTP id 5b1f17b1804b1-43ed0d98e7cmr100660895e9.22.1744033553925;
        Mon, 07 Apr 2025 06:45:53 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0dbesm134131445e9.33.2025.04.07.06.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:45:53 -0700 (PDT)
Date: Mon, 7 Apr 2025 15:45:52 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, alex@ghiti.fr, 
	Anup Patel <apatel@ventanamicro.com>, corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250407-63092ceb505ad536d8f1394e@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVEp2_ho51gkpLLJG2HimqZ1gZ0fa=JA4uNNZjFFqaPMg@mail.gmail.com>

Hi Geert,

On Mon, Apr 07, 2025 at 11:49:59AM +0200, Geert Uytterhoeven wrote:
> Hi Andrew,
> 
> On Tue, 4 Mar 2025 at 13:02, Andrew Jones <ajones@ventanamicro.com> wrote:
> > Allow skipping scalar and vector unaligned access speed tests. This
> > is useful for testing alternative code paths and to skip the tests in
> > environments where they run too slowly. All CPUs must have the same
> > unaligned access speed.
> >
> > The code movement is because we now need the scalar cpu hotplug
> > callback to always run, so we need to bring it and its supporting
> > functions out of CONFIG_RISCV_PROBE_UNALIGNED_ACCESS.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks for your patch, which is now commit aecb09e091dc1433
> ("riscv: Add parameter for skipping access speed tests") in
> v6.15-rc1.
> 
> > --- a/arch/riscv/kernel/unaligned_access_speed.c
> > +++ b/arch/riscv/kernel/unaligned_access_speed.c
> 
> >  static int __init check_unaligned_access_all_cpus(void)
> >  {
> >         int cpu;
> >
> > -       if (!check_unaligned_access_emulated_all_cpus())
> > +       if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
> > +           !check_unaligned_access_emulated_all_cpus()) {
> >                 check_unaligned_access_speed_all_cpus();
> > -
> > -       if (!has_vector()) {
> > +       } else {
> > +               pr_info("scalar unaligned access speed set to '%s' by command line\n",
> > +                       speed_str[unaligned_scalar_speed_param]);
> >                 for_each_online_cpu(cpu)
> > -                       per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > -       } else if (!check_vector_unaligned_access_emulated_all_cpus() &&
> > -                  IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> > +                       per_cpu(misaligned_access_speed, cpu) = unaligned_scalar_speed_param;
> > +       }
> > +
> > +       if (!has_vector())
> > +               unaligned_vector_speed_param = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
> > +
> > +       if (unaligned_vector_speed_param == RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN &&
> > +           !check_vector_unaligned_access_emulated_all_cpus() &&
> > +           IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
> >                 kthread_run(vec_check_unaligned_access_speed_all_cpus,
> >                             NULL, "vec_check_unaligned_access_speed_all_cpus");
> > +       } else {
> > +               pr_info("vector unaligned access speed set to '%s' by command line\n",
> > +                       speed_str[unaligned_vector_speed_param]);
> > +               for_each_online_cpu(cpu)
> > +                       per_cpu(vector_misaligned_access, cpu) = unaligned_vector_speed_param;
> >         }
> 
> On RZ/Five:
> 
>     vector unaligned access speed set to 'unsupported' by command line
> 
> However, this is not set on my command line?
> 
> Apparently this can be set using three different methods:
>   1. It is the default value in the declaration of vector_misaligned_access,
>   2. From the handle_vector_misaligned_load() exception handler,
>   3. From the command line.
> Hence the current kernel message is rather confusing...

Thanks for the report.

The three ways above are OK, since (1) sets it to 'unknown' which means
"not yet set" (by command line or otherwise), (2) doesn't actually touch
unaligned_vector_speed_param, just its per-cpu counterpart. And the
message applies to (3). However, there's a (4) which I added without
considering the message and that's the 'if (!has_vector())' part of the
hunk above, which sets 'unsupported', as you're seeing, when vector is
not present.

I'll send a patch that ensures we only get the message for truly command
line set states.

Thanks,
drew
