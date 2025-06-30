Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B9D28507C;
	Mon, 30 Jun 2025 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751285275; cv=none; b=BMDl59vx+s2uJHvqlbGi+wtAiV0cdCc6NtTdVT0ewmxg9lbtU0amCNt2pcIU1QxrRO4nMoEN3PtwXgQO7GJQUKTd3pj4QA2zxJJYpUZFJXa8oxVP1W4HgHJBN+LfzF/cSHwGF16JsAOVN56gaRKoSVbSwGw7XOE63Ry4aFgMsT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751285275; c=relaxed/simple;
	bh=S4SLPLJ5aUNyII+1n/NO7BN3kALINnqQMc6l4VYDPV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PHwLxf+87TBEvCmRC55q7PJhaHRKWzX5ZfbwBsj8Q7pYUy1ZdEBSJPcKtyXKGEf6lhExs26SoaffnuTyrX3Hrfv9EdjT+JxDlFIqovFnVqhsymsez5ETAzSEy9gsu5NpbXwjU+cz/VelojsnNdLS4Ixu1smYYOk5uPIZJ8ycr0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzAXkgt2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzAXkgt2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF0BC4CEEF;
	Mon, 30 Jun 2025 12:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751285274;
	bh=S4SLPLJ5aUNyII+1n/NO7BN3kALINnqQMc6l4VYDPV4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SzAXkgt2PfnIOv0IO8RTPrcq6R4G2EtvH+wJIXGTAjsC75FDj/L2gPld/diAyvJfV
	 Fd3tkoHVB6aazW1jLnwNQMX+wzAZepbI2L/5PZNzy016Uj3BJ2a5CTpXwGeehxL9OH
	 2bmEDcKyGFSbmZFB41XhBTz+Vqawmu9lY0IzRPVMX268uWPHH6q2SbBGCQU1eXqxPX
	 kg8RZOOI2bzwmpxi8JdjQqF/eH1w0zOJG5rJY/7RwkQXd258iExKboqUorTfdsQfvV
	 iMfbZkjY/rJeblqlZQwHr9zTOikKDH98onR8zKxvTUhb42ULF5eqB0D+T7dls1FE9D
	 sENewE42WmSTQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: alex.gaynor@gmail.com, ojeda@kernel.org, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, anna-maria@linutronix.de, 
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
 frederic@kernel.org, gary@garyguo.net, jstultz@google.com, 
 linux-kernel@vger.kernel.org, lossin@kernel.org, lyude@redhat.com, 
 rust-for-linux@vger.kernel.org, sboyd@kernel.org, tglx@linutronix.de, 
 tmgross@umich.edu, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20250617144155.3903431-3-fujita.tomonori@gmail.com>
References: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
 <20250617144155.3903431-3-fujita.tomonori@gmail.com>
Subject: Re: [PATCH v1 2/2] rust: time: Add wrapper for fsleep() function
Message-Id: <175128525179.98300.14832479480460293241.b4-ty@kernel.org>
Date: Mon, 30 Jun 2025 14:07:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 17 Jun 2025 23:41:55 +0900, FUJITA Tomonori wrote:
> Add a wrapper for fsleep(), flexible sleep functions in
> include/linux/delay.h which typically deals with hardware delays.
> 
> The kernel supports several sleep functions to handle various lengths
> of delay. This adds fsleep(), automatically chooses the best sleep
> method based on a duration.
> 
> [...]

Applied, thanks!

[2/2] rust: time: Add wrapper for fsleep() function
      commit: d4b29ddf82a458935f1bd4909b8a7a13df9d3bdc

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


