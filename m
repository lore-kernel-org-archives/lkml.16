Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com [203.205.221.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24642E401
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745254046; cv=none; b=QjhxBNGr0LR1D8o44YbGbG8o6PDYLTiwjkogZof/QmHdH+g6fpEsGxRZMZpO6t2OHz+foMyKmzPM/Y/0xmnimhnZY3+5AFIpk+dq/NABRIYHDu7lt1HTFL9DSsCztweZ0qQ0pL/qz9Yx2cOdK/uPLOftVJZIShcMgWYzI5+f0cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745254046; c=relaxed/simple;
	bh=zQ0EGh/F12wna3NvvINOFg8KOFnSaliwDsC8vZaldpg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=D0cF+8d+QVt274ZLfKVWGTRtYAh+0mkcZiXwrVg2/TMTCa/DMQXpBS1sSLcQSKdvuW3iPC+C8T+HjB5tgXAiM4AL5Tjgg3Rm1cEcLwsZDffD4zLNm9IMLB2WsMZ3Ok2/bhRHITep3EWeiL7CW+XPv2TQX1Nm8D8upw/qc8jFCkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=MT7IGPsT; arc=none smtp.client-ip=203.205.221.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="MT7IGPsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745254038; bh=dUdLgnEveokE4y01P7eq6jBsYcwFEiE6grPLxuZ/jDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MT7IGPsT7r/wW8tfcjfT8U2L6kEFAB2AVF0FehbwD7ALtPpaNUC9I2nkNJqjndhfE
	 lrmXRvrHEnyr6xeBX06Ybia/tqOU1DAp7XVfBktvx0YGlosDCqGNTfMJOVWRejp70E
	 uPtpDU9HEaiz6zWpkTiFSH1zdnuAtxoDvVWwRmUs=
Received: from jckeep-Lenovo-XiaoXinAir-14IIL-2020.. ([240e:3b1:d003:cf1:7732:da7c:bd29:219d])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id BD01B88F; Tue, 22 Apr 2025 00:47:16 +0800
X-QQ-mid: xmsmtpt1745254036t94odr9h3
Message-ID: <tencent_D04FE925ED0AD6F0A4C297CA1A1A74FDE608@qq.com>
X-QQ-XMAILINFO: NKv2G1wnhDBnnvGgBqycrvnoYnY0GdGeelSXNyyebH1PgO5rYgYR/KLlnYIpNI
	 2trnWrhJtDH0B7NADdOzyClcEaWrwvvy+HWUNaAnD+FVRH6zx2euyemAbOwNUNEWJqEYVnFdJUqU
	 PPQosVSbMhjRdahIx4QzzyU5HzQdEtwTR9tnkwSq1ILn0sRxQTyigjEuV7YGgjChkWUqS8Evhfg6
	 /yzOm/6qZ8Qb2wMyHf74oRIoFt8MYqru0kGIM9G6DlzutK699TICba0kNm3iWgSVbcq3td68dmN6
	 ZzEoq2bzqBdV5KYQLtM/CCD4Bxaih1idXBJJMLmdmciH+xVhMb2X4fv43lnMKw8Y552apIIn3XCY
	 Agtv4eu0lhR7R7m8uzapjq3UENwYqAAwifgxXIb7lrVHwjo8rJIT9ILzQeqrfewix3GsBAK5J4r8
	 XMY8KGKZ2JqI10w7yAd1IhR3kIPp9V/NX/Ft0XhzEqZ4v1snD4jrlcDyMJAJzVk3RfN5JKeDWKfu
	 7i4nwQAKa4Shfi6aVwLZDhKO0ZlYwmOuPrAXKYC3dTHk4qUKhrsCuN8wDikY+S65+L3P4rzDvocm
	 oqy71QQVHIJk276lY3/R8CzGPQfTCOH/WALhUEVoNBvU31iSKuKRqU3sjq/njb+Ko3kMLcytN4cT
	 6LiB+Ml5avHDg6GQhGnuEGKK1iRLbU6NWRNJ640rVNPLD4tRpa6toZxl67aA3ilawn0ItFUNJIh1
	 kZHYgGzGRdokrHSZu/PoEEOQT9H/qTm94h0cXj4oueFQ+nh4LWrINGR8ONNH2CCHzfo4ziWtvdq5
	 KjatrhXMmDYeFsZunpE43PhcmUWw0F9TiC1LZ3jX/rEeB+/EgmaocBnV687WvRD0J88E8pZg5afg
	 9pRIVVt0Wx9tkxfmB+FAPG3tFJduA0Q8UAfPFBXYynLWCJucdK3f1ruZ6Fj3IIRgl9U90nx3InHe
	 CXtDsALHyIEZR28EmE+KZfc4w/TFDl/0nC2RV+I4DH8E4hwnFX8bmtePdnkCs/
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Guangbo Cui <2407018371@qq.com>
To: benno.lossin@proton.me
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	simona.vetter@ffwll.ch,
	tmgross@umich.edu
Subject: Re: [PATCH v3 3/4] rust: validate: add `Validate` trait
Date: Tue, 22 Apr 2025 00:47:15 +0800
X-OQ-MSGID: <20250421164715.427350-1-2407018371@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421134909.464405-4-benno.lossin@proton.me>
References: <20250421134909.464405-4-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Really cool patch! I got a few thoughts below.

> Introduce the `Validate<Input>` trait and functions to validate
> `Untrusted<T>` using said trait. This allows one to access the inner
> value of `Untrusted<T>` via `validate{,_ref,_mut}` functions which
> subsequently delegate the validation to user-implemented `Validate`
> trait.
> 
> The `Validate` trait is the only entry point for validation code, making
> it easy to spot where data is being validated.
> 
> The reason for restricting the types that can be inputs to
> `Validate::validate` is to be able to have the `validate...` functions
> on `Untrusted`. This is also the reason for the suggestions in the
> `Usage in API Design` section in the commit that introduced
> `Untrusted<T>`.
> 
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> ---
>  rust/kernel/validate.rs | 61 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/validate.rs b/rust/kernel/validate.rs
> index 8b33716be0c7..eecac39365db 100644
> --- a/rust/kernel/validate.rs
> +++ b/rust/kernel/validate.rs
> @@ -11,6 +11,9 @@
>  //! APIs that write back into userspace usually allow writing untrusted bytes directly, allowing
>  //! direct copying of untrusted user data back into userspace without validation.
>  //!
> +//! The only way to access untrusted data is to [`Validate::validate`] it. This is facilitated by
> +//! the [`Validate`] trait.
> +//!
>  //! # Rationale
>  //!
>  //! When reading data from an untrusted source, it must be validated before it can be used for
> @@ -46,7 +49,7 @@
>  /// untrusted, as it would otherwise violate normal Rust rules. For this reason, one can easily
>  /// convert that reference to `&[Untrusted<u8>]`. Another such example is `Untrusted<KVec<T>>`, it
>  /// derefs to `KVec<Untrusted<T>>`. Raw bytes however do not behave in this way, `Untrusted<u8>` is
> -/// totally opaque.
> +/// totally opaque and one can only access its value by calling [`Untrusted::validate()`].
>  ///
>  /// # Usage in API Design
>  ///
> @@ -101,6 +104,30 @@ pub fn new(value: T) -> Self
>      {
>          Self(value)
>      }
> +
> +    /// Validate the underlying untrusted data.
> +    ///
> +    /// See the [`Validate`] trait for more information.
> +    pub fn validate<V: Validate<Self>>(self) -> Result<V, V::Err>
> +    where
> +        T: Sized,
> +    {
> +        V::validate(self.0)
> +    }
> +
> +    /// Validate the underlying untrusted data.
> +    ///
> +    /// See the [`Validate`] trait for more information.
> +    pub fn validate_ref<'a, V: Validate<&'a Self>>(&'a self) -> Result<V, V::Err> {
> +        V::validate(&self.0)
> +    }
> +
> +    /// Validate the underlying untrusted data.
> +    ///
> +    /// See the [`Validate`] trait for more information.
> +    pub fn validate_mut<'a, V: Validate<&'a mut Self>>(&'a mut self) -> Result<V, V::Err> {
> +        V::validate(&mut self.0)
> +    }
>  }

