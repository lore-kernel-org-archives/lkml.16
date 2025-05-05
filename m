Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F5FEAC6;
	Mon,  5 May 2025 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441989; cv=none; b=M0iScjvPftl41tU7PxxCUJGUwI7bvWkxUvO6ILoPZVYUCCWPXvdwy+kEGW4qt2wUufddja4wYDFD0OEbGgWfZaqndapo0IuloYsegpPXnFokM9sKvQikvmvL9Ib9a6XU5eWBzx9/NARov7bF4dHVB7cUM26iBwSJLpP1XfJWYic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441989; c=relaxed/simple;
	bh=lsQkno84P43PZsgutAUcrmLB0VMjgFprSkr3lAzLdAw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rI2hFmnu2F4xLQNPou+AXuVqCsK/hB55JOKuKBrvbjN06SH4NSpBdCOew7QicEj3MfnkwnpVNHZPEyuzxCFrIQu+n/s6eITgjOHCruQXdVD9alpzP6qzEhZqs4giUwIL5vsHxvqiI5Dxo6KbBJpk85wj9zopxwoXqUdCVur325s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQ1Yy1lE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQ1Yy1lE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E99C4CEE4;
	Mon,  5 May 2025 10:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746441988;
	bh=lsQkno84P43PZsgutAUcrmLB0VMjgFprSkr3lAzLdAw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QQ1Yy1lEaC7RKpoKfxl258v7VFl++nlMDlEDu1l9Z6FHPUbVMV79LzShzDiJat6he
	 FmVg1Yk9GcPs92j9BGkz9gn2xtSgLW9kRyboPsappotIwIiWYN7mu5GytkljbzShjD
	 zTZsRg8jv1MGBDFHheK2bDFBpCv91oyNw1fJKPjYmvHzhT64vqsG6760qRRrGW6F2b
	 P19uosBnZk4Ic06pwkCJGBVlbdv7v0SvaH5b6nakrQjxj7N4qS5FhRcIgUYyY9g4lO
	 2R9aCl0Gv6yPzynoENTU95Tv7JVQVk+jVsZFU8y8V9x8UllSOlsoal+0FKZfft+1dA
	 OmHAcsoca1l9A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,
  a.hindborg@samsung.com,  boqun.feng@gmail.com,  frederic@kernel.org,
  lyude@redhat.com,  tglx@linutronix.de,  anna-maria@linutronix.de,
  jstultz@google.com,  sboyd@kernel.org,  ojeda@kernel.org,
  alex.gaynor@gmail.com,  gary@garyguo.net,  bjorn3_gh@protonmail.com,
  benno.lossin@proton.me,  aliceryhl@google.com,  tmgross@umich.edu,
  chrisi.schrefl@gmail.com,  arnd@arndb.de,  linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
In-Reply-To: <20250501015818.226376-1-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Thu, 1 May 2025 10:58:18 +0900")
References: <20250501015818.226376-1-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 05 May 2025 12:46:15 +0200
Message-ID: <8734djxrm0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <fujita.tomonori@gmail.com> writes:

> Avoid 64-bit integer division that 32-bit architectures don't
> implement generally. This uses ktime_to_ms() and ktime_to_us()
> instead.
>
> The timer abstraction needs i64 / u32 division so C's div_s64() can be
> used but ktime_to_ms() and ktime_to_us() provide a simpler solution
> for this timer abstraction problem. On some architectures, there is
> room to optimize the implementation of them, but such optimization can
> be done if and when it becomes necessary.
>
> One downside of calling the C's functions is that the as_micros/millis
> methods can no longer be const fn. We stick with the simpler approach
> unless there's a compelling need for a const fn.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>


Please consult recent MAINTAINERS file when you send patches. If you
intend for me to see a patch, please use my registered email address.


Best regards,
Andreas Hindborg


