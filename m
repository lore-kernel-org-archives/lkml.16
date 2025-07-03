Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCDC1F1906
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539898; cv=none; b=uendmnSJuGBxFCn7hdnT+tFSAkXRwAt/NMCzmX9Zf6DYwRrPQs/cIpjxw4dM7oyu6r7GTLrzRbO5B+RF6QeIkXC3ejwJx52G+9ZqjBksJpbCmxpAhQYckPCHdEv/hjUu0DQLPSWbbnN3DDWdJ0dGgH53aeGNSOwlHxSuDBHW+wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539898; c=relaxed/simple;
	bh=OqvSnj012lk+x7sxrjtbztoI/YmrJYSA0WWNrX5Fpj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzWxrp9dRIb57whnY0Oo9zC+LjBiS5I3YJGKT51hfB9HVCHjlxl9j3JwqieMLal1dWy1oJ6yqVQGV4kK3NSUll0VZ2jJScC54UGQ0uzgRXQXCvJvg27+TDhxx2pGkfr7euKCTnv//SejFLtxVs2GggrHqt53fwvOp1OIF/SZzXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H3N5BSfF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H3N5BSfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751539895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PTP2cROOIMAlCq/5T6gTKModShdkxtZnGGTA7OvrtwI=;
	b=H3N5BSfFWDrDRV95R4aNyBp5ThsfEFj0ZFfB5N4BWe0DoBQDyFqXGqxUA2iiMrflhrngaI
	tqOuScSSAMqeuWdoypEPKy+oITZSNvdDc65GjFNU9Ma9TKW/8r9m/ouFLgJQmKDwpSXugy
	s4MJFShFlRIz4oCl2Fkjg5jZU9aLGMw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-FseMB3ydO-iE51N-hRdA_w-1; Thu, 03 Jul 2025 06:51:34 -0400
X-MC-Unique: FseMB3ydO-iE51N-hRdA_w-1
X-Mimecast-MFC-AGG-ID: FseMB3ydO-iE51N-hRdA_w_1751539893
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f85f31d9so3323419f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 03:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751539893; x=1752144693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTP2cROOIMAlCq/5T6gTKModShdkxtZnGGTA7OvrtwI=;
        b=P5wE6iK2Wk+Lzaor4J+EGigi0zSBmm1kV+JYLKKwbYFQc9ZRcfjMsQzp4XHDFHiu5e
         koRCWw9+ElM8py+iAVre4F5W/YEE+/YUBwyRW7nC3jVCHsVna2iIb18+q8DdestYp0po
         lMScIe1HFBnEe9TbEp8QDu7LWrO5kLUbweRfkcOyF36eNIQtl8r3Ma7VGXATB9hzMrUz
         BzoBwrSCnvTxDKcQjnC2aujRJtvGr6lZyTwWONb521bTmhEfW0UcnkBFC21NUU3V0aUA
         rNRyOKPVfcWvI1orrV6lakdBTgQxKo2szNOHQZoBITfKH6NaAGjuiiJlvYKr50oCRA9O
         VYQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQh56YJhg0wWkCbIlPDTHv9qntIIEBA3xWDyUnbaMS/+Tv6K9Il2VShbt7dheH7Yf/w5PItHhJrAroqNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFxhG12L15AQnEM/dqNTmrLGD7QJ2WJPmx/vcDP5kN+gdlleKm
	lT3w/XHeUr5OFBSUciSSDCxQ6bcoP75Upazlq/lvZRsAGqZvLYhe7lz8Vbk6IWKIeN/gE3PjD21
	jinPdf3seWLUwmLV0tddyqcZCK37IcG5fGY3LkcNxm5B25n8/uJnlfQtxAdrrYemNXg==
X-Gm-Gg: ASbGncsHAJTaArG/lmKHxCjFSqEf7GDJk+hrzHSnndGS/hMw0gNBW0qF8QUflreybsQ
	mk5v43K34rEMVwnpUupB+oBEY8bV4+L959KOHBmN8CaebYziHj8UD28kZMQCOfF/VxKcfZndYhi
	30ezPoqlRnyPB9r4Y/FNc6tHsNziDmRF3HRwMeOBAJ+sIiNB7qo1/Dpot6PQ37AG0fHuJQ3za2L
	FNVY7Ws/UQKdgnoGmQPXADw3I0bllexxoC4zi4Avk0iir6Qag9escDueWDTbCu7pZw73g/0jLfb
	uViwpZyjX87aldwYRFycj6XGDzGe
