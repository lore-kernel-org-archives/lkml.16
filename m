Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D0B25C837;
	Wed, 25 Jun 2025 14:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862373; cv=none; b=heEY7rHeMKEM3F/Z13VKhNzzIA2aB1zQutPB3b/FSsDsxEi35w/BH+RsMDS27aAfdhwssgcF5b035WWCN6TvmbfGHQc/W8w8EU+nTbEwaRyEIJHnIa5Ow3My0RUm9ldqtZF+bgz3kEaM9joPpiLCTjUo9ochPjR0hOmlZHohjSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862373; c=relaxed/simple;
	bh=X/lKwA8QAaVG1SwWzEqYk8hwBUZQD0NFX6fGDFDDcw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e67tXGYmMgaDMoRtpwzzV6P9mdicVcJxy2uJOAK+ighPiDeyBcssAwFOiKuRYctimkMZ0cvtNN/VyCIAxWfmiiILdIK2paJmtxQuQe0z9OI2evONato/UFwtqWic2u9Afk3Q4GkXpggaMfmH3K83bCMChniTLtOWk5Dmj0PO5CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qoqSyi6s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qoqSyi6s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C2BC4CEEA;
	Wed, 25 Jun 2025 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750862372;
	bh=X/lKwA8QAaVG1SwWzEqYk8hwBUZQD0NFX6fGDFDDcw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qoqSyi6sAVEZNykoMV15NDGfMlVn3r7azbeV4h3f6pQIx9JcL2DDrzEXw6xoM+aJZ
	 9nXefeCRVIx9fbEFbv9kLxQkSrOaQg6JDv6kjYhOEHLsBeRJuzzasUgJy8HItXfAov
	 mdt7MLFnqFCWBHY8OebOPRjOtXmipbGR3NGb93rxY8nE6rtfYg2q795ZsdPt6GMGuP
	 6CUOuK68VlayuUkgM7vsbje9kaPY92h/RbAw37mnWSpXjIA5Fg7WEqzcWzzQkGqGc2
	 VVxjPltHfPwEXDQKu3x+73Z1WOa0zUKSErW8q3Kydzje2+YCPpvs3RGeUzxw/ybDeH
	 SmEiBGbN/5s4Q==
Date: Wed, 25 Jun 2025 09:39:30 -0500
From: Rob Herring <robh@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
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
Message-ID: <20250625143930.GA1006384-robh@kernel.org>
References: <20250616154511.1862909-1-remo@buenzli.dev>
 <20250616154511.1862909-4-remo@buenzli.dev>
 <CAL_JsqKXrsdGjTE5KDkqmVHUK5urMJnWSLWgEi8H1yM21gcOCA@mail.gmail.com>
 <aFXipz-B1vEYkww9@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFXipz-B1vEYkww9@cassiopeiae>

On Sat, Jun 21, 2025 at 12:37:27AM +0200, Danilo Krummrich wrote:
> On Tue, Jun 17, 2025 at 08:01:08AM -0500, Rob Herring wrote:
> > On Mon, Jun 16, 2025 at 10:45 AM Remo Senekowitsch <remo@buenzli.dev> wrote:
> > >
> > > Add some example usage of the device property methods for reading
> > > DT/ACPI/swnode child nodes and reference args.
> > >
> > > Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> > > ---
> > >  drivers/of/unittest-data/tests-platform.dtsi |  7 +++++++
> > >  samples/rust/rust_driver_platform.rs         | 13 ++++++++++++-
> > >  2 files changed, 19 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/of/unittest-data/tests-platform.dtsi b/drivers/of/unittest-data/tests-platform.dtsi
> > > index 50a51f38afb6..509eb614ab2b 100644
> > > --- a/drivers/of/unittest-data/tests-platform.dtsi
> > > +++ b/drivers/of/unittest-data/tests-platform.dtsi
> > > @@ -40,6 +40,13 @@ test-device@2 {
> > >
> > >                                 test,u32-prop = <0xdeadbeef>;
> > >                                 test,i16-array = /bits/ 16 <1 2 (-3) (-4)>;
> > > +
> > > +                               ref_child_0: child@0 {
> > 
> > child-0 or you need to add 'reg' property if you keep the unit-address.
> 
> Adding child nodes here creates the following dt-test failues.
> 
> 	[    1.031239] ### dt-test ### FAIL of_unittest_platform_populate():1862 Could not create device for node 'child'
> 	[    1.031647] ### dt-test ### FAIL of_unittest_platform_populate():1862 Could not create device for node 'child'
> 
> @Rob: What do you suggest?

This should fix it:

index eeb370e0f507..e3503ec20f6c 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1856,6 +1856,8 @@ static void __init of_unittest_platform_populate(void)
        of_platform_populate(np, match, NULL, &test_bus->dev);
        for_each_child_of_node(np, child) {
                for_each_child_of_node(child, grandchild) {
+                       if (!of_property_present(grandchild, "compatible"))
+                               continue;
                        pdev = of_find_device_by_node(grandchild);
                        unittest(pdev,
                                 "Could not create device for node '%pOFn'\n",

