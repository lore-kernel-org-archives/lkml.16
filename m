Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578671DBB2E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743540233; cv=none; b=HjBWZgJ5dc15EmEWQERKT6PsRPzLJV5GbwRqDTqqeTE25fK//OUVXGxs6jWF7D37UMtnpS/cHl3I3Bu+JU/iVgZTeA7OsthIZ52VkOliVaoP9QGAkhBRQo0O4F/6O/3b8G0V/fu8XhxTyqJI2APmEfAN72s87fCiLkiKvmtgTv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743540233; c=relaxed/simple;
	bh=bxyJ0jm80x+23shdlsiqZktOEhqH/Xwg39wGtJJIclg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dy5KzmpjEGiy4FdKFv27EqpedD9sZ1EiIZ+OwOc6YbkbJJrC+8y9gM+6Fb2pHRb92m9dBnCGwPVBFeG4hNhopISLh6KO0P3MkvF7agJ27xeMiOnwiXHGuS2f2YsWw/Zffbt8u7aL2HK2k316Sb3FTMG70zbbjCR2p1eKfhyAIjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBcsO2oX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBcsO2oX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D03C4CEE4;
	Tue,  1 Apr 2025 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743540232;
	bh=bxyJ0jm80x+23shdlsiqZktOEhqH/Xwg39wGtJJIclg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBcsO2oXOhdtq+/FXdC+YtfpA96biVKM8pFYbTrR8uHCiFhPUxKu0QLfJTun1RBrs
	 ZcJvk5f8qt6N1fkuu0xGIgjp0LzmS1fz8/cXHCTDd0YGTVcTJL4jT2lnGpN8ZDpGld
	 nPIi4SymERxa8h5gFur9oeEvNRE59L5pu2sIrvu/7ugnpuVO3kEcfcJwsg87p43Hp/
	 Ei85FdtEFVmWIShE3FTUpRu2pY3M9hgPWTX68ZBKMFylozj5Kxv2vZKWqUDiUuS4Yi
	 PSmar83uwY4ND0jDwj7DtQatb/Ccj98Ezr8XGWK4FBQW4I/u9a1vBIFA8rfIiTaxDi
	 8GuKhmWMAFcyQ==
Date: Tue, 1 Apr 2025 22:43:47 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: mingo@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Uros Bizjak <ubizjak@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86: predict __access_ok() returning true
Message-ID: <Z-xQAyPxQGvlg_hd@gmail.com>
References: <20250401203029.1132135-1-mjguzik@gmail.com>
 <Z-xOFuT9Sl6VuFYi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-xOFuT9Sl6VuFYi@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> It's also the right place to have the hint: that user addresses are 
> valid is the common case we optimize for.
> 
> Thanks,
> 
> 	Ingo
> 
>  arch/x86/include/asm/uaccess_64.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
> index c52f0133425b..4c13883371aa 100644
> --- a/arch/x86/include/asm/uaccess_64.h
> +++ b/arch/x86/include/asm/uaccess_64.h
> @@ -54,7 +54,7 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm,
>  #endif
>  
>  #define valid_user_address(x) \
> -	((__force unsigned long)(x) <= runtime_const_ptr(USER_PTR_MAX))
> +	likely((__force unsigned long)(x) <= runtime_const_ptr(USER_PTR_MAX))

Should we go this way, this is the safe macro variant:

   #define valid_user_address(x) \
	(likely((__force unsigned long)(x) <= runtime_const_ptr(USER_PTR_MAX)))

But this compiler bug sounds weird ...

Thanks,

	Ingo
