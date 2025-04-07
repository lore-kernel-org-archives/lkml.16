Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11CB253B51
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031593; cv=none; b=Osv5AqmRX1n6xnugIjg0BoVHqrgaQyVdX/MkwtDf68+u0J5YKaTsNMS7btywrONkugz1d5xBaw8hZyWSbGaJyMYhJ91/Cg8MooGQms1RcPJIBjma9sfungZZJau+R094DHF+CNfWTcVAB9ajPI0/GpirTM1xaJfI7FRIpqfLMcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031593; c=relaxed/simple;
	bh=e6qZfNXFV9KHcehcp9uEWUrK8S0Xj92UaYp1vjRpE1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-type; b=OSvVoEPNWvNgmxMBuQwcUoVCDrJWwyv1AR7tFysPVBpWKpHBmjAYtHQgaQGUofbgLGkKbC5Zr5TWx0wFMOPn9gQhKVj98RQMZ4wOmUioHwn2xjXwyrzrvdxxFBFnd4r+g0cNKdUDZzcSplR6UPb8fbM84hYhjkDKLuXCwz3KMsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UQvPoIvD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UQvPoIvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rgznpyMWyyNl1d6TDrUHzLlVmDIGh6R0MoIe4PNIF4Y=;
	b=UQvPoIvDVxSPlZ/+/a+BYemgdd9u0UN6/DGTcWKiNMPp5dQ/KojBtHxLrBhcHV3AaMZ1rX
	FHc8BmRpcXZxH27pM/+dI/TCC7qNXC4EZJBXywrM4+vb1Xumhk6roRmCQ4/qrK7oHXkVuL
	T+01NcFutdui4qODS4ZiuGr22KQ4GjM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-Ds3hVOCFOD2UZ5x9Kk6Rwg-1; Mon, 07 Apr 2025 09:13:09 -0400
X-MC-Unique: Ds3hVOCFOD2UZ5x9Kk6Rwg-1
X-Mimecast-MFC-AGG-ID: Ds3hVOCFOD2UZ5x9Kk6Rwg_1744031589
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c543ab40d3so655749885a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031589; x=1744636389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgznpyMWyyNl1d6TDrUHzLlVmDIGh6R0MoIe4PNIF4Y=;
        b=c9C+firotT33MErmCarwisPIdH7s52Qj/YitGVfFAJ1ZRhTbrHWmvz8U+8XyshTO9C
         Vh/4BSHqBqwhVKkFkMTSMO3qLzMaw2KWjdGGovH0hRIxgJRV9hnPuAiO2FRofmzo9nVn
         PNFmjpHJUTX06VFsmm6I1rzlAXREsxmdhP7N7JOlUaqqmtI6Sh6S8/htaxred/h2C2xO
         l9aui6XY8VaAt1HGjKKNI5iJr6JQpJ61dfB6W4RdRp7tRbR8ufKFw+h0RUwHGrSulryP
         ezJ1UdEGtD+7XnSsp469Ku+OsMll2lZ5WTd/huQEQwhhMNUD3ZJ7qyBNLLp0HT6bzOO1
         C9ng==
X-Forwarded-Encrypted: i=1; AJvYcCVHfpwqaDEBD1JSmxEbQTEJ00bJulu/zOrn6ynTYQxhv7Kr541eGfI3BTknCtqCUL4wHdL3514yySYLSUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4iJLEkQwCpJOaq/t43/L40LlyFuCNkBdXCqnPHqGx7kJ4aY+A
	1HiCrC+hvrSovZ/zgB5zpR6iNMz3LgamPL7dEZGWRwIwrwaelES+cccNteIHQzmdFIzx7j2Ujfx
	5lJlhLMpOqqrQwZWn5FGqrZLBl7j+egoTQh+/C+zQH5/BtIZQBdOclPRBpPF+aw==
X-Gm-Gg: ASbGncuAQXn6WJU3cxpZxW9bb4j0FZTQk70V7+hvlBKwWjO6iBFTkCaRHX1fPiElvXI
	Bax0R+mLPFzQQOxUKt0CiBCQ1OY3bTHW5/BQIroKbMR0df+wxQ1Z7o3fDKzlnNcZV83i73EaNHF
	bOhl/zA0Emd0SEhYvbuRKp0pzsklkQEEcB3VsKwwoiI90grNlDKQdf1SD1jGXnPCAHnkFQgR9lb
	Ot2JEQmuRutoXT3ah6X4cSquCFW4DnDmjIMjBlZU2GhlbbgrtupDAIzYmNiA2OzYO9alKFv6oC5
	bP6u2DV2Ba90xF/DZLxavEJXoZUzYMczEdyOJIXo8A==
X-Received: by 2002:a05:620a:4310:b0:7c5:3e2c:8e96 with SMTP id af79cd13be357-7c77dc86307mr1184828985a.0.1744031588821;
        Mon, 07 Apr 2025 06:13:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUyE+ItAa90VvpOU1RkokCmvm1NRb66YGJ2muPLWlF9I82IhCdaEzjXLo4bO/wFecOUiIHuA==
X-Received: by 2002:a05:620a:4310:b0:7c5:3e2c:8e96 with SMTP id af79cd13be357-7c77dc86307mr1184826285a.0.1744031588521;
        Mon, 07 Apr 2025 06:13:08 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 0/8] clk: test: add tests for inconsistencies and limitations in the framework
Date: Mon,  7 Apr 2025 09:12:50 -0400
Message-ID: <20250407131258.70638-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Here's a series that introduces some clock provider kunit tests. These
tests are centered around inconsistencies and limitations in the clock
framework that may lead to some clocks unknowingly changing rates during
a rate change of their siblings.

The intent of the clock framework is to keep the siblings clock rate
stable during such an operation:

    clk_set_rate(clk, MY_NEW_RATE);

However, it assumes that the sibling can generate that rate in the first
place. In many situations, it can't, and it leads to numerous bugs and
solutions over the years.

https://lore.kernel.org/lkml/20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev/
https://lore.kernel.org/linux-kernel/20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev/
https://lore.kernel.org/all/20241114065759.3341908-1-victor.liu@nxp.com/
https://lore.kernel.org/linux-clk/20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com/

We intend to fix these issues, but first we need to agree and document
what these shortcomings are. These patches are meant to do that, even
though some will be skipped as they are currently broken.

Special thanks to Maxime Ripard for the guidance and feedback on this
project so far.

Brian Masney (8):
  clk: test: introduce a few specific rate constants for mock testing
  clk: test: introduce clk_dummy_div for a mock divider
  clk: test: introduce test suite for sibling rate changes on a divider
  clk: test: introduce clk_dummy_gate for a mock gate
  clk: test: introduce test suite for sibling rate changes on a gate
  clk: test: introduce helper to create a mock mux
  clk: test: introduce test variation for sibling rate changes on a mux
  clk: test: introduce test variation for sibling rate changes on a
    gate/mux

 drivers/clk/clk_test.c | 601 +++++++++++++++++++++++++++++++++++------
 1 file changed, 513 insertions(+), 88 deletions(-)

-- 
2.49.0

