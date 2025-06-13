Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CFC20D4E4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749784506; cv=none; b=m0MmM+qB1wWzvsGD6/9h4iIG1QmXJp6nXFhIKgkfG3rsm+SYXKey3akbgmxj8cEmie3j6pyLRXWZ0tM2WgG4cjA8E+uZ7AkKKaRUkTR6OG4x9ZlJL71RqnDpyCloiKgAkGRWuAABaI9x77LhymKX7sBg7xK0/O5ITHQ5PJTIS4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749784506; c=relaxed/simple;
	bh=+VELiVMiblS9EMdhSadQrydZV1qKRILumoaWZaqOpCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIlzZZv/vxe44fH6IyQCMnE7/U83o0NpcjuYNf8vxOcXBABTr9/QmQW/vbTklLepjFtPiCpka8emIS4rFG4+k5VxAaCKdhgpLFGdK1tF8B3m4SCSRIkPh0MF3YP96M2mGMD+MOLDSIZv7AN0PDwS2xPxdDR5tZz4kv7+L18//TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVzd5mlO; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVzd5mlO"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747fc77ba9eso1599408b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749784503; x=1750389303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JRGAb5FL87rEahmY3tAqLef0mLJKpmszE0WMQvG4V6Q=;
        b=rVzd5mlOTEQM9utNVwI+11xON24dhrbsL+bLRKi6y3j1HGV+cTmlOpVjXxZPE2G4FL
         odbVzHRgme6jffwZpPBPgixUBuJv+1Nqx6HvLlVAVasfA1Pr6rFm84maW6mUZncQyPKw
         wGBg1yNz+MaD66/Z7QYpL00zA1IkqbTyO5EALNimivx4kx319x5+LTG+Rca3EVSRWdIB
         13b57KNvOksVlJgKV4URagIdGl6ZJgx4iY7N141+OwYqn+62SeIBKm5Fg4F4cUDBxY0w
         3KyP7pneQMapp5vYEtDKVHYJNiB1HCqd3qSEadMSsZsaS/WHu7mIS7CQgN8gfD1D2Fzb
         JMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749784503; x=1750389303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRGAb5FL87rEahmY3tAqLef0mLJKpmszE0WMQvG4V6Q=;
        b=iIEH84p5Lrem4rBkBGFzlHm54gHps8B57CSl/Khr5G8WR78wGiErh3c6kQCGP831e7
         1E0Tt79RAtdYME4/7arx4IfHmVdyrNo68SftkCUdKcQDPQTyZqQrOlIN0XaaUQIYuCA/
         9eQ/6/70qPEO9+gYDAqFWtyJoBGs6Zgr5YDgj/mesd2LbX0U1dGT+H0pBFC5GAU9m07r
         tLjEz6bktKqcjzyz9+zAUny9U1v6ROMqB0wZTY9KJU1kGVQ/4BlvmKHkGYP/jd1w7My0
         NBd7MUwUqrfBnZMOcU9/08iSEr9tsp2HNofdV/rgQ1yqQJDBzF7rZIJ7yt9bje67o8pr
         umfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+uhktEVEQ2kIcXTIYrtrxsSZ3vf7orufMLmR9NqCvGie6Qf07UzlDmxaBn5vD8LH+YJeaGPUbeIpYNHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+W2Nl+/MRMm8CA9cxSpUp3/HgNMKCniz+ughjWjYTUT41Vlt
	jxLbNJrwaS20eIA0wnRcx98tA6hMtCGHyf0hA5y2OCM8YwhAVcLPaosZj72RKu+waWM=
X-Gm-Gg: ASbGncuCyEvhj2xVE7/VQzr8oUfXakEjoagcR5J7UzYeI3p7dMabPOvV8cM/ki7h8aE
	PaFJ+Ei9gnSfmcefrtdDjpDTCr8DBIfL3oxpx0daax/vF7rZNx47FHuiRitB5qEzDDPdb9+/OhS
	X0RigWkuVibXrukDc1IPLxmun6wYEwvp2jR+JyKp0QQX/z9jC5kt9R8jcD0eFg49rdJK5KQ45qe
	Axji+khNmA0niRMYVNIXEpIGub9bpGWXXZauDspBBRL205LLMuPXr4Obz6AtQNSRQuvRbHKwwZO
	ibAJ5cV41CxVtmmIMKF+YR2VeeA7y+j5x/BpZPQhz3FX5kiA9yXo0XAZaIAWDqs=
X-Google-Smtp-Source: AGHT+IEnho9SIZwX8QrGlyPV8bXYV4SYO9jr621hoxecz+TswlMYKxI8v4iYpnb5LWfEM/IZI9aNhQ==
X-Received: by 2002:a05:6a21:9ccb:b0:21f:51ea:5c57 with SMTP id adf61e73a8af0-21facbd7410mr1977131637.16.1749784503419;
        Thu, 12 Jun 2025 20:15:03 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe168b971sm568935a12.58.2025.06.12.20.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:15:02 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:44:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 2/4] rust: devres: replace Devres::new_foreign_owned()
Message-ID: <20250613031459.dmg3bgif62oyaagv@vireshk-i7>
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612145145.12143-3-dakr@kernel.org>

On 12-06-25, 16:51, Danilo Krummrich wrote:
> Replace Devres::new_foreign_owned() with
> devres::register_foreign_boxed().
> 
> The current implementation of Devres::new_foreign_owned() creates a full
> Devres container instance, including the internal Revocable and
> completion.
> 
> However, none of that is necessary for the intended use of giving full
> ownership of an object to devres and getting it dropped once the given
> device is unbound.
> 
> Hence, implement devres::register_foreign_boxed(), which is limited to
> consume the given data, wrap it in a KBox and drop the KBox once the
> given device is unbound, without any other synchronization.
> 
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/cpufreq.rs    |  8 ++---

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
