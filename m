Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F57221F06
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958705; cv=none; b=WtVEdnxmGm4JAH9QjuXf5l+P7aY42nF4ijMOZow9n/qUjp+2ShQJyiSUe7YSsARr267KwzJJpvKxcDNjCPP9xYZJmG9dA4HebkJgimX4zhIQCTWWxHJMs5CbBmZXFuyhrFMIT40IVd8VFM0uMWG9bsqjHvX8oL0h+q3YoIOJvk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958705; c=relaxed/simple;
	bh=rFcIgJL6pSIoKVcI/z9SFNckeWUMqMI1IGtxsU9Wq20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8pUms4uj9iydb91xos7oCg3zuo33VJTH9bZnvRxekGTcwRWg+y/qfrjvkgG1Y6RMXSwQ5yKPbUbOlVOdxHvylopF3GX7zUHq1WwIlZsZGeI76HH6fxGci6zjuxn4sP5D17wMSqiTahk85ghK6VvRvBDHhXd/4xZ9EQvhVCctlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com; spf=pass smtp.mailfrom=ciq.com; dkim=pass (2048-bit key) header.d=ciq.com header.i=@ciq.com header.b=Tam+iuDd; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ciq.com header.i=@ciq.com header.b="Tam+iuDd"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a44f51bbf3so39166111cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ciq.com; s=s1; t=1748958703; x=1749563503; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u43wnlxB4xsEV+8bCEfmi8jE6ClnVJwePdx4GrJSMeY=;
        b=Tam+iuDd7mlzOdtC5wy5g6b/AI1/Ns58pbnICy1R4kCvH91vw0T58ESgqRnD7Jxb1v
         jDqzYlzuY6+vEwi1UCGU7AWlI6prOPyStSTJxORqtiJYlRiNkrLEKkEmE3uVuh94r8eH
         tY7AK5BA11WHAI55xAVyfX8celKhXQ+trMWPuXNxMrykG77rV4Ktkkw7+OwPHWzywNgC
         fM4iy+5uAwrOy3VGxHNqw2QZeU58F0U+N8ZKkBAcnn0csfASwqQZBLgpcR4tiRpfJmSK
         XGv7xkr/CUN010+Z0b8jJXPO2/4BPwjnLhHJgTJYmojrL1CcbfbInJzG0qdEi9H9FJsX
         YtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958703; x=1749563503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u43wnlxB4xsEV+8bCEfmi8jE6ClnVJwePdx4GrJSMeY=;
        b=T4rQE+ADm9YuqlV4rJ+279gr8dCacIpi3FUGvtU/8m4wUZJheo2iRdLdCEhPFOvFnT
         0BkWT2uydB+1v6cTiIuh9DZJLczJtSFUkJtXzra+AI1c2JdItRKR0mo2WjI11oc0XmXE
         ghHBjdL3zMd0S6lWA8gX2MFuGvIV+XlGGW8GiS/VeBtYW99rQTeg8QecK1wiEQmIl41s
         GyzEr978H+s/4XjZ8e4ZwuPGB+FhIcW7jnLe5lbmxmGa830DxFjcELOUYqBVgGSVjgdi
         uUiTnZY/ddFn31BJ55aIVt+ln5TZ9E3BKZu//1z9rkpFhaSofF7D7JqccAoGRtnfaWGp
         e9DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYHQV+1l0gO62VON1LJf3XYP/oO8ZlKBfw5l/CsWqPPhh6vAsTJ4bATY177VO9YVRxS7xp7ydUBfxczco=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+BX4e4s4fPhnioHADCETPuND4dsfvaBz5SQPbmbUpnchLPfR3
	3+C0ow2R+sjPUnXHD7ZxlHr/HFOP4h/c75mgZZbMqR/0hAjDiGWloe9wRUbTID7fqz0Apmf68yB
	WJBP29ilXcYBmpOHe0XSMVTexwCvPRzrhZI82rIlDBQ==
X-Gm-Gg: ASbGnctrLhrozv0bSDtrYCikPzejj5BpjZJVX5fCM5vy1txSxt4RpWr5gpfEl+WYV4W
	Cj22IIaUZBRfcLRNIsEVxaJ+bInrDxcC0AoLSMLnOMbe0HJmshfahiLQ618cfwH/g2t+pgLhy2H
	3YZj21z9bgXWpDZhphgcojW79cwB6dvQGC
X-Google-Smtp-Source: AGHT+IFQVvOosag3wuPv5W+XIJzYaSdxGYD1UMd/R8W8Pxh76H5erVKE3YMDyz7J1K6JRiB3EIiz78IA4aDaPOiyz/k=
X-Received: by 2002:a05:622a:1e8e:b0:479:2509:528a with SMTP id
 d75a77b69052e-4a4400b3557mr277320501cf.42.1748958702536; Tue, 03 Jun 2025
 06:51:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602134238.271281478@linuxfoundation.org>
In-Reply-To: <20250602134238.271281478@linuxfoundation.org>
From: Brett Mastbergen <bmastbergen@ciq.com>
Date: Tue, 3 Jun 2025 09:51:31 -0400
X-Gm-Features: AX0GCFu5TBNRaAAJJpvK8wBD6H5lRVWrlVadCPrD1KQA20azEjh8PY5cFY_N-ps
Message-ID: <CAOBMUvhhS9RpZoOkgkdLaDv19VpGvSDab7oi7nNupJ-P4siD_A@mail.gmail.com>
Subject: Re: [PATCH 6.12 00/55] 6.12.32-rc1 review
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

On Mon, Jun 2, 2025 at 10:05=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.32 release.
> There are 55 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.32-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Builds successfully.  Boots and works on qemu and Dell XPS 15 9520 w/
Intel Core i7-12600H

Tested-by: Brett Mastbergen <bmastbergen@ciq.com>

Thanks,
Brett
