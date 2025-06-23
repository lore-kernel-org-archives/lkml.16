Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2821FC7CB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750666118; cv=none; b=oKetmRfjM+d6pM+A6hfv0pVhK4/ilD1gZ4HQnh4AaZwBW4RBI45lbIUvShAo/A6IwPrT3uqZxX54TAbFIcGaPNx1cRX375UyqLOTEy5HkvATzdKz0gGfbjxdHWEm0G9YAYRNKtRsugp3jpqk5xUGrCWD+pkXf0oO5pYLP9wXJCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750666118; c=relaxed/simple;
	bh=g5hDqNTZITRuIWxDihpItpOWiJa7rGYUsLKFwi6IfnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pU8mei0G2078J5lRmA3uBo3nXYMnh/KAcnTPsIl7uFmFL4sCIVqZN+bdFd3eKCtkNCzmrUFnfKZ2auLrAPAD/ScEOSQoGTuv6+N4aw1Eyf019CyZSw2+UW+PyLFEXGBvyAedoFP/7ZSvge1M1QHnw/3viOjCuUmFvRWSaRgSd1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnELdEiZ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnELdEiZ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313336f8438so450660a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750666114; x=1751270914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cukYH4kHVaDT7jboVxSmpRN/DblqgsxbvLPY+K95XP4=;
        b=EnELdEiZakTOeUlQF1ims/lbdvJWvCujGAM1kNlZ9+9/dtORnHMC4XPqA52MRGhMJQ
         b0O7Zl+qSIA6tLV+3JKjYaYxoCT5mUGr3Qou1ClIOSxyeTk95vzFVHqIxjmblxbs7PxH
         kTRpYoBSSu8jBYSle0avX3ulUrnUAMaKKzym2/Wjh3pvuTReT363XuSdhVrToeo1+STm
         I8Fv1TH7JjH7qnIEDitF/yqW2mg9/FOlIvCRxrenXLJL5c2FDgSGI34iLrmFH4ZwVxsV
         CwFDAPogrb80so+Pru9UvLVFVE39boAk9jbrB4scXku8SC5V+JXIldANCo4MMhK/kLrB
         C1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750666114; x=1751270914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cukYH4kHVaDT7jboVxSmpRN/DblqgsxbvLPY+K95XP4=;
        b=Ok6QMyzdZKU8YTrE7PRZaObMrwUfzhU2FeSMzVSyL3LxXJhZKi7MHwep5LNR6xjwuy
         UVKnC7GuhMtL8Fr2F/z1MTfh3ylVZXru9d3QeYfsx+nQwKdH/W4vEP7E7qEMLaWgnE8R
         vz3KDuo+XhQaX5i/a0hGTndpsuowdDUnMWkfuzgG1/fCLR0oA8GyPzHQoVYSFmxRqEN3
         jARhPMSjHueOT58rRnKi9KtRrY72WmXdA1tceT+VuzgxOQEAEqe3Qnle7uC1KWBIQcJo
         CpVclhOJegBLcS9tPUif5XpbD3JySxsfK5cu45FHfo7QUf53ndndgLfF3ybNt//NHn9F
         QCRg==
X-Forwarded-Encrypted: i=1; AJvYcCXSy/j1Aaqy6yeLnwR20u3pdDLFp/yU3je3ADQpZtXe1IRaj93rj55r4YOcz97Dsu6+IVnTG0fzDbBgrTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7FzCirTAP4vqjNGxlV2oRva1rv9qEsqEKJ0Po3UZtExwL9yB
	izBpik56wGMt6w7cBggGkTSZeneToxxVNCUa+EkmRiWg7M0K/6YOSKwrjl0XlY6D4hbTevKVvx8
	1bwvJmoK3Grq81H0YXsd/2UZ1DpAVAnE=
X-Gm-Gg: ASbGncugfiZPVbwA1XQu36zmWse5hmGGvqXRL/mSz2myv78j4S7Ltquf15cVvEfSB88
	8NHyHd9t3cbhUdeD9hm0RZVZOLG0V6Yn4ZuxjmfiCOoJJO2sWwgNrxAvUx4mRSrrxSelWhB+MuI
	83rKbZcdWfMH6hopu/fnzoAT6zXyTvG4+ojdChJ6p5zCQ=
X-Google-Smtp-Source: AGHT+IESyfjpZVBDy6rBxMrkfB5CG+wYJVpADf7GAEeE+CVRpHcV4h+vvmmqR8L7kBaPfE4505mEva2P20dlNwxkGJI=
X-Received: by 2002:a17:90b:2ecb:b0:311:b0ec:135e with SMTP id
 98e67ed59e1d1-3159d6289ddmr6727892a91.2.1750666113861; Mon, 23 Jun 2025
 01:08:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1A357750FF71847E+20250623071933.311947-1-wangyuli@uniontech.com>
In-Reply-To: <1A357750FF71847E+20250623071933.311947-1-wangyuli@uniontech.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Jun 2025 10:08:21 +0200
X-Gm-Features: Ac12FXz4pmVji5Yt91h8Md4wEt_OeOZuMZ52fAaA0Azau2wuInEX-ICsqEieAtc
Message-ID: <CANiq72m+VbEdrTC8f+2Kmqa5YJqcGYOgLhOeDPV45zERz6BaBw@mail.gmail.com>
Subject: Re: [PATCH] gitignore: allow .pylintrc to be tracked
To: WangYuli <wangyuli@uniontech.com>
Cc: masahiroy@kernel.org, ojeda@kernel.org, nathan@kernel.org, 
	alan.maguire@oracle.com, laurent.pinchart@ideasonboard.com, 
	kris.van.hees@oracle.com, linux@weissschuh.net, tamird@gmail.com, 
	vegard.nossum@oracle.com, ardb@kernel.org, mchehab+huawei@kernel.org, 
	lizhijian@fujitsu.com, linux-kernel@vger.kernel.org, corbet@lwn.net, 
	zhanjun@uniontech.com, niecheng1@uniontech.com, guanwentao@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 9:20=E2=80=AFAM WangYuli <wangyuli@uniontech.com> w=
rote:
>
> The .pylintrc file was introduced by commit 02df8e3b333c ("docs: add a
> .pylintrc file with sys path for docs scripts") to provide Python path
> configuration for documentation scripts. However, the generic ".*" rule
> in .gitignore causes this tracked file to be ignored, leading to warnings
> during kernel builds.
>
> Add !.pylintrc to the exception list to explicitly allow this
> configuration file to be tracked by git, consistent with other
> development tool configuration files like .clang-format and .rustfmt.toml=
.
>
> This resolves the build warning:
>   .pylintrc: warning: ignored by one of the .gitignore files
>
> Fixes: 02df8e3b333c ("docs: add a .pylintrc file with sys path for docs s=
cripts")
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

I haven't used the file, but dotted tool files should be in the list, so:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
