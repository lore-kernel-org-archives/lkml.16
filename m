Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253481FBE9B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744260688; cv=none; b=ARjRELNINI5ZTDg4U4NQliIuf0c9Z7r17AhjXxQviQDEyWnZ7wncH5KFSahzZuNJfr3YRWTEGKw6ArJO558Qs4pNX5RfGQAvqHnnJ+SDTBEhqNJKXZBl5nkV0tB4g5gh9KJToVh9bDtctcZ/poOaV3MetIuDgTtmT2T9gYsUnIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744260688; c=relaxed/simple;
	bh=SkyDg4HJUDUnF3d2cVrAMUNiCn/1XE84x8N+q+pvyr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5U+H5EzbwYtgWoM0f1RK0tNUURVW9bAEfvEM5jAKDHtuFa8USdraSqHzxJUtYccJN0naZVJYyzqBXeYnrtBJoJzBtUCgvduwSmtSw+GY/rXaRPfxjrcP7YqvprW6l4R0c2YTUyMj8zFNrtYIyy5QixTZeOUdGbPh+X0EpeA3tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=T/DkjupQ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="T/DkjupQ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-548409cd2a8so496459e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 21:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744260683; x=1744865483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCICr8Y1TyleAjVDsOU8scGztgtriadImesn1Q8G2jE=;
        b=T/DkjupQXhPa2ita2QY1C5S98VeJFCGjw9aaXCVaJTUzKfwQ4qh/p3Ur+3n7a9qZ+X
         o2ygF1i38C4XM3L2sFSpQHKSRrDJvTwQba5lm/zhBYtvokhOlcngAVEq/j7fZYvU54wI
         qAdbfTnAarCEBSugc/P1vdNUgeBFpg3C2uDtsViuUp+6zLAgSlSb9yd8QDVJ4+JMmIPl
         uudDQUuTmp597VhSR+lcBXG+nJv3K2za3HpjBQsQCvzAhQ6BpaGlv+DjHgOExooQ0HfV
         JAir/RAuUyosr3CK9LhfE+eJhHCoofllb5EZGkR+CtLmhpAAiWLUVFF4Az2MM/3+uR2l
         PS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744260683; x=1744865483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCICr8Y1TyleAjVDsOU8scGztgtriadImesn1Q8G2jE=;
        b=fFkOBGTYT9KHtfxV9hNF0Z0T8gt+u+u/9fnIgTk97rMbfjl5LXojvkDs9xzwrNWZbY
         aUhjslx5oHs8Frw9ICS4o0hvi9Da9/WHgede0zlLZOhuO1za+0qQaLG4uDdUxbK3upLe
         TOtAWHX8bryv0SJxbj2jFIZOHaSlyeGa3UywLMMu7ukobou1oUtS8R8fUBOLZ6Cv6vW8
         6NyAQrJaUyZXXsPuAqrM8uFJAKPAXP0TAUBTv1adN9ViwEW5kptuWY2v96RD/sGZDiRe
         PeW0QnIWgr2XIbHUCQoS6vobq2kDUDhVKl5ADQcWOae9+3nnCa/xR4jpmy2Atc8+BLB8
         3uYw==
X-Forwarded-Encrypted: i=1; AJvYcCVUufbGK+0GguP9gCCZ67V7jtwPrQX4LzqHJFRFbkcYeOCK2piCGS3skR3KZKSTec+dc8EEcotzmDBQG6c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx6jbE8PiJjQO7oJsydbTzJPHRnSHkKfUa5UVD61JSijk8VCin
	9GwZZtvB9Ff/uD2McoRIf6LJGHdJ6Vlo8/8Q1oOb4AuPVdvQfZWK5ba1VA/lZ8iK0SRLU9XaVpQ
	b0+Bj/qWoiAK98VbVv2nl29zoH61VTUGVyuwmwXygT6jtdkHlYrI=
X-Gm-Gg: ASbGncsyPsUUSlEvgUzx0nKTT1bX4n0+KBEI3g25QUCGoYbs6RhbM3t2jrZ1leJF4ak
	UQdiki9pfYkimfa6D/WwotnX8Ng33EN9lNjRoxOS+/6fMtRxc+GzTRPR6F2kO5DaflJMDBb0d7L
	BOElo1WhL/OfP6C6WSLLCCuyHT8ggo9X56Xus=
