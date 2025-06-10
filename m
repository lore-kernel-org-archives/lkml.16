Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392C228B40E;
	Tue, 10 Jun 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548104; cv=none; b=fJ/fSa/iFsEf/LppykQYGNkEoizUGTz6QwTRFmBWCv3I/XS8b/8j3LoPrib9mp+B7Lj4en6LH5xJIovTmC59Ah0pZn+u3aZIMyBURfXO6qv65QYC+HarKocDA8dIuR//+kKVQdXQv2ts6/up+w3PBixoJRw1JNC5GwXA4oUhzwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548104; c=relaxed/simple;
	bh=KwvkyRdvnm2DVms8KuUvF52iyPDJ9a5s6ExwCORU0UE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ghyF8zqGeILaOmqWZBu4+i4GRhxacsp2SpftHh1dD68aKpRU4HHwxCO9M3W28XWfz8hRAUiQ32FYDie6UykP+tPhNOPAU8hptO92ajLYGt8Gv6bjAR9CpW8comRNZ9xreutDhLykYoVe8I853oevUVBFR6mEqiwXQIuMQ1PMTbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I66nB1G9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I66nB1G9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F420AC4CEED;
	Tue, 10 Jun 2025 09:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749548103;
	bh=KwvkyRdvnm2DVms8KuUvF52iyPDJ9a5s6ExwCORU0UE=;
	h=From:To:Cc:Subject:Date:From;
	b=I66nB1G9vi+EsYH2ridngs9n8k/6Vg9CJoY0E0wEoWpycnkEV7XOUoPeFPx8WjGmf
	 7E7+GgpA/iYTkZ6iWqL81HxXn0iSmrve+sPr1gMgxRWzpZ9A+RjOU6kWpfSkTeA/rx
	 7m/+yfi5eMd9Ps/UY+rVcwqjSgJ0yklsnNrsCIN84qwprcBS/4My3DvhqxYeehhRo3
	 8ueOdF5TJsO8bQ/oIdCJhCODAiGf39yE4AtEPmu+MmS0+QQ+MNODJ4hU9yJpIwCkzX
	 ZkgyPT7Y4aQORgWQWDAPVb4opm3/SyvTGC1KGE5UsJmFRT8ZWXKi0ZgbSAPYY/QNBE
	 wP+bsOJWxf1jQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/intel-uncore-freq: avoid non-literal format string
Date: Tue, 10 Jun 2025 11:34:55 +0200
Message-Id: <20250610093459.2646337-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Using a string variable in place of a format string causes a W=1 build warning:

drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c:61:40: error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
   61 |                 length += sysfs_emit_at(buf, length, agent_name[agent]);
      |                                                      ^~~~~~~~~~~~~~~~~

Use the safer "%s" format string to print it instead.

Fixes: b98fa870fce2 ("platform/x86/intel-uncore-freq: Add attributes to show agent types")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../x86/intel/uncore-frequency/uncore-frequency-common.c        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index 0f8aea18275b..65897fae17df 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -58,7 +58,7 @@ static ssize_t show_agent_types(struct kobject *kobj, struct kobj_attribute *att
 		if (length)
 			length += sysfs_emit_at(buf, length, " ");
 
-		length += sysfs_emit_at(buf, length, agent_name[agent]);
+		length += sysfs_emit_at(buf, length, "%s", agent_name[agent]);
 	}
 
 	length += sysfs_emit_at(buf, length, "\n");
-- 
2.39.5

