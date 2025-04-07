Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6114921ABBC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 20:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744057526; cv=none; b=OSSIQ42rBo60VuMGDPN7Jwnb0WVhZqDMp74QMaB4QLxPUMFhAqS6doxIl1MLlE29djPQBEkB2E/TiXSxfF0Bs80voRda9L+uQmyQvb7Qbhl4TiQduIyE4prfsOppUOMRmVx6+d/6EJfu94MmpaMzC8l61yfGQlEXL78wuy7Zfbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744057526; c=relaxed/simple;
	bh=LvjjTUBL7nRo0DS6OmeCHChrliSBmLsfHeg9Df9+4bI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KT+7dqEWC1KX2KHvzfYti93fXOEzutn1zngSE8t17bMYm6fPJjZoCwRHhcKChNq/Qv1JhEaZyC1WigT0LBWXRO03+67ECICWT7jmyqaigvggmMx8wyadig/+tIoCC1HkKfy5IEPoMC78J9mYbVN/ETYyvKMnCSOjyrKflmsgwi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Png2GZsW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Png2GZsW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso7524909a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 13:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744057522; x=1744662322; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oZ0zUiXGKdgO4azOtSCYJ2wFMy4AzS9ZbaPfuT4i/eM=;
        b=Png2GZsWeZBZQzyKB3o722j2pyU0zzi7sCGDyfxBkQOgSVRRR5mUNhGgcmyxnDBGxe
         C3RIhjGH6+I+/RrzBdzHnHN0JTMtJvrDhUodtOMulRPthni1rWP8YFA5I4v4L2pe3zFc
         0UbPFvYvqleYRBN2mw0qT4NAls1rGFVExFwfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744057522; x=1744662322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZ0zUiXGKdgO4azOtSCYJ2wFMy4AzS9ZbaPfuT4i/eM=;
        b=YBbWI3tWUtAaAzr3qqO87FfX+RlP/N9m1oQ726KufWGXjyGCuLZ+xcDK+8ZrkbWQ+J
         cva7+hKavRX4U18XAYcEOW9fODHHB9NWXKKek3Guxntg+D4Zf6UC1a3NIBZbE+g8/x4G
         LM3hY1YEHKxe14fiZBClj1/qXR8dXK8aBWFp7MDPavi9E0N86SCGBKrfI274wY5LW3xJ
         +oZaVrrI/PgqHBSXPoEPk95dn0a7ASr5DLNtwH0E5Ty/eY0N83ZlRV1setb9BL/n49LQ
         7R84En+EKDMA+uVYCfEezf+3KnOEhya6NhbQodKur2c0TlzjM1tVzJprvd8kkG/u4Suq
         W99A==
X-Forwarded-Encrypted: i=1; AJvYcCWrSwC13dehT0GAp4ObIjT4E2ETbyevdeR62QjBbanAL8/Jcz9OwnkPvbbUWOeyV0k9WaDJbbEcwx2e/9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIchPIASvKC8xJc+SMw+k+hmmcpa9oNpbIeOGBTOR4zbnns+4B
	eQYWMi8wHFkXkUFXcejjpsJswPoc2r4X/h7LBX/eCRVl83EkxBOENe6G5AtGkCCVmhYqTnG5U/R
	SV2s=
X-Gm-Gg: ASbGncsty5jAcm2jrmcscAiEgYuVJZwgvf/+9+QH8NgettjGDzJ0CGMWJ8x9OxK5mDQ
	F6H+rEOugQFIqvmiqRXJguJjLb3wXk0v/EgXn6ioW/s9VzcMdzOTuGr/i8/HhPm9FtEOxZY7KGh
	wtd5g9JZr5HU4N/TdXHa4GdSRaEyEx88PM2yOsdo6d4hXYcGkLho5U5qv7VYAH/4cpQpQ/ncXG7
	rhhxoE45Rxan96f4ngjw5nDJ30aEW8aImniy//q7B9h8zu3o5HQGcFOvWjHfF6rN3Z5CN5x5Avx
	KoVNYYZqdoeGsg1PqNm1w6ZJD10eoQG9brSqnG6oIQm561pZMNWEUFPqNiZzaHttQCAyXrJEBpa
	U+cwDmxWgQYSGX/Jq2AU=
X-Google-Smtp-Source: AGHT+IGVMspw7pAsVKuhEoJNMBvDjiZ5COjHnQDYusUXaIGTMdwTmsIN0Ze3lwodo27FyOa5V535sQ==
X-Received: by 2002:a17:907:9693:b0:ac7:7f13:2e80 with SMTP id a640c23a62f3a-ac7d6c9f3b0mr1024776766b.9.1744057522448;
        Mon, 07 Apr 2025 13:25:22 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c10dcsm795301066b.180.2025.04.07.13.25.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 13:25:21 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac25520a289so842689666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 13:25:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULcTF1LWQicHih9Hi+Lm5rLNZCLcOBnecbdgpuVa0bHpYu5ABDtALK+deuodSK/C3WQziHVueR/f/TRdE=@vger.kernel.org
X-Received: by 2002:a17:907:720e:b0:abf:6cc9:7ef5 with SMTP id
 a640c23a62f3a-ac7d6e07739mr1134446266b.47.1744057521070; Mon, 07 Apr 2025
 13:25:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504061053.F27227CA@keescook> <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
 <FFE5FB0B-CC92-4A25-8014-E7548AD1C469@kernel.org> <CAHk-=wijG2dSOOFr8CCYygwxZQxdTUj73rfB8=tyZP-3G-8-og@mail.gmail.com>
 <20250407173741.GA3847400@ax162> <CAHk-=wi89ogViEN5oTBmcNQXnMEB5_Qse9G401pSNzocP_dqQQ@mail.gmail.com>
 <20250407192537.GA518371@ax162>
In-Reply-To: <20250407192537.GA518371@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Apr 2025 13:25:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiQgK1ciFurQcHib8gF5oD8ZrWOaCPLDNLn=7ZvkF4=mQ@mail.gmail.com>
X-Gm-Features: ATxdqUGmNt-Le7y3oz-w0oLuti0mExsYRb0CjSrNEPREpJDOaXWw0kBCxRew8Z4
Message-ID: <CAHk-=wiQgK1ciFurQcHib8gF5oD8ZrWOaCPLDNLn=7ZvkF4=mQ@mail.gmail.com>
Subject: Re: [GIT PULL] string fixes for v6.15-rc1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrey Konovalov <andreyknvl@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Peter Collingbourne <pcc@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

 On Mon, 7 Apr 2025 at 12:25, Nathan Chancellor <nathan@kernel.org> wrote:
>
> or if you do want this for GCC too, unconditionally adding it should be
> fine too.

I think if unconditionally works, that's probably the best option
simply because it's the simplest option.

But I don't see 'wcslen' in the gcc docs, which was why I was assuming
it wanted that "check if it works" thing with "$(call cc-option,...)"

I don't think we need to call out the particular compiler, since the
argument against using it is not compiler-specific per se.

             Linus
