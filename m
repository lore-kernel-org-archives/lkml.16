Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EA01ADC69
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744356067; cv=none; b=ZXZiTsCFAeSjNrAYe9naw+g2Kle7a4aLluamNq/3fGeYPZx4LOOnbQ0lHVu8kNWhJsp604AnmGTUXw6CXVbTaBR4EOBBCN9yDdoz66kjtCy6TNhIxmReqO/jKKJ9zxNlwT5Nbq2xINaxXGVG88kFfr+FHx147y+VSAIxVfOvEOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744356067; c=relaxed/simple;
	bh=tfY0+aiphqwjINKWSldhfBgZGc6Bs+gu2iidj5ZXeew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaEia8AorAXCHixY0ymSY2/C80WTxkSvjsIns2HVSGOru1J3Wja1Yzu5FtshrSikDexSVtFlOqjCzBQyvP/lsccmiPGmDu8OR+LmHYWtEs5LJlZ1I7kG5CpxlveH3/7PkhQyELiv0GYJdPd4c0XnpPyYPes+wy5m9Q/uJuFgBQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kl5wWprz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kl5wWprz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744356063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gU+hARZZfkB6r2YbUGlr1S1PdLPrDG1XB/07xKaVaWg=;
	b=Kl5wWprzx4GotgHjVuqX3FRjqgSCgSN2+mV0gdEjO5uwwGwwg1OaB76Oq76Beq1fZnIPQC
	c8SZbbTFrbF2/M1GVZQ/ozd16x2c7q6a3gOLMNhu9Ylgniy3q+QVjuWQNOBe00znbGSDaX
	p4mUuQj0UQyRwJ+AHi+YJwT3nYYOQIE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-u9Q63wI9MtGkzrklnm8rBQ-1; Fri, 11 Apr 2025 03:21:02 -0400
X-MC-Unique: u9Q63wI9MtGkzrklnm8rBQ-1
X-Mimecast-MFC-AGG-ID: u9Q63wI9MtGkzrklnm8rBQ_1744356061
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39130f02631so637108f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744356061; x=1744960861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gU+hARZZfkB6r2YbUGlr1S1PdLPrDG1XB/07xKaVaWg=;
        b=djJisRNPjwaumoWugEPN/WxXMJLx2EIsnojR1MmaBGuaVMB4WibtFurhtB8rvnukJE
         hlcyPBQueA8hZPMUuuJnPi6RtlPw2yogm2D0q4f0Hkc/+CxvIatv2kTd3S5PKAC3SdKF
         XkXzG/BjQApTO5EaF4JeaVfn4bLQxGvzv6LTtwnUDbQYfJ4PhrkKXs4+q8oiXcZRdiOG
         9YmNucoJwoICouJ1pZpiV9ofPlKnMLIIUfcgVW3ncyijLwKRVbsJnJGZ1hKzyNvZsLfa
         /b464xB3OBCzjfmfLNA55QLjtF7uXhD19RB6JvH8MeSmfpahnO9VRY7EumY1qUPj3jau
         l2yg==
X-Forwarded-Encrypted: i=1; AJvYcCUKkUOVLc1SvB/l/kXCCZtf6L3jLVDsfBzKDR1pJ9Zx87W8lnrs5MZLr4e8SHWu/60rInkndEuHDAQMb6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrpsZZIFDXph+PqpAaWrUd1HV9AQMHeCpCMrMRUXKyGyHAhCk2
	nJj7nqYifTNRpeey1VUsffNU+k1kRt6c38Mfa29IjvPOMmWMNp24fNmvPK1FSgG8OsuOzGWrgUu
	7YuqJ4p0lBpdBDG7Z6O3VBAn7T0JBKxb0LZGRoA1N8HgqKMbLaCkgSoBY8vdziw==
