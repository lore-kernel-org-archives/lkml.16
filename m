Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDDA3085BD
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317529; cv=none; b=Wapw3MHTxLQazdL3BX3kTkU3zznvoZ/DD7vtF2Xr+xz+t9dF+FDpgwxuWJ4ux/SC5mLGhKLlgU51jGEzHBGWKB9WDouG7yQKo7YtAX4ljKVO26BccZ9kK+B3RWL84ZPB1/kHLn4MB8Hrjv8ggJFW2An+TG3r1BreDkyJyZUJWLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317529; c=relaxed/simple;
	bh=mGfdFbhfI+Pnn4crkrnlT+qDY+DyTPa3VFRA2Zf2mvc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=owD+SJQ0qWX3R8xZ0u1XFiI9vVQTNg6s1T+zTEKj0iqle5z0JzZuWRnFfX9LEudY/2QZEDuLxFoqpf+LhXe9VRcm4Qt5m8OJ9riSSZ9D21pUWJ2eEUOwrzwvENHv3a5FA03mFu5SzjvjOEFOLuWWop37quhmrKEU0Wcz1TK/kaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HtxkfpH8; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HtxkfpH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ge
	3/1dKmjOlli2sCo/IoWSdyQdAy14557ORsoDHz+LE=; b=HtxkfpH8k1iIB82ztg
	tNvThswZWG27I8lbt9xo2KM6s1z1X5e4wBqtIAvJR7KDQ0z5Y9WbvAYeb8+E5joh
	jDvdlCvDyO8x8uzq5PyL3MOwwNVu080jLwkWZ/s/kboy9LmoOM3dMMQ6UKFCHcwl
	YizXFvdqfmAmslfn4H0n51WZE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDHUY2buVNow9j6AA--.3773S2;
	Thu, 19 Jun 2025 15:17:48 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH v2] ALSA: hda/realtek: Fixup ft alc257 rename alc3328
Date: Thu, 19 Jun 2025 15:17:45 +0800
Message-Id: <20250619071745.149299-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDHUY2buVNow9j6AA--.3773S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur1UuF1rZr48Zry5AF4ruFg_yoWxtwc_Cr
	Z5Xr48uayUJ3Wq9rnxAF9YyrW8t39xXayagFyxtF45Xay3Ga4rZFW8JFn0yFyxK3yfWFyx
	JrWqgw4YgryjkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUUj-ntUUUUU==
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/1tbiMBVxT2hTs0e1KgAAsL

Audio ALC3328 recognized as ALC257, updated PCI ID0x10EC12F0 to rename it to 3328

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cd0d7ba7320e..2a08115d8c17 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -1088,6 +1088,7 @@ static const struct alc_codec_rename_pci_table rename_pci_tbl[] = {
 	{ 0x10ec0668, 0x103c, 0, "ALC3662" },
 	{ 0x10ec0283, 0x17aa, 0, "ALC3239" },
 	{ 0x10ec0292, 0x17aa, 0, "ALC3232" },
+	{ 0x10ec0257, 0x12f0, 0, "ALC3328" },
 	{ } /* terminator */
 };
 
-- 
2.25.1

