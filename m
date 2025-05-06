Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B19972600;
	Tue,  6 May 2025 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531115; cv=none; b=lI8rS5V0U3GZCV4pGxOfyU3C1+Ar7ckJAb11fid4fLDLWn0WQwISvf8JdELi7V/Qn+uV3sLdiklaTSJwwdIcx83vz5hOrPqay+IqDEByNdK8UzQBX36CdETOvZUw030aNbEWBBqy4kYhPHDKMESVzWWf8M3GNAI5BP6IrgLAe3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531115; c=relaxed/simple;
	bh=v3dINSmCM2x91RxKHVUEZP/jX1+3KXGHVTyDueApqyY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lJcV9a42vnnPZJDFCvhGsaAIDQj2frt8fSRJ+2ZBBbQV82Ci7Kl7fjnFcgqXeGfzo/WiQ4Hfr+XsucqAGGP5+mrWuWHspH5L712EJn3qR9iFCxZpExnZVfrp3FQGRS2SSlF2ojOnCcStXHbSEXCFAPvc0WBK3RwSzlXguNsHLNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHkEDFq5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHkEDFq5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74249C4CEE4;
	Tue,  6 May 2025 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746531115;
	bh=v3dINSmCM2x91RxKHVUEZP/jX1+3KXGHVTyDueApqyY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nHkEDFq5Z6yBfNsvOU8s3hTCoUmbymLLqL1I0DrgvNcjokn8M8veNcDnFOCc2oOz1
	 Xnt1tYndHKOBQkVp/Y1A/S8RlC+dQNNxDAd+sLYa+I+Pwhq/4U4s/X9vym64aF20cl
	 AyfHDws+pdUPsQ4foTBAZt3vKTNtNWjQwBgWXlcF4epOKXPHxTo6qd9PyNA2LrAFDd
	 U+j+hI3upHhNDW1OfwFXjeuQiYUph4DB5qpnefgUYRF3BZSDRAj8Z/8wXhWWnK/wVj
	 5So8mD8FCbt3/bz9PHiIp/Bl0zaE23PXaglu6R8F9d6lImwAzlwfmL3irgajLESxWx
	 ab2ZwFScE+irA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>,  "Miguel Ojeda"
 <ojeda@kernel.org>,  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Joel Becker" <jlbec@evilplan.org>,  "Peter Zijlstra"
 <peterz@infradead.org>,  "Ingo Molnar" <mingo@redhat.com>,  "Will Deacon"
 <will@kernel.org>,  "Waiman Long" <longman@redhat.com>,  "Fiona Behrens"
 <me@kloenk.dev>,  "Charalampos Mitrodimas" <charmitro@posteo.net>,
  "Daniel Almeida" <daniel.almeida@collabora.com>,  "Breno Leitao"
 <leitao@debian.org>,  <rust-for-linux@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/3] rust: configfs: introduce rust support for configfs
In-Reply-To: <CANiq72nPMH06HURgZJN-o0GMmGdQQpFetm=S5SDEB+B+f0wefA@mail.gmail.com>
 (Miguel
	Ojeda's message of "Tue, 06 May 2025 13:18:31 +0200")
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
	<20250501-configfs-v6-1-66c61eb76368@kernel.org>
	<ELsEgktE6XbGxDyusumtuVzyX-eotyYuQdviHTZaIxN7KZaGFr0fNqrv5tac_gYWfbDZYNTC-wQyQuxnmufA2g==@protonmail.internalid>
	<CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
	<87msbw1s9e.fsf@kernel.org>
	<86-cT9dBPpEIyQXWVCeEmj3TRvBm6Ta0p1B20sSngRGOqOuC96i6hG3Q9Hg3bN8AQTCPXlsxg_C5Ok0G4JJzpQ==@protonmail.internalid>
	<CANiq72nd0Pfv4TrpULGQ_fZkyBpHyVVZ1H45_RJBgBxkJuzCJQ@mail.gmail.com>
	<87h62419r5.fsf@kernel.org>
	<FLMJjrvUlrMEWy7KzihcYUt-V1IFyP8nt9KYysmVPsWdxUR9dRVXsRoSBw4Z0oFX8tzfWieBDkP7YPAHOXtFcg==@protonmail.internalid>
	<CANiq72miL3eZ40ujmA-pXCqMS8y2AzJQ1UKpL1_hX03AJ0fteQ@mail.gmail.com>
	<87bjsc154u.fsf@kernel.org>
	<CANiq72=SD9ogr+RpPK7E+cFmn2qAVu+MBCoChdp8-hw7JFu6zA@mail.gmail.com>
	<TbTextfZAMlWFS5cWlUE-Wtnp1bv8P783IQQbWUcnHvEgBjpIxukMngLdPkqNR9jWT9O_OtOY1ejin9JoOnsww==@protonmail.internalid>
	<CANiq72m8VWKRyFai0Xg8AZUTjG0eUVG8nY-ZCQOqOnvwsW0ZaA@mail.gmail.com>
	<875xij1ouy.fsf@kernel.org>
	<m9-XLEt04AwLCzToZZoXspXzPC6RJkp8ht7DnkVuEEPHQ02CjS0SNIKyKM1gsH-QfZruoYixHlsAHzfYyNEykw==@protonmail.internalid>
	<CANiq72m0cuf5YKfOY8oNg83dzWEqqyddGKKh_6fwQQ4hoCp+yQ@mail.gmail.com>
	<87ecx3xzqd.fsf@kernel.org>
	<SwuN4IgGwXbwy3_67Br6ePRhtgh9XOahiVZwowTgUCacTz4Eos44f86aFUJS7rqZfrb2FKhBkKanUDERKBMSmw==@protonmail.internalid>
	<CANiq72nPMH06HURgZJN-o0GMmGdQQpFetm=S5SDEB+B+f0wefA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 06 May 2025 13:31:45 +0200
Message-ID: <878qnaq8ke.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Mon, May 5, 2025 at 9:51=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> So I was thinking that because I am initializing a static with a let
>> statement, it would run in const context. But I see that it is not
>> actually guaranteed.
>
> No, that is actually guaranteed, i.e. when initializing a static. But
> you aren't initializing a static here, no? Which static are you
> referring to? If you were, then the "normal" `assert!` would work,
> because it would be a const context.
>
> The `add` calls I see are just in the `let` statement, not
> initializing any static:
>
>             {
>                 const N: usize =3D 0usize;
>                 unsafe { CONFIGURATION_ATTRS.add::<N, 0,
> _>(&CONFIGURATION_MESSAGE_ATTR) };
>             }
>
> So it also means this comment is wrong:
>
> +        // SAFETY: This function is only called through the `configfs_at=
trs`
> +        // macro. This ensures that we are evaluating the function in co=
nst
> +        // context when initializing a static. As such, the reference cr=
eated
> +        // below will be exclusive.
>
> Please double-check all this... :)

Oops.

>
>> Right. Which is why I opted for `build_error`. But with the `const`
>> block solution you suggested is better.
>
> I thought you opted for that because you thought the `assert!` would
> only work if not refactored. What I tried to point out was that the
> `assert!` wouldn't have worked even before the refactoring.

I made a mistake in thinking this was in const context. I'll see if I
can fix that.



Best regards,
Andreas Hindborg


