Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF962571DF;
	Mon, 12 May 2025 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046660; cv=none; b=FDkr/c2+l8CgCZsALZM9fyLVMhBo8tAapw5l4yW8yBL4JI9X0bp5DCk1V2v6IZ+SQEKoJeU9TzNgJLUXj26Aw+4HIUx8PWk8/RlppvdkZk11xUIo1qz0SArzGX+A21MreEcyxJBa6C5I0GZ6pfy1Ve5js3nbMUAdBjTzDzBCThw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046660; c=relaxed/simple;
	bh=xpA2W98QKz/yXqwDYFUSH3uYiK9VbI4MNRHLwNI5HJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oG1f0Kpj6Y8aRtv7zDG3nyJw+TVRM4qZD2sJ8IgTPIId/sesHynPrmYxMZyJCUlec/Vao4U4niLo51cyKiUo/Vf90cEwqVFC+SjGSC0kvvjsmqIMbmvAp7Ok2MrnILU3MLZ+ahee/R8VxfmVFPHOPm1XAHX8seBJKxWS452m+1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixckrZv5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixckrZv5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE55C4CEE7;
	Mon, 12 May 2025 10:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046660;
	bh=xpA2W98QKz/yXqwDYFUSH3uYiK9VbI4MNRHLwNI5HJU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ixckrZv5M/tUrYxIViG3YYh8oHhCJzgWCqvV9o9uv65ELj62MrsDo5vswCTioSK4d
	 /x/ZAhxmz2bSnPiKKDiQsV8k99HfGfpH3s+NB9tnVLcRJmI63ZL5eUHKJc1Qu4VL00
	 F3Kb3+LJ6WhvyvRe0LaV4AHTkp1da5/wtoSqoeaxrT/tSM0FpRvIYaVtgloPCGYOkW
	 V8AMDQEgPZt4FNR2+8kjBwsp+LMUnA3fY7QTay4a8MoPOQAq7CQHsrNMQg/yveBvi6
	 h+HXbNnQ/bF+I/e/CGcBSLrYTqbdI2tCzPROvHllb6HWp/F8HxKjfOx+7XJR5f2Lmm
	 wSkcUgbPjd7qQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Fiona Behrens <me@kloenk.dev>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Breno Leitao <leitao@debian.org>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250508-configfs-v8-0-8ebde6180edc@kernel.org>
References: <20250508-configfs-v8-0-8ebde6180edc@kernel.org>
Subject: Re: [PATCH v8 0/3] rust: configfs abstractions
Message-Id: <174704662683.2171454.9300396804399742742.b4-ty@kernel.org>
Date: Mon, 12 May 2025 12:43:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 08 May 2025 10:52:08 +0200, Andreas Hindborg wrote:
> Add a safe Rust API that allows Rust modules to interface the `configfs`
> machinery.
> 
> Add an example for the samples folder to demonstrate usage of the API.
> 
> Add a maintainer entry for the Rust configfs abstractions in the last patch, to
> make it absolutely clear that I will commit to maintain these abstractions, if
> required.
> 
> [...]

Applied, thanks!

[1/3] rust: configfs: introduce rust support for configfs
      commit: 446cafc295bfc0e89da94a482fe8290bd8b429fb
[2/3] rust: configfs: add a sample demonstrating configfs usage
      commit: 1bfb105051566ec5cc7c4f693362420b37a68781
[3/3] MAINTAINERS: add configfs Rust abstractions
      commit: c6b1908224593db76f77b904894cd51933559ae9

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


