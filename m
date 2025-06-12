Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36C9232392
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749768993; cv=none; b=lXrvw7BsPW6VWcZrUqAPvfvUfMI3lAvS/sbrAI0KU+dH3Wzrke32JxR+hg8mZW1mogTW18buWvvmMfuIabm7JXdQtmbajxN/b0UGv8+SObRWOE3rnDBnoCd3w7PNUc2h5u3gajGWn+LlRyu+dfpROuOzISIqHOfsXiOkTDe57ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749768993; c=relaxed/simple;
	bh=rzO2vUG3qFvZz9nVJkEDXegLFrtHvbT/BioXWBPlI5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oXfU3iZbNxAEE7HXsVMS5CZE+gpImDsHMA+lNu8K2BM7N+a1Efd7ZG8KwtU0ZqIsFYNFIkRlF35yCrb/GDU2xy4MVwJzPutC+Oj0hx3+imJT2x3OFqxaOosBTx8LSTPqdB/hnH1OokPdLk+/6K1wgr/ITu/wjbg2XzKKtm0/Ypg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TidBy6iv; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TidBy6iv"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3dda399db09so12529055ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749768991; x=1750373791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gIRR5bCoil2FaR591vuDwUpsGCoeLZpb18iQYK0axhg=;
        b=TidBy6iveGvZoJ65T3YqYJ4/Ryr0IkwmVBLPo+0oBBwqPPYZk28JnmVBBWc4bnEiTU
         tMS49PFVNh5Hjg3OABx70YCMx1gTypm1ETF3mw5dQkxPnc4NXfAvgqLz6mwTYjJqE47w
         yMxZrPY626qnJFLudWQrna6LoZhmMEj93GJ0KA0wj5QFS7Iq7yUD+y1l8dUcyfYow/L6
         11sRT5scTK6zb4/c0mqzNHP3tPJTO7MPSxOIjMgYQv810Z5HRHixSXB8OmHtTJ3+EsXe
         f2W7+QnmPKQwTeO5qPRC7JOW1DoIvRm89VLI+9YwpgWIy7tjjn8v4iEVZDwJ+cnOYQQt
         39wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749768991; x=1750373791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gIRR5bCoil2FaR591vuDwUpsGCoeLZpb18iQYK0axhg=;
        b=EZ/AJ1vRWF5/ntKFg829yf7QYyyvKgeN7QwAPo3R+hqpmLhhbracCSuPCYh/Dx9n5E
         OlI0GQn+23S2rU0yA3CGtHmys9KE5A5k9QoIy856hGt66sYKN1ODnYcVcSOe52rxcIU/
         OTh+1FZI/KAKJNcpnDrQ7Z0kZCWMIIrnkFScA9QkgMcby5pDYyRBYtbzrln1yFqWJ1yR
         GZqxo9Y+qd8Obi0aEJsXdifY5TocDOZSQrVVxK22qk1G0MV/0OVbJul/fAplq51vOs4J
         RonLQBpEOhR9/8GpRghHXWRcAGSS7LcHH/Wkd50ovdFtmAHtV+XyKs/R/R20RYkeumG3
         Ypcg==
X-Forwarded-Encrypted: i=1; AJvYcCWbNLHNLrAln8++XGh/gxzjUpJEXSvAXlrrI37mUn294FzzneNekowALz2nximzu8AIOAEicv5xzqUfTnk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpg10zyjPm20wGaCfjHnBLZcM6/FVA7Vc2+SfdA98Znqd1aDAE
	IPW16ooWjSc/HiYdBXbYvp/iFsyFmO91vcVCJree4ktY2gyMxLveTATLw8M9MUGBitw=
X-Gm-Gg: ASbGncs3c6JAryTYprpSd3eUtxJ/a6VHAOGlEh57XtvL6ZTC0ZqAIdYrvUa/S9fbedg
	HXKsb+wroYHom4LTqgI6kiL5sFn3HWQZfyHXTUmekBYA6aHJH0TMRbJRISWlz8tgcqKk9oHh8y2
	OEOJusg0bzuiKU5MDGE7xpsgm4PGpzlm4BLYuiKoON422RocU8Jdb8MoiECnchCgLErrQAli/6a
	VOpZ6MneZQt6vJscFq8NZM+3M3cFs8Cf5r1DJke282CqQOqslGyUlrYIcJKQ0KKcbvPm3yfXzhF
	V8sc6lTmMh3vMX10u46hgcWxBh7ZpsKbCDQimHxAKUhgncic1AYESWjDQX3R/QDz2oef0ZH+UC3
	kqgNcxqKL7I7VR6eZGoauY0kV/Z28h7QhzE1l0/O9iQ==
X-Google-Smtp-Source: AGHT+IFl/qtFDEOg7fq5AKLUPKjkJzQ1QBSvDDw3zCkODT+b5Ce6LNmP5J2eqcw2VDryqjSPHaqh3g==
X-Received: by 2002:a05:6e02:184a:b0:3dd:d6c0:cccd with SMTP id e9e14a558f8ab-3de00bd309amr7524375ab.13.1749768990866;
        Thu, 12 Jun 2025 15:56:30 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019d0c4bsm209125ab.28.2025.06.12.15.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 15:56:30 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andi.shyti@kernel.org,
	dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: elder@riscstar.com,
	linux-i2c@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: k1: check for transfer error
Date: Thu, 12 Jun 2025 17:56:25 -0500
Message-ID: <20250612225627.1106735-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
complete, or if the hardware reports an error, it returns a negative
error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).

The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
which is the i2c_algorithm->xfer callback function.  It currently
does not save the value returned by spacemit_i2c_xfer_msg().

The result is that transfer errors go unreported, and a caller
has no indication anything is wrong.

When this code was out for review, the return value *was* checked
in early versions.  But for some reason, that assignment got dropped
between versions 5 and 6 of the series, perhaps related to reworking
the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().

Simply assigning the value returned to "ret" fixes the problem.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Troy Mitchell <troymitchell988@gmail.com>
---
v2: Added Troy's Reviewed-by

 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 5965b4cf6220e..b68a21fff0b56 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
 	if (!ret)
-		spacemit_i2c_xfer_msg(i2c);
+		ret = spacemit_i2c_xfer_msg(i2c);
 	else if (ret < 0)
 		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
 	else

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2

