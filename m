Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAD3282F4
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738909512; cv=none; b=TNxsq1qykGY54jvPi+mqDQ0+odvdP6ZnHxZ6CNVN2RC3r9tMGgzY0CmixhK0YZRfrInezX93V1ABEDQKbXWfv6qYcMjlqfNmCsYGRqx/ycQzt207selp/e1K4SN2NdLBeu0V99G+RO97vbY53bDN7aMScF9pTEiP4Xddn/10oy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738909512; c=relaxed/simple;
	bh=T3syE1O2tH2Vw9HuBQ5pQPa71ss68twxacIAl/K+4vE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cWdhGWeciEXa5URQbjr3843NK2b34GriYBMgajsZhDO1wPyshwKOWNikvDxqUgJX3q7OSYXFhe5Q6d4yq88675S7nL00rvb5LynRYlSQP1BTZ08tohPu47XSTwt54BqijHVbAdCcwkWJZX9/X29O1Kn70btNHTWB/yIDciL4dQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPpULExR; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPpULExR"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2163dc5155fso34635055ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 22:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738909510; x=1739514310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMx2ra2tOFUB7h4xNM4Q/KmWMEPeS3JDz1QEiEqKl8U=;
        b=VPpULExRGegzG7idiNig/ddFxI0AOJr7D+tmsU78AcxZ3e3505o6tkFkXWVqw3XOXO
         e8/8dvfaU0lWiZmLYqD6p0DJvBumSkdDQNH2dHpRYbYFBbmk68RSdXjatuHGI25nsop+
         AhGpYQvsp8b8JcSFqFGkMIra7b/FDipSUzqx7CIAJ6WYde498XymzK2RyHUZ9WGtjEye
         RrFS9K/qKVt09raMUFidLmkPTAAcfMFzxQxJzqPX3m+77GJhrYa0YHwpNaNLSi/URxv2
         eqyh9XzXm+l/HhFFY25Gb4FYrX/MNwvhuv6s5Z1yZUsUPXqyGiTB/o718oZ2rBaunKXJ
         o2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738909510; x=1739514310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMx2ra2tOFUB7h4xNM4Q/KmWMEPeS3JDz1QEiEqKl8U=;
        b=vmlPjeCv/e2dc4a6eHc/rqn3cR6U77de4Cpja0cEBBGh+0hJwx28cfRbDBwlikVnmL
         jAg301aVtrUPsPUzGSQFrIAScdZvg81LY05pynQxy+OGHkk3Ac9tS0VgofCxFppJGd7f
         fb/vV1CH0+vN/JMpKkUv+btSYDKm0OjL30mNOC+mRcV2v5mJeU5fZ9PgPvV/kBf/S3QX
         CtIkLoi4aW0/PlI/OsKwtFd2JRMOK9shyFvb79PVbGy6CfnhRLjKahRMlR3FPR5f3Hdn
         5u9TRxAUy5R3Me/gNIsvWXjOf6a/RIwaQll5kdolyVFCRIUlSERhZbh80YIvlnh36bOo
         cdAw==
X-Forwarded-Encrypted: i=1; AJvYcCUMo8DkHuZGWv84Pph+B88KDpU1lXDiXMf94HE0f6+noRdWM9WBvgVlFoxE48lApafOSGl2aDD06MQRSO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF935tJn9r64Z75DO7+UlfvEObJjZpNenb+oMhMn9cpUeyq9XN
	G9X0ZsdaPAEy/9VWEpVkc9G1VAp0+2c8/gT6UUnAEi/aBEK8ibJO
X-Gm-Gg: ASbGncuNsJsEl0z/8+aysN+NLKvYeKSFWeFQPABZLpI+zFOy7T7+WqAjkzNhWmz+qS5
	7uYZGN0SAiAlsYDm6qSNfAu2nk7otfE8J4xupRqAQ62KrlWPaa8T0IMFezufK3fbzG5PL0//GAG
	I8bPMD3S7MfehLjohWsN5V6um4zNbefVEco6LbVlHk25umPt8zhBZzhI2eEEHmC2VVUNTRWTD1j
	9vawwn1kNaV7XW2FnX3sJNBPB5PY40NnZUphLKy6r63EwpbQf54Rx/GkAxVEyMeARF9WJ85Z3ds
	tH1cbw5Zu23/GzimnPEtoCf23BHOhKnJPyA=
