Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE3B22FDE8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 06:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773919; cv=none; b=N9VCZt8FgX6IROwW2TdkeUiWlEqARioVVyq0tacuowAIFapjhHhVxxwcSCHCd2wnxc12wNKS1f0Bg69LcJRaJJMLvDGHe+Ou36MLJZ0yNjfY4weEhgM+ZwPNBSQGmZ5p820nfyU3e0Z2B7Rm0OL3i14khamRntYY78DeE4HeF8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773919; c=relaxed/simple;
	bh=TFG0yZH9DngSMg6CI2IgJYe7USu76tZM73b0MECJA+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VBVy1ijvU4JlRZVDXLgUp5IoxpNMNBlvpAGWG4Ks+TnCjZVGwmtS5Mhq9ekG4ul5oW66AfN+QGggz+oel3C69ABSZm02f+W5/YhmOooSVusFsMgtP9uVm/cUP/gXJ9SV6oID7W37rNitBhAuTd7iOX0dgmHmMjpgN/NSmbzOaJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x5hlrJrH; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x5hlrJrH"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-326c8ae08e8so2114521fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 23:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746773916; x=1747378716; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2EQXB9e14/EbThODKAnSR7YxD3dmoo2cX6xJNhO1H20=;
        b=x5hlrJrHOOo9JMq5dW1AHJxU53l77ulAjIbH40zIQmaZ+JzdhaKZJkEJutNhLnxSlN
         NHIjdO2isKuJZGCuhYRQdvuu/L559YYaP1PLLHqkciBTRr6wfFW90Aptqklt+WEiNjl1
         DCoLT+0298QQb+LwUb0JYv+6zd3avuYCVfTFnXGutwaQdM13zP4j8+VJyRUDg7C0OQPh
         BcGlW2ih1SquH5JWwQB7GDMIDSSUcWnvOV7BBzCL6Mc16Fmm5IMXF5bt/eghhLVI4uhf
         jEII1Ir8JF5tLGQpxqIfjx4R7OAdPnnGzFGpr6E/BENN/pAyrqFv9JBBoHZnP5szstAK
         9JVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773916; x=1747378716;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EQXB9e14/EbThODKAnSR7YxD3dmoo2cX6xJNhO1H20=;
        b=X9bwRfKVW/WLyGkj4Xy4naWLDQcFrYw28b81xAG77Dm1gnfZPTmoqbtoVb5U7H7iey
         ehzLrQCnmGthob2IP4H5A5kQrh8YgcnR9eYDFy2S+EBgM1G94mimeycBGuLDMM7EaIK7
         pvaXVaQ2mQzRY5f3/I1FeB2geXPO+rOfnvM3OjrdZBDOhKJPBtj0LOpNpIRugJDQXSfB
         m0XgC+050KBIxfaXZc1KL75tPlNLuaY5kYeLE2cd4lWlKyIBCGfU2G2LJaafHe3fmH/4
         Q5KiTLO1q3pllhAuipQRHO5DUKstyRdhns12HGspGagsnnyM97GDLhO1UWGGvW90oyMV
         WJoA==
X-Gm-Message-State: AOJu0YxliAmhwTl2clPQ617IT7MgPcaSCQmSx8pJGKKQrKYFOrpeTnGo
	60G/wL01AgbI4sCAK0kDU2EWOqEEvs/IgiD14icau54EnPXYChCXHCbRVIqAskM=
X-Gm-Gg: ASbGncul+s1V4qbOadl44B9GE26YwOCEVPW2c62itndVILc09PQY164B7TzrQQSYwPe
	kQ8Kq7zu0MtpXmDHXHgWJNAVDQ2f7M9aHpjNPtUhbmagTEYjZTEmz8hl9ncs1Nuh1JQSofG5/ID
	JthOhI9wvtqv3F4onNH0YzX1wxjLsxklcYyrPO4HBSW0ZfA9/YaP4Mu66Ffi3DxvQBY4QHtwOTf
	LOjS/xOGajbxrKU5ScO8mtFrBXRq/maj6jMlWZwyqoppJYKNz+HvdWrgjoAu1BaD4K2Y2Zuze5E
	Pyt/Mu+6Bl5pCETjGXOqrPk0gCp+n6bvsF7eOHUFcv3xMrnDsCaIZtDROsilDOis/A9qgFeOO4i
	7rTOddf8=
X-Google-Smtp-Source: AGHT+IH3EkxXTq0TXiCz+ScAzpBkCWHAoFqCnNrQw3x3DaNWfM/7rQYlSCeVQemX43yijXhghECcYg==
X-Received: by 2002:a05:651c:150c:b0:30b:9813:b011 with SMTP id 38308e7fff4ca-326c4627e6bmr12199731fa.28.1746773915667;
        Thu, 08 May 2025 23:58:35 -0700 (PDT)
Received: from rayden (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c339a324sm1893081fa.4.2025.05.08.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:58:35 -0700 (PDT)
Date: Fri, 9 May 2025 08:58:33 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] AMD-TEE updates for 6.16
Message-ID: <20250509065833.GB4188600@rayden>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these two small patches for the AMD-TEE driver.

Thanks,
Jens

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/amd-tee-for-v6.16

for you to fetch changes up to 136deca59b1613c22aebfb0c8508dd02363c7142:

  amdtee: Sort header includes (2025-04-29 10:57:57 +0200)

----------------------------------------------------------------
AMD-TEE driver updates for v6.16

- Sort header includes
- Use pr_fmt

----------------------------------------------------------------
Mario Limonciello (2):
      amdtee: Use pr_fmt for messages
      amdtee: Sort header includes

 drivers/tee/amdtee/core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)
