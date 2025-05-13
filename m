Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132D8BE5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 18:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747160481; cv=none; b=iLjvRf7kyfTJuSqBk70IN7kP2ab43nMT51lexWG6eeXkIjsOq+CMroOtFFNnLon1jf64GTGrGbz46LNOiMDdlqre0hQ/7+aCEAc0UDm3hRG+0KEW8IGOtydGXgncrUIkwQx3TQcOCz55VVRfN8l7XRLqw0Y4/eCLfO+1QY0yL+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747160481; c=relaxed/simple;
	bh=4krrrkk+qvTRdZq8Oj7VlqbgSsXrlUZptUPDF2S+W4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uf+HVmrHBxcJ93Ke39wuSfRsY71SvcPPziujDl5XGKnJYldFI4stybhpgPqTi9oyUN4GytezOM4Wch7L6OVzE8N3LYAyYLoO8GjeatBGKNCQ/t2HZpvZIA+RhKgu0UBdFdQllsvy/hFjfUC/FkOwTcGhbmLnkSwiE+WOKqe/3v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=I0iSK9PE; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="I0iSK9PE"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c53b9d66fdso888485785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747160479; x=1747765279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5FEkWrhFTB0AYSizXj2l3QrnN5yD1XiBhFmHN6RK7Y=;
        b=I0iSK9PEgSOcxDxpGAH2DTg+LNKRcmB+BTiIsXB0tZeUghlUajwF6l/MQNGvj+axbZ
         K7lSD2VNcaQcCJwPoZuMndN9lqIKKw+utMebpfz8r7VBmyFbJ3I5XLCdwy+4VMbL5Sfc
         JX11hT6g39FukUPjVPKAV6gV91BgqJq2asT71BKXYbTSMB39lUzGTcHpQ5BihmlJLOnb
         0FGGM99cQDluuqz/KWAXLAborwmhMApNTGc/TLUDjFSJtIneDBZAjT0NTYbEeST4ItWI
         hTWxNPvIvSpvl9KHHdsl5qpHMSQ9gA1pIz2I3bv4FlAUrJnQDQ24nUHOdB/r5siMijzJ
         f2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747160479; x=1747765279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5FEkWrhFTB0AYSizXj2l3QrnN5yD1XiBhFmHN6RK7Y=;
        b=Clhe16z+xmJiNY5np0ZBNUrwGXwm+lpbWQsRvWoj5UP9iGKH3/iwjNy9Dw9iQH7B5p
         3UZvajwYYilrDQy9xx8T8VjwXH838lsw7l3OR7E8s9hiI2L2IcQNhGHcebAAVE4+6Jib
         6W9g2XLopjPOvplm8AX/zh0OzpaZ/7FtcRtmxrr5IWSJFNg1TJTIyxiVOYqZ0HUFs0l4
         OtC0CSPH+5fHIRYZqz8Mmi4uBWTYafbKPgm6SqZuvAL3wOx/2CU/eYOZXK7HQqRIUVdt
         7xlkf5AbyEBRdG7qbr4OiX1hxagQMJQGvWuGzHCIaZjcYsJksJt8Nv/o0Z5Ka0ulSlvv
         dfcg==
X-Forwarded-Encrypted: i=1; AJvYcCXs60oXma/+rJVfwPBylvFKIaMVeOyUtNOErRyfMKh38unjmfqjt+3I3idmXXrffQa6Thl4xQbmPcazdhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIoueIwGgQKLJVj+RrcIqzYrS4UXhzz/LA0YcxzrM0xk7j5UFo
	FP2lFYNufG+uZvN9P2bwvTpLRSm65Rf+W46RBNkjjflo9trjJA1ONnRwo4237Q==
X-Gm-Gg: ASbGncu305zANB4oc5Ap5o2kO119i4KsqS9U5ikR8N3RrqFwir2G0Sp1pjDSGHRCns4
	BHRAYkggefRYe5TS4113W+z2L1aSxvGkBnx62yCLU6QZ6Ii5oUGQtr2qQKWajmFTPe9ZFytG10Q
	twV5HcphVMvkhP0llmzYBEklZTECk71oT87SyXA4sHqDnysiW2WUcOVlKp079lhmt2w7HxbniRv
	Rn3uXJY/yXBJw1ePRQCelGHXtHKJmWV1EFnjiaAiUjFZyobaAUqiIFwk/RQi5e62uD/zNSzRQYW
	tu6nXU2kuZNMc/nK1G7x95RqLzYr0YPWMYj3N6cwrDQNdy18GKTCrhF4jILBXkHjCn/+gMsslgi
	wlRZxLoMZ3MHwqXDrXzG7AM3ozOV/G6vltyDC+RRihBOb
