Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9E428D8D1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750245130; cv=none; b=jPWoC+OmvCpKVRVV0NApgZzFEfp81nlTnC9iKi+hqU8PBT4kuiYGSs4px1QI6ZLSKYlLiBw2jn9r2sBMxGBKZW+HfJT3sF/lECFUUdh1Uo1fjZsHwNCwgw6IXD34yJUhsglTMqTa6wazce5uoXOYHraXnNNh5ufyDeS3+gj9rcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750245130; c=relaxed/simple;
	bh=tvBZVbpFzdgWj/7ukLzP8VQVb98FCkFn5r2JIlMoCn4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qP0gjUtzbYxP6xTj6Pj5lo2S1Dy2K1eFxnQpykkDkx27GYmaEyl3FbmG4aRP1zIo/3SRMgeDniKlArJTRcVRn6JR5gDUUyL2YLCeqIw8zOTh2itCevy1fEyzD2d206B2pXXmcXXb6mrPhbC+ofALT0JhWWj+/FpTsua42+/jOMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=TAzH4Brb; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="TAzH4Brb"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-86d0168616aso640050539f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750245126; x=1750849926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRtJffEHvhJPO96jG3S/GnXcIBZq60zFE1OSNRuV8OI=;
        b=TAzH4BrbQOWXp3M5Joj4H7poSb92G0OwborMWczt9u4CnVy/FS806FgRZeOkkYcPTD
         mS9GS0HJoJ5JPX/HlAO9hRMZTkoYa8/YXie0uvZukFiRhl4htu8yxwhl9mN+EAjn5Q4Z
         c2Czq0bcPIUJJ+AYr+tv/FUU5XhQf+RUf/NUTQWRKCwFsZOzbeI5NzRTk+NwEAuzREWA
         P6G8wWxI13Q7OIE2slVa3zgJzTF7Wh6AuzX6m8hxvatQ64lt49m2XrjZT1DOCdvW1vDf
         vFvnZVrAgng8a+RYid0iqDfeI6zxIWbbtg8M1Ah4xhLBAm71dkYZTyp8HcJYKH6z5OIt
         TdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750245126; x=1750849926;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRtJffEHvhJPO96jG3S/GnXcIBZq60zFE1OSNRuV8OI=;
        b=Jsqd2Ur1e9OCS9yvSAg7cT6oRlBcP/OIG3AvhZpKo6DlUxTE1f27O9z1KLPCABgpmq
         BSIdiZ2i6NWcDEhbaeGxo8gAcyPtbjqVxCRgpTFB4YwK/KuEo2glcEMEYliUYkStPIl3
         1MJQEloiW9CE2zWPkD5SL9yalUYs8cBuMUWt8M3St0etKhZqAT8IlI2qQ5AEFmE3Q+SI
         5E5YdASvgFq32WY3YiiAZogZq37YpXxIqocc1p3g+7y1m7yMrJecLbx1EE+oSyf4yyzZ
         Oqf14IYYfmGhoKgZftqUiRu1hzXq8zDgzEbxKT8xQ6eBivbkhR6mVvHI9Iqc7PDEGahe
         qBFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZslAXPxsh9CHpuTrfgm9Udj5LnDyBC7P9ynU4CLDeozr/b/cmo7oRydJpNXO0cBeN+LnEfJRBwR0fS4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0WfjkVn6YnuilWJ3SHUCkQ8cykqaB9BFkS/65UfHxZN3p9+6C
	k8yYBQc50gcBL5Wp+T4I7380i3Crhk5y9HxlNUcBDu8A6DRpb6dvkTd9xFzlxuPx9ucEkZ8Sl4T
	ghL8w
X-Gm-Gg: ASbGncvEXmuRj5dr0kDjcd9utNi4x39c/ZJ4YCDhKBrEDZPcLTywrBcXAMdqHP+Rv13
	oT2hgnY3+eTYJ6crNCvv01KalODkXTsX/q6ayn1qWlEieuk2xOmPygpntDZpzjFOi4GyNMDmuh2
	n3AGt7/hSc2NYeIoQFc8iz7hzTseg2zBICFqZjkVtyBx9BnloX1QUyJzxGhhna5b9Ax1JYlbgD9
	xvj17mSmnYpNJjpcmS6mJlgIJSuVHI90DVIOkM7F9TSeGeCfR7//Kblp5kBkQMYyvvfOpHE/Slx
	LS9pLvrU8GWmunJ6Xuk1BSmhfQeRbCYNTC1zqmsvHLd0t1AB19Ez2ibjXMCj0oGV
X-Google-Smtp-Source: AGHT+IFwjLmUQDTuH1qSFZ0XmxiGivDqXV70/Dw6xBeGhwzyFkDQp5Zpfj9W92w/KzLSvW/hYGjE0w==
X-Received: by 2002:a05:6602:1550:b0:873:bc5:dfda with SMTP id ca18e2360f4ac-875ded91199mr2243410239f.6.1750245126321;
        Wed, 18 Jun 2025 04:12:06 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-875d582dd75sm261124739f.35.2025.06.18.04.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:12:05 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Penglei Jiang <superman.xpt@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250617165644.79165-1-superman.xpt@gmail.com>
References: <20250617165644.79165-1-superman.xpt@gmail.com>
Subject: Re: [PATCH v2] io_uring: fix page leak in io_sqe_buffer_register()
Message-Id: <175024512538.1407393.13866658560955989017.b4-ty@kernel.dk>
Date: Wed, 18 Jun 2025 05:12:05 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Tue, 17 Jun 2025 09:56:44 -0700, Penglei Jiang wrote:
> Move unpin_user_pages() to unified error handling to fix the
> page leak issue.
> 
> 

Applied, thanks!

[1/1] io_uring: fix page leak in io_sqe_buffer_register()
      commit: e1c75831f682eef0f68b35723437146ed86070b1

Best regards,
-- 
Jens Axboe



