Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8952F5B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745993284; cv=none; b=oHqZuVSmoIWjr4jk4B6Zle2XbpUQJiW3HahagmJDkYrfLj6MjQag3FzSLAR8JwL7pw+/4RkT7CY0NqA8ybfEzoR0yS0rhOCQVqTHrImhLSiWtgAmsnL/eI+C457akvj58PFSKQ5/JwMTNnDlh7VjkOtA2WVm7iMqGc0mVV7BIbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745993284; c=relaxed/simple;
	bh=WLrKShrD/UNanQL9J/Hib1fxOHOLAsJ1MKbfF6faAk4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=i2GHVL3Dr1nsFM4MBKBfWoRnGsI27+nfab8W/THXC3P40OcD7QnbpwsZFpnKspUG+GcWgdm9ZurENCwkr3pywlU5J/azE8DEsD2PHgesdIuqA3RygUqtC1GU58y+XuWjXd93eoN5kiDHhusfgS1TAxF0BgSPST8/Dng4znyGBrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pNPev/h8; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pNPev/h8"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2cc57330163so4592669fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745993280; x=1746598080; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xTDOOCJA/zMwj3eZag1BznfEtGsyRX88K8qUr0aWX+k=;
        b=pNPev/h8ZpnzXDrbiIOmd9s7lJ0nJ6CF9ZBrBcW9pjpYzix3HjL61rGmiQZeB8s2LC
         +mOYYJj+c09WH3SVo2MGU3jjgUsT8xY0T803P4m6yfQOuoUiWhDlOqRzqriWqSfbPyYL
         y1gCtZNm8hcSrzX6zy4xhaF2ussbI5/Zf3lvi9VEsXF4TUJoFaeARsScwSY3vFzXuuW1
         X7/YjGqEA/Wlmjx++lpj4z3b9theO5OGnM71ijFqZtO4VUM8meflwFadcyBp8Mjw7aCd
         CBZtM3wLKXXvLqmysH22/6BlmaaLh+ECa78oplPwDNEnxuteEaIF7xZmXmpzvvtU3ToY
         Kazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745993280; x=1746598080;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTDOOCJA/zMwj3eZag1BznfEtGsyRX88K8qUr0aWX+k=;
        b=PxloXDJhAAwGFmGDK42PPALoaL3HeTYQhsN/j7sxrr2nIgfGnwkmse7Ne1yyKz/R+3
         +zhzbMkvJK1z9xLNVQha3M3nMZcLQehcuMHJZ1iOPoc0jIrcaXEya7XHEPr0OHrernpa
         KWi4uNTAVrEUJPrSxcNDxezJHRgoLPR51pjiz433a25l7jJC31+LJmqX4KRqBqdm7Uam
         m1ZioViJOJs/wOrLNZyNT72BeRdsN2pQrbVcqPgg775Pdrz9/WAt0lJTKqhJvN0yAZTQ
         BFIUizJnYLr7f0kFrXDX4R99TEX9kwEGQqCS/pfXxbXdPG+YPYxi3StnQq6KAVOPG5YG
         stVg==
X-Forwarded-Encrypted: i=1; AJvYcCWU1wsCx3mbjQmX76F1zdiexvWWRbNSq00k1XxEzyDZSLw02YS70SZGR+fOq5urBPryiLkmrgZ49CXLICA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEaIjQmx6+vHgvMOS5rWRINkVvS7U23Rw7e77kWujDW3pUHlI/
	X4dJcIRQpWU6+snTwzulcLwUf4MsvGLqP2R1KF3yeJPxdL2HDen15VTP+V4vXz9ZtHVVIWWxMgN
	zOA==
X-Gm-Gg: ASbGncseN9qmoOHrU1e2IJlvEHWk0ynsjj2r6gjBLbkBIfH1XvJkZlsZaalU71nSs2W
	6JcNo243Arl0tIjCHLZ8dfOhacNNcJtqL04mYYijHCz11jPxMWwHjZR53hL49JlEozmePAUVEJW
	ihw0tf4gSdATvc53c0DmemX2I9MA/rPz1ewEWkxFl6uXeAUCgIU7bIZyElR2spTJcYHah3VhydU
	F6hvnB4zfWCY5U9N/uGHYX6R3WsZ1aU1XhfKka0mM5/IaBsL1XUcmnbXLc0b4FFY6NBc/8wfOa/
	Wo7s+MH9VSnFRRnHsTojemH3pa3mEZ+ivEoaVIaJnxkjKIZiurzSQyIV6ksT/s4junvbJw42p83
	FVDmj16hr3nB5r2swpfqt9cu8
