Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A1318E03A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947953; cv=none; b=fmQWIRRyBFGLw0x1+hKSlBlfVm1e92Ujsd+iSwKPMxzuWIw+oXBCCvupcz89IjVJVNh1Wr0y1NpjHGnzlE6Y8Kg6C6VN4PTp2woX2ICxVc2oeLyMf67IsZNtt1G+xx2Hqh+otNMbt4OE8Kz2hhXD1S1hju+NX7QfkeobMzxpPGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947953; c=relaxed/simple;
	bh=1Dyi+8ak7PANbAUQic/ESw+91MvIzQWAudQJQwZN0AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QMWXKSRXMO4MmD8joGRibdo9Fu5iBBtRTxZ8OqBUAqiS0q7E5klfQ5680lHx15/LvXnSHQdQNoF8KGJhpJ+RooGPG4bxm0qPju7Exc2SaRrHbOIPBYYSsGX6tJwL5GMhjbKsqiB51eFmAHtjByMGPGRVtPbBfUdxkkqudV8Ji1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G7Dj6uJb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G7Dj6uJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738947950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ulmIneXvWeKn842sM/NUdtiQkyckXgWBWcAxTArN7Vo=;
	b=G7Dj6uJbZJDCIiPrk3LtSoA8Hc8btyIVNB+I6v7UAt57RN9UszaguwOYs7MQQzC3aOEcRt
	GNgYcnp1VQLSqDIQEkB8JdGo8lDXStZ/vMxvOQ9gDdNPdkKIJe/SjHLqCfcuzZ3cmmLOm4
	LcK0ElLZXydUd9zkSgpwYrL528DzvLg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-xB08zhm4PhKQAhgxPmFiqA-1; Fri, 07 Feb 2025 12:05:48 -0500
X-MC-Unique: xB08zhm4PhKQAhgxPmFiqA-1
X-Mimecast-MFC-AGG-ID: xB08zhm4PhKQAhgxPmFiqA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38dd0265d97so268205f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947947; x=1739552747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulmIneXvWeKn842sM/NUdtiQkyckXgWBWcAxTArN7Vo=;
        b=uxxc3ZhxpdHnvedrjAXuXFHRLcgBVtVWGJXtFlmZEjlHyY8KjuNb7U3nX+uYG4PCHy
         ZG8mQmnCBnWWmeoNHZW0cFz2Md/t4Uhz++m0k/Htpf+7ThFeUezvCui318A+/tnFF0vZ
         wN+AXbw0AFlIlNYNJdbi8VsRGnsIi5M7lI316I8+TR/3H/WkfwxPc7mbnw1sRxAaeTOF
         y3D5CBPuYDJqUIjyv7add9cFq8nHRHFvfsOcrsXtpX3PM+bqVfJAuRCqm+JeO6D/67ba
         Rj+QVw1qKNXno19gLRSzep7tPxDVSqiCMfFlIoTNbLemPdmXO+g5oRIqVFGrj8utneTe
         gQFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLUJdPrqzwAF7hioZ8JnzOqVH7sDqcC1KAp+O5pMNionMviZfxYkfvBBZe6MXRiGR60mNA24O1A3ryMcI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwy3J6VPgszfxR/Tnw2xmsfk82YOvEu5d0nMalzE/iBPyx4fwJ
	Q9oJZUT2ATvna3l9QyO86G6jOhhtIldj17M3jjba2dXn95M7ItqVqZjmzrpcxqcwUv/Ft5OTQ1E
	8D4L6zFtf/SyW3Lam9PKSOO3PHTxvruYPIjdOqrA9R7RPyPFaIEGErSkcii3lwg==
X-Gm-Gg: ASbGnct1YxITOPvNI/IFpNkKr2AEd3TA9AxPGCj0Swi6NAE9/zx2DNSnlKP35liTnTr
	vtLwdXxJfkya54DSkJmQ5jr5mey3+m/E3OBcmOvAkgs+ODaJyUp/cI/a0Lbs3VbpPy69b1TRs45
	J7iT5PGcDuUAYlFAFXvkrnfcHe/y6J6MZZHncRNtxXwubH68z+36sDEbNNvUTuO69SpQ9RVZNin
	VHXTPpPR4GBoyHNB20vSuchNgDY1gT9TMOMlPdtau8bO5o2ZrCKuAxxe4R8j54A94JLl14FgC+q
	wHWQIyJgY/NSfFlNOwsELThviWOXhk8Lvk+v9DRzUgZY
X-Received: by 2002:a5d:6c6f:0:b0:38d:d0ea:b04c with SMTP id ffacd0b85a97d-38dd0eab247mr760434f8f.38.1738947947387;
        Fri, 07 Feb 2025 09:05:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUXkaH3F2I8hXAZSIfpLvryKrg2+hMGrYhKNpmj5opskHd+9X1jWEJI0aIzgAEMdsoZJPkjw==