The `validate_ref` and `validate_mut` functions should just call `V::validate(self)`
directly, since self is an Untrusted<T>, and you already implemented ValidateInput for it.
Calling `V::validate(&self.0)` would cause a type mismatch error.

> +/// Marks valid input for the [`Validate`] trait.
> +pub trait ValidateInput: private::Sealed {}
> +
> +impl<T: ?Sized> ValidateInput for Untrusted<T> {}
> +
> +impl<'a, T: ?Sized> ValidateInput for &'a Untrusted<T> {}
> +
> +impl<'a, T: ?Sized> ValidateInput for &'a mut Untrusted<T> {}
> +
> +mod private {
> +    use super::Untrusted;
> +
> +    pub trait Sealed {}
> +
> +    impl<T: ?Sized> Sealed for Untrusted<T> {}
> +    impl<'a, T: ?Sized> Sealed for &'a Untrusted<T> {}
> +    impl<'a, T: ?Sized> Sealed for &'a mut Untrusted<T> {}
> +}
> +
> +/// Validate [`Untrusted`] data.
> +///
> +/// Care must be taken when implementing this trait, as unprotected access to unvalidated data is
> +/// given to the [`Validate::validate`] function. The implementer must ensure that the data is only
> +/// used for logic after successful validation.
> +pub trait Validate<Input: ValidateInput>: Sized {
> +    /// Validation error.
> +    type Err;
> +
> +    /// Validate the raw input.
> +    fn validate(raw: Input) -> Result<Self, Self::Err>;
> +}

Best regards,
Guangbo Cui