X-Google-Smtp-Source: AGHT+IHVCj2wRJMmbo6RZNbl02DjTtI3TJ70CFKiTUTRR9/3TqJXXoa9siW2YcLob+ml2kZdmIqaw4wvzv4K5mehWjs=
X-Received: by 2002:a05:6512:3183:b0:54b:104b:dfcd with SMTP id
 2adb3069b0e04-54cb68a5549mr357294e87.53.1744260682907; Wed, 09 Apr 2025
 21:51:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
 <b3af3747daefa00177b48f4666780da58177f7c0.1744169302.git.hezhongkun.hzk@bytedance.com>
 <20250409190938.f6befeeb9e86ad72f46503a5@linux-foundation.org>
In-Reply-To: <20250409190938.f6befeeb9e86ad72f46503a5@linux-foundation.org>
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
Date: Thu, 10 Apr 2025 12:50:45 +0800
X-Gm-Features: ATxdqUF6D0bvdq2QF7OAMnQbYJVJY8B87-DpNhIZNZl3NEtn10Kry7mFtqaq8jE
Message-ID: <CACSyD1N5--8DSaJrf0JB-n+OsUFvuuQNau5kCmkP8eo2wyN4wQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH V3 2/3] mm: add max swappiness arg to
 lru_gen for anonymous memory only
To: Andrew Morton <akpm@linux-foundation.org>
Cc: hannes@cmpxchg.org, mhocko@suse.com, yosry.ahmed@linux.dev, 
	muchun.song@linux.dev, yuzhao@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 10:10=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Wed,  9 Apr 2025 15:06:19 +0800 Zhongkun He <hezhongkun.hzk@bytedance.=
com> wrote:
>
> > The MGLRU
>
> paging yuzhao?

I have cc yuzhao and look forward to the relay.

>
> > already supports reclaiming only from anonymous memory
> > via the /sys/kernel/debug/lru_gen interface. Now, memory.reclaim
> > also supports the swappiness=3Dmax parameter to enable reclaiming
> > solely from anonymous memory. To unify the semantics of proactive
> > reclaiming from anonymous folios, the max parameter is introduced.
> >
> > Additionally, the use of SWAPPINESS_ANON_ONLY in place of
> > 'MAX_SWAPPINESS + 1' improves code clarity and makes the intention
> > more explicit.
> >
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -2697,8 +2697,11 @@ static bool should_clear_pmd_young(void)
> >               READ_ONCE((lruvec)->lrugen.min_seq[LRU_GEN_FILE]),      \
> >       }
> >
> > +#define max_evictable_type(swappiness)                                =
               \
> > +     ((swappiness) !=3D SWAPPINESS_ANON_ONLY)
> > +
> >  #define evictable_min_seq(min_seq, swappiness)                        =
       \
> > -     min((min_seq)[!(swappiness)], (min_seq)[(swappiness) <=3D MAX_SWA=
PPINESS])
> > +     min((min_seq)[!(swappiness)], (min_seq)[max_evictable_type(swappi=
ness)])
>
> Why oh why did we implement these in cpp?

Just want to make the code more clear.  Maybe we should do more like this

/* The range of swappiness is [0,1-200,201], 0 means file type only;
 * 1-200 anon and file type; 201 anon type only
 */
#define max_type(swappiness) ((swappiness) !=3D SWAPPINESS_ANON_ONLY)
#define min_type(swappiness) !(swappiness)

#define evictable_min_seq(min_seq, swappiness)              \
    min((min_seq)[min_type(swappiness)], (min_seq)[max_type(swappiness)])

 #define for_each_evictable_type(type, swappiness)                      \
-       for ((type) =3D !(swappiness); (type) <=3D ((swappiness) <=3D
MAX_SWAPPINESS); (type)++)
+       for ((type) =3D min_type(swappiness) ; (type) <=3D
max_type(swappiness); (type)++)

