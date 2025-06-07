Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D91C20297C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 16:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749313281; cv=none; b=UxazHMt5Nd8TBoVKLXuUZYiQu24insOFPLPjBvudGXWrgpFF9sWKcVJI9lrxdpv0NpzMeLayzwsnX7dNserGH2Ev4Dsiipp5VNDL2Q93SxoOYQPIotNkYTILkVFxWK/snqk8QftMHSYmhLNDiBH0oityn5buSM/19UkKvPXPkjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749313281; c=relaxed/simple;
	bh=yS39zyBnMfHaSeoQ0X/1PfxxvV2rs6V8w1tf9X8XSak=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJPkef7o6KMGQ5bRNLf2O1kQfJwPHgri9XCkzYm41g27YVudJ31vd3ga04ArzVxBJOMCvaJE2fhCMjDkTGq7Z7g2nQeyk42wQN+BEqYSRWRxy2FTJTY60uzI7lg0zA0BuQzGR/LQWAFNu0QkY0+JGWx1LSlle7HyZmSar51M3z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QCtKTsRr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QCtKTsRr"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so2451179f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 09:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749313278; x=1749918078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qKdIt6ySfsyC1rITEINP15T63UfdWJd+2u0hTqqtgk=;
        b=QCtKTsRrWHEbtZUbd/OCZpS5LQunyQiEwuIzTdbzdZlyeH+MzcRVoculVFyeyUzYtq
         AIbDZqZWLRVVJ8h9nXB5JVKRsSrJBR4bI8Fw4IzekpWdjXMwr6PooC2frOLYzZ3ZQ/ZS
         1EY0uHTaTALQZ2xaDuL7NtLkngV6uFwLq2NvvfLGTPAPG+fVJgCW0sgGbrm6zRZx1sjj
         hFi0jCuzEGTDWBGPGz7ZBltjv19qzUWqJV+pzNOAp6SbEVfdlIcbLquAPOWfcj569XjI
         YM7vWaf7hH9e1GH921oaemgwf/ezBqbaIFFiFqzj4pbZzcb5k/lHpU027vqNi/Ajlk1l
         Nk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749313278; x=1749918078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qKdIt6ySfsyC1rITEINP15T63UfdWJd+2u0hTqqtgk=;
        b=QXs2Olr5M680nEkFz5ZoNwtWIpEvbO14M4SFZst9DuxRSu36wJ6VUmzOt9s+ODwkZ6
         AYTcGiN1tpzI4W/AdUOsBBPDPV4s7ezUfXjmwWPMxIw7ISDZDirYBesk+PPpnoeQsFVw
         Ir/DDYe+LwdAbhHKsa0svwAOxSL9ksRtOCjveWxU8MPN0gHxSsgW+xIUjFS+9/Qw40d0
         AQE9dkJ5PZ5ITGkoC11oyoS3NSTpH5N4otDvzHlC+S+pIY2JwNM4sInHaBUsPN0LFei4
         Fv+l7WvS70BZfG+2qLPwaBwYE9Ff5Zou9qJgu7IhsLvPSOiVyAvpp/59aVW+lpDI+lID
         q4Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUSrVyQU2IrLRbM1OehxiSKfxegPNUDXZ4qvhJj/IQVCDtzNwTh0Edr6FEzH9+syQF2fbL3jpu3MOcu+Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxb8unExFPu6fX+GpMnp9UxTbNKqBzE6FX8iT0tXykXhOyH/Sh
	fjnIZ6iKolQ5SotjY4zkh4oGnTwg5PzwG/Kt7TC0vj1V24QE5G8++UQqpDhlg9muhMQ=
X-Gm-Gg: ASbGncu80v3LrW371zmbkQ5Vbw8bhExi3F566aH0tVAWJ+/D/6ubB99YdI03OGHZLLh
	4P5Z7veASCnQcSMVp/A4S7oBZeEIxJHLG514bgvEFBAJjBnCwrWdsr42/xp50T1ikVGETC7fYWG
	IO4nsi7nC4KlRVLkWr7V5fIgsLou1i6APnprvhUlyqPfKu5SaOGi+UBPEaR301PmGifRO+Pd/UE
	mBMmv3YUAnRCTxDFL6kEiCHCQs+jOiWHcKtSSN1A8Sad/o8Xem0R+9COaYgXxlelTjb3oD6P7f7
	fu7NfINxeXawU9ON2EvVGwCsyfkv7VIYJrmrjqArNLxLEjNwXQeukO4I30RY9Hvm9g1ZuYU=
X-Google-Smtp-Source: AGHT+IFh6+oH90GRtrMoNrq78peuoljilpbPTZ7rDeQaNRcR3EO6gPLCfmQumbO8QK7SYZ51/feM+Q==
X-Received: by 2002:a05:6000:2410:b0:3a4:f379:65bc with SMTP id ffacd0b85a97d-3a531cdd100mr6256542f8f.40.1749313277773;
        Sat, 07 Jun 2025 09:21:17 -0700 (PDT)
Received: from zovi.suse.cz (109-81-1-248.rct.o2.cz. [109.81.1.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364f1sm5088096f8f.58.2025.06.07.09.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 09:21:17 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] module: Fix memory deallocation on error path in move_module()
Date: Sat,  7 Jun 2025 18:16:27 +0200
Message-ID: <20250607161823.409691-2-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250607161823.409691-1-petr.pavlu@suse.com>
References: <20250607161823.409691-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function move_module() uses the variable t to track how many memory
types it has allocated and consequently how many should be freed if an
error occurs.

The variable is initially set to 0 and is updated when a call to
module_memory_alloc() fails. However, move_module() can fail for other
reasons as well, in which case t remains set to 0 and no memory is freed.

Fix the problem by setting t to MOD_MEM_NUM_TYPES after all memory types
have been allocated. Additionally, make the deallocation loop more robust
by not relying on the mod_mem_type_t enum having a signed integer as its
underlying type.

Fixes: c7ee8aebf6c0 ("module: add stop-grap sanity check on module memcpy()")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 kernel/module/main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index 08b59c37735e..322b38c0a782 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2614,7 +2614,7 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 static int move_module(struct module *mod, struct load_info *info)
 {
 	int i;
-	enum mod_mem_type t = 0;
+	enum mod_mem_type t;
 	int ret = -ENOMEM;
 	bool codetag_section_found = false;
 
@@ -2630,6 +2630,7 @@ static int move_module(struct module *mod, struct load_info *info)
 			goto out_err;
 		}
 	}
+	t = MOD_MEM_NUM_TYPES;
 
 	/* Transfer each section which specifies SHF_ALLOC */
 	pr_debug("Final section addresses for %s:\n", mod->name);
@@ -2693,8 +2694,8 @@ static int move_module(struct module *mod, struct load_info *info)
 	return 0;
 out_err:
 	module_memory_restore_rox(mod);
-	for (t--; t >= 0; t--)
-		module_memory_free(mod, t);
+	for (; t > 0; t--)
+		module_memory_free(mod, t - 1);
 	if (codetag_section_found)
 		codetag_free_module_sections(mod);
 
-- 
2.49.0

