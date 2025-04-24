Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C153A27B4F8
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514553; cv=none; b=rPFPoDDOY2j8OiVvHWIWCkTW2+jNysBv1LODLpu37HntBJMa8vGbPKA6rcbpDmakNXKJZw+Mzt5XTQxJ9jM2PSNev6YQ8+ogZuX3PA2GUYJmn3aMxz/WffdYBopkE0h25mQZHSSjrHPB7ZcVJtpr2kb2Nkihu8/MGisQ6JGe0QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514553; c=relaxed/simple;
	bh=gEtDxFoBg8UfBDSO4bw9bE+SefRpBudTlY+cXC2gICk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V5GQlpU8+0hmQl2IqmLbUAqzfSkgRLTIgS6tWUa/BZFpOJsAnXUCecFOkxK0U3geTxegqkHOuPeBoNRY3WfDIoMQDgaAtMNmXenISMAV9IEFVa4VAscfNZPq5HF70v+nASrC+gCJH/WrZ4BYivLTRsubArRtVdnyTu73zvRC/J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=fueBOrvY; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="fueBOrvY"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2c2dc6c30c2so373377fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1745514551; x=1746119351; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ofCPIfZ9+EaMvkffgBsxaUmBvz1zhM005x/Hz0AKCjM=;
        b=fueBOrvYqKetGFsJP4KnEO5/AldR+xrC4WKSiE2mnjuhrGeV8T1ZkpryJNIVjBlmeH
         c/jKZT8KbqRWLd4ltFJ1H+gRc3e/iShw/kFOgBX17bl8LG9icDdmsj//UdgxBEMBopXU
         KeSXaeC8gVb/Z7xuiKzDHcWYij5EMmxAIp9KzIQWQEJBex+ghmrfx8aTxaczheJs3siz
         rAHHVyT+zee+0ru88skM2lNBdGEPSqz/9io6iKqksaC0CCx9sn3Iqqb+zhoakIjusEb1
         srb+pkHpR133Qv1WQ0O3Rwo0IFGpYN0kzeeBFMMYshf1LgZbgBTxYGZekIpUKmusRcaI
         aQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745514551; x=1746119351;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ofCPIfZ9+EaMvkffgBsxaUmBvz1zhM005x/Hz0AKCjM=;
        b=lveEKjyYpjq9K8Oo0Avmy0nuBz2ulL+rrrN5TtYXHXXDJ/uH7HYU10GGuh+JklAtTe
         2+VBftho+gDiqE1+kRUIYuv8ceSn9FruzeMw/yoTZooFJruAOdvh7NxOGDz6sLs2brN9
         QRzI0/OCmXDU3XN3dgGr6fub8Pex5AMKAF4jRUXs6LLlo7Bw4w4+cxW4X3rBh1yMyXna
         gtzEj5IZD1u/kAJ1Ko+x8z1DTnnEXP/71RrGWprzuB7+//D0u6qrIPVt23uyR+Blu6aO
         jSZPGWJC8yu3aUOyCSVmg0rYUZNXh390phNbupSwqyvkJssF7YRYDDLFrfJBz0ac08Ix
         FqOA==
X-Forwarded-Encrypted: i=1; AJvYcCV9LPaYoOS3e9HgGNCRDtAmVfSwAV4k9uw7w2AKezYGHczX+UjtMi6z6JFWFPZau+A6ATk5hIMZRKTD1xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM/FikllPQeJ8HPhHhilr59578OQqgKqb+l8LtdtjGlV2gJWwN
	w1MQXnJgkijo6X8ciu/Q09ITdVlrUzkY6cnXvcnkPKnCcPXvNwhG7lnIhi9k6EU=
X-Gm-Gg: ASbGncv58bfl17HTUBbYPxbSNVRzLFXFjKViazpSSRLFwwAXVfX5IOed22dBxXdnZ4g
	Gou37z6Zv3xeekpmoLgQh/6V/1n2ZxdLiALkH3SR1T1ue0VHNC9ZRqkGGQdhCAqdXkFsUUhhZ6S
	x0xK4M9zLM6zbMRUeJm7kXzKJCcNB3x0CXrUz89M78lycpE3CKT1ACePNgkCiXbS+h4ZF1TQLMX
	rA8hs9Z48LWjWizMSxUQ7NggSR487xt3s149eyuFDbQThABpGEM0JaTuX6IPNmL24NdTVigBaCx
	k2sAq6KX6mqKsd9MMjXFhdxHoPF3ouMwUM2LQ13AsEwlkOhj5bn0E7Dq1TNtIurpgbp/mTwrnhD
	bDQt4e2+o/ZkozoXVKIND
X-Google-Smtp-Source: AGHT+IHfzbOWHwKui1OabrAXGYjzr2d5ISFlGjRQ9EY5vBkPGAITE6m4rnPc7L4SfKgrMN17NIkJWA==
X-Received: by 2002:a05:6870:47a7:b0:2d5:cb3:6b1c with SMTP id 586e51a60fabf-2d96e29c5d7mr2206372fac.14.1745514550731;
        Thu, 24 Apr 2025 10:09:10 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:a7d5:84b:f3e6:719a? ([2600:1700:6476:1430:a7d5:84b:f3e6:719a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d9737e73b7sm376254fac.26.2025.04.24.10.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:09:09 -0700 (PDT)
Message-ID: <e22924883f6feca167571f472076294232d5addf.camel@dubeyko.com>
Subject: Re: [PATCH] MAINTAINERS: hfs/hfsplus: add myself as maintainer
From: slava@dubeyko.com
To: Yangtao Li <frank.li@vivo.com>, Slava.Dubeyko@ibm.com, 
	glaubitz@physik.fu-berlin.de, brauner@kernel.org,
 linux-fsdevel@vger.kernel.org
Cc: dsterba@suse.cz, torvalds@linux-foundation.org, willy@infradead.org, 
	jack@suse.com, viro@zeniv.linux.org.uk, josef@toxicpanda.com,
 sandeen@redhat.com, 	linux-kernel@vger.kernel.org, djwong@kernel.org
Date: Thu, 24 Apr 2025 10:09:07 -0700
In-Reply-To: <20250423123423.2062619-1-frank.li@vivo.com>
References: <20250423123423.2062619-1-frank.li@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-23 at 06:34 -0600, Yangtao Li wrote:
> I used to maintain Allwinner SoC cpufreq and thermal drivers and
> have some work experience in the F2FS file system.
>=20
> I volunteered to maintain the code together with Slava and Adrian.
>=20
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> =C2=A0MAINTAINERS | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b8d1e41c27f6..c3116274cec3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10459,6 +10459,7 @@ F:	drivers/infiniband/hw/hfi1
> =C2=A0HFS FILESYSTEM
> =C2=A0M:	Viacheslav Dubeyko <slava@dubeyko.com>
> =C2=A0M:	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> +M:	Yangtao Li <frank.li@vivo.com>
> =C2=A0L:	linux-fsdevel@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	Documentation/filesystems/hfs.rst
> @@ -10467,6 +10468,7 @@ F:	fs/hfs/
> =C2=A0HFSPLUS FILESYSTEM
> =C2=A0M:	Viacheslav Dubeyko <slava@dubeyko.com>
> =C2=A0M:	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> +M:	Yangtao Li <frank.li@vivo.com>
> =C2=A0L:	linux-fsdevel@vger.kernel.org
> =C2=A0S:	Maintained
> =C2=A0F:	Documentation/filesystems/hfsplus.rst

Acked-by: Viacheslav Dubeyko <slava@dubeyko.com>

Thanks,
Slava.
