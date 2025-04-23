Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEE51EDA3F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745367613; cv=none; b=plhYpFSTLrBJpklJVV2NFU8mg0SnQiU/y1H7mCCX+M75LI8UACqyvYwssp9l1rNOc6H9BraqhVbXZ+Sdp2q4wK/ekyyRG7ZLksoIgFfyM/TEaDEmQRSyUPyGT635Kd6CnS3fTlsSqKzxgJ7jbM+erK0PnTRW4oWA96rmtyIPNXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745367613; c=relaxed/simple;
	bh=JiYKYwIlggoXaMGUSuySy12m3WMDMH23uuAhv8VzJ9E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Dm+pbUtJqhaPK8DAxnkWDIonSfOgOLtaCBiJMEuQaVJXOH3LSG5mLN0/wPQkf7h9xEIVq6d5zCas81hZD4QO9U/jz/2IYDimRKjZRxXV2jQAMh+KElXT7AMWk0lBVwszuf/Jvwm56DsyEKeNhoObJZzOy4AmC+o34bgspm/ZUVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wGqd3kU4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wGqd3kU4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72546C4CEEC;
	Wed, 23 Apr 2025 00:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1745367612;
	bh=JiYKYwIlggoXaMGUSuySy12m3WMDMH23uuAhv8VzJ9E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wGqd3kU4TiUNozMylRf7ZRapHRxqFfIXkVFguKnhcTggZUKOihtgqz5wqh69hAvPA
	 D7qD7DX/6iQSzMQrz58Bhx44lxaByL5qpiRAA5sB18+zXK0VBgRD3+IMLLi7YIsI8o
	 bqsmnMAywBXWauX4H5YQHU2w5zVGebPKBs82xrWQ=
Date: Tue, 22 Apr 2025 17:20:11 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Cc: linux-mm@kvack.org, rostedt@goodmis.org, mhiramat@kernel.org,
 andrii@kernel.org, kernel-team@meta.com, linux-kernel@vger.kernel.org,
 Mykyta Yatsenko <yatsenko@meta.com>, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] maccess: fix strncpy_from_user_nofault empty string
 handling
Message-Id: <20250422172011.feb243d2f7478c0e7109b74c@linux-foundation.org>
In-Reply-To: <20250422131449.57177-1-mykyta.yatsenko5@gmail.com>
References: <20250422131449.57177-1-mykyta.yatsenko5@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Apr 2025 14:14:49 +0100 Mykyta Yatsenko <mykyta.yatsenko5@gmail.com> wrote:

> From: Mykyta Yatsenko <yatsenko@meta.com>
> 
> strncpy_from_user_nofault should return the length of the copied string
> including the trailing NUL, but if the argument unsafe_addr points to
> an empty string ({'\0'}), the return value is 0.
> 
> This happens as strncpy_from_user copies terminal symbol into dst
> and returns 0 (as expected), but strncpy_from_user_nofault does not
> modify ret as it is not equal to count and not greater than 0, so 0 is
> returned, which contradicts the contract.
> 
> ...
>

Thanks.

Does this fix any known runtime issue?  If so, please fully describe this?

> --- a/mm/maccess.c
> +++ b/mm/maccess.c
> @@ -196,7 +196,7 @@ long strncpy_from_user_nofault(char *dst, const void __user *unsafe_addr,
>  	if (ret >= count) {
>  		ret = count;
>  		dst[ret - 1] = '\0';
> -	} else if (ret > 0) {
> +	} else if (ret >= 0) {
>  		ret++;
>  	}
>  

