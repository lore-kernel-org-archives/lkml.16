Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AFD2FC3C6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476051; cv=none; b=pBMlVChRgc1DzFr4Hjjj1wgeM3c1hpsafVb6TF3Bkq2uhO8KCwcg6BpGdUGR1qWI8vOAxQlXU5EBJfC5xr0mvFjWcPYLWiw4X//86/ivIdJi2MB+Yre1F9z92i/Os2zvQRMVdv0E0iqb0zIMU/pIPpn/fEZpXl6K+LHIipofS6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476051; c=relaxed/simple;
	bh=M+vISXamBlP3ozifS/SwZ99717v8q0Kc6KegIFog+sA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VAaitrmmexJ9CeGqOov+aRq2zUJNX9xvzwSMTc4pe/xPy/eF+OuFy0MVFCKPiVhYTDJe5W/mWqYpVYyr9/1QFwSnGyrHV6+NQisMlp+icYOdVThihiwyBSDmstos545YJqljl/DBQjNQoZTsejbSfmpRe7S44XrzGkFa4rxdVCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DZvXDh3u; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DZvXDh3u"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so42904665e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751476046; x=1752080846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+vISXamBlP3ozifS/SwZ99717v8q0Kc6KegIFog+sA=;
        b=DZvXDh3uhX/1Qizqo8aCnLgrSFRFhsn8xq9Z7E2U/ZPR/nCC8a0wQpsIF8Bz+Jvndk
         zmTwEu2q0lBjKbuOBdkTU66eC2sR/Czst2GjYfjN8u4pCoUfuWNIu9tq4DeR3oMxcptH
         2WNbzxZWB22tATLV3bbGtWWoUpc66m2cwvY3671ZAhCD6EFmbSzmrwrGLo7AeoZCkKi0
         r5PB08S1ToEbn8CLZQD2O6BP9RzRdrh3nae+ieLbLMCwxffuY5Qkc/TXU7fAh2VQ/0W+
         x/7VsUVZJhGAOtZAFpeAFXo3/maXAVHOn2xUUZy9glj+XhnyvHyNgGknGtPZ0xS/n1um
         Y2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751476046; x=1752080846;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M+vISXamBlP3ozifS/SwZ99717v8q0Kc6KegIFog+sA=;
        b=YbMGzUGxrbAl3veVmIrt4IwPPyw1ygE7rjutWDF5QcljcRe5ZevBVJ6xH98riQeMkG
         l4pRrAiMIP8eJNWUa1zoWOJl1ty23K5fdfWaYDKc1zY1JbrtQI2H5UNiGTS2ZScIWfam
         vByr6voM5BbSlIqdr6pWGMwL8f8Z2ENha5laXsOLV4LaUFKeZzrmYG7jg9dHIR8iWBCV
         9s6J4NcujJCs4kbptUOzLH4U3CC22q1HHyW2QaVDtLn84aWJmgcsteDatKiYyFMfyr51
         GA/EUFR8X4suF9SB5vXuP3y7ZVnUgey2hwbKsPOWYsym02mjdeQr8wVv4/KQ7w7XlulR
         hN1g==
X-Forwarded-Encrypted: i=1; AJvYcCXbLYM+OYXeFi3H5C+yjTkL0C1VCAkJIdCNiLn3QZb0RYsRssXIcexSnhBZCN86PCXwHX5bFpxSVAI8U7M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywea55T5a+C6dzFzMfbW9fjgOxQcJTdk41gt3Vbj9ars+emrsRZ
	lt5pePF5J0+ER5sElqcSJauMfdI0MK48bMR75bxHCsfg1P+eFI1NuNx8eDac/l7hiz4=
