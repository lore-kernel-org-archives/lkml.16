Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12411226D0D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678570; cv=none; b=ZMgETFiQB/ko4y3hDQU0qYhjL6SphS0TjZdXzSALOCVjjn99bBKFbFCObzTzC20JoHzg5aZK5MITR6GkV9181A+7Kg6C0XjTFLu+VfFdg1o2OlT5gSNV+EKgqeuX+wGmlraAraOsGiEIFoFxLXgz3RfPhN9+1Dyiz07h2Dcj4BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678570; c=relaxed/simple;
	bh=ZFd7k3PI35/uLKQfV7Afn6XOJIuiDc+wW0uU2AMwEIM=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fb0uJWbTQYjHn0rRqo/SB0WdAzx7NtQfEZvl5Zg9N1oRxAYS5pkq1U4AksAuk29wVBIAcSHe2Nz73tKy4fakQEnzATo9q8Sr4oX7qZeMJNBlfYKinbsjOiqNvmZ8BO6lknXVoHOX6x3HjbH4LOLFAsg3Tpo1xYzahK/eJsvEHAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjIBSmUm; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjIBSmUm"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553dceb345eso4479573e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750678567; x=1751283367; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DlJHuROHmBDzciOtFdTsSex+vDj1whTc4hjnLYC1zuQ=;
        b=cjIBSmUm0JLi3UHa8eLQ91QwGWGsu+VmsGfv0uq+wdpYXasAHr6gC0/9wV3yrUVLio
         oshcqhyi+7wzC/5yvUHSB/Ltr244xAT7qnI4KYHHH31xoVetfceXxXtSLMbAhFMH4Nbt
         I/bgDLAwG8UcCh7P76Rm9+dspnBdRwnp4vhC7YVqSHNsrxYdQGYFxo38C6cDiviXyWIf
         a5j0FjczqXM0KyV15IQl47vNJG2EsIc2JktLAQc3uLMUPPA9IjvviIxkAsfSNHlPU2JU
         gmLPlZOq6X6Y5+lRkxYomCLMJ+L3FSZNLXjutETtuQyZwhbTGW8PGLOKicAB4z/vjSic
         JOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750678567; x=1751283367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DlJHuROHmBDzciOtFdTsSex+vDj1whTc4hjnLYC1zuQ=;
        b=nkUz77GnWxf7J0QM9HXSIdpDqimxemKbE53Ab7okN/y5mK1eqyx6+WVZFhegmHC0My
         URB2tasjHKQIcH4bEmmKN0/y9spjHPfAZ7zWn1h7YGoXCOJbKS8bDjhqJtoTns6dw1ft
         LMNdq6DM4umjSzS97UYdnQGGdB0OcfPREDBWvE24EqbLmvcPKrIbcsexr+RrrRNFF+LQ
         g0qg9pwzIFueKA3nR5mJtP3t6yISDplhdEM9Kmh8dqqj8eY2O+Lo9OReRHX7rWus+mWU
         HN42mTPZ6e4aD1tKdjlekPkPsBZMWym6HTUtzC8VqOl6FAAJijq3dlIFSNsmPlsnuR81
         DnuA==
X-Forwarded-Encrypted: i=1; AJvYcCWelmBBh64u2V9F63M1Ka6RWXB0O22rklRevaXatMo1Ko5YvXJDMhBzyp7/DO8zmwokOAbDKxg3ziIVvM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YymbBGOtMj0PQP6/O7cLY/372ChSuWDU4qqsh3iCFMf//P85nxF
	Lh5cdfNrDbrvT7bw3NGwShAiS+4TIeG5sq3R4DhzWH3wuOYmJ12NTUr8