X-Received: by 2002:a05:6000:98a:b0:3a0:aed9:e34 with SMTP id ffacd0b85a97d-3b32fa3aaa1mr2092541f8f.48.1751539893417;
        Thu, 03 Jul 2025 03:51:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaIrtPC6+L1M9apwjRSTfcpVN1M7WJhIIwoutF3s+xjdaNvBgiwXew6JQLCZDeO5sbSJK9KA==
X-Received: by 2002:a05:6000:98a:b0:3a0:aed9:e34 with SMTP id ffacd0b85a97d-3b32fa3aaa1mr2092503f8f.48.1751539892823;
        Thu, 03 Jul 2025 03:51:32 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.161.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e62144sm18619571f8f.92.2025.07.03.03.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:51:32 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:51:25 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	HarshaVardhana S A <harshavardhana.sa@broadcom.com>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Vishnu Dasa <vishnu.dasa@broadcom.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, virtualization@lists.linux.dev, 
	stable <stable@kernel.org>
Subject: Re: [PATCH net] vsock/vmci: Clear the vmci transport packet properly
 when initializing it
Message-ID: <ktxstfr4rxrvk4pvdreumdch55ieexfclozovszm24o6xmb7zd@nmo2w2ffu2kw>
References: <20250701122254.2397440-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250701122254.2397440-1-gregkh@linuxfoundation.org>

On Tue, Jul 01, 2025 at 02:22:54PM +0200, Greg Kroah-Hartman wrote:
>From: HarshaVardhana S A <harshavardhana.sa@broadcom.com>
>
>In vmci_transport_packet_init memset the vmci_transport_packet before
>populating the fields to avoid any uninitialised data being left in the
>structure.
>
>Cc: Bryan Tan <bryan-bt.tan@broadcom.com>
>Cc: Vishnu Dasa <vishnu.dasa@broadcom.com>
>Cc: Broadcom internal kernel review list
>Cc: Stefano Garzarella <sgarzare@redhat.com>
>Cc: "David S. Miller" <davem@davemloft.net>
>Cc: Eric Dumazet <edumazet@google.com>
>Cc: Jakub Kicinski <kuba@kernel.org>
>Cc: Paolo Abeni <pabeni@redhat.com>
>Cc: Simon Horman <horms@kernel.org>
>Cc: virtualization@lists.linux.dev
>Cc: netdev@vger.kernel.org
>Cc: stable <stable@kernel.org>
>Signed-off-by: HarshaVardhana S A <harshavardhana.sa@broadcom.com>
>Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>---
>Tweaked from original version by rewording the text and adding a blank
>line and correctly sending it to the proper people for inclusion in net.
>
> net/vmw_vsock/vmci_transport.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Stefano Garzarella <sgarzare@redhat.com>

Patch LGTM, we can fix the switch later.

Stefano

>
>diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
>index b370070194fa..7eccd6708d66 100644
>--- a/net/vmw_vsock/vmci_transport.c
>+++ b/net/vmw_vsock/vmci_transport.c
>@@ -119,6 +119,8 @@ vmci_transport_packet_init(struct vmci_transport_packet *pkt,
> 			   u16 proto,
> 			   struct vmci_handle handle)
> {
>+	memset(pkt, 0, sizeof(*pkt));
>+
> 	/* We register the stream control handler as an any cid handle so we
> 	 * must always send from a source address of VMADDR_CID_ANY
> 	 */
>@@ -131,8 +133,6 @@ vmci_transport_packet_init(struct vmci_transport_packet *pkt,
> 	pkt->type = type;
> 	pkt->src_port = src->svm_port;
> 	pkt->dst_port = dst->svm_port;
>-	memset(&pkt->proto, 0, sizeof(pkt->proto));
>-	memset(&pkt->_reserved2, 0, sizeof(pkt->_reserved2));
>
> 	switch (pkt->type) {
> 	case VMCI_TRANSPORT_PACKET_TYPE_INVALID:
>-- 
>2.50.0
>

