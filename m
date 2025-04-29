Received: from hs01.dakr.org (hs01.dakr.org [173.249.23.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E48E2C1E37;
	Tue, 29 Apr 2025 11:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.23.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745927288; cv=none; b=cZZ31873M3Hkc3NlUMrPytHqvOqV9xd/6ZO5yIX19M+W5v7dxPex+9C8q1Jc47/GaSZz0MoQZMbQw/pwgl33AFFj5cc23r23FToDFxqZEoRO28o4n4pWuV9FQSZax521owPCFBiHuInt5A98G7OUYEuevzcERFBjYUXQhlzFLi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745927288; c=relaxed/simple;
	bh=QLCpUut9z3tana09EUsBaAHZgMXic5dYw8zL7XMvUm4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=dHrCNWyhdN2OEnLz0+JSKn9cU7ecCk48sSut0OtylIVgEMFOKUL0zUN/FGNsV+wCMbqebT4tQf9uBMSxJdOaN7G0nN2ZerzjNCYLWdVSvz1s4Er+x+E3s3cN1QPeZct8EiM6YhkHXKGnVkKC2QJLyG5fBpAyinE/uiGkB4dIN2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dakr.org; spf=pass smtp.mailfrom=dakr.org; arc=none smtp.client-ip=173.249.23.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dakr.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dakr.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 29 Apr 2025 13:38:26 +0200
From: Danilo Krummrich <kernel@dakr.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] uaccess: rust: add
 UserSliceReader::strcpy_into_buf
In-Reply-To: <2025042919-varsity-registrar-fb45@gregkh>
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-2-7e6facac0bf0@google.com>
 <2025042919-varsity-registrar-fb45@gregkh>
Message-ID: <4b54a2385923b1312606dbb5b651e163@dakr.org>
X-Sender: kernel@dakr.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-29 13:09, Greg Kroah-Hartman wrote:
> On Tue, Apr 29, 2025 at 09:02:23AM +0000, Alice Ryhl wrote:
>> This patch adds a more convenient method for reading C strings from
>> userspace. Logic is added to NUL-terminate the buffer when necessary 
>> so
>> that a &CStr can be returned.
>> 
>> Note that we treat attempts to read past `self.length` as a fault, so
>> this returns EFAULT if that limit is exceeded before `buf.len()` is
>> reached.
>> 
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> ---
>>  rust/kernel/uaccess.rs | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>> 
>> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>> index 
>> acb703f074a30e60d42a222dd26aed80d8bdb76a..7cec1b62bd8b816f523c8be12cb29905740789fc 
>> 100644
>> --- a/rust/kernel/uaccess.rs
>> +++ b/rust/kernel/uaccess.rs
>> @@ -293,6 +293,41 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut 
>> Vec<u8, A>, flags: Flags) -> R
>>          unsafe { buf.set_len(buf.len() + len) };
>>          Ok(())
>>      }
>> +
>> +    /// Read a NUL-terminated string from userspace and append it to 
>> `dst`.
>> +    ///
>> +    /// Fails with [`EFAULT`] if the read happens on a bad address.
> 
> Also returns this error:
> 
>> +    pub fn strcpy_into_buf<'buf>(&mut self, buf: &'buf mut [u8]) -> 
>> Result<&'buf CStr> {
>> +        if buf.is_empty() {
>> +            return Err(EINVAL);
> 
> if the buffer is of 0 length.  Don't know if you want to document that
> or not.
> 
>> +        }
>> +
>> +        // SAFETY: The types are compatible and `strncpy_from_user` 
>> doesn't write uninitialized
>> +        // bytes to `buf`.
>> +        let mut dst = unsafe { &mut *(buf as *mut [u8] as *mut 
>> [MaybeUninit<u8>]) };
>> +
>> +        // We never read more than `self.length` bytes.
>> +        if dst.len() > self.length {
>> +            dst = &mut dst[..self.length];
>> +        }
>> +
>> +        let mut len = raw_strncpy_from_user(self.ptr, dst)?;
>> +        if len < dst.len() {
>> +            // Add one to include the NUL-terminator.
>> +            len += 1;
>> +        } else if len < buf.len() {
>> +            // We hit the `self.length` limit before `buf.len()`.
>> +            return Err(EFAULT);
> 
> How can this happen?

See my reply here (if I did not get it wrong):

https://lore.kernel.org/rust-for-linux/aBCrqJe4two4I45G@pollux/
