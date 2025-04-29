Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597D724E00F;
	Tue, 29 Apr 2025 18:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745949734; cv=none; b=lB5Hh6Hfob1ISMV3ZHFSeuF76UR8bCoOFShCxdkvjwVBgJ4kO41T0dL9wITviapMZ6PFzqlHRBeqgQGOfp5YIt4s5oQHmtHvEKPoM8FDDTP2FUczeJDUzL8TxavHC5cPAT1gSgLFJj4/o7sRj55nYun6vkNbWqiZu2939Buta/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745949734; c=relaxed/simple;
	bh=7EoE+5qHZHjuIU2WgkibPv8h8qe6HPfLc6xThsuQ66c=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBOlQTOLrJk6FFD9y6EtRaWgxgNKd2TdPgDafoBc7TE0kcm8MGFfcq8RHm31MXkll/oqK0SmKMyltJka8a1g7ilft77T2se1GOTAGcOOPl+jgJUwPGPzDr5lp5a0zGZjCnGqp5EKymBvzdPI8D3CiPDSfapuakxTxvZrYk/RL38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SdE28doU; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SdE28doU"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c96759d9dfso666501285a.3;
        Tue, 29 Apr 2025 11:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745949731; x=1746554531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQ2m2Mpo2Qbg7aupiiU5r+J7EKIYM9l5AFA14fJeIrs=;
        b=SdE28doUAgLrhSaqPUiIPI8K9dRgMR/grt8oONqxVCvYZUFue1vo4v3wbs36/DdizE
         EJ1/HiOOhwtZW/YK4saE8ySZGM0Z5b6CLQoiCbTUwGFyIECCo9VtFgdRXMlpWCrFLoeW
         CdzUJZRqMlLj6jZadPMM3ZjFT4+jZCgUQ7m0NZ07gT5N9PvzhbjRxPb/tDU7DtRumn2y
         Km2LhVpB7SwVWigOr4oERxLYzdkDKUxK8SwKF/uSWIQ1HKjEwl1wZHVZScvP3Ojxsx+D
         bS3FWA3gHzeo25Qs8q0eRDsOPAeViJqvpLFwaRHcxs2jYAs1e9BqlyKleiz/0WER6pzP
         s9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949731; x=1746554531;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQ2m2Mpo2Qbg7aupiiU5r+J7EKIYM9l5AFA14fJeIrs=;
        b=FooBwZzmpGETl9TR/Z8a7Vn5mFTSquyiOt6Gei5oQ4I8jM55L6eNF4btUqBzm8VGRd
         tB/JKb7iSQBHKYtrkOwEaj1kP3H0UPHvQconsXjgvCdvC5z80HN0LgM+TtKvY9WgRGTb
         2X2bhurf2yTs9fzAQxISP6fQY0E9hNXYtXS4jifaNAYhCBd7zuJmDgyvlJrT5juwVhpX
         ZTTXIIV0Fs5Jo/d4MMshkp7TmCntYnoS7m7VIE/dktXhMfwb9lJWQrISmOZ/T8VoSmuV
         GGpqqaycY1+XDGtIiOBY7oMIsvyllSgQJdn/i5gfkWBsSaNu8uxdJkgXz9aoXvzf5SVE
         gLjg==
X-Forwarded-Encrypted: i=1; AJvYcCXMBBtHmJiMWqnxSMS6EPLi6utIiDSly/O1fRidzpM5N5OPHNlWBkcTJdMNbzEJ9fgxw+0iyA4VsqO0qiMi1l4=@vger.kernel.org, AJvYcCXXDz2L6D78dBQWHY+NPzVZzduYYYAYnB0s4ibiZer6yCR54es2oUcYwk7KRf936s+cagzXTEy7wxxdHQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmN2oiwnT6bGQt+bVNX+dbF5oVu1ctArFFadQLQf5su2v2hyPh
	ocrfDOomlRP/MifMzdRzd8n+argSXX5ehlUGxl0YIfuk/qP3x1hI8+X0xA==
X-Gm-Gg: ASbGncvvClbkuTnc1mUdCyOQPxkHheHRPrOLoO3R3Z7bJUgkW2mc/N+V5jDk4H8j5BS
	sP/Tx7/OzWFXI4VTZPiPZ+Joyocrr3Jb6UUSTopTEjJEBHoehFRub0/tYQldbG58+6amhjdTp1E
	fzl0RMKIF/0Fh8I3m1h9CcZNsk1ogBjXk4mORHM64dt7srcTt1YlJgt8MWJG7z001HfgICynbaG
	ijD1oCnRBVVxXw77X9xyc+RyvORCdodSuiit+RkTMbLKPivQPy2zAyqFEHQrSiVyHS4lK8NnBOi
	2o8A4b35nt4t3rqOM6KGDzyJGlv1AJMzHmjm2qJbw98SklpijeungcUVkTaLvnxM+VEN59Y9RAG
	dNEmS36PBIXBsWxVioFDgtgyI7pu0uUU=
X-Google-Smtp-Source: AGHT+IETZmS/F3AI4hdVKhB0lODqFFWH7teyi9Rm99K3XMGj5EUHbEdUzD13Iw2/JGNl35toen2T8w==
X-Received: by 2002:a05:620a:371d:b0:7c5:658a:e584 with SMTP id af79cd13be357-7cac768aeb7mr3619185a.53.1745949730997;
        Tue, 29 Apr 2025 11:02:10 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958c94943sm765276285a.4.2025.04.29.11.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:02:10 -0700 (PDT)
