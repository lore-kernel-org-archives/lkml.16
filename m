Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3098B23E351
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 20:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744145436; cv=none; b=KYpCFUu+XKarviWxGJO0i4qsEsCU5ExXKYdo2P0+9iGAwcO8US1i8q1io0OR0MWkMKUaTHPLOFCEy+3RI24MM7y8bnRsray3E0QcWWlCbGeTCgI/4o5+V3oHh9zQYoZ1Ig/C9kSLyZv++h8l7CYJSmLfT6x2Od3RZPC0ZdKS8b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744145436; c=relaxed/simple;
	bh=8P9HdtuuJEcYjisIpBzJjU4A/0Fv9PbdTpy10z/2Wwk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dWl1W2NkZOCLkLRT0iFeMHdLvtB1xPbhtlY8Xw0/k0YCmfPVBtMt97fH7MCaEp5nVVoIlYUpyEfOdxtHFY5OywBWhhweXMDuTU+pdC2X1bFFx+OBdhaoPcuUJFrg9M0Ba9HeO2DzsqX2qBmqqzHUZYkFkMb9JR3fK7epajyYOXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sYj25Yay; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sYj25Yay"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so5029879f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 13:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744145432; x=1744750232; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ISeBfv1lorqaekgIceJMICGTv4GtIv7vI6GAFDIKa+s=;
        b=sYj25Yay+6M0fYGj322VyqjTmQoJZ/a7NXQpdXXCOSf9i6rE7ii5GpyIUZ1WYUZin1
         XpEJad8WwhLwzvjV2cvxvUZVYktoMpgoElFAaZdoEX8RfXyoBJcYZhwNJlN2fDJYDYm9
         PGUvDisSa99StrJ9wn+LCkQrj0506qcN6YunLVWbMeJFGbIX/r9DKu+ei3BK8JaCPHnV
         DP6Kub4LmN93Z0aPHFdgQjs1T+nR4hKAEKiKm996ydnqvCLcdeaI4JLpUPbePHH9vRyS
         GxHFuFqYcGgqccvPLlQXWu/i9Mmqw2lT3Gogx/nz6szMzotF2dx1c+nwdK6Vr18LU0kf
         Tpzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145432; x=1744750232;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ISeBfv1lorqaekgIceJMICGTv4GtIv7vI6GAFDIKa+s=;
        b=IhTHMbo3aS08UeDcBjRRvU+MGW2hwd7BRUK+ZH1O2yMtNi+sI3HoNwJBtPU6ijelob
         OI26Va+cDB4dmHBqu96Kc7bsG4+SO12OLo/X8Klyt4nbhm8tSm/fY8ZiprONgQt/tszX
         KU4iNrpvRjcdrtwtmSZyoqsWNJHLuO7+YGgDJtq3Wz4mNBo9Y7aSxFFozAduK3xWVD+c
         3aQyaPSWbfkKjrjhMc66OA0yP8UzVdwG95zb56Ex+YdiuVtlMyAkQ/b+N+KWX/Hmqk7p
         SqK+43rqKCN9Rc4Kd8fb398B36AJJAaAtZoa6GfJ5uIwiFXmfI/oUnGz0gQ9/hhJ8P3Z
         27Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUr/22DhqTdYKSz7m9T39vpo0aVkRwWkzniyTv0WpBPPWoOo+lhPtlaYveLVMOofPJoZILqcMbda6Z2/Sg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxXZDxzXfVQ6WQRUQ1/P8MUjLKgwNS4pt/tgZwNTb52xIXnVo3
	G5Faq/YGJbHxEXis4D5oTkOLG/eU+FCeSOs2u2URK0PicwLEU/P3GTmaOBatxuh2MKpV+X666Ih
	v
X-Gm-Gg: ASbGncuWLliYEmHovKMx0M+6YDpVsvHUm5OAQCdCyvo3mMr7q3X3CnGfPPjijN/7H+M
	MALsLc6jDNlVUKF4K9kxy5wyBXP7xR5AgndtoQHQ0WLoOOxWymiis+etCRQwog/Py2GxvUYiHKa
	ga3Mbn2WqRuIIuWiVtC8SVuwmadGWLRsIG8Sq6/LeAskh46ec1F2NzhafGlVrnfm0GqmxIayDIa
	mkBERKrOGTBlaz0M+8NFVzLdGeWEDAq1+FTPcx7EHcw+j+5LFM0JpnPvRkdNEArg7F6fTcd+Ex6
	frWtXNwVlADqGeuW9bK/aQC6zZI0ftGCflhAG2pldAYaWgJoA1nlsOSVCFumB6zTly3I/5sQtOZ
	PjL+HSFfU1fZFhuiEvy4As9t3EiJKcrP/
X-Google-Smtp-Source: AGHT+IG5W28GZiheanSviQoo3X3XSZbhL0agfFNkdxCO9+pBFRUz1xd/X+1aybGSx+mUbqFZukSxCg==
X-Received: by 2002:a05:6000:178d:b0:39c:16a0:feef with SMTP id ffacd0b85a97d-39d885617e8mr103923f8f.38.1744145431309;
        Tue, 08 Apr 2025 13:50:31 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226da7sm16367156f8f.98.2025.04.08.13.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:50:30 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH 0/2] iio: dac: adi-axi-dac: fix for wrong bus read
Date: Tue, 08 Apr 2025 22:48:59 +0200
Message-Id: <20250408-ad3552r-fix-bus-read-v1-0-37add66aeb08@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALuL9WcC/x2MQQqAMAzAviI9W9iqE/Er4mFzVXuZ0qEI4t8dH
 kNIHsiswhmG6gHlS7LsqYCtK5g3n1ZGiYWBDDnTmh59bJwjxUVuDGdGZR/ROqKOaAmRApT0UC7
 +347T+37aals7ZgAAAA==
X-Change-ID: 20250408-ad3552r-fix-bus-read-1522622fbd2b
To: Nuno Sa <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=8P9HdtuuJEcYjisIpBzJjU4A/0Fv9PbdTpy10z/2Wwk=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/2n0o45aYa62LS1JW7YIepQmeyTaqlTcrz/DN31okP
 p3DUMu8o5SFQYyLQVZMkaUuMcIk9HaolPICxtkwc1iZQIYwcHEKwETydRgZHv5+8vduyevlYfEn
 XDvsGxXedwSdnGXpYB9045Ht6gNx+YwM3yYed7RKy089vpYt7PI0rYr4/44cEdfevn0w4e8bxsw
 SXgA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

This patchset is intended to fix a random wrong chip ID read, or a
scratchpad test mismatch, tests done in the ad3552r-hs driver probe. The 
bus "read" operation must always check for busy flag before reading.

First patch reorganizes a bit the busy-wait polling code, second patch
fixes the wrong bus read occurence. 

NOTE: due to ongoing changes in adi-axi-dac.c, this patch is intended to be
applied after the linked "ramp generator" patch.

Link: https://lore.kernel.org/linux-iio/20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Angelo Dureghello (2):
      iio: dac: adi-axi-dac: use unique bus free check
      iio: dac: adi-axi-dac: fix bus read

 drivers/iio/dac/adi-axi-dac.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)
---
base-commit: 6fb85f14853ddde06d57030c753168402bf69cd9
change-id: 20250408-ad3552r-fix-bus-read-1522622fbd2b

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

