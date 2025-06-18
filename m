Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD9B28A1D8
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249179; cv=none; b=kJP7ZWpCxwTeGtcUkDsscZP/7VIxyRwG3c8do621c3HLB9IojWpVda4cqSwB3drPCoH/P3yt6GnZebbi3J6ofVwxOHPvSIOiqzIwHl7XgcOXtn/n6dLr69bwPsfx3gz0MerXpT3CsEnGJ1W6wss53KP2fykZwwPp3V4wEDEaCHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249179; c=relaxed/simple;
	bh=NzOG8U8UNN3wPSVZoMWk+hdXQQdqSuFIxJQ5ghdut+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K76t4C458r3NLydsU0/9QSdeHUIqCG6O9Jvgh6rvhs0xpB6cOhbgoaaU3D+HwEdgVb7qG+K0Gb21Y6w3p+aYRIxoU2o0uRm0dkh2x6vPL5IycPokRkDsGoXyN3l0TtKNmzAv7DLKxWF0Lo3A2ESu1Iu0QE1oqjNhXQxNf7HH3tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UxCUBE1m; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UxCUBE1m"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2349f096605so91963835ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750249175; x=1750853975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPxLnb07w2EJ8LEoe+9pqi7EbyUsRwD+FfXs2j0g29o=;
        b=UxCUBE1mWIvFNPVKdXfdoZCh8mtk1FaeZyzJmkkObTjlcM7dLVvWFlV5deohWW/0+O
         bsl3unp07DQI+lS4orFutuSym8IuRld/IqlRfepsWcHclmVeLaztfSRVvYpw/Vh7Yg2v
         g+YQlRJSvMAv+Fnps3ygcT2Ki077trKzWzbVebYLWfasQYZ6gVxq3Zjuw2WZZZGPvEQ+
         Tx5tbYb+C67iWpfGmuO1ybDLqXbB+f4bs9q9Ehl9CGE0Oitv9Kp4k4bDRT2M2PfvHDiT
         VDystkZ2Lqn68tr6j/iPe9AXKtFk5E/UUl7IK3xyX5HUT15eQ4bXueUJJaAGE0AeKQmx
         W0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249175; x=1750853975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPxLnb07w2EJ8LEoe+9pqi7EbyUsRwD+FfXs2j0g29o=;
        b=aHTqfaPnvQf+Wd9Nq7BjTy/dx83fcVXdhMT3iUlpk0S/gFJXTElLAiXUkwdf3z4jMs
         INw1ty3aImA+9xGe9mT9ZC7jXQsXtwxW2B+4SFc1wdlp+Cyqs4LK3JpCp058F2W3DdC2
         2f23dZOdiqYz9yR2z871es3ZaOWOz4Q1SKuWFK4IpdxTmMryizhWsq91Gw7A6dH0NM1R
         Q5wTDPBTbYcwTfJa8M8BowHuTko2sbsHgDV6fSgRICFDmAvs6tlno74URKv6uRi/DmoY
         BHkbN8CJA2rYLgJlNcCUMHLuJ3bfWNUAghsVFjip5LwGin45oe8MBrP8j5E0WdjV6TAA
         +VgA==
X-Forwarded-Encrypted: i=1; AJvYcCX4HLzftjO1IFzdct7QzSvlBEbOtO30fZTDJKtLYWoMQNZrI75BSCrUEJj4o916q+tNeTLJfrArmmvK9UA=@vger.kernel.org
X-Gm-Message-State: AOJu0YztK8xPT0dpqeHQ34L9dAJFQv2r7YEUf/ARr/MEsH9i0dmWOUvy
	kYZuUMyj//1W62t49xUwMH4BKuU6ByhRf9xpF2qgafA7mz0oaZL7VjLVa2PmP8w0dlY=
X-Gm-Gg: ASbGncsqdKbSmtZp+UOuvdR2x5ToTqvkKziNJo/tNkMkYZVxeCrJS/zKW92O2FIRFO0
	hD4LhkHWSzU6ceCP5FMyFfeaBSU1zHJ2JXaQvQdbKqT8vE7jbO4Lf4zMlYyeqJezNGKO47iNeoa
	egPg3X/kB04N4AQtUuP0H8d8HngQKhRs5C6KoxJV87gpJBw1XIWOHPq1pFJl2z08lhxPz+xwI87
	o1Vuh51wp19eMXUDerbc2myaKlZqh9JOQBqbdMh//Svbl8g9qkhnHOPztNjh9JGrnKrkDxxOdgB
	s+7krRis4RAl2YoSJ9uwr5BDtKr+hnMdJYQEcjug0LLi/Tj1IGbbmUP5gr3+fIpOaVdfanmeMbY
	CC0rePqX7Ls0U
X-Google-Smtp-Source: AGHT+IHr2BtBXka0zKs63iqb8e9v9bkQ4+Bw5VuVkckVQQXkUyrc9aYneUo5DkOGQbDxvEFfQuAk4g==
X-Received: by 2002:a17:902:f652:b0:22e:3c2:d477 with SMTP id d9443c01a7336-2366b3ac524mr289851425ad.25.1750249175033;
        Wed, 18 Jun 2025 05:19:35 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88bf61sm98240975ad.22.2025.06.18.05.19.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Jun 2025 05:19:34 -0700 (PDT)
From: lizhe.67@bytedance.com
To: jgg@ziepe.ca,
	david@redhat.com
Cc: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
Date: Wed, 18 Jun 2025 20:19:28 +0800
Message-ID: <20250618121928.36287-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250618115622.GM1376515@ziepe.ca>
References: <20250618115622.GM1376515@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 18 Jun 2025 08:56:22 -0300, jgg@ziepe.ca wrote:
 
> On Wed, Jun 18, 2025 at 01:52:37PM +0200, David Hildenbrand wrote:
> 
> > I thought we also wanted to optimize out the
> > is_invalid_reserved_pfn() check for each subpage of a folio.

Yes, that is an important aspect of our optimization.

> VFIO keeps a tracking structure for the ranges, you can record there
> if a reserved PFN was ever placed into this range and skip the check
> entirely.
> 
> It would be very rare for reserved PFNs and non reserved will to be
> mixed within the same range, userspace could cause this but nothing
> should.

Yes, but it seems we don't have a very straightforward interface to
obtain the reserved attribute of this large range of pfns. Moreover,
this implies that we need to move the logic of the
is_invalid_reserved_pfn() check to another process. I'm not sure if
this is necessary.

Thanks,
Zhe
