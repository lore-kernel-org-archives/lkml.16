Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71984241132
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 11:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891062; cv=none; b=KndGEVZGiZeO9HUCrbZNOcN7vac3sV+pigP2VfwW6rDTazFk6/93oLN3lg9vRLncQrWas0u4JHC4S18jfzu3B3+bXFKZx+QNqduznBmuRymITtl/lfTanX5q6gNCtJGsXjLBC8MvYgeXsLtBOtXvdNBcyZRaSuTrdP7GZgjnl04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891062; c=relaxed/simple;
	bh=KVx8WKmih6vKKGr4uNwkQTb7gVMYZFyBqGp+HrNkqYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmTk4+w+3v1YdXm65lPkd3JzO6uWRQMRd6dX2bjCRvnUi5Sda+Ysba8fPgmASy2c8PWwBzdQwTmhN0v38ci61hHVoNQfAC7tv3Ubvt1uXdIen5GfIltdEE3c8KUWZQly1/V7ArdCrJh3krFP5meob86fvPghpBjeY7aZOIPqkIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VlawjmWU; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VlawjmWU"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b166fa41bso832252e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 04:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744891058; x=1745495858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVx8WKmih6vKKGr4uNwkQTb7gVMYZFyBqGp+HrNkqYE=;
        b=VlawjmWUD0F5zybVoDShijiY/XUMKaPVg0BrgS6F9huR/tVsgQCbFqwy9WIjj/F7q/
         w9yXJ9oceYQIr5nEycrXWpxogw7Gj0II9dES3ViXLIGphRCO7V2r40IxLyvhIw7/7v1s
         7I/jjMK+5fAtgA6OX2TMEzRkVX9bsV156Nob+1IR9xzfrbqej/IzlYV5qP+EvMOaofVe
         6QacPUi9TUUVMr3pTYNAEQhNvrU7kyXmFiCrx9kRIhnYyd7auFyHrsNsf3+nmP4RoZvF
         ux8wwVcpJCfbi2i0YXWVEURhaMETYrcteWT9fnIx/PilhBcMpWHFWUUYey5x4Px5MuVf
         75mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744891058; x=1745495858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVx8WKmih6vKKGr4uNwkQTb7gVMYZFyBqGp+HrNkqYE=;
        b=P2dn5bN4lVPhxG1NDWhE+cCSmYzm9Axl2l1OUb1RrLUbgQ5OHo77OV/6s07lDycQqO
         g91Mo1FOOZSJJs15hg/A6OZ913EuMmTv1MdhPgo19Wf22n1DreAr6t99KMIaEAWju5oH
         gLWtmY20yrEjMJx4tZOGwFAGNIcPfBZ2FV1k7LYeN3rYSnPHP6iPVXIUJPxdyG/nY0Ww
         mRNHeM/7cWrsMhuHJMtwZkNE0ZvIjgD/tgIHtRrPv14tB4RRvhD8o/UybP4KmOwPWCt7
         /mpZ4Wm7Awk6Q0SdNl9oMz//WDdET1lYBF+GB5p9N+QUkkbjXQw11o8ImxtKnVjo/ee7
         eE6A==
X-Forwarded-Encrypted: i=1; AJvYcCWiTNt9d1eoaoZe25P/vmeLIQR22WA/wb2AA3wYdQMAfGNLFLW5bdtnIORhOBDCMBe3I53GiLn5Jk33eig=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGJ2D27zAD0Z0mIWRq+uWKQl6/h63uhYELclzITEqB2C/gm5l
	3Hxzdv5+niienSfMyPfmfNW4k6yIh0hzrcGrPjE226MrO+rJgiyPeuBxt2m1i6dUajJyqD5nql8
	ad1Z0/X9NLl7zzDNSulvT+Rw40uo9n8xo0iJcUacOM9Mh40DzZvw=
X-Gm-Gg: ASbGncvuQ0QupoIGU1ZO/7XNtoBvK994m+z0W9Zb7FBDPWxEQ4oiHXJP3DeQ1uqSv8C
	IRuyohHOdy3EWKFjICBDF1Y1YuxqQrtIlIp7NbxcsEgqo1Yv/nx3/Eh3NpGFLbJRFY+fEsVSYI1
	9XZL+bDv+I8IKgMV//+MM3Fyvy2OBVWe25LyfPzKjdxxksztnUSiV1caA=
X-Google-Smtp-Source: AGHT+IEeiYtk0HBTKuDVztlupwWSfRuUo8RT61pDnZJPmFsX2h7TOOidEy7m9hfQetu7dYH1CnLuFFBE5Q3c8cKQfhk=
X-Received: by 2002:a05:651c:b06:b0:30b:c91d:35cb with SMTP id
 38308e7fff4ca-3107f68c2cfmr12267491fa.4.1744891058255; Thu, 17 Apr 2025
 04:57:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org> <20250407-gpiochip-set-rv-gpio-part1-v1-5-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-5-78399683ca38@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Apr 2025 13:57:25 +0200
X-Gm-Features: ATxdqUEK3uu-LOdkchvLQaZrXxJG2L5aKVumzM127nWeg-RbcMIq1bU1r2_Kqrk
Message-ID: <CAMRc=Md6Bi6ZT4tuyzRq3YfNe3FreMW7Yz77xy0tYcdaAqjWKQ@mail.gmail.com>
Subject: Re: [PATCH 05/12] gpio: allow building port-mapped GPIO drivers with COMPILE_TEST=y
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 9:13=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Extend the build coverage by allowing the port-mapped drivers to be
> build with COMPILE_TEST enabled.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

This caused numerous problems in next so I'm dropping it.

Bartosz
