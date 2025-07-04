Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD0E20C00B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625481; cv=none; b=ewZQ2mtoq253iN9FI9teHTO8AMud7LO7uRP0pEKhoiucN7ARNGo8Gu7KRbCMQ18JeSYPfxqGzeh++eyczkOq+mpZQ6UmVEZZR4iEQ8u+KKTlk7v2z20VP0Qm+OGn0V0Zfwhryyx3yP7JOivdxMVHZpLg76CsscRJVpEChPyli3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625481; c=relaxed/simple;
	bh=R61rp45Losycq8UAnzdMkZ9UbrztK6ZBfROjKO/3BnM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=upQMS2qSXJEGTPTm19/WCePIANICw9Os+EAaDjBael6tcya5gvSgvhBKZFSA/1nSrLAaLAe2fghUJbOJIkjeaJ49Av5ChflgrwlzzZ5dYoerNs89Z+rFQ+CHFxgpzgSkwQds0j6UdaUiwga4+B8ztHoW+KmpZXjo47uxXY8wBMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bufaLox4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bufaLox4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d6ade159so6622425e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751625478; x=1752230278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RU8fatJd1cv2n5jtAJadSkr7OYYXJbPJFcsa+TWXM6M=;
        b=bufaLox4mNtFs5mAZLmF1H/sk+Wx4TLbrnRhwGqJd1ovivYFFAhYUmXmyVjTKKjTDH
         HYFBch2DKFTu2WH7YO7Jkef/XGwffwU8PA5Tih/y5IAuO0P5uDBXJyGscXXW6HeD64fn
         ESwPk0XXBKQ6L83dj0FK+EzWIhJC/Ea1nLHCfknyJ8LveDB4iYgzlbDhafM+PNuaSfoL
         zvoDXURZqwr/Jsmi9twpVxKAETsfmLh0zkfEiGB3MWZ7VIVu4T1u6HZgb3/VjdpKez5G
         o+xv7QNKR5itubm9rlPE50incRk93SW93si2Hwux8aK+m95KKWDHNLvCxYtpYsVB5Eay
         b2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751625478; x=1752230278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RU8fatJd1cv2n5jtAJadSkr7OYYXJbPJFcsa+TWXM6M=;
        b=FA6HRki39YaaY3m5vBxBAn5YVvuK9s8nxJuut9ZihUBOQ4nso6yYqQ7LfmT8gLJp9R
         1OMj9xCcpqvD2U1WOv97n0pz0fEXtRBj3D+e62Gs7r8Qtt5A4bs0pM5MvbAI+nv/0aXN
         pQxcl6CvlfIDjyc65y9LFmK2MDepNmaFtkEbIPBgZVk0rbvbkhz6iKTZcCs51QiWrF3C
         DOnuOLH1OlDI1XrtehTKdw1efFpCE826XOiCjSO52FMT60O4Jd6cxgWaUQVO06wR/For
         HCQfMPQc7dveXHcJPTzlYu4UceDZY7T0KjwV6yyHy3d4CQgCZUj3a5WNmOkbMIvX/UXu
         V6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVVB7KNIFNMrGxeo2lxlACzum8ZKkYdVSQL4wvUnEWCdENABChQDeYwbWtbsC9NPjSgtezl6OeR1DrL0f0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGRn4yy3jG0lM7khfPRUlUna69k/bEo+n+uSQdG22VrqUec5KY
	ndd8c7APhO+zy0Q7ppby5+no1j5VKgoPwHZudj5H4nLBupekGyT/7/9PrUPlu2oi/DqAeZTSiqF
	mh28f
X-Gm-Gg: ASbGncvfZAAFVylDN+ZjvZoaISuY48UFrountNKQEr4vKP+NMExKtmiW4BCRWhXT+2a
	F1rLfLC0nDP3E9xmYAS4/n0jGFXFmxNMfOcxPTkLXOXv0D1yWtc1v6nMGPBN9+EXtN9P68cJ1ud
	aFY2QWFja/iIOQkHJL4nZh5MmdUA+cKY3qHIknqDaIgrWQVJkXZzbq/RJxOzPMLtG5Mqt20QIMc
	VptJR1gHNh1nuPBA2r1iA9Lwacf65NGdXtr5kZtPY+YugFv4yr+Wc0qqny2xiP0zSApaWF5KgIS
	w8afBZQGZd9Bn39pGZver2NClEQlNMu/BmbmOR73DXao8entGBPzx84eFyVpS3/Zw+8sdZr1m2X
	GK1qzLAzxy4UFhgDf5SxmRhYOnXzuGoSigBmOny+vkLS3qn1M6EXZ2n3p5rVZ4KbZGCG0/6U=
X-Google-Smtp-Source: AGHT+IGhNXKIGZoogvnG+XHZowEEyeBRsxNYAJfEhbfMb8zexJp6A1Fk4F4oOcLnx7xw+eCnIsD0Yw==
X-Received: by 2002:a5d:5f92:0:b0:3a4:d0ed:257b with SMTP id ffacd0b85a97d-3b497020597mr1215816f8f.22.1751625478006;
        Fri, 04 Jul 2025 03:37:58 -0700 (PDT)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-166353-cust693.vm26.cable.virginm.net. [82.35.130.182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030ba77sm2187132f8f.17.2025.07.04.03.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 03:37:57 -0700 (PDT)
From: Terry Tritton <terry.tritton@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Shuah Khan <shuah@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Cc: ttritton@google.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Terry Tritton <terry.tritton@linaro.org>
Subject: [PATCH v2] selftests/futex: Add futex_numa to .gitignore
Date: Fri,  4 Jul 2025 11:37:49 +0100
Message-Id: <20250704103749.10341-1-terry.tritton@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

futex_numa was never added to the .gitignore file.
Add it.

Fixes: 9140f57c1c13 ("futex,selftests: Add another FUTEX2_NUMA selftest")
Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
---
Changes in v2:
- Add Fixes tag

 tools/testing/selftests/futex/functional/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/futex/functional/.gitignore b/tools/testing/selftests/futex/functional/.gitignore
index 7b24ae89594a..776ad658f75e 100644
--- a/tools/testing/selftests/futex/functional/.gitignore
+++ b/tools/testing/selftests/futex/functional/.gitignore
@@ -11,3 +11,4 @@ futex_wait_timeout
 futex_wait_uninitialized_heap
 futex_wait_wouldblock
 futex_waitv
+futex_numa
-- 
2.39.5

