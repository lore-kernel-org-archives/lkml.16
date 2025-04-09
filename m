Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D5427C17A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222216; cv=none; b=TcHsea7ivV80MIxBp/3V3E+MhThFE8RSebYphkkerSDVmvHyTlERKK+Yg+VXYAZQR74BS4bneftuLM5qBFHhStXfXN2SURgshC3oR9dnwy+RKLwYT5kLdF0WyCvs3GRWxwk9jZcJ1B8nnRctrdpjRi2fclzsvq0Z0Ctt5kcvR/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222216; c=relaxed/simple;
	bh=ORaFewiMotVN/KSTVC9JeUrAwDzXl5jTaIJ3ZdlqVog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unXryq47OTOHtvJMOWdHLP/y3ozjyaAuObkwJOlldRBTDlRkqC/E6152b6t+6H4MI7Lh4rCWgRZ1AVPif95koVgsOGa4gyo0R3LXUlL/9zDgvlWZE4x+APeAS59kmQ/8ybegqidFJ5XJH1RerbI3GSmfPF5YUDMZ2tMYgXFVcQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=huvavQfM; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="huvavQfM"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224100e9a5cso77728325ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222213; x=1744827013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLQrdeAsDQm2cgT9iwT/rZbmrhZ0r2i7KpwlM+r1xuY=;
        b=huvavQfMvIFekfjQSCO9n3dZR1B8uVAM6rCw0rNrYcIJMie5jPBeiGoHSbBNr7m26u
         OqKj92EObJsFJHTT4MUHQTqt8tKz/uk3CxLmhif+2X7QqIf2RgRpiAR5yEL/OiwhY9ba
         baKQBaj/8hfL1vZ4lN525VCR5k4oS70Cn0KBMOYVRUE2wF0mW56Duk869HE+vGqSmugF
         MrkBQJuBTQ6HAmDodcxqZXj5Jqo60Hnm+qTGXefBiFNf1Opshc4xuyjv8fQ7xx7s567b
         1dOM0L3OgfVfPFtSpnEzUp1Br7SA/WlLpDgcLM+NBjIShpsuoEb5DsiHhRyCcUeolUCn
         x5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222213; x=1744827013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLQrdeAsDQm2cgT9iwT/rZbmrhZ0r2i7KpwlM+r1xuY=;
        b=VSExUAmQhj+P8JcY/bOvNBjwMQ33M98YgatODMC5hWnbv5qBeo6AoM30c1iUM2dN/U
         x1EUY7UYJJvywqkfp43XCnU87MaNiljTt7CERlE7NP20JjZnyyZotNUPFhK5e1pOmJ9t
         l595aKw8ZvZcNsfa+lrmMRCipCxedn8d0JZarIUHOnknKmo7QgE68wgTjfVryU0eg17D
         WaJZ/ifllMptQqrwC0YxBeKM1iYQtGGRWfVwThVk48ZXn71UaAq2yNxbVIoEc667FPk7
         /j7XQCzAmEfWfZ/DpVRE6f2zsnSTk9wdAPophiIblx2u04QLig7bZV2JW777awPQnV4f
         LMSw==
X-Forwarded-Encrypted: i=1; AJvYcCWAWB/LlWKverpCKTeF0fLYPYGVgKSJaZIhl1dcd1RezP+2HwhNa13ra45QHdiQNVQbedkMMfuqqCdzZ3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaeVKEgOXNsCX4L9NoOFZIyZN6fmeWr+dD8KYpy+s/b9NVJoEN
	PrUkarKVzv8TXIQhIx3f0yIR/szmLg3amJYlvAJsX9uRV0nnIh80B0EnLUuZvw==
X-Gm-Gg: ASbGnctcOzoCG4T+I5d3j7WoFVgMrFLwZiWpFtxSjkGgSXPzbiLymGkWvkl8KhnqAV6
	iSiVfhT1W2qQJ6zTpqr2qCJiRqN28jsT3Nwu8tc7Z45dUvPRQ8oOxRZ6gYnrJWTbcZNWGVcEHb2
	cOBpzbUE+Gy5k2czNi847DrhMhd8Nz8/F3mQxovWLCMbjpyqsS4WuqR241rthPSod1v0EMMiQtk
	uT+OCRVgZR3Nju8E63dFtx7UKE6zH8fZFB3HVL3RdScQLfH837tBIK2BEW9eZS9S34FvznK5nMm
	vMFTw7e48aq9mW/kh48ymItm7y5qdx+c/h1py2yVwoka6VvejFW9FxjGc94QLNAo3cQVRoDufV8
	v1kNvbQ==
X-Google-Smtp-Source: AGHT+IGg1atvIA/BG5UDn7znsUu0dmzq+eyMn9p6pX4aN8/CWH8Z2tIunaPVygVjY1BOtPEmulUIRQ==
X-Received: by 2002:a17:902:ecc1:b0:224:191d:8a87 with SMTP id d9443c01a7336-22ac29ab182mr43357915ad.26.1744222213651;
        Wed, 09 Apr 2025 11:10:13 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb79esm15136065ad.243.2025.04.09.11.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:13 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 15/23] staging: gpib: gpib_os: u8 over uint8_t
Date: Wed,  9 Apr 2025 18:09:45 +0000
Message-ID: <20250409180953.398686-16-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 7d0c03ebe624..3c72f0583985 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -262,7 +262,7 @@ struct gpib_status_queue *get_gpib_status_queue(struct gpib_board *board, unsign
 }
 
 int get_serial_poll_byte(struct gpib_board *board, unsigned int pad, int sad,
-			 unsigned int usec_timeout, uint8_t *poll_byte)
+			 unsigned int usec_timeout, u8 *poll_byte)
 {
 	struct gpib_status_queue *device;
 
@@ -337,7 +337,7 @@ static int setup_serial_poll(struct gpib_board *board, unsigned int usec_timeout
 }
 
 static int read_serial_poll_byte(struct gpib_board *board, unsigned int pad,
-				 int sad, unsigned int usec_timeout, uint8_t *result)
+				 int sad, unsigned int usec_timeout, u8 *result)
 {
 	u8 cmd_string[8];
 	int end_flag;
@@ -408,7 +408,7 @@ static int cleanup_serial_poll(struct gpib_board *board, unsigned int usec_timeo
 }
 
 static int serial_poll_single(struct gpib_board *board, unsigned int pad, int sad,
-			      unsigned int usec_timeout, uint8_t *result)
+			      unsigned int usec_timeout, u8 *result)
 {
 	int retval, cleanup_retval;
 
@@ -473,7 +473,7 @@ int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout)
  */
 
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
-	  unsigned int usec_timeout, uint8_t *result)
+	  unsigned int usec_timeout, u8 *result)
 {
 	int status = ibstatus(board);
 	int retval;
-- 
2.43.0

