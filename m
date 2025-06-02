Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E15A2C324E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892278; cv=none; b=ORt8xHFdh27OVwSyDiiZufih0vejJCX/NyLU4kfBaJIH2AnVunjRVY70CxxHzjKRcREw5lA2RVae+YF3IZFXzrSe13rwB3R85ZwM1y8Q7YXAsdkGNKUMd15E5Rv7GNAXcHG0YyEkQFKvUGIMNV85m1TMmJUmLCAvl756saQm5MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892278; c=relaxed/simple;
	bh=tuwqe87VdwziFvbz9AdK0h/LOxYJMXn8i8IpMj5T0BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PmQs7i9T3I1J2X7X8COVQvTG440GjwCM5cwSSv4HnlxiJBSq0mRPnF3VOyxpqgU9oL0xjDPExgczngytT61yU+SxRnRlVhRGl2tyy4o8Gar+2hLDhW2Ka2vOH1dufNh9eYAHPhxpiUK7E1WjgHZjS0QA/PiQlw0Q1lbd98LPciQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjDUmDKA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjDUmDKA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0ac853894so4576453f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748892275; x=1749497075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8m6SvceI4w2fX+/mSIf31z8+GL2GuOXNwJxTgqZqfKA=;
        b=TjDUmDKAu0UMjK4v5NMPIKSyvx6zGBkSDLq/hI1fnG4ubltYkg9/lBXqmhdGVu0NpQ
         3SLEXcBj/4+BukdkgnX799x/iobc2dV1QyN31ZuirXMaQy2012nUb5PiG44/bWu8n2Ku
         UKXm+5yIpyQ0eOXZGxp2SzHVR8dFSOqdDoNDWi7NOlhcf72fMQUK2PQrdEpHTT8quP++
         7nr5gqDRILX3aoNUJ+0Yj0lHaZAHHJyaJ9FVN2UmPUFXLOG1dt7wsWKCf7Y+ZShakXu1
         JoENtiWrJGBfSblKpHSyCA3qCFcuaztU83ew77Q3mwoI2/mRxGG9lDN1nTK8TGZRkU7j
         VSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748892275; x=1749497075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8m6SvceI4w2fX+/mSIf31z8+GL2GuOXNwJxTgqZqfKA=;
        b=ps35VKfeSMd+fcEsQE5SdlqVKVSwxmoD3SfpeX/Oth0QLwg4q84jb1mtHzrlkmj5ro
         2zLLLbVSzNDCeqmVd/iI8t9R/U9ngSt/j29DUZF1JiJeAiY6BKv36UMSpcfpJghpxaVN
         FMxv7V2FSXKIKM1ULicWNxkmAXqUMMMu2OtSo582nB3EG6mvVudYTH2fHbg0Vp/H+Tf+
         n8STjXBGa4R+Yh76GMXgPiNDqMhnj/LFJZW/AWtCuvW592hlNdt4bHSHBcg5ZOVEr4nG
         66DwLWxJTD4m7vz0eVFYh+yq3Ls4lmrGUtSSFipxgWDSbJj6lXSghPRUa/SQl+xjkE+o
         y/Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXDssG/BahD5CYc1NmAjMAQ5rpzgo64FbCXzoOAq8/tKCsryfvSkkpFe1EwSMMJcjXcrlJqiVJwm6yz5B4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT2uVyX6oD4DpOXjHIV6ADipHMG63gQ4iB4HH9ejs1C7zz6UWc
	M+yo9HxDB7CYbWkWmBFJjyLw/mES+dwVaCUT4CjGj7E5lDA7GnmEOYxF
X-Gm-Gg: ASbGnctTM7vWtivY/N2dumBmNUyFW9AD7AH9B7SuTNy7IA3ANCdObx47mJzgRipGpIO
	mSnHlFglPqTqUd8urJHZAWwo4Es1ibeeljDYB90+FOJgj062Acw5xDsLdXjl9GBocd4EdvLHHGS
	cCFIEC3X/R4v595/6nF4JDz8BFyQOjRNnWN/KarbCgEdgW0vO+FU/IuRj7CxdgPDS1jEXmTWnW7
	uavzpoYG+poc2+CkOv2cjqjdXYIAVX0abN7BsDS3Y+MetBpDAYIs1DVIKQJFgD4HYt9njwKSQ3i
	NvvCAUR0fM3sU55MyS5IiwXju3zrDsG32Tms+ZpSaP45VMJnpk7XvH15t260xFEfOg==
X-Google-Smtp-Source: AGHT+IEWlGVmcNdwcc1WhsAIOXfGzocOIIKwmPag7jHCLZm/M1bXamrXvTSGo/Zkn2eB4BjAiko9GA==
X-Received: by 2002:a05:6000:420a:b0:3a4:cb4f:ac2a with SMTP id ffacd0b85a97d-3a4fe16aa9bmr5879577f8f.21.1748892274428;
        Mon, 02 Jun 2025 12:24:34 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb05bbsm131449525e9.22.2025.06.02.12.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 12:24:34 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: bp@alien8.de
Cc: dave.hansen@linux.intel.com,
	hpa@zytor.com,
	jpoimboe@kernel.org,
	khaliidcaliy@gmail.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	pawan.kumar.gupta@linux.intel.com,
	peterz@infradead.org,
	tglx@linutronix.de,
	x86@kernel.org
Subject: Re: [PATCH] kernel/cpu/bugs: log ltf1 mitigation status
Date: Mon,  2 Jun 2025 19:22:44 +0000
Message-ID: <20250602192346.654-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602090942.GAaD1qVv5182lZSPtK@fat_crate.local>
References: <20250602090942.GAaD1qVv5182lZSPtK@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > Log the L1TF mitigation like other mitigatioons. This one is is the
> > only one that doesn't get logged.
> >
> > Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
> > ---
> > arch/x86/kernel/cpu/bugs.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> > index 7f94e6a5497d..38cb2a1b2849 100644
> > --- a/arch/x86/kernel/cpu/bugs.c
> > +++ b/arch/x86/kernel/cpu/bugs.c
> > @@ -2803,6 +2803,7 @@ static void __init l1tf_apply_mitigation(void)
> > 		return;
> > 	}
> >  
> > +	pr_info("Mitigation: PTE inversion\n");
> >  	setup_force_cpu_cap(X86_FEATURE_L1TF_PTEINV);
> >  }

> Pawan, what's the story here?
>
> There's this stuff further down in that file:
>
> | #define L1TF_DEFAULT_MSG "Mitigation: PTE Inversion"
> |         
> | #if IS_ENABLED(CONFIG_KVM_INTEL)
> | static const char * const l1tf_vmx_states[] = {
>
> which comes from 2018:
> 
> 72c6d2db64fa ("x86/litf: Introduce vmx status variable")
> 
> I guess it is about time we made this mitigation also follow the common
> pattern with the mitigation strings and issuing them at the right time?
>
> :-)
>
> Thx.

Exactly, this mitigation is the only one doesn't have string, 
so i thought it is odd. Not only this but we need to make all 
mitigations consistent.

I think the commit you mentioned (72c6d2db64fa ("x86/litf: Introduce vmx status variable"))
and mine have different context (one related to vmx and other common options), and i couldn't
find any string to express since enum values are basically different. enum l1tf_mitigations 
seems more general like "off" or "on" doesn't dictate any special mitigation option. So the 
simplest way maybe is to print the string like "PTE inversion".

Maybe we should move the macro at top of the function so it can print it. This is the only 
information we can print about L1TF mitigation.

Regards 
Khalid Ali
