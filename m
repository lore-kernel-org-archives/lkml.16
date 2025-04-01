Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F266937160
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520624; cv=none; b=PaxVco05Ehfgou6WRbG9uiIj9t92Y8UUZJCP2Ey9iJC4mOznts3pXzVw5CmO53/PslBvM49CLWjbpo+2uUXMfWtO/O0rn5KOmJ5I+8x7WjWs7R88diP7QkDeWWZalJEEOfcWpL1B0h4OMIf3QVmusOEoDr6pSOzqK89ZGIEy6ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520624; c=relaxed/simple;
	bh=dQiiCWw0gJL3pM8AURs73NsIreNo5plvxy7k2Sp5/Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7fGCHJqZR7W0k516NtOYbzZcbVVyg47jIK/H12JyqwHZmmMCOa8GU4WdKNa5pzhefpVO/uNjP8lDAubKN9xifS136mjYVq82Bp9KdN6BdQA3/NKxy6xGrzcy3F78kN99cf9Kik5c7yxzNTdEkRpNp5MDVBiM9OO4K71ILF3Yck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=X+gejdf0; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="X+gejdf0"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47662449055so29320461cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743520622; x=1744125422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMrBJmHxMmocbV+bbsiTIdh0Ur8L8QCQ53gPPEe2fCY=;
        b=X+gejdf0tXX6mWVpXXz59sDwuqpn9AlKFNsFBWWMmVge3Tq/O3C32MhKIJNWw9tjs8
         4uTLRZnV8PKfCGuUrfVCRxbzei1IflOjO09tCX03k4HNK9YV7LRmBB4jFB9m7wksTkc+
         60q6ouovEhloQk1ywn+bKEuZwN6jD82fgVafbZI/aVl++6nKlSQ/ssH7SSFUHBwwYWuU
         QBOXrMHuBg5e2OZj9zjwmlCKGgiCWc5TwmIsMJf//knQOGmSHTm568PwKaYWv9mwQHVi
         YiqRsJYpq2z8wmUOgQhgaxCkz9HP7kURFQ3TBjWB5rBgw1UEAOX4c+pnpU3PqBDlt9Jw
         DwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743520622; x=1744125422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMrBJmHxMmocbV+bbsiTIdh0Ur8L8QCQ53gPPEe2fCY=;
        b=hh+8ED83YFIGAGun4Vlqe0ByXoIGDnfQ4cQMqMY4As5L7SOol8OJgybtlPAnnfmb4q
         59+pkPWskYfRz+vDIiTHhbKRFZb2dMxFj+Pow4U+DoHT+hzOs28ZzIzODYJIFCihWtzF
         AsA6o1X6mIWtX+n/Tz+L0KaiEZBEjAWCd0TEAAjIpPspD/pPtl4tzZK6Bz/pnPClTvsF
         FdROWyIkbesFI109SpJ2mvrPysZrn0TMniXq2ZibUFfHAkB0lZaZ3nV16mvNygC7jAji
         XZKM5oDwELxe1NNJhNC+7YRVb1pIcSnz3g0ItpS46z4R3URDlYdnW/D+B/IOMYqeHu0u
         yp4w==
X-Forwarded-Encrypted: i=1; AJvYcCWtGcAy2pKK1MFEMtcK2CcUV7Nkdls0cMd8l9nD4zNPxsDT1QC4LFkecNfBMOa36x8Wtlk+IkDtgnMATww=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGvmYuDv1CxwvYf4MyWInCXhcSBLmly9wOJ9F+Q7GVL4DxJoYZ
	o6kggKHTmfsy7+uCSCHy1Omb+3hfmjCJ9gKZ6d40BYYWFejuwCAp5x5XmsjwDHw=
X-Gm-Gg: ASbGncu/KWgzy8N9Ump5OaMnZUh5tA3ikppWRM/gk254uLVcLrnHZmJOC5jqMR/CxEk
	+JCqPvOfoioKtV8/iDGl0zTJLKq23ypLb2Zf8KbKCod/VToSQ/Ik+gGvfIP14TThlauVW7MXZ4I
	4i3RQDwNtJYEms88HObLSDRn7f+yWNRkA3lv5iGtnmziHE+J03EhsCCROkAOlbCPW9viElXswD1
	S3Ydq4ZD8iZKx4zPJUyGJmfFBUo5YywmTm89VzfypsCkHzFLoFRYLTyOP8ue+Fwhy13h/xCGw4K
	bwD5+bMyOG46gsiNwfmmz06dHF9Yg42UHnN0rnREcgOtyJquYXznxyLbq+fn5szkl16VbCEEyNS
	0FteBbVQKyhXfA+kBmtA65O7mSLjozqGPFoziHA==
X-Google-Smtp-Source: AGHT+IHIy9M0MoItUdMIpylHvPXfzLOBmJq2T30poREcLIQ7vfJ8f7SMSyY6atAj0Wc7wGiOXe7vUQ==
X-Received: by 2002:a05:6214:c2f:b0:6e8:ddf6:d136 with SMTP id 6a1803df08f44-6eed627788cmr186283296d6.45.1743520621884;
        Tue, 01 Apr 2025 08:17:01 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f765ad89sm667321785a.16.2025.04.01.08.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:17:01 -0700 (PDT)
Date: Tue, 1 Apr 2025 11:16:59 -0400
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: dan.j.williams@intel.com, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH] DAX: warn when kmem regions are truncated for memory
 block alignment.
Message-ID: <Z-wDa2aLDKQeetuG@gourry-fedora-PF4VCD3F>
References: <20250321180731.568460-1-gourry@gourry.net>
 <Z-remBNWEej6KX3-@gourry-fedora-PF4VCD3F>
 <3e3115c0-c3a2-4ec2-8aea-ee1b40057dd6@redhat.com>
 <Z-v7mMZcP1JPIuj4@gourry-fedora-PF4VCD3F>
 <4d051167-9419-43fe-ab80-701c3f46b19f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d051167-9419-43fe-ab80-701c3f46b19f@redhat.com>

On Tue, Apr 01, 2025 at 04:50:40PM +0200, David Hildenbrand wrote:
> 
> Oh, you mean with the whole memmap_on_memory thing. Even with that, using
> 2GB memory blocks would only fit a single 1GB memory block ... and it
> requires ZONE_NORMAL.
> 
> For ordinary boot memory, the 1GB behavior should be independent of the
> memory block size (a 1GB page can span multiple blocks as long as they are
> in the same zone), which is the most important thing.
> 
> So I don't think it's a concern for DAX right now. Whoever needs that, can
> disable the memmap_on_memory option.
>

If we think it's not a major issue then I'll rebase onto latest and push
a v9.  I think there was one minor nit left.

I suppose folks can complain to their vendors about alignment if they
don't want 60000 memoryN entries on their huge-memory-systems.

Probably we still want this warning?  Silent truncation still seems
undesirable.

~Gregory
