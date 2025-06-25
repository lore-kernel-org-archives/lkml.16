Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B8C26B2D5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864931; cv=none; b=SZngS1ELwQe4SbRo1QbSX4Ov9EaAbj5lvxePFr8az7dYbkuGxSWjmB9UxevwQOX7FMveYsO/fdd3GS/1PGxi26rh2VbG+vEzslxcFFpD38WnT9xDOZZC8DbDA9TbkUaAuTNj1UNWHXtKzn+l1EHKdi+osLWTloC1Qd38+eQsynM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864931; c=relaxed/simple;
	bh=T/WgMs1t2r6GpZznn+R0tQC4GQB69BnKFtR2iVgkMCQ=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=IiZNMjJYWtZ3L2ZxOmVAPRiALMsVx+FJDLu9dGKaWVXfnRTGj81dJn3XyN2hqlOXJDtFKpIBuLD7/q0Ycy2B60uRfmjSACnJ8NyPZYydL/54nBBJ30Jl3O41yC9ennYzqcQffLuvRR/oRPKS9gTF1sy9nvw848y2PUXiYjT0yg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NWtTrG1k; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NWtTrG1k"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-40ab5bd9088so36342b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864929; x=1751469729; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v7oc7DM7sUp9Q2g/4DgfS/ixOMuqC8G8HAAnnDTr+l8=;
        b=NWtTrG1kG1OIjAVGUGyjezZPw/SzftN/pTuyohNdThOkXwWjoqtlxfZeZhaG4iEGYo
         Ff/VjDH1pue4OfewT3cg4PMhwGfJJ4WBo6oKyYrX9D7gxbaUXaBDbVufUuEpXFoKVZxM
         +qlfKUY7ymPNI6ekmnfZkV84ZLd/ZV5NgCIAnXg1cU7q89XzxuH5ptCYjrpuIWyj/NNb
         h2gSX50tAkxlFRx4jnhLglb8Es+/xQBerR9448rqpfrLrzJoxKM0kXwNn1KNwG0VlGgv
         MwKwkKyrND4DolM3yvxuHJWod4MzOlQwQf8ntSm3lralYY7wts18FnQs0W3oPi9kndY+
         XE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864929; x=1751469729;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7oc7DM7sUp9Q2g/4DgfS/ixOMuqC8G8HAAnnDTr+l8=;
        b=AIKGLH1hmK4J/oN6ziUTgH+7n2HdJDTlfocQg8gzPhf0rStieBka/d0BVG2gBv/Og0
         Oa7K9cGuQWP2WJShBzyyd61TNVv/0TnhJRlGj03VYKBaszcowJ0TeqyJ6t6RYO/S8qI8
         wToWnwKJJIeJWbRhVahlSGYWEUNXpJsCTYZ/cL+svcZyB1lHfA/w9hRiTwkH6//Lx+Gz
         VSm9Vh0gUpqBliCo37SxChr8ZTjKD8z1XZd1/pgQsktZ/3noyjrCa1K/JHgkaa0MTYn2
         VC9nO+IVHDubd1KP6bdtb7Pk7nZW6RwZtfNbxHKF8ivUQNlQNjMK/anVZGdF6eJYeGQm
         9RLA==
X-Forwarded-Encrypted: i=1; AJvYcCWFBCoDB9nzpn2kUgRbpE6ehcB322mjMB7mcp2WIFknDlYuyJafpwIkdcOoSd9FmcxA1Im0BVtHiU+UhxU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7mxk1ZidjB02tb0dj4w6bZQ000bW8+cs5XF4dwvBhifiQrl/1
	Ce+VJuB5Ife1H9jjVlTSLcVc6LoYEI1UUm2lwZRqqwTtTOt3k6+49co54fDBkC5wRK4=
X-Gm-Gg: ASbGncvzH4rPrLVxL1y57+QUomLAaqYJhoeEzzgu576iJvEmxJPT4gL/Wano36NtQF+
	5ULVqrLbvdSpkbU0f6g2C+ic5KdX0cP2Ri1rQCqOL3DNWSXo07eiPA8RKN5YD56Cm5R4N43y/lc
	qGfXynzInjVW5ejMfS2aCmydJM9gIbHsh9bPWmJbBDI+ZSXe9Y+aKfse4ad+Tath2mvIYW54bxU
	+cG28oyIc5O9geIqmLtkLIIkWYVxjDaiXJ6e5VNQLbCc5z4o/CJzABTH7t3o7Y8oHYX6fgNSEx+
	gae9QqHqoUclOKyIv/GsdA1RV9htiMP4hYBajdcEAm1nbi/QT3Q0h5PbY6XpyF+iUuZAnQ==
X-Google-Smtp-Source: AGHT+IGcFvEYPWqui0Yt0xXJPtapA6f/IqOEU7Zk6imoU5KH28ETem8+ya9bGVLKj6PAPIC1zVqo4A==
X-Received: by 2002:a05:6808:1789:b0:407:77e9:a104 with SMTP id 5614622812f47-40b05762eb8mr3132816b6e.17.1750864928919;
        Wed, 25 Jun 2025 08:22:08 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 006d021491bc7-6115b6d233bsm1689623eaf.16.2025.06.25.08.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:22:08 -0700 (PDT)
Message-ID: <685c1420.050a0220.ae80e.9bfa@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:22:07 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: iwlwifi: pcie: unlock on error in
 iwl_trans_pcie_gen2_start_fw()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We need to call mutex_unlock(&trans_pcie->mutex) before returning on this
error path.

Fixes: aeee73e27f2d ("wifi: iwlwifi: pcie: move generation specific files to a folder")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c
index 0df8522ca410..8ff23f3931c6 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/gen1_2/trans-gen2.c
@@ -546,8 +546,10 @@ int iwl_trans_pcie_gen2_start_fw(struct iwl_trans *trans,
 	}
 
 	if (WARN_ON(trans->do_top_reset &&
-		    trans->mac_cfg->device_family < IWL_DEVICE_FAMILY_SC))
-		return -EINVAL;
+		    trans->mac_cfg->device_family < IWL_DEVICE_FAMILY_SC)) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* we need to wait later - set state */
 	if (trans->do_top_reset)
-- 
2.47.2

