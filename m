Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384CC1E5B88
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873097; cv=none; b=S3FzNt9feCjVRTggWV96ZaG/L+fRDaqKMoYx+Rb30DJU6+ucBj6akTjzvs+mQwO7FUKYZv5Zt+sNx0i8WOFQEA0f3O3FVwd7O743efIUrnHqqH5jHE+x42fBzEqVHXAkFjmUeYMXCLspdlxweVCZU+Xy0IqUtZ/481VhkEEnXfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873097; c=relaxed/simple;
	bh=fvVzeo6IQZIpSPlKSAZ0tGPC0aYZb7s8ofOa7vniBoc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=umhh1pmH09GYJMOF0FAjlUtSi3aOe5huaMmVCx33nTdpb6iUrKFnv2utAxkIHy3RxtnNOcMYg7RMPdl0zqPAQdEe7yaBbYcbEnyrvKeb8KGlmfBRXKYEUMGSiTPMe1YEyOreReXoJSS7nbOCUwYsD+1NVSUCLeLEB3KYB4GM/hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=COwB6KVc; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="COwB6KVc"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a1701so1830829a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751873094; x=1752477894; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SvJI1o291o0y9hg9fSTTIh6LqrrJuB1n13xDu6ZRR8k=;
        b=COwB6KVcTHL12ZXoSuHYjvc6727nLHVtaxVGUVN7h9EYLB4cGj+pKZR4hu9dnrBpqf
         ooFc9HMJ+TQc3UkTQgSBLufH3W8Ng7EeRaXUI3T2xhF0IS9fa1RVM8oyyJsUywjyLSCT
         VSbNmvwGem2zB3Av+0f5JrsTuiltqmkom4ASoWXLlUeiCra4UrJ1bZmclj10Y7FUYg5p
         0sBScOT65iFe6/hpqLnYdhaKFU3ZU22HMX4oYtVU1DbXoY79WVtGKVwUaP05MruAUU8P
         Ifug6KMoTfbMoW7fmbw7g7v6AVlxRTE6CAalPwCC5dPYAY5e9kDPJfCMvg5kmCmuBw6C
         D3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873094; x=1752477894;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SvJI1o291o0y9hg9fSTTIh6LqrrJuB1n13xDu6ZRR8k=;
        b=rLQICySDbT7BU+XAHs4DHJVltHdjGEPBTo4boqbCpemlLiv5aMEFwXvbJTBuTUK2s8
         DPAsse6EJbjX0A1Q0g37c7A1Ftv3lJAsnHTDqPySjul7yejWWwyMdmb2S4crDRdqdacb
         EuoEwwunRpHrMqc0+BkV7kg51tvlhaIwS1kK0g7K3inH2fulXsZG4O4kHow0ADxLtXup
         xlt8JB18SmMnorkV6fEeDHk/n6+VSNonc+FX/SvET1GkaeXzAh+n1qej+7vwivtCfF87
         RYMl/1jsOAk/CqeQsXC9q7EZ1b2kfY87M36heVeLCW7sMJsVJnciW0pWaEr0Ypz8kvaA
         6SRA==
X-Forwarded-Encrypted: i=1; AJvYcCXqHdQvRxMB3z4FigJ5xK+Q1xhngzT5eVwiLG3dycpY4+naZdB+iGF/BVW9g+7GtHRdz5rjttzOV55Ryq4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ioldmy3mQf8YU6p9NbRN5+u95s5rK15F/jC37aBhvK/tCNCR
	/UxIGuuxdWe5dACW00ComyJ81hwOI/iNUQdsd/fl1xP7hKms8bRN4w70g19FB8V2FdAyp8JXJHq
	RJ32TC99Xm11NlzQg9g==
X-Google-Smtp-Source: AGHT+IHZiNXHW0/3U3AvcbCxIvAS005jvt1rcbTpYXGYvrOvaPApBUdvcqAMu45z4xOzWcCZ0ChJRFxmV0RzqsM=
X-Received: from edr4.prod.google.com ([2002:a05:6402:44c4:b0:608:ab44:efff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:ba85:b0:ad8:8efe:3205 with SMTP id a640c23a62f3a-ae3fbd93053mr866013466b.55.1751873094657;
 Mon, 07 Jul 2025 00:24:54 -0700 (PDT)
Date: Mon, 7 Jul 2025 07:24:53 +0000
In-Reply-To: <20250705-miscdevice-maintainers-v1-1-9a6b67f7602f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250705-miscdevice-maintainers-v1-1-9a6b67f7602f@gmail.com>
Message-ID: <aGt2Rern5PFQBRYN@google.com>
Subject: Re: [PATCH] MAINTAINERS: add miscdevice Rust abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Jul 05, 2025 at 11:45:56AM -0400, Tamir Duberstein wrote:
> Add rust abstractions to miscdevice MAINTAINERS entry.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Acked-by: Alice Ryhl <aliceryhl@google.com>

>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3f7fbd0d67a..a9a094e2c914 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5568,6 +5568,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
>  F:	drivers/char/
>  F:	drivers/misc/
>  F:	include/linux/miscdevice.h
> +F:	rust/kernel/miscdevice.rs
>  F:	samples/rust/rust_misc_device.rs
>  X:	drivers/char/agp/
>  X:	drivers/char/hw_random/
> 
> ---
> base-commit: 2009a2d5696944d85c34d75e691a6f3884e787c0
> change-id: 20250705-miscdevice-maintainers-2aca6f19fa0a
> 
> Best regards,
> --  
> Tamir Duberstein <tamird@gmail.com>
> 