X-Gm-Gg: ASbGncs2fUNWTa1vsgz1YUdV9p7IHtznDBGNqF9lbgVyT9VsUWB+MU7QMhV2/zVNgjI
	sbxkIO9yWjUGFPi+wOWcBKkUnPcPwOLRwxhKazW/ECEkPvlNC6SSxEodZxt2V6StI0R0lSI/JYg
	SS/VNaTxC0QRCUMJdY1aYs3HY/MtvTnp1oSBz2K9p06JQx8CS8LhmjLAZI+TO/Gu83OcnTbEVzE
	a6kookQlPt1IxjBXEq9rBFYG2SLBl8GLKYaWBNsuqYIUwbXCI7Al4vvBRwS4T54o17TkWNUTpqN
	KCnzqQQJsVDIBARr2CS+Q49fNsqRDU1X1YahMzY9X87SaDYGdhcSOCfxIM8R
X-Received: by 2002:a5d:6da5:0:b0:397:3900:ef8c with SMTP id ffacd0b85a97d-39eaaeaa1aemr1401791f8f.35.1744356061098;
        Fri, 11 Apr 2025 00:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2jtPdv16xG1nJWEPcEfUEGfKBbRody2tYk5FP7adbLH4loS3sGojYe46GWuT4PaxDCOT5bQ==
X-Received: by 2002:a5d:6da5:0:b0:397:3900:ef8c with SMTP id ffacd0b85a97d-39eaaeaa1aemr1401756f8f.35.1744356060639;
        Fri, 11 Apr 2025 00:21:00 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cf42sm1146799f8f.64.2025.04.11.00.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:20:59 -0700 (PDT)
Date: Fri, 11 Apr 2025 09:20:57 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca, 
	linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] char: tpm: tpm-buf: Add sanity check fallback in read
 helpers
Message-ID: <6w3lsskngim3x6lx7akwfly3hrrzxyi4pq4itwyye3rywlqum7@oiwkjmvtawl7>
References: <20250410103442.17746-1-purvayeshi550@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250410103442.17746-1-purvayeshi550@gmail.com>

On Thu, Apr 10, 2025 at 04:04:42PM +0530, Purva Yeshi wrote:
>Fix Smatch-detected issue:
>
>drivers/char/tpm/tpm-buf.c:208 tpm_buf_read_u8() error:
>uninitialized symbol 'value'.
>drivers/char/tpm/tpm-buf.c:225 tpm_buf_read_u16() error:
>uninitialized symbol 'value'.
>drivers/char/tpm/tpm-buf.c:242 tpm_buf_read_u32() error:
>uninitialized symbol 'value'.
>
>Zero-initialize the return values in tpm_buf_read_u8(),
>tpm_buf_read_u16(), and tpm_buf_read_u32() to guard against
>uninitialized data in case of a boundary overflow.
>
>Add defensive initialization ensures the return values are
>always defined, preventing undefined behavior if the unexpected
>happens.
>
>Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
>---
>V1 - https://lore.kernel.org/all/20250409205536.210202-1-purvayeshi550@gmail.com/
>V2 - Update commit message to clarify patch adds a sanity check

LGTM!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
> drivers/char/tpm/tpm-buf.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/char/tpm/tpm-buf.c b/drivers/char/tpm/tpm-buf.c
>index e49a19fea3bd..dc882fc9fa9e 100644
>--- a/drivers/char/tpm/tpm-buf.c
>+++ b/drivers/char/tpm/tpm-buf.c
>@@ -201,7 +201,7 @@ static void tpm_buf_read(struct tpm_buf *buf, off_t *offset, size_t count, void
>  */
> u8 tpm_buf_read_u8(struct tpm_buf *buf, off_t *offset)
> {
>-	u8 value;
>+	u8 value = 0;
>
> 	tpm_buf_read(buf, offset, sizeof(value), &value);
>
>@@ -218,7 +218,7 @@ EXPORT_SYMBOL_GPL(tpm_buf_read_u8);
>  */
> u16 tpm_buf_read_u16(struct tpm_buf *buf, off_t *offset)
> {
>-	u16 value;
>+	u16 value = 0;
>
> 	tpm_buf_read(buf, offset, sizeof(value), &value);
>
>@@ -235,7 +235,7 @@ EXPORT_SYMBOL_GPL(tpm_buf_read_u16);
>  */
> u32 tpm_buf_read_u32(struct tpm_buf *buf, off_t *offset)
> {
>-	u32 value;
>+	u32 value = 0;
>
> 	tpm_buf_read(buf, offset, sizeof(value), &value);
>
>-- 
>2.34.1
>
>

