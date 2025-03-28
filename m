Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7771C5F25
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 04:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743134905; cv=none; b=UbOd9j1eroZwoSvX/5IO13gbrFX/vdS5fIRw6ZV/kHhS3kCcB1dOxY2O2iIrMP6JAx7W8lssU5gZoBGoQL0cKldmHpGymVbphoFoMif4GjWo+wkmhX0t6dVnURyZpBZTheRUBDPryD0Em2QfyuSJDF8pyBEKwJEQIlROThffA+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743134905; c=relaxed/simple;
	bh=iYrVRcD+hMzJtKzodR0ESNhu7mLxGvDK1xY/1pi4jNw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u16pcxyqDMKtdNTQKU3CgftF3JLS5njn095mOIAi/y5qcnGi8Ev3atIbYZiosX8q8G1oqtxJEiWb4TLx7FdJR6rw+JMZ2MbHhfdJ7s4+k2h4J3ZoX+xC8VHQ2alpC8V/HLJDw5HUdVU8RpCw0Dj+ENnKTBuniGFMosZr5AV24Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eroXl0n8; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eroXl0n8"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso2239391a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743134902; x=1743739702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N03iBb0aPoOa1EMU2w3tNSLo9fIJtKzm12qVBAP380o=;
        b=eroXl0n8+OT1WgONptV+EA+kK8ucFA8h5gKi/zuj5OQRMp/bjukCcy0en5STiHvPjF
         hk+0RbyfQArUFzXVJCZIU4lcCM91HpM/R6oLg8REt3szqn/8DlbFUqRaFz7KVW1uUhC2
         2R8lLzlWzv6PGJtf5oH90dHAX4cRqBki80bGQli/mIh7ZKqVh16jWHyF8BwonOgC8xc7
         Z58exKQhCj/OHYjOLyfr0Yzl57V4S4mqh5MMEoBf0uJYiiEa9z8FZgYVjc1Rkeys5wkW
         c9jZIRU2rtdOEMJu1njuawOnnUTKseg6qPEo2Os8ZhCqc/A/C6VyepPeTfTpL9L62XQc
         HrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743134902; x=1743739702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N03iBb0aPoOa1EMU2w3tNSLo9fIJtKzm12qVBAP380o=;
        b=Ho+J7A+b+L1yGk5DWU2+p6WpgaAb6eBtGeDZz3YMTQ29i/ZcFq6vvdSg+p2uGYb2VO
         SLOXOUwLkiKKThxoRaUQITvS2my4OuXnl7UMD22vRjk5zn9YhgeLBAjgbeHCnt3QBkfm
         PvzYJEhAuCh3fnSJrJ6+O1UWkQBGgdJkFM/3Xy5rzuR9Gj2+9RPXPuaFjLxp5S4NcQmk
         NHI/t8kDXM40xPm+nMKZ9RLnTadOvCGxBjTgbRoBRbgkpL61lHaMub33J9VY10ONtSBx
         Z4DDHwi09qZGUO/9pHXTF0CnyT0c8VcXATDdOUsJlqQBi83kuuEhyPl7prEmJIP9cfXm
         UBnA==
X-Forwarded-Encrypted: i=1; AJvYcCX9f87rPPxX5U7dq/dJCGN7SCaEBc7bxnJMqWjuZbfdE7ULcC6Z/6oARAlo2ZGuRrkzPwoOvg/l0SPojiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyykHst9gwyPlC8ou4aSoKcEyILaOtk3hxoNkbKG8FhDyrlTFQU
	Tp1uhdQsGUISGo5mlIywVjfwKd+0y7/hXExMkZVVVacLJwOuxpDt2jRTxX3JXLrKlJVt6LcKZfj
	vol1MAGtLgolCqg6UYF42RrekGOVlJpMD3k9m
X-Gm-Gg: ASbGncvoll24SONMJndK6fxKLokxfumyzeYf8Cn8BRqZgja6uNnS3tf7jPTlLylop+G
	zAlXoOF+wCkItWW9khtWqbAJ/9tl2WLYD3GRiFZ8wkcoW+ZcxAdJ9r4Xk9yhACh9+RnkibaPXCa
	fTmO9J8PD+D+tApenJ5xGlK3XwyZNxhf0upXj5/zcGulfXg60fMJ+b1S/7
