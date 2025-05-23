Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A39C2F3E;
	Fri, 23 May 2025 12:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748002192; cv=none; b=ktNQAtb/2bt3/ed72P1eBD1IBJPZ5BI1vOjkNcR/nYarXU8hawNgOkhYabuneu+UM63fyttWQrPLGc2zAfyqw9++ALC3t98MTep5taS/q8jC4OAcw02EUp4c/qbg/3krxJFZ2gPmxLmk0rt8JuxiEJBmcI6nUCszucVYH1PrLlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748002192; c=relaxed/simple;
	bh=R143x4ihsArMXZoVOh0hFOHNpJbJ+i/GsS6QMaUJjWs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pp88nuVhRxlLPJAvMIT6Rd1C5pMEpou62ydIdCeu/VXqmc/ag/4oondQpd8QGCXHfeqd2TmIL7vDQXQWM3+LsVEtirE1FnE3xbdv5TDxiafhQqRlh2ZZRYqmL+xcTzeUeBep4+X8CVZjz1Bx3uAYiBxtY4BBia1FigU2apUPwcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBzOAPT4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBzOAPT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6085C4CEE9;
	Fri, 23 May 2025 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748002192;
	bh=R143x4ihsArMXZoVOh0hFOHNpJbJ+i/GsS6QMaUJjWs=;
	h=From:To:Cc:Subject:Date:From;
	b=uBzOAPT4ZOmpLu/q3LRa9Qn/db2+5XFFP+NDzKVjuOGLBrFcle/YtO/EpfPPZ0i3w
	 UqiOYb5pim8yZR5Q0fVQYB/Zpm73+D/ZXAwZwqxdE4Oyr9l3V4d1zZ5q32Zz/rCMjv
	 8IlQpf5i7MDp07Jj+pwzRMTQbsS+pcnrpisHXKFqrnO9Y7fpqwea/RYhrsh9kQ82r6
	 lxTTjx598Z8MWbokuNQ1vrRm3H3GuaRsr7j1Qlj4hnK6HSbAMWvCYBF5ybJmeOkRla
	 E3EtAKxOBijeHpL8NvMyEPb/CCgz2ABX/uk+S5QC0qs0qy1Ja6Ragiy2NjzPUhsKqj
	 Ac2C7qs67nGVQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Stroud <jonathan.stroud@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jameson Thies <jthies@google.com>,
	Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: misc: onboard_usb_dev: fix build warning for CONFIG_USB_ONBOARD_DEV_USB5744=n
Date: Fri, 23 May 2025 14:09:43 +0200
Message-Id: <20250523120947.2170302-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

When the USB5744 option is disabled, the onboard_usb driver warns about
unused functions:

drivers/usb/misc/onboard_usb_dev.c:358:12: error: 'onboard_dev_5744_i2c_write_byte' defined but not used [-Werror=unused-function]
  358 | static int onboard_dev_5744_i2c_write_byte(struct i2c_client *client, u16 addr, u8 data)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/usb/misc/onboard_usb_dev.c:313:12: error: 'onboard_dev_5744_i2c_read_byte' defined but not used [-Werror=unused-function]
  313 | static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u8 *data)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Extend the #ifdef block a little further to cover all of these functions.
Ideally we'd use use if(IS_ENABLED()) instead, but that doesn't currently
work because the i2c_transfer() and i2c_smbus_write_word_data() function
declarations are hidden  when CONFIG_I2C is disabled.

Fixes: 1143d41922c0 ("usb: misc: onboard_usb_dev: Fix usb5744 initialization sequence")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
It seems that there is another problem in that configuration, that results
in onboard_dev_probe() always returning -EPROBE_DEFER since the client is
never getting looked up. This should probably be addressed in another patch,
after someone has decided what the intended behavior should be.
---
 drivers/usb/misc/onboard_usb_dev.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 1048e3912068..5b481876af1b 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -310,6 +310,7 @@ static void onboard_dev_attach_usb_driver(struct work_struct *work)
 		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
 }
 
+#if IS_ENABLED(CONFIG_USB_ONBOARD_DEV_USB5744)
 static int onboard_dev_5744_i2c_read_byte(struct i2c_client *client, u16 addr, u8 *data)
 {
 	struct i2c_msg msg[2];
@@ -388,7 +389,6 @@ static int onboard_dev_5744_i2c_write_byte(struct i2c_client *client, u16 addr,
 
 static int onboard_dev_5744_i2c_init(struct i2c_client *client)
 {
-#if IS_ENABLED(CONFIG_USB_ONBOARD_DEV_USB5744)
 	struct device *dev = &client->dev;
 	int ret;
 	u8 reg;
@@ -417,10 +417,13 @@ static int onboard_dev_5744_i2c_init(struct i2c_client *client)
 		return dev_err_probe(dev, ret, "USB Attach with SMBus command failed\n");
 
 	return ret;
+}
 #else
+static int onboard_dev_5744_i2c_init(struct i2c_client *client)
+{
 	return -ENODEV;
-#endif
 }
+#endif
 
 static int onboard_dev_probe(struct platform_device *pdev)
 {
-- 
2.39.5

