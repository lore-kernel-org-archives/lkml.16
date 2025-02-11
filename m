Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C512261593
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739297486; cv=none; b=gGrG0qVrJD2gzq8Km+2HFw/ZBru+/DPT1zhMIPLhKJ6KdrNCUxru+2EQ5kflLYdavWichQx0Ywy69WOJ7i3mr2ymb6nJjMKE4Bf2w58Czy1BeMZV/+vBqkdv1n37AHfrttmkuUTZj17B+lbhvYEZdO6PY9A8FJq+5CEz7Ys1cbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739297486; c=relaxed/simple;
	bh=t2z0TGcTuAPS3en16uGOJmFEZmTm4ORVORgnxnYdmE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bXaSw8ahqRNhzBATtsSF+fXxQIveW/9lM8yEUC716QFPRRVzkRX3MMMmnYOWHjALDMEDnNL9gMybNWWMZR5qbtL3Ofa4kLUXvq+272V/3mYxUIKzRkkBRgBBV9RtE8NHZMf4ickPRvLSqNxazosRK2b0HlEVTR7CXq4u1zNyYb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lJqWu29/; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lJqWu29/"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5450f38393aso1956707e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739297482; x=1739902282; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOR6oCbPNGiKYYmVFz/bRuqX95zBVVFU7pDPu2MtVcg=;
        b=lJqWu29/6pkBOPiWwOM/ADgaYB77PuIqqnl9DzLM5cdigVl6VbZHws8v5uqg60sPza
         X0XIjknRUkjGH/zP/ffqaV6CSJx8vFk9sMe4BmhuWuwjBG5kmXOFvnAlZFjw5m3f80i3
         Wl5mRDkjTsb6yWjahquGTMdk5cqKB46auDZVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739297482; x=1739902282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOR6oCbPNGiKYYmVFz/bRuqX95zBVVFU7pDPu2MtVcg=;
        b=uDTXQW1Sx7h4lOahiECJ9qTwqqygv9MbKVeywODgwA6OOviPvRSYnyONKy7jN2yKxX
         YrkEr10l93hSQGnpJ7DoFRihkM9wb+VhzsZPVI332T6maFSUYDKPLomfsKmQUlnS57UF
         Z99zOl0VirTeweemPYenSjoa7H/fkk3slQuKTJKwb2+5YfcznfvVQqxN32TyncU+KU/8
         Qts1kt7xRPCHGpxBQ3qOJzyG6XOg4V2Vf8P52CfOWrJSIqeFXe/b7Q6Hdj+uI0u46wA2
         ivJF7m39wlw1wr7S9e5a82rpG/cv2ZOCCuHdA4WSUSND31NIP3E0UkyRYevOZFTDaYqr
         MMIA==
X-Forwarded-Encrypted: i=1; AJvYcCUP1XGVvxEDLe6OsGQ/99m4ZcY5Ak0dB1T8HChw50ZvS7p9aOW+i2ZR5rMYUk7DzeUxz27CHg+16AVE3GE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx020cnECSB7fVYPHuvbzL2zks5qYsvtHvSFocCMpLknbrEtgB6
	DCDaUjD0sy92nq/Qnafrk819WpHaEVzaEBApR5pjEUS7Sna3+aVTMY0IHLHrWH/mSMEDz5wocWE
	L5A==
X-Gm-Gg: ASbGncuOUaR5+wEF1Sl9Xc/3SfVCuDteDNUH6v2XM0KcHrkhsY4vI/L3X6u3es9iQG5
	CFXyGqKlWS9dno4d2LSPtEnHm+V/gA0m2nAvZGc5y2Bpg2W81vZk/iGAJFH8ADNUMFFEQs1o87v
	z9N0ZGxJZ62XVWLO2vhgEEB3x0whCt51AvX9XYTD7jaJCi0XCXGTcrEfVwOFoDSx0WylhqH0yuK
	Ur7bfJR4NQz/m9fOFAYNzLHb3vKWvUCx+tbmVfe8xvc24qjWIbDEbT14+Ogdvb/GB/fv/Faco+1
	QUZhq1GULrE52ujCx2ISUuCgcxVcjJWEyQ94uhv7k2O1bv5epqRpJjGXZDo=
