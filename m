Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364EF1C1AD4
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743260816; cv=none; b=JPYrxI2Slj4EtlAEeqdpDBHtT9ac0PVqHh8XH1gO/wAOqkO/CFIAQ/AfCATunOd/iJ2+kM5jDWqixf2nMYGz5WjwKHi0JQeCOQ6acoZwpf+FDtT3VjGmJEHY4DUPyXVf7f0diihT0ywAdUCMY5n0tSWcOGvjrb+1o3ikUPMQQ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743260816; c=relaxed/simple;
	bh=vhrh+9oSpP0DEWejdyfXK8eNWvvXri7PQXavL0j3KlI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-type; b=YAH3IHfchDV3iJLNSuWXBqlZxQ6x2aYRE56rhgzkmduJ3M+g8Rh6GLGLLbh93Ivi0LEGM1WSfTED1fSUc3It1At77wah0loCmO3lKrAwhtGnTmZMqUsG4FwwtwBZubi4jV9XhJOqy6+Yor2Izp0p5au5rKKkHgv0xQ5RzIsaEfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wi2kje19; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wi2kje19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743260814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S8zI311lqbyq1Z4you2dOBLeU+B8GZ4SBxX1alQksoE=;
	b=Wi2kje19e+NFqtkcc4960/33cx2/D2F/nAHS7RE4cVUuR3PoZdsmqhe9RbpiARFB/jEFKz
	wLMbGN7KWtqDfKck4MccQeJuU0RgUSnum9SguHXIfcxeA2X854kv5rHLS/E/X72cZeLBwW
	7kKq2mjZFWK2x8axI29/YcBOPij1bf0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-b9VT67ppM12FTWm82CVg4A-1; Sat, 29 Mar 2025 11:06:52 -0400
X-MC-Unique: b9VT67ppM12FTWm82CVg4A-1
X-Mimecast-MFC-AGG-ID: b9VT67ppM12FTWm82CVg4A_1743260811
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43bd0586a73so26683795e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 08:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743260811; x=1743865611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8zI311lqbyq1Z4you2dOBLeU+B8GZ4SBxX1alQksoE=;
        b=R2/ErfRXQed5MhXlEZnaTw6fOAxfcGo/NGrd5T1VHsmmiqBrrxhtS1EGtaVbQE4Jdw
         1fhHcEjq4po/T2w6wA5wqG1iSdk0XKSa/JSZDoAqkssL/Fe/PVG590B0irnHUBYPQBuU
         hnXMA2bNneJk3VPCAsPgqn5NupIASz1FlFrbNi4My9C7T/IOCHKDjODlrCguVX241LhR
         XgecHg2uQUb00kVof/P4OMNpiSp+7bZrhZlGBTvtSvYrf2tvkB73AodhuLKOZt6ycmPS
         n3EHkyOp/5unuvA5e88Dy9HkHI9fS+rpzYbOcGq6SNn5FUmlpta50mFGA1HI11QpLC4S
         zK9w==
X-Forwarded-Encrypted: i=1; AJvYcCUP5U9oYXlXVPzVpO0+nAHgZhWVKVPbPNRiE6RIsgFHevCe2b681zsVVuJ9vhj0oAZThn+66HckFghLiTU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ+JWSRRlf8CrKKBVtLy9GpfDDQrqNNVDnpfwGHOFDhzMkqo1W
	z6wIjC26KphLYN8r0m5uOv3lKCSqmYaM0NDHtRlEEAF0r2B13ITYJYUu/FPL/bIaW2LtIpK+M2s
	Ht5YUUFnWXSo4SInZqjLTF6M4nDvVev1eaOsyeCeoDPucV8r0LDk5hfsJsMiI0w==
X-Gm-Gg: ASbGncuKxeCm36wrYr2gROwkdriwQpU6CDxPdiC7a/GQkBHY70iKkiNaySSecJSpl4p
	QDM3NO/Wy+ZW4E+ojDr4QE/w1j6AcY88I6NYrIYtPeXRULXFe4UXPAKGciG0L4daH2cbhUuiJKq
	Lz/g2l3dKhtB5lSUIOD5Gp23Yi0xa6vzGrzJ6GRVekCqzYUesaH5R7oboCsuei5zp3617wdTgiY
	HDyaGffJOXFbw3egMwZYZsgAr5kXCEhe1lsJPNmfGkpsT+WuiiKET6vQ6bkKd8XDwQ7gFjP7WlG
	Ys6tjF6qlKxNPRrHQbO7
X-Received: by 2002:a05:6000:40cd:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-39c12118f51mr2203364f8f.42.1743260811346;
        Sat, 29 Mar 2025 08:06:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IET88jcJ/fUhMkJBzo9iXANXxVp80YEfKLaDkLOIVe2hPzsFQ5lK7sBVk2xeGnWFUm+16DMNw==
X-Received: by 2002:a05:6000:40cd:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-39c12118f51mr2203328f8f.42.1743260810973;
        Sat, 29 Mar 2025 08:06:50 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c0b662850sm5914994f8f.26.2025.03.29.08.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 08:06:50 -0700 (PDT)
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
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH] kunit: fixes backtrace suppression test module description
Date: Sat, 29 Mar 2025 15:05:29 +0000
Message-Id: <20250329150529.331215-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Adds module description to the backtrace suppression test

Fixes:  ("19f3496") kunit: add test cases for backtrace warning suppression

Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 lib/kunit/backtrace-suppression-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtrace-suppression-test.c
index 8b4125af2481..d4c5df09bba6 100644
--- a/lib/kunit/backtrace-suppression-test.c
+++ b/lib/kunit/backtrace-suppression-test.c
@@ -102,3 +102,4 @@ static struct kunit_suite backtrace_suppression_test_suite = {
 kunit_test_suites(&backtrace_suppression_test_suite);
 
 MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit test to verify warning backtrace suppression");
-- 
2.34.1

