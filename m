Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924B01C1F19
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738423563; cv=none; b=UrVaohF4mjXfbA2IJFOpHWmJ1ruEmaAdLhy3a64Ek7bTjNK+5eLO2+qwaiX5qgsX3YzfFjLRIa/BtWtsiwEuJd+NZ/iJtNpaaJUcVS3qHMFam6r0YYlheKIW0RHsRXkXG5xYWlULOqDZzSWzqgIo0ndAuP9rnAv/0JVlklhHcnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738423563; c=relaxed/simple;
	bh=xkm1WBXpeRdOaXo3mc32fxLK2nokcWhYirbRTzf3Z+Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NMVwoLO7HWoaEa5gqtGcwbmjLgM9cC3K7Tl+Fl83MtSPmwTyXcd1eTtYlS/M/KDRFsAoh5af+R/PfUrGycFZRKHlAI8tGt4oqnuhIiQnS+6uz+BJzi72KHhP446/A+ZoCR/W8AgaQ+vNJTTTHV10XUpNYFEVVbLHXb33rtzbWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ec+h87Ub; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ec+h87Ub"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3cfcf8b7455so23025565ab.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 07:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738423559; x=1739028359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Crd5oDdzGW5OOM4T61oGHKWiilS9wsbf7HeFm4SJOU0=;
        b=ec+h87UbbWIalcSXTAL9oAlTTEOTRN2qMJNbWVUJO9/mGAihFbFHVQjMzNtZV/LhMM
         w2/ydl9djVXabPQeewBwPJ50kXwrKQIx1ggHb43DtkDI4lDNlSgt4Ae71839eTojcWRK
         U9pRxftd4Nto5JBwhkS0gREr04j7VXxGK7lOaUFycNd5sTevTIgVu4uVM0EvXsJYj/8O
         BvlHjfgNWt66PYKhCkwgOnr4bwC8FcO0wvHj4wPLdss21Blmjri1dUdqtlH9hQie9qAx
         AcXGU8+4FkOO+5EDs9xd+PWOlcErGJQsXX9+ocE4HHDALDCVK4zdkpGudwrpkhUkbBVr
         3+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738423559; x=1739028359;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Crd5oDdzGW5OOM4T61oGHKWiilS9wsbf7HeFm4SJOU0=;
        b=XSlifkk8nI+wcHzCXKmucRHPppb9FALhwdLNOdhNCdXptGXxMyTLrAYSQzySspJzlr
         HQGbtpGP0wOLQU716KCuHpuI8k5PdXnv9+aWo1Qic75wsKLAspRAgVngRJJCoziPQO6P
         jLOimZCJ63yG09OoS5On2AgS88z23qutreh031jFArA5vKuobm/2WW40lXmlP6EWK2LN
         mJGufr7nNFFGuf0YiQXwDgQHLje5rKUPQdfPaCiYcY532f5Cl++D8HClCNCq24HxMZGV
         /WB+Z4u8Op6CYnvhNtR640lyVUa/NcqAWLOFA3HRaxklpr9xvyh0zt3gCsHrNJsbBnBs
         Phng==
X-Forwarded-Encrypted: i=1; AJvYcCUXHFQeEJCBaXM0dU4TB46K/k2AVnwR03dPhPKs22pM+LhHHLERp3/eRb2IQSuTR4jUQlE4CfplrTZopEg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7WQR9v30RjgQpJx83QJvFWZWRskkLxRk0RXLlz0xUZwBb+yHg
	vgzYr3bCQCvH5oNxMz/CBIdEB2lx9mUqaj7ypvQEdlF66zZaYqq8YIohyf7WhsAxNEGf1irfX94
	O
X-Gm-Gg: ASbGncujcBsG6gZ+rEbzdc0nXx8MWUl7CrTIUrXx39bmUqTQNkNHwLgTil5lE80Tuo+
	Q8f76dbhTuLAjKP8TAFgvX9fnTCDI62lzsADZe4fRJWmklu+B5ZYVzDF+lbivhhsIZuEC1ShUXD
	fFqjfOhqf/KDyT7x9lhta2zUuWkbBNCEns5DZQhEGVcLP8a9HVk8XGW4Tp1bV1dkpB5SpZApsRA
	AvUxAqF4GD42+EZySCw2k4/DhHbgq8Xz4a1l3CGl4qyJlKs6h3eG6QkaVkiTxaITmTDJHgnlA5Q
	4t60WJbXOpvO
X-Google-Smtp-Source: AGHT+IFS9GIGmz3OfFtIkJOvgmTn32HqekxnQdFTaPFBasW3ihDWT079htPM9MwVfI6uMw1KcOrDiQ==
X-Received: by 2002:a05:6e02:3f02:b0:3cf:b6c9:5fc9 with SMTP id e9e14a558f8ab-3cffe3e5b58mr154785915ab.8.1738423559510;
        Sat, 01 Feb 2025 07:25:59 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746c0f5fsm1340125173.113.2025.02.01.07.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:25:58 -0800 (PST)
