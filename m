Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698D13D52F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743100057; cv=none; b=eSrkV2Sn6rGe7dPeLxk4QmOKCG9Jvh+TG77RT0ZZGP3u/6LQIKwexrEeny2GsSVt3WojYzemmLKU7bDJrgFLk9Y7PVl2A0ULJn0vgAIBUP+PAwatdR8Mgm6nr+rUGw/lGPJjlfNHFmHJqAfizumyhO+rGErddTFFjHBbw8BFi7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743100057; c=relaxed/simple;
	bh=H4SQq9c3BG+BGZJq2PWQ9+OGqdEw1bMbKxYbAWHmA4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PSTL+tu8g/Mo9j5oPplbe81IGvjJJREiN61aWvyhB6zrVxwTZt0aIg9MVdeYPJXVEeAzDC0cJNu/iUECD7LIweLaHBI+90bYLknUjWv85HIkhK/kRGICo9lIWiiai0QVfuMCIFtn7IpiphoeuRSavcCJ3miqSW0lj87jUrAI8Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ygaDaSyp; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ygaDaSyp"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6fead317874so11417727b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743100053; x=1743704853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1T0t+yj48XDj+5N7Hw5aN1g6zWRep2KUB4u7M34BaQ=;
        b=ygaDaSyphWrgV9ZgaBaidTyOsALtv0f19PaseZzJpqNOhTNCae0WMunumzlZLFNN+4
         agvcaf4ECu7QYgIVcow3d4t3+mbe7KfdEG0cm64qJuXmHmxzbE0yM1uodNa26UEMukN6
         d57UPCcWAmUg8uO1wxpqOWP/XT3K9Bb4qj1OcGV7C4l/bSET9G6MX7nX9G8HFraubn4m
         g2TL9jCYWyh3IA+8TJcw3iIsdWvTIHtq/vAM8OsFU4LMCpqSPnUZpe7EC2pQpRV/MjZj
         ZGh08tdAR6OwSuQH3WU/N5UhRfb767liMWztu/cCX63rCoAxGS6NTxZ3WJ+tPTrSUhaT
         Fayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743100053; x=1743704853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1T0t+yj48XDj+5N7Hw5aN1g6zWRep2KUB4u7M34BaQ=;
        b=IQBaLr+IpSHIXWz9zqjVUZ7JRTO1ddTAAUKa9NtkF13KEJj0/LYZl0TVYdJ6nR8+jQ
         TRcd1x1ZtedXeuheAImFdBc1TQQvOsx0QGPxkcYgWAd5LqN/3P7YKCeuzGhwvR3NmCGW
         0NB769YQxuuvmSxkVeidZ0hr3DPLfTF2TCQe+47m0EzX/J5djfVviWUzFFw/bN3l5+T+
         +6yjXtZBSI4TLofUCdt4FAlyWmdkB1QacjFWBJh/yhE9M2x42qr0yeAMtC7c6vWN+cH/
         H/qILok56idYqN2rHyUFavsanGpH48S4+Zh+EeiBK3eYGp5z/Z+6mwu2vRtsuiHxvUzy
         8veg==
X-Forwarded-Encrypted: i=1; AJvYcCVGxg3OnFaKTrYwQLDYIhWwwMwmFATH7KzTuT4++FVJoGTmIkRoHjXWUylfkpUWY+KPIu6zqF2c17aG33A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw4zBC4ZvVYsZGBykDm799Met9U5WkAIFGalMp6xS7iFykUb57
	lu9QUesdNxQta5DHlQL+5OYFlji3Yst234uLMIf9I9Zi1kwoEEO56KpZMNpJUmx8dXY9kxsaxbo
	2gnTOYCTx/TOTqRXOlRV64FWN52vrAd8sO4wV
X-Gm-Gg: ASbGncuu6caLfx232hrOhp+nPT44S0nRP4ke6eKdddgAhPqO+h0xQRsUhObDVCGEx47
	lARtDlh8P1Wgc8hGuXP9/DtFLQ5NqJDX/w6JOtdove+tFD57kTjZtEOfubxbgIv3UcnCvhjGg6p
	NgJ59VyRAeYPaMTqr8FysKhlynyQ4r4+Pgfvo05RAfywoniHse+PvMmjsu
X-Google-Smtp-Source: AGHT+IF9r5WJAzdfDcQntbLZwhD5EGz+o+pnNk64HYaUbkhC9xRE3GDrX1KAucYtv+JfqlvbFLsjF4WRjfPT9DtRnoM=
X-Received: by 2002:a05:690c:6f92:b0:6f7:55a2:4cf5 with SMTP id
 00721157ae682-70224efddf4mr69462527b3.2.1743100053279; Thu, 27 Mar 2025
 11:27:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327012350.1135621-1-jthoughton@google.com> <20250327012350.1135621-6-jthoughton@google.com>
In-Reply-To: <20250327012350.1135621-6-jthoughton@google.com>
From: James Houghton <jthoughton@google.com>
Date: Thu, 27 Mar 2025 11:26:57 -0700
X-Gm-Features: AQ5f1Jqui55DD7gnN51tyeqg8zK6HJAcKnkL3KKDypvtSprHeM9DbaOlKdOqBZo
Message-ID: <CADrL8HXEb0r8sRie_q48ry8r30LpBZqAs4a1iN8N9BZ09FZzUw@mail.gmail.com>
Subject: Re: [PATCH 5/5] KVM: selftests: access_tracking_perf_test: Use MGLRU
 for access tracking
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, mkoutny@suse.com, 
	Yu Zhao <yuzhao@google.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 6:25=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
> diff --git a/tools/testing/selftests/kvm/access_tracking_perf_test.c b/to=
ols/testing/selftests/kvm/access_tracking_perf_test.c
> index 0e594883ec13e..1c8e43e18e4c6 100644
> --- a/tools/testing/selftests/kvm/access_tracking_perf_test.c
> +++ b/tools/testing/selftests/kvm/access_tracking_perf_test.c
> @@ -318,6 +415,15 @@ static void run_test(enum vm_guest_mode mode, void *=
arg)
>         pr_info("\n");
>         access_memory(vm, nr_vcpus, ACCESS_WRITE, "Populating memory");
>
> +       if (use_lru_gen) {
> +               struct memcg_stats stats;
> +
> +               /* Do an initial page table scan */

This comment is wrong, sorry. I'll just drop it.

I initially had a lru_gen_do_aging() here to verify that everything
was tracked in the lru_gen debugfs, but everything is already tracked
anyway. Doing an aging pass here means that the "control" write after
this is writing to idle memory, so it ceases to be a control.

> +               lru_gen_read_memcg_stats(&stats, TEST_MEMCG_NAME);
> +               TEST_ASSERT(lru_gen_sum_memcg_stats(&stats) >=3D total_pa=
ges,
> +                           "Not all pages accounted for. Was the memcg s=
et up correctly?");
> +       }
> +
>         /* As a control, read and write to the populated memory first. */
>         access_memory(vm, nr_vcpus, ACCESS_WRITE, "Writing to populated m=
emory");
>         access_memory(vm, nr_vcpus, ACCESS_READ, "Reading from populated =
memory");
