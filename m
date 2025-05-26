Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986AC1E9B1A
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252184; cv=none; b=MzPn3gtTl5qaQk7tU/J0hHwt7Z3w3SKGiz8guD4dFJijKBmyyoq8raaK3IrHem5BizxBumMb/xWBXxrhCfNjKK5YGL7qXEc3Aj5vcRP3mgiqZsyrEHWqmeKm0wgoYw5VFt0cofxGxlmkhxxybx0+3bbt9pqFocIbST9DsSvE/lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252184; c=relaxed/simple;
	bh=DDVEnB3+og+dd3LXUpJ1xgMQIwKxMfEZf9aH+Vn41gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wi9I2C0jZnzOq88mRr+DmerOkePUzsz7fFU5vtkmP0ldEyplo6noIaog0LdCJ1iy6nGuFJANalGfpwy4xh8F0WJmTUhwSCp3aiaStdxTmyXSyHbECN78CJ6bx81VWaaiEsfYj8DIY1q30vewUPaT+13dlUyJt2PJ+t3tp8LmS4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=ktyoC3kQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="ktyoC3kQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso14961215e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1748252181; x=1748856981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=akRWiY61vXSqwjUp4+3SAOB/I392KNgK//SHiZbby44=;
        b=ktyoC3kQWDeC4wmZtpiAiPbUUznI8gVoS5yaZtVWmxcjjybi2HGt/IET2iHT3OfMnc
         dk75LavzAY8CxymTk54EL3XxQi7FPtaJRy3dOWf5o66Gp7YSvQJ6RQCXHRIyL/pLJm2J
         J8zHvdm34c+OYYvDVph6uOpUM7MEr32ytc8IphKVM1HRQLeWqUY35RrUSj1YtpP9fkE6
         +JDPEDyLEWcgt7wzyTJTHaAdfLDOKe7nZTc2EImMtaL+qO1bfytymfg51IuCK0+1/fgD
         b2NcujBb/J5Zq0/+gT+VbA2rZXVs9VH5CcHTN86RdNVIRGFxIuljOnAxiDV1UbWwg5fD
         pp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252181; x=1748856981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akRWiY61vXSqwjUp4+3SAOB/I392KNgK//SHiZbby44=;
        b=sE1y1z4PIHjJP+HLmPDfghbH5//k233h1xVUCk6rdKLAMDgY04e+Q0+dyySrSYN0KG
         T8/EVCEhidWTH1ND+HFivGYw9cucgE0gQiDoGVensVfJ2d/a0oZC5GWOh/qiy9aV61Yu
         lqWoSZtn30h8M5y9iQZqHMldSlUAHiEtHTsCN8ofE9raSBugvG+ufkMaRekZ/84BqnUJ
         uvRbSzLVgCaV0ED47REfwRAIkyHvI0O4WbnNOrQjBe0wxkEeeNwzkAGcV0kwRt2QG5OX
         r0QvFPFGzQDfUZV2yvfYrJ0ziy45UzDD7pMwFtr8HGLbsoKpmW974XxySlhOhgrgdYUz
         HrJg==
X-Forwarded-Encrypted: i=1; AJvYcCX+tG90tzoKmTukmlrvvOaeFbQBXYiAZrqvAPwkyl4d9hkRtfdDciYZofyAQXzRNq9pMb6zcg8HQO+iKEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsn4474KrcDVFB4w/ZDFjvuOBBt7ad+gefOrQnfHuZA9B3P1uA
	lFb8fKEBDq0gR2s+bwr/bGrZVm3aQ9dAAVuc6jGguXq3lBYXhvVqYJWka1InJlK5qM4=
X-Gm-Gg: ASbGnctfi/z8H2NL0mziw9NPO5l4wtuyqrzx3R30vwI0OShf1I9wTO3C2clEbcP69Oi
	soa2Wq7+/Gn3uQkRLaWOmuRBiyTaIJajh4R3CDgC9LtZ8UlYCUw7BKNR29LJxrEiRGeSRMT0Hsp
	rQtBTSYedwYNsy4d23Wo2DoHiCE8506Jzx2jak3C3+tbJfJxZkB7X6f1rCSxzAjMtISFHq3fzJp
	uTywkBNJxqZhvWJ92SD2F3ZKsBZE1Q79AUN4ROisFjnkTK8vaDhYgUgZSSkT+fS3iHuy7u3nb1O
	+KLu2mCT5U8qTrkjNLWAmSkavNu+OCtQCtS//Wl/mOx3shgC6naFKn2HTDs1KydiApycnWOuFHg
	D3tmeXR3K/6TLDA==
X-Google-Smtp-Source: AGHT+IHdDy9HaiyBHAWl1b2RTOZvmcqUOl/x5XI+mJD2ZIuIvNRG2stc5RkHbBIlxB8zAvuJ5iXn8Q==
X-Received: by 2002:a5d:584b:0:b0:3a3:6a1b:6885 with SMTP id ffacd0b85a97d-3a4cb486043mr6616468f8f.47.1748252180662;
        Mon, 26 May 2025 02:36:20 -0700 (PDT)
Received: from jiri-mlt (37-48-1-197.nat.epc.tmcz.cz. [37.48.1.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4babec83csm13835277f8f.80.2025.05.26.02.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:36:20 -0700 (PDT)
Date: Mon, 26 May 2025 11:36:18 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org, vadim.fedorenko@linux.dev, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, 
	aleksandr.loktionov@intel.com, milena.olech@intel.com, corbet@lwn.net, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v4 2/3] dpll: add phase_offset_monitor_get/set
 callback ops
Message-ID: <3unqj7hiplrlcaaq56hf24d6vohi6rsxu6b5g75s6aypjwqgwk@hpewzyd77dhq>
References: <20250523154224.1510987-1-arkadiusz.kubalewski@intel.com>
 <20250523154224.1510987-3-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523154224.1510987-3-arkadiusz.kubalewski@intel.com>

Fri, May 23, 2025 at 05:42:23PM +0200, arkadiusz.kubalewski@intel.com wrote:
>Add new callback operations for a dpll device:
>- phase_offset_monitor_get(..) - to obtain current state of phase offset
>  monitor feature from dpll device,
>- phase_offset_monitor_set(..) - to allow feature configuration.
>
>Obtain the feature state value using the get callback and provide it to
>the user if the device driver implements callbacks.
>
>Execute the set callback upon user requests.
>
>Reviewed-by: Milena Olech <milena.olech@intel.com>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
