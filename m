Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0BD2EF9DA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554325; cv=none; b=igGE79vjlK2zM5FSyowsoX9Q4fqVVLJtDPB4FsQ4iHchaRtkRY5kBzQcLvtFaT0zBK2vtefzlbNn92dsQGHXL3FslzlsGlEiD9eXb7tt+W3Z0AOwqNtzcYpH7UWfbfWYvK6Dcu/feAc5fMJwOCkE6s//zZeavxhcPxqp5my2IWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554325; c=relaxed/simple;
	bh=d0+0lXZ2xGDYC38FIser6Tvp0s7IlMQzz6aQcxfr7KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuY89lg953VSpifuNiVqaMFXI3uDFw28a//mGLe5AN+2g0VrR7nN7k3ZILAAx4dOc5N+J3BQFvPDxx7UPnQstNtQggtoJBWy5E+44rWDDAlAdn5AD6qaTKRCAaOiXiDABGN/5/J9tNpsbVgupf5O5GH6vtMeBg+AxQjUfVGlMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gYSi0W6h; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gYSi0W6h"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d0976776dcso656295885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 07:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751554323; x=1752159123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Az2cyM/gjMIxIEBmrX3av08IIbmE67znp+KEy+dKSZs=;
        b=gYSi0W6hPOF7DErkBTSZzNZi8/i9v3yM6IXLCbTpcYg3JsBjMg/KbhxlN0y0ziR/Ap
         SWiYtcyVd00SG7WXQGlOcCYnJ0JVknlQtK3ao7jCp9ueIOtyXfM9+kDLPa8qhka/GpsH
         fYtNqG1DLWp6F2Pnj+TB0ES89zsbCMLgMB8CwaAEfyC0vV9Jso74I81OFyvEOZg1Assf
         siFlQH6TJZbgH6Au/+T3l3q+Yq8ohysLr7hG1Bow7GFO7EsTReeWm2bwx1rxzMo+mfKG
         1zazlLI+koN5q4qIgl3l51pPZUEQrRKGgU8YRShvK4zgcq2dY38Hku6tmCP9dFjCGWY9
         mp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751554323; x=1752159123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Az2cyM/gjMIxIEBmrX3av08IIbmE67znp+KEy+dKSZs=;
        b=AlVoDOeLJyJSc+g3LcIkIrZC4lo3Bl9E8Rp1q5M8l6bAkeqpMaPJx+ReMwPG6zjoTz
         Bsl8p6viClb+RtmxIYTCd0mjaPkI7eehdDfEFAqW2mTLHBSML63ZpGJ+RImsUHjOWSF2
         BXvKQv4hhEUKVyMCHj+a5guFZWTDQt9xciydqtD5jUVpU7LfR+tBWyL38Uu5B9UZ3Ifb
         Et/CE/rJsdDqlBfzxpCwbNQ5S7V49OJjz2KSN7SNRDJ1H70ydCRgC1x6KKFBgShZxAc1
         QxIn1RFiehEdyfo/SZrrBhuZkKsMpo8a2cZdZMXdSbiQ/FIR4L/sYh9hqy+Eoo0gHY70
         eH6g==
X-Forwarded-Encrypted: i=1; AJvYcCVswDg0m0hunCYW4rBR44FdmuqOgPIDYPGs7SCwaTSBBqFhZ4DLbJPTRRQP1FaG5DochHCevloUcgwQwXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUlVIHk6eTrNwx/EM3lCTv+twjFVZZjYTRXRrAov7G/JqsiAs1
	nphtkWwOr/oV722gCXzQCiqgTsqi8GZHlbFqmqsXJdKxUItd3LFY18PixBdLXo5Yfw==
X-Gm-Gg: ASbGncuF8fNoqO2yfozvxrv7E5gcwbQu/+a+790WVxtveLeNESrfiv0tbIhz/aRm5+R
	eXhb3sxqaGI+86mjGSVRUncO/JuKRavCrZ/gZDmEHd899UdooOWaOZIWAEiu7sN8wCRdqnhIk/l
	3Mkp7EgUVX6rglvGv6OfOePj6tbadP5jDBBW+GQO9x8g51dVHwiBQh+0RumFhXBpoMs4u+eArwK
	fuZYCwpTKyuZiBeO49J8VCxCus6M+hvdPAgwW5tplbhT6ws+PvVChVVzfbObXRv/OOdjaQ2uWNS
	AbY1H8cq0+bpE4JKjmh/1gZcEgSeb1UrB4obkUioWV8ZGOi3dXAOwLUY4ag5f8OJKzvVGtRh6d9
	fXneR
