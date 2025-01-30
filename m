Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D160196DB1
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 20:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738270082; cv=none; b=mcDt5X0hpaa/qo/onwNWwta0DgW7dxlx5+QWzOUpJI7KG4XLxCpqMHqxzDUzBMcXgq1ZLcSCfNwnsRvJB2KUzvOvjJvm70cTY0dZKplAGHbbeZA754dkhkRcuD21Z57DlOfHo+HYsm/XQgEcc3rexmQXMVfcTvqu6ISOf1MD7hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738270082; c=relaxed/simple;
	bh=6W9jOqmce2nA4SZOyzCokRSqPMe+X7HxfDi+wOGai08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l64kZoBNpvSym0hnb7288pIBoPNLqK2FSwOtkOKY156ePaWsuz3zUqhN+UeU1a6cgUG/XeVx9BowUeO/VF31JTRBqMoTGovmVm18WsxQcXD0Qbidy/JevroDK7QPXo/gyc6H4VUFySIqmS+40YvXD9k87+jSlc46X5B0MuTV2qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ycj2yF98; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ycj2yF98"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54024ecc33dso1359532e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 12:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738270078; x=1738874878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6W9jOqmce2nA4SZOyzCokRSqPMe+X7HxfDi+wOGai08=;
        b=Ycj2yF98Et9fWw5KJTq8yszo1781Q6dVS17f9nmWjVroDCHs6RC6SU3XxXPxhiKSfW
         Mqe1VEp1G6FewHcwT3vW51DUFjCwcIf/xtOX0kFbf5C2PEUhpyC2offhPIZZhftX5UDB
         GLRjK1kblePbIUFfuKWn2kXVmIEn5l95+t7RSi4PYXwB/bM9CgFzEtxwM7XrAkey5cu/
         ILP0DpNk4mipvncbqMtnSAujB1mbI+uNRSoGrHUva6pvuZ+q0F2CmYSYydjwYK4a375w
         OO8oFESvW9jnY2SAdPRCxniI2CkPh1rItRcQr5Z79qQnrMUDUc1wb3JEFcclRZxox5EZ
         YvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738270078; x=1738874878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W9jOqmce2nA4SZOyzCokRSqPMe+X7HxfDi+wOGai08=;
        b=PUK2HpkUk6IDQbOUNrfHpX6uq1mKZMWcBsg/bdwgSKWk7rT0jaUIt2FSoEcig3V+RP
         MpYwXGArRRK/oulf8dB0j4JElhysk0X0Ca7H+BcgxzsqIsHhPi1j/soVD/CXGb69RKki
         yk8GhIm8uvGSDWOAhvCZayK1wtjjq7YFmP2gp7IvPj/8pAszoy2u4hdWXT/O+FzLjiTF
         zjaFJMeRUeoFpd9YoPd80zgroTKDGZxOK5hy2nW8oUU3X0Bq02LobCeCgFt3SpAoAdQr
         2q6/SmOPOqTjuDvyI7r5Vf8pJ9XX3WiY0NmefNbRsx9H/JIOxNB2GeKfs5KPhtqWUWu1
         TDEg==
X-Forwarded-Encrypted: i=1; AJvYcCUkdlMS7a92uxj8bpsaoyLYXkUwGB0fOkg193dhqNxkKX+52W6NC7RtlmJ4JA4e4l1XE95g06ZfANzibj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbBtGJ4CoUyuHlZyd1tuxX6YTSzcQxz8KfVDmijLKA90y8gaoQ
	4Na9XryyRPUAvtviHdtbmwIaRg4kS+wZSGzPyTqGwbLO93pN2pozcJGZiwCZ81jekRkb67R7qu7
	5ZcbpBs/3iTk3V26e1fARu7EnkSVQEKHThr9odg==
X-Gm-Gg: ASbGncvfHUT+7GrWb5Zw8SRb+B6XL7YHmi+r4OdTAEiMIcuhVuPD+JiLl6Sv+AIM95b
	Gyp9U4SG6tZqzwSI+jBMyUOXc17x/1Jj/+eKQpwBBwdz4SC+7smkyij1hTrv5KE9Cz+cPreu9Hv
	n8Phm3Ak+yeO/ss1Fc0hFiBw4KvEN4
X-Google-Smtp-Source: AGHT+IHQiBZi+5WIgFL61G3A9QcuOL44bcnpT6mV6FVgYrunkad6n814hnmY4EO3AWPbGhCOdR95URu2UlrlmW3JN+A=
X-Received: by 2002:a05:6512:3f15:b0:542:9883:266 with SMTP id
 2adb3069b0e04-543e4c32bfamr2847359e87.37.1738270078206; Thu, 30 Jan 2025
 12:47:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129155525.663780-1-koichiro.den@canonical.com>
 <CAMRc=Mdim2aSBs+JsL8dECfG0Vvrvcq6CHaGHbBoVhNhSZn9Kg@mail.gmail.com>
 <2kz6mz6nglozgrwudkgziles4wievwfkkl2oo7qyvosirchjuw@y3wfna5dsekv> <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mc3qBXaATpYRAXeHne0+mBjErivjvUe4rBEj2ksansatQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Jan 2025 21:47:47 +0100
X-Gm-Features: AWEUYZn_uMJ9GcuvHmfmQkNcxj95bMksipW2335c1zfAK6UFKZVo0Ffn_oFKBbg
Message-ID: <CAMRc=Mc5WWNErJfEQ4sFRQm_+vDRMa7KBKSPSnP3W8scu4G19A@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] Introduce configfs-based interface for gpio-aggregator
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-gpio@vger.kernel.org, geert+renesas@glider.be, 
	linus.walleij@linaro.org, maciej.borzecki@canonical.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 7:40=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> While at it: there's no reason to impose a
> naming convention of lineX, lineY etc., the names don't matter for the
> aggregator setup (unlike gpio-sim where they indicate the offset of
> the line they concern).
>

Scratch that part. There's a good reason for that - the ordering of
lines within the aggregator. I'm just not sure whether we should
impose a strict naming where - for an aggregator of 3 lines total - we
expect there to exist groups named line0, line1 and line2 or if we
should be more lenient and possibly sort whatever names the user
provides alphabetically?

Bart
