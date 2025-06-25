Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176B12C15A3;
	Wed, 25 Jun 2025 16:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868646; cv=none; b=YuHg/VcxyJa+MJdcPDP4fVV3y1bQ0bYqN9aawx2swjJr6hezjm4xX8pCob64XLxIugzQRQhwVpnIFu/L2nkBolPmpsI9ht3py2PCoEiVFXbenQhJpoD9PoqwBpZPCbefiY0h17mXpZd7rg0uDcLoyfGFevQ5tYSw7B9bPgQ7rks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868646; c=relaxed/simple;
	bh=Rs4jORhSAy42GrPDBYIKYOzroBvQj9RZpX60KplFREQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k25ZArzu5xrzc4f2Ppj8vNq6ebZj6n0GgYyAmYigPWYopi1LYFEREvQgWOFGQqd2XElUoRRJGByDsy9+BK2ET0NtXNP1CpgYEenpZBjFmpFs1yOGnytgpn84OvdEspx/CD+MOqkokB4Zh78pHk68lZF7OIGaszVr6hlHcRWzaFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVdTnZbd; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVdTnZbd"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso5637708a91.3;
        Wed, 25 Jun 2025 09:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750868644; x=1751473444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gjP2rWd3v45Lv/VTZk10gXiABB5KA7UkOWe8AIfnTyM=;
        b=bVdTnZbdI8fTbgpjQaNwmp8pOMgZAOkSJQnPB20bQQ8XV34NbMQAmFlpCnnR/z7VCy
         r3OJqTvczmrzFg5mA78tccnE+alZCjUHWbbrsGCqkILfRlwo7Qjo387gpcfPFBYm0Eq4
         Ke0kltum7EAsk5f+5amLQ7Ejot8QW/E04e5NbE31ee/PWnhe/hKLjF9MgKA+QDcXFVDE
         vicRCaAVIgRQGpng0y2Ly3a/Pphw1AhlcN22DRuydpPVtyVSinK6SrYfbvnOvA9/ZHAB
         LRQFO4t4zBnl8wJMxW2uqjmCl9psIM0cTaKqg07WetU5ibKmdGDRs3yLjIIC9L269srr
         UCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750868644; x=1751473444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gjP2rWd3v45Lv/VTZk10gXiABB5KA7UkOWe8AIfnTyM=;
        b=jckiMJ41SeQcQ+Hr2pl5xdrcztkACRt7Vj63/BPtjqfPUikqTXzTDgqEV0OGVYSPiu
         vYR/Z98NE819I5NYpJr76nUU6bk5wqsACzmZ6ySlrsN1s9Db4rWA8lTMWw2atj1/eLCi
         r0R5HmudTdO0Uy025igpdZUpwCf9RkxfJhAWZOO8bDaSZyz06eGmcS+MF/Kmfcv1AFLt
         Y7PHxpj37VQh7otFDKsXn5rJwpA9vXV7G5M9FEwq1dKtWZwCHMsUXMg/c7kR7sSF0Awh
         xb1UPRR/Ct+1T0DPg9HUlxE5zWPhgE1WUPuQd3wtgeEJvDEee63V4Wlaz1+gHyENmUDF
         3uIw==
X-Forwarded-Encrypted: i=1; AJvYcCWKiQJW/+Fr2bHZHjil0zofGxB1nDB0xB5uTNqyi4Chfb1vTLhHvKhxRi3b2yYhLpwdvECaw9hih/UFcoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHROnW3kqcqEp6Azef1rg3oygx7i74YK5MlK3Jr8HEMwIdOQV
	Is07ZeEMFgCESclw/EeO0OhDo2QhoQUlyehBbFs3X0tpFtKqXRq8A10fZBjzPeKRQAQxiA==
X-Gm-Gg: ASbGncurA749lDKs8KLmJOsE0vLa+t6lV25ZjeMOy5uPSH0rXGPWiPESduix3N/K8i9
	VIXx8G0zOtUAi+PkkrpPTDzM35Y3nF2pmbCssNc5HJnPk4OFhaM0+f8gAdIM4PBXfNTjypRiAzd
	r+dWZZaePS8iXH2iTcgy3RsfXnWcaDXU2e+qrDfYFVZV2eHC5v9XDUtYjCZ5zrtzhFDb9jLHONO
	PBruxDQWO0V7I+yW/aNJo7AOk6Rl2qoISmOUFr6Gv+13c/BoObuyTyva/HpPwFNh09n0mmPEF8E
	vDvHtpSLW724Vzaf5DZNea/LZYvQFyavULEVByC9XBE1DLD1B8yPOGc4DwfWIAM=
X-Google-Smtp-Source: AGHT+IG1rXCCt8NntAbb+1DmdChQqP0zv8PGHa9bEddPxESYcXKQgDQnAwc++pJFwAR1ANmhvez9dw==
X-Received: by 2002:a17:90b:39c4:b0:311:a561:86f3 with SMTP id 98e67ed59e1d1-315f25e2dacmr5591744a91.6.1750868644294;
        Wed, 25 Jun 2025 09:24:04 -0700 (PDT)
Received: from localhost.localdomain ([2409:40f2:116a:400:f32b:ad5e:ec3f:b2dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5386edbsm2311631a91.6.2025.06.25.09.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:24:03 -0700 (PDT)
From: Sai Vishnu M <saivishnu725@gmail.com>
X-Google-Original-From: Sai Vishnu M
To: corbet@lwn.net,
	mchehab@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	Sai Vishnu M <saivishnu725@gmail.com>
Subject: [PATCH 2/4] scripts: sphinx-pre-install: add a helper subroutine
Date: Wed, 25 Jun 2025 21:52:35 +0530
Message-ID: <20250625162237.3996-2-saivishnu725@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625162237.3996-1-saivishnu725@gmail.com>
References: <20250625162237.3996-1-saivishnu725@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sai Vishnu M <saivishnu725@gmail.com>

Implement run_if_interactive subroutine to prompt for command execution.
The script crashes if the command fails to execute properly.

Signed-off-by: Sai Vishnu M <saivishnu725@gmail.com>
---
Patch series history:
1 -> implement the --interactive flag

 scripts/sphinx-pre-install | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/sphinx-pre-install b/scripts/sphinx-pre-install
index 6e6e5bda6186..16eb739fd633 100755
--- a/scripts/sphinx-pre-install
+++ b/scripts/sphinx-pre-install
@@ -339,6 +339,22 @@ sub which($)
 	return undef;
 }
 
+sub run_if_interactive($)
+{
+	my $command = shift;
+	printf("\n\t$command\n");
+
+	if ($interactive) {
+		printf("Run the command now? [Y/n]: ");
+		my $user_input = <STDIN>;
+		chomp $user_input;
+		if ($user_input eq '' or $user_input =~ /^y(es)?$/i) {
+			system($command) == 0
+				or die "Failed to run the command";
+		}
+	}
+}
+
 #
 # Subroutines that check distro-specific hints
 #
-- 
2.49.0