X-Gm-Gg: ASbGnctk7DrhSRUFtEVt868PXAnHkEW9xogZS5SBJwqhqPGeSM4jIM3D4/MTwZdBImF
	hntaT2X5O1IA45liC/mFi0EU2Pka/KXmUES6hsl+rJA45NgnCynf/VGXc+EkXVBgpSlmmiRN7w1
	5YWxnRFUXmJd23XmJqhHJUBYzwVuPAVx34ZxjSHPbxJNklz9kVJfXaiM27tflaw2qSK/kmRVZAC
	/FlHZsW2xNKdIUiCPcl6KFuijKtCkvmasq19WfUVKxzSDUvh/Ap2q/ePCQ97w5BgwJ2omJfmsuz
	yeSz2+SSbCwYMSSxPOnZmapmJ9asz1V662L+2+pCjzXqne4xmNbpMiEy92th3vf/rnBWa3+vUEx
	hZAqEK03Cnes=
X-Google-Smtp-Source: AGHT+IGCoTf2/sK16URuJGlv/NEhBkck1QcOgj4h8WXpgeP6+mwYonBkdE86Wp1LGEoSP1Uo34TBug==
X-Received: by 2002:a05:6512:3c88:b0:553:cc61:1724 with SMTP id 2adb3069b0e04-553e3bb51camr3527946e87.24.1750678566827;
        Mon, 23 Jun 2025 04:36:06 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbc84sm1371439e87.112.2025.06.23.04.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 04:36:06 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 23 Jun 2025 13:36:03 +0200
To: David Wang <00107082@163.com>
Cc: Suren Baghdasaryan <surenb@google.com>, oliver.sang@intel.com,
	urezki@gmail.com, ahuang12@lenovo.com, akpm@linux-foundation.org,
	bhe@redhat.com, hch@infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, lkp@intel.com, mjguzik@gmail.com,
	oe-lkp@lists.linux.dev, harry.yoo@oracle.com,
	kent.overstreet@linux.dev
Subject: Re: CONFIG_TEST_VMALLOC=y conflict/race with alloc_tag_init
Message-ID: <aFk8I4qNG9ntonTa@pc636>
References: <202506181351.bba867dd-lkp@intel.com>
 <20250620100258.595495-1-00107082@163.com>
 <CAJuCfpFLKR7CqAHG+QjHt4wCLgWmP7dD+f5D8Jx6gHUoXSe1AA@mail.gmail.com>
 <375419f4.2ba1.1979aad313a.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <375419f4.2ba1.1979aad313a.Coremail.00107082@163.com>

