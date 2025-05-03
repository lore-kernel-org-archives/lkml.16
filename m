Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85F421ADCC
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 12:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746275597; cv=none; b=HrlLsT+7t/RrfZ7J3kDwaFs58JPYYdr2zmD3T9U+f7AcoIKQh4+4L3fx7B7kTXVogigpcCvj3QTHnSeXqcXOTfLGyuLXp4oKaX9Bj0yKUDRxNQby1dscv1E+YVyzj4f26kjRO0u5UsecaTbECj0Um5ryJL1S3h5xdUxzmzThXrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746275597; c=relaxed/simple;
	bh=L7ClMYH5A0ty4sZpYAAeXld01qwZCg4pepzbvqcz8H0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HlU4jPW+seBEA11kKb4WUqHBrqNsohSYMvjM7D7XgsqmdStMZH+rgMkvUd3W52IBEu4UqPxS4JbEhsAKEipC6CFQ2zjRn1oUa33ITzh0rTnBbDA+8ScL/iCHpqPnSq1nMy29KzFfrPv/CnrxdP0VkmdVkfv2l0gS39gFvLtZDCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com; spf=pass smtp.mailfrom=yshyn.com; dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b=D1Vk2BHv; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yshyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b="D1Vk2BHv"
Received: from phoenix.uberspace.de (phoenix.uberspace.de [95.143.172.135])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id B291217F9F4
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:33:07 +0200 (CEST)
Received: (qmail 32620 invoked by uid 988); 3 May 2025 12:33:07 -0000
Authentication-Results: phoenix.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by phoenix.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sat, 03 May 2025 14:33:07 +0200
From: Illia Ostapyshyn <illia@yshyn.com>
To: linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Florian Rommel <mail@florommel.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Brendan Jackman <jackmanb@google.com>,
	Illia Ostapyshyn <illia@yshyn.com>
Subject: [PATCH 0/2] scripts/gdb: Fixes related to lx_per_cpu()
Date: Sat,  3 May 2025 14:32:30 +0200
Message-ID: <20250503123234.2407184-1-illia@yshyn.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-1.876393) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.476393
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=yshyn.com; s=uberspace;
	h=from:to:cc:subject:date;
	bh=L7ClMYH5A0ty4sZpYAAeXld01qwZCg4pepzbvqcz8H0=;
	b=D1Vk2BHvAKRjY/5IHc4WUaLBAciIUNY+rdtYN4ARMdCzsyOvlQ7J3WMi0Ag3n5zvTq2WFpEffp
	xTjba3P32wV+uYrNvN1Jt2DShU1RpVn/WQNOi+u7aWssSCHuRE3sPbJgUdLKLjRS1egBlgc3N0Zg
	MifvWK5ia7REcd7WEI4rSEoGivBTBHbckE347A0Xl68uC1dzQm+pvZTqXav/Cy8ZgeMoCJ04d4iB
	9yU9yF4W1phu8/gPXsCPerEOaFmjog+96W+IzT7suLojs6DRLanq8avePWrdIUvI7QMsM2VQa80/
	XLCD7aFiVnC0sKt9AghVFlYk5wXh7Bv9fpGZWdLQ==

Hi all,

these patches (1) fix kgdb detection on systems featuring a single CPU and
(2) update the documentation to reflect the current usage of lx_per_cpu()
and update an outdated example of its usage.

Illia Ostapyshyn (2):
  scripts/gdb: Fix kgdb probing on single-core systems
  scripts/gdb: Update documentation for lx_per_cpu

 .../debugging/gdb-kernel-debugging.rst        | 34 ++++++++-----------
 .../zh_CN/dev-tools/gdb-kernel-debugging.rst  | 34 ++++++++-----------
 .../zh_TW/dev-tools/gdb-kernel-debugging.rst  | 34 ++++++++-----------
 scripts/gdb/linux/cpus.py                     |  4 +--
 scripts/gdb/linux/utils.py                    |  2 +-
 5 files changed, 48 insertions(+), 60 deletions(-)


base-commit: 95d3481af6dc90fd7175a7643fd108cdcb808ce5
-- 
2.47.2

