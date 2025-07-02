Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2310427E7C1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751464512; cv=none; b=bRHhW5ZlUvI43KLE+wq4ixkF5kiF7NGvd6xYVA8G+k1yBTvigF2CDaiteFRuleVoUQQ5OSVY/N9Sk/CUvBF4cAtN/TFsMuJErV910edsu4kSqz3OeUbY9baztouKxHvNONXqRpU8J/yrOpCpTi+s9SNbcsZrFdYJezdkPr+jwIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751464512; c=relaxed/simple;
	bh=R3ZrmR94NNMh79KRE28cnLYHOXyIQ9V+veCzIGTwEPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b6UHFmFphENc2w0ZIS/xf5Swk6bD8nm2tq/uNNJ2qWRme/Y+hWbq8fHpQ/Pnfa5Zc77uzxSArgkjv/6kFgLiwHbuDMuOMuPEjR3q8g1vnkxTQ/IzZzrbR9wt0WKzy5z+6iHRPj/m5brgF1Q1bGGFtQWzAOyXwZjhtAzn6iJydM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com; spf=none smtp.mailfrom=readmodwrite.com; dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b=rnfYOw64; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=readmodwrite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readmodwrite-com.20230601.gappssmtp.com header.i=@readmodwrite-com.20230601.gappssmtp.com header.b="rnfYOw64"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2349f096605so53504715ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=readmodwrite-com.20230601.gappssmtp.com; s=20230601; t=1751464510; x=1752069310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3ZrmR94NNMh79KRE28cnLYHOXyIQ9V+veCzIGTwEPA=;
        b=rnfYOw648Xjg1wpy7+NAoeVv/eUKH16Q0b0QYgQ8U98CIJUW4JuxHXQpGizYmXwHCC
         d18CkMFU+AvMO/4IOFa6yaF6RBygIm3LjTWcMmg3gvy/cIXaZcCR9RY3/XwaMy9ibLVC
         I6tBJo3e4jYvyNxBs9nkyPIN90Sybxpo+eP8/rV/88iBTtkyrhhHmtsCNPVL6B5NNk89
         6XRK3jMmqGyJKce1w8JXtMeI0/vuojZIy7bY0IN87VEwA8hidYH28MbOljrjihXlDO8N
         k/k3Swpb4KPUxBJ97hfDfp+69CrScavu80sN48ZTctOAx4pvpZLkQ+bfg/bKkYd1LpZG
         NALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464510; x=1752069310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3ZrmR94NNMh79KRE28cnLYHOXyIQ9V+veCzIGTwEPA=;
        b=IXPb+76lT57dCsccNabEyx3WnWqaBOWYITrl9Mx79DaUAm84bq4x2hvG+SIUQLKFZ0
         P67vfOgDqru06xA0bGYuUpbpl+Oc6Ikq+PlbCX7Akne44XgyJ0k9pbzw/vnnJ4QcKTTV
         ZnV3Ubdh/RiAJL/jEsksQ+GWHT5EVJeWbygoD0rPn0wXwSZxVh1IRFU4vt/M3L3LZdgz
         cEHKLr/G28E1ep+fUiZetrZyP/cfziyVlOT+egSM4+/Cavz1K0gInXGXtbkjEkZ/C/4j
         kmks6yYeurg7lgs3LdBLCqVp7sLTnlEVj3IFEUJ+yJT66MBAEA5j8cxQVLBNHR4JHrJu
         aE7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWXwkb6CGTyGym1kA5loOMD6muMXAbMm3ippDRLVwioxqd7HyTpfhh+RyeGmeHzxUZNUYjG8f+3Z1fa9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8yLljzH8eS7q9TfqFp8+Zy8yrN5BwsD6/LJqjWoK0JgFfGGxZ
	IdZeu2kvPLgqUTKwQ+VuMTLYwLDLCyyZsaqAY3Q+IHiCqlO/r1QZpWViOhMfoEC7LK8a7EAs3Hp
	ZnplE8CSpIYQENCHOhHOj/OjMp18ulLBbORpo1OZb8Q==
X-Gm-Gg: ASbGncvK4Jlio3sVb53GKpTTFQ1SsDeClD+nic35x/nhMRl7Cc62GM8AkZKWV/fwAtP
	kGgG91CJgGfp/MYV/26dUFmisrbQfqCcrQgXRNB64jgST9cW3/093fAt33Kq3z4CQlV6FXz1oYk
	mbnypPVP9A+mSAAdR1gG4kGTa9PV0JxjrkC7Q+5mDykWFU+RRCeuKyFE8iRHyHHNtSFoPsp7E=
