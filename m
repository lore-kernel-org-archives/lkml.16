Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB3224CC
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 02:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750560136; cv=none; b=istK7y78zeIUIQw+v6rIPCcsZIhHjBv1TNdqqc7A4JCRm5QdDM5MxlgzTRaRPRiZysTVDKlcqRyM7XAkbLPX88XxPuCkSonD5kKUJ6fG4KP8f2sUxH6o2sgx+wMEollO0DS8alckSnR+jBIv3R5cJICOMyIk6ODb9n0Jo7zCLro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750560136; c=relaxed/simple;
	bh=Y5L1/Hv86Rrt239PpzvNKGOjMLUNQVdflVueaOmKseo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=oTdaYEd3tUA+SMYOjr3spafsM1OOJYp0eX6f9UVoVCHdCJx4Im/2ZMJj26nSkFddwbGxGS7UdDvvHEmX1zLTViVzkStgKDXbZdJHUajp56eYXk5pCoB+eGviv4hA/iuy6A/8i3lkkfUtHkajPqDEArDfq+S0Vk9CH4hQJ8dNGgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=XJfn67Me; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="XJfn67Me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750559824; bh=Pqr9H6HdaxbQ1YGX9uvQoTjtin6jNKtL+KO3zBMK0zc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XJfn67MeBGJfVQvAGNYeoGWiSOiYY5kL2kwovaTmEo35QqECNMM9j+mGXDfDdc/83
	 wjrLrdNAEviTGPYsFCI8bTd/meWSYqkfjqgaw5Vb9anK/2qy61FWTkLhgX3usxYAWl
	 qvA0C4Hzf5OaHVlotan47hYXIlRjgaDALvlXSfKU=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 942B0C77; Sun, 22 Jun 2025 10:37:02 +0800
X-QQ-mid: xmsmtpt1750559822t9oqyqdgw
Message-ID: <tencent_DC992CCFD60DA625808DAC12465DA2DDA907@qq.com>
X-QQ-XMAILINFO: NhpLzBn2I3Xw3cGAjD+/4IYGx2Rn1rNcZhK/fKRwjlrIzeDUHniLc0P3u3xYF6
	 lVwpRTKnYPPoO62/SJwyBGXwd+6M+YLT9tAdoi1eaMqUOrICqJg2P783s37Kyi5/7I6MMyTanuXc
	 Jgji4SA7qpDl590UA2zJpidFQq9rWYND3EwJoROqKWapUasv8easF/7gGHt/+69fXzi7UrNdh16d
	 AUyh9B/oYSUjgO/u9An9686fLAL2iJjQPqZ2vx4hZYwMqiH1F3GzkmWulYK81e7e18S2gN5MEYJq
	 N43PxyU0JarkggY/xKqmWzD+TIsm5lgvN4qyZw5e8UbWyNxukhIJ+1Ctw2dP+W3N9tsBmN9XXWit
	 i5vM9ifU0GHDlkhXLf8h5Ag7WN61NPcgw7XknqvRAfRpbXYS3PO4o8t8Ob9XItjg1eUTDk0hBQRy
	 amqbqZvS6LFzbd+bCSPKqtdDmaLDt7xkyvMF1D30lSCXTKFdkRwAS3peUypR+ch3eVqTRIGsjVh1
	 RGNFqjD/XXGz2DpJXYw7exOmsj4JUSRzSv6cKi59UXBu/5v4dZlyNu1IzYTOH9IwoSDWLTzSanDP
	 7cCYMTNhCxQQJIqTwUy9rwkLNZcSZxwDEPjVNvF6029pJ0qvFBApspBwvr+9nc5hEPWgSHMCeuz3
	 HcBXw3vrC5m+vWdQ8bILOoMchU1qeZUozUXY8aYYw93KBIXf1vmbRsAoX6rKnV/D9dizYGdlv4LZ
	 uZ+0hnrwpLSnN1YlsIuyGaCO+KmqKoW3uEKZsKYoO4Fy3dW0Dfs9KsLe0R3p8WwesigmT35bmsJu
	 bK0DrC6CIu7FK6+bbTUxoRWkBPrHePTj7Rnbz3YjmKly2qM62PZfptXJX18+zstTpybP+z4IF5Ox
	 OifjOTFfz0LTPcFD1iDT7LidPmUvNUM5zcw8oGHRaDFW3QcDeDwKbamcgWEgSMUbyHD4wcGGNPIP
	 sGNVzHz+E=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl (3)
Date: Sun, 22 Jun 2025 10:37:02 +0800
X-OQ-MSGID: <20250622023701.2870977-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
References: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index b64944367ac5..e0d3af8e62b5 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -434,6 +434,7 @@ static int vmci_host_do_receive_datagram(struct vmci_host_dev *vmci_host_dev,
 						     &size, &dg);
 
 	if (recv_info.result >= VMCI_SUCCESS) {
+		memset((char*)dg + 27, 0, 4);
 		void __user *ubuf = (void __user *)(uintptr_t)recv_info.addr;
 		retval = copy_to_user(ubuf, dg, VMCI_DG_SIZE(dg));
 		kfree(dg);

