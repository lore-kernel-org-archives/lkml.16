Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E61126C05
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 09:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746093164; cv=none; b=CW1509QozdLYFeRd5y4c4Fa+WmwMMwj9ky4LMb2fXzKemDx4SlGFQssltR9Hw+EtFkLybwkwdK9gAePDIviuReVq7Ccoqadh6t64yHwPWlsXrr/35IUi9sv9DrM4lkUSroDjQoOfjSR0AeJLfRn7Xor5fcIr5nkIU6nmNXbcgPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746093164; c=relaxed/simple;
	bh=tzbvcq/eqM5LJGJ6VfJbySI9KJbF1MqwF5xnau4lDyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svhAllURtau1A88Pi0DDbQLVmMPGdjldftcRdxnMarDqDbFoUXDNvjwBbZbpu/Xs8IsAtcGjC3Tj7tMlkPHBrWdDDjzlv8MO27P+bVWnfHt7f88Anx5PuGHu6uf2bfNA4GQwGQdaYnYOHXL1n8fO/1m/ngfNGNjS7fXndbk/CsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=AoXCtza+; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="AoXCtza+"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac25d2b2354so117993366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 02:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1746093161; x=1746697961; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tzbvcq/eqM5LJGJ6VfJbySI9KJbF1MqwF5xnau4lDyM=;
        b=AoXCtza+qQ8N1eOTXyT0kg3mYoWne49rME4bz0Vteo/YM1xy/kCRkLrJ5Rr6+c8sku
         2rYcnQ6wJ/N7D42cCT7iFzYKIDo0JXgVhYSBVoIq2GJ9BHoeB7Q5AUVSzDGtCmZ21yDB
         Maw2AMuXGU1MCikEg0osbbSeL8qNdvsEe8ZyXpqtymKR1M+Cf77UfvTShYLW9Q+mwaAU
         rCtcNKTxlEsKIAq4eZ4j2gHUnZuunBlNLlhJnGPR27buz+J2dHhGZOAMkQ9m0INbVQvZ
         rXOOOpg7WkJ7bUNoc+dAjO4qocxXze1NRqYxdKoyFX+iCBmUFXpE3HRGxpWa1UBbe4/q
         GFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746093161; x=1746697961;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzbvcq/eqM5LJGJ6VfJbySI9KJbF1MqwF5xnau4lDyM=;
        b=IrFkio/kg1/Y01sfehn4s5UBUvdpqH+iGkfCpjFRc0WsMslqUcw8HzMrfkQ7RY9LF6
         xOoUtP31tl5o5oQbhf5pB4l2WdTgJOWCb/6n8m0zG8wbElpzw1/vgbQ4tNyZqF+O3kKX
         fwJtidr3O2roFATWhLI0cX9/oyjR5AWsVd/U70MnxMP/pyDjCP9Gfz7Vg4mupbG3oiML
         OAw4QCSeYSHfR7ZKNn9IDOl7vrIQgIZg6/VFgvQ1v2GTecjgPyaH5FBD9mjTl5ViMbQv
         dQQweOOEnPY1VO8kATK9TR/Jl3TGC6WDd123F4n/N6NaVMIlqw4xPXsSFAKGrxmp+xsx
         2yrg==
X-Forwarded-Encrypted: i=1; AJvYcCXQuDOuyxHmfGicgJ1LyvYw3kt0DQbRIQ/GqhJ6Y2UvkvVogOWK4aJZpkI6FxBzSxYV49CEOj7ezKz4FbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCSjgGZB3B04+Jw/ZpMAVLNPslBMvCJpPEwZPdvCkTpwEH80p4
	BohELS0pifr6j5eSrpS26JhvdKnMa/WmOopwz7cJNwRgrv1GxBnf+N9oIaIXxHkZM9ouaoerII3
	NprAO8/g819EC8ufRFUBxSawot16yJ87S0pdeOQ==
X-Gm-Gg: ASbGncvzw6TGD8iBf0kQS5jH3KCMZKu+6T9odOPUIElN2hQM/vtKUCLWxg+T4N6MUfB
	41IBUkb659UftRwzHwR66TXzoVeOTdLDrORGdU7oWNDl+oLJvh5ysutI78FLyugPacPWzNoCn8h
	Kff6A+e4pFuV8ercTs3+uMj0Zz1K9CbmPXj7H6RXk=
X-Google-Smtp-Source: AGHT+IEmvvLMYO8qJWrWkmvOqgPtTtMz2KAk8/nNGpdc+ru4ajhvefujkd4u2hphQE2mer2OLe3o7NP7c1m1UjT9NAo=
X-Received: by 2002:a17:907:96a0:b0:ace:3a1b:d3d with SMTP id
 a640c23a62f3a-acefbb0af2fmr177736966b.2.1746093160990; Thu, 01 May 2025
 02:52:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGis_TVSAPjYwVjUyur0_NFsDi9jmJ_oWhBHrJ-bEknG-nJO9Q@mail.gmail.com>
 <dd2db843-843f-db15-c54f-f2c44548dee3@huaweicloud.com> <CAGis_TWtWMK93nVBa_D_Y2D3Su8x_dDNwNw9h=v=8zoaHuAXBA@mail.gmail.com>
 <2bb4f6ef-c25a-887f-6a0b-434fc8e1e54e@huaweicloud.com>
In-Reply-To: <2bb4f6ef-c25a-887f-6a0b-434fc8e1e54e@huaweicloud.com>
From: Matt Fleming <mfleming@cloudflare.com>
Date: Thu, 1 May 2025 10:52:30 +0100
X-Gm-Features: ATxdqUEOl2Jos_1LB_nA79mgRGbwhQL75iai5nmsBpKtbWE2vVWvBVN3O5yKgkg
Message-ID: <CAGis_TW2QqbMW9dW1q4ZwBtoZd=R0rxzcCrzBMDgOjdw-5HmRQ@mail.gmail.com>
Subject: Re: 10x I/O await times in 6.12
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team <kernel-team@cloudflare.com>, 
	"yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Apr 2025 at 03:35, Yu Kuai <yukuai1@huaweicloud.com> wrote:
>
> Thanks for the test.
>
> Do you have any suggestions? For now, I can think of two different
> fixes:
>
> 1) clear time for the preempt case. On the one hand, preempt can be
> frequent, cauing performance degradation; On the other hand, this can't
> solve all the problems, for example, lots of interrupt or lots of BIO
> issued into one round of plug.
>
> 2) delay setting rq start time to flush plug, however, the latency value
> is still not accurate, and will be slightly smaller instead of greater.

Hi Kuai and Jens, is there any news here?

Thanks,
Matt
