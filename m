Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAC022AE45
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145537; cv=none; b=hgD7vHWe9iD0Q6w+FRCQEt9g2J35lydTY+LM0XTHyix2aw+luNrnMQ6bXahlMze/JqVDvuw1t1kHhZsmjwn2em60ywsKUkAzvLfYt4yB8Kv0deV2X4TERKBPjsGDjTzvvg8kzyYMF1hLyeTMuNWaU6aFKG5QCK+woQ7Fe5PTgBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145537; c=relaxed/simple;
	bh=rMddHsA3nzBTFN0QMqBt9MpSn7HX6CFwqw9BP1SyU0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EsUWw8H6aaT60GItah7fzbecAJlPbsHC401K4IIy7M3xJPJKA9S7CYIHgeBF7tnoHbTsJcfBjKOojw7eKZ93fcOCz/hXdjC8tsjG7locMap/WIpOABABd73xx6MFQznCwUp2qEt1ke5akQtecHukhayFZxRA7VLJG3plOVTYG4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xhxWABFc; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xhxWABFc"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso9750774a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750145534; x=1750750334; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DitCPFk6i35uURXkN5+J10Jk6mGckO0efyDQ/Ffatgo=;
        b=xhxWABFcIZeFn8Pt8t83WJmt64nDnT0T0VTvlOAp/BH4BTLM3lGm/h+5rm9elimzEb
         EBVJuja2f9E36/+xSe81Z9+ffnI1g9vp8Wvo0IpKFE+dsbjk5ekDdaB6n648KFWwaFYn
         /rQHkOXrKr7Xagn+E9jFrJG5KqbQ9/PqXZjvnQCQ96saCYdLgx9YlDsxhrKZXqaLvF8o
         d6s6WTFVp/FrwbHGVGIgLQzQ3lf/DZI5vROwOp8QbXrA9AxSe30n3uYTiCDlaxsT2N2s
         VeF/qWs/cqdpOHNYlioQ7s/3Rc86eEXW9+30jHT9hzsKNxBfNgNQOjLhjrTIHQF6uW8S
         nxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750145534; x=1750750334;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DitCPFk6i35uURXkN5+J10Jk6mGckO0efyDQ/Ffatgo=;
        b=EJ0y0mQ2r5aJHbgx2oE3meHGLVQuTh5qPVFx8Pfl2uiOkuPHo5NN8t7I11QNYImM9m
         YA9SLoAktq8wlLfyjSylRIIoFp7OW3CMs7FPdLn2VLIrQXdzaK0Ryanycn9Ohz3YWiTc
         HDX6qhfBHoJ34HPXk4uEZMPl6WhfVq1n6OvsqM/G69rFJayH+hZE55O95qSUbxeVR63N
         Mv2+xC0UrfjAswYvF/Vtts/avw0226kdep8j+Hme0iHUGH6Qxcb/dUk2y/GrwPqy1uha
         stO/2dMpSJ6Wz+VhUOU+8LKYCm2opTcRDKEwKzZdvvRmPwqbr/KH2fmVVIdfPP7liai4
         Gfeg==
X-Gm-Message-State: AOJu0YzYHr+yvL0qOQx9W3v2C17LquZDnTXrG2gUJ60KZseRLCx77Xta
	qwmz+8KsYgfPz0asF9dhttV4+BU14gMSzicM/l144XMJuXM8GSsjbbrwSMEaAhHtvojH/0zcp+e
	9LjaB
X-Gm-Gg: ASbGncvk/fvgK0EIJirxPdnaEid4gLzXI9YoaEswhfUpDURdfgVu/C5yo3G1jvIX8uB
	8IXU7PolnGZxa1U0AFnjn07iJXKUZQ91oOsH29p5rh+9skYM0ZVJsPD5Xvhy37uUrlQvrf2N3p4
	AgRjHJ/JpHGYz5PynkLJQa5Iot9QiLKX2pzzDQLcxyfQ2y0JW4iu6OpIpw4PK3skDCyqsULNFUy
	kBs3VRWIuNPxYbxNTKfJe6IDKZ3CeLempp0zXWamlGrrFzDRTf7796d/X1hGqWIrnpJDbMOQZhk
	BsjvmliFUCWMrWyJUSiL4jsiJRNwP9AtfMghxGq1A/2PVDFJyAXXXDjQg81zSkkwc6+10K6qp6+
	T6aTNrdBpdEDSV+hSQHbEBGa0aTyZ
X-Google-Smtp-Source: AGHT+IH9/yGt1B2R5aOqGlO4giU7a4MpvEhipVbdlnV+bODahZF4ciyHZm2yTFfr8OIZsO0wiR54nQ==
X-Received: by 2002:a05:6402:4402:b0:607:d234:7d8f with SMTP id 4fb4d7f45d1cf-608d09af98emr11886262a12.33.1750145533721;
        Tue, 17 Jun 2025 00:32:13 -0700 (PDT)
Received: from rayden (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e72csm7605436a12.48.2025.06.17.00.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:32:13 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:32:11 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE fix for 6.16
Message-ID: <20250617073211.GA1005592@rayden>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this patch for the optee driver. It relates to the FF-A driver
PR https://lore.kernel.org/all/20250609105207.1185570-1-sudeep.holla@arm.com
but it makes sense on its own and can be applied independently.

Thanks,
Jens

The following changes since commit 0ff41df1cb268fc69e703a08a57ee14ae967d0ca:

  Linux 6.15 (2025-05-25 16:09:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/optee-fix-for-v6.16

for you to fetch changes up to 312d02adb959ea199372f375ada06e0186f651e4:

  optee: ffa: fix sleep in atomic context (2025-06-12 12:04:57 +0200)

----------------------------------------------------------------
A fix in the OP-TEE driver for v6.16

Fixing a sleep in atomic context in the FF-A notification callback by
adding a work queue to process in a non-atomic context.

----------------------------------------------------------------
Jens Wiklander (1):
      optee: ffa: fix sleep in atomic context

 drivers/tee/optee/ffa_abi.c       | 41 ++++++++++++++++++++++++++++++---------
 drivers/tee/optee/optee_private.h |  2 ++
 2 files changed, 34 insertions(+), 9 deletions(-)
