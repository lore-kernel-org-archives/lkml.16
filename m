Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39062586DA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151124; cv=none; b=kX+i13Zm9a2zMxSHvbquAhE1xTB9H+tKSawuNnsYOPNGRv9zkyLwtDdYZtMNE+HQRAL1JgUkHVUB6b4/GY0zwVqVSla3wNkt7scHmDOnMaRby/SsM9D725/RaK74rrccnbuatETe3ylHyrsH2fn6xZFTvIuPhy5uVxw3lmuYr24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151124; c=relaxed/simple;
	bh=5NwJeDoAtrf0Tx8RIS/c29EngE2LsKm8AYPS+TzPKUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VGPbjx78QH3z9achOn9AnntbK0BC7sBK5kip3J/Ttu4TJi7Dd971ObjBDV+7rYaYIf0NphB3a63hhcAN1R8sqnAf9AmfODVQeHkTZNkxJ3lFNj1MSEGT18tKMYGMYetI4zqNMAz1W3PvfjvcSN4+oVJIMRPNkaHybS8ISgMklEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=YFxTTE8u; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="YFxTTE8u"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3011737dda0so4592357a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151122; x=1744755922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ed/nYTgwq2fOD1wKZMkQ0lXU9nmr1lfpOmDa3UEGBR0=;
        b=YFxTTE8uFa23NYAfanx77oa4SUqYIvmaPkTFzhh5ZwdVJuhm+q5yO8GD72Py+VF2SP
         aaD51vrXVuuOTCL+hX6qHCs185YpYl5nv08x1tAfE7mKB9JDFEC3eeJqdH02JSYDx03o
         XqeTVp+oz5THYfEuBTY8AL9Flmr8u2CXp4g66trj7rFx/tybxPyhBGrWlm4ipKCttdlc
         Z7RebVoeVHzdlkWhio3xZpqD+crVxKoHVcB1kaJsWsvVwRccIrN4RkbI2pwFcXcpyRgF
         VmMDn3FY/4f0ZVMGsDtLnJasERy3HQIfIog/ZAZQpePYLNzPLrAIYiT09TxD9UNrFtHA
         L6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151122; x=1744755922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ed/nYTgwq2fOD1wKZMkQ0lXU9nmr1lfpOmDa3UEGBR0=;
        b=n8ErqOHhlXJ3Lbh0LrVHXJoLE0QaMvvuHIPbG/Q7/xhgxFUFVHarN4nuNjjdpr2sVk
         yUTU85v0snvaZlUNNzmj93QSyxAhXgrybEq/Jy//kwaSYkpJrJ9eqN+MuuB1JC5hlz/T
         Y33JwSsWu7Eq8Nx0BfH8JvWDc2M/xDd06+fdvYBlBwl+ZzTMmcuXo0iHm5uYywtPDOVS
         mRRNEFBis33mdIOfUiiqCxp4bhHD8toPwy6qhNZU/xAjQOCUxz4x5FZFqdC37YN0rK+b
         jFBULmNSQiEpBZkEKeypyA18uq7CJoC3dZDSN/nq1EUlOkGq882efRGP7jt8j0Bf0bgb
         zLdA==
X-Forwarded-Encrypted: i=1; AJvYcCU9kIEQlT6Z4OYWGW8lfpKPVYvoHY9C1JZi1fpLSnOZsGCnOFcmy+90ulHb6/ao1hVxrVPopYrU9GlRkf0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzevxc+wNAi1VcKdOIBXYjFVCjM7WrXMiZ3EsRQOLcuCOlr9Zgu
	k3WqFfz9pjc//exOYNA4ideJSTTQiwfv6JmVzZ0wYzqm3ChGpnL1U3+7wsQMI9tVxErmmm5WUdM
	=
X-Gm-Gg: ASbGnct7gwnp237F8LGugzhZEu3+fHbPgN/2SLNY8zJhT8IweKEWnWQ/cVh27UZdc0N
	+sCK858UYsbYPtzTSqj22QMayw7qFr9inMLYQesruzPavglw5HN/uaEfylr/1nADMmnnrmcccA/
	/L/m0U6N4dzKeFIl4bJNUX9shkp8wr7bI6liRALFTneGodFAMzz70ps/1222PhZrbah5fJ3n2e1
	VE+TTL5oM+bVzy3epNNo5ZpcntG9O5S9PWnB47ba10OG1H6NXawKUzVZdfEbWEqkIuzuPat59ie
	eJ4gbLyHLhnCUx00D30oMtQogYwXl5fas5V/j8S1pjlLejld2gkvwIw8o+183CHZ3lKnwD6ABTJ
	ROQzkBQxkQoOWY795fXFC
X-Google-Smtp-Source: AGHT+IEluinBJ/WzRKg68aXx+kL4SHWDvkm0+46g2cXPGj3iEdxubNX0IJJK30XCGqi85flc99q6Tg==
X-Received: by 2002:a17:90b:528a:b0:2ee:e113:815d with SMTP id 98e67ed59e1d1-306dd51da88mr230912a91.8.1744151122327;
        Tue, 08 Apr 2025 15:25:22 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd04e9a8sm105050a91.0.2025.04.08.15.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:22 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 11/18] staging: gpib: hp2341: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:57 +0000
Message-ID: <20250408222504.186992-12-matchstick@neverthere.org>
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
 drivers/staging/gpib/hp_82341/hp_82341.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index f52e673dc869..775103d744ba 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -410,7 +410,7 @@ static void hp_82341_return_to_local(struct gpib_board *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-static gpib_interface_t hp_82341_unaccel_interface = {
+static struct gpib_interface hp_82341_unaccel_interface = {
 	.name = "hp_82341_unaccel",
 	.attach = hp_82341_attach,
 	.detach = hp_82341_detach,
@@ -438,7 +438,7 @@ static gpib_interface_t hp_82341_unaccel_interface = {
 	.return_to_local = hp_82341_return_to_local,
 };
 
-static gpib_interface_t hp_82341_interface = {
+static struct gpib_interface hp_82341_interface = {
 	.name = "hp_82341",
 	.attach = hp_82341_attach,
 	.detach = hp_82341_detach,
-- 
2.43.0

