Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1A12BE7BC;
	Tue, 13 May 2025 19:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165279; cv=none; b=DL828aw8BnPZjuJ+WggwbDcIxEHqEO0NKmXP3JfxibbJjYz5i9VIjFV/ihEZ1fNkEgg2BgGEIrBaWU+L4jRyvNO2KuRzNs7rwp1aV4maamuMfmxYU3aWuxEmYPKcAjXTULOOK/CK78yqoq7ZF2IcWdGuwgAjHdkRmgSVzSvtq3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165279; c=relaxed/simple;
	bh=+pSQYegmEUMgJGjBrWUxL9mPYUVEcN+wZY7WzAg8kJk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KrtQcseoo1eR6PDQEUinSs+VdnTxEfdEwC6HE/nMCVt1x4QsZnTHno6e0fc3iWbmIj9P0TCQvBaJOEgz93Tl1OaW/ZP5hWelZYhm+/wAJyblxcWC3bGQecbOZjpyhDWpVa1VNBCtx2hxUeeLORy44mFM+ZBX2yOETRj5Zcz1SSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuKDhJ2u; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuKDhJ2u"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso42314455e9.0;
        Tue, 13 May 2025 12:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747165275; x=1747770075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgvuCLuNl1tiz13KaAOrnWhuDLoAd0NoLp8DJJN3BJU=;
        b=VuKDhJ2ucYkBDsUFWPrL7ItJz+Bvot10WQVSirMTAQLBO8gP3pu9vCOV6gXK+oSMFu
         a6zrXhxffZiNqnFB1MUg/z5yY/5b4nIa5v3f1rVVrGUr2dpFW+qKmqpMHocRCl3rzXBC
         SInsOcZfTBd4qoEbGWj0YKOfZMo9cZtHjJCGeBcOQPf6+B+1ev0vGgenFTAgDZva5BeY
         QCyUUHfNsbTldPekxNjPwVK30+fyaIYMOY0/KZCzek6avIP2Of816yBLAZMve4iUHuR7
         n9BeEmhejToRHG+/Jkw90CKmiFVzdRDaw2dy1PAYesLt/W6WGaCNx8hooUT1zj7mXMTM
         g+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747165275; x=1747770075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgvuCLuNl1tiz13KaAOrnWhuDLoAd0NoLp8DJJN3BJU=;
        b=qYIeyrTPzfJc2+DzNQC6iAUBI3EMElCfUhx09oFnfc6nPW4T4oX1ZGOksTLvm2hppy
         9la0bYfyF5uWeh6fPuN0kV8S3NiIi6RuF/XTIY+DGqDjWJ1dCge6A7S75a5P5KtTg4Bp
         PF6Snwmj7qRub+i6+mL3e3zudl3inE94CpOYU19UVkU8Yhkc2cZjoUvrzD4wcx+vUFIE
         ovsA4hyk+zQuz/09GYAeodcvE4JqC39DRooP3BHFACed52LSt1hAog5ScRohkkxrCRBJ
         OPNGIe99t6sa0GZiIIlXEHzf711wNx69JeBO6w7bXyQl9tNccaYoR5nimm7JY+Ip5QOa
         UU0w==
X-Forwarded-Encrypted: i=1; AJvYcCWsJB6tcRnYjdhFFr+wuVFrfD9hgltmnp9J9l8oehS3Dfe03xRDcnZ7Bwlw01PsPD88Qcr9Dw+NPv3EKSs=@vger.kernel.org, AJvYcCWxkFXkq5w8t50AdvYlu9u6YaMWtQCAQqiX3h8gKabs1loZUr24Admk71AQHoPu1k5wP9slmz409ccx@vger.kernel.org
X-Gm-Message-State: AOJu0YxONeTVbpcGUD2uPUgIHQWJ+mdmhHvBVVPrGRFVFY8ye6kwsLzT
	qFfpuqu/vmZooFr1lGL/6B0aafZJf+WT/NPC/kxX0zSqMUeZwqqr
X-Gm-Gg: ASbGncumN1CS5yZ2P+Dxlg71gFDlXj2C2P9s8/IsnwsqZMCDYUq+IO5ZKiXux4MSTN9
	sNV3Ce6ucH66M9kRye/ashbPh2kQLG2xi7slw7Hx8RY/CAM4kWrtI+cAa90TO6jB+ptXW3VVQ14
	m26+gVzMh75FEIyGOe3+tFDuYp23WCrhFjAYPzAS4sQQPKczNvdvuieLT0jTQP/rZXUsb1gstIP
	H0yiX3hvm6CXkm0gkj8Uk3+0qo8noSotySOMg81rMjgRDedj0QkK9sVUxHDnGZgoeiRfNF33OT+
	vrzR4tv5ghCjIu4SQvPpYHau5eXl/GfgBPzEUiMkGDO3qURl+HYQ0BcUCWaiTQ56Nn5mI59Z4oU
	M5I4vvnRrM1ps6w==
X-Google-Smtp-Source: AGHT+IEpBPW1Zx74L+ly56vyRO65e3y1nWluvYbh3HoLs2O7xgU4T+cxcvqi4RBPExIKrME2FSkouA==
X-Received: by 2002:a05:600c:a09:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-442f20d65f9mr4406515e9.13.1747165275045;
        Tue, 13 May 2025 12:41:15 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67efd26sm178698935e9.23.2025.05.13.12.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:41:14 -0700 (PDT)
Date: Tue, 13 May 2025 20:41:13 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/9] CodingStyle: institute better inline assembly
 formatting
Message-ID: <20250513204113.1e4a738d@pumpkin>
In-Reply-To: <20250509203430.3448-5-adobriyan@gmail.com>
References: <20250509203430.3448-1-adobriyan@gmail.com>
	<20250509203430.3448-5-adobriyan@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  9 May 2025 23:34:26 +0300
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> ---
>  Documentation/process/coding-style.rst | 40 +++++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index 5c5902a0f897..63c41125e713 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -1159,16 +1159,42 @@ You may need to mark your asm statement as volatile, to prevent GCC from
>  removing it if GCC doesn't notice any side effects.  You don't always need to
>  do so, though, and doing so unnecessarily can limit optimization.
>  
> -When writing a single inline assembly statement containing multiple
> -instructions, put each instruction on a separate line in a separate quoted
> -string, and end each string except the last with ``\n\t`` to properly indent
> -the next instruction in the assembly output:
> +Inline assembly statements are formatted as follows:
>  
>  .. code-block:: c
>  
> -	asm ("magic %reg1, #42\n\t"
> -	     "more_magic %reg2, %reg3"
> -	     : /* outputs */ : /* inputs */ : /* clobbers */);
> +	asm [volatile] (
> +		"insn1 r0, r1, r2\n\t"
> +		"insn2 r0, 1\n\t"
> +		: /* possibly empty output list */
> +		: /* possibly empty input list */
> +		: /* possibly empty clobber list */
> +		[: goto label list]
> +	);
> +
> +All keywords are placed on a single line.

Have you been reading too many Microsoft documents?

	David
