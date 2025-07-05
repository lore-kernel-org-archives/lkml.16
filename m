Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E48517AE11;
	Sat,  5 Jul 2025 05:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751692178; cv=none; b=HYuZ5vC0LfjO1g9tGjD6XUll9Vp+FPeknjCdMp0VePdyBumm4luVPHPNKFXzs8Jk+TjfzQyHl32I6L0MWRJDNpZdffzDu+XWPwmhcdC/9GTWKEZgCXNnK2jJHmT5Hk8/YQm3RqgljhB4PtQm+VP/YI1T8nJbBedD7VkUapUwbBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751692178; c=relaxed/simple;
	bh=3C351zXaKNZkvaAEmTZH4DhXiQkWrXqhX8EEeSNlyjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=flvoqB7Z3irX41u7TGB6nGzPVkzkBeVchNsPVKPHnw9T8tD0bBPTZF1JpJpXvql0PU4N+6+Bvfa9rG3daaAZi9jYSfhL2KPXpKbamUwHXuNcCg455akeTu1eyFr+XSog8g0h/h1qMj34xlw4F86LojcjDKG6PYvlGjJHaqcCAw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqSmnOez; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqSmnOez"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-40abe6f8f08so1452817b6e.0;
        Fri, 04 Jul 2025 22:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751692176; x=1752296976; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMci5qtDxPxCQhNXMosu45LJdV+xYetyKg8i0aR49bg=;
        b=lqSmnOezxgfVNAe8vy9brOewBZjRC9OR6+alnb5qUOQpwPVJlbR3bx26Lsj7uFCT8x
         xiXh2QeY/1kpJlIYwXuy+AkV44nERCIRingc9Wmsj6LoCe8hgR4D4U2gwzPgfxm5z+XA
         JvQe+WteqLAY54TxKfstnX68RMVohf6S5SBQvwpsH5KJVLT/Eyt5IRc8opOq4ILH2u2a
         psdrgOXb6As2NtX6dGj2UlzVZgtnf7J+cnzAqgy9q5bmrNshAHI1QYDGdBrnxHXHs2z5
         z2eLN+jQ4AU9fuANjdpQ6NEEXtuWI9PICAMcVviygpaSZXxmXr7gIBIAW/93K711zT0s
         ABcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751692176; x=1752296976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMci5qtDxPxCQhNXMosu45LJdV+xYetyKg8i0aR49bg=;
        b=SBPMKWObogpJ+lS/0mw4kwERNG0jnxewiZe+84Dfcm8VY8JYkhnYHR+F0UUW5x0ne7
         30v/4FYZFKptgj28W1rqil0JqI4SfCofB4tJBMsvRr8Ai28h2qmtezoWtzl4s1Mtdcxy
         TAm2xk/OJdsKLzVSsh55LEcFy63CPjIkfgi0aTjf1x7eMxqQX0u4tQsX+UMHRYuohFXn
         9njEU+5aAkm6ZkHuqBQ94uYPkccyovCwgTGi9WZwfAuLCDlb35OlngYQvwp4zUrcqisf
         6zFoO6/PRQn6hUbvqRoG8f9BjHWM3v4BkqQXCedAV++P7V9V3Uc4DBI31DgnxyiR2Y9I
         /1OA==
X-Forwarded-Encrypted: i=1; AJvYcCWB0mrSM/Qg/XpU2B4uC9UqJD9IavgM/6S1ExvmIzJsiIxS1Ez1NgdllsDGuqAJbf1CDDZGG7XLSa5sDW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZT2somtmNzZFVuEIElgFzvN3Ubo69cfLo5h9FCNx5mSm3iGlR
	zKhcDHbFOM2KbhKAIO0f5I6Du1v2ZE2CXdpqHmv4Ex+to20NLjI5HncZLFypcLZ4RI9NQLvKFAD
	daBIzsUopntxygkv/GoGMf/k1l+tdFxzQS/2NR4I=
X-Gm-Gg: ASbGncsMySXWdG2/lgaahyvuJA7bNs54vSowaJvrpSpJ+WHLr/ge6m1MkW75qdJZw2P
	cgE1pIc9Ym0QOWRYbximTIxJ1lBPcj+pPeyiqtb2afGRr8W3oCkKq2Wbq5B4o5Gd9WJoHWIm9Jj
	cejnXWyGT3rpgt4+0LeyPUr1CiC+c7bDIdgUVwcJFUqcatZ+1lFh6lqug=