X-Received: by 2002:a5d:6c6f:0:b0:38d:d0ea:b04c with SMTP id ffacd0b85a97d-38dd0eab247mr760352f8f.38.1738947946678;
        Fri, 07 Feb 2025 09:05:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db1150csm97455655e9.39.2025.02.07.09.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 09:05:45 -0800 (PST)
Message-ID: <56364bd9-2a6f-40f5-972c-f62898284a5c@redhat.com>
Date: Fri, 7 Feb 2025 18:05:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panic: Better binary encoding in QR code
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Thomas_B=C3=B6hler?=
 <witcher@wiredspace.de>, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250128165254.893204-1-jfalempe@redhat.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250128165254.893204-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/01/2025 17:52, Jocelyn Falempe wrote:
> The current encoding, is done by converting 13bits of input into 4
> decimal digits, that are then encoded efficiently using the numeric
> encoding of the QR code specification.
> The Fido v2.2 specification [1] uses a similar approach for its
> QR-initiated authentication. The only difference is that it converts
> 7 bytes (56bits) of input into 17 decimal digits. The benefit is that
> the algorithm doesn't require to split input bytes into 13bits chunk,
> and the ratio is a bit better.
> This improvement was proposed by Jó Ágila Bitsch in [2].
> drm_panic is still young, and the QR code feature is not widely used,
> so it's still time to switch to a common algorithm, shared with a
> widely used standard.
> I also changed the name of the url parameter, from zl= to z=, so the
> website can keep backward compatibility if needed.
> 
> [1] https://fidoalliance.org/specs/fido-v2.2-rd-20230321/fido-client-to-authenticator-protocol-v2.2-rd-20230321.html#hybrid-qr-initiated
> [2] https://github.com/kdj0c/panic_report/issues/2
> 
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

As it had no reviews for 2 months, I've got an Acked-by from Maxime 
Ripard off-list, and pushed it to drm-misc-next.

Thanks,

-- 

Jocelyn


