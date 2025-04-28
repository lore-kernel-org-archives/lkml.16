Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B5C28F937
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745870121; cv=none; b=kQFLVAibJWsHNlTMkx4Qcpns4Ra4MgAwdrkx1S1P03KVs6JdvXVSzoDGrlw9RWKjidJ7TL6KMTl1NmYLpTmzRGFWV8uO56rDG22cqqcQ3+2D6iCirtdaZLun0bk/rbOTXcGB3lfFF8GtvYeOHKczuyTToPc2AEB55O5YJufYS04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745870121; c=relaxed/simple;
	bh=Ul2mCutafIkcCO47yAMR6kqOc2J45J0V3vs2YNHmMwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZURDgZtVO9DMt7levIu0iCgSMN85wLdhCZo8rU+6lKpDlp8RK9erkf4O4lwo9toeLe67djq3gFlWT7Y49eywy1tomrjVKJosU1/c9eOAOYPJUMfQGHM67tZJ7QcVWVSGWwbaufRUwJ+CPmcd9mNBfnltZTeqteqojZieAl+mgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3KKFYV3+; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3KKFYV3+"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e733a6ff491so1504199276.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745870117; x=1746474917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfHwTscWO/jloUEDudbJlwyzGCxdwaIO+zKhNAi9qAo=;
        b=3KKFYV3+p3v2jSotn8S17qNg6iLfFORgrecvlTs+F5PXcg3qYHRkP+rkOpwB4Zcgu8
         EGrXOBlVNHj4qNBjxRbUUBTvDzQn/D0nMSdiJCfRjfpNNO5EczooJ5nOZIJ3Qi1E1YR7
         ttqujG29KAMjVSQilHTNUi0vsk7hmJxXme5Szn73wM4/eOMr4s2YvH/a89vUmF6kJvCc
         7pXsjJHngHJD+AA3p0cL/0aYRsT+uz4UdOvcL0wcf4yk/rBHiv7cek36resku5ov9gg+
         bgklrDEDQnwZTY+uf2+yYqZ4AKvkRjjMMwybUicw7IrIzAPq2bkA1yB2COkVYw3io9Cr
         VoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745870117; x=1746474917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfHwTscWO/jloUEDudbJlwyzGCxdwaIO+zKhNAi9qAo=;
        b=rjrgRy2Ftxb+GSe2O1vP3klOAU4qD1ixAtoYM0hJ2G1D3GMrdMuqQzbwnS+aSK9NHs
         Ekt9ym26P7O49ERCFqxVh8xVSHPdHrigVQpNg24d7z4/e+LEzEr76/MlukeX4XCQtLcO
         J61SvSMhf2tQjZjR4P0yX4jLhWja/nHeVOoOjCYdHE+m6XMbHUD7bEqygkZ57uK6244f
         baBYFN8e8pdlFk9HfsMt0ieszG5zWZiVvfvfXC1nMnAz2uOkHIgSb5E23ZeZN+QFTdrT
         KZWkJvBy10JaYcRWrZ06zKKoyjR6C0dgA4QpsCHJrQ/7mtu3hNuPH1OCmTHiwydaqzP5
         glNw==
X-Forwarded-Encrypted: i=1; AJvYcCXd5e/bNwqFpR4MYG4GCG39dx15I6OXWJphOmMAkmxpqQbv8Eq0cpeR1mUT4iEE9dOr3CohzXwyuBy4AHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgbMQt8fSL4Gm/+Ve5spv261tzObLSGyG4Jhqx2BltKr04NVBl
	yxlILbANoON6G5vtGmKTKbJnCka5pRZTNab1WybpfXJmCvSKgJIdF4kbr9TW7Tczq/y2hDK8/oz
	HjCeisUfKpES0zI8zb+yfdpWsFrBDmntaNJKC
X-Gm-Gg: ASbGnctfoYsh32c1qBL8y4u3PNRw4IVyqqH0WchiloX042H8ZVkptq71Noqd8DJoN0Q
	I1s7/IP5xE9XIu1WU6gJRiHvhnWqfvJq7TjgNNW15L7HKC+9BKGVwOvNj47SsJTFwYVDc6H9BNs
	i53E1Nt3e1Wgwm7NJxokF488j9xsAehSfrkQKrYuorY2dtg02043q+CR+IpsIrnfLhjxI=
X-Google-Smtp-Source: AGHT+IF5bOE8NaQox434M5XmykiOoFpfiOOstY8512J8SiE44O+53iDRI95fhIJQcDKl1pHA+A5H/zkhcUhoVNEAjiw=
X-Received: by 2002:a05:6902:158e:b0:e6e:667:911d with SMTP id
 3f1490d57ef6-e73233a6dc2mr13962923276.21.1745870117123; Mon, 28 Apr 2025
 12:55:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414200929.3098202-1-jthoughton@google.com>
 <20250414200929.3098202-6-jthoughton@google.com> <aAwpWwMIJEjtL5F9@google.com>
