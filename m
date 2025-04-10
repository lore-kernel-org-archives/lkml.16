Received: from forward204a.mail.yandex.net (forward204a.mail.yandex.net [178.154.239.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77E62571CB;
	Thu, 10 Apr 2025 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744277936; cv=none; b=GNM/9nFmI1l+FhKkZ8JV5iSFSAGK284AM9r7QwJRpt0Whgk/rk4Q0pnbkGux4dCZwXTf5b5G+5H32EDGdKJxa4Cj0LXMy1UNqSZyebIZ2a4+pcI4H21J2llLrdBouH91OuEWTSGaO6f/dc8sTGud80sLjf7wqj3HFqxc2crqEaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744277936; c=relaxed/simple;
	bh=RyU2jVof6pyBfkRDwvWTu8EVWthx+KsZS0RZUWF1bYA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ls8VwIkm1yG2uFfvV1xTMriWmCkynfofvrzmxc3jlrKMc6RSA4SF+xQjJ3yzL2MVgswmCH2xGGr34YKgyV65ZJ3h7iBYRu7YrO/rnwNYaU5GmBmqXqn2wRjEnUeyCKpxbQNPG7IEY7Tj6g3koi/85Epu4wrokQdoB4SEfNSqvSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=bsJsBEh7; arc=none smtp.client-ip=178.154.239.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="bsJsBEh7"
Received: from forward103a.mail.yandex.net (forward103a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d103])
	by forward204a.mail.yandex.net (Yandex) with ESMTPS id E38326679B;
	Thu, 10 Apr 2025 12:32:12 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-60.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-60.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1d:5b1c:0:640:ee42:0])
	by forward103a.mail.yandex.net (Yandex) with ESMTPS id 07F7E60AEF;
	Thu, 10 Apr 2025 12:32:05 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-60.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id tVbEbTALfqM0-9mWQVZPt;
	Thu, 10 Apr 2025 12:32:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1744277524; bh=XGEr/aiM1XB+aNqfFCFL+tQOC9vRqcy5a9BRcDcpU64=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=bsJsBEh78qjtr5+3WG+PAo9G0ap0naFgFZZVxGEMbmDDKyWIimUMnYXMefsVStG+v
	 abs8J7acCbdTqvEIanysdRfTYoujAl3JH6p5fItUTdsGGI3w7LEeV7gKIK9SXO2zx/
	 FBAD7QurJGW+H0IrqEMhYBOuMv0i9zZCB13ykwXw=
Authentication-Results: mail-nwsmtp-smtp-production-main-60.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Andrey Tsygunka <aitsygunka@yandex.ru>
To: Matthieu CASTET <castet.matthieu@free.fr>,
	Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Andrey Tsygunka <aitsygunka@yandex.ru>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 0/1] usb: ueagle-atm: wait for a firmware upload to complete
Date: Thu, 10 Apr 2025 12:31:45 +0300
Message-Id: <20250410093146.3776801-1-aitsygunka@yandex.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This suggested patch adds a fix to the ueagle-atm driver related to the
syzkaller report [1]. This report is currently relevant for older kernel
versions, WARN() is not shown in the upstream version due to its
replacement by pd_debug() in commit
d87c295f599cab2ab3b3df53a9098adba4a6002b in the sysfs subsystem, but it
reports a driver-side issue.

Hope this will be a useful fix.

[1] https://syzkaller.appspot.com/bug?extid=457452d30bcdda75ead2

Andrey Tsygunka (1):
  usb: ueagle-atm: wait for a firmware upload to complete

 drivers/usb/atm/ueagle-atm.c | 40 +++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

-- 
2.25.1

