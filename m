Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F3742048
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162456; cv=none; b=S2NzgwSR/ssowEZbzZjfOFsLIDRhAB646cLxIodsigSS/lmo8uX9bh7b40AmWsBUoeHSvu3w5ryMf7ozg9q3APKLnz95j1XWSSth4hZf2jNZb8pcw+zyOmGo6XvSuHcFzbH7oex61M4LroyLN9qyTNMB5ikvgaM+fInj9pFA4m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162456; c=relaxed/simple;
	bh=prmAxodL6S5KqE7UD2cKMelqI+ll7RBScPy73XNSuaU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aj1ycf6WFDmUVJDPAyGMdd+j9PEl1S/znquIOkJyYmM+ZAy+makqOKpBV7ee3X8T4eOTqSh7WbxD4rDyw6IeQEFTfWWNV7IODFkebCPDQsHbSskbAOMFanWLrEB5vA569Gd7mgFj2c2XucRYawjRz3zimkfvRtarCLIcEjar1CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNM+tT4j; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNM+tT4j"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso964468b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748162454; x=1748767254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prmAxodL6S5KqE7UD2cKMelqI+ll7RBScPy73XNSuaU=;
        b=BNM+tT4jYravR7Njb0he+W9WA9NSNdi08XqrWkxya3u8pyu/hLjILNFvOfp40+Ri63
         u3CLYv2wAiwifDxjQ2Q1Dr6WVKgfnDeS2VWOXHpTzj7HbpoNhhDJyy4MTxqAUCKvUmZU
         RLY9twWmvjUO26Ny8cokVWw76tmyrmSgubJ4QwF9fsdFgnzTf3W76RXj38ElOLG22860
         QcDOth30EZB1JzuzXbul0b+vPXe5UDowPeIIzdm7xx054gBMqCgRW9WNhxkuES0r/P12
         GKJifqYyVQ3u98/6CqbM2DbYpoOweauxhu8qpUapAD5Yy9HYwnqW4R3KfLdUFWKVQp6n
         Zmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162454; x=1748767254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prmAxodL6S5KqE7UD2cKMelqI+ll7RBScPy73XNSuaU=;
        b=fmZ6jJUIBgamv7gJJv4FD3QGlKyzidPWzU3D4ADC/i3RMoxRHt/UgLgMTLSCDzQ34W
         h6N+fSA6x30LqrfSssreSuZNgpglmgvydYKuszmGMo3awC8yLLV1vMZQxlo1YPCzDlJf
         6xshnE3AaJgQPe0g8DTqRdxU9Xw2LAWXMbgBaetOFrylwh7gE60sUXQWtAIBxdrDU4Wb
         FKMtEYHBhi3NbY6di5I809frMAih9Pamh/7Dv6qm4b5UIBJ+Mj+X5Un6iUArrTGsYUEI
         Nf49h7iYIt83uibb6N7scdDrQovpjEAMT57JRBB7imfFDEenOjL1AUWiwnsL2XHJN/9t
         RDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNIKxs/V9trRvow4dvsm+BKtd4O/edt8OdHEjt+FWcLnl1KqFqAcWVbqrdpezYmi7q8jFrjIvFXR0YsQA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHQXNGd8VWR69eamFabqMDP9Aau/jNw9iDY0+EopD8eY2lZNjY
	C32WvqlR4S0UgVL67d8TtctdVq3AdC8/9NrLkyeyrlCSZfGWxtBCKnXm
X-Gm-Gg: ASbGncuMyMurotk1AA8vGAu/4WfmF1KgtzzZW2h66Y+4g3dc9c9rS8BZglZYanycVIC
	LnEG+SRUIygQCLBf4VrDwn0kIDDYb6AXHPsSE0OcXfi7dg0n2BHEfFzFJcPHwOJ8yrIbpXtbP/u
	f3UR+a0jEwCr+ekb4qlAsDTCZyDAXiFBARKlJ5t6ci7YWFnD8UUPmeNbZhduSytt04qKZxjHlW6
	Gcf2YJ4qkuQdsrsSURsT58nX5KvIXVg2b+qYrcFV+Rlgvazv64Hjrt5cN52eje2anTQMrbpcRz6
	9F4syyT5dbXpJHlMBlXFTnoM9gCe10GGi+busC2M5yEJfoqUjf1PoXiY4scPcQ46lftnQgf+wA=
	=
X-Google-Smtp-Source: AGHT+IFomSwzMTm9onn8BibQgcWc/ptZe265RJ9Ux/z0AGgnQj9HpeXlaVm29luDf4ABMS1zo1Qq2w==
X-Received: by 2002:a05:6a20:ce43:b0:1f5:8479:dfe2 with SMTP id adf61e73a8af0-2188c1ed38emr8753379637.6.1748162453891;
        Sun, 25 May 2025 01:40:53 -0700 (PDT)
Received: from localhost.localdomain ([221.239.193.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970b7b0sm15703165b3a.51.2025.05.25.01.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:40:53 -0700 (PDT)
From: stephen.eta.zhou@gmail.com
To: stephen.eta.zhou@gmail.com
Cc: daniel.lezcano@linaro.org,
	linux-kernel@vger.kernel.org,
	tglx@linutronix.de
Subject: Re: [PATCH v5] clocksource: timer-sp804: Fix read_current_timer() issue when clock source is not registered
Date: Sun, 25 May 2025 16:40:45 +0800
Message-Id: <20250525084045.4083330-1-stephen.eta.zhou@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250525-sp804-fix-read_current_timer-v5-1-49b64c77a7a6@gmail.com>
References: <20250525-sp804-fix-read_current_timer-v5-1-49b64c77a7a6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everyone,

Sorry for the confusion — the subject of this email should have been v4. I made a mistake when using b4 and set the version number incorrectly to v5. Please ignore this email. I will send out the correct patch with the proper subject shortly.

Thanks!

Best regards,
Stephen
