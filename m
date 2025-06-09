Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F236721FF24;
	Mon,  9 Jun 2025 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749494843; cv=none; b=q99zrXhwuWWxRkQN2FKsCYmPpyFgNNuWwXnpoX7h0CoxGXUhKc0FDUT9rR5f/Q6j5lt4BrgRzWbQ7NAHbX+pf3aUVzRZhglcp0W1pYKREjQwxiGQWKGVk827bg5j8ZMxeDRi3raizXk5Ga/k9S7RFlDZHd++5K7fwCYa22vdUl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749494843; c=relaxed/simple;
	bh=rmhaipyfzvFTUet4CzgciV8GW7lENMyYlvOXGJwmoRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCWWRzaJlRfgfLB4Znh7+tUKpj/HHrf6AxDbYIToB8AdQJun87+WPEP6qiriO9EbSm5E5jp6J16ZK6jrMc1uuxR+V4qnwiP+D7hmjf32aNFSQd8XNvV3/yQaz8MaPNPN7YiZWsBLFkuEIioU0fR+MmvRES3gGDGDfG7EIyQG3Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYCzRcKv; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYCzRcKv"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2ea08399ec8so1993456fac.1;
        Mon, 09 Jun 2025 11:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749494841; x=1750099641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L8MAicc+DqzsUNmkTOSviTgh6t6DU99MU86Mrya0BRs=;
        b=MYCzRcKvoveQWNyCL7bQ6DkgADD8hwnNOhdiJ+wr2+0/RsWcxH/S9dOLWMf9dVEkWy
         YATvRpKTf+XcMuOOjiymK6cyufvQiFfdFKUJk+4Bg7Tiy3uvg5cSspla9/s0fSCWys3r
         qDb91v1xF+dgDtuzjjBsFwYK2CzisvjKrfxOO2UIljaF2dgLfb6ijeE7B69e4lM6CdtO
         JIeg47B/4sQjXORdVXM921jA996sOn3ZJXD9aJF9GRhmMwZLqSwx95207tACfDNKwust
         EPsMp93iGIp+sajHJbl4t3GoY06EWUVJzYRigUXXPKxLitoOCHFDNCAeC0Z9G7yYn5O2
         Ui0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749494841; x=1750099641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8MAicc+DqzsUNmkTOSviTgh6t6DU99MU86Mrya0BRs=;
        b=LXFr4AgKOG5YiEzJDizM3FnBHQXhhYntQ4ZvgAmlqj7dMcR0ux2XIUI3K9nl0Jm/09
         5ALISb76xNDFbUg1oT0sJi88HlEHv5V/OG17Gie5CsFEVvnT8sjUGphzor3bZQwCNDYR
         8nIY5ofxvMb+m61TK+vqnJBPb4Dba2deNeG0/SCDQFucTS9VWmIprgdjTn9/OtjG8Dkj
         xl9s1k0DhP7r756KcOGeS1F/FEfuSBrBkE2hX2HLc6JjetsO91zU8buFW2R1mQG9CGra
         EH0EMdeEUq0VaCsMvKEod5T5sFG29A+6yDcUcSK0pj8qlDo9UmYy2FPnKyeq36h51cZD
         +uRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsMMUYby3B4fBlL2hbHc/aGaSTXbYZzaKjBsrT41U4Tnpe5XbNuW2nBvbtaRkuIytWuu0OkF3OFzbKETAiPfeHg7xx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0dz3mu3jDX2fNq93SVo/LGzSZwOUTX6mp6n5Wbx1Bk1ak2aco
	7ibEkhmLeIr3EF5xomf0u8UQl0I3Xq+lTiyvQUpXQNfo5F7yyE9Enr+3PcQk6g==
X-Gm-Gg: ASbGncufmUCniICFqFTyGWFxx2JVareIYffjQ3BByfIQSwxHNZDdWNOcu4aVoqQf8/U
	gkOR1/b0CDEOGPcBLhUiVc9ypKesW5XeodbDAHWxVL4H75wPixjeFk/4n17LxzUJCsc6z+Lheh8
	AL0/elbMSh44Q8XQqAJF60prOAD6HO7EO6hSjUQhIAhKdmLqgrUtNFRirrU5x+Mx9iOP4ICKB7a
	beUcoXAnwDO7VBC4N2Qh4AmlEjpn93CkBXzvp3SbtnfXYrRrX6Up/ob2uJq7vp3ps5Wx9Kc453q
	SdkNNgDRVN4cfzChuCm8fb+0VnPQBDrKFwrSRw2gtUagYwv87jpwlRJEVS5X7s5sgErsg+7jkT2
	2p4hqn/+/DKzMWfNqLttJwJ7orOOFd51hEaibVoA=
X-Google-Smtp-Source: AGHT+IHyq/vKQLED9Su1Jd0QEhZdlhfl/u6ki32haPcxOuv+dLXepFEpdo0E2eWGpreZkqGONLAelA==
X-Received: by 2002:a05:6870:5147:b0:2d5:2955:aa6b with SMTP id 586e51a60fabf-2ea007cdf93mr9081717fac.5.1749494840890;
        Mon, 09 Jun 2025 11:47:20 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea072e4b5asm2035950fac.30.2025.06.09.11.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 11:47:20 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH v4 4/5] platform/x86: dell_rbu: Stop overwriting data buffer
Date: Mon,  9 Jun 2025 13:46:58 -0500
Message-ID: <20250609184659.7210-5-stuart.w.hayes@gmail.com>
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

The dell_rbu driver will use memset() to clear the data held by each
packet when it is no longer needed (when the driver is unloaded, the
packet size is changed, etc).

The amount of memory that is cleared (before this patch) is the normal
packet size. However, the last packet in the list may be smaller.

Fix this to only clear the memory actually used by each packet, to prevent
it from writing past the end of data buffer.

Because the packet data buffers are allocated with __get_free_pages() (in
page-sized increments), this bug could only result in a buffer being
overwritten when a packet size larger than one page is used. The only user
of the dell_rbu module should be the Dell BIOS update program, which uses
a packet size of 4096, so no issues should be seen without the patch, it
just blocks the possiblity.

Fixes: 6c54c28e69f2 ("[PATCH] dell_rbu: new Dell BIOS update driver")
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

