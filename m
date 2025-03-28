Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F891B4244
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172980; cv=none; b=iGNJcWN9hAySofUdTBs9eUmITrKIT+mXSsQkhKHRWeAyus/azAQSpBX0KS722pllqWeUG44Zx8ZhqNxf4gunDTaKgQblh+gRvMb4FJbH/zWH6jFunXHu+N4FQHpL/W4OfKd8r43eQ6lGaiAuwsunPhwax1Bb8DiQg7BdY8A8Oxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172980; c=relaxed/simple;
	bh=tjAIKgTzm6/MGyLQfjiuIHOp0fmSUV2cxbEbpn84D6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gs3SMI1HvBmg+bUIyEW0D3k7hajWBlzlYSo6CHS+r49WthSQPHdOQMEe+408+PnTet6nl16+4fVoRXKUeAF2kUXEfAGOZ47IY0vjcGHzELwpRcWuO9HGQsKS5w3/1K3h4RB+Kv5FN2bkQmZAtopv+q0c5Ea154hRpaAixGMFToU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h6MWsw6O; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h6MWsw6O"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86cce5dac90so1020264241.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 07:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743172976; x=1743777776; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d6ToKzHT6TF8RQ5+cmvhkhRs8kpZAnpcNS44iZJDBN4=;
        b=h6MWsw6OLcKvHPfdhSUa1cUuFG5eJ+53to9WSwVfn3nQgXOMNN9cRTHMetnBDpWlJW
         l0qNl9hoEPmiOv1y6P+2zxgiTa2JznZwldtZqQoeboGSl0tTS8q9fx5Byew7j5oC4njw
         z1KQheah+DiaEFOooWq5kOCyZy162NNMekhmn6o+/j7o8wmAALfF0sLTZhvFT03oLHco
         uplE6QiR9f8MMsLzUikHuoD8jib4qz9G5YNC0AvnKtn/YBAf3YHcy+XjpKkhpZES4XRm
         lJ5+KSZdMWY/FcrUeyjoQPqz+TsnRle6i9LE1CtZxfT5cBZbfnFue7zGcLggt0gyszbv
         bshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743172976; x=1743777776;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6ToKzHT6TF8RQ5+cmvhkhRs8kpZAnpcNS44iZJDBN4=;
        b=CCxwpabY9kdSmWyKuT14gEagArDoEGVP6KCcH/mZyO3Sqe21eU8aevuJVGdOFmVGl5
         /X11lmnRD2PZlvuFzehcE5szSdk8wQjdg3LPKSY/SN2kRj1Iw6Nyg4n06+WzHz04FBsi
         /OYGb/Ifh2o7rSHb1/29ShwlXkD0rooDu5lwIDtYNKQQ+z/wLuTWa8cjjSJwTx5vFSAd
         Vz0R7KJ0ENWpKwUf6xg1pmlbUeE/I9xLP2Mevh5Ru4niSu5klouIitgWi+P7nHjk/Fm4
         vW4yfJMH0FP68rhqH6/qKtWDgZFgrvjJ6WGrD/jvrdQGY2UDh3hBndMDn5JNjOfHMvep
         UwWA==
X-Forwarded-Encrypted: i=1; AJvYcCUrkLP35BgBiUSaFakivusjyYks1mr2BOH5DzLOWeVC2gxiYTMelv+9z5lrQMtWdHyBDv+bSNtWbZnaAt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS/2HP6f6tEcwNt8OkkwQjlXgS/BeXhcDpCp3ltAwlPsDbm1/Q
	JAFosN2C1CDrifR0rLpQs/TNhPMUEb02EDDUhmZZMlTVR5Bz+vU4yECsY4dmSBVYo650au63xfV
	AYMZR53v5k8nsMVg7ujm7aolNcysc/KtCKhGKfg==
X-Gm-Gg: ASbGncstPJ8i1ecUoAG3pngP5pUJf6QmTdwSlRdXSEu4sdgzfwTxc8D24DKDsLHChaR
	SBXXdXul813+4QAjuKo4kyHMs0wL4rt7ot3TUnSgJzXwrSyuoPa1vNSPI03y4j/+MXD7ZiOmdKp
	JQtGtX55OzBl9R6MJ7E8atwOokgu4pqaYIOlQecZ0MOZpoodzbiha2t/2v+Q==
X-Google-Smtp-Source: AGHT+IF4Hqd0y6tvOBG1L9437crSiShcfp+ae/DQ2Kz7JAQEC4Ms9UYLukhP4MfVCN7OnazqSSf3NmzN1q87oneOTuk=
X-Received: by 2002:a05:6102:149b:b0:4b9:bc52:e050 with SMTP id
 ada2fe7eead31-4c586f1e376mr9399814137.2.1743172976411; Fri, 28 Mar 2025
 07:42:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326154346.820929475@linuxfoundation.org> <CA+G9fYuY7iX+3=Yn77JjgiDiZAZNcpe0cW-y_M3sazhFN7dGLw@mail.gmail.com>
In-Reply-To: <CA+G9fYuY7iX+3=Yn77JjgiDiZAZNcpe0cW-y_M3sazhFN7dGLw@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 28 Mar 2025 20:12:45 +0530
X-Gm-Features: AQ5f1Jrr3okkYsKcySxu_-gULq0rRUbR8tw6Cwpyo_vJOfJMTAWnBOuVF6pmc6E
Message-ID: <CA+G9fYtdg6OopeUQWkVmW9CYoprtqzWVTQfaoaY1vUtXKEXD2Q@mail.gmail.com>
Subject: Re: [PATCH 6.6 00/76] 6.6.85-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Cgroups <cgroups@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, Shakeel Butt <shakeelb@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Mar 2025 at 17:14, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Wed, 26 Mar 2025 at 21:16, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 6.6.85 release.
> > There are 76 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Fri, 28 Mar 2025 15:43:33 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.6.85-rc2.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.6.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
>
> Regressions on arm64 devices cpu hotplug tests failed with gcc-13 and
> clang-20 the stable-rc 6.6.85-rc2
>
> These regressions are the same as stable-rc 6.1 cpu hotplug regressions.
>
> First seen on the 6.6.85-rc2
> Good: v6.6.83
> Bad: 6.6.85-rc2

I have reverted this patch and confirms that reported regressions fixed,
  memcg: drain obj stock on cpu hotplug teardown
  commit 9f01b4954490d4ccdbcc2b9be34a9921ceee9cbb upstream.

-  Naresh
