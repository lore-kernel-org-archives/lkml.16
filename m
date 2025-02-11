Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F1D253328;
	Tue, 11 Feb 2025 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739288567; cv=none; b=Uzo1g4a+Nz6p6odc4YLLvxcuiYpxJyl+twkTkN/xVVlgzrAyJQ1yPGt8l89V6W10W2AgZnxTPQY8M8zeobp80VzDrrvx0RTS0bMeKyo30oqgdy99KQnzZKIRQQPqyKRWEs++RwjbwOe4WUo8w/ghkVL2Ci1mKqoTBp4fntdCkdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739288567; c=relaxed/simple;
	bh=EKygjR6jy2VKy3BaVqpi3MnTL07JCgyNxMFMlmAnETo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MFbE8Xfm+i7fYJo38XkNiUySQk0iaMGuS/W+OtAYCEZLuw6HLkU6edslSbnio8K9SFtHIzCRq4BOFUnBQu9W+Ia/mq4h4FfnyihjQ/TfyRcTMlTdIq3z88kgwKF+T3tE05/+SQ+jEMvcZqWArjKAZjLononVtooCW4sNktQD7I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6a5jyMR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6a5jyMR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E49C4CEDD;
	Tue, 11 Feb 2025 15:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739288566;
	bh=EKygjR6jy2VKy3BaVqpi3MnTL07JCgyNxMFMlmAnETo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=u6a5jyMRVl8jqaXnE8UuWqU9bSX6uGte98LQxys4lzz7JAqaX0gBDnYKa4d2Vduoj
	 jmhGTThs0SzyPbKiOpZHM2+qRMUrXLZ1gPio4nJDcZHRlx0bb/t33SZ4aMjULNeGvg
	 tjK+KCrp5t+nIEVaR0Mr6x6cYqBWjS1kM9bKLmxs9wFlAzrk7zMm5Nqru2e7lU1vy4
	 jn+Eomblmxa58sFK5dEfS6IiEAsUXeR5oeAInDnIHVv4xM1dWT0c7V9sQgl/XTCxdM
	 L2EI0oGAJs+9mVLV5wsHF8x51Y1zZSANBmCXml74h/av7/bjmRcHxqs27aVQXtbanX
	 qcSSv4/FgkpUg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: <jens.korinth@tuta.io>
Cc: "Jens Korinth via B4 Relay" <devnull+jens.korinth.tuta.io@kernel.org>,
  "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Rust For Linux"
 <rust-for-linux@vger.kernel.org>,  "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>,  "Dirk Behme" <dirk.behme@gmail.com>,  "Linux
 Kernel" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/3] rust: Add pr_*_once macros
In-Reply-To: <OIpcOXB--F-9@tuta.io> (jens korinth's message of "Tue, 11 Feb
	2025 16:29:56 +0100")
References: <20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io>
	<87zfish69f.fsf@kernel.org>
	<XyUDgEm-do6Hd7zeR0J2gte301dYC_LTbQqJ85HUnf0DKGZoH4V9G9dgvmEw4fEadnu8CAZ4j4XWqLdn2YzkAw==@protonmail.internalid>
	<OIpcOXB--F-9@tuta.io>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 11 Feb 2025 16:42:25 +0100
Message-ID: <87o6z8h4im.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<jens.korinth@tuta.io> writes:

> Hi!
>
>>=C2=A0Thanks for the patch! Do you plan on sending a new version?=C2=A0If=
 not, do you mind if I send v5?
>
> I think there is currently no consensus on how exactly it should be done =
(or at least I was confused about that). If you=E2=80=99re actively using t=
he patch please go ahead! Active usage is always the best argument in such =
cases.

I was informed this patch set is the correct way to emit a warning in
the module_params patch set [1].

I did not follow all the discussion so I am not sure either. But I'll
look into the discussion then.


Best regards,
Andreas Hindborg



[1] https://lore.kernel.org/rust-for-linux/20250204-module-params-v3-v5-0-b=
f5ec2041625@kernel.org/


