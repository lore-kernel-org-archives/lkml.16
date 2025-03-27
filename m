Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A0226289
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109864; cv=none; b=qmku83rw8lDpkDdHfrW9wic2GCVPa10MhJJWwZ0U26gfMS7xjT6NfefR+WH8iMNAkCnHtTRo7uPKZfJmyTPFougkDpluPMMJa6NtFjN8o/pZYrZPSx+O1tbAWv/6+I5Z3qj/HrsfnYDlEpqkR28BciTR7RzmIkodNqjrv3UVzLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109864; c=relaxed/simple;
	bh=m58IZxPeb5RHGpNeKyz0PkJCqdyCQwYkqyJiYGBY2tU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MGXcU6y07TOjz2wQ/b+iO0bEYRiBBNebxQPmn1Ufa5MxJoOllwUA4yb+0e+OBTro3LU9PCM+GTYCoWukpBDsp0XG6njxdLHJSsg4dAloLd7aNzaWjymmdtTZjJBgMOcfCl4IEOyGwhxXSHHvn6TeT9SQMk/gU2flI+SoTg9/5OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wx4LvZnW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wx4LvZnW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22580c9ee0aso32503725ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743109862; x=1743714662; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p+8Mafd2UtcajhG07+jp866mDzieO4XMMoteXJ6/4LQ=;
        b=wx4LvZnWcoxj/QUrdOCnIk5FE0jInjaVcMjIE/aQB6YFOb1dwgLg7eZY5B7ZZZF9nN
         THJ89CGd0f31aO6JEpg8JxUld3punyksP/QJ6pp0LTSXdKoMBLTcFEHfyXxuUQFmEjJn
         nD22lJav4fwaWJFBRf983zHyabDbTsDkOoG2FgwQxPYF/m829VFBe83PocnXiGlMz4oU
         IcX9/IL4PkjWFCWMe/l/yegeedUKybzbIrriaD5z71b8E3JAuEg09mtBqNU0nH0PPh5D
         bYqBnM/bfM48JXvR2rMxeC0+apxMAvJ76kqB68XCTX0wLsG6TadA9MSxAKNnsENj7plu
         LROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743109862; x=1743714662;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+8Mafd2UtcajhG07+jp866mDzieO4XMMoteXJ6/4LQ=;
        b=N2Ixq9QOyBf5CJYANI/DA5jOp06iHqNo06vJHo0g+zwTqTCvrsMHsraA8cfHADsWK0
         Opwkf4jqNzjNcQLetqTwjim9suB3t1N2RZKonjsTyQxXrpa9YgCpU61wNjV0mq8igQ/A
         +PTVNsFt2q7vFRyMv89oTPoanUR6lHdTpnVR/iVCWGmFAZXXEhUgKXNnuPmaysvIGZGf
         JGv0FNoGBxfx6JrL2NHa6FAHeYKpBRYyT30u2aeWGbvQ8eNU3d6qUvTXM4+YP/0VAkwC
         NknFp7PbmVzZcTeEPuXTgHjs6V2yoSVdCEgpvXX/DYsHTMJ1W2DgAKiytJPRI+OnSP6E
         oRPg==
X-Forwarded-Encrypted: i=1; AJvYcCUK0RmurHD3akWymVDK+SpHMevNeA9HY+P2xucX3r9G6FWK4430DS6ElW2sw+uwOQaZbOaK+flfIXyLpwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr1nnNDvJ2uqWdkLCyVqDq0iIabNP8TiPuURH9tE578RDPejOM
	bppeIUFc+0jyq+E/1rxTDWcAnpvUjPDv5H65q/NSd2VvQMlXZqYUPn2crbomIg==
X-Gm-Gg: ASbGncuvorZaUM9Vd76VfDI6KC68svaea9/gI6KMmJoveZDfYACXCIfKO5FUyzt+E5Q
	pRS0MYfASHMLTaLL2uuRDM2qxm9gO8EucMjrXsU3gxVHpoVcmkiZ1WEABs17SAIC8tU5lL7+qtJ
	EM28uzQtRJUkwBb0uPBtQ+vy+CRbgwoWyxiwl+992oMk8v8ZIL8FyE3PiG2ltzOn77nK+CjU0kF
	kLCTM3l9ek6LBxVuw5jpFNn0nLLPKkJ5pQcgj068SWzuffhzCKLBUhTjFLcKO59yQnaYmxrXsaA
	pfQ8K0sTeU0xS7BSBMXqetj4ysKMPBcpnwFVGnET1fXINLbaC84vrRoqzGlJvtA7xmagyIrFZ/a
	lr+GApT1rD+ylU87PEK6o8oQmByNw