On Mon, Jun 23, 2025 at 10:45:31AM +0800, David Wang wrote:
> 
> At 2025-06-23 06:50:44, "Suren Baghdasaryan" <surenb@google.com> wrote:
> >On Fri, Jun 20, 2025 at 3:03 AM David Wang <00107082@163.com> wrote:
> >>
> >> On Wed, Jun 18, 2025 at 02:25:37PM +0800, kernel test robot wrote:
> >> >
> >> > Hello,
> >> >
> >> > for this change, we reported
> >> > "[linux-next:master] [lib/test_vmalloc.c]  7fc85b92db: Mem-Info"
> >> > in
> >> > https://lore.kernel.org/all/202505071555.e757f1e0-lkp@intel.com/
> >> >
> >> > at that time, we made some tests with x86_64 config which runs well.
> >> >
> >> > now we noticed the commit is in mainline now.
> >>
> >> > the config still has expected diff with parent:
> >> >
> >> > --- /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/7a73348e5d4715b5565a53f21c01ea7b54e46cbd/.config   2025-06-17 14:40:29.481052101 +0800
> >> > +++ /pkg/linux/x86_64-randconfig-161-20250614/gcc-12/2d76e79315e403aab595d4c8830b7a46c19f0f3b/.config   2025-06-17 14:41:18.448543738 +0800
> >> > @@ -7551,7 +7551,7 @@ CONFIG_TEST_IDA=m
> >> >  CONFIG_TEST_MISC_MINOR=m
> >> >  # CONFIG_TEST_LKM is not set
> >> >  CONFIG_TEST_BITOPS=m
> >> > -CONFIG_TEST_VMALLOC=m
> >> > +CONFIG_TEST_VMALLOC=y
> >> >  # CONFIG_TEST_BPF is not set
> >> >  CONFIG_FIND_BIT_BENCHMARK=m
> >> >  # CONFIG_TEST_FIRMWARE is not set
> >> >
> >> >
> >> > then we noticed similar random issue with x86_64 randconfig this time.
> >> >
> >> > 7a73348e5d4715b5 2d76e79315e403aab595d4c8830
> >> > ---------------- ---------------------------
> >> >        fail:runs  %reproduction    fail:runs
> >> >            |             |             |
> >> >            :199         34%          67:200   dmesg.KASAN:null-ptr-deref_in_range[#-#]
> >> >            :199         34%          67:200   dmesg.Kernel_panic-not_syncing:Fatal_exception
> >> >            :199         34%          67:200   dmesg.Mem-Info
> >> >            :199         34%          67:200   dmesg.Oops:general_protection_fault,probably_for_non-canonical_address#:#[##]SMP_KASAN
> >> >            :199         34%          67:200   dmesg.RIP:down_read_trylock
> >> >
> >> > we don't have enough knowledge to understand the relationship between code
> >> > change and the random issues. just report what we obsverved in our tests FYI.
> >> >
> >>
> >> I think this is caused by a race between vmalloc_test_init and alloc_tag_init.
> >>
> >> vmalloc_test actually depends on alloc_tag via alloc_tag_top_users, because when
> >> memory allocation fails show_mem() would invoke alloc_tag_top_users.
> >>
> >> With following configuration:
> >>
> >> CONFIG_TEST_VMALLOC=y
> >> CONFIG_MEM_ALLOC_PROFILING=y
> >> CONFIG_MEM_ALLOC_PROFILING_ENABLED_BY_DEFAULT=y
> >> CONFIG_MEM_ALLOC_PROFILING_DEBUG=y
> >>
> >> If vmalloc_test_init starts before alloc_tag_init, show_mem() would cause
> >> a NULL deference because alloc_tag_cttype was not init yet.
> >>
> >> I add some debug to confirm this theory
> >> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> >> index d48b80f3f007..9b8e7501010f 100644
> >> --- a/lib/alloc_tag.c
> >> +++ b/lib/alloc_tag.c
> >> @@ -133,6 +133,8 @@ size_t alloc_tag_top_users(struct codetag_bytes *tags, size_t count, bool can_sl
> >>         struct codetag *ct;
> >>         struct codetag_bytes n;
> >>         unsigned int i, nr = 0;
> >> +       pr_info("memory profiling alloc top %d: %llx\n", mem_profiling_support, (long long)alloc_tag_cttype);
> >> +       return 0;
> >>
> >>         if (can_sleep)
> >>                 codetag_lock_module_list(alloc_tag_cttype, true);
> >> @@ -831,6 +833,7 @@ static int __init alloc_tag_init(void)
> >>                 shutdown_mem_profiling(true);
> >>                 return PTR_ERR(alloc_tag_cttype);
> >>         }
> >> +       pr_info("memory profiling ready %d: %llx\n", mem_profiling_support, (long long)alloc_tag_cttype);
> >>
> >>         return 0;
> >>  }
> >>
> >> When bootup the kernel, the log shows:
> >>
> >> $ sudo dmesg -T | grep profiling
> >> [Fri Jun 20 17:29:35 2025] memory profiling alloc top 1: 0  <--- alloc_tag_cttype == NULL
> >> [Fri Jun 20 17:30:24 2025] memory profiling ready 1: ffff9b1641aa06c0
> >>
> >>
> >> vmalloc_test_init should happened after alloc_tag_init if CONFIG_TEST_VMALLOC=y,
> >> or mem_show() should check whether alloc_tag is done initialized when calling
> >> alloc_tag_top_users
> >
> >Thanks for reporting!
> >So, IIUC https://lore.kernel.org/all/20250620195305.1115151-1-harry.yoo@oracle.com/
> >will address this issue as well. Is that correct?
> 
> Yes, the panic can be fix by that patch.
> 
> I still feel it better to delay vmalloc_test_init, make it happen after alloc_tag_init.
>
We can, but then we would not notice the bag that is in question :)

At least we should, i think, to exclude the tests which trigger warnings
when the test-suite is run with default configurations, i.e. run the tests
which are not supposed to fail.

--
Uladzislau Rezki
