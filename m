Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C490C19F40A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744766779; cv=none; b=PMFPdTIEt0Xzz+pqAro5UtX05IabeM/gNkuq2teoWnaVA/8oJ+qJIvQidOSkbKA4mMs+jm99DnLYsIEdxHISMaYjYncl8UXK6B+0D1Ev5GMw6oiXcXptYOoRvC2Pc2egCvcD76VF0bMmvqEg1fVDC5N3MTnE7LHuTIq3Q1ppkxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744766779; c=relaxed/simple;
	bh=CjEssOQtrqoZAS4iZ9mhfuJMxxXSyP8p/PrrzFxcy/A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ciKCEojlsm64tca+2KXWtg5Don9tUfDo31lYlJeC2XaPmMlILoDbV1QiNO5cUlzjjbni3oxJfq60FHf9MPuBkj3H+urIQLCW0AiRJfXlYrxSsd2E7+AH72KnFurNr/th2mYytePgujht2RKVixpruO8ds/ef16plDPF4yMA6jHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zcjyl5rWHz4f3jjr
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:25:51 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 250271A15D5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:26:10 +0800 (CST)
Received: from huaweicloud.com (unknown [10.67.174.193])
	by APP4 (Coremail) with SMTP id gCh0CgAHa18wB_9ndlJxJg--.51759S4;
	Wed, 16 Apr 2025 09:26:09 +0800 (CST)
From: Luo Gengkun <luogengkun@huaweicloud.com>
To: akpm@linux-foundation.org
Cc: joel.granados@kernel.org,
	song@kernel.org,
	dianders@chromium.org,
	tglx@linutronix.de,
	linux-kernel@vger.kernel.org,
	luogengkun@huaweicloud.com
Subject: [PATCH] watchdog: Fix watchdog may detect false positive of softlockup
Date: Wed, 16 Apr 2025 01:39:22 +0000
Message-Id: <20250416013922.2905051-1-luogengkun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAHa18wB_9ndlJxJg--.51759S4
X-Coremail-Antispam: 1UD129KBjvJXoWxGF4UXw15Ar47tw1UJw47urg_yoW5GFWxpa
	yjvFyYyr4Utr4kX3y3J3ZFqF18Ga48XrW5XFnrWw1rKFn8Kr1rtryfCF1fK3yqvFZxXr1j
	qF4YqrZ7JayUKF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbSfO7UUUU
	U==
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/

The watchdog may dectect false positive of softlockup because of stop
softlockup after update watchdog_thresh. The problem can be described as
follow:

 # We asuume previous watchdog_thresh is 60, so the timer is coming every
 # 24s.
echo 10 > /proc/sys/kernel/watchdog_thresh (User space)
|
+------>+ update watchdog_thresh (We are in kernel now)
	|
	|
	+------>+ watchdog hrtimer (irq context: detect softlockup)
		|
		|
	+-------+
	|
	|
	+ softlockup_stop_all

As showed above, there is a window between update watchdog_thresh and
softlockup_stop_all. During this window, if a timer is coming, a false
positive of softlockup will happen. To fix this problem, use a shadow
variable to store the new value and write back to watchdog_thresh after
softlockup_stop_all.

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 kernel/watchdog.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 9fa2af9dbf2c..80e5a77e92fd 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -47,6 +47,7 @@ int __read_mostly watchdog_user_enabled = 1;
 static int __read_mostly watchdog_hardlockup_user_enabled = WATCHDOG_HARDLOCKUP_DEFAULT;
 static int __read_mostly watchdog_softlockup_user_enabled = 1;
 int __read_mostly watchdog_thresh = 10;
+static int __read_mostly watchdog_thresh_shadow;
 static int __read_mostly watchdog_hardlockup_available;
 
 struct cpumask watchdog_cpumask __read_mostly;
@@ -876,6 +877,7 @@ static void __lockup_detector_reconfigure(void)
 	watchdog_hardlockup_stop();
 
 	softlockup_stop_all();
+	watchdog_thresh = READ_ONCE(watchdog_thresh_shadow);
 	set_sample_period();
 	lockup_detector_update_enable();
 	if (watchdog_enabled && watchdog_thresh)
@@ -1035,10 +1037,12 @@ static int proc_watchdog_thresh(const struct ctl_table *table, int write,
 
 	mutex_lock(&watchdog_mutex);
 
-	old = READ_ONCE(watchdog_thresh);
+	watchdog_thresh_shadow = READ_ONCE(watchdog_thresh);
+
+	old = watchdog_thresh_shadow;
 	err = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
 
-	if (!err && write && old != READ_ONCE(watchdog_thresh))
+	if (!err && write && old != READ_ONCE(watchdog_thresh_shadow))
 		proc_watchdog_update();
 
 	mutex_unlock(&watchdog_mutex);
@@ -1080,7 +1084,7 @@ static const struct ctl_table watchdog_sysctls[] = {
 	},
 	{
 		.procname	= "watchdog_thresh",
-		.data		= &watchdog_thresh,
+		.data		= &watchdog_thresh_shadow,
 		.maxlen		= sizeof(int),
 		.mode		= 0644,
 		.proc_handler	= proc_watchdog_thresh,
-- 
2.34.1

