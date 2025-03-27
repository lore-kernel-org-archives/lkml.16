Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BC6DDD3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 00:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743036585; cv=none; b=qCbIx1kfrUdYggzDhw4CnAq/ARJH54vxMNutwHuvVcnEevD5lrEHqTSgc1nRZRUYQzdZRKBr1Fr3GKuXe2zf+oopvu5UOvZh44Sa3leHZw6jp6ziIkzFaLYM86LXam7xErPE4IaB3+v+XpRT49kcNwS268Wk8Gkd/xRKdReMPSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743036585; c=relaxed/simple;
	bh=uTlzJpHa/l39T+5v82eVcl2xNO4vUMg9lTUbP+RWk38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+pZC9Bg6AcLU3Tz5+7aeyjBBIGPixOQsrdt54MfE+6CUpZ6FSRNdtZB5jeBOa2AER1QpaxZeY29RUkKpiP7Xl+wE+WDlv4X7bXCbUDcigYJQfuZ6RfUtcdv9ej/eGX+hXRRB+UwbZ5vY2NdvKNqnW61puo39LD3jzRhpOG0R08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WJxxTZfs; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WJxxTZfs"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e673822f76so671555a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 17:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743036581; x=1743641381; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F1EIgK2xuAYOvd8rhnPgSHreHLkjAZKxgBPQFMjmtwY=;
        b=WJxxTZfsAQxWwyUu+J3PPAkM5qokCZDucwh8bl5T6VWCqdUNeLyHpBJV8s4NVl0I/r
         YGBHFygakG46ADcho0qc1aTY8fmd7kABwpZcMt4t+LJ3eAbjXg+GCGrD4vFX50cwH2n/
         8xMe2HFku9ZOebvilpzYWw59Ll+terI4BQMuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743036581; x=1743641381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1EIgK2xuAYOvd8rhnPgSHreHLkjAZKxgBPQFMjmtwY=;
        b=giKuouJHIcoQ98yzgnYZQ47XxINhPo7S2Us1ABFbE7OI3WwBHlRy83uBnmss9By+PN
         4YaWRhT3PWXBe6RFloVvy+VY6v+wfKu2GkxWGb5wSQdPlxnSVZSJVjXbdUUzWgm0v0NK
         OpDjFAvFiZ+E+VDVPmT4lt1Stye/UFpL+rC71oDPGPLEPJijBOJr72krQyleOFjXDsHZ
         yZ+5s9CQ+TasXPqURwMCPuOlUzJNagaDtbZI8zFE2y0Roqm3trag6TrTqsoGgZ3BM2uc
         qRv3esUxYcwYa0clTq/aQ6wEsXKk2CPWr268ctqkqC/tJ94WkEkkAMsvoUncjnnulDbx
         /m3g==
X-Forwarded-Encrypted: i=1; AJvYcCUlarKSqmaAQnTMW+acrxrxmRQQJZ5t2DPXQIeFj8GZgFFrFSKFAIXqrPDSM7OhwndtVqPpokEilChvI0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj5W/BN17ByJwuy+xn/pjRmYl2PMMIr8htCl9PviEcrf4BIpqh
	XlSBK5lprukh+KQegtVQDXHUN+togFDQVO/NpJbd+RPBrR+l9pwZIJxDIWE6s1j0+auMVuaAA6b
	r+Zk=
X-Gm-Gg: ASbGnctgXbejA0zyHRcm2JVhgK263Ozjb5g+Xk8kN3QKcpfTBVRy8fxLYA+O7NEKrU2
	34PrEnmOjHYMnAPp8P5KONYp4CPTRKmjB536j9FqirfX+5X39SgjEPewBgYMthqJmsBfAv8fpXh
	ToJLBXxjk4hyBsbXzuEhMcggJXHcKIi3zfYLQiV/2zG2JHwNa3bCNpnqEaaiHBjmDjbz/KZJA+U
	Ypdvk4Z1Hs/MgEeaJy6biVpHkcky2hxbdduTG6TdtwIkqETjgEaM3s6XqsIKstJTzn351MtYr0I
	ujxUs3wd6kOQvWXnZj3nnAK6O0JHdWqhjehTjrAt5chyX0+L2fv4sUWV03LJ4typGTMsSGhevvS
	BsRIiMtWJ2QqYl9W7/GY=
X-Google-Smtp-Source: AGHT+IFaQco0Kg491dDh9eTCne7yPVqk0F6m2m+WYGlEaAIeBlf5U7cJ/yENt1S/LFNnXHC39XVYRA==
X-Received: by 2002:a05:6402:270c:b0:5e5:437c:1daf with SMTP id 4fb4d7f45d1cf-5ed8e49a55emr1661850a12.16.1743036581042;
        Wed, 26 Mar 2025 17:49:41 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccf67beesm10029776a12.14.2025.03.26.17.49.40
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 17:49:40 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so523148a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 17:49:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMdcxjJg+USsWmPs+Ueh2dEBWpoCzl2h8nnCGltr8TCSsZYuFBxoSg2HUehv9dLXFkVICPkhM7dEWFFms=@vger.kernel.org
X-Received: by 2002:a17:907:2d9f:b0:ac6:d9fa:46c8 with SMTP id
 a640c23a62f3a-ac6fb100915mr152491666b.39.1743036579668; Wed, 26 Mar 2025
 17:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-rwaat-fix-v1-1-600f411eaf23@google.com>
 <4b412238-b20a-4346-bf67-f31df0a9f259@app.fastmail.com> <CAHk-=wikuhxhdSEgqb-Lkb2ibQM_hAHR1Cu7yxg-gHZu1NF+ug@mail.gmail.com>
 <20250326225444.GA1743548@ax162>
In-Reply-To: <20250326225444.GA1743548@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Mar 2025 17:49:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgJRECUF-7yt9pNxW_bc=4nJcxn5H3duW_HefY3pKwZag@mail.gmail.com>
X-Gm-Features: AQ5f1Jq0NfJ4NCA_LPq0S7Om_u6cJNLASqmiOGbxN64ioDsS5u1gJskOkebSHUs
Message-ID: <CAHk-=wgJRECUF-7yt9pNxW_bc=4nJcxn5H3duW_HefY3pKwZag@mail.gmail.com>
Subject: Re: [PATCH] rwonce: fix crash by removing READ_ONCE() for unaligned read
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Marco Elver <elver@google.com>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Mar 2025 at 15:54, Nathan Chancellor <nathan@kernel.org> wrote:
>
> > Put another way: I wonder what other cases may lurk around this all...
>
> That change has caused only one issue that I know of, which was fixed by
> commit d3f450533bbc ("efi: tpm: Avoid READ_ONCE() for accessing the
> event log"). I have not seen any since then until this point and I do
> daily boots of -next with LTO enabled on both of my arm64 test machines.

Ahh, ok. That makes me happier.

I guess unaligned READ_ONCE() code really shouldn't exist in generic
code anyway, since some architectures will fail any unaligned access.

But those architectures tend to not get a lot of testing (they are a
dying breed - good riddance), so "shouldn't exist" doesn't necessarily
equate to really not existing.

          Linus
