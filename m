Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6A725B687;
	Mon, 30 Jun 2025 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291436; cv=none; b=agVx17c2RxqVOC5vXo/hR32DuEiqcYX61Wv3E8NRNPQJ08R4ZdDJ6QOL58BZYQDUpm0zD2M8cajl9Ha/p509eSl+zCtWRCPdO8t1YxuJMxkjDI0VHPxLS9XK9rDQGWkEoXOfryb0Knz2ioQ7nLQeO1/W0J/1H5xEyf4XkU89MA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291436; c=relaxed/simple;
	bh=IQVhGSw27mbrhh2Uwszh19QwB+gQgLHGxJNAYOIfAUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qgAlx1S+SHIJbQtpzS+rHZlLz1dLxk4C2I51Ci8j2q1Thy4domiApyR2P5D6NsI9n3Kb6F++tQ/Xx/TLj7V8EQbhuPpY4Dz8MeGD9NDr9k8kxYGa8zJCLVbSHS5oXNbWXdAl4MH1GoSayjTg5HkqZe7k2efnIiadg0XnsdePSvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLSX97ud; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLSX97ud"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fad4e6d949so14500096d6.0;
        Mon, 30 Jun 2025 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751291433; x=1751896233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5Lb9XyF7dArjU8ijxNd19g2e4SY59XNR0KZZKcVnQQ=;
        b=kLSX97ud6gG/NVDwsXJjOewUDFYkK+qKVEqUQaVnROEmN9CWP9u5WullWazKWscKm7
         UPTuJTM8yJJP3WJisgdgkI7CgX+1/FM/XNJaO4YwOgu3tOc2vNZU6K29GTrwftsEsDp9
         I/SokZCxly9lg5whXdior0cqFqApaugB550Hg2E+0WN+DJNs6tWHJZqdeufpHxusEd3x
         c/7/gxyefJ6TZKu8B3QkZYV9ZMIeSRk9w/OXCML81PhkSBCKdU2Q6OnodFG6ZXuf1KQY
         1TbLGNJl1mUx8uJcTxtOFjgfEgxVI6ncoxsc5pT6ZDn+a0Y2E7/Xp8MdCVv2fwTLZOWJ
         mDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291433; x=1751896233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5Lb9XyF7dArjU8ijxNd19g2e4SY59XNR0KZZKcVnQQ=;
        b=iS9+AM9v/wZLOqtGg82XRHAwPBjO+XqTj4ffd/mW+/IorNmc3oZsQa9Z4resLKSb14
         KtBdnEWJqlRH4k8LexnWWkwu1fPse5e7J6weJk5KjwG0DWkL8cmzPKYUbCaU8JY2YCEO
         0B9zIg1aJ0r7JIHgh4XJUO9RRcJAXwnfNN2fLMHMLpN4ZSdALzR6mhvilkdwkI80yvC3
         V2qg9vMj9hVX1XjR0d02KhJz7V/+tW4za+FeMAANXyGTxXm6YaTpDpR2cTRCEKZcbVOE
         TObRsUKho616ej8ERb9qIf0CC1aDx2eoVFKF7rfGRr1+oHwNfkm2YaIb+fZ5EwW5OUF3
         O1zg==
X-Forwarded-Encrypted: i=1; AJvYcCVVcG+9dx8G3HD5utatjD8touzH+J4TUAoQVMwL+zrb7VL1yNXbYy7YIjbeyxCrJqHPMBg9Byce/CElTLE=@vger.kernel.org, AJvYcCXAA27ufZ64rvqx46EEUZoRpSXoBdO1rnFWujJa8eLsRZ1YKN144i8vtLf11JlSlqNiNVE0ujKAujy+oKbRNi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUc/yWdlPSLBTJKXqMFV0Xwy+QJXidCfk6Utw6LXhOCfuCRqxg
	BQzRl8LJReNSXnaNA5y28ewxDvmT00hg86/V5+IrIEQv7JwAlkfry/vw
X-Gm-Gg: ASbGncvtY+akG5nmgZxHCr7kU/UtfWEW0/W8bPyKIUAd4IJdrdDGwB59zeV3CEzG7wM
	KtW30WrS32Xl9ERfbTRVYS13py2Zy46RS8MLaVqFUpJUhG/+PpNEPGP/ZkrFbA2ArpQC/+wJj+F
	Y/+zwik0SZiz9Y+rtdE0ecQpPCkpwY8m7tb4fw0YdZ9KsL9lhchVGzx6etflj7zyU/4A0ZbTg76
	RFnUZnbJrpNdETFqN3GNEoXf4CuKvHIAUu2s6kVzzs87SPWx9Y1zrVkXxN36cnzRY89ZWqdup+e
	xAeB46/xq1kz2J/BuENFZFMe66n7ldm3CO8kzwqkVfqzjuSRTOXLWXzd2CmKaRD5lRjO8gTevp2
	ny20uQV2c7UrmFvM5MJ3j19sUY3lU9gdgtJCbIO2YvZF2Pe6h8EeL
X-Google-Smtp-Source: AGHT+IEHxeGpLNvKFW1gWPsvXXwQLIfBdOzO4xQXmaXIvW3hINkG5Lb3gWbZJ55wDEeX5PNX6IYdqQ==
X-Received: by 2002:a05:6214:76f:b0:6fa:c81a:6204 with SMTP id 6a1803df08f44-6fffdcff257mr195938466d6.10.1751291432568;
        Mon, 30 Jun 2025 06:50:32 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718d8f2sm68154456d6.23.2025.06.30.06.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 06:50:28 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 24AEEF40066;
	Mon, 30 Jun 2025 09:50:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 30 Jun 2025 09:50:26 -0400
