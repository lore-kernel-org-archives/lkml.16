Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192CF2550CE
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151113; cv=none; b=N06pcOM4l6VSJHymXBsMJpVKuQ+kggVcTa19RvsWaLllsyBcAKf6VyetQbKc3qHlZy1OEYraHKBjXxpDPvk0Of+EwHY2HvbcrD9TJFIyEq39pf7YQKggOsaw3BbEwJp0DBEW9tFOPzbYwsstcq45FZS5ZG4Jhgo4c4f4vPz2d+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151113; c=relaxed/simple;
	bh=zBaT4vEsCW9WabioGiD3eVnIPOZk+030v6c65zQMLr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NjDITlCKZLGC1Rk/tHNQVXUfwCqnxGugxuRMKNJgYbJeYJHZ6/dFGASZXfhlC6TOr8w9Sh3aBPaHWw76lgNpp2JD4Y9vT1snTP4z/sYTVL3p7+qjhjiAp07dnVNLWEsoaze0G/LjBLdjf15tf/RKRp3iOy7QYTsHL7DW/8smfqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Yp5jrxh4; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Yp5jrxh4"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af50f56b862so4200484a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151110; x=1744755910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+6UevCyLnjvsWBFbzNWa3AXPSyQaeuqdYb/dtZs/F4=;
        b=Yp5jrxh4YSsSmXgxMWb7aPR7FFMaCzTqh/lAzyrhFOrcYvIA2uquw0N3LuQieGGP4g
         m3svAs1OaML6vII/iS1jRY5e+ydtOnnu/U2nCK3mOWaDOeY/bKXWXRznf/yXLByRLe1E
         NLEyJhujtS5jiO9818tO/4S0B9BzTTqMws1KgrLPKsBVLNi9gxhJdgsPx8Z7FNx0HRNg
         PpMJmJ50lz7wrBXQwLPTgoTl0XIwDRDq4Mm9fKc5GYrUzSrygHOlvkuViqKcnuu7vGOO
         CCKn+5umgPVKl7SpUBoK4/9+ile6iNET6ifeMO9cRLU90sefFvTMHN1FBXpQkRZuKoUY
         4RGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151110; x=1744755910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+6UevCyLnjvsWBFbzNWa3AXPSyQaeuqdYb/dtZs/F4=;
        b=ZMBwtTyzLKS/5mCFBO7zSxQhddDH4CZL01YY3fZ9+OC27M/mUqpgkW0rcFmKg6bwo2
         7Pwp0iCMTVnSTFFikttu4GiWUC/t9IxFeExyuW8iOhrg2TC/2M9bGtSFeB6mPGmR3Ozl
         JdTb3/gd5VH6P/E3112Xe7Hey+d4HxRrJvxJdXLpEpktRi5nb/j4PG3HZ3IKNeKE0g/j
         iBV+WvUXoa4pcYqwx5YA/42TbV8u4vyzjNI6V7Q2RiWbsOylAuGkX6fhlairqxaaCwQS
         501RvbhpVU2uUHIHbgXKpG9E5c0iJ+SMt4/77EWAouAmzOGEuiN+5yVzw537eGK/92ej
         NJsA==
X-Forwarded-Encrypted: i=1; AJvYcCW5SGWidnybtt4S5qKF6EgU6LAWy+0FQrPkQVYKXxbRJsPsrrzImnoPy/1JpCDUJbHepboCjjh2jZ4hxEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYXnEzQE7+WD0V4C08W/0XgUvLQtGKPdzCt3h3Nbl4MrEw7xwr
	UAtFzFpVuRCc7tDmy2DBjEGcHFsa/voXK879oPqAXN+iJKMN2/s6NbMdsea5qg==
X-Gm-Gg: ASbGnctCPmY/ATfBeQnQVvcG2psrHIzJSqegpSslScyyhFJSLoqecBa8iCQ/N8df7DS
	fv17XR0M3s0rx7WIb3HSVcgBQ7i44Zrx1hFvqR/MkRV/H039VXjPUUkvjEi9UOfebAfERViTvfI
	NVxHC1FabITkXl86GSs/mutq+D2eN7SdCWTVhfMJkjn4Nzpp/i1UsEI2Dm/Vx0CTo/jpRdAa77Z
	A/ijgEHz31+OnsFMk4TyJ+dr41RFB6tsIxmndUjcpkq3COn4q1YerT7pdhruyCCIVneuiXBACvo
	HzrE39jpkP4go4wEtWlxGWM06NK51mvS/tDQDYO+Uwxx6nHOOrcOeMoKkeWl692nFV6n8FxBCo7
	DEIIxpVc7hA==
X-Google-Smtp-Source: AGHT+IE+BRpGJQpWMRHPf266YMAqNBHhYQqHdf7mDGI2jGj+pgqv++XJKzlr2H/xRmZNYQI9+lIlcw==
X-Received: by 2002:a17:90b:4d0b:b0:2ef:19d0:2261 with SMTP id 98e67ed59e1d1-306dd52cademr217788a91.16.1744151110296;
        Tue, 08 Apr 2025 15:25:10 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b4bdsm92176a91.27.2025.04.08.15.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:10 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 01/18] staging: gpib: struct typing for gpib_interface
Date: Tue,  8 Apr 2025 22:24:47 +0000
Message-ID: <20250408222504.186992-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for gpib_interface struct in .h to allow drivers to
migrate.

Adhering to Linux code style.

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Reported by CheckPatch

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 2d9b9be683f8..10d8776ef425 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -22,7 +22,7 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 
-typedef struct gpib_interface_struct gpib_interface_t;
+typedef struct gpib_interface gpib_interface_t;
 struct gpib_board;
 
 /* config parameters that are only used by driver attach functions */
@@ -51,7 +51,7 @@ typedef struct {
 	char *serial_number;
 } gpib_board_config_t;
 
-struct gpib_interface_struct {
+struct gpib_interface {
 	/* name of board */
 	char *name;
 	/* attach() initializes board and allocates resources */
-- 
2.43.0

