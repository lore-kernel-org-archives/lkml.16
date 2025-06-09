Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD0A21D58F;
	Mon,  9 Jun 2025 18:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494841; cv=none; b=EqbUyIxdSBKzoaO362dniPUT+ivH5UuS0vw5sCrA2rdoTdRLdld0E76EoYPb7uvxDnUstR9WHPg3laZ51FY4salPgH/YKtKJ6OJalD6WABsEvUmo+L0FbgSvGGaxELtAiTGHEyKgBzA/d5MI0ON3cxUzKahhkf2GSs+RpMI7GCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494841; c=relaxed/simple;
	bh=6s198e3EyQkclHWrtjrz3SraPafZ8SUb1XQ2K7FcJLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pkh6HoXq2Q0Mt2yQvbRvuTEtzoptwJrSAW1TdJrAZjWrBC1CYeFcmCG4F9g996KSxkNPEcD9QgLh+MjEuXLjIsed/4OGfKC05LPv2/i/ASpWyVqTG9JOqOxRdHnKzpx2xZj54FYgmQfSLvLlCMF3/yXEOD7rlHZAS1FG0XeHLXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsm1iJ08; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsm1iJ08"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-730580b0de8so3214399a34.1;
        Mon, 09 Jun 2025 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494839; x=1750099639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ybR1JZUoZ3rp+Oss0+CZOa5JsyVyUt8gjQEnl0L+tP4=;
        b=hsm1iJ08WtsyZht5M0npu7miI6n/XKJpuKW8BjkOznb50pYRWji/+0BBf5vJ+3VQLm
         GP4AqC6OM8Oeyx3r/p44cxPi0rMnG8y6vLlTOk8ptNi20MNOruVHundbva+qapkE8311
         smVhwgJX7bO/5y1T86wTXswePXvZMK8igipDqpyFmS91Day00JMDtqonGG2OqziY5H3j
         MmI/6a6KOrCEM8Kv/vrpVSGptfrIgRwh0eejZ4sNKWyMiXnKrxHIKwujkuTlOFwm2O8r
         o/dsXfw0zC28WTd2bpw0+5bmHFP/gcUSdxnbhAdMd8kb3YmGr3DEkUUQ228IKGbyko+1
         ipvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494839; x=1750099639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybR1JZUoZ3rp+Oss0+CZOa5JsyVyUt8gjQEnl0L+tP4=;
        b=NHN6LTt+E1/1PgefJf61ClaZ24sPF4R0Md1/l9P2ls4sbghXl4ePmdhuOzYESSDcxS
         Ro3rYzvlUZGZiydsq/yJITI4bPlacBu3iKg7dKRJKkEJjP2UNELZYhZB2ffPBAQ8eIrt
         tyd269LdrbIUttekSfFXaBOrHiyCQFxNKWeAivyaZbOmhNY0nDtZOATnpMkr6ACuYuNI
         PQ/Kg7i6B6i66POPpAoS0JF48V0oyBBiHMU6DGnCIEJhM3l6+5QiDN/6962s/9JOx7ix
         XWYRHCYT3NmhBaKSrEARTitMku7mQ2e1Nne2K1of4Kr6eNuu8HAYpMTDsWhNo4IplAWH
         3leQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjXtqggtMwEVbsrJqFWz+3NZebfGis6jdUth0cSwT+rFU1jYy8mNj/rOoJTnl42CuqgA1NRs/qL++qMQdM0jakuOf0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6G7tIqq3BZBVp2AIM6quC83JwNTK5rj+QknBcu9+Is6wZw3fG
	tFs6CWrB9yzETcUnJW50/tuQxPVLPNLgXtoVj6Jnvp8tCTZvzeC1e37YYHh8TA==
X-Gm-Gg: ASbGnctnpHoLVI0FUkwzCq2TeahfMVePHumBSPa+bgsBglymo/sQlr4ZVRJDzFwCUt9
	+FnACeSyzKiNO68PnZKr1EHZXAwYdj3D99RR7KATm9H1wOXzkDnG4sLRi0Q2jnzz6qJsFdZ7RgS
	ZSSFBJh2sijSb1wKVRfd1fM7u0dc1XCDIrZyM2bX+vnbvJIS3T6pNKv1x11j7C4mO6lnlnQlw2W
	faVeyWNMotOcf28HiOVA8PkdisMmezJD206tsPpKbTHEnqIK0ZM08uZzh3srRM64m7a8JkrFP/r
	ZF/ld4VOGXEa7p/LhcG3WuqMwDM/c4bvIoaxCryJZZE2LX3UTAuuk9s+4gK2Pg7BCPvVk5KT90+
	rd3MAIJEPftFeqNWh54XNgRMlQuXa
X-Google-Smtp-Source: AGHT+IGYSwAfVIi7rIylDueosfMJYfw6Zm6TohFLFsmESJte+Z/Uy8OcYnBiwsZuXwOX15cKOUk+sA==
X-Received: by 2002:a05:6871:183:20b0:2e9:8f40:9ea2 with SMTP id 586e51a60fabf-2ea769f974fmr285707fac.7.1749494838926;
        Mon, 09 Jun 2025 11:47:18 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea072e4b5asm2035950fac.30.2025.06.09.11.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:47:18 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v4 2/5] platform/x86: dell_rbu: Fix list usage
Date: Mon,  9 Jun 2025 13:46:56 -0500
Message-ID: <20250609184659.7210-3-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250609184659.7210-1-stuart.w.hayes@gmail.com>
References: <20250609184659.7210-1-stuart.w.hayes@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the correct list head to list_for_each_entry*() when looping through
the packet list.

Without this patch, reading the packet data via sysfs will show the data
incorrectly (because it starts at the wrong packet), and clearing the
packet list will result in a NULL pointer dereference.

Fixes: d19f359fbdc6 ("platform/x86: dell_rbu: don't open code list_for_each_entry*()")
Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index 7b019fb72e86..722979b19e0e 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -292,7 +292,7 @@ static int packet_read_list(char *data, size_t * pread_length)
 	remaining_bytes = *pread_length;
 	bytes_read = rbu_data.packet_read_count;
 
-	list_for_each_entry(newpacket, (&packet_data_head.list)->next, list) {
+	list_for_each_entry(newpacket, &packet_data_head.list, list) {
 		bytes_copied = do_packet_read(pdest, newpacket,
 			remaining_bytes, bytes_read, &temp_count);
 		remaining_bytes -= bytes_copied;
@@ -315,7 +315,7 @@ static void packet_empty_list(void)
 {
 	struct packet_data *newpacket, *tmp;
 
-	list_for_each_entry_safe(newpacket, tmp, (&packet_data_head.list)->next, list) {
+	list_for_each_entry_safe(newpacket, tmp, &packet_data_head.list, list) {
 		list_del(&newpacket->list);
 
 		/*
-- 
2.47.1

