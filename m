Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783EF21C9ED
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 19:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749496413; cv=none; b=LgDGaBrMdudswk7EprAdwAKN7XX3+9dw89/8DcxTCzI7S0tO4I+PWRL1ZyK68aKjpc59xw8Fanu8abyOUoAB5Vy+cMpHTNOBnNWWlDmjPQWMguk0hFV+qVUAT0QY2YbUcLCYgWtVQ6DXtXMxcu86OhkzPUkGr3cRBj+o7Wv+cpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749496413; c=relaxed/simple;
	bh=RH1moK8rgMoBpS61eJ1qLMUWxGsWt7u8Eenot99hHYg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O03wwc4JL4U5JSVRJHvbAfCYyIrTk31DZMCfDABdj0aPLF9cz23yJzGOw5irmcEGeSUUD0cQdJGIx2tFHGpse3MxWVK2HPdgNKJUANeob+gywcSIfLKPzCclrhbfUzVA3qHa+lERzZP7hV6fSVZCReOthV2bB8y2MZuRU3vkxaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zceVzWVW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zceVzWVW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2440025f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749496410; x=1750101210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5oMpxxju5fqwiILJnsmlBVD5PQ4lHkNcFxE2f/RbQAQ=;
        b=zceVzWVWE4XFWr9Nltt2wzjw09JHvukflD4JFSwbHR3CYy6WFgGd9BxnBMaLydaWwD
         +JiNs0EP98tWwRAEABX/2nrmuJT6OkAqaf6qGFCQr/4gCrvqlz6icQXGhXT19pFGXPnI
         1kDasAphI11xnLDQ1I3q8iGCWzuP2s0m3J2fVS9k9Pp6BJ1HOsvMqpNsDUK15G39z7YO
         rYygMjPDlxPVOBgAzWB4hUMKmpzJPImyBr/4odpIZTlHCXj/uKlEEmjT9oC9n9NH0GDG
         yTiQLJtCRk+CJB+DNSoohxItcIkiGMroep+6M7RxB4iTKyDlvoyLU+o809LFlgDMBrW0
         +TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749496410; x=1750101210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oMpxxju5fqwiILJnsmlBVD5PQ4lHkNcFxE2f/RbQAQ=;
        b=mQHTukgEU1nnh/lCqSB5ddypSDJYGlylDx6vsRixhPcV9Bcsdjo+uwVMQwUX7/yfGE
         8/9Vc4ajLr3tZcL2R3WsQwWYkxwqaPg3fWjvC2LRRPIket2fLrrETb/sVgj1SQ0WLqH4
         P1rgag6GCD1887ZczKlvNX7Otg96/9fiOWW7YX40AIHvkKlWisf7L+Dqq+R5D4iPfMT+
         cC2rv+QpeKk1M/K0/sDaGbXHnTnv5fX7mltKiiA7lRJQS+3cyOuYXQ6g2E+avfb7JlEt
         h+tQK1tJNluWvjnZWWc5REIG7zV78+etFfkystALALuXpk+/U9o9uEz4zZB14IsmCeIl
         QupA==
X-Forwarded-Encrypted: i=1; AJvYcCUa3EP2Z8kewBlZFXejTkUqqQx6O32umSBaImQklUbZBB6wuKdzkF2oNcFWPz4fIWIJNdqWJj118jf9xMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznt/jC+rlgKq5Y7jUHrQMOgbifxuERwQKZuRjsxgpRSOT3nzhb
	NvnrhPL3kj+ffCeaqJprNAcVqOiy7lUFFkxVx7oKkCgSeXLucdHc2hanImF3DD534GU=
X-Gm-Gg: ASbGncuaEcMYIZHHb5csQpcKO7J4bceJtVXMrzBly9F0CW1kd8jrKieUAkjEyBA7w0K
	HtA46xLRIW0PPuUV/yO53NGN6KtFELPkKZBU0Yo4BB4cxixHnuFSxVIyZ1B9uUgq5oZROSViGcE
	adsS67e1Jod17UxJ0yBjoe8FBDtveJBHoEWuhcTiEJ4s9xfybNiajRfOVctIMVpncZvWl2KngnE
	APKBfhrnY6KOFfvaBj2K8NYJZ0+wcoQk2wnVb7SFgSkooO8TimiVHJMfBl1nlVo29XKCI2ijoMx
	DGH43uhhP5IYMIIDfYT+FviFrFf20mxGSfy2sMiaFOpaEENAbPMMfw3+32IepyLgXMxLbXREwpN
	eQDtHjeOw9xONYthS2bWLDkWwDCK/66iVMRHcMEGAMLOJlQ3KJkU+1UoNF7vmL3eDHoYGdDs=
X-Google-Smtp-Source: AGHT+IHa9LIxtooL5yOEEicTnKzc6G5QUyWFM9R6pj9cNKP1kvLuERjpBxUX1XqsC1CguSfVa3zGJQ==
X-Received: by 2002:a05:6000:2004:b0:3a4:fc75:d017 with SMTP id ffacd0b85a97d-3a53188da32mr11342117f8f.26.1749496409749;
        Mon, 09 Jun 2025 12:13:29 -0700 (PDT)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-166353-cust693.vm26.cable.virginm.net. [82.35.130.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e163447sm115089115e9.17.2025.06.09.12.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 12:13:29 -0700 (PDT)
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
Subject: [PATCH] selftests/futex: Add futex_numa to .gitignore
Date: Mon,  9 Jun 2025 20:09:27 +0100
Message-Id: <20250609190927.89655-1-terry.tritton@linaro.org>
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

Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
---
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

