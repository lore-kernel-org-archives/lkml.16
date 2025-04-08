Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6A825742F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151121; cv=none; b=YA9n1WS+1Vg039vVNy0waGcDrRGAh/UcmaX9TEJp4VnQCZLUPOkiEZ2BkC82OgqMS+HO1qCrAwgFQXuTZef+NfDhhv4UAVLw3fORH3eSJRcAnZwWJ9llO40YKBrxFbxyD5z6JrJ8JzIyjktptFOLFef26KrsYtwfdnrKpmBohj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151121; c=relaxed/simple;
	bh=+zRK44sFZdwIvc4vU9sKnG1BcKymUzbd0L6oa969Zxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l35WbRuEyJ7I0t8S7i+kIjG+gV/hDRQ7Y0b6Apa1tG70KlTZHpD1utDSpAnCuiBqt2qeMJEwDmvow4QH7r3tLyUJrcFtLlIGQq1KZFh7j2m+x6/qyatftNHtsURBReCybW4vC76n4z/t5oQXnQ7Dtq42PsJJcoFy9rMZ0kStVAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=mpLWW2wX; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="mpLWW2wX"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so4707514a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151119; x=1744755919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUL7ykty5njGdegmOhjg8oPPUwbsVjeLq2w2Q/Kqzw0=;
        b=mpLWW2wXuksFR/R3J3+RL+0U0uo4y+kFtFvrDOEUCmO/Rq3Cdaz5gSugcNFal0QW41
         RCh4V0itmqvoSnhrtReaB/Hc1GYaI189NWnx1fudn6xTQPQn6oyt8oqZ8eIPCSggFaKw
         tMzdbfVs38fxsP5wO4oqwVaZY5wcel5ERuAdz4PR8Oxp5ccYhV1Y0BwV243+a5sGaCGd
         t3VM/tcyUnaHMpaQkNpyWUnP03RkyUp0d1FrDY7qcEaScLrwIsQp3d+ZjPVRGC3TqbE4
         RDIXebCxoNvtZdTC1x+qFqLN/8l2mV2Lf9zuUuhbypfKN1Bs5Ul1HGpXmpJdaG6LXTVv
         6Nzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151119; x=1744755919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUL7ykty5njGdegmOhjg8oPPUwbsVjeLq2w2Q/Kqzw0=;
        b=PFx8k6x/kZKQ01bKEFuOBpU8h9gn4VAfC/dWQMRnj+nPSRWkGYYw9ATelqWweeQf2a
         of68N4O4H+ckPVDaLN69A2RKulfedlPK9ufR/6TKTRXFSQ+Sq4D9OoZQOfBwpwTX7Ixr
         HQU/eQDJjjemWPNG3BzCNfutoV52cia3lf0iX1nMndwyqHoyjGJSEQfpMP2tkrkY+6/Q
         qsnLfPFh+bInTjIUS82u/UbAyN5aVXCthzfIJ6/y8ZZmwWcA9/QHDAWnQMoqmt6YKQ7g
         GyBAbrgdx6DtnzVnNCVfsHOnKp7XgYjreRqxiQPQ1YuY5Bu48m8GF1hmpX64MhZ6hix5
         EBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBMJK+ptv4V2AnTwNqitckdwhuIXAYYATjn5v9TaUYK0yuOX0yYOeQuCOYtBDPeBuvs2ExbA5whj1+PjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLOv1WjzRuLQfePiVD72FmAqTpz21jUBqG+tOX1yee2oBB3GFF
	u1MSe3SOnuP6VQXOGCwhIw3Z+AIDjeMbZ/1BfvVsKAKsVgrMow1YLFBlHRXsnA==
X-Gm-Gg: ASbGncswWUWLDBfr/LjlxQE2iR9UP34HtKZ4PvLKDfmCcmHG1hgS/kZgIbbyDqSnTA3
	9noYfy+isacha62pfOsegJ2/jf//nDrQLwEJXGtj0HxIzhX2ay8A2eSsHFutHSNIYVxO8X2ADKT
	BhEBtgGQBOMVDLP4l8Nbyd9tZ4jnz8BFRTg44RXe//0tvZPj+m0B1OUk0BIFgh9THFfWNfeUdZj
	pLOHLqvp9UbYn1KieHvgxctjWKlwtAkUyfVGulXyxs93XTL+lH/KnROgzlZ8zZUJ5w9nL67b7yd
	DI+4fT8vn6SOX4JWb0QpAmN2UwlVbne7Y1N1f8MM7m5ojU/TTZMOnLtqYjlevAO1fqkcMk59zhv
	U/3hnYv1zia0D2NSZKErm
X-Google-Smtp-Source: AGHT+IFOv7l3SpdOls75EIztcizBRUqY2SsFnO0yo4hxoGcc1mnpzvAVTB9qXSAHu7nc58jKJZnDXQ==
X-Received: by 2002:a17:902:ce8d:b0:223:54aa:6d15 with SMTP id d9443c01a7336-22ac29a96ccmr12494055ad.12.1744151118768;
        Tue, 08 Apr 2025 15:25:18 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad982sm105915625ad.25.2025.04.08.15.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:18 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 08/18] staging: gpib: fmh: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:54 +0000
Message-ID: <20250408222504.186992-9-matchstick@neverthere.org>
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

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 733433d7fc3f..b2c379ce4c88 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1011,7 +1011,7 @@ static int fmh_gpib_fifo_read(struct gpib_board *board, uint8_t *buffer, size_t
 	return retval;
 }
 
-static gpib_interface_t fmh_gpib_unaccel_interface = {
+static struct gpib_interface fmh_gpib_unaccel_interface = {
 	.name = "fmh_gpib_unaccel",
 	.attach = fmh_gpib_attach_holdoff_all,
 	.detach = fmh_gpib_detach,
@@ -1039,7 +1039,7 @@ static gpib_interface_t fmh_gpib_unaccel_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_interface = {
+static struct gpib_interface fmh_gpib_interface = {
 	.name = "fmh_gpib",
 	.attach = fmh_gpib_attach_holdoff_end,
 	.detach = fmh_gpib_detach,
@@ -1067,7 +1067,7 @@ static gpib_interface_t fmh_gpib_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_pci_interface = {
+static struct gpib_interface fmh_gpib_pci_interface = {
 	.name = "fmh_gpib_pci",
 	.attach = fmh_gpib_pci_attach_holdoff_end,
 	.detach = fmh_gpib_pci_detach,
@@ -1095,7 +1095,7 @@ static gpib_interface_t fmh_gpib_pci_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_pci_unaccel_interface = {
+static struct gpib_interface fmh_gpib_pci_unaccel_interface = {
 	.name = "fmh_gpib_pci_unaccel",
 	.attach = fmh_gpib_pci_attach_holdoff_all,
 	.detach = fmh_gpib_pci_detach,
-- 
2.43.0