X-Google-Smtp-Source: AGHT+IEK4bekEKa3hEULxMGCtH+hjh67qsfLZvqyZJmla8J6Z0IXLySPcxjrtE/s72Mchxm1xa316Q==
X-Received: by 2002:a05:6512:234b:b0:545:d08:86 with SMTP id 2adb3069b0e04-54511845849mr1785244e87.5.1739297481797;
        Tue, 11 Feb 2025 10:11:21 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105bfca4sm1619350e87.130.2025.02.11.10.11.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 10:11:20 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30227c56b11so60951541fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:11:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNRL9RnNU/sMs3LBiAF+1IgTcz2jj5c/Jl3QYXiUh2MjcfZu9PnBupPZFv5gSwxeKfS/Jb0ylcOY1Vxjk=@vger.kernel.org
X-Received: by 2002:a05:6512:3c86:b0:545:d54:2ebe with SMTP id
 2adb3069b0e04-54511876710mr1766395e87.43.1739297479301; Tue, 11 Feb 2025
 10:11:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211014314.94429-1-sre@ring0.de>
In-Reply-To: <20250211014314.94429-1-sre@ring0.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Feb 2025 10:11:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WoiHvJLjyUC7djWtxmr=EqVNN_S6-q-d1+NqHK2nPk_A@mail.gmail.com>
X-Gm-Features: AWEUYZlr7-24Rlx1xc75OTjdji6RuHBK7RjYLbxD-SI9lV1I-5r7YXp8G2iQa7A
Message-ID: <CAD=FV=WoiHvJLjyUC7djWtxmr=EqVNN_S6-q-d1+NqHK2nPk_A@mail.gmail.com>
Subject: Re: [PATCH v1] drm/edp-panel: Add panel used by T14s Gen6 Snapdragon
To: Sebastian Reichel <sre@ring0.de>
Cc: Sebastian Reichel <sre@kernel.org>, Johan Hovold <johan@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 10, 2025 at 5:43=E2=80=AFPM Sebastian Reichel <sre@ring0.de> wr=
ote:
>
> From: Sebastian Reichel <sre@kernel.org>
>
> The Lenovo Thinkpad T14s Gen6 Snapdragon is currently sold with three
> different panel versions: OLED, Low Power IPS or IPS with Touchscreen.
>
> My Low Power IPS version had this panel and the kernel complained
> about not knowing any details.  I don't have any panel documentation,
> but as far as I can see the same timings for the already supported
> CSO panel also work for this one.
>
> The raw EDID is:
>
> 00 ff ff ff ff ff ff 00 0e 6f 13 14 00 00 00 00
> 00 1e 01 04 a5 1e 13 78 03 82 53 a4 55 4d 9b 24
> 0d 51 55 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
> 36 00 2e bd 10 00 00 18 00 00 00 fd 00 30 3c 4a
> 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
> 53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fe
> 00 4d 4e 45 30 30 37 4a 41 31 2d 32 0a 20 00 8b
>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
> Hi,
>
> I'm running my kernels on the laptop as a daily driver with this patch
> for ca. 3 weeks now and haven't noticed any problems. In case they have
> better documentation I added some people in Cc, that have send patches
> for the T14s DT and thus should have at least one of them.
>
> Greetings,
>
> -- Sebastian
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

If someone has better timings or finds problems with these then feel
free to submit a followup, but until then this meets the bar we've
established of at least documenting the EDID and the fact that the
timings are uncertain in the commit message.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/1] drm/edp-panel: Add panel used by T14s Gen6 Snapdragon
      commit: 50625eab3972e5d37dcf3a250d9e3cdecbd6c13b
