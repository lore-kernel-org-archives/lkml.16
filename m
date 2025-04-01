Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB791EFFB2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743509509; cv=none; b=rujS6LKeUyUYp18iYFlQ/mACmT8V5L/BjhZttx6YOuOiLbJxAzYJvUQgjb1sRkscSV/3SLUGCDdoovcdYY2snMkMBVaCvlMZFAlXFt+Ti9qjL7aDyDyqSCoXgmipVpQ2PeYj9buzZIJcsmWIfP2/SM9fyyvhIJbEqhd9KcEsqVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743509509; c=relaxed/simple;
	bh=8qD5qO5+7E8zgiI2yY8R0PZ3fXssoswUz7X9iLaeToQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PpvHe7Ln2VbKA38mGc2MWEbwHElDiqEreH/q2ULfWjaMiSgKH3eIuHSX7FC3nNc3SN68EL49R3GFGFoEQEy/OFTLytH8kTKjOs2SNuF/Ymczg9tVO1p2xHDu2Cf41WnuEQBaqkew+4O8t3hME6Vsp0LjNOFJueS6ioF17SM5MvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TR+z+lH5; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TR+z+lH5"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743509495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9Eag8zpNG7MxnvJb1CH9xtij6aAJ0k6ycnZNJhZrMEk=;
	b=TR+z+lH5gX+s/ffz9qiNvdgBmaNWAoct5wLLA4LDCl22t5CGgci9jyS/gEk6nLde+4tQ4h
	Fl4/+g0ZwBeakpl7o+cZXIO3NsSWVRDwNbcGAD/qUUTEHIEhKmiwSRlnNxN+iDoBwy6kTL
	rhKPIDfnmcS70E6/Uk9IwlTBKkVZ8yg=
From: sunliming@linux.dev
To: miriam.rachel.korenblit@intel.com,
	johannes.berg@intel.com,
	emmanuel.grumbach@intel.com,
	benjamin.berg@intel.com,
	pagadala.yesu.anjaneyulu@intel.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: sunliming <sunliming@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] wifi: iwlwifi: fix uninitialized variable warning
Date: Tue,  1 Apr 2025 20:10:40 +0800
Message-Id: <20250401121040.618791-1-sunliming@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: sunliming <sunliming@kylinos.cn>

Fix below kernel warning:
drivers/net/wireless/intel/iwlwifi/mld/mac80211.c:513:16: warning: variable 'ret'
is uninitialized when used here [-Wuninitialized]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: sunliming <sunliming@kylinos.cn>
---
 drivers/net/wireless/intel/iwlwifi/mld/mac80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c b/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
index 6851064b82da..7146116b067c 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
@@ -475,7 +475,7 @@ static
 int iwl_mld_mac80211_start(struct ieee80211_hw *hw)
 {
 	struct iwl_mld *mld = IWL_MAC80211_GET_MLD(hw);
-	int ret;
+	int ret = 0;
 	bool in_d3 = false;
 
 	lockdep_assert_wiphy(mld->wiphy);
-- 
2.25.1

