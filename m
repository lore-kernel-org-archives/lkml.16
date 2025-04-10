Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725322853FA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294994; cv=none; b=H9WqjfM2o0O/Y38OK243w5VITGJ/wCzrJDKCFuIS7MvigESqwt3Sxvt18mVAgSFtfLlfOlaOFZgiu5ogyXLHBncfD6kI5iIB3W2FVAYwFpGnyXVoqcKs+GnxjGM9ppMkSyGT2iD3osTyShgO6g1tR808nl13BwANVH7rqSXhhgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294994; c=relaxed/simple;
	bh=cPd0HaZfcHI9ymCKPUFclwMiYTlolc/d7pNh2y7ziTI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T3+ul9uP86tK8hKsMVx8dSpuqn8HcpY+LlOfAm77pTMd2cW4X7ZUQQlXIBkiHOjNdIWa9idDHVarv+efhLba9kAnEopxiawPkFdiT+Ir7DGspwo5VAUFvw7+bkHfHai9fOTTZTx5kpInIyufKQGBtAy19rNgvWguyov6UXhrrcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85dcaf42b61so209772039f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294991; x=1744899791;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBqy0nRRvbIayE8rNb1r8XGg12QZ/fnlUefD01PF8lw=;
        b=V/M/StgDdAE8j70+5QXvdeufyYLLEJgOxLNCyISzm3lkwQTfcZlRBk7YjkoVAvslMV
         T9uaTMMPY7GevbbDRS4Cqqo4ka0zQsuZbSUw7fRbJuEHCnOqbVuVyWkOMh3lI+qPlBYD
         0jQPUH+1lpGWrDJPcaIUCyZIWrygPXtQYuZjer/248KyALJ1IJ38QAL04nOdmx+Bq6l0
         7W6/x28kETwfdWdhvvH/jgqWeIk4uov0hHTI26N/C3A1GjwMPi9ferBKnVFn95itdv5H
         UCmTdzncT9fuOU4SgMmjgdUhEVP4yn2tTYcEA7eQpgyHyx0w/0BXLrK0zQC5LI+D5Htv
         yH2Q==
X-Gm-Message-State: AOJu0YwVWzJHMCWqKKPpeHI64GHKdX+Fgcr0s2M6IGsIDtBYt9gCdJA7
	LyrH3p3uQNELN5simzqdf2PKq1rWZEFS5IPKD5Bv+MxDB+vQ4bwHHZFOT9sn2TKrxUBgQ7B0R6x
	8T2TITQI0gDHZ0PlE6NpAxxLiShKEtxqKzwA1bByxA3h63svB8Z4TlHY=
X-Google-Smtp-Source: AGHT+IGiccCLLaQiruWWE+CPs/oQVNYUKc+YL7O7dds2nLAI7Z6OaRkjBlErZsdBVEuCxpOKx5nC5bR2blRz3MBcQMypDxDsQ/z0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cda7:0:b0:3d3:f4fc:a291 with SMTP id
 e9e14a558f8ab-3d7e4781c05mr36997205ab.19.1744294991485; Thu, 10 Apr 2025
 07:23:11 -0700 (PDT)
Date: Thu, 10 Apr 2025 07:23:11 -0700
In-Reply-To: <67f26778.050a0220.0a13.0265.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f7d44f.050a0220.355867.0004.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [acpi?] KASAN: slab-use-after-free Read in software_node_notify_remove
From: syzbot <syzbot+2ff22910687ee0dfd48e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [acpi?] KASAN: slab-use-after-free Read in software_node_notify_remove
Author: lizhi.xu@windriver.com

any link create fail will not get kobject

#syz test

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index b1726a3515f6..5c78fa6ae772 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1080,6 +1080,7 @@ void software_node_notify(struct device *dev)
 	if (!swnode)
 		return;
 
+	kobject_get(&swnode->kobj);
 	ret = sysfs_create_link(&dev->kobj, &swnode->kobj, "software_node");
 	if (ret)
 		return;
@@ -1089,8 +1090,6 @@ void software_node_notify(struct device *dev)
 		sysfs_remove_link(&dev->kobj, "software_node");
 		return;
 	}
-
-	kobject_get(&swnode->kobj);
 }
 
 void software_node_notify_remove(struct device *dev)
