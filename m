Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A912DBF62
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160311; cv=none; b=OaK/IIpifuodygH+842f6qiyeSm0LM8urKiT45quiyl4nPVkkaZF7rpxYLU1Wm7d54FKM/Lceu0GjSqPRe3lAftCvIHP2zspwaeZfWvZYRzBYqV7ASC9wnptoLsiWypcFG1NpMMVIvWwm5uorjaboqjiV+WO6uVDrO43qJ2GAqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160311; c=relaxed/simple;
	bh=P4AbCE9HwyQ2ZcfXU7Rbe5yrBL7FeZqCxZ4VA6G9DXo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q7AQBUr5iAE2LnbanyfNLOY2tRiS0sMtc6IarihxS5yDPUfHm2VkfM61DMSx7gA4aKiPihLEX3xruKMvyvbnTUAf5d8P7yutr16H8T+KAkxkqdSMNFpvyX8GHAtcTjD+hW47keXcqPPhr+EFnvm5Bbd/ESIVQn8hnRZGMZk2Vjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=dqWinhLw; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="dqWinhLw"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c7a52e97so4638547b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1750160308; x=1750765108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iXTA6O2icv0/6SSOuEbzQHDT98BuIAlkIFUd19y22YY=;
        b=dqWinhLwbKlmmE8JIM/AN+Y+NAg+CRJbjV3IemjHoyPOfTIRgQQTBVKRTivPm6F5v6
         lPlpxOWyqLlJVhhzbvs4jrsqUG4XCbTVioSm3qXJnjM0iTqVwdcdR+P/8kTb5BsUT3bW
         zoXPz2MeungZEx0m3/arNQSBlQdhF84/T9FOqw6jDcodmZ4MrXMtHHVCKNa6RF4GKYzw
         dx8K7e6fGZeqim12lg4BDvprvk9USCzcOcvvWzBG3EBGL/9BRS06DVEWs3ms4o4+yiVr
         2VMKqtXELwDJk9RDJSqve5bgSL3ywZc8oSVUXmmPnb/XPs5IVF0mMhRFQ4adJHrhiChX
         RJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750160308; x=1750765108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXTA6O2icv0/6SSOuEbzQHDT98BuIAlkIFUd19y22YY=;
        b=oD0t3VNrgJvBS0gtVa9iC7ql85bD9A/IMf8I58U7f1cdkdqMy6jskkWYAg9oNVMKS3
         MHnajiSAcG1JJvD/2cgLlA78s+28ZSUDNnOhfHT+RSaX8ksOThMn6rrDSIELkOTsHugQ
         RcOEnSYuJw5ZdwmKM5+F5cgz8UzKTicFWYceFbmMnWWz/bZCR0BPrRvpioetPjh9EnK/
         oSI+ub69/PeO4T341yy7fpbaspTgfe/oeiCFrGTdFMFH+IxFpatbvh9FxQ2d5f6pLkI4
         32Z9QiFsHFZmEzFBcE39+9JucU0yE5MeSpeLP/qJPUUMHsnAe6aUOxcpSTLsl/muswyN
         areA==
X-Forwarded-Encrypted: i=1; AJvYcCVKeOv05Xe9Pf0LdZ9jhGE/UG2tWJxmxFM5ClvTU3v8ffPK8U9QSkB4QcHgpUDQ2bO26J62dLhqYzkNt3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjiYQ5lVX15WRkcWT9+sHW99IhbtWgYE6vKeSxRpdTPcr0U8y/
	xX4VR3svSPDqqHEng3mfcJkD6YhNt2+KrVFLe5buaN6bz0mDHZ68hx1aOpopdOKC4pY=
X-Gm-Gg: ASbGncsY5C4B4bzIjT+QM5QqIXLBiPdNg7x5eEZ3Rbn1yki2mtnaKEYXwY65r7nto6a
	XcDfdmS2c4sqLiAJLWInuRCP9S5GtKTAMbUjbjTsYxsG2UGksTeDgFcSSW61rmiGBhMnOl3bKJ+
	nUZ5a9DSeXnTaWH2v2/Jab3tjPRmrXYBmCurBc4RPPbqZdlODcPfj3H00V3SdHcHlk6mHxD95oC
	jZfScHh5ObqMXcF9+9d5M4YVB423FbpXhBzO+6PUZfPcBTNGAtrk5XRzjBoKmjK0Y1z63FX45Gn
	u1IHfbopUHneK92bJTuIiPyYNjLOc1+YsKxQtU+t9kjU8bsyFiX6fcOKgPlobx+6bNJH6fEjsZo
	BA49TzsQ=
X-Google-Smtp-Source: AGHT+IFy8vG0i552QCOGwslBhMlllbWowf+/C3BEda62UX6idzHbM3JUGCvEtXfh71U/+1SbpbVjVQ==
X-Received: by 2002:a05:6a00:4b4f:b0:747:ab61:e4fa with SMTP id d2e1a72fcca58-7489cfffda6mr17768841b3a.14.1750160308466;
        Tue, 17 Jun 2025 04:38:28 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d1d07sm8549091b3a.160.2025.06.17.04.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 04:38:27 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
X-Google-Original-From: Brian Chiang <Chiang.Brian@inventec.com>
To: krzk+dt@kernel.org
Cc: chiang.brian@inventec.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v9 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Tue, 17 Jun 2025 19:28:42 +0800
Message-Id: <20250617112842.459037-1-Chiang.Brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f193825b-f6d8-4c27-b1f5-286af7affee1@linaro.org>
References: <f193825b-f6d8-4c27-b1f5-286af7affee1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 11 Jun 2025 08:19:46 +0200, Krzysztof Kozlowski wrote:
>On 10/06/2025 12:41, Chiang Brian wrote:
>>> On 10/06/2025 12:41, Krzysztof Kozlowski wrote:
>>>
>>> On 10/06/2025 12:25, Chiang Brian wrote:
>>>> Add device type support for tps53685
>>>>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
>>>> ---
>>>> v8 -> v9:
>>>> - No code changed, correct the order of Acked-by tag
>>>> - Link to v8: https://lore.kernel.org/all/20250602042454.184643-2-chiang.brian@inventec.com/
>>> Stop sending this to me 6 or more times. Every version you send multiple
>>> times, that's way too much.
>> 
>> But how do I avoid sending to you even though I need to send this patch 
>> series?
>> I apologize for the spamming due to familiar with the workflow.
>
>You sent three times previous version to me ONLY, for testing or
>whatever other process. Now you did the same.
>
>How to avoid it? Well, you type things into the keyboard, so type things
>which will do not perform above action. E.g. when executing git
>send-email it shows you recipients and then ABORT and correct the git
>send-email cc-list so it won't add CC based on tags (see manual).

Thank you for the explanation. I understand the issue now - git send-email 
was automatically adding you to CC because of the "Acked-by" tag in the 
commit message, in addition to the normal maintainer CC from get_maintainer.pl.

For future patch submissions, I'll use --suppress-cc=misc-by to prevent 
automatic CC generation from commit message tags like "Acked-by", while 
still maintaining proper maintainer CCs through get_maintainer.pl.

I apologize for the duplicate emails.

Best Regards,
Brian Chiang
