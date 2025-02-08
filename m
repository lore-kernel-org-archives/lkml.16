Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04B024396A
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739046335; cv=none; b=Uuj012afy0ZbCa+EoL+k7szwUCZuXoeM+Ils6RVYbaoMkKYMOU14E/Qtx6+rFbsXLEPAq5BoV+v6yKzZ71LTXIrxS3qqNCbV5th04yL7VzoJnZ+ES7JyXJgTtRxjHl75s5x9DtFZ28MvIIc8vqJq3d0jkDBP38FIDimz8hwPifQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739046335; c=relaxed/simple;
	bh=lmZxWKz4sEB4pMTPwriSxKlyI7xubfAYb1BbOdCt3pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yt2JobTMy9v4zgjtX70N+wByNXYfVRdXr9FewGIKhuzmrBa+QDz31zDoiS5pQYJqcE1yEiJp+qRI6B97wiUQqaO4LJuhFaJ5YD9ew1SOuNOhxGSvdgKJY2Nar/B6s+CChTJTQB5/l7cLxK8ZPvDSGdD8K6xi1WVaA4sYv7XzBrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DOQvV8rC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DOQvV8rC"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5440d5b30a8so3753292e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 12:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739046328; x=1739651128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAwQ6v6YdN6RFTuWQVOHau4xzP3b5faxbAOmvcpMZPE=;
        b=DOQvV8rCJWQoLm1zOW8D4ZgE3hhaTS6+lYD1xYzv53ut2P6Lzp7jWFJnWjfvI9ThZV
         AqfkSqiYjnQ6tgfr+4dKgq0zcZLrCfyKXgRenXf7aCBB1drHStN/PNfEu76XbtZyknZJ
         Rwrd/KqbP1gBO5vpCHCVCbtZ0FCYEElGOTh7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739046328; x=1739651128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAwQ6v6YdN6RFTuWQVOHau4xzP3b5faxbAOmvcpMZPE=;
        b=gYR0RcNYnkm/0ajcka7ve6GzOOunj7lDVLRWy9l45PQCkb0tT0VLP6pbH8SqojUFBr
         pME5pSZ93wlDI3p2tSNy8oEgj/np2wa1vR/kKXjk+hA9fW1cWQHRtcN1K99zM6W77/j6
         pdEx22VPaoO71l+qC45c8g5hshw8Xc9NOxqGkYd6nq6rYBo95BeKqjZ98ExZtNbjMPAO
         lIoTFkRJ8ZHWJkomFoe1ARn76WedBcR8ylbajCIJhvevr0ZJm5oMqaQIZZPPUE/0FulQ
         b0/qINKgwvuNtK5zzL476Ba5QFKntUqrmIz6QnyBEeTfr0wmFcup97YiFbi8jvmOeCyx
         Uo1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7+5B2jVMMRMBTs3CzPl7CN2YBU6bOgnKq8UJdi7X6eUtWZIirWsIWYIxVjGsd/4jW4oDCPU61N05u9g0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/wL/xu+LV6paUDLVOw/X0jJAewNc33+sHSxGX1uF4zNrEljsj
	6JMcjYSIQoLeNgeZPldWdx5iw5YvXy1OKR+B14wJm0d8+8KVCaka4Bi43qu7LftfZkNQYlGeccf
	YTFoJ
X-Gm-Gg: ASbGncttHBOWyX3XQny9xzdmK2fMCWQa3vL6m5qioIqR8s11tqH8Quxv8cr4gx60r49
	gK9szZTzUhobJdqnI114G7OOOaAjTEagncuks/vTqn2luQfpIjvqKS+DTnsCeNKuI8VX7Moh4Q+
	Xrr54O0smcDDcqThtEWfadLldVG1cCdT65/woLwnz87mDjYfTDqrw79/D3orE09OgRCWnzdPnid
	Rh3fI34VhA4u4foTjxPHReSsf5hx1beaOQuOdoB4aS9Si1jlARdN9tP0ihblpO6O70uim4roK1X
	QqE4xd1wKB39ZH+7nCWYV2USRC6ilo+PqdDZi/PqIsmJ5aZwMuYI8ns=
X-Google-Smtp-Source: AGHT+IGamXd2JGXqOf6PGqwiBdPQuY14HHnGQ4BylthZxXuN87oE1gxSfTGLv7S/UgctrA1pJjpY8w==
X-Received: by 2002:a05:6512:159b:b0:540:2d64:4ef4 with SMTP id 2adb3069b0e04-54414a60c39mr2949685e87.0.1739046327779;
        Sat, 08 Feb 2025 12:25:27 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105f2e74sm796532e87.187.2025.02.08.12.25.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 12:25:27 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-543d8badc30so3599960e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 12:25:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURp9ZUJ0xh3jz9eRW909cXoMk6CIjFnX9gA3rBVcDRrFASOhKhSF6OpwvtPq/Lzwvi4mgkA8KYxixTwdA=@vger.kernel.org
X-Received: by 2002:a05:6512:2254:b0:545:5de:f46e with SMTP id
 2adb3069b0e04-54505def563mr665702e87.39.1739046321893; Sat, 08 Feb 2025
 12:25:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-4-yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250208105326.3850358-4-yelangyan@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 8 Feb 2025 12:25:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UNaOrZVnhmj3cNfJoSj9fc2g5p8w+cfk6XwV1Bcz+a8A@mail.gmail.com>
X-Gm-Features: AWEUYZn-n6llQrHDzAHqyqfKx1wNx3VrYtKrPGjCS9vT4XhM_5671aX3dZRAK0g
Message-ID: <CAD=FV=UNaOrZVnhmj3cNfJoSj9fc2g5p8w+cfk6XwV1Bcz+a8A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm/panel: panel-himax-hx83102: support for
 starry-2082109qfh040022-50e MIPI-DSI panel
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Feb 8, 2025 at 2:53=E2=80=AFAM Langyan Ye
<yelangyan@huaqin.corp-partner.google.com> wrote:
>
> The starry-2082109qfh040022-50e is a 10.95" TFT panel. The MIPI controlle=
r
> on this panel is the same as the other panels here, so add this panel to
> this driver.
>
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx83102.c | 142 ++++++++++++++++++++
>  1 file changed, 142 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
