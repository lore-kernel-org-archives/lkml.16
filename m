Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7C3292B5F;
	Tue, 17 Jun 2025 10:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156744; cv=none; b=h+08OU+oyfAXm8bNoCOmTufL9e4KYH/9IHr5db+1QJzYfNuQF+tcAFHYfFX9SAUdck/epRs7310+FyZ0vCXwZ3wtuCUbJmoWfXLnqERcShZBtOzjIUwvX6XuelB72lZGw1FPfNHa5c652AihqDglSm1KGuIh59SGQhNnWzZFuY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156744; c=relaxed/simple;
	bh=RsH4Sym15dcXnNebVqP1yRIHkdWmwF51AUuOOr9xu4g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fZtVjGEDEW6psAJoz0FVrW0ENloS3fXRsr2vB/F3bD097D1fTjORSCWYI9idOtsZe8Cq4G0++I+n1RTabozNHe7cKOyUpgCjQMZwcfmrq3IcI+4o00CkgmJ/Q2VCMCyzu4Y0qysfQjVjgVXzH9GheKyr89EEQaQ29ACo1YnGWbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQxBUAiN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQxBUAiN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25AAEC4CEED;
	Tue, 17 Jun 2025 10:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750156743;
	bh=RsH4Sym15dcXnNebVqP1yRIHkdWmwF51AUuOOr9xu4g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iQxBUAiNieTRCSnjpC9Z4n/rXUAjQxxz6cQjwH/bRPH1QKj1SOh6uLEztHf5vqMGc
	 NBLrM1/66cbdJ4S9adQVm29SHciTMDl11JucAOg+1urBfhaJPk+XqQqvnQJ5BjHrB1
	 01L/+8LglSWgP1Nf/f+ZuG4s1ddNTgzKTYKwyreyhFy4Quyz+uEHonNyrrevtAvWVI
	 zsVhChUxHCrfpI0RzrzA7LaywwllgBEjbotPXmx2jkgJ+5DRaSY7VBBbdgJW+ZZSMx
	 EdKhrDqBBII64wR8nzD1So4CShs65luFjs1FmWfndS9nABG2dnPmuKq59pVEoza/Ej
	 mq8h3qCDSOQgg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: alex.gaynor@gmail.com, ojeda@kernel.org, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, anna-maria@linutronix.de, 
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
 linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
 rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
 tmgross@umich.edu
In-Reply-To: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
Message-Id: <175015666837.277659.5038961663728008472.b4-ty@kernel.org>
Date: Tue, 17 Jun 2025 12:37:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 10 Jun 2025 22:28:18 +0900, FUJITA Tomonori wrote:
> Convert hrtimer to use `Instant` and `Delta`; remove the use of
> `Ktime` from the hrtimer code, which was originally introduced as a
> temporary workaround.
> 
> hrtimer uses either an `Instant` or a `Delta` as its expiration value,
> depending on the mode specified at creation time. This patchset
> replaces `HrTimerMode` enum with a trait-based abstraction and
> associates each mode with either an `Instant` or a `Delta`. By
> leveraging Rust's type system, this change enables `HrTimer` to be
> statically associated with a specific `HrTimerMode`, the corresponding
> `Instant` or `Delta`, and a `ClockSource`.
> 
> [...]

Applied, thanks!

[1/5] rust: time: Rename Delta's methods from as_* to into_*
      commit: 2ed94606a0fea693e250e5b8fda11ff8fc240d37
[2/5] rust: time: Replace HrTimerMode enum with trait-based mode types
      commit: 1d1102d098879b5c8fcd9babeadd2930b0a19259
[3/5] rust: time: Add HrTimerExpires trait
      commit: f7fe342fc72915f5eb2280d6ea38bc75d480bed0
[4/5] rust: time: Make HasHrTimer generic over HrTimerMode
      commit: ab57261bb9dea0e552a5cf8440e0688e6967163d
[5/5] rust: time: Remove Ktime in hrtimer
      commit: 994393295c89711531583f6de8f296a30b0d944a

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


