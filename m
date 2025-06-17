Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07F3290092;
	Tue, 17 Jun 2025 21:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750197432; cv=none; b=W/+263znf+Zb7Csu3VnHVPuH+1yDmatBDTb4MawEb0zmmfGSOWCJ4t+CUJr7BJ0BTMieZsjH/QwJ+QmBFUDLEr46NkeFRW3JyzwfRUrUfcqGmDvXGesvGgjyEKvbzlJ8E6jGgWCPkupF6vxc7YGrBrnnghRK3ms3zC6H1QdSvu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750197432; c=relaxed/simple;
	bh=b1eCJI+VK7BMdEHZOiz0k2L5nEhbLp72mIGlXLhdJ1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAmS0UUn7DfBhaVRvnX6aHskTKlRCLpy1Rsr9Ov8+mHfP+jN5GLkRX9fFBEj501LKAx4NJupXUgMeKPoLFzaqdc3QqOw7dsY1dchJR5XsL6+Fj916gGcOg3YC4hvL0FJJ8vp7niCloGZFgzSc5MJySgDzMPpx0KvuDzofXliRH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqlE/fqT; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqlE/fqT"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a58f79d6e9so76714101cf.2;
        Tue, 17 Jun 2025 14:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750197429; x=1750802229; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9qk4ALqXXz9k4shJawkcQqEjRsEec0PZkXEuLO+aG5A=;
        b=ZqlE/fqTp1XLWOM2A4IjWz0cPpg2WVyhhTjod6dzJE9AVN4TvgZqw9s6wyMA8ta+8M
         wPP/QYsYRNfyAbiARNn3ensWumI+mHjl1pz1UvTLb1Zkb7EsWBCqKOpG0CnP65kxBEWj
         Kp88kV/8tf4PeWVTwyNtTL3uj1tf+L2yK6hWBNm4kN1plmjcg/wfsrqVTGmWIYfbHrTd
         DhJhXF9PWDmOB1husdTj7b316Ia6VBa2sSATjCE4fOT0bFRLlO8bZVRUiJZZX/TbL02M
         9N927eH2pr9usZzTw235h8WUjG+sKTM0WqNqqqKWIj7rG8onGZga7bBpAvoHCurIiJzF
         cwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750197429; x=1750802229;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qk4ALqXXz9k4shJawkcQqEjRsEec0PZkXEuLO+aG5A=;
        b=iCe+8FQDjyIfN1kU8rpil1j0Y2orzveewKf3aGh2XTAa7It3mEYzNUzshXVoTat8wT
         MTVVezGa/0z+HCU3Dl+EZ00Sm/aI33Vm2hrDOKIdEHj30fUQ2W6V70tutFz3IVxF3GU9
         VELJPav1R9XM8OMOFzkYZMI1AJS4GgGEdEpIxqrj2pevYwAyAep0uyML/Y8zmv0R7R9r
         pr3zJ56L/pJ2SMFWw6IBRwKzVFKLyUQRBGyBySQBFF4ryazWinGFsU+vcPZ8kAk12f01
         O2k0knkIBzGUk2ss7wgiCxDxHofv+EuoQlMq2iERuNYiOyB+tSAN6rRdnQMu9CyjXZ4i
         Njyg==
X-Forwarded-Encrypted: i=1; AJvYcCVVYAzpb7qJZbvePoxSUhL1UIhHnhaKjVX+LhqM0VODRb4N5lNI1bkGxge/0mkd93VcrnxpYllGmlpdM7DQgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTErrivVPpxkIF0v05xnNRPCgti1GlUE7w/ZBPCs+vLzXRha8m
	m5/cJZMBpELeBAHGIBtWzqzy2SpnRvZOUDwInYqEW580p1uqcYnXRz/H
X-Gm-Gg: ASbGnct5qNc1aXDTcPAp9x4BdE4RCsM3SQHeVonJMx3qen7YAeaTHHeDAjMLw7AcXfr
	Hjk0m1IIm3aqAvvVlxcHjPLUk9ko9tofGW0LiLM7fTMM/NoJWv+hMGgsKk8O4L/Q39nLH/Wq2xQ
	rASpo37vIVa/S+vzoDv1OAAb/QXoW4/ydySRkccox+BiNC2livFv29WdqGJ9Mco6BaSpAkoY9Ky
	wtaAhL8ouDoKnB+8Mjgd+p1sEr18lfq17rYl/djCwAxMp3xf3erOdw2bHXvhpvbxGDW5Zl9cwx5
	sU7GfoZhZDK6vW38iBo3Dy6BJVoi0suiIPvELhaAm6B3oLE9LmTWIGeVpZ24OTP2qc2OjmbIrmM
	sp+BTbEU4oTSNbMux7wHMKft8YGeD7xd+zKlZdlAN+MjgSLSmZlMn1rl/wcTOkVE=
