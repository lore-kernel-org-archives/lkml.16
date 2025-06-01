Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F432DCBEE
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 17:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748797945; cv=none; b=laW48WEfYY/2UTmPGH56z9l4zv7ykgbmW43uhD75J1BMLCGPJo/BdYri60rgLl/29iavoeI70tDV4w2Am8XLDGKF/IMHEJMNNO/e9gPxrm1US5C4I0VC3ppcUMu3qqAZzkyHiS6JipZWVCjgsd+SIdmGONZiJXQR4lrUYzz9nzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748797945; c=relaxed/simple;
	bh=tAilVeGk2w89JgR26a9y1cP7wefFwRRAXQEI6T4aJMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=spOyMfTUx6otdWsHLWfChRpzOIzaJA3unj0FTmaXscMs0bzaIOi9EqmtFYpcxO/t+yKcsbNh4t/LsqyqxALiyLoO5l1y1XI/cpRWKkzm9jKV+gii9vKRZvDQ9s6xo0eQoVwQdQiF3mNdlxIwoTk9GbrI8Qy3dc48ezTHsD4PbBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WBDJiJZn; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WBDJiJZn"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad56829fabdso572976066b.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 10:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748797941; x=1749402741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VWNW/nJwmigqN3YxJwTSr5gJ+54UdDYlLOva47KtnwU=;
        b=WBDJiJZnRaOOGEqHlfl9iqL41W4A3LqH/t/ZuCNZN5+GZkn5B0awRAkWuXmyobBsM1
         Y0kSschDhvbGevoe4ityQORTAkqJsI3qhy66Vo4dhymhDK99JJ9exvY/yNMhhii65bty
         rf8i9pGgi+v1bj9xtx3opYc7lJz8mXDdV4jE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748797941; x=1749402741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWNW/nJwmigqN3YxJwTSr5gJ+54UdDYlLOva47KtnwU=;
        b=nuZiURWQUZzrJBG1qP7Z6UM9Dtp8ZbXAB85TY9iSQLnq1wSBQ1jQztpUQfZSg8PhbU
         C0mrzFU5b9DwNjkSX7Cch1vVofpetZ7kTFCX1nZh5MGD5Um4epKBjoNY/f6O8NkFKbS8
         iScTqumM32UllTA3qIBKqIog0Gd+943limzUR7NGIq5/2W6eAZ+zVyALUEaNKs1UWEBd
         GzU6syjjXndm3JqUuyJwPxMePoAueFW5onoCOrVrhqSJeIqbVhyxHrFSiJbOeQtW74fs
         83msA0o7YdjFYWBMam6iw9wpoXvY4vf4mH5vkImun4abyKZZlYP3o6nKjHrcyH1nnlCS
         JNkw==
X-Forwarded-Encrypted: i=1; AJvYcCXirS1bi91+u25bkZsl0TY5W/fnU1tNj4YGMHRQ9jKTsrcBzBWQpmf3FKMFlfYBFumwGllgFg369kXh+cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQfLSbLCM4sfr0gZjyXtwoGUYelMSVErIR/JDHCf2pvM/JgGSQ
	kjHw5HFG7Vb3L50ViEV7ivxNcCHwF1gEfU/m1gTyG0mx3pOSeDbSTzCXf7lGNvB/OlP8u+Dt/10
	7CX5u8DU=
X-Gm-Gg: ASbGncv84ZIyFQQd3I/z8qk6v1jD2N82Amy7UalD4AgoGqQrVoIEMQ+PUZPaW30qk4z
	8L1amHvrKlT/EtFl0Baup9kBzqBKQhxzTvT/PT8Y3V4ynnwu2K7NkKCtSG6rRyo7hgGxs5xr5RR
	TVcgfcjbZLjVRYtgu9jKpUmKVtpzK0JeGP6ClbyrQfYW7Ot7qKf5haug7lcI9j8hzSnF/cE7Ee5
	GTJaaBZvGMI1r/r5ZoaLQvm0qK2DGxD+zMDKOorP1p/N9HYqNKHKMhBiz7i8sTzd63VTXKzdf6g
	bdqtFBwShXqZZm1q5hFPM5MslRltiBsJlzQcIAFNZ/GSHsD5SRKw3gcxn+TA9jCT1L9EiMiy0dl
	4uiV/4YLrjK2ECgpFT1B+8XRx7FbKcz8b5Axm
