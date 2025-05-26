Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B565B20C004
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748266109; cv=none; b=advPlFk6y1APA7qd9yGarmw9H2Ddih0zX6msOz7QvURZS6DqRdZB1al4J0Z75ue1HtFp/tLA6CM/MoV79uI/AxcbrDSdhLGTXOc90vac/7mXMaT3o85TVhoGHkLo6TuksmocgVMKkIkuW5CFxqG9RBhrBPcg4Q1gRsYP/gOiWvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748266109; c=relaxed/simple;
	bh=k/QW8yyThWQYD06PZzn8avBbFa43Ro0Rb4YCVVYWNuQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=nsn9D7KgsZkF9ZBgDRT5NyCy0H/ohT46Mdr3URSDeLqjg6CPGCCVRQ0+fwHDQiePJE5LFMuas3upFffZ4VzI6/l5zbRleVYsCtlVtyepNvLfsNi8FtyJBdCu7uWxwUemBrPW6kiQKfa9SjzXNw84col/CxoqxgmP8csU7Exr6eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A8ubggNr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A8ubggNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748266106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piebsVU5QZFL/FeYXj8vMs1AI4HP2ZYK+Wi3o0pUrOA=;
	b=A8ubggNrNkDX1RKJqF1qPqkz0ydjr5LpCOonG7x5bJ603FJplLcE1tVS89qofimyVSSsUE
	zzIYc1Xw3HSXQSmvzlOqq8rXkdePLo+BNgRFXYPwiFo94jCwS+sQ4vu57C/wjvZpCXEQBi
	AB/xQo/txrNxx+FEs3vaDyGpWET5MM4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-l-JvISr5M9uHzKBZ7xfqoQ-1; Mon, 26 May 2025 09:28:25 -0400
X-MC-Unique: l-JvISr5M9uHzKBZ7xfqoQ-1
X-Mimecast-MFC-AGG-ID: l-JvISr5M9uHzKBZ7xfqoQ_1748266104
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442f90418b0so12243915e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748266104; x=1748870904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piebsVU5QZFL/FeYXj8vMs1AI4HP2ZYK+Wi3o0pUrOA=;
        b=RnEkpuXQQSjLzPMHbVp0svr0+uvsadW08R0RD5d2WnAIvxkRlXLDsZvw4n3rk0iQRD
         0sobNNYwSdXTxDzCX6psHlZMLMUxEXhXuPbxMOVUokmcPsQsF4Nz7KhZj0a1tzRqDM23
         T0QiHKxrYux/gSvSJFihKPOEmynHKvEYmceZDhTmvk1I+8KaXdd/0hKWHWUi2Jq4UZw6
         kXMQ3ce+or9uHk2S8vevFxFRXeUAB5+6iF4JszPbK1F45BmBgINOM6fuIHSgxIeQyopo
         h/+EpMYidczrB0/PsdFT+xbGOTwew6mmgCb9a8EcLxObQGNj8R+VQ2Ti26JgGH20T4zV
         vysg==
X-Forwarded-Encrypted: i=1; AJvYcCWQYkfQuLuHrS473R+vCyW6jWcor/7dNkOkjY7OWrcUxmpkZgUQ5p2XZBJ0KUMo5HrqmaVEjEHcH/nQtKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwujAGfPRmWnKOE6I6Vl3R7qzGt4Qoa3XBsfQEO0GS9zZVEgY6a
	53DdDztMhoeJjPVl+DZfE9HYNcdDpL3c+UPQUfpFoje6XTX4AEN4MZ/WLZBDPtfhB+nFcxmzuT2
	7Qz/RP3i6ou6chl98l3/6Ise9ZIehLAHTl9Q1ewteIUuZAB+/2teSE8lmadVvFtiN0Q==
X-Gm-Gg: ASbGnctAQnmK6fPLaHGFFPHU1OBAtup3Ko1nDUfaLwkF4+ypHceUzmf16Fcdz20BHwH
	IW0PRkxI5VRnQhvtUo6rpmp4ej9nEXoi+uhzQcMr/dBo9cl3H+DUxmw8+WtcSa/dl3TEey/uGZ/
	h+RiC/Y62bEQhKcj7sr4yJL2r3VSnDgpGgRq3sPXwFdTZG0K6mEbxo64ud+jPErHuld9JYM6JM5
	2yyXbCsOZCGOMAZGQ4kbV0DA0tfVUdPUgxXe2zxNnkdUtgqYrMFjUzbkKMaS3mkiMoQ6Ih7/SJO
	khWUE7q2IV8C4CYH
X-Received: by 2002:a05:600c:511f:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-44c919e1212mr72338685e9.8.1748266104406;
        Mon, 26 May 2025 06:28:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaaobnHeigG/eBkWZXd1t3qpSgOSBx99XMBgFVTdHMNgY3fiyKRZ23Lqf2VAX1TTWLq2keaQ==
X-Received: by 2002:a05:600c:511f:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-44c919e1212mr72338525e9.8.1748266103966;
        Mon, 26 May 2025 06:28:23 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4c8455e7dsm8836663f8f.9.2025.05.26.06.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 06:28:23 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v5 5/5] kunit: Add documentation for warning backtrace suppression API
Date: Mon, 26 May 2025 13:27:55 +0000
Message-Id: <20250526132755.166150-6-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526132755.166150-1-acarmina@redhat.com>
References: <20250526132755.166150-1-acarmina@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Guenter Roeck <linux@roeck-us.net>

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 Documentation/dev-tools/kunit/usage.rst | 30 ++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 22955d56b379..b2f1e56d53b4 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -157,6 +157,34 @@ Alternatively, one can take full control over the error message by using
 	if (some_setup_function())
 		KUNIT_FAIL(test, "Failed to setup thing for testing");
 
+Suppressing warning backtraces
+------------------------------
+
+Some unit tests trigger warning backtraces either intentionally or as side
+effect. Such backtraces are normally undesirable since they distract from
+the actual test and may result in the impression that there is a problem.
+
+Such backtraces can be suppressed. To suppress a backtrace in some_function(),
+use the following code.
+
+.. code-block:: c
+
+	static void some_test(struct kunit *test)
+	{
+		DEFINE_SUPPRESSED_WARNING(some_function);
+
+		KUNIT_START_SUPPRESSED_WARNING(some_function);
+		trigger_backtrace();
+		KUNIT_END_SUPPRESSED_WARNING(some_function);
+	}
+
+SUPPRESSED_WARNING_COUNT() returns the number of suppressed backtraces. If the
+suppressed backtrace was triggered on purpose, this can be used to check if
+the backtrace was actually triggered.
+
+.. code-block:: c
+
+	KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(some_function), 1);
 
 Test Suites
 ~~~~~~~~~~~
@@ -857,4 +885,4 @@ For example:
 		dev_managed_string = devm_kstrdup(fake_device, "Hello, World!");
 
 		// Everything is cleaned up automatically when the test ends.
-	}
\ No newline at end of file
+	}
-- 
2.34.1

