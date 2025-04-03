Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AC084D08
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685487; cv=none; b=RlLQaGYx4m5qdNqzCFEC1uz7lo4oMkiJZXcHhRvxe6OKL4HAHQ3U31E7N+sWr7iV0CnOnlq/jslzj9gvXxvkWj6FI+4opaIwW92t2BywNuvu7WSSEr1YxhKIMPezG/G2hk8TEdmuB+QIs89zbW/s4qATrBsCAQ1AHT/YCoCKPqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685487; c=relaxed/simple;
	bh=xTHY4RqEjxr86dYlWDDlxCi7O3MBBVTaufQtaP1th6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhOx6I1+QohZ0ugO0lGmBqA4vBfF34s7Otj7ajOBUMThEDPvxLHTpxyMN5llZ3G1erkkBQV1e6eLGDcU53FO1WMwL8NfFdidndAClx3TEnH5o3BB/F1fAyHHsB2wwwDno2k29LPRzlnF7RZ+cZQTNMarRLhceX84S70sDtR5rXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NpWrolEl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NpWrolEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743685484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iiWiLDEE7GXuot+rO5fuKhXP+Y+h9zA73k2z71ZTW1I=;
	b=NpWrolElrooxQY+WBR4seSfVf3iSqJQcndxWyYJ56PBcMm5LDcwHELwdJJFWA4GP/bziBC
	lrYka9c6BRRcKQv0GrW2uYghqo3LTBjMUXXECotypZwo1npQ9i9NEkLBwca6O4cJ5X4cub
	6eaR7LERvwB5hr1z2g5To79hADy+zIg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-bX-LhIO1OymOhXSs7wP2Qg-1; Thu, 03 Apr 2025 09:04:43 -0400
X-MC-Unique: bX-LhIO1OymOhXSs7wP2Qg-1
X-Mimecast-MFC-AGG-ID: bX-LhIO1OymOhXSs7wP2Qg_1743685482
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391315098b2so435125f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743685482; x=1744290282;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iiWiLDEE7GXuot+rO5fuKhXP+Y+h9zA73k2z71ZTW1I=;
        b=wy46jgHF4OwtnFVhKqnBcyTJR8r3Zof+jn1o8SyUqBZ5Nx3WEA0JimVrESCnWxNXp5
         bBJjPAmxZpzXIwtY/Cgsep/AWPjiWiVsJZ92PD1boraso8jM1sd7kPlkWhwTbvjaNle1
         stp3OGUH4kMYxQt5l8Gg7+1VE4DlIMLFvSWFfPbA4kkLJvZVgs8yvAWx4JNEOWKs7iIh
         u/K/BBlvhnONh/HiReJz1hWwmApxNO9bxw2+wvfrAu6uM3BUnDfUg6hkQT3ZMqpBlis1
         HnAq/7s4WUNjSKPfOBbHefvi9ojrzeNqvdPoqi5KvacLt8fPLxYvsw+hMUB2wV2eX/Jm
         ZN0g==
X-Forwarded-Encrypted: i=1; AJvYcCV4JLJX1TVSDcmo9GFtZLvAAvlWuhTEtnc+v4NXUav7ZWRoH1NMlwG3/xurorlazSo2TKPQ5sH8zeRYElU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw791jIhKESOn5IUqP/IA48VbM1f21dhN2v7q8nAjzoV710QoMT
	w+bFxsqwwVfa3JaTMtR9x+SaCm5+yQA0I57pji4Jt/lKriJkphdiezgVv6swgT8rgHjU9EDqLO2
	rcel4om74QfTZ7IpI+mU/PQG+D45X1hW5vXDewwQwd8B9NqKEigDGqy0vkbTrzQ==
X-Gm-Gg: ASbGncsj/Rjx6FmixSeQrGYNLc5eb1r/Tw6XwcPVef/6WIbYt+kQqO1VxgeI1C5+v1U
	OOrmVtJz+RDjCvFDYS2FAIHT8vpdB2gDDv8PjOt8kLn7red3u8pMeTKo0DfzV911Qa3yXg2EFxm
	sqQZdO9tdp5+iPlqFzQnb5oBYvgdljzMjaogLQS4iZxHSOVQ1w0Ov0Lxlcq0tOKhnKaM4AnUZ46
	/lz2/iqWjpomlGGHpiZUHl/PoutP0yL6YTclxHjdIZp1TWmsPIAw1tcV0a8AhufWIv/5DdM+ctb
	fXYOWa/khw==
