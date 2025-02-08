Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B065E19D8A4;
	Sat,  8 Feb 2025 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739010024; cv=none; b=n5koMWoTlf69zmdiQIQz5DdkMIf1gM0e7RK+U3k9Y1agczyHufEnn6mN9eD85RjGYvdsGjjgvQqMSa84opALgWXjkKBk0+IU5B5PESfYEDVkEol7j99riSUY+wWtgXd7CAdb/DwznEzZyKJU8ClLWt2lPixT5fWRmK4DkLVwV8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739010024; c=relaxed/simple;
	bh=Hj26Xnd/q/9LY44S8194rtnDyEAyiFRsAN1aV7p4+dY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VjnRE30OYo9guhBeIYtmVL2ssMpc/UC8i8IvFu9/zGIB0DevqihW8RNCXXmNe+EJv8pKHBkX7uwT5ZtRriD9IHoX5imTOqvuaCAQeg6TX8UHq+4aMl/NOrD+58xdQFwV5fTnRKh8ylOZrPudItOkbMlzg5lbdGZqVJpRCEZdow0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from localhost.localdomain (unknown [IPV6:240e:3b3:2c01:6750::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id a7d7b0c5;
	Sat, 8 Feb 2025 18:20:15 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v3 0/1] dt-bindings: net: rfkill-gpio: document reset-gpios
Date: Sat,  8 Feb 2025 18:20:08 +0800
Message-Id: <20250208102009.514525-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUNKVkNDGEJJGRkZH0tDSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtKQU1MTktBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	tVSktLVUtZBg++
X-HM-Tid: 0a94e51301ae03a2kunma7d7b0c5
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nzo6Kjo6DDIOFgIsSEIdQjgD
	SUMaFAFVSlVKTEhCS0pLS0pNSE1PVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0pBTUxOS0FBSllXWQgBWUFKT003Bg++

Changes in v3:
  Collect Reviewed-by and resend

Changes in v2:
  Update commit message.
  Add new example for WWAN modem.

-- 
2.25.1

