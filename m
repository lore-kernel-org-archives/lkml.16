Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565948C11
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 01:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751505448; cv=none; b=TCMB5Nr8nQChZ/z7rRaV1+D0aDbkS7lZItIoaaKM2S79qHA+KQr27wU2i05JKFXuLVhUQqfjycW6qFqee2Oyf+HzulvIpG/oxCB0oITpKc10XtjK2METKyJG7WUA1ulnFHrItoMRqN4DdlnEyK+oWaQsIL7ejjgGVgzquZkYa8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751505448; c=relaxed/simple;
	bh=DJNKakqU3YkAerqiUC6OSmZ1gRpO+3vICX9ml1dECuU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=K0J48eJZxu/j+Ze8bBwHCwl1bMenyX4KjJ/Ro80LiQ7wOgvJs/MUCRmsGsLtkZHoJGg535biD8eeZN1tFqRbQSmasdLfmsLGK4ADQoVi/bt8Nt0/Cua7pB4qgHOJiVfg+TKq4H8eE2sJM2HMfg++YnJbcl+261TdZFXwhuP45wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86cfe68a8bbso519431839f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 18:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751505446; x=1752110246;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rkAxNpgnFcgnY2m4dXwwl866T3/ZuVH9y1Vs9ZVnAk8=;
        b=bvdzUicUazfqmLlHzlLmLlZN3D4fD9oTE1w3nWOiYtqpovjlma6fhGN9lksMnlxMV/
         GSVNklUGS8Ef7Acb2zqBO6SjmUdxIYa2rdJ4/kh/S4fyPuXftiyQaIIawmVLpsFU/yiR
         Y7+uWNAouZnUfuLtidWChqy4kjsZbFzCA7WgqDd51bUul69bfWKk1gLsKfUiaRQy+ndh
         pKCwzcuEn0n+T1QDQ4AW+x44xMD/QJrcsn6b/Q0Qf+T/Dq3aPkJTnHVDrdgW9PxdgEmk
         GlpRJ9UQ34Uk0LJSEoQmaHUPsttIRCKUgS/qb9emV5fowzcGjLKp/GV0UmaD0evo3UjA
         Tymg==
X-Gm-Message-State: AOJu0YySyx7MPhYT4s53KqqcjDc7+OApZvwoJhhziYlEGAv121QxwenK
	IL6TMFXeQvO8nH9PPEiMJtUsU9E2ektgnrM1DDsmcSBuAICJ5Q2w9cgO91/VwWL5wFUhdtCEawn
	Lrt2Nq0dtU/h5EkGmUW6ua/Ga5no1VyOZ77UE7WG3Vc6N5+fid+UXuj+EI+Q=
X-Google-Smtp-Source: AGHT+IHOB46WzM55UxMiHTC2Rvq04Vb8fWwzFX9Otcxqx1QKWm+DK75o0TUybkk3gjWeNnYZ8212cYutMQyb4gypIRZokRTiqcwx
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:148f:b0:86a:84f:7a45 with SMTP id
 ca18e2360f4ac-876d1f2a62bmr254346439f.8.1751505446483; Wed, 02 Jul 2025
 18:17:26 -0700 (PDT)
Date: Wed, 02 Jul 2025 18:17:26 -0700
In-Reply-To: <68656f4c.a70a0220.2b31f5.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6865da26.a70a0220.2b31f5.0009.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
From: syzbot <syzbot+169de184e9defe7fe709@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [nfs?] [net?] possible deadlock in rpc_close_pipes
Author: lizhi.xu@windriver.com

#syz test

diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
index 0bd1df2ebb47..ae5643e0bc43 100644
--- a/net/sunrpc/rpc_pipe.c
+++ b/net/sunrpc/rpc_pipe.c
@@ -693,7 +693,7 @@ void
 rpc_unlink(struct rpc_pipe *pipe)
 {
 	if (pipe->dentry) {
-		simple_recursive_removal(pipe->dentry, rpc_close_pipes);
+		locked_recursive_removal(pipe->dentry, rpc_close_pipes);
 		pipe->dentry = NULL;
 	}
 }
