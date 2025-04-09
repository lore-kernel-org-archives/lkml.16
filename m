Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23B61A5BA4
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220001; cv=none; b=ggDedB9xuyjXPTzHDNsmPL4tvFs9rEqtxpXR97J4EaTAoAkVSV0t2ZjgbTV8dKAoFh1DSkwEllOp3HkcNCfgK/i95EC2DRbMtqdrQIZ70Xc5E0zTTxyAC94A8R6owimVF+b0bHGY26HzrQ3GqyZIPpQHrV9K2DUGGIt26OGJVWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220001; c=relaxed/simple;
	bh=UDsScVawTwMhviryuJnaMYaRiEHTchUhs9U9vyHyEts=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=i851HYn/Kii0ZeaqdaYyqGrRiPJbFZqBD2NwVgH7GN/VqFJpxmoOg0NSO0+5e8Zk2L1E8KhFdWz4wzKrmSHS9faMEEoRRUt1AzU2+HhvDcfIjm+Qg8yLkorh6wz7o4a3MBodfpOvmL4YLvWrm8HIBCkr4wRJufkn5vTsI4nBwIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=LmU2o3W7; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="LmU2o3W7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1744219690;
	bh=Tx0Hr945Xe0rUvgIJ5OIe+KhPZ6SaToN7Vw0a9/byQo=;
	h=From:To:Cc:Subject:Date;
	b=LmU2o3W7qap/AsEeLwZfRBRIPsSlXOHH/mDMK5bI9nm3GOmpacdhbnHurB8dV4mzb
	 AmPPveDEsS+jNPfHZd8kjqwPCXr5v+PirYS/zkMvj4FQxnDOfWr8kyopBDjoxW2KsM
	 3aSnPFAC5FgEqoNNSjTHCSPYUNlZXkuTITETL3lA=
Received: from localhost.localdomain ([116.148.99.229])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id 7090107A; Thu, 10 Apr 2025 01:28:09 +0800
X-QQ-mid: xmsmtpt1744219689tp7uccbam
Message-ID: <tencent_A8520B8C5C017A6C86DAD38B120D1B4D2905@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLoiY02xCxdjTDiiqKpCIFUzYrRQdufj93eM9uj7y9BA7aQFfHOF
	 ZfQDHlcAg5U+EENz8IGC0vm5F7KaU0XZzSdUqCSth8Nl0MX6w8VBB2yf/nUmb8BuJRR03BHCm+za
	 VMuRq1WR9sxsIZ+Rmbx7f6+H3s7R1B+rAmYZRkIJsvLGNGeL2TqavaFFdXfEjyzCq4aUOTOxTQgL
	 aZIbld+j+TE+smkfXku3Zvtn7lVdjE8mpRdIcQCIyUM3MpCyEgcALsyM9PCH5tohq+qTpVC9neCU
	 lHUCuRbJj6Jp72dVeaY5GGdS0lt4n4XXITZaVt6irTHkLkadgMNhRNWYYGxwKwGpffpNfXbsMqje
	 zaWWj60roeL7OUTWGPrgwTTTg5YV5ibadLsRZooo+EMBC4WyHxKmr/lSOqnOA4JyfRBGxcOMqKaR
	 2YSBToDxRuzCh79LVUlDAJySZGYE/fIMheVbP9Y3PDIawjh3jPLV80m6H173OaOPZkqwDuejkSId
	 UP1mF1T71KrnwA0BbIv57vwa9Kyp0Gp6ac7Cew9z/m158TNbv2oUiW60y8vzDDyJHdxgXm0M2v98
	 H6M/Y4ugR3SwPlaOhISnLJuxh/Je36yzGFKmUk/FbV5zZOcSTK14zZyTHG0pf5XiG3fFNy62Fz42
	 rIq7q3VzR6FBSoIVDpTDVpB9sWZE18m310NIefwEOZpkLQSITb5ce1tMxsqAN2jSXoeifQ8WmiqH
	 Z7V6gVxwk0voMS4/F42CM94DEHs8naF2BAHmD3vJkdiXOQmtc3k8Jd+y6vay4xhVaCdPx6P0YI+l
	 t6bPEmsCGlMQBCfCIo307CJIk8Yzzly5Zmc1hOSTE7sqjQ08GD8Z5H5NpiQK2eS93v7AfBE3n+Kh
	 cSIJNUV2PHOKT1kSzi7pb9G63m72wpAZ/3wuW9kFC/SkHQM5B8vC+r72Rv5/vGkNO5Gay43PRCwW
	 f7SdK9AfDJ6LTFobkj1BJMZyYKNan0dashq3Qpu4S2aJ7fHIl5Naqz4KauPNctrANwicwYmYG01r
	 ELN0qkHw==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: zhoumin <teczm@foxmail.com>
To: hirofumi@mail.parknet.co.jp
Cc: linux-kernel@vger.kernel.org,
	zhoumin <teczm@foxmail.com>
Subject: [PATCH] fat: Optimized FAT bad char check
Date: Thu, 10 Apr 2025 01:27:12 +0800
X-OQ-MSGID: <20250409172712.698457-1-teczm@foxmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1. Add first-Character Validation based on FAT Spec 6.1 ->
Note the following -> 2
2. Add check for 0x7F (DEL character) even though the specification
does not explicitly mention it

Signed-off-by: zhoumin <teczm@foxmail.com>
---
 fs/fat/namei_vfat.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/fs/fat/namei_vfat.c b/fs/fat/namei_vfat.c
index dd910edd2404..d264057f32aa 100644
--- a/fs/fat/namei_vfat.c
+++ b/fs/fat/namei_vfat.c
@@ -195,16 +195,6 @@ static const struct dentry_operations vfat_dentry_ops = {
 	.d_compare	= vfat_cmp,
 };
 
-/* Characters that are undesirable in an MS-DOS file name */
-
-static inline bool vfat_bad_char(wchar_t w)
-{
-	return (w < 0x0020)
-	    || (w == '*') || (w == '?') || (w == '<') || (w == '>')
-	    || (w == '|') || (w == '"') || (w == ':') || (w == '/')
-	    || (w == '\\');
-}
-
 static inline bool vfat_replace_char(wchar_t w)
 {
 	return (w == '[') || (w == ']') || (w == ';') || (w == ',')
@@ -220,10 +210,17 @@ static inline int vfat_is_used_badchars(const wchar_t *s, int len)
 {
 	int i;
 
-	for (i = 0; i < len; i++)
-		if (vfat_bad_char(s[i]))
-			return -EINVAL;
+	for (i = 0; i < len; i++) {
+		if (i == 0 && s[0] == 0x05)
+			continue;
 
+		/* Characters that are undesirable in an MS-DOS file name */
+		if ((s[i] < 0x0020) || (s[i] == '*') || (s[i] == '?') ||
+			(s[i] == '<') || (s[i] == '>') || (s[i] == '|')
+			|| (s[i] == '"') || (s[i] == ':') || (s[i] == '/')
+			|| (s[i] == '\\') || (s[i] == 0x7f))
+			return -EINVAL;
+	}
 	if (s[i - 1] == ' ') /* last character cannot be space */
 		return -EINVAL;
 
-- 
2.43.0

