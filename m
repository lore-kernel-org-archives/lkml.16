Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E1220DD40
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841693; cv=none; b=k8crYazh1bcK047jcC576KyVVnIrIGlMWJDiS76msBsADszfGGs2qeJbJCGx7Ve+QNJg0WJrQf4EzHLQV9CM9ZE5prbrPsvuI4MCc0IrkgtdDJYequLicAFmxo9e7d4vzFDiHRIL/pbdY3+dPBJum7+OG6WxpMW6Dmh5+wV1RfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841693; c=relaxed/simple;
	bh=IMHNO1bT1El4HG2JXEHyLJZxCIu/EzODJnWdqZWBHw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9XQDliAc3RFSsiF/DPCow2Jo8HqeZp7Cmm0gF4GTjMDsP5zFXvhWH+yJW7tzN8nsoWwynd6F87llsXo571ew3Ym8As65cXwZWcD1U4YlpAe50FU1Um8aF76/2y87gIOW4DLWI6tHcCZ9AowCmt3yU5h9dbUESX4y62d324+wak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NoPCt0Lg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NoPCt0Lg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750841690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H7SojeMD2gps8cZo3IPHcE59cXnndpk0obLuxFCFG5c=;
	b=NoPCt0Lga0/6jdflq+J4E/ccK04N95tVlCIgg2Wunq/V+T0wNAnqfCmFsVPT0TWc8iwhaz
	EV5D8rHlenTxGe1IaSt4OEIN6I9Diwq+iOfqFVeSgOFY0GflqYgzUQcpMhySs/mTFQIHaD
	fxMtiHxqaF0oJbsw4ScOPC44YxYHGoI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-p576XWvENf2U_chhXudFfg-1; Wed, 25 Jun 2025 04:54:48 -0400
X-MC-Unique: p576XWvENf2U_chhXudFfg-1
X-Mimecast-MFC-AGG-ID: p576XWvENf2U_chhXudFfg_1750841688
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45334219311so6737785e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841688; x=1751446488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7SojeMD2gps8cZo3IPHcE59cXnndpk0obLuxFCFG5c=;
        b=VLVA2JFFSIxYbH6kUPkIyWvTKXVKYyE+ATkgW0/uHMIqw/Sf49SHcGviGeGW3V+zf+
         rJ0mlo6GyWM08h7bsQwucAKOGmgV8ygngonBd+FECbIeCrI6OrPBnXGZBX/Wnz5bKGHD
         cjiV/PE9tpZmehkotsvz+yTScLd8Nnf3yzSyHlmCwBYj5QmOpdjQmsQkCGaIHS4jTrBq
         /ByHsHW9HuOhI+xjbCmhaTqsIagdqHJw0wUlFZUYXSLiU7Au+agNXWPPGyw9u//4l/My
         GnqhfOavcCo/CUMl0sebWyAEixEeRbzyL/WVIBLlgb81P6l8OmFj2vfi0AyCe3i2nkTz
         svyg==
X-Forwarded-Encrypted: i=1; AJvYcCX09MyGJDwP3rc470p4l33BK9cjwnoVG15GYkjs2qBcvNgu7SAaF53tKPgR4V9e9ATXYOn1RR2J0K4DiP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr6trSDDJEBNju8CGaO+s4PFYLE1p59wfH8pptqCt52egdOty6
	BL39KeaNRKh+XR96ZF8ha2wWaZqUv0lrNOxuj44NezS2b1iPsuB+6Qkj0kDKgROByJE8a6wHPnt
	uksDVRLRwEZhXeGfTXZJGXhDrYL6qjztxPJf5SGaXviWseg/30rAm13EwXHzG8uVB/Q==
X-Gm-Gg: ASbGncufUAz+0aHL7y5uOMzdqEFsahK5o2fVlxom9hxGM7jBYvpGnRJiXypoMSnIcGi
	M7eVNfJJvbqWyqdBweT7VP4iYW+Peukh4v6xl6DrzLxTuPEkpG1G3u8BhtbuLn+rOPOWvftrxEz
	kcK8nVJGxovDfjOLSP4I1hUmgymOiPzFAmWQ36435WsidCZtyl1zpEnHYmxJ2Gu7omQ6190vU6C
	JqBVakyq5Z95G8MXGn/39+xrAlJ3WWDxL3vaciYnqd/vym5dnrgIaM1xG5ucSIlYWD5SWrwTUfA
	wb6x4FO2uTPFeXpHy5q1r//nUCuO
