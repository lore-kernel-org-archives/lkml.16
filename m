Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA5E153BD9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 18:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746642576; cv=none; b=HlC6zT2Qd0zzZxTK6R1NNj4onwBqN6uIYo+GTVFcVs5qyq+v36DHb/669f7otxcr8eVzV2ibmT75dM6sevBiRg15SZxoVnCHxWQuvBqE8wnB/aN5t91wlg9PFLTzidaozB5r9UbSGZ4JZyQ/Td6E2PXbPGBISs6zJ8z9GoLEyuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746642576; c=relaxed/simple;
	bh=slydqQQYSrYdyznpu6ZdFVyoYlYPGOAm6+qhysaDu0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZl4sXfF76HmMqXlFv51QjhI4C8YTMuX5oOsBuxriYFKvnB/aEXkivqQExmyWWtFuLK/8Q/7imcK3q2SSw2BK0SF9LNI610j8HREqjbM/h78doBahHEUKOGtERyTcetGeK7LMsCFr0Pk/hUFUgLNUFQQnYiUi0XCdJWGh4SKWMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=B9cGLONt; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="B9cGLONt"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6e8fb83e137so2534756d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 11:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1746642574; x=1747247374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2eLxeAZWz5DWy39hfAWzq0GbOK4A+xTpArBWabUxQtg=;
        b=B9cGLONtY0F3Uetu+wAPAQwYWdyyQomAhJd08opNbRHoinygF+QXQJS+Wxus13rgGG
         Zv6iT6cmh/R1RKEMsY9XBhQqu52Va4IG0LyyrDoeYk69kvMLm+TuI8JV3ujfUIg0oEai
         QdnSryLcNuFwQyyeRLnliCxXEDbAfp2tgtB5pgoJ54QBTdwYL4Tta/wZcWXosoZnDaKo
         nC1ZNnTkYPfynB1s0vtBIP0PKJFi+IoYBtvL8KJVI40QdbH7cmTZ6A9JBEVi/Ry5wXPe
         Rgxlr5ETc9lCeqMUoHrpHszO35t7U9cJvV0KGwD6cBSt1kmXpWRXRmWuVK0AR/VU9DmJ
         /1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746642574; x=1747247374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eLxeAZWz5DWy39hfAWzq0GbOK4A+xTpArBWabUxQtg=;
        b=qhI3Ep6jJMwP4AACxxcqXnfMh2KbOm4nd0/TuQh48yjVxfDllMDY1A2i+gHiy3H/OC
         HH26P25AZB+xejbO31hrWf077NM0+KMjRHcGx40HRr2YZ+xU4+Jw+RQMzcSH3NpBT+h6
         Z0ImQDEkrb67z2c8BHeNqAQgqJmdfeOKF6MPB4CPWlxtqcMKSPQzi9hkmgIH2cI/Rgse
         QwAVpUalbdkaXFfN7I5nSK2/xYvLu9Zqz3YyOjNhY5bp3J8NrKJuCaljG/TUUpvMGG1J
         05L8TEEUT1u45jIb/1Nt8cPIw/8E8gQmC7vfhfWJXuDzPuvWdR16lrLINdTEjMrAcxPO
         n/eA==
X-Forwarded-Encrypted: i=1; AJvYcCUB38Lw3iwKAMMQN6590XCwQeu9iSWkKV2WhLygGMb562ygMe3L0PdVVlp69VHCjAURyHx3cr53kaAV7S4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiDuQVCMwqhzBASZW7/OBnNePD5uF26fB9npD+9UCXuU6Zsx/T
	9sMH1bqWa+mIsBQ75QT/Tc6RHMZN8bt4EW5nXEFayJwUpOjHAkvzfH2nl18Qbw==
X-Gm-Gg: ASbGnctOhxnIHSI5GXgR4E/Vx61d6PKoPoe+lTHorRMqA7LnLjKf4Uz9dbRxO8iSS8q
	XIgYNHyjAAa/9OBly4O+4dOiBoXgHiSoyvIPKdYnp0k9B4q+eRF9AsmocsbsK6vVSu1krCHoGHz
	J0jXXneoNJ2i/9xGuJdoLfWJMHwDO9neNcfcVnTt9F1ZwRlSbXvcSmpKeGl8LDTphdrsF6mxqug
	HxDnCEMuM26hb35rdjPS1T71Qtp0m2QJY75sQJ52gc6TlgLryH0EkrrYR6h4Bbu4Gdi5HIqyW41
	BIuIJeMWTvMysE1fgYCrSV0gQX0MXaWgz2eIRnDtQZ9lRbBJoj2CqOy1HtmzNgX0iyuyLrCotd0
	V6URi4MMOiah0Ypkit08iALqrsk7Mew82tQ==
X-Google-Smtp-Source: AGHT+IGQv5tQ5SQMRSX/sa6n2hgD/zAItfZYRP+U1sy0D5EJbaPN9BTFNJhkO7Ja8MeJLyw/QLJenw==
X-Received: by 2002:ad4:5aa2:0:b0:6f5:107c:7db2 with SMTP id 6a1803df08f44-6f5429b1457mr58288666d6.9.1746642574245;
        Wed, 07 May 2025 11:29:34 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-52.harvard-secure.wrls.harvard.edu. [65.112.8.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f542623ef8sm17522416d6.19.2025.05.07.11.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 11:29:33 -0700 (PDT)
Date: Wed, 7 May 2025 14:29:31 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Jake Rice <jake@jakerice.dev>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] usb: storage: Add blockbuffer ptr to info struct of
 sddr09 driver
Message-ID: <c71aa977-d58d-4eee-9ab9-e9fbdca121bf@rowland.harvard.edu>
References: <20250506191531.3326-1-jake@jakerice.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506191531.3326-1-jake@jakerice.dev>

On Tue, May 06, 2025 at 03:15:31PM -0400, Jake Rice wrote:
> Hi all,
> 
> This patch updates the sddr09 driver to allocate a reusable block
> buffer. Unfortunately, I don't have access to the SDDR-00 hardware
> (which I know is pretty ancient), so I'm requesting testing from anyone who does. 
> Please let me now if the patch causes any issues or improves performance.
> 
> Best,
> Jake
> 
> ---
> Currently, upon every write the block buffer is allocated and freed which is
> computationally expensive. With this implementation, a buffer pointer
> is added as a member to the info struct and allocated when the card
> information is read. The buffer is freed during desconstruction if
> necessary.

This isn't a high-priority sort of thing.  SDDR-09 is indeed very old 
and likely quite slow (by comparison with current hardware); the time 
required for the memory allocations and deallocations probably doesn't 
have much effect on the overall I/O rate.

Still, I guess it doesn't hurt to do this.  However, I don't have time 
to review the patch properly right now, and I don't have the hardware to 
test it with.

Alan Stern
