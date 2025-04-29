Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD03253B5F;
	Tue, 29 Apr 2025 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951193; cv=none; b=sZKHTg5MkJUCPfkcVb+tPUgMDkFrvL4xP3DxBoe8GxWcePLioNLVbMWcimxychnl4YYlRf6CjJliE+Ka6YK7crBsKwRQaqo5Knh6pnwTgIN3d3y1jUDEd66yYK1ECNloIu/N7BFCcI5TQrEjbft0W3VLuzeQBSX0aZIhcGyRLJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951193; c=relaxed/simple;
	bh=Qt0O5aXD9M4vN/ee2pglHz9B5Ra1h2NHSV/CGGJ9Vg4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HaoX5HtPLffwpqCSXtRUvlvOhKSqWJkFPWakda0xoTvLrVDSEmEgu0NXoEmaP47GtyTT4KGwhlnfZ16DM4IZ3HumhJkTfANqELWOxY1NfR39vXQcsZZXUM/uC/0GTl+/bOUclPsOqfEA6kvy/nMYyV4UVGVcHNIJLJDULinyODM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvNPXjMa; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvNPXjMa"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so95602926d6.2;
        Tue, 29 Apr 2025 11:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745951190; x=1746555990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WoU0GW4y61Gc49/8+e+Q1KRDruLEK6VrGCzBGIpsD8=;
        b=DvNPXjMaDezswtfoVZzOv3KW6fCmoslVDe49giBrTItQvHXesy0GsW6dWQqFsEI214
         KZ62E2dch7onei3wD8M4jVC/clALc9lwsxVjbEmrhDzBPvn50hMbLoS1HdGZiw0/Q4BI
         yV7fLTrR9OW9l02YhH5quxCf1I5m52TT0zPfqTIv+gvyDXsf5Q3hGTM19Q1lBJPrBaZe
         RaPfw6shhCQU5/Lid9YrW/Moln+kM7syYlm4sVNYPIFrY+ZJdz1uNa+7g0h0zELgVbrD
         2V3Dcwa83SnOEEgXpo5gdnKI7O33AjACybX32T5b97jrdBM6T2kMUvO1yDA6rIVG5RIK
         W5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745951190; x=1746555990;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WoU0GW4y61Gc49/8+e+Q1KRDruLEK6VrGCzBGIpsD8=;
        b=Qly7yG1m+5MTiXf/WCuNiiEvUfNyjUm7tadr5Nbu/PY14iYNyhCFWaZuhk+WLbp/ME
         z580NAqz+Wc5Y/TpwKcviFqd48c/a6qRMEYwyPtygrU+hYktEhJvuGC4AXD+6O2U0cJW
         aSRkccnTuDXgMAUkxCLP3CIuwtwfl8M0zhTtPBgw4TFFqEwvLZt/uU6Fb+2F+D3bqmhm
         b2bu+XEmRpc12ineZtoV5PtfcEPv5loEtNRect+y5Km3nmNESZYfCbL5vQ8yTLMbyFux
         Ql/dMAKX7+nGCbPaQYOuWhts28DG6JLKYLv52vm17j+HKKoOFsK6mktRMef8V2iTH3Ss
         5s1g==
X-Forwarded-Encrypted: i=1; AJvYcCUectOED4kM88YhLX0JxluahS5upo6vmkYAPDejnrg5stFZ9A6+phIjxhHM/xed1r/SGaTD07TOoeZ8ht8=@vger.kernel.org, AJvYcCVqUA5ecnJ/KqWsGVa7bB7rD//gI0VTAkNdyxyOp6bfhnULO+Zyap0CXIXjM00s4YWft4VlC0uz+CFzf8V+C+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNVxplb8ll8xKnclBNlkjzC3cn82KKeld8rS+tzlGQkX1YUD89
	mtYmcJbRgSAJrsnpZ7JXcTaN0wjZRpE1oqC41m+zF+G5PAVUd1n2H4vQlA==