>
> >
> > @@ -3857,7 +3860,7 @@ static bool inc_min_seq(struct lruvec *lruvec, in=
t type, int swappiness)
> >       int hist =3D lru_hist_from_seq(lrugen->min_seq[type]);
> >       int new_gen, old_gen =3D lru_gen_from_seq(lrugen->min_seq[type]);
> >
> > -     if (type ? swappiness > MAX_SWAPPINESS : !swappiness)
> > +     if (type ? (swappiness =3D=3D SWAPPINESS_ANON_ONLY) : !swappiness=
)
>
> This expression makes my brain bleed.
>
>         if (type) {
>                 if (swappiness =3D=3D SWAPPINESS_ANON_ONLY) {
>                         /*
>                          * Nice comment explaining why we're doing this
>                          */
>                         goto done;;
>                 }
>         } else {
>                 if (!swappiness) {
>                         /*
>                          * Nice comment explaining why we're doing this
>                          */
>                         goto done;
>                 }
>         }
>
> or
>
>         if (type && (swappiness =3D=3D SWAPPINESS_ANON_ONLY)) {
>                 /*
>                  * Nice comment explaining why we're doing this
>                  */
>                 goto done;
>         }
>
>         if (!type && !swappiness) {
>                 /*
>                  * Nice comment explaining why we're doing this
>                  */
>                 goto done;
>         }
>
> It's much more verbose, but it has the huge advantage that it creates
> locations where we can add comments which tell readers what's going on.
> Which is pretty important, no?
>

Yes, I agree. Will do, thanks.

> >               goto done;
> >
> >       /* prevent cold/hot inversion if the type is evictable */
> > @@ -5523,7 +5526,7 @@ static int run_cmd(char cmd, int memcg_id, int ni=
d, unsigned long seq,
> >
> >       if (swappiness < MIN_SWAPPINESS)
> >               swappiness =3D get_swappiness(lruvec, sc);
> > -     else if (swappiness > MAX_SWAPPINESS + 1)
> > +     else if (swappiness > SWAPPINESS_ANON_ONLY)
> >               goto done;
> >
> >       switch (cmd) {
> > @@ -5580,7 +5583,7 @@ static ssize_t lru_gen_seq_write(struct file *fil=
e, const char __user *src,
> >       while ((cur =3D strsep(&next, ",;\n"))) {
> >               int n;
> >               int end;
> > -             char cmd;
> > +             char cmd, swap_string[5];
> >               unsigned int memcg_id;
> >               unsigned int nid;
> >               unsigned long seq;
> > @@ -5591,13 +5594,22 @@ static ssize_t lru_gen_seq_write(struct file *f=
ile, const char __user *src,
> >               if (!*cur)
> >                       continue;
> >
> > -             n =3D sscanf(cur, "%c %u %u %lu %n %u %n %lu %n", &cmd, &=
memcg_id, &nid,
> > -                        &seq, &end, &swappiness, &end, &opt, &end);
> > +             n =3D sscanf(cur, "%c %u %u %lu %n %4s %n %lu %n", &cmd, =
&memcg_id, &nid,
> > +                        &seq, &end, swap_string, &end, &opt, &end);
>
> Permits userspace to easily overrun swap_string[].  OK, it's root-only,
> but still, why permit this?
>

IICC, the arg in sscanf is %4s meaning the length of the string will
not be allowed to overrun
the swap_string, thanks.

> >               if (n < 4 || cur[end]) {
> >                       err =3D -EINVAL;
> >                       break;
> >               }
> >
> > +             /* set by userspace for anonymous memory only */
> > +             if (!strncmp("max", swap_string, sizeof("max"))) {
>
> Can sscanf() give us a non null-terminated string?
>

No, the sscanf will add '\0' to the end, so the maximum number of
input characters is 4,
and the length of swap_string is 5, with one character reserved for
the null terminator '\0'
for sscanf.

Thanks for your time.

> > +                     swappiness =3D SWAPPINESS_ANON_ONLY;
> > +             } else {
> > +                     err =3D kstrtouint(swap_string, 0, &swappiness);
> > +                     if (err)
> > +                             break;
> > +             }
> > +
> >               err =3D run_cmd(cmd, memcg_id, nid, seq, &sc, swappiness,=
 opt);
> >               if (err)
> >                       break;
>
