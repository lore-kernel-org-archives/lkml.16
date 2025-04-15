Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEBC29B774
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729044; cv=none; b=laFKoHFAmFlOKOXQawroeJnXj62WOXLiEpiq7LF0aP0hQ+BTa81kesxOwNE9E6OM4LoauEBIBKr8wyp7YJtgrvwj++xY0tpCT5/lxY8p7MCNrRYdVq87VIGk1azegu0AmeZtZLQKElLWeDmAyuSUb+WHSDnJ6jPYo+4ygLs0I1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729044; c=relaxed/simple;
	bh=uyga5I7+Sw4vYqQ2KhVemn7TT7I9NCq1Xz9LBa95vbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWMm0+VOQ1/I6iI8wm3hngfzHCShZtESmAi6jO3NqVYHwE3BGEyv6Q8I+XU1byrFo9bVV/pv1gATmualjBy6/7j3C0ZhkGoFJwfoOJIUJtsuOS0e9W2eIJN5VbSHE0Auotp6WdEvMzPieLuRQ69KtLIeQFhgDpZhYIgZ1tmcFQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=buuco4Xe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="buuco4Xe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2026C4CEEB;
	Tue, 15 Apr 2025 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744729044;
	bh=uyga5I7+Sw4vYqQ2KhVemn7TT7I9NCq1Xz9LBa95vbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=buuco4XeWne5gyIp7yjGFo03yAph7jeabDNTfM5hzIIPEuzkegtAlNmhZEl4gomb3
	 do0JlGC3e0BwPY+F0J09t36ZoezOH1ryuyMr1hBJd5SuNru2SivfOPU6vzYF0MZrdp
	 vbYgjTjGAQhEyydkEeaQ/VLr8EIC5DRx91Jhpz/Wa5kfql3JWkqCI5qnl5Y44c4zcC
	 hweCUSs9+eHA7BlF5pOXHbKyXnBkqNoITRrdmYntvq8j7brSNTBCtbJUFtVSeToLS2
	 P3voYXaW1wMmKO/Tjd1GI9qvOaHGC7B7MG/Lmjz0+ul5xE6ldaxQLIzRm9PWqUJfUz
	 JG54Wet8GxD+A==
Date: Tue, 15 Apr 2025 04:57:22 -1000
From: Tejun Heo <tj@kernel.org>
To: yangsonghua <jluyangsonghua@gmail.com>
Cc: void@manifault.com, arighi@nvidia.com, changwoo@igalia.com,
	linux-kernel@vger.kernel.org, sched-ext@meta.com,
	yangsonghua <yangsonghua@lixiang.com>
Subject: Re: [PATCH v2] tools/sched_ext: Improve cross-compilation support in
 Makefile
Message-ID: <Z_5z0phM6h73EGci@slm.duckdns.org>
References: <20250415054642.3878839-1-yangsonghua@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415054642.3878839-1-yangsonghua@lixiang.com>

On Tue, Apr 15, 2025 at 01:46:42PM +0800, yangsonghua wrote:
> Modify the tools/sched_ext/Makefile to better handle cross-compilation
> environments by:
> 
> 1. Adjusted `HOST_OUTPUT_DIR` to be relative to `$(OBJ_DIR)`, ensuring
>    correct path handling during host tool building when cross-compile
>    (HOST_OUTPUT_DIR now points to $(OBJ_DIR)/host-tools)
> 2. Properly propagate CROSS_COMPILE to libbpf sub-make invocation
> 3. Add missing $(HOST_BPFOBJ) build rule with proper host toolchain flags
>    (ARCH=, CROSS_COMPILE=, explicit HOSTCC/HOSTLD)
> 4. Consistently quote $(HOSTCC) in bpftool build rule
> 
> The changes ensure proper cross-compilation behavior while maintaining
> backward compatibility with native builds. Host tools are now correctly
> built with the host toolchain while target binaries use the cross-toolchain.
> 
> Signed-off-by: yangsonghua <yangsonghua@lixiang.com>

I already applied v1, so please send the updates as incremental changes
atop.

Thanks.

-- 
tejun
