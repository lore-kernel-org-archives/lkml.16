Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5415B22E406
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669184; cv=none; b=ErKP6G2MfvD65T0I+Yjym6GHioNZH4VH2j0Q9J2ygmt8H+9PR+NnOfrhenJoJWD6yYhCkiqty2MmAIv1kGkkZFgpkeAYRNXSXt5ffR9Q2aZRbHfr/KSDfOB4Emj/KuNLI0obCues59KzVujaL9HSE649RyGiT0/o/eICfRkeljI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669184; c=relaxed/simple;
	bh=wRP/aCDs40nHhMlzv2gTY7KFcnDo0DyL6kLx7rpwynM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lhq8H4m3n6d/+Arx/YIBgk8lN6MPTuu0xPHJrRYqm5YrhC6BzzxcbA/PZjMimaVZsfF/ml5ZKUsNoxVJ0Dw8DIUGGj+BNDs4CDdmroxeShVbGSKqrxUlvcJmgQhJ1Vi3YbLYDPMEaUBDQeLt2JZDaRoZSfG7dt8fL78h9brGuoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--keyz.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rkqfBOcn; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--keyz.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rkqfBOcn"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7398d70abbfso5377378b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750669182; x=1751273982; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wRP/aCDs40nHhMlzv2gTY7KFcnDo0DyL6kLx7rpwynM=;
        b=rkqfBOcn1OVibTHHBRk4UJsP25EXe/invcu7rxZx7S7btTjUPX9GDmgvOiZVNrFJId
         ACanEvY/TzIaXDoDvH/H2XAAGQn7nPwjVZEM2QXkoSv9+5cmuV4ztjIEGnUCDTPjYprh
         QADNQSFaD5AuYO0LQfwGzu8SqUQQF+mLWUDOhMeAvkQTpHkBWEqBN5l4qnR1bOHrHL/x
         6Wb8UMB2CCUYD27+t2NgHX5Cear358GjylGLaSJwCRbNpY1xhqd+jSBjX66tdQhkQvi6
         9RCrEhonxhpQjRRDMHn5539WamtwQD0LmvXLr9CnMYG+eIwVDQktFMw+PPGZp8SHibjj
         kXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750669182; x=1751273982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRP/aCDs40nHhMlzv2gTY7KFcnDo0DyL6kLx7rpwynM=;
        b=sx3HmHXnADXs/SyhkKOFFeYQGDpzUJw1+dUTWkCV56F9XtmesLwOFdKTCgtD2uEr2f
         RNZ8QOciHB12+tsWp9i2xRGjBJ6KZn7c/f3Nhk0WcUVcU9GHtduQ7Sm5ausebQy0MifH
         ItudERXVi+fn/6kUDiMTZOXUkpoUuwMaIckPtXIu6MY6K8FIHllcGo75sG8RZtR/C4z9
         wPmmEMVKIt3dRRG3EnZ6hH+6X03oSWXD+w7oY+F2hiqZKZCAQ8WyxValAuwV2pzIrP25
         MKDNqIMABzYQ6+9AhmalHRMkDLTpym1PoOBW8DTzF0gTzLO9TbCeqWw03TfOapR5hrXM
         iN9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVy8ftHYZqmSC2d/1UY4RtNA22X1+r6gg9iEm8BJQkSvdDsTCp42kF/JdHaZq16j0O76JS41f8ivJ2eeqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMVXA5cFtKsl/a5/i5LMl+cm2VRQ7AZNp/7IxbNq4HBesrxu7e
	Huy0QVC5FvjpUzEc+cH622a6e+yvjK/fedRSqkOHmoLwzPrvWb8KXo4yDbk5pQ4D5zicnTq0KQ=
	=
X-Google-Smtp-Source: AGHT+IHSqBi6RNwuo3i9qr9yOK2igf1DEewVo3nmAP50cRcffvMwA/8lbPs5pCiblxEr5TrUXkRvhDyc
X-Received: from pfug10.prod.google.com ([2002:a05:6a00:78a:b0:746:fd4c:1fcf])
 (user=keyz job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9007:b0:1f5:87dc:a315
 with SMTP id adf61e73a8af0-22026d8cd24mr17192033637.12.1750669182681; Mon, 23
 Jun 2025 01:59:42 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:59:37 +0800
In-Reply-To: <20250620101906.3762866-1-keyz@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620101906.3762866-1-keyz@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250623085937.894003-1-keyz@google.com>
Subject: Re: [BUG] CoreSight: WARN_ON in coresight_disclaim_device_unlocked
 due to register reset on CPU power-cycle
From: Keita Morisaki <keyz@google.com>
To: suzuki.poulose@arm.com
Cc: alexander.shishkin@linux.intel.com, coresight@lists.linaro.org, 
	ericchancf@google.com, james.clark@linaro.org, keyz@google.com, 
	leo.yan@arm.com, linux-kernel@vger.kernel.org, mike.leach@linaro.org, 
	yimingtseng@google.com
Content-Type: text/plain; charset="UTF-8"

> We have the ETM driver performing the save/restore of ETM context during
> a CPUidle. This is only done when the ETM/ETE is described to be loosing
> context over PM operation. If this is not done (via DT), the driver
> doesn't do anything. This could be problematic. Could you try adding:
>
> "arm,coresight-loses-context-with-cpu"
>
>
> property to the ETE nodes and see if it makes a difference ?

I tried this in our environment, and this worked well. The "arm,coresight-loses-context-with-cpu" property was what we needed.
Thank you so much again for the swift response with the useful information!

Best,
Keita
