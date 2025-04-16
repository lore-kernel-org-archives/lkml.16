Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D287207DF8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803844; cv=none; b=B3vwJVfa2CGm6j1X2ngGc8SPjje8OIqJONTcGjYMhFmmvswDznDgUf9TAepyZK3p2eUhvgFkK+Rs3sZ4j1d5IttGWKeSKmMbzbLYWq3QB592xCEK1bYMZxP1ZA0UlOaPevAzBg+S4ZvDt9j9tdktqS8R/4EmOpRtAVOIm3HrNGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803844; c=relaxed/simple;
	bh=AZEe1RfOvu1q7GUgcepVbmiSBnsNo8L/yZQuZJXUvpo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E2YNBUiIRCLTKJCPs/7ssLcfUaRtTNLgbUy8umtwAIk36pFo+mmoQLMONDtrlNLiFfIwqG1LMT94tMhudbDZ5oI93SHAixM7By5mpUnzJZXSULA1GbSYolZvaHZK+VDz+Yss6GuUfGCL+Em/WqXtASaCCaRA5XSYhs+f8YmSR+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGveR/Te; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGveR/Te"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so6327571a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744803843; x=1745408643; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AZEe1RfOvu1q7GUgcepVbmiSBnsNo8L/yZQuZJXUvpo=;
        b=FGveR/Te9l61hgscuALBQoMQk6hob/H/eYGIBP1eM1FmeQmxsMSZ1oA9dg5T6TzRZs
         d/xIdUFVUh6yITbICnX5JkAG7H2ggla0sdvh+rXSqM8L/UsQ+BPX/HEJVIrMJTzXYIHK
         vf2BBIPKByYYVSD17/NBhS7kkag7BLPBRla0ctGCg9fUvyhVGUCW0XBC6G05JbfhbgbG
         zj60I+KWGCreCTdXtpTzm0m+QXZ9CKcHlK+FOrsC13joPzlcJYvdnr/ufn9//zHpOTSr
         BCb7ZjkaZY67xqUMbO3uwbRURQKfVuwnCODljn9xVAFXCQHZar94XTJVTvsDRci8Al/5
         i8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744803843; x=1745408643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZEe1RfOvu1q7GUgcepVbmiSBnsNo8L/yZQuZJXUvpo=;
        b=dCT/4qdJRjO09MGLqNvx/gVNL4N2PCZCK771Dp5CcgJw5o7z2WjWBjMOCRO7le1mok
         cOSEtBqXoMF/flR1WbXNTsCdXRbL+vxM11pgCEsGmxboJm833GKBj7aIBXwkOf8rnG9z
         ofmxjucbmowTsB1nS1cJQhXCVMBTyZ7xgUDQMIBYx4nrBz2zqoxwmeRHMyDTjgdI+qBr
         dUbLuwpjzjpSXyW/FCjSgGSsW8EW44CkqrR6zU2Uv92aXYi0V/eJIrOUeA1bhqhXioE4
         hv5ba+CTG8UUbtD5uEuwTt/uTmdUpdI8BylN/qaYCNpoeeuqh1lxxyRwIY59TC82fitk
         sXtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvGQ4oex6XE4GK09oqShyApaXtMes0aZqdeZKAYIPZXaqKIVlhHNkiIgD2Awg8ItdjGwlYKlkgxgvDsKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLxBP/ADPxrom1eUvH/rAH+XgeUn9K6iq5XU+wp5R0+ow0RBl6
	RMxAz0HuEqy1nFIFQipv3RE0YPIYa8TjRXJvODTHmTnpIBPb9RJfQ0uRLNuGj5vALqxGxueSemB
	JZh9zDCTGXSnFAQ0w292/Xp3TUDPNUoNzvQ==
X-Gm-Gg: ASbGncuhmmiGJ6hbMD1oq6auuRyCE6rTKVLnZV5y3fLilp6TpmiTGOkVZIzr3QMdI76
	HQVbS6Y85rcrQ4WKlzY0FmqsGBuOuBmQd6TIaGuQuze43jCxJQIimiU2CKBYlh8/yLEBH7sXoTA
	4xJPVyokOWLVVKfNAjXb1hliehxZe/y/lZqqp326PV6PcqBV27h1ydrWo=
X-Google-Smtp-Source: AGHT+IHRzDwjfA3VhiXoJ9w7CvBGnZUfl1D3wlF7cVjsZnBUO1T3cpj1g1gCRyxquxD7cm2X4+bYulvm0qakj3Q2+Fc=
X-Received: by 2002:a17:90b:1f92:b0:2ee:ad18:b309 with SMTP id
 98e67ed59e1d1-30863d1de84mr2289142a91.3.1744803842763; Wed, 16 Apr 2025
 04:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416072825.3790-1-ujwal.kundur@gmail.com> <241a9bbb-6d59-4c24-8e18-a0acebc6f536@amd.com>
In-Reply-To: <241a9bbb-6d59-4c24-8e18-a0acebc6f536@amd.com>
From: Ujwal Kundur <ujwal.kundur@gmail.com>
Date: Wed, 16 Apr 2025 17:13:50 +0530
X-Gm-Features: ATxdqUHlTjwJQjfOZfGM2sNeVWakgF2t5Ff-hXQ0-Ap1ykAmMwP7TjWL6pmkSIw
Message-ID: <CALkFLLLKT=4LD_YFJdq8QdzybknRQW+W3P-3GnJzT1eoYuGg8A@mail.gmail.com>
Subject: Re: [PATCH RFC] drm/amdgpu: Block userspace mapping of IO
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: alexander.deucher@amd.com, airlied@gmail.com, simona@ffwll.ch, 
	lijo.lazar@amd.com, sunil.khatri@amd.com, Hawking.Zhang@amd.com, 
	Jun.Ma2@amd.com, Yunxiang.Li@amd.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for your response.

> Hui what? Why do you think that grabbing a reference to an interrupt would block userspace mapping of IO registers?

It looks like I am missing a lot of pieces to do this, I'll try again
once I have a better understanding.

Sorry about that and thanks again for your time.

--- Ujwal.
