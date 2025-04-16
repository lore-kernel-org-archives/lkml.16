Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81495229B3C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836130; cv=none; b=PD3/S+cv15dylpJQMba+JFnWgjhSbQ00CC8VUTMLQY979awyHK9TbHJMGCAEkpn2WjXdeT8+JJnYzwm53LqW5eyLYPty1GCp33Cz3UzEsbJbxAfHP6d+xqutojeohBTJI0RZzQ2hdsARbUtoGED/MiYlGneJgTUAoZDPjgiXj+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836130; c=relaxed/simple;
	bh=jG1VelJdYtxDypcUuL37BKnVeljiwv8UHZSTxXIdltA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lM3Hk8Mm9r95vibSxA1hHoQ6zG7ozlEzC5fAz2Q0tXv78kfeTNy9TZs5Ep91WSsvMvAjCYjZxXeEYmz76jNk3RR/KxikIvlmATbcDU/XYQ8ziaKjA56evj7QrN3qqbsAbrbFadkT4V2jfd8l2h1wQ4w+xFJ6N4rM1bcFffQ6+ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=WZsJ6E2G; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="WZsJ6E2G"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7399838db7fso114173b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836129; x=1745440929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcFNiziR7pgxmZ4Nao78oOa5IfNUpz+8UeC5Li23vnw=;
        b=WZsJ6E2GhWw3LCY5q6gCIOUYPW0Y7KFtL/EgnzXmehdiIqAi7m+z0MmbomBmgIoCWc
         hJiDK2aUU7Pl+f5MUxqMT1TWTLiSx5QZhujTuOYIw2Q/xVcnIhpI/OcjJvBNmFAuuCMN
         2FmF+3vKJtbre6bL2jE+B28OO0c2BWDnWtQSIYhawWimVEjaXMuvfkAOHLOI9f19Vslw
         d9loprKP0q1Q3PPdGj9yqUd6fD7+GsgJtZXqBvVQnDJ1PI6LuJ0UFhlXZjXMB3ZnCd0N
         3A8+5vJMG9nvGSSZ/eiYL2BUXH90iheU89z7eqhZatHDZlHYKGiBZWeKmRYnrZdHGAZL
         ksxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836129; x=1745440929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcFNiziR7pgxmZ4Nao78oOa5IfNUpz+8UeC5Li23vnw=;
        b=daemz7/iBSFlccrm+aHWT01466Gndm18aNJu94j+t1rURvQbtK8XdcuPllcuwNqTP5
         6PNXPncMkYmjJUWQfognG/uHRgPwYwR+xiqH6yMG/vtXSv7B3zFaZtCRTEwLfLrZh5Tv
         xjTyvy0Dq28WvPkBxlXRWnO78famwA83bFGnXQOXvIHj52fIdizJ+LvkFB2+xKblXhCT
         V5EEbGuKrklALp0/HKfr/84t7+Ifu4qWZrhGOkHVhkp6FfG2AjJCvlvLfYzn7iSBEteW
         XYunfnOfbQpI41YqRCzyhWKpAcsfqHRFh7XNQAgTuZ3xBqsxHFQ/a1YMB70+N4EEVhA/
         gRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCV57G6RFB+luxA/t226Mw/bCSzJar62FXf9JlUbMulqM+2XtbUEbAcjqMohJ2dkFvs8EvsFMK59ptIOphc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfXG7f8v2UAEuS9CEhHTAOepDHKdE3SvpWErfKgwdNbgBYeFaJ
	V/apOGpzg97xBlQHDBcY45DkiLOFx6UpeaX+cjBApR7+sTP7wgO3UOMuegbPfA==
X-Gm-Gg: ASbGncvQT87kmHwLGESwh1U4VMRDg92MVvpnD+sLfOZcDsZ9I38bqXid2H8zScf/7rA
	aUwIerGClNwLbePBQCYWFdaNruLyNXHG54sWqPQepSJFh4kHTprWzuC00WUEAhcxH3vBBbFssVP
	hAQHjlDJKaljuI6FM3ccdxBpwGTQNTq/gq+WRnt26oTEgI5k6jZBgZ42d364jgOloHwHPq2VLgd
	X+CUgyIeiz46etKfWeGp9uhHUuvAqBIgRslNAG26YMWzIMZ6XMt2SDWDhiNabEk6L5M51xAyi44
	TRbXP0/gDLp2WQhEX9l7aPKlRifRHjub2W2232DvWX33vqNRohsEamX39OVAbAmdGGbwMarDf0y
	pfP6LRg==
X-Google-Smtp-Source: AGHT+IGEAC+9Fx62N9LnXooYFVA84nS16E6az2pmB1QBovtDSpEiRCS3qzu8aY6+MCPzNSZttazrsg==
X-Received: by 2002:a62:b405:0:b0:725:4a1b:38ec with SMTP id d2e1a72fcca58-73cdbef5484mr445038b3a.3.1744836128662;
        Wed, 16 Apr 2025 13:42:08 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230da87sm10880120b3a.127.2025.04.16.13.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 01/18] staging: gpib: struct typing for gpib_interface
Date: Wed, 16 Apr 2025 20:41:47 +0000
Message-ID: <20250416204204.8009-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"Having the word "_struct" in the name of the struct doesn't add any
information so rename "struct gpib_interface_struct" to
"struct gpib_interface".

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 71af9e808a76..16aaade310fd 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -22,7 +22,7 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 
-typedef struct gpib_interface_struct gpib_interface_t;
+typedef struct gpib_interface gpib_interface_t;
 struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
@@ -51,7 +51,7 @@ struct gpib_board_config {
 	char *serial_number;
 };
 
-struct gpib_interface_struct {
+struct gpib_interface {
 	/* name of board */
 	char *name;
 	/* attach() initializes board and allocates resources */
-- 
2.43.0

