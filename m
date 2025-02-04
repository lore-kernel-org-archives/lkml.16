Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D88814B094
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 20:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738699478; cv=none; b=sOhsGrl1bf34iCM6IR+oRwP2Xm+ruGAED61ohm0N4vuk9WFbIbo3HxwER9vJmb3Xu+++uiwTT5FBezcdhhLqVQ3STdoLxbpSYWfj/GNjm8meBjh18ReAFBGEU09TzykAohHhOeOdMfyITvEs8fIoE449TeB40oTiXKZ6GRn6JQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738699478; c=relaxed/simple;
	bh=PnCB7pOXejkJlLsGDh1Zb38QDr1q5X761YrVLM01swY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3SVHRW0K+WAnXiA1glMZsgpTSRFIdK5Atj40igUJQ5pIF9zVm+CFrsCAwdG+nDzmaxM4QSmJ0TnO/4Xtjf48JsBBihKYAJiARSsuOCQOqjtWkRVMDhIdLtWhhQPWaSF3/rXA4NAIgwnVYo3aTyvqhHj1bdqIXSHEn61zV1wb2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjZxpeW2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjZxpeW2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D5EC4CEE2;
	Tue,  4 Feb 2025 20:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738699478;
	bh=PnCB7pOXejkJlLsGDh1Zb38QDr1q5X761YrVLM01swY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CjZxpeW2CRnZEw2lqrcQqIe5HMdzT+LHDKh5ql7mOQrFbDoWn93HF5mBtOOGzlc0M
	 H5DOz36RQiePMyYQtXoeniqTDefzswFjlEXMDfyRO2itrSNJrD3c4g0jVVe38EjeJP
	 3otN2URXCSmTCTMBwlOY7WyZfFVC3u7FoTcrIcfad2TZz6BhTHijw0ucJvwZKAcwXQ
	 wrtsvBsy5mCSehmXuX9C3DN5DH+TpuHH1KpYKnIJKJLV47VAye9F93atxS7HSJy8DL
	 KS2kOot5ja8PyU9phRVKzOfoUeSmjYvtT0wa/guum0pO92oClQ6LyJNcw7O3HJ1Dli
	 4OHfigtb1+2JA==
Date: Tue, 4 Feb 2025 12:04:35 -0800
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
Subject: Re: [PATCH 1/2] AutoFDO: Remove the architecture specific config
Message-ID: <202502041204.5244DFA862@keescook>
References: <20241211222945.1325793-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211222945.1325793-1-xur@google.com>

On Wed, Dec 11, 2024 at 02:29:42PM -0800, Rong Xu wrote:
> The CONFIG_AUTOFDO_CLANG option currently depends on
> ARCH_SUPPORTS_AUTOFDO_CLANG, but this dependency seems unnecessary.
> 
> Remove ARCH_SUPPORTS_AUTOFDO_CLANG and allow users to control AutoFDO
> builds solely through CONFIG_AUTOFDO_CLANG. This simplifies the kconfig
> and avoids potential confusion.
> 
> Signed-off-by: Rong Xu <xur@google.com>

Looks right to me!

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
