Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C0C272E46
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379263; cv=none; b=qnxdMReoCyZCigt6CNDsY13CRpltrGRjpGFMSdYvy6tJ5HxkXPbz2uo1uulhdCJzafaVlGBp5BFtBeibrc4UKnh938vOeo095ySWPb7dX7+RUlVNdmUahpxv/SzpoB06tKUbCIYhZ8gykDb9guGtkpERVDCTNr0NZgIOrKmcUOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379263; c=relaxed/simple;
	bh=5OuLPJkS7/FW06Kbx8KtlQhZFZ40qlvkY0aEbvH701c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JylDdH0VbMjBlx+QVzwPii+iZWu/c4vUgkXuJduGAsy98T/nkNFKTk5vEOClnD6VBHzOJQ2RJslWq2HBRrp5iERkvScA2EUuNrAl6ZDtLRWJdzr50D2QfnbsnkzSKe749GqyXumV3bc/tLq2X17KCSzpOTFGguenEFiv+Ys1F58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=OzhsDA3C; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="OzhsDA3C"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3dddc17e4e4so10862625ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751379260; x=1751984060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmzCkliGIgc/w9CprIKleCb6nmEfP7kYHQXw+v1QCyA=;
        b=OzhsDA3CRP9ZuwaW//WaVIxPQZDj+5RgvrGHpwMDmdUHIIjZgl9x2CmUfQfHyg2jHp
         MVajJFbbNa31aSf1zolxcR8T7zUnso3B59vWdYlygpnieVyAP5j4oas/F2fmcZpnb6cH
         xdG4VaCz1y0fsYonpuzyqaewkg7dypI0iXjlpy1046uhC6TyfplXvBrv8VzfrI5saTj4
         saj/WyPRxKDKbRix0vmYMmIkNnP+33XWZGsoMFNDuq2wMo/xxBKNVJFlbg88kePkHpFS
         oRkKss9SMir+kWdCvddwMG0ic0po4nuGhPXgZvOqtmCh9TQaakgo52D1gU/M7Gzk/tzd
         i5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751379260; x=1751984060;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmzCkliGIgc/w9CprIKleCb6nmEfP7kYHQXw+v1QCyA=;
        b=Lb/tU8Aqz4TL3ycgXUflPqp8X85zdoFzFHPTn4dCYJZarYBqJAPuhDl4OfHPaTRjCz
         uZgDv5g3w3nUk8tPl4mlzeT6Q8oEW7mB9pBKvFi8nSdl0PE4C9y9q9xFa3mPmCk6GaCs
         eHRM3J9CUXaVbqQOeEHFNQq+ddHAbK4UyG7Yjrx1oaogCIusmdoLvGpIT5GnkW1VAybd
         TlOPvvsC118TqnKnCUcq5aAU1lhMaj5JNf8lR/xgtdaf6kRVTSCcBvDf6NjYaGnJs1iF
         SOhb3FEDFJytWtrr1TJkB6jP9gQ9Ulkeunu2S8j5jcFmv/J/ILJPWxyWKO4xQImC8exP
         sg5w==
X-Forwarded-Encrypted: i=1; AJvYcCX7wnA/B4z3gu7AyS/ljz3b6sQWcI+FGaQnL1kSqzxdIZIXbMXtzxlX+pL6K747jqNkuZsD1mlmm0aFmXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzVmhaab4e+X6oTrCVRA7U4sbnSgsfl7of6gAeib411YJycPwT
	gHQ+gbA3tmgMEnmJZwKdc9RL3KVjKCPTe9oIQNMRZ1ytZuvv9NzcdkjsKuZaafNcP2fNQLt3E6G
	sscvp
X-Gm-Gg: ASbGnctIzauCu3s8kD8lxfusNzeZ2CoV+sTiFl0lseqinr0cqGy67jfHgeQkq737MA3
	wXyjq+NTzZudLpAp/dGWq/JwZctVP+tH+4KY/PsHz+f6t7r3AP634kpqlJ88vcGq6GYyGupwvi4
	xHbj+SywSWp4yNCNbLC4lPrltKvsLakhpRuy5G9iosnX36x7TAQVgUg41IEFAp440qghlpwp1kU
	Mg/PMuQuszEIA9EgY9+EJ9N0j2Vr0e6efvwjI74CSbXq6mCDpKZmRRXvtka4wEBzkNS6qo2bPCL
	ygma43xmziK09bMoBvRw2GH7weiaIufDBzrx0e+ipGD4dxiFaBiVvo9FN3d+kRZG
X-Google-Smtp-Source: AGHT+IHB54piwldk5JvCGymkNdiDgT55hx3SHr7B9jacyIo19MjXnu+NW0AhuMQH0JmTjiSmrjmDSw==
X-Received: by 2002:a05:6e02:19cf:b0:3df:3afa:28d6 with SMTP id e9e14a558f8ab-3df4ab56adfmr188248595ab.2.1751379257608;
        Tue, 01 Jul 2025 07:14:17 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-502048c49b1sm2489377173.49.2025.07.01.07.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:14:17 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: hch@lst.de, yukuai3@huawei.com, Yu Kuai <yukuai1@huaweicloud.com>
Cc: penguin-kernel@I-love.SAKURA.ne.jp, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com, 
 johnny.chenyi@huawei.com
In-Reply-To: <20250630112828.421219-1-yukuai1@huaweicloud.com>
References: <20250630112828.421219-1-yukuai1@huaweicloud.com>
Subject: Re: [PATCH v2] brd: fix sleeping function called from invalid
 context in brd_insert_page()
Message-Id: <175137925672.318770.9783780559206172712.b4-ty@kernel.dk>
Date: Tue, 01 Jul 2025 08:14:16 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Mon, 30 Jun 2025 19:28:28 +0800, Yu Kuai wrote:
> __xa_cmpxchg() is called with rcu_read_lock(), and it will allocate
> memory if necessary.
> 
> Fix the problem by moving rcu_read_lock() after __xa_cmpxchg(), meanwhile,
> it still should be held before xa_unlock(), prevent returned page to be
> freed by concurrent discard.
> 
> [...]

Applied, thanks!

[1/1] brd: fix sleeping function called from invalid context in brd_insert_page()
      commit: 0d519bb0de3bf0ac9e6f401d4910fc119062d7be

Best regards,
-- 
Jens Axboe



