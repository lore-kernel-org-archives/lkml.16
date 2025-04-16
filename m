Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D418F21CC68
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790721; cv=none; b=GH5fdwpuinxviips5EQeXHvVc/8VkG7z1xRq8svcSW1SkJFRRtJLjgzG2ejqQRHmWPZa9lf317Mo+i1GZnud365Tfwt2dbrWQ/DgPwaeS9Lu3c1IACWp9SNFbHzrQqKyCHtOAP+NaADoNFd6DG+7NW2AiJ4Hjc6CyPKFt4b16aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790721; c=relaxed/simple;
	bh=cXksQGNjIMHHG4YDW19IW0xZ/lgV5FlGNZcHYsaMLk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ltp7SqDZr0hQRCiHERwaVxLt/ydZuR+dVNIFfj3U36G62RJh3VuLGWiOzNuJkEv4nCD0IJtIxHSNo6CTaxSHb+GXYv21RvbMXAf4LqWgE2MkzAKZq419nV8iJZjwnlrzMYIruBATfu/sQx3Sgb3y4+/hGyogOWwfrskDA/6fZ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKdswsPI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKdswsPI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C07FC4CEE2;
	Wed, 16 Apr 2025 08:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744790721;
	bh=cXksQGNjIMHHG4YDW19IW0xZ/lgV5FlGNZcHYsaMLk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKdswsPIt0DqUK2DTWurtOUHLmvLCXuB6H6ck03UQAjn6+D8f6gRkkfdDVWZSdZXk
	 afoOXKmsiWOQVckTKbgfgiQeasHtqX5Qm9Jiiy47FKLXrm888yMpryYJYsCopHqG6L
	 sySgR8psWd3PcTp9Uanqn+zlUrV1Hxo2lPSU349myOP10nD9pfzotgM+YzOZbeii6D
	 c7HQH+pNdiK9OTLRo/3nl3pw2GbLsY5CbdEzTz/cfIPxalTZXetNiv0IiYDeBrT877
	 NxM2wR8RiqAi03gm2xcBtnKckPkIYKzsCmGlXHo1TdkKaSBIiRMpo+0TE3Xm/aAk+a
	 7yzI+U3uKsAcA==
Date: Wed, 16 Apr 2025 10:05:17 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org, x86@kernel.org,
	tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com
Subject: Re: [PATCH 07/10] x86/fpu: Refactor xfeature bitmask update code for
 sigframe XSAVE
Message-ID: <Z_9kvTUIqOo7htBl@gmail.com>
References: <Z_onl1QbH9L1-8dq@gmail.com>
 <20250416021720.12305-1-chang.seok.bae@intel.com>
 <20250416021720.12305-8-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416021720.12305-8-chang.seok.bae@intel.com>


* Chang S. Bae <chang.seok.bae@intel.com> wrote:

> +static inline int set_xfeature_in_sigframe(struct xregs_state __user *xbuf, u64 mask)
> +{
> +	u64 xfeatures;
> +	int err;
> +
> +	/* Read the xfeatures value already saved in the user buffer */
> +	err  = __get_user(xfeatures, &xbuf->header.xfeatures);
> +	xfeatures |= mask;
> +	err |= __put_user(xfeatures, &xbuf->header.xfeatures);
> +	return err;
> +}

For future reference, please put an extra newline before 'return' 
statements, so that the code looks more 'balanced':

> +{
> +	u64 xfeatures;
> +	int err;
> +
> +	/* Read the xfeatures value already saved in the user buffer */
> +	err  = __get_user(xfeatures, &xbuf->header.xfeatures);
> +	xfeatures |= mask;
> +	err |= __put_user(xfeatures, &xbuf->header.xfeatures);
> +
> +	return err;
> +}

I've done that for this patch, so no need to resend it.

Thanks,

	Ingo
