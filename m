Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B691941A8F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750253494; cv=none; b=CuI/lYRZGtl13FOH2oDtZ62qktD6ba/qrHBGObfqI/MOKNEMQtg8eBJuWH8M+VcutWjjfP0ZLojrRm+G/4cF7IjA3DrO/jZ5qnaAZOppHrzZRj8h6XrSL6AoRl9ALuteRnaO7CoCl4leIkmz5mTxQ7zR4wYWinytY+RsPWwMJ5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750253494; c=relaxed/simple;
	bh=YCQ7piH8NOmfQoO2LfFOIy6orTmJbXOFq0+UiqDQBl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ebSKpUZJw2B+TGhPIF8L/7SyyXr8cABYhufT4cdpCxPelfmcgeIXJGIX/M9ehcyrAAilCFnD2hpV/D/dg6QK0taHHHkgA9NzqW739OHolCxktqew5lb5kK5vWWEtDfr3jXsfCyp9NyK+k3gryorW2POnOi6kZJNX9Oy89CazxLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com; spf=pass smtp.mailfrom=ciq.com; dkim=temperror (0-bit key) header.d=ciq.com header.i=@ciq.com header.b=hUv70jtS; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=ciq.com header.i=@ciq.com header.b="hUv70jtS"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-476a720e806so61326411cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ciq.com; s=s1; t=1750253491; x=1750858291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JFwYA/jkfd0hXA7i1wxMI97JhwL3szT+ZlmJ7XxF+0=;
        b=hUv70jtSizaibLqajRGnQHHY1fGo08CZrn7vjQHiP+hx83GB4y5XqUUArm2T0TOShB
         Pqziatzr5rfhXFbv16LDFzBkKviVMIlGDJ6+afJ86WiOo13BxRnrFCnmISSGX09LNcLZ
         rb+44cDrOFeOUFBejwly+H12Sgzjq9bL7MbDhze1L7bjiDnvwz8PesunmNmQjITkBbw7
         bfZdwztzUcXprLBj14+5G7bIfFrz62dTtxtoL6Z2wjWdpK5Vb8t7oYfqq3N5Zv/EHRZY
         8R1hk0yX79d0iYbEKJTh/sx+9vGuUHEFQwdttbeSNGU48BkdI9OrZOFUcdyPUxyCaQUg
         uFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750253491; x=1750858291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3JFwYA/jkfd0hXA7i1wxMI97JhwL3szT+ZlmJ7XxF+0=;
        b=bENhPPhrKZsKEAaRf3/QkZmo0C7pHbaYLDS5qxG4/ZF0qhEaURgnLMHwPTuC7aKLEU
         UeA3mlfEm/rQ9S4rS94J41bBO1xRVWG/LYgV0Vyqo6c9mgWANdkfaLQTN2uw5rtBKc0n
         t+F2A2z9WfAL/PIYigYoLso9XXL2d/WtZ9RBXrnPOun6Vk4loI9M3laxsdvrdSXOAoDe
         xva1I/aiOzpQwyAGQAFT18S2FfAEHFu31DJLLmSQ768zd0Jgm749L0G9HKxO9DDZrok7
         lhjoyiBM0uRNLlBhnh8c7Fpv4Orj45ulxEV2mYdvO3+8hxMy2e+APrHDOWA9GJPtS/Fo
         5xTw==
X-Forwarded-Encrypted: i=1; AJvYcCW0h5OgKrbJ94Toy5Qu8kD/YU3TPuHO/6voQlfejiC8RXJcbWolkrIHH6wC/ZpdW2ZawtBXNxwC4nc18Us=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ/oqyP9SFnxZMA/eglsjseE9KdBQdd1JSo0jYgZ8M5G26LlGj
	RU1d8FAguQ9FAkA2+bFvqf0Zl2IYo3+r+uj6xM/aKBaU15AIaGDgDWPIULn10noBXzoycfj9MPj
	fhLWLQudLsotoDAFkFwDNMB3hAqYGfFvigGgXe9pvjA==
X-Gm-Gg: ASbGncvz0l6jytiQ50Y/KEh3Ah0Q7kVqZOcmogKXerEqUMpO1/jCq0UvZXZn8sv1N03
	+aaoRDnrF9nJcm58LiT+uolGbKWk2E0b/9QhvO2lMRGCeWbfAutKVvKZT3YPlgPQKLBjjBO0Rvi
	5gx6fl7KRsLuRsieObjd56+ipZFob/jfE5a8umriljYeo=
X-Google-Smtp-Source: AGHT+IHvAF384ulG7jeOei9YKbmf1P/jGQ+JufAKN3h671aUCTcCBeKSI6jZkZThCcEJk1d+3d3EccMlv8QdHJnDkdo=
X-Received: by 2002:a05:622a:14cb:b0:494:a23a:cadf with SMTP id
 d75a77b69052e-4a73c5f7c47mr288361601cf.32.1750253491442; Wed, 18 Jun 2025
 06:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617152419.512865572@linuxfoundation.org>
In-Reply-To: <20250617152419.512865572@linuxfoundation.org>
From: Brett Mastbergen <bmastbergen@ciq.com>
Date: Wed, 18 Jun 2025 09:31:20 -0400
X-Gm-Features: AX0GCFv04DSE_cj8v9V11RrtCpU0sN-9SM6zbziDuzIH9xcjNf1-z2uiuZtMRnU
Message-ID: <CAOBMUvie6B4eMPB1fD7jxM8SpL0-oVnQWt4wCHxBHRiFBZWXTw@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/512] 6.12.34-rc1 review
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

On Tue, Jun 17, 2025 at 11:28=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.34 release.
> There are 512 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 19 Jun 2025 15:22:45 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.34-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

Builds successfully.  Boots and works on qemu and Dell XPS 15 9520 w/
Intel Core i7-12600H

Tested-by: Brett Mastbergen <bmastbergen@ciq.com>

Thanks,
Brett
