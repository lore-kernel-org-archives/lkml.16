Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8B91E492
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 15:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743260688; cv=none; b=FTNegLO4HsSd1oQYjDR2MKdn+dCDCTxWepFH4coCbV6NpjMJGJdrQ+nZd4+3gps8kLFuErtzKMav0nLKoH6hXTuBri7VBgK0Hm5UHEFt63GklfLoH4k5UOK9UTK//lxvUHrA9QeTfL4HRCprFbE+hfa358eTHc8xLuMFrKLb4/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743260688; c=relaxed/simple;
	bh=puzgkOgCUPbE+wQ6SBvpkomea7X06UdpL4PsTVyABso=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-type; b=MMQFuyQAJr78hZ/Gf5FSwrOuXLjVFMkO1jogGff5n3CYpjqEMByTn1qcDlGNov1/JoEFnKj7qrpFK2EVmd1PIUiwoXEHxvNPExVh0xoOaXb99Ac3QGOlJKqBTBwIO5dvimUGtAuo/kDYmtFLda+q59F4qukZfcZghzRbZqp1tvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DTDOxj/F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DTDOxj/F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743260685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9rZcFa00OKiutAluKujooWT6oAB0DkFh89UjHpXtZTM=;
	b=DTDOxj/FZO2gwVl/tOsvXe/ZggDEI6LglvEEgsuv4jncaYKdrOvciahpM3vvD+rHgRH4k7
	mcnXIi44ReQIH8gbA1MXdBytPiUc988YUaHQ4dgO7rVJzsZ6EkiiYnwvFfSZEuVfTzLVcA
	FhGsJ1R5Tz55imya+lAa8hbGDC1KCuc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-ulglxNx6NPyo7zkcavJuKw-1; Sat, 29 Mar 2025 11:04:44 -0400
X-MC-Unique: ulglxNx6NPyo7zkcavJuKw-1
X-Mimecast-MFC-AGG-ID: ulglxNx6NPyo7zkcavJuKw_1743260683
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391459c0395so1208557f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 08:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743260683; x=1743865483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rZcFa00OKiutAluKujooWT6oAB0DkFh89UjHpXtZTM=;
        b=bY8z1WBE0BcKOdl81JUHXT/kdpaifRIhJBXof3d1Caer9C1EP++ezcPTDYVxx847Rj
         6u3knXQG+8f5HDf/j6pBCqnJeMd1VFBZFNvQUi4lEPWLeTieSTGhENlYReAohcSUeovQ
         QgtMXaoz0QnVgLOUa/NbsT3FpSdMgEcSLGfow5BNL7ecdIn1PvFaIms/wXHjjD8rZrY2
         h0HtdrOioiZKZ6oQu/JpdDa+vnCFWPUntRASwHuXr6zz30Bt+rPHyHCnHcaWxWCYYsH+
         7l+fpzLlV2s0dTsoTp+pkkZ926NZOCEj3zrRYXBA1T+L0hSkpFOXuCvIXqKSwVbZhztN
         9fuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy5Fp6me4rFkd3ett0UvOyz85zXT37t6PWjiAGfmiSG/Gb8Uz/ayFDXmvl4YBgJ9N+3fH7wPMAxNTKK+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/bD3QZ5BuY6pvF8bq7/6z5dUWz2djOhLhUOnlj6TimXVSTh7r
	1qoL51IfQbA4gwWlKA8JZb8Vj+brhTKYwQ7XbG2LVGhJsw1KEmnNlSJz5SPCPo9SS89u1/D9QI1
	JMgv3k7AlN5xzWCsCCyjJPNZC8dusco7T+6/aRW6MOci9jv1CBcwLXjUEdrVrjg==
X-Gm-Gg: ASbGncuo02XAAdxFPkZm8kCsezKdLlIB/OmeWXzBmWpUeR4CmnGdCt4+bzEQtZpyngL
	U5LoWRe3qowDJwyoGfNUgTdv9o9NUi+BhmKhvD1CBbBwND4VD688JhUgNCD+PoVm6BhJqshWCDa
	afQw73P+VENJDhbo3uLax5kr8VlUYXIScBNhkp5UBuOef9tTwjHOTfF9a7n12/E+DJUnXNmAv4q
	5IzWTmKBU/eQsY9SdtgVelG2nUUsN9p7ljD9RUine80ViitB1AmkqFkpCo1q9gnriPk5RDWctln
	QunA7oqHQuTo78UPg+6c
X-Received: by 2002:a5d:598c:0:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-39c12119db3mr2073744f8f.49.1743260682734;
        Sat, 29 Mar 2025 08:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/2bHdcw2ELtkQnH3PJgr7VcNq4CZ6lA8znbzDKP3oWHKcunfSfI/tIlxfFak/s1ZEaKAEVg==
X-Received: by 2002:a5d:598c:0:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-39c12119db3mr2073713f8f.49.1743260682362;
        Sat, 29 Mar 2025 08:04:42 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm63073205e9.28.2025.03.29.08.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 08:04:41 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
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
	Shuah Khan <skhan@linuxfoundation.org>,
	Mickael Salaun <mic@digikod.net>,
	Kees Cook <kees@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-next@vger.kernel.org,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH] kunit: fixes Compilation error on s390
Date: Sat, 29 Mar 2025 15:03:20 +0000
Message-Id: <20250329150320.331018-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

The current implementation of suppressing warning backtraces uses __func__,
which is a compile-time constant only for non -fPIC compilation.
GCC's support for this situation in position-independent code varies across
versions and architectures.

On the s390 architecture, -fPIC is required for compilation, and support
for this scenario is available in GCC 11 and later.

Fixes:  d8b14a2 ("bug/kunit: core support for suppressing warning backtraces")

Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 lib/kunit/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index 201402f0ab49..6c937144dcea 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -17,6 +17,7 @@ if KUNIT
 
 config KUNIT_SUPPRESS_BACKTRACE
 	bool "KUnit - Enable backtrace suppression"
+	depends on (!S390 && CC_IS_GCC) || (CC_IS_GCC && GCC_VERSION >= 110000)
 	default y
 	help
 	  Enable backtrace suppression for KUnit. If enabled, backtraces
-- 
2.34.1

