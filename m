Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418631F7575
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 20:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746475794; cv=none; b=S3eXSRtZAROnTNrCi4pUzOKeIB3Eu7brISnzPs8l1ICarI6+UWue5e3Fc1l6gRtHL4GMNqlYwpQm3/jFYuC/unqDUwSajGv7eQ5tGaKymxOKA//Xrnx+izZGpL8f+eQPWYuahzbPbqv6cQMCa/E1evFavBiz0pnP7Z9gLHAfyX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746475794; c=relaxed/simple;
	bh=B4Hz/vpcdo1jMA8gVe4Kf65g1/oxGcHa7QwTOAE5UgY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgwxQxx7eMJDrqd3VxTw8H5iin5AOG9yBrVuSx7vN2vLhvZvY5fbhnRhwtYS4FmKv6Pxyw6gCfYr3XEfMgO7+yKW7VuOLCa/YhgRUVbVPSDb/B23VeDnS786Hx2Qi3/x/AoA2FYmjfEbNUYCKsum7ETCH/fQExvUQNFOKz1mLPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x9YVpKX6; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x9YVpKX6"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5e39d1db2so302985585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 13:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746475792; x=1747080592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxCMhylbSk6ettTVACRoHKvtfRVQ8d3xi92DaTsXptA=;
        b=x9YVpKX6agIj4Xd1TLvoEPM5DyhBNbR+LWcBzpex/6yDr/zqBcpHBC6plphXcumrr0
         oSua1QazPoceLuZyMOzWP9uRpEZBqCGZgvjKge0S3ibGtKzcQw4nNzVnRDMZ9IYOABpO
         n3esB9pKQdc+ppU+ezPNczaKJV8ESk1ngUzRWVIuTAMGiF0OT0FHNA4W7E1b7xy59nlw
         LuMXnRg1hQfBr3DWfYuy5yNc2Fd06gwx7byjkeg+a73E2BqdKxfv0VAVSEltm9KTbRjq
         V+zM/DB6gXcmflUVoJHk/Cl0vHGDAH7kvQf4nQwL5cNQtVT1Vrv6PyNGKBg/nZD8E84X
         a85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746475792; x=1747080592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxCMhylbSk6ettTVACRoHKvtfRVQ8d3xi92DaTsXptA=;
        b=TynEJbabqdhRA0NMEm9f+IRd5QSRN58/tsL60f0DOMqjuiOrCQacoUShlFgXgNRYrq
         NjEVk6vxS+XvLDpJgEfJyetTyaI0HaCrcl1GK3h/m4WknnGXKfhcNLMCNmSskY7zJY8v
         9XT+ZZS37XLPeX4uObXTPZHSH9+TTeS+R1Pu9mIyFplu/1jSX60uh11s7rjYJvwg/5Fs
         ibGCbq038/LPi2VTh+boseRMcj0qaqWPrpzGrT4Jd/VEsJUNoBj3FX5fTiGzJ8/oJI7x
         QiqoKkok4qhiqQnlF+ZYZP9l75XbycGXhT0GgmbgMATNzkLqCKcvDDgIiN1toUyrVJHj
         P4UA==
X-Forwarded-Encrypted: i=1; AJvYcCVaivgW2kOAYD6JqCTRIhv88i9sgET1JI4YXSMSW+k2Lal73IhSrFuFWB/G1IIPP7DkEBr9LhhieHzvw0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzunKCTcA+VkCq1uMAxRB0kTc/XV0BIDzcaqm6tX6LhgZO4/4Oz
	hZ0cwUq8TMMPLOB+vZWEOrPUiWSP6FmPzfaYg6kshPH5OclyAlWhSslYJDURw/X7dKIOly7BzOs
	UeBsVSwEBi+pJAObFW7MkndOha+i+aFipFSTt
X-Gm-Gg: ASbGncuwAB7yzI0iu9Eso2k3jhaMlExALsd8CovVOyv4kk9fgZ5zvoIU3wrtJuoqlfD
	PDkQSiMuNMknN8cjUGd27V/p4EOW4KxjWP2dQPj9ib743jZlApECIgTTd4OVZ713daWamJykmGb
	f3pBXY0nVfk+uC1Ynkz3o=
X-Google-Smtp-Source: AGHT+IEwYffEkbgbhPlj54yQtRtoBY5URgxuVSejax3boETmX5gY9r1XV3zoKuswGJbtNaqElvftxIE6SWgDerOA7mE=
X-Received: by 2002:a05:620a:3949:b0:7c5:49ee:86aa with SMTP id
 af79cd13be357-7cae3a883fcmr998822985a.4.1746475791814; Mon, 05 May 2025
 13:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505171948.24410-1-aha310510@gmail.com> <CANn89i+XaOxe+AOma=H+JuDuFm9b2_1x3x6r6BdhkHFxXAn8Hw@mail.gmail.com>
