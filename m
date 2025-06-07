Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C6725A2C4
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 02:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749264871; cv=none; b=ez8Gq5uLJDoy0ctZpNWgqhgfn9TXKrzyk5oWxYUiBsTdK1H4tHx5CAWNRrD1DaviH89v1mK9bAVnMowEPBsvrccjaaaV3gINAWoWAu6t54jnswDOypyq2c/PxYNdWb8ZJhm7gM2a0wvRkHnHOjhtJE8hAQBTqlGey4eUYa5QjbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749264871; c=relaxed/simple;
	bh=ZiQkH309SsPv8lN8ObW99ERD0AIPkQszerT12qHwgsk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSrQM4zEdx5v6TwtKIUyNsYJR8i9H0S4qJQD02NdMrt5c6PFyXLFGZzB5n9aL5MTrVUYF86LnGqTeQGfOqRfQmFKN3uIFlGKAWQLt+WDOdO9qhs/2tnXA27+uDyQzXsGlJmV4+9BFag2jsUuC2r9Xvqs5OLhW43F1brqLVZ8GKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QseZwSqS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QseZwSqS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so18448095e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 19:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749264868; x=1749869668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/JKVoHG52bM7iYj5PS7gTiSERcG5UqrCOig8DJiksU=;
        b=QseZwSqSj0+A5J2VqodR6bP8uCtr+YN/25CKSwPgCAYSqOaOq9nWxcTUNf26G4W72m
         5nWvitpDE/jzkLGoDXgsOQ5EyKEC5fphVEWkOgTDaAX+KERF/Vz6hayl31vB55Pjo/Hc
         5BHp3p+BQCeC0+Quo0/K+3MIUg17U0iLN+cnH+33Es34KDbOetvEKwwAVT2E1O3H5XoB
         i/3J9jSZ1PUgw3twgxNM6ZzwzgT3Z2S3vgSdvTZmVjDc7bGch1tAaSdkm+06eAxVZey+
         f86/7ro+EGaVf0HlqSHH3oF4ywDmmoexk9KjMvYmLCY1bc5UMiMKlNPwk1gYrjhisnzP
         7YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749264868; x=1749869668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/JKVoHG52bM7iYj5PS7gTiSERcG5UqrCOig8DJiksU=;
        b=f6r1T9XSViJacraWhG1khgzavPbjQlz1ajXkOkBhWXVF/jY9oyNMvwuJ4VdkZWaffJ
         kXzUsQBDDBC8/QEiqlKVr3ioSBF30DJm+Rd7bFiMiZfSPU/o5dCTLQ44CdCftGJDb2Hw
         O+1wBxOdW1KAeZy5mSeXOybic0oDkvBgVkRHhGHZrkf/OitibBhTcCoSux2UfVJ4T/1w
         fGqMo0Jov6zyeuns6/gPFOYcFN0aIWZH432WKLw+/HXgXeg5jpLD9PNjd2CWLiCKfTcr
         rVkXc/JMT90Fqh1hR7NPSWNkWF3DM7vNBCdRSsLSyrQ0EDQlCuosREr4dXuGcAjM58aY
         Objw==
X-Gm-Message-State: AOJu0YwZVrOdIoLrtHL8+UMQwy4ZjuwULKuzuBDkJTy5hmjhUFett1V9
	1sKuBcw9xqGe0hMCvZ5BXHCglIiASgVWeynUD5jq6RojqSaXt/9bmp7VEsSpcuuwLpA=
X-Gm-Gg: ASbGncuWuEcI7QuMBx2VC8U4m8/DT3e0i9x0uenA8lDXx5WJGVeZixu/EUz04jdLqpD
	1qBEEGAnZw87c34RJIFuH4N0EIdZEBwx9IdDtY4or1efmGTpw5FACoNNQzTx/TRataf0/Ueb+Le
	j5GM9Hq5bb3ISQK08sqxnMsWRjLDeOj1j9s0hKsF2xLZ+nV4Gk8Nf6fcnniXbwwfbyHtxe43hQc
	5zP8OioViut7VbX1mSC0kFDsz8xB3PuNt+E5+owd7Abw7QMHU6n0+zp3osWIEbT7SD14x7UC7oF
	PyJWddRnfmZiv4825Ba2XIgvC3ScvLJyrKgydCBpp/YLhCpt
X-Google-Smtp-Source: AGHT+IH5d/vDAJyZSz6fuV0j5C8IVfGiu/PKk0FvmAPHACrM59+l4DsDYjrQIDTW1PtMdxhQU8+9aQ==
X-Received: by 2002:adf:e705:0:b0:3a5:39bb:3d61 with SMTP id ffacd0b85a97d-3a539bb41abmr1337284f8f.27.1749264868362;
        Fri, 06 Jun 2025 19:54:28 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:80f:b600:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e6429475sm2005465e0c.45.2025.06.06.19.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 19:54:27 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Date: Fri, 06 Jun 2025 23:53:47 -0300
Subject: [PATCH 5/7] arch: um: kmsg_dump: Don't check for CON_ENABLED
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-printk-cleanup-part2-v1-5-f427c743dda0@suse.com>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
In-Reply-To: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <danielt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-um@lists.infradead.org, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749264832; l=916;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=ZiQkH309SsPv8lN8ObW99ERD0AIPkQszerT12qHwgsk=;
 b=jWqGiPKl/XV1kWO8hkwg925xr1q6tsYBxos9FuxBE92z/Pq14tW6oRTqYnah8nuO92j1JK2AA
 efZNwgbsN74BdsXUFSv+HbPRvTzvr8dhPJfS5pW4gOs10Hl/GEHry89
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

All consoles found on for_each_console are registered, meaning that all of
them are CON_ENABLED. The code tries to find an active console, so check if the
console is not suspended instead.

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
 arch/um/kernel/kmsg_dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
index 4190211752726593dd2847f66efd9d3a61cea982..f3025b2a813453f479d720618c630bee135d4e08 100644
--- a/arch/um/kernel/kmsg_dump.c
+++ b/arch/um/kernel/kmsg_dump.c
@@ -31,7 +31,7 @@ static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
 		 * expected to output the crash information.
 		 */
 		if (strcmp(con->name, "ttynull") != 0 &&
-		    (console_srcu_read_flags(con) & CON_ENABLED)) {
+		    (console_srcu_read_flags(con) & CON_SUSPENDED) == 0) {
 			break;
 		}
 	}

-- 
2.49.0

