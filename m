Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C61FAD21
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749538851; cv=none; b=WgRSn+Jb6uASmhUFkincD6YTGTiYVIelXg4063pLs4jJb1LUsHYHqaGPK0mICKFD27Y4F+0q4ZUxX2f5KkjpmB/23oP2udc5t6UgRlUP+DgXyofbKeaz+NjIEuKIYnWmPp3mB0szvowngkUVnUc44nCYDEx1g/icGUuWulBaG+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749538851; c=relaxed/simple;
	bh=nxzPfqmfptUSQtLazHsiK0dcb5LFkkFm+nAYN/C+p7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tKaOG0vS/9lh6UF5HhXg06IMNjLb9/Qm8D7HA/RD0BVGrutx+lSl9Dzh2fwb+2tach9o0PTOq5px740fuHY/MW4dtpD8+lJNyifSp9LoBrR1jniM9Q32dLKXCWP/VlOF7Qoa+TssGQBpStChIzBhZam5xQMgWvKu27QG/NoP8/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=dtGcd7wR; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="dtGcd7wR"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742c035f2afso3580856b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1749538849; x=1750143649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUJitp02dLbwyW6XXbPMt7kAqtrb2lpqnpotbucX9CA=;
        b=dtGcd7wRQWbYXVW4cPdjrFKOIBrbFi3WDWaK7NW2K73TdOc4KAlxMd2EVnHR22IX3H
         nkJUmm2LohJQzU8ZT9d3DqS0+HPANe0dMuy5WDAIgVlRLtu7JHS/LPOisEIF1s+vKMh6
         +MAxwRlMf1HO6mSCZJffHi+1YqBjSrNnoeMxkykBPZvZvBxtjkcLq36m1RsaQfUpcc3i
         H+Znmjj8POkJWaKy4KoEokiYSrC3su5AWljkfHoC/axQ0xVjyvOPDGMxTF44XvKlcgE8
         iud94qfA9k7FXCKOXvZBDlO0mtHnP3DhcXLNFAOe/w65cCnm6JJvMipnjdKK49steX5s
         KRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749538849; x=1750143649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUJitp02dLbwyW6XXbPMt7kAqtrb2lpqnpotbucX9CA=;
        b=r69QkCgkXvEgZvK/L82FeS5oZxKaflnonnrMqEYxZu2afIihe+w6xkAcVv+ThAxRR5
         tfX30pDSrZTHQgAtJZH8veRvkAZMD7Uzpbu9rtv5jgJraN9WYL2I3RlyS9O09UmKbWdu
         kQaqYrlhc/ETpqv3KobedJ3I+LOUhGXaxxD2cT8V+BR9iz0dlV4dSev4LBJKg7LZHFHc
         qkQigq3BDq/+BWje75gZobF1uftk36Ih8orY+Lcd3ntwo24CqIUZmx9nQ/vtYzuqNBxD
         xnFAFYdPyjplSgCOxEgzGR6M2qceqvkZe0YXrFIt1wCuxK3POcSGVTff1XktWB0X4aWZ
         ihSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYLH9d7SZhLu01lqG3NEOSYN5A2G6875iQ5LoQc2eRE//nx3jbdzIIaWtvbsYVcgCdBT/yUQ1OML4W5vM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvOWnsO8rCNh6G2P0OAEbeeFfiIr5Q5b2SCGLbQSC4G7bip3/C
	OFLzbik/2hganlnuxnDLMRLKC7Yyn/VIeLv2XGvx+g6vV9I2ivRkDhltgUpPkUs78nI=
