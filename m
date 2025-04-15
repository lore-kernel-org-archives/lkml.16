Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C0924B28
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761466; cv=none; b=TKvOkoCLkmLyuIpUeDJByxQGu97ZWaRf08ftlr3KLhBxfaJw/356YY0fTNQwacKRTvNmE3bWNi3iOFT75YcdyvZlAQZkAUmE4a8+Qj63URzgDluiPvczMGmlPLpFz+jMjqpER9RgsfX5qmS68sHmqwO0CTpVv2p2g/fL5qqo2LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761466; c=relaxed/simple;
	bh=f2L76U4BdNcmr3RzuD0bOY4xvLiqJal06xcikMkuAE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pO3kOJMRz+8okk4HjTpUxYvdFsv4MeMX1ZY9v4/rznOwZZHdthMkMSL0zhaZqQRWNjf+q5X0pSW9WYzsSICoGwRM+gZkECCDbBy2ThrZWTkRAOYT6IePSoU4oF+UmFvhiYXu0U/zLrgkWI8hr+f5ySKmG45EkC/qQWvjF9q5Q+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=KeQZ4mn6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="KeQZ4mn6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-391342fc1f6so5297828f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744761462; x=1745366262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWD5pI6GDA2fnJlpFdI06Xm5PY6v+zWnkPUtQT6JobI=;
        b=KeQZ4mn6eMyxe7iUyGd2DvFqQtZsHjV5mPzwpjevzRWS4g9hzxagSBLx58FO0DsZcP
         kS3q+iVffn513tFOA58ynWEGxpXkxnVcG9qJk17RPlA3ZaK+xYn5KDqR23JF8WmMNcf9
         UWTuXTHQpDxLMBNi3njGPOzyC0y8xjZbiauT9LIVKD+5WB3ydLTnzM86+VEsriIVIKbZ
         5os0xRjdMC9ejVBJy8BOyNACXVoE/YFYclAh/hLBWYepxMAnYLQHvD85vwgKtwfOjJXf
         K3AsYjna1tnW9nYHZ/4i/PPqTLcf5EU5thAdU9D76LaCmRFOZUohj9fGmkbkwUUdIoFK
         OLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761462; x=1745366262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWD5pI6GDA2fnJlpFdI06Xm5PY6v+zWnkPUtQT6JobI=;
        b=Zx3OjiIE8D+zKsciXg06/bDYlSY4bvOHy6oBab7Opm9EFKIECXNmPjW4aaCdiKNRav
         ioobMGB68VAAJm2zEB6df04Xf1unMTV84wqjLJn496McATacP2GruwsWN2P362jmVb3M
         Wjb2GZHQJDklC18o+g40z3h2UXkyw6SrDHT0ABrY83SOOBhdW10RxyWx0C+FbC/+zLmG
         97eBRBYk1qyk/2+K4dwmxClEOJoGhYwjSUF3drhRmjZ/aW58QAFEcvdt5UtRNOabInUf
         bNSScCCsK1DFtxOGm3kf2mNzJy5sLY6ETk/K/jYlRNRcOzamaPtyCw64wQbl/+tY8Vb3
         fADA==
X-Forwarded-Encrypted: i=1; AJvYcCWgdMzKnDFket2kRwcXFeE0N+OpSDS7fV5mIRMnZhAnZ4Qdq3CMu74ssui6WHKyA6ndwTl/J28SNPHZKy4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxde7Z4vTNxTt7Eujk07633m2s8J2bnXIvm7JGUKJHpO/IUgpSS
	Gxv0PqedRhqWxoSiwlhV4ossnChhRUnSysm25OUIYX/d3gIWZG97biyOqzFpWZ9f4gtM+52ORER
	yj/hSerWOs3tmLxyNgJ8Yj5bNfmGQ2MsjUoSsuw==
