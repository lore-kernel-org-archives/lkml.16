Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031E11F419B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751626674; cv=none; b=EvIxyuVcDccTsPOuMTokt3IBfYvmSJUbEVMaNe9OF2RhN0s+8atBW9iky74fdpN7qSM4y0A+gbqFRKfvghCID5UdkeGbqFX3+THgAtJX511jx/Bu8Wqt+vn+3bPAx5JfDoJ/jZRB7da6av8QP9pXYBuwI3xwWxGMDlu1Hg89NDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751626674; c=relaxed/simple;
	bh=1cxKkZFvCDOhTzY2nmvDiN/WHQTDMZaVAEL8yNSOdDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fBRK+W0WnCI8v1AC+SvvxY3rzwygnRA+nfppKLcb2u6nyml+wqMpB0c5KyK7kJzg9bpRD6HCiAw3qBmZePQRLC7br1gyVzGqkQgzq+lOJMot0C5rULSlS23JE5MTTGF6qgBWeip7oE4P3pNidTP7rif0PCJJAvBsgsjNdp3+e98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZeHmfD2Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZeHmfD2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751626668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CrvE7HgkF0Duv49KG//QWMSmUEkIXLGid+oDz5Nnx5A=;
	b=ZeHmfD2QyxqLtYDsLqiDPPY5mLg9vMPAcc+tz60ngUtopHJSb4VxRj0dFie0YrCtRY+kti
	8XFovyc7u0s7mg2LDRJLtcu0/nOGsvLBL7fz237OA4cVO+ujUkrGyTOvj96Hxc1Rdsw736
	tpIJvhEKMF2WspN5uU3SsRaYWT4442U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-LwFcj-JUOVubF5s1AKlR7g-1; Fri, 04 Jul 2025 06:57:47 -0400
X-MC-Unique: LwFcj-JUOVubF5s1AKlR7g-1
X-Mimecast-MFC-AGG-ID: LwFcj-JUOVubF5s1AKlR7g_1751626667
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6076ad0b2f1so742194a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751626667; x=1752231467;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CrvE7HgkF0Duv49KG//QWMSmUEkIXLGid+oDz5Nnx5A=;
        b=iVowc58jgNcqNI7DlM5hUZIBchN4dOCJWg7uVzMDOAAuh5LeFAebnLusHLl/4WMLsN
         wOz4RN2tVih6zNW14ZWn9l8yF0Om5DwjjmftWRqoV7sB00Jm52KmuhGt6MrL/08X/iY7
         74VPFRB0IkCk91YSLL3mvx09Tzv5gtI98YyXNgYTHDQhYPGmSJDWMAPBTMy7xNqA2cLY
         9KFF9tadNPhd+I8GA4Qs+W2D1kCJxmtXiJi1krSJKRcdWNWK3MHia751oBcge2FCs/50
         z8F/QfXGJigjuVMsy79fuElKiKY1lwJpFSAhZ6cRahvz4pElKmNbQZ+UCFY5VsvTFFBS
         js9w==
X-Forwarded-Encrypted: i=1; AJvYcCVyKtjQReDUx3gy1VbjYjYsWSyKwjRk/Ki2ZAfqNzp0dc6x22smouf5QJjA1VWq5AZUTmnvpxUYU40gxfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGCk6GaIBEX+FleH9+EjLD9omLqnmQ3MCpgcwktWtaFrBXarU7
	RzzK2CJEJI72tmK4K+0jUHv3VlT7L8VtF5FCvebgnii9PYiL/osVEBlH+dZh5he+YROVih8bDys
	JGUY/U6uKv7DlhAdN91oG2JkHsc7nBjQiW4ZhF5o9v628lERTtDNEicEG3pRQPyvqUA==
X-Gm-Gg: ASbGnct4gTQ1zowPRbfjzeWJNRW/M3toaQqkfx6N28RRcx9CQNmsIzZRMRMfsamxZ3h
	W8A8vzOuwEDhvi03LpmgF/Dquy1Hl/ry4rFwjh0OoT+JoSdk71Xdv/hoyMaNGMQn+GUIw2LqwhJ
	Sz4Lw3N+7dscJ5RvkxL/YfRqm5Uc5BJpkRcMkzzM2JU20lPhXCbbJgNs6u0PImKNqRYAUna6v2T
	XQ4QrooWFNb4yIQM20ARXYFl/h3edktMqisNcOehpLV1udP2hYLgTuUk0Qt0oPQC9BfUGyttili
	FvMjEsLqfyqY+tNnnEZ3jDoyenewzEy9sZT7jHVoafTwJD1B0SKwT3cyQgNf5rf8OoqQ
