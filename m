Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E876192D6B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655953; cv=none; b=DZ0sBrplC/GZ+LKDQn86n1TmhrpOAE6im5hUVVVdv0HSRBHRZx2JuBPv6ajClIu30c/cVoCan9gQNGZXYLoloFI/PyCmz+2lKpI3/8EyuknmudQVinAyYEqTFgBENuOAEUaVMwYFNz6dh8yMClyK8CH9osLSDdoxgtjTEO1BeJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655953; c=relaxed/simple;
	bh=3l2S1L46U8XsU4sWtbSp+mYEbAJYokaHNWfzbDztxOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iBmV0lejv5phs9A0+gRqAeQ1KS5HSmmbMSnyrYdv68X5VsejSMJtlpS4Yhcluz6LZFVSqyFGi6lRYD+DXK+F8lG1ehbZIGyw9rNAYZPSNB6HQxHtuSVI8YPgmCqlxKmVjm/flWgWs0FIidcB1v+Rtr8L8Mq40EM1L0YgAZC88bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fHnLcf05; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fHnLcf05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744655950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r/iXXqChlzjbODZfwDRdIt5xwYfNbSaluxaykDmQl48=;
	b=fHnLcf05tU3GqPKzWKQStsbQ+83HP84zJeR3jay6zEt66O61JqrrxPWh4SNY3KLjZi1Rcy
	+o2C3bpmp2QaX1RWAKdL1GevWHwFa3H7yynBZZEyIaNyCYDumfW3TCZctEhbNGIvAC6Z9/
	h7SpVpdx5ZkIJkPiYTppJu9EzTBvA5A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-qIpCeFwoO7SoVYG7miSQIg-1; Mon, 14 Apr 2025 14:39:09 -0400
X-MC-Unique: qIpCeFwoO7SoVYG7miSQIg-1
X-Mimecast-MFC-AGG-ID: qIpCeFwoO7SoVYG7miSQIg_1744655948
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39131851046so1660215f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744655948; x=1745260748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r/iXXqChlzjbODZfwDRdIt5xwYfNbSaluxaykDmQl48=;
        b=cP60MRs+W7Uh+6SLFl6+zGkm/W17vB4QtkapqkzXr4oFJsNxj2L7O5A7T7CwVJv/7f
         PbtlCEbBciAlc24acxt1Q0jtfBU85525yMsqS3mkTDP7XIewgwPeKSPRA0AVN6Ffq9FM
         xdq3hwE902Yt+Eeua0ka0uC9005ik3W68nfz+Rnq7nVTacnlgfCIVsSr2duEghv0BGL1
         7q0W6tbaI6/vfHNFSz2Cklq5CAiWk/D9zYyAn2a5KSptHSVGUTN9uDlpAgDYuINHlRpd
         a1dScOplCogAEdqvZyMdZLG5SqgsFXgzaG05QUIN4jGaDXuL3rsd44RWOTXHZFXqbe2u
         U0fg==
X-Forwarded-Encrypted: i=1; AJvYcCU/RX4VBNId5y64eEFUP2uHVvQMKDoD0FwzS2Z55fQPpldtW2MJqjHyr9uI0DKCkNSIt/GO9MR0Ny9gVXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYT3qu4ADx2lmMZpqBbTGgfScHKJLiJOmGvFIqaZmtcS0+korA
	Pj261MRe3piXVr9vtDiXTq755d+Xe6ZL54aAZbGGNX3irF5c+1q9HSm7aizi4+4ECd+WiMjgKaZ
	sQ1yiWnXHx/vjshgzcIL/nVOt6AMh8EEBK5fJpIZuYENfTMbTBFmYKGhlUAl6qQ==
X-Gm-Gg: ASbGncsQOG9bZC/Xu+szlE4O9E5sQ0rIJuk5jt2SFPiWk0aR4K3XR07ITzNGJYyPpJN
	6Ltp8QaJ8jM0/Hvv/xN1LEvlFOVv3KgY7b8fUtTgkdEPbphy1EQ1KhjkCC1JZO/cW+wjRmJBiGM
	bTrVfDRYsYSQXrwPTgi5M7F2f2IBdElhOyJCb0HhQ0qNjdiqy1A33dP0bQ9jAWGfs8OTeiV05G1
	DMMRPnj9B0BsmjxX1J7QJW83oEuldiuTv9bBgHyZGVP5wCtFnp4hqEvz7ue1kVWUW/hkuUH1ZrM
	nWiamA==
X-Received: by 2002:a5d:6da8:0:b0:39c:1424:3246 with SMTP id ffacd0b85a97d-39ea51d3527mr9946039f8f.2.1744655948211;
        Mon, 14 Apr 2025 11:39:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAxTcLnqSrTxH65+u6GiRouP7vWe1kbCg6AHGAsfsrltSDOoWgKmUYeCud8h0C9/BhA/o+Iw==
