Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373A723B608
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750184979; cv=none; b=n7Pv/EK2uLob9mA9/+kBSB+oSJni53px5OZ1AkaMT63pPWmQ+8nucCzPpM1NxmPEXOEQBy9mFYC2nWRzWUPip/RVXgXnCrbcM4BoA7bYHTQdRnM2FlgmYqYsOqAn38dxZePS5zegNHQy+CSdVW6hRHNJ8Qnh393vTpDr6uLYros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750184979; c=relaxed/simple;
	bh=4D7DO/f/TIDpTtJg/TTFmgQrH4mAxp5ug7V7AlGUGEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uV/6wO71oZVgbhjPE9HFVaGFV+maGoO/Di1SvMo63NXoo2XER8ElMrjzKD9/UxMiUaWDw0nHA/uzwkbJGN0iim9tKqzeRfNwqM81Spy4rPO9pFuWL+XtcGLVt50QBh3bKJ4q5UH6x9BM1EZjJ27PTqJJpO6Oz1/jpHxCXVbKWWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DF6vMl4L; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DF6vMl4L"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so8793949a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750184974; x=1750789774; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BpmH32X+ubnFGRkDpBaCqaiio/3lQgXW15x6m1ucLKk=;
        b=DF6vMl4LVAW47Rd1zVw7ZnlK1juSJJo8sd7wxKLvnY6ihmT6zB1NELnQbJvM2EXpwu
         ehjqh2iWSOcYZFBYPuq8qcgdy7vRc4nXpBcq1q3ot60KjhQy7YUXUksbSWw1Yu+DjS/Q
         EdtcMT4VZ+xxmp/7U7KScOcgKWKGCALbt966E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750184974; x=1750789774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BpmH32X+ubnFGRkDpBaCqaiio/3lQgXW15x6m1ucLKk=;
        b=sQJtm1wDEedsHhXcCkTSlaMxcb5hPv7E0rlZwnBdLxXuMJ0NZ1lA1xAyvD5f2NAHyX
         7SiQDhCnCrv4H/M4Bld76kHRP40/xeQfK3Uj9Y/3+GAgRizIKmzIC7SSoL9lbi9ACTuN
         3TYjjJFeWbnq76vaYmGSpbViG5yltIaLHafhqdOOeAm0NSjg51Ge60tU7urwc1x//jPU
         Akjzd6uEDW7cRusxh8uzOENulZKMJxw59zx7QhNdZ44JBaVZXte4ZBRE0d4Dc2CtOtlO
         SPMYHp+aJVMvWYK0Pub/X41xc8q1JP49s3SSGTogWXdjbv41QAPKCMNKP/SxuGGqQ45V
         ZCqg==
X-Forwarded-Encrypted: i=1; AJvYcCWRCr1hZezfHj//T184qbtg4wUfCxND0lpVKXwL3dsComXTUE0NFlL2FOE7Te9yxHQ7AVj8Xv3wdKMz2b4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxopiKWS+R1uXHn2NWxosSMDu0SRqwPhZZdZbcN9gftCf12QX4X
	gpnhJ01Hd3fMc4TNbgKGiO/h/1e8YlBAb0YcvutBMfWJQi4f1/MKmZd+Kr+tUSpLjxVnDYbFulW
	wPwDulAo=
X-Gm-Gg: ASbGncvqvaR4jBxfGt0zizrpfBTJWkR1EqqhNulEuMinPKXO7aThtUdFUZSLopj2Esn
	siaVz9QvNffxyuazfb4iWLHVapmZ6SgliCF1BurWf7vSgnUKEDwfp3e5qMGPKlwR6menkaEjNnm
	iPdC0gAePq09V12znsgqZMh//R4eoVndQ/qTTz+kqbONhiRxBio6Xvpopoqth/e7fZFVUZa0UlY
	FpZpXT/yGLl7r0i31qYnmqMH4eQhdci+2fsxuxdrzuaYcyzVnIqc8RUi0wx9cOcG8arWIPSFqXE
	LqZjQdBc+y8DkKIU1wIt0ormM73h4qDRvpMhWsMh3SY8gPMFpuks7D9pnu/5Vgy0kIGKUInpqCw
	VcmqZn/EnDomTKCI5r5MxiCHSnX2ziS9rEx3M
X-Google-Smtp-Source: AGHT+IHqpY/yJ9ZXVSZs6lene9Hxpr6sMzx3QnfBYR/rZEIc+oXYNOJt8rsLlmgZ6Fj37M7MdsWpRw==
X-Received: by 2002:a17:907:7e8b:b0:add:ed3a:e792 with SMTP id a640c23a62f3a-adfad469d47mr1179819766b.47.1750184974111;
        Tue, 17 Jun 2025 11:29:34 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adfb80d6dc4sm666801466b.22.2025.06.17.11.29.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 11:29:32 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so11675864a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:29:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGuj9Oz2BZXk1zgIXFJG0+T7CP279/1MbfIX37HCyblO1Y81QwjNYJndiQoESxyo9oVViWDAKOWF/HgTA=@vger.kernel.org
X-Received: by 2002:a05:6402:40ce:b0:5ff:f72e:f494 with SMTP id
 4fb4d7f45d1cf-608d099f37bmr12876236a12.31.1750184971733; Tue, 17 Jun 2025
 11:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
In-Reply-To: <20250617060523.GH8289@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 11:29:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
X-Gm-Features: AX0GCFsDpDEWkWJGZUHtM58JGRAX5cSPaq4yB3fqNYhO8hMv3GVq-qz3C44LzlI
Message-ID: <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Jun 2025 at 23:05, Eric Biggers <ebiggers@kernel.org> wrote:
>
> An additional note on testing: [..]

Talking about testing - when adding test scripts, can you do it as a
separate thing entirely - either before or after?

As it is, this code movement is hard to judge just because the stats
are all messed up with new tests:

 77 files changed, 4012 insertions(+), 1756 deletions(-)

that's 2k+ new lines of code that pretty much entirely hides the
question of "did this code movement result in a simpler / same / more
complex end result".

So in general, I'd really prefer big re-organizations to be *separate*
from new code changes.

It's just a pain to review renaming when it's mixed up with other
changes - whether renaming variables or whole files.

And that's as true on an individual commit level (we try to avoid
renaming things *and* making other changes in one go) as it is on a
pull request level.

If I see a pull request that only adds new tests, it's a no-brainer.

If I see a pull request that only re-organizes the code and the
diffstat just just renames with some small updates for new locations,
it's a no-brainer.

If I see a pull request that does both, it's a pain in the arse,
because then I need to start to look into individual commits and go
"which does what".

            Linus
