Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F13290F;
	Sun, 29 Jun 2025 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751191428; cv=none; b=t7sEbUmoTmXQHxXm9TaiXYxRkEYH6ZhuqZLi87xb6ZPNcA6lEU5gi20gNa0TR39y5zQQ37qaPgWFWRCieoVyhLIxDvc8uSmgT6USJS0VhhEUVoVG6r6XCgkBGJ4dHkzIqZfgOvQNBk6Q70Qeqjthqhkx/9tze2nyIF2xp9EBTtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751191428; c=relaxed/simple;
	bh=Kufurcy3kv6d6lbIKqCuZZPoftTwGTTowyf/MgdKHbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TnZ7mIsn1WzSTF9w6oZ16aL4Zhe4H33QYMZBd+Ce2jLVBSSSCEKbgyZ5AWCja0sHnWqgTwJ0oSOOL7pjQX5xsqjzehM2hZmirNrgZQ4DPXhuhJsrzBrSKyraC4MHjMk1wrEMXPCMyAeT+xeOvt00QLGGY1cgkI0LQB3BF3Wo8yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OOC3vpun; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OOC3vpun"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1CFC4CEEF;
	Sun, 29 Jun 2025 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751191427;
	bh=Kufurcy3kv6d6lbIKqCuZZPoftTwGTTowyf/MgdKHbI=;
	h=From:To:Cc:Subject:Date:From;
	b=OOC3vpunncVsCJldtj9dVlq4A/8iGzkZuVtu/S/Fy1hoo8VGwq9Jaa4nYGmt+oXbS
	 r5lfD5tJdMpNb+cwTiXbdz88lquH1ExYl4q2d1iO5AkCeJpY8rPIywRm4/+PwYort7
	 tQFAfUWYAnMiN5dIlpe3F6EF6F5lq8ZPzARXTtjl8V/WpjOWmHZx9LxLdmBAa/JpZ8
	 XzPFloCf2ulul6jwzDsOtmd+w6lLl6+yJOyowG55qI5JsGZNTds5crHc2C7MYKmmjq
	 2ozEjoT7062AX68scgfXXWsvbrRInNJipbIbLxkjDDm8SPdf6M8K7XSAF+iD1gyly+
	 OVvQ6hx76b8Zw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc2: disable platform lowlevel hw resources during shutdown
Date: Sun, 29 Jun 2025 17:46:55 +0800
Message-ID: <20250629094655.747-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some SoC platforms, in shutdown stage, most components' power is cut
off, but there's still power supply to the so called always-on
domain, so if the dwc2's regulator is from the always-on domain, we
need to explicitly disable it to save power.

Disable platform lowlevel hw resources such as phy, clock and
regulators etc. in device shutdown hook to reduce non-necessary power
consumption when the platform enters shutdown stage.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/usb/dwc2/platform.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 12b4dc07d08a..3f83ecc9fc23 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -371,6 +371,9 @@ static void dwc2_driver_shutdown(struct platform_device *dev)
 
 	dwc2_disable_global_interrupts(hsotg);
 	synchronize_irq(hsotg->irq);
+
+	if (hsotg->ll_hw_enabled)
+		dwc2_lowlevel_hw_disable(hsotg);
 }
 
 /**
-- 
2.49.0

