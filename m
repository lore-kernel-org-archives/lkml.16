Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336642698AE;
	Tue,  8 Apr 2025 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744114586; cv=none; b=O4+zXWERD/lW2bvERIJO7KOsf6NbBIFZXPaGT96oxXWqpeCu+b3DjKDsqnVSK4D5fXKUICkylQje0FyxppDim4AaSqY4DHCjyj/ocuMuQXzlBV09vchWu6+d3my5batXpNdub7FNcnk3ITW20y+f0XBJFGFRRwr+ztTlLMlXjlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744114586; c=relaxed/simple;
	bh=cLUSL5AJWhLelR2XbxYl78eWYr9/ATjlBDFozsI2SuE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H6d/ulaHT2qHAs8nrsyIc/8o9Mh2bA1vqCTFHsryV84KAP09kqSuwO85Ni/3/ixk3u3yGf9HiG5n5+h9HrkWKKaWs0pWF6qqajwQNQ3UOX0UepNhz4l2m2axCK2tK7i4OAYFC261VHEiDhXm71YZ2V/D6m/We7nvPkvZYEcLGmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKDbYjre; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKDbYjre"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECB7C4CEE7;
	Tue,  8 Apr 2025 12:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744114586;
	bh=cLUSL5AJWhLelR2XbxYl78eWYr9/ATjlBDFozsI2SuE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OKDbYjrekvQXzbFcIc/ZoxlziiuxS2TvqqWdu2SPcErM1ZJ6FsNMI/Hm3QAAieQ16
	 RIQAn7kWZArEhwCc8Ft1jgQb6aINknJ3CeHCg3wuksMNFDUEu8dEPBmDC2ZKrLcSzm
	 PfWDDLYqvHBA5UBGIDrOUbzCGuNR/Y3YnapbEWbh9hpNAzMlWxp/YYuW8walZz1Xzv
	 q/LxlxG4dmNSxzwuWXYDmgIyahC5c5re7j9mn946/m5cPOU6XkXAR3hP/HHVm5wPP8
	 jIxuwTnkow8W/lH9GqzuV5G/dycWAJdRb9su97nx76Fw9wgOnf6x6QFGkTOpOnnmLs
	 sW0/T1CNDsfLw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>
Subject: Re: [PATCH 0/6] rust/hrtimer: Various hrtimer + time additions
In-Reply-To: <20250402214109.653341-1-lyude@redhat.com> (Lyude Paul's message
	of "Wed, 02 Apr 2025 17:40:28 -0400")
References: <f6qilrOyPKqI41LxEG6tS9lHm1gKZ1uxYBqonJEDGUzfNeg7JTLx0ygMtZCymEQv07RW8nGgFqhspMslAh8hAg==@protonmail.internalid>
	<20250402214109.653341-1-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 08 Apr 2025 13:51:44 +0200
Message-ID: <87plhmj2gf.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> This is a collection of various bindings that I added to hrtimer when I
> was originally getting it ready to be used in rvkms. I've mostly been
> waiting for Andreas's hrtimer series to go upstream before submitting
> these.
>
> All of these are currently being used within rvkms for vblank emulation.
>

Please note that we are going to get rid of `Ktime` in favor of
`Instant` and `Duration` [1]. I know you brewed these patches long
before the instant/duration patches, but I think it would make sense to
merge instant/duration first and then this series.

Can you rebase on top of the instant/duration patches?


Best regards,
Andreas Hindborg



[1] https://lore.kernel.org/all/20250406013445.124688-1-fujita.tomonori@gmail.com

