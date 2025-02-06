Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67578239573
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738862473; cv=none; b=IbWu7zyIMCoB+Bcj/jwXdr7FOg4Hy4l0z/GEXlM/o0Xajhx1OzZntQsGwuw953qT6L/zX3JQuYB6eYXNQsjyYgsOK0sVppUl11qZDXV/87TwNm+LUqfJiuDGFc4ZK328mg0eP9a6Y1hkUy0KpZnxUdASWnZYHdwPruvFNertcII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738862473; c=relaxed/simple;
	bh=4wSuz5VzrMxF6hFZ+dGcbfUs6KWTJLSlbQyKfhds770=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LAFd8bf4W7SFpBx5v8FjkLZF2OG3Jbc6Y7GEACf+epYEguUpYuyXHnFondFu9eeWggglvDOli1tNdXCBHFT0QW6xOI1nJYnMVqlPm4WfuzXYuZCHVbbsKGatxTLO67andTzmPbISCbZp643HYyXVdO+eRQCfxN3eQdOddTIVyf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UTryEWIq; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UTryEWIq"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-543e47e93a3so1272796e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738862467; x=1739467267; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmyQQLjc7ihSNeKK+vC8OeDD8oaLS3Nn6NTNSIO758Q=;
        b=UTryEWIq/b4RwjRdwiq4VmPyYm7oIXv0xqgGKgMzjlXsB4WYA+MqRNZ4FDXe4Xujlo
         w4Dzb32am2KoiYlpLfX5INJrnsdYRcBU77Qebj93seSaSSrir6NP4lGT44eFIWTMg5hO
         YjLvq+b8O9/rIxfCITDHgpSTCtIujWMaVwF/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738862467; x=1739467267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmyQQLjc7ihSNeKK+vC8OeDD8oaLS3Nn6NTNSIO758Q=;
        b=d8W9XTq177iWpos7fMD7vmgcg7ISo7NH6DYNj2k9ue41uvn+Q28kKOlfCFjjBk9rLE
         rC4txuHyzaFZYpOO65pmYZZ24loJ/wEydKTmN0AjXo1Va9vfIDnxh+eu8OoeEz0pnJ3/
         RoYtz2A+xuHZZsDq6m2PhKlRkJzT+vyUzSXyA5gxr+ymEKmZUQWN+1Qjjm9+Wz67f+AR
         QTJeBO7xBZdJajtmy/7wASEeFmuzGbgGcjC+3TPhzE2dXtUs6DoflpbM5Tij1ZQSFa9y
         sslNZisG7Or/vkl3VEvwD7JgsJXM4dlEqnM5/528Npd7lbGT9eIFIWjs/KpS5uoo3puA
         NyOw==
X-Forwarded-Encrypted: i=1; AJvYcCWtcXjVOSbSFL9yoyo1Fvr8OYeMtIDrNCraq+e3/X2B9GUygSt+hrburnBxLaVBsMM/zOXYA94YUn3LG6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR75KJKuar52Fp8zjr5HEPvEyZ39XgNpQ45R0udPhqEfvFPkpc
	wT/jM17ZJJ8q4OyWYH5zBX+fzH7AjDAOWaZfl2W2j+OzxvOulDl1MQOX0mVr+T8zQmx4QfKJEdm
	JkhAH
X-Gm-Gg: ASbGncsgGS7RGH4TXkID2py2ZzyREkWqRX91pTkCFNoUKFaRlQuLZHIhnA9ej4eiUCh
	vL+aJ+keN13x5y/vo7yNo5JIypS2wNiJa9ZbeG3daEkI0sDOfpM+bm5pHUDA5tjrP5/2zU2LEX9
	GxeZbv8Pkj+w3yoZnj/t5mooYR9+j2x1H3quaaheIBWtjXaWnyGUveVQrcZaAPz87e7H9i63Baw
	T5mTGkYbA2IfKMyGVe0tBbKyPTOV381RkHvtxjcWm5ZrzcIbMPiPcCzn/NLDIyU7bd7jbpQHVVn
	SQW/hdpQpCirYmkNQt38Crb3D45wMQ2yoouHShUFp57WQAX2q3VnsYg=
X-Google-Smtp-Source: AGHT+IGk8ewlGpr0rl6ASidRx+1ZAlFlLB8YMvt9yFOW7WrZRg7dLZ6TAepewiiOCk0gpVY6Ng8d9g==
X-Received: by 2002:a05:6512:238c:b0:544:12fa:256e with SMTP id 2adb3069b0e04-54412fa2614mr580508e87.18.1738862467360;
        Thu, 06 Feb 2025 09:21:07 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105e64c3sm178247e87.167.2025.02.06.09.21.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:21:06 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-543e47e93a3so1272732e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:21:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5Xx6WofGoUe/1W2cZsNz+VhengH6lwxI/j270TAXKSY1KuB6FfLeT0pdYc5i3k6yWMPPX3gXBbZio6rc=@vger.kernel.org
X-Received: by 2002:a05:6512:220a:b0:542:8da7:242f with SMTP id
 2adb3069b0e04-54405a10653mr2730027e87.10.1738862465869; Thu, 06 Feb 2025
 09:21:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206131300.1295111-1-yelangyan@huaqin.corp-partner.google.com>
 <20250206131300.1295111-4-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250206131300.1295111-4-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 09:20:54 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W8WR4rut47LA=PftG1bdDLkSa97syY8wt=rH4dJa-pLA@mail.gmail.com>
X-Gm-Features: AWEUYZkQjg27CCS9VZJxZrYKj8mLCb6hWyh_QBl79_c9o4gHiKUmfZwJ_3PvYOU
Message-ID: <CAD=FV=W8WR4rut47LA=PftG1bdDLkSa97syY8wt=rH4dJa-pLA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drm/panel: panel-himax-hx83102: support for
 csot-pna957qt1-1 MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 6, 2025 at 5:13=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> The csot-pna957qt1-1 is a 10.95" TFT panel. The MIPI controller on this
> panel is the same as the other panels here, so add this panel to this
> driver.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 123 ++++++++++++++++++++
>  1 file changed, 123 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

There's no rocket science here, so assuming that the bindings get DT
acks I probably won't add any real delay before landing...
