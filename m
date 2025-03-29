Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40330801
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 00:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743206631; cv=none; b=bBYr2jFHcRlZc4MRxMaKfYXAL08EqTwtppX2Z6sSn4Hc10FWL17/tFeWASJbpSufl00aWKP+uPWNzGjZ5Fj5TO37iPWotxj6VM402wff5opseKGxyp1fDrKv1SgzPCZ2d+A49HRCdlM3X1y6bEEn41XW7+yeyLsIOmAzGWT7bqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743206631; c=relaxed/simple;
	bh=fIVZQd3GTQn8c3H2yxUcuv35aYVzYmUAczMT90tM7+E=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KFRda70Xa8F1RT6UR54R0U/FhKiVKJQ48UKZVmwPPBXslyC7a+L2asu20UJQlqP/V4+CDZcrNKkUdHMsHWjkschW4INRcbNyuqlx8g53uOE6CoB26rxkoLUuQsTPYaOzHT5Fvj0WLH9w6O1M32muRsdHlYjx9FgDcawqBD3Cv5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pcc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pUNvFFRD; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pcc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pUNvFFRD"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22651aca434so50387045ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 17:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743206629; x=1743811429; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T16tHjdcydDyfcQnO+rO78FihM7DOnKeDErtF6szV0c=;
        b=pUNvFFRDxksRW1HMD47izGIosTI8awE7rlxPaEbJo6dN8bhIhPQLG6Ww5U1YOJSAwr
         JYST1KWiqcggcTtpE9MKIIYoIj0eoFg+Gv4zce0axjS6WHX/FDJ4E93W9uQhv2JUYowa
         0NVMjfpUSLP1q9KjGJ8KVRbzlq6NqTdeKIdX6KnVTKBvC0xn+ZCA5D7ru5UFNdkX22HW
         CHTUHkAyM2t/c9JVzVYsOC+QshYzRNgsxfKLKmYwzWtDC1YVLT6cHMyOUS2kNSKzkO99
         1Jkryt/Z17QC/ZdqAA+60oJvVDzz0uBaGsHvCThmm/fi5XBDfxA7ibt2LSyBQVYIZOFE
         jRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743206629; x=1743811429;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T16tHjdcydDyfcQnO+rO78FihM7DOnKeDErtF6szV0c=;
        b=bERo5lMSggUcJOuqDqmPRRGiCz7bX2RJiCWeq69hbJtWQufhHDoODtbaN7mpxRmBfW
         YvVDfQyM05a/L6cJJPWlLLt/nK3v9kyqkWje3BaHf5iggX/3mwbBjJKsT28HKQHv6NKz
         iMaRSMCpjobWI9CT6x4iSP3PfPFv9aGX0rY+qYToYp6DlVwP//XNms8ya9iHJ13cNWLt
         gZrLDz2/rfl5AEA78aV2210BSgMbPs2qBzBNN1L4OeEttDbV7jWfkGhESueZFxx/C2xt
         ZYK6KSikHYOjO8JamntG/9GWrBt6SJ0eRekPevS2m12oEs6Yd8BE+ursNt67sC60BzWW
         d9+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVk+ZWdeyTMf6Gk4RajP5pWKqwme50CSNWmc5wLJbRZFOZlScilYs+vd0pKK36gkVUJTuCUugDRMy1xnsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHrTzjquUALzIpX+buA4Mz0q2A8BUnXO2c/Q51e/Bg4K8TP8bK
	mHl6VOTcXUvMZx/NASb42O8Gqc1dFOI9Dmk7WjXqtZBtn3K4ogNXDp88HpSpwpxfPg==
X-Google-Smtp-Source: AGHT+IFXbp95YRShZyWDHTfWt39VhfR88gtKILTuI2qmMg5tUTqt0nYA/ekMozYHGJNsTbYe2UjU9BY=
X-Received: from pgac16.prod.google.com ([2002:a05:6a02:2950:b0:af2:37c4:2ad])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9e4a:b0:1f5:862b:a583
 with SMTP id adf61e73a8af0-2009f78553bmr2229842637.34.1743206629156; Fri, 28
 Mar 2025 17:03:49 -0700 (PDT)
Date: Fri, 28 Mar 2025 17:03:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250329000338.1031289-1-pcc@google.com>
Subject: [PATCH v4 0/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
From: Peter Collingbourne <pcc@google.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Peter Collingbourne <pcc@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

This series fixes an issue where strscpy() would sometimes trigger
a false positive KASAN report with MTE.

v4:
- clarify commit message
- improve comment

v3:
- simplify test case

Peter Collingbourne (1):
  string: Add load_unaligned_zeropad() code path to sized_strscpy()

Vincenzo Frascino (1):
  kasan: Add strscpy() test to trigger tag fault on arm64

 lib/string.c            | 13 ++++++++++---
 mm/kasan/kasan_test_c.c | 16 ++++++++++++++++
 2 files changed, 26 insertions(+), 3 deletions(-)

-- 
2.49.0.472.ge94155a9ec-goog

