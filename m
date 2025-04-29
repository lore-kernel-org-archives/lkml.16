Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DEF1BD9D3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924617; cv=none; b=M1YoXDwCvE2ETuWTeXHuZNXSGZXA3ey3igTOdWZsUKOEX/hplXUMkzOlLzU2/txgn9vhNJ6EieOOuBhQ9a40DoNLc6jDM1n1ehF3jtIa5sQ7hpRLF8BrF2LNSy10urtdSLRUlWVHYEJtWhrpmhjflVXsjRmRrPtafAPmS1FdqKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924617; c=relaxed/simple;
	bh=AaLH6uCg2+cfL0N1DDYRdVbnzjm6lmUoPflwUpegUXg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=npQ7a79XKoy2G60ym1sLdofk5jjr2nYleaQCGAqb0ww4dtxsIrhY4xnRO8UFQBgFkZiHAB+/ePBcVWX+2DxPNZCDtvzWW/uh1DmBQuGdJn/1Sn7e2bHsLWMmBONuQHmGQbEAeulZHVo8cRJfDZ7Rh5YQhx2P/anuzgrG1avl2bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=iDPMTwH5; arc=none smtp.client-ip=203.205.221.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="iDPMTwH5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745924303; bh=9FbtqoKyWpjBpf6GFquu3nJaY8dh4VXPtaWhpXYMWi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iDPMTwH59XkFlTDM9/aZI6SPs5E0Ld9xMoySmK237MU0IM4HUA5//pfi/4HXJ+Fu8
	 tK460sSz6Y0w+1NhmLwWKelKmg1XNYpER/TAPxtAr5CBDk44u1G3BX6QnJKRvgQiD7
	 H7qmllOGyAr5O0Fdoe0cmGWxIokPYPYyqiboX/0w=
Received: from pek-lxu-l1.wrs.com ([114.244.56.254])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id E9586CCD; Tue, 29 Apr 2025 18:58:21 +0800
X-QQ-mid: xmsmtpt1745924301t44441a9y
Message-ID: <tencent_302C2D116C8C966CE90AEEAACC407A5E6F0A@qq.com>
X-QQ-XMAILINFO: NWOHIAASQnT+gHABGBF6pKfNGU8Qwa+sy4GpdH7KLOLqeOCrqpwWENwFwbEQ/I
	 ShGNhrXXzYEXg1TvjXW0miKhCDcqiromyPcqm1OPF19Y6LURt6bnj+tDxSbPDMO1qK5HI0Rw3IfF
	 7/MF9mpCvxoQbGAzlYf7gZLxLbDSkiKMqK+uOGAyUfjJ4ZUN+bIKpViwIOk8wRlHCsh4ScHW2CmF
	 XcuJaIKb84uOTxz1MhIJ2EhSmUZ1/sx3Tw/o87fFyFxtuzWfNMD8Fvopc+K2itF7c6neFRB4Nrjv
	 F0VihzoWiZofBh6b/UkvHmBz6ecPUYvUQglsTl3YRaeTnBCG/0tSS+tMsM24oFcQT45eculCd/0g
	 CNiFNpucqOSyNgNcg+cGCRX1zXbcikj1Jp8CS0hdkYEwaKcdbo0TVKGLVH1i3NsK+Wiex4eMR2ZL
	 w+RMEeqZZTgS/EHFSJ3cxUVL9mWGKWHwMnCMuxwVEH7z75IKz5foBm8wB920uINcUjaNES+exDIh
	 K9pT03JxCDVl9sp6YHQdUjia2gi68ruEZeBenoS/yAgIeN1DbfWGgN9BMj/NrgT9qaBun2brlT2x
	 5rz+bEms4EK1MNfnnTUwC8C5JW3zFnM0M5e5alqaL9i6LCt8+e7N2Mp58iaI+qmKiuatgoXRnSGU
	 iV4qZtJG9pJWQC2z/3MxHcCRxtw693nFCja8uj+CJdGIF0mpkY91CU9IzzSm7fDivkoAG7elC1XH
	 IJwS//uvtcRJno3t741CbLFiMdWg5EDM3kEP/wME9qcN5T2UHW5oPeDXAdMb8jtjgwu3gh7mdiZk
	 jZLK0V2yxCy2j/Iomv81c0OF0HEc6YuqNPG0kguUDdHW648TSMHAEUO7UsQkrorlhEyVBabwSgQF
	 i58oyMikAJ4bkrzIA+4W2IMP7Z7ADWxYHjJJWwY22Yl9FT7mFLasRK26ga1C/mVAmvEUoA1i/gnI
	 vaY4T0t419JSP4khsRUECAtILlsj0Rbczd5saGBzG195SpK+4hEA==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
Date: Tue, 29 Apr 2025 18:58:22 +0800
X-OQ-MSGID: <20250429105821.834028-2-eadavis@qq.com>
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

diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index 4246d168374f..94eb2fb80aaf 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -1818,6 +1818,11 @@ int ieee80211_ibss_join(struct ieee80211_sub_if_data *sdata,
 	sdata->deflink.needed_rx_chains = local->rx_chains;
 	sdata->control_port_over_nl80211 = params->control_port_over_nl80211;
 
+	if (local && local->int_scan_req) {
+		printk("sd: %p, l: %p, nch: %d, %s\n", sdata, local, local->int_scan_req->n_channels, __func__);
+		if (!local->int_scan_req->n_channels)
+			return -EINVAL;
+	}
 	wiphy_work_queue(local->hw.wiphy, &sdata->work);
 
 	return 0;

