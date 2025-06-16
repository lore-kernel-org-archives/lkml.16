Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE7B3B1AB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108606; cv=none; b=W5HTJPEtOQvr6IX2+DvcSoYP87XuPPWcZzbubVmrCNTo4erh4+iffX3G6BHPYVBWjf5Td2BRVS4LqYYtnRzX/IFzGRPg+KbPvdiS3+ZNvwurjyxK56pMXGX7q4om+yMJI8vLuESldrnsuOBlg4l3feueGukueQTYnnNNygHMQws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108606; c=relaxed/simple;
	bh=rf2528MAQI0SWjfQ2N2eH8l7992Txi+rx3ktL0H7dPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i6yp8iBUK24sky6lqJ8sRD2n6q+WfU4js27Ndv+jsV7y6ZSMo4wTDRlPUGzs0E9lOVWQZJ/9H9PPOEXH7H1cJtarHgyDLAzvf5lV/34SZJDmAD7pPJs0DiUXp/cFGhJmEe63xG0dhXEPX3uM/I/Osyj8UxNVTKSUXrscKrSlTBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aBceuS1I; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aBceuS1I"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2fa3957661so4331872a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750108604; x=1750713404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjB2AvHvP/l5fSBXrpAm9tdfGAHdUE2jUdUZTcZ29zc=;
        b=aBceuS1Ig4ex+ei3+b5oLVoCBvM7quJ/YpqEFAlX4olK3rqiOker6t7Fw6JtnSUeFO
         6QvdCucrkwBi6T4qNja2mIYsjAVF2lf7fiQi5GYMCIWa2hy4PJ3zofsZOjrJEEN1Wjna
         PI9NBdwSj2dhsWWNGcFxr01toteVkEbEmzyD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108604; x=1750713404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjB2AvHvP/l5fSBXrpAm9tdfGAHdUE2jUdUZTcZ29zc=;
        b=iTowYwjJzUw4/ppU5CI7rreIoROPZ4sHwzK1RqtL/72JNhQth0B6s3Q6o36rhtB26W
         ZadMYgc+rJpA5EnpiZCWbq+PzSH/M4C5apXi7fxSj2RS0hHltwzGDXJ2xrY+qIXBMres
         +L/IZAqWZ0+8Y9lVrP4+al81Z13ut4FW4pdAN45O5CqGbPKCn386Q4It+Exkh5+R/zJo
         5fSBeLYUAusopAA3XJOQMaOGjyBvjIm8c93VtVBJpT2UqNHcI31fBxcytqfvG8O1fOpo
         JZBt2mWdoYqIQmwBeZ0kkaaMygLj4YExxO2ogIow1Bz43eo0Lsa+6miSjhnl/NTqacFm
         LPvA==
X-Forwarded-Encrypted: i=1; AJvYcCV7CsJwV2uzfeyzFY+e3TUG0qTkPW9aDsbF+aUuWupSFc8SjYaKNDA/jTa/G8ymIBN96WRbGy/SWmSxPrs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs+iCtZkHLWm/DmXk3GPluOn+K7qhpN3blH0yhDcnQ9Eu8Y2Em
	VNY2zwPOeqWwmwIM7Cmqwl57rO66jke2J/29pEqlC1R58omS0CnZZYEewfYr0sQG4g==
X-Gm-Gg: ASbGncsFWAfmCndPE8038FdJLnu2nmu9qytEdgya6q/PoPYYEu3Lf6kxtj0Uj0DEc0X
	6PbjdGk0YwfILwsLcPG1m3llVi4TLDlvlh1q0Sj6JwdXmQWQ4EefeEvOU69YGfQjK6UmBwY0nfk
	WrBo+k4ueGHw3LD1MQpegSlyp7zhPXtY7qRs9nOW2jQSOTBRey3qMDg7xTT+UDAd6zJv1+CdHye
	Zhoqh/UXno+96VNTugqEhAYMu0AUWveYmBYIIRLZgbq68wJ3943B/UgUUBKHivd62sAqq7iFA5q
	KSGDgWZqITNKteTUtheP24YZsuP66j3Vs0zJCVpArLpu8UM6awHdr1XYAv8tq0HzrUq0xPNWCLy
	UBdr0MQ05ACIyGSsUr4QoL8rF
X-Google-Smtp-Source: AGHT+IGe1ufxDgVDGZOcSm8F8WWBMKf/NVeCmCDL4jeI8CLDLMqKlTjQVroioLV9TyiCAOtjfQpatg==
X-Received: by 2002:a05:6a21:2d04:b0:21a:df04:3285 with SMTP id adf61e73a8af0-21fbd5f20c7mr16177374637.22.1750108603884;
        Mon, 16 Jun 2025 14:16:43 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:aa5e:e3d3:2ccb:2f3e])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b2fe164400dsm7419675a12.30.2025.06.16.14.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 14:16:43 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>
Cc: linux-doc@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Rae Moar <rmoar@google.com>,
	linux-kselftest@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH] Documentation: kunit: Correct MODULE_IMPORT_NS() syntax
Date: Mon, 16 Jun 2025 14:16:33 -0700
Message-ID: <20250616211637.111358-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The argument should be the string "EXPORTED_FOR_KUNIT_TESTING", not a
bare identifier.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 Documentation/dev-tools/kunit/usage.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 038f480074fd..066ecda1dd98 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -699,7 +699,7 @@ the template below.
 	#include <kunit/visibility.h>
 	#include <my_file.h>
 	...
-	MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+	MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 	...
 	// Use do_interesting_thing() in tests
 
-- 
2.50.0.rc2.692.g299adb8693-goog

