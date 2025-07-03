Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8415F347D5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 04:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751517949; cv=none; b=WHk29Xt3+4mEA9aw8+JXjDege1WQmqSJI2UE4LxoXrsK3kdZM0VWd3HIya9+eoVH9cBFCQEpXtKBYIOZTZWbWPBZrfUN0XEpQuo7+XgRVmsoSlRBKYQp0hrDGCZsloSE5gNHaj7t41N8TsZ5VunetZYR9DcXp39Rlnj8FpCBW3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751517949; c=relaxed/simple;
	bh=REyWVYk1AlUZ43xYvfqFknOhrgZw1alsp706btYWDLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iVeaX/UhKTq2Legvdf8MRXMfwwf6qPz+FNuZw7H1YEyXLenlkKVQbgpJ7Yht85yEx5QaCVa1eKVHBnY3IDDka9wezhsbvDmqoEEGvIsomDhTeOKzOO65qLnKw7pbHBcaQTcIkrZqrRNH89MTs88T8ucf4EF1d9LNfhucSwFdEcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pc6a7LgX; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pc6a7LgX"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-313eeb77b1fso4025851a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 21:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751517948; x=1752122748; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1BeljhECYjDDwtUhy76+lnVc/RG3Mx2a9eAH+72paTk=;
        b=Pc6a7LgX4T2kfJAV1H+5RqGGKxqDXc+d5zB0bjPAOjyvY7IQSHk5DCw9IDwnRv5HNP
         WBopgGqkDNeMfuZtq8IZwPf79E9UYH3c2600b/nITLFSMV4eK0oc0u05AQikkNjrfIHc
         jWKkFIo+izzBNHlYat/KLrYbkdrTjKQYreaU7Jw/kTP5uFZlFuenxxSQjyM5VdbLNXZ/
         R1eVsCds1WXh8vhIQ9xj5NKiitelWY/X8ogWPHIErdrQc4CoDGwscVOABrZxlN6cPbx3
         Gbbz5rzMd8gFHzv3cAAEZVOwNaPQ6/RsDGZs0UQWpj4cqeLP4YfJJ7hBnSPfoSOzbeHp
         a8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751517948; x=1752122748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BeljhECYjDDwtUhy76+lnVc/RG3Mx2a9eAH+72paTk=;
        b=WldgYLyeBZDcmUdfJU43AqHhM+PShQoZOERrKnITTNkAgd44G+02hUZJas4ginT1WD
         abYQtOrbCmFGW+z1Iyh1iU0mBupNdmo7jcXMnw3HqbKk8t8ykbF0whER/JvYJbwd6b9X
         AJzLei9Zr98R3sJteKmzF7AU4PX7csvHgvi/UasVQlbw800Gb3PmEJKGqDsYgAc0NFMv
         N03Nq/E3oT4lk67tjGHL95uTzC/7wzpbTjRH2V6K7isr364OckZ/adURAMOpjR3e61Zb
         Z0VN++O5wzMgMiTGFkJwyPShp6Nsy8/jvVLItQIonIlcxZ9l+HyvgvKsSjR6dY/7Oqb/
         2ziA==
X-Forwarded-Encrypted: i=1; AJvYcCXW784HYhdAOjJ9EO4yZ7dyz0N6bV23328wJ6TdsVxaj61No9VSPIqIZpahVTZXpaRUPwhuSrs1olUblLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq+DNYlUpGTiWiE667ETL+R1F95ZiqNkKzos/bPlENRu40AJrA
	urOTQPNW1emLvQtQ7jhQM3wO9kGXhOUotKdi7p/y28O+BVDPoUGfq31osGJ301C8vWtiLUarnvX
	zfmiNpZwD7XCklbUHy+Zc9P9320rgjAA=
X-Gm-Gg: ASbGnctVs6izSIaT22wof3hGl8X1hAVvXNoao8jOSVScpTrkkQ8vsvugB0fe+QcamMd
	emynhx0Irq7XG4sVxOnoPEN7A8kUzrKNRFngYJoE66vuPBwWYoBVpi+5iY1UhcuunX5LUUKCq1w
	/itJ1vebKFDCJL/tvZu/uyJZy+L0k3pzBk3ZlwdPWJsyM=
X-Google-Smtp-Source: AGHT+IEuOhLKF/7DE6r4w82uYWsrw8fhHAmg8ZUV4ao5rNrZvI362lbZZBWo/J+w/bIoeYjAfg0mbMoDfvklpH+UYkQ=
X-Received: by 2002:a17:90b:280c:b0:311:c1ec:7d0a with SMTP id
 98e67ed59e1d1-31a90bece04mr8026878a91.25.1751517947622; Wed, 02 Jul 2025
 21:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702082749.141616-1-aha310510@gmail.com> <7b7d353f-f38b-3205-8fd4-1072dbf69cb6@gentwo.org>
In-Reply-To: <7b7d353f-f38b-3205-8fd4-1072dbf69cb6@gentwo.org>
From: Jeongjun Park <aha310510@gmail.com>
Date: Thu, 3 Jul 2025 13:45:36 +0900
X-Gm-Features: Ac12FXxp251cGnSA30_Y2cOyMV6iAhuJkxr8Go3t_EWL2bdQaNtbK3UYggSR0jE
Message-ID: <CAO9qdTEidRnO4O_D7Z1jKZTyJadFyEyWBnfitTz8t1CdBaM1nw@mail.gmail.com>
Subject: Re: [PATCH] mm/percpu: prevent concurrency problem for
 pcpu_nr_populated read with spin lock
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: dennis@kernel.org, tj@kernel.org, akpm@linux-foundation.org, 
	vbabka@suse.cz, rientjes@google.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+e5bd32b79413e86f389e@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
>
> On Wed, 2 Jul 2025, Jeongjun Park wrote:
>
> > diff --git a/mm/percpu.c b/mm/percpu.c
> > index b35494c8ede2..0f98b857fb36 100644
> > --- a/mm/percpu.c
> > +++ b/mm/percpu.c
> > @@ -3355,7 +3355,13 @@ void __init setup_per_cpu_areas(void)
> >   */
> >  unsigned long pcpu_nr_pages(void)
> >  {
> > -     return pcpu_nr_populated * pcpu_nr_units;
> > +     unsigned long flags, ret;
> > +
> > +     spin_lock_irqsave(&pcpu_lock, flags);
> > +     ret = pcpu_nr_populated * pcpu_nr_units;
> > +     spin_unlock_irqrestore(&pcpu_lock, flags);
>
>
> Ummm.. What? You are protecting a single read with a spinlock? There needs
> to be some updating of data somewhere for this to make sense.
>
>
> Unless a different critical section protected by the lock sets the value
> intermittendly to something you are not allowed to see before a final
> store of a valid value. But that would be unusual.
>
> This is an academic exercise or did you really see a problem?
>
> What is racing?
>
>

This patch is by no means an academic exercise.

As written in the reported tag, This race has actually been reported
in syzbot [1].

[1]: https://syzkaller.appspot.com/bug?extid=e5bd32b79413e86f389e

pcpu_nr_populated is currently being write in pcpu_chunk_populated()
and pcpu_chunk_depopulated(), and since this two functions perform
pcpu_nr_populated write under the protection of pcpu_lock, there is no
race for write/write.

However, since pcpu_nr_pages(), which performs a read operation on
pcpu_nr_populated, is not protected by pcpu_lock, races between read/write
can easily occur.

Therefore, I think it is appropriate to protect it through pcpu_lock
according to the comment written in the definition of pcpu_nr_populated.

--
Regards,

Jeongjun Park
