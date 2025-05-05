Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C6B26B097;
	Mon,  5 May 2025 18:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746470037; cv=none; b=fXHbdKDdKI5CNz1v1PL5aKHrqYyVeM1hfDZNgZAikVom7ovLc5ffWkGWTIcOmNVJBtWWWPxcf+BjU2pMgRQsQMQ6OjLLEjrwBtD5QpU3TdMdivoKtbb+78q1yLdVSTsaXLM0u2dR9WaKqajWFAZvLCxC5lqLwWnDwZr0l1FlqZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746470037; c=relaxed/simple;
	bh=5S8M/c10REYo4PgzbC8d4IT8+Lk4+t8C4D84ntmXYig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E88KG/iexXiOpYECGyN8S05AgK207aBZYXzblgx9Zhcz4q/yAoB00OQe0CEavcG0yslZJOZHxFWR9m4wu8gLtZA/Fmrnu1O+6+lVR8PinZ20ppmHZ9gdZxA/xeAWZxrA84PCW1Fc1F5OHEdJlj/uoscCgvqGZabSJpMl13aRhus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SoYI82O2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SoYI82O2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52CCC4CEE4;
	Mon,  5 May 2025 18:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746470037;
	bh=5S8M/c10REYo4PgzbC8d4IT8+Lk4+t8C4D84ntmXYig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SoYI82O2m/0NkHy3N0fDYrkgm4jlBTVenJoq4IKfWeLcfvsNnwVrpKnHUupKwt/nl
	 3pQNcVC8/9H/16kDZFtWQt2miX73DaRlN5Osus4B8lZAvuRT6QU/89CqQJOSZzeveC
	 9rOmzYMlRSLuZb2wAQYQL/JndyteJ41+qxP20NRhizh9M0lwsa/QjxA9j6HX5Jxkdd
	 O1H1DJxEAZy+Cl0NSWuJfq4vujaxlj2IApj4o1O1E9JRETaH3hky1FaEuf0aLndNoa
	 0sCJmd3SXWtabtXlmy/QPTI+qnvpze+Ugjc2BrkeORZUscI+0gje96xfp9nLxNT8Sa
	 je5WDQ9cAuFHg==
Date: Mon, 5 May 2025 13:33:55 -0500
From: Rob Herring <robh@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Dirk Behme <dirk.behme@de.bosch.com>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 5/9] rust: device: Introduce PropertyGuard
Message-ID: <20250505183355.GA1658159-robh@kernel.org>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-6-remo@buenzli.dev>
 <5946174b-3178-462d-bb59-1e0d6c5f4dda@de.bosch.com>
 <D9O8WJ0RDNIA.4JYLWLYLBC2A@buenzli.dev>
 <CAL_Jsq+bzCc2r4H6=MfWq=9ku1SMCUL03KkCTeBPcqQrUEUMLg@mail.gmail.com>
 <D9OCJQ1HH5CM.2OHEAOF271GMC@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D9OCJQ1HH5CM.2OHEAOF271GMC@buenzli.dev>

On Mon, May 05, 2025 at 05:53:33PM +0200, Remo Senekowitsch wrote:
> On Mon May 5, 2025 at 5:37 PM CEST, Rob Herring wrote:
> > On Mon, May 5, 2025 at 8:02 AM Remo Senekowitsch <remo@buenzli.dev> wrote:
> >>
> >> On Mon May 5, 2025 at 7:14 AM CEST, Dirk Behme wrote:
> >> > On 04/05/2025 19:31, Remo Senekowitsch wrote:
> >> >> This abstraction is a way to force users to specify whether a property
> >> >> is supposed to be required or not. This allows us to move error
> >> >> logging of missing required properties into core, preventing a lot of
> >> >> boilerplate in drivers.
> >> >>
> >> >> It will be used by upcoming methods for reading device properties.
> >> >>
> >> >> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> >> >> ---
> >> >>  rust/kernel/device/property.rs | 59 ++++++++++++++++++++++++++++++++++
> >> >>  1 file changed, 59 insertions(+)
> >> >>
> >> >> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
> >> >> index 6ccc7947f9c31..59c61e2493831 100644
> >> >> --- a/rust/kernel/device/property.rs
> >> >> +++ b/rust/kernel/device/property.rs
> >> >> @@ -123,3 +123,62 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> >> >>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
> >> >>      }
> >> >>  }
> >> >> +
> >> >> +/// A helper for reading device properties.
> >> >> +///
> >> >> +/// Use [`Self::required_by`] if a missing property is considered a bug and
> >> >> +/// [`Self::optional`] otherwise.
> >> >> +///
> >> >> +/// For convenience, [`Self::or`] and [`Self::or_default`] are provided.
> >> >> +pub struct PropertyGuard<'fwnode, 'name, T> {
> >> >> +    /// The result of reading the property.
> >> >> +    inner: Result<T>,
> >> >> +    /// The fwnode of the property, used for logging in the "required" case.
> >> >> +    fwnode: &'fwnode FwNode,
> >> >> +    /// The name of the property, used for logging in the "required" case.
> >> >> +    name: &'name CStr,
> >> >> +}
> >> >> +
> >> >> +impl<T> PropertyGuard<'_, '_, T> {
> >> >> +    /// Access the property, indicating it is required.
> >> >> +    ///
> >> >> +    /// If the property is not present, the error is automatically logged. If a
> >> >> +    /// missing property is not an error, use [`Self::optional`] instead. The
> >> >> +    /// device is required to associate the log with it.
> >> >> +    pub fn required_by(self, dev: &super::Device) -> Result<T> {
> >> >> +        if self.inner.is_err() {
> >> >> +            dev_err!(
> >> >> +                dev,
> >> >> +                "{}: property '{}' is missing\n",
> >> >> +                self.fwnode.display_path(),
> >> >> +                self.name
> >> >> +            );
> >> >> +        }
> >> >> +        self.inner
> >> >> +    }
> >> >
> >> > Thinking about the .required_by(dev) I wonder if there will be cases
> >> > where we do *not* have a device? I.e. where we really have a fwnode,
> >> > only. And therefore can't pass a device. If we have such cases do we
> >> > need to be able to pass e.g. Option(dev) and switch back to pr_err() in
> >> > case of None?
> >>
> >> In that case, bringing back the previous .required() method seems
> >> reasonable to me. But only if we definitely know such cases exist.
> >
> > They definitely exist. Any property in a child node of the device's
> > node when the child itself is not another device for example.
> 
> I don't think that counts, because you do have a device in that
> situation. The log should be assicated with that. So callers are
> responsible to propagate a reference to the device to wherever the call
> to .required_by(dev) is happening.

Ah, right. So it would just be cases that aren't a driver at all. That's 
limited to the OF_DECLARE cases. I agree we can worry about those later.

Rob
