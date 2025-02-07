Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71951C1F12
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 10:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738922490; cv=none; b=QQvZD0nEMxaXSH6DThGsHT5IJzRCmrp6dqNClqTCos5ttw1vMd8iXboOyvgtMPTdf1HKIElSzpF7sO/xHmHkIEDhIpJxvkH/1W/mR9AxNRsmy/QtEeW9A4sh8K2V3Axm2//OACFCnQR8lPSP0omg1efDzZxlxjDcfKwYuBMVbBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738922490; c=relaxed/simple;
	bh=k4Iax+rVsxQ2OZILw0McvF0gD8dT6wLCmKggAsyIyjE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dURCHR66cxFb0rinbbVgnpJeQrJodoK+uFmxr/oW/9SMXIKsrx3+EMmadawXTIGiB51YwNRpKbWe02MiSnzCM6ae5DIdeSZvW5xv+1xWrVHG5aQgDzTrzltscnM+/29AiQPgfBExrN42fpDVSxolWS74DSA/H5QztiDv92SFVHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=P+HaF7qw; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="P+HaF7qw"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-544fee2f3d6so102726e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 02:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1738922487; x=1739527287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bXaE9uM1wAIJE3wNAl6avT4onwqnNJr2t6nZiCghwI=;
        b=P+HaF7qwGYWoKYLSZkZVnvvItwX/Dw2AX7A3G/DqcN/kGHwlrkCvFhdJLwHhwMm72z
         uJ/C+L36E4Yw8B0yXOJZAMPq8Vmz2Pq+8KpiC/h64EdGo5GxQL3aQTf3TfsZQxdcstD+
         ii54IRW6BlltPaKmwqhtO/s7DVuY+khxV6jUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738922487; x=1739527287;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5bXaE9uM1wAIJE3wNAl6avT4onwqnNJr2t6nZiCghwI=;
        b=OVkAORKl3I05iLFifV4Mm7oZc4Vk1yEOUr218BLRGGOSZy7rRwbzyLrUZLBGZi8gQU
         b0KJC8c+vs3fZsuf1KqXCNteXU2I5rtxjc+gMPC6636qaXG6V+MTSgmqAaoe19J2oKPJ
         EC3CdrSK896xia0J/OckZ4iXbJROcJsrJalT1bZlLHCUQdUS/5V2emh6aT/ShsMX4SFG
         Z5/NiO4JtZ/C+6zb1rwiy5/V7TW9bdFPWCvHhFtrdKXIr5ffD5oZBxG5utgzUbMESOWO
         EMTechq4Nf39x3z+QR5lrT1AIkTPNyRSvnHMGhReCNcqrz+6ShIP1hDTHrUymAzI0m9B
         w/2g==
X-Forwarded-Encrypted: i=1; AJvYcCXYg9GSs5/Y+j8FN5abY2MuXZKTTKn3IyEqhvW9lzU/fNlQ9waWeSVq/+ZRVjcZ7XtSBqWS5ZcMJDKJMJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9KuHiwC4j/Z3zyiO2Sd9YRUDBr2cBPIa/nLJ0cy3nLT9tkAL4
	z8xKs+90rMHa3oPtqOnruyJ5bMzxBvK5Xm5NjZYmwIv9AA5bdQth3adilZlT5URZPQohbNrNyut
	Hxak=
X-Gm-Gg: ASbGncv44ffHFozbnVmoiGGien9/dkn1+gg0I7WVBUHnnFBJYmqlMLsnx+3xbPNYgcX
	facD4tVkVOJZE7nCV/oQOwr9RFfo5/E7GVHFUb7VfvPEtP2p8t5oGDrkbPiu6KgvTKWmQHusJZ3
	FMUa9wfUe/762Ii98Gy/d/CUvFXu2Spva2cL3/c7Hclw2/k2AOXIoaNCTLk11gHcFIlyPkRVKrf
	8ntCN0EXh4qD43L+1znJNWbtOLwyomftBA3s3qDF8tIb02oiyo9q9XpDXi+EmL+hmkBPNktktpF
	xWaghyjFxu5QgmIn
X-Google-Smtp-Source: AGHT+IFVC+fHVOR3o3VNmty7EZKqILMlaL5Bz5efSjdDmNBg7RVjDgnayqGUPxgvIQNjMG3MjFdD7g==
X-Received: by 2002:ac2:5f6d:0:b0:53e:395c:688b with SMTP id 2adb3069b0e04-54414ae629dmr580950e87.47.1738922486685;
        Fri, 07 Feb 2025 02:01:26 -0800 (PST)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-5441053ec2asm396233e87.49.2025.02.07.02.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 02:01:26 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Tamir Duberstein <tamird@gmail.com>
Cc: David Gow <davidgow@google.com>,  Petr Mladek <pmladek@suse.com>,
  Steven Rostedt <rostedt@goodmis.org>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Sergey Senozhatsky
 <senozhatsky@chromium.org>,  Andrew Morton <akpm@linux-foundation.org>,
  Shuah Khan <shuah@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/2] printf: convert self-test to KUnit
