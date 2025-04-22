Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496E62853FA;
	Tue, 22 Apr 2025 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331959; cv=none; b=AoZSFj2czS8mNN924VPfbJ+UnbAM1ClVeBW/DIB4aWZ1wYc/ILk7YfCytwVXHHc+2vnezh+3AybE6rOLVanvypuUjVtXf//4rG/de8bzx0QJWDuEm3KalZTFgu1mWHiNMVCIBBVyFCwWziCB2S2IDtVizGcGPFXu39SNMitUBVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331959; c=relaxed/simple;
	bh=tjtbHzwoboY5NTxcDNdJTdRaGicnX4Nne3QqBjODEsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgvUGwjcajjsL3d35Bz0Tk6a/x1dNfiIgyHciUmQfSsYSKpg58WDTzspS+VlQAyQ4Y1Lz9lFH7Pjfc12VxTyotctd4HZOQ/K+p5LCV98d9eX8UNw+KrJCaPNfPYOk9GkIImRF97F42ZJEiwZctVP/lX/MJJ/RAh0eUKTxazWNJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpES/phS; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpES/phS"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8f7019422so51903426d6.1;
        Tue, 22 Apr 2025 07:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745331955; x=1745936755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AA5KErGXnyWxPr67XnMS/Iu/vkfGkM2cePR5H4DX4I=;
        b=FpES/phSttPCum4bfeTXmtVzccO8KM5qy8lXE/SWYERidmD8wJL9Dpg8Smu1jkAH1e
         xwQrOxuYrpyWe5WXwybby5PFrLkufBbcZSKB0K7EKmBtt8V4RpElEHdPPKUGgyeM4spX
         8BtF2aY+/ds+DtU3VnENTx4S1YQ8xIS7YrQpum5MUTf6NmKzqrdN2Ji95MCwJrz3rXZj
         Z8LZtTT4yUH1BIhz2vCxfdGD+xr/R4BJop5MeQiSjK+30ymrAyTwziE1O0hVeIa7B4fY
         4Nf6lQsjDzCQjhk/vMepC+qcaUaupN24qIY4C5SgglMAeBJHb+hVlA9ggw3iQdqKV1lU
         eZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331955; x=1745936755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AA5KErGXnyWxPr67XnMS/Iu/vkfGkM2cePR5H4DX4I=;
        b=FOOG+76HIDTtgWi3nV+UU9nQ42b3grkoLl4z5kAFoyywYqszgkelh0J7RZYyP+JSz5
         rnIH0GF1fUn3MRLavMlHZvGDasNIEqsE+AgEdxuFCB2XhAPQvUBy5yQ3y6dwZeAk9Z51
         CQpCyoTRNn2i+iQKdlaNffzR4XqoYaslh1i46AGVXXbURrMKvXlxhga7y1fuy/KVcvQK
         Xmi1wD9rbph7MHBh7LIsH9EAqp9jiwPXO2yp38qsjqP9m+Ky0xv5l5N5eDLW67+SZ2JL
         E9MxjeZxQhl9y738oUyDid2eoLSY0lsplA5pd9dMcB9+02hWvFRNu9wtThZQs3gM9mZu
         ffyw==
X-Forwarded-Encrypted: i=1; AJvYcCWzv83q896f2g+LwXlxAiaz4ORKDbNejzJ4/PXuLRkhWPt4Uj0UgW4NhRVSGbCdBchVjph1JWiw+KObcaz/4cA=@vger.kernel.org, AJvYcCXRl2wL/W9+8YOZ4JECDsTpUzV23SjxvfMf9UKswCxVggEuX9cvgBpxm/ff0GmB6+0I8kXbBco5pf/p2OA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJOjj6d9JTrHRqVFb2yUtz0DDB7RJcBFh1QInr7XvHMbqDpBk
	RkSd4qg6eQByMlycaervxBbkZcuUwryxnt4KLcAme3avSvgegrN7
X-Gm-Gg: ASbGnctGoNWrTLn5xObrtjmUnSWB6s0JAdQTIH4ajv8UnNHwvKTyouNXJOCBv9K1fyj
	NX0VGD21QVWgpWmyQdpcHbZFbAoIcIAl3dtk1fFNZUh+pLt30F9xedx/kfedEcaHvrxLrptv7BD
	PuENx8iLTozxCsrqQzvM83TKC0tpjPNgJebolPJ8ZMXKV2/YUfSGz4jrj4kq3hGUe4hi0Ei/qOv
	2nh0AB0r/K2zL4H2Kv8b0koc9U13r/jEnv7ghEHH2/62h8no8isZhGbf9OT5vRXyYC2dVQwnp/G
	GfM9d5wu9ioKmgyRE7YS9gDf3E+QcT8qOYJeM78g1vdPTvMLH4fnwJtpaqvDECd24MA+eW65uMB
	L9GmHk6jvPwL3yVE+P8jMATGVxotJHPM=
