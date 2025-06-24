Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E642252906;
	Tue, 24 Jun 2025 07:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750750901; cv=none; b=gA1N7lmtgdL1SHqMsjeymKH7S6sKDM6l7ib3keoDWcJdoMIFQLGRmwzz8GpCuKnfipbanB0ZTYLjt6SRvW1PE9/4mLBxo1EPUFTemnR33ga4WmIur1pOR0hV6FRxXtjPsZ0Mx3F1vbucJqEfIxB1GIfNhryxT0j/sCKDJqBiPX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750750901; c=relaxed/simple;
	bh=lvQwdEEMs+Xn4iJniuDVcuGnrd4jdurlRCHQRZQI708=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJz612g/gYbFU8X/7rM2BTdsYIm1dPNkAijvbeiN2ZcBHgw9uPpL47ap5QhuOHFu/2+tVVKN68RVDp3AoeJobsEPQEd6rV0qvEkfvu2IeCUYofYBbDpiVR0Niq1qAhrcKhzCo0joejk8N5vNGVsOns6WVWHgdK96AtiPpLVSzwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkKoZyyV; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkKoZyyV"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so61413641cf.0;
        Tue, 24 Jun 2025 00:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750750898; x=1751355698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKNKAUPnt7D/QJNedcSSo/8QP0aEMGnpdAtG+3MkOOo=;
        b=mkKoZyyV46cuwFmRLpsgmBl3kOywbfVq/upJ68twX/tfhgFwmZ24iJxvxazGjmZjxm
         2s0nYKgPtgj7R8jtyvGnnCapXJ1juNQBuhlRh3sKxNrHid2+bviofLIbq4yftzSlm8OZ
         r2Dh/mMaV25fvCfJA4iriAg6uK35cZOuVnFSnHtdu9cqQb8iyoB4+pboGuPG6T2GTTJ8
         1kbtg2vC50ZmTFcojzDJObCpPK0F/3qWXBgWqJa4JOIcy2SxfjrObjRO1HTUDbhXhFFZ
         /lxEsiiHU2TBdUl+QDlZfQH9H6v5GKEwihMLXYPLuz7HANUj2SNkq+ehf8qNGAIPjRzA
         2j3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750750898; x=1751355698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKNKAUPnt7D/QJNedcSSo/8QP0aEMGnpdAtG+3MkOOo=;
        b=q7VHEoNa50pWEYa332LI9wmgi2gpiG3VN2gldFS0oyas3rpBWK981ONvV7bjm/wij9
         LfhNSLuJxzpndc9g4FypffDVCa5KqfmBq7El7HuOoII6q+7j/xf96hnJuvs8iNz+N7oV
         wPT4qu+NLR1tNLw9iJtvtv+3HFjStGdMCLc8x584gJn7P4eiDaq+bYMpm6rJhXEBOTzC
         fc+Co3+yi0x33Tzrs3upXVDGd6StYn9uqpcMzhebmpugG72SoCReFTk83NgS4C/OBlox
         LXacTFhlJmf9vFZ8R1dr2C7MAprbM5LsE3FUba9/LtiDV8DNU6Out3HwUpGvA7RoOJoC
         6iyA==
X-Forwarded-Encrypted: i=1; AJvYcCU1FCDX+mVz/bVP3I+yxtcIubvLteFodWSVFjr3Pd40rORputv/XkxmRrFlPfNoyUQkBdMMUOfp0ecw@vger.kernel.org, AJvYcCUlgRHSYG+WUlXbZjtJvCr7kJV0Iy++was9+aYL+8/0u6NZkP6L+/paY5WeHXOM+WEMoUAvAIheGoc8Obql@vger.kernel.org
X-Gm-Message-State: AOJu0YyMXFm97G82iwXyJt2ypWSb271xyyIXwAefzo2Yna4sYv+VfBEA
	4WBFoVes+LRymL0J4gl1WMQgeqan52wVItrOEMfNSna3sZUuh1Czn4Mtg/DE2aREdTwz9fWti2y
	l4YLlUDJiSFswlOYDY7EcwaNegKqxBCk=
X-Gm-Gg: ASbGncsNhXiDa6qP664LsBesJ/j5K+XElkMJT0+mIDFxQuX19qt53xY3dP6hezDCscu
	5ixiDAcPDFge8Cqut5zTr7nSYczp6/+QN4z5Cz34+MtVPE0qmfETOZbewwJW7ZadJYzb/gjOHhx
	BCzjCkYsmZ/Uu6wDOiiebaSfyuQnja30GmeFE7yiGH6cjP