X-Received: by 2002:adf:9c84:0:b0:39c:1257:c96d with SMTP id ffacd0b85a97d-39c2f966641mr1596390f8f.57.1743685482162;
        Thu, 03 Apr 2025 06:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyvtZMESrru/rDb7nkZxZrQw7eiIgzM7eJY1ncVRnEeIZHyQ07e7ml/r0pMPgg9T3VfQ2QCA==
X-Received: by 2002:adf:9c84:0:b0:39c:1257:c96d with SMTP id ffacd0b85a97d-39c2f966641mr1596357f8f.57.1743685481755;
        Thu, 03 Apr 2025 06:04:41 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364ec90sm17785675e9.27.2025.04.03.06.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:04:41 -0700 (PDT)
Date: Thu, 3 Apr 2025 09:04:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Fohrer <markus.fohrer@webked.de>
Cc: virtualization@lists.linux-foundation.org, jasowang@redhat.com,
	davem@davemloft.net, edumazet@google.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] Massive virtio-net throughput drop in guest VM with
 Linux 6.8+
Message-ID: <20250403090001-mutt-send-email-mst@kernel.org>
References: <1d388413ab9cfd765cd2c5e05b5e69cdb2ec5a10.camel@webked.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d388413ab9cfd765cd2c5e05b5e69cdb2ec5a10.camel@webked.de>

On Wed, Apr 02, 2025 at 11:12:07PM +0200, Markus Fohrer wrote:
> Hi,
> 
> I'm observing a significant performance regression in KVM guest VMs using virtio-net with recent Linux kernels (6.8.1+ and 6.14).
> 
> When running on a host system equipped with a Broadcom NetXtreme-E (bnxt_en) NIC and AMD EPYC CPUs, the network throughput in the guest drops to 100–200 KB/s. The same guest configuration performs normally (~100 MB/s) when using kernel 6.8.0 or when the VM is moved to a host with Intel NICs.
> 
> Test environment:
> - Host: QEMU/KVM, Linux 6.8.1 and 6.14.0
> - Guest: Linux with virtio-net interface
> - NIC: Broadcom BCM57416 (bnxt_en driver, no issues at host level)
> - CPU: AMD EPYC
> - Storage: virtio-scsi
> - VM network: virtio-net, virtio-scsi (no CPU or IO bottlenecks)
> - Traffic test: iperf3, scp, wget consistently slow in guest
> 
> This issue is not present:
> - On 6.8.0 
> - On hosts with Intel NICs (same VM config)
> 
> I have bisected the issue to the following upstream commit:
> 
>   49d14b54a527 ("virtio-net: Suppress tx timeout warning for small tx")
>   https://git.kernel.org/linus/49d14b54a527

Thanks a lot for the info!


both the link and commit point at:

commit 49d14b54a527289d09a9480f214b8c586322310a
Author: Eric Dumazet <edumazet@google.com>
Date:   Thu Sep 26 16:58:36 2024 +0000

    net: test for not too small csum_start in virtio_net_hdr_to_skb()
    

is this what you mean?

I don't know which commit is "virtio-net: Suppress tx timeout warning for small tx"



> Reverting this commit restores normal network performance in affected guest VMs.
> 
> I’m happy to provide more data or assist with testing a potential fix.
> 
> Thanks,
> Markus Fohrer


Thanks! First I think it's worth checking what is the setup, e.g.
which offloads are enabled.
Besides that, I'd start by seeing what's doing on. Assuming I'm right about
Eric's patch:

diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
index 276ca543ef44d8..02a9f4dc594d02 100644
--- a/include/linux/virtio_net.h
+++ b/include/linux/virtio_net.h
@@ -103,8 +103,10 @@ static inline int virtio_net_hdr_to_skb(struct sk_buff *skb,
 
 		if (!skb_partial_csum_set(skb, start, off))
 			return -EINVAL;
+		if (skb_transport_offset(skb) < nh_min_len)
+			return -EINVAL;
 
-		nh_min_len = max_t(u32, nh_min_len, skb_transport_offset(skb));
+		nh_min_len = skb_transport_offset(skb);
 		p_off = nh_min_len + thlen;
 		if (!pskb_may_pull(skb, p_off))
 			return -EINVAL;


sticking a printk before return -EINVAL to show the offset and nh_min_len
would be a good 1st step. Thanks!

