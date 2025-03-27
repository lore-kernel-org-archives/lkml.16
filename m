Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017622628D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743082999; cv=none; b=n+pO21yd8BKaHZenHVG/4ygb9dVjEB+CWY2Hg0vfvkQLnuIK2p6GILL8rzXXrZMMkW08lG5xcHLG5IN25UDF04lntfo9ge0dhHgqvqRUvKcTM1f/ic3xr1P1oRfoEhJFYzMlr1nT+RZJBZI//q9prOGBMNnoP+YN6dalZXl33gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743082999; c=relaxed/simple;
	bh=5ZCgFTgVJLK+smEQLwtOc1ImMIqPAG35ndYH+0G3vGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHW+kVo6H8BR3Nih59cwCSyA+3jyk623hfu0Cy33JGa2H7QJTAl3AF0djQM9hGh/3c2vwEbhZ35gCv60dM3XMWHdo6Xqqd+Hxq2/Ava6tr2wRc53KYExfgbj1R6LdAuUve/nhvL/62zZq7KTx2iUawGi2Jd4G7/UrdDosIDoeKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvRiIuq9; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvRiIuq9"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5e34f4e89so1880098a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743082996; x=1743687796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNnBnM8eO87L/e1cHxRaDu6Ifod398nlA+QM8LTKvTk=;
        b=XvRiIuq9A2Iu40aEyutqRyMsQhzqu/OK7erakfC6sZncN5WdLsioE95c6/G9XZPBSW
         fDbG9v23fH6rZwQRRAvE1QV8D+Fy/+bj6taeclweOSTf7Jig4GNJVozZcj46zx4/VTBy
         y1KGgDr8R8TVzVO3nXlxvP0OOGNz3m7ezeEz4dXunwpa8xPRcHXTKiDXbWJkluSKn6r7
         uNLnBz61Ee+1w2Wc/0uMAMcf/G2CnKZNIo/uIIt+fOIDGQrXIyUdI69J4U8cw9q0SfyC
         sXQO49/CRWvsOQVi25JmerDRvhh2IFQW8lyMR8ctdEifBXDDUkT5jRecnErYUFIIr2cq
         dH9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743082996; x=1743687796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNnBnM8eO87L/e1cHxRaDu6Ifod398nlA+QM8LTKvTk=;
        b=GXMt8zb0pB+WSjz4OoH5fH2WbpgO8qplKBvuBbStXx9OIX5iMFUATI6YRiSAP/hJQx
         xS2+g3LDrfk1nF3Vam9ZCqjgUTw8+3wf0f4pu83ImU3gQink9CjeWJA1uNWFV8zcyKeh
         lmqjMNgSF92WY8WyRXC8EV3NZkWGFsVSqMlnSFIuxuGpGl6M5OXheH9Cx5d9ACiaF4VB
         XSpvTxJ9YksHJ+2JxeaY8pfMl34/pedqW36uYgtBEof1i1SGI5Q9IuYtwmorhdmK/xzh
         fUAQe/fMxHGFrXHiM+8qdjr6MB2Nm5IXwe9FwhmHHzrMQVmolEswpWMDDgJ6H4eR17cc
         XW9g==
X-Forwarded-Encrypted: i=1; AJvYcCUkf7d/EfTpk29HqIvMRAGCq7MOyd6/nYE+E33ENjmtLxFm6Lyv6U3LFq/NOYQf7pBIY+a14xy+0Y0+mbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHhWR2B1mO6N7pU4v79afJezEBKLNLCLyYHVfHEPPLxXboCQc3
	VEQdepmLHX3g9pycZ5wxUXLnZJhZINIkVn63yMtHZbbZG0SosBQTphAdU4zpLkk9Bd2BajeN5Dc
	mSUzaqiiDY6Aa+lkiqnl17KAuzRc=
X-Gm-Gg: ASbGncunjkHQK7xI8JWfmbswV/ciMb9nnInKrx4Q9+yjTR2kPKT23gHZ0y9s74wGe/o
	jc6TXJ/7yZOU9X0LfKNcMIz6GpWNXowW+xztiGwPdmJt7WgJzd50Be3SKdB/U0ICV7CZg0hrphI
	46d2ZubOgsque509qngnKM8hf1
