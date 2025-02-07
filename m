Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525D18BC1D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917187; cv=none; b=NfhnsRoYcdRRwq4DwzmnyXG+tPdM1GUJ6wRtBhk6ofU86/dPnf/ZPY7b/QXX0/rGM6HNWcaHWKJY3NOJFLOJh+KSSwcK0+nEszm8pktb1w8khmox12TLTsQbHuauT4vWJKmJDqZ3wd1hneG2TtsJYJ1rcZZ1pz/96mU5J78EbqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917187; c=relaxed/simple;
	bh=FDZ31Nx3civlmwWIQQAP+ROKkOH2EWUR9BDacWGiMAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DfTQDTSGcGj3z/TfzxLY/NOXFEEUZ7QArV7SF8SherxAvmFlh1yLCM7TRLp0ReCeEDgCBZdTloyTAsot/BL0LjriJ85ldSEyxyO+KwK151JfGomlFRxnqII5vi0yYuJE1q2IJ5GfqDEH4lnhplsGLnQbGZXqgjUY6VuWCOnLyyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SfoCiJ9V; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SfoCiJ9V"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3061513d353so18968711fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 00:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738917184; x=1739521984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDZ31Nx3civlmwWIQQAP+ROKkOH2EWUR9BDacWGiMAk=;
        b=SfoCiJ9V/vHiHRjbGyW+Y2lWJG8yPIm37fEdVB15NIJlb7S5tB/xw2kFDZZRJrQ2W3
         EetzkglO9qerFRPG4XiUMExACleKkhO68Apr9m5hJAFSVeQDjV0Uv1KfxOdJTm36qtOx
         GD1iBS4TP8FKwBt7gq3gnOyVVvb/G+o4LAV1BfFAlCjAHZj2+FD0i+G3edMoM8DC36eN
         TiqaaOjfQIh773M25wfGlWWi3je1EMZ1SRMw+CwxMP97SzZVuvEEoLrp0wGETIPMmpfg
         C81prLIxwYEpLdhXoBAuiaLTQ0nqqdUIAdo0CSgawvyVwGF6++P7n7Fh3bWGnRC/9VnO
         lV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917184; x=1739521984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDZ31Nx3civlmwWIQQAP+ROKkOH2EWUR9BDacWGiMAk=;
        b=A6DlLKXEQq3Q38NPinmrYK9DW7aoixmHnmzU8IBYola+LxBtc2V5XdrO1klv+kX0MA
         N9B1gFM+cUPpQnXoKzm5I7xuIpGfmK1O1e8a/vr7J9AzoblrF5Ibdkh3FmPju5WQe/qR
         vbRVEN8ZeCgiVkFuvR1V8XiADaJaEZbNO/K9KtVw+Bhq6wsBVy1562/d7Zl77yYAeloC
         4VpgqVdseLk7YKEIaG3pAgGTROdGphKLXUL/Hrp5i4ChaqQdyRZ4Cwhcsa+7lXidiEDp
         mKFt8XH5rk2KEixynfitZalbGm8zi78cpma5dBcGYtl3qq4hFYmWYpXSdmQJ0v0Ebu5+
         v1mg==
X-Forwarded-Encrypted: i=1; AJvYcCXdVyjAAAzeV+L/yVgzTCJnl9AdIsa3OE4tdZXB/Uv2u5t9pyXznDiDa/LLopRll7yt0JKaOYl+8tCnmGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxhAp3s9KNVuwMgW8XgSCGuGaVsZFyuGxXi/aHr0kHGhI+39hM
	+pUYghF0kMySiiIO12ZOf1TXtWIuBI10RJn3xwwF8sqYyQnzaQzL8TpUxKdtJ2Kbu83s8bVuv7B
	C7hVqCFE9sogoTybTMHJf93IoqiZyT8aL43tAxA==
X-Gm-Gg: ASbGncsusBFpv2dbQmwhQE1y2LEar0ksiaJ/9ITNbcRUT8LkJSmkh9yx7AZR8Ha7Q8a
	S18R+VpLdk6N7/tN4mhV5b5dIfWJhG36gNyBmG1x5feOdiebf/Jtx3l4JD5n3N6X8gcHFzpf9wF
	E9qZawMfX6gmGQeZtwgPHL1e2skq0=
X-Google-Smtp-Source: AGHT+IHgWB89hNW9OJ6NJL1Rj2tEIBIMQOYDoOww7bCgZyhnauDXQruFNOqLsaUZ2hE+SG4ZneFMitUz5QVDxTih6yw=
X-Received: by 2002:a05:6512:e84:b0:544:ebf:741c with SMTP id
 2adb3069b0e04-54414aa880emr710177e87.31.1738917183753; Fri, 07 Feb 2025
 00:33:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207083146.17872-1-brgl@bgdev.pl>
In-Reply-To: <20250207083146.17872-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 09:32:53 +0100
X-Gm-Features: AWEUYZmWklGhQOPVR4YjGZK1-XCvq6-AQnGa_lgtdadT-6hgqTW9nexvfLKNX_k
Message-ID: <CAMRc=Mcxw+O+rW4zUwM3roLxj3vAGAkepnVssyd7ifMvuuO=OA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: don't build HTE code with CONFIG_HTE disabled
To: Dipen Patel <dipenp@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	timestamp@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 9:31=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Hardware timestamping is only used on tegra186 platforms but we include
> the code and export the symbols everywhere. Shrink the binary a bit by
> compiling the relevant functions conditionally.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I missed Linus' tag.

Bart
