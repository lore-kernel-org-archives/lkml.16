Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C575F271456;
	Fri,  4 Jul 2025 07:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613236; cv=none; b=Cf9WzTluHLropy7av+xzi6CmlFfB/wTTvbQL4s39BZ10iXboKFZmBrRMfHO0MxVnKsvouBsm4RmR/qmvhy2WNnGwIkbmzCKnjeaSiRJMP7rfAn72og8sInnkVbYZJt4lAnvxeStlLjEuyx7+5QNlJQXfeL9om9bqt0CKhC/fIyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613236; c=relaxed/simple;
	bh=tcLavxAVlYo+tHuYvEppo9Oz15fXopm70O8QPBgs204=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aE9VPl3Cey1jq1h8UXBkXCp0xS57Do0dJ9pc2Q6m9Fr6aeixivdfVYHSa11gacL2zuhlgQZbk13QVw/GzDIEzgJVfcpYwuGhYF9UMIca3DJz2biyrcc0NN8rLkWNbrE/wXOs69YkVUpFwPgvlVkpy21uyn/PDrtTiKSfO55PRGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRzXGwyv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRzXGwyv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EE6C4CEED;
	Fri,  4 Jul 2025 07:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751613236;
	bh=tcLavxAVlYo+tHuYvEppo9Oz15fXopm70O8QPBgs204=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=uRzXGwyvAtPft9w1VoMphyV0tQUJKziy2Lsclj0vZNmNF6FkjiaEXgo2wpyVxY1lY
	 h+3SRWIJ8SicrcpUV0nzP33SGpMRKJ0rLItmDpJySyP5s6CnJpulPkYWTu46W93Yd5
	 43WEtB8cdEx+4JVvtK1AqyWGHeE+qia0KGz44FMuX2/cILf618AENNfEv9EkV6fyyp
	 4/ZKNinqWvrDfGDkIxfNEFzFyB7V4YbmZ6wLXpdF3uRhU1hsAMP0YZD9OJNOJPPVop
	 In4OhGqXX/KvUYdRHpQTNGhtoC4LS6yUO9J1Hn1jXG3FFYQrj5a4L51veikLglh7ce
	 XC4Vp1zbFOhgw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,  aliceryhl@google.com,
  alex.gaynor@gmail.com,  ojeda@kernel.org,  boqun.feng@gmail.com,
  anna-maria@linutronix.de,  bjorn3_gh@protonmail.com,  dakr@kernel.org,
  frederic@kernel.org,  gary@garyguo.net,  jstultz@google.com,
  linux-kernel@vger.kernel.org,  lossin@kernel.org,  lyude@redhat.com,
  rust-for-linux@vger.kernel.org,  sboyd@kernel.org,  tglx@linutronix.de,
  tmgross@umich.edu
Subject: Re: [PATCH v1] rust: time: make ClockSource unsafe trait
In-Reply-To: <CANiq72m886R2ZOLSSzehU8aTXzYtPmTyyrSxpOQCr7GX_Bcghg@mail.gmail.com>
 (Miguel
	Ojeda's message of "Fri, 4 Jul 2025 08:42:07 +0200")
References: <20250701.083940.2222161064880631447.fujita.tomonori@gmail.com>
	<87sejfuf3n.fsf@kernel.org>
	<CAH5fLgjdpso4waCrP6iVaMEOpYLUmqCz8PxqXuSbQBMaxxCHBw@mail.gmail.com>
	<20250704.090751.571327900479764851.fujita.tomonori@gmail.com>
	<CANiq72m886R2ZOLSSzehU8aTXzYtPmTyyrSxpOQCr7GX_Bcghg@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 04 Jul 2025 09:13:45 +0200
Message-ID: <87ms9ktoly.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Fri, Jul 4, 2025 at 2:08=E2=80=AFAM FUJITA Tomonori
> <fujita.tomonori@gmail.com> wrote:
>>
>> I had a quick look at the official Rust documentation, and I think I
>> agree with this opinion.
>
> My personal take: I agree that having both English and something else
> is a bit redundant -- some redundancy is good when something (like a
> notation) may be non-obvious, but I think a math integer interval or a
> Rust range or a condition like 0 <=3D v <=3D `KTIME_MAX` are all
> understandable in this context.
>
> Now, whether to use English or any of the other options, it is hard to
> say what is best for most readers. Personally, I prefer to just see
> one of the expressions, which makes it also closer to other forms,
> e.g. a debug assert somewhere, or a contract, or other tooling or
> formalization efforts.

I would prefer `0..=3DKTIME_MAX` or `0 <=3D v <=3D KTIME_MAX`. English prose
is also OK and I won't object to that, but I prefer the others.


Best regards,
Andreas Hindborg


