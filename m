Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109091E7C0A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 07:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738567744; cv=none; b=j+6RXacttgSkLc/+zL9sWsdvAt+7wUIjv9hBZSWOx5kVVfY7woH1DujkihhlLlU9cZlIJ2qGEB4tKM+bOtP4KfV/ZHWM82zJNInLnf3k+FUowJYM52eNQH+xCRlUd6ruO57/5nlORC0aqAm2p/PZHlkGdkHwYj8smkbBdzMgqL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738567744; c=relaxed/simple;
	bh=XeIpuRQMJIlW1z0fal8pdAB50xYWSgyCUFRIX7A8NKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uuxQKVyNFMXfVuSbatHx5Adz9lw76iRW/8QZW8ogKTbl8NuI1+l66oJqgYBMGtCOP/nvGpklX0L7wuOPFG9IFgGXXf5l5dZ5dekGgVEqPiOzoJn4sex6zj+9hWII1jmiLCwCgCFVj0OaoaIUGQGmqEzscxdXbrPueWFCg3FwyRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIzwIM5q; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIzwIM5q"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21670dce0a7so82830265ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 23:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738567742; x=1739172542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hHRBaoZZAn7HZYpuDwNQB0vJ7MEVY/asMo+2kbuxZuo=;
        b=YIzwIM5qFwPelI8Ye+I7oq/2lPPmwvQMJaTL3dApA6P/ORdHc7QAHruVY+E9ZGO30h
         n5CKUTW4VH/cYqCXVKoSV6nqK8uc1qLuA0H7hfnLJSx+Z+VJyrLJQ3oLd/+SyAooBVuh
         uopbGat3q8025FQrrGt8fq5EU4Ge7BwSSXvdF8GdFfsB5SczrKWaB1oA+jQV37xCTwFl
         wa68GO9NK0jvXMe/WyerrL6p4J3bobTIH0rZ0+vbzkgXRwQSewN944sRALbOt8LEksxd
         AnzLNAkpkBiAXcoGO680YbmuKQFjnEZLdJHXZbNSBm7Uy5leshk+P14O0Qh95vkVc1TI
         qltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738567742; x=1739172542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHRBaoZZAn7HZYpuDwNQB0vJ7MEVY/asMo+2kbuxZuo=;
        b=p2SS+sB8a4vbTAmNvDa/wvKhtjdPDlZPEeq5qhC4XJHs2KU7ln6rMRV8mq1B0SUGCq
         OTp/BilN2kHs01KfXVk/EFogYs1a8TvA57eEBdVhutoxFj5yT/YGec43N+vcDIynn1rW
         feK6XUBS7A7Serdb7GUmsThx8rMCSftfJfomgvSBlafffgHWl2c3xzkXwyMY1B5kZJgc
         /fVANj2zgG8DvFxa/QexZvUS1UPpa13XCOPxekXknBjou0qc5sg6hDK2owLhhoFoho2W
         EA70xXSVit15wxr8PygighTzFRzbUOdA6Ru4s8vmsZqxxGaRTREdQdhEhwO8Bd/W0reo
         nyvQ==
X-Gm-Message-State: AOJu0YwrK2kOnkbUNQAZdkOh2GU0QvAibY0wlZVyxV9Mheb1l0x9kK1g
	/YAoowcNIDJlSP34obPXjVC/mes0WjVK6Ykrc+Wo5iaHNAOVcik8
X-Gm-Gg: ASbGncvrYtPFAnk5wNeSML4Nsgeefc79PuYa52RMV3k840BL9GCI98pmgtimuT/FIsj
	8DLfQZp+iahSTwndQmmlIbbmgfgJvPBAihz+xU0G1Y04QO+0fkzwtuJXxHLKPuMJEl6/Wzcdv/W
	lFpZuA6YjE/Nlai3WfTyfKBRvr8KamDGdv4cwVhwiiztRY5bRe5dGZlQIrn9r0yRvQS+Kl3CuHp
	aanaHGT6scQKmAmFxA+YYY6pn8c/Tq8qA1JYKnXzxDcUmOWg0Dpli+c0TvvpV5qDQePTkGOSHge
	obiF1wWT1QVAvKAS34MlhYghrGeyWuW+c5Hmf8mvVpe1p8wtvM8ezZQySkpeAN0REKyLsOjVZxi
	NmzcjDQ==
X-Google-Smtp-Source: AGHT+IFH/XJCYdDBneqKSraDvWko+3HB3SmHNQ8ZbeLpvvxAVKMT2WqxUge0qpuDTAPyVW3zc4rwJA==
X-Received: by 2002:a05:6a20:1596:b0:1e1:aef4:9ce7 with SMTP id adf61e73a8af0-1ed7a5fafbbmr29908838637.17.1738567742171;
        Sun, 02 Feb 2025 23:29:02 -0800 (PST)
Received: from linux-dev (c-76-21-65-106.hsd1.ca.comcast.net. [76.21.65.106])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec047944csm7272733a12.54.2025.02.02.23.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 23:29:01 -0800 (PST)
Date: Mon, 3 Feb 2025 01:28:59 -0600
From: Gautham Gujjula <gauthamgujjula@gmail.com>
To: syzbot <syzbot+08d8956768c96a2c52cf@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [ntfs3?] KMSAN: uninit-value in longest_match_std (2)
Message-ID: <Z6BwO0utCjxMG6RI@linux-dev>
References: <Z5m8gtq402m-KfE2@linux-dev>
 <679a131a.050a0220.ac840.02d2.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <679a131a.050a0220.ac840.02d2.GAE@google.com>

#syz test

Hello,

I've been unable to reproduce the error from this patch test by running
ktest with my patch on top of 05dbaf8dd8bf ("Merge tag 'x86-urgent-2025-01-28'
of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip") and 2014c95afece
("Linux 6.14-rc1"). Since the error appears in the boot sequence before
the actual reproducer executes, I don't believe this patch is the
suspect. I'll resubmit the patch for testing, and take a deeper look if
the problem reappears.

Thanks,
Gautham Gujjula

diff --git a/fs/ntfs3/file.c b/fs/ntfs3/file.c
index fad68ff0b6ed..6fc4f960f4d9 100644
--- a/fs/ntfs3/file.c
+++ b/fs/ntfs3/file.c
@@ -1122,6 +1122,13 @@ static ssize_t ntfs_compress_write(struct kiocb *iocb, struct iov_iter *from)
 					}
 					goto out;
 				}
+			} else if (to & (frame_size - 1)) {
+				for (ip = to >> PAGE_SHIFT, off = offset_in_page(to);
+				     ip < pages_per_frame;
+				     ip++, off = 0) {
+					zero_user_segment(pages[ip], off, PAGE_SIZE);
+					flush_dcache_page(pages[ip]);
+				}
 			}
 		}
 
