Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A522A12E5D;
	Fri, 27 Jun 2025 17:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751046237; cv=none; b=AqGuhjcw5gBdohSroof00itLa94oytp4LMOkW+1oX/oKn58Zz3PF/RIB2VB1niwnBcRtHTW2UwloN8voC84D6M0tbMxhQadhL5rVMDp6/yQdSbNAzIAYYhWx6HwyInbSKRQ39CpJuFSzUgs2pCGHPmcm78CWu0aqOaNXKnbUm54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751046237; c=relaxed/simple;
	bh=DLd+NYJXhsRTa9byMUB/sdnFfzkTduh0Slzg7t2UTOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZJUw1Pt7A+YewnlVvyMIgxCjyWg/wDUYUXdf0Kbye1enUsmtOo0mKWsyOxx462OF9Wv0p7tQiY191YH1VEXogKKaEoxTz6qqwKohhWYYWyCU5fz8v2/HZbi//5GViS0LuzX7NUxY9os2omjUvykDf+6LYJ7UJ1qY9ilFKDIZMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8Brrl79; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8Brrl79"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d09f11657cso238807085a.0;
        Fri, 27 Jun 2025 10:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751046234; x=1751651034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pIMARoo/e8gDr5IpNjKDIF9ZEmdVX/FzS9d4HB8aNwE=;
        b=h8Brrl796k35pGhkJYPD9fDZZ+449Vu0FUDxOR5Bl+TCWa1G2TFLRQazizHjD/Arcc
         oO/d+PlKlpJybgC0eZRPNyOuPQ2/X8KfzOftSxuvLCcse+IzJZYAAepxJhUvj01Sbq8a
         RCkRxttktMw2/0axaoM9i/UB/Pqajlyx3VziSozKUaJYCOd0T1aQI/UDc1Zxyq48TJ0J
         PCScfWUwny90/q/pNWZFsRwzc6Y6zwbq8BsKGWdBAWNcKWqkZgKGZ7sBuuPao0sNFb+O
         VbR20Thx72tANotLwZKsKK07Y68YmGCXu+TvVXoDBG4fjwlOT7LE9b81Va4sEXqpyrLt
         CFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751046234; x=1751651034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pIMARoo/e8gDr5IpNjKDIF9ZEmdVX/FzS9d4HB8aNwE=;
        b=qTK2H3lN+zNoKn90qRpm17VWFlrpFD27Vz8Y9oUPJlQREzNl08+hGsh3cKhsOb47Q6
         wprb8tjOer7WH4DiaiPSImMCUkk5ZLmFW44qUHVXpTlE4/DIVuHzdMjC/CTrCkOi7Svx
         8urncYEWfCyFVieQf/Arz6wTnH9GtxRVQDBFwoBqBUruAVOg0E0SkgmQWHjnOwpy5al3
         qhql5lqEr31myNbHiCYJNcrbH+U6pchLS9Ss6c4M9nMZtPjAwXpB3XhIPLhCBxNscsG4
         q+Kb3+9H64RBf8j4E8MPazgnRpFmjzGDMsuXNGt54KDn5yj4PM1DwKoVdoF0C7drDCBf
         SyrA==
X-Forwarded-Encrypted: i=1; AJvYcCUpsEMqCYsNQQOPeEM5mCUwW22LXOjYX11LiDA7L92rLk4fN1yo3C1zs4jKBvC6SfpPwx68riW3pTqS8lc=@vger.kernel.org, AJvYcCXjG9qzOgEuCZ8d80a5dbcA0pXQuq5qE8bU/Tdy2Hu3azud0PMXwKnDd4QC9EX9A3TDoFNvTExVEKOhx5gZn3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRzc3WrCEEoWxuBIn8LzlhI2GYC0ZS3YiAfjx9iqcSWG8ru4ep
	BkefkonuHlzXeaeRGouDZ8yOPbkS1JgG7m4rzfrVfI7zVnjMjO6RwVTV4yZI2A==
X-Gm-Gg: ASbGnctGJS+xWX//GGMq3GfX0D4cPeNv8namacNyt+rmLPfULG0X7xljLmRVxRvM9ni
	SSJ3iRh6Y6jd6UD3cfOekJx0dWaT4b87Vui0MLVG1EVtpHjOqafMhCY9KFHkORrrzRPxupiOSgO
	2uijvL5775kxNs8g9IPW/l/sXrt3EnFpikB042+bela7GdtgkqY9uvvwZbniJdqrnAJLR/T21bQ
	5BnzDZw9FlOfNOc1tes+51skNGPnDksYLHwd73696mwApQ+B02Ar2v9h4llLwvYNjCl6GXNHGng
	KgIN3WfFVG52k5EOcWEJ8/jc55DhxZfmMhvDKOQKmPI3W2oNtqhqJGF+ANnEorlaxsBp2p97dUi
	XwXbVuRIWVXqn6XrOmcp/jtnJFu3W4d5IWERCkuTcLH29X5tj0qgV3i/iPAlC5b8=
