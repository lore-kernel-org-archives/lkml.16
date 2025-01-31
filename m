Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF5928EC;
	Fri, 31 Jan 2025 03:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738295571; cv=none; b=jsF4LHs/viRLGFHCAuDq22cTxOin+NKrUdPGw9qd5/0bEeYTAC/Cr5iZ7s/5ry2nhqFEhxOfW1GT+szPxbD9jqHJdi0pDKFZe70ZHHT4jciSvpK9lipk2J5ffQA57T5KNkdpgQfVxokyXuWD1DAFUXAAbC0+ZZ3J2QgMZFXYUEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738295571; c=relaxed/simple;
	bh=njGK8iN76Oh6efZ3eYndONqjWO4nZts2aTh5Qwm06q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXbaV9Dr9IVAtUamrPX55JpKbdlfdpLXej/2o8D3PExY6htZo1JvVgwae5sAoy6qJfom4R8cNRQHPihRhNY0AUDzgTmqRb1ZiF30TpMNmlojk4Va/TtJOculywg5oUmHFP2DvY0COBtPDuXflTJ8IGAcomVg+CWPka5nCSJ207M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrcwTeej; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrcwTeej"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2514C4CED1;
	Fri, 31 Jan 2025 03:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738295570;
	bh=njGK8iN76Oh6efZ3eYndONqjWO4nZts2aTh5Qwm06q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VrcwTeejcr447esdjqdHAx+u0A096YrEtae4pPOXUX6v/4HlcjMMuhlgf08XkFwfq
	 /SB6sLEReFfHqWgtzhzqtHGqS+n+h5mJGj3pGaghrIoqBWXxoMZKpHmNuwU/ANs7Fc
	 RY+NplL3jeitTomUjc/cn7n7lQRbJBB6F5/pwZMiKtB8d/G2smmsf5eCOxfnGclwx0
	 oNg2JdNNSjIid5OJnKjujl+ABhvagUCm50SKMgZm2cI1meugqP+47T+STlmoFmMHZk
	 DIYnUFzTqQlm9XMoDa6PmiIzanShM/BG94Anw8xP0ILOapPlplA2Ifmd0+xP6TRNHs
	 +VDRhuJZK0FPw==
Date: Thu, 30 Jan 2025 20:52:45 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
Message-ID: <20250131035245.GA47826@ax162>
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>

On Wed, Jan 22, 2025 at 07:17:26PM -0800, Charlie Jenkins wrote:
> On riscv, kernel modules end up with a significant number of local
> symbols. This becomes apparent when compiling modules with debug symbols
> enabled. Using amdgpu.ko as an example of a large module, on riscv the
> size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
> (--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21MB
> (--strip-debug), and 20MB (--strip-unneeded).
> 
> Use --strip-unneeded instead of --strip-debug to strip modules so
> decrease the size of the resulting modules. This is particularly
> relevant for riscv, but also marginally aids other architectures.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Is there any sort of regression risk with this patch? If so, another
option may be to give another level to INSTALL_MOD_STRIP like 2 so that
INSTALL_MOD_STRIP=1 continues to behave as before but people can easily
opt into this option. No strong opinion because I am not sure but was
not sure if it was considered.

Regardless:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/Makefile.modinst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index f97c9926ed31b2b14601ff7773a2ea48b225628b..c22f35f6b9db3cac3923b9e787b219f752570642 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -80,7 +80,7 @@ quiet_cmd_install = INSTALL $@
>  ifdef INSTALL_MOD_STRIP
>  
>  ifeq ($(INSTALL_MOD_STRIP),1)
> -strip-option := --strip-debug
> +strip-option := --strip-unneeded
>  else
>  strip-option := $(INSTALL_MOD_STRIP)
>  endif
> 
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250122-strip_unneeded-cab729310056
> -- 
> - Charlie
> 
