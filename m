Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDBA1B4133
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864369; cv=none; b=BzQMLB0JagJEIwBTEpvSAxCGCdZdSCy5iBMYD+cuBhJPGeEyZas2kOtKr/Sz+6bmcHk+i40NJ9TjaV7QRpJru8HUI70x44oZeF0Yq5f3sbHCfLqImyJSuGh+g1bjMU8FMMwEcgd0zyz98StjmqlE3aEXLw/gLdpmZI4Dqb945yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864369; c=relaxed/simple;
	bh=2IUUDDhDZUFWvFP75651zvq5cZZKyQeslhVofDf/ZVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=daTPaXWOI6Zvm5AXJiCfIN9J9mMS0f48Jc2yWJOn7RWAoHFxPNkLPocqS9sDv6vKFQA1pg0oGqjbdfJJa3CybvM8QmKcsbFTE74iey8ertlqpqWtp5aqZwaBl2lGkrwUYwMgSU4DubI/n7JHVKBzvQLlALUJqvTeqn/4Zm8HvLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=fJY3kcjO; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="fJY3kcjO"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl7N09hnzlgTvG;
	Thu,  6 Feb 2025 17:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864363; x=1741456364; bh=UY8Z0
	nvlOd8POJXSF+AjfI7CRiaEU3djgwJ/yxyCzPA=; b=fJY3kcjOb7WR8xLswF1G3
	pdIEfSlMTZOHrvCjZMhKINJvqYVDzBUh+WhilRQRBMOdt8G14mEKay4iPrlOyqO3
	JQcK2UNzd3/0S9X0loAR7Lr4pXHS4WEQGk83ynYMWaBKOSs6IyT5G45l90JryeV+
	FxU1j2lXtvHEGcHgBmGX97Iap6S4p88ivT0ttHRHTeKNxiSUFSfGzDJF0RKFkujw
	JBTsohTHPBvp4V/CVg2DP2HtVfAEf8WUmpAzyJ0faPJpXMsUCY89TISzmJOKvOqz
	/pg72V16enPNPuR9hFiOFyDlchYrknEBLlvB/HCTx3BtmyX6EzjvTBySQ0gRgVz+
	A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id phWl0qrDzq5X; Thu,  6 Feb 2025 17:52:43 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl7D4l7WzlgTxr;
	Thu,  6 Feb 2025 17:52:40 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Frank Crawford <frank@crawford.emu.id.au>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH RFC 29/33] hwmon: (it87) Check the it87_lock() return value
Date: Thu,  6 Feb 2025 09:51:10 -0800
Message-ID: <20250206175114.1974171-30-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Return early in it87_resume() if it87_lock() fails instead of ignoring th=
e
return value of that function. This patch suppresses a Clang thread-safet=
y
warning.

Cc: Frank Crawford <frank@crawford.emu.id.au>
Cc: Guenter Roeck <linux@roeck-us.net>
Fixes: 376e1a937b30 ("hwmon: (it87) Add calls to smbus_enable/smbus_disab=
le as required")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/hwmon/it87.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e233aafa8856..8e3935089fca 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -3593,7 +3593,9 @@ static int it87_resume(struct device *dev)
=20
 	it87_resume_sio(pdev);
=20
-	it87_lock(data);
+	int err =3D it87_lock(data);
+	if (err)
+		return err;
=20
 	it87_check_pwm(dev);
 	it87_check_limit_regs(data);
