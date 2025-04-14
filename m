Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D72BEC26
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634570; cv=none; b=AqEzfotWvQTxBBIxBbfTrX7D+8lWLr0ZHtKsROBSLurIxd33L2KShvRERvMNhASo2qPCF8CyaMcFieg2F567zWjFcLsSgblVAV/dbkKyWsWpjNT7nqORReyU/ojl5vQhM2L/rpWnfh7oC5uF1ssdAoKuKJHFiE6QQX/+VGhcZOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634570; c=relaxed/simple;
	bh=KvSjMUGPYaqnIntw3wU5bGMjVjj18qPkU+mxT6SOfe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRPMtcG5MrO83As7bTOjYlswa74wuXOi7WXDRsJ5T4430CZKv83KAepZuQXnfm+cIbV5NcYbzMs9goqiUhqolBGbJEC1ygC6NA7b9PMjff2j8ces7ywRdHnGn5AdR/c8bkOItswDp/wJh1S85y765CoKrUdoDJawG7mkLSPQnMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9PxZeac; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9PxZeac"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46717C4CEE2;
	Mon, 14 Apr 2025 12:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744634570;
	bh=KvSjMUGPYaqnIntw3wU5bGMjVjj18qPkU+mxT6SOfe8=;
	h=From:To:Cc:Subject:Date:From;
	b=a9PxZeac5+4p4kEv5bE6vICAYRiMXUQ4Y1uF1ReST/BsI6kIJN3yKH9xEK2zf9cL/
	 3ahsV4jSINawqKAbmDSbyY0lKW7B1UiSkG04M/DyjBUbvpjBcsS7M99QjllGUXAcer
	 63IelloPZaK5nUeeLCHqrdD5ojcE/p7bs7LtJlxIMoUhsfSj6ABysvCFcvJNeFDxy+
	 7qI8K+gkFqU/I9sQrspJix7dTYwETSIk+tJP/xp62iqGLTESKspr8te9y7bpCdlx6O
	 9pd78zTGqkh/nDTsmrRHBYTJOKpAWHIeaVTgusr63sEgQ00hSKgpvCBWC6kuD6aIKP
	 MLOw4Xgm90n/Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u4J9C-000000007xj-0N88;
	Mon, 14 Apr 2025 14:42:46 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Peter Rosin <peda@axentia.se>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] mux: suppress lookup errors for mux controls
Date: Mon, 14 Apr 2025 14:42:20 +0200
Message-ID: <20250414124220.30578-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit eec611d26f84 ("ASoC: codecs: wcd938x: add mux control
support for hp audio mux") we have drivers looking up mux controls that
are optional. This results in errors incorrectly being logged on
machines like the Lenovo ThinkPad X13s where the mux is missing:

    wcd938x_codec audio-codec: /audio-codec: failed to get mux-control (0)

Suppress the error message when lookup of mux controls fails and make
sure to return -ENOENT consistently also when looking up controls by
name so that consumer drivers can easily determine how to proceed.

Note that most current consumers already log mux lookup failures
themselves.

Fixes: eec611d26f84 ("ASoC: codecs: wcd938x: add mux control support for hp audio mux")
Link: https://lore.kernel.org/lkml/Z-z_ZAyVBK5ui50k@hovoldconsulting.com/
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mux/core.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 02be4ba37257..b95bc03e3d6b 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -544,8 +544,13 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 			index = of_property_match_string(np, "mux-control-names",
 							 mux_name);
 		if (index < 0) {
-			dev_err(dev, "mux controller '%s' not found\n",
-				mux_name);
+			if (!state && index == -EINVAL)
+				index = -ENOENT;
+
+			if (index != -ENOENT) {
+				dev_err(dev, "mux controller '%s' not found\n",
+					mux_name);
+			}
 			return ERR_PTR(index);
 		}
 	}
@@ -559,8 +564,11 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 						 "mux-controls", "#mux-control-cells",
 						 index, &args);
 	if (ret) {
-		dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
-			np, state ? "state" : "control", mux_name ?: "", index);
+		if (state || ret != -ENOENT) {
+			dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
+				np, state ? "state" : "control",
+				mux_name ?: "", index);
+		}
 		return ERR_PTR(ret);
 	}
 
-- 
2.49.0

