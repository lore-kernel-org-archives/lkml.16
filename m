Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9122027C172
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389922; cv=none; b=PThqxzsl+u5YkXGIi11cGeuskxPSgqyKUcGWPj5vX3Rdv8WZaucbMb+PqKPUCoHAyCG+apwz/wWZ3qt/UTuORQIMAQ1raYK6QzM7tp0BT7u2v94aKWmQAJPDmHAUeQO1q8UdNIvXCktFP4StjreGM5LGniG2cnYNTlXx9TrfqPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389922; c=relaxed/simple;
	bh=SX2heC/Qk6afxGMZKjrW09kyPvYeBI0adPXbi3Fnvpc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=k97T/jy/5F/JshydD/74Ikfm3BqxDkKO+zceuj5IrPwl/UJaqW5zGsXgQfMpF2Irgp9WGNmUIER9tbo6j4SfTKIqYfHC43I2nexB9loOv/K3vt1ojYb76NW8ZpKV1TUwSSV4Ia2t9x+hBHqnUsN0j0h1DQcMJgTwYyhyaeGFoik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=XS9t/U9R; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="XS9t/U9R"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D1B123F717
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751389918;
	bh=sU2Tqd6bdvzOLtqB6osCLzx8U1+d3a8Z2ezfvd4F1oM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=XS9t/U9R+3zUPjGMo8TXfF8V4bFRO48sGEJTHDFEwALEQlklu34q5iWKNWJAxeJDN
	 +K3J8c/GIUaMzj/GAXRLelvWCBv1t1aNu430TZblitWvrwTVWBchyyxHwyT9K2nFJV
	 2SWUvcYUGjOfRYSLdpCwNODR9T1Oe/hhRKxARi7O1Z4AJmUcQosDyXFPrM9D3+2a97
	 w2pqLs5qGElOjXvgryvDOJ7FE1c8xrUPTzjxFZdV2sZU22COfpkD6ECGQ0PtD7Jyp5
	 u1S0HgtOspnVPWIHNGHSQOAgw/iDhvS32Yt2ki1VYu1t0R/B2Mce+anQPsZXBmoaSU
	 nEIFsheOI6nHA==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6077af4c313so5263050a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751389918; x=1751994718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sU2Tqd6bdvzOLtqB6osCLzx8U1+d3a8Z2ezfvd4F1oM=;
        b=bcza+UV05HkykUPS0S09jLzvjS7H+FESQLr1DZfBZQiWIPtzPo+NkJPd1VMIKjG4mx
         7uSp8o8pPRkujW22aT4u40BsfCCiTo6zQbOuUDDcOpFEdC3YQfbH8vpf8qdpOi14pLx2
         DIvoMiN7cly8dxa6+b2rxtfQEF8c+I4GWd2wdEm7NFAIPbPZMPUzdvZAZTnNcWHIXUFG
         RENhpFLQbkPojEkn7g9r+GJFDLrPoq8tGun7OvmiKSmZ/rZM5fpBgSmhsDVFMAJQiNNe
         31oojfSoZ67CFXDIN3fnzSXUCMafxNPARgraT6l30EPSndHui2DeqGR9ZC45nxVNtLmj
         eh7g==
X-Forwarded-Encrypted: i=1; AJvYcCWk1/TzichOCP63Z8m3koqe0uP9eXYLhyl3/2JxN5xlZbtrQcgU8j3uCL6/ni9nfT8CuxDYZ1jIzFBsti4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC48UCf3TNvVCI25VOP7GaO0T4cVY5fRSe4DkprRFI80pdPwdp
	qM3G1BM7r9BU0IuRd2rizEo//gQSQhZzx+2gNdwVeJCno1SXy5nKgBnPigHmZsMSH5x1DrCVFEV
	0oFcHdSCPc6m9+0+3AvZTXpE7B83ZqzanTwHoSL2a3NfV+BCznqW9nPM79nhKp2MH1yQWS9ZySH
	yn6/Kl3A==
X-Gm-Gg: ASbGncsI/hl75EuS/HsPo7TBr1pgUeCqs0teHpHjZhLwXOC8Te3prFg2DzDPkHGDRew
	CtdKcT/J+C9ptgkoCKEUXIPoQa8sFj9os2pcfZ/3i9f7Rh0u7n/u7bNKXB4wN41voMKJUT1J1e5
	s1ehhCHLQPBpsZP6V7E4oG/9YsYplfFAX7F9cTSmdEr02JfCCFlvYxfzPwlMaA6EI85RsRJYrfo
	LU99aLIqAQvBHgqF5Rn4BIPrmqPY7Fm23+OVUBD6v/+LeVKzRgab1YlNY5DlejXIG5nI0e7DugS
	fHmZT1NaSZ0bfsjV6yuKA6G5Xev3L/n4ZtoW7FaiZvykn5bQ/RL5cc/XDo7PKLN9
X-Received: by 2002:a50:ed87:0:b0:608:40bf:caed with SMTP id 4fb4d7f45d1cf-60e3a8f3b4cmr2512628a12.7.1751389917974;
        Tue, 01 Jul 2025 10:11:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu8J6lVnS+AjHzqRmWb7aXWSa8lc+z3NV7ufWDiI84tWqPRb7bwIpffBsf/O52QDBXHBTQ1w==
X-Received: by 2002:a50:ed87:0:b0:608:40bf:caed with SMTP id 4fb4d7f45d1cf-60e3a8f3b4cmr2512601a12.7.1751389917513;
        Tue, 01 Jul 2025 10:11:57 -0700 (PDT)
Received: from t14s.. (adsl-6.109.242.31.tellas.gr. [109.242.31.6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bbea9sm7818156a12.1.2025.07.01.10.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:11:57 -0700 (PDT)
From: Ioanna Alifieraki <ioanna-maria.alifieraki@canonical.com>
To: baolu.lu@linux.intel.com,
	kevin.tian@intel.com,
	jroedel@suse.de,
	robin.murphy@arm.com,
	will@kernel.org,
	joro@8bytes.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: [REGRESSION][BISECTED] Performance Regression in IOMMU/VT-d Since Kernel 6.10
Date: Tue,  1 Jul 2025 20:11:54 +0300
Message-Id: <20250701171154.52435-1-ioanna-maria.alifieraki@canonical.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#regzbot introduced: 129dab6e1286

Hello everyone,

We've identified a performance regression that starts with linux
kernel 6.10 and persists through 6.16(tested at commit e540341508ce).
Bisection pointed to commit:
129dab6e1286 ("iommu/vt-d: Use cache_tag_flush_range_np() in iotlb_sync_map").

The issue occurs when running fio against two NVMe devices located
under the same PCIe bridge (dual-port NVMe configuration). Performance
drops compared to configurations where the devices are on different
bridges.

Observed Performance:
- Before the commit: ~6150 MiB/s, regardless of NVMe device placement.
- After the commit:
  -- Same PCIe bridge: ~4985 MiB/s
  -- Different PCIe bridges: ~6150 MiB/s


Currently we can only reproduce the issue on a Z3 metal instance on
gcp. I suspect the issue can be reproducible if you have a dual port
nvme on any machine.
At [1] there's a more detailed description of the issue and details
on the reproducer. 

Could you please advise on the appropriate path forward to mitigate or
address this regression?

Thanks,
Jo

[1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2115738
