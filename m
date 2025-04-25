Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799F2170A11;
	Fri, 25 Apr 2025 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595922; cv=none; b=up/A9MnFWj8pM80Xom5MVmK4e8vJ+AIxOo5DK3IO3BQ8qZYpkZuKvIa9xAKIZS9fDtT6+EfjMS/S+kIs0TaS94bhVCgHqxbpxqJJqdcLLk/2eHAOTqcRkDErzjD/KrRH/EvhrcveJW+mvyEjcgoJ/kl6HiiMAo2kdtLy/2zIeN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595922; c=relaxed/simple;
	bh=Wh343qabmZNkH33FXnPp45fGDKjEbD5+Q40XZxoda3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GErllt4e2rxiIenbxKfIB6hbOk2LOCozQ+EEScG9doOthxgOOOA4xeNJNGj25sAwQup1ZoZ61PENGBf0HzP4DnJOj+bWEBZbAocs6prr69Eb/yPN5O1rKPVpc2kjQ9fsNgvl0RZyukHM5l9SHPFWCJP/MUbnIrYYLWlrDoviitY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QBKxAx7j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QBKxAx7j"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F087C4CEE8;
	Fri, 25 Apr 2025 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745595922;
	bh=Wh343qabmZNkH33FXnPp45fGDKjEbD5+Q40XZxoda3w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QBKxAx7j60ijQ/kFlioWJhgeaxX/GWtPIAPBdcvawgoPafCdtCAgRpkdm8xPn1nYN
	 D6kzf3unpHIpA+hzHV8qVdPNslpElGYhPkoyN5pdEz6Wgc5JH3/GO9xE7GVEv9d/uZ
	 XxcW+EssimsgVX2Kuu+N9HDhGQaHXFIk2/m60GkPPdCMwDDQLjHvGC7pkuKmfwZON4
	 5S/SYa1ZSuzQIYZITMTbdWXtKYy8LjziCO4YPaAhZcRL9u2tssqDDW9PZgRwNg5Pdi
	 zXrzmtwP8s69+TKY7qxkJ7ADd9NXKpSMZpm5yf5YjN106YCCFXx9OiV6y/AItrq42P
	 TEKlHvqFpCxTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00729C369D8;
	Fri, 25 Apr 2025 15:45:22 +0000 (UTC)
From: Kurt Borja via B4 Relay <devnull+kuurtb.gmail.com@kernel.org>
Date: Fri, 25 Apr 2025 12:45:07 -0300
Subject: [PATCH 2/2] platform/x86: alienware-wmi-wmax: Fix
 awcc_hwmon_fans_init() label logic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-temp-id-fix-v1-2-372d71f732bf@gmail.com>
References: <20250425-temp-id-fix-v1-0-372d71f732bf@gmail.com>
In-Reply-To: <20250425-temp-id-fix-v1-0-372d71f732bf@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2435; i=kuurtb@gmail.com;
 h=from:subject:message-id;
 bh=hl7NOezBX65uzKnMSgj3738hCgwWWjttXsdb5CJ1YU4=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBnc6wRc2D68PZlfxXZuvmjk/DnC3xlunnWc5PU6ddHEz
 u4Dr++xdpSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBEHDwYGZq4Wc2SFLNXfNll
 FzrfOHLaf9PlJ7enx5891/xnoZ1d8kOG//kPMh9e/7G7iPnXzKV8flZlGscWupsqGa/KXqfGPbu
 zmBEA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A
X-Endpoint-Received: by B4 Relay for kuurtb@gmail.com/default with
 auth_id=387
X-Original-From: Kurt Borja <kuurtb@gmail.com>
Reply-To: kuurtb@gmail.com

From: Kurt Borja <kuurtb@gmail.com>

To avoid passing an uninitialized `temp_id` to awcc_get_fan_label(),
pass the `fan_temps` bitmap instead, to work only on set bits.

Additionally, awcc_get_fan_label() leaves `dev` unused, so remove it
from it's signature and it does not fail, so remove error handling.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202504250521.HEkFK1Jy-lkp@intel.com/
Fixes: d69990783495 ("platform/x86: alienware-wmi-wmax: Add HWMON support")
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 27e5b0b23c27356cd5d72dbc5d3b5b4bdb03e8af..f3ad47c9edfac47fae181046acae2190e388306c 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -958,15 +958,19 @@ static int awcc_hwmon_temps_init(struct wmi_device *wdev)
 	return 0;
 }
 
-static char *awcc_get_fan_label(struct device *dev, u32 temp_count, u8 temp_id)
+static char *awcc_get_fan_label(unsigned long *fan_temps)
 {
+	unsigned int temp_count = bitmap_weight(fan_temps, AWCC_ID_BITMAP_SIZE);
 	char *label;
+	u8 temp_id;
 
 	switch (temp_count) {
 	case 0:
 		label = "Independent Fan";
 		break;
 	case 1:
+		temp_id = find_first_bit(fan_temps, AWCC_ID_BITMAP_SIZE);
+
 		switch (temp_id) {
 		case AWCC_TEMP_SENSOR_CPU:
 			label = "Processor Fan";
@@ -996,7 +1000,6 @@ static int awcc_hwmon_fans_init(struct wmi_device *wdev)
 	u32 min_rpm, max_rpm, temp_count, temp_id;
 	struct awcc_fan_data *fan_data;
 	unsigned int i, j;
-	char *label;
 	int ret;
 	u8 id;
 
@@ -1039,14 +1042,10 @@ static int awcc_hwmon_fans_init(struct wmi_device *wdev)
 			__set_bit(temp_id, fan_temps);
 		}
 
-		label = awcc_get_fan_label(&wdev->dev, temp_count, temp_id);
-		if (!label)
-			return -ENOMEM;
-
 		fan_data->id = id;
 		fan_data->min_rpm = min_rpm;
 		fan_data->max_rpm = max_rpm;
-		fan_data->label = label;
+		fan_data->label = awcc_get_fan_label(fan_temps);
 		bitmap_gather(gather, fan_temps, priv->temp_sensors, AWCC_ID_BITMAP_SIZE);
 		bitmap_copy(&fan_data->auto_channels_temp, gather, BITS_PER_LONG);
 		priv->fan_data[i] = fan_data;

-- 
2.49.0


