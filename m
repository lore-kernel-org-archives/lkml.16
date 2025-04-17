Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA9B215066
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876638; cv=none; b=GGz2lKRBxtNyLdfhJIe2II4eU9BEqobaOXcmWmVlDK8ZDLxiHlGH8KeXgOEFY3vrIrANmU58VeOC/5QNaAje7K+yCuLqDL1uEnb1zTkDnEbcxlvFL0d9lNWgmQXGfuSRmFTG5PjohhoLIONPA0kSq6PTvvpY5lvKPiDmWJIoSJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876638; c=relaxed/simple;
	bh=H9C3ShvGEXD3FDi73Pb6nidSwsvRSbYWc02XP8/91pI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HqQJYCbScnt02ac6FTVcOkPqlTh1NFwO8Tfq8h2YhuN11g1V5WVplJgjMRVIxWeRPMI7TrBGIpzLfvfUhcVDTB23jzNkpdRQbgSVUIE3MO8Xs+23l2TfPkRZOfB0DMaKn7BgtxiLtb+lt8Li2E2ZbxBHz2xsN2VZzQXWbXff5JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xvr4TQm0; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xvr4TQm0"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bef9b04adso4716911fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876634; x=1745481434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/Jl42SonUBh7uWEDi8GR/xF1KhzAcVX2ukREj09fKE=;
        b=xvr4TQm0tJdTM9IqKzMdOI0N6PLfe09A2/JISDy+jRDvL1deIlCJAFjJAY0Zni1XPN
         +QjHNPebArcv6suLlx5I7mOyatc+kHZ47n3/JNTRN/5Kvwde/Zal5cA/u8bq9BZ8Cc2I
         yBgVKqO5yVt9WEzHbr3vxtbhwZqxkqz1I0ObmRH8foaXedQBC+HSavptzVlnwRIBo0+E
         JthpKZn7H50pjPHFJLy/iijz5fszqq36FuIBNeBoD1hSbYwbNVIXhO7cWpONa1hOobZ1
         VNSDUKVFngldsVsHsRTn8FRJAZBZMoaCaTpXDTUUQsHdeS7a4WzDjlWW1xqDnPZEzBl2
         qGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876634; x=1745481434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/Jl42SonUBh7uWEDi8GR/xF1KhzAcVX2ukREj09fKE=;
        b=DOXFN1rZKGCRgEcACPfKzc1/3e4793OHulB0W+sNzBN9F4lETFCuVYdjP0Hyk2HFCO
         TLsBQq/+qlYYQeGD6IrrP9BmUZFaQMUdizCyNJzkhwe1LpKAZriT4rVqCHhWO2o6+mLh
         wakY3m81NRrqEGLLd1+SItlyVU+UrpvR1ahNVwg9kXMT49ThfpUpbtU3ggrRIYr2e473
         R6X1rTnAnkbpfbBRPtOizIa+nqZGh8+xPYNko5/BRjQLIiInVCH3Rw/qNpr+CxZAwZRE
         pZVqpD7Y0Eww80iVyY2nGAXnKOaltoLOQRcrWdh1oDy7mj1HHXwcBE40gilmxTTqM8G4
         DuJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0MxdyRkW8OFoufLKxYGb50YqIx2PNddDl0m6W6NuBiSenIz8SgvbU37044c/X/iwUORfBX67Zhp8TxeQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa/9rCVenRKB1hWubMYnSsJpzOqjDkybqdyLYczSoUqPFYPRAu
	2lDq7mUzO6uVbMRN+4MgevMifhNiuF40BPiQia/AwsY4HbGAQdaer9GI2wSoqSHd1e5jOjfBLya
	eMD3ue9LG0BJYKH/i1iGaqnceAM0W0T/ZpLG/0w==
X-Gm-Gg: ASbGncv7SOqtmw8niDhP0ZiW47qcHYoUg/Z8N6tjw4sc1eMRls343kzhU6ye3iD5H4/
	EkRjGVlhXJArhudeLgBo5WuFqkenc+NtRwCZttolvDd2kvhzyeaivm81y3mTESxk99LM0T4BzZv
	bTDVRz8RiMVoxVWBdn8Ot4Tw==
X-Google-Smtp-Source: AGHT+IFbq7ZcNiiPt5sbevvUX1breN319anukYgU/eYzOsa570CJPpK8YzBEG5vusdZekARs8CQoaMTOyB0+fg/Ao5U=
X-Received: by 2002:a05:651c:1247:b0:310:8258:c09f with SMTP id
 38308e7fff4ca-3108258c126mr11913731fa.26.1744876634235; Thu, 17 Apr 2025
 00:57:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-aaeon-up-board-pinctrl-support-v3-0-f40776bd06ee@bootlin.com>
 <20250416-aaeon-up-board-pinctrl-support-v3-10-f40776bd06ee@bootlin.com>
In-Reply-To: <20250416-aaeon-up-board-pinctrl-support-v3-10-f40776bd06ee@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:57:02 +0200
X-Gm-Features: ATxdqUFyphNfFRPd_Qt-ltWr9LjJT8Eu93B2bQsVaMpP0d1EbU0HffBXtAWIxW0
Message-ID: <CACRpkdY1bu11Gj95DQQBirkPDPzhQvCTqk+4FP+WhyuzxuLVAA@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] pinctrl: Add pin controller driver for AAEON UP boards
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com, 
	DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 4:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> This enables the pin control support of the onboard FPGA on AAEON UP
> boards.
>
> This FPGA acts as a level shifter between the Intel SoC pins and the pin
> header, and also as a mux or switch.
>
> +---------+          +--------------+             +---+
>           |          |              |             |   |
>           | PWM0     |       \      |             | H |
>           |----------|------  \-----|-------------| E |
>           | I2C0_SDA |              |             | A |
> Intel SoC |----------|------\       |             | D |
>           | GPIO0    |       \------|-------------| E |
>           |----------|------        |             | R |
>           |          |     FPGA     |             |   |
> ----------+          +--------------+             +---+
>
> For most of the pins, the FPGA opens/closes a switch to enable/disable
> the access to the SoC pin from a pin header.
> Each switch, has a direction flag that is set depending the status of the
> SoC pin.
>
> For some other pins, the FPGA acts as a mux, and routes one pin (or the
> other one) to the header.
>
> The driver provides also a gpiochip. It requests SoC pins in GPIO mode,
> and drives them in tandem with FPGA pins (switch/mux direction).
>
> This commit adds support only for UP Squared board
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

From a pin control PoV this looks good:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
