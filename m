Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3167292926
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513470; cv=none; b=TvVijaXG4S69Tiic1apXPwdPzCSWk1qq/kLInMPD2YR+9J0s/QMwPo+SO2hpRNFSGDASRKOi3rUAiDrDCwd2k1Lbp0ZS2TjGCHv9w1kd8TsOczqxNbHi/e2p4Tykn7aOVK3k5eUzIWX5IrXrX9pMpRO0kcYPwLxQWa/byGzNZUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513470; c=relaxed/simple;
	bh=WrUUd8PeFU5uY5s2F7LwC7QUGE14MD2LZ0JwIjCHlF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F69YC5OD6rM47/NG0msNutr/eZMAMeL/H2UFowwbd6ju+KICIJlKXb3xuYNN3OfC2R8WiocwZ157LTOhKNl63aUZziK7n1lkwOvNTIPuROa2neeLxrjddeTfEiOUZk9KJZ6PytKaIcm/dkjROyOnp3dslH2uFGFPgHaX/Hh45aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=suhfNA5D; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="suhfNA5D"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3fbaa18b810so398988b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513467; x=1746118267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEgmX4f34QPktqncOkt/LqJb044C3ijlTJNnknUvSOY=;
        b=suhfNA5DoxDibeEFSha2urmloWwlZVYn2324wdCXQBlIsr+iyqU0OdaCOW3PcPNFrZ
         EZRuiIKh0LCYLR2puzRfcrDw1asBNsa6csDNemR2umiXK0W4RGY5SzSKvvFTbPINbcud
         rU16l3lfGJyYX1Q7vZ9FxYdcqHiBz2KxPGJ3SCOFsgHPWDHota8La5N46JGZmS3WazwQ
         2u46GlS5vgUwFiXMGfCPuukYJz+7nNkMr4VJD6vBannkOYFE577mDfNB+GegpgsPEkno
         EQS5KQ6YK12Q4PKp6abndQvCC2flYKfDMi9vVv76FueXXVcKY5EqqAmAlWTiw9WGkQ9u
         8FUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513467; x=1746118267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEgmX4f34QPktqncOkt/LqJb044C3ijlTJNnknUvSOY=;
        b=IRYAuJGY1QF7et+zrZEr43jj5qEg1VHDbEUVgYzjyBJtjO7UNixLtJdFaqyBGqvb1x
         4UVT0TmHFokDg4wwqaetk6R8QUQNakk719HJXaIN9S7sAKURLKfM/cW5Cjt7TQrpg5nK
         6vmLFLHMxsVk/bQhNVFFe5sJ+fYJ48SyEVfM39E3KpumQsrzBL+7sqZzu3KG+HVW/pKh
         qdRxnHnFaVvFB2v+6SWXvjfMnRay1Iu7zf+hmKF1IVU6aUuX9wfy3M9H/8iG+2djITzv
         De+pcQ0GfjpRuIZk8mSoyBYljRPsapxNW2ETdbaAcY0X2PQlkzt0/mGNvvyf2Gn7P4mQ
         DqxQ==
X-Gm-Message-State: AOJu0YwkCicbi951aBA2667OPFdp9UhSwQrSBIvEcqi4ycMwO+WoamHX
	YyLanhOmJaTPOnpSdDuEDrsIR4Vy/ABDuA5RNFUvEAh7+yBklTIIubfaC4EeDb6TrxJUOCdM+RF
	5
X-Gm-Gg: ASbGncvIy2sl9iYwlThXEGkmg2WyfwwB8xW5DITkdfoq7fZoOodXAc6kfXdVICZxLpM
	D3asxeASgSG3fOzwXfdvfwu6nrfradBC0cXA3Ksb0ZVMITGF4IdtD9DRR17tNjg89IpNrc+axfW
	Yr2xEzJ8bKvirwl/6pvTHFHWfjDNNITBTP7q/xvPKoR/jmndqSRrleZx8nJepgvwZvMj56x2gPP
	lJsrMRxdZ/GdSmFzNBo9g1D8zl2jy5460FJ1aeOEXrA3uAZRkmY/7qJGJ8tHxHykPTUdGlxHF1s
	qRw3jme5h5kerPeAs7Sh5loNFP5AXiR5OqI=
X-Google-Smtp-Source: AGHT+IFA+1xug8uO+8nNHepTDHInLcjGUEuwr/mAK1O/1ugsuMGJlyeEY1wGHZCMW93FOccptNFEqw==
X-Received: by 2002:a05:6808:164a:b0:3f6:a476:f7d3 with SMTP id 5614622812f47-401f117f330mr93378b6e.9.1745513467172;
        Thu, 24 Apr 2025 09:51:07 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-401ec8c9dd3sm308500b6e.11.2025.04.24.09.51.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:51:05 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 21/23] Documentation:ipmi: Remove comments about interrupt level
Date: Thu, 24 Apr 2025 11:49:58 -0500
Message-ID: <20250424165020.627193-22-corey@minyard.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424165020.627193-1-corey@minyard.net>
References: <20250424165020.627193-1-corey@minyard.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Callbacks no longer run at interrupt level or bh, so remove those
comments.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 Documentation/driver-api/ipmi.rst | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/ipmi.rst b/Documentation/driver-api/ipmi.rst
index dfa021eacd63..3a533cd2ef60 100644
--- a/Documentation/driver-api/ipmi.rst
+++ b/Documentation/driver-api/ipmi.rst
@@ -280,10 +280,8 @@ Creating the User
 To use the message handler, you must first create a user using
 ipmi_create_user.  The interface number specifies which SMI you want
 to connect to, and you must supply callback functions to be called
-when data comes in.  The callback function can run at interrupt level,
-so be careful using the callbacks.  This also allows to you pass in a
-piece of data, the handler_data, that will be passed back to you on
-all calls.
+when data comes in.  This also allows to you pass in a piece of data,
+the handler_data, that will be passed back to you on all calls.
 
 Once you are done, call ipmi_destroy_user() to get rid of the user.
 
@@ -303,8 +301,7 @@ use it for anything you like.
 
 Responses come back in the function pointed to by the ipmi_recv_hndl
 field of the "handler" that you passed in to ipmi_create_user().
-Remember again, these may be running at interrupt level.  Remember to
-look at the receive type, too.
+Remember to look at the receive type, too.
 
 From userland, you fill out an ipmi_req_t structure and use the
 IPMICTL_SEND_COMMAND ioctl.  For incoming stuff, you can use select()
-- 
2.43.0

