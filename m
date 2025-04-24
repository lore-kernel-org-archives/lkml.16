Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3830291158
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745513459; cv=none; b=hTgFa0QgiELBqlSy9yoAoa3DGvtKlLICoAH8OSaFPmRNiOHJqP8X+PPEDkfOssUdzSGtoGVPeLVWbqKLxFOlTD6rg8wD0Jwr2uy6mPvSwzPHUw2dG8hnJGp+VT3jN7RCp42gMas53xDk3oGTAMO3w/+CsEkz95AIBr6z5rin2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745513459; c=relaxed/simple;
	bh=XrmOcDsptBdldttLyIXtr04zz3J2K3l1Im+6+tV5Kug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBvMcW4IIO+4v4JWaTqRuaWBLGlnZ4DdN6e/gJgwJMzHVRDmyKwCt1n4bHxDiGprbHv/o8509nKYUiFSkY47oylpXgC8BCmD60ZI61qPIyWV8NxYmoEwJdsJeHE5yI+K1n24e0PD6phNx3sO5MyFs1kg/vZ3Wth3uXkwex1Ma7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=jG2ZwAxz; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="jG2ZwAxz"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-400fa6eafa9so949050b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1745513456; x=1746118256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wByEINYJd0q8686qKYCNqB/r8M3VXqTUYfl1z8pH8qc=;
        b=jG2ZwAxzGk2h58fSweA4BXlMvcZ8fo+90yM5yZWmP/GLZUHu93J2I8MWORkPWF/O/I
         cgXSId0ZG7+qMmKDJW0Kv1bkGTnRA468XK/UShK95kCT9TDpiCIFw4Df0eHtL6o+oGow
         UkKq5ea6WLm4OCtlG53pc2nge8QFDTEqbquAoyL5eu49pHJozZmaKP+sF+FVctnkfTSD
         B1s9QilsK4zWo0O+2XWV7931hkvrE01GIrwGaxlRD1NdNrgCN50kEED6EJiPkV3pTMpY
         vc+gGuHIsEvMRXIcmM/cH44zPw0SDdskApEaDZ5Sv78DCWBO4OXds+fghxnkGAtu+HbQ
         IpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513456; x=1746118256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wByEINYJd0q8686qKYCNqB/r8M3VXqTUYfl1z8pH8qc=;
        b=cXmuElpkLPH0S3BjfBJhGR6jvD413VOXAOElxD8XLn/ix19LaXxJ9s9Ec2oPNyKHPq
         gZqYWtIhYMiAdZ36lZ2tQ3CdY06CGd484L8mo2wurbZcMYQHQXAbXYw19jYrozNuEBQP
         VndX+Y5EKpRSYYS2QNl8TtxTVmlhMGn8Xo4vhGDuv+z7tkRKU3/5ioaad6dD05i74/b/
         x5OdOa8RPPANS8mXauPz6G8n/anP5mJ+k/PZvtnwQJUm/V50Sz2jZwzRJuNW0PcRmnhl
         aEY2I0/dheocrWrrOYRPc3EB3SKTXI5hzi7mn2VHJF3TcQ4+/5F0tWIcLAevGHqvAWJa
         Dt0A==
X-Gm-Message-State: AOJu0Yy7BzDfxfU6yhF0gET+c5kIm7bAcQwhk7TR3o0QsOdnJiOxoH00
	bHB6qCSiAnCQgn3NIjag3q7J+DKqDzN8tB0wX98PSnZz3DElZ46O6WSnIk84DjONvltxDcvceB4
	l
X-Gm-Gg: ASbGnctdUUsSZok2xrNv0Q7AY/G20l2jptsX99iulBW883EPNIdKH4xDT+W5XnxNmfX
	Mm/MEgoMuJgoldmilThTjxka37e24vjkFV1QC5VC5QNpbJaozU0le2Xs4TPDFTmSKrXrXhexYvZ
	Hg7E9Z+Y3hVzh1p6TTOPCur7kzJPqo4xwgYQr6yKyN5HwKBqHqfmMIh9Pp2EkRwuhrYG0qkPcBy
	3PUaviY0as+dkaO+c8r0HfDZs3eGu5uLkuH728keQiOowxCwjYoYYMrUygvRuDE2EES05fUwbYd
	1fjkoSG3jJBwWRQ1JPyR27X06FbloYuwfl4=
X-Google-Smtp-Source: AGHT+IHOkaOe8SUFZce7EwkwL3Qq0QHY9K0s47gF8ITRNwmFE/6ljSaVw0y2q6bH3+tIlQTgvwm2aQ==
X-Received: by 2002:a05:6808:f8d:b0:3f3:d802:14f1 with SMTP id 5614622812f47-401eb2979c8mr1843460b6e.12.1745513456357;
        Thu, 24 Apr 2025 09:50:56 -0700 (PDT)
Received: from localhost ([2001:470:b8f6:1b:af2e:7abf:8abe:2726])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-60646862ec5sm319870eaf.3.2025.04.24.09.50.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 09:50:54 -0700 (PDT)
From: Corey Minyard <corey@minyard.net>
To: linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	Rik van Riel <riel@surriel.com>
Cc: "Paul E . McKenney" <paulmck@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Corey Minyard <corey@minyard.net>,
	Corey Minyard <cminyard@mvista.com>
Subject: [PATCH 16/23] ipmi:msghandler: Shut down lower layer first at unregister
Date: Thu, 24 Apr 2025 11:49:53 -0500
Message-ID: <20250424165020.627193-17-corey@minyard.net>
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

This makes sure any outstanding messages are returned to the user before
the interface is cleaned up.

Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index 927556ca469d..56654a9c5cf7 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -3738,7 +3738,13 @@ void ipmi_unregister_smi(struct ipmi_smi *intf)
 	list_del(&intf->link);
 	mutex_unlock(&ipmi_interfaces_mutex);
 
-	/* At this point no users can be added to the interface. */
+	/*
+	 * At this point no users can be added to the interface and no
+	 * new messages can be sent.
+	 */
+
+	if (intf->handlers->shutdown)
+		intf->handlers->shutdown(intf->send_info);
 
 	device_remove_file(intf->si_dev, &intf->nr_msgs_devattr);
 	device_remove_file(intf->si_dev, &intf->nr_users_devattr);
@@ -3761,9 +3767,6 @@ void ipmi_unregister_smi(struct ipmi_smi *intf)
 	}
 	mutex_unlock(&intf->users_mutex);
 
-	if (intf->handlers->shutdown)
-		intf->handlers->shutdown(intf->send_info);
-
 	cleanup_smi_msgs(intf);
 
 	ipmi_bmc_unregister(intf);
-- 
2.43.0