X-Google-Smtp-Source: AGHT+IET2SIyJWG/WqM8dYN2pMoj552qvEHpWMKKbW6yAwVAwSlCGxAcGWCgJC6GDSoyfDHa7yGjAkBy+fMLLMAo3AE=
X-Received: by 2002:a17:90a:e185:b0:2ee:cded:9ac7 with SMTP id
 98e67ed59e1d1-303a8164d83mr9850612a91.20.1743134902056; Thu, 27 Mar 2025
 21:08:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-2-quic_wcheng@quicinc.com> <CAGCq0LZoi0MOJLJYUeQJW6EfOU_Ch=v1Sg8L4_B-KhdDCx1fCw@mail.gmail.com>
 <2025032734-reward-fantasize-dc16@gregkh> <CAGCq0LamxvvE8b45VAshw9aWJNC2so_vK9t+pzXd3C7Y7tfYAg@mail.gmail.com>
 <2025032756-aliens-ibuprofen-79e5@gregkh>
In-Reply-To: <2025032756-aliens-ibuprofen-79e5@gregkh>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 12:08:00 +0800
X-Gm-Features: AQ5f1JorDK6fkpVgYpd1mPibjV42TOlpaMjT0M3mouvQUfQc-UcxBnx7ecDNaLc
Message-ID: <CAGCq0LZUezCBoqrS2+6Dphd4J2T0w5tPNweNVtGcNzMzjgSUXw@mail.gmail.com>
Subject: Re: [PATCH v36 01/31] xhci: sideband: add initial api to register a
 secondary interrupter entity
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org, 
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org, 
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org, 
	lgirdwood@gmail.com, krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com, 
	Thinh.Nguyen@synopsys.com, tiwai@suse.com, robh@kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 6:48=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Mar 27, 2025 at 06:14:00PM +0800, Puma Hsu wrote:
> > On Thu, Mar 27, 2025 at 3:02=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Thu, Mar 27, 2025 at 02:27:00PM +0800, Puma Hsu wrote:
> > > > Hi,
> > > >
> > > > We have implemented and verified the USB audio offloading feature w=
ith
> > > > the xhci sideband driver on our Google Pixel products. We would
> > > > appreciate it if this solution can be accepted. Thank you all for t=
he
> > > > work!
> > > >
> > >
> > > Great, can you properly send a "Tested-by:" line for this against the
> > > 00/XX email so that it will be properly saved?
> > >
> >
> > We(Google Pixel) only use the xhci sideband related changes and two
> > changes in the sound card driver. For the details, what we actually
> > tested are patch [01], [02], [03], [04], [05], [06], [08], and [12].
> > Do I still send the "Tested-by:" line to 00/31 email? Or should I just
> > send the "Tested-by:" line to the 8 changes above? (I added
> > "Tested-by" line for this [01/31] first.)
>
> Send it to the commits that you used if you only used portions.
>
> But that feels odd, why are you only using portions here?  Why not the
> whole thing?  Are you going to have to revert portions of this series in
> order for your device to work properly?
>

Google Pixels use Tensor instead of QCOM chip, so we won't enable
QCOM specific drivers from this series(i.g. patch [14~31]). What we
need from this series are common xhci stuff and portions of alsa. We
won't build QCOM driver even if this series is all merged, so we don't
have to revert anything.


> > > Also, I think a new version of the series is coming, can you test tha=
t
> > > to verify it works properly?  We have to wait until after -rc1 is out
> > > anyway.
> > >
> >
> > I think this v36 is the last version of the series as I discussed with
> > QCOM Wesley. And for sure I will test it if they do have a new
> > version.
>
> See:
>         https://lore.kernel.org/r/ee95520b-cdcc-4e10-a70e-683993cafe36@qu=
icinc.com
> for where the need for a new version is discussed.
>

Thank you for the information. It looks like QCOM specific, but I will
track and test if there was any change for common xhci in the new
version.

Thanks
Puma
