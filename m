Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB9C2EACEC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618533; cv=none; b=ELiWVcnIddh8K4/Jb8W7LY2zM1ads3BVm7MBq22qca6ao+3UxzZq/4+MwgDRMYUbW1bz6lJihPFK42wvZXlllzPG+QNbXlE6LOHNLv4OwQOmnS6ue7QMm3MR0uTNwqEY5ygTMkjQdzUBLAuIEtvnwpjwKwuOH+vuZZCw6MQG7lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618533; c=relaxed/simple;
	bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H5tM7wOEi/AKBLHAvfAd++RvDw1itlz8P7EoxFD3YyGH10UXkJclDh8L9Iy2nlMgB6tGv/XQLdyPK4tw4NxPzLoAG/jPSL6k1DvuYDLLrk3pkDTJSPNRyLl8dLrD0w6tbYF90eC5WV7wLNUQDx8/jndU3VxTlh5/HLjsYcC/rqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gLGEwzJ4; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gLGEwzJ4"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553b5165cf5so1023229e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751618528; x=1752223328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=gLGEwzJ4MKhRRfmtktXR+ZuemV9IpXsYkkNPIHZEgUvE5NSrFC8uCw9veHSSgAfTPD
         XSQnNEG/FM2Ids/72MiTwqxtzYPVdOBNzACTZk681CIkwIQl4J7ALUso0/7AWgP4AR+t
         sW2nXdJB9+Zyt9ZjvJ0QtRxfgaROFy7aMUztnQygs0StKppssY/uNNY1Lvp6qnvMuiA5
         s1hKKBuQ3jHQ5sLUitk9v67i6Cy440E5bT07INkFBM3Jg1SAMNjPcNUZOac0p43eNkdq
         9tX/8ws/j4NqGB0Yl3Jl6fC95FqnCku7m+Vt5vMQ+Src5pKSJ4W32ahjr49l5PRbfeNK
         AIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618528; x=1752223328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=Jim2oFWAvXs30Yo6HlmYWkTu2/RfXWlt41s+jSqr4kS9XABToPjfZtC5vVTTUT8KXw
         iMXVfC9Ej9Bbdj/JQI2vg6hCfrNKbK6y8aDiHUl6Ejey5k+rXJJkEOy8ctAYTfTCyKP2
         zzvJ6tox4+z2ApjNVw6cnNJn/k8IURCFOb1ExyRiHJHckqs+mLTsA0eD0vr/W6u9KQC9
         /srqF4D+RQD3IfD9K83d+tE7VeV7PZqEf6/BIvY9MiQ6e9jWz7iQw8mbIfmJaUXTA99Q
         ymfGNGKkxV+N/16aS/F8d+VpO/jVT7610RrU4d+WzTlkG0v4QG3HIyB1rLkWaqpaeJjx
         RtyA==
X-Forwarded-Encrypted: i=1; AJvYcCUEstApMjjeD4+FhTUJcDYFrXkE7ojSQUAjzt1fV9MI8oAEomD/fNl/ervIkdEoXvjMP6SxMcyHGMkSxyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSOl0wvO0P+cbDBY9nM/rSJYmikFdDMjzOcNRG/0BR8WqRvshU
	+g6edIIlSSXfq/acbolpluHZ3AyDdWqAFssqJRV0g7x+/fPXfeW96HZUQxowBZQM459XLIefRqd
	CkXZdtYI8ioUWL+MZ1fTHJ+Am65c2Fg82cN8uNpIECQ==
X-Gm-Gg: ASbGnctmovTE0Au9BYLOAt3UBECfmaRs9jemQ8ZhD32Y5QJIplL8HHbERmNIPGKmOft
	9VT3st4n1JeD98g40tNcMEUBw50QWgMNTNj6Do5JMDJZkFXNRcnraMovcfp/4vHYSgxRKzuRYVu
	QGJo0+sv+dUFek/r+ynR/DSXUlK8eNyLM8uONoOKg+92g=
X-Google-Smtp-Source: AGHT+IEIeiS5+KZyaGhCBBX+93N/pubVgGcVYQr2W6OG8DuFwjazUKd24Jxz7fX4vBW8k0oDMf7CGp3FusWtoChh9hw=
X-Received: by 2002:a05:6512:12c9:b0:54b:117b:b54e with SMTP id
 2adb3069b0e04-556e6e31219mr538577e87.57.1751618527728; Fri, 04 Jul 2025
 01:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075422.3219401-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075422.3219401-1-sakari.ailus@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:41:56 +0200
X-Gm-Features: Ac12FXzMLrUX6BaflkS-OvifdrPlGBvZOznKCQ7FBkMZw8cOBeFq-unkAG4IUhs
Message-ID: <CACRpkdZdwh=gpkpeePVFNJGTBFdyjku+SwMrsYGM22ezO82__g@mail.gmail.com>
Subject: Re: [PATCH 32/80] iio: gyro: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Julien Stephan <jstephan@baylibre.com>, Hans de Goede <hansg@kernel.org>, 
	Waqar Hameed <waqar.hameed@axis.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 9:54=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
