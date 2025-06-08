Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7591F4C85;
	Sun,  8 Jun 2025 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425623; cv=none; b=HfvyoWzer8wOhMhtTNa1MZP2ptXQppvBpxJ0471DyiXmQWw4UyI3R+ce+6D6qwPHcbZ4tZa8V+U3wm7fjK17bM78mBHFiYhEzoqbtMbeNzpmh5qXeabe4FXLlW0RHqJcWKCP7mLVfH90UcEg3tgXi12CsvwenkMQMnj/evnl+xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425623; c=relaxed/simple;
	bh=Hu01lxNpqUpXxTdPaEzFHiFpfa2CuI0Opq/59m1Xhzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QYuSnqak9ZS550J1xaEIBYM6Syn4a8YCbCyzOuNlYmnxGwIL/mYtHK8nijBNmKOM2QzkpD/vcKE+dBxwGHGUVH90hhigVxflDzn8Xg20dbTdf83ZZqahZrP8A2mx43+cZHzviBFBzKJqlYuE4A8BDuwTrY+5wZc6lR8wgnjSjBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=bMqJ2Pc/; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="bMqJ2Pc/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=enryPIMFrHBrZtvCmuSU21zt9Yit9gyzryViMNGzoyk=; b=bMqJ2Pc/oq18EoUi
	Ikw/aThdwt+9uA+owtcXXtAVnqZL4KTo9dMO39+pL/gB9ve61q8U0HHOo4Fb0PsyV0lXmTKEOksGm
	Wdpa/SBU2PLjprvU9fvaUHJI1SLuV9qi8bEalBZbaRpHC5041DoE2FeT5NO5z1R5iiYq+4O2gwT9/
	6aX8r1O23A+vzWCf5zq0u44gbMdssd8sDSyQ1g/uknDUOPjk4wChkDUfl1PZtxr8EAR5CIfKn8evE
	9hxyq62A1YMFutL7LnXb342euuqWMe33InENQabIAGbbWuoxi5IUeAHNTBgUc/RovlYRDMWtojZr7
	A59pNwksnY9i4AVGig==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uOPWF-008IvT-02;
	Sun, 08 Jun 2025 23:33:39 +0000
From: linux@treblig.org
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/2] usb: gadget: A couple of dead functions
Date: Mon,  9 Jun 2025 00:33:36 +0100
Message-ID: <20250608233338.179894-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

This removed a couple of long dead functions in the gadget code.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (2):
  usb: gadget: config: Remove unused usb_gadget_config_buf
  usb: gadget: Remove unused usb_remove_config

 drivers/usb/gadget/composite.c | 24 ---------------
 drivers/usb/gadget/config.c    | 53 ----------------------------------
 include/linux/usb/composite.h  |  3 --
 include/linux/usb/gadget.h     |  4 ---
 4 files changed, 84 deletions(-)

-- 
2.49.0