Message-ID: <a6fa1317-f1bf-4179-9da4-a77f86b7523f@kernel.dk>
Date: Sat, 1 Feb 2025 08:25:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Various io_uring micro-optimizations (reducing lock
 contention)
From: Jens Axboe <axboe@kernel.dk>
To: Max Kellermann <max.kellermann@ionos.com>
Cc: asml.silence@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250128133927.3989681-1-max.kellermann@ionos.com>
 <7f046e6e-bb9d-4e72-9683-2cdfeabf51bc@kernel.dk>
 <CAKPOu+90YT8KSbadN8jsag+3OnwPKWUDABv+RUFdBgj73yzgWQ@mail.gmail.com>
 <f76158fc-7dc2-4701-9a61-246656aa4a61@kernel.dk>
 <CAKPOu+-GgXRj-O9K1vdGezTUGZS64w5vpkZg2MM-96vmwqGEnA@mail.gmail.com>
 <daaed11f-02c4-4580-9594-fcaef35a35fd@kernel.dk>
Content-Language: en-US
In-Reply-To: <daaed11f-02c4-4580-9594-fcaef35a35fd@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/31/25 9:13 AM, Jens Axboe wrote:
> On 1/29/25 11:01 AM, Max Kellermann wrote:
>> On Wed, Jan 29, 2025 at 6:45?PM Jens Axboe <axboe@kernel.dk> wrote:
>>> Why are you combining it with epoll in the first place? It's a lot more
>>> efficient to wait on a/multiple events in io_uring_enter() rather than
>>> go back to a serialize one-event-per-notification by using epoll to wait
>>> on completions on the io_uring side.
>>
>> Yes, I wish I could do that, but that works only if everything is
>> io_uring - all or nothing. Most of the code is built around an
>> epoll-based loop and will not be ported to io_uring so quickly.
>>
>> Maybe what's missing is epoll_wait as io_uring opcode. Then I could
>> wrap it the other way. Or am I supposed to use io_uring
>> poll_add_multishot for that?
> 
> Not a huge fan of adding more epoll logic to io_uring, but you are right
> this case may indeed make sense as it allows you to integrate better
> that way in existing event loops. I'll take a look.

Here's a series doing that:

https://git.kernel.dk/cgit/linux/log/?h=io_uring-epoll-wait

Could actually work pretty well - the last patch adds multishot support
as well, which means we can avoid the write lock dance for repeated
triggers of this epoll event. That should actually end up being more
efficient than regular epoll_wait(2).

Wrote a basic test cases to exercise it, and it seems to work fine for
me, but obviously not super well tested just yet. Below is the liburing
diff, just adds the helper to prepare one of these epoll wait requests.


diff --git a/src/include/liburing.h b/src/include/liburing.h
index 49b4edf437b2..a95c475496f4 100644
--- a/src/include/liburing.h
+++ b/src/include/liburing.h
@@ -729,6 +729,15 @@ IOURINGINLINE void io_uring_prep_listen(struct io_uring_sqe *sqe, int fd,
 	io_uring_prep_rw(IORING_OP_LISTEN, sqe, fd, 0, backlog, 0);
 }
 
+struct epoll_event;
+IOURINGINLINE void io_uring_prep_epoll_wait(struct io_uring_sqe *sqe, int fd,
+					    struct epoll_event *events,
+					    int maxevents, unsigned flags)
+{
+	io_uring_prep_rw(IORING_OP_EPOLL_WAIT, sqe, fd, events, maxevents, 0);
+	sqe->epoll_flags = flags;
+}
+
 IOURINGINLINE void io_uring_prep_files_update(struct io_uring_sqe *sqe,
 					      int *fds, unsigned nr_fds,
 					      int offset)
diff --git a/src/include/liburing/io_uring.h b/src/include/liburing/io_uring.h
index 765919883cff..bc725787ceb7 100644
--- a/src/include/liburing/io_uring.h
+++ b/src/include/liburing/io_uring.h
@@ -73,6 +73,7 @@ struct io_uring_sqe {
 		__u32		futex_flags;
 		__u32		install_fd_flags;
 		__u32		nop_flags;
+		__u32		epoll_flags;
 	};
 	__u64	user_data;	/* data to be passed back at completion time */
 	/* pack this to avoid bogus arm OABI complaints */
@@ -262,6 +263,7 @@ enum io_uring_op {
 	IORING_OP_FTRUNCATE,
 	IORING_OP_BIND,
 	IORING_OP_LISTEN,
+	IORING_OP_EPOLL_WAIT,
 
 	/* this goes last, obviously */
 	IORING_OP_LAST,
@@ -388,6 +390,11 @@ enum io_uring_op {
 #define IORING_ACCEPT_DONTWAIT	(1U << 1)
 #define IORING_ACCEPT_POLL_FIRST	(1U << 2)
 
+/*
+ * epoll_wait flags, stored in sqe->epoll_flags
+ */
+#define IORING_EPOLL_WAIT_MULTISHOT	(1U << 0)
+
 /*
  * IORING_OP_MSG_RING command types, stored in sqe->addr
  */

-- 
Jens Axboe