In-Reply-To: <CANn89i+XaOxe+AOma=H+JuDuFm9b2_1x3x6r6BdhkHFxXAn8Hw@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 5 May 2025 13:09:39 -0700
X-Gm-Features: ATxdqUEdBTIZw-HtuQPMX3t5ugIml_n1WXxemHW3wUeEqy1U8nMdOSA3cgfpvVA
Message-ID: <CANn89iJASmbYXMf4p4KWhAfBnpC7V_j1i0UXwvVmKkPtO+8Rvw@mail.gmail.com>
Subject: Re: [PATCH] mm/vmalloc: fix data race in show_numa_info()
To: Jeongjun Park <aha310510@gmail.com>
Cc: akpm@linux-foundation.org, urezki@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 11:06=E2=80=AFAM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Mon, May 5, 2025 at 10:20=E2=80=AFAM Jeongjun Park <aha310510@gmail.co=
m> wrote:
> >
> > The following data-race was found in show_numa_info():
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > BUG: KCSAN: data-race in vmalloc_info_show / vmalloc_info_show
> >
> > r
> > value changed: 0x0000008f -> 0x00000000
> >
> > Reported by Kernel Concurrency Sanitizer on:
> > CPU: 1 UID: 0 PID: 8287 Comm: syz.0.411 Not tainted 6.15.0-rc4-00256-g9=
5d3481af6dc-dirty #1 PREEMPT(voluntary)
> > Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04=
/01/2014
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > There is a read/write data-race in counter[]. This seems to be happenin=
g
> > because only read memory barriers are currently applied, so we need to
> > modify the write operation to counters[] to be handled atomically.
> >
> > Fixes: a47a126ad5ea ("vmallocinfo: add NUMA information")
> > Signed-off-by: Jeongjun Park <aha310510@gmail.com>
> > ---
> >  mm/vmalloc.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> > index 3ed720a787ec..d93fa535bc21 100644
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -4917,7 +4917,8 @@ bool vmalloc_dump_obj(void *object)
> >  static void show_numa_info(struct seq_file *m, struct vm_struct *v)
> >  {
> >         if (IS_ENABLED(CONFIG_NUMA)) {
> > -               unsigned int nr, *counters =3D m->private;
> > +               atomic_t *counters =3D m->private;
> > +               unsigned int nr;
> >                 unsigned int step =3D 1U << vm_area_page_order(v);
> >
> >                 if (!counters)
> > @@ -4931,10 +4932,10 @@ static void show_numa_info(struct seq_file *m, =
struct vm_struct *v)
> >                 memset(counters, 0, nr_node_ids * sizeof(unsigned int))=
;
> >
> >                 for (nr =3D 0; nr < v->nr_pages; nr +=3D step)
> > -                       counters[page_to_nid(v->pages[nr])] +=3D step;
> > +                       atomic_add(step, &counters[page_to_nid(v->pages=
[nr])]);
> >                 for_each_node_state(nr, N_HIGH_MEMORY)
> > -                       if (counters[nr])
> > -                               seq_printf(m, " N%u=3D%u", nr, counters=
[nr]);
> > +                       if (atomic_read(&counters[nr]))
> > +                               seq_printf(m, " N%u=3D%u", nr, atomic_r=
ead(&counters[nr]));
> >         }
> >  }
> >
> > --
>
> This patch looks bogus to me.
>
> The race is about using m->private for storage, while the same file
> can be read from multiple threads.
>
> Using atomic_t is going to silence syzbot, but the bug is still there.

A more correct fix would be :

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index a6e7acebe9adf5e6c8abd52dcf7d02a6a1bc3030..cb69b44587d2032a6192f3ceb51=
8490a05eff541
100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -4921,24 +4921,24 @@ bool vmalloc_dump_obj(void *object)
 static void show_numa_info(struct seq_file *m, struct vm_struct *v)
 {
        if (IS_ENABLED(CONFIG_NUMA)) {
-               unsigned int nr, *counters =3D m->private;
+               unsigned int nr, *counters;
                unsigned int step =3D 1U << vm_area_page_order(v);

+               if (v->flags & VM_UNINITIALIZED)
+                       return;
+               counters =3D kcalloc(nr_node_ids, sizeof(unsigned int),
GFP_KERNEL);
                if (!counters)
                        return;

-               if (v->flags & VM_UNINITIALIZED)
-                       return;
                /* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
                smp_rmb();

-               memset(counters, 0, nr_node_ids * sizeof(unsigned int));
-
                for (nr =3D 0; nr < v->nr_pages; nr +=3D step)
                        counters[page_to_nid(v->pages[nr])] +=3D step;
                for_each_node_state(nr, N_HIGH_MEMORY)
                        if (counters[nr])
                                seq_printf(m, " N%u=3D%u", nr, counters[nr]=
);
+               kfree(counters);
        }
 }

@@ -5032,13 +5032,7 @@ static int vmalloc_info_show(struct seq_file *m, voi=
d *p)

 static int __init proc_vmalloc_init(void)
 {
-       void *priv_data =3D NULL;
-
-       if (IS_ENABLED(CONFIG_NUMA))
-               priv_data =3D kmalloc(nr_node_ids * sizeof(unsigned
int), GFP_KERNEL);
-
-       proc_create_single_data("vmallocinfo",
-               0400, NULL, vmalloc_info_show, priv_data);
+       proc_create_single("vmallocinfo", 0400, NULL, vmalloc_info_show);

        return 0;
 }