X-Google-Smtp-Source: AGHT+IEDGLS37RdVuVTLyiWi72882P6Ur66vSqt4x922siqznIehdApjnUNKJjUln2CWaZvCSrI3sSbQZbrzM/jeJS8=
X-Received: by 2002:a05:622a:134b:b0:4a4:2ffb:5482 with SMTP id
 d75a77b69052e-4a77a2cc1a2mr265925901cf.38.1750750898031; Tue, 24 Jun 2025
 00:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <3286000.Y6S9NjorxK@phil> <CABjd4YyaNF1zosFFi6hEsZanPDxoaa1h4Dpd6uTPRwA3BZn0=w@mail.gmail.com>
 <5897576.DvuYhMxLoT@phil> <CABjd4Yy8WeXKmmxh2-TjjF5-ABy-NzzJsWpt1KvSjJqTHh0Xwg@mail.gmail.com>
 <CABjd4Yz4NbqzZH4Qsed3ias56gcga9K6CmYA+BLDBxtbG915Ag@mail.gmail.com>
 <36711B65-DD45-4539-BD9C-0382936FD0A3@gmail.com> <dd1d0676-4eaa-4df7-b557-676b3de9a52e@kwiboo.se>
In-Reply-To: <dd1d0676-4eaa-4df7-b557-676b3de9a52e@kwiboo.se>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 24 Jun 2025 11:41:29 +0400
X-Gm-Features: AX0GCFvp3PWrRWMHpH1qL680ohOJqKJ-nlrmN6zjVvYMRsQ73MM5PJ-3DQk0ZRQ
Message-ID: <CABjd4Yzj+fMoFRWVYBSvWTHHxs0Bx25dKaGn5Bo9QqHKOr0Wkw@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	XiaoDong Huang <derrick.huang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

On Mon, Jun 23, 2025 at 9:40=E2=80=AFPM Jonas Karlman <jonas@kwiboo.se> wro=
te:
>
> On 2025-06-23 17:02, Piotr Oniszczuk wrote:
> >
> >
> >> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> =
w dniu 23 cze 2025, o godz. 15:58:
> >>
> >> On Mon, Jun 23, 2025 at 1:19=E2=80=AFPM Alexey Charkov <alchark@gmail.=
com> wrote:
> >>>
> >>>
> >>
> >> Okay, I've bisected this.
> >>
> >> TLDR: Linux and u-boot seem to have nothing to do with it, opensource
> >> TF-A doesn't work, binary BL31 starting with v1.09 do not work. BL31
> >> v1.08 and earlier work fine.
>
> v1.09 added support for 1 GHz hrtimer in addition to the normal 24 MHz
> rate. Mainline U-Boot may only support use of 24 MHz hrtimer, unsure
> what impact the hrtimer rate has. Mixing blobs with/without 1 GHz
> support is known to cause issues. At one point the latest rkbin tree may
> have contained incompatible rk3576 blobs (mixed 1 ghz vs 24 mhz rate).
>
> Did you try with newer blobs, i.e. ddr init v1.09, bl31 v1.19 blobs [1]
> and mainline U-Boot [2] ?
>
> [1] https://github.com/radxa/rkbin/commits/develop-v2025.04/
> [2] https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/commits/rk=
3576

Thanks for the pointers! I've just tried the same with newer rkbin
blobs from Radxa's repo, as well as the tip of your rk3576 u-boot
branch. Same results: new blobs act weird, old blobs work fine (up to
and including bl31 v1.08).

> Clarification:
> Following boot1 parameter activates use of 1 GHz hrtimer, see [3].
>
> This parameter was added to rkbin repo before all blobs was updated to
> fully support use of the 1 ghz mode, and is the source for incompatible
> blobs I referenced above.
>
>   [BOOT1_PARAM]
>   WORD_2=3D0x100
>
> [3] https://github.com/rockchip-linux/rkbin/commit/cbbc6868221fb416d4f0d8=
6a10e493dbbbc1f117

NB: I'm preparing the combined TPL+SPL+u-boot+ATF image
(u-boot-rockchip.bin) using the mainline u-boot binman-based approach,
not Rockchip boot_merger. So I don't think boot1_param gets applied
anywhere (for better or worse).

> > I suspect it has something to do with the topmost OPP somehow becoming
> > unselectable in ATF starting from binary BL31 v1.09 (and similarly in
> > opensource TF-A). This time I couldn't reproduce the "permanently
> > stuck" CPU frequencies though.
>
> Open-source TF-A only seem to support rates up to 2208 MHz for cpub and
> 2016 MHz for cpul, see [3]. The opp-2304000000 should probably be
> removed from rk3576.dtsi.

But both 2208 cpul and 2304 cpub rates work fine using bl31 v1.08, so
maybe the TF-A needs a fix instead? Or is this another case of
"overdrive mode" OPPs as with RK3588j?

Best regards,
Alexey
