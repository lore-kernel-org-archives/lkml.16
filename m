Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025E51A08A0
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 21:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738964581; cv=none; b=DPE9DTF5SncVUCDLxr6fzn8QD5jv0U3+38XDSdp/86aklYBI/msXcsU8ROuzq9s7fQANBHDcuoY+4tRPeCrh7zWgTaBFMv96hNBJsGXoB9Kh9pgn+Rj04jfRLFOBBKS8/rPFsbxX8RHAZc7m7h9yP9x968/wKBHYdWOgTrfxpHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738964581; c=relaxed/simple;
	bh=WYNf17jt7Muniz1iCEPbUpabyrjv1SVCpJsiy5bz71M=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=epPjHMi/nm44deE48ucPG1kJkbnAaTK6D3RSV6kOVBGRX3SQuPkIXW3xnbZA/T8Vm2xG64WuUKXB11o8umW75FWkkeNlKKtNP0mf3ve/cTW8OC/ZxKGrG2Gr7PJDbDHBOoySKGQwnyewt2w4Uchz790mLz6d3YixcLSzH5pYmvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=eStP4XSg; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="eStP4XSg"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46c8474d8f6so21057731cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 13:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1738964578; x=1739569378; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OyZWD04EzzeMLP2kqehBEA9qaN1gdA31HUl6m14dlVU=;
        b=eStP4XSgOZDB+nJgRj5RGEx0wHL2SUSx78Qn77CCGv1NHN5hSVLZEH/M5VRkPOFYo0
         hQjA9o7AR2CHu7kh+erpzhKGehyhcOUw0/oqhcBO8FJKs2kKnsNz98416xqobtgztSxR
         PFASo2vz2e4uaU1JiicYd3UUiBSLRT6o2iC1dVPDYpgdjnUjwX/9T9xC7Y4H+ZBG90Do
         y+ORlLsiyLX2315mSJLbNPvr4fe4OD9VrHVDyYYPYHwnfWdjqvfqzZET4Xeqf5l14G01
         ZjAZznMliaWzqR7rLDS/TFYrVIy7Bud1456LFOlCVy/YvG7e09W/lSYoZoI7KWxhNyIZ
         7k2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738964578; x=1739569378;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OyZWD04EzzeMLP2kqehBEA9qaN1gdA31HUl6m14dlVU=;
        b=K4Uhg1rXQ5cfWwmUmxEfZa40ddVAC+QORM2AA6qbmu3oLcfu82kBcm/cZ/6dkuG96a
         uB5dyKzMs9jZD+yq/PAZzJ8qWNXCMQ7TsoPfh7nlSudOD/n2tjzofCGY6Qn4StrUPEb1
         x3dPw7BBrGvVN3Ba0+glj2S4QTO5FSGIa5GalnZZjyXzoKTPAl/DZ5SWObjUsaoys406
         TjnOO2cj36VcbJ4Tcx2Ruv3VU//vkgEqlSoI10wnLirpyCSE8zs4nvHaNgst8B2P8qPd
         vaMBfO0wBkMGNxtuZ1eBFf00OQJBAsAbne7BKF9ACzrUw4stCHzYNh3RI4enxKzw1wp4
         bBXg==
X-Forwarded-Encrypted: i=1; AJvYcCXyyXAlqB5o1ndZSPuiemFjhD/oKxXdNTIu5JQfnlKBW7XbHiD9QDYxJtC3Km/k96CMD3+pXZqqcGGAYAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNIDVEnTYXsuhIRt4exfAthxkK6Nr0QxLaaMA4YSG8NtIEQuc/
	VjA+IpnJcjQArMd9T/gzqcH+529E+Soc3+CgcePZcr2o+hwkyfRu1Df9aD0Sdw==
