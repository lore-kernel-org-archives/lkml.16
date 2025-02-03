Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A5715530C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738609120; cv=none; b=aqYXNCBXCXi5dResjLhmGpfH+gads09dpC4QHIFZtCjD42cB2IVtKzbtSNl4MCa+xPZSJ8B9X2hyTLP0wpALG7/yWmizbDEZhXZ+8xJUh5n5lls/a9JzU3FL9Whv8BVAlCOlgqxREEYYW3K4TrsTacHWJv6iXikVa28VZxPclGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738609120; c=relaxed/simple;
	bh=9Vrs45JX2KrNPQ3Qz//5o6M6osrXwHlbAQIz7nxBx5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ANJcfrbWcIhbHY/6dcoJ3s2drXVEOdGiIVW5UidBQfTJYW5tLbrjsxXg3lXqGl5vmOgG+bD9YKs0qmvm0q0s3hqIuRDVbYLcMfKTv/zlPIurPBM4TdZu9XsOBlY3MtHGgjocNVSxfzOd1kp/so12ZcfDiRr6XmPiZXN+2RVEZfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=UI4Lae/k; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="UI4Lae/k"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21644aca3a0so112145015ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 10:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738609118; x=1739213918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Bm5p9Nue7nzWz6v6mDzeSS1FG2kP5ZwAJBr4lDHS8s=;
        b=UI4Lae/k6sYE5v933hwoNVzumEqQMqnBt6CeKeHztprS4Msarog0E3qm+w2/Chmidm
         5j/gOPaS64a/SABh6CEuBBSJmWS2fOrxq4T3z/xiVuFWL4ZBgFhFhcluS46rSBCjRoJU
         ufFyotkxGhkmVncnSd78qlWXC/31sYcdHAcy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738609118; x=1739213918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Bm5p9Nue7nzWz6v6mDzeSS1FG2kP5ZwAJBr4lDHS8s=;
        b=A1N2RjvAQRQJhMdYDx/nSjgMQew7hdL7kX4km3uWxmWXVBSKcC1KInGjSr/ACIl+Jl
         EzzUKq7lJJBEe2GYHizZNhHH0CQ9i4DQCf7dXJKtzPg01nxRGQJKtpdnOEZk9uXIb0rh
         EGIjCymVzxjNBNNMaC/3nY0g2PWEVKECpmtB+vC0Vng5QI5MoHlRY6ifovXBEvqtU33/
         hcdcOJnPzzyU6C9geBJiRKvHuHOMnh0zodJyaFLOlO1k/bFFmvm8LKT11qp4aFYqzGwC
         sRjMkJDVgkEv2wn/T84nlG0zMPWVhqgt4hk16iT1yPYBr4Djc+ewZTZRsmBd0X2uAjw+
         HrpA==
X-Forwarded-Encrypted: i=1; AJvYcCXfzAKMXubnKDonj8ozssXBFvRwa3x7qckTKqsxZU90/XVV9oWw1/RWSf8b+XAIhbENh2qUvXwYp9FJJdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBr0rNlswML5AVkYw5JxnQgKy5vH17LLJQCh3gdsA47SX9GJJE
	MyN/+/EOmKbPFjuxzPK6BDTbvCwI5UxIldKtQXSsdorMCDpumMzqwSEGA99KpRg=
X-Gm-Gg: ASbGncvYyXzAOcBjBvBqc8C9sVrlJ4tU/hO4aTbTQomK/iunhtMROUsOdRBcBihyzsE
	PhClPxK2Xory3+OPS5WvxIxQeelip98hnQ0pWk58ZDivKZoDUQDJQxko43oE7mBekbid3Ev4dtw
	fxK1INhvNY24zoOqe64DAF3ijrWHLK5JMAkSUIM22QBO/XWKHtOVzm2Mg/qgudftwoHPDwsV3Jn
	g4llFWxTmX64lWkfaBwPlgnEipbWeb39vHxLejn0uEtnfnqM6iqXjqj3Rr9NR9EQPdfeOD9E7VN
	Qw8mf+5lBXN30dKEq7VBqJc=
X-Google-Smtp-Source: AGHT+IGAZMvIDpReKNwR27kneLCRe81kWXQXBWPYyyPTFSzBuCyE90dag3gb7+FZFir2PKJPH8tmSw==
X-Received: by 2002:a05:6a00:1820:b0:725:df1a:27c with SMTP id d2e1a72fcca58-72fd0c1b91dmr30900086b3a.14.1738609118073;
        Mon, 03 Feb 2025 10:58:38 -0800 (PST)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec0a666ddsm6899673a12.73.2025.02.03.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:58:37 -0800 (PST)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
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
	Mina Almasry <almasrymina@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: [PATCH net-next v2 0/2] netdevgenl: Add an xsk attribute to queues
Date: Mon,  3 Feb 2025 18:58:21 +0000
Message-Id: <20250203185828.19334-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

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

v2:
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
 .../selftests/drivers/net/xdp_helper.c        | 90 +++++++++++++++++++
 8 files changed, 163 insertions(+), 3 deletions(-)
 create mode 100644 tools/testing/selftests/drivers/net/.gitignore
 create mode 100644 tools/testing/selftests/drivers/net/xdp_helper.c


base-commit: c2933b2befe25309f4c5cfbea0ca80909735fd76
-- 
2.25.1

