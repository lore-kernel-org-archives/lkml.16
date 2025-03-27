Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB0A19C56C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090606; cv=none; b=LyRm+JbOqZnBmlAKCGeAgaJC6WYbHWdeYUiLKMQQuo6GpTQJq2XFuyr4zjhEHfkbKkCc/OLRe2MctyQCCjX47zKv1yGUNk4DTRJ5Q/xu0+uN2PF1DO+k6BTgvvH4LQeKCxLo9iu+3jDViymKSVW2xgHNvaXUtJawIHJQJb/Q8So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090606; c=relaxed/simple;
	bh=qeSfzsuQ+OnvzOB9ynW6I4+8VDYguG/d7VHfeNiTSM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YMKWx3sEnPrHPX+WwGPmbZ6SmYqZMUF2Dpa7qbrK0/1gHgJoufvqLo2i6DIZJD8Eb/HE47dQKO6o7Jklyw72VOFcydURLMfbYjP89FmRxQFUJrhaUcHh47nq8jVN9vLLZWhtqaPRub1Ws/4Ts5QR6yYqlS9OyfKXeb9SmVcrQqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=I9ElDiR7; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I9ElDiR7"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac34257295dso216124066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743090602; x=1743695402; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=giFLnP1jrB3bJbmUGr3lK+uOvsNT5VzaCpu7lPsk4hs=;
        b=I9ElDiR7Auzmmft+zhRPmZfF606U+J7YWQJYm6Q0XXUezrjFV/GyngHxRvxcdO1bED
         hEqhR392JAwduhNsvJ1JpfYdrjc8ca5NE+gqlFdCB3qgcUGCgXyAXOMmr54BZq3fUCEK
         Wwfuwxo81WWOWWfFd+cZtNIaCqettsdZeTUt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090602; x=1743695402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giFLnP1jrB3bJbmUGr3lK+uOvsNT5VzaCpu7lPsk4hs=;
        b=CWl19uSzRTu9CKlpFrjKzKhZQZuXWYYs4sZkVwFhbQy3Wu+0A6BGmrx5RGQsvRA9ty
         P2UJcQZStD+BC+4N8sVwoBYYLO4Dnj39vuXwC601CofuYwcXEFmFKInjm9zFCyxD1Alh
         pyMZJoRavr+q6QDA7Q3jd7k08dbujPtee/BVpMsaLvW3Cap/8FwKmQD8tHwHurzl2YM4
         k9FbQNnTTdH04LkeTAgc/M2ccL9PkNagmO6aNwOyZNe4mG2OJLKkhEckQUr8+sBeqPFD
         SIDV1YicrLOLcgE6whq2ra3izHceoVv6BjRNenCREMQGeCn4L34/Lg15+pfY+hYzFIqf
         TWUg==
X-Forwarded-Encrypted: i=1; AJvYcCWtuz4WbbcD8s4EInZA6CzqVY5RuyJNEn+q2jRlBzvmuqBKuM12LvCmnTrpgtHMdOLRwxW3K3CkOCaxfNk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1K1hT3X/pCwjREqngf6zrkxI0ppHN0VQrUZS4gqxS5TIERuhV
	/VZA6EwfbSEuxMc308yYIK1FqG6BTSK/RTB6gPbbrK4f6BwIjDjGgPbOK8fpDuaMzHrhNhxZ1Dv
	fhNg=
X-Gm-Gg: ASbGncuWhSWfu5dpwbx3hit9diCKEekc9DV6wfar0/UU2C8bOOWdmosN76Jj47A7nIB
	JFF4z2t8SZRfPVWZyaUGE+zIbDLpcurjmDZmb0SS9Le93FSAZIfQt8t9aDMQqkksXqqh8vo4Ees
	X5s0VJf0Jt9xIj3P+gjqybsVDAYHitxayhM4viWenhlxNh3apdXKgM+rTaij+TOh7o1aA15K9vt
	MHsuuHTwvdTISF+0bbRrx9Lx1WL2bzHQKBPl/Z8l7lTmIbXyp6Y6kenT7DpUftLrjQdcwRH3qJn
	aGdF2Qgu/Z3mGb8ul1rWRI2+1uvys0VL1l8Gj8Bx6X1ZXkdMPOg6pVpt58dNCezS2TooJZD9ae6
	EqkTsP5Q6z0ER0rk+BZuB+UGTF4Isrw==
X-Google-Smtp-Source: AGHT+IHM/J5pvWDFoEZ8K23QiUndUUbsLR+zDwjLKV1JZU66OjzTVX1xfXU8ZcvghBxAAmQqq/wzAw==
X-Received: by 2002:a17:906:c153:b0:ac3:4227:139c with SMTP id a640c23a62f3a-ac6faf2eefemr455132866b.24.1743090602038;
        Thu, 27 Mar 2025 08:50:02 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7196dc4adsm10925266b.157.2025.03.27.08.50.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:50:00 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so2192421a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:50:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5ifjO46+0gMJEo9CmVDL0fSCmaRHuILRKkqF5ZhlgI8tkiSK/5oaXwbQtRLeKGj88Jm1t/yC4GvV/zXs=@vger.kernel.org
