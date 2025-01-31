Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2D9335C7;
	Fri, 31 Jan 2025 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738342661; cv=none; b=u7SUkhApPQ2PsTdIuy0oshkD1MDVnjpJlNAWt6VoDyJS0Sw9/RDLHwJe19KhWS5id3dbc+cT+0tP9dkTSLgela7w5AYCQbdAgShW7ZZ06BnDz81UnL6fB+tMny7N0jtI+P+sVrkx0CG6Th499aNSq8NN9iMF78UcGMsWAHwM7+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738342661; c=relaxed/simple;
	bh=xLe3qjRLIxdQsm0uzYrqcrvWxeXO3p1fVk+iQmdFC5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tg+MUI1k5atadFjLdncXlQXKa9e1F2PponiluIvWanB3KBpIXrl83+c1KAv7NfJlyzZQNwvk2pi4bHUkk9lAAt1bAoUo78rKQcCQI44HAQojQ5FrIh2VQBoaX0h4q+dWHI1dNAUCyO5mbgbs3d1HjMDBN2KLSnm8/IWQ1lWO+VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkSfIga4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkSfIga4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38a34e8410bso1166086f8f.2;
        Fri, 31 Jan 2025 08:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738342658; x=1738947458; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pfNeHfRMYsZ2XMQ7Tt/gdmnr9NbENuVOxKod6aka5ak=;
        b=bkSfIga4H00gM+so4SXsARNgviSKAuR+t9FH6ZF0CVUNVaLqC6qHQdD35gOoQ8nozv
         Vf/KL8NbZd7gk6vlvW4e/0l3dyvoPaaAgHiM6071eoDYneB+uDhzE8jSFrOiLqJAdALQ
         vWlTT9deqX+C75wPqbJCNijcIQnixwy4mgp7ZHB9urQFMnUGX/eV9u72bzb7NjNcvk44
         UqyAo/O2Is7PavT2qYXHWhlabMv6EF5/XHCxi7bOwxu3NivWa+zkMqVUFzif3pfefOLd
         ZQ6gwzAnR7kcQpesMARnuZze4RJqbFyvZFc5Ec/QVzAJI9DvrofskCav1jX4wVgiLHd5
         TBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738342658; x=1738947458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfNeHfRMYsZ2XMQ7Tt/gdmnr9NbENuVOxKod6aka5ak=;
        b=FURhjkY4sXvSvS6iwOa9DdFkrLC+49wuCEk9tUY5pIEK9mlN6Sa/KhMZeIRgBd1D8n
         2bIUNp45aREsx9r88DIGkXLzBlnY0yN128SGmnybC6kiGZe19sKxdgOZaZpgVOVnckVZ
         T8rarw1u+OCKlzBjWXCk6zYIbGcleVxR9ZWgf5GA3D3FaWTEg4fN1TenDPcvHpf0x7hf
         AyMef6IP+Kc1bKJ1wMcbmF62bAIoR3aGcM+US/khNrr3ZNcmfQ2e5eVWVhl/MKMWjlV1
         ueL89wQ7sdxhMx1uEeCQg9Qf30VMaKolZgGJ0VYDEvhRepzJVVxuki1ye1VEKboPwL4u
         v4Mg==
X-Forwarded-Encrypted: i=1; AJvYcCV/Vs3LARviL7dE48FDcoA6PZMGb2Cl5PXt7CnWcmddrFSHa2NM2/4gS6j2ipcOdxoPOium1VSTWGVH+T7O@vger.kernel.org, AJvYcCWSn/h7O4njXpq9szagvY4ZpZvvN8JntSNp6rBiSIGFi3n6akDlXHG1grpwcHjirH/2tDliD1IouNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcmCyz1GoF5YuRLdVjg3xojJXPg2BZye4eIvN4Sev/BRjcN65h
	dvBRAA9+d5Fthh5f7Fv7y/CayXfSFoMOL+AJlfEois36er+/fOXx
X-Gm-Gg: ASbGncsJ+/7NQlpbUNkgmNuRymZv5hmN+53cE8xv3vENO1wRNRxIlpdYmbIcgkXbq4Y
	ANAwteLKYfPNfkyddclNosh7OIaQZuG4VK8MTqJAKOnPgCFxXDTg10b4wo46MQ2lB2ePL4f6Ii3
	5N70FdVf2lsJUA7l6fgxFDu73Q5q74AUlmdUWul3i4MflnbZCY7eZZKeQhdqwc+cYIBBzHZXcgS
	YsfH6mZbaJRNnwtX0wTgGIG85q/Wia/Kg0rH1Z2a1RGZa/xEZKWr+ClzrV3yL0d0Dxx0hR/ZOjG
	UN8QOtR0nxNG3w==
