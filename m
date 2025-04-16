Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122187482
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761735; cv=none; b=V1BiZ5YTvB1BnNoa5cX9dynIei2mdvrLbhXh5G8a3pl6h5p+a+N44PGJcF5Sur7PRPzpCokZxZJKgaBSccjCOQxL4NXpinHB7H5P0gIVsYMMjJc7lyByGbupjoz29LOt/pJhFTmhR7x87EIEbs69lznlvvqIbi8t1NovkDi3aag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761735; c=relaxed/simple;
	bh=9LdBVOezi3+S4+ZxOQ8+mmTVUoo6eXOCdNB3fmZA2G8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ArPsCF+cLuonJzTxMPFjKSdGRQZ+57xC2Oeah0tC0DRUVrO9MJr8rqdCjCxMuBes8mWhpT+hVyIJjwdCwp4X9y4ntgoT2cBt4gW7BOT5Cjs7/8w5ED8FA7Fg/R9hjsIHLNrkKYpplNQkfn08hFhxpv28DA+JJyi5SmeOX1mtgmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lqr89/Fs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lqr89/Fs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22435603572so58976685ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761733; x=1745366533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETD26CH6iD+0uFy4hgKYmRwgyWbV2LZsUcS2ttgEWQs=;
        b=Lqr89/Fsvp9NHUE4Uw36V/1U0Goynt73cR0htAdOnjj4iRTVvqaQPzMsRPdMYBKeco
         gNmQlEKTvWHbfeGMdTDJLboFW9Cepkzzsm1GVlOCvH9n0s2W2MW2JwTP4c/Z3rL4AuaU
         izMc6BLTeMcGRBpO9dKBFugSD7Sg0oGA40no8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761733; x=1745366533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETD26CH6iD+0uFy4hgKYmRwgyWbV2LZsUcS2ttgEWQs=;
        b=QUGXM7aRbOb1XmZSw4b2IkgDZVQ8RKnbIjfmbzRTQ2KFsBp6f/2XnSnZ4qqCGijmFY
         jJQNPeIzU06aCFmmy72ZGEBHwPjAdsJjxvoWBpAPVKqlSmaZ9eoJdX6IyRnXFD8lZjU0
         3Vqom8+j7NGNpfOrQL2RdsLEOeknFzxtEhCI3ttaN2XWxkDQV5zEK9/krFmG4Y7K41PT
         xLSYnQ4JNvh71i0M66guMUVX/Y2vfvfGRjA3lgJCTGUsfSpDYU+7M8EWAexPRCrS8XtV
         bgjCv23njGAFCGPUNSmJdJakeYAoToHy+4J5bbeYKZg8Ma9rWttPj+gbZYRNP3O2GvPM
         biPA==
X-Gm-Message-State: AOJu0Yy7KzQTdtRjBd913va4YDwA3UnDbd2vk+Ts8D8sabyE0sZkDxo3
	uz4zjM9eaqsko85s1fu9G87ZdaoKXLI/BJ3FeUlRoYBymDOochGhuVrCM0gxKA==
X-Gm-Gg: ASbGnct4bLVTkdyW6lWrI8ISbfxPNNZFGLieC3PbyrbRssMM2GLD6JXXLyUGIx6t2ru
	ySfASgGoOJ4ILxJ+iagUamp9CSF8ZOxBTxuKbt757S7OT3sNSpAt8GF4lGy3lN9zqo2zcFBkqs4
	jfcahxsmid8Ecuxw+Grb6x+Jimk8nrkeYtO00eGgUPrTKQLMy9cqb63ACB/sbNPpCB77631k3QW
	7phpqTl3ujrxbFrTS065veFPsWreMrFxxz3rwjz5IpU8OBvY92royb51/qvTwPGksPKpcCUl3yu
	zEHXepuDzMOiATX32LBQX2TzwMSuFT3mI7mTHjdk5vm01qQV1wqlAjnP6VbdNYxTAw++zxweoTM
	cew==
X-Google-Smtp-Source: AGHT+IGTNhPFIcDKlL3bF0SzfSJ7SIXjnXhh0YeuCFsofT603F8bPtE9D2lDaA650EUHL4OU3b5nnQ==
X-Received: by 2002:a17:903:2a85:b0:220:e63c:5aff with SMTP id d9443c01a7336-22c31ae8e3emr14464865ad.47.1744761733360;
        Tue, 15 Apr 2025 17:02:13 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22c33fc47e0sm1235925ad.167.2025.04.15.17.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:13 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 1/7] platform/chrome: cros_ec_typec: No pending status means attention
Date: Tue, 15 Apr 2025 17:02:01 -0700
Message-ID: <20250416000208.3568635-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If we aren't expecting a status update when
cros_typec_displayport_status_update() is called then we're handling an
attention message, like HPD high/low or IRQ. Call
typec_altmode_attention() in this case so that HPD signaling works in
the DP altmode driver.

Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_typec_altmode.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 557340b53af0..c2d9c548b5e8 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -280,11 +280,8 @@ int cros_typec_displayport_status_update(struct typec_altmode *altmode,
 		typec_altmode_get_drvdata(altmode);
 	struct cros_typec_altmode_data *adata = &dp_data->adata;
 
-	if (!dp_data->pending_status_update) {
-		dev_dbg(&altmode->dev,
-			"Got DPStatus without a pending request\n");
-		return 0;
-	}
+	if (!dp_data->pending_status_update)
+		return typec_altmode_attention(altmode, data->status);
 
 	if (dp_data->configured && dp_data->data.conf != data->conf)
 		dev_dbg(&altmode->dev,
-- 
https://chromeos.dev

