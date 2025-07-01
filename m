Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8516C264FA6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751358151; cv=none; b=WZBYC7V9sNlT3wGP+w55v99AfF4GM5s4FBCprSWhlw6rN/gjCL3QiFxxsqad8munP2VdLxzpGlUXU2JoBDJP1DswaX/WMoGPyv4n1wPPs+/D1ySe4BYNEhDTc9O6ZxBjArfqkJSSM+hVIGlsfwWTFj94ib5ibg4AETAZOxARvK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751358151; c=relaxed/simple;
	bh=CGvpDvM5j/bwOEQRCkUI4OYbS6nHhVG70Rau6zpqaMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcQqxv8UimG7PxQUp8Dwss+xuvTudXqdU1zRqbJ6UDxuwL7rc/6TH83oh3IkzizgJHu9FR4xx1bY02HPxh3dnSiA43B8FrYnBd18SZftTINSWYcIG9PRVdOPHnMqPRUUouEPusIQIUNY76yDbsKW6nH91IPbrQwQrwLEep+ydLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZQ8SnUty; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZQ8SnUty"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bWbcC4Hwhz9tVh;
	Tue,  1 Jul 2025 10:22:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751358139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8abd5Nv5jm00iYcLM3I0EbpnyCM02PFsqJnuhqVrqAY=;
	b=ZQ8SnUtyAzXwzDmQvmTv/mddIHgKlV8jYMNog8Vh3zbqQ4XBPdwK8u9eXW9d2v9Vn5A7Pa
	U4XKCtPc4x2qqbDJoeQXjUbNbV25ihhqlA5U3m63/qGFNsPIycLH6G4a9FpsSFRK5KhSgV
	2JPfEZDwahGqKy6Ev8OZly7qxCYPN+W7Pcx30ewQOJn077AHuKCoOoZ2LlcsjiqOgCFlf4
	xpJlBdYMsKIYKV79Cc3IotrfRxwQb8760m6UzuamXF4aTOVg8+VSoW5ks+aRXfy4oyvxo0
	n1oIa59zWEmjKZhuCBSsF2MEjVMr60+3uo03R/GK8iJCXQ6vJRSGZiD6n74ONQ==
Message-ID: <6c2e44cc-c01a-4331-b139-152ccdbd0401@mailbox.org>
Date: Tue, 1 Jul 2025 10:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drm/tests: Fix endian warning
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, cristian.ciocaltea@collabora.com,
 gcarlos@disroot.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250630090054.353246-1-jose.exposito89@gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20250630090054.353246-1-jose.exposito89@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rwysntwm1x4zea7tzcbewmpp7cygsg7y
X-MBO-RS-ID: 54a2c9e95496840bd12

On 30.06.25 11:00, José Expósito wrote:
> When compiling with sparse enabled, this warning is thrown:
> 
>   warning: incorrect type in argument 2 (different base types)
>      expected restricted __le32 const [usertype] *buf
>      got unsigned int [usertype] *[assigned] buf
> 
> Add a cast to fix it.
> 
> Fixes: 453114319699 ("drm/format-helper: Add KUnit tests for drm_fb_xrgb8888_to_xrgb2101010()")
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/tests/drm_format_helper_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
> index 7299fa8971ce..86829e1cb7f0 100644
> --- a/drivers/gpu/drm/tests/drm_format_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
> @@ -1033,7 +1033,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
>  		NULL : &result->dst_pitch;
>  
>  	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
> -	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
> +	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
>  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
>  
>  	buf = dst.vaddr; /* restore original value of buf */

It might be cleaner to use two separate variables instead of using "buf" as both little endian and host byte order. (Same for patch 2)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
