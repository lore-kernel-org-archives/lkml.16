Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BD43B7A8;
	Mon, 14 Apr 2025 04:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744605014; cv=none; b=kY8wW3OzACTNoB156aircIDB0261iNW3pfakVteT0Q4zSplqsmL3aLynomtM5kG/YwBl3V5o8eAHpNsaTqgECwIDlo5uiQ/prc1orGDda0M+7NnfYIcxd7LSH3Mex6ALo9pcWE3miY1U00+Iqclk4+M2lNyMv3FIz6HWWX+2MT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744605014; c=relaxed/simple;
	bh=IXM0hbeDE0VbYeOx251mcveXuoYLdmETuYNSJpgcemw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qCiVSFne/jphOBmhV6uwbT4+VIkDhmFXxOz4JiFim8Y2OelZFfInNrel1x0Eg2Gb4dr+b7U1sY4fdAwT82qaqf4dG9JTeE1vxODAbNLFsSff5ZGwAVnCz1fBfQ/HBhCpUJVRNxU6UZKiJrKyTqNOJioB4+PXPQI7+ziNTOvwbLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Z9aZfWJe; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Z9aZfWJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744604876;
	bh=QG5Xe8E2V3D5JGUHv9q6I5lu2PLz++QnpKlzGLtExec=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Z9aZfWJeFaOFwkDvSaN34cnY6x3iJBEzlli3XEdTvqegRMwEyJ4GaGv1I2dhQln1P
	 AUwq6qoyL463B2q5UDwhJ9OcJuEc66NlPRMFLayhraDas3rvt6+Iq1nZN1epWikX0u
	 2ZWDKVDS/1WonY+MJbbjper05dYEGx2CLEt8Sl7k=
X-QQ-mid: bizesmtpip4t1744604829t1351c7
X-QQ-Originating-IP: 4t0aX8oZyQexKQh1e6cG/Umo00EI/lgEO43f9YF0kDI=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 14 Apr 2025 12:27:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14304016338742517787
EX-QQ-RecipientCnt: 13
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: akpm@linux-foundation.org,
	guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org,
	mingo@kernel.org,
	niecheng1@uniontech.com,
	tglx@linutronix.de,
	zhanjun@uniontech.com,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Stanner <pstanner@redhat.com>,
	SOUND <linux-sound@vger.kernel.org>
Subject: [PATCH v2 5/5] ALSA: korg1212: snd_korg1212_prepare: Rename del_timer in comment
Date: Mon, 14 Apr 2025 12:26:29 +0800
Message-ID: <590769506CF46967+20250414042629.63019-5-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <37A1CE32D2AEA134+20250414042251.61846-1-wangyuli@uniontech.com>
References: <37A1CE32D2AEA134+20250414042251.61846-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: M2ChSj43MDGkt0xM6jnMEL+xucOmmsaCSbZNUTPTCRzwHkApNyYsWpcg
	SXbk469XbAUrUDpm5OZPjWN/6VyWUrTmNhv8Pfl5wZE6jhqnv7wTwe9yfegcv2blV/X+/0q
	lGrgcQyx8t9rt7IHu1Z8Ns22NYQnWQEofxqp/0yPSeUk72msHmjyR4PvyNMUTCZH42986JT
	W+p/OAMX8LBr1/H+PVi+YPWHPUCuAywtf4YjoIykrrTWbzalAvlYiilR7cA1Xbp5j2mFVU0
	jaz5Pmk4pVBlW9OlNfHNp7QaJuF9x8T0vOwxVHZRscrRU16ZrW/NWiOJOrP3Ut8PwO/LmDI
	IKfmuSsQ9KpPkLoP3DSknPRCcaNehvrLL9MObSSY20PnRXym+vUQ9ISWhJ0GHcdC846ZYeB
	R69uoBe8+yNWEXB13yAjnveDUSWuDLvvFMZ8cZkozwcbbF0CW3hvc/TBgrH8QPSHJPPX8bj
	MqdhwxJYtX8qnWV1D2etVLRR7sOCi5VojIh5c55TrL9spxoZ3Uu/OATrrneb1iitil00XPY
	mp9WsDwQUt4z/WbEWZjUdapLVRzjKCH/idnj2mFpZghxLoPmQM8I7h5H3aiPI9twztjYAOh
	5uOSPZrk+IoIKVgxCEsEDu79VgIszKWDlnrBmSuJpVG0/pPqDS6xqxCg1jyAOj5MPFShk3k
	PTtgWZKVmFypBTJ5c7WwMKB5w6+o8ysPuzy4T4YnV5WAGjvVchUDByuf16HbTYsMXy6yksY
	CNIIZAdyD0iLxljchrgUM+c/z9oE7C1wJCNxadiLheFfhoo1smJjZLLF78NskPlPeaHNvcR
	0ukz0BRk+2p3R6OwehlOHPK6PEi9Zq+z6RFLxsQmvYpB3txS+I8XD+evTm2n09ip9o32Y+8
	2fiWoo+cL0CkbjVhhvX+N05KDJemdA8N8rr72gl2XEHmoS3zTZBxu3U13+jlwYwIvqoqAed
	d7PPaScqHMFiJ5dsGfNz+wgdxb1c0691ZrqkiGTQ7ck5r1l2I+jLHNVD6pW8Yc5eU+SmHWE
	wfWIitme+XlK8Tp8qxpdn0k2tvewziY6p4FSaf0ut2q08Y/wDT6zSF2pRPEWc=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

Commit 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")
switched del_timer to timer_delete, but did not modify the comment for
snd_korg1212_prepare(). Now fix it.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Cc: SOUND <linux-sound@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 sound/pci/korg1212/korg1212.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 49b71082c485..5e69bb25d420 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -1553,7 +1553,7 @@ static int snd_korg1212_prepare(struct snd_pcm_substream *substream)
 		return -EAGAIN;
 		/*
 		korg1212->sharedBufferPtr->cardCommand = 0;
-		del_timer(&korg1212->timer);
+		timer_delete(&korg1212->timer);
 		korg1212->stop_pending_cnt = 0;
 		*/
 	}
-- 
2.49.0

