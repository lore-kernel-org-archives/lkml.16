Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C1D221D86
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750301535; cv=none; b=nGX0hVGEx4pWgfQ6p//lpVBX745bWNPC7fDEo81mbC5wx279LpbNeQ7UpdSIi1wJQxcwrxGZlvrhPVDkE70+WScPuuKbYPudFoGs6ATDscnv4vpK/PuxkblzJyb40Anr1kfCUBJ3xNCOLaldKxzQ1cXYxNsVBGI2C1hUkqNwWo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750301535; c=relaxed/simple;
	bh=iG9AIBOwwJWUK3xkez0l5cZOQg8I/Bo19li6N6S6vP8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=duagVSVTiuzQaBYWF3VOvRQI+8s2a3Q1lEgoLW217d/hRvXx8vIbSB60+rM1qFsxl9wT3WZLbmb0YUn4Ob6pE4Gy6weunXKdmnVC1ZjRC8s30g47fXqN1Wmx6mPIGcmcJzPd14XxhKGwASOP0By0JFx6FJm3fkoPP8ol3aV3OAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddd5311fd3so3724085ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750301533; x=1750906333;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8zd4CSvo3YxjL3zyEytOcdXXsWxdDcjY434S3Ja1zW8=;
        b=ZP41+zCwrg5uAWuguThF06qKRXnEC0tIyphU0O9xCf7Ctqowokh4RBbnFTsNHVEyp0
         oQY5mdvLedsFHDbWAHtEgmuSHr35LtJBvzbbHX3ijdjnpF4iK0/mTTy/VWo+a+YL+99Q
         FBhBd+ZbMHIAyxHseLComnPTwS5GC0SPjJ5NEqxj8UbNQyIoG3AM7GuGI5tQ67hkhxIR
         178+U/YCslWReihdGmq4yN867gqI7GXYTWXkKb9g5VmWnGeCEA/2cm9kjuh0tem9sZPP
         AVjWnm1I1+6QX6UVn6SdHO27VisERskGqQYsScXZS8CYFity1y4vSq/fwKGAD69OAb8A
         vZVg==
X-Gm-Message-State: AOJu0YyAYMx/uqFX+2RPZdAyvnWh3o163IuYlx/mN4An/BOIs5dfECMF
	3SBWecIfpyFV4VddLWjB9ICHFXCjq6ktVLeKwHNKexYNFfTIzcPAYESvL6dzYXLm6sR7PMfv5DE
	ub576vX+7cWcoWdaYaZE34HPINsHgWhcfRlsObc4d3Lq4yUtcb7PJCusc7bM=
X-Google-Smtp-Source: AGHT+IFXQ7c0az38BtkI6HDJC4/uNzTrMn2kYl3Qx5njei15Z/9h+VnNonNd3++HAqi/l3evSSHIeS5AIri9jyuWe+1aZXG4bGK/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:180d:b0:3dd:f948:8539 with SMTP id
 e9e14a558f8ab-3de07c3ef61mr232226795ab.2.1750301533138; Wed, 18 Jun 2025
 19:52:13 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:52:13 -0700
In-Reply-To: <000000000000dbcd0f061f911231@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68537b5d.050a0220.216029.0147.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [wireless?] WARNING in cfg80211_scan_done
From: syzbot <syzbot+189dcafc06865d38178d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [wireless?] WARNING in cfg80211_scan_done
Author: lizhi.xu@windriver.com

#syz test

diff --git a/net/mac80211/scan.c b/net/mac80211/scan.c
index cd8385ecafd9..7fc1e98abb2c 100644
--- a/net/mac80211/scan.c
+++ b/net/mac80211/scan.c
@@ -498,6 +498,8 @@ static void __ieee80211_scan_completed(struct ieee80211_hw *hw, bool aborted)
 
 	if (scan_req != local->int_scan_req) {
 		local->scan_info.aborted = aborted;
+		printk("local: %p, sr: %p, wip: %p, %s\n",
+		local, scan_req, scan_req->wiphy, __func__);
 		cfg80211_scan_done(scan_req, &local->scan_info);
 	}
 
@@ -1123,6 +1125,8 @@ void ieee80211_scan_work(struct wiphy *wiphy, struct wiphy_work *work)
 		/* need to complete scan in cfg80211 */
 		rcu_assign_pointer(local->scan_req, scan_req);
 		aborted = true;
+		printk("local: %p, sr: %p, wip: %p, %s\n",
+			local, scan_req, scan_req->wiphy, __func__);
 		goto out_complete;
 	}
 
@@ -1135,6 +1139,8 @@ void ieee80211_scan_work(struct wiphy *wiphy, struct wiphy_work *work)
 	do {
 		if (!ieee80211_sdata_running(sdata)) {
 			aborted = true;
+			printk("2local: %p, sr: %p, wip: %p, %s\n",
+				local, scan_req, scan_req->wiphy, __func__);
 			goto out_complete;
 		}
 
@@ -1147,6 +1153,8 @@ void ieee80211_scan_work(struct wiphy *wiphy, struct wiphy_work *work)
 			/* if no more bands/channels left, complete scan */
 			if (local->scan_channel_idx >= scan_req->n_channels) {
 				aborted = false;
+				printk("3local: %p, sr: %p, wip: %p, %s\n",
+				local, scan_req, scan_req->wiphy, __func__);
 				goto out_complete;
 			}
 			ieee80211_scan_state_decision(local, &next_delay);
@@ -1165,6 +1173,8 @@ void ieee80211_scan_work(struct wiphy *wiphy, struct wiphy_work *work)
 			break;
 		case SCAN_ABORT:
 			aborted = true;
+			printk("4local: %p, sr: %p, wip: %p, %s\n",
+			local, scan_req, scan_req->wiphy, __func__);
 			goto out_complete;
 		}
 	} while (next_delay == 0);
diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index e8a4fe44ec2d..7c1f80be24bb 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -1178,6 +1178,11 @@ void cfg80211_scan_done(struct cfg80211_scan_request *request,
 	struct cfg80211_scan_info old_info = request->info;
 
 	trace_cfg80211_scan_done(request, info);
+	printk("r: %p, wiphy: %p, scan_req: %p, int_scan_req: %p, %s\n",
+		request, request->wiphy,
+		wiphy_to_rdev(request->wiphy)->scan_req,
+		wiphy_to_rdev(request->wiphy)->int_scan_req,
+		__func__);
 	WARN_ON(request != wiphy_to_rdev(request->wiphy)->scan_req &&
 		request != wiphy_to_rdev(request->wiphy)->int_scan_req);
 
