Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580081624DF
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 05:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751174779; cv=none; b=fV4ZDQh1nKzuwzjOhOETNsSyuqmGEKoX2uDoZjfnYdivBov48LcjHIIWh/OgV1ncF2O/g9ufrrkmbbIwVTPS8r7FDmF3NaSsh3tvDt1o4QS+hgxO5b2iHNBkFjNP2p3mtnecODEEclwGF4iVMKJQ9avgKi0c/iVFmKpimWY9fC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751174779; c=relaxed/simple;
	bh=M3FLm4ZN7oVgX06dyEtwV48aC309MEfdjOtkifiOddQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FrzfxlCx2bOjOOW5T8XR0Q80/klIBqZioDiKolbVSdKlM1kxux7hGmoCDO1hflRXG48ktDT59OQl816dC5Zv6NuqNrJ1jL47q//aUGsO9ElGETfPMZdplsGf2FmB5GS1Yu5Elkxj9/7h2S1Q8abArw6gGlFmmdKLoB0TlHjAi7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=aIPPLucN; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="aIPPLucN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751174775;
	bh=M3FLm4ZN7oVgX06dyEtwV48aC309MEfdjOtkifiOddQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aIPPLucNGPEK9Xm0WQCANq+AZeD3PNhYhbb+ukGCFzQYBUu7K539ofMM5VaN1Mcnh
	 7D1h9xg4XS2b+RlW6Kd/FEEsN83npVViz7w/PuVgLmsGnYSnn4eg+izhH1c9/0h4zy
	 3G9eW+8z3yyOLsWoeaA4OkhbwtBbkLIuy3PW1q7Y=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 29 Jun 2025 07:26:04 +0200
Subject: [PATCH v2 3/7] sysfs: introduce __SYSFS_FUNCTION_ALTERNATIVE()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250629-sysfs-const-attr-prep-v2-3-9ec5fe39083f@weissschuh.net>
References: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
In-Reply-To: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751174775; l=1400;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=M3FLm4ZN7oVgX06dyEtwV48aC309MEfdjOtkifiOddQ=;
 b=qhG8p98GkpBQZtiYEq+BILt08wsJv7yVFMqVz1AwpCgXxp5UI8Jy/phfSs5yKmLYqpKsCtndW
 c6K9fFeyqRdAWBqrf1mE1IzPE5vquc1nWjBahqZyBWPb1B/zS4mIuzj
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

For the constification phase of 'struct attribute' various callback
struct members will need to exist in both const and non-const variants.
Keeping both members in a union avoids memory and CPU overhead but will
be detected and trapped by Control Flow Integrity (CFI).
By deciding between a struct and a union depending whether CFI is
enabled, most configurations can avoid this overhead.
Code using these callbacks will still need to be updated to handle both
members explicitly.
In the union case the compiler will recognize that testing for one union
member is enough and optimize away the code for the other one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/sysfs.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 118a9b1d3b3e7528fb213d83f85d31bbac0dc309..3966947e78b8c030971daf5ee66bf5ab40bc2a17 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -58,6 +58,12 @@ do {							\
 #define sysfs_attr_init(attr) do {} while (0)
 #endif
 
+#ifdef CONFIG_CFI_CLANG
+#define __SYSFS_FUNCTION_ALTERNATIVE(MEMBERS...) struct { MEMBERS }
+#else
+#define __SYSFS_FUNCTION_ALTERNATIVE(MEMBERS...) union { MEMBERS }
+#endif
+
 /**
  * struct attribute_group - data structure used to declare an attribute group.
  * @name:	Optional: Attribute group name

-- 
2.50.0

