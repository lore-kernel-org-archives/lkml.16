Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70D9299ABC
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930073; cv=none; b=FRuQv/7Nb5JS0lx5XQeR4e06ZHi4TI2C7Of9BUMXIqHNsLq+IlBNL+nEM3W4glj5oMg/O4TFQQD7cdZ58NAmixJpnPusV8wvT7Qml0n7UsBgMBeTAGUFbNdNVZLgvqbhlXcziqguOb/4xbeTsXufsBZ8TzToRJcA2BWpWqaiYkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930073; c=relaxed/simple;
	bh=G8Mv8bQiaDJa5SmClYhERN31MEnqOBxSaleO48WeUSw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S5bjbsJLbFfJb2iu18Mj5P0FZbna/srfgOO61zGcY/gK2z3qhhyLoBE9NjLJF2weBq8Qc2FJHiZJGelJDBkGn9ot8mqwhlCwltZgte/kz5GFZZY99WkQEcSIJwDZsx1ufmCPMN4gNS8iYe0I+mnFDu6hfoQB/gu3wMaoDuBtRNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=In63vS5y; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="In63vS5y"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85b3f92c8f8so762266939f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747930071; x=1748534871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0F+3sCLS0bt8X7P5AVbJqQjk87UjImEe9PD0EgmZH0=;
        b=In63vS5yi1yBruF6/7ppKhAMk0ufMqn1C4oO9lk7jjIxCScnYkDTIoLFj8f6F0L11o
         wjkvnr7UJh83oJRuMHuAsiBhCe2AIvV1Jtf+3G37pLrEJwbygiwn0v5ZWHjxVGwqBLZr
         TyGzn0SpAW7hD71GVQ6iaRR1esAlbGhPMY1NdqgFz3RcIohK60Bo5/wh0phcUdYRv9aA
         6Xn8mlYrU63zEU+kNJtCi1J5N+txC3BSerZVAMa8SACGm4RW771EEOxjUuLm9ErdrrZl
         mrnRh7+XRnBjBS9TEVrBVBxtc16RFa6E9mEwTRxAvWY6lRkMdDSLukdVtqQmclQhCUa0
         Oa4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747930071; x=1748534871;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v0F+3sCLS0bt8X7P5AVbJqQjk87UjImEe9PD0EgmZH0=;
        b=HdE3ivelM27Wm0fiiUSl4iFv1i2N8+dVUb8PRyIg83+Eb0Y+QIf0u4ivy3GhT0qmWn
         duobqiTBPjBsF6PF4O25u8FVENherVXoChc5qd9odmxZZCzGQJGCYZp/X0Dl/RJGgp7d
         NjbwCSTGRWy8uKiKTrN1TciZLvX/1+mPs6T1l+tjK/xmFbXQwgd2q2ZJSErgxnqmTY6C
         lNidTFdMjBETK/vyyd+TkEyJ2CW7Y4jXJ1z8V3qgrB8Zs9EhjR5qc4XUgaUiPN776/lw
         pS8FFBNRlVINDeivdYMau0jLGRi/AvwwhWTsdAFM7BqTMOgpadlh3WC8vk1oxxQBRQ2d
         bVdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpAVVRc1sGspJR4+T2oncIegKDJw6RajAtJyTrYD0Eqhf8LHIvNQ/pEQVV+TBTt3c23ocqx793/1voKZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgiL/T7qET8Y0q/9zpcT/ARlSzsiDo0719zK3Ll72qahjlPdhn
	Q3LO8P6ZCyTYpxOoLcRobESXiqwet82yEIBM7gfaUNXr0ZAxALG6Oy6nhepMIqTQYM4=
X-Gm-Gg: ASbGnctPu9R/pUgT1WEFNjW6Wi6GbenDWZz+3e2Vo4M0KRW12zBriY/qae/wyG63FG3
	nNO8AdLG9yGicGeXZIw9MDsi442NF3Jog1LJe3sEy18z8D2KIX+9FwzaCH0hZ2OPcXwIWhEBASe
	OKtKvowQKblo9XTczSP5CfQCG2OErS4LqX9huPiqpw/XnBaVRkOP/khY1u+7ev4SE3MdeUk3oNZ
	STyY7wNx90BK0CO0WcWq9kQP9Q6o6GL7iO6GJKCU0J6rMUIkCGwSUDLjGllEmzamj+wbgHJbXsY
	JN26ZbbjVHvT2K+bHjH8tv1w+Emt8H1+FvdmTkXWuA==
X-Google-Smtp-Source: AGHT+IEmmT09lNxt6NVOQQPJ4Ie1OiNcfqxW+xqlr7SYGEsMkYruK2UASM5a6xpf1CgsBSaRB00c5g==
X-Received: by 2002:a05:6602:19c4:b0:86a:25d5:2dbe with SMTP id ca18e2360f4ac-86a25d52e54mr2466836239f.4.1747930070711;
        Thu, 22 May 2025 09:07:50 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86a235e377csm305088639f.17.2025.05.22.09.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 09:07:49 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Pavel Begunkov <asml.silence@gmail.com>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org
In-Reply-To: <20250522150451.2385652-1-csander@purestorage.com>
References: <20250522150451.2385652-1-csander@purestorage.com>
Subject: Re: [PATCH] trace/io_uring: fix io_uring_local_work_run ctx
 documentation
Message-Id: <174793006954.1178150.14780914506137939683.b4-ty@kernel.dk>
Date: Thu, 22 May 2025 10:07:49 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Thu, 22 May 2025 09:04:50 -0600, Caleb Sander Mateos wrote:
> The comment for the tracepoint io_uring_local_work_run refers to a field
> "tctx" and a type "io_uring_ctx", neither of which exist. "tctx" looks
> to mean "ctx" and "io_uring_ctx" should be "io_ring_ctx".
> 
> 

Applied, thanks!

[1/1] trace/io_uring: fix io_uring_local_work_run ctx documentation
      commit: 28be240c763a44932bfe573f09e145d182e52609

Best regards,
-- 
Jens Axboe



