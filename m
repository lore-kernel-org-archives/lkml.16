Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8992DFA58
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882757; cv=none; b=R0v+knV4fRtgls2b2JX6UyQq6LMzTOocJrEYeyyJ5B0vPNh3Z6N/a7HR5KLzR8zZCDcIGhN81qTMW4o9oQukemKPMOcG+fA2BPW5PrZJdgdjLAzDYx7ZFueQwE+hancV+DTcxJDr1k8a+KUuWp8peTDSWbSozV7G+82wbNtuwW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882757; c=relaxed/simple;
	bh=UghlVNqiIgpdScPnDJwUCgMkfLA9c8dgrWlNZ4F4kJI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=On2f8ZNqQ1R59dDhAHOwJGLvG9r+V5tgdhMdwIuVihGsTApwcqe7wh7Hhvf8dKJbcvulyi+HqQf09GO3M44++Y81SRDauQRCtkzI4IrgTa80lrX8aSqEDttGbUb5UrbLUeXwruFQu0BHjIRYdKR7w5Uq4g8k//rWSmaKZUA0V7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzgU+FC6; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzgU+FC6"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-40a4de175a3so218420b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750882755; x=1751487555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+kL5Owd/b/uNVufMn9kQ7uWapXNIP2yBqmENsKSMRw=;
        b=WzgU+FC6DdUkuBpN/NERAF7SKWjYrA8E4lrdWUPljUkSSM0YWeQppIKDRq9Bihbvkh
         WBGjpKNcpm0rWkFJNOiCR90B+i4algKh88m4v9Vk0642oAFkIWJMmFfwf3r1viOuFk53
         uf5SZF8CAWJd2a7Zb9GDGEyGsnXfoVrlgX+QdRspskJNdJY0jQ35COonVIxM+JkZJh88
         1J/NF1ZW1mUAJhN91huTqm2jrjiRugsTBHyc3BWU321vtRKAmjsO1XymgHpGFIp/LJ7i
         fbO7oOHJdzgKhCjjlsomM8OrN6A850Hj/OqlgazUO0UxTokf8pKshsqVYrvLmcepo6f6
         57ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750882755; x=1751487555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+kL5Owd/b/uNVufMn9kQ7uWapXNIP2yBqmENsKSMRw=;
        b=NgwHwvJGMP1uTBzyIbhEuGcOsatlhuVNZOibOEZNboZ2IMOKivVDjqj2dpLfvt9rNp
         aiAicf6qruyrQCnLOnaoFui1ubH56lv4n0LFHbysIdJXEKoIwMO22N9UeLu31b1SHP3B
         iyXhfQYQrey4b/oCffBfusbZLMG5y87fkIyuHOi1diX50Q2kLJSWhQjbXL0PEPNLs7qQ
         yv1mTolqzkWC7FEb6cyX33sAu/nuz9MouxU2vWo6k8k0TYyMxNoO7UJFvNI3zZt9x119
         TduqlmERjAdOiR2w/R3wckCZ98QTzn7T/1puHRIMMsGnZGxhXv1dCxpb4Ww4AxElUbPD
         Dahg==
X-Gm-Message-State: AOJu0YwbEXFz9dJptQzIAYNnzFnsq22TT1Oo40PwyBVPPIQXpcFSPYrQ
	PE/aQ0KSFmkF8xUql0oyVPQaV1zOlOusghhRrGx3eYMB9YiTO3RsyTtOIPE+j9W6
X-Gm-Gg: ASbGncvUrjifjx53g6oZEqxMGzu10RtWcbJ9Wpli4y6JEn7L/+kw7+Csq2VdyuCvsy+
	x4lQgkQZjOVgWhwPgPW0rItCpyotRqoHnOLSU5lyXu2a4Jxxd5FbILFOFF7lQoXR18OEOk11LyX
	PKfXY1FaAGwiqRT2RnURkSbTMiLhMANbV7XzcKKEpeghBkuDwiXxxVlfJg2ZI+2hkRNyqnh/afJ
	4w5LyyP58pIUzqH9KeOwTZp8sHLHaaHYrI81Cy+lX41vJU5xLxfL3pNHLRgF+vOsMY7hfyS1WAM
	v67Jb2pAwTshLuNaJvY2lafypBodd9jkcFWBZAwwSAqGUM57hT73eut6Z5jxkCJc+UFjKSqpAQW
	5YUZu0ec=
X-Google-Smtp-Source: AGHT+IErlKTN6Obe2eJ+hIRHlWBHfaYeu4HODg60y4Vj953Lq/di1qxS4riYzV3zaqb0HmNNI5o1iQ==
X-Received: by 2002:a05:6808:14d1:b0:40a:57cc:d9f0 with SMTP id 5614622812f47-40b057d76f4mr3175226b6e.25.1750882755168;
        Wed, 25 Jun 2025 13:19:15 -0700 (PDT)
Received: from localhost.localdomain ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6d22c23sm2319188b6e.42.2025.06.25.13.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 13:19:14 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Martin Belanger <Martin.Belanger@dell.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Daniel Wagner <dwagner@suse.de>,
	Keith Busch <kbusch@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	David Jeffery <djeffery@redhat.com>,
	Jeremy Allison <jallison@ciq.com>,
	Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Jan Kiszka <jan.kiszka@seimens.com>,
	Bert Karwatzki <spasswolf@web.de>
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v10 5/5] nvme-pci: Make driver prefer asynchronous shutdown
Date: Wed, 25 Jun 2025 15:18:53 -0500
Message-Id: <20250625201853.84062-6-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
References: <20250625201853.84062-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the driver default to enable asynchronous shutdown.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
---
 drivers/nvme/host/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 8ff12e415cb5..727527ef3896 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3831,6 +3831,7 @@ static struct pci_driver nvme_driver = {
 	.shutdown	= nvme_shutdown,
 	.driver		= {
 		.probe_type	= PROBE_PREFER_ASYNCHRONOUS,
+		.async_shutdown_enable	= true,
 #ifdef CONFIG_PM_SLEEP
 		.pm		= &nvme_dev_pm_ops,
 #endif
-- 
2.39.3

