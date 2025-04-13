Received: from mx01.frank.fyi (mx01.frank.fyi [5.189.178.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CB8170A0B;
	Sun, 13 Apr 2025 13:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.189.178.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744549799; cv=none; b=K8Q37kMPWimRZDR80d9x9tFYK3TVHi5kp16P1wZf/1STZaPzf8or7AymQ6mdTXcGWCLVpl36YB3OaD4EGbXwk0viw6CJcmM6almY1L9rw3cXC4iUbO13nQVdnC1XXU4kVgrErPm6yU8jMR9QAl3mmMmwhclfT7nkCT3AtMPo+og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744549799; c=relaxed/simple;
	bh=wtiQ0nS3DhbObUTTm+6iRZ44WlXogukaqHakj7jL4Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNvf3CeEwura9NTZlMZ3gtJX47B/d4RDVCr9DcTBzNzdiX502s9NqpGNBNlFOGHao7mBckEN4xnmVa5T7xc6MsMNSbdPWSeTmJi2eh4Dd+gHEDWQkdur6ohyGdGRJ4h/NVUW12TrnpleFk1CLk/eS7HEEvZ5MVP8wDD3l7g61fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=frank.fyi; spf=pass smtp.mailfrom=agowa338.de; dkim=pass (2048-bit key) header.d=frank.fyi header.i=@frank.fyi header.b=PBdMPDZA; arc=none smtp.client-ip=5.189.178.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=frank.fyi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=agowa338.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frank.fyi header.i=@frank.fyi header.b="PBdMPDZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=frank.fyi; s=mail;
	t=1744549789; bh=wtiQ0nS3DhbObUTTm+6iRZ44WlXogukaqHakj7jL4Jo=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=PBdMPDZATl+cpGkIPTSkCd8UxAC4+BcdOFAylNr7HEUsRfflKAHFoyD7PHEHvnGU2
	 M6NmYBRl7ca6iuV0bDIj8x2rRg+eBoz8ZSS2/081GlV9b6Q3JPmui6CWOxjUIKbQHI
	 VGWrbNzMu1i94+ORd2WBXINcNlR1crgdLJs7UUfngrZ4H92Y3033uHxk71HscwTKXs
	 VAxNZ2VnqfnroosxcJ64gcaLXXrUMpvFFXbOHer0kmWa1hBrioY0No+lEERlma6vy2
	 0i8HaO6d+g2khZdm256SH224aDi8PpIx+CW/28u2F4gvvVvzziRIN2wlSf5uE/Ew2k
	 rvzqWoprc3aNA==
Received: by mx01.frank.fyi (Postfix, from userid 0)
	id DE2E7112010F; Sun, 13 Apr 2025 15:09:49 +0200 (CEST)
From: Klaus Frank <vger.kernel.org@frank.fyi>
To: linux-doc@vger.kernel.org
Cc: Tom Herbert <tom@herbertland.com>, "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: [PATCH] Fixes: be26849bfb6f docs net.ipv6.flowlabel_state_ranges new default FALSE
Date: Sun, 13 Apr 2025 15:02:37 +0200
Message-ID: <20250413130237.4098868-1-vger.kernel.org@frank.fyi>
X-Mailer: git-send-email 2.49.0
Reply-To: linux-doc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Klaus Frank <git@frank.fyi>

Commit be26849bfb6fcee4123c687fc39bd6da1b3be328 changed the default value
this updates the documentation.

Signed-off-by: Klaus Frank <git@frank.fyi>
---
 Documentation/networking/ip-sysctl.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 5c63ab928b97..b3e70b760cf4 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -2057,7 +2057,7 @@ flowlabel_state_ranges - BOOLEAN
 	- TRUE: enabled
 	- FALSE: disabled
 
-	Default: true
+	Default: FALSE
 
 flowlabel_reflect - INTEGER
 	Control flow label reflection. Needed for Path MTU
-- 
2.49.0


