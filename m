Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBB627FB31
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771988; cv=none; b=fQL4oP+BaFvdy+0WV7VyZZbeyBRg4FZGZqh9aOu4dyiO33R5zgL7F+whuAn8KnMK0VRP9y9Mz5JS6rwlt3QtvMP/gzaDnkPz9kIh7wq/GfPPbZES+OkFx5Qe86qp9KQ8m19rQcU+qh/MutTa+qKAQ3JSAAVlM1Cu/RS4kmFoZ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771988; c=relaxed/simple;
	bh=2aYjxn/XjyqfROJtwhDsYywKfhT/JjZo+9HmvBofW1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BH4gZeNxmOz6ZCOXSOQ1HvhyUhAXIX6xjBxQUZ3ez4c9Qd3zb55Oa3pP2YcyH1orRBteYNXyhh6SieSNx3+/Frpc+/yb8LQ074O038kHEDXbj89dyVANSPEk++j5+s7C/QyUewVJCsqB8cnCZEe9mPLXRPKj8tmTl6jw+IZ30yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=K/ReQUi3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="K/ReQUi3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acbb85ce788so87001266b.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750771985; x=1751376785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tkj6v/oyYjnLDQvdndgBTk2Muh6SQTWgkcZpBQ/t9Hg=;
        b=K/ReQUi3eOOJcY1jqxMDEaPmV8o/99W2V21rfnkTbPHZBkJL70o+rihqgCxoynfV0m
         EwZFTtQXi9Qenv+w4ZKIRfxQYZXycEnsb5dlofEYuDhrljHNypCqQ1TmXCB5Mjvodej5
         05vro4Rk4zdHEv7uC3l0wjr48IgKTuaH5+3/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771985; x=1751376785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tkj6v/oyYjnLDQvdndgBTk2Muh6SQTWgkcZpBQ/t9Hg=;
        b=T0XhEukll8QshC72r+GX6aDZ0IRhnhSzcTaupMgelQRxwdpfoySZJa5CQ2fVdZV19W
         Cbw2lrGRupzmLlRzJKs8cMQLGmI0uAFh+XaKKhBDLIEvRmdVDYAW4dqsRsS/ItcKdpF0
         +rAc7EMFJ5KD9lTPHs3unw4iKlhUboPtiPcda89J+2Y+VFIion+8kArnTWNJFimeDzKw
         a1Hwyo4o6DIR+4eYU1RCqIY6ftni16rv5tkamiBb/gYnL8l/hPXLZNgBJeOkt1EZHaSy
         OD2bOI3Y3/hxCfbCq3bAIERrBn7hi3hdpWWz+qlyjnUl9nOmoW3dLgdkto+QZ3XEHaS3
         XQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjWtyntUB6m4979HaaBSDfwggGlfICTEb9LSV/oI7b0DKGumMxSzdVqIy+SYKGOw5TWe9D+pnhw/HO8I8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOgoOG7z1oWqGSJvYCwCJQmj7BWwt5bMoi639V59rvPnQ8efKn
	8LlKP5zO0EhMSWkM+vJG8Vv+DrZGl/gb+MR5NdWFcPgFcNieEex6UI8MIHotI+pqaQ==
X-Gm-Gg: ASbGncvTHibmzh6Mbtn9nZVq2SFmlL5Di6FYB37v5Q9XuKOTYqmWnCXTzc6qyrN1Oad
	49SL4Q/Shue3MoPZjskFcu76m/UxYTAO9nDUKFHR4k7h2mXLqFwc4ZXVPAXC61lvLyjvRpEUij6
	rJ1qnsJ9M5HbcYtgexkGkPviFhAC9meAi5PFf8oL+ez7PFB/5xqfg4Bzf/cRk53iVuqk6W2L+nq
	Djn+Hw94gciqUbxnxgEzfonY7oFVirYZO25RL444hnqhU9DO1HCSqH9BOjoFlyhWD1gopNgsCTP
	NcLqdodzy3dsIKRxjNnFjL26/0N21FyjezlTXVvwZcs3/mWTx+KnpOtDM1M93JT3Jl4uZlzemrC
	cjkdAeCgKwWX/5glTuN9vA/dU0A6xdezZRoz4RJHkvEg6iTtXKZz0
X-Google-Smtp-Source: AGHT+IEe0SD7CtPOT2GsU04+3bSuhfq+kqQCtC4tVp5owq6ZynhgbyzhdLvK/T4ZiLjHJSHP8BIZCw==
X-Received: by 2002:a17:907:948a:b0:ade:bf32:b05a with SMTP id a640c23a62f3a-ae0576a05f2mr1363893566b.0.1750771985028;
        Tue, 24 Jun 2025 06:33:05 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053edc0f5sm888265966b.59.2025.06.24.06.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:33:04 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jos Wang <joswang@lenovo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH] usb: typec: displayport: Fix potential deadlock
Date: Tue, 24 Jun 2025 13:32:46 +0000
Message-ID: <20250624133246.3936737-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The deadlock can occur due to a recursive lock acquisition of
`cros_typec_altmode_data::mutex`.
The call chain is as follows:
1. cros_typec_altmode_work() acquires the mutex
2. typec_altmode_vdm() -> dp_altmode_vdm() ->
3. typec_altmode_exit() -> cros_typec_altmode_exit()
4. cros_typec_altmode_exit() attempts to acquire the mutex again

To prevent this, defer the `typec_altmode_exit()` call by scheduling
it rather than calling it directly from within the mutex-protected
context.

Cc: stable@vger.kernel.org
Fixes: b4b38ffb38c9 ("usb: typec: displayport: Receive DP Status Update NAK request exit dp altmode")
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index b09b58d7311d..2abbe4de3216 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -394,8 +394,7 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 	case CMDT_RSP_NAK:
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
-			if (typec_altmode_exit(alt))
-				dev_err(&dp->alt->dev, "Exit Mode Failed!\n");
+			dp->state = DP_STATE_EXIT;
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = 0;
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

