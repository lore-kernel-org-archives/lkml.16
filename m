Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB1D299A82;
	Thu, 22 May 2025 20:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747944607; cv=none; b=pI/Tl2JBPFLivThZ9jrJpa5BiCdFiFLr8l4hftcuS+W9MS4ENI3iHahl8GKXdegFmsRkHe9WBQn5voU4iKKeFCh8cERUu9TYYypMtYgIzaDdZ0JGFyC24tBEMODUc+uRYnRycDbVVfzVBj4mseErj4yPzKqfyoHesaI4I65hUq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747944607; c=relaxed/simple;
	bh=yErHsHeJjWcuHxho3mY47hFQuRX/I6iGr/Ifguem7hM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogPSwcF+SRVe5hK6zBI5Z1GS4ShcNahQ++hFLlQdJUYmVK+Y0alqXgQ+lROEUN5cp9gJ7/y2vjPYQ7CUz0u160xVDcOiDx0DEF93YjzSlicHpm9XyMpQ/VO4FszIoIU1EGbeaKaO3F4EWaAji95zykfywrkd0wEP23jEv0SIFq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgxJA3Ab; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgxJA3Ab"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-404da7584adso3475902b6e.3;
        Thu, 22 May 2025 13:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747944605; x=1748549405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkXwot3ZtDxYGxFh1Bb5xfVQC7W9CJxSBom6soP1diU=;
        b=GgxJA3AbWiqVgs1oxo0VYbPzOKdnQJvLhpHcOSFxshZM/QuF34eyYB12G/rBsPmgQc
         BbLw/E4Nbv/5gPYWD6xc2bLsq59ks0stWZu+Vf3JhhjzgO+6BzdJfGAjVzu2jqKaks2j
         CL6rtHFGpttofjV+nNWI3tJ/KUnoZs6UHILurjSJSBsDfudb4waSUhdAMDYXLnlCWX2v
         4FYm8xl15WApCECPyOxfFdjdeVApL8hO9MiCiiAUrQYKwrTgjhDzuSAJ8PiQDqHkwy3H
         bqx2k2ANK2Gj2W5hUPH97VTn+dw5eOsLgWardH+E3rOv8FShTav1hkCkJluytILRNZUD
         lvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747944605; x=1748549405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkXwot3ZtDxYGxFh1Bb5xfVQC7W9CJxSBom6soP1diU=;
        b=jVqe6fHRPLozDyXDVeD8HU0H8zRTvstKteXIJrZ0P4qpOFHDMouXweDTcxc06RnTA3
         VGbQq/Nd1H9wDh835TlTEjBFPrEXXZhIGHyRqjTNVz6VbVool4KeU8y1DNGJSML4821p
         vq0QN3aXh7zCcvoemR+pnQtoEN9jARe3T6m5vTh/bO+3y3t3dTPKm/IT5xmAfg1sZS4d
         POs1QC0ap9qWRId5inGYgCkL8RpNLcWFFNDuTn8d3+Vl8tqWCR8Ix+st3bMMMeuMI5Ld
         kFV1NZJm9A/MoHDQbetY7bU3+SAYI5CUkuIJMV5qjcHHqZ+vb/JTZ1hCGYWA29l28jMN
         BSnw==
X-Forwarded-Encrypted: i=1; AJvYcCV5Ab+QAeCowU1wyWEM49+n5vdg2LiNHIwgCVEaQdihWip5az5NWieSrz4T/fbWOfqKT7iXP9Zmcf64AgHBBeXCfxid@vger.kernel.org
X-Gm-Message-State: AOJu0YyFvUitTHcuijFUzo5skE9NgzeCvEeORrRklMyqJqWh2naMhLzX
	cS8j6LYCtjYkTaRKgj369s0cIXwY2Xc9twnvZoaLhSfZTJxXNY2OWshecfUEAA==
X-Gm-Gg: ASbGncuQrPwbrSAgUGOzWORcj3lLN3dwB0kS8rEr7sug+LBO8a18HK0YdGgelzJgxUH
	sT8Vuy4HzEVWWO5OhIZ0jyk1SLUcfnAyzjMzS03mEkUPRWWGSl54LCl9lZ5KUqTS70sZ4wRUNwX
	cPeACXJrUUaY1CRMLrt42buG/IHRm1oU+1HFmKV1YyND+pKFS2WZdC3ux3n4QJCRTilKYIbg2P7
	gdMB83oqkUk/dvOeHtwQj2Txw3a9CvmZb+KOhSYbcZ5+FrlH86YGQy8pi8b7RKUc857DMP/+L2L
	RBDk1gPUA6OomPsjPRdwNWrTwKg5lpA4ZZ0M4wA98u7nYlR5wljZY3uPTO6EMGEgJ3b+0NvRaZe
	gCQSzGZpUfNVbyWEfdDTj4/inw6Fa
X-Google-Smtp-Source: AGHT+IH6ha5kvvBtNWk2XVpq5k0TXr5PkbekFejLm0LBd2r/JtF9zjhFNbUsW5Xjvw8N0fVUmGuTSw==
X-Received: by 2002:a05:6808:6c8b:b0:3f8:e55c:16d6 with SMTP id 5614622812f47-404d87fe3c5mr17659445b6e.28.1747944604804;
        Thu, 22 May 2025 13:10:04 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d98b2762sm2651046b6e.32.2025.05.22.13.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:10:04 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v2 3/3] platform/x86: dell_rbu: Stop overwriting data buffer
Date: Thu, 22 May 2025 15:09:37 -0500
Message-ID: <20250522200937.9578-4-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250522200937.9578-1-stuart.w.hayes@gmail.com>
References: <20250522200937.9578-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dell_rbu driver will use memset to clear the data held by each packet
when it is no longer needed (when the driver is unloaded, the packet size
is changed, etc).

The amount of memory that is cleared is (currently) the normal packet
size.  However, the last packet in the list may be smaller.  Fix this to
only clear the memory actually used by each packet, to prevent it from
writing past the end of data buffer.

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index c03d4d55fcc1..7d5b26735a20 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -322,7 +322,7 @@ static void packet_empty_list(void)
 		 * zero out the RBU packet memory before freeing
 		 * to make sure there are no stale RBU packets left in memory
 		 */
-		memset(newpacket->data, 0, rbu_data.packetsize);
+		memset(newpacket->data, 0, newpacket->length);
 		set_memory_wb((unsigned long)newpacket->data,
 			1 << newpacket->ordernum);
 		free_pages((unsigned long) newpacket->data,
-- 
2.47.1

