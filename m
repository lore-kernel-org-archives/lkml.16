Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F4F153828
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738696276; cv=none; b=Z+LUZ7ONSmOtIyd6+O/kJY1NGAy3/I116DPz24Z9LIcA15HN7qy285KsoLpRpGXRkzEshIvXHEzTGNd8XmtV82dvaF9nevlZzz2OI5X+F3iwitXV6JPIpmlHcbWe/D+MJ/w8ONFJv/MPR5rr5AQMTxx7//B2/BXc3kQ/DH83n7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738696276; c=relaxed/simple;
	bh=0fuYrIsqllSYzLcHkJwRY4bJmN7f0RR3V+7BnwkqZU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I/c0JlGKduUqRCbUhWGPQCTTWhwOs8nelgkZQg8T6Am9/E0dKDV8fTpQnavjdEgDkFERjqgQ/1k1PYet4CBlMxtpkkppTwqS5izMbkWXMkAm5EmABqABg2GfDp3OC+gkQhESKhztJY5SeMF74EfcdkaP+MHRguvbDKYDULikq2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=p2iNy5Wu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="p2iNy5Wu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-218c8aca5f1so24445955ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 11:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738696273; x=1739301073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f6v2PFnPWGVlwpnR5q4crYxZDb82PXI2M6sV6qpxfa4=;
        b=p2iNy5WuLXL7dHihh847affEbdk5jw/XsmMqHzVKEeg58Taq2ilrheA+kep6UOex1C
         3fzqB7rMwZs820NvP1WwDqN9HeD5/3ExVn3TUh9mHjae6bMXvoE8CorbfPt+FYD2RHB+
         cFnL4nkHXDUb/ThnD9Uh/NUBUQB+sKeWPLwKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738696273; x=1739301073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f6v2PFnPWGVlwpnR5q4crYxZDb82PXI2M6sV6qpxfa4=;
        b=a8BtUVD4PgwMb833o9bRhDpUdkmjvsb/4dS3b+WGaGK1P1X77iEN6GcZFX6ejKecMP
         Kye6V1tIxCcrZ9EHyfnLBxweai2MUi5itXRsQP/P+f2MhLrh2VO4nvaIihLnPmP2JebH
         WGFIhI2Zd8tugo0CFjgMjZkpYzEkLGK5FgiiF8OyBuaG3oV6dCkItHtzo/jZrYH6p7LJ
         qX8Rb3uVUCs+MbbQC8u7t3RUAycrUOhp6IHD/n46SYft00ZQXTZApJm12CTjpamsIhSv
         HbPrKd2bSULr437+JrFTDHje5RJozJ+ry+EdxcxihmYa0Tn+xDPgXIqEwZwjwTdd4STb
         lyhg==
X-Forwarded-Encrypted: i=1; AJvYcCV61InFVyE1kQ/JXnpktQduIlzfkDt5fdzGPD5M9o63zYPqMZBLskvPR0l83zt22mO0/dyxZxQ/P7Zr264=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu0SqE3d5IlIS0CnnRJQgFs0KpONTiPSsJrojap0TzuKcE4jVo
	pjFvfj6PON5d1PjFBAYeopLDxW/nsdbrMP20SP9TSymNplt9EE2eqlvwGhtSvR4=
X-Gm-Gg: ASbGnctKl06exlB6ygYcQn8NDiKvB1eoXHq+sNwvKDBRjxthS5ZBozjwfobkQnZXex+
	BmD94bo9ILmt2lTlMuw737nLcFWvQQywDS2KHgSNEVtrOYgijOkSf8AOEWee/TfLK5UvTagPdqV
	YPPGTFhmC8eSV+tP6vpRS9c1dNgnXuKry5mSOcmdSbiRVjYjNvpfBvcpzzb8m4FlN4yCzjsXAOP
	xjyYhsQ7DlPnwZY5HYMMAt7hn8A1XGalo6K2B1rhvDimhwPcrjIM3zNLXm/JUT0XGwcmDFzuUtX
	cQbomtUKB1abBFe1Q2CeAeA=
X-Google-Smtp-Source: AGHT+IHanqXpzFtreEkBCacmTKic/+ySduWwGEttNxARnmGyeReqSJRYRr1Lcw0ZgAN2NJKjdJwsaA==
X-Received: by 2002:a17:902:e747:b0:219:cdf1:a0b8 with SMTP id d9443c01a7336-21dd7d7ccaamr366849085ad.30.1738696272708;
        Tue, 04 Feb 2025 11:11:12 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5f1sm100749785ad.130.2025.02.04.11.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:11:12 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org (open list:XDP (eXpress Data Path):Keyword:(?:\b|_)xdp(?:\b|_)),
	Daniel Borkmann <daniel@iogearbox.net>,
	Daniel Jurgens <danielj@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Mina Almasry <almasrymina@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: [PATCH net-next v3 0/2] netdevgenl: Add an xsk attribute to queues
Date: Tue,  4 Feb 2025 19:10:46 +0000
Message-ID: <20250204191108.161046-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

Welcome to v3. No functional changes, see changelog below.

This is an attempt to followup on something Jakub asked me about [1],
adding an xsk attribute to queues and more clearly documenting which
queues are linked to NAPIs...

After the RFC [2], Jakub suggested creating an empty nest for queues
which have a pool, so I've adjusted this version to work that way.

The nest can be extended in the future to express attributes about XSK
as needed. Queues which are not used for AF_XDP do not have the xsk
attribute present.

I've run the included test on:
  - my mlx5 machine (via NETIF=)
  - without setting NETIF

And the test seems to pass in both cases.

Thanks,
Joe

[1]: https://lore.kernel.org/netdev/20250113143109.60afa59a@kernel.org/
[2]: https://lore.kernel.org/netdev/20250129172431.65773-1-jdamato@fastly.com/

v3:
  - Change comment format in patch 2 to avoid kdoc warnings. No other
    changes.

v2: https://lore.kernel.org/all/20250203185828.19334-1-jdamato@fastly.com/
  - Switched from RFC to actual submission now that net-next is open
  - Adjusted patch 1 to include an empty nest as suggested by Jakub
  - Adjusted patch 2 to update the test based on changes to patch 1, and
    to incorporate some Python feedback from Jakub :)

rfc: https://lore.kernel.org/netdev/20250129172431.65773-1-jdamato@fastly.com/

Joe Damato (2):
  netdev-genl: Add an XSK attribute to queues
  selftests: drv-net: Test queue xsk attribute

 Documentation/netlink/specs/netdev.yaml       | 13 ++-
 include/uapi/linux/netdev.h                   |  6 ++
 net/core/netdev-genl.c                        | 11 +++
 tools/include/uapi/linux/netdev.h             |  6 ++
 .../testing/selftests/drivers/net/.gitignore  |  2 +
 tools/testing/selftests/drivers/net/Makefile  |  3 +
 tools/testing/selftests/drivers/net/queues.py | 35 +++++++-
 .../selftests/drivers/net/xdp_helper.c        | 89 +++++++++++++++++++
 8 files changed, 162 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/drivers/net/.gitignore
 create mode 100644 tools/testing/selftests/drivers/net/xdp_helper.c


base-commit: c2933b2befe25309f4c5cfbea0ca80909735fd76
-- 
2.43.0

