Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7667D28E56E
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 13:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141584; cv=none; b=fbLtADP7bD0LPguMMc92hBqz+CtEEY/epKvMn+FJKfjyXUSti2hdPLVoZqR7vwnweegAkaH9pYdbhrs3UxSZpgfxoUiZSwL3Tbn6C+3MQRZChpmFPY1L4HaJ5hEGay8CSeXKV0hlsbq3gAaUE0yOiVK4hgp0/zH6Iim7gxZ3DOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141584; c=relaxed/simple;
	bh=L3zCNxGeHbmJ4ou2tiPDwvsIuH9feK9R89XonhcL5mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CyeNmVtIEF7duPrpF4zjq9lf7EgDvP/+FYtbwoL2pN76I89pVGbijPvAqIB7DU4kQMOjY3sI966VUf0kjb45vV29QFzMgzivSXAERy35ZJSpHaOYAWtMzNiHZ4nsvtaBNyTlIp67VQicvjSLc7quJzKISeC8MeI7j3rWN7IgpBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yUsq8PJQ; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yUsq8PJQ"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54fd1650b83so3244793e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747141580; x=1747746380; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3zCNxGeHbmJ4ou2tiPDwvsIuH9feK9R89XonhcL5mY=;
        b=yUsq8PJQJj/sgXO3P9eqyIza3hD4o4tyy/vonPiCuHAVop7T8sLy3GN+U2TS4QE9qg
         kX51GpOHDGRaoJ3Hi8o5I0zWkgDAiE6PhUc3cZh2nE66lvi7axv7cjRLDnSzuTf4QKmE
         IW/PQ6MUNVsacGqvgB0yESwGJ1PFF41NXUU+yYWR3h9Xbdo6B+4WlHXjgZGRfSo2Wae9
         uAvQIUgYHfm/RVrPXu7Vjd6iF1lm2A2FWVw6ytFZFLzbIdrfpHNs9AhUMQyEuzJKBOOI
         IcRPCvk5vZHajMWAO5bCTT9aoG1HmHYK4RoX6KyPAqaZN5F3rzERJ8YcIzMH9OVReI0G
         0q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141580; x=1747746380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3zCNxGeHbmJ4ou2tiPDwvsIuH9feK9R89XonhcL5mY=;
        b=uDb7DixZpauSh/jAL+Y9kJnWH7KBz36a9w+9t0qkVRNPWxA9xrkP++8VUQtosx1Bl0
         vdOzpmCZ2tb+c/9Sc76ugvLsQ6/j+QS9jbohvz91ahqtm8UPPlrwCsTD6WRUmwQnwrx3
         0/xoS20+kW6CggzHl4+oWRH2EaLtsoznom30mJ6ETUA7/j1egAV/OPqSW6Sgf18TNCAI
         xYuQkX6hjQC0xSoRd2L3oU87BhLWV1vZCGvvHOIq/rl9gWFSt3LrjfawSXS2dX9xrmqG
         BxFECASPpYvzhxaC1dRw5ae77IJNf9QWAhvHnpul6wCvs/gxSniyPBj3Bsz3GqH4nR+q
         IXTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRYQBT53Cl9aMrqiUvoiD/tQw5E6tLr6TsgcJEIK+mgXS8Sse/HGNIoi58C6tt8JvzVCTC1aT1r2r949E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqUuumixvjnVwFDeRj/rw+eAxBz4ONKKPX6BP3fqY0TjxOI4FP
	q0/Ep6TQczmGsK4l27KRBNmzFS2lTCQwbgMJzDH2Yiqbe308J5TNiCoPfbiyQ0f7/RyUh4MMlZK
	rIxJEGpEuFnGuYznG+Q+F90Di77FXdiYP6+3FJ/leEv4ZIYwC
X-Gm-Gg: ASbGncusnkA0fGmyZtXm2FC51x81pZXk/UlAyvurzdDDGtTTphng9PInA3buOfJ04nC
	eY+L3zLkbYOLSKpOjbWeqEb7lIjxsVIcPgyAOEwCoDgiZL1NQzYO8mZx39gYYF+hqMpHWMfmQQ3
	5cKZbmDaJ2h8MM7hxfzQO+JXtgyLwIcAgV
X-Google-Smtp-Source: AGHT+IFgVxCDXAWbybreCxKR0Wftlb7giGFDaBFjG3lwzRxw7lyKYP8gOF0rnBb55gNe0R92SSktLH2rUh+tT2b0C6w=
X-Received: by 2002:a2e:b8c1:0:b0:31a:4906:fcf6 with SMTP id
 38308e7fff4ca-326c454575fmr70975041fa.6.1747141580265; Tue, 13 May 2025
 06:06:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507143551.47056-1-brgl@bgdev.pl>
In-Reply-To: <20250507143551.47056-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 15:06:08 +0200
X-Gm-Features: AX0GCFtfYDDV6M_mfaAuX98JCWZFJqSNYXOqleX0yy9Z5K5Dw1ID6H40dWPGXXo
Message-ID: <CACRpkdY+mnFxfW7zaEx8CAhuS8eaH8SS3N9bm90BUTqAbE5tXA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: add stubs for OF-specific pinconf functions
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 4:35=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Allow building drivers using these interfaces with COMPILE_TEST enabled
> and OF disabled by providing stub definitions.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505072245.OgSXI1hh-lkp@i=
ntel.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patch applied!

Yours,
Linus Walleij
