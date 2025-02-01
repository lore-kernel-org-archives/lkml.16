Received: from out203-205-221-240.mail.qq.com (out203-205-221-240.mail.qq.com [203.205.221.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76B85A4D5
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 02:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738375688; cv=none; b=dQ1fViWxRbvpML//fvSAtC4iIMxn2BVxpQuYnAJ7NQLhLSvj1cckBdPbZ02TWoBN9+82/OhJ62aENMTaoksKZh02JLBObvjCmkyrjZhTFqpYQlIhgExlLMjH3kyS1aqcEDpbbAV8BmbRocqZHnan25I469rUztkjIIKrwUbmvh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738375688; c=relaxed/simple;
	bh=5NUV/Smhhra6PvizOc/P+HW4QM+0UoWI8pclAapHqJQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=GdoBY52GCk9zR0nhGCR+IJU3Zb2ouzn+tecT4E57/Btmf0I1448PXj0KGQw4H68SUNMOO/J9MToP9UP1MlhTnB8fEltKngxmKYlCL4XJYDTtUHouei0tg+ayNBhWeWLJBSrCFUmAnNyICMb+IQJJH3I1Ygp2lvekxzWuDXSwdno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=SLXn4pVX; arc=none smtp.client-ip=203.205.221.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="SLXn4pVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738375679; bh=5NUV/Smhhra6PvizOc/P+HW4QM+0UoWI8pclAapHqJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SLXn4pVXk3YCvQURq7sCS2eUrhZypGVLiaN/sRQHqIz2WnXJBFAY7vhlyO+cAv2gX
	 wvlldmAxqbaxUNLQV28lVkDhyW6HlWNyor+hZtU6vX2JGG/JACggKjGtp1oGLHAaTn
	 /ObnAkq8Mt/7Ru+bl4S+vkZYAeT2/30CKLIKklyM=
Received: from pek-lxu-l1.wrs.com ([2408:8435:9930:6b25:8cb3:3b5b:faa2:1ccb])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 10032CDB; Sat, 01 Feb 2025 09:04:00 +0800
X-QQ-mid: xmsmtpt1738371840timhad3n6
Message-ID: <tencent_BAF76E66D5136BE36D896D43A7C44D576005@qq.com>
X-QQ-XMAILINFO: NVWg0TDWOKpeKhUsGfe1O1Eh9nCB/jy1g9leUXyZ4794oqbbzpNU2uShfd6/Ho
	 7mzThanp4MFk85r3IFT7h6DctJh+Ehqs4DbMP1FXkmszr+cO5XgRXeceHAEeLkANC0JQc4epcPhl
	 NDdjzegp9PNWu/krn+W6/PsgPCH0CwgT95PQ/d9se5Lsjt5f2+jynBsYGbBeJR+7S91VNggDskob
	 fUGC8XKLjSEU01VsE0GyPOBsAo1fwif5C7MLn9ldE+nAKyllxEzC0TRTYyW3EM8AGTwyCPSPWowQ
	 HE+DucBMyIa78qplnT5BaoYmvnmHDFhGPQyIfdvf5wjpbk9P9t9g28N1skn7ShkRfaYLemqFmgeH
	 OtKATmBODPIWEc1pTVtBylIw+495ve+t3n7VY+9999vF+JUwHYNEeO3UZzwHpEnElIeSO2EO+r+T
	 Y3xQKetAeAwFfz7ku+XcIvy41aBXBF+bPXi0TYODkuZgDdyty12fymgDSTXG7s1g3Pz3ZhHsbWTC
	 b3gpPyRF1ki9tbyF+WhZSUTJkQVWPgPm3JyR4Ux7rP8tj8r5PAxwZ5GLrVfh3//vULs4hGtlWtYB
	 MglQqf5ZwEVXbLYlP9r+enEIaargef0PVRzpQBoEv5jYF2i7MsB/XRWOGJH53exiaas1L6b7VR9f
	 SXj7iZCzrjZr7zn6U+2aKlSGYB7Cmq09PAMqjz7Sn9T3W6MwCzFPpVLHMY6c8xghBD6pldzqC19J
	 KS6ErjLW8RzCHTUEojdpDuaRwILzY/Ab30dqKsFZkF+6deIj2fKJfk6lFcYQmEyC5+kJRStZYVhG
	 qeSjun1tHIZUxF0r/IV3VpB36aMGHVqI/ovK9qsnlDzqPpCRrVCzRvKekLrBuzYL1aCDODmVkqo+
	 6wDwwXz8df02TS989qILV6HClzN1V/7w==
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+c041985778e4069e1ce3@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [fs?] WARNING: bad unlock balance in seq_read_iter
Date: Sat,  1 Feb 2025 09:04:00 +0800
X-OQ-MSGID: <20250201010359.714319-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <679d36da.050a0220.163cdc.0010.GAE@google.com>
References: <679d36da.050a0220.163cdc.0010.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: https://github.com/ea1davis/linux ftr/syz