X-Gm-Gg: ASbGncu/qusoCs8hLzRk4XcNJRNv37SEfMSrn6OIuYUPXPJk/lmylCzcpmavSPbdvGP
	PF1lBZf1dEDuQkpIna8zp+GWSx9SxDQu85LqDwbTKMB5L2VDoK0B3NZFnmofUvHeYQrWcaYx9FI
	d3Flbf3vPZbn+cuZ7cWQ1W/pn6chpDI6kakg==
X-Google-Smtp-Source: AGHT+IGGD6454gToVDn/IoUIEfR1+ItsL/HISjK3ehJg9NVRI5QeW5I9RnXyLdaCHCAikYx5stTntOwf9Gs+iVc7lQw=
X-Received: by 2002:a5d:5985:0:b0:39e:cbd2:986b with SMTP id
 ffacd0b85a97d-39ee2729edcmr926257f8f.7.1744761462016; Tue, 15 Apr 2025
 16:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250324-tp4129-v1-0-95a747b4c33b@kernel.org> <20250324-tp4129-v1-3-95a747b4c33b@kernel.org>
 <20250410085137.GE1868505-mkhalfella@purestorage.com> <738a41ca-3e4a-48df-9424-2950e6efc082@grimberg.me>
 <4cd2cbb4-95ff-4f3b-b33b-9c066147d12b@flourine.local> <4c334216-74d7-4a30-add1-67b6e023d8d2@grimberg.me>
 <CAPpK+O0tmewK7pH458TOxjtimjO9on=4YDRFbS=FPTgM+KFTzQ@mail.gmail.com> <8ac6cc96-8877-4ddc-b57a-2a096f446a4c@grimberg.me>
In-Reply-To: <8ac6cc96-8877-4ddc-b57a-2a096f446a4c@grimberg.me>
From: Randy Jennings <randyj@purestorage.com>
Date: Tue, 15 Apr 2025 16:57:29 -0700
X-Gm-Features: ATxdqUGpEGX9YZAHGCTlBMQHQBANn-EtpiIizt1Virtao_yXmWw0UoGELM1OZAU
Message-ID: <CAPpK+O2SBm6-zqbiDbUB0yubVTvTrXWn1R+GAPne_+LGvVXp6g@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] nvme: delay failover by command quiesce timeout
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Daniel Wagner <dwagner@suse.de>, Mohamed Khalfella <mkhalfella@purestorage.com>, 
	Daniel Wagner <wagi@kernel.org>, Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>, 
	Hannes Reinecke <hare@suse.de>, John Meneghini <jmeneghi@redhat.com>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:35=E2=80=AFPM Sagi Grimberg <sagi@grimberg.me> wr=
ote:
>
>
> >> What I meant was that the user can no longer set kato to be arbitraril=
y
> >> long when we
> >> now introduce failover dependency on it.
> >>
> >> We need to set a sane maximum value that will failover in a reasonable
> >> timeframe.
> >> In other words, kato cannot be allowed to be set by the user to 60
> >> minutes. While we didn't
> >> care about it before, now it means that failover may take 60+ minutes.
> >>
> >> Hence, my request to set kato to a max absolute value of seconds. My
> >> vote was 10 (2x of the default),
> >> but we can also go with 30.
> > Adding a maximum value for KATO makes a lot of sense to me.  This will
> > help keep us away from a hung task timeout when the full delay is
> > taken into account.  30 makes sense to me from the perspective that
> > the maximum should be long enough to handle non-ideal situations
> > functionally, but not a value that you expect people to use regularly.
> >
> > I think CQT should have a maximum allowed value for similar reasons.
> > If we do clamp down on the CQT, we could be opening ourselves to the
> > target not completely cleaning up, but it keeps us from a hung task
> > timeout, and _any_ delay will help most of the time.
>
> CQT comes from the controller, and if it is high, it effectively means
> that the
> controller cannot handle faster failover reliably. So I think we should
> leave it
> as is. It is the vendor problem.
Okay, that is one way to approach it.  However, because of the hung
task issue, we would be allowing the vendor to panic the initiator
with a hung task.  Until CCR, and without implementing other checks
(for events which might not happen), this hung task would happen on
every messy disconnect with that vendor/array.

Sincerely,
Randy Jennings
