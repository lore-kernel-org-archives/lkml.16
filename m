Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC5A191F98;
	Wed, 14 May 2025 13:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230901; cv=none; b=iKoMqGwkMGsUTkcImT+OuKHHX9rtDOFBIhwXiFPtP4D/oqrl04D26sHy3w/FyrkhNTucPSfyQXGeTWsY33cVlsmvHdOvIPuNHErPINMw5dgAZqR7cGlKtkXahqb8dro5Z4AxwSaafMsXXBddWGntbRaJIIGpIuPzu81X3KkAUNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230901; c=relaxed/simple;
	bh=F9XmG0qcImWHKFiJQK0qpgJAz3oJ9FDWgu35+n/rWXk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tn1bYuB+b7P4xjQSk6at8pSb3XfWiPtRBENYVFUEwD6o//UGlgdKk5K6uvRmcrk6vFf0Bg1BYhvTz5yoCJrmX+Vt28eNGKe0I6oVFwPFC7plN9AxyjQIXwJdZz17HzQAHQOMrFd2E7iZrWlw9oclyanyEpMvfmUmG1qKG69i2K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTvxQC9h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTvxQC9h"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06B2BC4CEE9;
	Wed, 14 May 2025 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747230901;
	bh=F9XmG0qcImWHKFiJQK0qpgJAz3oJ9FDWgu35+n/rWXk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cTvxQC9hjUSs15OtcIvuDPWxAuU1IAvx5tSUSqcGo7mjNij9r5Fbf/XhatsVDEpB/
	 psRS5d4TE6wEL8cREmJ3UQqRjieHhlcMhO7m4rV2Yz+fVgvgjd+PFkKorfLkRt7BtO
	 /DttTVxkRb/+5ktIDRaIDMLrb1DCbL2oyr1Lsg+2WwtaJFQMEalcjjIbgwRjR3ZqXW
	 MFL0px42UhzlNTpv6d8UVp3CWnKsFdltBuYIE5I3yc9BvMMmjSNsXJuzoTFW1r3w+i
	 UeKW1IyYiiyKxhv9G1uo0Zriyxf/ZzrQzuNbtUnaH1H7D6CzxoPa/KM36msiO+02pW
	 m1XFrJISXsjMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9F5C3ABCC;
	Wed, 14 May 2025 13:55:00 +0000 (UTC)
From: Alejandro Enrique via B4 Relay <devnull+alejandroe1.geotab.com@kernel.org>
Subject: [PATCH 0/2] Add support for safeboot pin to UBlox GNSS driver
Date: Wed, 14 May 2025 15:54:40 +0200
Message-Id: <20250514-ubx-safeboot-v1-0-1ae771335356@geotab.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKCgJGgC/x2MQQqAIBAAvyJ7TlBLir4SHdTW2ouGVgjS35PmN
 oeZChkTYYaZVUj4UKYYmsiOgTtM2JHT1hyUUFpoOfDbFp6NRxvjxftRT141NDpoyZnQU/l3y/q
 +H0c9iIBeAAAA
X-Change-ID: 20250514-ubx-safeboot-3758f22225ec
To: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alejandro Enrique <alejandroe1@geotab.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747230900; l=1048;
 i=alejandroe1@geotab.com; s=20250514; h=from:subject:message-id;
 bh=F9XmG0qcImWHKFiJQK0qpgJAz3oJ9FDWgu35+n/rWXk=;
 b=bfHhjdvgF/ldusVneSZftn5yZtD5a4VfsEqVCnIsd9dZcgqABA3ARJlcD7645oH7kUedcE5Vt
 JA6TC28L/CoCyaVbvmJ12vhdQXe29WMd5tXc2/lNQpOfQgB6dgett4l
X-Developer-Key: i=alejandroe1@geotab.com; a=ed25519;
 pk=xzHMPbqczL/tMsjXr26iLoHwIzLveHVnT+GIU4p1k38=
X-Endpoint-Received: by B4 Relay for alejandroe1@geotab.com/20250514 with
 auth_id=404
X-Original-From: Alejandro Enrique <alejandroe1@geotab.com>
Reply-To: alejandroe1@geotab.com

U-Blox M9 and M8 chips have a pin to start it in safeboot mode, to be
used to recover from situations where the flash content has become
corrupted and needs to be restored. If this pin is asserted at power
up or reset, the receiver starts in safeboot mode and GNSS operation
is disabled.

If this pin is wired to a GPIO in the host it should be deasserted
before powering up or resetting the GNSS.

This series adds support for handling the safeboot pin when probing
the driver.

Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
---
Alejandro Enrique (2):
      dt-bindings: gnss: u-blox: add "safeboot-gpios" binding
      gnss: ubx: add support for the safeboot gpio

 Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 4 ++++
 drivers/gnss/ubx.c                                        | 8 ++++++++
 2 files changed, 12 insertions(+)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250514-ubx-safeboot-3758f22225ec

Best regards,
-- 
Alejandro Enrique <alejandroe1@geotab.com>