X-Google-Smtp-Source: AGHT+IHU4lL9QqCgZce2eK+3XmqEloZzy2313QZaloOJ3U1KXpcqBebVgVSvHMcvCKz0QiREvc39yw==
X-Received: by 2002:a05:620a:278c:b0:7d4:3d6d:b8bd with SMTP id af79cd13be357-7d443989372mr570237685a.45.1751046234368;
        Fri, 27 Jun 2025 10:43:54 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4431391d1sm170844785a.6.2025.06.27.10.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 10:43:53 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5FCA7F40066;
	Fri, 27 Jun 2025 13:43:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 27 Jun 2025 13:43:53 -0400
X-ME-Sender: <xms:WdheaEDuCo3u4IpxFlp3P7eMEaWHXA3z3Uv5G1E1L23y35yHgzs4Dg>
    <xme:WdheaGgNq0poN8ykspIl48iD_ze28p_xYJEFtKGAo3cWuTFdu0D-w8JgAccQmV4Ou
    N4lJ8h6isyVLbYP2w>
X-ME-Received: <xmr:WdheaHl9IPyvye_WfEM6b-Rg8HVeK4w4oaHexwE990FbSMj1jOghZD-Pc0U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdehtden
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhs
    ohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnh
    hgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedu
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhooh
    hglhgvrdgtohhmpdhrtghpthhtohepthhjsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnoh
    hrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhirghnghhshhgrnhhlrghisehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpth
    htohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohep
    rgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtmhhgrhhosh
    hssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:WdheaKyO_2jLTuj7pZp-hMHkH2vXbK29ANt0XJbr51mQrJBR4wLbSA>
    <xmx:WdheaJQL0jlHE36tL1vhGU3bTlxaGbZnV1QxyTXn5Ei1AASytwtmqw>
    <xmx:WdheaFaCLNrzGN9dOK2-93-I3rCuwB7CeI-yu5qpCCG-RXVl5WlUOQ>
    <xmx:WdheaCRU8g_tYtZMzLAJcLF35BOmxu_WM9iho196zj-upBZPjROAkA>
    <xmx:WdheaDD4plMaS1N82u_Hgg7IAuw0u80MecbCFpSGGGssLB1JcaDyfE2k>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jun 2025 13:43:52 -0400 (EDT)
Date: Fri, 27 Jun 2025 10:43:52 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Subject: Re: [PATCH v2] workqueue: rust: add delayed work items
Message-ID: <aF7YWE4bz98Gqh1y@tardis.local>
References: <20250627-workqueue-delay-v2-1-84b046fdb4fc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-workqueue-delay-v2-1-84b046fdb4fc@google.com>

On Fri, Jun 27, 2025 at 09:38:42AM +0000, Alice Ryhl wrote:
[...]
> +    /// Get a pointer to the inner `delayed_work`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The provided pointer must not be dangling and must be properly aligned. (But the memory
> +    /// need not be initialized.)
> +    #[inline]
> +    pub unsafe fn raw_as_work(ptr: *const Self) -> *mut Work<T, ID> {
> +        // SAFETY: The caller promises that the pointer is aligned and not dangling.
> +        let dw: *mut bindings::delayed_work =
> +            unsafe { Opaque::raw_get(core::ptr::addr_of!((*ptr).dwork)) };

This would conflict with your Opaque::cast_into() series ;-) So I
suggest that we rebase this one onto:

	https://lore.kernel.org/rust-for-linux/20250624-opaque-from-raw-v2-0-e4da40bdc59c@google.com/

and send them together. But it's up to you and maintainers, and even we
do that let's wait for some reviews on this patch to save extra
versions.

I'm going to review it, just figure this better be pointed out.

Btw, as a review comment, I believe we are in favor of `&raw mut` now,
so this should be:


    unsafe { Opaque::cast_from(&raw const (*ptr).dwork) };

> +        // SAFETY: The caller promises that the pointer is aligned and not dangling.
> +        let wrk: *mut bindings::work_struct = unsafe { core::ptr::addr_of_mut!((*dw).work) };

Ditto.

Regards,
Boqun

> +        // CAST: Work and work_struct have compatible layouts.
> +        wrk.cast()
> +    }
> +}
[...]
