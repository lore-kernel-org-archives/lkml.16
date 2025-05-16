Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD3027FB09
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747422410; cv=none; b=fgye95Yq0KXgXD7+J7wfJwDzSSV+wrlS1oUMR7nbxRXV4M/AG06egIgAojoVOWP35HAl4945eh1p3s+eiTdcahwJAWPTG8xpCVpJfEhYvNg6SblIJFupezs7OFjndryWtw5SsYZoavy15h0eI+/5N4gOfCYNGpTjNHN3sJzNcc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747422410; c=relaxed/simple;
	bh=/SLjNTUbM63R26k/UsXUlQlnoCKD2zOJwWHIFiGKmAY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JBDZrH3f/9S2I9CNmq5mTMZ3gLCFenD6RCnst6VxCIgPmu4j8KMKqnyDpBpiZcgs8jg+CfrdEO2J3hiCozMntHycPpUdRBsiciJbvTRe+tVMfd01rgbOyFGfu4yo2xHWXLh/26abrd2RLggseBYXtbuz2hcbi/eVJboiONFPcGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=00Bl9u8A; arc=none smtp.client-ip=209.85.222.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="00Bl9u8A"
Received: by mail-qk1-f202.google.com with SMTP id af79cd13be357-7c5f3b94827so429732785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747422407; x=1748027207; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4gPgjbGOtp9/GSKJFp4SYCjxvoZAvNM0YP1ZbYCo9U4=;
        b=00Bl9u8Ay7iaaI6L5Bj93B+AZ0wGIUKRiu6uW5E+pGY9cLg4nWe98n/dALsXAmppZh
         m3KRg6h9e8KErSUa9iig8kE3FwWPlzpH5938lDzS1ZgDgzEQZgILO94rHnHH9siOfzeW
         uAvqj9zXBADJ4D28m/RjqvuqCpaTkA5ntqBHCEYknTTLMMc+Vxy9A3tKx+JrNxkoWexU
         K3Eo3mRCRaJeidTPh9T0HZlERxVOafvrpKKOn6EoYrS4HRyZh9pYN6TWXXdoDOpt1smQ
         mx7Q6cMTZ0VX4EdX4iebuN4Sw0UIWVGGFz6a+9MP2YMGbyYYSXg6v/D3sFyt+DwRwGPh
         DXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747422407; x=1748027207;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4gPgjbGOtp9/GSKJFp4SYCjxvoZAvNM0YP1ZbYCo9U4=;
        b=A/jsjvtEZSuHfI8p8FRhTFSUg9U0uuBC5H6lTLvodubYljsIHt21UR6bDt38uiKlEI
         yJ2fdt9h7LiQpFNOQBmMGWvsf9xncRef1tNzgj+h51kvtCgUj15b9it7H4f6CuJKDBMi
         JxvLH7qlvCSuUWJURCpO0I+dpNuix2uKxBAD1mqgES4kVkdMpeL99DcwaOSw6+D45luD
         PBfTHd2CMzS/SS4Xpj2J/5zx2GvLFykZhjBkk6LZdD9SzcbVALYUK6YbX00h+ZFT3DeW
         tP6Nj9JbmPk/JUNjyOqxGk2Eoo584VQjjwnCBoja4hk3zs+OKLSzoBHCcIqeoIpXa2AQ
         Do+g==
X-Forwarded-Encrypted: i=1; AJvYcCWtUsDibvnKdaSidl3pJ0ZGRqh32ZkFNzE1DKQ1XoqJRFjdGH1IIuv+0nzKRPQ/ITh54I1LT6a26jncvpc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq8DKTOxQ/7y1cu5FK7aah5NneOmfanxrn9xnr5P0FuL0TjeaP
	c3V1vusfW0ivPBjw4WAVd6l+hT5UuftVnnRrdvEgCCPjLafb2o2nspbylc1B58EIeGpYmxYjiRq
	vbQ==
X-Google-Smtp-Source: AGHT+IEgPOuqk/3cE/2H7zq0b0LsLPaHlURhVDCFbXNlXfbY8uO9X5+SEluiCVEb+7gsQvjh7IayMq5ggg==
X-Received: from qkpf18.prod.google.com ([2002:a05:620a:2812:b0:7ca:da19:5cc1])
 (user=rmoar job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:4091:b0:7ca:eb5b:6b99
 with SMTP id af79cd13be357-7cd4671fd0dmr645557085a.15.1747422407087; Fri, 16
 May 2025 12:06:47 -0700 (PDT)
Date: Fri, 16 May 2025 19:06:31 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516190631.1214081-1-rmoar@google.com>
Subject: [PATCH] Documentation: kunit: improve example on testing static functions
From: Rae Moar <rmoar@google.com>
To: davidgow@google.com, brendan.higgins@linux.dev, skhan@linuxfoundation.org
Cc: dlatypov@google.com, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Rae Moar <rmoar@google.com>
Content-Type: text/plain; charset="UTF-8"

The documentation on testing static functions using the KUnit macros
VISIBLE_IF_KUNIT and EXPORT_SYMBOL_IF_KUNIT is lacking clarity and
missing key steps in the example. This has caused bugs and confusion
among developers.

Improve wording of description and add missing steps to the example.
This entails adding the "#include <kunit/visibility.h>" line and the
"MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);" line. Both of which were
missing from the original example and key to exposing static functions.

Signed-off-by: Rae Moar <rmoar@google.com>
---
 Documentation/dev-tools/kunit/usage.rst | 38 +++++++++++++++++++------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 22955d56b379..038f480074fd 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -670,28 +670,50 @@ with ``kunit_remove_action``.
 Testing Static Functions
 ------------------------
 
-If we do not want to expose functions or variables for testing, one option is to
-conditionally export the used symbol. For example:
+If you want to test static functions without exposing those functions outside of
+testing, one option is conditionally export the symbol. When KUnit is enabled,
+the symbol is exposed but remains static otherwise. To use this method, follow
+the template below.
 
 .. code-block:: c
 
-	/* In my_file.c */
+	/* In the file containing functions to test "my_file.c" */
 
-	VISIBLE_IF_KUNIT int do_interesting_thing();
+	#include <kunit/visibility.h>
+	#include <my_file.h>
+	...
+	VISIBLE_IF_KUNIT int do_interesting_thing()
+	{
+	...
+	}
 	EXPORT_SYMBOL_IF_KUNIT(do_interesting_thing);
 
-	/* In my_file.h */
+	/* In the header file "my_file.h" */
 
 	#if IS_ENABLED(CONFIG_KUNIT)
 		int do_interesting_thing(void);
 	#endif
 
-Alternatively, you could conditionally ``#include`` the test file at the end of
-your .c file. For example:
+	/* In the KUnit test file "my_file_test.c" */
+
+	#include <kunit/visibility.h>
+	#include <my_file.h>
+	...
+	MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+	...
+	// Use do_interesting_thing() in tests
+
+For a full example, see this `patch <https://lore.kernel.org/all/20221207014024.340230-3-rmoar@google.com/>`_
+where a test is modified to conditionally expose static functions for testing
+using the macros above.
+
+As an **alternative** to the method above, you could conditionally ``#include``
+the test file at the end of your .c file. This is not recommended but works
+if needed. For example:
 
 .. code-block:: c
 
-	/* In my_file.c */
+	/* In "my_file.c" */
 
 	static int do_interesting_thing();
 

base-commit: c2493384e8110d5a4792fff4b9d46e47b78ea10a
-- 
2.49.0.1101.gccaa498523-goog