X-ME-Sender: <xms:IpZiaK1guDOH7SmL4XT_MroNhCJtGq9O-mSASHLW9HgsuJjT-nGGwQ>
    <xme:IpZiaNGzzhlRHUL5l6VTOwdhl9vj6S6TuLsjOrhx33TjWyQVMj0mp7WmUFe3rRX6x
    ra9ug2ouqJLrW6-XQ>
X-ME-Received: <xmr:IpZiaC6unKwSHMhWsd-3QhRgTcUo3ggbnQwvPlNPz6thLwyLmn4aUHkImQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    feehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnghhosehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopehjuhhrihdrlh
    gvlhhlihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepvhhinhgtvghnthdrghhuihht
    thhotheslhhinhgrrhhordhorhhgpdhrtghpthhtohepughivghtmhgrrhdrvghgghgvmh
    grnhhnsegrrhhmrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdr
    ohhrghdprhgtphhtthhopegsshgvghgrlhhlsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehmghhorhhmrghnsehsuhhsvgdruggv
X-ME-Proxy: <xmx:IpZiaL3pfv5C-L8GiSrTyFayQftmx5D6SfPZ9AEAd-tMNIHODA4QPA>
    <xmx:IpZiaNEXif6gWn7z1G3LnIF5N4A7kDuaXo7bHnwovfv1o7ayjxaFeg>
    <xmx:IpZiaE-GVz9OC470fbW0XQ7IbsLuU8t-yrSZdvV-DpoSFlsrOEsalA>
    <xmx:IpZiaCm7YGAZvjzBatdIIymAhDzx9vg4lxZhGDzmxStRnNz-0cbWlg>
    <xmx:IpZiaFFT0xHuCvNQvEdFBMIsoGSLWN6pvZ4qEkzvYnvF5qOh-m34U5Ij>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jun 2025 09:50:25 -0400 (EDT)
Date: Mon, 30 Jun 2025 06:50:24 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,	Kunwu Chan <kunwu.chan@hotmail.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,	linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev
Subject: Re: [GIT PULL] [PATCH v2 0/5] rust: Task & schedule related changes
 for v6.17
Message-ID: <aGKWIFVl4nwSl8SG@Mac.home>
References: <20250625051518.15255-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625051518.15255-1-boqun.feng@gmail.com>

On Tue, Jun 24, 2025 at 10:15:13PM -0700, Boqun Feng wrote:
> Hi Ingo & Peter,
> 
> This is the updated version from my pull request last cycle:
> 
> v1: https://lore.kernel.org/rust-for-linux/20250506045843.51258-1-boqun.feng@gmail.com/
> 
> Please take a look, thanks!
> 

Ping ;-) I forgot to add that this is a dependency for Rust version's
read_poll_timeout(), which is a dependency to a few things:

* In the `Tyr` driver:

  https://lore.kernel.org/rust-for-linux/20250628.224928.690831629261546521.fujita.tomonori@gmail.com/

* In Nova, the gpu driver:

  https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-24-ecf41ef99252@nvidia.com/

* In the qt2025 phy driver:

  https://lore.kernel.org/lkml/20250220070611.214262-9-fujita.tomonori@gmail.com/

Thanks!

Regards,
Boqun

> Changes since v1:
> 
> - `Location::file_with_nul()` is used to avoid the C changes of
>   __might_sleep()
> 
> Regards,
> Boqun
> 
> 
> The following changes since commit 5bc34be478d09c4d16009e665e020ad0fcd0deea:
> 
>   sched/core: Reorganize cgroup bandwidth control interface file writes (2025-06-18 13:59:57 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-sched.2025.06.24
> 
> for you to fetch changes up to 7e611710acf966df1e14bcf4e067385e38e549a1:
> 
>   rust: task: Add Rust version of might_sleep() (2025-06-24 15:53:50 -0700)
> 
> ----------------------------------------------------------------
> Rust task & schedule changes for v6.17:
> 
> - Make Task, CondVar and PollCondVar methods inline to avoid unnecessary
>   function calls
> 
> - Add might_sleep() support for Rust code: Rust's "#[track_caller]"
>   mechanism is used so that Rust's might_sleep() doesn't need to be
>   defined as a macro
> 
> ----------------------------------------------------------------
> Boqun Feng (1):
>   rust: Introduce file_from_location()
> 
> FUJITA Tomonori (1):
>   rust: task: Add Rust version of might_sleep()
> 
> Kunwu Chan (2):
>   rust: sync: Mark CondVar::notify_*() inline
>   rust: sync: Mark PollCondVar::drop() inline
> 
> Panagiotis Foliadis (1):
>   rust: task: Mark Task methods inline
> 
>  init/Kconfig                |  3 +++
>  rust/helpers/task.c         |  6 +++++
>  rust/kernel/lib.rs          | 48 +++++++++++++++++++++++++++++++++++++
>  rust/kernel/sync/condvar.rs |  3 +++
>  rust/kernel/sync/poll.rs    |  1 +
>  rust/kernel/task.rs         | 33 +++++++++++++++++++++++++
>  6 files changed, 94 insertions(+)
> 
> -- 
> 2.39.5 (Apple Git-154)
> 