X-Google-Smtp-Source: AGHT+IHvIinbFS+Iq6UoWwI5zSifwznlydpeDCSHXdcuUzfBe6I3l5gk+34wnrdBE9YJIN+W9+GzHA==
X-Received: by 2002:a05:6a21:170f:b0:1e0:c56f:7daf with SMTP id adf61e73a8af0-1ee03a21dddmr4361970637.6.1738909508593;
        Thu, 06 Feb 2025 22:25:08 -0800 (PST)
Received: from localhost.localdomain ([114.67.205.189])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af78126sm2324069a12.68.2025.02.06.22.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 22:25:08 -0800 (PST)
From: zihan zhou <15645113830zzh@gmail.com>
To: 15645113830zzh@gmail.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: [PATCH V2 2/2] sched: Reduce the default slice to avoid tasks getting an extra tick
Date: Fri,  7 Feb 2025 14:24:03 +0800
Message-Id: <20250207062402.33725-1-15645113830zzh@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250207060917.30201-1-15645113830zzh@gmail.com>
References: <20250207060917.30201-1-15645113830zzh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

update sysctl_sched_base_slice with debugfs, limit its value and
update normalized_sysctl_sched_base_slice.

Signed-off-by: zihan zhou <15645113830zzh@gmail.com>
---
 kernel/sched/debug.c | 51 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index fd7e85220715..70dda949a69a 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -166,6 +166,55 @@ static const struct file_operations sched_feat_fops = {
 	.release	= single_release,
 };
 
+
+static ssize_t sched_base_slice_write(struct file *filp, const char __user *ubuf,
+				   size_t cnt, loff_t *ppos)
+{
+	char buf[16];
+	unsigned int base_slice;
+
+	if (cnt > 15)
+		cnt = 15;
+
+	if (copy_from_user(&buf, ubuf, cnt))
+		return -EFAULT;
+	buf[cnt] = '\0';
+
+	if (kstrtouint(buf, 10, &base_slice))
+		return -EINVAL;
+
+
+	base_slice = clamp_t(u64, base_slice,
+					NSEC_PER_MSEC/10,   /* HZ=1000 * 10 */
+					NSEC_PER_MSEC*100); /* HZ=100  / 10 */
+
+	sysctl_sched_base_slice = base_slice;
+
+	sched_update_scaling();
+
+	*ppos += cnt;
+	return cnt;
+}
+
+static int sched_base_slice_show(struct seq_file *m, void *v)
+{
+	seq_printf(m, "%d\n", sysctl_sched_base_slice);
+	return 0;
+}
+
+static int sched_base_slice_open(struct inode *inode, struct file *filp)
+{
+	return single_open(filp, sched_base_slice_show, NULL);
+}
+
+static const struct file_operations sched_base_slice_fops = {
+	.open		= sched_base_slice_open,
+	.write		= sched_base_slice_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+
 #ifdef CONFIG_SMP
 
 static ssize_t sched_scaling_write(struct file *filp, const char __user *ubuf,
@@ -505,7 +554,7 @@ static __init int sched_init_debug(void)
 	debugfs_create_file("preempt", 0644, debugfs_sched, NULL, &sched_dynamic_fops);
 #endif
 
-	debugfs_create_u32("base_slice_ns", 0644, debugfs_sched, &sysctl_sched_base_slice);
+	debugfs_create_file("base_slice_ns", 0644, debugfs_sched, NULL, &sched_base_slice_fops);
 
 	debugfs_create_u32("latency_warn_ms", 0644, debugfs_sched, &sysctl_resched_latency_warn_ms);
 	debugfs_create_u32("latency_warn_once", 0644, debugfs_sched, &sysctl_resched_latency_warn_once);
-- 
2.33.0

