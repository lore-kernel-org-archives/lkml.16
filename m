Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821F8296712
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007666; cv=none; b=s50zZBEAYL4tO1ymHeJ5uA9C6YGsMNkCP6VOU2Jsb2zfA+f/n00dDZtDmhfk81RGUrIc+2FNgTzvf695nz9N15UsUOz3v/4jTHxXb8SPqF2ALJ1QhHLfI0Sk++neFat/FJKoEjde0jkDjESY3mEC+2eMTrYTqBomSAkpmkEp+mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007666; c=relaxed/simple;
	bh=rKpQ93wGB3N2jcBrTcwJvgpog+JGf2BH59ObvzlpVTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5H+/ZIlkW/MfXzy/EaYFDhIOoEcgeJvDuXuDe4R+/NeV8BGzPAyI581nW5WO0VUfy48MPDta9CYfyITSvRDKfNPbphlGorCc/Mhlj4rjGMbJWorweMn6KCXcdPkZdFwdErab8FLPC9mEAAUDhgf0aIpf1n6/D72qmHIYCMlrpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=riRxBLj9; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="riRxBLj9"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54e816aeca6so12729981e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007663; x=1748612463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ptipst+jgUVMZThwfnH2tLuY1vSwuKeNOIIYU0B7Lc=;
        b=riRxBLj93NWR2TUktrAfB7OMoau5ESJTZTigxcB8cvLQDGqIQNlkM1ju9LK3w1v/82
         N7Q8ExKba1LQnfsgyw1MEg4GjmnsFBoSBd3dMGAQvn1E1W2JsBJyskAEaatUqFamjzXA
         oc7ZWcW7bec+a50NZRfQzUE1LgpNWQm/KWITJw6yArJ0Ecz/4Tv//qtdc+SQ0pmjNUvp
         +DzGInq5GRXlPXFsC0imkNiohSTbIsKMGTH9zURo9SvA5rTU0/rhAxqsuKqq8yVPjt5F
         KEp/5O1szwI7JZiuC5Vfaty6bONyH0UwB/0Ug59m/dNRZo98a8TkRiatHwdvH8ezSAoB
         h7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007663; x=1748612463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ptipst+jgUVMZThwfnH2tLuY1vSwuKeNOIIYU0B7Lc=;
        b=dERG4bEA8jOeR/xbv5hr1lYt2M3UJl0TheZ/NYU/HcEDfIlNO94T5lGt3cNJdTLfnI
         IZfNG1ZgYR8DuOGcznym7Qw1rJlBbao+t7nwuDsojWmHEOIUPQ8wqkrl/1YaCVqdc8tf
         cT514S3cBOlLKtb0IwxDc4CkP1U4MpYVP462GoFwZ9JgXkxECR8vW4YVPtgJ5ZA4bVf2
         v863GI6Cf31Jyo0LPPfTPdDNiTn/SrmlrPrcIyJKBcP/wm6XfYQiVFJBF3PYcXKKOXVe
         vepJo4VN24XRaLBGiwpe+LWttvvjxThjStCAYf+yTlk5gaiv4orWKrZfHepR9ZysOpCt
         Fewg==
X-Forwarded-Encrypted: i=1; AJvYcCUMmw5LaWtslleSiV3drWGNjHOIN+FkmZ2C23gbwvrXSDzS1w6CDWU0pRpR3AGi7/kVT7zGbq7nk+Uiz8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4mf2lv8KeBXQbAizPg/efVZ8Cq7lCbuX1X2Ge90skAqUF4v/E
	XewgZT6uUzKEAlZSMSIDLk8slTnkK6kXS9/p+hHPBT8OLqtWtjZvguRKYpEXAasJL4k=
X-Gm-Gg: ASbGncu0PeOq79IDinE9UoPKajCstOJ3zA/pTTQxAsvV9LI5ocpl+osdcl+bbv3P+SA
	FtgOhIpIwrB5dNJmu+oqrPinDq/3mje/jjdN4d5W5kwG5YVitMieyQX1SrcBKT5L3qGjUVYESwl
	Oym5NCVy8hbbelfVG5nzo/lKAOTlTy4aszvNzbmuaNjGCB328xkt5b8cnAq94hWtQdkrWBw1et+
	M8QqDXgiBvMqmwJ4peUnQn3xx6iwlkT5s91UWpNrQ/2ndfKQeVB0N0VeRHoNvuts9Y7KD7UZA3n
	JCR+DTohttdEdu3eRFqRhxsaC5kzHCFPun8VbRKFYO7pwYSanmfRAMrlLotse5/IIGVNnVupgAd
	h4r1mHF6zGzxflKjb/rmmLiGQrw==
X-Google-Smtp-Source: AGHT+IGfBRDW1UMlFuEvFbwkjGLGnQiQkt71IPhxmMxhJWvlHH9jDUn6RGcLspRvscDDVp9YdgMBPw==
X-Received: by 2002:a05:6512:39c9:b0:549:9143:4e8d with SMTP id 2adb3069b0e04-550e719835cmr10282215e87.8.1748007662658;
        Fri, 23 May 2025 06:41:02 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:01 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/21] driver core: Export get_dev_from_fwnode()
Date: Fri, 23 May 2025 15:40:11 +0200
Message-ID: <20250523134025.75130-15-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It has turned out get_dev_from_fwnode() is useful at a few other places
outside of the driver core, as in gpiolib.c for example. Therefore let's
make it available as a common helper function.

Suggested-by: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/base/core.c    | 8 ++++++--
 include/linux/device.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index d2f9d3a59d6b..51512ab8a6e9 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1881,8 +1881,6 @@ static void fw_devlink_unblock_consumers(struct device *dev)
 	device_links_write_unlock();
 }
 
-#define get_dev_from_fwnode(fwnode)	get_device((fwnode)->dev)
-
 static bool fwnode_init_without_drv(struct fwnode_handle *fwnode)
 {
 	struct device *dev;
@@ -5255,6 +5253,12 @@ void device_set_node(struct device *dev, struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL_GPL(device_set_node);
 
+struct device *get_dev_from_fwnode(struct fwnode_handle *fwnode)
+{
+	return get_device((fwnode)->dev);
+}
+EXPORT_SYMBOL_GPL(get_dev_from_fwnode);
+
 int device_match_name(struct device *dev, const void *name)
 {
 	return sysfs_streq(dev_name(dev), name);
diff --git a/include/linux/device.h b/include/linux/device.h
index 79e49fe494b7..f6ca813eebbe 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1086,6 +1086,7 @@ void device_set_node(struct device *dev, struct fwnode_handle *fwnode);
 int device_add_of_node(struct device *dev, struct device_node *of_node);
 void device_remove_of_node(struct device *dev);
 void device_set_of_node_from_dev(struct device *dev, const struct device *dev2);
+struct device *get_dev_from_fwnode(struct fwnode_handle *fwnode);
 
 static inline struct device_node *dev_of_node(struct device *dev)
 {
-- 
2.43.0

