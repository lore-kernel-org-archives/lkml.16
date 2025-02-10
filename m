Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8949B195FE8
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 06:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739168421; cv=none; b=rmvDGsOiA3T6xzaA/FZZhXH6CJ+X52gNMPlcQLPitZRNpTO9x8SxwocQjqSWhbvtJbKK0WWybHnIR0gvPq9gLznof15orDIfAhDWUmkJIMdB9n8qhoUvoB2lJq1MMfSiJ/iiuFE6mwGGJ1j62udQr4T1Vo6u9qkiQWdEWjembjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739168421; c=relaxed/simple;
	bh=7Wp7/tfM+A5b8z4K32rqRyCxEl20F+ADn8UiyBzdvds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mP3+9zbcurLEAYbEiOKdL7h/t9uJW7CtxQd2rQkeSbTgx1/cXQMnIuCIimSWdK50WAcGtSDsfxmc8Ozg/fHTdqmFsdis8GAa44Jjw3Y1u51FH2ElPsnrw7Fd22zBAwkCkYgzpr4IyOrZCRNVhJ5aYrizP3Fx7jrBwLosiHrs7jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glLV1omE; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glLV1omE"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-21f4500a5c3so74291115ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 22:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739168419; x=1739773219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Wp7/tfM+A5b8z4K32rqRyCxEl20F+ADn8UiyBzdvds=;
        b=glLV1omEo7+rY+SCynN3bWuRoIWNjghiaY3ccZZB8b25a8FOs0jWlLIq9LSixdchCN
         MT+IrUbI/WmKxrGnM9KBGZ7FiuOl3zbnQ9sJ0mjfb1UTyDPo+qScJwixOptcA/8YiPi7
         fA5GH9uym8XRMI1sAPoh1EVNSu4qPuTyqZnd5kDdJGtqFW2EESFgyuqQPqkSAMOBHcl5
         W1AWBQl6KQB2Kf29ukCdyNkaYHvHovYSxTkK2rqP9o2HOG3rPR9mfLjc82D0gJysAiHf
         sZJU2Vx4kXiMl2GrqrXYQDOEn34P8zLbNJfk5yl0oTqRSWYFZctXv8XK8UacooOaK03Q
         Ys1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739168419; x=1739773219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Wp7/tfM+A5b8z4K32rqRyCxEl20F+ADn8UiyBzdvds=;
        b=uE8ahlpHp5Lh2PdZls7k1SsM/j0xJfe5MBRkNsioggT07p9ek9fkuSVs1YaIBeV/Oq
         YnLmQkNs0dxDQL5DNzE2t4VcgTy9vJWUIKy6+SlZEQdP1KE4wylazUjY3KyVUCkKgeks
         lY+kR1780NB/iCJUeQluIqCU0QdrpmQi3SK559FFduZ23Er6EDi9rCmJyNAs28+zE302
         tZA2EMCNgQI0B/0D+I7+vif+foeZ7SzslPx2WMFQ0LxWIccAiRTOCeOj2c/5na3EsBMB
         jqKdCnB0h8YJCaBMFJ+0dEnbDNFGxTSILdZExa8Zyiq3sFu8If75RlFK2pQ5aqYafPK3
         wZbg==
X-Forwarded-Encrypted: i=1; AJvYcCUrR5Zx4Tw4jEU6Rx5zkpHc98+rlB+uslUGvijNJMLI/C6f7EthuTsEVYvRsca21d/39CUsMCPAnMaVMy8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2v/5DsYFXZUCBKSDbY9fSzVwpceVIR/GnUF4G8Wwk4ouYZ4ob
	TN3WPxGkCIsOLszS8lMgfze41CVikfi3n5r4EnNr2utwDI/frZbS
X-Gm-Gg: ASbGnctNjtchXS3i1V/vhGuQDrTE+DtjHKIybYqjYqV6b2plYn5ovxTgMfsMQ2Rphqz
	EivtBciB+ax+DCMTuwTE26tbDNXQN1+bzPUswzAFSnonRh07Y9qR5mlkzXnmq8vjDq+Lv4zZkoU
	aBHvahmEtn8Y+C4/i1OTqHB3uavsDr9VQEHYJUjOY6+XndOnOdAZemSWONV6LUy8EfaoFPEJLTO
	RVNx9oEHdf2RRs5r59PnO9MjAGRjofg2lRBJO7MIOP53a2iO25UhWTYmHsTaN9lK7O1BEKr4VJZ
	mCWLZYCG8MzGOkbI35RiNQXmhgW+ujL9tI0=
X-Google-Smtp-Source: AGHT+IEdbXS2Zh4ZrwEdEgg2TyvvdF2XbZSgGt+9evwuqMhtk/Z40DBs3AiYdNRQa0nrXQQzs2o4KQ==
X-Received: by 2002:a05:6a20:c705:b0:1e1:ac4f:d322 with SMTP id adf61e73a8af0-1ee03a3d0femr21699696637.14.1739168418814;
        Sun, 09 Feb 2025 22:20:18 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c16391sm7074511b3a.131.2025.02.09.22.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 22:20:18 -0800 (PST)
From: zihan zhou <15645113830zzh@gmail.com>
To: qyousef@layalina.io
Cc: 15645113830zzh@gmail.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH V3 1/2] sched: Reduce the default slice to avoid tasks getting an extra tick
Date: Mon, 10 Feb 2025 14:18:56 +0800
Message-Id: <20250210061855.299323-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250210012931.ym337oexdcjmwwzv@airbuntu>
References: <20250210012931.ym337oexdcjmwwzv@airbuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for your comments!

> I brought the topic up of these magic values with Peter and Vincent in LPC as
> I think this logic is confusing. I have nothing against your patch, but if the
> maintainers agree I am in favour of removing it completely in favour of setting
> it to a single value that is the same across all systems.

Here is my shallow understanding:
I think when the number of cpus is small, this type of machine is usually
a desktop. If the slice is still relatively large, a task has to have a
longer wake-up delay, which may result in a poorer user experience. When
there are a large number of cpus, it is likely to mean that the machine is
a server, its tasks often are batch workloads, a slight increase in slice
is acceptable. And a server often has idle cpus or cpus with low load, So
even if there are larger slice, the interaction experience is also not bad.

> I do think 1ms makes more sense as a default value given how modern workloads
> need faster responsiveness across the board. But keeping it 3ms to avoid much
> disturbance would be fine. We could also make it equal to TICK_MSEC (this
> define doesn't exist) if it is higher than 3ms.

I don't quite understand this. What is TICK_MSEC? If HZ=1000, then
TICK_MSEC=1ms? Why is it said that more than 3ms (slice) equals 1ms (tick)?

It seems that this value was originally designed for
sysctl_sched_wakeup_granularity. CFS does not force tasks to switch after
running for this time, but EEVDF does require it, So if slice is too small
like 1ms, it looks not conducive to cache, and is not good for batch
workloads.

> Do you use HZ=100 by the way? If yes, are you able to share the reasons? This
> configuration is too aggressive and bad for latencies and I doubt this tweak of
> the formula will make things better to them anyway.

I don't use HZ=100, in fact, all the machines I use have HZ=1000 and more
than 8 cpus, so I'm not familiar with some scenarios.

I think that if the slice is smaller than tick (10ms), there is not much
difference between 3ms slice and 1ms slice in tick preemption, but the two
are still different in wake-up preemption. After all, when waking up
preemption, there also has update_curr->update_deadline, and the wake-up
latency should be slightly lower with 1ms slice. So I think, when HZ=100,
different slices still have an impact on latency.

