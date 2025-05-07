Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com [203.205.221.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B35921CC45
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 11:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617945; cv=none; b=WyBoT5l8YgSv4j/vR3h5ByXv5Ic6E1xssCevW0NBtCoZGezf8+PJ/UUEqoX75Vy3bXqeMAMCXj9e8L2OflgE8/gGMLUpPj7ojT7rHMM/T5QhtELkQT/2UDfq8KhyNwVZn0y8Sp8awYaQjHAwkKBjfttriUj89jQpj0MKUZUt9vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617945; c=relaxed/simple;
	bh=oRAa5mnOrowLtFslmNlY4yDQXQYBw9BfKvTiAtzpUMA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=mKZTj31aSaHjxH+9EMQjXsdD1kA4fKHQ7gKfi16AlidkFfNjZUv87crreP2gVHy6BXQ/OrBGMz6UiKdq3ZuPoQ3R+kkjlubhmUxHq2qY/diHe0dKnyP1rVX48GiGsNbkvmBXbhkuKPmqiKdUL1xMDuLjjgHVZ4i9xBQ/omOBzhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=bn00OwN1; arc=none smtp.client-ip=203.205.221.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="bn00OwN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1746617933; bh=Ch1JB0gV+OI9f2n8oy7YDjOdh6rDxEJQw7f3tYeima8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bn00OwN1kwSnTFyfZL5v1ZyhZgJ2lpGwoG7vS7cpM+quHPRgmvFwUan0RuEwbgYu4
	 1k0DrIokVe8kZkWvq0kh0Ltc5yQ0KjuJwBsXOJvy4Ai1kBmMFqoIzGWvms7f7F2XWa
	 HRD6EacCCZwps+MRytruqsNc7HBUOcdkIJMgaGWs=
Received: from pek-lxu-l1.wrs.com ([114.244.56.254])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 79F908FB; Wed, 07 May 2025 19:30:31 +0800
X-QQ-mid: xmsmtpt1746617431ta5bzkia6
Message-ID: <tencent_06AC9518E9DAEE02CC847A366C002D4D6C0A@qq.com>
X-QQ-XMAILINFO: MTl9YqPIt7/7P1fYDcitxioCnVxmJiurzwb1WhbbjSrGpUSDzVm7djq8EhRwXu
	 o80PFGGmRV1DpZaMOt6zpPD0mTURker4KWhRnEKCnblbI8EAodLGMZioCF3iYrrIwhzkZL/Lm281
	 Mk2seKjaYSjoO4tVbSfT+j0R6s95JrZyhU+4k+Mz5eLH+u+TIwJ2yuBNfMFkPzaNg1jE3r1xxNtL
	 /gtnVw5PjUrH98MAoOS9nYPQimIKwoWPcykx9EzUQ5EHOaDTpmftF7EOzX3AYB9DQYVx/V1vZXi7
	 sx58vzts3dRHzmjMu4aUUcewIuhDpp50ZQVxQS+q2ylG8PMaBAJNjlvVqzm6E7CrRrQoL6jcZF7L
	 AyKU1oZ/S4JeB6rlcfkibcPUbLhmewXKu7ndZuelgxm8gQYdz9e82fLtDntFUZeIEKywvcjY6Wa0
	 mgvDeGC8fniqkbinDtZ/DhRCiqxRqtIlFArXZW2PWNbmK/h2Btb348rMahWWp1PT+YfZfk3ic0kB
	 HjmaNCn+9n3bTC4608GrhcdwU70nDhOt24BH7MCUlvpSH9SNwuZhRv8n8htmaV6Q0bnI1t39RNaK
	 ICbH0mL1r52jeegfze7WK49M1Y1gQn/CHwsW9AYlvGmOiK5F4r6E4/7PlwfMiEwcKPRWlws04hFj
	 e+bCPmeg/vbQx92RCgle6Q1pFPHZcBuWff1Ikyv3MQicX5RPk6HH6JTwKje7K5ZAL4avk/X30XmS
	 bBefrzM6ZCV44yQEU0N6GV2f9/eNlX5QdsalGO8Dxr2LaaDX0FOBAdP8eskRkslP8JhvIEObItvp
	 Oo73YfAYbbo5qgmeIGfcEcyxCDPnje1HErePTLStcnpKhVPg9IkZivTGz1XaJEp5ZmZHNdIVop8R
	 Ld1W+FfkP4gpboN6keUHvvsDUILqWv/i7wlGClQYxUrREM1s4vF/X1DN31yPBBgQ==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
Date: Wed,  7 May 2025 19:30:32 +0800
X-OQ-MSGID: <20250507113031.3246094-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <680fd171.050a0220.2b69d1.045e.GAE@google.com>
References: <680fd171.050a0220.2b69d1.045e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 741e6c7edcb7..6842c3011a99 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -1353,6 +1353,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 	hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_MONITOR);
 	hw->wiphy->software_iftypes |= BIT(NL80211_IFTYPE_MONITOR);
 
+	if (!channels)
+		return -EINVAL;
 
 	local->int_scan_req = kzalloc(sizeof(*local->int_scan_req) +
 				      sizeof(void *) * channels, GFP_KERNEL);

