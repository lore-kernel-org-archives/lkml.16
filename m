Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0122B194C86
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755215; cv=none; b=dRCP9gyFPPLZQdC+TmIwktaoLBalBRFwH2Mh7qkZMb1W77gEuREMdZXiiLPtZ+vmV18+/5idNTIO3J2F34AiUS6Hn1aQB7WqJU6N2HCk1XosQJZmX0pyJx5RqizK6nDEzRohyHTAvvBTvUzToa8GtJ2wfVzwCzVHlOJof0Hiduo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755215; c=relaxed/simple;
	bh=mxOPmaHNNmijVfz1CVwVMXGKnvkZakTcfnOKolxNCzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gi+yzufIXvnZTYrNgdOUJNxbE2zNnqwxR9k6QL3WncjUnSpwVrhUPJqkTnIrYjXPCEqijx5Htr5vBjGFXGHLpbmhOBAX+VWsviQULI60+Qi+7zqyQJKbFvsEpyDwNlUfyLU0hfHBWaLayjfiROKdstZY9gkLN4uNtY4g0SVYTVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H0nabsVh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H0nabsVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743755211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c3R/FwwTm36lOogPDfsrJ2NATa0Y/PG/vq80IpIZYTw=;
	b=H0nabsVhaUISUFAFrxSr7tyZp02dIqD0zbf9+pVeYc7Aeu530oppv75XuWfqdo6KqtJIXv
	4Yxwar6WNY5XonrGO0zn2x7otMWJkwJmbPjOABBvwtfuwno1lgOcbCveIvYGVsWGfe+gG0
	gVjZmICGpCsZFEtKn/ukuV9FmSG7nP8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-GsclKqzTNo2x8fNAjj_Ykw-1; Fri, 04 Apr 2025 04:26:50 -0400
X-MC-Unique: GsclKqzTNo2x8fNAjj_Ykw-1
X-Mimecast-MFC-AGG-ID: GsclKqzTNo2x8fNAjj_Ykw_1743755209
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912b54611dso1060553f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743755209; x=1744360009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3R/FwwTm36lOogPDfsrJ2NATa0Y/PG/vq80IpIZYTw=;
        b=AZNynwfbrBOPykoxu0IObo2G7ZEE0gaLtE6cPxOzNA7U55y9ugpGoMFZDnBFy1NyE/
         uuTUODIsbsf6ECX1SeQw/9Nl4W4pLOTt2QFXqWLc4Ck3etFfJ8EC2GD1DU7BEbWWZ4rx
         cWtZ8tgp9oVsH7tz2VFqEuwU/XLPOVTOGnlsWE/dDx46I11N3Pk+jawLgYPnrXIasHrf
         PiOWyn3kRp0ULfYAUA+BZrqPk33PbxUcgeec/XIjokm4bBCORbc3LeGeJeHJYleMILAy
         lDKvDTtJCNwfN49Gt+b6Xtl2S/XEga0NBXS0btpEDqV1sLqQC7xSpCDjmy5tjW5lwsy1
         C7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVh2ZPXPVyJ2J0iMG5PDHrcpq4zUn+rLzb74ecF1Ov5G9Kn16c3B20nIxz2Tw3kbTlekqhFgpecKkaPohg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxWsWD5QhcmNjEotPJlA+fl8SPhl+spDJmZo+cf4GH0YUvPEsA
	LaPWw307pqvLX57GJI10uAhFlKiFGlPNWNk7melFqM6vzkCntasgY0mbtOJ+cSEAYuRo4kbl604
	2iNtxvoLloNaBn4BaGDhrswRxnPRC9nh3bRWGhEjBQRLDo7whSVXifvQhpmfpCg==
X-Gm-Gg: ASbGnctfDkErD2+iWZZ4KeFw3G5fX5hVoqfd5fVoeFHmPb79HHDRg1Ge58RvKnYb6gr
	rJcre6tqTPS3nwYj2pySQKHBzDRnnmK8Vq7FkMG3T8W57HW8sWnWAqQwCXhJArSg6vwFc+J9kkp
	RFdpHwBXLtFwzUdRf2fkH4+JoW5irWSPN93uCpPk+ouNIZMXPRceRbmbvt4lfL/+P6Fc/OD18dF
	3mCqW8dL5DsmkS//a3U5csi0FNq+y4ac08S6p+56pWOJNroZUnFryBwzPN27Ss43W+bTvFUHwaX
	VJvtkl/Vyw==
