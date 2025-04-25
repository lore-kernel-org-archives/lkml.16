Received: from forward201a.mail.yandex.net (forward201a.mail.yandex.net [178.154.239.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BD921B910;
	Fri, 25 Apr 2025 20:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745611613; cv=none; b=d6pPP7XWUNAwxZ0CX71CohrtBtzySxq8xOgsHSkzWcbzPSd0d9cjtRCFXSog9mDZV3gzZTS905OING7htji1XHyO1U31KYG+C4dGd4/lhqGkPavaXEgJHc6RoP1opXKk3nw8z0/RQq96zynmCAr8cPus/3Z6EVbfQ1mKqm1TwJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745611613; c=relaxed/simple;
	bh=k/zP33OjbSmeuXYLwPcWfcL/pxTHOmfYtJxHon6HXVM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eq1EBM4ZvjvyinbXjlvu738lBK02zcF0y0JzuBaQ8LIAJShboJ5rDo7pNHfHnvWHF129EAaOUTrSHDUQwsJCmVxUzax87+60dLObecAHuaGTD2yrM6BBxpnO1X+86w7jjotmcGJD7aF8YIGxSIjfWmQE/bvczsJo0ylQIyZKFW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru; spf=pass smtp.mailfrom=rosa.ru; dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b=bqEkieYt; arc=none smtp.client-ip=178.154.239.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosa.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosa.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rosa.ru header.i=@rosa.ru header.b="bqEkieYt"
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
	by forward201a.mail.yandex.net (Yandex) with ESMTPS id 4ADDC64420;
	Fri, 25 Apr 2025 23:01:03 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:623d:0:640:ecee:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id 57714470D7;
	Fri, 25 Apr 2025 23:00:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id s0YsVLCLh8c0-wB4UUojE;
	Fri, 25 Apr 2025 23:00:54 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosa.ru; s=mail;
	t=1745611254; bh=1icPC1dV+orrOweNu0r0k0DOqWLOZGhjxwAB5E3wruM=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=bqEkieYt/zZUuEb5ku/DbLQIZdrgjXxYGVOdguHUmGa51VZPw7RqbbWW7dQleg0uw
	 0b0/KorIcjBWKQhGNR/B0x41Izqyq4cBBSeV85YZiUN7eiyBQMOpm31QtytJpKc0rX
	 wZoCL6ExfeRK6+zO/kGCBwL/cGDvAb5H3E6KLj1E=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net; dkim=pass header.i=@rosa.ru
From: Alexei Safin <a.safin@rosa.ru>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Alexei Safin <a.safin@rosa.ru>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v2] hwmon: (asus-ec-sensors) add WARN_ONCE() on invalid sensor index
Date: Fri, 25 Apr 2025 23:00:51 +0300
Message-Id: <20250425200051.2410-1-a.safin@rosa.ru>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prevent undefined behavior by adding WARN_ONCE() when find_ec_sensor_index()
returns a negative value.

Even though unsupported attributes are filtered out by asus_ec_hwmon_is_visible(),
a programming error could still cause an invalid sensor access.

Instead of silently returning an error, log a warning to highlight the problem,
and propagate the original error code.

Update both asus_ec_hwmon_read() and asus_ec_hwmon_read_string() accordingly.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
Signed-off-by: Alexei Safin <a.safin@rosa.ru>
---
v2: Use WARN_ONCE() instead of returning -EINVAL, and update
    both asus_ec_hwmon_read() and asus_ec_hwmon_read_string()
    as suggested by Eugene Shalygin.
    
 drivers/hwmon/asus-ec-sensors.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index d893cfd1cb82..a563d7acef2e 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -820,9 +820,8 @@ static int asus_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 	struct ec_sensors_data *state = dev_get_drvdata(dev);
 	int sidx = find_ec_sensor_index(state, type, channel);
 
-	if (sidx < 0) {
+	if (WARN_ONCE(sidx < 0, "asus-ec-sensors: sensor not found\n"))
 		return sidx;
-	}
 
 	ret = get_cached_value_or_update(dev, sidx, state, &value);
 	if (!ret) {
@@ -839,6 +838,10 @@ static int asus_ec_hwmon_read_string(struct device *dev,
 {
 	struct ec_sensors_data *state = dev_get_drvdata(dev);
 	int sensor_index = find_ec_sensor_index(state, type, channel);
+
+	if (WARN_ONCE(sensor_index < 0, "asus-ec-sensors: sensor not found\n"))
+		return sensor_index;
+
 	*str = get_sensor_info(state, sensor_index)->label;
 
 	return 0;
-- 
2.39.5 (Apple Git-154)

