Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989FF339A1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744332705; cv=none; b=ciShemotCcWRWmwGTMl9JVB2KArxO2mA6yzITOTM6Py4o+A0n7DyFnCYjcOJ3/o1bW+dLpguKYIL2nnA7WlzcUoZ2gyvSnQ7R8Bnq0EX5/19aQgzfzMmvK4j6wOrrEsD4sbJ1YLIb0cBohpStQUSZGApIr7YGSqlbflS4s6aImY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744332705; c=relaxed/simple;
	bh=IEP3rqifU1tIsQbQc9VDOCa6QO+KC2Gz1sa71nAMnsI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=a6Edm4GrtctRaf0qAxdweb2S56XpICDKektHFoKTeo7qA2FHzGm74UW+I6nlg8uM2cXQZ7OBtgZJwU9cSUDVMgEMa7m+c0gTAAUH1112X3tM5mzVN9n1XKo1c+JaAokd0aCc0vEZn1UehUS4ATdnsj9/1BuP13W/afKPCT8lPXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85b4ee2e69bso158332939f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332702; x=1744937502;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idpPrGTfB1fOM/owthYM0865ri8hrMhLiBjxpxye+i0=;
        b=dBWwvLfRwaA404L5yNjiYAiwiqR0MwOt3Jb9h07LRj6CVwlmbzCwvh6tt96n4cl4o1
         JRYndDhfoEJNXxsqBx9Mv0kRaso4ciFeYlQnZXWmdB9sjqxRZp7QdJnMUu0RUlxa5jBx
         uuMjoxhPA/535jkTAd0i6mw+SgnGP0lZqpLv4lytbzeRRAEa2vCV1seNyL1s4BNaVFpT
         NoJ5k/+Hj8q0vJzhwFhO+/sP1ETh82+8AT6wq+BTMZ3wRRhHPvVT7IJ6zDefIKu9rwzy
         pOHNjOZj9wQRTcuYLJS+bkpprlD5ukHocFWBSx7T9HmPdCTG0LzvyWyb6kB09q5d4LKj
         Bu1Q==
X-Gm-Message-State: AOJu0YykHi+TMm6C7P4PBEn0KAvxKmcTyQrNWeDAfEsf48MWDKiLxF4c
	il5HTPS+hu/3xEemjDZSv+aiJGhUpBMrLG2m7rLwu0IV5J1lDQXw46Q+RgzWvNket7ka5oJ/wS9
	MMPIGbfvZoE/DBSDDaq1vJLCpEoB2yMWG5wxaqQ0vqImjKq4gkqeEqWM=
X-Google-Smtp-Source: AGHT+IGu3uDb0XR6QNjre9vZp+qzyGAKPSx3wCY84ly6nmuBb2M5Bob4FuFXlZk0drLTvahVADgAttYrnd+W+Zp9sOWztdncoy2B
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3b89:b0:3d3:fdcc:8fb8 with SMTP id
 e9e14a558f8ab-3d7ec2035camr10335485ab.10.1744332702671; Thu, 10 Apr 2025
 17:51:42 -0700 (PDT)
Date: Thu, 10 Apr 2025 17:51:42 -0700
In-Reply-To: <67f818d3.050a0220.355867.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f8679e.050a0220.355867.0018.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL
 pointer dereference in generic_file_read_iter
From: syzbot <syzbot+e36cc3297bd3afd25e19@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [ntfs3?] BUG: unable to handle kernel NULL pointer dereference in generic_file_read_iter
Author: lizhi.xu@windriver.com

missing direct io func.
#syz test

diff --git a/fs/ntfs3/inode.c b/fs/ntfs3/inode.c
index 3e2957a1e360..50524f573d3a 100644
--- a/fs/ntfs3/inode.c
+++ b/fs/ntfs3/inode.c
@@ -2068,5 +2068,6 @@ const struct address_space_operations ntfs_aops_cmpr = {
 	.read_folio	= ntfs_read_folio,
 	.readahead	= ntfs_readahead,
 	.dirty_folio	= block_dirty_folio,
+	.direct_IO	= ntfs_direct_IO,
 };
 // clang-format on
