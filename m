Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C19128E61E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 05:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751521225; cv=none; b=eQetTvkghHVkSmP5tFq3ROuDN9mvbjrwfcgVp0Hf6U5o295wwRiy2xk6qnhoL/aVoF2q7sPdONrFTEyXzOo+9VNTwwfdRE86jkS4pOP9pvrX4CkuqAZUbvEmpaQY+FO7/9mvNVWHOa2Hu9YwUDKJ0W1vzwaViYI9aEqCvp0+dFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751521225; c=relaxed/simple;
	bh=M2vyeWH0DutHMkqV6DcIyt6SCatd8hktuKbQTf/JtJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i7R3JQRIV1asg2UV6N2D7vYOrCZxb8/N0ePAEg6Rtcqn6Hm+fva37xB1RHQXqbGgcfCgZ5CrRfRVWM+9PHYi/NlFBp89t0NmGu1KhZpvLCWaZ1e4LP79dbuqDCVNhFhdeF33B3nHPSd7mQZMXUpgN+Uom1Lsc0yqpxBmAntaCuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in; spf=pass smtp.mailfrom=iiitd.ac.in; dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b=WT2Gsbez; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b="WT2Gsbez"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748e81d37a7so5344454b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 22:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1751521222; x=1752126022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZJ3D9BdUXcaieDRgLM5GSqlyr9PlwsCgm1po43FpSQ=;
        b=WT2GsbezdQf77UVJV+TskuYfnEfbdpB4SxncHPvGB06PzpVNgVADpP/2oo3hJvgD+k
         d6QzF8HAUHW0IW4vVCwFrM59KPKyfvLE0y/t+tGxKQIRGMQfUzjc5DV2KHI4SbKakVds
         /U+/hTKjJslVFAvLA300KMQZsv1aRAcBhx5uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751521222; x=1752126022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZJ3D9BdUXcaieDRgLM5GSqlyr9PlwsCgm1po43FpSQ=;
        b=pgakbp2IzlguJ8BMMeRRA6Y/UBAtwfkUrDPKF+ja5mJ2GqOlGelNOCeo6zSNKCZP/0
         4zKqZ2ywb8kNVtX33q7RHPst0gppOotx4spNDBJpBI6bXvCmAXdjJqKlulaTX/F2SLeA
         RJFWBSvSc+xG1jy9Zem3NLgOwGjhDzfFYBxsQwU6tiz7SEwWODuqahDQ3voD4Tcao6aW
         5Yf2uFrNyjkbPTcoluA/OylL8FKcsNgHCcEkQg/rfZZItYvTTybQ/lrV3Q5P15dBoYGe
         Qn6zWARo+ZEomggcFp0FXWCEzd4aT98j5uXCCXHzFxbWe+xZUhhdlCnjcWjDIHUCz5Vh
         t9hA==
X-Forwarded-Encrypted: i=1; AJvYcCV/VDODtzhkvJQwe4ZOhXKGNzG7SXIJgbfpV5X1FAgZW7mV/2HAZehsk9Ph10iaQ/VzpC5W/wOwedLNhYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZT5aFHwWVWQi/erGFUhG+ic3j138a/pqGIi4nXyCc62yukYHs
	WYIkGhCoYQhfrP9r/rgX0bMYipsesqxvYk0UtUrU5tR67WvJu22U5zRhFKqNXBRsMwo=
X-Gm-Gg: ASbGncue7/hQLiE6e07BqQicvn1H7N9KmNLGnUxuPnISItYiAgP0iFJxodSwbXP0523
	RWz/rBjte9NB8jxT32aR1yC4PWVZ+xKjEEqwZQhJHA5NOFGiPY4r6ZZkFxa/4PqM3AWHdEsxKqT
	c2ZD5yTimONHAgbBNIacAj28+S+yG23vmYGYeDWZi7f2wvEaV7E2fbfBaBU+1aer92d0DDbEHoa
	fklQ64e9tPd+CHGRqaWpjqCVlcgGOJRGjjaactZeCKe6aMgCYhvNy6YaO5X6RDJEPEu7uhPckOf
	iEjL6nQyH7b2tX/o9qF775Xgftv+M988P2W38Pw+bCiKMd90ss/bLJWB
X-Google-Smtp-Source: AGHT+IHBqMwtweqX9zHJzqYFxoWDjzmtyx2Umni0voQWk/BC+z7nOVvDheUtLCx8ITkinSUCSdPYgg==
X-Received: by 2002:a05:6a00:2354:b0:748:fb2c:6b95 with SMTP id d2e1a72fcca58-74ca8495056mr3197822b3a.18.1751521221899;
        Wed, 02 Jul 2025 22:40:21 -0700 (PDT)
Received: from fedora ([103.3.204.95])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58068b6sm15774866b3a.175.2025.07.02.22.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 22:40:21 -0700 (PDT)
Date: Thu, 3 Jul 2025 11:10:14 +0530
From: Manas <manas18244@iiitd.ac.in>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Alan Stern <stern@rowland.harvard.edu>
Cc: Pete Zaitcev <zaitcev@redhat.com>, Paolo Abeni <paolo.abeni@email.it>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@suse.de>, syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com
Subject: Re: [PATCH] usbmon: Fix out-of-bounds read in mon_copy_to_buff
Message-ID: <uew7bu3uxpppew5bhnpzw2oiqyrzv64co54fjthwnhqtnybv6o@lh5pzvkubzo3>
References: <20250703-fix-oob-mon_copy_to_buff-v1-1-1aa7f5723d91@iiitd.ac.in>
 <2025070322-overstay-compacter-3544@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <2025070322-overstay-compacter-3544@gregkh>

On 03.07.2025 07:12, Greg Kroah-Hartman wrote:
>On Thu, Jul 03, 2025 at 02:57:40AM +0530, Manas Gupta via B4 Relay wrote:
>> From: Manas Gupta <manas18244@iiitd.ac.in>
>>
>> memcpy tries to copy buffer 'from' when it is empty. This leads to
>> out-of-bounds crash.
>
>What exactly is the "crash" that you are seeing?  What is reporting it,
>and how?
>
Hi Greg and Alan,

I ran the reproducer[1] on my machine and got the following stacktrace.

```
[   41.601410][  T769] ==================================================================
[   41.601908][  T769] BUG: KASAN: slab-out-of-bounds in mon_copy_to_buff+0xc6/0x180
[   41.602405][  T769] Read of size 832 at addr ffff888043ee6081 by task kworker/0:2/769
[   41.602898][  T769]
```

which led me on a different path. I assumed that out-of-bounds was occuring in
`mon_copy_to_buff` without realizing it may be the caller at fault, as Alan
pointed out in his feedback.

I now notice that my stacktrace is also slightly different (or rather
incomplete) as compared to the syzkaller report which says

```
BUG: KASAN: slab-out-of-bounds in mon_copy_to_buff drivers/usb/mon/mon_bin.c:252 [inline]
BUG: KASAN: slab-out-of-bounds in mon_bin_get_data drivers/usb/mon/mon_bin.c:420 [inline]
BUG: KASAN: slab-out-of-bounds in mon_bin_event+0x1211/0x2250 drivers/usb/mon/mon_bin.c:606
Read of size 832 at addr ffff88802888f1e1 by task kworker/0:2/979
```

where it does mention that the issue is in the caller. The caller must ensure
the correctness of write buffer.

Also, Hillf has produced a patch [2] which looks better than mine.


[1] https://syzkaller.appspot.com/text?tag=ReproC&x=1770d770580000
[2] https://lore.kernel.org/all/20250703043448.2287-1-hdanton@sina.com/

-- 
Manas
