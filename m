Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DF71DE3DB
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265166; cv=none; b=ik2Dp1trX69pvRbEJHBMVwr2IscUCuzEIUBzsxM0/DvDMlxAzmndnBe+ZqqssHGW6O3EwJtk6dG0KrYP4yqD/U/zIdcPj3GRHS2MzGaEC+r01Mm/81vXsuDw/FG/BHLoycbC3TJozDEw8Wb0wsBwmB5Gc4Ef604FDgy864mrojY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265166; c=relaxed/simple;
	bh=vZhyA16i4QBSEsNG/mrzQfpgHB+jBlz4tGq06KsD/94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNbC0Hiv88d+I5UbRBFHSy4aR6mtM1EeUZfizpdjXZeZx98F/WuZoyMgjnJGzYMZWZV7+tH1QnkSJi4S1gwuY4N0mLamEuRhNh2bcqBteTmQn2zoHeyJycvY1Mnw1Xb01oWQkBlEvHnMi/bWSae4bYQ38MD7o4O5zAv77FwJfwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KSrKYNp7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KSrKYNp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748265163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGsF0H7qCgK7/aWOj+Nk3etjewi4LnEg9nKOYPaMqno=;
	b=KSrKYNp7EilJdui/sGMacITXZj52v1J/evVB9CvHCqi8itrWugMjv3pPTU8O/qYfvKP4e1
	ppmzmatN6FOgUMkX3REHCUMgFHxocbCdPM/hUtZ6+Mci9mC6a5pjX2dkws59KqabL72ZQE
	bpKtQuPCwuIsgXCYyfZJe5n5OP4Gm3U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-BX4CmhvGNhOF7pIXtT_9nA-1; Mon, 26 May 2025 09:12:41 -0400
X-MC-Unique: BX4CmhvGNhOF7pIXtT_9nA-1
X-Mimecast-MFC-AGG-ID: BX4CmhvGNhOF7pIXtT_9nA_1748265161
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad5921edf06so258347166b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748265161; x=1748869961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGsF0H7qCgK7/aWOj+Nk3etjewi4LnEg9nKOYPaMqno=;
        b=eA3bO/sbNs/rVuIW+aT/YI0cCfm8PMN4OC2XiYhWP+3n6OYYsz4bppTzzdNJTTHgIS
         dqQxy7ZN2XOQA568tS24Bqm2hypxNvPLgN/0yX5bTLX7ucbIpdRFlXiNSLW9jySRRx7+
         +nQz2I17Lju0GtFJ6cm1haKX289zupfwGNvJqbDcdooRUa0f1AuxVGA4cpKhaYXmh66p
         cmASq2kyzUHX4uGTKeWIz5B7PuUUEDQvLjyfnHCHQvsu6fhcXn/Z0KxkozZtkB6LW8xB
         4SgE8lDOEew3N9C0tr625U4qanmazoFJCSsLJMXGovVve4Xa2QrP4mBJWA4LI8DCojQb
         Ev9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZHD6wXlqMHBYqExhjZPe6YkKRmboT9Qxf2RS9wS3oV2EjZGAeInjXNo/VC1SN5yQlrTLIAQWDduW9bI=@vger.kernel.org
X-Gm-Message-State: AOJu0YziLbDY9mzVWgl9tigsymtQWwNjZe9vv7Kh3ouya7dEZeuj1bBH
	gAlWfpnM+42lg66/PMx+5jlY6n9J5CTrWLoaIlpSb0Z1+QrLVOhA9kVTf8bkdSc2m1SFt6K3W+s
	DcKaAdz5hwvDZvtc3DNkQbsmgPQMELZ0bt9Hswk4u+9NL3mY7jldpWzQ3xvv/xGZZ8Q==
X-Gm-Gg: ASbGnct7Cj7qM1nGqZH0C9tGGiw6fiKCo8QL9ftI0418g4zdkvzECbNFvLQuMtdh1XM
	NBYl1oyMHpzrR3QFZO1yzcJsRIFWtHw+4ElOnH7CKeYGqKPA8Vh24faemiqbGKzhiZWtuZ69SHR
	7UXNqjc3O+xnu4+hizbiW9Ajiwk5htlD/yjWdpVx89j9Vccv2rDM869731gJi3z6F44H1K4zxzM
	A+kQen0Kr9bA9ovmCmD81+4YQ+uIJRofz2/ltUEPvQC6YakQ+NpRzgZ47YFsKFxH/jTDVvH/cHY
	16uMGe7/A365d9s=
X-Received: by 2002:a17:907:e98a:b0:ad5:3a7b:de91 with SMTP id a640c23a62f3a-ad85b1bfa4amr972803666b.27.1748265160507;
        Mon, 26 May 2025 06:12:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8QvnLtVJhSpJ26PCw53K12teQU0kcApIkCEK6+L/O1mhz5DN4sVNTnhfSEoC9TKB9oRBNBA==
X-Received: by 2002:a17:907:e98a:b0:ad5:3a7b:de91 with SMTP id a640c23a62f3a-ad85b1bfa4amr972799866b.27.1748265160087;
        Mon, 26 May 2025 06:12:40 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b059sm1702170766b.10.2025.05.26.06.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:12:39 -0700 (PDT)
Message-ID: <f3454fcc-ec8c-4735-8188-9f44fffa6df8@redhat.com>
Date: Mon, 26 May 2025 15:12:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] media: Documentation: Add note about UVCH length
 field
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-2-f79974fc2d20@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250404-uvc-meta-v5-2-f79974fc2d20@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Apr-25 08:37, Ricardo Ribalda wrote:
> The documentation currently describes the UVC length field as the "length
> of the rest of the block", which can be misleading. The driver limits the
> data copied to a maximum of 12 bytes.
> 
> This change adds a clarifying sentence to the documentation to make this
> restriction explicit.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> @@ -44,7 +44,9 @@ Each individual block contains the following fields:
>          them
>      * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
>      * - __u8 length;
> -      - length of the rest of the block, including this field
> +      - length of the rest of the block, including this field. Please note that
> +        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
> +        never copy more than 2-12 bytes.
>      * - __u8 flags;
>        - Flags, indicating presence of other standard UVC fields
>      * - __u8 buf[];
> 

