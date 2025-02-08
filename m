Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB7E243946
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739047086; cv=none; b=AHIZuK1iZfhbqT6ZLy1l7IypkkhCv+A1es8tKZrLXPMJ7yQHOQtJ2f7PCZOUydNEudngiW3zo4OVY4tH4Bd1c/MQ5kO2gbRTCe2O0oeW2PxSHGEeGIsBoGC3Tg0DDwEXjXDZEIatT/Dudhw57VEtXY+9nEzSpqGcaouRVU9spQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739047086; c=relaxed/simple;
	bh=aLXDtqwkQRLpryu9rC+CUz7k+xX8tB/DDrhNDrtPAJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ht5UmzfznBDKyKJdAfLU3Sv+MLirkz9SvYKxraHPsqK3stcJtf9Vac2O5dGIfyewhqZNjD6l67DVpFsJoxIjttxMq1akasl7puFjLSrD8XNosB1T+qL08Jw63P8heDtnpI829LJRb3QnrnEnHNIFvloUwWC1C4Q/owcIi+C/Fg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nj9mviLm; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nj9mviLm"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-308d625295cso15251521fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 12:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739047078; x=1739651878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLXDtqwkQRLpryu9rC+CUz7k+xX8tB/DDrhNDrtPAJE=;
        b=nj9mviLm/yH6WBDG4BrFGxwAfOrer7tljUl+HTRPKuTxn0ZM8uXP3w+76ZLIWf0qBV
         RPM3+spyl3Qgt4xucRPSGtxJgZDaBj2OAASaeO1483KLI7GLsKKM7aM7ctEEYDrP/Zog
         oslMsy9wwN7Ka25EXRIZWr6koObDeylAkT4jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739047078; x=1739651878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLXDtqwkQRLpryu9rC+CUz7k+xX8tB/DDrhNDrtPAJE=;
        b=mSkcHCQXnQLBNsTnl0dpfuaen8JeYxYZNKCSgy5B/W6eUU4ARke0RbUsSVx6waJNNd
         7HyjWmbgMZMj9Wzpuwpj/wh945q+UEJPkFImmV9tI5PYLU4XYy3gedbDahm3f6u5bwrr
         D7Osd2K5GmORkY2c7LTSrLdBL0HWS0Vps9CRKHtN6l6u42ei5yK6k1IFlT/s6gZsuo6g
         H5JIVCD9lj5JxvRgsVlP7HQyRWJ/SIkfmpwjQpK7dP3B51smql03zBev7eMFnKXSjp3e
         yCHedy+ZKfl3htx4BYRx/VfbUmQnHfiqucwEJ4In2cK/sox9fJuXLV18rTY9zFjKYmGe
         UDUw==
X-Forwarded-Encrypted: i=1; AJvYcCWEMQtY6hzkaNIg6SezgOHRtaGhLXVtGcL5hoym5c0bL79pNtkOUa1shQXBMDbWlOqLdKPIRorc08T5dSo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPuwy+ZGyIXPIW0jWA+0O1LZi3a2LCiWew085AZAntCWqnTja6
	7Kvuu2foTSUsuzZWeg9BqKcPRfWi022lMfDbZCgP4bWl+G7fksWsXItvl+lvEcBXqObDKGbC5Wi
	4CDSB
X-Gm-Gg: ASbGncuu+ijCyghIfL8IyYc6bcq3Sx33OgKfoRFBys/smThIF0FZVqTSlecTZRM9EJN
	BClWP4MgWZIvIyV/QWqVMpgEqAGRIBqzbOYo4OLbMRoYFc9d5ig4BHYJlAzpzZjLU24Zcbtg1cr
	3gxsOCho4UJzPcrg8Exj7EpGQvmLB1G5rWAekmGvxz26kfTXLKeKtRnF9AfWihdq5jvPbvYWdlp
	vhMBBWUrPNkPBO2AuAUhrGkxtuOb/YyFM6I17oz0jKpBR3NBv4f6G9+6PUNRdZRrrEWhBz1RV17
	/Hd0gkGa3P/MmIMSIENudyVI4+SO2uuOENCRzA8PHWKRbsU5FY16jW7k5kg=
X-Google-Smtp-Source: AGHT+IFDtEWtU90DsJ4BF3U1mP8oQgixhDED1DBZXI8LG1vstJZ9zSvjIAIn18gSrLPaNO1ANP7ayA==
X-Received: by 2002:a2e:a913:0:b0:300:3a15:8f22 with SMTP id 38308e7fff4ca-307e581b0bdmr26874801fa.21.1739047078505;
        Sat, 08 Feb 2025 12:37:58 -0800 (PST)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308dd1c0ea2sm3212901fa.61.2025.02.08.12.37.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 12:37:57 -0800 (PST)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-308d625295cso15251121fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 12:37:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGVfJ1oa2EvMq0azYfFBV1wZ9gV6p64qt8rMrbrdOn3KNaUMxQgd1l95qQ824w7BbOy+6EpTDfz7tTRQI=@vger.kernel.org
X-Received: by 2002:a2e:9f47:0:b0:308:e803:118e with SMTP id
 38308e7fff4ca-308e80314f1mr1813521fa.0.1739047076046; Sat, 08 Feb 2025
 12:37:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
In-Reply-To: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 8 Feb 2025 12:37:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WkPefg00R_TAQQA6waRqGdD+3e84JXfPLk2i9BRzW6Yg@mail.gmail.com>
X-Gm-Features: AWEUYZmtp_A3cX_L46ivt1I8hAClJ-sovMP_5NAQXDAfEvF1gvbHGKAwEokNtOY
Message-ID: <CAD=FV=WkPefg00R_TAQQA6waRqGdD+3e84JXfPLk2i9BRzW6Yg@mail.gmail.com>
Subject: Re: [PATCH 00/14] drm/panel: Transition away from using mipi_dsi_*_write_seq()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Artur Weber <aweber.kernel@gmail.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Tejas Vipin <tejasvipin76@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 6, 2025 at 1:06=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.com=
> wrote:
>
> Transition away from mipi_dsi_generic_write_seq() and
> mipi_dsi_dcs_write_seq() to mipi_dsi_generic_write_seq_multi()
> and mipi_dsi_dcs_write_seq_multi() respectively.
>
> This is addressing one of the gpu todo items [1]
>
> Used Coccinelle to make the code changes.

As Dmitry mentioned [1], I think a real cleanup needs more thought
than can be done in a Coccinelle script. Maybe you can make a script
that's super fancy and does a perfect conversion, but I sorta doubt it
in this case.

A few other note:

* Tejas Vipin has been slowly whittling down this TODO item. It would
be good to CC him on any attempts to avoid duplicating work. He just
submitted a patch [2] that duplicates one of the panels you ran your
script on. It would also be good to look at the patches he has been
posting to see some of the extra complexities.

* I'm happy you CCed on the cover letter, but given that I've been
helping with this TODO entry it would have been nice to have been CCed
on all the patches.

For now I'm not going to review the individual patches in this series.
If there are any where you think your Coccinelle script really got
everything adjusted perfectly then feel free to point them out and
I'll review them. If you want to help with this effort, my own
personal preference would be to at least start w/ one panel at a time
since probably review feedback on all the conversions will be similar.

Thanks!

-Doug

[1] https://lore.kernel.org/r/mz6usiheb2lx6wlk47z3btvf6t6kbo4ja4n6mli5hosrp=
cvdwp@wmvfvhaqhpkm
[2] http://lore.kernel.org/r/20250208051541.176667-1-tejasvipin76@gmail.com
