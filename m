Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4114D1EE02A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 09:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743499635; cv=none; b=nczqqrmncIScLGrqKebFvKaLUAajcNaMZEj8zd3QYS9cmEqWVzKokHV28Bn3dAW+iznv8QpuZXcqpIm2aWTTCfsyldAyOO9GuXSp/XaFpo58vP6R61ByEjawT4C5GxYZEvm1Dr6othZOKI9I7o9tAuAfDklpDTVmcU5c71O9p0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743499635; c=relaxed/simple;
	bh=cHc8cRI//OpL7HrOGQZOpapIfyn1fJ7Fp5evzrZ0Fa0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=TxppNhgtBsyEdugjVINciVOVJZlD/a2fddF+fgaUPHqP2B85t2UoY9nL74H3kSMf/nZbdDEitKIdJ0tKwMCrEuWRKPNCahcF+ni9GZ1IiR9g9N5YLKr+cw4tfHrqb1kKw8Kwci/6iG0239ehGknHHaMlRk5fxqic3UqiGaCZMWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=f408uEa6; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="f408uEa6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743499615; bh=zhM28tVWB3zXR2MALinPT7qj4zaeGBFg9qNIBSW/QlQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f408uEa68Y0Pbl8jekBG+WKxATFYADQukS1qlSgW46hQO4squwmKG87UQb+OGTMdG
	 O0ndpW4ZkAZPi/i5QPtCjI85/326yAC21lBr1TA72YkwVZIxSjMz5nkVGz5vuQL5/A
	 jVKSTFaYzTaIt3MHR+zKl+2LRMYPvDhA82HhhOEo=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 6B53F051; Tue, 01 Apr 2025 17:26:53 +0800
X-QQ-mid: xmsmtpt1743499613t65g81ywp
Message-ID: <tencent_A06D513AE17E9D4B4AC66E84F447FE730C09@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9Xd9qg9PKd1L7ecbnL0lynqHNnxKuTMmdGAMkkOIYWNLozW797TD
	 ENDQVpt6rsUXT6O1fZ/bK70oUEi/UNeQXLsIEgbQFdhWCB8xkj03YMG5V/HJxwhDZ5wpCcVf8D9K
	 Hqhu+Kf0iXuGCDIe1NfXfl0CKeGuCvuGwHCCQmb1alRiFbq4v09uCXMNw6YNph6+/HjniRZOD3hL
	 yMfDpr+QLrxMy4r7WTxBQoDAplQo/GsY9WmK7fJIwd1F3byop+lP0SdUIEZ/EgySWAXYpQUqO689
	 BaJtgvxc8xLEGy2o9lGA6mBW8ZHylBFFFuISulKZ+GJtDzWzWmZaSXIb3a4ea2oLyTCq5Y3zljwi
	 qfaMF8ke7D49AN9qa49gOhT/1KRQvB/leKgicWtrxiQffR8R+EPRCNdKlc42HtmMxI5ufBt8jQvq
	 8B9CWQeiRTxvFPO269dNSc9PX6f5ROLyxD/uEruA7MsR0AZmM4kUwgy7fj4ZnKY7ZuRE8TsFnwws
	 fUznhoeJD7qrgsu+1+h+mcfOSJAirq58qG/dLzDTjWLmVC9DZ9/PKPbXG/eneJrJO/TmIAYfzlVJ
	 fRYHqqddhLVsB39wG3AeaqwatpWUfFZhETanEwsU1CoBm1Q9zmohqvHFLBZPs+/mXmnsj8Oxxw+Y
	 NvUtUoim4ZkN8CBEUSmb8H/GnB4sunoib7YGEH6ZA5DBiACALtH3g9IFgKf/l6NjmjDcvUhi8ozc
	 rmya8YrZAPs+tBwIDf9hff7+qLB06ndvwsT7TZKrs4QzV2Kgz1CNkAakiEo0PakRjMe8XfRGDo3u
	 D6gN6NijNbEOj6ZyED4mfim4YndopWFdnqBH7+Ks6UrEeb1VYUKlKK1KkBvsJU932aezMKwBEliw
	 Y1wm12IvuhrboPXvSUeIn+6oq2ws0rKRh0+vyN2OIdm9xDwDlS4ZaIgo0C/+ehvExRiIWhLu3wmN
	 NYVjjGRKQn9CS0T/NVQpMeXBr+x4p21osdlTwAY0J2T8xDIPwzJbCr9EbzWtpXr6GgleP2RF8=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Yaxiong Tian <iambestgod@qq.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	chaitanyak@nvidia.com
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yaxiong Tian <tianyaxiong@kylinos.cn>,
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: [PATCH v3 1/3] nvme: Add warning for PST table memory allocation failure in nvme_configure_apst
Date: Tue,  1 Apr 2025 17:26:52 +0800
X-OQ-MSGID: <20250401092652.1557590-1-iambestgod@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com>
References: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yaxiong Tian <tianyaxiong@kylinos.cn>

Currently the function fails silently on PST table memory allocation failure.
Add warning messages to improve error visibility.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
Signed-off-by: Yaxiong Tian <tianyaxiong@kylinos.cn>
---
 drivers/nvme/host/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index c2d89fac86c5..fb0404fee551 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2678,8 +2678,10 @@ static int nvme_configure_apst(struct nvme_ctrl *ctrl)
 	}
 
 	table = kzalloc(sizeof(*table), GFP_KERNEL);
-	if (!table)
+	if (!table) {
+		dev_warn(ctrl->device, "Failed to allocate pst table; not using APST\n");
 		return 0;
+	}
 
 	if (!ctrl->apst_enabled || ctrl->ps_max_latency_us == 0) {
 		/* Turn off APST. */
-- 
2.25.1

