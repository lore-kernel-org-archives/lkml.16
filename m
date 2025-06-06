Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D113CF9EC;
	Fri,  6 Jun 2025 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749215364; cv=none; b=pWSaIcSarOr3zT+rTXQvp8uJno6F5RSel1zOYLubRMrKA/vlFBPewslSEuh3ZJFFBuqvX+ercRuYcwBhy9b+1MQV2tefjSTVOp3ZQIF4vyJllUssCOrAvxjdi73ke2Pe67skDAp7j7inJDGrocFOh2IQO2HgXYctm8DXw8E0APM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749215364; c=relaxed/simple;
	bh=p65BgQsXIRell7NjibwP8/nB9rR+PSzRnhPcxgf6bbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DP6gRyRQ5CxAI1h1lLcO/H3bfByW9vXmZR4oQuRx3w0epLCgTqsDH0lBKH15E9w+KLg03HvVo4Qgg6wE4U16crSk4Ltf6Hr6PkfBYJtqdGQ+lFCKr75dG7Ok42d6Hw96Q72gvczEvcCP82r0SWbO+lU2LMgzJaoUB3dl4Gucyzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso2240955e87.2;
        Fri, 06 Jun 2025 06:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749215361; x=1749820161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDIM4cWaSDVmDW7CZCAy47kSfugePR2in3Baxdfjghc=;
        b=I3kp007GoIKy7jJoMzWSIKMTSK2z8IIsaNypqiwRaa3DPnJNpNn/gvbOvJrsfPvK3c
         Of42xFTT+fmKvSM65mJfWFwH0fZxUfyNzD7nFMyT+IubtjUnzU4zR766a46Kff1caIGJ
         pg7Qjq/EhbwyAd4quSQz4OnTcNm4k0csdjNCOIT0tiHgJv3kgN8Ac2mlr7Zb7KGeELV7
         OiCsLj1bzmln304+x/76H4pkUn8TmaoyPPWme+0zg/nTn6LTlvFcjsq5a8BvZgPFHQNS
         puwGeFstElvX9lvbvT6TdpbtwlvCe+Cx9P2iaNcg9ufT1vt6pQZBdlYiAWNteqq+49+7
         PrAg==
X-Forwarded-Encrypted: i=1; AJvYcCUGPeUvV+PIqOC7pa9A3H4hMjj2PHqyqIRp9COiRYFdxXV9txre9XVXjqcEBTW7c2XOjqwJQtwpQCpjwPVU0risGNhS5A==@vger.kernel.org, AJvYcCX5OWx1HzHm/sXD2VmnmIgIOapVbTy5j6pghNfz7+A2RX1kBvtDOX6gQRM0/52sfboFZXIqaZmcPIuLCkA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIc1rmhKJO0mmZTe30wo6MjBXsXJ1kc4Zu3aqqKQWweVG2nDbn
	k2MLu1BTXn46FIJI5rNAqGl9SZ63RZGO3OC8Ny9YRzz9b/tnMUbXNBJv
X-Gm-Gg: ASbGncvy7K7dprzk3FVJDd1RPUlwgVgZnECOWqgw0Rf8MFqGdIwxz0ONOkTnupR8ZNF
	qvKZQjRFmUHOj/JZ2tSCD5pcUuq8p6+H3nBJvkt8cbTwXefNrM2KYvF73z+U+X6HNDHUFODiJu0
	shaMLyPSD/VX7XraJOxNtwEgUeB0TshKsng1djut3H07Jt/y2iw8KmK5d48NrIDbJy6J5A8+mkD
	aF8zs+WnVuQ7mikhO6rpRr2jrY2wBjBMxxP4ZjBKPqOdEoqUMBmvTxUn7jAg9hLW2i2yIYMLSX0
	h4LJTtNsieJMiwb1oblbQn3Tkh/PP6i34MxvZ/n4vvktVD8Rg0qvDNdpVzTANqGV/6eNthJZrg0
	3WC0F0yHn/m7pshQB4TlA4oefyLc=
X-Google-Smtp-Source: AGHT+IGOxCjkdUdURCQroxmFj//+lEKQJxyprwe/KzhvvZnQO0JORgBaWN3NUp/eJgzM2lwmEJUGsw==
X-Received: by 2002:a05:651c:1545:b0:32a:8bb1:d971 with SMTP id 38308e7fff4ca-32adfc290f3mr7905301fa.18.1749215360651;
        Fri, 06 Jun 2025 06:09:20 -0700 (PDT)
Received: from galaxybook.local (82-183-24-76.customers.ownit.se. [82.183.24.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1cad5c8sm1696921fa.72.2025.06.06.06.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:09:19 -0700 (PDT)
From: Joshua Grisham <josh@joshuagrisham.com>
To: ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	platform-driver-x86@vger.kernel.org,
	W_Armin@gmx.de,
	thomas@t-8ch.de,
	kuurtb@gmail.com,
	linux-kernel@vger.kernel.org
Cc: Joshua Grisham <josh@joshuagrisham.com>
Subject: [PATCH] platform/x86: samsung-galaxybook: Add SAM0426
Date: Fri,  6 Jun 2025 15:09:08 +0200
Message-ID: <20250606130909.207047-1-josh@joshuagrisham.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Add device ID SAM0426 (Notebook 9 Pro and similar devices) as reported
and tested by GitHub user "diego-karsa" [1].

[1]: https://github.com/joshuagrisham/samsung-galaxybook-extras/issues/69

Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
---
 drivers/platform/x86/samsung-galaxybook.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 5878a3519..3c13e13d4 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -1403,6 +1403,7 @@ static int galaxybook_probe(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id galaxybook_device_ids[] = {
+	{ "SAM0426" },
 	{ "SAM0427" },
 	{ "SAM0428" },
 	{ "SAM0429" },
-- 
2.45.2