In-Reply-To: <CAJ-ks9kLmArqqPati8n0dwzhjccLmTuTHtkaSyf_F_1QXzCoRw@mail.gmail.com>
	(Tamir Duberstein's message of "Thu, 6 Feb 2025 10:42:03 -0500")
References: <20250204-printf-kunit-convert-v1-0-ecf1b846a4de@gmail.com>
	<CAKwiHFi6SUCT7UjUTdKmLJ8kiAEqVg=d6ND60R05MJB85Eoj9w@mail.gmail.com>
	<CAJ-ks9kLmArqqPati8n0dwzhjccLmTuTHtkaSyf_F_1QXzCoRw@mail.gmail.com>
Date: Fri, 07 Feb 2025 11:01:25 +0100
Message-ID: <87bjvers3u.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 06 2025, Tamir Duberstein <tamird@gmail.com> wrote:

> On Thu, Feb 6, 2025 at 4:27=E2=80=AFAM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>>
>> On Tue, 4 Feb 2025 at 20:36, Tamir Duberstein <tamird@gmail.com> wrote:
>> >
>> > This is one of just 3 remaining "Test Module" kselftests (the others
>> > being bitmap and scanf), the rest having been converted to KUnit.
>> >
>> > I tested this using:
>> >
>> > $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=3D=
1 printf
>> >
>> > I have also sent out a series converting scanf[0].
>> >
>> > Link: https://lore.kernel.org/all/20250204-scanf-kunit-convert-v3-0-38=
6d7c3ee714@gmail.com/T/#u [0]
>> >
>>
>> Sorry, but NAK, not in this form.
>>
>> Please read the previous threads to understand what is wrong with this
>> mechanical approach. Not only is it wrong, it also actively makes the
>> test suite much less useful.
>>
>> https://lore.kernel.org/lkml/f408efbd-10f7-f1dd-9baa-0f1233cafffc@rasmus=
villemoes.dk/
>> https://lore.kernel.org/lkml/876cc862-56f1-7330-f988-0248bec2fbad@rasmus=
villemoes.dk/
>> https://lore.kernel.org/lkml/0ab618c7-8c5c-00ae-8e08-0c1b99f3bf5c@rasmus=
villemoes.dk/
>>
>> I think the previous attempt was close to something acceptable (around
>> https://lore.kernel.org/lkml/57976ff4-7845-d721-ced1-1fe439000a9b@rasmus=
villemoes.dk/),
>> but I don't know what happened to it.
>>
>> Rasmus
>
> Thanks Rasmus, I wasn't aware of that prior effort. I've gone through
> and adopted your comments - the result is a first patch that is much
> smaller (104 insertions(+), 104 deletions(-)) and failure messages
> that are quite close to what is emitted now. I've taken care to keep
> all the control flow the same, as you requested. The previous
> discussion concluded with a promise to send another patch which didn't
> happen. May I send a v2 with these changes, or are there more
> fundamental objections? I'll also cc Arpitha and Brendan. The new
> failure output:
>
>     # ip4: EXPECTATION FAILED at lib/printf_kunit.c:95
> vsnprintf(buf, 256, "%piS|%pIS", ...) wrote
> '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'
>     # ip4: EXPECTATION FAILED at lib/printf_kunit.c:95
> vsnprintf(buf, 19, "%piS|%pIS", ...) wrote '127.000.000.001|12',
> expected '127-000.000.001|12'
>     # ip4: EXPECTATION FAILED at lib/printf_kunit.c:131
> kvasprintf(..., "%piS|%pIS", ...) returned
> '127.000.000.001|127.0.0.1', expected '127-000.000.001|127.0.0.1'

That certainly addresses one of my main objections; I really don't want to =
see
"memcmp(..., ...) =3D=3D 1, expected memcmp(..., ...) =3D=3D 0". And you sa=
id
you've kept the control flow/early returns the same, so that should also
be ok.

I'll have to see the actual code, of course. In general, I find reading
code using those KUNIT macros quite hard, because I'm not familiar with
those macros and when I try to look up what they do they turn out to be
defined in terms of other KUNIT macros 10 levels deep.

But that still leaves a few points. First, I really like that "388 test
cases passed" tally or some other free-form summary (so that I can see
that I properly hooked up, compiled, and ran a new testcase inside
test_number(), so any kind of aggregation on those top-level test_* is
too coarse).

The other thing I want to know is if this would make it harder for me to
finish up that "deterministic random testing" thing I wrote [*], but
never got around to actually get it upstream. It seems like something
that a framework like kunit could usefully provide out-of-the-box (which
is why I attempted to get it into kselftest), but as long as I'd still
be able to add in something like that, and get a "xxx failed, random
seed used was 0xabcdef" line printed, and run the test again setting the
seed explicitly to that 0xabcdef value, I'm good.

[*] https://lore.kernel.org/lkml/20201025214842.5924-4-linux@rasmusvillemoe=
s.dk/

Rasmus
