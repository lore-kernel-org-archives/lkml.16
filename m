Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7CD21B9C3;
	Wed, 30 Apr 2025 08:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001719; cv=none; b=u2w8dYtcman2krXcIVTEcL6FxhoBXuwFIvGdo/g4HeQXWQ5Nu0ZbTrBs/eY/BSeSPZvpDwUsbnwUxwLlleRFVothCYr70HO6rgwaN4Tcykhay2kYysQkmtUQniwAheK7kDEx6h3fU3c09clezAII+/O+HMvBGEgqqd0cfvmrYgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001719; c=relaxed/simple;
	bh=dRAs2qXXUA/N97RfHpdlApe9kO3tgf2G0Ws27HW/leU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hh9BgXNAyqdpXiWZMpx4lCG/+u5JAJ3xfgLsyFm3KfTgoUXV/f3FmW5UawftkLrk+D2CW24UrZQhneC7y9zqTOxHy7lwOYwr3G2Q0iI7ie7MZwFK8OEECHm5cl7jOHcTp+mFWPfeJebfy3IX8WvQ10tw7NYcL8/uki+bvnPoe6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HLQQRYIK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HLQQRYIK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675A2C4CEE9;
	Wed, 30 Apr 2025 08:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746001718;
	bh=dRAs2qXXUA/N97RfHpdlApe9kO3tgf2G0Ws27HW/leU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HLQQRYIKoXpbCGU1oiZAlBYVf2sYWlszXWirWOR7hDLvOKLcxakR6Hs3RjN3ZDT9o
	 ke/671XCkqpYc76O2on3kpuvoCh9hLTZwUfkWVDNPyp2Cna9grfXVOy82u1s6bDEuP
	 mLQM87Sif9u9GSoHY1De98kud+SWcTFGTcwpx2u5D2DN6lt6S34n9fHH0lMXSlwYeG
	 EtCJE+mzLWFKYv5ASk8ITaolzKlv+PBLyNzMkgw4wnnqBXJeCkg8on1KO0My3HCeO3
	 8kQlMbqSzFqXKZof7wjX/0MP1fTgE1aARvdRqwLGvbX2O+PtPL9ku0h9V7luEzQOZZ
	 LN8bUTGAV3O9Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "kernel test robot" <lkp@intel.com>,  "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>,  <oe-kbuild-all@lists.linux.dev>,
  <linux-kernel@vger.kernel.org>,  "Miguel Ojeda" <ojeda@kernel.org>,
  "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
In-Reply-To: <CANiq72n6tTox7jMX89p4vLihghrJeDcBL+MWR8rp4_Y0LyxcKg@mail.gmail.com>
 (Miguel
	Ojeda's message of "Wed, 30 Apr 2025 07:06:28 +0200")
References: <202504301208.YQCguEmE-lkp@intel.com>
	<D4J3Zi4_pJAvvHPii2-9GqOa4jd7dzNzOJ3Wf_Mo95TggON0WGCiDwXrT2vd_aj5G0tt-tqIDp4vi5tjbLE7AA==@protonmail.internalid>
	<CANiq72n6tTox7jMX89p4vLihghrJeDcBL+MWR8rp4_Y0LyxcKg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 30 Apr 2025 10:28:25 +0200
Message-ID: <87ecxa2guu.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com> writes:

> On Wed, Apr 30, 2025 at 6:55=E2=80=AFAM kernel test robot <lkp@intel.com>=
 wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
>> head:   8bac8898fe398ffa3e09075ecea2be511725fb0b
>> commit: 584e61452f75bfeac2cdd83730b4059526ec60c7 rust: helpers: Remove v=
olatile qualifier from io helpers
>> date:   2 weeks ago
>> config: um-randconfig-r063-20250430 (https://download.01.org/0day-ci/arc=
hive/20250430/202504301208.YQCguEmE-lkp@intel.com/config)
>> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cb=
f1a2591520c2491aa35339f227775f4d3adf6)
>> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arch=
ive/20250430/202504301208.YQCguEmE-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new ver=
sion of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202504301208.YQCguEmE-lk=
p@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>> >> error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
>>    --> rust/kernel/block/mq/operations.rs:15:33
>>    |
>>    15 | use core::{marker::PhantomData, sync::atomic::AtomicU64, sync::a=
tomic::Ordering};
>>    |                                 ^^^^^^^^^^^^^^---------
>>    |                                 |             |
>>    |                                 |             help: a similar name =
exists in the module: `AtomicU32`
>>    |                                 no `AtomicU64` in `sync::atomic`
>> --
>> >> error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
>>    --> rust/kernel/block/mq/request.rs:16:20
>>    |
>>    16 |     sync::atomic::{AtomicU64, Ordering},
>>    |                    ^^^^^^^^^
>>    |                    |
>>    |                    no `AtomicU64` in `sync::atomic`
>>    |                    help: a similar name exists in the module: `Atom=
icU32`
>
> Cc'ing Andreas.
>

Gary sent a patch to fix this a while back [1].


Best regards,
Andreas Hindborg

[1] https://lore.kernel.org/all/20250219201602.1898383-4-gary@garyguo.net


