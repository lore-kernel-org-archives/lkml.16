Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7240D191F6A
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109006; cv=none; b=C9sj8ZoUyleHqyzhOyUBH+Ne/ljV2j6LI3z9XLXtZWdRywRWFUTlq4ackgbvnkzh1sa+qFcjBOjEb9WSLqdZTI9GQJI4jGh4JOHK+dHc+WkezcdZqRkKF0WnZYMJXoewQsANErEphUOWgss2ejKhn4AF3Yws3evq5wMcYPEtpho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109006; c=relaxed/simple;
	bh=j5318m9W6gx9LdmB8iOipKQED2D4klFe6dI9Bxzwyac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ktyQdmeZRBd/NVsb2LKewkjyBCVREgXF/oskMhbD16JQP8/XUWjANboPrxyAR10vpitsqD/d1NhplBe1uhPqlCey1sH0m50Zra+O7+yP5aaF0MyLlxZOXCGV7dkllR5lLyYAx0jCDDKKRe95M65JCVMj+VFg7IFq4y1GxKKYB8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PqglJWgH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PqglJWgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746109003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hh+psC7IriBNgbVFATZKlPoKU4gpMxFOg5Sx9dcAY8Y=;
	b=PqglJWgH6Ll88Mb0b1GhwygOUkUNZLeU8gMW847d+fp0WX9t+WqUARlt5KDw+gUSWrLq00
	euWbm63NE/vCDmyMyV5HX2YPmpPZMS3l3cqb7JGmhYznrPKddcEhLJ4C0WIuZmOg0i8t0z
	bC4q8EtlyXBV36KRGU8kA6yp0HCPSpg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-sF9_ZQ0rMNevXd7rBJsFJg-1; Thu, 01 May 2025 10:16:42 -0400
X-MC-Unique: sF9_ZQ0rMNevXd7rBJsFJg-1
X-Mimecast-MFC-AGG-ID: sF9_ZQ0rMNevXd7rBJsFJg_1746109001
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac6caf952d7so103529866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109001; x=1746713801;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hh+psC7IriBNgbVFATZKlPoKU4gpMxFOg5Sx9dcAY8Y=;
        b=NkpiMOtsRS1yk0S3aJNe+ibk2zvTFLOkedYwuMPGO26NnWTF/JtUld64d1gY1W4OD2
         W/i2YgvUJDtzsSK7DagKp8keoLCQ0a9I4ooznpNvzQ92PuOOHNKnbRJ/j+VsbC46sxyY
         reiQxsUD/xeQeWAmPvHw3tMZ6493A595BdYKkNTQ/pXJEDTtUy/vPkevRShs4G1vh+Fr
         8/z15fMLfw/YBw7SlblDCS5lhFLJ1IKdVFK/drzb/VUQsEr5V8gCmTQix4C5fkUeCbu5
         FIuCezCFgd6A0KsAjQYKtD8pck0x959Y6AbVyLHngJbwpfhsyruFH5qqGzfiCR7Dc/1S
         PAyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYDO0fXs4rsH6QkqqGyuKO/RFgV0S5SUy2IP9IlVuRU8zfxlMh5+6shRru4zD2mi5nzY9BWy5K/UXxn8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZivf6+SM9Df4clF4aPRYxFMpfJWrBTgkV0qms3JiBVfIpkVOl
	3dVlHPtW4ZQ8l+7cmDTR3lmvUbHdAJpEgrkMFdwYWtz5RRdlmkMYlxlQPVtyG+Mfd3YMLS4rX4M
	b0Wilos1WPuQ4hneC+2GTH1tEJHEeQQmks9S3kapcLS38K7ZZqaApUAUTm1XUmw==
X-Gm-Gg: ASbGncvgl2C54Ay+EmqLsosFNKAoGqLuRfFNtEJ63hEcw3NJ4W1ruL8BAuHcWPglg+t
	yRdIqySA9roy+nVGbFVjKpGwpTW3lPKTInZsn+NMom3wGcNWiBvBin/jsd+syT3+qNsE23Pg/V9
	9ihTS6dd0EyrF21qhziGplHIZz8hCiqpQbqASFSdltuMLl14aJx5UPSEP5dVFH3yK7fraFr2e9o
	rJD278z9gzmLmAZNCmxHdznp73ISbTfxgTBNAEjYknOxurv6frrHbh4MAhA1/gT8ZUiEpuuy1oh
	kgX4FxVoRmSZDO9lI2ajzULvXWhiA91mJfs7CEeqIdI5KAci3Ty+gTRhLdUoXrNJBa+aoTvTL3x
	Lz5UDNZxik28F1v7W+ILFmN4o8RNDiXqsrNvEcswtzO6Mt11wBHSndZWcI4Ndbg==
X-Received: by 2002:a17:907:3da8:b0:ace:dd27:7c68 with SMTP id a640c23a62f3a-acef49a523amr286268966b.46.1746109000784;
        Thu, 01 May 2025 07:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERxZ6UQgY7nJnQihqgXO4g35TCN9e9LK+eXe6+W9Ewkl+z5FgYaucMhPyRZQ4ao8P7tj61SQ==
X-Received: by 2002:a17:907:3da8:b0:ace:dd27:7c68 with SMTP id a640c23a62f3a-acef49a523amr286267266b.46.1746109000405;
        Thu, 01 May 2025 07:16:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da516a9dsm45118166b.122.2025.05.01.07.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:16:39 -0700 (PDT)
Message-ID: <4200c8b5-ec1b-49f4-b530-9067b1dc22c2@redhat.com>
Date: Thu, 1 May 2025 16:16:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] staging: media: Remove duplicate NULL tests on a
 value in pci
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
 outreachy@lists.linux.dev, julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, andy@kernel.org, mchehab@kernel.org,
 sakari.ailus@linux.intel.com
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
 <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3-Apr-25 3:26 PM, Abraham Samuel Adekunle wrote:
> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned NULL.
> 
> Remove unnecessary duplicate NULL tests on the same value that
> has previously been NULL tested.
> 
> Found by Coccinelle
> 
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index e176483df301..0abac820299a 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1292,7 +1292,7 @@ static int gmin_get_config_dsm_var(struct device *dev,
>  	 * if it founds something different than string, letting it
>  	 * to fall back to the old code.
>  	 */
> -	if (cur && cur->type != ACPI_TYPE_STRING) {
> +	if (cur->type != ACPI_TYPE_STRING) {
>  		dev_info(dev, "found non-string _DSM entry for '%s'\n", var);
>  		ACPI_FREE(obj);
>  		return -EINVAL;