X-Gm-Gg: ASbGncueC6yk1gByK53fTKnG2HPUhdmKAbP6gtwN26Rh18K3vtWMNiGF/mQUUFZ+GR4
	7jmaTzAbX4Zp0SrkAF6HjZyeo1XNlm8LgS3CNUmd+mp9aSamnSjuSSj+MVWEx5UPFOGU7NmYzqS
	29q/uys6UoJbM5DETFiQryUqd22w9HdTYa5LqZvuLr5SZH3kKlQCk7nAPSy2jiBAiMOg8zNsl6D
	Q1CDOAbQ7ZLwwkYLeEQjlcGJeR8sk4FXQxCNcYr0A4YtIyYDmmI5Utp3tagg0YEaNdwf1Q0ILtZ
	TIziEQBbEG0hloxkL9SvPZaawv1hdBvc7CAvO6vPoqn6j2xs/TCJSLo1Qw6YFOqFBaUEV415Bf6
	0BIhSrWvr7Td7eRUO3VLgXYF7Lkaqdqg=
X-Google-Smtp-Source: AGHT+IGcFK5n6H/TczUbQHoWyJaQHLs7ueOQSWswuT8trnaUPPdeISMu+angHYf5m8qkMKgKWape+w==
X-Received: by 2002:ad4:5dcd:0:b0:6f4:c84d:d1bd with SMTP id 6a1803df08f44-6f4fce573b7mr6710496d6.6.1745951190214;
        Tue, 29 Apr 2025 11:26:30 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9efdaa41sm83040061cf.19.2025.04.29.11.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:26:29 -0700 (PDT)
Message-ID: <681119d5.c80a0220.198533.556d@mx.google.com>
X-Google-Original-Message-ID: <aBEZ0zkDMO8QIVn1@winterfell.>
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 45D7B120006A;
	Tue, 29 Apr 2025 14:26:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 29 Apr 2025 14:26:29 -0400
X-ME-Sender: <xms:1RkRaOEccOkT6hQg5YpFv1-3VF6fo_7saXZieOuKtFM27WkbbyAmHA>
    <xme:1RkRaPWNECQ8su0LMIXBgMfwxPZTOMPN2mXKyHMcI_oc6XM72mJ--snhS0cvQP4D3
    YmSEBv-kK8d5S5JLg>
X-ME-Received: <xmr:1RkRaILn0oWcRq6SWFPcuqTYEflNqieOwaxhBhoz6NVrLG2jXflWX-OpjsI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieegheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedvgfdtueekvdekieetieetjeeihedv
    teehuddujedvkedtkeefgedvvdehtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhu
    nhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqdduje
    ejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdr
    nhgrmhgvpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhjvggu
    rgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunh
    gurghtihhonhdrohhrghdprhgtphhtthhopehvihhrohesiigvnhhivhdrlhhinhhugidr
    ohhrghdruhhkpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhioh
    hnrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthht
    ohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsg
    gvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgu
    sghorhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:1RkRaIHKhuN-DM4trB7wOnAFk_4WsVRDVNNEwKNyslKndkH2mcUA4w>
    <xmx:1RkRaEXjg8N8_LLpd5Ej18DNeVvzC3Wpe4ZwpGrWIPyA2nwOtJoH6Q>
    <xmx:1RkRaLNe2pd5pKHz_7_Eb2dlWWN4zgrifhKZdN6_hP_5RxLfAW6dqA>
    <xmx:1RkRaL21sNIieS1qjKz3Oh2W_76iftpJyII5VUzzCvMBOcY7gorBfg>
    <xmx:1RkRaFX8cfH4EgI_PPRxu1VAG0JsjpdKfrEmGaxzAuNPQJSC2pwm9pDO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Apr 2025 14:26:28 -0400 (EDT)
Date: Tue, 29 Apr 2025 11:26:27 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] uaccess: rust: add
 UserSliceReader::strcpy_into_buf
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com>
 <68111422.050a0220.e6713.25af@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68111422.050a0220.e6713.25af@mx.google.com>

