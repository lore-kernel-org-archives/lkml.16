Received: from forward200a.mail.yandex.net (forward200a.mail.yandex.net [178.154.239.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FE62192FD;
	Thu, 24 Apr 2025 20:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745526865; cv=none; b=iYYbMNIJr2izExcwuy9n3aVnflULO5eG/YvLoHipqNEKiYEBJ7sSbkwPI/vWEPpHWfvxjtYoIndsQsmPybkWGTnFRBPxtwWZp1vn3EBBwPfziPN7buJ5mNLOzPT7c3tWe6oyx8WPuZRwv/cT/+lZpjV5/XDuN+Tj0OLlooV1SA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745526865; c=relaxed/simple;
	bh=CF7B72CNWvn9uRNvK4E3hJtRCBb6MvjEUIynh1IIfkY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZhKdzv8KL7CU4gh4qvK0UHgFg1AH92aPbeMOiog1nnMh+mPh7IfpVgeP0lH+lt1tAfDMR3p49N6TVDFP5XtBydOAprH5EEFwIdOl+jWdJyALVFpcfHMq1j0SkwbVQt8a/bZ95T68qHt9CPuLZw4UJw04eFkDLqFgFh5cq60hm30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=YjbGS8bT; arc=none smtp.client-ip=178.154.239.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="YjbGS8bT"
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d102])
	by forward200a.mail.yandex.net (Yandex) with ESMTPS id B5F0D63DAF;
	Thu, 24 Apr 2025 23:27:07 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:6100:0:640:f888:0])
	by forward102a.mail.yandex.net (Yandex) with ESMTPS id 8DF4D6090C;
	Thu, 24 Apr 2025 23:26:59 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id vQXB983LcuQ0-eiJ29wm4;
	Thu, 24 Apr 2025 23:26:59 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1745526419; bh=T9bgoFd6lDS5NxP2CSs60BY/yjNnHHTwK37jIN4tT2g=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=YjbGS8bTBG0uqxLI0Yrp5FTTLU9YGOw9pvyyqXrzwsZ4RYG8svldQ+lMglK8uRkIQ
	 6hVhbIr1FQsjfH5jvxWM3DdrsCNnSaP9YCtRvmRtXjJBrT9ety/0zoUvcQzPTAYlVL
	 z/SOoYG6RMVxU+PZCCjPHUN8cXf5mSVV8L5aWv6M=
Authentication-Results: mail-nwsmtp-smtp-production-main-68.vla.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
From: Alexei Safin <a.safin@rosa.ru>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Alexei Safin <a.safin@rosa.ru>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] hwmon: (asus-ec-sensors) check sensor index in read_string()
Date: Thu, 24 Apr 2025 23:26:54 +0300
Message-Id: <20250424202654.5902-1-a.safin@rosa.ru>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prevent a potential invalid memory access when the requested sensor
is not found.

find_ec_sensor_index() may return a negative value (e.g. -ENOENT),
but its result was used without checking, which could lead to
undefined behavior when passed to get_sensor_info().

Add a proper check to return -EINVAL if sensor_index is negative.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
Signed-off-by: Alexei Safin <a.safin@rosa.ru>
---
 drivers/hwmon/asus-ec-sensors.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index d893cfd1cb82..769725ea18db 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -839,6 +839,10 @@ static int asus_ec_hwmon_read_string(struct device *dev,
 {
 	struct ec_sensors_data *state = dev_get_drvdata(dev);
 	int sensor_index = find_ec_sensor_index(state, type, channel);
+
+	if (sensor_index < 0)
+		return -EINVAL;
+
 	*str = get_sensor_info(state, sensor_index)->label;
 
 	return 0;
-- 
2.39.5 (Apple Git-154)

