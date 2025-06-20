Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27301283C9C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412616; cv=none; b=IjH95liOdcT3rhinv8Ovsz8eTVnqEU3s54Xe11RKbEgCM/BKyur5wQyzm63xujGqUVCgSFX0pXMxZ/xVXFi/6wamnavk16NraHhGIMVEMsMSNWc6n9GqRWO9f5XUh9fcJXOr3tNX7zqRTSvpSt5B4W3VvIAaO1mXNHu8n4R9pPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412616; c=relaxed/simple;
	bh=CUC8O2VwMALRnRhIMKIyIO0HIrPO1m4KYTOieiWxaKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqhc2Q7HmNW0GPBUbDzphE04JVnNTtowxXdS7oiNdeYhUJSJH+jLd7cE+UETfhczd9edN8nZT+Sw4Y4xFrzfY6B0Ub6kvuanQF+5HttjqvKK+p7nd6N/JnYg93FWJowYY1am9KI06NxFceaF+Dn9QhBZWWo2FqifOFxyk5QPnHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kaenU0K5; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kaenU0K5"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2363e973db1so11225165ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750412612; x=1751017412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wE7pUg075HF0iK/42gsiTO9zjRo3RhObajlGQz8mgyY=;
        b=kaenU0K5xwreuuRH9D1/lqNy1Tdbx6jkH5EMXMmIm9A7s4LBp/4URb8+2AZ0ZIoiD1
         XJupMph/R78jG53xs5I1ClWkm50WqmnyGqRidkCFQMYBJbVkQj0+OOp5l1xtjMRWX0JF
         6PTowu8kd3YXoxalE5wPZtOTTkD0DFEtsjNJ/ZueuXhrB7Oov1F7RiHZKRu0viJswSWS
         HGCPkN5wJJ9v416Lb26UCXeLyEJvUwHDpBBAXNCcQXtKXAxQoWeX8vURILK8yq/JbkCa
         lyWimYG4wgtGN20+wRcjm2utXV4tl0FJKc/jrdteOaa5JypA0BZc3biQPGzu1LY34Dhf
         MOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750412612; x=1751017412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wE7pUg075HF0iK/42gsiTO9zjRo3RhObajlGQz8mgyY=;
        b=v+iyR8Etwyk1eNn+i2lERtBx8ybP5/jj24eg8xr+oGPMG8kJ/ce5MXAvC7uOExyi4d
         Vb878c14Cv9Pc9hR/0R15j+HpZ8/eWYibwvR2Kheru1YYoNLfcngTPLDfoOsLuVLLtMK
         QuKhghQM9FeyFQf8S6sOCNaB92BLSGFMktRZMkycbPy73Va2fUx/grR3ubTG8pInOvG/
         etZPUvED59Kz9xOVMUmaD+Szlno66f0AYLS0cb9JAJ3w17fIvfSx3YjktFtXFwGwP+X0
         5DglExzgzFakZMgxepqvVx5Ik+ca22XfjhFnN4bKFLStfG/F+yuaH46G8lvYjbwTms7a
         6FAA==
X-Forwarded-Encrypted: i=1; AJvYcCVEtkO7w94hTFdrMifjc8F+GqS1na3x/V5/H14CAI02mSxZWdUeiV01NkGm3cZQ+J1LCK/dJzKKvZp5P7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLg0ooUAYC6DcVNfr6a8C6acHkanEtITnRTZ4Ulc28hChs4U0g
	s+3VbGEfd1cfcqxfJ3jqoTGfBVDfPISNPBRt+xT6PpcUYee9UIaf/EsRYLLOA0Bdu9Y=
X-Gm-Gg: ASbGncucNL/M7v0IRSqDr0RSHp4JjQEmspdc1r3E/mBRi7hogFmKuGTvZhB3VrTCRpP
	XCwsminhXXHTLBkbFoLpd058je+MRE64UXblGKfkgZsFAfnObqaYnikQd87riV8qdDQz0ErEx4w
	6+OK6NxFhI7XrJzqGLHOAdLYIWEvxZmVtOY2HZKtnrHPd0DSYXCDY+p/D/YqvXazJpo91yyi+EJ
	kR0E0so7IaO3uq6g46SrjqH7MvCdaUqcVCgLYQI0zmflMp4zF3JIBCYk5bozSxVrK66fUWGqZ3n
	gjbBpMKGtNiGZpfGFNV2O/TTLBPe70oP4mpHuecm7WNeXK7rWWt6baWxViNGdDJXwZC94uknGQ=
	=
X-Google-Smtp-Source: AGHT+IGYtaGOuL8gI+YuufgD5d5TBG2eLVkJT8YBCXNPrn8oqs8NULxbod37t1rWLg/LGuPoK+SXRQ==
X-Received: by 2002:a17:903:19cb:b0:231:ad5a:fe9c with SMTP id d9443c01a7336-237db06e6e4mr28537095ad.15.1750412612490;
        Fri, 20 Jun 2025 02:43:32 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d869c5a1sm13860205ad.192.2025.06.20.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 02:43:32 -0700 (PDT)
Date: Fri, 20 Jun 2025 15:13:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: cpufreq: use c_ types from kernel prelude
Message-ID: <20250620094330.m3batzq7oknwk4lz@vireshk-i7>
References: <20250620085229.18250-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620085229.18250-1-abhinav.ogl@gmail.com>

On 20-06-25, 14:22, Abhinav Ananthu wrote:
> Update cpufreq FFI callback signatures to use `c_int` from the `kernel::prelude`,
> rather than accessing it explicitly through `kernel::ffi::c_int`.
> 
> Although these types are defined in the `ffi` crate, they are re-exported
> via `kernel::prelude`. This aligns with the Rust-for-Linux coding
> guidelines and ensures proper C ABI compatibility across platforms.
> 
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
> Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  rust/kernel/cpufreq.rs | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Applied. Thanks.

-- 
viresh