On Tue, Apr 29, 2025 at 11:02:07AM -0700, Boqun Feng wrote:
> On Tue, Apr 29, 2025 at 09:02:23AM +0000, Alice Ryhl wrote:
> > This patch adds a more convenient method for reading C strings from
> > userspace. Logic is added to NUL-terminate the buffer when necessary so
> > that a &CStr can be returned.
> > 
> > Note that we treat attempts to read past `self.length` as a fault, so
> > this returns EFAULT if that limit is exceeded before `buf.len()` is
> > reached.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/uaccess.rs | 35 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> > 
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> > index acb703f074a30e60d42a222dd26aed80d8bdb76a..7cec1b62bd8b816f523c8be12cb29905740789fc 100644
> > --- a/rust/kernel/uaccess.rs
> > +++ b/rust/kernel/uaccess.rs
> > @@ -293,6 +293,41 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> R
> >          unsafe { buf.set_len(buf.len() + len) };
> >          Ok(())
> >      }
> > +
> > +    /// Read a NUL-terminated string from userspace and append it to `dst`.
> 
> s/`dst`/`buf`
> 
> ?
> 
> > +    ///
> > +    /// Fails with [`EFAULT`] if the read happens on a bad address.
> > +    pub fn strcpy_into_buf<'buf>(&mut self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
> > +        if buf.is_empty() {
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        // SAFETY: The types are compatible and `strncpy_from_user` doesn't write uninitialized
> > +        // bytes to `buf`.
> > +        let mut dst = unsafe { &mut *(buf as *mut [u8] as *mut [MaybeUninit<u8>]) };
> 
> maybe:
> 
> 	let mut dst = unsafe { &mut *(ptr::from_mut(buf).cast() };
> 
> ? To align with:
> 
> 	https://lore.kernel.org/rust-for-linux/20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com/	
> 
> > +
> > +        // We never read more than `self.length` bytes.
> > +        if dst.len() > self.length {
> > +            dst = &mut dst[..self.length];
> > +        }
> > +
> > +        let mut len = raw_strncpy_from_user(self.ptr, dst)?;
> > +        if len < dst.len() {
> > +            // Add one to include the NUL-terminator.
> > +            len += 1;
> > +        } else if len < buf.len() {
> > +            // We hit the `self.length` limit before `buf.len()`.
> > +            return Err(EFAULT);
> > +        } else {
> > +            // SAFETY: Due to the check at the beginning, the buffer is not empty.
> > +            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
> > +        }
> > +        self.skip(len)?;
> > +
> 
> So if the UserSlice content is "abcdefg" (not tailing NUL), and the buf
> size is 4, after a strcpy_into_buf(), the return would be a CStr "abc"
> (with a tailing NUL), and the UserSlice would move 4 bytes and become
> "edg" (not tailing NUL), is this a desired behavior?
> 
> Alternatively, we can make `dst` always 1 byte less then `buf`, so that

Hmm.. this part is not correct, what we should do is:

        // We never read more than `self.length` bytes.
        if dst.len() > self.length {
            dst = &mut dst[..self.length];
        }

        let mut len = raw_strncpy_from_user(self.ptr, dst)?;
        if len < dst.len() {
            // Add one to include the NUL-terminator.
            len += 1;
	    self.skip(len)?;
        } else if len < buf.len() {
            // We hit the `self.length` limit before `buf.len()`.
            return Err(EFAULT);
        } else {
            // SAFETY: Due to the check at the beginning, the buffer is not empty.
            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };

	    // if any copy really happened, and we don't find a NUL char
	    // until the end of the buf/dst, we will add a NUL char as
	    // above, but in this case, we need to not skip the last
	    // char in `self` (because it's overwritten in the returning
	    // string by a NUL char).
	    if dst.len() != 0 { 
	        self.skip(len - 1)?;
	    }
        }

Of course, the code can be re-organized, but this is the idea.

Regards,
Boqun

> in the above case, UserSlice will only move 3 bytes and become "defg",
> and the return CStr is still "abc" (with a tailing NUL).
> 
> The current behavior makes me feel like we can lose some information,
> for example, if the user-kernel protocol is that "a userslice that
> contains 4 64-byte strings which don't have a tailing NUL", we cannot do
> 4 strcpy_into_buf() to get them, right? But of course, the scenario is
> completely made up, just food for thoughts.
> 
> Regards,
> Boqun
> 
> > +        // SAFETY: `raw_strncpy_from_user` guarantees that this range of bytes represents a
> > +        // NUL-terminated string with the only NUL byte being at the end.
> > +        Ok(unsafe { CStr::from_bytes_with_nul_unchecked(&buf[..len]) })
> > +    }
> >  }
> >  
> >  /// A writer for [`UserSlice`].
> > 
> > -- 
> > 2.49.0.901.g37484f566f-goog
> > 
