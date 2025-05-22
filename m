Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3484F1FC3
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747873968; cv=none; b=LcR+KU+WeJu1aMDHYTOsU6cAQJFx8KIU9cPPA/e6H0PJTFFRNS2VgOUXSyoCvA2ugsMFB1wX2ZZPg995vcrsmkYFU6brEwAAMxadl2o++aql7U90dJRa57/ESSsCLmU7wBRXGkNHsJt7eQoDu8cINcF9ZsjXWE9DLnhypxMcmgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747873968; c=relaxed/simple;
	bh=Nj0oaU8mLI6JsD/SsrdB8S8QHF7uIvygOJtTwsy4SqA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CuNlM9pnaHnjoTNCuxhUfoU7MPM8/cFseczufBtYbGgRyNfYVNa6KpWhr7frzAGhU0C2EXf5wOJ1RgO4xe39/yznGlCDAH4ghK7fPCM9zob08MgwovtHMxotYyG2+sQmUEx9GH9SBhONtTRqxgW9rO5PfFvcCRrWrg8/+n+lOvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QlFn9Tji; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QlFn9Tji"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-231ecd4f2a5so48086115ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747873966; x=1748478766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cJQlCBgMKxVnCGlA5AHtUXhzdwlV+fBHPvTlZQt9ZHs=;
        b=QlFn9TjinGtAavrKGRd60edJeiPqc/3gPhZwR7zaW1g1fgCbVituKIq6LIEUauzZEw
         6vHzQrz0umh02Vq2DOJF2D+KU9gsROl88IbCuYQZ8vaT7i2f0RYuq9TjC25OXSwgJt4P
         kkbHnysIgTc6SzdIksJ2BWLhbSEzn5nxeK0cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747873966; x=1748478766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJQlCBgMKxVnCGlA5AHtUXhzdwlV+fBHPvTlZQt9ZHs=;
        b=xJB8wt8aFsUIlKuavZ4K+fJ48ClZf6P5ZAJIiKZ31sT3ysN9UK35f93h9P1Ij33Axt
         QvAjE3NXJIKS7nJbcHoKXF+QE5prPev/R9SGWEig622poEZmbiQ4GHTvN7Onc8blwns6
         xBY9w8yXhaNYfzjX5kBwH9wRBIljiwCHGapJkN0hIxMWWpUU6pah+bCLc6pevRzGOWju
         +zdZS2+H5+zFc/erUcQRUYEMiNmog3j7Inb8rH/NNu97K2d0QAB1JVyE7FFQuFBh9xFr
         /eKYtNvpnhqUL0hI/GMf1kzghJUwPuQHkW3DCnO8vB46CUv1IR+KXJjjF5E6bStXUOjA
         luJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMMiFxVhnx3hXiSzfuBrVt+sZQ4r8tyjz4nUOI3W55pFOtnyxs29c7arJ/3KkBp+oQ4oY0gim+YiGLh5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxygKwWZdrtDAsDvQ5hA51z7ujZxub8Qgx+sR2WB39kNXbMZmoN
	xvAwDLTwZXIo4UQC4SprU7NqeyNT/5zt6RMxnAMPb4r3kNwPVyxyzsVyOBl5asM4aA==
X-Gm-Gg: ASbGncs5TKG41R3cCMeXQVqohgTMlhOODf6qGY8NoRWP1xfa/n2eCNnOeZHHgCHu9m9
	cEOfxXGY8M0s4HyiFZ3G6JROvS40XMbbLcIdhcMiFNZbDTv6SWzp+YVmPELk5rWfRihkQDAgyFG
	jjixsnhMNKuYUEw7DUQIEzzAS8qh9cfwOozj54IQ3Ga/DXPAbMlh/ITFyLsa6U5EB/0KAvXxdYI
	Zn51YTPlcPSJbvLydWBKwQSplQx1tcybxTxRXRiCBS39mbwCI830D/rPG4bHmwm0zMmElBdaIfe
	fASM+j8BTSzWMlFe5DNAxAqM2Oq1+FrVZEFd9DpJdlJFg17FgvVYaKIIJ4nu+84LTKT1m1785Di
	pu6cqDPUjv6JzUcb5EdzjZ2tjk+tgFkKhC1cViX8lGTWtcQ==
X-Google-Smtp-Source: AGHT+IG9arK5ea9sb8GlR9SitolOFjKDHPUKWGdQpJsDF56tIan8HGB+TbCaWPto7usl6Lqv7NWNZQ==
X-Received: by 2002:a17:902:ce10:b0:225:adf8:8634 with SMTP id d9443c01a7336-231de37f1c7mr271557825ad.51.1747873966455;
        Wed, 21 May 2025 17:32:46 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e14:7:2f59:8b3f:3a15:ff9a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97801sm98574755ad.133.2025.05.21.17.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 17:32:45 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel-edp: Clarify the `prepare_to_enable` description in comments
Date: Wed, 21 May 2025 17:32:05 -0700
Message-ID: <20250521173204.1.Ic0375a9360698592f27afbf1f60f4996d504ed4f@changeid>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It's unclear why I originally wrote in the description of
`prepare_to_enable` that "This is not specified in a standard way on
eDP timing diagrams" and then also wrote "It is effectively the time
from HPD going high till you can turn on the backlight." It seems
pretty clear that it's (T4+T5+T6+T8)-min. Either I was confused when I
wrote this or I was looking at some strange panel datasheet that I can
no longer find.

Update the description of the field so it's easier for people to fill
this in. Couch the description with "usually" in case there really was
some weird datasheet where things were specified in a different way.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-edp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9adbe0f11421..74f5f9006a5b 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -113,7 +113,7 @@ struct panel_delay {
 	 *     // do fixed enable delay
 	 *     // enforce prepare_to_enable min time
 	 *
-	 * This is not specified in a standard way on eDP timing diagrams.
+	 * This is usually (T4+T5+T6+T8)-min on eDP timing diagrams.
 	 * It is effectively the time from HPD going high till you can
 	 * turn on the backlight.
 	 */
-- 
2.49.0.1151.ga128411c76-goog

