Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0803F84A35
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944016; cv=none; b=lD5prAdpItKORC5dEMfCnwYLpWB7qQM/vQQEItU/dbJHysLT0LfUr8gBucuB+RGwV22gOYpkNfSoPfhV4d8CJoKMPAwLjQfKqZX9c+OOKAPff+MKZzUqxmT0H3Qr2rGUgAcIxdZPHVfxbH9nAnOTcZB+19Vr5Qau8dmuTQabih0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944016; c=relaxed/simple;
	bh=WEDAzYZiLp7mEV4s/5QMWARAlJt/3C2clXLFrlAvg3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lD+YgwMc09jW9A30XoMDCeT7bouln6dg7YxSSwlmdOMaTEyxy9d5qHP2cPk164g5cghPLe84KxEedj8wzj7qX7Ba2JS+2xGre7P44np+66rVGKCA48cPvC3xBP57jk+Ltgz5zo2gypLiIVreejNtcinY3tYwCjsr3tuZMphpb3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ePLxXINt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ePLxXINt"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-309fac646adso3681a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745944010; x=1746548810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFSw9zzZmlKdXsKFkYK6Hk2SAswrTv3a4YDDesvzZZw=;
        b=ePLxXINteWSi8MQxGuZo/CVHYt60LR2h/E+HEBytzpmazJd2sixeXYEjSFIe6dchzH
         XvlFwD8MTxJGU52VrImKE5o2BjBXEuhO5VSxYstUy/FZUngDPofxA7vmVEHrmLiQdpY7
         ljdyF16U9BSB93Er0/Cp/SFwrWctDx1UjD0eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944010; x=1746548810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFSw9zzZmlKdXsKFkYK6Hk2SAswrTv3a4YDDesvzZZw=;
        b=laIvgO6QYCI16q+s7W9Ec3IL7WmIQzAofohcA0HnnJmr2v1OmaIBq+zydKEKjtpzmT
         Yc+cSl4gFUHYJol/i7kO4HocMNGh3q42/VfxKakJrRFJCTSFG9LrBMJHLraW5w+xdyTr
         0g0IbeLDOA37RsFA1YZo9wlCiMGL3RjlCVJ/9MozjNt3QHdX0C8ha8/XQZnBJtsXaOra
         y8HwKdW8UaHCJVKtzklBKevuMyvlSxX9FEhFlUgibe0DOK5kZlH5guYhz3JyyMkPvh4x
         oHgBmt7EweBOpaioCmd57kB5VZYpyebV9RqZ2Jb4QVURUUsdUF7tFiccjXjmx629v25y
         r4kA==
X-Forwarded-Encrypted: i=1; AJvYcCUuZptKvjo41BFm2zgxWoNicAlGqP+QZnpAiIh6oIbGt1hySTlr+MJLAJ43ShHwf9GSfbiDq9ZKbEn+Xro=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl0zAjXd7ChNzBQ3LfqNkd8PBxsFA1WC7lfTzHIDP6IXBYU5U3
	COOOKLNbhAbyydSS/oOy1UHOiaR6n+cbwxDh2kzsSg1pXEEvw/dIWQWtC+q08F5yWaUV55zEfYI
	=
X-Gm-Gg: ASbGncvy83t97JvfY76O0ziSMcSS8mD3TFgyjKMNIOSYVbOr/MASFzFB8BeTa5VrrFT
	mnXYFsm3WY8HKJCl6cxvAx8A60cspAExvBD7Uk4zIsobJdvbRhOe1+Ao3eVmxcMRNMgM1VkGq2M
	90Tfwbj1w4U9wph0w67m+xzK6lCw6h2D0dgId1Uddc+oRU3NgTWVvyVI9PPWbueIWR0iUA/wC25
	OLY8DuCTmLa28lR48Ju7PAuqG702toFRQz0gytmJOqnRo1OaqIgHagr04RYnmmeCzPcuvdmgvTh
	PAcHFrqGomHMsoC2jvjqdpjP3J7HREna/sdI2KEUaQuSDelhCaNlChwy0pmJj0z71Dz51PSRBcr
	mfhPq
X-Google-Smtp-Source: AGHT+IF624th4fHGdPPi6HiKhs50DdzcqazjQ1aJ1E6ji9VNlK8PfdcLXM5lEsvUGhVdzuh9O3HmCA==
X-Received: by 2002:a17:90b:4fd2:b0:2fe:93be:7c9d with SMTP id 98e67ed59e1d1-30a2245d8admr5158768a91.7.1745944010566;
        Tue, 29 Apr 2025 09:26:50 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef124cffsm12597109a91.32.2025.04.29.09.26.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 09:26:49 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30820167b47so24001a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:26:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVZMoy1aynG8pTVSeL8N1jaWcskZTLO37UeUpI2ZkG4SRXGEq2W3mBUo7TWUdBoclwUkJ8AekXbOGlfrqk=@vger.kernel.org
X-Received: by 2002:a17:90b:514c:b0:306:b593:455e with SMTP id
 98e67ed59e1d1-30a2244ac78mr5519557a91.1.1745944008394; Tue, 29 Apr 2025
 09:26:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20250429092030.8025-2-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20250429092030.8025-2-xiazhengqiao@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Apr 2025 09:26:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UsMaXA6aGjG=VxuQqPKT+zXSer8VD7JztpWWw1aq1WGQ@mail.gmail.com>
X-Gm-Features: ATxdqUHoXvlkOKGwmAYlJRi_2idzUonnocWOsACoF9fazlVz2BlbZKPESPlK8BI
Message-ID: <CAD=FV=UsMaXA6aGjG=VxuQqPKT+zXSer8VD7JztpWWw1aq1WGQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/panel-edp: Add support for AUO B140QAN08.H panel
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 29, 2025 at 2:20=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> AUO B140QAN08.H EDID:
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 06 af b9 fe 00 00 00 00
> 00 23 01 04 a5 1e 13 78 03 c1 45 a8 55 48 9d 24
> 0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 18 86 40 a0 b0 08 52 70 30 20
> 65 00 2d bc 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fd 00 28
> 3c 71 71 22 01 0a 20 20 20 20 20 20 00 00 00 fc
> 00 42 31 34 30 51 41 4e 30 38 2e 48 20 0a 01 79
>
> 70 20 79 02 00 21 01 1d c2 0b 58 07 40 0b 08 07
> 88 8b fa 54 7e 24 9d 45 12 0f 02 35 54 40 5e 40
> 5e 00 44 12 78 22 00 14 ef 3c 05 85 3f 0b 9f 00
> 2f 80 1f 00 07 07 51 00 05 00 04 00 25 01 09 ef
> 3c 05 ef 3c 05 28 3c 80 2e 00 06 00 44 40 5e 40
> 5e 81 00 15 74 1a 00 00 03 00 28 3c 00 00 60 ff
> 60 ff 3c 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 00 00 00 4f 90
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/3] drm/panel-edp: Add support for AUO B140QAN08.H panel
      commit: 5f8f898b14b2401e980b1f206b827d985e040ebe
