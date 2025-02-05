Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380D128399
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 06:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738735504; cv=none; b=IiXymNeERf/HwhW+tJpjD3X1yh+FuTQ51PBvc9VNYQOIaRstE7kAyo2SuOJou1JkrXdaeQAPGzEpNylnJH77RheRyQHtrDSK15SP1S8uy1HM/WfgWgAhSEdXLdkg44jJ8VA/eup5yqJhqFNY3eawWmhksJC9zxKPDfGA60SakI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738735504; c=relaxed/simple;
	bh=K8t/Bi/xdRTnV7j0xo4vvXO4yl8MGlCarSMvWlJNsms=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ktXTKbvkqNqzJK/7N63x/Sd5JTwDzda2C0JzX03tohNpHNRbeRBDmytyvQXW29TheOT1FQs6CLsQZg759Oleb39WfZUY5sRUmfnAXRWQWnYLCSjHXk9Hlueo53ckNvV4XFPSquj5VrQbCf2lcbINdZtKvWPY57CzgtWswqicUeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=f3PX/jfU; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="f3PX/jfU"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738735498; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=vaQ+BH4un1QP1DmBRbq9oWCw/Iuzop4bfkkD+TXlsi4=;
	b=f3PX/jfUd8OVQeNtZLvZWM/7HpBeg123O3SJMItzHw2n8JtYVP0HSCHbPkuEKCZhVsJMlETQ7zfnqNrwmJx+w3pUSBB7LcStxelT/HI+UFtm+id67dBGdIGRARrk9nzAjAHu7rmhyc57OuLa+ylKpx4ppJo6Sj2NNYzuE3D+3Ow=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WOnW5fd_1738735497 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 05 Feb 2025 14:04:58 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH] mailmap: add entry for Feng Tang
Date: Wed,  5 Feb 2025 14:04:57 +0800
Message-Id: <20250205060457.53667-1-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Map my old business email to personal email.

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 48de71154296..7dec55c34795 100644
--- a/.mailmap
+++ b/.mailmap
@@ -213,6 +213,7 @@ Fangrui Song <i@maskray.me> <maskray@google.com>
 Felipe W Damasio <felipewd@terra.com.br>
 Felix Kuhling <fxkuehl@gmx.de>
 Felix Moeller <felix@derklecks.de>
+Feng Tang <feng.79.tang@gmail.com> <feng.tang@intel.com>
 Fenglin Wu <quic_fenglinw@quicinc.com> <fenglinw@codeaurora.org>
 Filipe Lautert <filipe@icewall.org>
 Finn Thain <fthain@linux-m68k.org> <fthain@telegraphics.com.au>
-- 
2.39.5 (Apple Git-154)