In-Reply-To: <aAwpWwMIJEjtL5F9@google.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 28 Apr 2025 15:54:41 -0400
X-Gm-Features: ATxdqUFyYu3QFWzs4o008gMYEtq4uvUsSn7Emn7MJoROAS3_0BzmZZrNMQlZ_Ss
Message-ID: <CADrL8HX03P1f2E7NzufXU3enW1EXz2Bk2qNh5KQg-X1KFQed8g@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] KVM: selftests: access_tracking_perf_test: Use
 MGLRU for access tracking
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, Maxim Levitsky <mlevitsk@redhat.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Yu Zhao <yuzhao@google.com>, David Matlack <dmatlack@google.com>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 8:31=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Mon, Apr 14, 2025, James Houghton wrote:
> > By using MGLRU's debugfs for invoking test_young() and clear_young(), w=
e
> > avoid page_idle's incompatibility with MGLRU, and we can mark pages as
> > idle (clear_young()) much faster.
> >
> > The ability to use page_idle is left in, as it is useful for kernels
> > that do not have MGLRU built in. If MGLRU is enabled but is not usable
> > (e.g. we can't access the debugfs mount), the test will fail, as
> > page_idle is not compatible with MGLRU.
> >
> > cgroup utility functions have been borrowed so that, when running with
> > MGLRU, we can create a memcg in which to run our test.
> >
> > Other MGLRU-debugfs-specific parsing code has been added to
> > lru_gen_util.{c,h}.
>
> This fails on my end due to not being able to find the cgroup.  I spent a=
bout 15
> minutes poking at it and gave it.  FWIW, this is on our devrez hosts, so =
it's
> presumably similar hardware to what you tested on.

Ah sorry, yes, this selftest needs to be patched when running the
devrez userspace, which uses a combination of cgroup-v1 and cgroup-v2.
Simply hard-coding the root to "/dev/cgroup/memory" (which is in fact
a cgroup-v1 mount) should be what you need if you want to give it
another go.

> Even if this turns out to be PEBKAC or some CONFIG_XXX incompatibility, t=
here
> needs to be better hints provided to the user of how they can some this.

Yeah this can be better. I should at least check that the found
cgroup-v2 root's cgroup.controllers contains "memory". In your case,
it did not.

(cgroup.controllers is not available for cgroup-v1 -- because it
doesn't make sense -- so if I patch the selftest to check this file,
using cgroup-v1 mounts will stop working. So, again, you'd need to
patch the test to work on devrez.)

> And this would be a perfect opportunity to clean up this:
>
>         __TEST_REQUIRE(page_idle_fd >=3D 0,
>                        "CONFIG_IDLE_PAGE_TRACKING is not enabled");

I think the change I've already made to this string is sufficient
(happy to change it further if you like):
> > +               __TEST_REQUIRE(page_idle_fd >=3D 0,
> > +                              "Couldn't open /sys/kernel/mm/page_idle/=
bitmap. "
> > +                              "Is CONFIG_IDLE_PAGE_TRACKING enabled?")=
;

> I can't count the number of times I've forgotten to run the test with roo=
t
> privileges, and wasted a bunch of time remembering it's not that the kern=
el
> doesn't have CONFIG_IDLE_PAGE_TRACKING, but that /sys/kernel/mm/page_idle=
/bitmap
> isn't accessible.
>
> I mention that, because on a kernel with MGRLU available but disabled, an=
d
> CONFIG_IDLE_PAGE_TRACKING=3Dn, the user has no idea that they _can_ run t=
he test
> without mucking with their kernel.

Fair enough, I'll change the output from the test for that
configuration to say something like: "please either enable the missing
MGLRU features (e.g. `echo 3 > /sys/kernel/mm/lru_gen/enabled`) or
recompile your kernel with CONFIG_IDLE_PAGE_TRACKING=3Dy."

> =3D=3D=3D=3D Test Assertion Failure =3D=3D=3D=3D
>   lib/lru_gen_util.c:229: stats->memcg_id > 0
>   pid=3D423298 tid=3D423298 errno=3D2 - No such file or directory
>      1  0x0000000000408b45: lru_gen_read_memcg_stats at lru_gen_util.c:22=
9
>      2  0x0000000000402e4c: run_test at access_tracking_perf_test.c:421
>      3  0x0000000000403694: for_each_guest_mode at guest_modes.c:96
>      4  0x00000000004023dd: run_test_in_cg at access_tracking_perf_test.c=
:467
>      5  0x000000000041ba65: cg_run at cgroup_util.c:362
>      6  0x0000000000402042: main at access_tracking_perf_test.c:583
>      7  0x000000000041c753: __libc_start_call_main at libc-start.o:?
>      8  0x000000000041e9ac: __libc_start_main_impl at ??:?
>      9  0x0000000000402280: _start at ??:?
>   Couldn't find memcg: access_tracking_perf_test
> Did the memcg get created in the proper mount?
> Destroying cgroup: /sys/fs/cgroup/access_tracking_perf_test

Thanks for taking a look!
