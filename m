Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5E32AF11
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 19:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746040383; cv=none; b=Kk92MmeUZdmY7zdMc1r9428LuqBIRv1mEFwkMz2IxoXh7YvnYDcYnyv7soON/Hva5p0wfT1CRiROoamgQKh+GTt4Umhyep3TjB/K5Q3vmuaLyby5jlrQ39HZJLz6HR4WNNqUxTlycT5gLNa9DbKcdrwofttvSU4wLzqd0p9O3yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746040383; c=relaxed/simple;
	bh=8u2Vwur6/brL3MS2FHrCrNTlIXuPRTf7Ks62Bc4eSHc=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=gOfiFHVhGpgbeRW3aLoXBGvS3H9BHeST4sfkCXPXh3Ovwj3b39U77j0NOr8K5z7Ja8FP7HF0YHeBjSJX/5d7jepBSpNa4e6pcFXqmfZDE0WaVjSbP+zG33qAOyWn/zWUC2+ttcywA0iaWKDoL86saV/KjZRcOEbZvfEVCY1fjbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVvsfSqF; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVvsfSqF"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-864a071b44bso6364839f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746040381; x=1746645181; darn=vger.kernel.org;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=199CSFgta0xKw+hoIN2eQo8Kj/2jEx9+QEyE1jBow5M=;
        b=CVvsfSqFCuo562uDD4UjjQW5ldrXQfUejASPvnhcZmWPp6CFEJGgeMFfwuU2ExPtiG
         WOP+R0ZerPc3I/cf+SZVT9kRown4V2JT33+UFubltHqBf98yNHrm+rSXG54xXerXbHTg
         uduw+LvXgjhOFJsJKFwO7jO4uqwKq5Yy26517O9HJRYFcex7yx75kRgBh7bi5rfr8m5v
         QTbUiJ/33s0ICoeQ091c2N9z0SiEd5yWQHU1UwHI5LcnrqJJKx3hBorS+cNyybuhucAn
         DXGG2bWeXZoqphZHBofA1A+WFpicLY327zp9OkT8zOAcUvq1wixfJ5EBpqshGb5ToKG0
         Q+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746040381; x=1746645181;
        h=to:date:message-id:subject:mime-version:content-transfer-encoding
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=199CSFgta0xKw+hoIN2eQo8Kj/2jEx9+QEyE1jBow5M=;
        b=agnd/Y+kPTRwGKtA7yc/9vw/gFABufB5gEvJvY2kwVu9rISyvISGQHKTIrh/xc+5f0
         fB1CqFdyOM3O15NJUN9wegylFSPppD8ZnM4D0ZG4irxHFL5qOACDOh0y/tYYIAt0Sma8
         8LCEeSBq8SkzbPhrnIb9jfa8d0d9t5dNuxYrDsgvrO83doQbU0pXjIvA22lLKgfKR+mI
         Ij97GzoZdg0OMaiCB+AcOuRiT6Wa5maJ1rRLZ8I9n/0ELsJaoLS6UIsKOoRjGQDiyzm5
         KneM9AxImhKZPgUOwYJq5j/vGRzCZwIv7k6NC7vxeb9HL55yBcWp/jNTaQYaAhJhGfwf
         jCWQ==
X-Gm-Message-State: AOJu0Yw9JmDuN2P0FMoINCzzF6J4Ver9bVrXWOZsd0MxSCzgASLU34oL
	LZRNJN+WM8akExRIAU2cski55tWApivQOpPW3cXOxqKTUExpvasuZTLp0w==
X-Gm-Gg: ASbGncv5xLZFl1SwKNbYYGM6jkeeo8ECq3/tk07hl5aep+gQkydBqKFfuCdNC7Xy6Ur
	p/7WKe90BP7nXlot/JvOJO+SbmEqZtQb2Q27Nyi4JE7zznoOHh1H/iYQ5+EUcSQDKfRlyHwOOLl
	eoO4Ws7A2P75dTEs+FQtGK7tlNDg+HZ3VZPIH6GWQTfWwdcwGU/eQoGxeB9v9qCWAlkjTIAtaNZ
	ElK0lx6qB7Q9NwlRvTMlC/ysp+lbLIMhTiz9+wMjK2RuFbkWu6Qv8w3Z5MfTdM/ca6pQlCBCV/W
	lmaMWbZi3YThb06h7p30X+uC4+Se5exBoggqL5MDlXd4kkv2O043NUmVh0wZjA==
X-Google-Smtp-Source: AGHT+IEbeG+qTsoD4CbJwo11zS3gVkhg0nlBoTkQXiUXbn4HCuco64dMdJaxWgaBtGcBxL32fOu60A==
X-Received: by 2002:a05:6602:2744:b0:864:48f7:56aa with SMTP id ca18e2360f4ac-864a22378dfmr51897339f.7.1746040380538;
        Wed, 30 Apr 2025 12:13:00 -0700 (PDT)
Received: from smtpclient.apple ([2601:647:6700:543d:1411:931f:60b:116e])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8648c09c2c0sm80391639f.35.2025.04.30.12.12.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Apr 2025 12:12:59 -0700 (PDT)
From: Thomas Haynes <loghyr@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: [QUESTION] io_uring: Handling -EAGAIN and potential duplicate
 submissions
Message-Id: <D74C05BD-EC64-4A24-B7D8-E126056E831A@gmail.com>
Date: Wed, 30 Apr 2025 12:12:48 -0700
To: linux-kernel@vger.kernel.org
X-Mailer: Apple Mail (2.3826.500.181.1.5)

Hi LKML,

I am using kernel version 6.14.4-300.fc42.x86_64 and performing RPC
handling of NFSv3 requests in an user land server.

I'm working with io_uring and have a question about the correct way
to handle -EAGAIN from io_uring_submit(), specifically to avoid
potential duplicate submissions.

I have a submission loop that looks like this:

    for (int i = 0; i < MAX_RETRIES; i++) {
        ret = io_uring_submit(ring);
        if (ret >= 0)
            break;
        if (ret == -EAGAIN) {
            TRACE(write_fragment_trace,
                  "Context=%p resubmission %d", (void *)ic, i);
            usleep(IO_URING_WAIT_US);
        } else
            break;
    }

My understanding is that -EAGAIN from io_uring_submit() indicates
that the kernel's submission queue was temporarily full and the
submission should be retried. However, I'm observing a behavior
that suggests a potential for duplicate operations:

  * I submit a request.

  * io_uring_submit() returns -EAGAIN. The SQE remains in the 
  submission queue.

  * I retry the io_uring_submit().

  * Eventually, io_uring_submit() returns a positive value.

It appears that both the original SQE (from the -EAGAIN case) and
the SQE submitted in the successful call are processed, leading to
the operation being performed twice. It also leads to heap-use-after-free
after I release the associated memory after processing the first
CQE.

This raises a few questions:

  * Is this behavior expected? Does -EAGAIN in io_uring_submit() 
  imply that the SQE may or may not have been partially processed
  or queued for processing, even though the submit call itself
  failed?

  * If this is expected, what is the recommended way to handle 
  -EAGAIN to guarantee that each SQE is submitted and processed
  exactly once, even under temporary queue pressure? Should I be
  modifying the SQE or the submission queue in some way before
  retrying?

  * Are there any specific io_uring setup flags or other considerations 
  that might influence this behavior?

I'm concerned about the potential for data corruption or other 
issues if operations are performed multiple times.

Any insights or best practices on handling -EAGAIN in this context
would be greatly appreciated.

Thanks,
Tom Haynes