Message-ID: <68111422.050a0220.e6713.25af@mx.google.com>
X-Google-Original-Message-ID: <aBEUH-6b_ZBzHOxl@winterfell.>
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3E24C120006A;
	Tue, 29 Apr 2025 14:02:10 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 29 Apr 2025 14:02:10 -0400
X-ME-Sender: <xms:IhQRaNbKJIpz_Fq28TttvExphRL2QbfHBV6hTZRYsBkCEHA4n0lKoA>
    <xme:IhQRaEa9JLm5Bk1bTLQYEqkI2NTIHFc0JHp4d0s92lvn_Ioiuhje3xyQ_X1HGnt9u
    dym-X-EH4onucfUHA>
X-ME-Received: <xmr:IhQRaP_Smf6XpIU_PRMnzVEPEWDRAl4RHZVVBbu4MOZIkyNaZVornAapdfY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeggeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:IhQRaLpcB4UKDJFVl64QOUnr6X11qMQf1xTcy4dgZ-AfFARSEuXfdA>
    <xmx:IhQRaIpbLUV-mxH4bxHkjiyRsnKdiNMLfMHCbzMUKbuAuure2wDjwQ>
    <xmx:IhQRaBSSrMQCMrml56ujLqqyckDExYoswaEsgyMen-8cFDKzwYj2nw>
    <xmx:IhQRaAq8xT3O6UyEw0lsR9QjSveMNVLnyuH_p0bfPPA2l27vSqPjIw>
    <xmx:IhQRaB7ZCgIKNZ_7FaQFSdGUICocF-mbYZ9dJ9eD8ROMNwIxZ1Y5-xVY>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Apr 2025 14:02:09 -0400 (EDT)
Date: Tue, 29 Apr 2025 11:02:07 -0700
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
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com>

On Tue, Apr 29, 2025 at 09:02:23AM +0000, Alice Ryhl wrote:
> This patch adds a more convenient method for reading C strings from
> userspace. Logic is added to NUL-terminate the buffer when necessary so
> that a &CStr can be returned.
> 
> Note that we treat attempts to read past `self.length` as a fault, so
> this returns EFAULT if that limit is exceeded before `buf.len()` is
> reached.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/uaccess.rs | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index acb703f074a30e60d42a222dd26aed80d8bdb76a..7cec1b62bd8b816f523c8be12cb29905740789fc 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -293,6 +293,41 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> R
>          unsafe { buf.set_len(buf.len() + len) };
>          Ok(())
>      }
> +
> +    /// Read a NUL-terminated string from userspace and append it to `dst`.

s/`dst`/`buf`

?

> +    ///
> +    /// Fails with [`EFAULT`] if the read happens on a bad address.
> +    pub fn strcpy_into_buf<'buf>(&mut self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
> +        if buf.is_empty() {
> +            return Err(EINVAL);
> +        }
> +
> +        // SAFETY: The types are compatible and `strncpy_from_user` doesn't write uninitialized
> +        // bytes to `buf`.
> +        let mut dst = unsafe { &mut *(buf as *mut [u8] as *mut [MaybeUninit<u8>]) };

maybe:

	let mut dst = unsafe { &mut *(ptr::from_mut(buf).cast() };

? To align with:

	https://lore.kernel.org/rust-for-linux/20250418-ptr-as-ptr-v10-0-3d63d27907aa@gmail.com/	

> +
> +        // We never read more than `self.length` bytes.
> +        if dst.len() > self.length {
> +            dst = &mut dst[..self.length];
> +        }
> +
> +        let mut len = raw_strncpy_from_user(self.ptr, dst)?;
> +        if len < dst.len() {
> +            // Add one to include the NUL-terminator.
> +            len += 1;
> +        } else if len < buf.len() {
> +            // We hit the `self.length` limit before `buf.len()`.
> +            return Err(EFAULT);
> +        } else {
> +            // SAFETY: Due to the check at the beginning, the buffer is not empty.
> +            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
> +        }
> +        self.skip(len)?;
> +

So if the UserSlice content is "abcdefg" (not tailing NUL), and the buf
size is 4, after a strcpy_into_buf(), the return would be a CStr "abc"
(with a tailing NUL), and the UserSlice would move 4 bytes and become
"edg" (not tailing NUL), is this a desired behavior?

Alternatively, we can make `dst` always 1 byte less then `buf`, so that
in the above case, UserSlice will only move 3 bytes and become "defg",
and the return CStr is still "abc" (with a tailing NUL).

The current behavior makes me feel like we can lose some information,
for example, if the user-kernel protocol is that "a userslice that
contains 4 64-byte strings which don't have a tailing NUL", we cannot do
4 strcpy_into_buf() to get them, right? But of course, the scenario is
completely made up, just food for thoughts.

Regards,
Boqun

> +        // SAFETY: `raw_strncpy_from_user` guarantees that this range of bytes represents a
> +        // NUL-terminated string with the only NUL byte being at the end.
> +        Ok(unsafe { CStr::from_bytes_with_nul_unchecked(&buf[..len]) })
> +    }
>  }
>  
>  /// A writer for [`UserSlice`].
> 
> -- 
> 2.49.0.901.g37484f566f-goog
> 