X-Google-Smtp-Source: AGHT+IGVOIMxt69+Zsy7YoJTdQ0SrYLAyMoARsxJuRR0fLkQr69u2GheXlJtlosBxbwh91y4ADFl3w==
X-Received: by 2002:a05:6870:890a:b0:2bc:6675:2043 with SMTP id 586e51a60fabf-2da69da3f5bmr1032024fac.14.1745993280460;
        Tue, 29 Apr 2025 23:08:00 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2da6e0523edsm263375fac.4.2025.04.29.23.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:07:58 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:07:45 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Peter Zijlstra <peterz@infradead.org>
cc: Jani Nikula <jani.nikula@linux.intel.com>, 
    "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
    "luto@kernel.org" <luto@kernel.org>, 
    "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
    "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
    "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, 
    "Saarinen, Jani" <jani.saarinen@intel.com>, 
    "De Marchi, Lucas" <lucas.demarchi@intel.com>, 
    "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
    Ingo Molnar <mingo@kernel.org>
Subject: Re: [REGRESSION] x86/efi: Make efi_enter/leave_mm() use the
 use_/unuse_temporary_mm() machinery (linux-next)
In-Reply-To: <20250429182904.GL4198@noisy.programming.kicks-ass.net>
Message-ID: <64dae856-e51a-9fc4-2eb4-c41c1a42c9d7@google.com>
References: <SJ1PR11MB6129E62E3B372932C6B7477FB9BD2@SJ1PR11MB6129.namprd11.prod.outlook.com> <SJ1PR11MB61293655E9386DC0FBD263F4B9852@SJ1PR11MB6129.namprd11.prod.outlook.com> <87selrwdct.fsf@intel.com> <20250429182904.GL4198@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Apr 2025, Peter Zijlstra wrote:
> On Tue, Apr 29, 2025 at 12:01:22PM +0300, Jani Nikula wrote:
> > On Thu, 24 Apr 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
> > > +Andy, Ingo
> > >
> > > Friendly reminder.
> > > Issue is still seen on latest linux-next runs.
> > >
> > > https://intel-gfx-ci.01.org/tree/linux-next/next-20250424/bat-rpls-4/boot0.txt
> > >
> > > Regards
> > >
> > > Chaitanya
> > 
> > Andy, Ingo -
> > 
> > Commit e7021e2fe0b4 ("x86/efi: Make efi_enter/leave_mm() use the
> > use_/unuse_temporary_mm() machinery") on linux-next regresses as
> > reported by Chaitanya
> > 
> > Please look into it.
> 
> Does your kernel include the below?
> 
> ---
> commit aef1d0209ddf127a8069aca5fa3a062be4136b76
> Author: Peter Zijlstra <peterz@infradead.org>
> Date:   Fri Apr 18 11:50:34 2025 +0200
> 
>     x86/mm: Fix {,un}use_temporary_mm() IRQ state
>     
>     As the function switch_mm_irqs_off() implies, it ought to be called with
>     IRQs *off*. Commit 58f8ffa91766 ("x86/mm: Allow temporary MMs when IRQs
>     are on") caused this to not be the case for EFI.
>     
>     Ensure IRQs are off where it matters.
>     
>     Fixes: 58f8ffa91766 ("x86/mm: Allow temporary MMs when IRQs are on")
>     Reported-by: Borislav Petkov (AMD) <bp@alien8.de>
>     Tested-by: Borislav Petkov (AMD) <bp@alien8.de>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
>     Cc: H. Peter Anvin <hpa@zytor.com>
>     Cc: Andrew Morton <akpm@linux-foundation.org>
>     Cc: Andy Lutomirski <luto@kernel.org>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Cc: Rik van Riel <riel@surriel.com>
>     Link: https://lore.kernel.org/r/20250418095034.GR38216@noisy.programming.kicks-ass.net
> 
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 79c124f6f3f2..39761c7765bd 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -986,6 +986,7 @@ struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm)
>  	struct mm_struct *prev_mm;
>  
>  	lockdep_assert_preemption_disabled();
> +	guard(irqsave)();
>  
>  	/*
>  	 * Make sure not to be in TLB lazy mode, as otherwise we'll end up
> @@ -1018,6 +1019,7 @@ struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm)
>  void unuse_temporary_mm(struct mm_struct *prev_mm)
>  {
>  	lockdep_assert_preemption_disabled();
> +	guard(irqsave)();
>  
>  	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
>  	cpumask_clear_cpu(smp_processor_id(), mm_cpumask(this_cpu_read(cpu_tlbstate.loaded_mm)));

Hi Peter, I haven't checked on most recent -nexts, but earlier found that
patch to be not quite enough, at least if you have CONFIG_DEBUG_VM=y:
because switch_mm_irqs_off() contains a

		VM_WARN_ON_ONCE(prev != &init_mm && !cpumask_test_cpu(cpu,
				mm_cpumask(prev)));

which doesn't like what (un)use_temporary_mm() is now doing. I couldn't
be sure who was right or wrong, and just proceeded by commenting out
the warning - ONCE shouldn't be much trouble, except xfstests uses
some nefarious mechanism to resurrect ONCE repeatedly.

Hugh
