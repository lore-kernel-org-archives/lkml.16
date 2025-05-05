Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851311F9F70;
	Mon,  5 May 2025 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460430; cv=none; b=SixjnfB6Rn6Joa0YLafNt70Gp64NYHgZnkRdPXF8My/wdOV6k4c98cEEKqjpF9T2yuN9xhIUJQ2R4XXuPeDYSi+YJzAHy7aRkZu/6sKIZnqy4e7jrvlJvs5FBt/45FI+/nSslIXT52CUoodjUWvuD+vwZTMZ8HVQMbGhRbTePgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460430; c=relaxed/simple;
	bh=U21AvJMNJlSMdc0qYquq7flkukxOR54eWkwMAX7w+yE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=X6Y4CA5bTvwpgbuqLZfOxWhs5aQnskc8Tp9/0gvaoy5E8mMGrXaRurKF1I7bUiE1lQpa9Tgn3y8NXzhba6B5EOZ3p3/WcMvLbP+gx5ZyuQ/W+o+X6StdLtskX3A6iyKzSOt9UGBwD92YakL096SDRw1z2eGqCbzqDXtkhDKgFwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZrmKG4rPRz9tZT;
	Mon,  5 May 2025 17:53:38 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 May 2025 17:53:33 +0200
Message-Id: <D9OCJQ1HH5CM.2OHEAOF271GMC@buenzli.dev>
Cc: "Dirk Behme" <dirk.behme@de.bosch.com>, "Saravana Kannan"
 <saravanak@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 5/9] rust: device: Introduce PropertyGuard
From: "Remo Senekowitsch" <remo@buenzli.dev>
To: "Rob Herring" <robh@kernel.org>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-6-remo@buenzli.dev>
 <5946174b-3178-462d-bb59-1e0d6c5f4dda@de.bosch.com>
 <D9O8WJ0RDNIA.4JYLWLYLBC2A@buenzli.dev>
 <CAL_Jsq+bzCc2r4H6=MfWq=9ku1SMCUL03KkCTeBPcqQrUEUMLg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+bzCc2r4H6=MfWq=9ku1SMCUL03KkCTeBPcqQrUEUMLg@mail.gmail.com>

On Mon May 5, 2025 at 5:37 PM CEST, Rob Herring wrote:
> On Mon, May 5, 2025 at 8:02=E2=80=AFAM Remo Senekowitsch <remo@buenzli.de=
v> wrote:
>>
>> On Mon May 5, 2025 at 7:14 AM CEST, Dirk Behme wrote:
>> > On 04/05/2025 19:31, Remo Senekowitsch wrote:
>> >> This abstraction is a way to force users to specify whether a propert=
y
>> >> is supposed to be required or not. This allows us to move error
>> >> logging of missing required properties into core, preventing a lot of
>> >> boilerplate in drivers.
>> >>
>> >> It will be used by upcoming methods for reading device properties.
>> >>
>> >> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
>> >> ---
>> >>  rust/kernel/device/property.rs | 59 ++++++++++++++++++++++++++++++++=
++
>> >>  1 file changed, 59 insertions(+)
>> >>
>> >> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/prop=
erty.rs
>> >> index 6ccc7947f9c31..59c61e2493831 100644
>> >> --- a/rust/kernel/device/property.rs
>> >> +++ b/rust/kernel/device/property.rs
>> >> @@ -123,3 +123,62 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>> >>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
>> >>      }
>> >>  }
>> >> +
>> >> +/// A helper for reading device properties.
>> >> +///
>> >> +/// Use [`Self::required_by`] if a missing property is considered a =
bug and
>> >> +/// [`Self::optional`] otherwise.
>> >> +///
>> >> +/// For convenience, [`Self::or`] and [`Self::or_default`] are provi=
ded.
>> >> +pub struct PropertyGuard<'fwnode, 'name, T> {
>> >> +    /// The result of reading the property.
>> >> +    inner: Result<T>,
>> >> +    /// The fwnode of the property, used for logging in the "require=
d" case.
>> >> +    fwnode: &'fwnode FwNode,
>> >> +    /// The name of the property, used for logging in the "required"=
 case.
>> >> +    name: &'name CStr,
>> >> +}
>> >> +
>> >> +impl<T> PropertyGuard<'_, '_, T> {
>> >> +    /// Access the property, indicating it is required.
>> >> +    ///
>> >> +    /// If the property is not present, the error is automatically l=
ogged. If a
>> >> +    /// missing property is not an error, use [`Self::optional`] ins=
tead. The
>> >> +    /// device is required to associate the log with it.
>> >> +    pub fn required_by(self, dev: &super::Device) -> Result<T> {
>> >> +        if self.inner.is_err() {
>> >> +            dev_err!(
>> >> +                dev,
>> >> +                "{}: property '{}' is missing\n",
>> >> +                self.fwnode.display_path(),
>> >> +                self.name
>> >> +            );
>> >> +        }
>> >> +        self.inner
>> >> +    }
>> >
>> > Thinking about the .required_by(dev) I wonder if there will be cases
>> > where we do *not* have a device? I.e. where we really have a fwnode,
>> > only. And therefore can't pass a device. If we have such cases do we
>> > need to be able to pass e.g. Option(dev) and switch back to pr_err() i=
n
>> > case of None?
>>
>> In that case, bringing back the previous .required() method seems
>> reasonable to me. But only if we definitely know such cases exist.
>
> They definitely exist. Any property in a child node of the device's
> node when the child itself is not another device for example.

I don't think that counts, because you do have a device in that
situation. The log should be assicated with that. So callers are
responsible to propagate a reference to the device to wherever the call
to .required_by(dev) is happening.

>> > From the beginning of our discussion I think to remember that the C AP=
I
>> > has both the fwnode_property_*() and device_property_*() because there
>> > are use cases for the fwnode_property_*() API where is no device?
>
> Correct.
>
>> I'm not sure what you're referring to, the closest thing I can think of
>> is this comment by Rob [1] where he mentions the device_property_*()
>> functions only exist in C for a minimal convenience gain and we may not
>> want to keep that in Rust.
>
> The point there was if there's not the same convenience with Rust,
> then we shouldn't keep the API.
>
> I think this came up previously, but I don't think it matters whether
> we print the device name or fwnode path. If you have either one, you
> can figure out both the driver and node. Arguably the fwnode path is
> more useful because that's likely where the error is.
>
> Rob