X-Google-Smtp-Source: AGHT+IEcxKTe8B7Gd5XkE2/X74iTrj9tFSDUnVVHABTsUdRoLkZAfumDbh97qicwm/JYfR4mMqMVL3/0AdoOH8b++0M=
X-Received: by 2002:a17:902:e5ca:b0:237:e818:30f2 with SMTP id
 d9443c01a7336-23c6e5edb4emr32965865ad.50.1751464510447; Wed, 02 Jul 2025
 06:55:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610111559.1667156-1-matt@readmodwrite.com>
 <CA+fCnZdR3qC-mDKSb9wWnA3-2qQxMvgArCPd3Cd_h=psjBx+vA@mail.gmail.com> <CAENh_SQXoMDmHw2K3p4VLC4iG_-Lx=CK-dVrqRm2m5Yv2anTbw@mail.gmail.com>
In-Reply-To: <CAENh_SQXoMDmHw2K3p4VLC4iG_-Lx=CK-dVrqRm2m5Yv2anTbw@mail.gmail.com>
From: Matt Fleming <matt@readmodwrite.com>
Date: Wed, 2 Jul 2025 14:54:58 +0100
X-Gm-Features: Ac12FXwe04bC--AZlVqzQDyRcVCUSJ6tTDu-pIORZD4O_8pzoNQD5nseWVsYcGM
Message-ID: <CAENh_SQDBOR28qZWzC_ns=H8i9EHzOB8w2xc2YWReKa21PYsgg@mail.gmail.com>
Subject: Re: [PATCH] stackdepot: Make max number of pools build-time configurable
To: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>, 
	Matt Fleming <mfleming@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 1:21=E2=80=AFPM Matt Fleming <matt@readmodwrite.com=
> wrote:
>
> On Tue, Jun 10, 2025 at 5:09=E2=80=AFPM Andrey Konovalov <andreyknvl@gmai=
l.com> wrote:
> >
> > On Tue, Jun 10, 2025 at 1:16=E2=80=AFPM Matt Fleming <matt@readmodwrite=
.com> wrote:
> > >
> > > From: Matt Fleming <mfleming@cloudflare.com>
> > >
> > > We're hitting the WARN in depot_init_pool() about reaching the stack
> > > depot limit. My assumption is because we have long stacks that don't
> > > dedup very well.
> >
> > Note that this might happen if filter_irq_stacks() somehow fails in you=
r setup.
> >
> > See e.g. this:
> >
> > https://lore.kernel.org/all/CA+fCnZdWgAD1pu4yyjON0ph9ae1B6iaWas0CbET+MX=
LNNXt5Hg@mail.gmail.com/
> > https://lore.kernel.org/all/44140c34-e2bd-4f6e-892c-51469edc8dfb@redhat=
.com/
>
> Thanks for the tip. I'll double-check if we're hitting a similar issue
> before sending a v2.

Sorry for the delay.

filter_irq_stacks() seems to be working just fine. But I did notice
that we're doing a lot of stuff in softirqs and that might be the
cause of so many unique stack traces, e.g.

kasan_save_stack+0x27/0x4f
__kasan_record_aux_stack+0xad/0xbf
__call_rcu_common.constprop.0+0x70/0x7bf
kmem_cache_free+0x36e/0x55f
__sk_destruct+0x3f8/0x5bf
tcp_v6_rcv+0x31c3/0x3cef
ip6_protocol_deliver_rcu+0x12d/0x115f
ip6_input_finish+0xe8/0x15f
ip6_input+0xca/0x1cf
ipv6_rcv+0x307/0x38f
__netif_receive_skb_one_core+0x11f/0x1af
process_backlog+0x1d2/0x5df
__napi_poll+0xa2/0x43f
__init_scratch_end+0x70a7b79/0x98d00df
__napi_poll+0x5/0x43f
net_rx_action+0x75f/0x18af
handle_softirqs+0x15e/0x52f
do_softirq+0x40/0x5f
__local_bh_enable_ip+0x64/0x6f
__dev_queue_xmit+0x8aa/0x30ff
ip6_finish_output2+0xb96/0x1b2f
ip6_finish_output+0x5d1/0x97f
ip6_output+0x1d6/0x3cf
ip6_xmit+0xaf4/0x199f
inet6_csk_xmit+0x2cf/0x44f
__tcp_transmit_skb+0x1826/0x3bdf
tcp_write_xmit+0x1610/0x794f
__tcp_push_pending_frames+0x94/0x2df
inet_shutdown+0x247/0x31f
__sys_shutdown+0xe9/0x19f
__x64_sys_shutdown+0x53/0x7f
do_syscall_64+0x4b/0x10f
entry_SYSCALL_64_after_hwframe+0x76/0x7d

In fact, nearly 25% of the recorded stacks feature do_softirq(). I
don't think we want to filter these like we do for hard irqs though,
because the information is helpful for debugging.

Thanks,
Matt
