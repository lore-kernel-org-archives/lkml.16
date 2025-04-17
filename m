Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D0C254873;
	Thu, 17 Apr 2025 16:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744905908; cv=none; b=t3H7tsneOP0qt79dJciIgTYIW7ui5YQcFGIcnzYlB6yPpDcxk3bErpey8HItGIibA6S3BMI3I+X+gLaNwxae/WHicnQ2NjWqAmKgK7eaDUNeNBzS8n2tvuXtUWqLzLaMjJ7MyJsmnJOQ23+juu4u8hoJyLlsIco1VXIqKuOWNR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744905908; c=relaxed/simple;
	bh=u+UmixzBBg2qLju8DtViG+IB8PoPJfibLgIOwE3b83o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SQedT00Vjx2e6OxmFTV9R221G5HdlLf/9gttmWOevdiddYcd2+//EauPu1ZpYQpZKrQ5j0zSAMeRQz8BSu4ZQU097WbSmbj0NGhUN3jPT9Xgz/T9Ikt4+L8eiTs0oJ/w93ZQ3b6KdRSxccqvBx2ton3m/lQuBCzOj+rl+ThJ3Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pftw3qZc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pftw3qZc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED135C4CEEE;
	Thu, 17 Apr 2025 16:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744905908;
	bh=u+UmixzBBg2qLju8DtViG+IB8PoPJfibLgIOwE3b83o=;
	h=Date:From:To:Cc:Subject:From;
	b=Pftw3qZcbLoRGEWO45dEMdW4wn4WIr3O/R9EZIY+z8TunCKUDXox2HmAQ7NQ08lCv
	 jsj8lStfF/zf2uNWT7k/tv5RofeBDQvwCTtxTWjzQihcY1y0hNsLgopu4sfcgwUZRN
	 rTMcpmoLjCeRczRB3qzgNiszd/my1ckuFzdcvMPElRsJO1HgdUQAy1ccGrjkKDGFKg
	 lFIrOQV+Qni8Qc7Mfc8ZB2W1D3qYwQ5m2AyJP0cRjKqqteRJPaV0ZMydhKHjgxDYml
	 d8zGwtzE+KudtjAaqLSVDpqHPw9Kol4bD09Od5OBU32JzZuFByY698op8RKGnTkFxO
	 M/WN+Jgjv0Lig==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u5Rjg-0000000031B-1t9z;
	Thu, 17 Apr 2025 18:05:08 +0200
Date: Thu, 17 Apr 2025 18:05:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] USB-serial device ids for 6.15-rc3
Message-ID: <aAEmtBNxgCFqA5op@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.15-rc3

for you to fetch changes up to 4cc01410e1c1dd075df10f750775c81d1cb6672b:

  USB: serial: simple: add OWON HDS200 series oscilloscope support (2025-04-16 08:38:22 +0200)

----------------------------------------------------------------
USB-serial device ids for 6.15-rc3

Here's a new simple driver for Owon oscilloscopes and a couple of new
new modem and smart meter device ids.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Adam Xue (1):
      USB: serial: option: add Sierra Wireless EM9291

Craig Hesling (1):
      USB: serial: simple: add OWON HDS200 series oscilloscope support

Michael Ehrenreich (1):
      USB: serial: ftdi_sio: add support for Abacus Electrics Optical Probe

 drivers/usb/serial/ftdi_sio.c          | 2 ++
 drivers/usb/serial/ftdi_sio_ids.h      | 5 +++++
 drivers/usb/serial/option.c            | 3 +++
 drivers/usb/serial/usb-serial-simple.c | 7 +++++++
 4 files changed, 17 insertions(+)
