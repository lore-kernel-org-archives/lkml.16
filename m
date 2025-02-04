Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280D92063DB
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 20:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738699555; cv=none; b=HHYg4IE6GO9Nv7A+VlfFk4BBgsmOtXvuqIFRSJHjRrkHJXQBEntOF9iqzG5RSDgFV1zkxX3Cn0BBBZZbENLXurZZ0+uJJflq7klI/eskEJR+f2z6qhJ+btoMKLq1DdzE2QDhP6jmYOc+dsKM/fMnoZJG4yF8O6HjS/Moc3VKN2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738699555; c=relaxed/simple;
	bh=9fZkcDDwevQQmaDKNtrtcxMATnvflU/CtBXDvwOi2rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGPVxkvzBzJ956OM6J11AzY4jLGaISM/AgL252lliTLbEICZNCFf43jyduOXU2bLB0KhRjkMgRpS31oxKjRT59kRF5AelJ7oEsG+do7G/U02/deztTVYyXj1hSxGgMSAfmHVa70vZ77lNNQtIaHPZa6So6UhhF7lBDZSOiRlr/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtYyiKdV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PtYyiKdV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D6EC4CEDF;
	Tue,  4 Feb 2025 20:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738699554;
	bh=9fZkcDDwevQQmaDKNtrtcxMATnvflU/CtBXDvwOi2rw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PtYyiKdVoSH6SX+5ztqA8WNcC0J7Gd2rQzIcilSJQtjoA8Jrk4lu4xZQsJJVilWWB
	 erlERTSeydRV3HLqVML2Yo0WValXY0bQbdGEEIReRtH+bd0E6UZJRbsoTgcwCoCLoV
	 gcVYUtM1gDYIbLKPkoz3tg/xsk6/BKFuGNvkHpC2tZ0067auwpxM52EbMBcGfHUBI6
	 gPfPPsDUUNunkk6+ar49cBd6t+ZkRUHigiQkH+7XKaCvd0hEMrv6tmkTp6qY+Vlv5B
	 vRYMuQZfB0oWPWRQgszFwp3nTj4mN8GHcRGKd+HYkJFWyZfbASn1HJyxpC9i3Rm/Rp
	 a+nESaEUoLczQ==
Date: Tue, 4 Feb 2025 12:05:51 -0800
From: Kees Cook <kees@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Yabin Cui <yabinc@google.com>,
	Will Deacon <will@kernel.org>, Han Shen <shenhan@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Propeller: Remove the architecture specific config
Message-ID: <202502041205.AC52C57C0C@keescook>
References: <20241211222945.1325793-1-xur@google.com>
 <20241211222945.1325793-2-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211222945.1325793-2-xur@google.com>

On Wed, Dec 11, 2024 at 02:29:43PM -0800, Rong Xu wrote:
> The CONFIG_PROPELLER_CLANG option currently depends on
> ARCH_SUPPORTS_PROPELLER_CLANG, but this dependency seems unnecessary.
> 
> Remove ARCH_SUPPORTS_PROPELLER_CLANG and allow users to control
> Propeller builds solely through CONFIG_PROPELLER_CLANG. This simplifies
> the kconfig and avoids potential confusion.
> 
> Signed-off-by: Rong Xu <xur@google.com>

With Nathan's question answered, this looks good to me:

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
