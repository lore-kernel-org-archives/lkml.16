Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58C221727
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997707; cv=none; b=LG5EfRxzof7JYHUwgZO++yeDxnuC+cZSTzlzo35JcUj6F8lsZxdBo+oEzPxmotr/RgDKGBCc5T+IR1zLPeUPPJl7VHbOL4rDk5x3q2+rkHkMWYnTu32GqBR7appBI/UaZ76Uo83UiJDUoV81wqnxmLa3ZDul8984C8d64Wwo23I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997707; c=relaxed/simple;
	bh=m6buCUOBnFMRhDlhSjM4/c7jl04g5VpMz1TxvjXuR8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exeO0S19wxTPkZma4+ApR8OFbxHa1ANtNVJmyfqxXlmaR1ndzUyLhp7X1jIhMc9qH08azI78n7OtpZJ2eJsP20xTWhUH2OT95Kzkt/9OTJp2OKMeoPN/XNlc6QFxPS5xBCSKCRkM66eynHo9Tke+d2vPAysg6HpjivvsbswnA08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAZWe376; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAZWe376"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c0dfba946so1316632f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997704; x=1745602504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJILlUmxlNOkJz/bn/NxCrCFwA3F1U2EoPAh/Z2tm+8=;
        b=QAZWe376xTLkORZLj4RAKkIERw0owcqylJL112xUxkcflp9SNaTIsGvmXSphRDOhzz
         Puu9sBF26Rr8LKG+4YON4KSdweDOH35qefHfOilv2ePK48doDR++RT6JUn2xUdAFTXZz
         +6MoGWlAj/L4tw8ZeHU3wBOHd9ckGS120AZHfzOg9I+zlT0E9aqndGeKNlhcVuJhO5as
         MuggV7nH8vSZQSsfHYGwPUNWBogLDGOlPgFOy4INj1bz/jNZLooDqiDNuMgdXtMLb/aG
         kh5iSjt2gBg4Xm0a7SDSB9JdW4Gk+P3ahr9K587mwGQgCY+d13MC9BaZlhP40m7sZXqG
         5k8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997704; x=1745602504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJILlUmxlNOkJz/bn/NxCrCFwA3F1U2EoPAh/Z2tm+8=;
        b=CoOAx6X3Ve6kkH1HnQWd1zLyxu809OpBtwGiL0SoylHN5Lm3GLEMC4VbgJrKZoiADe
         op9qYVFoykj739yPhecvPmqnreVxV0P37NuK4VyXhbPclo5/iUD/0Y9/l2KLCFpsxkkt
         ciuF519BREwo1dOaf9g0Yz+Rs8q4k1UVWosZ72J2oIw2whGUwiVfYuZ8+/aRcaPzBTPv
         ZoM6o3guXDdnDShe5znL2ZKrljJeFpHbrNP8GmwFrKOtQtlB55Fm2gmZSzi/+6kQvmhJ
         OVRLcppxEdDphGfBvxsV9DTC+0NaaY1EqgvWzTQWdQe0nq6CLY/TsfHZyJlfXU2Aizrl
         y7Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWeYupxYlwFtxnoH14CPNAzGisIYhninYs50uEcnaHPL7UY8eJjeQLxa8cy0c7jgl9nvsf1uoOcJaX9LEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+kIn83pQ+HwYT9ERzoZm9XnorSJYxlW0i0r37Jwwfy7RS0Y7m
	oUGHr8gUpQeqKb9Zavr1GtBJP9bC1O4IvpHqrX6q/BhsR2zNl0OM
