Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019DB8F66;
	Tue,  6 May 2025 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530327; cv=none; b=axXbC+J52WeUjn4NiS2Uc0a7lBWGtk2mjQnJakEH7aJBs2ZjLgYmp6igKD3zb+zuj4pf3yUpPBxHMhsFbJYXpGTj0FTDmQuEOzD1gE8x46ivCKxsBMe89xQHqpIVObH5RTAuvypbxmEtwe8I6FgWsUOTUziA9S0qC4+DqM+4qbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530327; c=relaxed/simple;
	bh=YvNBY0Ps4akcWEgCN/IAs0lFkOXnfxNdZvQc4xvgLMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S7Ruy7TfPXj2v8UUS6rsYuy3DFZGrx8NFpVlt3hM14XzkHfCY0xgl1Kt5JSkYcoH3bDs4ULSZ1u8KnrHC7PI+oz3po1pkGVq+NfGw5E5gOnhYBTswTtQCz1mvVh2QZbag4Ym9QsmIXZKUjFCT5Ax10jpOs+EB5KJjSAKliINVmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FuqASAEY; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FuqASAEY"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-af90510be2eso553131a12.3;
        Tue, 06 May 2025 04:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746530325; x=1747135125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRpeckz8pShVDypGXyJGOnSLEbZFu2aGaUPEjsNeRyg=;
        b=FuqASAEYKlYzLXD8KO0V9jdzuj+oLsOwE2mXhTVHq3nRY6nznBfMkmeu4Th5IX5v+K
         mXT/GqLch4X1kERS7mQFHv+PWJw6ZIzNDCFxniTfw4sVzd54T34gbLajIzUea9cFrfy/
         iVgNlip7E3Aw0l0JUaTndQvFx2ADfUgOYN0nsTS3LhvSacPMEUZ3SRc0/mSaF2Bq+8UA
         osR9BXa+XajcCwnZZ9qobChVPGQ4rrnDiQ6QLyWXZqy2Po+zMmxB3RDAyCz+jtA/Xk6L
         SdJi195zo7JG6tQkHqOgF2/sgL2q1InCuHAQER3t4PHrhTNc4Dc6l89i2JG0Z+S1WxuC
         p1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530325; x=1747135125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRpeckz8pShVDypGXyJGOnSLEbZFu2aGaUPEjsNeRyg=;
        b=UyNtJczDgASTfz6pQExrni25fmqXgZFCj1joKyn2guc2D+TJSxQosMdKUeFViD0I1l
         ETm10c3QDbcGNeavGyvZqgooQroGdHEWWj8PxsG5kHaCANFNGx+z6OalG5dtqOu7jka/
         Q0cbEbSaP67u4SCIIA9WqlVKZ7Ks+mY5iH0W5N4nvYb2ixgmz0DhIL0UdKS3B6IdlGH6
         4DB/uKqHoh93q61ozreekan95n/+JP8BqojZnfsJqRqhWKEeFv62NKEhmNX9yotUbC7W
         VmA5Jn0kVcc5kDRo0ifS9bj5WZvQ5CL6h2MvpG1wC/5OhvsJnp2CYB5WlEDwBj37085H
         mOFA==
X-Forwarded-Encrypted: i=1; AJvYcCV7ak5gb7xNhx/tbOBr9w1Rx+NbLr+rDDHsP4L9CicgGCIcP6x7YGyHUqP6EjQ1+wkCWGVN7snJmAv48lQ=@vger.kernel.org, AJvYcCVG7dAdHP0pkIhu9HLcf0d1HYsNkoedSJhROr5jm1K9gLrhWJQxxlqrzUUq2IkcG6INDdkqqZz8p3/vB2UznR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOd56MHIstlDYop1F1Yd+mJh/a3WaqxAWEDCQaVPwyHehD4kBM
	YvTIeC3VPx+J86ToJwkrt2EDjwFTG+ENBLR6NvDmXt895QKSodgOSjV8mQwSxcVLZyvs8WJltQO
	c6jW7AA/lqI+qTdsWfJOo6ClrBN0=
X-Gm-Gg: ASbGncsHzudH12Zq61+BdY1wJ3feJIRHzrJcWymqCl54HTLH2gB/zte1pW8Ef2suFIT
	yY99S8oa/L734gf2dFkyh+apBT6M/NjUlWM1LQhWpTzZ3TSthUb0cfuxp6S/F8C7zVJseKbv854
	sj05LgWUyk/k0jO1NOh/FiD5VJggzdVo4=
