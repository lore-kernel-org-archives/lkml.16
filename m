Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DE826A1B8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773480; cv=none; b=tK4mGgUSTG2tkd/5up+9sQXG1jFObQXKIsa3+xWnSRIFWfkQ37NnCBnYgWlMahbXUo4qQXBZvhl0SZvRBW0TCmb2L5oMPzsZx16xGrqginEBxO4DvBBRHabA4+lZSbVaHzKaNtz5MgqLPY3vgd9d0ChOsVm2S9GQFvv82+9fLw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773480; c=relaxed/simple;
	bh=AF5fpfzqJ+Ej96B9gVRXqWtxyZAB5RD/WG1QkctopUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jn55wnPYptju20CipDTFnR4iRMJe7jHJeGznH5cnZj140gnjPlohMlsXDEcDmUFD4o9c6v/GarVkm50w6XwmtWZWYFVH73A0nZTXSHN33mdoZdL8frjkDODxXkytpSCbZQ0uYlBVCoGsy3xKqHoLvhfbyDAIkFvj9hldrgpo/G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hBbOvkW7; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hBbOvkW7"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5fbda5a8561so2577639a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 23:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746773477; x=1747378277; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYBTfNGTTnEFB0aMh2qxUzJsPyPpesZiTr/JW3zojpk=;
        b=hBbOvkW7BmxxOxP8+ympB4RWPZGeOn6CHHfZqQVoajLn2esBcrg8teL3Sb9RxSdtEE
         FIqwy/AfK32iPhEhxOvmOrrYgTrIclCym++2l9pNPRIfr5PwfC0d59S/466Czt7iIgHc
         RDZmCdxRkNm/6Eob/Dw5IihzoyfPO9Rkeo27CA48Uiv8gaEvhWECLNBmCnPUD7jlXRQb
         LltmR6EnOMtsxD+DV8CGuq7L6Yz2wccEG6Mmo8vP77iTSuwD5LmdeZOeOtcbuW4WKC5C
         /azERjZjjCXk8K6Tp7VpeUQ7pWtf2jZL5/zWpwXzZ0VGdb8vfzTO+KVYLcgY5PzmSF0q
         6rWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773477; x=1747378277;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYBTfNGTTnEFB0aMh2qxUzJsPyPpesZiTr/JW3zojpk=;
        b=nrkjea/Ir+2UynWnyxMUuJOXNFe2RtBcADkcpbFQ6p/iB2QIsislRMgpKsRzwMvIc/
         YVEuXFC51OnRKhSD0mDi25gg33d0OCy+HyPRR0BqG2KQn0a2TY06pB0NqFOXPEyQrex3
         UICWvHgclCV2lJ2xMZggwiitq5asMAJ6TXZEypwfWGNJ49Q/UGUeNvhnBdnicx6KhV+L
         gkqY7vlDwc9KVojWRMF917W9Hcq6YdGFEh4JzC413mT/yS7y5+A34S3Mu2L3jsCZDWal
         mN6LiVHYWeh7sTR8g+E8UUTmaxraO6namtYg4rN9fMiz30zYd9AsMmYuIVtBdnDiTOto
         CjBw==
X-Gm-Message-State: AOJu0Yz0NTIOxsqS7VnLwbH65RaeiR7l/0hCBc4RIgnuiwAHTQz7LKpe
	5V+ozdexy/Cexs+621Izg8bSasyQzEq/64tf8EwdyujRURKSThnNIfIektYTR/8+e3Nb1VTqy3B
	i
X-Gm-Gg: ASbGncsJYecTfNl7olUxy2Tkzlj2jSeagSG2Et7tfgrYA2fKx8QdwmUY3O8I1qcgWDg
	T2eGILjkUxtEddWcRyt6oIEQw3Z2FwwzhyOmDWYfe7e3d2kdNeDH1F5A8S53M5/0RQ6r3Jp8evD
	fUtcyqW5wVC8x6wAMkkXU910wR00geb5y5CSv2TBB4A4SFCJlS54JEO1NuDc0ZuFOxUI4tVzrYl
	+Cmm4HaApNJ4lbWuy7/xeGF4ShTbB2SlX3c+4LVfVxmy8RxcWiX8sn/xX5zuO1dWEAbeGEZPHrh
	h0koa2BbmmdWwUBLEZ/HGUsCy9eC06SPIRXKQfjpUwhMry4+zdj+qrIb53eCyejZKmTLyNwuAwH
	SqCCjy7I=
X-Google-Smtp-Source: AGHT+IGEq7s1cGa8nS1cxj9LzdihYh5cljT0mvPGw2cCH0VhEx2xs7QLyoyuTIKGYy59vJPEyiabaw==
X-Received: by 2002:a05:6402:13cf:b0:5f6:c4ed:e24e with SMTP id 4fb4d7f45d1cf-5fca07eb917mr1808116a12.27.1746773476973;
        Thu, 08 May 2025 23:51:16 -0700 (PDT)
Received: from rayden (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d7100d2sm955653a12.80.2025.05.08.23.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:51:16 -0700 (PDT)
Date: Fri, 9 May 2025 08:51:14 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE updates for 6.16
Message-ID: <20250509065114.GA4188600@rayden>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull two small small patches for the TEE subsystem and OP-TEE driver.

Thanks,
Jens

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-for-v6.16

for you to fetch changes up to 39bb67edcc582b3b386a9ec983da67fa8a10ec03:

  tee: Prevent size calculation wraparound on 32-bit kernels (2025-04-30 14:57:03 +0200)

----------------------------------------------------------------
Small TEE updates for v6.16

- Remove an unnecessary NULL check before release_firmware() in the
  OP-TEE driver
- Prevent a size wrap in the TEE subsystem. The wrap would have been caught
  later in the code so no security consequences.

----------------------------------------------------------------
Chen Ni (1):
      tee: optee: smc: remove unnecessary NULL check before release_firmware()

Jann Horn (1):
      tee: Prevent size calculation wraparound on 32-bit kernels

 drivers/tee/optee/smc_abi.c |  3 +--
 drivers/tee/tee_core.c      | 11 ++++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)