X-Google-Smtp-Source: AGHT+IF5IvRZ+cIdtxE3619ORvawAtNSiXfuslCR5mL4uIrKM+QdqjqahBHj0QcOi3VXn8DYETZOZw==
X-Received: by 2002:a17:902:e948:b0:220:e338:8d2 with SMTP id d9443c01a7336-2280485b0f8mr85602175ad.21.1743109862032;
        Thu, 27 Mar 2025 14:11:02 -0700 (PDT)
Received: from ynaffit-andsys.c.googlers.com (49.77.125.34.bc.googleusercontent.com. [34.125.77.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec6f86sm4641855ad.5.2025.03.27.14.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 14:11:01 -0700 (PDT)
From: "Tiffany Y. Yang" <ynaffit@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Arve =?utf-8?B?SGo=?=
 =?utf-8?B?w7hubmV2w6Vn?=
 <arve@android.com>,  Todd Kjos <tkjos@android.com>,  Martijn Coenen
 <maco@android.com>,  Joel Fernandes <joel@joelfernandes.org>,  Christian
 Brauner <brauner@kernel.org>,  Suren Baghdasaryan <surenb@google.com>,
  linux-kernel@vger.kernel.org,  kernel-team@android.com
Subject: Re: [PATCH v2] binder: use buffer offsets in debug logs
In-Reply-To: <Z-MV_KoW2w9F0HZw@google.com> (Carlos Llamas's message of "Tue,
	25 Mar 2025 20:45:48 +0000")
References: <20250324180716.1012478-3-ynaffit@google.com>
	<Z-Go6qOLxT0ZfxyD@google.com>
	<dbx8v7ryym9o.fsf@ynaffit-start.c.googlers.com>
	<Z-MV_KoW2w9F0HZw@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 27 Mar 2025 21:11:00 +0000
Message-ID: <dbx8h63eji1n.fsf@ynaffit-andsys.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Carlos Llamas <cmllamas@google.com> writes:

> On Tue, Mar 25, 2025 at 12:41:39AM +0000, Tiffany Y. Yang wrote:
>> Carlos Llamas <cmllamas@google.com> writes:
>> 
>> > On Mon, Mar 24, 2025 at 06:07:18PM +0000, Tiffany Y. Yang wrote:
>> >> Identify buffer addresses using vma offsets instead of full user
>> >> addresses in debug logs.
>> >> 
>> >> Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
>> >> ---
>> >>  drivers/android/binder.c | 31 ++++++++++++++++---------------
>> >>  1 file changed, 16 insertions(+), 15 deletions(-)
>> >> 
>> >> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
>> >> index d1aa6d24450a..994ae205aa07 100644
>> >> --- a/drivers/android/binder.c
>> >> +++ b/drivers/android/binder.c
>> >> @@ -3261,20 +3261,20 @@ static void binder_transaction(struct binder_proc *proc,
>> >>  
>> >>  	if (reply)
>> >>  		binder_debug(BINDER_DEBUG_TRANSACTION,
>> >> -			     "%d:%d BC_REPLY %d -> %d:%d, data %016llx-%016llx size %lld-%lld-%lld\n",
>> >> +			     "%d:%d BC_REPLY %d -> %d:%d, buffer offset %lx-%lx size %lld-%lld-%lld\n",
>> >>  			     proc->pid, thread->pid, t->debug_id,
>> >>  			     target_proc->pid, target_thread->pid,
>> >> -			     (u64)tr->data.ptr.buffer,
>> >> -			     (u64)tr->data.ptr.offsets,
>> >> +			     (unsigned long)tr->data.ptr.buffer - proc->alloc.buffer,
>> >> +			     (unsigned long)tr->data.ptr.offsets - proc->alloc.buffer,
>> >
>> > These could be pointers to anywhere in user memory, not necessarily the
>> > alloc->buffer. So there will be cases where this substraction doesn't
>> > make sense. However, you are correct that we shouldn't log these addrs
>> > so maybe just don't? wdyt?
>> >
>> 
>> Ah, in that case I think it makes sense to remove them here. What
>> do you think about printing the full buffer and offsets values in cases
>> where we would print a binder_user_error or binder_transaction_error
>> instead. Ideally, I would try to limit this to cases when the data or
>> offsets ptr is invalid / copy would fail. Ostensibly this wouldn't
>> reveal dangerous information about the user address space because the
>> print statements would only happen when the data wasn't where it was
>> supposed to be and it would help with debugging, but I'm not sure if
>> this line of thought makes sense...
>
> My 2 cents...
>
> I'm sure there will be a _few_ exceptions in which having the pointers
> from binder_transaction_data logged would aid debugging. However, this
> won't be info that most users care about. In practice, logging an error
> with "invalid buffer/offsets pointer" message is enough.
>
> There are _other_ pointers that users do care about when debugging, such
> as binder_ptr_cookie but not these. So I think is better if we don't log
> them at all, as calculating an "offset" is not possible either.

This makes sense to me! I'll drop them and send out another patch.
