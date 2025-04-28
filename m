Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D340327A93B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745857446; cv=none; b=jbTwd6zLGrXmqVfu3v3qPcuhVEUTjUXG+6GoCV6M/VAbd89qGU9emkkvpmAMsZTqrNi6gehX73XVcgpZpXa41JORhLUDgkqxbXTgrLJwVeaYQKAX92ykbcWxXgEN5yaZcJfY/kkKgypgR1XH4zvuv4QKMlTz0b2/Jzatge+ppo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745857446; c=relaxed/simple;
	bh=0sNl6IcH2cqCd9Ts6stZ5oeb1k+I20Eb0Ns3cLjZ0RQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgkKxug0G0RKXqlZ5WV/lwDVWSA5vstheL+NDE8lfs43DPms2Af6kbnXzEwpAkFILputVC64XDfUa/D/CFyXgVC/kFMoZv+Kx3gYm0sHty34Gh12jJb1gJ+aNeo0gIuSFysQ9Whz0cLB+QEyYvXA2CkyrK/oT+51J5eZxJYu/Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LtL5OQbS; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LtL5OQbS"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acbb48bad09so927653066b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745857443; x=1746462243; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+Gzk3UbpCetRBDPUBxjg4HZ9NaakRevcBnLrmR9rpY=;
        b=LtL5OQbSMTJ2zQV2jNR+HNHDowju5CIxg23/La24vO6wh9NE64LmdD1SD6qM8WcM4Z
         V1gatYApHE82gS7hCb2NbqqlZsH1uuNmfYkHR8DPqM+jJFvjcpQ2w4eoy3NqddKtt3yV
         +X8pUTXR1M/QlJWC+YDyRangjS6bpGJ1VO70s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745857443; x=1746462243;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+Gzk3UbpCetRBDPUBxjg4HZ9NaakRevcBnLrmR9rpY=;
        b=I1OE+H/Qt0jKcEE18PRBWviq9UyIFGTKjUkMzM8zMzzf9LwF2EYjR7bL6q0tq4051v
         Vhr4eINwVN4Y6DGzz5EFYNaT4NR5PAh3vmtbW7RTTM9wnGodWI1v2qzorvX258onQ8nY
         hFi/rU/UzfP9hFXl7Z7ahKOD8DgjfxTeHJZC+rMMzzjYL4D/rSg+B6pOywQE7wwIQJBw
         cQrKu6zWE1Y7omG8kZD56h6AGBY6u8NRBXTQ9KIKnRSMjV+9ZK6MKraJmoCc4Lwpcscz
         iIMya75k978MBi+SE21NZQQdQY50R8qEegu1+c2ymVWsg2bHt49p38ZcyKDMtkDJDJog
         ZopA==
X-Forwarded-Encrypted: i=1; AJvYcCVx8bUx8LtGf3hO9J6Tt6EihhbQJzcRj9+ebC+9cLA6BzHcmPHATD+T44H/8nbGsqTuESnLbbBuJb5Abxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzflplAnBVO5lIQkad1ppQ7FznWgOpjXynw7Dv8YO1SauHBf34W
	X9Frj0Poj7tV9MHNHxvAuAWXYZeHNogxmnDMTZ3vKprXgfistQY0ghezEIGxoiwNRkMPkDI1FoA
	c5HMDpw==
X-Gm-Gg: ASbGnctUDdW/ZwDorubUJoEsy0FvMoHV+oZJyYio1/ztMUootavAwGnpvxVjDCthD/e
	8y0KtUN9EmL8bOGGN6GaCEvCbmJ8aXy90DkiBq33Quv1kvdb6LS5QXQSPYoN2VEaWdrle3+7YWi
	vvClOp1noelGPmE7lkg+t9VqqgKKY7qYGRrTCKdCJZX0Me4EcqrUiQIJIhETfW2+rE/COIGsRfg
	UP8THx0skg7JH6VYwzSmJXmq2dCdD0wW9pXc0j6VjscPyqLgk8KqbfcCcJ2UVyR0pVCmyXL+Gz1
	TaqcBJwZzeTVZxPDzPKAh4qbplKNv9jYclkATKGh5LkXgYViEpMCQmBLxm4B6EB75W/N80RPAmK
	+48rxEeS/x8ALl/g=
