Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCE7F507
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745206875; cv=none; b=XdV7rK33vcLNZVqazrjyeSpAk/ZdRFPVAjNWBt0e2RSa29m3nRgMGuW+BLoVedmIn0boH0fx02S3itHm4/R690pGdm5seBkYol/xTTfEuRlheEg45VSx3wOZ0X1UVhKgI2I/pPCbYp831M2AlEvL4m8nXb5ppILgwaf3vlWAUZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745206875; c=relaxed/simple;
	bh=HuyJ5ZjeMDNi0MDOzVYBUraDwK2NWuFkveGRKSzNHA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vph3huotHNoC30fYsQMiteytQmoSb/Cw+hCefI5IqOrNsPXnVjviS0wh1ZY0lkEkFdZo1XOJOph55pxTQqntNLHhMGgbTXOJTShAPWaPUYcP5jQC8HlI6Vh4GixcvcuIHcbiX9DftTkBJq/NSuxCsdk9l+kV4TLZ5mkS8TYqU4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MlLg05Fa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MlLg05Fa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745206873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HuyJ5ZjeMDNi0MDOzVYBUraDwK2NWuFkveGRKSzNHA0=;
	b=MlLg05FaTKiR83on1L5+T/5KptpOFqYn2uMdp+MLz4sTlFDYkNkcXczZXuQYhsxBhLILSg
	7JDNceejhOIDDK8D9aDm00YyD9sLjq1J34m/Pzi+8F1HOjADjZ2OEYVXaDV+A2HAzviMtx
	VJU4AlBIs4+0mUUtuX/gFYVBHm/QJSM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-qSG19imJMmWBpMNsAPAK5A-1; Sun, 20 Apr 2025 23:41:11 -0400
X-MC-Unique: qSG19imJMmWBpMNsAPAK5A-1
X-Mimecast-MFC-AGG-ID: qSG19imJMmWBpMNsAPAK5A_1745206870
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736a7d0b82fso4333623b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 20:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745206870; x=1745811670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuyJ5ZjeMDNi0MDOzVYBUraDwK2NWuFkveGRKSzNHA0=;
        b=Q4nUwbk/OL8jneRvvrSMg2Y5Ypt6Hjm7ptoQd567KqOUZb00Bi/tOldxdwzjAX9qDq
         WjvyWL2YMjjNyF+EDHCyGnuvd5JwhsKm1bS8hnyr45dI9swZRuuC54i8VvEyjYM2aggE
         sAlx+Lrl3CkMQN21bHjJPIAEiloX4Zl6xkRLOeMBFRbLhuGWuY9stD14zaCsTnVuFPLf
         RzCcakUHROunp0RtjS0H3DRGN3GvIoW9gkiE1ax8Sym5wSzx/KDtGZwFWUa6fQHpwu7J
         XOj/wyXn7CASDM5rSF4G9FUZVlimXh8j9aN5cZ/YG60ijlSkIm5ixJiO7vgSY9QouSYS
         Bz2g==
X-Forwarded-Encrypted: i=1; AJvYcCUCHpJGfnT8t3/xFbM9ZR3MEDJZa3C5xGu8qrDB1iriQPAsstNyUWqnSkJ7hY1l52JaRd0/ZZW+LNPYMLk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr7s06nnmw4B37zNmP8yO1f3ygWjHcNtlqsBerrXeEoDrmx15Y
	F4p3knLPZdFIgW+msc803XKe6OOuDAICb9wf40xfYZFJy56bZdXF7+WopmEXATQgxF/ZMfVCGdd
	D+xkJGMOvt3380lbpuehSRNcwcZRYmQSY6UWolFgRxBhQQ+Z4GC5F4kJnphPecmYKtes8coblJw
	WeJY1cvYhSHOv4S0ngLWAPbixvKSw60az94dI+
X-Gm-Gg: ASbGncvoQQSNzdZnbqfzhsXKD4SfmvbIPtFcznz56spIeZ5Xy0pWC5BeNQyIV6CAvbe
	XC1K7xg2PSALdq4Ezqez48lKri/I12MlNroPvcBsBNReSLh9k0Jx+0gwiJhoR//2jOQdW6A==
X-Received: by 2002:a05:6a00:4648:b0:736:4704:d5da with SMTP id d2e1a72fcca58-73dc15c68a2mr11228289b3a.22.1745206870371;
        Sun, 20 Apr 2025 20:41:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPYgkzH0aAPS+m4dDNwD+hG2inZ9iE8RfSuLcGM/dEyykWwol5iEf/2EDadmje8TzWTiGr0IGa9NVDmTX+rBc=
X-Received: by 2002:a05:6a00:4648:b0:736:4704:d5da with SMTP id
 d2e1a72fcca58-73dc15c68a2mr11228267b3a.22.1745206869974; Sun, 20 Apr 2025
 20:41:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421024457.112163-1-lulu@redhat.com> <20250421024457.112163-4-lulu@redhat.com>
In-Reply-To: <20250421024457.112163-4-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Apr 2025 11:40:57 +0800
X-Gm-Features: ATxdqUFUXQU0YTwg1cIJfTuwIr6bdYeh2bbILXsoZ4BkBC1HqGU1qls5XtUYx_4
Message-ID: <CACGkMEuki8JnD-5OGk15nhzrthdb78refcDUv2EeKgejSCQfew@mail.gmail.com>
Subject: Re: [PATCH v9 3/4] vhost: add VHOST_FORK_FROM_OWNER ioctl and
 validate inherit_owner
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 10:45=E2=80=AFAM Cindy Lu <lulu@redhat.com> wrote:
>
> Add a new UAPI to configure the vhost device to use the kthread mode.
> The userspace application can use IOCTL VHOST_FORK_FROM_OWNER
> to choose between owner and kthread mode if necessary.
> This setting must be applied before VHOST_SET_OWNER, as the worker
> will be created in the VHOST_SET_OWNER function.
>
> In addition, the VHOST_NEW_WORKER requires the inherit_owner
> setting to be true. So we need to add a check for this.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

