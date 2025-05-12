Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8D01C701C
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061470; cv=none; b=iaoEpdL1P+WNKGZBLkCHQXavZis8h2bI6fKlo/2d2HYwATqDSeS4cOdwfYRvXKhq62dUxKiDT6dHlFdgGlwKb1KhTeNxEjfQPeSZibUmZlcU9vZym+fNZI+lybNPvARCk5pll2mQz2U4TDuqW3JSQrV3ZWTk9MrlGwLbAd6yzls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061470; c=relaxed/simple;
	bh=D8ERM3wxNy4SIqS55lDq5eZ7zd9yV+0Q1RkUN1uIjB8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pk6aZeYLqkNqXGli0mH5GKkzKQXK99UpoAI++o/1PnKEI9/wI+UjR20mPBMcbwOaIs/6BOydJk3WNWymPcTgxSxMaEWizhm0WukjPqzhoEKyr+/THfSpDCp/exhYHQAJtO0yyfKu6zNJPz8wCrG/NH0373h5gJKwPE0eoCiabEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R7BTSxSh; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R7BTSxSh"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5fbda5a8561so6358357a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747061465; x=1747666265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lu0Ka+btw04+FB5hra+I3uxj0tOrSX2sD4d9HHszObc=;
        b=R7BTSxShnp1HCUpcRfNPaal36O0Gyi6CYe9RgmOIcW1R1ReGctNVyla2//Jf7hr8Ol
         V9EArf5W0YJvRXMyyCQuPj3JdIV4BNPrDjL2vCcnFNpTAq2kJlsvtkKwc7aMLmWCgX5Y
         Df588aGPLk3/j3gvDT8GfsIZW82eUzdd7P+OE/NdPLoaFXcDZjYq7Z1KwjP9sfueBr75
         iWXOMAleKBbX/aRTQ0u9W6tRtZKDgdW4t5l3hhqUkwkFsnVBo70rGYmP3D4dvkQApcGd
         M9Z2C+V2f4vJlIHafUTxLGHcBuUix9839MFzdZY1xCfL4oKVz/XfAqCkXCNP+aUeFCsX
         n5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061465; x=1747666265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lu0Ka+btw04+FB5hra+I3uxj0tOrSX2sD4d9HHszObc=;
        b=vXbZ8moUEB7B++BbHSSYQ+Wdz+kHAPLn5dyK8YW2jVdXAL2GIvQDP8Awmu8z2zTRW0
         0xuFtJ3mMN+8zrv28XEOxpDBJAFNzfVlarAZgGs7pFO6gjClLK/xt+PkLhjo8TLaffNY
         L8GZxkZS/5wbdmixv8hdEEyZxDV4Rbt5eY+1KvVvBrKO8KcQvd5YuLl2yKtOxzap9aMv
         xQJn7ogwL/fy5P13TLL7Ka4NRDzRqOf2SPTnmrsxHf5T1LMMpmCsXwm6+OAmdL21e6jg
         SQKvmjvFlpg62H18ZX8RL6xgA+fVPc7NL+8yP7MdTsEpTPWpiChWz7Owg5jauilHISZM
         2RDA==
X-Forwarded-Encrypted: i=1; AJvYcCVEukg8suaqXIrLmk41ICSNdQ9eDhSYGs9+sN327+aBcCPFzHt3MfOezaogPOdDw6UN/pAMylOPuYiVcjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLmWvrTOp7EMWNMPjND6V2g7i0ac/SiODrT0NLx85XSbJ84zjy
	ztlKExwW6MTP7CeLlGynEuah3rxXrDeTS4jhTi6XMBKYA1jxSvwuLIsT5vTO4HE=
X-Gm-Gg: ASbGncuoAHNF6Wnin7gE1os1rdQ0BN5PPQjJMvLEYc9YmXIvP6LWvkyiOslyaSf8/4L
	mlKmZDqnhrBCuumcawql+yAZ517E63lvTfwhApORbriJFXILMSauv6ojdtuXyLp4ek+z86SS4Qz
	WQFKqRxaSpjVzotcQCsvg3m1cu7SSPWuu2Oom5SKy1+RnPhHE4VLlV1UnUfbrsKoeXY8j5Y6A+U
	VoZBDRltgHFwrMF8KQRscuhNEYShdiJZRyJk6OV5xK4UJjioR2LW0izSZH/U/CG+OttvQ7otb4U
	GegnN/glwU7fsb275RdqPl1AyOlTbWK+pXEmx7IrhZj2RFPOv3vIdg==
X-Google-Smtp-Source: AGHT+IE2/toU+HufXX22qwPZasaD7jOUf2RnZh1MyhP01PfRZenyqlX4Nm3L0S8HlwQimighlo0svA==
X-Received: by 2002:a05:6402:1ecc:b0:5fb:1bd5:f73c with SMTP id 4fb4d7f45d1cf-5fca07eb6dbmr10848327a12.22.1747061465297;
        Mon, 12 May 2025 07:51:05 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d701394sm5775759a12.52.2025.05.12.07.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:51:05 -0700 (PDT)
Message-ID: <27d93a59-5542-4b5f-bc08-25aa7bff21a3@suse.com>
Date: Mon, 12 May 2025 16:51:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] modpost: Make mod_device_table aliases more unique
To: Alexey Gladkov <legion@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <cover.1745591072.git.legion@kernel.org>
 <20250509164237.2886508-4-legion@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250509164237.2886508-4-legion@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/9/25 18:42, Alexey Gladkov wrote:
> In order to avoid symbol conflicts if they appear in the same binary, a
> more unique alias identifier can be generated.
> 
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
