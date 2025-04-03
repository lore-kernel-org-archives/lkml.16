Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11C24EA90
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688996; cv=none; b=Omb4nC06cR69Gxl9vzFwnBQtnfLzoEPaE3mhbbELp/3tdH2KtTSON7qoZBa7yghpfBFHjzWIfoTqFRoIam7TCBF/AcEhSwGLk4l1u+j7bM4jaBoeB6ImqhnH1ojOYS/X7OoeEE4vC7XSVFqFpeTc5gZlgdyZRFFgeYle0OPh2ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688996; c=relaxed/simple;
	bh=PLIry9I5MN5+p97bRNx+HoFhgLJY0z5+1qZUMALAcao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbBcaL+z4FJNrtn/WOPH1Ys+r8doM4M1efWk3h8hT0E9AC60+rxeoFqUaetzjczUXNMSSpyWNrVc0Gl0f23wxb1ICw7zmwZqFmYQREs8i/eL36Kh1sNwu7CZNjiNBsBmsagsc4XxxuRNp97F6vLJuToN2Yzq1OChsah80V/KGvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c//xpXpw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c//xpXpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743688994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4WBThcQneZqddzRwqfMjSBi+IuLp0YfEk4vsedSbljI=;
	b=c//xpXpwuA7sSaqP6vvkfMBTzxsd7yz06U9r1DgLUS756U3/x79VmZXHJ0jOwwJiYDHfvE
	VOnxJqXk97boCHOGvp1702//8LbcMn8CZiL4eW1TqjQDGQXCPMuDZt7ECrp4WO+mDJRCY4
	SOUUNUpQW56EXtS1rne6fZp2dKtljvM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-7okIe0VCPRyiAm_qCRWdDQ-1; Thu, 03 Apr 2025 10:03:11 -0400
X-MC-Unique: 7okIe0VCPRyiAm_qCRWdDQ-1
X-Mimecast-MFC-AGG-ID: 7okIe0VCPRyiAm_qCRWdDQ_1743688990
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so5695105e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 07:03:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743688990; x=1744293790;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WBThcQneZqddzRwqfMjSBi+IuLp0YfEk4vsedSbljI=;
        b=MCemkCYSbieLG9JezfcPFn5gbRmNwUugByDG60f+w8uHCHcTttrQ/vANtOrLY3uE3U
         F8hr7TR81CA5XCrgftzFEC0Er618gnMrdpAF1VNRPfjOpTBghu5XtSPjXFKx1DEOe3Sw
         bNbHF5l1GFznVKdgy+GDENKNgWydDtof3x5B1H+hJdmyDzHeoc/JdkmdGvllQvQAyAJB
         wLvCqSLc2MGea/ixF2kywbwIRlHyydItk/LVKgZXU4J5NK8bu/vzWlXFTqWVwcKegPkI
         s8UTMAfLW7zIUsDAvlcrwAHD2gBCohhYTcn1vfdYaO0PvdA/h+VkB1ZpuZnRveV0+9GZ
         yoAw==
X-Forwarded-Encrypted: i=1; AJvYcCUqMucMi7uiqBOrcQ5HDFhT9j9SJnhDXbe7D9NvUnopG9bHY31ZUZh5uqzJmue4hnsEuw3VYjLiIM6t75s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8dhrKPwtHBHyAIgx9zgeSkMRaIhOi9RHDZxGcP+GzvBFRSKZw
	P6b3grBfi1Da6Ho2P8MRRQWfXEvM1DfS+zmuXosr00a9QGEcrPOlBAnEp+daguLxAy1R0LKgUFH
	mhmY5B9p/4VfM9r1xt1Q0KTIXuB4IijjdvoqvBKEGmdC07sRuiUI+sLBHiYxRNm5uFlMuig==
X-Gm-Gg: ASbGncuG3+TDT9+WL3A5Zur89dwvnuNLmVq/vLZoEk7spN9UEu9T9Kmj9/GPEXiSOwC
	qFPaCnqOaTX+RX2TuyNhxwp3xc90PlcxlBxLb/6ij+5rFN835+z7aaTge0Qsj3ULGSOEpsQuAtb
	5c4mcNI6cHGeAtuWKvNYq3UP3GSkxaFDK9WKnR+4iaZuKBmeeYYRuWOYSxsSUovbrT7yrtnKGds
	iqy9oUfZ0ikbi/gTpjZHOEpjO4vCfU0aCCP22w2uddqEdy9VqCcoGVQRjcPd1Szq836HgRSev/M
	dgD3Ivrz8A==
X-Received: by 2002:a05:6000:250e:b0:391:39fb:59c8 with SMTP id ffacd0b85a97d-39c30338008mr2275602f8f.25.1743688990048;
        Thu, 03 Apr 2025 07:03:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHC2+/8ybqHkABA5XplMD4M48h+miairALBzMuE16io0YC/ba6y7OVR2eUT30wn6NDVL3wRjQ==
X-Received: by 2002:a05:6000:250e:b0:391:39fb:59c8 with SMTP id ffacd0b85a97d-39c30338008mr2275550f8f.25.1743688989617;
        Thu, 03 Apr 2025 07:03:09 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea9a88b70sm44441485e9.3.2025.04.03.07.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:03:09 -0700 (PDT)
