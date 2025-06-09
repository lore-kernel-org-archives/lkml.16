Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974D413C918;
	Mon,  9 Jun 2025 14:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477891; cv=none; b=njWjIqcw20O2LPYjo2TrAW3QHDJksM6r2XDN7EvxbGk2vEntQb94DDx57y9nAuT2YHHL7ukI8Z7N0jGEI1O8a2Bs3iptjkZcVFgcTqEQa/iYwUiEPmhPvhr4Xok3gfhL2iNxMGVeqb4jsnrg/Q4qrTNTStUD0WvEHtHziVhwwn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477891; c=relaxed/simple;
	bh=fnY2vRrdDLJXpJrGumvnW98ZM+CcPlD7GKqL5fb03G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBE4VjzPwMtISbzvJkD1maJH97yvB2+RiNTHlKwYqKQe6yuba6+U5jo0oi8BoX7fvry7fz9UN3KpuUGy/wiFutGEE//4HTLUS/oiVCFBBvjklbpa4zpwZanRMIS/rFdcwhX1idgUQuhQAD1yCJ/Q0fMHBYKej3Alj004x+QhaEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MY1IkofD; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MY1IkofD"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a5851764e1so88019421cf.2;
        Mon, 09 Jun 2025 07:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749477888; x=1750082688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSSQv98yZD0pSyxFmrCJQtCsQAZFbsC4gfvObAeQwVU=;
        b=MY1IkofDGVJL5guK5nM1hcbCmpFQLGBJ32X05a78ZlKWATGwQ+r5cS1oBG+vvsytXA
         YsSZe/7mW3UibW++5vomuXlMsPGi8jhPXG3sdb98qGWIH8LFCzMZ8izFDR56Y5w87rQI
         g2gF64fr8tjxXiMLKeNJ4SbmONgmAIUSWIYEYl4mCfuDLgWrfOM3vaS46F+6kAjyo0HO
         5AnxfqvM7utSL5ldgE3ZcmCXgelqGW2IQ+D8n4XrFNGwYtzydfuEJFMry3uKDrBfOGdg
         576HU+BpvncMVyFc9271fos/FlIFhwP4DAJcc3D0xfL5gWHWih4jVRi7UwilKjqTh5du
         FtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749477888; x=1750082688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSSQv98yZD0pSyxFmrCJQtCsQAZFbsC4gfvObAeQwVU=;
        b=aIH3uQpd2lAt/fVO6kcgzhXclj2C1wG+XYsg4Mr3Cx3kVxTpEtxOtnnZWEQcWx/NxF
         ezICEFyD/gBuqac4aKzD+uXYcuW8D9YLAEk9ubtvKilXS01PE7bGUmyzOC6NhCDU+YAk
         nOlH8c1YyfbvSn4tCJOlmo2vUU4Eri9CYaSErm99Iy89/Ct0SHvBcpmphC6ZBe48SNX1
         6pR4wBnMLoUgOqApm6FO92hkRuKA8ErzXOQ9kxJSo2twHtzzB0/9IEHOzbowgbcbVXS+
         nn2964Rm8UC0wDdUEpaJqt91/ZuvBsLJm43WCBrXcgJtfDCu7LFIs/pXeP00rJRy9Vm/
         iYyA==
X-Forwarded-Encrypted: i=1; AJvYcCUFqC195glc2aVWo+DMPfUAraUkxwiL82CX0/7LdmjFC/csL8jpJDjZjp+AC/bI2eJ42Eyusvuu+FjmytY=@vger.kernel.org, AJvYcCW3FLGWM8uD+XpQ564x/uCPgdCJqD5rNQc1/DiYHXXPAToSQqu9FYLnhA1acCTeUmnjrifyrB1f3LGyO39WPic=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFqyYDQaG8IX7O+BfoqMp8VafMkkdE4YwawiJ9MJG6qqHEy3Dd
	MCvthDTOERHNe9SF6F+hwstgbD95hWh43D83zrBKARSMht3IoIDaJ7UT
X-Gm-Gg: ASbGncuD3Mcj7oeI9JamKXmQIN8gbxOiBNZt0QR7pWVdvUHnGmYfBEt9Gr5hIr6FZe5
	Df8QU35b1FFA24/TGi83tjCMHhBB+Pso1lDskZkE7PpDv/7D6MIaHZwxl7uh/mUuMYqHlAyPZmW
	Mr0RAzD4qY0F4kpb4wcGfFlpMtI4kWS400D4QsuaqxnaXFaUHtNfXWIkGMCqFGP2zbaC4Km4xm1
	0kgYg3RxpWDo/CxYvM4cdxjYc7CCLvA8sVt/i+2e9/zPmLxipIOoa6Y+nqTkcvds03Mp91kqpt/
	M7cY4CT18eF/uaXyY8VTz04kWLk/57YDDFVFbxHymirsWaMOBvECq1/R27txVqHsxBbTWfCvbuo
	jj+3zfzGQspHujh5Z5A9+aJPg0wcWuA0ljTWkRMY+OzmZnwOSM7u4
