Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC2F270EB9;
	Wed,  9 Apr 2025 17:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744218877; cv=none; b=IcaLp2Fo5sJc4nHm0wP/i6GmGE7meHCyhCnJSlYZIaZWbtCWWbTaGbVKRg6B+Slmt8jy6DK5dbVNfbvbXfIvsJ68TB14+Rggx/6GCEwU8FsylCCj33V/sepoJpOpzOaBijuAMG06bInOg5xgEUf1ybrBGF/CZVVD5tLs+NVKMjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744218877; c=relaxed/simple;
	bh=2yCH11+QS6uXp6BOH0cT74jcB7dPGpLEP/wtuGCkuZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWdQRNwY7/9d9PgfMDnKnKMLIGIVQ3+yfvdMfH/h0NumZC/nUlAe3rqjMR4Ta/0QOH5NbEGPp6OcBC11oZST3qy0RgswXJOuVMpVYZs1XGcZT2UUMJdXk3QpNosht1+lQeiDpt1CCjbT3tAmD5TjKQTAiVO77W9jDPkyU99eb08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/lcfEpZ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/lcfEpZ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so11197678a12.1;
        Wed, 09 Apr 2025 10:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744218873; x=1744823673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4jn7E2mOey7c52PMiFK2mN0C3Pf6nDc9jBX5P7DR0w=;
        b=f/lcfEpZ2UqSvgeaWE+Vds4lQH1V7yxTmUJyGIjY4WutVtgGS5lWuyp/UOUXDq/fvE
         BK1XiSBj3QMAki8xgIwaKOr1RqzpgcD/fhlB2JVXAvyELVsFjEIxJ1h+cED5wXr7X02N
         rT1mkF5s1IYxzhQTS++V/QTdu3vHU8GA1OHM5TyftMbPWU23rKftkAREeIQ3TVppmVL0
         u9jlxGMpvdzkW50w700dySS13A1WL+fnj5GX7c7Y5pDCnuWP00RK/SsMy2jFNjkvpIWz
         hU+DRUPKubfE+FLTNiFohFCwz/x/tMN2nl3PQ1xFSzcDzos5NPdvsOAyCf4GBGWAQ+Gn
         MGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744218873; x=1744823673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4jn7E2mOey7c52PMiFK2mN0C3Pf6nDc9jBX5P7DR0w=;
        b=oajGJRnIOY7fo4azZT7ds2itfoDbQtza/zaVkspzhO5jedp2m9HKSt1dPaa49qawKK
         DaCxN4rzlNL/MzoQxqP2MDmS/BlT9qC6UujdlEfOdGFIYfL7ogTBBbwPeBfJYNYnNUB1
         UWur75NbJsw6ywqszrUY8l4IHBTkNa5t4J4ZBqj4rH1+k0GYKELW2jvPYWLcwZrKwNAX
         C8jnRiUWrEDZUMoCpJgWVEMGf5fvjg6lYeVSVvLT9Z6F0lqnbPBg5xEBQ3XPqAqGS1L5
         45fllPEPjY9zrYzX+0gtW2tB+GnZJrveeCFZwnLSImIAzdjOOV/qeIJecjTJNVyW/Yx/
         dtVg==
X-Forwarded-Encrypted: i=1; AJvYcCVJakBoGFt6bLAGh262L/Wjcv4Dpc1AMzfVLIpD3LwU+FqCjjSSwKrM/zOtz/7Ru7LslJCbsTxqH1XQCFM=@vger.kernel.org, AJvYcCWVjkap1ShxCTihX+frIpDjki+gv1/vj0sYloqBU9iI7QtNMNmmD3RiiDgIwdLXMcN+p+nXvXlCwDWLbVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOCcS90dY6+WKXdAPVcFP/TpYiEksGfPFvg/YtgrqNAdGXqn2o
	DdMIYeWiHNcAVWGn1D+WBKDKJ6SQ7+QANFzbn+UL06LHadoNBRB7
