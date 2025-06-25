Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CA719066B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861933; cv=none; b=nP1jaeIp6uHE36KMtppcnsFNAOMxExJu2clfp6jMhkn5GKSpJJ+IBce5NFKx0PsNUZzotN+YhS7UwsITWyPCgexZVUubBs4GBBq/mk/cb8FUU+WkCSYlXPn+qCHcSAJL30kYvwhxEa5nSGFG+oa1bsPT/GUtqon1bocLCOLbWIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861933; c=relaxed/simple;
	bh=36jFcNi5AMtDfDUxJWLv7FOPyUhXdgiBwK1gip+Y68Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bUbCSnshKUuVuoqOBzXH3V8r3l9yEahrFAlZtp4RhtqdW434buk18zZGVGBh+Yun9L1WiWPDh0NmCY24c1+HQvRghWOoI6adE2e+o0EwirasGRuaAITmqMpqmVpaMuYXv7v7LUfdFZvVR9sP6AUjus2yvbtAOjhX2g69eFqOjCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com; spf=pass smtp.mailfrom=ciq.com; dkim=temperror (0-bit key) header.d=ciq.com header.i=@ciq.com header.b=cEnMhSXm; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ciq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ciq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=ciq.com header.i=@ciq.com header.b="cEnMhSXm"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a44b3526e6so20826071cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ciq.com; s=s1; t=1750861930; x=1751466730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Vaw6UAlGLmX5XnFTSQ9UINLTAG+KGTITiCt0APsbtY=;
        b=cEnMhSXm4Qrow3qjuFrrGoU9hl8V+b1Nh408VG+rRctAkJyPwriYwVRujj2S5ZyUFh
         CemZvHJH/9HzqQ/yStLSOJgXQNCUkDN10Qyerl6v3VaA93Z0/ohrhE8wyvCqC8wTS2VU
         OxMlaRj2FGAXzoAZzG9PDHRfCplvomcBpt60toBkKkzN/celChdoLikWX5cjusxcrJgt
         wVNEkx4r2I6mCy0xi+5NIQeae0IRbYJ4zYuLdlb/mIaxusI9QTnKs0DuAtqD86LyRpHK
         rBCZjzjenLrM5yVhONG1r8XOZmR1qENCYrr8NgGuvE7NQHoBAOwIKMr90rSEE4qFCJsg
         lpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861930; x=1751466730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Vaw6UAlGLmX5XnFTSQ9UINLTAG+KGTITiCt0APsbtY=;
        b=BqDKc0PYPid9JQM5oB4iS2NFwJ3D4+jpFJ+fy5Wj2kzX2gNMncwuZA3u1+5eyP70mF
         mawXi7MQfGUjJ50FTBl/UR0ubWbo3TwtaQJHTQKPO5kWwcAfXZ4rFF5zzPqcOo2SG/UR
         SeM9cGLxKzpZgvALncTWyBjaEpLtQ2h5eiJClEu61CQnXlh7zweMBRwi4iDzM426XS2k
         60Umg/wxpR27jQiY1XwrO2OcxB65r433Nizxd2ptVhR6QIccrASnHBeNjwCPsTqfyOPX
         OKW6saCEy/m+AdZcn+l+Eb68FmVCrgG4En4RINfWebGWZL7QXFejaWH7BgqzxfbhAoye
         w0Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVUUXnjpPwpdAeo0HeBcBjx+pEVCpvzCg3JipPyHcRyaobjeX3OVBvMxKhqY1AZDqvVw3d0k6AUZU99Bjk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe7wvlVP/7EmkHe3W7UPGAE71pDvAWw6D0TzEC47Me1LJnzbUY
	8xCzuv/BYywaO+H86s9+etSuokzi9A+CByLLbohyKUr/WKRAcKpLxBaQ4ZH3GaJ0zrcl5/nJ21y
	BOU2Rg4pA5DluCfreyK0KNsdNzIu1hzzemgcNkn/7LQ==
X-Gm-Gg: ASbGnctsqqFCTsbMrido4LFKvYImz0yRERySBghwP6DmjQkJOy71R2PvsO4dZkCWzR6
	EleAdME1N75BfJdkwGfgXZAxcc65je0avqEnwUzPZhgPi0XZUzoHg/9R3/VvF2GyaV0BunjsI99
	vOuLWkRHnDcqW4Nv2Su1eYCTJJ8TvRfJC4PuiMDADl9Bs=
X-Google-Smtp-Source: AGHT+IF2FmBWl6hqQSw2dIMa/iN1L0L/HGqhMRXMl7b4jLmd44qi6m3OJaL1JIBpTME2CDDJL00MZsFOUSwKBfmsMZw=
X-Received: by 2002:a05:622a:1105:b0:4a6:bd99:5b30 with SMTP id
 d75a77b69052e-4a7c05f9cbdmr46296431cf.1.1750861929919; Wed, 25 Jun 2025
 07:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624121426.466976226@linuxfoundation.org>
In-Reply-To: <20250624121426.466976226@linuxfoundation.org>
From: Brett Mastbergen <bmastbergen@ciq.com>
Date: Wed, 25 Jun 2025 10:31:58 -0400
X-Gm-Features: Ac12FXwA-ei6dK0JEz1zZ0PaTcCEPi5wGhoiU2mqpDM_OzesGNEGCpdmM0EPskk
Message-ID: <CAOBMUvhnQ+ijRh839SUT4g0-y0zy0E_Nx65xpqOx1=2fF14nRg@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/413] 6.12.35-rc2 review
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

On Tue, Jun 24, 2025 at 8:31=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.35 release.
> There are 413 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 26 Jun 2025 12:13:28 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.35-rc2.gz
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
