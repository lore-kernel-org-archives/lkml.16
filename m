Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C1122F759
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747365519; cv=none; b=hYtQ5i25AlUzSxOlJJyvDNftvAGpjxPMTiycLTD0PnbGd+PYez1xGsXGsjmT9yRMf+s6HCJE7iY/Z1LMAbYVGZlAv8sFSjru4P1l8vB1udsv3TYnxP5gkbCQ2pjT4MNVa92/GfPlzrXwj/duiaE+z7M2TuFwAzKvTFp/CUmZdPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747365519; c=relaxed/simple;
	bh=fUleARR8WOqVRUDxvmAQ8pRYUbbZ08VVcF0Rc27NNPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpCw9iIHXs6bWfhMdbrqx1dYcnTKB6Qs6dCwFbAImfkNSs7Fp2cNyOv+rsYaTeRb+/tR853zbJefJLtpkVn7uf4VeygOs2d23sWtygzKGvNJJZhu7dLtY6ceWIhUjdp6Rs33t3Z9ROxLBgj1v/LqJoFJJ/tt291J+VugS2gVK54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dSHc5cQQ; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dSHc5cQQ"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-741b3e37a1eso1831665b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747365517; x=1747970317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j7W5OEI+FZQpiN0ZKth0yhvtWhfARtMcnHwli9u5j+8=;
        b=dSHc5cQQo2CZFdfwoG8O2njoB4pdMQKkcfr3n7Vh/99vPIGoiaTKgUfyjoFHZUlB14
         953LvPOOf55lnEsq/TPB7sFqkN9W8LIlU45o6sb2PSo7/kPi9a4Rtg1dNR/v9RuOJYpg
         S4OAYdtRFitpgCrD/BEsEiBYJ7KL0O/7ikFW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747365517; x=1747970317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7W5OEI+FZQpiN0ZKth0yhvtWhfARtMcnHwli9u5j+8=;
        b=WctbgAA7nRa1XZ+JjPp34Vsw9AiIKiVxf9PFv6Cw/pnW+S+r0A0Eumur/b7MCLZGNX
         9BIgG/atASCEVM1yEuXbR6HsJvEGaHTwS6US5TiQXltKGj+oGv7JAhMSRCYVX0+2MBVr
         9zqxVzk2aTZkxwjAWcnCQ1H9+25OxBkI+D0/XG+5LJ0cmtpnjmx8jzcpjJAG74nSleaT
         wgfbdpDdehEg2dflJaCUL6DrAn0Wsg5tEAbWylQa3VmUjnQ6ae8ptkXLLYPJwuDsleip
         xs40Bz4jQacwAhTW24IVA1fNKk8X9gsAvWjPvFDYpuI+o8lz0SwLhKMxoQofnjuBVAMa
         qFkA==
X-Forwarded-Encrypted: i=1; AJvYcCURN4vOCuKjkJ3+hpfvynSN2Zd25XBVQ0/bNRLqGUc87Rf//8tHLFsOlXKXXHEsrlVrE/5kuU5qUCjUZXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJllfa2eKtW7RRor2rzJ5Ixa20fkV2Os+jzoLDLTIEHUxvy+Y4
	uSOZG372usmh95Uzep1LWpg6wCumy4QCmMhTs7QCSe3ebcIHHzGe3HWX+XPqFXiypw==
X-Gm-Gg: ASbGncvHMzo0+EEI8iInw7QPsyyEdHSkl+b0DNTcm8Df40WR1cbVffQiW4hQKLuT7kN
	o5mLi2nc1GqJ9NaLkPKeV6ZTQQhmPEWHhCPindzasbm5/ojucgsUoCeveZnfRC2JEVdE0ZcFaZv
	fNhQ/iiH/cw9LYMjcPV78TdT9xUHTfRbVxjgkBuwFIDqMwsgEwYITrxc7aCs0WK6TwE11aRlIwI
	xl9TgXqJrwaiM0drcv7998vUoQuvJI9+PGvwteI4t2ZcJrokfzSr02hRIU8QkUk8vy6fFenRBYg
	L9O8KGXZdX2D+lQSOmWjxTHpJaVyVtyTQQ3rzt/jebZl/e6ZSmFCq94=
X-Google-Smtp-Source: AGHT+IHLTkuxZtugendz3dTtnKy+P2jOonT5OD2OO6kiYftSGNfAKI2vlh4zIm6rwvJZn9EZjsTHaQ==
X-Received: by 2002:a05:6a00:10c6:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-742a98b833bmr2119960b3a.20.1747365517264;
        Thu, 15 May 2025 20:18:37 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:3a9e:6985:1cf8:b3be])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9871517sm559838b3a.135.2025.05.15.20.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 20:18:36 -0700 (PDT)
Date: Fri, 16 May 2025 12:18:31 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ferenc Fejes <ferenc@fejes.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Matt Bobrowski <mattbobrowski@google.com>, Andrii Nakryiko <andrii.nakryiko@gmail.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] bpf: add bpf_msleep_interruptible() kfunc
Message-ID: <3q3yni3umfwq6mhghcoyqfpvji2a2toumo3elgjq44tqvxwuag@jzci6ssmkrf3>
References: <20250515064800.2201498-1-senozhatsky@chromium.org>
 <eefad549e3d0568b523305252b6ec3a468502d2d.camel@fejes.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eefad549e3d0568b523305252b6ec3a468502d2d.camel@fejes.dev>

On (25/05/15 10:59), Ferenc Fejes wrote:
> > +__bpf_kfunc unsigned long bpf_msleep_interruptible(unsigned int msecs)
> > +{
> > +	return msleep_interruptible(msecs);
> 
> Perhaps exposing fsleep instead of msleep? fsleep might fallback to msleep if no
> better mechanism exists or if the sleep duration is >1000us.

I like the TASK_INTERRUPTIBLE semantics of msleep_interruptible().
