Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786ED266565
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750413781; cv=none; b=GsLO8NQInnH3KbbKnL+Ry+Tnmw32bg8eNSB0Jhzs2gqYGIw3+5RwA5qAga+/nhIwnDB8zw8edYnwkxauYqi2RuNZwVmLzai1XKo234kbDn0YRTDysDBpyN7TBHn7CBbUc8rJyumIo9tBfkcO1NTORmcDa2z9J9smvNpwn7BX3Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750413781; c=relaxed/simple;
	bh=LWy5T9v0tyi8lKgGUC03bCXmb9Fhi1KsaqZxbrTowHA=;
	h=From:To:Cc:Subject:Date:Message-Id; b=FneNw8xKpienEEm2xd6oLMYGmq4/KLc+xnIUeVIZ3xAQndX5jA1zLBAs5JCkeFLXIOyUauwsuK4PhvTOCC/HKiWZLhHugrgZnv+oS0ynxlivlop6vpuoIFLcHvuw4EKRxTBISPIGSG2W/lllEWNjzfBHJCdO5bxSG2ByoFtwYd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55KA2vZK009923;
	Fri, 20 Jun 2025 12:02:57 +0200
From: Willy Tarreau <w@1wt.eu>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH 0/4] tools/nolibc: assorted fixes and small updates
Date: Fri, 20 Jun 2025 12:02:47 +0200
Message-Id: <20250620100251.9877-1-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Trying to port a program to nolibc triggered a few trivial errors that
are worth being addressed:
  - inttypes.h is missing, while being generally recommended over stdint.h
    for being more portable. Here we add it, which simply includes stdint.h.

  - sys/select.h is supposed to be where struct fd_set and FD_CLR() etc
    are defined. Till now it was still in types.h. Let's create the file
    and move these definitions there.

  - memchr() was still missing, thus a trivial one was added.

Finally the help message from "make help" reported an inaccurate
installation path, omitting the dependency on $OUTPUT. This was
fixed as well.

Willy Tarreau (4):
  tools/nolibc: fix misleading help message regarding installation path
  tools/nolibc: add the more portable inttypes.h
  tools/nolibc: move FD_* definitions to sys/select.h
  tools/nolibc: add missing memchr() to string.h

 tools/include/nolibc/Makefile                |  4 +-
 tools/include/nolibc/inttypes.h              |  8 +++
 tools/include/nolibc/string.h                | 15 ++++++
 tools/include/nolibc/sys/select.h            | 56 ++++++++++++++++++++
 tools/include/nolibc/types.h                 | 48 +----------------
 tools/testing/selftests/nolibc/nolibc-test.c |  2 +
 6 files changed, 85 insertions(+), 48 deletions(-)
 create mode 100644 tools/include/nolibc/inttypes.h
 create mode 100644 tools/include/nolibc/sys/select.h

-- 
2.17.5

