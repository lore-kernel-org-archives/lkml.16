Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3BC1DE2C4
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202414; cv=none; b=bBK7MDvH5unKTi+xGiw5cbomkzTMTMF06IlZcpPT/GMXgxbK1OMmqMh3uzYp8AS+3ZGbkHGcUJyJOyRi3EWcPuK7FqhWm80wB0mGlTVm5iSnUEkeaTYb2YJFX6gfuHK/F0iM234i5moicYmMxE84rLhaZ4awqCZwm0NK905Pwds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202414; c=relaxed/simple;
	bh=31dsJw93MaH4qxfFDYt4j6u/IB/UidAtq1PUMNs/scs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDfViLt2Ri+wC7jF8lLwyvLeJWeSYqQOqfKxrWOs45LkrnC3IYsGgf9GF+yBqlk9LAYXLwiyKXsPlnW3eeuXh6lrw3EY0f/QkxG8EcdDiczHWRF+nlWSUkkoYhStMiTKrrXrOxIfE9RLB0UEFsIMybX6QMYPCsb6oKClMk0JLd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NsS5Uoi0; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NsS5Uoi0"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5439e331cceso5118882e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739202410; x=1739807210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rx7DL2mRJJgqnbpzuR2yiwWaIRwibqF7+lfnuzIg90=;
        b=NsS5Uoi0027yx7E+Wg12aocVSgMRisTAabir1060amq76S42BqvdBQxQTUhPV5ggud
         +HH3WH1mRcf2UshRguAVCPusrBtCRKG4jyBu/bSyxeaXdi03JMcO75b2cT+J2nXQ8hA2
         XXBIcvnhoA7N1ttFHCp76rg9FzHqrw/9wdH4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202410; x=1739807210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rx7DL2mRJJgqnbpzuR2yiwWaIRwibqF7+lfnuzIg90=;
        b=NuSekO0nNyUOxBHcF17iT3f3nTWjqRNC/lBv3tYZ4L8v1LPnxW0hYVGTNHXrwsI8Kc
         5XdI/zS36OFjG2YHJzdIFcDozbP5j/j6xKJj2zbzHjXHizOJV1qR9kT71FH/p2Uym9xE
         XYt/uf9WgX97ajs3ja6L6RTwoKbd0enH2Rif/+eUnbU15FakgYBLznicu6+BBuZE3sET
         CBTb3pg8icBwFsGDoUvgRnC2WO1YnMMsGz9m+Iik/z5kJo/yo7lmRxGNGvw8YdIgHbqS
         SnHBYm9Il22ylIjaExr+nbxsWVr7l5/tTJ+O3G78dG5MH6yzm2/7jEQzhIcIFo5WgbJ+
         2DTw==
X-Forwarded-Encrypted: i=1; AJvYcCVDdAejuXHRpESsZHSX1yWQjAKt/lr4Gc9N9eJPDguV6dpcLUpWd/wb+FMEyQoWNJy57es1tWgjHk3Cgxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzL0lQXq3su8Rcg6XBZF7zqj0BdxVnXCYner+82W9eYf81KY7l
	8F1qM0G9YRU4J2Z6jAiBp/c3KxHyZBWOSJNmUq42nhT2TtLTd5Mzi40EQtGOp1J7x2djNFyoxlx
	tyQ==
X-Gm-Gg: ASbGncukaa0O0h4uq14kRQggHi1YoRZrw1K5/cQIOXq+wdnqz2UJvJh/uvVoiRfC/h6
	DzRBsLnUOg+8Lb1KO+Rc/DANtD/eLsgRt+NZ2wNlhnM794uALfZnZDt1zkt3lwfptvMPRRx6yus
	Mo2wL7axK73B09+Dsg8EkykHgIvUAQvzPCrXN/Gl9uhwee8She507jKzmy7F2xJYBFGUpMJHiFU
	4yrckP9PxSdGMpqNcFGfPJd6gaUmqp3oIdPNuls4pxqfwRbPg6XHZWdVTfR35eeYa5AjNvuKGCB
	aOYPmNI51JKr7oMQosJAKWzRH0IdoYUaqHGmo4TDODnO69yhT9yfFd4=
X-Google-Smtp-Source: AGHT+IGtIZhwqvKLdfuVOzzDa5iGTx7ltKF1BcBtqZxvQbocqR7nK0GLgxetpYKbNLMogK9bW74zNQ==
X-Received: by 2002:a05:6512:280e:b0:545:5be:a6b5 with SMTP id 2adb3069b0e04-54505bea76emr2604261e87.49.1739202410243;
        Mon, 10 Feb 2025 07:46:50 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54502a58bcesm793318e87.194.2025.02.10.07.46.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:46:49 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5450b91dbc8so1145209e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:46:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUceIMUaREEpF3m5vwJx3yNDFVccxFXOrg+lyYEGW3ne1wuoR0n4l5w4qUED7ny7aAc7jObutbH7VT6Qxw=@vger.kernel.org
X-Received: by 2002:a05:651c:893:b0:307:2aea:5594 with SMTP id
 38308e7fff4ca-307e57f2535mr53532361fa.18.1739202028559; Mon, 10 Feb 2025
 07:40:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
 <20250208105326.3850358-4-yelangyan@huaqin.corp-partner.google.com> <CAD=FV=UNaOrZVnhmj3cNfJoSj9fc2g5p8w+cfk6XwV1Bcz+a8A@mail.gmail.com>
In-Reply-To: <CAD=FV=UNaOrZVnhmj3cNfJoSj9fc2g5p8w+cfk6XwV1Bcz+a8A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Feb 2025 07:40:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X2q2J_43Ree-cLQ-RCwXzxE7cODES+AmViyYBR-hXQRA@mail.gmail.com>
X-Gm-Features: AWEUYZkSR7Z9h_YcNYa44xtc55wxfsCFbVFhQKoqztzeXbjM-amo7wQcXqSqImE
Message-ID: <CAD=FV=X2q2J_43Ree-cLQ-RCwXzxE7cODES+AmViyYBR-hXQRA@mail.gmail.com>
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

On Sat, Feb 8, 2025 at 12:25=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sat, Feb 8, 2025 at 2:53=E2=80=AFAM Langyan Ye
> <yelangyan@huaqin.corp-partner.google.com> wrote:
> >
> > The starry-2082109qfh040022-50e is a 10.95" TFT panel. The MIPI control=
ler
> > on this panel is the same as the other panels here, so add this panel t=
o
> > this driver.
> >
> > Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-himax-hx83102.c | 142 ++++++++++++++++++++
> >  1 file changed, 142 insertions(+)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[3/3] drm/panel: panel-himax-hx83102: support for
starry-2082109qfh040022-50e MIPI-DSI panel
      commit: 1b80b2101d7b433718a21a9e7d413e066bf8aec6
