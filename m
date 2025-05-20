Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C16A26C3AD
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760519; cv=none; b=EIV9Jf+BqsUAypN/VmMzPMqr4k+48YG/Y2m3soEI7eI4NprwKDFhPTWCgsTtsbST4D7+xA3qUUMILHdLIwJsq34Cxbu2DksOIpUxuXAFNHZDYoiMAj30LYdxOeNc4W9OswCbv6K4A1PyOz6cn/44zxfMlUTGFOEbFFUow93ZNW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760519; c=relaxed/simple;
	bh=xZSsRnGyyhGYsnjsOlnRkVM93KYOI+VXorAm5KVz+YA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MfAW1oV8G+KNcVeUR2jTlDjordVsCmQlLyt7IjBq0kLr+38q93IwOdZBtB+OibAGGL/pyV2ToA/nKRKUj9eOZxF2+vj01Qxyub6NgeWa/z/g7oI3R+e0a11Sf16YwTmGuvFXR9iGqI6sQo9nWktE4l9EOXWAnHvEe9TSZMDdVu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mmbT9233; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mmbT9233"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-329119a3a8eso29152551fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747760515; x=1748365315; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZSsRnGyyhGYsnjsOlnRkVM93KYOI+VXorAm5KVz+YA=;
        b=mmbT9233GWoptDKlBIfgO4eJ7FsGvK0jq2kBwKwcafGEENTY62KnK/2lxqGkiCFWa0
         cNLL8iSHSRQ5/vZgYUYZleYwFuEFgonDKzd0n7oS1fIVm0WB1V8afG8S5RwidQuxF8J8
         8zLKsjP1b91lrCPPylH+ci0w2zAhDlK1CBfJcyvwo0yz5jUEkqzkcvtCWVF7CF5Fiab1
         YD90Xi73PZaQMPIdugfzTH6fYxoLN/gDCDxA4/Yq/7xF6gyZf3xFFj+dhiarAISrvPOG
         vc2JbX2PsZs1or5FaE/tiI02wjfOyM5FN8XTzNOSonz6mkfTSaMx+RX2zoqvPXven8Ws
         gs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747760515; x=1748365315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZSsRnGyyhGYsnjsOlnRkVM93KYOI+VXorAm5KVz+YA=;
        b=vqzXnLk2tYN+WIO7TgaCY4oprB19NrOFujHOxru803jTtN4OOsSFv5ewqyvlEzIJ7D
         BTCJiDGaMairPBK/9nsDnvZfwDba7Uszr+gtesfRMyNifUgUDIudNyXahg9GZot1dOXr
         ycivAC5QvgerT64FE+QD0QPFeM1Td41YLiJvQNP4Or3MohoCc7k96FnK2kf5nY05aOGq
         Ut433oFAGzAFIwBFNurxPTYuzxfdeN7WMwVTLY797A7ug0Z7Zxot7LiWtzB2S00LuSZZ
         9Z9T8RpKtg2r4eSANDsVKu74H/diR8zqQ+Q7X0sUeLTkgWNEQw4tQH8ZZ8csaF+seZj6
         pCBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLRD8Qun4KH7V/MDUwMLnUswxWLKHsLCAUzZig+He/n2l5hiW2G0ZiLZk22RM1DYm4TTRJSray/cxVoV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0CFyzH5kJRwC3zdHiSIrFdjCsMJFWNnNh6sfjUHL9uDUq5u2t
	SFqTUIwlDD3VjhOTr5wHKVLQDpQSHkPESD+maXhNIF/gegyuj+Wu5UmHIJLyk2NHsRVn7Qdm7+a
	u7NxdJY1j5FMun8r/mdQQXZeRK0TVEo/iZp7bxAEaPLNNlzhDOIxQ
X-Gm-Gg: ASbGncvvbo15HohEkH9azafu4qUf4IVCUhdKrnMBOizD6CI2zL/6rZQ15M/cMJESrkD
	HrDWD4681SaLViGVOh/6jirrm6hisl29EIxuy3CIyKGxkZpTabVPwmhEFAmxAyMC5raumh5g24n
	+XaB6X6WGiRp0pjC/kh44CzE2Zhoux73atjyImElWdL3AjXx/QotsweYMWJed0jNpa
X-Google-Smtp-Source: AGHT+IHGcton47b4SRlkezOs6A+p2hCe+G8w/Zc5+7fPgaeeCngttApkhFVS65avmm4vXQkmj3B+o9lmsenLqXUl520=
X-Received: by 2002:a05:651c:31cd:b0:30b:ab00:846a with SMTP id
 38308e7fff4ca-328083fe2edmr55164311fa.3.1747760514824; Tue, 20 May 2025
 10:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
In-Reply-To: <20250520-aaeon-up-board-pinctrl-support-v6-0-dcb3756be3c6@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 20 May 2025 19:01:42 +0200
X-Gm-Features: AX0GCFvExND99g3-ocicUC7hcVnJlz498K7QNXubedp0La7I2nGUrjQyAJvOsTU
Message-ID: <CAMRc=Mfpvh0jyNsOXj3rUf8bW69oq6fqt+XMf9EKunF0dni5+g@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:28=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> This is the sixth version of this series. The main change is the rework o=
f
> the GPIO forwarder API as requested by Geert to have more consistent nami=
ng
> and parameters.
>
> More details in changelog.
>
> Best Regards,
>
> Thomas
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>

Hi Thomas!

I appreciate your hard work on this feature in this cycle but it's now
too late as Linus will tag v6.15 on Sunday. This will have to wait
until the v6.16 merge window.

Bartosz