X-Received: by 2002:a05:6000:1845:b0:391:3cb0:3d8d with SMTP id ffacd0b85a97d-39d0de179e8mr1425006f8f.19.1743755209060;
        Fri, 04 Apr 2025 01:26:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFry/je4DWnZKjNa0BdbFTTJdiIP/YGNaOLTb1x67wtVqnOvUq7clsozKVFoIyWoDydiJxwVQ==
X-Received: by 2002:a05:6000:1845:b0:391:3cb0:3d8d with SMTP id ffacd0b85a97d-39d0de179e8mr1424982f8f.19.1743755208677;
        Fri, 04 Apr 2025 01:26:48 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b8ad6sm3848446f8f.56.2025.04.04.01.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:26:48 -0700 (PDT)
Date: Fri, 4 Apr 2025 04:26:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Torsten Krah <krah.tm@gmail.com>
Cc: virtualization@lists.linux-foundation.org,
	Markus Fohrer <markus.fohrer@webked.de>, jasowang@redhat.com,
	davem@davemloft.net, edumazet@google.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] Massive virtio-net throughput drop in guest VM with
 Linux 6.8+
Message-ID: <20250404041708-mutt-send-email-mst@kernel.org>
References: <1d388413ab9cfd765cd2c5e05b5e69cdb2ec5a10.camel@webked.de>
 <4d0c0cb9e9d513bf9ba81346ea72c9e58359ff93.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d0c0cb9e9d513bf9ba81346ea72c9e58359ff93.camel@gmail.com>

On Fri, Apr 04, 2025 at 09:59:19AM +0200, Torsten Krah wrote:
> Am Mittwoch, dem 02.04.2025 um 23:12 +0200 schrieb Markus Fohrer:
> > When running on a host system equipped with a Broadcom NetXtreme-E
> > (bnxt_en) NIC and AMD EPYC CPUs, the network throughput in the guest
> > drops to 100–200 KB/s. The same guest configuration performs normally
> > (~100 MB/s) when using kernel 6.8.0 or when the VM is moved to a host
> > with Intel NICs.
> 
> Hi,
> 
> as I am affected too, here is the link to the Ubuntu issue, just in
> case someone wants to have a look:
> 
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2098961
> 
> We're seeing lots of those in dmesg output:
> 
> [  561.505323] net_ratelimit: 1396 callbacks suppressed
> [  561.505339] ens18: bad gso: type: 4, size: 1448
> [  561.505343] ens18: bad gso: type: 4, size: 1448
> [  561.507270] ens18: bad gso: type: 4, size: 1448
> [  561.508257] ens18: bad gso: type: 4, size: 1448
> [  561.511432] ens18: bad gso: type: 4, size: 1448
> [  561.511452] ens18: bad gso: type: 4, size: 1448
> [  561.514719] ens18: bad gso: type: 4, size: 1448
> [  561.514966] ens18: bad gso: type: 4, size: 1448
> [  561.518553] ens18: bad gso: type: 4, size: 1448
> [  561.518781] ens18: bad gso: type: 4, size: 1448
> [  566.506044] net_ratelimit: 1363 callbacks suppressed
> 
> 
> And another interesting thing we observed - at least in our environment
> - that we can trigger that regression only with IPv4 traffic (bad
> performance and lots of bad gso messages) - if we only use IPv6, it
> does work (good performance and not one bad gso message).
> 
> kind regards
> 
> Torsten


I suspect it's something weird on the ubuntu hypervisor side,
supplying wrong checksum offsets.

Can you stick a printk here:
                if (skb_transport_offset(skb) < nh_min_len)
                        return -EINVAL;

printing, on error, all of: start, off, needed, nh_min_len.


Also, what kind of device is this? QEMU? vhost-user? vhost-net?
Thanks!

-- 
MST

