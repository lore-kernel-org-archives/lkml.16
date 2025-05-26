Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAF520AF98
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748266107; cv=none; b=JozItrA+G8oX8plkVJ03+mR/Bx7V2nUhKRovDjEClaRjdxpbm3yKJTsB0m7b9ajGGVL8YU85YqeL3/FFpVBHQa5bVuGsMxllHqbfIlLe+FqJky3trIfHF0FuxRX14Nuzi8kllfyCyU1W6z9lUQml4yPPZwOzxVumzeg2eJ3YZy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748266107; c=relaxed/simple;
	bh=6t3eRY7hkJvKtTZGuaky3RihvRWdFfWK3lVmchxIyG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-type; b=d5rEKjyMD5ZFZ6xKzLelxuwOox0BdUYb1Ym0/aSjaUf1n9g985XVHxVsFsBiLOousMMVHXXe0A4NPaJ+vY/TJ0ZogW6bjKYoE0hX7QgUt6i3zUnhP8ydVCy6lT3ZHv3hynQNDoaWUvI7ZUStMt89681uadqgPQBccPk2x/9DAm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Osw74WHx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Osw74WHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748266105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tIJNc4z+prl6uqE8TJXFoIi+LuDA64zLV+jmBQfkFuc=;
	b=Osw74WHxGh/qyWekgIRDKb77Wplwqoib/oD7fhpgC8ToTZZh2eQNGwAJC0XkUW6Pes4r8L
	CigAd4KDg0I8KyzR5lhngwNfvGef+Z4kbdji6xcgwiUb6khz3orIXN0CliZds/WSTdRnk7
	vBgWFplTeqA9L5HfBFKLy2PU5iSsV7g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-IBO5KhujOXKUSnlK_IsTtg-1; Mon, 26 May 2025 09:28:23 -0400
X-MC-Unique: IBO5KhujOXKUSnlK_IsTtg-1
X-Mimecast-MFC-AGG-ID: IBO5KhujOXKUSnlK_IsTtg_1748266103
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so14412975e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748266102; x=1748870902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIJNc4z+prl6uqE8TJXFoIi+LuDA64zLV+jmBQfkFuc=;
        b=lwVvLhBUZU23YR4taXlkrlQKcBByoWdDk9nEpiEDAAbowamTfu69+cwEnBAIr31G10
         wnfO9iRpDRD0AK/wyekmamSDJFnDB07pJ2s67PjBJ7MHVmL+Mpr6Be+yHH2VHWPEVB4z
         Ys12WznG94myh75JeDo8vN8Ljsbl7uAv3Ut2j8oZT8l+oDf4xP6wHjQUobe7QUuzOuP7
         tSecMyRcYF2ytN/2D3eCqrdwyjMXekmlu0M2uCdqEfbvEuqtv84Rl4PAf30vJiTiFd+/
         2KYDiVw568tIucGNzo0D064wnD+goahIUjXw543nuHqHM/ltamnQ+lCbfwLVX1qWbHLt
         OsjA==
X-Forwarded-Encrypted: i=1; AJvYcCUTXmV4ULgQaE8dw5BJGVZ3sjM7dOjQyXbS+TAQeYiSuLzZV78jjhMpxO6lHrtVAgph8Lmz9pqjsYFD+Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYeNJAXNe/DmQM5wezLgH/1kHOBI3137ke5DyoSHNuH2lxDFFT
	BBFIlYeelglByy/SM13yr3fdQrqSv+hT0ii5wUcmyOQ6v46pN7BKXY9Q27v5SJgLYy+17CMyMI/
	bl2Cs3HfVoFtwPbGQwHbJjCqCnTna/zxYl6IRCIaz2O26dilWM17fiOd9Re0pUbMNDA==
X-Gm-Gg: ASbGncsx8oAMF6cwNRBNh/c5SNs00yBYmBHciiZFY9/JT+09uer+0a4oe3f+Ihe9P3n
	ZLn/gE+XWWib4sBZdSD7VZ8korsMMuvrOEEsZvlx1YnNhwoTO4z0+8HwharR9fhJdglAZDREydr
	4e1VicqmWZoVapnI043JqHfnzdxvm6Nh5aSC6inDCQyWE5GiwL+p+vs3KZsSk4SVq+0znSu6QZI
	paO4UKeiKPfJCyQexNi+uTLC6/ILDqz5k7RZ3QhdiSw7M+skaO3C4TB9tO39zK4Gk59/Go0NahE
	5zGbT0rk/FCdmE7d
X-Received: by 2002:a7b:cb0e:0:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-44cf6d81628mr43597775e9.5.1748266102530;
        Mon, 26 May 2025 06:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFr19bNHeLuqPTA70dJ3loiMHnX3Wbi8DckD7ViZVw9xearBz01pBMAJtm6RFOqVblZmf8Afw==
X-Received: by 2002:a7b:cb0e:0:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-44cf6d81628mr43597425e9.5.1748266102096;
        Mon, 26 May 2025 06:28:22 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4c8455e7dsm8836663f8f.9.2025.05.26.06.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 06:28:21 -0700 (PDT)
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
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v5 4/5] drm: Suppress intentional warning backtraces in scaling unit tests
Date: Mon, 26 May 2025 13:27:54 +0000
Message-Id: <20250526132755.166150-5-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526132755.166150-1-acarmina@redhat.com>
References: <20250526132755.166150-1-acarmina@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Guenter Roeck <linux@roeck-us.net>

The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
intentionally trigger warning backtraces by providing bad parameters to
the tested functions. What is tested is the return value, not the existence
of a warning backtrace. Suppress the backtraces to avoid clogging the
kernel log and distraction from real problems.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Maíra Canal <mcanal@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 17e1f34b7610..867845e7d5ab 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -406,22 +406,38 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
 
 static void drm_test_rect_calc_hscale(struct kunit *test)
 {
+	KUNIT_DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	/*
+	 * drm_rect_calc_hscale() generates a warning backtrace whenever bad
+	 * parameters are passed to it. This affects all unit tests with an
+	 * error code in expected_scaling_factor.
+	 */
+	KUNIT_START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	KUNIT_END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
 
 static void drm_test_rect_calc_vscale(struct kunit *test)
 {
+	KUNIT_DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	/*
+	 * drm_rect_calc_vscale() generates a warning backtrace whenever bad
+	 * parameters are passed to it. This affects all unit tests with an
+	 * error code in expected_scaling_factor.
+	 */
+	KUNIT_START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	KUNIT_END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
-- 
2.34.1

