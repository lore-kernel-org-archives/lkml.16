Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88AC2063E2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744042297; cv=none; b=Tq2slodWS9yNqAxB2B0YVNH5AAOp4V91qdBBLx57t8i3N2nGLf9Pi+GdbodvXWTTFZYEoUW//zeXDcJ/SyfB7XIT80JEptZOussmwlZl8boMEhmAezRxXgVsX9hA2HZ/vNOtbbGyPlT2qtxzit21ib6aipSFkMLFDil+aCu1D4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744042297; c=relaxed/simple;
	bh=KsEVGnKj/ZyTEWL4B7MD7vW31lMYLs6SHQSHn99IlbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXeU3SuHaIdh8OhvWl2EfChLEVWEy4XfaXWfMzeAKVx357fviICBPIiB3qYRLC1dXuxATwHx01DVkUUjdQ47S7wkXSCIGrMEI5eiiIbrjzdQJ0Ggb4Oapf6EwbDSXmUu3Xbw0ZO5Q7cIveXOmP+VKh4khaNb9u00FL7Ypzb8ZZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=mYnDhU3D; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="mYnDhU3D"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3f68460865aso3241202b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 09:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744042294; x=1744647094; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IXnl4aWwI+gQDZ+ekrtdQrNLGHmA4HgqPoIupV2xsTw=;
        b=mYnDhU3DWA8oM1S9IbIwiq172/sJD5Z7UBgxzomgiHngUsNQK6Pm/auV08yw7AqsBh
         xDRusZZnbIcGLSsiNYhov+V9cfDK6FkGvAYnYgg+lSUkRGHUHiNGuJcGScc0ZUVPaeIP
         x1YBj1E80XQJ2xrJd2Vi2ejBt53dn+TpzMsnEuldPX+8//l1K2e2eBoKFWmRMm3cETVg
         gYP2RzoGx5GcmkT8PLW6i4ZIcXJPZVTEHLvmKps9EHNP1v4Nf0KvXH0y5Pe8W4eIl/Tw
         hx1W6fzr0mO349cl4MCFcWRgJw8XeoA2+sWmQlhoBdvA/Ary55uOBmuj8ju0jlcGK2lK
         Cm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744042294; x=1744647094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IXnl4aWwI+gQDZ+ekrtdQrNLGHmA4HgqPoIupV2xsTw=;
        b=V1o8YUeogcGAk08ku72W1XhVXM7XSpwTx87+KNU83S0O27H6U8xaKASYv6jlx2N4/s
         4as9OJ22nZV7V1EFvn8IkLPS24eYLye6OJdrDsKIm7tvG2MY26rd1DKjXukZEmtg2sZQ
         JlsP8QNw05e71NJeUmEjIuiA71tGE1VTXCFnn5W3XbKUoZiPzlVgVAMKw09ibjryGuOY
         z5kcUg6RWyTuTDQqe0v+AzVk1hY6WCui9w/HSkpV/gy/g2zO7fykUOorMdemI3rEQIpi
         7YUOJev8GkTtbFtNB2GwLN2uQZYKrRSzPsyfECMUbMA7HhfNQjcQUfEKcS6A8xmZw9Mv
         sEbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+8CyyINxMBhOpZFTig7Lb/jWwBj3cv+JFzBNSORwu4EEHrjrZgGo0XHRyhW4krDw2ShX68Cz7rmfuvCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8BfYdzRpTZUAJDVWFgLW+t1fssUfEkU2omEzv+VBFRR8jZvkF
	HCyc3lni+bDcP5yWykSeeYeAYZ1fZvNn2IXHMN8HpRVf5ICdgTXh0uO/3UUk1g==
X-Gm-Gg: ASbGncvyTwJ83xBw96Q8AzvD6U/I2UQ6Yo9plZbnRHBj2pF3q8eKSPcyn6fxAa0gRXN
	Fh9aS1OK23A93ze+ldC1VfqGEDUc6ZpMo2smrC1wcNBZObzGVd8BlYXIs8gN6AnQwEPHrspLQwd
	m91peVCsjd6KHm7VHYyl9qzaV3E7+n3KXYNxyUAKj3QBJevqQ9RKY7ZliPgEAkCFI2CwOILrxN1
	g46wn0qf1yMNVF66o/N4OZoCVinFT12bJciHhN+FvV2Xb1Lo2kASV6VUTr4i6iexkKry2SD8jl1
	vRG9PPciLyverYOeSJBSsKKzDt1VvG64ACcDexr7mQ/aQ5GSStswmlB06lSp
X-Google-Smtp-Source: AGHT+IH0qPZB6EY8Bou7VhukIEhOImDstOm21SEVFOUQ2wnTC9y+fjZ2IdwbjWiLzgW3nK17LwAB4A==
X-Received: by 2002:a05:6808:3a0a:b0:3f6:684f:2f17 with SMTP id 5614622812f47-40045630365mr9869082b6e.30.1744042294576;
        Mon, 07 Apr 2025 09:11:34 -0700 (PDT)
Received: from rowland.harvard.edu ([12.111.7.147])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4003ff9adb6sm1770193b6e.27.2025.04.07.09.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 09:11:33 -0700 (PDT)
Date: Mon, 7 Apr 2025 12:11:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep
 state.
Message-ID: <3efb52b8-0974-4125-a344-00f459fbe4e4@rowland.harvard.edu>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
 <b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
 <84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
 <20250406002311.2a76fc64@foxbook>
 <ade0d77a-651a-4b03-bf21-00369fdc22f8@rowland.harvard.edu>
 <20250406095008.0dbfd586@foxbook>
 <20250406175032.12b7d284@foxbook>
 <14197657-0a0f-45a8-ac36-dd37b16a1565@rowland.harvard.edu>
 <20250407074905.2d236fb9@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407074905.2d236fb9@foxbook>

On Mon, Apr 07, 2025 at 07:49:05AM +0200, Michał Pecio wrote:
> On Sun, 6 Apr 2025 15:26:41 -0400, Alan Stern wrote:
> > I'd guess that you're seeing the result of the
> > 
> > 		usb_disable_interface(udev, intf, true);
> > 
> > call in usb_reset_and_verify_device().  This call is made following
> > the actual reset, as part of the procedure for putting everything
> > back to the way it was before the reset.
> 
> Your guess is right. I added dump_stack() to those calls.
> 
> The bug is triggered by this function calling usb_disable_interface()
> and usb_enable_interface() after usb_hcd_alloc_bandwidth().
> 
> These two issue endpoint_disable() and endpoint_reset() to the HCD and
> xhci_hcd appears to be confused about the intent of the former, because
> it clears host_ep->hcpriv, breaking all future endpoint_reset() calls.
> 
> Since 6.15, this call informs xhci_hcd that device endpoint has been
> cleared and pending URBs can be started, so this isn't working now.
> 
> 
> BTW, that's not a corner of the driver which I'm very familiar with,
> but AFAIU this disable/enable sequence is pointless for xHCI if done
> on freshly created endpoints. It would only wait for clearing TT to
> finish (there should be none) and issue some commands to clear the
> toggle/sequence state (which should be blank).

It looks like the purpose of the calls to usb_disable_interface() and 
usb_enable_interface() in usb_reset_device() is to update the data 
structures in the core and to notify HC drivers that ignore the 
reset_device callback.

The fact is, there are lots of operations carried out by the core which 
can affect the HC drivers, and I don't think anybody has audited the 
callbacks used to communicate between the two.  I don't even know offhand 
if any HC drivers besides xhci-hcd uses these callbacks.

It would be a good idea to check whether this stuff should be updated and 
improved.

Alan Stern