X-Google-Smtp-Source: AGHT+IHPiAneCHgWnRNbdxb9S/zFegrpb3/8UHI1y2S7rMrKSfw1KQNZSzltEb5XRtbTQUvVaV6b5g==
X-Received: by 2002:ac8:7f4f:0:b0:494:adff:7fe2 with SMTP id d75a77b69052e-4a73c617180mr238343281cf.43.1750197429399;
        Tue, 17 Jun 2025 14:57:09 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4b16c4sm67154721cf.44.2025.06.17.14.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:57:08 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2FE631200068;
	Tue, 17 Jun 2025 17:57:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Tue, 17 Jun 2025 17:57:08 -0400
X-ME-Sender: <xms:tORRaMEhJF4B2Z0-WAS-orKZYkLIRCPqArXN2q4To-n9tJy48kIQJQ>
    <xme:tORRaFXhl09A-6CFC5lbWh1FMhOa8J9VhYQ68Osz8_uZJRL5zcMWOvj1daKC3008n
    5D1QLB_K-SKVFtk0g>
X-ME-Received: <xmr:tORRaGKn2b9vbFetrkk6jx3Z8QiCe-qqcE2nf7qGO7F3LOTF5nNFv_Ul8gI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddufedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcuhfgvnhhguceo
    sghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeevgf
    fhueevkedutefgveduuedujeefledthffgheegkeekiefgudekhffggeelfeenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvg
    hsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheeh
    hedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
    dpnhgspghrtghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehm
    ihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrdgtohhmpdhrtghpth
    htoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgig
    rdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihgh
    huohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprh
    gtphhtthhopegrrdhhihhnuggsohhrghesshgrmhhsuhhnghdrtghomh
X-ME-Proxy: <xmx:tORRaOG8ScvxQlru3VVowIBF-PKnQhyyxfQ9Etqg80ogvanovWwPuA>
    <xmx:tORRaCVWx0er69GAGyG9CKR7t5VSAbTyIq_BjrECpiHtNLBho2d9Zg>
    <xmx:tORRaBOIR6i4YKiDF3fGQqQDx1j8mo31YRTtkwgZHhUM6jLDGYgkmw>
    <xmx:tORRaJ2T10i4DXj6nnF0W8ejJPZqTiqYWtu9mLxivCSfjUE8jjRmMw>
    <xmx:tORRaLW01fVMgy_c8sX-0SvQlc3_1QG9K1qAM5ePmJ7pREABo5LcYgmT>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jun 2025 17:57:07 -0400 (EDT)
Date: Tue, 17 Jun 2025 14:57:06 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, mingo@redhat.com, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com,
	fujita.tomonori@gmail.com, mingo@kernel.org
Subject: Re: [PATCH v3 1/2] rust: Introduce file_from_location()
Message-ID: <aFHksv4oZIxuT_NK@tardis.local>
References: <20250616153604.49418-1-boqun.feng@gmail.com>
 <20250616153604.49418-2-boqun.feng@gmail.com>
 <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com>
 <aFFwumsjuAEIJVUF@Mac.home>
 <CANiq72k+d3FzM8O7R9_WrpU3o3RygpGAS3S0Z5wPZsvC3k6=WA@mail.gmail.com>
 <aFGenbg8S36G1aeP@tardis.local>
 <CANiq72neJ-1e9Cef5RJMdJGEqWVEW7F72_J0GcDpJuEd_APrxA@mail.gmail.com>
 <aFGv7-0PzewfS5kr@tardis.local>
 <CANiq72mtkhZ5uhCfQ9WhLHWdC96iHCXTra4OXChGb+qnpRKNTg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mtkhZ5uhCfQ9WhLHWdC96iHCXTra4OXChGb+qnpRKNTg@mail.gmail.com>

On Tue, Jun 17, 2025 at 08:22:19PM +0200, Miguel Ojeda wrote:
> On Tue, Jun 17, 2025 at 8:12 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > How aobut something below? (I use "" instead of `` on purpose because
> > the output variable there is a string)
> 
> Looks much better, thanks!
> 
> > You mean it should be "with an NUL terminated"? Or it should be "with
> > a `NUL` byte terminated"?
> 
> Ah, I meant that "terminated" sounded strange to me, i.e. it sounds as
> if the NUL is what is terminated. But I am not a native speaker.
> 
> I would have expected e.g. "a NUL terminated string" or variations
> like "a string terminated with a NUL" or"a string with a NUL
> termination byte", if that makes sense.
> 

I made it "a NUL-terminated string" to align with other parts of our
documentation in kernel::str.

Regards,
Boqun

> Cheers,
> Miguel
