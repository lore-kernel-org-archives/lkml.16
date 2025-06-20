Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088CA19E98C;
	Fri, 20 Jun 2025 22:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750459055; cv=none; b=VMdUGqcx4McZ/7uz9YTfzALzuLdEwWxQXd0Ql20I+09Kd/+ACmVNlZnD9A/ngBA/hJOcIpJ2pQ+eI87Ei49+I2WQ2CwAOLDnbbTsbo1Nvj9VcsMsZjOF+v0PkMlUNPjRcjbLbZuWSKFDo7CzK9DEZf9m0imJxAqUaWMPdeJQWp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750459055; c=relaxed/simple;
	bh=2rMyA/wzA7o1DmB+D1HVrWEoJH5/9feYghQ21/NivpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8Ij1y7NDea2E5Qko8CYQT0kkC2SYaRV84WlptFuaTFn17obRfoET0wLvRLZWoSv54qFOtQ/tTCjOlpS2xNNGPGV1sprDYbFl1muwnFg7dOgD/ZdtmTbeLG9Gf4Ku3GQXaZR37s/LBTWmZ57elTdYKKBUmQlEvcyY/hXZY9e54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTejO0pf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTejO0pf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50BBC4CEE3;
	Fri, 20 Jun 2025 22:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750459054;
	bh=2rMyA/wzA7o1DmB+D1HVrWEoJH5/9feYghQ21/NivpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uTejO0pfo5WHe4wXrxMlp5mqT/DBSJu+XO9aDZ1MZA8Zd0s8v7sLbfl49CG4jfNuR
	 OMk2aNBPr5Qx+5VtFfEq86VNQXfaKsE+HgxZiS1D/c7db4wlxCQl3VPCiC4gNFbZ3N
	 7+LKBMz/niXgjFn1NMjy/zlakfUlyoDtyivx8MnBPYfpy8cw+sd05harFmF0cU+8yq
	 z34VxbLnv0mDhrRkJw6UE9DI/PvK2Ko41+yGOasZFDlhSgOy1vlTNi46Tlgy5cdK6J
	 gN87YeaHYqnVA/OcERIvUiT1lTyuqD4nLFIdwdQEOOw1Fn5f21IbA3BpqHyUfUMsJo
	 E4gzbmUv0ob4A==
Date: Sat, 21 Jun 2025 00:37:27 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Remo Senekowitsch <remo@buenzli.dev>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Mark Brown <broonie@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 3/3] samples: rust: platform: Add property child and
 reference args examples
Message-ID: <aFXipz-B1vEYkww9@cassiopeiae>
References: <20250616154511.1862909-1-remo@buenzli.dev>
 <20250616154511.1862909-4-remo@buenzli.dev>
 <CAL_JsqKXrsdGjTE5KDkqmVHUK5urMJnWSLWgEi8H1yM21gcOCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKXrsdGjTE5KDkqmVHUK5urMJnWSLWgEi8H1yM21gcOCA@mail.gmail.com>

On Tue, Jun 17, 2025 at 08:01:08AM -0500, Rob Herring wrote:
> On Mon, Jun 16, 2025 at 10:45 AM Remo Senekowitsch <remo@buenzli.dev> wrote:
> >
> > Add some example usage of the device property methods for reading
> > DT/ACPI/swnode child nodes and reference args.
> >
> > Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> > ---
> >  drivers/of/unittest-data/tests-platform.dtsi |  7 +++++++
> >  samples/rust/rust_driver_platform.rs         | 13 ++++++++++++-
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/of/unittest-data/tests-platform.dtsi
> > index 50a51f38afb6..509eb614ab2b 100644
> > --- a/drivers/of/unittest-data/tests-platform.dtsi
> > +++ b/drivers/of/unittest-data/tests-platform.dtsi
> > @@ -40,6 +40,13 @@ test-device@2 {
> >
> >                                 test,u32-prop = <0xdeadbeef>;
> >                                 test,i16-array = /bits/ 16 <1 2 (-3) (-4)>;
> > +
> > +                               ref_child_0: child@0 {
> 
> child-0 or you need to add 'reg' property if you keep the unit-address.

Adding child nodes here creates the following dt-test failues.

	[    1.031239] ### dt-test ### FAIL of_unittest_platform_populate():1862 Could not create device for node 'child'
	[    1.031647] ### dt-test ### FAIL of_unittest_platform_populate():1862 Could not create device for node 'child'

@Rob: What do you suggest?

> 
> > +                                       test,ref-arg = <&ref_child_1 0x20 0x32>;
> > +                               };
> > +                               ref_child_1: child@1 {
> > +                                       test,ref-arg = <&ref_child_0 0x10 0x64>;
> > +                               };
> >                         };
> >                 };
