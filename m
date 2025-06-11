Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8474289E19
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650102; cv=none; b=JCvrjIKunaAZ57vQ7Sc5u4HrPN8TSG69ebjtCBsZtDPP07x+jsLRonafq4JEw2vs3bRR7bfDCa7Q++Yy/dWanqnFAq8oFoFn5jgopRnIkt46wI26WW22ZGOnxGL23Iy5h7AWZ7mqIobfhUKK8W46VOBs0eO4lhkdXixVNxcYgUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650102; c=relaxed/simple;
	bh=4S/8XFifK+yslSu1vzucpvyrJRF9zLOqC5TSPFHxhbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIu3QGIeQM0Pq0BnNCDr11bFnmGSEtBg6iiR/lP3PugSKd4vFnqWEaPKrAqS5xs9+ufFolgbKTgWB/fYmKPrvpE13rspz3USVieeSN0cm8Ygr0brFfMX/qqcR4by7Tyrc77bc/faWymcFNfUxNs0wmAdAsBk8gikUDa3aN/ZWtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aS19zhAX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aS19zhAX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so77277995e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749650099; x=1750254899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4S/8XFifK+yslSu1vzucpvyrJRF9zLOqC5TSPFHxhbQ=;
        b=aS19zhAXhqVPSQSLjuaqCg/U+flmVfsZtOw3eHx9kQ5yJdPNiuTMds041WtJIitqLS
         qslVtR7BETjRHOmfiwvZs0sFWAEpTVff0yeoHs87y1nUy5Juep3IFDpUKxI5lkkndkAU
         EwH9hZzNe1i5TIuHJFrg8HJuLZqOgl1dZTxdlGTBQt0lXshiO3AhkPQ3KBP9SA5vKZur
         FvrYRj0VY7cc+LpdcofzcwliiOqCd+d1TO/hd2yhyVSvx8Or+/GAa3nwUudxOarbaZ1B
         yniBMf2aOsRwCnE42+3Y7mWozf8qo7/NEO0+7/CJLQZycypeIVlvdN2mGI2KWZHwMn+t
         stQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650099; x=1750254899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4S/8XFifK+yslSu1vzucpvyrJRF9zLOqC5TSPFHxhbQ=;
        b=TL/NPo2mZOhJWuNBBht3TsWLMNXiUXGzNIxoyMUaqooD6yDRP/XPgROyP/jSdc8b/C
         EOz+CUs11BrXJkiHctiSyk8hRtbsS1Kg9gDlq6I0sqGNgNnZhGv8pu1ngjKd5rZ9OQes
         CMyiTloVZuuuVFhaHnQeLd5uw4vXxcUuoGhaa/woxNrECzNAembjVxgcQveoXvr0tIj8
         jsfWwo022Wz0UKGzcDxzXNq5jTYcBIN7LpmrAQKqfovH9GS+ewlzME5lW++wEkAheA+a
         MG3ZLgZegEjmfCYDcGhAVWh5N9HpoKphsDuhrIrR+9/I2hz0gpmbqq/SJq6/DTeV4BNI
         jLuw==
X-Forwarded-Encrypted: i=1; AJvYcCUlRceGj7c6BvtLTk7LqcLYkCM5rNsgW/rbxVObxPSYBo5VYDlknl0sP7SmJJrXbV+n6Lvcmj88BhpF530=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQJVKTZwOTC4gZz4cC7cVBmxJhUN+GUiz1zqLM1gG4GXwTsxjH
	565izhaffVEH+Ym4tzcRRwt4yE2HIMvyJJFUANRzOvqVA+8BfmD41VFb/a9TbD2/
X-Gm-Gg: ASbGncv4kYGWfh1G0XQIL/ifbNJ9gO/lERVyqdrZC0/evw/JnVVmyhQkdKrdtCGkK9S
	XOQOpP8jBnUqoKU1FlCeUIrC1fmcuwWx11J64s7+g/ce1zmZMxRT9hKn8lVQ1/vcXUQqPuJAkag
	NEAllTpHKV0IUXtVI6z+pjq2KIE8DINhOJKJQgdZJlktqbJyRfPPue1oIdnyCKf2pOhpmS/aCSY
	2ECsiKiQeLhYUBh7gn0vbmZEhdsPs6DlVGsiHRqBdKyz7++n8RMUF/PB69omz3nSvIHIhBkMs46
	6q+0Yep2eMrqnh/IfL8ZT9hkKwl4+BapBaQ5Tw3NIVzicgPPIjKFnTpyasFWdpijUUObGv0WtkY
	9aQyaK3xBINiluViutESmRQMNcmTP
X-Google-Smtp-Source: AGHT+IEfx5lcTAjpTKVYkVtz68rvsOX8fuO/lfe7x9bwH+UGnw8o8qGo8QSaJahQ86m80iS1g/9oWA==
X-Received: by 2002:a05:600d:13:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-4532493d13dmr25411525e9.26.1749650099089;
        Wed, 11 Jun 2025 06:54:59 -0700 (PDT)
Received: from yuri-laptop.sca.unipi.it (opnsense-fib.sca.unipi.it. [131.114.30.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532515cc42sm22042005e9.12.2025.06.11.06.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:54:58 -0700 (PDT)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: juri.lelli@redhat.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	linux-kernel@vger.kernel.org,
	luca.abeni@santannapisa.it,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	yuri.andriaccio@santannapisa.it
Subject: Re: [RFC PATCH 5/9] sched/deadline: Hierarchical scheduling with DL on top of RT
Date: Wed, 11 Jun 2025 15:54:56 +0200
Message-ID: <20250611135456.61493-1-yurand2000@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <aEfwxUyu54Y1EXJI@jlelli-thinkpadt14gen4.remote.csb>
References: <aEfwxUyu54Y1EXJI@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

thanks for your feedback.

> From changelog (and confirmed by changed lines), this patch might be doing too
> many things at once and so it might be harder to review. Do you think it can
> be split in smaller chunks?

I'm currently working on splitting this patch (and the patch 8) in smaller
chunks as you suggested, adding changes bit by bit.

I'll submit the updated version of the patchset for a RFC v2 as soon as I have
it done.

Have a nice day,
Yuri
