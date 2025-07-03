Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174CB1DF248
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509795; cv=none; b=GfvSY29obBfSz8600W6L3iGRw3NAK4A3oNuMtNUDEHJcinBsKuc+KXbUiROsO/pXU+NY67HmNWD2ooJjr2iM8y32D2siDVAx05OHHF9cRKeY8u4eUhuL3+ZI56OjaxsH3d7wBs6ICmgyddcJ3NX4UR9L5J2yHD551ZaMjXsJpaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509795; c=relaxed/simple;
	bh=tZfPKhgGB2j9eNbdHLBmjtYb/P4kAmGPCTMVYa6VqU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/8EYw7ZGfnf0TjXgm97etDcfTS8rXnBeoxFdCPyeAcamPOUjeownYbEVVwt27gCGJ2d0+nQwMx5YqJpit0AfJJekWfsPjbSpMVu52FcipbmvzX6a/zkGMf7OJjMAaJ+CjjNP+8oTYAGEMgUA0t8Zh09aK+pwAtvivwDBEfi6AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GmaLsEb9; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GmaLsEb9"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a7a8c2b7b9so76308471cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 19:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751509793; x=1752114593; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rh1JDHYagyiIPyBOK33Dd4va5HKceQEpdzxYICKvUs=;
        b=GmaLsEb935m8MXCrDqm+XSPlbzR9SZmpLmtvsvvIOhfXdoquH06h68czB9KvrMKWoz
         ZmXcxZY1q85AbQNyHdaXcK2DblCiyl5J+uAjOXWxDaLE0hM/iO+CIW8yfNtE91CHTK94
         b89Xsig9RyUWrSE8ZlZLn2ZLqYvJ6nMMWrKcFGQRkhFu/b905Ia98fOyFCks8fLGt5QS
         yFGXAXtEq80sYmU0NQiOtf5o2zvgSCKTbkGmPDWa+V8l4hUUxyN44RlbkbX5XCFbGZtT
         qbNZi0jQ6KHNneoVjUDERL7dXGt09vJI+/yorVySyDMmCMM7VYXH64HeLUComShom9y9
         +LJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751509793; x=1752114593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rh1JDHYagyiIPyBOK33Dd4va5HKceQEpdzxYICKvUs=;
        b=qni17fFZThQ9d3jWr5eBHKuE76oLPu/4DPAFHVWKT3B9Dsw4IsAFb10lDmw/yRz+3M
         obeOnKqprMGc5rkJ6xfWKl4gHFaPzffJs+bqGGtwqhLnnGcxUcNqjqIZDdjy5Hn4DLlE
         T/RzuD+Ate4e1jGx09QW+sicf9E7FdoIHX9Xcu9RsyUZQBgojFtZtZeSsMU1TM9tytZ4
         3rh+0Zna7AVkvlosmUz0BSWtNpGQf7CA+Ylif0chozDF3MnfPac3OGUA/N0/q6FtHaSR
         hqS6CV/YTBbxDpgNAjq81iZoQRcPzJj4B7/Z62g6F4E0FFdNdrRKqGbHwCPQjcZHo5Ku
         Ndmw==
X-Forwarded-Encrypted: i=1; AJvYcCWsqZ9jJJdfs3s28RUlxze/1fM7okNNDvko8fh8Mzl1iBeEfYc8TF/ZHNVQdB6JSBBcH7d20qU6i5K1E+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzYrg79sBhCI+A7FkuoOKrkpQAKIHc/FrwR7HGeKuKhbqz2Bc5
	7/zT4b7uQfDwCFSy5qMt8b/Dvze8EqLoa/VknO+94SsSGlAiH7OIpRtmeduV59k7Kw==
X-Gm-Gg: ASbGncvVSF0YVCMl46G2geuq3yESqFGmT8aicauyMBKSJW8sWRzXOLs07cXYpl7NNyE
	yEmyQ3RjlQXqtdfGWFPQeS+zxrq8q6Cf00/vjxj0wyc0Urn5b/3lVU/H2EeJDFq0rdyT6gx4cWk
	f7U7Y1ZHa1s0XtKfT6S3iM327db0bPhH9Damji+NWlFBLsLKK3yDHKrD29+immMXlTti6WmLj9m
	mP20faYftgUsbU8WQJEgoCDW8nMSgt92IrYMIF3uN6fFH9Sr9j5gcR+23D+Ta0HXVXeD5wIT+BS
	UHKdOXRxYhWfoIcwwBAMwRi9H2XySVhUmeoVvugRq82+G0E/XdrWOAR1l4LJvB8=
X-Google-Smtp-Source: AGHT+IFgUtIfacM1/yKau1yKcyG4dbEm+p1dcMbN7bUAVPQ51hz2fKYw5S+OeAykLbIKxmJzZvxwUA==
X-Received: by 2002:a05:622a:138f:b0:4a6:f6e7:7214 with SMTP id d75a77b69052e-4a9769b9da8mr73400481cf.40.1751509792827;
        Wed, 02 Jul 2025 19:29:52 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::4179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc10620dsm100820671cf.7.2025.07.02.19.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:29:52 -0700 (PDT)
