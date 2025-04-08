Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B877D255222
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150850; cv=none; b=Fe9NywYCnsmlxEN9KoRaKjfbuI4xKzsPwww1DXJJNTzvdLixl/MwqduZkS/mYVVdeqCEwLyaK0r5E6uJ+7/S2vFrNkHzyshwQMPVNZTvm2NOD5hM0wrPpMYGY8gDJfjoab0XEhSpXx/im0L5BC94mdsOjdAuZ5fAfcBZKisp6uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150850; c=relaxed/simple;
	bh=vlFhX2oXyFRY+t2vPp7ftYiWu5/FCrps8KCWGJv+E18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BiuGDxFV3MLqHbbrh26iKQ8tPquUHBNrVXYXZA8Ewrf/RmrcH8sJd98LAGrXLqG+J678j+qMrubOQ6lATG9+BD3R1SXbIjZn8gEnoyHpM/YdFRLk4tNDopl9U7hYRuLRZ5KRKGCM9m6BEfF8oQQhbvMTXjjf+8vAoZCksb4PhbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=KPtjbkPw; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="KPtjbkPw"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb2so2901447a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150848; x=1744755648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4K/BByDkY9tMF7eLVzb1A3mqI97/QyN2sINTR+3LN1U=;
        b=KPtjbkPwaq2wVk4BU+hLQKm3aATV2KQWDtL5H3B/p8R8xlj3jSUluEXeAnk6kvIB2J
         oGGyrV3jSLjc5GGMEJcjyFy89qW0Bcg/Mk1bWlEOOhJHG0+Gpt1GcQbtLDEPxgRuTv8X
         PVeS5WKy8BWUkOC7K3KVXsDf9hb7nfUiOgjZlaD05+EAaYirACSFw2/Uoj0J+M73YQtS
         OSG8PdvSiT6TtmLJut5CDaSiywS/clcsDbB01/u+BiOCmv1Rin2POj3IPkEJBTsTmpC8
         gmSWRiYUFcUGb1Rg7vtuViiKhYxV4kIcc1nvPlVuJHeAau/7WMtZnh8nFOBMUCTO+5Gr
         mf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150848; x=1744755648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4K/BByDkY9tMF7eLVzb1A3mqI97/QyN2sINTR+3LN1U=;
        b=XmFwKy70aNv3Wdg9MLEpjVne5Heblcpv0cNDBybT0leV8n9AYiCinLDS9Wm2hh0b8r
         OlE1GbBaqW1GYRqIvNY6XJfXlPfGE9K05wriGFQff+GTllKhO0+0jWQHW39YMV0qW20e
         XAFGO5IRZG2BDDDjmV9Rum29dZ8lqMc36v5Eqh/vLuvdgVwivpq3OHXbMTtOstKj+oad
         sPLqGh5xTGqBQQuWUjL6xqvHNpRPE5ZE1/9UqFfoskDljlscQ5RGuQHpymvNfTHPhjpd
         KeB40Bl5zhr6a5XqOmkB+G8e8+kWC43xaIIkjW2pqaZLa8INJ+rFUBPLvoWIglMBeqXP
         qmTA==
X-Forwarded-Encrypted: i=1; AJvYcCWauVGHlppKQPi6GREpPwX4q1zVoBATNOjmSguZKYeaiEvJwSSX3dgjMikcGSQcuBEkG6dWC69Sh/IcSg8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBNQEklfnE6CVTPLCGoY/1UaZEcqSJ8lz8HzVUntNVtF6y8T6z
	DqCObMQpd88mWa4yxuQ/Ge0SKcqJwNz0d6bUf84UWUcoX0kNv/zCHqW4yQHVt/rpL/l3PnszBkU
	=
X-Gm-Gg: ASbGncsinroGhgyZEIjk7moGR3OG3MG+CBSGWRlv/40lBb+ZlIQZo9PiBMW40dB9LLz
	4KPSGky6p9Wvu29pPjc1R4SXVed5WJApdJGmZLBv87dIx1r66Dqzz19A6uDUxGV9iE8E3KfHm4G
	SNbA9fCs/juuu0Yo6iC30vAx3573xzSCUmWPF8fwF28WK/Virsb2VEQ67LWdnDG8LDewLqH5YhR
	boWASu7LnpRWx09/ybvSnS09YATdVg5FmoDrs36F8kbKZ3umiB8qvShbsmCeAW9mYuI4hII2ZJ6
	nWOo5I93oDoN1DYVpWIHdflwsgV523muM43JjpyE9KIMsG9coUFuG5b2y9qsXFa6sYZbN/w39jT
	Am93msKUOCRJ6ByGIIkSs
X-Google-Smtp-Source: AGHT+IEEOyBKP38UsaWM/G2m65kib0whNND2QWoqnx1R0FChgSaHvXmmYfZgvcm3X3i1vRetB93mHw==
X-Received: by 2002:a17:90b:58e7:b0:305:2d9d:81c9 with SMTP id 98e67ed59e1d1-306dbbbefefmr1332737a91.16.1744150847945;
        Tue, 08 Apr 2025 15:20:47 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e996sm89049a91.20.2025.04.08.15.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:47 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 03/14] staging: gbip: Alignment should match open parens
Date: Tue,  8 Apr 2025 22:20:29 +0000
Message-ID: <20250408222040.186881-4-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch

CHECK: Alignment should match open parenthesis

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 67bf125645c0..16cc5333beba 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -26,7 +26,7 @@ static struct usb_interface *agilent_82357a_driver_interfaces[MAX_NUM_82357A_INT
 static DEFINE_MUTEX(agilent_82357a_hotplug_lock); // protect board insertion and removal
 
 static unsigned int agilent_82357a_update_status(struct gpib_board *board,
-						unsigned int clear_mask);
+						 unsigned int clear_mask);
 
 static int agilent_82357a_take_control_internal(struct gpib_board *board, int synchronous);
 
-- 
2.43.0

