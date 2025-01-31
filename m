Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351C51B87D0;
	Fri, 31 Jan 2025 13:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738328542; cv=none; b=h9uD4dxoAH8VeNfyegA83e3Rvo7foqqlwNqNAdkp4UuxR+C8hlWjOqf4xSXt6IlZMwaTWEJ7Cg6eOnBaIjgE5IQdZp2FRdMT0UPOTHh8C2bbwTQts8HKbUn65Gm8FUXg+vmoNa2nx4KZm6L8Rb8E7r5AoNeCclp0fNvBHvJ4bYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738328542; c=relaxed/simple;
	bh=U5dK1s2mEy743eLmLd9QQoxaUO47/aada/fIGdOPpeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uyncGmuN2c/DNZZxO47ZFKCHcos15Euw4ZZ6qQ8DOYawSHFA9+gB1YiFA9K/kYoL0LweP+t1HIhspnHCjOqc10Nwn1OMx4Undh0woJ0RgioH1KYdkM30e+EFzyEGRn0rofnJL39Do45YCIBjzcPyb3DMVLtq+7zkgQdnqrWG9eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cdms/jwB; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cdms/jwB"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F00A44310;
	Fri, 31 Jan 2025 13:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738328538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lb/K/SCohDoUCh3f9yyufOMMbrIywrLyezp4JOZkI7g=;
	b=cdms/jwBoySKOD2dUfuAAo/vIHMeeEqQw7PSK9TfVn+DXbQyW+d1JyNX0lhVwrWjeMUpPf
	s531FqzuyVVanajnVBtZfRFU23LNEXwnHr/rsP6rS0mjUi6QkFxevT43qpRjQws8ibzmvb
	C7EQJ5cgyORf876q2yjVx34gICIbrKRIpmqkvajlPIYD8SQluQ8jxZbZJuzfsmwXHmlIIy
	JN9hLbraLNS/EzOmL7jUv4tqGE/tCuFOc2ruGyHYElqszyNhC6+JUVGKT1aQiTSwPPaTzc
	ZWuqYS/s4nz/eO+PovLimb/KgCP5+buT7D4EOwfBXPVUuJl8KrjAxIoengsj2g==
Date: Fri, 31 Jan 2025 14:02:14 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
	dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
	jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
	miquel.raynal@bootlin.com, mripard@kernel.org,
	nicolejadeyee@google.com, pekka.paalanen@collabora.com,
	pekka.paalanen@haloniitty.fi, rdunlap@infradead.org,
	rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
	simona.vetter@ffwll.ch, simona@ffwll.ch,
	thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH v16 5/7] drm/vkms: Create KUnit tests for YUV conversions
Message-ID: <Z5zJ1pEk3v-1V5Uu@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
	dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
	jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
	mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
	miquel.raynal@bootlin.com, mripard@kernel.org,
	nicolejadeyee@google.com, pekka.paalanen@collabora.com,
	pekka.paalanen@haloniitty.fi, rdunlap@infradead.org,
	rodrigosiqueiramelo@gmail.com, seanpaul@google.com,
	simona.vetter@ffwll.ch, simona@ffwll.ch,
	thomas.petazzoni@bootlin.com, tzimmermann@suse.de
References: <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
 <20250131084111.2903-1-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250131084111.2903-1-jose.exposito89@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekkeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeevteekvdelteduuedugeefjeehueejfeekgfdtuefgteefuedtveeikedvkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhouhhishdqtghhrghuvhgvthdqlhgrphhtohhppdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtohepjhhoshgvrdgvgihpohhsihhtohekleesghhmrghilhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrthhhuhhrghhrihhllhhosehrihhsvghuphdrnhgvthdprhgtphhtthhopegtohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguv
 ghskhhtohhprdhorhhgpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: louis.chauvet@bootlin.com

On 31/01/25 - 09:41, José Expósito wrote:
> Hi Louis,
> 
> > From: Arthur Grillo <arthurgrillo@riseup.net>
> > 
> > Create KUnit tests to test the conversion between YUV and RGB. Test each
> > conversion and range combination with some common colors.
> > 
> > The code used to compute the expected result can be found in comment.
> >
> > [Louis Chauvet:
> > - fix minor formating issues (whitespace, double line)
> > - change expected alpha from 0x0000 to 0xffff
> > - adapt to the new get_conversion_matrix usage
> > - apply the changes from Arthur
> > - move struct pixel_yuv_u8 to the test itself]
> > 
> > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---

[...]