X-Gm-Gg: ASbGncv853FyCnbUerg+7rzEyNMI+ikJC3W2fwCLkSFma/DQa0ihj4AR9ZJeaREuN3A
	uiY9lLfCm5NC5Bhc8+09iQpRbEFgDvJBFahSbUUC9khElrJytKYOjslJEHyJt9R8w9cfOo4vWcs
	MvQWCrFT2RyDYFUaNwuJFAAxaGG3etZjmfV23bH9Il4wo05U4R8IMy+eRTXHM3meinISE6TSF16
	WkkO2PgsYrUOcZx7P8QbgcHQWNzl8sBE3dz4w2QDvmYJdKk07WnqPcWeWYTdbnLNtXFTi4AB923
	RhQSwPYyHCVi1m7cE59UHafcHGBpKWnXiWFPQBOANmbcKECVUS7f26QwH+PS18+yUF3IrSEY
X-Google-Smtp-Source: AGHT+IGsc5GDljzmbKBoFeO/zgtvwlzCDxGi06+LsKgR6vPGC7cmyTyt4ATYLRK/0lVoCqPQXxkzvA==
X-Received: by 2002:a05:600c:3b07:b0:450:d00d:d0 with SMTP id 5b1f17b1804b1-454a37083b6mr36766495e9.19.1751476046563;
        Wed, 02 Jul 2025 10:07:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9bced0esm3171085e9.22.2025.07.02.10.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:07:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>,  Da Xue <da@libre.computer>,  Ulf
 Hansson <ulf.hansson@linaro.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,
  linux-mmc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
In-Reply-To: <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
	(Martin Blumenstingl's message of "Wed, 2 Jul 2025 18:27:55 +0200")
References: <20250628015328.249637-1-da@libre.computer>
	<CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
	<CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 02 Jul 2025 19:07:25 +0200
Message-ID: <1j4ivued2q.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed 02 Jul 2025 at 18:27, Martin Blumenstingl <martin.blumenstingl@googl=
email.com> wrote:

> Hi Anand,
>
> On Tue, Jul 1, 2025 at 12:00=E2=80=AFPM Anand Moon <linux.amoon@gmail.com=
> wrote:
>>
>> Hi Da,
>>
>> On Sat, 28 Jun 2025 at 09:15, Da Xue <da@libre.computer> wrote:
>> >
>> > Regulators controlling the SD card power need some settling time for SD
>> > cards to fully reset from UHS modes. The regulator framework seems to
>> > ignore falling times set in the device tree causing a few boards with =
the
>> > same hardware implementation to hang on reboot because the SD card sti=
ll
>> > had some voltage and did not reset properly to be initialized again.
>> >
>> > Add a delay sufficiently long for the voltage to drop so that the SD c=
ard
>> > can reset properly. Otherwise the reboot will hang at missing SD card
>> > especially with Samsung cards.
>> >
>> Although the driver defines reset identifiers such as
>> RESET_SD_EMMC_A, RESET_SD_EMMC_B, and RESET_SD_EMMC_C,
>> It does not implement proper reset controller functionality,
>> specifically lacking support
>> for reset_control_assert() and reset_control_deassert() operations.
> I think there's a misunderstanding:
> The meson-gx-mmc driver calls device_reset_optional() during .probe
> which will internally call reset_control_reset().
> So I don't see a problem here.
>
> The patch seems more about power sequencing, where either the SD card
> or regulator used to power the SD card requires a certain amount of
> time (delay) when switching from ON -> OFF -> ON (my understanding is:
> without this delay the card sees ON -> ON which fails to update some
> state internally).
>
> To me it's not clear if this is a property of the SD spec or rather
> the regulator.
> Ulf, Jerome - any ideas / inputs from you?

If, as the description suggest, the regulator framework somehow ignore
the timing set in DT, maybe this is what needs to be checked ?

TBH I would suspect the delays before the regulator framework itself.

Those assert/de-assert delays tend to be just copied from boards to
boards. Maybe some boards need different delays. If those are too short
for the actual HW, an ON -> OFF -> ON could result in a NOP.

>
>
> Best regards,
> Martin

--=20
Jerome
