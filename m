Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B97120FA84;
	Fri, 23 May 2025 09:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993550; cv=none; b=SYKCREK2dRsHnM1RCoDeIxEd6XdCyjajRJOT5m9eeb2Wa7dW/ZXqX7h1u3kUXOdeYU+3k++gcKzH0cBc+aRUlaf03YZyJ3Fhv3rwZufkbQ+sqahZybMI3F1VykXWWA3QlRDTPmabLkC897LJdqPIfJtHqzlCFFq1fyiUj4zHQjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993550; c=relaxed/simple;
	bh=clQCZeMdeb3EtUQNI/pHEh3Vr4hcj2vGmANF5ZMWMPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jGRoRS7u88n0vx/m+Aws4FoWgZTwSuohHTUKespgtEQZZeN6ABOkvMSlhPPxaVin5E3SaJpPAbuxWiquu+kWxsfyQgNyjiHpR2huFYjXtjz5ffOvoh25sgL4OeuFHzw8taeUGVMWfCDHQHnktRmpQZDmJOg5MsDyz92grPTdVGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJB8pCnG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJB8pCnG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3F6C4CEEB;
	Fri, 23 May 2025 09:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747993549;
	bh=clQCZeMdeb3EtUQNI/pHEh3Vr4hcj2vGmANF5ZMWMPc=;
	h=Date:From:To:Cc:Subject:From;
	b=PJB8pCnGvGuF+84nbMIImYZcc534Haevyto86dlf/GU4I7spPriXxZL6078uhlGSX
	 Ded+hlP3e3N9WnbN+vciQBEuMsIrgtzUexDJFk4oYYpW7yn2h43tkJ+vKGnS7ULb3P
	 9AlWnwcekCcv6HZqHOlUz7gViz2QlqVGs43LKmQzOUqOgePXnreR74jEnFv7Vp9sv7
	 SFp+KJys6kmUGEGR6PTCI7VZu9fPcb+mgnbTT48D/0h9hBBoZ2HyNyUjAEFENzHVXp
	 zbusjVMc91kxe1i3ulg/4QAWbVr5KDg32lM0G56gZzX/BPv+NjJzIqEgJz07QWTZWB
	 twp0I9VQZuLmg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uIOyJ-000000004Fn-3Jut;
	Fri, 23 May 2025 11:45:47 +0200
Date: Fri, 23 May 2025 11:45:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB serial updates for 6.16-rc1
Message-ID: <aDBDywD0OoPnU84n@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.16-rc1

for you to fetch changes up to d3a889482bd5abf2bbdc1ec3d2d49575aa160c9c:

  USB: serial: pl2303: add new chip PL2303GC-Q20 and PL2303GT-2AB (2025-05-21 17:19:55 +0200)

----------------------------------------------------------------
USB serial updates for 6.16-rc1

Here are the USB serial updates for 6.16-rc1, including:

 - fix of an incorrect const cast
 - removal of a bogus read urb sanity check
 - support for a couple of new pl2303 device types

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Charles Yeh (1):
      USB: serial: pl2303: add new chip PL2303GC-Q20 and PL2303GT-2AB

Greg Kroah-Hartman (1):
      USB: serial: bus: fix const issue in usb_serial_device_match()

Johan Hovold (1):
      USB: serial: ti_usb_3410_5052: drop bogus read urb check

 drivers/usb/serial/bus.c              | 2 +-
 drivers/usb/serial/pl2303.c           | 2 ++
 drivers/usb/serial/ti_usb_3410_5052.c | 5 -----
 3 files changed, 3 insertions(+), 6 deletions(-)
