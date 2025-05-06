Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E260B26659D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522658; cv=none; b=fPRwjGbyNnG18JXGLMtvo97bw1y94Gcd4OfAsoiWB9CDc0YJ9DZMRK9G3A5jMODZL+huGbEPYLQVME4L2YyOwrooo2N4lDdXtEXGPetEI4bK63dn89rx7wlOBMA/f0QT+3jEozp1k42Kg73Zx0Zwze38dsgh0yHha5SmmKQxMBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522658; c=relaxed/simple;
	bh=+gd3EFD3tIRaf8uZxUpcsQzp9JqRZMQZZXab+O+Anys=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UAccTsZiaPiC0D/VX5dH0nUdlJdtkgBKrP6EkQu7J52i9B9F11nTKCAu0KCZUM2zhL+XRwQrjpclfNfK9d7PtCj69AkCqlOeOY/CupSJxG/zp4S+rJB84+FHKm0M0GFGf9Q0PXpsw3IbkOHgNXkW5X8a9b6I71cbG0hh9Ret9eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QOg8GFlK; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QOg8GFlK"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39134c762ebso1594369f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746522655; x=1747127455; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jz3a5HwxM73VUsygopVsk7ADqOlPWS+1Glxw6UncPHk=;
        b=QOg8GFlKzLlIYbJbNCx9niKrqxskzXZq35hZx+RjOIVf1H1tt+4q3V8n1gFE0i9Cdp
         fLAnWfEogHvJsz9tQZ5OukCMykiVYfJwN/WmAFmeAHCHCykQ5lu7LEmDlln1BrF5bMGk
         GVRKHN665Himf0jgzvG9hrEaKIpl0Le7KJOWxqKnB09x7s7o44BokZNctANY6ulOcnmP
         bcwVdaXnJZRsqanE9QBLgZEdAcERTUqYT41SOFiHBl8lu7MI4LCCXahvdKK01MmUGBZ2
         zK8MCos9Ao0Rk3dTPa5UFy6ttKvDBXHG5ihbkSnOwNr2lGNqhS3rpqdnwNbdTD5qBNcm
         tSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522655; x=1747127455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz3a5HwxM73VUsygopVsk7ADqOlPWS+1Glxw6UncPHk=;
        b=NBbTjWqU59HyjB9Y6j0gKnOXhUW232xUwwGi9GPD1ZNi8T2e6f1MTYKtlp8RG4uI0Z
         Hwrut6XguiXg8K3n/YS7kE1eHiKag9yPVfDHsahU8nhpVFnLSmwtKfpfhXYTYYMSZugH
         SuXRUATU/J8SznfGE+f768Ou3BpR6TuTgKur3L9vkZ6l0mi3VMdq0IV8UuacEuuguawC
         KjExT+NDd/FHoBVp8ISSGoZkQQXntHJx14Av2WPIwulNcL5nrGzHraBojz/6wfOjKtYF
         yUgPOW5SWJcblMUcebUueQzT1sBDV/0ddpcC38NgA4gtdzZX2oj/SSjrDDe3PPR+4+Yh
         ndEg==
X-Forwarded-Encrypted: i=1; AJvYcCX0ObjsjrkuVaVgIJFV3B3+bOzIpbcVKyu93NdYb240a63qZnTP7vA+lxP0dBEM4T9bBTUEMCpnfmizbAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEMJRcFpW2kEl+evVzxpIkumcGqIc7z0mLPEckGjPJzjg8fWWB
	/JmW6DAHbVmb4UNHOYw/V9t9FMkPqRV49PisdWJCAt1dx2C/gYcneHmNezNU0q7pxnuRNMOOrOq
	1jtsFRrtogRqeRw==
X-Google-Smtp-Source: AGHT+IGyiMkYwbaMmB8dqPMDkvSFdJCivatLGhIBQhLPFZ0JT3dRMRjM3/jxKXeyS5cJ9gy5621ZK8OdcyZ3mWo=
X-Received: from wrbay3.prod.google.com ([2002:a5d:6f03:0:b0:3a0:6fdd:fcab])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2404:b0:39c:142c:e889 with SMTP id ffacd0b85a97d-3a0ac0ec30emr1669780f8f.27.1746522655314;
 Tue, 06 May 2025 02:10:55 -0700 (PDT)
Date: Tue, 6 May 2025 09:10:53 +0000
In-Reply-To: <aBjlx_AfQCS-pmht@polis>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-strncpy-from-user-v3-0-85c677fd4f91@google.com>
 <20250505-strncpy-from-user-v3-2-85c677fd4f91@google.com> <aBjlx_AfQCS-pmht@polis>
Message-ID: <aBnSHfFGAyMxAtQa@google.com>
Subject: Re: [PATCH v3 2/2] uaccess: rust: add UserSliceReader::strcpy_into_buf
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, May 05, 2025 at 06:22:31PM +0200, Danilo Krummrich wrote:
> On Mon, May 05, 2025 at 12:17:32PM +0000, Alice Ryhl wrote:
> > +    /// Read a NUL-terminated string from userspace and return it.
> > +    ///
> > +    /// The string is read into `buf` and a NUL-terminator is added if the end of `buf` is reached.
> > +    /// Since there must be space to add a NUL-terminator, the buffer must not be empty. The
> > +    /// returned `&CStr` points into `buf`.
> > +    ///
> > +    /// Fails with [`EFAULT`] if the read happens on a bad address (some data may have been
> > +    /// copied).
> > +    #[doc(alias = "strncpy_from_user")]
> > +    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&'buf CStr> {
> > +        if buf.is_empty() {
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        // SAFETY: The types are compatible and `strncpy_from_user` doesn't write uninitialized
> > +        // bytes to `buf`.
> > +        let mut dst = unsafe { &mut *(buf as *mut [u8] as *mut [MaybeUninit<u8>]) };
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
> > +            // This implies that len == dst.len() < buf.len().
> > +            //
> > +            // This means that we could not fill the entire buffer, but we had to stop reading
> > +            // because we hit the `self.length` limit of this `UserSliceReader`. Since we did not
> > +            // fill the buffer, we treat this case as if we tried to read past the `self.length`
> > +            // limit and received a page fault, which is consistent with other `UserSliceReader`
> > +            // methods that also return page faults when you exceed `self.length`.
> > +            return Err(EFAULT);
> > +        } else {
> > +            // This implies that len == buf.len().
> > +            //
> > +            // This means that we filled the buffer exactly. In this case, we add a NUL-terminator
> > +            // and return it. Unlike the `len < dst.len()` branch, don't modify `len` because it
> > +            // already represents the length including the NUL-terminator.
> > +            //
> > +            // SAFETY: Due to the check at the beginning, the buffer is not empty.
> > +            unsafe { *buf.last_mut().unwrap_unchecked() = 0 };
> > +        }
> > +
> > +        // SAFETY: `raw_strncpy_from_user` guarantees that this range of bytes represents a
> > +        // NUL-terminated string with the only NUL byte being at the end.
> 
> This isn't true if we hit the else case above, no?
> 
> With that fixed,
> 
> 	Reviewed-by: Danilo Krummrich <dakr@kernel.org>

I guess the wording is a bit off. I will update to this:

// SAFETY: There are two cases:
// * If we hit the `len < dst.len()` case, then `raw_strncpy_from_user`
//   guarantees that this slice contains exactly one NUL byte at the end
//   of the string.
// * Otherwise, `raw_strncpy_from_user` guarantees that the string
//   contained no NUL bytes, and we have since added a NUL byte at the
//   end.

Alice