X-Gm-Gg: ASbGncud/NRtLbeMtur7dxUm/gGMkAfegdvBUCKFw/bCtt8FzRUJn2OUUXAaP+WZPQ+
	UK48/9tm3xvNpi/9NEx++v1SUJAS03w6y78tf9TV5Fc9pVxAau8AHoIscGbo/Wpu682AupAjW2U
	qqj2NtWso/iBDZHCsF61vtIPFjdkCQnMMdzthrc1b+ZzlRk84+3ohrCdEazSpXxaHqKB2xQj7t0
	5pEO72ShA2MYzd318zMVuZ4ooBe2d1hXQM9tblZ4LCl9+AL3S7gU+KFDMdNUC4w6vyL6Ihz7X6E
	/77rHHTTZMP0gmXjpE8en8DLhnFEHTLipBsLuuQW1f1UfuKlStC1Fv6UrztaSgNbfETrPTmhpQ=
	=
X-Google-Smtp-Source: AGHT+IFVIwUn9gnSu5wpLhhWkHk63r3TT3qIYaq3NQxQez4llYrua2mut70dsHOl+ApdX+lUsRLs0g==
X-Received: by 2002:a17:907:97d4:b0:ac3:121e:f2cb with SMTP id a640c23a62f3a-aca9d5dd4femr299108766b.1.1744218872489;
        Wed, 09 Apr 2025 10:14:32 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce732dsm124991466b.171.2025.04.09.10.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 10:14:31 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 00A30BE2DE0; Wed, 09 Apr 2025 19:14:30 +0200 (CEST)
Date: Wed, 9 Apr 2025 19:14:30 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: "C.D. MacEachern" <craig.daniel.maceachern@gmail.com>,
	1100928@bugs.debian.org, Kuan-Wei Chiu <visitorckw@gmail.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Bug#1100928: [regression 6.1.y] microphone no longer records (on
 VivoBook_ASUSLaptop TP401MARB_J401MA)
Message-ID: <Z_aq9kkdswrGZRUQ@eldamar.lan>
References: <878qojypu6.wl-tiwai@suse.de>
 <CAJ8x=4gN1fH6chp4C3jX1OXq2-JhbP5yUzLbqvWrAJ-u=+VNhw@mail.gmail.com>
 <87mscw4dst.wl-tiwai@suse.de>
 <Z_AxsuGoaVK9P3L4@eldamar.lan>
 <174248253267.1718.4037292692790831697.reportbug@x>
 <CAJ8x=4gQQeh+yuUrBDT3P_ZkWRT+7pPujq-ZF6Fcao0V7kohFw@mail.gmail.com>
 <Z_DNcG7wp4iPh5NH@eldamar.lan>
 <CAJ8x=4hmi0Afneepe15Ef-kzVZO+uyw5Row+Cooob_QR=DpwQg@mail.gmail.com>
 <Z_E9LbOiYN5dPpSb@eldamar.lan>
 <87zfgu1klk.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfgu1klk.wl-tiwai@suse.de>

Hi,

On Sat, Apr 05, 2025 at 09:20:23PM +0200, Takashi Iwai wrote:
> On Sat, 05 Apr 2025 16:24:45 +0200,
> Salvatore Bonaccorso wrote:
> > 
> > Control: tags -1 - moreinfo
> > 
> > On Sat, Apr 05, 2025 at 09:08:38AM -0400, C.D. MacEachern wrote:
> > > Thanks, running it now, microphone levels working fine now! Testing
> > > recording and playback, working perfectly.
> > 
> > Many thanks for testing the patch and confirming the fix.
> > 
> > Takashi, assume you will monitor that 8983dc1b66c0 ("ALSA:
> > hda/realtek: Fix built-in mic on another ASUS VivoBook model") get
> > backported to all the relevant stable series? TTBOM, it won't apply
> > cleanly to 6.1.y so Greg or Sasha might not get it down to 6.1.y
> > witout explicit backport request?
> 
> As it has Fixes tag, it'll be backported usually to stable branches,
> yes.  If it's missing, just ping stable ML.

Yes right, and in meanwhile it has made the way to 6.12.y, 6.13.y and
6.14.y. I just fear it won't go as well down to 6.1.y automatically as
the change does not apply "cleanly" so might need to make a hint :)

Thanks a lot for your work, I will apply ahead the 6.1.y inclusion the
fix as well in Debian to address https://bugs.debian.org/1100928 .

Regards,
Salvatore
