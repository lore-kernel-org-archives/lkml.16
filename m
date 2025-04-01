Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E33199943
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743536199; cv=none; b=n/PYrlIRRsNGQh6yBfo0N6cbu+N3WBRZ4Gc+0KxcOMRU1bLL1QUacTBXAvAaAJyiJ7FcgO8RioTQzwgiNf+K4wR4IsekocaNeX3gyD2bNbUod/qbxYqnk9OBMmnci9hHdL5kjVtLLmP3BcYjjlI4+fT40ZdjD1pFcjatUC3bTCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743536199; c=relaxed/simple;
	bh=1Ag/K+ihKoxs8bjuDYRY5IgvbQcvm0S5yIrK7TXzdIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sp9ZllXgakok01Stxe810AH+NVNH4Yu7Zyr0M0zmdf8L9I0iL1TAhCm8afQHPoLSTzy/RI/xaRf66gBvbPrPC6fI+b6Zl7eKzUAJSSoLdGzNsjsxYlztUn1+sM+ijuwzSkMEVMdSOwI6R9OR8oLBiDHNYjb4KYzBy3XqsXf2UX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLsaStUP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLsaStUP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2C9C4CEE8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743536199;
	bh=1Ag/K+ihKoxs8bjuDYRY5IgvbQcvm0S5yIrK7TXzdIc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vLsaStUPawDJNlhDqINP8hye4UPPOeB5VO3bdW5Jq3gNPwj4xtBobgZRJNW0vKriX
	 MyUztOdlqzf48MUlgfSpoYmdgZ7eVlykSYi7JzEcz+66HUvYmjbLmF8v1sDxnc5vWM
	 8WgOb1ENXWOGtXCtjaVRvOFYqC9QdL+etJMHmzG6u3Yf93nkYK7V1JQHhBalQSHC3/
	 jA8RKr3MQZrOab/eq5wxyXEHY/Yaak+BO6JZ/WbxgirFCpB0xLOX4UNkqv20T1Q+tr
	 P7W1Re3otcGAhrrWBrPtpmq6/zwERWKMWdKQ/RF5A9/sI9adbaOf44U5rDacmAdkS1
	 ui94nERhV2pTA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bfca745c7so52040081fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 12:36:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUwGKsRSdv295NkVV4wZKku0TU2stRl+xszFEAsCcWB/eaLUlZXPVw219a6c6Pl1MIKUpoK0WyEcQ7y53g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8IClevNWzh0C3tLbkyn3cT3k29Lyh2yUn1EV2cIPYXzClvxLn
	LgyNRZkqMVyfd8NZquM9fHb0m80SfzcV86JTn3WPMk12h6rS9HASG/vyOOO3jJ0rOPpVYAVS/ei
	ElKQ5/IgNMxMMKLgdK4JGK7djM5M=
X-Google-Smtp-Source: AGHT+IG9N2qpVoZa8OMnE0f5h8/6idR6t14JZMPu8pqEMW7w9TW8a6wHpfCXDzKqlb1iYWL9NK7+M+4ifF6F6jRmz1s=
X-Received: by 2002:a05:651c:b14:b0:308:ec50:e841 with SMTP id
 38308e7fff4ca-30de0311bdfmr47367051fa.25.1743536198007; Tue, 01 Apr 2025
 12:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com> <20250401191455.GC325917@nvidia.com>
In-Reply-To: <20250401191455.GC325917@nvidia.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 2 Apr 2025 04:36:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT4NhxH8Dcg3PK=9Y0rGCmdgDj4K1MdSDZMCDswYNQ57A@mail.gmail.com>
X-Gm-Features: AQ5f1JqFpbeU9DDjx1XgQ88rtWtAOiCciadyWtSXN7XHSzcbTMVmt66lRxaF5RI
Message-ID: <CAK7LNAT4NhxH8Dcg3PK=9Y0rGCmdgDj4K1MdSDZMCDswYNQ57A@mail.gmail.com>
Subject: Re: [git pull] drm for 6.15-rc1
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 4:15=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wro=
te:
>
> On Wed, Apr 02, 2025 at 03:46:34AM +0900, Masahiro Yamada wrote:
> > However, it is annoying to make every header self-contained
> > "just because we are checking this".
>
> From my POV itis not "just because we are checking this", I have a
> very deliberate reason for wanting headers to be self contained:
>
> I want the clangd code indexer and editor integration to work fully.
>
> When clangd is asked by the editor for a report on a header file it
> cannot know the missing implicit includes and it's functionality is
> degraded. It reports fake compilation errors, can't do all the
> indexing functions, and is generally a bad experience. To be clear the
> header is parsed and loaded into the database when some C file
> included it, just the actual editing of the header doesn't work well.
>
> This is a very big day-to-day negative for working on the code. I'm
> frequently annoyed by headers that are pointlessly not self
> contained. I'd really welcome someone doing a cleanup here.
>
> I agree it should not be a hard rule. I was reading the thread you
> linked to and I'm thinking the approach is not optimal.
>
> The only header files that should be checked are ones that are
> actually used as part of the build with the current kconfig. Christoph
> is right that there are endless cases where headers should never be
> parsed outside of specific kconfig settings.
>
> So, I'd suggest a better way to run this is first build the kernel,
> then mine the gcc -MD output (ie stored in the .XX.cmd files) to
> generate a list of headers that are actually part of the build, then
> only test those. That eliminates all the kconfig problems. Opt out any
> special headers that really have a good reason not to be stand alone.


Sounds much better.



--=20
Best Regards
Masahiro Yamada
