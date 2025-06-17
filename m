Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D7A3208
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750146798; cv=none; b=Bxb2ozWFEm9j+kIRkPHiJTvhC88gIA2fbgyKBA/BSRcT+abSjRbQgF9w6Zp1ORFYvNFlh/n4IpdcHV/BbL3FfqSHDTO83Qy0fkFW4QtLZoTEkVMw7VcpzM0OJ3vpUcbelxcQ8bri5oGgOaf4YBAOJrlcylcV0GyMgioFyWMfXKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750146798; c=relaxed/simple;
	bh=0/uaU13JstmJ60lccriBsi0VWlKbxW39y0zNVpOEsB0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=QB7ZMA5AYx+QJbi3QqGgKZXlSrQ7YEGGEotSIBmFMQXDlVLWAGmWwPslIb7SkXzkN5YWiq018UUiw106WcNiJkC/5ssyKLczqT5Jr3qfSyw/yfDkLrphWCh0QGj9nh2bbkK1eU/M0R6XQYTWv2fIh2TSL+XLyqfMD5LlZDqptbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=CmXS3sIU; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="CmXS3sIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750146783; bh=0E11VlxV3JqO6c0wX6S/UsZCO3CVG2Kmj3LxHrp0x9Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CmXS3sIUesvIUbCwsTnP1yjXM7rQAfh5Te2vwe0it9ukq9OEHLjOxS3g/WFVOvEFK
	 X/a20MXeZbrzu1eBupBXJLy7ma0kKH0HUqgju3xqh2m53ht2UKasF6Ji3Fr+SZq0cg
	 Y4BzNPpB6YvZJY4yi5veGfCm1E+RfWhk0oTaz/CI=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id BAE9364B; Tue, 17 Jun 2025 15:46:46 +0800
X-QQ-mid: xmsmtpt1750146406tba7kyv70
Message-ID: <tencent_78F762B76A86D9D36003690962E3BE844205@qq.com>
X-QQ-XMAILINFO: MRLc0g//fdpvS6U+i0xWidi3CkHliDweVQrbhtJlayB1FeHmU/qkvtf83QCU/g
	 vEoB3iHwnLgau0f9p4uBJHu7QgEref+zkhD5V8lXbyHbpoi1/oXb+ASVoTl1fNEgo3iVCA9a9SRj
	 H2UTxYLry+rsbdeyqnxtUp2gUmQLs1NFcdSPjHSw3/j2yvOBMlek7HP6dPj4hQei//blbnRqozMg
	 X0RPKAAENuO6Tm6OBB6Ci4Zo4AAJjtrV0wX1eW5xlukJ+KVYzBbAbAqEDUfnzbRqoztvBGo/ODGK
	 SqJB4d5E6iaVd8FHoe10mRzUXiBl/ABhybF6WyWLxphs9S/cuCuLOwDP70Tt7MqDbcf9/9SJIYxi
	 JvTl6PLfkbw3UJPe2vbY4ChynEZjWem61hMMraTfpe4AXWemdFJX27819RTWS30GaPOZcRIcnjNe
	 F5K8sMpZi+WcLeRMCEPYYGZ6oRaZ7SvQySmV+Em210LjJcRORlSRXoNgd2ThF9aCCdVgR9L+VOtU
	 VKpGCEwlrr6l/d5UdNhEQZXNEeMOle4fEeT0RtCV8fq2LamT2Fdu15h7WSp1ZRBDyfR465uaVbEy
	 YBCSL4cIl8ZcdJEMqkOyKLdrOC+4SeYnHm9yTrmwf699jLLmzutyoUa5s6Yqxj2g1In8STXSBzH8
	 bXIr6GV3CEy6b45JS50y3WgwTt9a+LeisXeQbgPfjiuRGdW3Q4z9C3uNRKvRDkbxCjZFYtDkjiDt
	 8gL5xJwUx61/VnmqIG5AsgSKtUxKePBt6pp1X22Vh2++xfNKE8eKQ9N/HiBVJt55qqXfPCibyr3/
	 dt/5BIQHkgNZ1fQhuPn6vm3PNzX1CKe3n9ck82CcK9fZrNy6JPZNAggakvg9cFit+nf5akPzFk6L
	 2ykpeChPeAbtV3eQLTTFltdGyOrWpX7CEPqowfTkpi53SDEdZKx3SM0BNbBfobSKzrnuK/ZiDWEV
	 WCob6w25c=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_rx_mgmt_beacon
Date: Tue, 17 Jun 2025 15:46:47 +0800
X-OQ-MSGID: <20250617074646.575163-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <68504add.a70a0220.395abc.01e7.GAE@google.com>
References: <68504add.a70a0220.395abc.01e7.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index ce377f7fb912..556ce95e0b0f 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -1278,7 +1278,7 @@ struct ieee80211_ext {
 			u8 sa[ETH_ALEN];
 			__le32 timestamp;
 			u8 change_seq;
-			u8 variable[0];
+			u8 variable[];
 		} __packed s1g_beacon;
 	} u;
 } __packed __aligned(2);

