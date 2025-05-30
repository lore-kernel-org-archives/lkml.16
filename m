Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7814685
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 04:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748579675; cv=none; b=k7nAAFGlgOwx0SW25bhLnEridj89Kiqk2Hi9qHrqSDB5pkltg4tFUNan3ZYAKQy6bK/ez/oK7Hkf7W2rN9vw9VLaQ0kzP3fjxE2N+e0E9EFuZVn7n/2hlip3kMyQCMBRI0TjLeTkYZQb8NN5ocvZ508Hd9G+HlKDRsEIJIqVzbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748579675; c=relaxed/simple;
	bh=aqopuYNBjpgWPxSWqUApYvJwsx9E9sG/TE6NbX4LzOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uMlIQ9zXWpGNOW9bfhHmyAtDaOFQ/bIpJODAMNcP3EHjx0jzWxUDvguwiYK9bHFZHL5dJVlK5WccW4ChdGls2qs+oSHCnVyvL45VcvCgn49j4hxnNmu0NDaB5BAeihLsomSmtTWKywXIx/F21lzIeHnQkx6s5vP69euqETM/m2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=M/dE2l2q; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="M/dE2l2q"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-604630fcd3aso2131337a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748579671; x=1749184471; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=71NdO+qSnTa2IaPLVhqylvr3d6ODHmzimSLWfoeJiGU=;
        b=M/dE2l2qF/iXbmUccI9i/KsJl4EJgdKb4MBW7s6Loon5wBpp2Tq+VhILUHWvFRad9T
         mAsvmqs87sDitG3JiXvNbPPdUPfYYjnAveHD4azaL31pg6OnrmUH4y8N45rNZ8u6skzE
         NFtWbY9QhxiqkDP8x8KYnINFto88T8Qqr82AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748579671; x=1749184471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=71NdO+qSnTa2IaPLVhqylvr3d6ODHmzimSLWfoeJiGU=;
        b=jUPOwpirFZa/VQegfjw/IOPMJhCZgb1r0sMNLSjiDqMXWNU0g+dyH6k4YWpdtfhvuT
         jD6odtPNNzJZXi3QUwIIrl3wRDD738XnCIqyT/7pZ/KZC+uyZu7bgcTbSPyDbHsu3D0D
         kR47NXcp2BD5vMxagBlJKVtiHfGfwIPHcTiI/D9TzXJbEXEc7Drz/ODjhibWVkLUArjj
         ixzxnK86afXdACupts9Z+DM7JAkMuYOaImkspMYxZQ4OhQCQlXwXUTWJQR7TcZJhtU3X
         H3WPRLuu48tulonvho0cIg8797YRZVjs8hPDHtszV1GG5KooQNnJAwyMt+8Hhsnz01P2
         Bf4A==
X-Forwarded-Encrypted: i=1; AJvYcCUdqjqoMB8Zr6y1mNrf7jAJF71g7KWZeBFBfIEgIvRUUbe1e38oMMXMU71VwswNpuny35GLi51pdjq5N/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCk/9wCp/P673wNvWeqTNn0MO/nvWsp4Edq25yhDQt/JrfXy1f
	jEjpqKQEwwrnCGjQoU4qzagxPdkFXrRDVvVjhRi5EfMd/O5EX1ebxMLNoTgxMYqijei++nvutST
	ux3ptbmQ=
X-Gm-Gg: ASbGncuGrogXyxuXnCAYYhhnRQ4rY45pdlqfWDKwJRis7zAUdwh80Qx+OLn7Rl8/en1
	t7ycozC0HS/25T7Ufv9N3rNPi10ID5x7k40Z7AOJYGYi2mc3XumBFXJIIXVj0dpmcB0NCJ6+JNQ
	Zv1amcJSnbAVFFxfUMEI33bMmBjUGw7Cjmln0VQr7GIC/DcIkq5b/xpdvFFE0knlXuAX3HEyS9Q
	sKutsEpntY1KGWqyi+QiC7NS5UL7Lf+Ue11oRB3K1Emu9CTzDUgNq4haX19Arprd8Eson4cbhts
	57hNAPsQlVDFiZeOEzCa2whvRvg+VNBG7vA1MVq3261UWE628Mj+8bLXZpVgANfBbSExGJBRF+1
	3pV+d/TluJ3WAv1h5kmjiJ9Tnm+3fFUDGhUvDTlvxQtEbcUg=
X-Google-Smtp-Source: AGHT+IG+Goihfm9Z5ajM26Sz+jc4zdjNXgVYsw6Ds6LsJKbVfcsrWDR6HdQii7mMImzcoKsCHHK+7g==
X-Received: by 2002:a17:907:9810:b0:ad8:9b5d:2c1b with SMTP id a640c23a62f3a-adb36b22f82mr62591566b.9.1748579671296;
        Thu, 29 May 2025 21:34:31 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf011sm255007566b.105.2025.05.29.21.34.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 21:34:30 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-604630fcd3aso2131316a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 21:34:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmfi/yjW8GDRFv/TMPIMg1p8GPJgUuhJjwIu9I2zy1zd7ShmHwSg71Ptn96y+dMGxERzJC3id3C38XklQ=@vger.kernel.org
X-Received: by 2002:a05:6402:3514:b0:5ec:cbf8:ab28 with SMTP id
 4fb4d7f45d1cf-6057c6036d4mr668190a12.22.1748579669595; Thu, 29 May 2025
 21:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <683902e2e98df_218f10017@dwillia2-mobl4.notmuch>
In-Reply-To: <683902e2e98df_218f10017@dwillia2-mobl4.notmuch>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 21:34:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=whjvmBiZ=oMnR-R9rqzEPnGCaU7dNLkY1RHXwjRCAR5YQ@mail.gmail.com>
X-Gm-Features: AX0GCFvmQzSC6lQGZ6inWJ67zrkZledBxNhSJvbiAXwywaQLWfY_gWoWq65MOjM
Message-ID: <CAHk-=whjvmBiZ=oMnR-R9rqzEPnGCaU7dNLkY1RHXwjRCAR5YQ@mail.gmail.com>
Subject: Re: [GIT PULL] Trusted Security Manager (TSM) updates for 6.16
To: dan.j.williams@intel.com
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 May 2025 at 17:59, <dan.j.williams@intel.com> wrote:
>
> ...to receive shared infrastructure updates for confidential computing.

Do we have a sane name for this? The pull request calls it "TSM" and
writes it out as "trusted security manager", your intro calls it
"shared infrastructure updates for confidential computing", and the
MAINTAINER entry calls it "trusted security module" (note the
different word for the 'M').

Making things even worse, Intel also uses "TSM", but in Intel docs,
the "T" stands not for "Trusted", but for "TEE", which in turn is a
recursive TLA meaning "Trusted Execution Environment".

Yes, I've complained about odd TLA's before, but TSM really takes the
odd to a new level.

I've pulled this, and I've used "TSM" in the pull message, but I
really think this TLA disease needs to end.

Let's have a rule that TLA's are ok _only_ for things that

 (a) go back at least four decades

 (b) have a basically unambiguous meaning in the industry (let's
ignore IBM that made up their own naming)

 (c) when you google them, they give relevant results

So, for example, talking about a "TLB" entry is ok by all three rules,
and a TTY is similarly not a bad word.

"TSM" fulfills _none_ of these.

Please? I know you work for Intel and you probably signed some
paperwork saying that a certain percentage of words you use have to be
TLA's, but please ... We can do better.

              Linus
