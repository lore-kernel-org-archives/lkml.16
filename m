Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8761E1E0C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 06:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744180755; cv=none; b=r18IN0t9TQw15UFCG+dGhDhyxqTbseKGCfSl99Nzgc4SuiCBfko0lMdubd9CnYjbCOcdM4DWqpWIqF1Yg0DV5U2NM4LqhlN5xQTBYSw6U32QvdtXEZ5G6vP8xycandIy1PXUft/1TUkUB8uMlBskG4rKs9JMyohLH4H7cLLVImM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744180755; c=relaxed/simple;
	bh=r8TH6mcmb+GwDgOL407oFInNBlJD/dP423X9WUlgNrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ujNIH424ltnOB3Nw8Ta5OyiymMqd++o/aH6dIIBxCgm2gZXGJ7uBpGPxeXDSAVlHNr/85jdch8ps4MY2QJ/WgyDk4EA+6iGzQp6cwoRZ/DI2mS4VfM8SwUQ2ve4iM66sYQbcswRvIo8c1jix2LTzTbdh81BbEZxfqnWy0vLPsuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=PQvcIO/Z; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="PQvcIO/Z"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227c7e57da2so55296005ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 23:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744180753; x=1744785553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcBeMfsiz4GcBol8ax0dkkU7QnHt5l5HklTFHDCQmgs=;
        b=PQvcIO/Z9vp8GCVGGlh4svgDLvRvgkN0fly6u5iayIvRPofPXhiZKQbOcItXou5/T3
         xEIYJ6nEQKkkVSTndkNNnViIyubkIcgR4n4NNPApyog6kD8K48Rjp5KWXNcLHRkrVgQ5
         RC63QlFae4j0/y0vKv5yslfGmjSXQku0MmSXj3XGIHgeodce9+VOu4hiyvG8eh7J1Umz
         4g5flXFAeVJq6HPOSnyN385dHEr28cteCSUk9abM5zaRX0EaxVSDB9+Bx36G09Nifv4d
         U8ZO4Yw08SnZ69MiBfWuKq3pPtdbXLPr8sS6X7ImXTLESI8DGQzEejzX0U7Q8nNA5+VF
         C0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180753; x=1744785553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcBeMfsiz4GcBol8ax0dkkU7QnHt5l5HklTFHDCQmgs=;
        b=I0HSQTyvzrqD3W3/6eSAnumTQGTuX3pYcw8mEfEb6d8w356vwn0djNS6nv9SJaab2j
         jNR/7bscXuzefIxiIlrtcOYitMN1Kt/Ix5vWPRLRj6pCXZ/OcqrVYRBACMVJ8M+3c23Y
         stYj7hdGyX05h0dPyQPMT6rSCK7xe0hynOcnT82Xcf8nI6imRpO/sgNjMpTSiMCygh4E
         zjn718HFBNuRNbxiIST/dtGV+cAyFD9QDTdM9XwkNBJPIMJ2b9t0hPumlORqaOKO1NAr
         hlTPfkS4Q6yqhNWey/QxbYxmConmtKGbDc+/48ET75zo5X7wHWLYz2TOJdLHPXQoGGlF
         HMBg==
X-Forwarded-Encrypted: i=1; AJvYcCUVC/LPpGTrWnoO1pwxrLBKD4k4bdEM3GcPFXZve5qhtgnITFcjE0or4l5+5pjd1I42W+6fiLp300a3vBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzgOy8sQ6oTajSdozS3kJ/0MeYr0chGCR4O51fHaWywmwZ8PPF
	DXPWvN1RF3G+QdH9jvJzCQ8A52ly+dFMnjoFE/wlkUKGQxrZzal9khWCBoPG5A==
X-Gm-Gg: ASbGncsX411/lfoT1E4B49J7m4F15BwJiOHyQk9RQIEyHazgrlBfaEZZ6+mvo3PUM3h
	UrR2Uqlpl+F/05R4Q638nxgk+kIhPpQZpV7DDN1XFWhHeK9YHi+T5K/MMckRT+/IruFA74RVEzl
	VjMOTID6AiasEZvhF/fOihfxCKvjwhIJEHU5KEQgmuCWLYbnOPFURGGmtp5eXEh3BSGjCD/uFEK
	/YN2FArRMA91Ql/EzGmYc7UDjQkgoDaBUg4Mn4yKg2ncJHkv2xBujPgHW+eM6kfwH1CjS9smcYr
	TSjsQgIGYNz3beH/co2BVdyDSu9kgMabbKCziu+Y1z0ZQgPcOtFNmfqei/gMVcGdU8GDz4jWMwy
	f2bwDi6pHECKxLTgi
X-Google-Smtp-Source: AGHT+IFSAfborwGo7qpfT0jt8vH/cw0np7IWn4rZA1MAlqczEe3tUw0w6bgYMfXGV5GBQXUOz2PBqQ==
X-Received: by 2002:a17:902:ef03:b0:216:794f:6d7d with SMTP id d9443c01a7336-22ac401078bmr23441305ad.48.1744180753652;
        Tue, 08 Apr 2025 23:39:13 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b65105sm4235595ad.44.2025.04.08.23.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 23:39:13 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 5/6] staging: gpib: Removing function ibaPrsp
Date: Wed,  9 Apr 2025 06:39:03 +0000
Message-ID: <20250409063904.342292-6-matchstick@neverthere.org>
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

CHECK: Avoid CamelCase: <ibaPrsp>

Removing undefined function.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_proto.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 73d7c7ed25fc..fce33f5715fb 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -22,7 +22,6 @@ int serial_poll_all(struct gpib_board *board, unsigned int usec_timeout);
 void init_gpib_descriptor(struct gpib_descriptor *desc);
 int dvrsp(struct gpib_board *board, unsigned int pad, int sad,
 	  unsigned int usec_timeout, uint8_t *result);
-int ibAPrsp(struct gpib_board *board, int padsad, char *spb);
 void ibAPE(struct gpib_board *board, int pad, int v);
 int ibcac(struct gpib_board *board, int sync, int fallback_to_async);
 int ibcmd(struct gpib_board *board, uint8_t *buf, size_t length, size_t *bytes_written);
-- 
2.43.0

