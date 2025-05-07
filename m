Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4B128DF52;
	Wed,  7 May 2025 18:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746642638; cv=none; b=Z4SE5XUQGTJJgKIAPPb5Y3S+79GxkF7Fc5JPZa2wqlmA05T8cVXojWN+Qaeh3LcAlH8kDM+aY+FVAzL1Chqvqv5RiiQ1UU85o6bYM3khNvQ1Nfa8IQ4p+gnqUYRXBzx49AxHm+PXBWUD9MPMQhkRko6V7HM8EpdGXCVuZWKgalg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746642638; c=relaxed/simple;
	bh=7DEbqvUQr9hrMAIuVKdYgDJifbNw9+ZmWEaCgNYycJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=p0RFOCLtDAFw27OrUSEDCMu2XZP3T1jsThUWz76I5eEeHguFRkC6ukYZX5sP35YHN5m3ODKyZIKPfX2ProM+cz4n3tTQDFV44SIcYVsoUi1K1Q+33+kuP+bTBFIfAgUYIwaZQGkp3elZPv7oeIucXLzCzZQmpccH0HW31yNqw7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsA3jZWj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsA3jZWj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11CCAC4CEEE;
	Wed,  7 May 2025 18:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746642637;
	bh=7DEbqvUQr9hrMAIuVKdYgDJifbNw9+ZmWEaCgNYycJQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YsA3jZWjisnFLTb+VYUuPr6r90LtU0WsYcJlpVQawBs3JwIHn/UIrWWeRVgoS4vOB
	 5saDavi31cKLn9tUqHEXY00yjIgq+2PcaaWlfZ1cGQUh+XbmzI+LdgwTt/Zx/Q6+9N
	 E7Ufi/gEgHkq8iZKSpsS0UtjXv6YIMsN8SxquxiCiGBehfSxJaSNrd2YsWkwR3sAHz
	 9AXjEpdBYDklC2n9frFxV/PLv/zLztliztS4hmeBFr3Ref66nEmZXGshvZYPceiu8p
	 p+0p5/XQ7pbp4qRyAgddbyDYNPETNAzgSRSJnQ31Nr210YvdxDOX4yOKADBQhVCzTJ
	 foq7KPVuBWZMw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Trevor Gross" <tmgross@umich.edu>,  "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 0/7] rust/hrtimer: Various hrtimer + time additions
In-Reply-To: <20250429214752.1637859-1-lyude@redhat.com> (Lyude Paul's message
	of "Tue, 29 Apr 2025 17:44:36 -0400")
References: <uDRgFf0z0zgsF9FjOhqYPxDz5GJ4qv3yoszl15s6FR2nJT7hiAPGdf51jBy8BfC3GeEvJ9BxI3cU7Sjd5J-lOA==@protonmail.internalid>
	<20250429214752.1637859-1-lyude@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 07 May 2025 20:29:02 +0200
Message-ID: <871pt0p95d.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Lyude,

"Lyude Paul" <lyude@redhat.com> writes:

> This is a collection of various bindings that I added to hrtimer when I
> was originally getting it ready to be used in rvkms. I've mostly been
> waiting for Andreas's hrtimer series to go upstream before submitting
> these.
>
> All of these are currently being used within rvkms for vblank emulation.
>
> This patch series is based off Fujita's patch series "rust: Add IO
> polling":
>
> https://lore.kernel.org/lkml/20250413104310.162045-1-fujita.tomonori@gmail.com/
>

I'm going to defer this till we get all of the `Instant`/`Duration`
changes in place. I hope that is OK with you.


Best regards,
Andreas Hindborg