> ---
> 
> v2:
>   * Add comments for the SegmentIterator numeric encoding.
>   
>   
>   drivers/gpu/drm/drm_panic.c     |   2 +-
>   drivers/gpu/drm/drm_panic_qr.rs | 108 +++++++++++---------------------
>   2 files changed, 36 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f128d345b16d..ab42a2b1567d 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -499,7 +499,7 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   	char *kmsg;
>   	int max_qr_data_size, url_len;
>   
> -	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&zl=",
> +	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
>   			   utsname()->machine, utsname()->release);
>   
>   	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 09500cddc009..477de4101c3e 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -13,12 +13,13 @@
>   //! The binary data must be a valid URL parameter, so the easiest way is
>   //! to use base64 encoding. But this wastes 25% of data space, so the
>   //! whole stack trace won't fit in the QR code. So instead it encodes
> -//! every 13bits of input into 4 decimal digits, and then uses the
> +//! every 7 bytes of input into 17 decimal digits, and then uses the
>   //! efficient numeric encoding, that encode 3 decimal digits into
> -//! 10bits. This makes 39bits of compressed data into 12 decimal digits,
> -//! into 40bits in the QR code, so wasting only 2.5%. And the numbers are
> +//! 10bits. This makes 168bits of compressed data into 51 decimal digits,
> +//! into 170bits in the QR code, so wasting only 1.17%. And the numbers are
>   //! valid URL parameter, so the website can do the reverse, to get the
> -//! binary data.
> +//! binary data. This is the same algorithm used by Fido v2.2 QR-initiated
> +//! authentication specification.
>   //!
>   //! Inspired by these 3 projects, all under MIT license:
>   //!
> @@ -26,7 +27,6 @@
>   //! * <https://github.com/erwanvivien/fast_qr>
>   //! * <https://github.com/bjguillot/qr>
>   
> -use core::cmp;
>   use kernel::str::CStr;
>   
>   #[derive(Debug, Clone, Copy, PartialEq, Eq, Ord, PartialOrd)]
> @@ -296,35 +296,11 @@ fn version_info(&self) -> u32 {
>   /// Padding bytes.
>   const PADDING: [u8; 2] = [236, 17];
>   
> -/// Get the next 13 bits of data, starting at specified offset (in bits).
> -fn get_next_13b(data: &[u8], offset: usize) -> Option<(u16, usize)> {
> -    if offset < data.len() * 8 {
> -        let size = cmp::min(13, data.len() * 8 - offset);
> -        let byte_off = offset / 8;
> -        let bit_off = offset % 8;
> -        // `b` is 20 at max (`bit_off` <= 7 and `size` <= 13).
> -        let b = (bit_off + size) as u16;
> -
> -        let first_byte = (data[byte_off] << bit_off >> bit_off) as u16;
> -
> -        let number = match b {
> -            0..=8 => first_byte >> (8 - b),
> -            9..=16 => (first_byte << (b - 8)) + (data[byte_off + 1] >> (16 - b)) as u16,
> -            _ => {
> -                (first_byte << (b - 8))
> -                    + ((data[byte_off + 1] as u16) << (b - 16))
> -                    + (data[byte_off + 2] >> (24 - b)) as u16
> -            }
> -        };
> -        Some((number, size))
> -    } else {
> -        None
> -    }
> -}
> -
>   /// Number of bits to encode characters in numeric mode.
>   const NUM_CHARS_BITS: [usize; 4] = [0, 4, 7, 10];
> -const POW10: [u16; 4] = [1, 10, 100, 1000];
> +/// Number of decimal digits required to encode n bytes of binary data.
> +/// eg: you need 15 decimal digits to fit 6 bytes of binary data.
> +const BYTES_TO_DIGITS: [usize; 8] = [0, 3, 5, 8, 10, 13, 15, 17];
>   
>   enum Segment<'a> {
>       Numeric(&'a [u8]),
> @@ -360,13 +336,9 @@ fn character_count(&self) -> usize {
>           match self {
>               Segment::Binary(data) => data.len(),
>               Segment::Numeric(data) => {
> -                let data_bits = data.len() * 8;
> -                let last_chars = match data_bits % 13 {
> -                    1 => 1,
> -                    k => (k + 1) / 3,
> -                };
> -                // 4 decimal numbers per 13bits + remainder.
> -                4 * (data_bits / 13) + last_chars
> +                let last_chars = BYTES_TO_DIGITS[data.len() % 7];
> +                // 17 decimal numbers per 7bytes + remainder.
> +                17 * (data.len() / 7) + last_chars
>               }
>           }
>       }
> @@ -403,7 +375,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>   struct SegmentIterator<'a> {
>       segment: &'a Segment<'a>,
>       offset: usize,
> -    carry: u16,
> +    carry: u64,
>       carry_len: usize,
>   }
>   
> @@ -422,40 +394,30 @@ fn next(&mut self) -> Option<Self::Item> {
>                   }
>               }
>               Segment::Numeric(data) => {
> -                if self.carry_len == 3 {
> -                    let out = (self.carry, NUM_CHARS_BITS[self.carry_len]);
> -                    self.carry_len = 0;
> -                    self.carry = 0;
> -                    Some(out)
> -                } else if let Some((bits, size)) = get_next_13b(data, self.offset) {
> -                    self.offset += size;
> -                    let new_chars = match size {
> -                        1 => 1,
> -                        k => (k + 1) / 3,
> -                    };
> -                    if self.carry_len + new_chars > 3 {
> -                        self.carry_len = new_chars + self.carry_len - 3;
> -                        let out = (
> -                            self.carry * POW10[new_chars - self.carry_len]
> -                                + bits / POW10[self.carry_len],
> -                            NUM_CHARS_BITS[3],
> -                        );
> -                        self.carry = bits % POW10[self.carry_len];
> -                        Some(out)
> -                    } else {
> -                        let out = (
> -                            self.carry * POW10[new_chars] + bits,
> -                            NUM_CHARS_BITS[self.carry_len + new_chars],
> -                        );
> -                        self.carry_len = 0;
> -                        Some(out)
> +                if self.carry_len < 3 && self.offset < data.len() {
> +                    // If there are less than 3 decimal digits in the carry,
> +                    // take the next 7 bytes of input, and add them to the carry.
> +                    let mut buf = [0u8; 8];
> +                    let len = 7.min(data.len() - self.offset);
> +                    buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
> +                    let chunk = u64::from_le_bytes(buf);
> +                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
> +                    self.carry = chunk + self.carry * pow;
> +                    self.offset += len;
> +                    self.carry_len += BYTES_TO_DIGITS[len];
> +                }
> +                match self.carry_len {
> +                    0 => None,
> +                    len => {
> +                        // take the next 3 decimal digits of the carry
> +                        // and return 10bits of numeric data.
> +                        let out_len = 3.min(len);
> +                        self.carry_len -= out_len;
> +                        let pow = u64::pow(10, self.carry_len as u32);
> +                        let out = (self.carry / pow) as u16;
> +                        self.carry = self.carry % pow;
> +                        Some((out, NUM_CHARS_BITS[out_len]))
>                       }
> -                } else if self.carry_len > 0 {
> -                    let out = (self.carry, NUM_CHARS_BITS[self.carry_len]);
> -                    self.carry_len = 0;
> -                    Some(out)
> -                } else {
> -                    None
>                   }
>               }
>           }
> 
> base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b

