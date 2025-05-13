Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF611C68F
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165607; cv=none; b=F4SjE+Ztw6SzEg4lkeaPmZSwz54Hr67qHL+3q1sSoYStOxCK2fqQvp+4hLPsTx2LP6hamebBdXRH0jUjb9yzjFKDUVxFt0GinMU7p1PMIm9s9u3qZ892K4fPUTnLL/50A20R1ELahY50FRPgKISDIefnUV5hn6xE0tPvV+4LUN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165607; c=relaxed/simple;
	bh=MszmKtBNtjS/mCXs9S5eoJis8nie5o+i/1key2F4EpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTNb85w7qPIzhLusJxk4Ya860m7fIttWwFhU4xBq+H0cx4+3I1X1fyZxDz9ex2k8cfyFLdFZSdMDkk/6x4RW2QZ8wwKUGQbsjOjqBGgID/DBkht+Ic5rMmAt2+ZA0i0Pj7U2YcZKOSTgX3i6M7QP3Xr0MK2CzgjbcOwYEhpqBFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iE6bub0D; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iE6bub0D"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f54036c4b9so60870346d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747165604; x=1747770404; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8Gfow+0jLuuX+jpDPFCaVboVDazQRdjtB0gETvpjt9w=;
        b=iE6bub0DTWAtC297gUbFgS9sBUm2+JTh2uqjUS3Y+Ud8vrLrIZVU/ij/k0dZlgnFod
         dXcdS89R43Lc3fe+4ljKfo9at6OFgd3ZPq1wVG3LQmf5L9JIdJoIUxLOkmzAaOZpIKdd
         mPIhw1s7B0z1h1G2m5xfhYCrpzLb8OSEMTzaJK/l02Bq+l3DcQQVJ8ZNrU42pqaDTbOJ
         rXjiJmxIKHW3FmLGH3XDT2tHecwm5xHCpXPypQvWOHmRh3hicuEsc5rqnqO4PUCRbZPc
         XpP3fmHSkOTjSWg+0Z+m3SshYfS83VmvjhyKvttNLyKnRtMyCqPnBUD3MElv9h4VArMW
         EDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747165604; x=1747770404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Gfow+0jLuuX+jpDPFCaVboVDazQRdjtB0gETvpjt9w=;
        b=vWtVCF7zTDqJRZE7LN93mAO002JOySIzhWOURUM6I+vC0Sm220R0w1vFux3v3PTgYw
         f5PLmJahrY403884kxdymkhBUygCXIsN+X5UfN/9B99sL4ZmnaiU7qmM37mRmnA6tYwu
         +oTsGzXIL8i3UnoVoWtaSrgBX4MGrWboftshcqFjt/4XgAhjqWQ8Gj/wX71M9gW8WY0u
         dojl+GjPTmS22zY4e5Me2e1qavVKF9JbLJtfv9vl4afxS90g+mXnhgdtaHRuFR5BWKKb
         kRYrWAxk2RMQFtaaVL9BoyvRenTXrhKSqOOqu4PzEDOKb4xUMECmj9FjSlK14vY+I6QB
         oFjA==
X-Forwarded-Encrypted: i=1; AJvYcCV8BSQic2vUzG5ydwPeB0QzEJ0hx+U6oc9uNwRiJZnjTYrZMmbdA73NjV/nmuvhXKdZ73nn6/90Ma8qiDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmpngDOWIE+ij8mqE9AetlChtvMvHeV78cdQ5kS9OvXgW7K1A3
	tJA8iZSRsSswuv9UA+POLlgA/gYG4cvJh4BPzYUsFv+ktH4bL64QdC844klqHVlSMBf/Ep1qoj8
	=
X-Gm-Gg: ASbGncsbi1kjL8Nfo4pqr4wXFErb1wTCGMk1xvwsOcddA+YTCX7uVDcOhzlLC7Ne2qg
	uTstCe1lMrcdreG4g7toK+Ah/Lb8/qP+r79s0s+kl/fzKE2ZtcDpGwLXUrX53DcxM715wiira0l
	x5wktHpbcLzscdIA/P44x9zQm99++y7xghLgtRu6PbKQvh2fPoaYx57ljMRnYnbo0tsCrcgIQdF
	JEzvHiMnM8bVoT3Kzwu4xcpN9zM5usZl2ZJoGNNjmQseCBEeXMOY35pyFNjI4GAmrg/AmM3vXVv
	QKA1cti3KzK9S2i0/5dsFH7s5uafhcKxADxf4+FIoWIzPEnTaepWil8zP97UyQDdx5shjyp3e1f
	bsuntyincUJO+XtEdILh5FozcZQ12oiqmBt8f5hxNYbky
X-Google-Smtp-Source: AGHT+IEQ1s26wkUIF5mIfJy/X2WZMgbORKbbBrxgLhKcXjfhLXPfNrdW83rnhJVDuRATHDAgFIYlmw==
X-Received: by 2002:a05:6214:1bcb:b0:6f5:dd5:a594 with SMTP id 6a1803df08f44-6f896dfb53emr11435646d6.5.1747165604259;
        Tue, 13 May 2025 12:46:44 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39e09b4sm70419606d6.6.2025.05.13.12.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:46:43 -0700 (PDT)
Date: Tue, 13 May 2025 15:46:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
Message-ID: <110b763e-30c3-4e2a-b06c-339e086a48fd@rowland.harvard.edu>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
 <69accee9.accf.196ca18308a.Coremail.00107082@163.com>
 <b334ef97-1f79-4dd9-98f6-8fd7f360101e@rowland.harvard.edu>
 <40618da9.b062.196ca805193.Coremail.00107082@163.com>
 <ed0c2f75-f97b-4cad-ad35-78361edf142b@rowland.harvard.edu>
 <3aed7b55.b165.196caf9f5ec.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3aed7b55.b165.196caf9f5ec.Coremail.00107082@163.com>

On Wed, May 14, 2025 at 02:48:21AM +0800, David Wang wrote:
> It is not an "extra" memory area,  the memory is needed by HC anyway, the memory pool just cache it.
> And about not freeing memory until URB released,  you seems forgot that we are talking 
> about "memory pool" .  A URB only used once could be considered a memory pool never used.
> 
> If your memory pool approach would not  "waste" memory, I would  rather happy to learn.

Here's a simple example to illustrate the point.  Suppose a driver uses 
two URBs, call them A and B, but it never has more than one URB active 
at a time.  Thus, when A completes B is submitted, and when B completes 
A is submitted.

With your approach A and B each have their own memory area.  With my 
approach, a single memory area is shared between A and B.  Therefore my 
approach uses less total memory.

Now, I admit this pattern is probably not at all common.  Usually if a 
driver is going to reuse an URB, it resubmits the URB as soon as the URB 
completes rather than waiting for some other URB to complete.  Drivers 
generally don't keep many unused URBs just sitting around -- although 
there may be exceptions, like a driver for a media device when the 
device isn't running.

> I want to mention the purpose of this patch again:  
> A lot of "private data" allocation could be avoided if  we use a "mempool" to cache and reuse those memory.
> And use URB as the holder is a very simple way to implement this,. 
> 
> And to add , base on my memory profiling, URB usage is very efficient. I think it is a very good candidate to hold
> private data cache for HCs.

All right.  I withdraw any objection to your patches.

Alan Stern
