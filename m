Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19C5236421
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747814801; cv=none; b=PD3EzHR+a1pW7SKhndi06COF7fGb0Kes7nV88SwtLkoAFZwW2UHICwoZl3EP+R4MpVoIcqqlqYTVz1XZC1bF14zrRCgeIDJe6oCMTYHw9r5qHRGr8J8czKCc4H/zU5NZ6nCbJ3Wk/YjzaWAxYUAtcsNP3G3+JtFcx/gRrY5ZBKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747814801; c=relaxed/simple;
	bh=vZqa7QqgtnSp55HuRvtuDX+8vOfAactf7efmJjZGr04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j050j55rmO2fUdyz2Ewh0bwbrdhuFmwERkc3vc4WFyVBEL4Jw477vRU995d1M9IptwXwgngf6UGgJqnoWKvNsgbMnChOV14eH6PVT1pFSGJcncL/hCTVDI91Ea8rMwlk1VT6P+gMfCcslcHkjDFadoVnIijnnhJkB1f69oMBLK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=fEtTnU/7; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="fEtTnU/7"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-231e331baceso49433085ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1747814799; x=1748419599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pdXlyN7IyvbDBMyrxaqm4MW5jGasMnJapEHCIL2mBk=;
        b=fEtTnU/7VjidV8wKgo1Sxls6m26yc0gQSxCGw3Kl3oQnaU7X+ZPlQsoV2bj7f+dNtG
         RhRXLy25stYuhnrhZxmqWdxkHQiA6U4JANbWuAwwf9zLpOxqC/Nj9EBUbkNTDu1AuY+n
         Y6uO62uXgjGyyu+NOXvDvoK1AZFiHF1ssh0gUSiV92HjmA8r1J767ntHE992z3l/8oF8
         bZq9bePiNZEYzSTaUkWfI2XCYhEtveVRRQFXks0gss8bzau1AQhsSvA8D44dD7/82WF6
         8MV+8jy/9uNMP5hqMLQIZgOvwGu2LBAG2/+3gK+izbZqA4sHMbrMW4D003Luaa5XlnbM
         6Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747814799; x=1748419599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pdXlyN7IyvbDBMyrxaqm4MW5jGasMnJapEHCIL2mBk=;
        b=j/u3nN21Uo/7CeqcjHjaEZDGYTooUo0Kan2BOW8+FfIIsAoDRo04n0pMBsFEgsaeHh
         KVmSrhYIuy8TJSS3de70LNUrnw1IS8FtREZAJQN7FM0qOrggbZqqpObz23EQPU79w9Ti
         U7dZYF+MkeWIzlYEJFdyMfCEs+VSVWHLMnhr3zYv0aV/OUlvOQLUbW1ek8xSrifSgias
         v0Ct6k4rQDTco7LEjGahoIFqeLkUHAMaqD0NlbvxywZAEx89CdWFBHAE4wej+/zC0GCL
         0bh6QmvfP9UZbGPlKXNyjEeNzzGeiAlpJuhMa9a34WjTUAEG7AZyrE8YscvGF82QJiHF
         RWSw==
X-Forwarded-Encrypted: i=1; AJvYcCV2i3prrcCK2RvuD2+st+BfIldOMzzvCbh6rpxLDDHE6u2LTFau5zOO5C7cvv/bvhaDcEGA/aJaGBWdOZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4nPZzyrPjJKl5vRCB8U7yW4FCNLU4lvISQJlIgAQTA/GjgNwy
	ZWWezLnXcIxW0IqT6lhlZ46TAvCeuYIUXcaeWxwTwyfPd7KaKYhSQAb52t5K0L06DSKHb/jNW7t
	BTRIC3AmJpPm6SA9yRbFNc5adKW4z2ZAir1ZzjA2PzA==
X-Gm-Gg: ASbGnctjE7nkK5bsQ9Mud/yCsw04zygJ7QuiS9MnTWNJQEz5xhw75bzJ3/l9uZlb7AX
	cNfI/1YfTyQgFIwWakK6uVDhNPew4DwN0xHqSOTBf4cYoxEv8MCQuN3Tx0aVwGLo2Of0jsxW1iD
	ya1GI+/WLMUnQepTTN3ONqI8HFy56GvL80
X-Google-Smtp-Source: AGHT+IH8DuEEvWdJYePRJFj9EsmVuI3c/VF6QNMD7FNOGA9tqxrDD1VHeHav+B3+xGsZ7taklXBLW/jmBwwiWEj+LHI=
X-Received: by 2002:a17:902:e54c:b0:224:216e:3342 with SMTP id
 d9443c01a7336-231d45ab600mr292557845ad.43.1747814799030; Wed, 21 May 2025
 01:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520125810.535475500@linuxfoundation.org>
In-Reply-To: <20250520125810.535475500@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Wed, 21 May 2025 17:06:22 +0900
X-Gm-Features: AX0GCFuegfYXgvNDF5A7pd3344VsOpt3BHbZs1QL3qKaXeOd37d7EocBJK-bb9Y
Message-ID: <CAKL4bV4vnUVisBk1OZtJU7LF6h3RzKsTrTkY1pPfExJymC3x6A@mail.gmail.com>
Subject: Re: [PATCH 6.14 000/145] 6.14.8-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Tue, May 20, 2025 at 11:24=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.14.8 release.
> There are 145 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 22 May 2025 12:57:37 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.14.8-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

6.14.8-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.14.8-rc1rv-g75456e272f58
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 15.1.1 20250425, GNU ld (GNU
Binutils) 2.44.0) #1 SMP PREEMPT_DYNAMIC Wed May 21 14:31:31 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