X-Gm-Gg: ASbGncvkRKOTsceitr+J/Bg64ApszvcNzcjqqXeQZjlBcdut0RxvHBCrgRqIPOq77If
	41dJQLd6liugfG6F/5RzPmyEeG0dC1QJVPp6NsN+JiCUyN+p5Pq+zyFs/+kwLSld4Ft0VLGTwIB
	8Qrja8HnNc+AbCRDerDIY3HCFlG0d2QdRTq8iGjE3t8u9AwXVO4pO65EVSX6q9fI7qlxwZ4n/DR
	xAgsfEEqtOOc3Az/ya6TytwRSdGARX8sPj/0Dj2mOadrP5HBmvG3xQOOAS/0+tUzvO8UzMg+ANB
	agYaD00JbCBAL2Phg7qGFhzpl/yuA1rTQtV4wakv0zwrabOKjhKNp28hZHwXZhw0W96wgZ0Jtxx
	0
X-Google-Smtp-Source: AGHT+IGm6D7XQQYbJ3aBE5vZYxL8XaPOdXvawSEdeCq9wxVhJrXnyxNQy/H/R9umb2uWWhdcsZdjSw==
X-Received: by 2002:a05:6000:2913:b0:39e:f641:c43 with SMTP id ffacd0b85a97d-39efbaf689bmr2763694f8f.53.1744997703672;
        Fri, 18 Apr 2025 10:35:03 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:35:03 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 7/8] staging: gpib: Cleanup allocate_gpios code
Date: Fri, 18 Apr 2025 19:34:33 +0200
Message-ID: <20250418173434.2892-8-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function was using unnecessary variables error and retval.
Simplify the code by testing for failure first and remove the
redundant variables.

Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 39 +++++++++++-------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 86b98eb1ce69..5c134cfb6d61 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1123,8 +1123,7 @@ static void release_gpios(void)
 
 static int allocate_gpios(struct gpib_board *board)
 {
-	int j, retval = 0;
-	bool error = false;
+	int j;
 	int table_index = 0;
 	char name[256];
 	struct gpio_desc *desc;
@@ -1135,8 +1134,8 @@ static int allocate_gpios(struct gpib_board *board)
 		return -ENOENT;
 	}
 
-	lookup_table = lookup_tables[0];
-	lookup_table->dev_id   = dev_name(board->gpib_dev);
+	lookup_table = lookup_tables[table_index];
+	lookup_table->dev_id = dev_name(board->gpib_dev);
 	gpiod_add_lookup_table(lookup_table);
 	dbg_printk(1, "Allocating gpios using table index %d\n", table_index);
 
@@ -1153,28 +1152,26 @@ static int allocate_gpios(struct gpib_board *board)
 			gpiod_remove_lookup_table(lookup_table);
 			table_index++;
 			lookup_table = lookup_tables[table_index];
-			if (lookup_table) {
-				dbg_printk(1, "Allocation failed,  now  using table_index %d\n",
-					   table_index);
-				lookup_table->dev_id = dev_name(board->gpib_dev);
-				gpiod_add_lookup_table(lookup_table);
-				goto try_again;
+			if (!lookup_table) {
+				dev_err(board->gpib_dev, "Unable to obtain gpio descriptor for pin %d error %ld\n",
+					gpios_vector[j], PTR_ERR(desc));
+				goto alloc_gpios_fail;
 			}
-			dev_err(board->gpib_dev, "Unable to obtain gpio descriptor for pin %d error %ld\n",
-				gpios_vector[j], PTR_ERR(desc));
-			error = true;
-			break;
+			dbg_printk(1, "Allocation failed, now using table_index %d\n", table_index);
+			lookup_table->dev_id = dev_name(board->gpib_dev);
+			gpiod_add_lookup_table(lookup_table);
+			goto try_again;
 		}
 		all_descriptors[j] = desc;
 	}
 
-	if (error) { /* undo what already done */
-		release_gpios();
-		retval = -1;
-	}
-	if (lookup_table)
-		gpiod_remove_lookup_table(lookup_table);
-	return retval;
+	gpiod_remove_lookup_table(lookup_table);
+
+	return 0;
+
+alloc_gpios_fail:
+	release_gpios();
+	return -1;
 }
 
 static void bb_detach(struct gpib_board *board)
-- 
2.49.0

