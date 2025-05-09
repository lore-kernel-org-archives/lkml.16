Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E408928FFE8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793500; cv=none; b=jK3nRSZE+SthvuV9h2KegD1juQebwJfOkFaOgF6qTmHENzOfa9WEi5b13kd3omLVqdaqvttXLFAf/y989b2UB17p54ONwzfqHzXbvl+jj/NhRdraVKYuiKXHYMl55Q4QML+r29UTPULaupvXwh2xm+lqvaYeyXIeQoRkPI6HYF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793500; c=relaxed/simple;
	bh=v783J+qoLuJf9UahnUEMPL/PkE2S/y+nGCFL5RWycbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3ZatTT2KEHfJgJFuvni57ZXOD5hr+pqLTKhyvRDplBYjqFAk7y5WCny4FtlnmSHM6tPFMvGEmojXSpmgsh+mQRlP9SYDkGZ8MhkKhw1i1RKhTfW/2CWesvQh1ELW5znBy9ywdwmk7wIQjI9uIIbkETwMvMIb2j1very6vSkhUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bxy/SBcR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bxy/SBcR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E2FC4CEE4;
	Fri,  9 May 2025 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746793499;
	bh=v783J+qoLuJf9UahnUEMPL/PkE2S/y+nGCFL5RWycbo=;
	h=From:To:Cc:Subject:Date:From;
	b=Bxy/SBcRLNN/PaKtdfFEhaaPI+dbycaMvM76SMQ0SgqfB0rwe8e1AbHAK8K9G0LUN
	 DBi7agB2i56AqpmgNHtlKiYO+knANVdofleQ6+5t+NDByY4KScR0IEAW/d09W3Qx7I
	 +BsEv/OQeHUMYWUF6HbPrDfA2ZC1fOLayelmL/8av5vKBmaWTMUAEavBlPm+VgOW9i
	 Qi57iBBiYt+vFWTIIkyKP75ayzcAIztGCRf8LcNxI825VMHR4BlvRo8V4gyzjUVRFd
	 i1OSR5aPHr7sU+8qAfsbMMy7DX8q/kMa1cRxH5dpwf/xJ73PhYY+xVeOlfENYC+aOh
	 8lmleJKIO+Gyg==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 0/3] nvmem: patches (set 1) for 6.16
Date: Fri,  9 May 2025 13:24:49 +0100
Message-ID: <20250509122452.11827-1-srini@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srini@kernel.org>

Hi Greg,

Here are few nvmem patches for 6.16, Could you please queue
these for 6.16.

patche include
	- cleanup of unused cell table support
	- add support for apple spmi nvmem provider.

Thanks,
Srini

Geert Uytterhoeven (1):
  nvmem: Remove unused nvmem cell table support

Hector Martin (1):
  nvmem: Add apple-spmi-nvmem driver

Sasha Finkelstein (1):
  dt-bindings: spmi: Add Apple SPMI NVMEM

 .../bindings/nvmem/apple,spmi-nvmem.yaml      | 54 +++++++++++++++
 Documentation/driver-api/nvmem.rst            | 14 ++--
 MAINTAINERS                                   |  2 +
 drivers/nvmem/Kconfig                         | 13 ++++
 drivers/nvmem/Makefile                        |  2 +
 drivers/nvmem/apple-spmi-nvmem.c              | 62 +++++++++++++++++
 drivers/nvmem/core.c                          | 68 -------------------
 include/linux/nvmem-provider.h                | 24 -------
 8 files changed, 137 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/apple,spmi-nvmem.yaml
 create mode 100644 drivers/nvmem/apple-spmi-nvmem.c

-- 
2.43.0

