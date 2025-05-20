Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3361628467A
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770781; cv=none; b=sy5/t88b6tVfj+gz5xee26Lp0RMCPRHVIp9rBKKQ4/hTuKGD9eL5NpIh0NKfbt5zaGun6DC9732fiX+PPFoM8lyDgU93+VNAsOVgG0RG2HlHpweMNBy24du40207M/TiY0xJyLuSC1k+ssPYFoMAbrd7UQOTOVq8R7Apj4pfyrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770781; c=relaxed/simple;
	bh=2JkxPTkRCF2ZFpW2d9Eif34bSfjAooXPglJI4C8IIgg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=juoNDyP/p8f0UVArepCCiZVemxkR/dLbvdSmbIWuqci5YqxOf91vQIyYyO6DfbRsFwsnw4QQvts1WO/etU0xbTCTD+AF/RY5wd0AbQBCRPOCvujd/fpbbg4EWccpJX/yG1qeyldBISha+uYFLY+aomboxHryn+UmkGr4CoAkK8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eymqlKOO; arc=none smtp.client-ip=209.85.222.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rmoar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eymqlKOO"
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-7c54e7922a1so1327797885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747770778; x=1748375578; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SXpn/WaKau4zA3cRgecqqkvTjBRhcHkLh1EPrEXBv6w=;
        b=eymqlKOO+siVXXvklcmDD0ZVGl92JDJn4oYVPfitIsURCXv0VpD25caCPZsqoZdy72
         Vl33zNkbPnsMmyU+wonEFV1jfddBKZ2QwbkkK4s8vN2qDAnxg7pbaImMivfdO1aOt9KH
         mfqtKPEX+2XbvFsQFdzIMS03YVYv6sZlMO9HnVHrGgitNoBhXRA5L96kTfDNcXJesjdr
         uiC/lW4Aetq+xWuHz8Ji//uPJ7prQLYJjKgnvRZFNBNf6xtXTIA+GgBR3aOkXcanPzBz
         4neLltEND29ZlhHESOyDh870/7cKzNdhAtLnj88tcEFlwlUuRRkXc5yYA89C6599i+Pn
         8tpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770778; x=1748375578;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SXpn/WaKau4zA3cRgecqqkvTjBRhcHkLh1EPrEXBv6w=;
        b=MYAfo+ViJ7KUkGN1+AbjK/RG0Uwgsjoyil3ZpCdp+JpdG0REQSMidd0bPE63+bljWC
         xLPdCBxj4o7HrwJBU/KQ2Z2cnl471hH/ZPXaGoxy+6HnU2xda29d34H7djIg5Pem5GYy
         c32ZoPUn7En01ZAFGCo6j7ehxlx5QpeceQTHkqhzBlhf+ejyThuyg4109LZ10236wBKO
         4Ce5sO3Jx8cBDQdx/HcRS9bfIcZ7konCBELZNMuNX2Vjf9JRrwGFRFb5wplGKin3yA9y
         f/WlIamiHxVLlcRFpTMNPrsKmKyuZxwcB3jdHQxCj/MUX9SlFSwLmFK0Slk1uf0UeSSO
         YsWA==
X-Forwarded-Encrypted: i=1; AJvYcCX7DEzAgRR4ApR25Wib4zHNPEhbK01P0gLRdDGzu0ia0YLe7wMdfRmA1t+Xn4op4RZ0urHXXj6ZPXdpZMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcC1G+OsoX0uiBMC7QO6JZpGjXEf7cTq2pf1X5x8fFUCAYAZ83
	B9aVM1wZUYI+6sn9xXA8fm/ar4ScV1SUguDXlOrM6CKn85QL0tM4vhN6t1lNNLOatAh0mSjduQv
	kog==
X-Google-Smtp-Source: AGHT+IGMDiv33WBWbSNW1H6Xv/IdXq/dfRT9Dy0t/jTHyqfUZS7qemkc9kBCYcIkb4w/Wkju9zwFy4xIsA==
X-Received: from qkpn19.prod.google.com ([2002:a05:620a:2953:b0:7ce:becb:f27d])
 (user=rmoar job=prod-delivery.src-stubby-dispatcher) by 2002:a05:620a:372b:b0:7c5:a2f8:e6e4
 with SMTP id af79cd13be357-7cd47f46587mr2375350485a.29.1747770778122; Tue, 20
 May 2025 12:52:58 -0700 (PDT)
Date: Tue, 20 May 2025 19:52:52 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250520195252.2235050-1-rmoar@google.com>
Subject: [PATCH v2] Documentation: kunit: improve example on testing static functions
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
"MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");" line. Both of which
were missing from the original example and key to exposing static
functions.

Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Rae Moar <rmoar@google.com>
---
Changes from v1 to v2:
- Add quotes around EXPORTED_FOR_KUNIT_TESTING to change it to be a
  string

 Documentation/dev-tools/kunit/usage.rst | 38 +++++++++++++++++++------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 22955d56b379..066ecda1dd98 100644
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
+	MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
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
2.49.0.1112.g889b7c5bd8-goog

