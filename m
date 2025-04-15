Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6051C1E3761
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707882; cv=none; b=uS+GWIWCM3P96S1Iku9+VnqFQgyjB14VN2zevZa9Nph+WetYiHCz9lvgjFpR4YAOxF//C1AslBNPyVLRIAzaxiCZa3wVD9vXe4+rH3ly6AlWJbsF1RcB1xNPUUPXUJmKr6vEJi/7rqiYckPO01jgcKihHv39NCejowHrUORKkEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707882; c=relaxed/simple;
	bh=5Yr9DFS4YYzbSoj+iCIvNtBnsVN/9nYfDboO9pt0WxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NcC5hGkPkd9bKbhLzgsjm3YyKcNkjLNF3cFR+arxz3iCsrZKnDywgIM04Vnv4/TiyDImevV73gw6A+EIUkfuok4vghtmW0UgmEcwV3bhGT0uT+PgHnTVhB3HysMF9ES7dBBj9447vQ7NjGBr/k9iX6GO1mq5QZy4/jo2VXBCOOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=moqq9Ync; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="moqq9Ync"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744707868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aVSUpFvZNChKWZuSnWMz4EXoGJLNgPtOq6YYndgZ030=;
	b=moqq9Ync1CxOT1OwH3YujG+LHq8YnRTQ6N/4JKBw+h3/yPz8yAM+JhkjPjENQ85hWIipGV
	KvFjpEHfLC7eFiGbw9AJt3HdJDCiqe/BU3PRGDWDWW8QLPoBOqA4fHPzCYF1SDcrwnvs//
	oKUS5eXu0Hh9b4GSz7aXa3TijBzxyDo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] ASoC: cs-amp-lib: Annotate struct cirrus_amp_efi_data with __counted_by()
Date: Tue, 15 Apr 2025 11:03:55 +0200
Message-ID: <20250415090354.92211-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add the __counted_by() compiler attribute to the flexible array member
'data' to improve access bounds-checking via CONFIG_UBSAN_BOUNDS and
CONFIG_FORTIFY_SOURCE.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 include/sound/cs-amp-lib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/cs-amp-lib.h b/include/sound/cs-amp-lib.h
index f481148735e1..5459c221badf 100644
--- a/include/sound/cs-amp-lib.h
+++ b/include/sound/cs-amp-lib.h
@@ -23,7 +23,7 @@ struct cirrus_amp_cal_data {
 struct cirrus_amp_efi_data {
 	u32 size;
 	u32 count;
-	struct cirrus_amp_cal_data data[];
+	struct cirrus_amp_cal_data data[] __counted_by(count);
 } __packed;
 
 /**
-- 
2.49.0

