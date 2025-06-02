Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4262F1C7008
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748879023; cv=none; b=nfrtZLa6E/6Vh/HgL7pcg75c1/Vvq4Iu9K7N4iZaAy5ukgp9wk8xsHhROQt+UXHpNxeXu9rQ+3jalzTyEf5HOEsHE1EDKglzjGiYA3yvvZIQ1BL6THNPmbmZa61J/EPwgSUkWByZkASiUb9O0P6g8cKlT2p2bB0kBx8c/RYdxdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748879023; c=relaxed/simple;
	bh=vnDj3LDoE6fvOnpQxqV5cUhV0MzIRWUbuJRW8FXHgy0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RIQ4yH6ql5A/Bc1ndwkJuXFgoerUaytA/7pbL6Xuu3xFOtly4LKKfSYm2QNc6g20yjOfaIRe5erztCFWrO6mx58UL5k/rLPNSor6+xOyLIQx6RRe7/cOtBi4nQT5U81FUJryHvlS28prL01ui3ygVGHhfcu6k/VRZgvoZQEwpLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gL43YtlG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gL43YtlG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748879020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oEnNPOQQYinKhtyFPbtNahXJ+hfo2zYwElH9phszy/s=;
	b=gL43YtlGSVLnnYVWPw8zMfZuvurFG1mf6MaZzuhRvERrny183Ysjv6aJFEzXOZEAa/urkg
	Y3pltDpqe4Q8zZHTWtoIRkCwJsF9cSveB+p6Wgbgw3R/La9+snTLKi6JWt4ErFG0mYV1Ty
	AupSD5uby51Eh9HsVPKbjLf/673yzs8=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-AnoYZxCgMfqZmoZAQcXpSw-1; Mon, 02 Jun 2025 11:43:38 -0400
X-MC-Unique: AnoYZxCgMfqZmoZAQcXpSw-1
X-Mimecast-MFC-AGG-ID: AnoYZxCgMfqZmoZAQcXpSw_1748879018
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-8617c4a3d0dso28957339f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 08:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748879018; x=1749483818;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oEnNPOQQYinKhtyFPbtNahXJ+hfo2zYwElH9phszy/s=;
        b=qeFmVtC36mhWKmNKK/gu/IWv3Lz0+uRySLX65jP8kkPR50Fzh3xisv/V53H7VCdDS1
         SJ8q163twauVbBVZjba0Bypo81ajJpTU+L6FtELEI7CWjyA58fJXgVxzGDbE6lP2Pff9
         GSr5+7rsjrwv9FZnqZUT76Q3jpUXmwEVZ2V6GwETwiSg9fj/6mnF2LHoetH60pJgyXf3
         HygJcmFsBheg7nxUN7+XlQravWcChE+WUxAP6GlF4qZ1KzGVbguZGlpK+uAc4/Tnygqw
         XO0so78BdOEeEMO89bPd4a5vi3zWySxAfVvzOvdaZtXiZ7FUFaZGRwABgd38vzbk+G2v
         Ui9g==
X-Forwarded-Encrypted: i=1; AJvYcCWvodAvzFigFpNtQfDCnkGOdBtzNxP0uH+2HZWoxXhYFh/uUbIVj6aNcNz/218NiScTCOwlmsolMdk3o4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXAwYnd54TtBf0bAoN4V7rsQLYgVPBpnN3PWQfcZgM76f67ZZi
	ttEaAqwslwyBtRtR1foSNK2aka3xwjWyq8ZSv/hFeoKa6aWQUiMaJcV92i6JCR+v2J1jWkznFvN
	nyNOu5HXSEtxQiYH97S+bL71oNbRFk0gxUWj1L0YW3D0mEmkA5PsWPiZnkGO8dGVfGw==
X-Gm-Gg: ASbGncuvciVUMT/SLZcVLaNtOeGHWsKWvho4hgq/xD6JiJ6V3PVRXkyXgmieO/w7ayy
	AJS3ao3ngpuvhl4niRG5ndJsWf8V1mRjLVt+ObjYw/hrAetLbRyqgksB0OkCKRsqVVDessYzdom
	sEJbJ6PuwBo3VFDUSVEiqcHB532os3gcmHXxSplcLJakTJvpjZdwjlUZsxMnXdqWnN3Hl6a/7JV
	brR8E5Nlb9gT/1OjfeICeZ0Wo6ErD/uqiuJ0iQvZzah9ToYCiMZE4j+ZVfHUr7cKuUBiHS9YPdn
	+oivcsOfDgRCXME=
X-Received: by 2002:a05:6602:1507:b0:85b:3f28:ff99 with SMTP id ca18e2360f4ac-86d025f5633mr430893839f.2.1748879017931;
        Mon, 02 Jun 2025 08:43:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxt5m7iXx5A9r4eTEAWC0Vws511DwnI/2T8V+mtgy7cCEIe9lBpfzRQFP+WGCTj9UR0FmfLg==
X-Received: by 2002:a05:6602:1507:b0:85b:3f28:ff99 with SMTP id ca18e2360f4ac-86d025f5633mr430892039f.2.1748879017486;
        Mon, 02 Jun 2025 08:43:37 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7dfe4a5sm1808088173.16.2025.06.02.08.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:43:36 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:43:34 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: Kirti Wankhede <kwankhede@nvidia.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, KVM ML <kvm@vger.kernel.org>, KERNEL ML
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] samples: vfio-mdev: mtty.c: delete MODULE_VERSION
Message-ID: <20250602094334.4995ea23.alex.williamson@redhat.com>
In-Reply-To: <20250531161836.102346-1-xose.vazquez@gmail.com>
References: <20250531161836.102346-1-xose.vazquez@gmail.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 31 May 2025 18:18:36 +0200
Xose Vazquez Perez <xose.vazquez@gmail.com> wrote:

> Reminiscence of ancient times when modules were developed outside the kernel.

s/Reminiscence/Reminiscent/

I think there are likely better arguments that could be made for
removal though, ex. citing specific policies or discussions.

> Cc: Kirti Wankhede <kwankhede@nvidia.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: KVM ML <kvm@vger.kernel.org>
> Cc: KERNEL ML <linux-kernel@vger.kernel.org>

Signed-off-by?

See Developer's Certificate of Origin:
Documentation/process/submitting-patches.rst

Thanks,
Alex

> ---
>  samples/vfio-mdev/mtty.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
> index 59eefe2fed10..f9f7472516c9 100644
> --- a/samples/vfio-mdev/mtty.c
> +++ b/samples/vfio-mdev/mtty.c
> @@ -35,7 +35,6 @@
>   * #defines
>   */
>  
> -#define VERSION_STRING  "0.1"
>  #define DRIVER_AUTHOR   "NVIDIA Corporation"
>  
>  #define MTTY_CLASS_NAME "mtty"
> @@ -2057,5 +2056,4 @@ module_exit(mtty_dev_exit)
>  
>  MODULE_LICENSE("GPL v2");
>  MODULE_DESCRIPTION("Test driver that simulate serial port over PCI");
> -MODULE_VERSION(VERSION_STRING);
>  MODULE_AUTHOR(DRIVER_AUTHOR);

