Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D6E126F0A
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806766; cv=none; b=S3oUHXxcmPvDDIk5XYKIIj0ibSSDCsJmfOoH8Qg/UQ7c1it/EaN+fc8cuBtXyMjRS0jYbpLFlGw82ggIfy3TuAhluY15bRW7w7wnVa/Ep6SowDlT3YdqP6aG+86bScyikv25jcWQ8CMPZxoKqz+4YpAPv33BNtuISThMvaJQWKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806766; c=relaxed/simple;
	bh=hpCV+wZEFfyUrH2luJ3W7iXAJRcOLdplJ9Cn2k9I0xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8qQnEFe+cz6WbtxPJeslClgg9uHSC5ZU6cHFhe6zud2h+vKV8+QYRkIJ7EeM1ADqUIoJFGYNw9RlllpmZ1V+ZEwjIyeixzvroo4fufWJuKFArZ176/p0DcnDFZRbDNVNQR2PFwU5gV/ChApOgMThvv7EKHUIM6/WMhgUUFjl5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=F2f8Yo1t; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="F2f8Yo1t"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-47686580529so28421301cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 09:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1746806762; x=1747411562; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oYYNA5Y8vNqJQ6rm+4NydDIpOhAL1lR7o58DtBKay5I=;
        b=F2f8Yo1tRJbvxsM8epr+54d8miICSZbQKEDfIMmoA7bnPqKllsF38CPMKjlyC/nJuv
         oQ0elwF//BoMs997UX+JAkjsfsw7YdyCiihidPVAkPzPq77d/kr3X4Ff+yZk8ApQdAem
         DGYstaVZSo9dWoaqWqg6j3zwTbCX5/Ggq/vSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806762; x=1747411562;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYYNA5Y8vNqJQ6rm+4NydDIpOhAL1lR7o58DtBKay5I=;
        b=qcPU6esU/qzndUSnlD7Pzag9ZokVy489tbHjE527i2SRGnFT+xR8kS7tNEUAb6WYLD
         HBgx9KNDHMuGLCdYpHKZzARTwrLzl2kXTolfqWX5qwM+FXQK/oPTFEroy4W4+dHTf6yI
         4XeFELTU2YJLmlQaiuuMhv7Yi2+pWmcqcTtRGbEe7TIeB5WlzO5ZVyDLRDomEg2Nz72B
         0IQjReR0Egj6seZjC8WoqXTxyBF6JooGQV5jxsejRivE1qav2dFqIPXfIyHlvE8WqLup
         wQrEVwQU/EC0hv56hIwl6r8weeV6yvXG31tn4kG7S3BlptfqnLGBiPo3tQimL75dgADQ
         h/HA==
X-Forwarded-Encrypted: i=1; AJvYcCUCHHefHfDl8fl/rlCV+QxpX6rXiKGoimnJ+r/IVaJTQFwDw+a3VOe11QYlEJ3yHSbUQDFx63NHHD6FN1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZjF9olTBBRiMm1+RFdYVNRA584BfOB2DdIMOkzvawC7mUb5OP
	rEQ17cXIVBHjAdZRT9qMC+wsro/5xthvikBFmX5dIn4rFTGI8bMUWAJvlImJnPh8eHlV6R4ZjDV
	SJlKyby4c+mBbxjVPwdJU9qqLNLAkXN4SEPQ338p/Np4kMPuXP9I=
X-Gm-Gg: ASbGncurnSraOp6O7ix0pxXoy/A6LwzAyohHuzVH38TDd/6tnhI2MV3TDv8BGCguZ2d
	BcgYbyCJYieMts5NAmPqEZEaVG/SvhjbmKkoCrqJrefsDGIqFs7rFMJfrJ2EymYc6ybA/hEUoe+
	ZyEi6viajih1uJJpvSmfhF7Z5U
X-Google-Smtp-Source: AGHT+IEHiCPo7BQcQQ4V4LveV5lpWeKGx3e8fLIkl1enh0LnY61QSyytR7SVE8FYAnVezA0GudCivibZIeDxbD/YCGE=
X-Received: by 2002:a05:622a:cf:b0:477:5d12:aac5 with SMTP id
 d75a77b69052e-494527f3e64mr70459981cf.35.1746806762213; Fri, 09 May 2025
 09:06:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509-fusectl-backing-files-v3-0-393761f9b683@uniontech.com> <20250509-fusectl-backing-files-v3-3-393761f9b683@uniontech.com>
In-Reply-To: <20250509-fusectl-backing-files-v3-3-393761f9b683@uniontech.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 9 May 2025 18:05:51 +0200
X-Gm-Features: ATxdqUG0rx57jgc06Deca5uke9zj1A-9nRy55YLo1ywJ9DGv7Z_yGO2Q0eAogAk
Message-ID: <CAJfpegs-tY8oebgc6YubXt-NCWA+gWEvu0yen0sAT8drM9Dghg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] fs: fuse: add more information to fdinfo
To: chenlinxuan@uniontech.com
Cc: Amir Goldstein <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 08:34, Chen Linxuan via B4 Relay
<devnull+chenlinxuan.uniontech.com@kernel.org> wrote:

>  static const struct file_operations fuse_file_operations = {
>         .llseek         = fuse_file_llseek,
>         .read_iter      = fuse_file_read_iter,
> @@ -3411,6 +3428,9 @@ static const struct file_operations fuse_file_operations = {
>         .poll           = fuse_file_poll,
>         .fallocate      = fuse_file_fallocate,
>         .copy_file_range = fuse_copy_file_range,
> +#ifdef CONFIG_PROC_FS
> +       .show_fdinfo    = fuse_file_show_fdinfo,
> +#endif
>  };

The backing file mechanism is an internal implementation detail of
fuse and does not need to be displayed in the fuse file's fdinfo.
Currently we can only have one backing file per fuse file, but that
may well change in the future, as well as other details like offset
into the backing file (think FS_IOC_FIEMAP).

So NAK unless there's a very good use case for this.

Adding fdinfo for the /dev/fuse file is encouraged, it would be good
to be able to retrieve the connection number from the dev fd.

Thanks,
Miklos
