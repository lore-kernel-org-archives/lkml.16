Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E2179CF;
	Sun,  6 Jul 2025 02:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751768363; cv=none; b=shIG0bq0oQRVivrySzz/+rlZMlb4ayY6Lu/xqx/aAYvmBNG0ghGzX0TbOiOlsqjqLuBz9dlpPpDuhK36fVQAjAkvBsiJ0N8r9Ojv1wUJwVZofuqEEBQvDDMgE36OrA3KaLSO6F/WdjCWcnea5PE4Oq1PhpX1TXedVKBG8ZzbD1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751768363; c=relaxed/simple;
	bh=tUbCSwU5Jowh3wPb7XVpRJ6zQmAC06swk6BRTH/UJxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EPhs6ZihxVuovGiFWhuvysSCT1vm8ZJwEX3Jj/1gkE+GTTb+ypJQ+Z1Jxb7EslpAJ+N6eRV0RVi6i6WPhplMTPHsWzfd8HdqKmYLys1nZfSIJsWM0j5zpqK1M0kKgGprB+0GnmR+QIJ8W0oEPu9o+11HXpoQgsxuFVa4bC4+VD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIZro0P2; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIZro0P2"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-611a7c617a7so627754eaf.1;
        Sat, 05 Jul 2025 19:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751768360; x=1752373160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbmtru+wvv9iaiIqRCJqLfhLW/sqA4MtYcTYSE3DYlo=;
        b=FIZro0P2oPVLsneD7kqZyj7aF2vc6nfYL7lzkiuTw/4w5LJY2zuIBB/C9j91BG6qnF
         xfQWUqPH1n0fJUAOV6uv3ia6gE/GERslG/Z+3FLDaw4tlph8YFJjDVZH8hsuJDVPFnoi
         zKRrWqHq6MPN2Lk+Qgx7SHoEEz4eS42eaVyWrqBxfmf5JGKG9P7kuCc4Hnue5dW5Xtzx
         cje9Q3ZPyZ+tgQmfu1xnCkW7ecsc9TTAmLCza9Viwgz3GtLVD/QptwLIHtZtmhV0Pd7+
         odvxKievGz08KWsvMqoWlwUytV16tPUpJpaxe0+UU74SdlaP3mz0tivRNBNnRZMvoS9q
         LSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751768360; x=1752373160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jbmtru+wvv9iaiIqRCJqLfhLW/sqA4MtYcTYSE3DYlo=;
        b=rtll4qWBTuSSjKPAv7r3yo3hu2eEDx3uV3Xae+nUO8d36/umjgM7xzELR+UOFEpErI
         qR8K3WTO2l/5kqebQSWBp5vFUlTOhD4NoRz4TnRVNLaktbEN1j0jFdKeictUSx1Xfe26
         UC9Irl1JSkciG/N+oTWfvSlyuRRzzPKUIMl9gg8HxNn48y5Ak7VRxKMgvILbAA85epXg
         N4ZhPujSTQ0rfYfU3El6+dk6Vd/qtpaXu/JLVcj6+NlnDy1yIkhwBxZm/Cauf6RrlOOl
         mMkUANxXBUXIQwKJOlb/N8CTsySome03zfXUM96kUC/9eFNkwA21t8Sh9EAE9Tj0PkHn
         CZYg==
X-Forwarded-Encrypted: i=1; AJvYcCVivA84b9cJbg3Xys6wRtx827JSbQTvUX7MOXGWnEj77Pc8bv8Ekb3FyEQpVTy05YJPZGetOvbdGZ3KSqjb@vger.kernel.org, AJvYcCXI2nXzrMylvyhnBc9CoVf89bUJvggc7WFYq7InBwTz5nUTdw6lBI+Jrr6PfQKcl5+W7ZQk78zqXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB+yek86OEKFJ2PxqvSM0sWVBbQrnbNpZlMDaKcIBF94Iw8CzG
	sYKBDXdEG66ddDNbIEq6ZakdkpPY8w+dZ75Cm9bKqNrOJxYGiArQdarggKJv8zADmTn08+2hhZG
	sDrk3BhE5YkttK9+I2EMH5Etes2hovfU=
