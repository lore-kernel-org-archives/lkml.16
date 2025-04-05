Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2105B1C4A0A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 18:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743878907; cv=none; b=MgLQwsXhRZGxLZUT/++TbYsq1AaXBgek6ojiHm0pMXFWDmuyCae46yJf+FytECyqcYnAWQkVVLW9DQlzcy8dXaRITp7M1dhgDCui7zDl65Owcj7D4PRe4JQZSvPrkcghy9cT+SceFSVP0XuSFQmDmf2xg/6Blj5hhAAAWfm11v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743878907; c=relaxed/simple;
	bh=r7Z9lOOkSxpN+ucW+Gp2u+rGkC79BlG1EH70EKPgKrE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CoadVrkl+7w32QbuaEPgfo9qbo8yi7Rwu0qeOLdLgUTbWAIxQArUZvzxx1zhnw3gL3hf7sMRCCAXkAa3wZ4aYTU0diIeH5jKRuKWsBC5oze/QSDVhgzl1HSicxlhw6H2qzKxI1no0Y7wewtm5cTkSDZwZspUrgUQIlxZHVA+qUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=IY4eatyj; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="IY4eatyj"
Received: (wp-smtpd smtp.wp.pl 36002 invoked from network); 5 Apr 2025 20:48:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1743878896; bh=8900mW7m6CxNPXhte/uesbW94QRwJGoXjpY9qylqeaI=;
          h=From:To:Cc:Subject;
          b=IY4eatyjNNyH/kBUrEcFC7/EebYKxVmHw34qA0CtJq6a3YAQ9723UNrXqBgrB9zui
           DHxv26QOxMo+KYgyRkk+CUUKfsPY3fTnbftf7FKc9WQdmM6odg/eUXmD5k+5F8ejVS
           U1ZdflSAB7gWBIGrPXz2OaqoPwyZJkSVvnNgnpDoUrvnJ/Yc4hHtrh0ARdGgzMhzBl
           7KPo38/c8AFnUHDDCbxb5TZEGcu2T5EeMFC1lTCByDsC4L6KJkl4pBLWvvms9lpRBK
           a6ZiRNl7pC+KUokLAVRIxs6ipdapVWEBXtKicylbgIra8GEPM7ZW7RGlc/2XWANSqE
           bgh04St8JZCMA==
Received: from 83.5.244.88.ipv4.supernova.orange.pl (HELO laptop-olek.home) (olek2@wp.pl@[83.5.244.88])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <johannes@sipsolutions.net>; 5 Apr 2025 20:48:16 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: johannes@sipsolutions.net,
	ilan.peer@intel.com,
	christopher.a.wills@intel.com,
	slakkavalli@datto.com,
	john@phrozen.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH iw,v2 2/3] iw: fix HE operation on Big Endian platforms
Date: Sat,  5 Apr 2025 20:48:06 +0200
Message-Id: <20250405184807.701728-3-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250405184807.701728-1-olek2@wp.pl>
References: <20250405184807.701728-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 1fb8fe2d7877ab1a9e4aa322aa28f15f
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [wbKh]                               

IE fields are encoded in Little Endian and are not correctly
printed on Big Endian platforms.

Fixes: 422419e06d55 ("scan: Add printing of HE Operation Element")
Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util.c b/util.c
index 6502788..1870393 100644
--- a/util.c
+++ b/util.c
@@ -1755,7 +1755,7 @@ void print_he_operation(const uint8_t *ie, int len)
 {
 	uint8_t oper_parameters[3] = {ie[0], ie[1], ie[2] };
 	uint8_t bss_color = ie[3];
-	uint16_t nss_mcs_set = *(uint16_t*)(&ie[4]);
+	uint16_t nss_mcs_set = le16toh(*(uint16_t *)(&ie[4]));
 	uint8_t vht_oper_present = oper_parameters[1] & 0x40;
 	uint8_t co_hosted_bss_present = oper_parameters[1] & 0x80;
 	uint8_t uhb_operation_info_present = oper_parameters[2] & 0x02;
@@ -1768,7 +1768,7 @@ void print_he_operation(const uint8_t *ie, int len)
 		printf("\t\t\tTWT Required\n");
 
 	printf("\t\t\tTXOP Duration RTS Threshold: %hu\n",
-	       (*(uint16_t*)(oper_parameters)) >> 4 & 0x03ff);
+	       le16toh((*(uint16_t *)(oper_parameters))) >> 4 & 0x03ff);
 	if (oper_parameters[1] & 0x40)
 		printf("\t\t\tVHT Operation Information Present\n");
 
-- 
2.39.5