X-Received: by 2002:a05:6402:3591:b0:609:b5e0:598a with SMTP id 4fb4d7f45d1cf-60fd3491e75mr1660545a12.24.1751626666597;
        Fri, 04 Jul 2025 03:57:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcyEXrT1z/JTIyDwlwHTVjdjScy5iO7EyP/8wawH2bxWvrpwpkH9Px/UxRdIe8p7HXgydn3w==
X-Received: by 2002:a05:6402:3591:b0:609:b5e0:598a with SMTP id 4fb4d7f45d1cf-60fd3491e75mr1660526a12.24.1751626666058;
        Fri, 04 Jul 2025 03:57:46 -0700 (PDT)
Received: from [10.45.225.135] (5920ab7b.static.cust.trined.nl. [89.32.171.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6641fbsm1164917a12.3.2025.07.04.03.57.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:57:45 -0700 (PDT)
From: Eelco Chaudron <echaudro@redhat.com>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 dev@openvswitch.org, linux-kernel@vger.kernel.org,
 Aaron Conole <aconole@redhat.com>
Subject: Re: [PATCH net-next v2] net: openvswitch: allow providing upcall pid
 for the 'execute' command
Date: Fri, 04 Jul 2025 12:57:44 +0200
X-Mailer: MailMate (2.0r6272)
Message-ID: <0DF63EA6-305E-4F76-A88C-F2520198702B@redhat.com>
In-Reply-To: <20250702155043.2331772-1-i.maximets@ovn.org>
References: <20250702155043.2331772-1-i.maximets@ovn.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain



On 2 Jul 2025, at 17:50, Ilya Maximets wrote:

> When a packet enters OVS datapath and there is no flow to handle it,
> packet goes to userspace through a MISS upcall.  With per-CPU upcall
> dispatch mechanism, we're using the current CPU id to select the
> Netlink PID on which to send this packet.  This allows us to send
> packets from the same traffic flow through the same handler.
>
> The handler will process the packet, install required flow into the
> kernel and re-inject the original packet via OVS_PACKET_CMD_EXECUTE.
>
> While handling OVS_PACKET_CMD_EXECUTE, however, we may hit a
> recirculation action that will pass the (likely modified) packet
> through the flow lookup again.  And if the flow is not found, the
> packet will be sent to userspace again through another MISS upcall.
>
> However, the handler thread in userspace is likely running on a
> different CPU core, and the OVS_PACKET_CMD_EXECUTE request is handled
> in the syscall context of that thread.  So, when the time comes to
> send the packet through another upcall, the per-CPU dispatch will
> choose a different Netlink PID, and this packet will end up processed
> by a different handler thread on a different CPU.
>
> The process continues as long as there are new recirculations, each
> time the packet goes to a different handler thread before it is sent
> out of the OVS datapath to the destination port.  In real setups the
> number of recirculations can go up to 4 or 5, sometimes more.
>
> There is always a chance to re-order packets while processing upcalls,
> because userspace will first install the flow and then re-inject the
> original packet.  So, there is a race window when the flow is already
> installed and the second packet can match it and be forwarded to the
> destination before the first packet is re-injected.  But the fact that
> packets are going through multiple upcalls handled by different
> userspace threads makes the reordering noticeably more likely, because
> we not only have a race between the kernel and a userspace handler
> (which is hard to avoid), but also between multiple userspace handlers.
>
> For example, let's assume that 10 packets got enqueued through a MISS
> upcall for handler-1, it will start processing them, will install the
> flow into the kernel and start re-injecting packets back, from where
> they will go through another MISS to handler-2.  Handler-2 will install
> the flow into the kernel and start re-injecting the packets, while
> handler-1 continues to re-inject the last of the 10 packets, they will
> hit the flow installed by handler-2 and be forwarded without going to
> the handler-2, while handler-2 still re-injects the first of these 10
> packets.  Given multiple recirculations and misses, these 10 packets
> may end up completely mixed up on the output from the datapath.
>
> Let's allow userspace to specify on which Netlink PID the packets
> should be upcalled while processing OVS_PACKET_CMD_EXECUTE.
> This makes it possible to ensure that all the packets are processed
> by the same handler thread in the userspace even with them being
> upcalled multiple times in the process.  Packets will remain in order
> since they will be enqueued to the same socket and re-injected in the
> same order.  This doesn't eliminate re-ordering as stated above, since
> we still have a race between kernel and the userspace thread, but it
> allows to eliminate races between multiple userspace threads.
>
> Userspace knows the PID of the socket on which the original upcall is
> received, so there is no need to send it up from the kernel.
>
> Solution requires storing the value somewhere for the duration of the
> packet processing.  There are two potential places for this: our skb
> extension or the per-CPU storage.  It's not clear which is better,
> so just following currently used scheme of storing this kind of things
> along the skb.  We still have a decent amount of space in the cb.
>
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>

Thanks for working on fixing this, and for the detailed explanation!

Acked-by: Eelco Chaudron <echaudro@redhat.com>

