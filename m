Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F321C860C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750107294; cv=none; b=nHX//vXUIeHnBeuhdPpFSBwVEKknGv7kaPxUBwWJQW6RRfKCwrl4xlfuxGl5pAFy+pswybUFBTfo6tXdSxFuxH53MCPckEbGrmag3BfEX4qlpbIg5AZUHSLTaPQn0bavpS0WIgAiizkADhE2d9G4fTK09GaeqmHaWEOc9cVDKJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750107294; c=relaxed/simple;
	bh=X2pSs0C3diN4/CYI1z3qmfpbrRBX4z7sKZPJQQfItaU=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=BFd6YLCsIeSFHpoJEQhzd4UsS6TK1XFzcKZtv2HGuBECQgEg+6q/TdaHlkLcr458b6YdihUNLINXg9LL+Qnh+ODXp5FNjlo6JWbxABKyLZ3qjg3w8NF4BdIh+IvofPI0sBEQMrc8kCx2YntthruVWDYenfHxe+4Znxib2uQrDYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=C/sfawuN; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="C/sfawuN"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5b8d13f73so555735985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1750107291; x=1750712091; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRiTjLRwP8mNs38+mxGVbvKyz+mUaqj8oEBwJ01ezWs=;
        b=C/sfawuNBOl7I0AtgN0u1S0TkyesKp3oqhQRNKgL7S/lz+POYkm8hc44ws4kqqpZx1
         1grXg82XNhVsG8PCnCeyUT5/ye+qDkx5iw6ExgyxzF7o443+xg9UANm3V4AJiHsWd7mc
         0WeTRA2Kahkx5pRgwdC6+Ufl9kAlfKSrOnQRx4xtm+HlvTgl8B1p1BMQSUUpyzW4Ojeb
         Sjj+HikY0AxQTj/d4Jlvr5HJc4Fa1PJPYYDrq70eQ8rQaagNMCb8f6ZsSMgplaLBnJDa
         rTalBAAg4UE4NJXX9BJZ8ZajZkzqTLc2T6IaOVvbE3CMncS64QSeRhFbshYJEe/Y95i0
         seKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750107291; x=1750712091;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dRiTjLRwP8mNs38+mxGVbvKyz+mUaqj8oEBwJ01ezWs=;
        b=GFMr1xTJhS76kC9Xf9EWfPjm80cwrgJY1uu4946FLnBgdfalt6GTj8NBqTE0gH1FwA
         Dn2aAIfX79CIvCZ5+JoJYKK8DftXO6EQwesseA6Z/8nhJUvwqC1YJdJ89C3p5Dc1ewjV
         KiSWrTLjeLwmQ6X1Muxm9ZB0SSZTmkR5OQUWIoqYLzNONwEGFi+VxY3xRR4iC/l0WTcY
         R/qXriP74XmpjTSesfSuq0cdBL+xFsSkeYHTUDhNvl+kQnezqYN2vRhZP9aaSgNfHyIu
         aNSyP+y5uuHdd+b4JDZpRFlLskNg1uRYPxJ5OhnIxs3nFEfyRdWnQVts+XoRFiOxGycG
         l3/g==
X-Forwarded-Encrypted: i=1; AJvYcCXnwFrx1kYMl5LdyCR24KbVaLHeZLa3y/UrUMtX2ibWYHmHDy72t7Qq4ZROZ4sodlEPB73dddX/FILLbcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCEijQElEHTNnMh+7RvfocTCD7bbBzHhW+2skUJvEN9uxrQBOH
	Bt/qXwH3qmHMbRsKai2DT8jtF+WU/ZTpLj9hwQsM92tNUy9ZHLPgEp/S2pbQ58gxIw==
X-Gm-Gg: ASbGnctunh0WkzXJS1E9lx6XSFkPq5/1cUe+tnxH1JTyg12TH6kfBlbivvXLzEQbScc
	kzONRPv//TKNVAfpdFyz4pKtojMnG7zFYT1p0J9FK1CLNAxWbSQv8lTQYkQRJwIeTdGxv13bme/
	WPKlvMKkfz+XifDAkzaQaFqH5qO0sjd9/+Egps1Q1z7Vw/5C3DuuLfuXLJ6AEheUkzLjWxIbhDX
	N8bMzfMBcRnOWqBo82SC/UjfdTFBpoQjr0nYj2ccwxTxVi6fUDKt9L4kn0Y6h78clRtEa4mClWG
	N1201Bq0OWQ8z5F6Wy1zXD4+r8y1pLliiB+vbNVnSBj0vL7euJkvvJXBDv91CVU18EWnXOhiCFI
	yqiTr8C76vzNspgux1yKE6TvL3e4+VLJhyWOiOu3jew==
