Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2A1AC44D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743720198; cv=none; b=B4X8o6DQMvZk+5eWk2yJ7Eq125qcR45pRLgFny0pPs+MjAGNO5ps/wksL+3OkT7x78GigcfswWbAZHBZAxsnNJGxNDfPTlMtQa4Tk2SEO9WJMY6bLZ7EvMPwj9QJ6gmGcqr7zG61ZSR9vYEwyFKTwS+TiBBtVy+KqYBhPC0xTWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743720198; c=relaxed/simple;
	bh=MC/KEKdPTOEflqGlUvBmURVglRnQ9QWtHNmEHTvCwqw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XTclTvwrCuCg9RUazxYHk9lUJZeSi8EkB8xEkA7Rrr1YFvjZNKykuP1Il9LoiZ3TJ/G0JmC/8ui5LQndxl1nO9/23jYacGWOomRd+3WGvdc31W+i6DHbDpNV9c5i+ILLP0yarfFvcnaQfvT3Bi/WFINQ0k5Zkgg8RPtcHgvNOH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0THG-0000kD-33; Fri, 04 Apr 2025 00:43:14 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0THF-003AjU-13;
	Fri, 04 Apr 2025 00:43:13 +0200
Received: from localhost ([::1] helo=dude04.red.stw.pengutronix.de)
	by dude04.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <m.grzeschik@pengutronix.de>)
	id 1u0THF-004aMT-0q;
	Fri, 04 Apr 2025 00:43:13 +0200
From: Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: [PATCH 0/3] usb: typec: tcpm: sink (ufp) accessory mode support
Date: Fri, 04 Apr 2025 00:43:03 +0200
Message-Id: <20250404-ml-topic-tcpm-v1-0-b99f44badce8@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPcO72cC/x3MQQqAIBBA0avErBswyU1XiRY2TjWQJhoRiHdPW
 r7F/wUyJ+EMU1cg8SNZrtAw9B3QYcPOKK4ZtNJGjWpEf+J9RSG8KXq0diUym3bGMLQmJt7k/X/
 zUusHv1MnhF8AAAA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Michael Grzeschik <m.grzeschik@pengutronix.de>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=852;
 i=m.grzeschik@pengutronix.de; h=from:subject:message-id;
 bh=MC/KEKdPTOEflqGlUvBmURVglRnQ9QWtHNmEHTvCwqw=;
 b=owEBbQKS/ZANAwAKAb9pWET5cfSrAcsmYgBn7w7/eRus1d7Dqqh37Jw8+q+uyFlSjogqRvC1n
 ZIXVTkUu4KJAjMEAAEKAB0WIQQV2+2Fpbqd6fvv0Gi/aVhE+XH0qwUCZ+8O/wAKCRC/aVhE+XH0
 q/4AEACSkvLzR5VbV5RMNgIJDNoIx/PZxYa07Gp8ODXHaJvWYwctPB2JUbtuM+xIKrlrHO3bx3a
 2p+zEIv9eE+E7ydu5jGnKq8Y+7TChojAfTGHCo/yYQCESvQOPb3VTgTkzDtTqGUXE+sRBubd8a2
 LJzn7M7hbu5PfgiBTIYcwWqVj5rXw+mvqF+F0z8X6T6z3PV+IGtvVy2j6yKHUzh6YBXYr90cmy7
 DfdTO42GRTsq5ISMObjh6Ps8Hq74i1HoPet0zyZKIw9XjmQrW5MNnt/CHeYd+oj6H0vrS2e2r7J
 qFtE1qvKdkYfDEM82gjB8CcWmuv5wbuHhCc18PjPYa9uKttSMLor3HtS4/yMnbWy2t1zDmvp10H
 H9coKSrRT7TsSOMZoQbiqyb/CAxMaTiUX8qVimL3nYcVNE0wCsghyEm2wO/Tfs+UkxjDXd49gdt
 TCR2EfLhCKfQKu8IwsACsx6V3za/BM+aj/InCiBys4g+Aav+rzZuldNktKuJkZ0ChVEABQycpk1
 5wQY+tuwH7XSEAljyqyYgAL3D8VJDH2jlBFfdICFQTbKXKvATcES0cOLX79Y2a8ecy5mth8F8RH
 4Tfqqdy1qPvNT+eNPEj72a8JJb78EDyqVmOTBqX5Oje2iaBu95FGNzmZ5byIo2oXcVi/EqsCycn
 zqaa20o4dCHFruA==
X-Developer-Key: i=m.grzeschik@pengutronix.de; a=openpgp;
 fpr=957BC452CE953D7EA60CF4FC0BE9E3157A1E2C64
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.grzeschik@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

This series is adding support to reach the DEBUG_ACC_ATTACHED state
when configured as sink. It also extends the tcpm_acc_attach function
to handle sink and src cases and sets the proper modal state when
calling tcpm_set_role.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
Michael Grzeschik (3):
      usb: typec: tcpm: allow to use sink in accessory mode
      usb: typec: tcpm: allow sink (ufp) to toggle into accessory mode debug
      usb: typec: tcpm: allow switching to mode accessory to mux properly

 drivers/usb/typec/tcpm/tcpm.c | 68 +++++++++++++++++++++++++++++++++----------
 1 file changed, 53 insertions(+), 15 deletions(-)
---
base-commit: a1b5bd45d4ee58af4f56e49497b8c3db96d8f8a3
change-id: 20250404-ml-topic-tcpm-aabcc5f2d55e

Best regards,
-- 
Michael Grzeschik <m.grzeschik@pengutronix.de>

