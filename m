Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7231DA0E0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743409425; cv=none; b=AnAdNzop7VpgU5cvKtfkVc9ATyQ/dnwMlmkcsAngWJB3OYw2rN0tJKNmV8+EwNG/b3fDZiHpp+Cu5CbeENjZqaBRN+UrogjlzIoM+iewnFTH0LshDYravim3icshTtrZqRhA89X23asi9NxCNZOe1a/24pr/LXEzj9Isko74O5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743409425; c=relaxed/simple;
	bh=oLYgg2R3Khu6GTyhp5jk/pgurTV3eKg+D4RFW4sKhF0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aIYA9rFhCNilejiK8JhBcE351VVGKRFjESxCA+y/vtizuyPVnpLYNS6FhfSEVA6anF2c4j57lNBRJyujv27wqIAB9DB4YmqS7zqZkst7ZIV/oldLMyEdipXMwALAhrXeT50hIG7n+wvzQJLt54enmyopPByj77gmkXlLr1gnmTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vhzeHjoR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vhzeHjoR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso27895465e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 01:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743409421; x=1744014221; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z90mA7CwidsjC7fKWg5OtIg+rrVsIJQMjuYs20zPR4c=;
        b=vhzeHjoRF7/jLwvgiKcmB0Khn8IMqwulukGA65oUFQykphCNE1fUOEuNMg+H0sIWFf
         g2KNeCuK+tYyzimzgpt7PQ0OnxSrSH1gxkzRBHj9a+02XWd69fqBQtjuvfuWPWO5YOc2
         ES9eFWoy7OnbjskiIsHTbTlFgd5Qoa/cLiHrZNeYXtNrL5RFWjx50MCR4Z3f+/8f87ok
         HdQml7SjyifaRunmZSgA0luEiY05in6UypMzmYHqWuhIMD6CptFyim0eEEMW2B3ZI+1M
         vd/v0/7DzZaWZiALrfdHv0p+KiQN5f7oqnjYYGSaYCNGFUeHIL/Qx7UXvc/usw71mCR6
         GLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743409421; x=1744014221;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z90mA7CwidsjC7fKWg5OtIg+rrVsIJQMjuYs20zPR4c=;
        b=J/oV46vEgLZ0Z30Kl0ZGyprNCV3qAonuiv0QqEC6/VsbR/SJ/zHxLYDUpef3wcr5nm
         Lu9v9HygpIjU2ghShBnqVhXJK+03YtnnXRPdqCR0+dq9MY4geo1NvoF9BO5Pu2hkxCiW
         Qhy0GcA9MfgtO5Ou8XWtlxogI9mq8uTjELDXZN58vTl2KJZSgBNBjCh/Dq9u2oLxw55b
         XR3zi22iCn0CxZkT50x1B/5L7322r/JwuLHUqYLoQ6afpNJgv3PhQ2lTiC2KLMHKyUOv
         SAxSJpWikG35tItLUHjiyQ/lCTfvkto4vCEeTyfVKTW8n3lSVFmWCwVetkrhIlgrTO+Y
         UNUA==
X-Forwarded-Encrypted: i=1; AJvYcCViN+3rFzZq3HZuJriZvR5+wasaLzTyIDgHZVCIFVRmLbKcd9TkEyVDaBxVOsXTpF2oV4t43p/9ewgzElE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8rNI3WgsTpYQ/nYidbdgvdv9bXSHE6z3g+sswdH81nBJPU/Uw
	Mg3szVF0giKgmlp9RwME9lomu976sNVHzWWFo/UgSH4JaEvGMKwmyLOIsbv0pXA=
X-Gm-Gg: ASbGncshDES9VNQH3z9eu074dT/uRgRT+FgP010TwWdx+LpDB4JFkBfCVhPXyrt7wpb
	M3CeqKEB4jvG435xPazPiLDTRrynxP3SNU4/Eu5ewvF5gSlUApbpFIyF4Vvr2HR3Ls9rn45HKB9
	57f8cFzDJ0h4WLcX57eyOWreIEdSRRnn0LfmRLSGnrR8O4t1lCbIwdtECE1forimNF1ehCOQ85x
	weVg2nsnSrR5wUvE8sbVi/u6zJfd1WJb6cgqW6TJJ1IsX71vYoLgNyYCY3PAlfOXGgnIc0SP2nx
	I72LsctS/MvCnwrC9IfgRUPdDN7WIm5UJOGaEPEXUsBV76WluWia7bnCplnR9S2OgilUFjeC9iC
	QxQxug4QuKg==
X-Google-Smtp-Source: AGHT+IHYCZsvLxxSRJILF12M9aB6H5w5fAhHW4arty7ZQG+n7V17Z3Fsr4dbK92tgKAzi47xfntmYQ==
X-Received: by 2002:a05:600c:468c:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43db61b52e5mr83031585e9.2.1743409421160;
        Mon, 31 Mar 2025 01:23:41 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a8e0asm10520079f8f.101.2025.03.31.01.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 01:23:40 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v2 0/2] media: MAINTAINERS: Add myself into venus/iris to
 maintain/review
Date: Mon, 31 Mar 2025 09:23:33 +0100
Message-Id: <20250331-b4-25-03-29-media-committers-venus-iris-maintainers-v2-0-036222fa383a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAZR6mcC/6WOQQ6DIBREr2JY9zcIWmtXvUfjAuGrPynQACVtj
 HcveoUuJpk3i5lZWcRAGNmtWlnATJG8KyBOFdOLcjMCmcJMcNFyKXoYGxAtcAnFWzSkQHtrKSU
 METK6dwQKFMEqcqloj3GUV2x6oy/dyErzK+BEn2P1MRReKCYfvseJXO/pf3u5Bg4cdc15NxmU+
 v4kp4I/+zCzYdu2H/N2yHL3AAAA
X-Change-ID: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b
To: stanimir.k.varbanov@gmail.com, hverkuil@xs4all.nl, 
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2

V2:
- EDITME: Remove Stan from venus +M per his indication he can't continue
  due to lack of appropriate test hardware.
- Apply trailers from Neil on patch #2
- Link to v1: https://lore.kernel.org/r/20250329-b4-25-03-29-media-committers-venus-iris-maintainers-v1-0-0ec1007fde3c@linaro.org

V1:
I'd like to help out getting patches reviewed and merged for both of these
drivers.

+M for venus
+R for iris

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
Bryan O'Donoghue (2):
      media: MAINTAINERS: Switch from venus Reviewer to Maintainer
      media: MAINTAINERS: Add myself to iris Reviewers

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250329-b4-25-03-29-media-committers-venus-iris-maintainers-eb38e49dc67b

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>

