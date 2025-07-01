Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C532749CB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373749; cv=none; b=X+P97XDxW8VfUf+c5Fm+N+aS2xSQL/8EcxqlOk82X1T45HlHZFw4DeHRReL6+G4kCpgLSltYcb0SurNXRt7X2tuDZaLOITZLXA7YbDhCdim6V+ES79utwNJl1NlRaahhHSA2LUCor9MzcDYeIGSCP1Kd7BbqLWsrT0TJZUwHVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373749; c=relaxed/simple;
	bh=aibM3CEN4GlDaN5Q5oUKGzqAOrx2WCfZHlJS67dPa24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUoXvNMKYhjYKdv5JU+jeTlVNPOR0oAh/iu13sZjb2+9N4AtzOb3m/P6Xt2ttU6FZ56tpBPJSfYKozT5hh08mGK5jUttosASF1QhJLdcgHQZtz/3kEt0yqhkApj50DNx18+A5bMBf1RVkFXmrKI4/TZ4GadDYiu8dd8mQQSoUpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vrz6LLMw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vrz6LLMw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751373747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eb0wjmxKgoQIQfwLxvEHu9pE8U4ib0H+OzhXzeaAk0=;
	b=Vrz6LLMwxxZVpejXJeqzrmByf+OcSD6kWvAeKAvQKrisyamiGsL1zwHe2dI3Yd4h3Gj28T
	21EBIDUwH0po4QfFvJqxrOo55r2uoGSxL4QdL9/41h7AtNoMnc/yjBragbORTYYDaJTfMm
	BR4TgL8p7MVEu8wjgR7RRKX+od+lnDc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-tuO4ZvQFPgGgv8ERnu2pTQ-1; Tue, 01 Jul 2025 08:42:24 -0400
X-MC-Unique: tuO4ZvQFPgGgv8ERnu2pTQ-1
X-Mimecast-MFC-AGG-ID: tuO4ZvQFPgGgv8ERnu2pTQ_1751373743
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d40f335529so1022081785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 05:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373743; x=1751978543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eb0wjmxKgoQIQfwLxvEHu9pE8U4ib0H+OzhXzeaAk0=;
        b=bPcKk1XClHyvXuxbs83NQNj2qQrwQpokeEgagqDRtdFY3v+kYPhBORpMv4KzR4iIKm
         E6QVJmbLCxoKgL7k3BeURhzRQ5UXylYXYH73010GE8+VNvF4MmkYThMWUb3th1QlOXtC
         SlvkkjIW+0rh4SH0U5wOo4QRhwX/tJxoT3u9FGw5S5UuFJ7qYI2x7DOnBnGXKvrXel6b
         QpLA2iBKKCxbDYyjRhiHiG8Jii9HoeZuC/w2SDbmALRc99RVwX7lln59j385cwt6m9HP
         fFMc3b2HT58lVjXDY7DsxIMvtqtYsV+6sl8/NwQJmsPCevlihRubU+ARmdmOhljGjKDi
         sv9A==
X-Forwarded-Encrypted: i=1; AJvYcCV6ryor55KVXE28fF3aYO2r2MiZe7yV7YV1g6dJYe8KYX7Tq/xCmtj4JiHrdxVOTri1nksFnQMAdE/FZ/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqi4kHZE5gRbiyB9lttk5OuA+ONwpbyZUsQ2wUaG1tmKRVW9jJ
	5KyUjxXF9cEzEt6lFyuhKDyDP3Jgzw0yPxqdHzaN2LFgMyBqBHuZ9LbXgxEevfDRz88c7W2wRqo
	utNw8jrMN73jw7VsHU5DEONTOT6lrG4BszxoGXybNbjbmrEHDujNKN3VqydCuZHP1Rw==
X-Gm-Gg: ASbGncvjXh5YlOKd8gdz8cI/Ei61ZTC2R3HzayCO3OmYrgjdhzsBkRA2Sa2UimsgHEs
	Wyd+yF9UsmT5dy9+cWXQobZjNlnMcVGiIA2E5PmjWSKAzJrGun6bZl9WkOXuZF0JjaVrtLxRT7Z
	4S7OK1FxcaMLSnZWpzDqNAIk/zqdk5/bhLBh0a0A3OD4QRyW79ZW1SDf7w8Wa0Pyjo8T3KH1G7D
	2Ztmr0HJlb2iO0WeHX72rZkpWJni4O9r6qkwHzWjVUBZV4Fs2TSivT94+nbJ2Q3yWeXqn2kuoIt
	CFHR7tRj3JV1uqY6ieuN3BDFu8nV
X-Received: by 2002:a05:620a:2b8a:b0:7d4:61a4:dea with SMTP id af79cd13be357-7d466d304bfmr486922685a.7.1751373743361;
        Tue, 01 Jul 2025 05:42:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvA9cqKiGyYmMspm7UQcXD+JNKsXtSkygKVN8QiyRw0x71aIOnzq9VTSOJAu5f4SJwOywqbA==
X-Received: by 2002:a05:620a:2b8a:b0:7d4:61a4:dea with SMTP id af79cd13be357-7d466d304bfmr486915985a.7.1751373742656;
        Tue, 01 Jul 2025 05:42:22 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.144.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44313689fsm766012285a.16.2025.07.01.05.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 05:42:22 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:42:10 +0200
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
Message-ID: <37t6cnaqt2g7dyl6lauf7tccm5yzpv3dvxbngv7f7omiah35rr@nl35itdnhuda>
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

Usually I would suggest inserting a Fixes tag, but if you didn't put it, 
there's probably a reason :-)

If we are going to add it, I think it should be:

Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")

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

Should we also remove some `case`s in the following switch?
I mean something like this:

diff --git a/net/vmw_vsock/vmci_transport.c 
b/net/vmw_vsock/vmci_transport.c
index b370070194fa..d821ddcc62d8 100644
--- a/net/vmw_vsock/vmci_transport.c
+++ b/net/vmw_vsock/vmci_transport.c
@@ -135,10 +135,6 @@ vmci_transport_packet_init(struct vmci_transport_packet *pkt,
         memset(&pkt->_reserved2, 0, sizeof(pkt->_reserved2));

         switch (pkt->type) {
-       case VMCI_TRANSPORT_PACKET_TYPE_INVALID:
-               pkt->u.size = 0;
-               break;
-
         case VMCI_TRANSPORT_PACKET_TYPE_REQUEST:
         case VMCI_TRANSPORT_PACKET_TYPE_NEGOTIATE:
                 pkt->u.size = size;
@@ -149,12 +145,6 @@ vmci_transport_packet_init(struct vmci_transport_packet *pkt,
                 pkt->u.handle = handle;
                 break;

-       case VMCI_TRANSPORT_PACKET_TYPE_WROTE:
-       case VMCI_TRANSPORT_PACKET_TYPE_READ:
-       case VMCI_TRANSPORT_PACKET_TYPE_RST:
-               pkt->u.size = 0;
-               break;
-
         case VMCI_TRANSPORT_PACKET_TYPE_SHUTDOWN:
                 pkt->u.mode = mode;
                 break;

Thanks,
Stefano

>
> 	switch (pkt->type) {
> 	case VMCI_TRANSPORT_PACKET_TYPE_INVALID:
>-- 
>2.50.0
>

