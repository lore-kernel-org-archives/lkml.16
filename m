Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972E021772B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944790; cv=none; b=FJScDOEH9WcFOVRYWsvqfDs2MEthg3D9G2jrz8g3U0GV61aZzRnfVZ3SsaDW7G2/B1QetzA+SKA13dEOGQIrLWxmGT/Qa7LJ0bEvxcUKdNmC3vtljcnNQigBvQ1M7Sdvncjg2OjXrilVfmlpZ2hc0UegV/Vy12jdGy9GjAUDVbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944790; c=relaxed/simple;
	bh=Ea02xPOzaJFRPwLpC5XYeQyxf9P03cTd+lWaLbeSZ5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbhe5QrQWnss2mIi/Fq2SSpPBp5Uok3GErYL+0zBSe3oqiKB7Lq4/tMW53vdB9sV+euyt3XxhFKAuUwkMbSzcZDSlpYtxk86FtjprByhdr+tJRIWCzZd0gZlhcy/EwZ8wozB2wxozYVnL9gt9xjzDl3YKHsTqo5iGoJCGdMfwK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ddOlfctF; arc=none smtp.client-ip=209.85.166.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ddOlfctF"
Received: by mail-io1-f68.google.com with SMTP id ca18e2360f4ac-85b43b60b6bso1018739f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745944787; x=1746549587; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kVHP1h0FhA8vh77DKQEGNILt5KJpnumqkzmu5LvDnek=;
        b=ddOlfctFK9ilDnzCXIoewHmr8V91bOU0e33Jj83vZYP7d5gJv+O75fQUSYjYh2epNO
         tTsn/hf0yjmWhX9NmaSWDa4Y4bpeo5zsZFu6xaxj5rKYJDoNz8Os19OJM8NVDMd/XI53
         KBztglk46c40/IqgbFYwzUEva54RZAI8K8fI/vKh0P8rTsu7Nch9xrTI4qMA3RNSdkmt
         vHXayOtA4JCmEfoDw6nGbKevAmcrgt0jHhBKtllbMdZYwKKBU+n9BXKtP4CSA1EZ4v9w
         EotyT1wenJRoFVXJNXPzM4dDP2/FOIW46utlrwTf+KHgdCasPcy9S8Houfej1N+DlWL3
         Uj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944787; x=1746549587;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVHP1h0FhA8vh77DKQEGNILt5KJpnumqkzmu5LvDnek=;
        b=uBacaWDovPwBsy3N4GMHIAunwpxnxXvitpGH4yjhuH1zOFPPQMzEk1wRDdRgKlDFPx
         jpQ8bYP8UFM44hghJrIfc+0NNj+AwFb0yn6s/ZEXw3JjxHC8dSPEo988xbQ5E9bmC0zL
         u1r86fdMXEKnntM+13Fp1JXYmRG5SX6E8JQrPEFQa/foRn8WDn8/NPvuosH0IWmsjjVF
         MF+fJP4Z+L10tJFHKizG33m6RcMxWpCkVyAHOVrqoJgRvwsU6hMYhhDewpMJuNsUWHlD
         0WztPDxcvVuzRRz3AF1NHnk+hOqsXRoghj+72EBcguyjpZuSvXamHtUyfTzcsblfCL+e
         6zsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1Mj6AF35Vw5l5w6/kAU79j9QPITbhpnBZao3mX3wvXuDld/1upgu3unxuRoTf90mQ3NMSC1A8DrKB2U8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWtB8yCR93sSnOSv2uACS60ucdAqB+WLVwtICBwVR4IvzL9eKj
	od2/q7+CvBGmaCY6kwtyIFYnqLaIi5sjpR4da/UFNhOKyxyrq4h4n6xvXTJEfldBCmDPVH+WYD2
	yiwAgOw==
X-Gm-Gg: ASbGnctF5AUCZthJTx3YZc0M8qngowLds9WR8u1aifKEHy9kBL94yYvMWCXOtygo1op
	d2HuwzhUEO/YxWkh9ejZ4HE+Inymi/abCvKu6mUeQ4+MJ+kKwfESFi6JbFlDHu2bEWhNi9N8upK
	/Da8tz2Ss5c7mkc74d9cnHukAxhtlt+y8X3dz7bn/bwh4tCiqIb1h/M65euyd219i25rKgzbruh
	m4WLwYFPCGnWdYAzAxne/mVGUQk4VbDooefqS4P+5+22eTEdmOpKCRcYa69wZ61SJTpcNDQEYIg
	8Ou06RpH5Bk2JxFAtABbjXFGrDqv/ywIwQcoOxs1eZIYSZTw
X-Google-Smtp-Source: AGHT+IHIRuRCn5egZBsOPgCsa0klPEqz/M5zuoaBUYj+b9wi0hp8Qj7ANdB4KHlWZkpvOWGbx5p0cw==
X-Received: by 2002:a6b:e706:0:b0:85b:5c9a:a9ce with SMTP id ca18e2360f4ac-86489d5e7a0mr441239739f.6.1745944787611;
        Tue, 29 Apr 2025 09:39:47 -0700 (PDT)
Received: from purestorage.com ([208.88.159.128])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f863149aacsm351917173.111.2025.04.29.09.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 09:39:47 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:39:44 -0600
From: Michael Liang <mliang@purestorage.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: Michael Liang <mliang@purestorage.com>,
	Mohamed Khalfella <mkhalfella@purestorage.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] nvme-tcp: fix possible data corruption caused by
 premature queue
Message-ID: <20250429163944.tvyrxt7z6c55abk2@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Changes in v4:
 - Change subject and add "Fixes" tag per suggestion;
 - Link to v3: https://lore.kernel.org/linux-nvme/20250424161438.g2fyo4ozvburf2rh@purestorage.com/

Michael Liang (1):
  nvme-tcp: fix possible data corruption caused by premature queue
    removal and I/O failover

 drivers/nvme/host/tcp.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

-- 
2.34.1

