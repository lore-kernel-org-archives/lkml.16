Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACEA2701A4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745449084; cv=none; b=TUAZA5YB93WlgnuJhKoiI1FnXfdFg78+KQWzyIf7qzEMtOCFnGeRyVaKhDyRS1qnjH6T8NsAxc3R/MB/ph96wTw5BoUoLBJ6jlhdB9VljrtzJcoHEgRxziNBwtezV7W5LQbsUzMJrJiC1zmSKd+Mh+dfti3/5mwOI/MeD67yASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745449084; c=relaxed/simple;
	bh=/4UucL9OcZlLE1S45vGuepvKmt16lIs23KtTTy+xA0I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jlj/6AgKXYCOgfBgIDoSLr50sA28Nhy4aSvSyv4etHUanQluBNEWfBfol7bQpSAGjRIxLTD1CMesaQEv/A/u+Y6DWqIeX6zhGJZhSUb85011R2Kiy/gsJY8kD7U5PbhLgA9Y5t5ydrKZgWmNBQ3y3o29/6koUG5L7KZ5E9CcIgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=SNAREsU3; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="SNAREsU3"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3cda56e1dffso2610975ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745449080; x=1746053880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nEu7FtyxOTjoxH8k/xvlBTXItgCBkcLdRHMwp3SvrfA=;
        b=SNAREsU3vTSMUcc6Id3hic0KSOkZuL2+Zb9NbZ0OBj323wHoTP1G26s48H4UJBudap
         5Rc+4NtpkasQc4/rmp+ocS/9D6zfRoaxh3D68GHErIBGhR8otlUShlkJ/SYYAfiOVWtQ
         x6IajrALIfjUFoXMbu+zFtFVmjxcSnpc7jx/yVW+jlDnDWrPPT8b+/xfb9hhZy8U0ZUN
         tJPPPozsB/JN3k5aMVpdna07BLJVvmkFOAE8uL3wjNMCyqyVydJJiUVteZHNYEYCC+lh
         Y2M50syLASatyEQJfSNxNBnZ9+vr+GJyXkcE5p6J7MlT2hzjNl5O96M04/RbtVLRXAfX
         /XaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745449080; x=1746053880;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nEu7FtyxOTjoxH8k/xvlBTXItgCBkcLdRHMwp3SvrfA=;
        b=hSqbQSyNmHvFEQNFaj2XQURDr1ZA0kI+JD/tnjWC/4FwobVke9qkWsVF4wnZs97D3E
         QJTpjGPieYXHeL2d/KpCsQ1UCj78skXLVxSYnEzORghxk4QuFbPYuWus71uCyAPOROdn
         UpA4nSmyFVwLJDN+beK2RisoFevAFqMo72PP7nKdZrS1E8TrZKlLZ7JXtxL433z7icd1
         j1ll4S+zDgISgiR3LGAUSaxvkUKeUutHkm2SrMmFulppypvUyoqQnshtVsXCLHpSdzio
         1RUE0DdQ/eeTmBu6RNREJjHlmDAjEqc5+b2uEJ2UPa5/2J0VUw7vD5fLHMEx+psZsVU8
         oAjw==
X-Forwarded-Encrypted: i=1; AJvYcCVr4wX7Gq7EcnEr1CeO872OeMquWrZJfmtMpex/N8qYJ/+o9ewoyLbmLFRUdHPaAJmXAK3q6ra8tXZ0rHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo6H0cyjTIgtPt9ulge3MFcR5g43n+4lNlCXZwNlPNN1d+j8nA
	1Pj9qpdn8LfbVhf3SSge5c1Hg9tfrmrFCFjgCjft4EhqL4eSbkd7Wq/oiXD9l1A=
X-Gm-Gg: ASbGncvD4WYU8ANvg+Gnfx3mqW9Ed9jYuWsIfAFLLHravh8L1aTUgVMnhL9NQSfDJwE
	jCnaW0BCFUCdBeZhAxY9zDX5hBmfOYKNc/SX7Zbil7FWKPDM47BmCyarW6jsxINRluhx/H/9f94
	WP83HUh1Jvbhd9FchvI9MKB4VFCMsQNfVzZhqWwscyYjEN7HGOxgh475JmmNWATygXOnm2Jcwvg
	5/F42SZMhHFGNbPzAJSXe0Uy2RO9evBm+uy+pN2h36eGeBZ6Svcfq3KIXOD5pYDGWY5JJ1TrOon
	v2RxNpnftG2LSZyqtd5wpg0S4zpKXHwaE4MVQV3aj70tVFDr
X-Google-Smtp-Source: AGHT+IH1BGArJHSmQ1z4igvxLHm34FM/Kao2fQH/vkfme/lYyWZaPS1lcFv9aGEXqQEZu1RKSF8Qag==
X-Received: by 2002:a05:6e02:1a25:b0:3d8:975:b825 with SMTP id e9e14a558f8ab-3d93038f94bmr5164455ab.5.1745449079826;
        Wed, 23 Apr 2025 15:57:59 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d9314b05a0sm191505ab.4.2025.04.23.15.57.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 15:57:59 -0700 (PDT)
Message-ID: <cac3a5c9-e798-47f2-81ff-3c6003c6d8bb@kernel.dk>
Date: Wed, 23 Apr 2025 16:57:58 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] io_uring: Add new functions to handle user fault
 scenarios