X-Google-Smtp-Source: AGHT+IF0A8X7TKL/5b/MTu3H0JRvBU4yLKp10ldMQJuWkLJDB/QpF0Nj+hZHgQcmBCBaWpAZ6/ycuZG4dhGpTJR/184=
X-Received: by 2002:a17:90b:1b4e:b0:2ff:7b41:c3cf with SMTP id
 98e67ed59e1d1-30a4e621c63mr9103953a91.4.1746530325095; Tue, 06 May 2025
 04:18:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
 <20250501-configfs-v6-1-66c61eb76368@kernel.org> <ELsEgktE6XbGxDyusumtuVzyX-eotyYuQdviHTZaIxN7KZaGFr0fNqrv5tac_gYWfbDZYNTC-wQyQuxnmufA2g==@protonmail.internalid>
 <CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
 <87msbw1s9e.fsf@kernel.org> <86-cT9dBPpEIyQXWVCeEmj3TRvBm6Ta0p1B20sSngRGOqOuC96i6hG3Q9Hg3bN8AQTCPXlsxg_C5Ok0G4JJzpQ==@protonmail.internalid>
 <CANiq72nd0Pfv4TrpULGQ_fZkyBpHyVVZ1H45_RJBgBxkJuzCJQ@mail.gmail.com>
 <87h62419r5.fsf@kernel.org> <FLMJjrvUlrMEWy7KzihcYUt-V1IFyP8nt9KYysmVPsWdxUR9dRVXsRoSBw4Z0oFX8tzfWieBDkP7YPAHOXtFcg==@protonmail.internalid>
 <CANiq72miL3eZ40ujmA-pXCqMS8y2AzJQ1UKpL1_hX03AJ0fteQ@mail.gmail.com>
 <87bjsc154u.fsf@kernel.org> <CANiq72=SD9ogr+RpPK7E+cFmn2qAVu+MBCoChdp8-hw7JFu6zA@mail.gmail.com>
 <TbTextfZAMlWFS5cWlUE-Wtnp1bv8P783IQQbWUcnHvEgBjpIxukMngLdPkqNR9jWT9O_OtOY1ejin9JoOnsww==@protonmail.internalid>
 <CANiq72m8VWKRyFai0Xg8AZUTjG0eUVG8nY-ZCQOqOnvwsW0ZaA@mail.gmail.com>
 <875xij1ouy.fsf@kernel.org> <m9-XLEt04AwLCzToZZoXspXzPC6RJkp8ht7DnkVuEEPHQ02CjS0SNIKyKM1gsH-QfZruoYixHlsAHzfYyNEykw==@protonmail.internalid>
 <CANiq72m0cuf5YKfOY8oNg83dzWEqqyddGKKh_6fwQQ4hoCp+yQ@mail.gmail.com> <87ecx3xzqd.fsf@kernel.org>
In-Reply-To: <87ecx3xzqd.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 May 2025 13:18:31 +0200
X-Gm-Features: ATxdqUHdMDblEh-0NHJk5v64ga_hltalfD0ejiteX-MhcryQrsXXQBo8t4zMhec
Message-ID: <CANiq72nPMH06HURgZJN-o0GMmGdQQpFetm=S5SDEB+B+f0wefA@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] rust: configfs: introduce rust support for configfs
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Fiona Behrens <me@kloenk.dev>, 
	Charalampos Mitrodimas <charmitro@posteo.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Breno Leitao <leitao@debian.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 9:51=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> So I was thinking that because I am initializing a static with a let
> statement, it would run in const context. But I see that it is not
> actually guaranteed.

No, that is actually guaranteed, i.e. when initializing a static. But
you aren't initializing a static here, no? Which static are you
referring to? If you were, then the "normal" `assert!` would work,
because it would be a const context.

The `add` calls I see are just in the `let` statement, not
initializing any static:

            {
                const N: usize =3D 0usize;
                unsafe { CONFIGURATION_ATTRS.add::<N, 0,
_>(&CONFIGURATION_MESSAGE_ATTR) };
            }

So it also means this comment is wrong:

+        // SAFETY: This function is only called through the `configfs_attr=
s`
+        // macro. This ensures that we are evaluating the function in cons=
t
+        // context when initializing a static. As such, the reference crea=
ted
+        // below will be exclusive.

Please double-check all this... :)

> Right. Which is why I opted for `build_error`. But with the `const`
> block solution you suggested is better.

I thought you opted for that because you thought the `assert!` would
only work if not refactored. What I tried to point out was that the
`assert!` wouldn't have worked even before the refactoring.

I hope that helps.

Cheers,
Miguel
