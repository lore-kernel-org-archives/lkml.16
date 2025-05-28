Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF1928DEFD
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451363; cv=none; b=jxhmAm8bdIg3QV1El1A3LF13m15HaXiCTEFsNYSrvxhc61e/D61OcgZU7YjLvTNClJwB2tR3mVdO00Y6x0/cvdz1mRug9tHGIxks0/LShJ3YkcwJqlTpUkLjHUXtsQWcGsSXl0SPSULpsOZc2ZGI6bIWlWW/+jenlBC/Po8K044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451363; c=relaxed/simple;
	bh=s2mpbG+Wmsk0+RL9WPmIdr/4N9FOcJOQ27nbvrji9iU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUPXWYAv5bDy5Z9bhPYE0j5d9+VCJKz4AzK78xyyQEL9EbKWG82Zq3xwEmTjNhz7jb7pwQC656taPu1rjwU98oZfpqhlAcMDX4/anteyyN9tRBb4sE/2mwx1r39jbcbUwx3wxfMGbgouN7s3CjnUZIR8H+gScG1BXMoJTWszMlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=F0odYw5m; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F0odYw5m"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ad88eb71eb5so287022866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748451358; x=1749056158; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T9zftyONzu0MxcoYD44tY7ej2NBy3CRmkjGElcgv6+c=;
        b=F0odYw5msG4Y3a+/U2TSYnct7KXGpS92sgozmiMbyH89StvodvpBrf3v2DE7Rl1tIg
         XMFKQ2NiVP0Vo2sjEZ3iSKIPyY6+k+dUIwGYK+9VvyWNMPo5xAa+5pfsjYUO8bRWcME9
         F4ilCynT2APSK31NVnOY4eDCFHDyNpiawT1u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451358; x=1749056158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9zftyONzu0MxcoYD44tY7ej2NBy3CRmkjGElcgv6+c=;
        b=VUUbIKucO0ebn+BdQxLDEEzz3MqSndfBqmZTrZlgK22Z5N3wEowaAv800H5cvKZHBB
         0DHP24EtuRxvUjJ2KaONOdDjZZ50SMdqdpnXgd+OnK59lvcO52WF1iV7brnWxwLQTPBE
         vzPBjUUBLiOb5dRA/pxuO8bt+i5mljiWGnbKdPy3ijgeICPoNIuzON1Z6Q7L136XsJQq
         +mffAslqu0dMWIMVhZ//qXK0DiZAXSP0J7zp8N32zO2JZ+eXZrOmHvj96/6wZCUhvD66
         0H05v4IIr4k6hphLSHFJFbRDB29ndqSIU3qCmvHM9qwLap+gZcI0uAvu1RpyQgqxZdME
         mE8A==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8FWYqNUuZxkGPM+IDFfPIba5J2jbtVRDKf8orwkJ8u62RerhGaHqZ4Xaq/fzjUHwR+2iGQ9I+CgDna0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEPXHrqhcexoKMZQCxTRE+nQBOyQquGM2wsBs/Qejzg+pO9TyX
	WhKMwJqTdbfNuz5fBqV/f3AKz6szc80SWhJ7FsiK3fduqWU7ldZjuvaKoL2JyTYT/Nen7yMGkq8
	YX0IoR0Y=
X-Gm-Gg: ASbGncsOCMVgW9x/8kTp2HsU4f1ZJoOsKb722VMy6j8XbOVQ4rOtNIEGfwDgFIXIh1O
	jmfja2M2LM6sKSeODS44ZSPMmnPnV6rfVoHAMUyHfGEsVvN+7MYA8UcP1/rCRN00ftl4TfAWkEm
	BjyoaMIqmkcU4MNHqdwkWLM1624aJCT525ju0HCFTc/Xl2+WWcp34C8Nf8Z9wMT3eUMXUQ2lYwb
	ejGAdnA5KHVV8og/oH3RmzS/A+zmzlZFyWJKsIdzSUm+YNvlwn7veswgLMDmSqqF+50iaAXxJRB
	isQhemtGWKnF9m8xXl7aW/d9vIGuVZWotLysc0zJ4jsggHaXicWVAfsAnbQdTagsbdnOBmFqTaX
	Uo+BP3Gm7AtTZfbP2mUDClF5YwqlOlF1KbUj1
X-Google-Smtp-Source: AGHT+IEGnXdozyY/N+r546i1z7G7zuOSgM5gbK2h2guO1A/FqgKVc8si5NIvAlyK5b1rwZjC1XJHPQ==
X-Received: by 2002:a17:907:9483:b0:ad8:9428:6a4a with SMTP id a640c23a62f3a-ad894286c73mr641883366b.32.1748451358569;
        Wed, 28 May 2025 09:55:58 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b28a53sm134446166b.111.2025.05.28.09.55.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 09:55:57 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6045a8a59c5so46764a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:55:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3zqB3C63e5uQ+UyIP466bTpxc98qpRJDMBdKrojvih0q9r+Va/hdB5HkH+wIoDgEVICF5uXB4kZMdJrc=@vger.kernel.org
X-Received: by 2002:a05:6402:2713:b0:602:2d06:6b19 with SMTP id
 4fb4d7f45d1cf-602d8e4f276mr13902719a12.1.1748451357548; Wed, 28 May 2025
 09:55:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
In-Reply-To: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 May 2025 09:55:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=whY4xa2jbwUxPb8hxAaRnqvrUQUNZst_ESzcUCmog7V1g@mail.gmail.com>
X-Gm-Features: AX0GCFsVq47usAFeSsFikWlaY95wGDZZ-D6yA0JKD_281NR-chPF1aQ_CKdAJJo
Message-ID: <CAHk-=whY4xa2jbwUxPb8hxAaRnqvrUQUNZst_ESzcUCmog7V1g@mail.gmail.com>
Subject: Re: [git pull] drm for 6.16-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 May 2025 at 20:51, Dave Airlie <airlied@gmail.com> wrote:
>
> I've put a trial merge result at
> https://github.com/airlied/linux/tree/drm-next-6.16-rc1-merged

I have trivial differences due to picking different line ordering for
some things, but your merge also left in a wrong (but ultimately
harmless) duplicate #define for LRC_PPHWSP_SIZE.

                Linus