Date: Wed, 2 Jul 2025 22:29:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: contact@arnaud-lcm.com
Cc: manas18244@iiitd.ac.in, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pete Zaitcev <zaitcev@redhat.com>,
	Paolo Abeni <paolo.abeni@email.it>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>,
	syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com
Subject: Re: [PATCH] usbmon: Fix out-of-bounds read in mon_copy_to_buff
Message-ID: <22cdd2ea-9240-45ed-8667-cc315eccf0e0@rowland.harvard.edu>
References: <20250703-fix-oob-mon_copy_to_buff-v1-1-1aa7f5723d91@iiitd.ac.in>
 <32d213c565df4c2a4bdb15b8c5b7c1ba@arnaud-lcm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32d213c565df4c2a4bdb15b8c5b7c1ba@arnaud-lcm.com>

On Wed, Jul 02, 2025 at 10:42:42PM +0100, contact@arnaud-lcm.com wrote:
> Hi Manas, I just noticed your patch while I was working on it and we had the
> same idea. I think you are not covering every cases of the issue.
> I've done it this way:

Why do both of you guys think that mon_copy_to_buff() is trying to 
transfer data from an empty source buffer?  Maybe the destination buffer 
is the cause of the problem instead.

> From 49f4d231a1c4407d52fee83e956b1d40b3221e37 Mon Sep 17 00:00:00 2001
> From: Arnaud Lecomte <contact@arnaud-lcm.com>
> Date: Wed, 2 Jul 2025 22:39:08 +0100
> Subject: [PATCH] usb: mon: Add read length checking in mon_copy_to_buff
> 
> Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
> ---
>  drivers/usb/mon/mon_bin.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
> index c93b43f5bc46..e7b390439743 100644
> --- a/drivers/usb/mon/mon_bin.c
> +++ b/drivers/usb/mon/mon_bin.c
> @@ -249,6 +249,8 @@ static unsigned int mon_copy_to_buff(const struct
> mon_reader_bin *this,
>  		 * Copy data and advance pointers.
>  		 */
>  		buf = this->b_vec[off / CHUNK_SIZE].ptr + off % CHUNK_SIZE;
> +		if(strlen(from) < step_len)

strlen() is absolutely the wrong thing to use here for both of your 
patches.  "from" is not a NUL-terminated string but rather a general 
memory buffer.  The caller is supposed to guarantee that "from" contains 
at least "length" bytes of data.  If something is going wrong here, it 
is the caller's fault.

Alan Stern

> +			return -ENOMEM;
>  		memcpy(buf, from, step_len);
>  		if ((off += step_len) >= this->b_size) off = 0;
>  		from += step_len;
> -- 
> 2.43.0
> 
> 
> On 2025-07-02 22:27, Manas Gupta via B4 Relay wrote:
> > From: Manas Gupta <manas18244@iiitd.ac.in>
> > 
> > memcpy tries to copy buffer 'from' when it is empty. This leads to
> > out-of-bounds crash.
> > 
> > This checks if the buffer is already empty and throws an appropriate
> > error message before bailing out.
> > 
> > Fixes: 6f23ee1fefdc1 ("USB: add binary API to usbmon")
> > Reported-by: syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=86b6d7c8bcc66747c505
> > Signed-off-by: Manas Gupta <manas18244@iiitd.ac.in>
> > ---
> > I have used printk(KERN_ERR ... to keep things consistent in usbmon.
> > dev_err and pr_err are not used anywhere else in usbmon.
> > ---
> >  drivers/usb/mon/mon_bin.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
> > index c93b43f5bc4614ad75568b601c47a1ae51f01fa5..bd945052f6fb821ba814fab96eba5a82e5d161e2
> > 100644
> > --- a/drivers/usb/mon/mon_bin.c
> > +++ b/drivers/usb/mon/mon_bin.c
> > @@ -249,6 +249,11 @@ static unsigned int mon_copy_to_buff(const struct
> > mon_reader_bin *this,
> >  		 * Copy data and advance pointers.
> >  		 */
> >  		buf = this->b_vec[off / CHUNK_SIZE].ptr + off % CHUNK_SIZE;
> > +		if (!strlen(from)) {
> > +			printk(KERN_ERR TAG
> > +			       ": src buffer is empty, cannot copy from it\n");
> > +			return -ENOMEM;
> > +		}
> >  		memcpy(buf, from, step_len);
> >  		if ((off += step_len) >= this->b_size) off = 0;
> >  		from += step_len;
> > 
> > ---
> > base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
> > change-id: 20250703-fix-oob-mon_copy_to_buff-7cfe26e819b9
> > 
> > Best regards,
> 
