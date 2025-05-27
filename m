Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E720C281524
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365902; cv=none; b=Yh7u+4JzgkaX/Usj9ESNrdO1gihgOv0iBf9euXBSWAuPtkal9R24xXTHt5eynBsw7F04BI+QovEprfyg58syQRer+uejabfDguFF+KTY/vKQXVmGwx2QXAW5JWgKCA26+DNkGl3mrxC8aWTO5+dvhgQpvXPCj5tMfPgIe4zv2Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365902; c=relaxed/simple;
	bh=WRJHINpKvIzq+kAIFhHGh/uFlb6VeUjDetEZlCoYiZ4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MhfgBZUtCt2H1MkEfbUBKjKarIEOrEUM8ldzFmRlK9jwJ6tCdfg+VJKYO10jmKCYO5yp1qjH68IqMaCHomdaOI7s0DZK93CZ6W9z/LtYezoZa33Hj7qZJCL3Ru84JU8fpj3mz+90vbo/goOwEuS8ulEp5TxolwtJAORvRTWFuNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qpbGGBHI; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qpbGGBHI"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3110462b463so3840964a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748365900; x=1748970700; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7pWVizCte/zfBc5wbZWXELXXuItPZZs1aoRgUlPPJRw=;
        b=qpbGGBHIN0TqW9C3PippNa15FnnYBgR8Y4balOPlyC+nStPLHg39VtzSOnMNBAi011
         yb3BqdDQBoUY7Ia4L24yaZ/sXg1AslzBvTer4QuSI6S514VVT978XDZ6fFsSJX8C5TtO
         pfkAODU0EiM3ufxCxHbMeospo+Vg3Wuqcf+86BoMVScZXnS8lki07o13p2+LcekoeFWP
         NWDAWzntfXxhDlbqPWc3KsSObCvyThLg8XDCkE2NTLfkYJtqbg6iJuuI1CZoY1VnnoCq
         nlil15/ByuQCdnxuJDqjyqg7BFBQV0h15MJAEm60a/JL6AmxdDM4e4j/Z5pscJ/uU7PJ
         ODww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365900; x=1748970700;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7pWVizCte/zfBc5wbZWXELXXuItPZZs1aoRgUlPPJRw=;
        b=NiZ8lDNznDMQxlgnt1e/Tmtmior29d+1LJ/lbp3XxhLDL7fD6IkQKHS71MC9SqNkEG
         00vkING5tSOE+5l4mgdv458zeDoUcgBDQH+P/EtBs13RM8vtUuH95gXSqWQxwFAqhWKB
         u4vnsOrxa7hcUVVhqiRF2tovP9yRdjfIX2HWKNrPBnVBJE4mvYv10mROT4FGGRfvxjNg
         qdwXFUyvZEYl70P3N4ljhEAj7i9bUpjEmLj73cJBBfzeyI67trYIJXY2hKI3NJt71gdx
         Nuu1Wc4Wp5cQbvEuetb6iFzwjdk0HSi6VYvQdR8FQJPcUedSP3Reb0BY63kXVnLqrquw
         A4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCX3i0tjBP4wwA/Xk0Lv+iOV9HmibKn3Xy902fBmwLGL8GOozWapab6pwhN9wKmFkpwmPvj0l+67UKGmwM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWGIypG9T4Tfvx2oUFvUtk/5dFoVH0y0dvi0JEmA3HEUPCLSqc
	C3SWdn/Hr8EYpG+58VSTIMsSNwPp5FRmjZ4ZlH7yTQcpjNkVPjUxUJ5Yq1ruaT1sXoAVg7xufxe
	vMyt58zDWxd3j0ZKLbQB1eQ==
X-Google-Smtp-Source: AGHT+IGco4V40TsVlohUm2gdWA+Dyi4GYATtBZ7Xwh96aBepziaL0EAKO0k6gcGCVwhfFEHtJ+i81GuM/G1Mo+NX
X-Received: from pjuj14.prod.google.com ([2002:a17:90a:d00e:b0:311:4201:4021])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:35cc:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-3110f33438emr22861081a91.4.1748365900271;
 Tue, 27 May 2025 10:11:40 -0700 (PDT)
Date: Tue, 27 May 2025 10:11:28 -0700
In-Reply-To: <cover.1748365488.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1748365488.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <f247ceee80387ece536aa5657f105321809470f1.1748365488.git.ericflorin@google.com>
Subject: [PATCH 6/6] staging: sm750fb: Rename local var `nDirection`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename local variable `nDirection` to `n_direction` in
`sm750_hw_copyarea` to conform with kernel style guidelines as reported
by checkpatch.pl

CHECK: Avoid CamelCase: <nDirection>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index a34d8f6a033d..b9f90c934b7d 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -153,9 +153,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
-	unsigned int nDirection, de_ctrl;
+	unsigned int n_direction, de_ctrl;
 
-	nDirection = LEFT_TO_RIGHT;
+	n_direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
 	de_ctrl = 0;
 
@@ -173,7 +173,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = BOTTOM_TO_TOP;
+			n_direction = BOTTOM_TO_TOP;
 		} else if (sy > dy) {
 			/*  +----------+
 			 *  |D         |
@@ -185,7 +185,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			nDirection = TOP_TO_BOTTOM;
+			n_direction = TOP_TO_BOTTOM;
 		} else {
 			/* sy == dy */
 
@@ -198,7 +198,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = RIGHT_TO_LEFT;
+				n_direction = RIGHT_TO_LEFT;
 			} else {
 			/* sx > dx */
 
@@ -210,12 +210,12 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				nDirection = LEFT_TO_RIGHT;
+				n_direction = LEFT_TO_RIGHT;
 			}
 		}
 	}
 
-	if ((nDirection == BOTTOM_TO_TOP) || (nDirection == RIGHT_TO_LEFT)) {
+	if ((n_direction == BOTTOM_TO_TOP) || (n_direction == RIGHT_TO_LEFT)) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
@@ -277,7 +277,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr08 */
 
 	de_ctrl = (rop2 & DE_CONTROL_ROP_MASK) | DE_CONTROL_ROP_SELECT |
-		((nDirection == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
+		((n_direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
 		DE_CONTROL_COMMAND_BITBLT | DE_CONTROL_STATUS;
 	write_dpr(accel, DE_CONTROL, de_ctrl); /* dpr0c */
 
-- 
2.49.0.1151.ga128411c76-goog