X-Google-Smtp-Source: AGHT+IEKOdDqVDrQNfxOjGelYBw6lraeZVcm6GCMhToQ2A62O0hpizVBk+wIs+TJClOc+gapSrcZgQ==
X-Received: by 2002:a05:620a:29d0:b0:7d3:f3e1:b8c4 with SMTP id af79cd13be357-7d5c471911cmr928652085a.15.1751554322680;
        Thu, 03 Jul 2025 07:52:02 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbdbd172sm674185a.42.2025.07.03.07.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:52:02 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:51:59 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Manas <manas18244@iiitd.ac.in>
Cc: Hillf Danton <hdanton@sina.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pete Zaitcev <zaitcev@redhat.com>,
	Paolo Abeni <paolo.abeni@email.it>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>,
	syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com
Subject: Re: [PATCH] usbmon: Fix out-of-bounds read in mon_copy_to_buff
Message-ID: <34123da4-56ca-4ecf-ae38-71dc1e59109e@rowland.harvard.edu>
References: <20250703-fix-oob-mon_copy_to_buff-v1-1-1aa7f5723d91@iiitd.ac.in>
 <2025070322-overstay-compacter-3544@gregkh>
 <uew7bu3uxpppew5bhnpzw2oiqyrzv64co54fjthwnhqtnybv6o@lh5pzvkubzo3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uew7bu3uxpppew5bhnpzw2oiqyrzv64co54fjthwnhqtnybv6o@lh5pzvkubzo3>

On Thu, Jul 03, 2025 at 11:10:14AM +0530, Manas wrote:
> On 03.07.2025 07:12, Greg Kroah-Hartman wrote:
> > On Thu, Jul 03, 2025 at 02:57:40AM +0530, Manas Gupta via B4 Relay wrote:
> > > From: Manas Gupta <manas18244@iiitd.ac.in>
> > > 
> > > memcpy tries to copy buffer 'from' when it is empty. This leads to
> > > out-of-bounds crash.
> > 
> > What exactly is the "crash" that you are seeing?  What is reporting it,
> > and how?
> > 
> Hi Greg and Alan,
> 
> I ran the reproducer[1] on my machine and got the following stacktrace.
> 
> ```
> [   41.601410][  T769] ==================================================================
> [   41.601908][  T769] BUG: KASAN: slab-out-of-bounds in mon_copy_to_buff+0xc6/0x180
> [   41.602405][  T769] Read of size 832 at addr ffff888043ee6081 by task kworker/0:2/769
> [   41.602898][  T769]
> ```
> 
> which led me on a different path. I assumed that out-of-bounds was occuring in
> `mon_copy_to_buff` without realizing it may be the caller at fault, as Alan
> pointed out in his feedback.
> 
> I now notice that my stacktrace is also slightly different (or rather
> incomplete) as compared to the syzkaller report which says
> 
> ```
> BUG: KASAN: slab-out-of-bounds in mon_copy_to_buff drivers/usb/mon/mon_bin.c:252 [inline]
> BUG: KASAN: slab-out-of-bounds in mon_bin_get_data drivers/usb/mon/mon_bin.c:420 [inline]
> BUG: KASAN: slab-out-of-bounds in mon_bin_event+0x1211/0x2250 drivers/usb/mon/mon_bin.c:606
> Read of size 832 at addr ffff88802888f1e1 by task kworker/0:2/979
> ```
> 
> where it does mention that the issue is in the caller. The caller must ensure
> the correctness of write buffer.
> 
> Also, Hillf has produced a patch [2] which looks better than mine.
> 
> 
> [1] https://syzkaller.appspot.com/text?tag=ReproC&x=1770d770580000
> [2] https://lore.kernel.org/all/20250703043448.2287-1-hdanton@sina.com/

Hillf's patch isn't right either.  The problem is that 
mon_copy_to_buff() is being called with invalid arguments.  The proper 
fix is not to check for bad arguments but rather to adjust the code that 
computes the bad argument, which in this case is either mon_bin_event() 
or mon_bin_get_data().

mon_bin_event() goes through a fairly long preparation, and it may 
calculate length incorrectly, although at the moment I don't see how.  
mon_bin_get_data() seems to be pretty straightforward.

I would start by figuring out which pathway is involved in the error and 
logging the incorrect values to see where they come from.

Alan Stern