X-Google-Smtp-Source: AGHT+IFhZyMfTTbLEHg4L/imLHqXDu7Y6uwFb7PeJ8rcHNStXOvjsChOebBMabFw9bm3yO7hNEMrfekk5RZ6omxcm/o=
X-Received: by 2002:a05:6402:40d5:b0:5de:dfd0:9d20 with SMTP id
 4fb4d7f45d1cf-5ed8f4fe787mr3804989a12.24.1743082995905; Thu, 27 Mar 2025
 06:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx>
 <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
 <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com>
 <877c4azyez.ffs@tglx> <CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
 <CANn89i+nAN+p-qRypKxB4ESohXkKVPmHuV_m86j3DPv6_+C=oQ@mail.gmail.com>
 <87v7ruycfz.ffs@tglx> <CANn89iJvxYsF0Y9jH+Oa2=akrydR8qbWAMbz_S6YZQMSe=2QWQ@mail.gmail.com>
 <87jz8ay5rh.ffs@tglx> <CANn89i+r-k-2UNtnyWC6PaJmO_R6Wc6UROgeoir5BmgVV8wDqQ@mail.gmail.com>
In-Reply-To: <CANn89i+r-k-2UNtnyWC6PaJmO_R6Wc6UROgeoir5BmgVV8wDqQ@mail.gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 27 Mar 2025 14:43:03 +0100
X-Gm-Features: AQ5f1JqW5WtFubNuoRMeKkOS-xgt9PQkFTzZzMHbp6fD9sZ7G_CcCtlSvB5OySg
Message-ID: <CAGudoHHVJWeRWPyArnYnJERPR2gyU0PzBTwx=wWKnCemry45Nw@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Eric Dumazet <edumazet@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 2:17=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Thu, Mar 27, 2025 at 2:14=E2=80=AFPM Thomas Gleixner <tglx@linutronix.=
de> wrote:
> >
> > On Thu, Mar 27 2025 at 12:37, Eric Dumazet wrote:
> > > On Thu, Mar 27, 2025 at 11:50=E2=80=AFAM Thomas Gleixner <tglx@linutr=
onix.de> wrote:
> > >> Cute. How much bloat does it cause?
> > >
> > > This would expand 'struct ucounts' by 192 bytes on x86, if the patch
> > > was actually working :)
> > >
> > > Note sure if it is feasible without something more intrusive like
> >
> > I'm not sure about the actual benefit. The problem is that parallel
> > invocations which access the same ucount still will run into contention
> > of the cache line they are modifying.
> >
> > For the signal case, all invocations increment rlimit[SIGPENDING], so
> > putting that into a different cache line does not buy a lot.
> >
> > False sharing is when you have a lot of hot path readers on some other
> > member of the data structure, which happens to share the cache line wit=
h
> > the modified member. But that's not really the case here.
>
> We applications stressing all the counters at the same time (from
> different threads)
>
> You seem to focus on posix timers only :)

Well in that case:
(gdb) ptype /o struct ucounts
/* offset      |    size */  type =3D struct ucounts {
/*      0      |      16 */    struct hlist_node {
/*      0      |       8 */        struct hlist_node *next;
/*      8      |       8 */        struct hlist_node **pprev;

                                   /* total size (bytes):   16 */
                               } node;
/*     16      |       8 */    struct user_namespace *ns;
/*     24      |       4 */    kuid_t uid;
/*     28      |       4 */    atomic_t count;
/*     32      |      96 */    atomic_long_t ucount[12];
/*    128      |     256 */    struct {
/*      0      |       8 */        atomic_long_t val;
                               } rlimit[4];

                               /* total size (bytes):  384 */
                             }

This comes from malloc. Given 384 bytes of size it is going to be
backed by a 512-byte sized buffer -- that's a clear cut waste of 128
bytes.

It is plausible creating a 384-byte sized slab for kmalloc would help
save memory overall (not just for this specific struct), but that
would require extensive testing in real workloads. I think Google is
in position to do it on their fleet and android? fwiw Solaris and
FreeBSD do have slabs of this size and it does save memory over there.
I understand it is a tradeoff, hence I'm not claiming this needs to be
added. I do claim it does warrant evaluation, but I wont blame anyone
for not wanting to do dig into it.

The other option is to lean into it. In this case I point out the
refcount shares the cacheline with some of the limits and that it
could be moved to a dedicated line while still keeping the struct <
512 bytes, thus not spending more memory on allocation. the refcount
changes less frequently than limits themselves so it's not a big deal,
but it can be adjusted "for free" if you will.

while here I would probably change the name of the field. A reference
counter named "count" in a struct named "ucounts", followed by an
"ucount" array is rather unpleasing. How about s/count/refcount?

--=20
Mateusz Guzik <mjguzik gmail.com>