X-Received: by 2002:a5d:6da8:0:b0:39c:1424:3246 with SMTP id ffacd0b85a97d-39ea51d3527mr9946011f8f.2.1744655947712;
        Mon, 14 Apr 2025 11:39:07 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445788sm11861921f8f.93.2025.04.14.11.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 11:39:06 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:39:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: virtualization@lists.linux.dev, kvm@vger.kernel.org,
	netdev@vger.kernel.org, jasowang@redhat.com,
	michael.christie@oracle.com, pbonzini@redhat.com,
	stefanha@redhat.com, eperezma@redhat.com, joao.m.martins@oracle.com,
	joe.jin@oracle.com, si-wei.liu@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 9/9] vhost: add WARNING if log_num is more than limit
Message-ID: <20250414143039-mutt-send-email-mst@kernel.org>
References: <20250403063028.16045-1-dongli.zhang@oracle.com>
 <20250403063028.16045-10-dongli.zhang@oracle.com>
 <20250414123119-mutt-send-email-mst@kernel.org>
 <e00d882e-9ce7-48b0-bc2f-bf937ff6b9c3@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e00d882e-9ce7-48b0-bc2f-bf937ff6b9c3@oracle.com>

On Mon, Apr 14, 2025 at 09:52:04AM -0700, Dongli Zhang wrote:
> Hi Michael,
> 
> On 4/14/25 9:32 AM, Michael S. Tsirkin wrote:
> > On Wed, Apr 02, 2025 at 11:29:54PM -0700, Dongli Zhang wrote:
> >> Since long time ago, the only user of vq->log is vhost-net. The concern is
> >> to add support for more devices (i.e. vhost-scsi or vsock) may reveals
> >> unknown issue in the vhost API. Add a WARNING.
> >>
> >> Suggested-by: Joao Martins <joao.m.martins@oracle.com>
> >> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> > 
> > 
> > Userspace can trigger this I think, this is a problem since
> > people run with reboot on warn.
> 
> I think it will be a severe kernel bug (page fault) if userspace can trigger this.
> 
> If (*log_num >= vq->dev->iov_limit), the next line will lead to an out-of-bound
> memory access:
> 
>     log[*log_num].addr = vhost64_to_cpu(vq, desc.addr);
> 
> I could not propose a case to trigger the WARNING from userspace. Would you mind
> helping explain if that can happen?

Oh I see. the commit log made me think this is an actual issue,
not a debugging aid just in case.


> > Pls grammar issues in comments... I don't think so.
> 
> I did an analysis of code and so far I could not identify any case to trigger
> (*log_num >= vq->dev->iov_limit).
> 
> The objective of the patch is to add a WARNING to double confirm the case won't
> happen.
> 
> Regarding "I don't think so", would you mean we don't need this patch/WARNING
> because the code is robust enough?
> 
> Thank you very much!
> 
> Dongli Zhang


Let me clarify the comment is misleading.
All it has to say is:

	/* Let's make sure we are not out of bounds. */
	BUG_ON(*log_num >= vq->dev->iov_limit);

at the same time, this is unnecessary pointer chasing
on critical path, and I don't much like it that we are
making an assumption about array size here.

If you strongly want to do it, you must document it near
get_indirect: 
@log - array of size at least vq->dev->iov_limit


> > 
> >> ---
> >>  drivers/vhost/vhost.c | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>
> >> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> >> index 494b3da5423a..b7d51d569646 100644
> >> --- a/drivers/vhost/vhost.c
> >> +++ b/drivers/vhost/vhost.c
> >> @@ -2559,6 +2559,15 @@ static int get_indirect(struct vhost_virtqueue *vq,
> >>  		if (access == VHOST_ACCESS_WO) {
> >>  			*in_num += ret;
> >>  			if (unlikely(log && ret)) {
> >> +				/*
> >> +				 * Since long time ago, the only user of
> >> +				 * vq->log is vhost-net. The concern is to
> >> +				 * add support for more devices (i.e.
> >> +				 * vhost-scsi or vsock) may reveals unknown
> >> +				 * issue in the vhost API. Add a WARNING.
> >> +				 */
> >> +				WARN_ON_ONCE(*log_num >= vq->dev->iov_limit);
> >> +
> >>  				log[*log_num].addr = vhost64_to_cpu(vq, desc.addr);
> >>  				log[*log_num].len = vhost32_to_cpu(vq, desc.len);
> >>  				++*log_num;
> >> @@ -2679,6 +2688,15 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
> >>  			 * increment that count. */
> >>  			*in_num += ret;
> >>  			if (unlikely(log && ret)) {
> >> +				/*
> >> +				 * Since long time ago, the only user of
> >> +				 * vq->log is vhost-net. The concern is to
> >> +				 * add support for more devices (i.e.
> >> +				 * vhost-scsi or vsock) may reveals unknown
> >> +				 * issue in the vhost API. Add a WARNING.
> >> +				 */
> >> +				WARN_ON_ONCE(*log_num >= vq->dev->iov_limit);
> >> +
> >>  				log[*log_num].addr = vhost64_to_cpu(vq, desc.addr);
> >>  				log[*log_num].len = vhost32_to_cpu(vq, desc.len);
> >>  				++*log_num;
> >> -- 
> >> 2.39.3
> > 

