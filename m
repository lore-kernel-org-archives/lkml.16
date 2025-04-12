Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845AE19CD0E
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744468127; cv=none; b=rXgWDYzgMyhlU8dnnGbhiY3lkMa+PE7Xu3V5n2NJLez5mQb7Wd+pD+uC/qyT/DIE/IItVNQaZy1yxON1/04UJSyVUwBQ5XDOaPUW2woCL95q2LfKXo+lB5DjyMO3s77hyeOritDisSnwgpLZ9d9yQ3aAufYuZYDsOqtwbFwh1uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744468127; c=relaxed/simple;
	bh=Q4Xi4+EuBWmatlDXOmN20GwswDKxKmLUhLfT7gpY0hM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtbDZXOMnSdLER97DGPfoDCjMlIl00BmImZi4rVtN/+ZM5ZtnF8EWAbqoFpf+1a2IsQjikcLUEdCWdJ3Pn/6NsRB7kTD6nq+Xf+VmuVL74y8W//Txx2EhK3Y6QkRaOpZZX+NK9q3Fw1I1bGWWD86wwX2wLzaxZzJeY3AeLpjg4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=djrcA9oJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="djrcA9oJ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso32576495e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744468124; x=1745072924; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yug8Lg77jkFOaaSI2hhnGA0YoGthbaYjMrZs5RGYQTk=;
        b=djrcA9oJvz9bClgvpxto1kzf6YLvfDHxBu2JwvylLQVg4ANvAt26mricfETIIaDmBc
         Smz0anvwR1+2bRG97KkarvBg+1zlnV2IPSGx7Os558R/ua5sy18E2T+wxQn+HL477iB5
         TqME0tIqJDrq3jSj5LhgK80IM8tCpN0Lgv4efP6FzGRL3WbXsHP+eHgUUt+BnD5MWPOl
         eEcGflERTq2eKTfzd7uMPdexc8Rj86nL4FRXQjorjvoOopSLLHRxWbQ1ERla2zD4rmCM
         TdYhLL8cN2ZbqfBLfOiPyFIcD97tByoiU7YH18gVlbht42FvCDkvospAU/SzojiCDu1g
         3LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744468124; x=1745072924;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yug8Lg77jkFOaaSI2hhnGA0YoGthbaYjMrZs5RGYQTk=;
        b=t80aZ+iZnjXDZmN08Sy/tGD02WTE6gX0xPBS6ooYHUMwiX6/okCT/aLP0bZHWj9MBU
         n1xqx2ZB/vqRzrs+RSQ7T62XAIAC56SKuYOL5u8A8yfdYoa9dzQ4Xy7FlozrsCCo/+oc
         BwStenDVMGL2gYHp/wp3O1kEHrtSTLi/c/GuamxQ/vSk1+gLeCJHHxAPnT3LGIddHWDX
         YIQpfjLfKA2nYM5MnUMuKOTBr7wPi1J8Q9tF3lJTIqBZ1LkPfKpu/uqsM7W+13vtbWct
         fHj0V6KNLXvP0fWFGWID7HAJ5uP7EUfSBBg8pTWOxPe37LxxnRqxDR8zaZkyj64jZquY
         aAgg==
X-Forwarded-Encrypted: i=1; AJvYcCVHulh/ToFnS4J2Tps5HY8llUt1mIAbYJ8MWr5v0fzj5Il+lyn/1Mnincj2YY6gAbyjJuO+SWepNpSAdJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54K50mukEWs6FmVxVvv7/VZ7RxNzoUCkrtYjRa5nn6gygR0Sd
	s5eKEgpdLJoVeEqM816uAErF8Msu0uVczy/926xnZpjFTIMHmoVXj1OFcsUT91U=
X-Gm-Gg: ASbGnct4lJ+Xa1aFdn5FmJKLrKK+TNpjULPqT4atAoM1WCnPAYP/bSFH4tiom92FHi8
	SYzRrRlnHbuQbnj9xgUkrbLU5bJ9OsdVfwt0tk0JEco3c4Wq7GKj2POh1HA38JINfvaKPvT3t8/
	y5jG6i2UECBEX4J7LctCuyWnYNRUJ83QaCqTjvVJ4cgFcVxl4pX3zmM0t8rbLkbNmd3HfI7Dfil
	kTHcRNr37TAPwiUqlxPwjBBREb2+LXCsCCXGPybWRjL2iSCO8jDIJY4twSq+QwcmTjtvKT4JU7b
	Po5py7GQ0Yr0HFYtMx2V3jvMC/uxNMunWcJ1Qpdi9PwxQOFIhU2OBSsp
X-Google-Smtp-Source: AGHT+IH34D5glm0+0TkKdRd2QqYl+pfjKMVxmTngaZruRkPsk03mWnWy81pDX8UHh5AZeQmoxzxDVQ==
X-Received: by 2002:a05:6000:2507:b0:390:e311:a8c7 with SMTP id ffacd0b85a97d-39ea51ecbecmr5651152f8f.5.1744468123668;
        Sat, 12 Apr 2025 07:28:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eae96c074sm5086157f8f.28.2025.04.12.07.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 07:28:43 -0700 (PDT)
Date: Sat, 12 Apr 2025 17:28:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Yadav, Arvind" <arvyadav@amd.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Arvind Yadav <Arvind.Yadav@amd.com>,
	Shashank Sharma <shashank.sharma@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/amdgpu: Fix double free in
 amdgpu_userq_fence_driver_alloc()
Message-ID: <344bcc64-bf13-4726-8530-48eca7d643d1@stanley.mountain>
References: <5ff4d367-b5bd-40ae-9529-56d08ea6c1d0@stanley.mountain>
 <92b7d28e-6103-4c76-17dd-6ae94552a043@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92b7d28e-6103-4c76-17dd-6ae94552a043@amd.com>

On Thu, Apr 10, 2025 at 10:29:31PM +0530, Yadav, Arvind wrote:
> Please change this also instead of 'goto free_fence_drv' just return err.
> 
>         fence_drv = kzalloc(sizeof(*fence_drv), GFP_KERNEL);
>         if (!fence_drv) {
>                 DRM_ERROR("Failed to allocate memory for fence driver\n");
>                 r = -ENOMEM;
>                 goto free_fence_drv; // this should be replace by return.
>         }
> 
> ~arvind

I noticed that when I was writing my patch as well.  I'm always in favor
of direct returns, but it makes the patch confusing to add this unrelated
cleanup...  I'll send it as a separate patch.

regards,
dan carpenter

