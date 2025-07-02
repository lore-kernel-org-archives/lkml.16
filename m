Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B09C1E5B72;
	Wed,  2 Jul 2025 21:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751491668; cv=none; b=rotqj9JcNzv5Wf8CGK2b85sv0CL5Lk5UCzw6+V4W5YMWdI9pk8sgcMYiRSWpjMpdUjLEfYah6e5UelTwaPKfPVgu8Dn77ofocTuCZrz5Oa8O9FzBncvU8sRT0Jb6T/k9K5yop6A9mHzNPBgTV0PqHiCVRSsgAsrjSu2xRYW3Ips=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751491668; c=relaxed/simple;
	bh=iA9HKAW6eARRYB3q0MDI1G6/5EbwkMD7WvQRSm4yEJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Sx6Qq32FOTaIEUQOrubyfpoeZQc7l+9FPsNlDvTB1FHewM5DXPd0457L/ntSH5imNeh+rQZdO8inzx6gNsEU6tCLhHPtTI2RRyZwrwPD6LOQUtbDG8WAg/84YU8IE+IyJuomuTSkXxbP3sL/JTxde3SKBjAPz/FGmsb70ILW0do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nc6kcLjp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nc6kcLjp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 483A5C4CEE7;
	Wed,  2 Jul 2025 21:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751491667;
	bh=iA9HKAW6eARRYB3q0MDI1G6/5EbwkMD7WvQRSm4yEJE=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nc6kcLjpbodFAQiixVQriBdF5ZPEyaBHF4bOITIppNtpa90llDlsgY4mPJ+DNqQ3T
	 TLIsiCUQv1zgq+TL0Q2VOthqu3TRHK3KUCVsjgoAY39LrkuDl0YAonaTFaQkJAEXXH
	 EHNg2MjBNxIt7C+pMctOWmPgJBaZ58ck5en1tLiZtgaNL/v8zJbrj0Aob6wA7bw+Mw
	 DoJFXy/LwTOGQpRSmPlH/LFc3DMZlCYDSg5UoifiR3+IqwhGZVauQBiWabgv+UuSWU
	 TM56vddEB7QOiypwS1QTVaWLsVoksEiPGoQG01tb0PqA4RnuahFXPHdR7qLvFeiwYX
	 L7sEHh1UTCETA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F279C83F03;
	Wed,  2 Jul 2025 21:27:47 +0000 (UTC)
From: Manas Gupta via B4 Relay <devnull+manas18244.iiitd.ac.in@kernel.org>
Date: Thu, 03 Jul 2025 02:57:40 +0530
Subject: [PATCH] usbmon: Fix out-of-bounds read in mon_copy_to_buff
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-fix-oob-mon_copy_to_buff-v1-1-1aa7f5723d91@iiitd.ac.in>
X-B4-Tracking: v=1; b=H4sIAEukZWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNj3bTMCt38/CTd3Py8+OT8gsr4kvz4pNK0NF3z5LRUI7NUC0PLJEs
 loPaColSgWrDR0bG1tQBD3PoGagAAAA==
X-Change-ID: 20250703-fix-oob-mon_copy_to_buff-7cfe26e819b9
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Pete Zaitcev <zaitcev@redhat.com>, Paolo Abeni <paolo.abeni@email.it>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@suse.de>, 
 syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com, 
 Manas Gupta <manas18244@iiitd.ac.in>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751491666; l=1520;
 i=manas18244@iiitd.ac.in; s=20240813; h=from:subject:message-id;
 bh=7E8Us5M4J+FLzJSTXxCkqDU9TPMaxmpKlw0J3ayG1Dg=;
 b=56jVWByL3/RS/eEhTGBn6CQcbqSSpx7ZGDu4GdK9FGAuFnJMvbdffc5XvB9Z6ZyV4IiTrvse2
 YhQFtRIpM1PB4fWsF6eSBpp30yw/pSVa0JpcXqGsiT44ynKEkUhr0Am
X-Developer-Key: i=manas18244@iiitd.ac.in; a=ed25519;
 pk=pXNEDKd3qTkQe9vsJtBGT9hrfOR7Dph1rfX5ig2AAoM=
X-Endpoint-Received: by B4 Relay for manas18244@iiitd.ac.in/20240813 with
 auth_id=196
X-Original-From: Manas Gupta <manas18244@iiitd.ac.in>
Reply-To: manas18244@iiitd.ac.in

From: Manas Gupta <manas18244@iiitd.ac.in>

memcpy tries to copy buffer 'from' when it is empty. This leads to
out-of-bounds crash.

This checks if the buffer is already empty and throws an appropriate
error message before bailing out.

Fixes: 6f23ee1fefdc1 ("USB: add binary API to usbmon")
Reported-by: syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=86b6d7c8bcc66747c505
Signed-off-by: Manas Gupta <manas18244@iiitd.ac.in>
---
I have used printk(KERN_ERR ... to keep things consistent in usbmon.
dev_err and pr_err are not used anywhere else in usbmon.
---
 drivers/usb/mon/mon_bin.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
index c93b43f5bc4614ad75568b601c47a1ae51f01fa5..bd945052f6fb821ba814fab96eba5a82e5d161e2 100644
--- a/drivers/usb/mon/mon_bin.c
+++ b/drivers/usb/mon/mon_bin.c
@@ -249,6 +249,11 @@ static unsigned int mon_copy_to_buff(const struct mon_reader_bin *this,
 		 * Copy data and advance pointers.
 		 */
 		buf = this->b_vec[off / CHUNK_SIZE].ptr + off % CHUNK_SIZE;
+		if (!strlen(from)) {
+			printk(KERN_ERR TAG
+			       ": src buffer is empty, cannot copy from it\n");
+			return -ENOMEM;
+		}
 		memcpy(buf, from, step_len);
 		if ((off += step_len) >= this->b_size) off = 0;
 		from += step_len;

---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250703-fix-oob-mon_copy_to_buff-7cfe26e819b9

Best regards,
-- 
Manas Gupta <manas18244@iiitd.ac.in>