X-Received: by 2002:a05:600c:35d2:b0:450:d00d:d0 with SMTP id 5b1f17b1804b1-45381ae467cmr18288025e9.19.1750841687666;
        Wed, 25 Jun 2025 01:54:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYLN8WpVcipmrn+PxxvTbwwdYiFGmiYVj3yUsHDD0K7ZUDXBWM8hLnXLAMurjH8x8NH2rxcA==
X-Received: by 2002:a05:600c:35d2:b0:450:d00d:d0 with SMTP id 5b1f17b1804b1-45381ae467cmr18287785e9.19.1750841687044;
        Wed, 25 Jun 2025 01:54:47 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.151.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad247sm13350055e9.26.2025.06.25.01.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:54:46 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:54:40 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Michal Luczaj <mhal@rbox.co>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC net v2 3/3] vsock: Fix IOCTL_VM_SOCKETS_GET_LOCAL_CID
 to check also `transport_local`
Message-ID: <uqap2qzmvkfqxfqssxnt5anni6jhdupnarriinblznv5lfk764@qkrjq22xeygb>
References: <20250620-vsock-transports-toctou-v2-0-02ebd20b1d03@rbox.co>
 <20250620-vsock-transports-toctou-v2-3-02ebd20b1d03@rbox.co>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250620-vsock-transports-toctou-v2-3-02ebd20b1d03@rbox.co>

On Fri, Jun 20, 2025 at 09:52:45PM +0200, Michal Luczaj wrote:
>Support returning VMADDR_CID_LOCAL in case no other vsock transport is
>available.
>
>Fixes: 0e12190578d0 ("vsock: add local transport support in the vsock core")
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Signed-off-by: Michal Luczaj <mhal@rbox.co>
>---
>man vsock(7) mentions IOCTL_VM_SOCKETS_GET_LOCAL_CID vs. VMADDR_CID_LOCAL:
>
>   Ioctls
>       ...
>       IOCTL_VM_SOCKETS_GET_LOCAL_CID
>              ...
>              Consider using VMADDR_CID_ANY when binding instead of
>              getting the local CID with IOCTL_VM_SOCKETS_GET_LOCAL_CID.
>
>   Local communication
>       ....
>       The local CID obtained with IOCTL_VM_SOCKETS_GET_LOCAL_CID can be
>       used for the same purpose, but it is preferable to use
>       VMADDR_CID_LOCAL.
>
>I was wondering it that would need some rewriting, since we're adding
>VMADDR_CID_LOCAL as a possible ioctl's return value.

IIRC the reason was, that if we have for example a G2H module loaded, 
the ioctl returns the CID of that module (e.g. 42). So, we can use both 
42 and VMADDR_CID_LOCAL to do the loopback communication, but we 
encourage to always use VMADDR_CID_LOCAL.  With this change we basically 
don't change that, but we change the fact that if there is only the 
loopback module loaded, before the ioctl returned VMADDR_CID_ANY, while 
now it returns LOCAL rightly.

So, IMO we are fine.

>---
> net/vmw_vsock/af_vsock.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index a1b1073a2c89f865fcdb58b38d8e7feffcf1544f..4bdb4016bd14d790f3d217d5063be64a1553b194 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -2577,6 +2577,8 @@ static long vsock_dev_do_ioctl(struct file *filp,
> 		cid = vsock_transport_local_cid(&transport_g2h);
> 		if (cid == VMADDR_CID_ANY)
> 			cid = vsock_transport_local_cid(&transport_h2g);
>+		if (cid == VMADDR_CID_ANY && transport_local)
>+			cid = VMADDR_CID_LOCAL;

why not `cid = vsock_transport_local_cid(&transport_local)` like for 
H2G?

Thanks,
Stefano

>
> 		if (put_user(cid, p) != 0)
> 			retval = -EFAULT;
>
>-- 
>2.49.0
>

