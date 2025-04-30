Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D7C1913B2A4;
	Wed, 30 Apr 2025 03:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745983666; cv=none; b=OAKqzzzadGzBgcBdUbXn//Y3j9F17CZWcdt/qWJei+QxW9Jw2q5zH0C85vepio4gtr6suSRdaFzsqEgLBvNL9e3nBIwEpDR4cB8GlbXKrscooa1DHvtoOkQ6Bc+iAOq+LmCH/gO6N+u9DNGweQATcYZWIkMRPG5UjhBgyFayRfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745983666; c=relaxed/simple;
	bh=rK/vyMj1pGJnHRMWWXareljKHaMXSwo1wcFJufulN5k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O7imruCbRLqGTJQCZqbpZQ+bWf6PMhjwhnPYY/esD3gifPJ1VKcI58I1MdBA0cMCicStP2bOIRUtUbgZdxZpftSkgPwLKIluA5lfjwSBtKNe0t6Ux5DGWjypvT1Ga8dpKPcNAqau4lqq0zago0kKPVFehZVoGzT83jXHvSrQoFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from longsh.shanghai.nfschina.local (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 07C9A6018852B;
	Wed, 30 Apr 2025 11:27:37 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jstultz@google.com,
	tglx@linutronix.de,
	sboyd@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	eahariha@linux.microsoft.com,
	luiz.von.dentz@intel.com,
	anna-maria@linutronix.de,
	ojeda@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v3 0/3] time: some cleanup for jiffies and alarmtimer 
Date: Wed, 30 Apr 2025 11:27:31 +0800
Message-Id: <20250430032734.2079290-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some small cleanup for jiffies.c and alarmtimer.c.
Compile test only.

v3:
 - add a WARN_ON_ONCE in patch 2.

v2:
 - remove some guard() useages in patch 3.
 - https://lore.kernel.org/all/20250427113529.1473800-1-suhui@nfschina.com/

v1:
 - https://lore.kernel.org/all/20250424144819.24884-1-suhui@nfschina.com/


Su Hui (3):
  time/jiffies: change register_refined_jiffies() to void __init
  alarmtimer: remove dead return value in clock2alarm()
  alarmtimer: switch some spin_{lock,unlock}_irqsave() to guard()

 include/linux/jiffies.h  |  2 +-
 kernel/time/alarmtimer.c | 62 +++++++++++++++++-----------------------
 kernel/time/jiffies.c    |  5 +---
 3 files changed, 28 insertions(+), 41 deletions(-)

-- 
2.30.2

