Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0210422F755
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 11:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748950839; cv=none; b=r2pormhznYjsF4ZGzj8YXuSQ75btbXD1A6RICngU2R6yKBS8e+Tn1145hSHQnWtBzJMGuBQ86MAPQTf58kOgHkJA4pYqq9hwSbhLKrBdEMcmVNNdoVpXG1E2VYYZxIHTYwtv/XMWw+Yi03rvFssPUbWUK4cV4PA5ARvMTF1WCyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748950839; c=relaxed/simple;
	bh=ydJW/LoDzPRJt3Rv04zweiPDrb2AloHSlubJhACP+CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VII1FOGdYXVduGMy+NUatAoN+2MuIOm+4cwRO3N1MzyYtDtShJyreMK+fQFZ/jg3g9JVQOw+CFlHupP9SCZ6CQgXOA8DipVjKMma8qxvi0r409XRLlP2NfQLeV6Pg7jW1Tj/VVykkq34zz4dYYmemcYUCiMudbCNQIONluHhiJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=Rd3Itndm; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="Rd3Itndm"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3124f18c214so3129623a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 04:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1748950837; x=1749555637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icZx/2AfzMBw1r6SeRjsuN5YEn+p0qUPm4S9o6uO9EY=;
        b=Rd3ItndmFROTSBm7zOmjGxFFHUzsOBgmWOUXidN7o/d/BJ/xZ9iGrriUJAn/kfFtgp
         O04qhz5EkzjTfacc8HDZTa5GjleOmlTcoK7Ui2TjRJbKYP81suMsGZ25wQu8YYn2qb+v
         vTv/N7gPTUd6dMkHuUVso+LeS35fV7qWhCVuAgvNa48pptaeuQP0lST0RJpJVERRobpb
         xO5qpLEPZRuhswu3+RDWEpQTZvLoTOkgT6bLx3XacaXWBds9pL6ZwVLDDx5Y44JJA7+m
         hWhtEWCxrH5ymUXVN7nhCJsPr4rYweO/VCyXFyH4qxqy/piSIRgO+C+yf/F1z1j6QWT7
         3wYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748950837; x=1749555637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icZx/2AfzMBw1r6SeRjsuN5YEn+p0qUPm4S9o6uO9EY=;
        b=BooNLqpN3UwieRNasLG+bq3C7tIUcD1vVlGArOBUs6DLWiOjwZCRhx4ALCawiOMTaV
         gF2U0ZQMM1Khwr6ilR/ZytlyYLVWj5k4xAkkirGkY2hww03WEU8KIWm3UxgMZhZH4Ncq
         1M8Q5n3t6hHSl7k1fJaV8x/dQO+fXLg7An1qE4KWwarbqLq5XMr4s1Q0EDu+CRTE96q0
         q7d7xQ1XvItrOt640vzfovoPQD96xR21D0L/8BzSkoPDLiWeFBAAe0f0ENQisp52XaHK
         05wWA7QILoBrAzkHFvxRZt4BZLoakJH7IRUsWUbWlwmzxncIF+ExT70MzW5aPHVKyx4n
         01SA==
X-Forwarded-Encrypted: i=1; AJvYcCVwHjlnzvCeYUSJHs9o/MNJHlXAa9JNOErPVdXnvV6UjuRYZs9YQeneJKUxGzSiy6iIGuU42pzfBT63ZHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YynWhubw7ssHXtYFgCXUp+MlqWM5WEVcTHywMNJMvHo3o2b2CGZ
	d7DGZVF2FHQL9QzYCryZBQ0093Bwas5Ec5qqpzhPyThYddH+aMW68WCTOZDJOry6MmohLYHluYJ
	Hl8W3fbiMNSfyXCZBUZzpl9+s3WH9TKMKaNka+yAWBQ==
X-Gm-Gg: ASbGnctEzJ+3PmQnHW3KqYtHEQF/XTj5nMOtlNEIG7n6gd3vyrFQvroggG26/pMFXcl
	WvmmGESZkjaVVYchbWeFXkD/Mse1xnd/+ucrIvq4DjvMVfO8wZWFqbKe659nZv4GMZ1oZtDsaVp
	jyFF46pZqRbmLmZ2XsTNVj5m/vppJu47SM
X-Google-Smtp-Source: AGHT+IF0haHNNQFhqF/wVyOzL7nQAg6E/2DprECkNGJEFD7A3Ta3cIiSJF2MKzFfFrOObGQ4hE+8hgwD+Eg8ExjuydM=
X-Received: by 2002:a17:90a:d650:b0:311:f99e:7f57 with SMTP id
 98e67ed59e1d1-3127c72e6aamr14719693a91.23.1748950837161; Tue, 03 Jun 2025
 04:40:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250602134237.940995114@linuxfoundation.org>
In-Reply-To: <20250602134237.940995114@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Tue, 3 Jun 2025 20:40:20 +0900
X-Gm-Features: AX0GCFsMfxUVTqS0QyB76gobjArUIvPeTmaHwVNP3N04POsePCAEXrHz1EuTjsw
Message-ID: <CAKL4bV6Jb64fXnYWZ_wP54FE2TRUy7Bp=Tzt+1tmUOzjbnghCQ@mail.gmail.com>
Subject: Re: [PATCH 6.15 00/49] 6.15.1-rc1 review
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

On Mon, Jun 2, 2025 at 10:49=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.1 release.
> There are 49 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 04 Jun 2025 13:42:20 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.15.1-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

6.15.1-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.15.1-rc1rv-g86677b94d603
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 15.1.1 20250425, GNU ld (GNU
Binutils) 2.44.0) #1 SMP PREEMPT_DYNAMIC Tue Jun  3 20:09:59 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
