Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF4428540E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745536173; cv=none; b=TATW1SV//CWgCXEUzhls+lIM8r6aB/Fx+1a6EJRvIbJHFgg0g0W/ub1ZYeaV0Y8+x6p+NzyCRuwxXvlCsMJD+bIYwnmuhh6H7jW+MHHtIkGs2jVRS7Em5GqE9HOYNQg/yf+EMj5TuH7/Bshi2EyVEvlsKKcsvwmqyE6QyC23UVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745536173; c=relaxed/simple;
	bh=LBAj35BXtPm72neUP6fWKKhui+OAcA6lM/hlfGmwp+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ERoLTD2Xkw7GkVpCfsg0a/j9SF6m5IjzDqPqwHfk9qk9+2GarU7zXQf2ha+XgcsuU0Vg3S+//2qp7n6rb6ccfYs3l/I5PvziL95IHZUNWGcRe0hXkZhyEhSM3at+B8VMQGCpxYrxlYN1M2GotzN5QRULUwXkPnc3c+SMmvLSJMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=T9X3Dc4N; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="T9X3Dc4N"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d81768268dso13377965ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745536170; x=1746140970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJjb6BpJL6QKvLq7uGZb94kh5q9VZv1RBI7gdmZfS1s=;
        b=T9X3Dc4NEwuLh1xEy5ZOt9W45gZV8ejJw5cZKce6/nCy3xU+vWawF6UGjbfTIF7/8k
         eCxopddy1dqwLhxGpqZcF0g9BfMwjFOm8jDUCqYwSpGwCd7SOR7ooC6hmxM7PpXhyzcX
         m7ClQWBQoHTXIlq/K70mq/3EObJr4MoPHNcDD1BDBu+5QfIOMWsezPXof98/BcL5agxf
         jcFDBO3RDOqG9NMlcENP8655EDuAhsuycQyZCfFTQLd87HkqO5YKHXZF4Q3CuAiEFcg4
         M6o+FQKxSl3HsxlUwtLBqRRlOhxWGdTExQjuQyVbFgN5Tdxu94K1UC1GNPYMM72G69kZ
         8xgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745536170; x=1746140970;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJjb6BpJL6QKvLq7uGZb94kh5q9VZv1RBI7gdmZfS1s=;
        b=MTht8AoZL4aN6QewY0HsQm0zfjFwlaPvLpL4yBzknA4nlloc/jzKYHbM9Zgor1f1Zj
         iYWYs/ZZh3SkIG35pXufIRggfVvHMsOUeUhmGyiAQfNR01NzEHJGwfXwAc+zK+o9rY/n
         dWeZuybbH/VY6wSKnMEucOdCpoh3QOpNY7twHObhl9Owfn2M2y9B/GswKd0mUto2riHv
         0Tii4tUYRMrPXAphNNuQiK39NJuCPquCXGiHS5rgKtKW+AwB7+uZ4mmqDH9Kovx/zXaJ
         Q3dWAngOqla9xbeZRjo2mS25XeTujBZ6fUarD5bmwnKx2n79LXicjXVNfndIHcUjFNE1
         yrFg==
X-Forwarded-Encrypted: i=1; AJvYcCUpYGy4aSEQUKgo5uCtKraL2x5vgTx3TQgimAU5sZseuhxB3Go2eZvua6QvgCXEahw/d7IJVUIRFcjtOIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYMWpufNrW2RRKbyxT4WQCJBMSm16jSpSbOLaxRkDa+66kV4hI
	kA9Wq8YWBjDfy9eNO2LuFB1ILajd+p/QgNG3ZVjn5kIrTkMgF1g3pQhkx+Zphy4=
X-Gm-Gg: ASbGncuNgpVFVjgYS48LYG7qc//TpeSpjAtZ0sENLecPeqJmgjQp8cbalD2HoGd9OCH
	A1zPbR4pG0JGCYqa313NLtomjVhFnaDYT1DkLUonOz5eSFAOJwgsVCP+xnaYgb1g936F2jfObBC
	PoE8Uo7gA3jZMt4xIAloijxAO4jO0J4Ot5/kLxXhBPC30htnxbCVUgG2kGqnIETnyn6n9qw/btc
	QGrM/Zzw/uvIhpBHwUXP59oyjv6ytdYHJH915KLJqaiAA9S8Qe9wdg4SSevXpIqICaBXN/8c8wK
	SGjCzpjXcFeHCPTRBy1wPPw9MPO95cWiFvjSN0nSatQ=
X-Google-Smtp-Source: AGHT+IFN4iX9Opo/jgx0my1Sh/OktR9LAH6c9SxUf0e5vgEkErJNPR+8tLRlz2/fbrwi+twY4MhFrw==
X-Received: by 2002:a05:6e02:19c7:b0:3d4:244b:db20 with SMTP id e9e14a558f8ab-3d93b5c8413mr1280655ab.16.1745536170090;
        Thu, 24 Apr 2025 16:09:30 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824ba0ec4sm486419173.113.2025.04.24.16.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 16:09:29 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Haiyue Wang <haiyuewa@163.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, David Wei <dw@davidwei.uk>, 
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250419141044.10304-1-haiyuewa@163.com>
References: <20250419141044.10304-1-haiyuewa@163.com>
Subject: Re: [PATCH v1] selftests: iou-zcrx: Get the page size at runtime
Message-Id: <174553616879.1018402.4580438030053211278.b4-ty@kernel.dk>
Date: Thu, 24 Apr 2025 17:09:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Sat, 19 Apr 2025 22:10:15 +0800, Haiyue Wang wrote:
> Use the API `sysconf()` to query page size at runtime, instead of using
> hard code number 4096.
> 
> And use `posix_memalign` to allocate the page size aligned momory.
> 
> 

Applied, thanks!

[1/1] selftests: iou-zcrx: Get the page size at runtime
      commit: 6f4cc653bf408ad0cc203c6ab3088b11f5da11df

Best regards,
-- 
Jens Axboe