X-Gm-Gg: ASbGncsyvjuIwS0FycZ9QG+PoAgQz5FMxqYSIZLxdNEEKuqOBV5fGK6g9u/xDw4ShSt
	BcHSG9ATMCuSPN8F6yimrS9sRMoYUyaCEIdcE319GKkzwsnJk9oEQyupyxHRLQy4Sf3eejHiP7v
	M/LeT+kCw9w9QmtFGwtSzdCUDpL+iZsAVSl1L82rGebuGYHs3QpxTWuJA=
X-Google-Smtp-Source: AGHT+IFaBJSesBn0WSVJ0IIVxKm/TxA4fD+0RZM9p5s2ZMBaAb90nctYJY22HsL82cQXdYtVLEmS7HK8y7ohZWuZ9LM=
X-Received: by 2002:a05:6808:4fd0:b0:404:b5c6:46f3 with SMTP id
 5614622812f47-40d04430f85mr6118516b6e.21.1751768359660; Sat, 05 Jul 2025
 19:19:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-mbox-drop-reacquire-lock-v1-1-d36d1a13d83f@linaro.org>
 <CABb+yY2HYgS25xouVJpq+Aia1M=b1_ocbHiyrnVqZcf0c0xcGg@mail.gmail.com> <fac9a5fb-7a39-4c12-9dca-d2338b6dad8c@linaro.org>
In-Reply-To: <fac9a5fb-7a39-4c12-9dca-d2338b6dad8c@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 5 Jul 2025 21:19:08 -0500
X-Gm-Features: Ac12FXz2RB4UDzYre8bHkjjgt82_1jpXQFP5mvqTmgDzsQQ25eNA59giIV4Cv_A
Message-ID: <CABb+yY1pn3+dFd=e80PaqEP2saF84f3buPt=ZYnTjDbSv3RN6g@mail.gmail.com>
Subject: Re: [PATCH] mailbox: stop the release and reacquire of the chan lock
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, andre.draszik@linaro.org, 
	willmcvicker@google.com, cristian.marussi@arm.com, sudeep.holla@arm.com, 
	kernel-team@android.com, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 7:30=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> Hi, Jassi,
>
> Sorry for the delay, I was out for a while.
>
> On 6/23/25 12:41 AM, Jassi Brar wrote:
> > On Fri, Jun 6, 2025 at 8:41=E2=80=AFAM Tudor Ambarus <tudor.ambarus@lin=
aro.org> wrote:
> >>
> >> There are two cases where the chan lock is released and reacquired
> >> were it shouldn't really be:
> >>
> >> 1/ released at the end of add_to_rbuf() and reacquired at the beginnin=
g
> >> of msg_submit(). After the lock is released at the end of add_to_rbuf(=
),
> >> if the mailbox core is under heavy load, the mailbox software queue ma=
y
> >> fill up without any of the threads getting the chance to drain the
> >> software queue.
> >>         T#0 acquires chan lock, fills rbuf, releases the lock, then
> >>         T#1 acquires chan lock, fills rbuf, releases the lock, then
> >>         ...
> >>         T#MBOX_TX_QUEUE_LEN returns -ENOBUFS;
> >> We shall drain the software queue as fast as we can, while still holdi=
ng
> >> the channel lock.
> >>
> > I don't see any issue to fix to begin with.
> > T#0 does drain the queue by moving on to submit the message after
> > adding it to the rbuf.
>
> The problem is that the code releases the chan->lock after adding the
> message to rbuf and then reacquires it on submit. A thread can be
> preempted after add_to_rbuf(), without getting the chance to get to
> msg_submit().
>
> Let's assume that
> T#0 adds to rbuf and gets preempted by T#1
> T#1 adds to rbuf and gets preempted by T#2
> ...
> T#n-1 adds to rbuf and gets preempted by T#n
>
> We fill the mailbox software queue without any thread getting to
> msg_submit().
>
I get that but I still don't see a problem.
When the queue gets filled the next submission will be rejected and
have to wait until the mailbox gets some work done. Which is the
expected behaviour. And will be the same even if we don't release the
lock between add_to_rbug and and msg_submit and there are enough
mbox_send_message calls coming in faster than the transmission bus.
Thanks.