X-Google-Smtp-Source: AGHT+IGOPpZaIae4HFS1C/f6cM0C4JYSNsuInmLgJR5wt85aAr3MLOMfTcOKfMs6fffvV2/D20b9UQ==
X-Received: by 2002:a05:6000:2c5:b0:386:4a16:dad7 with SMTP id ffacd0b85a97d-38c519460a0mr10280008f8f.10.1738342657681;
        Fri, 31 Jan 2025 08:57:37 -0800 (PST)
Received: from fedora ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de35csm60398925e9.10.2025.01.31.08.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:57:37 -0800 (PST)
Date: Fri, 31 Jan 2025 17:57:35 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
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
Message-ID: <Z50A_0AlcLokJ4sD@fedora>
References: <20250121-yuv-v16-5-a61f95a99432@bootlin.com>
 <20250131084111.2903-1-jose.exposito89@gmail.com>
 <Z5zJ1pEk3v-1V5Uu@louis-chauvet-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5zJ1pEk3v-1V5Uu@louis-chauvet-laptop>

On Fri, Jan 31, 2025 at 02:02:14PM +0100, Louis Chauvet wrote:
> On 31/01/25 - 09:41, José Expósito wrote:
> > Hi Louis,
> > 
> > > From: Arthur Grillo <arthurgrillo@riseup.net>
> > > 
> > > Create KUnit tests to test the conversion between YUV and RGB. Test each
> > > conversion and range combination with some common colors.
> > > 
> > > The code used to compute the expected result can be found in comment.
> > >
> > > [Louis Chauvet:
> > > - fix minor formating issues (whitespace, double line)
> > > - change expected alpha from 0x0000 to 0xffff
> > > - adapt to the new get_conversion_matrix usage
> > > - apply the changes from Arthur
> > > - move struct pixel_yuv_u8 to the test itself]
> > > 
> > > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > > Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> 
> [...]
> 
> > > +	/*
> > > +	 * colour.RGB_to_YCbCr(<rgb color in 16 bit form>,
> > > +	 *                     K=colour.WEIGHTS_YCBCR["ITU-R BT.709"],
> > > +	 *                     in_bits = 16,
> > > +	 *                     in_legal = False,
> > > +	 *                     in_int = True,
> > > +	 *                     out_bits = 8,
> > > +	 *                     out_legal = False,
> > > +	 *                     out_int = True)
> > > +	 * Test cases for conversion between YUV BT709 full range and RGB
> > > +	 * using the ITU-R BT.709 weights.
> > > +	 */
> > > +	{
> > > +		.encoding = DRM_COLOR_YCBCR_BT709,
> > > +		.range = DRM_COLOR_YCBCR_FULL_RANGE,
> > > +		.n_colors = 4,
> > 
> > If I understood correctly, "n_colors" here indicates the number of items in
> > "colors", but there is a mismatch between both lengths.
> > 
> > It also applies to the other test cases where "n_colors = 4".
> 
> I don't know how I miss it, I am 100% sure I did the exact same comment to 
> Arthur few mounth ago, thanks!
>  
> > > +		.colors = {
> > > +			{ "white", { 0xff, 0x80, 0x80 }, { 0xffff, 0xffff, 0xffff, 0xffff }},
> > > +			{ "gray",  { 0x80, 0x80, 0x80 }, { 0xffff, 0x8080, 0x8080, 0x8080 }},
> > > +			{ "black", { 0x00, 0x80, 0x80 }, { 0xffff, 0x0000, 0x0000, 0x0000 }},
> > > +			{ "red",   { 0x36, 0x63, 0xff }, { 0xffff, 0xffff, 0x0000, 0x0000 }},
> > > +			{ "green", { 0xb6, 0x1e, 0x0c }, { 0xffff, 0x0000, 0xffff, 0x0000 }},
> > > +			{ "blue",  { 0x12, 0xff, 0x74 }, { 0xffff, 0x0000, 0x0000, 0xffff }},
> > > +		},
> > > +	},
> > > +	/*
> 
> [...]
> 
> > > +/*
> > > + * vkms_format_test_yuv_u8_to_argb_u16 - Testing the conversion between YUV
> > > + * colors to ARGB colors in VKMS
> > > + *
> > > + * This test will use the functions get_conversion_matrix_to_argb_u16 and
> > > + * argb_u16_from_yuv888 to convert YUV colors (stored in
> > > + * yuv_u8_to_argb_u16_cases) into ARGB colors.
> > > + *
> > > + * The conversion between YUV and RGB is not totally reversible, so there may be
> > > + * some difference between the expected value and the result.
> > > + * In addition, there may be some rounding error as the input color is 8 bits
> > > + * and output color is 16 bits.
> > > + */
> > > +static void vkms_format_test_yuv_u8_to_argb_u16(struct kunit *test)
> > > +{
> > > +	const struct yuv_u8_to_argb_u16_case *param = test->param_value;
> > > +	struct pixel_argb_u16 argb;
> > > +
> > > +	for (size_t i = 0; i < param->n_colors; i++) {
> > > +		const struct format_pair *color = &param->colors[i];
> > > +		struct conversion_matrix matrix;
> > > +
> > > +		get_conversion_matrix_to_argb_u16
> > > +			(DRM_FORMAT_NV12, param->encoding, param->range, &matrix);
> > > +
> > > +		argb = argb_u16_from_yuv888(color->yuv.y, color->yuv.u, color->yuv.v, &matrix);
> > 
> > Running the test on ppc64 (big endian) doesn't fail. For reference:
> > 
> >   $ sudo dnf install powerpc64-linux-gnu-gcc
> >   $ sudo dnf install qemu-system-ppc64
> >   $ ./tools/testing/kunit/kunit.py run \
> >      --kunitconfig=drivers/gpu/drm/vkms/tests \
> >      --arch=powerpc --cross_compile=powerpc64-linux-gnu- \
> >      --make_options CF=-D__CHECK_ENDIAN__ \
> >      --kconfig_add CONFIG_KASAN=y \
> >      --kconfig_add CONFIG_KASAN_VMALLOC=y
> > 
> > However, I wonder if endianness is correctly handled. I always find endianness
> > difficult to reason about, but I'll try my best to explain it.
> > 
> > On a big endian architecture, color->yuv is stored in big endian. This might not
> > be an issue, because its components (y, u and v) are u8.
> > However, I think that the return value of argb_u16_from_yuv888(), which is the
> > result of argb_u16_from_u16161616(), is returned in big endian while it should
> > be little endian.
> 
> The goal of `struct argb_u16` is to hide machine-specific issues. We want 
> to be able to do addition, multiplication... without 
> `le_from_cpu`/`cpu_to_le` everywhere.
> 
> If you look at the rest of the vkms driver, we never do bit manipulation 
> on `struct argb_u16`, only mathematical operations. 
> 
> > Since you are comparing argb.a (big endian) with color->argb.a (big endian) the
> > test succedess, but in this case it should fail because, if I remember
> > correctly, colors must be stored in little endian and therefore, the color
> > returned by argb_u16_from_yuv888() should be little endian.
> 
> The colors are stored in a specific endian only in framebuffers, but in 
> our case, this is not a framebuffer. For the `argb_u16_to_ARGB16161616`, 
> you can see we use `cpu_to_le16` to store the data in the proper order.
>  
> > If you replace this 4 KUNIT_EXPECT_LE_MSG() with KUNIT_EXPECT_MEMEQ(), all test
> > will fail, but you'll notice that the buffers printed in the error log are
> > different depending on the endianness (x86_64 vs ppc64).
> > 
> > What do you think? Did I overlook the conversion?
> 
> I think yes, but thanks to make me think about it, I will steal your 
> command line to test on powerPC :)

Well, at least the command was useful :P Thanks for the explanation.
I have been looking with more detail into get_pixel_write_function()
and what you mention makes sense now.

Thanks!

> > Have a look to the tests present in drm_format_helper_test.c. They use different
> > functions (cpubuf_to_le32, le32buf_to_cpu, etc) to make sure that colors are
> > represented in little endian and that comparing the expected and actual results
> > happens in the same endian.
> 
> Those tests are testing conversion "buffer to buffer", so yes, there is 
> some endian-dependant issues.
> 
> [...]
