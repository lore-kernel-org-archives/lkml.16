Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1122512E5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744899935; cv=none; b=IUKmOOoFbkeuxd02M8Cbcy5jN3kd1GDo40coHrlYIcCw50FLjRh8dPN+fZ9dhrFJPuz4JXywFKtYPh/gPk+DkmPMyV52vkW/v8gVKFLK2pxroTiEye4nilTW8cEoCywnFCZ3G3NiVDdEM1TKOaIM+zBmK6W6NfWbNeMCJcZ5BsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744899935; c=relaxed/simple;
	bh=11I5c3B4eQ1BcFsYiRplOZ21OUdijMolETfdBI+z3kk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JWx7MEcUc2Fa/OxUZreby1SUiS/1+1Qsp5Ti0nNpRqbcZM+DdiHSJBI4s99jxYDhwJIKQwTXUiMZiOg9jnc6XaN2631HML+Aizi9L/4CdVxIW3oMDE+V3u5HIE+/zv6cReTSeg5XRTaAiQGcsI0uFgAOa/JsZZ5wEYbbvg4WKb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m0kbnqPO; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m0kbnqPO"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54996d30bfbso786401e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899931; x=1745504731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HatUJR7pfydRpRerJllcyKfpU70Imz3ne8kyK9KNniw=;
        b=m0kbnqPOAMJPV3/vS6sdpfL4TcMf3eVhJ9HCUOP/jOVcEufZFrZCu+crRXERIR7r4/
         Q6HlN8lG0muHRu8d/flQSIqQQOR/dXJbm3pWBtRAsUss7iaEdH1QV+9W7eNUeyyURS+3
         4H6CNAedvkwlc9FqrBrCZ6hlBP0KKGsAvEPMS81p5n/v5ZXAh/x39Nbxyj6XCVLaxBg8
         YNtMcx0GUNtHDFYzTZKaGAtI3wgHHCeJY6+8Z7DIhgTsy4PT2gnuBeNTOjdZHu06CXxT
         r0eY/0opIyAKZLA+YsN2vhwMObffjeqMFFjH56PcUYTISnzrD2+ub7y5GFSlaT0fJ3qL
         kR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899931; x=1745504731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HatUJR7pfydRpRerJllcyKfpU70Imz3ne8kyK9KNniw=;
        b=B26RfuMtiYoReev9fuhT9/M7mrgcRX/l/Cf8yYPIReVLFNHh8hlVT3cMmhPAw12NGG
         22Y4xTL+flEmtCLbgSE5BoeJtGzzAkVDqH+cWUzmHvFMVfpImWvDldrKfswxkNoptOrq
         1/vSfrmXiW8HgQQ5Mjp+lui0PL8OjZ+EZEMj3uM7keAIs1wCLyIphBWSibmbHrIf+a/l
         dHQy4eMQ+5+hnbDPRlEICdjzmsm8L8z0RLXs4QtPGv6ur+Vx1l6QCMsS5asRtCbI/9u7
         XAmg7iBe0fOMrbpDIrBZhORtq4ssg3E2d+nyrhjRLa4V0J4z08UGMRF+pF2uABcakKmA
         wPLg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Fb0a+X0990WiGKLXvlR5PTT52SUpjO3f/4TXArg9ohVp6yl9Lcqmx+DjWYw/ThqxQ8pSMnYzFg4IIX0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz92ecM9X+E8TUJda3KvIz47ycg1oUo/DQWqjwRgBS9vw4OgYy2
	ISnGlB2y+s+IxvhHi/A2N7OXOr+i0lPTccmyfkAFnYAYcjNsj5ZR0DQZYBOkhOKG08XpyGPd76p
	H
X-Gm-Gg: ASbGnctOU6Ui/3S7aVCw+SNmRYm1Q2d1pQ3qFnJurtJ2sbD4tpdsAAz+A9nLiliddpM
	KpeI1VLbKOGT7DFsth6KUVl6CofCCj/sikj/f1/SEKplQg0EBTNQ9UT6GjQyNLfsxxPyucmbWUW
	S9fc8ysf20gPJDBREccwxfzZdF6qQIOznI1KrkOsoVqkaP+vA08O90ogMdSnhKW+Xd+NCvyJZjI
	qSUgJAAPsnz036xWBHmgz3h9gjcWcaBYH73pDa6Z6k6DebQPM9Jt32Lqk50wbT3vPL/pu1fJry0
	8Z7U8HQYu7s9A2rjVUg8j1nvCppt/vp3WhODqXwc+zPyWP0t3B/J7T4NU8iHutR0byaxSvD5SsB
	WjbkQnmv9DFZGvFnaws2awV18vA==
X-Google-Smtp-Source: AGHT+IG6EsCnUo0eKWDGOg3mkKPpm5BPPY+Ezrmv+DqY8QKeGQ18bV/SmzaWgDutPvEppQHb4SvtsQ==
X-Received: by 2002:a05:6512:3e11:b0:54b:1055:f4b1 with SMTP id 2adb3069b0e04-54d6479a217mr2124920e87.0.1744899930795;
        Thu, 17 Apr 2025 07:25:30 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:29 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] pmdomain: Add generic ->sync_state() support to genpd
Date: Thu, 17 Apr 2025 16:24:58 +0200
Message-ID: <20250417142513.312939-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a PM domain (genpd) is powered-on during boot, there is probably a good
reason for it. Therefore it's known to be a bad idea to allow such genpd to be
powered-off before all of its consumer devices have been probed. This series
intends to fix this problem.

We have been discussing these issues at LKML and at various Linux-conferences
in the past. I have therefore tried to include the people I can recall being
involved, but I may have forgotten some (my apologies), feel free to loop them
in.

A few notes:
*)
Even if this looks good, the last patch can't go in without some additional
changes to a couple of existing genpd provider drivers. Typically genpd provider
drivers that implements ->sync_state() need to call of_genpd_sync_state(), but I
will fix this asap, if we think the series makes sense.

*)
Patch 1 -> 3 are just preparatory cleanups. 

*)
I have tested this with QEMU with a bunch of local test-drivers and DT nodes.
Let me know if you want me to share this code too.


Please help review and test!
Finally, a big thanks to Saravana for all the support!

Kind regards
Ulf Hansson


Saravana Kannan (1):
  driver core: Add dev_set_drv_sync_state()

Ulf Hansson (10):
  pmdomain: core: Convert genpd_power_off() to void
  pmdomain: core: Simplify return statement in genpd_power_off()
  pmdomain: core: Use genpd->opp_table to simplify error/remove path
  pmdomain: core: Add a bus and a driver for genpd providers
  pmdomain: core: Use device_set_node() to assign the fwnode too
  pmdomain: core: Add the genpd->dev to the genpd provider bus
  pmdomain: core: Export a common ->sync_state() helper for genpd
    providers
  pmdomain: core: Add internal ->sync_state() support for genpd
    providers
  pmdomain: core: Default to use of_genpd_sync_state() for genpd
    providers
  pmdomain: core: Leave powered-on genpds on until ->sync_state()

 drivers/pmdomain/core.c   | 273 +++++++++++++++++++++++++++++++-------
 include/linux/device.h    |  12 ++
 include/linux/pm_domain.h |  11 ++
 3 files changed, 249 insertions(+), 47 deletions(-)

-- 
2.43.0