X-Received: by 2002:a17:907:969e:b0:ac3:3f13:4b98 with SMTP id
 a640c23a62f3a-ac6fb14a9eemr321047366b.39.1743090599993; Thu, 27 Mar 2025
 08:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d0ade43454dee9c00689f03e8d9bd32a@paul-moore.com>
 <CAHk-=wjbahY4JjLCXNT4o3xVq2cejqBG69z+MNfHsN9FQBnbOw@mail.gmail.com>
 <CAHC9VhRExVqdhHqs0njs7NY6bFg0BfcE-gMpS30HW9O7MSDfWQ@mail.gmail.com>
 <CAHk-=wi9m8-_3cywQCohJQEQtuQ+teS4gOtBkWZrhFWzNy-5_A@mail.gmail.com>
 <CAHC9VhT3D7X=4SpO5xbYm=JUwJqTa7tn=J6QMDBV96c7VBUw4g@mail.gmail.com>
 <CAHk-=wiH3hoPTxX3=xTRzRuCwktf3pNzFWP45-x6AwoVAjUsUQ@mail.gmail.com>
 <CAHC9VhT5G6W7g9pB3VM6W7wCEJjWfYSUWNgWF+rRiQ4ZQbGMEQ@mail.gmail.com>
 <CAHk-=whwQhJtafHN4B1w-z2Gno__xLHS4NouKKHrYNTYa8kz3g@mail.gmail.com>
 <CA+zpnLeK2Ecj1mBod2rFe4ymd9eXiJkbyYwFh4Yrmck3DVB2SA@mail.gmail.com>
 <CAHk-=wiBH8FBL+pnXui8O-FSdyoG-yX81mUF9bsZcC6rR5ZtgQ@mail.gmail.com>
 <CA+zpnLe_AOpS_F1UBNOvN3YRswUSy_3=0jjUAy4GPxEHYumD0g@mail.gmail.com>
 <CAHk-=wgJ0gzYJD+MghfVW-YeGLW6sLU5soFY13KWmPAxobk5Mw@mail.gmail.com> <CABXk95AqgpqGtjzK2o=mxWJg5RUZG80dAEaKF9JdUT6n5eFENQ@mail.gmail.com>
In-Reply-To: <CABXk95AqgpqGtjzK2o=mxWJg5RUZG80dAEaKF9JdUT6n5eFENQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Mar 2025 08:49:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh1refm6JkAB__TmC8OBJyNdH2DmNQAbvcL=tKepkHrYw@mail.gmail.com>
X-Gm-Features: AQ5f1JpfPxIDPXqHseSeuENAM4paunItAZJKgsQVaCtDcDayjV2pwNNW6TWk5bQ
Message-ID: <CAHk-=wh1refm6JkAB__TmC8OBJyNdH2DmNQAbvcL=tKepkHrYw@mail.gmail.com>
Subject: Re: [GIT PULL] selinux/selinux-pr-20250323
To: Jeffrey Vander Stoep <jeffv@google.com>
Cc: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	Paul Moore <paul@paul-moore.com>, "Cameron K. Williams" <ckwilliams.work@gmail.com>, 
	"Kipp N. Davis" <kippndavis.work@gmx.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	selinux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Kralevich <nnk@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 01:59, Jeffrey Vander Stoep <jeffv@google.com> wrote:
>
> The value here isn't so much about checking the source context
> "kernel", but rather about checking the target context and enforcing
> that firmware can only come from trusted filesystems. So even a
> compromised privileged process that sets firmware_class.path cannot
> cause the kernel to load firmware from an arbitrary source.

Yes, and that's literally why I earlier in the thread pointed out the
new code in selinux_kernel_load_data()

  "I'm looking at selinux_kernel_load_data() in particular, where you
   don't even pass it a file at all, so it's not like it could check for
   "is this file integrity-protected" or anything like that"

because I understand that you might want to verify the *file* the
firmware comes from, but I think verifying the context in which the
firmware is loaded is absolutely insane and incorrect.

And that is literally *all* that the new case in
selinux_kernel_load_data() does. There is no excuse for that craziness
that I can come up with.

And yes, I'm harping on this, because I really *hate* how the security
layer comes up in my performance profiles so much. It's truly
disgusting. So when I see new hooks that don't make sense to me, I
react *very* strongly.

Do I believe this insanity matters for performance? No.

But do I believe that the security code needs to *think* about the
random hooks it adds more? Yes. YES!

Which is why I really hate seeing new random hooks where I then go
"that is complete and utter nonsense".

[ This whole patch triggered me for another reason too - firmware
loading in particular has a history of user space actively and
maliciously screwing the kernel up.

  The reason we load firmware directly from the kernel is because user
space "policy" decisions actively broke our original "let user space
do it" model.

  So if somebody thinks I'm overreacting, they are probably right, but
dammit, this triggers two of my big red flags for "this is horribly
wrong" ]

                Linus
