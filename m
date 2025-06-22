Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12751BE5E;
	Sun, 22 Jun 2025 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750579686; cv=none; b=MplDzhyJmBbrTQlgEMg1sWeQ17dFYhOgx4+8c9IR+J4Qi2czTY0t1wUC0CIYQ65Qp6PE8ihUGtcK1IAWvgrm1at0V1kwfsWQu9kcTcOtUogsqh/i5Z0N09/F30El5+/pi8SrnJrm07bFjJLklJfpMKneU8D232HcZOWFgldIvWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750579686; c=relaxed/simple;
	bh=0ZSIhOFvE/g1XPv4/J3ZGcbV4JgvQSmVcC798/FJXjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qvbcThcAaGyHUog9wvPiD9i/RSlDXEL6/UxIF3wrSJ/tBNhHD3ynfUVP9sQMkd00LWR6W4AMJ5QDm8pND5B9E09f/qFfnQdi7Wt2b8xCCv5bkpCcXsBuD/2UXCwQmFwWNgzVIG+nKNj6wTMP6Rj48XSNo144US9LtLJ+aNXxK60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from abreu.speedport.ip (p5dc5536f.dip0.t-ipconnect.de [93.197.83.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3D76A61E647A3;
	Sun, 22 Jun 2025 10:07:29 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-lis3lv02d: Add Latitude 5500
Date: Sun, 22 Jun 2025 10:07:20 +0200
Message-ID: <20250622080721.4661-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add 0x29 as the accelerometer address for the Dell Latitude 5500 to
lis3lv02d_devices[].

The address was verified as below:

    $ cd /sys/bus/pci/drivers/i801_smbus/0000:00:1f.4
    $ ls -d i2c-?
    i2c-2
    $ sudo modprobe i2c-dev
    $ sudo i2cdetect 2
    WARNING! This program can confuse your I2C bus, cause data loss and worse!
    I will probe file /dev/i2c-2.
    I will probe address range 0x08-0x77.
    Continue? [Y/n] Y
         0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
    00:                         08 -- -- -- -- -- -- --
    10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    20: -- -- -- -- -- -- -- -- -- 29 -- -- -- -- -- --
    30: 30 -- -- -- -- 35 UU UU -- -- -- -- -- -- -- --
    40: -- -- -- -- 44 -- -- -- -- -- -- -- -- -- -- --
    50: UU -- 52 -- -- -- -- -- -- -- -- -- -- -- -- --
    60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
    70: -- -- -- -- -- -- -- --
    $ echo lis3lv02d 0x29 | sudo tee /sys/bus/i2c/devices/i2c-2/new_device
    lis3lv02d 0x29
    $ sudo dmesg
    [    0.000000] Linux version 6.12.32-amd64 (debian-kernel@lists.debian.org) (x86_64-linux-gnu-gcc-14 (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44) #1 SMP PREEMPT_DYNAMIC Debian 6.12.32-1 (2025-06-07)
    […]
    [    0.000000] DMI: Dell Inc. Latitude 5500/0M14W7, BIOS 1.38.0 03/06/2025
    […]
    [  609.063488] i2c_dev: i2c /dev entries driver
    [  639.135020] i2c i2c-2: new_device: Instantiated device lis3lv02d at 0x29

Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/platform/x86/dell/dell-lis3lv02d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dell-lis3lv02d.c b/drivers/platform/x86/dell/dell-lis3lv02d.c
index efe26d667973..0791118dd6b7 100644
--- a/drivers/platform/x86/dell/dell-lis3lv02d.c
+++ b/drivers/platform/x86/dell/dell-lis3lv02d.c
@@ -45,6 +45,7 @@ static const struct dmi_system_id lis3lv02d_devices[] __initconst = {
 	 * Additional individual entries were added after verification.
 	 */
 	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5480",      0x29),
+	DELL_LIS3LV02D_DMI_ENTRY("Latitude 5500",      0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6330",     0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Latitude E6430",     0x29),
 	DELL_LIS3LV02D_DMI_ENTRY("Precision 3540",     0x29),
-- 
2.50.0

