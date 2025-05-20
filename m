Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6361D8DE1
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769352; cv=none; b=uSyjlyJysziaUevVeNqY0CYpYs9uY8AaXIKOb/raQuikjwLTseZg0lXjprQFtc276+P3ad1ihBS8GutvTzKRl71SW0XO8gapFXC5VIe/t9xf3w6N3S7CDxgZiV8B70qZ6k+VjX3GphnRyCqdqYXc1sqtEcmfgTulw5pGADH51lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769352; c=relaxed/simple;
	bh=07Yw41PCAfN/Ts4mVtzsfW85UA9i3X+tXkUv+UZqSSI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=JuKktl3P6p7+fWPDYDJBdRvYRvlhWfnRHm8Jl+pLEGvOgTp5VLFLjK+BOWBhopAyHXaRqMcGU0gdsC+uke5c6ChY7jqIJ68bT8+6+0o+0UJkYevMankO8j+9ZQKLEogA0kJu5D87IHAyNHxLNZLfHYQWajfdbE+muVdVKSm+1s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fn2T6NS9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fn2T6NS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747769350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5TDjZSLgZRYFv07Fj5qQ5qr4Txm6RJW3wHZw4fBE6+A=;
	b=fn2T6NS9RJ7kAyxIRTfv2iUpg2D5aMn9B6oIs6qNKdjb12yMXYwtdjujfi1obfT0Gda1i1
	WG7S9KToSsQbxyFJ3PTf+BdKRquoomj4fj/h1RtoTE2PVFnhk5BxLIgzTHORQr4cjdi/lS
	/UR5Y6vWMjV/jaL4TC3ClY+04fmLLDA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-AhU20Nb_N-qwOu-pTvgWUA-1; Tue, 20 May 2025 15:29:08 -0400
X-MC-Unique: AhU20Nb_N-qwOu-pTvgWUA-1
X-Mimecast-MFC-AGG-ID: AhU20Nb_N-qwOu-pTvgWUA_1747769348
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c544d2c34fso920336385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747769348; x=1748374148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TDjZSLgZRYFv07Fj5qQ5qr4Txm6RJW3wHZw4fBE6+A=;
        b=HyY/VkBtW69tP2CxB6j3f4vlJJiZtb3nUNG3hkwR4IGGmjiRDbH8piZYMXvJD8fdQH
         TJ8MMpWxa/u7RLcTQGYzhR+4AIydDGQeEEVpWB2/8/gf5pmZIUuCzFvT3Sf0gY7ifK+/
         kkQYl61wGaVv8QxvhPkBkLVmeipXlomz/NyqRpK1bN8NUMPlD+dsMrMjSMdwy2eZ6ZU0
         H67EK6xj6tCA5ywnxJhG/WN0fCXsdzwULyjLoHzaONBoNEGEFc8D/QGt7Gr/mROYatQT
         Z1vCp9YyAUdpDuzdvKPhRf9MwMhbzgBCAamtP0MWCtDbiVMhfiinuuWrLjgxSYs/r2hy
         zvxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuaNuACvLhkyeUPi5NrHiPlhjA7K+Z58hD6PVmFy0q3Oar492QnoDpHHbFfie4yFF5yo2jfgRJXeiJ6qI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx21wWBgp9PFwiP04E/ROcyxVWxPYWx6AedctSk6AJPEBWme4sa
	NI/JHWFp7tuPSqzoW6VLrJOFzzG4K0hMLoByNelPtOYG7czzS5RKLtvyaSSJUBI22mBK4rwelQF
	88+ChyxCpfIvPWN3VrHriZRBYxtFu4i6DvlCQ+cUytXnhrR4JQKAI6j3raWqsJsvgXQ==
X-Gm-Gg: ASbGnctO9HN/sINIIFp9Mf/UNvV+iQy5c1/mkIeEGLRtxqfRIpmuhvhgDd2gqMHvwL2
	eZZMcpCAUNwY7WQURnx+n/J+8zP2cSuxJkc4YU4UDfHjnD52tdaIaKPTIGRSt1dfdp0ubNk3TXX
	pqYAQ+MfUh71L4Li89+HpqpaLHMGtfNVKTtLVPzRkV3XgYd9ycM9cfw2SxaloLZotE22vAK6Zkt
	2+TCJo9dCTlLZGKUDNv2ndSvAP14uHzu9QG9PCN+7F+qxGGW0GFxO4RwoUy/WRkPtOxh/l2y7JK
	iOfr
X-Received: by 2002:a05:6214:1d0d:b0:6ea:d69c:a22e with SMTP id 6a1803df08f44-6f8b2d856dcmr245669516d6.30.1747769347705;
        Tue, 20 May 2025 12:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuVbutCXqDSAWNIClFgBwzIL5GXhFguZ65nf6nF04DBXXzE/JIFAEgSyJSbfsU5ITXJ5w9Qg==
X-Received: by 2002:a05:6214:1d0d:b0:6ea:d69c:a22e with SMTP id 6a1803df08f44-6f8b2d856dcmr245669066d6.30.1747769347244;
        Tue, 20 May 2025 12:29:07 -0700 (PDT)
Received: from x13s.. ([2600:382:810a:a775:a7c2:b4b2:4756:68b2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ac502sm76018156d6.42.2025.05.20.12.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:29:06 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	mripard@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] clk: preserve original rate when a sibling clk changes it's rate
Date: Tue, 20 May 2025 15:28:44 -0400
Message-ID: <20250520192846.9614-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Here's a patch that helps to preserve the original clk rate on sibling
clks when the parent has it's rate changed. More details are on the
patch.

This series needs to be applied on top of my clk kunit tests that
document some issues that need to be fixed in the clk core:
https://lore.kernel.org/lkml/20250407131258.70638-1-bmasney@redhat.com/
This series fixes an issue in the clk core so that two of my kunit
tests can be enabled.

I will be at Embedded Linux Conference / OSS Summit in Denver, CO from
June 23-25th 2025 in case anyone would like to discuss some of these
issues and changes to the clk core in person.

Brian Masney (2):
  clk: preserve original rate when a sibling clk changes it's rate
  clk: test: remove kunit_skip() for divider tests that have been fixed

 drivers/clk/clk.c      | 28 ++++++++++++++++++++++++++--
 drivers/clk/clk_test.c |  4 ----
 2 files changed, 26 insertions(+), 6 deletions(-)

-- 
2.49.0