X-Gm-Gg: ASbGncuiKzXV0hkC58i67pAoaf+2HaeIAIb+c57dAlMiVa2Dkz7P/7ck3fzdQXcny1p
	BmafTmRlfgdPkLARL2lQaI8VV2syz7/hMMyMOPQTHVM+d8bZR0RWhgzoB/icRnjOwGld39fNctM
	3lkgLTrGxEOGABYrE1PslrOlxG0WTsiD8CwbLXlYstP79OeWXLVLguqXBK5zDfsnsQ112PEAQoa
	tWq75+XA/8eFJGU87eHBqVSaq4imfDbtcxVEQci2YJGeIpYIY78qbJwwERZ+l1NZuTwUynaKJvs
	m/rt7CtuT7y/silCmNToex3Rbe/8Shi7pW0/PbGN5oub549ZlhK32gQgsRv3RTw0PTKOgN3qZui
	gJ2H1nZ3ArDRp7RaXF65DeIw=
X-Google-Smtp-Source: AGHT+IF8uzdNqEI314pocfYYQWBeowDkb4F+LwQ50ySlNHswx1qiGOLWHPFnpEwYjMluBjhKg3WXFg==
X-Received: by 2002:aa7:88c1:0:b0:748:1bac:aff9 with SMTP id d2e1a72fcca58-74861888babmr2307166b3a.18.1749538849387;
        Tue, 10 Jun 2025 00:00:49 -0700 (PDT)
Received: from mattc--Mac15.purestorage.com ([165.225.242.245])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482af7af0csm7038483b3a.62.2025.06.10.00.00.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jun 2025 00:00:48 -0700 (PDT)
From: Matthew W Carlis <mattc@purestorage.com>
To: macro@orcam.me.uk
Cc: alex.williamson@redhat.com,
	bhelgaas@google.com,
	davem@davemloft.net,
	david.abdurachmanov@gmail.com,
	edumazet@google.com,
	helgaas@kernel.org,
	kuba@kernel.org,
	leon@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lukas@wunner.de,
	mahesh@linux.ibm.com,
	mattc@purestorage.com,
	mika.westerberg@linux.intel.com,
	netdev@vger.kernel.org,
	npiggin@gmail.com,
	oohall@gmail.com,
	pabeni@redhat.com,
	pali@kernel.org,
	saeedm@nvidia.com,
	sr@denx.de,
	wilson@tuliptree.org
Subject: PCI: Work around PCIe link training failures
Date: Tue, 10 Jun 2025 00:00:44 -0700
Message-Id: <20250610070044.92057-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <alpine.DEB.2.21.2410031135250.45128@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2410031135250.45128@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello again.. It looks like there are specific system configurations that are
extremely likely to have issues with this patch & result in undesirable
system behavior..

  Specifically hot-plug systems with side-band presence detection & without
Power Controls (i.e PwrCtrl-) given to config space. It may also be related
to presence on U.2 connectors being first-to-mate/last-to-break, but
I don't have much experience with the different connectors. The main
issue is that the quirk is invoked in at least two common cases when
it is not expected that the link would train. 
  For example, if I power off the slot via an out-of-band vendor specific
mechanism we see the kernel decide that the link should be training,
presumable because it will see PresDet+ in Slot Status. In this case it
decides the link failed to train, writes the Gen1 speed value into TLS
(target link speed) & returns after waiting for the link one more time.
The next time the slot is powered on the link will train to Gen1 due to TLS.
  Another problematic case is when we physically insert a device. In my case
I am using nvme drives with U.2 connectors from several different vendors.
The presence event is often generated before the device is fully powered on
due to U.2 assigning presence as a first-to-mate & power being last-to-mate.
I believe in this case that the kernel is expecting the link to train too
soon & therefore we find that the quirk often applies the Gen1 TLS speed.
Later, when the link comes up it is frequently observed at Gen1. I tried
to unset bit 3 in Slot Control (Presence Detect Changed Enable), but we
still hit the first case I described with powering off slots.
  I should be clear and say that we are able to see devices forced to Gen1
extremely often in the side-band presence configuration. We would really like
to see this "quirk" removed or put behind an opt-in config since it causes
significant regression in common configurations of pcie-hotplug. I have tried
to come up with ideas to modify/improve the quirk, but I am not very
confident that there is a good solution if the kernel cannot know for certain
whether the link is expected to train.

Thanks,
-Matt