X-Google-Smtp-Source: AGHT+IEWlQeQ0VwyoZJQCsAYOXJwO9baOmhu42cFSQ1UgcSrJBfdjYfOUif6sKsq0giPXrcyMZFtWA==
X-Received: by 2002:a05:620a:c4c:b0:7c5:4adb:781b with SMTP id af79cd13be357-7d2298613e3mr2168202685a.7.1749477888289;
        Mon, 09 Jun 2025 07:04:48 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3901b12easm233773785a.67.2025.06.09.07.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:04:47 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 34B531200043;
	Mon,  9 Jun 2025 10:04:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 09 Jun 2025 10:04:47 -0400
X-ME-Sender: <xms:_-lGaJ-QaIEu6_uuI81dB9CxRwAFb_8YkUdoUpcsPdwGSeiKe2aHXw>
    <xme:_-lGaNuJ_of3SHaPncYPiyGInUp434NrYhBt8qPnSpk0mWPd7Q8YHgRtUO8-r6XEt
    w54qDbV-pUuML9xFg>
X-ME-Received: <xmr:_-lGaHDMf45Q4NpD1SLwHkuIQRa1Ph9-Zqffzc3dgUOWS6-FDWoSClgsaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudekpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehvihhrvghshhdrkhhumhgrrheslhhinhgrrh
    hordhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehpvghtvghrii
    esihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhef
    pghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoheplhhoshhsihhnsehkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:_-lGaNcXOloXZG0sfM1lXi4T0BZOp4cAG4T9pcHEWVyT4J3KimdDsw>
    <xmx:_-lGaOMUn0QUXQoMe__nd0lInJAZBc067-_OryP_nGS-BZaQc9BhSA>
    <xmx:_-lGaPlyqsBwy23P0i5BzhkpcWiJnSmX0VDBZE3H31uHh8ncRMJv4Q>
    <xmx:_-lGaIs7CIoi5XdUpBpBqmBrM5iyoMAMiRL0x2mAinbcTEgNM2acFg>
    <xmx:_-lGaAsJ1aFytyLcSp1YO9tlcNf2Ls57hFejh3z2ROj_vFgGIatn53DE>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jun 2025 10:04:46 -0400 (EDT)
Date: Mon, 9 Jun 2025 07:04:45 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
Message-ID: <aEbp_X8PpU9XzQU9@Mac.home>
References: <cover.1749463570.git.viresh.kumar@linaro.org>
 <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <20250609111857.ijvagblorxtq7d2n@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609111857.ijvagblorxtq7d2n@vireshk-i7>

On Mon, Jun 09, 2025 at 04:48:57PM +0530, Viresh Kumar wrote:
> On 09-06-25, 16:21, Viresh Kumar wrote:
> > This adds abstraction for representing a CPU identifier.
> > 
> > Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  rust/kernel/cpu.rs | 102 +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> 
> Boqun,
> 
> Should I implement CpuId::current() like this ? Will fold this into
> 1/2, if it looks okay.
> 

Thanks!

I think you can keep this as a separate patch for the ease of review.
And I just realize that we should use raw_smp_processor_id() because
the current API only support an unstable cpuid read. For a stable cpuid
read, we need some lifetime description of the return value to make sure
it doesn't outlive the scope that guarantees the cpuid is stable. Well,
the user can still use the unstable CpuId and ensure the scope provides
the cpuid stability (see comments of smp_processor_id()), it's just
CpuId::current() doesn't need to guarantee that.

> diff --git a/rust/helpers/cpu.c b/rust/helpers/cpu.c
> new file mode 100644
> index 000000000000..61d0387c8cf3
> --- /dev/null
> +++ b/rust/helpers/cpu.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/smp.h>
> +
> +unsigned int rust_helper_smp_processor_id(void)
> +{
> +       return smp_processor_id();
> +}
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 0f1b5d115985..16fa9bca5949 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -13,6 +13,7 @@
>  #include "build_assert.c"
>  #include "build_bug.c"
>  #include "clk.c"
> +#include "cpu.c"
>  #include "cpufreq.c"
>  #include "cpumask.c"
>  #include "cred.c"
> diff --git a/rust/kernel/cpu.rs b/rust/kernel/cpu.rs
> index da53f04da495..b093d22ccbd9 100644
> --- a/rust/kernel/cpu.rs
> +++ b/rust/kernel/cpu.rs
> @@ -94,6 +94,12 @@ pub fn from_u32(id: u32) -> Option<Self> {
>      pub fn as_u32(&self) -> u32 {
>          self.0
>      }
> +
> +    /// Returns the ID of the CPU this code is currently running on.

We need mention that the result is an unstable one, and refer to the
raw_smp_processor_id() in include/linux/smp.h (we probably also want to
fix the typo there, i.e. s/raw_processor_id/raw_smp_processor_id, while
we are at it). Also it's worth mentioning that if the context between
CpuId::current() and use of the return value indeed guarantee cpuid
stability, the users can treat it as a stable one.

Regards,
Boqun

> +    pub fn current() -> Self {
> +        // SAFETY: smp_processor_id() always return valid cpu id.
> +        unsafe { Self::from_u32_unchecked(bindings::smp_processor_id()) }
> +    }
>  }
> 
>  impl From<CpuId> for u32 {
> 
> -- 
> viresh
