Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC6A225380
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738944184; cv=none; b=pFSaKL7F3wORvR84U/okW4T19XSZRj4S+Zy1gTSL5lse56xG4ds39wy3A1W1x6OmfQBxxwZQgct5JtJ2EzLHVpKxrWiyIewTIoDJxSjVEB7Ai6y+jaE4CuApDH33Ad5OjB6BzbDgXBC7F23V7fScqX8FmeUwqrhHVFG4t+PQuVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738944184; c=relaxed/simple;
	bh=Wh0CsikOm5x73NTfTEyd+qSpHJH1XYBWccrtpGIZG7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O89AhSvQ3hsN8+OKsWUkRZTBDBVTtNepe2PlyhaehMYo0w5AuZQ3eaq0YT4By0Lo4LLEa2UchJW9Z/hWfzHO2yWWewOzZhS8FtbLaeXi7251+DUj+rUvbXEfT+RARL8r/zKfQtCUS+Z8ZGi/+mTVsgw2MG8cjHeZoJx5hZ7bGWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=NIZYa3UE; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="NIZYa3UE"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E241D3FE64
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738944180;
	bh=IrnwfeZghfHKVVuuD+X+K3BBifM4PVk8VbFlg3AlP50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=NIZYa3UEsXtAV7V0iGA4hLQCU5gMjep72YcfRF3usZv1h4GshdlFyFcZ0FaC15+ds
	 Z3pSqY/NDF+p6czihKbwUJgPiQy1zORJTqd7O85AH5lz/tVAUpc7Gmnlu/YCW0wCBG
	 dyqbuCGFcN4BBHALFGPqUOMVasYoVL10Lq5M87dAPuDBo2phecN1Km5hwp/ZREJQlA
	 L1ieg2/Du1wlH3zeBTHAh8EfcddlYK8nfg+ekz2BgdcFr6Its5ejwHH2wyuBqIeqIW
	 rcK8Rfx80KVDVlDlQT0xhIoLpW5wI/U7IT8n9ufAXPWtNhYDExsHQPc4HVEbISjAe5
	 Oye/HsNnv2/ng==
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5de3d2a3090so1391421a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738944180; x=1739548980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrnwfeZghfHKVVuuD+X+K3BBifM4PVk8VbFlg3AlP50=;
        b=ENnl9zZw+hz8yC94QoI2WyoeAAJY+Zo/x4ByRS0QiFLHDgnx1Dkyc8Mtb+dGWtPX1T
         YbOrw9xyNz7UsMSfwaVAbO0t3mAtRKswoADdyP+cfdRafXYvyHshyLRwEenOdznV23bA
         +x4S0bD2JWpAHspS43tndUZt5dA3teRX70X8fWOICvKlTdNHN6FiPtGCAvm1RGK8p+nt
         sGeALg+aPgSzagvwHTnykOZP3PlJ02jvx13wC+V1Ub3GrihMzQOgSfihHCjCunbFtnTH
         XgW3hEtYnh93W8n9g2XeZAbdSND40kfQ/VYAzmV2KRzbhWwXMfh+hBZkCojIrUuu1v3T
         Bxkw==
X-Forwarded-Encrypted: i=1; AJvYcCXhmAqWjlYNyvl4kDPMtUSMx+HilNhC5riAk3ql5/O067SGEKI8u9duwht2cr8zwUSX1aNEVjOEcDD63EM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu8WxX2/O4/VbKKw8QpbWAc8+STuA4Ev27aZ50NRqVbteBzrSM
	UxMG1TY6NwWZOw2NS7p8suc8eMlRS5+TK+F8+RRJX0VoM1Iq5tTzpqzphikTqD0ECG+yXyKZS2h
	Jk/iVizISfUumQPY/qtxmnqyWvYlIvVxDXH8Nfc3wpXejZIvTcgdSPBApS0F8Li5V/8lZZKWrFS
	/kT6/ePYOH6CpEc3VE3wh2UhsADwzxD8iBMHlC1OfIZzof8OYVoX7p
X-Gm-Gg: ASbGncts2AKfpBe6SAXENK/ZPTpMiW9jHig69nwtWaZKvReZTi2uvU2E4xMrQ++yfOQ
	+V2R0FtcoQ7peB14BnBtsriDaaVaZcH2w+scoElDCuyq2ZinAij5aMQkEH6aE