Date: Thu, 3 Apr 2025 10:03:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Fohrer <markus.fohrer@webked.de>
Cc: virtualization@lists.linux-foundation.org, jasowang@redhat.com,
	davem@davemloft.net, edumazet@google.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] Massive virtio-net throughput drop in guest VM with
 Linux 6.8+
Message-ID: <20250403100206-mutt-send-email-mst@kernel.org>
References: <1d388413ab9cfd765cd2c5e05b5e69cdb2ec5a10.camel@webked.de>
 <20250403090001-mutt-send-email-mst@kernel.org>
 <f8909f5bbc2532ea234cdaa8dbdb46a48249803f.camel@webked.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8909f5bbc2532ea234cdaa8dbdb46a48249803f.camel@webked.de>

On Thu, Apr 03, 2025 at 03:51:01PM +0200, Markus Fohrer wrote:
> Am Donnerstag, dem 03.04.2025 um 09:04 -0400 schrieb Michael S.
> Tsirkin:
> > On Wed, Apr 02, 2025 at 11:12:07PM +0200, Markus Fohrer wrote:
> > > Hi,
> > > 
> > > I'm observing a significant performance regression in KVM guest VMs
> > > using virtio-net with recent Linux kernels (6.8.1+ and 6.14).
> > > 
> > > When running on a host system equipped with a Broadcom NetXtreme-E
> > > (bnxt_en) NIC and AMD EPYC CPUs, the network throughput in the
> > > guest drops to 100–200 KB/s. The same guest configuration performs
> > > normally (~100 MB/s) when using kernel 6.8.0 or when the VM is
> > > moved to a host with Intel NICs.
> > > 
> > > Test environment:
> > > - Host: QEMU/KVM, Linux 6.8.1 and 6.14.0
> > > - Guest: Linux with virtio-net interface
> > > - NIC: Broadcom BCM57416 (bnxt_en driver, no issues at host level)
> > > - CPU: AMD EPYC
> > > - Storage: virtio-scsi
> > > - VM network: virtio-net, virtio-scsi (no CPU or IO bottlenecks)
> > > - Traffic test: iperf3, scp, wget consistently slow in guest
> > > 
> > > This issue is not present:
> > > - On 6.8.0 
> > > - On hosts with Intel NICs (same VM config)
> > > 
> > > I have bisected the issue to the following upstream commit:
> > > 
> > >   49d14b54a527 ("virtio-net: Suppress tx timeout warning for small
> > > tx")
> > >   https://git.kernel.org/linus/49d14b54a527
> > 
> > Thanks a lot for the info!
> > 
> > 
> > both the link and commit point at:
> > 
> > commit 49d14b54a527289d09a9480f214b8c586322310a
> > Author: Eric Dumazet <edumazet@google.com>
> > Date:   Thu Sep 26 16:58:36 2024 +0000
> > 
> >     net: test for not too small csum_start in virtio_net_hdr_to_skb()
> >     
> > 
> > is this what you mean?
> > 
> > I don't know which commit is "virtio-net: Suppress tx timeout warning
> > for small tx"
> > 
> > 
> > 
> > > Reverting this commit restores normal network performance in
> > > affected guest VMs.
> > > 
> > > I’m happy to provide more data or assist with testing a potential
> > > fix.
> > > 
> > > Thanks,
> > > Markus Fohrer
> > 
> > 
> > Thanks! First I think it's worth checking what is the setup, e.g.
> > which offloads are enabled.
> > Besides that, I'd start by seeing what's doing on. Assuming I'm right
> > about
> > Eric's patch:
> > 
> > diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> > index 276ca543ef44d8..02a9f4dc594d02 100644
> > --- a/include/linux/virtio_net.h
> > +++ b/include/linux/virtio_net.h
> > @@ -103,8 +103,10 @@ static inline int virtio_net_hdr_to_skb(struct
> > sk_buff *skb,
> >  
> >  		if (!skb_partial_csum_set(skb, start, off))
> >  			return -EINVAL;
> > +		if (skb_transport_offset(skb) < nh_min_len)
> > +			return -EINVAL;
> >  
> > -		nh_min_len = max_t(u32, nh_min_len,
> > skb_transport_offset(skb));
> > +		nh_min_len = skb_transport_offset(skb);
> >  		p_off = nh_min_len + thlen;
> >  		if (!pskb_may_pull(skb, p_off))
> >  			return -EINVAL;
> > 
> > 
> > sticking a printk before return -EINVAL to show the offset and
> > nh_min_len
> > would be a good 1st step. Thanks!
> > 
> 
> 
> Hi Eric,
> 
> thanks a lot for the quick response — and yes, you're absolutely right.
> 
> Apologies for the confusion: I mistakenly wrote the wrong commit
> description in my initial mail.
> 
> The correct commit is indeed:
> 
> commit 49d14b54a527289d09a9480f214b8c586322310a
> Author: Eric Dumazet <edumazet@google.com>
> Date:   Thu Sep 26 16:58:36 2024 +0000
> 
>     net: test for not too small csum_start in virtio_net_hdr_to_skb()
> 
> This is the one I bisected and which causes the performance regression
> in my environment.
> 
> Thanks again,
> Markus


I'm not Eric but good to know.
Alright, so I would start with the two items: device features and
printk.

-- 
MST

