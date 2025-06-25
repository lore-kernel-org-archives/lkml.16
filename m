Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FD426B76F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869400; cv=none; b=AsNbriFIupyN08dPwNml9pM2wn9xaL3ywbqayc/iF7pbn8EIVUnxfpRARVcdUZhS9ijVOTOxOztKDgCYtubMoNpFUXEsb509H9DSUoo6eKuSQy8bCsQ5oj7GI82PvNUS1HETbTdCDyRHKkjB0a3hcb/FP2VQ03nSdhVSuMQEILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869400; c=relaxed/simple;
	bh=4ear9BR5ao8w41aTFfDMqeoxM9P/vLl4dJGEeI5wa5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2W6SSqEjTS+lN3tZlJ5xbHfwmGjKg/zaF9FwwNkAPHcILwNHc9CPirCGs28es9LxNe+IEFm25Z2aLe1ZYUGvEf3i7oAmw8PnxZG63ETNO1mu7ztXcF4EfkuV9g3JFysakeEG7wSZfwPSo8026Kw4LCaUeXsRU107qOsqIPSZUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dV+Q44u2; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dV+Q44u2"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fad8b4c927so1475786d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750869398; x=1751474198; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5Qu2toIg5Y0E5CCzKk1BSuXsD4Z10VADvrjtzkS7+XE=;
        b=dV+Q44u2gW9sn4FwaZBSXBP0t1tS9BDNY1voMu0XmwnMe7Jijz0lz99Dxwl50AppZE
         oeqaHqo0dhX1WbPo1LqQj1GSUB3S6FMBDNcT9AxGgXx8cGsvxbPwJpMVMsOvplGTUKjq
         Ya8R50dH6rWtM6axGT8SOADvDAoZSHuCE2lq2yKMGhXuqd9DJUtxQw0gzFIk2CB/zWZN
         JJ3LIxVw8KmsDwwOIwxecVQOEMGDsirsubSfrUuS1A7wy9+kxdHLX7jMgx2FBtgos9kf
         c+kwIa7gbulB9zqtPOrMDzI72+tMZ59gDK9A8HkNPeMGWLsfw+X0+wPNywSEnlYYMLab
         6SzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750869398; x=1751474198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Qu2toIg5Y0E5CCzKk1BSuXsD4Z10VADvrjtzkS7+XE=;
        b=HfwUSCqQEU16peef7gpssqJepEWOfPIU5qvJKUFRcw4Y/WMHR/t5HHFjPGDS1SSNkC
         Mt6nS0DJxMjURPIwsU0iF7XUueqac9A10ETk1TzlN7GqHDQ+zjvSTpgWIduyq4LPS/b6
         AuapRSvYnH+5Jx9wa/msC1WozdIpYH+gUw7ZjVR1iqV3ayXa/fU4MKer+cZk81nNuJ6L
         CphCT6GFCI1C0G0ddoPBXfjpHJph0J63M0E4QSmGMFERIWp1s6EkFph3pRt04AbhB93c
         PU6eioFA+HLO7o+zPX4JFTDSO79JrySNIgG/CKZVTVu3lhuJuHmyXXj82S78Vuju1mMH
         UFDg==
X-Forwarded-Encrypted: i=1; AJvYcCUBkek//aO5bU3gEOC7jM62i7rKwQBr/nRlMkyUAI8kWh5/VE8jjeJ/hmSyX+GtT9KRCaPDsnbugZ4lY9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz27cJKLEULThMNEjXiWXpXT/xx0G6Owq/35aY8RqUQsmfMKpNM
	fcld2z0t002pvp19VGvmjS13RtqJVpNIQlEA5YQg6+F4FbK0M2Wr5V2z8cVd4lc/4MWj9ieyJkW
	kyfRDtY1p4vXM8qrsMlnfHozrjWSYQq20wK1Fgq6c
X-Gm-Gg: ASbGncuCVE97QlMCBPS07Kh+0ZR4NbdTDiLVumlISl6wwPPQdPoSr0Hk/yOkkweYX8N
	vv55w02EIP+epXwB/M1tmVdzN2FGGe86WLxkbf1pv/3EvsV9HvBpzp0d//F1jl6RM8IaSnCJpaD
	mr3gTbN2QMyJ9dDbpDVuLg6OR0i74zJB5Cyht/G9WiLNOau2az8s60SLmxk0TL9psijh4O9Wq+k
	Q==
X-Google-Smtp-Source: AGHT+IFZinRWAqduPvYBiu6AREGfW3a4FxXXe9a7oF0NjBS65KTQQh6k+1MviZFF7u3Go36WFMDFt838XqF18XbijEI=
X-Received: by 2002:a05:6214:e84:b0:6fa:b954:2c32 with SMTP id
 6a1803df08f44-6fd5efba51dmr59869306d6.35.1750869397725; Wed, 25 Jun 2025
 09:36:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416085446.480069-1-glider@google.com> <20250416085446.480069-3-glider@google.com>
 <CANpmjNNCf+ep-1-jZV9GURy7UkVX5CJF7sE_sGXV8KWoL6QPtQ@mail.gmail.com>
In-Reply-To: <CANpmjNNCf+ep-1-jZV9GURy7UkVX5CJF7sE_sGXV8KWoL6QPtQ@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 25 Jun 2025 18:36:00 +0200
X-Gm-Features: Ac12FXyGrTNxbXgGGfhFeRYZAXPZadlkZ6ZWurZ6L_D0Ky6s5cgzx6IHfa3uFrc
Message-ID: <CAG_fn=VwC3hx3TqWNwR7G_SKYXnVHTjX3OKHvABD3=31L8y3bA@mail.gmail.com>
Subject: Re: [PATCH 2/7] kcov: factor out struct kcov_state
To: Marco Elver <elver@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

> >         if (data->saved_kcov) {
> > -               kcov_start(t, data->saved_kcov, data->saved_size,
> > -                          data->saved_area, data->saved_mode,
> > -                          data->saved_sequence);
> > -               data->saved_mode = 0;
> > -               data->saved_size = 0;
> > -               data->saved_area = NULL;
> > -               data->saved_sequence = 0;
> > +               kcov_start(t, data->saved_kcov, &data->saved_state);
> > +               data->saved_state = (struct kcov_state){ 0 };
>
> Unsure how the compiler optimizes this (does it create a temporary and
> then assigns it?). Maybe just memset is clearer.

Missed this one - I am not convinced a memset is clearer, but recent
patches mention that '{ }' is preferred over '{ 0 }'.
