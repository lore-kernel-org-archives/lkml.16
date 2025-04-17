Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939AA252904
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901894; cv=none; b=VPqTcmH/WocLG5//Pbyq8Jg+QZFsRf7EiNiM6DGdtk7ZdRkpA/6xyyacEDeGse3NFExkoC+ofc0I8f0IJG4I+1D+NIGr+gyE9iSZAlQeNkIWrT3aeoMECXOd2tgivvPBEPyO7KG9o+KuBHx56NW0Y+L5i6HF9BFJo2GHUMS0d+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901894; c=relaxed/simple;
	bh=8+8dDVPsGTjvaNlBqSWhIuGS5l09fQswVeqnQK5RknA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKPUJ4HcxOrhXS5hRllRm8ScHU/jwNG3us72CoYsLb/9RyJJad3BXbB/8mQ6Y7VvYzGKdv6xy1y/w0UgxdTTSXMxEjFW/9bDWLduDDnW04D50Pxlm7QhAEiYVTPvhH10a4qdf2BNYzsX7mW09/XEIfiJuvvwOA5JPEG2KmD0Gfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ed43460d6bso1404542a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744901891; x=1745506691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CNFD08BeMzbg4hwkJS8XJhriC15vmKuRUjtQqHE0o4=;
        b=nEy07MQEItBTczLnCXRLWfFDIKSwIl8JqST66/8Qdr/PURDOtsaan/zpVoOdNJUuB8
         x5aj3aWL9k7BZQ2IhWFlWOEjQyZBCIP0cOXNDuW+fsxuzGRaBedSrcYyc3Gaa5d4LQ7L
         FVekcXd/0fHcYVLDNNHNWz1TeLzObrk6LKxUZFK3v3HAG5F6dhpUlMSccCAsliMYvdpv
         VUbpKDnpMEZzyTYDyXZwekBoBBossSV4FmbYJFSCxH64w/KWs9MZ9+SSPzmgzTVD9b4e
         ZekjXIcpsdVo47+Z5DNqqaf94F8VHemyNPsb9+Zhp3YJ+5Kyue/K0cjEkNoiTB2IV0mS
         St8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJ10iLmthPbEnO07phAiFZz4nazZD0wIlwdUvisWT+4ocgcG1IcUP5RHyZT6MHxuuUARpfbYSVITe0W0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8qjApPS8uR0h0Fa1ZuS/PiOg78w9TiD+KJ6CVC4cuLqPjAIps
	68aS7d/NVIpD82lXPyVaTXMQu6iOl5q6qk4KsaIdUABLxRUNDKJb
X-Gm-Gg: ASbGncse400O3XNDpBG4/Az0lyA6+rNgjN6AXaGdHv3Hk5FzksG2VhUW7cEb4SpzD3s
	qx7YoTjedmYSPAUI5NEfClo0XqpYQpc8zZ/PGjTdXTn9zqOO5a+MRaEa5f1TUSDyvxYduAKODBS
	+n3PVTV6Swd0I3SLIb0yREMctLgVjsLAGZgdTwToU2+UkEU7qD/1kSmtkf5ZIzWwr7ghfLQA4nd
	JYMNhLd0X4kIf8b1hnCwB6Dm0NHmByJeJPz+ww5y9BJrJ2NvIDT8W+JVsNf2OmgkFfBmUdTMwmw
	TwQ1XjHhpU1EgX0EdHktMkYW6f8HkbXv
X-Google-Smtp-Source: AGHT+IHV0hcDe3LadzqyLp2r2xBk9W9WYpfkAZzY9lBcQKTzetzjgYFoUcGBEzLpejQOhOfdVj7e+Q==
X-Received: by 2002:a17:907:1c18:b0:abf:6cc9:7ef5 with SMTP id a640c23a62f3a-acb42add32bmr608289766b.47.1744901890541;
        Thu, 17 Apr 2025 07:58:10 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:74::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec13a5bsm5275966b.27.2025.04.17.07.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:58:10 -0700 (PDT)
Date: Thu, 17 Apr 2025 07:58:08 -0700
From: Breno Leitao <leitao@debian.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Joel Becker <jlbec@evilplan.org>,
	Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
	Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v2 1/3] configfs: Delete semicolon from macro
 type_print() definition
Message-ID: <aAEXAL3ypUn4G/oe@gmail.com>
References: <20250415-fix_configfs-v2-0-fcd527dd1824@quicinc.com>
 <20250415-fix_configfs-v2-1-fcd527dd1824@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415-fix_configfs-v2-1-fcd527dd1824@quicinc.com>

On Tue, Apr 15, 2025 at 08:34:25PM +0800, Zijun Hu wrote:
> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Macro type_print() definition ends with semicolon, so will cause
> the subsequent macro invocations end with two semicolons.
> 
> Fix by deleting the semicolon from the macro definition.
> 
> Reviewed-by: Joel Becker <jlbec@evilplan.org>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  fs/configfs/dir.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/configfs/dir.c b/fs/configfs/dir.c
> index 7d10278db30d667d0ef7e1140e54961c5a440c41..0a011bdad98c492227859ff328d61aeed2071e24 100644
> --- a/fs/configfs/dir.c
> +++ b/fs/configfs/dir.c
> @@ -970,7 +970,7 @@ static void configfs_dump_one(struct configfs_dirent *sd, int level)
>  {
>  	pr_info("%*s\"%s\":\n", level, " ", configfs_get_name(sd));
>  
> -#define type_print(_type) if (sd->s_type & _type) pr_info("%*s %s\n", level, " ", #_type);
> +#define type_print(_type) if (sd->s_type & _type) pr_info("%*s %s\n", level, " ", #_type)
>  	type_print(CONFIGFS_ROOT);
>  	type_print(CONFIGFS_DIR);
>  	type_print(CONFIGFS_ITEM_ATTR);

As I've asked in V1. Is this macro being used?

--breno
