Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EF82356B9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744563; cv=none; b=qCZWV6v/VjZXFvTg6Q/Hgon8E9QBZB9z+fRKMQjw99RPDja6tHrRvWym/LORlz2YnwQlJclQrB32Lg5Dom6EXVKByXihKFpNch9x+IE/NbRSijzxHbBHnEVbn/HjUV6c4PREVmE8tgkK372kDtiOry3FPZpgvaganIX2vlJs/Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744563; c=relaxed/simple;
	bh=9LhhQK7SYYoB04N4KaGT0jYG3IqgAZMjCvvz8yGafZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZOEw9WiTYhInCWhphj12JxvwvWYyBeyWT6ncA7lr95weE5xAOsjdynX8C431N6kLM6F66ERnGKcT1PMuIHlarZFXZkP8sdV98ABaLgNydnPJXEWGb5jFaopVkWtWXL/Eillnt/v9GKSXZc3ZmYXR0KfxTa0FASV5ollD3dwi82I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=hQM8uGmf; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="hQM8uGmf"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d8020ba858so17415595ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744744560; x=1745349360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asgUBCNF1/3nLCqRhE9iKUJT9+CZgW2jKMxY6rpof5I=;
        b=hQM8uGmfyz4swHbASYgN+i4lx/0vQUFmxTVp9Xhtx5IkAKkj/ND1pauID0cwBnZLkB
         jGVHvwX76whYhJ8NKHlIg1yYYq0N+f9X1zu2uxkvWMYTGE5m+jkIL++iFUzcAcLBl+2x
         7xQksbzZpbJllk23ktXAJJaq06GcqMTxAyG+FeOz+hxfsm8+4r5KJOjUtDtgzqCyM4Hh
         g0BsrtMxmE/fOgTXrO9EhVCH8nMHZAy5zBqq4KHKQvs8qHClK/Sg/5pYS4aJIdqZiRZ6
         +69iBbcThAo3u9qbh/DIHZEdYdYHcyJeUVUXMvF5P0F+uDGPnxyXIn97C2rCHhKgg1VE
         qyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744560; x=1745349360;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asgUBCNF1/3nLCqRhE9iKUJT9+CZgW2jKMxY6rpof5I=;
        b=Pu8O/4LS74MxT9TtTHsmiWQOwUGIDgeMSJMoyyFJudc4qhikQWfNY+uRwMlHqLtmxC
         odWdY4mGRXS9I8QCJ0EuR+41tS/+TJ2gpy9j7UbceWmg+M4KSBLAIHVDhYDv6LvnWCg5
         C67EP0/x5Lcu1woUyAhHR82viKdvgeDQ7DEkXOxMUFsWpbsAX5mbkTO2Q+s4Jkovl3Gt
         OZBQlCYCSdcdKPVPpKustXrt/GV/fk1x0XLDe7ywacPPgSvOAIn70alTSMpBtn9+Fioj
         jxzeZIPiK2h61hFdUZJNIZFc7L0YsaqY+mLfqR+cVRwq2sYgnmOQZPE1zPR6Cynsvsd7
         QxQA==
X-Forwarded-Encrypted: i=1; AJvYcCUA27XD/fWhQbD5GwdYWPDwLJxrmfLHyUBJClac+gd46C7GdmqGcp0ZzfSURGtuK416odS6ng4qIrJWxa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAD3PGBQxEBmxdnX5ZKljrjAtv7Ckf6J/7mizd69r5aTVHMtYh
	o/8MkJ5qCjxZVPlklPYM08AkqJ4Atat23sDX6fMkvmI6b5gXWabZdvwGry+qLLw=
X-Gm-Gg: ASbGncvlms4DFVm5FI1YTm38F/mILvcrSIL/sZ/DpBokARE0obApzP4g/Mp4XnWSd4c
	7Ala/b90AnZiUA89V0ROCwsnsqicBSwfkMaZAFZuLYGEENFCjUblWagOmZJ//xrAJgKKt1KbENO
	HwRHKY0fb3S2qL1pTxYzptb2UJOOUsrUtUqjvTkVy1RRSdG7unotn74p8/mBqp0kXKZSNBwoqpJ
	MDYGwxLD8sFpJ+g5zqTQrLG+exIAtL1GUmd5C0fqb3nA/1BVWruoi+WxnJrfLdS0jlTK88lIFJO
	DoJehNdrs6tZjrj9qeAHz0/W0vDqRVYccX2LGLaUTeA=
X-Google-Smtp-Source: AGHT+IFJPt64kBMbP+3d+i4X9X/L5HM104ENBBE+s5Z3gjU9DWZ68WPXVZk2YmxhXWiQnU/bD44xZQ==
X-Received: by 2002:a05:6e02:339e:b0:3d6:d145:3002 with SMTP id e9e14a558f8ab-3d8125a9e0amr7085535ab.20.1744744559647;
        Tue, 15 Apr 2025 12:15:59 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d80b6b0392sm4898535ab.63.2025.04.15.12.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 12:15:59 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Martijn Coenen <maco@android.com>, Alyssa Ross <hi@alyssa.is>, 
 Christoph Hellwig <hch@lst.de>, Greg KH <greg@kroah.com>, 
 Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: John Ogness <john.ogness@linutronix.de>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20250415-loop-uevent-changed-v3-1-60ff69ac6088@linutronix.de>
References: <20250415-loop-uevent-changed-v3-1-60ff69ac6088@linutronix.de>
Subject: Re: [PATCH v3] loop: LOOP_SET_FD: send uevents for partitions
Message-Id: <174474455866.197229.13564340998714651621.b4-ty@kernel.dk>
Date: Tue, 15 Apr 2025 13:15:58 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Tue, 15 Apr 2025 16:55:06 +0200, Thomas Weißschuh wrote:
> Remove the suppression of the uevents before scanning for partitions.
> The partitions inherit their suppression settings from their parent device,
> which lead to the uevents being dropped.
> 
> This is similar to the same changes for LOOP_CONFIGURE done in
> commit bb430b694226 ("loop: LOOP_CONFIGURE: send uevents for partitions").
> 
> [...]

Applied, thanks!

[1/1] loop: LOOP_SET_FD: send uevents for partitions
      commit: 0dba7a05b9e47d8b546399117b0ddf2426dc6042

Best regards,
-- 
Jens Axboe



