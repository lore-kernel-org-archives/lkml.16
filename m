Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228751DAC95
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 17:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748108465; cv=none; b=MhpN/GLLkCAeod3hxa4W11j/0LzOxgvkf8kgKiv9ZjqzCjcvi7QRbv/XxD5yAD3MSnvSByTDzhBOgmdXPn2gxEJuGKsCBEaUFw2YaYXLWk7ltsT3mExnsvhctRG3lPK9/89AHmk14cLZpfOlnIlATlib48occpt/7qZD2T4rv4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748108465; c=relaxed/simple;
	bh=TuNgtJMnjRFpRK7I2mER9pG5No8M/qugSKRb9cjm2YM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1HoL0FfBZjCnm97N+yLWTLaC3SvNSdd9jZ3GPGzehomWpZKMVmx1eGzu14HShxTPv85xb7eKBZzL4spifkXl9QsKh87+h0stLh/rEp/di3VjJq3A16coTlNfaAA2Y72y4+U7TJ2nTpCJZKKWSP+mzJFtXEAWXQlGIkLaytaLFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Buo0peoJ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Buo0peoJ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23424bf716dso66865ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748108463; x=1748713263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZPBXnG7HSBmqbiWmTWNrOkWpQQ+y5R+HY1LvXTO2eY=;
        b=Buo0peoJzluSL5VF1Vyr1NIwf/tTMJ14djwMj08Iv1GV0E8In61/v3Ece12Irxgqs2
         Ze/wOwh9PNtkkgkHYv52hqWqeu1LuIsoQ3UioLZneOlRPQgJtZbq+0gsK3ymWTaklYll
         AZA54UxqXOKqUPB1R2RPmyVA+dEc91yAy2+Kp7Vf3vRtYsJvFj/Smk3T7fVOfv/JUeWJ
         wAyEgcXv86Z4Xqr75bLB3zfU4v9qaN48tZl8PLqT5epFqEY+M9aVc8SEm+hyYsHTcnqW
         BOSrfGW5f8GfiHFHxZk8rvTNsSjADkXBYDmWukIz+lRzVO1szQyBjJq5bma/wkgELn83
         y29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748108463; x=1748713263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZPBXnG7HSBmqbiWmTWNrOkWpQQ+y5R+HY1LvXTO2eY=;
        b=kzKN5PSOYQ8qIpAK1Rr48MAFIbRXJy6Gjlb7tJlc8ZezZBxm/6x3GdW/LXXtg1VJx2
         Mb/U90NeQjJF/eEd3CzYMNm9r91EsY7FHuQY4fHX+mhKP6CJsAgwPZkYEh2dn275tDEV
         JQKKpuCSpcBO6sNGR1qf3QpV1s7blXQlAxHLHAG7ALuacEP2b5qc6s5GRkxIraGiUJKO
         ffiDH/EonrOu7a5jn6AzxSqSuLXkY6T/abNi8Ilt15oFLgKf0o93jGSiJUO0DAYEMNT6
         1eiBE+Rq8N4W7qF7LViGgQsOuFTJLvr0vYrgX7IfSOWD+cCZ0lo8/IB7PyCYQQNTbAOl
         mo3g==
X-Forwarded-Encrypted: i=1; AJvYcCVDxn6j452MkjEdq6k3vP9zfa0LNcffWvHVWu8MoQt36GM2KywFE8d/sICWJg1cVoNTzYiEhvzVxlN5rns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2LLqP81iuS4AICitoZUlXwRp3OKGkdp1cCnZbwKTkNkdr8v3+
	KuMzEmn1XvAmtpttTWEtu6c3wJ5Cpav1d43pLvQaP01VHMxYmU8DBVQscZKRURxh3w==
X-Gm-Gg: ASbGncul0GHqjg/PTyA6SbZbv4QqGUzwycsEpFRAnr+XJ8T3u3Rz3koeymKS0JBl0jd
	gvxSqZqybVDSkUFyMPIH+u8z+apO4L/1mDN9Qzo1lgIY38h7E2pqtphLfRukRQ7fXBUKNapE2Wf
	529un9mxBgXVu/uNLLP28bS+GQiRZ8B9XmDru0osfLdRoHsWIq5uGhrP53giRgUEJt3aw8MykSy
	o4OtJgBweY0fu0OzKqVXXlEwBwi5QHLfe5a97ZpN9cUihFljhSMfrQJmbqgtzI5uW38Bh07b7ff
	FoI1Te8JN7IQWWaMKkFnCh1fTsHhWUvr/2TP6kVrK/7gMpNvYNPPHa3BFqQSk2bibh/92fhUpaT
	/JPbT2j0jaFSrAV+tIvc01iZVyN8=
X-Google-Smtp-Source: AGHT+IEkifjdDD3/w0oIrjqe1F+cIlr+mGBuJxo2IrA6I5t6aS2mWHJSW75QyDtVv6YK12fr05nicw==
X-Received: by 2002:a17:902:d2c9:b0:216:4d90:47af with SMTP id d9443c01a7336-2341b559cb1mr1257245ad.29.1748108462900;
        Sat, 24 May 2025 10:41:02 -0700 (PDT)
Received: from google.com (137.184.125.34.bc.googleusercontent.com. [34.125.184.137])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5cae2sm14584521a12.1.2025.05.24.10.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:41:02 -0700 (PDT)
Date: Sat, 24 May 2025 17:40:57 +0000
From: Carlos Llamas <cmllamas@google.com>
To: syzbot <syzbot+4af454407ec393de51d6@syzkaller.appspotmail.com>
Cc: arve@android.com, brauner@kernel.org, gregkh@linuxfoundation.org,
	joelagnelf@nvidia.com, linux-kernel@vger.kernel.org,
	maco@android.com, surenb@google.com,
	syzkaller-bugs@googlegroups.com, tkjos@android.com
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Write in
 binder_remove_device
Message-ID: <aDIEqaNaLBChOlg9@google.com>
References: <6831b67f.a70a0220.253bc2.006f.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6831b67f.a70a0220.253bc2.006f.GAE@google.com>

On Sat, May 24, 2025 at 05:07:27AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    176e917e010c Add linux-next specific files for 20250523
> git tree:       linux-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=1399a170580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e7902c752bef748
> dashboard link: https://syzkaller.appspot.com/bug?extid=4af454407ec393de51d6
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108b55f4580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1145e5f4580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/5f7692c642fa/disk-176e917e.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/057a442d42d0/vmlinux-176e917e.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/8f8ebdb4dd96/bzImage-176e917e.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+4af454407ec393de51d6@syzkaller.appspotmail.com
> 

Oh, I know what is happening here. I believe these would be the steps:

  1. There are multiple devices in binder_devices.
  2. 'binder_proc' of device X dies but its release is deferred.
  3. binderfs is unmounted, decrements device X and waits.
  4. 'binder_proc' is released, kfree's the device without removing it
     from the binder_devices list first. Leaves dangling pointers.
  5. umount continues, releases next devices but list is corrupted.

This should fix the problem...

#syz test

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 8d9c5f436fca..6be0f7ac7213 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -5246,6 +5246,7 @@ static void binder_free_proc(struct binder_proc *proc)
 			__func__, proc->outstanding_txns);
 	device = container_of(proc->context, struct binder_device, context);
 	if (refcount_dec_and_test(&device->ref)) {
+		binder_remove_device(device);
 		kfree(proc->context->name);
 		kfree(device);
 	}
