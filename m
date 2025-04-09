Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088F25E80B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201467; cv=none; b=aR1PtogwjpG9oMiOAA+i2Yahwj/5FKtUZklydBLwNXXheJLdA18aIsM8/PDITjIezUKTxc/fqnM08euM5EOK3k2K6W6iryE1ga8MvTDSGJeXyCiaR0u5xGerUQRMb2nCYSWhgWllKpIDLa3JXfdlSaGhrQOaxnuKyujurox8qQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201467; c=relaxed/simple;
	bh=N7cXk0xwkxHLyp46KrkCrfl8x3DEFXzKxkNNdsktsZo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X4qMdNwuKulFmwOsuWI+8dd1nWB/FKkGKfE5kA1bLgElmKDE/pboIyYSVd659iuE3AP47O/c/FoL4A7irvZ/pKMeOdqMgg5GrlOfVUDcoPJIlCuxQEsDUWc4wqpGG7ICoUO1tl8Y8d8+5nFk7A4438q/hkrowy6EnFPfqtXxwfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VhTgHZL2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VhTgHZL2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E9AC4CEE3;
	Wed,  9 Apr 2025 12:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201466;
	bh=N7cXk0xwkxHLyp46KrkCrfl8x3DEFXzKxkNNdsktsZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VhTgHZL2BssrGT5lcLZKtchZa4GE09gc773hganK+mvE1vzwW3lWp9o563qxZIO5+
	 F0+OZ4Jrol/z4Xm4Jn1QCJmllUbuTILu7eEYLwPwLdcV56InQor+o/xF+v4MBFMLX3
	 ipjXodXHLQCj/uRh0aq0gaLJZ6Sn5dDknDaj8ePMGg0+u1NgERoABShtP2rnVdf9fl
	 vkP80P8lu7txlefynC3+3+39E1UlK1TbOhihc/4QNno+kKU+kz15uaPIkiVKAdUtrf
	 evBB+V+c6fK6of2WDgXV+hL/RC5lEEEoad5YUocd5KwTPmnJC3Dd5zDkEyQnan7jOb
	 Oq70sGDBiuj8Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jiri Kosina <jkosina@suse.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] [RESEND 2] apm-emulation: hide an unused variable
Date: Wed,  9 Apr 2025 14:23:01 +0200
Message-Id: <20250409122314.2848028-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The driver_version variable is only used inside of an #ifdef block, which
leads to a W=1 warning:

drivers/char/apm-emulation.c:144:19: error: 'driver_version' defined but not used [-Werror=unused-const-variable=]

Move this into the function using it.

Fixes: 7726942fb15e ("[APM] Add shared version of APM emulation")
Acked-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
Found while looking through my patch backlog, still applies
---
 drivers/char/apm-emulation.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/char/apm-emulation.c b/drivers/char/apm-emulation.c
index e795390b070f..53ce352f7197 100644
--- a/drivers/char/apm-emulation.c
+++ b/drivers/char/apm-emulation.c
@@ -141,9 +141,6 @@ static struct apm_queue kapmd_queue;
 
 static DEFINE_MUTEX(state_lock);
 
-static const char driver_version[] = "1.13";	/* no spaces */
-
-
 
 /*
  * Compatibility cruft until the IPAQ people move over to the new
@@ -435,6 +432,8 @@ static struct miscdevice apm_device = {
  */
 static int proc_apm_show(struct seq_file *m, void *v)
 {
+	static const char driver_version[] = "1.13";	/* no spaces */
+
 	struct apm_power_info info;
 	char *units;
 
-- 
2.39.5

