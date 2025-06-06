Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E4E42AA9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212657; cv=none; b=ofCSStYgGFgzN9BN0ql+z2y7gNWbs9KYiNvG372r0teykt1zMD69nNcRN3CJF1F09zy2smLQg8felJyPvZ2DoSk0nQLRmFReIctOf/sPtTsX7uhJcXE3Pl2932PttWry+2XvamvgbyLOvg1em0pLmmrszJBd5uvKKv0VdP//XrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212657; c=relaxed/simple;
	bh=n8VgKv1z3X0XUZzJmQW3GrUng44F+kGqfY4rB/HrDfA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=D3DPrk+ztyIsO/S+g0mpTS0U6qsMAA6ts+7ZLk2rv2XQJjUC7Q5/NDR/LnX+7vTDI7HQp+hzEyKzFjPdRon3A4siScFL7DIVsQLexkleX69XO7/TdRzBHkAX7Rbg8GCkJJr1vGqBL54YxVznI9ysp3pNcr2MxPAtvgU8+UQLodE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86cc7cdb86fso198304739f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 05:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749212654; x=1749817454;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i63LlcEsT0J9Rnj0jXtmJ6XsBX0WHYzXOxUzGxALE/c=;
        b=mioB7sBe5jgxzY1aWRntvRZpqwrwmFppswwKdpvLlxaJd4Xh8FlKkdu+D/kDge+3o0
         OEC0UxgzjbFtX3g94pZsZfpZrl6iul9ByQifcA6BGudH2cr0gJSBuHZy+7oDOHY8bxHh
         KkF3AqbXlHZ+jb3e+GVqVP1GcZbtPNMvh9lwBdBUzzQldG047IKIohiFztrN+1kLCOld
         ZsAsn/bW6QIJVEJrt1z7o2pxW6PDKLhEPrPT0dtdJaspDj7p5cTycO6KSHfz+0Wwa8MT
         /TOJnLtgbB0sL2DGOnk7z2amMRQAiQst2Ca3P+odlgwq2GvTmgxP8jnRtynPSayH6mJC
         yXJw==
X-Gm-Message-State: AOJu0YzQkd9iPSKq6WQa5MzObqfnkXA4RX723RQsQD1ehG7A3H6jkl6S
	s7geWbLTLTHiwVc2WTDMhq0TVYDt5Dv31FzdanBJ4GlYj6vZDShzaNsnHWtV6sWKJNWF7WfxKKj
	z0Q3+7S4MYZdQ9buBeHVFE0dT9M1N7a4BE+k3K1WAmlHDt4XwJacZYYn3bi4=
X-Google-Smtp-Source: AGHT+IGQ8QOPqrYOb9zsCVrr+v50l8yPSpC375A2WJX7QdL5Gwe6pajLOIWPIWzy9XcP5/ITwSjDypOknFm8kDMdlXUkoixCC5XX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3090:b0:3d9:34c8:54ce with SMTP id
 e9e14a558f8ab-3ddce4a9ff5mr37882615ab.18.1749212653917; Fri, 06 Jun 2025
 05:24:13 -0700 (PDT)
Date: Fri, 06 Jun 2025 05:24:13 -0700
In-Reply-To: <684298d8.050a0220.2461cf.0039.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6842dded.a00a0220.29ac89.003e.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [trace?] BUG: corrupted list in ring_buffer_subbuf_order_set
From: syzbot <syzbot+05d673e83ec640f0ced9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [trace?] BUG: corrupted list in ring_buffer_subbuf_order_set
Author: hdanton@sina.com

> Date: Fri, 06 Jun 2025 00:29:28 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    cd2e103d57e5 Merge tag 'hardening-v6.16-rc1-fix1-take2' of..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17f0680c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d97b092471e3ab82
> dashboard link: https://syzkaller.appspot.com/bug?extid=05d673e83ec640f0ced9
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1795b970580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13b281d4580000

#syz test

--- x/kernel/trace/ring_buffer.c
+++ y/kernel/trace/ring_buffer.c
@@ -6909,7 +6909,6 @@ error:
 	buffer->subbuf_size = old_size;
 
 	atomic_dec(&buffer->record_disabled);
-	mutex_unlock(&buffer->mutex);
 
 	for_each_buffer_cpu(buffer, cpu) {
 		cpu_buffer = buffer->buffers[cpu];
@@ -6922,6 +6921,7 @@ error:
 			free_buffer_page(bpage);
 		}
 	}
+	mutex_unlock(&buffer->mutex);
 
 	return err;
 }
--
