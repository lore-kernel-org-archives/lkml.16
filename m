Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4283C1E0E00
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180754; cv=none; b=UFrO6Cl6M8JwFF5BxOe4YRVFSotkZbFuq/COdWEc/5bnS+BEneG8k5a03TvoohMeLRD7rm3aPu9Ofcf6S/1OYJNt+sw7YIALVZOV3EsNPxdfDkk4kviWxSGhM63SIYlFLiZfqtKuWFXk2SdOLUDBAQ/m1aR+Y556yKPaAqQqkDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180754; c=relaxed/simple;
	bh=lbWzrfSxoPsXNh23i35B90AErhzV6NFtqL5WnE4hLk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBmchSHDmh49no2kviqhT6zIpJWdcC4WDjbgKBEcg+tNY+qpAh5uua29hxwEYLaMxjABHi8E5yxKk+m4w8HpY+zL1u+xXXsO92MHYO4SaJXydfa7CEJvchYzg13KwmcP5bw2X57vTTfoPPfdG70dF+OKYCPScmqqB4cqJzJ2xX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=WBvpsSpS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="WBvpsSpS"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2264aefc45dso81856425ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180752; x=1744785552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ghrmx2bE35yIGMxnGFmWMpdfYImfYt/E9YirEFcLv8=;
        b=WBvpsSpSSHNiUZ8s3qVjLBLGlf/qZrxGyWVVxZuljWjJCjtfIH6hM8r1izcaQArdUs
         a8ylCfsDfJmgOH89EzODpfw4rc/o6Tak0U+d1sVvJPRfWJcaAHT/dpvLZkLu3ZciUVol
         laR64l0hcj4KKm0ZRjPEAkqiEgbaHdMZpVpOtMRY0BlWUo18er3LDTDimLNHbbeQiEf0
         PoWjJdPvFIbJ3YEO6wLMfvHR9LvlDbC5wESLcBmDj662UD5Wj9cdVSXxP8DouB0hdfvv
         gud5duJv52v3vggb9VKlg/twh1UeBJVyFOJZYFX5j3k2jlM5o1fsvCjr6CFSCEKRqcGX
         8y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180752; x=1744785552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ghrmx2bE35yIGMxnGFmWMpdfYImfYt/E9YirEFcLv8=;
        b=Op0nralwfTM7kS8zZR4DgGqaJrC3k5EBEL+I83swRTJBdIi8HI3DhjA8ks5gmOIqGc
         QdQ5//hU9MXfNh+av1yxzeDAkQFZ6RL3+0JnzXpFiWqZnAx0+CQ/kEPF4eti2h76Tcpw
         u4KG0KGRnZyBf9ZtswQS6VSAELrb4rASO1rypGtK/H24wknpyuOU5eWTwCP9KP7uJ8U4
         jXrSltcGn8hKEw9G4cyNPsjKhYlMStWjaMi8LDk4g4A9hRjiVnebNa56qn96k2Rw0n6q
         snIN/yWVgiIttNGcZ18DvmwbelqjEIMgrDnPyZ2KgaHZ7CAF2Pe3RCB+23mu2wCqNP0E
         97Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVebJ6xlB05gxCPp0Cu5mtYN698k9D/62lMnkkLUJ0WonULSVEOtAdf5fOePpc5B/lEJEX6hp57E/fYvWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDiYjDDYkjmR/5Ql+3Su9QLWmOTbqVilC4FnqX+gzsvKPAEzBg
	I3/c9OPz7+g07ZaCKXlWATXfZCHF8++2Dz3yuM5NpD5Nyxx/ne8V8extE5BmGA==
X-Gm-Gg: ASbGncu6m49q+nLKIqyrYeAU2U+ybyy+4au/GUSIMMdgd/BSDCUStnQV9mnytDZEcR5
	tZbChvv5lJ98occ2Q/DbAM6vy8VCBpedlopdJvlb+L3zEII5mMlx0U3/KZ5s9W6I7qdiijEKmW+
	2Vp/33om8z/O86RhSzG3H5VXI0M6h8ZAAYLQE7E3KshHG8Ur5cDsqT7km8Ausit7bapTa4VNrbh
	3SPTkkqEuW/vm8/C55fMwTfk8STVhWJR6EmGU7xxXbg8bLkCRYQzON2n10VlojLHw3jENUT28tC
	xc3lrV46JM+KRUvnIuD7hi2O3WW6Y/7lGYj16Ty0go4qZF9aMuswC2pxIE4xUGnhKrIJhYL0Zhf
	YMnFbYVTD3Y0xKFbU
X-Google-Smtp-Source: AGHT+IFjzbXsLisx7KV6HtAFC7qVbyvtSDdxy4cNHwSZovfA2ueyfE/nA8ZlrXUzMRtoqUKHrPLKdA==
X-Received: by 2002:a17:902:dace:b0:224:584:6f05 with SMTP id d9443c01a7336-22ac2a1a71dmr27494845ad.41.1744180752513;
        Tue, 08 Apr 2025 23:39:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62864sm4236635ad.22.2025.04.08.23.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:12 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 4/6] staging: gpib: Removing function ibAPWait
Date: Wed,  9 Apr 2025 06:39:02 +0000
Message-ID: <20250409063904.342292-5-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409063904.342292-1-matchstick@neverthere.org>
References: <20250409063904.342292-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl as CamelCase where function is undefined.

CHECK: Avoid CamelCase: <ibaAPWait>

Removing undefined function.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 247a73846cfc..73d7c7ed25fc 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -22,7 +22,6 @@ int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout);
 void init_gpib_descriptor(struct gpib_descriptor *desc);
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
 	  unsigned int usec_timeout, uint8_t *result);
-int ibAPWait(struct gpib_board *board, int pad);
 int ibAPrsp(struct gpib_board *board, int padsad, char *spb);
 void ibAPE(struct gpib_board *board, int pad, int v);
 int ibcac(struct gpib_board *board, int sync, int fallback_to_async);
-- 
2.43.0

