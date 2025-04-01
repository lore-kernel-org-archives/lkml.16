Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E9C1EB5C9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497324; cv=none; b=pgmFMMxleeJi4W6RhjIswU+qLiUiruJ6ldgmxGQKuQZ9IO/MZD3bZXVcemMnO4q8SO9O5SKtFX98fAtIBv4MfwHDP0GHT9qkSQYgBvApH5+bie7W8IZCbHB40qHwhYgwXg50lcsWcTMbh6JJLAIhpqNdzmaf4mMdOPyHeweawK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497324; c=relaxed/simple;
	bh=08FBqjkfx80Xs7oU45TJaQnC32mDcslSUZJgPJvQo2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j4dd4YuGnVvZFfsjmeaNvt87HiyoGzmYYkpLtuQ0FnQBj9oGauRQOLvC8Z5mPDIFuGWKqS6+ZLIR6QnHQHOEG/Pk1jcYVegvbC1a65MRpmby9L1u8QD+eazrAb2wi0Se9dC6qbIEos0QN7oT78YpsWwZhENi83YAcf2cufr/A+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LOap55V3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LOap55V3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22409077c06so143340455ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743497322; x=1744102122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yt1Nb3A/KQmEAHpUtsnXqXFTpyRKk6b4Ck8YXLkwgWk=;
        b=LOap55V3kEs+GbFB7qD30+dCHi9mG9xZaOW4BJsTVABlxGP+pdEl3q50JAWTlf/tl4
         4ypViX+5NZG9538s5mk7UmXNixaLOMQXLcJHwEHz3jf9jmK2z/1yfIWVAiP2vPLKStRc
         oEXWwSHdCDriLzc8UIpFrTUIE/8UkUlftFSebh7rppMX1tM04YL93ElW0Wufi6RrWjSg
         UYRpHDR5PUB9tCGK/lrsSCRjVw/ArnkB7kskbPRNMeSwmss8J51nh3hfe3jFJgiPJGoH
         oUtcFsYnaEUWOIBavQ3LuEzGYdn7iujcPGOqlC5Izns49jgYlHfefUH+p39m/wv9KckE
         cURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743497322; x=1744102122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt1Nb3A/KQmEAHpUtsnXqXFTpyRKk6b4Ck8YXLkwgWk=;
        b=ayGEpk+JHM/I8vobG7FMlQGtV+BsMheZM1QQcE1jZbDDJp3pOgZmDhJ/BwgB//TFbx
         3LjLKFr6SO3zv+Sh3P1tcB8Fn2FIlDb1yYdjwxB9x9hRL0xO40UW/Pbi0Qrw28BRW2Zn
         NH6uaNfKykW2tzXkIujgsuSnJsTW7qC+eGz3M0k9Xk6W+afGUCRhRPYZx7Ozt/Z61MzG
         fud8JptABlSvqZ2YkwCMzSN9wXMQBNk0KdPXC72X4eT5lg9H5bfd3WetMduilwAtx7A/
         yPjqcVbZeOB5U6Pa+8WKAFJU7GBmhrc6woYWQGrI7Nx7mRsmeSOrkue4XTYWe+pWhDxe
         rwiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvtO01hPaoPMEnMALERLQqEQgMyvVlay+9WRAywbtl6IYQBj1ocY9OtuiPuTYebYiJRUISBGzPJUvHsao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfTaG0O3pA/sNLT2P9gysfwk61oFKzylu72arqHdEc1g34QNjl
	yu3DtiYPmKsSBKDy4zwpnuhlyVEoXXtpeS5FQHr0qjmDsknnLY+f/e/36LonLog=
X-Gm-Gg: ASbGncvU3NQ00HHhP2CyC4ssnxIIzgPJ8w3rCTKirrTntC5ylXiGXRw4EI9UvuKYFXg
	whvtVAOGAYi0S5hu6/64y0P/lGrNavfBl+gXFMqItG48nnbXBqF/d1daXvNyCEEuSqoFoNT1and
	vJZXhAvkfeR5o/ClBI6zfUzrgMa14a+XBjmDao3YiAuASOUKhMrm6LsEMX08Yy6pNSQg1yturca
	MT8E/dCbYjD7P55OlgnudBH9QhFyQEygkliJPyTF+HSuXFB/XwFKKTTfSiMu86+uoGk0Jf3CQVc
	POHYSjUoLtwzca2f/6dQsLh5jiV4IfcKX2wN9zrSc/rM0Q==
X-Google-Smtp-Source: AGHT+IFL1sDm5En/LlSUmAMxBf5diaA51dnuNOwJd7pAb4DGV1ifvlM2YmefBPSpaQm0iOm9Y4TBaA==
X-Received: by 2002:a17:902:e883:b0:224:fa0:36da with SMTP id d9443c01a7336-2292f96200bmr123211785ad.18.1743497321681;
        Tue, 01 Apr 2025 01:48:41 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf688sm82999155ad.121.2025.04.01.01.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 01:48:41 -0700 (PDT)
Date: Tue, 1 Apr 2025 14:18:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v1 08/10] cpufreq: Use __free() for policy reference
 counting cleanup
Message-ID: <20250401084839.24udjvxxvvg3mim5@vireshk-i7>
References: <4651448.LvFx2qVVIh@rjwysocki.net>
 <9437968.CDJkKcVGEf@rjwysocki.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9437968.CDJkKcVGEf@rjwysocki.net>

On 28-03-25, 21:46, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Use __free() for policy reference counting cleanup where applicable in
> the cpufreq core.
> 
> No intentional functional impact.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/cpufreq/cpufreq.c |   57 ++++++++++++++++++++--------------------------
>  1 file changed, 25 insertions(+), 32 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