X-Google-Smtp-Source: AGHT+IGRY40xVfY04DZzaweSZEI+V00K04ooAl3VLrFIxOl4r9nnSls4np3LTjoxQcIlORjdTh8NYQ==
X-Received: by 2002:a05:620a:4404:b0:7c9:23c7:a92f with SMTP id af79cd13be357-7cd287f91bfmr88428185a.1.1747160478856;
        Tue, 13 May 2025 11:21:18 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f9af25sm729427185a.63.2025.05.13.11.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:21:18 -0700 (PDT)
Date: Tue, 13 May 2025 14:21:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
Message-ID: <ed0c2f75-f97b-4cad-ad35-78361edf142b@rowland.harvard.edu>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
 <69accee9.accf.196ca18308a.Coremail.00107082@163.com>
 <b334ef97-1f79-4dd9-98f6-8fd7f360101e@rowland.harvard.edu>
 <40618da9.b062.196ca805193.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40618da9.b062.196ca805193.Coremail.00107082@163.com>

On Wed, May 14, 2025 at 12:35:29AM +0800, David Wang wrote:
> 
> At 2025-05-13 23:37:20, "Alan Stern" <stern@rowland.harvard.edu> wrote:
> >> I have to disagree,  your suggestion has no much difference from requesting memory from
> >> system, locks and memory pool managements, all the same are needed, why bother?
> >
> >There are two differences.  First, xhci-hcd already has its own lock 
> >that it acquires when enqueuing or dequeuing URBs, so no additional 
> >locks would be needed.  Second, complicated memory pool management isn't 
> >necessary; the management can be extremely simple.  (For example, 
> >Mathias suggested just reusing the most recently released memory area 
> >unless it is too small.)
> 
> My patch also just reuse memory,  in a simpler way I would argue....

I didn't say your approach wasn't simple.  I said that my approach has 
very low overhead, a lot lower than the existing code, whereas you said 
my approach "has no much difference" from the existing code.

> >> >This idea can become more elaborate if you maintain separate free lists 
> >> >for different devices, or even for different endpoints, or sort the free 
> >> >list by the size of the memory areas.  But the basic idea is always the 
> >> >same: Don't change usbcore (including struct urb), and make getting and 
> >> >releasing the extra memory areas have extremely low overhead.
> >> 
> >> Why implements a device level memory pool would have extremely low overhead?
> >
> >Because then getting or releasing memory areas from the pool could be 
> >carried out just by manipulating a couple of pointers.
> 
> A couple of pointers manipulation? and it would be simpler than a reusable buffer in URB?
>  I doubt that.

I didn't say pointer manipulation was simpler than a reusable buffer.  I 
said that it was very low overhead, in order to answer your question: 
"Why implements a device level memory pool would have extremely low 
overhead?"

> There would be lots of details needs to consider,  detail is devil and that why we prefer simpler solution,
> I just don't understand, you seems imply that my patch is not simple, could you elaborate more on it,
> or it is just that in my mind, make changes to "usb core" is a big no-no!

Neither one.
  
However, you have forgotten about one thing: With your patch, each URB 
maintains ownership of a memory area even when the URB is not in use.  
With the existing code, that memory is freed when the URB is not in use, 
and with my approach the memory is shared among URBs.

In this way, your patch will use more memory than the existing code or 
my approach.  The question to answer is which is better: Using more 
memory (your patch) or using more time (the allocations and 
deallocations in the existing code or my approach)?

> >If I were redesigning Linux's entire USB stack from the beginning, I 
> >would change it so that URBs would be dedicated to particular host 
> >controllers and endpoint types -- maybe even to particular endpoints.  
> >They would contain all the additional memory required for the HCD to use 
> >them, all pre-allocated, so that dynamic allocation would not be needed 
> >during normal use.  (The gadget subsystem behaves this way already.)
> >
> >Such a drastic change isn't feasible at this point, although what you 
> >are suggesting is a step in that direction.  In the end it comes down 
> >to a time/space tradeoff, and it's very difficult to know what the best 
> >balance is.
> Drastic change? Do you mean make change to USB core?

No, I meant redesigning the entire USB stack.  It would require changing 
all the USB drivers to allocate URBs differently from the way they do 
now.  And changing every HC driver to preallocate the memory it needs to 
perform transfers.  I think you can agree that would be a pretty drastic 
change.

>  Because counting by
> lines of changes in this patch, I feel my patch is quite simple and efficient.
> I also don't get your time/space tradeoff here,  are you talking about my patch?
> or you were just talking a solution in your mind....

Both.  See my comment above.

> This patch only needs a pointer and a size in URB, and URB object allocated in a slow pace...

It also needs an extra memory area that is allocated the first time the 
URB is used, and is not deallocated until the URB is destroyed.  You 
seem to be ignoring this fact.

Alan Stern
