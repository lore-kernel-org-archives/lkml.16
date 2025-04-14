Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D311DB34C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662501; cv=none; b=G9wx5PJ0gBwkKwW6tchQhN48Y8NhWHn4mHUHZmXOclYZuUhXY3KJBrm+JwCdoqs0rHS6YygwPGsNXJ6tL5qA/A9+dPJPyO5bUCPQnTX8VFkKILR/z/BKYN1JCj3LzBWLWVRshUbDxs4kNFJTf+t8Gtc9pxxGoMit/4VWw3cnl6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662501; c=relaxed/simple;
	bh=mJsv2tM/I8C66voig+fQdm4mxuvEjmzB9vpmbCCufdw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n0D2or7SGZCj8EiPzX0yoIkouZy7m1VdluIjkgjZy0MrH5QJD7RjS3gvkad9K1X6DV7KQO9GsP+FSEglw5985pjtcuF7kfqJ+mmbBooRAHNe78d//UnA31DmRmBNNkvIIlJSFs0OrwlT3Jai9leW5oeHhZIIvc4DJq9xL349FzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=l8cL8YH3; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="l8cL8YH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744662498; x=1744921698;
	bh=5qEU6hzSwCnesMZRIBLEpCHkGx+ziAMm4+Nl/oZk6/U=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=l8cL8YH3Dlx/HaA2tXeQfGdzsN0aU+S4SmL2c3K6Q92JGNmIvPA0Q/ez9PANUsnEp
	 2MB/TaXj620gElAURPuXCeuPyqN6DM2TyCkwortXofWuWbbiNoUQyRuYOybOHF0Bj7
	 430t2AKHMiFEmbmi+UpijCtaIbMStov8haRms291DDxNWI09vwmzO3hzx56KqChExl
	 XjcQAjz627O8KHoF0EFuYS/5gb24ZhZmjUYtkwS55JLR6wDPTwQ9/woQupTF3thC6M
	 qH3CreqFHaPoBX2uw5m6XihBKSNAthc3Fwe6wcBQHlV0oZyHL1s51jHuzf5Qakt5jZ
	 NgcPwRjytdDgg==
Date: Mon, 14 Apr 2025 20:28:10 +0000
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?Q?Dominik_Karol_Pi=C4=85tkowski?= <dominik.karol.piatkowski@protonmail.com>
Subject: [PATCH v2 RESEND 0/6] USB: serial: ftdi_sio: Code style cleanup
Message-ID: <20250414202750.9013-1-dominik.karol.piatkowski@protonmail.com>
Feedback-ID: 117888567:user:proton
X-Pm-Message-ID: cc50f789df1fcf2fa6aebd54ffaea40d9690eb68
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series fixes spotted code style issues in ftdi_sio driver.

v2: Split the patch into smaller patches

Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@prot=
onmail.com>

Dominik Karol Pi=C4=85tkowski (6):
  USB: serial: ftdi_sio: Remove space before comma
  USB: serial: ftdi_sio: Add missing blank line after declarations
  USB: serial: ftdi_sio: Remove superfluous space before statements
  USB: serial: ftdi_sio: Fix indentation made with spaces
  USB: serial: ftdi_sio: Fix misaligned block comment
  USB: serial: ftdi_sio: Remove space before tabs

 drivers/usb/serial/ftdi_sio.c     | 16 ++++++++++------
 drivers/usb/serial/ftdi_sio.h     |  2 +-
 drivers/usb/serial/ftdi_sio_ids.h |  4 ++--
 3 files changed, 13 insertions(+), 9 deletions(-)

--=20
2.34.1


