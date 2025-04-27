Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A550FA945
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 18:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745779158; cv=none; b=GW0IGXVHCrMjhnLPPvoub5Yakfh+c2gTbipwj7x5D4Nj/NJiCSN7DVeXyuVX/WRmu19lGEl5Gbl6nttoi38QQG9RN2I8nlX0zb6Sy4Elyssmw3f+5nf+MPlQlt2Wsyz1rG4ggTkeHKIoyjJCadj3B99tx45PPis2uopBXbPnWcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745779158; c=relaxed/simple;
	bh=/Oty4APdpOaC12c0tItDHcnPrQCmvjTrlF7iA3pIs8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bQVaZ8NOWG9O+vWf7UFRZ8CSG37Zi2ROdPxUUQJxB5jYwiVcVXYWDngnNJtK0ySv6wj8EBdzF4mnpI0OJfRA5SiyWnM3bI8w8BgC0KdWuT9JF40MFUOwtscrN3VCqvN3BJEZ/wsOnznpE12YOhsHhADINkS4N71D9EcTFYVHEmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=svedman.no; spf=none smtp.mailfrom=svedman.no; dkim=pass (1024-bit key) header.d=svedman.no header.i=@svedman.no header.b=Axh9ZLJW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=svedman.no
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=svedman.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=svedman.no header.i=@svedman.no header.b="Axh9ZLJW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso7653414a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 11:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svedman.no; s=svedman; t=1745779154; x=1746383954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vC9PKRxcLojTe0qDyAKdDduFgtUilXjkURNaM+aufB4=;
        b=Axh9ZLJWcFVCjEwdrMU9G8fVjAE6OqceGQhrqYRAXyc33gyJ1QVBBruLytCfeccxbz
         86y1GWrkxQH8OFBxrF9jknmicu4Ox4A75RPN0uaO8NAQcrQ2mXSRMeDS6d2PGWvg9elU
         /w9EgXveC2Xevm9UT2nwPjRpsD2h485DgvIvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745779154; x=1746383954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vC9PKRxcLojTe0qDyAKdDduFgtUilXjkURNaM+aufB4=;
        b=TKznDGJCUC//9dM0d/snPQlQg6BJp33Z3ONDnFB/4kdQtC92VaxeIqXXv+37oa3qy3
         LosYtINgB0nRMm0zrcA28tvPY1x9Q5MUhOi49NU0DQbzzpnsD7OW+0bjpOHR9a0hppG4
         sy4G0Itjmff/br6IHUAKglOlX/ei+6CyrFqUXXb/Ll7ABNyJ8x/NoTBpvtBFDfNNtWr8
         tXFGIYpo+RIB8qQx9ryBu+Z96mxXXLo/idD/y9PkNlvtAJVUzx4UIL6F6Yl2fqdevZmG
         etcdBYfVaUI293qjHsDwGtZYQHEbL1I76eWN+N+n/hDT8cNImYxRq6jpxHFx5nJNHMkF
         ocEw==
X-Gm-Message-State: AOJu0YwNVWYSKf8Mg4mA/ymVujPq1zNnaoF1ZDao5BZMwFY6LDXcyEXg
	oHV3rdhW8Aiqyx8rsAN50TMylYlHXwtQeQZbp4vRnU+/4Gk88kB2PnkmhGfqhGfNuUKs7Ry+cQb
	0gMU=
X-Gm-Gg: ASbGncvxOnYiVw2cV6ktF6vxSsxsNzi81IdRMNjlJt4ROUzpVGXMXO715JMy2rhStuS
	KLEQOFXbKB3fJwC94nhlhG6v2Ze0SZOkVwzxldMFmsJEy2bi5w29cbfcs+mKhpC3fRVWO4+GuLe
	t2hQTrrrhghHjiWwqnICNlqaAajDprENAaxFqtVPo6RVhSKdrIVZL7qCXhiBNfUSZMKmx1ixlbN
	fbWF5AehKlUQDGxbmdU4WK9JKTAsGCOPBS8xee5HycVi1H8+N5ynm5S1kQKSqMAoh5LjUvYlIA1
	DNJw9YV7BL23NG3ntpd4jBRmXZsQBfKpJAYKzIwKoDNIEevfrYg=
X-Google-Smtp-Source: AGHT+IHY2bAkXFDMWM2zP1qg8IDZEI0wlfSdWQtWSt2+vgAhqqcOz83Zlb4Nhj1SX/0GSTXD0ng5FQ==
X-Received: by 2002:a17:906:4ec7:b0:ac3:8899:d2a6 with SMTP id a640c23a62f3a-ace848c23e6mr432324666b.12.1745779154565;
        Sun, 27 Apr 2025 11:39:14 -0700 (PDT)
Received: from localhost.localdomain ([84.214.109.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7326sm492432366b.62.2025.04.27.11.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 11:39:14 -0700 (PDT)
From: =?UTF-8?q?Snorre=20Trehj=C3=B8rningen=20Svedman?= <snorre@svedman.no>
To: linux-kernel@vger.kernel.org
Cc: linux-power-supply@vger.kernel.org,
	snorre@svedman.no
Subject: [PATCH] drivers/power/reset: add missing space before '*' in a comment in syscon-reboot.c
Date: Sun, 27 Apr 2025 20:39:10 +0200
Message-ID: <20250427183910.145641-1-snorre@svedman.no>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Snorre Trehjørningen Svedman <snorre@svedman.no>
---
 drivers/power/reset/syscon-reboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/reset/syscon-reboot.c b/drivers/power/reset/syscon-reboot.c
index d623d77e657e..89a9916ee0f7 100644
--- a/drivers/power/reset/syscon-reboot.c
+++ b/drivers/power/reset/syscon-reboot.c
@@ -76,7 +76,7 @@ static int syscon_reboot_probe(struct platform_device *pdev)
 		ctx->value = ctx->mask;
 		ctx->mask = 0xFFFFFFFF;
 	} else if (mask_err) {
-		/* support value without mask*/
+		/* support value without mask */
 		ctx->mask = 0xFFFFFFFF;
 	}
 
-- 
2.49.0