X-Google-Smtp-Source: AGHT+IEAUoX6oEASeQSpF+Thmrw4GKI/Ho/FyOqrb7X2iQhszzbErfs9CuDJ/hJKgwKf7hqNNI5v9w==
X-Received: by 2002:a05:6214:23c6:b0:6ea:d393:962f with SMTP id 6a1803df08f44-6f2c453aa96mr257641586d6.16.1745331954714;
        Tue, 22 Apr 2025 07:25:54 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0cb46sm58736436d6.27.2025.04.22.07.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:25:54 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id A246A120006A;
	Tue, 22 Apr 2025 10:25:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 22 Apr 2025 10:25:53 -0400
X-ME-Sender: <xms:8aYHaDlej0Uw2eqzN0UnK9fSFXHdKDzWG6ikLl84v_YyTrhLuvS1Qg>
    <xme:8aYHaG1wNP-lCbgArHwaIJ3UVq-Kp9Q3yyA0s9ieXjVaj_-hjz8-NF7tJ962epzhK
    xqPRsPatrUIztMQAg>
X-ME-Received: <xmr:8aYHaJokMuilYxBdqaq6DWYchKyJPv3lZ9RZCJ4ebxOGj5JNEVk8hT9O>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeetgedujeejudehveekteetfeefhfffheet
    gfeugfetffekieetiedtudehgfffgfenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqd
    eiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhl
    rdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehkuhhnfihurdgthhgrnheslhhinhhugidruggvvhdp
    rhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgi
    drghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihg
    uhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrd
    gtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhr
    tghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhs
    sehumhhitghhrdgvughu
X-ME-Proxy: <xmx:8aYHaLldF3ltUZZuTxR_22T7pdycDxzWHF2DyL__IH7yq4olLVqXzQ>
    <xmx:8aYHaB3i9p1EQLPO0qRRiIdvMGK1UrrQkyzCEctUmhtqJ6T9U54pNQ>
    <xmx:8aYHaKvw5ipu8GAVskGnKrUYguurDO4tHDcE4N32Ffm6rCoGUuYm3Q>
    <xmx:8aYHaFWsz1oM7kEGnPmBGHV7UyzVI0bd-HbYlk_9aJuXu1Z56Fd4Kw>
    <xmx:8aYHaA2LTdyXIWYK7a_1NrGixuj-p2RO3VV37DEU2QGnE_x-kBXuxS8a>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Apr 2025 10:25:53 -0400 (EDT)
Date: Tue, 22 Apr 2025 07:25:52 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>,
	Grace Deng <Grace.Deng006@gmail.com>
Subject: Re: [PATCH v2] rust: sync: optimize rust symbol generation for
 CondVar
Message-ID: <aAem8H4WhLBTf3xv@Mac.home>
References: <20250324061835.1693125-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324061835.1693125-1-kunwu.chan@linux.dev>

On Mon, Mar 24, 2025 at 02:18:34PM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
> 
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=arm64, the following symbols are generated:
> 
> $nm vmlinux | grep ' _R'.*CondVar | rustfilt
> ... T <kernel::sync::condvar::CondVar>::notify_all
> ... T <kernel::sync::condvar::CondVar>::notify_one
> ... T <kernel::sync::condvar::CondVar>::notify_sync
> ... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::poll::PollCondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::poll::PollCondVar as core::ops::drop::Drop>::drop
> 
> These notify_* symbols are trivial wrappers around the C functions
> __wake_up and __wake_up_sync. It doesn't make sense to go through
> a trivial wrapper for these functions, so mark them inline.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 

I'm taking this via tip with the version as it is (i.e. no #[inline] for
notify()), but will reorder the tags. Thanks!

Regards,
Boqun

> ---
> Changes in v2:
> - Remove '#[inline]' for notify()
> - Reword commit msg
> - v1 link: https://lore.kernel.org/rust-for-linux/01c67d96-6477-4851-81ae-0cbee3b9e893@linux.dev
> ---
>  rust/kernel/sync/condvar.rs | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
> index caebf03f553b..c6ec64295c9f 100644
> --- a/rust/kernel/sync/condvar.rs
> +++ b/rust/kernel/sync/condvar.rs
> @@ -216,6 +216,7 @@ fn notify(&self, count: c_int) {
>      /// This method behaves like `notify_one`, except that it hints to the scheduler that the
>      /// current thread is about to go to sleep, so it should schedule the target thread on the same
>      /// CPU.
> +    #[inline]
>      pub fn notify_sync(&self) {
>          // SAFETY: `wait_queue_head` points to valid memory.
>          unsafe { bindings::__wake_up_sync(self.wait_queue_head.get(), TASK_NORMAL) };
> @@ -225,6 +226,7 @@ pub fn notify_sync(&self) {
>      ///
>      /// This is not 'sticky' in the sense that if no thread is waiting, the notification is lost
>      /// completely (as opposed to automatically waking up the next waiter).
> +    #[inline]
>      pub fn notify_one(&self) {
>          self.notify(1);
>      }
> @@ -233,6 +235,7 @@ pub fn notify_one(&self) {
>      ///
>      /// This is not 'sticky' in the sense that if no thread is waiting, the notification is lost
>      /// completely (as opposed to automatically waking up the next waiter).
> +    #[inline]
>      pub fn notify_all(&self) {
>          self.notify(0);
>      }
> -- 
> 2.43.0
> 
> 
