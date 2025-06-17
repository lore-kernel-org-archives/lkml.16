Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E472292B5F;
	Tue, 17 Jun 2025 10:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156753; cv=none; b=SdRIuMVYYfs/DNr6lLZt9eIUoMQTK6lfYYMpnTO0qfG91/p7fuLAOTOPUp7XeerQSrkc2yoZwKe/0XzWYd/mJSgjx9V+loSCqgCyHmN329geOMW1MIkzgXH9ZDBMJu61aVOu56KsieGrHD/xM4IcyQAZetoZNMBUimo/J3YE5R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156753; c=relaxed/simple;
	bh=FleFdjelk7yyBYWQ6JVbeglnWYrWNBj04sqXSabvHGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RIAnU9/stAbyCbNb5jIkX8WbbMaSQIMumXFj6pYurJcNKpmH8E5s57ZdxYP+YRG0rTdL5cGGD05Fx+fQ5Nu2ZkhLNKF+gaVGge50SfHqvgcBVHKDG7QoY5eF9FOhAc4IripidJu9yl3lxl+h2VFHARi3KnzEcEJQfuhk3vf1rIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P+On8oym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P+On8oym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CBEC4CEE3;
	Tue, 17 Jun 2025 10:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750156752;
	bh=FleFdjelk7yyBYWQ6JVbeglnWYrWNBj04sqXSabvHGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=P+On8oymKc8Ykp2KlmVKawF/wf8bS8Fm3/gEh0wRl7RyhbzcQD8XM96laLnSNBt+2
	 q5LVONZkeWPhz6o3Ivz4ycfq1dzisRz2RsIkeo5YkdQSVXxf8w3+keLaONZHLn5bXt
	 OK8lbRz8Zh3BIVAS+bVvbk/cHXG8bXKyVqI1MvkOdBwMjy85vklhF56NWfUWi/ZjNr
	 UoBhV4MCBBP1gBfVnZ0j7a29i2KXJzlkKz8jZBhoiAZEwkRo7S+w894aL78qdS6FEg
	 NdRW0E4VAQ0j7jsTX48/OTfpwl7VPYx3qTXdwnFsD8eBG3IbGoU1EHyQ2hWNe/o08b
	 6ojOm6bT5wXww==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: rust-for-linux@vger.kernel.org, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, 
 linux-kernel@vger.kernel.org, frederic@kernel.org, lyude@redhat.com, 
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com, 
 sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net, 
 bjorn3_gh@protonmail.com, aliceryhl@google.com, tmgross@umich.edu, 
 chrisi.schrefl@gmail.com, linux@armlinux.org.uk, 
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>
In-Reply-To: <20250502004524.230553-1-fujita.tomonori@gmail.com>
References: <20250502004524.230553-1-fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2] rust: time: Avoid 64-bit integer division on 32-bit
 architectures
Message-Id: <175015666839.277659.16490602570734103126.b4-ty@kernel.org>
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


On Fri, 02 May 2025 09:45:24 +0900, FUJITA Tomonori wrote:
> Avoid 64-bit integer division that 32-bit architectures don't
> implement generally. This uses ktime_to_us() and ktime_to_ms()
> instead.
> 
> The time abstraction needs i64 / u32 division so C's div_s64() can be
> used but ktime_to_us() and ktime_to_ms() provide a simpler solution
> for this time abstraction problem on 32-bit architectures.
> 
> [...]

Applied, thanks!

[1/1] rust: time: Avoid 64-bit integer division on 32-bit architectures
      commit: 1b7bbd5975279a1cf8d907fbc719f350031194c2

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


