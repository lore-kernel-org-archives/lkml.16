Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97344C9F
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 06:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739083476; cv=none; b=FryXa1TN/mascy/7UxlFln5HyBrXrSW4Qb3HZpuBpWIGS+r6P4DR+yr9G3JDS3bHCVTsWdR4FRhlHuWWTLXKj7u+9E49hCnxDPegdn7KB1Ry7T3iMAAc/SuEFlR5lZQ/zUjOiT5PQZVZcNpr0/tqFyqhcNDpdpV4nwGLvHou3Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739083476; c=relaxed/simple;
	bh=pbXg2Rj6/DMfVQB2ivyUiCf+b7fD+8WHH0nrDRjKTu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISAtyQ8GOLCOeJM5Je93fPNNwG/HO5mbVLWX7/g83w0fqiNIfUIGJ0ZP3LDetw8/OMg6vbcDg2gDmlabr4rwWBNnXMQHk5immkHxnBz81cpkzD9qj2UDnfHoaWzPDuBdn6tViXFLR7/mBLej9Imb2QVg7fzCYH1fLVZGrP+f1ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2oBUlc/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2oBUlc/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE62C4CEDD;
	Sun,  9 Feb 2025 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739083475;
	bh=pbXg2Rj6/DMfVQB2ivyUiCf+b7fD+8WHH0nrDRjKTu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2oBUlc/e4o5Ltlx55+yM8OAzi5PubG38DazH1i04pNS9vF7jUM8gJ+LySC3rLFBc
	 LCQe8BZN7McTl3Ib3XCPuxsKCJrk1aXtv16js6g2S1gjDWnZ933zjveG0QEN8wVD8w
	 /VGDHIuvFDvIVFJqewnru1xWcWMA4v86R/xEQAr+i3sHZIkU3SsgxPDaWs1IeQwSd3
	 w++n5xX6Z009PT4KkPVJkrAGgTQbOXwUOk7IwycGMNvpJH8ml18TM0+E1YXNmOJHLq
	 TXJcjx/PWrB1+g5K2NJcpBY/FyEcXTRhw86B2FYMZ4Asrgxj2odfT2KtaBwUmdb2re
	 LuaaaruxiKsNQ==
Date: Sat, 8 Feb 2025 20:44:34 -1000
From: Tejun Heo <tj@kernel.org>
To: Changwoo Min <changwoo@igalia.com>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tools/sched_ext: Compatible testing of
 SCX_ENQ_CPU_SELECTED
Message-ID: <Z6hO0toLJPN9PL-w@slm.duckdns.org>
References: <20250209015353.11172-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209015353.11172-1-changwoo@igalia.com>

On Sun, Feb 09, 2025 at 10:53:53AM +0900, Changwoo Min wrote:
> This provides compatible testing of SCX_ENQ_CPU_SELECTED.
> More specifically, it handles two cases:
> 
>   1. a BPF scheduler is compiled against vmlinux.h where
>   SCX_ENQ_CPU_SELECTED is defined, but it runs on a kernel that does not
>   have SCX_ENQ_CPU_SELECTED. In this case, the test result of
>   'enq_flags & SCX_ENQ_CPU_SELECTED' will always be false. That test result
>   is semantically incorrect because the kernel before SCX_ENQ_CPU_SELECTED
>   has never skipped select_task_rq_scx(), so the result should be true.
> 
>   2. a BPF scheduler is compiling against vmlinux.h where
>   SCX_ENQ_CPU_SELECTED is not defined. In this case, directly using
>   SCX_ENQ_CPU_SELECTED causes compilation errors.
> 
> To hide such complexity, introduce __COMPAT_is_enq_cpu_selected(),
> which checks if SCX_ENQ_CPU_SELECTED exists in runtime using BPF CO-RE.
> This consists of three parts:
> 
>   1. Add enum_defs.autogen.h, which has macros (HAVE_{enum name}) denoting
>   whether SCX enums are defined in the vmlinux.h or not.
> 
>   2. Implement __COMPAT_is_enq_cpu_selected(), which provide the test of
>   SCX_ENQ_CPU_SELECTED in a compatible way.
> 
>   3. Use  __COMPAT_is_enq_cpu_selected() in scx_qmap.
> 
> Note that this is a sync of the relevant PR [1] in the scx repo.
> 
>   [1] https://github.com/sched-ext/scx/pull/1314
> 
> Signed-off-by: Changwoo Min <changwoo@igalia.com>

Applied to sched_ext/for-6.15 with a very minor edit:

> diff --git a/tools/sched_ext/include/scx/enum_defs.autogen.h b/tools/sched_ext/include/scx/enum_defs.autogen.h
> new file mode 100644
> index 000000000000..a32e534a4012
> --- /dev/null
> +++ b/tools/sched_ext/include/scx/enum_defs.autogen.h
...
> +#endif /* __ENUM_DEFS_AUTOGEN_H__ */
> +

The extra newline triggers git warning on commit. I dropped the extra
newline. Maybe adjust the script too? Also, if we aren't including the
script in the kernel tree, maybe a good idea for the generated file to point
to where the script is?

Thanks.

-- 
tejun
