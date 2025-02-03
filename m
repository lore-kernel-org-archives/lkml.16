Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7577E205519
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738587006; cv=none; b=tS2k+zf5U9FcuKAFm/z+zOBcyNrPvx8qIZqd1+InpwZYMSBV76y/oN4+PLknK4PhjMzZFKbKdnAkSp26SFIZg0QLnzIHParTCLuUvoZ94j57QjC3uTg9CUaiYQRt81ixRQWNID4YBcVM5AU+Jwu4g5Com7VfGK6TscjeX9vFoKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738587006; c=relaxed/simple;
	bh=TncvBp+eSKGDv2ovPaIW26cBqw0Y1COwIgCNOydf7b4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=itTy9LfMINFByIu4/A5w6SSd7KLBWUthDDRBrTBnxfbv8mrOLzIxXWFOU/lxSuQYouo2gvn3A1luK6tHgvGiWrzFjRrNUHdNFUNaT7MAxUDI6ioWNLFlmD5Fkc2jeVsaUfF3Y/S5E5KpWyVTGfOh+8D5s0gHw1Ajz7Rej6uhOHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zw1TZ7/W; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zw1TZ7/W"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21c2f1b610dso99064205ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 04:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738587005; x=1739191805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRol1aW8ascBEYtpPOhA1soXqaNQE87BsczEBo2jEqA=;
        b=Zw1TZ7/WlSIblVQypHvVV43TT+1u2SDVF8HgMdsORqhfz7htY9Upo5dldx27MJVfn2
         76TBqOve6QQoAo3H0j3mrVpwC4AsppovnmLyIizoYQ3wykP+taIGHkS0ba5AONQeki3U
         LTww4PtkFkUMrC+mC7rPBSe/U8egVUrt59lklC8k4gDTDt/ujhW+3one3egT+cjVHoy/
         2JguY0HRx1P+RSIUlypuAhMW2g+qwuh7jTsReFok9O65hZNf7v6DIubulwhuvcWqXz+f
         gFl1ytQ+0Gj5p+XC0lL+9ZsVNctY+dEfsRbKKCgY2l1WDkxGbqbQ0E1Wa8pnAvz7/FtU
         v0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738587005; x=1739191805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CRol1aW8ascBEYtpPOhA1soXqaNQE87BsczEBo2jEqA=;
        b=Vj2LpPIHAvgcPep3mOf+jJX+b5At4ZbLBeMyVn8pFjnWue4SbP4wpxA0v0QFxcCWiq
         gSKSrOMuBqcu0Jpzgs1698pnkknGrfr79JQ4li9mmZ5BSzx4Cx8HzTXy4oRhtEOwz3OJ
         h3102HBzHBLtuQ7BwnivxjFvC4we3NmSmrQZiEaATrZg/h7bPzT/ghK+xV2vnFqMgFRY
         A1WVp1CTKEquK5YlpWSFdNWSOV/rtuZQlPG5t0fr9xt/gjiyL0MkVCGXCTLVkxotTkkb
         8oSDWwnFpldnJ8GvISSY16WJvsVH4qUAxXmTpbRNM32FN+3Vk9oZybe+yzjxZDi4q9PB
         8ofg==
X-Gm-Message-State: AOJu0Yz8/t/VuvfUhzpg6t3gbkaI6/Q/7Jjy5dwxapbkuzVMtK1W38Yh
	RaFMTpMA4OmMniuZTXq3hdMbqmSyDhXDR+UfeYziKKGCkH1znZPs
X-Gm-Gg: ASbGncsghd2f26g1gRclVS0xOvTvvSIGFLyMbXjB1YxNfX4OlYKz5AWMigtEl6G9+ML
	Fzhw/DJVzPLW3KrhVxZ6uUD9AxLmG3936wV2SbPbXPu6Sb9ySgLdnaCgtsYxkPSciduwLs7CfcU
	lTLX1bVNHrSRB8z8N6YEmpW9LI4ofrOPCnb/stEsvlSbsHeYuSRQD6EMIcn8ZNHkZTK1feTPowU
	gj+HTVlkucUQ2RGNn4MKdeWZCZSRwINC/6Yyk/hIzkk5pify2WJgB4YLLp3GPLcSxumvzBzKqhF
	IIZfds3LbsXH5yEVkq5k9S25pegWrZOWB75hn0hWe9dU
X-Google-Smtp-Source: AGHT+IGGZE4araK84vEa1kgU0K4lj1wDKVGEAe+duzfyrA3VxGz1fByH0cBW9teNuBK0Ffny9OouMQ==
X-Received: by 2002:a17:903:41c4:b0:215:bf1b:a894 with SMTP id d9443c01a7336-21dd7d73401mr397132655ad.24.1738587004644;
        Mon, 03 Feb 2025 04:50:04 -0800 (PST)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de331f8f5sm76003505ad.228.2025.02.03.04.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:50:04 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: syzbot+9d55b199192a4be7d02c@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [net?] general protection fault in add_wait_queue
Date: Mon,  3 Feb 2025 21:49:58 +0900
Message-ID: <20250203124959.114591-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67a09300.050a0220.d7c5a.008b.GAE@google.com>
References: <67a09300.050a0220.d7c5a.008b.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

---
 net/vmw_vsock/virtio_transport_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 7f7de6d88096..655d5f911c84 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -1298,7 +1298,8 @@ void virtio_transport_release(struct vsock_sock *vsk)
 	struct sock *sk = &vsk->sk;
 	bool remove_sock = true;
 
-	if (sk->sk_type == SOCK_STREAM || sk->sk_type == SOCK_SEQPACKET)
+	if ((sk->sk_type == SOCK_STREAM || sk->sk_type == SOCK_SEQPACKET)
+		&& !sock_flag(sk, SOCK_DEAD))
 		remove_sock = virtio_transport_close(vsk);
 
 	if (remove_sock) {
--