X-Google-Smtp-Source: AGHT+IEFVAApNVakbH9gnhkeeESDuh0C5GYe1c/ZLqBTdYx916A7d0kUrooJJ4SlCZvqHrb8qJOHZjgmeynsloSVeI4=
X-Received: by 2002:a05:6808:3027:b0:3fa:f848:8dfa with SMTP id
 5614622812f47-40d073e03abmr3463576b6e.30.1751692176282; Fri, 04 Jul 2025
 22:09:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626165927.66498-1-marcelomoreira1905@gmail.com> <DB29YAYDK6YW.1NF5I2WSI1BPR@kernel.org>
In-Reply-To: <DB29YAYDK6YW.1NF5I2WSI1BPR@kernel.org>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Sat, 5 Jul 2025 02:09:25 -0300
X-Gm-Features: Ac12FXyjwVkGy5wdiL8UlfvZq9uJJjU263ycqnw9WEXcj2hJBVhhlbztfAnAZ0U
Message-ID: <CAPZ3m_iqCRYh+XhMip3h=ZWKpw4VPfnRQ6ofmoAnrzKDbOO-PA@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] rust: revocable: documentation and refactorings
To: Benno Lossin <lossin@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dakr@kernel.org, ojeda@kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 3 de jul. de 2025 =C3=A0s 05:24, Benno Lossin <lossin@kernel.org> =
escreveu:
>
> On Thu Jun 26, 2025 at 6:59 PM CEST, Marcelo Moreira wrote:
> > This patch series brings documentation and refactorings to the `Revocab=
le` type.
> >
> > Changes include:
> > - Clarifying the write invariant and updating associated safety comment=
s for `Revocable<T>`.
> > - Splitting the internal `revoke_internal` function into two distinct, =
explicit functions: `revoke()` (safe, synchronizing with RCU) and `revoke_n=
osync()` (unsafe, without RCU synchronization), now returning `bool` to ind=
icate revocation status.
>
> Could you wrap your text to a more readable column? Thanks!

Sure! Thanks!

>
> >
> > Marcelo Moreira (2):
> >   rust: revocable: Refactor revocation mechanism to remove generic
> >     revoke_internal
> >   rust: revocable: Clarify write invariant and update safety comments
> >
> > Changelog
> > ---------
> >
> > Changes since v4:
> > - Rebased the series onto the latest `rfl/rust-next` to integrate recen=
t changes, specifically the `bool` return for `revoke()` and `revoke_nosync=
()`.
> > - Dropped the "rust: revocable: simplify RevocableGuard for internal sa=
fety" patch, as the approach of using a direct reference (`&'a T`) for `Rev=
ocableGuard` was found to be unsound due to Rust's aliasing rules and LLVM'=
s `dereferencable` attribute guarantees, which require references to remain=
 valid for the entire function call duration, even if the internal RCU guar=
d is dropped earlier.
> > - Refined the `PinnedDrop::drop` `SAFETY` comment based on Benno Lossin=
's and Miguel Ojeda's feedback, adopting a more concise and standard Kernel=
-style bullet point format.
> > - Corrected a duplicated line in the commit message of the second patch=
.
>
> Now since we had to drop the `RevocableGuard` change, its safety
> invariant & comment in `deref` is insufficient. It shouldn't have the
> invariant that the rcu lock is held (since it owns an `rcu::Guard`, that
> already is guaranteed), but instead it should require that the
> `data_ref` pointer is valid. That invariant is then used by the safety
> comment in `deref` to justify dereferencing the pointer.
>
> Also, I think it's better to reorder the patches again (since the
> current first one relies on changes from the second one), the first one
> should be the change to the invariants section of `Revocable` (so
> currently the second patch). Then the second and third patches can be
> the removal of `revoke_internal` and the `RevocableGuard` safety
> documentation fix.

All right Benno, I'll prepare the comment for `RevocableGuard` and send v6.

The order now is:
1- Documentation for invariant and updates associated `SAFETY` comments
2- Remove `revoke_internal` (Refactoring)
3- `RevocableGuard` safety documentation fix.

Thanks! :)

--
Cheers,
Marcelo Moreira