X-Google-Smtp-Source: AGHT+IHy8NfV/ifN7iD3vcgxXUiPWI4gYwnzg71q0uhFQn8iB4iMvSADwxPFz9kofNSVBcfX1gHoLw==
X-Received: by 2002:a05:620a:4883:b0:7d2:139b:a994 with SMTP id af79cd13be357-7d3c6ce1169mr1509959185a.34.1750107291067;
        Mon, 16 Jun 2025 13:54:51 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d3b8dc92e8sm572879285a.5.2025.06.16.13.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 13:54:50 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:54:50 -0400
Message-ID: <b6295394c101221e5a4aacd0abf021ce@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250616_1212/pstg-lib:20250616_1001/pstg-pwork:20250616_1212
From: Paul Moore <paul@paul-moore.com>
To: Casey Schaufler <casey@schaufler-ca.com>, casey@schaufler-ca.com, eparis@redhat.com, linux-security-module@vger.kernel.org, audit@vger.kernel.org
Cc: jmorris@namei.org, serge@hallyn.com, keescook@chromium.org, john.johansen@canonical.com, penguin-kernel@i-love.sakura.ne.jp, stephen.smalley.work@gmail.com, linux-kernel@vger.kernel.org, selinux@vger.kernel.org
Subject: Re: [PATCH v4 2/4] LSM: security_lsmblob_to_secctx module selection
References: <20250607005134.10488-3-casey@schaufler-ca.com>
In-Reply-To: <20250607005134.10488-3-casey@schaufler-ca.com>

On Jun  6, 2025 Casey Schaufler <casey@schaufler-ca.com> wrote:
> 
> Add a parameter lsmid to security_lsmblob_to_secctx() to identify which
> of the security modules that may be active should provide the security
> context. If the value of lsmid is LSM_ID_UNDEF the first LSM providing
> a hook is used. security_secid_to_secctx() is unchanged, and will
> always report the first LSM providing a hook.
> 
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/security.h     |  6 ++++--
>  kernel/audit.c               |  4 ++--
>  kernel/auditsc.c             |  8 +++++---
>  net/netlabel/netlabel_user.c |  3 ++-
>  security/security.c          | 13 +++++++++++--
>  5 files changed, 24 insertions(+), 10 deletions(-)

...

> diff --git a/security/security.c b/security/security.c
> index 2b9dde02f4de..306860434200 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -3774,6 +3774,7 @@ EXPORT_SYMBOL(security_ismaclabel);
>   * security_secid_to_secctx() - Convert a secid to a secctx
>   * @secid: secid
>   * @cp: the LSM context
> + * @lsmid: which security module to report
>   *
>   * Convert secid to security context.  If @cp is NULL the length of the
>   * result will be returned, but no data will be returned.  This

You're updating the comment block for the wrong function.

> @@ -3800,9 +3801,17 @@ EXPORT_SYMBOL(security_secid_to_secctx);
>   *
>   * Return: Return length of data on success, error on failure.
>   */

Since you need to update the patch to fix the problem above, it would
probably be a good thing to explain the LSM_ID_UNDEF handling in the
function's comment block as you did in the commit description.

> -int security_lsmprop_to_secctx(struct lsm_prop *prop, struct lsm_context *cp)
> +int security_lsmprop_to_secctx(struct lsm_prop *prop, struct lsm_context *cp,
> +			       int lsmid)
>  {
> -	return call_int_hook(lsmprop_to_secctx, prop, cp);
> +	struct lsm_static_call *scall;
> +
> +	lsm_for_each_hook(scall, lsmprop_to_secctx) {
> +		if (lsmid != LSM_ID_UNDEF && lsmid != scall->hl->lsmid->id)
> +			continue;
> +		return scall->hl->hook.lsmprop_to_secctx(prop, cp);
> +	}
> +	return LSM_RET_DEFAULT(lsmprop_to_secctx);
>  }
>  EXPORT_SYMBOL(security_lsmprop_to_secctx);
>  
> -- 
> 2.47.0

--
paul-moore.com