X-Gm-Gg: ASbGncvUReb6o+FLCIKrRNEarC0tsvoS4mDP0XDrY9SoXLSc9vM5RnFxvg0bprK5RHn
	CJZXhc+CPWq0BJDNekANkhm+lKeQaj+5p/n/pNfCzSf4xTVtbZEz2UVVaoAZJoqBqgxcNQpIDOP
	Vk+MSvCwdLo/ZbLjGrq9lKnmkygGtj63Z4YmtwEQMrc0wPPGiSubms3oryzeTDaoWewrxte689p
	jURK9Eo2IPfziJwXA7qCMt0Zp5vEEJk8y3/uhYWdzahUqE1mW5/piZEeNfdxRx3lorPuxHXgyU9
	MpXpZ46HRA==
X-Google-Smtp-Source: AGHT+IEKZSzxjNXmRGiHG/W80iDgu7pdtltLCNjruMOjlrTdLuOgHmomS1qSW19gO/TgYVufB/n4Kw==
X-Received: by 2002:a05:622a:355:b0:471:6706:4506 with SMTP id d75a77b69052e-47167acb942mr62746741cf.36.1738964577790;
        Fri, 07 Feb 2025 13:42:57 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-47153beb6dcsm20871101cf.71.2025.02.07.13.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:42:57 -0800 (PST)
Date: Fri, 07 Feb 2025 16:42:56 -0500
Message-ID: <8743aa5049b129982f7784ad24b2ec48@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250207_1530/pstg-lib:20250207_1633/pstg-pwork:20250207_1530
From: Paul Moore <paul@paul-moore.com>
To: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, Jens Axboe <axboe@kernel.dk>
Cc: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Pavel Begunkov <asml.silence@gmail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-security-module@vger.kernel.org, io-uring@vger.kernel.org, selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] io_uring: refactor io_uring_allowed()
References: <20250127155723.67711-1-hamzamahfooz@linux.microsoft.com>
In-Reply-To: <20250127155723.67711-1-hamzamahfooz@linux.microsoft.com>

On Jan 27, 2025 Hamza Mahfooz <hamzamahfooz@linux.microsoft.com> wrote:
> 
> Have io_uring_allowed() return an error code directly instead of
> true/false. This is needed for follow-up work to guard io_uring_setup()
> with LSM.
> 
> Cc: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
> ---
>  io_uring/io_uring.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/io_uring/io_uring.c b/io_uring/io_uring.c
> index 7bfbc7c22367..c2d8bd4c2cfc 100644
> --- a/io_uring/io_uring.c
> +++ b/io_uring/io_uring.c
> @@ -3789,29 +3789,36 @@ static long io_uring_setup(u32 entries, struct io_uring_params __user *params)
>  	return io_uring_create(entries, &p, params);
>  }
>  
> -static inline bool io_uring_allowed(void)
> +static inline int io_uring_allowed(void)
>  {
>  	int disabled = READ_ONCE(sysctl_io_uring_disabled);
>  	kgid_t io_uring_group;
>  
>  	if (disabled == 2)
> -		return false;
> +		return -EPERM;
>  
>  	if (disabled == 0 || capable(CAP_SYS_ADMIN))
> -		return true;
> +		goto allowed_lsm;

I'd probably just 'return 0;' here as the "allowed_lsm" goto label
doesn't make a lot of sense until patch 2/2, but otherwise this
looks okay to me.

Jens, are you okay with this patch?  If yes, can we get an ACK from you?

>  	io_uring_group = make_kgid(&init_user_ns, sysctl_io_uring_group);
>  	if (!gid_valid(io_uring_group))
> -		return false;
> +		return -EPERM;
> +
> +	if (!in_group_p(io_uring_group))
> +		return -EPERM;
>  
> -	return in_group_p(io_uring_group);
> +allowed_lsm:
> +	return 0;
>  }
>  
>  SYSCALL_DEFINE2(io_uring_setup, u32, entries,
>  		struct io_uring_params __user *, params)
>  {
> -	if (!io_uring_allowed())
> -		return -EPERM;
> +	int ret;
> +
> +	ret = io_uring_allowed();
> +	if (ret)
> +		return ret;
>  
>  	return io_uring_setup(entries, params);
>  }
> -- 
> 2.47.1

--
paul-moore.com
