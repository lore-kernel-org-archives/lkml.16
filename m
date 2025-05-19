Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13322A55
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747660333; cv=none; b=lA++9YpS4QQWsDuw9n+354YFhRo/7mi784nRerifsd/sCTgIF0eD8g+BJ7YBz6etpBSDN30Zd6jiu2XDbvRYfefI248QrelBalEM+ZWqmvGwwFTBQn1COZBjuuozrsu7l1VaYpvabvMJgJYffg1l/90s8xlgtzhwAFzRXn/8QEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747660333; c=relaxed/simple;
	bh=ML39nuP2riC2sW3IXoGz4oBLnULYWaCSwZod4+GgjiA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uhGXOsg5MAX2+JlzcMtWFDGvGeyBZSvBdSMKM+kOl4kCqP3Y4TOf0pbUlm8bR6AvT9UkLioP70NAaXSj17JHXisBwSJVmfi/oCd7oJmN2p227O3+46Bo40mNrKYD6czfjdJo7Et9o0vwJ2pGgH1akzHUFCUhxmuKKzxwoMSIgLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b=X0nRl60l; arc=none smtp.client-ip=62.149.158.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b="X0nRl60l"
Received: from polimar.homenet.telecomitalia.it ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id H0EluBSummHkSH0Emu8qyj; Mon, 19 May 2025 15:09:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1747660140; bh=ML39nuP2riC2sW3IXoGz4oBLnULYWaCSwZod4+GgjiA=;
	h=From:To:Subject:Date:MIME-Version;
	b=X0nRl60lHCcTmM8wPCrXQPbaWagBNNvv4ajNRWXsX+BKxQJMBYMH1fnLz+EOlvxbJ
	 iEBm62yD/8yUwuLqrHZ/AG73netX+q5iFUJ2FXfc7z0pS3+jS4ym714XggSyCwng+9
	 p62PlLXykzpGSGZqUJIfCVLNAp2vl05POa52dFeu/6QezKm9qSh2URP/rYLhZ3gT4S
	 kQp05/1Uqf/zh4/EjCN9oYJS7SYuv9lq2/FJTZRHRp4CgvQDPLC430O/OJ5veBX7d7
	 XVcS3C7/GxoPJDgDKqejYlQUbp4bZRyIX1P+kEkzXpxQPEQFz6VsMqzwMsePrnGZbP
	 aVJkyfush9/rg==
From: Rodolfo Giometti <giometti@enneenne.com>
To: linux-kernel@vger.kernel.org
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Fourmont <eric.fourmont-ext@st.com>,
	Yann GAUTIER <yann.gautier@foss.st.com>,
	Rodolfo Giometti <rodolfo.giometti@kbact.org>
Subject: [V1 0/2] Add SoC support for stm32mp13xx CPUs
Date: Mon, 19 May 2025 13:08:57 +0000
Message-Id: <20250519130859.3389704-1-giometti@enneenne.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMh/Fpk+pwBEkLTfzO4y4TYc9xaEfBudgO7tsUE0KkBxzid2iibSSSWCC/vQ7vakhsCbCw+9PNUaoJaD6+xay9nl/QAcuPtszO9sB8jayo0P0p87WSTR
 d2/i5HCoS0x0p1B/U8E0V+iM0d4LSTMNH9DzIU6nCW6UBgz/vmCRahhK3F0mtCQpOtKbpCLy1eR1kelAN7f14CjeOvZfbTTJqmVVECrwwCcAml4KbKNund29
 FWQqVHeOAQtXh7cIH8c9ikgF/opK/9qRMZL5BQqGlnHFbSqbC/H2dsyuu9yumnoEyq9J46SJ6XwcG/hXA1Vpw5KCI+S+qD3MFLqUMqlow4C0O/2UMDWi6aHy
 +22nA9dDMWfEzpzKURSZ0lilt3tyKm5V3qpkknSliGAr9KcAM/kEpAGD9M2ez32ttzZnhGEh

From: Rodolfo Giometti <rodolfo.giometti@kbact.org>

This patchset adds SoC support for stm32mp13xx CPUs, allowing users to
read the following information:

    # ls /sys/bus/soc/devices/soc0/
    family         power          secure         soc_id         uevent
    machine        revision       serial_number  subsystem

All entries are standard SoC entries except "secure", which reports
the CPU security status as described in the CPU datasheet.

Rodolfo Giometti (2):
  arm stm32mp131.dtsi: add "encoding_mode" nvmem definition
  drivers soc: add support for ST stm32mp13xx family

 arch/arm/boot/dts/st/stm32mp131.dtsi |   7 +
 drivers/soc/st/Makefile              |   1 +
 drivers/soc/st/soc-stm32mp13.c       | 253 +++++++++++++++++++++++++++
 3 files changed, 261 insertions(+)
 create mode 100644 drivers/soc/st/soc-stm32mp13.c

-- 
2.25.1

