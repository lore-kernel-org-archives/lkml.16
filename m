Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017AA2D9ED7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882753; cv=none; b=iIvh7/L3nm2FjyBjcTGEjXfHmFyJXZWavZkrnf2Y0vb4XGEefMuO5HRvBg/AyBkZYMK1Obwk5p50a373lE/ta/0h9ZIHa4F/pg2FdFpvtA2QWxjCVDlV4Aof4j8wXBSqAI6YL+viThyAd22UZrFmjFFCEgcdFYphpf+WnaLj0d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882753; c=relaxed/simple;
	bh=h7rNjT3qiAFAf02O0q1TiHR0k+rR9JvQ409LLZcGSDw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RE02NLZs3nwsXfl+h8DxhedSrUwtTqItqZcawpYco9UfoMrZenVDXLNVeRPprRzS2P9ZmaC15OMRbySfs6haa5vbvNV5DkKKhJI1fQp6buMzG8xGk/pZLngGxTJGb3Xr9bRnCYZZpSRXXmgSFsEjlzPL4V4QJPe2NsWOGAhSvwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtH+WcwU; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtH+WcwU"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4079f80ff0fso884907b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750882751; x=1751487551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+3SW8vJVKoCSfPWTHdZMGnwJ8NA6WVZ3bsZQcUT5XA=;
        b=DtH+WcwUWlIkTOdYgvCFwoHxa+nNZu0v1r6qe7xGhs+UgYiHI7Mhph4M4LoZJXMWty
         jMA1dx7KF9KIpJ2lcbUb6VYphRcRANVpM7kv5+B2WdZq7wZyDNbKfIU4BDy1sZ/E/Ld7
         PEwejlONHo431dtYkLnkhnCzdNPxt4+cZhCY4qCcxZbPmuNNFldWTUco6wXvBHhVVesT
         jXRVNQJNQZSKR43GNTLbwusOqT8S95j6EFriHcRLet/e99saUi4shkIfq9Mm/D0I6cK1
         3ck8VyW3jsEJrw8yp23ptpKIlzZUukI8QW6M6ZipyKqKi5ozHMr1bfZFoAil/1w50I6r
         dweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750882751; x=1751487551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+3SW8vJVKoCSfPWTHdZMGnwJ8NA6WVZ3bsZQcUT5XA=;
        b=EmTKGhtElw3qosiCsoo56b08YgGwQo9VDhLdYJS6mY/raGR/8Lh5VBPyCyPp5C/m4x
         Tkrg/DQZpgoDjDkhGVfHP3r/1yN9vi5g4aEjzh2uboh+X60Vs86HaMyzaXs1jHY7el3L
         8mPOEEqH2PvNZqQtRGpSMpU5QzGrklTy+AnPE3z49TIqvZqz5809bQ19PF/9DKOR8djN
         x7ErgWk+fUXMR8MDIs9krd+ZvIz7zp36S8A0PPiXWVeVAa7zjywLgcF6QLNtpad1Eme5
         moKoY4VpOFDstcR9pDC6QKNgaz3ExyKj+FeAqJMDJ6ZGqTv6lJ8a+xgMfapXbvIMQrOt
         BGDA==
X-Gm-Message-State: AOJu0Yyh6aaviNMpZngibSAKmw8B+sdW3N0bO5FqrtTy//ahP5/Id7aO
	j+blubUebFbBrKP6wR8RMGmDoR2Be2VRri2ul/klZMIsHJ4OWHuTfs5Iel60dVq7
X-Gm-Gg: ASbGnct4HfmX7dz19nnp/znFa5ntcE8sZLjPiQ/WFaeQ9YjmXIGv2ZHuvVgJSpbm4X6
	87oaLzqA+o7Xte/vjp7VVwR/u72Zmh2fLlcDT+UZW127RG/tfQgtMx5rrZHwcrVfTpz9Huh1hNw
	HoYznt8YE8A/erSBg6xiv3D56AlkLedf2gMBKP/H0QOz90lSy6NfXOADmpBhVfub4b9lYzwT4N7
	jZxlCYXhx/ki7c/WXvLqJEvDubQzeB5s+WQxqnRitngqckTaqvhmw+ZOFla4zecSX3Z0EHlVhaG
	M7EfDyoguPUyyFpufUM3rvYdjrvGsSjRmQCAOonk59A6JrqqGVjy8CPa/Ho68003ksdu1H6Je+t
	hahU5YnU=
X-Google-Smtp-Source: AGHT+IH3tdJswFN36V2uHSc+zADQ3AIuPT/3nG6JE2jqxtQe0s1SSwBgNwMBzhMPrf7gPrzC+jyOYQ==
X-Received: by 2002:a05:6808:3021:b0:3f3:d6f9:69a5 with SMTP id 5614622812f47-40b1c8ca908mr942017b6e.8.1750882750920;
        Wed, 25 Jun 2025 13:19:10 -0700 (PDT)
Received: from localhost.localdomain ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40ac6d22c23sm2319188b6e.42.2025.06.25.13.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 13:19:10 -0700 (PDT)
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
Subject: [PATCH v10 2/5] driver core: don't always lock parent in shutdown
Date: Wed, 25 Jun 2025 15:18:50 -0500
Message-Id: <20250625201853.84062-3-stuart.w.hayes@gmail.com>
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

Don't lock a parent device unless it is needed in device_shutdown. This
is in preparation for making device shutdown asynchronous, when it will
be needed to allow children of a common parent to shut down
simultaneously.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
---
 drivers/base/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbc0099d8ef2..58c772785606 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4823,7 +4823,7 @@ void device_shutdown(void)
 		spin_unlock(&devices_kset->list_lock);
 
 		/* hold lock to avoid race with probe/release */
-		if (parent)
+		if (parent && dev->bus && dev->bus->need_parent_lock)
 			device_lock(parent);
 		device_lock(dev);
 
@@ -4847,7 +4847,7 @@ void device_shutdown(void)
 		}
 
 		device_unlock(dev);
-		if (parent)
+		if (parent && dev->bus && dev->bus->need_parent_lock)
 			device_unlock(parent);
 
 		put_device(dev);
-- 
2.39.3

