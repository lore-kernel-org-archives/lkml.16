Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8281B25E468
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 17:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745689953; cv=none; b=Ik/k1g4+VUqfgNJ8wr81rGUddHUQdNSsgPzazxmoMhjId30O3N59AfFznfb9QY9U9mCBhMFoMQR1ZpSskLjyYQ6cpTpbzG5AXhvfx9Umc2auypnLbmoaD6OkIf524LtB6sW87EiBbz/l/0JVpFA0johnk0WXCHSG4lMIb/o1i2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745689953; c=relaxed/simple;
	bh=8NpbDCVJwSLjPM5X/trYZT/DfeW17C4qSTAoDvkXPPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iixNcyuxhL8qpv8PJmPKg5MEOfXwrz6Bk05PUlul4tAomDdq/SgwS4NNR1NG9hFBJd1e2kqkPv4vK5C+PcNWL4RHh6jWjjiFkYKJjvgLfAUHIfvgbKVd7GrSwWquxD4HunNJEkqnLGi+lX8j2IdeSVgz+PFbKzQvO90tGT2PD+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FD5sZkDp; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FD5sZkDp"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso5064278a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745689948; x=1746294748; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ilc4ZqBanqCc92fVWGxIS3nPZUWorDx2QpnCQQ4E2Tc=;
        b=FD5sZkDpUPvfm0eGypnxC+HONvHs5VkSBb29rD01p/bNaG2aOtvoDutTZpdLTOMmRG
         SlzhZgUu+gfvZmLZKXGbJyVmbNs6O/IGa4epIIctwXHpMGkAj8J++A2mNAqcgA+QAI58
         26kSJOsjBlLYhkGXfhl3LgqAWwWFb5ft2yKUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745689948; x=1746294748;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ilc4ZqBanqCc92fVWGxIS3nPZUWorDx2QpnCQQ4E2Tc=;
        b=bzntAK8v2Kc4+4e3CHag2Q6rTmiq+5+KD0FxBVEZ+mhEmL3gKM6A7TPptEjkcB2t8W
         MVUF3ddImxp4NOB3hcMhz3qz087N00mhbuXCjc+IV5JCHU5YJSaS2cBjv5GaNTmn02n+
         z3Sfv4aAnC8C66nYkff16JQWzkvIUrifgb4vEdBrBsHjk6J+in//jmXHeu1rhsF+RFDo
         MuMQTE1ndKBngQ0JU7weGrc9lObQK030owKj1Ods4I3rrjXp+DaC3KV6Q2wKqNfvAOrQ
         pGAaTyPcesl5+3d7UQoeYSobfmmbqVUkf0QEF1nW12WlTEHP6Ge2iB9mHQ8AqWnFU898
         bBZA==
X-Forwarded-Encrypted: i=1; AJvYcCVNR+roWZ5RCLc+KjYYEgnpijpxCNKX3/QSvjXKQpgQOhon/pfiVbIV4jJpg4dGE0V/muTS6tMDenid49g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLHppd6Pa68qpwcevZEe0H6yfKyTO3k24V/hu6LW6tCWDwf4zE
	RjqbqwGn9qB71Te4xCDFKubbclaWEAqxB6bZI9KBhZ5EfKz0QeNcUrWyUIr6qcWBBFiqh0C/LY5
	Wr4Y=
X-Gm-Gg: ASbGncspk3kFEQMa6Z/PfF3K0nMYh0Oe0wgM+k5XvtriqRBU4vV6tmYMDUeuH9osc5I
	XHfCujrys/edFaZizfW4o4b3EoTJoBZiUWpxYtr2QAb4eqts+iK0p7igzbTe40IepA99mMdz8lG
	ozMbI4VXIwDIcjBGSf6V0ZYMy2ehF5vPOuIJMKakuEE2tcBo7zijWChDk9pMMvQ7oqD8m7AX+kZ
	OB3xE6d/qm+z3dt9Mxgt3vEd2+a7aTI05x/m80P2VTZf/RTPSVtcdtcP/uJAj2A+07G0KSywOjG
	bwlwecnpLKeG8JebxPhxmOY5N8eWCl8Zn63V/KlQ3N8NFegu9C4flhMpbeAmmhj68GgAyPqBPKT
	S9n7kORLb0ku/hTw=
X-Google-Smtp-Source: AGHT+IEeH7i9qOKG1Mh2ukvaiLVpYO2qXtSf1Ml68otNPAtCNCTijFfDPfzvHxxtSomrJziiJJ4CLQ==
X-Received: by 2002:a17:907:9485:b0:aca:c507:a4e8 with SMTP id a640c23a62f3a-ace71095212mr546122166b.21.1745689948439;
        Sat, 26 Apr 2025 10:52:28 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1a48sm324341466b.179.2025.04.26.10.52.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 10:52:27 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso5064248a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 10:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUVFtXQG3Wl0NSbH9ffDKGJroU3nf2HS4YxUJrBV1gTpkBGk8tDHLSDngrSnnrWRoHP7VwmZrF3Lbp3olc=@vger.kernel.org
X-Received: by 2002:a17:906:7311:b0:ac3:8516:9cf2 with SMTP id
 a640c23a62f3a-ace713deee2mr658764966b.55.1745689946923; Sat, 26 Apr 2025
 10:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
In-Reply-To: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 10:52:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
X-Gm-Features: ATxdqUFJhpP1cnPfVY8nm1K1gppvnR2N5pQ5E7BQd9ZjkOk2BZpV-x-DK59L6io
Message-ID: <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Josh Poimboeuf <jpoimboe@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: "the arch/x86 maintainers" <x86@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 10:42, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> We had something similar some time ago, where there was a drm
> assertion without error handling, which caused the compiler to see
> that there was a static path where the invalid value was used, and
> then caused other problems. I forget the details, and gmail search
> isn't helping me

My dim memories came back and helped me with the right search terms,
and this is what I was talking about:

   https://lore.kernel.org/all/CAHk-=wg4ETks+pGUco4gDrRxT+1UBbFGQtpOqSxLSzvVAWpm5w@mail.gmail.com/

different compiler, very different results, but same kind of issue:
warning about an error case without actually *dealing* with the error,
which results in the compiler seeing a static code path from the
warning to an invalid situation, and causing odd problems.

Please people: "ASSERT()" like behavior is simply not acceptable in
the kernel. WARN_ON() and friends need to either be otherwise benign
(ie "warn but then continue to do valid things") or they need to be
*handled* (ie "warn and then refuse to do things that aren't valid").

Just warning and then doing random crap is not sane. If you aren't
capable of dealing with the situation, don't do the bogus test. Just
warning about it isn't fixing the code, and can make things actively
worse as in these two examples.

But I do think that clang needs to stop doing that "make things
actively worse" part. Maybe even have an actual honest-to-goodness
"this is a static undefined situation, I will stop generating code AND
THAT MEANS I FAIL THE BUILD".

Not this silent "now I generate random code by falling through to
something else entirely" that clang does now. Not good.

              Linus
