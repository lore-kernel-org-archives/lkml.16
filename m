Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDB0203718
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583644; cv=none; b=fxn3LghTHpC7KHXd5MwHb/LDedMBYwDyQI+pz75MkG/fcYiyLy3mJncPSnOjTTlh3YY3Zs4D4nH4jCGoq7VoWAAV5+nos+P4aUJ6RFvTYNhnKJu/P4O2wpzs+KNrDOeT16yeL6Ubzomyqmh6b9k5KPd/hIA1LYfOv58Ovr0Wyxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583644; c=relaxed/simple;
	bh=g8SiTDA9zor95CQ4OWV5SNbnGcVboltE6G1EWSoKjEU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uZYBQs+P6u59A9vO3zM7JC4+wKoLyjTFDrzvLZkJq1K08yu+iH7HA+tU+Rc91Aq1GAu++3DMeMMU8ntS7TRNmnV5O/xrE6FA/QuCPg2kcx8CG7BAayzSnmaCf5UXJ88ysuIdSHl7UZRiUOqRnuVJpTdaEvH+S2uQILYjvpoXnRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sCaKLxl0; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sCaKLxl0"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa659775dd5so45591166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583641; x=1739188441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35jXjGcOR4bmXM7lnV5gRQ0CqEpOuwcL1RUI2YMkKiw=;
        b=sCaKLxl0n7Uo6ApCKa1i6j+payXzfXEbMhhx/TlTnwBJc45ncVyZEY/Q8DwRm+LxLj
         I+SGZUFA25h0WLvdTddb9Q447l9KlahT4vAiPZFFAEQaLFz2q3b/obCyg62cym2jrFFa
         1h0e+MLiY2YLLIVOlEOZVyXCy9yiRaW84ShiGp45UrQ+i47v3nnWh+uAr8Fnfh57e8hD
         JjCKYYTErdrgSlUGBKR3XV07J/a1d50uP6mKp4bNpqZpN2KRihk0PmBzPVNDcoYkjk6m
         PlJwYhU3MHBAbJLzxRaw70iYDPnn5eJauRCeiJbKxe9iwGk0isVe3jv4hMDSOutaNMpQ
         UmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583641; x=1739188441;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35jXjGcOR4bmXM7lnV5gRQ0CqEpOuwcL1RUI2YMkKiw=;
        b=AY1H/9iz/6Y6KyjytXloP5BEzHFpFY1x11Xb0vase7T0TnsgHHdPx/nGsi5kFYoqja
         kdDmJEOcCaI9p6v40T/jif4JLRcB7kXDDrBi26PqSlxOtSgEAtc18ayKnc/OIu883HiE
         SJ+IR+CaVvTqWN4nATlusvup+eRAnjH+CfmEozkaU2qCfDvf6u10t0aVlcfwPPOOWHdC
         ssFklRvgbSP+f/imwAm7zU19AsHBzRNtjgZys5WlAiooV+K6jylVz3TCAPDrgtzWqOXZ
         o7UL1o47mQaW2sJDWE8eExn3klS6NVrlesF0mQEFXD5z0KDMxWl4maZx5gxqD3AcTQxs
         ZeIw==
X-Gm-Message-State: AOJu0YwMcPmeB4+bJfAuLXbc0XVTTnxxILeBATqtWdqLWfK4MU1YxjWC
	QgA0eXvLuf6Gbof4Td8bk56RqUs1Z6/IK5chB3pOARgHUuD3lCGs/PS6b21qaow=
X-Gm-Gg: ASbGnct9IkTEmoWFNd/rKgd3fsmS2T9CXDG3I9/w78tENOFzpeyiWOlzAc+d7PnvbVc
	Ko4lBa+mkIPNZX/2Vx9woWEgbmuQ57QiXtfNe5HbNC0KFBPxrxo+Dpf5DsdpIkE58K1IegT0WiK
	bi5gXcbygLRc50wC4ttFa3X/pWzpYhY3zH1Zn7XKoivpfnW9Djev2fCeSXhVEZ+VTdVuG1o3XYI
	tl2r52pVvBh1EVwxMmomuVDM40Q+3eSEl4TR5rQI8rum12jbSwtYfJEGFj3zhvQY/wiXyJld6JP
	9ZA4SE7ngAj+mMTghA1P8mY2PzluxMo=
X-Google-Smtp-Source: AGHT+IFitvrYqNcIGFC5Ax0+8n8vKeHJ1JWIBBmTXL3pumzrL8pMzTxggQhRfM5pj5JY3EmMxGbjcQ==
X-Received: by 2002:a17:907:7296:b0:ab3:76fb:6ad1 with SMTP id a640c23a62f3a-ab6cfdbb46dmr852633166b.9.1738583641356;
        Mon, 03 Feb 2025 03:54:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7e90sm750232066b.11.2025.02.03.03.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:54:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, cj.winklhofer@gmail.com, 
 Chenyuan Yang <chenyuan0y@gmail.com>
Cc: linux-kernel@vger.kernel.org, zijie98@gmail.com
In-Reply-To: <20250111181803.2283611-1-chenyuan0y@gmail.com>
References: <20250111181803.2283611-1-chenyuan0y@gmail.com>
Subject: Re: [PATCH] w1: fix NULL pointer dereference in probe
Message-Id: <173858364041.129720.4556770320956186916.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:54:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 11 Jan 2025 12:18:03 -0600, Chenyuan Yang wrote:
> The w1_uart_probe() function calls w1_uart_serdev_open() (which includes
> devm_serdev_device_open()) before setting the client ops via
> serdev_device_set_client_ops(). This ordering can trigger a NULL pointer
> dereference in the serdev controller's receive_buf handler, as it assumes
> serdev->ops is valid when SERPORT_ACTIVE is set.
> 
> This is similar to the issue fixed in commit 5e700b384ec1
> ("platform/chrome: cros_ec_uart: properly fix race condition") where
> devm_serdev_device_open() was called before fully initializing the
> device.
> 
> [...]

Applied, thanks!

[1/1] w1: fix NULL pointer dereference in probe
      https://git.kernel.org/krzk/linux-w1/c/0dd6770a72f138dabea9eae87f3da6ffa68f0d06

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