X-Google-Smtp-Source: AGHT+IGVpH1qSN6RkoUhkfssXBo2FxYLUBq0k4Td8spvRtMrkeulib8ZHFM1VMTHtecaOwxr+sZuJg==
X-Received: by 2002:a17:906:c104:b0:adb:4523:90c6 with SMTP id a640c23a62f3a-adb495e8b32mr549887266b.54.1748797941007;
        Sun, 01 Jun 2025 10:12:21 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb318db274sm511038566b.162.2025.06.01.10.12.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 10:12:19 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-604533a2f62so7067303a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 10:12:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhhZWzOBHbcNd6BRUAPi3yb3cBIEQOwwIMVvgtdISaK2xT0tcBwg6jq+UHRwonbsW0iLXffK9WfYsMhQc=@vger.kernel.org
X-Received: by 2002:a05:6402:42ca:b0:602:3646:1f07 with SMTP id
 4fb4d7f45d1cf-605b77490a0mr6382211a12.17.1748797938865; Sun, 01 Jun 2025
 10:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202505310759.3A40AD051@keescook> <CAHk-=wj4a_CvL6-=8gobwScstu-gJpX4XbX__hvcE=e9zaQ_9A@mail.gmail.com>
 <156567EE-E5BB-43C4-B5A6-439D83FF387D@kernel.org> <CAHk-=wjktqa94u_=++YX7XxUr57iLAs1GqtHPOY-o-N0z7wyeA@mail.gmail.com>
 <202505312300.95D7D917@keescook> <20250601-pony-of-imaginary-chaos-eaa59e@lemur>
In-Reply-To: <20250601-pony-of-imaginary-chaos-eaa59e@lemur>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 1 Jun 2025 10:12:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgcQdD0UzMJrNhQuYAC2wgGtfrCry_iokswaEE5j7W9YA@mail.gmail.com>
X-Gm-Features: AX0GCFscscV4cMTmuty6CE01QEr0IdfvLYHHcHiKeDnaFri70XQ74sZ2hZGj_Y8
Message-ID: <CAHk-=wgcQdD0UzMJrNhQuYAC2wgGtfrCry_iokswaEE5j7W9YA@mail.gmail.com>
Subject: Re: [GIT PULL] hardening fixes for v6.16-rc1
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Ingo Saitz <ingo@hannover.ccc.de>, 
	kernel test robot <oliver.sang@intel.com>, Marco Elver <elver@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Jun 2025 at 07:40, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Sun, Jun 01, 2025 at 12:42:14AM -0700, Kees Cook wrote:
> > Okay, reproducing the "b4 trailers" steps:
> > ...
> > ### Try to update 8c2bb7d12601 with the Acked-by from the list...
> > $ b4 trailers -u https://lore.kernel.org/all/CANpmjNPpyJn++DVZmO89ms_HkJ0OvQzkps0GjCFbWkk0F+_8Xg@mail.gmail.com
> > Finding code-review trailers for 39 commits...
>
> Yeah, this is danger territory, because you're asking to update a random
> commit in the tree history.

So the *real* danger territory is lying about committer information.
That's the thing that *no* standard too should ever do, and what made
me so upset.

Konstantin, can you please fix b4 to never *ever* rewrite a commit
that has different committer information than the current user?

I don't think this is about "39 commits down". This is apparently b4
just doing plain bad things, adn it would be bad even if it was only
rewriting the top-most commit.

Setting authorship to somebody else is normal and expected: "author"
is about giving credit.

But setting *committer* information to somebody else is not about
giving credit, it's about lying. Tools that do that are broken tools.

I'm also not clear on why apparently the script tries to retain
committer dates. That's also just plain lying.

> I will reinstate Kees's account so he can resume his work.

Yeah, I see the updated pull request,

         Linus