X-Google-Smtp-Source: AGHT+IFVmPIsNo40AoFlFYycxtKFfvNuuKuam/3bX4tLtmFXzNaQJUZ0SuJUXAFRhyBygvX/W9TQCw==
X-Received: by 2002:a17:907:94d3:b0:ac3:446d:141 with SMTP id a640c23a62f3a-ace84aacbabmr768560266b.47.1745857442977;
        Mon, 28 Apr 2025 09:24:02 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec4fbc9c2sm10305266b.171.2025.04.28.09.24.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:24:02 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so789726566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:24:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX4NarazUdonwx6UsAL5C008yv00dZOVqcnNJMxC0xCo8ETgQzkP017RP+UQxRYgurPmGVvEQi8cWRFmao=@vger.kernel.org
X-Received: by 2002:a17:907:608c:b0:ac3:3f11:b49d with SMTP id
 a640c23a62f3a-ace84618fafmr831890066b.0.1745857442337; Mon, 28 Apr 2025
 09:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <aA8q4Ot-1zTzv_Kt@gmail.com>
In-Reply-To: <aA8q4Ot-1zTzv_Kt@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 09:23:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh5DUS+nhfTxPEEbaB9dsFib39gWatrX4NoFq_MpdOzGw@mail.gmail.com>
X-Gm-Features: ATxdqUEOHobK07xK1eZcXrNUILKYEsYxFZLSsdb8bVPG3MlGNjXDMTRVJr7bMKY
Message-ID: <CAHk-=wh5DUS+nhfTxPEEbaB9dsFib39gWatrX4NoFq_MpdOzGw@mail.gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd@arndb.de>, 
	Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 00:14, Ingo Molnar <mingo@kernel.org> wrote:
>
> And, just out of intellectual curiosity, I also tried to measure the
> code generation price of the +1 standards-quirk in the fls()/ffs()
> interface as well:
>
> ... and unless I messed up the patch, it seems to have a surprisingly
> low impact - maybe because the compiler can amortize its cost by
> adjusting all dependent code mostly at build time, so the +1 doesn't
> end up being generated most of the time?

No, I think one issue is that most users actually end up subtracting
one from the return value of 'ffs()', because the "bit #0 returns 1"
semantics of the standard ffs() function really is insane.

It's not just that it doesn't match sane hardware, it's also that it
doesn't match sane *users*. If bit #0 is set, people want '0', so they
typically subtract 1.

So when you stop adding one, you aren't actually removing code -
you're often adding it.

Just see how many hits you get from

    git grep '\<ffs(.*).*-.*1'

which is obviously not a very precise pattern, but just look at the
output and see just *how* common that "subtract one" thing is.

I really don't understand how anybody *ever* thought that the whole
"return one bigger" was a good idea for ffs().

Sure, I understand that zero is special and needs a special return
value, but returning a negative value would have been pretty simple
(or just do what our bitops finding functions do, which is to return
past the end, which is often convenient but does tend to make the
error condition check a bit more complex).

Anyway, the fact that so many users subtract one means that your "look
at the size of the binary" model doesn't work. You're counting both
the wins (when that addition doesn't happen) and the losses (when the
"subtract one in the user" happens).

So the "+1" doesn't cause much code generation - as long as it's done
by the compiler that can also undo it - but it's just a horrid user
interface.

But maybe people really were poisoned by the Pascal mindset. Or maybe
it was invented by some ancient Roman who hadn't heard of the concept
of zero. Who knows?

               Linus