> > +	/*
> > +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> > +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> > +	 *                     in_bits = 16,
> > +	 *                     in_legal = False,
> > +	 *                     in_int = True,
> > +	 *                     out_bits = 8,
> > +	 *                     out_legal = False,
> > +	 *                     out_int = True)
> > +	 * Test cases for conversion between YUV BT709 full range and RGB
> > +	 * using the ITU-R BT.709 weights.
> > +	 */
> > +	{
> > +		.encoding = DRM_COLOR_YCBCR_BT709,
> > +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> > +		.n_colors = 4,
> 
> If I understood correctly, "n_colors" here indicates the number of items in
> "colors", but there is a mismatch between both lengths.
> 
> It also applies to the other test cases where "n_colors = 4".

I don't know how I miss it, I am 100% sure I did the exact same comment to 
Arthur few mounth ago, thanks!
 
> > +		.colors = {
> > +			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> > +			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> > +			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> > +			{ "red",   { 0x36, 0x63, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> > +			{ "green", { 0xb6, 0x1e, 0x0c }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> > +			{ "blue",  { 0x12, 0xff, 0x74 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> > +		},
> > +	},
> > +	/*

[...]

> > +/*
> > + * vkms_format_test_yuv_u8_to_argb_u16 - Testing the conversion between YUV
> > + * colors to ARGB colors in VKMS
> > + *
> > + * This test will use the functions get_conversion_matrix_to_argb_u16 and
> > + * argb_u16_from_yuv888 to convert YUV colors (stored in
> > + * yuv_u8_to_argb_u16_cases) into ARGB colors.
> > + *
> > + * The conversion between YUV and RGB is not totally reversible, so there may be
> > + * some difference between the expected value and the result.
> > + * In addition, there may be some rounding error as the input color is 8 bits
> > + * and output color is 16 bits.
> > + */
> > +static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
> > +{
> > +	const struct yuv_u8_to_argb_u16_case *param = test->param_value;
> > +	struct pixel_argb_u16 argb;
> > +
> > +	for (size_t i = 0; i < param->n_colors; i++) {
> > +		const struct format_pair *color = &param->colors[i];
> > +		struct conversion_matrix matrix;
> > +
> > +		get_conversion_matrix_to_argb_u16
> > +			(DRM_FORMAT_NV12, param->encoding, param->range, &matrix);
> > +
> > +		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, &matrix);
> 
> Running the test on ppc64 (big endian) doesn't fail. For reference:
> 
>   $ sudo dnf install powerpc64-linux-gnu-gcc
>   $ sudo dnf install qemu-system-ppc64
>   $ ./tools/testing/kunit/kunit.py run \
>      --kunitconfig=drivers/gpu/drm/vkms/tests \
>      --arch=powerpc --cross_compile=powerpc64-linux-gnu- \
>      --make_options CF=-D__CHECK_ENDIAN__ \
>      --kconfig_add CONFIG_KASAN=y \
>      --kconfig_add CONFIG_KASAN_VMALLOC=y
> 
> However, I wonder if endianness is correctly handled. I always find endianness
> difficult to reason about, but I'll try my best to explain it.
> 
> On a big endian architecture, color->yuv is stored in big endian. This might not
> be an issue, because its components (y, u and v) are u8.
> However, I think that the return value of argb_u16_from_yuv888(), which is the
> result of argb_u16_from_u16161616(), is returned in big endian while it should
> be little endian.

The goal of `struct argb_u16` is to hide machine-specific issues. We want 
to be able to do addition, multiplication... without 
`le_from_cpu`/`cpu_to_le` everywhere.

If you look at the rest of the vkms driver, we never do bit manipulation 
on `struct argb_u16`, only mathematical operations. 

> Since you are comparing argb.a (big endian) with color->argb.a (big endian) the
> test succedess, but in this case it should fail because, if I remember
> correctly, colors must be stored in little endian and therefore, the color
> returned by argb_u16_from_yuv888() should be little endian.

The colors are stored in a specific endian only in framebuffers, but in 
our case, this is not a framebuffer. For the `argb_u16_to_ARGB16161616`, 
you can see we use `cpu_to_le16` to store the data in the proper order.
 
> If you replace this 4 KUNIT_EXPECT_LE_MSG() with KUNIT_EXPECT_MEMEQ(), all test
> will fail, but you'll notice that the buffers printed in the error log are
> different depending on the endianness (x86_64 vs ppc64).
> 
> What do you think? Did I overlook the conversion?

I think yes, but thanks to make me think about it, I will steal your 
command line to test on powerPC :)

> Have a look to the tests present in drm_format_helper_test.c. They use different
> functions (cpubuf_to_le32, le32buf_to_cpu, etc) to make sure that colors are
> represented in little endian and that comparing the expected and actual results
> happens in the same endian.

Those tests are testing conversion "buffer to buffer", so yes, there is 
some endian-dependant issues.

[...]
