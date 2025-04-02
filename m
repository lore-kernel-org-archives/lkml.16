Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B781F0986
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625558; cv=none; b=b8zgMHtdQixp7kigogUDY2YrMlGmjDD5g7rc8ItHDtsOvoj5ugv3Y+02v3O3am8sTun3vLenPwXmvVFB3VU1VnqtefMi0qk9ovtgiLZCtGsLtjH7ZSDeMNeF+wZjiYeFASac2VbLIRYeZD2ert9SJ4MbhE60OdBxAoZVVeCXXXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625558; c=relaxed/simple;
	bh=59QXo2hZV1LOIlvsjZUL8Q5y6qDIDVDjD+XjBzuTuAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYYcFyrt3UrEGPp9bvI255kwiak9sQQC30rF9yfThDTkqw5A5UDrtJ9kZXgJVMQjbGM/iqe23FhpfuCUEGB4ecwmA58dWdOoneXoi1fK8x6dl4GMyO6f8jSdnMGHALKpyM094rH6gbC5WubNiJg5d8cshNMKzOFTB4d4ryPjNpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uolbiu15; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uolbiu15"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so402230a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 13:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743625555; x=1744230355; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59QXo2hZV1LOIlvsjZUL8Q5y6qDIDVDjD+XjBzuTuAY=;
        b=Uolbiu15CAylOjdYHh0rSYXnwdXVohzUtXJHx+s6AKvzeIsBiArUdz0JZl+K2M+7gF
         tynrL8rLu2TxoWoJhZ8R6egkaw5S52t+5un6GmacScJl7uQLJet33cf5iQ16ao/tfXjF
         0tElxwuWDW7HjmDiuY6vSwaIqiV9GF1GOAcCFb1zqOfxSnuTqlFOo+pTm1W9fPN8qtHe
         5mS+V+mZYFCodGXk/aqd2jvtx+lcUD+uLKwKJLg4+B5r7wHlIKQtkOu1vegJdD1qXFZ0
         Q55HoQyp4/vyEzxmXLh2SeZTf3KqpgDIl4h3skve97vxVLpZNfSr6qypD4AMLYHWRMLC
         U+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743625555; x=1744230355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59QXo2hZV1LOIlvsjZUL8Q5y6qDIDVDjD+XjBzuTuAY=;
        b=XuqxMBpfcpGhQ53pTbmzhAPjrelG4EEF57VjYkWy2VWKBQzOIokSDjVWcRwmMwVg0F
         YHTD4rwe02MVUUKDmBx79+HfPKQZ1CBAxXR0kEk2dibHJ855L8z28Ody10gdka6jbcnE
         lSj8/NruIlAm8DEqCKlV0gLXBnblcHxbuqEcz/2XF8gfjSkCKa2g36DcWZuphOz0qcvI
         vELcdvSktoNX3FbbwRHq0qKWjdwFY9I8OdAG0BXX43ySINrnB8hiFuXQh6W8hT3cALbA
         GcWEDDg1D0Isl5c28ohQJGGLvu0CS67fUMmBgVIkwQjyC1eaDDq7febCqNeyNZ3SM/43
         nYEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOk2RVkJLChyBngvYcxqOZ0AAPOqW7ADmCjFLfsHRxQLiXzjy4p8aA4WMqyZB/9xf6sHroyuvCFEqsLSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz576S1aHYBWE4JOsqYQUnb+wJc2jL9+FDljHvSZO98+1JDf9yp
	7wWlynHff8N7kEVIR+i2MqotmQkNzTHnd0Srckgpw+oTMHB7ibztEf5p3Eq6nBnrdi8JdEuRk2L
	Z8xYfMn1TaYiuJufnlSOafsYx+ko=
X-Gm-Gg: ASbGncvwgchYrB3GXR5Q5zX8x3p3oDJvYfsWP1Zitk8+CE9C18vStxPbNSGMkRrOG4I
	+QMlBFDtR0quI6oWvBkXej4PJc5pxYgjiRhBrcjaQ3k9w+zypAtOjw97RUePSSLofr5itjJ+agg
	otp0mlRZW12n/h8Q1WAev2iqk5+g==
X-Google-Smtp-Source: AGHT+IGfLJ1EHzAbAuo2kxL5h3fnU8jx5SKHqq/L8MyW1kFzWIWBH4fcm7wSYH1g3i8jRBMrmb7bcAQnhqBFWV/rJVU=
X-Received: by 2002:a17:907:9710:b0:ac2:cf0b:b806 with SMTP id
 a640c23a62f3a-ac7bc26ec1cmr11557366b.56.1743625555137; Wed, 02 Apr 2025
 13:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-00cAEKkfvyNto2@pathway.suse.cz> <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain> <CAHk-=wgfX7yfDYVOF8VqRR60RaBFbK=FZMLqOx0nT4ckMnS0ug@mail.gmail.com>
 <CAHk-=wgWT4AOFgMxSBVqYD9dVPXTr775UAwyX9cUOz=0ahf3_Q@mail.gmail.com> <20250402154435.5b0aad22@gandalf.local.home>
In-Reply-To: <20250402154435.5b0aad22@gandalf.local.home>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 2 Apr 2025 23:25:18 +0300
X-Gm-Features: AQ5f1JqEGjeET-WBWRV2XhcYNvuV8NhaCUM17022T6NamQx-cSDkpk_M8Qlzn4s
Message-ID: <CAHp75Ve2gYjqQKSCrWsDBjNFkZUzB8UPz4kcTUTveXXxm_qmWA@mail.gmail.com>
Subject: Re: [GIT PULL] more printk for 6.15
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, John Ogness <john.ogness@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 10:43=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
> On Wed, 2 Apr 2025 12:10:08 -0700
> Linus Torvalds <torvalds@linux-foundation.org> wrote:

...

> Also, it's a case to prove Cc's, as there's been times that I've seen
> someone add a "Cc:" to the commit log but not actually Cc the person in t=
he
> email!

Side note about my whining [1] of addition Cc to the commit messages in gen=
eral.

[1]: https://lore.kernel.org/linux-doc/Zikc4fDNDer6hSzJ@smile.fi.intel.com/

--=20
With Best Regards,
Andy Shevchenko
