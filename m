Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40265EAF9
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747095797; cv=none; b=R52RBDTcaNFYNm3qh+8Sicp88F4b7mQ1sG4B1CJkNUqiVxvHX/fAf3Ew5Oq/Upu5GSik6Z6LWASsRvVVHoLxtcwuobk4LSXOAiy2LvZncqSwEPACfBdX/NfoMoR7a+YTzArLx5yLGNbJilL57FbAZtW3uQhYaSmcAIZjkmgmnSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747095797; c=relaxed/simple;
	bh=kI3m78lGM+1djy4R0QrIr2nOEjeT3j6mvQQp83gahgs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fM+gaxGW3OY1S/budJzHOY7JaYHz1L357SZUYrdf75W1ngtl36BwU3xtZmosLVRrsPUSeUIW5vLi3OnM+D0fX8d3Y8Mjdo6DbJ0lglforEdqkL6RbR0lMZENduarA4QCTfOqazUNNoaX5CMHiWriHoQxt9slNoZENkJFkSFwArk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YZG50mU6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YZG50mU6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=BckQJn6KgjSbmIYmmRW8nD1yDCuVR5Vm9D6l/XyF3aA=; b=YZG50mU6swwUOmbciBSGk8BtA4
	a5Cgbyj+ErnjVRd6/Umrwo/gDrvBiHRyEPIdHtAFeanT1anlMYmcNfqqY712XR72p1A4yBVt+iw5S
	8YQ3eS1U9R4uXpcJUjcO5f3kRzsVYTwYMTk8dcgDTVKR3Gwy6jN4SZIwfEYEQYLA+Ud9UJuhA8r5Y
	W/ZuXlMMqFX/kthzaoTjMHPPT9x9dKBrmpM8GeQiHU4J3ftgJc3vF4YNrZxVUghaCu8IAZRJAbvAm
	pC7D1k6T6xFbZ9WAMb0r1W0fa1QsmiV8BpTIz7f6gIo4jQAJ2BCGMuZwgc7vHIu2PxlZnoUYt8eI6
	2LhgPnAA==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEdQQ-0000000Az5W-0wjf;
	Tue, 13 May 2025 00:23:14 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH] extcon: Maxim MAX14526: avoid defined but not used warning
Date: Mon, 12 May 2025 17:23:11 -0700
Message-ID: <20250513002313.954908-1-rdunlap@infradead.org>
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
