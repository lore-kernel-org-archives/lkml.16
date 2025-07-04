Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EB31E4A9;
	Fri,  4 Jul 2025 00:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751589934; cv=none; b=Rw1f7enz3gEY64dvKhMGMGIcCU6HYCcIrFrgJZ0Th5tl0rcpLpX58yOABhsU3jEo+C+LY5/+swiCJnlaQSQmeOFz7vFrWkWBS21JqZHU4rgcDuWv9APgZxtMis3qAa1ISs+gtyvPxhA3OoXoOuc1I61BwEYAPOFLPFDQceSjjWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751589934; c=relaxed/simple;
	bh=KuNeK4zTpBo+7X3UthfgBzmB2v4rD8I8vRbO5/dlwkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WHx8zAbxwcs66r6DWXCanGUak2yRBOutxkH7XsKFDsVB9XhcVsfdnQINEgQAHrr9BNlWWzYFb1jnTj61pARIMrz71EM4BIyGfJA3x9mjE+0CFKNeflvi7DoQPuYdid73J9aALIfjZObDMJiFWAOp6eAMm3bV1hoR/HiDbQWyfwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDF90E/H; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDF90E/H"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748e378ba4fso695201b3a.1;
        Thu, 03 Jul 2025 17:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751589932; x=1752194732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qDsiobw7Nz4ZdCG272Kd4BIeWOznbg+2NwLFATwKqK4=;
        b=ZDF90E/HosQv9RCnJMIpRIVHfD6IpxTy9S4RPPftpI3OkljyhSz+7iF9dLfF2LCmVE
         TU0I4E1xR277NZ41X6aQ0f2iMEXtCFj9lmPgkoIJ/Tcs3gYcWGgAx0fcvS0lsbaXEP4H
         2dJKxDOSm6sfmeuBkFNmK5rbihZsM1YP3ohRFCb478zeSezjCjDeeDKra1KIQOX74p+C
         7c4CNv9e3ZJydgvP1OKpQoGHdTXkZLqPNPe0Jioz0sjMV+DwwJPEz4OIBuWZ+8B8n8yN
         sh5refObO7FuOBNzxYb6aXoyT1KZVUD5hmzG5atRw40WNNQh/qGyXHpOuaMicVKSh1iD
         3OYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751589932; x=1752194732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qDsiobw7Nz4ZdCG272Kd4BIeWOznbg+2NwLFATwKqK4=;
        b=UkmcABr16CWVF0wqOYTQ35k1aTBKT8wBniwZgaNpvBRMbzrDA6l1k9fNXCRZXq7XrY
         4VRzUKvegebUxOgRLfMutWItQqSW1YwkQiA+L62Zt0vtIcfrgvgRDK54E7AI6G2NlmnL
         cbULpFfPLsTH+fRGAS2y9l4Z+cz2Z4DE2CA7IXCzNNcDw4iMNGO1epUD9uxuzrm6Ufzj
         F662CSjYBV3Xqj7wdvfCOIGa6+T1Mj0AxdE+c2lIoExK/N1AGa0cBOcpAE3rHX2njPN3
         KFj84kwyPpaae1blU22VH4I5zIOeh0/En9UtSgFgUnXQmhdvuBWokzJ9r5Dn+OMSBkRi
         mE4g==
X-Forwarded-Encrypted: i=1; AJvYcCUpczbV8ne2Vn/8Q6/fPzKYJ5skjDb9tjeS6Y1xfN5fbX/LYhnTnxUFufj87SSc70Vt36+nc2cJ3bQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi5JRH9N97iOMu/Pc2p3Y1nJMW9WoC+PTP65fsfZP7IVQPBNoh
	LUMQYL8MiRwcHwPhJVuYL6t38IIcfdcjFJZNsv7KzKun4fmv0/dpOfN8q2x2nQ==
X-Gm-Gg: ASbGncvMN/1ljPKdbZ1r6t3fbUm/4/LkNvLZ8a6WkNAkowwsPptAJVXbiQZg44J/NsQ
	gtQdLvl4bhOE3enKvDe7wFNGgPJZDBYaz7nZpnCPQVSwOslLGFhMpLLysst0jtB6wpTZw3Nwd/B
	JEqzfcUNWfT+fFsGaGLPlHLiiIGqSozvo4SXBQ9GxETAy8WRqnk2wc5/U836DJTExUHHcJ0imXW
	Sw9kct6bGLCwGJqRWHz4u6NhSc54PaxYQDUsAr6ObMZvQ7SaYZtn/wvyheAAgAyoDbvJa/WHbWZ
	yOdBV+dAP5jcskRv52QSmCdItGGe5aYSfa/yabFwKKSpQm5mMDUhyurniPLMv7bU/NvwyPfJ86+
	p9TwwFUXERGWx90ug3RUL9+3QEoFWOvm0lBWVKdeBVWI=
X-Google-Smtp-Source: AGHT+IG7evbZKac3rDdr2HCLFM/y1FhB+TTx5Q8JT1powIRmDPSlOSbyXc5Lj7mVxKRa40pl1bkCeQ==
X-Received: by 2002:a05:6a00:22c7:b0:748:f1ba:9aff with SMTP id d2e1a72fcca58-74ce68e4dbbmr897136b3a.5.1751589931895;
        Thu, 03 Jul 2025 17:45:31 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce429f518sm627144b3a.121.2025.07.03.17.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 17:45:31 -0700 (PDT)
Message-ID: <60c83207-c4e0-427d-b543-988230a52f34@gmail.com>
Date: Fri, 4 Jul 2025 09:45:28 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Further kernel-doc tweakery
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20250703184403.274408-1-corbet@lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20250703184403.274408-1-corbet@lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Thu,  3 Jul 2025 12:43:56 -0600, Jonathan Corbet wrote:
> This is a set of miscellaneous improvements, finishing my pass over the
> first parsing pass and getting into the second ("dump_*") pass.
> 
> Changes from v1:
>  - Apply tags
>  - Rework the KernRe microoptimization to avoid exceptions
>  - Fix the stupid white-space error in patch 7

Tested-by: Akira Yokosawa <akiyks@gmail.com>

Thanks!

> 
> Jonathan Corbet (7):
>   docs: kdoc: don't reinvent string.strip()
>   docs: kdoc: micro-optimize KernRe
>   docs: kdoc: remove the brcount floor in process_proto_type()
>   docs: kdoc: rework type prototype parsing
>   docs: kdoc: some tweaks to process_proto_function()
>   docs: kdoc: Remove a Python 2 comment
>   docs: kdoc: pretty up dump_enum()
> 
>  Documentation/sphinx/kerneldoc.py |   2 -
>  scripts/lib/kdoc/kdoc_parser.py   | 150 +++++++++++++++---------------
>  scripts/lib/kdoc/kdoc_re.py       |   7 +-
>  3 files changed, 79 insertions(+), 80 deletions(-)
> 

