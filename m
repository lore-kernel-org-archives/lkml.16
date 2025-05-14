Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9D9202F9A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211678; cv=none; b=e+2SwIWsmQMbA/GWf6s76zaw93IHWEYLNw+K6vaHo0ePuaCcMCfQP7exBTs/XPC5i8JmCntz2JZcJ7qYQmIMUDdtoW2p4Lopm9Rdl5GOLiboihvNZWrBf/7o3UctiWmANMadV6IhBOeny1KrS2wykKpeXSIKUMEH4r3f8bq286U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211678; c=relaxed/simple;
	bh=413HM5eboYj1vCQAGypKKKAbvRddV4u80mvB/tL2F9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XbCYkkoqUvIFWl67NgyYgxE/5WhuEWBcSx2OF21dXxFOEQdYXIUivg09q7lRR5NhKNzf4ZlQ2pHiCFVf44BTS4enm/uO1bUcYA/6LSNmT+oShO1eOLciMg15pl1OF1vNy+bEGse2FsJcHqC94k7xbb/Qu3bT9ADC5KCfeJ9wA28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SrUIcqaP; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SrUIcqaP"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441ab63a415so68628945e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747211673; x=1747816473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmPxzvplp27sf0Mh5TNQ3UmGJf69Of2vzLV4ej7YVkA=;
        b=SrUIcqaPODojagnPoRW+EgNHSzbIpuBYPruB6ViPMGqoWp97FIvecSlIJ9uDylMavK
         c+Gv4QFDYTXd5PTeupnbsBREDXj15BaTcDV9YTCvz2N98yQFV3v6M6oqsFqpsPkIslFJ
         sIHjtvuuwsVzmNrfa9xXRCLBUL2k1YQ3EAl1bP0fBAgdEAVHsZ04GzYB0WHio/Gdv0PC
         eLErMCCqLjeyEI6VCzzS+rKWhX8k4Uydyd/aCZLbhk4js22y1x9+oUULlKNqaq4+/l/7
         4Xu2OMObHFjrvR4UEADeMmgGj0+2CoGpO5yUOvVIydLvWp8HmUq9LGZPHCiHNfI4Rs5X
         xrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211673; x=1747816473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmPxzvplp27sf0Mh5TNQ3UmGJf69Of2vzLV4ej7YVkA=;
        b=dmoeN2SmRTBAiiwG6o4T7rGA88GtynF+4Jvk9ggHJxa79dS0s+D6yBYmURwxTI7VKX
         7AlkixyjHo/YI07/d7PDRWI2lbKG+N8cvKMxaAlgPNHI0QdmSURPl0GTny27Z4U+miq6
         J0kyrAwCk0GnqWof6hNinYDHtXOECAvUXWdYc/ejr1NG/3ZYYDhL7UMzqF5ggb9nIn8I
         jON6iVsJKravlEpEah3+Ohn48/VZtHYNwtwbqUBm+OUN5tSh+EGvuwvYZzXix7LSafcQ
         q1AETMLiYzFf7mXL2UHe1sWKM89d+gDOkHMBIRtRyFbmkEWxVaZDMEJIiENjQXcDwSDq
         2PAw==
X-Forwarded-Encrypted: i=1; AJvYcCUF3ALnarq0kzRJWFETnZzeK7YT3XquS/jcWwl0rlkfV3Q7HuusDxVxoziWh9CYuxmVI8dYrXKQEkdR+A0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTJ/tCXT9NgQTsLbB1YZmERHaB3GgBMEbpXqo+6jVQHMjCSIQh
	jvtSsXoI8MXBsbXtDgZzI0ncLQCOWTdtmmEC5R3/fUdfz3LpMWz6/OTkb9L64F405ZLz4gbgn0L
	B
X-Gm-Gg: ASbGncukXfWG9Y2isRFj/IVeqmyc+cQIh5lgQtXJrncD4nGi7F0a4GSwhiXHQm0DqkD
	yhccN34Y7Erj6B+gYkR6wYJcJEqN6zKBAmO5wUslnJibWNCsM6AfGLXQ14msSswqkAa2Zi4RWem
	Z6Wgim0ltfiZ4TqD/LD1qG6C/+ixbMFxLMnxpHX92f4fg8j3f3kYhg8qrpHH/OzEG1smV+4yzSq
	2paf77DUyQgv7N+NsSRkI6rwmhhrS+5H2pXwrTXD+qfu2OWK1UAT6RuvMUf82vM6k5fJlNOsFou
	VJdXVJhuZRz5HXr+C3oWeSIYu+J7+qVvuPn2vrkKpWvm0PelLY2MNQ==
X-Google-Smtp-Source: AGHT+IGMrizPwMYXPEGeYJfqWtlgiQDVjgsMQKbEsCq+MVhFWOKzPY77w7J6frRmGyePbOUN4M6Vhw==
X-Received: by 2002:a05:6000:2dc4:b0:3a0:bb2b:14e3 with SMTP id ffacd0b85a97d-3a3496e7095mr1945171f8f.33.1747211673499;
        Wed, 14 May 2025 01:34:33 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6297d9esm8160828241.28.2025.05.14.01.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 01:34:33 -0700 (PDT)
Message-ID: <81444b38-e0af-4278-89ad-e25cfe08179d@suse.com>
Date: Wed, 14 May 2025 10:34:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] module: Add module specific symbol namespace
 support
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com,
 samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
 nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
 hch@infradead.org, gregkh@linuxfoundation.org, roypat@amazon.co.uk
References: <20250502141204.500293812@infradead.org>
 <20250502141844.046738270@infradead.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250502141844.046738270@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/25 16:12, Peter Zijlstra wrote:
> Designate the "module:${modname}" symbol namespace to mean: 'only
> export to the named module'.
> 
> Notably, explicit imports of anything in the "module:" space is
> forbidden.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Sorry, I thought this was already reviewed from the modules perspective,
but I'll make it explicit.

Looks ok to me, besides the already mentioned "strsmp" typo. I can fix
it when picking up the series.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