From: Jens Axboe <axboe@kernel.dk>
To: =?UTF-8?B?5aec5pm65Lyf?= <qq282012236@gmail.com>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
 akpm@linux-foundation.org, peterx@redhat.com, asml.silence@gmail.com,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
References: <20250422162913.1242057-1-qq282012236@gmail.com>
 <20250422162913.1242057-2-qq282012236@gmail.com>
 <14195206-47b1-4483-996d-3315aa7c33aa@kernel.dk>
 <CANHzP_uW4+-M1yTg-GPdPzYWAmvqP5vh6+s1uBhrMZ3eBusLug@mail.gmail.com>
 <b61ac651-fafe-449a-82ed-7239123844e1@kernel.dk>
 <CANHzP_tLV29_uk2gcRAjT9sJNVPH3rMyVuQP07q+c_TWWgsfDg@mail.gmail.com>
 <7bea9c74-7551-4312-bece-86c4ad5c982f@kernel.dk>
 <52d55891-36e3-43e7-9726-a2cd113f5327@kernel.dk>
Content-Language: en-US
In-Reply-To: <52d55891-36e3-43e7-9726-a2cd113f5327@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/23/25 9:55 AM, Jens Axboe wrote:
> Something like this, perhaps - it'll ensure that io-wq workers get a
> chance to flush out pending work, which should prevent the looping. I've
> attached a basic test case. It'll issue a write that will fault, and
> then try and cancel that as a way to trigger the TIF_NOTIFY_SIGNAL based
> looping.

Something that may actually work - use TASK_UNINTERRUPTIBLE IFF
signal_pending() is true AND the fault has already been tried once
before. If that's the case, rather than just call schedule() with
TASK_INTERRUPTIBLE, use TASK_UNINTERRUPTIBLE and schedule_timeout() with
a suitable timeout length that prevents the annoying parts busy looping.
I used HZ / 10.

I don't see how to fix userfaultfd for this case, either using io_uring
or normal write(2). Normal syscalls can pass back -ERESTARTSYS and get
it retried, but there's no way to do that from inside fault handling. So
I think we just have to be nicer about it.

Andrew, as the userfaultfd maintainer, what do you think?

diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index d80f94346199..1016268c7b51 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -334,15 +334,29 @@ static inline bool userfaultfd_must_wait(struct userfaultfd_ctx *ctx,
 	return ret;
 }
 
-static inline unsigned int userfaultfd_get_blocking_state(unsigned int flags)
+struct userfault_wait {
+	unsigned int task_state;
+	bool timeout;
+};
+
+static struct userfault_wait userfaultfd_get_blocking_state(unsigned int flags)
 {
+	/*
+	 * If the fault has already been tried AND there's a signal pending
+	 * for this task, use TASK_UNINTERRUPTIBLE with a small timeout.
+	 * This prevents busy looping where schedule() otherwise does nothing
+	 * for TASK_INTERRUPTIBLE when the task has a signal pending.
+	 */
+	if ((flags & FAULT_FLAG_TRIED) && signal_pending(current))
+		return (struct userfault_wait) { TASK_UNINTERRUPTIBLE, true };
+
 	if (flags & FAULT_FLAG_INTERRUPTIBLE)
-		return TASK_INTERRUPTIBLE;
+		return (struct userfault_wait) { TASK_INTERRUPTIBLE, false };
 
 	if (flags & FAULT_FLAG_KILLABLE)
-		return TASK_KILLABLE;
+		return (struct userfault_wait) { TASK_KILLABLE, false };
 
-	return TASK_UNINTERRUPTIBLE;
+	return (struct userfault_wait) { TASK_UNINTERRUPTIBLE, false };
 }
 
 /*
@@ -368,7 +382,7 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
 	struct userfaultfd_wait_queue uwq;
 	vm_fault_t ret = VM_FAULT_SIGBUS;
 	bool must_wait;
-	unsigned int blocking_state;
+	struct userfault_wait wait_mode;
 
 	/*
 	 * We don't do userfault handling for the final child pid update
@@ -466,7 +480,7 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
 	uwq.ctx = ctx;
 	uwq.waken = false;
 
-	blocking_state = userfaultfd_get_blocking_state(vmf->flags);
+	wait_mode = userfaultfd_get_blocking_state(vmf->flags);
 
         /*
          * Take the vma lock now, in order to safely call
@@ -488,7 +502,7 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
 	 * following the spin_unlock to happen before the list_add in
 	 * __add_wait_queue.
 	 */
-	set_current_state(blocking_state);
+	set_current_state(wait_mode.task_state);
 	spin_unlock_irq(&ctx->fault_pending_wqh.lock);
 
 	if (!is_vm_hugetlb_page(vma))
@@ -501,7 +515,11 @@ vm_fault_t handle_userfault(struct vm_fault *vmf, unsigned long reason)
 
 	if (likely(must_wait && !READ_ONCE(ctx->released))) {
 		wake_up_poll(&ctx->fd_wqh, EPOLLIN);
-		schedule();
+		/* See comment in userfaultfd_get_blocking_state() */
+		if (!wait_mode.timeout)
+			schedule();
+		else
+			schedule_timeout(HZ / 10);
 	}
 
 	__set_current_state(TASK_RUNNING);

-- 
Jens Axboe
