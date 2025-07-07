Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA09417A309
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874452; cv=none; b=WIY9wmm+HLP1Sj6LxWzIR98Ju1mIPzqfQMh+2pKJxDVnZDvFESdQH7wCZ0AsH0Qs0i2dEsNg6YXNCuLDRQ3WWoK72bqROKj0YJuHA5QK3v/W1UnHHRjaSB5lj2kbzR5m7OOkFrWoOhWlGS9b3utXpPPs8NCAN9ElHCIvh3XpO+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874452; c=relaxed/simple;
	bh=BZ/i7D3Fc2MYVPXdrWV2hmtb58E230EyApACw17hjjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bKTvG4czGtipgaUyi50hZgOexSWX/ZuD1fO5ndYRJvI60BosbKNOQUusVS/xou3W/hjDWhIFwf70WQ4Cl/Dr7VjkHLpAl+XkIwY0OY76KTZa+93G5+3eU16fBkh/76SZDzD/dbIvT0SeoKMvjTP9kB5YXV2bMwF4R/J9aF1z6Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1649377f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874449; x=1752479249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+O3gb0TLmjsa9X8epzCEQehACiPmMg+pJInkJMmT7G0=;
        b=w6PKeOWiJgnMcyeWZvldHhq4ySYG0LqnGZ6Q77KLSfDwAiLdGQm7XiZI1xL4aB3H9o
         wy21gJC4aWL2FGZEC2etTGY96/zHhxGIyNdOMSIM/k+UozcTvEQ2zCfAmR/gfoisQYcg
         zB4uBSbKKKyZ+IWTgRGEkKrxbiwe5BSyOr1J8xS4i+j2B68TnQD8RAMJ31ymIDC3OU8D
         h826+joi11m8YxjKTNFPCuiirJr1+a1T5HTCRt6yOOhCLJWCVoV8IyqO5D/3sd+2VBsQ
         K8DFkKEAdS4QuyvV7ELwTXfIENcGrkXt4p1aRWFznkFhNfQymoZ95KshWyiSy0Xsp/av
         TzVQ==
X-Gm-Message-State: AOJu0YzMy0PuPmRp3E6bBctel5qnOGejJPNc1nUwsGd9rvVUU0WBnVQr
	vjVnaHzt+4tC1CB5b9qvEFsnrF5ocmSGt2mlgK9Kef01KyEPhrxAgfdW
X-Gm-Gg: ASbGncut9pe+8rTcQK/kjVypXuI9/+26XGNa3F7ihdZWMf/V/OeemAYSgQYSEl18YMH
	2cMsW8+Ra2hbQ20JsYPu1VNyP+98JZFIP7uF06F8QUQ7z8i8+0Usa+dhXV7/wXGKcHXc3EhNVZh
	+f1p31aij0B+Vz3CYtQTcHkIy5gHU2zn8D5OGAjefcQJI+FtHWlkMX424Q33eHS8evKqSwtPg+k
	4V1oE8EXtHnuy6HepFwpQlg2Vv94aUKFve8fYLdIV1Y0sgeIYcxenz/gD7p2/DwEPliOr6BvgGU
	EwnrgKnGtkdi+cFGfLzHuiGhGCuW5ngWJzBEJdmvW0adWR4HusyTZIBkZVkEUnnPEtxktehHShi
	8BMtkn4iPbKLCSWokJNNOC1A81B5rceYoQFIzsr1m2n1JP+JMeXHjI4i2VL8t
X-Google-Smtp-Source: AGHT+IGFHeN0xHr+fsnfWp1z2oN9F4FDXihmkmRcv2OZ3EyoZpl0YZVkkHnAkreKjV5IXRkuPyNW2A==
X-Received: by 2002:a5d:5d11:0:b0:3a4:eecd:f4d2 with SMTP id ffacd0b85a97d-3b49aa7756emr4700891f8f.38.1751874448985;
        Mon, 07 Jul 2025 00:47:28 -0700 (PDT)
Received: from mayhem.fritz.box (p200300f6f71c45003fa4d1e815666221.dip0.t-ipconnect.de. [2003:f6:f71c:4500:3fa4:d1e8:1566:6221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0ed9sm9499960f8f.38.2025.07.07.00.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:47:27 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Johannes Thumshirn <jth@kernel.org>
Subject: [PATCH 0/1] mcb update for 6.17
Date: Mon,  7 Jul 2025 09:47:19 +0200
Message-ID: <20250707074720.40051-1-jth@kernel.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

Here's the single change I've colleded for MCB this cycle.

Abhinav Ananthu (1):
  mcb: use sysfs_emit_at() instead of scnprintf() in show functions

 drivers/mcb/mcb-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.50.0

