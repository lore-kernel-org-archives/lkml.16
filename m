Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1921819DFA2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746031691; cv=none; b=JUVD2oct252RtwEO1GyGuvgy0V1mvM59cN7hGvCkeWPyEjaKnhrh8U6iO+7q/37A9QNxKFZSz6EXKnbF7HNJ1AkJSdHmEpGyuK7hAoQoLY0BnFF3r5aVaLpUzi9S4KWVWm4/edJu1UXTKjHK7Q3b8foffV/oWNVzqI7HiauEDL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746031691; c=relaxed/simple;
	bh=c7FwnIsZRqiF7KNfIIwlZlGxxW/tuXrOwYx7tDSOD2Y=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LbAV/895SORc0WxtREfdgS3DnHS1278ApTk6eosRyYnHwLi3KRsQBxHuNpTAXjnJu3TBUPx/vg3eIpXrjcqU7W8RAXj4BYc5XXKYXZskCW3gT3otMDCi+ttDcmLSEOJgpqf4RfZhu1bdL4+5xOO64boaFOQFmZhh8pFHiQEVbfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZEqMwCM; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZEqMwCM"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-309fac646adso1166086a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746031689; x=1746636489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjAqOlz4ej8mAEvmPxCkrLJ8pkjvVteFBc1yiUvD/JM=;
        b=aZEqMwCMnUmMh4ipRw6lbwK7r6FDhpjJfUiQpdSwPVEHc7jFPu9hyMjHFQbO5gLmfg
         HpDwkukxRj25F/wlS0T1LRr2/mmyULgks/ir3s+12ijSkVVbjyLa0sqY+yBthIqt3Emh
         6gHIQg0hC6UHlzC6aPI3tZ9zir7CX15OiJe0c3Qd4w1QQoSf/BU06viXaEQL08bywSLu
         BW2QpV9YKGMofVWxV+mCRNg3mfdMIxHgP53t+R/ZILIKnLAzMcQ+CeP05BppY0oEg92p
         reuRQYb3FQ3rCGxxpII17+XZzEu+GNigDN9vKeVtkWN+H7gAqexVlNuITUBEIpRoz9aj
         BFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746031689; x=1746636489;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vjAqOlz4ej8mAEvmPxCkrLJ8pkjvVteFBc1yiUvD/JM=;
        b=WkUazOmqiQXhntvEG5amhWaDCFMoo8q8wAPrdZgfQDuidz19kZ6pZp7vZ04HfiIzNT
         efhX4N1Y2ru0nnPOKf7aYbBJMRKC6NaRTWxgQ76tPrAblAl8dlDZukOyWJO/mhHgym4A
         CqAns11qAYaBM7YYGzPJB8znC4PMepDPc/Ye2mGfVF3to/U5ZwG3Y9iKrAysqL4AcFk/
         +0p0rM1DVMslts4VTRGuWQDSYaPIye8r6oZ+QpXx7Gewx3htKSRxdf1YVuOKC06Gxl9J
         ScL3PJRKolhqJZ7l3cmdZ2+XtTKk8mNztWC9rzdIJjyDyum7w2O6hThqsvOpVZpx/+He
         smAg==
X-Gm-Message-State: AOJu0Yy30H2mftqCUf0rXgkoZnZEJ3JZgO1vW714M0QBDtbj5k8GRv80
	wygpeW9N6vaXDENY7ez61nulOuAG1Ev24T95xKjkl+s0Vr17iL4j
X-Gm-Gg: ASbGncsog+uQ4YwntT6CP+ZvJW4nLylUVCKkQ4Io90eCZv6VMYXqaqbmXGIs2CJZaUT
	9pxBu4kNxMnRQVEXVECFnbuqmkk4niEyzs4CPZNh0VaR9W+6Ap9ncy+X57vDZjGVrNOcwiPOKmL
	ZpVXiC4a85tFEhJf5XgcotHVZIGwylJEO6hUN4+l98RZ5kAZMGsfFqXcfkyqN0+mukqeikcIlqc
	vM8tLfJdLa8hZMB+f2PvKpi/AvLIdc0+PTBLrMkQz13wWZS+YWTg7u4BtH0bmNiqRsluxrixbvV
	cV7fRQxm2zEXL6Msc9gR1xOxz7auGUMSnYi5vX3YJravkKHF14SbjkXWTkov4eR5pc9zdpQVU+o
	ZulLQ9aPVVGkQUMFG
X-Google-Smtp-Source: AGHT+IEEVJ/H3Mg6YyIjqgKS7JBZvGm8HXIc5lSuL7Ma18Ik4b3Jxy5RHK5+1QjymAb+ZrN1/2ZIxw==
X-Received: by 2002:a17:90b:3c8f:b0:309:f46e:a67c with SMTP id 98e67ed59e1d1-30a3f078b27mr271150a91.11.1746031689158;
        Wed, 30 Apr 2025 09:48:09 -0700 (PDT)
Received: from localhost (i223-218-150-204.s42.a014.ap.plala.or.jp. [223.218.150.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480f0ccsm2064180a91.30.2025.04.30.09.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 09:48:08 -0700 (PDT)
Date: Thu, 01 May 2025 01:48:05 +0900 (JST)
Message-Id: <20250501.014805.2174568059164798902.konishi.ryusuke@gmail.com>
To: syzbot+f30591e72bfc24d4715b@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nilfs?] possible deadlock in nilfs_get_block
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
In-Reply-To: <68122276.050a0220.3a872c.0000.GAE@google.com>
References: <68122276.050a0220.3a872c.0000.GAE@google.com>
X-Mailer: Mew version 6.8 on Emacs 29.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Try removing unnecessary ns_sem lock in init_nilfs() to eliminate lock
dependencies that were causing false positive deadlock warnings.

#syz test

diff --git a/fs/nilfs2/the_nilfs.c b/fs/nilfs2/the_nilfs.c
index cb01ea81724d..d0bcf744c553 100644
--- a/fs/nilfs2/the_nilfs.c
+++ b/fs/nilfs2/the_nilfs.c
@@ -705,8 +705,6 @@ int init_nilfs(struct the_nilfs *nilfs, struct super_block *sb)
 	int blocksize;
 	int err;
 
-	down_write(&nilfs->ns_sem);
-
 	blocksize = sb_min_blocksize(sb, NILFS_MIN_BLOCK_SIZE);
 	if (!blocksize) {
 		nilfs_err(sb, "unable to set blocksize");
@@ -779,7 +777,6 @@ int init_nilfs(struct the_nilfs *nilfs, struct super_block *sb)
 	set_nilfs_init(nilfs);
 	err = 0;
  out:
-	up_write(&nilfs->ns_sem);
 	return err;
 
  failed_sbh:
-- 
2.43.0

