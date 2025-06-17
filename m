Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE3A2DF3D8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163484; cv=none; b=qIbpJsU/EJP+44ZBx2KDvWI+Fr6m6CCVlgs3FYk4239mH+fmaFUcqfQvuV9wIJnPOXRBHngdYZ+us9fTPrcDMLwY53BpZn9M8SUpnuaQm11bLCyPX5LeA584CC54D4vbQoZX65emxl5rCnfAFlhGkvLX8dscP76HVZeNx3i/AY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163484; c=relaxed/simple;
	bh=3dUl3FwynBQpWRnlP8tcB6RIntT52auTEx8Ov42iq/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCIMfCsBq4qpeM7XOpIXAOo7gkyN3diPEoN3s8iblpAnLuz4kpDpXACja56gr2Nl6Ppb3RUFIhwy4dRd66ehW24uZ0ZYHo/15JIOMmkgP4ucasCCCZVseef5IrCf1fYl5ktrl3/vT9GfsuULi1KGhzBpkZ50YpZzBvvJughVkws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AF34VXJs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AF34VXJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750163480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KShC4QJThQfwPAvgTMBPmuZLHMXp5DkJgcjKi26gyHI=;
	b=AF34VXJsZ2DfLNTzS0yc5eZqAv1fspY7WDdrzSoJy1wIxtTSh6Mg97jI5zymZ4lCIEp28c
	XIfJQYNsRRroY+yNLxmug4JnhEVii3JQSYO+1/wu1zs/mHYrr4agqDnjE58bZDh2uDqtta
	GpnINJBZklulTYf7R/Xq7gHQ3dI4LuY=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-XOpaSvt_MreS2G-MDDXBjA-1; Tue, 17 Jun 2025 08:31:18 -0400
X-MC-Unique: XOpaSvt_MreS2G-MDDXBjA-1
X-Mimecast-MFC-AGG-ID: XOpaSvt_MreS2G-MDDXBjA_1750163477
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2fa1a84568so3768015a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163476; x=1750768276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KShC4QJThQfwPAvgTMBPmuZLHMXp5DkJgcjKi26gyHI=;
        b=HgEGE9RphMovKgRvq8kWMa106YWRh4XoY8vrU7S9bB1JUJ3yzhQpd0RwYfhIhHG60d
         npCFy/z/4s25uIwdl8u2LYHh8XZXjXeq2TRt5Zr80nqtkcsONiEHFGevIih/SFAhKaGF
         KhyVMvbcvQfds742zPChCPlZn3a0a0Mh/o0vEHa61lcCzsgqf/8tkYtyYBnQIOfAOgqt
         NyuJwXZK0WDKDZHLYVW90uDrg4uHCZtds5TVSsO4fvdyrE5pdDM0cEhWhdPcB5xma3Af
         mpEY5vMwBDaLdIY2o+QzcCaKnuZqEvabWbszntbxcuw7MFh91apDJ4ZcURa67WRKTy6F
         Okzg==
X-Forwarded-Encrypted: i=1; AJvYcCXsdxeiFYO6NrxOZS1brN2eoVJsJzc/Sv46LnRogouPkUmwjNKWzIKdeNExwkZifRHJXa+r7BP0CaET5y4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMQ75rcJ6BQwxTbN695RMKHilUUoEgfqtb9wm4xy0BfR51CZ3v
	KQ1pvbvyHAltB5y9kzXeIwu8tc6/a+IDrgvl1zx48wZvM+EyR/V+N37uijR+iGfNqLL6Z5jSVhC
	PoAP5IodNrXBTcKAjtA27Bj7es/3cXUfzlu1rYFPzYeRcjs+yS+z1F7L7zajOM9jCYfofgk0YWu
	HmiNJAFOvufDV/W66sXHTerMVRPHWoCOhQR0ILNZcy
X-Gm-Gg: ASbGnctXHziHAHj26jtnB1lQu6Cwpsy4v5ngpLSEJGrHyVp1xGonA1JKDpR9AWEkgbI
	W7r8dCeYhP+DkadpbWnSYs4hdyI4TH+NiWDw0C+kmJ6FZscOiX44zLe5BtU5bVcmtD57oNBsh/n
	C3KA==
X-Received: by 2002:a05:6a21:4006:b0:21d:98c:12c9 with SMTP id adf61e73a8af0-21fbc7fb787mr20024575637.21.1750163476476;
        Tue, 17 Jun 2025 05:31:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7HH4JHZZHWGn7WxI2rGQ/OeijPwRemStRDBDlQeXn02r9gXZyhyGGRph8cab5dQyPSJpmb9OnGFTrO6w4wWg=
X-Received: by 2002:a05:6a21:4006:b0:21d:98c:12c9 with SMTP id
 adf61e73a8af0-21fbc7fb787mr20024532637.21.1750163476107; Tue, 17 Jun 2025
 05:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617001838.114457-1-linux@treblig.org>
In-Reply-To: <20250617001838.114457-1-linux@treblig.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 17 Jun 2025 14:30:39 +0200
X-Gm-Features: AX0GCFtjoUlasDEXuV4xySiG1s47WSqTu3IKcqaRn-XCjq44bSF-f3FN4m8jITk
Message-ID: <CAJaqyWfD1xy+Y=fn1x8uXTMQuq8ewVV9MsttzCxLACJJZg2A2Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] vringh small unused functions
To: linux@treblig.org
Cc: mst@redhat.com, horms@kernel.org, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:18=E2=80=AFAM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> Hi,
>   The following pair of patches remove a bunch of small functions
> that have been unused for a long time.
>

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

