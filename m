Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8641EA91
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724080; cv=none; b=fRT3LYUbACVMSuYZB+B5lz5Z/E5ew7E5HtDAAinQwSv9xjVfi0MWSNww1QmZ01GiGN2rSmePsXutc7ZRcUW8dgOp/ydVEBNqjdbRo9HydbhgtX+/lKRXIycCzlpEQNlLJtjidaBI2OGvXqRf4CI3CQhU3JkYf+wOk9FC2WaKpws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724080; c=relaxed/simple;
	bh=OjK0XJ46y3jXAILf9s+jwpNgMQ658DzTtoQ7CdC3VPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fl4idgvZNz3WQOjzoLvv7bsVyXrBpLU8eQz0JnXVS3lrV9XvATWL+dPMyZUWkCgDQaQtJHO0E33GBtIPk9vyAFFtwXnIZotBkstmSGOzoFZwKFCPIBIN98Ncwi2Kxqtwab4Ve6o0I0xpIZhqJJwpd4BgatoLGE41J5roh67CrM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SUJM4pyE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SUJM4pyE"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549946c5346so6265570e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724077; x=1745328877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRbWLe8uR6+Ruh67h/yoUWYHHmofvLoQK7bKV1fiz0s=;
        b=SUJM4pyEPzwHkAaUe8NOhwuoxMyJpfQ2ftc2ecJVQCWkVGXrozPU4vyeNkG7tdI1e0
         PlPRYs/VWnvxBa4Nh3SjpEZVxNUbGXZgzXszpL8BRv1jesfjJW+MJVg5e2Iau9EbsoDZ
         dFH+v+fNWSDE51GEsQjCpwSa2mplJnMXty06NRIUwO5Q53v+WHqXaH+Rtk71HzXplW68
         LcfgL70P4QdenulPlY+MPpYSqNsHkennGIEoYOMn5qL24SnPpA/YbUCiwSjAhfYPz6kn
         c/2pSW+eYmxOwm6OsCVTaJ3azB2jZRqDGTkY1fMTcSulEPPczfFAWjgGT0Q08fplb4wr
         8gmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724077; x=1745328877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRbWLe8uR6+Ruh67h/yoUWYHHmofvLoQK7bKV1fiz0s=;
        b=gXW5SaLPdGO0ILmkE8rGeMIoGNp6HHYv0sfXlVpdmq0pLYgLJQwYA7UFuXQ3FgoRyz
         jxYHr4swxbxLAo+R6qKWfu5Qi7EAa4+9v5aQckEdCdoHnNp1R/2GTNOTtukYV9kps1J1
         h+cvvl9ZrLkQOt/sFE68ZdWotmA2ef0uA+v0wK/FUAWk6Qs80gf3D9L0BYde9bINSquD
         WTwT6Ahj3/z8g3XAeTey1doNf/xmj0Cxsme4V4P0wrtrI3viIDylxtmeUw6GZCACwK/8
         Vn6PT5N5OJoXke+T6LdfiyVmxjWExzOkKEi/M/yTjgSX7wnKwvSJeBlprdi4am5mtSYL
         udIw==
X-Forwarded-Encrypted: i=1; AJvYcCUx7KraRtg7RbPI6ZCjgSHh881bPWLrEYnEeCoyHATLfs/6DiSUz8KDTxJlnoKtvktoJA81uafUa/5lDrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmlN+L+jXT/TWVWJG1z4VEVT6Q7VWJrcxRi4z8MKn0kNu5qyzU
	+4iAnHMg4DOJfUwQfRRCegdeaQi8eHSOfIWwrcWf1D5NbLricOPCZygtadEePBjKeItJYqK1qAu
	0lRRJ+xPpSS8AfAk/7olINpsxlTG9NO7N9yyEaB/TQ55RqgDW
X-Gm-Gg: ASbGncs86/jBK+ax+5I1ZZ/AaV+ZzW3wVPHoHQVVXn4JQnxl5WMifdaoDVgYcJbziRT
	uLBd2l6ACs1Ep/8vxqLobbTl3MW2xrMB5wCq/MEuRcMg0jZHLInVOzREyPx3+FO8dDlp0ZegIjx
	tvcp43NZPSY0efRmRscXrPeA==
X-Google-Smtp-Source: AGHT+IEqPbPcf25mevdtkKDV6Fu+XRejh24WiH4D40O8WO7gYV8t0TQe0MF4yA5cyBf8Yjg2SvmSG81yhNrMiWcs3lg=
X-Received: by 2002:a05:6512:1106:b0:545:2f97:f6e9 with SMTP id
 2adb3069b0e04-54d452ca7bcmr4104272e87.42.1744724077079; Tue, 15 Apr 2025
 06:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414203551.779320-1-superm1@kernel.org>
In-Reply-To: <20250414203551.779320-1-superm1@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Apr 2025 15:34:25 +0200
X-Gm-Features: ATxdqUGANNzFO3svuoLX47zpuOlc5Ol6z4O2iG_JyD2ta49DsLYE47fIs0OLH-k
Message-ID: <CACRpkdaHru55wo5MdVsRKRbfPS9Hv3vGxgXNi8eXGvAOQzyDww@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Fix use of undeclared identifier 'pinctrl_amd_s2idle_dev_ops'
To: Mario Limonciello <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-acpi@vger.kernel.org, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 10:35=E2=80=AFPM Mario Limonciello <superm1@kernel.=
org> wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> `pinctrl_amd_s2idle_dev_ops` is hidden under both `CONFIG_ACPI` and
> `CONFIG_PM_SLEEP` so the functions that use it need the same scope.
>
> Adjust checks to look for both, and while updating make it CONFIG_SUSPEND
> instead as that's what the acpi header uses.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504100420.88UPkUTU-lkp@i=
ntel.com/
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2:
>  Use CONFIG_SUSPEND instead of CONFIG_PM_SLEEP

This seems to be based on the previous fixes merged by Rafael?

Do I need to rebase on -rc2 or something to merge this patch?

Or can Rafael queue this too?
In that case:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
