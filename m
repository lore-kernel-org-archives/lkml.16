Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9062D1E32C3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271780; cv=none; b=aim/nfAUYS2tVlMhMpc6OwK0uFgKwmEGIzAER+HU7/Pqx1lVXR0uc2vWxLFM2ilAz7A5NqYl4qo/+HxOjWie4TvsO7SYqkppI4zzVp/06wKN5AB8Hr2ifZmTFoagVcHS6YrjihoexDwZRtleT5NAa7XRHStJ8Nt8ceMzsJ3xUuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271780; c=relaxed/simple;
	bh=QPVmfG85Pv08ENb66VI1j5/mFALeXl3IRPP/u81nJD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+BH1lObg5FUAsT++Q20zqq1wV2iwvnHVp/gJpD6I3RTvG5i6inefXi6AvhGCTuKwiKUn9mvhAH3RpaQIyZjoYWQTI3N1++JlyjHq9gnom0NrRK9q9RZmjct4wJ7ofQ3PoUHpwu6a8jkIztRzYg2UBfZiIkdX/BrrGgKqXditqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=cMTbaFvZ; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="cMTbaFvZ"
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=cMTbaFvZ;
	dkim-atps=neutral
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 2430298
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:50:23 +0900 (JST)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736cd36189bso703175b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1744271422; x=1744876222; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zI8FWvqkWPehqKj4Irm/YiRMxVqaxvlH7ZzjRgOa/ao=;
        b=cMTbaFvZiDwoxUzoTcEgBzdiMj2TakwvA5TiZBqsqUmlNSFMn23u7qdLKV4huEDqIg
         O8LQvkmaeF7G+51CrKtscZwguItmKH1oi09Q3vYOBd77DmCD4WA7MpbcRt58LXvHG5rP
         PNedAtP5scdxX3wexjk8d8QUPrpjYr+8fURT9qy0M4+GPFXVoyvOJLYHQH0bvj4njkyN
         Pv9adb2y6pVQjh76ABIoFZF0PbbsH7tD3e5w/OX4LSGkUFzn7XsTTzFnDZwkc1ScS1UA
         osqSiaRrK8v2UOswW4FmrawerQfkL37dqJ1rWSIOapVqcCxbp6AUrLrShG96rmDoD0Gj
         Rwjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744271422; x=1744876222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zI8FWvqkWPehqKj4Irm/YiRMxVqaxvlH7ZzjRgOa/ao=;
        b=eTexMhy/FEihNJeL1G2sXXHhReuMF7/S7gya/zgRhJ0Yh21McF45OvfIih5+T/eMNC
         BgvQin2aGWqflh25Brj2sEsQ5iv2ZtOOEC1izhnU5JVfVIHvHWfQPWs3IRbgQoAatS2t
         56IKnm/FoKUNpWOh1cQqAzSQAvQ9T3B8Q8qKxF+esRXnstdz+xeG2SCY5IxE0QFj7QJ4
         Vb8s4G0/wpKIVwyhOQlWbZ/gXQjcpjOBkIC2sze3O4DSc6Fwe+xhMjswhDTYpG5emiKP
         HIb1yv+U7//oYoXFPzIqwE9gEXXJuEY5OsNn1Jry+TZh4RSffy3xyRgP+k4K2mb0PR+h
         4wWw==
X-Forwarded-Encrypted: i=1; AJvYcCUlnR3BqhwnBLWkjwl82C06uvoJtekpf4YjOrB0U4dVQQYCLd3OMwqdzstYvg5u/bKiOJfs6Eab4s9iDHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfdFNpw6EAAvPqXjPw2LHF0c+I0Lwktq8ERN/ObQfWet9awfQU
	aPlOamx9yG2opkqhc1i5lVB32WPpSxqmD8/J8+AjVHJ1DzhDnZ1IdoYpzNLcKsJBx387PnPEYHF
	x7obsrjBxcbYHkr34Gf7+4enljuTxn7F02Cmjcd342L6l47vLg0PhlsUcPjx5z1o=
X-Gm-Gg: ASbGncsU7BjubSs06Fp2jlpjFmJn+WHNrdQwSvFNL/dMP7sAtq3LEeWQx04TTJFQAl6
	/yjNzk/yaljfRriBoWu0o6ymbocBZ5JOwef4W1MzGTfFNVp92gER+/APDglaiTSx0Zdmm7We2Wm
	9jd3RTWWmkRj9MPZL5uVFJmqWxC9I+62mMF+m9bWk2bO7yCgRmKCl+P7hLu1nJmhNuzAO+vvmYx
	f/Yso9m/xjnP0WMmGx+2Mk/MFe6LrT/4oKkWE/8APtfLWLYe4L34rGl2xFHEQKz93xMMQYy6qLU
	/8EHIfV0c8ATR+jwDerQ6/9li7ut+OVgMdKJezYQE5LnLWLixLAOiaWzISihJXEljEk2XyI=
X-Received: by 2002:a05:6a00:3a0b:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-73bbf01e01cmr2458039b3a.21.1744271422086;
        Thu, 10 Apr 2025 00:50:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHG4WTCFiCZzKFbEqwBIEaL7Fn0aSCHk9N1v/EMTUYYQLaZr2byejL0KAEY4tDGPPOiIxiYdw==
X-Received: by 2002:a05:6a00:3a0b:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-73bbf01e01cmr2458005b3a.21.1744271421600;
        Thu, 10 Apr 2025 00:50:21 -0700 (PDT)
Received: from localhost (162.198.187.35.bc.googleusercontent.com. [35.187.198.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e51ed7sm2592923b3a.155.2025.04.10.00.50.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Apr 2025 00:50:21 -0700 (PDT)
Date: Thu, 10 Apr 2025 16:50:09 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org
Subject: Re: [PATCH 5.10 000/228] 5.10.236-rc2 review
Message-ID: <Z_d4MQP8_WJXxtzs@atmark-techno.com>
References: <20250409115831.755826974@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250409115831.755826974@linuxfoundation.org>

Greg Kroah-Hartman wrote on Wed, Apr 09, 2025 at 02:02:11PM +0200:
> This is the start of the stable review cycle for the 5.10.236 release.
> There are 228 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
> 
> Responses should be made by Fri, 11 Apr 2025 11:57:56 +0000.
> Anything received after that time might be too late.
> 
> The whole patch series can be found in one patch at:
> 	https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.236-rc2.gz
> or in the git tree and branch at:
> 	git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> and the diffstat can be found below.

Tested 5b68aafded4a ("Linux 5.10.236-rc2") on:
- arm i.MX6ULL (Armadillo 640)
- arm64 i.MX8MP (Armadillo G4)

No obvious regression in dmesg or basic tests:
Tested-by: Dominique Martinet <dominique.martinet@atmark-techno.com>

-- 
Dominique Martinet