X-Received: by 2002:a05:6402:3903:b0:5dc:da2f:9cda with SMTP id 4fb4d7f45d1cf-5de450e1eccmr4571683a12.27.1738944179655;
        Fri, 07 Feb 2025 08:02:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEj6Mdi97JKw/hR9AkdCdVySubZ6ydgC5KXtMsuuQx57RvTNFxEZaCcBX7XMkx94Gl9KaXNPcQoTe/+8OHlO+4=
X-Received: by 2002:a05:6402:3903:b0:5dc:da2f:9cda with SMTP id
 4fb4d7f45d1cf-5de450e1eccmr4571438a12.27.1738944177679; Fri, 07 Feb 2025
 08:02:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHTA-uaH9w2LqQdxY4b=7q9WQsuA6ntg=QRKrsf=mPfNBmM5pw@mail.gmail.com>
 <20250207155456.GA3665725@ziepe.ca>
In-Reply-To: <20250207155456.GA3665725@ziepe.ca>
From: Mitchell Augustin <mitchell.augustin@canonical.com>
Date: Fri, 7 Feb 2025 10:02:46 -0600
X-Gm-Features: AWEUYZkGrEAvJxAVFrNYmmhKqMlsU32h-AS8UVgClt5mRfnNId8ifTzmInnj1qk
Message-ID: <CAHTA-uasZ+ZkdzaSzz-QH=brD3PDb+wGfvE-k377SW7BCEi6hg@mail.gmail.com>
Subject: Re: modprobe mlx5_core on OCI bare-metal instance causes
 unrecoverable hang and I/O error
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com, 
	andrew+netdev@lunn.ch, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Talat Batheesh <talatb@nvidia.com>, 
	Feras Daoud <ferasda@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Is it using iscsi/srp/nfs/etc for any filesystems?

Yes, dev sda is using iSCSI:

ubuntu@inst-v4ovk-mitchell-instance-pool-20250205-1119:~$ sudo
iscsiadm -m session -P 3
iSCSI Transport Class version 2.0-870
version 2.1.9
Target: iqn.2015-02.oracle.boot:uefi (non-flash)
Current Portal: 169.254.0.2:3260,1
Persistent Portal: 169.254.0.2:3260,1
**********
Interface:
**********
Iface Name: default
Iface Transport: tcp
Iface Initiatorname: iqn.2010-04.org.ipxe:080020ff-ffff-ffff-ffff-a8698c179=
e5c
Iface IPaddress: 10.0.0.254
Iface HWaddress: default
Iface Netdev: default
SID: 1
iSCSI Connection State: LOGGED IN
iSCSI Session State: LOGGED_IN
Internal iscsid Session State: NO CHANGE
*********
Timeouts:
*********
Recovery Timeout: 6000
Target Reset Timeout: 30
LUN Reset Timeout: 30
Abort Timeout: 15
*****
CHAP:
*****
username: <empty>
password: ********
username_in: <empty>
password_in: ********
************************
Negotiated iSCSI params:
************************
HeaderDigest: None
DataDigest: None
MaxRecvDataSegmentLength: 262144
MaxXmitDataSegmentLength: 8192
FirstBurstLength: 65536
MaxBurstLength: 262144
ImmediateData: Yes
InitialR2T: Yes
MaxOutstandingR2T: 1
************************
Attached SCSI devices:
************************
Host Number: 0 State: running
scsi0 Channel 00 Id 0 Lun: 0
scsi0 Channel 00 Id 0 Lun: 1
Attached scsi disk sda State: running



On Fri, Feb 7, 2025 at 9:55=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Wed, Feb 05, 2025 at 05:09:13PM -0600, Mitchell Augustin wrote:
> > Hello,
> >
> > I have identified a bug in the mlx5_core module, or some related compon=
ent.
> >
> > Doing the following on a freshly provisioned Oracle Cloud bare metal
> > node with this configuration [0] will reliably cause the entire
> > instance to become unresponsive:
> >
> > rmmod mlx5_ib; rmmod mlx5_core; modprobe mlx5_core
> >
> > This also produces the following output:
> >
> > [  331.267175] I/O error, dev sda, sector 35602992 op 0x0:(READ) flags
> > 0x80700 phys_seg 33 prio class 0
>
> Is it using iscsi/srp/nfs/etc for any filesystems?
>
> Jason



--=20
Mitchell Augustin
Software Engineer - Ubuntu Partner Engineering
