Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EDA4B1E5F
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 17:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747502187; cv=none; b=YKAsbsId25aRIK0PnSgHK2Fh5vGA/Jkl9JswPXH1ACds56r9rd80dHrPbdipIrrAR4vvFIGBWpt8MRv1mmuZgJIBxSE3te+b59ROS/FdLc673fBnzbz3xnoXgK4AjlYW8Cbf+qrOvzPIlhOzu4CRHCbGMO8CxM8dQE4gZQLZTkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747502187; c=relaxed/simple;
	bh=9Yzm10CwF95SdEp6HZeRuq2YqwK9KCVypv6FFXSxmII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMd+3Snu0Ov01i0eY0F/dRBYBJIwJZ5+LI3IK/1XlJNCNIjUMf5Xz/8il7wcX6YYiHz7mhkJFueif5UlrfQ7wx/xxfZdcwLxtTEikhccfViMl9iByVaPD/T9yeOubte6O1HOS40iAOlDgzQZvBlJVF32X9+uJMSvc28aiT2gx6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lI4R0Ttv; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lI4R0Ttv"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-231f6c0b692so121765ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747502185; x=1748106985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oECJK4EhKG9tEX+cHzZsFBNImVK6Jq7EaOv6UW/zHFM=;
        b=lI4R0TtvIGD75fsqrSgXmIFSAkO2up5GxvxL9t+0JHgWxumaU5T68/Cf80aY7M8UzL
         m8upeud/P81Ztc2dIf7DuKB09gOFmNX7wMt+t9yWbRS3NtVYweL8BXkdNlf+8tatgki0
         TYPO+79RU+1/cP6U/9xNRJB8Hrl3xchUT8vqdIz2mjxlOFVzidYR0uj8JJCwy3TSfCdy
         8316CATac8ZdUXBDMvZFDLjQVV/LuAS5HxVVUs9W1WAERh9/rT8TIrxxLyM2G2X1s85r
         YQuFOlYfFM1CC22z03wIgCFQpC4vtHdvx6sENkZkyfQhdFrC3RVbRxaWodQ10HDLun+v
         Gw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747502185; x=1748106985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oECJK4EhKG9tEX+cHzZsFBNImVK6Jq7EaOv6UW/zHFM=;
        b=Ra0dGiGXSBVytmC919dSVFLfrbli/G/TNPeVbwjD9s//b/qSc8XnWCAG869H09HE35
         ZTaFRw17CAQihAkBe7SURsZMyefPbfnFm1U6BThPb815oN3oXQTzaV0IVYhBTv4zbg8b
         2/AjJySNZGLMNEO22HUUfifmynfFnH6BFjGSfi64seNzdQMcT2U9oQfTLIX9+k+KiM8i
         v3oAkVQvA+tWPV1LBR2zC0YfhRbvUPNSkvZ6P6Lr2PmfFkpmbIs4ZSKjTLAQjeKjTsvg
         gGbCoGzj+2Mw8TCG4z9l4/SkMV/DCt3QbXaMmyXFKinBqyjLDvgb3JdUC6WPbCcdP/IF
         RquQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1YVmV1RUlw/0UAU2nL4uhoAKvLnH69zojEa1Ul7YojtB0brV/pUeNzrHw2o+rmj37Do1bJsdm7UAeJnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIr59ZklmWFHvxVbWbsqIDmhM5UH/3pAr+A6NVooRBhXFujSSH
	Ll9gefexJZ9jz1JXJqHLMNbjxE67ZtSp4gFGmQvXNC+vbl3oZbgwFDcTCQxzo+xkpQ==
X-Gm-Gg: ASbGncvEBsYo3gEtvZL64SV+ttNqEgR0OnqORTTR2K3Ep0Whf9btEAfQEK2sXjFTMxw
	Id+C2SMJIbRfNniPANY2LONCjsfaF9+QsasUwdDbaRxTsinVyFihGjjp4ZPifJPEvL/D+s5uQ9l
	XGFcz4/5kmZagksFliinmv2iuX3JENH1jCuuUKNzAi8wD+KvKjs+0nyKzIrHowBIyBicjEtLf6y
	iquHqwHH5xJH8wkfir9Zmcfnv67g5/ju8QRNUHle+OJZoMvkYibbiZBABce56cDO3w+hhaHID7w
	TeQwS6J3hITx4HYXAMBqosCqHwlIijKeZl26sqI9zeTluBWgnEGwoovcfrFEXqxtFKrwXlUquxQ
	YGCZyAYrL
X-Google-Smtp-Source: AGHT+IHCzf2+CRo3mSqfC+qoKsF+v8pV5dFUA1q/UEvjV0QSvMCIsf9UZncP3X3FcZbBm9pBKEF2yg==
X-Received: by 2002:a17:903:2ace:b0:231:e069:6188 with SMTP id d9443c01a7336-231ffc4c0efmr2243365ad.0.1747502185056;
        Sat, 17 May 2025 10:16:25 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97de4sm32692085ad.144.2025.05.17.10.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 10:16:24 -0700 (PDT)
Date: Sat, 17 May 2025 17:16:19 +0000
From: Carlos Llamas <cmllamas@google.com>
To: syzbot <syzbot+c3763f82ee2ceaf93340@syzkaller.appspotmail.com>
Cc: arve@android.com, brauner@kernel.org, gregkh@linuxfoundation.org,
	joelagnelf@nvidia.com, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, maco@android.com, sfr@canb.auug.org.au,
	surenb@google.com, syzkaller-bugs@googlegroups.com,
	tkjos@android.com
Subject: Re: [syzbot] [kernel?] linux-next test error: KASAN:
 slab-use-after-free Write in binderfs_evict_inode
Message-ID: <aCjEY1X85xUne3Ix@google.com>
References: <6827b414.a70a0220.38f255.0008.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6827b414.a70a0220.38f255.0008.GAE@google.com>

On Fri, May 16, 2025 at 02:54:28PM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    8566fc3b9653 Add linux-next specific files for 20250516
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=10b776f4580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=aa3444b6d01e5afb
> dashboard link: https://syzkaller.appspot.com/bug?extid=c3763f82ee2ceaf93340
> compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ac394ca3c315/disk-8566fc3b.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/170dd88bde87/vmlinux-8566fc3b.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/c097fa83c7d7/bzImage-8566fc3b.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+c3763f82ee2ceaf93340@syzkaller.appspotmail.com
> 

#syz dup: upstream test error: KASAN: slab-use-after-free Write in binderfs_evict_inode

This is a dup for which Dmitry had sent out a fix for. However, Greg was
never cc'ed so the patch was left in limbo. v2 sent here:
https://lore.kernel.org/all/20250517170957.1317876-1-cmllamas@google.com/
