Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900221E8847
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 17:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746379536; cv=none; b=EBQ7wLKl3NNwhwWKgzVK4kZq0J3fyMioKW+HNURK3qwYCL7nDrxpezxiMf/RVNkUywUZz8r+16pYA0hBy9KyfjJtbUDuwvKycAbEyspDmqkY+5jm2ApnO1D3e06APkGi5XG6MtBsu1D5AQlFpfbuNLtR5aTMpPhU36qSX3LAP5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746379536; c=relaxed/simple;
	bh=Ms63/2y0DA289uzZ9A2EmLRu7PgcSpq1Bh1Ff+1cH88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AORQDcZAnqJjgvuonNoj89tOd2yTPDOeKeR/TLIBZYaReXUDzc1oxSxztWHipej/vAeNDGthLyi+UsbD8e7ufFBCNkx35vRzayjpPIh6ngax087re5gg4ThO0Wq5A8CENLGCaedard4XHD6iQSebmLpsvby7pi/JNb6BaiP9wJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZUnf1tIG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZUnf1tIG"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39123ad8a9fso191854f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 10:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746379533; x=1746984333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ7tuwuM2LFYHZnclmNcrhhek280gEdNY36z2AcaptY=;
        b=ZUnf1tIG1b2BbSq5Qu116N8p+1Uz8d1i9F0uyEfg8cWY2qwyOhq4n+QV9S3VEHOEXT
         xCdhamLDR6TxW9s+JxxlvrH1CmrHarnM212s1g+efZIJAJ3NCjRIM7p2eFVxukay5j+M
         Cs6iEalRHFK4zO+y9yrY3CLSLRBM8dHk4InIsrprVjoUSd7Vy66A0K5cgBagHASa1iC9
         uMLxEMdZsaDjIH1KUS9YIj2azMNHSCR4iTTV07HvpkmhwNA8VoIiVIL4LYDfHr4jU5FP
         W7XA6DBAeX7dkOwy57BoV64VrmZVnYg+pXL7ej2vFtlvxKLCoN63LSsOQZ9K7h/NSoJe
         DqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746379533; x=1746984333;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ7tuwuM2LFYHZnclmNcrhhek280gEdNY36z2AcaptY=;
        b=qkSlTlJIH9SWIzCJv5f7/GPZsPMGlXqzEBJh3iJ0TEHh5t7svUdij1JQ3scyyb4BHA
         aDSM6Q2A7PkTcWknZKdDBLTPt8dktuiz1uSbatqi0ruiv2EqNi4k6P+tw7nda4Wda52v
         sEJaMCwK4fq/T/xOMw2vyRvgB7VdLQa+ViJ9wjKJyOMcSgP050EaUhGtzYhDvCuFKyGG
         hN4zBP/kVcVlsQq2q+A3aY0LUCy0fBuad1pJGhQhx/SBf6UdgABKRqHyPXR8A6Xxvjal
         PH14mMhRgPT2u2hByJSgYEE5MrTArzIT5DpPP4VLPQdpPqjIiHQWAL5SLBUU5NyiD9XS
         BjwA==
X-Forwarded-Encrypted: i=1; AJvYcCXIDSEqsXRgEESUrdlhxGgz4ZgmQ/hrAkyHYPXR9JzkNv5or5P0PhS4BqL/FN3hADa+NMhPUxlpwnJs+kU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwblD9Ne+6zGSVe4pO8Y7D5yMDOTRAtfvt28ujkomFeDh9CcK9
	IZyYT7LUkWqmut1OFUAfcTUXinmfhoGFmkp8bVgX1AUbS33Q/GpwBu639HTkElE=
X-Gm-Gg: ASbGnctf8BmLoSjb0slVcpB/pB04NXwydO/PrKOiUZKRoOpl83hreuNta5ZZ7pMXRFj
	emN1vpDqMrB5iS+d4d3NfsnTo259bZaqrE/GTY/f/KpzhM3mzA+//S7vGeCorzR9SQXzM6x74X2
	rKwXfVwFtS7b4DdNaj+3lFIoWxbBFlHSGmF8GDJUEs6AYC9ywUasjdiBtd0piTQS4aZlUFRI7Hq
	xSzw9xsRyNZAKiNqWcdR2ZFrSdhuyAGZ50F+IJDZNMlE9jZo87UD3RvKH4Br1n+pZtfFRFKC7h0
	deXH+aWNksYP8v8jzeYHM2+bhc3hVr8hYK//E2TIRYMkGiN9rgVg9/HvcdI=
X-Google-Smtp-Source: AGHT+IGOU2D1HDiQWNlXLDQ7WFeRlkZ1+eYoBamEUGxGy1/DSVrQ46pnltTWn2EXYZd+XJi5rlymwA==
X-Received: by 2002:a05:600c:1e1c:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-441bbf4af50mr34682955e9.9.1746379532792;
        Sun, 04 May 2025 10:25:32 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0fe9dsm7896332f8f.71.2025.05.04.10.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 10:25:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250503-wmt-soc-driver-v3-3-2daa9056fa10@gmail.com>
References: <20250503-wmt-soc-driver-v3-0-2daa9056fa10@gmail.com>
 <20250503-wmt-soc-driver-v3-3-2daa9056fa10@gmail.com>
Subject: Re: (subset) [PATCH v3 3/3] ARM: dts: vt8500: add DT nodes for the
 system config ID register
Message-Id: <174637953156.102764.4565832687036270187.b4-ty@linaro.org>
Date: Sun, 04 May 2025 19:25:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 03 May 2025 15:52:33 +0400, Alexey Charkov wrote:
> Every VIA/WonderMedia SoC has a 32-bit chip ID register at the
> MMIO address 0xd8120000. Add respective device tree nodes to let
> the system code access it at runtime for the selection of appropriate
> hardware quirks where needed.
> 
> 

Applied, thanks!

[3/3] ARM: dts: vt8500: add DT nodes for the system config ID register
      https://git.kernel.org/krzk/linux-dt/c/a43a6092e33d6a5827114c797a2951c092851931

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

