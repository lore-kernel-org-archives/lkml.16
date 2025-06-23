Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C275A22FDFF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668663; cv=none; b=MKXEW6GCiYVtZlZ1Ndnam6Y/dbDVp/QG/Xe8dYSZt+9Cas/4hcArTuKZeByT/qy+IMeh3yYNB0crI4/JytzPKdDHVLqQwV1yQZGPXhPpJlwy4YS2wLwI9fvpv936uZ3TI5Q+//eal8wxd1TMOi0koyWNV+sp9GY394G7QJX35aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668663; c=relaxed/simple;
	bh=CvGjOzlctTl3q9G9haHNMpflDsOOCMomL21LTmJT0B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HEEd9xxw7oWUOyuciR1h8M2lrpW/KJQ5ildcDPw07guOXikU9Mpjpqvsno1ajo8ew2dSRr7seCvxJkkW5mLzkxAaPxkCdWzuPU04TSpVMkRdqRMDO1hiYZZ+fMdYAj19BdlUJS8+rqJ1wexnm4jR7HE/8VjVM3FmcZOyAF4m964=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1t0Xniu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1t0Xniu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80316C4CEF1;
	Mon, 23 Jun 2025 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750668663;
	bh=CvGjOzlctTl3q9G9haHNMpflDsOOCMomL21LTmJT0B8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u1t0XniujzNrSUJ0VxTziCijKv1Cplahnc6RJMnRzDUvqzeqD10DHVd4kG0O6A4Lw
	 U95odJAcCSPuAVtS2L+cnsaOLnS/MnrA97kkfTFZi1bHhCwRjNBoSyz1uvTAExhenx
	 2jhpLDqi3AO7kGzkCnKj1Sgkg6AvsbWLxmauvoZAyTHN143sElzL5aE+CO5JuvlA/Q
	 AddwP3G1Q6ZOeBPXqheMhr8bokX7VH6zh1hwZ/5eBZku33S0j6dZd9gN2nVF6EPKMQ
	 NvfHfbKTHKzFfD/PaXfK6IgMSF8235hJSutfLa1N3SV6/YqggGfXaEesM3tIvKSW4+
	 sYO6gMJCRtd3g==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] mei: vsc: Don't call vsc_tp_reset() a second time on shutdown
Date: Mon, 23 Jun 2025 10:50:45 +0200
Message-ID: <20250623085052.12347-4-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623085052.12347-1-hansg@kernel.org>
References: <20250623085052.12347-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that mei_vsc_hw_reset() no longer re-inits the VSC when called from
mei_stop(), vsc_tp_shutdown() unregistering the platform-device, which
runs mei_stop() is sufficient to put the VSC in a clean state.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/misc/mei/vsc-tp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
index 99a55451e1fc..4a262e2117e4 100644
--- a/drivers/misc/mei/vsc-tp.c
+++ b/drivers/misc/mei/vsc-tp.c
@@ -547,8 +547,6 @@ static void vsc_tp_shutdown(struct spi_device *spi)
 
 	mutex_destroy(&tp->mutex);
 
-	vsc_tp_reset(tp);
-
 	free_irq(spi->irq, tp);
 }
 
-- 
2.49.0

