Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A9127BF76
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750013949; cv=none; b=MmVgZqzWCgyrX2Bf4YrdFRabdGASiWj4KBgn9Y6A8amTIMvX/KapPtfqCkCH4s8uXo0CNdrCiuPkYC0RXuu4sqjRuwX7capvSsXrXe/vKg63HAYAhq0cAtE2Z4igWmPfFAVqhROLJPvddKy2tg/gjkCly0EZ9t6RaVuIWJdKdWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750013949; c=relaxed/simple;
	bh=zps3z4rZEjYVsg/2iOnltpeS3ysiLc7KW6u7xBIWzzM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FQvHSLX/UsQmrijid6eg+/W5XFegXAr3qvoSd3bKvzUp1fiV82pcSeeAzumbzzxnJtU+23Wz3a/fUL1BHUu4UGLZLNOi/3qQi73xU9SA19rqo4C7M0j4NCs3t74D7yH4Ez53rKUVu3tKVMOgMFSuQxtlIeiQhEfVnoKXQRLp7wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=1dd+z6FZ; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="1dd+z6FZ"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3ddd6f2d911so13309795ab.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 11:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750013947; x=1750618747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s6vBhuyNqqMpO+p7DESnvw4+ewrqQnOmhISSnScK1Ak=;
        b=1dd+z6FZZHbmxK5yEfCMRMcTjekeAc4ZKIBJLL2MhL5/xXY4N2O5JpFcIkygBBcyof
         LRYZGzZwR2wMMqaT26hGRRDDijUFJlKnfCGhevn/c5gxrDvBjpLdSJJwqT8xByPd7Dn7
         AV2y3sFHQwHUlpM3lCDu50Stf8DytgXXejdEQ5vPwZU81ePaTBTltcLNQNbFasFhfj1f
         9AigOwnFF01JiILpCWKpegT2IngmATAxJeFTAeSYmFQIcvkh7L6Al1fU8q0VxzVB+SQP
         HYJ/H6tGE2Z1irQGKjHpQqq4pgiByQDGdLphNRB9WjOymirMdRjubdjxMcgC5NctjDLT
         3iBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750013947; x=1750618747;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6vBhuyNqqMpO+p7DESnvw4+ewrqQnOmhISSnScK1Ak=;
        b=kmJ/4TDyog3p4vOgCdnBFygDWB3alVzgg2qhxhkPOYlUFRdNUKhHtK87Y5xSRSIguL
         kaR0oelMPow9sywUeL9uYTSJasnu866OEMAoyKPfY3g5kTi5L8KY1ylAY8dy0DDPmRwY
         WrNKG6k8XZCL7xUp8pUthkXzAe6nnyAzJGb+Dbubc+EV5pZ6ZCCISnhj9aQpk0m2P7uM
         ipvMz9hijs+C38q3nbaL1Hy8Qg1cEwHz98w1I56fiEE9XLlfa7Oy+M/Jmj29GDtQyeNg
         J90S/ODF7KX8PNhE7jkaGalrubRiyZY9/6xPRBCuDzy01i+b4+oovF4Lc1QkTKjFHMIY
         uypg==
X-Forwarded-Encrypted: i=1; AJvYcCWHh8P2bb5PezXYTqmkL1dJ9wPp3O25Ickf82sZFIEiM7B7nxAxnn+HFp1W884I4dqY5yqns7M9tEj91zM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYs1SLRH6G4yh3X23OBRkWIuwebfFgVDCts5znF7WxZCyjJY9+
	NhmX4YevoymI6p/f9Z7b6+mtaTtcuiTHmLgIcDUA839XJs5lQnJROTLp/0G54hNblUA=
X-Gm-Gg: ASbGnct27tqWDA7MonQKriBM7NIFEvc+1rxiMHWhtut3ozpYDQ5N5Uj3rBIOnDmcwi9
	4bZ3nOEUex+EPhG7aYUDM/awrbFfe/fmDuft6KEMoWSUz2BXNWdDSG28Ccns3MqqdpCPfEa0vwW
	q7u1pKPwSJjkesCJ3BTyeNJKXW3bR/R/QpeY6lsvN1ziQFpboXppxQUjYYT7zA+jjYzeWxWl/J5
	7RKGztocuP96SzWy9KslDOhNALtPr/nFZzI88hV9E3ufaFldMaMLKXflWxAQiUjtelu3CPSQpuY
	TSUxLqNlZdFxqRCmvOdd8JapnUI1SfmXkrsUwZZ61e62XIMGthnSiQ==
X-Google-Smtp-Source: AGHT+IGMD1ZxRhn0WxOw5HWc31CsgILQ4psiy349+t0GSX98tbi4y5aEPFYXnE6TWZ3++iluyfig5g==
X-Received: by 2002:a05:6e02:1a2b:b0:3dd:b762:ed1b with SMTP id e9e14a558f8ab-3de07d7ae51mr70044305ab.16.1750013946960;
        Sun, 15 Jun 2025 11:59:06 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a501desm15354325ab.62.2025.06.15.11.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 11:59:06 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Penglei Jiang <superman.xpt@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250615163906.2367-1-superman.xpt@gmail.com>
References: <20250615163906.2367-1-superman.xpt@gmail.com>
Subject: Re: [PATCH] io_uring: fix task leak issue in io_wq_create()
Message-Id: <175001394597.940677.9152762979973400635.b4-ty@kernel.dk>
Date: Sun, 15 Jun 2025 12:59:05 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Sun, 15 Jun 2025 09:39:06 -0700, Penglei Jiang wrote:
> Add missing put_task_struct() in the error path
> 
> 

Applied, thanks!

[1/1] io_uring: fix task leak issue in io_wq_create()
      commit: 89465d923bda180299e69ee2800aab84ad0ba689

Best regards,
-- 
Jens Axboe



