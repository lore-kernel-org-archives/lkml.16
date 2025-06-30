Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468A824166A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277643; cv=none; b=GYStsIpaH3Tx/MeLz3yopHQn5+mQDBO23S6oew/coSRdh5TMp/STaI3IfrAo7iSNsLkB4wofUPRcYw82Pm2Fo07GVHr7DMjNHxP/AlhZiZqOFTPjT3cLMdPJ81rlJlgvCwM9u9QR+/Fh6GCWtJWpmAM/Xb0wQW7DOyaxj2C44bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277643; c=relaxed/simple;
	bh=v6MZTsAebqK5pi8z+h84sS4gvkSWKDyxRKB2fdUTHNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oENkta80OQ/G4uPNHLlf60Bdk7NToI6G8yzNA9mon/T2O7XzuNqIeRed9JHVV1OfDLHTkGKiK97FISVi3NHte+NfERopZ3Q5nAA54ldJLYvbMhTBWyvMtljmD3TcLEO6ESK7xQUEwF0gY1TpUcS+0Nj4hHT7UHoGGXwhsnf8ISY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lKj84BDe; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lKj84BDe"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso2382989f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751277639; x=1751882439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkT/Rstid8JISpjAt6SdqbTq9GQ5RgC+pCfbEEzIrEg=;
        b=lKj84BDeaA+50NB2Tp4fdPZ0rJoZjpixzBJ47EsiLxFRBDjj37CCdnF+QWpesVDxS4
         9mFr4HGLlCmeqYhxm5cni21domuaFjit4DZBFU080iH6PUfh6ce26vaiD2MPnsz/1+iy
         VZmckJGXiMz7Xlz0aoeS3ODCi/HOKyx1/0i/zNvFxHa8JMZTVGO9SQOs08EqUEgZ/7vV
         p8kqh/KNyivWt15bIZpAvRsEruBNlfqfzV8bGQfjMX8yoCK8EEvJFTBqi7EcvWZC4yby
         UfUyBxX+AUN1s7XX2pED0fdVCRZ93t2ofhpPzv5U/DU1YPGjR2xOMSTHDt3F5gctKydp
         t91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751277639; x=1751882439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkT/Rstid8JISpjAt6SdqbTq9GQ5RgC+pCfbEEzIrEg=;
        b=dDnCn9wBzXtq0JC5o13DgfXWXWo4NMWbM+i0UzfPDEbu9lLeaAXLwfyaBx2URBd01S
         TDxgod1s4VG47iksW1ZVt4zx7bMbcLGkLnvnrcmUO7XWoF/Y2Q4kqrLKLI2cRWCtjisl
         bEhNR084mjuOXdKmaBKxLzfl6LsPO48Xa4kc9stw8aGHYO8txOdgbb+wtAMU3d1HwqzF
         N4BRtqxAfFwf6gWx+7oR5cCGmdy5C0zYYNHfzNCXietnrdgP/0YN9REehTX2H6oLuCDw
         1wzJHfCYCUcyFPvO49Gu1C9oOBT/eBk8mBmSk4uSYoUOCsWk/9FfMX4ZR99ttHRvAiIK
         5ymQ==
X-Gm-Message-State: AOJu0YznwgWPdN8hIg3wnsYfQ0D2IH4X0H86LWWS1AuaU1ttBnr84gB9
	4fW9ethW0K3OW0DmPthXrbwOY+hBqPndpvHLlFpei/RLdTSE3YCIjJI2bHZFod10CyE=
X-Gm-Gg: ASbGncvi6kKRYAbGC7cwbdt5ba8SI7UsZYufTTqh/PkMglGETQlbVl+sF+L8//kgKvM
	ckRI9phViNzdxqMqCnTW9C8if9MRGc1PizzFT2wH5ySMu6MnAW1p+BWdARR2hP2neHPD9IXZwTR
	uqaVeLMwcM7aWY9siiyUrk6pdI8TyYcGkEA4uTjf3B85x5Io+R1NlUI4QeMaPBsAc8sRuChbPaI
	Oq/t2vmjx7LobeEXS7gKe/Vc/o7j8oHMElm2gNAJR5p7AUkc6Xig6a+VVO1RDJLrn4mugDmuMcP
	v0hEsN53It4D1bGw7wMd8sH1BgiDkFBI4cCzCPWhJgL0jf+6npgvVju/oc6XTQ==
X-Google-Smtp-Source: AGHT+IGr8kDpio/yTc2q7sbJPgt53a5XcrIQFYk6F8xhvZP/fdYVNcvrjEwO9kaxLpdzOyi51LJFFw==
X-Received: by 2002:a5d:584a:0:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3a90be8d151mr11063926f8f.56.1751277639515;
        Mon, 30 Jun 2025 03:00:39 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:279:fce:4bb7:6daa])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a892e52bbfsm10076002f8f.65.2025.06.30.03.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 03:00:38 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: amlogic: remove unnecessary headers
Date: Mon, 30 Jun 2025 12:00:16 +0200
Message-ID: <175127759469.367173.10851786033226658116.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250623-clk-meson-no-headers-v1-1-468161a7279e@baylibre.com>
References: <20250623-clk-meson-no-headers-v1-1-468161a7279e@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: amlogic: remove unnecessary headers
      https://github.com/BayLibre/clk-meson/commit/328d4a7eb073

Best regards,
--
Jerome
