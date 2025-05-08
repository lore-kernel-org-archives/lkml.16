Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CFF22577D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710907; cv=none; b=R7qscljo3SKAVi9rgyB1kk7ii1/ojWgAJ0nXIkODM18Hsx27rif0BOjvihpRCTo/PoA08jY7GN9I1DFsaQDS4DWT6njZ5bCkEdESc1uNfB2pdnDbuXL95n7LdfnDF3yBscAuET3NmJKRCZZaAvv++QQRdd9976RNiZwlxk+dLh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710907; c=relaxed/simple;
	bh=+L4RShj5f5vWujBc4hl7X7bkL3O1PyKno5T0QURiKrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RTOShaLR//ldTKtKNs3JJwMcngS6jhSxX9N6SmenWM2crhuyyqY+Le6jMLfB1daLnpi6K9S1W0ytHdIuENZvfVxNU1drenjsX9XZuDvccl8rXvgQ/f8hDqDGBJxaEteaBqcln2ARFtKCp0O5M9rIGuwaz9wO/Qsft5jcYiwGU9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com; spf=pass smtp.mailfrom=ciq.com; dkim=pass (2048-bit key) header.d=ciq.com header.i=@ciq.com header.b=pRWh7vZu; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ciq.com header.i=@ciq.com header.b="pRWh7vZu"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c7913bab2cso103817685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ciq.com; s=s1; t=1746710904; x=1747315704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6+F7sC4lq7A9uwyyHv0JUmrfUrtoSWQI2+38pjZK+0=;
        b=pRWh7vZuRyAPVq0mf295rzpaLpKDMLH1+ZQ8fyMKVbUA1y2oPiQlBRuob790LXYM2U
         K1ryBNP9xI8VEKxGUaFYoU90Lqs9meCEEwslxwmmArPCrbwS1ujYEkGqI+hLNrJp8Z6U
         rbP21HBX3Y7CQnkzvUT8LjU2TwATdTVPJaVS356UeHuBJAnuhy934Jft2JlhCcF04jF1
         wpusVOMDvk87g9zKMz6LfPqQ/ncuCgXT0et6cVhwsA+JePI/T7oJdcZdwlveMloIyli9
         IU4zsOJsIMt07875q2xGPyDDZRUcPkaz/exVWfLXKSu752n9GPT5Q1n7VXUVjUJJsyqI
         zJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710904; x=1747315704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6+F7sC4lq7A9uwyyHv0JUmrfUrtoSWQI2+38pjZK+0=;
        b=tvLqkPji0noKN91zO4OoQXP5Dyyt6PmOxpgMm/O/PlhC7RROEuJFaFEpzP2nHOiWnj
         +kKBD1ZnmzS/1TZs6GbMBWZuudbYkdWCCOma6ICJHJhrkiHVSAJUaaiiMTKR1N9TjdbJ
         iGWKGc4+dI9HAWv4fSU+8ZIRpylXyd9vT6pFWfGaVliMEW3Cjn4je1zeZxPnhVPmhp7s
         4lIpRWyklabPaqUDEa0/cZHIZX4oS4qzcYPTBMwP3i7z/Azq9CM6jQEGzgUNlGj87XpU
         mTnOxsV1y1aszBJpKubtfE430CJHYcH1gFOmksiSVr5cYX6OIjuksCgiGLIfN6mr1url
         uH9w==
X-Forwarded-Encrypted: i=1; AJvYcCULuDY36oe8UySHehgoA7ThFTw0EkaYUHKayXgDkT2TsBJSkUM/9oW1HB7mkO6mb0cLaCVRZSiIOluxXc8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbReGYq/lb8BsVeKSqzf47HE9oXaHqJCfdDxwNhdPZr+Kilbvt
	smFFDK6nNhp+rKvfu+vumTPe9VtD7yNeqHj6MK/YJo0/7ZSdk4HzQ7Z0MohwMlqBysXZhIiTU5u
	CuTdpgDy5D4JcLsRZO/0vMfQHTApFUEU8k1ey6g==
X-Gm-Gg: ASbGncs4OVvps5gVVhR+d19SWdlOevsykfKRoULXvdcVbEuKH5hu8oSgRij9H+rep6N
	qSiArKdHkup01wsQqRM/17t+/gTWLliK0VALD1aaPi0XdOlQxb9qBVrX+iLsruEOYef+LO5eddR
	8w1P8ujzRMvnG6Bd1KdOXLcw==
X-Google-Smtp-Source: AGHT+IFAm5bd005VyseIS1dr9F6a/JBOZzKDKZuZ1gmuo0nUeW1bL4XJmAQifXGpoCCjFyCVBzgF3f33AxU4Tq3X+YE=
X-Received: by 2002:a05:620a:1985:b0:7c7:a554:e2a5 with SMTP id
 af79cd13be357-7caf7405679mr1060715285a.44.1746710904541; Thu, 08 May 2025
 06:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507183820.781599563@linuxfoundation.org>
In-Reply-To: <20250507183820.781599563@linuxfoundation.org>
From: Brett Mastbergen <bmastbergen@ciq.com>
Date: Thu, 8 May 2025 09:28:13 -0400
X-Gm-Features: ATxdqUGQ979zRBf0y1uOq64HSCY88KmE0OF2th89NGdxTXyo1bgCaZ6VsUDVfCg
Message-ID: <CAOBMUvigbAGXoCSVqCz0nZ+7Y9ausHqV01uY1Z6W1jgGJkQzzQ@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/164] 6.12.28-rc1 review
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

On Wed, May 7, 2025 at 3:00=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.28 release.
> There are 164 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 09 May 2025 18:37:41 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.28-rc1.gz
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
