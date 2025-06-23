Received: from fennec.larch.relay.mailchannels.net (fennec.larch.relay.mailchannels.net [23.83.213.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D152B24679C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.213.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750707491; cv=pass; b=KhoHG+dGqNW6pM09mYPlNK5q2mhtiv6tlgr5p4RLIo1XP06CAr+5GvFYilibaqfEle8Ziry0zjNkjH5U30RgXSuRkQEoaomyNpG1/aWho5hxPUJ1ewL14Pq0nRmL/0IKiaKdnKpu3D0vqFstbX9gzyFtrxhne+8e31m7wLRNldk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750707491; c=relaxed/simple;
	bh=6nRuOi6oWdKyURJRX/wAN95CmMKxx6Kq0sq6pqGPASM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N35cwq/4geGMjwu7kloAwJ1M/IdCprF1RKip1TM0tVB2jUmiQsR51bCjMjSauUs3kY1QmEy75yC02AwpxbK3jwp4Kn3Z7XRaNKpgO9QU1FDXVLkGShqePM6lJ83yeG7vAO0UDiCUKM8TqruiZJHchA7G4qXhea4vUgN5OhTeWf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=pass smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=XCN9AQD3; arc=pass smtp.client-ip=23.83.213.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="XCN9AQD3"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6E430782A7B;
	Mon, 23 Jun 2025 18:59:41 +0000 (UTC)
Received: from pdx1-sub0-mail-a316.dreamhost.com (100-98-203-113.trex-nlb.outbound.svc.cluster.local [100.98.203.113])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id F064A7829D8;
	Mon, 23 Jun 2025 18:59:40 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1750705181; a=rsa-sha256;
	cv=none;
	b=sYU4hYBdImNn5u4SLLrP+7ip8X+ajrlAvku2Y//sDIJZWXTDJkddDp9hX14T23ubMOALQV
	D57rf1O9FH4WD0/lh940JkoOFiO9bEyKLg47ytQ4reT1zDXIzS0ZnKHf9K1JUhMiqMbOae
	deF/TLUMDXqzjNSq7pNfuQ+9bBIt8tNdy997AN3noszvjRA0anj5fQuYzXxOHhmI7VE4bw
	IhEeYiutxuVdDA6xcbhf7/OsrvisvrH2mEPhsE/Bxzwu96gxKvq1omT6ouFt2wkkC0XWTo
	VDpdS5zBtkZcHQbccbkRyOvlW4VRenA0IIi8Hut9333iPcR2pOq5AEoSW67eng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1750705181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=GjPsF5sy2emdaaRkjNXLkiP8YHqZLz2pLKdl2EM4SdQ=;
	b=mu9K2/m/jSupRlab2efAeI1f90YKnfk77FaIGOUUU8ntZ5jqlUI+N9M2OYylsNVK9qIu7W
	YQkRzxSYCWiwcHGsGElqHXhd6RSK0421uxCinu7w83ZDMvlUSwy2awugCqrEYWp5xetvcd
	Pf9Uzj8V8byUnBFBR/nGEK4gwyUmhzkWhiESgcwLb6qNMId6HSv5uZDwiXctjaEWVybwxT
	md+jLH4YVJTTWARCMJoO8Fm2zTZcHWHhmYdMUg/8izoDlZVu1iznbkxdYC6fQ1eReEGmwj
	hEtPIUaVmm4M3OawPso54apG/OHw6968iUJmXL/zF0KnGWZ3YFhgmYYNxyYtqg==
ARC-Authentication-Results: i=1;
	rspamd-679c59f89-6z8bk;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Bad
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Thread-Army: 61843410464b49db_1750705181298_2367094906
X-MC-Loop-Signature: 1750705181298:2289055330
X-MC-Ingress-Time: 1750705181297
Received: from pdx1-sub0-mail-a316.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.203.113 (trex/7.0.3);
	Mon, 23 Jun 2025 18:59:41 +0000
Received: from offworld.lan (syn-076-167-199-067.res.spectrum.com [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a316.dreamhost.com (Postfix) with ESMTPSA id 4bQy7J2NP2zHx;
	Mon, 23 Jun 2025 11:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1750705180;
	bh=GjPsF5sy2emdaaRkjNXLkiP8YHqZLz2pLKdl2EM4SdQ=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=XCN9AQD3hqZzSnwdaZRCAiugcOSAqNCXFyncbt0CGmbo3ywJxumcCDb/joeluV+81
	 BSO/kdPLiYCLh38iuEfhMpXPGnUGhpk/h5e6voeYC0MuZQJBD5OQuXpDe8W9BBress
	 0bFZwznHZLGGxlbqaJohG2sk0UsGDAAcZPsdWU9oAWuPrSwRi+5p4F6n3+35UblfER
	 jQ4WSYhEqkz0wUqG1RzAloYMGxhMYaQCOJPWPnvmcW6p/Mmr2tXcluh+0qboU5BGAL
	 zDaTd1bPc56frnOUbDvQWy/RR7XY6CNQgEkFr/eF35nnC3VXtel+BTN0LnmGzLWqOi
	 NvwrrmCvVdJug==
From: Davidlohr Bueso <dave@stgolabs.net>
To: akpm@linux-foundation.org
Cc: mhocko@kernel.org,
	hannes@cmpxchg.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	yosryahmed@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dave@stgolabs.net
Subject: [PATCH -next v2 0/4] mm: per-node proactive reclaim
Date: Mon, 23 Jun 2025 11:58:47 -0700
Message-Id: <20250623185851.830632-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This is a tardy follow up to v1:
https://lore.kernel.org/linux-mm/20240904162740.1043168-1-dave@stgolabs.net/

Changes:
 - Not a change perse, but further discussed with mhocko potential usecases
   to justify upstreaming this interface. Nowadays NUMA represents the common
   abstraction for memory tiering representing devices of various performance
   characteristics. This interface makes a lot of sense given memcg's lack
   of NUMA awareness.
   
 - Consolidate both memcg and per-node flavors into a common helper. (Yosry)

Patch 1 is a small fixlet independent of the rest of the series.
Patches 2-3 make some of the machinery more generic.
Patch 4 adds the sysfs interface (which has further been deemed ok albeit
not following the one value per file "rule").

Please consider for v6.16.

Thanks!

Davidlohr Bueso (4):
  mm/vmscan: respect psi_memstall region in node reclaim
  mm/memcg: make memory.reclaim interface generic
  mm/vmscan: make __node_reclaim() more generic
  mm: introduce per-node proactive reclaim interface

 Documentation/ABI/stable/sysfs-devices-node |   9 +
 drivers/base/node.c                         |   2 +
 include/linux/swap.h                        |  16 ++
 mm/internal.h                               |   2 +
 mm/memcontrol.c                             |  77 +-------
 mm/vmscan.c                                 | 195 +++++++++++++++++---
 6 files changed, 201 insertions(+), 100 deletions(-)

--
2.39.5

