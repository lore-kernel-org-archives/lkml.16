Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D0C28BA88;
	Thu, 22 May 2025 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919727; cv=none; b=daZqZ+hshLq8otd3INH2AUa9tfGnwsOYqkewoqxqbA1GONoNGSVNGm+w5URdpHoFstdM4tcW/Qv84QQ5Lv6IvQpBEV9pdy0ej3cVzUH08rDNx+McEwkfuDVkDiu+nv+E7tFZmW2XTrvdgHFYDHLmwDSeutWnNGKpolfnfZnOPSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919727; c=relaxed/simple;
	bh=AMR8J/AcOdF7m8OsG9jn/QJ5/HA7dcJWbtb9Rexfgds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TCUtLMA/EYwMlE4HIPqPRV+KmyypB6zzFtjbJ0sMuFbUoO+QOUfSBD0rA45AtKVfvgfr7B8DgSBOHw4Nf6dYH+jt/vUxI4y0Sv/4X6nSp1gcO4qHlm8XhhYts1iX5FP4UGlWLaTmkmw3RrlqF/mMzp+5zsK09dEudaMG1irSpcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfbNempt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfbNempt"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a36e090102so2731065f8f.2;
        Thu, 22 May 2025 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747919724; x=1748524524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vxoelLQ3xnZ3lWasfsz00R9QOcYSSG43AUGMwmnbgI0=;
        b=mfbNempt7C0BbZjkdQfpAYnnV1AAdBvirpEVWsZyx7qObEJiYqsgynJAGeX9zdSpI9
         GaktK8wKRZbwwoEh6l/k4s/45OP6Jv/ekaxfCPQjhwx6uPF7Y4Y8JkqXoDZWG7M4Bqok
         7A9NJvZqlp3uyuKxOgh5+vc8slrnmOAkt8Nvcezo8cb90oF8xl5e/GzelghPtqINQDJn
         9M3Q/urEOFgKTsAnRpuVW++IExjtGNWxEXigIsmo2QOU2LV1QWDE/hD1WqZAQBFA3865
         5kCOimTzq9NZvvdr6+IGQ7z5ugHi2Owhhw36X0HT5gikZaU3wAbWJ/LqkWAARualrbZ1
         qBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747919724; x=1748524524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxoelLQ3xnZ3lWasfsz00R9QOcYSSG43AUGMwmnbgI0=;
        b=UiuS7sAnHSRHLSRwGOf+8/FgRUwgv1nM5fVQDY4+0KXlordQb/5M2lq/1qmbL4BPBc
         rADF9y3VbWU3HtjMIcR51/3FSJM3YpFg6mJzREys3ML4QLB5i4sIkKZ++/XXBqM/To1G
         mU0P8xqv/yh3BwqToTiq1Rc8c4jesnAUl6LkGhCbMyY9W0JY2ktQYMhr/IQC94OUEliE
         e6sI5vrygrhqYiWn1DQYyiyFp9q2L6UGsu3CmPGXhofSy7NBZEp1yYbJoo77ioYldpSk
         407qFhIz1Wrnee32jhNSmRdbdGJCZiEQCz/s6ymDiJJ4hAj7pV2vG/RLESaysLLfEjAB
         fSTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/+/2GkVci76YWlIncvDH9QpMTE2uDbGxh7CnvRJdOtqQ2Y3a5c+4O442w18KbaoPhLTtj85OsFUc8cmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNdJdeB7iTQA8mT+l/OrOgJkZUveRJvJ5kh0BE9pwmy3qwj/cZ
	JKsMopYr72O+hor95qBLEIbPNwu8/pUJc3FpfCHX9HFVhPQ185zvQo2e
X-Gm-Gg: ASbGnct0Dnv6r0PeWkhMepwL9Spaz95DXS5/z3XA6x9kmRz9ua25QUrHLosCiRFFI6q
	uYiEYhfNpVTYnCJoWVkrTSkSvOwhV81mmsWNKWo4MalPky/CEIzfkemCcgxHQ+C3gfdHFuPOC2m
	vMO12TRTAQGRUPtq0K19mGzBs8sU0Zk8iN4d4LM+PkYs2NVrwT5rQ0fLavlwoUeBgJwvblkJHX3
	INwb0RlA6bWhxJyWaF05eEfUEMum1Xvs12wqVcnaKgOM+8FwH6NWbYtfirmwV1c2tty660juxJ0
	7fCJs2sk4/kB7vFqngahWKZ8kaEW4RPEvFhWzttPcCPcLfnIWYapY69wii1I
X-Google-Smtp-Source: AGHT+IH1gCShUo+Eencgynt6FZ8+7Ck0TbDUAZN4oMnq9B63JRHVRgGdEuduDPWJ4m1a07j0hOB08A==
X-Received: by 2002:a05:6000:18a5:b0:3a3:76ff:a617 with SMTP id ffacd0b85a97d-3a376ffafa7mr11926320f8f.32.1747919723549;
        Thu, 22 May 2025 06:15:23 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a3631c728esm21833904f8f.60.2025.05.22.06.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 06:15:23 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dave Airlie <airlied@redhat.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Ben Skeggs <bskeggs@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/nouveau/gsp: Fix potential integer overflow on integer shifts
Date: Thu, 22 May 2025 14:15:12 +0100
Message-ID: <20250522131512.2768310-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The left shift int 32 bit integer constants 1 is evaluated using 32 bit
arithmetic and then assigned to a 64 bit unsigned integer. In the case
where the shift is 32 or more this can lead to an overflow. Avoid this
by shifting using the BIT_ULL macro instead.

Fixes: 6c3ac7bcfcff ("drm/nouveau/gsp: support deeper page tables in COPY_SERVER_RESERVED_PDES")

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index 52f2e5f14517..f25ea610cd99 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -121,7 +121,7 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle, bool external)
 			page_shift -= desc->bits;
 
 			ctrl->levels[i].physAddress = pd->pt[0]->addr;
-			ctrl->levels[i].size = (1 << desc->bits) * desc->size;
+			ctrl->levels[i].size = BIT_ULL(desc->bits) * desc->size;
 			ctrl->levels[i].aperture = 1;
 			ctrl->levels[i].pageShift = page_shift;
 
-- 
2.49.0

