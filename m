Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CFD53365
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747170176; cv=none; b=eaYwIffIEDHgr0jXygKPV8difjW3okGLyjQryglUcUGD9K/MFrnCh0qIa4rYCTvha3v7KiH73Z9STX6y3ynOvC6xHGfPrGGHEH3CmCKh5Qb0zU0nTPQ1WuMz6RRIDgO0gAXy6TWtBjgVpoAda5fdxzm0Kyzctea6I5F2P3GKRI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747170176; c=relaxed/simple;
	bh=ED7+COgzTXnJsGrfsJtJPCi+qW9XMSNnT7xPk4DVVVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aQOURKu1pvQNTmh7IyxPu6ZQIfkLN2GtyAnWrxNQj5zfXYDJyn3KcIIBHJqsQAwOxMPknrDYh8KJPfcS6+IjWjkYLx8ZS1D6Z6grc9tllacnqoLwlYQ7zaZjP1LvjRG1BUO8e6xQT2cqrVGarE6elyXvqtUMUzqUrdXk+0zmMuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vI9LgQUy; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vI9LgQUy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=okv6ynqJG7EPRvjZaJ205O8NFcWItwguZKct8I8T8Oo=; b=vI9LgQUyGcH1f98zrizsn3Wzt1
	kGh7nHUVrGBcCxQwgmvgekE9M6lyuvExhkw4SdUAZAeYcurwrzMH2gecQGgSJBX2m1C8RNJ8p/PvA
	OhDof6GlSUv4rzzlOASUs3vq6zi3JPpmqot6bRcyDQnQDjkR6d1qQBW46LSC/5uTz+oEsdl4/mGfl
	UraSNFkv07OpLpts1whmN7brMfIv3nfLCZsnMKBOH+NJaiXhDwxwHrKORAFAUrgV1Wku/Ol6dhxYy
	ug2R8z0DcBE4yQ92Y5CO/vKc+EWnXOSoYdfe1iKI+L6B+NXu9WxQGwu05UZrJgvL4hHobXZpNqs9D
	Pyp0u6Pg==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEwm5-0000000DXJO-1Rqw;
	Tue, 13 May 2025 21:02:53 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH v2] extcon: max14526: avoid defined but not used warning
Date: Tue, 13 May 2025 14:02:51 -0700
Message-ID: <20250513210252.1139749-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

SIMPLE_PM_DEV_OPS() is deprecated according to <linux/pm.h>.
Use DEFINE_SIMPLE_PM_DEV_OPS() instead. This avoids a build warning
when CONFIG_PM is not enabled:

drivers/extcon/extcon-max14526.c:265:12: warning: ‘max14526_resume’ defined but not used [-Wunused-function]
  265 | static int max14526_resume(struct device *dev)

Fixes: c2aeb8647e53 ("extcon: Add basic support for Maxim MAX14526 MUIC")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
---
v2: adjust patch subject to be consistent with other extcon patches

 drivers/extcon/extcon-max14526.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20250512.orig/drivers/extcon/extcon-max14526.c
+++ linux-next-20250512/drivers/extcon/extcon-max14526.c
@@ -272,7 +272,7 @@ static int max14526_resume(struct device
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(max14526_pm_ops, NULL, max14526_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(max14526_pm_ops, NULL, max14526_resume);
 
 static const struct of_device_id max14526_match[] = {
 	{ .compatible = "maxim,max14526" },
